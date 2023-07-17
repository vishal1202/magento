-- Adminer 4.8.1 MySQL 8.0.33-0ubuntu0.22.04.2 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `admin_adobe_ims_webapi`;
CREATE TABLE `admin_adobe_ims_webapi` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `admin_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Admin User Id',
  `access_token_hash` varchar(255) DEFAULT NULL COMMENT 'Access Token Hash',
  `access_token` text COMMENT 'Access Token',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `last_check_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last check time',
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Access Token Expires At',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_ADOBE_IMS_WEBAPI_ACCESS_TOKEN_HASH` (`access_token_hash`),
  KEY `ADMIN_ADOBE_IMS_WEBAPI_ADMIN_USER_ID` (`admin_user_id`),
  CONSTRAINT `ADMIN_ADOBE_IMS_WEBAPI_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Adobe IMS Webapi';


DROP TABLE IF EXISTS `admin_analytics_usage_version_log`;
CREATE TABLE `admin_analytics_usage_version_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `last_viewed_in_version` varchar(50) NOT NULL COMMENT 'Viewer last viewed on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ADMIN_ANALYTICS_USAGE_VERSION_LOG_LAST_VIEWED_IN_VERSION` (`last_viewed_in_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Notification Viewer Log Table';

INSERT INTO `admin_analytics_usage_version_log` (`id`, `last_viewed_in_version`) VALUES
(1,	'2.4.6');

DROP TABLE IF EXISTS `admin_passwords`;
CREATE TABLE `admin_passwords` (
  `password_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password ID',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int unsigned NOT NULL DEFAULT '0' COMMENT 'Deprecated',
  `last_updated` int unsigned NOT NULL DEFAULT '0' COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Passwords';

INSERT INTO `admin_passwords` (`password_id`, `user_id`, `password_hash`, `expires`, `last_updated`) VALUES
(1,	1,	'8838e65ba873e63f5456e848d01e4361ea03f84e00f6f02cdf756395bcbe5fab:UwY901ogLopi7HQkxLVPXzmkJrHYA52M:3_32_2_67108864',	0,	1689311052);

DROP TABLE IF EXISTS `admin_system_messages`;
CREATE TABLE `admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message ID',
  `severity` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin System Messages';

INSERT INTO `admin_system_messages` (`identity`, `severity`, `created_at`) VALUES
('da332d712f3215b9b94bfa268c398323',	2,	'2023-07-15 12:05:58');

DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin User Table';

INSERT INTO `admin_user` (`user_id`, `firstname`, `lastname`, `email`, `username`, `password`, `created`, `modified`, `logdate`, `lognum`, `reload_acl_flag`, `is_active`, `extra`, `rp_token`, `rp_token_created_at`, `interface_locale`, `failures_num`, `first_failure`, `lock_expires`) VALUES
(1,	'admin',	'admin',	'admin@admin.com',	'admin',	'8838e65ba873e63f5456e848d01e4361ea03f84e00f6f02cdf756395bcbe5fab:UwY901ogLopi7HQkxLVPXzmkJrHYA52M:3_32_2_67108864',	'2023-07-14 05:04:12',	'2023-07-17 04:59:10',	'2023-07-17 04:59:10',	11,	0,	1,	'{\"configState\":{\"catalog_frontend\":\"1\",\"catalog_fields_masks\":\"1\",\"catalog_review\":\"1\",\"catalog_productalert\":\"1\",\"catalog_productalert_cron\":\"1\",\"catalog_placeholder\":\"0\",\"catalog_recently_products\":\"0\",\"catalog_product_video\":\"1\",\"catalog_price\":\"1\",\"catalog_layered_navigation\":\"1\",\"catalog_search\":\"1\",\"catalog_seo\":\"1\",\"catalog_navigation\":\"1\",\"catalog_downloadable\":\"1\",\"catalog_custom_options\":\"1\",\"cataloginventory_options\":\"1\",\"cataloginventory_item_options\":\"1\",\"cataloginventory_bulk_operations\":\"0\",\"cataloginventory_indexer\":\"0\",\"cataloginventory_source_selection_distance_based\":\"0\",\"cataloginventory_source_selection_distance_based_google\":\"1\",\"sales_general\":\"1\",\"sales_totals_sort\":\"1\",\"sales_reorder\":\"1\",\"sales_minimum_order\":\"1\",\"sales_zerograndtotal_creditmemo\":\"1\",\"sales_identity\":\"1\",\"sales_dashboard\":\"1\",\"sales_orders\":\"1\",\"sales_gift_options\":\"1\",\"sales_msrp\":\"1\",\"sales_instant_purchase\":\"1\",\"sales_pdf_invoice\":\"1\",\"sales_pdf_shipment\":\"1\",\"checkout_options\":\"1\",\"checkout_sidebar\":\"1\",\"shipping_origin\":\"1\",\"shipping_shipping_policy\":\"1\",\"carriers_flatrate\":\"1\",\"carriers_freeshipping\":\"1\",\"carriers_tablerate\":\"1\",\"payment_us_purchaseorder\":\"1\",\"payment_us_cashondelivery\":\"1\",\"payment_us_banktransfer\":\"1\",\"payment_us_free\":\"1\",\"payment_us_checkmo\":\"1\",\"oauth_access_token_lifetime\":\"1\",\"oauth_cleanup\":\"1\",\"webapi_soap\":\"1\",\"webapi_validation\":\"1\",\"webapi_webapisecurity\":\"1\",\"webapi_jwtauth\":\"1\",\"webapi_graphql_validation\":\"1\",\"carriers_instore\":\"0\",\"carriers_ups\":\"0\",\"carriers_usps\":\"0\",\"carriers_fedex\":\"0\",\"carriers_dhl\":\"0\"}}',	NULL,	NULL,	'en_US',	0,	NULL,	NULL);

DROP TABLE IF EXISTS `admin_user_expiration`;
CREATE TABLE `admin_user_expiration` (
  `user_id` int unsigned NOT NULL COMMENT 'User ID',
  `expires_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'User Expiration Date',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `ADMIN_USER_EXPIRATION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin User expiration dates table';


DROP TABLE IF EXISTS `admin_user_session`;
CREATE TABLE `admin_user_session` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `session_id` varchar(1) DEFAULT NULL COMMENT 'Deprecated: Session ID value no longer used',
  `user_id` int unsigned DEFAULT NULL COMMENT 'Admin User ID',
  `status` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Current Session status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `ADMIN_USER_SESSION_SESSION_ID` (`session_id`),
  KEY `ADMIN_USER_SESSION_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_USER_SESSION_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin User sessions table';

INSERT INTO `admin_user_session` (`id`, `session_id`, `user_id`, `status`, `created_at`, `updated_at`, `ip`) VALUES
(1,	NULL,	1,	1,	'2023-07-14 06:35:43',	'2023-07-14 06:35:43',	'127.0.0.1'),
(2,	NULL,	1,	1,	'2023-07-14 10:54:36',	'2023-07-14 10:57:19',	'127.0.0.1'),
(3,	NULL,	1,	1,	'2023-07-14 11:18:34',	'2023-07-14 11:54:22',	'127.0.0.1'),
(4,	NULL,	1,	1,	'2023-07-15 10:57:58',	'2023-07-15 11:39:35',	'127.0.0.1'),
(5,	NULL,	1,	1,	'2023-07-15 12:03:10',	'2023-07-15 13:08:18',	'127.0.0.1'),
(6,	NULL,	1,	1,	'2023-07-15 14:19:59',	'2023-07-15 14:54:27',	'127.0.0.1'),
(7,	NULL,	1,	1,	'2023-07-16 05:30:40',	'2023-07-16 05:30:40',	'127.0.0.1'),
(8,	NULL,	1,	1,	'2023-07-16 09:33:25',	'2023-07-16 09:40:54',	'127.0.0.1'),
(9,	NULL,	1,	1,	'2023-07-16 09:57:56',	'2023-07-16 09:57:56',	'127.0.0.1'),
(10,	NULL,	1,	1,	'2023-07-16 16:26:20',	'2023-07-16 16:27:54',	'127.0.0.1'),
(11,	NULL,	1,	1,	'2023-07-17 04:59:10',	'2023-07-17 05:24:47',	'127.0.0.1');

DROP TABLE IF EXISTS `adminnotification_inbox`;
CREATE TABLE `adminnotification_inbox` (
  `notification_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification ID',
  `severity` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adminnotification Inbox';

INSERT INTO `adminnotification_inbox` (`notification_id`, `severity`, `date_added`, `title`, `description`, `url`, `is_read`, `is_remove`) VALUES
(1,	4,	'2023-07-14 05:04:11',	'Disable Notice',	'To improve performance, collecting statistics for the Magento Report module is disabled by default. \nYou can enable it in System Config.',	'',	0,	0);

DROP TABLE IF EXISTS `adobe_stock_asset`;
CREATE TABLE `adobe_stock_asset` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `media_gallery_id` int unsigned DEFAULT NULL COMMENT 'Media gallery ID',
  `category_id` int unsigned DEFAULT NULL COMMENT 'Category ID',
  `creator_id` int unsigned DEFAULT NULL COMMENT 'Creator ID',
  `is_licensed` int unsigned NOT NULL DEFAULT '0' COMMENT 'Is Licensed',
  `creation_date` varchar(255) DEFAULT NULL COMMENT 'Creation Date',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` (`media_gallery_id`),
  KEY `ADOBE_STOCK_ASSET_ID` (`id`),
  KEY `ADOBE_STOCK_ASSET_CATEGORY_ID` (`category_id`),
  KEY `ADOBE_STOCK_ASSET_CREATOR_ID` (`creator_id`),
  CONSTRAINT `ADOBE_STOCK_ASSET_CATEGORY_ID_ADOBE_STOCK_CATEGORY_ID` FOREIGN KEY (`category_id`) REFERENCES `adobe_stock_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_CREATOR_ID_ADOBE_STOCK_CREATOR_ID` FOREIGN KEY (`creator_id`) REFERENCES `adobe_stock_creator` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ADOBE_STOCK_ASSET_MEDIA_GALLERY_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`media_gallery_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe Stock Asset';


DROP TABLE IF EXISTS `adobe_stock_category`;
CREATE TABLE `adobe_stock_category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CATEGORY_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe Stock Category';


DROP TABLE IF EXISTS `adobe_stock_creator`;
CREATE TABLE `adobe_stock_creator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Asset creator''s name',
  PRIMARY KEY (`id`),
  KEY `ADOBE_STOCK_CREATOR_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe Stock Creator';


DROP TABLE IF EXISTS `adobe_user_profile`;
CREATE TABLE `adobe_user_profile` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `admin_user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Admin User Id',
  `name` varchar(255) NOT NULL COMMENT 'Display Name',
  `email` varchar(255) NOT NULL COMMENT 'user profile email',
  `image` varchar(255) NOT NULL COMMENT 'user profile avatar',
  `account_type` varchar(255) DEFAULT NULL COMMENT 'Account Type',
  `access_token` text COMMENT 'Access Token',
  `refresh_token` text COMMENT 'Refresh Token',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `access_token_expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Access Token Expires At',
  PRIMARY KEY (`id`),
  KEY `ADOBE_USER_PROFILE_ADMIN_USER_ID` (`admin_user_id`),
  CONSTRAINT `ADOBE_USER_PROFILE_ADMIN_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Adobe IMS User Profile';


DROP TABLE IF EXISTS `authorization_role`;
CREATE TABLE `authorization_role` (
  `role_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Role Table';

INSERT INTO `authorization_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `user_type`, `role_name`) VALUES
(1,	0,	1,	1,	'G',	0,	'2',	'Administrators'),
(2,	1,	2,	0,	'U',	1,	'2',	'admin'),
(3,	0,	1,	0,	'U',	1,	'1',	'11');

DROP TABLE IF EXISTS `authorization_rule`;
CREATE TABLE `authorization_rule` (
  `rule_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `authorization_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Admin Rule Table';

INSERT INTO `authorization_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `permission`) VALUES
(1,	1,	'Magento_Backend::all',	NULL,	'allow'),
(2,	3,	'Magento_Backend::all',	NULL,	'allow');

DROP TABLE IF EXISTS `braintree_credit_prices`;
CREATE TABLE `braintree_credit_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product Id',
  `term` int NOT NULL COMMENT 'Credit Term',
  `monthly_payment` decimal(12,2) NOT NULL COMMENT 'Monthly Payment',
  `instalment_rate` decimal(12,2) NOT NULL COMMENT 'Instalment Rate',
  `cost_of_purchase` decimal(12,2) NOT NULL COMMENT 'Cost of purchase',
  `total_inc_interest` decimal(12,2) NOT NULL COMMENT 'Total Inc Interest',
  PRIMARY KEY (`id`),
  UNIQUE KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID_TERM` (`product_id`,`term`),
  KEY `BRAINTREE_CREDIT_PRICES_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Braintree credit rates';


DROP TABLE IF EXISTS `braintree_transaction_details`;
CREATE TABLE `braintree_transaction_details` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `order_id` int unsigned NOT NULL COMMENT 'Order Id',
  `transaction_source` varchar(12) DEFAULT NULL COMMENT 'Transaction Source',
  PRIMARY KEY (`entity_id`),
  KEY `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID` (`order_id`),
  CONSTRAINT `BRAINTREE_TRANSACTION_DETAILS_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Braintree transaction details table';


DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Caches';


DROP TABLE IF EXISTS `cache_tag`;
CREATE TABLE `cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tag Caches';


DROP TABLE IF EXISTS `captcha_log`;
CREATE TABLE `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  `count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Count Login Attempts';


DROP TABLE IF EXISTS `catalog_category_entity`;
CREATE TABLE `catalog_category_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int NOT NULL COMMENT 'Position',
  `level` int NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `CATALOG_CATEGORY_ENTITY_PATH` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Table';

INSERT INTO `catalog_category_entity` (`entity_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES
(1,	3,	0,	'2023-07-14 05:04:10',	'2023-07-17 05:12:34',	'1',	0,	0,	5),
(2,	3,	1,	'2023-07-14 05:04:11',	'2023-07-17 05:12:34',	'1/2',	1,	1,	4),
(3,	3,	2,	'2023-07-14 10:56:45',	'2023-07-14 11:47:03',	'1/2/3',	1,	2,	0),
(4,	3,	2,	'2023-07-15 12:45:56',	'2023-07-15 12:46:07',	'1/2/4',	2,	2,	0),
(5,	3,	2,	'2023-07-15 13:00:45',	'2023-07-15 13:00:45',	'1/2/5',	3,	2,	0),
(6,	3,	2,	'2023-07-17 05:12:34',	'2023-07-17 05:12:34',	'1/2/6',	4,	2,	0);

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
CREATE TABLE `catalog_category_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Datetime Attribute Backend Table';

INSERT INTO `catalog_category_entity_datetime` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1,	61,	0,	3,	NULL),
(2,	62,	0,	3,	NULL),
(3,	61,	0,	4,	NULL),
(4,	62,	0,	4,	NULL);

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
CREATE TABLE `catalog_category_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Decimal Attribute Backend Table';


DROP TABLE IF EXISTS `catalog_category_entity_int`;
CREATE TABLE `catalog_category_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Integer Attribute Backend Table';

INSERT INTO `catalog_category_entity_int` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1,	69,	0,	1,	1),
(2,	69,	0,	2,	1),
(3,	46,	0,	2,	1),
(4,	46,	0,	3,	1),
(5,	54,	0,	3,	1),
(6,	69,	0,	3,	1),
(7,	70,	0,	3,	0),
(8,	71,	0,	3,	1),
(9,	53,	0,	3,	NULL),
(10,	46,	0,	4,	1),
(11,	54,	0,	4,	1),
(12,	69,	0,	4,	1),
(13,	70,	0,	4,	0),
(14,	71,	0,	4,	0),
(15,	53,	0,	4,	NULL),
(16,	46,	0,	5,	1),
(17,	54,	0,	5,	1),
(18,	69,	0,	5,	1),
(19,	46,	0,	6,	1),
(20,	54,	0,	6,	1),
(21,	69,	0,	6,	1),
(22,	70,	0,	6,	0),
(23,	71,	0,	6,	0);

DROP TABLE IF EXISTS `catalog_category_entity_text`;
CREATE TABLE `catalog_category_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` mediumtext COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Text Attribute Backend Table';

INSERT INTO `catalog_category_entity_text` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1,	47,	0,	3,	NULL),
(2,	50,	0,	3,	NULL),
(3,	51,	0,	3,	NULL),
(4,	47,	0,	4,	NULL),
(5,	50,	0,	4,	NULL),
(6,	51,	0,	4,	NULL);

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
CREATE TABLE `catalog_category_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Varchar Attribute Backend Table';

INSERT INTO `catalog_category_entity_varchar` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1,	45,	0,	1,	'Root Catalog'),
(2,	52,	0,	2,	'PRODUCTS'),
(3,	45,	0,	2,	'Default Category'),
(4,	45,	0,	3,	'Fiction books'),
(5,	52,	0,	3,	'PRODUCTS'),
(6,	63,	0,	3,	'category-full-width'),
(7,	119,	0,	3,	'fiction-books'),
(8,	120,	0,	3,	'fiction-books'),
(10,	48,	0,	3,	NULL),
(11,	49,	0,	3,	NULL),
(12,	60,	0,	3,	'2'),
(13,	45,	0,	4,	'Biography'),
(14,	52,	0,	4,	'PRODUCTS'),
(15,	63,	0,	4,	'category-full-width'),
(16,	119,	0,	4,	'biography'),
(17,	120,	0,	4,	'biography'),
(19,	48,	0,	4,	NULL),
(20,	49,	0,	4,	NULL),
(21,	60,	0,	4,	NULL),
(22,	45,	0,	5,	'General'),
(23,	119,	0,	5,	'general'),
(24,	120,	0,	5,	'general'),
(25,	45,	0,	6,	'Society & social sciences'),
(26,	52,	0,	6,	'PRODUCTS'),
(27,	63,	0,	6,	'category-full-width'),
(28,	119,	0,	6,	'society-social-sciences'),
(29,	120,	0,	6,	'society-social-sciences');

DROP TABLE IF EXISTS `catalog_category_product`;
CREATE TABLE `catalog_category_product` (
  `entity_id` int NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`entity_id`,`category_id`,`product_id`),
  UNIQUE KEY `CATALOG_CATEGORY_PRODUCT_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product To Category Linkage Table';

INSERT INTO `catalog_category_product` (`entity_id`, `category_id`, `product_id`, `position`) VALUES
(1,	3,	1,	0),
(2,	2,	1,	0),
(3,	2,	2,	0),
(4,	3,	2,	0),
(5,	2,	3,	0),
(6,	3,	3,	0),
(7,	2,	4,	0),
(8,	3,	4,	0),
(9,	2,	5,	0),
(10,	4,	5,	0),
(11,	2,	6,	0),
(12,	4,	6,	0),
(13,	2,	7,	0),
(14,	4,	7,	0),
(15,	2,	8,	0),
(16,	5,	8,	0),
(17,	2,	9,	0),
(18,	5,	9,	0),
(19,	2,	10,	0),
(20,	5,	10,	0),
(21,	2,	11,	0),
(22,	6,	11,	0),
(23,	2,	12,	0),
(24,	6,	12,	0),
(25,	2,	13,	0),
(26,	6,	13,	0),
(27,	2,	14,	0),
(28,	6,	14,	0);

DROP TABLE IF EXISTS `catalog_category_product_index`;
CREATE TABLE `catalog_category_product_index` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index';


DROP TABLE IF EXISTS `catalog_category_product_index_replica`;
CREATE TABLE `catalog_category_product_index_replica` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index';


DROP TABLE IF EXISTS `catalog_category_product_index_store1`;
CREATE TABLE `catalog_category_product_index_store1` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_STORE1_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_216E521C8AD125E066D2B0BAB4A08412` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index Store1';

INSERT INTO `catalog_category_product_index_store1` (`category_id`, `product_id`, `position`, `is_parent`, `store_id`, `visibility`) VALUES
(2,	1,	0,	1,	1,	4),
(2,	2,	0,	1,	1,	4),
(2,	3,	0,	1,	1,	4),
(2,	4,	0,	1,	1,	4),
(2,	5,	0,	1,	1,	4),
(2,	6,	0,	1,	1,	4),
(2,	7,	0,	1,	1,	4),
(2,	8,	0,	1,	1,	4),
(2,	9,	0,	1,	1,	4),
(2,	10,	0,	1,	1,	4),
(2,	11,	0,	1,	1,	4),
(2,	12,	0,	1,	1,	4),
(2,	13,	0,	1,	1,	4),
(2,	14,	0,	1,	1,	4),
(3,	1,	0,	1,	1,	4),
(3,	2,	0,	1,	1,	4),
(3,	3,	0,	1,	1,	4),
(3,	4,	0,	1,	1,	4),
(4,	5,	0,	1,	1,	4),
(4,	6,	0,	1,	1,	4),
(4,	7,	0,	1,	1,	4),
(5,	8,	0,	1,	1,	4),
(5,	9,	0,	1,	1,	4),
(5,	10,	0,	1,	1,	4),
(6,	11,	0,	1,	1,	4),
(6,	12,	0,	1,	1,	4),
(6,	13,	0,	1,	1,	4),
(6,	14,	0,	1,	1,	4);

DROP TABLE IF EXISTS `catalog_category_product_index_store1_replica`;
CREATE TABLE `catalog_category_product_index_store1_replica` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category Id',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `position` int DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_4B965DC45C352D6E4C9DC0FF50B1FCF5` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `IDX_47AB760CD6A893ACEA69A9C2E0112C60` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Index Store1 Replica';

INSERT INTO `catalog_category_product_index_store1_replica` (`category_id`, `product_id`, `position`, `is_parent`, `store_id`, `visibility`) VALUES
(2,	1,	0,	1,	1,	4),
(3,	1,	0,	1,	1,	4);

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
CREATE TABLE `catalog_category_product_index_tmp` (
  `category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Category Product Indexer temporary table';


DROP TABLE IF EXISTS `catalog_compare_item`;
CREATE TABLE `catalog_compare_item` (
  `catalog_compare_item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `list_id` int unsigned DEFAULT NULL COMMENT 'List ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` (`list_id`),
  KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_LIST_ID_CATALOG_COMPARE_LIST_LIST_ID` FOREIGN KEY (`list_id`) REFERENCES `catalog_compare_list` (`list_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Compare Table';


DROP TABLE IF EXISTS `catalog_compare_list`;
CREATE TABLE `catalog_compare_list` (
  `list_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare List ID',
  `list_id_mask` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  PRIMARY KEY (`list_id`),
  UNIQUE KEY `CATALOG_COMPARE_LIST_CUSTOMER_ID` (`customer_id`),
  KEY `CATALOG_COMPARE_LIST_LIST_ID_MASK` (`list_id_mask`),
  CONSTRAINT `CATALOG_COMPARE_LIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Compare List with hash Table';


DROP TABLE IF EXISTS `catalog_eav_attribute`;
CREATE TABLE `catalog_eav_attribute` (
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `is_pagebuilder_enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is PageBuilder Enabled',
  `additional_data` text COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog EAV Attribute Table';

INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`, `is_required_in_admin_store`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `search_weight`, `is_pagebuilder_enabled`, `additional_data`) VALUES
(45,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(46,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(47,	NULL,	0,	1,	0,	0,	0,	0,	1,	0,	0,	0,	0,	NULL,	0,	0,	1,	0,	0,	0,	0,	0,	1,	0,	NULL),
(48,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(49,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(50,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(51,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(52,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(53,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(54,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(55,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(56,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(57,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(58,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(59,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(60,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(61,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(62,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(63,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(64,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(65,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(66,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(67,	'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available',	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(68,	'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby',	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(69,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(70,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(71,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(72,	'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep',	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(73,	NULL,	0,	1,	1,	0,	0,	0,	0,	0,	0,	1,	1,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	5,	0,	NULL),
(74,	NULL,	1,	1,	1,	0,	1,	0,	0,	0,	0,	0,	0,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	6,	0,	NULL),
(75,	NULL,	0,	1,	1,	0,	1,	0,	1,	0,	0,	0,	0,	NULL,	1,	0,	1,	0,	0,	0,	0,	0,	1,	1,	NULL),
(76,	NULL,	0,	1,	1,	0,	1,	0,	1,	0,	0,	1,	0,	NULL,	1,	0,	1,	0,	0,	1,	0,	0,	1,	0,	NULL),
(77,	NULL,	1,	1,	1,	1,	0,	0,	0,	0,	0,	1,	1,	'simple,virtual,downloadable,bundle,configurable',	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(78,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'simple,virtual,downloadable,bundle,configurable',	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(79,	NULL,	2,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'simple,virtual,downloadable,bundle,configurable',	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL),
(80,	NULL,	2,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'simple,virtual,downloadable,bundle,configurable',	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL),
(81,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'simple,virtual,downloadable',	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(82,	'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight',	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'simple,virtual,downloadable,bundle,configurable',	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(83,	NULL,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	'simple,configurable',	1,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(84,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(85,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(86,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(87,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(88,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(89,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(90,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(91,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(92,	NULL,	2,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'simple,virtual,downloadable,bundle',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(93,	NULL,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	'simple,virtual,configurable',	1,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(94,	NULL,	2,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL),
(95,	NULL,	2,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL),
(96,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(97,	'Magento\\Framework\\Data\\Form\\Element\\Hidden',	2,	1,	1,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	1,	0,	0,	0,	1,	0,	NULL),
(98,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'simple,virtual,downloadable,bundle,configurable',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(99,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	1,	0,	0,	0,	1,	0,	NULL),
(100,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(101,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL),
(102,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL),
(103,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(104,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL),
(105,	'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category',	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(106,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(107,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(108,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(109,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(110,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(111,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(112,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(113,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(114,	NULL,	2,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'simple,bundle,grouped,configurable',	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(115,	'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock',	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(116,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL),
(117,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(118,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(119,	NULL,	0,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(120,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(121,	NULL,	0,	1,	1,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(122,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(123,	'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type',	1,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'simple,virtual,downloadable,bundle,configurable',	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(124,	'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price',	2,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'simple,virtual,downloadable,bundle,configurable',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(125,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'downloadable',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(126,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'downloadable',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(127,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'downloadable',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(128,	NULL,	1,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'downloadable',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(129,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'bundle',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(130,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'bundle',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(131,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'bundle',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(132,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'bundle',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(133,	NULL,	1,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	'bundle',	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(134,	'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL),
(135,	NULL,	0,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	NULL),
(136,	NULL,	2,	1,	1,	0,	0,	0,	0,	0,	0,	1,	0,	'simple,virtual,downloadable,bundle,configurable',	0,	0,	0,	0,	0,	1,	0,	1,	1,	0,	NULL),
(137,	NULL,	2,	1,	1,	0,	0,	1,	0,	0,	0,	1,	0,	NULL,	0,	0,	0,	0,	0,	1,	0,	0,	1,	0,	NULL);

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
CREATE TABLE `catalog_product_bundle_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `required` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Option';


DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
CREATE TABLE `catalog_product_bundle_option_value` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `option_id` int unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `parent_product_id` int unsigned NOT NULL COMMENT 'Parent Product ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_BNDL_OPT_VAL_OPT_ID_PARENT_PRD_ID_STORE_ID` (`option_id`,`parent_product_id`,`store_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Option Value';


DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
CREATE TABLE `catalog_product_bundle_price_index` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `min_price` decimal(20,6) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Price Index';


DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
CREATE TABLE `catalog_product_bundle_selection` (
  `selection_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection ID',
  `option_id` int unsigned NOT NULL COMMENT 'Option ID',
  `parent_product_id` int unsigned NOT NULL COMMENT 'Parent Product ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `position` int unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Selection';


DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
CREATE TABLE `catalog_product_bundle_selection_price` (
  `selection_id` int unsigned NOT NULL COMMENT 'Selection ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `selection_price_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Selection Price Value',
  `parent_product_id` int unsigned NOT NULL COMMENT 'Parent Product ID',
  PRIMARY KEY (`selection_id`,`parent_product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Selection Price';


DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
CREATE TABLE `catalog_product_bundle_stock_index` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `stock_status` smallint DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Bundle Stock Index';


DROP TABLE IF EXISTS `catalog_product_entity`;
CREATE TABLE `catalog_product_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) NOT NULL COMMENT 'SKU',
  `has_options` smallint NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Table';

INSERT INTO `catalog_product_entity` (`entity_id`, `attribute_set_id`, `type_id`, `sku`, `has_options`, `required_options`, `created_at`, `updated_at`) VALUES
(1,	4,	'simple',	'Iswu124',	0,	0,	'2023-07-14 11:36:05',	'2023-07-15 12:10:54'),
(2,	4,	'simple',	'YTWCX12',	0,	0,	'2023-07-15 12:26:50',	'2023-07-15 12:29:46'),
(3,	4,	'simple',	'IEWUX13',	0,	0,	'2023-07-15 12:33:41',	'2023-07-15 12:34:22'),
(4,	4,	'simple',	'TOEX1233',	0,	0,	'2023-07-15 12:38:56',	'2023-07-15 12:38:56'),
(5,	4,	'simple',	'WFX135',	0,	0,	'2023-07-15 12:49:47',	'2023-07-15 12:49:47'),
(6,	4,	'simple',	'DDFDX145',	0,	0,	'2023-07-15 12:53:25',	'2023-07-15 12:53:25'),
(7,	4,	'simple',	'APJK123',	0,	0,	'2023-07-15 12:58:09',	'2023-07-15 12:58:30'),
(8,	4,	'simple',	'LASZU123',	0,	0,	'2023-07-15 13:01:57',	'2023-07-15 13:02:41'),
(9,	4,	'simple',	'TPOYSMX12',	0,	0,	'2023-07-15 13:05:10',	'2023-07-15 13:05:38'),
(10,	4,	'simple',	'BGYX123',	0,	0,	'2023-07-15 13:07:35',	'2023-07-15 13:08:18'),
(11,	4,	'simple',	'BEOFH123',	0,	0,	'2023-07-17 05:14:46',	'2023-07-17 05:15:10'),
(12,	4,	'simple',	'Drugs and Human Behavior',	0,	0,	'2023-07-17 05:17:41',	'2023-07-17 05:17:41'),
(13,	4,	'simple',	'TPKL1233',	0,	0,	'2023-07-17 05:21:33',	'2023-07-17 05:21:33'),
(14,	4,	'simple',	'Shiva to Shankara: Giving Form to the Formless',	0,	0,	'2023-07-17 05:24:08',	'2023-07-17 05:24:25');

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
CREATE TABLE `catalog_product_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Datetime Attribute Backend Table';


DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
CREATE TABLE `catalog_product_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(20,6) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Decimal Attribute Backend Table';

INSERT INTO `catalog_product_entity_decimal` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1,	77,	0,	1,	3.000000),
(2,	77,	0,	2,	1.500000),
(3,	77,	0,	3,	1.500000),
(4,	77,	0,	4,	1.200000),
(5,	77,	0,	5,	2.100000),
(6,	77,	0,	6,	2.100000),
(7,	77,	0,	7,	3.500000),
(8,	77,	0,	8,	1.400000),
(9,	77,	0,	9,	1.500000),
(10,	77,	0,	10,	4.200000),
(11,	77,	0,	11,	1.400000),
(12,	77,	0,	12,	4.200000),
(13,	77,	0,	13,	3.400000),
(14,	77,	0,	14,	3.200000);

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
CREATE TABLE `catalog_product_entity_gallery` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Gallery Attribute Backend Table';


DROP TABLE IF EXISTS `catalog_product_entity_int`;
CREATE TABLE `catalog_product_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID_STORE_ID_VALUE` (`attribute_id`,`store_id`,`value`),
  CONSTRAINT `CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Integer Attribute Backend Table';

INSERT INTO `catalog_product_entity_int` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1,	97,	0,	1,	1),
(2,	136,	0,	1,	2),
(3,	99,	0,	1,	4),
(4,	97,	0,	2,	1),
(5,	136,	0,	2,	2),
(6,	99,	0,	2,	4),
(7,	97,	0,	3,	1),
(8,	136,	0,	3,	2),
(9,	99,	0,	3,	4),
(10,	97,	0,	4,	1),
(11,	136,	0,	4,	2),
(12,	99,	0,	4,	4),
(13,	97,	0,	5,	1),
(14,	136,	0,	5,	2),
(15,	99,	0,	5,	4),
(16,	97,	0,	6,	1),
(17,	136,	0,	6,	2),
(18,	99,	0,	6,	4),
(19,	97,	0,	7,	1),
(20,	136,	0,	7,	2),
(21,	99,	0,	7,	4),
(22,	97,	0,	8,	1),
(23,	136,	0,	8,	2),
(24,	99,	0,	8,	4),
(25,	97,	0,	9,	1),
(26,	136,	0,	9,	2),
(27,	99,	0,	9,	4),
(28,	97,	0,	10,	1),
(29,	136,	0,	10,	2),
(30,	99,	0,	10,	4),
(31,	97,	0,	11,	1),
(32,	136,	0,	11,	2),
(33,	99,	0,	11,	4),
(34,	97,	0,	12,	1),
(35,	136,	0,	12,	2),
(36,	99,	0,	12,	4),
(37,	97,	0,	13,	1),
(38,	136,	0,	13,	2),
(39,	99,	0,	13,	4),
(40,	97,	0,	14,	1),
(41,	136,	0,	14,	2),
(42,	99,	0,	14,	4);

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
CREATE TABLE `catalog_product_entity_media_gallery` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Media Gallery Attribute Backend Table';

INSERT INTO `catalog_product_entity_media_gallery` (`value_id`, `attribute_id`, `value`, `media_type`, `disabled`) VALUES
(1,	90,	'/9/7/9781398518179.jpg',	'image',	0),
(2,	90,	'/9/7/9789354400704.jpg',	'image',	0),
(3,	90,	'/9/7/9781501110368.jpg',	'image',	0),
(4,	90,	'/9/7/9780143448341.jpg',	'image',	0),
(5,	90,	'/9/7/9789350292204.jpg',	'image',	0),
(6,	90,	'/9/7/9780143424420.jpg',	'image',	0),
(7,	90,	'/9/7/9789352643189.jpg',	'image',	0),
(8,	90,	'/9/7/9780143442295_1_.jpg',	'image',	0),
(9,	90,	'/9/7/9788172345662.jpg',	'image',	0),
(10,	90,	'/9/7/9789385986185.jpg',	'image',	0),
(11,	90,	'/9/7/9789351486091.jpg',	'image',	0),
(12,	90,	'/9/7/9780205153619.jpg',	'image',	0),
(13,	90,	'/9/7/9781405391245.jpg',	'image',	0),
(14,	90,	'/9/7/9789352641956.jpg',	'image',	0);

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
CREATE TABLE `catalog_product_entity_media_gallery_value` (
  `value_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record ID',
  PRIMARY KEY (`record_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_VAL_ID_STORE_ID` (`entity_id`,`value_id`,`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Media Gallery Attribute Value Table';

INSERT INTO `catalog_product_entity_media_gallery_value` (`value_id`, `store_id`, `entity_id`, `label`, `position`, `disabled`, `record_id`) VALUES
(1,	0,	1,	NULL,	1,	0,	10),
(2,	0,	2,	NULL,	1,	0,	15),
(3,	0,	3,	NULL,	1,	0,	16),
(4,	0,	4,	NULL,	1,	0,	17),
(5,	0,	5,	NULL,	1,	0,	18),
(6,	0,	6,	NULL,	1,	0,	19),
(7,	0,	7,	NULL,	1,	0,	20),
(8,	0,	8,	NULL,	1,	0,	21),
(9,	0,	9,	NULL,	1,	0,	22),
(10,	0,	10,	NULL,	1,	0,	24),
(11,	0,	11,	NULL,	1,	0,	25),
(12,	0,	12,	NULL,	1,	0,	26),
(13,	0,	13,	NULL,	1,	0,	27),
(14,	0,	14,	NULL,	1,	0,	28);

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_to_entity`;
CREATE TABLE `catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int unsigned NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int unsigned NOT NULL COMMENT 'Product Entity ID',
  PRIMARY KEY (`value_id`,`entity_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6C6C8FAA386736921D3A7C4B50B1185` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Link Media value to Product entity table';

INSERT INTO `catalog_product_entity_media_gallery_value_to_entity` (`value_id`, `entity_id`) VALUES
(1,	1),
(2,	2),
(3,	3),
(4,	4),
(5,	5),
(6,	6),
(7,	7),
(8,	8),
(9,	9),
(10,	10),
(11,	11),
(12,	12),
(13,	13),
(14,	14);

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value_video`;
CREATE TABLE `catalog_product_entity_media_gallery_value_video` (
  `value_id` int unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6FDF205946906B0E653E60AA769899F8` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Video Table';


DROP TABLE IF EXISTS `catalog_product_entity_text`;
CREATE TABLE `catalog_product_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` mediumtext COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Text Attribute Backend Table';

INSERT INTO `catalog_product_entity_text` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1,	137,	0,	1,	'Colleen Hoover'),
(4,	76,	0,	1,	'<p>Before It Ends with Us, it started with Atlas. Colleen Hoover tells fan favourite Atlas\' side of the story and shares what comes next in this long-anticipated sequel to the #1 Sunday Times bestseller It Ends with Us.</p>'),
(5,	137,	0,	2,	'Saranya Umakanthan'),
(6,	75,	0,	2,	'<style>#html-body [data-pb-style=B07YUYL]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"B07YUYL\"><div data-content-type=\"html\" data-appearance=\"default\" data-element=\"main\">&lt;h2&gt;About the Book&lt;/h2&gt;\r\n&lt;p&gt;Love can break the strongest of men and they are the ones to fall hard. But after the fall, will they be able to bounce back and start afresh? Will they ever realize that true love is supposed to ?build? them and not ?break? them? Siddharth Saxena, a young and dynamic CEO, falls apart when the girl he believes was his, leaves. Depression drives Sid into a web of darkness. His life slips, his business falters, and the world around him shatters. Shanaya enters his life as his wife, unaware of his personal battles. He likes her but does not want to acknowledge the feelings she evokes in him, as he is wary of falling into the trap of love again. But she trusts him and believes that his time will come. He cannot help but be inspired by her positivity which awakens a determination within him. With her by his side, can he rediscover himself and get his life back? Or will he stay broken forever? About the Author A university topper, Saranya Umakanthan is a software engineer by profession and a gadget freak. She is the author of the national bestseller One Day, Life Will Change, which captured the hearts of many readers. Having explored the genre of inspiring romance, she believes that she has found her forte. She has penned Your Time Will Come in the same genre. She hails from Virudhunagar, a small town in Tamil Nadu, and is currently based in Bangalore. With her passion for writing, she wishes to leave an imprint on people?s hearts, weaving beautiful stories with her words. She desires to spread positivity with her novels. A romantic by nature, Saranya loves gazing at the night sky while enjoying a cup of coffee. Nothing brings her more contentment than seeing a reader enjoy her book. She?s also a gadget freak. The fragrance and texture of paperbacks inspire her, and she hangs out in bookstores frequently. She would love to hear your feedback. Email: saranya.umakanthan@gmail.com Instagram: @saranya_umakanthan Facebook: authorsaranyaumakanthan Twitter: chayablossom &lt;/p&gt;</div></div></div>'),
(7,	85,	0,	2,	'Your Time Will Come'),
(8,	76,	0,	2,	'Love can break the strongest of men and they are the ones to fall hard. But after the fall, will they be able to bounce back and start afresh? Will they ever realize that true love is supposed to ?build? them and not ?break? them? Siddharth Saxena, a young and dynamic CEO, falls apart when the girl he believes was his, leaves. Depression drives Sid into a web of darkness.'),
(9,	137,	0,	3,	'Colleen Hoover'),
(10,	75,	0,	3,	'<style>#html-body [data-pb-style=H8K53IL]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"H8K53IL\"><div data-content-type=\"html\" data-appearance=\"default\" data-element=\"main\">&lt;h2&gt;About This Book &lt;/h2&gt;\r\n&lt;p&gt;From the #1 New York Times bestselling author of It Starts with Us and All Your Perfects, a \"brave and heartbreaking novel that digs its claws into you and doesn\'t let go, long after you\'ve finished it\" (Anna Todd, New York Times bestselling author) about a workaholic with a too-good-to-be-true romance can\'t stop thinking about her first love--soon to be a major motion picture starring Blake Lively and Justin Baldoni.&lt;/p&gt;\r\n&lt;p&gt;Lily hasn\'t always had it easy, but that\'s never stopped her from working hard for the life she wants. She\'s come a long way from the small town where she grew up--she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily\'s life seems too good to be true.&lt;/p&gt;\r\n\r\n&lt;p&gt;Ryle is assertive, stubborn, maybe even a little arrogant. He\'s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn\'t hurt. Lily can\'t get him out of her head. But Ryle\'s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his \"no dating\" rule, she can\'t help but wonder what made him that way in the first place.&lt;/p&gt;\r\n\r\n&lt;p&gt;As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan--her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.&lt;/p&gt;\r\n\r\n&lt;p&gt;An honest, evocative, and tender novel, It Ends with Us is \"a glorious and touching read, a forever keeper. The kind of book that gets handed down\" (USA TODAY).\r\nAbout the Author: Colleen Hoover is the #1 New York Times bestselling author of more than twenty-three novels, including It Ends with Us, All Your Perfects, Ugly Love, and Verity. In 2015, Colleen and her family founded a nonprofit called The Bookworm Box, a bookstore and monthly book subscription service. Colleen lives in Texas with her husband and their three boys. For more information, please visit ColleenHoover.com.&lt;/p&gt;</div></div></div>'),
(11,	85,	0,	3,	'It Ends with Us'),
(12,	76,	0,	3,	'From the #1 New York Times bestselling author of It Starts with Us and All Your Perfects, a \"brave and heartbreaking novel that digs its claws into you and doesn\'t let go, long after you\'ve finished it\" (Anna Todd, New York Times bestselling author) about a workaholic with a too-good-to-be-true romance can\'t stop thinking about her first love--soon to be a major motion picture starring Blake Lively and Justin Baldoni.'),
(13,	137,	0,	4,	'Datta Durjoy'),
(14,	75,	0,	4,	'<style>#html-body [data-pb-style=Y7T7JM9]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"Y7T7JM9\"><div data-content-type=\"html\" data-appearance=\"default\" data-element=\"main\">&lt;h2&gt;About The Book&lt;/h2&gt;\r\n&lt;p&gt;Born on the same day and at the same time, Druvan and Anvesha know they are soulmates in every sense of the word. Their parents, however, refuse to accept their \'togetherness\' at first and try to tear them apart. Druvan and Anvesha try their best to explain why that cannot happen.&lt;/p&gt;\r\n\r\n&lt;p&gt;In the same timeline, the world has made huge progress in science and some of the first experiments to combine the body and the soul have begun. This is an opportunity for them to prove their love and tell the world that it is love that can make the impossible, possible.&lt;/p&gt;\r\n\r\n&lt;p&gt;Druvan and Anvesha participate in the experiment as if their life depends on it, because it does. The only thing that remains to be seen is, will the dream of a man to control love and life come true? And when the time comes, can one stay true to their soulmate?&lt;/p&gt;\r\n\r\n</div></div></div>'),
(15,	85,	0,	4,	'Touch of Eternity '),
(16,	76,	0,	4,	'Born on the same day and at the same time, Druvan and Anvesha know they are soulmates in every sense of the word. Their parents, however, refuse to accept their \'togetherness\' at first and try to tear them apart. Druvan and Anvesha try their best to explain why that cannot happen.'),
(17,	137,	0,	5,	'Kuldip Nayar'),
(18,	75,	0,	5,	'<style>#html-body [data-pb-style=B0URKV1]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"B0URKV1\"><div data-content-type=\"text\" data-appearance=\"default\" data-element=\"main\"><p><strong>About the Book</strong></p>\r\n<p>Bhagat Singh 1907-31) lived at a time when India\'s freedom struggle was beginning to flag and when Mahatma Gandhi\'s non-violent, passive resistance to partial liberation was beginning to test the patience of the people. In this bestselling book, now published with a modern, contemporary look, Kuldip Nayar takes a close look at the man behind the martyr: his beliefs, his intellectual leanings, his dreams and his despair. The book explains for the first time why Hans Raj Vohra turned approver and betrayed Bhagat Singh, and throws new light on Sukhdev, whose loyalties have been questioned by some historians. But most of all it puts in perspective Bhagat Singh\'s use of violence, so strongly condemned by Gandhi and many others as being extremist.</p></div></div></div>'),
(19,	85,	0,	5,	'Without Fear'),
(20,	76,	0,	5,	'Bhagat Singh 1907-31) lived at a time when India\'s freedom struggle was beginning to flag and when Mahatma Gandhi\'s non-violent, passive resistance to partial liberation was beginning to test the patience of the people.'),
(21,	137,	0,	6,	'Neeraj Kumar'),
(22,	75,	0,	6,	'<style>#html-body [data-pb-style=W3PSI0O]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"W3PSI0O\"><div data-content-type=\"text\" data-appearance=\"default\" data-element=\"main\"><p><strong>About the Book</strong></p>\r\n<p>March 1993. Bombay is rocked by a series of bomb blasts. Unknown to most, Dawood Ibrahim, the mastermind behind the terror attack, makes several calls to the CBI, desperate to prove his ‘innocence’. January 2002. Aftab Ansari—a notorious Dubai-based criminal in cahoots with jihadi groups—is arrested just as he is about to escape on a forged passport to Pakistan.<br>The razor-sharp sleuthing of a brilliant IPS officer was behind these and other high-profile CBI missions. In his thirtyseven years of service, Neeraj Kumar neutralized several terror modules and decimated insidious organized crime syndicates across continents, working closely with Interpol, FBI, New Scotland Yard and numerous other agencies. In his candid recollections, Kumar<br>gives readers a fascinating glimpse into the workings of the CBI through eleven of his biggest cases—including the arrest of Abdul Latif, the unconquerable don of Gujarat; the capture of Jagtar Singh Tara, a dreaded terrorist behind Punjab CM Beant Singh’s assassination; and the nabbing of Romesh Sharma, a Dawood henchman masquerading as a Delhi-based politician.<br>Full of explosive details and nerve-racking suspense, Dial D for Don is an intimate look at some of the most thrilling crime stories of our times.</p></div></div></div>'),
(23,	85,	0,	6,	'Dial D for Don '),
(24,	76,	0,	6,	'March 1993. Bombay is rocked by a series of bomb blasts. Unknown to most, Dawood Ibrahim, the mastermind behind the terror attack, makes several calls to the CBI, desperate to prove his ‘innocence’. January 2002. Aftab Ansari—a notorious Dubai-based criminal in cahoots with jihadi groups—is arrested just as he is about to escape on a forged passport to Pakistan.'),
(25,	137,	0,	7,	'Arun Tiwari'),
(26,	75,	0,	7,	'<style>#html-body [data-pb-style=GUWPCPR]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"GUWPCPR\"><div data-content-type=\"text\" data-appearance=\"default\" data-element=\"main\"><p><strong>About the Book</strong></p>\r\n<p>Aeronautical engineer, rocket scientist, missile man, visionary, teacher and the most inspiring head of state in living memory - Avul Pakir Jainulabdeen Abdul Kalam was all these and more. Unquestionably the most revered Indian leader since Mahatma Gandhi</p></div></div></div>'),
(27,	85,	0,	7,	'A.P.J. Abdul Kalam '),
(28,	76,	0,	7,	'Aeronautical engineer, rocket scientist, missile man, visionary, teacher and the most inspiring head of state in living memory - Avul Pakir Jainulabdeen Abdul Kalam was all these and more. Unquestionably the most revered Indian leader since Mahatma Gandhi'),
(29,	137,	0,	8,	'Gaur Gopal Das'),
(30,	75,	0,	8,	'<style>#html-body [data-pb-style=J8JW1YO]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"J8JW1YO\"><div data-content-type=\"text\" data-appearance=\"default\" data-element=\"main\"><p><strong>About the Book</strong></p>\r\n<p>While navigating their way through Mumbai\'s horrendous traffic, Gaur Gopal Das and his wealthy young friend Harry get talking, delving into concepts ranging from the human condition to finding one\'s purpose in life and the key to lasting happiness. Whether you are looking at strengthening your relationships, discovering your true potential, understanding how to do well at work or even how you can give back to the world, Gaur Gopal Das takes us on an unforgettable journey with his precious insights on these areas of life. Das is one of the most popular and sought-after monks and life coaches in the world, having shared his wisdom with millions. His debut book, Life\'s Amazing Secrets, distils his experiences and lessons about life into a light-hearted, thought-provoking book that will help you align yourself with the life you want to live.</p></div></div></div>'),
(31,	85,	0,	8,	'Life\'s Amazing Secrets: How to Find Balance and Purpose in your life'),
(32,	76,	0,	8,	'While navigating their way through Mumbai\'s horrendous traffic, Gaur Gopal Das and his wealthy young friend Harry get talking, delving into concepts ranging from the human condition to finding one\'s purpose in life and the key to lasting happiness. '),
(33,	137,	0,	9,	'Dr Joseph Murphy'),
(34,	75,	0,	9,	'<style>#html-body [data-pb-style=N3WGQWJ]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"N3WGQWJ\"><div data-content-type=\"text\" data-appearance=\"default\" data-element=\"main\"><p><strong>About the Book</strong></p>\r\n<p>This remarkable book by Dr. Joseph Murphy, one of the pioneering voices of affirmative-thinking, will unlock for you the truly staggering powers of your subconscious mind.<br>&nbsp;<br>Combining time-honored spiritual wisdom with cutting edge scientific research, Dr. Murphy explains how the subconscious mind influences every single thing that you do and how, by understanding it and learning to control its incredible force, you can improve the quality of your daily life.<br>&nbsp;<br>Everything, from the promotion that you wanted and the raise you think you deserve, to overcoming phobias and bad habits and strengthening interpersonal relationships, The Power of Your Subconscious Mind will open a world of happiness, success, prosperity and peace for you. It will change your life and your world by changing your beliefs.</p></div></div></div>'),
(35,	85,	0,	9,	'The Power Of Your Subconscious Mind '),
(36,	76,	0,	9,	'This remarkable book by Dr. Joseph Murphy, one of the pioneering voices of affirmative-thinking, will unlock for you the truly staggering powers of your subconscious mind.'),
(37,	85,	0,	10,	'Bhagavad Gita: Yatharoop '),
(38,	137,	0,	10,	'A.C. Bhaktivedanta Swami Prabhupada'),
(39,	137,	0,	11,	'Dr. T.Swami Raju'),
(40,	85,	0,	11,	'Basic Elements of Hinduism'),
(41,	76,	0,	11,	'<strong>About the Book</strong>\r\n<p>Basic Elements of Hinduism</p>'),
(42,	137,	0,	12,	'David M'),
(43,	75,	0,	12,	'<style>#html-body [data-pb-style=UQQ1OB4]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"UQQ1OB4\"><div data-content-type=\"text\" data-appearance=\"default\" data-element=\"main\"><p><strong>About the Book</strong></p>\r\n<p>This text provides a general overview of the field of psychopharmacology and is most appropriate for second to third year level undergraduate students. It assumes no previous knowledge of biology or chemistry and includes definitions of technical jargon. The book covers commonly used psychoactive drugs; general factors of drug action in the nervous system; common properties of recreational/social drugs; and the theoretics of using drugs for treatment of mental and behavioural dysfuntion. It provides a balanced treatment of behavioural and psychological issues.</p></div></div></div>'),
(44,	85,	0,	12,	'Drugs and Human Behavior'),
(45,	76,	0,	12,	'This text provides a general overview of the field of psychopharmacology and is most appropriate for second to third year level undergraduate students. '),
(46,	137,	0,	13,	'Au,Dk'),
(47,	75,	0,	13,	'<style>#html-body [data-pb-style=QBBJ07O]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"QBBJ07O\"><div data-content-type=\"text\" data-appearance=\"default\" data-element=\"main\"><p><strong>About the Book</strong></p>\r\n<p>How does the brain remember faces? What makes us choose one decision over another? Where does language come from? With the use of images, quotations from all the major thinkers, and explanations that are easily understandable, this book demystifies hard-to-grasp concepts and shows how these have shaped our knowledge of the human mind.</p></div></div></div>'),
(48,	85,	0,	13,	'The Psychology Book'),
(49,	76,	0,	13,	'<p>How does the brain remember faces? What makes us choose one decision over another? Where does language come from? With the use of images, quotations from all the major thinkers, and explanations that are easily understandable, this book demystifies hard-to-grasp concepts and shows how these have shaped our knowledge of the human mind.</p>'),
(50,	137,	0,	14,	'Devdutt Pattanaik'),
(51,	75,	0,	14,	'<style>#html-body [data-pb-style=UHU9MO5]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}</style><div data-content-type=\"row\" data-appearance=\"contained\" data-element=\"main\"><div data-enable-parallax=\"0\" data-parallax-speed=\"0.5\" data-background-images=\"{}\" data-background-type=\"image\" data-video-loop=\"true\" data-video-play-only-visible=\"true\" data-video-lazy-load=\"true\" data-video-fallback-src=\"\" data-element=\"inner\" data-pb-style=\"UHU9MO5\"><div data-content-type=\"text\" data-appearance=\"default\" data-element=\"main\"><p><strong>About the Book</strong></p>\r\n<p>We live in times where people have extreme views. On the one hand, there are scholars who describe Shiva\'s linga literally as a phallus, and see all metaphoric meaning as embarrassed apology of the uneducated. On the other hand, we have puritanical Hindus who want to strip the Shiva linga of all sexual meaning and sanitize Shiva\'s lore. In both cases, a symbol is being reduced to a sign.</p>\r\n<p>In Shiva to Shankara, Devdutt Pattanaik, India\'s leading mythologist, seeks to bridge the gap. As he explores the layers of meanings embedded in Shiva\'s linga, we discover why and how the Goddess transforms Shiva, the hermit, into Shankara, the householder.</p></div></div></div>'),
(52,	85,	0,	14,	'Shiva to Shankara: Giving Form to the Formless'),
(53,	76,	0,	14,	'We live in times where people have extreme views. On the one hand, there are scholars who describe Shiva\'s linga literally as a phallus, and see all metaphoric meaning as embarrassed apology of the uneducated. On the other hand, we have puritanical Hindus who want to strip the Shiva linga of all sexual meaning and sanitize Shiva\'s lore. In both cases, a symbol is being reduced to a sign.');

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
CREATE TABLE `catalog_product_entity_tier_price` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Value',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `percentage_value` decimal(5,2) DEFAULT NULL COMMENT 'Percentage value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Tier Price Attribute Backend Table';


DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
CREATE TABLE `catalog_product_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Varchar Attribute Backend Table';

INSERT INTO `catalog_product_entity_varchar` (`value_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1,	134,	0,	1,	'2'),
(3,	84,	0,	1,	'It Starts with Us'),
(4,	124,	0,	1,	'0'),
(5,	73,	0,	1,	'It Starts with Us'),
(6,	106,	0,	1,	'container2'),
(7,	104,	0,	1,	'product-full-width'),
(8,	121,	0,	1,	'it-starts-with-us'),
(9,	87,	0,	1,	'/9/7/9781398518179.jpg'),
(10,	88,	0,	1,	'/9/7/9781398518179.jpg'),
(11,	135,	0,	1,	'/9/7/9781398518179.jpg'),
(12,	89,	0,	1,	'/9/7/9781398518179.jpg'),
(53,	134,	0,	2,	'2'),
(55,	84,	0,	2,	'Your Time Will Come'),
(56,	124,	0,	2,	'0'),
(57,	73,	0,	2,	'Your Time Will Come'),
(58,	106,	0,	2,	'container2'),
(59,	104,	0,	2,	'product-full-width'),
(60,	121,	0,	2,	'your-time-will-come'),
(61,	87,	0,	2,	'/9/7/9789354400704.jpg'),
(62,	88,	0,	2,	'/9/7/9789354400704.jpg'),
(63,	135,	0,	2,	'/9/7/9789354400704.jpg'),
(64,	89,	0,	2,	'/9/7/9789354400704.jpg'),
(85,	134,	0,	3,	'2'),
(86,	86,	0,	3,	'It Ends with Us #html-body [data-pb-style=H8K53IL]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}&lt;h2&gt;About This Book &lt;/h2&'),
(87,	84,	0,	3,	'It Ends with Us'),
(88,	124,	0,	3,	'0'),
(89,	73,	0,	3,	'It Ends with Us'),
(90,	106,	0,	3,	'container2'),
(91,	104,	0,	3,	'product-full-width'),
(92,	121,	0,	3,	'it-ends-with-us'),
(93,	87,	0,	3,	'/9/7/9781501110368.jpg'),
(94,	88,	0,	3,	'/9/7/9781501110368.jpg'),
(95,	135,	0,	3,	'/9/7/9781501110368.jpg'),
(96,	89,	0,	3,	'/9/7/9781501110368.jpg'),
(101,	134,	0,	4,	'2'),
(102,	87,	0,	4,	'/9/7/9780143448341.jpg'),
(103,	86,	0,	4,	'Touch of Eternity  #html-body [data-pb-style=Y7T7JM9]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}&lt;h2&gt;About The Book&lt;/h2'),
(104,	84,	0,	4,	'Touch of Eternity '),
(105,	124,	0,	4,	'0'),
(106,	73,	0,	4,	'Touch of Eternity '),
(107,	106,	0,	4,	'container2'),
(108,	104,	0,	4,	'product-full-width'),
(109,	88,	0,	4,	'/9/7/9780143448341.jpg'),
(110,	135,	0,	4,	'/9/7/9780143448341.jpg'),
(111,	89,	0,	4,	'/9/7/9780143448341.jpg'),
(112,	121,	0,	4,	'touch-of-eternity'),
(117,	134,	0,	5,	'2'),
(118,	87,	0,	5,	'/9/7/9789350292204.jpg'),
(119,	84,	0,	5,	'Without Fear'),
(120,	124,	0,	5,	'0'),
(121,	73,	0,	5,	'Without Fear'),
(122,	106,	0,	5,	'container2'),
(123,	104,	0,	5,	'product-full-width'),
(124,	88,	0,	5,	'/9/7/9789350292204.jpg'),
(125,	135,	0,	5,	'/9/7/9789350292204.jpg'),
(126,	89,	0,	5,	'/9/7/9789350292204.jpg'),
(127,	121,	0,	5,	'without-fear'),
(132,	134,	0,	6,	'2'),
(133,	87,	0,	6,	'/9/7/9780143424420.jpg'),
(134,	86,	0,	6,	'Dial D for Don  #html-body [data-pb-style=W3PSI0O]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}About the Book\r\nMarch 1993. Bombay'),
(135,	84,	0,	6,	'Dial D for Don '),
(136,	124,	0,	6,	'0'),
(137,	73,	0,	6,	'Dial D for Don '),
(138,	106,	0,	6,	'container2'),
(139,	104,	0,	6,	'product-full-width'),
(140,	88,	0,	6,	'/9/7/9780143424420.jpg'),
(141,	135,	0,	6,	'/9/7/9780143424420.jpg'),
(142,	89,	0,	6,	'/9/7/9780143424420.jpg'),
(143,	121,	0,	6,	'dial-d-for-don'),
(148,	134,	0,	7,	'2'),
(149,	86,	0,	7,	'A.P.J. Abdul Kalam  #html-body [data-pb-style=GUWPCPR]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}About the Book\r\nAeronautical e'),
(150,	84,	0,	7,	'A.P.J. Abdul Kalam '),
(151,	124,	0,	7,	'0'),
(152,	73,	0,	7,	'A.P.J. Abdul Kalam '),
(153,	106,	0,	7,	'container2'),
(154,	104,	0,	7,	'product-full-width'),
(155,	121,	0,	7,	'a-p-j-abdul-kalam'),
(156,	87,	0,	7,	'/9/7/9789352643189.jpg'),
(157,	88,	0,	7,	'/9/7/9789352643189.jpg'),
(158,	135,	0,	7,	'/9/7/9789352643189.jpg'),
(159,	89,	0,	7,	'/9/7/9789352643189.jpg'),
(164,	134,	0,	8,	'2'),
(165,	86,	0,	8,	'Life\'s Amazing Secrets: How to Find Balance and Purpose in your life #html-body [data-pb-style=J8JW1YO]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background'),
(166,	84,	0,	8,	'Life\'s Amazing Secrets: How to Find Balance and Purpose in your life'),
(167,	124,	0,	8,	'0'),
(168,	73,	0,	8,	'Life\'s Amazing Secrets: How to Find Balance and Purpose in your life'),
(169,	106,	0,	8,	'container2'),
(170,	104,	0,	8,	'product-full-width'),
(171,	121,	0,	8,	'life-s-amazing-secrets-how-to-find-balance-and-purpose-in-your-life'),
(172,	87,	0,	8,	'/9/7/9780143442295_1_.jpg'),
(173,	88,	0,	8,	'/9/7/9780143442295_1_.jpg'),
(174,	135,	0,	8,	'/9/7/9780143442295_1_.jpg'),
(175,	89,	0,	8,	'/9/7/9780143442295_1_.jpg'),
(180,	134,	0,	9,	'2'),
(181,	86,	0,	9,	'The Power Of Your Subconscious Mind  #html-body [data-pb-style=N3WGQWJ]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}About the Boo'),
(182,	84,	0,	9,	'The Power Of Your Subconscious Mind '),
(183,	124,	0,	9,	'0'),
(184,	73,	0,	9,	'The Power Of Your Subconscious Mind '),
(185,	106,	0,	9,	'container2'),
(186,	104,	0,	9,	'product-full-width'),
(187,	121,	0,	9,	'the-power-of-your-subconscious-mind'),
(188,	87,	0,	9,	'/9/7/9788172345662.jpg'),
(189,	88,	0,	9,	'/9/7/9788172345662.jpg'),
(190,	135,	0,	9,	'/9/7/9788172345662.jpg'),
(191,	89,	0,	9,	'/9/7/9788172345662.jpg'),
(196,	134,	0,	10,	'2'),
(197,	87,	0,	10,	'/9/7/9789385986185.jpg'),
(198,	86,	0,	10,	'Bhagavad Gita: Yatharoop  '),
(199,	84,	0,	10,	'Bhagavad Gita: Yatharoop '),
(200,	124,	0,	10,	'0'),
(201,	73,	0,	10,	'Bhagavad Gita: Yatharoop '),
(202,	106,	0,	10,	'container2'),
(203,	104,	0,	10,	'product-full-width'),
(204,	88,	0,	10,	'/9/7/9789385986185.jpg'),
(205,	135,	0,	10,	'/9/7/9789385986185.jpg'),
(206,	89,	0,	10,	'/9/7/9789385986185.jpg'),
(207,	121,	0,	10,	'bhagavad-gita-yatharoop'),
(216,	134,	0,	11,	'2'),
(217,	86,	0,	11,	'Basic Elements of Hinduism '),
(218,	84,	0,	11,	'Basic Elements of Hinduism'),
(219,	124,	0,	11,	'0'),
(220,	73,	0,	11,	'Basic Elements of Hinduism'),
(221,	106,	0,	11,	'container2'),
(222,	104,	0,	11,	'product-full-width'),
(223,	121,	0,	11,	'basic-elements-of-hinduism'),
(224,	87,	0,	11,	'/9/7/9789351486091.jpg'),
(225,	88,	0,	11,	'/9/7/9789351486091.jpg'),
(226,	135,	0,	11,	'/9/7/9789351486091.jpg'),
(227,	89,	0,	11,	'/9/7/9789351486091.jpg'),
(232,	134,	0,	12,	'2'),
(233,	87,	0,	12,	'/9/7/9780205153619.jpg'),
(234,	86,	0,	12,	'Drugs and Human Behavior #html-body [data-pb-style=UQQ1OB4]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}About the Book\r\nThis text'),
(235,	84,	0,	12,	'Drugs and Human Behavior'),
(236,	124,	0,	12,	'0'),
(237,	73,	0,	12,	'Drugs and Human Behavior'),
(238,	106,	0,	12,	'container2'),
(239,	104,	0,	12,	'product-full-width'),
(240,	88,	0,	12,	'/9/7/9780205153619.jpg'),
(241,	135,	0,	12,	'/9/7/9780205153619.jpg'),
(242,	89,	0,	12,	'/9/7/9780205153619.jpg'),
(243,	121,	0,	12,	'drugs-and-human-behavior'),
(248,	134,	0,	13,	'2'),
(249,	87,	0,	13,	'/9/7/9781405391245.jpg'),
(250,	86,	0,	13,	'The Psychology Book #html-body [data-pb-style=QBBJ07O]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}About the Book\r\nHow does the b'),
(251,	84,	0,	13,	'The Psychology Book'),
(252,	124,	0,	13,	'0'),
(253,	73,	0,	13,	'The Psychology Book'),
(254,	106,	0,	13,	'container2'),
(255,	104,	0,	13,	'product-full-width'),
(256,	88,	0,	13,	'/9/7/9781405391245.jpg'),
(257,	135,	0,	13,	'/9/7/9781405391245.jpg'),
(258,	89,	0,	13,	'/9/7/9781405391245.jpg'),
(259,	121,	0,	13,	'the-psychology-book'),
(264,	134,	0,	14,	'2'),
(265,	86,	0,	14,	'Shiva to Shankara: Giving Form to the Formless #html-body [data-pb-style=UHU9MO5]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}Abo'),
(266,	84,	0,	14,	'Shiva to Shankara: Giving Form to the Formless'),
(267,	124,	0,	14,	'0'),
(268,	73,	0,	14,	'Shiva to Shankara: Giving Form to the Formless'),
(269,	106,	0,	14,	'container2'),
(270,	104,	0,	14,	'product-full-width'),
(271,	121,	0,	14,	'shiva-to-shankara-giving-form-to-the-formless'),
(272,	87,	0,	14,	'/9/7/9789352641956.jpg'),
(273,	88,	0,	14,	'/9/7/9789352641956.jpg'),
(274,	135,	0,	14,	'/9/7/9789352641956.jpg'),
(275,	89,	0,	14,	'/9/7/9789352641956.jpg');

DROP TABLE IF EXISTS `catalog_product_frontend_action`;
CREATE TABLE `catalog_product_frontend_action` (
  `action_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Action ID',
  `type_id` varchar(64) NOT NULL COMMENT 'Type of product action',
  `visitor_id` int unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `added_at` bigint NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_VISITOR_ID_PRODUCT_ID_TYPE_ID` (`visitor_id`,`product_id`,`type_id`),
  UNIQUE KEY `CATALOG_PRODUCT_FRONTEND_ACTION_CUSTOMER_ID_PRODUCT_ID_TYPE_ID` (`customer_id`,`product_id`,`type_id`),
  KEY `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_FRONTEND_ACTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Frontend Action Table';


DROP TABLE IF EXISTS `catalog_product_index_eav`;
CREATE TABLE `catalog_product_index_eav` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` int unsigned NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Index Table';

INSERT INTO `catalog_product_index_eav` (`entity_id`, `attribute_id`, `store_id`, `value`, `source_id`) VALUES
(1,	99,	1,	4,	1),
(2,	99,	1,	4,	2),
(3,	99,	1,	4,	3),
(4,	99,	1,	4,	4),
(5,	99,	1,	4,	5),
(6,	99,	1,	4,	6),
(7,	99,	1,	4,	7),
(8,	99,	1,	4,	8),
(9,	99,	1,	4,	9),
(10,	99,	1,	4,	10),
(11,	99,	1,	4,	11),
(12,	99,	1,	4,	12),
(13,	99,	1,	4,	13),
(14,	99,	1,	4,	14);

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
CREATE TABLE `catalog_product_index_eav_decimal` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Index Table';


DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
CREATE TABLE `catalog_product_index_eav_decimal_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Indexer Index Table';


DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_replica`;
CREATE TABLE `catalog_product_index_eav_decimal_replica` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Index Table';


DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
CREATE TABLE `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';


DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
CREATE TABLE `catalog_product_index_eav_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` int unsigned NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Indexer Index Table';


DROP TABLE IF EXISTS `catalog_product_index_eav_replica`;
CREATE TABLE `catalog_product_index_eav_replica` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` int unsigned NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Index Table';

INSERT INTO `catalog_product_index_eav_replica` (`entity_id`, `attribute_id`, `store_id`, `value`, `source_id`) VALUES
(1,	99,	1,	4,	1);

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
CREATE TABLE `catalog_product_index_eav_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` int unsigned NOT NULL COMMENT 'Value',
  `source_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Original entity ID for attribute value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`,`source_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product EAV Indexer Temp Table';


DROP TABLE IF EXISTS `catalog_product_index_price`;
CREATE TABLE `catalog_product_index_price` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Index Table';

INSERT INTO `catalog_product_index_price` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`) VALUES
(1,	0,	1,	2,	3.000000,	3.000000,	3.000000,	3.000000,	NULL),
(1,	1,	1,	2,	3.000000,	3.000000,	3.000000,	3.000000,	NULL),
(1,	2,	1,	2,	3.000000,	3.000000,	3.000000,	3.000000,	NULL),
(1,	3,	1,	2,	3.000000,	3.000000,	3.000000,	3.000000,	NULL),
(2,	0,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(2,	1,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(2,	2,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(2,	3,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(3,	0,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(3,	1,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(3,	2,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(3,	3,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(4,	0,	1,	2,	1.200000,	1.200000,	1.200000,	1.200000,	NULL),
(4,	1,	1,	2,	1.200000,	1.200000,	1.200000,	1.200000,	NULL),
(4,	2,	1,	2,	1.200000,	1.200000,	1.200000,	1.200000,	NULL),
(4,	3,	1,	2,	1.200000,	1.200000,	1.200000,	1.200000,	NULL),
(5,	0,	1,	2,	2.100000,	2.100000,	2.100000,	2.100000,	NULL),
(5,	1,	1,	2,	2.100000,	2.100000,	2.100000,	2.100000,	NULL),
(5,	2,	1,	2,	2.100000,	2.100000,	2.100000,	2.100000,	NULL),
(5,	3,	1,	2,	2.100000,	2.100000,	2.100000,	2.100000,	NULL),
(6,	0,	1,	2,	2.100000,	2.100000,	2.100000,	2.100000,	NULL),
(6,	1,	1,	2,	2.100000,	2.100000,	2.100000,	2.100000,	NULL),
(6,	2,	1,	2,	2.100000,	2.100000,	2.100000,	2.100000,	NULL),
(6,	3,	1,	2,	2.100000,	2.100000,	2.100000,	2.100000,	NULL),
(7,	0,	1,	2,	3.500000,	3.500000,	3.500000,	3.500000,	NULL),
(7,	1,	1,	2,	3.500000,	3.500000,	3.500000,	3.500000,	NULL),
(7,	2,	1,	2,	3.500000,	3.500000,	3.500000,	3.500000,	NULL),
(7,	3,	1,	2,	3.500000,	3.500000,	3.500000,	3.500000,	NULL),
(8,	0,	1,	2,	1.400000,	1.400000,	1.400000,	1.400000,	NULL),
(8,	1,	1,	2,	1.400000,	1.400000,	1.400000,	1.400000,	NULL),
(8,	2,	1,	2,	1.400000,	1.400000,	1.400000,	1.400000,	NULL),
(8,	3,	1,	2,	1.400000,	1.400000,	1.400000,	1.400000,	NULL),
(9,	0,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(9,	1,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(9,	2,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(9,	3,	1,	2,	1.500000,	1.500000,	1.500000,	1.500000,	NULL),
(10,	0,	1,	2,	4.200000,	4.200000,	4.200000,	4.200000,	NULL),
(10,	1,	1,	2,	4.200000,	4.200000,	4.200000,	4.200000,	NULL),
(10,	2,	1,	2,	4.200000,	4.200000,	4.200000,	4.200000,	NULL),
(10,	3,	1,	2,	4.200000,	4.200000,	4.200000,	4.200000,	NULL),
(11,	0,	1,	2,	1.400000,	1.400000,	1.400000,	1.400000,	NULL),
(11,	1,	1,	2,	1.400000,	1.400000,	1.400000,	1.400000,	NULL),
(11,	2,	1,	2,	1.400000,	1.400000,	1.400000,	1.400000,	NULL),
(11,	3,	1,	2,	1.400000,	1.400000,	1.400000,	1.400000,	NULL),
(12,	0,	1,	2,	4.200000,	4.200000,	4.200000,	4.200000,	NULL),
(12,	1,	1,	2,	4.200000,	4.200000,	4.200000,	4.200000,	NULL),
(12,	2,	1,	2,	4.200000,	4.200000,	4.200000,	4.200000,	NULL),
(12,	3,	1,	2,	4.200000,	4.200000,	4.200000,	4.200000,	NULL),
(13,	0,	1,	2,	3.400000,	3.400000,	3.400000,	3.400000,	NULL),
(13,	1,	1,	2,	3.400000,	3.400000,	3.400000,	3.400000,	NULL),
(13,	2,	1,	2,	3.400000,	3.400000,	3.400000,	3.400000,	NULL),
(13,	3,	1,	2,	3.400000,	3.400000,	3.400000,	3.400000,	NULL),
(14,	0,	1,	2,	3.200000,	3.200000,	3.200000,	3.200000,	NULL),
(14,	1,	1,	2,	3.200000,	3.200000,	3.200000,	3.200000,	NULL),
(14,	2,	1,	2,	3.200000,	3.200000,	3.200000,	3.200000,	NULL),
(14,	3,	1,	2,	3.200000,	3.200000,	3.200000,	3.200000,	NULL);

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
CREATE TABLE `catalog_product_index_price_bundle_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price_type` smallint unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(20,6) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(20,6) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Idx';


DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
CREATE TABLE `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Opt Idx';


DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
CREATE TABLE `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Opt Tmp';


DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
CREATE TABLE `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `selection_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Selection ID',
  `group_type` smallint unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Sel Idx';


DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
CREATE TABLE `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `selection_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Selection ID',
  `group_type` smallint unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Sel Tmp';


DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
CREATE TABLE `catalog_product_index_price_bundle_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price_type` smallint unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(20,6) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(20,6) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Index Price Bundle Tmp';


DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';


DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
CREATE TABLE `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';


DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
CREATE TABLE `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Index Table';


DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
CREATE TABLE `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Config Option Temp Table';


DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
CREATE TABLE `catalog_product_index_price_downlod_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Minimum price',
  `max_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Indexer Table for price of downloadable products';


DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
CREATE TABLE `catalog_product_index_price_downlod_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int NOT NULL,
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Minimum price',
  `max_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary Indexer Table for price of downloadable products';


DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
CREATE TABLE `catalog_product_index_price_final_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Final Index Table';


DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
CREATE TABLE `catalog_product_index_price_final_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(20,6) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(20,6) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Final Temp Table';


DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
CREATE TABLE `catalog_product_index_price_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Index Table';


DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
CREATE TABLE `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';


DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
CREATE TABLE `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';


DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
CREATE TABLE `catalog_product_index_price_opt_idx` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Index Table';


DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
CREATE TABLE `catalog_product_index_price_opt_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Option Temp Table';


DROP TABLE IF EXISTS `catalog_product_index_price_replica`;
CREATE TABLE `catalog_product_index_price_replica` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Index Table';

INSERT INTO `catalog_product_index_price_replica` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`) VALUES
(1,	0,	1,	2,	3.000000,	3.000000,	3.000000,	3.000000,	NULL),
(1,	1,	1,	2,	3.000000,	3.000000,	3.000000,	3.000000,	NULL),
(1,	2,	1,	2,	3.000000,	3.000000,	3.000000,	3.000000,	NULL),
(1,	3,	1,	2,	3.000000,	3.000000,	3.000000,	3.000000,	NULL);

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
CREATE TABLE `catalog_product_index_price_tmp` (
  `entity_id` int unsigned NOT NULL COMMENT 'Product ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(20,6) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(20,6) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(20,6) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(20,6) DEFAULT NULL COMMENT 'Tier Price',
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Price Indexer Temp Table';


DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
CREATE TABLE `catalog_product_index_tier_price` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(20,6) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Tier Price Index Table';


DROP TABLE IF EXISTS `catalog_product_index_website`;
CREATE TABLE `catalog_product_index_website` (
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `default_store_id` smallint unsigned NOT NULL COMMENT 'Default store ID for website',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Website Index Table';

INSERT INTO `catalog_product_index_website` (`website_id`, `default_store_id`, `website_date`, `rate`) VALUES
(1,	1,	'2023-07-17',	1);

DROP TABLE IF EXISTS `catalog_product_link`;
CREATE TABLE `catalog_product_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  CONSTRAINT `CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product To Product Linkage Table';

INSERT INTO `catalog_product_link` (`link_id`, `product_id`, `linked_product_id`, `link_type_id`) VALUES
(4,	2,	1,	1);

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
CREATE TABLE `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Attribute Table';

INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES
(1,	1,	'position',	'int'),
(2,	4,	'position',	'int'),
(3,	5,	'position',	'int'),
(4,	3,	'position',	'int'),
(5,	3,	'qty',	'decimal');

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
CREATE TABLE `catalog_product_link_attribute_decimal` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Decimal Attribute Table';


DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
CREATE TABLE `catalog_product_link_attribute_int` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int unsigned NOT NULL COMMENT 'Link ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Integer Attribute Table';

INSERT INTO `catalog_product_link_attribute_int` (`value_id`, `product_link_attribute_id`, `link_id`, `value`) VALUES
(4,	1,	4,	1);

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
CREATE TABLE `catalog_product_link_attribute_varchar` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Varchar Attribute Table';


DROP TABLE IF EXISTS `catalog_product_link_type`;
CREATE TABLE `catalog_product_link_type` (
  `link_type_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Link Type Table';

INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES
(1,	'relation'),
(3,	'super'),
(4,	'up_sell'),
(5,	'cross_sell');

DROP TABLE IF EXISTS `catalog_product_option`;
CREATE TABLE `catalog_product_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Table';


DROP TABLE IF EXISTS `catalog_product_option_price`;
CREATE TABLE `catalog_product_option_price` (
  `option_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Price Table';


DROP TABLE IF EXISTS `catalog_product_option_title`;
CREATE TABLE `catalog_product_option_title` (
  `option_title_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Title Table';


DROP TABLE IF EXISTS `catalog_product_option_type_price`;
CREATE TABLE `catalog_product_option_type_price` (
  `option_type_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Type Price Table';


DROP TABLE IF EXISTS `catalog_product_option_type_title`;
CREATE TABLE `catalog_product_option_type_title` (
  `option_type_title_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Type Title Table';


DROP TABLE IF EXISTS `catalog_product_option_type_value`;
CREATE TABLE `catalog_product_option_type_value` (
  `option_type_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Option Type Value Table';


DROP TABLE IF EXISTS `catalog_product_relation`;
CREATE TABLE `catalog_product_relation` (
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Relation Table';


DROP TABLE IF EXISTS `catalog_product_super_attribute`;
CREATE TABLE `catalog_product_super_attribute` (
  `product_super_attribute_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  CONSTRAINT `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Super Attribute Table';


DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
CREATE TABLE `catalog_product_super_attribute_label` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Super Attribute Label Table';


DROP TABLE IF EXISTS `catalog_product_super_link`;
CREATE TABLE `catalog_product_super_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product Super Link Table';


DROP TABLE IF EXISTS `catalog_product_website`;
CREATE TABLE `catalog_product_website` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Product To Website Linkage Table';

INSERT INTO `catalog_product_website` (`product_id`, `website_id`) VALUES
(1,	1),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	1),
(8,	1),
(9,	1),
(10,	1),
(11,	1),
(12,	1),
(13,	1),
(14,	1);

DROP TABLE IF EXISTS `catalog_url_rewrite_product_category`;
CREATE TABLE `catalog_url_rewrite_product_category` (
  `url_rewrite_id` int unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int unsigned NOT NULL COMMENT 'category_id',
  `product_id` int unsigned NOT NULL COMMENT 'product_id',
  PRIMARY KEY (`url_rewrite_id`),
  KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BB79E64705D7F17FE181F23144528FC8` FOREIGN KEY (`url_rewrite_id`) REFERENCES `url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='url_rewrite_relation';


DROP TABLE IF EXISTS `cataloginventory_stock`;
CREATE TABLE `cataloginventory_stock` (
  `stock_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock';

INSERT INTO `cataloginventory_stock` (`stock_id`, `website_id`, `stock_name`) VALUES
(1,	0,	'Default');

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
CREATE TABLE `cataloginventory_stock_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `stock_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Stock ID',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID_PRODUCT_ID` (`website_id`,`product_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Item';

INSERT INTO `cataloginventory_stock_item` (`item_id`, `product_id`, `stock_id`, `qty`, `min_qty`, `use_config_min_qty`, `is_qty_decimal`, `backorders`, `use_config_backorders`, `min_sale_qty`, `use_config_min_sale_qty`, `max_sale_qty`, `use_config_max_sale_qty`, `is_in_stock`, `low_stock_date`, `notify_stock_qty`, `use_config_notify_stock_qty`, `manage_stock`, `use_config_manage_stock`, `stock_status_changed_auto`, `use_config_qty_increments`, `qty_increments`, `use_config_enable_qty_inc`, `enable_qty_increments`, `is_decimal_divided`, `website_id`) VALUES
(1,	1,	1,	100.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(8,	2,	1,	50.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(15,	3,	1,	35.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(18,	4,	1,	90.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(20,	5,	1,	100.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(22,	6,	1,	42.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(24,	7,	1,	233.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(27,	8,	1,	132.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(30,	9,	1,	133.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(33,	10,	1,	100.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(36,	11,	1,	100.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(39,	12,	1,	35.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(41,	13,	1,	103.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0),
(43,	14,	1,	104.0000,	0.0000,	1,	0,	0,	1,	1.0000,	1,	10000.0000,	1,	1,	NULL,	1.0000,	1,	1,	1,	0,	1,	1.0000,	1,	0,	0,	0);

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
CREATE TABLE `cataloginventory_stock_status` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status';

INSERT INTO `cataloginventory_stock_status` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(1,	0,	1,	100.0000,	1),
(2,	0,	1,	50.0000,	1),
(3,	0,	1,	35.0000,	1),
(4,	0,	1,	90.0000,	1),
(5,	0,	1,	100.0000,	1),
(6,	0,	1,	42.0000,	1),
(7,	0,	1,	233.0000,	1),
(8,	0,	1,	132.0000,	1),
(9,	0,	1,	133.0000,	1),
(10,	0,	1,	100.0000,	1),
(11,	0,	1,	100.0000,	1),
(12,	0,	1,	35.0000,	1),
(13,	0,	1,	103.0000,	1),
(14,	0,	1,	104.0000,	1);

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
CREATE TABLE `cataloginventory_stock_status_idx` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status Indexer Idx';


DROP TABLE IF EXISTS `cataloginventory_stock_status_replica`;
CREATE TABLE `cataloginventory_stock_status_replica` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_STATUS` (`stock_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status';

INSERT INTO `cataloginventory_stock_status_replica` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(1,	0,	1,	100.0000,	1);

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
CREATE TABLE `cataloginventory_stock_status_tmp` (
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `stock_id` smallint unsigned NOT NULL COMMENT 'Stock ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cataloginventory Stock Status Indexer Tmp';


DROP TABLE IF EXISTS `catalogrule`;
CREATE TABLE `catalogrule` (
  `rule_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Discount Amount',
  PRIMARY KEY (`rule_id`),
  KEY `CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule';


DROP TABLE IF EXISTS `catalogrule_customer_group`;
CREATE TABLE `catalogrule_customer_group` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Rules To Customer Groups Relations';


DROP TABLE IF EXISTS `catalogrule_group_website`;
CREATE TABLE `catalogrule_group_website` (
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Group Website';


DROP TABLE IF EXISTS `catalogrule_group_website_replica`;
CREATE TABLE `catalogrule_group_website_replica` (
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_group_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Group Website';


DROP TABLE IF EXISTS `catalogrule_product`;
CREATE TABLE `catalogrule_product` (
  `rule_product_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product ID',
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `from_time` int unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Action Amount',
  `action_stop` smallint NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product';


DROP TABLE IF EXISTS `catalogrule_product_price`;
CREATE TABLE `catalogrule_product_price` (
  `rule_product_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `rule_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Rule Price',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product Price';


DROP TABLE IF EXISTS `catalogrule_product_price_replica`;
CREATE TABLE `catalogrule_product_price_replica` (
  `rule_product_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `rule_price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Rule Price',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product Price';


DROP TABLE IF EXISTS `catalogrule_product_replica`;
CREATE TABLE `catalogrule_product_replica` (
  `rule_product_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product ID',
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `from_time` int unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` int DEFAULT NULL,
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Action Amount',
  `action_stop` smallint NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `UNQ_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CatalogRule Product';


DROP TABLE IF EXISTS `catalogrule_website`;
CREATE TABLE `catalogrule_website` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Catalog Rules To Websites Relations';


DROP TABLE IF EXISTS `catalogsearch_recommendations`;
CREATE TABLE `catalogsearch_recommendations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `query_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Query ID',
  `relation_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Relation ID',
  PRIMARY KEY (`id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` (`query_id`),
  KEY `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` (`relation_id`),
  CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_QUERY_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`query_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGSEARCH_RECOMMENDATIONS_RELATION_ID_SEARCH_QUERY_QUERY_ID` FOREIGN KEY (`relation_id`) REFERENCES `search_query` (`query_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Advanced Search Recommendations';


DROP TABLE IF EXISTS `checkout_agreement`;
CREATE TABLE `checkout_agreement` (
  `agreement_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint NOT NULL DEFAULT '0' COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Checkout Agreement';


DROP TABLE IF EXISTS `checkout_agreement_store`;
CREATE TABLE `checkout_agreement_store` (
  `agreement_id` int unsigned NOT NULL COMMENT 'Agreement ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Checkout Agreement Store';


DROP TABLE IF EXISTS `cms_block`;
CREATE TABLE `cms_block` (
  `block_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Block Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Block Modification Time',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`),
  KEY `CMS_BLOCK_IDENTIFIER` (`identifier`),
  FULLTEXT KEY `CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Block Table';


DROP TABLE IF EXISTS `cms_block_store`;
CREATE TABLE `cms_block_store` (
  `block_id` smallint NOT NULL,
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Block To Store Linkage Table';


DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE `cms_page` (
  `page_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Page Creation Time',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Page Modification Time',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `layout_update_selected` varchar(128) DEFAULT NULL COMMENT 'Page Custom Layout File',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Meta Title',
  PRIMARY KEY (`page_id`),
  KEY `CMS_PAGE_IDENTIFIER` (`identifier`),
  FULLTEXT KEY `CMS_PAGE_TITLE_META_KEYWORDS_META_DESCRIPTION_IDENTIFIER_CONTENT` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Page Table';

INSERT INTO `cms_page` (`page_id`, `title`, `page_layout`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `layout_update_selected`, `custom_theme_from`, `custom_theme_to`, `meta_title`) VALUES
(1,	'404 Not Found',	'2columns-right',	'Page keywords',	'Page description',	'no-route',	'Whoops, our bad...',	'<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n',	'2023-07-14 05:04:10',	'2023-07-14 05:04:10',	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	'Home page',	'1column',	NULL,	NULL,	'home',	'Home Page',	'<p>CMS homepage content goes here.</p>\r\n',	'2023-07-14 05:04:10',	'2023-07-14 05:04:11',	1,	0,	'<!--\n    <referenceContainer name=\"right\">\n        <referenceBlock name=\"catalog.compare.sidebar\" remove=\"true\" />\n    </referenceContainer>-->',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(3,	'Enable Cookies',	'1column',	NULL,	NULL,	'enable-cookies',	'What are Cookies?',	'<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>',	'2023-07-14 05:04:10',	'2023-07-14 05:04:10',	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(4,	'Privacy and Cookie Policy',	'1column',	NULL,	NULL,	'privacy-policy-cookie-restriction-mode',	'Privacy and Cookie Policy',	'<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table data-table-definition-list\">\n        <thead>\n        <tr>\n            <th>Cookie Name</th>\n            <th>Cookie Description</th>\n        </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores randomly generated key used to prevent forged requests.</td>\n            </tr>\n            <tr>\n                <th>PHPSESSID</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to view and edit their orders.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history, if you have asked for this.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-SESSID</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-STORAGE-SECTION-INVALIDATION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-CACHE-TIMEOUT</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>SECTION-DATA-IDS</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>PRIVATE_CONTENT_VERSION</th>\n                <td>Facilitates caching of content on the browser to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>X-MAGENTO-VARY</th>\n                <td>Facilitates caching of content on the server to make pages load faster.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-FILE-VERSION</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n            <tr>\n                <th>MAGE-TRANSLATION-STORAGE</th>\n                <td>Facilitates translation of content to other languages.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>',	'2023-07-14 05:04:10',	'2023-07-14 05:04:10',	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `cms_page_store`;
CREATE TABLE `cms_page_store` (
  `page_id` smallint NOT NULL COMMENT 'Entity ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='CMS Page To Store Linkage Table';

INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES
(1,	0),
(2,	0),
(3,	0),
(4,	0);

DROP TABLE IF EXISTS `core_config_data`;
CREATE TABLE `core_config_data` (
  `config_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config ID',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int NOT NULL DEFAULT '0' COMMENT 'Config Scope ID',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Config Data';

INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`, `updated_at`) VALUES
(1,	'default',	0,	'web/seo/use_rewrites',	'1',	'2023-07-14 05:04:07'),
(2,	'default',	0,	'web/unsecure/base_url',	'http://dev.magento.com/',	'2023-07-14 05:04:08'),
(3,	'default',	0,	'general/locale/code',	'en_US',	'2023-07-14 05:04:08'),
(4,	'default',	0,	'general/locale/timezone',	'America/Chicago',	'2023-07-14 05:04:08'),
(5,	'default',	0,	'currency/options/base',	'USD',	'2023-07-14 05:04:08'),
(6,	'default',	0,	'currency/options/default',	'USD',	'2023-07-14 05:04:08'),
(7,	'default',	0,	'currency/options/allow',	'USD',	'2023-07-14 05:04:08'),
(8,	'default',	0,	'general/region/display_all',	'1',	'2023-07-14 05:04:08'),
(9,	'default',	0,	'general/region/state_required',	'AL,AR,AU,BG,BO,BR,BY,CA,CH,CL,CN,CO,CZ,DK,EC,EE,ES,GR,GY,HR,IN,IS,IT,LT,LV,MX,PE,PL,PT,PY,RO,SE,SR,US,UY,VE',	'2023-07-14 05:04:10'),
(10,	'default',	0,	'catalog/category/root_id',	'2',	'2023-07-14 05:04:11'),
(11,	'default',	0,	'analytics/subscription/enabled',	'1',	'2023-07-14 05:04:11'),
(12,	'default',	0,	'crontab/default/jobs/analytics_subscribe/schedule/cron_expr',	'0 * * * *',	'2023-07-14 05:04:11'),
(13,	'default',	0,	'crontab/default/jobs/analytics_collect_data/schedule/cron_expr',	'00 02 * * *',	'2023-07-14 05:04:11'),
(14,	'default',	0,	'msp_securitysuite_recaptcha/frontend/enabled',	'0',	'2023-07-14 05:04:11'),
(15,	'default',	0,	'msp_securitysuite_recaptcha/backend/enabled',	'0',	'2023-07-14 05:04:11'),
(16,	'default',	0,	'twofactorauth/duo/application_key',	'4XW8YDicFmCYjSlnZYfbwnRCGxXUd3UuN0bU39Si3BrdnDglX0VO4hGafV67YhwO',	'2023-07-14 05:04:11'),
(17,	'default',	0,	'admin/usage/enabled',	'1',	'2023-07-14 06:35:57'),
(20,	'default',	0,	'design/pagination/pagination_frame',	'5',	'2023-07-15 11:26:30'),
(21,	'default',	0,	'design/pagination/pagination_frame_skip',	NULL,	'2023-07-15 11:26:30'),
(22,	'default',	0,	'design/pagination/anchor_text_for_previous',	NULL,	'2023-07-15 11:26:30'),
(23,	'default',	0,	'design/pagination/anchor_text_for_next',	NULL,	'2023-07-15 11:26:30'),
(24,	'default',	0,	'design/head/default_title',	'Magento Commerce',	'2023-07-15 11:26:30'),
(25,	'default',	0,	'design/head/title_prefix',	NULL,	'2023-07-15 11:26:30'),
(26,	'default',	0,	'design/head/title_suffix',	NULL,	'2023-07-15 11:26:30'),
(27,	'default',	0,	'design/head/default_description',	NULL,	'2023-07-15 11:26:30'),
(28,	'default',	0,	'design/head/default_keywords',	NULL,	'2023-07-15 11:26:30'),
(29,	'default',	0,	'design/head/includes',	NULL,	'2023-07-15 11:26:30'),
(30,	'default',	0,	'design/head/demonotice',	'0',	'2023-07-15 11:26:30'),
(31,	'default',	0,	'design/header/logo_width',	NULL,	'2023-07-15 11:26:30'),
(32,	'default',	0,	'design/header/logo_height',	NULL,	'2023-07-15 11:26:30'),
(33,	'default',	0,	'design/header/logo_alt',	NULL,	'2023-07-15 11:26:30'),
(34,	'default',	0,	'design/header/welcome',	'Default welcome msg!',	'2023-07-15 11:26:30'),
(35,	'default',	0,	'design/header/translate_title',	'1',	'2023-07-15 11:26:30'),
(36,	'default',	0,	'design/footer/copyright',	'Copyright © 2013-present Magento, Inc. All rights reserved.',	'2023-07-15 11:26:30'),
(37,	'default',	0,	'design/footer/absolute_footer',	NULL,	'2023-07-15 11:26:30'),
(38,	'default',	0,	'design/footer/report_bugs',	'1',	'2023-07-15 11:26:30'),
(39,	'default',	0,	'design/search_engine_robots/default_robots',	'INDEX,FOLLOW',	'2023-07-15 11:26:30'),
(40,	'default',	0,	'design/search_engine_robots/custom_instructions',	NULL,	'2023-07-15 11:26:30'),
(41,	'default',	0,	'design/watermark/image_size',	NULL,	'2023-07-15 11:26:30'),
(42,	'default',	0,	'design/watermark/image_imageOpacity',	NULL,	'2023-07-15 11:26:30'),
(43,	'default',	0,	'design/watermark/image_position',	'stretch',	'2023-07-15 11:26:30'),
(44,	'default',	0,	'design/watermark/small_image_size',	NULL,	'2023-07-15 11:26:30'),
(45,	'default',	0,	'design/watermark/small_image_imageOpacity',	NULL,	'2023-07-15 11:26:30'),
(46,	'default',	0,	'design/watermark/small_image_position',	'stretch',	'2023-07-15 11:26:30'),
(47,	'default',	0,	'design/watermark/thumbnail_size',	NULL,	'2023-07-15 11:26:30'),
(48,	'default',	0,	'design/watermark/thumbnail_imageOpacity',	NULL,	'2023-07-15 11:26:30'),
(49,	'default',	0,	'design/watermark/thumbnail_position',	'stretch',	'2023-07-15 11:26:30'),
(50,	'default',	0,	'design/email/logo_alt',	NULL,	'2023-07-15 11:26:30'),
(51,	'default',	0,	'design/email/logo_width',	NULL,	'2023-07-15 11:26:30'),
(52,	'default',	0,	'design/email/logo_height',	NULL,	'2023-07-15 11:26:30'),
(53,	'default',	0,	'design/email/header_template',	'design_email_header_template',	'2023-07-15 11:26:30'),
(54,	'default',	0,	'design/email/footer_template',	'design_email_footer_template',	'2023-07-15 11:26:30'),
(55,	'default',	0,	'catalog/frontend/list_mode',	'list',	'2023-07-15 12:05:58'),
(56,	'default',	0,	'catalog/productalert_cron/frequency',	'D',	'2023-07-15 12:05:58'),
(57,	'default',	0,	'crontab/default/jobs/catalog_product_alert/schedule/cron_expr',	'0 0 * * *',	'2023-07-15 12:05:58'),
(58,	'default',	0,	'crontab/default/jobs/catalog_product_alert/run/model',	NULL,	'2023-07-15 12:05:58'),
(59,	'default',	0,	'catalog/productalert_cron/time',	'00,00,00',	'2023-07-15 12:05:58'),
(60,	'default',	0,	'catalog/productalert_cron/error_email',	NULL,	'2023-07-15 12:05:58'),
(61,	'default',	0,	'catalog/product_video/youtube_api_key',	NULL,	'2023-07-15 12:05:58'),
(62,	'default',	0,	'catalog/price/scope',	'0',	'2023-07-15 12:05:58'),
(63,	'default',	0,	'catalog/search/opensearch_server_hostname',	'localhost',	'2023-07-15 12:05:58'),
(64,	'default',	0,	'catalog/search/opensearch_server_port',	'9200',	'2023-07-15 12:05:58'),
(65,	'default',	0,	'catalog/search/opensearch_index_prefix',	'magento2',	'2023-07-15 12:05:58'),
(66,	'default',	0,	'catalog/search/opensearch_enable_auth',	'0',	'2023-07-15 12:05:58'),
(67,	'default',	0,	'catalog/search/opensearch_server_timeout',	'15',	'2023-07-15 12:05:58'),
(68,	'default',	0,	'catalog/search/opensearch_minimum_should_match',	NULL,	'2023-07-15 12:05:58'),
(69,	'default',	0,	'catalog/custom_options/use_calendar',	'0',	'2023-07-15 12:05:58'),
(70,	'default',	0,	'catalog/custom_options/year_range',	',',	'2023-07-15 12:05:58'),
(71,	'default',	0,	'catalog/placeholder/image_placeholder',	NULL,	'2023-07-15 12:05:58'),
(72,	'default',	0,	'catalog/placeholder/small_image_placeholder',	NULL,	'2023-07-15 12:05:58'),
(73,	'default',	0,	'catalog/placeholder/thumbnail_placeholder',	NULL,	'2023-07-15 12:05:58'),
(74,	'default',	0,	'catalog/placeholder/swatch_image_placeholder',	NULL,	'2023-07-15 12:05:58'),
(75,	'default',	0,	'cataloginventory/options/show_out_of_stock',	'1',	'2023-07-15 12:07:11'),
(76,	'default',	0,	'cataloginventory/source_selection_distance_based_google/api_key',	NULL,	'2023-07-15 12:07:11'),
(78,	'default',	0,	'webapi/soap/charset',	NULL,	'2023-07-16 09:34:09'),
(79,	'default',	0,	'graphql/validation/input_limit_enabled',	'0',	'2023-07-16 09:34:09'),
(80,	'default',	0,	'webapi/validation/input_limit_enabled',	'0',	'2023-07-16 09:34:09'),
(81,	'default',	0,	'webapi/validation/default_page_size',	NULL,	'2023-07-16 09:34:09'),
(82,	'default',	0,	'webapi/webapisecurity/allow_insecure',	'1',	'2023-07-16 09:34:09'),
(83,	'default',	0,	'webapi/jwtauth/jwt_alg',	'HS256',	'2023-07-16 09:34:09'),
(84,	'default',	0,	'webapi/jwtauth/jwe_alg',	'A128GCM',	'2023-07-16 09:34:09'),
(85,	'default',	0,	'webapi/jwtauth/customer_expiration',	'60',	'2023-07-16 09:34:09'),
(86,	'default',	0,	'webapi/jwtauth/admin_expiration',	'60',	'2023-07-16 09:34:09'),
(87,	'default',	0,	'carriers/flatrate/handling_fee',	NULL,	'2023-07-16 16:27:15'),
(88,	'default',	0,	'carriers/flatrate/specificcountry',	NULL,	'2023-07-16 16:27:15'),
(89,	'default',	0,	'carriers/flatrate/showmethod',	'1',	'2023-07-16 16:27:15'),
(90,	'default',	0,	'carriers/flatrate/sort_order',	NULL,	'2023-07-16 16:27:15'),
(91,	'default',	0,	'carriers/freeshipping/free_shipping_subtotal',	NULL,	'2023-07-16 16:27:15'),
(92,	'default',	0,	'carriers/freeshipping/specificcountry',	NULL,	'2023-07-16 16:27:15'),
(93,	'default',	0,	'carriers/freeshipping/showmethod',	'0',	'2023-07-16 16:27:15'),
(94,	'default',	0,	'carriers/freeshipping/sort_order',	NULL,	'2023-07-16 16:27:15'),
(95,	'default',	0,	'carriers/tablerate/handling_fee',	NULL,	'2023-07-16 16:27:15'),
(96,	'default',	0,	'carriers/tablerate/specificcountry',	NULL,	'2023-07-16 16:27:15'),
(97,	'default',	0,	'carriers/tablerate/showmethod',	'0',	'2023-07-16 16:27:15'),
(98,	'default',	0,	'carriers/tablerate/sort_order',	NULL,	'2023-07-16 16:27:15'),
(99,	'default',	0,	'carriers/ups/shipper_number',	NULL,	'2023-07-16 16:27:15'),
(100,	'default',	0,	'carriers/ups/handling_fee',	NULL,	'2023-07-16 16:27:15'),
(101,	'default',	0,	'carriers/ups/free_shipping_enable',	'0',	'2023-07-16 16:27:15'),
(102,	'default',	0,	'carriers/ups/specificcountry',	NULL,	'2023-07-16 16:27:15'),
(103,	'default',	0,	'carriers/ups/showmethod',	'0',	'2023-07-16 16:27:15'),
(104,	'default',	0,	'carriers/ups/debug',	'0',	'2023-07-16 16:27:15'),
(105,	'default',	0,	'carriers/ups/sort_order',	NULL,	'2023-07-16 16:27:15'),
(106,	'default',	0,	'carriers/usps/userid',	NULL,	'2023-07-16 16:27:15'),
(107,	'default',	0,	'carriers/usps/password',	NULL,	'2023-07-16 16:27:15'),
(108,	'default',	0,	'carriers/usps/handling_fee',	NULL,	'2023-07-16 16:27:15'),
(109,	'default',	0,	'carriers/usps/free_shipping_enable',	'0',	'2023-07-16 16:27:15'),
(110,	'default',	0,	'carriers/usps/specificcountry',	NULL,	'2023-07-16 16:27:15'),
(111,	'default',	0,	'carriers/usps/debug',	'0',	'2023-07-16 16:27:15'),
(112,	'default',	0,	'carriers/usps/showmethod',	'0',	'2023-07-16 16:27:15'),
(113,	'default',	0,	'carriers/usps/sort_order',	NULL,	'2023-07-16 16:27:15'),
(114,	'default',	0,	'carriers/fedex/account',	NULL,	'2023-07-16 16:27:15'),
(115,	'default',	0,	'carriers/fedex/meter_number',	NULL,	'2023-07-16 16:27:15'),
(116,	'default',	0,	'carriers/fedex/key',	NULL,	'2023-07-16 16:27:15'),
(117,	'default',	0,	'carriers/fedex/password',	NULL,	'2023-07-16 16:27:15'),
(118,	'default',	0,	'carriers/fedex/handling_fee',	NULL,	'2023-07-16 16:27:15'),
(119,	'default',	0,	'carriers/fedex/residence_delivery',	'0',	'2023-07-16 16:27:15'),
(120,	'default',	0,	'carriers/fedex/smartpost_hubid',	NULL,	'2023-07-16 16:27:15'),
(121,	'default',	0,	'carriers/fedex/free_shipping_enable',	'0',	'2023-07-16 16:27:15'),
(122,	'default',	0,	'carriers/fedex/specificcountry',	NULL,	'2023-07-16 16:27:15'),
(123,	'default',	0,	'carriers/fedex/debug',	'0',	'2023-07-16 16:27:15'),
(124,	'default',	0,	'carriers/fedex/showmethod',	'0',	'2023-07-16 16:27:15'),
(125,	'default',	0,	'carriers/fedex/sort_order',	NULL,	'2023-07-16 16:27:15'),
(126,	'default',	0,	'carriers/dhl/id',	NULL,	'2023-07-16 16:27:15'),
(127,	'default',	0,	'carriers/dhl/password',	NULL,	'2023-07-16 16:27:15'),
(128,	'default',	0,	'carriers/dhl/handling_fee',	NULL,	'2023-07-16 16:27:15'),
(129,	'default',	0,	'carriers/dhl/free_method_nondoc',	NULL,	'2023-07-16 16:27:15'),
(130,	'default',	0,	'carriers/dhl/free_shipping_enable',	'0',	'2023-07-16 16:27:15'),
(131,	'default',	0,	'carriers/dhl/specificcountry',	NULL,	'2023-07-16 16:27:15'),
(132,	'default',	0,	'carriers/dhl/showmethod',	'0',	'2023-07-16 16:27:15'),
(133,	'default',	0,	'carriers/dhl/debug',	'0',	'2023-07-16 16:27:15'),
(134,	'default',	0,	'carriers/dhl/sandbox_mode',	'0',	'2023-07-16 16:27:15'),
(135,	'default',	0,	'carriers/dhl/sort_order',	NULL,	'2023-07-16 16:27:15'),
(136,	'default',	0,	'carriers/freeshipping/active',	'1',	'2023-07-16 16:27:54');

DROP TABLE IF EXISTS `cron_schedule`;
CREATE TABLE `cron_schedule` (
  `schedule_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule ID',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `CRON_SCHEDULE_JOB_CODE_STATUS_SCHEDULED_AT` (`job_code`,`status`,`scheduled_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Cron Schedule';


DROP TABLE IF EXISTS `customer_address_entity`;
CREATE TABLE `customer_address_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `parent_id` int unsigned DEFAULT NULL COMMENT 'Parent ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int unsigned DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int unsigned DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int unsigned DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity';

INSERT INTO `customer_address_entity` (`entity_id`, `increment_id`, `parent_id`, `created_at`, `updated_at`, `is_active`, `city`, `company`, `country_id`, `fax`, `firstname`, `lastname`, `middlename`, `postcode`, `prefix`, `region`, `region_id`, `street`, `suffix`, `telephone`, `vat_id`, `vat_is_valid`, `vat_request_date`, `vat_request_id`, `vat_request_success`) VALUES
(1,	NULL,	1,	'2023-07-16 06:41:01',	'2023-07-16 06:41:01',	1,	'Amapa',	NULL,	'US',	NULL,	'Vishal',	'Tulsani',	NULL,	'21111',	NULL,	'Alaska',	2,	'134 street\nantony colony',	NULL,	'12345679',	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
CREATE TABLE `customer_address_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Datetime';


DROP TABLE IF EXISTS `customer_address_entity_decimal`;
CREATE TABLE `customer_address_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Decimal';


DROP TABLE IF EXISTS `customer_address_entity_int`;
CREATE TABLE `customer_address_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Int';


DROP TABLE IF EXISTS `customer_address_entity_text`;
CREATE TABLE `customer_address_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Text';


DROP TABLE IF EXISTS `customer_address_entity_varchar`;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Address Entity Varchar';


DROP TABLE IF EXISTS `customer_eav_attribute`;
CREATE TABLE `customer_eav_attribute` (
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `is_visible` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  `grid_filter_condition_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Grid Filter Condition Type',
  PRIMARY KEY (`attribute_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_SORT_ORDER` (`sort_order`),
  CONSTRAINT `CUSTOMER_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Eav Attribute';

INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`, `is_used_in_grid`, `is_visible_in_grid`, `is_filterable_in_grid`, `is_searchable_in_grid`, `grid_filter_condition_type`) VALUES
(1,	1,	NULL,	0,	NULL,	1,	10,	NULL,	1,	1,	1,	0,	0),
(2,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(3,	1,	NULL,	0,	NULL,	1,	20,	NULL,	1,	1,	0,	1,	0),
(4,	0,	NULL,	0,	NULL,	0,	30,	NULL,	0,	0,	0,	0,	0),
(5,	1,	'trim',	0,	'{\"max_text_length\":255,\"min_text_length\":1}',	1,	40,	NULL,	0,	0,	0,	0,	0),
(6,	0,	'trim',	0,	NULL,	0,	50,	NULL,	0,	0,	0,	0,	0),
(7,	1,	'trim',	0,	'{\"max_text_length\":255,\"min_text_length\":1}',	1,	60,	NULL,	0,	0,	0,	0,	0),
(8,	0,	NULL,	0,	NULL,	0,	70,	NULL,	0,	0,	0,	0,	0),
(9,	1,	NULL,	0,	'{\"input_validation\":\"email\"}',	1,	80,	NULL,	1,	1,	1,	1,	0),
(10,	1,	NULL,	0,	NULL,	1,	25,	NULL,	1,	1,	1,	0,	0),
(11,	0,	'date',	0,	'{\"input_validation\":\"date\"}',	0,	90,	NULL,	1,	1,	1,	0,	0),
(12,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(13,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(14,	0,	NULL,	0,	'{\"input_validation\":\"date\"}',	1,	0,	NULL,	0,	0,	0,	0,	0),
(15,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(16,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(17,	0,	NULL,	0,	'{\"max_text_length\":255}',	0,	100,	NULL,	1,	1,	0,	1,	0),
(18,	0,	NULL,	0,	NULL,	1,	0,	NULL,	1,	1,	1,	0,	0),
(19,	0,	NULL,	0,	NULL,	0,	0,	NULL,	1,	1,	1,	0,	0),
(20,	0,	NULL,	0,	'[]',	0,	110,	NULL,	1,	1,	1,	0,	0),
(21,	1,	NULL,	0,	NULL,	1,	28,	NULL,	0,	0,	0,	0,	0),
(22,	0,	NULL,	0,	NULL,	0,	10,	NULL,	0,	0,	0,	0,	0),
(23,	1,	'trim',	0,	'{\"max_text_length\":255,\"min_text_length\":1}',	1,	20,	NULL,	1,	0,	0,	1,	0),
(24,	0,	'trim',	0,	NULL,	0,	30,	NULL,	0,	0,	0,	0,	0),
(25,	1,	'trim',	0,	'{\"max_text_length\":255,\"min_text_length\":1}',	1,	40,	NULL,	1,	0,	0,	1,	0),
(26,	0,	NULL,	0,	NULL,	0,	50,	NULL,	0,	0,	0,	0,	0),
(27,	1,	NULL,	0,	'{\"max_text_length\":255,\"min_text_length\":1}',	1,	60,	NULL,	1,	0,	0,	1,	0),
(28,	1,	NULL,	2,	'{\"max_text_length\":255,\"min_text_length\":1}',	1,	70,	NULL,	1,	0,	0,	1,	0),
(29,	1,	NULL,	0,	'{\"max_text_length\":255,\"min_text_length\":1}',	1,	100,	NULL,	1,	0,	0,	1,	0),
(30,	1,	NULL,	0,	NULL,	1,	80,	NULL,	1,	1,	1,	0,	0),
(31,	1,	NULL,	0,	NULL,	1,	90,	NULL,	1,	1,	0,	1,	0),
(32,	1,	NULL,	0,	NULL,	1,	90,	NULL,	0,	0,	0,	0,	0),
(33,	1,	NULL,	0,	'[]',	1,	110,	'Magento\\Customer\\Model\\Attribute\\Data\\Postcode',	1,	1,	1,	1,	0),
(34,	1,	NULL,	0,	'{\"max_text_length\":255,\"min_text_length\":1}',	1,	120,	NULL,	1,	1,	1,	1,	0),
(35,	0,	NULL,	0,	'{\"max_text_length\":255,\"min_text_length\":1}',	0,	130,	NULL,	1,	0,	0,	1,	0),
(36,	1,	NULL,	0,	NULL,	1,	140,	NULL,	0,	0,	0,	0,	0),
(37,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(38,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(39,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(40,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(41,	0,	NULL,	0,	NULL,	0,	0,	NULL,	0,	0,	0,	0,	0),
(42,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(43,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0),
(44,	0,	NULL,	0,	NULL,	1,	0,	NULL,	0,	0,	0,	0,	0);

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
CREATE TABLE `customer_eav_attribute_website` (
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `is_visible` smallint unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Eav Attribute Website';

INSERT INTO `customer_eav_attribute_website` (`attribute_id`, `website_id`, `is_visible`, `is_required`, `default_value`, `multiline_count`) VALUES
(1,	1,	NULL,	NULL,	NULL,	NULL),
(3,	1,	NULL,	NULL,	NULL,	NULL),
(5,	1,	NULL,	NULL,	NULL,	NULL),
(6,	1,	NULL,	NULL,	NULL,	NULL),
(7,	1,	NULL,	NULL,	NULL,	NULL),
(9,	1,	NULL,	NULL,	NULL,	NULL),
(10,	1,	NULL,	NULL,	NULL,	NULL),
(11,	1,	NULL,	NULL,	NULL,	NULL),
(17,	1,	NULL,	NULL,	NULL,	NULL),
(18,	1,	NULL,	NULL,	NULL,	NULL),
(19,	1,	NULL,	NULL,	NULL,	NULL),
(20,	1,	NULL,	NULL,	NULL,	NULL),
(21,	1,	NULL,	NULL,	NULL,	NULL),
(23,	1,	NULL,	NULL,	NULL,	NULL),
(24,	1,	NULL,	NULL,	NULL,	NULL),
(25,	1,	NULL,	NULL,	NULL,	NULL),
(27,	1,	NULL,	NULL,	NULL,	NULL),
(28,	1,	NULL,	NULL,	NULL,	NULL),
(29,	1,	NULL,	NULL,	NULL,	NULL),
(30,	1,	NULL,	NULL,	NULL,	NULL),
(31,	1,	NULL,	NULL,	NULL,	NULL),
(32,	1,	NULL,	NULL,	NULL,	NULL),
(33,	1,	NULL,	NULL,	NULL,	NULL),
(34,	1,	NULL,	NULL,	NULL,	NULL),
(35,	1,	NULL,	NULL,	NULL,	NULL),
(36,	1,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `customer_entity`;
CREATE TABLE `customer_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `website_id` smallint unsigned DEFAULT NULL COMMENT 'Website ID',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Name Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Name Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int unsigned DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int unsigned DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint unsigned DEFAULT NULL COMMENT 'Gender',
  `failures_num` smallint DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock Expiration Date',
  `session_cutoff` timestamp NULL DEFAULT NULL COMMENT 'Session Cutoff Time',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `CUSTOMER_ENTITY_LASTNAME` (`lastname`),
  CONSTRAINT `CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity';

INSERT INTO `customer_entity` (`entity_id`, `website_id`, `email`, `group_id`, `increment_id`, `store_id`, `created_at`, `updated_at`, `is_active`, `disable_auto_group_change`, `created_in`, `prefix`, `firstname`, `middlename`, `lastname`, `suffix`, `dob`, `password_hash`, `rp_token`, `rp_token_created_at`, `default_billing`, `default_shipping`, `taxvat`, `confirmation`, `gender`, `failures_num`, `first_failure`, `lock_expires`, `session_cutoff`) VALUES
(1,	1,	'vishaltulsani5@gmail.com',	1,	NULL,	1,	'2023-07-16 05:30:15',	'2023-07-16 06:41:01',	1,	0,	'Default Store View',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'd59d3edcbf4ee9a5d43ef128dc2e1fcb1baddafb9ac2830d5510bc1507229b96:dmjjXx8xsiip0h3l7gasMVtcDx7yFKvz:3_32_2_67108864',	'0:3:cxdUwRSJKI8saJjflFw7gKFldlqJY9XpAlc7FIU5B/awk2Zy6y/1sOumTURitc7JRd6ccm600WbpHKi4',	'2023-07-16 05:30:15',	1,	1,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `customer_entity_datetime`;
CREATE TABLE `customer_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Datetime';


DROP TABLE IF EXISTS `customer_entity_decimal`;
CREATE TABLE `customer_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Decimal';


DROP TABLE IF EXISTS `customer_entity_int`;
CREATE TABLE `customer_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Int';


DROP TABLE IF EXISTS `customer_entity_text`;
CREATE TABLE `customer_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Text';


DROP TABLE IF EXISTS `customer_entity_varchar`;
CREATE TABLE `customer_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Entity Varchar';


DROP TABLE IF EXISTS `customer_form_attribute`;
CREATE TABLE `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Form Attribute';

INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES
('adminhtml_customer',	1),
('adminhtml_customer',	3),
('adminhtml_customer',	4),
('customer_account_create',	4),
('customer_account_edit',	4),
('adminhtml_customer',	5),
('customer_account_create',	5),
('customer_account_edit',	5),
('adminhtml_customer',	6),
('customer_account_create',	6),
('customer_account_edit',	6),
('adminhtml_customer',	7),
('customer_account_create',	7),
('customer_account_edit',	7),
('adminhtml_customer',	8),
('customer_account_create',	8),
('customer_account_edit',	8),
('adminhtml_checkout',	9),
('adminhtml_customer',	9),
('customer_account_create',	9),
('customer_account_edit',	9),
('adminhtml_checkout',	10),
('adminhtml_customer',	10),
('adminhtml_checkout',	11),
('adminhtml_customer',	11),
('customer_account_create',	11),
('customer_account_edit',	11),
('adminhtml_checkout',	17),
('adminhtml_customer',	17),
('customer_account_create',	17),
('customer_account_edit',	17),
('adminhtml_customer',	19),
('customer_account_create',	19),
('customer_account_edit',	19),
('adminhtml_checkout',	20),
('adminhtml_customer',	20),
('customer_account_create',	20),
('customer_account_edit',	20),
('adminhtml_customer',	21),
('adminhtml_customer_address',	22),
('customer_address_edit',	22),
('customer_register_address',	22),
('adminhtml_customer_address',	23),
('customer_address_edit',	23),
('customer_register_address',	23),
('adminhtml_customer_address',	24),
('customer_address_edit',	24),
('customer_register_address',	24),
('adminhtml_customer_address',	25),
('customer_address_edit',	25),
('customer_register_address',	25),
('adminhtml_customer_address',	26),
('customer_address_edit',	26),
('customer_register_address',	26),
('adminhtml_customer_address',	27),
('customer_address_edit',	27),
('customer_register_address',	27),
('adminhtml_customer_address',	28),
('customer_address_edit',	28),
('customer_register_address',	28),
('adminhtml_customer_address',	29),
('customer_address_edit',	29),
('customer_register_address',	29),
('adminhtml_customer_address',	30),
('customer_address_edit',	30),
('customer_register_address',	30),
('adminhtml_customer_address',	31),
('customer_address_edit',	31),
('customer_register_address',	31),
('adminhtml_customer_address',	32),
('customer_address_edit',	32),
('customer_register_address',	32),
('adminhtml_customer_address',	33),
('customer_address_edit',	33),
('customer_register_address',	33),
('adminhtml_customer_address',	34),
('customer_address_edit',	34),
('customer_register_address',	34),
('adminhtml_customer_address',	35),
('customer_address_edit',	35),
('customer_register_address',	35),
('adminhtml_customer_address',	36),
('customer_address_edit',	36),
('customer_register_address',	36);

DROP TABLE IF EXISTS `customer_grid_flat`;
CREATE TABLE `customer_grid_flat` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int DEFAULT NULL COMMENT 'Website_id',
  `confirmation` varchar(255) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Lock_expires',
  `shipping_full` text COMMENT 'Shipping_full',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_region_id` int DEFAULT NULL COMMENT 'Billing_region_id',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_8746F705702DD5F6D45B8C7CE7FE9F2F` (`name`,`email`,`created_in`,`taxvat`,`shipping_full`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='customer_grid_flat';

INSERT INTO `customer_grid_flat` (`entity_id`, `name`, `email`, `group_id`, `created_at`, `website_id`, `confirmation`, `created_in`, `dob`, `gender`, `taxvat`, `lock_expires`, `shipping_full`, `billing_full`, `billing_firstname`, `billing_lastname`, `billing_telephone`, `billing_postcode`, `billing_country_id`, `billing_region`, `billing_region_id`, `billing_street`, `billing_city`, `billing_fax`, `billing_vat_id`, `billing_company`) VALUES
(1,	'Vishal Tulsani',	'vishaltulsani5@gmail.com',	1,	'2023-07-16 05:30:15',	1,	NULL,	'Default Store View',	NULL,	NULL,	NULL,	NULL,	'134 street\nantony colony Amapa Alaska 21111',	'134 street\nantony colony Amapa Alaska 21111',	'Vishal',	'Tulsani',	'12345679',	'21111',	'US',	'Alaska',	2,	'134 street\nantony colony',	'Amapa',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE `customer_group` (
  `customer_group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class ID',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Group';

INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES
(0,	'NOT LOGGED IN',	3),
(1,	'General',	3),
(2,	'Wholesale',	3),
(3,	'Retailer',	3);

DROP TABLE IF EXISTS `customer_group_excluded_website`;
CREATE TABLE `customer_group_excluded_website` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Excluded Website ID from Customer Group',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_GROUP_EXCLUDED_WEBSITE_CUSTOMER_GROUP_ID_WEBSITE_ID` (`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Excluded Websites From Customer Group';


DROP TABLE IF EXISTS `customer_log`;
CREATE TABLE `customer_log` (
  `log_id` int NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Customer Log Table';

INSERT INTO `customer_log` (`log_id`, `customer_id`, `last_login_at`, `last_logout_at`) VALUES
(1,	1,	'2023-07-16 18:14:40',	NULL);

DROP TABLE IF EXISTS `customer_visitor`;
CREATE TABLE `customer_visitor` (
  `visitor_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int DEFAULT NULL COMMENT 'Customer ID',
  `session_id` varchar(1) DEFAULT NULL COMMENT 'Deprecated: Session ID value no longer used',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Visitor Table';

INSERT INTO `customer_visitor` (`visitor_id`, `customer_id`, `session_id`, `created_at`, `last_visit_at`) VALUES
(1,	NULL,	NULL,	'2023-07-14 11:40:27',	'2023-07-14 11:40:39'),
(2,	NULL,	NULL,	'2023-07-15 11:21:15',	'2023-07-15 12:11:06'),
(3,	1,	NULL,	'2023-07-16 05:30:15',	'2023-07-16 05:30:16'),
(4,	1,	NULL,	'2023-07-16 06:39:06',	'2023-07-16 06:41:14'),
(5,	1,	NULL,	'2023-07-16 09:20:49',	'2023-07-16 09:21:06'),
(6,	1,	NULL,	'2023-07-16 09:31:10',	'2023-07-16 09:57:01'),
(7,	1,	NULL,	'2023-07-16 16:06:45',	'2023-07-16 16:28:05');

DROP TABLE IF EXISTS `design_change`;
CREATE TABLE `design_change` (
  `design_change_id` int NOT NULL AUTO_INCREMENT COMMENT 'Design Change ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Design Changes';


DROP TABLE IF EXISTS `design_config_grid_flat`;
CREATE TABLE `design_config_grid_flat` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `store_website_id` int DEFAULT NULL COMMENT 'Store_website_id',
  `store_group_id` int DEFAULT NULL COMMENT 'Store_group_id',
  `store_id` int DEFAULT NULL COMMENT 'Store_id',
  `theme_theme_id` varchar(255) DEFAULT NULL COMMENT 'Theme_theme_id',
  PRIMARY KEY (`entity_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_WEBSITE_ID` (`store_website_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_GROUP_ID` (`store_group_id`),
  KEY `DESIGN_CONFIG_GRID_FLAT_STORE_ID` (`store_id`),
  FULLTEXT KEY `DESIGN_CONFIG_GRID_FLAT_THEME_THEME_ID` (`theme_theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='design_config_grid_flat';

INSERT INTO `design_config_grid_flat` (`entity_id`, `store_website_id`, `store_group_id`, `store_id`, `theme_theme_id`) VALUES
(0,	NULL,	NULL,	NULL,	''),
(1,	1,	NULL,	NULL,	''),
(2,	1,	1,	1,	'');

DROP TABLE IF EXISTS `directory_country`;
CREATE TABLE `directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country ID in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country';

INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES
('AD',	'AD',	'AND'),
('AE',	'AE',	'ARE'),
('AF',	'AF',	'AFG'),
('AG',	'AG',	'ATG'),
('AI',	'AI',	'AIA'),
('AL',	'AL',	'ALB'),
('AM',	'AM',	'ARM'),
('AN',	'AN',	'ANT'),
('AO',	'AO',	'AGO'),
('AQ',	'AQ',	'ATA'),
('AR',	'AR',	'ARG'),
('AS',	'AS',	'ASM'),
('AT',	'AT',	'AUT'),
('AU',	'AU',	'AUS'),
('AW',	'AW',	'ABW'),
('AX',	'AX',	'ALA'),
('AZ',	'AZ',	'AZE'),
('BA',	'BA',	'BIH'),
('BB',	'BB',	'BRB'),
('BD',	'BD',	'BGD'),
('BE',	'BE',	'BEL'),
('BF',	'BF',	'BFA'),
('BG',	'BG',	'BGR'),
('BH',	'BH',	'BHR'),
('BI',	'BI',	'BDI'),
('BJ',	'BJ',	'BEN'),
('BL',	'BL',	'BLM'),
('BM',	'BM',	'BMU'),
('BN',	'BN',	'BRN'),
('BO',	'BO',	'BOL'),
('BQ',	'BQ',	'BES'),
('BR',	'BR',	'BRA'),
('BS',	'BS',	'BHS'),
('BT',	'BT',	'BTN'),
('BV',	'BV',	'BVT'),
('BW',	'BW',	'BWA'),
('BY',	'BY',	'BLR'),
('BZ',	'BZ',	'BLZ'),
('CA',	'CA',	'CAN'),
('CC',	'CC',	'CCK'),
('CD',	'CD',	'COD'),
('CF',	'CF',	'CAF'),
('CG',	'CG',	'COG'),
('CH',	'CH',	'CHE'),
('CI',	'CI',	'CIV'),
('CK',	'CK',	'COK'),
('CL',	'CL',	'CHL'),
('CM',	'CM',	'CMR'),
('CN',	'CN',	'CHN'),
('CO',	'CO',	'COL'),
('CR',	'CR',	'CRI'),
('CU',	'CU',	'CUB'),
('CV',	'CV',	'CPV'),
('CW',	'CW',	'CUW'),
('CX',	'CX',	'CXR'),
('CY',	'CY',	'CYP'),
('CZ',	'CZ',	'CZE'),
('DE',	'DE',	'DEU'),
('DJ',	'DJ',	'DJI'),
('DK',	'DK',	'DNK'),
('DM',	'DM',	'DMA'),
('DO',	'DO',	'DOM'),
('DZ',	'DZ',	'DZA'),
('EC',	'EC',	'ECU'),
('EE',	'EE',	'EST'),
('EG',	'EG',	'EGY'),
('EH',	'EH',	'ESH'),
('ER',	'ER',	'ERI'),
('ES',	'ES',	'ESP'),
('ET',	'ET',	'ETH'),
('FI',	'FI',	'FIN'),
('FJ',	'FJ',	'FJI'),
('FK',	'FK',	'FLK'),
('FM',	'FM',	'FSM'),
('FO',	'FO',	'FRO'),
('FR',	'FR',	'FRA'),
('GA',	'GA',	'GAB'),
('GB',	'GB',	'GBR'),
('GD',	'GD',	'GRD'),
('GE',	'GE',	'GEO'),
('GF',	'GF',	'GUF'),
('GG',	'GG',	'GGY'),
('GH',	'GH',	'GHA'),
('GI',	'GI',	'GIB'),
('GL',	'GL',	'GRL'),
('GM',	'GM',	'GMB'),
('GN',	'GN',	'GIN'),
('GP',	'GP',	'GLP'),
('GQ',	'GQ',	'GNQ'),
('GR',	'GR',	'GRC'),
('GS',	'GS',	'SGS'),
('GT',	'GT',	'GTM'),
('GU',	'GU',	'GUM'),
('GW',	'GW',	'GNB'),
('GY',	'GY',	'GUY'),
('HK',	'HK',	'HKG'),
('HM',	'HM',	'HMD'),
('HN',	'HN',	'HND'),
('HR',	'HR',	'HRV'),
('HT',	'HT',	'HTI'),
('HU',	'HU',	'HUN'),
('ID',	'ID',	'IDN'),
('IE',	'IE',	'IRL'),
('IL',	'IL',	'ISR'),
('IM',	'IM',	'IMN'),
('IN',	'IN',	'IND'),
('IO',	'IO',	'IOT'),
('IQ',	'IQ',	'IRQ'),
('IR',	'IR',	'IRN'),
('IS',	'IS',	'ISL'),
('IT',	'IT',	'ITA'),
('JE',	'JE',	'JEY'),
('JM',	'JM',	'JAM'),
('JO',	'JO',	'JOR'),
('JP',	'JP',	'JPN'),
('KE',	'KE',	'KEN'),
('KG',	'KG',	'KGZ'),
('KH',	'KH',	'KHM'),
('KI',	'KI',	'KIR'),
('KM',	'KM',	'COM'),
('KN',	'KN',	'KNA'),
('KP',	'KP',	'PRK'),
('KR',	'KR',	'KOR'),
('KW',	'KW',	'KWT'),
('KY',	'KY',	'CYM'),
('KZ',	'KZ',	'KAZ'),
('LA',	'LA',	'LAO'),
('LB',	'LB',	'LBN'),
('LC',	'LC',	'LCA'),
('LI',	'LI',	'LIE'),
('LK',	'LK',	'LKA'),
('LR',	'LR',	'LBR'),
('LS',	'LS',	'LSO'),
('LT',	'LT',	'LTU'),
('LU',	'LU',	'LUX'),
('LV',	'LV',	'LVA'),
('LY',	'LY',	'LBY'),
('MA',	'MA',	'MAR'),
('MC',	'MC',	'MCO'),
('MD',	'MD',	'MDA'),
('ME',	'ME',	'MNE'),
('MF',	'MF',	'MAF'),
('MG',	'MG',	'MDG'),
('MH',	'MH',	'MHL'),
('MK',	'MK',	'MKD'),
('ML',	'ML',	'MLI'),
('MM',	'MM',	'MMR'),
('MN',	'MN',	'MNG'),
('MO',	'MO',	'MAC'),
('MP',	'MP',	'MNP'),
('MQ',	'MQ',	'MTQ'),
('MR',	'MR',	'MRT'),
('MS',	'MS',	'MSR'),
('MT',	'MT',	'MLT'),
('MU',	'MU',	'MUS'),
('MV',	'MV',	'MDV'),
('MW',	'MW',	'MWI'),
('MX',	'MX',	'MEX'),
('MY',	'MY',	'MYS'),
('MZ',	'MZ',	'MOZ'),
('NA',	'NA',	'NAM'),
('NC',	'NC',	'NCL'),
('NE',	'NE',	'NER'),
('NF',	'NF',	'NFK'),
('NG',	'NG',	'NGA'),
('NI',	'NI',	'NIC'),
('NL',	'NL',	'NLD'),
('NO',	'NO',	'NOR'),
('NP',	'NP',	'NPL'),
('NR',	'NR',	'NRU'),
('NU',	'NU',	'NIU'),
('NZ',	'NZ',	'NZL'),
('OM',	'OM',	'OMN'),
('PA',	'PA',	'PAN'),
('PE',	'PE',	'PER'),
('PF',	'PF',	'PYF'),
('PG',	'PG',	'PNG'),
('PH',	'PH',	'PHL'),
('PK',	'PK',	'PAK'),
('PL',	'PL',	'POL'),
('PM',	'PM',	'SPM'),
('PN',	'PN',	'PCN'),
('PS',	'PS',	'PSE'),
('PT',	'PT',	'PRT'),
('PW',	'PW',	'PLW'),
('PY',	'PY',	'PRY'),
('QA',	'QA',	'QAT'),
('RE',	'RE',	'REU'),
('RO',	'RO',	'ROU'),
('RS',	'RS',	'SRB'),
('RU',	'RU',	'RUS'),
('RW',	'RW',	'RWA'),
('SA',	'SA',	'SAU'),
('SB',	'SB',	'SLB'),
('SC',	'SC',	'SYC'),
('SD',	'SD',	'SDN'),
('SE',	'SE',	'SWE'),
('SG',	'SG',	'SGP'),
('SH',	'SH',	'SHN'),
('SI',	'SI',	'SVN'),
('SJ',	'SJ',	'SJM'),
('SK',	'SK',	'SVK'),
('SL',	'SL',	'SLE'),
('SM',	'SM',	'SMR'),
('SN',	'SN',	'SEN'),
('SO',	'SO',	'SOM'),
('SR',	'SR',	'SUR'),
('ST',	'ST',	'STP'),
('SV',	'SV',	'SLV'),
('SX',	'SX',	'SXM'),
('SY',	'SY',	'SYR'),
('SZ',	'SZ',	'SWZ'),
('TC',	'TC',	'TCA'),
('TD',	'TD',	'TCD'),
('TF',	'TF',	'ATF'),
('TG',	'TG',	'TGO'),
('TH',	'TH',	'THA'),
('TJ',	'TJ',	'TJK'),
('TK',	'TK',	'TKL'),
('TL',	'TL',	'TLS'),
('TM',	'TM',	'TKM'),
('TN',	'TN',	'TUN'),
('TO',	'TO',	'TON'),
('TR',	'TR',	'TUR'),
('TT',	'TT',	'TTO'),
('TV',	'TV',	'TUV'),
('TW',	'TW',	'TWN'),
('TZ',	'TZ',	'TZA'),
('UA',	'UA',	'UKR'),
('UG',	'UG',	'UGA'),
('UM',	'UM',	'UMI'),
('US',	'US',	'USA'),
('UY',	'UY',	'URY'),
('UZ',	'UZ',	'UZB'),
('VA',	'VA',	'VAT'),
('VC',	'VC',	'VCT'),
('VE',	'VE',	'VEN'),
('VG',	'VG',	'VGB'),
('VI',	'VI',	'VIR'),
('VN',	'VN',	'VNM'),
('VU',	'VU',	'VUT'),
('WF',	'WF',	'WLF'),
('WS',	'WS',	'WSM'),
('XK',	'XK',	'XKX'),
('YE',	'YE',	'YEM'),
('YT',	'YT',	'MYT'),
('ZA',	'ZA',	'ZAF'),
('ZM',	'ZM',	'ZMB'),
('ZW',	'ZW',	'ZWE');

DROP TABLE IF EXISTS `directory_country_format`;
CREATE TABLE `directory_country_format` (
  `country_format_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format ID',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country ID in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country Format';


DROP TABLE IF EXISTS `directory_country_region`;
CREATE TABLE `directory_country_region` (
  `region_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region ID',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country ID in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country Region';

INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES
(1,	'US',	'AL',	'Alabama'),
(2,	'US',	'AK',	'Alaska'),
(3,	'US',	'AS',	'American Samoa'),
(4,	'US',	'AZ',	'Arizona'),
(5,	'US',	'AR',	'Arkansas'),
(6,	'US',	'AE',	'Armed Forces Africa'),
(7,	'US',	'AA',	'Armed Forces Americas'),
(8,	'US',	'AE',	'Armed Forces Canada'),
(9,	'US',	'AE',	'Armed Forces Europe'),
(10,	'US',	'AE',	'Armed Forces Middle East'),
(11,	'US',	'AP',	'Armed Forces Pacific'),
(12,	'US',	'CA',	'California'),
(13,	'US',	'CO',	'Colorado'),
(14,	'US',	'CT',	'Connecticut'),
(15,	'US',	'DE',	'Delaware'),
(16,	'US',	'DC',	'District of Columbia'),
(17,	'US',	'FM',	'Federated States Of Micronesia'),
(18,	'US',	'FL',	'Florida'),
(19,	'US',	'GA',	'Georgia'),
(20,	'US',	'GU',	'Guam'),
(21,	'US',	'HI',	'Hawaii'),
(22,	'US',	'ID',	'Idaho'),
(23,	'US',	'IL',	'Illinois'),
(24,	'US',	'IN',	'Indiana'),
(25,	'US',	'IA',	'Iowa'),
(26,	'US',	'KS',	'Kansas'),
(27,	'US',	'KY',	'Kentucky'),
(28,	'US',	'LA',	'Louisiana'),
(29,	'US',	'ME',	'Maine'),
(30,	'US',	'MH',	'Marshall Islands'),
(31,	'US',	'MD',	'Maryland'),
(32,	'US',	'MA',	'Massachusetts'),
(33,	'US',	'MI',	'Michigan'),
(34,	'US',	'MN',	'Minnesota'),
(35,	'US',	'MS',	'Mississippi'),
(36,	'US',	'MO',	'Missouri'),
(37,	'US',	'MT',	'Montana'),
(38,	'US',	'NE',	'Nebraska'),
(39,	'US',	'NV',	'Nevada'),
(40,	'US',	'NH',	'New Hampshire'),
(41,	'US',	'NJ',	'New Jersey'),
(42,	'US',	'NM',	'New Mexico'),
(43,	'US',	'NY',	'New York'),
(44,	'US',	'NC',	'North Carolina'),
(45,	'US',	'ND',	'North Dakota'),
(46,	'US',	'MP',	'Northern Mariana Islands'),
(47,	'US',	'OH',	'Ohio'),
(48,	'US',	'OK',	'Oklahoma'),
(49,	'US',	'OR',	'Oregon'),
(50,	'US',	'PW',	'Palau'),
(51,	'US',	'PA',	'Pennsylvania'),
(52,	'US',	'PR',	'Puerto Rico'),
(53,	'US',	'RI',	'Rhode Island'),
(54,	'US',	'SC',	'South Carolina'),
(55,	'US',	'SD',	'South Dakota'),
(56,	'US',	'TN',	'Tennessee'),
(57,	'US',	'TX',	'Texas'),
(58,	'US',	'UT',	'Utah'),
(59,	'US',	'VT',	'Vermont'),
(60,	'US',	'VI',	'Virgin Islands'),
(61,	'US',	'VA',	'Virginia'),
(62,	'US',	'WA',	'Washington'),
(63,	'US',	'WV',	'West Virginia'),
(64,	'US',	'WI',	'Wisconsin'),
(65,	'US',	'WY',	'Wyoming'),
(66,	'CA',	'AB',	'Alberta'),
(67,	'CA',	'BC',	'British Columbia'),
(68,	'CA',	'MB',	'Manitoba'),
(69,	'CA',	'NL',	'Newfoundland and Labrador'),
(70,	'CA',	'NB',	'New Brunswick'),
(71,	'CA',	'NS',	'Nova Scotia'),
(72,	'CA',	'NT',	'Northwest Territories'),
(73,	'CA',	'NU',	'Nunavut'),
(74,	'CA',	'ON',	'Ontario'),
(75,	'CA',	'PE',	'Prince Edward Island'),
(76,	'CA',	'QC',	'Quebec'),
(77,	'CA',	'SK',	'Saskatchewan'),
(78,	'CA',	'YT',	'Yukon Territory'),
(79,	'DE',	'NDS',	'Niedersachsen'),
(80,	'DE',	'BAW',	'Baden-Württemberg'),
(81,	'DE',	'BAY',	'Bayern'),
(82,	'DE',	'BER',	'Berlin'),
(83,	'DE',	'BRG',	'Brandenburg'),
(84,	'DE',	'BRE',	'Bremen'),
(85,	'DE',	'HAM',	'Hamburg'),
(86,	'DE',	'HES',	'Hessen'),
(87,	'DE',	'MEC',	'Mecklenburg-Vorpommern'),
(88,	'DE',	'NRW',	'Nordrhein-Westfalen'),
(89,	'DE',	'RHE',	'Rheinland-Pfalz'),
(90,	'DE',	'SAR',	'Saarland'),
(91,	'DE',	'SAS',	'Sachsen'),
(92,	'DE',	'SAC',	'Sachsen-Anhalt'),
(93,	'DE',	'SCN',	'Schleswig-Holstein'),
(94,	'DE',	'THE',	'Thüringen'),
(95,	'AT',	'WI',	'Wien'),
(96,	'AT',	'NO',	'Niederösterreich'),
(97,	'AT',	'OO',	'Oberösterreich'),
(98,	'AT',	'SB',	'Salzburg'),
(99,	'AT',	'KN',	'Kärnten'),
(100,	'AT',	'ST',	'Steiermark'),
(101,	'AT',	'TI',	'Tirol'),
(102,	'AT',	'BL',	'Burgenland'),
(103,	'AT',	'VB',	'Vorarlberg'),
(104,	'CH',	'AG',	'Aargau'),
(105,	'CH',	'AI',	'Appenzell Innerrhoden'),
(106,	'CH',	'AR',	'Appenzell Ausserrhoden'),
(107,	'CH',	'BE',	'Bern'),
(108,	'CH',	'BL',	'Basel-Landschaft'),
(109,	'CH',	'BS',	'Basel-Stadt'),
(110,	'CH',	'FR',	'Friburg'),
(111,	'CH',	'GE',	'Geneva'),
(112,	'CH',	'GL',	'Glarus'),
(113,	'CH',	'GR',	'Graubünden'),
(114,	'CH',	'JU',	'Jura'),
(115,	'CH',	'LU',	'Lucerne'),
(116,	'CH',	'NE',	'Neuchâtel'),
(117,	'CH',	'NW',	'Nidwalden'),
(118,	'CH',	'OW',	'Obwalden'),
(119,	'CH',	'SG',	'St. Gallen'),
(120,	'CH',	'SH',	'Schaffhausen'),
(121,	'CH',	'SO',	'Solothurn'),
(122,	'CH',	'SZ',	'Schwyz'),
(123,	'CH',	'TG',	'Thurgau'),
(124,	'CH',	'TI',	'Ticino'),
(125,	'CH',	'UR',	'Uri'),
(126,	'CH',	'VD',	'Vaud'),
(127,	'CH',	'VS',	'Wallis'),
(128,	'CH',	'ZG',	'Zug'),
(129,	'CH',	'ZH',	'Zürich'),
(130,	'ES',	'A Coruсa',	'A Coruña'),
(131,	'ES',	'Alava',	'Alava'),
(132,	'ES',	'Albacete',	'Albacete'),
(133,	'ES',	'Alicante',	'Alicante'),
(134,	'ES',	'Almeria',	'Almeria'),
(135,	'ES',	'Asturias',	'Asturias'),
(136,	'ES',	'Avila',	'Avila'),
(137,	'ES',	'Badajoz',	'Badajoz'),
(138,	'ES',	'Baleares',	'Baleares'),
(139,	'ES',	'Barcelona',	'Barcelona'),
(140,	'ES',	'Burgos',	'Burgos'),
(141,	'ES',	'Caceres',	'Caceres'),
(142,	'ES',	'Cadiz',	'Cadiz'),
(143,	'ES',	'Cantabria',	'Cantabria'),
(144,	'ES',	'Castellon',	'Castellon'),
(145,	'ES',	'Ceuta',	'Ceuta'),
(146,	'ES',	'Ciudad Real',	'Ciudad Real'),
(147,	'ES',	'Cordoba',	'Cordoba'),
(148,	'ES',	'Cuenca',	'Cuenca'),
(149,	'ES',	'Girona',	'Girona'),
(150,	'ES',	'Granada',	'Granada'),
(151,	'ES',	'Guadalajara',	'Guadalajara'),
(152,	'ES',	'Guipuzcoa',	'Guipuzcoa'),
(153,	'ES',	'Huelva',	'Huelva'),
(154,	'ES',	'Huesca',	'Huesca'),
(155,	'ES',	'Jaen',	'Jaen'),
(156,	'ES',	'La Rioja',	'La Rioja'),
(157,	'ES',	'Las Palmas',	'Las Palmas'),
(158,	'ES',	'Leon',	'Leon'),
(159,	'ES',	'Lleida',	'Lleida'),
(160,	'ES',	'Lugo',	'Lugo'),
(161,	'ES',	'Madrid',	'Madrid'),
(162,	'ES',	'Malaga',	'Malaga'),
(163,	'ES',	'Melilla',	'Melilla'),
(164,	'ES',	'Murcia',	'Murcia'),
(165,	'ES',	'Navarra',	'Navarra'),
(166,	'ES',	'Ourense',	'Ourense'),
(167,	'ES',	'Palencia',	'Palencia'),
(168,	'ES',	'Pontevedra',	'Pontevedra'),
(169,	'ES',	'Salamanca',	'Salamanca'),
(170,	'ES',	'Santa Cruz de Tenerife',	'Santa Cruz de Tenerife'),
(171,	'ES',	'Segovia',	'Segovia'),
(172,	'ES',	'Sevilla',	'Sevilla'),
(173,	'ES',	'Soria',	'Soria'),
(174,	'ES',	'Tarragona',	'Tarragona'),
(175,	'ES',	'Teruel',	'Teruel'),
(176,	'ES',	'Toledo',	'Toledo'),
(177,	'ES',	'Valencia',	'Valencia'),
(178,	'ES',	'Valladolid',	'Valladolid'),
(179,	'ES',	'Vizcaya',	'Vizcaya'),
(180,	'ES',	'Zamora',	'Zamora'),
(181,	'ES',	'Zaragoza',	'Zaragoza'),
(182,	'FR',	'1',	'Ain'),
(183,	'FR',	'2',	'Aisne'),
(184,	'FR',	'3',	'Allier'),
(185,	'FR',	'4',	'Alpes-de-Haute-Provence'),
(186,	'FR',	'5',	'Hautes-Alpes'),
(187,	'FR',	'6',	'Alpes-Maritimes'),
(188,	'FR',	'7',	'Ardèche'),
(189,	'FR',	'8',	'Ardennes'),
(190,	'FR',	'9',	'Ariège'),
(191,	'FR',	'10',	'Aube'),
(192,	'FR',	'11',	'Aude'),
(193,	'FR',	'12',	'Aveyron'),
(194,	'FR',	'13',	'Bouches-du-Rhône'),
(195,	'FR',	'14',	'Calvados'),
(196,	'FR',	'15',	'Cantal'),
(197,	'FR',	'16',	'Charente'),
(198,	'FR',	'17',	'Charente-Maritime'),
(199,	'FR',	'18',	'Cher'),
(200,	'FR',	'19',	'Corrèze'),
(201,	'FR',	'2A',	'Corse-du-Sud'),
(202,	'FR',	'2B',	'Haute-Corse'),
(203,	'FR',	'21',	'Côte-d\'Or'),
(204,	'FR',	'22',	'Côtes-d\'Armor'),
(205,	'FR',	'23',	'Creuse'),
(206,	'FR',	'24',	'Dordogne'),
(207,	'FR',	'25',	'Doubs'),
(208,	'FR',	'26',	'Drôme'),
(209,	'FR',	'27',	'Eure'),
(210,	'FR',	'28',	'Eure-et-Loir'),
(211,	'FR',	'29',	'Finistère'),
(212,	'FR',	'30',	'Gard'),
(213,	'FR',	'31',	'Haute-Garonne'),
(214,	'FR',	'32',	'Gers'),
(215,	'FR',	'33',	'Gironde'),
(216,	'FR',	'34',	'Hérault'),
(217,	'FR',	'35',	'Ille-et-Vilaine'),
(218,	'FR',	'36',	'Indre'),
(219,	'FR',	'37',	'Indre-et-Loire'),
(220,	'FR',	'38',	'Isère'),
(221,	'FR',	'39',	'Jura'),
(222,	'FR',	'40',	'Landes'),
(223,	'FR',	'41',	'Loir-et-Cher'),
(224,	'FR',	'42',	'Loire'),
(225,	'FR',	'43',	'Haute-Loire'),
(226,	'FR',	'44',	'Loire-Atlantique'),
(227,	'FR',	'45',	'Loiret'),
(228,	'FR',	'46',	'Lot'),
(229,	'FR',	'47',	'Lot-et-Garonne'),
(230,	'FR',	'48',	'Lozère'),
(231,	'FR',	'49',	'Maine-et-Loire'),
(232,	'FR',	'50',	'Manche'),
(233,	'FR',	'51',	'Marne'),
(234,	'FR',	'52',	'Haute-Marne'),
(235,	'FR',	'53',	'Mayenne'),
(236,	'FR',	'54',	'Meurthe-et-Moselle'),
(237,	'FR',	'55',	'Meuse'),
(238,	'FR',	'56',	'Morbihan'),
(239,	'FR',	'57',	'Moselle'),
(240,	'FR',	'58',	'Nièvre'),
(241,	'FR',	'59',	'Nord'),
(242,	'FR',	'60',	'Oise'),
(243,	'FR',	'61',	'Orne'),
(244,	'FR',	'62',	'Pas-de-Calais'),
(245,	'FR',	'63',	'Puy-de-Dôme'),
(246,	'FR',	'64',	'Pyrénées-Atlantiques'),
(247,	'FR',	'65',	'Hautes-Pyrénées'),
(248,	'FR',	'66',	'Pyrénées-Orientales'),
(249,	'FR',	'67',	'Bas-Rhin'),
(250,	'FR',	'68',	'Haut-Rhin'),
(251,	'FR',	'69',	'Rhône'),
(252,	'FR',	'70',	'Haute-Saône'),
(253,	'FR',	'71',	'Saône-et-Loire'),
(254,	'FR',	'72',	'Sarthe'),
(255,	'FR',	'73',	'Savoie'),
(256,	'FR',	'74',	'Haute-Savoie'),
(257,	'FR',	'75',	'Paris'),
(258,	'FR',	'76',	'Seine-Maritime'),
(259,	'FR',	'77',	'Seine-et-Marne'),
(260,	'FR',	'78',	'Yvelines'),
(261,	'FR',	'79',	'Deux-Sèvres'),
(262,	'FR',	'80',	'Somme'),
(263,	'FR',	'81',	'Tarn'),
(264,	'FR',	'82',	'Tarn-et-Garonne'),
(265,	'FR',	'83',	'Var'),
(266,	'FR',	'84',	'Vaucluse'),
(267,	'FR',	'85',	'Vendée'),
(268,	'FR',	'86',	'Vienne'),
(269,	'FR',	'87',	'Haute-Vienne'),
(270,	'FR',	'88',	'Vosges'),
(271,	'FR',	'89',	'Yonne'),
(272,	'FR',	'90',	'Territoire-de-Belfort'),
(273,	'FR',	'91',	'Essonne'),
(274,	'FR',	'92',	'Hauts-de-Seine'),
(275,	'FR',	'93',	'Seine-Saint-Denis'),
(276,	'FR',	'94',	'Val-de-Marne'),
(277,	'FR',	'95',	'Val-d\'Oise'),
(278,	'RO',	'AB',	'Alba'),
(279,	'RO',	'AR',	'Arad'),
(280,	'RO',	'AG',	'Argeş'),
(281,	'RO',	'BC',	'Bacău'),
(282,	'RO',	'BH',	'Bihor'),
(283,	'RO',	'BN',	'Bistriţa-Năsăud'),
(284,	'RO',	'BT',	'Botoşani'),
(285,	'RO',	'BV',	'Braşov'),
(286,	'RO',	'BR',	'Brăila'),
(287,	'RO',	'B',	'Bucureşti'),
(288,	'RO',	'BZ',	'Buzău'),
(289,	'RO',	'CS',	'Caraş-Severin'),
(290,	'RO',	'CL',	'Călăraşi'),
(291,	'RO',	'CJ',	'Cluj'),
(292,	'RO',	'CT',	'Constanţa'),
(293,	'RO',	'CV',	'Covasna'),
(294,	'RO',	'DB',	'Dâmboviţa'),
(295,	'RO',	'DJ',	'Dolj'),
(296,	'RO',	'GL',	'Galaţi'),
(297,	'RO',	'GR',	'Giurgiu'),
(298,	'RO',	'GJ',	'Gorj'),
(299,	'RO',	'HR',	'Harghita'),
(300,	'RO',	'HD',	'Hunedoara'),
(301,	'RO',	'IL',	'Ialomiţa'),
(302,	'RO',	'IS',	'Iaşi'),
(303,	'RO',	'IF',	'Ilfov'),
(304,	'RO',	'MM',	'Maramureş'),
(305,	'RO',	'MH',	'Mehedinţi'),
(306,	'RO',	'MS',	'Mureş'),
(307,	'RO',	'NT',	'Neamţ'),
(308,	'RO',	'OT',	'Olt'),
(309,	'RO',	'PH',	'Prahova'),
(310,	'RO',	'SM',	'Satu-Mare'),
(311,	'RO',	'SJ',	'Sălaj'),
(312,	'RO',	'SB',	'Sibiu'),
(313,	'RO',	'SV',	'Suceava'),
(314,	'RO',	'TR',	'Teleorman'),
(315,	'RO',	'TM',	'Timiş'),
(316,	'RO',	'TL',	'Tulcea'),
(317,	'RO',	'VS',	'Vaslui'),
(318,	'RO',	'VL',	'Vâlcea'),
(319,	'RO',	'VN',	'Vrancea'),
(320,	'FI',	'Lappi',	'Lappi'),
(321,	'FI',	'Pohjois-Pohjanmaa',	'Pohjois-Pohjanmaa'),
(322,	'FI',	'Kainuu',	'Kainuu'),
(323,	'FI',	'Pohjois-Karjala',	'Pohjois-Karjala'),
(324,	'FI',	'Pohjois-Savo',	'Pohjois-Savo'),
(325,	'FI',	'Etelä-Savo',	'Etelä-Savo'),
(326,	'FI',	'Etelä-Pohjanmaa',	'Etelä-Pohjanmaa'),
(327,	'FI',	'Pohjanmaa',	'Pohjanmaa'),
(328,	'FI',	'Pirkanmaa',	'Pirkanmaa'),
(329,	'FI',	'Satakunta',	'Satakunta'),
(330,	'FI',	'Keski-Pohjanmaa',	'Keski-Pohjanmaa'),
(331,	'FI',	'Keski-Suomi',	'Keski-Suomi'),
(332,	'FI',	'Varsinais-Suomi',	'Varsinais-Suomi'),
(333,	'FI',	'Etelä-Karjala',	'Etelä-Karjala'),
(334,	'FI',	'Päijät-Häme',	'Päijät-Häme'),
(335,	'FI',	'Kanta-Häme',	'Kanta-Häme'),
(336,	'FI',	'Uusimaa',	'Uusimaa'),
(337,	'FI',	'Itä-Uusimaa',	'Itä-Uusimaa'),
(338,	'FI',	'Kymenlaakso',	'Kymenlaakso'),
(339,	'FI',	'Ahvenanmaa',	'Ahvenanmaa'),
(340,	'EE',	'EE-37',	'Harjumaa'),
(341,	'EE',	'EE-39',	'Hiiumaa'),
(342,	'EE',	'EE-44',	'Ida-Virumaa'),
(343,	'EE',	'EE-49',	'Jõgevamaa'),
(344,	'EE',	'EE-51',	'Järvamaa'),
(345,	'EE',	'EE-57',	'Läänemaa'),
(346,	'EE',	'EE-59',	'Lääne-Virumaa'),
(347,	'EE',	'EE-65',	'Põlvamaa'),
(348,	'EE',	'EE-67',	'Pärnumaa'),
(349,	'EE',	'EE-70',	'Raplamaa'),
(350,	'EE',	'EE-74',	'Saaremaa'),
(351,	'EE',	'EE-78',	'Tartumaa'),
(352,	'EE',	'EE-82',	'Valgamaa'),
(353,	'EE',	'EE-84',	'Viljandimaa'),
(354,	'EE',	'EE-86',	'Võrumaa'),
(355,	'LV',	'LV-DGV',	'Daugavpils'),
(356,	'LV',	'LV-JEL',	'Jelgava'),
(357,	'LV',	'Jēkabpils',	'Jēkabpils'),
(358,	'LV',	'LV-JUR',	'Jūrmala'),
(359,	'LV',	'LV-LPX',	'Liepāja'),
(360,	'LV',	'LV-LE',	'Liepājas novads'),
(361,	'LV',	'LV-REZ',	'Rēzekne'),
(362,	'LV',	'LV-RIX',	'Rīga'),
(363,	'LV',	'LV-RI',	'Rīgas novads'),
(364,	'LV',	'Valmiera',	'Valmiera'),
(365,	'LV',	'LV-VEN',	'Ventspils'),
(366,	'LV',	'Aglonas novads',	'Aglonas novads'),
(367,	'LV',	'LV-AI',	'Aizkraukles novads'),
(368,	'LV',	'Aizputes novads',	'Aizputes novads'),
(369,	'LV',	'Aknīstes novads',	'Aknīstes novads'),
(370,	'LV',	'Alojas novads',	'Alojas novads'),
(371,	'LV',	'Alsungas novads',	'Alsungas novads'),
(372,	'LV',	'LV-AL',	'Alūksnes novads'),
(373,	'LV',	'Amatas novads',	'Amatas novads'),
(374,	'LV',	'Apes novads',	'Apes novads'),
(375,	'LV',	'Auces novads',	'Auces novads'),
(376,	'LV',	'Babītes novads',	'Babītes novads'),
(377,	'LV',	'Baldones novads',	'Baldones novads'),
(378,	'LV',	'Baltinavas novads',	'Baltinavas novads'),
(379,	'LV',	'LV-BL',	'Balvu novads'),
(380,	'LV',	'LV-BU',	'Bauskas novads'),
(381,	'LV',	'Beverīnas novads',	'Beverīnas novads'),
(382,	'LV',	'Brocēnu novads',	'Brocēnu novads'),
(383,	'LV',	'Burtnieku novads',	'Burtnieku novads'),
(384,	'LV',	'Carnikavas novads',	'Carnikavas novads'),
(385,	'LV',	'Cesvaines novads',	'Cesvaines novads'),
(386,	'LV',	'Ciblas novads',	'Ciblas novads'),
(387,	'LV',	'LV-CE',	'Cēsu novads'),
(388,	'LV',	'Dagdas novads',	'Dagdas novads'),
(389,	'LV',	'LV-DA',	'Daugavpils novads'),
(390,	'LV',	'LV-DO',	'Dobeles novads'),
(391,	'LV',	'Dundagas novads',	'Dundagas novads'),
(392,	'LV',	'Durbes novads',	'Durbes novads'),
(393,	'LV',	'Engures novads',	'Engures novads'),
(394,	'LV',	'Garkalnes novads',	'Garkalnes novads'),
(395,	'LV',	'Grobiņas novads',	'Grobiņas novads'),
(396,	'LV',	'LV-GU',	'Gulbenes novads'),
(397,	'LV',	'Iecavas novads',	'Iecavas novads'),
(398,	'LV',	'Ikšķiles novads',	'Ikšķiles novads'),
(399,	'LV',	'Ilūkstes novads',	'Ilūkstes novads'),
(400,	'LV',	'Inčukalna novads',	'Inčukalna novads'),
(401,	'LV',	'Jaunjelgavas novads',	'Jaunjelgavas novads'),
(402,	'LV',	'Jaunpiebalgas novads',	'Jaunpiebalgas novads'),
(403,	'LV',	'Jaunpils novads',	'Jaunpils novads'),
(404,	'LV',	'LV-JL',	'Jelgavas novads'),
(405,	'LV',	'LV-JK',	'Jēkabpils novads'),
(406,	'LV',	'Kandavas novads',	'Kandavas novads'),
(407,	'LV',	'Kokneses novads',	'Kokneses novads'),
(408,	'LV',	'Krimuldas novads',	'Krimuldas novads'),
(409,	'LV',	'Krustpils novads',	'Krustpils novads'),
(410,	'LV',	'LV-KR',	'Krāslavas novads'),
(411,	'LV',	'LV-KU',	'Kuldīgas novads'),
(412,	'LV',	'Kārsavas novads',	'Kārsavas novads'),
(413,	'LV',	'Lielvārdes novads',	'Lielvārdes novads'),
(414,	'LV',	'LV-LM',	'Limbažu novads'),
(415,	'LV',	'Lubānas novads',	'Lubānas novads'),
(416,	'LV',	'LV-LU',	'Ludzas novads'),
(417,	'LV',	'Līgatnes novads',	'Līgatnes novads'),
(418,	'LV',	'Līvānu novads',	'Līvānu novads'),
(419,	'LV',	'LV-MA',	'Madonas novads'),
(420,	'LV',	'Mazsalacas novads',	'Mazsalacas novads'),
(421,	'LV',	'Mālpils novads',	'Mālpils novads'),
(422,	'LV',	'Mārupes novads',	'Mārupes novads'),
(423,	'LV',	'Naukšēnu novads',	'Naukšēnu novads'),
(424,	'LV',	'Neretas novads',	'Neretas novads'),
(425,	'LV',	'Nīcas novads',	'Nīcas novads'),
(426,	'LV',	'LV-OG',	'Ogres novads'),
(427,	'LV',	'Olaines novads',	'Olaines novads'),
(428,	'LV',	'Ozolnieku novads',	'Ozolnieku novads'),
(429,	'LV',	'LV-PR',	'Preiļu novads'),
(430,	'LV',	'Priekules novads',	'Priekules novads'),
(431,	'LV',	'Priekuļu novads',	'Priekuļu novads'),
(432,	'LV',	'Pārgaujas novads',	'Pārgaujas novads'),
(433,	'LV',	'Pāvilostas novads',	'Pāvilostas novads'),
(434,	'LV',	'Pļaviņu novads',	'Pļaviņu novads'),
(435,	'LV',	'Raunas novads',	'Raunas novads'),
(436,	'LV',	'Riebiņu novads',	'Riebiņu novads'),
(437,	'LV',	'Rojas novads',	'Rojas novads'),
(438,	'LV',	'Ropažu novads',	'Ropažu novads'),
(439,	'LV',	'Rucavas novads',	'Rucavas novads'),
(440,	'LV',	'Rugāju novads',	'Rugāju novads'),
(441,	'LV',	'Rundāles novads',	'Rundāles novads'),
(442,	'LV',	'LV-RE',	'Rēzeknes novads'),
(443,	'LV',	'Rūjienas novads',	'Rūjienas novads'),
(444,	'LV',	'Salacgrīvas novads',	'Salacgrīvas novads'),
(445,	'LV',	'Salas novads',	'Salas novads'),
(446,	'LV',	'Salaspils novads',	'Salaspils novads'),
(447,	'LV',	'LV-SA',	'Saldus novads'),
(448,	'LV',	'Saulkrastu novads',	'Saulkrastu novads'),
(449,	'LV',	'Siguldas novads',	'Siguldas novads'),
(450,	'LV',	'Skrundas novads',	'Skrundas novads'),
(451,	'LV',	'Skrīveru novads',	'Skrīveru novads'),
(452,	'LV',	'Smiltenes novads',	'Smiltenes novads'),
(453,	'LV',	'Stopiņu novads',	'Stopiņu novads'),
(454,	'LV',	'Strenču novads',	'Strenču novads'),
(455,	'LV',	'Sējas novads',	'Sējas novads'),
(456,	'LV',	'LV-TA',	'Talsu novads'),
(457,	'LV',	'LV-TU',	'Tukuma novads'),
(458,	'LV',	'Tērvetes novads',	'Tērvetes novads'),
(459,	'LV',	'Vaiņodes novads',	'Vaiņodes novads'),
(460,	'LV',	'LV-VK',	'Valkas novads'),
(461,	'LV',	'LV-VM',	'Valmieras novads'),
(462,	'LV',	'Varakļānu novads',	'Varakļānu novads'),
(463,	'LV',	'Vecpiebalgas novads',	'Vecpiebalgas novads'),
(464,	'LV',	'Vecumnieku novads',	'Vecumnieku novads'),
(465,	'LV',	'LV-VE',	'Ventspils novads'),
(466,	'LV',	'Viesītes novads',	'Viesītes novads'),
(467,	'LV',	'Viļakas novads',	'Viļakas novads'),
(468,	'LV',	'Viļānu novads',	'Viļānu novads'),
(469,	'LV',	'Vārkavas novads',	'Vārkavas novads'),
(470,	'LV',	'Zilupes novads',	'Zilupes novads'),
(471,	'LV',	'Ādažu novads',	'Ādažu novads'),
(472,	'LV',	'Ērgļu novads',	'Ērgļu novads'),
(473,	'LV',	'Ķeguma novads',	'Ķeguma novads'),
(474,	'LV',	'Ķekavas novads',	'Ķekavas novads'),
(475,	'LT',	'LT-AL',	'Alytaus Apskritis'),
(476,	'LT',	'LT-KU',	'Kauno Apskritis'),
(477,	'LT',	'LT-KL',	'Klaipėdos Apskritis'),
(478,	'LT',	'LT-MR',	'Marijampolės Apskritis'),
(479,	'LT',	'LT-PN',	'Panevėžio Apskritis'),
(480,	'LT',	'LT-SA',	'Šiaulių Apskritis'),
(481,	'LT',	'LT-TA',	'Tauragės Apskritis'),
(482,	'LT',	'LT-TE',	'Telšių Apskritis'),
(483,	'LT',	'LT-UT',	'Utenos Apskritis'),
(484,	'LT',	'LT-VL',	'Vilniaus Apskritis'),
(485,	'BR',	'AC',	'Acre'),
(486,	'BR',	'AL',	'Alagoas'),
(487,	'BR',	'AP',	'Amapá'),
(488,	'BR',	'AM',	'Amazonas'),
(489,	'BR',	'BA',	'Bahia'),
(490,	'BR',	'CE',	'Ceará'),
(491,	'BR',	'ES',	'Espírito Santo'),
(492,	'BR',	'GO',	'Goiás'),
(493,	'BR',	'MA',	'Maranhão'),
(494,	'BR',	'MT',	'Mato Grosso'),
(495,	'BR',	'MS',	'Mato Grosso do Sul'),
(496,	'BR',	'MG',	'Minas Gerais'),
(497,	'BR',	'PA',	'Pará'),
(498,	'BR',	'PB',	'Paraíba'),
(499,	'BR',	'PR',	'Paraná'),
(500,	'BR',	'PE',	'Pernambuco'),
(501,	'BR',	'PI',	'Piauí'),
(502,	'BR',	'RJ',	'Rio de Janeiro'),
(503,	'BR',	'RN',	'Rio Grande do Norte'),
(504,	'BR',	'RS',	'Rio Grande do Sul'),
(505,	'BR',	'RO',	'Rondônia'),
(506,	'BR',	'RR',	'Roraima'),
(507,	'BR',	'SC',	'Santa Catarina'),
(508,	'BR',	'SP',	'São Paulo'),
(509,	'BR',	'SE',	'Sergipe'),
(510,	'BR',	'TO',	'Tocantins'),
(511,	'BR',	'DF',	'Distrito Federal'),
(512,	'AL',	'AL-01',	'Berat'),
(513,	'AL',	'AL-09',	'Dibër'),
(514,	'AL',	'AL-02',	'Durrës'),
(515,	'AL',	'AL-03',	'Elbasan'),
(516,	'AL',	'AL-04',	'Fier'),
(517,	'AL',	'AL-05',	'Gjirokastër'),
(518,	'AL',	'AL-06',	'Korçë'),
(519,	'AL',	'AL-07',	'Kukës'),
(520,	'AL',	'AL-08',	'Lezhë'),
(521,	'AL',	'AL-10',	'Shkodër'),
(522,	'AL',	'AL-11',	'Tiranë'),
(523,	'AL',	'AL-12',	'Vlorë'),
(524,	'AR',	'AR-C',	'Ciudad Autónoma de Buenos Aires'),
(525,	'AR',	'AR-B',	'Buenos Aires'),
(526,	'AR',	'AR-K',	'Catamarca'),
(527,	'AR',	'AR-H',	'Chaco'),
(528,	'AR',	'AR-U',	'Chubut'),
(529,	'AR',	'AR-X',	'Córdoba'),
(530,	'AR',	'AR-W',	'Corrientes'),
(531,	'AR',	'AR-E',	'Entre Ríos'),
(532,	'AR',	'AR-P',	'Formosa'),
(533,	'AR',	'AR-Y',	'Jujuy'),
(534,	'AR',	'AR-L',	'La Pampa'),
(535,	'AR',	'AR-F',	'La Rioja'),
(536,	'AR',	'AR-M',	'Mendoza'),
(537,	'AR',	'AR-N',	'Misiones'),
(538,	'AR',	'AR-Q',	'Neuquén'),
(539,	'AR',	'AR-R',	'Río Negro'),
(540,	'AR',	'AR-A',	'Salta'),
(541,	'AR',	'AR-J',	'San Juan'),
(542,	'AR',	'AR-D',	'San Luis'),
(543,	'AR',	'AR-Z',	'Santa Cruz'),
(544,	'AR',	'AR-S',	'Santa Fe'),
(545,	'AR',	'AR-G',	'Santiago del Estero'),
(546,	'AR',	'AR-V',	'Tierra del Fuego'),
(547,	'AR',	'AR-T',	'Tucumán'),
(548,	'HR',	'HR-01',	'Zagrebačka županija'),
(549,	'HR',	'HR-02',	'Krapinsko-zagorska županija'),
(550,	'HR',	'HR-03',	'Sisačko-moslavačka županija'),
(551,	'HR',	'HR-04',	'Karlovačka županija'),
(552,	'HR',	'HR-05',	'Varaždinska županija'),
(553,	'HR',	'HR-06',	'Koprivničko-križevačka županija'),
(554,	'HR',	'HR-07',	'Bjelovarsko-bilogorska županija'),
(555,	'HR',	'HR-08',	'Primorsko-goranska županija'),
(556,	'HR',	'HR-09',	'Ličko-senjska županija'),
(557,	'HR',	'HR-10',	'Virovitičko-podravska županija'),
(558,	'HR',	'HR-11',	'Požeško-slavonska županija'),
(559,	'HR',	'HR-12',	'Brodsko-posavska županija'),
(560,	'HR',	'HR-13',	'Zadarska županija'),
(561,	'HR',	'HR-14',	'Osječko-baranjska županija'),
(562,	'HR',	'HR-15',	'Šibensko-kninska županija'),
(563,	'HR',	'HR-16',	'Vukovarsko-srijemska županija'),
(564,	'HR',	'HR-17',	'Splitsko-dalmatinska županija'),
(565,	'HR',	'HR-18',	'Istarska županija'),
(566,	'HR',	'HR-19',	'Dubrovačko-neretvanska županija'),
(567,	'HR',	'HR-20',	'Međimurska županija'),
(568,	'HR',	'HR-21',	'Grad Zagreb'),
(569,	'IN',	'AN',	'Andaman and Nicobar Islands'),
(570,	'IN',	'AP',	'Andhra Pradesh'),
(571,	'IN',	'AR',	'Arunachal Pradesh'),
(572,	'IN',	'AS',	'Assam'),
(573,	'IN',	'BR',	'Bihar'),
(574,	'IN',	'CH',	'Chandigarh'),
(575,	'IN',	'CT',	'Chhattisgarh'),
(576,	'IN',	'DN',	'Dadra and Nagar Haveli'),
(577,	'IN',	'DD',	'Daman and Diu'),
(578,	'IN',	'DL',	'Delhi'),
(579,	'IN',	'GA',	'Goa'),
(580,	'IN',	'GJ',	'Gujarat'),
(581,	'IN',	'HR',	'Haryana'),
(582,	'IN',	'HP',	'Himachal Pradesh'),
(583,	'IN',	'JK',	'Jammu and Kashmir'),
(584,	'IN',	'JH',	'Jharkhand'),
(585,	'IN',	'KA',	'Karnataka'),
(586,	'IN',	'KL',	'Kerala'),
(587,	'IN',	'LD',	'Lakshadweep'),
(588,	'IN',	'MP',	'Madhya Pradesh'),
(589,	'IN',	'MH',	'Maharashtra'),
(590,	'IN',	'MN',	'Manipur'),
(591,	'IN',	'ML',	'Meghalaya'),
(592,	'IN',	'MZ',	'Mizoram'),
(593,	'IN',	'NL',	'Nagaland'),
(594,	'IN',	'OR',	'Odisha'),
(595,	'IN',	'PY',	'Puducherry'),
(596,	'IN',	'PB',	'Punjab'),
(597,	'IN',	'RJ',	'Rajasthan'),
(598,	'IN',	'SK',	'Sikkim'),
(599,	'IN',	'TN',	'Tamil Nadu'),
(600,	'IN',	'TG',	'Telangana'),
(601,	'IN',	'TR',	'Tripura'),
(602,	'IN',	'UP',	'Uttar Pradesh'),
(603,	'IN',	'UT',	'Uttarakhand'),
(604,	'IN',	'WB',	'West Bengal'),
(605,	'AU',	'ACT',	'Australian Capital Territory'),
(606,	'AU',	'NSW',	'New South Wales'),
(607,	'AU',	'VIC',	'Victoria'),
(608,	'AU',	'QLD',	'Queensland'),
(609,	'AU',	'SA',	'South Australia'),
(610,	'AU',	'TAS',	'Tasmania'),
(611,	'AU',	'WA',	'Western Australia'),
(612,	'AU',	'NT',	'Northern Territory'),
(613,	'BY',	'BY-BR',	'Bresckaja voblasć'),
(614,	'BY',	'BY-HO',	'Homieĺskaja voblasć'),
(615,	'BY',	'BY-HM',	'Horad Minsk'),
(616,	'BY',	'BY-HR',	'Hrodzienskaja voblasć'),
(617,	'BY',	'BY-MA',	'Mahilioŭskaja voblasć'),
(618,	'BY',	'BY-MI',	'Minskaja voblasć'),
(619,	'BY',	'BY-VI',	'Viciebskaja voblasć'),
(620,	'BE',	'VAN',	'Antwerpen'),
(621,	'BE',	'WBR',	'Brabant wallon'),
(622,	'BE',	'BRU',	'Brussels-Capital Region'),
(623,	'BE',	'WHT',	'Hainaut'),
(624,	'BE',	'VLI',	'Limburg'),
(625,	'BE',	'WLG',	'Liège'),
(626,	'BE',	'WLX',	'Luxembourg'),
(627,	'BE',	'WNA',	'Namur'),
(628,	'BE',	'VOV',	'Oost-Vlaanderen'),
(629,	'BE',	'VBR',	'Vlaams-Brabant'),
(630,	'BE',	'VWV',	'West-Vlaanderen'),
(631,	'BO',	'BO-C',	'Cochabamba'),
(632,	'BO',	'BO-H',	'Chuquisaca'),
(633,	'BO',	'BO-B',	'El Beni'),
(634,	'BO',	'BO-L',	'La Paz'),
(635,	'BO',	'BO-O',	'Oruro'),
(636,	'BO',	'BO-N',	'Pando'),
(637,	'BO',	'BO-P',	'Potosí'),
(638,	'BO',	'BO-S',	'Santa Cruz'),
(639,	'BO',	'BO-T',	'Tarija'),
(640,	'BG',	'BG-01',	'Blagoevgrad'),
(641,	'BG',	'BG-02',	'Burgas'),
(642,	'BG',	'BG-03',	'Varna'),
(643,	'BG',	'BG-04',	'Veliko Tarnovo'),
(644,	'BG',	'BG-05',	'Vidin'),
(645,	'BG',	'BG-06',	'Vratsa'),
(646,	'BG',	'BG-07',	'Gabrovo'),
(647,	'BG',	'BG-08',	'Dobrich'),
(648,	'BG',	'BG-09',	'Kardzhali'),
(649,	'BG',	'BG-10',	'Kyustendil'),
(650,	'BG',	'BG-11',	'Lovech'),
(651,	'BG',	'BG-12',	'Montana'),
(652,	'BG',	'BG-13',	'Pazardzhik'),
(653,	'BG',	'BG-14',	'Pernik'),
(654,	'BG',	'BG-15',	'Pleven'),
(655,	'BG',	'BG-16',	'Plovdiv'),
(656,	'BG',	'BG-17',	'Razgrad'),
(657,	'BG',	'BG-18',	'Ruse'),
(658,	'BG',	'BG-19',	'Silistra'),
(659,	'BG',	'BG-20',	'Sliven'),
(660,	'BG',	'BG-21',	'Smolyan'),
(661,	'BG',	'BG-22',	'Sofia City'),
(662,	'BG',	'BG-23',	'Sofia Province'),
(663,	'BG',	'BG-24',	'Stara Zagora'),
(664,	'BG',	'BG-25',	'Targovishte'),
(665,	'BG',	'BG-26',	'Haskovo'),
(666,	'BG',	'BG-27',	'Shumen'),
(667,	'BG',	'BG-28',	'Yambol'),
(668,	'CL',	'CL-AI',	'Aisén del General Carlos Ibañez del Campo'),
(669,	'CL',	'CL-AN',	'Antofagasta'),
(670,	'CL',	'CL-AP',	'Arica y Parinacota'),
(671,	'CL',	'CL-AR',	'La Araucanía'),
(672,	'CL',	'CL-AT',	'Atacama'),
(673,	'CL',	'CL-BI',	'Biobío'),
(674,	'CL',	'CL-CO',	'Coquimbo'),
(675,	'CL',	'CL-LI',	'Libertador General Bernardo O\'Higgins'),
(676,	'CL',	'CL-LL',	'Los Lagos'),
(677,	'CL',	'CL-LR',	'Los Ríos'),
(678,	'CL',	'CL-MA',	'Magallanes'),
(679,	'CL',	'CL-ML',	'Maule'),
(680,	'CL',	'CL-NB',	'Ñuble'),
(681,	'CL',	'CL-RM',	'Región Metropolitana de Santiago'),
(682,	'CL',	'CL-TA',	'Tarapacá'),
(683,	'CL',	'CL-VS',	'Valparaíso'),
(684,	'CN',	'CN-AH',	'Anhui Sheng'),
(685,	'CN',	'CN-BJ',	'Beijing Shi'),
(686,	'CN',	'CN-CQ',	'Chongqing Shi'),
(687,	'CN',	'CN-FJ',	'Fujian Sheng'),
(688,	'CN',	'CN-GS',	'Gansu Sheng'),
(689,	'CN',	'CN-GD',	'Guangdong Sheng'),
(690,	'CN',	'CN-GX',	'Guangxi Zhuangzu Zizhiqu'),
(691,	'CN',	'CN-GZ',	'Guizhou Sheng'),
(692,	'CN',	'CN-HI',	'Hainan Sheng'),
(693,	'CN',	'CN-HE',	'Hebei Sheng'),
(694,	'CN',	'CN-HL',	'Heilongjiang Sheng'),
(695,	'CN',	'CN-HA',	'Henan Sheng'),
(696,	'CN',	'CN-HK',	'Hong Kong SAR'),
(697,	'CN',	'CN-HB',	'Hubei Sheng'),
(698,	'CN',	'CN-HN',	'Hunan Sheng'),
(699,	'CN',	'CN-JS',	'Jiangsu Sheng'),
(700,	'CN',	'CN-JX',	'Jiangxi Sheng'),
(701,	'CN',	'CN-JL',	'Jilin Sheng'),
(702,	'CN',	'CN-LN',	'Liaoning Sheng'),
(703,	'CN',	'CN-MO',	'Macao SAR'),
(704,	'CN',	'CN-NM',	'Nei Mongol Zizhiqu'),
(705,	'CN',	'CN-NX',	'Ningxia Huizi Zizhiqu'),
(706,	'CN',	'CN-QH',	'Qinghai Sheng'),
(707,	'CN',	'CN-SN',	'Shaanxi Sheng'),
(708,	'CN',	'CN-SD',	'Shandong Sheng'),
(709,	'CN',	'CN-SH',	'Shanghai Shi'),
(710,	'CN',	'CN-SX',	'Shanxi Sheng'),
(711,	'CN',	'CN-SC',	'Sichuan Sheng'),
(712,	'CN',	'CN-TW',	'Taiwan Sheng'),
(713,	'CN',	'CN-TJ',	'Tianjin Shi'),
(714,	'CN',	'CN-XJ',	'Xinjiang Uygur Zizhiqu'),
(715,	'CN',	'CN-XZ',	'Xizang Zizhiqu'),
(716,	'CN',	'CN-YN',	'Yunnan Sheng'),
(717,	'CN',	'CN-ZJ',	'Zhejiang Sheng'),
(718,	'CO',	'CO-AMA',	'Amazonas'),
(719,	'CO',	'CO-ANT',	'Antioquia'),
(720,	'CO',	'CO-ARA',	'Arauca'),
(721,	'CO',	'CO-ATL',	'Atlántico'),
(722,	'CO',	'CO-BOL',	'Bolívar'),
(723,	'CO',	'CO-BOY',	'Boyacá'),
(724,	'CO',	'CO-CAL',	'Caldas'),
(725,	'CO',	'CO-CAQ',	'Caquetá'),
(726,	'CO',	'CO-CAS',	'Casanare'),
(727,	'CO',	'CO-CAU',	'Cauca'),
(728,	'CO',	'CO-CES',	'Cesar'),
(729,	'CO',	'CO-CHO',	'Chocó'),
(730,	'CO',	'CO-COR',	'Córdoba'),
(731,	'CO',	'CO-CUN',	'Cundinamarca'),
(732,	'CO',	'CO-GUA',	'Guainía'),
(733,	'CO',	'CO-GUV',	'Guaviare'),
(734,	'CO',	'CO-HUL',	'Huila'),
(735,	'CO',	'CO-LAG',	'La Guajira'),
(736,	'CO',	'CO-MAG',	'Magdalena'),
(737,	'CO',	'CO-MET',	'Meta'),
(738,	'CO',	'CO-NAR',	'Nariño'),
(739,	'CO',	'CO-NSA',	'Norte de Santander'),
(740,	'CO',	'CO-PUT',	'Putumayo'),
(741,	'CO',	'CO-QUI',	'Quindío'),
(742,	'CO',	'CO-RIS',	'Risaralda'),
(743,	'CO',	'CO-SAP',	'San Andrés y Providencia'),
(744,	'CO',	'CO-SAN',	'Santander'),
(745,	'CO',	'CO-SUC',	'Sucre'),
(746,	'CO',	'CO-TOL',	'Tolima'),
(747,	'CO',	'CO-VAC',	'Valle del Cauca'),
(748,	'CO',	'CO-VAU',	'Vaupés'),
(749,	'CO',	'CO-VID',	'Vichada'),
(750,	'CZ',	'CZ-10',	'Praha, Hlavní město'),
(751,	'CZ',	'CZ-20',	'Středočeský kraj'),
(752,	'CZ',	'CZ-31',	'Jihočeský kraj'),
(753,	'CZ',	'CZ-32',	'Plzeňský kraj'),
(754,	'CZ',	'CZ-41',	'Karlovarský kraj'),
(755,	'CZ',	'CZ-42',	'Ústecký kraj'),
(756,	'CZ',	'CZ-51',	'Liberecký kraj'),
(757,	'CZ',	'CZ-52',	'Královéhradecký kraj'),
(758,	'CZ',	'CZ-53',	'Pardubický kraj'),
(759,	'CZ',	'CZ-63',	'Kraj Vysočina'),
(760,	'CZ',	'CZ-64',	'Jihomoravský kraj'),
(761,	'CZ',	'CZ-71',	'Olomoucký kraj'),
(762,	'CZ',	'CZ-72',	'Zlínský kraj'),
(763,	'CZ',	'CZ-80',	'Moravskoslezský kraj'),
(764,	'DK',	'DK-84',	'Hovedstaden'),
(765,	'DK',	'DK-82',	'Midtjylland'),
(766,	'DK',	'DK-81',	'Nordjylland'),
(767,	'DK',	'DK-85',	'Sjælland'),
(768,	'DK',	'DK-83',	'Syddanmark'),
(769,	'EC',	'EC-A',	'Azuay'),
(770,	'EC',	'EC-B',	'Bolívar'),
(771,	'EC',	'EC-F',	'Cañar'),
(772,	'EC',	'EC-C',	'Carchi'),
(773,	'EC',	'EC-H',	'Chimborazo'),
(774,	'EC',	'EC-X',	'Cotopaxi'),
(775,	'EC',	'EC-O',	'El Oro'),
(776,	'EC',	'EC-E',	'Esmeraldas'),
(777,	'EC',	'EC-W',	'Galápagos'),
(778,	'EC',	'EC-G',	'Guayas'),
(779,	'EC',	'EC-I',	'Imbabura'),
(780,	'EC',	'EC-L',	'Loja'),
(781,	'EC',	'EC-R',	'Los Ríos'),
(782,	'EC',	'EC-M',	'Manabí'),
(783,	'EC',	'EC-S',	'Morona Santiago'),
(784,	'EC',	'EC-N',	'Napo'),
(785,	'EC',	'EC-D',	'Orellana'),
(786,	'EC',	'EC-Y',	'Pastaza'),
(787,	'EC',	'EC-P',	'Pichincha'),
(788,	'EC',	'EC-SE',	'Santa Elena'),
(789,	'EC',	'EC-SD',	'Santo Domingo de los Tsáchilas'),
(790,	'EC',	'EC-U',	'Sucumbíos'),
(791,	'EC',	'EC-T',	'Tungurahua'),
(792,	'EC',	'EC-Z',	'Zamora Chinchipe'),
(793,	'GR',	'GR-A',	'Anatolikí Makedonía kai Thráki'),
(794,	'GR',	'GR-I',	'Attikí'),
(795,	'GR',	'GR-G',	'Dytikí Elláda'),
(796,	'GR',	'GR-C',	'Dytikí Makedonía'),
(797,	'GR',	'GR-F',	'Ionía Nísia'),
(798,	'GR',	'GR-D',	'Ípeiros'),
(799,	'GR',	'GR-B',	'Kentrikí Makedonía'),
(800,	'GR',	'GR-M',	'Kríti'),
(801,	'GR',	'GR-L',	'Nótio Aigaío'),
(802,	'GR',	'GR-J',	'Pelopónnisos'),
(803,	'GR',	'GR-H',	'Stereá Elláda'),
(804,	'GR',	'GR-E',	'Thessalía'),
(805,	'GR',	'GR-K',	'Vóreio Aigaío'),
(806,	'GR',	'GR-69',	'Ágion Óros'),
(807,	'GY',	'GY-BA',	'Barima-Waini'),
(808,	'GY',	'GY-CU',	'Cuyuni-Mazaruni'),
(809,	'GY',	'GY-DE',	'Demerara-Mahaica'),
(810,	'GY',	'GY-EB',	'East Berbice-Corentyne'),
(811,	'GY',	'GY-ES',	'Essequibo Islands-West Demerara'),
(812,	'GY',	'GY-MA',	'Mahaica-Berbice'),
(813,	'GY',	'GY-PM',	'Pomeroon-Supenaam'),
(814,	'GY',	'GY-PT',	'Potaro-Siparuni'),
(815,	'GY',	'GY-UD',	'Upper Demerara-Berbice'),
(816,	'GY',	'GY-UT',	'Upper Takutu-Upper Essequibo'),
(817,	'IS',	'IS-01',	'Höfuðborgarsvæði'),
(818,	'IS',	'IS-02',	'Suðurnes'),
(819,	'IS',	'IS-03',	'Vesturland'),
(820,	'IS',	'IS-04',	'Vestfirðir'),
(821,	'IS',	'IS-05',	'Norðurland vestra'),
(822,	'IS',	'IS-06',	'Norðurland eystra'),
(823,	'IS',	'IS-07',	'Austurland'),
(824,	'IS',	'IS-08',	'Suðurland'),
(825,	'IT',	'AG',	'Agrigento'),
(826,	'IT',	'AL',	'Alessandria'),
(827,	'IT',	'AN',	'Ancona'),
(828,	'IT',	'AO',	'Aosta'),
(829,	'IT',	'AQ',	'L\'Aquila'),
(830,	'IT',	'AR',	'Arezzo'),
(831,	'IT',	'AP',	'Ascoli-Piceno'),
(832,	'IT',	'AT',	'Asti'),
(833,	'IT',	'AV',	'Avellino'),
(834,	'IT',	'BA',	'Bari'),
(835,	'IT',	'BT',	'Barletta-Andria-Trani'),
(836,	'IT',	'BL',	'Belluno'),
(837,	'IT',	'BN',	'Benevento'),
(838,	'IT',	'BG',	'Bergamo'),
(839,	'IT',	'BI',	'Biella'),
(840,	'IT',	'BO',	'Bologna'),
(841,	'IT',	'BZ',	'Bolzano'),
(842,	'IT',	'BS',	'Brescia'),
(843,	'IT',	'BR',	'Brindisi'),
(844,	'IT',	'CA',	'Cagliari'),
(845,	'IT',	'CL',	'Caltanissetta'),
(846,	'IT',	'CB',	'Campobasso'),
(847,	'IT',	'CI',	'Carbonia Iglesias'),
(848,	'IT',	'CE',	'Caserta'),
(849,	'IT',	'CT',	'Catania'),
(850,	'IT',	'CZ',	'Catanzaro'),
(851,	'IT',	'CH',	'Chieti'),
(852,	'IT',	'CO',	'Como'),
(853,	'IT',	'CS',	'Cosenza'),
(854,	'IT',	'CR',	'Cremona'),
(855,	'IT',	'KR',	'Crotone'),
(856,	'IT',	'CN',	'Cuneo'),
(857,	'IT',	'EN',	'Enna'),
(858,	'IT',	'FM',	'Fermo'),
(859,	'IT',	'FE',	'Ferrara'),
(860,	'IT',	'FI',	'Firenze'),
(861,	'IT',	'FG',	'Foggia'),
(862,	'IT',	'FC',	'Forli-Cesena'),
(863,	'IT',	'FR',	'Frosinone'),
(864,	'IT',	'GE',	'Genova'),
(865,	'IT',	'GO',	'Gorizia'),
(866,	'IT',	'GR',	'Grosseto'),
(867,	'IT',	'IM',	'Imperia'),
(868,	'IT',	'IS',	'Isernia'),
(869,	'IT',	'SP',	'La-Spezia'),
(870,	'IT',	'LT',	'Latina'),
(871,	'IT',	'LE',	'Lecce'),
(872,	'IT',	'LC',	'Lecco'),
(873,	'IT',	'LI',	'Livorno'),
(874,	'IT',	'LO',	'Lodi'),
(875,	'IT',	'LU',	'Lucca'),
(876,	'IT',	'MC',	'Macerata'),
(877,	'IT',	'MN',	'Mantova'),
(878,	'IT',	'MS',	'Massa-Carrara'),
(879,	'IT',	'MT',	'Matera'),
(880,	'IT',	'VS',	'Medio Campidano'),
(881,	'IT',	'ME',	'Messina'),
(882,	'IT',	'MI',	'Milano'),
(883,	'IT',	'MO',	'Modena'),
(884,	'IT',	'MB',	'Monza-Brianza'),
(885,	'IT',	'NA',	'Napoli'),
(886,	'IT',	'NO',	'Novara'),
(887,	'IT',	'NU',	'Nuoro'),
(888,	'IT',	'OG',	'Ogliastra'),
(889,	'IT',	'OT',	'Olbia Tempio'),
(890,	'IT',	'OR',	'Oristano'),
(891,	'IT',	'PD',	'Padova'),
(892,	'IT',	'PA',	'Palermo'),
(893,	'IT',	'PR',	'Parma'),
(894,	'IT',	'PV',	'Pavia'),
(895,	'IT',	'PG',	'Perugia'),
(896,	'IT',	'PU',	'Pesaro-Urbino'),
(897,	'IT',	'PE',	'Pescara'),
(898,	'IT',	'PC',	'Piacenza'),
(899,	'IT',	'PI',	'Pisa'),
(900,	'IT',	'PT',	'Pistoia'),
(901,	'IT',	'PN',	'Pordenone'),
(902,	'IT',	'PZ',	'Potenza'),
(903,	'IT',	'PO',	'Prato'),
(904,	'IT',	'RG',	'Ragusa'),
(905,	'IT',	'RA',	'Ravenna'),
(906,	'IT',	'RC',	'Reggio-Calabria'),
(907,	'IT',	'RE',	'Reggio-Emilia'),
(908,	'IT',	'RI',	'Rieti'),
(909,	'IT',	'RN',	'Rimini'),
(910,	'IT',	'RM',	'Roma'),
(911,	'IT',	'RO',	'Rovigo'),
(912,	'IT',	'SA',	'Salerno'),
(913,	'IT',	'SS',	'Sassari'),
(914,	'IT',	'SV',	'Savona'),
(915,	'IT',	'SI',	'Siena'),
(916,	'IT',	'SR',	'Siracusa'),
(917,	'IT',	'SO',	'Sondrio'),
(918,	'IT',	'TA',	'Taranto'),
(919,	'IT',	'TE',	'Teramo'),
(920,	'IT',	'TR',	'Terni'),
(921,	'IT',	'TO',	'Torino'),
(922,	'IT',	'TP',	'Trapani'),
(923,	'IT',	'TN',	'Trento'),
(924,	'IT',	'TV',	'Treviso'),
(925,	'IT',	'TS',	'Trieste'),
(926,	'IT',	'UD',	'Udine'),
(927,	'IT',	'VA',	'Varese'),
(928,	'IT',	'VE',	'Venezia'),
(929,	'IT',	'VB',	'Verbania'),
(930,	'IT',	'VC',	'Vercelli'),
(931,	'IT',	'VR',	'Verona'),
(932,	'IT',	'VV',	'Vibo-Valentia'),
(933,	'IT',	'VI',	'Vicenza'),
(934,	'IT',	'VT',	'Viterbo'),
(935,	'MX',	'AGU',	'Aguascalientes'),
(936,	'MX',	'BCN',	'Baja California'),
(937,	'MX',	'BCS',	'Baja California Sur'),
(938,	'MX',	'CAM',	'Campeche'),
(939,	'MX',	'CHP',	'Chiapas'),
(940,	'MX',	'CHH',	'Chihuahua'),
(941,	'MX',	'CMX',	'Ciudad de México'),
(942,	'MX',	'COA',	'Coahuila'),
(943,	'MX',	'COL',	'Colima'),
(944,	'MX',	'DUR',	'Durango'),
(945,	'MX',	'MEX',	'Estado de México'),
(946,	'MX',	'GUA',	'Guanajuato'),
(947,	'MX',	'GRO',	'Guerrero'),
(948,	'MX',	'HID',	'Hidalgo'),
(949,	'MX',	'JAL',	'Jalisco'),
(950,	'MX',	'MIC',	'Michoacán'),
(951,	'MX',	'MOR',	'Morelos'),
(952,	'MX',	'NAY',	'Nayarit'),
(953,	'MX',	'NLE',	'Nuevo León'),
(954,	'MX',	'OAX',	'Oaxaca'),
(955,	'MX',	'PUE',	'Puebla'),
(956,	'MX',	'QUE',	'Querétaro'),
(957,	'MX',	'ROO',	'Quintana Roo'),
(958,	'MX',	'SLP',	'San Luis Potosí'),
(959,	'MX',	'SIN',	'Sinaloa'),
(960,	'MX',	'SON',	'Sonora'),
(961,	'MX',	'TAB',	'Tabasco'),
(962,	'MX',	'TAM',	'Tamaulipas'),
(963,	'MX',	'TLA',	'Tlaxcala'),
(964,	'MX',	'VER',	'Veracruz'),
(965,	'MX',	'YUC',	'Yucatán'),
(966,	'MX',	'ZAC',	'Zacatecas'),
(967,	'PY',	'PY-ASU',	'Asunción'),
(968,	'PY',	'PY-16',	'Alto Paraguay'),
(969,	'PY',	'PY-10',	'Alto Paraná'),
(970,	'PY',	'PY-13',	'Amambay'),
(971,	'PY',	'PY-19',	'Boquerón'),
(972,	'PY',	'PY-5',	'Caaguazú'),
(973,	'PY',	'PY-6',	'Caazapá'),
(974,	'PY',	'PY-14',	'Canindeyú'),
(975,	'PY',	'PY-11',	'Central'),
(976,	'PY',	'PY-1',	'Concepción'),
(977,	'PY',	'PY-3',	'Cordillera'),
(978,	'PY',	'PY-4',	'Guairá'),
(979,	'PY',	'PY-7',	'Itapúa'),
(980,	'PY',	'PY-8',	'Misiones'),
(981,	'PY',	'PY-12',	'Ñeembucú'),
(982,	'PY',	'PY-9',	'Paraguarí'),
(983,	'PY',	'PY-15',	'Presidente Hayes'),
(984,	'PY',	'PY-2',	'San Pedro'),
(985,	'PE',	'PE-LMA',	'Municipalidad Metropolitana de Lima'),
(986,	'PE',	'PE-AMA',	'Amazonas'),
(987,	'PE',	'PE-ANC',	'Ancash'),
(988,	'PE',	'PE-APU',	'Apurímac'),
(989,	'PE',	'PE-ARE',	'Arequipa'),
(990,	'PE',	'PE-AYA',	'Ayacucho'),
(991,	'PE',	'PE-CAJ',	'Cajamarca'),
(992,	'PE',	'PE-CUS',	'Cusco'),
(993,	'PE',	'PE-CAL',	'El Callao'),
(994,	'PE',	'PE-HUV',	'Huancavelica'),
(995,	'PE',	'PE-HUC',	'Huánuco'),
(996,	'PE',	'PE-ICA',	'Ica'),
(997,	'PE',	'PE-JUN',	'Junín'),
(998,	'PE',	'PE-LAL',	'La Libertad'),
(999,	'PE',	'PE-LAM',	'Lambayeque'),
(1000,	'PE',	'PE-LIM',	'Lima'),
(1001,	'PE',	'PE-LOR',	'Loreto'),
(1002,	'PE',	'PE-MDD',	'Madre de Dios'),
(1003,	'PE',	'PE-MOQ',	'Moquegua'),
(1004,	'PE',	'PE-PAS',	'Pasco'),
(1005,	'PE',	'PE-PIU',	'Piura'),
(1006,	'PE',	'PE-PUN',	'Puno'),
(1007,	'PE',	'PE-SAM',	'San Martín'),
(1008,	'PE',	'PE-TAC',	'Tacna'),
(1009,	'PE',	'PE-TUM',	'Tumbes'),
(1010,	'PE',	'PE-UCA',	'Ucayali'),
(1011,	'PL',	'PL-02',	'dolnośląskie'),
(1012,	'PL',	'PL-04',	'kujawsko-pomorskie'),
(1013,	'PL',	'PL-06',	'lubelskie'),
(1014,	'PL',	'PL-08',	'lubuskie'),
(1015,	'PL',	'PL-10',	'łódzkie'),
(1016,	'PL',	'PL-12',	'małopolskie'),
(1017,	'PL',	'PL-14',	'mazowieckie'),
(1018,	'PL',	'PL-16',	'opolskie'),
(1019,	'PL',	'PL-18',	'podkarpackie'),
(1020,	'PL',	'PL-20',	'podlaskie'),
(1021,	'PL',	'PL-22',	'pomorskie'),
(1022,	'PL',	'PL-24',	'śląskie'),
(1023,	'PL',	'PL-26',	'świętokrzyskie'),
(1024,	'PL',	'PL-28',	'warmińsko-mazurskie'),
(1025,	'PL',	'PL-30',	'wielkopolskie'),
(1026,	'PL',	'PL-32',	'zachodniopomorskie'),
(1027,	'PT',	'PT-01',	'Aveiro'),
(1028,	'PT',	'PT-02',	'Beja'),
(1029,	'PT',	'PT-03',	'Braga'),
(1030,	'PT',	'PT-04',	'Bragança'),
(1031,	'PT',	'PT-05',	'Castelo Branco'),
(1032,	'PT',	'PT-06',	'Coimbra'),
(1033,	'PT',	'PT-07',	'Évora'),
(1034,	'PT',	'PT-08',	'Faro'),
(1035,	'PT',	'PT-09',	'Guarda'),
(1036,	'PT',	'PT-10',	'Leiria'),
(1037,	'PT',	'PT-11',	'Lisboa'),
(1038,	'PT',	'PT-12',	'Portalegre'),
(1039,	'PT',	'PT-13',	'Porto'),
(1040,	'PT',	'PT-14',	'Santarém'),
(1041,	'PT',	'PT-15',	'Setúbal'),
(1042,	'PT',	'PT-16',	'Viana do Castelo'),
(1043,	'PT',	'PT-17',	'Vila Real'),
(1044,	'PT',	'PT-18',	'Viseu'),
(1045,	'PT',	'PT-20',	'Região Autónoma dos Açores'),
(1046,	'PT',	'PT-30',	'Região Autónoma da Madeira'),
(1047,	'SR',	'SR-BR',	'Brokopondo'),
(1048,	'SR',	'SR-CM',	'Commewijne'),
(1049,	'SR',	'SR-CR',	'Coronie'),
(1050,	'SR',	'SR-MA',	'Marowijne'),
(1051,	'SR',	'SR-NI',	'Nickerie'),
(1052,	'SR',	'SR-PR',	'Para'),
(1053,	'SR',	'SR-PM',	'Paramaribo'),
(1054,	'SR',	'SR-SA',	'Saramacca'),
(1055,	'SR',	'SR-SI',	'Sipaliwini'),
(1056,	'SR',	'SR-WA',	'Wanica'),
(1057,	'SE',	'SE-K',	'Blekinge län'),
(1058,	'SE',	'SE-W',	'Dalarnas län'),
(1059,	'SE',	'SE-I',	'Gotlands län'),
(1060,	'SE',	'SE-X',	'Gävleborgs län'),
(1061,	'SE',	'SE-N',	'Hallands län'),
(1062,	'SE',	'SE-Z',	'Jämtlands län'),
(1063,	'SE',	'SE-F',	'Jönköpings län'),
(1064,	'SE',	'SE-H',	'Kalmar län'),
(1065,	'SE',	'SE-G',	'Kronobergs län'),
(1066,	'SE',	'SE-BD',	'Norrbottens län'),
(1067,	'SE',	'SE-M',	'Skåne län'),
(1068,	'SE',	'SE-AB',	'Stockholms län'),
(1069,	'SE',	'SE-D',	'Södermanlands län'),
(1070,	'SE',	'SE-C',	'Uppsala län'),
(1071,	'SE',	'SE-S',	'Värmlands län'),
(1072,	'SE',	'SE-AC',	'Västerbottens län'),
(1073,	'SE',	'SE-Y',	'Västernorrlands län'),
(1074,	'SE',	'SE-U',	'Västmanlands län'),
(1075,	'SE',	'SE-O',	'Västra Götalands län'),
(1076,	'SE',	'SE-T',	'Örebro län'),
(1077,	'SE',	'SE-E',	'Östergötlands län'),
(1078,	'UY',	'UY-AR',	'Artigas'),
(1079,	'UY',	'UY-CA',	'Canelones'),
(1080,	'UY',	'UY-CL',	'Cerro Largo'),
(1081,	'UY',	'UY-CO',	'Colonia'),
(1082,	'UY',	'UY-DU',	'Durazno'),
(1083,	'UY',	'UY-FS',	'Flores'),
(1084,	'UY',	'UY-FD',	'Florida'),
(1085,	'UY',	'UY-LA',	'Lavalleja'),
(1086,	'UY',	'UY-MA',	'Maldonado'),
(1087,	'UY',	'UY-MO',	'Montevideo'),
(1088,	'UY',	'UY-PA',	'Paysandu'),
(1089,	'UY',	'UY-RN',	'Río Negro'),
(1090,	'UY',	'UY-RV',	'Rivera'),
(1091,	'UY',	'UY-RO',	'Rocha'),
(1092,	'UY',	'UY-SA',	'Salto'),
(1093,	'UY',	'UY-SJ',	'San José'),
(1094,	'UY',	'UY-SO',	'Soriano'),
(1095,	'UY',	'UY-TA',	'Tacuarembó'),
(1096,	'UY',	'UY-TT',	'Treinta y Tres'),
(1097,	'VE',	'VE-W',	'Dependencias Federales'),
(1098,	'VE',	'VE-A',	'Distrito Capital'),
(1099,	'VE',	'VE-Z',	'Amazonas'),
(1100,	'VE',	'VE-B',	'Anzoátegui'),
(1101,	'VE',	'VE-C',	'Apure'),
(1102,	'VE',	'VE-D',	'Aragua'),
(1103,	'VE',	'VE-E',	'Barinas'),
(1104,	'VE',	'VE-F',	'Bolívar'),
(1105,	'VE',	'VE-G',	'Carabobo'),
(1106,	'VE',	'VE-H',	'Cojedes'),
(1107,	'VE',	'VE-Y',	'Delta Amacuro'),
(1108,	'VE',	'VE-I',	'Falcón'),
(1109,	'VE',	'VE-J',	'Guárico'),
(1110,	'VE',	'VE-K',	'Lara'),
(1111,	'VE',	'VE-L',	'Mérida'),
(1112,	'VE',	'VE-M',	'Miranda'),
(1113,	'VE',	'VE-N',	'Monagas'),
(1114,	'VE',	'VE-O',	'Nueva Esparta'),
(1115,	'VE',	'VE-P',	'Portuguesa'),
(1116,	'VE',	'VE-R',	'Sucre'),
(1117,	'VE',	'VE-S',	'Táchira'),
(1118,	'VE',	'VE-T',	'Trujillo'),
(1119,	'VE',	'VE-X',	'Vargas'),
(1120,	'VE',	'VE-U',	'Yaracuy'),
(1121,	'VE',	'VE-V',	'Zulia');

DROP TABLE IF EXISTS `directory_country_region_name`;
CREATE TABLE `directory_country_region_name` (
  `locale` varchar(16) NOT NULL COMMENT 'Locale',
  `region_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Region ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `DIR_COUNTRY_REGION_NAME_REGION_ID_DIR_COUNTRY_REGION_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Country Region Name';

INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES
('en_US',	1,	'Alabama'),
('en_US',	2,	'Alaska'),
('en_US',	3,	'American Samoa'),
('en_US',	4,	'Arizona'),
('en_US',	5,	'Arkansas'),
('en_US',	6,	'Armed Forces Africa'),
('en_US',	7,	'Armed Forces Americas'),
('en_US',	8,	'Armed Forces Canada'),
('en_US',	9,	'Armed Forces Europe'),
('en_US',	10,	'Armed Forces Middle East'),
('en_US',	11,	'Armed Forces Pacific'),
('en_US',	12,	'California'),
('en_US',	13,	'Colorado'),
('en_US',	14,	'Connecticut'),
('en_US',	15,	'Delaware'),
('en_US',	16,	'District of Columbia'),
('en_US',	17,	'Federated States Of Micronesia'),
('en_US',	18,	'Florida'),
('en_US',	19,	'Georgia'),
('en_US',	20,	'Guam'),
('en_US',	21,	'Hawaii'),
('en_US',	22,	'Idaho'),
('en_US',	23,	'Illinois'),
('en_US',	24,	'Indiana'),
('en_US',	25,	'Iowa'),
('en_US',	26,	'Kansas'),
('en_US',	27,	'Kentucky'),
('en_US',	28,	'Louisiana'),
('en_US',	29,	'Maine'),
('en_US',	30,	'Marshall Islands'),
('en_US',	31,	'Maryland'),
('en_US',	32,	'Massachusetts'),
('en_US',	33,	'Michigan'),
('en_US',	34,	'Minnesota'),
('en_US',	35,	'Mississippi'),
('en_US',	36,	'Missouri'),
('en_US',	37,	'Montana'),
('en_US',	38,	'Nebraska'),
('en_US',	39,	'Nevada'),
('en_US',	40,	'New Hampshire'),
('en_US',	41,	'New Jersey'),
('en_US',	42,	'New Mexico'),
('en_US',	43,	'New York'),
('en_US',	44,	'North Carolina'),
('en_US',	45,	'North Dakota'),
('en_US',	46,	'Northern Mariana Islands'),
('en_US',	47,	'Ohio'),
('en_US',	48,	'Oklahoma'),
('en_US',	49,	'Oregon'),
('en_US',	50,	'Palau'),
('en_US',	51,	'Pennsylvania'),
('en_US',	52,	'Puerto Rico'),
('en_US',	53,	'Rhode Island'),
('en_US',	54,	'South Carolina'),
('en_US',	55,	'South Dakota'),
('en_US',	56,	'Tennessee'),
('en_US',	57,	'Texas'),
('en_US',	58,	'Utah'),
('en_US',	59,	'Vermont'),
('en_US',	60,	'Virgin Islands'),
('en_US',	61,	'Virginia'),
('en_US',	62,	'Washington'),
('en_US',	63,	'West Virginia'),
('en_US',	64,	'Wisconsin'),
('en_US',	65,	'Wyoming'),
('en_US',	66,	'Alberta'),
('en_US',	67,	'British Columbia'),
('en_US',	68,	'Manitoba'),
('en_US',	69,	'Newfoundland and Labrador'),
('en_US',	70,	'New Brunswick'),
('en_US',	71,	'Nova Scotia'),
('en_US',	72,	'Northwest Territories'),
('en_US',	73,	'Nunavut'),
('en_US',	74,	'Ontario'),
('en_US',	75,	'Prince Edward Island'),
('en_US',	76,	'Quebec'),
('en_US',	77,	'Saskatchewan'),
('en_US',	78,	'Yukon Territory'),
('en_US',	79,	'Niedersachsen'),
('en_US',	80,	'Baden-Württemberg'),
('en_US',	81,	'Bayern'),
('en_US',	82,	'Berlin'),
('en_US',	83,	'Brandenburg'),
('en_US',	84,	'Bremen'),
('en_US',	85,	'Hamburg'),
('en_US',	86,	'Hessen'),
('en_US',	87,	'Mecklenburg-Vorpommern'),
('en_US',	88,	'Nordrhein-Westfalen'),
('en_US',	89,	'Rheinland-Pfalz'),
('en_US',	90,	'Saarland'),
('en_US',	91,	'Sachsen'),
('en_US',	92,	'Sachsen-Anhalt'),
('en_US',	93,	'Schleswig-Holstein'),
('en_US',	94,	'Thüringen'),
('en_US',	95,	'Wien'),
('en_US',	96,	'Niederösterreich'),
('en_US',	97,	'Oberösterreich'),
('en_US',	98,	'Salzburg'),
('en_US',	99,	'Kärnten'),
('en_US',	100,	'Steiermark'),
('en_US',	101,	'Tirol'),
('en_US',	102,	'Burgenland'),
('en_US',	103,	'Vorarlberg'),
('en_US',	104,	'Aargau'),
('en_US',	105,	'Appenzell Innerrhoden'),
('en_US',	106,	'Appenzell Ausserrhoden'),
('en_US',	107,	'Bern'),
('en_US',	108,	'Basel-Landschaft'),
('en_US',	109,	'Basel-Stadt'),
('en_US',	110,	'Friburg'),
('en_US',	111,	'Geneva'),
('en_US',	112,	'Glarus'),
('en_US',	113,	'Graubünden'),
('en_US',	114,	'Jura'),
('en_US',	115,	'Lucerne'),
('en_US',	116,	'Neuchâtel'),
('en_US',	117,	'Nidwalden'),
('en_US',	118,	'Obwalden'),
('en_US',	119,	'St. Gallen'),
('en_US',	120,	'Schaffhausen'),
('en_US',	121,	'Solothurn'),
('en_US',	122,	'Schwyz'),
('en_US',	123,	'Thurgau'),
('en_US',	124,	'Ticino'),
('en_US',	125,	'Uri'),
('en_US',	126,	'Vaud'),
('en_US',	127,	'Wallis'),
('en_US',	128,	'Zug'),
('en_US',	129,	'Zürich'),
('en_US',	130,	'A Coruña'),
('en_US',	131,	'Alava'),
('en_US',	132,	'Albacete'),
('en_US',	133,	'Alicante'),
('en_US',	134,	'Almeria'),
('en_US',	135,	'Asturias'),
('en_US',	136,	'Avila'),
('en_US',	137,	'Badajoz'),
('en_US',	138,	'Baleares'),
('en_US',	139,	'Barcelona'),
('en_US',	140,	'Burgos'),
('en_US',	141,	'Caceres'),
('en_US',	142,	'Cadiz'),
('en_US',	143,	'Cantabria'),
('en_US',	144,	'Castellon'),
('en_US',	145,	'Ceuta'),
('en_US',	146,	'Ciudad Real'),
('en_US',	147,	'Cordoba'),
('en_US',	148,	'Cuenca'),
('en_US',	149,	'Girona'),
('en_US',	150,	'Granada'),
('en_US',	151,	'Guadalajara'),
('en_US',	152,	'Guipuzcoa'),
('en_US',	153,	'Huelva'),
('en_US',	154,	'Huesca'),
('en_US',	155,	'Jaen'),
('en_US',	156,	'La Rioja'),
('en_US',	157,	'Las Palmas'),
('en_US',	158,	'Leon'),
('en_US',	159,	'Lleida'),
('en_US',	160,	'Lugo'),
('en_US',	161,	'Madrid'),
('en_US',	162,	'Malaga'),
('en_US',	163,	'Melilla'),
('en_US',	164,	'Murcia'),
('en_US',	165,	'Navarra'),
('en_US',	166,	'Ourense'),
('en_US',	167,	'Palencia'),
('en_US',	168,	'Pontevedra'),
('en_US',	169,	'Salamanca'),
('en_US',	170,	'Santa Cruz de Tenerife'),
('en_US',	171,	'Segovia'),
('en_US',	172,	'Sevilla'),
('en_US',	173,	'Soria'),
('en_US',	174,	'Tarragona'),
('en_US',	175,	'Teruel'),
('en_US',	176,	'Toledo'),
('en_US',	177,	'Valencia'),
('en_US',	178,	'Valladolid'),
('en_US',	179,	'Vizcaya'),
('en_US',	180,	'Zamora'),
('en_US',	181,	'Zaragoza'),
('en_US',	182,	'Ain'),
('en_US',	183,	'Aisne'),
('en_US',	184,	'Allier'),
('en_US',	185,	'Alpes-de-Haute-Provence'),
('en_US',	186,	'Hautes-Alpes'),
('en_US',	187,	'Alpes-Maritimes'),
('en_US',	188,	'Ardèche'),
('en_US',	189,	'Ardennes'),
('en_US',	190,	'Ariège'),
('en_US',	191,	'Aube'),
('en_US',	192,	'Aude'),
('en_US',	193,	'Aveyron'),
('en_US',	194,	'Bouches-du-Rhône'),
('en_US',	195,	'Calvados'),
('en_US',	196,	'Cantal'),
('en_US',	197,	'Charente'),
('en_US',	198,	'Charente-Maritime'),
('en_US',	199,	'Cher'),
('en_US',	200,	'Corrèze'),
('en_US',	201,	'Corse-du-Sud'),
('en_US',	202,	'Haute-Corse'),
('en_US',	203,	'Côte-d\'Or'),
('en_US',	204,	'Côtes-d\'Armor'),
('en_US',	205,	'Creuse'),
('en_US',	206,	'Dordogne'),
('en_US',	207,	'Doubs'),
('en_US',	208,	'Drôme'),
('en_US',	209,	'Eure'),
('en_US',	210,	'Eure-et-Loir'),
('en_US',	211,	'Finistère'),
('en_US',	212,	'Gard'),
('en_US',	213,	'Haute-Garonne'),
('en_US',	214,	'Gers'),
('en_US',	215,	'Gironde'),
('en_US',	216,	'Hérault'),
('en_US',	217,	'Ille-et-Vilaine'),
('en_US',	218,	'Indre'),
('en_US',	219,	'Indre-et-Loire'),
('en_US',	220,	'Isère'),
('en_US',	221,	'Jura'),
('en_US',	222,	'Landes'),
('en_US',	223,	'Loir-et-Cher'),
('en_US',	224,	'Loire'),
('en_US',	225,	'Haute-Loire'),
('en_US',	226,	'Loire-Atlantique'),
('en_US',	227,	'Loiret'),
('en_US',	228,	'Lot'),
('en_US',	229,	'Lot-et-Garonne'),
('en_US',	230,	'Lozère'),
('en_US',	231,	'Maine-et-Loire'),
('en_US',	232,	'Manche'),
('en_US',	233,	'Marne'),
('en_US',	234,	'Haute-Marne'),
('en_US',	235,	'Mayenne'),
('en_US',	236,	'Meurthe-et-Moselle'),
('en_US',	237,	'Meuse'),
('en_US',	238,	'Morbihan'),
('en_US',	239,	'Moselle'),
('en_US',	240,	'Nièvre'),
('en_US',	241,	'Nord'),
('en_US',	242,	'Oise'),
('en_US',	243,	'Orne'),
('en_US',	244,	'Pas-de-Calais'),
('en_US',	245,	'Puy-de-Dôme'),
('en_US',	246,	'Pyrénées-Atlantiques'),
('en_US',	247,	'Hautes-Pyrénées'),
('en_US',	248,	'Pyrénées-Orientales'),
('en_US',	249,	'Bas-Rhin'),
('en_US',	250,	'Haut-Rhin'),
('en_US',	251,	'Rhône'),
('en_US',	252,	'Haute-Saône'),
('en_US',	253,	'Saône-et-Loire'),
('en_US',	254,	'Sarthe'),
('en_US',	255,	'Savoie'),
('en_US',	256,	'Haute-Savoie'),
('en_US',	257,	'Paris'),
('en_US',	258,	'Seine-Maritime'),
('en_US',	259,	'Seine-et-Marne'),
('en_US',	260,	'Yvelines'),
('en_US',	261,	'Deux-Sèvres'),
('en_US',	262,	'Somme'),
('en_US',	263,	'Tarn'),
('en_US',	264,	'Tarn-et-Garonne'),
('en_US',	265,	'Var'),
('en_US',	266,	'Vaucluse'),
('en_US',	267,	'Vendée'),
('en_US',	268,	'Vienne'),
('en_US',	269,	'Haute-Vienne'),
('en_US',	270,	'Vosges'),
('en_US',	271,	'Yonne'),
('en_US',	272,	'Territoire-de-Belfort'),
('en_US',	273,	'Essonne'),
('en_US',	274,	'Hauts-de-Seine'),
('en_US',	275,	'Seine-Saint-Denis'),
('en_US',	276,	'Val-de-Marne'),
('en_US',	277,	'Val-d\'Oise'),
('en_US',	278,	'Alba'),
('en_US',	279,	'Arad'),
('en_US',	280,	'Argeş'),
('en_US',	281,	'Bacău'),
('en_US',	282,	'Bihor'),
('en_US',	283,	'Bistriţa-Năsăud'),
('en_US',	284,	'Botoşani'),
('en_US',	285,	'Braşov'),
('en_US',	286,	'Brăila'),
('en_US',	287,	'Bucureşti'),
('en_US',	288,	'Buzău'),
('en_US',	289,	'Caraş-Severin'),
('en_US',	290,	'Călăraşi'),
('en_US',	291,	'Cluj'),
('en_US',	292,	'Constanţa'),
('en_US',	293,	'Covasna'),
('en_US',	294,	'Dâmboviţa'),
('en_US',	295,	'Dolj'),
('en_US',	296,	'Galaţi'),
('en_US',	297,	'Giurgiu'),
('en_US',	298,	'Gorj'),
('en_US',	299,	'Harghita'),
('en_US',	300,	'Hunedoara'),
('en_US',	301,	'Ialomiţa'),
('en_US',	302,	'Iaşi'),
('en_US',	303,	'Ilfov'),
('en_US',	304,	'Maramureş'),
('en_US',	305,	'Mehedinţi'),
('en_US',	306,	'Mureş'),
('en_US',	307,	'Neamţ'),
('en_US',	308,	'Olt'),
('en_US',	309,	'Prahova'),
('en_US',	310,	'Satu-Mare'),
('en_US',	311,	'Sălaj'),
('en_US',	312,	'Sibiu'),
('en_US',	313,	'Suceava'),
('en_US',	314,	'Teleorman'),
('en_US',	315,	'Timiş'),
('en_US',	316,	'Tulcea'),
('en_US',	317,	'Vaslui'),
('en_US',	318,	'Vâlcea'),
('en_US',	319,	'Vrancea'),
('en_US',	320,	'Lappi'),
('en_US',	321,	'Pohjois-Pohjanmaa'),
('en_US',	322,	'Kainuu'),
('en_US',	323,	'Pohjois-Karjala'),
('en_US',	324,	'Pohjois-Savo'),
('en_US',	325,	'Etelä-Savo'),
('en_US',	326,	'Etelä-Pohjanmaa'),
('en_US',	327,	'Pohjanmaa'),
('en_US',	328,	'Pirkanmaa'),
('en_US',	329,	'Satakunta'),
('en_US',	330,	'Keski-Pohjanmaa'),
('en_US',	331,	'Keski-Suomi'),
('en_US',	332,	'Varsinais-Suomi'),
('en_US',	333,	'Etelä-Karjala'),
('en_US',	334,	'Päijät-Häme'),
('en_US',	335,	'Kanta-Häme'),
('en_US',	336,	'Uusimaa'),
('en_US',	337,	'Itä-Uusimaa'),
('en_US',	338,	'Kymenlaakso'),
('en_US',	339,	'Ahvenanmaa'),
('en_US',	340,	'Harjumaa'),
('en_US',	341,	'Hiiumaa'),
('en_US',	342,	'Ida-Virumaa'),
('en_US',	343,	'Jõgevamaa'),
('en_US',	344,	'Järvamaa'),
('en_US',	345,	'Läänemaa'),
('en_US',	346,	'Lääne-Virumaa'),
('en_US',	347,	'Põlvamaa'),
('en_US',	348,	'Pärnumaa'),
('en_US',	349,	'Raplamaa'),
('en_US',	350,	'Saaremaa'),
('en_US',	351,	'Tartumaa'),
('en_US',	352,	'Valgamaa'),
('en_US',	353,	'Viljandimaa'),
('en_US',	354,	'Võrumaa'),
('en_US',	355,	'Daugavpils'),
('en_US',	356,	'Jelgava'),
('en_US',	357,	'Jēkabpils'),
('en_US',	358,	'Jūrmala'),
('en_US',	359,	'Liepāja'),
('en_US',	360,	'Liepājas novads'),
('en_US',	361,	'Rēzekne'),
('en_US',	362,	'Rīga'),
('en_US',	363,	'Rīgas novads'),
('en_US',	364,	'Valmiera'),
('en_US',	365,	'Ventspils'),
('en_US',	366,	'Aglonas novads'),
('en_US',	367,	'Aizkraukles novads'),
('en_US',	368,	'Aizputes novads'),
('en_US',	369,	'Aknīstes novads'),
('en_US',	370,	'Alojas novads'),
('en_US',	371,	'Alsungas novads'),
('en_US',	372,	'Alūksnes novads'),
('en_US',	373,	'Amatas novads'),
('en_US',	374,	'Apes novads'),
('en_US',	375,	'Auces novads'),
('en_US',	376,	'Babītes novads'),
('en_US',	377,	'Baldones novads'),
('en_US',	378,	'Baltinavas novads'),
('en_US',	379,	'Balvu novads'),
('en_US',	380,	'Bauskas novads'),
('en_US',	381,	'Beverīnas novads'),
('en_US',	382,	'Brocēnu novads'),
('en_US',	383,	'Burtnieku novads'),
('en_US',	384,	'Carnikavas novads'),
('en_US',	385,	'Cesvaines novads'),
('en_US',	386,	'Ciblas novads'),
('en_US',	387,	'Cēsu novads'),
('en_US',	388,	'Dagdas novads'),
('en_US',	389,	'Daugavpils novads'),
('en_US',	390,	'Dobeles novads'),
('en_US',	391,	'Dundagas novads'),
('en_US',	392,	'Durbes novads'),
('en_US',	393,	'Engures novads'),
('en_US',	394,	'Garkalnes novads'),
('en_US',	395,	'Grobiņas novads'),
('en_US',	396,	'Gulbenes novads'),
('en_US',	397,	'Iecavas novads'),
('en_US',	398,	'Ikšķiles novads'),
('en_US',	399,	'Ilūkstes novads'),
('en_US',	400,	'Inčukalna novads'),
('en_US',	401,	'Jaunjelgavas novads'),
('en_US',	402,	'Jaunpiebalgas novads'),
('en_US',	403,	'Jaunpils novads'),
('en_US',	404,	'Jelgavas novads'),
('en_US',	405,	'Jēkabpils novads'),
('en_US',	406,	'Kandavas novads'),
('en_US',	407,	'Kokneses novads'),
('en_US',	408,	'Krimuldas novads'),
('en_US',	409,	'Krustpils novads'),
('en_US',	410,	'Krāslavas novads'),
('en_US',	411,	'Kuldīgas novads'),
('en_US',	412,	'Kārsavas novads'),
('en_US',	413,	'Lielvārdes novads'),
('en_US',	414,	'Limbažu novads'),
('en_US',	415,	'Lubānas novads'),
('en_US',	416,	'Ludzas novads'),
('en_US',	417,	'Līgatnes novads'),
('en_US',	418,	'Līvānu novads'),
('en_US',	419,	'Madonas novads'),
('en_US',	420,	'Mazsalacas novads'),
('en_US',	421,	'Mālpils novads'),
('en_US',	422,	'Mārupes novads'),
('en_US',	423,	'Naukšēnu novads'),
('en_US',	424,	'Neretas novads'),
('en_US',	425,	'Nīcas novads'),
('en_US',	426,	'Ogres novads'),
('en_US',	427,	'Olaines novads'),
('en_US',	428,	'Ozolnieku novads'),
('en_US',	429,	'Preiļu novads'),
('en_US',	430,	'Priekules novads'),
('en_US',	431,	'Priekuļu novads'),
('en_US',	432,	'Pārgaujas novads'),
('en_US',	433,	'Pāvilostas novads'),
('en_US',	434,	'Pļaviņu novads'),
('en_US',	435,	'Raunas novads'),
('en_US',	436,	'Riebiņu novads'),
('en_US',	437,	'Rojas novads'),
('en_US',	438,	'Ropažu novads'),
('en_US',	439,	'Rucavas novads'),
('en_US',	440,	'Rugāju novads'),
('en_US',	441,	'Rundāles novads'),
('en_US',	442,	'Rēzeknes novads'),
('en_US',	443,	'Rūjienas novads'),
('en_US',	444,	'Salacgrīvas novads'),
('en_US',	445,	'Salas novads'),
('en_US',	446,	'Salaspils novads'),
('en_US',	447,	'Saldus novads'),
('en_US',	448,	'Saulkrastu novads'),
('en_US',	449,	'Siguldas novads'),
('en_US',	450,	'Skrundas novads'),
('en_US',	451,	'Skrīveru novads'),
('en_US',	452,	'Smiltenes novads'),
('en_US',	453,	'Stopiņu novads'),
('en_US',	454,	'Strenču novads'),
('en_US',	455,	'Sējas novads'),
('en_US',	456,	'Talsu novads'),
('en_US',	457,	'Tukuma novads'),
('en_US',	458,	'Tērvetes novads'),
('en_US',	459,	'Vaiņodes novads'),
('en_US',	460,	'Valkas novads'),
('en_US',	461,	'Valmieras novads'),
('en_US',	462,	'Varakļānu novads'),
('en_US',	463,	'Vecpiebalgas novads'),
('en_US',	464,	'Vecumnieku novads'),
('en_US',	465,	'Ventspils novads'),
('en_US',	466,	'Viesītes novads'),
('en_US',	467,	'Viļakas novads'),
('en_US',	468,	'Viļānu novads'),
('en_US',	469,	'Vārkavas novads'),
('en_US',	470,	'Zilupes novads'),
('en_US',	471,	'Ādažu novads'),
('en_US',	472,	'Ērgļu novads'),
('en_US',	473,	'Ķeguma novads'),
('en_US',	474,	'Ķekavas novads'),
('en_US',	475,	'Alytaus Apskritis'),
('en_US',	476,	'Kauno Apskritis'),
('en_US',	477,	'Klaipėdos Apskritis'),
('en_US',	478,	'Marijampolės Apskritis'),
('en_US',	479,	'Panevėžio Apskritis'),
('en_US',	480,	'Šiaulių Apskritis'),
('en_US',	481,	'Tauragės Apskritis'),
('en_US',	482,	'Telšių Apskritis'),
('en_US',	483,	'Utenos Apskritis'),
('en_US',	484,	'Vilniaus Apskritis'),
('en_US',	485,	'Acre'),
('en_US',	486,	'Alagoas'),
('en_US',	487,	'Amapá'),
('en_US',	488,	'Amazonas'),
('en_US',	489,	'Bahia'),
('en_US',	490,	'Ceará'),
('en_US',	491,	'Espírito Santo'),
('en_US',	492,	'Goiás'),
('en_US',	493,	'Maranhão'),
('en_US',	494,	'Mato Grosso'),
('en_US',	495,	'Mato Grosso do Sul'),
('en_US',	496,	'Minas Gerais'),
('en_US',	497,	'Pará'),
('en_US',	498,	'Paraíba'),
('en_US',	499,	'Paraná'),
('en_US',	500,	'Pernambuco'),
('en_US',	501,	'Piauí'),
('en_US',	502,	'Rio de Janeiro'),
('en_US',	503,	'Rio Grande do Norte'),
('en_US',	504,	'Rio Grande do Sul'),
('en_US',	505,	'Rondônia'),
('en_US',	506,	'Roraima'),
('en_US',	507,	'Santa Catarina'),
('en_US',	508,	'São Paulo'),
('en_US',	509,	'Sergipe'),
('en_US',	510,	'Tocantins'),
('en_US',	511,	'Distrito Federal'),
('en_US',	512,	'Berat'),
('en_US',	513,	'Dibër'),
('en_US',	514,	'Durrës'),
('en_US',	515,	'Elbasan'),
('en_US',	516,	'Fier'),
('en_US',	517,	'Gjirokastër'),
('en_US',	518,	'Korçë'),
('en_US',	519,	'Kukës'),
('en_US',	520,	'Lezhë'),
('en_US',	521,	'Shkodër'),
('en_US',	522,	'Tiranë'),
('en_US',	523,	'Vlorë'),
('en_US',	524,	'Ciudad Autónoma de Buenos Aires'),
('en_US',	525,	'Buenos Aires'),
('en_US',	526,	'Catamarca'),
('en_US',	527,	'Chaco'),
('en_US',	528,	'Chubut'),
('en_US',	529,	'Córdoba'),
('en_US',	530,	'Corrientes'),
('en_US',	531,	'Entre Ríos'),
('en_US',	532,	'Formosa'),
('en_US',	533,	'Jujuy'),
('en_US',	534,	'La Pampa'),
('en_US',	535,	'La Rioja'),
('en_US',	536,	'Mendoza'),
('en_US',	537,	'Misiones'),
('en_US',	538,	'Neuquén'),
('en_US',	539,	'Río Negro'),
('en_US',	540,	'Salta'),
('en_US',	541,	'San Juan'),
('en_US',	542,	'San Luis'),
('en_US',	543,	'Santa Cruz'),
('en_US',	544,	'Santa Fe'),
('en_US',	545,	'Santiago del Estero'),
('en_US',	546,	'Tierra del Fuego'),
('en_US',	547,	'Tucumán'),
('en_US',	548,	'Zagrebačka županija'),
('en_US',	549,	'Krapinsko-zagorska županija'),
('en_US',	550,	'Sisačko-moslavačka županija'),
('en_US',	551,	'Karlovačka županija'),
('en_US',	552,	'Varaždinska županija'),
('en_US',	553,	'Koprivničko-križevačka županija'),
('en_US',	554,	'Bjelovarsko-bilogorska županija'),
('en_US',	555,	'Primorsko-goranska županija'),
('en_US',	556,	'Ličko-senjska županija'),
('en_US',	557,	'Virovitičko-podravska županija'),
('en_US',	558,	'Požeško-slavonska županija'),
('en_US',	559,	'Brodsko-posavska županija'),
('en_US',	560,	'Zadarska županija'),
('en_US',	561,	'Osječko-baranjska županija'),
('en_US',	562,	'Šibensko-kninska županija'),
('en_US',	563,	'Vukovarsko-srijemska županija'),
('en_US',	564,	'Splitsko-dalmatinska županija'),
('en_US',	565,	'Istarska županija'),
('en_US',	566,	'Dubrovačko-neretvanska županija'),
('en_US',	567,	'Međimurska županija'),
('en_US',	568,	'Grad Zagreb'),
('en_US',	569,	'Andaman and Nicobar Islands'),
('en_US',	570,	'Andhra Pradesh'),
('en_US',	571,	'Arunachal Pradesh'),
('en_US',	572,	'Assam'),
('en_US',	573,	'Bihar'),
('en_US',	574,	'Chandigarh'),
('en_US',	575,	'Chhattisgarh'),
('en_US',	576,	'Dadra and Nagar Haveli'),
('en_US',	577,	'Daman and Diu'),
('en_US',	578,	'Delhi'),
('en_US',	579,	'Goa'),
('en_US',	580,	'Gujarat'),
('en_US',	581,	'Haryana'),
('en_US',	582,	'Himachal Pradesh'),
('en_US',	583,	'Jammu and Kashmir'),
('en_US',	584,	'Jharkhand'),
('en_US',	585,	'Karnataka'),
('en_US',	586,	'Kerala'),
('en_US',	587,	'Lakshadweep'),
('en_US',	588,	'Madhya Pradesh'),
('en_US',	589,	'Maharashtra'),
('en_US',	590,	'Manipur'),
('en_US',	591,	'Meghalaya'),
('en_US',	592,	'Mizoram'),
('en_US',	593,	'Nagaland'),
('en_US',	594,	'Odisha'),
('en_US',	595,	'Puducherry'),
('en_US',	596,	'Punjab'),
('en_US',	597,	'Rajasthan'),
('en_US',	598,	'Sikkim'),
('en_US',	599,	'Tamil Nadu'),
('en_US',	600,	'Telangana'),
('en_US',	601,	'Tripura'),
('en_US',	602,	'Uttar Pradesh'),
('en_US',	603,	'Uttarakhand'),
('en_US',	604,	'West Bengal'),
('en_US',	605,	'Australian Capital Territory'),
('en_US',	606,	'New South Wales'),
('en_US',	607,	'Victoria'),
('en_US',	608,	'Queensland'),
('en_US',	609,	'South Australia'),
('en_US',	610,	'Tasmania'),
('en_US',	611,	'Western Australia'),
('en_US',	612,	'Northern Territory'),
('en_US',	613,	'Bresckaja voblasć'),
('en_US',	614,	'Homieĺskaja voblasć'),
('en_US',	615,	'Horad Minsk'),
('en_US',	616,	'Hrodzienskaja voblasć'),
('en_US',	617,	'Mahilioŭskaja voblasć'),
('en_US',	618,	'Minskaja voblasć'),
('en_US',	619,	'Viciebskaja voblasć'),
('en_US',	620,	'Antwerpen'),
('en_US',	621,	'Brabant wallon'),
('en_US',	622,	'Brussels-Capital Region'),
('en_US',	623,	'Hainaut'),
('en_US',	624,	'Limburg'),
('en_US',	625,	'Liège'),
('en_US',	626,	'Luxembourg'),
('en_US',	627,	'Namur'),
('en_US',	628,	'Oost-Vlaanderen'),
('en_US',	629,	'Vlaams-Brabant'),
('en_US',	630,	'West-Vlaanderen'),
('en_US',	631,	'Cochabamba'),
('en_US',	632,	'Chuquisaca'),
('en_US',	633,	'El Beni'),
('en_US',	634,	'La Paz'),
('en_US',	635,	'Oruro'),
('en_US',	636,	'Pando'),
('en_US',	637,	'Potosí'),
('en_US',	638,	'Santa Cruz'),
('en_US',	639,	'Tarija'),
('en_US',	640,	'Blagoevgrad'),
('en_US',	641,	'Burgas'),
('en_US',	642,	'Varna'),
('en_US',	643,	'Veliko Tarnovo'),
('en_US',	644,	'Vidin'),
('en_US',	645,	'Vratsa'),
('en_US',	646,	'Gabrovo'),
('en_US',	647,	'Dobrich'),
('en_US',	648,	'Kardzhali'),
('en_US',	649,	'Kyustendil'),
('en_US',	650,	'Lovech'),
('en_US',	651,	'Montana'),
('en_US',	652,	'Pazardzhik'),
('en_US',	653,	'Pernik'),
('en_US',	654,	'Pleven'),
('en_US',	655,	'Plovdiv'),
('en_US',	656,	'Razgrad'),
('en_US',	657,	'Ruse'),
('en_US',	658,	'Silistra'),
('en_US',	659,	'Sliven'),
('en_US',	660,	'Smolyan'),
('en_US',	661,	'Sofia City'),
('en_US',	662,	'Sofia Province'),
('en_US',	663,	'Stara Zagora'),
('en_US',	664,	'Targovishte'),
('en_US',	665,	'Haskovo'),
('en_US',	666,	'Shumen'),
('en_US',	667,	'Yambol'),
('en_US',	668,	'Aisén del General Carlos Ibañez del Campo'),
('en_US',	669,	'Antofagasta'),
('en_US',	670,	'Arica y Parinacota'),
('en_US',	671,	'La Araucanía'),
('en_US',	672,	'Atacama'),
('en_US',	673,	'Biobío'),
('en_US',	674,	'Coquimbo'),
('en_US',	675,	'Libertador General Bernardo O\'Higgins'),
('en_US',	676,	'Los Lagos'),
('en_US',	677,	'Los Ríos'),
('en_US',	678,	'Magallanes'),
('en_US',	679,	'Maule'),
('en_US',	680,	'Ñuble'),
('en_US',	681,	'Región Metropolitana de Santiago'),
('en_US',	682,	'Tarapacá'),
('en_US',	683,	'Valparaíso'),
('en_US',	684,	'Anhui Sheng'),
('en_US',	685,	'Beijing Shi'),
('en_US',	686,	'Chongqing Shi'),
('en_US',	687,	'Fujian Sheng'),
('en_US',	688,	'Gansu Sheng'),
('en_US',	689,	'Guangdong Sheng'),
('en_US',	690,	'Guangxi Zhuangzu Zizhiqu'),
('en_US',	691,	'Guizhou Sheng'),
('en_US',	692,	'Hainan Sheng'),
('en_US',	693,	'Hebei Sheng'),
('en_US',	694,	'Heilongjiang Sheng'),
('en_US',	695,	'Henan Sheng'),
('en_US',	696,	'Hong Kong SAR'),
('en_US',	697,	'Hubei Sheng'),
('en_US',	698,	'Hunan Sheng'),
('en_US',	699,	'Jiangsu Sheng'),
('en_US',	700,	'Jiangxi Sheng'),
('en_US',	701,	'Jilin Sheng'),
('en_US',	702,	'Liaoning Sheng'),
('en_US',	703,	'Macao SAR'),
('en_US',	704,	'Nei Mongol Zizhiqu'),
('en_US',	705,	'Ningxia Huizi Zizhiqu'),
('en_US',	706,	'Qinghai Sheng'),
('en_US',	707,	'Shaanxi Sheng'),
('en_US',	708,	'Shandong Sheng'),
('en_US',	709,	'Shanghai Shi'),
('en_US',	710,	'Shanxi Sheng'),
('en_US',	711,	'Sichuan Sheng'),
('en_US',	712,	'Taiwan Sheng'),
('en_US',	713,	'Tianjin Shi'),
('en_US',	714,	'Xinjiang Uygur Zizhiqu'),
('en_US',	715,	'Xizang Zizhiqu'),
('en_US',	716,	'Yunnan Sheng'),
('en_US',	717,	'Zhejiang Sheng'),
('en_US',	718,	'Amazonas'),
('en_US',	719,	'Antioquia'),
('en_US',	720,	'Arauca'),
('en_US',	721,	'Atlántico'),
('en_US',	722,	'Bolívar'),
('en_US',	723,	'Boyacá'),
('en_US',	724,	'Caldas'),
('en_US',	725,	'Caquetá'),
('en_US',	726,	'Casanare'),
('en_US',	727,	'Cauca'),
('en_US',	728,	'Cesar'),
('en_US',	729,	'Chocó'),
('en_US',	730,	'Córdoba'),
('en_US',	731,	'Cundinamarca'),
('en_US',	732,	'Guainía'),
('en_US',	733,	'Guaviare'),
('en_US',	734,	'Huila'),
('en_US',	735,	'La Guajira'),
('en_US',	736,	'Magdalena'),
('en_US',	737,	'Meta'),
('en_US',	738,	'Nariño'),
('en_US',	739,	'Norte de Santander'),
('en_US',	740,	'Putumayo'),
('en_US',	741,	'Quindío'),
('en_US',	742,	'Risaralda'),
('en_US',	743,	'San Andrés y Providencia'),
('en_US',	744,	'Santander'),
('en_US',	745,	'Sucre'),
('en_US',	746,	'Tolima'),
('en_US',	747,	'Valle del Cauca'),
('en_US',	748,	'Vaupés'),
('en_US',	749,	'Vichada'),
('en_US',	750,	'Praha, Hlavní město'),
('en_US',	751,	'Středočeský kraj'),
('en_US',	752,	'Jihočeský kraj'),
('en_US',	753,	'Plzeňský kraj'),
('en_US',	754,	'Karlovarský kraj'),
('en_US',	755,	'Ústecký kraj'),
('en_US',	756,	'Liberecký kraj'),
('en_US',	757,	'Královéhradecký kraj'),
('en_US',	758,	'Pardubický kraj'),
('en_US',	759,	'Kraj Vysočina'),
('en_US',	760,	'Jihomoravský kraj'),
('en_US',	761,	'Olomoucký kraj'),
('en_US',	762,	'Zlínský kraj'),
('en_US',	763,	'Moravskoslezský kraj'),
('en_US',	764,	'Hovedstaden'),
('en_US',	765,	'Midtjylland'),
('en_US',	766,	'Nordjylland'),
('en_US',	767,	'Sjælland'),
('en_US',	768,	'Syddanmark'),
('en_US',	769,	'Azuay'),
('en_US',	770,	'Bolívar'),
('en_US',	771,	'Cañar'),
('en_US',	772,	'Carchi'),
('en_US',	773,	'Chimborazo'),
('en_US',	774,	'Cotopaxi'),
('en_US',	775,	'El Oro'),
('en_US',	776,	'Esmeraldas'),
('en_US',	777,	'Galápagos'),
('en_US',	778,	'Guayas'),
('en_US',	779,	'Imbabura'),
('en_US',	780,	'Loja'),
('en_US',	781,	'Los Ríos'),
('en_US',	782,	'Manabí'),
('en_US',	783,	'Morona Santiago'),
('en_US',	784,	'Napo'),
('en_US',	785,	'Orellana'),
('en_US',	786,	'Pastaza'),
('en_US',	787,	'Pichincha'),
('en_US',	788,	'Santa Elena'),
('en_US',	789,	'Santo Domingo de los Tsáchilas'),
('en_US',	790,	'Sucumbíos'),
('en_US',	791,	'Tungurahua'),
('en_US',	792,	'Zamora Chinchipe'),
('en_US',	793,	'Anatolikí Makedonía kai Thráki'),
('en_US',	794,	'Attikí'),
('en_US',	795,	'Dytikí Elláda'),
('en_US',	796,	'Dytikí Makedonía'),
('en_US',	797,	'Ionía Nísia'),
('en_US',	798,	'Ípeiros'),
('en_US',	799,	'Kentrikí Makedonía'),
('en_US',	800,	'Kríti'),
('en_US',	801,	'Nótio Aigaío'),
('en_US',	802,	'Pelopónnisos'),
('en_US',	803,	'Stereá Elláda'),
('en_US',	804,	'Thessalía'),
('en_US',	805,	'Vóreio Aigaío'),
('en_US',	806,	'Ágion Óros'),
('en_US',	807,	'Barima-Waini'),
('en_US',	808,	'Cuyuni-Mazaruni'),
('en_US',	809,	'Demerara-Mahaica'),
('en_US',	810,	'East Berbice-Corentyne'),
('en_US',	811,	'Essequibo Islands-West Demerara'),
('en_US',	812,	'Mahaica-Berbice'),
('en_US',	813,	'Pomeroon-Supenaam'),
('en_US',	814,	'Potaro-Siparuni'),
('en_US',	815,	'Upper Demerara-Berbice'),
('en_US',	816,	'Upper Takutu-Upper Essequibo'),
('en_US',	817,	'Höfuðborgarsvæði'),
('en_US',	818,	'Suðurnes'),
('en_US',	819,	'Vesturland'),
('en_US',	820,	'Vestfirðir'),
('en_US',	821,	'Norðurland vestra'),
('en_US',	822,	'Norðurland eystra'),
('en_US',	823,	'Austurland'),
('en_US',	824,	'Suðurland'),
('en_US',	825,	'Agrigento'),
('en_US',	826,	'Alessandria'),
('en_US',	827,	'Ancona'),
('en_US',	828,	'Aosta'),
('en_US',	829,	'L\'Aquila'),
('en_US',	830,	'Arezzo'),
('en_US',	831,	'Ascoli-Piceno'),
('en_US',	832,	'Asti'),
('en_US',	833,	'Avellino'),
('en_US',	834,	'Bari'),
('en_US',	835,	'Barletta-Andria-Trani'),
('en_US',	836,	'Belluno'),
('en_US',	837,	'Benevento'),
('en_US',	838,	'Bergamo'),
('en_US',	839,	'Biella'),
('en_US',	840,	'Bologna'),
('en_US',	841,	'Bolzano'),
('en_US',	842,	'Brescia'),
('en_US',	843,	'Brindisi'),
('en_US',	844,	'Cagliari'),
('en_US',	845,	'Caltanissetta'),
('en_US',	846,	'Campobasso'),
('en_US',	847,	'Carbonia Iglesias'),
('en_US',	848,	'Caserta'),
('en_US',	849,	'Catania'),
('en_US',	850,	'Catanzaro'),
('en_US',	851,	'Chieti'),
('en_US',	852,	'Como'),
('en_US',	853,	'Cosenza'),
('en_US',	854,	'Cremona'),
('en_US',	855,	'Crotone'),
('en_US',	856,	'Cuneo'),
('en_US',	857,	'Enna'),
('en_US',	858,	'Fermo'),
('en_US',	859,	'Ferrara'),
('en_US',	860,	'Firenze'),
('en_US',	861,	'Foggia'),
('en_US',	862,	'Forli-Cesena'),
('en_US',	863,	'Frosinone'),
('en_US',	864,	'Genova'),
('en_US',	865,	'Gorizia'),
('en_US',	866,	'Grosseto'),
('en_US',	867,	'Imperia'),
('en_US',	868,	'Isernia'),
('en_US',	869,	'La-Spezia'),
('en_US',	870,	'Latina'),
('en_US',	871,	'Lecce'),
('en_US',	872,	'Lecco'),
('en_US',	873,	'Livorno'),
('en_US',	874,	'Lodi'),
('en_US',	875,	'Lucca'),
('en_US',	876,	'Macerata'),
('en_US',	877,	'Mantova'),
('en_US',	878,	'Massa-Carrara'),
('en_US',	879,	'Matera'),
('en_US',	880,	'Medio Campidano'),
('en_US',	881,	'Messina'),
('en_US',	882,	'Milano'),
('en_US',	883,	'Modena'),
('en_US',	884,	'Monza-Brianza'),
('en_US',	885,	'Napoli'),
('en_US',	886,	'Novara'),
('en_US',	887,	'Nuoro'),
('en_US',	888,	'Ogliastra'),
('en_US',	889,	'Olbia Tempio'),
('en_US',	890,	'Oristano'),
('en_US',	891,	'Padova'),
('en_US',	892,	'Palermo'),
('en_US',	893,	'Parma'),
('en_US',	894,	'Pavia'),
('en_US',	895,	'Perugia'),
('en_US',	896,	'Pesaro-Urbino'),
('en_US',	897,	'Pescara'),
('en_US',	898,	'Piacenza'),
('en_US',	899,	'Pisa'),
('en_US',	900,	'Pistoia'),
('en_US',	901,	'Pordenone'),
('en_US',	902,	'Potenza'),
('en_US',	903,	'Prato'),
('en_US',	904,	'Ragusa'),
('en_US',	905,	'Ravenna'),
('en_US',	906,	'Reggio-Calabria'),
('en_US',	907,	'Reggio-Emilia'),
('en_US',	908,	'Rieti'),
('en_US',	909,	'Rimini'),
('en_US',	910,	'Roma'),
('en_US',	911,	'Rovigo'),
('en_US',	912,	'Salerno'),
('en_US',	913,	'Sassari'),
('en_US',	914,	'Savona'),
('en_US',	915,	'Siena'),
('en_US',	916,	'Siracusa'),
('en_US',	917,	'Sondrio'),
('en_US',	918,	'Taranto'),
('en_US',	919,	'Teramo'),
('en_US',	920,	'Terni'),
('en_US',	921,	'Torino'),
('en_US',	922,	'Trapani'),
('en_US',	923,	'Trento'),
('en_US',	924,	'Treviso'),
('en_US',	925,	'Trieste'),
('en_US',	926,	'Udine'),
('en_US',	927,	'Varese'),
('en_US',	928,	'Venezia'),
('en_US',	929,	'Verbania'),
('en_US',	930,	'Vercelli'),
('en_US',	931,	'Verona'),
('en_US',	932,	'Vibo-Valentia'),
('en_US',	933,	'Vicenza'),
('en_US',	934,	'Viterbo'),
('en_US',	935,	'Aguascalientes'),
('en_US',	936,	'Baja California'),
('en_US',	937,	'Baja California Sur'),
('en_US',	938,	'Campeche'),
('en_US',	939,	'Chiapas'),
('en_US',	940,	'Chihuahua'),
('en_US',	941,	'Ciudad de México'),
('en_US',	942,	'Coahuila'),
('en_US',	943,	'Colima'),
('en_US',	944,	'Durango'),
('en_US',	945,	'Estado de México'),
('en_US',	946,	'Guanajuato'),
('en_US',	947,	'Guerrero'),
('en_US',	948,	'Hidalgo'),
('en_US',	949,	'Jalisco'),
('en_US',	950,	'Michoacán'),
('en_US',	951,	'Morelos'),
('en_US',	952,	'Nayarit'),
('en_US',	953,	'Nuevo León'),
('en_US',	954,	'Oaxaca'),
('en_US',	955,	'Puebla'),
('en_US',	956,	'Querétaro'),
('en_US',	957,	'Quintana Roo'),
('en_US',	958,	'San Luis Potosí'),
('en_US',	959,	'Sinaloa'),
('en_US',	960,	'Sonora'),
('en_US',	961,	'Tabasco'),
('en_US',	962,	'Tamaulipas'),
('en_US',	963,	'Tlaxcala'),
('en_US',	964,	'Veracruz'),
('en_US',	965,	'Yucatán'),
('en_US',	966,	'Zacatecas'),
('en_US',	967,	'Asunción'),
('en_US',	968,	'Alto Paraguay'),
('en_US',	969,	'Alto Paraná'),
('en_US',	970,	'Amambay'),
('en_US',	971,	'Boquerón'),
('en_US',	972,	'Caaguazú'),
('en_US',	973,	'Caazapá'),
('en_US',	974,	'Canindeyú'),
('en_US',	975,	'Central'),
('en_US',	976,	'Concepción'),
('en_US',	977,	'Cordillera'),
('en_US',	978,	'Guairá'),
('en_US',	979,	'Itapúa'),
('en_US',	980,	'Misiones'),
('en_US',	981,	'Ñeembucú'),
('en_US',	982,	'Paraguarí'),
('en_US',	983,	'Presidente Hayes'),
('en_US',	984,	'San Pedro'),
('en_US',	985,	'Municipalidad Metropolitana de Lima'),
('en_US',	986,	'Amazonas'),
('en_US',	987,	'Ancash'),
('en_US',	988,	'Apurímac'),
('en_US',	989,	'Arequipa'),
('en_US',	990,	'Ayacucho'),
('en_US',	991,	'Cajamarca'),
('en_US',	992,	'Cusco'),
('en_US',	993,	'El Callao'),
('en_US',	994,	'Huancavelica'),
('en_US',	995,	'Huánuco'),
('en_US',	996,	'Ica'),
('en_US',	997,	'Junín'),
('en_US',	998,	'La Libertad'),
('en_US',	999,	'Lambayeque'),
('en_US',	1000,	'Lima'),
('en_US',	1001,	'Loreto'),
('en_US',	1002,	'Madre de Dios'),
('en_US',	1003,	'Moquegua'),
('en_US',	1004,	'Pasco'),
('en_US',	1005,	'Piura'),
('en_US',	1006,	'Puno'),
('en_US',	1007,	'San Martín'),
('en_US',	1008,	'Tacna'),
('en_US',	1009,	'Tumbes'),
('en_US',	1010,	'Ucayali'),
('en_US',	1011,	'dolnośląskie'),
('en_US',	1012,	'kujawsko-pomorskie'),
('en_US',	1013,	'lubelskie'),
('en_US',	1014,	'lubuskie'),
('en_US',	1015,	'łódzkie'),
('en_US',	1016,	'małopolskie'),
('en_US',	1017,	'mazowieckie'),
('en_US',	1018,	'opolskie'),
('en_US',	1019,	'podkarpackie'),
('en_US',	1020,	'podlaskie'),
('en_US',	1021,	'pomorskie'),
('en_US',	1022,	'śląskie'),
('en_US',	1023,	'świętokrzyskie'),
('en_US',	1024,	'warmińsko-mazurskie'),
('en_US',	1025,	'wielkopolskie'),
('en_US',	1026,	'zachodniopomorskie'),
('en_US',	1027,	'Aveiro'),
('en_US',	1028,	'Beja'),
('en_US',	1029,	'Braga'),
('en_US',	1030,	'Bragança'),
('en_US',	1031,	'Castelo Branco'),
('en_US',	1032,	'Coimbra'),
('en_US',	1033,	'Évora'),
('en_US',	1034,	'Faro'),
('en_US',	1035,	'Guarda'),
('en_US',	1036,	'Leiria'),
('en_US',	1037,	'Lisboa'),
('en_US',	1038,	'Portalegre'),
('en_US',	1039,	'Porto'),
('en_US',	1040,	'Santarém'),
('en_US',	1041,	'Setúbal'),
('en_US',	1042,	'Viana do Castelo'),
('en_US',	1043,	'Vila Real'),
('en_US',	1044,	'Viseu'),
('en_US',	1045,	'Região Autónoma dos Açores'),
('en_US',	1046,	'Região Autónoma da Madeira'),
('en_US',	1047,	'Brokopondo'),
('en_US',	1048,	'Commewijne'),
('en_US',	1049,	'Coronie'),
('en_US',	1050,	'Marowijne'),
('en_US',	1051,	'Nickerie'),
('en_US',	1052,	'Para'),
('en_US',	1053,	'Paramaribo'),
('en_US',	1054,	'Saramacca'),
('en_US',	1055,	'Sipaliwini'),
('en_US',	1056,	'Wanica'),
('en_US',	1057,	'Blekinge län'),
('en_US',	1058,	'Dalarnas län'),
('en_US',	1059,	'Gotlands län'),
('en_US',	1060,	'Gävleborgs län'),
('en_US',	1061,	'Hallands län'),
('en_US',	1062,	'Jämtlands län'),
('en_US',	1063,	'Jönköpings län'),
('en_US',	1064,	'Kalmar län'),
('en_US',	1065,	'Kronobergs län'),
('en_US',	1066,	'Norrbottens län'),
('en_US',	1067,	'Skåne län'),
('en_US',	1068,	'Stockholms län'),
('en_US',	1069,	'Södermanlands län'),
('en_US',	1070,	'Uppsala län'),
('en_US',	1071,	'Värmlands län'),
('en_US',	1072,	'Västerbottens län'),
('en_US',	1073,	'Västernorrlands län'),
('en_US',	1074,	'Västmanlands län'),
('en_US',	1075,	'Västra Götalands län'),
('en_US',	1076,	'Örebro län'),
('en_US',	1077,	'Östergötlands län'),
('en_US',	1078,	'Artigas'),
('en_US',	1079,	'Canelones'),
('en_US',	1080,	'Cerro Largo'),
('en_US',	1081,	'Colonia'),
('en_US',	1082,	'Durazno'),
('en_US',	1083,	'Flores'),
('en_US',	1084,	'Florida'),
('en_US',	1085,	'Lavalleja'),
('en_US',	1086,	'Maldonado'),
('en_US',	1087,	'Montevideo'),
('en_US',	1088,	'Paysandu'),
('en_US',	1089,	'Río Negro'),
('en_US',	1090,	'Rivera'),
('en_US',	1091,	'Rocha'),
('en_US',	1092,	'Salto'),
('en_US',	1093,	'San José'),
('en_US',	1094,	'Soriano'),
('en_US',	1095,	'Tacuarembó'),
('en_US',	1096,	'Treinta y Tres'),
('en_US',	1097,	'Dependencias Federales'),
('en_US',	1098,	'Distrito Capital'),
('en_US',	1099,	'Amazonas'),
('en_US',	1100,	'Anzoátegui'),
('en_US',	1101,	'Apure'),
('en_US',	1102,	'Aragua'),
('en_US',	1103,	'Barinas'),
('en_US',	1104,	'Bolívar'),
('en_US',	1105,	'Carabobo'),
('en_US',	1106,	'Cojedes'),
('en_US',	1107,	'Delta Amacuro'),
('en_US',	1108,	'Falcón'),
('en_US',	1109,	'Guárico'),
('en_US',	1110,	'Lara'),
('en_US',	1111,	'Mérida'),
('en_US',	1112,	'Miranda'),
('en_US',	1113,	'Monagas'),
('en_US',	1114,	'Nueva Esparta'),
('en_US',	1115,	'Portuguesa'),
('en_US',	1116,	'Sucre'),
('en_US',	1117,	'Táchira'),
('en_US',	1118,	'Trujillo'),
('en_US',	1119,	'Vargas'),
('en_US',	1120,	'Yaracuy'),
('en_US',	1121,	'Zulia');

DROP TABLE IF EXISTS `directory_currency_rate`;
CREATE TABLE `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Directory Currency Rate';

INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES
('EUR',	'EUR',	1.000000000000),
('EUR',	'USD',	1.415000000000),
('USD',	'EUR',	0.706700000000),
('USD',	'USD',	1.000000000000);

DROP TABLE IF EXISTS `downloadable_link`;
CREATE TABLE `downloadable_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Table';


DROP TABLE IF EXISTS `downloadable_link_price`;
CREATE TABLE `downloadable_link_price` (
  `price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Price Table';


DROP TABLE IF EXISTS `downloadable_link_purchased`;
CREATE TABLE `downloadable_link_purchased` (
  `purchased_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Purchased Table';


DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
CREATE TABLE `downloadable_link_purchased_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE SET NULL,
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_PURCHASED_ID_DL_LNK_PURCHASED_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Link Purchased Item Table';


DROP TABLE IF EXISTS `downloadable_link_title`;
CREATE TABLE `downloadable_link_title` (
  `title_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Link Title Table';


DROP TABLE IF EXISTS `downloadable_sample`;
CREATE TABLE `downloadable_sample` (
  `sample_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Sample Table';


DROP TABLE IF EXISTS `downloadable_sample_title`;
CREATE TABLE `downloadable_sample_title` (
  `title_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Downloadable Sample Title Table';


DROP TABLE IF EXISTS `eav_attribute`;
CREATE TABLE `eav_attribute` (
  `attribute_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_code` varchar(255) NOT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  KEY `EAV_ATTRIBUTE_FRONTEND_INPUT_ENTITY_TYPE_ID_IS_USER_DEFINED` (`frontend_input`,`entity_type_id`,`is_user_defined`),
  CONSTRAINT `EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute';

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(1,	1,	'website_id',	NULL,	'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website',	'static',	NULL,	NULL,	'select',	'Associate to Website',	NULL,	'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website',	1,	0,	NULL,	0,	NULL),
(2,	1,	'store_id',	NULL,	'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store',	'static',	NULL,	NULL,	'select',	'Create In',	NULL,	'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store',	1,	0,	NULL,	0,	NULL),
(3,	1,	'created_in',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Created From',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(4,	1,	'prefix',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Name Prefix',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(5,	1,	'firstname',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'First Name',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(6,	1,	'middlename',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Middle Name/Initial',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(7,	1,	'lastname',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Last Name',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(8,	1,	'suffix',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Name Suffix',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(9,	1,	'email',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Email',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(10,	1,	'group_id',	NULL,	NULL,	'static',	NULL,	NULL,	'select',	'Group',	NULL,	'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group',	1,	0,	NULL,	0,	NULL),
(11,	1,	'dob',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime',	'static',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime',	'date',	'Date of Birth',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(12,	1,	'password_hash',	NULL,	'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password',	'static',	NULL,	NULL,	'hidden',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(13,	1,	'rp_token',	NULL,	NULL,	'static',	NULL,	NULL,	'hidden',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(14,	1,	'rp_token_created_at',	NULL,	NULL,	'static',	NULL,	NULL,	'date',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(15,	1,	'default_billing',	NULL,	'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing',	'static',	NULL,	NULL,	'text',	'Default Billing Address',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(16,	1,	'default_shipping',	NULL,	'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping',	'static',	NULL,	NULL,	'text',	'Default Shipping Address',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(17,	1,	'taxvat',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Tax/VAT Number',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(18,	1,	'confirmation',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Is Confirmed',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(19,	1,	'created_at',	NULL,	NULL,	'static',	NULL,	NULL,	'date',	'Created At',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(20,	1,	'gender',	NULL,	NULL,	'static',	NULL,	NULL,	'select',	'Gender',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',	0,	0,	NULL,	0,	NULL),
(21,	1,	'disable_auto_group_change',	'Magento\\Customer\\Model\\Attribute',	'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean',	'static',	NULL,	NULL,	'boolean',	'Disable Automatic Group Change Based on VAT ID',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(22,	2,	'prefix',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Name Prefix',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(23,	2,	'firstname',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'First Name',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(24,	2,	'middlename',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Middle Name/Initial',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(25,	2,	'lastname',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Last Name',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(26,	2,	'suffix',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Name Suffix',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(27,	2,	'company',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Company',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(28,	2,	'street',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend',	'static',	NULL,	NULL,	'multiline',	'Street Address',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(29,	2,	'city',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'City',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(30,	2,	'country_id',	NULL,	NULL,	'static',	NULL,	NULL,	'select',	'Country',	NULL,	'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country',	1,	0,	NULL,	0,	NULL),
(31,	2,	'region',	NULL,	'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region',	'static',	NULL,	NULL,	'text',	'State/Province',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(32,	2,	'region_id',	NULL,	NULL,	'static',	NULL,	NULL,	'hidden',	'State/Province',	NULL,	'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region',	0,	0,	NULL,	0,	NULL),
(33,	2,	'postcode',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Zip/Postal Code',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(34,	2,	'telephone',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Phone Number',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(35,	2,	'fax',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Fax',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(36,	2,	'vat_id',	'Magento\\Customer\\Model\\Attribute',	NULL,	'static',	NULL,	NULL,	'text',	'VAT Number',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(37,	2,	'vat_is_valid',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'VAT number validity',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(38,	2,	'vat_request_id',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'VAT number validation request ID',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(39,	2,	'vat_request_date',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'VAT number validation request date',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(40,	2,	'vat_request_success',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'VAT number validation request success',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(41,	1,	'updated_at',	NULL,	NULL,	'static',	NULL,	NULL,	'date',	'Updated At',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(42,	1,	'failures_num',	NULL,	NULL,	'static',	NULL,	NULL,	'hidden',	'Failures Number',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(43,	1,	'first_failure',	NULL,	NULL,	'static',	NULL,	NULL,	'date',	'First Failure Date',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(44,	1,	'lock_expires',	NULL,	NULL,	'static',	NULL,	NULL,	'date',	'Failures Number',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(45,	3,	'name',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	'Name',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(46,	3,	'is_active',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Is Active',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',	1,	0,	NULL,	0,	NULL),
(47,	3,	'description',	NULL,	NULL,	'text',	NULL,	NULL,	'textarea',	'Description',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(48,	3,	'image',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image',	'varchar',	NULL,	NULL,	'image',	'Image',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(49,	3,	'meta_title',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	'Page Title',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(50,	3,	'meta_keywords',	NULL,	NULL,	'text',	NULL,	NULL,	'textarea',	'Meta Keywords',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(51,	3,	'meta_description',	NULL,	NULL,	'text',	NULL,	NULL,	'textarea',	'Meta Description',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(52,	3,	'display_mode',	NULL,	NULL,	'varchar',	NULL,	NULL,	'select',	'Display Mode',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode',	0,	0,	NULL,	0,	NULL),
(53,	3,	'landing_page',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'CMS Block',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page',	0,	0,	NULL,	0,	NULL),
(54,	3,	'is_anchor',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Is Anchor',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',	0,	0,	'1',	0,	NULL),
(55,	3,	'path',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Path',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(56,	3,	'position',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Position',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(57,	3,	'all_children',	NULL,	NULL,	'text',	NULL,	NULL,	'text',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(58,	3,	'path_in_store',	NULL,	NULL,	'text',	NULL,	NULL,	'text',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(59,	3,	'children',	NULL,	NULL,	'text',	NULL,	NULL,	'text',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(60,	3,	'custom_design',	NULL,	NULL,	'varchar',	NULL,	NULL,	'select',	'Custom Design',	NULL,	'Magento\\Theme\\Model\\Theme\\Source\\Theme',	0,	0,	NULL,	0,	NULL),
(61,	3,	'custom_design_from',	'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute',	'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate',	'datetime',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime',	'date',	'Active From',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(62,	3,	'custom_design_to',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime',	'datetime',	NULL,	NULL,	'date',	'Active To',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(63,	3,	'page_layout',	NULL,	NULL,	'varchar',	NULL,	NULL,	'select',	'Page Layout',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout',	0,	0,	NULL,	0,	NULL),
(64,	3,	'custom_layout_update',	NULL,	'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate',	'text',	NULL,	NULL,	'textarea',	'Custom Layout Update',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(65,	3,	'level',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Level',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(66,	3,	'children_count',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	'Children Count',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(67,	3,	'available_sort_by',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby',	'text',	NULL,	NULL,	'multiselect',	'Available Product Listing Sort By',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',	1,	0,	NULL,	0,	NULL),
(68,	3,	'default_sort_by',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby',	'varchar',	NULL,	NULL,	'select',	'Default Product Listing Sort By',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',	1,	0,	NULL,	0,	NULL),
(69,	3,	'include_in_menu',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Include in Navigation Menu',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',	1,	0,	'1',	0,	NULL),
(70,	3,	'custom_use_parent_settings',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Use Parent Category Settings',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',	0,	0,	NULL,	0,	NULL),
(71,	3,	'custom_apply_to_products',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Apply To Products',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',	0,	0,	NULL,	0,	NULL),
(72,	3,	'filter_price_range',	NULL,	NULL,	'decimal',	NULL,	NULL,	'text',	'Layered Navigation Price Step',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(73,	4,	'name',	'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute',	NULL,	'varchar',	NULL,	NULL,	'text',	'Product Name',	'validate-length maximum-length-255',	NULL,	1,	0,	NULL,	0,	NULL),
(74,	4,	'sku',	'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute',	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku',	'static',	NULL,	NULL,	'text',	'SKU',	'validate-length maximum-length-64',	NULL,	1,	0,	NULL,	1,	NULL),
(75,	4,	'description',	NULL,	NULL,	'text',	NULL,	NULL,	'textarea',	'Description',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(76,	4,	'short_description',	NULL,	NULL,	'text',	NULL,	NULL,	'textarea',	'Short Description',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(77,	4,	'price',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price',	'decimal',	NULL,	NULL,	'price',	'Price',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(78,	4,	'special_price',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price',	'decimal',	NULL,	NULL,	'price',	'Special Price',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(79,	4,	'special_from_date',	NULL,	'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate',	'datetime',	NULL,	NULL,	'date',	'Special Price From Date',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(80,	4,	'special_to_date',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime',	'datetime',	NULL,	NULL,	'date',	'Special Price To Date',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(81,	4,	'cost',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price',	'decimal',	NULL,	NULL,	'price',	'Cost',	NULL,	NULL,	0,	1,	NULL,	0,	NULL),
(82,	4,	'weight',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight',	'decimal',	NULL,	NULL,	'weight',	'Weight',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(83,	4,	'manufacturer',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Manufacturer',	NULL,	NULL,	0,	1,	NULL,	0,	NULL),
(84,	4,	'meta_title',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	'Meta Title',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(85,	4,	'meta_keyword',	NULL,	NULL,	'text',	NULL,	NULL,	'textarea',	'Meta Keywords',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(86,	4,	'meta_description',	NULL,	NULL,	'varchar',	NULL,	NULL,	'textarea',	'Meta Description',	NULL,	NULL,	0,	0,	NULL,	0,	'Maximum 255 chars. Meta Description should optimally be between 150-160 characters'),
(87,	4,	'image',	NULL,	NULL,	'varchar',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image',	'media_image',	'Base',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(88,	4,	'small_image',	NULL,	NULL,	'varchar',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image',	'media_image',	'Small',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(89,	4,	'thumbnail',	NULL,	NULL,	'varchar',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image',	'media_image',	'Thumbnail',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(90,	4,	'media_gallery',	NULL,	NULL,	'static',	NULL,	NULL,	'gallery',	'Media Gallery',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(91,	4,	'old_id',	NULL,	NULL,	'int',	NULL,	NULL,	'text',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(92,	4,	'tier_price',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice',	'decimal',	NULL,	NULL,	'text',	'Tier Price',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(93,	4,	'color',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Color',	NULL,	NULL,	0,	1,	NULL,	0,	NULL),
(94,	4,	'news_from_date',	NULL,	'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate',	'datetime',	NULL,	NULL,	'date',	'Set Product as New from Date',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(95,	4,	'news_to_date',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime',	'datetime',	NULL,	NULL,	'date',	'Set Product as New to Date',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(96,	4,	'gallery',	NULL,	NULL,	'varchar',	NULL,	NULL,	'gallery',	'Image Gallery',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(97,	4,	'status',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Enable Product',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status',	0,	0,	'1',	0,	NULL),
(98,	4,	'minimal_price',	'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute',	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price',	'decimal',	NULL,	NULL,	'price',	'Minimal Price',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(99,	4,	'visibility',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Visibility',	NULL,	'Magento\\Catalog\\Model\\Product\\Visibility',	0,	0,	'4',	0,	NULL),
(100,	4,	'custom_design',	NULL,	NULL,	'varchar',	NULL,	NULL,	'select',	'New Theme',	NULL,	'Magento\\Theme\\Model\\Theme\\Source\\Theme',	0,	0,	NULL,	0,	NULL),
(101,	4,	'custom_design_from',	NULL,	'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate',	'datetime',	NULL,	NULL,	'date',	'Active From',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(102,	4,	'custom_design_to',	NULL,	'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime',	'datetime',	NULL,	NULL,	'date',	'Active To',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(103,	4,	'custom_layout_update',	NULL,	'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate',	'text',	NULL,	NULL,	'textarea',	'Layout Update XML',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(104,	4,	'page_layout',	NULL,	NULL,	'varchar',	NULL,	NULL,	'select',	'Layout',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',	0,	0,	NULL,	0,	NULL),
(105,	4,	'category_ids',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category',	'static',	NULL,	NULL,	'text',	'Categories',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(106,	4,	'options_container',	NULL,	NULL,	'varchar',	NULL,	NULL,	'select',	'Display Product Options In',	NULL,	'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container',	0,	0,	'container2',	0,	NULL),
(107,	4,	'required_options',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(108,	4,	'has_options',	NULL,	NULL,	'static',	NULL,	NULL,	'text',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(109,	4,	'image_label',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	'Image Label',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(110,	4,	'small_image_label',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	'Small Image Label',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(111,	4,	'thumbnail_label',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	'Thumbnail Label',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(112,	4,	'created_at',	NULL,	NULL,	'static',	NULL,	NULL,	'date',	NULL,	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(113,	4,	'updated_at',	NULL,	NULL,	'static',	NULL,	NULL,	'date',	NULL,	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(114,	4,	'country_of_manufacture',	NULL,	NULL,	'varchar',	NULL,	NULL,	'select',	'Country of Manufacture',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture',	0,	0,	NULL,	0,	NULL),
(115,	4,	'quantity_and_stock_status',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock',	'int',	NULL,	NULL,	'select',	'Quantity',	NULL,	'Magento\\CatalogInventory\\Model\\Source\\Stock',	0,	0,	'1',	0,	NULL),
(116,	4,	'custom_layout',	NULL,	NULL,	'varchar',	NULL,	NULL,	'select',	'New Layout',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',	0,	0,	NULL,	0,	NULL),
(117,	4,	'custom_layout_update_file',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\LayoutUpdate',	'varchar',	NULL,	NULL,	'select',	'Custom Layout Update',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\LayoutUpdate',	0,	0,	NULL,	0,	NULL),
(118,	3,	'custom_layout_update_file',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\LayoutUpdate',	'varchar',	NULL,	NULL,	'select',	'Custom Layout Update',	NULL,	'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\LayoutUpdate',	0,	0,	NULL,	0,	NULL),
(119,	3,	'url_key',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	'URL Key',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(120,	3,	'url_path',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(121,	4,	'url_key',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	'URL Key',	'validate-trailing-hyphen',	NULL,	0,	0,	NULL,	0,	NULL),
(122,	4,	'url_path',	NULL,	NULL,	'varchar',	NULL,	NULL,	'text',	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(123,	4,	'msrp',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price',	'decimal',	NULL,	NULL,	'price',	'Minimum Advertised Price',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(124,	4,	'msrp_display_actual_price_type',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean',	'varchar',	NULL,	NULL,	'select',	'Display Actual Price',	NULL,	'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price',	0,	0,	'0',	0,	NULL),
(125,	4,	'links_purchased_separately',	NULL,	NULL,	'int',	NULL,	NULL,	NULL,	'Links can be purchased separately',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(126,	4,	'samples_title',	NULL,	NULL,	'varchar',	NULL,	NULL,	NULL,	'Samples title',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(127,	4,	'links_title',	NULL,	NULL,	'varchar',	NULL,	NULL,	NULL,	'Links title',	NULL,	NULL,	1,	0,	NULL,	0,	NULL),
(128,	4,	'links_exist',	NULL,	NULL,	'int',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(129,	4,	'price_type',	NULL,	NULL,	'int',	NULL,	NULL,	'boolean',	'Dynamic Price',	NULL,	NULL,	1,	0,	'0',	0,	NULL),
(130,	4,	'sku_type',	NULL,	NULL,	'int',	NULL,	NULL,	'boolean',	'Dynamic SKU',	NULL,	NULL,	1,	0,	'0',	0,	NULL),
(131,	4,	'weight_type',	NULL,	NULL,	'int',	NULL,	NULL,	'boolean',	'Dynamic Weight',	NULL,	NULL,	1,	0,	'0',	0,	NULL),
(132,	4,	'price_view',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Price View',	NULL,	'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View',	1,	0,	NULL,	0,	NULL),
(133,	4,	'shipment_type',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Ship Bundle Items',	NULL,	'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Shipment\\Type',	1,	0,	'0',	0,	NULL),
(134,	4,	'gift_message_available',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean',	'varchar',	NULL,	NULL,	'select',	'Allow Gift Message',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Boolean',	0,	0,	NULL,	0,	NULL),
(135,	4,	'swatch_image',	NULL,	NULL,	'varchar',	NULL,	'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image',	'media_image',	'Swatch',	NULL,	NULL,	0,	0,	NULL,	0,	NULL),
(136,	4,	'tax_class_id',	NULL,	NULL,	'int',	NULL,	NULL,	'select',	'Tax Class',	NULL,	'Magento\\Tax\\Model\\TaxClass\\Source\\Product',	0,	0,	'2',	0,	NULL),
(137,	4,	'author',	NULL,	NULL,	'text',	NULL,	NULL,	'text',	'Author',	NULL,	NULL,	0,	0,	NULL,	0,	NULL);

DROP TABLE IF EXISTS `eav_attribute_group`;
CREATE TABLE `eav_attribute_group` (
  `attribute_group_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint unsigned DEFAULT '0' COMMENT 'Default ID',
  `attribute_group_code` varchar(255) NOT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_CODE` (`attribute_set_id`,`attribute_group_code`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Group';

INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`, `attribute_group_code`, `tab_group_code`) VALUES
(1,	1,	'General',	1,	1,	'general',	NULL),
(2,	2,	'General',	1,	1,	'general',	NULL),
(3,	3,	'General',	10,	1,	'general',	NULL),
(4,	3,	'General Information',	2,	0,	'general-information',	NULL),
(5,	3,	'Display Settings',	20,	0,	'display-settings',	NULL),
(6,	3,	'Custom Design',	30,	0,	'custom-design',	NULL),
(7,	4,	'General',	10,	1,	'product-details',	'basic'),
(8,	4,	'Advanced Pricing',	40,	0,	'advanced-pricing',	'advanced'),
(9,	4,	'Search Engine Optimization',	30,	0,	'search-engine-optimization',	'basic'),
(10,	4,	'Images',	20,	0,	'image-management',	'basic'),
(11,	4,	'Design',	50,	0,	'design',	'advanced'),
(12,	4,	'Autosettings',	60,	0,	'autosettings',	'advanced'),
(13,	4,	'Content',	15,	0,	'content',	'basic'),
(14,	4,	'Schedule Design Update',	55,	0,	'schedule-design-update',	'advanced'),
(15,	5,	'General',	1,	1,	'general',	NULL),
(16,	6,	'General',	1,	1,	'general',	NULL),
(17,	7,	'General',	1,	1,	'general',	NULL),
(18,	8,	'General',	1,	1,	'general',	NULL),
(19,	4,	'Bundle Items',	16,	0,	'bundle-items',	NULL),
(20,	4,	'Gift Options',	61,	0,	'gift-options',	NULL);

DROP TABLE IF EXISTS `eav_attribute_label`;
CREATE TABLE `eav_attribute_label` (
  `attribute_label_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Label';


DROP TABLE IF EXISTS `eav_attribute_option`;
CREATE TABLE `eav_attribute_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Option';

INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1,	20,	0),
(2,	20,	1),
(3,	20,	3);

DROP TABLE IF EXISTS `eav_attribute_option_swatch`;
CREATE TABLE `eav_attribute_option_swatch` (
  `swatch_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `type` smallint unsigned NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`),
  CONSTRAINT `EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Magento Swatches table';


DROP TABLE IF EXISTS `eav_attribute_option_value`;
CREATE TABLE `eav_attribute_option_value` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Option Value';

INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1,	1,	0,	'Male'),
(2,	2,	0,	'Female'),
(3,	3,	0,	'Not Specified');

DROP TABLE IF EXISTS `eav_attribute_set`;
CREATE TABLE `eav_attribute_set` (
  `attribute_set_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Attribute Set';

INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES
(1,	1,	'Default',	2),
(2,	2,	'Default',	2),
(3,	3,	'Default',	1),
(4,	4,	'Default',	1),
(5,	5,	'Default',	1),
(6,	6,	'Default',	1),
(7,	7,	'Default',	1),
(8,	8,	'Default',	1);

DROP TABLE IF EXISTS `eav_entity`;
CREATE TABLE `eav_entity` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `parent_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity';


DROP TABLE IF EXISTS `eav_entity_attribute`;
CREATE TABLE `eav_entity_attribute` (
  `entity_attribute_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `attribute_group_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Attributes';

INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES
(1,	1,	1,	1,	1,	10),
(2,	1,	1,	1,	2,	20),
(3,	1,	1,	1,	3,	20),
(4,	1,	1,	1,	4,	30),
(5,	1,	1,	1,	5,	40),
(6,	1,	1,	1,	6,	50),
(7,	1,	1,	1,	7,	60),
(8,	1,	1,	1,	8,	70),
(9,	1,	1,	1,	9,	80),
(10,	1,	1,	1,	10,	25),
(11,	1,	1,	1,	11,	90),
(12,	1,	1,	1,	12,	81),
(13,	1,	1,	1,	13,	115),
(14,	1,	1,	1,	14,	120),
(15,	1,	1,	1,	15,	82),
(16,	1,	1,	1,	16,	83),
(17,	1,	1,	1,	17,	100),
(18,	1,	1,	1,	18,	0),
(19,	1,	1,	1,	19,	0),
(20,	1,	1,	1,	20,	110),
(21,	1,	1,	1,	21,	28),
(22,	2,	2,	2,	22,	10),
(23,	2,	2,	2,	23,	20),
(24,	2,	2,	2,	24,	30),
(25,	2,	2,	2,	25,	40),
(26,	2,	2,	2,	26,	50),
(27,	2,	2,	2,	27,	60),
(28,	2,	2,	2,	28,	70),
(29,	2,	2,	2,	29,	100),
(30,	2,	2,	2,	30,	80),
(31,	2,	2,	2,	31,	90),
(32,	2,	2,	2,	32,	90),
(33,	2,	2,	2,	33,	110),
(34,	2,	2,	2,	34,	120),
(35,	2,	2,	2,	35,	130),
(36,	2,	2,	2,	36,	140),
(37,	2,	2,	2,	37,	132),
(38,	2,	2,	2,	38,	133),
(39,	2,	2,	2,	39,	134),
(40,	2,	2,	2,	40,	135),
(41,	1,	1,	1,	41,	87),
(42,	1,	1,	1,	42,	100),
(43,	1,	1,	1,	43,	110),
(44,	1,	1,	1,	44,	120),
(45,	3,	3,	4,	45,	1),
(46,	3,	3,	4,	46,	2),
(47,	3,	3,	4,	47,	4),
(48,	3,	3,	4,	48,	5),
(49,	3,	3,	4,	49,	6),
(50,	3,	3,	4,	50,	7),
(51,	3,	3,	4,	51,	8),
(52,	3,	3,	5,	52,	10),
(53,	3,	3,	5,	53,	20),
(54,	3,	3,	5,	54,	30),
(55,	3,	3,	4,	55,	12),
(56,	3,	3,	4,	56,	13),
(57,	3,	3,	4,	57,	14),
(58,	3,	3,	4,	58,	15),
(59,	3,	3,	4,	59,	16),
(60,	3,	3,	6,	60,	10),
(61,	3,	3,	6,	61,	30),
(62,	3,	3,	6,	62,	40),
(63,	3,	3,	6,	63,	50),
(64,	3,	3,	6,	64,	60),
(65,	3,	3,	4,	65,	24),
(66,	3,	3,	4,	66,	25),
(67,	3,	3,	5,	67,	40),
(68,	3,	3,	5,	68,	50),
(69,	3,	3,	4,	69,	10),
(70,	3,	3,	6,	70,	5),
(71,	3,	3,	6,	71,	6),
(72,	3,	3,	5,	72,	51),
(73,	4,	4,	7,	73,	10),
(74,	4,	4,	7,	74,	20),
(75,	4,	4,	13,	75,	110),
(76,	4,	4,	13,	76,	100),
(77,	4,	4,	7,	77,	30),
(78,	4,	4,	8,	78,	3),
(79,	4,	4,	8,	79,	4),
(80,	4,	4,	8,	80,	5),
(81,	4,	4,	8,	81,	6),
(82,	4,	4,	7,	82,	70),
(83,	4,	4,	9,	84,	20),
(84,	4,	4,	9,	85,	30),
(85,	4,	4,	9,	86,	40),
(86,	4,	4,	10,	87,	1),
(87,	4,	4,	10,	88,	2),
(88,	4,	4,	10,	89,	3),
(89,	4,	4,	10,	90,	4),
(90,	4,	4,	7,	91,	6),
(91,	4,	4,	8,	92,	7),
(92,	4,	4,	7,	94,	90),
(93,	4,	4,	7,	95,	100),
(94,	4,	4,	10,	96,	5),
(95,	4,	4,	7,	97,	5),
(96,	4,	4,	8,	98,	8),
(97,	4,	4,	7,	99,	80),
(98,	4,	4,	14,	100,	40),
(99,	4,	4,	14,	101,	20),
(100,	4,	4,	14,	102,	30),
(101,	4,	4,	11,	103,	10),
(102,	4,	4,	11,	104,	5),
(103,	4,	4,	7,	105,	80),
(104,	4,	4,	11,	106,	6),
(105,	4,	4,	7,	107,	14),
(106,	4,	4,	7,	108,	15),
(107,	4,	4,	7,	109,	16),
(108,	4,	4,	7,	110,	17),
(109,	4,	4,	7,	111,	18),
(110,	4,	4,	7,	112,	19),
(111,	4,	4,	7,	113,	20),
(112,	4,	4,	7,	114,	110),
(113,	4,	4,	7,	115,	60),
(114,	4,	4,	14,	116,	50),
(115,	4,	4,	11,	117,	51),
(116,	3,	3,	6,	118,	51),
(117,	3,	3,	4,	119,	3),
(118,	3,	3,	4,	120,	17),
(119,	4,	4,	9,	121,	10),
(120,	4,	4,	7,	122,	11),
(121,	4,	4,	8,	123,	9),
(122,	4,	4,	8,	124,	10),
(123,	4,	4,	7,	125,	111),
(124,	4,	4,	7,	126,	112),
(125,	4,	4,	7,	127,	113),
(126,	4,	4,	7,	128,	114),
(127,	4,	4,	7,	129,	31),
(128,	4,	4,	7,	130,	21),
(129,	4,	4,	7,	131,	71),
(130,	4,	4,	8,	132,	11),
(131,	4,	4,	19,	133,	1),
(132,	4,	4,	20,	134,	10),
(133,	4,	4,	10,	135,	3),
(134,	4,	4,	7,	136,	40),
(135,	4,	4,	7,	137,	10);

DROP TABLE IF EXISTS `eav_entity_datetime`;
CREATE TABLE `eav_entity_datetime` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';


DROP TABLE IF EXISTS `eav_entity_decimal`;
CREATE TABLE `eav_entity_decimal` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';


DROP TABLE IF EXISTS `eav_entity_int`;
CREATE TABLE `eav_entity_int` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';


DROP TABLE IF EXISTS `eav_entity_store`;
CREATE TABLE `eav_entity_store` (
  `entity_store_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented ID',
  PRIMARY KEY (`entity_store_id`),
  KEY `EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_STORE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Store';


DROP TABLE IF EXISTS `eav_entity_text`;
CREATE TABLE `eav_entity_text` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';


DROP TABLE IF EXISTS `eav_entity_type`;
CREATE TABLE `eav_entity_type` (
  `entity_type_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type ID',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity ID Field',
  `is_data_sharing` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set ID',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Type';

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1,	'customer',	'Magento\\Customer\\Model\\ResourceModel\\Customer',	'Magento\\Customer\\Model\\Attribute',	'customer_entity',	NULL,	NULL,	1,	'default',	1,	'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',	0,	8,	'0',	'customer_eav_attribute',	'Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),
(2,	'customer_address',	'Magento\\Customer\\Model\\ResourceModel\\Address',	'Magento\\Customer\\Model\\Attribute',	'customer_address_entity',	NULL,	NULL,	1,	'default',	2,	NULL,	0,	8,	'0',	'customer_eav_attribute',	'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),
(3,	'catalog_category',	'Magento\\Catalog\\Model\\ResourceModel\\Category',	'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute',	'catalog_category_entity',	NULL,	NULL,	1,	'default',	3,	NULL,	0,	8,	'0',	'catalog_eav_attribute',	'Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),
(4,	'catalog_product',	'Magento\\Catalog\\Model\\ResourceModel\\Product',	'Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute',	'catalog_product_entity',	NULL,	NULL,	1,	'default',	4,	NULL,	0,	8,	'0',	'catalog_eav_attribute',	'Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),
(5,	'order',	'Magento\\Sales\\Model\\ResourceModel\\Order',	NULL,	'sales_order',	NULL,	NULL,	1,	'default',	5,	'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',	1,	8,	'0',	NULL,	NULL),
(6,	'invoice',	'Magento\\Sales\\Model\\ResourceModel\\Order\\Invoice',	NULL,	'sales_invoice',	NULL,	NULL,	1,	'default',	6,	'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',	1,	8,	'0',	NULL,	NULL),
(7,	'creditmemo',	'Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo',	NULL,	'sales_creditmemo',	NULL,	NULL,	1,	'default',	7,	'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',	1,	8,	'0',	NULL,	NULL),
(8,	'shipment',	'Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment',	NULL,	'sales_shipment',	NULL,	NULL,	1,	'default',	8,	'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',	1,	8,	'0',	NULL,	NULL);

DROP TABLE IF EXISTS `eav_entity_varchar`;
CREATE TABLE `eav_entity_varchar` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Entity Value Prefix';


DROP TABLE IF EXISTS `eav_form_element`;
CREATE TABLE `eav_form_element` (
  `element_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element ID',
  `type_id` smallint unsigned NOT NULL COMMENT 'Type ID',
  `fieldset_id` smallint unsigned DEFAULT NULL COMMENT 'Fieldset ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  CONSTRAINT `EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Element';

INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES
(1,	1,	NULL,	23,	0),
(2,	1,	NULL,	25,	1),
(3,	1,	NULL,	27,	2),
(4,	1,	NULL,	9,	3),
(5,	1,	NULL,	28,	4),
(6,	1,	NULL,	29,	5),
(7,	1,	NULL,	31,	6),
(8,	1,	NULL,	33,	7),
(9,	1,	NULL,	30,	8),
(10,	1,	NULL,	34,	9),
(11,	1,	NULL,	35,	10),
(12,	2,	NULL,	23,	0),
(13,	2,	NULL,	25,	1),
(14,	2,	NULL,	27,	2),
(15,	2,	NULL,	9,	3),
(16,	2,	NULL,	28,	4),
(17,	2,	NULL,	29,	5),
(18,	2,	NULL,	31,	6),
(19,	2,	NULL,	33,	7),
(20,	2,	NULL,	30,	8),
(21,	2,	NULL,	34,	9),
(22,	2,	NULL,	35,	10),
(23,	3,	NULL,	23,	0),
(24,	3,	NULL,	25,	1),
(25,	3,	NULL,	27,	2),
(26,	3,	NULL,	28,	3),
(27,	3,	NULL,	29,	4),
(28,	3,	NULL,	31,	5),
(29,	3,	NULL,	33,	6),
(30,	3,	NULL,	30,	7),
(31,	3,	NULL,	34,	8),
(32,	3,	NULL,	35,	9),
(33,	4,	NULL,	23,	0),
(34,	4,	NULL,	25,	1),
(35,	4,	NULL,	27,	2),
(36,	4,	NULL,	28,	3),
(37,	4,	NULL,	29,	4),
(38,	4,	NULL,	31,	5),
(39,	4,	NULL,	33,	6),
(40,	4,	NULL,	30,	7),
(41,	4,	NULL,	34,	8),
(42,	4,	NULL,	35,	9);

DROP TABLE IF EXISTS `eav_form_fieldset`;
CREATE TABLE `eav_form_fieldset` (
  `fieldset_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset ID',
  `type_id` smallint unsigned NOT NULL COMMENT 'Type ID',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  CONSTRAINT `EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Fieldset';


DROP TABLE IF EXISTS `eav_form_fieldset_label`;
CREATE TABLE `eav_form_fieldset_label` (
  `fieldset_id` smallint unsigned NOT NULL COMMENT 'Fieldset ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Fieldset Label';


DROP TABLE IF EXISTS `eav_form_type`;
CREATE TABLE `eav_form_type` (
  `type_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type ID',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Type';

INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES
(1,	'checkout_onepage_register',	'checkout_onepage_register',	1,	'',	0),
(2,	'checkout_onepage_register_guest',	'checkout_onepage_register_guest',	1,	'',	0),
(3,	'checkout_onepage_billing_address',	'checkout_onepage_billing_address',	1,	'',	0),
(4,	'checkout_onepage_shipping_address',	'checkout_onepage_shipping_address',	1,	'',	0);

DROP TABLE IF EXISTS `eav_form_type_entity`;
CREATE TABLE `eav_form_type_entity` (
  `type_id` smallint unsigned NOT NULL COMMENT 'Type ID',
  `entity_type_id` smallint unsigned NOT NULL COMMENT 'Entity Type ID',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Eav Form Type Entity';

INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES
(1,	1),
(2,	1),
(1,	2),
(2,	2),
(3,	2),
(4,	2);

DROP TABLE IF EXISTS `email_template`;
CREATE TABLE `email_template` (
  `template_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of Template Creation',
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  `is_legacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Should the template render in legacy mode',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Email Templates';


DROP TABLE IF EXISTS `flag`;
CREATE TABLE `flag` (
  `flag_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` mediumtext COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Flag';

INSERT INTO `flag` (`flag_id`, `flag_code`, `state`, `flag_data`, `last_update`) VALUES
(1,	'analytics_link_attempts_reverse_counter',	0,	'24',	'2023-07-14 05:04:11');

DROP TABLE IF EXISTS `gift_message`;
CREATE TABLE `gift_message` (
  `gift_message_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Gift Message';


DROP TABLE IF EXISTS `googleoptimizer_code`;
CREATE TABLE `googleoptimizer_code` (
  `code_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code ID',
  `entity_id` int unsigned NOT NULL COMMENT 'Optimized entity ID product ID or catalog ID',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`),
  CONSTRAINT `GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Google Experiment code';


DROP TABLE IF EXISTS `import_history`;
CREATE TABLE `import_history` (
  `history_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'History record ID',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Import history table';


DROP TABLE IF EXISTS `importexport_importdata`;
CREATE TABLE `importexport_importdata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  `is_processed` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is Row Processed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'timestamp of last update',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Import Data Table';


DROP TABLE IF EXISTS `indexer_state`;
CREATE TABLE `indexer_state` (
  `state_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State ID',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer ID',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Indexer State';

INSERT INTO `indexer_state` (`state_id`, `indexer_id`, `status`, `updated`, `hash_config`) VALUES
(1,	'design_config_grid',	'valid',	'2023-07-17 05:08:26',	'5a3f853544bfc0739aa8d37a88390922'),
(2,	'customer_grid',	'valid',	'2023-07-15 11:02:34',	'8ab4477a2c4b17f4c9a5ce95c97d4199'),
(3,	'catalog_category_product',	'invalid',	'2023-07-15 12:05:58',	'b136facaf84b84a0785b27158029a721'),
(4,	'catalog_product_category',	'valid',	'2023-07-15 11:02:34',	'80af6e457b40fcd0d8f8ec09ef0449c1'),
(5,	'catalogrule_rule',	'invalid',	'2023-07-15 12:05:58',	'854c0f5e7bfc439e8e3e460705401759'),
(6,	'catalog_product_attribute',	'invalid',	'2023-07-15 12:07:11',	'8c444074ca0d5a7bf8b6b9e1644b02c6'),
(7,	'cataloginventory_stock',	'invalid',	'2023-07-15 12:05:58',	'626afe43da2567a582b55066ded64db8'),
(8,	'inventory',	'invalid',	'2023-07-15 12:05:58',	'6141310341bb8c79a4d0c424553eb1b8'),
(9,	'catalogrule_product',	'valid',	'2023-07-15 11:02:34',	'a023e612f109ad8d9cd772529ffdf689'),
(10,	'catalog_product_price',	'invalid',	'2023-07-15 12:05:58',	'd6e1efd80bb2292c74db1a5d73c3b481'),
(11,	'catalogsearch_fulltext',	'invalid',	'2023-07-15 12:05:58',	'f642e693bdacdb236bdb87bd29aad5e5');

DROP TABLE IF EXISTS `integration`;
CREATE TABLE `integration` (
  `integration_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `INTEGRATION_NAME` (`name`),
  UNIQUE KEY `INTEGRATION_CONSUMER_ID` (`consumer_id`),
  CONSTRAINT `INTEGRATION_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='integration';

INSERT INTO `integration` (`integration_id`, `name`, `email`, `endpoint`, `status`, `consumer_id`, `created_at`, `updated_at`, `setup_type`, `identity_link_url`) VALUES
(1,	'Order',	'',	'http://dev.magento.com/rest/V1/bookshop/backendapi/order',	1,	1,	'2023-07-16 09:39:03',	'2023-07-16 09:39:15',	0,	NULL);

DROP TABLE IF EXISTS `inventory_geoname`;
CREATE TABLE `inventory_geoname` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'entity id',
  `country_code` varchar(64) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `city` varchar(180) NOT NULL,
  `region` varchar(100) NOT NULL,
  `province` varchar(64) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `inventory_low_stock_notification_configuration`;
CREATE TABLE `inventory_low_stock_notification_configuration` (
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `notify_stock_qty` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`source_code`,`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `inventory_low_stock_notification_configuration` (`source_code`, `sku`, `notify_stock_qty`) VALUES
('default',	'APJK123',	NULL),
('default',	'BEOFH123',	NULL),
('default',	'BGYX123',	NULL),
('default',	'DDFDX145',	NULL),
('default',	'Drugs and Human Behavior',	NULL),
('default',	'IEWUX13',	NULL),
('default',	'Iswu124',	NULL),
('default',	'LASZU123',	NULL),
('default',	'Shiva to Shankara: Giving Form to the Formless',	NULL),
('default',	'TOEX1233',	NULL),
('default',	'TPKL1233',	NULL),
('default',	'TPOYSMX12',	NULL),
('default',	'WFX135',	NULL),
('default',	'YTWCX12',	NULL);

DROP TABLE IF EXISTS `inventory_order_notification`;
CREATE TABLE `inventory_order_notification` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Order ID',
  `notification_sent` smallint NOT NULL COMMENT 'Has Notification Been Sent For Order',
  `send_notification` smallint NOT NULL COMMENT 'Should Notification Be Send For Order',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `INVENTORY_ORDER_NOTIFICATION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `inventory_pickup_location_order`;
CREATE TABLE `inventory_pickup_location_order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Order ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`order_id`),
  CONSTRAINT `INVENTORY_PICKUP_LOCATION_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `inventory_pickup_location_quote_address`;
CREATE TABLE `inventory_pickup_location_quote_address` (
  `address_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Quote Address ID',
  `pickup_location_code` varchar(255) NOT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`address_id`),
  CONSTRAINT `INV_PICKUP_LOCATION_QUOTE_ADDR_ADDR_ID_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `inventory_reservation`;
CREATE TABLE `inventory_reservation` (
  `reservation_id` int unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int unsigned NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `metadata` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `INVENTORY_RESERVATION_STOCK_ID_SKU_QUANTITY` (`stock_id`,`sku`,`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `inventory_reservation` (`reservation_id`, `stock_id`, `sku`, `quantity`, `metadata`) VALUES
(1,	1,	'DDFDX145',	-37.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000001\"}'),
(2,	1,	'LASZU123',	-46.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000001\"}'),
(3,	1,	'APJK123',	-1.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000002\"}'),
(4,	1,	'WFX135',	-1.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000002\"}'),
(5,	1,	'DDFDX145',	-4.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000003\"}'),
(6,	1,	'DDFDX145',	-1.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000004\"}'),
(7,	1,	'WFX135',	-3.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000005\"}'),
(8,	1,	'WFX135',	-3.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000006\"}'),
(9,	1,	'WFX135',	-3.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"6\",\"object_increment_id\":\"000000006\"}'),
(10,	1,	'BGYX123',	-3.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000007\"}'),
(11,	1,	'BGYX123',	-3.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"7\",\"object_increment_id\":\"000000007\"}'),
(12,	1,	'BGYX123',	-3.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000008\"}'),
(13,	1,	'BGYX123',	-3.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000009\"}'),
(14,	1,	'BGYX123',	-3.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"9\",\"object_increment_id\":\"000000009\"}'),
(15,	1,	'WFX135',	-2.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000010\"}'),
(16,	1,	'BGYX123',	-1.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"\",\"object_increment_id\":\"000000010\"}'),
(17,	1,	'WFX135',	-2.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"10\",\"object_increment_id\":\"000000010\"}'),
(18,	1,	'BGYX123',	-1.0000,	'{\"event_type\":\"order_placed\",\"object_type\":\"order\",\"object_id\":\"10\",\"object_increment_id\":\"000000010\"}');

DROP TABLE IF EXISTS `inventory_shipment_source`;
CREATE TABLE `inventory_shipment_source` (
  `shipment_id` int unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  PRIMARY KEY (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `inventory_source`;
CREATE TABLE `inventory_source` (
  `source_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `enabled` smallint unsigned NOT NULL DEFAULT '1',
  `description` text,
  `latitude` decimal(8,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `country_id` varchar(2) NOT NULL,
  `region_id` int unsigned DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `use_default_carrier_config` smallint unsigned NOT NULL DEFAULT '1',
  `is_pickup_location_active` tinyint(1) NOT NULL DEFAULT '0',
  `frontend_name` varchar(255) DEFAULT '',
  `frontend_description` text,
  PRIMARY KEY (`source_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `inventory_source` (`source_code`, `name`, `enabled`, `description`, `latitude`, `longitude`, `country_id`, `region_id`, `region`, `city`, `street`, `postcode`, `contact_name`, `email`, `phone`, `fax`, `use_default_carrier_config`, `is_pickup_location_active`, `frontend_name`, `frontend_description`) VALUES
('bookshop',	'bookshop',	1,	NULL,	NULL,	NULL,	'AT',	NULL,	NULL,	NULL,	NULL,	'123333',	NULL,	NULL,	NULL,	NULL,	1,	0,	'bookshop',	NULL),
('default',	'Default Source',	1,	'Default Source',	0.000000,	0.000000,	'US',	2,	'Alaska',	NULL,	NULL,	'00000',	NULL,	NULL,	NULL,	NULL,	1,	0,	'Default Source',	NULL);

DROP TABLE IF EXISTS `inventory_source_carrier_link`;
CREATE TABLE `inventory_source_carrier_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `carrier_code` varchar(255) NOT NULL,
  `position` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  CONSTRAINT `INV_SOURCE_CARRIER_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `inventory_source_item`;
CREATE TABLE `inventory_source_item` (
  `source_item_id` int unsigned NOT NULL AUTO_INCREMENT,
  `source_code` varchar(255) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `quantity` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `status` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`source_item_id`),
  UNIQUE KEY `INVENTORY_SOURCE_ITEM_SOURCE_CODE_SKU` (`source_code`,`sku`),
  KEY `INVENTORY_SOURCE_ITEM_SKU_SOURCE_CODE_QUANTITY` (`sku`,`source_code`,`quantity`),
  CONSTRAINT `INVENTORY_SOURCE_ITEM_SOURCE_CODE_INVENTORY_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `inventory_source_item` (`source_item_id`, `source_code`, `sku`, `quantity`, `status`) VALUES
(1,	'default',	'Iswu124',	100.0000,	1),
(24,	'default',	'YTWCX12',	50.0000,	1),
(36,	'default',	'IEWUX13',	35.0000,	1),
(40,	'default',	'TOEX1233',	90.0000,	1),
(42,	'default',	'WFX135',	100.0000,	1),
(44,	'default',	'DDFDX145',	42.0000,	1),
(46,	'default',	'APJK123',	233.0000,	1),
(50,	'default',	'LASZU123',	132.0000,	1),
(54,	'default',	'TPOYSMX12',	133.0000,	1),
(58,	'default',	'BGYX123',	100.0000,	1),
(62,	'default',	'BEOFH123',	100.0000,	1),
(66,	'default',	'Drugs and Human Behavior',	35.0000,	1),
(68,	'default',	'TPKL1233',	103.0000,	1),
(70,	'default',	'Shiva to Shankara: Giving Form to the Formless',	104.0000,	1);

DROP TABLE IF EXISTS `inventory_source_stock_link`;
CREATE TABLE `inventory_source_stock_link` (
  `link_id` int unsigned NOT NULL AUTO_INCREMENT,
  `stock_id` int unsigned NOT NULL,
  `source_code` varchar(255) NOT NULL,
  `priority` smallint unsigned NOT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_SOURCE_CODE` (`stock_id`,`source_code`),
  KEY `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` (`source_code`),
  KEY `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_PRIORITY` (`stock_id`,`priority`),
  CONSTRAINT `INV_SOURCE_STOCK_LNK_SOURCE_CODE_INV_SOURCE_SOURCE_CODE` FOREIGN KEY (`source_code`) REFERENCES `inventory_source` (`source_code`) ON DELETE CASCADE,
  CONSTRAINT `INVENTORY_SOURCE_STOCK_LINK_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `inventory_source_stock_link` (`link_id`, `stock_id`, `source_code`, `priority`) VALUES
(1,	1,	'default',	1),
(2,	2,	'bookshop',	2);

DROP TABLE IF EXISTS `inventory_stock`;
CREATE TABLE `inventory_stock` (
  `stock_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `inventory_stock` (`stock_id`, `name`) VALUES
(1,	'Default Stock'),
(2,	'Books');

DROP VIEW IF EXISTS `inventory_stock_1`;
CREATE TABLE `inventory_stock_1` (`product_id` int unsigned, `website_id` smallint unsigned, `stock_id` smallint unsigned, `quantity` decimal(12,4), `is_salable` smallint unsigned, `sku` varchar(64));


DROP TABLE IF EXISTS `inventory_stock_2`;
CREATE TABLE `inventory_stock_2` (
  `sku` varchar(64) NOT NULL COMMENT 'Sku',
  `quantity` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quantity',
  `is_salable` tinyint(1) NOT NULL COMMENT 'Is Salable',
  PRIMARY KEY (`sku`),
  KEY `index_sku_qty` (`sku`,`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Inventory Stock item Table';


DROP TABLE IF EXISTS `inventory_stock_sales_channel`;
CREATE TABLE `inventory_stock_sales_channel` (
  `type` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `stock_id` int unsigned NOT NULL,
  PRIMARY KEY (`type`,`code`),
  KEY `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` (`stock_id`),
  CONSTRAINT `INVENTORY_STOCK_SALES_CHANNEL_STOCK_ID_INVENTORY_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `inventory_stock_sales_channel` (`type`, `code`, `stock_id`) VALUES
('website',	'base',	1);

DROP TABLE IF EXISTS `jwt_auth_revoked`;
CREATE TABLE `jwt_auth_revoked` (
  `user_type_id` int unsigned NOT NULL COMMENT 'User Type ID',
  `user_id` int unsigned NOT NULL COMMENT 'User ID',
  `revoke_before` bigint unsigned NOT NULL COMMENT 'Not accepting tokens issued before this timestamp',
  PRIMARY KEY (`user_type_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Holds revoked JWT authentication data';


DROP TABLE IF EXISTS `layout_link`;
CREATE TABLE `layout_link` (
  `layout_link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `theme_id` int unsigned NOT NULL COMMENT 'Theme ID',
  `layout_update_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update ID',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`),
  KEY `LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`),
  CONSTRAINT `LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Layout Link';


DROP TABLE IF EXISTS `layout_update`;
CREATE TABLE `layout_update` (
  `layout_update_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update ID',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Layout Updates';


DROP TABLE IF EXISTS `login_as_customer`;
CREATE TABLE `login_as_customer` (
  `secret` varchar(64) NOT NULL COMMENT 'Login Secret',
  `customer_id` int NOT NULL COMMENT 'Customer ID',
  `admin_id` int NOT NULL COMMENT 'Admin ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  PRIMARY KEY (`secret`),
  KEY `LOGIN_AS_CUSTOMER_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Magento Login as Customer Table';


DROP TABLE IF EXISTS `login_as_customer_assistance_allowed`;
CREATE TABLE `login_as_customer_assistance_allowed` (
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `LOGIN_AS_CSTR_ASSISTANCE_ALLOWED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Magento Login as Customer Assistance Allowed Table';


DROP TABLE IF EXISTS `magento_acknowledged_bulk`;
CREATE TABLE `magento_acknowledged_bulk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Internal ID',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID` (`bulk_uuid`),
  CONSTRAINT `MAGENTO_ACKNOWLEDGED_BULK_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Bulk that was viewed by user from notification area';


DROP TABLE IF EXISTS `magento_bulk`;
CREATE TABLE `magento_bulk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bulk Internal ID (must not be exposed)',
  `uuid` varbinary(39) DEFAULT NULL COMMENT 'Bulk UUID (can be exposed to reference bulk entity)',
  `user_id` int unsigned DEFAULT NULL COMMENT 'ID of the WebAPI user that performed an action',
  `user_type` int DEFAULT NULL COMMENT 'Which type of user',
  `description` varchar(255) DEFAULT NULL COMMENT 'Bulk Description',
  `operation_count` int unsigned NOT NULL COMMENT 'Total number of operations scheduled within this bulk',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bulk start time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MAGENTO_BULK_UUID` (`uuid`),
  KEY `MAGENTO_BULK_USER_ID` (`user_id`),
  KEY `MAGENTO_BULK_START_TIME` (`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Bulk entity that represents set of related asynchronous operations';


DROP TABLE IF EXISTS `magento_login_as_customer_log`;
CREATE TABLE `magento_login_as_customer_log` (
  `log_id` int NOT NULL AUTO_INCREMENT COMMENT 'Log Id',
  `time` timestamp NULL DEFAULT NULL COMMENT 'Event Date',
  `user_id` int unsigned DEFAULT NULL COMMENT 'User Id',
  `user_name` varchar(40) DEFAULT NULL COMMENT 'User Name',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_email` varchar(40) DEFAULT NULL COMMENT 'Customer email',
  PRIMARY KEY (`log_id`),
  KEY `MAGENTO_LOGIN_AS_CUSTOMER_LOG_USER_ID` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Login as Customer Logging';


DROP TABLE IF EXISTS `magento_operation`;
CREATE TABLE `magento_operation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Operation ID',
  `operation_key` int unsigned DEFAULT NULL COMMENT 'Operation Key',
  `bulk_uuid` varbinary(39) DEFAULT NULL COMMENT 'Related Bulk UUID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Name of the related message queue topic',
  `serialized_data` blob COMMENT 'Data (serialized) required to perform an operation',
  `result_serialized_data` blob COMMENT 'Result data (serialized) after perform an operation',
  `status` smallint DEFAULT '0' COMMENT 'Operation status (OPEN | COMPLETE | RETRIABLY_FAILED | NOT_RETRIABLY_FAILED)',
  `error_code` smallint DEFAULT NULL COMMENT 'Code of the error that appeared during operation execution (used to aggregate related failed operations)',
  `result_message` varchar(255) DEFAULT NULL COMMENT 'Operation result message',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Datetime the operation started processing',
  PRIMARY KEY (`id`),
  KEY `MAGENTO_OPERATION_BULK_UUID_ERROR_CODE` (`bulk_uuid`,`error_code`),
  KEY `MAGENTO_OPERATION_STATUS_STARTED_AT` (`status`,`started_at`),
  CONSTRAINT `MAGENTO_OPERATION_BULK_UUID_MAGENTO_BULK_UUID` FOREIGN KEY (`bulk_uuid`) REFERENCES `magento_bulk` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Operation entity';


DROP TABLE IF EXISTS `media_content_asset`;
CREATE TABLE `media_content_asset` (
  `asset_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `entity_type` varchar(255) NOT NULL COMMENT 'Content type',
  `entity_id` varchar(255) NOT NULL COMMENT 'Content entity id',
  `field` varchar(255) NOT NULL COMMENT 'Content field',
  PRIMARY KEY (`entity_type`,`entity_id`,`field`,`asset_id`),
  KEY `MEDIA_CONTENT_ASSET_ASSET_ID` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Relation between media content and media asset';


DROP TABLE IF EXISTS `media_gallery_asset`;
CREATE TABLE `media_gallery_asset` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `path` text COMMENT 'Path',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `source` varchar(255) DEFAULT NULL COMMENT 'Source',
  `hash` varchar(255) DEFAULT NULL COMMENT 'File hash',
  `content_type` varchar(255) DEFAULT NULL COMMENT 'Content Type',
  `width` int unsigned NOT NULL DEFAULT '0' COMMENT 'Width',
  `height` int unsigned NOT NULL DEFAULT '0' COMMENT 'Height',
  `size` int unsigned NOT NULL COMMENT 'Asset file size in bytes',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`id`),
  KEY `MEDIA_GALLERY_ASSET_ID` (`id`),
  FULLTEXT KEY `MEDIA_GALLERY_ASSET_TITLE` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Media Gallery Asset';


DROP TABLE IF EXISTS `media_gallery_asset_keyword`;
CREATE TABLE `media_gallery_asset_keyword` (
  `keyword_id` int unsigned NOT NULL COMMENT 'Keyword Id',
  `asset_id` int unsigned NOT NULL COMMENT 'Asset ID',
  PRIMARY KEY (`keyword_id`,`asset_id`),
  KEY `MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID` (`asset_id`),
  KEY `MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID` (`keyword_id`),
  CONSTRAINT `MEDIA_GALLERY_ASSET_KEYWORD_ASSET_ID_MEDIA_GALLERY_ASSET_ID` FOREIGN KEY (`asset_id`) REFERENCES `media_gallery_asset` (`id`) ON DELETE CASCADE,
  CONSTRAINT `MEDIA_GALLERY_ASSET_KEYWORD_KEYWORD_ID_MEDIA_GALLERY_KEYWORD_ID` FOREIGN KEY (`keyword_id`) REFERENCES `media_gallery_keyword` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Media Gallery Asset Keyword';


DROP TABLE IF EXISTS `media_gallery_keyword`;
CREATE TABLE `media_gallery_keyword` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Keyword ID',
  `keyword` varchar(255) NOT NULL COMMENT 'Keyword',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MEDIA_GALLERY_KEYWORD_KEYWORD` (`keyword`),
  KEY `MEDIA_GALLERY_KEYWORD_ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Media Gallery Keyword';


DROP TABLE IF EXISTS `mview_state`;
CREATE TABLE `mview_state` (
  `state_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State ID',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View ID',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int unsigned DEFAULT NULL COMMENT 'View Version ID',
  PRIMARY KEY (`state_id`),
  KEY `MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='View State';


DROP TABLE IF EXISTS `newsletter_problem`;
CREATE TABLE `newsletter_problem` (
  `problem_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem ID',
  `subscriber_id` int unsigned DEFAULT NULL COMMENT 'Subscriber ID',
  `queue_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Queue ID',
  `problem_error_code` int unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`),
  CONSTRAINT `NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Problems';


DROP TABLE IF EXISTS `newsletter_queue`;
CREATE TABLE `newsletter_queue` (
  `queue_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue ID',
  `template_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Queue';


DROP TABLE IF EXISTS `newsletter_queue_link`;
CREATE TABLE `newsletter_queue_link` (
  `queue_link_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link ID',
  `queue_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Queue ID',
  `subscriber_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber ID',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Queue Link';


DROP TABLE IF EXISTS `newsletter_queue_store_link`;
CREATE TABLE `newsletter_queue_store_link` (
  `queue_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Queue ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Queue Store Link';


DROP TABLE IF EXISTS `newsletter_subscriber`;
CREATE TABLE `newsletter_subscriber` (
  `subscriber_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  KEY `NEWSLETTER_SUBSCRIBER_SUBSCRIBER_EMAIL` (`subscriber_email`),
  CONSTRAINT `NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Subscriber';


DROP TABLE IF EXISTS `newsletter_template`;
CREATE TABLE `newsletter_template` (
  `template_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  `is_legacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Should the template render in legacy mode',
  PRIMARY KEY (`template_id`),
  KEY `NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Newsletter Template';


DROP TABLE IF EXISTS `oauth_consumer`;
CREATE TABLE `oauth_consumer` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(128) NOT NULL COMMENT 'Secret code',
  `callback_url` text COMMENT 'Callback URL',
  `rejected_callback_url` text NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAuth Consumers';

INSERT INTO `oauth_consumer` (`entity_id`, `created_at`, `updated_at`, `name`, `key`, `secret`, `callback_url`, `rejected_callback_url`) VALUES
(1,	'2023-07-16 09:39:03',	'0000-00-00 00:00:00',	'Integration1',	'yvdzoop1ryylq3b8pcw4d4rlht3c8ohr',	'0:3:rvYque38chffhVGW24fIrQyGx/NQuKryGN2TjG+gGxFhroI1CgGrSoTAGXLRwVZGmmnI8Lh8kfMTxMtr',	NULL,	'');

DROP TABLE IF EXISTS `oauth_nonce`;
CREATE TABLE `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int unsigned NOT NULL COMMENT 'Consumer ID',
  PRIMARY KEY (`nonce`,`consumer_id`),
  KEY `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  KEY `OAUTH_NONCE_TIMESTAMP` (`timestamp`),
  CONSTRAINT `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAuth Nonce';


DROP TABLE IF EXISTS `oauth_token`;
CREATE TABLE `oauth_token` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(128) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` text NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `OAUTH_TOKEN_TOKEN` (`token`),
  KEY `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  KEY `OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `OAUTH_TOKEN_CREATED_AT` (`created_at`),
  CONSTRAINT `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAuth Tokens';

INSERT INTO `oauth_token` (`entity_id`, `consumer_id`, `admin_id`, `customer_id`, `type`, `token`, `secret`, `verifier`, `callback_url`, `revoked`, `authorized`, `user_type`, `created_at`) VALUES
(1,	1,	NULL,	NULL,	'access',	'dlr6fa6fgdj09d08ec1doxtzn7x81uji',	'0:3:ZbLXqCCshPgk2Z7g469O8DAnPO7PYJsadSK+xlxLol4VH+S9JOhDE026MuF+P38kyi6Ev2QcUmSBpJZs',	'kfeeh3l0va6jgf7o5uavxyqprxsryy1b',	'oob',	0,	0,	1,	'2023-07-16 09:39:15');

DROP TABLE IF EXISTS `oauth_token_request_log`;
CREATE TABLE `oauth_token_request_log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `user_name` varchar(255) NOT NULL COMMENT 'Customer email or admin login',
  `user_type` smallint unsigned NOT NULL COMMENT 'User type (admin or customer)',
  `failures_count` smallint unsigned DEFAULT '0' COMMENT 'Number of failed authentication attempts in a row',
  `lock_expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Lock expiration time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `OAUTH_TOKEN_REQUEST_LOG_USER_NAME_USER_TYPE` (`user_name`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Log of token request authentication failures.';


DROP TABLE IF EXISTS `pagebuilder_template`;
CREATE TABLE `pagebuilder_template` (
  `template_id` int NOT NULL AUTO_INCREMENT COMMENT 'Template ID Auto Increment',
  `name` varchar(1024) NOT NULL COMMENT 'Template Name',
  `preview_image` varchar(1024) DEFAULT NULL COMMENT 'Template Preview Image',
  `template` longtext NOT NULL COMMENT 'Master Format HTML',
  `created_for` varchar(255) DEFAULT NULL COMMENT 'Created For',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`template_id`),
  FULLTEXT KEY `PAGEBUILDER_TEMPLATE_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Page Builder Templates';


DROP TABLE IF EXISTS `password_reset_request_event`;
CREATE TABLE `password_reset_request_event` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `request_type` smallint unsigned NOT NULL COMMENT 'Type of the event under a security control',
  `account_reference` varchar(255) DEFAULT NULL COMMENT 'An identifier for existing account or another target',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp when the event occurs',
  `ip` varchar(15) NOT NULL COMMENT 'Remote user IP',
  PRIMARY KEY (`id`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_ACCOUNT_REFERENCE` (`account_reference`),
  KEY `PASSWORD_RESET_REQUEST_EVENT_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Password Reset Request Event under a security control';


DROP TABLE IF EXISTS `patch_list`;
CREATE TABLE `patch_list` (
  `patch_id` int NOT NULL AUTO_INCREMENT COMMENT 'Patch Auto Increment',
  `patch_name` varchar(1024) NOT NULL COMMENT 'Patch Class Name',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='List of data/schema patches';

INSERT INTO `patch_list` (`patch_id`, `patch_name`) VALUES
(1,	'Magento\\Store\\Setup\\Patch\\Schema\\InitializeStoresAndWebsites'),
(2,	'Magento\\Catalog\\Setup\\Patch\\Schema\\EnableSegmentation'),
(3,	'Magento\\CatalogRule\\Setup\\Patch\\Schema\\CleanUpProductPriceReplicaTable'),
(4,	'Magento\\Bundle\\Setup\\Patch\\Schema\\UpdateBundleRelatedSchema'),
(5,	'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\CreateLegacyStockStatusView'),
(6,	'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\InitializeDefaultStock'),
(7,	'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\UpdateInventorySourceItem'),
(8,	'Magento\\InventoryCatalog\\Setup\\Patch\\Schema\\ReindexDefaultSource'),
(9,	'Magento\\InventorySales\\Setup\\Patch\\Schema\\InitializeWebsiteDefaultSock'),
(10,	'Magento\\Review\\Setup\\Patch\\Schema\\AddUniqueConstraintToReviewEntitySummary'),
(11,	'Magento\\TwoFactorAuth\\Setup\\Patch\\Schema\\CopyTablesFromOldModule'),
(12,	'Temando\\ShippingRemover\\Setup\\Patch\\Schema\\EmptyTablesRemoval'),
(13,	'Magento\\Store\\Setup\\Patch\\Data\\DisableSid'),
(14,	'Magento\\Store\\Setup\\Patch\\Data\\UpdateStoreGroupCodes'),
(15,	'Magento\\Config\\Setup\\Patch\\Data\\RemoveTinymceConfig'),
(16,	'Magento\\Config\\Setup\\Patch\\Data\\UnsetTinymce3'),
(17,	'Magento\\Config\\Setup\\Patch\\Data\\UpdateClassAliases'),
(18,	'Magento\\Directory\\Setup\\Patch\\Data\\InitializeDirectoryData'),
(19,	'Magento\\Directory\\Setup\\Patch\\Data\\AddCountriesCaribbeanCuracaoKosovoSintMaarten'),
(20,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForAlbania'),
(21,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForArgentina'),
(22,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCroatia'),
(23,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIndia'),
(24,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForAustralia'),
(25,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBelarus'),
(26,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBelgium'),
(27,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBolivia'),
(28,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForBulgaria'),
(29,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForChile'),
(30,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForChina'),
(31,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForColombia'),
(32,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForCzechia'),
(33,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForDenmark'),
(34,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForEcuador'),
(35,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForGreece'),
(36,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForGuyana'),
(37,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForIceland'),
(38,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForItaly'),
(39,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForMexico'),
(40,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForParaguay'),
(41,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPeru'),
(42,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPoland'),
(43,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForPortugal'),
(44,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForSuriname'),
(45,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForSweden'),
(46,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForUruguay'),
(47,	'Magento\\Directory\\Setup\\Patch\\Data\\AddDataForVenezuela'),
(48,	'Magento\\Directory\\Setup\\Patch\\Data\\UpdateRegionNamesForSwitzerland'),
(49,	'Magento\\Theme\\Setup\\Patch\\Data\\RegisterThemes'),
(50,	'Magento\\Theme\\Setup\\Patch\\Data\\ConvertSerializedData'),
(51,	'Magento\\User\\Setup\\Patch\\Data\\UpgradePasswordHashes'),
(52,	'Magento\\User\\Setup\\Patch\\Data\\UpgradeSerializedFields'),
(53,	'Magento\\Authorization\\Setup\\Patch\\Data\\InitializeAuthRoles'),
(54,	'Magento\\Eav\\Setup\\Patch\\Data\\InitializeAttributeModels'),
(55,	'Magento\\Customer\\Setup\\Patch\\Data\\DefaultCustomerGroupsAndAttributes'),
(56,	'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributesMetadata'),
(57,	'Magento\\Customer\\Setup\\Patch\\Data\\AddNonSpecifiedGenderAttributeOption'),
(58,	'Magento\\Customer\\Setup\\Patch\\Data\\UpdateIdentifierCustomerAttributesVisibility'),
(59,	'Magento\\Customer\\Setup\\Patch\\Data\\AddCustomerUpdatedAtAttribute'),
(60,	'Magento\\Customer\\Setup\\Patch\\Data\\UpgradePasswordHashAndAddress'),
(61,	'Magento\\Customer\\Setup\\Patch\\Data\\RemoveCheckoutRegisterAndUpdateAttributes'),
(62,	'Magento\\Customer\\Setup\\Patch\\Data\\AddSecurityTrackingAttributes'),
(63,	'Magento\\Customer\\Setup\\Patch\\Data\\UpdateAutocompleteOnStorefrontConfigPath'),
(64,	'Magento\\Customer\\Setup\\Patch\\Data\\MigrateStoresAllowedCountriesToWebsite'),
(65,	'Magento\\Customer\\Setup\\Patch\\Data\\ConvertValidationRulesFromSerializedToJson'),
(66,	'Magento\\Customer\\Setup\\Patch\\Data\\SessionIDColumnCleanUp'),
(67,	'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAddressAttributesSortOrder'),
(68,	'Magento\\Customer\\Setup\\Patch\\Data\\UpdateVATNumber'),
(69,	'Magento\\Customer\\Setup\\Patch\\Data\\UpdateCustomerAttributeInputFilters'),
(70,	'Magento\\Customer\\Setup\\Patch\\Data\\UpdateDefaultCustomerGroupInConfig'),
(71,	'Magento\\Indexer\\Setup\\Patch\\Data\\InitializeIndexerState'),
(72,	'Magento\\Cms\\Setup\\Patch\\Data\\CreateDefaultPages'),
(73,	'Magento\\Cms\\Setup\\Patch\\Data\\UpdatePrivacyPolicyPage'),
(74,	'Magento\\Cms\\Setup\\Patch\\Data\\ConvertWidgetConditionsToJson'),
(75,	'Magento\\Security\\Setup\\Patch\\Data\\SessionIDColumnCleanUp'),
(76,	'Magento\\Catalog\\Setup\\Patch\\Data\\InstallDefaultCategories'),
(77,	'Magento\\Catalog\\Setup\\Patch\\Data\\SetNewResourceModelsPaths'),
(78,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateDefaultAttributeValue'),
(79,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMediaAttributesBackendTypes'),
(80,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductAttributes'),
(81,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductMetaDescription'),
(82,	'Magento\\Catalog\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),
(83,	'Magento\\Catalog\\Setup\\Patch\\Data\\DisallowUsingHtmlForProductName'),
(84,	'Magento\\Catalog\\Setup\\Patch\\Data\\EnableDirectiveParsing'),
(85,	'Magento\\Catalog\\Setup\\Patch\\Data\\EnableSegmentation'),
(86,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateCustomLayoutAttributes'),
(87,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateMultiselectAttributesBackendTypes'),
(88,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductDescriptionOrder'),
(89,	'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\CreateUrlAttributes'),
(90,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpdateProductUrlKey'),
(91,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWidgetData'),
(92,	'Magento\\Catalog\\Setup\\Patch\\Data\\UpgradeWebsiteAttributes'),
(93,	'Magento\\CatalogInventory\\Setup\\Patch\\Data\\CreateDefaultStock'),
(94,	'Magento\\CatalogInventory\\Setup\\Patch\\Data\\UpdateStockItemsWebsite'),
(95,	'Magento\\CatalogInventory\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(96,	'Magento\\CatalogRule\\Setup\\Patch\\Data\\UpdateClassAliasesForCatalogRules'),
(97,	'Magento\\CatalogRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(98,	'Magento\\Msrp\\Setup\\Patch\\Data\\InitializeMsrpAttributes'),
(99,	'Magento\\Msrp\\Setup\\Patch\\Data\\ChangeMsrpAttributeLabel'),
(100,	'Magento\\Msrp\\Setup\\Patch\\Data\\ChangePriceAttributeDefaultScope'),
(101,	'Magento\\CatalogSearch\\Setup\\Patch\\Data\\MySQLSearchRemovalNotification'),
(102,	'Magento\\CatalogSearch\\Setup\\Patch\\Data\\SetInitialSearchWeightForAttributes'),
(103,	'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\UpdateUrlKeyForProducts'),
(104,	'Magento\\CatalogUrlRewrite\\Setup\\Patch\\Data\\UpdateUrlKeySearchable'),
(105,	'Magento\\Quote\\Setup\\Patch\\Data\\InstallEntityTypes'),
(106,	'Magento\\Quote\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(107,	'Magento\\Quote\\Setup\\Patch\\Data\\WishlistDataCleanUp'),
(108,	'Magento\\MediaGalleryUi\\Setup\\Patch\\Data\\AddMediaGalleryPermissions'),
(109,	'Magento\\Integration\\Setup\\Patch\\Data\\RemoveInactiveTokens'),
(110,	'Magento\\Integration\\Setup\\Patch\\Data\\UpgradeConsumerSecret'),
(111,	'Magento\\Integration\\Setup\\Patch\\Data\\UpgradeOauthToken'),
(112,	'Magento\\Sales\\Setup\\Patch\\Data\\InstallOrderStatusesAndInitialSalesConfig'),
(113,	'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypes'),
(114,	'Magento\\Sales\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(115,	'Magento\\Sales\\Setup\\Patch\\Data\\FillQuoteAddressIdInSalesOrderAddress'),
(116,	'Magento\\Sales\\Setup\\Patch\\Data\\UpdateEntityTypeModelForInvoice'),
(117,	'Magento\\Sales\\Setup\\Patch\\Data\\WishlistDataCleanUp'),
(118,	'Magento\\Checkout\\Setup\\Patch\\Data\\PrepareInitialCheckoutConfiguration'),
(119,	'Magento\\Widget\\Setup\\Patch\\Data\\UpgradeModelInstanceClassAliases'),
(120,	'Magento\\Widget\\Setup\\Patch\\Data\\ConvertSerializedData'),
(121,	'Magento\\Analytics\\Setup\\Patch\\Data\\PrepareInitialConfig'),
(122,	'Magento\\Analytics\\Setup\\Patch\\Data\\ActivateDataCollection'),
(123,	'Magento\\Downloadable\\Setup\\Patch\\Data\\AddDownloadableHostsConfig'),
(124,	'Magento\\Downloadable\\Setup\\Patch\\Data\\InstallDownloadableAttributes'),
(125,	'Magento\\Downloadable\\Setup\\Patch\\Data\\UpdateLinksExistDefaultAttributeValue'),
(126,	'Magento\\Dhl\\Setup\\Patch\\Data\\PrepareShipmentDays'),
(127,	'Magento\\Bundle\\Setup\\Patch\\Data\\ApplyAttributesUpdate'),
(128,	'Magento\\Bundle\\Setup\\Patch\\Data\\UpdateBundleRelatedEntityTypes'),
(129,	'Magento\\Elasticsearch\\Setup\\Patch\\Data\\InvalidateIndex'),
(130,	'Magento\\Email\\Setup\\Patch\\Data\\FlagLegacyTemplates'),
(131,	'Magento\\EncryptionKey\\Setup\\Patch\\Data\\SodiumChachaPatch'),
(132,	'Magento\\Fedex\\Setup\\Patch\\Data\\ConfigureFedexDefaults'),
(133,	'Magento\\GiftMessage\\Setup\\Patch\\Data\\AddGiftMessageAttributes'),
(134,	'Magento\\GiftMessage\\Setup\\Patch\\Data\\MoveGiftMessageToGiftOptionsGroup'),
(135,	'Magento\\GiftMessage\\Setup\\Patch\\Data\\UpdateGiftMessageAttribute'),
(136,	'Magento\\GroupedProduct\\Setup\\Patch\\Data\\InitializeGroupedProductLinks'),
(137,	'Magento\\GroupedProduct\\Setup\\Patch\\Data\\UpdateProductRelations'),
(138,	'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\InstallInitialConfigurableAttributes'),
(139,	'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateManufacturerAttribute'),
(140,	'Magento\\ConfigurableProduct\\Setup\\Patch\\Data\\UpdateTierPriceAttribute'),
(141,	'Magento\\InventoryLowQuantityNotification\\Setup\\Patch\\Data\\MigrateCatalogInventoryNotifyStockQuantityData'),
(142,	'Magento\\Reports\\Setup\\Patch\\Data\\InitializeReportEntityTypesAndPages'),
(143,	'Magento\\Reports\\Setup\\Patch\\Data\\ReportDisableNotification'),
(144,	'Magento\\Newsletter\\Setup\\Patch\\Data\\FlagLegacyTemplates'),
(145,	'Magento\\SalesRule\\Setup\\Patch\\Data\\PrepareRuleModelSerializedData'),
(146,	'Magento\\SalesRule\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(147,	'Magento\\SalesRule\\Setup\\Patch\\Data\\FillSalesRuleProductAttributeTable'),
(148,	'Magento\\PageBuilder\\Setup\\Patch\\Data\\UpdateProductAttribute'),
(149,	'Magento\\PageBuilder\\Setup\\Patch\\Data\\UpgradePageBuilderStripStyles'),
(150,	'Magento\\Vault\\Setup\\Patch\\Data\\SetCreditCardAsDefaultTokenType'),
(151,	'Magento\\Paypal\\Setup\\Patch\\Data\\AddPaypalOrderStatuses'),
(152,	'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateBmltoPayLater'),
(153,	'Magento\\Paypal\\Setup\\Patch\\Data\\UpdatePaypalCreditOption'),
(154,	'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateSmartButtonLabel'),
(155,	'Magento\\Paypal\\Setup\\Patch\\Data\\UpdateSmartButtonSize'),
(156,	'Magento\\ReCaptchaMigration\\Setup\\Patch\\Data\\MigrateConfigToRecaptchaModules'),
(157,	'Magento\\Review\\Setup\\Patch\\Data\\InitReviewStatusesAndData'),
(158,	'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateQuoteShippingAddresses'),
(159,	'Magento\\OfflineShipping\\Setup\\Patch\\Data\\UpdateShippingTablerate'),
(160,	'Magento\\UrlRewrite\\Setup\\Patch\\Data\\ConvertSerializedDataToJson'),
(161,	'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageAttribute'),
(162,	'Magento\\Swatches\\Setup\\Patch\\Data\\AddSwatchImageToDefaultAttribtueSet'),
(163,	'Magento\\Swatches\\Setup\\Patch\\Data\\UpdateAdminTextSwatchValues'),
(164,	'Magento\\Swatches\\Setup\\Patch\\Data\\ConvertAdditionalDataToJson'),
(165,	'Magento\\Tax\\Setup\\Patch\\Data\\AddTaxAttributeAndTaxClasses'),
(166,	'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxClassAttributeVisibility'),
(167,	'Magento\\Tax\\Setup\\Patch\\Data\\UpdateTaxRegionId'),
(168,	'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\CopyConfigFromOldModule'),
(169,	'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\EncryptConfiguration'),
(170,	'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\EncryptGoogleSecrets'),
(171,	'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\EncryptSecrets'),
(172,	'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\GenerateDuoSecurityKey'),
(173,	'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\PopulateCountryTable'),
(174,	'Magento\\TwoFactorAuth\\Setup\\Patch\\Data\\ResetU2fConfig'),
(175,	'Magento\\SampleData\\Setup\\Patch\\Data\\ClearSampleDataState'),
(176,	'Magento\\Usps\\Setup\\Patch\\Data\\UpdateAllowedMethods'),
(177,	'Magento\\Weee\\Setup\\Patch\\Data\\InitQuoteAndOrderAttributes'),
(178,	'Magento\\CurrencySymbol\\Setup\\Patch\\Data\\ConvertSerializedCustomCurrencySymbolToJson'),
(179,	'Magento\\Wishlist\\Setup\\Patch\\Data\\ConvertSerializedData'),
(180,	'Magento\\Wishlist\\Setup\\Patch\\Data\\WishlistDataCleanUp'),
(181,	'Temando\\ShippingRemover\\Setup\\Patch\\Data\\AttributesRemoval'),
(182,	'Temando\\ShippingRemover\\Setup\\Patch\\Data\\BookmarkCleaner'),
(183,	'Temando\\ShippingRemover\\Setup\\Patch\\Data\\ConfigRemoval'),
(184,	'Bookshop\\Attributes\\Setup\\Patch\\Data\\AuthorAttribute');

DROP TABLE IF EXISTS `paypal_billing_agreement`;
CREATE TABLE `paypal_billing_agreement` (
  `agreement_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement ID',
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference ID',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Billing Agreement';


DROP TABLE IF EXISTS `paypal_billing_agreement_order`;
CREATE TABLE `paypal_billing_agreement_order` (
  `agreement_id` int unsigned NOT NULL COMMENT 'Agreement ID',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGRT_ORDER_AGRT_ID_PAYPAL_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Billing Agreement Order';


DROP TABLE IF EXISTS `paypal_cert`;
CREATE TABLE `paypal_cert` (
  `cert_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `PAYPAL_CERT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Paypal Certificate Table';


DROP TABLE IF EXISTS `paypal_payment_transaction`;
CREATE TABLE `paypal_payment_transaction` (
  `transaction_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn ID',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='PayPal Payflow Link Payment Transaction';


DROP TABLE IF EXISTS `paypal_settlement_report`;
CREATE TABLE `paypal_settlement_report` (
  `report_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report ID',
  `report_date` date DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account ID',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Paypal Settlement Report Table';


DROP TABLE IF EXISTS `paypal_settlement_report_row`;
CREATE TABLE `paypal_settlement_report_row` (
  `row_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row ID',
  `report_id` int unsigned NOT NULL COMMENT 'Report ID',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction ID',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice ID',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference ID',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference ID Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer ID',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `paypal_settlement_report` (`report_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Paypal Settlement Report Row Table';


DROP TABLE IF EXISTS `persistent_session`;
CREATE TABLE `persistent_session` (
  `persistent_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session ID',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  KEY `PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  CONSTRAINT `PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Persistent Session';


DROP TABLE IF EXISTS `product_alert_price`;
CREATE TABLE `product_alert_price` (
  `alert_price_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Price amount',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `PRODUCT_ALERT_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Product Alert Price';


DROP TABLE IF EXISTS `product_alert_stock`;
CREATE TABLE `product_alert_stock` (
  `alert_stock_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  KEY `PRODUCT_ALERT_STOCK_STORE_ID` (`store_id`),
  CONSTRAINT `PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Product Alert Stock';


DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Queue name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Table storing unique queues';

INSERT INTO `queue` (`id`, `name`) VALUES
(19,	'async.operations.all'),
(15,	'codegenerator'),
(4,	'export'),
(10,	'inventory.indexer.sourceItem'),
(11,	'inventory.indexer.stock'),
(6,	'inventory.mass.update'),
(7,	'inventory.reservations.cleanup'),
(8,	'inventory.reservations.update'),
(9,	'inventory.reservations.updateSalabilityStatus'),
(5,	'inventory.source.items.cleanup'),
(12,	'media.content.synchronization'),
(13,	'media.gallery.renditions.update'),
(14,	'media.gallery.synchronization'),
(3,	'media.storage.catalog.image.resize'),
(1,	'product_action_attribute.update'),
(2,	'product_action_attribute.website.update'),
(18,	'product_alert.queue'),
(17,	'sales.rule.quote.trigger.recollect'),
(16,	'sales.rule.update.coupon.usage');

DROP TABLE IF EXISTS `queue_lock`;
CREATE TABLE `queue_lock` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `message_code` varchar(255) NOT NULL DEFAULT '' COMMENT 'Message Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_LOCK_MESSAGE_CODE` (`message_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Messages that were processed are inserted here to be locked.';


DROP TABLE IF EXISTS `queue_message`;
CREATE TABLE `queue_message` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message ID',
  `topic_name` varchar(255) DEFAULT NULL COMMENT 'Message topic',
  `body` longtext COMMENT 'Message body',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Queue messages';

INSERT INTO `queue_message` (`id`, `topic_name`, `body`) VALUES
(1,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"DDFDX145\",\"LASZU123\"],\"stock\":1}'),
(2,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"APJK123\",\"WFX135\"],\"stock\":1}'),
(3,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"DDFDX145\"],\"stock\":1}'),
(4,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"DDFDX145\"],\"stock\":1}'),
(5,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"WFX135\"],\"stock\":1}'),
(6,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"WFX135\"],\"stock\":1}'),
(7,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"WFX135\"],\"stock\":1}'),
(8,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"BGYX123\"],\"stock\":1}'),
(9,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"BGYX123\"],\"stock\":1}'),
(10,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"BGYX123\"],\"stock\":1}'),
(11,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"BGYX123\"],\"stock\":1}'),
(12,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"BGYX123\"],\"stock\":1}'),
(13,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"WFX135\",\"BGYX123\"],\"stock\":1}'),
(14,	'inventory.reservations.updateSalabilityStatus',	'{\"skus\":[\"WFX135\",\"BGYX123\"],\"stock\":1}');

DROP TABLE IF EXISTS `queue_message_status`;
CREATE TABLE `queue_message_status` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Relation ID',
  `queue_id` int unsigned NOT NULL COMMENT 'Queue ID',
  `message_id` bigint unsigned NOT NULL COMMENT 'Message ID',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `status` smallint unsigned NOT NULL COMMENT 'Message status in particular queue',
  `number_of_trials` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Number of trials to processed failed message processing',
  PRIMARY KEY (`id`),
  UNIQUE KEY `QUEUE_MESSAGE_STATUS_QUEUE_ID_MESSAGE_ID` (`queue_id`,`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` (`message_id`),
  KEY `QUEUE_MESSAGE_STATUS_STATUS_UPDATED_AT` (`status`,`updated_at`),
  CONSTRAINT `QUEUE_MESSAGE_STATUS_MESSAGE_ID_QUEUE_MESSAGE_ID` FOREIGN KEY (`message_id`) REFERENCES `queue_message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `QUEUE_MESSAGE_STATUS_QUEUE_ID_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `queue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Relation table to keep associations between queues and messages';

INSERT INTO `queue_message_status` (`id`, `queue_id`, `message_id`, `updated_at`, `status`, `number_of_trials`) VALUES
(1,	9,	1,	'2023-07-16 06:41:02',	2,	0),
(2,	9,	2,	'2023-07-16 16:13:28',	2,	0),
(3,	9,	3,	'2023-07-16 16:28:27',	2,	0),
(4,	9,	4,	'2023-07-16 16:30:56',	2,	0),
(5,	9,	5,	'2023-07-16 16:37:40',	2,	0),
(6,	9,	6,	'2023-07-16 16:38:19',	2,	0),
(7,	9,	7,	'2023-07-16 16:38:20',	2,	0),
(8,	9,	8,	'2023-07-16 16:39:46',	2,	0),
(9,	9,	9,	'2023-07-16 16:39:47',	2,	0),
(10,	9,	10,	'2023-07-16 18:14:25',	2,	0),
(11,	9,	11,	'2023-07-16 18:14:58',	2,	0),
(12,	9,	12,	'2023-07-16 18:14:59',	2,	0),
(13,	9,	13,	'2023-07-16 18:27:28',	2,	0),
(14,	9,	14,	'2023-07-16 18:27:29',	2,	0);

DROP TABLE IF EXISTS `queue_poison_pill`;
CREATE TABLE `queue_poison_pill` (
  `version` varchar(255) NOT NULL COMMENT 'Poison Pill version.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sequence table for poison pill versions';

INSERT INTO `queue_poison_pill` (`version`) VALUES
('version-64b4ccc9ef9da');

DROP TABLE IF EXISTS `quote`;
CREATE TABLE `quote` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int unsigned DEFAULT '0' COMMENT 'Orig Order ID',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(20,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `customer_tax_class_id` int unsigned DEFAULT NULL COMMENT 'Customer Tax Class ID',
  `customer_group_id` int unsigned DEFAULT '0' COMMENT 'Customer Group ID',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order ID',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `is_persistent` smallint unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  PRIMARY KEY (`entity_id`),
  KEY `QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `QUOTE_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote';

INSERT INTO `quote` (`entity_id`, `store_id`, `created_at`, `updated_at`, `converted_at`, `is_active`, `is_virtual`, `is_multi_shipping`, `items_count`, `items_qty`, `orig_order_id`, `store_to_base_rate`, `store_to_quote_rate`, `base_currency_code`, `store_currency_code`, `quote_currency_code`, `grand_total`, `base_grand_total`, `checkout_method`, `customer_id`, `customer_tax_class_id`, `customer_group_id`, `customer_email`, `customer_prefix`, `customer_firstname`, `customer_middlename`, `customer_lastname`, `customer_suffix`, `customer_dob`, `customer_note`, `customer_note_notify`, `customer_is_guest`, `remote_ip`, `applied_rule_ids`, `reserved_order_id`, `password_hash`, `coupon_code`, `global_currency_code`, `base_to_global_rate`, `base_to_quote_rate`, `customer_taxvat`, `customer_gender`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `is_changed`, `trigger_recollect`, `ext_shipping_info`, `gift_message_id`, `is_persistent`) VALUES
(1,	1,	'2023-07-14 11:40:27',	'2023-07-14 11:40:27',	NULL,	1,	0,	0,	1,	1.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	3.0000,	3.0000,	NULL,	NULL,	3,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	1,	'127.0.0.1',	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	3.0000,	3.0000,	3.0000,	3.0000,	1,	0,	NULL,	NULL,	0),
(2,	1,	'2023-07-15 12:01:06',	'2023-07-15 12:11:07',	NULL,	1,	0,	0,	1,	10.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	30.0000,	30.0000,	NULL,	NULL,	3,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	1,	'127.0.0.1',	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	30.0000,	30.0000,	30.0000,	30.0000,	1,	0,	NULL,	NULL,	0),
(3,	1,	'2023-07-16 05:30:16',	'2023-07-16 06:41:02',	NULL,	0,	0,	0,	2,	83.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	557.1000,	557.1000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	'000000001',	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	142.1000,	142.1000,	142.1000,	142.1000,	1,	0,	NULL,	NULL,	0),
(4,	1,	'2023-07-16 05:59:20',	'2023-07-16 05:59:20',	NULL,	1,	0,	0,	0,	0.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	0.0000,	0.0000,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	1,	0,	NULL,	NULL,	0),
(6,	1,	'2023-07-16 06:41:08',	'2023-07-16 10:14:45',	NULL,	1,	0,	0,	1,	14.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	58.8000,	58.8000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	58.8000,	58.8000,	58.8000,	58.8000,	1,	0,	NULL,	NULL,	0),
(7,	1,	'2023-07-16 09:20:49',	'2023-07-16 09:20:49',	NULL,	1,	0,	0,	0,	0.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	0.0000,	0.0000,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	1,	0,	NULL,	NULL,	0),
(8,	1,	'2023-07-16 15:56:25',	'2023-07-16 15:56:25',	NULL,	1,	0,	0,	0,	0.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	0.0000,	0.0000,	NULL,	1,	NULL,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	1,	0,	NULL,	NULL,	0),
(9,	1,	'2023-07-16 15:56:52',	'2023-07-16 15:56:52',	NULL,	1,	0,	0,	0,	0.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	0.0000,	0.0000,	NULL,	1,	NULL,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	1,	0,	NULL,	NULL,	0),
(10,	1,	'2023-07-16 15:58:11',	'2023-07-16 15:58:11',	NULL,	1,	0,	0,	0,	0.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	0.0000,	0.0000,	NULL,	1,	NULL,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	1,	0,	NULL,	NULL,	0),
(11,	1,	'2023-07-16 15:58:14',	'2023-07-16 15:58:14',	NULL,	1,	0,	0,	0,	0.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	0.0000,	0.0000,	NULL,	1,	NULL,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	1,	0,	NULL,	NULL,	0),
(12,	1,	'2023-07-16 15:59:26',	'2023-07-16 15:59:26',	NULL,	1,	0,	0,	0,	0.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	0.0000,	0.0000,	NULL,	1,	NULL,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	1,	0,	NULL,	NULL,	0),
(13,	1,	'2023-07-16 16:00:12',	'2023-07-16 16:00:12',	NULL,	1,	0,	0,	0,	0.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	0.0000,	0.0000,	NULL,	1,	NULL,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	1,	0,	NULL,	NULL,	0),
(14,	1,	'2023-07-16 16:04:18',	'2023-07-16 16:13:29',	NULL,	0,	0,	0,	2,	2.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	15.6000,	15.6000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	'000000002',	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	5.6000,	5.6000,	5.6000,	5.6000,	1,	0,	NULL,	NULL,	0),
(15,	1,	'2023-07-16 16:15:03',	'2023-07-16 16:15:03',	NULL,	1,	0,	0,	0,	0.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	0.0000,	0.0000,	NULL,	1,	NULL,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	1,	0,	NULL,	NULL,	0),
(16,	1,	'2023-07-16 16:24:16',	'2023-07-16 16:24:16',	NULL,	1,	0,	0,	1,	3.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	6.3000,	6.3000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	6.3000,	6.3000,	6.3000,	6.3000,	1,	0,	NULL,	NULL,	0),
(17,	1,	'2023-07-16 16:27:28',	'2023-07-16 16:28:28',	NULL,	0,	0,	0,	1,	4.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	8.4000,	8.4000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	'000000003',	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	8.4000,	8.4000,	8.4000,	8.4000,	1,	0,	NULL,	NULL,	0),
(18,	1,	'2023-07-16 16:29:12',	'2023-07-16 16:29:12',	NULL,	1,	0,	0,	1,	1.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	2.1000,	2.1000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	1,	0,	NULL,	NULL,	0),
(19,	1,	'2023-07-16 16:29:49',	'2023-07-16 18:04:39',	NULL,	1,	0,	0,	1,	1.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	2.1000,	2.1000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	1,	0,	NULL,	NULL,	0),
(20,	1,	'2023-07-16 16:30:56',	'2023-07-16 16:30:57',	NULL,	0,	0,	0,	1,	1.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	2.1000,	2.1000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	'000000004',	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	1,	0,	NULL,	NULL,	0),
(21,	1,	'2023-07-16 16:37:40',	'2023-07-16 16:37:41',	NULL,	0,	0,	0,	1,	3.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	6.3000,	6.3000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	'000000005',	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	6.3000,	6.3000,	6.3000,	6.3000,	1,	0,	NULL,	NULL,	0),
(22,	1,	'2023-07-16 16:38:19',	'2023-07-16 16:38:20',	NULL,	0,	0,	0,	1,	3.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	6.3000,	6.3000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	'000000006',	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	6.3000,	6.3000,	6.3000,	6.3000,	1,	0,	NULL,	NULL,	0),
(23,	1,	'2023-07-16 16:39:46',	'2023-07-16 16:39:47',	NULL,	0,	0,	0,	1,	3.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	12.6000,	12.6000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	'000000007',	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	12.6000,	12.6000,	12.6000,	12.6000,	1,	0,	NULL,	NULL,	0),
(24,	1,	'2023-07-16 18:14:24',	'2023-07-16 18:14:24',	NULL,	1,	0,	0,	1,	3.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	12.6000,	12.6000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	12.6000,	12.6000,	12.6000,	12.6000,	1,	0,	NULL,	NULL,	0),
(25,	1,	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	NULL,	0,	0,	0,	1,	3.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	12.6000,	12.6000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	'000000009',	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	12.6000,	12.6000,	12.6000,	12.6000,	1,	0,	NULL,	NULL,	0),
(26,	1,	'2023-07-16 18:27:28',	'2023-07-16 18:27:29',	NULL,	0,	0,	0,	2,	3.0000,	0,	0.0000,	0.0000,	'USD',	'USD',	'USD',	8.4000,	8.4000,	NULL,	1,	3,	1,	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	NULL,	1,	0,	'127.0.0.1',	NULL,	'000000010',	NULL,	NULL,	'USD',	1.0000,	1.0000,	NULL,	NULL,	8.4000,	8.4000,	8.4000,	8.4000,	1,	0,	NULL,	NULL,	0);

DROP TABLE IF EXISTS `quote_address`;
CREATE TABLE `quote_address` (
  `address_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address ID',
  `quote_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `save_in_address_book` smallint DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int unsigned DEFAULT NULL COMMENT 'Customer Address ID',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(40) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `region_id` int unsigned DEFAULT NULL COMMENT 'Region ID',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country ID',
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `same_as_billing` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(120) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text COMMENT 'Vat ID',
  `vat_is_valid` smallint DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request ID',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint DEFAULT NULL COMMENT 'Vat Request Success',
  `validated_country_code` text COMMENT 'Validated Country Code',
  `validated_vat_number` text COMMENT 'Validated Vat Number',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `free_shipping` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  PRIMARY KEY (`address_id`),
  KEY `QUOTE_ADDRESS_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Address';

INSERT INTO `quote_address` (`address_id`, `quote_id`, `created_at`, `updated_at`, `customer_id`, `save_in_address_book`, `customer_address_id`, `address_type`, `email`, `prefix`, `firstname`, `middlename`, `lastname`, `suffix`, `company`, `street`, `city`, `region`, `region_id`, `postcode`, `country_id`, `telephone`, `fax`, `same_as_billing`, `collect_shipping_rates`, `shipping_method`, `shipping_description`, `weight`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `tax_amount`, `base_tax_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `discount_amount`, `base_discount_amount`, `grand_total`, `base_grand_total`, `customer_notes`, `applied_taxes`, `discount_description`, `shipping_discount_amount`, `base_shipping_discount_amount`, `subtotal_incl_tax`, `base_subtotal_total_incl_tax`, `discount_tax_compensation_amount`, `base_discount_tax_compensation_amount`, `shipping_discount_tax_compensation_amount`, `base_shipping_discount_tax_compensation_amnt`, `shipping_incl_tax`, `base_shipping_incl_tax`, `vat_id`, `vat_is_valid`, `vat_request_id`, `vat_request_date`, `vat_request_success`, `validated_country_code`, `validated_vat_number`, `gift_message_id`, `free_shipping`) VALUES
(1,	1,	'2023-07-14 11:40:27',	'2023-07-14 11:40:27',	NULL,	0,	NULL,	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(2,	1,	'2023-07-14 11:40:27',	'2023-07-14 11:40:27',	NULL,	0,	NULL,	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	0.0000,	3.0000,	3.0000,	3.0000,	3.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	3.0000,	3.0000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	3.0000,	3.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(3,	2,	'2023-07-15 12:01:06',	'2023-07-15 12:01:06',	NULL,	0,	NULL,	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(4,	2,	'2023-07-15 12:01:06',	'2023-07-15 12:01:06',	NULL,	0,	NULL,	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	1,	NULL,	NULL,	0.0000,	30.0000,	30.0000,	30.0000,	30.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	30.0000,	30.0000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	30.0000,	30.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(6,	3,	'2023-07-16 05:30:16',	'2023-07-16 06:40:53',	1,	1,	1,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'flatrate_flatrate',	'Flat Rate - Fixed',	0.0000,	142.1000,	142.1000,	142.1000,	142.1000,	0.0000,	0.0000,	415.0000,	415.0000,	0.0000,	0.0000,	0.0000,	0.0000,	557.1000,	557.1000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	142.1000,	142.1000,	0.0000,	0.0000,	0.0000,	NULL,	415.0000,	415.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(7,	4,	'2023-07-16 05:59:20',	'2023-07-16 05:59:20',	NULL,	0,	NULL,	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(8,	4,	'2023-07-16 05:59:20',	'2023-07-16 05:59:20',	NULL,	0,	NULL,	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(11,	3,	'2023-07-16 06:41:02',	'2023-07-16 06:41:02',	1,	NULL,	1,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(12,	6,	'2023-07-16 06:41:08',	'2023-07-16 06:41:08',	1,	0,	1,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(13,	6,	'2023-07-16 06:41:08',	'2023-07-16 12:33:31',	1,	0,	1,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	1,	NULL,	NULL,	0.0000,	58.8000,	58.8000,	58.8000,	58.8000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	58.8000,	58.8000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	58.8000,	58.8000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(14,	7,	'2023-07-16 09:20:49',	'2023-07-16 09:20:49',	NULL,	0,	NULL,	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(15,	7,	'2023-07-16 09:20:49',	'2023-07-16 09:20:49',	NULL,	0,	NULL,	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(16,	8,	'2023-07-16 15:56:25',	'2023-07-16 15:56:25',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'flatrate_flatrate',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(17,	8,	'2023-07-16 15:56:25',	'2023-07-16 15:56:25',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(18,	9,	'2023-07-16 15:56:52',	'2023-07-16 15:56:52',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'flatrate_flatrate',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(19,	9,	'2023-07-16 15:56:52',	'2023-07-16 15:56:52',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(20,	10,	'2023-07-16 15:58:11',	'2023-07-16 15:58:11',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'flatrate_flatrate',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(21,	10,	'2023-07-16 15:58:11',	'2023-07-16 15:58:11',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(22,	11,	'2023-07-16 15:58:14',	'2023-07-16 15:58:14',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'flatrate_flatrate',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(23,	11,	'2023-07-16 15:58:14',	'2023-07-16 15:58:14',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(24,	12,	'2023-07-16 15:59:26',	'2023-07-16 15:59:26',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'flatrate_flatrate',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(25,	12,	'2023-07-16 15:59:26',	'2023-07-16 15:59:26',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(26,	13,	'2023-07-16 16:00:12',	'2023-07-16 16:00:12',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'flatrate_flatrate',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(27,	13,	'2023-07-16 16:00:12',	'2023-07-16 16:00:12',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(28,	14,	'2023-07-16 16:04:18',	'2023-07-16 16:07:35',	1,	0,	1,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	'flatrate_flatrate',	'Flat Rate - Fixed',	0.0000,	5.6000,	5.6000,	5.6000,	5.6000,	0.0000,	0.0000,	10.0000,	10.0000,	0.0000,	0.0000,	0.0000,	0.0000,	15.6000,	15.6000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	5.6000,	5.6000,	0.0000,	0.0000,	0.0000,	NULL,	10.0000,	10.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(29,	14,	'2023-07-16 16:04:18',	'2023-07-16 16:04:18',	1,	0,	1,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(30,	15,	'2023-07-16 16:15:03',	'2023-07-16 16:15:03',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'flatrate_flatrate',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(31,	15,	'2023-07-16 16:15:03',	'2023-07-16 16:15:03',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(32,	16,	'2023-07-16 16:24:16',	'2023-07-16 16:24:16',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'flatrate_flatrate',	NULL,	0.0000,	6.3000,	6.3000,	6.3000,	6.3000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	6.3000,	6.3000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	6.3000,	6.3000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(33,	16,	'2023-07-16 16:24:16',	'2023-07-16 16:24:16',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(34,	17,	'2023-07-16 16:27:28',	'2023-07-16 16:28:25',	1,	0,	1,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping_freeshipping',	'Free Shipping - Free',	0.0000,	8.4000,	8.4000,	8.4000,	8.4000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	8.4000,	8.4000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	8.4000,	8.4000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(36,	17,	'2023-07-16 16:28:27',	'2023-07-16 16:28:27',	1,	NULL,	1,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(37,	18,	'2023-07-16 16:29:12',	'2023-07-16 16:29:12',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping_freeshipping',	NULL,	0.0000,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	2.1000,	2.1000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(38,	18,	'2023-07-16 16:29:12',	'2023-07-16 16:29:12',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(39,	19,	'2023-07-16 16:29:49',	'2023-07-16 16:29:49',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping',	NULL,	0.0000,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	2.1000,	2.1000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(40,	19,	'2023-07-16 16:29:49',	'2023-07-16 16:29:49',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(41,	20,	'2023-07-16 16:30:56',	'2023-07-16 16:30:56',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping_freeshipping',	'Free Shipping - Free',	0.0000,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	2.1000,	2.1000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(42,	20,	'2023-07-16 16:30:56',	'2023-07-16 16:30:56',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(43,	21,	'2023-07-16 16:37:40',	'2023-07-16 16:37:40',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping_freeshipping',	'Free Shipping - Free',	0.0000,	6.3000,	6.3000,	6.3000,	6.3000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	6.3000,	6.3000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	6.3000,	6.3000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(44,	21,	'2023-07-16 16:37:40',	'2023-07-16 16:37:40',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(45,	22,	'2023-07-16 16:38:19',	'2023-07-16 16:38:19',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping_freeshipping',	'Free Shipping - Free',	0.0000,	6.3000,	6.3000,	6.3000,	6.3000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	6.3000,	6.3000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	6.3000,	6.3000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(46,	22,	'2023-07-16 16:38:19',	'2023-07-16 16:38:19',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(47,	23,	'2023-07-16 16:39:46',	'2023-07-16 16:39:46',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping_freeshipping',	'Free Shipping - Free',	0.0000,	12.6000,	12.6000,	12.6000,	12.6000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	12.6000,	12.6000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	12.6000,	12.6000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(48,	23,	'2023-07-16 16:39:46',	'2023-07-16 16:39:46',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(49,	24,	'2023-07-16 18:14:24',	'2023-07-16 18:14:24',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping_freeshipping',	'Free Shipping - Free',	0.0000,	12.6000,	12.6000,	12.6000,	12.6000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	12.6000,	12.6000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	12.6000,	12.6000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(50,	24,	'2023-07-16 18:14:24',	'2023-07-16 18:14:24',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(51,	25,	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping_freeshipping',	'Free Shipping - Free',	0.0000,	12.6000,	12.6000,	12.6000,	12.6000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	12.6000,	12.6000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	12.6000,	12.6000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(52,	25,	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(53,	26,	'2023-07-16 18:27:28',	'2023-07-16 18:27:28',	1,	0,	NULL,	'shipping',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	1,	0,	'freeshipping_freeshipping',	'Free Shipping - Free',	0.0000,	8.4000,	8.4000,	8.4000,	8.4000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	8.4000,	8.4000,	NULL,	'[]',	NULL,	0.0000,	0.0000,	8.4000,	8.4000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(54,	26,	'2023-07-16 18:27:28',	'2023-07-16 18:27:28',	1,	0,	NULL,	'billing',	'vishaltulsani5@gmail.com',	NULL,	'Vishal',	NULL,	'Tulsani',	NULL,	NULL,	'134 street\nantony colony',	'Amapa',	'Alaska',	2,	'21111',	'US',	'12345679',	NULL,	0,	0,	NULL,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	'null',	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0);

DROP TABLE IF EXISTS `quote_address_item`;
CREATE TABLE `quote_address_item` (
  `address_item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item ID',
  `parent_item_id` int unsigned DEFAULT NULL COMMENT 'Parent Item ID',
  `quote_address_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address ID',
  `quote_item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `super_product_id` int unsigned DEFAULT NULL COMMENT 'Super Product ID',
  `parent_product_id` int unsigned DEFAULT NULL COMMENT 'Parent Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `free_shipping` int unsigned DEFAULT NULL COMMENT 'Free Shipping',
  PRIMARY KEY (`address_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_address_item` (`address_item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Address Item';


DROP TABLE IF EXISTS `quote_id_mask`;
CREATE TABLE `quote_id_mask` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `quote_id` int unsigned NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ID_MASK_MASKED_ID` (`masked_id`),
  CONSTRAINT `QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Quote ID and masked ID mapping';

INSERT INTO `quote_id_mask` (`entity_id`, `quote_id`, `masked_id`) VALUES
(1,	1,	'9tpWAbQg9tTudDvWOGuuQyIHMQdyFQbd'),
(2,	2,	'fVLuKpZli1VXenihC6VVSdHhjpsYaOks');

DROP TABLE IF EXISTS `quote_item`;
CREATE TABLE `quote_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `quote_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `parent_item_id` int unsigned DEFAULT NULL COMMENT 'Parent Item ID',
  `is_virtual` smallint unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `free_shipping` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Item';

INSERT INTO `quote_item` (`item_id`, `quote_id`, `created_at`, `updated_at`, `product_id`, `store_id`, `parent_item_id`, `is_virtual`, `sku`, `name`, `description`, `applied_rule_ids`, `additional_data`, `is_qty_decimal`, `no_discount`, `weight`, `qty`, `price`, `base_price`, `custom_price`, `discount_percent`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `row_total`, `base_row_total`, `row_total_with_discount`, `row_weight`, `product_type`, `base_tax_before_discount`, `tax_before_discount`, `original_custom_price`, `redirect_url`, `base_cost`, `price_incl_tax`, `base_price_incl_tax`, `row_total_incl_tax`, `base_row_total_incl_tax`, `discount_tax_compensation_amount`, `base_discount_tax_compensation_amount`, `gift_message_id`, `free_shipping`, `weee_tax_applied`, `weee_tax_applied_amount`, `weee_tax_applied_row_amount`, `weee_tax_disposition`, `weee_tax_row_disposition`, `base_weee_tax_applied_amount`, `base_weee_tax_applied_row_amnt`, `base_weee_tax_disposition`, `base_weee_tax_row_disposition`) VALUES
(1,	1,	'2023-07-14 11:40:27',	'2023-07-14 11:40:27',	1,	1,	NULL,	0,	'Iswu124',	'It Starts with Us',	NULL,	NULL,	NULL,	0,	0,	NULL,	1.0000,	3.0000,	3.0000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	3.0000,	3.0000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	3.0000,	3.0000,	3.0000,	3.0000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	2,	'2023-07-15 12:01:06',	'2023-07-15 12:11:07',	1,	1,	NULL,	0,	'Iswu124',	'It Starts with Us',	NULL,	NULL,	NULL,	0,	0,	NULL,	10.0000,	3.0000,	3.0000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	30.0000,	30.0000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	3.0000,	3.0000,	30.0000,	30.0000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	3,	'2023-07-16 05:48:09',	'2023-07-16 05:50:20',	6,	1,	NULL,	0,	'DDFDX145',	'Dial D for Don ',	NULL,	NULL,	NULL,	0,	0,	NULL,	37.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	77.7000,	77.7000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	77.7000,	77.7000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	3,	'2023-07-16 05:59:30',	'2023-07-16 06:39:41',	8,	1,	NULL,	0,	'LASZU123',	'Life\'s Amazing Secrets: How to Find Balance and Purpose in your life',	NULL,	NULL,	NULL,	0,	0,	NULL,	46.0000,	1.4000,	1.4000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	64.4000,	64.4000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	1.4000,	1.4000,	64.4000,	64.4000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(9,	6,	'2023-07-16 06:41:08',	'2023-07-16 08:12:29',	10,	1,	NULL,	0,	'BGYX123',	'Bhagavad Gita: Yatharoop ',	NULL,	NULL,	NULL,	0,	0,	NULL,	14.0000,	4.2000,	4.2000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	58.8000,	58.8000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	4.2000,	4.2000,	58.8000,	58.8000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(10,	14,	'2023-07-16 16:06:52',	'2023-07-16 16:06:52',	7,	1,	NULL,	0,	'APJK123',	'A.P.J. Abdul Kalam ',	NULL,	NULL,	NULL,	0,	0,	NULL,	1.0000,	3.5000,	3.5000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	3.5000,	3.5000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	3.5000,	3.5000,	3.5000,	3.5000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(11,	14,	'2023-07-16 16:07:25',	'2023-07-16 16:07:25',	5,	1,	NULL,	0,	'WFX135',	'Without Fear',	NULL,	NULL,	NULL,	0,	0,	NULL,	1.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	2.1000,	2.1000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(12,	16,	'2023-07-16 16:24:16',	'2023-07-16 16:24:16',	6,	1,	NULL,	0,	'DDFDX145',	'Dial D for Don ',	NULL,	NULL,	NULL,	0,	0,	NULL,	3.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	6.3000,	6.3000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	6.3000,	6.3000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(13,	17,	'2023-07-16 16:27:28',	'2023-07-16 16:28:00',	6,	1,	NULL,	0,	'DDFDX145',	'Dial D for Don ',	NULL,	NULL,	NULL,	0,	0,	NULL,	4.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	8.4000,	8.4000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	8.4000,	8.4000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(14,	18,	'2023-07-16 16:29:12',	'2023-07-16 16:29:12',	6,	1,	NULL,	0,	'DDFDX145',	'Dial D for Don ',	NULL,	NULL,	NULL,	0,	0,	NULL,	1.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	2.1000,	2.1000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(15,	19,	'2023-07-16 16:29:49',	'2023-07-16 16:29:49',	6,	1,	NULL,	0,	'DDFDX145',	'Dial D for Don ',	NULL,	NULL,	NULL,	0,	0,	NULL,	1.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	2.1000,	2.1000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(16,	20,	'2023-07-16 16:30:56',	'2023-07-16 16:30:56',	6,	1,	NULL,	0,	'DDFDX145',	'Dial D for Don ',	NULL,	NULL,	NULL,	0,	0,	NULL,	1.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	2.1000,	2.1000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	21,	'2023-07-16 16:37:40',	'2023-07-16 16:37:40',	5,	1,	NULL,	0,	'WFX135',	'Without Fear',	NULL,	NULL,	NULL,	0,	0,	NULL,	3.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	6.3000,	6.3000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	6.3000,	6.3000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(18,	22,	'2023-07-16 16:38:19',	'2023-07-16 16:38:19',	5,	1,	NULL,	0,	'WFX135',	'Without Fear',	NULL,	NULL,	NULL,	0,	0,	NULL,	3.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	6.3000,	6.3000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	6.3000,	6.3000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(19,	23,	'2023-07-16 16:39:46',	'2023-07-16 16:39:46',	10,	1,	NULL,	0,	'BGYX123',	'Bhagavad Gita: Yatharoop ',	NULL,	NULL,	NULL,	0,	0,	NULL,	3.0000,	4.2000,	4.2000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	12.6000,	12.6000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	4.2000,	4.2000,	12.6000,	12.6000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(21,	24,	'2023-07-16 18:14:24',	'2023-07-16 18:14:24',	10,	1,	NULL,	0,	'BGYX123',	'Bhagavad Gita: Yatharoop ',	NULL,	NULL,	NULL,	0,	0,	NULL,	3.0000,	4.2000,	4.2000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	12.6000,	12.6000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	4.2000,	4.2000,	12.6000,	12.6000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(22,	25,	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	10,	1,	NULL,	0,	'BGYX123',	'Bhagavad Gita: Yatharoop ',	NULL,	NULL,	NULL,	0,	0,	NULL,	3.0000,	4.2000,	4.2000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	12.6000,	12.6000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	4.2000,	4.2000,	12.6000,	12.6000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(23,	26,	'2023-07-16 18:27:28',	'2023-07-16 18:27:28',	5,	1,	NULL,	0,	'WFX135',	'Without Fear',	NULL,	NULL,	NULL,	0,	0,	NULL,	2.0000,	2.1000,	2.1000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	4.2000,	4.2000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	4.2000,	4.2000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(24,	26,	'2023-07-16 18:27:28',	'2023-07-16 18:27:28',	10,	1,	NULL,	0,	'BGYX123',	'Bhagavad Gita: Yatharoop ',	NULL,	NULL,	NULL,	0,	0,	NULL,	1.0000,	4.2000,	4.2000,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	4.2000,	4.2000,	0.0000,	0.0000,	'simple',	NULL,	NULL,	NULL,	NULL,	NULL,	4.2000,	4.2000,	4.2000,	4.2000,	0.0000,	0.0000,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `quote_item_option`;
CREATE TABLE `quote_item_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `item_id` int unsigned NOT NULL COMMENT 'Item ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `quote_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Item Option';

INSERT INTO `quote_item_option` (`option_id`, `item_id`, `product_id`, `code`, `value`) VALUES
(1,	1,	1,	'info_buyRequest',	'{\"uenc\":\"aHR0cDovL2Rldi5tYWdlbnRvLmNvbS9pdC1zdGFydHMtd2l0aC11cy5odG1s\",\"product\":\"1\",\"selected_configurable_option\":\"\",\"related_product\":\"\",\"item\":\"1\",\"qty\":\"1\"}'),
(2,	2,	1,	'info_buyRequest',	'{\"uenc\":\"aHR0cDovL2Rldi5tYWdlbnRvLmNvbS9maWN0aW9uLWJvb2tzLmh0bWw~\",\"product\":\"1\",\"qty\":1}'),
(6,	6,	6,	'info_buyRequest',	'{\"qty\":12}'),
(7,	7,	8,	'info_buyRequest',	'{\"qty\":35}'),
(9,	9,	10,	'info_buyRequest',	'{\"uenc\":\"aHR0cDovL2Rldi5tYWdlbnRvLmNvbS9nZW5lcmFsLmh0bWw~\",\"product\":\"10\",\"qty\":1}'),
(10,	10,	7,	'info_buyRequest',	'{\"uenc\":\"aHR0cDovL2Rldi5tYWdlbnRvLmNvbS9iaW9ncmFwaHkuaHRtbA~~\",\"product\":\"7\",\"qty\":1}'),
(11,	11,	5,	'info_buyRequest',	'{\"uenc\":\"aHR0cDovL2Rldi5tYWdlbnRvLmNvbS9iaW9ncmFwaHkuaHRtbA~~\",\"product\":\"5\",\"qty\":1}'),
(12,	12,	6,	'info_buyRequest',	'{\"qty\":3}'),
(13,	13,	6,	'info_buyRequest',	'{\"qty\":3}'),
(14,	14,	6,	'info_buyRequest',	'{\"qty\":1}'),
(15,	15,	6,	'info_buyRequest',	'{\"qty\":1}'),
(16,	16,	6,	'info_buyRequest',	'{\"qty\":1}'),
(17,	17,	5,	'info_buyRequest',	'{\"qty\":3}'),
(18,	18,	5,	'info_buyRequest',	'{\"qty\":3}'),
(19,	19,	10,	'info_buyRequest',	'{\"qty\":3}'),
(21,	21,	10,	'info_buyRequest',	'{\"qty\":3}'),
(22,	22,	10,	'info_buyRequest',	'{\"qty\":3}'),
(23,	23,	5,	'info_buyRequest',	'{\"qty\":2}'),
(24,	24,	10,	'info_buyRequest',	'{\"qty\":1}');

DROP TABLE IF EXISTS `quote_payment`;
CREATE TABLE `quote_payment` (
  `payment_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment ID',
  `quote_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer ID',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation ID',
  PRIMARY KEY (`payment_id`),
  KEY `QUOTE_PAYMENT_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Payment';

INSERT INTO `quote_payment` (`payment_id`, `quote_id`, `created_at`, `updated_at`, `method`, `cc_type`, `cc_number_enc`, `cc_last_4`, `cc_cid_enc`, `cc_owner`, `cc_exp_month`, `cc_exp_year`, `cc_ss_owner`, `cc_ss_start_month`, `cc_ss_start_year`, `po_number`, `additional_data`, `cc_ss_issue`, `additional_information`, `paypal_payer_id`, `paypal_payer_status`, `paypal_correlation_id`) VALUES
(1,	3,	'2023-07-16 06:40:53',	'2023-07-16 06:40:53',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(2,	6,	'2023-07-16 09:14:24',	'2023-07-16 09:14:24',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(3,	8,	'2023-07-16 15:56:25',	'2023-07-16 15:56:25',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(4,	9,	'2023-07-16 15:56:52',	'2023-07-16 15:56:52',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(5,	10,	'2023-07-16 15:58:11',	'2023-07-16 15:58:11',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(6,	11,	'2023-07-16 15:58:14',	'2023-07-16 15:58:14',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(7,	12,	'2023-07-16 15:59:26',	'2023-07-16 15:59:26',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(8,	13,	'2023-07-16 16:00:12',	'2023-07-16 16:00:12',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(9,	14,	'2023-07-16 16:04:18',	'2023-07-16 16:04:18',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(10,	15,	'2023-07-16 16:15:03',	'2023-07-16 16:15:03',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(11,	16,	'2023-07-16 16:24:16',	'2023-07-16 16:24:16',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(12,	17,	'2023-07-16 16:27:28',	'2023-07-16 16:27:28',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(13,	18,	'2023-07-16 16:29:12',	'2023-07-16 16:29:12',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(14,	19,	'2023-07-16 16:29:49',	'2023-07-16 16:29:49',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(15,	20,	'2023-07-16 16:30:56',	'2023-07-16 16:30:56',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(16,	21,	'2023-07-16 16:37:40',	'2023-07-16 16:37:40',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(17,	22,	'2023-07-16 16:38:19',	'2023-07-16 16:38:19',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(18,	23,	'2023-07-16 16:39:46',	'2023-07-16 16:39:46',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(19,	24,	'2023-07-16 18:14:24',	'2023-07-16 18:14:24',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(20,	25,	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL),
(21,	26,	'2023-07-16 18:27:28',	'2023-07-16 18:27:28',	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	0,	0,	NULL,	NULL,	NULL,	'null',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `quote_shipping_rate`;
CREATE TABLE `quote_shipping_rate` (
  `rate_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate ID',
  `address_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Address ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`),
  CONSTRAINT `QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Quote Shipping Rate';

INSERT INTO `quote_shipping_rate` (`rate_id`, `address_id`, `created_at`, `updated_at`, `carrier`, `carrier_title`, `code`, `method`, `method_description`, `price`, `error_message`, `method_title`) VALUES
(3,	6,	'2023-07-16 06:41:02',	'2023-07-16 06:41:02',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	415.0000,	NULL,	'Fixed'),
(24,	13,	'2023-07-16 12:33:31',	'2023-07-16 12:33:31',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	70.0000,	NULL,	'Fixed'),
(28,	28,	'2023-07-16 16:07:36',	'2023-07-16 16:07:36',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	10.0000,	NULL,	'Fixed'),
(37,	34,	'2023-07-16 16:28:27',	'2023-07-16 16:28:27',	'freeshipping',	'Free Shipping',	'freeshipping_freeshipping',	'freeshipping',	NULL,	0.0000,	NULL,	'Free'),
(38,	41,	'2023-07-16 16:30:56',	'2023-07-16 16:30:56',	'freeshipping',	'Free Shipping',	'freeshipping_freeshipping',	'freeshipping',	NULL,	0.0000,	NULL,	'Free'),
(39,	41,	'2023-07-16 16:30:56',	'2023-07-16 16:30:56',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	5.0000,	NULL,	'Fixed'),
(40,	43,	'2023-07-16 16:37:40',	'2023-07-16 16:37:40',	'freeshipping',	'Free Shipping',	'freeshipping_freeshipping',	'freeshipping',	NULL,	0.0000,	NULL,	'Free'),
(41,	43,	'2023-07-16 16:37:40',	'2023-07-16 16:37:40',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	15.0000,	NULL,	'Fixed'),
(42,	45,	'2023-07-16 16:38:19',	'2023-07-16 16:38:19',	'freeshipping',	'Free Shipping',	'freeshipping_freeshipping',	'freeshipping',	NULL,	0.0000,	NULL,	'Free'),
(43,	45,	'2023-07-16 16:38:19',	'2023-07-16 16:38:19',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	15.0000,	NULL,	'Fixed'),
(44,	47,	'2023-07-16 16:39:46',	'2023-07-16 16:39:46',	'freeshipping',	'Free Shipping',	'freeshipping_freeshipping',	'freeshipping',	NULL,	0.0000,	NULL,	'Free'),
(45,	47,	'2023-07-16 16:39:46',	'2023-07-16 16:39:46',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	15.0000,	NULL,	'Fixed'),
(46,	49,	'2023-07-16 18:14:24',	'2023-07-16 18:14:24',	'freeshipping',	'Free Shipping',	'freeshipping_freeshipping',	'freeshipping',	NULL,	0.0000,	NULL,	'Free'),
(47,	49,	'2023-07-16 18:14:24',	'2023-07-16 18:14:24',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	15.0000,	NULL,	'Fixed'),
(48,	51,	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	'freeshipping',	'Free Shipping',	'freeshipping_freeshipping',	'freeshipping',	NULL,	0.0000,	NULL,	'Free'),
(49,	51,	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	15.0000,	NULL,	'Fixed'),
(50,	53,	'2023-07-16 18:27:28',	'2023-07-16 18:27:28',	'freeshipping',	'Free Shipping',	'freeshipping_freeshipping',	'freeshipping',	NULL,	0.0000,	NULL,	'Free'),
(51,	53,	'2023-07-16 18:27:28',	'2023-07-16 18:27:28',	'flatrate',	'Flat Rate',	'flatrate_flatrate',	'flatrate',	NULL,	15.0000,	NULL,	'Fixed');

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating` (
  `rating_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating ID',
  `entity_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `RATING_RATING_CODE` (`rating_code`),
  KEY `RATING_ENTITY_ID` (`entity_id`),
  CONSTRAINT `RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Ratings';

INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`, `is_active`) VALUES
(1,	1,	'Quality',	0,	1),
(2,	1,	'Value',	0,	1),
(3,	1,	'Price',	0,	1);

DROP TABLE IF EXISTS `rating_entity`;
CREATE TABLE `rating_entity` (
  `entity_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating entities';

INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES
(1,	'product'),
(2,	'product_review'),
(3,	'review');

DROP TABLE IF EXISTS `rating_option`;
CREATE TABLE `rating_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option ID',
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `RATING_OPTION_RATING_ID` (`rating_id`),
  CONSTRAINT `RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating options';

INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES
(1,	1,	'1',	1,	1),
(2,	1,	'2',	2,	2),
(3,	1,	'3',	3,	3),
(4,	1,	'4',	4,	4),
(5,	1,	'5',	5,	5),
(6,	2,	'1',	1,	1),
(7,	2,	'2',	2,	2),
(8,	2,	'3',	3,	3),
(9,	2,	'4',	4,	4),
(10,	2,	'5',	5,	5),
(11,	3,	'1',	1,	1),
(12,	3,	'2',	2,	2),
(13,	3,	'3',	3,	3),
(14,	3,	'4',	4,	4),
(15,	3,	'5',	5,	5);

DROP TABLE IF EXISTS `rating_option_vote`;
CREATE TABLE `rating_option_vote` (
  `vote_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote ID',
  `option_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option ID',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int unsigned DEFAULT '0' COMMENT 'Customer ID',
  `entity_pk_value` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `review_id` bigint unsigned DEFAULT NULL COMMENT 'Review ID',
  `percent` smallint NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  KEY `RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  CONSTRAINT `RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating option values';


DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
CREATE TABLE `rating_option_vote_aggregated` (
  `primary_id` int NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation ID',
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `entity_pk_value` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `vote_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`primary_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating vote aggregated';


DROP TABLE IF EXISTS `rating_store`;
CREATE TABLE `rating_store` (
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating Store';


DROP TABLE IF EXISTS `rating_title`;
CREATE TABLE `rating_title` (
  `rating_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Rating Title';


DROP TABLE IF EXISTS `release_notification_viewer_log`;
CREATE TABLE `release_notification_viewer_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `viewer_id` int unsigned NOT NULL COMMENT 'Viewer admin user ID',
  `last_view_version` varchar(16) NOT NULL COMMENT 'Viewer last view on product version',
  PRIMARY KEY (`id`),
  UNIQUE KEY `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID` (`viewer_id`),
  CONSTRAINT `RELEASE_NOTIFICATION_VIEWER_LOG_VIEWER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`viewer_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Release Notification Viewer Log Table';


DROP TABLE IF EXISTS `report_compared_product_index`;
CREATE TABLE `report_compared_product_index` (
  `index_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index ID',
  `visitor_id` int unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Compared Product Index Table';


DROP TABLE IF EXISTS `report_event`;
CREATE TABLE `report_event` (
  `event_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event ID',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type ID',
  `object_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Object ID',
  `subject_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Subject ID',
  `subtype` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`event_id`),
  KEY `REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `REPORT_EVENT_STORE_ID` (`store_id`),
  CONSTRAINT `REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Event Table';


DROP TABLE IF EXISTS `report_event_types`;
CREATE TABLE `report_event_types` (
  `event_type_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type ID',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Event Type Table';

INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES
(1,	'catalog_product_view',	0),
(2,	'sendfriend_product',	0),
(3,	'catalog_product_compare_add_product',	0),
(4,	'checkout_cart_add_product',	0),
(5,	'wishlist_add_product',	0),
(6,	'wishlist_share',	0);

DROP TABLE IF EXISTS `report_viewed_product_aggregated_daily`;
CREATE TABLE `report_viewed_product_aggregated_daily` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Most Viewed Products Aggregated Daily';


DROP TABLE IF EXISTS `report_viewed_product_aggregated_monthly`;
CREATE TABLE `report_viewed_product_aggregated_monthly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Most Viewed Products Aggregated Monthly';


DROP TABLE IF EXISTS `report_viewed_product_aggregated_yearly`;
CREATE TABLE `report_viewed_product_aggregated_yearly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Most Viewed Products Aggregated Yearly';


DROP TABLE IF EXISTS `report_viewed_product_index`;
CREATE TABLE `report_viewed_product_index` (
  `index_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index ID',
  `visitor_id` int unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reports Viewed Product Index Table';


DROP TABLE IF EXISTS `reporting_counts`;
CREATE TABLE `reporting_counts` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int unsigned DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for all count related events generated via the cron job';


DROP TABLE IF EXISTS `reporting_module_status`;
CREATE TABLE `reporting_module_status` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Module ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Module Status Table';


DROP TABLE IF EXISTS `reporting_orders`;
CREATE TABLE `reporting_orders` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `total` decimal(20,4) unsigned DEFAULT NULL,
  `total_base` decimal(20,4) unsigned DEFAULT NULL,
  `item_count` int unsigned NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for all orders';


DROP TABLE IF EXISTS `reporting_system_updates`;
CREATE TABLE `reporting_system_updates` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for system updates';


DROP TABLE IF EXISTS `reporting_users`;
CREATE TABLE `reporting_users` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reporting for user actions';


DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `entity_pk_value` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `status_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `REVIEW_ENTITY_ID` (`entity_id`),
  KEY `REVIEW_STATUS_ID` (`status_id`),
  KEY `REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`),
  CONSTRAINT `REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review base information';


DROP TABLE IF EXISTS `review_detail`;
CREATE TABLE `review_detail` (
  `detail_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail ID',
  `review_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Review ID',
  `store_id` smallint unsigned DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  PRIMARY KEY (`detail_id`),
  KEY `REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review detail information';


DROP TABLE IF EXISTS `review_entity`;
CREATE TABLE `review_entity` (
  `entity_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity ID',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review entities';

INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES
(1,	'product'),
(2,	'customer'),
(3,	'category');

DROP TABLE IF EXISTS `review_entity_summary`;
CREATE TABLE `review_entity_summary` (
  `primary_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity ID',
  `entity_pk_value` bigint NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `entity_type` smallint NOT NULL DEFAULT '0' COMMENT 'Entity type ID',
  `reviews_count` smallint NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`primary_id`),
  UNIQUE KEY `REVIEW_ENTITY_SUMMARY_ENTITY_PK_VALUE_STORE_ID_ENTITY_TYPE` (`entity_pk_value`,`store_id`,`entity_type`),
  KEY `REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review aggregates';


DROP TABLE IF EXISTS `review_status`;
CREATE TABLE `review_status` (
  `status_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status ID',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review statuses';

INSERT INTO `review_status` (`status_id`, `status_code`) VALUES
(1,	'Approved'),
(2,	'Pending'),
(3,	'Not Approved');

DROP TABLE IF EXISTS `review_store`;
CREATE TABLE `review_store` (
  `review_id` bigint unsigned NOT NULL COMMENT 'Review ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `REVIEW_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review Store';


DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;
CREATE TABLE `sales_bestsellers_aggregated_daily` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Bestsellers Aggregated Daily';


DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;
CREATE TABLE `sales_bestsellers_aggregated_monthly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Bestsellers Aggregated Monthly';


DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;
CREATE TABLE `sales_bestsellers_aggregated_yearly` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Bestsellers Aggregated Yearly';


DROP TABLE IF EXISTS `sales_creditmemo`;
CREATE TABLE `sales_creditmemo` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `email_sent` smallint unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint unsigned DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `invoice_id` int DEFAULT NULL COMMENT 'Invoice ID',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `SALES_CREDITMEMO_STATE` (`state`),
  KEY `SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo';


DROP TABLE IF EXISTS `sales_creditmemo_comment`;
CREATE TABLE `sales_creditmemo_comment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo Comment';


DROP TABLE IF EXISTS `sales_creditmemo_grid`;
CREATE TABLE `sales_creditmemo_grid` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint DEFAULT NULL COMMENT 'Customer Group ID',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_32B7BA885941A8254EE84AE650ABDC86` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo Grid';


DROP TABLE IF EXISTS `sales_creditmemo_item`;
CREATE TABLE `sales_creditmemo_item` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Creditmemo Item';


DROP TABLE IF EXISTS `sales_invoice`;
CREATE TABLE `sales_invoice` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(20,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `is_used_for_refund` smallint unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `email_sent` smallint unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint unsigned DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction ID',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_STATE` (`state`),
  KEY `SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `SALES_INVOICE_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice';


DROP TABLE IF EXISTS `sales_invoice_comment`;
CREATE TABLE `sales_invoice_comment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` smallint unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice Comment';


DROP TABLE IF EXISTS `sales_invoice_grid`;
CREATE TABLE `sales_invoice_grid` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `state` int DEFAULT NULL COMMENT 'State',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_GRID_STATE` (`state`),
  KEY `SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_INVOICE_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  FULLTEXT KEY `FTI_95D9C924DD6A8734EB8B5D01D60F90DE` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice Grid';


DROP TABLE IF EXISTS `sales_invoice_item`;
CREATE TABLE `sales_invoice_item` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Invoice Item';


DROP TABLE IF EXISTS `sales_invoiced_aggregated`;
CREATE TABLE `sales_invoiced_aggregated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Invoiced Aggregated';


DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;
CREATE TABLE `sales_invoiced_aggregated_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Invoiced Aggregated Order';


DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE `sales_order` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `base_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(20,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `customer_group_id` int DEFAULT NULL,
  `edit_increment` int DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint unsigned DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int DEFAULT NULL COMMENT 'Quote Address ID',
  `quote_id` int DEFAULT NULL COMMENT 'Quote ID',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(20,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(20,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(20,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer ID',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order ID',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(50) DEFAULT NULL COMMENT 'Original Increment ID',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child ID',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real ID',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent ID',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real ID',
  `remote_ip` varchar(45) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(120) DEFAULT NULL,
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `paypal_ipn_customer_notified` int DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_STATUS` (`status`),
  KEY `SALES_ORDER_STATE` (`state`),
  KEY `SALES_ORDER_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `SALES_ORDER_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order';

INSERT INTO `sales_order` (`entity_id`, `state`, `status`, `coupon_code`, `protect_code`, `shipping_description`, `is_virtual`, `store_id`, `customer_id`, `base_discount_amount`, `base_discount_canceled`, `base_discount_invoiced`, `base_discount_refunded`, `base_grand_total`, `base_shipping_amount`, `base_shipping_canceled`, `base_shipping_invoiced`, `base_shipping_refunded`, `base_shipping_tax_amount`, `base_shipping_tax_refunded`, `base_subtotal`, `base_subtotal_canceled`, `base_subtotal_invoiced`, `base_subtotal_refunded`, `base_tax_amount`, `base_tax_canceled`, `base_tax_invoiced`, `base_tax_refunded`, `base_to_global_rate`, `base_to_order_rate`, `base_total_canceled`, `base_total_invoiced`, `base_total_invoiced_cost`, `base_total_offline_refunded`, `base_total_online_refunded`, `base_total_paid`, `base_total_qty_ordered`, `base_total_refunded`, `discount_amount`, `discount_canceled`, `discount_invoiced`, `discount_refunded`, `grand_total`, `shipping_amount`, `shipping_canceled`, `shipping_invoiced`, `shipping_refunded`, `shipping_tax_amount`, `shipping_tax_refunded`, `store_to_base_rate`, `store_to_order_rate`, `subtotal`, `subtotal_canceled`, `subtotal_invoiced`, `subtotal_refunded`, `tax_amount`, `tax_canceled`, `tax_invoiced`, `tax_refunded`, `total_canceled`, `total_invoiced`, `total_offline_refunded`, `total_online_refunded`, `total_paid`, `total_qty_ordered`, `total_refunded`, `can_ship_partially`, `can_ship_partially_item`, `customer_is_guest`, `customer_note_notify`, `billing_address_id`, `customer_group_id`, `edit_increment`, `email_sent`, `send_email`, `forced_shipment_with_invoice`, `payment_auth_expiration`, `quote_address_id`, `quote_id`, `shipping_address_id`, `adjustment_negative`, `adjustment_positive`, `base_adjustment_negative`, `base_adjustment_positive`, `base_shipping_discount_amount`, `base_subtotal_incl_tax`, `base_total_due`, `payment_authorization_amount`, `shipping_discount_amount`, `subtotal_incl_tax`, `total_due`, `weight`, `customer_dob`, `increment_id`, `applied_rule_ids`, `base_currency_code`, `customer_email`, `customer_firstname`, `customer_lastname`, `customer_middlename`, `customer_prefix`, `customer_suffix`, `customer_taxvat`, `discount_description`, `ext_customer_id`, `ext_order_id`, `global_currency_code`, `hold_before_state`, `hold_before_status`, `order_currency_code`, `original_increment_id`, `relation_child_id`, `relation_child_real_id`, `relation_parent_id`, `relation_parent_real_id`, `remote_ip`, `shipping_method`, `store_currency_code`, `store_name`, `x_forwarded_for`, `customer_note`, `created_at`, `updated_at`, `total_item_count`, `customer_gender`, `discount_tax_compensation_amount`, `base_discount_tax_compensation_amount`, `shipping_discount_tax_compensation_amount`, `base_shipping_discount_tax_compensation_amnt`, `discount_tax_compensation_invoiced`, `base_discount_tax_compensation_invoiced`, `discount_tax_compensation_refunded`, `base_discount_tax_compensation_refunded`, `shipping_incl_tax`, `base_shipping_incl_tax`, `coupon_rule_name`, `gift_message_id`, `paypal_ipn_customer_notified`) VALUES
(1,	'new',	'pending',	NULL,	'02976b0fc5da94358fa8f64da98e7596',	'Flat Rate - Fixed',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	557.1000,	415.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	142.1000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	557.1000,	415.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	142.1000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	83.0000,	NULL,	NULL,	NULL,	0,	1,	2,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	3,	1,	NULL,	NULL,	NULL,	NULL,	0.0000,	142.1000,	557.1000,	NULL,	0.0000,	142.1000,	557.1000,	0.0000,	NULL,	'000000001',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'flatrate_flatrate',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 06:41:02',	'2023-07-16 06:41:02',	2,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	415.0000,	415.0000,	NULL,	NULL,	0),
(2,	'new',	'pending',	NULL,	'620902c5bdac27774fa7ec345e362e91',	'Flat Rate - Fixed',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	15.6000,	10.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	5.6000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	15.6000,	10.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	5.6000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	2.0000,	NULL,	NULL,	NULL,	0,	1,	4,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	14,	3,	NULL,	NULL,	NULL,	NULL,	0.0000,	5.6000,	15.6000,	NULL,	0.0000,	5.6000,	15.6000,	0.0000,	NULL,	'000000002',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'flatrate_flatrate',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 16:13:28',	'2023-07-16 16:13:29',	2,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	10.0000,	10.0000,	NULL,	NULL,	0),
(3,	'new',	'pending',	NULL,	'b1cb2c1db875349e25070f2f2ba9112a',	'Free Shipping - Free',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	8.4000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	8.4000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	8.4000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	8.4000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	4.0000,	NULL,	NULL,	NULL,	0,	1,	6,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	17,	5,	NULL,	NULL,	NULL,	NULL,	0.0000,	8.4000,	8.4000,	NULL,	0.0000,	8.4000,	8.4000,	0.0000,	NULL,	'000000003',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'freeshipping_freeshipping',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 16:28:27',	'2023-07-16 16:28:28',	1,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	0),
(4,	'new',	'pending',	NULL,	'2d7448eded1936466c0d6c1af39e3a41',	'Free Shipping - Free',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	2.1000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	2.1000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	2.1000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	2.1000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1.0000,	NULL,	NULL,	NULL,	0,	1,	8,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	20,	7,	NULL,	NULL,	NULL,	NULL,	0.0000,	2.1000,	2.1000,	NULL,	0.0000,	2.1000,	2.1000,	0.0000,	NULL,	'000000004',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'freeshipping_freeshipping',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 16:30:56',	'2023-07-16 16:30:57',	1,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	0),
(5,	'new',	'pending',	NULL,	'baea900fa9e71452f8450bf7e86b0a23',	'Free Shipping - Free',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	6.3000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	6.3000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	6.3000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	6.3000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3.0000,	NULL,	NULL,	NULL,	0,	1,	10,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	21,	9,	NULL,	NULL,	NULL,	NULL,	0.0000,	6.3000,	6.3000,	NULL,	0.0000,	6.3000,	6.3000,	0.0000,	NULL,	'000000005',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'freeshipping_freeshipping',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 16:37:40',	'2023-07-16 16:37:41',	1,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	0),
(6,	'new',	'pending',	NULL,	'd58a039f83e5dbec0879d3fcfd1128d4',	'Free Shipping - Free',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	6.3000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	6.3000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	6.3000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	6.3000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3.0000,	NULL,	NULL,	NULL,	0,	1,	12,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	22,	11,	NULL,	NULL,	NULL,	NULL,	0.0000,	6.3000,	6.3000,	NULL,	0.0000,	6.3000,	6.3000,	0.0000,	NULL,	'000000006',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'freeshipping_freeshipping',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 16:38:19',	'2023-07-16 16:38:20',	1,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	0),
(7,	'new',	'pending',	NULL,	'f87e9e0e7385486fa69d563a4129e2fe',	'Free Shipping - Free',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	12.6000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	12.6000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	12.6000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	12.6000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3.0000,	NULL,	NULL,	NULL,	0,	1,	14,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	23,	13,	NULL,	NULL,	NULL,	NULL,	0.0000,	12.6000,	12.6000,	NULL,	0.0000,	12.6000,	12.6000,	0.0000,	NULL,	'000000007',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'freeshipping_freeshipping',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 16:39:46',	'2023-07-16 16:39:47',	1,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	0),
(8,	'new',	'pending',	NULL,	'05886ebcad0a332b6e8be612aec9ae5a',	'Free Shipping - Free',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	12.6000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	12.6000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	12.6000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	12.6000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3.0000,	NULL,	NULL,	NULL,	0,	1,	16,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	24,	15,	NULL,	NULL,	NULL,	NULL,	0.0000,	12.6000,	12.6000,	NULL,	0.0000,	12.6000,	12.6000,	0.0000,	NULL,	'000000008',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'freeshipping_freeshipping',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 18:14:25',	'2023-07-16 18:14:25',	1,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	0),
(9,	'new',	'pending',	NULL,	'1bcf6bce720d7e8639aef7d1ff53ab67',	'Free Shipping - Free',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	12.6000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	12.6000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	12.6000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	12.6000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3.0000,	NULL,	NULL,	NULL,	0,	1,	18,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	25,	17,	NULL,	NULL,	NULL,	NULL,	0.0000,	12.6000,	12.6000,	NULL,	0.0000,	12.6000,	12.6000,	0.0000,	NULL,	'000000009',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'freeshipping_freeshipping',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	1,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	0),
(10,	'new',	'pending',	NULL,	'89a45cf4d712df3257b24ca1853d36bb',	'Free Shipping - Free',	0,	1,	1,	0.0000,	NULL,	NULL,	NULL,	8.4000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	8.4000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	1.0000,	1.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	8.4000,	0.0000,	NULL,	NULL,	NULL,	0.0000,	NULL,	0.0000,	0.0000,	8.4000,	NULL,	NULL,	NULL,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3.0000,	NULL,	NULL,	NULL,	0,	1,	20,	1,	NULL,	NULL,	1,	NULL,	NULL,	NULL,	26,	19,	NULL,	NULL,	NULL,	NULL,	0.0000,	8.4000,	8.4000,	NULL,	0.0000,	8.4000,	8.4000,	0.0000,	NULL,	'000000010',	NULL,	'USD',	'vishaltulsani5@gmail.com',	'Vishal',	'Tulsani',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'USD',	NULL,	NULL,	'USD',	NULL,	NULL,	NULL,	NULL,	NULL,	'127.0.0.1',	'freeshipping_freeshipping',	'USD',	'Main Website\nMain Website Store\nDefault Store View',	NULL,	NULL,	'2023-07-16 18:27:28',	'2023-07-16 18:27:29',	2,	NULL,	0.0000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	0);

DROP TABLE IF EXISTS `sales_order_address`;
CREATE TABLE `sales_order_address` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned DEFAULT NULL COMMENT 'Parent ID',
  `customer_address_id` int DEFAULT NULL COMMENT 'Customer Address ID',
  `quote_address_id` int DEFAULT NULL COMMENT 'Quote Address ID',
  `region_id` int DEFAULT NULL COMMENT 'Region ID',
  `customer_id` int DEFAULT NULL COMMENT 'Customer ID',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country ID',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat ID',
  `vat_is_valid` smallint DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request ID',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Address';

INSERT INTO `sales_order_address` (`entity_id`, `parent_id`, `customer_address_id`, `quote_address_id`, `region_id`, `customer_id`, `fax`, `region`, `postcode`, `lastname`, `street`, `city`, `email`, `telephone`, `country_id`, `firstname`, `address_type`, `prefix`, `middlename`, `suffix`, `company`, `vat_id`, `vat_is_valid`, `vat_request_id`, `vat_request_date`, `vat_request_success`) VALUES
(1,	1,	1,	6,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	1,	1,	11,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(3,	2,	1,	28,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(4,	2,	1,	29,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(5,	3,	1,	34,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	3,	1,	36,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	4,	NULL,	41,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	4,	NULL,	42,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(9,	5,	NULL,	43,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(10,	5,	NULL,	44,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(11,	6,	NULL,	45,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(12,	6,	NULL,	46,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(13,	7,	NULL,	47,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(14,	7,	NULL,	48,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(15,	8,	NULL,	49,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(16,	8,	NULL,	50,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	9,	NULL,	51,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(18,	9,	NULL,	52,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(19,	10,	NULL,	53,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'shipping',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(20,	10,	NULL,	54,	2,	NULL,	NULL,	'Alaska',	'21111',	'Tulsani',	'134 street\nantony colony',	'Amapa',	'vishaltulsani5@gmail.com',	'12345679',	'US',	'Vishal',	'billing',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `sales_order_aggregated_created`;
CREATE TABLE `sales_order_aggregated_created` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Aggregated Created';


DROP TABLE IF EXISTS `sales_order_aggregated_updated`;
CREATE TABLE `sales_order_aggregated_updated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Aggregated Updated';


DROP TABLE IF EXISTS `sales_order_grid`;
CREATE TABLE `sales_order_grid` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `base_grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(20,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(20,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(20,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(20,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Total Refunded',
  `pickup_location_code` varchar(255) DEFAULT NULL COMMENT 'Pickup Location Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_GRID_STATUS` (`status`),
  KEY `SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_GRID_PICKUP_LOCATION_CODE` (`pickup_location_code`),
  FULLTEXT KEY `FTI_65B9E9925EC58F0C7C2E2F6379C233E7` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Grid';

INSERT INTO `sales_order_grid` (`entity_id`, `status`, `store_id`, `store_name`, `customer_id`, `base_grand_total`, `base_total_paid`, `grand_total`, `total_paid`, `increment_id`, `base_currency_code`, `order_currency_code`, `shipping_name`, `billing_name`, `created_at`, `updated_at`, `billing_address`, `shipping_address`, `shipping_information`, `customer_email`, `customer_group`, `subtotal`, `shipping_and_handling`, `customer_name`, `payment_method`, `total_refunded`, `pickup_location_code`) VALUES
(1,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	557.1000,	NULL,	557.1000,	NULL,	'000000001',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 06:41:02',	'2023-07-16 06:41:02',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Flat Rate - Fixed',	'vishaltulsani5@gmail.com',	'1',	142.1000,	415.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL),
(2,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	15.6000,	NULL,	15.6000,	NULL,	'000000002',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 16:13:28',	'2023-07-16 16:13:28',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Flat Rate - Fixed',	'vishaltulsani5@gmail.com',	'1',	5.6000,	10.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL),
(3,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	8.4000,	NULL,	8.4000,	NULL,	'000000003',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 16:28:27',	'2023-07-16 16:28:27',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Free Shipping - Free',	'vishaltulsani5@gmail.com',	'1',	8.4000,	0.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL),
(4,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	2.1000,	NULL,	2.1000,	NULL,	'000000004',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 16:30:56',	'2023-07-16 16:30:56',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Free Shipping - Free',	'vishaltulsani5@gmail.com',	'1',	2.1000,	0.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL),
(5,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	6.3000,	NULL,	6.3000,	NULL,	'000000005',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 16:37:40',	'2023-07-16 16:37:40',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Free Shipping - Free',	'vishaltulsani5@gmail.com',	'1',	6.3000,	0.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL),
(6,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	6.3000,	NULL,	6.3000,	NULL,	'000000006',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 16:38:19',	'2023-07-16 16:38:20',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Free Shipping - Free',	'vishaltulsani5@gmail.com',	'1',	6.3000,	0.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL),
(7,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	12.6000,	NULL,	12.6000,	NULL,	'000000007',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 16:39:46',	'2023-07-16 16:39:47',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Free Shipping - Free',	'vishaltulsani5@gmail.com',	'1',	12.6000,	0.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL),
(8,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	12.6000,	NULL,	12.6000,	NULL,	'000000008',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 18:14:25',	'2023-07-16 18:14:25',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Free Shipping - Free',	'vishaltulsani5@gmail.com',	'1',	12.6000,	0.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL),
(9,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	12.6000,	NULL,	12.6000,	NULL,	'000000009',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Free Shipping - Free',	'vishaltulsani5@gmail.com',	'1',	12.6000,	0.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL),
(10,	'pending',	1,	'Main Website\nMain Website Store\nDefault Store View',	1,	8.4000,	NULL,	8.4000,	NULL,	'000000010',	'USD',	'USD',	'Vishal Tulsani',	'Vishal Tulsani',	'2023-07-16 18:27:28',	'2023-07-16 18:27:29',	'134 street\nantony colony,Amapa,Alaska,21111',	'134 street\nantony colony,Amapa,Alaska,21111',	'Free Shipping - Free',	'vishaltulsani5@gmail.com',	'1',	8.4000,	0.0000,	'Vishal Tulsani',	'checkmo',	NULL,	NULL);

DROP TABLE IF EXISTS `sales_order_item`;
CREATE TABLE `sales_order_item` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Order ID',
  `parent_item_id` int unsigned DEFAULT NULL COMMENT 'Parent Item ID',
  `quote_item_id` int unsigned DEFAULT NULL COMMENT 'Quote Item ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int unsigned DEFAULT NULL COMMENT 'Product ID',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` longtext COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(20,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(20,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item ID',
  `locked_do_invoice` smallint unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(20,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int DEFAULT NULL COMMENT 'Gift Message ID',
  `gift_message_available` int DEFAULT NULL COMMENT 'Gift Message Available',
  `free_shipping` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `SALES_ORDER_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Item';

INSERT INTO `sales_order_item` (`item_id`, `order_id`, `parent_item_id`, `quote_item_id`, `store_id`, `created_at`, `updated_at`, `product_id`, `product_type`, `product_options`, `weight`, `is_virtual`, `sku`, `name`, `description`, `applied_rule_ids`, `additional_data`, `is_qty_decimal`, `no_discount`, `qty_backordered`, `qty_canceled`, `qty_invoiced`, `qty_ordered`, `qty_refunded`, `qty_shipped`, `base_cost`, `price`, `base_price`, `original_price`, `base_original_price`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_invoiced`, `base_tax_invoiced`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `amount_refunded`, `base_amount_refunded`, `row_total`, `base_row_total`, `row_invoiced`, `base_row_invoiced`, `row_weight`, `base_tax_before_discount`, `tax_before_discount`, `ext_order_item_id`, `locked_do_invoice`, `locked_do_ship`, `price_incl_tax`, `base_price_incl_tax`, `row_total_incl_tax`, `base_row_total_incl_tax`, `discount_tax_compensation_amount`, `base_discount_tax_compensation_amount`, `discount_tax_compensation_invoiced`, `base_discount_tax_compensation_invoiced`, `discount_tax_compensation_refunded`, `base_discount_tax_compensation_refunded`, `tax_canceled`, `discount_tax_compensation_canceled`, `tax_refunded`, `base_tax_refunded`, `discount_refunded`, `base_discount_refunded`, `gift_message_id`, `gift_message_available`, `free_shipping`, `weee_tax_applied`, `weee_tax_applied_amount`, `weee_tax_applied_row_amount`, `weee_tax_disposition`, `weee_tax_row_disposition`, `base_weee_tax_applied_amount`, `base_weee_tax_applied_row_amnt`, `base_weee_tax_disposition`, `base_weee_tax_row_disposition`) VALUES
(1,	1,	NULL,	6,	1,	'2023-07-16 06:41:02',	'2023-07-16 06:41:02',	6,	'simple',	'{\"info_buyRequest\":{\"qty\":12}}',	NULL,	0,	'DDFDX145',	'Dial D for Don ',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	37.0000,	0.0000,	0.0000,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	77.7000,	77.7000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	77.7000,	77.7000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	1,	NULL,	7,	1,	'2023-07-16 06:41:02',	'2023-07-16 06:41:02',	8,	'simple',	'{\"info_buyRequest\":{\"qty\":35}}',	NULL,	0,	'LASZU123',	'Life\'s Amazing Secrets: How to Find Balance and Purpose in your life',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	46.0000,	0.0000,	0.0000,	NULL,	1.4000,	1.4000,	1.4000,	1.4000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	64.4000,	64.4000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	1.4000,	1.4000,	64.4000,	64.4000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(3,	2,	NULL,	10,	1,	'2023-07-16 16:13:28',	'2023-07-16 16:13:28',	7,	'simple',	'{\"info_buyRequest\":{\"uenc\":\"aHR0cDovL2Rldi5tYWdlbnRvLmNvbS9iaW9ncmFwaHkuaHRtbA~~\",\"product\":\"7\",\"qty\":1}}',	NULL,	0,	'APJK123',	'A.P.J. Abdul Kalam ',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	1.0000,	0.0000,	0.0000,	NULL,	3.5000,	3.5000,	3.5000,	3.5000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	3.5000,	3.5000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	3.5000,	3.5000,	3.5000,	3.5000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(4,	2,	NULL,	11,	1,	'2023-07-16 16:13:28',	'2023-07-16 16:13:28',	5,	'simple',	'{\"info_buyRequest\":{\"uenc\":\"aHR0cDovL2Rldi5tYWdlbnRvLmNvbS9iaW9ncmFwaHkuaHRtbA~~\",\"product\":\"5\",\"qty\":1}}',	NULL,	0,	'WFX135',	'Without Fear',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	1.0000,	0.0000,	0.0000,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(5,	3,	NULL,	13,	1,	'2023-07-16 16:28:27',	'2023-07-16 16:28:27',	6,	'simple',	'{\"info_buyRequest\":{\"qty\":3}}',	NULL,	0,	'DDFDX145',	'Dial D for Don ',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	4.0000,	0.0000,	0.0000,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	8.4000,	8.4000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	8.4000,	8.4000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	4,	NULL,	16,	1,	'2023-07-16 16:30:56',	'2023-07-16 16:30:56',	6,	'simple',	'{\"info_buyRequest\":{\"qty\":1}}',	NULL,	0,	'DDFDX145',	'Dial D for Don ',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	1.0000,	0.0000,	0.0000,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	5,	NULL,	17,	1,	'2023-07-16 16:37:40',	'2023-07-16 16:37:40',	5,	'simple',	'{\"info_buyRequest\":{\"qty\":3}}',	NULL,	0,	'WFX135',	'Without Fear',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	3.0000,	0.0000,	0.0000,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	6.3000,	6.3000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	6.3000,	6.3000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	6,	NULL,	18,	1,	'2023-07-16 16:38:19',	'2023-07-16 16:38:19',	5,	'simple',	'{\"info_buyRequest\":{\"qty\":3}}',	NULL,	0,	'WFX135',	'Without Fear',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	3.0000,	0.0000,	0.0000,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	6.3000,	6.3000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	6.3000,	6.3000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(9,	7,	NULL,	19,	1,	'2023-07-16 16:39:46',	'2023-07-16 16:39:46',	10,	'simple',	'{\"info_buyRequest\":{\"qty\":3}}',	NULL,	0,	'BGYX123',	'Bhagavad Gita: Yatharoop ',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	3.0000,	0.0000,	0.0000,	NULL,	4.2000,	4.2000,	4.2000,	4.2000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	12.6000,	12.6000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	4.2000,	4.2000,	12.6000,	12.6000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(10,	8,	NULL,	21,	1,	'2023-07-16 18:14:25',	'2023-07-16 18:14:25',	10,	'simple',	'{\"info_buyRequest\":{\"qty\":3}}',	NULL,	0,	'BGYX123',	'Bhagavad Gita: Yatharoop ',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	3.0000,	0.0000,	0.0000,	NULL,	4.2000,	4.2000,	4.2000,	4.2000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	12.6000,	12.6000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	4.2000,	4.2000,	12.6000,	12.6000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(11,	9,	NULL,	22,	1,	'2023-07-16 18:14:58',	'2023-07-16 18:14:58',	10,	'simple',	'{\"info_buyRequest\":{\"qty\":3}}',	NULL,	0,	'BGYX123',	'Bhagavad Gita: Yatharoop ',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	3.0000,	0.0000,	0.0000,	NULL,	4.2000,	4.2000,	4.2000,	4.2000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	12.6000,	12.6000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	4.2000,	4.2000,	12.6000,	12.6000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(12,	10,	NULL,	23,	1,	'2023-07-16 18:27:28',	'2023-07-16 18:27:28',	5,	'simple',	'{\"info_buyRequest\":{\"qty\":2}}',	NULL,	0,	'WFX135',	'Without Fear',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	2.0000,	0.0000,	0.0000,	NULL,	2.1000,	2.1000,	2.1000,	2.1000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	4.2000,	4.2000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	2.1000,	2.1000,	4.2000,	4.2000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(13,	10,	NULL,	24,	1,	'2023-07-16 18:27:28',	'2023-07-16 18:27:28',	10,	'simple',	'{\"info_buyRequest\":{\"qty\":1}}',	NULL,	0,	'BGYX123',	'Bhagavad Gita: Yatharoop ',	NULL,	NULL,	NULL,	0,	0,	NULL,	0.0000,	0.0000,	1.0000,	0.0000,	0.0000,	NULL,	4.2000,	4.2000,	4.2000,	4.2000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	0.0000,	4.2000,	4.2000,	0.0000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	4.2000,	4.2000,	4.2000,	4.2000,	0.0000,	0.0000,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `sales_order_payment`;
CREATE TABLE `sales_order_payment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `base_shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(20,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(20,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(20,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int DEFAULT NULL COMMENT 'Quote Payment ID',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans ID',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(128) DEFAULT NULL,
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans ID',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Payment';

INSERT INTO `sales_order_payment` (`entity_id`, `parent_id`, `base_shipping_captured`, `shipping_captured`, `amount_refunded`, `base_amount_paid`, `amount_canceled`, `base_amount_authorized`, `base_amount_paid_online`, `base_amount_refunded_online`, `base_shipping_amount`, `shipping_amount`, `amount_paid`, `amount_authorized`, `base_amount_ordered`, `base_shipping_refunded`, `shipping_refunded`, `base_amount_refunded`, `amount_ordered`, `base_amount_canceled`, `quote_payment_id`, `additional_data`, `cc_exp_month`, `cc_ss_start_year`, `echeck_bank_name`, `method`, `cc_debug_request_body`, `cc_secure_verify`, `protection_eligibility`, `cc_approval`, `cc_last_4`, `cc_status_description`, `echeck_type`, `cc_debug_response_serialized`, `cc_ss_start_month`, `echeck_account_type`, `last_trans_id`, `cc_cid_status`, `cc_owner`, `cc_type`, `po_number`, `cc_exp_year`, `cc_status`, `echeck_routing_number`, `account_status`, `anet_trans_method`, `cc_debug_response_body`, `cc_ss_issue`, `echeck_account_name`, `cc_avs_status`, `cc_number_enc`, `cc_trans_id`, `address_status`, `additional_information`) VALUES
(1,	1,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	415.0000,	415.0000,	NULL,	NULL,	557.1000,	NULL,	NULL,	NULL,	557.1000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}'),
(2,	2,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	10.0000,	10.0000,	NULL,	NULL,	15.6000,	NULL,	NULL,	NULL,	15.6000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}'),
(3,	3,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	8.4000,	NULL,	NULL,	NULL,	8.4000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}'),
(4,	4,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	2.1000,	NULL,	NULL,	NULL,	2.1000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}'),
(5,	5,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	6.3000,	NULL,	NULL,	NULL,	6.3000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}'),
(6,	6,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	6.3000,	NULL,	NULL,	NULL,	6.3000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}'),
(7,	7,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	12.6000,	NULL,	NULL,	NULL,	12.6000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}'),
(8,	8,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	12.6000,	NULL,	NULL,	NULL,	12.6000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}'),
(9,	9,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	12.6000,	NULL,	NULL,	NULL,	12.6000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}'),
(10,	10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0.0000,	0.0000,	NULL,	NULL,	8.4000,	NULL,	NULL,	NULL,	8.4000,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	'checkmo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'0',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'{\"method_title\":\"Check \\/ Money order\"}');

DROP TABLE IF EXISTS `sales_order_status`;
CREATE TABLE `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Status Table';

INSERT INTO `sales_order_status` (`status`, `label`) VALUES
('canceled',	'Canceled'),
('closed',	'Closed'),
('complete',	'Complete'),
('fraud',	'Suspected Fraud'),
('holded',	'On Hold'),
('payment_review',	'Payment Review'),
('paypal_canceled_reversal',	'PayPal Canceled Reversal'),
('paypal_reversed',	'PayPal Reversed'),
('pending',	'Pending'),
('pending_payment',	'Pending Payment'),
('pending_paypal',	'Pending PayPal'),
('processing',	'Processing');

DROP TABLE IF EXISTS `sales_order_status_history`;
CREATE TABLE `sales_order_status_history` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Order Status History';


DROP TABLE IF EXISTS `sales_order_status_label`;
CREATE TABLE `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Status Label Table';


DROP TABLE IF EXISTS `sales_order_status_state`;
CREATE TABLE `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`),
  CONSTRAINT `SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Status Table';

INSERT INTO `sales_order_status_state` (`status`, `state`, `is_default`, `visible_on_front`) VALUES
('canceled',	'canceled',	1,	1),
('closed',	'closed',	1,	1),
('complete',	'complete',	1,	1),
('fraud',	'payment_review',	0,	1),
('fraud',	'processing',	0,	1),
('holded',	'holded',	1,	1),
('payment_review',	'payment_review',	1,	1),
('pending',	'new',	1,	1),
('pending_payment',	'pending_payment',	1,	0),
('processing',	'processing',	1,	1);

DROP TABLE IF EXISTS `sales_order_tax`;
CREATE TABLE `sales_order_tax` (
  `tax_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax ID',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(20,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int NOT NULL COMMENT 'Priority',
  `position` int NOT NULL COMMENT 'Position',
  `base_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(20,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Tax Table';


DROP TABLE IF EXISTS `sales_order_tax_item`;
CREATE TABLE `sales_order_tax_item` (
  `tax_item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item ID',
  `tax_id` int unsigned NOT NULL COMMENT 'Tax ID',
  `item_id` int unsigned DEFAULT NULL COMMENT 'Item ID',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(20,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(20,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(20,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(20,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` (`associated_item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`associated_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Order Tax Item';


DROP TABLE IF EXISTS `sales_payment_transaction`;
CREATE TABLE `sales_payment_transaction` (
  `transaction_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction ID',
  `parent_id` int unsigned DEFAULT NULL COMMENT 'Parent ID',
  `order_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Order ID',
  `payment_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Payment ID',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn ID',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn ID',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_PAYMENT_ID_SALES_ORDER_PAYMENT_ENTT_ID` FOREIGN KEY (`payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Payment Transaction';


DROP TABLE IF EXISTS `sales_refunded_aggregated`;
CREATE TABLE `sales_refunded_aggregated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Refunded Aggregated';


DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;
CREATE TABLE `sales_refunded_aggregated_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(20,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(20,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Refunded Aggregated Order';


DROP TABLE IF EXISTS `sales_sequence_meta`;
CREATE TABLE `sales_sequence_meta` (
  `meta_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `sequence_table` varchar(64) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_sequence_meta';

INSERT INTO `sales_sequence_meta` (`meta_id`, `entity_type`, `store_id`, `sequence_table`) VALUES
(1,	'order',	0,	'sequence_order_0'),
(2,	'invoice',	0,	'sequence_invoice_0'),
(3,	'creditmemo',	0,	'sequence_creditmemo_0'),
(4,	'shipment',	0,	'sequence_shipment_0'),
(5,	'order',	1,	'sequence_order_1'),
(6,	'invoice',	1,	'sequence_invoice_1'),
(7,	'creditmemo',	1,	'sequence_creditmemo_1'),
(8,	'shipment',	1,	'sequence_shipment_1');

DROP TABLE IF EXISTS `sales_sequence_profile`;
CREATE TABLE `sales_sequence_profile` (
  `profile_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `meta_id` int unsigned NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int unsigned NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int unsigned NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int unsigned NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int unsigned NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`),
  CONSTRAINT `SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID` FOREIGN KEY (`meta_id`) REFERENCES `sales_sequence_meta` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='sales_sequence_profile';

INSERT INTO `sales_sequence_profile` (`profile_id`, `meta_id`, `prefix`, `suffix`, `start_value`, `step`, `max_value`, `warning_value`, `is_active`) VALUES
(1,	1,	NULL,	NULL,	1,	1,	4294967295,	4294966295,	1),
(2,	2,	NULL,	NULL,	1,	1,	4294967295,	4294966295,	1),
(3,	3,	NULL,	NULL,	1,	1,	4294967295,	4294966295,	1),
(4,	4,	NULL,	NULL,	1,	1,	4294967295,	4294966295,	1),
(5,	5,	NULL,	NULL,	1,	1,	4294967295,	4294966295,	1),
(6,	6,	NULL,	NULL,	1,	1,	4294967295,	4294966295,	1),
(7,	7,	NULL,	NULL,	1,	1,	4294967295,	4294966295,	1),
(8,	8,	NULL,	NULL,	1,	1,	4294967295,	4294966295,	1);

DROP TABLE IF EXISTS `sales_shipment`;
CREATE TABLE `sales_shipment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint unsigned DEFAULT NULL COMMENT 'Send Email',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `customer_id` int DEFAULT NULL COMMENT 'Customer ID',
  `shipping_address_id` int DEFAULT NULL COMMENT 'Shipping Address ID',
  `billing_address_id` int DEFAULT NULL COMMENT 'Billing Address ID',
  `shipment_status` int DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `SALES_SHIPMENT_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment';


DROP TABLE IF EXISTS `sales_shipment_comment`;
CREATE TABLE `sales_shipment_comment` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `is_customer_notified` int DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Comment';


DROP TABLE IF EXISTS `sales_shipment_grid`;
CREATE TABLE `sales_shipment_grid` (
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment ID',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Order Increment ID',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` int DEFAULT NULL,
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_SHIPMENT_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_086B40C8955F167B8EA76653437879B4` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Grid';


DROP TABLE IF EXISTS `sales_shipment_item`;
CREATE TABLE `sales_shipment_item` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `row_total` decimal(20,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(20,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int DEFAULT NULL COMMENT 'Product ID',
  `order_item_id` int DEFAULT NULL COMMENT 'Order Item ID',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Item';


DROP TABLE IF EXISTS `sales_shipment_track`;
CREATE TABLE `sales_shipment_track` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `parent_id` int unsigned NOT NULL COMMENT 'Parent ID',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Flat Shipment Track';


DROP TABLE IF EXISTS `sales_shipping_aggregated`;
CREATE TABLE `sales_shipping_aggregated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Shipping Aggregated';


DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;
CREATE TABLE `sales_shipping_aggregated_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(20,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Shipping Aggregated Order';


DROP TABLE IF EXISTS `salesrule`;
CREATE TABLE `salesrule` (
  `rule_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int unsigned NOT NULL DEFAULT '0' COMMENT 'Discount Step',
  `apply_to_shipping` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint unsigned DEFAULT NULL COMMENT 'Simple Free Shipping',
  PRIMARY KEY (`rule_id`),
  KEY `SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule';


DROP TABLE IF EXISTS `salesrule_coupon`;
CREATE TABLE `salesrule_coupon` (
  `coupon_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon ID',
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` datetime DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint DEFAULT '0' COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `SALESRULE_COUPON_RULE_ID` (`rule_id`),
  CONSTRAINT `SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Coupon';


DROP TABLE IF EXISTS `salesrule_coupon_aggregated`;
CREATE TABLE `salesrule_coupon_aggregated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALESRULE_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Coupon Aggregated';


DROP TABLE IF EXISTS `salesrule_coupon_aggregated_order`;
CREATE TABLE `salesrule_coupon_aggregated_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_1094D1FBBCBB11704A29DEF3ACC37D2B` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Coupon Aggregated Order';


DROP TABLE IF EXISTS `salesrule_coupon_aggregated_updated`;
CREATE TABLE `salesrule_coupon_aggregated_updated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_7196FA120A4F0F84E1B66605E87E213E` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Coupon Aggregated Updated';


DROP TABLE IF EXISTS `salesrule_coupon_usage`;
CREATE TABLE `salesrule_coupon_usage` (
  `coupon_id` int unsigned NOT NULL COMMENT 'Coupon ID',
  `customer_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `times_used` int unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Coupon Usage';


DROP TABLE IF EXISTS `salesrule_customer`;
CREATE TABLE `salesrule_customer` (
  `rule_customer_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer ID',
  `rule_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Rule ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `times_used` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Customer';


DROP TABLE IF EXISTS `salesrule_customer_group`;
CREATE TABLE `salesrule_customer_group` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Rules To Customer Groups Relations';


DROP TABLE IF EXISTS `salesrule_label`;
CREATE TABLE `salesrule_label` (
  `label_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label ID',
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `SALESRULE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Label';


DROP TABLE IF EXISTS `salesrule_product_attribute`;
CREATE TABLE `salesrule_product_attribute` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  `customer_group_id` int unsigned NOT NULL COMMENT 'Customer Group ID',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Salesrule Product Attribute';


DROP TABLE IF EXISTS `salesrule_website`;
CREATE TABLE `salesrule_website` (
  `rule_id` int unsigned NOT NULL COMMENT 'Rule ID',
  `website_id` smallint unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Sales Rules To Websites Relations';


DROP TABLE IF EXISTS `search_query`;
CREATE TABLE `search_query` (
  `query_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `SEARCH_QUERY_IS_PROCESSED` (`is_processed`),
  KEY `SEARCH_QUERY_STORE_ID_POPULARITY` (`store_id`,`popularity`),
  CONSTRAINT `SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Search query table';

INSERT INTO `search_query` (`query_id`, `query_text`, `num_results`, `popularity`, `redirect`, `store_id`, `display_in_terms`, `is_active`, `is_processed`, `updated_at`) VALUES
(1,	'it start',	1,	1,	NULL,	1,	1,	1,	0,	'2023-07-14 11:55:30'),
(3,	'Colleen Hoover',	1,	1,	NULL,	1,	1,	1,	0,	'2023-07-14 11:55:40'),
(5,	'Colleen',	1,	3,	NULL,	1,	1,	1,	0,	'2023-07-14 11:56:19');

DROP TABLE IF EXISTS `search_synonyms`;
CREATE TABLE `search_synonyms` (
  `group_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Synonyms Group ID',
  `synonyms` text NOT NULL COMMENT 'list of synonyms making up this group',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID - identifies the store view these synonyms belong to',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID - identifies the website ID these synonyms belong to',
  PRIMARY KEY (`group_id`),
  KEY `SEARCH_SYNONYMS_STORE_ID` (`store_id`),
  KEY `SEARCH_SYNONYMS_WEBSITE_ID` (`website_id`),
  FULLTEXT KEY `SEARCH_SYNONYMS_SYNONYMS` (`synonyms`),
  CONSTRAINT `SEARCH_SYNONYMS_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `SEARCH_SYNONYMS_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='table storing various synonyms groups';


DROP TABLE IF EXISTS `sendfriend_log`;
CREATE TABLE `sendfriend_log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `SENDFRIEND_LOG_IP` (`ip`),
  KEY `SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Send to friend function log storage table';


SET NAMES utf8mb4;

DROP TABLE IF EXISTS `sequence_creditmemo_0`;
CREATE TABLE `sequence_creditmemo_0` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sequence_creditmemo_1`;
CREATE TABLE `sequence_creditmemo_1` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sequence_invoice_0`;
CREATE TABLE `sequence_invoice_0` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sequence_invoice_1`;
CREATE TABLE `sequence_invoice_1` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sequence_order_0`;
CREATE TABLE `sequence_order_0` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sequence_order_1`;
CREATE TABLE `sequence_order_1` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sequence_order_1` (`sequence_value`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

DROP TABLE IF EXISTS `sequence_shipment_0`;
CREATE TABLE `sequence_shipment_0` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `sequence_shipment_1`;
CREATE TABLE `sequence_shipment_1` (
  `sequence_value` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Database Sessions Storage';


DROP TABLE IF EXISTS `setup_module`;
CREATE TABLE `setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Module versions registry';

INSERT INTO `setup_module` (`module`, `schema_version`, `data_version`) VALUES
('Magento_GoogleShoppingAds',	'4.0.1',	'4.0.1'),
('Magento_Securitytxt',	'1.0.0',	'1.0.0'),
('PayPal_Braintree',	'4.4.0',	'4.4.0');

DROP TABLE IF EXISTS `shipping_tablerate`;
CREATE TABLE `shipping_tablerate` (
  `pk` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int NOT NULL DEFAULT '0' COMMENT 'Destination Region ID',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(30) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Shipping Tablerate';


DROP TABLE IF EXISTS `sitemap`;
CREATE TABLE `sitemap` (
  `sitemap_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap ID',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  PRIMARY KEY (`sitemap_id`),
  KEY `SITEMAP_STORE_ID` (`store_id`),
  CONSTRAINT `SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='XML Sitemap';


DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `group_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `STORE_CODE` (`code`),
  KEY `STORE_WEBSITE_ID` (`website_id`),
  KEY `STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `STORE_GROUP_ID` (`group_id`),
  CONSTRAINT `STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `store_group` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Stores';

INSERT INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES
(0,	'admin',	0,	0,	'Admin',	0,	1),
(1,	'default',	1,	1,	'Default Store View',	0,	1);

DROP TABLE IF EXISTS `store_group`;
CREATE TABLE `store_group` (
  `group_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category ID',
  `default_store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Store group unique code',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `STORE_GROUP_CODE` (`code`),
  KEY `STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  CONSTRAINT `STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Store Groups';

INSERT INTO `store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`, `code`) VALUES
(0,	0,	'Default',	0,	0,	'default'),
(1,	1,	'Main Website Store',	2,	1,	'main_website_store');

DROP TABLE IF EXISTS `store_website`;
CREATE TABLE `store_website` (
  `website_id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group ID',
  `is_default` smallint unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `STORE_WEBSITE_CODE` (`code`),
  KEY `STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Websites';

INSERT INTO `store_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES
(0,	'admin',	'Admin',	0,	0,	0),
(1,	'base',	'Main Website',	0,	1,	1);

DROP TABLE IF EXISTS `tax_calculation`;
CREATE TABLE `tax_calculation` (
  `tax_calculation_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation ID',
  `tax_calculation_rate_id` int NOT NULL COMMENT 'Tax Calculation Rate ID',
  `tax_calculation_rule_id` int NOT NULL COMMENT 'Tax Calculation Rule ID',
  `customer_tax_class_id` smallint NOT NULL COMMENT 'Customer Tax Class ID',
  `product_tax_class_id` smallint NOT NULL COMMENT 'Product Tax Class ID',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation';


DROP TABLE IF EXISTS `tax_calculation_rate`;
CREATE TABLE `tax_calculation_rate` (
  `tax_calculation_rate_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate ID',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country ID',
  `tax_region_id` int NOT NULL COMMENT 'Tax Region ID',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `TAX_CALCULATION_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation Rate';

INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES
(1,	'US',	12,	'*',	'US-CA-*-Rate 1',	8.2500,	NULL,	NULL,	NULL),
(2,	'US',	43,	'*',	'US-NY-*-Rate 1',	8.3750,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `tax_calculation_rate_title`;
CREATE TABLE `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title ID',
  `tax_calculation_rate_id` int NOT NULL COMMENT 'Tax Calculation Rate ID',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation Rate Title';


DROP TABLE IF EXISTS `tax_calculation_rule`;
CREATE TABLE `tax_calculation_rule` (
  `tax_calculation_rule_id` int NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int NOT NULL COMMENT 'Priority',
  `position` int NOT NULL COMMENT 'Position',
  `calculate_subtotal` int NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Calculation Rule';


DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE `tax_class` (
  `class_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'Class ID',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Class';

INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES
(2,	'Taxable Goods',	'PRODUCT'),
(3,	'Retail Customer',	'CUSTOMER');

DROP TABLE IF EXISTS `tax_order_aggregated_created`;
CREATE TABLE `tax_order_aggregated_created` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Order Aggregation';


DROP TABLE IF EXISTS `tax_order_aggregated_updated`;
CREATE TABLE `tax_order_aggregated_updated` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Tax Order Aggregated Updated';


DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `theme_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int DEFAULT NULL COMMENT 'Parent ID',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Core theme';

INSERT INTO `theme` (`theme_id`, `parent_id`, `theme_path`, `theme_title`, `preview_image`, `is_featured`, `area`, `type`, `code`) VALUES
(1,	NULL,	'Magento/blank',	'Magento Blank',	'preview_image_64b0d74a31b19.jpeg',	0,	'frontend',	0,	'Magento/blank'),
(2,	1,	'Magento/luma',	'Magento Luma',	'preview_image_64b0d74a3b68d.jpeg',	0,	'frontend',	0,	'Magento/luma'),
(3,	NULL,	'Magento/backend',	'Magento 2 backend',	NULL,	0,	'adminhtml',	0,	'Magento/backend');

DROP TABLE IF EXISTS `theme_file`;
CREATE TABLE `theme_file` (
  `theme_files_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int unsigned NOT NULL COMMENT 'Theme ID',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `THEME_FILE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Core theme files';


DROP TABLE IF EXISTS `translation`;
CREATE TABLE `translation` (
  `key_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key ID of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  CONSTRAINT `TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Translations';


DROP TABLE IF EXISTS `ui_bookmark`;
CREATE TABLE `ui_bookmark` (
  `bookmark_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int unsigned NOT NULL COMMENT 'User ID',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`),
  CONSTRAINT `UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Bookmark';

INSERT INTO `ui_bookmark` (`bookmark_id`, `user_id`, `namespace`, `identifier`, `current`, `title`, `config`, `created_at`, `updated_at`) VALUES
(1,	1,	'product_listing',	'default',	1,	'Default View',	'{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"sku\":{\"visible\":true,\"sorting\":false},\"price\":{\"visible\":true,\"sorting\":false},\"websites\":{\"visible\":true,\"sorting\":false},\"qty\":{\"visible\":true,\"sorting\":false},\"short_description\":{\"visible\":false,\"sorting\":false},\"special_price\":{\"visible\":false,\"sorting\":false},\"cost\":{\"visible\":false,\"sorting\":false},\"weight\":{\"visible\":false,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keyword\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"url_key\":{\"visible\":false,\"sorting\":false},\"msrp\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"type_id\":{\"visible\":true,\"sorting\":false},\"attribute_set_id\":{\"visible\":true,\"sorting\":false},\"visibility\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"manufacturer\":{\"visible\":false,\"sorting\":false},\"color\":{\"visible\":false,\"sorting\":false},\"custom_design\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":false,\"sorting\":false},\"country_of_manufacture\":{\"visible\":false,\"sorting\":false},\"custom_layout\":{\"visible\":false,\"sorting\":false},\"gift_message_available\":{\"visible\":false,\"sorting\":false},\"tax_class_id\":{\"visible\":false,\"sorting\":false},\"salable_quantity\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false},\"updated_at\":{\"visible\":true,\"sorting\":false},\"special_from_date\":{\"visible\":false,\"sorting\":false},\"special_to_date\":{\"visible\":false,\"sorting\":false},\"news_from_date\":{\"visible\":false,\"sorting\":false},\"news_to_date\":{\"visible\":false,\"sorting\":false},\"custom_design_from\":{\"visible\":false,\"sorting\":false},\"custom_design_to\":{\"visible\":false,\"sorting\":false}},\"filters\":{\"applied\":{\"placeholder\":true}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"search\":{\"value\":\"\"},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"entity_id\":1,\"thumbnail\":2,\"name\":3,\"type_id\":4,\"attribute_set_id\":5,\"sku\":6,\"price\":7,\"qty\":8,\"salable_quantity\":9,\"visibility\":10,\"status\":11,\"websites\":12,\"short_description\":13,\"special_price\":14,\"special_from_date\":15,\"special_to_date\":16,\"cost\":17,\"weight\":18,\"manufacturer\":19,\"meta_title\":20,\"meta_keyword\":21,\"meta_description\":22,\"color\":23,\"news_from_date\":24,\"news_to_date\":25,\"custom_design\":26,\"custom_design_from\":27,\"custom_design_to\":28,\"page_layout\":29,\"country_of_manufacture\":30,\"custom_layout\":31,\"url_key\":32,\"msrp\":33,\"gift_message_available\":34,\"tax_class_id\":35,\"updated_at\":36,\"actions\":37}},\"value\":\"Default View\"}}}',	'2023-07-14 10:57:21',	'2023-07-14 10:57:21'),
(2,	1,	'product_listing',	'current',	0,	NULL,	'{\"current\":{\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"sku\":{\"visible\":true,\"sorting\":false},\"price\":{\"visible\":true,\"sorting\":false},\"websites\":{\"visible\":true,\"sorting\":false},\"qty\":{\"visible\":true,\"sorting\":false},\"short_description\":{\"visible\":false,\"sorting\":false},\"special_price\":{\"visible\":false,\"sorting\":false},\"cost\":{\"visible\":false,\"sorting\":false},\"weight\":{\"visible\":false,\"sorting\":false},\"meta_title\":{\"visible\":false,\"sorting\":false},\"meta_keyword\":{\"visible\":false,\"sorting\":false},\"meta_description\":{\"visible\":false,\"sorting\":false},\"url_key\":{\"visible\":false,\"sorting\":false},\"msrp\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"type_id\":{\"visible\":true,\"sorting\":false},\"attribute_set_id\":{\"visible\":true,\"sorting\":false},\"visibility\":{\"visible\":true,\"sorting\":false},\"status\":{\"visible\":true,\"sorting\":false},\"manufacturer\":{\"visible\":false,\"sorting\":false},\"color\":{\"visible\":false,\"sorting\":false},\"custom_design\":{\"visible\":false,\"sorting\":false},\"page_layout\":{\"visible\":false,\"sorting\":false},\"country_of_manufacture\":{\"visible\":false,\"sorting\":false},\"custom_layout\":{\"visible\":false,\"sorting\":false},\"gift_message_available\":{\"visible\":false,\"sorting\":false},\"tax_class_id\":{\"visible\":false,\"sorting\":false},\"salable_quantity\":{\"visible\":true,\"sorting\":false},\"thumbnail\":{\"visible\":true,\"sorting\":false},\"updated_at\":{\"visible\":true,\"sorting\":false},\"special_from_date\":{\"visible\":false,\"sorting\":false},\"special_to_date\":{\"visible\":false,\"sorting\":false},\"news_from_date\":{\"visible\":false,\"sorting\":false},\"news_to_date\":{\"visible\":false,\"sorting\":false},\"custom_design_from\":{\"visible\":false,\"sorting\":false},\"custom_design_to\":{\"visible\":false,\"sorting\":false},\"author\":{\"visible\":false,\"sorting\":false},\"quantity_per_source\":{\"visible\":true,\"sorting\":false}},\"filters\":{\"applied\":{\"placeholder\":true}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"search\":{\"value\":\"\"},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"entity_id\":1,\"thumbnail\":2,\"name\":3,\"type_id\":4,\"attribute_set_id\":5,\"sku\":6,\"price\":7,\"quantity_per_source\":8,\"salable_quantity\":9,\"visibility\":10,\"status\":11,\"websites\":12,\"short_description\":13,\"special_price\":14,\"special_from_date\":15,\"special_to_date\":16,\"cost\":17,\"weight\":18,\"manufacturer\":19,\"meta_title\":20,\"meta_keyword\":21,\"meta_description\":22,\"color\":23,\"news_from_date\":24,\"news_to_date\":25,\"custom_design\":26,\"custom_design_from\":27,\"custom_design_to\":28,\"page_layout\":29,\"country_of_manufacture\":30,\"custom_layout\":31,\"url_key\":32,\"msrp\":33,\"gift_message_available\":34,\"tax_class_id\":35,\"updated_at\":36,\"actions\":37,\"author\":38}}}',	'2023-07-14 10:57:23',	'2023-07-14 11:50:44'),
(3,	1,	'inventory_source_listing',	'current',	0,	NULL,	'{\"current\":{\"search\":{\"value\":\"\"},\"filters\":{\"applied\":{\"placeholder\":true}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"columns\":{\"source_code\":{\"visible\":true,\"sorting\":false},\"name\":{\"visible\":true,\"sorting\":false},\"contact_name\":{\"visible\":false,\"sorting\":false},\"email\":{\"visible\":false,\"sorting\":false},\"latitude\":{\"visible\":false,\"sorting\":false},\"longitude\":{\"visible\":false,\"sorting\":false},\"region\":{\"visible\":false,\"sorting\":false},\"city\":{\"visible\":false,\"sorting\":false},\"street\":{\"visible\":false,\"sorting\":false},\"postcode\":{\"visible\":false,\"sorting\":false},\"phone\":{\"visible\":false,\"sorting\":false},\"fax\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"enabled\":{\"visible\":true,\"sorting\":false},\"country_id\":{\"visible\":false,\"sorting\":false},\"is_pickup_location_active\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"source_code\":1,\"name\":2,\"contact_name\":3,\"enabled\":4,\"email\":5,\"is_pickup_location_active\":6,\"latitude\":7,\"longitude\":8,\"country_id\":9,\"region\":10,\"city\":11,\"street\":12,\"postcode\":13,\"phone\":14,\"fax\":15,\"actions\":16}}}',	'2023-07-14 11:38:14',	'2023-07-14 11:38:14'),
(4,	1,	'inventory_stock_listing',	'default',	1,	'Default View',	'{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"search\":{\"value\":\"\"},\"filters\":{\"applied\":{\"placeholder\":true}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"columns\":{\"stock_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"assigned_sources\":{\"visible\":true,\"sorting\":false},\"sales_channels\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"stock_id\":1,\"name\":2,\"sales_channels\":3,\"assigned_sources\":4,\"actions\":5}},\"value\":\"Default View\"}}}',	'2023-07-14 11:38:37',	'2023-07-14 11:38:37'),
(5,	1,	'inventory_stock_listing',	'current',	0,	NULL,	'{\"current\":{\"search\":{\"value\":\"\"},\"filters\":{\"applied\":{\"placeholder\":true}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"columns\":{\"stock_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"assigned_sources\":{\"visible\":true,\"sorting\":false},\"sales_channels\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"stock_id\":1,\"name\":2,\"sales_channels\":3,\"assigned_sources\":4,\"actions\":5}}}',	'2023-07-14 11:38:39',	'2023-07-14 11:38:39'),
(6,	1,	'design_config_listing',	'default',	1,	'Default View',	'{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"columns\":{\"default\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"store_website_id\":{\"visible\":true,\"sorting\":false},\"store_group_id\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"theme_theme_id\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"default\":0,\"store_website_id\":1,\"store_group_id\":2,\"store_id\":3,\"theme_theme_id\":4,\"actions\":5},\"filters\":{\"applied\":{\"placeholder\":true}}},\"value\":\"Default View\"}}}',	'2023-07-15 11:15:40',	'2023-07-15 11:15:40'),
(7,	1,	'design_config_listing',	'current',	0,	NULL,	'{\"current\":{\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"columns\":{\"default\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"store_website_id\":{\"visible\":true,\"sorting\":false},\"store_group_id\":{\"visible\":true,\"sorting\":false},\"store_id\":{\"visible\":true,\"sorting\":false},\"theme_theme_id\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"default\":0,\"store_website_id\":1,\"store_group_id\":2,\"store_id\":3,\"theme_theme_id\":4,\"actions\":5},\"filters\":{\"applied\":{\"placeholder\":true}}}}',	'2023-07-15 11:15:42',	'2023-07-15 11:15:42'),
(8,	1,	'design_theme_listing',	'default',	1,	'Default View',	'{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"columns\":{\"theme_id\":{\"visible\":false,\"sorting\":\"asc\"},\"theme_title\":{\"visible\":true,\"sorting\":false},\"parent_theme_title\":{\"visible\":true,\"sorting\":false},\"theme_path\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"theme_id\":0,\"theme_title\":1,\"parent_theme_title\":2,\"theme_path\":3,\"actions\":4}},\"value\":\"Default View\"}}}',	'2023-07-15 11:15:47',	'2023-07-15 11:15:47'),
(9,	1,	'design_theme_listing',	'current',	0,	NULL,	'{\"current\":{\"filters\":{\"applied\":{\"placeholder\":true}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"columns\":{\"theme_id\":{\"visible\":false,\"sorting\":\"asc\"},\"theme_title\":{\"visible\":true,\"sorting\":false},\"parent_theme_title\":{\"visible\":true,\"sorting\":false},\"theme_path\":{\"visible\":true,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false}},\"displayMode\":\"grid\",\"positions\":{\"theme_id\":0,\"theme_title\":1,\"parent_theme_title\":2,\"theme_path\":3,\"actions\":4}}}',	'2023-07-15 11:15:49',	'2023-07-15 11:15:49'),
(10,	1,	'customer_listing',	'default',	1,	'Default View',	'{\"views\":{\"default\":{\"label\":\"Default View\",\"index\":\"default\",\"editable\":false,\"data\":{\"search\":{\"value\":\"\"},\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"email\":{\"visible\":true,\"sorting\":false},\"billing_telephone\":{\"visible\":true,\"sorting\":false},\"billing_postcode\":{\"visible\":true,\"sorting\":false},\"billing_region\":{\"visible\":true,\"sorting\":false},\"confirmation\":{\"visible\":true,\"sorting\":false},\"created_in\":{\"visible\":true,\"sorting\":false},\"billing_full\":{\"visible\":false,\"sorting\":false},\"shipping_full\":{\"visible\":false,\"sorting\":false},\"taxvat\":{\"visible\":true,\"sorting\":false},\"billing_street\":{\"visible\":false,\"sorting\":false},\"billing_city\":{\"visible\":false,\"sorting\":false},\"billing_fax\":{\"visible\":false,\"sorting\":false},\"billing_vat_id\":{\"visible\":false,\"sorting\":false},\"billing_company\":{\"visible\":false,\"sorting\":false},\"billing_firstname\":{\"visible\":false,\"sorting\":false},\"billing_lastname\":{\"visible\":false,\"sorting\":false},\"lock_expires\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"group_id\":{\"visible\":true,\"sorting\":false},\"billing_country_id\":{\"visible\":true,\"sorting\":false},\"website_id\":{\"visible\":true,\"sorting\":false},\"gender\":{\"visible\":true,\"sorting\":false},\"created_at\":{\"visible\":true,\"sorting\":false},\"dob\":{\"visible\":true,\"sorting\":false}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"entity_id\":1,\"name\":2,\"email\":3,\"group_id\":4,\"billing_telephone\":5,\"billing_postcode\":6,\"billing_country_id\":7,\"billing_region\":8,\"created_at\":9,\"website_id\":10,\"confirmation\":11,\"created_in\":12,\"billing_full\":13,\"shipping_full\":14,\"dob\":15,\"taxvat\":16,\"gender\":17,\"billing_street\":18,\"billing_city\":19,\"billing_fax\":20,\"billing_vat_id\":21,\"billing_company\":22,\"billing_firstname\":23,\"billing_lastname\":24,\"lock_expires\":25,\"actions\":26}},\"value\":\"Default View\"}}}',	'2023-07-16 05:31:01',	'2023-07-16 05:31:01'),
(11,	1,	'customer_listing',	'current',	0,	NULL,	'{\"current\":{\"search\":{\"value\":\"\"},\"filters\":{\"applied\":{\"placeholder\":true}},\"columns\":{\"entity_id\":{\"visible\":true,\"sorting\":\"asc\"},\"name\":{\"visible\":true,\"sorting\":false},\"email\":{\"visible\":true,\"sorting\":false},\"billing_telephone\":{\"visible\":true,\"sorting\":false},\"billing_postcode\":{\"visible\":true,\"sorting\":false},\"billing_region\":{\"visible\":true,\"sorting\":false},\"confirmation\":{\"visible\":true,\"sorting\":false},\"created_in\":{\"visible\":true,\"sorting\":false},\"billing_full\":{\"visible\":false,\"sorting\":false},\"shipping_full\":{\"visible\":false,\"sorting\":false},\"taxvat\":{\"visible\":true,\"sorting\":false},\"billing_street\":{\"visible\":false,\"sorting\":false},\"billing_city\":{\"visible\":false,\"sorting\":false},\"billing_fax\":{\"visible\":false,\"sorting\":false},\"billing_vat_id\":{\"visible\":false,\"sorting\":false},\"billing_company\":{\"visible\":false,\"sorting\":false},\"billing_firstname\":{\"visible\":false,\"sorting\":false},\"billing_lastname\":{\"visible\":false,\"sorting\":false},\"lock_expires\":{\"visible\":false,\"sorting\":false},\"actions\":{\"visible\":true,\"sorting\":false},\"ids\":{\"visible\":true,\"sorting\":false},\"group_id\":{\"visible\":true,\"sorting\":false},\"billing_country_id\":{\"visible\":true,\"sorting\":false},\"website_id\":{\"visible\":true,\"sorting\":false},\"gender\":{\"visible\":true,\"sorting\":false},\"created_at\":{\"visible\":true,\"sorting\":false},\"dob\":{\"visible\":true,\"sorting\":false}},\"paging\":{\"pageSize\":20,\"current\":1,\"options\":{\"20\":{\"value\":20,\"label\":20},\"30\":{\"value\":30,\"label\":30},\"50\":{\"value\":50,\"label\":50},\"100\":{\"value\":100,\"label\":100},\"200\":{\"value\":200,\"label\":200}},\"value\":20},\"displayMode\":\"grid\",\"positions\":{\"ids\":0,\"entity_id\":1,\"name\":2,\"email\":3,\"group_id\":4,\"billing_telephone\":5,\"billing_postcode\":6,\"billing_country_id\":7,\"billing_region\":8,\"created_at\":9,\"website_id\":10,\"confirmation\":11,\"created_in\":12,\"billing_full\":13,\"shipping_full\":14,\"dob\":15,\"taxvat\":16,\"gender\":17,\"billing_street\":18,\"billing_city\":19,\"billing_fax\":20,\"billing_vat_id\":21,\"billing_company\":22,\"billing_firstname\":23,\"billing_lastname\":24,\"lock_expires\":25,\"actions\":26}}}',	'2023-07-16 05:31:02',	'2023-07-16 05:31:02');

DROP TABLE IF EXISTS `url_rewrite`;
CREATE TABLE `url_rewrite` (
  `url_rewrite_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite ID',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint unsigned NOT NULL COMMENT 'Store ID',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`),
  KEY `URL_REWRITE_ENTITY_ID` (`entity_id`),
  KEY `URL_REWRITE_IS_AUTOGENERATED_METADATA` (`is_autogenerated`,`metadata`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Url Rewrites';

INSERT INTO `url_rewrite` (`url_rewrite_id`, `entity_type`, `entity_id`, `request_path`, `target_path`, `redirect_type`, `store_id`, `description`, `is_autogenerated`, `metadata`) VALUES
(1,	'cms-page',	1,	'no-route',	'cms/page/view/page_id/1',	0,	1,	NULL,	1,	NULL),
(2,	'cms-page',	2,	'home',	'cms/page/view/page_id/2',	0,	1,	NULL,	1,	NULL),
(3,	'cms-page',	3,	'enable-cookies',	'cms/page/view/page_id/3',	0,	1,	NULL,	1,	NULL),
(4,	'cms-page',	4,	'privacy-policy-cookie-restriction-mode',	'cms/page/view/page_id/4',	0,	1,	NULL,	1,	NULL),
(5,	'category',	3,	'fiction-books.html',	'catalog/category/view/id/3',	0,	1,	NULL,	1,	NULL),
(6,	'product',	1,	'it-starts-with-us.html',	'catalog/product/view/id/1',	0,	1,	NULL,	1,	NULL),
(7,	'product',	2,	'your-time-will-come.html',	'catalog/product/view/id/2',	0,	1,	NULL,	1,	NULL),
(8,	'product',	3,	'it-ends-with-us.html',	'catalog/product/view/id/3',	0,	1,	NULL,	1,	NULL),
(9,	'product',	4,	'touch-of-eternity.html',	'catalog/product/view/id/4',	0,	1,	NULL,	1,	NULL),
(10,	'category',	4,	'biography.html',	'catalog/category/view/id/4',	0,	1,	NULL,	1,	NULL),
(11,	'product',	5,	'without-fear.html',	'catalog/product/view/id/5',	0,	1,	NULL,	1,	NULL),
(12,	'product',	6,	'dial-d-for-don.html',	'catalog/product/view/id/6',	0,	1,	NULL,	1,	NULL),
(13,	'product',	7,	'a-p-j-abdul-kalam.html',	'catalog/product/view/id/7',	0,	1,	NULL,	1,	NULL),
(14,	'category',	5,	'general.html',	'catalog/category/view/id/5',	0,	1,	NULL,	1,	NULL),
(15,	'product',	8,	'life-s-amazing-secrets-how-to-find-balance-and-purpose-in-your-life.html',	'catalog/product/view/id/8',	0,	1,	NULL,	1,	NULL),
(16,	'product',	9,	'the-power-of-your-subconscious-mind.html',	'catalog/product/view/id/9',	0,	1,	NULL,	1,	NULL),
(17,	'product',	10,	'bhagavad-gita-yatharoop.html',	'catalog/product/view/id/10',	0,	1,	NULL,	1,	NULL),
(18,	'category',	6,	'society-social-sciences.html',	'catalog/category/view/id/6',	0,	1,	NULL,	1,	NULL),
(19,	'product',	11,	'basic-elements-of-hinduism.html',	'catalog/product/view/id/11',	0,	1,	NULL,	1,	NULL),
(20,	'product',	12,	'drugs-and-human-behavior.html',	'catalog/product/view/id/12',	0,	1,	NULL,	1,	NULL),
(21,	'product',	13,	'the-psychology-book.html',	'catalog/product/view/id/13',	0,	1,	NULL,	1,	NULL),
(22,	'product',	14,	'shiva-to-shankara-giving-form-to-the-formless.html',	'catalog/product/view/id/14',	0,	1,	NULL,	1,	NULL);

DROP TABLE IF EXISTS `variable`;
CREATE TABLE `variable` (
  `variable_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable ID',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Variables';


DROP TABLE IF EXISTS `variable_value`;
CREATE TABLE `variable_value` (
  `value_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value ID',
  `variable_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Variable ID',
  `store_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `VARIABLE_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `variable` (`variable_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Variable Value';


DROP TABLE IF EXISTS `vault_payment_token`;
CREATE TABLE `vault_payment_token` (
  `entity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `customer_id` int unsigned DEFAULT NULL COMMENT 'Customer ID',
  `public_hash` varchar(128) NOT NULL COMMENT 'Hash code for using on frontend',
  `payment_method_code` varchar(128) NOT NULL COMMENT 'Payment method code',
  `type` varchar(128) NOT NULL COMMENT 'Type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `expires_at` timestamp NULL DEFAULT NULL COMMENT 'Expires At',
  `gateway_token` varchar(255) NOT NULL COMMENT 'Gateway Token',
  `details` text COMMENT 'Details',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PUBLIC_HASH` (`public_hash`),
  UNIQUE KEY `VAULT_PAYMENT_TOKEN_PAYMENT_METHOD_CODE_CSTR_ID_GATEWAY_TOKEN` (`payment_method_code`,`customer_id`,`gateway_token`),
  KEY `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  CONSTRAINT `VAULT_PAYMENT_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Vault tokens of payment';


DROP TABLE IF EXISTS `vault_payment_token_order_payment_link`;
CREATE TABLE `vault_payment_token_order_payment_link` (
  `order_payment_id` int unsigned NOT NULL COMMENT 'Order payment ID',
  `payment_token_id` int unsigned NOT NULL COMMENT 'Payment token ID',
  PRIMARY KEY (`order_payment_id`,`payment_token_id`),
  KEY `FK_4ED894655446D385894580BECA993862` (`payment_token_id`),
  CONSTRAINT `FK_4ED894655446D385894580BECA993862` FOREIGN KEY (`payment_token_id`) REFERENCES `vault_payment_token` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CF37B9D854256534BE23C818F6291CA2` FOREIGN KEY (`order_payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Order payments to vault token';


DROP TABLE IF EXISTS `weee_tax`;
CREATE TABLE `weee_tax` (
  `value_id` int NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `website_id` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `entity_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint unsigned NOT NULL COMMENT 'Attribute ID',
  PRIMARY KEY (`value_id`),
  KEY `WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `WEEE_TAX_COUNTRY` (`country`),
  KEY `WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Weee Tax';


DROP TABLE IF EXISTS `widget`;
CREATE TABLE `widget` (
  `widget_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget ID',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Preconfigured Widgets';


DROP TABLE IF EXISTS `widget_instance`;
CREATE TABLE `widget_instance` (
  `instance_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance ID',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int unsigned NOT NULL COMMENT 'Theme ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Instances of Widget for Package Theme';


DROP TABLE IF EXISTS `widget_instance_page`;
CREATE TABLE `widget_instance_page` (
  `page_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `instance_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance ID',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Instance of Widget on Page';


DROP TABLE IF EXISTS `widget_instance_page_layout`;
CREATE TABLE `widget_instance_page_layout` (
  `page_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Page ID',
  `layout_update_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update ID',
  PRIMARY KEY (`layout_update_id`,`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LYT_LYT_UPDATE_ID_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `layout_update` (`layout_update_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Layout updates';


DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist` (
  `wishlist_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `WISHLIST_SHARED` (`shared`),
  CONSTRAINT `WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Wishlist main Table';

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `shared`, `sharing_code`, `updated_at`) VALUES
(1,	1,	0,	'3wjbdC6xgIsuYceokx3EZHcgeeaTHO93',	'2023-07-16 05:30:16');

DROP TABLE IF EXISTS `wishlist_item`;
CREATE TABLE `wishlist_item` (
  `wishlist_item_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `WISHLIST_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Wishlist items';


DROP TABLE IF EXISTS `wishlist_item_option`;
CREATE TABLE `wishlist_item_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `wishlist_item_id` int unsigned NOT NULL COMMENT 'Wishlist Item ID',
  `product_id` int unsigned NOT NULL COMMENT 'Product ID',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`),
  CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Wishlist Item Option Table';


DROP TABLE IF EXISTS `inventory_stock_1`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY INVOKER VIEW `inventory_stock_1` AS select distinct `legacy_stock_status`.`product_id` AS `product_id`,`legacy_stock_status`.`website_id` AS `website_id`,`legacy_stock_status`.`stock_id` AS `stock_id`,`legacy_stock_status`.`qty` AS `quantity`,`legacy_stock_status`.`stock_status` AS `is_salable`,`product`.`sku` AS `sku` from (`cataloginventory_stock_status` `legacy_stock_status` join `catalog_product_entity` `product` on((`legacy_stock_status`.`product_id` = `product`.`entity_id`)));

-- 2023-07-17 05:25:20
