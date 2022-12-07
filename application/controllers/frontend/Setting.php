<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Setting extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        // check access permission
        if (!get_permission('frontend_setting', 'is_view')) {
            access_denied();
        }
        if ($_POST) {
            if (!get_permission('frontend_setting', 'is_add')) {
                access_denied();
            }
            $this->form_validation->set_rules('application_title', 'Application Name', 'trim|required');
            $this->form_validation->set_rules('receive_email_to', 'Receive Email To', 'trim|required|valid_email');
            $this->form_validation->set_rules('working_hours', 'Working Hours', 'trim|required');
            $this->form_validation->set_rules('address', 'Address', 'trim|required');
            $this->form_validation->set_rules('mobile_no', 'Mobile No', 'trim|required');
            $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
            $this->form_validation->set_rules('fax', 'Fax', 'trim|required');
            $this->form_validation->set_rules('footer_text', 'Footer Text', 'trim|required');
            if ($this->form_validation->run() !== false) {
                $cms_setting = array(
                    'application_title' => $this->input->post('application_title'),
                    'captcha_status' => $this->input->post('captcha_status'),
                    'recaptcha_site_key' => $this->input->post('recaptcha_site_key'),
                    'recaptcha_secret_key' => $this->input->post('recaptcha_secret_key'),
                    'address' => $this->input->post('address'),
                    'mobile_no' => $this->input->post('mobile_no'),
                    'fax' => $this->input->post('fax'),
                    'receive_contact_email' => $this->input->post('receive_email_to'),
                    'email' => $this->input->post('email'),
                    'footer_text' => $this->input->post('footer_text'),
                    'working_hours' => $this->input->post('working_hours'),
                    'facebook_url' => $this->input->post('facebook_url'),
                    'twitter_url' => $this->input->post('twitter_url'),
                    'youtube_url' => $this->input->post('youtube_url'),
                    'google_plus' => $this->input->post('google_plus'),
                    'linkedin_url' => $this->input->post('linkedin_url'),
                    'pinterest_url' => $this->input->post('pinterest_url'),
                    'instagram_url' => $this->input->post('instagram_url'),
                );
                // upload logo
                if (isset($_FILES["logo"]) && !empty($_FILES["logo"]['name'])) {
                    $imageNmae = $_FILES['logo']['name'];
                    $extension = pathinfo($imageNmae, PATHINFO_EXTENSION);
                    $newLogoName = 'logo.' . $extension;
                    $image_path = './uploads/frontend/images/' . $newLogoName;
                    if (move_uploaded_file($_FILES['logo']['tmp_name'], $image_path)) {
                        $cms_setting['logo'] = $newLogoName;
                    }
                }

                // upload fav icon
                if (isset($_FILES["fav_icon"]) && !empty($_FILES["fav_icon"]['name'])) {
                    $imageNmae = $_FILES['fav_icon']['name'];
                    $extension = pathinfo($imageNmae, PATHINFO_EXTENSION);
                    $newLogoName = 'fav_icon.' . $extension;
                    $image_path = './uploads/frontend/images/' . $newLogoName;
                    if (move_uploaded_file($_FILES['fav_icon']['tmp_name'], $image_path)) {
                        $cms_setting['fav_icon'] = $newLogoName;
                    }
                }
                // posted all data XSS filtering
                $data = $this->security->xss_clean($cms_setting);
                // update all information in the database
                $this->db->where('id', 1);
                $this->db->update('front_cms_setting', $data);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/setting'));
            }
        }
        $this->data['setting'] = $this->app_lib->get_table('front_cms_setting', 1, true);
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/setting';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }
}
