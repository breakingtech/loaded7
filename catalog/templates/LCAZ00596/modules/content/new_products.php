<?php
/**
  @package    catalog::templates::content
  @author     Loaded Commerce
  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
  @copyright  Portions Copyright 2003 osCommerce
  @copyright  Template built on DevKit http://www.bootstraptor.com under GPL license 
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: new_products.php v1.0 2013-08-08 datazen $
*/
?>
<!--modules/content/new_products.php start-->
<div class="content-new-products-div col-sm-12 col-lg-12">
  <div class="row margin-bottom">
    <h3 class="no-margin-top mainpagetop"><?php echo $lC_Box->getTitle(); ?></h3>
    <?php echo $lC_Box->getContent(); ?>
  </div>
</div>
<script>
$(document).ready(function() {
  var buttonContentText;
  var mediaType = _setMediaType();
  var mainContentClass = $('#main-content-container').attr('class');
  if(mainContentClass == 'col-sm-6 col-lg-6') {
    thisContentClass = 'col-sm-6 col-lg-6';
  } else {
    thisContentClass = 'col-sm-4 col-lg-3';
  }   
  
  $(".content-new-products-container").each(function(){
    var imageContent = $(this).find('div.content-new-products-image').html();
    var nameContent = $(this).find('div.content-new-products-name').html();
    var nameContentText = $(this).find('div.content-new-products-name').text();
    var descContent = $(this).find('div.content-new-products-desc').html();
    var descContentText = $(this).find('div.content-new-products-desc').text();
    var priceContent = $(this).find('div.content-new-products-price').html();
    var buttonContent = $(this).find('div.content-new-products-button').html();
    
    buttonContentText = $(this).find('div.content-new-products-button').text();
    var textAddToCart = '<?php echo $lC_Language->get('button_add_to_cart'); ?>';
    
    buttonContent =buttonContent.replace(buttonContentText, textAddToCart);
    
     var textAddToWishlist = '<?php echo '+ '.$lC_Language->get('add_to_wishlist'); ?>';
    var newNameContentText = (nameContentText.length > 18) ? nameContentText.substr(0, 15) + '...' : nameContentText;
    nameContent = nameContent.replace(nameContentText, newNameContentText);
    nameCompare = nameContent.replace(nameContentText, '+ Compare');
    
    var newDescContentText = (descContentText.length > 65) ? descContentText.substr(0, 62) + '...' : descContentText;
    descContent = descContent.replace(descContentText, newDescContentText);      
    
    
     output = '<div class="' + thisContentClass+ ' with-padding">'+
             '  <div class="thumbnail align-center large-padding-top">'+ imageContent +
             '    <div class="caption">' +
             '      <h3 style="line-height:1.1;">' + nameContent + '</h3>' +  
             '      <div class="row no-padding-top">' +
             '        <div class="col-sm-12 col-lg-12">' +
             '          <p class="lead">' + priceContent + '</p>' + 
             '        </div>' +            
             '      <div class="row mid-margin-top">' +
             '           <div class="addToCart pull-right col-sm-12 col-lg-12" >'+ buttonContent + '</div>'+             
             '      </div>' +
             '    </div>' +
             '  </div>' +
             '</div>';   

    $(this).html(output);  
  });
  $('.content-new-products-add-button').addClass('btn btn-success btn-block');
  if (mediaType == 'small-tablet-landscape' || mediaType == 'tablet-portrait') {
     var textArr = buttonContentText.split(' ');
    $('.content-new-products-add-button').text(textArr[0]);  
    $('.content-new-products-container p.lead').attr('style', 'font-size:1.1em;');  
  }
  $('.content-new-products-image-src').addClass('img-responsive');
});
</script>
<!--modules/content/new_products.php end-->