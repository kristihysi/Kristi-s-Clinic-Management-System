<section class="panel">
	<div class="tabs-custom">
		<ul class="nav nav-tabs">
			<li>
				<a href="<?php echo base_url('frontend/faq'); ?>"><i class="fas fa-list-ul"></i> <?php echo translate('faq') . " " . translate('list'); ?></a>
			</li>
			<li class="active">
				<a href="#edit" data-toggle="tab"><i class="far fa-edit"></i> <?php echo translate('edit') . " " . translate('faq'); ?></a>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="edit">
				<?php echo form_open_multipart($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered')); ?>
					<input type="hidden" name="faq_id" value="<?php echo $faq['id']; ?>">
					<div class="form-group <?php if (form_error('title')) echo 'has-error'; ?>">
						<label class="col-md-2 control-label"><?php echo translate('title'); ?> <span class="required">*</span></label>
						<div class="col-md-8">
							<input type="text" class="form-control" name="title" value="<?php echo set_value('title', $faq['title']); ?>" />
							<span class="error"><?php echo form_error('title'); ?></span>
						</div>
					</div>
					<div class="form-group <?php if (form_error('description')) echo 'has-error'; ?>">
						<label class="col-md-2 control-label"><?php echo translate('description'); ?> <span class="required">*</span></label>
						<div class="col-md-8">
							<textarea name="description" id="editor"><?php echo set_value('description', $faq['description']); ?></textarea>
							<span class="error"><?php echo form_error('description'); ?></span>
						</div>
					</div>
					<footer class="panel-footer mt-lg">
						<div class="row">
							<div class="col-md-2 col-md-offset-3">
								<button type="submit" class="btn btn-default btn-block" name="save" value="1">
									<i class="fas fa-edit"></i> <?php echo translate('update'); ?>
								</button>
							</div>
						</div>	
					</footer>
				<?php echo form_close(); ?>
			</div>
		</div>
	</div>
</section>