<?php
include_once "../../../controller/connect.php";
if (!empty($_GET['m_id']) && isset($_GET['action'])) {
    if ($_GET['action'] === "getMusic") {
        $m_id = $_GET['m_id'];
        $qry = $conn->query("SELECT * FROM musics WHERE m_id='$m_id'");
        if ($qry->num_rows > 0) {
            while ($rowEdit = $qry->fetch_assoc()) {
                $data[] = $rowEdit;
            }
            $res = array("error" => 0, "dataMusic" => $data);
            echo json_encode($res);
            exit();
        } else {
            $message  = "Đã xảy ra lỗi.";
            $error = array("error" => 1, "message" => $message);
            echo json_encode($error);
            exit();
        }
    }
}
