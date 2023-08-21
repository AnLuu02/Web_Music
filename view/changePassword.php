<?php
require('../controller/connect.php');

session_start();
// if (!empty($_SESSION["id"])) {
//     header("Location: ../index.php");
// }
if (!empty($_SESSION["id"])) {
    $id = $_SESSION["id"];
    $result = $conn->query("SELECT * FROM users WHERE u_id = '$id'");
    $row = $result->fetch_assoc();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style_php.css">
    <link rel="stylesheet" href="../css/mobile_php.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <title>Registration</title>
</head>

<body>

    <div class="changePassword form_user">

        <h1 class="title">Đổi mật khẩu</h1>
        <div id="message" style="color: red;background-color: bisque;"></div>
        <form method="post" autocomplete="off" id="myform">
            <label for="email">Email:<i style="color: red;"><?php
                                                            if (!empty($_SESSION['id'])) {
                                                                echo $row['email'];
                                                            } else {
                                                                echo "";
                                                            }
                                                            ?></i> </label>

            <input type="email" name="email" id="email" value="<?php
                                                                if (!empty($_SESSION['id'])) {
                                                                    echo $row['email'];
                                                                } else {
                                                                    echo "";
                                                                }
                                                                ?>" style="display:none">
            <label for=" password">Mật khẩu hiện tại</label>
            <input type="password" id="password" name="password" placeholder="Mật khẩu của bạn"><br>
            <span class="error " id="password_err"></span>

            <label for=" new_password">Mật khẩu mới</label>
            <input type="password" id="new_password" name="new_password" placeholder="Mật khẩu của bạn"><br>
            <span class="error " id="new_password_err"></span>

            <label for="confirm_password">Xác nhận mật khẩu</label>
            <input type="password" id="confirm_password" name="confirm_password"
                placeholder="Xác nhận mật mới của bạn.">
            <span class="error " id="confirm_password_err"></span>


            <div class="back_home" style="display: flex;align-items: center;justify-content: flex-end;">
                <a href="../index.php"
                    style="display: block;font-size: 30px;color:black;margin-right: 10px;display:flex;justify-content: center;align-items: center;">
                    <ion-icon name="arrow-back"></ion-icon>
                </a>
                <div class="btn_submit_register" style="margin: 10px 0;">
                    <input type="submit" value="Cập nhật" name="btn-submit-change" id="btn-submit-change"><br>
                </div>
            </div>
        </form>
    </div>
    <script>
    $(document).ready(function() {
        $('#password').on('blur', function() {
            checkPass();
        });
        $('#new_password').on('blur', function() {
            checkNewPass();
        });
        $('#confirm_password').on('blur', function() {
            checkConfirmPass();
        });
        $('#myform').submit(function(e) {
            e.preventDefault();
            if (!checkPass() && !checkNewPass() && !checkConfirmPass()) {
                $("#message").html(`Vui lòng điền đầy đủ thông tin.`);
            } else if (!checkPass() || !checkNewPass() || !checkConfirmPass()) {
                $("#message").html(`Vui lòng điền đầy đủ thông tin.`);
            } else {
                $("#message").html("");
                var data = $(this).serialize();
                $.ajax({
                    type: "POST",
                    url: "../controller/checkChangePass.php",
                    data: data,
                    success: function(data) {
                        let json = JSON.parse(data);
                        if (json.error === 0) {
                            alert(json.message);
                            $(location).attr('href', '../index.php');
                        } else {
                            alert(json.message);
                            $(location).attr('href', 'changePassword.php');
                        }
                    },
                });
            }
        });
    });

    function checkPass() {
        var pattern2 = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
        var pass = $('#password').val();
        var newPass = $('#new_password').val();
        var validpass = pattern2.test(pass);

        if (pass == "") {
            $('#password_err').html('Mật khẩu không được để trống');
            return false;
        } else if (!validpass) {
            $('#password_err').html(
                'Phải từ 5 đến 15 kí tự, có ít nhất một chữ cái thường, một chứ cái in hoa, một số và một kí tự đặc biệt.'
            );
            return false;

        } else {
            $('#password_err').html("");
            return true;
        }
    }

    function checkNewPass() {
        var pattern2 = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
        var pass = $('#password').val();
        var newPass = $('#new_password').val();
        var validpass = pattern2.test(pass);

        if (pass == "") {
            $('#new_password_err').html('Mật khẩu không được để trống');
            return false;
        } else if (!validpass) {
            $('#new_password_err').html(
                'Phải từ 5 đến 15 kí tự, có ít nhất một chữ cái thường, một chứ cái in hoa, một số và một kí tự đặc biệt.'
            );
            return false;

        } else if (pass == newPass) {
            $('#new_password_err').html(
                "Trùng với mật khẩu cũ."
            );
        } else {
            $('#new_password_err').html("");
            return true;
        }
    }

    function checkConfirmPass() {
        var new_pass = $('#new_password').val();
        var cpass = $('#confirm_password').val();
        if (cpass == "") {
            $('#confirm_password_err').html('Xác nhận mật khẩu không được để trống.');
            return false;
        } else if (new_pass !== cpass) {
            $('#confirm_password_err').html('Không khớp với mật khẩu');
            return false;
        } else {
            $('#confirm_password_err').html('');
            return true;
        }
    }
    </script>
</body>

</html>