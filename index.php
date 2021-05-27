<?php
// Configuration\

require_once('config.php');

$gbeSEOURL = @$_GET["gbeseourl"];
$gbeModule = @$_GET["gbemodule"];
$gbeFunction = @$_GET["gbefunction"];
$gbeType = @$_GET["gbetype"];
$gbeLayout = "";
$gbeLayoutPath = "";
$gbeTemplate = "";
$gbeTemplatePath = "";


if ($gbeSEOURL != "") {
    //GET API SEO URL TO GET MODULE & FUNCTION & MEDIA ID
    $fileSEOData = "data/seourl/" . $gbeSEOURL . ".cache";
    if (file_exists($fileSEOData)) {
        $datatext = file_get_contents($fileSEOData);
        $dataSEO = json_decode($datatext, true);
        $gbeModule = $dataSEO["module"];
        $gbeFunction = $dataSEO["function"];
        $gbeObjectId = $dataSEO["objectid"];
        $gbeMetaTitle = $dataSEO["meta_title"];
        $gbeObjectCode = $dataSEO["objectcode"];
    } elseif (file_exists($gbeSEOURL . ".php")) {
        include($gbeSEOURL . ".php");
        exit();
    } else {
        include("404.html");
        exit();
    }

} else {
    if ($gbeModule == "") $gbeModule = "homepage";
    if ($gbeFunction == "") $gbeFunction = "index";
}

//LOAD CONTROLLER module/function.php FIRST ĐỂ LẤY gbeLayout & gbeTemplate
$gbeRouteControllerPath = DIR_MODULE . $gbeModule . "/" . $gbeFunction . ".php";
if($gbeType == "ajax"){
	$gbeRouteControllerPath = DIR_MODULE . $gbeModule . "/ajax/" . $gbeFunction . ".php";
}
if (file_exists($gbeRouteControllerPath)) {
    include($gbeRouteControllerPath);
};


validateModuleConfig();

if ($gbeLayout != "") {
    if (is_file($gbeLayoutPath)) include($gbeLayoutPath);
} else {
    if (is_file($gbeTemplatePath)) include($gbeTemplatePath);
}

function validateModuleConfig()
{
    global $device, $gbeModule, $gbeFunction, $gbeLayout, $gbeTemplate, $gbeLayoutPath, $gbeTemplatePath;

    $gbeLayoutPath = "master/" . $gbeLayout;
    $gbeTemplatePath = DIR_MODULE . $gbeModule . "/" . $gbeTemplate;

    if ($gbeTemplate != "") {
        if (!is_file($gbeTemplatePath)) {
            exit("Cannot find Template: " . $gbeTemplatePath);
        }
    }

    if ($gbeLayout != "") {
        if (!is_file($gbeLayoutPath)) {
            exit("Cannot find Layout: " . $gbeLayoutPath);
        }
    }
}

?>