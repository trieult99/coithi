<?php
if(empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER .'logout.php');
}

$gbeLayout = "layout.tpl";
$gbeTemplate = "index.tpl";

addGlobalCSS("./assets/css/homepage.css");

// $jsontext = callAPI("client","order_getOrderListHomePage.api");
// $listOrderHomePage = json_decode($jsontext, true)['data'];

// $listCheckinList = "";
// if($_SESSION['loginusertypecode'] == 'teamleader' || $_SESSION['loginusertypecode'] == 'admin'){
//     $jsontext = callAPI("client","user_getCheckedUser.api");
//     $listCheckinList = json_decode($jsontext, true)['data'];
// }
