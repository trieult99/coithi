<?php
$params = array(
    "classroomcode" => @$_POST["classroomcode"],
);
$jsontext = callAPI("", "classroom_updateExamPaperStatus.api", array(), $params);
$gbeAPIData = json_decode($jsontext, true);

echo $jsontext;
