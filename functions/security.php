<?php
function process_password($password){
    $options = [
        'cost' => 9,
    ];
    return  password_hash($password, PASSWORD_BCRYPT, $options);
}

function generate_token(){
    $token = bin2hex(random_bytes(64));
    return $token;
}