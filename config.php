<?php
define('URL', 'http://localhost/onlineshop/');
define('ADMIN_URL', URL . 'admin/');

$basePath = realpath(dirname(__FILE__)) . '/';
define('BASE_PATH', $basePath);
define('LIBS', BASE_PATH.'libs/');

define('DB_TYPE', 'mysql');
define('DB_HOST', 'localhost');
define('DB_NAME', 'onlineshop');
define('DB_USER', 'root');
define('DB_PASS', '1');

define('SMTP_SERVER', 'smtp.gmail.com');
define('SMTP_USER', '');
define('SMTP_PASSWORD', '');
define('SMTP_PORT', '465');
define('SMTP_SSL', 1);