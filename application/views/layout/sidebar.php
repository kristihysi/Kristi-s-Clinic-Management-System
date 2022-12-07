<aside id="sidebar-left" class="sidebar-left">
	<div class="sidebar-header">
		<div class="sidebar-title">Sidebar Menu</div>
	</div>
	<div class="nano">
        <div class="nano-content">
            <nav id="menu" class="nav-main" role="navigation">
                <ul class="nav nav-main">
                    <!-- Dashboard -->
                    <li class="<?php if ($main_menu == 'dashboard') echo 'nav-active'; ?>">
                        <a href="<?php echo base_url('dashboard'); ?>"><i class="bi bi-layers"></i><span><?php echo translate('dashboard'); ?></span></a>
                    </li>

                    <?php
                    if (get_permission('frontend_setting', 'is_view') ||
                        get_permission('frontend_menu', 'is_view') ||
                        get_permission('frontend_section', 'is_view') ||
                        get_permission('manage_page', 'is_view') ||
                        get_permission('frontend_slider', 'is_view') ||
                        get_permission('frontend_features', 'is_view') ||
                        get_permission('frontend_testimonial', 'is_view') ||
                        get_permission('frontend_services', 'is_view') ||
                        get_permission('frontend_faq', 'is_view')) {
                        ?>
                    <!-- Patient Details -->
                    <li class="nav-parent <?php if ($main_menu == 'frontend') echo 'nav-expanded nav-active'; ?>">
                        <a><i class="fas fa-globe"></i><span><?php echo translate('frontend'); ?></span></a>
                        <ul class="nav nav-children">
                        <?php if(get_permission('frontend_setting', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'frontend/setting') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('frontend/setting'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('setting'); ?></span>
                                </a>
                            </li>
                       <?php } if(get_permission('frontend_menu', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'frontend/menu' || $sub_page == 'frontend/menu_edit') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('frontend/menu'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('menu'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('frontend_section', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'frontend/section_home' ||
                                            $sub_page == 'frontend/section_doctors' ||
                                                $sub_page == 'frontend/section_appointment' ||
                                                    $sub_page == 'frontend/section_faq' ||
                                                        $sub_page == 'frontend/section_contact' ||
                                                            $sub_page == 'frontend/section_about' ||
                                                                $sub_page == 'frontend/section_services') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('frontend/section/index'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('page') . " " . translate('section'); ?></span>
                                </a>
                            </li>
                            <?php } if(get_permission('manage_page', 'is_view')){ ?>
                                    <li class="<?php if ($sub_page == 'frontend/content' || $sub_page == 'frontend/content_edit') echo 'nav-active'; ?>">
                                        <a href="<?php echo base_url('frontend/content'); ?>">
                                            <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('manage') . " " . translate('page'); ?></span>
                                        </a>
                                    </li>
                            <?php } if(get_permission('frontend_slider', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'frontend/slider' || $sub_page == 'frontend/slider_edit') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('frontend/slider'); ?>">
                                    <span><i class="fas fa-caret-right"></i><?php echo translate('slider'); ?></span>
                                </a>
                            </li>
                            <?php } if(get_permission('frontend_features', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'frontend/features' || $sub_page == 'frontend/features_edit') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('frontend/features'); ?>">
                                    <span><i class="fas fa-caret-right"></i><?php echo translate('features'); ?></span>
                                </a>
                            </li>
                            <?php } if(get_permission('frontend_testimonial', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'frontend/testimonial' || $sub_page == 'frontend/testimonial_edit') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('frontend/testimonial'); ?>">
                                    <span><i class="fas fa-caret-right"></i><?php echo translate('testimonial'); ?></span>
                                </a>
                            </li>
                            <?php } if(get_permission('frontend_services', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'frontend/services' || $sub_page == 'frontend/services_edit') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('frontend/services'); ?>">
                                    <span><i class="fas fa-caret-right"></i><?php echo translate('service'); ?></span>
                                </a>
                            </li>
                            <?php } if(get_permission('frontend_faq', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'frontend/faq' || $sub_page == 'frontend/faq_edit') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('frontend/faq'); ?>">
                                    <span><i class="fas fa-caret-right"></i><?php echo translate('faq'); ?></span>
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                    </li>
                    <?php } ?>


                    <?php
                    if(get_permission('patient', 'is_add') ||
                    get_permission('patient', 'is_view') ||
                    get_permission('patient_category', 'is_add') ||
                    get_permission('patient_category', 'is_view') ||
                    get_permission('patient_disable_authentication', 'is_view')){
                    ?>
                    <!-- Patient Details -->
                    <li class="nav-parent <?php if ($main_menu == 'patient') echo 'nav-expanded nav-active'; ?>">
                        <a><i class="fas fa-wheelchair"></i><span><?php echo translate('patient') . " " . translate('details'); ?></span></a>
                        <ul class="nav nav-children">
                        <?php if(get_permission('patient', 'is_add')){ ?>
                            <li class="<?php if ($sub_page == 'patient/add') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('patient/create'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('create') . " " . translate('patient'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('patient', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'patient/view' || $sub_page == 'patient/profile') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('patient/view'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('patient') . " " . translate('list'); ?></span>
                                </a>
                            </li>
                        <?php }  if(get_permission('patient_category', 'is_add') || get_permission('patient_category', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'patient/category') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('patient/category'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('category'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('patient_disable_authentication', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'patient/disable_authentication') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('patient/disable_authentication'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('login_deactivate'); ?></span>
                                </a>
                            </li>
                        <?php } ?>
                        </ul>
                    </li>
                    <?php } ?>
                    <?php
                    if(get_permission('chemical', 'is_view') ||
                    get_permission('chemical_category', 'is_view') ||
                    get_permission('chemical_supplier', 'is_view') ||
                    get_permission('chemical_unit', 'is_view') ||
                    get_permission('chemical_purchase', 'is_view') ||
                    get_permission('chemical_stock', 'is_view') ||
                    get_permission('reagent_assigned', 'is_view') ||
                    get_permission('inventory_report', 'is_view')){
                    ?><?php } ?>

                    <?php if(get_permission('schedule', 'is_view')){ ?>
                    <!-- Schedule -->
                    <li class="<?php if ($main_menu == 'schedule') echo 'nav-active'; ?>">
                        <a href="<?php echo base_url('schedule'); ?>"><i class="fas fa-dna"></i><span><?php echo translate('schedule'); ?></span></a>
                    </li>
                    <?php } ?>
                    <?php
                    if(get_permission('appointment', 'is_view') ||
                    get_permission('appointment', 'is_add') ||
                    (loggedin_role_id() == 7) ||
                    get_permission('appointment_request', 'is_view')){
                    ?>
                    <!-- Appointment -->
                    <li class="nav-parent <?php if ($main_menu == 'appointment') echo 'nav-expanded nav-active'; ?>">
                        <a>
                            <i class="fas fa-notes-medical"></i><span><?php echo translate('appointment'); ?></span>
                        </a>
                        <ul class="nav nav-children">
                        <?php if(get_permission('appointment', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'appointment/index' || $sub_page == 'appointment/edit') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('appointment'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('appointment') . " " . translate('list'); ?></span>
                                </a>
                            </li>
                        <?php }  if(get_permission('appointment', 'is_add')){ ?>
                            <li class="<?php if ($sub_page == 'appointment/add') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('appointment/add'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('add') . " " . translate('appointment'); ?></span>
                                </a>
                            </li>
                        <?php }  if(get_permission('appointment_request', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'appointment/requested_list') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('appointment/requested_list'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('requested_list'); ?></span>
                                </a>
                            </li>
                        <?php }  if(loggedin_role_id() == 7){ ?>
                            <li class="<?php if ($sub_page == 'appointment/my_list') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('appointment/my_list'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('my_appointment'); ?></span>
                                </a>
                            </li>
                        <?php } ?>
                        </ul>
                    </li>
                    <?php } ?>
					<?php
                    if(get_permission('employee', 'is_view') ||
                    get_permission('employee', 'is_add') ||
                    get_permission('designation', 'is_view') ||
                    get_permission('designation', 'is_add') ||
                    get_permission('department', 'is_view') ||
                    get_permission('employee_disable_authentication', 'is_view')){
					?>
                    <!-- Employees -->
                    <li class="nav-parent <?php if ($main_menu == 'employee') echo 'nav-expanded nav-active'; ?>">
                        <a><i class="fas fa-users"></i><span><?php echo translate('employee'); ?></span></a>
                        <ul class="nav nav-children">
                        <?php if(get_permission('employee', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'employee/view' ||
                                                    $sub_page == 'employee/profile' ||
                                                        $sub_page == 'employee/add_short_bio') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('employee/view'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('employee') . " " . translate('list'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('department', 'is_view') || get_permission('department', 'is_add')){ ?>
                            <li class="<?php if ($sub_page == 'employee/department') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('employee/department'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('add') . " " . translate('department'); ?></span>
                                </a>
                            </li>
                        <?php }  if(get_permission('designation', 'is_view') || get_permission('designation', 'is_add')){ ?>
                            <li class="<?php if ($sub_page == 'employee/designation') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('employee/designation'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('add') . " " . translate('designation'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('employee', 'is_add')){ ?>
                            <li class="<?php if ($sub_page == 'employee/add') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('employee/create'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('add') . " " . translate('employee'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('employee_disable_authentication', 'is_view')){ ?>
                            <li class="<?php if ($sub_page == 'employee/disable_authentication') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('employee/disable_authentication'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('login_deactivate'); ?></span>
                                </a>
                            </li>
                        <?php } ?>
                        </ul>
                    </li>
					<?php } ?>
                    <?php
                    if(get_permission('salary_template', 'is_view') ||
                    get_permission('salary_payment', 'is_view') ||
                    get_permission('salary_assign', 'is_view') ||
                    get_permission('salary_summary_report', 'is_view') ||
                    get_permission('leave_category', 'is_view') ||
                    get_permission('leave_category', 'is_add') ||
                    get_permission('my_leave', 'is_view') ||
                    get_permission('leave_manage', 'is_view') ||
                    get_permission('staff_attendance', 'is_view') ||
                    get_permission('staff_attendance', 'is_add') ||
                    get_permission('staff_attendance', 'is_view')){
                    ?><?php } ?>


                    <?php
                    if(get_permission('lab_test', 'is_view') ||
                    get_permission('test_category', 'is_view')) {
                    ?>


                    <?php } ?>
                    <?php
                    if(get_permission('referral_assign', 'is_view') ||
                    get_permission('referral_assign', 'is_add') ||
                    get_permission('commission_withdrawal', 'is_view') ||
                    get_permission('my_commission', 'is_view') ||
                    get_permission('referral_reports', 'is_view')){
                    ?>


                    <?php } ?>
                    <?php
                    if(get_permission('account', 'is_view') ||
                    get_permission('voucher_head', 'is_view') ||
                    get_permission('voucher_head', 'is_add') ||
                    get_permission('voucher', 'is_view') ||
                    get_permission('accounting_reports', 'is_view')){
                    ?>

                    <?php } ?>
                    <?php 
                    if(get_permission('lab_test_bill', 'is_add') ||
                    get_permission('lab_test_bill', 'is_view') ||
                    get_permission('test_bill_report', 'is_view')){
                    ?><?php } ?>

                    <?php
                    if(get_permission('test_report', 'is_view') ||
                    get_permission('test_report_template', 'is_view')) {
                    ?>
                    <?php } ?>

                    <?php
                    if(get_permission('global_setting', 'is_view') ||
                    get_permission('email_setting', 'is_view') ||
                    get_permission('database_backup', 'is_view') ||
                    get_permission('language', 'is_view') ||
                    get_permission('database_backup', 'is_view') ||
                    get_permission('database_restore', 'is_add')){
                    ?>
                    <!-- Settings -->
                    <li class="nav-parent <?php if ($main_menu == 'settings') echo 'nav-expanded nav-active'; ?>">
                        <a><i class="fas fa-cogs"></i><span><?php echo translate('settings'); ?></span></a>
                        <ul class="nav nav-children">
                        <?php if(get_permission('global_setting', 'is_view')) { ?>
                            <li class="<?php if ($sub_page == 'setting/index') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('settings'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('global') . " " . translate('setting'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('sms_setting', 'is_view')) { ?>
                            <li class="<?php if ($sub_page == 'smssetting/index' || $sub_page == 'smssetting/template') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('smssettings'); ?>">
                                    <span><i class="fas fa-caret-right"></i><?php echo translate('sms') . " " . translate('settings'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('email_setting', 'is_view')) { ?>
                            <li class="<?php if ($sub_page == 'mailconfig/index' || $sub_page == 'mailconfig/template') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('mailconfig'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('email') . " " . translate('setting'); ?></span>
                                </a>
                            </li>
                        <?php } if(loggedin_role_id() == 1) { ?>
                            <li class="<?php if ($sub_page == 'role/index' || $sub_page == 'role/permission') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('role'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('role') . " " . translate('permission'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('language', 'is_view')) { ?>
                            <li class="<?php if ($sub_page == 'language/index' || $sub_page == 'language/word_update' || $sub_page == 'language/edit') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('language'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('language') . " " . translate('setting'); ?></span>
                                </a>
                            </li>
                        <?php } if(get_permission('database_backup', 'is_view') || get_permission('database_restore', 'is_add')) { ?>
                            <li class="<?php if ($sub_page == 'backup/index') echo 'nav-active'; ?>">
                                <a href="<?php echo base_url('backup'); ?>">
                                    <span><i class="fas fa-caret-right" aria-hidden="true"></i><?php echo translate('database') . " " . translate('backup'); ?></span>
                                </a>
                            </li>
                        <?php } ?>
                        </ul>
                    </li>
                    <?php } ?>
                </ul>
            </nav>
        </div>
	</div>
</aside>
<!-- end sidebar -->