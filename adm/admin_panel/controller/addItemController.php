<?php
include_once "../../../controller/connect.php";

$message = "";
if (isset($_POST['upload']) && !empty($_FILES['fileUploadIcon']) && !empty($_FILES['fileUploadMusic'])) {
    if ($_FILES['fileUploadIcon']['name'] != '' && $_FILES['fileUploadMusic']['name'] != '') {
        // info video
        $name = $_POST['m_name'];
        $owner = "admin";
        $artist = $_POST['m_artist'];
        $time = $_POST['m_time'];
        $category = $_POST['m_category'];
        $nation = $_POST['m_nation'];
        $date = date('Y-m-d');
        $img = "";
        $location = "";

        // img
        $target_dir_img = "../uploads/";
        $target_file_img = $target_dir_img . "." . uniqid("", true) . basename($_FILES['fileUploadIcon']['name']);
        $img = $target_file_img;

        // video
        $target_dir_video = "../musics/";
        $target_file_video = $target_dir_video . "." . uniqid("", true) . basename($_FILES["fileUploadMusic"]["name"]);



        // Upload
        move_uploaded_file($_FILES['fileUploadMusic']['tmp_name'], "../../" . $target_file_video);
        // Insert record
        move_uploaded_file($_FILES["fileUploadIcon"]["tmp_name"], "../../" . $target_file_img);
        $location = $target_file_video;
        $sql = "INSERT INTO musics (`owner`,`name`,`artist`,`img`,`src`,`date`,`time`,`nation`,`category`) VALUES('$owner','$name','$artist','$img','$location','$date','$time','$nation','$category')";
        $conn->query($sql);
        $conn->close();
        $message  = "success";
    } else {
        $message = 'error';
    }
} else {
    $message = 'error';
}
echo $message;
