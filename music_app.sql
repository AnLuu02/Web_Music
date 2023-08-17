-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 17, 2023 lúc 09:04 PM
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
(204, 20, 4),
(205, 1, 4);

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
(1, 'admin', 'Lối nhỏ', 'Đen ft. Phương Anh Đào', '../uploads/.64423beb12bb24.93537526lối nhỏ.jpg', '../musics/.64423beb12dbb2.81320385lối nhỏ.mp3', '2023-05-13', '04:57', 18, 'Việt Nam', 'Rap'),
(2, 'admin', 'Bài Này Chill Phết', 'Đen ft. MIN', '../uploads/.64423c6e994aa8.73818333bài hát này chill phết.jpg', '../musics/.64423c6e9966e1.55925589bài hát này chill phết.mp3', '2020-03-07', '04:33', 73, 'Việt Nam', 'Rap'),
(3, 'admin', 'Send It', 'Austin Mahone ft. Rich Homie Quan', '../uploads/.64423d257bb549.23110583send it.jpg', '../musics/.64423d257bdbf3.65244392send it.mp3', '2017-02-06', '03:00', 545, 'America', 'Acoustic'),
(4, 'admin', 'Despacito', 'Luis Fonsi  ft. Daddy Yankee', '../uploads/.64423dcf650bc8.96381254despacito.jpeg', '../musics/.64423dcf652427.94579752Despacito.mp3', '2020-12-27', '04:43', 68, 'Tây Ban Nha', 'Nhạc Latin'),
(5, 'admin', 'Shafe Of You', 'Ed Sheeran', '../uploads/.64423e65bd0008.02367475shape of You.jpg', '../musics/.64423e65bd1b17.61575376shape of You.mp3', '2023-05-12', '04:24', 89, 'America', 'Nhạc Latin'),
(6, 'admin', 'Tay Trái Chỉ Trăng', 'Tát Đỉnh Đỉnh', '../uploads/.64423f0150fbc1.64162794tay trái chỉ trăng.jpg', '../musics/.64423f015115b9.18407094tay trái chỉ trăng.mp3', '2020-12-27', '03:51', 124, 'Trung Quốc', 'OST'),
(7, 'admin', 'Señorita ', 'Shawn Mendes, Camila Cabello', '../uploads/.64423fa1413e56.04454479senorita.jpg', '../musics/.64423fa14167d6.13708982senorita.mp3', '2020-12-27', '03:11', 423, 'Latin', 'Nhạc Latin'),
(8, 'admin', 'Tremor ', 'Dimitri Vegas, Martin Garrix, Like Mike', '../uploads/.6442403f0cbef4.91992221tremor.jpg', '../musics/.6442403f0cd901.70570825tremor.mp3', '2020-12-27', '03:18', 445, 'America', 'EDM'),
(9, 'admin', 'The Spectre', 'Alan Walker', '../uploads/.6442407bbbe863.50732819The Spectre.jpg', '../musics/.6442407bbbffb9.52341382The Spectre.mp3', '0000-00-00', '03:26', 1, 'America', 'EDM'),
(10, 'admin', 'Chốn Quê Thanh Bình', 'Không biết', '../uploads/.644240ea8589a1.86725788chốn quê thanh bình.jpg', '../musics/.644240ea85a8a7.96291166chốn quê thanh bình.mp3', '2020-12-27', '03:05', 2, 'Việt Nam', 'Quê hương'),
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
(31, 'admin', 'Ievan Polkka', 'Hatsune Miku', '../uploads/.64440c4cc372c2.31471218levan polka.jpg', '../musics/.64440c4cc38b43.69227859y2meta.com - Hatsune Miku - Ievan Polkka (64 kbps).mp3', '2020-12-27', '02:29', 4, 'Nhật Bản', 'Anime'),
(32, 'admin', 'Khu Tao Sống', 'Wowy - Karik', '../uploads/.64de501555fe26.26662298khutaosong.jpg', '../musics/.64de501555ff19.73406900y2meta.com - Khu Tao Song - Wowy Karik (OFFICIAL VIDEO HD) (64 kbps).mp3', '2023-08-17', '04:04', 1, 'Việt Nam', 'Rap'),
(33, 'admin', 'HIS STORY', 'HUSTLANG Robber', '../uploads/.64de517cbe8b30.32248746history.jpg', '../musics/.64de517cbe8c51.12271125y2meta.com - HUSTLANG Robber - HIS STORY (M_V) (64 kbps) (1).mp3', '2023-08-17', '03:52', 0, 'Việt Nam', 'Rap'),
(34, 'admin', 'Sầu Hồng Gai', 'JOMBIE x TKAN', '../uploads/.64de5288074301.99218181sauhonggai.jpg', '../musics/.64de52880743f8.36386978y2meta.com - SẦU HỒNG GAI _ JOMBIE x TKAN _ OFFICIAL MUSIC VIDEO LYRICS (64 kbps).mp3', '2023-08-17', '05:54', 0, 'Việt Nam', 'Rap'),
(35, 'admin', 'Em iu', 'Andree Right Hand feat. Wxrdie, Bình Gold, 2pillz', '../uploads/.64de52e01ba6b1.68949234emiu.jpg', '../musics/.64de52e01ba9d5.68035066y2meta.com - Andree Right Hand - Em iu feat. Wxrdie, Bình Gold, 2pillz _ Official MV (64 kbps).mp3', '2023-08-17', '03:15', 0, 'Việt Nam', 'Rap'),
(36, 'admin', 'Hai Thế Giới', 'Wowy & Karik', '../uploads/.64de533092a6f6.65241435mqdefault.jpg', '../musics/.64de533092a7f9.81396333y2meta.com - Hai Thế Giới full - Wowy & Karik ( Official Video HD full ) (128 kbps).mp3', '2023-08-17', '04:42', 0, 'Việt Nam', 'Rap'),
(37, 'admin', 'Bạn Của Tao', 'YoungH x Binz x SO x Pjpo', '../uploads/.64de54503ea2b9.01181375mqdefault (1).jpg', '../musics/.64de54503ea357.80237008y2meta.com - BẠN CỦA TAO - YoungH x Binz x SO x Pjpo _ 2015 _ Video Lyrics (128 kbps).mp3', '2023-08-17', '05:08', 0, 'Việt Nam', 'Rap'),
(38, 'admin', 'Em Là Bad Girl Trong Bộ Váy Ngắn', 'VP NIZ X Trần Huyền Diệp', '../uploads/.64de547ea307f7.69895379mqdefault (2).jpg', '../musics/.64de547ea30881.70928199y2meta.com - Em Là Bad Girl Trong Bộ Váy Ngắn (Short Skirt) - VP NIZ X Trần Huyền Diệp (Prod. CM1X) (128 kbps).mp3', '2023-08-17', '04:07', 0, 'Việt Nam', 'Rap'),
(39, 'admin', 'Chơi Như Tụi Mỹ', 'Andree Right Hand ', '../uploads/.64de54d356f405.33159427mqdefault (3).jpg', '../musics/.64de54d356f4b7.69292179y2meta.com - Andree Right Hand - Chơi Như Tụi Mỹ _ Official MV (128 kbps).mp3', '2023-08-17', '03:13', 0, 'Việt Nam', 'Rap'),
(40, 'admin', 'Lửng Lơ', 'MASEW x BRAY ft. RedT x Ý Tiên', '../uploads/.64de551ed969f2.92224797mqdefault (4).jpg', '../musics/.64de551ed96b11.22135300y2meta.com - Lửng Lơ _ MASEW x BRAY ft. RedT x Ý Tiên _ MV OFFICIAL (128 kbps).mp3', '2023-08-17', '05:07', 0, 'Việt Nam', ''),
(41, 'admin', 'SÓNG GIÓ', 'K-ICM x JACK', '../uploads/.64de558f230358.58406565mqdefault (5).jpg', '../musics/.64de558f2303f6.44192585y2meta.com - SÓNG GIÓ _ K-ICM x JACK _ OFFICIAL MUSIC VIDEO (128 kbps).mp3', '2023-08-17', '05:50', 0, 'Việt Nam', 'Acoustic'),
(42, 'admin', 'Mẹ Ơi 2', 'JACK (G5R)', '../uploads/.64de55ea840364.97581910mqdefault (6).jpg', '../musics/.64de55ea840495.58674335y2meta.com - [MV] MẸ ƠI 2 -  JACK (G5R) (128 kbps).mp3', '2023-08-17', '05:15', 0, 'Việt Nam', 'Rap'),
(43, 'admin', 'Westside SQUAD', 'Jombie ft Dế Choắt & Endless', '../uploads/.64de56271f31d7.12559628mqdefault (7).jpg', '../musics/.64de56271f3278.73553566y2meta.com - [OFFICIAL MV] Westside SQUAD - jombie ft Dế Choắt & Endless (128 kbps).mp3', '2023-08-17', '03:04', 0, 'Việt Nam', 'Rap'),
(44, 'admin', 'B.S.N.L 2', 'B-RAY ft. YOUNG-H', '../uploads/.64de56565f99d1.37539778mqdefault (8).jpg', '../musics/.64de56565f9a98.33260066y2meta.com - B.S.N.L 2 - B-RAY ft. YOUNG-H (128 kbps).mp3', '2023-08-17', '04:37', 0, 'Việt Nam', 'Rap'),
(45, 'admin', 'Buồn Của Anh', 'K-ICM x Đạt G x Masew', '../uploads/.64de569de87f88.13776414mqdefault (9).jpg', '../musics/.64de569de88044.36392560y2meta.com - Buồn Của Anh _ K-ICM x Đạt G x Masew (128 kbps).mp3', '2023-08-17', '04:39', 0, 'Việt Nam', 'Rap'),
(46, 'admin', 'THIÊU THÂN', 'B RAY x SOFIA & CHÂU ĐĂNG KHOA', '../uploads/.64de56fabc22e3.71208723mqdefault (10).jpg', '../musics/.64de56fabc2432.61594087y2meta.com - B RAY x SOFIA & CHÂU ĐĂNG KHOA _ THIÊU THÂN _ OFFICIAL MV (128 kbps).mp3', '2023-08-17', '04:01', 0, 'Việt Nam', 'Rap'),
(47, 'admin', 'Thằng Bé Cầm Quyền', 'Cover - KTS XUAN HUY ( Sáng tác Xavi Pham)', '../uploads/.64de573d37d846.76132310mqdefault (11).jpg', '../musics/.64de573d37d904.12976530y2meta.com - THANG BE CAM QUYEN Cover - KTS XUAN HUY ( Sáng tác Xavi Pham) (128 kbps).mp3', '2023-08-17', '04:58', 0, 'Việt Nam', 'Rap'),
(48, 'admin', 'Đường Một Chiều', 'Huỳnh Tú ft. Magazine', '../uploads/.64de576fb8a7e4.60388517mqdefault (12).jpg', '../musics/.64de576fb8a8d9.83948221y2meta.com - Đường Một Chiều - Huỳnh Tú ft. Magazine __ Official Music Video (128 kbps).mp3', '2023-08-17', '04:49', 0, 'Việt Nam', 'Acoustic'),
(49, 'admin', 'Tháng 7 của anh, em và cô đơn', 'Khói', '../uploads/.64de579c881bc1.55540846mqdefault (13).jpg', '../musics/.64de579c881c90.10413718y2meta.com - Khói - Tháng 7 của anh, em và cô đơn (Lyric Video) _ tas release (128 kbps).mp3', '2023-08-17', '05:02', 0, 'Việt Nam', 'Rap'),
(50, 'admin', 'CHẮC GÌ ANH YÊU CÔ ẤY', 'HƯƠNG LY', '../uploads/.64de581009f458.31609624mqdefault (14).jpg', '../musics/.64de581009f523.46475300y2meta.com - CHẮC GÌ ANH YÊU CÔ ẤY - HƯƠNG LY _ OFFICIAL MUSIC VIDEO (128 kbps).mp3', '2023-08-17', '05:01', 0, 'Việt Nam', 'Acoustic'),
(51, 'admin', 'Em Là Kẻ Đáng Thương', 'PHÁT HUY T4', '../uploads/.64de583b39a6a9.42779469mqdefault (15).jpg', '../musics/.64de583b39a736.39264174y2meta.com - EM LÀ KẺ ĐÁNG THƯƠNG - PHÁT HUY T4 __ OFFICIAL MV (128 kbps).mp3', '2023-08-17', '04:21', 0, 'Việt Nam', 'Acoustic'),
(52, 'admin', 'Ngày Mai Em Đi Mất', 'Đạt G', '../uploads/.64de5870e22354.18421708mqdefault (16).jpg', '../musics/.64de5870e22429.56849149y2meta.com - Đạt G - Ngày Mai Em Đi Mất _ Live at #DearOcean @DatGMusic (128 kbps).mp3', '2023-08-17', '04:09', 0, 'Việt Nam', 'Acoustic'),
(53, 'admin', 'Buồn Không Em', 'Đạt G', '../uploads/.64de58ac313053.89509241mqdefault (17).jpg', '../musics/.64de58ac313194.98838123y2meta.com - Đạt G - Buồn Không Em _ Live at #DearOcean @DatGMusic (128 kbps).mp3', '2023-08-17', '05:51', 0, 'Việt Nam', 'Acoustic'),
(54, 'admin', 'từ chối nhẹ nhàng thôi ', 'PHÚC DU feat. @BICHPHUONGOFFICIAL', '../uploads/.64de58d30ffec5.06299802mqdefault (18).jpg', '../musics/.64de58d30fffb4.64947898y2meta.com - PHÚC DU feat. @BICHPHUONGOFFICIAL - từ chối nhẹ nhàng thôi (Official M_V) (128 kbps).mp3', '2023-08-17', '04:09', 0, 'Việt Nam', 'Rap'),
(55, 'admin', ' ‘3107’ full album', 'W/n - ft. ( 267, Nâu ,Dươngg )', '../uploads/.64de5928e3e859.31943978mqdefault (19).jpg', '../musics/.64de5928e3e919.25728262y2meta.com - W_n - ‘3107’ full album_ ft. ( 267, Nâu ,Dươngg ) (128 kbps).mp3', '2023-08-17', '12:17', 0, 'Việt Nam', 'Rap - Acoustic'),
(56, 'admin', 'id 072019', 'W/n - 3107 ft 267', '../uploads/.64de59700d6af3.94622686mqdefault (20).jpg', '../musics/.64de59700d6ba1.98870393y2meta.com - W_n - id 072019 _ 3107 ft 267 (128 kbps).mp3', '2023-08-17', '05:02', 0, 'Việt Nam', 'Rap'),
(57, 'admin', 'DANG DỞ', 'NAL', '../uploads/.64de59d18a82b4.91947342mqdefault (21).jpg', '../musics/.64de59d18a8358.27423298y2meta.com - DANG DỞ - NAL _ OFFICIAL MUSIC VIDEO (128 kbps).mp3', '2023-08-17', '05:34', 0, 'Việt Nam', 'Acoustic'),
(58, 'admin', 'Người Âm Phủ', 'OSAD x VRT', '../uploads/.64de5a03e49a50.63698639mqdefault (22).jpg', '../musics/.64de5a03e49af3.23574966y2meta.com - Người Âm Phủ - OSAD x VRT _ OFFICIAL VERSION (128 kbps).mp3', '2023-08-17', '02:08', 0, 'Việt Nam', 'Rap'),
(59, 'admin', 'Một Nhà', 'Một Nhà', '../uploads/.64de5a36695a71.10253385mqdefault (23).jpg', '../musics/.64de5a36695b25.10216944y2meta.com - Một Nhà - Da LAB _ Official Lyric Video (128 kbps).mp3', '2023-08-17', 'Da LAB', 0, 'Việt Nam', 'Rap'),
(60, 'admin', 'Bài Ka Tuổi Trẻ', 'TamKa PKL', '../uploads/.64de5a6e9ae8f6.14810235mqdefault (24).jpg', '../musics/.64de5a6e9ae9b9.93876131y2meta.com - Bài Ka Tuổi Trẻ - TamKa PKL _ Official Music Video (128 kbps).mp3', '2023-08-17', '05:35', 0, 'Việt Nam', 'Rap'),
(61, 'admin', 'Bởi Vì Anh Yêu Em', 'Bằng Kiều ft Triệu Hồng Ngọc', '../uploads/.64de5a9f39beb4.07036267mqdefault (25).jpg', '../musics/.64de5a9f39bf36.04347974y2meta.com - Bởi Vì Anh Yêu Em - Bằng Kiều ft Triệu Hồng Ngọc (128 kbps).mp3', '2023-08-17', '04:10', 0, 'Việt Nam', 'Acoustic'),
(62, 'admin', 'I Need Your Love', 'Đăng Long Remix', '../uploads/.64de5b216a7de7.01341228mqdefault (26).jpg', '../musics/.64de5b216a7eb4.49704527y2meta.com - I Need Your Love (Đăng Long Remix) _ Bản Nhạc 8x Huyền Thoại Xu Hướng Tiktok (128 kbps).mp3', '2023-08-17', '04:39', 0, 'American', 'Vinahouse'),
(63, 'admin', 'Happy New Year', 'ABBA', '../uploads/.64de5b67b301b9.78335603mqdefault (27).jpg', '../musics/.64de5b67b30259.95402883y2meta.com - ABBA - Happy New Year (Video) (128 kbps).mp3', '2023-08-17', '04:28', 0, 'America', 'Acoustic'),
(64, 'admin', 'That Girl', 'Olly Murs', '../uploads/.64de5bc17b9c52.35955523mqdefault (28).jpg', '../musics/.64de5bc17b9d23.50153625y2meta.com - [Vietsub + Kara] That Girl - Olly Murs (lyrics) - Tik Tok (128 kbps).mp3', '2023-08-17', '02:55', 0, 'America', 'Acoustic'),
(65, 'admin', 'Reality', 'Lost Frequencies', '../uploads/.64de5bf141fcf0.61114191mqdefault (29).jpg', '../musics/.64de5bf141fd98.32492959y2meta.com - Reality  -  Lost  Frequencies  _   Lyrics + Vietsub. (128 kbps).mp3', '2023-08-17', '02:38', 0, 'America', 'Acoustic'),
(66, 'admin', 'See You Again', 'Wiz Khalifa - ft. Charlie Puth', '../uploads/.64de5c2b1e7d29.10674745mqdefault (30).jpg', '../musics/.64de5c2b1e7da9.13711213y2meta.com - Wiz Khalifa - See You Again ft. Charlie Puth [Official Video] Furious 7 Soundtrack (128 kbps).mp3', '2023-08-17', '03:57', 0, 'America', 'Acoustic');

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
(4, 'admin', 'admin', 'admin@gmail.com', 'admin', '2023-01-01', 'male', ''),
(15, 'user', 'Minh Thư', 'an@gmail.com', '28dc0aa516c137cdcc709cb1e7cd02aa', '2002-04-24', 'male', ''),
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
  MODIFY `lb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT cho bảng `musics`
--
ALTER TABLE `musics`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT cho bảng `playlist`
--
ALTER TABLE `playlist`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `playlist_item`
--
ALTER TABLE `playlist_item`
  MODIFY `pl_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT cho bảng `uploads`
--
ALTER TABLE `uploads`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
