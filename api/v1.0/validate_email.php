<?php

include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');

if (!isset($_REQUEST['email']) || empty($_REQUEST['email'])){
    response_invalid_request();
}

$email = $_REQUEST['email'];

$database = init_database();
$database->connect();

$email = $database->escape($email);
validate_email($email, $database);

//validate if an email is valid or has been used by another user before.
