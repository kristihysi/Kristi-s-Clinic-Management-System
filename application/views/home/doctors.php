<section class="section team">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-6-desktop">
                <div class="heading has-text-centered mb-50">
                    <h2 style="font-size: 25px; font-weight: 600;" class="mb-5">Our Doctors</h2>
                    <p>Today’s users expect effortless experiences. Don’t let essential people and processes stay stuck in the past. Speed it up, skip the hassles</p>
                </div>
            </div>
        </div>

        <div class="columns is-multiline">
            <?php foreach ($doctor_list as $row) { ?>
                <div class="column is-4">
                    <div class="card large">
                        <div class="card-image">
                            <figure class="image is-16by9">
                                <img src="<?php echo $this->app_lib->get_image_url('staff/' . $row['photo']); ?>" alt="Image">
                            </figure>
                        </div>
                        <div class="card-content">
                            <div class="media">
                                <div class="media-left">
                                </div>
                                <div class="media-content">
                                    <p class="subtitle is-6"><?php echo $row['department_name']; ?></p>
                                    <p class="title is-4 no-padding"><?php echo $row['name']; ?></p>
                                        <span class="title is-6">
                                      <a class="button is-primary card-footer-item" href="<?php echo base_url('home/doctor_profile/' . $row['id']); ?>">Make Appointment</a>
                                        </span>
                                </div>
                            </div>
                            <div class="content">
                                <div class="is-flex is-flex-wrap-wrap is-align-items-center is-justify-content-center">
                                    <a class="mr-4 is-inline-block" href="<?php echo $row['facebook_url']; ?>" target="_blank"><i class="fab fa-facebook-f"></i></a>
                                    <a class="mr-4 is-inline-block" href="<?php echo $row['twitter_url']; ?>" target="_blank"><i class="fab fa-twitter"></i></a>
                                    <a class="mr-4 is-inline-block" href="<?php echo $row['linkedin_url']; ?>" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</section>