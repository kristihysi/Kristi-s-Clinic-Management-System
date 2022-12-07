-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2022 at 07:03 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dok`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `balance` double(18,2) NOT NULL DEFAULT 0.00,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `appointment_id` varchar(20) NOT NULL,
  `doctor_id` varchar(20) NOT NULL,
  `patient_id` varchar(20) NOT NULL,
  `consultation_fees` varchar(20) NOT NULL,
  `discount` decimal(18,2) NOT NULL,
  `schedule` varchar(50) NOT NULL,
  `remarks` text NOT NULL,
  `appointment_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `appointment_id`, `doctor_id`, `patient_id`, `consultation_fees`, `discount`, `schedule`, `remarks`, `appointment_date`, `status`, `created_at`) VALUES
(1, '0001', '2', '1', '', '0.00', '1', 'hey i want to book you.', '2022-12-05', 4, '2022-11-30 21:52:08'),
(2, '0002', '2', '2', '', '0.00', '1', 'Hello this is my test final', '2022-12-05', 4, '2022-12-04 18:33:33'),
(3, '0003', '2', '2', '', '0.00', '11', 'New test with ID', '2022-12-16', 4, '2022-12-04 18:39:14');

-- --------------------------------------------------------

--
-- Table structure for table `chemical`
--

CREATE TABLE `chemical` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sales_unit_id` int(11) NOT NULL,
  `unit_ratio` varchar(20) DEFAULT '1',
  `purchase_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `sales_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `available_stock` varchar(11) NOT NULL DEFAULT '0',
  `photo` varchar(100) DEFAULT NULL,
  `remarks` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chemical_assigned`
--

CREATE TABLE `chemical_assigned` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `chemical_id` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chemical_category`
--

CREATE TABLE `chemical_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chemical_stock`
--

CREATE TABLE `chemical_stock` (
  `id` int(11) NOT NULL,
  `inovice_no` varchar(25) NOT NULL,
  `chemical_id` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  `stock_quantity` varchar(20) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `stock_by` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chemical_unit`
--

CREATE TABLE `chemical_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

CREATE TABLE `email_config` (
  `id` int(11) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `email_protocol` varchar(10) NOT NULL,
  `smtp_host` varchar(25) NOT NULL,
  `smtp_user` varchar(25) DEFAULT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_port` varchar(100) NOT NULL,
  `smtp_encryption` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `email`, `email_protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_encryption`) VALUES
(1, 'example@gmail.com', 'sendmail', 'smtp.gmail.com', 'example@gmail.com', '1234', '25', 'ssl');

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(200) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `template_body` longtext NOT NULL,
  `tags` longtext NOT NULL,
  `notified` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `subject`, `template_body`, `tags`, `notified`) VALUES
