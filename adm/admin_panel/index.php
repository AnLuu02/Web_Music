<?php
require('../../controller/connect.php');
session_start();
if (!empty($_SESSION["id"]) && !empty($_SESSION['role']) && $_SESSION['role'] == 'admin') {
} else {
    header("Location:../../controller/login.php");
}
?>
<!DOCTYPE html>
<html>

<head>
    <title>Admin</title>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        </link>
    </head>
</head>

<body>

    <?php

    include_once "../../controller/connect.php";
    ?>
    <nav class="navbar " style="background: white">
        <div class="title_page">
            Dashboard
        </div>
        <div class="user-cart">
            <a href="#" style="text-decoration:none;" onclick="window.location='../../index.php'">
                <i class="fa fa-sign-in mr-5" style="font-size:30px; color:black;" aria-hidden="true"></i>
            </a>
        </div>
    </nav>

    <div class="sidebar" id="mySidebar">
        <div class="side-header">
            <img src="./assets/images/logo.png" width="120" height="120" alt="Swiss Collection">
            <h5 style="margin-top:10px;">Hello, Admin</h5>
        </div>
        <hr style="border:1px solid; background-color:#8a7b6d; border-color:white;opacity:0.2">
        <div class="form_search">
            <input type="text" placeholder="Search..." id="searchAdmin">
        </div>
        <a href="./index.php" class="active" key="dash"> <i class="fa fa-home"></i> Dashboard</a>
        <a href="#customers" onclick="showUser()" key="user"><i class="fa fa-users"></i> Users</a>
        <a href="#products" onclick="showMusics()" key="music"><i class="fa fa-th"></i> Musics</a>
        <a href="#orders" onclick="showTrending()"><i class="fa fa-list" key="view"></i> Trending</a>
        <a href="#orders" onclick="showUploaded()" key="uploaded"><i class="fa fa-list"></i> Uploads</a>

        <a href="#logout" onclick="logout(<?php if (isset($_SESSION['id'])) echo $_SESSION['id']; ?>)"><i
                class="fa fa-sign-in"></i> Logout</a>
        <!---->
    </div>



    <div id="main-content" class="allContent-section">
        <div class="row">
            <div class="col-sm-3">
                <div class="card" id="totalUser">
                    <i class="fa fa-users  mb-2" style="font-size: 70px;"></i>
                    <h4 style="color:white;">Total Users</h4>
                    <h5 style="color:white;">
                        <?php
                        $sql = "SELECT * from users where role='user'";
                        $result = $conn->query($sql);
                        $count = 0;
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {

                                $count = $count + 1;
                            }
                        }
                        echo $count;
                        ?></h5>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card" id="totalCate">
                    <i class="fa fa-th-large mb-2" style="font-size: 70px;"></i>
                    <h4 style="color:white;">Total Categories</h4>
                    <h5 style="color:white;">
                        <?php

                        $sql = "SELECT DISTINCT  category from musics";
                        $result = $conn->query($sql);
                        $count = 0;
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {

                                $count = $count + 1;
                            }
                        }
                        echo $count;
                        ?>
                    </h5>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card" id="totalMusic">
                    <i class="fa fa-th mb-2" style="font-size: 70px;"></i>
                    <h4 style="color:white;">Total Musics</h4>
                    <h5 style="color:white;">
                        <?php

                        $sql = "SELECT * from musics";
                        $result = $conn->query($sql);
                        $count = 0;
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {

                                $count = $count + 1;
                            }
                        }
                        echo $count;
                        ?>
                    </h5>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card" id="totalUploaded">
                    <i class="fa fa-th mb-2" style="font-size: 70px;"></i>
                    <h4 style="color:white;">Total Uploaded Today</h4>
                    <h5 style="color:white;">
                        <?php

                        $sql = "SELECT * from uploads";
                        $result = $conn->query($sql);
                        $count = 0;
                        $date = date('Y-m-d');
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                if ($row['date'] === $date) {
                                    $count = $count + 1;
                                }
                            }
                        }
                        echo $count;
                        ?>
                    </h5>
                </div>
            </div>
        </div>


        <!-- test -->
        <div class="row">
            <div class="col-sm-3">
                <div class="card" id="totalUser">
                    <i class="fa fa-users  mb-2" style="font-size: 70px;"></i>
                    <h4 style="color:white;">Total Users</h4>
                    <h5 style="color:white;">
                        <?php
                        $sql = "SELECT * from users where role='user'";
                        $result = $conn->query($sql);
                        $count = 0;
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {

                                $count = $count + 1;
                            }
                        }
                        echo $count;
                        ?></h5>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card" id="totalCate">
                    <i class="fa fa-th-large mb-2" style="font-size: 70px;"></i>
                    <h4 style="color:white;">Total Categories</h4>
                    <h5 style="color:white;">
                        <?php

                        $sql = "SELECT DISTINCT  category from musics";
                        $result = $conn->query($sql);
                        $count = 0;
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {

                                $count = $count + 1;
                            }
                        }
                        echo $count;
                        ?>
                    </h5>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card" id="totalMusic">
                    <i class="fa fa-th mb-2" style="font-size: 70px;"></i>
                    <h4 style="color:white;">Total Musics</h4>
                    <h5 style="color:white;">
                        <?php

                        $sql = "SELECT * from musics";
                        $result = $conn->query($sql);
                        $count = 0;
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {

                                $count = $count + 1;
                            }
                        }
                        echo $count;
                        ?>
                    </h5>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card" id="totalUploaded">
                    <i class="fa fa-th mb-2" style="font-size: 70px;"></i>
                    <h4 style="color:white;">Total Uploaded Today</h4>
                    <h5 style="color:white;">
                        <?php

                        $sql = "SELECT * from uploads";
                        $result = $conn->query($sql);
                        $count = 0;
                        $date = date('Y-m-d');
                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                if ($row['date'] === $date) {
                                    $count = $count + 1;
                                }
                            }
                        }
                        echo $count;
                        ?>
                    </h5>
                </div>
            </div>
        </div>

    </div>


    <script type="text/javascript" src="./assets/js/ajaxWork.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>

</html>