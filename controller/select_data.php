<?php
require('./connect.php');
$res;
if (!empty($_GET['u_id']) && !empty($_GET['btn_uploaded_id'])) {
    $u_id = $_GET['u_id'];
    // 
    if ($_GET['btn_uploaded_id'] === "upLoaded" || $_GET['btn_uploaded_id'] === "imgUser") {
        $result = $conn->query("SELECT musics.* FROM musics
                                INNER JOIN uploads ON musics.m_id = uploads.m_id AND uploads.u_id = '$u_id'");
        $result1 = $conn->query("SELECT musics.m_id,artist.ar_id,artist.name_artist FROM musics 
                                INNER JOIN uploads ON musics.m_id = uploads.m_id AND uploads.u_id = '$u_id'
                                INNER JOIN albums ON albums.m_id = musics.m_id 
                                INNER JOIN artist ON artist.ar_id = albums.ar_id");

        if ($result->num_rows > 0 &&  $result1->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
            while ($row1 = $result1->fetch_assoc()) {
                $id_artist[] = $row1;
            }
            $json = json_encode($data);
            $json1 = json_encode($id_artist);

            $res = array('error' => 0, 'data_music_upload' => $json, 'id_artist' => $json1);
        } else {
            $messege =  "Không có bài hát.";
            $res = array('error' => 1, 'message' => $messege);
        }
    }
    // 
    if ($_GET['btn_uploaded_id'] === "liked" || $_GET['btn_uploaded_id'] === "defaultLoad") {
        $result = $conn->query("SELECT * FROM musics 
                                INNER JOIN library ON musics.m_id = library.m_id AND library.u_id = '$u_id'");
        $result1 = $conn->query("SELECT musics.m_id,artist.ar_id,artist.name_artist FROM musics
                                INNER JOIN library ON musics.m_id = library.m_id AND library.u_id = '$u_id'
                                INNER JOIN albums ON albums.m_id = musics.m_id INNER JOIN artist ON artist.ar_id = albums.ar_id");
        if ($result->num_rows > 0 && $result1->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
            while ($row1 = $result1->fetch_assoc()) {
                $id_artist[] = $row1;
            }
            $json = json_encode($data);
            $json1 = json_encode($id_artist);

            $res = array('error' => 0, 'data_music_liked' => $json, 'id_artist' => $json1);
        } else {
            $messege =  "Không có bài hát.";
            $res = array('error' => 1, 'message' => $messege);
        }
    }
    // 
} else if (!empty($_GET['u_id']) && !empty($_GET['getPlaylist']) && $_GET['getPlaylist'] === "getPlaylist") {
    $u_id = $_GET['u_id'];
    $result = $conn->query("SELECT playlist.*,users.name FROM playlist 
                            INNER JOIN users ON playlist.u_id = users.u_id AND playlist.u_id = '$u_id'");


    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
        $json = json_encode($data);
        $res = array('error' => 0, 'data_playlist' => $json);
    } else {
        $messege =  "Danh sách rỗng.";
        $res = array('error' => 1, 'message' => $messege);
    }
    // 
} else
    // select music load disvoer
    if (!empty($_GET['key']) && $_GET['key'] === "discover") {
        // $result = $conn->query("SELECT * FROM musics WHERE m_id BETWEEN 1 AND 9 ");
        // $result = $conn->query("SELECT * FROM musics");

        // if ($result->num_rows > 0) {
        //     while ($row = $result->fetch_assoc()) {
        //         $data[] = $row;
        //     }
        //     $json = json_encode($data);
        //     $res = array('error' => 0, 'data_discover' => $json);
        // } else {
        //     $messege =  "Danh sách rỗng.";
        //     $res = array('error' => 1, 'massasge' => $messege);
        // }
        $result = $conn->query("SELECT * FROM musics");
        $result1 = $conn->query("SELECT musics.m_id,artist.ar_id,artist.name_artist FROM musics INNER JOIN albums ON albums.m_id = musics.m_id INNER JOIN artist ON artist.ar_id = albums.ar_id");

        if ($result->num_rows > 0 && $result1->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
            while ($row1 = $result1->fetch_assoc()) {
                $id_artist[] = $row1;
            }

            $json = json_encode($data);
            $json1 = json_encode($id_artist);

            $res = array('error' => 0, 'data_discover' => $json, 'id_artist' => $json1);
        } else {
            $messege = "Không có dữ liệu.";
            $res = array('error' => 1, 'message' => $messege);
        }
        // 
    } else if (!empty($_GET['key']) && $_GET['key'] === "getAllData") {
        $result = $conn->query("SELECT * FROM musics");
        $result1 = $conn->query("SELECT musics.m_id,artist.ar_id,artist.name_artist FROM musics INNER JOIN albums ON albums.m_id = musics.m_id INNER JOIN artist ON artist.ar_id = albums.ar_id");

        if ($result->num_rows > 0 && $result1->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
            while ($row1 = $result1->fetch_assoc()) {
                $id_artist[] = $row1;
            }

            $json = json_encode($data);
            $json1 = json_encode($id_artist);

            $res = array('error' => 0, 'data_music' => $json, 'id_artist' => $json1);
        } else {
            $messege = "Không có dữ liệu.";
            $res = array('error' => 1, 'message' => $messege);
        }
        // 
    } else if (!empty($_GET['u_id']) && !empty($_GET['dataHint'])) {
        $u_id = $_GET['u_id'];
        $dataHint = $_GET['dataHint'];
        $result = $conn->query("SELECT * FROM musics");
        $result1 = $conn->query("SELECT musics.m_id,artist.ar_id,artist.name_artist FROM musics
                                 INNER JOIN albums ON albums.m_id = musics.m_id INNER JOIN artist ON artist.ar_id = albums.ar_id");

        if ($result->num_rows > 0 && $result1->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                if (strpos(strtolower($row['name']), strtolower($dataHint))) {
                    $data[] = $row;
                    while ($row1 = $result1->fetch_assoc()) {
                        if ($row1["m_id"] == $row["m_id"]) {
                            $id_artist[] = $row1;
                        }
                    }
                }
            }
            if (count($data) > 0) {
                $json = json_encode($data);
                $json1 = json_encode($id_artist);

                $res = array('error' => 0, 'data_hint' => $json, 'id_artist' => $json1);
            } else {
                $messege = "Không tìm thấy.";
                $res = array('error' => 1, 'message' => $messege);
            }
        } else {
            $messege =  "Truy vấn dữ liệu xảy ra lỗi.";
            $res = array('error' => 1, 'message' => $messege);
        }
        // 
    } else if (!empty($_GET['u_id']) && !empty($_GET['pl_id']) && !empty($_GET['action']) && $_GET['action'] == "getPlaylistItem") {
        $u_id = $_GET['u_id'];
        $pl_id = $_GET['pl_id'];
        $result = $conn->query("SELECT musics.* FROM musics 
                                INNER JOIN playlist_item ON musics.m_id = playlist_item.m_id 
                                INNER JOIN playlist ON playlist.pl_id = playlist_item.pl_id AND playlist.pl_id = '$pl_id'
                                INNER JOIN users ON users.u_id = playlist.u_id AND users.u_id = '$u_id'");

        $result1 = $conn->query("SELECT musics.m_id,artist.ar_id,artist.name_artist FROM musics 
                                INNER JOIN playlist_item ON musics.m_id = playlist_item.m_id 
                                INNER JOIN playlist ON playlist.pl_id = playlist_item.pl_id AND playlist.pl_id = '$pl_id'
                                INNER JOIN users ON users.u_id = playlist.u_id AND users.u_id = '$u_id'
                                INNER JOIN albums ON albums.m_id = musics.m_id 
                                INNER JOIN artist ON artist.ar_id = albums.ar_id");

        if ($result->num_rows > 0 && $result1->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
            while ($row1 = $result1->fetch_assoc()) {
                $id_artist[] = $row1;
            }
            $json = json_encode($data);
            $json1 = json_encode($id_artist);

            $res = array('error' => 0, 'data_playlist_item' => $json, 'id_artist' => $json1);
        } else {
            $messege =  "Danh sách rỗng.";
            $res = array('error' => 1, 'message' => $messege);
        }
        // 
    } else if (!empty($_GET['song_id'])) {
        $song_id = $_GET['song_id'];
        $result = $conn->query("SELECT * FROM musics WHERE m_id = $song_id");
        $result1 = $conn->query("SELECT musics.m_id,artist.ar_id,artist.name_artist FROM musics 
                                INNER JOIN albums ON musics.m_id = $song_id  AND albums.m_id = musics.m_id
                                INNER JOIN artist ON artist.ar_id = albums.ar_id");
        if ($result->num_rows > 0 && $result1->num_rows > 0) {
            $row = $result->fetch_assoc();
            while ($row1 = $result1->fetch_assoc()) {
                $id_artist[] = $row1;
            }
            $json = json_encode($id_artist);
            $res = array('error' => 0, 'song' => $row, 'id_artist' => $json);
        } else {
            $messege = "Không tìm thấy bài hát.";
            $res = array('error' => 1, 'message' => $messege);
        }
        // 
    } else if (!empty($_POST['song_id']) && !empty($_POST['updateListen'])) {
        if ($_POST['updateListen'] === "updateListen") {
            $song_id = $_POST['song_id'];
            $result = $conn->query("SELECT * FROM musics WHERE m_id = $song_id");
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $count = $row['quatityLis'] + 1;
                $result1 = $conn->query("UPDATE musics SET quatityLis = '$count' WHERE m_id = $song_id");
            }
        }
    }
echo json_encode($res);
$conn->close();
