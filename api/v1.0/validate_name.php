<?php

include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');

if (!isset($_REQUEST['name']) || empty($_REQUEST['name'])){
    response_invalid_request();
}

$database = init_database();
$database->connect();

$name = $database->escape($_REQUEST['name']);
validate_name($name);
