<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo translate('login'); ?></title>

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

            <?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
            <div class="column <?php if (form_error('password')) echo 'has-error'; ?>">
                    <input type="password" class="form-control input is-primary" name="password" id="password" value="" placeholder="New Password" />
                <span class="help is-danger"><?php echo form_error('password'); ?></span>
            </div>

            <div class="column <?php if (form_error('password')) echo 'has-error'; ?>">
                    <input type="password" class="form-control input is-primary" name="c_password" value="" id="c_password" placeholder="Confirm New Password" />
                <span class="help is-danger"><?php echo form_error('c_password'); ?></span>
            </div>

            <div class="column">
                <button type="submit" id="btn_submit" class="button is-primary is-fullwidth">
                    <i class="far fa-check-circle"></i> Confirm
                </button>
            </div>

            <?php echo form_close(); ?>

        </div>
    </div>
</div>

<script src="<?php echo base_url('assets/vendor/bootstrap/js/bootstrap.js'); ?>"></script>
<script src="<?php echo base_url('assets/vendor/jquery-placeholder/jquery-placeholder.js'); ?>"></script>
<!-- backstretch js -->
<script src="<?php echo base_url('assets/login_page/js/jquery.backstretch.min.js'); ?>"></script>
<script src="<?php echo base_url('assets/login_page/js/custom.js'); ?>"></script>

<?php
$alertclass = "";
if($this->session->flashdata('alert-message-success')){
    $alertclass = "success";
} else if ($this->session->flashdata('alert-message-error')){
    $alertclass = "error";
} else if ($this->session->flashdata('alert-message-info')){
    $alertclass = "info";
}
if($alertclass != ''):
    $alert_message = $this->session->flashdata('alert-message-'. $alertclass);
    ?>
    <script type="text/javascript">
        swal({
            toast: true,
            position: 'top-end',
            type: '<?php echo $alertclass; ?>',
            title: '<?php echo $alert_message; ?>',
            confirmButtonClass: 'btn btn-default',
            buttonsStyling: false,
            timer: 8000
        })
    </script>
<?php endif; ?>
</body>
</html>