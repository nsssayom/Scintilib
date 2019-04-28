<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/response.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/security.php');
class user
{
    private $database_link;

    function __construct(Database $database)
    {
        $this->database_link = $database;
    }

    public function registration(array $reg_data){
        $username = $this->database_link->escape($reg_data['username']);
        $name = $this->database_link->escape( $reg_data['name']);
        $phone = $this->database_link->escape($reg_data['phone']);
        $email = $this->database_link->escape($reg_data['email']);
        $gender = $this->database_link->escape($reg_data['gender']);
        $dob = $this->database_link->escape($reg_data['dob']);
        $user_level = $this->database_link->escape($reg_data['user_level']);
        $password = $reg_data['password'];

        $hash_pwd =  process_password($password);

        validate_name($name,true);
        validate_username($username, $this->database_link, true);
        validate_phone($phone, $this->database_link, true);
        validate_email($email, $this->database_link, true);

        $sql = "INSERT INTO users(username, name, phone, email, gender, dob, password, user_level) VALUES 
                                  ('$username', '$name', '$phone', '$email', 
                                  '$gender', '$dob', '$hash_pwd', '$user_level')";
        if ($this->database_link->query($sql)=== true){
            $user_id = $this->database_link->getLink()->insert_id;
            response_token($this->get_token($user_id));
        }
    }

    /* Return true if user is valid, return false if not valid
     * Banned user will need to be filtered out from this function later on
     */
    public function is_user_valid($user_id){
        $sql = "SELECT username FROM users WHERE id = '$user_id'";
        if ( isset($this->database_link->getArray($sql)[0])){
            return true;
        }
        return false;
    }
    //if user is valid, generate a token, create a entry in database and return the token
    public function get_token($user_id){
        if ($this->is_user_valid($user_id)){
            $token = generate_token();
            $sql = "INSERT INTO token(user_id, token) VALUES ('$user_id', '$token');";
            $this->database_link->query($sql);
            return $token;
        }
    }

    public function get_user_id($username){
        $sql = "SELECT id FROM users WHERE username = '$username'";
        $user_id = $this->database_link->getArray($sql);

        if(isset($user_id[0])){
            $id = $user_id[0]['id'];
            return $id;
        }
        return false;

    }

    public function authenticate($token){
        $sql = "SELECT id, user_id FROM token WHERE token = '$token'";
        $user_id = $this->database_link->getArray($sql);

        if(isset($user_id[0])){
            $token_id = $user_id[0]['id'];
            $id = $user_id[0]['user_id'];
            $sql = "UPDATE token SET revision = revision + 1 WHERE id = '$token_id';";
            $this->database_link->query($sql);
            return $id;
        }
        response_invalid_token();
        return false;
    }

    public function get_user_info($token){
        $user_id = $this->authenticate($token);
        $sql = "SELECT name, username FROM users WHERE id = '$user_id'";
        $user_info = $this->database_link->getArray($sql);
        response_user_info($user_info);
    }

    public function login($login, $password){

        $sql = "SELECT id, password FROM users WHERE email = '$login' OR username = '$login';";
        $user = $this->database_link->getArray($sql);

        if(!isset($user[0])){
            response_invalid_user();
        }

        $hash_password = $user[0]['password'];
        $user_id = $user[0]['id'];

        if (password_verify($password, $hash_password)) {
            response_token($this->get_token($user_id));
        }
        response_wrong_password();
    }

}