<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Services extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('frontend_model');
    }

    // home features
    public function index()
    {
        // check access permission
        if (!get_permission('frontend_services', 'is_view')) {
            access_denied();
        }
        if ($_POST) {
            if (!get_permission('frontend_services', 'is_add')) {
                access_denied();
            }
            $this->services_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // save information in the database
                $data = $this->input->post();
                $this->frontend_model->save_services($data);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/services'));
            }
        }

        $this->data['serviceslist'] = $this->frontend_model->get_list('front_cms_services_list');
        $this->data['title'] = translate('service');
        $this->data['sub_page'] = 'frontend/services';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    // home features edit
    public function edit($id = '')
    {
        if (!get_permission('frontend_services', 'is_edit')) {
            access_denied();
        }
        if ($_POST) {
            $this->services_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // update information in the database
                $data = $this->input->post();
                $this->frontend_model->save_services($data);
                set_alert('success', translate('information_has_been_updated_successfully'));
                redirect(base_url('frontend/services'));
            }
        }

        $this->data['services'] = $this->frontend_model->get_list('front_cms_services_list', array('id' => $id), true);
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/services_edit';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    // home features delete
    public function delete($id = '')
    {
        if (!get_permission('frontend_services', 'is_delete')) {
            access_denied();
        }
        $this->db->where(array('id' => $id))->delete("front_cms_services_list");
    }

    private function services_validation()
    {
        $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('icon', 'Icon', 'trim|required|xss_clean');
        $this->form_validation->set_rules('description', 'Description', 'trim|required|xss_clean');
    }
}
