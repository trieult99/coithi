<?php
$params = array(
    "classroomcode" => @$_POST["classroomcode"],
    "mssv" => @$_POST["mssv"],
    "isabsent" => @$_POST["isabsent"],
    "note" => @$_POST["note"],
    "image" => @$_POST["image"]
);
$jsontext = callAPI("", "classroom_updateStudent.api", array(), $params);
$gbeAPIData = json_decode($jsontext, true);

echo $jsontext;
