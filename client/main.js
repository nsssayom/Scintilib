$(document).ready(function () {
    // Username verification
    $("#username").keyup(function () {
        const username = $("#username").val();

        $.post(
            "http://scintilib.com/unified_user_platform/api/v1.0/validate_username.php",
            {username},

            function (data, status) {
                statusCode = JSON.parse(data)[0].status;

                if (statusCode === "100") {
                    $("#UserSucceed").show();
                    $("#UserFailed").hide();
                } else {
                    $("#UserFailed").show();
                    $("#UserSucceed").hide();
                }
                console.log("Username:::: Data: " + data + "\nStatus: " + status);
            }
        );
    });

    // email verification
    $("#email").keyup(function () {
        const email = $("#email").val();

        $.post(
            "http://scintilib.com/unified_user_platform/api/v1.0/validate_email.php",
            {email},

            function (data, status) {
                statusCode = JSON.parse(data)[0].status;

                if (statusCode === "100") {
                    $("#EmailSucceed").show();
                    $("#EmailFailed").hide();
                } else {
                    $("#EmailFailed").show();
                    $("#EmailSucceed").hide();
                }
                console.log("Email :::: Data: " + data + "\nStatus: " + status);
            }
        );
    });

    //phone verification
    $("#phone").keyup(function () {
        const phone = $("#phone").val();

        $.post(
            "http://scintilib.com/unified_user_platform/api/v1.0/validate_phone.php",
            {phone},

            function (data, status) {
                statusCode = JSON.parse(data)[0].status;

                if (statusCode === "100") {
                    $("#PhoneSucceed").show();
                    $("#PhoneFailed").hide();
                } else {
                    $("#PhoneFailed").show();
                    $("#PhoneSucceed").hide();
                }
                console.log("Phone :::: Data: " + data + "\nStatus: " + status);
            }
        );
    });

    $("#pass").keyup(function () {
        const pass = $("#pass").val();

        if (checkPassword(pass)) {
            $("#PassSucceed").show();
            $("#PassFailed").hide();
        } else {
            $("#PassFailed").show();
            $("#PassSucceed").hide();
        }
    });

    $("#con_pass").keyup(function () {
        const pass = $("#pass").val();
        const con_pass = $("#con_pass").val();
        if (pass == con_pass) {
            $("#PassVerSucceed").show();
            $("#PassVerFailed").hide();
        } else {
            $("#PassVerFailed").show();
            $("#PassVerSucceed").hide();
        }
    });

    // post all data
    $("#signup_submit").click(function () {
        // getting all data
        let name = $("#name").val();
        let username = $("#username").val();
        let email = $("#email").val();
        let phone = $("#phone").val();
        let dob = $("#dob").val();
        let pass = $("#pass").val();

        let jsonObject = {
            username: username,
            name: name,
            phone: phone,
            email: email,
            gender: "0",
            dob: dob,
            password: pass
        };

        let signup = (JSON.stringify(jsonObject));
        console.log("SIGNUP: " + signup);

        $.post(
            "http://scintilib.com/unified_user_platform/api/v1.0/signup.php",
            {signup},
            function (data, status) {
                console.log("SIGNUP: " + data + "\nStatus: " + status);
                let statusCode = JSON.parse(data)[0].status;
                console.log("Status:" + statusCode);

                if (statusCode === "100") {
                    console.log("Done");
                    let token = JSON.parse(data)[0].token;
                    localStorage.setItem("token", token);
                    console.log(localStorage.getItem("token"));
                    is_logged_in("register.html")
                } else {
                    console.log("Something is wrong");
                }
            }
        );

    });

    $("#search_button").click(function () {
        search_text = $("#search_box").val();

        //document.getElementById("name").innerHTML = search_text;

        let project_div = document.getElementById('row');
        project_div.innerHTML = "";

        load_project(search_text);
    });


    $("#delete_button").click(function () {
        console.log("HELLO");
    });

});


function getInfo() {
    const login = $("#username").val();
    const password = $("#password").val();

    $.post(
        "http://scintilib.com/unified_user_platform/api/v1.0/login.php",
        {login, password},

        function (data, status) {
            let statusCode = JSON.parse(data)[0].status;

            if (statusCode === "100") {
                console.log("Login Successful");
                let token = JSON.parse(data)[0].token;
                localStorage.setItem("token", token);
                console.log(localStorage.getItem("token"));
                location.reload();
            } else {
                console.log("Login Failed");
            }

            console.log("GET_INFO " + data + "\nStatus: " + status);
        }
    );
}

function is_logged_in(source) {
    if (localStorage.getItem("token") === null) {        //token key is not found
        if (source === "index.html") {
            return null;
        }
        else if (source === "register.html"){
            return null;
        }
        else {
            redirect("index.html");
        }
    } else {                                                   //token key is found
        let token = localStorage.getItem("token");
        $.post(
            "http://scintilib.com/unified_user_platform/api/v1.0/ping_token.php",
            {token},
            function (data, status) {
                let statusCode = JSON.parse(data)[0].status;
                console.log("response from is_logged_in : " + data + "\nStatus: " + status);
                if (statusCode === "100") {                 //token is verified
                    if (source === "index.html") {           //if a valid user tried to access index.html, redirect user to home.html
                        redirect("home.html");
                    } else if (source === "register.html") {
                        redirect("home.html");
                    } else {
                    }                                 //if user tried to access any other page, just let him

                } else {                                    //invalid token
                    redirect("index.html");        //redirecting to index.html
                }
            }
        );
    }
}

function redirect(destination) {
    window.location.replace(destination);
    console.log("Redirecting to " + destination);
}

