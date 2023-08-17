<?php
include_once "../../../controller/connect.php";
if (!empty($_GET['u_id']) && isset($_GET['action'])) {

    if ($_GET['action'] === 'getDetails') {
        $countPl = 0;
        $countLb = 0;
        $countUl = 0;
        $u_id = $_GET['u_id'];
        $result1 = $conn->query("SELECT * FROM playlist WHERE u_id ='$u_id'");
        if ($result1->num_rows > 0) {
            while ($row1 = $result1->fetch_assoc()) {
                $countPl = $countPl + 1;
            }
        }
        $data[] = $countPl;
        $result2 = $conn->query("SELECT * FROM library WHERE u_id ='$u_id'");
        if ($result2->num_rows > 0) {
            while ($row1 = $result2->fetch_assoc()) {
                $countLb = $countLb + 1;
            }
        }

        $data[] = $countLb;
        $result3 = $conn->query("SELECT * FROM uploads WHERE u_id ='$u_id'");
        if ($result3->num_rows > 0) {
            while ($row1 = $result3->fetch_assoc()) {
                $countUl = $countUl + 1;
            }
        }
        $data[] = $countUl;
        if ($result1 && $result2 && $result3) {
            $res = array("error" => 0, "details" => $data);
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
