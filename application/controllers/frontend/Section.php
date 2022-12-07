<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Section extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('frontend_model');

        // check access permission
        if (!get_permission('frontend_section', 'is_view')) {
            access_denied();
        }
    }

    public function index()
    {
        $this->home();
    }

    // home features
    public function home()
    {
        if ($_POST) {
            // check access permission
            if (!get_permission('frontend_section', 'is_add')) {
                access_denied();
            }
        }

        $this->data['validation'] = 1;
        if ($this->input->post('home_wellcome')) {
            $this->form_validation->set_rules('wel_title', 'Title', 'trim|required|xss_clean');
            $this->form_validation->set_rules('subtitle', 'Subtitle', 'trim|required|xss_clean');
            $this->form_validation->set_rules('description', 'Description', 'trim|required|xss_clean');
            $this->form_validation->set_rules('photo', 'Photo', 'trim|xss_clean|callback_check_image');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 1;
            } else {
                // save information in the database
                $arrayWellcome = array(
                    'title' => $this->input->post('wel_title'),
                    'subtitle' => $this->input->post('subtitle'),
                    'description' => $this->input->post('description'),
                    'elements' => json_encode(array('image' => $this->uploadImage('wellcome', 'home_page'))),
                );
                $this->db->where('item_type', 'wellcome');
                $this->db->update('front_cms_home', $arrayWellcome);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/home'));
            }
        }

        if ($this->input->post('doctor_list')) {
            $this->form_validation->set_rules('doc_title', 'Title', 'trim|required|xss_clean');
            $this->form_validation->set_rules('doc_description', 'Description', 'trim|required|xss_clean');
            $this->form_validation->set_rules('photo', 'Photo', 'trim|xss_clean|callback_check_image');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 2;
            } else {
                // save information in the database
                $arrayDoctor = array(
                    'title' => $this->input->post('doc_title'),
                    'description' => $this->input->post('doc_description'),
                    'elements' => json_encode(array('doctor_start' => $this->input->post('doctor_start'), 'image' => $this->uploadImage('featured-parallax', 'home_page'))),
                );
                $this->db->where('item_type', 'doctors');
                $this->db->update('front_cms_home', $arrayDoctor);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/home'));
            }
        }

        if ($this->input->post('testimonial')) {
            $this->form_validation->set_rules('tes_title', 'Title', 'trim|required|xss_clean');
            $this->form_validation->set_rules('tes_description', 'Description', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 3;
            } else {
                // save information in the database
                $arrayTestimonial = array(
                    'title' => $this->input->post('tes_title'),
                    'description' => $this->input->post('tes_description'),
                );
                $this->db->where('item_type', 'testimonial');
                $this->db->update('front_cms_home', $arrayTestimonial);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/home'));
            }
        }

        if ($this->input->post('services')) {
            $this->form_validation->set_rules('ser_title', 'Title', 'trim|required|xss_clean');
            $this->form_validation->set_rules('ser_description', 'Description', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 4;
            } else {
                // save information in the database
                $arrayServices = array(
                    'title' => $this->input->post('ser_title'),
                    'description' => $this->input->post('ser_description'),
                );
                $this->db->where('item_type', 'services');
                $this->db->update('front_cms_home', $arrayServices);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/home'));
            }
        }

        if ($this->input->post('cta')) {
            $this->form_validation->set_rules('cta_title', 'Cta Title', 'trim|required|xss_clean');
            $this->form_validation->set_rules('mobile_no', 'Mobile No', 'trim|required|xss_clean');
            $this->form_validation->set_rules('button_text', 'Button Text', 'trim|required|xss_clean');
            $this->form_validation->set_rules('button_url', 'Button Url', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 5;
            } else {
                $elements_data = array(
                    'mobile_no' => $this->input->post('mobile_no'),
                    'button_text' => $this->input->post('button_text'),
                    'button_url' => $this->input->post('button_url'),
                    'image' => $this->uploadImage('appointment-booking-img', 'home_page'),
                );
                $array_services = array(
                    'title' => $this->input->post('cta_title'),
                    'elements' => json_encode($elements_data),
                );
                // save information in the database
                $this->db->where('item_type', 'cta');
                $this->db->update('front_cms_home', $array_services);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/home'));
            }
        }

        if ($this->input->post('options')) {
            $this->form_validation->set_rules('page_title', 'Page Title', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 6;
            } else {
                // save information in the database
                $arraySeo = array(
                    'page_title' => $this->input->post('page_title'),
                    'meta_keyword' => $this->input->post('meta_keyword', true),
                    'meta_description' => $this->input->post('meta_description', true),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_home_seo', $arraySeo);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/home'));
            }
        }

        $this->data['wellcome'] = $this->frontend_model->get_list('front_cms_home', array('item_type' => 'wellcome'), true);
        $this->data['home_seo'] = $this->frontend_model->get_list('front_cms_home_seo', array('id' => 1), true);
        $this->data['doctors'] = $this->frontend_model->get_list('front_cms_home', array('item_type' => 'doctors'), true);
        $this->data['testimonial'] = $this->frontend_model->get_list('front_cms_home', array('item_type' => 'testimonial'), true);
        $this->data['services'] = $this->frontend_model->get_list('front_cms_home', array('item_type' => 'services'), true);
        $this->data['cta'] = $this->frontend_model->get_list('front_cms_home', array('item_type' => 'cta'), true);
        $this->data['title'] = translate('website_page');
        $this->data['sub_page'] = 'frontend/section_home';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    public function about()
    {
        if ($_POST) {
            // check access permission
            if (!get_permission('frontend_section', 'is_add')) {
                access_denied();
            }
        }

        $this->data['validation'] = 1;
        if ($this->input->post('about')) {
            $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean');
            $this->form_validation->set_rules('subtitle', 'Subtitle', 'trim|required|xss_clean');
            $this->form_validation->set_rules('content', 'Content', 'trim|required');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 1;
            } else {
                // save information in the database
                $arrayAbout = array(
                    'title' => $this->input->post('title'),
                    'subtitle' => $this->input->post('subtitle'),
                    'content' => $this->input->post('content', false),
                    'about_image' => $this->uploadImage('about', 'about'),
                    'about_image' => $this->uploadImage('about', 'about'),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_about', $arrayAbout);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/about'));
            }
        }

        if ($this->input->post('service')) {
            $this->form_validation->set_rules('title', 'Title', 'trim|required');
            $this->form_validation->set_rules('subtitle', 'Subtitle', 'trim|required');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 2;
            } else {
                // save information in the database
                $arrayServices = array(
                    'title' => $this->input->post('title'),
                    'subtitle' => $this->input->post('subtitle'),
                    'parallax_image' => $this->uploadImage('service_parallax', 'about'),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_services', $arrayServices);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/about'));
            }
        }

        if ($this->input->post('cta')) {
            $this->form_validation->set_rules('cta_title', 'Cta Title', 'trim|required|xss_clean');
            $this->form_validation->set_rules('button_text', 'Button Text', 'trim|required|xss_clean');
            $this->form_validation->set_rules('button_url', 'Button Url', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 3;
            } else {
                // save information in the database
                $array_cta = array(
                    'cta_title' => $this->input->post('cta_title'),
                    'button_text' => $this->input->post('button_text'),
                    'button_url' => $this->input->post('button_url'),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_about', array('elements' => json_encode($array_cta)));
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/about'));
            }
        }

        if ($this->input->post('options')) {
            $this->form_validation->set_rules('page_title', 'Page Title', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 4;
            } else {
                // save information in the database
                $array_about = array(
                    'page_title' => $this->input->post('page_title'),
                    'meta_description' => $this->input->post('meta_description', true),
                    'meta_keyword' => $this->input->post('meta_keyword', true),
                    'banner_image' => $this->uploadImage('about', 'banners'),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_about', $array_about);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/about'));
            }
        }

        $this->data['headerelements'] = array(
            'js' => array(
                'vendor/ckeditor/ckeditor.js',
            ),
        );
        $this->data['about'] = $this->frontend_model->get_list('front_cms_about', array('id' => 1), true);
        $this->data['service'] = $this->frontend_model->get_list('front_cms_services', array('id' => 1), true);
        $this->data['title'] = translate('website_page');
        $this->data['sub_page'] = 'frontend/section_about';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    public function faq()
    {
        if ($_POST) {
            // check access permission
            if (!get_permission('frontend_section', 'is_add')) {
                access_denied();
            }
        }

        $this->data['validation'] = 1;
        if ($this->input->post('faq')) {
            $this->form_validation->set_rules('title', 'Title', 'trim|required');
            $this->form_validation->set_rules('description', 'Description', 'trim|required');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 1;
            } else {
                // save information in the database
                $array_faq = array(
                    'title' => $this->input->post('title'),
                    'description' => $this->input->post('description', false),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_faq', $array_faq);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/faq'));
            }
        }

        if ($this->input->post('options')) {
            $this->form_validation->set_rules('page_title', 'Page Title', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 2;
            } else {
                // save information in the database
                $array_faq = array(
                    'page_title' => $this->input->post('page_title'),
                    'meta_description' => $this->input->post('meta_description'),
                    'meta_keyword' => $this->input->post('meta_keyword'),
                    'banner_image' => $this->uploadImage('faq', 'banners'),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_faq', $array_faq);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/faq'));
            }
        }

        $this->data['headerelements'] = array(
            'js' => array(
                'vendor/ckeditor/ckeditor.js',
            ),
        );
        $this->data['faq'] = $this->frontend_model->get_list('front_cms_faq', array('id' => 1), true);
        $this->data['title'] = translate('website_page');
        $this->data['sub_page'] = 'frontend/section_faq';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    public function doctors()
    {
        if ($_POST) {
            // check access permission
            if (!get_permission('frontend_section', 'is_add')) {
                access_denied();
            }
        }
        $this->data['validation'] = 1;
        if ($this->input->post('doctors_options')) {
            $this->form_validation->set_rules('page_title', 'Page Title', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 1;
            } else {
                // save information in the database
                $array_about = array(
                    'page_title' => $this->input->post('page_title'),
                    'meta_description' => $this->input->post('meta_description', true),
                    'meta_keyword' => $this->input->post('meta_keyword', true),
                    'banner_image' => $this->uploadImage('doctors', 'banners'),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_doctors', $array_about);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/doctors'));
            }
        }

        if ($this->input->post('pro_options')) {
            $this->form_validation->set_rules('pro_page_title', 'Page Title', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 2;
            } else {
                // save information in the database
                $array_about = array(
                    'page_title' => $this->input->post('pro_page_title'),
                    'meta_description' => $this->input->post('pro_meta_description', true),
                    'meta_keyword' => $this->input->post('pro_meta_keyword', true),
                    'banner_image' => $this->uploadImage('doctor_profile', 'banners'),
                );
                $this->db->where('id', 2);
                $this->db->update('front_cms_doctors', $array_about);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/doctors'));
            }
        }

        $this->data['doctors'] = $this->frontend_model->get_list('front_cms_doctors', array('id' => 1), true);
        $this->data['doctor_pro'] = $this->frontend_model->get_list('front_cms_doctors', array('id' => 2), true);
        $this->data['title'] = translate('website_page');
        $this->data['sub_page'] = 'frontend/section_doctors';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    public function appointment()
    {
        if ($_POST) {
            // check access permission
            if (!get_permission('frontend_section', 'is_add')) {
                access_denied();
            }
        }
        $this->data['validation'] = 1;
        if ($this->input->post('appointment')) {
            $this->form_validation->set_rules('title', 'Title', 'trim|required');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 1;
            } else {
                // save information in the database
                $array_faq = array(
                    'title' => $this->input->post('title'),
                    'description' => $this->input->post('description', false),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_appointment', $array_faq);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/appointment'));
            }
        }

        if ($this->input->post('options')) {
            $this->form_validation->set_rules('page_title', 'Page Title', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 2;
            } else {
                // save information in the database
                $array_about = array(
                    'page_title' => $this->input->post('page_title'),
                    'meta_keyword' => $this->input->post('meta_keyword'),
                    'meta_description' => $this->input->post('meta_description'),
                    'banner_image' => $this->uploadImage('appointment', 'banners'),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_appointment', $array_about);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/appointment'));
            }
        }

        $this->data['headerelements'] = array(
            'js' => array(
                'vendor/ckeditor/ckeditor.js',
            ),
        );
        $this->data['appointment'] = $this->frontend_model->get_list('front_cms_appointment', array('id' => 1), true);
        $this->data['title'] = translate('website_page');
        $this->data['sub_page'] = 'frontend/section_appointment';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
    }

    public function contact()
    {
        if ($_POST) {
            // check access permission
            if (!get_permission('frontend_section', 'is_add')) {
                access_denied();
            }
        }
        $this->data['validation'] = 1;
        if ($this->input->post('contact')) {
            $this->form_validation->set_rules('box_title', 'Box Title', 'trim|required');
            $this->form_validation->set_rules('box_description', 'Box Description', 'trim|required');
            $this->form_validation->set_rules('form_title', 'Form Title', 'trim|required');
            $this->form_validation->set_rules('address', 'Address', 'trim|required');
            $this->form_validation->set_rules('phone', 'Phone', 'trim|required');
            $this->form_validation->set_rules('email', 'Email', 'trim|required');
            $this->form_validation->set_rules('submit_text', 'Submit Text', 'trim|required');
            $this->form_validation->set_rules('map_iframe', 'Map Iframe', 'trim|required');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 1;
            } else {
                // save information in the database
                $array_contact = array(
                    'box_title' => $this->input->post('box_title'),
                    'box_description' => $this->input->post('box_description'),
                    'form_title' => $this->input->post('form_title'),
                    'address' => $this->input->post('address'),
                    'phone' => $this->input->post('phone'),
                    'email' => $this->input->post('email'),
                    'submit_text' => $this->input->post('submit_text'),
                    'map_iframe' => $this->input->post('map_iframe'),
                );

                // upload box image
                if (isset($_FILES["photo"]) && !empty($_FILES["photo"]['name'])) {
                    $imageNmae = $_FILES['photo']['name'];
                    $extension = pathinfo($imageNmae, PATHINFO_EXTENSION);
                    $newLogoName = 'contact-info-box.' . $extension;
                    $image_path = './uploads/frontend/images/' . $newLogoName;
                    if (move_uploaded_file($_FILES['photo']['tmp_name'], $image_path)) {
                        $array_contact['box_image'] = $newLogoName;
                    }
                }

                $this->db->where('id', 1);
                $this->db->update('front_cms_contact', $array_contact);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/contact'));
            }
        }

        if ($this->input->post('options')) {
            $this->form_validation->set_rules('page_title', 'Page Title', 'trim|required|xss_clean');
            if ($this->form_validation->run() == false) {
                $this->data['validation'] = 2;
            } else {
                // save information in the database
                $array_about = array(
                    'page_title' => $this->input->post('page_title'),
                    'meta_description' => $this->input->post('meta_description', true),
                    'meta_keyword' => $this->input->post('meta_keyword', true),
                    'banner_image' => $this->uploadImage('contact', 'banners'),
                );
                $this->db->where('id', 1);
                $this->db->update('front_cms_contact', $array_about);
                set_alert('success', translate('information_has_been_saved_successfully'));
                redirect(base_url('frontend/section/contact'));
            }
        }

        $this->data['contact'] = $this->frontend_model->get_list('front_cms_contact', array('id' => 1), true);
        $this->data['title'] = translate('website_page');
        $this->data['sub_page'] = 'frontend/section_contact';
        $this->data['main_menu'] = 'frontend';
        $this->load->view('layout/index', $this->data);
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

    // upload image
    public function uploadImage($img_name, $path)
    {
        $prev_image = $this->input->post('old_photo');
        $image = $_FILES['photo']['name'];
        $return_image = '';
        if ($image != '') {
            $destination = './uploads/frontend/' . $path . '/';
            $extension = pathinfo($image, PATHINFO_EXTENSION);
            $image_path = $img_name . '.' . $extension;
            move_uploaded_file($_FILES['photo']['tmp_name'], $destination . $image_path);

            // need to unlink previous slider
            if ($prev_image != $image_path) {
                if (file_exists($destination . $prev_image)) {
                    @unlink($destination . $prev_image);
                }
            }
            $return_image = $image_path;
        } else {
            $return_image = $prev_image;
        }
        return $return_image;
    }
}
