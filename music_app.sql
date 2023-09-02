-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 25, 2023 lúc 07:03 PM
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
-- Cấu trúc bảng cho bảng `albums`
--

CREATE TABLE `albums` (
  `m_id` int(11) NOT NULL,
  `ar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `albums`
--

INSERT INTO `albums` (`m_id`, `ar_id`) VALUES
(1, 1),
(1, 72),
(2, 1),
(2, 2),
(3, 4),
(3, 5),
(4, 3),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(7, 10),
(8, 11),
(8, 12),
(9, 13),
(10, 15),
(11, 14),
(12, 15),
(13, 16),
(14, 17),
(15, 18),
(16, 13),
(17, 13),
(18, 19),
(19, 20),
(20, 21),
(21, 22),
(22, 23),
(23, 24),
(24, 24),
(25, 25),
(25, 26),
(26, 27),
(27, 28),
(28, 29),
(29, 30),
(32, 31),
(32, 32),
(33, 33),
(34, 34),
(34, 35),
(35, 36),
(35, 38),
(35, 39),
(36, 31),
(36, 32),
(37, 45),
(38, 40),
(38, 17),
(39, 36),
(40, 42),
(40, 41),
(41, 43),
(42, 43),
(43, 34),
(43, 44),
(44, 41),
(44, 45),
(45, 25),
(45, 42),
(46, 41),
(46, 46),
(46, 47),
(48, 48),
(49, 49),
(50, 24),
(51, 50),
(52, 25),
(53, 25),
(54, 70),
(54, 71),
(55, 69),
(56, 69),
(57, 68),
(58, 66),
(59, 67),
(60, 65),
(61, 63),
(61, 64),
(63, 62),
(64, 61),
(65, 60),
(66, 58),
(66, 59),
(67, 57),
(68, 56),
(69, 55),
(70, 24),
(71, 54),
(72, 53),
(73, 52),
(74, 51);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `artist`
--

CREATE TABLE `artist` (
  `ar_id` int(11) NOT NULL,
  `name_artist` varchar(100) NOT NULL,
  `birthday` datetime NOT NULL,
  `country` varchar(100) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `followers` int(11) NOT NULL,
  `avatar` varchar(500) NOT NULL,
  `album_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `artist`
--

INSERT INTO `artist` (`ar_id`, `name_artist`, `birthday`, `country`, `description`, `followers`, `avatar`, `album_id`) VALUES
(1, 'Đen', '2023-08-23 09:32:00', 'Việt Nam', 'Năm 2014, anh ra mắt \"Đưa Nhau Đi Trốn\" cùng Linh Cáo. Bài hát nhanh chóng trở thành hit. Tiếp nối thành công, cả hai tiếp tục kết hợp trong \"Ta cứ Đi Cùng Nhau\".\r\nNăm 2018, Đen liên tiếp ra mắt các sản phẩm mới nhưng đến \"Anh Đếch Cần Gì Nhiều Ngoài Em\" thì Đen trở thành hiện tượng xã hội.\r\nNăm 2019 là một năm thành công cùa Đen với những bản hit nổi tiếng như \"Mười Năm\" (cùng Ngọc Linh) kỷ niệm hành trình 10 năm theo rap, \"Bài Này Chill Phết\" cùng Min, \"Hai Triệu Năm\" (cùng Biên), \"Lối Nhỏ\" (cùng Phương Anh Đào) và \"Cảm Ơn\" (cùng Biên). Liveshow đầu tiên của mang tên \"Show của Đen\" được tổ chức vào tháng 11.\r\nĐầu năm 2020, Đen Vâu ra mắt \"Một Triệu Like\" kết hợp với Thành Đồng.', 523858, '../img_artist/den.webp', NULL),
(2, 'MIN', '2023-08-23 09:35:26', 'Việt Nam', 'MIN đã có một bước đột phá mới trong sự nghiệp nghệ thuật, khi giới thiệu tới báo giới và người yêu nhạc ca khúc TÌM như một khởi đầu tốt đẹp cho con đường ca hát chuyên nghiệp.\r\n\r\nTÌM là một trong những ca khúc được tìm nghe nhiều nhất trên mạng xã hội, trong tháng 12/2013, và cũng là sản phẩm mở đường, giúp Min thêm nhiều cơ hội hợp tác cùng các nghệ sĩ trẻ khác.\r\n\r\nVới giọng hát tình cảm ngọt ngào và cá tính, có thể nói rằng, Min như một cơn gió lạ, một hình tượng mới của giới nghệ thuật Việt Nam, đang từng bước khẳng định được chính mình với sự ủng hộ của thế hệ trẻ.\r\n\r\n2017 phát hành các singles như Ghen, Chưa Bao Giờ Mẹ Kể, Có Em Chờ......', 384010, '../img_artist/min.webp', NULL),
(3, 'Luis Fonsi', '2023-08-23 09:40:19', 'America', 'Năm 1998, Luis phát hành album phòng thu đầu tay \"Comenzaré\", đạt hạng 11 trên bảng xếp hạng Top Latin Albums của Billboard.\r\nNăm 2009, anh được trao giải Grammy Latin ở hạng mục Bài Hát Của Năm cho ca khúc \"Aquí Estoy Yo\".\r\nNăm 2017, anh phát hành ca khúc \"Despacito\" hợp tác với Daddy Yankee. Despacito nhanh chóng leo lên hạng nhất tại hầu hết các bảng xếp hạng nhạc Latin của Billboard. Đến tháng 4 cùng năm, Justin Bieber góp giọng trong bản remix tiếng Anh và từ đó đưa bản phối này lên vị trí đầu bảng xếp hạng Hot 100. Tên tuổi của Luis Fonsi trở nên nổi tiếng toàn cầu.\r\nNăm 2019, anh phát hành album thứ 10 trong sự nghiệp có tên \"Vida\", đứng đầu Billboard Top Latin Album.', 7471, '../img_artist/luis_fonsi.jpg', NULL),
(4, 'Austin Mahone\r\n', '2023-08-23 09:40:19', 'America', '\r\nAustin Mahone là một ca sĩ nhạc pop người Mỹ đã trở nên nổi\r\ntiếng trong năm 2011 do video virus các buổi biểu diễn của mình .\r\nĐĩa đơn đầu tay của Mahone mang tên 11:11 được phát hành vào\r\nngày 14 tháng 2 năm 2012 .', 3875, '../img_artist/Austin_Mahone.jpg', NULL),
(5, 'Rich Homie Quan\r\n', '2023-08-23 09:40:19', 'America', '\r\nDequantes Devontay Lamar, nổi tiếng với nghệ danh Rich Homie\r\nQuan, là một rapper, ca sĩ và nhạc sĩ người Mỹ. Ông được ký hợp\r\nđồng với nhãn hiệu độc lập T.I.G. Giải trí và hãng record Motown.\r\nAnh đã hợp tác với các nghệ sĩ Atlanta như Young Thug và\r\nBirdman. Album studio đầu tay của Quan, Rich as in Spirit được\r\nphát hành vào ngày 16 tháng 3 năm 2018.', 228, '../img_artist/Rich_Homie_Quan.jpg', NULL),
(6, 'Daddy Yankee', '2023-08-23 09:40:19', 'America', 'Ramón \"Raymond\" Luis Rodríguez Ayala (sinh ngày 03 /2/1977), được biết đến nghệ thuật như là Daddy Yankee, là một giải Grammy Latin giành giải thưởng nghệ sĩ thu âm Puerto Rico reggaeton. Ayala được sinh ra ở Río Piedras, huyện lớn nhất của San Juan, nơi ông trở thành người được giới âm nhạc quan tâm khi còn trẻ. Trong giới trẻ, ông đã quan tâm đến bóng chày, và mơ ước trở thành một cầu thủ bóng chày Major League. Ông đã không thể tiếp tục môn thể thao này khi ông nhận được một thương tích cho một trong hai chân của mình, để anh không thể đi lại một cách chính xác. Ông sau đó trở thành tham gia vào các phong trào rap ngầm đó là trong giai đoạn đầu của nó ở Puerto Rico, sau này được gọi là Reggaeton. Sau khi nhận được bài học từ một số nghệ sĩ trong thể loại này, ông đã phát triển một sự nghiệp độc lập, ghi âm đầu tiên trong sản xuất có tiêu đề Playero 37. Sau này, ông bắt đầu sản xuất album độc lập. album solo đầu tiên của ông là No Mercy. Ông sau đó hình thành một bộ đôi với Nicky Jam', 1906, '../img_artist/Daddy_Yankee.jpg', NULL),
(7, 'Ed Sheeran\r\n', '2023-08-23 09:40:19', 'Vương Quốc Anh', 'Ed Sheeran là nghệ sĩ người Anh sinh ra tại Hebden Bridge ,Ed Sheeran có một người anh trai tên là Matthew, nhà soạn nhạc cổ điển và sinh viên âm nhạc đã tốt nghiệp. Ed Sheeran hát trong dàn hợp xướng tại nhà thờ từ năm lên 4 và học chơi guitar từ rất nhỏ, và bắt đầu sáng tác khi anh học tại trường cấp II Thomas Mills tại Framlingham. Trong trí nhớ của Ed Sheeran, phong cách âm nhạc của anh chịu ảnh hưởng từ việc nghe nhạc của Bob Dylan, Eric Clapton và Van Morrison trong vô số các chuyến đi tới Luân Đôn với bố mẹ. Ed nói rằng album đầu tiên mà anh được nghe là Irish Heartbeat của Van Morrison. Trong \"Zane Lowe show\", anh đã nói rằng người đã mang lại cho anh ảnh hưởng lớn nhất tới quyết định chơi nhạc và trở thành ca sĩ là Damien Rice. Anh đã được gặp Damien Rice sau khi xem buổi diễn của Rice tại Ireland lúc 11 tuổi và đã sáng tác bài hát đầu tiên của mình ngay ngày hôm sau. Ngoài Damian Rice, The Beatles, Bob Dylan, Nizlopi và Eminem cũng được anh coi là có ảnh hưởng lớn tới âm nhạc', 80429, '../img_artist/Ed_Sheeran.jpg', NULL),
(8, 'Tát Đỉnh Đỉnh / 薩頂頂\r\n', '2023-08-23 09:40:19', 'China', 'Tát Đỉnh Đỉnh sinh tại Nội Mông vào năm 1983, mẹ là một bác sĩ Mông Cổ và cha là nhân viên chính phủ người Hán. Thuở nhỏ, cô sống du cư trên thảo nguyên Nội Mông với bà ngoại của mình. Cô nhớ lại rằng \"hàng ngày tôi nghe mọi người hát, những ngày đó dạy tôi rằng âm nhạc chính là tự do\".\r\n\r\nKhi lên 6 tuổi, Tát theo cha mẹ rời Nội Mông tới tỉnh Sơn Đông, rồi Tứ Xuyên, Trung Quốc. Khi 17 tuổi, gia đình cô chuyển tới Bắc Kinh, nơi cô học đại học chuyên ngành Phật giáo và yoga. Những chuyến hành trình đã đem lại cho Tát niềm say mê ngôn ngữ, âm nhạc và trang phục, mà đã trở thành tư liêu cho những tác phẩm của cô. Trên đường đi, cô đã học tiếng Phạn, tiếng Tây Tạng và cả tiếng Lagu, một ngôn ngữ đang dần biến mất nhanh chóng ở các ngôi làng xa xôi tại miền Nam Trung Quốc.\r\n\r\nTát Đỉnh Đỉnh nhanh chóng nổi tiếng sau khi giành chiến thắng trong một cuộc thi hát tổ chức bởi Đài Truyền hình Trung ương Trung Quốc năm 2000.Năm 18 tuổi, cô phát hành album đầu tay mang tên Đông ba lạp (咚巴啦) với nghệ', 69942, '../img_artist/tat_dinh_dinh.jpg', NULL),
(9, 'Shawn Mendes\r\n', '2023-08-23 09:40:19', 'Canada', 'Là ca sĩ, nhạc sĩ người Canada, anh bắt đầu được chú ý vào năm\r\n2013 với những bài hát cover trên mạng xã hội, sau đó nổi lên với\r\nhàng loạt ca khúc triệu view như \"Stiches\", \"Treat You Better\",...', 29303, '../img_artist/Shawn_Mendes.webp', NULL),
(10, 'Camila Cabello\r\n', '2023-08-23 09:40:19', 'Cuba', 'Năm 2012, Camila Cabello tham gia cuộc thi The X Factor USA, sau đó tham gia ban nhạc Fifth Harmony cùng 4 thí sinh. Nhóm đạt được những thành công nhất định. Cuối năm 2016, cô rời nhóm.\r\nNăm 2017, cô ra mắt với tư cách nghệ sĩ solo với đĩa đơn \"Crying In The Club\". Cũng trong năm, ca khúc \"Havana\" kết hợp cùng Young Thug ra mắt, đứng đầu các bảng xếp hạng, giúp cô nổi tiếng thế giới.\r\nNăm 2018, album đầu tay \"Camila\" ra mắt.\r\nNăm 2019, ca khúc kết hợp cùng Shawn Mendes \"Señorita\" tiếp tục trở thành hit toàn cầu. Cũng trong năm, cô ra mắt album thứ hai \"Romance\".', 51861, '../img_artist/Camila_Cabello.jpg', NULL),
(11, 'Dimitri Vegas & Like Mike', '2023-08-23 11:06:49', 'Hy Lạp - Bỉ', 'Hiện bộ đôi Dimitri Vegas & Like Mike đang giữ vị trí thứ 2 trong danh sách Top 100 DJs Mag.  Những màn trình diễn của họ luôn đốt cháy khán giả tại các sự kiện âm nhạc nổi tiếng trên toàn cầu như Tomorrowland, Ultra Music Festival cũng như world tour “Bringing The World The Madness” và sắp tới đây là tại Việt Nam.  Các ca khúc “Mammoth”, “Tremor” của bộ đôi đều đã quá quen thuộc với mọi người từ Đông sang Tây và chắc bạn cũng đã từng “nghiện” nó.', 3262, '../img_artist/Dimitri_Vegas_Like Mike.jpg', NULL),
(12, 'Martin Garrix', '2023-08-23 11:06:49', 'Hà Lan', 'Martijn Garritsen (sinh 14 tháng 5 năm 1996), thường được biết đến với nghệ danh là Martin Garrix, là một DJ, nhà soạn nhạc, nhạc sĩ và nhà sản xuất người Hà Lan. Anh được biết đến với các ca khúc \"Animals\", một trong 10 bài Top 10 hit tại hơn 10 quốc gia; bài hát cũng đã đạt vị trí số 1 tại Bỉ và Vương quốc Anh, và số 3 ở Ireland. Đĩa đơn \"Wizard\", được sản xuất với Jay Hardway cũng đã thành công ở nhiều quốc gia trong năm 2014. Ra mắt ở vị trí thứ 40 của tạp chí DJ \'s.Trong Top 100 DJ\'s, anh hiện đang đứng thứ 3.  Năm 2004, anh muốn trở thành một DJ sau khi nhìn thấy Tiësto biểu diễn tại Thế vận hội Athens. Anh bắt đầu tải phần mềm cho DJ chuyên nghiệp FL Studio và từ đó cho phép anh bắt đầu sáng tác. Garritsen gần đây đã tốt nghiệp ở trường Herman Brood Academy, một trường sản xuất ở Utrecht. Martin Garrix sử dụng nhiều bí danh, GRX là một trong số đó. Anh cũng viết bài hát cho các nghệ sĩ khác, bất chấp điều này, chỉ có một trong năm mươi bài hát của mình đã làm được ra mắt cho công chúng.  Garritsen đã có sự khởi đầu của mình với bài hát \"BFAM\", một đồng phát hành với Julian Jordan. Năm 2012, anh đoạt giải thưởng SLAM!FM DJ Talent của năm. Cũng trong năm 2012, bài remix \"Your Body\" của anh đã được Christina Aguilera phát hành trong phiên bản deluxe album Lotus của cô. Bài hát được viết bởi Max Martin, Shellback và Savan Kotecha. Track nhạc \"Just some Loops\", một sự hợp tác với TV Noise xuất hiện trên album Loop Masters Essential, Volume 2. Anh gia nhập hãng đĩa Spinnin\' Records vào năm 2012, phát hành \" Error 404\" thông qua hãng đĩa.  Trong năm 2013, Garrix đồng phát hành \"Torrent\" với Sidney Samson trên hãng đĩa Freedom Musical Tiësto. Danh tiếng của Garrix được nổi lên đáng kể thông qua ca khúc solo riêng của mình \"Animals\" phát hành vào ngày 16 tháng 6 2013 trên hãng thu âm Hà Lan ghi Spinnin\' Records, trở thành một hit trong một số lượng lớn các bảng xếp hạng ở châu Âu, và nhanh chóng trở thành người trẻ tuổi nhất từng đạt vị trí số 1 trên Beatport. Các ca khúc của anh cũng xuất hiện trên album của Hardwell - \'\'Hardwell \'s presents \'Revealed Volume 4\'\'. Ngày 30 tháng 9 năm 2013, Garrix phát hành một bản remix của Project by T Sander Van Doorn, Dimitri Vegas & Like Mike và nhanh chóng đạt vị trí số 1 trên bảng xếp hạng Beatport. Garrix xuất hiện trên DJMag của top 100 DJ danh sách năm 2013 lần đầu với vị trí 40. Trong năm 2014, Garrix xuất hiện trên danh sách top 100 của DJMag tại vị trí số số 4. Trong tháng mười năm 2013, Garrix đã ký một thỏa thuận với Scooter Braun Project của Scooter Braun (sau đó là hãng School Boy Records). Vào tháng 2013 anh phát hành \"Wizard\" với Jay Hardway, ca khúc này đã đạt vị trí số 6 để ở Bỉ và số 17 ở Hà Lan. Martin Garrix hợp tác với Firebeatz và ra ca khúc \"Helicopter\", đạt số 1 trên bảng xếp hạng Top 100 Beatport trong 2 tuần. Sau đó, anh đã biểu diễn tại Ultra Music Festival 2014, nơi anh đã ra mắt một số bài nhạc mới và chưa được phát hành, bao gồm cả hợp tác với Dillon Francis, Hardwell và Afrojack. Trong năm 2014, anh cũng phát hành \"Proxy\" với sự giúp đỡ từ Hardwell, cho phép tải về miễn phí trên SoundCloud cho người hâm mộ của mình như là một món quà cho một năm 2013 tuyệt vời. Trong năm 2014, Garrix ra mắt một bài hát cùng MoTi với tiêu đề \"Virus (How About Now)\" mà sau này trong năm cũng như sự hợp tác của anh với Afrojack ra mắt phim \"Turn Up The Speakers\" mà Afrojack và Garrix đều trình diễn lần đầu tại Ultra Music Festival.  Ngày 06 tháng hai năm 2015, Garrix phát hành ca khúc \"Forbidden Voices\" như một món quà cho người hâm mộ vì 10 triệu lượt thích trên trang Facebook của mình. Ngày 17 tháng ba năm 2015, Garrix ra mắt đĩa đơn \"Don\'t Look Down\" với sự góp giọng của Usher. Ca khúc được viết bởi Garrix,James \'JHart\' Abrahart và Busbee. Ngày 4 tháng 5 năm 2015, Garrix phát hành một ca khúc với Tiësto, được gọi là \"The Only Way Is Up\". Ngày 22 tháng năm năm 2015, Avicii phát hành một video lyric của bài hát \"Waiting for Love\" được đồng sản xuất bởi Garrix. Ngày 6 tháng 7 năm 2015, Garrix phát hành một vở kịch dài với Matisse & Sadko gọi là \" Break Through The Silence\". Vào ngày 19 tháng 10 năm 2015, Garrix được tạp chí DJ Mag bình chọn đứng ở vị trí thứ 3, vượt lên một hạng so với năm 2014.  Ngày 26 tháng 8 2015, Garrix ra một thông báo trên phương tiện truyền thông xã hội liên quan đến tin đồn anh đã chấm dứt thỏa thuận của mình với hãng đĩa Spinnin\' Records và công ty quản lý MusicAllStars Management, trong đó anh khẳng định mình không còn làm việc với hai công ty. Nguyên nhân được trích dẫn do một \"... sự khác biệt về quan điểm giữa chúng tôi về tính hợp lý của các hiệp định.\" về quyền bản quyền âm nhạc của Garrix. Có bài báo viết rằng \"Từ đầu năm nay, tôi đã cố gắng để lấy lại quyền sở hữu của âm nhạc của tôi từ Spinnin\' Records và giữ niềm tin của tôi trong MAS. Tôi vô cùng thất vọng rằng các cuộc thảo luận đã không dẫn đến một sự thay đổi trong các hiệp định hoặc trả lại quyền sở hữu, và đó là lý do tại sao tôi rời bỏ công ty của họ. \"', 145376, '../img_artist/Martin_Garrix.jpg', NULL),
(13, 'Alan Walker', '2023-08-23 11:06:49', 'Vương Quốc Anh', 'Năm 2012, Alan Walker bắt đầu học cách làm nhạc từ DJ người Ý David Whistle, sau đó đăng nhạc lên mạng xã hội, lấy nghệ danh DJ Walkzz. Năm 2014, anh quyết định sử dụng tên thật là Alan Walker, phát hành ca khúc \"Fade\", sau đó được nâng cấp thành \"Faded\" ra mắt năm 2015. Ca khúc nhanh chóng đứng đầu các bảng xếp hạng trên thế giới, mang lại cho anh nhiều giải thưởng âm nhạc. Năm 2016, anh tổ chức tour diễn đầu tiên \"Walker Tour\". Các đĩa đơn tiếp theo lần lượt ra mắt là \"Sing Me To Sleep\", \"Alone\", \"The Spectre\", \"All Falls Down\"... đều được đón nhận nồng nhiệt. Tháng 12 năm 2018, anh ra mắt album đầu tay \"Different World\", sau đó là các đĩa đơn \"Alone, Pt. II\", \"End Of Time\"...', 1183579, '../img_artist/alan_walker.jpg', NULL),
(14, 'Avicii', '2023-08-23 11:06:49', 'Thụy Điển', 'Avicii, (sinh ngày 08 tháng 9 năm 1989) còn được gọi là Tim Berg, là một reviews DJ, và sản xuất đĩa từ Thụy Điển. Đĩa đơn của ông nổi tiếng nhất bao gồm \"Bromance\" và \"My Feelings for You\".', 98656, '../img_artist/avici.jpg', NULL),
(15, 'Dương Ngọc Thái', '2023-08-23 11:06:49', 'Việt Nam', 'Dương Ngọc Thái tốt nghiệp khoa thanh nhạc trường Cao đẳng Văn Hóa Nghệ Thuật TPHCM năm 2001 và được chọn đi lưu diễn ở Nhật. Sau chuyến đi, anh có mặt trong album nhạc quê hương chọn lọc \"Đất Khách Quê Người\" của hãng đĩa Vafaco, cùng với hai tên tuổi lúc đó là Hương Lan và Vân Khánh. Năm 2003, anh phát hành album \"Hương Sắc Miền Nam\" và đến năm 2005 thì có album song ca với Hương Lan \"Nợ Em Một Khúc Dân Ca\" chiếm được tình cảm của công chúng yêu thích dòng nhạc trữ tình dân ca. Từ đó, Dương Ngọc Thái liên tục ra mắt nhiều album, ghi dấu ấn với người hâm mộ qua các ca khúc như \"Gọi Đò\", \"Hờn Trách Con Đò\", \"Đường Tình Đôi Ngả\"… và một chuỗi liveshow mang tên “Một Thoáng Quê Hương” trong sự nghiệp của mình.', 154102, '../img_artist/', NULL),
(16, 'Quỳnh Trang', '2023-08-23 11:06:49', 'Việt Nam', 'Từ bé, Quỳnh Trang đã mơ ước sau này sẽ trở thành ca sĩ, diễn viên. Từ lúc 5 - 6 tuổi, cô đã cầm micro hát các bài mang âm hưởng dân ca và Bolero. Quỳnh Trang theo học tại ĐH Sân Khấu Điện Ảnh TP.HCM. Cô quay MV đầu tay \"Tình Mẹ\" (Ngọc Sơn) theo nguyện vọng của bà ngoại nhưng không ngờ lại được cộng đồng mạng đón nhận nhiệt tình. Năm 2016, cô được ca sĩ Phi Nhung nhận làm học trò. Từ đó cô càng trưởng thành và chuyên nghiệp hơn trong âm nhạc. Ngoài thể hiện thành công các ca khúc theo phong cách truyền thống, Quỳnh Trang còn đưa làn gió mới vào bolero với MV liên khúc \"Gục Ngã Vì Yêu\" kết hợp 30 ca khúc bolero quen thuộc.', 165581, '../img_artist/', NULL),
(17, 'Võ Hạ Trâm', '2023-08-23 11:06:49', 'Việt Nam', 'Võ Hạ Trâm là ca sĩ không chỉ được khán giả yêu thích mà còn được giới chuyên môn đánh giá cao. Việt Nam. Cô chọn cho mình dòng nhạc chính thống và đi lên bằng chính thực lực của mình. Hạ Trâm đang dần dần xây dựng hình ảnh một ca sĩ dịu dàng, thân thiện, cởi mở và dễ gần trong lòng khán giả. Cô bắt đầu được công chúng biết tới khi giành giải nhất của cuộc thi Ngôi sao Tiếng hát truyền hình TP. Hồ Chí Minh năm 2007, qua màn biểu diễn ca khúc \"Quê tôi\" của nhạc sĩ Trần Tiến. Trước đó, cô giành các giải tưởng khác như: giải nhất Tiếng hát măng non vào năm 2003, giải nhất cuộc thi Tuổi đời mênh mông năm 2005 và giải nhất cuộc thi Tiếng hát chú ve con năm 2006', 21690, '../img_artist/', NULL),
(18, 'Ngọc Sơn', '2023-08-23 11:06:49', 'Việt Nam', 'Ca sỹ Ngọc Sơn quê quán Quảng Nam, sinh tại Đồ Sơn, Hải Phòng nhưng lớn lên ở Bạc Liêu.  Năm 1988, Ngọc Sơn bắt đầu sự nghiệp ca hát ở sân khấu Sao đêm Nhà văn hóa quận 10, Tp. HCM. Cho tới nay, đã hơn 20 năm, cái tên Ngọc Sơn đã để lại nhiều cảm xúc trong lòng khán giả: yêu thương, chia sẻ cũng nhiều mà khó ưa, ghét bỏ cũng không ít. Nhưng với Sơn, trước sau vẫn như một \"Dốc hết tình này, ta trả nợ đời, dốc hết tình này ta trả nợ người….\"  Với thế mạnh là những ca khúc trữ tình nên Ngọc Sơn còn được khán giả đặt cho biệt danh là \"Ông hoàng nhạc sến\".  Cùng với Ngọc Hải và Ngọc Hà, ba anh em Ngọc sơn đã từng thực hiện nhiều chương trình ca nhạc trên khắp đất nước.  Với giọng nam cao, ấm, khỏe có âm vựng khá rộng; với một phong cách chuyên nghiệp và rất \"quái dị\" mỗi khi lên sân khấu, Ngọc Sơn không chỉ để lại cho khán giả trong nước và quốc tế ấn tượng với những ca khúc dân tộc đằm thắm, trữ tình mà anh còn có sức cuốn hút bởi nhiều thể loại âm nhạc khác nhau như Pop, Rap, Rock....  \"Sinh ra trong một gia đình nhà giáo nghèo, từ thuở còn là cậu sinh viên năm thứ nhứt đại học Thanh Nhạc và đại học Ngoại Ngữ, để trở nên nổi tiếng và thành công là nhờ cha mẹ, sự phấn đấu không ngừng của bản thân,... Một điều quan trọng khiến cho Sơn phải luôn lao động để có ngày hôm nay, đó là tình thương của khán giả và những người thân yêu,\" - đó là lời hồi âm của Ngọc Sơn dành cho một khán giả ái mộ anh.  Thành công đến với anh khá sớm. Năm 19 tuổi, anh đoạt giải Ca sĩ xuất sắc nhất Liên hoan tiếng hát toàn quốc. Đến nay dù không còn ở thời kỳ đỉnh cao nhưng lịch diễn của Sơn vẫn đều đặn với giá cát xê trung bình hằng đêm ở mức vài chục triệu. Nhưng thành công của Sơn không chỉ nhờ giọng ca thiên phú mà còn ở khả năng sáng tác. Trong đó, nổi bật là những bài hát Sơn viết về cha mẹ. Có những bà mẹ khi nghe Sơn hát đã ôm anh và khóc.  Trong quãng thời gian khó khăn, Sơn tranh thủ từng phút để luyện thêm võ, thể hình, cặm cụi học ngoại ngữ, tìm hiểu thêm về văn hóa và âm nhạc. Anh đã từng dạy tiếng Nhật và cả Tiếng Anh. Ngọc Sơn là giảng viên của trung tâm ngoại ngữ Web London, nói tiếng Anh tự nhiên và chuẩn.  Ngọc Sơn cũng là 1 trong những nghệ sĩ đi đầu trong công tác nhân đạo, anh đã ủng hộ cho nhiều quỹ từ thiện lên tới hàng tỷ đồng, không những thế, anh còn kỳ tên hiến xác sau khi qua đời để phục vụ cho y học.  Song song với những thành công mà Ngọc Sơn đạt được thì bên cạnh đó là những scandal \"không giống ai\". Những scandal luôn làm tốn rất nhiều giấy mực của báo giới, và dường như đó là cuộc sống, là phong cách riêng của Ngọc Sơn, người khác không thể làm được nhưng Ngọc Sơn thì có thể.  Hơn 40 tuổi, Sơn đã có quá nhiều thành công, tiền bạc và cả những vụ scandal. Sơn luôn nhìn nhận lại mình, không cay cú hơn thua, không thù ghét. Anh dẹp bỏ chuyện vệ sĩ lúc nào cũng kè kè sát bên, dù sau những buổi biểu diễn, có lúc bị xô đẩy đến bầm dập. Phải chấp nhận vì đó là tình cảm mến mộ mà khán giả dành cho. Và bởi vì Sơn chỉ muốn làm một ngọn cỏ tìm bạn, không muốn vươn lên trời tìm sự cô đơn...  Ngọc Sơn đã phát hành gần trăm dĩa CD ca nhạc, album cá nhân, hoặc những tuyển tập trong 30 bài nhạc bằng tiếng mẹ đẻ hay ngoại quốc do chính anh sáng tác, album mới đây nhất của Ngọc Sơn vừa được phát hành đầu tháng 11/2009 có tên \"Tình Là Sợi Tơ\".  Ngày 06 tháng 09 năm 2014, Ngọc Sơn tổ chức Buổi trình diễn \"Dấu Ấn 13\", được đông đảo người hâm mộ ủng hộ và được tường thuật trực tiếp trên sóng kênh VTV9 đài truyền hình Việt Nam.', 131232, '../img_artist/', NULL),
(19, 'Lux', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(20, 'Quân A.P', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(21, 'Tino', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(22, 'Tăng Phúc', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(23, 'JanK', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(24, 'Hương Ly', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(25, 'Đạt G', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(26, 'DuUyen', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(27, 'SOOBIN', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(28, 'Rhymastic', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(29, 'KSHMR', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(30, 'MCK', '2023-08-23 11:06:49', '', '', 0, '../img_artist/', NULL),
(31, 'Wowy', '2023-08-23 11:24:54', '', '', 0, '', NULL),
(32, 'Karik', '2023-08-23 11:24:54', '', '', 0, '', NULL),
(33, 'HUSTLANG Robber', '2023-08-23 11:25:19', '', '', 0, '', NULL),
(34, 'Jombie', '2023-08-23 11:25:19', '', '', 0, '', NULL),
(35, 'Tkan', '2023-08-23 11:25:41', '', '', 0, '', NULL),
(36, 'Andree Right Hand', '2023-08-23 11:25:41', '', '', 0, '', NULL),
(37, 'Wxrdie', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(38, 'Bình Gold', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(39, '2Pillz', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(40, 'Trần Huyền Diệp', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(41, 'Bray', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(42, 'Masew', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(43, 'Jack - J97', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(44, 'Dế Choắt', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(45, 'Young H', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(46, 'Sofia', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(47, 'Châu Đăng Khoa', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(48, 'Huỳnh Tú', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(49, 'Khói', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(50, 'Phát Huy T4', '2023-08-23 11:26:29', '', '', 0, '', NULL),
(51, 'Thanh Hưng', '2023-08-23 11:33:16', '', '', 0, '', NULL),
(52, 'Phan Mạnh Quỳnh', '2023-08-23 11:33:46', '', '', 0, '', NULL),
(53, 'The Men', '2023-08-23 11:34:30', '', '', 0, '', NULL),
(54, 'Tống Gia Vỹ', '2023-08-23 11:34:30', '', '', 0, '', NULL),
(55, 'Thùy Chi', '2023-08-23 11:34:39', '', '', 0, '', NULL),
(56, 'Khải Đăng', '2023-08-23 11:34:39', '', '', 0, '', NULL),
(57, 'Alec Benjamin', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(58, 'Wiz Khalifa', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(59, 'Charlie Puth', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(60, 'Lost Frequencies', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(61, 'Olly Murs', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(62, 'ABBA', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(63, 'Bằng Kiều', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(64, 'Triệu Hồng Ngọc', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(65, 'Tam Ka PKL', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(66, 'OSAD', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(67, 'Da LAB', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(68, 'Nal', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(69, 'W/N', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(70, 'Phúc Du', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(71, 'Bích Phương', '2023-08-23 11:37:37', '', '', 0, '', NULL),
(72, 'Phương Anh Đào', '2023-08-24 09:15:42', 'Việt Nam', '', 0, '', NULL);

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
(213, 1, 17),
(214, 1, 15);

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
(1, 'admin', 'Lối nhỏ', 'Đen, Phương Anh Đào', '../uploads/.64423beb12bb24.93537526lối nhỏ.jpg', '../musics/.64423beb12dbb2.81320385lối nhỏ.mp3', '2023-08-21', '04:57', 18, 'Việt Nam', 'Rap'),
(2, 'admin', 'Bài Này Chill Phết', 'Đen, MIN', '../uploads/.64423c6e994aa8.73818333bài hát này chill phết.jpg', '../musics/.64423c6e9966e1.55925589bài hát này chill phết.mp3', '2023-08-21', '04:33', 73, 'Việt Nam', 'Rap'),
(3, 'admin', 'Send It', 'Austin Mahone, Rich Homie Quan', '../uploads/.64423d257bb549.23110583send it.jpg', '../musics/.64423d257bdbf3.65244392send it.mp3', '2017-02-06', '03:00', 545, 'America', 'Acoustic'),
(4, 'admin', 'Despacito', 'Luis Fonsi, Daddy Yankee', '../uploads/.64423dcf650bc8.96381254despacito.jpeg', '../musics/.64423dcf652427.94579752Despacito.mp3', '2020-12-27', '04:43', 68, 'Tây Ban Nha', 'Nhạc Latin'),
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
(25, 'admin', 'Khó Vẽ Nụ Cười', 'ĐạtG, Du Uyên, T-Bin', '../uploads/.644408a74cf975.87213306kho ve nu cuoi.jpg', '../musics/.644408a74d15b9.93442054kho ve nu cuoi.mp3', '2020-12-27', '04:20', 0, 'Việt Nam', 'Acoustic'),
(26, 'admin', 'PHÍA SAU MỘT CÔ GÁI', 'Soobin Hoàng Sơn', '../uploads/.644409f3b09705.66398196phia sau mot co gai.jpg', '../musics/.644409f3b0d576.55559796phia sau mot co gai.mp3', '2020-12-27', '04:32', 0, 'Việt Nam', 'Acoustic'),
(27, 'admin', 'YÊU 5', 'Rhymastic', '../uploads/.64440a56f1e966.75211311yeu 5.jpg', '../musics/.64440a56f20485.93089409y2meta.com - Lyrics __ YÊU 5 - Rhymastic (64 kbps).mp3', '2020-12-27', '04:10', 1, 'Việt Nam', 'Rap'),
(28, 'admin', 'One More Round', 'KSHMR, Jeremy Oceans ', '../uploads/.64440adb9224b7.33214561one more round.jpg', '../musics/.64440adb924373.42046168y2meta.com - One More Round - KSHMR, Jeremy Oceans (Lyrics + Vietsub) _ (Free Fire Booyah Day Theme Song) (64 kbps).mp3', '2020-12-27', '03:21', 1, 'America', 'EDM'),
(29, 'admin', 'Tình Đắng Như Ly Cà Phê', ' Ngơ (MCK rapViet), Nân', '../uploads/.64440b1d7d6143.10977431tinh dang nhu ly cafe.jpg', '../musics/.64440b1d7d7a76.74633626y2meta.com - Tình Đắng Như Ly Cà Phê - Ngơ (MCK rapViet) ft Nân - Lyric Video (64 kbps).mp3', '2020-12-27', '03:35', 0, 'Việt Nam', 'Rap'),
(30, 'admin', 'Endless Love ', 'Jackie Chan - Kim Hee Sun', '../uploads/.64440be337a8f1.67930068than thoai.jpg', '../musics/.64440be337da82.88352698y2meta.com - Thần Thoại –美丽的神话 Endless Love  成龙Jackie Chan  金喜善Kim Hee Sun   nghe nhạc học tiếng trung (64 kbps).mp3', '2020-12-27', '04:44', 1, 'Trung Quốc', 'OST'),
(31, 'admin', 'Ievan Polkka', 'Hatsune Miku', '../uploads/.64440c4cc372c2.31471218levan polka.jpg', '../musics/.64440c4cc38b43.69227859y2meta.com - Hatsune Miku - Ievan Polkka (64 kbps).mp3', '2020-12-27', '02:29', 4, 'Nhật Bản', 'Anime'),
(32, 'admin', 'Khu Tao Sống', 'Wowy, Karik', '../uploads/.64de501555fe26.26662298khutaosong.jpg', '../musics/.64de501555ff19.73406900y2meta.com - Khu Tao Song - Wowy Karik (OFFICIAL VIDEO HD) (64 kbps).mp3', '2023-08-17', '04:04', 1, 'Việt Nam', 'Rap'),
(33, 'admin', 'HIS STORY', 'HUSTLANG Robber', '../uploads/.64de517cbe8b30.32248746history.jpg', '../musics/.64de517cbe8c51.12271125y2meta.com - HUSTLANG Robber - HIS STORY (M_V) (64 kbps) (1).mp3', '2023-08-17', '03:52', 0, 'Việt Nam', 'Rap'),
(34, 'admin', 'Sầu Hồng Gai', 'JOMBIE x TKAN', '../uploads/.64de5288074301.99218181sauhonggai.jpg', '../musics/.64de52880743f8.36386978y2meta.com - SẦU HỒNG GAI _ JOMBIE x TKAN _ OFFICIAL MUSIC VIDEO LYRICS (64 kbps).mp3', '2023-08-17', '05:54', 0, 'Việt Nam', 'Rap'),
(35, 'admin', 'Em iu', 'Andree Right Hand feat. Wxrdie, Bình Gold, 2pillz', '../uploads/.64de52e01ba6b1.68949234emiu.jpg', '../musics/.64de52e01ba9d5.68035066y2meta.com - Andree Right Hand - Em iu feat. Wxrdie, Bình Gold, 2pillz _ Official MV (64 kbps).mp3', '2023-08-17', '03:15', 0, 'Việt Nam', 'Rap'),
(36, 'admin', 'Hai Thế Giới', 'Wowy, Karik', '../uploads/.64de533092a6f6.65241435mqdefault.jpg', '../musics/.64de533092a7f9.81396333y2meta.com - Hai Thế Giới full - Wowy & Karik ( Official Video HD full ) (128 kbps).mp3', '2023-08-17', '04:42', 0, 'Việt Nam', 'Rap'),
(37, 'admin', 'Bạn Của Tao', 'YoungH x Binz x SO x Pjpo', '../uploads/.64de54503ea2b9.01181375mqdefault (1).jpg', '../musics/.64de54503ea357.80237008y2meta.com - BẠN CỦA TAO - YoungH x Binz x SO x Pjpo _ 2015 _ Video Lyrics (128 kbps).mp3', '2023-08-17', '05:08', 0, 'Việt Nam', 'Rap'),
(38, 'admin', 'Em Là Bad Girl Trong Bộ Váy Ngắn', 'VP NIZ X Trần Huyền Diệp', '../uploads/.64de547ea307f7.69895379mqdefault (2).jpg', '../musics/.64de547ea30881.70928199y2meta.com - Em Là Bad Girl Trong Bộ Váy Ngắn (Short Skirt) - VP NIZ X Trần Huyền Diệp (Prod. CM1X) (128 kbps).mp3', '2023-08-17', '04:07', 0, 'Việt Nam', 'Rap'),
(39, 'admin', 'Chơi Như Tụi Mỹ', 'Andree Right Hand ', '../uploads/.64de54d356f405.33159427mqdefault (3).jpg', '../musics/.64de54d356f4b7.69292179y2meta.com - Andree Right Hand - Chơi Như Tụi Mỹ _ Official MV (128 kbps).mp3', '2023-08-17', '03:13', 0, 'Việt Nam', 'Rap'),
(40, 'admin', 'Lửng Lơ', 'MASEW, BRAY, RedT x Ý Tiên', '../uploads/.64de551ed969f2.92224797mqdefault (4).jpg', '../musics/.64de551ed96b11.22135300y2meta.com - Lửng Lơ _ MASEW x BRAY ft. RedT x Ý Tiên _ MV OFFICIAL (128 kbps).mp3', '2023-08-17', '05:07', 0, 'Việt Nam', ''),
(41, 'admin', 'SÓNG GIÓ', 'K-ICM, JACK', '../uploads/.64de558f230358.58406565mqdefault (5).jpg', '../musics/.64de558f2303f6.44192585y2meta.com - SÓNG GIÓ _ K-ICM x JACK _ OFFICIAL MUSIC VIDEO (128 kbps).mp3', '2023-08-17', '05:50', 0, 'Việt Nam', 'Acoustic'),
(42, 'admin', 'Mẹ Ơi 2', 'JACK (G5R)', '../uploads/.64de55ea840364.97581910mqdefault (6).jpg', '../musics/.64de55ea840495.58674335y2meta.com - [MV] MẸ ƠI 2 -  JACK (G5R) (128 kbps).mp3', '2023-08-17', '05:15', 0, 'Việt Nam', 'Rap'),
(43, 'admin', 'Westside SQUAD', 'Jombie, Dế Choắt & Endless', '../uploads/.64de56271f31d7.12559628mqdefault (7).jpg', '../musics/.64de56271f3278.73553566y2meta.com - [OFFICIAL MV] Westside SQUAD - jombie ft Dế Choắt & Endless (128 kbps).mp3', '2023-08-17', '03:04', 0, 'Việt Nam', 'Rap'),
(44, 'admin', 'B.S.N.L 2', 'B-RAY, YOUNG-H', '../uploads/.64de56565f99d1.37539778mqdefault (8).jpg', '../musics/.64de56565f9a98.33260066y2meta.com - B.S.N.L 2 - B-RAY ft. YOUNG-H (128 kbps).mp3', '2023-08-17', '04:37', 0, 'Việt Nam', 'Rap'),
(45, 'admin', 'Buồn Của Anh', 'K-ICM, Đạt G, Masew', '../uploads/.64de569de87f88.13776414mqdefault (9).jpg', '../musics/.64de569de88044.36392560y2meta.com - Buồn Của Anh _ K-ICM x Đạt G x Masew (128 kbps).mp3', '2023-08-17', '04:39', 0, 'Việt Nam', 'Rap'),
(46, 'admin', 'THIÊU THÂN', 'B RAY, SOFIA, CHÂU ĐĂNG KHOA', '../uploads/.64de56fabc22e3.71208723mqdefault (10).jpg', '../musics/.64de56fabc2432.61594087y2meta.com - B RAY x SOFIA & CHÂU ĐĂNG KHOA _ THIÊU THÂN _ OFFICIAL MV (128 kbps).mp3', '2023-08-17', '04:01', 0, 'Việt Nam', 'Rap'),
(47, 'admin', 'Thằng Bé Cầm Quyền', 'Cover - KTS XUAN HUY ( Sáng tác Xavi Pham)', '../uploads/.64de573d37d846.76132310mqdefault (11).jpg', '../musics/.64de573d37d904.12976530y2meta.com - THANG BE CAM QUYEN Cover - KTS XUAN HUY ( Sáng tác Xavi Pham) (128 kbps).mp3', '2023-08-17', '04:58', 0, 'Việt Nam', 'Rap'),
(48, 'admin', 'Đường Một Chiều', 'Huỳnh Tú, Magazine', '../uploads/.64de576fb8a7e4.60388517mqdefault (12).jpg', '../musics/.64de576fb8a8d9.83948221y2meta.com - Đường Một Chiều - Huỳnh Tú ft. Magazine __ Official Music Video (128 kbps).mp3', '2023-08-17', '04:49', 0, 'Việt Nam', 'Acoustic'),
(49, 'admin', 'Tháng 7 của anh, em và cô đơn', 'Khói', '../uploads/.64de579c881bc1.55540846mqdefault (13).jpg', '../musics/.64de579c881c90.10413718y2meta.com - Khói - Tháng 7 của anh, em và cô đơn (Lyric Video) _ tas release (128 kbps).mp3', '2023-08-17', '05:02', 0, 'Việt Nam', 'Rap'),
(50, 'admin', 'CHẮC GÌ ANH YÊU CÔ ẤY', 'HƯƠNG LY', '../uploads/.64de581009f458.31609624mqdefault (14).jpg', '../musics/.64de581009f523.46475300y2meta.com - CHẮC GÌ ANH YÊU CÔ ẤY - HƯƠNG LY _ OFFICIAL MUSIC VIDEO (128 kbps).mp3', '2023-08-17', '05:01', 0, 'Việt Nam', 'Acoustic'),
(51, 'admin', 'Em Là Kẻ Đáng Thương', 'PHÁT HUY T4', '../uploads/.64de583b39a6a9.42779469mqdefault (15).jpg', '../musics/.64de583b39a736.39264174y2meta.com - EM LÀ KẺ ĐÁNG THƯƠNG - PHÁT HUY T4 __ OFFICIAL MV (128 kbps).mp3', '2023-08-17', '04:21', 0, 'Việt Nam', 'Acoustic'),
(52, 'admin', 'Ngày Mai Em Đi Mất', 'Đạt G', '../uploads/.64de5870e22354.18421708mqdefault (16).jpg', '../musics/.64de5870e22429.56849149y2meta.com - Đạt G - Ngày Mai Em Đi Mất _ Live at #DearOcean @DatGMusic (128 kbps).mp3', '2023-08-17', '04:09', 0, 'Việt Nam', 'Acoustic'),
(53, 'admin', 'Buồn Không Em', 'Đạt G', '../uploads/.64de58ac313053.89509241mqdefault (17).jpg', '../musics/.64de58ac313194.98838123y2meta.com - Đạt G - Buồn Không Em _ Live at #DearOcean @DatGMusic (128 kbps).mp3', '2023-08-17', '05:51', 0, 'Việt Nam', 'Acoustic'),
(54, 'admin', 'từ chối nhẹ nhàng thôi ', 'PHÚC DU, @BICHPHUONGOFFICIAL', '../uploads/.64de58d30ffec5.06299802mqdefault (18).jpg', '../musics/.64de58d30fffb4.64947898y2meta.com - PHÚC DU feat. @BICHPHUONGOFFICIAL - từ chối nhẹ nhàng thôi (Official M_V) (128 kbps).mp3', '2023-08-17', '04:09', 0, 'Việt Nam', 'Rap'),
(55, 'admin', ' ‘3107’ full album', 'W/n, ( 267, Nâu ,Dươngg )', '../uploads/.64de5928e3e859.31943978mqdefault (19).jpg', '../musics/.64de5928e3e919.25728262y2meta.com - W_n - ‘3107’ full album_ ft. ( 267, Nâu ,Dươngg ) (128 kbps).mp3', '2023-08-17', '12:17', 0, 'Việt Nam', 'Rap - Acoustic'),
(56, 'admin', 'id 072019', 'W/n - 3107, 267', '../uploads/.64de59700d6af3.94622686mqdefault (20).jpg', '../musics/.64de59700d6ba1.98870393y2meta.com - W_n - id 072019 _ 3107 ft 267 (128 kbps).mp3', '2023-08-17', '05:02', 0, 'Việt Nam', 'Rap'),
(57, 'admin', 'DANG DỞ', 'NAL', '../uploads/.64de59d18a82b4.91947342mqdefault (21).jpg', '../musics/.64de59d18a8358.27423298y2meta.com - DANG DỞ - NAL _ OFFICIAL MUSIC VIDEO (128 kbps).mp3', '2023-08-17', '05:34', 0, 'Việt Nam', 'Acoustic'),
(58, 'admin', 'Người Âm Phủ', 'OSAD, VRT', '../uploads/.64de5a03e49a50.63698639mqdefault (22).jpg', '../musics/.64de5a03e49af3.23574966y2meta.com - Người Âm Phủ - OSAD x VRT _ OFFICIAL VERSION (128 kbps).mp3', '2023-08-17', '02:08', 0, 'Việt Nam', 'Rap'),
(59, 'admin', 'Một Nhà', 'Một Nhà', '../uploads/.64de5a36695a71.10253385mqdefault (23).jpg', '../musics/.64de5a36695b25.10216944y2meta.com - Một Nhà - Da LAB _ Official Lyric Video (128 kbps).mp3', '2023-08-17', 'Da LAB', 0, 'Việt Nam', 'Rap'),
(60, 'admin', 'Bài Ka Tuổi Trẻ', 'TamKa PKL', '../uploads/.64de5a6e9ae8f6.14810235mqdefault (24).jpg', '../musics/.64de5a6e9ae9b9.93876131y2meta.com - Bài Ka Tuổi Trẻ - TamKa PKL _ Official Music Video (128 kbps).mp3', '2023-08-17', '05:35', 0, 'Việt Nam', 'Rap'),
(61, 'admin', 'Bởi Vì Anh Yêu Em', 'Bằng Kiều, Triệu Hồng Ngọc', '../uploads/.64de5a9f39beb4.07036267mqdefault (25).jpg', '../musics/.64de5a9f39bf36.04347974y2meta.com - Bởi Vì Anh Yêu Em - Bằng Kiều ft Triệu Hồng Ngọc (128 kbps).mp3', '2023-08-17', '04:10', 0, 'Việt Nam', 'Acoustic'),
(62, 'admin', 'I Need Your Love', 'Đăng Long Remix', '../uploads/.64de5b216a7de7.01341228mqdefault (26).jpg', '../musics/.64de5b216a7eb4.49704527y2meta.com - I Need Your Love (Đăng Long Remix) _ Bản Nhạc 8x Huyền Thoại Xu Hướng Tiktok (128 kbps).mp3', '2023-08-17', '04:39', 0, 'American', 'Vinahouse'),
(63, 'admin', 'Happy New Year', 'ABBA', '../uploads/.64de5b67b301b9.78335603mqdefault (27).jpg', '../musics/.64de5b67b30259.95402883y2meta.com - ABBA - Happy New Year (Video) (128 kbps).mp3', '2023-08-17', '04:28', 0, 'America', 'Acoustic'),
(64, 'admin', 'That Girl', 'Olly Murs', '../uploads/.64de5bc17b9c52.35955523mqdefault (28).jpg', '../musics/.64de5bc17b9d23.50153625y2meta.com - [Vietsub + Kara] That Girl - Olly Murs (lyrics) - Tik Tok (128 kbps).mp3', '2023-08-17', '02:55', 0, 'America', 'Acoustic'),
(65, 'admin', 'Reality', 'Lost Frequencies', '../uploads/.64de5bf141fcf0.61114191mqdefault (29).jpg', '../musics/.64de5bf141fd98.32492959y2meta.com - Reality  -  Lost  Frequencies  _   Lyrics + Vietsub. (128 kbps).mp3', '2023-08-17', '02:38', 0, 'America', 'Acoustic'),
(66, 'admin', 'See You Again', 'Wiz Khalifa, Charlie Puth', '../uploads/.64de5c2b1e7d29.10674745mqdefault (30).jpg', '../musics/.64de5c2b1e7da9.13711213y2meta.com - Wiz Khalifa - See You Again ft. Charlie Puth [Official Video] Furious 7 Soundtrack (128 kbps).mp3', '2023-08-17', '03:57', 0, 'America', 'Acoustic'),
(67, 'admin', 'Let Me Down Slowly', 'Alec Benjamin', '../uploads/.64df1236a66914.00569991mqdefault.jpg', '../musics/.64df1236a66a14.35793294y2meta.com - Alec Benjamin - Let Me Down Slowly [Official Music Video] (128 kbps).mp3', '2023-08-18', '02:57', 0, 'America', 'Acoustic'),
(68, 'admin', 'Khoan Thai (Lofi Lyrics)', 'Khải Đăng, H2O', '../uploads/.64df12b4e4e2d9.46878232mqdefault (1).jpg', '../musics/.64df12b4e4e3e5.46815975y2meta.com - Khoan Thai (Lofi Lyrics) - Khải Đăng x H2O _ Nơi nào cho con tim nguôi ngoai thôi chông gai (128 kbps).mp3', '2023-08-18', '03:38', 0, 'Việt Nam', 'Acoustic'),
(69, 'admin', 'Giữ Em Đi', 'Thuỳ Chi', '../uploads/.64df1312495966.43675845mqdefault (2).jpg', '../musics/.64df1312495a60.14008422y2meta.com - Giữ Em Đi _ Thuỳ Chi _ Official MV Lyric 4K (128 kbps).mp3', '2023-08-18', '04:44', 0, 'Việt Nam', 'Acoustic'),
(70, 'admin', 'CÓ TẤT CẢ NHƯNG THIẾU ANH - ERIK', 'HƯƠNG LY COVER', '../uploads/.64df13b4abf839.30292563mqdefault (3).jpg', '../musics/.64df13b4abf929.87113000y2meta.com - CÓ TẤT CẢ NHƯNG THIẾU ANH - ERIK _ HƯƠNG LY COVER (128 kbps).mp3', '2023-08-18', '04:44', 0, 'Việt Nam', 'Acoustic'),
(71, 'admin', 'Thấm Thía', 'Tống Gia Vỹ', '../uploads/.64df13ee247075.28700408mqdefault (4).jpg', '../musics/.64df13ee247101.53219760y2meta.com - Thấm Thía _ Tống Gia Vỹ (Official MV) (128 kbps).mp3', '2023-08-18', '06:24', 0, 'Việt Nam', 'Acoustic'),
(72, 'admin', 'Nếu Là Anh', 'The Men', '../uploads/.64df14be70c350.03111420mqdefault (5).jpg', '../musics/.64df14be70c488.18541578y2meta.com - The Men _ Nếu Là Anh _ Official MV (128 kbps).mp3', '2023-08-18', '06:55', 0, 'Việt Nam', 'Acoustic'),
(73, 'admin', 'Hãy Ra Khỏi Người Đó Đi', 'Phan Mạnh Quỳnh', '../uploads/.64df150d205557.98390708mqdefault (6).jpg', '../musics/.64df150d2055e7.80007530y2meta.com - Hãy Ra Khỏi Người Đó Đi - Phan Mạnh Quỳnh (Official MV) (128 kbps).mp3', '2023-08-18', '06:13', 0, 'Việt Nam', 'Acoustic'),
(74, 'admin', 'Hôm Nay Em Cưới Rồi - Khải Đăng', 'Thanh Hưng', '../uploads/.64df1742570680.35789693mqdefault (7).jpg', '../musics/.64df1742570752.54223245y2meta.com - Hôm Nay Em Cưới Rồi - Khải Đăng _ Thanh Hưng _ Live Version (128 kbps).mp3', '2023-08-18', '05:03', 0, 'Việt Nam', 'Acoustic');

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
(16, 'user', 'Luu Truong', 'anluu099@gmail.com', '28dc0aa516c137cdcc709cb1e7cd02aa', '2000-01-20', 'female', ''),
(17, 'user', 'Luu Truong An', '3120410018@gmail.com', 'e4c28e2a32bacaa140533f3507c4fe07', '2002-04-24', 'male', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `albums`
--
ALTER TABLE `albums`
  ADD KEY `ar_id` (`ar_id`),
  ADD KEY `m_id` (`m_id`);

--
-- Chỉ mục cho bảng `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`ar_id`),
  ADD KEY `album_id` (`album_id`);

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
-- AUTO_INCREMENT cho bảng `artist`
--
ALTER TABLE `artist`
  MODIFY `ar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `library`
--
ALTER TABLE `library`
  MODIFY `lb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT cho bảng `musics`
--
ALTER TABLE `musics`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT cho bảng `playlist`
--
ALTER TABLE `playlist`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `playlist_item`
--
ALTER TABLE `playlist_item`
  MODIFY `pl_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT cho bảng `uploads`
--
ALTER TABLE `uploads`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`ar_id`) REFERENCES `artist` (`ar_id`),
  ADD CONSTRAINT `albums_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `musics` (`m_id`);

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
