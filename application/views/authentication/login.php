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

            <?php echo form_open($this->uri->uri_string()); ?>
            <div class="column <?php if (form_error('username')) echo 'has-error'; ?>">
                <label for="username">Username</label>
                <input type="text" class="input is-primary form-control" name="username" id="username" value="<?php echo set_value('username'); ?>" placeholder="<?php echo translate('username'); ?>" />
                <span class="help is-danger"><?php echo form_error('username'); ?></span>
            </div>

            <div class="column <?php if (form_error('password')) echo 'has-error'; ?>">
                <label for="password">Password</label>
                <input type="password" class="input is-primary form-control" name="password" value="" id="password" placeholder="<?php echo translate('password'); ?>" />
                <span class="help is-danger"><?php echo form_error('password'); ?></span>
                <a class="is-size-7 has-text-primary" href="<?php echo base_url('authentication/forgot'); ?>"><?php echo translate('lose_your_password'); ?> ?</a>
            </div>


            <div class="column">
                <button id="btn_submit" class="button is-primary is-fullwidth" type="submit"><?php echo translate('login'); ?></button>
            </div>
            <?php echo form_close(); ?>

        </div>
    </div>
</div>

<script src="<?php echo base_url('assets/vendor/bootstrap/js/bootstrap.js'); ?>"></script>
<script src="<?php echo base_url('assets/vendor/jquery-placeholder/jquery-placeholder.js'); ?>"></script>

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