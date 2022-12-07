<style type="text/css">
.card-profile > .card-body ul > li {
    padding: 4px 4px;
    border-bottom: 1px dotted #ddd;
}

.card-profile > .card-body ul > li:last-of-type {
    padding-bottom: none;
}
</style>


<!-- Main Container Starts -->
<div class="container">
    <!-- Doctor Profile Starts -->
    <div class="row">
        <!-- Profile Spec Starts -->
        <div class="col-md-5 col-sm-12">
            <div class="profile-block">
                <div class="card card-profile rounded-0">
                    <div class="card-header text-center">
                        <img src="<?php echo $this->app_lib->get_image_url('staff/' . $doctor['photo']); ?>" alt="Doctor Profile Image" class="img-fluid">

                    </div>
                    <div class="card-body">
                        <h3 class="card-title text-left">Name: <?php echo $doctor['name']; ?></h3>
                        <p><?php echo $doctor['biography']; ?></p>
                        <p class="caption text-left">Designation: <?php echo $doctor['designation_name']; ?> | Department: <?php echo $doctor['department_name']; ?></p>
                        <h4 class="pro-h-b">
                            <i class="far fa-clock"></i>
                            Schedule
                        </h4>
                        <ul class="list-unstyled">
                            <?php
								$appointment = $this->db->get_where('schedule', array('doctor_id' => $doctor['id']))->result_array();
								if (count($appointment)) {
									foreach ($appointment as $row) {
									?>
                            <li class="row">
                                <span class="col-md-4 col-sm-12"><strong><?php echo $row['day']; ?></strong></span>
                                <span class="col-md-8 col-sm-12"><?php echo date("h:i A", strtotime($row['time_start'])) . ' - ' . date("h:i A", strtotime($row['time_end'])); ?></span>
                            </li>
                            <?php
                            } }else{
                                echo '<strong>No Appointment Slots Available.</strong>';
                            }
                            ?>
                        </ul>
                    </div>
                        <div class="card-footer">
                          <a href="<?php echo base_url('home/appointment/' . $doctor['id']); ?>" class="card-footer-item text-uppercase">Book An Appointment</a>
                        </div>
                </div>
            </div>
        </div>
        <!-- Profile Spec Ends -->
    </div>
    <!-- Doctor Profile Ends -->
</div>
<!-- Main Container Ends -->