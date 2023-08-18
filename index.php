<?php
require('./controller/connect.php');
session_start();
if (!empty($_SESSION["id"])) {
    setcookie("u_id",  $_SESSION["id"], time() + (86400 * 30), "/");
    $id = $_SESSION["id"];
    $result = $conn->query("SELECT * FROM users WHERE u_id = '$id'");
    $row = $result->fetch_assoc();
} else {
    setcookie("u_id", "", time() - 3600);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="shortcut icon" type="image/png" href="./image/icon.png" /> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
        integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
        crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/main_nav_header.css">
    <link rel="stylesheet" href="./css/footer.css">

    <link rel="stylesheet" href="./css/search.css">
    <link rel="stylesheet" href="./css/fixed.css">
    <link rel="stylesheet" href="./css/main_left.css">
    <link rel="stylesheet" href="./css/main_right_playMusic.css">
    <link rel="stylesheet" href="./css/main_right_library.css">
    <link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="./css/same_flex.css">
    <link rel="stylesheet" href="./css/toast.css">
    <link rel="stylesheet" href="./css/logo.css">
    <link rel="stylesheet" href="./css/top_music.css">
    <link rel="stylesheet" href="./css/phantrang.css">

    <link rel="stylesheet" href="./css/mobile.css">

    <title>Music App</title>
</head>

<body>
    <audio id="audio" src="" style="display: none;" preload="metadata"></audio>
    <div id="toast"></div>
    <div id="toast--left"></div>


    <div class="container">
        <!-- main nav left -->
        <div class="main_left">
            <span class="close_profile close_nav_left">
                <ion-icon name="close"></ion-icon>
            </span>
            <div class="logo">
                <span>124</span>
                <span>M</span>
                <span>p</span>
                <span>3</span>

            </div>
            <div class="hedaer_mobile">
                <div class="user">
                    <div class="profile" style="<?php if (!empty($_SESSION["id"])) {
                                                    echo "display:block!important;";
                                                } else {
                                                    echo "";
                                                } ?>">
                        <img src="<?php if (!empty($_SESSION['id'])) {
                                        if ($row['img'] !== "") {
                                            echo "./uploads/" . $row['img'];
                                        }
                                    } else {
                                        echo "./uploads/avata_default.jpg";
                                    } ?>" id="imgUserMobile">
                    </div>
                    <div class="name_user_mobile">
                        <?php if (!empty($_SESSION["id"])) {
                            echo $row['name'];
                        } else {
                            echo "<button class='btn_login_mobile'><a href='./controller/login.php'>Đăng nhập</a></button>";
                        }
                        ?>
                    </div>

                </div>
            </div>
            <ul class="nav_mobile" id="nav_main_left">
                <li id="nav_home" class="active">
                    <a href="/home">
                        <ion-icon name="home-outline"></ion-icon>
                        Trang chủ
                    </a>
                </li>
                <li id="nav_discover">
                    <a href="/discover">
                        <ion-icon name="disc-outline"></ion-icon>
                        Khám phá
                    </a>
                </li>
                <li id="nav_library">
                    <a href="/library">
                        <ion-icon name="library-outline"></ion-icon>
                        Thư viện
                    </a>
                    <div class="message-library" id="message-library">
                        <h3>Thông báo</h3>
                        <p>Đăng nhập để tiếp tục </p>
                        <div class="nav-library">
                            <button class="latter">Để sau</button>
                            <button><a href="./controller/login.php">Đăng nhập</a></button>
                        </div>
                    </div>
                </li>
            </ul>
            <span></span>
            <ul style="margin-top: 12px;">
                <li id="likeMusic">
                    <a href="/bxh">
                        <ion-icon name="musical-note-outline"></ion-icon>
                        BXH Nhạc Mới
                    </a>
                </li>
                <li id="nav_phanloai">
                    <a href="/chude">
                        <ion-icon name="grid-outline"></ion-icon>
                        Chủ đề
                    </a>
                </li>
                <li id="nav_top_music">
                    <a href="/top">
                        <ion-icon name="star-outline"></ion-icon>
                        Top 100
                    </a>
                </li>
                <div id="yeucaulogin" style="<?php if (!empty($_SESSION["id"])) {
                                                    echo "display:none";
                                                }
                                                ?>
