<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/project.php');

if (!isset($_POST['token']) || empty($_POST['token']) &&
    !isset($_POST['uname']) || empty($_POST['uname'])) {
    response_invalid_request();
}


$database = init_database();
$database->connect();

$user = new user($database);
$project = new project($database);

if ($_POST['uname'] == "self") {
    $token = $database->escape($_POST['token']);
    $user_id = $user->authenticate($token);
    $project->get_projects($user_id);
}
else{
    $token = $database->escape($_POST['token']);
    $username = $database->escape($_POST['uname']);
    $user->authenticate($token);
    $user_id = $user->get_user_id($username);
    $project->get_projects($user_id);
}







