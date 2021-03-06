#  @package    catalog::install
#  @author     Loaded Commerce
#  @copyright  Copyright 2003-2014 Loaded Commerce, LLC
#  @copyright  Portions Copyright 2003 osCommerce
#  @copyright  Template built on DevKit http://www.bootstraptor.com under GPL license 
#  @license    https://github.com/loadedcommerce/loaded7/blob/master/LICENSE.txt
#  @version    $Id: loadedcommerce.sql v1.0 2013-08-08 datazen $

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS lc_address_book;
CREATE TABLE lc_address_book (
  address_book_id int(11) NOT NULL AUTO_INCREMENT,
  customers_id int(11) NOT NULL,
  entry_gender char(1) NOT NULL,
  entry_company varchar(255) DEFAULT NULL,
  entry_firstname varchar(255) NOT NULL,
  entry_lastname varchar(255) NOT NULL,
  entry_street_address varchar(255) NOT NULL,
  entry_suburb varchar(255) DEFAULT NULL,
  entry_postcode varchar(255) NOT NULL,
  entry_city varchar(255) NOT NULL,
  entry_state varchar(255) DEFAULT NULL,
  entry_country_id int(11) NOT NULL,
  entry_zone_id int(11) NOT NULL,
  entry_telephone varchar(255) DEFAULT NULL,
  entry_fax varchar(255) DEFAULT NULL,
  PRIMARY KEY (address_book_id),
  KEY idx_address_book_customers_id (customers_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_administrators;
CREATE TABLE lc_administrators (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_name varchar(255) NOT NULL,
  user_password varchar(128) NOT NULL,
  first_name varchar(64) NOT NULL DEFAULT '',
  last_name varchar(64) NOT NULL DEFAULT '',
  image varchar(255) NOT NULL DEFAULT '',
  access_group_id int(11) NOT NULL DEFAULT '0',
  verify_key varchar(64) NOT NULL DEFAULT '',
  language_id int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_administrators_access;
CREATE TABLE lc_administrators_access (
  id int(11) NOT NULL AUTO_INCREMENT,
  administrators_id int(11) NOT NULL DEFAULT '0',
  administrators_groups_id int(11) NOT NULL DEFAULT '0',
  module varchar(255) NOT NULL DEFAULT '',
  `level` int NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_administrators_groups;
CREATE TABLE lc_administrators_groups (
  id int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  last_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;;

DROP TABLE IF EXISTS lc_administrators_log;
CREATE TABLE lc_administrators_log (
  id int(11) NOT NULL,
  module varchar(255) NOT NULL,
  module_action varchar(255) DEFAULT NULL,
  module_id int(11) DEFAULT NULL,
  field_key varchar(255) NOT NULL,
  old_value text,
  new_value text,
  `action` varchar(255) NOT NULL,
  administrators_id int(11) NOT NULL,
  datestamp datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY idx_administrators_log_id (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_banners;
CREATE TABLE lc_banners (
  banners_id int(11) NOT NULL AUTO_INCREMENT,
  banners_title varchar(255) NOT NULL,
  banners_url varchar(255) NOT NULL,
  banners_target tinyint(1) NOT NULL DEFAULT '1',
  banners_image varchar(255) NOT NULL,
  banners_group varchar(255) NOT NULL,
  banners_html_text text,
  expires_impressions int(11) DEFAULT NULL,
  expires_date datetime DEFAULT NULL,
  date_scheduled datetime DEFAULT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_status_change datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (banners_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_banners_history;
CREATE TABLE lc_banners_history (
  banners_history_id int(11) NOT NULL AUTO_INCREMENT,
  banners_id int(11) NOT NULL DEFAULT '0',
  banners_shown int(11) NOT NULL DEFAULT '0',
  banners_clicked int(11) NOT NULL DEFAULT '0',
  banners_history_date datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (banners_history_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_branding;
CREATE TABLE IF NOT EXISTS lc_branding (
  language_id int(11) NOT NULL DEFAULT '1',
  homepage_text VARCHAR(20000) NOT NULL DEFAULT '',
  slogan varchar(256) NOT NULL DEFAULT '',
  meta_description varchar(250) NOT NULL DEFAULT '',
  meta_keywords varchar(128) NOT NULL DEFAULT '',
  meta_title varchar(128) NOT NULL DEFAULT '',
  meta_title_prefix varchar(128) NOT NULL,
  meta_title_suffix varchar(128) NOT NULL,
  footer_text varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (language_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;
 
 
DROP TABLE IF EXISTS lc_branding_data;
CREATE TABLE IF NOT EXISTS lc_branding_data (
  site_image varchar(128) NOT NULL DEFAULT '',
  chat_code varchar(8192) NOT NULL DEFAULT '',
  support_phone varchar(16) NOT NULL DEFAULT '',
  support_email varchar(128) NOT NULL DEFAULT '',
  sales_phone varchar(16) NOT NULL DEFAULT '',
  sales_email varchar(128) NOT NULL DEFAULT '',
  og_image varchar(128) NOT NULL DEFAULT '',
  meta_delimeter varchar(128) NOT NULL DEFAULT '',
  social_facebook_page varchar(128) NOT NULL,
  social_twitter varchar(128) NOT NULL,
  social_pinterest varchar(128) NOT NULL,
  social_google_plus varchar(128) NOT NULL,
  social_youtube varchar(128) NOT NULL,
  social_linkedin varchar(128) NOT NULL,
  custom_css text NOT NULL
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_categories;
CREATE TABLE lc_categories (
  categories_id int(11) NOT NULL AUTO_INCREMENT,
  categories_image varchar(255) DEFAULT NULL,
  parent_id int(11) NOT NULL DEFAULT '0',
  sort_order int(11) DEFAULT NULL,
  categories_mode varchar(128) DEFAULT NULL,
  categories_link_target tinyint(1) DEFAULT '0',
  categories_custom_url varchar(255) DEFAULT NULL,
  categories_status tinyint(1) DEFAULT NULL,
  categories_visibility_nav tinyint(1) DEFAULT '0',
  categories_visibility_box tinyint(1) DEFAULT '1',
  date_added datetime DEFAULT NULL,
  last_modified datetime DEFAULT NULL,
  access_levels VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (categories_id),
  KEY idx_categories_parent_id (parent_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_categories_description;
CREATE TABLE IF NOT EXISTS lc_categories_description (
  categories_id int(11) NOT NULL,
  language_id int(11) NOT NULL DEFAULT '1',
  categories_name varchar(255) NOT NULL,
  categories_menu_name varchar(255) DEFAULT NULL,
  categories_blurb mediumtext,
  categories_description text,
  categories_keyword text,
  categories_tags varchar(255) DEFAULT NULL,
  PRIMARY KEY (categories_id,language_id),
  KEY idx_categories_name (categories_name)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_configuration;
CREATE TABLE lc_configuration (
  configuration_id int(11) NOT NULL AUTO_INCREMENT,
  configuration_title varchar(255) NOT NULL,
  configuration_key varchar(255) NOT NULL,
  configuration_value text NOT NULL,
  configuration_description varchar(255) NOT NULL,
  configuration_group_id int(11) NOT NULL,
  sort_order int(11) DEFAULT NULL,
  last_modified datetime DEFAULT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  use_function varchar(255) DEFAULT NULL,
  set_function varchar(255) DEFAULT NULL,
  PRIMARY KEY (configuration_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_configuration_group;
CREATE TABLE lc_configuration_group (
  configuration_group_id int(11) NOT NULL AUTO_INCREMENT,
  configuration_group_title varchar(255) NOT NULL,
  configuration_group_description varchar(255) NOT NULL,
  sort_order int(11) DEFAULT NULL,
  visible int(11) DEFAULT '1',
  PRIMARY KEY (configuration_group_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_counter;
CREATE TABLE lc_counter (
  startdate datetime DEFAULT NULL,
  counter int(11) DEFAULT NULL
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_countries;
CREATE TABLE lc_countries (
  countries_id int(11) NOT NULL AUTO_INCREMENT,
  countries_name varchar(255) NOT NULL,
  countries_iso_code_2 char(2) NOT NULL,
  countries_iso_code_3 char(3) NOT NULL,
  address_format varchar(255) DEFAULT NULL,
  PRIMARY KEY (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_coupons;
CREATE TABLE IF NOT EXISTS lc_coupons (
  coupons_id int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('R','T','S','P') NOT NULL DEFAULT 'R',
  mode varchar(32) NOT NULL DEFAULT 'coupon',
  code varchar(32) NOT NULL,
  reward decimal(8,4) NOT NULL DEFAULT '0.0000',
  purchase_over decimal(8,4) NOT NULL DEFAULT '0.0000',
  start_date datetime DEFAULT NULL,
  expires_date datetime DEFAULT NULL,
  uses_per_coupon int(11) NOT NULL DEFAULT '0',
  uses_per_customer int(11) NOT NULL DEFAULT '0',
  restrict_to_products varchar(1024) DEFAULT NULL,
  restrict_to_categories varchar(1024) DEFAULT NULL,
  restrict_to_customers varchar(1024) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  date_created datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  sale_exclude tinyint(1) NOT NULL DEFAULT '0',
  notes varchar(255) NOT NULL,
  PRIMARY KEY (coupons_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_coupons_description;
CREATE TABLE lc_coupons_description (
  coupons_id int(11) NOT NULL DEFAULT '0',
  language_id int(11) NOT NULL DEFAULT '1',
  name varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (coupons_id,language_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_coupons_redeemed;
CREATE TABLE lc_coupons_redeemed (
  id int(11) NOT NULL AUTO_INCREMENT,
  coupons_id int(11) NOT NULL DEFAULT '0',
  customers_id int(11) NOT NULL DEFAULT '0',
  redeem_date datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  redeem_ip varchar(32) NOT NULL DEFAULT '',
  order_id int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_credit_cards;
CREATE TABLE lc_credit_cards (
  id int(11) NOT NULL AUTO_INCREMENT,
  credit_card_name varchar(255) NOT NULL,
  pattern varchar(255) NOT NULL,
  credit_card_status char(1) NOT NULL,
  sort_order int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_currencies;
CREATE TABLE lc_currencies (
  currencies_id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  `code` char(3) NOT NULL,
  symbol_left varchar(12) DEFAULT NULL,
  symbol_right varchar(12) DEFAULT NULL,
  decimal_places char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  last_updated datetime DEFAULT NULL,
  PRIMARY KEY (currencies_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_customers;
CREATE TABLE lc_customers (
  customers_id int(11) NOT NULL AUTO_INCREMENT,
  customers_group_id int(11) NOT NULL DEFAULT '1',
  customers_gender char(1) DEFAULT NULL,
  customers_firstname varchar(255) NOT NULL,
  customers_lastname varchar(255) NOT NULL,
  customers_dob datetime DEFAULT NULL,
  customers_email_address varchar(255) NOT NULL,
  customers_default_address_id int(11) DEFAULT NULL,
  customers_telephone varchar(255) DEFAULT NULL,
  customers_fax varchar(255) DEFAULT NULL,
  customers_password varchar(128) DEFAULT NULL,
  customers_newsletter char(1) DEFAULT NULL,
  customers_status int(11) DEFAULT NULL,
  customers_ip_address varchar(15) DEFAULT NULL,
  date_last_logon datetime DEFAULT NULL,
  number_of_logons int(11) DEFAULT NULL,
  date_account_created datetime DEFAULT NULL,
  date_account_last_modified datetime DEFAULT NULL,
  global_product_notifications int(11) DEFAULT NULL,
  PRIMARY KEY (customers_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_customers_access;
CREATE TABLE lc_customers_access (
  id int(11) NOT NULL AUTO_INCREMENT,
  level varchar(128) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_customers_groups;
CREATE TABLE lc_customers_groups (
  customers_group_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL DEFAULT '1',
  customers_group_name varchar(255) NOT NULL,
  PRIMARY KEY (customers_group_id,language_id),
  KEY idx_customers_group_name (customers_group_name)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_customers_groups_data;
CREATE TABLE lc_customers_groups_data (
  id int(11) NOT NULL AUTO_INCREMENT,
  customers_group_id int(11) NOT NULL DEFAULT '1',
  baseline_discount decimal(5,2) NOT NULL DEFAULT '0.00',
  customers_access_levels varchar(255) NOT NULL DEFAULT '',
  hidden_products_notification tinyint(1) NOT NULL DEFAULT '0',
  taxable tinyint(1) NOT NULL DEFAULT '0',
  payment_modules varchar(255) NOT NULL DEFAULT '',
  shipping_modules varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_featured_products;
CREATE TABLE lc_featured_products (
  id int(11) NOT NULL AUTO_INCREMENT,
  products_id int(11) NOT NULL DEFAULT '0',
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  last_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  expires_date datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_geo_zones;
CREATE TABLE lc_geo_zones (
  geo_zone_id int(11) NOT NULL AUTO_INCREMENT,
  geo_zone_name varchar(255) NOT NULL,
  geo_zone_description varchar(255) NOT NULL,
  last_modified datetime DEFAULT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (geo_zone_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_languages;
CREATE TABLE lc_languages (
  languages_id int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(5) NOT NULL,
  locale varchar(255) NOT NULL,
  `charset` varchar(32) NOT NULL,
  date_format_short varchar(32) NOT NULL,
  date_format_long varchar(32) NOT NULL,
  time_format varchar(32) NOT NULL,
  text_direction varchar(12) NOT NULL,
  currencies_id int(11) NOT NULL,
  numeric_separator_decimal varchar(12) NOT NULL,
  numeric_separator_thousands varchar(12) NOT NULL,
  parent_id int(11) DEFAULT NULL,
  sort_order int(11) DEFAULT NULL,
  PRIMARY KEY (languages_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_languages_definitions;
CREATE TABLE lc_languages_definitions (
  id int(11) NOT NULL AUTO_INCREMENT,
  languages_id int(11) NOT NULL,
  content_group varchar(255) NOT NULL,
  definition_key varchar(255) NOT NULL,
  definition_value text NOT NULL,
  PRIMARY KEY (id),
  KEY IDX_LANGUAGES_DEFINITIONS_LANGUAGES (languages_id),
  KEY IDX_LANGUAGES_DEFINITIONS (languages_id,content_group),
  KEY IDX_LANGUAGES_DEFINITIONS_GROUPS (content_group)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_manufacturers;
CREATE TABLE lc_manufacturers (
  manufacturers_id int(11) NOT NULL AUTO_INCREMENT,
  manufacturers_name varchar(255) NOT NULL,
  manufacturers_image varchar(255) DEFAULT NULL,
  date_added datetime DEFAULT NULL,
  last_modified datetime DEFAULT NULL,
  PRIMARY KEY (manufacturers_id),
  KEY IDX_MANUFACTURERS_NAME (manufacturers_name)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_manufacturers_info;
CREATE TABLE lc_manufacturers_info (
  manufacturers_id int(11) NOT NULL,
  languages_id int(11) NOT NULL,
  manufacturers_url varchar(255) NOT NULL,
  url_clicked int(11) NOT NULL DEFAULT '0',
  date_last_click datetime DEFAULT NULL,
  PRIMARY KEY (manufacturers_id,languages_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_newsletters;
CREATE TABLE lc_newsletters (
  newsletters_id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  content text NOT NULL,
  module varchar(255) NOT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_sent datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  locked int(11) DEFAULT NULL,
  PRIMARY KEY (newsletters_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_newsletters_log;
CREATE TABLE lc_newsletters_log (
  newsletters_id int(11) NOT NULL,
  email_address varchar(255) NOT NULL,
  date_sent datetime DEFAULT NULL,
  KEY IDX_NEWSLETTERS_LOG_NEWSLETTERS_ID (newsletters_id),
  KEY IDX_NEWSLETTERS_LOG_EMAIL_ADDRESS (email_address)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_orders;
CREATE TABLE lc_orders (
  orders_id int(11) NOT NULL AUTO_INCREMENT,
  customers_id int(11) NOT NULL,
  customers_name varchar(255) NOT NULL,
  customers_company varchar(255) DEFAULT NULL,
  customers_street_address varchar(255) NOT NULL,
  customers_suburb varchar(255) DEFAULT NULL,
  customers_city varchar(255) NOT NULL,
  customers_postcode varchar(255) NOT NULL,
  customers_state varchar(255) DEFAULT NULL,
  customers_state_code varchar(255) DEFAULT NULL,
  customers_country varchar(255) NOT NULL,
  customers_country_iso2 char(2) NOT NULL,
  customers_country_iso3 char(3) NOT NULL,
  customers_telephone varchar(255) NOT NULL,
  customers_email_address varchar(255) NOT NULL,
  customers_address_format varchar(255) NOT NULL,
  customers_ip_address varchar(15) DEFAULT NULL,
  delivery_name varchar(255) NOT NULL,
  delivery_company varchar(255) DEFAULT NULL,
  delivery_street_address varchar(255) NOT NULL,
  delivery_suburb varchar(255) DEFAULT NULL,
  delivery_city varchar(255) NOT NULL,
  delivery_postcode varchar(255) NOT NULL,
  delivery_state varchar(255) DEFAULT NULL,
  delivery_state_code varchar(255) DEFAULT NULL,
  delivery_country varchar(255) NOT NULL,
  delivery_country_iso2 char(2) NOT NULL,
  delivery_country_iso3 char(3) NOT NULL,
  delivery_address_format varchar(255) NOT NULL,
  billing_name varchar(255) NOT NULL,
  billing_company varchar(255) DEFAULT NULL,
  billing_street_address varchar(255) NOT NULL,
  billing_suburb varchar(255) DEFAULT NULL,
  billing_city varchar(255) NOT NULL,
  billing_postcode varchar(255) NOT NULL,
  billing_state varchar(255) DEFAULT NULL,
  billing_state_code varchar(255) DEFAULT NULL,
  billing_country varchar(255) NOT NULL,
  billing_country_iso2 char(2) NOT NULL,
  billing_country_iso3 char(3) NOT NULL,
  billing_address_format varchar(255) NOT NULL,
  payment_method varchar(512) NOT NULL,
  payment_module varchar(255) NOT NULL,
  last_modified datetime DEFAULT NULL,
  date_purchased datetime DEFAULT NULL,
  orders_status int(11) NOT NULL,
  orders_date_finished datetime DEFAULT NULL,
  currency char(3) DEFAULT NULL,
  currency_value decimal(14,6) DEFAULT NULL,
  PRIMARY KEY (orders_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_orders_products;
CREATE TABLE lc_orders_products (
  orders_products_id int(11) NOT NULL AUTO_INCREMENT,
  orders_id int(11) NOT NULL,
  products_id int(11) NOT NULL,
  products_model varchar(255) DEFAULT NULL,
  products_sku varchar(255) DEFAULT NULL,
  products_name varchar(255) NOT NULL,
  products_price decimal(15,4) NOT NULL DEFAULT '0.0000',
  products_tax decimal(7,4) NOT NULL DEFAULT '0.0000',
  products_quantity int(11) NOT NULL,
  products_simple_options_meta_data varchar(1024) DEFAULT NULL,
  PRIMARY KEY (orders_products_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_orders_products_download;
CREATE TABLE lc_orders_products_download (
  orders_products_download_id int(11) NOT NULL AUTO_INCREMENT,
  orders_id int(11) NOT NULL,
  orders_products_id int(11) NOT NULL,
  orders_products_filename varchar(255) NOT NULL,
  download_maxdays int(11) NOT NULL,
  download_count int(11) NOT NULL,
  PRIMARY KEY (orders_products_download_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_orders_products_variants;
CREATE TABLE lc_orders_products_variants (
  id int(11) NOT NULL AUTO_INCREMENT,
  orders_id int(11) NOT NULL,
  orders_products_id int(11) NOT NULL,
  group_title varchar(255) NOT NULL,
  value_title text NOT NULL,
  PRIMARY KEY (id),
  KEY idx_orders_products_variants_orders_products_ids (orders_id,orders_products_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_orders_status;
CREATE TABLE lc_orders_status (
  orders_status_id int(11) NOT NULL,
  language_id int(11) NOT NULL DEFAULT '1',
  orders_status_name varchar(255) NOT NULL,
  orders_status_type ENUM( 'Pending', 'Rejected', 'Approved' ) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (orders_status_id,language_id),
  KEY idx_orders_status_name (orders_status_name)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_orders_status_history;
CREATE TABLE lc_orders_status_history (
  orders_status_history_id int(11) NOT NULL AUTO_INCREMENT,
  orders_id int(11) NOT NULL,
  orders_status_id int(11) NOT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  customer_notified int(11) DEFAULT NULL,
  comments text,
  administrators_id int(11) NOT NULL DEFAULT '0',
  append_comment int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (orders_status_history_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_orders_total;
CREATE TABLE lc_orders_total (
  orders_total_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  orders_id int(11) NOT NULL,
  title varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  class varchar(255) NOT NULL,
  sort_order int(11) NOT NULL,
  PRIMARY KEY (orders_total_id),
  KEY idx_orders_total_orders_id (orders_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_orders_transactions_history;
CREATE TABLE lc_orders_transactions_history (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  orders_id int(10) unsigned NOT NULL,
  transaction_code int(11) NOT NULL,
  transaction_return_value text NOT NULL,
  transaction_return_status int(11) NOT NULL,
  date_added datetime DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_orders_transactions_history_orders_id (orders_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_orders_transactions_status;
CREATE TABLE lc_orders_transactions_status (
  id int(10) unsigned NOT NULL,
  language_id int(10) unsigned NOT NULL,
  status_name varchar(255) NOT NULL,
  PRIMARY KEY (id,language_id),
  KEY idx_orders_transactions_status_name (status_name)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_permalinks;
CREATE TABLE IF NOT EXISTS lc_permalinks (
  permalink_id int(11) NOT NULL AUTO_INCREMENT,
  item_id int(11) NOT NULL,
  language_id int(11) NOT NULL DEFAULT '1',
  `type` int(11) NOT NULL,
  query varchar(255) NOT NULL,
  permalink varchar(255) NOT NULL,
  PRIMARY KEY (permalink_id,permalink)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products;
CREATE TABLE lc_products (
  products_id int(11) NOT NULL AUTO_INCREMENT,
  parent_id int(11) NOT NULL DEFAULT '0',
  products_quantity int(11) NOT NULL DEFAULT '0',
  products_price decimal(15,4) NOT NULL DEFAULT '0.0000',
  products_cost decimal(15,4) NOT NULL DEFAULT '0.0000',
  products_msrp decimal(15,4) NOT NULL DEFAULT '0.0000',
  products_model varchar(255) DEFAULT NULL,
  products_sku varchar(255) DEFAULT NULL,
  products_date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  products_last_modified datetime DEFAULT NULL,
  products_weight decimal(5,2) NOT NULL DEFAULT '0.00',
  products_weight_class int(11) NOT NULL DEFAULT '0',
  products_status tinyint(1) NOT NULL DEFAULT '0',
  products_tax_class_id int(11) NOT NULL DEFAULT '0',
  manufacturers_id int(11) DEFAULT NULL,
  products_ordered int(11) NOT NULL DEFAULT '0',
  has_children int(11) DEFAULT NULL,
  is_subproduct TINYINT(1) NOT NULL DEFAULT '0',
  access_levels VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (products_id),
  KEY idx_products_date_added (products_date_added)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_description;
CREATE TABLE lc_products_description (
  products_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL DEFAULT '1',
  products_name varchar(255) NOT NULL,
  products_description text,
  products_keyword varchar(255) DEFAULT NULL,
  products_tags varchar(255) DEFAULT NULL,
  products_meta_title varchar(255) DEFAULT NULL,
  products_meta_keywords varchar(255) DEFAULT NULL,
  products_meta_description varchar(255) DEFAULT NULL,
  products_url varchar(255) DEFAULT NULL,
  products_viewed int(11) DEFAULT NULL,
  PRIMARY KEY (products_id,language_id),
  KEY products_name (products_name),
  KEY products_description_keyword (products_keyword)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_images;
CREATE TABLE lc_products_images (
  id int(11) NOT NULL AUTO_INCREMENT,
  products_id int(11) NOT NULL,
  image varchar(255) NOT NULL,
  default_flag tinyint(1) NOT NULL,
  sort_order int(11) NOT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (id),
  KEY products_images_products_id (products_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_images_groups;
CREATE TABLE lc_products_images_groups (
  id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  title varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  size_width int(11) DEFAULT NULL,
  size_height int(11) DEFAULT NULL,
  force_size tinyint(1) DEFAULT NULL,
  PRIMARY KEY (id,language_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_notifications;
CREATE TABLE lc_products_notifications (
  products_id int(11) NOT NULL,
  customers_id int(11) NOT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (products_id,customers_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_pricing;
CREATE TABLE lc_products_pricing (
  products_id int(11) NOT NULL,
  group_id int(11) NOT NULL,
  tax_class_id int(11) NOT NULL,
  qty_break int(11) NOT NULL,
  price_break decimal(13,4) NOT NULL DEFAULT '0.0000',
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY idx_products_pricing_group_id (group_id),
  KEY idx_products_pricing_products_id (products_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_simple_options;
CREATE TABLE lc_products_simple_options (
  id int(11) NOT NULL AUTO_INCREMENT,
  options_id int(11) NOT NULL,
  products_id int(11) NOT NULL,
  sort_order int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_simple_options_values;
CREATE TABLE lc_products_simple_options_values (
  id int(11) NOT NULL AUTO_INCREMENT,
  products_id int(11) NOT NULL,
  customers_group_id int(11) NOT NULL DEFAULT '1',
  values_id int(11) NOT NULL,
  options_id int(11) NOT NULL,
  sort_order int(11) NOT NULL DEFAULT '0',
  price_modifier decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (id),
  KEY idx_products_simple_options_values_customers_group_id (customers_group_id),
  KEY idx_products_simple_options_values_values_id (values_id),
  KEY idx_products_simple_options_values_options_id (options_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_to_categories;
CREATE TABLE lc_products_to_categories (
  products_id int(11) NOT NULL,
  categories_id int(11) NOT NULL,
  PRIMARY KEY (products_id,categories_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_variants;
CREATE TABLE lc_products_variants (
  products_id int(10) unsigned NOT NULL,
  products_variants_values_id int(10) unsigned NOT NULL,
  default_combo tinyint(3) unsigned DEFAULT NULL,
  default_visual int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (products_id,products_variants_values_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_variants_groups;
CREATE TABLE lc_products_variants_groups (
  id int(11) NOT NULL AUTO_INCREMENT,
  languages_id int(11) NOT NULL,
  title varchar(255) NOT NULL, 
  sort_order int(11) NOT NULL,
  module varchar(255) NOT NULL,
  PRIMARY KEY (id,languages_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_products_variants_values;
CREATE TABLE lc_products_variants_values (
  id int(11) NOT NULL AUTO_INCREMENT,
  languages_id int(11) NOT NULL,
  products_variants_groups_id int(11) NOT NULL,
  title varchar(255) NOT NULL,
  visual varchar(1024) DEFAULT NULL,
  sort_order int(11) NOT NULL,
  PRIMARY KEY (id,languages_id),
  KEY idx_products_variants_values_groups_id (products_variants_groups_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_product_attributes;
CREATE TABLE lc_product_attributes (
  id int(10) unsigned NOT NULL,
  products_id int(10) unsigned NOT NULL,
  languages_id int(10) unsigned NOT NULL,
  `value` text NOT NULL,
  KEY idx_pa_id_products_id (id,products_id),
  KEY idx_pa_languages_id (languages_id),
  KEY idx_pa_products_id (products_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_reviews;
CREATE TABLE lc_reviews (
  reviews_id int(11) NOT NULL AUTO_INCREMENT,
  products_id int(11) NOT NULL DEFAULT '0',
  customers_id int(11) DEFAULT NULL,
  customers_name varchar(255) NOT NULL,
  reviews_rating int(11) DEFAULT NULL,
  languages_id int(11) NOT NULL,
  reviews_text text NOT NULL,
  date_added datetime DEFAULT NULL,
  last_modified datetime DEFAULT NULL,
  reviews_read int(11) NOT NULL DEFAULT '0',
  reviews_status tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (reviews_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_sessions;
CREATE TABLE lc_sessions (
  id varchar(32) NOT NULL,
  expiry int(10) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_shipping_availability;
CREATE TABLE lc_shipping_availability (
  id int(10) unsigned NOT NULL,
  languages_id int(10) unsigned NOT NULL,
  title varchar(255) NOT NULL,
  css_key varchar(255) DEFAULT NULL,
  PRIMARY KEY (id,languages_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_shopping_carts;
CREATE TABLE lc_shopping_carts (
  customers_id int(10) unsigned NOT NULL,
  item_id smallint(5) unsigned NOT NULL,
  products_id int(10) unsigned NOT NULL,
  quantity smallint(5) unsigned NOT NULL,
  meta_data varchar(1024) DEFAULT NULL,
  date_added datetime DEFAULT NULL,
  KEY idx_sc_customers_id (customers_id),
  KEY idx_sc_customers_id_products_id (customers_id,products_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_shopping_carts_custom_variants_values;
CREATE TABLE lc_shopping_carts_custom_variants_values (
  shopping_carts_item_id smallint(5) unsigned NOT NULL,
  customers_id int(10) unsigned NOT NULL,
  products_id int(10) unsigned NOT NULL,
  products_variants_values_id int(10) unsigned NOT NULL,
  products_variants_values_text text NOT NULL,
  KEY idx_sccvv_customers_id_products_id (customers_id,products_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_specials;
CREATE TABLE lc_specials (
  specials_id int(11) NOT NULL AUTO_INCREMENT,
  products_id int(11) NOT NULL,
  specials_new_products_price decimal(15,4) NOT NULL DEFAULT '0.0000',
  specials_date_added datetime DEFAULT NULL,
  specials_last_modified datetime DEFAULT NULL,
  start_date datetime DEFAULT NULL,
  expires_date datetime DEFAULT NULL,
  date_status_change datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (specials_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_tax_class;
CREATE TABLE lc_tax_class (
  tax_class_id int(11) NOT NULL AUTO_INCREMENT,
  tax_class_title varchar(255) NOT NULL,
  tax_class_description varchar(255) NOT NULL,
  last_modified datetime DEFAULT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (tax_class_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_tax_rates;
CREATE TABLE lc_tax_rates (
  tax_rates_id int(11) NOT NULL AUTO_INCREMENT,
  tax_zone_id int(11) NOT NULL,
  tax_class_id int(11) NOT NULL,
  tax_priority int(11) DEFAULT '1',
  tax_rate decimal(7,4) NOT NULL DEFAULT '0.0000',
  tax_description varchar(255) NOT NULL,
  last_modified datetime DEFAULT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (tax_rates_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_templates;
CREATE TABLE lc_templates (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  author_name varchar(255) NOT NULL,
  author_www varchar(255) DEFAULT NULL,
  markup_version varchar(255) DEFAULT NULL,
  css_based tinyint(4) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_templates_boxes;
CREATE TABLE lc_templates_boxes (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  author_name varchar(255) NOT NULL,
  author_www varchar(255) DEFAULT NULL,
  modules_group varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_templates_boxes_to_pages;
CREATE TABLE lc_templates_boxes_to_pages (
  id int(11) NOT NULL AUTO_INCREMENT,
  templates_boxes_id int(11) NOT NULL,
  templates_id int(11) NOT NULL,
  content_page varchar(255) NOT NULL,
  boxes_group varchar(32) NOT NULL,
  sort_order int(11) DEFAULT NULL,
  page_specific int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY templates_boxes_id (templates_boxes_id,templates_id,content_page,boxes_group)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_updates_log;
CREATE TABLE lc_updates_log (
  id int(11) NOT NULL AUTO_INCREMENT,
  action varchar(32) NOT NULL DEFAULT '',
  result varchar(128) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  dateCreated datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_weight_classes;
CREATE TABLE lc_weight_classes (
  weight_class_id int(11) NOT NULL,
  weight_class_key varchar(4) NOT NULL,
  language_id int(11) NOT NULL,
  weight_class_title varchar(255) NOT NULL,
  PRIMARY KEY (weight_class_id,language_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_weight_classes_rules;
CREATE TABLE lc_weight_classes_rules (
  weight_class_from_id int(11) NOT NULL,
  weight_class_to_id int(11) NOT NULL,
  weight_class_rule decimal(15,4) NOT NULL DEFAULT '0.0000'
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_whos_online;
CREATE TABLE lc_whos_online (
  customer_id int(11) DEFAULT NULL,
  full_name varchar(255) NOT NULL,
  session_id varchar(128) NOT NULL,
  ip_address varchar(15) NOT NULL,
  time_entry varchar(14) NOT NULL,
  time_last_click varchar(14) NOT NULL,
  last_page_url text NOT NULL
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS lc_zones;
CREATE TABLE lc_zones (
  zone_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  zone_country_id int(10) unsigned NOT NULL,
  zone_code varchar(255) NOT NULL,
  zone_name varchar(255) NOT NULL,
  PRIMARY KEY (zone_id),
  KEY idx_zones_country_id (zone_country_id),
  KEY idx_zones_code (zone_code),
  KEY idx_zones_name (zone_name)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;


DROP TABLE IF EXISTS lc_zones_to_geo_zones;
CREATE TABLE lc_zones_to_geo_zones (
  association_id int(11) NOT NULL AUTO_INCREMENT,
  zone_country_id int(11) NOT NULL,
  zone_id int(11) DEFAULT NULL,
  geo_zone_id int(11) DEFAULT NULL,
  last_modified datetime DEFAULT NULL,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (association_id)
) ENGINE=MyISAM CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO lc_administrators_access (id, administrators_id, administrators_groups_id, module, level) VALUES(1, 1, 1, '*', 99);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'tools-error_log', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'tools-cache', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'tools-backup', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'tools-administrators_log', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-zone_groups', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-templates_modules_layout', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-templates_modules', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-templates', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-tax_classes', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-modules', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-languages', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-definitions', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-currencies', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-credit_cards', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-countries', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-configuration', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'settings-administrators', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'sales-orders', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'reports-whos_online', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'reports-statistics', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'products-specials', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'products-reviews', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'products-products_expected', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'products-products', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'products-product_variants', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'products-manufacturers', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'products-categories', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'marketing-newsletters', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'customers-customers', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'marketing-banner_manager', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'tools-updates', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'tools-server_info', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'tools-images', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 2, 'tools-file_manager', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-templates_modules', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-templates', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-tax_classes', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-modules', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-languages', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-definitions', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-currencies', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-credit_cards', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-countries', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-configuration', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-administrators', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'sales-orders', 3);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'reports-whos_online', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'reports-statistics', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'products-specials', 3);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'products-reviews', 3);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'products-products_expected', 3);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'products-products', 3);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'products-product_variants', 3);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'products-manufacturers', 3);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'products-categories', 3);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'marketing-newsletters', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'marketing-banner_manager', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'customers-customers', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'tools-updates', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'tools-server_info', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'tools-images', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'tools-file_manager', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'tools-error_log', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'tools-cache', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'tools-backup', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'tools-administrators_log', 4);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-zone_groups', 0);
INSERT INTO lc_administrators_access (administrators_id, administrators_groups_id, module, level) VALUES(0, 3, 'settings-templates_modules_layout', 0);

INSERT INTO lc_administrators_groups (id, `name`, date_added, last_modified) VALUES(1, 'Top Administrator', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO lc_administrators_groups (id, `name`, date_added, last_modified) VALUES(2, 'Customer Service', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO lc_administrators_groups (id, `name`, date_added, last_modified) VALUES(3, 'Support', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(1, 'Store Name', 'STORE_NAME', 'Loaded Commerce Demo Store', 'The name of my store', 1, 1, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(2, 'Store Owner', 'STORE_OWNER', 'Store Owner', 'The name of my store owner', 1, 2, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(3, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'noreply@mystore.com', 'The e-mail address of my store owner', 1, 3, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(4, 'E-Mail From', 'EMAIL_FROM', '"Store Owner" <noreply@mystore.com>', 'The e-mail address used in (sent) e-mails', 1, 4, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(5, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, now(), now(), 'lC_Address::getCountryName', 'lc_cfg_set_countries_pulldown_menu');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(6, 'Zone', 'STORE_ZONE', '4032', 'The zone my store is located in', 1, 7, '2012-03-31 15:47:38', now(), 'lC_Address::getZoneName', 'lc_cfg_set_zones_pulldown_menu');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(7, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(8, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', '1', 'Allow guests to tell a friend about a product', 1, 15, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(9, 'Store Address and Phone', 'STORE_NAME_ADDRESS', '123 Main St.\r\nAtlanta, GA 30324\r\n(404) 123-4567', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, now(), now(), NULL, 'lc_cfg_set_textarea_field');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(10, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '2', 'Pad the tax value this amount of decimal places', 1, 20, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(11, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', '-1', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(12, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '10', 'Minimum length of review text', 2, 14, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(13, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(14, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '15', 'Amount of products to list', 3, 2, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(15, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of ''number'' links use for page-sets', 3, 3, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(16, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(17, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '3', 'Maximum number of new products to display in new products page', 3, 14, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(18, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(19, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '50', 'The pixel width of heading images', 4, 3, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(20, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '', 'The pixel height of heading images', 4, 4, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(21, 'Image Required', 'IMAGE_REQUIRED', '1', 'Enable to display broken images. Good for development.', 4, 8, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(22, 'Gender', 'ACCOUNT_GENDER', '-1', 'Ask for or require the customers gender.', 5, 10, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, 0, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(23, 'First Name', 'ACCOUNT_FIRST_NAME', '2', 'Minimum requirement for the customers first name.', 5, 11, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(24, 'Last Name', 'ACCOUNT_LAST_NAME', '2', 'Minimum requirement for the customers last name.', 5, 12, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(25, 'Date Of Birth', 'ACCOUNT_DATE_OF_BIRTH', '-1', 'Ask for the customers date of birth.', 5, 13, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(26, 'E-Mail Address', 'ACCOUNT_EMAIL_ADDRESS', '6', 'Minimum requirement for the customers e-mail address.', 5, 14, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(27, 'Password', 'ACCOUNT_PASSWORD', '5', 'Minimum requirement for the customers password.', 5, 15, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(28, 'Newsletter', 'ACCOUNT_NEWSLETTER', '1', 'Ask for a newsletter subscription.', 5, 16, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(29, 'Company Name', 'ACCOUNT_COMPANY', '-1', 'Ask for or require the customers company name.', 5, 17, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(''10'', ''9'', ''8'', ''7'', ''6'', ''5'', ''4'', ''3'', ''2'', ''1'', 0, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(30, 'Street Address', 'ACCOUNT_STREET_ADDRESS', '5', 'Minimum requirement for the customers street address.', 5, 18, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(31, 'Suburb', 'ACCOUNT_SUBURB', '-1', 'Ask for or require the customers suburb.', 5, 19, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(''10'', ''9'', ''8'', ''7'', ''6'', ''5'', ''4'', ''3'', ''2'', ''1'', 0, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(32, 'Zip Code', 'ACCOUNT_POST_CODE', '0', 'Minimum requirement for the customers zip code.', 5, 20, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(-1, 0, ''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(33, 'City', 'ACCOUNT_CITY', '4', 'Minimum requirement for the customers city.', 5, 21, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9'', ''10''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(34, 'State', 'ACCOUNT_STATE', '2', 'Ask for or require the customers state.', 5, 22, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(''10'', ''9'', ''8'', ''7'', ''6'', ''5'', ''4'', ''3'', ''2'', ''1'', 0, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(35, 'Country', 'ACCOUNT_COUNTRY', '1', 'Ask for the customers country.', 5, 23, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(36, 'Telephone Number', 'ACCOUNT_TELEPHONE', '1', 'Ask for or require the customers telephone number.', 5, 24, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, 0, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(37, 'Fax Number', 'ACCOUNT_FAX', '-1', 'Ask for or require the customers fax number.', 5, 25, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(''10'', ''9'', ''8'', ''7'', ''6'', ''5'', ''4'', ''3'', ''2'', ''1'', 0, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(38, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(39, 'Default Language', 'DEFAULT_LANGUAGE', 'en_US', 'Default Language', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(40, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(41, 'Default Image Group', 'DEFAULT_IMAGE_GROUP_ID', '2', 'Default image group.', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(42, 'Default Template', 'DEFAULT_TEMPLATE', 'core', 'Default Template', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(43, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, now(), now(), 'lC_Address::getCountryName', 'lc_cfg_set_countries_pulldown_menu(class=\"select\",');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(44, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(45, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(46, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(47, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(48, 'Default Shipping Unit', 'SHIPPING_WEIGHT_UNIT', '4', 'Select the unit of weight to be used for shipping.', 7, 6, now(), now(), 'lC_Weight::getTitle', 'lc_cfg_set_weight_classes_pulldown_menu');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(49, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(50, 'Display Product Manufacturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(51, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(52, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(53, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(54, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(55, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(56, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(57, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(58, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(59, 'Check stock level', 'STOCK_CHECK', '-1', 'Check to see if sufficient stock is available', 9, 1, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(60, 'Subtract stock', 'STOCK_LIMITED', '1', 'Subtract product in stock by product orders', 9, 2, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(61, 'Autodisable out of stock product', 'AUTODISABLE_OUT_OF_STOCK_PRODUCT', '-1', 'Set product as IN-ACTIVE if there is insufficient stock that is 0 or below', 9, 3, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(62, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(63, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(64, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''sendmail'', ''smtp''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(65, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''LF'', ''CRLF''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(66, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', '-1', 'Send e-mails in HTML format', 12, 3, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(67, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', '-1', 'Verify e-mail address through a DNS server', 12, 4, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(68, 'Send E-Mails', 'SEND_EMAILS', '1', 'Send out e-mails', 12, 5, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(69, 'Enable download', 'DOWNLOAD_ENABLED', '-1', 'Enable the products download functions.', 13, 1, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(70, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', '-1', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(71, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, now(), now(), NULL, '');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(72, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, now(), now(), NULL, '');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(73, 'Confirm Terms and Conditions During Checkout Procedure', 'DISPLAY_CONDITIONS_ON_CHECKOUT', '-1', 'Show the Terms and Conditions during the checkout procedure which the customer must agree to.', 16, 1, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(74, 'Confirm Privacy Notice During Account Creation Procedure', 'DISPLAY_PRIVACY_CONDITIONS', '-1', 'Show the Privacy Notice during the account creation procedure which the customer must agree to.', 16, 2, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(75, 'Verify With Regular Expressions', 'CFG_CREDIT_CARDS_VERIFY_WITH_REGEXP', '1', 'Verify credit card numbers with server-side regular expression patterns.', 17, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(76, 'Verify With Javascript', 'CFG_CREDIT_CARDS_VERIFY_WITH_JS', '1', 'Verify credit card numbers with javascript based regular expression patterns.', 17, 1, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(77, 'GZIP', 'CFG_APP_GZIP', '/bin/gzip', 'The program location to gzip.', 18, 1, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(78, 'GUNZIP', 'CFG_APP_GUNZIP', '/bin/gunzip', 'The program location to gunzip.', 18, 2, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(79, 'ZIP', 'CFG_APP_ZIP', '/usr/bin/zip', 'The program location to zip.', 18, 3, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(80, 'UNZIP', 'CFG_APP_UNZIP', '/usr/bin/unzip', 'The program location to unzip.', 18, 4, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(81, 'cURL', 'CFG_APP_CURL', '/usr/bin/curl', 'The program location to cURL.', 18, 5, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(82, 'ImageMagick "convert"', 'CFG_APP_IMAGEMAGICK_CONVERT', '/usr/bin/convert', 'The program location to the ImageMagick "convert" to use when manipulating images.', 18, 6, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(83, 'Minimum List Size', 'BOX_BEST_SELLERS_MIN_LIST', '3', 'Minimum amount of products that must be shown in the listing', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(84, 'Maximum List Size', 'BOX_BEST_SELLERS_MAX_LIST', '10', 'Maximum amount of products to show in the listing', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(85, 'Cache Contents', 'BOX_BEST_SELLERS_CACHE', '60', 'Number of minutes to keep the contents cached (0 = no cache)', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(86, 'Manufacturers List Size', 'BOX_MANUFACTURERS_LIST_SIZE', '1', 'The size of the manufacturers pull down menu listing.', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(87, 'Random Review Selection', 'BOX_REVIEWS_RANDOM_SELECT', '10', 'Select a random review from this amount of the newest reviews available', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(88, 'Cache Contents', 'BOX_REVIEWS_CACHE', '1', 'Number of minutes to keep the contents cached (0 = no cache)', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(89, 'Random Product Specials Selection', 'BOX_SPECIALS_RANDOM_SELECT', '10', 'Select a random product on special from this amount of the newest products on specials available', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(90, 'Cache Contents', 'BOX_SPECIALS_CACHE', '1', 'Number of minutes to keep the contents cached (0 = no cache)', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(91, 'GZIP Compression Level', 'SERVICE_OUTPUT_COMPRESSION_GZIP_LEVEL', '5', 'Set the GZIP compression level to this value (0=min, 9=max).', 6, 0, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''0'', ''1'', ''2'', ''3'', ''4'', ''5'', ''6'', ''7'', ''8'', ''9''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(92, 'Session Expiration Time', 'SERVICE_SESSION_EXPIRATION_TIME', '160', 'The time (in minutes) to keep sessions active for.', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(93, 'Force Cookie Usage', 'SERVICE_SESSION_FORCE_COOKIE_USAGE', '-1', 'Only start a session when cookies are enabled.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(94, 'Block Search Engine Spiders', 'SERVICE_SESSION_BLOCK_SPIDERS', '-1', 'Block search engine spider robots from starting a session.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(95, 'Check SSL Session ID', 'SERVICE_SESSION_CHECK_SSL_SESSION_ID', '-1', 'Check the SSL_SESSION_ID on every secure HTTPS page request.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(96, 'Check User Agent', 'SERVICE_SESSION_CHECK_USER_AGENT', '-1', 'Check the browser user agent on every page request.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(97, 'Check IP Address', 'SERVICE_SESSION_CHECK_IP_ADDRESS', '-1', 'Check the IP address on every page request.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(98, 'Regenerate Session ID', 'SERVICE_SESSION_REGENERATE_ID', '-1', 'Regenerate the session ID when a customer logs on or creates an account.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(99, 'Use Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', '-1', 'Automatically use the currency set with the language (eg, German->Euro).', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(100, 'Calculate Number Of Products In Each Category', 'SERVICES_CATEGORY_PATH_CALCULATE_PRODUCT_COUNT', '1', 'Recursively calculate how many products are in each category.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(101, 'Detect Search Engine Spider Robots', 'SERVICE_WHOS_ONLINE_SPIDER_DETECTION', '1', 'Detect search engine spider robots (GoogleBot, Yahoo, etc).', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(102, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(103, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(104, 'Review Level', 'SERVICE_REVIEW_ENABLE_REVIEWS', '0', 'Customer level required to write a review.', 6, 0, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''0'', ''1'', ''2''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(105, 'Moderate Reviews', 'SERVICE_REVIEW_ENABLE_MODERATION', '-1', 'Should reviews be approved by store admin.', 6, 0, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''-1'', ''0'', ''1''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(106, 'Display latest products', 'SERVICE_RECENTLY_VISITED_SHOW_PRODUCTS', '1', 'Display recently visited products.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(107, 'Display product images', 'SERVICE_RECENTLY_VISITED_SHOW_PRODUCT_IMAGES', '1', 'Display the product image.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(108, 'Display product prices', 'SERVICE_RECENTLY_VISITED_SHOW_PRODUCT_PRICES', '-1', 'Display the products price.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(109, 'Maximum products to show', 'SERVICE_RECENTLY_VISITED_MAX_PRODUCTS', '6', 'Maximum number of recently visited products to show', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(110, 'Display latest categories', 'SERVICE_RECENTLY_VISITED_SHOW_CATEGORIES', '1', 'Display recently visited categories.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(111, 'Maximum categories to show', 'SERVICE_RECENTLY_VISITED_MAX_CATEGORIES', '3', 'Maximum number of recently visited categories to show', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(112, 'Display latest searches', 'SERVICE_RECENTLY_VISITED_SHOW_SEARCHES', '1', 'Show recent searches.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(113, 'Maximum searches to show', 'SERVICE_RECENTLY_VISITED_MAX_SEARCHES', '3', 'Maximum number of recent searches to display', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(114, 'Service Modules', 'MODULE_SERVICES_INSTALLED', 'output_compression;session;language;breadcrumb;currencies;core;whos_online;simple_counter;category_path;recently_visited;specials;reviews;banner;coupons', 'Installed services modules', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(115, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''true'', ''false''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(116, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '100', 'Sort order of display.', 6, 2, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(117, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''true'', ''false''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(118, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '200', 'Sort order of display.', 6, 2, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(119, 'Max Pages Display on mainpage', 'MAX_DISPLAY_CMS_ARTICLES', '5', 'Maximum number of Pages listings to display on mainpage', 3, 10, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(120, 'Max Page Links to Display', 'BOX_CMS_LIST_SIZE', '10', 'Maximum number of Page Links to display in the infobox', 3, 11, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(121, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''true'', ''false''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(122, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '600', 'Sort order of display.', 6, 2, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(123, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''true'', ''false''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(124, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '500', 'Sort order of display.', 6, 2, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(125, 'Tag Cloud Maximum Listings', 'TAG_CLOUD_MAX_LIST', '6', 'The number of links to display in the tag cloud box.', 3, 99, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(126, 'Tag Cloud Font Size Setting', 'TAG_CLOUD_FONT_SIZE', '10,24', 'The low and high number of the font size to use for the link display in the tag cloud box, sperated by a comma.', 3, 98, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(127, 'Pricing Decimal Places', 'DECIMAL_PLACES', '2', 'Pad the pricing values this amount of decimal places', 1, 20, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(128, 'Default Customers Group ID', 'DEFAULT_CUSTOMERS_GROUP_ID', '1', 'Default Customers Group ID', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(129, 'Maximum List Size', 'BOX_ORDER_HISTORY_MAX_LIST', '5', 'Maximum amount of products to show in the listing', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(130, 'Display Duplicate Banners', 'SERVICE_BANNER_SHOW_DUPLICATE', '-1', 'Show duplicate banners in the same banner group on the same page?', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(131, 'Show Product Count', 'BOX_CATEGORIES_FLYOUTSHOW_PRODUCT_COUNT', '1', 'Show the amount of products each category has', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(132, 'Show Product Count', 'BOX_QUICK_SHOP_SHOW_PRODUCT_COUNT', '-1', 'Show the amount of products each category has', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(133, 'Show Product Count', 'BOX_CATEGORIES_SHOW_PRODUCT_COUNT', '-1', 'Show the amount of products each category has', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(134, 'Default GeoIP Module', 'MODULE_DEFAULT_GEOIP', 'maxmind_geolite_country', 'Default GeoIP module.', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(135, 'Page Execution Time Log File', 'SERVICE_DEBUG_EXECUTION_TIME_LOG', '', 'Location of the page execution time log file (eg, /www/log/page_parse.log).', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(136, 'Show The Page Execution Time', 'SERVICE_DEBUG_EXECUTION_DISPLAY', '1', 'Show the page execution time.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(137, 'Check Sessions Auto Start', 'SERVICE_DEBUG_CHECK_SESSION_AUTOSTART', '1', 'Show a warning if PHP is configured to automatically start sessions.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(138, 'Check Download Directory', 'SERVICE_DEBUG_CHECK_DOWNLOAD_DIRECTORY', '1', 'Show a warning if the digital product download directory does not exist.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(139, 'Cache Contents', 'MODULE_CONTENT_NEW_PRODUCTS_CACHE', '60', 'Number of minutes to keep the contents cached (0 = no cache)', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(140, 'Minimum Entries To Display', 'MODULE_CONTENT_ALSO_PURCHASED_MIN_DISPLAY', '1', 'Minimum number of also purchased products to display', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(141, 'Maximum Entries To Display', 'MODULE_CONTENT_ALSO_PURCHASED_MAX_DISPLAY', '8', 'Maximum number of also purchased products to display', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(142, 'Cache Contents', 'MODULE_CONTENT_ALSO_PURCHASED_PRODUCTS_CACHE', '60', 'Number of minutes to keep the contents cached (0 = no cache)', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(143, 'Maximum Entries To Display', 'MODULE_CONTENT_UPCOMING_PRODUCTS_MAX_DISPLAY', '10', 'Maximum number of upcoming products to display', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(144, 'Cache Contents', 'MODULE_CONTENT_UPCOMING_PRODUCTS_CACHE', '1440', 'Number of minutes to keep the contents cached (0 = no cache)', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(145, 'Display Category Images', 'SERVICE_RECENTLY_VISITED_SHOW_CATEGORY_IMAGES', '1', 'Display the category image.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(146, 'Show Product Count', 'BOX_QUICK_SHOP_SHOW_PRODUCT_COUNT', '1', 'Show the amount of products each category has', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(147, 'Manufacturers List Size', 'BOX_MANUFACTURERS_LIST_SIZE', '1', 'The size of the manufacturers pull down menu listing.', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(148, 'Last Database Restore', 'DB_LAST_RESTORE', '', 'Last database restore file', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(149, 'Down for Maintenance', 'STORE_DOWN_FOR_MAINTENANCE', '-1', 'Set the store to maintenance mode.', 1, 22, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(150, 'Log Database Queries', 'SERVICE_DEBUG_LOG_DB_QUERIES', '-1', 'Log all database queries in the page execution time log file.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(151, 'Show Database Queries', 'SERVICE_DEBUG_OUTPUT_DB_QUERIES', '-1', 'Show all database queries made.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(152, 'Check Language Locale', 'SERVICE_DEBUG_CHECK_LOCALE', '1', 'Show a warning message if the set language locale does not exist on the server.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(153, 'Check Installation Module', 'SERVICE_DEBUG_CHECK_INSTALLATION_MODULE', '1', 'Show a warning message if the installation module exists.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(154, 'Check Configuration File', 'SERVICE_DEBUG_CHECK_CONFIGURATION', '1', 'Show a warning if the configuration file is writeable.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(155, 'Check Sessions Directory', 'SERVICE_DEBUG_CHECK_SESSION_DIRECTORY', '1', 'Show a warning if the file-based session directory does not exist.', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(156, 'Maximum Entries To Display', 'MODULE_CONTENT_NEW_PRODUCTS_MAX_DISPLAY', '6', 'Maximum number of new products to display', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(157, 'Suppress Non-Mobile Payment Modules', 'CHECKOUT_SUPRESS_NON_MOBILE_PAYMENT_MODULES', '-1', 'Suppress non-mobile payment modules in catalog when being viewed in mobile format.', 19, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(158, 'Enable CKEditor (Global)', 'ENABLE_EDITOR', '1', 'Enable or Disable Editor Globally', 20, 1, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(159, 'Use Default Template Stylesheet', 'USE_DEFAULT_TEMPLATE_STYLESHEET', '-1', 'Use Default Template Stylesheet', 20, 2, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(160, 'Display Coupon', 'MODULE_ORDER_TOTAL_COUPON_STATUS', 'true', 'Do you want to dusplay the coupon discount total on the checkout pages?', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(''true'', ''false''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(161, 'Sort Order', 'MODULE_ORDER_TOTAL_COUPON_SORT_ORDER', '300', 'Sort order of the display.', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(162, 'Redeem On Cart Page?', 'SERVICE_COUPONS_DISPLAY_ON_CART_PAGE', '1', 'Display the coupons redemption form on the shopping cart page?', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(163, 'Redeem On Shipping Page?', 'SERVICE_COUPONS_DISPLAY_ON_SHIPPING_PAGE', '1', 'Display the coupons redemption form on the checkout shipping page?', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(164, 'Redeem On Payment Page?', 'SERVICE_COUPONS_DISPLAY_ON_PAYMENT_PAGE', '1', 'Display the coupons redemption form on the checkout payment page?', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(165, 'Redeem On Confirmation Page?', 'SERVICE_COUPONS_DISPLAY_ON_CONFIRMATION_PAGE', '1', 'Display the coupons redemption form on the checkout confirmation page?', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(166, 'cURL Proxy Host Name', 'CURL_PROXY_HOST', '', 'If you are required to use a cURL proxy, enter the host name here.', 21, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(167, 'cURL Proxy Username', 'CURL_PROXY_USER', '', 'If your proxy requires a username, enter it here.', 21, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(168, 'cURL Proxy Password', 'CURL_PROXY_PASSWORD', '', 'If your proxy requires a password, enter it here.', 21, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(169, 'cURL Proxy Port', 'CURL_PROXY_PORT', '', 'If your proxy requires a specific port, enter it here.', 21, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(170, 'Cache Contents', 'BOX_WHATS_NEW_CACHE', '1', 'Number of minutes to keep the contents cached (0 = no cache)', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(171, 'Random New Product Selection', 'BOX_WHATS_NEW_RANDOM_SELECT', '10', 'Select a random new product from this amount of the newest products available', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(172, 'Disable Add to Cart for out of stock products', 'DISABLE_ADD_TO_CART', '-1', 'Disabled the add to cart button on the product page displays text that product is out of stock', 9, 3, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(173, 'Product Description Editor Configuration', 'EDITOR_CONFIGURATION_PRODUCT', 'Minimum', 'Set Product description editor configuration.', 20, 3, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''Off'',''Minimum'', ''Standard'',''Full''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(174, 'Category Description Editor Configuration', 'EDITOR_CONFIGURATION_CATEGORY', 'Full', 'Set Category description editor configuration.', 20, 4, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''Off'',''Minimum'', ''Standard'',''Full''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(175, 'Home Page Editor Configuration', 'EDITOR_CONFIGURATION_HOMEPAGE', 'Full', 'Set Home Page editor configuration.', 20, 5, now(), now(), NULL, 'lc_cfg_set_boolean_value(array(''Off'',''Minimum'', ''Standard'',''Full''))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(176, 'Uploadcare Public Key', 'EDITOR_UPLOADCARE_PUBLIC_KEY', '', 'Add your Uploadcare public key. <a href="https://uploadcare.com/accounts/settings/" target="_blank">Get your Uploadcare Public Key</a>', 20, 6, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(177, 'Maximum Entries To Display', 'MODULE_CONTENT_FEATURED_PRODUCTS_MAX_DISPLAY', '10', 'Maximum number of featured products to display', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(178, 'Cache Contents', 'MODULE_CONTENT_FEATURED_PRODUCTS_CACHE', '1440', 'Number of minutes to keep the contents cached (0 = no cache)', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(179, 'Top Information Category', 'BOX_INFORMATION_PAGES_ROOT_CATEGORY', 2, 'Select the Top Category of the Information Pages Infobox', 6, 0, now(), now(), 'lc_cfg_set_info_pages_top_category(BOX_INFORMATION_PAGES_ROOT_CATEGORY)', 'lc_cfg_set_info_pages_top_category');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(180, 'Session Lifetime', 'SESSION_LIFETIME', 3600, 'The amount of time a user is logged in for after the last action.', 10, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(181, 'Force Cookie Use', 'SESSION_FORCE_COOKIES', -1, 'Force the use cookies to handle sessions.', 10, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES(182, 'Maximum New Products Per Page', 'NEW_PRODUCTS_PER_PAGE_DISPLAY', '9', 'Maximum number of new products to display in listing', 3, 20, now(), now(), NULL, NULL);

INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(1, 'My Store', 'General information about my store', 1, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(2, 'Minimum Values', 'The minimum values for functions / data', 2, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(3, 'Maximum Values', 'The maximum values for functions / data', 3, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(4, 'Images', 'Image parameters', 4, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(5, 'Customer Details', 'Customer account configuration', 5, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(6, 'Module Options', 'Hidden from configuration', 6, 0);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(8, 'Product Listing', 'Product Listing    configuration options', 8, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(9, 'Stock', 'Stock configuration options', 9, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(10, 'Sessions', 'Session configuration options', 10, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(12, 'E-Mail Options', 'General setting for E-Mail transport and HTML E-Mails', 12, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(13, 'Download', 'Downloadable products options', 13, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(16, 'Regulations', 'Regulation options', 16, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(17, 'Credit Cards', 'Credit card options', 17, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(18, 'Program Locations', 'Locations to certain programs on the server.', 18, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(19, 'Checkout', 'Checkout settings', 19, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(20, 'Editor', 'Editor settings', 20, 1);
INSERT INTO lc_configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES(21, 'cURL Proxy', 'cURL proxy configuration setttings.', 21, 1);

INSERT INTO lc_countries VALUES (1,'Afghanistan','AF','AFG','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BDS','?? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BDG','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BGL','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BAL','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'BAM','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'DAY','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'FRA','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'FYB','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'GHA','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'GHO','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'HEL','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'HER','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'JOW','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KAB','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KAN','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KAP','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KHO','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KNR','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'KDZ','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'LAG','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'LOW','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'NAN','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'NIM','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'NUR','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'ORU','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'PIA','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'PKA','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'PAN','??? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'PAR','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'SAM','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'SAR','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'TAK','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'WAR','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (1,'ZAB','????');

INSERT INTO lc_countries VALUES (2,'Albania','AL','ALB','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'BR','Beratit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'BU','Bulqiz�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'DI','Dibr�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'DL','Delvin�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'DR','Durr�sit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'DV','Devollit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'EL','Elbasanit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'ER','Kolonj�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'FR','Fierit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'GJ','Gjirokastr�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'GR','Gramshit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'HA','Hasit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KA','Kavaj�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KB','Kurbinit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KC','Ku�ov�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KO','Kor��s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KR','Kruj�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'KU','Kuk�sit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'LB','Librazhdit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'LE','Lezh�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'LU','Lushnj�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'MK','Mallakastr�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'MM','Mal�sis� s� Madhe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'MR','Mirdit�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'MT','Matit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'PG','Pogradecit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'PQ','Peqinit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'PR','P�rmetit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'PU','Puk�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'SH','Shkodr�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'SK','Skraparit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'SR','Sarand�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'TE','Tepelen�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'TP','Tropoj�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'TR','Tiran�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (2,'VL','Vlor�s');

INSERT INTO lc_countries VALUES (3,'Algeria','DZ','DZA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'01','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'02','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'03','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'04','????? ?? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'05','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'06','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'07','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'08','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'09','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'10','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'11','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'12','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'13','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'14','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'15','???? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'16','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'17','????? ??? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'18','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'19','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'20','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'21','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'22','????? ???? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'23','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'24','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'25','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'26','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'27','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'28','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'29','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'30','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'31','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'32','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'33','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'34','????? ??? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'35','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'36','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'37','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'38','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'39','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'40','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'41','????? ??? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'42','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'43','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'44','????? ??? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'45','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'46','????? ??? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'47','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (3,'48','????? ??????');

INSERT INTO lc_countries VALUES (4,'American Samoa','AS','ASM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'EA','Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'MA','Manu\'a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'RI','Rose Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'SI','Swains Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (4,'WE','Western');

INSERT INTO lc_countries VALUES (5,'Andorra','AD','AND','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'AN','Andorra la Vella');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'CA','Canillo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'EN','Encamp');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'LE','Escaldes-Engordany');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'LM','La Massana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'OR','Ordino');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (5,'SJ','Sant Juli� de L�ria');

INSERT INTO lc_countries VALUES (6,'Angola','AO','AGO','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'BGO','Bengo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'BGU','Benguela');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'BIE','Bi�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CAB','Cabinda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CCU','Cuando Cubango');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CNO','Cuanza Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CUS','Cuanza Sul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'CNN','Cunene');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'HUA','Huambo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'HUI','Hu�la');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'LUA','Luanda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'LNO','Lunda Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'LSU','Lunda Sul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'MAL','Malanje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'MOX','Moxico');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'NAM','Namibe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'UIG','U�ge');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (6,'ZAI','Zaire');

INSERT INTO lc_countries VALUES (7,'Anguilla','AI','AIA','');
INSERT INTO lc_countries VALUES (8,'Antarctica','AQ','ATA','');

INSERT INTO lc_countries VALUES (9,'Antigua and Barbuda','AG','ATG','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'BAR','Barbuda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SGE','Saint George');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SJO','Saint John');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SMA','Saint Mary');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SPA','Saint Paul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SPE','Saint Peter');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (9,'SPH','Saint Philip');

INSERT INTO lc_countries VALUES (10,'Argentina','AR','ARG',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'A','Salta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'B','Buenos Aires Province');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'C','Capital Federal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'D','San Luis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'E','Entre R�os');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'F','La Rioja');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'G','Santiago del Estero');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'H','Chaco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'J','San Juan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'K','Catamarca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'L','La Pampa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'M','Mendoza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'N','Misiones');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'P','Formosa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'Q','Neuqu�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'R','R�o Negro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'S','Santa Fe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'T','Tucum�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'U','Chubut');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'V','Tierra del Fuego');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'W','Corrientes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'X','C�rdoba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'Y','Jujuy');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (10,'Z','Santa Cruz');

INSERT INTO lc_countries VALUES (11,'Armenia','AM','ARM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'AG','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'AR','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'AV','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'ER','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'GR','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'KT','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'LO','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'SH','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'SU','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'TV','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (11,'VD','????? ???');

INSERT INTO lc_countries VALUES (12,'Aruba','AW','ABW','');

INSERT INTO lc_countries VALUES (13,'Australia','AU','AUS',":name\n:street_address\n:suburb :state_code :postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'ACT','Australian Capital Territory');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'NSW','New South Wales');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'NT','Northern Territory');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'QLD','Queensland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'SA','South Australia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'TAS','Tasmania');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'VIC','Victoria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (13,'WA','Western Australia');

INSERT INTO lc_countries VALUES (14,'Austria','AT','AUT',":name\n:street_address\nA-:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'1','Burgenland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'2','K�rnten');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'3','Nieder�sterreich');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'4','Ober�sterreich');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'5','Salzburg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'6','Steiermark');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'7','Tirol');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'8','Voralberg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (14,'9','Wien');

INSERT INTO lc_countries VALUES (15,'Azerbaijan','AZ','AZE','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AB','?li Bayramli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ABS','Abseron');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGC','Agcab?di');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGM','Agdam');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGS','Agdas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGA','Agstafa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AGU','Agsu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'AST','Astara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BA','Baki');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BAB','Bab?k');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BAL','Balak?n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BAR','B?rd?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BEY','Beyl?qan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'BIL','Bil?suvar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'CAB','C?brayil');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'CAL','C?lilabab');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'CUL','Julfa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'DAS','Dask?s?n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'DAV','D?v?�i');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'FUZ','F�zuli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'GA','G?nc?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'GAD','G?d?b?y');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'GOR','Goranboy');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'GOY','G�y�ay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'HAC','Haciqabul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'IMI','Imisli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ISM','Ismayilli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'KAL','K?lb?c?r');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'KUR','K�rd?mir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'LA','L?nk?ran');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'LAC','La�in');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'LAN','L?nk?ran');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'LER','Lerik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'MAS','Masalli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'MI','Ming?�evir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'NA','Naftalan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'NEF','Neft�ala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'OGU','Oguz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ORD','Ordubad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QAB','Q?b?l?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QAX','Qax');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QAZ','Qazax');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QOB','Qobustan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QBA','Quba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QBI','Qubadli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'QUS','Qusar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SA','S?ki');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAT','Saatli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAB','Sabirabad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAD','S?d?r?k');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAH','Sahbuz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAK','S?ki');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAL','Salyan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SM','Sumqayit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SMI','Samaxi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SKR','S?mkir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SMX','Samux');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SAR','S?rur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SIY','Siy?z?n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SS','Susa (City)');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'SUS','Susa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'TAR','T?rt?r');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'TOV','Tovuz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'UCA','Ucar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XA','Xank?ndi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XAC','Xa�maz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XAN','Xanlar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XIZ','Xizi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XCI','Xocali');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'XVD','Xocav?nd');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'YAR','Yardimli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'YE','Yevlax (City)');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'YEV','Yevlax');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ZAN','Z?ngilan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ZAQ','Zaqatala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'ZAR','Z?rdab');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (15,'NX','Nakhichevan');

INSERT INTO lc_countries VALUES (16,'Bahamas','BS','BHS','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'AC','Acklins and Crooked Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'BI','Bimini');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'CI','Cat Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'EX','Exuma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'FR','Freeport');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'FC','Fresh Creek');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'GH','Governor\'s Harbour');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'GT','Green Turtle Cay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'HI','Harbour Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'HR','High Rock');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'IN','Inagua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'KB','Kemps Bay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'LI','Long Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'MH','Marsh Harbour');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'MA','Mayaguana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'NP','New Providence');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'NT','Nicholls Town and Berry Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'RI','Ragged Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'RS','Rock Sound');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'SS','San Salvador and Rum Cay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (16,'SP','Sandy Point');

INSERT INTO lc_countries VALUES (17,'Bahrain','BH','BHR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'01','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'02','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'03','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'04','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'05','??????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'06','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'07','??????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'08','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'09','?????? ???????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'10','??????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'11','??? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (17,'12','????? ???');

INSERT INTO lc_countries VALUES (18,'Bangladesh','BD','BGD','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'01','Bandarban');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'02','Barguna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'03','Bogra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'04','Brahmanbaria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'05','Bagerhat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'06','Barisal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'07','Bhola');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'08','Comilla');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'09','Chandpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'10','Chittagong');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'11','Cox\'s Bazar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'12','Chuadanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'13','Dhaka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'14','Dinajpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'15','Faridpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'16','Feni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'17','Gopalganj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'18','Gazipur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'19','Gaibandha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'20','Habiganj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'21','Jamalpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'22','Jessore');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'23','Jhenaidah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'24','Jaipurhat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'25','Jhalakati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'26','Kishoreganj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'27','Khulna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'28','Kurigram');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'29','Khagrachari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'30','Kushtia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'31','Lakshmipur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'32','Lalmonirhat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'33','Manikganj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'34','Mymensingh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'35','Munshiganj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'36','Madaripur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'37','Magura');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'38','Moulvibazar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'39','Meherpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'40','Narayanganj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'41','Netrakona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'42','Narsingdi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'43','Narail');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'44','Natore');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'45','Nawabganj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'46','Nilphamari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'47','Noakhali');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'48','Naogaon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'49','Pabna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'50','Pirojpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'51','Patuakhali');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'52','Panchagarh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'53','Rajbari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'54','Rajshahi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'55','Rangpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'56','Rangamati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'57','Sherpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'58','Satkhira');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'59','Sirajganj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'60','Sylhet');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'61','Sunamganj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'62','Shariatpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'63','Tangail');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (18,'64','Thakurgaon');

INSERT INTO lc_countries VALUES (19,'Barbados','BB','BRB','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'A','Saint Andrew');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'C','Christ Church');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'E','Saint Peter');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'G','Saint George');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'J','Saint John');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'L','Saint Lucy');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'M','Saint Michael');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'O','Saint Joseph');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'P','Saint Philip');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'S','Saint James');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (19,'T','Saint Thomas');

INSERT INTO lc_countries VALUES (20,'Belarus','BY','BLR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'BR','???�????? ??�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'HO','??�???????? ??�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'HR','???�???????? ??�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'MA','??????????? ??�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'MI','??�????? ??�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (20,'VI','??�??????? ??�??????');

INSERT INTO lc_countries VALUES (21,'Belgium','BE','BEL',":name\n:street_address\nB-:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'BRU','Brussel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VAN','Antwerpen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VBR','Vlaams-Brabant');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VLI','Limburg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VOV','Oost-Vlaanderen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'VWV','West-Vlaanderen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WBR','Brabant Wallon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WHT','Hainaut');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WLG','Li�ge/L�ttich');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WLX','Luxembourg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (21,'WNA','Namur');

INSERT INTO lc_countries VALUES (22,'Belize','BZ','BLZ','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'BZ','Belize District');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'CY','Cayo District');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'CZL','Corozal District');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'OW','Orange Walk District');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'SC','Stann Creek District');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (22,'TOL','Toledo District');

INSERT INTO lc_countries VALUES (23,'Benin','BJ','BEN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'AL','Alibori');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'AK','Atakora');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'AQ','Atlantique');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'BO','Borgou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'CO','Collines');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'DO','Donga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'KO','Kouffo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'LI','Littoral');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'MO','Mono');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'OU','Ou�m�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'PL','Plateau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (23,'ZO','Zou');

INSERT INTO lc_countries VALUES (24,'Bermuda','BM','BMU','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'DEV','Devonshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'HA','Hamilton City');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'HAM','Hamilton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'PAG','Paget');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'PEM','Pembroke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SAN','Sandys');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SG','Saint George City');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SGE','Saint George\'s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SMI','Smiths');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'SOU','Southampton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (24,'WAR','Warwick');

INSERT INTO lc_countries VALUES (25,'Bhutan','BT','BTN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'11','Paro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'12','Chukha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'13','Haa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'14','Samtse');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'15','Thimphu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'21','Tsirang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'22','Dagana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'23','Punakha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'24','Wangdue Phodrang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'31','Sarpang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'32','Trongsa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'33','Bumthang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'34','Zhemgang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'41','Trashigang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'42','Mongar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'43','Pemagatshel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'44','Luentse');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'45','Samdrup Jongkhar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'GA','Gasa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (25,'TY','Trashiyangse');

INSERT INTO lc_countries VALUES (26,'Bolivia','BO','BOL','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'B','El Beni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'C','Cochabamba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'H','Chuquisaca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'L','La Paz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'N','Pando');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'O','Oruro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'P','Potos�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'S','Santa Cruz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (26,'T','Tarija');

INSERT INTO lc_countries VALUES (27,'Bosnia and Herzegowina','BA','BIH','');
INSERT INTO lc_countries VALUES (28,'Botswana','BW','BWA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'CE','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'GH','Ghanzi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'KG','Kgalagadi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'KL','Kgatleng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'KW','Kweneng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'NE','North-East');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'NW','North-West');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'SE','South-East');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (28,'SO','Southern');

INSERT INTO lc_countries VALUES (29,'Bouvet Island','BV','BVT','');

INSERT INTO lc_countries VALUES (30,'Brazil','BR','BRA',":name\n:street_address\n:state\n:postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'AC','Acre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'AL','Alagoas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'AM','Amaz�nia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'AP','Amap�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'BA','Bahia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'CE','Cear�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'DF','Distrito Federal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'ES','Esp�rito Santo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'GO','Goi�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'MA','Maranh�o');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'MG','Minas Gerais');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'MS','Mato Grosso do Sul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'MT','Mato Grosso');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PA','Par�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PB','Para�ba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PE','Pernambuco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PI','Piau�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'PR','Paran�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RJ','Rio de Janeiro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RN','Rio Grande do Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RO','Rond�nia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RR','Roraima');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'RS','Rio Grande do Sul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'SC','Santa Catarina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'SE','Sergipe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'SP','S�o Paulo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (30,'TO','Tocantins');

INSERT INTO lc_countries VALUES (31,'British Indian Ocean Territory','IO','IOT','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'PB','Peros Banhos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'SI','Salomon Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'NI','Nelsons Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'TB','Three Brothers');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'EA','Eagle Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'DI','Danger Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'EG','Egmont Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (31,'DG','Diego Garcia');

INSERT INTO lc_countries VALUES (32,'Brunei Darussalam','BN','BRN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (32,'BE','Belait');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (32,'BM','Brunei-Muara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (32,'TE','Temburong');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (32,'TU','Tutong');

INSERT INTO lc_countries VALUES (33,'Bulgaria','BG','BGR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'01','Blagoevgrad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'02','Burgas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'03','Varna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'04','Veliko Tarnovo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'05','Vidin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'06','Vratsa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'07','Gabrovo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'08','Dobrich');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'09','Kardzhali');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'10','Kyustendil');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'11','Lovech');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'12','Montana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'13','Pazardzhik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'14','Pernik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'15','Pleven');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'16','Plovdiv');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'17','Razgrad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'18','Ruse');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'19','Silistra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'20','Sliven');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'21','Smolyan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'23','Sofia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'22','Sofia Province');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'24','Stara Zagora');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'25','Targovishte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'26','Haskovo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'27','Shumen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (33,'28','Yambol');

INSERT INTO lc_countries VALUES (34,'Burkina Faso','BF','BFA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BAL','Bal�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BAM','Bam');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BAN','Banwa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BAZ','Baz�ga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BGR','Bougouriba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BLG','Boulgou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'BLK','Boulkiemd�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'COM','Komo�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'GAN','Ganzourgou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'GNA','Gnagna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'GOU','Gourma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'HOU','Houet');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'IOB','Ioba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KAD','Kadiogo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KEN','K�n�dougou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KMD','Komondjari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KMP','Kompienga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KOP','Koulp�logo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KOS','Kossi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KOT','Kouritenga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'KOW','Kourw�ogo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'LER','L�raba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'LOR','Loroum');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'MOU','Mouhoun');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'NAM','Namentenga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'NAO','Naouri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'NAY','Nayala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'NOU','Noumbiel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'OUB','Oubritenga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'OUD','Oudalan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'PAS','Passor�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'PON','Poni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SEN','S�no');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SIS','Sissili');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SMT','Sanmatenga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SNG','Sangui�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SOM','Soum');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'SOR','Sourou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'TAP','Tapoa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'TUI','Tui');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'YAG','Yagha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'YAT','Yatenga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'ZIR','Ziro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'ZON','Zondoma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (34,'ZOU','Zoundw�ogo');

INSERT INTO lc_countries VALUES (35,'Burundi','BI','BDI','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'BB','Bubanza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'BJ','Bujumbura Mairie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'BR','Bururi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'CA','Cankuzo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'CI','Cibitoke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'GI','Gitega');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'KR','Karuzi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'KY','Kayanza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'KI','Kirundo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'MA','Makamba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'MU','Muramvya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'MY','Muyinga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'MW','Mwaro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'NG','Ngozi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'RT','Rutana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (35,'RY','Ruyigi');

INSERT INTO lc_countries VALUES (36,'Cambodia','KH','KHM','');

INSERT INTO lc_countries VALUES (37,'Cameroon','CM','CMR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'AD','Adamaoua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'CE','Centre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'EN','Extr�me-Nord');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'ES','Est');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'LT','Littoral');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'NO','Nord');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'NW','Nord-Ouest');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'OU','Ouest');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'SU','Sud');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (37,'SW','Sud-Ouest');

INSERT INTO lc_countries VALUES (38,'Canada','CA','CAN',":name\n:street_address\n:city :state_code :postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'AB','Alberta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'BC','British Columbia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'MB','Manitoba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NB','New Brunswick');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NL','Newfoundland and Labrador');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NS','Nova Scotia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NT','Northwest Territories');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'NU','Nunavut');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'ON','Ontario');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'PE','Prince Edward Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'QC','Quebec');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'SK','Saskatchewan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (38,'YT','Yukon Territory');

INSERT INTO lc_countries VALUES (39,'Cape Verde','CV','CPV','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'BR','Brava');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'BV','Boa Vista');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'CA','Santa Catarina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'CR','Santa Cruz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'CS','Calheta de S�o Miguel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'MA','Maio');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'MO','Mosteiros');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'PA','Pa�l');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'PN','Porto Novo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'PR','Praia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'RG','Ribeira Grande');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SD','S�o Domingos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SF','S�o Filipe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SL','Sal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SN','S�o Nicolau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'SV','S�o Vicente');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (39,'TA','Tarrafal');

INSERT INTO lc_countries VALUES (40,'Cayman Islands','KY','CYM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'CR','Creek');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'EA','Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'MI','Midland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'SO','South Town');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'SP','Spot Bay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'ST','Stake Bay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'WD','West End');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (40,'WN','Western');

INSERT INTO lc_countries VALUES (41,'Central African Republic','CF','CAF','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'AC ','Ouham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'BB ','Bamingui-Bangoran');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'BGF','Bangui');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'BK ','Basse-Kotto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'HK ','Haute-Kotto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'HM ','Haut-Mbomou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'HS ','Mamb�r�-Kad��');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'KB ','Nana-Gr�bizi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'KG ','K�mo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'LB ','Lobaye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'MB ','Mbomou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'MP ','Ombella-M\'Poko');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'NM ','Nana-Mamb�r�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'OP ','Ouham-Pend�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'SE ','Sangha-Mba�r�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'UK ','Ouaka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (41,'VR ','Vakaga');

INSERT INTO lc_countries VALUES (42,'Chad','TD','TCD','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'BA ','Batha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'BET','Borkou-Ennedi-Tibesti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'BI ','Biltine');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'CB ','Chari-Baguirmi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'GR ','Gu�ra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'KA ','Kanem');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'LC ','Lac');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'LR ','Logone-Oriental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'LO ','Logone-Occidental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'MC ','Moyen-Chari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'MK ','Mayo-K�bbi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'OD ','Ouadda�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'SA ','Salamat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (42,'TA ','Tandjil�');

INSERT INTO lc_countries VALUES (43,'Chile','CL','CHL',":name\n:street_address\n:city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'AI','Ais�n del General Carlos Iba�ez');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'AN','Antofagasta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'AR','La Araucan�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'AT','Atacama');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'BI','Biob�o');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'CO','Coquimbo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'LI','Libertador Bernardo O\'Higgins');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'LL','Los Lagos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'MA','Magallanes y de la Antartica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'ML','Maule');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'RM','Metropolitana de Santiago');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'TA','Tarapac�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (43,'VS','Valpara�so');

INSERT INTO lc_countries VALUES (44,'China','CN','CHN',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'11','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'12','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'13','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'14','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'15','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'21','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'22','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'23','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'31','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'32','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'33','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'34','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'35','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'36','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'37','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'41','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'42','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'43','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'44','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'45','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'46','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'50','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'51','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'52','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'53','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'54','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'61','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'62','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'63','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'64','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'65','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'71','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'91','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (44,'92','??');

INSERT INTO lc_countries VALUES (45,'Christmas Island','CX','CXR','');

INSERT INTO lc_countries VALUES (46,'Cocos (Keeling) Islands','CC','CCK','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'D','Direction Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'H','Home Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'O','Horsburgh Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'S','South Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (46,'W','West Island');

INSERT INTO lc_countries VALUES (47,'Colombia','CO','COL','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'AMA','Amazonas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'ANT','Antioquia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'ARA','Arauca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'ATL','Atl�ntico');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'BOL','Bol�var');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'BOY','Boyac�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CAL','Caldas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CAQ','Caquet�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CAS','Casanare');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CAU','Cauca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CES','Cesar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CHO','Choc�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'COR','C�rdoba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'CUN','Cundinamarca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'DC','Bogot� Distrito Capital');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'GUA','Guain�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'GUV','Guaviare');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'HUI','Huila');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'LAG','La Guajira');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'MAG','Magdalena');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'MET','Meta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'NAR','Nari�o');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'NSA','Norte de Santander');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'PUT','Putumayo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'QUI','Quind�o');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'RIS','Risaralda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'SAN','Santander');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'SAP','San Andr�s y Providencia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'SUC','Sucre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'TOL','Tolima');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'VAC','Valle del Cauca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'VAU','Vaup�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (47,'VID','Vichada');

INSERT INTO lc_countries VALUES (48,'Comoros','KM','COM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (48,'A','Anjouan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (48,'G','Grande Comore');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (48,'M','Moh�li');

INSERT INTO lc_countries VALUES (49,'Congo','CG','COG','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'BC','Congo-Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'BN','Bandundu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'EQ','�quateur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'KA','Katanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'KE','Kasai-Oriental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'KN','Kinshasa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'KW','Kasai-Occidental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'MA','Maniema');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'NK','Nord-Kivu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'OR','Orientale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (49,'SK','Sud-Kivu');

INSERT INTO lc_countries VALUES (50,'Cook Islands','CK','COK','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'PU','Pukapuka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'RK','Rakahanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MK','Manihiki');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'PE','Penrhyn');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'NI','Nassau Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'SU','Surwarrow');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'PA','Palmerston');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'AI','Aitutaki');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MA','Manuae');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'TA','Takutea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MT','Mitiaro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'AT','Atiu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MU','Mauke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'RR','Rarotonga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (50,'MG','Mangaia');

INSERT INTO lc_countries VALUES (51,'Costa Rica','CR','CRI','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'A','Alajuela');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'C','Cartago');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'G','Guanacaste');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'H','Heredia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'L','Lim�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'P','Puntarenas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (51,'SJ','San Jos�');

INSERT INTO lc_countries VALUES (52,'Cote D\'Ivoire','CI','CIV','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'01','Lagunes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'02','Haut-Sassandra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'03','Savanes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'04','Vall�e du Bandama');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'05','Moyen-Como�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'06','Dix-Huit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'07','Lacs');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'08','Zanzan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'09','Bas-Sassandra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'10','Dengu�l�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'11','N\'zi-Como�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'12','Marahou�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'13','Sud-Como�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'14','Worodouqou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'15','Sud-Bandama');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'16','Agn�bi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'17','Bafing');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'18','Fromager');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (52,'19','Moyen-Cavally');

INSERT INTO lc_countries VALUES (53,'Croatia','HR','HRV','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'01','Zagrebacka �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'02','Krapinsko-zagorska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'03','Sisacko-moslavacka �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'04','Karlovacka �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'05','Vara�dinska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'06','Koprivnicko-kri�evacka �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'07','Bjelovarsko-bilogorska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'08','Primorsko-goranska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'09','Licko-senjska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'10','Viroviticko-podravska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'11','Po�e�ko-slavonska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'12','Brodsko-posavska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'13','Zadarska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'14','Osjecko-baranjska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'15','�ibensko-kninska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'16','Vukovarsko-srijemska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'17','Splitsko-dalmatinska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'18','Istarska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'19','Dubrovacko-neretvanska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'20','Medimurska �upanija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (53,'21','Zagreb');

INSERT INTO lc_countries VALUES (54,'Cuba','CU','CUB','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'01','Pinar del R�o');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'02','La Habana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'03','Ciudad de La Habana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'04','Matanzas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'05','Villa Clara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'06','Cienfuegos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'07','Sancti Sp�ritus');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'08','Ciego de �vila');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'09','Camag�ey');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'10','Las Tunas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'11','Holgu�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'12','Granma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'13','Santiago de Cuba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'14','Guant�namo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (54,'99','Isla de la Juventud');

INSERT INTO lc_countries VALUES (55,'Cyprus','CY','CYP','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'01','?e??ve?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'02','?e???s?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'03','?��???st??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'04','????a?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'05','?e�es??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (55,'06','??f??');

INSERT INTO lc_countries VALUES (56,'Czech Republic','CZ','CZE','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'JC','Jihocesk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'JM','Jihomoravsk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'KA','Karlovarsk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'VY','Vysocina kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'KR','Kr�lov�hradeck� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'LI','Libereck� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'MO','Moravskoslezsk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'OL','Olomouck� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'PA','Pardubick� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'PL','Plzensk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'PR','Hlavn� mesto Praha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'ST','Stredocesk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'US','�steck� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (56,'ZL','Zl�nsk� kraj');

INSERT INTO lc_countries VALUES (57,'Denmark','DK','DNK',":name\n:street_address\nDK-:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'040','Bornholms Regionskommune');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'101','K�benhavn');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'147','Frederiksberg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'070','�rhus Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'015','K�benhavns Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'020','Frederiksborg Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'042','Fyns Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'080','Nordjyllands Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'055','Ribe Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'065','Ringkj�bing Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'025','Roskilde Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'050','S�nderjyllands Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'035','Storstr�ms Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'060','Vejle Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'030','Vestsj�llands Amt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (57,'076','Viborg Amt');

INSERT INTO lc_countries VALUES (58,'Djibouti','DJ','DJI','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'AS','Region d\'Ali Sabieh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'AR','Region d\'Arta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'DI','Region de Dikhil');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'DJ','Ville de Djibouti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'OB','Region d\'Obock');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (58,'TA','Region de Tadjourah');

INSERT INTO lc_countries VALUES (59,'Dominica','DM','DMA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'AND','Saint Andrew Parish');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'DAV','Saint David Parish');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'GEO','Saint George Parish');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'JOH','Saint John Parish');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'JOS','Saint Joseph Parish');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'LUK','Saint Luke Parish');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'MAR','Saint Mark Parish');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'PAT','Saint Patrick Parish');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'PAU','Saint Paul Parish');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (59,'PET','Saint Peter Parish');

INSERT INTO lc_countries VALUES (60,'Dominican Republic','DO','DOM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'01','Distrito Nacional');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'02','�zua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'03','Baoruco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'04','Barahona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'05','Dajab�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'06','Duarte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'07','El�as Pi�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'08','El Seibo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'09','Espaillat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'10','Independencia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'11','La Altagracia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'12','La Romana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'13','La Vega');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'14','Mar�a Trinidad S�nchez');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'15','Monte Cristi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'16','Pedernales');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'17','Peravia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'18','Puerto Plata');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'19','Salcedo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'20','Saman�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'21','San Crist�bal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'22','San Juan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'23','San Pedro de Macor�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'24','S�nchez Ram�rez');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'25','Santiago');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'26','Santiago Rodr�guez');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'27','Valverde');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'28','Monse�or Nouel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'29','Monte Plata');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (60,'30','Hato Mayor');

INSERT INTO lc_countries VALUES (61,'East Timor','TP','TMP','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'AL','Aileu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'AN','Ainaro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'BA','Baucau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'BO','Bobonaro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'CO','Cova-Lima');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'DI','Dili');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'ER','Ermera');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'LA','Lautem');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'LI','Liqui��');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'MF','Manufahi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'MT','Manatuto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'OE','Oecussi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (61,'VI','Viqueque');

INSERT INTO lc_countries VALUES (62,'Ecuador','EC','ECU','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'A','Azuay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'B','Bol�var');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'C','Carchi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'D','Orellana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'E','Esmeraldas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'F','Ca�ar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'G','Guayas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'H','Chimborazo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'I','Imbabura');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'L','Loja');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'M','Manab�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'N','Napo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'O','El Oro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'P','Pichincha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'R','Los R�os');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'S','Morona-Santiago');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'T','Tungurahua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'U','Sucumb�os');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'W','Gal�pagos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'X','Cotopaxi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'Y','Pastaza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (62,'Z','Zamora-Chinchipe');

INSERT INTO lc_countries VALUES (63,'Egypt','EG','EGY','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'ALX','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'ASN','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'AST','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'BA','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'BH','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'BNS','??? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'C','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'DK','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'DT','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'FYM','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'GH','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'GZ','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'IS','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'JS','???? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'KB','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'KFS','??? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'KN','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'MN','?????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'MNF','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'MT','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'PTS','?????? ??? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'SHG','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'SHR','???????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'SIN','???? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'SUZ','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (63,'WAD','?????? ??????');

INSERT INTO lc_countries VALUES (64,'El Salvador','SV','SLV','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'AH','Ahuachap�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'CA','Caba�as');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'CH','Chalatenango');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'CU','Cuscatl�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'LI','La Libertad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'MO','Moraz�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'PA','La Paz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SA','Santa Ana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SM','San Miguel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SO','Sonsonate');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SS','San Salvador');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'SV','San Vicente');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'UN','La Uni�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (64,'US','Usulut�n');

INSERT INTO lc_countries VALUES (65,'Equatorial Guinea','GQ','GNQ','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'AN','Annob�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'BN','Bioko Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'BS','Bioko Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'CS','Centro Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'KN','Ki�-Ntem');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'LI','Litoral');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (65,'WN','Wele-Nzas');

INSERT INTO lc_countries VALUES (66,'Eritrea','ER','ERI','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'AN','Zoba Anseba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'DK','Zoba Debubawi Keyih Bahri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'DU','Zoba Debub');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'GB','Zoba Gash-Barka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'MA','Zoba Ma\'akel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (66,'SK','Zoba Semienawi Keyih Bahri');

INSERT INTO lc_countries VALUES (67,'Estonia','EE','EST','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'37','Harju maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'39','Hiiu maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'44','Ida-Viru maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'49','J�geva maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'51','J�rva maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'57','L��ne maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'59','L��ne-Viru maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'65','P�lva maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'67','P�rnu maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'70','Rapla maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'74','Saare maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'78','Tartu maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'82','Valga maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'84','Viljandi maakond');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (67,'86','V�ru maakond');

INSERT INTO lc_countries VALUES (68,'Ethiopia','ET','ETH','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'AA','??? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'AF','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'AH','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'BG','??????-???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'DD','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'GB','???? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'HR','??? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'OR','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'SM','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'SN','??? ???? ??????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (68,'TG','????');

INSERT INTO lc_countries VALUES (69,'Falkland Islands (Malvinas)','FK','FLK','');
INSERT INTO lc_countries VALUES (70,'Faroe Islands','FO','FRO','');

INSERT INTO lc_countries VALUES (71,'Fiji','FJ','FJI','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'C','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'E','Northern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'N','Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'R','Rotuma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (71,'W','Western');

INSERT INTO lc_countries VALUES (72,'Finland','FI','FIN',":name\n:street_address\nFIN-:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'AL','Ahvenanmaan maakunta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'ES','Etel�-Suomen l��ni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'IS','It�-Suomen l��ni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'LL','Lapin l��ni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'LS','L�nsi-Suomen l��ni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (72,'OL','Oulun l��ni');

INSERT INTO lc_countries VALUES (73,'France','FR','FRA',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'01','Ain');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'02','Aisne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'03','Allier');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'04','Alpes-de-Haute-Provence');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'05','Hautes-Alpes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'06','Alpes-Maritimes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'07','Ard�che');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'08','Ardennes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'09','Ari�ge');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'10','Aube');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'11','Aude');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'12','Aveyron');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'13','Bouches-du-Rh�ne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'14','Calvados');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'15','Cantal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'16','Charente');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'17','Charente-Maritime');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'18','Cher');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'19','Corr�ze');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'21','C�te-d\'Or');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'22','C�tes-d\'Armor');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'23','Creuse');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'24','Dordogne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'25','Doubs');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'26','Dr�me');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'27','Eure');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'28','Eure-et-Loir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'29','Finist�re');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'2A','Corse-du-Sud');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'2B','Haute-Corse');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'30','Gard');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'31','Haute-Garonne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'32','Gers');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'33','Gironde');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'34','H�rault');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'35','Ille-et-Vilaine');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'36','Indre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'37','Indre-et-Loire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'38','Is�re');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'39','Jura');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'40','Landes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'41','Loir-et-Cher');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'42','Loire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'43','Haute-Loire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'44','Loire-Atlantique');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'45','Loiret');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'46','Lot');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'47','Lot-et-Garonne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'48','Loz�re');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'49','Maine-et-Loire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'50','Manche');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'51','Marne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'52','Haute-Marne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'53','Mayenne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'54','Meurthe-et-Moselle');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'55','Meuse');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'56','Morbihan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'57','Moselle');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'58','Ni�vre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'59','Nord');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'60','Oise');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'61','Orne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'62','Pas-de-Calais');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'63','Puy-de-D�me');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'64','Pyr�n�es-Atlantiques');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'65','Hautes-Pyr�n�es');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'66','Pyr�n�es-Orientales');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'67','Bas-Rhin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'68','Haut-Rhin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'69','Rh�ne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'70','Haute-Sa�ne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'71','Sa�ne-et-Loire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'72','Sarthe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'73','Savoie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'74','Haute-Savoie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'75','Paris');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'76','Seine-Maritime');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'77','Seine-et-Marne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'78','Yvelines');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'79','Deux-S�vres');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'80','Somme');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'81','Tarn');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'82','Tarn-et-Garonne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'83','Var');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'84','Vaucluse');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'85','Vend�e');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'86','Vienne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'87','Haute-Vienne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'88','Vosges');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'89','Yonne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'90','Territoire de Belfort');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'91','Essonne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'92','Hauts-de-Seine');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'93','Seine-Saint-Denis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'94','Val-de-Marne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'95','Val-d\'Oise');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'NC','Territoire des Nouvelle-Cal�donie et Dependances');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'PF','Polyn�sie Fran�aise');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'PM','Saint-Pierre et Miquelon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'TF','Terres australes et antarctiques fran�aises');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'YT','Mayotte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (73,'WF','Territoire des �les Wallis et Futuna');

INSERT INTO lc_countries VALUES (74,'France, Metropolitan','FX','FXX',":name\n:street_address\n:postcode :city\n:country");
INSERT INTO lc_countries VALUES (75,'French Guiana','GF','GUF',":name\n:street_address\n:postcode :city\n:country");
INSERT INTO lc_countries VALUES (76,'French Polynesia','PF','PYF',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'M','Archipel des Marquises');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'T','Archipel des Tuamotu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'I','Archipel des Tubuai');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'V','Iles du Vent');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (76,'S','Iles Sous-le-Vent ');

INSERT INTO lc_countries VALUES (77,'French Southern Territories','TF','ATF',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'C','Iles Crozet');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'K','Iles Kerguelen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'A','Ile Amsterdam');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'P','Ile Saint-Paul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (77,'D','Adelie Land');

INSERT INTO lc_countries VALUES (78,'Gabon','GA','GAB','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'ES','Estuaire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'HO','Haut-Ogooue');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'MO','Moyen-Ogooue');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'NG','Ngounie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'NY','Nyanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'OI','Ogooue-Ivindo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'OL','Ogooue-Lolo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'OM','Ogooue-Maritime');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (78,'WN','Woleu-Ntem');

INSERT INTO lc_countries VALUES (79,'Gambia','GM','GMB','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'AH','Ashanti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'BA','Brong-Ahafo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'CP','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'EP','Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'AA','Greater Accra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'NP','Northern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'UE','Upper East');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'UW','Upper West');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'TV','Volta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (79,'WP','Western');

INSERT INTO lc_countries VALUES (80,'Georgia','GE','GEO','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'AB','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'AJ','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'GU','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'IM','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'KA','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'KK','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'MM','??????-????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'RL','????-??????? ?? ????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'SJ','??????-????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'SK','???? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'SZ','?????????-???? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (80,'TB','???????');

INSERT INTO lc_countries VALUES (81,'Germany','DE','DEU',":name\n:street_address\nD-:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'BE','Berlin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'BR','Brandenburg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'BW','Baden-W�rttemberg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'BY','Bayern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'HB','Bremen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'HE','Hessen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'HH','Hamburg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'MV','Mecklenburg-Vorpommern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'NI','Niedersachsen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'NW','Nordrhein-Westfalen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'RP','Rheinland-Pfalz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'SH','Schleswig-Holstein');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'SL','Saarland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'SN','Sachsen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'ST','Sachsen-Anhalt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (81,'TH','Th�ringen');

INSERT INTO lc_countries VALUES (82,'Ghana','GH','GHA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'AA','Greater Accra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'AH','Ashanti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'BA','Brong-Ahafo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'CP','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'EP','Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'NP','Northern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'TV','Volta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'UE','Upper East');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'UW','Upper West');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (82,'WP','Western');

INSERT INTO lc_countries VALUES (83,'Gibraltar','GI','GIB','');

INSERT INTO lc_countries VALUES (84,'Greece','GR','GRC','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'01','??t???a?a??a??a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'03','????t?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'04','??�??a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'05','????ta??a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'06','F???t?da');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'07','F???da');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'11','??????da');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'12','???ad?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'13','??a?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'14','??e?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'15','???????a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'16','?a????a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'17','?ess???a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'21','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'22','??????a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'23','?efa??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'24','?e???da');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'31','??ta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'32','Tesp??t?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'33','???????a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'34','??e�e?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'41','?a?d?tsa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'42','????sa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'43','?a???s?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'44','????a?a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'51','G?e�e??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'52','???�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'53','?�a??a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'54','Tessa??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'55','?a�??a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'56','?ast????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'57','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'58','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'59','????a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'61','??e??a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'62','Se????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'63','F?????a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'64','?a???d???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'69','???? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'71','?�???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'72','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'73','??d?p?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'81','??de????sa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'82','?????de?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'83','??s�??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'84','S?�??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'85','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'91','?????e??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'92','?as???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'93','?e??�??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'94','?a????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (84,'A1','?tt???');

INSERT INTO lc_countries VALUES (85,'Greenland','GL','GRL',":name\n:street_address\nDK-:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (85,'A','Avannaa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (85,'T','Tunu ');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (85,'K','Kitaa');

INSERT INTO lc_countries VALUES (86,'Grenada','GD','GRD','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'A','Saint Andrew');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'D','Saint David');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'G','Saint George');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'J','Saint John');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'M','Saint Mark');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (86,'P','Saint Patrick');

INSERT INTO lc_countries VALUES (87,'Guadeloupe','GP','GLP','');
INSERT INTO lc_countries VALUES (88,'Guam','GU','GUM','');

INSERT INTO lc_countries VALUES (89,'Guatemala','GT','GTM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'AV','Alta Verapaz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'BV','Baja Verapaz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'CM','Chimaltenango');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'CQ','Chiquimula');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'ES','Escuintla');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'GU','Guatemala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'HU','Huehuetenango');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'IZ','Izabal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'JA','Jalapa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'JU','Jutiapa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'PE','El Pet�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'PR','El Progreso');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'QC','El Quich�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'QZ','Quetzaltenango');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'RE','Retalhuleu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SA','Sacatep�quez');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SM','San Marcos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SO','Solol�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SR','Santa Rosa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'SU','Suchitep�quez');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'TO','Totonicap�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (89,'ZA','Zacapa');

INSERT INTO lc_countries VALUES (90,'Guinea','GN','GIN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'BE','Beyla');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'BF','Boffa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'BK','Bok�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'CO','Coyah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'DB','Dabola');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'DI','Dinguiraye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'DL','Dalaba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'DU','Dubr�ka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'FA','Faranah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'FO','For�cariah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'FR','Fria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'GA','Gaoual');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'GU','Gu�k�dou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KA','Kankan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KB','Koubia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KD','Kindia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KE','K�rouan�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KN','Koundara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KO','Kouroussa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'KS','Kissidougou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'LA','Lab�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'LE','L�louma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'LO','Lola');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'MC','Macenta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'MD','Mandiana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'ML','Mali');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'MM','Mamou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'NZ','Nz�r�kor�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'PI','Pita');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'SI','Siguiri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'TE','T�lim�l�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'TO','Tougu�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (90,'YO','Yomou');

INSERT INTO lc_countries VALUES (91,'Guinea-Bissau','GW','GNB','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'BF','Bafata');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'BB','Biombo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'BS','Bissau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'BL','Bolama');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'CA','Cacheu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'GA','Gabu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'OI','Oio');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'QU','Quinara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (91,'TO','Tombali');

INSERT INTO lc_countries VALUES (92,'Guyana','GY','GUY','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'BA','Barima-Waini');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'CU','Cuyuni-Mazaruni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'DE','Demerara-Mahaica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'EB','East Berbice-Corentyne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'ES','Essequibo Islands-West Demerara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'MA','Mahaica-Berbice');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'PM','Pomeroon-Supenaam');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'PT','Potaro-Siparuni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'UD','Upper Demerara-Berbice');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (92,'UT','Upper Takutu-Upper Essequibo');

INSERT INTO lc_countries VALUES (93,'Haiti','HT','HTI','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'AR','Artibonite');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'CE','Centre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'GA','Grand\'Anse');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'NI','Nippes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'ND','Nord');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'NE','Nord-Est');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'NO','Nord-Ouest');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'OU','Ouest');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'SD','Sud');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (93,'SE','Sud-Est');

INSERT INTO lc_countries VALUES (94,'Heard and McDonald Islands','HM','HMD','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (94,'F','Flat Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (94,'M','McDonald Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (94,'S','Shag Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (94,'H','Heard Island');

INSERT INTO lc_countries VALUES (95,'Honduras','HN','HND','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'AT','Atl�ntida');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CH','Choluteca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CL','Col�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CM','Comayagua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CP','Cop�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'CR','Cort�s');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'EP','El Para�so');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'FM','Francisco Moraz�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'GD','Gracias a Dios');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'IB','Islas de la Bah�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'IN','Intibuc�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'LE','Lempira');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'LP','La Paz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'OC','Ocotepeque');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'OL','Olancho');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'SB','Santa B�rbara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'VA','Valle');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (95,'YO','Yoro');

INSERT INTO lc_countries VALUES (96,'Hong Kong','HK','HKG',":name\n:street_address\n:city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'HCW','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'HEA','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'HSO','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'HWC','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KKC','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KKT','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KSS','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KWT','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'KYT','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NIS','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NKT','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NNO','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NSK','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NST','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NTP','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NTW','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NTM','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (96,'NYL','???');

INSERT INTO lc_countries VALUES (97,'Hungary','HU','HUN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BA','Baranya megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BC','B�k�scsaba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BE','B�k�s megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BK','B�cs-Kiskun megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BU','Budapest');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'BZ','Borsod-Aba�j-Zempl�n megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'CS','Csongr�d megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'DE','Debrecen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'DU','Duna�jv�ros');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'EG','Eger');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'FE','Fej�r megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'GS','Gyor-Moson-Sopron megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'GY','Gyor');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'HB','Hajd�-Bihar megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'HE','Heves megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'HV','H�dmezov�s�rhely');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'JN','J�sz-Nagykun-Szolnok megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'KE','Kom�rom-Esztergom megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'KM','Kecskem�t');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'KV','Kaposv�r');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'MI','Miskolc');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'NK','Nagykanizsa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'NO','N�gr�d megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'NY','Ny�regyh�za');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'PE','Pest megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'PS','P�cs');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SD','Szeged');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SF','Sz�kesfeh�rv�r');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SH','Szombathely');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SK','Szolnok');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SN','Sopron');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SO','Somogy megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SS','Szeksz�rd');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'ST','Salg�tarj�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'SZ','Szabolcs-Szatm�r-Bereg megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'TB','Tatab�nya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'TO','Tolna megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'VA','Vas megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'VE','Veszpr�m megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'VM','Veszpr�m');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'ZA','Zala megye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (97,'ZE','Zalaegerszeg');

INSERT INTO lc_countries VALUES (98,'Iceland','IS','ISL',":name\n:street_address\nIS:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'1','H�fu�borgarsv��i�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'2','Su�urnes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'3','Vesturland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'4','Vestfir�ir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'5','Nor�urland vestra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'6','Nor�urland eystra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'7','Austfir�ir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (98,'8','Su�urland');

INSERT INTO lc_countries VALUES (99,'India','IN','IND',":name\n:street_address\n:city-:postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-AN','?????? ?? ??????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-AP','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-AR','??????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-AS','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-BR','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-CH','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-CT','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-DD','??? ??? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-DL','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-DN','????? ??? ??? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-GA','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-GJ','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-HP','?????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-HR','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-JH','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-JK','????? ?? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-KA','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-KL','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-LD','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-ML','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-MH','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-MN','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-MP','???? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-MZ','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-NL','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-OR','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-PB','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-PY','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-RJ','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-SK','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-TN','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-TR','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-UL','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-UP','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (99,'IN-WB','??????????');

INSERT INTO lc_countries VALUES (100,'Indonesia','ID','IDN',":name\n:street_address\n:city :postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'AC','Aceh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'BA','Bali');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'BB','Bangka-Belitung');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'BE','Bengkulu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'BT','Banten');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'GO','Gorontalo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'IJ','Papua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JA','Jambi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JI','Jawa Timur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JK','Jakarta Raya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JR','Jawa Barat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'JT','Jawa Tengah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'KB','Kalimantan Barat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'KI','Kalimantan Timur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'KS','Kalimantan Selatan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'KT','Kalimantan Tengah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'LA','Lampung');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'MA','Maluku');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'MU','Maluku Utara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'NB','Nusa Tenggara Barat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'NT','Nusa Tenggara Timur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'RI','Riau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SB','Sumatera Barat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SG','Sulawesi Tenggara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SL','Sumatera Selatan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SN','Sulawesi Selatan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'ST','Sulawesi Tengah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SW','Sulawesi Utara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'SU','Sumatera Utara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (100,'YO','Yogyakarta');

INSERT INTO lc_countries VALUES (101,'Iran','IR','IRN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'01','?????? ????????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'02','?????? ????????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'03','?????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'04','?????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'05','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'06','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'07','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'08','?????? ??????? ? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'09','?????? ?????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'10','?????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'11','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'12','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'13','?????? ?????? ??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'14','?????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'15','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'16','?????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'17','?????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'18','?????? ???????? ? ???? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'19','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'20','?????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'21','?????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'22','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'23','?????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'24','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'25','?????? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'26','?????? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'27','?????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (101,'28','?????? ?????');

INSERT INTO lc_countries VALUES (102,'Iraq','IQ','IRQ','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'AN','?????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'AR','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'BA','?????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'BB','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'BG','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'DA','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'DI','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'DQ','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'KA','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'MA','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'MU','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'NA','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'NI','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'QA','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'SD','???? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'SW','?????? ??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'TS','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (102,'WA','????');

INSERT INTO lc_countries VALUES (103,'Ireland','IE','IRL',":name\n:street_address\nIE-:city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'C','Corcaigh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'CE','Contae an Chl�ir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'CN','An Cabh�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'CW','Ceatharlach');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'D','Baile �tha Cliath');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'DL','D�n na nGall');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'G','Gaillimh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'KE','Cill Dara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'KK','Cill Chainnigh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'KY','Contae Chiarra�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LD','An Longfort');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LH','Contae L�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LK','Luimneach');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LM','Contae Liatroma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'LS','Contae Laoise');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'MH','Contae na M�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'MN','Muineach�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'MO','Contae Mhaigh Eo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'OY','Contae U�bh Fhail�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'RN','Ros Com�in');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'SO','Sligeach');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'TA','Tiobraid �rann');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'WD','Port Lairge');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'WH','Contae na hIarmh�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'WW','Cill Mhant�in');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (103,'WX','Loch Garman');

INSERT INTO lc_countries VALUES (104,'Israel','IL','ISR',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'D ','???? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'HA','???? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'JM','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'M ','???? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'TA','?? ????-???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (104,'Z ','???? ?????');

INSERT INTO lc_countries VALUES (105,'Italy','IT','ITA',":name\n:street_address\n:postcode-:city :state_code\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AG','Agrigento');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AL','Alessandria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AN','Ancona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AO','Valle d\'Aosta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AP','Ascoli Piceno');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AQ','L\'Aquila');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AR','Arezzo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AT','Asti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'AV','Avellino');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BA','Bari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BG','Bergamo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BI','Biella');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BL','Belluno');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BN','Benevento');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BO','Bologna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BR','Brindisi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BS','Brescia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BT','Barletta-Andria-Trani');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'BZ','Alto Adige');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CA','Cagliari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CB','Campobasso');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CE','Caserta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CH','Chieti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CI','Carbonia-Iglesias');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CL','Caltanissetta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CN','Cuneo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CO','Como');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CR','Cremona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CS','Cosenza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CT','Catania');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'CZ','Catanzaro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'EN','Enna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FE','Ferrara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FG','Foggia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FI','Firenze');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FM','Fermo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FO','Forl�-Cesena');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'FR','Frosinone');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'GE','Genova');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'GO','Gorizia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'GR','Grosseto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'IM','Imperia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'IS','Isernia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'KR','Crotone');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LC','Lecco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LE','Lecce');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LI','Livorno');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LO','Lodi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LT','Latina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'LU','Lucca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MC','Macerata');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MD','Medio Campidano');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'ME','Messina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MI','Milano');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MN','Mantova');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MO','Modena');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MS','Massa-Carrara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MT','Matera');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'MZ','Monza e Brianza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'NA','Napoli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'NO','Novara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'NU','Nuoro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'OG','Ogliastra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'OR','Oristano');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'OT','Olbia-Tempio');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PA','Palermo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PC','Piacenza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PD','Padova');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PE','Pescara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PG','Perugia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PI','Pisa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PN','Pordenone');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PO','Prato');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PR','Parma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PS','Pesaro e Urbino');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PT','Pistoia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PV','Pavia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'PZ','Potenza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RA','Ravenna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RC','Reggio Calabria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RE','Reggio Emilia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RG','Ragusa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RI','Rieti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RM','Roma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RN','Rimini');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'RO','Rovigo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SA','Salerno');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SI','Siena');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SO','Sondrio');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SP','La Spezia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SR','Siracusa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SS','Sassari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'SV','Savona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TA','Taranto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TE','Teramo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TN','Trento');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TO','Torino');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TP','Trapani');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TR','Terni');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TS','Trieste');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'TV','Treviso');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'UD','Udine');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VA','Varese');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VB','Verbano-Cusio-Ossola');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VC','Vercelli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VE','Venezia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VI','Vicenza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VR','Verona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VT','Viterbo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (105,'VV','Vibo Valentia');

INSERT INTO lc_countries VALUES (106,'Jamaica','JM','JAM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'01','Kingston');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'02','Half Way Tree');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'03','Morant Bay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'04','Port Antonio');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'05','Port Maria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'06','Saint Ann\'s Bay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'07','Falmouth');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'08','Montego Bay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'09','Lucea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'10','Savanna-la-Mar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'11','Black River');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'12','Mandeville');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'13','May Pen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (106,'14','Spanish Town');

INSERT INTO lc_countries VALUES (107,'Japan','JP','JPN',":name\n:street_address, :suburb\n:city :postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'01','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'02','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'03','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'04','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'05','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'06','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'07','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'08','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'09','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'10','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'11','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'12','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'13','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'14','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'15','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'16','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'17','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'18','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'19','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'20','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'21','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'22','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'23','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'24','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'25','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'26','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'27','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'28','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'29','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'30','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'31','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'32','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'33','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'34','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'35','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'36','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'37','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'38','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'39','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'40','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'41','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'42','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'43','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'44','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'45','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'46','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (107,'47','??');

INSERT INTO lc_countries VALUES (108,'Jordan','JO','JOR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AJ','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AM','?????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AQ','?????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AT','?????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'AZ','?????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'BA','?????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'JA','?????? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'JR','?????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'KA','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'MA','?????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'MD','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (108,'MN','?????? ????');

INSERT INTO lc_countries VALUES (109,'Kazakhstan','KZ','KAZ','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AL','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AC','Almaty City');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AM','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AQ','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AS','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'AT','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'BA','????? ?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'BY','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'MA','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'ON','???????? ?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'PA','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'QA','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'QO','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'QY','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'SH','????? ?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'SO','????????? ?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (109,'ZH','??????');

INSERT INTO lc_countries VALUES (110,'Kenya','KE','KEN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'110','Nairobi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'200','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'300','Mombasa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'400','Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'500','North Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'600','Nyanza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'700','Rift Valley');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (110,'900','Western');

INSERT INTO lc_countries VALUES (111,'Kiribati','KI','KIR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (111,'G','Gilbert Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (111,'L','Line Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (111,'P','Phoenix Islands');

INSERT INTO lc_countries VALUES (112,'Korea, North','KP','PRK','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'CHA','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'HAB','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'HAN','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'HWB','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'HWN','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'KAN','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'KAE','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'NAJ','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'NAM','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'PYB','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'PYN','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'PYO','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (112,'YAN','???');

INSERT INTO lc_countries VALUES (113,'Korea, South','KR','KOR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'11','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'26','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'27','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'28','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'29','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'30','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'31','?? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'41','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'42','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'43','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'44','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'45','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'46','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'47','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'48','?? ??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (113,'49','???????');

INSERT INTO lc_countries VALUES (114,'Kuwait','KW','KWT','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'AH','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'FA','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'JA','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'KU','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'HW','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (114,'MU','????? ??????');

INSERT INTO lc_countries VALUES (115,'Kyrgyzstan','KG','KGZ','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'B','?????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'C','??? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'GB','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'J','?????-???? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'N','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'O','?? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'T','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (115,'Y','????-??? ???????');

INSERT INTO lc_countries VALUES (116,'Laos','LA','LAO','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'AT','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'BK','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'BL','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'CH','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'HO','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'KH','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'LM','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'LP','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'OU','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'PH','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'SL','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'SV','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'VI','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'VT','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'XA','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'XE','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'XI','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (116,'XN','????????');

INSERT INTO lc_countries VALUES (117,'Latvia','LV','LVA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'AI','Aizkraukles rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'AL','Aluksnes rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'BL','Balvu rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'BU','Bauskas rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'CE','Cesu rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'DA','Daugavpils rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'DGV','Daugpilis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'DO','Dobeles rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'GU','Gulbenes rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'JEL','Jelgava');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'JK','Jekabpils rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'JL','Jelgavas rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'JUR','Jurmala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'KR','Kraslavas rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'KU','Kuldigas rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'LE','Liepajas rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'LM','Limba�u rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'LPX','Liepoja');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'LU','Ludzas rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'MA','Madonas rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'OG','Ogres rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'PR','Preilu rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'RE','Rezeknes rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'REZ','Rezekne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'RI','Rigas rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'RIX','Riga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'SA','Saldus rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'TA','Talsu rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'TU','Tukuma rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'VE','Ventspils rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'VEN','Ventspils');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'VK','Valkas rajons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (117,'VM','Valmieras rajons');

INSERT INTO lc_countries VALUES (118,'Lebanon','LB','LBN','');

INSERT INTO lc_countries VALUES (119,'Lesotho','LS','LSO','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'A','Maseru');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'B','Butha-Buthe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'C','Leribe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'D','Berea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'E','Mafeteng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'F','Mohale\'s Hoek');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'G','Quthing');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'H','Qacha\'s Nek');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'J','Mokhotlong');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (119,'K','Thaba-Tseka');

INSERT INTO lc_countries VALUES (120,'Liberia','LR','LBR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'BG','Bong');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'BM','Bomi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'CM','Grand Cape Mount');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'GB','Grand Bassa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'GG','Grand Gedeh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'GK','Grand Kru');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'GP','Gbarpolu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'LO','Lofa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'MG','Margibi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'MO','Montserrado');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'MY','Maryland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'NI','Nimba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'RG','River Gee');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'RI','Rivercess');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (120,'SI','Sinoe');

INSERT INTO lc_countries VALUES (121,'Libyan Arab Jamahiriya','LY','LBY','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'AJ','Ajdabiya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'BA','Banghazi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'BU','Al Butnan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'BW','Bani Walid');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'DR','Darnah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'GD','Ghadamis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'GR','Gharyan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'GT','Ghat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'HZ','Al ?izam al Akh?ar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'JA','Al Jabal al Akh?ar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'JB','Jaghbub');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'JI','Al Jifarah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'JU','Al Jufrah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'KF','Al Kufrah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MB','Al Marqab');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MI','Misratah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MJ','Al Marj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MQ','Murzuq');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'MZ','Mizdah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'NL','Nalut');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'NQ','An Nuqat al Khams');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'QB','Al Qubbah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'QT','Al Qatrun');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'SB','Sabha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'SH','Ash Shati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'SR','Surt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'SS','Sabratah Surman');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'TB','Tarabulus');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'TM','Tarhunah-Masallatah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'TN','Tajura wa an Nawa?i al Arba?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'WA','Al Wa?ah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'WD','Wadi al ?ayat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'YJ','Yafran-Jadu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (121,'ZA','Az Zawiyah');

INSERT INTO lc_countries VALUES (122,'Liechtenstein','LI','LIE','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'B','Balzers');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'E','Eschen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'G','Gamprin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'M','Mauren');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'P','Planken');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'R','Ruggell');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'A','Schaan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'L','Schellenberg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'N','Triesen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'T','Triesenberg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (122,'V','Vaduz');

INSERT INTO lc_countries VALUES (123,'Lithuania','LT','LTU','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'AL','Alytaus Apskritis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'KL','Klaipedos Apskritis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'KU','Kauno Apskritis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'MR','Marijampoles Apskritis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'PN','Paneve�io Apskritis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'SA','�iauliu Apskritis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'TA','Taurages Apskritis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'TE','Tel�iu Apskritis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'UT','Utenos Apskritis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (123,'VL','Vilniaus Apskritis');

INSERT INTO lc_countries VALUES (124,'Luxembourg','LU','LUX',":name\n:street_address\nL-:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (124,'D','Diekirch');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (124,'G','Grevenmacher');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (124,'L','Luxemburg');

INSERT INTO lc_countries VALUES (125,'Macau','MO','MAC','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (125,'I','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (125,'M','???');

INSERT INTO lc_countries VALUES (126,'Macedonia','MK','MKD','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BR','Berovo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CH','????????-????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DL','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KB','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'OC','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'LO','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'MK','?????????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PH','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PT','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ST','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SL','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NI','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ZR','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KY','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KZ','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'UM','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'LI','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RN','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NA','????? ??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'TL','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DM','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DE','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KG','????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KS','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'MG','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NV','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PP','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RE','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VJ','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BN','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GT','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'JG','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'MR','??????? ? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'TR','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ET','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VH','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ZE','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'AD','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'AR','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BU','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CI','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CE','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CS','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GB','???? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GP','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'IL','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KX','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VD','?????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PE','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'AJ','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SS','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SU','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SO','???? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ZK','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BG','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'BS','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GV','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KN','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NS','???? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RV','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'SD','???? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RU','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VA','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VL','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CZ','?????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DB','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DA','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DR','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'KH','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'MD','?????????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'OD','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'OS','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'PN','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'UG','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VV','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VC','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'ZA','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'CA','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'DK','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'GR','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'AV','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'NG','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'RM','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (126,'VE','?????');

INSERT INTO lc_countries VALUES (127,'Madagascar','MG','MDG','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'A','Toamasina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'D','Antsiranana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'F','Fianarantsoa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'M','Mahajanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'T','Antananarivo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (127,'U','Toliara');

INSERT INTO lc_countries VALUES (128,'Malawi','MW','MWI','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'BA','Balaka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'BL','Blantyre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'C','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'CK','Chikwawa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'CR','Chiradzulu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'CT','Chitipa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'DE','Dedza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'DO','Dowa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'KR','Karonga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'KS','Kasungu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'LK','Likoma Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'LI','Lilongwe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MH','Machinga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MG','Mangochi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MC','Mchinji');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MU','Mulanje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MW','Mwanza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'MZ','Mzimba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'N','Northern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NB','Nkhata');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NK','Nkhotakota');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NS','Nsanje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NU','Ntcheu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'NI','Ntchisi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'PH','Phalombe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'RU','Rumphi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'S','Southern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'SA','Salima');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'TH','Thyolo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (128,'ZO','Zomba');

INSERT INTO lc_countries VALUES (129,'Malaysia','MY','MYS','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'01','Johor Darul Takzim');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'02','Kedah Darul Aman');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'03','Kelantan Darul Naim');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'04','Melaka Negeri Bersejarah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'05','Negeri Sembilan Darul Khusus');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'06','Pahang Darul Makmur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'07','Pulau Pinang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'08','Perak Darul Ridzuan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'09','Perlis Indera Kayangan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'10','Selangor Darul Ehsan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'11','Terengganu Darul Iman');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'12','Sabah Negeri Di Bawah Bayu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'13','Sarawak Bumi Kenyalang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'14','Wilayah Persekutuan Kuala Lumpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'15','Wilayah Persekutuan Labuan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (129,'16','Wilayah Persekutuan Putrajaya');

INSERT INTO lc_countries VALUES (130,'Maldives','MV','MDV','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'THU','Thiladhunmathi Uthuru');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'THD','Thiladhunmathi Dhekunu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MLU','Miladhunmadulu Uthuru');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MLD','Miladhunmadulu Dhekunu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MAU','Maalhosmadulu Uthuru');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MAD','Maalhosmadulu Dhekunu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'FAA','Faadhippolhu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MAA','Male Atoll');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'AAU','Ari Atoll Uthuru');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'AAD','Ari Atoll Dheknu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'FEA','Felidhe Atoll');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'MUA','Mulaku Atoll');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'NAU','Nilandhe Atoll Uthuru');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'NAD','Nilandhe Atoll Dhekunu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'KLH','Kolhumadulu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'HDH','Hadhdhunmathi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'HAU','Huvadhu Atoll Uthuru');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'HAD','Huvadhu Atoll Dhekunu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'FMU','Fua Mulaku');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (130,'ADD','Addu');

INSERT INTO lc_countries VALUES (131,'Mali','ML','MLI','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'1','Kayes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'2','Koulikoro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'3','Sikasso');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'4','S�gou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'5','Mopti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'6','Tombouctou');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'7','Gao');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'8','Kidal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (131,'BK0','Bamako');

INSERT INTO lc_countries VALUES (132,'Malta','MT','MLT','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ATT','Attard');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BAL','Balzan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BGU','Birgu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BKK','Birkirkara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BRZ','Birzebbuga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'BOR','Bormla');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'DIN','Dingli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'FGU','Fgura');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'FLO','Floriana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GDJ','Gudja');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GZR','Gzira');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GRG','Gargur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GXQ','Gaxaq');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'HMR','Hamrun');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'IKL','Iklin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ISL','Isla');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'KLK','Kalkara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'KRK','Kirkop');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'LIJ','Lija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'LUQ','Luqa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MRS','Marsa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MKL','Marsaskala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MXL','Marsaxlokk');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MDN','Mdina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MEL','Melliea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MGR','Mgarr');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MST','Mosta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MQA','Mqabba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MSI','Msida');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MTF','Mtarfa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'NAX','Naxxar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'PAO','Paola');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'PEM','Pembroke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'PIE','Pieta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'QOR','Qormi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'QRE','Qrendi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'RAB','Rabat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SAF','Safi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SGI','San Giljan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SLU','Santa Lucija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SPB','San Pawl il-Bahar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SGW','San Gwann');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SVE','Santa Venera');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SIG','Siggiewi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SLM','Sliema');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SWQ','Swieqi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'TXB','Ta Xbiex');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'TRX','Tarxien');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'VLT','Valletta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'XGJ','Xgajra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZBR','Zabbar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZBG','Zebbug');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZJT','Zejtun');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZRQ','Zurrieq');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'FNT','Fontana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GHJ','Ghajnsielem');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GHR','Gharb');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'GHS','Ghasri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'KRC','Kercem');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'MUN','Munxar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'NAD','Nadur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'QAL','Qala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'VIC','Victoria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SLA','San Lawrenz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'SNT','Sannat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZAG','Xagra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'XEW','Xewkija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (132,'ZEB','Zebbug');

INSERT INTO lc_countries VALUES (133,'Marshall Islands','MH','MHL','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'ALK','Ailuk');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'ALL','Ailinglapalap');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'ARN','Arno');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'AUR','Aur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'EBO','Ebon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'ENI','Eniwetok');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'JAB','Jabat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'JAL','Jaluit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'KIL','Kili');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'KWA','Kwajalein');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'LAE','Lae');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'LIB','Lib');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'LIK','Likiep');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'MAJ','Majuro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'MAL','Maloelap');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'MEJ','Mejit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'MIL','Mili');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'NMK','Namorik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'NMU','Namu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'RON','Rongelap');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'UJA','Ujae');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'UJL','Ujelang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'UTI','Utirik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'WTJ','Wotje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (133,'WTN','Wotho');

INSERT INTO lc_countries VALUES (134,'Martinique','MQ','MTQ','');

INSERT INTO lc_countries VALUES (135,'Mauritania','MR','MRT','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'01','????? ????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'02','????? ????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'03','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'04','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'05','????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'06','????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'07','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'08','????? ????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'09','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'10','????? ???? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'11','????? ???? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'12','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (135,'NKC','???????');

INSERT INTO lc_countries VALUES (136,'Mauritius','MU','MUS','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'AG','Agalega Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'BL','Black River');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'BR','Beau Bassin-Rose Hill');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'CC','Cargados Carajos Shoals');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'CU','Curepipe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'FL','Flacq');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'GP','Grand Port');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'MO','Moka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'PA','Pamplemousses');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'PL','Port Louis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'PU','Port Louis City');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'PW','Plaines Wilhems');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'QB','Quatre Bornes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'RO','Rodrigues');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'RR','Riviere du Rempart');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'SA','Savanne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (136,'VP','Vacoas-Phoenix');

INSERT INTO lc_countries VALUES (137,'Mayotte','YT','MYT','');

INSERT INTO lc_countries VALUES (138,'Mexico','MX','MEX',":name\n:street_address\n:postcode :city, :state_code\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'AGU','Aguascalientes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'BCN','Baja California');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'BCS','Baja California Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'CAM','Campeche');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'CHH','Chihuahua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'CHP','Chiapas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'COA','Coahuila');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'COL','Colima');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'DIF','Distrito Federal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'DUR','Durango');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'GRO','Guerrero');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'GUA','Guanajuato');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'HID','Hidalgo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'JAL','Jalisco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'MEX','Mexico');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'MIC','Michoac�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'MOR','Morelos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'NAY','Nayarit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'NLE','Nuevo Le�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'OAX','Oaxaca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'PUE','Puebla');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'QUE','Quer�taro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'ROO','Quintana Roo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'SIN','Sinaloa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'SLP','San Luis Potos�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'SON','Sonora');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'TAB','Tabasco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'TAM','Tamaulipas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'TLA','Tlaxcala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'VER','Veracruz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'YUC','Yucatan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (138,'ZAC','Zacatecas');

INSERT INTO lc_countries VALUES (139,'Micronesia','FM','FSM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (139,'KSA','Kosrae');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (139,'PNI','Pohnpei');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (139,'TRK','Chuuk');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (139,'YAP','Yap');

INSERT INTO lc_countries VALUES (140,'Moldova','MD','MDA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'BA','Balti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'CA','Cahul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'CU','Chisinau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'ED','Edinet');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'GA','Gagauzia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'LA','Lapusna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'OR','Orhei');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'SN','St�nga Nistrului');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'SO','Soroca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'TI','Tighina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (140,'UN','Ungheni');

INSERT INTO lc_countries VALUES (141,'Monaco','MC','MCO','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'MC','Monte Carlo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'LR','La Rousse');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'LA','Larvotto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'MV','Monaco Ville');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'SM','Saint Michel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'CO','Condamine');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'LC','La Colle');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'RE','Les R�voires');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'MO','Moneghetti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (141,'FV','Fontvieille');

INSERT INTO lc_countries VALUES (142,'Mongolia','MN','MNG','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'1','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'035','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'037','??????-??? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'039','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'041','??????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'043','???? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'046','??? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'047','??? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'049','??????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'051','????????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'053','???????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'055','?????????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'057','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'059','???????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'061','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'063','????????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'064','?????????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'065','????-????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'067','?????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'069','?????????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'071','???? ????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (142,'073','???????? ?????');

INSERT INTO lc_countries VALUES (143,'Montserrat','MS','MSR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (143,'A','Saint Anthony');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (143,'G','Saint Georges');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (143,'P','Saint Peter');

INSERT INTO lc_countries VALUES (144,'Morocco','MA','MAR','');

INSERT INTO lc_countries VALUES (145,'Mozambique','MZ','MOZ','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'A','Niassa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'B','Manica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'G','Gaza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'I','Inhambane');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'L','Maputo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'MPM','Maputo cidade');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'N','Nampula');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'P','Cabo Delgado');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'Q','Zamb�zia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'S','Sofala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (145,'T','Tete');

INSERT INTO lc_countries VALUES (146,'Myanmar','MM','MMR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'AY','?????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'BG','????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'MG','?????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'MD','??????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'SG','???????????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'TN','???????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'YG','????????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'CH','?????????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'KC','?????????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'KH','???????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'KN','????????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'MN','????????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'RK','?????????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (146,'SH','????????????????');

INSERT INTO lc_countries VALUES (147,'Namibia','NA','NAM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'CA','Caprivi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'ER','Erongo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'HA','Hardap');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'KA','Karas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'KH','Khomas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'KU','Kunene');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OD','Otjozondjupa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OH','Omaheke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OK','Okavango');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'ON','Oshana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OS','Omusati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OT','Oshikoto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (147,'OW','Ohangwena');

INSERT INTO lc_countries VALUES (148,'Nauru','NR','NRU','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'AO','Aiwo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'AA','Anabar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'AT','Anetan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'AI','Anibare');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'BA','Baiti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'BO','Boe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'BU','Buada');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'DE','Denigomodu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'EW','Ewa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'IJ','Ijuw');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'ME','Meneng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'NI','Nibok');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'UA','Uaboe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (148,'YA','Yaren');

INSERT INTO lc_countries VALUES (149,'Nepal','NP','NPL','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'BA','Bagmati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'BH','Bheri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'DH','Dhawalagiri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'GA','Gandaki');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'JA','Janakpur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'KA','Karnali');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'KO','Kosi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'LU','Lumbini');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'MA','Mahakali');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'ME','Mechi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'NA','Narayani');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'RA','Rapti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'SA','Sagarmatha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (149,'SE','Seti');

INSERT INTO lc_countries VALUES (150,'Netherlands','NL','NLD',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'DR','Drenthe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'FL','Flevoland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'FR','Friesland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'GE','Gelderland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'GR','Groningen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'LI','Limburg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'NB','Noord-Brabant');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'NH','Noord-Holland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'OV','Overijssel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'UT','Utrecht');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'ZE','Zeeland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (150,'ZH','Zuid-Holland');

INSERT INTO lc_countries VALUES (151,'Netherlands Antilles','AN','ANT',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_countries VALUES (152,'New Caledonia','NC','NCL','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (152,'L','Province des �les');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (152,'N','Province Nord');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (152,'S','Province Sud');

INSERT INTO lc_countries VALUES (153,'New Zealand','NZ','NZL',":name\n:street_address\n:suburb\n:city :postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'AUK','Auckland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'BOP','Bay of Plenty');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'CAN','Canterbury');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'GIS','Gisborne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'HKB','Hawke\'s Bay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'MBH','Marlborough');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'MWT','Manawatu-Wanganui');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'NSN','Nelson');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'NTL','Northland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'OTA','Otago');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'STL','Southland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'TAS','Tasman');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'TKI','Taranaki');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'WGN','Wellington');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'WKO','Waikato');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (153,'WTC','West Coast');

INSERT INTO lc_countries VALUES (154,'Nicaragua','NI','NIC','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'AN','Atl�ntico Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'AS','Atl�ntico Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'BO','Boaco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'CA','Carazo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'CI','Chinandega');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'CO','Chontales');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'ES','Estel�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'GR','Granada');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'JI','Jinotega');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'LE','Le�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'MD','Madriz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'MN','Managua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'MS','Masaya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'MT','Matagalpa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'NS','Nueva Segovia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'RI','Rivas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (154,'SJ','R�o San Juan');

INSERT INTO lc_countries VALUES (155,'Niger','NE','NER','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'1','Agadez');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'2','Daffa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'3','Dosso');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'4','Maradi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'5','Tahoua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'6','Tillab�ry');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'7','Zinder');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (155,'8','Niamey');

INSERT INTO lc_countries VALUES (156,'Nigeria','NG','NGA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'AB','Abia State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'AD','Adamawa State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'AK','Akwa Ibom State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'AN','Anambra State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'BA','Bauchi State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'BE','Benue State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'BO','Borno State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'BY','Bayelsa State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'CR','Cross River State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'DE','Delta State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'EB','Ebonyi State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'ED','Edo State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'EK','Ekiti State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'EN','Enugu State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'GO','Gombe State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'IM','Imo State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'JI','Jigawa State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KB','Kebbi State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KD','Kaduna State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KN','Kano State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KO','Kogi State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KT','Katsina State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'KW','Kwara State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'LA','Lagos State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'NA','Nassarawa State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'NI','Niger State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'OG','Ogun State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'ON','Ondo State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'OS','Osun State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'OY','Oyo State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'PL','Plateau State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'RI','Rivers State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'SO','Sokoto State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'TA','Taraba State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (156,'ZA','Zamfara State');

INSERT INTO lc_countries VALUES (157,'Niue','NU','NIU','');
INSERT INTO lc_countries VALUES (158,'Norfolk Island','NF','NFK','');

INSERT INTO lc_countries VALUES (159,'Northern Mariana Islands','MP','MNP','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (159,'N','Northern Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (159,'R','Rota');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (159,'S','Saipan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (159,'T','Tinian');

INSERT INTO lc_countries VALUES (160,'Norway','NO','NOR',":name\n:street_address\nNO-:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'01','�stfold fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'02','Akershus fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'03','Oslo fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'04','Hedmark fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'05','Oppland fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'06','Buskerud fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'07','Vestfold fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'08','Telemark fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'09','Aust-Agder fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'10','Vest-Agder fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'11','Rogaland fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'12','Hordaland fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'14','Sogn og Fjordane fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'15','M�re og Romsdal fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'16','S�r-Tr�ndelag fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'17','Nord-Tr�ndelag fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'18','Nordland fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'19','Troms fylke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (160,'20','Finnmark fylke');

INSERT INTO lc_countries VALUES (161,'Oman','OM','OMN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'BA','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'DA','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'DH','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'MA','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'MU','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'SH','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'WU','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (161,'ZA','???????');

INSERT INTO lc_countries VALUES (162,'Pakistan','PK','PAK','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'BA','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'IS','????? ??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'JK','???? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'NA','????? ????? ???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'NW','???? ????? ????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'PB','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'SD','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (162,'TA','????? ?????? ????? ???');

INSERT INTO lc_countries VALUES (163,'Palau','PW','PLW','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'AM','Aimeliik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'AR','Airai');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'AN','Angaur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'HA','Hatohobei');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'KA','Kayangel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'KO','Koror');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'ME','Melekeok');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NA','Ngaraard');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NG','Ngarchelong');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'ND','Ngardmau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NT','Ngatpang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NC','Ngchesar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NR','Ngeremlengui');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'NW','Ngiwal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'PE','Peleliu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (163,'SO','Sonsorol');

INSERT INTO lc_countries VALUES (164,'Panama','PA','PAN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'1','Bocas del Toro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'2','Cocl�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'3','Col�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'4','Chiriqu�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'5','Dari�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'6','Herrera');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'7','Los Santos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'8','Panam�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'9','Veraguas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (164,'Q','Kuna Yala');

INSERT INTO lc_countries VALUES (165,'Papua New Guinea','PG','PNG','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'CPK','Chimbu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'CPM','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'EBR','East New Britain');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'EHG','Eastern Highlands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'EPW','Enga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'ESW','East Sepik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'GPK','Gulf');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'MBA','Milne Bay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'MPL','Morobe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'MPM','Madang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'MRL','Manus');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'NCD','National Capital District');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'NIK','New Ireland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'NPP','Northern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'NSA','North Solomons');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'SAN','Sandaun');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'SHM','Southern Highlands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'WBK','West New Britain');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'WHM','Western Highlands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (165,'WPD','Western');

INSERT INTO lc_countries VALUES (166,'Paraguay','PY','PRY','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'1','Concepci�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'2','San Pedro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'3','Cordillera');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'4','Guair�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'5','Caaguaz�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'6','Caazap�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'7','Itap�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'8','Misiones');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'9','Paraguar�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'10','Alto Paran�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'11','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'12','�eembuc�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'13','Amambay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'14','Canindey�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'15','Presidente Hayes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'16','Alto Paraguay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'19','Boquer�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (166,'ASU','Asunci�n');

INSERT INTO lc_countries VALUES (167,'Peru','PE','PER','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'AMA','Amazonas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'ANC','Ancash');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'APU','Apur�mac');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'ARE','Arequipa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'AYA','Ayacucho');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'CAJ','Cajamarca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'CAL','Callao');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'CUS','Cuzco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'HUC','Hu�nuco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'HUV','Huancavelica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'ICA','Ica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'JUN','Jun�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'LAL','La Libertad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'LAM','Lambayeque');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'LIM','Lima');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'LOR','Loreto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'MDD','Madre de Dios');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'MOQ','Moquegua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'PAS','Pasco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'PIU','Piura');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'PUN','Puno');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'SAM','San Mart�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'TAC','Tacna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'TUM','Tumbes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (167,'UCA','Ucayali');

INSERT INTO lc_countries VALUES (168,'Philippines','PH','PHL','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ABR','Abra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'AGN','Agusan del Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'AGS','Agusan del Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'AKL','Aklan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ALB','Albay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ANT','Antique');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'APA','Apayao');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'AUR','Aurora');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BAN','Bataan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BAS','Basilan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BEN','Benguet');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BIL','Biliran');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BOH','Bohol');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BTG','Batangas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BTN','Batanes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BUK','Bukidnon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'BUL','Bulacan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAG','Cagayan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAM','Camiguin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAN','Camarines Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAP','Capiz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAS','Camarines Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAT','Catanduanes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CAV','Cavite');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'CEB','Cebu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'COM','Compostela Valley');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'DAO','Davao Oriental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'DAS','Davao del Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'DAV','Davao del Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'EAS','Eastern Samar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'GUI','Guimaras');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'IFU','Ifugao');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ILI','Iloilo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ILN','Ilocos Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ILS','Ilocos Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ISA','Isabela');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'KAL','Kalinga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LAG','Laguna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LAN','Lanao del Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LAS','Lanao del Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LEY','Leyte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'LUN','La Union');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MAD','Marinduque');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MAG','Maguindanao');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MAS','Masbate');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MDC','Mindoro Occidental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MDR','Mindoro Oriental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MOU','Mountain Province');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MSC','Misamis Occidental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'MSR','Misamis Oriental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NCO','Cotabato');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NSA','Northern Samar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NEC','Negros Occidental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NER','Negros Oriental');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NUE','Nueva Ecija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'NUV','Nueva Vizcaya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'PAM','Pampanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'PAN','Pangasinan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'PLW','Palawan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'QUE','Quezon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'QUI','Quirino');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'RIZ','Rizal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ROM','Romblon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SAR','Sarangani');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SCO','South Cotabato');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SIG','Siquijor');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SLE','Southern Leyte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SLU','Sulu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SOR','Sorsogon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SUK','Sultan Kudarat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SUN','Surigao del Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'SUR','Surigao del Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'TAR','Tarlac');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'TAW','Tawi-Tawi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'WSA','Samar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ZAN','Zamboanga del Norte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ZAS','Zamboanga del Sur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ZMB','Zambales');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (168,'ZSI','Zamboanga Sibugay');

INSERT INTO lc_countries VALUES (169,'Pitcairn','PN','PCN','');

INSERT INTO lc_countries VALUES (170,'Poland','PL','POL',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'DS','Dolnoslaskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'KP','Kujawsko-Pomorskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'LU','Lubelskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'LB','Lubuskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'LD','L�dzkie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'MA','Malopolskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'MZ','Mazowieckie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'OP','Opolskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'PK','Podkarpackie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'PD','Podlaskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'PM','Pomorskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'SL','Slaskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'SK','Swietokrzyskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'WN','Warminsko-Mazurskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'WP','Wielkopolskie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (170,'ZP','Zachodniopomorskie');

INSERT INTO lc_countries VALUES (171,'Portugal','PT','PRT',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'01','Aveiro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'02','Beja');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'03','Braga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'04','Bragan�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'05','Castelo Branco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'06','Coimbra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'07','�vora');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'08','Faro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'09','Guarda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'10','Leiria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'11','Lisboa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'12','Portalegre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'13','Porto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'14','Santar�m');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'15','Set�bal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'16','Viana do Castelo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'17','Vila Real');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'18','Viseu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'20','Regi�o Aut�noma dos A�ores');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (171,'30','Regi�o Aut�noma da Madeira');

INSERT INTO lc_countries VALUES (172,'Puerto Rico','PR','PRI','');

INSERT INTO lc_countries VALUES (173,'Qatar','QA','QAT','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'DA','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'GH','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'JB','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'JU','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'KH','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'ME','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'MS','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'RA','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'US','?? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (173,'WA','??????');

INSERT INTO lc_countries VALUES (174,'Reunion','RE','REU','');

INSERT INTO lc_countries VALUES (175,'Romania','RO','ROM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'AB','Alba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'AG','Arges');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'AR','Arad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'B','Bucuresti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BC','Bacau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BH','Bihor');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BN','Bistrita-Nasaud');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BR','Braila');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BT','Botosani');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BV','Brasov');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'BZ','Buzau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CJ','Cluj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CL','Calarasi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CS','Caras-Severin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CT','Constanta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'CV','Covasna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'DB','D�mbovita');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'DJ','Dolj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'GJ','Gorj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'GL','Galati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'GR','Giurgiu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'HD','Hunedoara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'HG','Harghita');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'IF','Ilfov');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'IL','Ialomita');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'IS','Iasi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'MH','Mehedinti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'MM','Maramures');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'MS','Mures');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'NT','Neamt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'OT','Olt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'PH','Prahova');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'SB','Sibiu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'SJ','Salaj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'SM','Satu Mare');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'SV','Suceava');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'TL','Tulcea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'TM','Timis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'TR','Teleorman');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'VL','V�lcea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'VN','Vrancea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (175,'VS','Vaslui');

INSERT INTO lc_countries VALUES (176,'Russia','RU','RUS',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'AD','?????�? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'AGB','???�?????-????�????? ??????�???? ?�????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'AL','????�? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ALT','????�????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'AMU','???�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ARK','????�????????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'AST','???????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'BA','???????????�? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'BEL','???????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'BRY','???�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'BU','????�??? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'CE','????�????? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'CHE','????�??????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'CHI','????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'CHU','????�????? ??????�???? ?�????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'CU','????�????? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'DA','???????�? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'EVE','??????�????? ??????�???? ?�????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'IN','??????�??? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'IRK','????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'IVA','???�??????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KAM','?????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KB','???????�??-?????�????? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KC','??????�???-?????�????? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KDA','????????�????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KEM','??�????????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KGD','??????????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KGN','?????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KHA','????�??????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KHM','??�???-?????�????? ??????�???? ?�????�????�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KIA','???????�????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KIR','??�??????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KK','????�???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KL','?????�??? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KLU','????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KO','??�?? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KOR','????�????? ??????�???? ?�????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KOS','??????????�? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KR','????�??? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'KRS','??�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'LEN','????????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'LIP','??�?????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MAG','??????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ME','????�? ?? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MO','?????�??? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MOS','?????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MOW','??????�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'MUR','??�???????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'NEN','????�???? ??????�???? ?�????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'NGR','???????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'NIZ','????????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'NVS','????????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'OMS','?�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ORE','??????�?????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ORL','????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'PNZ','??�???????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'PRI','?????�????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'PSK','????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ROS','?????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'RYA','????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SA','????� (???�???) ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SAK','??????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SAM','????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SAR','????�??????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SE','??�?????? ???�???�???�??? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SMO','????�?????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SPE','?????-???????�??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'STA','????????�?????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'SVE','???????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TA','?????�????? ????????�?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TAM','?????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TAY','?????�????? ??????�???? ?�????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TOM','??�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TUL','??�?????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TVE','???????�? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TY','????� ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'TYU','????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'UD','????�?????? ?????�?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'ULY','????�??????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'UOB','????-????�????? ????�????? ??????�???? ?�????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'VGG','????????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'VLA','?????�??????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'VLG','??????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'VOR','????�??????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'XXX','??�?????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'YAN','???�??-????�???? ??????�???? ?�????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'YAR','??????�????? ?�??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (176,'YEV','????�????? ??????�???? ?�??????');

INSERT INTO lc_countries VALUES (177,'Rwanda','RW','RWA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'N','Nord');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'E','Est');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'S','Sud');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'O','Ouest');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (177,'K','Kigali');

INSERT INTO lc_countries VALUES (178,'Saint Kitts and Nevis','KN','KNA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (178,'K','Saint Kitts');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (178,'N','Nevis');

INSERT INTO lc_countries VALUES (179,'Saint Lucia','LC','LCA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'AR','Anse-la-Raye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'CA','Castries');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'CH','Choiseul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'DA','Dauphin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'DE','Dennery');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'GI','Gros-Islet');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'LA','Laborie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'MI','Micoud');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'PR','Praslin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'SO','Soufriere');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (179,'VF','Vieux-Fort');

INSERT INTO lc_countries VALUES (180,'Saint Vincent and the Grenadines','VC','VCT','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'C','Charlotte');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'R','Grenadines');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'A','Saint Andrew');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'D','Saint David');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'G','Saint George');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (180,'P','Saint Patrick');

INSERT INTO lc_countries VALUES (181,'Samoa','WS','WSM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'AA','A\'ana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'AL','Aiga-i-le-Tai');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'AT','Atua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'FA','Fa\'asaleleaga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'GE','Gaga\'emauga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'GI','Gaga\'ifomauga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'PA','Palauli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'SA','Satupa\'itea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'TU','Tuamasaga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'VF','Va\'a-o-Fonoti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (181,'VS','Vaisigano');

INSERT INTO lc_countries VALUES (182,'San Marino','SM','SMR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'AC','Acquaviva');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'BM','Borgo Maggiore');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'CH','Chiesanuova');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'DO','Domagnano');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'FA','Faetano');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'FI','Fiorentino');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'MO','Montegiardino');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'SM','Citta di San Marino');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (182,'SE','Serravalle');

INSERT INTO lc_countries VALUES (183,'Sao Tome and Principe','ST','STP','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (183,'P','Pr�ncipe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (183,'S','S�o Tom�');

INSERT INTO lc_countries VALUES (184,'Saudi Arabia','SA','SAU','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'01','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'02','??? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'03','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'04','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'05','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'06','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'07','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'08','?????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'09','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'10','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'11','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'12','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (184,'14','????');

INSERT INTO lc_countries VALUES (185,'Senegal','SN','SEN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'DA','Dakar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'DI','Diourbel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'FA','Fatick');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'KA','Kaolack');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'KO','Kolda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'LO','Louga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'MA','Matam');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'SL','Saint-Louis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'TA','Tambacounda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'TH','Thies ');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (185,'ZI','Ziguinchor');

INSERT INTO lc_countries VALUES (186,'Seychelles','SC','SYC','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AP','Anse aux Pins');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AB','Anse Boileau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AE','Anse Etoile');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AL','Anse Louis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'AR','Anse Royale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BL','Baie Lazare');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BS','Baie Sainte Anne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BV','Beau Vallon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BA','Bel Air');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'BO','Bel Ombre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'CA','Cascade');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'GL','Glacis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'GM','Grand\' Anse (on Mahe)');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'GP','Grand\' Anse (on Praslin)');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'DG','La Digue');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'RA','La Riviere Anglaise');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'MB','Mont Buxton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'MF','Mont Fleuri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'PL','Plaisance');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'PR','Pointe La Rue');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'PG','Port Glaud');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'SL','Saint Louis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (186,'TA','Takamaka');

INSERT INTO lc_countries VALUES (187,'Sierra Leone','SL','SLE','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (187,'E','Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (187,'N','Northern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (187,'S','Southern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (187,'W','Western');

INSERT INTO lc_countries VALUES (188,'Singapore','SG','SGP', ":name\n:street_address\n:city :postcode\n:country");

INSERT INTO lc_countries VALUES (189,'Slovakia','SK','SVK','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'BC','Banskobystrick� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'BL','Bratislavsk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'KI','Ko�ick� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'NJ','Nitriansk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'PV','Pre�ovsk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'TA','Trnavsk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'TC','Trenciansk� kraj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (189,'ZI','�ilinsk� kraj');

INSERT INTO lc_countries VALUES (190,'Slovenia','SI','SVN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'001','Ajdov�cina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'002','Beltinci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'003','Bled');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'004','Bohinj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'005','Borovnica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'006','Bovec');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'007','Brda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'008','Brezovica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'009','Bre�ice');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'010','Ti�ina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'011','Celje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'012','Cerklje na Gorenjskem');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'013','Cerknica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'014','Cerkno');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'015','Cren�ovci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'016','Crna na Koro�kem');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'017','Crnomelj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'018','Destrnik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'019','Divaca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'020','Dobrepolje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'021','Dobrova-Polhov Gradec');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'022','Dol pri Ljubljani');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'023','Dom�ale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'024','Dornava');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'025','Dravograd');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'026','Duplek');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'027','Gorenja vas-Poljane');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'028','Gori�nica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'029','Gornja Radgona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'030','Gornji Grad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'031','Gornji Petrovci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'032','Grosuplje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'033','�alovci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'034','Hrastnik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'035','Hrpelje-Kozina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'036','Idrija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'037','Ig');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'038','Ilirska Bistrica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'039','Ivancna Gorica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'040','Izola');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'041','Jesenice');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'042','Jur�inci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'043','Kamnik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'044','Kanal ob Soci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'045','Kidricevo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'046','Kobarid');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'047','Kobilje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'048','Kocevje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'049','Komen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'050','Koper');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'051','Kozje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'052','Kranj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'053','Kranjska Gora');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'054','Kr�ko');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'055','Kungota');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'056','Kuzma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'057','La�ko');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'058','Lenart');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'059','Lendava');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'060','Litija');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'061','Ljubljana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'062','Ljubno');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'063','Ljutomer');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'064','Logatec');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'065','Lo�ka Dolina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'066','Lo�ki Potok');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'067','Luce');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'068','Lukovica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'069','Maj�perk');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'070','Maribor');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'071','Medvode');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'072','Menge�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'073','Metlika');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'074','Me�ica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'075','Miren-Kostanjevica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'076','Mislinja');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'077','Moravce');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'078','Moravske Toplice');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'079','Mozirje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'080','Murska Sobota');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'081','Muta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'082','Naklo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'083','Nazarje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'084','Nova Gorica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'085','Novo mesto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'086','Odranci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'087','Ormo�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'088','Osilnica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'089','Pesnica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'090','Piran');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'091','Pivka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'092','Podcetrtek');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'093','Podvelka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'094','Postojna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'095','Preddvor');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'096','Ptuj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'097','Puconci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'098','Race-Fram');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'099','Radece');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'100','Radenci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'101','Radlje ob Dravi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'102','Radovljica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'103','Ravne na Koro�kem');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'104','Ribnica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'106','Roga�ka Slatina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'105','Roga�ovci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'107','Rogatec');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'108','Ru�e');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'109','Semic');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'110','Sevnica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'111','Se�ana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'112','Slovenj Gradec');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'113','Slovenska Bistrica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'114','Slovenske Konjice');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'115','Star�e');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'116','Sveti Jurij');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'117','�encur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'118','�entilj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'119','�entjernej');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'120','�entjur pri Celju');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'121','�kocjan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'122','�kofja Loka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'123','�kofljica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'124','�marje pri Jel�ah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'125','�martno ob Paki');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'126','�o�tanj');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'127','�tore');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'128','Tolmin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'129','Trbovlje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'130','Trebnje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'131','Tr�ic');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'132','Turni�ce');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'133','Velenje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'134','Velike La�ce');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'135','Videm');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'136','Vipava');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'137','Vitanje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'138','Vodice');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'139','Vojnik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'140','Vrhnika');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'141','Vuzenica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'142','Zagorje ob Savi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'143','Zavrc');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'144','Zrece');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'146','�elezniki');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'147','�iri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'148','Benedikt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'149','Bistrica ob Sotli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'150','Bloke');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'151','Braslovce');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'152','Cankova');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'153','Cerkvenjak');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'154','Dobje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'155','Dobrna');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'156','Dobrovnik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'157','Dolenjske Toplice');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'158','Grad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'159','Hajdina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'160','Hoce-Slivnica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'161','Hodo�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'162','Horjul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'163','Jezersko');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'164','Komenda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'165','Kostel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'166','Kri�evci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'167','Lovrenc na Pohorju');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'168','Markovci');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'169','Miklav� na Dravskem polju');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'170','Mirna Pec');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'171','Oplotnica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'172','Podlehnik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'173','Polzela');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'174','Prebold');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'175','Prevalje');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'176','Razkri�je');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'177','Ribnica na Pohorju');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'178','Selnica ob Dravi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'179','Sodra�ica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'180','Solcava');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'181','Sveta Ana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'182','Sveti Andra� v Slovenskih goricah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'183','�empeter-Vrtojba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'184','Tabor');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'185','Trnovska vas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'186','Trzin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'187','Velika Polana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'188','Ver�ej');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'189','Vransko');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'190','�alec');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'191','�etale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'192','�irovnica');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'193','�u�emberk');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (190,'194','�martno pri Litiji');

