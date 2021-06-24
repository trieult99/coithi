<?php
if (empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER . 'logout.php');
}

$gbeLayout = "layout.tpl";
$gbeTemplate = "search_mssv.tpl";

addGlobalCSS("./assets/css/search.css");
var_dump('aaa');


$mssv = @$_GET["mssv"];
if ($mssv) {
    $params = array(
        'mssv' => $mssv
    );
    $jsontext = callAPI("", "student_getStudentDetails.api", array(), $params);
    $data = json_decode($jsontext, true);
    $studentInfo = $data["data"]["student_info"];
    $studentSchedules = $data["data"]["student_schedule"];
    $error = $data["error"];
}
