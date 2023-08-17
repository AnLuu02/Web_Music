<?php
require('./connect.php');
session_start();
$id = $_SESSION['id'];
if (isset($_POST['new_name']) && isset($_POST['pl_id'])) {
    if (!empty($_POST['new_name'] != '')) {
        $pl_id = $_POST['pl_id'];
        $new_name = $_POST['new_name'];
        $sql = "UPDATE playlist SET name_playlist = '$new_name' WHERE u_id = '$id' AND pl_id = '$pl_id'";
        $conn->query($sql);
        $conn->close();
        $res = array('error' => 0, 'name' => $new_name);
    } else {
        $result = $conn->query("SELECT * FROM playlist WHERE u_id = '$id' AND pl_id ='$pl_id'");
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $res = array('error' => 1, 'name' => $row['name']);
            }
        }
        $conn->close();
    }
}
echo json_encode($res);
