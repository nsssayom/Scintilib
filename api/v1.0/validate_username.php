<?php

include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');

if (!isset($_REQUEST['username']) || empty($_REQUEST['username'])){
    response_invalid_request();
}

$database = init_database();
$database->connect();

$username = $database->escape($_REQUEST['username']);

validate_username($username,$database);
