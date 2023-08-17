-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 17, 2023 lúc 03:05 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `music_app`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `library`
--

CREATE TABLE `library` (
  `lb_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `library`
--

INSERT INTO `library` (`lb_id`, `m_id`, `u_id`) VALUES
(138, 1, 15),
(139, 2, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `musics`
--

CREATE TABLE `musics` (
  `m_id` int(11) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `artist` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `src` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(6) NOT NULL,
  `quatityLis` int(11) NOT NULL,
  `nation` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `musics`
--

INSERT INTO `musics` (`m_id`, `owner`, `name`, `artist`, `img`, `src`, `date`, `time`, `quatityLis`, `nation`, `category`) VALUES
(1, 'admin', 'Lối nhỏ', 'Đen ft. Phương Anh Đào', '../uploads/.64423beb12bb24.93537526lối nhỏ.jpg', '../musics/.64423beb12dbb2.81320385lối nhỏ.mp3', '2023-05-13', '04:57', 14, 'Việt Nam', 'Rap'),
(2, 'admin', 'Bài Này Chill Phết', 'Đen ft. MIN', '../uploads/.64423c6e994aa8.73818333bài hát này chill phết.jpg', '../musics/.64423c6e9966e1.55925589bài hát này chill phết.mp3', '2020-03-07', '04:33', 68, 'Việt Nam', 'Rap'),
(3, 'admin', 'Send It', 'Austin Mahone ft. Rich Homie Quan', '../uploads/.64423d257bb549.23110583send it.jpg', '../musics/.64423d257bdbf3.65244392send it.mp3', '2017-02-06', '03:00', 545, 'America', 'Acoustic'),
(4, 'admin', 'Despacito', 'Luis Fonsi  ft. Daddy Yankee', '../uploads/.64423dcf650bc8.96381254despacito.jpeg', '../musics/.64423dcf652427.94579752Despacito.mp3', '2020-12-27', '04:43', 68, 'Tây Ban Nha', 'Nhạc Latin'),
(5, 'admin', 'Shafe Of You', 'Ed Sheeran', '../uploads/.64423e65bd0008.02367475shape of You.jpg', '../musics/.64423e65bd1b17.61575376shape of You.mp3', '2023-05-12', '04:24', 89, 'America', 'Nhạc Latin'),
(6, 'admin', 'Tay Trái Chỉ Trăng', 'Tát Đỉnh Đỉnh', '../uploads/.64423f0150fbc1.64162794tay trái chỉ trăng.jpg', '../musics/.64423f015115b9.18407094tay trái chỉ trăng.mp3', '2020-12-27', '03:51', 124, 'Trung Quốc', 'OST'),
(7, 'admin', 'Señorita ', 'Shawn Mendes, Camila Cabello', '../uploads/.64423fa1413e56.04454479senorita.jpg', '../musics/.64423fa14167d6.13708982senorita.mp3', '2020-12-27', '03:11', 423, 'Latin', 'Nhạc Latin'),
(8, 'admin', 'Tremor ', 'Dimitri Vegas, Martin Garrix, Like Mike', '../uploads/.6442403f0cbef4.91992221tremor.jpg', '../musics/.6442403f0cd901.70570825tremor.mp3', '2020-12-27', '03:18', 445, 'America', 'EDM'),
(9, 'admin', 'The Spectre', 'Alan Walker', '../uploads/.6442407bbbe863.50732819The Spectre.jpg', '../musics/.6442407bbbffb9.52341382The Spectre.mp3', '0000-00-00', '03:26', 1, 'America', 'EDM'),
(10, 'admin', 'Chốn Quê Thanh Bình', 'Không biết', '../uploads/.644240ea8589a1.86725788chốn quê thanh bình.jpg', '../musics/.644240ea85a8a7.96291166chốn quê thanh bình.mp3', '2020-12-27', '03:05', 1, 'Việt Nam', 'Quê hương'),
(11, 'admin', 'The nights', 'Avicii ', '../uploads/.6442412e67cac6.83684476The Nights.jpg', '../musics/.6442412e67e7d6.82559139The Nights.mp3', '2020-12-27', '03:12', 0, 'America', 'Nhạc Latin'),
(12, 'admin', 'Gọi Đò', 'Dương Ngọc Thái', '../uploads/.644241640fc636.98575034gọi đò.jpg', '../musics/.644241640fdfe4.07585033gọi đò.mp3', '2020-12-27', '05:26', 0, 'Việt Nam', 'Bolero'),
(13, 'admin', 'Đò Sang Ngang', 'Quỳnh Trang', '../uploads/.644241e566caf6.98321561đò sang ngang.jpg', '../musics/.644241e566e865.79308057đò sang ngang.mp3', '2023-05-14', '04:47', 0, 'Việt Nam', 'Bolero'),
(14, 'admin', 'Mẹ Tôi', 'Võ Hạ Trâm', '../uploads/.64424217f0f512.45297042mẹ tôui.jpg', '../musics/.64424217f10f05.54133379mẹ tôi.mp3', '2020-12-27', '06:57', 1, 'Việt Nam', 'Bolero'),
(15, 'admin', 'Tình Cha', 'Ngọc Sơn', '../uploads/.6442424f3eb429.10648047tình cha.jpg', '../musics/.6442424f3ece06.02178779tình cha.mp3', '2023-05-12', '5:38', 0, 'Việt Nam', 'Bolero'),
(16, 'admin', 'Lily ', 'Alan Walker, K-391 & Emelie Hollow', '../uploads/.6443e5bf599604.53030627lily.jpg', '../musics/.6443e5bf59ec86.04907077lily.mp3', '2020-12-27', '03:15', 1, 'America', 'EDM'),
(17, 'admin', 'Faded ', 'Alan Walker', '../uploads/.6443e62b4bce92.41210053faded.jpg', '../musics/.6443e62b4c0718.83574149faded.mp3', '2020-12-27', '06:41', 1, 'America', 'EDM'),
(18, 'admin', 'Đó Chỉ Là Thành Phố Của Anh', 'lux', '../uploads/.6443e678e56a55.62842337do la thanh pho cua anh.jpg', '../musics/.6443e678e585c6.79821980do la thanh pho cua anh.mp3', '2020-12-27', '05:27', 1, 'Việt Nam', 'Rap'),
(19, 'admin', 'Đừng Ai Nhắc Về Cô Ấy', 'Quân A.P', '../uploads/.6443e6d8d8aaf5.79158597dung ai nhac ve co ay.jpg', '../musics/.6443e6d8d8c504.41947029dung ai nhac ve co ay.mp3', '2020-12-27', '04:23', 0, 'Việt Nam', 'Acoustic'),
(20, 'admin', 'Ừ Có Anh Đây', 'Tino', '../uploads/.6443e722235a96.42356499u co anh day.jpg', '../musics/.6443e722237b95.71756028u co anh day.mp3', '2020-12-27', '06:05', 1, 'Việt Nam', 'Nhạc trẻ'),
(21, 'admin', 'Nói Đi Là Đi ', 'Tăng Phúc', '../uploads/.6443e7660029e0.82404278noi di la di.jpg', '../musics/.6443e766004b69.14494042noi di la di.mp3', '2020-12-27', '05:27', 0, 'Việt Nam', 'Acoustic'),
(22, 'admin', 'Gió ', 'Jank ', '../uploads/.644407298157f3.33325716gio.jpg', '../musics/.644407298194d2.91380408gio.mp3', '2020-12-27', '04:00', 0, 'Việt Nam', 'Acoustic'),
(23, 'admin', 'Hạnh Phúc Bỏ Rơi Em', 'Hương Ly', '../uploads/.64440783145836.73351705hanh phuc bo roi em.jpg', '../musics/.644407831471c3.99962453hanh phuc bo roi em.mp3', '2020-12-27', '05:42', 2, 'Việt Nam', 'Acoustic'),
(24, 'admin', 'Đau Để Trưởng Thành', 'Hương Ly', '../uploads/.64440856c3e027.88450120dau de truong thanh.jpg', '../musics/.64440856c40137.42883322dau de truong thanh.mp3', '2020-12-27', '05:25', 0, 'Việt Nam', 'Cover'),
(25, 'admin', 'Khó Vẽ Nụ Cười', 'ĐạtG x Du Uyên ft. T-Bin', '../uploads/.644408a74cf975.87213306kho ve nu cuoi.jpg', '../musics/.644408a74d15b9.93442054kho ve nu cuoi.mp3', '2020-12-27', '04:20', 0, 'Việt Nam', 'Acoustic'),
(26, 'admin', 'PHÍA SAU MỘT CÔ GÁI', 'Soobin Hoàng Sơn', '../uploads/.644409f3b09705.66398196phia sau mot co gai.jpg', '../musics/.644409f3b0d576.55559796phia sau mot co gai.mp3', '2020-12-27', '04:32', 0, 'Việt Nam', 'Acoustic'),
(27, 'admin', 'YÊU 5', 'Rhymastic', '../uploads/.64440a56f1e966.75211311yeu 5.jpg', '../musics/.64440a56f20485.93089409y2meta.com - Lyrics __ YÊU 5 - Rhymastic (64 kbps).mp3', '2020-12-27', '04:10', 1, 'Việt Nam', 'Rap'),
(28, 'admin', 'One More Round', 'KSHMR, Jeremy Oceans ', '../uploads/.64440adb9224b7.33214561one more round.jpg', '../musics/.64440adb924373.42046168y2meta.com - One More Round - KSHMR, Jeremy Oceans (Lyrics + Vietsub) _ (Free Fire Booyah Day Theme Song) (64 kbps).mp3', '2020-12-27', '03:21', 1, 'America', 'EDM'),
(29, 'admin', 'Tình Đắng Như Ly Cà Phê', ' Ngơ (MCK rapViet) ft Nân', '../uploads/.64440b1d7d6143.10977431tinh dang nhu ly cafe.jpg', '../musics/.64440b1d7d7a76.74633626y2meta.com - Tình Đắng Như Ly Cà Phê - Ngơ (MCK rapViet) ft Nân - Lyric Video (64 kbps).mp3', '2020-12-27', '03:35', 0, 'Việt Nam', 'Rap'),
(30, 'admin', 'Endless Love ', 'Jackie Chan - Kim Hee Sun', '../uploads/.64440be337a8f1.67930068than thoai.jpg', '../musics/.64440be337da82.88352698y2meta.com - Thần Thoại –美丽的神话 Endless Love  成龙Jackie Chan  金喜善Kim Hee Sun   nghe nhạc học tiếng trung (64 kbps).mp3', '2020-12-27', '04:44', 1, 'Trung Quốc', 'OST'),
(31, 'admin', 'Ievan Polkka', 'Hatsune Miku', '../uploads/.64440c4cc372c2.31471218levan polka.jpg', '../musics/.64440c4cc38b43.69227859y2meta.com - Hatsune Miku - Ievan Polkka (64 kbps).mp3', '2020-12-27', '02:29', 4, 'Nhật Bản', 'Anime');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playlist`
--

CREATE TABLE `playlist` (
  `pl_id` int(11) NOT NULL,
  `name_playlist` varchar(100) NOT NULL,
  `img` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `u_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `playlist`
--

INSERT INTO `playlist` (`pl_id`, `name_playlist`, `img`, `date`, `u_id`) VALUES
(39, 'An', 'IMG-PLAYLIST-64607771cb9872.99762622.jpg', '2023-05-14', 15),
(40, 'Thư', 'IMG-PLAYLIST-64607774540386.10112283.jpg', '2023-05-14', 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playlist_item`
--

CREATE TABLE `playlist_item` (
  `pl_item_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL,
  `pl_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `uploads`
--

CREATE TABLE `uploads` (
  `up_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `u_id` int(11) NOT NULL,
  `m_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `role` varchar(10) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `birthday` date NOT NULL,
  `gender` enum('male','female','not','other','private') NOT NULL,
  `img` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`u_id`, `role`, `name`, `email`, `password`, `birthday`, `gender`, `img`) VALUES
(4, 'admin', 'admin', 'admin@gmail.com', 'admin', '2023-01-01', 'male', 'IMG-USER-645debd7eb2520.69658928.png'),
(15, 'user', 'Minh Thư', 'an@gmail.com', '28dc0aa516c137cdcc709cb1e7cd02aa', '2002-04-24', 'male', 'IMG-USER-646122b63b21f4.55116974.jpg'),
(16, 'user', 'Luu Truong', 'anluu099@gmail.com', '28dc0aa516c137cdcc709cb1e7cd02aa', '2000-01-20', 'female', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`lb_id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `m_id` (`m_id`);

--
-- Chỉ mục cho bảng `musics`
--
ALTER TABLE `musics`
  ADD PRIMARY KEY (`m_id`);

--
-- Chỉ mục cho bảng `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`pl_id`),
  ADD KEY `u_id` (`u_id`);

--
-- Chỉ mục cho bảng `playlist_item`
--
ALTER TABLE `playlist_item`
  ADD PRIMARY KEY (`pl_item_id`),
  ADD KEY `pl_id` (`pl_id`),
  ADD KEY `m_id` (`m_id`);

--
-- Chỉ mục cho bảng `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`up_id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `m_id` (`m_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `library`
--
ALTER TABLE `library`
  MODIFY `lb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT cho bảng `musics`
--
ALTER TABLE `musics`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `playlist`
--
ALTER TABLE `playlist`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `playlist_item`
--
ALTER TABLE `playlist_item`
  MODIFY `pl_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT cho bảng `uploads`
--
ALTER TABLE `uploads`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`),
  ADD CONSTRAINT `library_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `musics` (`m_id`),
  ADD CONSTRAINT `library_ibfk_3` FOREIGN KEY (`m_id`) REFERENCES `musics` (`m_id`),
  ADD CONSTRAINT `library_ibfk_4` FOREIGN KEY (`m_id`) REFERENCES `musics` (`m_id`);

--
-- Các ràng buộc cho bảng `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`);

--
-- Các ràng buộc cho bảng `playlist_item`
--
ALTER TABLE `playlist_item`
  ADD CONSTRAINT `playlist_item_ibfk_1` FOREIGN KEY (`pl_id`) REFERENCES `playlist` (`pl_id`),
  ADD CONSTRAINT `playlist_item_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `musics` (`m_id`);

--
-- Các ràng buộc cho bảng `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`),
  ADD CONSTRAINT `uploads_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `musics` (`m_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