(1, 'account_registered', 'Account Registered', '', '{institute_name}, {name}, {username}, {password}, {user_role}, {login_url}', 0),
(2, 'forgot_password', 'Forgot Password', '', '{institute_name}, {name}, {username}, {reset_url}', 0),
(5, 'payslip_generated', 'Payslip generated', '', '{institute_name}, {name}, {month_year}, {payslip_no}, {payslip_url}', 0),
(6, 'absent', 'Absent Notice', '', '{institute_name}, {name}, {date}', 0),
(7, 'leave_approve', 'Your leave request has been approved', '', '{institute_name}, {name}, {admin_comments}, {start_date}, {end_date}', 0),
(8, 'leave_reject', 'Your leave request has been reject', '', '{institute_name}, {name}, {admin_comments}, {start_date}, {end_date}', 0),
(9, 'appointment_confirmation', 'Appointment Confirmation', '', '{institute_name}, {patient_name}, {doctor_name}, {consultation_fees}, {schedule_time}, {appointment_date}', 0),
(10, 'appointment_canceled', 'Appointment Canceled', '', '{institute_name}, {patient_name}, {doctor_name}, {consultation_fees}, {schedule_time}, {appointment_date}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_about`
--

CREATE TABLE `front_cms_about` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `about_image` varchar(255) NOT NULL,
  `elements` mediumtext NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_about`
--

INSERT INTO `front_cms_about` (`id`, `title`, `subtitle`, `page_title`, `content`, `banner_image`, `about_image`, `elements`, `meta_description`, `meta_keyword`) VALUES
(1, NULL, NULL, '', '', NULL, '', '{\"cta_title\":\"Get in touch to join our community\",\"button_text\":\"Contact Our Office\",\"button_url\":\"contact\"}', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_appointment`
--

CREATE TABLE `front_cms_appointment` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_appointment`
--

INSERT INTO `front_cms_appointment` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`) VALUES
(1, 'Make An Appointment', '<p><span style=\"color: rgb(156, 156, 156); font-family: Poppins, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Lorem ipsum dolor sit amet, eum illum dolore concludaturque ex, ius latine adipisci no. Pro at nullam laboramus definitiones. Mandamusconceptam omittantur cu cum. Brute appetere it scriptorem ei eam, ne vim velit novum nominati. Causae volutpat percipitur at sed ne.</span></p>\r\n', 'Appointment', 'appointment.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_contact`
--

CREATE TABLE `front_cms_contact` (
  `id` int(11) NOT NULL,
  `box_title` varchar(255) DEFAULT NULL,
  `box_description` varchar(500) DEFAULT NULL,
  `box_image` varchar(255) DEFAULT NULL,
  `form_title` varchar(355) DEFAULT NULL,
  `address` varchar(355) DEFAULT NULL,
  `phone` varchar(355) DEFAULT NULL,
  `email` varchar(355) DEFAULT NULL,
  `submit_text` varchar(355) NOT NULL,
  `map_iframe` text DEFAULT NULL,
  `page_title` varchar(255) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_contact`
--

INSERT INTO `front_cms_contact` (`id`, `box_title`, `box_description`, `box_image`, `form_title`, `address`, `phone`, `email`, `submit_text`, `map_iframe`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_doctors`
--

CREATE TABLE `front_cms_doctors` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_doctors`
--

INSERT INTO `front_cms_doctors` (`id`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`) VALUES
(1, 'Doctors', 'doctors.jpg', '', ''),
(2, 'Doctor Profile', 'doctor_profile.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_doctor_bio`
--

CREATE TABLE `front_cms_doctor_bio` (
  `id` int(11) NOT NULL,
  `doctor_id` varchar(20) NOT NULL,
  `biography` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq`
--

CREATE TABLE `front_cms_faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_faq`
--

INSERT INTO `front_cms_faq` (`id`, `title`, `description`, `page_title`, `banner_image`, `meta_description`, `meta_keyword`) VALUES
(1, 'Frequently Asked Questions', '<p>The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it&#39;s seen all around the web; on templates, websites, and stock designs</p>', 'Faq', 'faq.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_faq_list`
--

CREATE TABLE `front_cms_faq_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home`
--

CREATE TABLE `front_cms_home` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `item_type` varchar(20) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `elements` mediumtext NOT NULL,
  `active` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_home`
--

INSERT INTO `front_cms_home` (`id`, `title`, `subtitle`, `item_type`, `description`, `elements`, `active`) VALUES
(1, 'Lorem ipsum, or lipsum', 'is dummy text used in laying out print', 'wellcome', 'The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:\r\n\r\n“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”', '{\"image\":\"wellcome.jpg\"}', 0),
(2, 'Experience Doctor Team', NULL, 'doctors', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident.', '{\"doctor_start\":\"1\",\"image\":\"featured-parallax.jpg\"}', 0),
(3, 'Our Best Medical Services', NULL, 'services', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '', 0),
(4, 'Online Hassle Free Appointment Booking', 'Medical Services', 'cta', '', '{\"mobile_no\":\"+2484-398-8987\",\"button_text\":\"Book your Appointment\",\"button_url\":\"appointment\",\"image\":\"appointment-booking-img.png\"}', 0),
(5, 'Simple <span>Digital</span> Title', NULL, 'slider', 'Lorem Ipsum is simply dummy text printer took a galley of type and scrambled it to make a type specimen book.', '{\"position\":\"c-left\",\"button_text1\":\"View Services\",\"button_url1\":\"#\",\"button_text2\":\"Learn More\",\"button_url2\":\"#\",\"image\":\"home-slider-1578743357.jpg\"}', 0),
(6, 'New Caption <span>Some Caption</span> Here', NULL, 'slider', 'Lorem Ipsum is simply dummy text printer took a galley of type and scrambled it to make a type specimen book.', '{\"position\":\"c-center\",\"button_text1\":\"Read More\",\"button_url1\":\"#\",\"button_text2\":\"Get Started\",\"button_url2\":\"#\",\"image\":\"home-slider-1578743366.jpg\"}', 0),
(8, 'Qualified Doctors', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-user-md\"}', 0),
(9, 'Regular Checkup', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-stethoscope\"}', 0),
(10, 'Neurosurgeon', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"fas fa-vial\"}', 0),
(11, '24 Hours  Service', NULL, 'features', 'Nulla metus metus ullamcorper vel tincidunt sed euismod nibh Quisque volutpat condimentum velit class aptent taciti sociosqu.', '{\"button_text\":\"Read More\",\"button_url\":\"#\",\"icon\":\"far fa-clock\"}', 0),
(12, 'Our Happy Patients Opinion', NULL, 'testimonial', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_home_seo`
--

CREATE TABLE `front_cms_home_seo` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_home_seo`
--

INSERT INTO `front_cms_home_seo` (`id`, `page_title`, `meta_keyword`, `meta_description`) VALUES
(1, 'Home', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_menu`
--

CREATE TABLE `front_cms_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `ordering` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `open_new_tab` int(11) NOT NULL DEFAULT 0,
  `ext_url` int(11) NOT NULL DEFAULT 0,
  `ext_url_address` text DEFAULT NULL,
  `publish` int(11) NOT NULL,
  `system` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_menu`
--

INSERT INTO `front_cms_menu` (`id`, `title`, `alias`, `ordering`, `parent_id`, `open_new_tab`, `ext_url`, `ext_url_address`, `publish`, `system`, `created_at`) VALUES
(1, 'Home', 'index', 1, 0, 0, 0, '', 1, '1', '2022-12-03 18:18:54'),
(2, 'Appointment', 'appointment', 3, 0, 0, 0, '', 1, '1', '2022-12-03 18:18:54'),
(3, 'Doctors', 'doctors', 2, 0, 0, 0, '', 1, '1', '2022-12-03 18:18:54'),
(4, 'About Us', 'about', 4, 0, 0, 0, '', 0, '1', '2022-12-03 18:18:54'),
(5, 'FAQ', 'faq', 5, 0, 0, 0, '', 0, '1', '2022-12-03 18:18:54'),
(6, 'Contact Us', 'contact', 6, 0, 0, 0, '', 0, '1', '2022-12-03 18:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_pages`
--

CREATE TABLE `front_cms_pages` (
  `id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` int(11) NOT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services`
--

CREATE TABLE `front_cms_services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `parallax_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_services`
--

INSERT INTO `front_cms_services` (`id`, `title`, `subtitle`, `parallax_image`) VALUES
(1, 'Get Well Soon', 'Our Clinic <span>Services</span>', 'service_parallax.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_services_list`
--

CREATE TABLE `front_cms_services_list` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_services_list`
--

INSERT INTO `front_cms_services_list` (`id`, `title`, `description`, `icon`) VALUES
(1, 'First Aid', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.', 'fas fa-medal'),
(2, 'Dental Care', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover.', 'fas fa-heartbeat'),
(3, '24x7 Ambulance', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model.', 'fas fa-ambulance'),
(4, 'Qualified Doctors', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will.', 'fas fa-capsules'),
(5, 'Medical Pharmacy', 'Making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover.', 'fas fa-stethoscope'),
(6, 'Pulmonary', 'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a for \'lorem ipsum\' will uncover.', 'fas fa-medkit');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_setting`
--

CREATE TABLE `front_cms_setting` (
  `id` int(11) NOT NULL,
  `application_title` varchar(255) NOT NULL,
  `captcha_status` varchar(20) NOT NULL,
  `recaptcha_site_key` varchar(255) NOT NULL,
  `recaptcha_secret_key` varchar(255) NOT NULL,
  `address` varchar(350) NOT NULL,
  `mobile_no` varchar(60) NOT NULL,
  `fax` varchar(60) NOT NULL,
  `receive_contact_email` varchar(255) NOT NULL,
  `email` varchar(60) NOT NULL,
  `footer_text` varchar(255) NOT NULL,
  `fav_icon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `working_hours` varchar(300) NOT NULL,
  `facebook_url` varchar(100) NOT NULL,
  `twitter_url` varchar(100) NOT NULL,
  `youtube_url` varchar(100) NOT NULL,
  `google_plus` varchar(100) NOT NULL,
  `linkedin_url` varchar(100) NOT NULL,
  `pinterest_url` varchar(100) NOT NULL,
  `instagram_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `front_cms_setting`
--

INSERT INTO `front_cms_setting` (`id`, `application_title`, `captcha_status`, `recaptcha_site_key`, `recaptcha_secret_key`, `address`, `mobile_no`, `fax`, `receive_contact_email`, `email`, `footer_text`, `fav_icon`, `logo`, `working_hours`, `facebook_url`, `twitter_url`, `youtube_url`, `google_plus`, `linkedin_url`, `pinterest_url`, `instagram_url`) VALUES
(1, 'Kristi\'s Clinic Management System', 'disable', '', '', 'Tirane, Albania', '+355 69 11 22 333', '355 69  11 22 333', 'info@kristi.com', 'info@demo.com', '© 2022 <span>Developed by</span> Kristi Hysi', 'fav_icon.ico', 'logo.png', '<span>Hours : </span>  Mon To Fri - 8:00 - 16:00,  Sunday Closed', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `front_cms_testimonial`
--

CREATE TABLE `front_cms_testimonial` (
  `id` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `surname` varchar(355) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rank` int(5) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(11) NOT NULL,
  `institute_name` varchar(255) NOT NULL,
  `institute_email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(50) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `translation` varchar(20) NOT NULL,
  `footer_text` text NOT NULL,
  `animations` varchar(50) NOT NULL,
  `timezone` varchar(30) NOT NULL,
  `date_format` varchar(20) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `facebook_url` varchar(255) NOT NULL,
  `twitter_url` varchar(255) NOT NULL,
  `linkedin_url` varchar(255) NOT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `institute_name`, `institute_email`, `address`, `mobileno`, `currency`, `currency_symbol`, `translation`, `footer_text`, `animations`, `timezone`, `date_format`, `facebook_url`, `twitter_url`, `linkedin_url`, `youtube_url`, `created_at`, `updated_at`) VALUES
(1, 'Clinic System', 'kristi@example.com', '', '', 'USD', '$', 'english', '© 2022 Clinic System - Developed by Kristi', 'fadeInUp', 'Europe/Berlin', '%Y/%m/%d', '', '', '', '', '2022-12-03 15:07:49', '2022-12-03 15:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `labtest_bill`
--

CREATE TABLE `labtest_bill` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(10) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `referral_id` int(11) NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `commission` decimal(18,2) DEFAULT 0.00,
  `paid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `due` decimal(18,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL,
  `date` date DEFAULT NULL,
  `hash` varchar(50) NOT NULL,
  `prepared_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `labtest_bill_details`
--

CREATE TABLE `labtest_bill_details` (
  `id` int(11) NOT NULL,
  `labtest_bill_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `commission_amount` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `labtest_payment_history`
--

CREATE TABLE `labtest_payment_history` (
  `id` int(11) NOT NULL,
  `labtest_bill_id` int(11) NOT NULL,
  `collect_by` int(11) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `method_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `paid_on` date NOT NULL,
  `coll_type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `labtest_report`
--

CREATE TABLE `labtest_report` (
  `id` int(11) NOT NULL,
  `labtest_bill_id` int(11) NOT NULL,
  `reporting_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `report_description` longtext DEFAULT NULL,
  `report_remarks` text DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lab_report_template`
--

CREATE TABLE `lab_report_template` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `template` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lab_test`
--

CREATE TABLE `lab_test` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `patient_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `production_cost` decimal(18,2) NOT NULL DEFAULT 0.00,
  `test_code` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lab_test_category`
--

CREATE TABLE `lab_test_category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `word` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `english` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bengali` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `arabic` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `german` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `greek` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `spanish` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `french` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `hindi` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `hungarian` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `indonesian` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `italian` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `japanese` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `korean` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `latin` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `dutch` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `portuguese` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `russian` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thai` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `turkish` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `urdu` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chinese` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `german`, `greek`, `spanish`, `french`, `hindi`, `hungarian`, `indonesian`, `italian`, `japanese`, `korean`, `latin`, `dutch`, `portuguese`, `russian`, `thai`, `turkish`, `urdu`, `chinese`) VALUES
(1, 'dashboard', 'Dashboard', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 'create', 'Create', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 'patient', 'Patient', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 'test', 'Test', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 'bill', 'Bill', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, 'commission', 'Commission', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, 'withdrawal', 'Withdrawal', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, 'appointment', 'Appointment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 'voucher', 'Voucher', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(10, 'income_vs_expense', 'Income Vs Expense', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(11, 'search', 'Search', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(12, 'visit_home_page', 'Visit Home Page', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(13, 'language', 'Language', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(14, 'logout', 'Logout', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(15, 'profile', 'Profile', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(16, 'reset_password', 'Reset Password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(17, 'global', 'Global', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(18, 'settings', 'Settings', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, 'frontend', 'Frontend', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(20, 'setting', 'Setting', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(21, 'menu', 'Menu', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(22, 'page', 'Page', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(23, 'section', 'Section', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(24, 'manage', 'Manage', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, 'slider', 'Slider', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, 'features', 'Features', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, 'testimonial', 'Testimonial', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(28, 'service', 'Service', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(29, 'faq', 'Faq', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(30, 'details', 'Details', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(31, 'list', 'List', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(32, 'category', 'Category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(33, 'login_deactivate', 'Login Deactivate', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(34, 'inventory', 'Inventory', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(35, 'chemical', 'Chemical', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(36, 'supplier', 'Supplier', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(37, 'unit', 'Unit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(38, 'purchase', 'Purchase', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(39, 'stock', 'Stock', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(40, 'reagent', 'Reagent', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(41, 'assigned', 'Assigned', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(42, 'reports', 'Reports', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(43, 'report', 'Report', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(44, 'payment', 'Payment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(45, 'schedule', 'Schedule', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(46, 'add', 'Add', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(47, 'requested_list', 'Requested List', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(48, 'employee', 'Employee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(49, 'department', 'Department', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(50, 'designation', 'Designation', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(51, 'hrm', 'Human Resource', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(52, 'payroll', 'Payroll', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(53, 'salary', 'Salary', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(54, 'template', 'Template', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(55, 'assign', 'Assign', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(56, 'summary', 'Summary', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(57, 'leaves', 'Leaves', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(58, 'my_leave', 'My Leave', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(59, 'leave_manage', 'Leave Manage', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(60, 'attendance', 'Attendance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(61, 'set', 'Set', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(62, 'pathology', 'Pathology', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(63, 'lab', 'Lab', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(64, 'refer_manager', 'Refer Manager', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(65, 'referral', 'Referral', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(66, 'my_commission', 'My Commission', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(67, 'statement', 'Statement', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(68, 'payout', 'Payout', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(69, 'office_accounting', 'Office Accounting', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(70, 'account', 'Account', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(71, 'head', 'Head', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(72, 'income', 'Income', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(73, 'repots', 'Repots', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(74, 'expense', 'Expense', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(75, 'transitions', 'Transitions', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(76, 'balance', 'Balance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(77, 'sheet', 'Sheet', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(78, 'billing', 'Billing', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(79, 'due', 'Due', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(80, 'paid', 'Paid', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(81, 'collect', 'Collect', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(82, 'investigation', 'Investigation', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(83, 'sms', 'Sms', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(84, 'email', 'Email', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(85, 'role', 'Role', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(86, 'permission', 'Permission', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(87, 'database', 'Database', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(88, 'backup', 'Backup', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(89, 'invoice', 'Invoice', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(90, 'today_total', 'Today Total', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(91, 'annual', 'Annual', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(92, 'total_strength', 'Total Strength', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(93, 'doctor', 'Doctor', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(94, 'pending', 'Pending', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(95, 'request', 'Request', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(96, 'fees', 'Fees', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(97, 'net', 'Net', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(98, 'payable', 'Payable', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(99, 'total', 'Total', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(100, 'this_value_is_required', 'This Value Is Required', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(101, 'enter_valid_email', 'Enter Valid Email', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(102, 'are_you_sure', 'Are You Sure', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(103, 'delete_this_information', 'Delete This Information', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(104, 'yes_continue', 'Yes Continue', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(105, 'cancel', 'Cancel', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(106, 'deleted_note', '*Note : This Data Will Be Permanently Deleted', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(107, 'deleted', 'Deleted', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(108, 'information_deleted', 'Information Deleted', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(109, 'website', 'Website', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(110, 'application', 'Application', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(111, 'name', 'Name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(112, 'receive_email_to', 'Receive Email To', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(113, 'captcha_status', 'Captcha Status', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(114, 'select', 'Select', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(115, 'disable', 'Disable', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(116, 'enable', 'Enable', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(117, 'recaptcha_site_key', 'Recaptcha Site Key', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(118, 'recaptcha_secret_key', 'Recaptcha Secret Key', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(119, 'working_hours', 'Working Hours', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(120, 'logo', 'Logo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(121, 'fav_icon', 'Fav Icon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(122, 'address', 'Address', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(123, 'mobile_no', 'Mobile No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(124, 'fax', 'Fax', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(125, 'footer_text', 'Footer Text', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(126, 'facebook_url', 'Facebook Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(127, 'twitter_url', 'Twitter Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(128, 'youtube_url', 'Youtube Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(129, 'google_plus', 'Google Plus', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(130, 'linkedin_url', 'Linkedin Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(131, 'pinterest_url', 'Pinterest Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(132, 'instagram_url', 'Instagram Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(133, 'save', 'Save', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(134, 'website_page', 'Website Page', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(135, 'welcome', 'Welcome', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(136, 'message', 'Message', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(137, 'doctors', 'Doctors', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(138, 'services', 'Services', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(139, 'call_to_action_section', 'Call To Action Section', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(140, 'options', 'Options', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(141, 'title', 'Title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(142, 'subtitle', 'Subtitle', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(143, 'description', 'Description', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(144, 'photo', 'Photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(145, 'cta', 'Cta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(146, 'button_text', 'Button Text', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(147, 'button_url', 'Button Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(148, '_title', ' Title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(149, 'meta', 'Meta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(150, 'keyword', 'Keyword', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(151, 'banner_photo', 'Banner Photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(152, 'about', 'About', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(153, 'content', 'Content', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(154, 'about_photo', 'About Photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(155, 'parallax_photo', 'Parallax Photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(156, 'sl', 'Sl', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(157, 'url', 'Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(158, 'action', 'Action', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(159, 'my_appointment', 'My Appointment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(160, 'appointment_status', 'Appointment Status', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(161, 'date', 'Date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(162, 'time_slot', 'Time Slot', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(163, 'consultation_fees', 'Consultation Fees', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(164, 'discount', 'Discount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(165, 'remarks', 'Remarks', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(166, 'exploring', 'Exploring', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(167, 'no_schedule_found', 'No Schedule Found', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(168, 'information_has_been_saved_successfully', 'Information Has Been Saved Successfully', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(169, 'id', 'Id', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(170, 'consultation', 'Consultation', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(171, 'serial', 'Serial', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(172, 'status', 'Status', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(173, 'confirmed', 'Confirmed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(174, 'available', 'Available', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(175, 'staff_id', 'Staff Id', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(176, 'general', 'General', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(177, 'theme', 'Theme', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(178, 'institute_name', 'Institute Name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(179, 'currency', 'Currency', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(180, 'currency_symbol', 'Currency Symbol', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(181, 'timezone', 'Timezone', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(182, 'date_format', 'Date Format', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(183, 'system_logo', 'System Logo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(184, 'text_logo', 'Text Logo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(185, 'upload', 'Upload', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(186, 'select_ground', 'Select Ground', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(187, 'filter', 'Filter', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(188, 'bill_no', 'Bill No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(189, 'delivery', 'Delivery', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(190, 'lab_test', 'Lab Test', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(191, 'edit', 'Edit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(192, 'code', 'Code', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(193, 'purchase_unit', 'Purchase Unit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(194, 'sale_unit', 'Sale Unit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(195, 'unit_ratio', 'Unit Ratio', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(196, 'purchase_price', 'Purchase Price', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(197, 'sales_price', 'Sales Price', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(198, 'all_select', 'All Select', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(199, 'unpaid', 'Unpaid', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(200, 'partly_paid', 'Partly Paid', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(201, 'total_paid', 'Total Paid', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(202, 'type', 'Type', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(203, 'ref_no', 'Ref No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(204, 'pay_via', 'Pay Via', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(205, 'amount', 'Amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(206, 'dr', 'Dr', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(207, 'cr', 'Cr', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(208, 'ref', 'Ref', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(209, 'attachment', 'Attachment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(210, 'login', 'Login', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(211, 'welcome_to', 'Welcome To', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(212, 'username', 'Username', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(213, 'password', 'Password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(214, 'remember', 'Remember', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(215, 'lose_your_password', 'Lose Your Password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(216, 'position', 'Position', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(217, 'publish', 'Publish', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(218, 'target_new_window', 'Target New Window', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(219, 'external_url', 'External Url', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(220, 'external_link', 'External Link', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(221, 'successfully', 'Successfully', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(222, 'access_denied', 'Access Denied', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(223, 'username_has_already_been_used', 'Username Has Already Been Used', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(224, 'week_day', 'Week Day', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(225, 'time_start', 'Time Start', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(226, 'time_end', 'Time End', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(227, 'per_patient_duration', 'Per Patient Duration', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(228, 'make_closed', 'Make Closed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(229, 'the_consultation_completed', 'The Consultation Completed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(230, 'done', 'Done', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(231, 'the_consultation_has_been_closed', 'The Consultation Has Been Closed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(232, 'requested', 'Requested', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(233, 'create_at', 'Create At', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(234, 'canceled', 'Canceled', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(235, 'apply', 'Apply', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(236, 'close', 'Close', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(237, 'information_has_been_updated_successfully', 'Information Has Been Updated Successfully', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(238, 'birthday', 'Birthday', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(239, 'joining_date', 'Joining Date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(240, 'basic_details', 'Basic Details', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(241, 'gender', 'Gender', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(242, 'male', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(243, 'female', 'Female', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(244, 'religion', 'Religion', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(245, 'blood_group', 'Blood Group', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(246, 'marital_status', 'Marital Status', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(247, 'single', 'Single', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(248, 'married', 'Married', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(249, 'profile_picture', 'Profile Picture', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(250, 'login_details', 'Login Details', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(251, 'office_details', 'Office Details', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(252, 'qualification', 'Qualification', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(253, 'social_links', 'Social Links', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(254, 'update', 'Update', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(255, 'patient_id', 'Patient Id', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(256, 'guardian', 'Guardian', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(257, 'authentication', 'Authentication', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(258, 'basic', 'Basic', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(259, 'age', 'Age', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(260, 'blood_pressure', 'Blood Pressure', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(261, 'height', 'Height', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(262, 'weight', 'Weight', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(263, 'emergency_contact', 'Emergency Contact', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(264, 'relationship', 'Relationship', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(265, 'history', 'History', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(266, 'completed', 'Completed', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(267, 'undelivered', 'Undelivered', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(268, 'login_authentication_deactivate', 'Login Authentication Deactivate', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(269, 'deactivate_account', 'Deactivate Account', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(270, 'authentication_activate', 'Authentication Activate', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(271, 'referred_by', 'Referred By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(272, 'time', 'Time', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(273, 'price', 'Price', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(274, 'add_rows', 'Add Rows', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(275, 'sub_total', 'Sub Total', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(276, 'tax', 'Tax', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(277, 'received', 'Received', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(278, 'enter_payment_amount', 'Enter Payment Amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(279, 'write_your_remarks', 'Write Your Remarks', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(280, 'roles', 'Roles', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(281, 'system_role', 'System Role', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(282, 'yes', 'Yes', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(283, 'role_permission_for', 'Role Permission For', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(284, 'feature', 'Feature', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(285, 'view', 'View', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(286, 'delete', 'Delete', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(287, 'ordered', 'Ordered', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(288, 'quantity', 'Quantity', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(289, 'net_total', 'Net Total', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(290, 'bill_view', 'Bill View', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(291, 'add_payment', 'Add Payment', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(292, 'to', 'To', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(293, 'company', 'Company', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(294, 'sub', 'Sub', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(295, 'paid_amount', 'Paid Amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(296, 'prepared_by', 'Prepared By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(297, 'authorised_by', 'Authorised By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(298, 'print', 'Print', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(299, 'paid_on', 'Paid On', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(300, 'attach_document', 'Attach Document', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(301, 'the_configuration_has_been_updated', 'The Configuration Has Been Updated', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(302, 'retype_password', 'Retype Password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(303, 'contact_number', 'Contact Number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(304, 'company_name', 'Company Name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(305, 'product', 'Product', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(306, 'stock_by', 'Stock By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(307, 'inovice_no', 'Inovice No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(308, 'sales_unit', 'Sales Unit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(309, 'for', 'For', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(310, 'select_multiple_chemical', 'Select Multiple Chemical', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(311, 'payment_history', 'Payment History', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(312, 'sex', 'Sex', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(313, 'from', 'From', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(314, 'net_payable', 'Net Payable', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(315, 'collect_by', 'Collect By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(316, 'unpublished_on_website', 'Unpublished On Website', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(317, 'published_on_website', 'Published On Website', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(318, 'grade', 'Grade', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(319, 'overtime', 'Overtime', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(320, 'allowances', 'Allowances', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(321, 'name_of_allowance', 'Name Of Allowance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(322, 'deductions', 'Deductions', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(323, 'name_of_deductions', 'Name Of Deductions', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(324, 'allowance', 'Allowance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(325, 'deduction', 'Deduction', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(326, 'salary_details', 'Salary Details', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(327, 'no_information_available', 'No Information Available', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(328, 'transactions', 'Transactions', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(329, 'sms_config', 'Sms Config', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(330, 'sms_template', 'Sms Template', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(331, 'select_a_sms_service', 'Select A Sms Service', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(332, 'disabled', 'Disabled', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(333, 'clickatell_username', 'Clickatell Username', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(334, 'clickatell_password', 'Clickatell Password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(335, 'clickatell_api_key', 'Clickatell Api Key', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(336, 'registered_number', 'Registered Number', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(337, 'account_sid', 'Account Sid', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(338, 'auth_token', 'Auth Token', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(339, 'account_registered', 'Account Registered', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(340, 'notify_enable', 'Notify Enable', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(341, 'body', 'Body', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(342, 'appointment_confirmation', 'Appointment Confirmation', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(343, 'appointment_canceled', 'Appointment Canceled', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(344, 'appointment_request', 'Appointment Request', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(345, 'reporting', 'Reporting', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(346, 'button_text_1', 'Button Text 1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(347, 'button_url_1', 'Button Url 1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(348, 'button_text_2', 'Button Text 2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(349, 'button_url_2', 'Button Url 2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(350, 'left', 'Left', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(351, 'center', 'Center', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(352, 'right', 'Right', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(353, 'icon', 'Icon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(354, 'surname', 'Surname', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(355, 'rank', 'Rank', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(356, 'staff', 'Staff', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(357, 'paid_by', 'Paid By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(358, 'user', 'User', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(359, 'payslip', 'Payslip', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(360, 'add_employee', 'Add Employee', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(361, 'bank_details', 'Bank Details', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(362, 'skipped_bank_details', 'Skipped Bank Details', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(363, 'bank_name', 'Bank Name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(364, 'holder_name', 'Holder Name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(365, 'bank', 'Bank', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(366, 'branch', 'Branch', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(367, 'ifsc_code', 'Ifsc Code', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(368, 'account_no', 'Account No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(369, 'restore', 'Restore', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(370, 'create_backup', 'Create Backup', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(371, 'file', 'File', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(372, 'backup_size', 'Backup Size', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(373, 'file_upload', 'File Upload', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(374, 'flag', 'Flag', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(375, 'stats', 'Stats', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(376, 'created_at', 'Created At', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(377, 'updated_at', 'Updated At', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(378, 'edit_word', 'Edit Word', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(379, 'flag_icon', 'Flag Icon', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(380, 'language_unpublished', 'Language Unpublished', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(381, 'language_published', 'Language Published', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(382, 'transaction', 'Transaction', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(383, 'month_of_salary', 'Month Of Salary', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(384, 'basic_salary', 'Basic Salary', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(385, 'payment_type', 'Payment Type', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(386, 'bank_account', 'Bank Account', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(387, 'actions', 'Actions', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(388, 'document', 'Document', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(389, 'download', 'Download', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(390, 'opening_balance', 'Opening Balance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(391, 'total_dr', 'Total Dr', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(392, 'total_cr', 'Total Cr', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(393, 'contact', 'Contact', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(394, 'box_title', 'Box Title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(395, 'box_description', 'Box Description', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(396, 'box_photo', 'Box Photo', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(397, 'form_title', 'Form Title', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(398, 'phone', 'Phone', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(399, 'submit_button_text', 'Submit Button Text', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(400, 'map_iframe', 'Map Iframe', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(401, 'system_name', 'System Name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(402, 'month', 'Month', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(403, 'patient_price', 'Patient Price', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(404, 'production_cost', 'Production Cost', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(405, 'created_by', 'Created By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(406, 'test_category', 'Test Category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(407, 'test_name', 'Test Name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(408, 'test_code', 'Test Code', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(409, 'staff_name', 'Staff Name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(410, 'percentage', 'Percentage', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(411, 'salary_assign', 'Salary Assign', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(412, 'pay_now', 'Pay Now', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(413, 'overtime_total_hour', 'Overtime Total Hour', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(414, 'overtime_amount', 'Overtime Amount', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(415, 'leave_category', 'Leave Category', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(416, 'days', 'Days', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(417, 'leave', 'Leave', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(418, 'date_of_start', 'Date Of Start', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(419, 'date_of_end', 'Date Of End', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(420, 'leave_type', 'Leave Type', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(421, 'reason', 'Reason', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(422, 'comments', 'Comments', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(423, 'accepted', 'Accepted', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(424, 'start_date', 'Start Date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(425, 'end_date', 'End Date', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(426, 'approved', 'Approved', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(427, 'reject', 'Reject', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(428, 'select_all', 'Select All', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(429, 'not_selected', 'Not Selected', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(430, 'present', 'Present', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(431, 'absent', 'Absent', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(432, 'holiday', 'Holiday', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(433, 'late', 'Late', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(434, 'current_balance', 'Current Balance', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(435, 'no', 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(436, 'current', 'Current', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(437, 'qty', 'Qty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(438, 'payment_successfull', 'Payment Successfull', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(439, 'payment_by', 'Payment By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(440, 'chemical_wise_stock', 'Chemical Wise Stock', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(441, 'sale', 'Sale', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(442, 'in_qty', 'In Qty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `languages` (`id`, `word`, `english`, `bengali`, `arabic`, `german`, `greek`, `spanish`, `french`, `hindi`, `hungarian`, `indonesian`, `italian`, `japanese`, `korean`, `latin`, `dutch`, `portuguese`, `russian`, `thai`, `turkish`, `urdu`, `chinese`) VALUES
(443, 'out_qty', 'Out Qty', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(444, 'sale_profit', 'Sale Profit', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(445, 'paid_via', 'Paid Via', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(446, 'collected_by', 'Collected By', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(447, 'all', 'All', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(448, 'add_short_bio', 'Add Short Bio', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(449, 'email_config', 'Email Config', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(450, 'email_triggers', 'Email Triggers', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(451, 'system_email', 'System Email', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(452, 'subject', 'Subject', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(453, 'forgot_password', 'Forgot Password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(454, 'payslip_generated', 'Payslip Generated', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(455, 'leave_approve', 'Leave Approve', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(456, 'leave_reject', 'Leave Reject', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(457, 'username_password_incorrect', 'Username Password Incorrect', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(458, 'password_restoration', 'Password Restoration', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(459, 'forgot', 'Forgot', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(460, 'back_to_login', 'Back To Login', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(461, 'password_rostoration', 'Password Rostoration', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(462, 'change', 'Change', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(463, 'current_password', 'Current Password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(464, 'new_password', 'New Password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(465, 'confirm_password', 'Confirm Password', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `language_list`
--

CREATE TABLE `language_list` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lang_field` varchar(100) NOT NULL,
  `status` varchar(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language_list`
--

INSERT INTO `language_list` (`id`, `name`, `lang_field`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'english', '1', '2022-12-03 17:36:31', '2022-12-03 11:45:23'),
(2, 'Bengali', 'bengali', '0', '2022-12-03 17:36:31', '2022-12-03 18:11:42'),
(3, 'Arabic', 'arabic', '0', '2022-12-03 17:36:31', '2022-12-03 13:22:02'),
(4, 'German', 'german', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:26'),
(5, 'Greek', 'greek', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:28'),
(6, 'Spanish', 'spanish', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:29'),
(7, 'French', 'french', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:31'),
(8, 'Hindi', 'hindi', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:33'),
(9, 'Hungarian', 'hungarian', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:34'),
(10, 'Indonesian', 'indonesian', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:35'),
(11, 'Italian', 'italian', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:37'),
(12, 'Japanese', 'japanese', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:38'),
(13, 'Korean', 'korean', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:40'),
(14, 'Latin', 'latin', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:41'),
(15, 'Dutch', 'dutch', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:43'),
(16, 'Portuguese', 'portuguese', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:44'),
(17, 'Russian', 'russian', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:46'),
(18, 'Thai', 'thai', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:47'),
(19, 'Turkish', 'turkish', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:49'),
(20, 'Urdu', 'urdu', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:50'),
(21, 'Chinese', 'chinese', '0', '2022-12-03 17:36:31', '2022-12-03 03:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `leave_application`
--

CREATE TABLE `leave_application` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `category_id` varchar(20) NOT NULL,
  `reason` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `leave_days` varchar(20) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL DEFAULT '1',
  `apply_date` datetime NOT NULL,
  `orig_file_name` varchar(255) NOT NULL,
  `enc_file_name` varchar(255) NOT NULL,
  `approved_by` longtext NOT NULL,
  `comments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leave_category`
--

CREATE TABLE `leave_category` (
  `id` int(2) NOT NULL,
  `name` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_credential`
--

CREATE TABLE `login_credential` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role` int(11) NOT NULL,
  `active` int(11) NOT NULL COMMENT '1(active) 0(deactivate)',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_credential`
--

INSERT INTO `login_credential` (`id`, `user_id`, `username`, `password`, `role`, `active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 1, 'kristi', '$2y$10$fmX8MNX7wcwDWaBe.snniu1lucXUzEqVy/TiAFE9zRq2ZQLHBYJhe', 1, 1, '2022-12-05 18:04:27', '2022-11-30 20:38:35', '2022-12-05 18:04:27'),
(2, 2, 'kevidoc', '$2y$10$YTgO6usfWIujGYLhJLxweerczFEPl1SRW2KGsUVE3ZUsDYqQiE00i', 3, 1, NULL, '2022-11-30 21:47:39', '2022-11-30 21:47:39'),
(3, 1, 'patient', '$2y$10$kbyEQ0oTngXsXD2o0y1E6uubq5jbmYXalO6JTDTu2kmqIi4A2Mmv.', 7, 1, NULL, '2022-11-30 21:52:08', '2022-11-30 21:52:08'),
(4, 3, 'kris', '$2y$10$XS8EKNVkNGUqhrY6sAFZLub4a7gxfQwdi7Fzodr2mZv.rm80mttau', 3, 1, NULL, '2022-12-04 00:56:23', '2022-12-04 00:56:23'),
(5, 2, 'testfinal', '$2y$10$nn4vvufSxMXM5DLd0z5GUO2bD/lC93VMrSfRUjHXPyF06JBWMh31S', 7, 1, '2022-12-05 18:54:12', '2022-12-04 18:33:32', '2022-12-05 18:54:12');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `patient_id` varchar(10) NOT NULL,
  `category_id` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `sex` varchar(10) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `blood_pressure` varchar(100) NOT NULL,
  `height` varchar(10) NOT NULL,
  `weight` varchar(10) NOT NULL,
  `marital_status` varchar(10) NOT NULL,
  `age` varchar(10) DEFAULT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(30) NOT NULL,
  `email` varchar(200) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `guardian` varchar(200) NOT NULL,
  `relationship` varchar(200) NOT NULL,
  `gua_mobileno` varchar(30) NOT NULL,
  `source` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `patient_id`, `category_id`, `birthday`, `sex`, `blood_group`, `blood_pressure`, `height`, `weight`, `marital_status`, `age`, `address`, `mobileno`, `email`, `photo`, `guardian`, `relationship`, `gua_mobileno`, `source`, `created_at`, `updated_at`) VALUES
(1, 'Kev', 'b55d5eb', 0, '2022-11-10', 'male', '', '', '', '', '', '0', '', '+355694455666', 'patient@gmail.com', NULL, '', '', '', 2, '2022-11-30 21:52:07', '2022-11-30 21:52:07'),
(2, 'test final', 'f079533', 0, '1984-06-06', 'male', '', '', '', '', '', '38', '', '+355694455777', 'knn@gmail.com', NULL, '', '', '', 2, '2022-12-04 18:33:32', '2022-12-04 18:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `patient_category`
--

CREATE TABLE `patient_category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patient_documents`
--

CREATE TABLE `patient_documents` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `remarks` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payout_commission`
--

CREATE TABLE `payout_commission` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `bill_no` varchar(11) NOT NULL,
  `before_payout` decimal(18,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `pay_via` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `paid_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payslip`
--

CREATE TABLE `payslip` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `month` varchar(20) DEFAULT NULL,
  `year` varchar(20) NOT NULL,
  `basic_salary` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total_allowance` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total_deduction` decimal(18,2) NOT NULL DEFAULT 0.00,
  `net_salary` decimal(18,2) NOT NULL DEFAULT 0.00,
  `bill_no` varchar(25) NOT NULL,
  `remarks` text NOT NULL,
  `pay_via` tinyint(1) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `paid_by` int(11) NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payslip_details`
--

CREATE TABLE `payslip_details` (
  `id` int(11) NOT NULL,
  `payslip_id` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `type` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `prefix` varchar(100) NOT NULL,
  `show_view` tinyint(2) DEFAULT 1,
  `show_add` tinyint(2) DEFAULT 1,
  `show_edit` tinyint(2) DEFAULT 1,
  `show_delete` tinyint(2) DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `module_id`, `name`, `prefix`, `show_view`, `show_add`, `show_edit`, `show_delete`, `created_at`) VALUES
(1, 2, 'Patient', 'patient', 1, 1, 1, 1, '2022-12-03 16:28:52'),
(2, 2, 'Patient Category', 'patient_category', 1, 1, 1, 1, '2022-12-03 16:28:52'),
(3, 6, 'Employee', 'employee', 1, 1, 1, 1, '2022-12-03 16:28:52'),
(4, 6, 'Department', 'department', 1, 1, 1, 1, '2022-12-03 16:28:52'),
(5, 6, 'Designation', 'designation', 1, 1, 1, 1, '2022-12-03 16:28:52'),
(6, 6, 'Login Deactivate', 'employee_disable_authentication', 1, 0, 1, 0, '2022-12-03 23:56:59'),
(7, 7, 'Salary Template', 'salary_template', 1, 1, 1, 1, '2022-12-03 17:09:28'),
(8, 7, 'Salary Assign', 'salary_assign', 1, 1, 0, 0, '2022-12-03 17:09:34'),
(9, 8, 'Lab Test', 'lab_test', 1, 1, 1, 1, '2022-12-03 16:28:52'),
(10, 8, 'Test Category', 'test_category', 1, 1, 1, 1, '2022-12-03 16:28:53'),
(11, 12, 'Test Report', 'test_report', 1, 1, 1, 0, '2022-12-03 16:28:53'),
(12, 12, 'Test Report Template', 'test_report_template', 1, 1, 1, 1, '2022-12-03 16:28:53'),
(13, 11, 'Lab Test Bill', 'lab_test_bill', 1, 1, 0, 1, '2022-12-03 23:12:14'),
(14, 11, 'Test Bill Report', 'test_bill_report', 1, 0, 0, 0, '2022-12-03 23:12:28'),
(15, 11, 'Test Bill Payment', 'test_bill_payment', 1, 1, 0, 0, '2022-12-03 23:12:28'),
(16, 9, 'Referral Assign', 'referral_assign', 1, 1, 1, 1, '2022-12-03 23:34:50'),
(17, 9, 'Commission Withdrawal', 'commission_withdrawal', 1, 1, 0, 1, '2022-12-03 23:34:59'),
(18, 9, 'Referral Reports', 'referral_reports', 1, 0, 0, 0, '2022-12-03 23:35:02'),
(19, 2, 'Login Deactivate', 'patient_disable_authentication', 1, 0, 1, 0, '2022-12-03 16:28:52'),
(20, 3, 'Purchase Payment', 'purchase_payment', 1, 1, 0, 0, '2022-12-03 01:02:18'),
(21, 13, 'Global Setting', 'global_setting', 1, 1, 0, 0, '2022-12-03 02:28:04'),
(22, 13, 'Email Setting', 'email_setting', 1, 1, 0, 0, '2022-12-03 12:42:40'),
(23, 13, 'Language', 'language', 1, 1, 1, 1, '2022-12-03 01:10:08'),
(24, 13, 'Database Backup', 'database_backup', 1, 1, 0, 1, '2022-12-03 12:54:40'),
(25, 13, 'Database Restore', 'database_restore', 0, 1, 0, 0, '2022-12-03 13:07:49'),
(26, 7, 'Salary Payment', 'salary_payment', 1, 1, 0, 0, '2022-12-03 14:27:03'),
(27, 7, 'Salary Summary Report', 'salary_summary_report', 1, 0, 0, 0, '2022-12-03 19:46:17'),
(28, 7, 'Leave Category', 'leave_category', 1, 1, 1, 1, '2022-12-03 01:12:59'),
(29, 7, 'My Leave', 'my_leave', 1, 1, 0, 1, '2022-12-03 21:01:42'),
(30, 7, 'Leave Manage', 'leave_manage', 1, 1, 0, 1, '2022-12-03 14:40:20'),
(31, 7, 'Staff Attendance', 'staff_attendance', 1, 1, 0, 0, '2022-12-03 01:53:37'),
(32, 10, 'Account', 'account', 1, 1, 1, 1, '2022-12-03 16:58:38'),
(33, 10, 'Voucher', 'voucher', 1, 1, 1, 1, '2022-12-03 01:17:14'),
(34, 10, 'Voucher Head', 'voucher_head', 1, 1, 1, 1, '2022-12-03 19:00:33'),
(35, 10, 'Accounting Reports', 'accounting_reports', 1, 0, 0, 0, '2022-12-03 20:56:59'),
(36, 4, 'Schedule', 'schedule', 1, 1, 1, 1, '2022-12-03 05:47:17'),
(37, 5, 'Appointment', 'appointment', 1, 1, 1, 1, '2022-12-03 05:56:41'),
(38, 5, 'Appointment Request', 'appointment_request', 1, 0, 1, 1, '2022-12-03 16:21:02'),
(39, 1, 'Today Invoice Widget', 'today_invoice_widget', 1, 0, 0, 0, '2022-12-03 00:02:40'),
(40, 1, 'Today Commission Widget', 'today_commission_widget', 1, 0, 0, 0, '2022-12-03 00:02:40'),
(41, 1, 'Today Income Widget', 'today_income_widget', 1, 0, 0, 0, '2022-12-03 00:02:40'),
(42, 1, 'Today Expense Widget', 'today_expense_widget', 1, 0, 0, 0, '2022-12-03 00:02:40'),
(43, 1, 'Annual Income Vs Expense Chart', 'annual_income_vs_expense_chart', 1, 0, 0, 0, '2022-12-03 00:27:47'),
(44, 1, 'Patient Count Widget', 'patient_count_widget', 1, 0, 0, 0, '2022-12-03 00:38:33'),
(45, 1, 'Doctor Count Widget', 'doctor_count_widget', 1, 0, 0, 0, '2022-12-03 00:38:33'),
(46, 1, 'Employee Count Widget', 'employee_count_widget', 1, 0, 0, 0, '2022-12-03 00:38:33'),
(47, 1, 'Appointment Count Widget', 'appointment_count_widget', 1, 0, 0, 0, '2022-12-03 00:38:33'),
(48, 1, 'Pathology Fees Summary Chart', 'pathology_fees_summary_chart', 1, 0, 0, 0, '2022-12-03 00:48:28'),
(49, 14, 'Frontend Setting', 'frontend_setting', 1, 1, 0, 0, '2022-12-03 03:24:07'),
(50, 14, 'Frontend Menu', 'frontend_menu', 1, 1, 1, 1, '2022-12-03 04:03:39'),
(51, 14, 'Frontend Section', 'frontend_section', 1, 1, 0, 0, '2022-12-03 04:26:11'),
(52, 14, 'Manage Page', 'manage_page', 1, 1, 1, 1, '2022-12-03 05:54:08'),
(53, 14, 'Frontend Slider', 'frontend_slider', 1, 1, 1, 1, '2022-12-03 06:12:31'),
(54, 14, 'Frontend Features', 'frontend_features', 1, 1, 1, 1, '2022-12-03 06:47:51'),
(55, 14, 'Frontend Testimonial', 'frontend_testimonial', 1, 1, 1, 1, '2022-12-03 06:54:30'),
(56, 14, 'Frontend Services', 'frontend_services', 1, 1, 1, 1, '2022-12-03 07:01:44'),
(57, 14, 'Frontend Faq', 'frontend_faq', 1, 1, 1, 1, '2022-12-03 07:06:16'),
(58, 13, 'Sms Setting', 'sms_setting', 1, 1, 0, 0, '2022-12-03 11:41:37'),
(59, 14, 'Doctor Short Bio', 'doctor_short_bio', 0, 1, 0, 0, '2022-12-03 20:13:12'),
(60, 1, 'Appointment Status Chart', 'appointment_status_chart', 1, 0, 0, 0, '2022-12-03 00:48:28'),
(61, 9, 'My Commission', 'my_commission', 1, 0, 0, 0, '2022-12-03 00:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `permission_modules`
--

CREATE TABLE `permission_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `system` tinyint(1) NOT NULL,
  `sorted` tinyint(10) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_modules`
--

INSERT INTO `permission_modules` (`id`, `name`, `prefix`, `system`, `sorted`, `created_at`) VALUES
(1, 'Dashboard', 'dashboard', 1, 1, '2022-12-03 04:23:00'),
(2, 'Patient Details', 'patient_details', 1, 3, '2022-12-03 04:23:00'),
(4, 'Schedule', 'schedule', 1, 5, '2022-12-03 04:23:00'),
(5, 'Appointment', 'appointment', 1, 6, '2022-12-03 04:23:00'),
(6, 'Employee', 'employee', 1, 7, '2022-12-03 04:23:00'),
(7, 'Human Resources', 'human_resources', 1, 8, '2022-12-03 04:23:00'),
(8, 'Pathology', 'test_manager', 1, 9, '2022-12-03 04:23:00'),
(9, 'Refer Manager', 'refer_manager', 1, 10, '2022-12-03 04:23:00'),
(10, 'Office Accounting', 'office_accounting', 1, 11, '2022-12-03 04:23:00'),
(11, 'Pathology Billing', 'billing', 1, 12, '2022-12-03 04:23:00'),
(12, 'Investigation Report', 'investigation_report', 1, 13, '2022-12-03 04:23:00'),
(13, 'Settings', 'settings', 1, 14, '2022-12-03 04:23:00'),
(14, 'Website', 'website', 1, 2, '2022-12-03 04:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill`
--

CREATE TABLE `purchase_bill` (
  `id` int(11) NOT NULL,
  `bill_no` varchar(200) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `paid` decimal(18,2) NOT NULL DEFAULT 0.00,
  `due` decimal(18,2) NOT NULL DEFAULT 0.00,
  `payment_status` int(11) NOT NULL,
  `purchase_status` int(11) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `prepared_by` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_bill_details`
--

CREATE TABLE `purchase_bill_details` (
  `id` int(11) NOT NULL,
  `purchase_bill_id` int(11) NOT NULL,
  `chemical_id` varchar(20) NOT NULL,
  `unit_price` decimal(18,2) NOT NULL DEFAULT 0.00,
  `quantity` varchar(20) NOT NULL,
  `discount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payment_history`
--

CREATE TABLE `purchase_payment_history` (
  `id` int(11) NOT NULL,
  `purchase_bill_id` varchar(11) NOT NULL,
  `payment_by` int(11) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `pay_via` varchar(25) NOT NULL,
  `remarks` text NOT NULL,
  `attach_orig_name` varchar(255) DEFAULT NULL,
  `attach_file_name` varchar(255) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `coll_type` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `referral_commission`
--

CREATE TABLE `referral_commission` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `percentage` varchar(10) NOT NULL,
  `assign_by` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `key` longtext NOT NULL,
  `username` varchar(100) NOT NULL,
  `login_credential_id` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `is_system` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `prefix`, `is_system`) VALUES
(1, 'Super Admin', 'superadmin', '1'),
(2, 'Admin', 'admin', '1'),
(3, 'Doctor', 'doctor', '1'),
(4, 'Accountant', 'accountant', '1'),
(5, 'Laboratorist', 'laboratorist', '1'),
(6, 'Receptionist', 'receptionist', '1'),
(7, 'Patient', 'patient', '1');

-- --------------------------------------------------------

--
-- Table structure for table `salary_template`
--

CREATE TABLE `salary_template` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `basic_salary` decimal(18,2) NOT NULL DEFAULT 0.00,
  `overtime_salary` varchar(100) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_template_details`
--

CREATE TABLE `salary_template_details` (
  `id` int(11) NOT NULL,
  `salary_template_id` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `type` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `day` varchar(100) NOT NULL,
  `doctor_id` varchar(11) NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `per_patient_time` varchar(50) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `consultation_fees` decimal(18,2) DEFAULT 0.00,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `day`, `doctor_id`, `time_start`, `time_end`, `per_patient_time`, `active`, `consultation_fees`, `created_at`, `updated_at`) VALUES
(1, 'Monday', '2', '08:00:00', '16:00:00', '30', 1, '0.00', '2022-11-30 21:50:22', '2022-12-04 18:51:52'),
(2, 'Tuesday', '2', '08:00:00', '16:00:00', '30', 1, '0.00', '2022-12-04 18:30:14', '2022-12-04 18:52:08'),
(3, 'Thursday', '2', '08:00:00', '16:00:00', '30', 1, '0.00', '2022-12-04 18:30:59', '2022-12-04 18:52:28'),
(4, 'Wednesday', '2', '08:00:00', '16:00:00', '30', 1, '0.00', '2022-12-04 18:32:01', '2022-12-04 18:52:42'),
(5, 'Friday', '2', '08:00:00', '16:00:00', '30', 1, '0.00', '2022-12-04 18:32:29', '2022-12-04 18:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `sms_config`
--

CREATE TABLE `sms_config` (
  `id` int(11) NOT NULL,
  `clickatell_username` varchar(255) NOT NULL,
  `clickatell_password` varchar(255) NOT NULL,
  `clickatell_api_key` varchar(255) NOT NULL,
  `clickatell_number` varchar(255) NOT NULL,
  `twilio_account_sid` varchar(255) NOT NULL,
  `twilio_auth_token` varchar(255) NOT NULL,
  `twilio_number` varchar(255) NOT NULL,
  `active_gateway` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_config`
--

INSERT INTO `sms_config` (`id`, `clickatell_username`, `clickatell_password`, `clickatell_api_key`, `clickatell_number`, `twilio_account_sid`, `twilio_auth_token`, `twilio_number`, `active_gateway`) VALUES
(1, '', '', '', '', '', '', '', 'disabled');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int(11) NOT NULL,
  `sms_type` varchar(200) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `template_body` longtext NOT NULL,
  `tags` longtext NOT NULL,
  `notified` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `sms_type`, `subject`, `template_body`, `tags`, `notified`) VALUES
(1, 'account_registered', '', '', '{institute_name}, {name}, {username}, {password}, {user_role}, {login_url}', 0),
(2, 'appointment_confirmation', '', '', '{institute_name}, {patient_name}, {doctor_name}, {appointment_id}, {schedule_time}, {appointment_date}', 0),
(3, 'appointment_canceled', '', '', '{institute_name}, {patient_name}, {doctor_name}, {appointment_id}, {schedule_time}, {appointment_date}', 0),
(4, 'appointment_request', '', '', '{institute_name}, {patient_name}, {doctor_name}, {appointment_id}, {schedule_time}, {appointment_date}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` int(11) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `designation` int(11) NOT NULL,
  `joining_date` date NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(12) NOT NULL,
  `religion` varchar(200) NOT NULL,
  `blood_group` varchar(11) NOT NULL,
  `marital_status` varchar(10) NOT NULL,
  `address` mediumtext NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(200) NOT NULL,
  `mobileno` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `salary_template_id` int(11) DEFAULT 0,
  `photo` varchar(255) DEFAULT NULL,
  `nid` varchar(200) NOT NULL,
  `facebook_url` varchar(255) NOT NULL,
  `linkedin_url` varchar(255) NOT NULL,
  `twitter_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff_id`, `name`, `department`, `qualification`, `designation`, `joining_date`, `birthday`, `gender`, `religion`, `blood_group`, `marital_status`, `address`, `state`, `city`, `mobileno`, `email`, `salary_template_id`, `photo`, `nid`, `facebook_url`, `linkedin_url`, `twitter_url`, `created_at`, `updated_at`) VALUES
(1, 'b99aab0', 'Kristi', 0, '', 0, '2022-11-30', '0000-00-00', '', '', '', '', '', '', '', '+355694455696', 'kristi@gmail.com', 0, 'a7967b0893350d0ef277bcb32c3e50b0.jpg', '', '', '', '', '2022-11-30 20:38:35', '2022-12-05 18:57:57'),
(2, 'd4a8f1c', 'Jena Doctor', 1, 'Great Doctor', 1, '2022-11-30', '1984-06-06', 'male', '', 'A+', '2', 'Tirane, Albania', '', '', '+355694455696', 'jena@gmail.com', 0, '859a45001c4358d574cae1135e2312c0.jpg', '', '', '', '', '2022-11-30 21:47:39', '2022-11-30 21:47:39'),
(3, 'd4a3db8', 'John Doctor', 1, 'Brilliant', 1, '2022-12-04', '2000-02-08', 'male', '', 'A+', '1', 'Tirane, Albania', '', '', '+355694455696', 'john@gmail.com', 0, 'b047a2d20cc6c4202abc57db58495c8c.jpg', '', '', '', '', '2022-12-04 00:56:23', '2022-12-04 00:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE `staff_attendance` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(20) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `remark` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_balance`
--

CREATE TABLE `staff_balance` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_balance`
--

INSERT INTO `staff_balance` (`id`, `staff_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 2, '0.00', '2022-11-30 21:47:39', '2022-11-30 21:47:39'),
(2, 3, '0.00', '2022-12-04 00:56:23', '2022-12-04 00:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `staff_bank_account`
--

CREATE TABLE `staff_bank_account` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `holder_name` varchar(255) NOT NULL,
  `bank_branch` varchar(255) NOT NULL,
  `bank_address` varchar(255) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_department`
--

CREATE TABLE `staff_department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_department`
--

INSERT INTO `staff_department` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Klinika Nr 1', '2022-11-30 21:46:01', '2022-11-30 21:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `staff_designation`
--

CREATE TABLE `staff_designation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_designation`
--

INSERT INTO `staff_designation` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Stafi i Diagnozes', '2022-11-30 21:46:17', '2022-11-30 21:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `staff_documents`
--

CREATE TABLE `staff_documents` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` varchar(20) NOT NULL,
  `remarks` text NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `enc_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_privileges`
--

CREATE TABLE `staff_privileges` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_view` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_privileges`
--

INSERT INTO `staff_privileges` (`id`, `role_id`, `permission_id`, `is_add`, `is_edit`, `is_view`, `is_delete`) VALUES
(1, 2, 39, 0, 0, 1, 0),
(2, 2, 40, 0, 0, 1, 0),
(3, 2, 41, 0, 0, 1, 0),
(4, 2, 42, 0, 0, 1, 0),
(5, 2, 43, 0, 0, 1, 0),
(6, 2, 44, 0, 0, 1, 0),
(7, 2, 45, 0, 0, 1, 0),
(8, 2, 46, 0, 0, 1, 0),
(9, 2, 47, 0, 0, 1, 0),
(10, 2, 48, 0, 0, 1, 0),
(11, 2, 49, 1, 0, 1, 0),
(12, 2, 50, 1, 1, 1, 1),
(13, 2, 51, 1, 0, 1, 0),
(14, 2, 52, 1, 1, 1, 1),
(15, 2, 53, 1, 1, 1, 1),
(16, 2, 54, 1, 1, 1, 1),
(17, 2, 55, 1, 1, 1, 1),
(18, 2, 56, 1, 1, 1, 1),
(19, 2, 57, 1, 1, 1, 1),
(20, 2, 59, 1, 0, 0, 0),
(21, 2, 1, 1, 1, 1, 1),
(22, 2, 2, 1, 1, 1, 1),
(23, 2, 19, 0, 1, 1, 0),
(24, 2, 36, 1, 1, 1, 1),
(25, 2, 37, 1, 1, 1, 1),
(26, 2, 38, 0, 1, 1, 1),
(27, 2, 3, 1, 1, 1, 1),
(28, 2, 4, 1, 1, 1, 1),
(29, 2, 5, 1, 1, 1, 1),
(30, 2, 6, 0, 1, 1, 0),
(31, 2, 7, 1, 1, 1, 1),
(32, 2, 8, 1, 0, 1, 0),
(33, 2, 26, 1, 0, 1, 0),
(34, 2, 27, 0, 0, 1, 0),
(35, 2, 28, 1, 1, 1, 1),
(36, 2, 29, 1, 0, 1, 1),
(37, 2, 30, 1, 0, 1, 1),
(38, 2, 31, 1, 0, 1, 0),
(39, 2, 9, 1, 1, 1, 1),
(40, 2, 10, 1, 1, 1, 1),
(41, 2, 16, 1, 1, 1, 1),
(42, 2, 17, 1, 0, 1, 1),
(43, 2, 18, 0, 0, 1, 0),
(44, 2, 32, 1, 1, 1, 1),
(45, 2, 33, 1, 1, 1, 1),
(46, 2, 34, 1, 1, 1, 1),
(47, 2, 35, 0, 0, 1, 0),
(48, 2, 13, 1, 0, 1, 1),
(49, 2, 14, 0, 0, 1, 0),
(50, 2, 15, 1, 0, 1, 0),
(51, 2, 11, 1, 1, 1, 0),
(52, 2, 12, 1, 1, 1, 1),
(53, 2, 21, 1, 0, 1, 0),
(54, 2, 22, 1, 0, 1, 0),
(55, 2, 23, 1, 1, 1, 1),
(56, 2, 24, 1, 0, 1, 1),
(57, 2, 25, 1, 0, 0, 0),
(58, 2, 58, 1, 0, 1, 0),
(59, 3, 39, 0, 0, 0, 0),
(60, 3, 40, 0, 0, 0, 0),
(61, 3, 41, 0, 0, 0, 0),
(62, 3, 42, 0, 0, 0, 0),
(63, 3, 43, 0, 0, 0, 0),
(64, 3, 44, 0, 0, 1, 0),
(65, 3, 45, 0, 0, 1, 0),
(66, 3, 46, 0, 0, 1, 0),
(67, 3, 47, 0, 0, 1, 0),
(68, 3, 48, 0, 0, 0, 0),
(69, 3, 49, 0, 0, 0, 0),
(70, 3, 50, 0, 0, 0, 0),
(71, 3, 51, 0, 0, 0, 0),
(72, 3, 52, 0, 0, 0, 0),
(73, 3, 53, 0, 0, 0, 0),
(74, 3, 54, 0, 0, 0, 0),
(75, 3, 55, 0, 0, 0, 0),
(76, 3, 56, 0, 0, 0, 0),
(77, 3, 57, 0, 0, 0, 0),
(78, 3, 59, 0, 0, 0, 0),
(79, 3, 1, 0, 0, 1, 0),
(80, 3, 2, 0, 0, 0, 0),
(81, 3, 19, 0, 0, 0, 0),
(82, 3, 36, 0, 0, 1, 0),
(83, 3, 37, 0, 0, 1, 0),
(84, 3, 38, 0, 0, 1, 0),
(85, 3, 3, 0, 0, 1, 0),
(86, 3, 4, 0, 0, 0, 0),
(87, 3, 5, 0, 0, 0, 0),
(88, 3, 6, 0, 0, 0, 0),
(89, 3, 7, 0, 0, 0, 0),
(90, 3, 8, 0, 0, 0, 0),
(91, 3, 26, 0, 0, 0, 0),
(92, 3, 27, 0, 0, 0, 0),
(93, 3, 28, 0, 0, 0, 0),
(94, 3, 29, 0, 0, 0, 0),
(95, 3, 30, 0, 0, 0, 0),
(96, 3, 31, 0, 0, 0, 0),
(97, 3, 9, 0, 0, 0, 0),
(98, 3, 10, 0, 0, 0, 0),
(99, 3, 16, 0, 0, 0, 0),
(100, 3, 17, 0, 0, 1, 0),
(101, 3, 18, 0, 0, 0, 0),
(102, 3, 32, 0, 0, 0, 0),
(103, 3, 33, 0, 0, 0, 0),
(104, 3, 34, 0, 0, 0, 0),
(105, 3, 35, 0, 0, 0, 0),
(106, 3, 13, 0, 0, 0, 0),
(107, 3, 14, 0, 0, 0, 0),
(108, 3, 15, 0, 0, 0, 0),
(109, 3, 11, 0, 0, 0, 0),
(110, 3, 12, 0, 0, 0, 0),
(111, 3, 21, 0, 0, 0, 0),
(112, 3, 22, 0, 0, 0, 0),
(113, 3, 23, 0, 0, 0, 0),
(114, 3, 24, 0, 0, 0, 0),
(115, 3, 25, 0, 0, 0, 0),
(116, 3, 58, 0, 0, 0, 0),
(117, 4, 39, 0, 0, 1, 0),
(118, 4, 40, 0, 0, 1, 0),
(119, 4, 41, 0, 0, 1, 0),
(120, 4, 42, 0, 0, 1, 0),
(121, 4, 43, 0, 0, 1, 0),
(122, 4, 44, 0, 0, 1, 0),
(123, 4, 45, 0, 0, 1, 0),
(124, 4, 46, 0, 0, 1, 0),
(125, 4, 47, 0, 0, 0, 0),
(126, 4, 48, 0, 0, 1, 0),
(127, 4, 49, 0, 0, 0, 0),
(128, 4, 50, 0, 0, 0, 0),
(129, 4, 51, 0, 0, 0, 0),
(130, 4, 52, 0, 0, 0, 0),
(131, 4, 53, 0, 0, 0, 0),
(132, 4, 54, 0, 0, 0, 0),
(133, 4, 55, 0, 0, 0, 0),
(134, 4, 56, 0, 0, 0, 0),
(135, 4, 57, 0, 0, 0, 0),
(136, 4, 59, 0, 0, 0, 0),
(137, 4, 1, 1, 1, 1, 1),
(138, 4, 2, 1, 1, 1, 1),
(139, 4, 19, 0, 0, 0, 0),
(140, 4, 36, 0, 0, 0, 0),
(141, 4, 37, 0, 0, 0, 0),
(142, 4, 38, 0, 0, 0, 0),
(143, 4, 3, 0, 0, 1, 0),
(144, 4, 4, 0, 0, 0, 0),
(145, 4, 5, 0, 0, 0, 0),
(146, 4, 6, 0, 0, 0, 0),
(147, 4, 7, 1, 1, 1, 1),
(148, 4, 8, 1, 0, 1, 0),
(149, 4, 26, 1, 0, 1, 0),
(150, 4, 27, 0, 0, 1, 0),
(151, 4, 28, 1, 1, 1, 1),
(152, 4, 29, 1, 0, 1, 1),
(153, 4, 30, 1, 0, 1, 1),
(154, 4, 31, 1, 0, 1, 0),
(155, 4, 9, 0, 0, 0, 0),
(156, 4, 10, 0, 0, 0, 0),
(157, 4, 16, 0, 0, 0, 0),
(158, 4, 17, 0, 0, 0, 0),
(159, 4, 18, 0, 0, 0, 0),
(160, 4, 32, 1, 1, 1, 1),
(161, 4, 33, 1, 1, 1, 1),
(162, 4, 34, 1, 1, 1, 1),
(163, 4, 35, 0, 0, 1, 0),
(164, 4, 13, 1, 0, 1, 0),
(165, 4, 14, 0, 0, 1, 0),
(166, 4, 15, 1, 0, 1, 0),
(167, 4, 11, 0, 0, 0, 0),
(168, 4, 12, 0, 0, 0, 0),
(169, 4, 21, 0, 0, 0, 0),
(170, 4, 22, 0, 0, 0, 0),
(171, 4, 23, 0, 0, 0, 0),
(172, 4, 24, 0, 0, 0, 0),
(173, 4, 25, 0, 0, 0, 0),
(174, 4, 58, 0, 0, 0, 0),
(175, 5, 39, 0, 0, 0, 0),
(176, 5, 40, 0, 0, 0, 0),
(177, 5, 41, 0, 0, 0, 0),
(178, 5, 42, 0, 0, 0, 0),
(179, 5, 43, 0, 0, 0, 0),
(180, 5, 44, 0, 0, 1, 0),
(181, 5, 45, 0, 0, 1, 0),
(182, 5, 46, 0, 0, 1, 0),
(183, 5, 47, 0, 0, 0, 0),
(184, 5, 48, 0, 0, 0, 0),
(185, 5, 49, 0, 0, 0, 0),
(186, 5, 50, 0, 0, 0, 0),
(187, 5, 51, 0, 0, 0, 0),
(188, 5, 52, 0, 0, 0, 0),
(189, 5, 53, 0, 0, 0, 0),
(190, 5, 54, 0, 0, 0, 0),
(191, 5, 55, 0, 0, 0, 0),
(192, 5, 56, 0, 0, 0, 0),
(193, 5, 57, 0, 0, 0, 0),
(194, 5, 59, 0, 0, 0, 0),
(195, 5, 1, 0, 0, 0, 0),
(196, 5, 2, 0, 0, 0, 0),
(197, 5, 19, 0, 0, 0, 0),
(198, 5, 36, 0, 0, 0, 0),
(199, 5, 37, 0, 0, 0, 0),
(200, 5, 38, 0, 0, 0, 0),
(201, 5, 3, 0, 0, 0, 0),
(202, 5, 4, 0, 0, 0, 0),
(203, 5, 5, 0, 0, 0, 0),
(204, 5, 6, 0, 0, 0, 0),
(205, 5, 7, 0, 0, 0, 0),
(206, 5, 8, 0, 0, 0, 0),
(207, 5, 26, 0, 0, 0, 0),
(208, 5, 27, 0, 0, 0, 0),
(209, 5, 28, 0, 0, 0, 0),
(210, 5, 29, 0, 0, 0, 0),
(211, 5, 30, 0, 0, 0, 0),
(212, 5, 31, 0, 0, 0, 0),
(213, 5, 9, 0, 0, 0, 0),
(214, 5, 10, 0, 0, 0, 0),
(215, 5, 16, 0, 0, 0, 0),
(216, 5, 17, 0, 0, 0, 0),
(217, 5, 18, 0, 0, 0, 0),
(218, 5, 32, 0, 0, 0, 0),
(219, 5, 33, 0, 0, 0, 0),
(220, 5, 34, 0, 0, 0, 0),
(221, 5, 35, 0, 0, 0, 0),
(222, 5, 13, 0, 0, 0, 0),
(223, 5, 14, 0, 0, 0, 0),
(224, 5, 15, 0, 0, 0, 0),
(225, 5, 11, 1, 1, 1, 0),
(226, 5, 12, 1, 1, 1, 1),
(227, 5, 21, 0, 0, 0, 0),
(228, 5, 22, 0, 0, 0, 0),
(229, 5, 23, 0, 0, 0, 0),
(230, 5, 24, 0, 0, 0, 0),
(231, 5, 25, 0, 0, 0, 0),
(232, 5, 58, 0, 0, 0, 0),
(233, 6, 39, 0, 0, 1, 0),
(234, 6, 40, 0, 0, 1, 0),
(235, 6, 41, 0, 0, 0, 0),
(236, 6, 42, 0, 0, 0, 0),
(237, 6, 43, 0, 0, 0, 0),
(238, 6, 44, 0, 0, 1, 0),
(239, 6, 45, 0, 0, 1, 0),
(240, 6, 46, 0, 0, 1, 0),
(241, 6, 47, 0, 0, 0, 0),
(242, 6, 48, 0, 0, 0, 0),
(243, 6, 49, 0, 0, 0, 0),
(244, 6, 50, 0, 0, 0, 0),
(245, 6, 51, 0, 0, 0, 0),
(246, 6, 52, 0, 0, 0, 0),
(247, 6, 53, 0, 0, 0, 0),
(248, 6, 54, 0, 0, 0, 0),
(249, 6, 55, 0, 0, 0, 0),
(250, 6, 56, 0, 0, 0, 0),
(251, 6, 57, 0, 0, 0, 0),
(252, 6, 59, 0, 0, 0, 0),
(253, 6, 1, 1, 1, 1, 1),
(254, 6, 2, 1, 1, 1, 1),
(255, 6, 19, 0, 0, 0, 0),
(256, 6, 36, 0, 0, 0, 0),
(257, 6, 37, 0, 0, 0, 0),
(258, 6, 38, 0, 0, 0, 0),
(259, 6, 3, 0, 0, 0, 0),
(260, 6, 4, 0, 0, 0, 0),
(261, 6, 5, 0, 0, 0, 0),
(262, 6, 6, 0, 0, 0, 0),
(263, 6, 7, 0, 0, 0, 0),
(264, 6, 8, 0, 0, 0, 0),
(265, 6, 26, 0, 0, 0, 0),
(266, 6, 27, 0, 0, 0, 0),
(267, 6, 28, 0, 0, 0, 0),
(268, 6, 29, 0, 0, 0, 0),
(269, 6, 30, 0, 0, 0, 0),
(270, 6, 31, 0, 0, 0, 0),
(271, 6, 9, 0, 0, 0, 0),
(272, 6, 10, 0, 0, 0, 0),
(273, 6, 16, 0, 0, 0, 0),
(274, 6, 17, 0, 0, 0, 0),
(275, 6, 18, 0, 0, 0, 0),
(276, 6, 32, 0, 0, 0, 0),
(277, 6, 33, 0, 0, 0, 0),
(278, 6, 34, 0, 0, 0, 0),
(279, 6, 35, 0, 0, 0, 0),
(280, 6, 13, 1, 0, 1, 1),
(281, 6, 14, 0, 0, 1, 0),
(282, 6, 15, 1, 0, 1, 0),
(283, 6, 11, 0, 0, 0, 0),
(284, 6, 12, 0, 0, 0, 0),
(285, 6, 21, 0, 0, 0, 0),
(286, 6, 22, 0, 0, 0, 0),
(287, 6, 23, 0, 0, 0, 0),
(288, 6, 24, 0, 0, 0, 0),
(289, 6, 25, 0, 0, 0, 0),
(290, 6, 58, 0, 0, 0, 0),
(291, 7, 39, 0, 0, 0, 0),
(292, 7, 40, 0, 0, 0, 0),
(293, 7, 41, 0, 0, 0, 0),
(294, 7, 42, 0, 0, 0, 0),
(295, 7, 43, 0, 0, 0, 0),
(296, 7, 44, 0, 0, 1, 0),
(297, 7, 45, 0, 0, 1, 0),
(298, 7, 46, 0, 0, 0, 0),
(299, 7, 47, 0, 0, 0, 0),
(300, 7, 48, 0, 0, 0, 0),
(301, 7, 49, 0, 0, 0, 0),
(302, 7, 50, 0, 0, 0, 0),
(303, 7, 51, 0, 0, 0, 0),
(304, 7, 52, 0, 0, 0, 0),
(305, 7, 53, 0, 0, 0, 0),
(306, 7, 54, 0, 0, 0, 0),
(307, 7, 55, 0, 0, 0, 0),
(308, 7, 56, 0, 0, 0, 0),
(309, 7, 57, 0, 0, 0, 0),
(310, 7, 59, 0, 0, 0, 0),
(311, 7, 1, 0, 0, 0, 0),
(312, 7, 2, 0, 0, 0, 0),
(313, 7, 19, 0, 0, 0, 0),
(314, 7, 36, 0, 0, 1, 0),
(315, 7, 37, 0, 0, 0, 0),
(316, 7, 38, 0, 0, 0, 0),
(317, 7, 3, 0, 0, 0, 0),
(318, 7, 4, 0, 0, 0, 0),
(319, 7, 5, 0, 0, 0, 0),
(320, 7, 6, 0, 0, 0, 0),
(321, 7, 7, 0, 0, 0, 0),
(322, 7, 8, 0, 0, 0, 0),
(323, 7, 26, 0, 0, 0, 0),
(324, 7, 27, 0, 0, 0, 0),
(325, 7, 28, 0, 0, 0, 0),
(326, 7, 29, 0, 0, 0, 0),
(327, 7, 30, 0, 0, 0, 0),
(328, 7, 31, 0, 0, 0, 0),
(329, 7, 9, 0, 0, 1, 0),
(330, 7, 10, 0, 0, 0, 0),
(331, 7, 16, 0, 0, 0, 0),
(332, 7, 17, 0, 0, 0, 0),
(333, 7, 18, 0, 0, 0, 0),
(334, 7, 32, 0, 0, 0, 0),
(335, 7, 33, 0, 0, 0, 0),
(336, 7, 34, 0, 0, 0, 0),
(337, 7, 35, 0, 0, 0, 0),
(338, 7, 13, 0, 0, 1, 0),
(339, 7, 14, 0, 0, 0, 0),
(340, 7, 15, 0, 0, 0, 0),
(341, 7, 11, 0, 0, 1, 0),
(342, 7, 12, 0, 0, 0, 0),
(343, 7, 21, 0, 0, 0, 0),
(344, 7, 22, 0, 0, 0, 0),
(345, 7, 23, 0, 0, 0, 0),
(346, 7, 24, 0, 0, 0, 0),
(347, 7, 25, 0, 0, 0, 0),
(348, 7, 58, 0, 0, 0, 0),
(349, 2, 60, 0, 0, 1, 0),
(350, 7, 60, 0, 0, 0, 0),
(351, 3, 60, 0, 0, 0, 0),
(352, 3, 61, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `product_list` mediumtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` int(11) NOT NULL,
  `border_mode` varchar(20) NOT NULL,
  `dark_skin` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `border_mode`, `dark_skin`, `created_at`, `updated_at`) VALUES
(1, 'true', 'false', '2022-12-01 22:59:38', '2022-12-03 15:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `account_id` varchar(20) NOT NULL,
  `voucher_head_id` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `dr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `cr` decimal(18,2) NOT NULL DEFAULT 0.00,
  `bal` decimal(18,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `pay_via` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `attachments` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_head`
--

CREATE TABLE `voucher_head` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chemical`
--
ALTER TABLE `chemical`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chemical_assigned`
--
ALTER TABLE `chemical_assigned`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chemical_category`
--
ALTER TABLE `chemical_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chemical_stock`
--
ALTER TABLE `chemical_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chemical_unit`
--
ALTER TABLE `chemical_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `email_config`
--
ALTER TABLE `email_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_appointment`
--
ALTER TABLE `front_cms_appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_doctors`
--
ALTER TABLE `front_cms_doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_doctor_bio`
--
ALTER TABLE `front_cms_doctor_bio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labtest_bill`
--
ALTER TABLE `labtest_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labtest_bill_details`
--
ALTER TABLE `labtest_bill_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labtest_payment_history`
--
ALTER TABLE `labtest_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labtest_report`
--
ALTER TABLE `labtest_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_report_template`
--
ALTER TABLE `lab_report_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_test`
--
ALTER TABLE `lab_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lab_test_category`
--
ALTER TABLE `lab_test_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_list`
--
ALTER TABLE `language_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application`
--
ALTER TABLE `leave_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_category`
--
ALTER TABLE `leave_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_credential`
--
ALTER TABLE `login_credential`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_category`
--
ALTER TABLE `patient_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_documents`
--
ALTER TABLE `patient_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_commission`
--
ALTER TABLE `payout_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip`
--
ALTER TABLE `payslip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payslip_details`
--
ALTER TABLE `payslip_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_modules`
--
ALTER TABLE `permission_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_bill_details`
--
ALTER TABLE `purchase_bill_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_payment_history`
--
ALTER TABLE `purchase_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referral_commission`
--
ALTER TABLE `referral_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template`
--
ALTER TABLE `salary_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_config`
--
ALTER TABLE `sms_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_balance`
--
ALTER TABLE `staff_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_department`
--
ALTER TABLE `staff_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_designation`
--
ALTER TABLE `staff_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_documents`
--
ALTER TABLE `staff_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voucher_head`
--
ALTER TABLE `voucher_head`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chemical`
--
ALTER TABLE `chemical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chemical_assigned`
--
ALTER TABLE `chemical_assigned`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chemical_category`
--
ALTER TABLE `chemical_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chemical_stock`
--
ALTER TABLE `chemical_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chemical_unit`
--
ALTER TABLE `chemical_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_config`
--
ALTER TABLE `email_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `front_cms_about`
--
ALTER TABLE `front_cms_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_appointment`
--
ALTER TABLE `front_cms_appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_contact`
--
ALTER TABLE `front_cms_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_doctors`
--
ALTER TABLE `front_cms_doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_cms_doctor_bio`
--
ALTER TABLE `front_cms_doctor_bio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_faq`
--
ALTER TABLE `front_cms_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_faq_list`
--
ALTER TABLE `front_cms_faq_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `front_cms_home`
--
ALTER TABLE `front_cms_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `front_cms_home_seo`
--
ALTER TABLE `front_cms_home_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_menu`
--
ALTER TABLE `front_cms_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_cms_pages`
--
ALTER TABLE `front_cms_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_cms_services`
--
ALTER TABLE `front_cms_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_services_list`
--
ALTER TABLE `front_cms_services_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_cms_setting`
--
ALTER TABLE `front_cms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_cms_testimonial`
--
ALTER TABLE `front_cms_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `labtest_bill`
--
ALTER TABLE `labtest_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labtest_bill_details`
--
ALTER TABLE `labtest_bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labtest_payment_history`
--
ALTER TABLE `labtest_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labtest_report`
--
ALTER TABLE `labtest_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_report_template`
--
ALTER TABLE `lab_report_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_test`
--
ALTER TABLE `lab_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lab_test_category`
--
ALTER TABLE `lab_test_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=466;

--
-- AUTO_INCREMENT for table `language_list`
--
ALTER TABLE `language_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `leave_application`
--
ALTER TABLE `leave_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_category`
--
ALTER TABLE `leave_category`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_credential`
--
ALTER TABLE `login_credential`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_category`
--
ALTER TABLE `patient_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_documents`
--
ALTER TABLE `patient_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_commission`
--
ALTER TABLE `payout_commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip`
--
ALTER TABLE `payslip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payslip_details`
--
ALTER TABLE `payslip_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `permission_modules`
--
ALTER TABLE `permission_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `purchase_bill`
--
ALTER TABLE `purchase_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_bill_details`
--
ALTER TABLE `purchase_bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_payment_history`
--
ALTER TABLE `purchase_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_commission`
--
ALTER TABLE `referral_commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `salary_template`
--
ALTER TABLE `salary_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_template_details`
--
ALTER TABLE `salary_template_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sms_config`
--
ALTER TABLE `sms_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_balance`
--
ALTER TABLE `staff_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_bank_account`
--
ALTER TABLE `staff_bank_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_department`
--
ALTER TABLE `staff_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_designation`
--
ALTER TABLE `staff_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_documents`
--
ALTER TABLE `staff_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_privileges`
--
ALTER TABLE `staff_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_head`
--
ALTER TABLE `voucher_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
