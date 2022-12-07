<div class="row">
	<div class="col-md-2 mb-md">
		<?php $this->load->view('frontend/sidebar'); ?>
	</div>
	<div class="col-md-10">
		<section class="panel">
			<div class="tabs-custom">
				<ul class="nav nav-tabs">
					<li class="<?php echo ($validation == 1 ? 'active' : ''); ?>">
						<a href="#about" data-toggle="tab"><?php echo translate('faq'); ?></a>
					</li>
					<li class="<?php echo ($validation == 2 ? 'active' : ''); ?>">
						<a href="#options" data-toggle="tab"><?php echo translate('options'); ?></a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane <?php echo ($validation == 1 ? 'active' : ''); ?>" id="about">
						<?php echo form_open($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
							<div class="form-group mt-md <?php if (form_error('title')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('title'); ?> <span class="required">*</span></label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="title" value="<?php echo set_value('title', $faq['title']); ?>" />
									<span class="error"><?php echo form_error('title'); ?></span>
								</div>
							</div>
							<div class="form-group mt-md <?php if (form_error('description')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('description'); ?> <span class="required">*</span></label>
								<div class="col-md-9 mb-lg">
									<textarea name="description" id="editor"><?php echo set_value('description', $faq['description']); ?></textarea>
									<span class="error"><?php echo form_error('description'); ?></span>
								</div>
							</div>
							<footer class="box-footer">
								<div class="row">
									<div class="col-md-2 col-md-offset-2">
										<button type="submit" class="btn btn-default btn-block" name="faq" value="1">
											<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
										</button>
									</div>
								</div>
							</footer>
						<?php echo form_close(); ?>
					</div>
					<div class="tab-pane <?php echo ($validation == 2 ? 'active' : ''); ?>" id="options">
						<?php echo form_open_multipart($this->uri->uri_string(), array('class' => 'form-horizontal')); ?>
							<div class="form-group mt-md <?php if (form_error('page_title')) echo 'has-error'; ?>">
								<label class="col-md-2 control-label"><?php echo translate('page') . " " .  translate('_title'); ?> <span class="required">*</span></label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="page_title" value="<?php echo set_value('page_title', $faq['page_title']); ?>" />
									<span class="error"><?php echo form_error('page_title'); ?></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label"><?php echo translate('banner_photo'); ?> <span class="required">*</span></label>
								<div class="col-md-8">
									<input type="hidden" name="old_photo" value="<?php echo $faq['banner_image']; ?>">
									<input type="file" name="photo" class="dropify" data-height="150" data-default-file="<?php echo base_url('uploads/frontend/banners/' . $faq['banner_image']); ?>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label"><?php echo translate('meta') . " " . translate('keyword'); ?></label>
								<div class="col-md-8">
									<input type="text" class="form-control" name="meta_keyword" value="<?php echo set_value('meta_keyword', $faq['meta_keyword']); ?>" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label"><?php echo translate('meta') . " " . translate('description'); ?></label>
								<div class="col-md-8 mb-lg">
									<input type="text" class="form-control" name="meta_description" value="<?php echo set_value('meta_description', $faq['meta_description']); ?>" />
								</div>
							</div>
							<footer class="box-footer">
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