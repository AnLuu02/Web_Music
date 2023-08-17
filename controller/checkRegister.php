<?php
require './connect.php';
session_start();
// check register
function test_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
$role = 'user';
$email = test_input($_POST["email"]);
$password = test_input($_POST["password"]);
$confirm_password = test_input($_POST["confirm_password"]);
$name = test_input($_POST["name"]);
$date = test_input($_POST["date"]);
$month = test_input($_POST["month"]);
$year = test_input($_POST["year"]);
$gender = test_input($_POST["gender"]);
$imgUser = "";
if (!empty($email) && !empty($confirm_password) && !empty($password) && !empty($name) && !empty($date) && !empty($month) && !empty($year) && !empty($gender)) {
    $duplicate = $conn->query("SELECT * FROM users WHERE email = '$email'");
    if ($duplicate->num_rows > 0) {
        echo "errReg";
    } else {
        // insert du lieu
        if ($password == $confirm_password) {
            $sql = "INSERT INTO users (`role`,`name`,`email`,`password`,`birthday`,`gender`,`img`)VALUES('$role','$name','$email',md5('$password'),'$year-$month-$date','$gender','$imgUser')";
            if ($conn->query($sql) === TRUE) {
                echo "successReg";
            }
        }
    }
}
$conn->close();