<?php
if (empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER . 'logout.php');
}

$gbeLayout = "layout.tpl";
$gbeTemplate = "update_fingerprint.tpl";

addGlobalCSS("./assets/css/search.css");
addGlobalJS("./assets/js/update_fingerprint.js");

$usercode =  @$_GET["teacher_code"];
$message = '';
if ($usercode) {
    $params = array(
        'usercode' => @$_GET["teacher_code"],
        'number' => @$_GET["number"],
    );
    $jsontext = callAPI("", "teacher_addFingerPrint.api", array(), $params);
    $data = json_decode($jsontext, true);
    $error = $data["error"];
    $status = $data["status"];
    $resources = $data['data'];
    if ($status) {
        $message = 'Thêm dấu vân tay thành công.';
    }
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
