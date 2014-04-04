<?php
/**
  @package    catalog::templates
  @author     Loaded Commerce
  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
  @copyright  Portions Copyright 2003 osCommerce
  @copyright  Template built on DevKit http://www.bootstraptor.com under GPL license 
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: footer.php v1.0 2013-08-08 datazen $
*/
?>
<!--footer.php start-->
<div id="sub-footer">
  <div class="container relative" style="width:100%;">
    <div class="row">
      <div class="col-sm-3 col-lg-3">
        <h4 class="line3 center standart-h4title"><span>New Arrivals</span></h4>
        <ul class="footer-links list-indent list-unstyled">
          <?php echo lC_Template_output::newArrivalsListing(); ?>
        </ul>
      </div>

      <div class="col-sm-3 col-lg-3">
        <h4 class="line3 center standard-h4title"><span>Customer Service</span></h4>
        <ul class="footer-links list-indent list-unstyled">
          <li><a href="<?php echo lc_href_link(FILENAME_INFO, 'contact', 'SSL'); ?>"><?php echo $lC_Language->get('text_contact'); ?></a></li>
          <li><a href="<?php echo lc_href_link(FILENAME_DEFAULT, 'cPath=2_3', 'AUTO'); ?>"><?php echo $lC_Language->get('text_shipping_returns'); ?></a></li>
          <li><a href="<?php echo lc_href_link(FILENAME_DEFAULT, 'cPath=2_4', 'AUTO'); ?>"><?php echo $lC_Language->get('text_privacy'); ?></a></li>                                              
          <li><a href="<?php echo lc_href_link(FILENAME_DEFAULT, 'cPath=2_5', 'AUTO'); ?>"><?php echo $lC_Language->get('text_terms_conditions'); ?></a></li>
          <li><a href="<?php echo lc_href_link(FILENAME_INFO, 'sitemap', 'AUTO'); ?>"><?php echo $lC_Language->get('text_sitemap'); ?></a></li>  
        </ul>
      </div> 

      <div class="col-sm-3 col-lg-3">
        <h4 class="line3 center standard-h4title"><span>My Account</span></h4>
        <ul class="footer-links list-indent list-unstyled">
          <li><a href="<?php echo lc_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><?php echo $lC_Language->get('text_sign_in'); ?></a></li>
          <li><a href="<?php echo lc_href_link(FILENAME_ACCOUNT, 'password', 'SSL'); ?>"><?php echo $lC_Language->get('text_my_password'); ?></a></li>
          <li><a href="<?php echo lc_href_link(FILENAME_ACCOUNT, 'orders', 'SSL'); ?>"><?php echo $lC_Language->get('text_my_order_history'); ?></a></li>
          <li><a href="<?php echo lc_href_link(FILENAME_ACCOUNT, 'address_book', 'SSL'); ?>"><?php echo $lC_Language->get('text_my_address_book'); ?></a></li>
          <li><a href="<?php echo lc_href_link(FILENAME_ACCOUNT, 'notifications', 'SSL'); ?>"><?php echo $lC_Language->get('text_my_updates_alerts'); ?></a></li>
        </ul>
      </div>

      <div class="col-sm-3 col-lg-3 large-margin-bottom">
        <h4 class="line3 center standard-h4title"><span>Follow Us</span></h4>

            <div id="footer-social-icons-container">
              <div class="thumbButtons">  
                <div class="col-xs-4 col-sm-4 col-lg-4">
                  <?php
                    if ($lC_Template->getBranding('social_facebook_page') != '') {
                      echo '<div class="social_icon"><a href="' . $lC_Template->getBranding('social_facebook_page') . '" target="_blank"><img alt="Facebook" src="' . DIR_WS_IMAGES . 'icons/facebook.png" /></a></div>';
                    } else {
                    ?>
                    <div class="az_social_icon icon_facebook"><a onclick="window.open('http://www.facebook.com/algozone');"></a></div>
                    <?php
                    }
                  ?>
                </div> 
                <div class="col-xs-4 col-sm-4 col-lg-4">
                  <?php
                    if ($lC_Template->getBranding('social_twitter') != '') {
                      echo '<div class="social_icon"><a href="' . $lC_Template->getBranding('social_twitter') . '" target="_blank"><img alt="Twitter" src="' . DIR_WS_IMAGES . 'icons/twitter_bird.png" /></a></div>';
                    } else {
                    ?>
                    <div class="az_social_icon icon_twitter"><a onclick="window.open('http://www.twitter.com/Algozone');"></a></div>
                    <?php
                    }
                  ?>  
                </div>     
                <div class="col-xs-4 col-sm-4 col-lg-4">
                  <?php
                    if ($lC_Template->getBranding('social_youtube') != '') {
                      echo '<div class="social_icon"><a href="' . $lC_Template->getBranding('social_youtube') . '" target="_blank"><img alt="Youtube" src="' . DIR_WS_IMAGES . 'icons/youtube.png" /></a></div>';
                    } else {
                    ?>
                    <div class="az_social_icon icon_flickr"><a onclick="window.open('http://www.youtube.com/user/AlgoZoneCom');"></a></div>
                    <?php
                    }
                  ?>
                </div> 

              </div> 
              <div class="thumbButtons">  
                <div class="col-xs-4 col-sm-4 col-lg-4">
                  <?php
                    if ($lC_Template->getBranding('social_pinterest') != '') {
                      echo '<div class="social_icon"><a href="' . $lC_Template->getBranding('social_pinterest') . '" target="_blank"><img alt="Pinterest" src="' . DIR_WS_IMAGES . 'icons/pinterest.png" /></a></div>';
                    } else {
                    ?>
                    <div class="az_social_icon icon_rss"><a onclick="window.open('http://www.linkedin.com/Algozone');" ></a></div>
                    <?php
                    }
                  ?>
                </div> 
                <div class="col-xs-4 col-sm-4 col-lg-4">
                  <?php
                    if ($lC_Template->getBranding('social_google_plus') != '') {
                      echo '<div class="social_icon"><a href="' . $lC_Template->getBranding('social_google_plus') . '" target="_blank"><img alt="Google+" src="' . DIR_WS_IMAGES . 'icons/google_plus.png" /></a></div>';
                    } else {
                    ?>
                     <div class="az_social_icon icon_1"><a onclick="window.open('http://www.linkedin.com/Algozone');" ></a></div>
                    <?php
                    }
                  ?>

                </div>     
                <div class="col-xs-4 col-sm-4 col-lg-4">
                  <?php
                    if ($lC_Template->getBranding('social_linkedin') != '') {
                      echo '<div class="social_icon"><a href="' . $lC_Template->getBranding('social_linkedin') . '" target="_blank"><img alt="LinkedIn" src="' . DIR_WS_IMAGES . 'icons/linkedin.png" /></a></div>';
                    } else {
                    ?>
                    <div class="az_social_icon icon_2"><a onclick="window.open('http://www.myspace.com/Algozone');"></a></div>
                    <?php
                    }
                  ?>
                </div> 
              </div> 
            </div> 



      </div>      

      <div class="margin-left small-padding-left margin-right small-padding-right clear-both"><p><?php echo $lC_Template->getBranding('footer_text');?></p></div>
      
    </div>
    <!-- QR Code -->
    <div id="qr-code-container">        
      <a id="qrcode-tooltip">
        <span style="cursor:pointer;">
          <img src="images/icons/qr-icon.png" alt="<?php echo $lC_Language->get('text_click_and_scan');?>" style="vertical-align:middle; padding-right:6px;" /><span class="small-margin-left"><?php echo $lC_Language->get('text_click_and_scan');?></span>
        </span>
      </a>
    </div>
    <div id="ShowQRCode"></div> 
  </div>  
</div>

<div id="footer">
  <div class="container" style="width:100%;">
    <div class="row">
      <div class="col-sm-12 col-lg-12">
        <div class="pull-left">&copy; <?php echo date("Y") . ' ' . STORE_NAME; ?></div>
        <div class="pull-right">Loaded Commerce © Template Designed by <a href="http://www.algozone.com" target="_blank" title="osCommerce Template Designed by AlgoZone.com">AlgoZone.com</a> </div>
      </div>    
    </div>
  </div>  
</div>
<!--footer.php end-->