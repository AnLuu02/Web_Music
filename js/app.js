document.addEventListener('DOMContentLoaded', () => {

    document.querySelector(".logo").addEventListener('click', () => {
        window.location = "/";
    })
    window.onscroll = function () {
        if (Math.floor(this.scrollY) > 0) {
            document.querySelector('.main_right header').style.background = '#1b2035';
            if (Math.floor(this.scrollY) >= 490) {
                document.querySelectorAll('.aim').forEach(item => {
                    item.style.display = `none`;
                })
            } else {
                document.querySelectorAll('.aim').forEach(item => {
                    item.style.display = `block`;
                })
            }
        } else {
            document.querySelector('.main_right header').style.background = 'transparent';
        }
    }

    function formatDDMMYY(date) {
        let arr = date.split("-");
        return arr[2] + "-" + arr[1] + "-" + arr[0];
    }


    // move nav_playlist
    function check_show_musicbox() {
        if ($('.musicFixed').attr("style") && $('.musicFixed').attr("style").includes('display') && window.innerWidth > 768) {
            $('#nav_playlist').css({ "bottom": '100px' });
        }
    }

    function panigation(limit, total_music, elemContainer) {
        let currentPage;
        let start;
        let end;
        let newArr;
        let html = "<li>Prev</li>";
        let totalPage = Math.ceil(total_music.length / limit);
        for (let i = 0; i < totalPage; i++) {
            currentPage = i + 1;
            start = (currentPage - 1) * limit;
            end = currentPage * limit - 1;
            newArr = total_music.slice(start, end + 1);
            html += `<li>${currentPage}</li>`;
        }
        html += `<li>Next</li>`;
        elemContainer.innerHTML = html;
    }


    // // play video
    const audio = document.getElementById('audio');
    const btn_toggle_music = document.querySelector('.controlsMusic');
    const musicFixed = document.querySelector('.musicFixed');
    const progressColor = document.querySelector('.progressColor');
    const progress = document.querySelector('#progress');
    const runTime = document.querySelector('.sliderMusic .runTime');
    const sumTime = document.querySelector('.sliderMusic .sumTime');
    const music_fixed_left = document.querySelector('.musicFixed .leftMusicFixed');
    const repeatMusic = document.querySelector('.musicFixed .repeatMusic');
    const randomMusic = document.querySelector('.musicFixed .randomMusic');
    const nextMusic = document.querySelector('.musicFixed .nextMusic');
    const prevMusic = document.querySelector('.musicFixed .prevMusic');
    const highVolumn = document.querySelector('.volumeMusic .high');
    const muteVolumn = document.querySelector('.volumeMusic .mute');
    let second = '';
    let countSecond = 0;
    let minute = '';
    let countMinute = 0;

    let isRepeat = false;
    let isRandom = false;
    let isPlaying = false;
    let isPaused = false;

    let currentIndex = -1;
    let currentId = 0;
    let uID = $.cookie('u_id');


    document.querySelectorAll('.latter').forEach(item => {
        item.addEventListener('click', e => {
            if (e.target === e.currentTarget) {
                if (e.target.closest('#message-library')) {
                    e.target.closest('#message-library').classList.remove('active');
                }
                if (e.target.closest('#message-playlist')) {
                    e.target.closest('#message-playlist').classList.remove('active');
                }
            }
        })
    })

    document.querySelector('#nav_playlist a').addEventListener('click', () => {
        if (window.innerWidth > 768) {
            if (uID == undefined) {
                document.getElementById('message-playlist').classList.add('active');
                $('#blur').css({ 'display': 'block', 'z-index': '99996' });
                $('#blur').click(function (e) {
                    if (e.target === e.currentTarget) {
                        document.getElementById('message-playlist').classList.remove('active');
                        $('#blur').css('display', 'none');
                    }
                })
                if (document.getElementById('message-library').classList.contains('active')) {
                    document.getElementById('message-library').classList.remove('active');
                }
            } else {
                document.getElementById('form_upload_playlist').classList.add('active');
                if (window.innerWidth <= 768) {
                    document.querySelector('.container .main_left').classList.remove('active');
                    $('#blur').css('display', 'none');
                }
            }
        } else {
            if (document.querySelector('.musicFixed.active')) {
                document.querySelector('.musicFixed.active').classList.remove('active');
            }
            if (uID === undefined) {
                $('.confirm_dialog').css("display", "flex");
                $('.confirm_dialog').css("z-index", "10000000000000000000000000000000000000000000");
                $('.confirm_dialog p').text('Đăng nhập để tiếp tục.');
                $('.confirm_dialog a#yes').text('Đăng nhập');
                $('.confirm_dialog a#yes').attr('href', './view/login.php');
                $('.confirm_dialog a#no').text('Để sau');

                document.querySelector('.confirm_dialog').addEventListener('click', e => {
                    if (e.target === e.currentTarget) {
                        e.target.style.display = 'none';
                        $('#blur').css('display', 'block');

                    }
                })

                $('.confirm_dialog a#no').click(function (e) {
                    $('.confirm_dialog').css("display", "none");
                    $('#blur').css('display', 'block');
                })
            } else {
                document.getElementById('form_upload_playlist').classList.add('active');
                if (window.innerWidth <= 768) {
                    document.querySelector('.container .main_left').classList.remove('active');
                    $('#blur').css('display', 'none');
                }
            }

        }
    })

    document.querySelector('#nav_library a').addEventListener('click', (e) => {
        if (window.innerWidth > 768) {
            if (uID == undefined) {
                document.getElementById('message-library').classList.add('active');
                $('#blur').css({ 'display': 'block', 'z-index': '99996' });
                $('#blur').click(function (e) {
                    if (e.target === e.currentTarget) {
                        document.getElementById('message-library').classList.remove('active');
                        $('#blur').css('display', 'none');
                    }
                })
                if (document.getElementById('message-playlist').classList.contains('active')) {
                    document.getElementById('message-playlist').classList.remove('active');
                }
            }
        } else {
            if (document.querySelector('.musicFixed.active')) {
                document.querySelector('.musicFixed.active').classList.remove('active');
            }
            if (uID == undefined) {
                $('.confirm_dialog').css("display", "flex");
                $('.confirm_dialog').css("z-index", "10000000000000000000000000000000000000000000");
                $('.confirm_dialog p').text('Đăng nhập để tiếp tục.');
                $('.confirm_dialog a#yes').text('Đăng nhập');
                $('.confirm_dialog a#yes').attr('href', './view/login.php');
                $('.confirm_dialog a#no').text('Để sau');
                document.querySelector('.confirm_dialog').addEventListener('click', e => {
                    if (e.target === e.currentTarget) {
                        e.target.style.display = 'none';
                        $('#blur').css('display', 'block');
                    }
                })

                $('.confirm_dialog a#no').click(function (e) {
                    $('.confirm_dialog').css("display", "none");
                    $('#blur').css('display', 'block');


                })
            }
        }
    })
    // // khi song play
    audio.onplay = function () {
        isPlaying = true;
        isPaused = false;
        btn_toggle_music.querySelector('ion-icon[name="pause-outline"]').classList.add('active');
        btn_toggle_music.querySelector('ion-icon[name="play"]').classList.remove('active');
        let last_music_id = $.cookie('last_music_id');

        if (last_music_id > 0) {
            if (document.querySelectorAll(`ul.music li.song[id_song="${last_music_id}"]`)) {
                document.querySelectorAll(`ul.music li.song[id_song="${last_music_id}"]`).forEach(elem => {
                    if (elem.querySelector('.playMusic') && elem.querySelector('.runAudio')) {
                        elem.querySelector('.playMusic').classList.remove('active');
                        elem.querySelector('.runAudio').classList.remove('active');
                    }

                })
            }
        }
        if (document.querySelectorAll(`ul.music li.song[id_song="${currentId}"]`)) {
            document.querySelectorAll(`ul.music li.song[id_song="${currentId}"]`).forEach(elem => {
                elem.classList.add('active');

            })
        }
        if (document.querySelectorAll(`ul.music li.song[id_song="${currentId}"].active .playMusic`) &&
            document.querySelectorAll(`ul.music li.song[id_song="${currentId}"].active .runAudio`)) {
            document.querySelectorAll(`ul.music li.song[id_song="${currentId}"].active`).forEach(elem => {
                if (elem.querySelector('.playMusic') && elem.querySelector('.runAudio')) {
                    elem.querySelector('.playMusic').classList.add('active');
                    elem.querySelector('.runAudio').classList.add('active');
                }
            })
        }
        if (window.innerWidth <= 768) {
            document.querySelector('.img_playMusic_mobile').style.display = 'block';
        }
    }
    // // khi song pause
    audio.onpause = function () {
        isPlaying = false;
        isPaused = true;
        btn_toggle_music.querySelector('ion-icon[name="play"]').classList.add('active');
        btn_toggle_music.querySelector('ion-icon[name="pause-outline"]').classList.remove('active');
        if (document.querySelector('ul.music li.song.active .playMusic') && document.querySelector('ul.music li.song.active .runAudio')) {
            document.querySelector('ul.music li.song.active .playMusic').classList.remove('active');
            document.querySelector('ul.music li.song.active .runAudio').classList.remove('active');
        }
    }

    btn_toggle_music.onclick = function () {
        if (isPlaying) {
            audio.pause();
        } else {
            audio.play();

        }
    }

    // // progress slider
    progress.oninput = function (e) {
        if (audio.currentTime) {
            const seekTime = (audio.duration / 100) * Number(e.target.value);
            audio.currentTime = seekTime.toFixed(0);
        }

    };
    audio.ontimeupdate = function () {
        if (audio.duration) {
            const progressPercent = Math.floor((audio.currentTime / audio.duration) * 100);
            progress.value = Math.floor((audio.currentTime / audio.duration) * 100);
            progressColor.style.right = 100 - progressPercent + '%';
            // set second
            countSecond = Math.floor(audio.currentTime % 60);
            countMinute = Math.floor(audio.currentTime / 60);
            second = countSecond < 10 ? '0' + countSecond : countSecond;
            minute = countMinute < 10 ? '0' + countMinute : countMinute;
            runTime.innerHTML = `${minute}:${second}`
        }
    }


    // // repeat music
    repeatMusic.onclick = function (e) {
        isRepeat = true;
        if (e.target.parentElement.classList.contains('active')) {
            e.target.parentElement.classList.remove('active');
        } else {
            e.target.parentElement.classList.add('active');
            if (randomMusic.classList.contains('active')) {
                randomMusic.classList.remove('active');
                isRandom = false;
            }
        }
    }
    randomMusic.onclick = function (e) {
        isRandom = true;
        if (e.target.parentElement.classList.contains('active')) {
            e.target.parentElement.classList.remove('active');
        } else {
            e.target.parentElement.classList.add('active');
            if (repeatMusic.classList.contains('active')) {
                repeatMusic.classList.remove('active');
                isRepeat = false;
            }
        }
    }

    // volumn
    audio.volume = 0.5;
    document.querySelector('.volumeMusic input').oninput = function (e) {
        let volumnVal = (e.target.value) / 100;
        audio.volume = volumnVal;
        document.querySelector('.rightMusicFixed .progressColor').style.right = (1 - volumnVal) * 100 + '%';
        if (e.target.value <= 0) {
            highVolumn.classList.remove('active')
            muteVolumn.classList.add('active')
        } else {
            highVolumn.classList.add('active')
            muteVolumn.classList.remove('active')

        }
    }
    highVolumn.addEventListener('click', e => {
        if (e.target === e.currentTarget) {
            e.target.classList.toggle('active');
            muteVolumn.classList.add('active')
            audio.volume = 0;
            document.querySelector('.rightMusicFixed .progressColor').style.right = 100 + '%';
        }
    })
    muteVolumn.addEventListener('click', e => {
        if (e.target === e.currentTarget) {
            e.target.classList.toggle('active');
            highVolumn.classList.add('active')
            audio.volume = 0.5;
            document.querySelector('.rightMusicFixed .progressColor').style.right = 50 + '%';

        }
    })

    function loadCurrentSong(musics) {
        audio.src = musics[currentIndex].src;
    }

    function load_music_fixed() {
        $.get('./controller/select_data.php', { 'song_id': currentId }, function (response) {
            let res = JSON.parse(response);
            if (res.error !== 1) {
                let data = res.song;
                listening_Music(data, $('.list_music_playing > ul'));
                if ($('#play_music').attr('category') === "playmusic") {
                    $('.play_music .audio img').attr('src', data.img);
                    $('.play_music .name_music').html(data.name);
                    $('.play_music .des .author').html(data.artist);
                    if ($('.play_music .releaseDate')) {
                        $('.play_music .releaseDate').html(formatDDMMYY(data.date));
                    }
                    if ($('.play_music .sub_left .like')) {
                        $('.play_music .sub_left .like').html(`Lượt nghe: ${data.quatityLis}`);
                    }
                    // handle icon playmusic
                    handlePlayMusic(document.querySelector('.anotherChoice'), data);
                }

                if (document.querySelector('.img_playMusic_mobile img')) {
                    document.querySelector('.img_playMusic_mobile img').src = data.img;
                }


                audio.addEventListener('play', () => {
                    $('.btnPause').addClass('active');
                    $('.btnPlay').removeClass('active');
                    $('.list_music_playing li > div:first-child ion-icon').css('animationPlayState', 'running');
                    $('.play_music .sub_left .runAudio').addClass('active');

                })
                audio.addEventListener('pause', () => {
                    $('.btnPlay').addClass('active');
                    $('.btnPause').removeClass('active');
                    $('.list_music_playing li > div:first-child ion-icon').css('animationPlayState', 'paused');
                    $('.play_music .sub_left .runAudio').removeClass('active');

                })
            } else {
                alert('empty');
            }
        })
    }

    function eventClick(musics, event, isClick = "") {
        let songNode;
        if (isClick == "" || isClick == "search") {
            document.querySelectorAll('.song.active').forEach(item => {
                item.classList.remove('active');
            })
            if (event.target.closest('#all_playmusic')) {
                let idSong = Math.floor(Math.random() * musics.length);
                songNode = document.querySelector(`ul.music li.song[id_song="${musics[idSong].m_id}"]`);
                songNode.classList.add('active');
                currentIndex = Number(songNode.getAttribute('index'));
                $.cookie('last_music_id', currentId);
                currentId = musics[currentIndex].m_id;
            } else {
                songNode = event.target.closest('ul.music li.song');
                songNode.classList.add('active');
                currentIndex = Number(songNode.getAttribute('index'));
                $.cookie('last_music_id', currentId);
                currentId = musics[currentIndex].m_id;
            }

            audio.onended = function () {
                jQuery.ajax({
                    url: './controller/select_data.php',
                    type: 'POST',
                    dataType: 'html',
                    data: { "song_id": currentId, "updateListen": "updateListen" },
                    success: function (ketqua) {

                    }
                });
                if (isRepeat) {
                    audio.play();
                } else if (isRandom) {
                    let newIndex;
                    do {
                        newIndex = Math.floor(Math.random() * musics.length);
                    } while (newIndex === currentIndex);
                    currentIndex = newIndex;
                    $.cookie('last_music_id', currentId);


                    currentId = musics[currentIndex].m_id;
                    isPlaying = true;
                    isPaused = false;
                    loadCurrentSong(musics);
                    audio.play();
                    musicFixed.style.display = 'flex';
                    load_music_fixed_left(musics[currentIndex]);
                    sumTime.innerHTML = musics[currentIndex].time;
                    document.querySelectorAll('ul.music li.song.active').forEach(item => {
                        item.classList.remove('active');
                    })
                    if (document.querySelectorAll(`ul.music li.song[id_song="${currentId}"]`)) {
                        document.querySelectorAll(`ul.music li.song[id_song="${currentId}"]`).forEach(elem => {
                            elem.classList.add('active');

                        })
                    }
                    load_music_fixed();
                } else {
                    audio.pause();
                }
            }
            nextMusic.onclick = function () {
                currentIndex++;
                if (currentIndex >= musics.length) {
                    currentIndex = 0;
                }
                $.cookie('last_music_id', currentId);

                currentId = musics[currentIndex].m_id;
                loadCurrentSong(musics);
                audio.play();
                musicFixed.style.display = 'flex';
                load_music_fixed_left(musics[currentIndex]);
                sumTime.innerHTML = musics[currentIndex].time;
                document.querySelectorAll('ul.music li.song.active').forEach(item => {
                    item.classList.remove('active');
                })
                if (document.querySelectorAll(`ul.music li.song[id_song="${currentId}"]`)) {
                    document.querySelectorAll(`ul.music li.song[id_song="${currentId}"]`).forEach(elem => {
                        elem.classList.add('active');

                    })
                }
                load_music_fixed();

            }
            prevMusic.onclick = function () {
                currentIndex--;
                if (currentIndex < 0) {
                    currentIndex = musics.length - 1;
                }
                $.cookie('last_music_id', currentId);

                currentId = musics[currentIndex].m_id;
                loadCurrentSong(musics);
                audio.play();
                musicFixed.style.display = 'flex';
                load_music_fixed_left(musics[currentIndex]);
                sumTime.innerHTML = musics[currentIndex].time;
                document.querySelectorAll('ul.music li.song.active').forEach(item => {
                    item.classList.remove('active');
                })
                if (document.querySelectorAll(`ul.music li.song[id_song="${currentId}"]`)) {
                    document.querySelectorAll(`ul.music li.song[id_song="${currentId}"]`).forEach(elem => {
                        elem.classList.add('active');

                    })
                }
                load_music_fixed();

            }
            isPlaying = true;
            isPaused = false;
            loadCurrentSong(musics);
            audio.play();
            musicFixed.style.display = 'flex';
            load_music_fixed_left(musics[currentIndex]);
            sumTime.innerHTML = musics[currentIndex].time;
            load_music_fixed();


            if (isClick == "search") {
                document.querySelectorAll('ul.music li.song').forEach(item => item.remove());
                $("main").load('./view/playmusic.php', function () {
                    $('#play_music').attr('category', 'playmusic');
                    $('.btnPause').addClass('active');
                    $('.btnPlay').removeClass('active');
                    $('.list_music_playing li > div:first-child ion-icon').css('animationPlayState', 'running');
                    $('.play_music .sub_left .runAudio').addClass('active');
                    $('.btnPlay').click(function () {
                        audio.play();
                    })
                    $('.btnPause').click(function () {
                        audio.pause();

                    })
                    load_music_fixed();
                    $.get('./controller/select_data.php', { 'key': "getAllData" }, function (response) {
                        let res = JSON.parse(response);
                        if (res.error !== 1) {
                            let datas = JSON.parse(res.data_music);
                            load_music(datas, document.querySelector('#careMusic'));
                            handlePlayMusic(document.querySelector('#careMusic'), datas);
                        } else {
                            alert(res.message);
                        }
                    })
                });
                $("#listSearch").css("display", "none");
                $("#searchInput").val("");
                $('#blur').css('display', 'none');

            }
        } else if (isClick === "add_library") {
            let id;
            if (event.target.closest('#add_music_plm')) {
                id = currentId;
            } else {
                id = event.target.closest('ul.music li.song').getAttribute('id_song');
            }
            let data = { 'id': id, 'action': "add" };
            jQuery.ajax({
                url: './controller/addLibrary.php',
                type: 'POST',
                dataType: 'html',
                data: data,
                success: function (ketqua) {
                    if (ketqua == "success") {
                        toast({
                            title: "Thành công!",
                            message: "Bài hát đã được thêm vào.",
                            type: "success",
                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,
                            duration: 1000
                        });

                    } else if (ketqua == "existed") {
                        toast({
                            title: "Cảnh báo!",
                            message: "Bài hát này đã có trong thư viện.",
                            type: "warning",
                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                            duration: 1000
                        });


                    } else {
                        toast({
                            title: "Cảnh báo!",
                            message: "Đăng nhập để tiếp tục.",
                            type: "error",
                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                            duration: 1000
                        });


                    }
                }
            });
        } else if (isClick == "delete_library") {
            let category = event.target.closest('ul').getAttribute('category')
            let id = event.target.closest('ul.music li.song').getAttribute('id_song');
            let pl_id = $.cookie('pl_id');
            let data = { 'id': id, 'action': "delete", "pl_id": pl_id, 'category': category };
            let elem = event.target.closest('ul.music li.song');
            jQuery.ajax({
                url: './controller/addLibrary.php',
                type: 'POST',
                dataType: 'html',
                data: data,
                success: function (ketqua) {
                    if (ketqua == "success") {
                        toast({
                            title: "Thành công!",
                            message: "Xóa bài hát yêu thích thành công.",
                            type: "success",
                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                            duration: 1000
                        });

                        elem.remove();
                        let pl_id = $.cookie('pl_id');
                        let data_get_plItem = { "u_id": uID, "pl_id": pl_id, "action": "getPlaylistItem" };
                        jQuery.get("./controller/select_data.php", data_get_plItem, function (response) {
                            let res = JSON.parse(response);
                            // khoong co bai hat nao trong playlist
                            if (res.error) {
                                document.querySelector('#list_music_playlist').classList.remove('active');
                                document.querySelector('.message_null_playlist').classList.remove('active');
                            }
                        })

                        if (category === "uploaded") {
                            var data = { 'u_id': uID, 'btn_uploaded_id': "upLoaded" };
                            $.get("./controller/select_data.php", data, function (response) {
                                let res = JSON.parse(response);
                                if (res.error == 1) {
                                    $('#data_library').html(`<li style="padding-left:20px">${res.message}</li>`);
                                    $('#upLoaded_profile').html(`<li style="padding-left:20px">${res.message}</li>`);

                                }
                            });
                        } else {
                            var data = { 'u_id': uID, 'btn_uploaded_id': "liked" };
                            $.get("./controller/select_data.php", data, function (response) {
                                let res = JSON.parse(response);
                                if (res.error == 1) {
                                    $('#data_library').html(`<li style="padding-left:20px">${res.message}</li>`);
                                }
                            });
                        }
                    } else if (ketqua == "UserExits") {
                        toast({
                            title: "Cảnh báo!",
                            message: "Nguời dùng không tồn tại.",
                            type: "warning",
                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                            duration: 1000
                        });


                    } else {
                        toast({
                            title: "Cảnh báo!",
                            message: "Đăng nhập để tiếp tục.",
                            type: "error",
                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                            duration: 1000
                        });


                    }
                }
            });
        } else if (isClick == "add_playlist") {
            if (uID != undefined) {
                let _event = event;
                if (event.target.closest('ul.music li.song')) {
                    if (document.querySelector('.list_choose_playlist.active'))
                        document.querySelector('.list_choose_playlist.active').classList.remove('active');
                    event.target.closest('ul.music li.song').querySelector('.list_choose_playlist').classList.toggle('active');
                    $('#blur').css('display', 'block');
                    $('#blur').click(function (e) {
                        if (e.target === e.currentTarget) {
                            event.target.closest('ul.music li.song').querySelector('.list_choose_playlist').classList.remove('active');
                            $('#blur').css('display', 'none');
                        }
                    })
                }
                var data = { 'u_id': uID, "getPlaylist": "getPlaylist" };
                jQuery.get("./controller/select_data.php", data, function (response) {
                    let res = JSON.parse(response);
                    let data = "";
                    let plNode = "";
                    if (res.error !== 1) {
                        data = JSON.parse(res.data_playlist);
                        if (_event.target.closest('ul.music li.song').querySelector('.load_list_playlist')) {
                            plNode = _event.target.closest('ul.music li.song').querySelector('.load_list_playlist');
                            load_list_playlist(data, _event.target.closest('ul.music li.song').querySelector('.load_list_playlist'));
                            plNode.onclick = e => {
                                if (e.target.closest('li._playlist')) {
                                    if (e.target.closest('.list_choose_playlist')) {
                                        e.target.closest('.list_choose_playlist').classList.remove('active');
                                    }
                                    let songId;
                                    if (_event.target.closest('ul.music li.song')) {
                                        songId = _event.target.closest('ul.music li.song').getAttribute('id_song');
                                    }
                                    if (_event.target.closest('#careMusic li.song')) {
                                        _event.target.closest('#careMusic li.song').remove();
                                    }
                                    let pl_id = e.target.getAttribute("id_playlist");
                                    let data = { 'id': songId, "pl_id": pl_id, 'action': "add_playlist" };
                                    jQuery.ajax({
                                        url: './controller/addLibrary.php',
                                        type: 'POST',
                                        dataType: 'html',
                                        data: data,
                                        success: function (ketqua) {
                                            if (ketqua === "success_add_pl") {
                                                toast({
                                                    title: "Thành công!",
                                                    message: "Bài hát đã được thêm vào.",
                                                    type: "success",
                                                    position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                                                    duration: 1000
                                                });

                                                $('#blur').css('display', 'none');

                                                let pl_id = $.cookie('pl_id');
                                                let data_get_plItem = { "u_id": uID, "pl_id": pl_id, "action": "getPlaylistItem" };
                                                jQuery.get("./controller/select_data.php", data_get_plItem, function (response) {
                                                    let res = JSON.parse(response);
                                                    let data = "";
                                                    if (res.error !== 1) {
                                                        data = JSON.parse(res.data_playlist_item);
                                                        if (document.querySelector('#list_music_playlist') != null && document.querySelector('.message_null_playlist') != null) {
                                                            document.querySelector('#list_music_playlist').classList.add('active');
                                                            document.querySelector('.message_null_playlist').classList.add('active');
                                                            load_music(data, document.querySelector('#list_music_playlist ul'), true);
                                                            document.querySelector('#list_music_playlist ul').setAttribute('category', 'playlisted');
                                                            handlePlayMusic(document.querySelector('#list_music_playlist ul'), data);
                                                        }
                                                    }
                                                })
                                            } else if (ketqua === "existed") {
                                                toast({
                                                    title: "Cảnh báo!",
                                                    message: "Bài hát đã có trong playlist.",
                                                    type: "warning",
                                                    position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                                                    duration: 1000
                                                });

                                                $('#blur').css('display', 'none');

                                            }
                                        }
                                    });

                                }
                            }
                        }

                    } else {
                        $('.load_list_playlist').html('<li>Không có playlist</li>');
                    }
                })
            } else {
                toast({
                    title: "Cảnh báo!",
                    message: "Đăng nhập để tiếp tục.",
                    type: "error",
                    position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                    duration: 1000
                });

            }
        }
        check_show_musicbox();
    }

    function handleClickPlayMusic(elemPlayMusic, musics) {
        if (elemPlayMusic) {
            elemPlayMusic.ondblclick = function (e) {
                if (isPlaying && e.target.closest('.song.active')) {
                    audio.pause();
                } else if (isPaused && e.target.closest('.song.active')) {
                    audio.play();
                } else {
                    eventClick(musics, e);
                }
            }
        }
    }

    function handlePlayMusic(element_main, musics, search = "") {
        element_main.onclick = function (e) {
            if (e.target.closest('.playMusic') && e.target.closest('.song.active')) {
                audio.play();
            } else if (e.target.closest('.playMusic') || e.target.closest('#all_playmusic')) {
                eventClick(musics, e);
            } else if (e.target.closest('#add_library') || e.target.closest('#add_music_plm')) {
                eventClick(musics, e, "add_library");
            } else if (e.target.closest('#delete_library')) {
                eventClick(musics, e, "delete_library");
            } else if (e.target.closest('#add_playlist') || e.target.closest('#add_playlist_plm')) {
                eventClick(musics, e, "add_playlist");
            } else if (e.target.closest('ul.music li.song') && search != "") {
                eventClick(musics, e, search);
            } else {
                if (window.innerWidth <= 768 && e.target.closest('li.song')) {
                    eventClick(musics, e);
                } else {
                    handleClickPlayMusic(e.target.closest('ul.music li.song'), musics);
                }
            }
        }
    }

    function load_name_artist(name) {
        let arrNameArtist = [];
        let html = '';
        if (name.includes(',')) {
            arrNameArtist = name.split(",");
            arrNameArtist.forEach((item, index, arr) => {
                if (index != arr.length - 1) {
                    html += `<span class="name_artist"> ${arr[index].trim()},</span>` + " ";
                } else {
                    html += `<span class="name_artist"> ${arr[index].trim()}</span>`
                }
            })
        } else {
            html = `<span class="name_artist"> ${name}</span>`
        }
        return html;

    }

    function load_music_discover(musics, elem, total_music) {
        let data = musics.map((music, index) => {
            return ` <li class="song ${currentId === music.m_id ? "active" : ""}" index="${index}" id_song="${music.m_id}">
                                <div class="contentMusic">
                                    <div class="imageMusic">
                                        <img src="${music.img}" alt="">
                                        <div class="playMusic ${currentId === music.m_id && isPlaying ? "active" : ""}">
                                            <ion-icon name="play"></ion-icon>
                                        </div>
                                        <div class="runAudio ${currentId === music.m_id && isPlaying ? "active" : ""}">
                                            <div><span></span><span></span><span></span><span></span></div>
                                        </div>
                                    </div>
                                    <div class="desMusic">
                                        <div class="nameMusic">${music.name}</div>
                                        <div id="name_artist" >${load_name_artist(music.artist)}</div>
                                        <div class="time_up">${formatDDMMYY(music.date)}</div>
                                    </div>
                                    <div class="hoverItem">
                                        <div class="hoverAnotherChoice">
                                        <div class="add_library" id="add_library"> 
                                        <div class="tooltip">
                                            <ion-icon name="heart"></ion-icon>
                                            <span class="tooltiptext">Thêm vào thư viện</span>
                                        </div>
                                    </div>
                                        <div class="add_playlist" id="add_playlist">
                                            <div class="tooltip">
                                            <ion-icon name="add-outline"></ion-icon>
                                                <span class="tooltiptext">Thêm vào Play list</span>
                                            </div>
                                        
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list_choose_playlist">
                                    <h3>Danh sách</h3>
                                    <ul class="load_list_playlist">
                                
                                    </ul>
                                </div>
                    </li>`
        }).filter((elem, index) => index < total_music);
        if (elem) {
            elem.innerHTML = data.join("");
            handlePlayMusic(elem, musics);
            handle_btn_name_artist();
        }

    }

    function load_music_discover_hot(musics, elem, total_music) {
        let html = musics.filter(item => {
            return item.nation === "Việt Nam";
        }).map((music, index) => {
            return ` <li class="song" index="${index}" id_song="${music.m_id}">
                                <div class="content">
                                    <img src="${music.img}" alt="">
                                    <div class="hover_playlist">
                                        <ion-icon name="close-outline" id="delete_playlist"></ion-icon>
                                        <ion-icon name="play" id="run_playlist"></ion-icon>
                                        <ion-icon name="heart"></ion-icon>
                                    </div>
                                </div>
                                <div class="name_pl" style="margin-top:10px">${music.name}</div>
                                <div id="name_artist"  style="margin: 4px 0 2px 0;" >${load_name_artist(music.artist)}</div>
                            </li>`
        }).filter((elem, index) => index < total_music);
        if (elem) {
            elem.innerHTML = html.join("");
            handlePlayMusic(elem, musics);
            handle_btn_name_artist();
        }
    }

    function load_music(musics, element, showDelete = false, layout = "") {
        let html = [];
        if (Array.isArray(musics) && musics.length > 0) {
            html = musics.map((music, index) => {
                return `<li class="song  ${currentId === music.m_id ? "active" : ""}" index="${index}" id_song="${music.m_id}">
                                            <div class='idMusic' style="${layout == null ? "display:none" : ""}">${layout == "bxh" ? `<span class="numberTop" id="top_${index + 1}">${index + 1}</span>` : '<ion-icon name="musical-notes-outline"></ion-icon>'}</div>
                                            <div class="contentMusic">
                                                <div class="imageMusic">
                                                    <img src="${music.img}" alt="">
                                                    <div class="playMusic ${currentId === music.m_id && isPlaying ? "active" : ""}">
                                                    <ion-icon name="play"></ion-icon></div>
                                                    <div class="runAudio ${currentId === music.m_id && isPlaying ? "active" : ""}">
                                                    <div><span></span><span></span><span></span><span></span></div>
                                                </div>
                                                </div>
                                                <div class="desMusic">
                                                    <div class="nameMusic">${music.name}</div>
                                                    <div id="name_artist" >${load_name_artist(music.artist)}</div>
                                                </div>
                                            </div>
                                            <div class="timeMusic">${music.time}</div>
                                            <div class="hoverItem">
                                                <div class="hoverAnotherChoice">
                                                    <div class="add_library" id="add_library" style="${showDelete == true ? "display:none" : ""}">
                                                        <div class="tooltip">
                                                            <ion-icon name="heart"></ion-icon>
                                                            <span class="tooltiptext">Thêm vào thư viện</span>
                                                        </div>
                                                    </div>
                                                    <div class="add_library" id="delete_library" style="${showDelete == false ? "display:none" : ""}">
                                                        <div class="tooltip">
                                                            <ion-icon name="close"></ion-icon>
                                                            <span class="tooltiptext">Xóa khỏi thư viện</span>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="add_playlist" id="add_playlist">
                                                        <div class="tooltip">
                                                        <ion-icon name="add-outline"></ion-icon>
                                                            <span class="tooltiptext">Thêm vào Play list</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="list_choose_playlist">
                                            <h3>Danh sách</h3>
                                            <ul class="load_list_playlist">
                                        
                                            </ul>
                                        </div>
                                    </li>`;
            })
        }
        if (element) {
            element.innerHTML = html.join("");
            handle_btn_name_artist();
        }

    }

    function load_music_fixed_left(music) {
        if (music_fixed_left) {
            if (musicFixed) {
                musicFixed.setAttribute("song_id", music.m_id);
            }
            music_fixed_left.innerHTML = `
                        <img src="${music.img}" alt="">
                        <div class="desMusicFixed">
                            <div class="nameMusicFixed"><a>${music.name}</a></div>
                            <div id="name_artist" >${load_name_artist(music.artist)}</div>

                        </div>
                        <div class="AnotherChoiceFixed">
                        <div class="add_library" id="add_library">
                        <div class="tooltip">
                            <ion-icon name="heart"></ion-icon>
                            <span class="tooltiptext">Thêm vào thư viện</span>
                        </div>
                    </div>
                            <div class="add_playlist" id="add_playlist">
                            <div class="tooltip">
                            <ion-icon name="add-outline"></ion-icon>
                                <span class="tooltiptext">Thêm vào Play list</span>
                            </div>
                            </div>
                        </div>
    `
            handle_btn_name_artist();
        }

    }

    // load playlist library{}
    function load_playlist_library(datas) {
        let html = datas.map((data, index) => {
            return `<li class="playlist_item" index="${index}" id_playlist="${data.pl_id}">
                <div class="content">
                    <img src="../uploads/${data.img}" alt="">
                    <div class="hover_playlist">
                        <ion-icon name="close-outline" id="delete_playlist"></ion-icon>
                        <ion-icon name="play" id="run_playlist"></ion-icon>
                        <ion-icon name="heart"></ion-icon>
                    </div>
                </div>
                <div class="name_pl" style="margin: 4px 0 2px 0;">${data.name_playlist}</div>
                <div class="author_pl">${data.name}</div>
            </li>`;
        })
        if (document.getElementById('list_playlist')) {
            document.getElementById('list_playlist').innerHTML = html.join("");
            handle_btn_name_artist();
        }


    }

    function load_list_playlist(datas, element_main) {
        let html = datas.map((data, index) => {
            return ` <li id_playlist="${data.pl_id}" class='_playlist' >
                <ion-icon name="musical-note-outline"></ion-icon>
                ${data.name_playlist}
            </li>`;
        })
        if (element_main) {
            element_main.innerHTML = html.join("");
            handle_btn_name_artist();
        }

    }
    // // listening to music
    function listening_Music(music, elem) {
        if (elem) {
            elem.html(`<li class="song active  id_song="${music.m_id}">
        <div><ion-icon name="musical-notes-outline"></ion-icon></div>
        <div class="contentMusic">
            <div class="imageMusic">
                <img src="${music.img}" alt="">
            </div>
            <div class="desMusic">
                <div class="nameMusic">${music.name}</div>
                <div id="name_artist" >${load_name_artist(music.artist)}</div>

            </div>
        </div>
        <div class="timeMusic">${music.time}</div>
    
    </li>
`)
            handle_btn_name_artist();
        }
    }

    //     // show list play music
    const btnShowList = document.querySelector('.btn_run_listPlaymusic ion-icon');
    btnShowList.addEventListener('click', e => {
        if (e.target === e.currentTarget) {
            document.querySelector('.list_play_music').classList.toggle('active');
            $('#blur').css('display', 'block');
            if (!document.querySelector('.list_play_music').classList.contains('active')) {
                $('#blur').css('display', 'none');
            }
            $('#blur').click(function (e) {
                if (e.target === e.currentTarget) {
                    document.querySelector('.list_play_music').classList.remove('active');
                    $('#blur').css('display', 'none');
                }
            })
            e.target.parentElement.classList.toggle('active');
            if (document.querySelector('.list_play_music').classList.contains('active') &&
                document.querySelector('.update_profile').classList.contains('active')) {
                document.querySelector('.update_profile').classList.toggle('active');
            }
        }
    })

    //     // click profile
    document.querySelector('.user .profile #imgUser').addEventListener('click', (e) => {
        if (e.target === e.currentTarget && uID) {
            document.querySelector('.update_profile').classList.add('active');
            if (document.querySelector('.container .main_left').classList.contains('active')) {
                document.querySelector('.container .main_left').classList.remove('active');
            }
            $('#blur').css('display', 'block');
            $('#blur').click(function (e) {
                if (e.target === e.currentTarget) {
                    document.querySelector('.update_profile').classList.remove('active');
                    $('#blur').css('display', 'none');
                }
            })
            if (document.querySelector('.update_profile').classList.contains('active') &&
                document.querySelector('.list_play_music').classList.contains('active')
            ) {
                document.querySelector('.list_play_music').classList.add('active')
                e.target.parentElement.classList.add('active');

            }
        } else {
            document.querySelector('.container .main_left').classList.toggle('active');
            $('#blur').css('display', 'block');
            $('#blur').click(function () {
                document.querySelector('.container .main_left').classList.remove('active');
                $('#blur').css('display', 'none');

            });
        }
    })

    document.querySelectorAll('.close_form').forEach(item => {
        item.addEventListener('click', e => {
            if (e.target === e.currentTarget) {
                if (e.target.closest('.form_upload').classList.contains('active'))
                    e.target.closest('.form_upload').classList.remove('active');
                $('#blur').css('display', 'none');

            }
        })
    })


    document.querySelector('.imgUser').addEventListener('click', () => {
        document.getElementById('form_upload_avatar').classList.add('active');
    })
    document.querySelector('#close_profile ion-icon').addEventListener('click', (e) => {
        if (e.target === e.currentTarget)
            document.querySelector('.update_profile').classList.remove('active');
        $('#blur').css('display', 'none');

    })
    //     // up load
    if (document.getElementById('upload')) {
        document.getElementById('upload').addEventListener('click', e => {
            e.preventDefault();
            if (e.target === e.currentTarget) {
                document.getElementById('form_upload_music').classList.add('active');
            }
        })
    }
    document.querySelectorAll('.form_upload').forEach(item => {
        item.addEventListener('click', (e) => {
            if (e.target === e.currentTarget) {
                e.target.classList.remove('active');

            }

        })
    })


    $('#searchInput').on('focus', function () {
        document.querySelector('.main_right header').style.background = '#1b2035'
        if ($(this).val() !== "") {
            $("#listSearch").css("display", "block");
            $('#blur').css('display', 'block');
            $('#delSearch').css('display', 'block');
        }
        $(this).blur(function () {
            document.querySelector('.main_right header').style.background = 'transparent';
        })
        $('#blur').click(function (e) {
            if (e.target === e.currentTarget) {
                $("#listSearch").css("display", "none");
                $('#blur').css('display', 'none');


            }
        })
    })

    $.get(`./controller/select_data.php?key=getAllData`, {}, function (response) {
        let res = JSON.parse(response);

        if (res.error !== 1) {
            let datas = JSON.parse(res.data_music);
            let timerID;
            $("#searchInput").on('input', function (e) {
                let _this = this;
                $('#delSearch').click(function (e) {
                    if (e.target === e.currentTarget) {
                        _this.value = "";
                        $("#listSearch").css("display", "none");
                        $('#blur').css('display', 'none');
                        $('#delSearch').css('display', 'none');

                    }
                });

                if (timerID) {
                    $('#loadVal').css('display', 'none');
                    $('#delSearch').css({ "display": "block" });
                    clearTimeout(timerID);
                }
                let html = '';
                let searchVal = e.target.value.toLowerCase().trim();
                if (searchVal != '') {
                    $('#delSearch').css('display', 'block');
                    datas.forEach((data, index) => {
                        if (data.name.toLowerCase().includes(searchVal) || data.artist.toLowerCase().includes(searchVal)) {
                            html += `<li class="song  ${currentId === data.m_id ? "active" : ""}" index="${index}" id_song="${data.m_id}">
                                        <div class="contentMusic">
                                            <div class="imageMusic">
                                                <img src="${data.img}" alt="">
                                                <div class="playMusic ${currentId === data.m_id ? "active" : ""}"><ion-icon name="play"></ion-icon></div>
                                                <div class="runAudio ${currentId === data.m_id ? "active" : ""}">
                                                <div><span></span><span></span><span></span><span></span></div>
                                            </div>
                                            </div>
                                            <div class="desMusic">
                                                <div class="nameMusic">${data.name}</div>
                <div id="name_artist" >${load_name_artist(data.artist)}</div>

                                            </div>
                                        </div>
                                    </li>`
                        }
                    })
                    let prs = new Promise(resolve => {
                        timerID = setTimeout(() => {
                            $('#loadVal').css({ "display": "block" });
                            $('#delSearch').css({ "display": "none" });
                            $('#blur').css('display', 'block');
                            resolve(1)
                        }, 800)
                    })
                    prs.then(() => {
                        timerID = setTimeout(() => {
                            $('#delSearch').css({ "display": "block" });
                            $('#loadVal').css({ "display": "none" });
                            $("#listSearch").css("display", "block");
                            $('#listSearch ul').html(html != '' ? html : "<li style='display:flex;justify-content:center;align-item:c'>Không tim thấy kết quả</li>");
                        }, 400)
                    })
                } else {
                    $("#listSearch").css("display", "none");
                    $('#blur').css('display', 'none');
                    $('#delSearch').css('display', 'none');


                }

            })
            handlePlayMusic(document.querySelector('#listSearch ul'), datas, "search");
        } else if (response == "empty_data_music") {
            alert('Empty');
        } else {
            alert('Error');
        }
    });


    $('.profile img#imgUser').on('click', function () {
        let _this = this;

        if (uID) {
            var data = { 'u_id': uID, 'btn_uploaded_id': $(this).attr('id') };
            $.get("./controller/select_data.php", data, function (response) {
                let res = JSON.parse(response);
                if ($(_this).attr('id') == "imgUser" && res.error !== 1) {
                    let data = JSON.parse(res.data_music_upload);
                    load_music(data, document.querySelector(".update_profile .playlist ul"), true, null);
                    handlePlayMusic(document.querySelector(".update_profile .playlist ul"), data);
                } else {
                    $(".update_profile .playlist ul").html(`<li>${res.message}</li>`);
                }
            });
        }
    })

    function load_music_home(musics) {
        let html = musics.map((music, index) => {
            return `<li class="song" index="${index}" id_song = ${music.m_id}>
                    <div class="content_home">
                        <img src="${music.img}" alt="##">
                        <div class="name">${music.name}</div>
                        <div class="des">
                            ${load_name_artist(music.artist)}
                        </div>
                    </div>
                    <div><ion-icon name="caret-forward-outline"></ion-icon></div>
                </li>`
        })
        if (document.querySelector('.first_home ul') && document.querySelector('.second_home ul')) {
            document.querySelector('.first_home ul').innerHTML = html.join("");
            document.querySelector('.second_home ul').innerHTML = html.join("");

        }
        // handle home music
        if (document.querySelectorAll('#home .home_flex ul.music')) {
            document.querySelectorAll('#home .home_flex ul.music').forEach(elem => {
                handlePlayMusic(elem, musics);
            })
        }

        handle_btn_name_artist();
    }

    function load_content(link) {
        let rootLink = "./view" + link;
        let url = rootLink + '.php';
        if (rootLink == `./view/home`) {
            // window.location = '/';
            if (window.innerWidth <= 768) {
                if (document.querySelector('.musicFixed.active')) {
                    document.querySelector('.musicFixed.active').classList.remove('active');
                }
                document.querySelector('.container .main_left').classList.remove('active');
                $('#blur').css('display', 'none');
            }
            $('main').load(url, function () {
                handle_btn_home_content();
                // render home
                $.get(`./controller/select_data.php?key=getAllData`, {}, function (response) {
                    let res = JSON.parse(response);
                    if (res.error !== 1) {
                        let datas = JSON.parse(res.data_music);
                        load_music_home(datas);
                    } else {
                        alert(res.message);
                    }
                });
            });


        } else if (rootLink == `./view/discover`) {
            if (window.innerWidth <= 768) {
                if (document.querySelector('.musicFixed.active')) {
                    document.querySelector('.musicFixed.active').classList.remove('active');
                }
                document.querySelector('.container .main_left').classList.remove('active');
                $('#blur').css('display', 'none');
            }
            $('main').load(url, function () {
                setInterval(changeOrder, 4000);

                function changeOrder() {
                    const allSlides = document.querySelectorAll(".single-slide");
                    const previous = "1";
                    const current = "2";
                    const next = "3";

                    for (const slide of allSlides) {
                        const order = slide.getAttribute("data-order");

                        switch (order) {
                            case current:
                                slide.setAttribute("data-order", previous);
                                break;
                            case next:
                                slide.setAttribute("data-order", current);
                                break;
                            case previous:
                                slide.setAttribute("data-order", next);
                                break;
                        }
                    }
                }
                $("#discover .nav_country li.active").attr('class', "");
                $('#All').attr('class', 'active');
                $.get(`./controller/select_data.php?key=discover`, {}, function (response) {
                    let res = JSON.parse(response);
                    if (res.error !== 1) {
                        load_music_discover(JSON.parse(res.data_music), document.querySelector('#discover .list_music'), 9);
                        load_music_discover_hot(JSON.parse(res.data_music), document.getElementById("list_music_vn"), 5);
                    } else {
                        alert(res.message);
                    }
                })
                $(".nav_country li").on('click', function () {
                    let _this = this;
                    $.get(`./controller/select_data.php?key=getAllData`, {}, function (response) {
                        let res = JSON.parse(response);
                        if (res.error !== 1) {
                            let datas = JSON.parse(res.data_music);
                            let musicFilter;
                            if ($(_this).attr('id') == 'All') {
                                load_music_discover(datas, document.querySelector('#discover .list_music'), 9);
                                $("#discover .nav_country li.active").attr('class', "");
                                $(_this).attr('class', 'active');
                            } else if ($(_this).attr('id') == "VN") {
                                musicFilter = datas.filter(data => {
                                    return data.nation == "Việt Nam";
                                })
                                $("#discover .nav_country li.active").attr('class', "");
                                $(_this).attr('class', 'active');
                                load_music_discover(musicFilter, document.querySelector('#discover .list_music'), 9);
                            } else {
                                musicFilter = datas.filter(data => {
                                    return data.nation != "Việt Nam";
                                })
                                $("#discover .nav_country li.active").attr('class', "");
                                $(_this).attr('class', 'active');
                                load_music_discover(musicFilter, document.querySelector('#discover .list_music'), 9);
                            }
                        } else {
                            alert(res.message);
                        }
                    });
                })



                $('#showAll').on('click', function (e) {
                    e.preventDefault();
                    $('main').load("./view/all_music.php", function () {

                        $.get(`./controller/select_data.php?key=getAllData`, {}, function (response) {
                            let res = JSON.parse(response);
                            const all_music = document.getElementById('all_music_render');
                            if (res.error !== 1) {
                                let datas = JSON.parse(res.data_music);
                                load_music(datas, all_music);
                                handlePlayMusic(all_music, datas);

                                handlePlayMusic(document.getElementById("all_playmusic"), datas);
                            } else {
                                toast({
                                    title: "Thất bại!",
                                    message: "Có lỗi xảy ra, vui lòng liên hệ quản trị viên.",
                                    type: "error",
                                    position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                                    duration: 1000
                                });

                            }
                        });

                        $("#all_music_nav li").on('click', function () {
                            const all_music = document.getElementById('all_music_render');
                            let _this = this;
                            $.get(`./controller/select_data.php?key=getAllData`, {}, function (response) {
                                let res = JSON.parse(response);
                                if (res.error !== 1) {
                                    let datas = JSON.parse(res.data_music);
                                    let musicFilter;


                                    if ($(_this).attr('id') == 'All_all') {
                                        load_music(datas, all_music);
                                        handlePlayMusic(all_music, datas);

                                        $("#all_music_nav li.active").attr('class', "");
                                        $(_this).attr('class', 'active');
                                    } else if ($(_this).attr('id') == "VN_all") {
                                        musicFilter = datas.filter(data => {
                                            return data.nation == "Việt Nam";
                                        })
                                        load_music(musicFilter, all_music);
                                        handlePlayMusic(all_music, musicFilter);

                                        $("#all_music_nav li.active").attr('class', "");
                                        $(_this).attr('class', 'active');
                                    } else {
                                        musicFilter = datas.filter(data => {
                                            return data.nation != "Việt Nam";
                                        })
                                        load_music(musicFilter, all_music);
                                        handlePlayMusic(all_music, musicFilter);

                                        $("#all_music_nav li.active").attr('class', "");
                                        $(_this).attr('class', 'active');
                                    }
                                } else {
                                    alert(res.message);
                                }
                            });
                        })

                    })


                })
            });
        } else if (rootLink == `./view/library`) {
            if (uID != undefined) {
                if (window.innerWidth <= 768) {
                    if (document.querySelector('.musicFixed.active')) {
                        document.querySelector('.musicFixed.active').classList.remove('active');
                    }
                    document.querySelector('.container .main_left').classList.remove('active');
                    $('#blur').css('display', 'none');
                }
                $('main').load(url, function () {
                    document.getElementById('create_pl').addEventListener('click', () => {
                        document.getElementById('form_upload_playlist').classList.add('active');
                    })

                    document.querySelector('.confirm_dialog').addEventListener('click', e => {
                        if (e.target === e.currentTarget) {
                            e.target.style.display = 'none';
                        }
                    })

                    var data = { 'u_id': uID, 'btn_uploaded_id': 'defaultLoad', 'getPlaylist': 'getPlaylist' };
                    jQuery.get("./controller/select_data.php", data, function (response) {
                        let res = JSON.parse(response);
                        let arrId = [];
                        if (res.error !== 1) {
                            let datas = JSON.parse(res.data_music_liked);
                            const libraryMusic = document.querySelector('#data_library');
                            load_music(datas, libraryMusic, true);
                            handlePlayMusic(libraryMusic, datas);
                            libraryMusic.setAttribute('category', 'liked');

                            datas.forEach(data => {
                                arrId.push(data.m_id);
                            })
                            handlePlayMusic(document.getElementById("all_playmusic"), datas);
                        } else {
                            $('#data_library').html(`<li style="padding-left:20px">${res.message}</li>`);
                        }
                    });

                    $('.sub_nav_library li').on('click', function () {

                        $('.sub_nav_library li.active').removeClass('active');
                        $(this).addClass('active');

                        let _this = this;
                        var data = { 'u_id': uID, 'btn_uploaded_id': $(this).attr('id') };

                        $.get("./controller/select_data.php", data, function (response) {
                            let res = JSON.parse(response);
                            const libraryMusic = document.querySelector('#data_library');
                            if ($(_this).attr('id') == "upLoaded" && res.error !== 1) {
                                load_music(JSON.parse(res.data_music_upload), libraryMusic, true);
                                handlePlayMusic(libraryMusic, JSON.parse(res.data_music_upload));
                                libraryMusic.setAttribute('category', 'uploaded');
                            } else if ($(_this).attr('id') == "liked" && res.error !== 1) {
                                load_music(JSON.parse(res.data_music_liked), libraryMusic, true);
                                handlePlayMusic(libraryMusic, JSON.parse(res.data_music_liked));
                                libraryMusic.setAttribute('category', 'liked');
                            } else {
                                $('#data_library').html(`<li style="padding-left:20px">${res.message}</li>`);
                            }
                        });
                    })

                    var data1 = { 'u_id': uID, 'getPlaylist': 'getPlaylist' };
                    jQuery.get("./controller/select_data.php", data1, function (response) {
                        let res = JSON.parse(response);
                        if (res.error !== 1) {
                            let data = JSON.parse(res.data_playlist);
                            load_playlist_library(data);
                            $('#list_playlist').on('click', function (e) {
                                if (e.target.closest('#run_playlist')) {
                                    $('#play_music').attr('category', 'playlist');
                                    let index = Number(e.target.closest('.playlist_item').getAttribute('index'));
                                    var data_hint = { 'u_id': uID, 'dataHint': data[index].name_playlist };
                                    jQuery.get("./controller/select_data.php", data_hint, function (response) {
                                        let res = JSON.parse(response);
                                        if (res.error !== 1) {
                                            load_music(JSON.parse(res.data_hint), document.querySelector('.sub_right .hintMusic ul'));
                                            handlePlayMusic(document.querySelector('.sub_right .hintMusic ul'), JSON.parse(res.data_hint))

                                        } else {
                                            load_music("", document.querySelector('.sub_right .hintMusic ul'));
                                        }
                                    })
                                    $('#playlist_main').addClass('active');
                                    $('#library').css('display', 'none');
                                    $('#playlist_main .audio img').attr('src', "./uploads/" + data[index].img);
                                    $('#playlist_main .name_playlist').html(`
                                            <li class="editNameUser">
                                                <div class="nameUser">
                                                    <input type="text" value="${data[index].name_playlist}" readonly id="name_pl">
                                                </div>

                                                <div class="submit">
                                                    <ion-icon name="pencil" id="change_name_pl"></ion-icon>
                                                    <ion-icon name="checkmark-done-circle" id="save_name_pl"></ion-icon>
                                                </div>
                                            </li>
                                `);
                                    // // change name playlist
                                    $("#change_name_pl, #save_name_pl").on('click', function (e) {
                                        if ($(e.target).attr('id') == "change_name_pl") {
                                            $('#name_pl').attr('readonly', false);
                                            $('#name_pl').css({ "background": "white", "color": "black" })
                                            $('#change_name_pl').css("display", 'none');
                                            $('#save_name_pl').css("display", 'block');
                                        }
                                        if ($(e.target).attr('id') == "save_name_pl") {
                                            e.preventDefault();
                                            let form_data = new FormData();
                                            let new_name = $("#name_pl").val();
                                            let pl_id = $.cookie('pl_id');
                                            form_data.append('new_name', new_name);
                                            form_data.append('pl_id', pl_id);
                                            $.ajax({
                                                url: './controller/change_name_pl.php',
                                                type: 'post',
                                                data: form_data,
                                                contentType: false,
                                                processData: false,
                                                success: function (res) {
                                                    let data = JSON.parse(res);
                                                    if (data.error == 0) {
                                                        toast({
                                                            title: "Thành công!",
                                                            message: "Thay đổi thành công.",
                                                            type: "success",
                                                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                                                            duration: 1000
                                                        });


                                                        $('#name_pl').attr('readonly', true).css({ "background": "transparent", "color": "white" })
                                                        $('#change_name_pl').css("display", 'block');
                                                        $('#save_name_pl').css("display", 'none');
                                                    } else {
                                                        toast({
                                                            title: "Cảnh báo!",
                                                            message: "Thay đổi tên không thành công.",
                                                            type: "warning",
                                                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                                                            duration: 1000
                                                        });

                                                    }
                                                }
                                            });
                                        }

                                    })


                                    $('#playlist_main .author_playlist').html(`Tạo bởi ${data[index].name}`);
                                    if ($('.dateCreate')) {
                                        $('.dateCreate').html(`Ngày tạo: ${formatDDMMYY(data[index].date)}`);
                                    }
                                    let pl_id;
                                    if (e.target.closest('.playlist_item')) {
                                        pl_id = e.target.closest('.playlist_item').getAttribute('id_playlist');
                                    }
                                    $.cookie('pl_id', pl_id);
                                    let data_get_plItem = { "u_id": uID, "pl_id": pl_id, "action": "getPlaylistItem" };
                                    jQuery.get("./controller/select_data.php", data_get_plItem, function (response) {
                                        let res = JSON.parse(response);
                                        let data = "";
                                        if (res.error !== 1) {
                                            data = JSON.parse(res.data_playlist_item);
                                            document.querySelector('#list_music_playlist').classList.add('active');
                                            document.querySelector('.message_null_playlist').classList.add('active');
                                            load_music(data, document.querySelector('#list_music_playlist ul'), true);
                                            document.querySelector('#list_music_playlist ul').setAttribute('category', 'playlisted');
                                            handlePlayMusic(document.querySelector('#list_music_playlist ul'), data);
                                        } else {
                                            $('.load_list_playlist').html(`<li>${res.message}</li>`);
                                        }
                                    })
                                } else if (e.target.closest('#delete_playlist')) {
                                    let pl_id = e.target.closest('#delete_playlist').closest('li').getAttribute('id_playlist');
                                    let _e = e;
                                    $('.confirm_dialog').css("display", "flex");
                                    $('.confirm_dialog p').text('Bạn muốn xóa playlist này chứ?');
                                    $('.confirm_dialog button.active a').click(function (e) {
                                        e.preventDefault();
                                        $('.confirm_dialog').css("display", "none");
                                        _e.target.closest('#delete_playlist').closest(`li`).remove();
                                        let data = { "u_id": uID, "pl_id": pl_id };
                                        jQuery.ajax({
                                            url: './controller/create_playlist.php',
                                            type: 'POST',
                                            dataType: 'html',
                                            data: data,
                                            success: function (ketqua) {
                                                let json = JSON.parse(ketqua);
                                                if (json.error === 0) {
                                                    toast({
                                                        title: "Thành công!",
                                                        message: json.message,
                                                        type: "success",
                                                        position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                                                        duration: 1000
                                                    });


                                                } else {
                                                    toast({
                                                        title: "Thất bại!",
                                                        message: "Có lỗi xảy ra, vui lòng liên hệ quản trị viên.",
                                                        type: "error",
                                                        position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                                                        duration: 1000
                                                    });


                                                }
                                            }
                                        });
                                    })
                                    $('.confirm_dialog button a').click(function () {
                                        $('.confirm_dialog').css("display", "none");
                                    })
                                }

                            })

                        }
                    });
                });
            }
        } else if (rootLink == `./view/chude`) {

            if (window.innerWidth <= 768) {
                if (document.querySelector('.musicFixed.active')) {
                    document.querySelector('.musicFixed.active').classList.remove('active');
                }
                document.querySelector('.container .main_left').classList.remove('active');
                $('#blur').css('display', 'none');
            }
            $('main').load(url, function () {

            });


        }
        else if (rootLink == `./view/top`) {

            if (window.innerWidth <= 768) {
                if (document.querySelector('.musicFixed.active')) {
                    document.querySelector('.musicFixed.active').classList.remove('active');
                }
                document.querySelector('.container .main_left').classList.remove('active');
                $('#blur').css('display', 'none');
            }
            $('main').load(url, function () {

            });


        } else if (rootLink == `./view/bxh`) {
            // window.location = '/';
            if (window.innerWidth <= 768) {
                if (document.querySelector('.musicFixed.active')) {
                    document.querySelector('.musicFixed.active').classList.remove('active');
                }
                document.querySelector('.container .main_left').classList.remove('active');
                $('#blur').css('display', 'none');
            }
            $('main').load(url, function () {
                $.get(`./controller/select_data.php?key=getAllData`, {}, function (response) {
                    let res = JSON.parse(response);
                    const all_music = document.getElementById('all_music_render');
                    if (res.error !== 1) {
                        let datas = JSON.parse(res.data_music);
                        load_music(datas, all_music, false, "bxh");
                        handlePlayMusic(all_music, datas);

                        handlePlayMusic(document.getElementById("all_playmusic"), datas);
                    } else {
                        toast({
                            title: "Thất bại!",
                            message: "Có lỗi xảy ra, vui lòng liên hệ quản trị viên.",
                            type: "error",
                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                            duration: 1000
                        });

                    }
                });
            });


        }
    }
    function handle_sidebar() {
        $('.main_left ul li>a').on('click', function (e) {
            e.preventDefault();
            let link;

            if (uID && $(this).attr('href') == "/library") {
                $('li.active').removeClass('active');
                $('#blur').css('display', 'none');
                $(this).closest('li').addClass('active');
                link = $(this).attr('href');
            } else {
                if ($(this).closest('li').attr('id') === "nav_playlist" || $(this).closest('li').attr('id') === "nav_library") { } else {
                    $('li.active').removeClass('active');
                    $('#blur').css('display', 'none');
                    $(this).closest('li').addClass('active');
                    link = $(this).attr('href');
                }
            }
            if (link != undefined && link != "/home") {
                if (!arrPrevPage.includes(link)) {
                    arrPrevPage.unshift(link);
                    arrNextPage.unshift(link);

                    if (arrPrevPage.length > 0) {
                        document.getElementById("prevPage").classList.add('active');
                    }

                }

            }
            window.history.pushState(load_content(link), "", link);
        })
    }
    handle_sidebar();


    // prev - next page
    var lastUrl;
    var indexPage = 0;
    let arrPrevPage = ["/home"];
    let arrNextPage = [];

    $('#prevPage').click(function (e) {
        if (indexPage < arrPrevPage.length - 1) {
            indexPage++;
        }
        // else{
        //     arrPrevPage = ["/home"];
        //     indexPage = 0;
        // }
        // show next btn
        if (indexPage > 0) {
            document.getElementById("nextPage").classList.add('active');
        }

        lastUrl = arrPrevPage[indexPage];


        document.querySelectorAll('.main_left ul li>a').forEach(elem => {
            if (elem.getAttribute('href') == lastUrl) {
                if (uID) {
                    if (document.querySelector('li.active')) {
                        document.querySelector('li.active').classList.remove('active');
                    }
                    $('#blur').css('display', 'none');
                    if (elem.closest('li')) {
                        elem.closest('li').classList.add('active');
                    }
                } else {
                    if (elem.closest('li') && elem.closest('li').getAttribute('id') === "nav_playlist" || elem.closest('li') && elem.closest('li').getAttribute('id') === "nav_library") { } else {
                        $('li.active').removeClass('active');
                        if (document.querySelector('li.active')) {
                            document.querySelector('li.active').classList.remove('active');
                        }

                        $('#blur').css('display', 'none');
                        if (elem.closest('li')) {
                            elem.closest('li').classList.add('active');
                        }

                    }
                }
            }
        })
        if (indexPage >= arrPrevPage.length - 1) {
            document.getElementById("prevPage").classList.remove('active');
        }
        load_content(lastUrl);

    })

    $('#nextPage').click(function (e) {
        if (indexPage > 0) {
            indexPage--;
        }
        if (arrPrevPage.length >= 0) {
            document.getElementById("prevPage").classList.add('active');
        }

        lastUrl = arrNextPage[indexPage];

        document.querySelectorAll('.main_left ul li>a').forEach(elem => {
            if (elem.getAttribute('href') == lastUrl) {
                if (uID) {
                    if (document.querySelector('li.active')) {
                        document.querySelector('li.active').classList.remove('active');
                    }
                    $('#blur').css('display', 'none');
                    if (elem.closest('li')) {
                        elem.closest('li').classList.add('active');
                    }
                } else {
                    if (elem.closest('li') && elem.closest('li').getAttribute('id') === "nav_playlist" || elem.closest('li') && elem.closest('li').getAttribute('id') === "nav_library") { } else {
                        $('li.active').removeClass('active');
                        if (document.querySelector('li.active')) {
                            document.querySelector('li.active').classList.remove('active');
                        }

                        $('#blur').css('display', 'none');
                        if (elem.closest('li')) {
                            elem.closest('li').classList.add('active');
                        }

                    }
                }
            }
        })
        if (indexPage <= 0) {
            document.getElementById("nextPage").classList.remove('active');
        }
        load_content(lastUrl);

    })



    function load_layout_playmusic_mobile() {
        if (window.innerWidth <= 768) {
            if (document.querySelector('.musicFixed.active')) {
                document.querySelector('.musicFixed.active').classList.remove('active');
            }
            $('.img_playMusic_mobile').on('click', function () {
                document.querySelector('.musicFixed').classList.add('active');
                document.querySelectorAll('ul.music li.song').forEach(item => {
                    item.remove();
                })
                $("main").load('./view/playmusic.php', function () {

                    let elem = document.querySelector('.sub_left').getBoundingClientRect();
                    document.querySelector('.musicFixed').style.top = elem.top + elem.height + 40 + "px";


                    $('#play_music').attr('category', 'playmusic');
                    $('.btnPause').addClass('active');
                    $('.btnPlay').removeClass('active');
                    $('.list_music_playing li > div:first-child ion-icon').css('animationPlayState', 'running');
                    $('.play_music .sub_left .runAudio').addClass('active');
                    $('.btnPlay').click(function () {
                        audio.play();
                    })
                    $('.btnPause').click(function () {
                        audio.pause();

                    })
                    load_music_fixed();
                    $.get('./controller/select_data.php', { 'key': "getAllData" }, function (response) {
                        let res = JSON.parse(response);
                        if (res.error !== 1) {
                            let data = JSON.parse(res.data_music);

                            load_music(data, document.querySelector('#careMusic'));
                            handlePlayMusic(document.querySelector('#careMusic'), data);
                        } else {
                            alert(res.message);
                        }
                    })
                });
            })
        }
    }
    load_layout_playmusic_mobile();

    function load_layout_playmusic_desktop() {
        $('.leftMusicFixed').on('click', function () {
            document.querySelectorAll('ul.music li.song').forEach(item => {
                item.remove();
            })
            $("main").load('./view/playmusic.php', function () {
                $('#play_music').attr('category', 'playmusic');
                $('.btnPause').addClass('active');
                $('.btnPlay').removeClass('active');
                $('.list_music_playing li > div:first-child ion-icon').css('animationPlayState', 'running');
                $('.play_music .sub_left .runAudio').addClass('active');
                $('.btnPlay').click(function () {
                    audio.play();
                })
                $('.btnPause').click(function () {
                    audio.pause();

                })
                load_music_fixed();
                $.get('./controller/select_data.php', { 'key': "getAllData" }, function (response) {
                    let res = JSON.parse(response);
                    if (res.error !== 1) {
                        let data = JSON.parse(res.data_music);

                        load_music(data, document.querySelector('#careMusic'));
                        handlePlayMusic(document.querySelector('#careMusic'), data);
                    } else {
                        alert(res.message);
                    }
                })
            });
        })
    }
    load_layout_playmusic_desktop();



    function load_layout_home_first() {
        $('main').load('./view/home.php', function () {

            $.get(`./controller/select_data.php?key=getAllData`, {}, function (response) {
                let res = JSON.parse(response);
                if (res.error !== 1) {
                    let datas = JSON.parse(res.data_music);
                    load_music_home(datas);
                } else {
                    alert(res.message);
                }
            });
            handle_btn_home_content();
        })
    }
    load_layout_home_first();

    function handle_btn_home_content() {
        if (document.querySelectorAll("#nav_home_content button>a")) {
            document.querySelectorAll("#nav_home_content button>a").forEach(elem => {
                elem.addEventListener('click', e => {
                    e.preventDefault();
                    let link = e.target.getAttribute('href');
                    if ("./view" + link + ".php" == "./view/library.php" && uID || "./view" + link + ".php" == "./view/bxh.php") {
                        $('li.active').removeClass('active');
                        $('#blur').css('display', 'none');
                        $(`li a[href="${e.target.getAttribute('href')}"]`).closest('li').addClass('active');
                        window.history.pushState(null, "", link);
                        load_content(link);
                    }
                    else {
                        toast({
                            title: "Cảnh báo!",
                            message: "Đăng nhập để tiếp tục.",
                            type: "error",
                            position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                            duration: 1000
                        });
                    }
                })
            })
        }
    }

    // upload video

    function handle_btn_upload_music() {
        $("#btn-upload-music").click(function (e) {
            e.preventDefault();
            let form_data = new FormData();
            let img = $("#fileUploadIcon")[0].files;
            let src = $("#fileUploadMusic")[0].files;
            let name = $("#m_name_up").val();
            let artist = $("#m_artist_up").val();
            let time = $("#m_time_up").val();
            let nation = $("#m_nation_up").val();
            let category = $("#m_category_up").val();


            // Check image selected or not
            if (img.length > 0 && src.length > 0) {
                form_data.append('m_img', img[0]);
                form_data.append('m_src', src[0]);
                form_data.append('m_name', name);
                form_data.append('m_artist', artist);
                form_data.append('m_time', time);
                form_data.append('m_nation', nation);
                form_data.append('m_category', category);

                $.ajax({
                    url: './controller/upload_video.php',
                    type: 'post',
                    data: form_data,
                    contentType: false,
                    processData: false,
                    success: function (res) {
                        let data = JSON.parse(res);
                        if (data.error === 0) {
                            if (document.getElementById('data_library')) {
                                load_music(data.data, document.getElementById('data_library'), true);
                            }
                            if (document.getElementById('upLoaded_profile')) {
                                load_music(data.data, document.getElementById('upLoaded_profile'), true, null);
                            }
                            $('#form_upload_music').removeClass('active');
                            $('#form_id').trigger("reset");
                            toast({
                                title: "Thành công!",
                                message: "Upload bài hát thành công.",
                                type: "success",
                                position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,
                                duration: 1000
                            });

                        } else {
                            toast({
                                title: "Thất bại!",
                                message: "Có lỗi xảy ra, vui lòng liên hệ quản trị viên.",
                                type: "error",
                                position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,
                                duration: 1000
                            });

                        }

                    }
                });

            } else {
                toast({
                    title: "Cảnh báo!",
                    message: "Hãy nhập đầy đủ các trường.",
                    type: "warning",
                    position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                    duration: 1000
                });
            }
        });
    }
    handle_btn_upload_music();


    function load_layout_view_artist(data) {
        let avatar_artist = document.getElementById("avatar_artist");
        let wall_artist = document.getElementById("wall_artist");
        let name_artist_profile = document.querySelector("#name_artist_profile p");
        let care_artist = document.querySelector(".care_artist>span");
        let about_artist_img = document.querySelector('#about_artist img');
        let about_artist_des = document.querySelector("#about_artist ul .des>p");
        let about_artist_des_other = document.querySelector("#about_artist ul .des_other>span");
        if (avatar_artist && wall_artist && about_artist_img) {
            avatar_artist.src = data.avatar ? data.avatar : "../uploads/avata_default.jpg";
            wall_artist.src = data.avatar;
            about_artist_img.src = data.avatar;
        }
        if (name_artist_profile) {
            name_artist_profile.innerHTML = data.name_artist;
        }
        if (care_artist && about_artist_des_other) {
            care_artist.innerHTML = data.followers;
            about_artist_des_other.innerHTML = data.followers;

        }
        if (about_artist_des) {
            about_artist_des.innerHTML = data.description;
        }
    }

    function load_layout_music_hot(datas) {
        let html = datas.map((data, index) => {
            return `
                <li class="song ${currentId === data.m_id ? "active" : ""}" index="${index}" id_song="${data.m_id}">
                <div class="contentMusic">
                    <div class="imageMusic">
                        <img src="${data.img}" alt="">
                        <div class="playMusic ">
                            <ion-icon name="play"></ion-icon>
                        </div>
                        <div class="runAudio ">
                            <div><span></span><span></span><span></span><span></span></div>
                        </div>
                    </div>
                    <div class="desMusic">
                        <div class="nameMusic">${data.name}</div>
                        <div id="name_artist">${load_name_artist(data.artist)}</div>

                    </div>
                    <div class="timeMusic">${data.time}</div>

                    <div class="hoverItem">
                        <div class="hoverAnotherChoice">
                            <div class="add_library" id="add_library">
                                <div class="tooltip">
                                    <ion-icon name="heart"></ion-icon>
                                    <span class="tooltiptext">Thêm vào thư viện</span>
                                </div>
                            </div>
                            <div class="add_playlist" id="add_playlist">
                                <div class="tooltip">
                                    <ion-icon name="add-outline"></ion-icon>
                                    <span class="tooltiptext">Thêm vào Play list</span>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="list_choose_playlist">
                    <h3>Danh sách</h3>
                    <ul class="load_list_playlist">

                    </ul>
                </div>
            </li>
        `
        })

        if (document.getElementById('list_music_hot') && document.getElementById("all_playmusic")) {
            document.getElementById('list_music_hot').innerHTML = html.join('');
            handlePlayMusic(document.querySelector('ul#list_music_hot'), datas);
            handlePlayMusic(document.getElementById("all_playmusic"), datas);
            handle_btn_name_artist();
        }

    }

    // show infor artist
    function handle_btn_name_artist() {
        document.querySelectorAll('.name_artist').forEach(elem => {
            if (elem) {
                elem.addEventListener('click', e => {
                    $('main').load('./view/view_artist.php', function () {
                        let get_name_artist = e.target.textContent.split(',').join('').trim();
                        $.get('./controller/getDataArtist.php', { 'name_artist': get_name_artist }, function (response) {
                            let res = JSON.parse(response);
                            if (res.error != 1) {
                                load_layout_view_artist(res.artist);
                                load_layout_music_hot(res.data);
                            } else {
                                alert('empty');
                            }
                        })
                    })
                })
            }
        })
    }


    // move admin page
    $('#adminPage').click(function () {
        $(location).attr('href', '../adm/admin_panel/index.php');
    })

    // Toast function
    function toast({ title = "", message = "", type = "info", position = "right", duration = 3000 }) {
        let main;
        if (position != "right") {
            main = document.getElementById("toast--left");
        } else {
            main = document.getElementById("toast");
        }
        if (main) {
            const toast = document.createElement("div");

            // Auto remove toast
            const autoRemoveId = setTimeout(function () {
                main.removeChild(toast);
            }, duration + 300);

            // Remove toast when clicked
            toast.onclick = function (e) {
                if (e.target.closest(".toast__close")) {
                    main.removeChild(toast);
                    clearTimeout(autoRemoveId);
                }
            };

            const icons = {
                success: "fas fa-check-circle",
                info: "fas fa-info-circle",
                warning: "fas fa-exclamation-circle",
                error: "fas fa-exclamation-circle"
            };
            const icon = icons[type];
            const delay = (duration / 1000).toFixed(2);

            toast.classList.add("toast", `toast--${type}`);
            let typeAnimation;
            if (position === "bottom") {
                typeAnimation = "slideInBottom";
            } else if (position != "right") {
                typeAnimation = "slideInRight";
            }
            else {
                typeAnimation = "slideInLeft";
            }
            toast.style.animation = `${typeAnimation} ease .3s, fadeOut linear .3s ${delay}s forwards`;

            toast.innerHTML = `
          <div class="toast__icon">
              <i class="${icon}"></i>
          </div>
          <div class="toast__body">
              <h3 class="toast__title">${title}</h3>
              <p class="toast__msg">${message}</p>
          </div>
          <div class="toast__close">
              <i class="fas fa-times"></i>
          </div>
      `;
            main.appendChild(toast);
        }
    }

    //ajax jquery
    function handle_btn_upload_avatar() {
        $("#btn-upload-avatar").click(function (e) {
            e.preventDefault();
            let form_data = new FormData();
            let img = $("#fileUploadAvatar")[0].files;

            // Check image selected or not
            if (img.length > 0) {
                form_data.append('my_image', img[0]);
                $.ajax({
                    url: './controller/upload_img.php',
                    type: 'post',
                    data: form_data,
                    contentType: false,
                    processData: false,
                    success: function (res) {
                        const data = JSON.parse(res);
                        if (data.error === 0) {
                            let path = "../uploads/" + data.src;
                            $("#imgUser").attr("src", path);
                            $("#imgProfile").attr("src", path);
                            $("#imgUserMobile").attr("src", path);

                            $('#form_upload_avatar.form_upload').removeClass('active');
                            $("#fileUploadAvatar").val('');
                            toast({
                                title: "Thành công!",
                                message: data.em,
                                type: "success",
                                position: `${window.innerWidth <= 768 ? "bottom" : "left"}`,

                                duration: 1000
                            });

                        } else {

                            toast({
                                title: "Thất bại!",
                                message: data.em,
                                type: "error",
                                position: `${window.innerWidth <= 768 ? "bottom" : "left"}`,

                                duration: 1000
                            });

                        }
                    }
                });

            } else {

                toast({
                    title: "Thất bại!",
                    message: "Vui lòng chọn ảnh trước khi lưu.",
                    type: "error",
                    position: `${window.innerWidth <= 768 ? "bottom" : "left"}`,

                    duration: 1000
                });

            }
        });

        $("#btn-remove-avatar").click(function (e) {
            e.preventDefault();
            let form_data = new FormData();
            form_data.append('status', "remove");
            $.ajax({
                url: './controller/upload_img.php',
                type: 'post',
                data: form_data,
                contentType: false,
                processData: false,
                success: function (res) {
                    let json = JSON.parse(res);
                    if (json.error === 0) {
                        let path = "";
                        $("#imgUser").attr("src", path);
                        $("#imgProfile").attr("src", path);
                        $("#imgUserMobile").attr("src", path);

                        $('#form_upload_avatar.form_upload').removeClass('active');
                        $("#fileUploadAvatar").val('');

                        toast({
                            title: "Thành công!",
                            message: json.message,
                            type: "success",
                            position: `${window.innerWidth <= 768 ? "bottom" : "left"}`,

                            duration: 1000
                        });

                    } else {

                        toast({
                            title: "Thất bại!",
                            message: json.message,
                            type: "error",
                            position: `${window.innerWidth <= 768 ? "bottom" : "left"}`,

                            duration: 1000
                        });

                    }
                }
            });

        });
    }
    handle_btn_upload_avatar();



    // create playlist
    function handle_btn_create_playlist() {
        $("#btn-create-playlist").click(function (e) {
            e.preventDefault();
            let form_data = new FormData();
            let img = $("#fileUploadPlaylist")[0].files;
            let namePlaylist = $("#name_playlist").val();
            // Check image selected or not
            if (img.length > 0) {
                form_data.append('my_image', img[0]);
                form_data.append('my_name', namePlaylist);
                $.ajax({
                    url: './controller/create_playlist.php',
                    type: 'post',
                    data: form_data,
                    contentType: false,
                    processData: false,
                    success: function (res) {
                        const data = JSON.parse(res);
                        if (data.error === 0) {
                            $("#form_upload_playlist").removeClass('active');
                            let html = data.data.map((data, index) => {
                                return `<li class="playlist_item" index="${index}" id_playlist="${data.pl_id}">
                      <div class="content">
                          <img src="../uploads/${data.img}" alt="">
                          <div class="hover_playlist">
                              <ion-icon name="close-outline" id="delete_playlist"></ion-icon>
                              <ion-icon name="play" id="run_playlist"></ion-icon>
                              <ion-icon name="heart"></ion-icon>
                          </div>
                      </div>
                      <div class="name_pl" style="margin: 4px 0 2px 0;">${data.name_playlist}</div>
                      <div class="author_pl">${data.name}</div>
                  </li>`;
                            })
                            $('#list_playlist').html(html.join(""));

                            toast({
                                title: "Thành công!",
                                message: data.message,
                                type: "success",
                                position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,

                                duration: 1000
                            });

                        } else {

                            toast({
                                title: "Thất bại!",
                                message: data.message,
                                type: "error",
                                position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,
                                duration: 1000
                            });

                        }
                    }
                });

            } else {
                toast({
                    title: "Cảnh báo!",
                    message: "Vui lòng nhập đầy đủ các trường.",
                    type: "warning",
                    position: `${window.innerWidth <= 768 ? "bottom" : "right"}`,
                    duration: 1000
                });
            }
        });
    }
    handle_btn_create_playlist();



    // // change name user
    function handle_btn_change_name() {
        $("#change_name, #save_name").on('click', function (e) {

            if ($(e.target).attr('id') == "change_name") {
                $('#name_user').attr('readonly', false);
                $('#name_user').css({ "background": "white", "color": "black" })
                $('#change_name').css("display", 'none');
                $('#save_name').css("display", 'block');
            }
            if ($(e.target).attr('id') == "save_name") {
                e.preventDefault();
                let form_data = new FormData();
                let new_name = $("#name_user").val();
                form_data.append('new_name', new_name);
                $.ajax({
                    url: './controller/change_name_user.php',
                    type: 'post',
                    data: form_data,
                    contentType: false,
                    processData: false,
                    success: function (res) {
                        let data = JSON.parse(res);
                        if (data.error == 0) {
                            $("#name_user").val(data.name)
                            toast({
                                title: "Thành công!",
                                message: "Thay đổi thành công!",
                                type: "success",
                                position: `${window.innerWidth <= 768 ? "bottom" : "left"}`,
                                duration: 1000
                            });


                            $('#name_user').attr('readonly', true).css({ "background": "transparent", "color": "white" })
                            $('#change_name').css("display", 'block');
                            $('#save_name').css("display", 'none');
                        } else {
                            $("#name_user").val(data.name)

                            toast({
                                title: "Thất bại!",
                                message: "Thay đổi tên không thành công.",
                                type: "error",
                                position: `${window.innerWidth <= 768 ? "bottom" : "left"}`,
                                duration: 1000
                            });

                        }
                    }
                });
            }
        })
    }
    handle_btn_change_name();
})
