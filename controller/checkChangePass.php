<?php
require './connect.php';
session_start();
function test_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
$email = test_input($_POST['email']);
$password = test_input($_POST["password"]);
$new_password = test_input($_POST["new_password"]);
$confirm_password = test_input($_POST["confirm_password"]);
if (!empty($email) && !empty($password) && !empty($new_password) && !empty($confirm_password)) {
    $sql1 = "SELECT * FROM users WHERE email = '$email'";
    $result = $conn->query($sql1);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if ($row['password'] === md5($password)) {
            $sql = "UPDATE users SET password = md5('$new_password') WHERE email = '$email'";
            if ($conn->query($sql) === TRUE) {
                $message = "Update mật khẩu thành công";
                $error = array("error" => 0, "message" => $message);
            } else {
                $message = "Đã có lỗi xảy ra.";
                $error = array("error" => 1, "message" => $message);
            }
        } else {
            $message = "Mật khẩu cũ không chính xác.";
            $error = array("error" => 1, "message" => $message);
        }
    } else {
        $message = "Người dùng không tồn tại.";
        $error = array("error" => 1, "message" => $message);
    }
    $conn->close();
    echo json_encode($error);
    exit();
}
