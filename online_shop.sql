-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2016 at 02:39 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `online_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `number_of_items_in_category` int(6) unsigned NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `number_of_items_in_category`) VALUES
(4, 'Konzole', 4),
(5, 'Oprema za konzole', 8),
(8, 'Igrice', 8),
(10, 'TV', 2);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `text` text NOT NULL,
  `create_date` int(10) unsigned NOT NULL,
  `replied` tinyint(1) NOT NULL DEFAULT '0',
  `replied_date` int(11) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contact_id`, `name`, `email`, `text`, `create_date`, `replied`, `replied_date`) VALUES
(1, 'Marko Markovic', 'test@gmail.com', 'Odlična ponuda proizvoda', 1404651623, 1, 1455987556);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(20) NOT NULL,
  `number_of_users_in_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `group`, `number_of_users_in_group`) VALUES
(1, 'admin', 1),
(2, 'member', 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `description` mediumtext NOT NULL,
  `price` float(8,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `number_of_items` int(6) NOT NULL DEFAULT '0',
  `fk_category_id` tinyint(3) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `title`, `description`, `price`, `image`, `active`, `create_date`, `number_of_items`, `fk_category_id`) VALUES
(25, 'Microsoft XBOX One 500GB + Kinect + Diablo 3 UEE', 'Tip: Xbox One\r\nProcesor: 8 Core AMD custom CPU Frequency: 1.75 GHz\r\nRadna memorija: 8GB DDR3 Clock: 2133MHz Bandwidth: 68.26 GB/s + 32MB eSRAM Bandwi...\r\nKapacitet interne memorije: 500GB\r\nMreža: Gigabit Ethernet, WiFi (A/B/G/N dual-band at 2.4ghz and 5ghz) includes WiFi D...', 88322.00, 'xbox_diablo_3.jpg', 1, '2015-04-22 10:50:37', 9, 4),
(26, 'Sony PlayStation 4, 500GB igre DriveClub/LittleBigPlanet/The Last of US', 'Tip: PS4\r\nProcesor: x86-64 AMD “Jaguar”, 8 jezgara, MediaCon (pomoćni procesor za zadatke u pozad...\r\nRadna memorija: 8GB GDDR5\r\nKapacitet interne memorije: 500GB\r\nMreža: 802.11 b/g/n, Bluetooth 2.1', 73568.00, 'konzola-sony-playstation-4-500gb-igre-driveclub-littlebigplanet-the-5420318.jpg', 1, '2015-04-22 11:01:49', 4, 4),
(27, 'Sony PlayStation 4, 500GB + igra GTA V', 'Tip: PS4\r\nProcesor: x86-64 AMD “Jaguar”, 8 jezgara, MediaCon (pomoćni procesor za zadatke u pozad...\r\nRadna memorija: 8GB GDDR5\r\nKapacitet interne memorije: 500GB\r\nMreža: LAN 10/100/1000 base-T, Wi-Fi 802.11 b/g/n, Bluetooth 2.1', 61300.00, 'gta-v-ps4-bundle-black.jpg', 1, '2015-04-22 11:03:00', 8, 4),
(28, 'Kontroler Move Motion Navigation za Sony PS3', 'Tip: PlayStation3\r\nPovezivanje: Wireless, USB\r\nBroj joypad-a: 1', 1563.00, 'n2.jpg', 1, '2015-04-22 11:05:21', 10, 5),
(29, 'Memory card Sony PS Vita 4GB Reta', 'Tip: Memorijska kartica 4GB za Sony PlayStation Vita konzole\r\n', 2314.00, 'memcard.jpg', 1, '2015-04-22 11:06:41', 30, 5),
(37, 'Kontroler Sony DualShock 3 Sixaxis', '<p>Tip: PlayStation3 Broj joypad-a: 1</p>', 8555.00, 'PlayStation3-Sixaxis.png', 1, '2015-04-22 11:10:29', 3, 5),
(38, 'Kontroler Sony Playstation 4 DualShock Crni', 'Tip: Playstation 4 Dual Shock kontroler\r\nPovezivanje: Bluetooth 2.1 + EDR, USB (Micro B), Extension Port, priključak za slušalice', 9788.00, 'kontroler-sony-playstation-4-dualshock-crni-5114636.jpg', 1, '2015-04-22 11:22:43', 15, 5),
(39, 'Kontroler Sony Playstation 4 DualShock Plavi', 'Tip: Playstation 4 Dual Shock kontroler\r\nPovezivanje: Bluetooth 2.1 + EDR, USB (Micro B), Extension Port, priključak za slušalice', 9688.00, '4751696-1.jpg', 1, '2015-04-22 11:23:42', 4, 5),
(40, 'Sony PS4 Camera CUH-ZEY1', 'Tip: PS4 kamera', 9344.00, '80777_sony_CUH-ZEY1_4.png', 1, '2015-04-22 11:24:40', 7, 5),
(41, 'Kontroler Sony Playstation 4 DualShock Beli', 'Tip: Playstation 4 Dual Shock kontroler\r\nPovezivanje: Bluetooth 2.1 + EDR, USB (Micro B), Extension Port, priključak za slušalice', 8590.00, '4751697-1.jpg', 1, '2015-04-22 11:25:35', 6, 5),
(42, 'Kontroler Sony Playstation 4 DualShock Magma Crveni', 'Tip: Playstation 4 Dual Shock kontroler\r\nPovezivanje: Bluetooth 2.1 + EDR, USB (Micro B), Extension Port, priključak za slušalice', 8590.00, 'kontroler-sony-playstation-4-dualshock-magma-crveni-5735444.jpg', 1, '2015-04-22 11:26:43', 6, 5),
(43, 'Konzola Sony PSP E1004 EUR, Crna + CARS 2', 'Tip: PlayStation Portable\r\nPovezivanje: USB 2.0\r\nPrateće pakovanje: Jedna poklon igrica CARS 2', 10110.00, 'jp0120a00000_3_650_2ae0eb6bfe44412fa58fc7594d4d20ed.jpg', 1, '2015-04-22 11:27:38', 5, 4),
(44, 'PS4 igra NBA Live 14', 'Vrsta: Igra za PS4, sportska simulacija', 9299.00, 'PS4 NBA Live 14.jpg', 1, '2015-04-22 11:33:12', 30, 8),
(45, 'PS3 Skylanders Trap Team Starter Pack', 'Napomena: Biće dostupna od 10.10.2014\r\nVrsta: Skylanders figure', 9299.00, 'PN1676.jpg', 1, '2015-04-22 11:34:07', 12, 8),
(46, 'PS4 Call of Duty Advanced Warfare', '', 9299.00, 'Call_Of_Duty__Advanced_Warfare_13991332836337.jpg', 1, '2015-04-22 11:35:30', 25, 8),
(47, 'PC Watch Dogs Vigilante Edition', '', 10990.00, 'watchdogs_vigilante.jpg', 1, '2015-04-22 11:39:47', 50, 8),
(48, 'XBOX360 Grand Theft Auto V Collectors Edition', '', 16880.00, 'gta_5_collectors_edition.jpg', 1, '2015-04-22 11:40:36', 13, 8),
(49, 'Televizor TV 80" 3D LED SMART SHARP LC-80UQ10E , Ultra HD, DVB-T2', 'Dijagonala: 80" (203cm)\r\nEkran: LED LCD\r\nRezolucija: 3840 x 2160 (Ultra HD)\r\nTip Tunera: DVB-T/C/T2/S2\r\nFrekvencija: 800 Hz', 939990.00, 'download.jpg', 1, '2015-04-22 11:48:12', 2, 10),
(50, 'Televizor TV 55" Smart 3D OLED LG 55EC930V,1920x1080(Full HD), WiFi', 'Dijagonala: 55" (139cm)\r\nEkran: OLED\r\nRezolucija: 1920x1080\r\nTip Tunera: Analogni TV prijem Da, Digitalni TV prijem (Zemaljski, kablovski, sateli...\r\n3D funkcija: 3D da, 3D Tip (SG/FPR/AR/GPR/Bez stakla) fpr, Podržani formati: S/S...', 359990.00, 'tv.jpg', 1, '2015-04-22 11:49:50', 10, 10),
(52, 'PC Commandos Complete Collection', '', 990.00, 'commandos.jpg', 1, '2015-04-24 08:44:32', 6, 8),
(53, 'PS4 The Crew D1 Limited Edition', '', 7999.00, 'crew.jpg', 1, '2015-04-24 08:45:53', 10, 8),
(54, 'XBOXONE NBA 2K14', '', 7999.00, 'nba xbox.jpg', 1, '2015-04-24 08:46:32', 5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `items_to_purchases`
--

CREATE TABLE IF NOT EXISTS `items_to_purchases` (
  `item_to_purchase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_purchase_id` int(11) unsigned NOT NULL,
  `fk_item_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`item_to_purchase_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `items_to_purchases`
--

INSERT INTO `items_to_purchases` (`item_to_purchase_id`, `fk_purchase_id`, `fk_item_id`) VALUES
(22, 16, 27),
(23, 16, 38),
(24, 16, 38),
(25, 16, 29),
(26, 16, 28),
(27, 17, 44),
(28, 18, 26),
(29, 19, 25),
(30, 19, 28),
(31, 19, 28),
(32, 19, 28),
(33, 19, 28),
(34, 19, 28),
(35, 20, 44),
(36, 21, 25),
(37, 22, 25),
(38, 23, 28),
(39, 24, 50),
(40, 25, 49),
(41, 26, 49),
(42, 27, 25),
(43, 28, 26),
(44, 29, 27),
(45, 30, 25),
(46, 31, 25),
(47, 32, 25),
(48, 32, 27),
(49, 33, 25),
(50, 34, 43),
(51, 35, 27),
(52, 36, 26),
(53, 37, 27),
(54, 37, 27),
(55, 38, 27),
(56, 38, 40),
(57, 39, 26),
(58, 39, 44),
(59, 40, 25),
(60, 41, 44),
(61, 42, 25);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `page_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page`, `title`, `description`) VALUES
(1, 'home_page', 'HOME', '<p><img src="http://www.bizh2o.com/wp-content/uploads/2015/02/shopping.jpg" alt="" width="300" height="222" />Najbolji online shop u Srbiji!</p>'),
(2, 'kontakt_page', 'KONTAKTa', '<p>Tel: 018/555-555 <br /> Mob: 069/123-4567 <br /> Email: office@onlineshop.com</p>');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE IF NOT EXISTS `purchases` (
  `purchase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_user_id` int(10) unsigned NOT NULL,
  `purchase_date` bigint(10) unsigned NOT NULL,
  `amount` int(6) unsigned NOT NULL,
  `total_price` float(10,2) NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`purchase_id`, `fk_user_id`, `purchase_date`, `amount`, `total_price`) VALUES
(16, 9, 1429864807, 5, 84753.00),
(17, 9, 1429864842, 1, 9299.00),
(18, 9, 1429984676, 1, 73568.00),
(19, 9, 1430752784, 6, 96137.00),
(20, 9, 1430823286, 1, 9299.00),
(21, 9, 1430826832, 1, 88322.00),
(23, 9, 1431011629, 1, 1563.00),
(24, 9, 1431011762, 1, 359990.00),
(25, 9, 1431011983, 1, 939990.00),
(26, 9, 1432131537, 1, 939990.00),
(27, 9, 1433164768, 1, 88322.00),
(28, 9, 1433275770, 1, 73568.00),
(29, 9, 1438386668, 1, 61300.00),
(30, 9, 1439933090, 1, 88322.00),
(31, 9, 1442996478, 1, 88322.00),
(32, 9, 1443713896, 2, 149622.00),
(33, 9, 1443731531, 1, 88322.00),
(36, 9, 1446129261, 1, 73568.00),
(37, 9, 1446129283, 2, 122600.00),
(38, 9, 1446455861, 2, 70644.00),
(39, 9, 1448921660, 2, 82867.00),
(41, 9, 1452777263, 1, 9299.00),
(42, 9, 1453827877, 1, 88322.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(64) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `registration_date` bigint(10) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `email_code` char(5) NOT NULL,
  `fk_group_id` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `login`, `password`, `email`, `first_name`, `last_name`, `address`, `phone`, `registration_date`, `active`, `email_code`, `fk_group_id`) VALUES
(2, 'member', 'aa08769cdcb26674c6706093503ff0a3', 'member@member.com', 'member', 'member', '', '', 1360415878, 1, '', 2),
(9, 'test', '098f6bcd4621d373cade4e832627b4f6', 'mail@mail.mail', 'test', 'test', '', '', 1360415797, 1, '', 2),
(10, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'aaa@aaa.com', 'Admin', 'Admin', '', '', 1360415897, 1, '', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