INSERT INTO lc_countries VALUES (191,'Solomon Islands','SB','SLB','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'CE','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'CH','Choiseul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'GC','Guadalcanal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'HO','Honiara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'IS','Isabel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'MK','Makira');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'ML','Malaita');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'RB','Rennell and Bellona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'TM','Temotu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (191,'WE','Western');

INSERT INTO lc_countries VALUES (192,'Somalia','SO','SOM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'AD','Awdal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'BK','Bakool');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'BN','Banaadir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'BR','Bari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'BY','Bay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'GD','Gedo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'GG','Galguduud');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'HR','Hiiraan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'JD','Jubbada Dhexe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'JH','Jubbada Hoose');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'MD','Mudug');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'NG','Nugaal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'SD','Shabeellaha Dhexe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'SG','Sanaag');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'SH','Shabeellaha Hoose');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'SL','Sool');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'TG','Togdheer');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (192,'WG','Woqooyi Galbeed');

INSERT INTO lc_countries VALUES (193,'South Africa','ZA','ZAF',":name\n:street_address\n:suburb\n:city\n:postcode :country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'EC','Eastern Cape');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'FS','Free State');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'GT','Gauteng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'LP','Limpopo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'MP','Mpumalanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'NC','Northern Cape');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'NL','KwaZulu-Natal');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'NW','North-West');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (193,'WC','Western Cape');

INSERT INTO lc_countries VALUES (194,'South Georgia and the South Sandwich Islands','GS','SGS','');

INSERT INTO lc_countries VALUES (195,'Spain','ES','ESP',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AN','Andaluc�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AR','Arag�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'A','Alicante');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AB','Albacete');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AL','Almer�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AN','Andaluc�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'AV','�vila');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'B','Barcelona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'BA','Badajoz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'BI','Vizcaya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'BU','Burgos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'C','A Coru�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CA','C�diz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CC','C�ceres');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CE','Ceuta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CL','Castilla y Le�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CM','Castilla-La Mancha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CN','Islas Canarias');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CO','C�rdoba');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CR','Ciudad Real');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CS','Castell�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CT','Catalonia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'CU','Cuenca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'EX','Extremadura');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GA','Galicia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GC','Las Palmas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GI','Girona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GR','Granada');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'GU','Guadalajara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'H','Huelva');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'HU','Huesca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'IB','Islas Baleares');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'J','Ja�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'L','Lleida');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'LE','Le�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'LO','La Rioja');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'LU','Lugo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'M','Madrid');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'MA','M�laga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'ML','Melilla');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'MU','Murcia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'NA','Navarre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'O','Asturias');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'OR','Ourense');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'P','Palencia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'PM','Baleares');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'PO','Pontevedra');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'PV','Basque Euskadi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'S','Cantabria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SA','Salamanca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SE','Seville');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SG','Segovia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SO','Soria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'SS','Guip�zcoa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'T','Tarragona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'TE','Teruel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'TF','Santa Cruz De Tenerife');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'TO','Toledo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'V','Valencia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'VA','Valladolid');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'VI','�lava');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'Z','Zaragoza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (195,'ZA','Zamora');

