$(document).ready(function() {
  // Username verification
  $("#username").keyup(function() {
    const username = $("#username").val();

    $.post(
      "http://scintilib.com/unified_user_platform/api/v1.0/validate_username.php",
      { username },

      function(data, status) {
        statusCode = JSON.parse(data)[0].status;

        if (statusCode === "100") {
          $("#UserSucceed").show();
          $("#UserFailed").hide();
          return true;
        } else {
          $("#UserFailed").show();
          $("#UserSucceed").hide();
        }
        console.log("Username:::: Data: " + data + "\nStatus: " + status);
      }
    );
  });

  // email verification
  $("#email").keyup(function() {
    const email = $("#email").val();

    $.post(
      "http://scintilib.com/unified_user_platform/api/v1.0/validate_email.php",
      { email },

      function(data, status) {
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

  // getting all data

  let name = $("#name");
  let username = $("#username");
  let pass = $("#pass");
  let email = $("#email");
  let dob = $("#dob");

  // post all data

  $("#submit").click(function() {
    let jsonObject = {
      username: "sadffase",
      name: "Ahsanul Jamil",
      phone: "+8801717208557",
      email: "jamila@yahoooo.com",
      gender: "0",
      dob: "1996-03-14",
      password: "1234"
    };

    let signup = encodeURI(JSON.stringify(jsonObject));
    console.log(signup);
    $.post(
      "http://scintilib.com/unified_user_platform/api/v1.0/signup.php",
      { signup },

      function(data, status) {
        statusCode = JSON.parse(data)[0].status;

        if (statusCode === "100") {
          console.log("Done");
        } else {
          console.log("Something is wrong");
        }
        console.log("Email :::: Data: " + data + "\nStatus: " + status);
      }
    );
  });
});
