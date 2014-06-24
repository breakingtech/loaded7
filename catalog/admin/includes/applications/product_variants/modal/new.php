<?php
/**
  @package    catalog::admin::applications
  @author     Loaded Commerce
  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
  @copyright  Portions Copyright 2003 osCommerce
  @copyright  Template built on Developr theme by DisplayInline http://themeforest.net/user/displayinline under Extended license 
  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
  @version    $Id: new.php v1.0 2013-08-08 datazen $
*/
?>
<style>
#newGroup { padding-bottom:20px; }
</style>
<script>
function newGroup() {
  var accessLevel = '<?php echo $_SESSION['admin']['access'][$lC_Template->getModule()]; ?>';
  if (parseInt(accessLevel) < 2) {
    $.modal.alert('<?php echo $lC_Language->get('ms_error_no_access');?>');
    return false;
  }
  var jsonLink = '<?php echo lc_href_link_admin('rpc.php', $lC_Template->getModule() . '&action=getFormData'); ?>'
  $.getJSON(jsonLink,
    function (data) {
      if (data.rpcStatus == -10) { // no session
        var url = "<?php echo lc_href_link_admin(FILENAME_DEFAULT, 'login'); ?>";
        $(location).attr('href',url);
      }
      if (data.rpcStatus != 1) {
        $.modal.alert('<?php echo $lC_Language->get('ms_error_action_not_performed'); ?>');
        return false;
      }
      $.modal({
          content: '<div id="newGroup">'+
                   '  <div id="newGroupForm">'+
                   '    <form name="pvNew" id="pvNew" autocomplete="off" action="" method="post">'+
                   '      <p><?php echo $lC_Language->get('introduction_new_variant_group'); ?></p>'+
                   '      <p class="button-height inline-label">'+
                   '        <label for="products_id" class="label" style="width:30%;"><?php echo $lC_Language->get('field_name'); ?></label>'+
                   '        <span id="groupNames"></span>'+
                   '      </p>'+
                   '      <p class="button-height inline-label">'+
                   '        <label for="module" class="label" style="width:30%;"><?php echo $lC_Language->get('field_display_module'); ?></label>'+
                   '        <?php echo lc_draw_pull_down_menu('module', null, null, 'class="input with-small-padding" style=width:73%;"'); ?>'+
                   '      </p>'+
                   '      <p class="button-height inline-label">'+
                   '        <label for="sort_order" class="label" style="width:30%;"><?php echo $lC_Language->get('field_sort_order'); ?></label>'+
                   '        <?php echo lc_draw_input_field('sort_order', null, 'class="input"'); ?>'+
                   '      </p>'+
                   '    </form>'+
                   '  </div>'+
                   '</div>',
          title: '<?php echo $lC_Language->get('modal_heading_new_variant_group'); ?>',
          width: 500,
                actions: {
            'Close' : {
              color: 'red',
              click: function(win) { win.closeModal(); }
            }
          },
          buttons: {
            '<?php echo $lC_Language->get('button_cancel'); ?>': {
              classes:  'glossy',
              click:    function(win) { win.closeModal(); }
            },
            '<?php echo $lC_Language->get('button_save'); ?>': {
              classes:  'blue-gradient glossy',
              click:    function(win) {
                var bValid = $("#pvNew").validate({
                  rules: {
                    'group_name[1]': { required: true },
                    zone_description: { required: true },
                    sort_order: { digits: true }
                  },
                  invalidHandler: function() {
                  }
                }).form();
                if (bValid) {
                  var module = $('#module').val();
                  var isPro = '<?php echo utility::isPro(); ?>';
                  if (isPro == false && (module == 'file_upload' || module == 'multiple_file_upload')) {
                    $.modal.alert('<?php echo $lC_Language->get('text_available_with_pro'); ?>');
                    return false;
                  }
                  
                  var nvp = $("#pvNew").serialize();
                  var jsonLink = '<?php echo lc_href_link_admin('rpc.php', $lC_Template->getModule() . '&action=saveGroup&BATCH'); ?>'
                  $.getJSON(jsonLink.replace('BATCH', nvp),
                    function (rdata) {
                      if (rdata.rpcStatus == -10) { // no session
                        var url = "<?php echo lc_href_link_admin(FILENAME_DEFAULT, 'login'); ?>";
                        $(location).attr('href',url);
                      }
                      $("#status-working").fadeOut('slow');
                      if (rdata.rpcStatus != 1) {
                        $.modal.alert('<?php echo $lC_Language->get('ms_error_action_not_performed'); ?>');
                        return false;
                      }
                      oTable.fnReloadAjax();
                    }
                  );
                  win.closeModal();
                }
              }
            }
          },
          buttonsLowPadding: true
      });
      $("#module").empty();  // clear the old values
      i = 0;
      $.each(data.modulesArray, function(val, text) {
        var text = text.replace(/_/g, " ").replace(/\b./g, function(m){ return m.toUpperCase(); });
        var isPro = '<?php echo utility::isPro(); ?>';
        if(i == 0) {
          $("#module").closest("span + *").prevAll("span.select-value:first").text(text);
          i++;
        }
        if ( isPro == false  && (val == 'file_upload' || val == 'multiple_file_upload')) text = text + ' (PRO)';
        $("#module").append(
          $('<option></option>').val(val).html(text)
        );
      });
      $("#groupNames").html(data.groupNames);
    }
  );
}
</script>
