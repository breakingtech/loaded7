<?php
/**
  @package    catalog::templates::content
  @author     Loaded Commerce, LLC
  @copyright  Copyright 2003-2013 Loaded Commerce Development Team
  @copyright  Portions Copyright 2003 osCommerce
  @copyright  Template built on DevKit http://www.bootstraptor.com under GPL license 
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: info.php v1.0 2013-08-08 datazen $
*/
?>
<!--content/products/info.php start-->
<div class="row">

  <div class="col-sm-4 col-lg-4 clearfix">
    <div class="thumbnail large-margin-top text-center">
      <a href="<?php echo (file_exists(DIR_FS_CATALOG . $lC_Image->getAddress($lC_Product->getImage(), 'originals'))) ? lc_href_link(DIR_WS_CATALOG . $lC_Image->getAddress($lC_Product->getImage(), 'originals')) : lc_href_link(DIR_WS_IMAGES . 'no_image.png'); ?>" title="<?php echo $lC_Product->getTitle(); ?>" class="thickbox"><img class="img-responsive" src="<?php echo $lC_Image->getAddress($lC_Product->getImage(), 'large'); ?>" title="<?php echo $lC_Product->getTitle(); ?>" alt="<?php echo $lC_Product->getTitle(); ?>" /></a><br />
    </div>
    <p class="align-center"><a href="<?php echo (file_exists(DIR_FS_CATALOG . $lC_Image->getAddress($lC_Product->getImage(), 'originals'))) ? lc_href_link(DIR_WS_CATALOG . $lC_Image->getAddress($lC_Product->getImage(), 'originals')) : lc_href_link(DIR_WS_IMAGES . 'no_image.png'); ?>" class="thickbox"><?php echo $lC_Language->get('enlarge_image'); ?></a></p>
    <hr>
    <?php
    if (sizeof($lC_Product->getImages()) > 1) {
      echo '<div class="thumbnail img-responsive"><ul>' . $lC_Product->getAdditionalImagesHtml() . '</ul></div><hr>' . "\n";
    }
    ?>
  </div>
  <div class="col-sm-8 col-lg-8 clearfix">
    <?php
    $availability = ( (STOCK_CHECK == '1') && ($lC_ShoppingCart->isInStock($lC_Product->getID()) === false) ) ? '<span class="product-out-of-stock red">' . STOCK_MARK_PRODUCT_OUT_OF_STOCK . '</span>' : $lC_Product->getAttribute('shipping_availability');
    if ($lC_Product->getAttribute('manufacturers') != null || $lC_Product->hasModel()) {
      echo '<div class="content-products-info-manuf-model">' . "\n" . 
           '  <span class="content-products-info-manuf small-margin-right">' . $lC_Product->getAttribute('manufacturers') . ':</span>' . "\n" .
           '  <span class="content-products-info-model">' . $lC_Product->getModel() . '</span>' . "\n" . 
           '</div>' . "\n";
    }
    ?>
    <h1><?php echo $lC_Template->getPageTitle(); ?></h1>
    <hr>
    <p class="content-products-info-desc"><?php echo ($lC_Product->getDescription() != null) ? $lC_Product->getDescription() : $lC_Language->get('no_description_available'); ?></p>
    <div class="well large-margin-top margin-bottom">
      <div class="content-products-info-price-container clearfix">
        <span class="content-products-info-price pull-left lt-blue"><?php echo $lC_Product->getPriceFormated(true); ?></span>
        <span class="content-products-info-avail with-padding-no-top-bottom"><?php echo $availability ?></span> (<?php echo lc_link_object(lc_href_link(FILENAME_INFO, 'shipping'), $lC_Language->get('more_information'), 'target="_blank"'); ?>)
      </div>
      <div class="content-products-info-reviews-container">
        <label class="content-products-info-reviews-rating-label with-padding-no-top-bottom"><?php echo $lC_Language->get('average_rating'); ?></label>
        <span class="content-products-info-reviews-rating margin-right"><?php echo lc_image(DIR_WS_TEMPLATE_IMAGES . 'stars_' . $lC_Product->getData('reviews_average_rating') . '.png', sprintf($lC_Language->get('rating_of_5_stars'), $lC_Product->getData('reviews_average_rating'))); ?></span>
        <?php       
        $Qreviews = lC_Reviews::getListing($lC_Product->getID());
        if ($lC_Reviews->getTotal($lC_Product->getID()) > 0) {
          echo '<span><a href="' . lc_href_link(FILENAME_PRODUCTS, 'reviews&' . $lC_Product->getKeyword()) . '" target="_blank">(' . $lC_Language->get('more_information') . ')</a></span>' . "\n";
        } else {            
          echo '<span><a href="' . lc_href_link(FILENAME_PRODUCTS, 'reviews=new&' . $lC_Product->getKeyword()) . '" target="_blank">(' . $lC_Language->get('text_write_review_first') . '</a>)</span>' . "\n";
        }
        ?>      
      </div>  
      <?php
      if ( $lC_Product->hasSimpleOptions() ) {
        ?>
        <div id="content-products-info-simple-options-container">
          <?php
          $module = '';
          foreach ( $lC_Product->getSimpleOptions() as $group_id => $value ) {
            if (is_array($value) && !empty($value)) {
              foreach($value as $key => $data) {
                if (isset($data['module']) && $data['module'] != '') {
                  $module = $data['module'];
                }
              }
            }
            echo lC_Variants::parseSimpleOptions($module, $value);
          }
          ?>
        </div>
        <?php
      }
      if ( $lC_Product->hasVariants() ) {
        ?>
        <div id="content-products-info-variants-container">
          <?php
            foreach ( $lC_Product->getVariants() as $group_id => $value ) {
              echo lC_Variants::parse($value['module'], $value);
            }
            echo lC_Variants::defineJavascript($lC_Product->getVariants(false));
          ?>
        </div>
        <?php
      }
      ?>  
    </div>
  </div>
  <div class="row">
    <div class="col-sm-6 col-lg-6 align-right mid-margin-top">
      <form role="form" class="form-inline" name="cart_quantity" id="cart_quantity" action="<?php echo lc_href_link(FILENAME_PRODUCTS, $lC_Product->getKeyword() . '&action=cart_add'); ?>" method="post">
        <div class="form-group">
          <label class="content-products-info-qty-label"><?php echo $lC_Language->get('text_add_to_cart_quantity'); ?></label>
          <input type="text" name="content-products-info-qty-input" onfocus="this.select();" class="form-control content-products-info-qty-input" value="1">
        </div>
      </form>
    </div>
    <div class="col-sm-6 col-lg-6">
      <p class="margin-top"><button onclick="$('#cart_quantity').submit();" class="btn btn-block btn-lg btn-success"><?php echo $lC_Language->get('button_buy_now'); ?></button></p>
    </div>
  </div>
