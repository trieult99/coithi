<?php
if(empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER .'logout.php');
}

$gbeLayout = "layout.tpl";
$gbeTemplate = "index.tpl";

addGlobalCSS("./assets/css/examschedule.css");

$params = array(
    'type' => "all"
);
$jsontext = callAPI("", "classroom_getSchedule.api", array(), $params);
$listSchedule = json_decode($jsontext, true);
