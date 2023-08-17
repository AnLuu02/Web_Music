<?php
require("./connect.php");
session_start();
if (isset($_FILES['m_img']) && isset($_FILES['m_src'])) {
    $u_id = $_SESSION['id'];
    $name = $_POST['m_name'];
    $artist = $_POST['m_artist'];
    $date = date('Y-m-d');
    $time = $_POST['m_time'];
    $nation = $_POST['m_nation'];
    $category = $_POST['m_category'];

    $img = "";
    $src = "";

    $img_name = $_FILES['m_img']['name'];
    $img_size = $_FILES['m_img']['size'];
    $tmp_img_name = $_FILES['m_img']['tmp_name'];
    $error    = $_FILES['m_img']['error'];

    $src_name = $_FILES['m_src']['name'];
    $src_size = $_FILES['m_src']['size'];
    $tmp_src_name = $_FILES['m_src']['tmp_name'];
    $error    = $_FILES['m_src']['error'];

    # if there is not error occurred while uploading
    if ($error === 0) {
        if ($name == "" || $artist == "" || $nation == "" || $category == "") {
            # error message
            $message = "Xin lỗi, phải nhập đủ các thông tin upload.";
            # response array
            $error = array('error' => 1, 'message' => $message);
            echo json_encode($error);
            exit();
        } else {
            // kiem tra nhạc  da ton tai chua
            $result = $conn->query("SELECT musics.name,
            musics.artist, musics.nation, musics.category, musics.time FROM musics
              INNER JOIN uploads ON musics.m_id = uploads.m_id AND uploads.u_id = '$u_id'");
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                if ($row['name'] === $name && $row['artist'] === $artist && $row['nation'] === $nation && $row['category'] === $category && $row['time'] === $time) {
                    $message = "Xin lỗi, bài hát đã được upload.";

                    # response array
                    $error = array('error' => 1, 'message' => $message);
                    echo json_encode($error);
                    exit();
                }
            }
        }

        if ($src_size <= 0) {
            # error message
            $message = "Xin lỗi, đường dẫn bài hát không được để trống.";
            # response array
            $error = array('error' => 1, 'message' => $message);
            echo json_encode($error);
            exit();
        } else if ($img_size > 1000000) {
            # error message
            $message = "Xin lỗi, file ảnh của bạn quá lớn.";
            # response array
            $error = array('error' => 1, 'message' => $message);
            echo json_encode($error);
            exit();
        } else {

            # get image extension store it in var
            $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);
            $src_ex = pathinfo($src_name, PATHINFO_EXTENSION);

            $img_ex_lc = strtolower($img_ex);
            $src_ex_lc = strtolower($src_ex);

            $allowed_exs_img = array("jpg", "jpeg", "png");
            $allowed_exs_src = array("mp4", "avi", "3gp", "mov", "mpeg", "mp3");

            if (in_array($img_ex_lc, $allowed_exs_img) && in_array($src_ex_lc, $allowed_exs_src)) {
                $new_img_name = uniqid("IMG-UPLOAD-IMG-", true) . '.' . $img_ex_lc;
                $new_src_name = uniqid("IMG-UPLOAD-VIDEO-", true) . '.' . $src_ex_lc;



                # crating upload path on root directory
                $img_upload_path = "../uploads/" . $new_img_name;
                $src_upload_path = "../musics/" . $new_src_name;

                $img = $img_upload_path;
                $src = $src_upload_path;


                # move uploaded image to 'uploads' folder
                move_uploaded_file($tmp_img_name, $img_upload_path);
                move_uploaded_file($tmp_src_name, $src_upload_path);


                # inserting imge name into database
                #get user
                $getUser = $conn->query("SELECT name FROM users WHERE u_id = '$u_id'");
                if ($getUser->num_rows > 0) {
                    while ($rowUser = $getUser->fetch_assoc()) {
                        $nameUser = $rowUser['name'];
                    }
                }
                $insertMusic = "INSERT INTO musics (`owner`,`name`,`artist`,`img`,`src`,`date`,`time`,`nation`,`category`) 
                    VALUES('$nameUser','$name','$artist','$img','$src','$date','$time','$nation','$category')";
                mysqli_query($conn, $insertMusic);

                $getMusic = $conn->query("SELECT m_id FROM musics ORDER BY m_id DESC LIMIT 1;");
                if ($getMusic->num_rows > 0) {
                    while ($row = $getMusic->fetch_assoc()) {
                        $sql1 = "INSERT INTO uploads(`date`,`u_id`,`m_id`) VALUES('$date','$u_id','" . $row['m_id'] . "')";
                        mysqli_query($conn, $sql1);
                    }
                }

                $getMusicUp = $conn->query("SELECT musics.m_id, musics.name,
                 musics.artist, musics.img, musics.src,
                  musics.date, musics.time FROM musics
                   INNER JOIN uploads ON  uploads.m_id = musics.m_id AND uploads.u_id = '$u_id'");

                if ($getMusicUp->num_rows > 0) {
                    while ($row = $getMusicUp->fetch_assoc()) {
                        $data[] = $row;
                    }
                }
                $res = array('error' => 0, 'data' => $data);
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