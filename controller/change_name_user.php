<?php
require('./connect.php');
session_start();
$id = $_SESSION['id'];
if (isset($_POST['new_name'])) {
    if (!empty($_POST['new_name'])) {
        $new_name = $_POST['new_name'];
        $sql = "UPDATE users SET name = '$new_name' WHERE u_id = '$id'";
        $conn->query($sql);
        $conn->close();
        $res = array('error' => 0, 'name' => $new_name);
    } else {
        $result = $conn->query("SELECT * FROM users WHERE u_id = '$id'");
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $res = array('error' => 1, 'name' => $row['name']);
            }
        }
        $conn->close();
    }
}
echo json_encode($res);
