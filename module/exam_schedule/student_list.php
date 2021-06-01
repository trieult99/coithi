<?php
if(empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER .'logout.php');
}
$session = @$_SESSION;
$gbeLayout = "layout.tpl";
$gbeTemplate = "student_list.tpl";
addGlobalJS("./assets/js/studentList.js");

$classroomcode = @$_GET["classroomcode"];

if ($classroomcode) {
    $params = array(
        'classroomcode' => $classroomcode
    );
    $jsontext = callAPI("", "classroom_getStudentListByClassroom.api", array(), $params);
    $data = json_decode($jsontext, true);
    $classroom = $data["data"];
    $studentList = $classroom["studentlist"];
}   