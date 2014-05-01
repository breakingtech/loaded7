<?php
/**
  @package    catalog::admin::templates
  @author     Loaded Commerce
  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
  @copyright  Portions Copyright 2003 osCommerce
  @copyright  Template built on Developr theme by DisplayInline http://themeforest.net/user/displayinline under Extended license 
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: core.php v1.0 2013-08-08 datazen $
*/
class lC_Template_core {
  var $_id,
      $_title = 'Bootstrap 3.1.1 Core Template',
      $_code = 'core',
      $_author_name = 'Loaded Commerce, LLC',
      $_author_www = 'http://www.loadedcommerce.com',
      $_markup_version = 'HTML5/CSS3',
      $_css_based = '1', /* 0=No; 1=Yes */
      $_medium = 'Mobile Responsive UI',
      $_screenshot = 'core.png',
      $_version = '1.0.6',
      $_compatibility = '7.002.2.0',      
      $_groups = array('boxes' => array('left', 'right'),
                       'content' => array('header', 'before', 'after', 'footer')),      
      $_colors = array(array('id' => 'charcoal',
                             'text' => 'Charcoal'),
                       array('id' => 'blue_lightning',
                             'text' => 'Blue Lightning'),
                       array('id' => 'red_umber',
                             'text' => 'Red Umber'),
                       array('id' => 'green_valley',
                             'text' => 'Green Valley'),
                       array('id' => 'orange_summer',
                             'text' => 'Orange Summer'),
                       array('id' => 'yellow_highlight',
                             'text' => 'Yellow Highlight')),
      $_keys;

  public function getID() {
    global $lC_Database;

    if (isset($this->_id) === false) {
      $Qtemplate = $lC_Database->query('select id from :table_templates where code = :code');
      $Qtemplate->bindTable(':table_templates', TABLE_TEMPLATES);
      $Qtemplate->bindvalue(':code', $this->_code);
      $Qtemplate->execute();

      $this->_id = $Qtemplate->valueInt('id');
    }

    return $this->_id;
  }

  public function getTitle() {
    return $this->_title;
  }

  public function getCode() {
    return $this->_code;
  }

  public function getAuthorName() {
    return $this->_author_name;
  }

  public function getAuthorAddress() {
    return $this->_author_www;
  }

  public function getMarkup() {
    return $this->_markup_version;
  }

  public function isCSSBased() {
    return ($this->_css_based == '1');
  }

  public function getMedium() {
    return $this->_medium;
  }

  public function getGroups($group) {
    return $this->_groups[$group];
  }
  
  function getScreenshot() {
    return $this->_screenshot;
  }
  
  public function getVersion() {
    return $this->_version;
  }
    
  public function getCompatibility() {
    return $this->_compatibility;
  }  

