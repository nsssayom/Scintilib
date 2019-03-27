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
        $username = $reg_data['username'];
        $name = $reg_data['name'];
        $phone = $reg_data['phone'];
        $email = $reg_data['email'];
        $gender = $reg_data['gender'];
        $dob = $reg_data['dob'];
        //$user_level = $reg_data['user_level'];
        $password = $reg_data['password'];

        $hash_pwd =  process_password($password);

        $sql = "INSERT INTO users(username, name, phone, email, gender, dob, password) VALUES 
                                  ('$username', '$name', '$phone', '$email', 
                                  '$gender', '$dob', '$hash_pwd')";
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

}