">
                    <div>
                        <p style="text-align:center;font-size:12px">
                            Đăng nhập để khám phá nhiều hơn.
                        </p>
                        <button class="btnLogin"><a href="./controller/login.php">Đăng nhập</a></button>

                    </div>
                </div>


                <li id="nav_playlist">
                    <a href="">
                        <ion-icon name="add-outline"></ion-icon>
                        Tạo playlist
                    </a>
                    <div class="message-library" id="message-playlist">
                        <h3>Thông báo</h3>
                        <p>Đăng nhập để tiếp tục </p>
                        <div class="nav-library">
                            <button class="latter">Để sau</button>
                            <button><a href="./controller/login.php">Đăng nhập</a></button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

        <!-- main right -->
        <div class="main_right">
            <header>
                <!-- back - next -->
                <div class="nav_header">
                    <div>
                        <ion-icon name="arrow-back-outline"></ion-icon>
                    </div>
                    <div>
                        <ion-icon name="arrow-forward-outline"></ion-icon>
                    </div>
                </div>

                <!-- serach input header -->
                <div class="search">
                    <input type="text" name="" id="searchInput" placeholder="Tìm kiếm bài hát, nghệ sĩ, lời bài hát,..."
                        autocomplete="off">
                    <label for="searchInput">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                    <ion-icon name="close" id="delSearch" class="same-icon-input"></ion-icon>
                    <ion-icon name="refresh" id="loadVal" class="same-icon-input"></ion-icon>
                    <div class="same_list_music listSearch" id="listSearch">
                        <div class="list_music_render">
                            <div class="titleSearch">Gợi ý kết quả</div>
                            <ul class="music">
                                <li style="display: flex;justify-content: center;align-items: center;">Bạn cần tìm kiếm
                                    gì nào?</li>

                            </ul>
                        </div>
                    </div>
                </div>
                <!-- mobile -->
                <div class="settings_header navMobile">
                    <ion-icon name="reorder-three-outline"></ion-icon>
                </div>
                <div class="logo">
                    <span>124</span>
                    <span>M</span>
                    <span>p</span>
                    <span>3</span>
                </div>

                <!-- search mobile -->
                <div class="searchMobile">
                    <div class="search search_mb">
                        <input type="text" name="" id="searchInputMb"
                            placeholder="Tìm kiếm bài hát, nghệ sĩ, lời bài hát,..." autocomplete="off">
                        <label for="searchInput">
                            <ion-icon name="search-outline"></ion-icon>
                        </label>
                        <div class="same_list_music listSearch" id="listSearchMb">
                            <div class="list_music_render">
                                <div class="titleSearch">Gợi ý kết quả</div>
                                <ul class="music">
                                    <li style="display: flex;justify-content: center;align-items: center;">Bạn cần tìm
                                        kiếm
                                        gì nào?</li>

                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- nav usser -->
                <div class="user">
                    <div class="settings_header searchIcon">
                        <ion-icon name="search-outline" class="active" id="show_search"></ion-icon>
                        <ion-icon name="close" id="hide_search"></ion-icon>
                    </div>
                    <div class="right_main_header" style="<?php if (!empty($_SESSION["id"])) {
                                                                echo "display:flex!important;";
                                                            } else {
                                                                echo "";
                                                            } ?>">
                        <div class="isPC dowload_win">
                            <button>
                                <ion-icon name="logo-windows"></ion-icon>Tải bản Windows
                            </button>
                        </div>
                        <div class="isPC icon settings">
                            <ion-icon name="settings-outline"></ion-icon>
                        </div>
                        <div class="profile" style="<?php if (!empty($_SESSION["id"])) {
                                                        echo "display:flex!important;";
                                                    } else {
                                                        echo "";
                                                    } ?>">

                            <img src="<?php if (!empty($_SESSION['id'])) {
                                            if ($row['img'] !== "") {
                                                echo "./uploads/" . $row['img'];
                                            }
                                        } else {
                                            echo "./uploads/avata_default.jpg";
                                        } ?>" id="imgUser">
                        </div>
                    </div>
                    <div class="nav_login" style="<?php if (!empty($_SESSION["id"])) {
                                                        echo "display:none;";
                                                    } else {
                                                        echo "display:flex;";
                                                    } ?>">
                        <button><a href="./controller/register.php">Đăng kí</a></button>
                        <button><a href="./controller/login.php">Đăng nhập</a></button>
                    </div>

                </div>
            </header>

            <main>
                <!-- Trang chu -->
                <div class="home" id="home">
                    <div class="first_home home_flex">
                        <div class="title_main">
                            Nổi bật
                            <a href="#">Hiện tất cả</a>
                        </div>
                        <ul>
                            <!-- render -->
                        </ul>
                    </div>
                    <div class="second_home home_flex">
                        <div class="title_main">
                            Spotify Playlists
                            <a href="#">Hiện tất cả</a>

                        </div>
                        <ul class="music">
                            <!-- render -->
                        </ul>
                    </div>
                </div>
                <!-- mian play music -->

                <!-- main_playlist -->

                <!-- discover - kham pha -->


                <!-- library - thu vien -->

            </main>

            <footer>
                <span>Copyright © 2023<a href="#"> Design and Code By An.</a> Tham khảo thoải mái 😄 </span>
            </footer>

            <!-- fixed bottom -->
            <div class="musicFixed">
                <div class="leftMusicFixed"></div>
                <div class="centerMusicFixed">
                    <ul class="navMusicFixed">
                        <li class="randomMusic">
                            <ion-icon name="shuffle-outline"></ion-icon>
                        </li>
                        <li class="prevMusic">
                            <ion-icon name="play-skip-back-outline"></ion-icon>
                        </li>
                        <li class="controlsMusic">
                            <ion-icon name="play"></ion-icon>
                            <ion-icon name="pause-outline" class="active"></ion-icon>
                        </li>
                        <li class="nextMusic">
                            <ion-icon name="play-skip-forward-outline"></ion-icon>
                        </li>
                        <li class="repeatMusic">
                            <ion-icon name="repeat-outline"></ion-icon>
                        </li>
                    </ul>

                    <div class="sliderMusic">
                        <div class="runTime">00:00</div>
                        <div class="slider">
                            <input id="progress" class="progress" type="range" value="0" step="1" min="0" max="100">
                            <div class="progressColor"></div>
                        </div>
                        <div class="sumTime">00:00</div>
                    </div>
                </div>

                <div class="rightMusicFixed">
                    <div class="volumeMusic">
                        <ion-icon name="volume-high-outline" class="high active"></ion-icon>
                        <ion-icon name="volume-mute-outline" class="mute"></ion-icon>
                        <div class="sliderMusic">
                            <div class="slider">
                                <input id="volumn" class="progress" type="range" value="50" min="0" max="100">
                                <div class="progressColor"></div>
                            </div>
                        </div>
                    </div>
                    <div class="btn_run_listPlaymusic">
                        <ion-icon name="list-outline"></ion-icon>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <!-- Danh sach phat fixed right -->
    <div class="list_play_music same_fixed_right ">
        <h2 style="text-align: center;padding:12px 0">Danh sách phát</h2>
        <div class="same_list_music playing_music">
            <div class="list_music_render">
                <div class="title_bold">Đang phát</div>
                <ul class="music">
                    <!-- render -->
                </ul>
            </div>
        </div>

        <div class="same_list_music next_music_list">
            <div class="list_music_render waiting_music">
                <div class="title_bold" style="margin-top: 16px;">Tiếp theo</div>
                <ul class="music">
                </ul>
            </div>
        </div>
    </div>

    <!-- profile -->
    <div class="same_fixed_right update_profile">
        <div class="header_profile">
            <span class="close_profile" id="close_profile">
                <ion-icon name="close"></ion-icon>
            </span>
            <span><a href="./controller/changePassword.php" style="text-decoration:underline;">Đổi mật khẩu</a></span>
        </div>
        <div class="main_profile">
            <div class="imgUser">
                <img src="<?php if ($row['img'] !== "") {
                                echo "./uploads/" . $row['img'];
                            } else {
                                echo "";
                            } ?>" alt="" id="imgProfile">
                <ion-icon name="camera"></ion-icon>
            </div>
            <ul>
                <li class="editNameUser" id="editNameUser">
                    <!-- <h3 class="nameUser"></h3> -->
                    <div class="nameUser">
                        <input type="text" value="<?php
                                                    if (!empty($_SESSION['id'])) {
                                                        echo $row['name'];
                                                    } else {
                                                        echo "";
                                                    }
                                                    ?>" readonly id="name_user">
                    </div>

                    <div class="submit">
                        <ion-icon name="pencil" id="change_name"></ion-icon>
                        <ion-icon name="checkmark-done-circle" id="save_name"></ion-icon>
                    </div>
                </li>
                <li>
                    <?php
                    if (!empty($_SESSION['id'])) {
                        list($year, $month, $date) = explode('-', $row['birthday']);
                        echo "$date-$month-$year";
                    } else {
                        echo "";
                    }
                    ?>
                </li>
                <li>
                    <div class="videoUp">
                        <div class="quatity">50</div>
                        <span>Video</span>
                    </div>
                    <div class="subscribers">
                        <div class="quatity">24k</div>
                        <span>Subscribers</span>
                    </div>
                </li>
            </ul>
        </div>

        <div class="nav_profile_user">
            <button class="active"><?php
                                    if (!empty($row) && $row['role'] === 'admin') {
                                        echo '<a href="#" id="adminPage">Admin page';
                                    } else {
                                        echo '<a href="#" id="upload">Up load<ion-icon name="cloud-upload-outline">';
                                    }
                                    ?></ion-icon>
                </a></button>
            <button><a href="./controller/logout.php">Log out
                    <ion-icon name="log-out-outline"></ion-icon>
                </a>
            </button>

        </div>

        <div class="same_list_music next_music_list">
            <div class="list_music_render playlist">
                <div class="title_bold" style="margin-top: 30px; font-weight:bold;font-size:20px">Đã tải lên</div>
                <ul class="music" id="upLoaded_profile">
                    <!-- render list music -->
                    <li>Chưa có bài hát nào được thêm vào hoặc tải lên.
                    </li>

                </ul>
            </div>
        </div>
    </div>


    <!-- create playlist -->
    <div id="form_upload_playlist" class="form_upload">
        <div>
            <h3>Tạo playlist mới</h3>
            <form id="form_playlist" method="POST" enctype="multipart/form-data"
                action="./controller/create_playlist.php">
                <input type="text" placeholder="Nhập tên playlist" name="name_playlist" id="name_playlist"><br>
                <div class="img_upload">
                    <label for="fileUploadPlaylist">Ảnh nền: </label>
                    <input type="file" name="fileUploadPlaylist" id="fileUploadPlaylist">
                </div>
                <input type="submit" value="Tạo mới" name="btn-create-playlist" id="btn-create-playlist">
            </form>
            <ion-icon name="close" class="close_form"></ion-icon>
        </div>
    </div>



    <!-- form upload video -->
    <div class="form_upload form_upload_music" id="form_upload_music">
        <div>
            <h3>Upload music</h3>
            <form id="form_music" method="POST" enctype="multipart/form-data" action="./controller/upload_video.php"
                autocomplete="false">
                <input type="text" placeholder="Nhập tên bài hát" name="name_video" id="m_name_up"><br>
                <input type="text" placeholder="Tên người thể hiện" name="name_artist" id="m_artist_up"><br>
                <input type="text" placeholder="Thời gian" name="time" id="m_time_up"><br>
                <input type="text" placeholder="Quốc gia" name="nation" id="m_nation_up"><br>
                <input type=" text" placeholder="Thể loại" name="category" id="m_category_up"><br>

                <div class="img_upload" style="margin: 4px 0;">
                    <label for="fileUploadIcon">Icon: </label>
                    <input type="file" name="fileUploadIcon" id="fileUploadIcon">
                </div>
                <div class="img_upload" style="margin: 4px 0;">
                    <label for="fileUploadMusic">Liên kết: </label>
                    <input type="file" name="fileUploadMusic" id="fileUploadMusic">
                </div>
                <input type="submit" value="Đăng" name="btn-upload-music" id="btn-upload-music">
            </form>
            <ion-icon name="close" class="close_form"></ion-icon>
        </div>
    </div>



    <!-- form upload avatar user -->
    <div class="form_upload form_upload_music" id="form_upload_avatar">
        <div>
            <h3>Upload avatar</h3>
            <form action="./controller/upload_img.php" method="POST" enctype="multipart/form-data" id="form_avatar">
                <div class="img_upload">
                    <input type="file" name="fileUploadAvatar" id="fileUploadAvatar">
                </div>
                <div class="btn-avatar" style="display: flex; justify-content: space-between;">
                    <input type="submit" value="Lưu" name="btn-upload-avatar" style="margin-right: 10px;"
                        id="btn-upload-avatar">
                    <input type="submit" value="Gỡ ảnh cũ" name="btn-remove-avatar" id="btn-remove-avatar"
                        style="background-color: gray!important;">
                </div>

            </form>
            <ion-icon name="close" class="close_form"></ion-icon>
        </div>
    </div>

    <!-- comfirm custom -->
    <div class="confirm_dialog">
        <div class="dialog">
            <h3>Thông báo</h3>
            <p></p>
            <div class="nav-library">
                <button class="latter"><a href="#" id="no">Không</a></button>
                <button class="active"><a href="#" id="yes">Có</a></button>
            </div>
        </div>
    </div>


    <div class="img_playMusic_mobile">
        <img src="./uploads/1.jpg" alt="">
    </div>

    <div id="blur" class="blur"></div>

    <!-- <div class="blur" id="loading"></div> -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="./js/app-clone.js" type="module"></script>
    <script src="./js/script_mobile.js" type="module"></script>

</body>

</html>