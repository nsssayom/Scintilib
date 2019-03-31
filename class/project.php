<?php
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/response.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/validator.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/class/database.php');
include_once($_SERVER['DOCUMENT_ROOT'] . '/unified_user_platform/functions/security.php');

class project
{
    private $database_link;

    function __construct(Database $database)
    {
        $this->database_link = $database;
    }

    public function get_projects($user_id){
        $sql = "SELECT projects.*, users.email FROM projects INNER JOIN users ON projects.user_id = users.id WHERE user_id = '$user_id' AND is_deleted = '0';";
        $projects = $this->database_link->getArray($sql);
        if (isset($projects[0])){
            response_project($projects);
        }
        else{
            response_invalid_request();
        }

    }

    public function add_project($user_id, $project_data){
        $project_name = $project_data['project_name'];
        $thumbnail = $project_data['thumbnail'];
        $description = $project_data['description'];
        $technology = $project_data['technology'];
        $start_date = $project_data['start_date'];
        $end_date = $project_data['end_date'];
        $git = $project_data['git'];

        $sql = "INSERT INTO projects (user_id, project_name, thumbnail, description, technology, start, end, git) 
                values ('$user_id', '$project_name', '$thumbnail', '$description', '$technology', '$start_date', '$end_date', '$git')";

        $this->database_link->query($sql);
        response_ok();
    }

    public function remove_project($user_id, $project_id){
        $sql = "UPDATE projects SET is_deleted='1' WHERE id='$project_id' AND user_id='$user_id';";
        $this->database_link->query($sql);
        response_ok();
    }
}