  public function install() {
    global $lC_Database;

    $Qinstall = $lC_Database->query('insert into :table_templates (title, code, author_name, author_www, markup_version, css_based, medium) values (:title, :code, :author_name, :author_www, :markup_version, :css_based, :medium)');
    $Qinstall->bindTable(':table_templates', TABLE_TEMPLATES);
    $Qinstall->bindValue(':title', $this->_title);
    $Qinstall->bindValue(':code', $this->_code);
    $Qinstall->bindValue(':author_name', $this->_author_name);
    $Qinstall->bindValue(':author_www', $this->_author_www);
    $Qinstall->bindValue(':markup_version', $this->_markup_version);
    $Qinstall->bindValue(':css_based', $this->_css_based);
    $Qinstall->bindValue(':medium', $this->_medium);
    $Qinstall->execute();

    $id = $lC_Database->nextID();

    $data = array('categories' => array('*', 'left', '100'),
                  'manufacturers' => array('*', 'left', '200'));

    $Qboxes = $lC_Database->query('select id, code from :table_templates_boxes');
    $Qboxes->bindTable(':table_templates_boxes', TABLE_TEMPLATES_BOXES);
    $Qboxes->execute();

    while ($Qboxes->next()) {
      if (isset($data[$Qboxes->value('code')])) {
        $Qrelation = $lC_Database->query('insert into :table_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) values (:templates_boxes_id, :templates_id, :content_page, :boxes_group, :sort_order, :page_specific)');
        $Qrelation->bindTable(':table_templates_boxes_to_pages', TABLE_TEMPLATES_BOXES_TO_PAGES);
        $Qrelation->bindInt(':templates_boxes_id', $Qboxes->valueInt('id'));
        $Qrelation->bindInt(':templates_id', $id);
        $Qrelation->bindValue(':content_page', $data[$Qboxes->value('code')][0]);
        $Qrelation->bindValue(':boxes_group', $data[$Qboxes->value('code')][1]);
        $Qrelation->bindInt(':sort_order', $data[$Qboxes->value('code')][2]);
        $Qrelation->bindInt(':page_specific', 0);
        $Qrelation->execute();
      }
    }
    
    // added configuration values
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('Core Template Color Scheme', 'TEMPLATES_" . strtoupper($this->_code) . "_COLOR_SCHEME', 'charcoal', 'The Core Template Color Scheme?', '6', '0', now(), now(), 'lc_cfg_set_template_color_pulldown_menu', 'lc_cfg_set_template_color_pulldown_menu(array(\'charcoal\',\'blue_lightning\',\'red_umber\',\'green_valley\',\'orange_summer\',\'yellow_highlight\'))')");
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('Loacalization Menu', 'TEMPLATES_" . strtoupper($this->_code) . "_HEADER_LOCALIZATION', '1', 'Display the localization menu in the header?', '6', '0', now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))')");
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('Socail Icons', 'TEMPLATES_" . strtoupper($this->_code) . "_HEADER_SOCIAL', '1', 'Display the social icons in the header?', '6', '0', now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))')");
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('Header Search', 'TEMPLATES_" . strtoupper($this->_code) . "_HEADER_SEARCH', '1', 'Display the searh field in the header?', '6', '0', now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))')");
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('Product Blurb', 'TEMPLATES_" . strtoupper($this->_code) . "_LISTING_BLURB', '1', 'Display the blurb in the products listing?', '6', '0', now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))')");
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('Featured Ribbon', 'TEMPLATES_" . strtoupper($this->_code) . "_LISTING_FEATURED_RIBBON', '1', 'Display the featured ribbon in the products listing?', '6', '0', now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))')");
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('On Sale Ribbon', 'TEMPLATES_" . strtoupper($this->_code) . "_LISTING_SALE_RIBBON', '1', 'Display the sale ribbon in the products listing?', '6', '0', now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))')");
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('New Product Ribbon', 'TEMPLATES_" . strtoupper($this->_code) . "_LISTING_NEW_RIBBON', '1', 'Display the new product ribbon in the products listing?', '6', '0', now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))')");
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('Best Seller Ribbon', 'TEMPLATES_" . strtoupper($this->_code) . "_LISTING_BEST_RIBBON', '1', 'Display the best seller ribbon in the products listing?', '6', '0', now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))')");
    $lC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('Highest Rating Ribbon', 'TEMPLATES_" . strtoupper($this->_code) . "_LISTING_RATING_RIBBON', '1', 'Display the highest rating ribbon in the products listing?', '6', '0', now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))')");
    
  }

  public function remove() {
    global $lC_Database;

    $Qdel = $lC_Database->query('delete from :table_templates_boxes_to_pages where templates_id = :templates_id');
    $Qdel->bindTable(':table_templates_boxes_to_pages', TABLE_TEMPLATES_BOXES_TO_PAGES);
    $Qdel->bindValue(':templates_id', $this->getID());
    $Qdel->execute();

    $Qdel = $lC_Database->query('delete from :table_templates where id = :id');
    $Qdel->bindTable(':table_templates', TABLE_TEMPLATES);
    $Qdel->bindValue(':id', $this->getID());
    $Qdel->execute();

    if ($this->hasKeys()) {
      $Qdel = $lC_Database->query('delete from :table_configuration where configuration_key in (":configuration_key")');
      $Qdel->bindTable(':table_configuration', TABLE_CONFIGURATION);
      $Qdel->bindRaw(':configuration_key', implode('", "', $this->getKeys()));
      $Qdel->execute();
    }
  }

  public function hasKeys() {
    static $has_keys;

    if (isset($has_keys) === false) {
      $has_keys = (sizeof($this->getKeys()) > 0) ? true : false;
    }

    return $has_keys;
  }

  public function getKeys() {
    if (!isset($this->_keys)) {
      $this->_keys = array('TEMPLATES_' . strtoupper($this->_code) . '_COLOR_SCHEME',
                           'TEMPLATES_' . strtoupper($this->_code) . '_HEADER_LOCALIZATION',
                           'TEMPLATES_' . strtoupper($this->_code) . '_HEADER_SOCIAL',
                           'TEMPLATES_' . strtoupper($this->_code) . '_HEADER_SEARCH',
                           'TEMPLATES_' . strtoupper($this->_code) . '_LISTING_BLURB',
                           'TEMPLATES_' . strtoupper($this->_code) . '_LISTING_FEATURED_RIBBON',
                           'TEMPLATES_' . strtoupper($this->_code) . '_LISTING_SALE_RIBBON',
                           'TEMPLATES_' . strtoupper($this->_code) . '_LISTING_NEW_RIBBON',
                           'TEMPLATES_' . strtoupper($this->_code) . '_LISTING_BEST_RIBBON',
                           'TEMPLATES_' . strtoupper($this->_code) . '_LISTING_RATING_RIBBON');      
    }

    return $this->_keys;
  }

  public function isInstalled() {
    global $lC_Database;

    static $is_installed;

    if (isset($is_installed) === false) {
      $Qcheck = $lC_Database->query('select id from :table_templates where code = :code');
      $Qcheck->bindTable(':table_templates', TABLE_TEMPLATES);
      $Qcheck->bindValue(':code', $this->_code);
      $Qcheck->execute();

      $is_installed = ($Qcheck->numberOfRows()) ? true : false;
    }

    return $is_installed;
  }

  public function isActive() {
    return true;
  }

  /**
  * Added for new configuration settings in template edit modal
  * 
  */
  public function getConfigs() {
    global $lC_Database;
    
    foreach ($this->getKeys() as $key) {
      $Qkey = $lC_Database->query('select configuration_id, configuration_title, configuration_value, configuration_description, use_function, set_function from :table_configuration where configuration_key = :configuration_key');
      $Qkey->bindTable(':table_configuration', TABLE_CONFIGURATION);
      $Qkey->bindValue(':configuration_key', $key);
      $Qkey->execute();
      
      while ($Qkey->next()) {
        $keysArr[$key] = array('id' => $Qkey->valueInt('configuration_id'),
                               'title' => $Qkey->value('configuration_title'),
                               'value' => $Qkey->value('configuration_value'),
                               'description' => $Qkey->value('configuration_description'),
                               'use_function' => $Qkey->value('use_function'),
                               'set_function' => $Qkey->value('set_function'),
                               // add needed params arrays below for template specific configuration
                               'params' => array('colors' => $this->getColors()));
      }
    }
    
    return $keysArr;
  }

  public function getColors() {
    return $this->_colors;
  }
}
?>