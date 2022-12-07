<footer class="section">
    <div class="container">
        <div class="pb-5 is-flex is-flex-wrap-wrap is-justify-content-between is-align-items-center">
            <div class="mr-auto mb-2">
                <a class="is-inline-block" href="<?php echo base_url('home'); ?>">
                    <img class="image" src="https://bulma.io/images/bulma-logo.png" alt="" width="96px">
                </a>
                <ul class="is-flex is-flex-wrap-wrap is-align-items-center is-justify-content-center">
                    <li class="mr-4"><i class="fas fa-map"></i> <?php echo $cms_setting['address']; ?></li>
                    <li class="mr-4"><i class="fas fa-phone"></i> <?php echo $cms_setting['mobile_no']; ?></li>
                    <li class="mr-4"><i class="fas fa-fax"></i></i> <?php echo $cms_setting['fax']; ?></li>
                    <li class="mr-4"><i class="fas fa-envelope"></i> <a href="mailto:<?php echo $cms_setting['email']; ?>"><?php echo $cms_setting['email']; ?></a></li>
                </ul>

            </div>
            <div>
                <ul class="is-flex is-flex-wrap-wrap is-align-items-center is-justify-content-center">

                    <?php
                    $result = web_menu_list(1);
                    foreach ($result as $row) {
                        $url = "#";
                        if ($row['system']) {
                            $url = base_url('home/' . $row['alias']);
                        }else{
                            if ($row['ext_url']) {
                                $url = $row['ext_url_address'];
                            }else{
                                $url = base_url('home/page/' . $row['alias']);
                            }
                        }
                        ?>
                        <li class="mr-4"><a class="button is-white" href="<?php echo $url; ?>">
                                <?php echo $row['title']; ?></a></li>
                    <?php } ?>


                </ul>
            </div>
        </div>
    </div>
    <div class="pt-5" style="border-top: 1px solid #dee2e6;"></div>
    <div class="container">
        <div class="is-flex-tablet is-justify-content-between is-align-items-center">
            <p><?php echo $cms_setting['footer_text']; ?></p>
            <div class="py-2 is-hidden-tablet"></div>
            <div class="ml-auto">
                <a class="mr-4 is-inline-block" href="<?php echo $cms_setting['facebook_url']; ?>" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a class="mr-4 is-inline-block" href="<?php echo $cms_setting['twitter_url']; ?>" target="_blank"><i class="fab fa-twitter"></i></a>
                <a class="mr-4 is-inline-block" href="<?php echo $cms_setting['youtube_url']; ?>" target="_blank"><i class="fab fa-youtube"></i></a>
                <a class="mr-4 is-inline-block" href="<?php echo $cms_setting['google_plus']; ?>" target="_blank"><i class="fab fa-google-plus-g"></i></a>
                <a class="mr-4 is-inline-block" href="<?php echo $cms_setting['linkedin_url']; ?>" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                <a class="mr-4 is-inline-block" href="<?php echo $cms_setting['instagram_url']; ?>" target="_blank"><i class="fab fa-instagram"></i></a>
                <a class="mr-4 is-inline-block" href="<?php echo $cms_setting['pinterest_url']; ?>" target="_blank"><i class="fab fa-pinterest-p"></i></a>
            </div>
        </div>
    </div>
</footer>

<script>
    document.addEventListener('DOMContentLoaded', () => {

        // Get all "navbar-burger" elements
        const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

        // Add a click event on each of them
        $navbarBurgers.forEach( el => {
            el.addEventListener('click', () => {

                // Get the target from the "data-target" attribute
                const target = el.dataset.target;
                const $target = document.getElementById(target);

                // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
                el.classList.toggle('is-active');
                $target.classList.toggle('is-active');

            });
        });

    });
</script>
<script src="<?php echo base_url(); ?>assets/frontend/js/bootstrap.min.js"></script>
<script src="<?php echo base_url(); ?>assets/frontend/js/owl.carousel.min.js"></script>
<script src="<?php echo base_url(); ?>assets/frontend/plugins/shuffle/jquery.shuffle.modernizr.min.js"></script>
<script src="<?php echo base_url(); ?>assets/vendor/select2/js/select2.full.min.js"></script>
<script src="<?php echo base_url(); ?>assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="<?php echo base_url(); ?>assets/frontend/js/custom.js"></script>
<script src="<?php echo base_url(); ?>node_modules/bulma-calendar/dist/js/bulma-calendar.min.js"></script>