INSERT INTO lc_countries VALUES (196,'Sri Lanka','LK','LKA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'CE','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'NC','North Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'NO','North');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'EA','Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'NW','North Western');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'SO','Southern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'UV','Uva');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'SA','Sabaragamuwa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (196,'WE','Western');

INSERT INTO lc_countries VALUES (197,'St. Helena','SH','SHN','');
INSERT INTO lc_countries VALUES (198,'St. Pierre and Miquelon','PM','SPM','');

INSERT INTO lc_countries VALUES (199,'Sudan','SD','SDN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'ANL','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'BAM','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'BRT','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'JZR','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'KRT','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'QDR','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'WDH','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'ANB','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'ANZ','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'ASH','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'BJA','?????????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'GIS','??? ??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'GBG','??? ??? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'GDA','??? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'GKU','??? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'JDA','???? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'JKU','???? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'JQL','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'KSL','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'NNL','????? ??? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SBG','???? ??? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SDA','???? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SKU','???? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SIS','??? ??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'SNR','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (199,'WRB','?????');

INSERT INTO lc_countries VALUES (200,'Suriname','SR','SUR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'BR','Brokopondo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'CM','Commewijne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'CR','Coronie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'MA','Marowijne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'NI','Nickerie');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'PM','Paramaribo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'PR','Para');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'SA','Saramacca');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'SI','Sipaliwini');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (200,'WA','Wanica');

