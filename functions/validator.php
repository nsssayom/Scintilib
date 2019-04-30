<?php
    include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/database.php');

    //trim variables
    function test_input($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    //validate name just to have Letters and spaces
    function validate_name($name, $internal = false){
        $name = test_input($name);
        if (strlen($name) > 70){
            response_invalid_name();
        }
        if (!preg_match("/^[a-zA-Z ]*$/",$name)){
            response_invalid_name();
        }
        if  ($internal){
            return true;
        }
        response_ok();
    }

    //validate email address
    function validate_email($email, Database $database, $internal = false){
        $email = test_input($email);
        if (strlen($email) > 100){
            response_invalid_email();
        }
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            response_invalid_email();
        }

        $query = "SELECT * FROM users WHERE email = '$email';";
        $emails = $database->getArray($query);

        //if email address is already being used
        if (isset($emails[0])) {
            response_email_not_available();
        }

        if  ($internal){
            return true;
        }

        response_ok();
    }

    function validate_phone($phone, Database $database, $internal = false){
        //$data = file_get_contents('http://apilayer.net/api/validate?access_key=1823612252f9011189444f29aca6e2f4&number='.$phone);
        //print_r($data);
        $phone = test_input($phone);
        $phone = '+88' . $phone;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://lookups.twilio.com/v1/PhoneNumbers/'. $phone);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');
        curl_setopt($ch, CURLOPT_USERPWD, 'AC8389da7c738900d9b4e9830d2127e975' . ':' . '484a91ba566e0f10368fca0d6a20116f');
        $result = curl_exec($ch);
        if (curl_errno($ch)) {
            response_entity_unavailable();
        }
        curl_close ($ch);
        $json_result = json_decode($result, true);

        //provided number is a phone number
        if (isset($json_result['status'])){
            if ($json_result['status'] == "404"){
                response_invalid_phone_number();
            }
        }

        $query = "SELECT phone FROM users WHERE phone = '$phone';";
        $phones = $database->getArray($query);

        //if phone number is already being used
        if (isset($phones[0])) {
            response_phone_number_not_available();
        }

        if  ($internal){
            return true;
        }
        response_ok();

    }

    function validate_username($username,Database $database, $internal = false){
        $username = $database->escape($username);
        $username = test_input($username);

        if (strlen($username) > 20){
            response_invalid_user();
        }

        if ($username == "self"){
            response_invalid_user();
        }

        //if username following pattern
        if (!preg_match("/^[a-zA-Z0-9]*$/",$username)){
            response_invalid_user();
        }

        $query = "SELECT * FROM users WHERE username = '$username';";
        $users = $database->getArray($query);

        //if username is taken
        if (isset($users[0])) {
            response_username_not_available();
        }

        if  ($internal){
            return true;
        }
        response_ok();
    }

function earth_is_not_flat($latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo, $earthRadius = 6371000){
    // convert from degrees to radians
    $latFrom = deg2rad($latitudeFrom);
    $lonFrom = deg2rad($longitudeFrom);
    $latTo = deg2rad($latitudeTo);
    $lonTo = deg2rad($longitudeTo);

    $latDelta = $latTo - $latFrom;
    $lonDelta = $lonTo - $lonFrom;

    $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
            cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
    return $angle * $earthRadius;
}