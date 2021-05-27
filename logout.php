<?php
require_once(__DIR__ . '/config.php');
foreach($_SESSION as $key => $value)
{
	unset($_SESSION[$key]);
}

header('Location: ' . HTTP_SERVER . 'user/login.gbe');


