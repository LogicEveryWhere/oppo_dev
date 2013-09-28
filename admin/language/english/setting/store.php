<?php
// Heading
$_['heading_title']            = 'Settings';

// Text
$_['text_success']             = 'Success: You have modified settings!';
$_['text_items']                   = 'Items';
$_['text_tax']                     = 'Taxes';
$_['text_account']                 = 'Account';
$_['text_checkout']                = 'Checkout';
$_['text_stock']                   = 'Stock';
$_['text_image_manager']       = 'Image Manager';
$_['text_browse']              = 'Browse Files';
$_['text_clear']               = 'Clear Image';
$_['text_shipping']            = 'Shipping Address';
$_['text_payment']             = 'Payment Address';

// Column
$_['column_name']              = 'Store Name';
$_['column_url']	           = 'Store URL';
$_['column_action']            = 'Action';

// Entry
$_['entry_url']                = 'Store URL:';
$_['entry_ssl']                = 'SSL URL:';
$_['entry_name']               = 'Store Name:';
$_['entry_owner']              = 'Store Owner:';
$_['entry_address']            = 'Address:';
$_['entry_email']              = 'E-Mail:';
$_['entry_telephone']          = 'Telephone:';
$_['entry_fax']                = 'Fax:';
$_['entry_title']              = 'Title:';
$_['entry_meta_description']   = 'Meta Tag Description:';
$_['entry_layout']             = 'Default Layout:';
$_['entry_template']           = 'Template:';
$_['entry_country']            = 'Country:';
$_['entry_zone']               = 'Region / State:';
$_['entry_language']           = 'Language:';
$_['entry_currency']           = 'Currency:';
$_['entry_catalog_limit'] 	   = 'Default Items Per Page (Catalog):';
$_['entry_tax']                = 'Display Prices With Tax:';
$_['entry_tax_default']        = 'Use Store Tax Address:';
$_['entry_tax_customer']       = 'Use Customer Tax Address:';
$_['entry_customer_group']     = 'Customer Group:';
$_['entry_customer_group_display'] = 'Customer Groups:';
$_['entry_customer_price']     = 'Login Display Prices:';
$_['entry_guest_checkout']     = 'Guest Checkout:';
$_['entry_account']            = 'Account Terms:';
$_['entry_checkout']           = 'Checkout Terms:';
$_['entry_stock_display']      = 'Display Stock:';
$_['entry_stock_checkout']     = 'Stock Checkout:';
$_['entry_order_status']       = 'Order Status:';
$_['entry_cart_weight']        = 'Display Weight on Cart Page:';
$_['entry_logo']               = 'Store Logo:';
$_['entry_icon']               = 'Icon:';
$_['entry_image_category']     = 'Category Image Size:';
$_['entry_image_thumb']        = 'Product Image Thumb Size:';
$_['entry_image_popup']        = 'Product Image Popup Size:';
$_['entry_image_product']      = 'Product Image List Size:';
$_['entry_image_additional']   = 'Additional Product Image Size:';
$_['entry_image_related']      = 'Related Product Image Size:';
$_['entry_image_compare']      = 'Compare Image Size:';
$_['entry_image_wishlist']     = 'Wish List Image Size:';
$_['entry_image_cart']         = 'Cart Image Size:';
$_['entry_use_ssl']            = 'Use SSL:';

//Info
$_['info_url']        		   = '<span class="help">Include the full URL to your store. Make sure to add \'/\' at the end. Example: http://www.yourdomain.com/path/ Don\'t use directories to create a new store. You should always point another domain or sub domain to your hosting.</span>';
$_['info_ssl']         		   = '<span class="help">SSL URL to your store. Make sure to add \'/\' at the end. Example: http://www.yourdomain.com/path/ Don\'t use directories to create a new store. You should always point another domain or sub domain to your hosting.</span>';
$_['info_catalog_limit']       = '<span class="help">Determines how many catalog items are shown per page (products, categories, etc)</span>';
$_['info_tax_default']         = '<span class="help">Use the store address to calculate taxes if no one is logged in. You can choose to use the store address for the customers shipping or payment address.</span>';
$_['info_tax_customer']        = '<span class="help">Use the customers default address when they login to calculate taxes. You can choose to use the default address for the customers shipping or payment address.</span>';
$_['info_customer_group']      = '<span class="help">Default customer group.</span>';
$_['info_customer_group_display'] = '<span class="help">Display customer groups that new customers can select to use such as wholesale and business when signing up.</span>';
$_['info_account']         	   = '<span class="help"><span class="help">Forces people to agree to terms before an account can be created.</span>';
$_['info_guest_checkout']      = '<span class="help"><span class="help">Allow customers to checkout without creating an account. This will not be available when a downloadable product is in the shopping cart.</span>';
$_['info_checkout']            = '<span class="help">Forces people to agree to terms before an a customer can checkout.</span>';
$_['info_order_status']        = '<span class="help">Set the default order status when an order is processed.</span>';
$_['info_stock_display']       = '<span class="help">Display stock quantity on the product page.</span>';
$_['info_stock_checkout']      = '<span class="help">Allow customers to still checkout if the products they are ordering are not in stock.</span>';
$_['info_use_ssl']         	   = '<span class="help">To use SSL check with your host if a SSL certificate is installed.</span>';

// Error
$_['error_warning']            = 'Warning: Please check the form carefully for errors!';
$_['error_permission']         = 'Warning: You do not have permission to modify stores!';
$_['error_name']               = 'Store Name must be between 3 and 32 characters!';
$_['error_owner']              = 'Store Owner must be between 3 and 64 characters!';
$_['error_address']            = 'Store Address must be between 10 and 256 characters!';
$_['error_email']              = 'E-Mail Address does not appear to be valid!';
$_['error_telephone']          = 'Telephone must be between 3 and 32 characters!';
$_['error_url']                = 'Store URL required!';
$_['error_title']              = 'Title must be between 3 and 32 characters!';
$_['error_limit']       	   = 'Limit required!';
$_['error_customer_group_display'] = 'You must include the default customer group if you are going to use this feature!';
$_['error_image_thumb']        = 'Product Image Thumb Size dimensions required!';
$_['error_image_popup']        = 'Product Image Popup Size dimensions required!';
$_['error_image_product']      = 'Product List Size dimensions required!';
$_['error_image_category']     = 'Category List Size dimensions required!';
$_['error_image_manufacturer'] = 'Manufacturer List Size dimensions required!';
$_['error_image_additional']   = 'Additional Product Image Size dimensions required!';
$_['error_image_related']      = 'Related Product Image Size dimensions required!';
$_['error_image_compare']      = 'Compare Image Size dimensions required!';
$_['error_image_wishlist']     = 'Wish List Image Size dimensions required!';
$_['error_image_cart']         = 'Cart Image Size dimensions required!';
$_['error_default']            = 'Warning: You can not delete your default store!';
$_['error_store']              = 'Warning: This Store cannot be deleted as it is currently assigned to %s orders!';
?>