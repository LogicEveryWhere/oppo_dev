<?php if (($setting['position'] == 'content_top') || ($setting['position'] == 'content_bottom')){ ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?> - 
  <span id="artsearch" style="border-top: none;">
      <?php if ($filter_name) { ?>
      <input type="text" name="filter_artname" value="<?php echo $filter_name; ?>" />
      <?php } else { ?>
      <input type="text" name="filter_artname" value="<?php echo $artkey; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #005dad;" />
      <?php } ?>
	  <a id="button-artsearch"></a>
  </span>
  <?php if (isset($this->request->get['headlines'])) { ?>
	 - <a href="<?php echo $headlines; ?>"><?php echo $button_headlines; ?></a> 
  <?php } else { ?>
	 - <a href="<?php echo $headlines; ?>"><?php echo $button_headlines; ?></a> 
  <?php } ?> 
  </div>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($ncategories as $ncategory) { ?>
        <div>
          <?php if ($ncategory['thumb']) { ?>
            <div class="image" style="text-align: center">
              <a href="<?php echo $ncategory['href']; ?>"><img src="<?php echo $ncategory['thumb']; ?>" alt="<?php echo $ncategory['name']; ?>" /></a>
            </div>
          <?php } ?>
          <div style="text-align: center"><a href="<?php echo $ncategory['href']; ?>"><?php echo $ncategory['name']; ?></a></div>
        </div>
      <?php } ?>      
    </div>
  </div>
</div>
<?php } else { ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-category">
	  <ul>
	  <?php if (isset($this->request->get['headlines'])) { ?>
		  <li><a href="<?php echo $headlines; ?>" class="no-active"><?php echo $button_headlines; ?></a></li>
		  <?php } else { ?>
		  <li class="article-cat"><a href="<?php echo $headlines; ?>" class="no-active"><?php echo $button_headlines; ?></a></li>
	  <?php } ?>
	  </ul>
	  <?php if ($ncategories) { ?>
      <ul>
        <?php foreach ($ncategories as $ncategory) { ?>
        <li>
          <?php if ($ncategory['ncategory_id'] == $ncategory_id) { ?>
          <a href="<?php echo $ncategory['href']; ?>" class="active"><?php echo $ncategory['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $ncategory['href']; ?>" class="no-active"><?php echo $ncategory['name']; ?></a>
          <?php } ?>
          <?php if ($ncategory['children']) { ?>
          <ul>
            <?php foreach ($ncategory['children'] as $child) { ?>
            <li>
              <?php if ($child['ncategory_id'] == $child_id) { ?>
              <a href="<?php echo $child['href']; ?>" class="child-active"> - <?php echo $child['name']; ?></a>
              <?php } else { ?>
              <a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
      <?php } ?>
	  <span style="border-top: 1px solid #d0e3ee;"></span>
	</div>
	<div id="artsearch">
      <?php if ($filter_name) { ?>
      <input type="text" name="filter_artname" value="<?php echo $filter_name; ?>" />
      <?php } else { ?>
      <input type="text" name="filter_artname" value="<?php echo $artkey; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #005dad;" />
      <?php } ?>
	  <a id="button-artsearch" class="button-artsearch"></a>
  </div>
  </div>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('#artsearch input[name=\'filter_artname\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-artsearch').trigger('click');
	}
});

$('#button-artsearch').bind('click', function() {
	url = 'index.php?route=news/search';
	
	var filter_artname = $('#artsearch input[name=\'filter_artname\']').attr('value');
	
	if (filter_artname) {
		url += '&filter_artname=' + encodeURIComponent(filter_artname);
	}

	location = url;
});
//--></script> 