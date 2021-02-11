<?php
session_name('online_shop_admin');
session_start();


require 'config.php';
require LIBS.'Router.php';
require LIBS.'Admin_Controller.php';
require LIBS.'Admin_View.php';
require LIBS.'Admin_Model.php';
require LIBS.'Database.php';

$onlineshop = new Router('admin');
?>