INSERT INTO lc_countries VALUES (201,'Svalbard and Jan Mayen Islands','SJ','SJM','');

INSERT INTO lc_countries VALUES (202,'Swaziland','SZ','SWZ','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (202,'HH','Hhohho');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (202,'LU','Lubombo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (202,'MA','Manzini');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (202,'SH','Shiselweni');

INSERT INTO lc_countries VALUES (203,'Sweden','SE','SWE',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'AB','Stockholms l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'C','Uppsala l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'D','S�dermanlands l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'E','�sterg�tlands l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'F','J�nk�pings l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'G','Kronobergs l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'H','Kalmar l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'I','Gotlands l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'K','Blekinge l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'M','Sk�ne l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'N','Hallands l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'O','V�stra G�talands l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'S','V�rmlands l�n;');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'T','�rebro l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'U','V�stmanlands l�n;');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'W','Dalarnas l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'X','G�vleborgs l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'Y','V�sternorrlands l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'Z','J�mtlands l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'AC','V�sterbottens l�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (203,'BD','Norrbottens l�n');

INSERT INTO lc_countries VALUES (204,'Switzerland','CH','CHE',":name\n:street_address\n:postcode :city\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'ZH','Z�rich');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'BE','Bern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'LU','Luzern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'UR','Uri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'SZ','Schwyz');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'OW','Obwalden');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'NW','Nidwalden');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'GL','Glasrus');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'ZG','Zug');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'FR','Fribourg');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'SO','Solothurn');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'BS','Basel-Stadt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'BL','Basel-Landschaft');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'SH','Schaffhausen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'AR','Appenzell Ausserrhoden');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'AI','Appenzell Innerrhoden');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'SG','Saint Gallen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'GR','Graub�nden');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'AG','Aargau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'TG','Thurgau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'TI','Ticino');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'VD','Vaud');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'VS','Valais');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'NE','Nuech�tel');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'GE','Gen�ve');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (204,'JU','Jura');

INSERT INTO lc_countries VALUES (205,'Syrian Arab Republic','SY','SYR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'DI','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'DR','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'DZ','??? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'HA','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'HI','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'HL','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'HM','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'ID','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'LA','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'QU','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'RA','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'RD','??? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'SU','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (205,'TA','?????');

INSERT INTO lc_countries VALUES (206,'Taiwan','TW','TWN',":name\n:street_address\n:city :postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'CHA','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'CYI','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'CYQ','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'HSQ','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'HSZ','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'HUA','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'ILA','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'KEE','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'KHH','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'KHQ','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'MIA','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'NAN','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'PEN','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'PIF','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TAO','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TNN','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TNQ','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TPE','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TPQ','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TTT','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TXG','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'TXQ','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (206,'YUN','???');

INSERT INTO lc_countries VALUES (207,'Tajikistan','TJ','TJK','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (207,'GB','??????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (207,'KT','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (207,'SU','???');

INSERT INTO lc_countries VALUES (208,'Tanzania','TZ','TZA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'01','Arusha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'02','Dar es Salaam');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'03','Dodoma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'04','Iringa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'05','Kagera');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'06','Pemba Sever');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'07','Zanzibar Sever');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'08','Kigoma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'09','Kilimanjaro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'10','Pemba Jih');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'11','Zanzibar Jih');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'12','Lindi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'13','Mara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'14','Mbeya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'15','Zanzibar Z�pad');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'16','Morogoro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'17','Mtwara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'18','Mwanza');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'19','Pwani');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'20','Rukwa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'21','Ruvuma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'22','Shinyanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'23','Singida');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'24','Tabora');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'25','Tanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (208,'26','Manyara');

