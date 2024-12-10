<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'test');
define('DB_PASSWORD', 'test'); //bunlar var olan kulllanıcı id si şfresi bunları kullanarak mariadb ye bağlanmaya çalışcak
define('DB_HOST', 'db:3306');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
$table_prefix = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');