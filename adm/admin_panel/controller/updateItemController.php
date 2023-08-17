<?php
include_once "../../../controller/connect.php";
if (!empty($_POST['m_id'])) {
    // info video
    $m_id = $_POST['m_id'];
    $name = $_POST['m_name'];
    $artist = $_POST['m_artist'];
    $time = $_POST['m_time'];
    $category = $_POST['m_category'];
    $nation = $_POST['m_nation'];
    $date = date('Y-m-d');
    $img = "";
    $location = "";

    // img
    if (!empty($_FILES['fileUploadIcon']['name']) && !empty($_FILES['fileUploadMusic']['name']) && $_FILES['fileUploadIcon']['name'] != '' && $_FILES['fileUploadMusic']['name'] != '') {
        $target_dir_img = "../uploads/";
        $target_file_img = $target_dir_img . "." . uniqid("", true) . basename($_FILES['fileUploadIcon']['name']);
        $img = $target_file_img;
        // video
        $target_dir_video = "../musics/";
        $target_file_video = $target_dir_video . "." . uniqid("", true) . basename($_FILES["fileUploadMusic"]["name"]);
        move_uploaded_file($_FILES['fileUploadMusic']['tmp_name'], "../../" . $target_file_video);
        // Insert record
        move_uploaded_file($_FILES["fileUploadIcon"]["tmp_name"], "../../" . $target_file_img);
        $location = $target_file_video;
        // remove img && video old
        $result = $conn->query("SELECT * FROM musics WHERE m_id = $m_id");
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            uniqid('../../' . $row['img']);
            uniqid('../../' . $row['src']);
        }
    } else {
        $img = $_POST['old_edit_Icon'];
        $location = $_POST['old_edit_Video'];
    }

    // Upload
    $sql = "UPDATE musics SET `name` = '$name',
                            `artist`='$artist',
                            `img`='$img',
                            `src`='$location',
                            `date`='$date',
                            `time`='$time',
                            `nation`='$nation',
                            `category`='$category' 
                            WHERE m_id = '$m_id'";
    $conn->query($sql);
    $conn->close();
    $message  = "Thay đổi thành công";
    $error = array("error" => 0, "message" => $message);
    echo json_encode($error);
    exit();
} else {
    $message  = "Đã xảy ra lỗi.";
    $error = array("error" => 1, "message" => $message);
    echo json_encode($error);
    exit();
}
