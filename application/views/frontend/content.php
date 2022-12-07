<section class="panel">
	<div class="tabs-custom">
		<ul class="nav nav-tabs">
			<li class="<?php echo (!isset($validation_error) ? 'active' : ''); ?>">
				<a href="#list" data-toggle="tab"><i class="fas fa-list-ul"></i> <?php echo translate('page') . " " . translate('list'); ?></a>
			</li>
	<?php if (get_permission('manage_page', 'is_add')) { ?>
			<li class="<?php echo (isset($validation_error) ? 'active' : ''); ?>">
				<a href="#create" data-toggle="tab"><i class="far fa-edit"></i> <?php echo translate('add') . " " . translate('page'); ?></a>
			</li>
	<?php } ?>
		</ul>
		<div class="tab-content">
			<div id="list" class="tab-pane <?php echo (!isset($validation_error) ? 'active' : ''); ?>">
				<table class="table table-bordered table-hover table-condensed table_default" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th><?php echo translate('sl'); ?></th>
							<th><?php echo translate('page') . " " . translate('title'); ?></th>
							<th><?php echo translate('menu') . " " . translate('title'); ?></th>
							<th><?php echo translate('url'); ?></th>
							<th><?php echo translate('action'); ?></th>
						</tr>
					</thead>
					<tbody>
						<?php
							$count = 1;
							if (!empty($pagelist)) {
								foreach ($pagelist as $row):
								?>
						<tr>
							<td><?php echo $count++; ?></td>
							<td><?php echo $row['page_title']; ?></td>
							<td><?php echo $row['menu_title']; ?></td>
							<td><a href="<?php echo base_url('home/page/'.$row['alias']); ?>" target="_blank"><?php echo base_url('home/page/'.$row['alias']); ?></a></td>
							<td class="min-w-xs">
							<?php if (get_permission('manage_page', 'is_edit')) { ?>
								<a href="<?php echo base_url('frontend/content/edit/' . $row['id']); ?>" class="btn btn-default btn-circle icon" data-toggle="tooltip"
								data-original-title="<?php echo translate('edit'); ?>"> 
									<i class="fas fa-pen-nib"></i>
								</a>
							<?php } ?>
							<?php
								if (get_permission('manage_page', 'is_delete')) {
									echo btn_delete('frontend/content/delete/' . $row['id']);
								}
							?>
							</td>
						</tr>
						<?php endforeach; }?>
					</tbody>
				</table>
			</div>
	<?php if (get_permission('manage_page', 'is_add')) { ?>
			<div class="tab-pane <?php echo (isset($validation_error) ? 'active' : ''); ?>" id="create">
				<?php echo form_open_multipart($this->uri->uri_string(), array('class' => 'form-horizontal form-bordered')); ?>
					<div class="form-group <?php if (form_error('title')) echo 'has-error'; ?>">
						<label class="col-md-3 control-label"><?php echo translate('page') . " " . translate('title'); ?> <span class="required">*</span></label>
						<div class="col-md-8">
							<input type="text" class="form-control" name="title" value="<?php echo set_value('title'); ?>" />
							<span class="error"><?php echo form_error('title'); ?></span>
						</div>
					</div>
					<div class="form-group <?php if (form_error('menu_id')) echo 'has-error'; ?>">
						<label class="col-md-3 control-label"><?php echo translate('select') . " " . translate('menu'); ?> <span class="required">*</span></label>
						<div class="col-md-8">
							<?php
							    $this->db->order_by('ordering', 'asc');
							    $this->db->where('system', 0);
								$result = $this->db->get('front_cms_menu')->result();
								$menuslist = array('' => translate('select'));
								foreach ($result as $row) {
									$menuslist[$row->id] = $row->title;
								}
								echo form_dropdown("menu_id", $menuslist, set_value('menu_id'), "class='form-control' data-plugin-selectTwo data-width='100%'");
							?>
							<span class="error"><?php echo form_error('menu_id'); ?></span>
						</div>
					</div>
					<div class="form-group <?php if (form_error('content')) echo 'has-error'; ?>">
						<label  class="col-md-3 control-label"><?php echo translate('content'); ?> <span class="required">*</span></label>
						<div class="col-md-8">
							<textarea name="content" id="editor"><?php echo set_value('content'); ?></textarea>
							<span class="error"><?php echo form_error('content'); ?></span>
						</div>
					</div>
					<div class="form-group <?php if (form_error('photo')) echo 'has-error'; ?>">
						<label class="col-md-3 control-label"><?php echo translate('banner_photo'); ?> <span class="required">*</span></label>
						<div class="col-md-8">
							<input type="file" name="photo" class="dropify" data-height="150" data-default-file="" />
							<span class="error"><?php echo form_error('photo'); ?></span>
						</div>
					</div>
					<div class="form-group <?php if (form_error('meta_keyword')) echo 'has-error'; ?>">
						<label class="col-md-3 control-label"><?php echo translate('meta') . " " . translate('keyword'); ?></label>
						<div class="col-md-8">
							<input type="text" class="form-control" name="meta_keyword" value="<?php echo set_value('meta_keyword'); ?>" />
							<span class="error"><?php echo form_error('meta_keyword'); ?></span>
						</div>
					</div>
					<div class="form-group <?php if (form_error('meta_description')) echo 'has-error'; ?>">
						<label class="col-md-3 control-label"><?php echo translate('meta') . " " . translate('description'); ?></label>
						<div class="col-md-8">
							<input type="text" class="form-control" name="meta_description" value="<?php echo set_value('meta_description'); ?>" />
							<span class="error"><?php echo form_error('meta_description'); ?></span>
						</div>
					</div>
					<footer class="panel-footer mt-lg">
						<div class="row">
							<div class="col-md-2 col-md-offset-3">
								<button type="submit" class="btn btn-default btn-block" name="save" value="1">
									<i class="fas fa-plus-circle"></i> <?php echo translate('save'); ?>
								</button>
							</div>
						</div>	
					</footer>
				<?php echo form_close(); ?>
			</div>
	<?php } ?>
		</div>
	</div>
</section>