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