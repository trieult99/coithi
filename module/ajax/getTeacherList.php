<?php
$params = array(
    "classroomcode" => @$_POST["classroomcode"],
);
$jsontext = callAPI("", "teacher_getTeacherList.api", array(), $params);
$gbeAPIData = json_decode($jsontext, true);
echo $jsontext;
