<?php
$params = array(
    "username" => @$_POST["username"],
    "password" => @$_POST["password"]
);

$jsontext = callAPI("", "common_login.api", array(), $params);
$gbeAPIData = json_decode($jsontext, true);

if ($gbeAPIData["error"] == "") {
    $dataSession = @$gbeAPIData["sessiondata"];
    foreach ($dataSession as $key => $value) {
        $_SESSION[$key] = $value;
    }
    $_SESSION["login_time_stamp"] = time();
}

echo $jsontext;
