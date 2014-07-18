<?php
    // paypal flag   
    $Qchk = $lC_Database->query("select id from :table_templates_boxes where code = :code limit 1");
    $Qchk->bindTable(':table_templates_boxes', TABLE_TEMPLATES_BOXES);
    $Qchk->bindValue(':code', 'paypal_flag');
    $Qchk->execute();    
    
    $paypal_flag_id = $Qchk->valueInt('id');
    
    $Qchk->freeResult();
    
    $paypal_flag = false;
    foreach($lC_ShoppingCart->getProducts() as $product) {
  
      $Qchk2 = $lC_Database->query("select id from :table_product_attributes where products_id = :products_id");
      $Qchk2->bindTable(':table_product_attributes', TABLE_PRODUCT_ATTRIBUTES);
      $Qchk2->bindValue(':products_id', $product['id']);
      $Qchk2->execute(); 
      
      while ($Qchk2->next()) {
        if ($Qchk2->valueInt('id') == $paypal_flag_id) {
          $paypal_flag = true;
          break;
        }
      }
      $Qchk2->freeResult(); 
    }
?>
