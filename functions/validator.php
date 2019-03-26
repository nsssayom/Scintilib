<?php
    include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/database.php');

    function test_input($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    function validate_name($name){
        if (strlen($name) > 70){
            response_invalid_name();
        }
        if (!preg_match("/^[a-zA-Z ]*$/",$name)){
            response_invalid_name();
        }
        response_ok();
    }

    function validate_email($email, Database $database){
        if (strlen($email) > 100){
            response_invalid_email();
        }
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            response_invalid_email();
        }

        $query = "SELECT * FROM users WHERE email = '$email';";
        $emails = $database->getArray($query);
        if (isset($emails[0])) {
            response_email_not_available();
        }
        else{
            response_ok();
        }



        response_ok();
    }

    function validate_phone($phone, Database $database){
        //$data = file_get_contents('http://apilayer.net/api/validate?access_key=1823612252f9011189444f29aca6e2f4&number='.$phone);
        //print_r($data);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://lookups.twilio.com/v1/PhoneNumbers/'. $phone);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');
        curl_setopt($ch, CURLOPT_USERPWD, 'AC8389da7c738900d9b4e9830d2127e975' . ':' . '484a91ba566e0f10368fca0d6a20116f');
        $result = curl_exec($ch);
        if (curl_errno($ch)) {
            echo 'Error:' . curl_error($ch);
        }
        curl_close ($ch);
        $json_result = json_decode($result, true);

        if (isset($json_result['status'])){
            if ($json_result['status'] == "404"){
                response_invalid_phone_number();
            }
        }

        $query = "SELECT * FROM users WHERE phone = '$phone';";
        $phones = $database->getArray($query);
        if (isset($phones[0])) {
            response_phone_number_not_available();
        }
        else{
            response_ok();
        }

    }

    function validate_username($username,Database $database){
        $username = $database->escape($username);
        $username = test_input($username);

        if (strlen($username) > 20){
            response_invalid_user();
        }

        if (!preg_match("/^[a-zA-Z]*$/",$username)){
            response_invalid_name();
        }

        $query = "SELECT * FROM users WHERE username = '$username';";
        $users = $database->getArray($query);
        if (isset($users[0])) {
            response_username_not_available();
        }
        else{
            response_ok();
        }

    }