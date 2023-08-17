<?php
require('./connect.php');
session_start();
if (!empty($_SESSION["id"])) {
    header("Location: ../index.php");
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
    <link rel="stylesheet" href="../css/logo.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <title>Registration</title>
</head>

<body>
    <div class="register form_user">
        <a href="../index.php" style="text-decoration: none;">
            <div class="logo" style="padding:0;">
                <span>124</span>
                <span>M</span>
                <span>p</span>
                <span>3</span>

            </div>
        </a>
        <h1 class="title">ĐĂNG KÍ</h1>
        <div id="message" style="color: red;background-color: bisque;"></div>
        <form method="post" autocomplete="off" id="myform">
            <label for="email">Email của bạn là gì?</label>
            <input type="email" id="email" name="email" placeholder="Nhập email của bạn.">
            <span class="error " id="email_err"></span>



            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" placeholder="Mật khẩu của bạn"><br>
            <span class="error " id="password_err"></span>

            <label for="confirm_email">Xác nhận mật khẩu</label>
            <input type="password" id="confirm_password" name="confirm_password"
                placeholder="Xác nhận password của bạn.">
            <span class="error " id="confirm_password_err"></span>

            <label for="name">Bạn tên là gì?</label>
            <input type="text" name="name" id="name" placeholder="Nhập tên hồ sơ.">
            <span class="error " id="name_err"></span>


            <label for="">Bạn sinh ngày nào?</label>
            <div class="birhday">
                <div class="item_birthday">
                    <label for="date">Ngày</label>
                    <input type="text" placeholder="DD" name="date" id="date">
                </div>
                <div class="item_birthday">
                    <label for="month">Tháng</label>
                    <select name="month" id="month">
                        <option value="">MM</option>
                        <?php
                        $months = array("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12");
                        foreach ($months as $month) {
                            echo "<option value=" . $month . ">Tháng $month</option>";
                        }
                        ?>
                    </select>
                </div>
                <div class="item_birthday">
                    <label for="year">Năm</label>
                    <input type="text" name="year" id="year" placeholder="YY">
                </div>
            </div>
            <span class="error " id="date_err"></span><br>
            <span class="error " id="month_err"></span><br>
            <span class="error " id="year_err"></span>


            <label for="">Giới tính của bạn là gì?</label>
            <div class="gender">
                <div class="item_gender">
                    <input type="radio" name="gender" id="male" value="male"><label for="male">Nam</label> <br>
                </div>
                <div class="item_gender"><input type="radio" name="gender" id="female" value="female"><label
                        for="female">Nữ</label> <br></div>
                <div class="item_gender"><input type="radio" name="gender" id="not" value="not"><label for="not">Không
                        phân biệt
                        được</label>
                    <br>
                </div>
                <div class="item_gender"><input type="radio" name="gender" value="other" id="other"><label
                        for="other">Khác</label> <br>
                </div>
                <div class="item_gender"><input type="radio" name="gender" value="private" id="private"><label
                        for="private">Không muốn nêu cụ
                        thể</label> <br></div>
            </div>
            <span class="error " id="gender_err"></span>


            <div class="option_other">
                <label class="container">Tôi không muốn nhận thông tinh trực
                    tiếp từ
                    Spotify
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label><br>
            </div>
            <div class="option_other">
                <label class="container">Chia sẻ dữ liệu đăng kí
                    của tôi với các nhà
                    cung cấp
                    nội
                    dung
                    của Spotify cho mục đích tiếp thị
                    <input type="checkbox">
                    <span class="checkmark"></span>
                </label><br>
            </div>

            </label>
            <div class="btn_submit_register">
                <input type="submit" value="Đăng kí" name="btn-submit-register" id="btn-submit-register"><br>
            </div>
            <div class="nav_login">
                Bạn có tài khoản?<a href="./login.php">Đăng nhập</a>
            </div>
        </form>
    </div>
    </div>
    <script>
    $(document).ready(function() {
        $('#name').on('input', function() {
            checkName();
        });
        $('#email').on('input', function() {
            checkEmail();
        });
        $('#password').on('input', function() {
            checkPass();
        });
        $('#confirm_password').on('input', function() {
            checkConfirmPass();
        });
        $('input:radio[name="gender"]').on('input', function() {
            checkGender();
        });
        $('#date').on('input', function() {
            checkDate();
        });


        $("#month").on('input', function() {
            checkMonth();
        })

        $("#year").on('input', function() {
            checkYear();
        })

        $('#myform').submit(function(e) {
            e.preventDefault();
            if (!checkName() && !checkEmail() && !checkGender() && !checkPass() && !
                checkConfirmPass() && !checkDate() && !checkMonth() && !checkYear()) {
                $("#message").html(`Vui lòng điền đầy đủ thông tin.`);
            } else if (!checkName() || !checkEmail() || !checkGender() || !checkPass() || !
                checkConfirmPass() || !checkDate() || !checkMonth() || !checkYear()) {
                $("#message").html(`Vui lòng điền đầy đủ thông tin.`);
            } else {
                $("#message").html("");
                var data = $(this).serialize();
                $.ajax({
                    type: "POST",
                    url: "./checkRegister.php",
                    data: data,
                    success: function(data) {
                        if (data == "successReg") {
                            alert('Đăng kí thành công.');
                            $(location).attr('href', './login.php');
                        } else {
                            alert('Email đã tồn tại.');
                        }
                    },
                });
            }
        });
    });


    function checkName() {
        var pattern = /^[a-zA-Z-' ]+$/;
        var name = $('#name').val();
        var validuser = pattern.test(name);
        if ($('#name').val() == "") {
            $('#name_err').html('Tên không được để trống.');
            return false;
        } else if ($('#name').val().length < 4) {
            $('#name_err').html('Tên quá ngắn');
            return false;
        } else if (!validuser) {
            $('#name_err').html('Tên chỉ chứa chữ cái thường và in hoa.');
            return false;
        } else {
            $('#name_err').html('');
            return true;
        }
    }

    function checkEmail() {
        var pattern1 = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        var email = $('#email').val();
        var validemail = pattern1.test(email);
        if (email == "") {
            $('#email_err').html('Không được để trống.');
            return false;
        } else if (!validemail) {
            $('#email_err').html('Email không hợp lệ (abc@xyz.com)');
            return false;
        } else {
            $('#email_err').html('');
            return true;
        }
    }

    function checkPass() {
        var pattern2 = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
        var pass = $('#password').val();
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

    function checkConfirmPass() {
        var pass = $('#password').val();
        var cpass = $('#confirm_password').val();
        if (cpass == "") {
            $('#confirm_password_err').html('Xác nhận mật khẩu không được để trống.');
            return false;
        } else if (pass !== cpass) {
            $('#confirm_password_err').html('Không khớp với mật khẩu');
            return false;
        } else {
            $('#confirm_password_err').html('');
            return true;
        }
    }

    function checkGender() {
        if (!$('input:radio[name="gender"]').is(':checked')) {
            $("#gender_err").html("Không được để trống giới tính.");
            return false;
        } else {
            $('#gender_err').html('');
            return true;
        }
    }

    function checkDate() {
        var date = Number($("#date").val());
        if (date == "") {
            $('#date_err').html('Ngày sinh không được rỗng.');
            return false;
        } else if (isNaN(date)) {
            $('#date_err').html('Ngày không hợp lệ. Ngày phải là một số nguyên không âm.');
            return false;
        } else if (date < 1 || date > 31) {
            $('#date_err').html('Ngày không hợp lệ. Ngày phải nằm trong khoảng từ 1 đến 31.');
            return false;
        } else {
            $('#date_err').html('');
            return true;
        }
    }

    function checkMonth() {
        var month = Number($("#month").val());
        if (month == "") {
            $('#month_err').html('Tháng không được để trống');
            return false;
        } else if (isNaN(month)) {
            $('#month_err').html('Tháng không hợp lệ. Tháng phải là một số nguyên không âm.');
            return false;
        } else if (month < 1 || month > 12) {
            $('#month_err').html('Tháng không hợp lệ. Tháng phải nằm trong khoảng từ 1 đến 12.');
            return false;
        } else {
            $('#month_err').html('');
            return true;
        }
    }

    function checkYear() {
        var year = Number($("#year").val());
        if (year == "") {
            $('#year_err').html('Năm không được để trống');
            return false;
        } else if (isNaN(year)) {
            $('#year_err').html('Năm không hợp lệ. Năm phải là một số nguyên không âm.');
            return false;
        } else if (year < 1900 || year > 2022) {
            $('#year_err').html(
                `Năm không hợp lệ. Hệ thống chỉ nhận diện người sinh từ năm 1900 đến${new Date().getFullYear}`);
            return false;
        } else {
            $('#year_err').html('');
            return true;
        }
    }
    // function password_show_hide() {
    //     var x = document.getElementById("password");
    //     var show_eye = document.getElementById("show_eye");
    //     var hide_eye = document.getElementById("hide_eye");
    //     hide_eye.classList.remove("d-none");
    //     if (x.type === "password") {
    //         x.type = "text";
    //         show_eye.style.display = "none";
    //         hide_eye.style.display = "block";
    //     } else {
    //         x.type = "password";
    //         show_eye.style.display = "block";
    //         hide_eye.style.display = "none";
    //     }
    // }
    </script>
</body>

</html>