<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');

if (!isset($_POST['token']) || empty($_POST['token'])){
    response_invalid_request();
}

$token = $_POST['token'];

$database = init_database();
$database->connect();
$user = new user($database);
$token = $database->escape($token);

if ($user->authenticate($token)){
    response_ok();
}

response_invalid_token();

//{"username":"sadat","name":"Sadat Jubayer","phone":"+8801717018378","email":"sadat@yahoo.com","gender":"0","dob":"1996-03-14","password":"1234"}