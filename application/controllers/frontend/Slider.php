<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Slider extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('frontend_model');
    }

    // home slider
    public function index()
    {
        // check access permission
        if (!get_permission('frontend_slider', 'is_view')) {
            access_denied();
        }

        if ($_POST) {
            if (!get_permission('frontend_slider', 'is_add')) {
                access_denied();
            }

            $this->slider_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // save information in the database
                $data = $this->input->post();
                $this->frontend_model->save_slider($data);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/slider'));
            }
        }

        $this->data['sliderlist'] = $this->frontend_model->get_list('front_cms_home', array('item_type' => 'slider'));
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/slider';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    // home slider edit
    public function edit($id = '')
    {
        // check access permission
        if (!get_permission('frontend_slider', 'is_edit')) {
            access_denied();
        }
        if ($_POST) {
            $this->slider_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // update information in the database
                $data = $this->input->post();
                $this->frontend_model->save_slider($data);
                set_alert('success', translate('information_has_been_updated_successfully'));
                redirect(base_url('frontend/slider'));
            }
        }

        $this->data['slider'] = $this->frontend_model->get_list('front_cms_home', array('id' => $id, 'item_type' => 'slider'), true);
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/slider_edit';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    // home slider delete
    public function delete($id = '')
    {
        if (!get_permission('frontend_slider', 'is_delete')) {
            access_denied();
        }
        $image = $this->db->get_where('front_cms_home', array('id' => $id, 'item_type' => 'slider'))->row()->image;
        if ($this->db->where(array('id' => $id, 'item_type' => 'slider'))->delete("front_cms_home")) {
            // delete gallery slider
            $destination = './uploads/frontend/slider/';
            if (file_exists($destination . $image)) {
                @unlink($destination . $image);
            }
        }
    }

    private function slider_validation()
    {
        $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('position', 'Position', 'trim|required|xss_clean');
        $this->form_validation->set_rules('button_text_1', 'Button Text 1', 'trim|required|xss_clean');
        $this->form_validation->set_rules('button_url_1', 'Button Url 1', 'trim|required|xss_clean');
        $this->form_validation->set_rules('button_text_2', 'Button Text 2', 'trim|required|xss_clean');
        $this->form_validation->set_rules('button_url_2', 'Button Url 2', 'trim|required|xss_clean');
        $this->form_validation->set_rules('description', 'Description', 'trim|required|xss_clean');
        $this->form_validation->set_rules('photo', 'Photo', 'trim|xss_clean|callback_check_image');
    }

    public function check_image()
    {
        if ($this->input->post('slider_id')) {
            if (!empty($_FILES['photo']['name'])) {
                $name = $_FILES['photo']['name'];
                $arr = explode('.', $name);
                $ext = end($arr);
                if ($ext == 'jpg' || $ext == 'jpeg' || $ext == 'png') {
                    return true;
                } else {
                    $this->form_validation->set_message('check_image', translate('select_valid_file_format'));
                    return false;
                }
            }
        } else {
            if (isset($_FILES['photo']['name']) && !empty($_FILES['photo']['name'])) {
                $name = $_FILES['photo']['name'];
                $arr = explode('.', $name);
                $ext = end($arr);
                if ($ext == 'jpg' || $ext == 'jpeg' || $ext == 'png') {
                    return true;
                } else {
                    $this->form_validation->set_message('check_image', translate('select_valid_file_format'));
                    return false;
                }
            } else {
                $this->form_validation->set_message('check_image', 'The Photo is required.');
                return false;
            }
        }
    }
}
