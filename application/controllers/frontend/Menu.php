<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Menu extends Admin_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('frontend_model');
    }

    public function index()
    {
        // check access permission
        if (!get_permission('frontend_menu', 'is_view')) {
            access_denied();
        }
        if ($this->input->post()) {
            if (!get_permission('frontend_menu', 'is_add')) {
                access_denied();
            }
            $this->menu_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // save information in the database
                $data = $this->input->post();
                $this->frontend_model->save_menus($data);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/menu'));
            }
        }

        $this->data['menulist'] = $this->frontend_model->get_list('front_cms_menu');
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/menu';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    public function edit($id = '')
    {
        // check access permission
        if (!get_permission('frontend_menu', 'is_edit')) {
            access_denied();
        }
        if ($this->input->post()) {
            $this->menu_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // update information in the database
                $data = $this->input->post();
                $this->frontend_model->save_menus($data);
                set_alert('success', translate('information_has_been_updated_successfully'));
                redirect(base_url('frontend/menu'));
            }
        }

        $this->data['menu'] = $this->frontend_model->get_list('front_cms_menu', array('id' => $id), true);
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/menu_edit';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    public function delete($id = '')
    {
        if (!get_permission('frontend_menu', 'is_delete')) {
            access_denied();
        }
        $this->db->where(array('id' => $id, 'system' => 0))->delete("front_cms_menu");
    }

    public function status()
    {
        if (!get_permission('frontend_menu', 'is_edit')) {
            access_denied();
        }

        $id = $this->input->post('menu_id');
        $status = $this->input->post('status');
        if ($status == 'true') {
            $array_data['publish'] = 1;
            $message = translate('published_on_website');
        } else {
            $array_data['publish'] = 0;
            $message = translate('unpublished_on_website');
        }
        $this->db->where('id', $id);
        $this->db->update('front_cms_menu', $array_data);
        echo $message;
    }

    private function menu_validation()
    {
        $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean|callback_unique_title');
        $this->form_validation->set_rules('position', 'Position', 'trim|required|numeric|xss_clean');
        if ($this->input->post('external_url')) {
            $this->form_validation->set_rules('external_link', 'External Link', 'trim|required|xss_clean');
        }
    }

    // unique valid menu title verification is done here
    public function unique_title($title)
    {
        if ($this->input->post('menu_id')) {
            $menu_id = $this->input->post('menu_id');
            $this->db->where_not_in('id', $menu_id);
        }
        $this->db->where('title', $title);
        $this->db->where('system', 0);
        $query = $this->db->get('front_cms_menu');
        if ($query->num_rows() > 0) {
            $this->form_validation->set_message("unique_title", "This title has already been used.");
            return false;
        } else {
            return true;
        }
    }
}
