<?php
require('./connect.php');
session_start();
$id = $_SESSION['id'];
# check if image sent
if (isset($_FILES['my_image'])) {


    $img_name = $_FILES['my_image']['name'];
    $img_size = $_FILES['my_image']['size'];
    $tmp_name = $_FILES['my_image']['tmp_name'];
    $error    = $_FILES['my_image']['error'];

    # if there is not error occurred while uploading
    if ($error === 0) {
        if ($img_size > 1000000) {
            # error message
            $em = "Xin lỗi, file của bạn quá lớn.";

            # response array
            $error = array('error' => 1, 'em' => $em);


            echo json_encode($error);
            exit();
        } else {
            # get image extension store it in var
            $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);

            $img_ex_lc = strtolower($img_ex);

            $allowed_exs = array("jpg", "jpeg", "png");

            if (in_array($img_ex_lc, $allowed_exs)) {
                $new_img_name = uniqid("IMG-USER-", true) . '.' . $img_ex_lc;

                # crating upload path on root directory
                $img_upload_path = "../uploads/" . $new_img_name;

                # move uploaded image to 'uploads' folder
                move_uploaded_file($tmp_name, $img_upload_path);

                # inserting imge name into database
                $result = $conn->query("SELECT * FROM users WHERE u_id = '$id'");
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        if ($row['img'] != "") {
                            unlink("../uploads/" . $row['img']);
                        }
                    }
                }
                $sql = "UPDATE users SET img = '$new_img_name' WHERE u_id = '$id'";
                mysqli_query($conn, $sql);

                # response array
                $em = "Thêm ảnh đại diện thành công.";
                $res = array('error' => 0, 'src' => $new_img_name, 'em' => $em);

                echo json_encode($res);
                exit();
            } else {
                # error message
                $em = "Định dạng file không được cho phép.";

                # response array
                $error = array('error' => 1, 'em' => $em);


                echo json_encode($error);
                exit();
            }
        }
    } else {
        # error message
        $em = "Lỗi không xác định. Mời thử lại.";

        # response array
        $error = array('error' => 1, 'em' => $em);


        echo json_encode($error);
        exit();
    }
}
if (isset($_POST['status']) && $_POST['status'] == 'remove') {
    $result = $conn->query("SELECT * FROM users WHERE u_id = '$id'");
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            if ($row['img'] != "") {
                unlink("../uploads/" . $row['img']);
                $sql = "UPDATE users SET img = '' WHERE u_id = '$id'";
                mysqli_query($conn, $sql);
                $message = "Gỡ ảnh thành công.";
                $err = array("error" => 0, "message" => $message);
            } else {
                $message = "Bạn chưa có ảnh đại diện.";
                $err = array("error" => 1, "message" => $message);
            }
        }
    } else {
        $message = "Người dùng không tồn tại.";
        $err = array("error" => 1, "message" => $message);
    }
    echo json_encode($err);
    exit();
}