INSERT INTO lc_countries VALUES (209,'Thailand','TH','THA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-10','?????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-11','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-12','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-13','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-14','???????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-15','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-16','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-17','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-18','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-19','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-20','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-21','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-22','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-23','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-24','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-25','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-26','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-27','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-30','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-31','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-32','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-33','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-34','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-35','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-36','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-37','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-39','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-40','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-41','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-42','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-43','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-44','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-45','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-46','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-47','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-48','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-49','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-50','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-51','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-52','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-53','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-55','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-56','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-57','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-58','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-60','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-61','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-62','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-63','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-64','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-66','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-67','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-70','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-71','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-72','??????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-73','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-74','?????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-75','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-76','????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-77','???????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-80','?????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-81','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-82','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-83','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-84','????????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-85','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-86','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-90','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-91','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-92','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-93','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-94','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-95','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (209,'TH-96','????????');

INSERT INTO lc_countries VALUES (210,'Togo','TG','TGO','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'C','Centrale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'K','Kara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'M','Maritime');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'P','Plateaux');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (210,'S','Savanes');

INSERT INTO lc_countries VALUES (211,'Tokelau','TK','TKL','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (211,'A','Atafu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (211,'F','Fakaofo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (211,'N','Nukunonu');

INSERT INTO lc_countries VALUES (212,'Tonga','TO','TON','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (212,'H','Ha\'apai');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (212,'T','Tongatapu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (212,'V','Vava\'u');

INSERT INTO lc_countries VALUES (213,'Trinidad and Tobago','TT','TTO','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'ARI','Arima');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'CHA','Chaguanas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'CTT','Couva-Tabaquite-Talparo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'DMN','Diego Martin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'ETO','Eastern Tobago');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'RCM','Rio Claro-Mayaro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'PED','Penal-Debe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'PTF','Point Fortin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'POS','Port of Spain');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'PRT','Princes Town');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'SFO','San Fernando');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'SGE','Sangre Grande');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'SJL','San Juan-Laventille');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'SIP','Siparia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'TUP','Tunapuna-Piarco');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (213,'WTO','Western Tobago');

INSERT INTO lc_countries VALUES (214,'Tunisia','TN','TUN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'11','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'12','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'13','????? ?? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'14','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'21','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'22','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'23','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'31','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'32','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'33','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'34','????? ??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'41','????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'42','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'43','????? ???? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'51','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'52','????? ????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'53','????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'61','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'71','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'72','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'73','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'81','????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'82','????? ?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (214,'83','????? ??????');

INSERT INTO lc_countries VALUES (215,'Turkey','TR','TUR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'01','Adana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'02','Adiyaman');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'03','Afyonkarahisar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'04','Agri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'05','Amasya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'06','Ankara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'07','Antalya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'08','Artvin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'09','Aydin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'10','Balikesir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'11','Bilecik');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'12','Bing�l');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'13','Bitlis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'14','Bolu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'15','Burdur');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'16','Bursa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'17','�anakkale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'18','�ankiri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'19','�orum');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'20','Denizli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'21','Diyarbakir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'22','Edirne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'23','Elazig');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'24','Erzincan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'25','Erzurum');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'26','Eskisehir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'27','Gaziantep');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'28','Giresun');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'29','G�m�shane');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'30','Hakkari');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'31','Hatay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'32','Isparta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'33','Mersin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'34','Istanbul');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'35','Izmir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'36','Kars');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'37','Kastamonu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'38','Kayseri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'39','Kirklareli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'40','Kirsehir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'41','Kocaeli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'42','Konya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'43','K�tahya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'44','Malatya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'45','Manisa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'46','Kahramanmaras');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'47','Mardin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'48','Mugla');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'49','Mus');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'50','Nevsehir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'51','Nigde');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'52','Ordu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'53','Rize');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'54','Sakarya');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'55','Samsun');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'56','Siirt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'57','Sinop');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'58','Sivas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'59','Tekirdag');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'60','Tokat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'61','Trabzon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'62','Tunceli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'63','Sanliurfa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'64','Usak');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'65','Van');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'66','Yozgat');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'67','Zonguldak');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'68','Aksaray');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'69','Bayburt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'70','Karaman');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'71','Kirikkale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'72','Batman');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'73','Sirnak');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'74','Bartin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'75','Ardahan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'76','Igdir');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'77','Yalova');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'78','Karab�k');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'79','Kilis');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'80','Osmaniye');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (215,'81','D�zce');

