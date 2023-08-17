<?php

include_once "../../../controller/connect.php";


$m_id = $_POST['m_id'];

$query1 = "SELECT * FROM musics WHERE m_id = '$m_id'";
$result1 = $conn->query($query1);
if ($result1->num_rows > 0) {
    $row = $result1->fetch_assoc();
    if ($row['owner'] != "admin") {
        $conn->query("DELETE FROM uploads where m_id='$m_id'");
    }
    $query = "DELETE FROM musics where m_id='$m_id'";
    unlink('../../' . $row['img']);
    unlink('../../' . $row['src']);
}
$data = mysqli_query($conn, $query);

if ($data) {
    echo "success";
} else {
    echo "error";
}