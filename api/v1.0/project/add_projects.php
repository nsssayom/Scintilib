<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/project.php');

if (!isset($_POST['token']) || empty($_POST['token']) &&
    !isset($_POST['project_name']) || empty($_POST['project_name']) &&
    !isset($_POST['thumbnail']) || empty($_POST['thumbnail']) &&
    !isset($_POST['description']) || empty($_POST['description']) &&
    !isset($_POST['technology']) || empty($_POST['technology']) &&
    !isset($_POST['start_date']) || empty($_POST['start_date']) &&
    !isset($_POST['end_date']) || empty($_POST['end_date']) &&
    !isset($_POST['git']) || empty($_POST['git'])) {
    response_invalid_request();
}

$database = init_database();
$database->connect();
$user = new user($database);
$project = new project($database);
$project_data = array();

$project_data['project_name'] = $database->escape($_POST['project_name']);
$project_data['thumbnail'] = $database->escape($_POST['thumbnail']);
$project_data['description'] = $database->escape($_POST['description']);
$project_data['technology'] = $database->escape($_POST['technology']);
$project_data['start_date'] = $database->escape($_POST['start_date']);
$project_data['end_date'] = $database->escape($_POST['end_date']);
$project_data['git'] = $database->escape($_POST['git']);

$token = $database->escape($_POST['token']);
$user_id = $user->authenticate($token);

$project->add_project($user_id, $project_data);