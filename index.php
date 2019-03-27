<?php

include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/user.php');

$database = init_database();
$database->connect();

$user = new user($database);
//$sql = "INSERT INTO token (user_id, token) VALUES ('14', '1013')";
//$sql = "SELECT * FROM token";
//print_r ($database->query($sql));
//$database->query($sql);

//$name = $_GET['name'];
//print_r(validate_phone($name, $database));

$data = array();
$data['username'] = "jamil";
$data['name'] = "Ahsanul Jamil";
$data['phone'] = "+8801717018377";
$data['email'] = "jamil@yahoo.com";
$data['gender'] = "0";
$data['dob'] = "1996-03-14";
$data['password'] = "1234";

print_r( $user->registration($data));

//$token = bin2hex(random_bytes(64));
//echo $token;
//echo "<br>" . strlen($token). "<br>";

//var_dump($user->get_token(5));