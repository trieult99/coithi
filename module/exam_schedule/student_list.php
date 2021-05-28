<?php
if(empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER .'logout.php');
}

$gbeLayout = "layout.tpl";
$gbeTemplate = "student_list.tpl";

addGlobalCSS("./assets/css/student_list.css");

$classroomcode = @$_GET["classroomcode"];

if ($classroomcode) {
    $params = array(
        'classroomcode' => $classroomcode
    );
    $jsontext = callAPI("", "classroom_getStudentListByClassroom.api", array(), $params);
    $data = json_decode($jsontext, true);
    $studentList = $data["data"]["studentlist"];
    $classroom = array(
        "classroomname" => $data["data"]["classroomname"],
        "supervisor1name" => $data["data"]["supervisor1name"],
        "supervisor2name" => $data["data"]["supervisor2name"],
        "subjectname" => $data["data"]["subjectname"],
        "time" => $data["data"]["time"]
    );
}   