function load_project(uname = "self") {
    if (localStorage.getItem("token") !== null) {
        let token = localStorage.getItem("token");
        let name, username;

        $.post(
            "http://scintilib.com/unified_user_platform/api/v1.0/get_user_info.php",
            {token},

            function (data, status) {
                let statusCode = JSON.parse(data)[0].status;
                let response = JSON.parse(data)[0].user_info;
                console.log("RESPONSE: " + statusCode);

                if (statusCode === "100") {
                    console.log("Success");
                    name = response[0]['name'];
                    username = response[0]['username'];
                    console.log("Name: " + name + "\n Username: " + username);
                    if (uname == "self") {
                        document.getElementById("name").innerHTML = name;
                    }
                } else {
                    console.log("Failed: " + statusCode);
                }
                console.log("Load project: " + data + "\nStatus: " + status);
            }
        );


        $.post(
            "http://scintilib.com/unified_user_platform/api/v1.0/project/get_projects.php",
            {token, uname},

            function (data, status) {
                let statusCode = JSON.parse(data)[0].status;
                let response = JSON.parse(data)[0].projects;

                console.log("Success" +  response);
                if (statusCode === "100") {
                    if (uname !== "self") {
                        document.getElementById("name").innerHTML = uname;
                        response.forEach(function (project) {
                            parse_project(project);
                        });
                    } else {
                        response.forEach(function (project) {
                            parse_project(project, true);
                        });
                    }

                } else {
                    document.getElementById("name").innerHTML = "No User Found";
                    console.log("Failed: " + statusCode);
                }
            }
        );
        return null;
    }
}

let subject = undefined;
let to = undefined;

function parse_project(project, isSelf = false) {
    let project_id = project['id'];
    let project_name = project['project_name'];

    if (isSelf){
        button_html = "<button class=\"button\" style=\"vertical-align:middle\" onclick=\"delete_project("
            + project_id
            +")\"><span>Remove Project</span></button>\n";
    }
    else{
        button_html = "<button class=\"button\" style=\"vertical-align:middle\" onclick=\"send_message()\"><span>Talk about it</span></button>\n";
        subject = project_name;
        to = project['email'];
    }

    let html = "<div class=\"column\">\n" +
        "            <div class=\"content\">\n" +
        "                <img src=\"" + project['thumbnail'] + "\" alt=\"Project\" style=\"width:100%\" height=\"225px\">\n" +
        "                <h3>" + project['project_name'] + "</h3>\n" +
        "                <p>" + project['description'] + "</p><hr>\n" +
        "                <b>Technology Used: </b><br>" + project['technology'] + "</br>\n" +
        "                <b>Started on: </b> " + project['start'] + " </br>\n" +
        "                <b>Finished on: </b> " + parse_end(project) +
        "                </br> <hr>\n" +
        "                <div style=\"width: 15%; float: left\">\n" +
        "                    <a href=\"" + project['git'] + "\"><img src=\"https://i.imgur.com/4aHXZVc.png\" height=\"40px\"> </a>\n" +
        "                </div>\n" +
        "                <div style=\"width: 85%\">\n" + button_html +
        "                </div>\n" +
        "            </div>\n" +
        "        </div>"

    console.log(html);
    let project_div = document.getElementById('row');
    project_div.innerHTML += html;

}

function parse_end(project) {
    if (project.hasOwnProperty('end')) {
        return project['end'];
    } else {
        return "";
    }
}

function logout() {
    localStorage.removeItem('token');
    redirect("index.html");
}

/*password validation
 * Min 8 Char
 * 1 special char
 * 1 upper and lower
 * 1 number
 */
function checkPassword(str) {
    var re = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    return re.test(str);
}

function add_project() {
    console.log("Clicked");

    const project_name = $("#project_name").val();
    const thumbnail = $("#thumbnail").val();
    const description = $("#description").val();
    const technology = $("#technology").val();
    const start_date = $("#start_date").val();
    const end_date = $("#end_date").val();
    const git = $("#git").val();
    let token = localStorage.getItem("token");
    $.post(
        "http://scintilib.com/unified_user_platform/api/v1.0/project/add_projects.php",
        {token, project_name, thumbnail, description, technology, start_date, end_date, git},

        function (data, status) {

            console.log("Load project: " + data + "\nStatus: " + status);
            let statusCode = JSON.parse(data)[0].status;
            //let response = JSON.parse(data)[0].projects;
            console.log("Response Status: " + statusCode);
            if (statusCode === "100") {
                console.log("Success");
                $("#ProjectFailed").hide();
                $("#ProjectSuccess").show();
            } else {
                $("#ProjectFailed").show();
                $("#ProjectSuccess").hide();
            }
            //console.log("Load project: " + data + "\nStatus: " + status);
        }
    );
}

function delete_project(project_id) {
    let retVal = confirm("Do you really want to delete this project?");
    if( !retVal){
        return false;
    }
    let token = localStorage.getItem("token");
    $.post(
        "http://scintilib.com/unified_user_platform/api/v1.0/project/remove_projects.php",
        {token, project_id},
        function (data, status) {
            let statusCode = JSON.parse(data)[0].status;
            console.log("response from is_logged_in : " + data + "\nStatus: " + status);
            if (statusCode === "100") {                 //token is verified
                location.reload();
            } else {                                    //invalid token
                alert("Error removing project!")
            }
        }
    );
}

function send_message(){
    url= "mailto:" + to + "?Subject=" + subject + "&body=" + "Hey, I want to talk about your project.";
    window.open(url, '_blank');
}
