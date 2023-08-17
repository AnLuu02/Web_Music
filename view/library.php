<div class="play_music" id="playlist_main">
    <div class="sub_left">
        <div class="audio">
            <img src="" alt="">
            <div class="runAudio">
                <div><span></span><span></span><span></span><span></span></div>
            </div>
            <div class="hover_img">
                <ion-icon name="play"></ion-icon>
            </div>
        </div>
        <div class="name_music name_playlist"></div>
        <div class="des">
            <div class="author author_playlist"></div>
        </div>
        <div class="like dateCreate"></div>

    </div>


    <div class="sub_right same_list_music">
        <div class="list_music_render" id="list_music_playlist">
            <div class="titleHeaderMusic">
                <div>BÀI HÁT</div>
                <div>THỜI GIAN</div>
            </div>
            <ul class="music">
                <!-- render list music -->
            </ul>
        </div>

        <div class="message_null_playlist">
            <ion-icon name="musical-notes-outline"></ion-icon>
            <div class="message">Không có bài hát trong playlist của bạn</div>
        </div>

        <div class="list_music_render hintMusic">
            <div class="titleListCare">Gợi ý cho bạn</div>
            <div class="text">Dựa trên tiêu đề của playlist này</div>
            <ul class="music" id="hintMusic">
                <!-- render music care -->
            </ul>
        </div>
    </div>
</div>


<div class="library" id="library">
    <h1 class="header_library">
        THƯ VIỆN
        <ion-icon name="play"></ion-icon>
    </h1>
    <h2>PLAYLIST
        <ion-icon name="add" id="create_pl"></ion-icon>
    </h2>
    <ul class="list_playlist" id="list_playlist"></ul>
    <ul class="nav_library">
        <li class="active"><a href="#">BÀI HÁT</a></li>
        <li><a href="#">ALBUM</a></li>
        <li><a href="#">MV</a></li>
    </ul>
    <span class="line"></span>
    <ul class="sub_nav_library">
        <li class="active" id="liked">Yêu thích</li>
        <li id="upLoaded">Đã tải lên</li>

    </ul>
    <div class="same_list_music" id="list_music_library">
        <div class="list_music_render">
            <div class="titleHeaderMusic">
                <div>BÀI HÁT</div>
                <div>THỜI GIAN</div>
            </div>
            <ul id="data_library" class="music">
                <!-- render list music -->
                <li>Không có bài hát nào</li>

            </ul>
        </div>
    </div>
</div>