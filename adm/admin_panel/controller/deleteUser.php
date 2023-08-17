<?php

include_once "../../../controller/connect.php";

$message  = '';
if (!empty($_POST['u_id'])) {
    $u_id = $_POST['u_id'];
    $resultQueryUpload = $conn->query("SELECT * FROM uploads WHERE u_id = '$u_id'");
    $resultQueryMUsic = $conn->query("SELECT musics.img, musics.src,uploads.u_id FROM musics
      INNER JOIN uploads ON musics.m_id = uploads.up_id AND uploads.u_id = '$u_id'");

    $resultQueryLibrary = $conn->query("SELECT * FROM library WHERE u_id = '$u_id'");
    $resultQueryPlaylist = $conn->query("SELECT * FROM playlist WHERE u_id = '$u_id'");
    $resultQueryUser = $conn->query("SELECT * FROM users WHERE u_id = '$u_id'");


    if ($resultQueryMUsic->num_rows > 0) {
        while ($row = $resultQueryMUsic->fetch_assoc()) {
            $conn->query("DELETE FROM musics WHERE u_id='" . $row['u_id'] . "'");
            if ($row['img'] != '') {
                unlink("../../" . $row['img']);
            }
            if ($row['src'] != '') {
                unlink("../../" . $row['src']);
            }
        }
    }
    if ($resultQueryUpload->num_rows > 0) {
        while ($row = $resultQueryUpload->fetch_assoc()) {
            $conn->query("DELETE FROM uploads WHERE u_id='$u_id'");
        }
    }
    if ($resultQueryLibrary->num_rows > 0) {
        while ($row = $resultQueryLibrary->fetch_assoc()) {
            $conn->query("DELETE FROM library WHERE u_id='$u_id'");
        }
    }
    if ($resultQueryPlaylist->num_rows > 0) {
        while ($row = $resultQueryPlaylist->fetch_assoc()) {
            $pl_id = $row['pl_id'];
            $resultQueryPlItem =  $conn->query("SELECT * FROM playlist_item WHERE pl_id = '$pl_id'");
            if ($resultQueryPlItem->num_rows > 0) {
                while ($row1 = $resultQueryPlItem->fetch_assoc()) {
                    $pl_id1 = $row1['pl_id'];
                    $conn->query("DELETE FROM playlist_item WHERE pl_id='$pl_id1'");
                }
            }
            $conn->query("DELETE FROM playlist WHERE pl_id='$pl_id'");
        }
    }
    if ($resultQueryUser->num_rows > 0) {
        $row = $resultQueryUser->fetch_assoc();
        if ($row['img'] != '') {
            unlink("../../" . $row['img']);
        }
        $conn->query("DELETE FROM users WHERE u_id='$u_id'");
        $message = 'success';
    } else {
        $message = 'error';
    }
} else {
    $message = 'error';
}
echo $message;