</div>
<script>
$(document).ready(function() {
  $('#main-content-container').addClass('large-margin-top-neg');
  refreshPrice();
});

function refreshPrice() {
  var currencySymbolLeft = '<?php echo $lC_Currencies->getSymbolLeft(); ?>';
  var basePrice = '<?php echo $lC_Product->getBasePrice(); ?>';

  var priceModTotal = 0;
  // loop thru any options select fields
  $('#content-products-info-simple-options-container select > option:selected').each(function() {
    priceModTotal = parseFloat(priceModTotal) + parseFloat($(this).attr('modifier'));
  }); 
  
  // loop thru any options radio fields
  $('#content-products-info-simple-options-container input:radio:checked').each(function() {
    priceModTotal = parseFloat(priceModTotal) + parseFloat($(this).attr('modifier'));
  }); 
  
  // loop thru any options text fields
  $('#content-products-info-simple-options-container input[type="text"]').each(function() {
    if($(this).val()) {
      priceModTotal = parseFloat(priceModTotal) + parseFloat($(this).attr('modifier'));
    }
  });  
  
  var adjPrice = (parseFloat(basePrice) + parseFloat(priceModTotal));
  var adjPriceFormatted = currencySymbolLeft + adjPrice.toFixed(<?php echo DECIMAL_PLACES; ?>);
  
  var isSpecial = $('.product-special-price').text();
  if (isSpecial.length > 0) {
    $('.product-special-price').html(adjPriceFormatted);
  } else {
    $('.content-products-info-price').html(adjPriceFormatted);
  }
}
</script>
<!--content/products/info.php end-->