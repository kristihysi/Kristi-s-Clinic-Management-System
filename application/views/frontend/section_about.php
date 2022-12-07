<div class="row">
	<div class="col-md-2 mb-md">
		<?php $this->load->view('frontend/sidebar'); ?>
	</div>
	<div class="col-md-10">
		<section class="panel">
			<div class="tabs-custom">
				<ul class="nav nav-tabs">
					<li class="<?php echo ($validation == 1 ? 'active' : ''); ?>">
						<a href="#about" data-toggle="tab"><?php echo translate('about'); ?></a>
					</li>
					<li class="<?php echo ($validation == 2 ? 'active' : ''); ?>">
						<a href="#service" data-toggle="tab"><?php echo translate('service'); ?></a>
					</li>
					<li class="<?php echo ($validation == 3 ? 'active' : ''); ?>">
						<a href="#cta" data-toggle="tab"><?php echo translate('call_to_action_section'); ?></a>
					</li>
					<li class="<?php echo ($validation == 4 ? 'active' : ''); ?>">
						<a href="#option" data-toggle="tab"><?php echo translate('options'); ?></a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane <?php echo ($validation == 1 ? 'active' : ''); ?>" id="about">
						<?php echo form_open_multipart($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered')); ?>
							<div class="form-group <?php if (form_error('title')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="title" value="<?php echo set_value('title', $about['title']); ?>" />
									<span class="error"><?php echo form_error('title'); ?></span>
								</div>
							</div>
							<div class="form-group mt-md <?php if (form_error('subtitle')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('subtitle'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="subtitle" value="<?php echo set_value('subtitle', $about['subtitle']); ?>" />
									<span class="error"><?php echo form_error('subtitle'); ?></span>
								</div>
							</div>
							<div class="form-group mt-md <?php if (form_error('content')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('content'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<textarea name="content" id="editor"><?php echo set_value('content', $about['content']); ?></textarea>
									<span class="error"><?php echo form_error('content'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label"><?php echo translate('about_photo'); ?> <span class="required">*</span></label>
								<div class="col-md-4">
									<input type="hidden" name="old_photo" value="<?php echo $about['about_image']; ?>">
									<input type="file" name="photo" class="dropify" data-height="150" data-default-file="<?php echo base_url('uploads/frontend/about/' . $about['about_image']); ?>" />
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-2">
										<button type="submit" class="btn btn-default btn-block" name="about" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
					<div class="tab-pane <?php echo ($validation == 2 ? 'active' : ''); ?>" id="service">
						<?php echo form_open_multipart($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered')); ?>
							<div class="form-group <?php if (form_error('title')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="title" value="<?php echo set_value('title', $service['title']); ?>" />
									<span class="error"><?php echo form_error('title'); ?></span>
								</div>
							</div>
							<div class="form-group mt-md <?php if (form_error('subtitle')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('subtitle'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="subtitle" value="<?php echo set_value('subtitle', $service['subtitle']); ?>" />
									<span class="error"><?php echo form_error('subtitle'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label"><?php echo translate('parallax_photo'); ?> <span class="required">*</span></label>
								<div class="col-md-4">
									<input type="hidden" name="old_photo" value="<?php echo $service['parallax_image']; ?>">
									<input type="file" name="photo" class="dropify" data-height="150" data-default-file="<?php echo base_url('uploads/frontend/about/' . $service['parallax_image']); ?>" />
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-2">
										<button type="submit" class="btn btn-default btn-block" name="service" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
					<div class="tab-pane <?php echo ($validation == 3 ? 'active' : ''); ?>" id="cta">
						<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered')); ?>
							<div class="form-group <?php if (form_error('cta_title')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('cta') . " " . translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="cta_title" value="<?php $elements = json_decode($about['elements'], true); echo set_value('cta_title', $elements['cta_title']); ?>" />
									<span class="error"><?php echo form_error('cta_title'); ?></span>
								</div>
							</div>
							<div class="form-group <?php if (form_error('button_text')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('button_text'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="button_text" value="<?php echo set_value('button_text', $elements['button_text']); ?>" />
									<span class="error"><?php echo form_error('button_text'); ?></span>
								</div>
							</div>
							<div class="form-group <?php if (form_error('button_url')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('button_url'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="button_url" value="<?php echo set_value('button_url', $elements['button_url']); ?>" />
									<span class="error"><?php echo form_error('button_url'); ?></span>
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-2">
										<button type="submit" class="btn btn-default btn-block" name="cta" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
					<div class="tab-pane <?php echo ($validation == 4 ? 'active' : ''); ?>" id="option">
						<?php echo form_open_multipart($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered')); ?>
							<div class="form-group <?php if (form_error('page_title')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('page') . " " . translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="page_title" value="<?php echo set_value('page_title', $about['page_title']); ?>" />
									<span class="error"><?php echo form_error('page_title'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label"><?php echo translate('banner_photo'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="hidden" name="old_photo" value="<?php echo $about['banner_image']; ?>">
									<input type="file" name="photo" class="dropify" data-height="150" data-default-file="<?php echo base_url('uploads/frontend/banners/' . $about['banner_image']); ?>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label"><?php echo translate('meta') . " " . translate('keyword'); ?></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="meta_keyword" value="<?php echo set_value('meta_keyword', $about['meta_keyword']); ?>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label"><?php echo translate('meta') . " " . translate('description'); ?></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="meta_description" value="<?php echo set_value('meta_description', $about['meta_description']); ?>" />
								</div>
							</div>
							<footer class="panel-footer mt-lg">
								<div class="row">
									<div class="col-md-2 col-md-offset-2">
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