<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/response.php');

class Database
{
    private $link;
    protected $hostname;
    protected $username;
    protected $password;
    protected $database;

    function __construct($host, $user, $pass, $database)
    {
        $this->hostname = $host;
        $this->username = $user;
        $this->password = $pass;
        $this->database = $database;
        $this->link = NULL;
    }

    function connect()
    {
        /* Connect To MySQL */
        $mysql = new mysqli($this->hostname, $this->username, $this->password, $this->database);
        if ($mysql->connect_error) {
             $data = array();
            $data['status'] = "400";
            $result = json_encode(array($data));
            print_r($result);

            //echo $mysql->connect_error;
            return false;
        } else {
            $this->link = $mysql;
            return true;
        }
    }

    function query($sql)
    {
        /* Returns MySQL Query */
        //for handling database error
        $result = $this->link->query($sql) or response_database_error();
        return $result;
    }

    function escape($data)
    {
        // Escape String to avoid SQL injection attack
        return $this->link->real_escape_string($data);
    }

    function escape_recursive($arr)
    {
        foreach ($arr as $k => $v) {
            if (is_array($v)) {
                $array[escape($k)] = escape_recursive($v);
            } else {
                $array[escape($k)] = escape($v);
            }
        }
        return $arr;
    }

    function getArray($sql)
    {
        $mq = $this->query($sql);
        if (!$mq) {
            //for handling database error
            response_database_error();
            //return false;
        }

        $result = array();
        while ($mfa = $mq->fetch_array(MYSQLI_ASSOC)) {
            $result[] = $mfa;
        }
        return $result;
    }

    function getLink()
    {
        if(!self::$link)
        {
            self::$link = new connect();
        }

        return self::$link;
    }

}