<?php
require('./connect.php');
session_start();
if (isset($_FILES['my_image']) && isset($_POST['my_name'])) {
    $u_id = $_SESSION['id'];
    $namePlaylist = $_POST['my_name'];
    $date = date('Y-m-d');
    $imgPlaylist = "";

    $img_name = $_FILES['my_image']['name'];
    $img_size = $_FILES['my_image']['size'];
    $tmp_name = $_FILES['my_image']['tmp_name'];
    $error    = $_FILES['my_image']['error'];

    // kiem tra playlist da ton tai chua
    $result = $conn->query("SELECT * FROM playlist WHERE u_id = '$u_id'");
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if ($row['name_playlist'] === $namePlaylist) {
            $message = "Xin lỗi, playlist đã tồn tại.";

            # response array
            $error = array('error' => 1, 'message' => $message);
            echo json_encode($error);
            exit();
        }
    }
    # if there is not error occurred while uploading
    if ($error === 0) {
        if ($img_size > 1000000) {
            # error message
            $message = "Xin lỗi, file của bạn quá lớn.";

            # response array
            $error = array('error' => 1, 'message' => $message);


            echo json_encode($error);
            exit();
        } else if ($namePlaylist === "") {
            # error message
            $message = "Xin lỗi, tên playlist không được để trống.";

            # response array
            $error = array('error' => 1, 'message' => $message);


            echo json_encode($error);
            exit();
        } else {
            # get image extension store it in var
            $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);

            $img_ex_lc = strtolower($img_ex);

            $allowed_exs = array("jpg", "jpeg", "png");

            if (in_array($img_ex_lc, $allowed_exs)) {
                $new_img_name = uniqid("IMG-PLAYLIST-", true) . '.' . $img_ex_lc;

                # crating upload path on root directory
                $img_upload_path = "../uploads/" . $new_img_name;

                # move uploaded image to 'uploads' folder
                move_uploaded_file($tmp_name, $img_upload_path);

                $sql = "INSERT INTO playlist (`name_playlist`,`img`,`date`,`u_id`)VALUES('$namePlaylist','$new_img_name','$date','$u_id')";
                $conn->query($sql);
                $result1 = $conn->query("SELECT playlist.pl_id,playlist.name_playlist,playlist.img,playlist.u_id, users.name FROM playlist INNER JOIN users ON playlist.u_id = '$u_id' AND users.u_id = '$u_id'");
                if ($result1->num_rows > 0) {
                    while ($row = $result1->fetch_assoc()) {
                        $data[] = $row;
                    }
                }
                $message = "Tạo playlist thành công.";
                $res = array('error' => 0, 'data' => $data, 'message' => $message);
                echo json_encode($res);
                exit();
            } else {
                # error message
                $message = "Định dạng file không được cho phép.";

                # response array
                $error = array('error' => 1, 'message' => $message);


                echo json_encode($error);
                exit();
            }
        }
    } else {
        # error message
        $message = "Lỗi không xác định. Mời thử lại.";

        # response array
        $error = array('error' => 1, 'message' => $message);


        echo json_encode($error);
        exit();
    }
}

if (!empty($_POST['u_id']) && !empty($_POST['pl_id'])) {
    $id = $_POST['u_id'];
    $pl_id = $_POST['pl_id'];
    $sql1 = $conn->query("DELETE FROM playlist_item WHERE pl_id = '$pl_id'");
    $result = $conn->query("SELECT * FROM playlist WHERE u_id ='$id' AND pl_id = '$pl_id'");
    $sql = $conn->query("DELETE FROM playlist WHERE u_id = '$id' AND pl_id = '$pl_id'");
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            unlink("../uploads/" . $row['img']);
            if ($sql === TRUE && $sql1 === TRUE) {
                $message = "Xóa playlist thành công.";
                $error = array("error" => 0, "message" => $message);
                $conn->close();
            } else {
                $message = "Xóa playlist không thành công.";
                $error = array("error" => 1, "message" => $message);
            }
        }
    } else {
        $message = "Người dùng không tồn tại.";
        $error = array("error" => 1, "message" => $message);
    }
    echo json_encode($error);
    exit();
}
