<?php
/**
  @package    catalog::admin::applications
  @author     Loaded Commerce
  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
  @copyright  Portions Copyright 2003 osCommerce
  @copyright  Template built on Developr theme by DisplayInline http://themeforest.net/user/displayinline under Extended license 
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: main.php v1.0 2013-08-08 datazen $
*/  
?>
<!-- Main content -->
<section role="main" id="main">
  <noscript class="message black-gradient simpler"><?php echo $lC_Language->get('ms_error_javascript_not_enabled_warning'); ?></noscript>
  <hgroup id="main-title" class="thin">
    <h1><?php echo $lC_Template->getPageTitle(); ?></h1>
  </hgroup>
  <style scoped="scoped">
  .dataColCheck { text-align: center; }
  .dataColProducts { text-align: left; }
  .dataColCats { text-align: left; }
  .dataColClass { text-align: left; }
  .dataColPrice { text-align: left; }
  .dataColQty { text-align: left; }
  .dataColStatus { text-align: center; }
  .dataColAction { text-align: right; }
  .dataTables_info { position:absolute; bottom:42px; color:#4c4c4c; }
  .dataTables_length { float: right; }
  .selectContainer { position:absolute; bottom:29px; left:30px }
  .sorting:before { width: 0; margin-left: 0; }  
  </style>
  <div class="with-padding-no-top">
    <div id="categories_filter_container">
      <div id="categories_filter">
        <form name="products_categories_filter" id="products_categories_filter" action="" onchange="updateProductFilter($('#filter').val());">
          <label for="filter" class="white mid-margin-right"><?php echo $lC_Language->get('text_categories'); ?>:</label>
          <select class="input with-small-padding" id="filter" name="filter">
            <option value=""><?php echo $lC_Language->get('text_all'); ?></option>
            <?php echo lC_Products_Admin::assignedCategoryTreeSelect(3); ?>
          </select>
        </form>
      </div>
    </div>
    <form name="batch" id="batch" action="#" method="post">
      <table border="0" width="100%" cellspacing="0" cellpadding="0" class="table responsive-table" id="dataTable">
        <thead>
          <tr>
            <th scope="col" class="hide-on-mobile align-left"><input onclick="toggleCheck();" id="check-all" type="checkbox" value="1" name="check-all"></th>
            <th scope="col" class="align-left"><?php echo $lC_Language->get('table_heading_products'); ?></th>
            <th scope="col" class="align-left hide-on-tablet"><?php echo $lC_Language->get('table_heading_categories'); ?></th>
            <th scope="col" class="align-left hide-on-tablet"><?php echo $lC_Language->get('table_heading_class'); ?></th>
            <th scope="col" class="align-left hide-on-mobile-portrait"><?php echo $lC_Language->get('table_heading_price'); ?></th>
            <th scope="col" class="align-center hide-on-mobile"><?php echo $lC_Language->get('table_heading_quantity'); ?></th>
            <th scope="col" class="align-center hide-on-mobile no-wrap"><?php echo $lC_Language->get('table_heading_status'); ?></th>
            <th scope="col" class="align-right">
             <span class="button-group compact" style="white-space:nowrap;">
               <a style="display:none;" style="cursor:pointer" class="on-mobile button with-tooltip icon-plus-round green<?php echo (((int)$_SESSION['admin']['access'][$lC_Template->getModule()] < 2) ? ' disabled' : NULL); ?>" href="<?php echo (((int)$_SESSION['admin']['access'][$lC_Template->getModule()] < 2) ? '#' : lc_href_link_admin(FILENAME_DEFAULT, $lC_Template->getModule() . '&cID=' . $category_id . '&action=save')); ?>" title="<?php echo $lC_Language->get('button_new_product'); ?>"></a>
               <a href="javascript:void(0);" style="cursor:pointer" onclick="oTable.fnReloadAjax();" class="button with-tooltip icon-redo blue" title="<?php echo $lC_Language->get('button_refresh'); ?>"></a>
             </span>
             <span id="actionText">&nbsp;&nbsp;<?php echo $lC_Language->get('table_heading_action'); ?></span>
            </th>        
          </tr>
        </thead>
        <tbody>
        </tbody>
        <tfoot>
          <tr>
            <th colspan="10">&nbsp;</th>
          </tr>
        </tfoot>
      </table>
      <div class="selectContainer">
        <select <?php echo (((int)$_SESSION['admin']['access'][$lC_Template->getModule()] < 4) ? NULL : 'onchange="doSelectFunction(this);"'); ?> name="selectAction" id="selectAction" class="select blue-gradient glossy<?php echo (((int)$_SESSION['admin']['access'][$lC_Template->getModule()] < 4) ? ' disabled' : NULL); ?>">
          <!-- VQMOD-hookpoint; DO NOT MODIFY OR REMOVE THE LINE BELOW -->
          <option value="0" selected="selected"><?php echo $lC_Language->get('text_with_selected'); ?></option>
          <option value="copy">Copy</option>
          <option value="delete">Delete</option>
        </select>
      </div>
    </form>
    <div class="clear-both"></div>
    <div class="six-columns twelve-columns-tablet">
      <div id="buttons-menu-div-listing">
        <div id="buttons-container" style="position: relative;" class="clear-both">
          <div style="float:right;">
            <p class="button-height" align="right">
              <a class="button<?php echo (((int)$_SESSION['admin']['access'][$lC_Template->getModule()] < 2) ? ' disabled' : NULL); ?>" href="<?php echo (((int)$_SESSION['admin']['access'][$lC_Template->getModule()] < 2) ? '#' : lc_href_link_admin(FILENAME_DEFAULT, $lC_Template->getModule() . '&cID=' . $category_id . '&action=save')); ?>">
                <span class="button-icon green-gradient">
                  <span class="icon-plus"></span>
                </span><?php echo $lC_Language->get('button_new_product'); ?>
              </a>&nbsp;
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<?php $lC_Template->loadModal($lC_Template->getModule()); ?>
<!-- End main content -->