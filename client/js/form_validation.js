$(document).ready(function () {
    // Username verification
    $("#nameSuccess").hide();
    $("#nameFailed").hide();
    $("#emailSuccess").hide();
    $("#emailFailed").hide();
    $("#phoneSuccess").hide();
    $("#phoneFailed").hide();
    $("#usernameSuccess").hide();
    $("#usernameFailed").hide();
    $("#passwordFailed").hide();
    $("#password_check").hide();
    $("#c_passwordFailed").hide();
    $("#c_passwordSuccess").hide();
    $("#submit").prop('disabled', true) ;
    
    let nameFlag = false;
    let email_flag = false;
    let phone_flag = false;
    let username_flag = false;
    let dob_flag = false;
    let password_flag = false;
    let c_password_flag = false;

    //Name validation
    $("#name").keyup(function () {
        const name = $("#name").val();
        if ((/^[A-Za-z ]+$/.test(name))){
            $("#nameSuccess").show();
            $("#nameFailed").hide();
            nameFlag = true;
            check_all();
        }
        else{
            $("#nameSuccess").hide();
            $("#nameFailed").show();
            nameFlag = false;
            check_all();
        }
    });

    //Email verification
    $("#email").keyup(function () {
        const email = $("#email").val();
        $.post(
            "https://scintilib.com/unified_user_platform/api/v1.0/validate_email.php",
            {email},
            function (data, status) {
                statusCode = JSON.parse(data)[0].status;
                if (statusCode === "100") {
                    $("#emailSuccess").show();
                    $("#emailFailed").hide();
                    email_flag = true;
                    check_all();
                }
                else if (statusCode === "303") {
                    $("#emailFailed").show();
                    $("#emailSuccess").hide();
                    alert("Email already used. Please login")
                    email_flag = false;
                    check_all();
                }
                else {
                    $("#emailFailed").show();
                    $("#emailSuccess").hide();
                    email_flag = false;
                    check_all();
                }
                console.log("Email :::: Data: " + data + "\nStatus: " + status);
            }
        );
    });

    //phone verification
    $("#phone").keyup(function () {
        let phone = $("#phone").val();
        $.post(
            "https://scintilib.com/unified_user_platform/api/v1.0/validate_phone.php",
            {phone},

            function (data, status) {
                statusCode = JSON.parse(data)[0].status;

                if (statusCode === "100") {
                    $("#phoneSuccess").show();
                    $("#phoneFailed").hide();
                    phone_flag = true;
                    check_all();
                }
                else if (statusCode === "305"){
                    $("#phoneFailed").show();
                    $("#phoneSuccess").hide();
                    alert("Phone number is already being used.");
                    phone_flag = false;
                    check_all();
                }
                else {
                    $("#phoneFailed").show();
                    $("#phoneSuccess").hide();
                    phone_flag = false;
                    check_all();
                }
                console.log("Phone :::: Data: " + data + "\nStatus: " + status);
            }
        );
    });


    // Username verification
    $("#username").keyup(function () {
        const username = $("#username").val();

        $.post(
            "https://scintilib.com/unified_user_platform/api/v1.0/validate_username.php",
            {username},

            function (data, status) {
                statusCode = JSON.parse(data)[0].status;

                if (statusCode === "100") {
                    $("#usernameSuccess").show();
                    $("#usernameFailed").hide();
                     username_flag = true;
                    check_all();
                } else {
                    $("#usernameFailed").show();
                    $("#usernameSuccess").hide();
                    username_flag = false;
                    check_all();
                }
                console.log("Username:::: Data: " + data + "\nStatus: " + status);
            }
        );
    });

    $("#password").keyup(function () {
        const password = $("#password").val();
        if (/^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/.test(password)){
            $("#passwordFailed").hide();
            $("#password_check").show();
            //console.log(true);
            password_flag = true;
            check_all();
        }
        else{
            $("#passwordFailed").show();
            $("#password_check").hide();
            //console.log(false);
            password_flag = false;
            check_all();
        }
    });

    $("#con_password").keyup(function () {
        console.log( "PWD changed");
        const password = $("#password").val();
        const con_password = $("#con_password").val();
        if (password === con_password){
            $("#c_passwordFailed").hide();
            $("#c_passwordSuccess").show();
            c_password_flag = true;
            check_all();
        }
        else{
            $("#c_passwordFailed").show();
            $("#c_passwordSuccess").hide();
           // console.log(false);
            c_password_flag = false;
            check_all();
        }
    });

    $("#dob").change(function () {
        dob_flag = true;
        console.log( "DOB changed");
        check_all();
    });

    function check_all(){
        console.log("Checking");
        if (nameFlag && email_flag && phone_flag && username_flag && dob_flag && password_flag && c_password_flag ){
            console.log(nameFlag + email_flag + phone_flag + username_flag + dob_flag + password_flag + c_password_flag);
            $("#submit").prop('disabled', false) ;
        }
        else{
            console.log(nameFlag + email_flag + phone_flag + username_flag + dob_flag + password_flag + c_password_flag);
            $("#submit").prop('disabled', true) ;
        }
    }
});
