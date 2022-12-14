(function($) {
    "use strict";

    // Main Slider Carousel
    if ($('.main-slider-carousel').length) {
        $(".owl-carousel").on('translate.owl.carousel', function() {
            $(".slider-text span").removeClass('animated fadeInDown').css('opacity', '0');
            $(".slider-text h1").removeClass('animated fadeInUp').css('opacity', '0');
            $(".slider-text p").removeClass('animated fadeInDown').css('opacity', '0');
            $(".slider-text a").removeClass('animated fadeInUp').css('opacity', '0');
        });

        $('.owl-carousel').on('translated.owl.carousel', function() {
            $(".slider-text span").addClass('animated fadeInDown').css('opacity', "1");
            $(".slider-text h1").addClass('animated fadeInUp').css('opacity', "1");
            $(".slider-text p").addClass('animated fadeInDown').css('opacity', "1");
            $(".slider-text a").addClass('animated fadeInUp').css('opacity', "1")
        });

        $('.main-slider-carousel').owlCarousel({
            loop: true,
            margin: 0,
            nav: true,
            animateOut: 'slideOutDown',
            animateIn: 'fadeInLeft',
            active: true,
            smartSpeed: 1000,
            autoplay: 5000,
			dots: false,
            navText: ['<span class="fas fa-arrow-left"></span>', '<span class="fas fa-arrow-right"></span>'],
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1200: {
                    items: 1
                }
            }
        });
    }

    // Testimonial Slider Carousel
    if ($('.testimonial-carousel').length) {
        $('.testimonial-carousel').owlCarousel({
            dots: true,
            loop: true,
            margin: 30,
            nav: false,
            navText: [
                '<i class="fas fa-chevron-left"></i>',
                '<i class="fas fa-chevron-right"></i>'
            ],
            autoplayHoverPause: false,
            autoplay: 6000,
            smartSpeed: 1000,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                800: {
                    items: 1
                },
                1024: {
                    items: 1
                },
                1100: {
                    items: 2
                },
                1200: {
                    items: 2
                }
            }
        });
    }

    // REMOVE # FROM URL
    $('a[href="#"]').on('click', function(e) {
        e.preventDefault();
    });

    // Accordion
    if ($('#accordion-faqs').length) {
        var $active = $('#accordion-faqs .collapse.show').prev().addClass('active');
        $active.find("a").append("<span class=\"fa fa-minus float-right\"></span>");
        $('#accordion-faqs .card-header')
            .not($active)
            .find('a')
            .prepend("<span class=\"fa fa-plus float-right\"></span>");

        $('#accordion-faqs').on('show.bs.collapse', function(e) {
            $('#accordion-faqs .card-header.active')
                .removeClass('active')
                .find('.fa')
                .toggleClass('fa-plus fa-minus');
            $(e.target)
                .prev()
                .addClass('active')
                .find('.fa')
                .toggleClass('fa-plus fa-minus');
        });

        $('#accordion-faqs').on('hide.bs.collapse', function(e) {
            $(e.target)
                .prev()
                .removeClass("active")
                .find(".fa")
                .removeClass("fa-minus")
                .addClass("fa-plus");
        });
    }

    // Doctors Filters
    if ($('#doctors-grid').length) {
        var $grid = $('#doctors-grid');
        $grid.shuffle({
            itemSelector: '.doctors-grid', // the selector for the items in the grid
            speed: 500 // Transition/animation speed (milliseconds)
        });
        /* reshuffle when user clicks a filter item */
        $('#doctors-filter li a').click(function(e) {
            // set active class
            $('#doctors-filter li a').removeClass('active');
            $(this).addClass('active');
            // get group name from clicked item
            var groupName = $(this).attr('data-group');
            // reshuffle grid
            $grid.shuffle('shuffle', groupName);
        });
    }

    // TABS
    $('.nav-tabs a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });

    // Header Sticky
    $(window).on('scroll', function() {
        var header = document.getElementById('strickyMenu');
        var sticky = header.offsetTop;
        if (window.pageYOffset > sticky) {
            $('.stricky').removeClass('fadeIn animated');
            $('.stricky').addClass('stricky-fixed fadeInDown animated');
        } else {
            $('.stricky').removeClass('stricky-fixed fadeInDown animated');
            $('.stricky').addClass('slideIn animated');
        }
    });

    // Scroll To Top
    $(window).on('scroll', function() {
        if (window.pageYOffset > 300) {
            $('.back-to-top').addClass('show');
        } else {
            $('.back-to-top').removeClass('show');
        }
    });

    $('.back-to-top').on('click', function(e) {
        e.preventDefault();
        $('html,body').animate({
            scrollTop: 0
        }, 700);
    });

    $(window).on('load', function() {
        // preloader fadeout onload
        $(".loader-container").addClass('loader-fadeout');
    });

    //Initialize Select2 Elements
    if ($('.select2').length) {
        $('.select2').select2({
            width: "100%"
        });
    }

    //Date picker
    if ($('.date').length) {
        $('.date').datepicker({
            format: "yyyy-mm-dd",
            orientation: "bottom",
            autoclose: true,
            todayHighlight: true
        });
    }
})(window.jQuery);

function getDoctorSchedule(appointment_date, doctor_id, slot_id, schedule_id = '') {
    if (doctor_id !== "" && appointment_date !== "") {
        $("#" + slot_id).html("<option value=''>Exploring...</option>");
        $.ajax({
            url: base_url + 'home/getAppointmentSchedule',
            type: "POST",
            data: {
                'appointment_date': appointment_date,
                'doctor_id': doctor_id,
                'schedule_id': schedule_id
            },
            dataType: 'html',
            success: function(data) {
                $("#" + slot_id).html(data);
            }
        });
    }
}