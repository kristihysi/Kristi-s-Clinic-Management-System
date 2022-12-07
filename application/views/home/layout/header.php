<!-- Start Navbar -->
<nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
        <a class="navbar-item" href="<?php echo base_url('home'); ?>">
            <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
        </a>

        <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
        </a>
    </div>

    <div id="navbarBasicExample" class="navbar-menu">
        <div class="navbar-start">

            <?php
            if ($this->uri->segment(3)) {
                $active_menu = $this->uri->segment(3);
            }else{
                $active_menu = $this->uri->segment(2,'index');
            }
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
                <li class="navbar-item <?php echo $active_menu == $row['alias'] ? 'is-tab is-active' : ''; ?>">
                    <a href="<?php echo $url; ?>" class="navbar-item" <?php echo $row['open_new_tab'] ? "target='_blank'" : ''; ?> ><?php echo $row['title']; ?></a>
                </li>
            <?php } ?>


            <a class="navbar-item">
                <?php echo $cms_setting['working_hours']; ?>
            </a>

            <a class="navbar-item">
                <?php echo $cms_setting['email']; ?>
            </a>

            <a class="navbar-item">
                <?php echo $cms_setting['mobile_no']; ?>
            </a>

        </div>

        <div class="navbar-end">
            <div class="navbar-item">
                <div class="buttons">
                    <?php if (!is_loggedin()) { ?>
                        <a class="button is-primary" href="<?php echo base_url('authentication'); ?>"><i class="mr-2 fas fa-lock"></i> Login</a>
                    <?php }else{ ?>
                        <a class="button is-light" href="<?php echo base_url('dashboard'); ?>"><i class="mr-2 fas fa-home"></i> Dashboard</a>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- End Navbar -->