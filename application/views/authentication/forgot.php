<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo translate('password_rostoration'); ?></title>

    <link href="<?php echo base_url() ?>assets/frontend/css/bulma.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="<?php echo base_url('assets/images/favicon.png'); ?>">
    <script src="<?php echo base_url('assets/vendor/jquery/jquery.js'); ?>"></script>

    <!-- Sweetalert js/css -->
    <link rel="stylesheet" href="<?php echo base_url('assets/vendor/sweetalert/sweetalert-custom.css'); ?>">
    <script src="<?php echo base_url('assets/vendor/sweetalert/sweetalert.min.js'); ?>"></script>
    <!-- login page style css -->
    <script type="text/javascript">
        var base_url = '<?php echo base_url() ?>';
    </script>
</head>

<body>
<div class="hero is-fullheight">
    <div class="hero-body is-justify-content-center is-align-items-center">
        <div class="columns is-flex is-flex-direction-column box">

            <?php
            if($this->session->flashdata('reset_res')){
                if($this->session->flashdata('reset_res') == 'TRUE'){
                    echo '<div class="help is-success">Password reset email sent successfully. Check email</div>';
                }elseif($this->session->flashdata('reset_res') == 'FALSE'){
                    echo '<div class="help is-danger">You entered the wrong Username</div>';
                }
            }
            ?>
            <div class="forgot-header">
                <h4><i class="fas fa-fingerprint"></i> <?php echo translate('password_restoration'); ?></h4>
                Enter your username and receive reset instructions via email.
            </div>

            <?php echo form_open($this->uri->uri_string()); ?>
            <div class="column <?php if (form_error('username')) echo 'has-error'; ?>">
                <input type="text" class="form-control input is-primary" name="username" id="username" value="<?php echo set_value('username'); ?>" placeholder="<?php echo translate('username'); ?>" />
                <span class="help is-danger"><?php echo form_error('username'); ?></span>
            </div>



            <div class="column">
                <button id="btn_submit" class="button is-primary is-fullwidth" type="submit"><?php echo translate('forgot'); ?></button>
            </div>

            <div class="column">
                <a href="<?php echo base_url('authentication'); ?>"><i class="fas fa-long-arrow-alt-left"></i> <?php echo translate('back_to_login'); ?></a>
            </div>


            <?php echo form_close(); ?>

        </div>
    </div>
</div>

<script src="<?php echo base_url('assets/vendor/bootstrap/js/bootstrap.js'); ?>"></script>
<script src="<?php echo base_url('assets/vendor/jquery-placeholder/jquery-placeholder.js'); ?>"></script>
<!-- backstretch js -->
<script src="<?php echo base_url('assets/login_page/js/custom.js'); ?>"></script>
</body>
</html>
