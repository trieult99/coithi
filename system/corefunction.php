<?php
function addGlobalCSS($path)
{
    global $gbeCSSList;
    $gbeCSSList[] = $path;
}

function loadGlobalCSS()
{
    global $gbeCSSList;
    $gbeCSSList = array_unique($gbeCSSList);
    foreach ($gbeCSSList as $csspath) {
        echo '<link rel="stylesheet" href="' . HTTP_SERVER . $csspath . '?v=' . FILE_VERSION . '">';
    }
}

function addGlobalJS($path)
{
    global $gbeJSList;
    $gbeJSList[] = $path;
}

function loadGlobalJS()
{
    global $gbeJSList;
    $gbeJSList = array_unique($gbeJSList);
    foreach ($gbeJSList as $jspath) {
        echo '<script src="' . HTTP_SERVER . $jspath . '?v=' . FILE_VERSION . '"></script>';
    }
}

/*************************************************************/
/*************        Các hàm gọi API              ***********/
/*************************************************************/

function callAPI($system = "", $api, $get_params = array(), $post_params = array())
{
//    $starttime = microtime(true);

    $url = HTTP_APISERVER . $system . "/" . $api . "?token=" . TOKEN;

    if (!empty($get_params) > 0) {
        $querystring = http_build_query($get_params);
        $url = $url . "&" . $querystring;
    }

    $post_params["sessiondata"] = json_encode($_SESSION);

    // Khởi tạo CURL

    $ch = curl_init($url);

    // Thiết lập các return
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);


    curl_setopt($ch, CURLOPT_POST, count($post_params));
    curl_setopt($ch, CURLOPT_POSTFIELDS, $post_params);

    $result = curl_exec($ch);

    curl_close($ch);
//    $endtime = microtime(true);
//    $time = $endtime - $starttime;
//    if ($api == 'content_getConfigList.api') {
//        $currenturl = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
//        $logdata = '------------' . $currenturl . '------------' . PHP_EOL;
//    }
//    $logdata .= date("Y-m-d H:i:s") . ': ' . $api . ' - ' . $time . PHP_EOL;
//    $myFile = "log.txt";
//    $fh = fopen($myFile, 'a');
//    fwrite($fh, $logdata);
//    fclose($fh);

    return $result;
}


function apiGET($system = "", $api, $params = array())
{
    $url = HTTP_APISERVER . $system . "/" . $api . "?token=" . TOKEN;

    if (count($params) > 0) {
        if (strpos($api, "?") == false) {
            $url = $url . "?";
        }
        $querystring = http_build_query($params);
        $url = $url . $querystring;
    }
    // Khởi tạo CURL
    $ch = curl_init($url);

    // Thiết lập các return
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $result = curl_exec($ch);

    curl_close($ch);

    return $result;
}

function apiPOST($system = "", $api, $param = array())
{
    $url = HTTP_APISERVER . $system . "/" . $api . "?token=" . TOKEN;

    // Khởi tạo CURL
    $ch = curl_init($url);

    // Thiết lập các return
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    // Thiết lập sử dụng POST
    curl_setopt($ch, CURLOPT_POST, count($param));

    // Thiết lập các dữ liệu gửi đi
    curl_setopt($ch, CURLOPT_POSTFIELDS, $param);

    $result = curl_exec($ch);

    curl_close($ch);

    return $result;
}

/*************************************************************/
/*************************************************************/
/*************************************************************/