INSERT INTO lc_countries VALUES (216,'Turkmenistan','TM','TKM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'A','Ahal wela�aty');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'B','Balkan wela�aty');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'D','Dasoguz wela�aty');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'L','Lebap wela�aty');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (216,'M','Mary wela�aty');

INSERT INTO lc_countries VALUES (217,'Turks and Caicos Islands','TC','TCA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'AC','Ambergris Cays');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'DC','Dellis Cay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'FC','French Cay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'LW','Little Water Cay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'RC','Parrot Cay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'PN','Pine Cay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'SL','Salt Cay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'GT','Grand Turk');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'SC','South Caicos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'EC','East Caicos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'MC','Middle Caicos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'NC','North Caicos');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'PR','Providenciales');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (217,'WC','West Caicos');

INSERT INTO lc_countries VALUES (218,'Tuvalu','TV','TUV','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'FUN','Funafuti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NMA','Nanumea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NMG','Nanumanga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NIT','Niutao');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NIU','Nui');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NKF','Nukufetau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'NKL','Nukulaelae');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (218,'VAI','Vaitupu');

INSERT INTO lc_countries VALUES (219,'Uganda','UG','UGA','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'101','Kalangala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'102','Kampala');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'103','Kiboga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'104','Luwero');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'105','Masaka');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'106','Mpigi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'107','Mubende');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'108','Mukono');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'109','Nakasongola');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'110','Rakai');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'111','Sembabule');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'112','Kayunga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'113','Wakiso');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'201','Bugiri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'202','Busia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'203','Iganga');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'204','Jinja');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'205','Kamuli');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'206','Kapchorwa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'207','Katakwi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'208','Kumi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'209','Mbale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'210','Pallisa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'211','Soroti');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'212','Tororo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'213','Kaberamaido');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'214','Mayuge');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'215','Sironko');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'301','Adjumani');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'302','Apac');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'303','Arua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'304','Gulu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'305','Kitgum');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'306','Kotido');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'307','Lira');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'308','Moroto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'309','Moyo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'310','Nebbi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'311','Nakapiripirit');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'312','Pader');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'313','Yumbe');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'401','Bundibugyo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'402','Bushenyi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'403','Hoima');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'404','Kabale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'405','Kabarole');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'406','Kasese');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'407','Kibale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'408','Kisoro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'409','Masindi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'410','Mbarara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'411','Ntungamo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'412','Rukungiri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'413','Kamwenge');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'414','Kanungu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (219,'415','Kyenjojo');

