<?php
require('./connect.php');
session_start();
$messege = "";
if (!empty($_SESSION['id']) && !empty($_POST['id'])) {
    $u_id = $_SESSION['id'];
    $song_id = $_POST['id'];
    if (!empty($_POST['action']) && $_POST['action'] == 'add') {
        $sql1 = "SELECT * FROM library WHERE m_id = '$song_id' AND u_id = '$u_id'";
        if ($conn->query($sql1)->num_rows > 0) {
            $messege = "existed";
        } else {
            $sql = "INSERT INTO library (`m_id`,`u_id`) VALUES ('$song_id','$u_id')";
            if ($conn->query($sql) === TRUE) {
                $messege = "success";
            }
        }
    } else if (!empty($_POST['action']) && $_POST['action'] == 'delete' && !empty($_POST['category'])) {
        $sql1 = "";
        $stt = "";
        if ($_POST['category'] == "liked") {
            $sql1 = "DELETE FROM library WHERE m_id = '$song_id' AND u_id = '$u_id'";
        } else if ($_POST['category'] == 'uploaded') {
            $result = $conn->query("SELECT musics.img,musics.src  FROM musics 
                                    INNER JOIN uploads ON uploads.m_id = '$song_id' 
                                    AND uploads.u_id = '$u_id' AND uploads.m_id = musics.m_id");
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                if (unlink($row['img']) && unlink($row['src'])) {
                }
                $sql1 = "DELETE FROM uploads WHERE m_id = '$song_id' AND u_id = '$u_id'";
                $stt = "uploaded";
            }
        } else {
            if (!empty($_POST['pl_id'])) {
                $pl_id = $_POST['pl_id'];
                $sql1 = "DELETE FROM playlist_item WHERE m_id = '$song_id' AND pl_id = '$pl_id' ";
            }
        }
        if ($conn->query($sql1) === TRUE) {
            if ($stt === "uploaded") {
                $result1 = $conn->query("DELETE FROM musics WHERE m_id = '$song_id'");
                if ($result1 === TRUE) {
                    $messege = "success";
                }
            }
            $messege = "success";
        } else {
            $messege = "error";
        }
    } else if (!empty($_POST['action']) && $_POST['action'] == 'add_playlist' && !empty($_POST['pl_id'])) {
        $pl_id = $_POST['pl_id'];
        $date = date('Y-m-d');
        $sql1 = "SELECT * FROM playlist_item WHERE m_id = '$song_id' AND pl_id = '$pl_id'";
        if ($conn->query($sql1)->num_rows > 0) {
            $messege = "existed";
        } else {
            $sql = "INSERT INTO playlist_item (`m_id`,`pl_id`,`date`) VALUES ('$song_id','$pl_id','$date')";
            if ($conn->query($sql) === TRUE) {
                $messege = "success_add_pl";
            }
        }
    }
} else {
    $messege = "UserExits";
}
echo $messege;
