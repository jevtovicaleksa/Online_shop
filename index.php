<?php
session_name('online_shop');
session_start();


//echo "<pre>";
//print_r($_GET['url']);


require 'config.php';
require LIBS.'Router.php';
require LIBS.'Controller.php';
require LIBS.'View.php';
require LIBS.'Model.php';
require LIBS.'Database.php';

$onlineshop = new Router();

?>