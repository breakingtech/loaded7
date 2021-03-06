<?php
/**
  @package    admin::modules
  @author     Loaded Commerce
  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
  @copyright  Portions Copyright 2003 osCommerce
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: banner_manager.php v1.0 2013-08-08 datazen $
*/
class lC_Access_Banner_manager extends lC_Access {
  var $_module = 'banner_manager',
      $_group = 'marketing',
      $_icon = 'windows.png',
      $_title,
      $_sort_order = 300;

  public function lC_Access_Banner_manager() {
    global $lC_Language;

    $this->_title = $lC_Language->get('access_banner_manager_title');
  }
}
?>
