<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 7/30/2020
 * Time: 4:28 PM
 */
function formatDate($datetime) {
    return date('d/m/Y', strtotime($datetime));
}

function formatDateTime($datetime) {
    return date('H:i d/m/Y', strtotime($datetime));
}

function numberFormat($num, $n = 0)
{
    $str = number_format($num, $n, ",", ".");
    $str = str_replace(',00', '', $str);
    return $str;
}

function formatNumberPhone($numberphone){
    $formatPhone = substr($numberphone, 0, 3) . " ". substr($numberphone, 3, 3) . " ". substr($numberphone,6,strlen($numberphone)-6);
    return $formatPhone;
}
