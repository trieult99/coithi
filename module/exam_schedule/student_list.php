<?php
if(empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER .'logout.php');
}

$gbeLayout = "layout.tpl";
$gbeTemplate = "student_list.tpl";

addGlobalCSS("./assets/css/student_list.css");