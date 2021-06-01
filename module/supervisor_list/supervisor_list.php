<?php
if (empty(@$_SESSION['loginusercode'])) {
    header('Location: ' . HTTP_SERVER . 'logout.php');
}
$session = @$_SESSION;
$gbeLayout = "layout.tpl";
$gbeTemplate = "supervisor_list.tpl";
