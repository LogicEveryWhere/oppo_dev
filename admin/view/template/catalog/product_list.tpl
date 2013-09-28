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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?>:&nbsp;
         <select name="filter_category_id" onchange="filter();">
            <option value="">&nbsp;</option>
            <?php foreach($categories as $c) { ?>
            <option value="<?php echo $c['category_id']?>" <?php echo ($c['category_id'] == $filter_category_id ? 'selected' : '') ?>><?php echo $c['name'] ?></option>
            <?php } ?>
         </select>&nbsp;<img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_product_category; ?>" style="float:right;padding-top:5px;" />
	  </h1>
      <div class="buttons"><a onclick="location = '<?php echo $insert; ?>'" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="center"><?php echo $column_image; ?></td>
              <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_name; ?>" /> <?php if ($sort == 'pd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
			  <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_categories; ?>" /> <?php if ($sort == 'p2c.category_id') { ?>
				<a href="<?php echo $sort_category; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_category; ?></a>
				<?php } else { ?>
				<a href="<?php echo $sort_category; ?>"><?php echo $column_category; ?></a>
			    <?php } ?></td>
              <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_model; ?>" /> <?php if ($sort == 'p.model') { ?>
                <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
                <?php } ?></td>
              <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_price; ?>" /> <?php if ($sort == 'p.price') { ?>
                <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
                <?php } ?></td>
              <td class="right"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_quantity; ?>" /> <?php if ($sort == 'p.quantity') { ?>
                <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
                <?php } ?></td>
              <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_status; ?>" /> <?php if ($sort == 'p.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
		  <tfoot>
			<tr>
			  <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
			  <td class="center"><strong><?php echo $column_image; ?></strong></td>
			  <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_name; ?>" /> <strong><?php echo $column_name; ?></strong></td>
			  <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_categories; ?>" /> <strong><?php echo $column_category; ?></strong></td>
			  <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_model; ?>" /> <strong><?php echo $column_model; ?></strong></td>
			  <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_price; ?>" /> <strong><?php echo $column_price; ?></strong></td>
			  <td class="right"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_quantity; ?>" /> <strong><?php echo $column_quantity; ?></strong></td>
			  <td class="left"><img src="view/image/information.png" width="15" height="15" hspace="10" border="0" align="absmiddle" class="tooltip" title="<?php echo $info_status; ?>" /> <strong><?php echo $column_status; ?></strong></td>
			  <td align="right"><div class="buttons"><a onclick="location = '<?php echo $insert; ?>'" class="button"><?php echo $button_insert; ?></a>&nbsp;&nbsp;<a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div></td>
			</tr>
		  </tfoot>
          <tbody>
            <tr class="filter">
              <td></td>
              <td></td>
              <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>
			  <td></td>
              <td><input type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>
              <td align="left"><input type="text" name="filter_price" value="<?php echo $filter_price; ?>" size="8"/></td>
              <td align="right"><input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" style="text-align: right;" /></td>
              <td><select name="filter_status">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_status) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
            </tr>
            <?php if ($products) { ?>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($product['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                <?php } ?></td>
              <td class="center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" /></td>
              <td class="left">
			    <input type="text" name="name" value="<?php echo $product['name']; ?>" size="40" id="name<?php echo $product['product_id']; ?>" />&nbsp;&nbsp;<a onclick="updateName(<?php echo $product['product_id']; ?>);$(this).fadeTo(250, 0.2);$(this).fadeTo(150, 0.5);"><img align="absmiddle" class="tooltip" src="view/image/disketa.png" alt="" title="<?php echo $text_save; ?>"/></a>
			  </td>
			  <td class="left">
			    <?php foreach ($categories as $category) { ?>
                  <?php if (in_array($category['category_id'], $product['category'])) { ?>
                    <?php echo $category['name'];?><br />
                  <?php } ?> 
				<?php } ?>			  
			  </td>
              <td class="left">
			    <input type="text" name="model" value="<?php echo $product['model']; ?>" size="20" id="model<?php echo $product['product_id']; ?>" />&nbsp;&nbsp;<a onclick="updateModel(<?php echo $product['product_id']; ?>);$(this).fadeTo(250, 0.2);$(this).fadeTo(150, 0.5);"><img align="absmiddle" class="tooltip" src="view/image/disketa_prod.png" alt="" title="<?php echo $text_save; ?>"/></a>
			  </td>
              <td class="left">
			    <input type="text" name="price" value="<?php echo $product['price']; ?>" size="10" id="price<?php echo $product['product_id']; ?>" />&nbsp;&nbsp;<a onclick="updatePrice(<?php echo $product['product_id']; ?>);$(this).fadeTo(250, 0.2);$(this).fadeTo(150, 0.5);"><img align="absmiddle" class="tooltip" src="view/image/disketa_price.png" alt="" title="<?php echo $text_save; ?>"/></a>
  			  </td>
			  <td class="right">
				<span class="ajax-edit" id="quantity-<?php echo $product['product_id']; ?>" value="<?php echo $product['product_id']; ?>">
				<input type="text" value="<?php echo $product['quantity']; ?>" size="5">
				<div style="margin-top:5px;"></div>
				<a onclick="save_quantity(<?php echo $product['product_id']; ?>)"><?php echo $text_save; ?></a>&nbsp
				<a onclick="close_quantity(<?php echo $product['product_id']; ?>)"; return false;><?php echo $text_close; ?></a>
				</span>
				<?php if ($product['quantity'] <= 0) { ?>
                <span style="color: #FF0000;"><?php echo $product['quantity']; ?></span>
                <?php } elseif ($product['quantity'] <= 5) { ?>
                <span style="color: #FFA500;"><?php echo $product['quantity']; ?></span>
                <?php } else { ?>
                <span style="color: #008000;"><?php echo $product['quantity']; ?></span>
                <?php } ?></td>
              <td style="text-align: center;"><a class="ajaxcolumnen button" id="status-<?php echo $product['product_id']; ?>"><?php echo $product['status']; ?></a></td>
              <td class="right"><?php foreach ($product['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
<script type="text/javascript"><!--
$(document).ready(function() {
    $('.ajax-edit').each(function(index, wrapper) {
        $(this).siblings().click(function() {
            $(wrapper).show();
            $(wrapper).siblings().hide();
        })
    });
})

function save_quantity(id) {
    var input_quantity = $('#quantity-'+id+' input');
    var quantity = $(input_quantity).val();
    $(quantity).css('cursor','progress');
    $.ajax({
        url: 'index.php?route=catalog/product/saveQuantity&product_id='+id+'&quantity='+quantity+'&token=<?php echo $token; ?>',
        dataType: 'html',
        data: {},
        success: function(quantity) { 
            $('#quantity-'+id).next().html(quantity);
            close_quantity(id);
        }
    });
    $(input_quantity).css('cursor','default');
}

function close_quantity(id) {
    $('.ajax-edit input').blur();
    $('#quantity-'+id).siblings().show();
    $('#quantity-'+id).hide(500);
}

function filter() {
	url = 'index.php?route=catalog/product&token=<?php echo $token; ?>';
	
	var filter_category_id = $('select[name=\'filter_category_id\']').attr('value');

	if (filter_category_id) {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
	var filter_model = $('input[name=\'filter_model\']').attr('value');
	
	if (filter_model) {
		url += '&filter_model=' + encodeURIComponent(filter_model);
	}
	
	var filter_price = $('input[name=\'filter_price\']').attr('value');
	
	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}
	
	var filter_quantity = $('input[name=\'filter_quantity\']').attr('value');
	
	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}
	
	var filter_status = $('select[name=\'filter_status\']').attr('value');
	
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}	

	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_name\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
	}
});

$('input[name=\'filter_model\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.model,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_model\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
	}
});
//--></script> 
<script type="text/javascript"><!--
$('.ajaxcolumnen').click(function() {
	var object_id=$(this).attr('id');
	$.ajax({
		url: 'index.php?route=catalog/product/setatten&token=<?php echo $token; ?>',
		type: 'get',
		data: {object_id:object_id},
		dataType: 'html',
		success: function(html) {
			if(html!=''){				
				$('#'+object_id).html(html);
			}
		}
	});
});

$("img.tooltip").tooltip({
	track: true, 
    delay: 0, 
    showURL: false, 
    showBody: " - ", 
    fade: 250 
});
//--></script> 
<script type="text/javascript"><!--
function updateName(product_id) {
	var name = $('#name' + product_id).val();
	$.post('index.php?route=catalog/product/name&token=<?php echo $token; ?>', 'name=' + name + '&product_id=' + product_id);
}

function updateModel(product_id) {
	var model = $('#model' + product_id).val();
	$.post('index.php?route=catalog/product/model&token=<?php echo $token; ?>', 'model=' + model + '&product_id=' + product_id);
}

function updatePrice(product_id) {
	var price = $('#price' + product_id).val();
	$.post('index.php?route=catalog/product/price&token=<?php echo $token; ?>', 'price=' + price + '&product_id=' + product_id);
}
//--></script>
<?php echo $footer; ?>