INSERT INTO lc_countries VALUES (220,'Ukraine','UA','UKR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'05','????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'07','????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'09','????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'12','???????????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'14','???????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'18','??????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'19','?????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'21','???????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'23','?????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'26','?????-??????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'30','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'32','???????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'35','?????????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'40','???????????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'43','?????????? ?????????? ????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'46','????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'48','???????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'51','??????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'53','?????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'59','??????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'61','????????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'63','?????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'65','?????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'68','??????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'71','????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'74','???????????? ???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (220,'77','??????????? ???????');

INSERT INTO lc_countries VALUES (221,'United Arab Emirates','AE','ARE','');

INSERT INTO lc_countries VALUES (222,'United Kingdom','GB','GBR',":name\n:street_address\n:city\n:postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ABD','Aberdeenshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ABE','Aberdeen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'AGB','Argyll and Bute');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'AGY','Isle of Anglesey');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ANS','Angus');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ANT','Antrim');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ARD','Ards');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ARM','Armagh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BAS','Bath and North East Somerset');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BBD','Blackburn with Darwen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BDF','Bedfordshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BDG','Barking and Dagenham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BEN','Brent');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BEX','Bexley');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BFS','Belfast');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BGE','Bridgend');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BGW','Blaenau Gwent');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BIR','Birmingham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BKM','Buckinghamshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BLA','Ballymena');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BLY','Ballymoney');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BMH','Bournemouth');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BNB','Banbridge');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BNE','Barnet');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BNH','Brighton and Hove');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BNS','Barnsley');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BOL','Bolton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BPL','Blackpool');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BRC','Bracknell');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BRD','Bradford');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BRY','Bromley');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BST','Bristol');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'BUR','Bury');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CAM','Cambridgeshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CAY','Caerphilly');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CGN','Ceredigion');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CGV','Craigavon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CHS','Cheshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CKF','Carrickfergus');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CKT','Cookstown');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CLD','Calderdale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CLK','Clackmannanshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CLR','Coleraine');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CMA','Cumbria');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CMD','Camden');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CMN','Carmarthenshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CON','Cornwall');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'COV','Coventry');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CRF','Cardiff');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CRY','Croydon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CSR','Castlereagh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'CWY','Conwy');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DAL','Darlington');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DBY','Derbyshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DEN','Denbighshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DER','Derby');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DEV','Devon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DGN','Dungannon and South Tyrone');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DGY','Dumfries and Galloway');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DNC','Doncaster');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DND','Dundee');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DOR','Dorset');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DOW','Down');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DRY','Derry');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DUD','Dudley');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'DUR','Durham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'EAL','Ealing');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'EAY','East Ayrshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'EDH','Edinburgh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'EDU','East Dunbartonshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ELN','East Lothian');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ELS','Eilean Siar');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ENF','Enfield');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ERW','East Renfrewshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ERY','East Riding of Yorkshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ESS','Essex');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ESX','East Sussex');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'FAL','Falkirk');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'FER','Fermanagh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'FIF','Fife');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'FLN','Flintshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GAT','Gateshead');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GLG','Glasgow');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GLS','Gloucestershire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GRE','Greenwich');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GSY','Guernsey');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'GWN','Gwynedd');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HAL','Halton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HAM','Hampshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HAV','Havering');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HCK','Hackney');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HEF','Herefordshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HIL','Hillingdon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HLD','Highland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HMF','Hammersmith and Fulham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HNS','Hounslow');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HPL','Hartlepool');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HRT','Hertfordshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HRW','Harrow');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'HRY','Haringey');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'IOS','Isles of Scilly');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'IOW','Isle of Wight');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ISL','Islington');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'IVC','Inverclyde');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'JSY','Jersey');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KEC','Kensington and Chelsea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KEN','Kent');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KHL','Kingston upon Hull');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KIR','Kirklees');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KTT','Kingston upon Thames');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'KWL','Knowsley');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LAN','Lancashire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LBH','Lambeth');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LCE','Leicester');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LDS','Leeds');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LEC','Leicestershire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LEW','Lewisham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LIN','Lincolnshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LIV','Liverpool');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LMV','Limavady');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LND','London');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LRN','Larne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LSB','Lisburn');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'LUT','Luton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MAN','Manchester');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MDB','Middlesbrough');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MDX','Middlesex');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MDW','Medway');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MFT','Magherafelt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MIK','Milton Keynes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MLN','Midlothian');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MON','Monmouthshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MRT','Merton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MRY','Moray');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MTY','Merthyr Tydfil');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'MYL','Moyle');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NAY','North Ayrshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NBL','Northumberland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NDN','North Down');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NEL','North East Lincolnshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NET','Newcastle upon Tyne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NFK','Norfolk');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NGM','Nottingham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NLK','North Lanarkshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NLN','North Lincolnshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NSM','North Somerset');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTA','Newtownabbey');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTH','Northamptonshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTL','Neath Port Talbot');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTT','Nottinghamshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NTY','North Tyneside');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NWM','Newham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NWP','Newport');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NYK','North Yorkshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'NYM','Newry and Mourne');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'OLD','Oldham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'OMH','Omagh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ORK','Orkney Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'OXF','Oxfordshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'PEM','Pembrokeshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'PKN','Perth and Kinross');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'PLY','Plymouth');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'POL','Poole');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'POR','Portsmouth');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'POW','Powys');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'PTE','Peterborough');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RCC','Redcar and Cleveland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RCH','Rochdale');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RCT','Rhondda Cynon Taf');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RDB','Redbridge');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RDG','Reading');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RFW','Renfrewshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RIC','Richmond upon Thames');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ROT','Rotherham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'RUT','Rutland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SAW','Sandwell');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SAY','South Ayrshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SCB','Scottish Borders');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SFK','Suffolk');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SFT','Sefton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SGC','South Gloucestershire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SHF','Sheffield');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SHN','Saint Helens');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SHR','Shropshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SKP','Stockport');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SLF','Salford');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SLG','Slough');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SLK','South Lanarkshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SND','Sunderland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SOL','Solihull');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SOM','Somerset');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SOS','Southend-on-Sea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SRY','Surrey');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STB','Strabane');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STE','Stoke-on-Trent');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STG','Stirling');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STH','Southampton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STN','Sutton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STS','Staffordshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STT','Stockton-on-Tees');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'STY','South Tyneside');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SWA','Swansea');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SWD','Swindon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'SWK','Southwark');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TAM','Tameside');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TFW','Telford and Wrekin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'THR','Thurrock');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TOB','Torbay');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TOF','Torfaen');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TRF','Trafford');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'TWH','Tower Hamlets');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'VGL','Vale of Glamorgan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WAR','Warwickshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WBK','West Berkshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WDU','West Dunbartonshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WFT','Waltham Forest');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WGN','Wigan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WIL','Wiltshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WKF','Wakefield');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WLL','Walsall');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WLN','West Lothian');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WLV','Wolverhampton');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WNM','Windsor and Maidenhead');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WOK','Wokingham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WOR','Worcestershire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WRL','Wirral');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WRT','Warrington');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WRX','Wrexham');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WSM','Westminster');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'WSX','West Sussex');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'YOR','York');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (222,'ZET','Shetland Islands');

INSERT INTO lc_countries VALUES (223,'United States of America','US','USA',":name\n:street_address\n:city :state_code :postcode\n:country");

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AK','Alaska');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AL','Alabama');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AS','American Samoa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AR','Arkansas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'AZ','Arizona');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'CA','California');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'CO','Colorado');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'CT','Connecticut');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'DC','District of Columbia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'DE','Delaware');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'FL','Florida');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'GA','Georgia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'GU','Guam');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'HI','Hawaii');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'IA','Iowa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'ID','Idaho');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'IL','Illinois');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'IN','Indiana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'KS','Kansas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'KY','Kentucky');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'LA','Louisiana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MA','Massachusetts');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MD','Maryland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'ME','Maine');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MI','Michigan');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MN','Minnesota');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MO','Missouri');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MS','Mississippi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MT','Montana');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NC','North Carolina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'ND','North Dakota');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NE','Nebraska');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NH','New Hampshire');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NJ','New Jersey');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NM','New Mexico');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NV','Nevada');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'NY','New York');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'MP','Northern Mariana Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'OH','Ohio');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'OK','Oklahoma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'OR','Oregon');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'PA','Pennsylvania');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'PR','Puerto Rico');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'RI','Rhode Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'SC','South Carolina');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'SD','South Dakota');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'TN','Tennessee');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'TX','Texas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'UM','U.S. Minor Outlying Islands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'UT','Utah');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'VA','Virginia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'VI','Virgin Islands of the U.S.');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'VT','Vermont');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'WA','Washington');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'WI','Wisconsin');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'WV','West Virginia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (223,'WY','Wyoming');

