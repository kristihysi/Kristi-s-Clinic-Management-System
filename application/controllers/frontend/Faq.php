<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Faq extends Admin_Controller
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
        if (!get_permission('frontend_faq', 'is_view')) {
            access_denied();
        }
        if ($_POST) {
            if (!get_permission('frontend_faq', 'is_add')) {
                access_denied();
            }
            $this->services_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // save information in the database
                $data = $this->input->post();
                $this->frontend_model->save_faq($data);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/faq'));
            }
        }

        $this->data['headerelements'] = array(
            'js' => array(
                'vendor/ckeditor/ckeditor.js',
            ),
        );
        $this->data['faqlist'] = $this->frontend_model->get_list('front_cms_faq_list');
        $this->data['title'] = translate('faq');
        $this->data['sub_page'] = 'frontend/faq';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    // home features edit
    public function edit($id = '')
    {
        if (!get_permission('frontend_faq', 'is_edit')) {
            access_denied();
        }
        if ($_POST) {
            $this->services_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // update information in the database
                $data = $this->input->post();
                $this->frontend_model->save_faq($data);
                set_alert('success', translate('information_has_been_updated_successfully'));
                redirect(base_url('frontend/faq'));
            }
        }

        $this->data['headerelements'] = array(
            'js' => array(
                'vendor/ckeditor/ckeditor.js',
            ),
        );
        $this->data['faq'] = $this->frontend_model->get_list('front_cms_faq_list', array('id' => $id), true);
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/faq_edit';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    // home features delete
    public function delete($id = '')
    {
        if (!get_permission('frontend_faq', 'is_delete')) {
            access_denied();
        }
        $this->db->where(array('id' => $id))->delete("front_cms_faq_list");
    }

    private function services_validation()
    {
        $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('description', 'Description', 'trim|required');
    }
}
