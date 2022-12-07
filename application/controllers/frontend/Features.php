<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Features extends Admin_Controller
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
        if (!get_permission('frontend_features', 'is_view')) {
            access_denied();
        }
        if ($_POST) {
            if (!get_permission('frontend_features', 'is_add')) {
                access_denied();
            }
            $this->features_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // save information in the database
                $data = $this->input->post();
                $this->frontend_model->save_features($data);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/features'));
            }
        }

        $this->data['featureslist'] = $this->frontend_model->get_list('front_cms_home', array('item_type' => 'features'));
        $this->data['title'] = translate('features');
        $this->data['sub_page'] = 'frontend/features';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    // home features edit
    public function edit($id = '')
    {
        if (!get_permission('frontend_features', 'is_edit')) {
            access_denied();
        }
        if ($_POST) {
            $this->features_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // update information in the database
                $data = $this->input->post();
                $this->frontend_model->save_features($data);
                set_alert('success', translate('information_has_been_updated_successfully'));
                redirect(base_url('frontend/features'));
            }
        }

        $this->data['features'] = $this->frontend_model->get_list('front_cms_home', array('id' => $id, 'item_type' => 'features'), true);
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/features_edit';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    // home features delete
    public function delete($id = '')
    {
        if (!get_permission('frontend_features', 'is_delete')) {
            access_denied();
        }
        $this->db->where(array('id' => $id, 'item_type' => 'features'))->delete("front_cms_home");
    }

    private function features_validation()
    {
        $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('button_text', 'Button Text', 'trim|required|xss_clean');
        $this->form_validation->set_rules('button_url', 'Button Url', 'trim|required|xss_clean');
        $this->form_validation->set_rules('icon', 'Icon', 'trim|required|xss_clean');
        $this->form_validation->set_rules('description', 'Description', 'trim|required|xss_clean');
    }
}
