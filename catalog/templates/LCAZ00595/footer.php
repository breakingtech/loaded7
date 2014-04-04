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
<script>
  $(document).ready(function(){
    $(".open").click(function(){
      $( ".subfooter_container" ).toggle( "slow" ); 
      $(".open").toggleClass( "close" );
    });

  });
</script>

<div id="sub-footer">

  <div class="subfooter_open"><div><a class="open"></a></div></div>
  <div class="subfooter_container">
    <div class="container">
      <div class="container_controller">
        <div class="row">
          <div class="col-sm-2 col-lg-2 firstchild">
            <h4 class="line3 center standard-h4title"><span>Information</span></h4>
            <ul>
              <li><a href="<?php echo lc_href_link(FILENAME_INFO, 'contact', 'SSL'); ?>"><?php echo $lC_Language->get('text_contact'); ?></a></li>
              <li><a href="<?php echo lc_href_link(FILENAME_DEFAULT, 'cPath=2_3', 'AUTO'); ?>"><?php echo $lC_Language->get('text_shipping_returns'); ?></a></li>
              <li><a href="<?php echo lc_href_link(FILENAME_DEFAULT, 'cPath=2_4', 'AUTO'); ?>"><?php echo $lC_Language->get('text_privacy'); ?></a></li>                                              
              <li><a href="<?php echo lc_href_link(FILENAME_DEFAULT, 'cPath=2_5', 'AUTO'); ?>"><?php echo $lC_Language->get('text_terms_conditions'); ?></a></li>
              <li><a href="<?php echo lc_href_link(FILENAME_INFO, 'sitemap', 'AUTO'); ?>"><?php echo $lC_Language->get('text_sitemap'); ?></a></li> 
            </ul>     
          </div>

          <div class="col-sm-3 col-lg-3 createaccount">
            <h4 class="line3 center standard-h4title"><span>Create Account</span></h4>

            <div class="signuppart">
              Sign up for free gifts and items <br />
              Join us to avail more discounts.
            </div>
            <form id="newsletter" action="<?php echo lc_href_link(FILENAME_ACCOUNT, 'create', 'SSL'); ?>" method="post">
              <input type="text" class="input-text" value="" placeholder="<?php echo $lC_Language->get('text_enter_your_email'); ?>" id="newsletter" name="email">
              <button class="button" title="" type="submit"></button>
            </form>
          </div> 

          <div class="col-sm-3 col-lg-3">
            <h4 class="line3 center standard-h4title"><span>Contact Us</span></h4>       
            <address class="margin-left">
              <span class="iconcp"></span>
              <span class="address_part"> <?php echo nl2br(STORE_NAME_ADDRESS); ?></span>
            </address>
          </div>

          <div class="col-sm-2 col-lg-2">
            <h4 class="line3 center standard-h4title"><span>Your Account</span></h4>
            <ul>
              <li>          
              <li><a href="<?php echo lc_href_link(FILENAME_ACCOUNT, 'login', 'SSL'); ?>"><?php echo 'Login' ?></a></li>                                              
              <li><a href="<?php echo lc_href_link(FILENAME_ACCOUNT, 'create', 'SSL'); ?>"><?php echo 'Register' ?></a></li>
              <li><a href="<?php echo lc_href_link(FILENAME_ACCOUNT, 'password_forgotten', 'SSL'); ?>"><?php echo 'Forgot your password?' ?></a></li>   
            </ul>     
          </div>
          <div class="col-sm-2 col-lg-2 no-padding-left">
            <h4 class="line3 center standard-h4title"><span>Follow Us</span></h4>
            <div> 15,237 people Online</div>
            <div id="footer-social-icons-container" class="large-margin-right margin-left-neg">
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
          </div><div class="clear-both"></div>                         

          <!-- QR Code -->
          <div id="qr-code-container" class="pull-right margin-top-neg large-padding-right large-margin-right">        
            <a id="qrcode-tooltip">
              <span style="cursor:pointer;">
                <img src="images/icons/qr-icon.png" alt="<?php echo $lC_Language->get('text_click_and_scan');?>" style="vertical-align:middle; padding-right:6px;" /><span class="small-margin-left"><?php echo $lC_Language->get('text_click_and_scan');?></span>
              </span>
            </a>
          </div>
          <div id="ShowQRCode"></div> 
          <div class="margin-left small-padding-left margin-right small-padding-right small-margin-top"><p><?php echo $lC_Template->getBranding('footer_text');?></p></div>
        </div>
      </div>  
    </div>
  </div>
</div>


<div id="footer">
  <div class="container" style="width:100%;">
    <div class="container_controller">
      <div class="row">
        <div class="col-sm-12 col-lg-12">
          <div class="pull-left">&copy; Copyright <?php echo date("Y"); ?>. Designed by <a  onclick="window.open('http://www.algozone.com');" >Algozone.com.</a> <br />
            All Rights Reserved. <a href=""><?php echo STORE_NAME; ?></a>
          </div>
          <!-- div class="pull-right"> <a class="payment_by" href="#"> </a> </div -->
        </div>    
      </div>
    </div>
  </div>  
</div>

<!--footer.php end-->