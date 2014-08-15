<?php
/**
  @package    catalog::admin::applications
  @author     Loaded Commerce
  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
  @copyright  Portions Copyright 2003 osCommerce
  @copyright  Template built on Developr theme by DisplayInline http://themeforest.net/user/displayinline under Extended license 
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: relationships_access_levels.inc.php v1.0 2014-01-24 datazen $
*/
global $lC_Vqmod, $lC_Language;

require_once($lC_Vqmod->modCheck(DIR_FS_CATALOG . 'addons/Loaded_7_B2B/admin/applications/customer_groups/classes/customer_groups.php'));
?>
  
<fieldset class="fieldset margin-top"> 
  <legend class="legend"><?php echo $lC_Language->get('section_access_levels_overrides'); ?></legend>
  <div class="columns ">
   <div class="new-row twelve-columns no-margin-bottom">
     <h5 class="no-margin-top"><?php echo $lC_Language->get('subsection_access'); ?></h5>
     <p><?php echo lC_Customer_groups_b2b_Admin::getCustomerAccessLevelsHtml(); ?></p>
   </div>
  </div>
</fieldset>  

<script>
function checkAllLevels(e) {
  var checked = $(e).is(":checked");
  $('.levels').prop('checked', checked);
}

$(document).ready(function() {  
  if ($('.levels:checked').length == $('.levels').length) $('#check_all_levels').prop('checked', true);
  
  var hasGroupPricing = '<?php echo (isset($pInfo) && lC_Products_b2b_Admin::hasGroupPricing($pInfo->get('products_id')) === true) ? 1 : 0; ?>';
  if (hasGroupPricing == 1) {
    $('#specials_pricing_switc').click();
  }   
});
</script>