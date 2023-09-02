<div class="play_music" id="play_music" category="">
    <div class="sub_left">
        <div class="audio">
            <img src="" alt="">
            <div class="runAudio">
                <div><span></span><span></span><span></span><span></span></div>
            </div>
        </div>
        <div class="name_music"></div>
        <div class="des">
            <div class="author" id="name_artist"></div>
            <span>-</span>
            <div class="releaseDate"></div>
        </div>
        <div class="like"></div>
        <div class="controls">
            <button class="btnPlay active">
                <ion-icon name="play"></ion-icon> TIẾP TỤC PHÁT
            </button>
            <button class="btnPause">
                <ion-icon name="pause-outline"></ion-icon> TẠM DỪNG
            </button>
        </div>

        <div class="anotherChoice">
            <div class="icon" style="margin-right: 10px;">
                <div class="tooltip">
                    <ion-icon name="heart" id="add_music_plm"></ion-icon>
                    <span class="tooltiptext">Thêm vào thư viện</span>
                </div>
            </div>
            <div class="icon">
                <div class="tooltip">
                    <ion-icon name="add-outline" id="add_playlist_plm"></ion-icon>
                    <span class="tooltiptext">Thêm vào Play list</span>
                </div>
            </div>

            <div class="list_choose_playlist">
                <h3>Danh sách</h3>
                <ul class="load_list_playlist">
                    Không có playlist
                </ul>
            </div>
        </div>
    </div>


    <div class="sub_right same_list_music">
        <div class="list_music_playing list_music_render" id="listening">
            <div class="titleHeaderMusic">
                <div>BÀI HÁT</div>
                <div>THỜI GIAN</div>
            </div>
            <ul class="">
                <!-- render list music -->
            </ul>
        </div>

        <div class="list_music_render careMusic">
            <div class="titleListCare">CÓ THỂ BẠN QUAN TÂM</div>
            <div class="titleHeaderMusic">
                <div>BÀI HÁT</div>
                <div>THỜI GIAN</div>
            </div>
            <ul class="music" id="careMusic">
                <!-- render music care -->
            </ul>
        </div>
    </div>
</div>