INSERT INTO lc_countries VALUES (224,'United States Minor Outlying Islands','UM','UMI','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'BI','Baker Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'HI','Howland Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'JI','Jarvis Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'JA','Johnston Atoll');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'KR','Kingman Reef');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'MA','Midway Atoll');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'NI','Navassa Island');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'PA','Palmyra Atoll');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (224,'WI','Wake Island');

INSERT INTO lc_countries VALUES (225,'Uruguay','UY','URY','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'AR','Artigas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'CA','Canelones');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'CL','Cerro Largo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'CO','Colonia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'DU','Durazno');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'FD','Florida');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'FS','Flores');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'LA','Lavalleja');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'MA','Maldonado');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'MO','Montevideo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'PA','Paysandu');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'RN','R�o Negro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'RO','Rocha');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'RV','Rivera');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'SA','Salto');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'SJ','San Jos�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'SO','Soriano');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'TA','Tacuaremb�');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (225,'TT','Treinta y Tres');

INSERT INTO lc_countries VALUES (226,'Uzbekistan','UZ','UZB','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'AN','Andijon viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'BU','Buxoro viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'FA','Farg\'ona viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'JI','Jizzax viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'NG','Namangan viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'NW','Navoiy viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'QA','Qashqadaryo viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'QR','Qoraqalpog\'iston Respublikasi');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'SA','Samarqand viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'SI','Sirdaryo viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'SU','Surxondaryo viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'TK','Toshkent');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'TO','Toshkent viloyati');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (226,'XO','Xorazm viloyati');

INSERT INTO lc_countries VALUES (227,'Vanuatu','VU','VUT','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'MAP','Malampa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'PAM','P�nama');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'SAM','Sanma');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'SEE','Sh�fa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'TAE','Taf�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (227,'TOB','Torba');

INSERT INTO lc_countries VALUES (228,'Vatican City State (Holy See)','VA','VAT','');

INSERT INTO lc_countries VALUES (229,'Venezuela','VE','VEN','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'A','Distrito Capital');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'B','Anzo�tegui');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'C','Apure');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'D','Aragua');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'E','Barinas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'F','Bol�var');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'G','Carabobo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'H','Cojedes');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'I','Falc�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'J','Gu�rico');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'K','Lara');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'L','M�rida');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'M','Miranda');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'N','Monagas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'O','Nueva Esparta');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'P','Portuguesa');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'R','Sucre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'S','Tachira');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'T','Trujillo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'U','Yaracuy');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'V','Zulia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'W','Capital Dependencia');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'X','Vargas');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'Y','Delta Amacuro');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (229,'Z','Amazonas');

INSERT INTO lc_countries VALUES (230,'Vietnam','VN','VNM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'01','Lai Ch�u');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'02','L�o Cai');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'03','H� Giang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'04','Cao B?ng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'05','Son La');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'06','Y�n B�i');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'07','Tuy�n Quang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'09','L?ng Son');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'13','Qu?ng Ninh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'14','H�a B�nh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'15','H� T�y');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'18','Ninh B�nh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'20','Th�i B�nh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'21','Thanh H�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'22','Ngh? An');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'23','H� Tinh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'24','Qu?ng B�nh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'25','Qu?ng Tr?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'26','Th?a Thi�n-Hu?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'27','Qu?ng Nam');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'28','Kon Tum');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'29','Qu?ng Ng�i');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'30','Gia Lai');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'31','B�nh �?nh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'32','Ph� Y�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'33','�?k L?k');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'34','Kh�nh H�a');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'35','L�m �?ng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'36','Ninh Thu?n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'37','T�y Ninh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'39','�?ng Nai');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'40','B�nh Thu?n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'41','Long An');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'43','B� R?a-Vung T�u');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'44','An Giang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'45','�?ng Th�p');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'46','Ti?n Giang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'47','Ki�n Giang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'48','C?n Tho');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'49','Vinh Long');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'50','B?n Tre');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'51','Tr� Vinh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'52','S�c Trang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'53','B?c K?n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'54','B?c Giang');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'55','B?c Li�u');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'56','B?c Ninh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'57','B�nh Duong');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'58','B�nh Phu?c');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'59','C� Mau');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'60','�� N?ng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'61','H?i Duong');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'62','H?i Ph�ng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'63','H� Nam');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'64','H� N?i');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'65','S�i G�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'66','Hung Y�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'67','Nam �?nh');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'68','Ph� Th?');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'69','Th�i Nguy�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'70','Vinh Ph�c');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'71','�i?n Bi�n');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'72','�?k N�ng');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (230,'73','H?u Giang');

INSERT INTO lc_countries VALUES (231,'Virgin Islands (British)','VG','VGB','');
INSERT INTO lc_countries VALUES (232,'Virgin Islands (U.S.)','VI','VIR','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (232,'C','Saint Croix');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (232,'J','Saint John');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (232,'T','Saint Thomas');

INSERT INTO lc_countries VALUES (233,'Wallis and Futuna Islands','WF','WLF','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (233,'A','Alo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (233,'S','Sigave');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (233,'W','Wallis');

INSERT INTO lc_countries VALUES (234,'Western Sahara','EH','ESH','');
INSERT INTO lc_countries VALUES (235,'Yemen','YE','YEM','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'AB','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'AD','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'AM','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'BA','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'DA','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'DH','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'HD','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'HJ','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'HU','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'IB','??');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'JA','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'LA','???');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'MA','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'MR','??????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'MW','???????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'SD','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'SN','?????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'SH','????');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (235,'TA','???');

INSERT INTO lc_countries VALUES (236,'Yugoslavia','YU','YUG','');
INSERT INTO lc_countries VALUES (237,'Zaire','ZR','ZAR','');

INSERT INTO lc_countries VALUES (238,'Zambia','ZM','ZMB','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'01','Western');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'02','Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'03','Eastern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'04','Luapula');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'05','Northern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'06','North-Western');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'07','Southern');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'08','Copperbelt');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (238,'09','Lusaka');

INSERT INTO lc_countries VALUES (239,'Zimbabwe','ZW','ZWE','');

INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MA','Manicaland');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MC','Mashonaland Central');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'ME','Mashonaland East');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MI','Midlands');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MN','Matabeleland North');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MS','Matabeleland South');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MV','Masvingo');
INSERT INTO lc_zones (zone_country_id, zone_code, zone_name) VALUES (239,'MW','Mashonaland West');

INSERT INTO lc_banners (banners_id, banners_title, banners_url, banners_target, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status) VALUES(1, 'Mainpage Banner', 'http://loadedcommerce.com/?ref=installationbanner', 1, 'promo_cat_banner.png', 'mainpage', '', 0, NULL, NULL, now(), NULL, 1);

INSERT INTO lc_branding (language_id, homepage_text, slogan, meta_description, meta_keywords, meta_title, meta_title_prefix, meta_title_suffix, footer_text) VALUES ('1', '<div><img alt="Loaded7 by Loaded Commerce" src="images/tablets.jpg" style="float:right"/><h1>Welcome to your new Loaded Commerce 7 store.&nbsp;</h1><h2>Ready to make the store of your dreams. Built on a solid foundation for the future.</h2><ul><li><p>Unlimited Products and Categories.&nbsp;</p></li><li><p>Set Featured Products on the Homepage</p></li><li><p>Manage the Menus with Custom Links</p></li><li><p>Create Rich HTML Content&nbsp;</p></li><li><p>Provide Discount Coupons&nbsp;</p></li><li><p>Real Time Shipping and Tax on Checkout</p></li><li><p>Real Time Payments with popular Gateways</p></li><li><p>Create and Edit Orders in Admin</p></li><li><p>Manage your Admin Users and Admin Permissions</p></li><li><p>Instantly Install any Addons in the Addon Store</p></li><li><p>Backup and Update your store in One Click&nbsp;</p></li><li><p>URLS are SEO friendly</p></li><li><p>Product Images are Automatically resized</p></li></ul><div><span style="color:#808080">Change this HTML Content in your Admin -&gt;Marketing -&gt;Branding Manager</span></div><div><span style="color:#808080">NOTE: Be sure to copy this template before making changes to it. See template docs at <a href="http://docs.loaded7.com" target="_blank">http://docs.loaded7.com</a></span></div><div><hr/><a href="http://loadedcommerce.com" target="_blank">Learn more about Loaded Commerce and our Pro Features.&nbsp;</a></div></div>', '', '', '', '', '', '', '');

INSERT INTO lc_categories (categories_id, categories_image, parent_id, sort_order, categories_mode, categories_link_target, categories_custom_url, categories_status, categories_visibility_nav, categories_visibility_box, date_added, last_modified) VALUES(1, 'products.jpg', 0, 10, 'category', 0, '', 1, 1, 1, now(), now());
INSERT INTO lc_categories (categories_id, categories_image, parent_id, sort_order, categories_mode, categories_link_target, categories_custom_url, categories_status, categories_visibility_nav, categories_visibility_box, date_added, last_modified) VALUES(2, 'information.jpg', 0, 20, 'info_category', 0, '', 1, 1, 0, now(), now());
INSERT INTO lc_categories (categories_id, categories_image, parent_id, sort_order, categories_mode, categories_link_target, categories_custom_url, categories_status, categories_visibility_nav, categories_visibility_box, date_added, last_modified) VALUES(3, '', 2, 10, 'page', 0, '', 1, 0, 1, now(), now());
INSERT INTO lc_categories (categories_id, categories_image, parent_id, sort_order, categories_mode, categories_link_target, categories_custom_url, categories_status, categories_visibility_nav, categories_visibility_box, date_added, last_modified) VALUES(4, '', 2, 20, 'page', 0, '', 1, 0, 1, now(), now());
INSERT INTO lc_categories (categories_id, categories_image, parent_id, sort_order, categories_mode, categories_link_target, categories_custom_url, categories_status, categories_visibility_nav, categories_visibility_box, date_added, last_modified) VALUES(5, '', 2, 30, 'page', 0, '', 1, 0, 1, now(), now());

INSERT INTO lc_categories_description (categories_id, language_id, categories_name, categories_menu_name, categories_blurb, categories_description, categories_keyword, categories_tags) VALUES(1, 1, 'Products', 'Products', 'Products Blurb', '<p>Products Content</p>', 'products', 'tags');
INSERT INTO lc_categories_description (categories_id, language_id, categories_name, categories_menu_name, categories_blurb, categories_description, categories_keyword, categories_tags) VALUES(2, 1, 'Information', 'Information', 'Information Blurb', '<p>Information Content</p>', 'information', 'tags');
INSERT INTO lc_categories_description (categories_id, language_id, categories_name, categories_menu_name, categories_blurb, categories_description, categories_keyword, categories_tags) VALUES(3, 1, 'Shipping & Returns', 'Shipping & Returns', 'Shipping & Returns Blurb', '<p>Shipping & Returns Content</p>', 'shipping returns', 'tags'); 
INSERT INTO lc_categories_description (categories_id, language_id, categories_name, categories_menu_name, categories_blurb, categories_description, categories_keyword, categories_tags) VALUES(4, 1, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy Blurb', '<p>Privacy Policy Content</p>', 'privacy, policy', 'tags');
INSERT INTO lc_categories_description (categories_id, language_id, categories_name, categories_menu_name, categories_blurb, categories_description, categories_keyword, categories_tags) VALUES(5, 1, 'Terms & Conditions', 'Terms & Conditions', 'Terms & Conditions Blurb', '<p>Terms & Conditions Content</p>', 'terms conditions', 'tags');

INSERT INTO lc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES('Enable AddOn', 'ADDONS_PAYMENT_CASH_ON_DELIVERY_STATUS', '1', 'Do you want to enable this addon?', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES('Payment Zone', 'ADDONS_PAYMENT_CASH_ON_DELIVERY_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 0, now(), now(), 'lc_cfg_use_get_zone_class_title', 'lc_cfg_set_zone_classes_pull_down_menu');
INSERT INTO lc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES('Order Status', 'ADDONS_PAYMENT_CASH_ON_DELIVERY_ORDER_STATUS_ID', '1', 'Set the status of orders made with this payment module to this value', 6, 0, now(), now(), 'lc_cfg_use_get_order_status_title', 'lc_cfg_set_order_statuses_pull_down_menu');
INSERT INTO lc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES('Sort Order', 'ADDONS_PAYMENT_CASH_ON_DELIVERY_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES('Enable AddOn', 'ADDONS_SHIPPING_FREE_SHIPPING_STATUS', '1', 'Do you want to enable this addon?', 6, 0, now(), now(), 'lc_cfg_use_get_boolean_value', 'lc_cfg_set_boolean_value(array(1, -1))');
INSERT INTO lc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES('Order Threshold', 'ADDONS_SHIPPING_FREE_SHIPPING_MINIMUM_ORDER', '0.00', 'The minimum order amount to apply free shipping to.', 6, 0, now(), now(), NULL, NULL);
INSERT INTO lc_configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES('Shipping Zone', 'ADDONS_SHIPPING_FREE_SHIPPING_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, now(), now(), 'lc_cfg_use_get_zone_class_title', 'lc_cfg_set_zone_classes_pull_down_menu');

INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(1, 'American Express', '/^(34|37)\\d{13}$/', '1', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(2, 'Diners Club', '/^(30|36|38)\\d{12}$/', '0', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(3, 'JCB', '/^((2131|1800)\\d{11}|3[0135]\\d{14})$/', '0', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(4, 'MasterCard', '/^5[1-5]\\d{14}$/', '1', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(5, 'Visa', '/^4\\d{12}(\\d{3})?$/', '1', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(6, 'Discover Card', '/^6011\\d{12}$/', '1', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(7, 'Solo', '/^(63|67)\\d{14}(\\d{2,3})?$/', '0', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(8, 'Switch', '/^(49|56|63|67)\\d{14}(\\d{2,3})?$/', '0', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(9, 'Australian Bankcard', '/^5610\\d{12}$/', '0', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(10, 'enRoute', '/^(2014|2149)\\d{11}$/', '0', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(11, 'Laser', '/^6304\\d{12}(\\d{2,3})?$/', '0', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(12, 'Maestro', '/^(50|56|57|58|6)/', '0', 0);
INSERT INTO lc_credit_cards (id, credit_card_name, pattern, credit_card_status, sort_order) VALUES(13, 'Smartpay', '/^4\\d{12}(\\d{3})?$/', '0', 0);

INSERT INTO lc_currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_places, value, last_updated) VALUES(1, 'US Dollar', 'USD', '$', '', '2', 1.00000000, '2014-03-03 09:59:23');
INSERT INTO lc_currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_places, value, last_updated) VALUES(2, 'Euro', 'EUR', '&euro;', '', '2', 0.726579, '2014-03-03 09:59:23');
INSERT INTO lc_currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_places, value, last_updated) VALUES(3, 'British Pounds', 'GBP', '&pound;', '', '2', 0.598311, '2014-03-03 09:59:23');

INSERT INTO lc_customers_access (id, level, status) VALUES(1, 'Guest', 1);
INSERT INTO lc_customers_access (id, level, status) VALUES(2, 'Registered', 1);

INSERT INTO lc_customers_groups (customers_group_id, language_id, customers_group_name) VALUES(1, 1, 'Registered');
INSERT INTO lc_customers_groups (customers_group_id, language_id, customers_group_name) VALUES(2, 1, 'Wholesale');

INSERT INTO lc_languages (languages_id, `name`, code, locale, `charset`, date_format_short, date_format_long, time_format, text_direction, currencies_id, numeric_separator_decimal, numeric_separator_thousands, parent_id, sort_order) VALUES(1, 'English', 'en_US', 'en_US.UTF-8,en_US,english', 'utf-8', '%m/%d/%Y', '%A %B %d, %Y at %H:%M', '%H:%M:%S', 'ltr', 1, '.', ',', 0, 10);

INSERT INTO lc_orders_status (orders_status_id, language_id, orders_status_name, orders_status_type) VALUES(1, 1, 'Pending', 'Pending');
INSERT INTO lc_orders_status (orders_status_id, language_id, orders_status_name, orders_status_type) VALUES(2, 1, 'Processing', 'Approved');
INSERT INTO lc_orders_status (orders_status_id, language_id, orders_status_name, orders_status_type) VALUES(3, 1, 'Preparing', 'Approved');
INSERT INTO lc_orders_status (orders_status_id, language_id, orders_status_name, orders_status_type) VALUES(4, 1, 'Delivered', 'Approved');
INSERT INTO lc_orders_status (orders_status_id, language_id, orders_status_name, orders_status_type) VALUES(5, 1, 'Cancelled', 'Rejected');

INSERT INTO lc_orders_transactions_status (id, language_id, status_name) VALUES(1, 1, 'Authorize');
INSERT INTO lc_orders_transactions_status (id, language_id, status_name) VALUES(2, 1, 'Cancel');
INSERT INTO lc_orders_transactions_status (id, language_id, status_name) VALUES(3, 1, 'Approve');
INSERT INTO lc_orders_transactions_status (id, language_id, status_name) VALUES(4, 1, 'Inquiry');

INSERT INTO lc_permalinks (permalink_id, item_id, language_id, `type`, query, permalink) VALUES (1, 1, 1, 1, 'cPath=1', 'products');
INSERT INTO lc_permalinks (permalink_id, item_id, language_id, `type`, query, permalink) VALUES (2, 2, 1, 1, 'cPath=2', 'information');
INSERT INTO lc_permalinks (permalink_id, item_id, language_id, `type`, query, permalink) VALUES (3, 3, 1, 1, 'cPath=2_3', 'shipping-returns');
INSERT INTO lc_permalinks (permalink_id, item_id, language_id, `type`, query, permalink) VALUES (4, 4, 1, 1, 'cPath=2_4', 'privacy-policy');
INSERT INTO lc_permalinks (permalink_id, item_id, language_id, `type`, query, permalink) VALUES (5, 5, 1, 1, 'cpath=2_5', 'terms-conditions');

INSERT INTO lc_products_images_groups (id, language_id, title, code, size_width, size_height, force_size) VALUES(1, 1, 'Originals', 'originals', 0, 0, 0);
INSERT INTO lc_products_images_groups (id, language_id, title, code, size_width, size_height, force_size) VALUES(2, 1, 'Thumbnails', 'thumbnails', 200, 240, 0);
INSERT INTO lc_products_images_groups (id, language_id, title, code, size_width, size_height, force_size) VALUES(3, 1, 'Product Info', 'product_info', 360, 414, 0);
INSERT INTO lc_products_images_groups (id, language_id, title, code, size_width, size_height, force_size) VALUES(4, 1, 'Large', 'large', 250, 300, 0);
INSERT INTO lc_products_images_groups (id, language_id, title, code, size_width, size_height, force_size) VALUES(5, 1, 'Mini', 'mini', 50, 60, 0);
INSERT INTO lc_products_images_groups (id, language_id, title, code, size_width, size_height, force_size) VALUES(6, 1, 'Popup', 'popup', 550, 650, 0);
INSERT INTO lc_products_images_groups (id, language_id, title, code, size_width, size_height, force_size) VALUES(7, 1, 'Small', 'small', 100, 120, 0);

INSERT INTO lc_shipping_availability (id, languages_id, title, css_key) VALUES(1, 1, 'Ships within 24 hours.', 'ships24hours');
INSERT INTO lc_shipping_availability (id, languages_id, title, css_key) VALUES(2, 1, 'Ships within 48 hours.', 'ships48hours');
INSERT INTO lc_shipping_availability (id, languages_id, title, css_key) VALUES(3, 1, 'Ships within 72 hours.', 'ships72hours');

INSERT INTO lc_tax_class VALUES (1, 'Taxable Goods', 'The following types of products are included non-food, services, etc', now(), now());

# USA/Florida
INSERT INTO lc_tax_rates VALUES (1, 1, 1, 1, 7.0, 'FL TAX 7.0%', now(), now());
INSERT INTO lc_geo_zones (geo_zone_id, geo_zone_name, geo_zone_description, date_added) VALUES (1, "Florida", "Florida local sales tax zone", now());
INSERT INTO lc_zones_to_geo_zones (association_id, zone_country_id, zone_id, geo_zone_id, date_added) VALUES (1, 223, 4032, 1, now());

INSERT INTO lc_templates (id, title, code, author_name, author_www, markup_version, css_based, `medium`) VALUES(1, 'Loaded Commerce Bootstrap 3.0 Core Template', 'core', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'HTML 5.0', 1, 'Screen');

INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(1, 'Days to Ship', 'shipping_availability', 'Loaded Commerce,', 'http://www.loadedcommerce.com', 'product_attributes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(2, 'Manufacturer', 'manufacturers', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'product_attributes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(3, 'Date Available', 'date_available', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'product_attributes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(4, 'Free Shipping', 'free', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'shipping|Free_Shipping');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(5, 'Cash On Delivery', 'cod', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'payment|Cash_On_Delivery');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(6, 'Categories', 'categories', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(7, 'Best Sellers', 'best_sellers', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(8, 'Currencies', 'currencies', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(10, 'Languages', 'languages', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(11, 'Manufacturer Info', 'manufacturer_info', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(12, 'Manufacturers', 'manufacturers', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(13, 'New Products', 'whats_new', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(14, 'Order History', 'order_history', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(15, 'Ordering Steps', 'checkout_trail', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(16, 'Product Notifications', 'product_notifications', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(17, 'Reviews', 'reviews', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(18, 'Search', 'search', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(19, 'Shopping Cart', 'shopping_cart', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(20, 'Specials', 'specials', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(21, 'Tell a Friend', 'tell_a_friend', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(22, 'Templates', 'templates', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(23, 'Banner on Mainpage', 'mainpage_banner', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'content');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(24, 'New Products', 'new_products', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'content');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(25, 'Your Recent History', 'recently_visited', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'content');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(26, 'Customers Who Purchased This Product Also Purchased', 'also_purchased_products', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'content');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(27, 'Content on Mainpage', 'mainpage_content', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'content');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(28, 'Upcoming Products', 'upcoming_products', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'content');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(29, 'Featured Products', 'featured_products', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'content');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(30, 'Top Categories on Mainpage', 'mainpage_categories', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'content');
INSERT INTO lc_templates_boxes (id, title, code, author_name, author_www, modules_group) VALUES(31, 'Information Pages', 'information_pages', 'Loaded Commerce', 'http://www.loadedcommerce.com', 'boxes');

INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(23, 1, 'index/index', 'header', 10, 1);
INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(27, 1, 'index/index', 'after', 20, 1);
INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(29, 1, 'index/index', 'after', 30, 1);
INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(24, 1, 'index/index', 'after', 40, 1);
INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(30, 1, 'index/index', 'after', 50, 1);
INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(25, 1, 'products/info', 'after', 40, 1);
INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(26, 1, 'products/info', 'after', 30, 1);
INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(6, 1, '*', 'left', 10, 0);
INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(31, 1, '*', 'left', 15, 0);
INSERT INTO lc_templates_boxes_to_pages (templates_boxes_id, templates_id, content_page, boxes_group, sort_order, page_specific) VALUES(12, 1, '*', 'left', 20, 0);

INSERT INTO lc_weight_classes (weight_class_id, weight_class_key, language_id, weight_class_title) VALUES(1, 'g', 1, 'Gram(s)');
INSERT INTO lc_weight_classes (weight_class_id, weight_class_key, language_id, weight_class_title) VALUES(2, 'kg', 1, 'Kilogram(s)');
INSERT INTO lc_weight_classes (weight_class_id, weight_class_key, language_id, weight_class_title) VALUES(3, 'oz', 1, 'Ounce(s)');
INSERT INTO lc_weight_classes (weight_class_id, weight_class_key, language_id, weight_class_title) VALUES(4, 'lb', 1, 'Pound(s)');

INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(1, 2, 0.0010);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(1, 3, 0.0352);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(1, 4, 0.0022);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(2, 1, 1000.0000);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(2, 3, 35.2739);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(2, 4, 2.2046);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(3, 1, 28.3495);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(3, 2, 0.0283);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(3, 4, 0.0625);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(4, 1, 453.5923);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(4, 2, 0.4535);
INSERT INTO lc_weight_classes_rules (weight_class_from_id, weight_class_to_id, weight_class_rule) VALUES(4, 3, 16.0000);
