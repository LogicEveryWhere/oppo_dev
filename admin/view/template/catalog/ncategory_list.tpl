<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
    
    <?php echo $newspanel; ?>
  <br />
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/ncategory.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="location = '<?php echo $insert; ?>'" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php echo $column_name; ?></td>
              <td class="right"><?php echo $column_sort_order; ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
		  <tfoot>
			<tr>
			  <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
			  <td align="left"><strong><?php echo $column_name; ?></strong></td>
			  <td class="right"><strong><?php echo $column_sort_order; ?></strong></td>
			  <td align="right"><div class="buttons"><a onclick="location = '<?php echo $insert; ?>'" class="button"><?php echo $button_insert; ?></a>&nbsp;&nbsp;<a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div></td>
			</tr>
		  </tfoot>
           <tbody>
            <?php if ($ncategories) { ?>
            <?php foreach ($ncategories as $ncategory) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($ncategory['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $ncategory['ncategory_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $ncategory['ncategory_id']; ?>" />
                <?php } ?></td>
              <?php if ($ncategory['href']) { ?>
                <td class="left"><?php echo $ncategory['indent']; ?><a href="<?php echo $ncategory['href']; ?>"><?php echo $ncategory['name']; ?></a></td>
              <?php } else { ?>
                <td class="left"><?php echo $ncategory['indent']; ?><?php echo $ncategory['name']; ?></td>
              <?php } ?>
              <td class="right"><?php echo $ncategory['sort_order']; ?></td>
              <td class="right"><?php foreach ($ncategory['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>