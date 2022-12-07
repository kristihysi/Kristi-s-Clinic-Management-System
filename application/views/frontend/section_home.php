<div class="row">
	<div class="col-md-2 mb-md">
		<?php $this->load->view('frontend/sidebar'); ?>
	</div>
	<div class="col-md-10">
		<section class="panel">
			<div class="tabs-custom">
				<ul class="nav nav-tabs">
					<li class="<?php echo ($validation == 1 ? 'active' : ''); ?>">
						<a href="#welcome" data-toggle="tab"><?php echo translate('welcome') . ' ' . translate('message'); ?></a>
					</li>
					<li class="<?php echo ($validation == 2 ? 'active' : ''); ?>">
						<a href="#doctors" data-toggle="tab"><?php echo translate('doctors'); ?></a>
					</li>
					<li class="<?php echo ($validation == 3 ? 'active' : ''); ?>">
						<a href="#testimonial" data-toggle="tab"><?php echo translate('testimonial'); ?></a>
					</li>
					<li class="<?php echo ($validation == 4 ? 'active' : ''); ?>">
						<a href="#services" data-toggle="tab"><?php echo translate('services'); ?></a>
					</li>
					<li class="<?php echo ($validation == 5 ? 'active' : ''); ?>">
						<a href="#cta" data-toggle="tab"><?php echo translate('call_to_action_section'); ?></a>
					</li>
					<li class="<?php echo ($validation == 6 ? 'active' : ''); ?>">
						<a href="#options" data-toggle="tab"><?php echo translate('options'); ?></a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane <?php echo ($validation == 1 ? 'active' : ''); ?>" id="welcome">
						<?php echo form_open_multipart($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
							<div class="form-group <?php if (form_error('wel_title')) echo 'has-error'; ?>">
								<label class="col-md-3 control-label"><?php echo translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="wel_title" value="<?php echo set_value('wel_title', $wellcome['title']); ?>" />
									<span class="error"><?php echo form_error('wel_title'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('subtitle'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="subtitle" value="<?php echo set_value('subtitle', $wellcome['subtitle']); ?>" />
									<span class="error"><?php echo form_error('subtitle'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label  class="col-md-3 control-label"><?php echo translate('description'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<textarea class="form-control" name="description" rows="5"><?php echo set_value('description', $wellcome['description']); ?></textarea>
									<span class="error"><?php echo form_error('description'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('photo'); ?> <span class="required">*</span></label>
								<div class="col-md-4">
									<input type="hidden" name="old_photo" value="<?php $well_ele = json_decode($wellcome['elements'], true); echo $well_ele['image'] ?>">
									<input type="file" name="photo" class="dropify" data-height="150" data-default-file="<?php echo base_url('uploads/frontend/home_page/' . $well_ele['image']); ?>" />
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-3">
										<button type="submit" class="btn btn-default btn-block" name="home_wellcome" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
					<div class="tab-pane <?php echo ($validation == 2 ? 'active' : ''); ?>" id="doctors">
						<?php echo form_open_multipart($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
							<div class="form-group <?php if (form_error('doc_title')) echo 'has-error'; ?>">
								<label class="col-md-3 control-label"><?php echo translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="doc_title" value="<?php echo set_value('doc_title', $doctors['title']); ?>" />
									<span class="error"><?php echo form_error('doc_title'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Start No Of Doctor <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="doctor_start" value="<?php $doc_ele = json_decode($doctors['elements'], true); echo set_value('doctor_start', $doc_ele['doctor_start']); ?>" />
									<span class="error"><?php echo form_error('doctor_start'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label  class="col-md-3 control-label"><?php echo translate('description'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<textarea class="form-control" name="doc_description" rows="5"><?php echo set_value('doc_description', $doctors['description']); ?></textarea>
									<span class="error"><?php echo form_error('doc_description'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('photo'); ?> <span class="required">*</span></label>
								<div class="col-md-4">
									<input type="hidden" name="old_photo" value="<?php echo $doc_ele['image']; ?>">
									<input type="file" name="photo" class="dropify" data-height="150" data-default-file="<?php echo base_url('uploads/frontend/home_page/' . $doc_ele['image']); ?>" />
									<span class="error"><?php echo form_error('photo'); ?></span>
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-3">
										<button type="submit" class="btn btn-default btn-block" name="doctor_list" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
					<div class="tab-pane <?php echo ($validation == 3 ? 'active' : ''); ?>" id="testimonial">
						<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
							<div class="form-group <?php if (form_error('tes_title')) echo 'has-error'; ?>">
								<label class="col-md-3 control-label"><?php echo translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="tes_title" value="<?php echo set_value('tes_title', $testimonial['title']); ?>" />
									<span class="error"><?php echo form_error('tes_title'); ?></span>
								</div>
							</div>
							<div class="form-group <?php if (form_error('tes_description')) echo 'has-error'; ?>">
								<label class="col-md-3 control-label"><?php echo translate('description'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<textarea class="form-control" name="tes_description" rows="3"><?php echo set_value('tes_description', $testimonial['description']); ?></textarea>
									<span class="error"><?php echo form_error('tes_description'); ?></span>
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-3">
										<button type="submit" class="btn btn-default btn-block" name="testimonial" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
					<div class="tab-pane <?php echo ($validation == 4 ? 'active' : ''); ?>" id="services">
						<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="ser_title" value="<?php echo set_value('ser_title', $services['title']); ?>" />
									<span class="error"><?php echo form_error('ser_title'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('description'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<textarea class="form-control" name="ser_description" rows="3"><?php echo set_value('ser_description', $services['description']); ?></textarea>
									<span class="error"><?php echo form_error('ser_description'); ?></span>
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-3">
										<button type="submit" class="btn btn-default btn-block" name="services" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
					<div class="tab-pane <?php echo ($validation == 5 ? 'active' : ''); ?>" id="cta">
						<?php echo form_open_multipart($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('cta') . " " . translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="cta_title" value="<?php echo set_value('cta_title', $cta['title']); ?>" />
									<span class="error"><?php echo form_error('cta_title'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('mobile_no'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="mobile_no" value="<?php $elements = json_decode($cta['elements'], true); echo set_value('mobile_no', $elements['mobile_no']); ?>" />
									<span class="error"><?php echo form_error('mobile_no'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('button_text'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="button_text" value="<?php echo set_value('button_text', $elements['button_text']); ?>" />
									<span class="error"><?php echo form_error('button_text'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('button_url'); ?> <span class="required">*</span></label>
								<div class="col-md-7">
									<input type="text" class="form-control" name="button_url" value="<?php echo set_value('button_url', $elements['button_url']); ?>" />
									<span class="error"><?php echo form_error('button_url'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('photo'); ?> <span class="required">*</span></label>
								<div class="col-md-4">
									<input type="hidden" name="old_photo" value="<?php echo $elements['image'] ?>">
									<input type="file" name="photo" class="dropify" data-height="150" data-default-file="<?php echo base_url('uploads/frontend/home_page/' . $elements['image']); ?>" />
									<span class="error"><?php echo form_error('photo'); ?></span>
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-3">
										<button type="submit" class="btn btn-default btn-block" name="cta" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
					<div class="tab-pane <?php echo ($validation == 6 ? 'active' : ''); ?>" id="options">
						<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
							<div class="form-group <?php if (form_error('page_title')) echo 'has-error'; ?>">
								<label class="col-md-3 control-label"><?php echo translate('page') . " " .  translate('_title'); ?> <span class="required">*</span></label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="page_title" value="<?php echo set_value('page_title', $home_seo['page_title']); ?>" />
									<span class="error"><?php echo form_error('page_title'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('meta') . " " . translate('keyword'); ?></label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="meta_keyword" value="<?php echo set_value('meta_keyword', $home_seo['meta_keyword']); ?>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"><?php echo translate('meta') . " " . translate('description'); ?></label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="meta_description" value="<?php echo set_value('meta_description', $home_seo['meta_description']); ?>" />
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-3">
										<button type="submit" class="btn btn-default btn-block" name="options" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>