<?php
require('./connect.php');
$res;
if (!empty($_GET['id_artist'])) {
    $id_artist_rsp = $_GET['id_artist'];
    $id_artist = array();
    $result = $conn->query("SELECT artist.* FROM musics INNER JOIN albums ON musics.m_id = albums.m_id INNER JOIN artist ON artist.ar_id = $id_artist_rsp AND artist.ar_id = albums.ar_id");
    $result1 = $conn->query("SELECT musics.* FROM musics INNER JOIN albums ON musics.m_id = albums.m_id INNER JOIN artist ON artist.ar_id = $id_artist_rsp AND artist.ar_id = albums.ar_id");


    if ($result->num_rows > 0 && $result1->num_rows > 0) {
        $row = $result->fetch_assoc();
        while ($row1 = $result1->fetch_assoc()) {
            $data[] = $row1;
            $result2 = $conn->query("SELECT musics.m_id,artist.ar_id,artist.name_artist FROM artist 
                            INNER JOIN albums ON albums.ar_id = artist.ar_id   
                            INNER JOIN musics ON albums.m_id = musics.m_id AND musics.m_id =  " . $row1["m_id"] . "");
            if ($result2->num_rows > 0) {
                while ($row2 = $result2->fetch_assoc()) {
                    array_push($id_artist, $row2);
                }
            }
        }

        $json = json_encode($row);
        $json1 = json_encode($data);
        $json2 = json_encode($id_artist);


        $res = array('error' => 0, 'artist' => $json, 'data_music' => $json1, 'id_artist' => $json2);
    } else {
        $messege = "Không tìm thấy nghệ sĩ.";
        $res = array('error' => 1, 'message' => $messege);
    }
} else if (isset($_GET['current_artist'])) {
    $current_artist = $_GET['current_artist'];
    $start = -1;
    if ($current_artist > 1 && $current_artist + 6 <= 72) {
        $start = $current_artist + 1;
    } else {
        $start = 2;
    }
    $begin = $start;
    $end = $begin + 5;
    $result = $conn->query("SELECT * FROM artist WHERE ar_id BETWEEN $begin and $end");
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $list_other_artist[] = $row;
        }
        $json = json_encode($list_other_artist);
        $res = array('error' => 0, 'list_other_artist' => $json);
    } else {
        $messege = "Không tìm thấy nghệ sĩ.";
        $res = array('error' => 1, 'message' => $messege);
    }
}
echo json_encode($res);
$conn->close();
