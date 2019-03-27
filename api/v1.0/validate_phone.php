<?php

include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');

if (!isset($_REQUEST['phone']) || empty($_REQUEST['phone'])){
    response_invalid_request();
}

$database = init_database();
$database->connect();

$phone = $database->escape($_REQUEST['phone']);

validate_phone($phone,$database);
