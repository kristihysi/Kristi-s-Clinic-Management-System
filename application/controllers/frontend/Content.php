<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Content extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('content_model');
    }

    public function index()
    {
        // check access permission
        if (!get_permission('manage_page', 'is_view')) {
            access_denied();
        }
        if ($_POST) {
            if (!get_permission('manage_page', 'is_add')) {
                access_denied();
            }
            $this->content_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // save information in the database
                $arrayData = array(
                    'page_title' => $this->input->post('title'),
                    'menu_id' => $this->input->post('menu_id'),
                    'content' => $this->input->post('content', false),
                    'banner_image' => $this->content_model->uploadBanner('page_' . $this->input->post('menu_id'), 'banners'),
                    'meta_description' => $this->input->post('meta_description'),
                    'meta_keyword' => $this->input->post('meta_keyword'),
                );
                $this->content_model->save_content($arrayData);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/content'));
            }
        }
        $this->data['headerelements'] = array(
            'js' => array(
                'vendor/ckeditor/ckeditor.js',
            ),
        );
        $this->data['pagelist'] = $this->content_model->get_page_list();
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/content';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    public function edit($id = '')
    {
        if (!get_permission('manage_page', 'is_edit')) {
            access_denied();
        }
        if ($this->input->post()) {
            $this->content_validation();
            if ($this->form_validation->run() == false) {
                $this->data['validation_error'] = true;
            } else {
                // update information in the database
                $page_id = $this->input->post('page_id');
                $arrayData = array(
                    'page_title' => $this->input->post('title'),
                    'menu_id' => $this->input->post('menu_id'),
                    'content' => $this->input->post('content', false),
                    'banner_image' => $this->content_model->uploadBanner('page_' . $this->input->post('menu_id'), 'banners'),
                    'meta_description' => $this->input->post('meta_description'),
                    'meta_keyword' => $this->input->post('meta_keyword'),
                );
                $this->content_model->save_content($arrayData, $page_id);
                set_alert('success', translate('information_has_been_updated_successfully'));
                redirect(base_url('frontend/content'));
            }
        }
        
        $this->data['headerelements'] = array(
            'js' => array(
                'vendor/ckeditor/ckeditor.js',
            ),
        );
        $this->data['content'] = $this->content_model->get_list('front_cms_pages', array('id' => $id), true);
        $this->data['title'] = translate('frontend');
        $this->data['sub_page'] = 'frontend/content_edit';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    public function delete($id = '')
    {
        if (!get_permission('manage_page', 'is_delete')) {
            access_denied();
        }
        $this->db->where(array('id' => $id))->delete("front_cms_pages");
    }

    private function content_validation()
    {
        $this->form_validation->set_rules('title', 'Page Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('menu_id', 'Select Menu', 'trim|required|xss_clean|callback_unique_menu');
        $this->form_validation->set_rules('content', 'Content', 'required');
        $this->form_validation->set_rules('meta_keyword', 'Meta Keyword', 'xss_clean');
        $this->form_validation->set_rules('photo', 'Photo', 'trim|xss_clean|callback_check_image');
        $this->form_validation->set_rules('meta_description', 'Meta Description', 'xss_clean');
    }

    public function check_image()
    {
        $prev_image = $this->input->post('old_photo');
        if ($prev_image == "") {
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
        } else {
            return true;
        }
    }

    // unique valid menu verification is done here
    public function unique_menu($id)
    {
        if ($this->input->post('page_id')) {
            $page_id = $this->input->post('page_id');
            $this->db->where_not_in('id', $page_id);
        }
        $this->db->where('menu_id', $id);
        $query = $this->db->get('front_cms_pages');
        if ($query->num_rows() > 0) {
            $this->form_validation->set_message("unique_menu", "This menu has already been allocated.");
            return false;
        } else {
            return true;
        }
    }
}
