<?php

    include_once($_SERVER['DOCUMENT_ROOT'] . '/blood_mates/functions/init_database.php');

    if (isset($_POST['request']) && !empty($_POST['request'])){
        $request = $_POST['request'];

        $req_arr = json_decode($request, true);
        foreach ($req_arr as $key => $value){
            echo $key . "|" . $value;
        }


        //$database = init_database();
        //$database->connect();

        //$database->query("INSERT INTO mates (phone_number, access_token)values ('+8801717018376', 'token1')");
    }

    echo "received \n   - Server";



?>