<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Install extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('install_model', '_install');

        if ($this->config->item('installed')) {
            redirect(site_url('authentication'));
        }
    }

    public function index()
    {
        $this->data['step'] = 1;
        if ($_POST) {
            if ($this->input->post('step') == 2) {
                $this->data['step'] = 2;
            }

            if ($this->input->post('step') == 3) {
                $this->data['step'] = 2;
                // Validating the hostname, the database name and the username. The password is optional
                $this->form_validation->set_rules('hostname', 'Hostname', 'trim|required');
                $this->form_validation->set_rules('database', 'Database', 'trim|required');
                $this->form_validation->set_rules('username', 'Username', 'trim|required');
                if ($this->form_validation->run() == true) {
                    $hostname = $this->input->post('hostname');
                    $username = $this->input->post('username');
                    $password = $this->input->post('password');
                    $database = $this->input->post('database');
                    // Connect to the database
                    $link = mysqli_connect($hostname, $username, $password, $database);
                    if (!$link) {
                        $this->data['mysql_error'] = "Error: Unable to connect to MySQL Database." . PHP_EOL;
                    } else {
                        // Write the new database.php file
                        if ($this->_install->write_database_config($this->input->post())) {
                            $this->data['step'] = 3;
                        }
                        // Close the connection
                        mysqli_close($link);
                    }
                }
            }

            if ($this->input->post('step') == 4) {
                // Validating the diagnostic name, superadmin name, superadmin email, login username, login password
                $this->form_validation->set_rules('diagnostic_name', 'Diagnostic Name', 'trim|required');
                $this->form_validation->set_rules('sa_name', 'Superadmin Name', 'trim|required');
                $this->form_validation->set_rules('sa_email', 'Superadmin Email', 'trim|required|valid_email');
                $this->form_validation->set_rules('sa_username', 'Login Username', 'trim|required');
                $this->form_validation->set_rules('sa_password', 'Login Password', 'trim|required');
                if ($this->form_validation->run() == true) {
                    $encryption_key = bin2hex(substr(md5(rand()), 0, 10));
                    $staff_id = substr(md5(rand() . microtime() . time() . uniqid()), 3, 7);
                    // Open the default SQL file
                    $database = read_file('./uploads/install/database.sql');
                    $this->load->database();
                    // Execute a multi query
                    if (mysqli_multi_query($this->db->conn_id, $database)) {
                        $this->_install->clean_up_db_query();
                        $diagnostic_name = $this->input->post('diagnostic_name');
                        $name = $this->input->post('sa_name');
                        $email = $this->input->post('sa_email');
                        $username = $this->input->post('sa_username');
                        $password = $this->input->post('sa_password');
                        // Superadmin add in the database
                        $staff_data = array(
                            'staff_id' => $staff_id,
                            'name' => $name,
                            'joining_date' => date('Y-m-d'),
                            'email' => $email,
                        );
                        $this->db->insert('staff', $staff_data);
                        $insert_id = $this->db->insert_id();

                        // Save superadmin login credential information in the database
                        $credential_data = array(
                            'user_id' => $insert_id,
                            'username' => $username,
                            'password' => $this->_install->pass_hashed($password),
                            'role' => 1,
                            'active' => 1,
                        );

                        if ($this->db->insert('login_credential', $credential_data)) {
                            // global settings DB update
                            $this->db->where('id', 1);
                            $this->db->update('global_settings', array('institute_name' => $diagnostic_name));
                            // Write the new autoload.php file
                            $this->_install->update_autoload_installed();
                            // Write the new routes.php file
                            $this->_install->write_routes_config();
                            $this->_install->update_config_installed($encryption_key);
                        }
                    }
                    $this->data['step'] = 4;
                } else {
                    $this->data['step'] = 3;
                }
            }
        }
        $this->load->view('install/index', $this->data);
    }
}
