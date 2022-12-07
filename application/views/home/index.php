<!-- Main Slider Section Starts -->
<section class="main-slider">
    <div class="container-fluid">
        <ul class="main-slider-carousel owl-carousel owl-theme slide-nav">
            <?php
            $sliders = $this->db->get_where('front_cms_home', array('item_type' => 'slider'))->result();
            foreach ($sliders as $key => $value) {
                $elements = json_decode($value->elements, true);
                ?>
                <li class="slider-wrapper">
                    <div class="image" style="background-image: url(<?php echo base_url('uploads/frontend/slider/' . $elements['image']) ?>)" ></div>
                    <div class="slider-caption <?php echo $elements['position'];  ?>">
                        <div class="container">
                            <div class="wrap-caption">
                                <h1><?php echo $value->title; ?></h1>
                                <div class="text center"><?php echo $value->description; ?></div>
                                <div class="link-btn">
                                    <a href="<?php echo $elements['button_url1']; ?>" class="btn">
                                        <?php echo $elements['button_text1']; ?>
                                    </a>
                                    <a href="<?php echo $elements['button_url2']; ?>" class="btn btn1">
                                        <?php echo $elements['button_text2']; ?>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="slide-overlay"></div>
                </li>
            <?php } ?>
        </ul>
    </div>
</section>
<!-- Main Slider Section Ends -->



<section class="section" id="services">
    <div class="section-heading">
        <h3 style="text-align: center;" class="title is-2">Lorem Ipsum Text</h3>
        <br>
    </div>
    <div class="container">

        <div class="columns">
            <?php
            $features = $this->db->get_where('front_cms_home', array('item_type' => 'features'))->result();
            foreach ($features as $key => $value) {
                $elements = json_decode($value->elements, true);
                ?>
                <div class="column">
                    <div class="box">
                        <div class="content">

                            <h4 class="title is-5"><i class="<?php echo $elements['icon']; ?>"></i> <?php echo $value->title; ?></h4>
                            <?php echo $value->description; ?>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>




        <!-- Main Container Starts -->
        <?php
        $wellcome = $this->db->get_where('front_cms_home', array('item_type' => 'wellcome'))->row_array();
        $elements = json_decode($wellcome[ 'elements' ], true);
        ?>
        <!-- Welcome Section Starts -->
        <div class="columns  is-vcentered">
            <div data-aos="fade-left" class="column is-10-mobile is-offset-1-mobile is-10-tablet is-offset-1-tablet is-4-desktop is-offset-1-desktop is-4-widescreen is-offset-1-widescreen is-4-fullhd is-offset-1-fullhd aos-init aos-animate">
                <figure class="image is-square">
                    <img src="<?php echo base_url('uploads/frontend/home_page/' . $elements['image']); ?>">
                </figure>
            </div>
            <div data-aos="fade-down" class="column is-10-mobile is-offset-1-mobile is-10-tablet is-offset-1-tablet is-5-desktop is-offset-1-desktop is-5-widescreen is-offset-1-widescreen is-5-fullhd is-offset-1-fullhd aos-init aos-animate">
                <h1 class="titled title is-1 mb-6">
                    <?php echo $wellcome['title']; ?>
                </h1>
                <h2 class="subtitled subtitle">
                    <?php echo nl2br($wellcome['description']); ?>
                </h2>
            </div>
        </div>


        <br>
        <?php $services = $this->db->get_where('front_cms_home', array('item_type' => 'services'))->row_array(); ?>

        <h2 style="text-align: center;" class="title is-2"><?php echo $services['title']; ?></h2>
        <h6 style="text-align: center;" class="title is-6"><?php echo nl2br($services['description']); ?></h6>
        <div class="columns is-multiline">
            <?php
            $services_list = $this->db->get('front_cms_services_list')->result_array();
            foreach ($services_list as $key => $value) {
                ?>
                <div class="column is-12 is-4-desktop">
                    <div class="mb-6 is-flex">
                <span id="mediacss2">
                    <i class="<?php echo $value['icon']; ?>"></i>
                </span>
                        <div class="ml-3">
                            <h4 class="is-size-4 has-text-weight-bold mb-2"><?php echo $value['title']; ?></h4>
                            <p class="subtitle has-text-grey"><?php $string = $value['description']; echo (strlen($string) > 30) ? substr($string, 0, 30) . '...' : $string; ?></p>
                        </div>
                    </div>
                </div>

            <?php } ?>


        </div>

    </div>
</section>



<!-- Book Appointment Box Starts -->
<?php
$appointment = $this->db->get_where('front_cms_home', array('item_type' => 'cta'))->row_array();
$elements = json_decode($appointment[ 'elements' ], true);
?>
<section class="section has-background-primary">
    <div class="container">
        <div class="is-vcentered columns is-multiline">
            <div class="column is-6 is-5-desktop mb-4">
                <span class="has-text-white"><?php echo $appointment['title']; ?></span>
                <h2 class="has-text-white mt-2 mb-3 is-size-1 is-size-3-mobile has-text-weight-bold"><i class="mr-2 fa fa-phone-square"></i><?php echo $elements['mobile_no']; ?></h2>
            </div>
            <div class="column is-5 ml-auto">
                <div class="mx-auto box p-6 has-background-light has-text-centered">
                    <h4 class="is-size-5 mb-2 has-text-weight-bold">Talk with Us</h4>
                    <p class="has-text-grey-dark mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        <a href="<?php echo $elements['button_url']; ?>" class="button is-primary is-fullwidth"><?php echo $elements['button_text']; ?></a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Book Appointment Box Ends -->