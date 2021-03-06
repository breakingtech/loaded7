<?php
/**
  @package    admin::classes
  @author     Loaded Commerce
  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
  @copyright  Portions Copyright 2003 osCommerce
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: template.php v1.0 2013-08-08 datazen $
*/
global $lC_Vqmod;

require($lC_Vqmod->modCheck('../includes/classes/template.php'));

class lC_Template_Admin extends lC_Template {

  public function setup($module) {
    global $lC_Vqmod;
    
    $class = 'lC_Application_' . ucfirst($module);

    if ( isset($_GET['action']) && !empty($_GET['action']) ) {
      $_action = lc_sanitize_string(basename($_GET['action']));

      if ( file_exists('includes/applications/' . $module . '/actions/' . $_action . '.php') ) {
        include($lC_Vqmod->modCheck('includes/applications/' . $module . '/actions/' . $_action . '.php'));
        $class = 'lC_Application_' . ucfirst($module) . '_Actions_' . $_action;
      } else if (lC_Addons_Admin::hasAdminModuleActions($module, $_action)) {
        include($lC_Vqmod->modCheck(lC_Addons_Admin::getAdminModuleActionsPath($module, $_action)));
        $class = 'lC_Application_' . ucfirst($module) . '_Actions_' . $_action;        
      }
    }

    $object = new $class();

    return $object;
  }
  /*
  * Load the Modal Windows
  *
  * @access public
  * @return boolean
  */
  public function loadModal($_module, $_sub = false) {
    global $lC_Language, $lC_Template, $lC_Vqmod;
    
    if ( is_dir('includes/applications/' . $_module . '/modal') ) {
      $pattern = '/(\w*)\.php$/';
      $dir = opendir('includes/applications/' . $_module . '/modal');
      while( $file = readdir( $dir ) ) {
        if ($file == '.'  || $file == '..') continue;
        $match = array();
        if ( preg_match($pattern, $file, $match) > 0 ) {
          if ($_sub == true && strstr($match[0], '_')) {
            include($lC_Vqmod->modCheck('includes/applications/' . $_module . '/modal/' . $match[0]));
          } else if ($_sub == false && !strstr($match[0], '_')) {
            include($lC_Vqmod->modCheck('includes/applications/' . $_module . '/modal/' . $match[0]));
          }
        }
      }
    } 
    
    if (lC_Addons_Admin::hasAdminModuleModals($_module)) {
      lC_Addons_Admin::loadAdminModuleModals($_module);
    }
    
    return true;
  }
  /*
  * Load the page specific javascript
  *
  * @access public
  * @return boolean
  */
  public function loadPageScript($_module) {
    global $lC_Vqmod;
    
    if ( file_exists('includes/applications/' . $_module . '/js/' . $_module . '.js.php') ) {
      include($lC_Vqmod->modCheck('includes/applications/' . $_module . '/js/' . $_module . '.js.php'));
    } else if (lC_Addons_Admin::hasAdminModulePageScript($_module)) {
      include($lC_Vqmod->modCheck(lC_Addons_Admin::getAdminModulePageScriptPath($_module)));
    }

    return true;
  }
  /*
  * Load the page specific responsive javascript
  *
  * @access public
  * @return boolean
  */
  public function loadPageResponsiveScript($_module) {
    global $lC_Vqmod;
    
    if ( file_exists('includes/applications/' . $_module . '/js/responsive.js.php') ) {
      include($lC_Vqmod->modCheck('includes/applications/' . $_module . '/js/responsive.js.php'));
    } else if (lC_Addons_Admin::hasAdminModulePageResponsiveScript($_module)) {
      include($lC_Vqmod->modCheck(lC_Addons_Admin::getAdminModulePageResponsiveScriptPath($_module)));
    }

    return true;
  }
  /*
  * Load the page specific search box delay javascript
  *
  * @access public
  * @return boolean
  */
  public function loadPageSearchBoxDelayScript($_module) {
    global $lC_Vqmod;
    
    if ( file_exists('includes/applications/' . $_module . '/js/responsive.js.php') ) {
      if ( file_exists(DIR_FS_CATALOG . 'ext/jquery/DataTables/media/js/jquery.dataTables.delay.min.js') ) {
        include($lC_Vqmod->modCheck(DIR_FS_CATALOG . 'ext/jquery/DataTables/media/js/jquery.dataTables.delay.min.js'));
      }
    }

    return true;
  }    
  /*
  * Load the page specific CSS
  *
  * @access public
  * @return boolean
  */
  public function loadPageCSS($_module) {

    $html = '';
    if ( file_exists('templates/default/css/' . $_module . '.css') ) {
      $html = '<link rel="stylesheet" href="templates/default/css/' . $_module . '.css">';
    }

    return $html;
  }
  /*
  * Check to see whether the user if authorized to view the page
  *
  * @access public
  * @return boolean
  */
  public function isAuthorized($_module) {
    $ok = FALSE;
    
    if ((int)$_SESSION['admin']['access'][strtolower($_module)] > 0) { $ok = TRUE;
    } else if ($_module == 'login') { $ok = TRUE;
    } else if ($_module == 'store' && $_SESSION['admin']['access']['configuration'] > 0) { $ok = TRUE;
    } else if ($_module == 'index' && $this->getPageContentsFilename() == 'main.php') { $ok = TRUE;
    } else if ($_module == 'image_groups' && $_SESSION['admin']['access']['product_settings'] > 0) { $ok = TRUE;
    } else if ($_module == 'weight_classes' && $_SESSION['admin']['access']['product_settings'] > 0) { $ok = TRUE;
    } else if (stristr($_module, 'modules_') && $_SESSION['admin']['access']['modules'] > 0) { $ok = TRUE;
    } else if ($_module == 'services' && $_SESSION['admin']['access']['modules'] > 0) { $ok = TRUE;
    } else if ($_module == 'product_attributes' && $_SESSION['admin']['access']['modules'] > 0) { $ok = TRUE;
    } else if ($_module == 'product_variants' && $_SESSION['admin']['access']['option_manager'] > 0) { $ok = TRUE;    
    } else if ($_module == 'countries' && $_SESSION['admin']['access']['locale'] > 0) { $ok = TRUE;    
    } else if ($_module == 'zone_groups' && $_SESSION['admin']['access']['locale'] > 0) { $ok = TRUE;              
    }

    return $ok;
  }  
  /**
  * Sets the template to use
  *
  * @param string $code The code of the template to use
  * @access public
  */
  public function set($code = null) {
    if ( (isset($_SESSION['template']) === false) || !empty($code) || (isset($_GET['template']) && !empty($_GET['template'])) ) {
      if ( !empty( $code ) ) {
        $set_template = $code;
      } else {
        $set_template = (isset($_GET['template']) && !empty($_GET['template'])) ? $_GET['template'] : 'default';
      }

      /*$data = array();
      $data_default = array();

      foreach ($this->getTemplates() as $template) {
        if ($template['code'] == DEFAULT_TEMPLATE) {
          $data_default = array('id' => $template['id'], 'code' => $template['code']);
        } elseif ($template['code'] == $set_template) {
          $data = array('id' => $template['id'], 'code' => $template['code']);
        }
      }

      if (empty($data)) {
        $data = $data_default;
      }*/

      $_SESSION['template']['code'] = $set_template;
    }

    //$this->_template_id = $_SESSION['template']['id'];
    //$this->_template = $_SESSION['template']['code'];
  }  
  /**
  * Shows the products search like megasearch
  *
  * @param string $key The search term
  * @access public
  */
  public function showProductSearch($field = null) {
    global $lC_Language;
    
    $this_field = $field . '_product_search';
    $html = '
        <div class="productSearch">
          <span class="input">
            <label class="button blue-gradient cursor-default" for="p"><span class="icon-plus-round icon-white small-margin-right"><span class="small-margin-left">' . $lC_Language->get('text_product') . '</span></span></label>
            <input id="' . $field . '_product_search" class="input-unstyled noEnterSubmit productSearchInput" type="text" onkeyup="productSearch(\'' . $this_field . '\', \'' . $field . '\', this.value);" autocomplete="off" placeholder="' . $lC_Language->get('product_search_placeholder') . '" value="" name="p" style="padding-right: 0 !important;">
          </span>
          <div class="' . $field . '_results"></div> 
        </div>';
             
    return $html;
  }
  /**
  * Shows the Catalogo from Branding Manager
  *
  * 
  * @access public
  */
  public function getBrandingImage() {
    global $lC_Database, $lC_Language;
    
    $QbrandingImage = $lC_Database->query('select site_image from :table_branding_data');
    $QbrandingImage->bindTable(':table_branding_data', TABLE_BRANDING_DATA);
    $QbrandingImage->execute();
    
    $image = $QbrandingImage->toArray();
    
    return $image['site_image'];
  } 
  
}
?>