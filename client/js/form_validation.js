$(document).ready(function () {
    // Username verification
    $("#nameSuccess").hide();
    $("#nameFailed").hide();
    $("#emailSuccess").hide();
    $("#emailFailed").hide();

    //Name validation
    $("#name").keyup(function () {
        const name = $("#name").val();
        if ((/^[A-Za-z ]+$/.test(name))){
            $("#nameSuccess").show();
            $("#nameFailed").hide();
        }
        else{
            $("#nameSuccess").hide();
            $("#nameFailed").show();
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
                }
                else if (statusCode === "303") {
                    $("#emailFailed").show();
                    $("#emailSuccess").hide();
                    alert("Email already used. Please login")
                }
                else {
                    $("#emailFailed").show();
                    $("#emailSuccess").hide();
                }
                console.log("Email :::: Data: " + data + "\nStatus: " + status);
            }
        );
    });







    //---------------
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
});
