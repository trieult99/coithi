<?php
error_reporting(E_ALL & ~E_NOTICE);
session_set_cookie_params(0, '/');
session_start();
date_default_timezone_set("Asia/Ho_Chi_Minh");

// CONFIG DOMAIN
define('HTTP_SERVER', "https://spkt.com/");
define('IMAGE_SERVER', "https://spkt.com/data/fileserver/images/");

define('IMAGE_VERSION', '1.2');
define('FILE_VERSION', '1.2');

//API CONFIGS
define('HTTP_APISERVER', "http://coithiapi.gbotweb.com/");
define('TOKEN', "1D23@@654VN");

include("system/corefunction.php");
include("system/plugin/mobile_detect.php");
include("system/plugin/crypto/crypto.php");
include("system/format.php");
include('system/sendmail.php');

define("DIR_MODULE","module/");

//CÁC BIẾN DÙNG CHUNG
$gbeSEOURL = "";
$gbeModule = "";
$gbeFunction = "";
$gbeLayout = "";
$gbeLayoutPath = "";
$gbeTemplate = "";
$gbeTemplatePath = "";
$gbeCSSList = array();
$gbeJSList = array();
$config_email = array(
    "username" => "hoaianhpkvvkp@gmail.com",
    "password" => "hoaianh123"
);
//get config info

?>