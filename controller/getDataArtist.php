<?php
require('./connect.php');
$res;
if (!empty($_GET['name_artist'])) {
    $name_artist = trim($_GET['name_artist']);

    $sql = "SELECT * FROM artist WHERE name_artist = '$name_artist'";
    $sql1 = "SELECT * FROM musics WHERE artist LIKE '%$name_artist%'";
    $result = $conn->query($sql);
    $result1 = $conn->query($sql1);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if ($result1->num_rows > 0) {
            while ($row1 = $result1->fetch_assoc()) {
                $data[] = $row1;
            }
        } else {
            $data[] = [];
        }
        $res = array('error' => 0, 'artist' => $row, 'data' => $data);
        $conn->close();
    } else {
        $messege = "Không tìm thấy nghệ sĩ.";
        $res = array('error' => 1, 'message' => $messege);
    }
}
echo json_encode($res);
