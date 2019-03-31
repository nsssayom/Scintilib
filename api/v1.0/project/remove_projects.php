<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/project.php');

if (!isset($_POST['token']) || empty($_POST['token']) &&
    !isset($_POST['project_id']) || empty($_POST['project_id'])) {
    response_invalid_request();
}



$database = init_database();
$database->connect();
$user = new user($database);
$project = new project($database);

$project_id = $database->escape($_POST['project_id']);

$token = $database->escape($_POST['token']);
$user_id = $user->authenticate($token);

$sql = "SELECT * FROM projects WHERE id='$project_id' AND user_id='$user_id'";
$projects = $database->getArray($sql);

if (isset($projects[0])){
    $project->remove_project($user_id, $project_id);
}
else{
    response_invalid_request();
}


