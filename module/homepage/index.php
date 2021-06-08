<?php
if (empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER . 'logout.php');
}
$session = @$_SESSION;
$gbeLayout = "layout.tpl";
$gbeTemplate = "index.tpl";

addGlobalJS("./assets/js/examSchedule.js");
$params = array(
    'type' => "today"
);
$jsontext = callAPI("", "classroom_getSchedule.api", array(), $params);
$data = json_decode($jsontext, true);
$listSchedule = $data["data"];
