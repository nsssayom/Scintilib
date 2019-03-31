<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');

//data validation
if (!isset($_POST['login']) || empty($_POST['login']) ||
    !isset($_POST['password']) || empty($_POST['password'])){
    response_invalid_request();
}

$database = init_database();
$database->connect();
$user = new user($database);

$login = $database->escape($_POST['login']);
$password = $_POST['password'];


$user->login($login, $password);
