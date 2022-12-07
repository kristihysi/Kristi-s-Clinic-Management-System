<?php
$patient_id = "";
if (loggedin_role_id() == 7) {
	$patient_id = $this->session->userdata('uniqueid');
}
?>


<div class="container">
    <h3 class="main-heading2 mt-0"><?php echo $page_data['title']; ?></h3>
    <?php echo $page_data['description']; ?>
    <div class="box2 form-box">
        <?php
        if($this->session->flashdata('success')) {
            echo '<div class="alert alert-success"><i class="icon-text-ml far fa-check-circle"></i>' . $this->session->flashdata('success') . '</div>';
        }
        if($this->session->flashdata('error')) {
            echo '<div class="alert alert-error"><i class="icon-text-ml far fa-check-circle"></i>' . $this->session->flashdata('error') . '</div>';
        }
        ?>
        <div class="tabs-panel tabs-product">
            <div class="nav nav-tabs">
                <a class="nav-item nav-link <?php echo $active_tab == 1 ? 'active' : ''; ?>" data-toggle="tab"
                    href="#new-patient" role="tab" aria-controls="tab-details" aria-selected="true">New Patient</a>
                <a class="nav-item nav-link <?php echo $active_tab == 2 ? 'active' : ''; ?>" data-toggle="tab"
                    href="#old-patient" role="tab" aria-controls="tab-video" aria-selected="false">Old Patient</a>
            </div>
            <div class="tab-content clearfix">
                <div class="tab-pane fade show <?php echo $active_tab == 1 ? 'active' : ''; ?>" id="new-patient" role="tabpanel" aria-labelledby="tab-new-patient">
                    <?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>



                            <div class="field">
                                <label class="label">Patient Name</label>
                                <div class="control has-icons-left has-icons-right">
                                    <input type="text" name="new_patient_name" id="new_patient_name" class="input form-control" value="<?php echo set_value('new_patient_name'); ?>" />
                                    <span class="icon is-small is-left">
                                        <i class="fas fa-user"></i>
                                    </span>
                                </div>
                                <span class="help is-danger"><?php echo form_error('new_patient_name'); ?></span>
                            </div>


                            <div class="field">
                                <label class="label">Patient Gender</label>
                                <div class="control">
                                    <div class="select">
                                        <select id="new_patient_gender" name="new_patient_gender" class="form-control input">
                                            <option value="">Select</option>
                                            <option value="male" <?php if(set_value('new_patient_gender') == 'male') echo 'selected'; ?>>Male</option>
                                            <option value="female" <?php if(set_value('new_patient_gender') == 'female') echo 'selected'; ?>>Female</option>
                                        </select>
                                        <span class="help is-danger"><?php echo form_error('new_patient_gender'); ?></span>
                                    </div>
                                </div>
                            </div>



                            <div class="field">
                                <label class="label">Patient Birthday</label>
                                <div class="control has-icons-left has-icons-right">
                                    <input type="text" class="input form-control date" name="birthday" value="<?php echo set_value('birthday'); ?>" id="birthday" />
                                    <span class="icon is-small is-left">
                                         <i class="fas fa-calendar"></i>
                                     </span>
                                </div>
                                <span class="help is-danger"><?php echo form_error('birthday'); ?></span>
                            </div>


                            <div class="field">
                                <label class="label">Patient Email</label>
                                <div class="control has-icons-left has-icons-right">
                                    <input type="text" id="new_email" name="new_patient_email" value="<?php echo set_value('new_patient_email'); ?>" class="input form-control" />
                                    <span class="icon is-small is-left">
                                          <i class="fas fa-envelope"></i>
                                        </span>
                                </div>
                                <span class="help is-danger"><?php echo form_error('new_patient_email'); ?></span>
                            </div>




                              <div class="field">
                                    <label class="label">Patient Phone</label>
                                        <div class="control has-icons-left has-icons-right">
                                            <input type="text" id="new_phone" name="new_patient_phone" value="<?php echo set_value('new_patient_phone'); ?>" class="input form-control" />
                                                <span class="icon is-small is-left">
                                                    <i class="fas fa-phone"></i>
                                                 </span>
                                        </div>
                                    <span class="help is-danger"><?php echo form_error('new_patient_phone'); ?></span>
                                </div>





                <div class="field">
                    <label class="label">Username</label>
                    <div class="control has-icons-left has-icons-right">
                        <input type="text" name="new_username" id="new_username" value="<?php echo set_value('new_username'); ?>" class="input form-control" />
                        <span class="icon is-small is-left">
                            <i class="fas fa-user"></i>
                        </span>
                    </div>
                    <span class="help is-danger"><?php echo form_error('new_username'); ?></span>
                </div>


                <div class="field">
                    <label class="label">Password</label>
                    <div class="control has-icons-left has-icons-right">
                        <input type="password" name="new_password" value="<?php echo set_value('new_password'); ?>" id="new_password"  class="input form-control" />
                        <span class="icon is-small is-left">
                            <i class="fas fa-lock"></i>
                        </span>
                    </div>
                    <span class="help is-danger"><?php echo form_error('new_password'); ?></span>
                </div>



                    <div class="field">
                        <label class="label">Appointment Date</label>
                        <div class="control has-icons-left has-icons-right">
                            <input type="text" class="form-control date input" name="new_appointment_date" value="<?php echo set_value('new_appointment_date', $today); ?>" id="new_appointment_date" />
                            <span class="icon is-small is-left">
                                        <i class="fas fa-calendar"></i>
                             </span>
                        </div>
                        <span class="help is-danger"><?php echo form_error('new_appointment_date'); ?></span>
                    </div>


                    <div class="field">
                        <label class="label">Select a Doctor</label>
                        <div class="select">
                            <?php
                                $doctorlist = $this->app_lib->getDoctorlListFront();
                                echo form_dropdown("new_doctor_id", $doctorlist, set_value("new_doctor_id"), "class='form-control' id='new_doctor_id' ");
                            ?>
                            <span class="help is-danger"><?php echo form_error('new_doctor_id'); ?></span>
                        </div>
                    </div>


                    <div class="field">
                        <label class="label">Time Slots</label>
                        <div class="control">
                            <select name="new_time_slots" class="form-control" id="new_time_slots">
                                <option value="">Select Time Slots</option>
                            </select>
                            <span class="help is-danger"><?php echo form_error('time_slots'); ?></span>
                        </div>
                    </div>



                    <div class="field">
                        <label class="label">Message</label>
                        <div class="control">
                            <textarea class="form-control textarea" id="new_message" name="new_message" placeholder="Enter Message"><?php echo set_value('new_message'); ?></textarea>
                            <span class="help is-danger"><?php echo form_error('new_message'); ?></span>
                        </div>
                    </div>


                        <?php if ($cms_setting['captcha_status'] == 'enable'): ?>
                        <div class="form-group">
                            <?php echo $recaptcha['widget']; echo $recaptcha['script']; ?>
                            <span class="text-danger"><?php echo form_error('g-recaptcha-response'); ?></span>
                        </div>
                        <?php endif; ?>
                        <button type="submit" name="new_patient" value="1" class="button is-link">Book Appointment</button>
                    <?php echo form_close(); ?>

                </div>



                <div class="tab-pane <?php echo $active_tab == 2 ? 'active' : ''; ?>" id="old-patient" role="tabpanel" aria-labelledby="tab-old-patient">
                    <?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>

                    <div class="field">
                        <label class="label">Patient ID</label>
                        <div class="control has-icons-left has-icons-right">
                            <input type="text" name="patient_id" id="patient_id" value="<?php echo set_value('patient_id', $patient_id); ?>" <?php echo ($patient_id == "" ? "" : "readonly") ?> class="input form-control" />
                            <span class="icon is-small is-left">
                                        <i class="fas fa-user"></i>
                             </span>
                        </div>
                        <span class="help is-danger"><?php echo form_error('patient_id'); ?></span>
                    </div>



                    <div class="field">
                        <label class="label">Appointment Date</label>
                        <div class="control has-icons-left has-icons-right">
                            <input type="text" class="form-control date" name="old_appointment_date" value="<?php echo set_value('old_appointment_date', $today); ?>" id="old_appointment_date" />
                        </div>
                    </div>


                    <div class="field">
                        <label class="label">Select a Doctor</label>
                        <div class="select">
                            <?php
                            $doctorlist = $this->app_lib->getDoctorlListFront();
                            echo form_dropdown("old_doctor_id", $doctorlist, set_value("old_doctor_id"), "class='form-control' id='old_doctor_id'");
                            ?>
                            <span class="help is-danger"><?php echo form_error('old_doctor_id'); ?></span>
                        </div>
                    </div>



                    <div class="field">
                        <label class="label">Time Slots</label>
                        <div class="control">
                            <select name="old_time_slots" class="form-control" id="old_time_slots">
                                <option value="">Select Time Slots</option>
                            </select>
                            <span class="help is-danger"><?php echo form_error('old_time_slots'); ?></span>
                        </div>
                    </div>


                    <div class="field">
                        <label class="label">Message</label>
                        <div class="control">
                            <textarea class="form-control textarea" id="old_message" name="old_message" placeholder="Enter Message"><?php echo set_value('old_message'); ?></textarea>
                            <span class="help is-danger"><?php echo form_error('old_message'); ?></span>
                        </div>
                    </div>


                        <button type="submit" name="old_patient" value="1" class="button is-link">Book Appointment</button>


                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var new_appointment_date = "<?php echo set_value('new_appointment_date', $today); ?>";
        var new_doctor_id = "<?php echo set_value('new_doctor_id', $doctor_id); ?>";
        var new_time_slots = "<?php echo set_value('new_time_slots'); ?>";
        getDoctorSchedule(new_appointment_date, new_doctor_id, 'new_time_slots', new_time_slots);

        var old_appointment_date = "<?php echo set_value('old_appointment_date', $today); ?>";
        var old_doctor_id = "<?php echo set_value('old_doctor_id', $doctor_id); ?>";
        var old_time_slots = "<?php echo set_value('old_time_slots'); ?>";
        getDoctorSchedule(old_appointment_date, old_doctor_id, 'old_time_slots', old_time_slots);

        $('#old_appointment_date, #old_doctor_id').on('change', function() {
            var appointment_date = $('#old_appointment_date').val();
            var doctor_id = $('#old_doctor_id').val();
            getDoctorSchedule(appointment_date, doctor_id, 'old_time_slots');
        });

        $('#new_appointment_date, #new_doctor_id').on('change', function() {
            var appointment_date = $('#new_appointment_date').val();
            var doctor_id = $('#new_doctor_id').val();
            getDoctorSchedule(appointment_date, doctor_id, 'new_time_slots');
        });
    });
</script>
