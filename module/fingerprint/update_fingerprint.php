<?php
if (empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER . 'logout.php');
}

$gbeLayout = "layout.tpl";
$gbeTemplate = "update_fingerprint.tpl";

addGlobalCSS("./assets/css/search.css");
addGlobalJS("./assets/js/update_fingerprint.js");
$jsontext = callAPI("", "teacher_getTeacherDetailByFingerprint.api", array(), array());
$data = json_decode($jsontext, true);
$error = $data["error"];
$status = $data["status"];
$resources = $data['data'];
$message = '';

if (!empty($resources)) {
    $message = $resources['fullname'].' - Khoa '.$resources['departmentname'];
}


$jsontext = callAPI("", "teacher_getDepartmentList.api", array(), array());
$data = json_decode($jsontext, true);
$Department_List = $data["data"];

$departmentcode = $Department_List[0]['departmentcode'];

// if( @$_GET["teacher_department"]) {
//     $departmentcode = $_GET["teacher_department"];
// }

$params = array(
     'departmentcode' => $departmentcode
);

$jsontext = callAPI("", "teacher_getTeacherListGroupByDepartment.api", array(), $params);
$data = json_decode($jsontext, true);
$Teacher_List = $data["data"];