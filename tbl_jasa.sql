-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2019 at 06:58 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_samuajasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jasa`
--

CREATE TABLE IF NOT EXISTS `tbl_jasa` (
  `id_jasa` varchar(7) NOT NULL,
  `jasa` varchar(50) NOT NULL,
  `rating` int(3) DEFAULT NULL,
  `harga` bigint(255) DEFAULT NULL,
  `eta_pengerjaan` int(10) DEFAULT NULL,
  `ket` varchar(100) NOT NULL,
  `overview` text,
  `image` varchar(255) NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id_jasa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jasa`
--

INSERT INTO `tbl_jasa` (`id_jasa`, `jasa`, `rating`, `harga`, `eta_pengerjaan`, `ket`, `overview`, `image`) VALUES
('SJ0001', 'Catering', NULL, 49999, NULL, 'Menyedia katering untuk acara', NULL, 'default.jpg'),
('SJ0002', 'Instalasi CCTV dan PUBX', NULL, 25000, NULL, 'Membantu pemasangan CCTV ', NULL, 'default.jpg'),
('SJ0003', 'Reparasi AC', NULL, 75000, NULL, 'Memperbaiki AC yang rusak', NULL, 'default.jpg'),
('SJ0005', 'Potong Rambut', NULL, 30000, NULL, 'Memotong Rambut dimanapun anda berada', NULL, 'default.jpg'),
('SJ0006', 'Pemasangan Ubin Tehel', NULL, 50000, NULL, 'Memasang Ubin atau Tehel di Rumah anda', NULL, 'default.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
