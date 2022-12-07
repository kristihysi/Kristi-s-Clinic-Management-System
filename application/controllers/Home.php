<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends Frontend_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('email_model');
        $this->load->model('smsmanager_model');
        $this->load->model('home_model');
    }

    public function index()
    {
        $this->home();
    }

    public function home()
    {
        $this->data['page_data'] = $this->home_model->get_list('front_cms_home_seo', array('id' => 1), true);
        $this->data['main_contents'] = $this->load->view('home/index', $this->data, true);
        $this->load->view('home/layout/index', $this->data);
    }

    public function about()
    {
        $this->data['page_data'] = $this->home_model->get_list('front_cms_about', array('id' => 1), true);
        $this->data['main_contents'] = $this->load->view('home/about', $this->data, true);
        $this->load->view('home/layout/index', $this->data);
    }

    public function faq()
    {
        $this->data['page_data'] = $this->home_model->get_list('front_cms_faq', array('id' => 1), true);
        $this->data['main_contents'] = $this->load->view('home/faq', $this->data, true);
        $this->load->view('home/layout/index', $this->data);
    }

    public function doctors()
    {
        $this->data['page_data'] = $this->home_model->get_list('front_cms_doctors', array('id' => 1), true);
        $this->data['departments'] = $this->home_model->get_doctor_departments();
        $this->data['doctor_list'] = $this->home_model->get_doctor_list();
        $this->data['main_contents'] = $this->load->view('home/doctors', $this->data, true);
        $this->load->view('home/layout/index', $this->data);
    }

    public function doctor_profile($id = '')
    {
        if (empty($id)) {
            redirect(base_url('home'));
        }
        $this->data['page_data'] = $this->home_model->get_list('front_cms_doctors', array('id' => 2), true);
        $this->data['doctor'] = $this->home_model->get_doctor_profile($id);
        $this->data['main_contents'] = $this->load->view('home/doctor_profile', $this->data, true);
        $this->load->view('home/layout/index', $this->data);
    }

    public function appointment($doctor_id = '')
    {
        $captcha = $this->data['cms_setting']['captcha_status'];
        if ($captcha == 'enable') {
            $this->load->library('recaptcha');
            $this->data['recaptcha'] = array(
                'widget' => $this->recaptcha->getWidget(),
                'script' => $this->recaptcha->getScriptTag(),
            );
        }
        $this->data['active_tab'] = 1;
        $this->data['doctor_id'] = $doctor_id;
        $this->data['today'] = date('Y-m-d');
        if ($this->input->post('new_patient')) {
            $this->form_validation->set_rules('new_patient_name', 'Patient Name', 'trim|required|xss_clean');
            $this->form_validation->set_rules('new_patient_gender', 'Patient Gender', 'trim|required|xss_clean');
            $this->form_validation->set_rules('birthday', 'Patient Birthday', 'trim|required|xss_clean');
            $this->form_validation->set_rules('new_patient_email', 'Patient Email', 'trim|required|xss_clean|valid_email');
            $this->form_validation->set_rules('new_patient_phone', 'Patient Phone', 'trim|required|xss_clean');
            $this->form_validation->set_rules('new_username', 'Username', 'trim|required|xss_clean|callback_unique_username');
            $this->form_validation->set_rules('new_password', 'Password', 'required|xss_clean|min_length[4]');
            $this->form_validation->set_rules('new_appointment_date', 'Appointment Date', 'trim|required|xss_clean');
            $this->form_validation->set_rules('new_doctor_id', 'Doctor', 'trim|required|xss_clean');
            $this->form_validation->set_rules('new_time_slots', 'Time Slots', 'trim|required|xss_clean');
            $this->form_validation->set_rules('new_message', 'Message', 'trim|required|xss_clean');
            if ($captcha == 'enable') {
                $this->form_validation->set_rules('g-recaptcha-response', 'Captcha', 'trim|required');
            }
            if ($this->form_validation->run() == false) {
                $this->data['active_tab'] = 1;
            } else {
                if ($captcha == 'enable') {
                    $captchaResponse = $this->recaptcha->verifyResponse($this->input->post('g-recaptcha-response'));
                }else{
                    $captchaResponse = array('success' => true);
                }
                if ($captchaResponse['success'] == true) {
                    // save data into table
                    $this->home_model->appointment_save_new($this->input->post());
                    $success = 'Appointment requested successfully. You can track your requests status at Login to your account.';
                    $this->session->set_flashdata('success', $success);
                    redirect(base_url('home/appointment'));
                } else {
                    $error = 'Captcha is invalid';
                    $this->session->set_flashdata('error', $error);
                    redirect(base_url('home/appointment'));
                }
            }
        }

        if ($this->input->post('old_patient')) {
            $this->form_validation->set_rules('patient_id', 'Patient ID', 'trim|required|xss_clean|callback_check_valid_patient_id');
            $this->form_validation->set_rules('old_appointment_date', 'Appointment Date', 'trim|required|xss_clean');
            $this->form_validation->set_rules('old_doctor_id', 'Doctor', 'trim|required|xss_clean');
            $this->form_validation->set_rules('old_time_slots', 'Time Slots', 'trim|required|xss_clean');
            $this->form_validation->set_rules('old_message', 'Message', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['active_tab'] = 2;
            } else {
                // save data into table
                $this->home_model->appointment_save_old($this->input->post());
                $success = 'Appointment requested successfully. You can track your requests status at Login to your account.';
                $this->session->set_flashdata('success', $success);
                redirect(base_url('home/appointment'));
            }
        }

        $this->data['page_data'] = $this->home_model->get_list('front_cms_appointment', array('id' => 1), true);
        $this->data['main_contents'] = $this->load->view('home/appointment', $this->data, true);
        $this->load->view('home/layout/index', $this->data);
    }

    public function contact()
    {
        $captcha = $this->data['cms_setting']['captcha_status'];
        if ($captcha == 'enable') {
            $this->load->library('recaptcha');
            $this->data['recaptcha'] = array(
                'widget' => $this->recaptcha->getWidget(),
                'script' => $this->recaptcha->getScriptTag(),
            );
        }

        if ($_POST) {
            $this->form_validation->set_rules('name', 'Name', 'trim|required');
            $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
            $this->form_validation->set_rules('phoneno', 'Phone', 'trim|required');
            $this->form_validation->set_rules('subject', 'Subject', 'trim|required');
            $this->form_validation->set_rules('message', 'Message', 'trim|required');
            if ($captcha == 'enable') {
                $this->form_validation->set_rules('g-recaptcha-response', 'Captcha', 'trim|required');
            }
            if ($this->form_validation->run() !== false) {
                if ($captcha == 'enable') {
                    $captchaResponse = $this->recaptcha->verifyResponse($this->input->post('g-recaptcha-response'));
                }else{
                    $captchaResponse = array('success' => true);
                }
                if ($captchaResponse['success'] == true) {
                    $name = $this->input->post('name');
                    $email = $this->input->post('email');
                    $phoneno = $this->input->post('phoneno');
                    $subject = $this->input->post('subject');
                    $message = $this->input->post('message');
                    $msg = '<h3>Sender Information</h3>';
                    $msg .= '<br><br><b>Name: </b> ' . $name;
                    $msg .= '<br><br><b>Email: </b> ' . $email;
                    $msg .= '<br><br><b>Phone: </b> ' . $phoneno;
                    $msg .= '<br><br><b>Subject: </b> ' . $subject;
                    $msg .= '<br><br><b>Message: </b> ' . $message;
                    $emailsetting = $this->db->get_where('email_config', array('id' => 1))->row();
                    if ($emailsetting->email_protocol == 'smtp') {
                        $config = array(
                            'smtp_host' => $emailsetting->smtp_host,
                            'smtp_port' => $emailsetting->smtp_port,
                            'smtp_user' => $emailsetting->smtp_user,
                            'smtp_pass' => $emailsetting->smtp_pass,
                            'smtp_crypto' => $emailsetting->smtp_encryption,
                        );
                    }
                    $config['protocol'] = $emailsetting->email_protocol;
                    $config['mailtype'] = "html";
                    $config['newline'] = "\r\n";
                    $config['charset'] = 'utf-8';
                    $this->load->library('email', $config);
                    $this->email->from($emailsetting->email);
                    $this->email->to($this->data['cms_setting']['receive_contact_email']);
                    $this->email->reply_to($email, $name);
                    $this->email->subject('Contact Form Email');
                    $this->email->message($msg);
                    if ($this->email->send()) {
                        $this->session->set_flashdata('msg_success', 'Message Successfully Sent. We will contact you shortly.');
                    } else {
                        $this->session->set_flashdata('msg_error', $this->email->print_debugger());
                    }
                } else {
                    $error = 'Captcha is invalid';
                    $this->session->set_flashdata('error', $error);
                }
                redirect(base_url('home/contact'));
            }
        }
        $this->data['page_data'] = $this->home_model->get_list('front_cms_contact', array('id' => 1), true);
        $this->data['main_contents'] = $this->load->view('home/contact', $this->data, true);
        $this->load->view('home/layout/index', $this->data);
    }

    public function page()
    {
        $url = $this->uri->segment(3);
        $this->db->select('front_cms_menu.title as menu_title,front_cms_menu.alias,front_cms_pages.*');
        $this->db->from('front_cms_menu');
        $this->db->join('front_cms_pages', 'front_cms_pages.menu_id = front_cms_menu.id', 'inner');
        $this->db->where('front_cms_menu.alias', $url);
        $this->db->where('front_cms_menu.publish', 1);
        $getData = $this->db->get()->row_array();
        if (empty($getData)) {
            redirect ('404_override');
        }
        $this->data['page_data'] =  $getData;
        $this->data['active_menu'] = 'page';
        $this->data['main_contents'] = $this->load->view('home/page', $this->data, true);
        $this->load->view('home/layout/index', $this->data);
    }
	
	public function show_404()
	{
		$this->load->view('errors/error_404_message');
	}

    // unique valid username verification is done here
    public function unique_username($username)
    {
        if ($this->input->post('patient_id')) {
            $patient_id = $this->input->post('patient_id');
            $login_id = $this->app_lib->get_credential_id($patient_id, false);
            $this->db->where_not_in('id', $login_id);
        }
        $this->db->where('username', $username);
        $query = $this->db->get('login_credential');
        if ($query->num_rows() > 0) {
            $this->form_validation->set_message("unique_username", translate('username_has_already_been_used'));
            return false;
        } else {
            return true;
        }
    }

    public function check_valid_patient_id($id)
    {
        $exist = $this->db->select('id')->where('patient_id', $id)->get('patient')->num_rows();
        if ($exist > 0) {
            return true;
        } else {
            $this->form_validation->set_message('check_valid_patient_id', 'Patient ID not found.');
            return false;
        }
    }

    public function getAppointmentSchedule()
    {
        $appointment_id = (isset($_POST['appointment_id']) ? $_POST['appointment_id'] : "");
        $schedule_id = (isset($_POST['schedule_id']) ? $_POST['schedule_id'] : 0);
        $doctor_id = $this->input->post('doctor_id');
        $date = date('Y-m-d', strtotime($this->input->post('appointment_date')));
        $nameOfDay = date('l', strtotime($date));
        $query = $this->db->where(array('doctor_id' => $doctor_id, 'day' => $nameOfDay))->get('schedule');
        if ($query->num_rows() > 0) {
            $count = 1;
            $srow = $query->row_array();
            $per_time = $srow['per_patient_time'];
            $min = $per_time * 60;
            $start = strtotime($srow['time_start']);
            $end = strtotime($srow['time_end']) - $per_time;
            $html = "<option value=''>" . translate('select') . "</option>";
            for ($i = $start; $i <= $end; $i = $i + $min) {
                $cID = $count++;
                if ($appointment_id != "") {
                    $this->db->where_not_in('id', $appointment_id);
                }

                $this->db->where_in('status', array(1, 2));
                $this->db->where(array('doctor_id' => $doctor_id, 'appointment_date' => $date, 'schedule' => $cID));
                $exist = $this->db->get('appointment')->num_rows();
                if ($exist > 0) {
                    continue;
                }

                $sel = ($cID == $schedule_id ? 'selected' : '');
                $html .= "<option value='" . $cID . "' " . $sel . ">" . date('h:i A', $i) . ' - ' . date('h:i A', $i + $min) . "</option>";
            }
        } else {
            $html = "<option value=''>" . translate('no_schedule_found') . "</option>";
        }
        echo $html;
    }
}
