<?php
if(empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER .'logout.php');
}

$gbeLayout = "layout.tpl";
$gbeTemplate = "index.tpl";

addGlobalCSS("./assets/css/homepage.css");