<?php
/**
  @package    admin::modules
  @author     Loaded Commerce
  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
  @copyright  Portions Copyright 2003 osCommerce
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: paypal_flag.php v1.0 2013-08-08 datazen $
*/
class lC_ProductAttributes_paypal_flag extends lC_Product_attributes_Admin {
  
  public function __construct() {
    $this->_section = 'dataManagementSettings';
  }
  
  public function setFunction($value) {
    global $lC_Database, $lC_Language;

    $string = '';

    $array = array(array('id' => '1', 'text' => $lC_Language->get('text_yes')),
                   array('id' => '0', 'text' => $lC_Language->get('text_no')));

    if ( !empty($array) ) {
      $string = lc_draw_pull_down_menu('attributes[' . self::getID() . ']', $array, $value, 'class="select full-width"');
    }

    return $string;
  }
}
?>