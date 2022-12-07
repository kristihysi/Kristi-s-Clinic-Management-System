<?php $currency_symbol = html_escape($global_config['currency_symbol']); ?>
<section class="panel">
	<header class="panel-heading">
		<h4 class="panel-title"> <?php echo translate('select_ground'); ?></h4>
	</header>
	<?php echo form_open($this->uri->uri_string(), array('class' => 'validate')); ?>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-offset-3 col-md-6 mb-lg">
					<div class="form-group">
						<label class="control-label"><?php echo translate('date'); ?> <span class="required">*</span></label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fas fa-calendar-check"></i></span>
							<input type="text" class="form-control daterange" name="daterange" value="<?php echo set_value('daterange', date("Y/m/d") . ' - ' . date("Y/m/d")); ?>" required />
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="panel-footer">
			<div class="row">
				<div class="col-md-offset-10 col-md-2">
					<button type="submit" name="search" value="1" class="btn btn btn-default btn-block"> <i class="fas fa-filter"></i> <?php echo translate('filter'); ?></button>
				</div>
			</div>
		</footer>
	<?php echo form_close(); ?>
</section>

<?php if (isset($results)): ?>
<section class="panel">
	<header class="panel-heading">
		<h4 class="panel-title"><i class="fas fa-list-ol"></i> <?php echo translate('income_vs_expense'); ?></h4>
	</header>
	<div class="panel-body">
		<!-- Hidden information for printing -->
		<div class="export_title">Income Vs Expense : <?php echo _d($daterange[0]); ?> To <?php echo _d($daterange[1]); ?></div>
		<table class="table table-bordered table-hover table-condensed tbr-top" cellspacing="0" width="100%" id="table-export">
			<thead>
				<tr>
					<th><?php echo translate('sl'); ?></th>
					<th><?php echo translate('voucher') . " " . translate('head'); ?></th>
					<th><?php echo translate('type'); ?></th>
					<th><?php echo translate('dr'); ?>.</th>
					<th><?php echo translate('cr'); ?>.</th>
					<th><?php echo translate('balance'); ?></th>
				</tr>
			</thead>
			<tbody>
				<?php
				$total_dr = 0;
				$total_cr = 0;
				$balance = 0;
				if(!empty($results)) {
					$count = 1; 
					foreach($results as $row):
						if ($row['type'] == 'income') {
							$balance += $row['total_cr'];
						}elseif ($row['type'] == 'expense') {
							$balance -= $row['total_dr'];
						}

						$total_dr += $row['total_dr'];
						$total_cr += $row['total_cr'];
				?>	
				<tr>
					<td><?php echo $count++; ?></td>
					<td><?php echo html_escape($row['v_head']); ?></td>
					<td><?php echo html_escape(ucfirst($row['type'])); ?></td>
					<td><?php echo html_escape($currency_symbol . number_format($row['total_dr'], 2, '.', '')); ?></td>
					<td><?php echo html_escape($currency_symbol . number_format($row['total_cr'], 2, '.', '')); ?></td>
					<td><?php echo html_escape($currency_symbol . number_format($balance, 2, '.', '')); ?>
					</td>
				</tr>
				<?php endforeach; } ?>
			</tbody>
			<tfoot>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th><?php echo ($currency_symbol . number_format($total_dr, 2, '.', '')); ?></th>
					<th><?php echo ($currency_symbol . number_format($total_cr, 2, '.', '')); ?></th>
					<th><?php echo ($currency_symbol . number_format($balance, 2, '.', '')); ?></th>
				</tr>
			</tfoot>
		</table>
	</div>
</section>
<?php endif; ?>