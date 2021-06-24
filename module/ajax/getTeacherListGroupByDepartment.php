<?php
$params = array(
    "departmentcode" => @$_POST["departmentcode"],
);
$jsontext = callAPI("", "teacher_getTeacherListGroupByDepartment.api", array(), $params);
$gbeAPIData = json_decode($jsontext, true);
echo $jsontext;
