<?php

    include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/init_database.php');
    include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');

    $database = init_database();
    $database->connect();
    /*

    $sql = "INSERT INTO token (user_id, token) VALUES ('14', '1013')";
    //$sql = "SELECT * FROM token";
    //print_r ($database->query($sql));
    $database->query($sql)
    */

    $name = $_GET['name'];
    print_r(validate_username($name, $database));
