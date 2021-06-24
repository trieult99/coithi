<?php
$params = array(
    "classroomcode" => @$_POST["classroomcode"],
    "teachercode" => @$_POST["teachercode"],
);
$jsontext = callAPI("", "classroom_checkin.api", array(), $params);
$gbeAPIData = json_decode($jsontext, true);
echo $jsontext;
