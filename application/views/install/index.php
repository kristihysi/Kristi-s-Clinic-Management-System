<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1" name="viewport">
    <meta name="keywords" content=""/>
    <meta name="description" content="clinic system developer by Kristi">
    <meta name="author" content="kristi">
    <title>Kristi Clinic - Installation</title>
    <link rel="shortcut icon" href="<?=base_url('assets/images/favicon.png')?>">
    <link href="<?=$this->_install->is_secure('fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light')?>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<?=base_url('assets/vendor/bootstrap/css/bootstrap.css')?>"/>
    <link rel="stylesheet" href="<?=base_url('assets/vendor/font-awesome/css/fontawesome-all.min.css')?>" />
    <link rel="stylesheet" href="<?=base_url('assets/css/install.css')?>" />
    <script src="<?=base_url('assets/vendor/jquery/jquery.js')?>"></script>
</head>
	<body>
		<div class="container pmx">
			<div class="logo">
		        <img src="<?=base_url('uploads/app_image/logo_inst.png');?>">
		    </div>
            <section class="panel p-shadow">
                <div class="tabs-custom">
                    <ul class="nav nav-tabs txt-font-et">
                        <li class="<?=($step == 1 ? 'active' : ''); ?>">
                            <a href="#"><i class="fas fa-parachute-box"></i> <h5>Requirements</h5></a>
                        </li>
                        <li class="<?=($step == 2 ? 'active' : ''); ?>">
                            <a href="#"><i class="fas fa-database"></i> <h5>Database</h5></a>
                        </li>
                        <li class="<?=($step == 3 ? 'active' : ''); ?>">
                            <a href="#"><i class="fas fa-server"></i> <h5>Install</h5></a>
                        </li>
                        <li class="<?=($step == 4 ? 'active' : ''); ?>">
                            <a href="#"><i class="fas fa-check"></i> <h5>Completed</h5></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <?php if ($step == 1): ?>
                            <div class="tab-pane active">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th><b>Extensions</b></th>
                                            <th><b>Result</b></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>PHP 5.4+ </td>
                                            <td>
                                                <?php
                                                    $error = false;
                                                    if (phpversion() < "5.4") {
                                                        $error = true;
                                                        echo "<span class='label label-danger'>Your PHP version is " . phpversion() . "</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>v." . phpversion() . "</span>";
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>MySQLi PHP Extension</td>
                                            <td>
                                                <?php 
                                                    if (!extension_loaded('mysqli')) {
                                                        $error = true;
                                                        echo "<span class='label label-danger'>Not enabled</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>Enabled</span>";
                                                    }
                                                ?>
                                             </td>
                                        </tr>
                                        <tr>
                                            <td>OpenSSL PHP Extension</td>
                                            <td>
                                                <?php
                                                    if (!extension_loaded('openssl')) {
                                                        $error = true;
                                                        echo "<span class='label label-danger'>Not enabled</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>Enabled</span>";
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>MBString PHP Extension</td>
                                            <td>
                                                <?php
                                                    if (!extension_loaded('mbstring')) {
                                                        $error = true;
                                                        echo "<span class='label label-danger'>Not enabled</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>Enabled</span>";
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>GD PHP Extension</td>
                                            <td>
                                                <?php
                                                    if (!extension_loaded('gd')) {
                                                        $error = true;
                                                        echo "<span class='label label-danger'>Not enabled</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>Enabled</span>";
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Zip PHP Extension</td>
                                            <td>
                                                <?php
                                                    if (!extension_loaded('zip')) {
                                                        $error = true;
                                                        echo  "<span class='label label-danger'>Zip Extension is not enabled</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>Enabled</span>";
                                                    }
                                                ?>
                                             </td>
                                        </tr>
                                        <tr>
                                            <td>allow_url_fopen</td>
                                            <td>
                                                <?php
                                                    $url_f_open = ini_get('allow_url_fopen');
                                                    if ($url_f_open != "1"
                                                        && strcasecmp($url_f_open,'On') != 0
                                                        && strcasecmp($url_f_open,'true') != 0
                                                        && strcasecmp($url_f_open,'yes') != 0) {
                                                        $error = true;
                                                        echo "<span class='label label-danger'>Allow_url_fopen is not enabled!</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>Enabled</span>";
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>application/config/config.php Writable</td>
                                            <td>
                                                <?php
                                                    if (!is_really_writable(APPPATH . 'config/config.php')) {
                                                        $error = true;
                                                        echo "<span class='label label-danger'>No (Make application/config/database.php writable) - Permissions - 755</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>Yes</span>";
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>application/config/database.php Writable</td>
                                            <td>
                                                <?php
                                                    if (!is_really_writable(APPPATH . 'config/database.php')) {
                                                        $error = true;
                                                        echo "<span class='label label-danger'>No (Make application/config/database.php writable) - Permissions - 755</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>Yes</span>";
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>application/config/routes.php Writable</td>
                                            <td>
                                                <?php
                                                    if (!is_really_writable(APPPATH . 'config/routes.php')) {
                                                        $error = true;
                                                        echo "<span class='label label-danger'>No (Make application/config/database.php writable) - Permissions - 755</span>";
                                                    } else {
                                                        echo "<span class='label label-success'>Yes</span>";
                                                    }
                                                ?>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <footer class="panel-footer">
                                    <?php 
                                        if ($error == false){
                                            echo '<div class="text-right">';
                                            echo form_open($this->uri->uri_string());
                                            echo '<button type="submit" name="step" class="btn btn-default" value="2">Start The Installation</button>';
                                            echo form_close();
                                            echo '</div>';
                                        }else{
                                            echo '<div class="text-right">';
                                            echo '<button class="btn btn-default" disabled value="2">Start The Installation</button>';
                                            echo '</div>';
                                        }
                                     ?>
                                </footer>
                            </div>
                        <?php elseif ($step == 2) : ?>
                            <div class="tab-pane active">
                                <?php if (isset($mysql_error) && $mysql_error != '') { ?>
                                    <div class="alert alert-danger text-left">
                                        <?php echo $mysql_error; ?>
                                    </div>
                                <?php } ?>
                                <?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered validate')); ?>
                                    <div class="form-group">
                                        <label for="hostname" class="col-md-3 control-label">Hostname <span class="required">*</span></label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="hostname" value="localhost">
											<span class="error"><?=form_error('hostname')?></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="database" class="col-md-3 control-label">Database Name <span class="required">*</span></label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="database" value="<?=set_value('database')?>">
                                            <?php echo form_error('database', '<label id="database-error" class="error" for="database">', '</label>'); ?>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="username" class="col-md-3 control-label">Username <span class="required">*</span></label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="username" value="<?=set_value('username')?>">
											<span class="error"><?=form_error('username')?></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-md-3 control-label"> Password</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control mb-ma" name="password" value="" >
                                        </div>
                                    </div>
                                    <footer class="panel-footer">
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-default" name="step" value="3"> Setup Database</button>
                                        </div>
                                    </footer>
                                <?php echo form_close(); ?>
                            </div>
                        <?php elseif ($step == 3) : ?>
                            <?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered validate')); ?>
								<div class="form-group">
									<label class="col-md-3 control-label">Diagnostic Name <span class="required">*</span></label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="diagnostic_name" placeholder="Diagnostic Center Name" value="<?=set_value('diagnostic_name')?>" />
                                        <span class="error"><?=form_error('diagnostic_name')?></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="superadmin_name">Superadmin Name <span class="required">*</span></label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="sa_name" placeholder="Superadmin Name" value="<?=set_value('superadmin_name')?>" />
                                        <span class="error"><?=form_error('sa_name')?></span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="superadmin_email">Superadmin Email <span class="required">*</span></label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="sa_email" placeholder="Superadmin Email" value="<?=set_value('superadmin_email')?>" />
                                        <span class="error"><?=form_error('sa_email')?></span>
									</div>
								</div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Login Username <span class="required">*</span></label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="sa_username" placeholder="Superadmin Login Username" value="<?=set_value('sa_username')?>" />
                                        <span class="error"><?=form_error('sa_username')?></span>
                                    </div>
                                </div>
								<div class="form-group">
									<label class="col-md-3 control-label">Login Password <span class="required">*</span></label>
									<div class="col-md-9 mb-ma">
										<input type="password" class="form-control" name="sa_password" id="sa_password" placeholder="Superadmin Login Password" value="" />
                                        <span class="error"><?=form_error('sa_password')?></span>
									</div>
								</div>
                                <footer class="panel-footer">
                                    <div class="text-right">
                                        <button type="submit" class="btn btn-default" name="step" value="4"> Install</button>
                                    </div>
                                </footer>
                            <?php echo form_close(); ?>
                        <?php elseif ($step == 4) : ?>
                            <center>
                                <h4>Congratulations!! The installation was successfully</h4>
                                <ul class="fi-msg-s">
                                    <li><span>Enter the url for login and follow the instructions :</span></li>
                                    <li><a href="<?=base_url('authentication'); ?>" target="_blank"><?=base_url('authentication'); ?></a> </li>
                                </ul>
                                <br>
                            </center>
                        <?php endif; ?>
                    </div>
                </div>
            </section>
            <center> 2022 © All Rights Reserved - <a href="about:blank">Kristi </a></center>
		</div>
		<script src="<?=base_url('assets/vendor/bootstrap/js/bootstrap.js')?>"></script>
		<script src="<?=base_url('assets/vendor/jquery-placeholder/jquery-placeholder.js')?>"></script>
	</body>
</html>