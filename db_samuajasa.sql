-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 14, 2019 at 06:13 PM
-- Server version: 10.2.24-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u5673404_db_samuajasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_client`
--

CREATE TABLE `tbl_client` (
  `id_client` varchar(7) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kontak` bigint(13) NOT NULL,
  `alamat` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jasa`
--

CREATE TABLE `tbl_jasa` (
  `id_jasa` varchar(7) NOT NULL,
  `jasa` varchar(50) NOT NULL,
  `rating` int(3) DEFAULT NULL,
  `harga` bigint(255) DEFAULT NULL,
  `eta_pengerjaan` int(10) DEFAULT NULL,
  `ket` varchar(100) NOT NULL,
  `overview` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jasa`
--

INSERT INTO `tbl_jasa` (`id_jasa`, `jasa`, `rating`, `harga`, `eta_pengerjaan`, `ket`, `overview`) VALUES
('SJ0001', 'Catering', NULL, 50000, NULL, 'Menerima Panggilan Jasa Sewa Catering Berbagai Macam Makanan Untuk Berbagai Acara Anda', NULL),
('SJ0002', 'Instalasi CCTV dan PABX', NULL, 25000, NULL, 'Menerima Panggilan Jasa Pemasangan CCTV Dan PABX Untuk Pemasangan di Berbagai Tempat', NULL),
('SJ0003', 'Reparasi AC', NULL, 75000, NULL, 'Menerima Panggilan Pemasangan atau Reparasi AC Untuk Berbagai Tempat Sesuai Dengan Permintaan Anda', NULL),
('SJ0004', 'Tes Psikotes', NULL, 100000, NULL, 'Menerima Jasa Tes Psikotes Untuk Berbagai Macam Layanan Sesuai Kebutuhan Yang Anda Inginkan', NULL),
('SJ0005', 'Potong Rambut', NULL, 30000, NULL, 'Memotong Rambut dimanapun anda berada', NULL),
('SJ0006', 'Pemasangan Ubin Tehel', NULL, 50000, NULL, 'Memasang Ubin atau Tehel di Rumah anda', NULL),
('SJ0007', 'Event Organizer', NULL, 250000, NULL, 'Menerima Jasa Event Organizer Untuk Berbagai Macam Acara Anda', NULL),
('SJ0008', 'Konveksi & Sablon', NULL, 250000, NULL, 'Menerima Jasa Konveksi & Sablon Berbagai Macam Merchandise dan Baju Sesuai Dengan Yang Anda Inginkan', NULL),
('SJ0009', 'Desain & Multimedia', NULL, 200000, NULL, 'Menerima Pesanan Jasa Desain & Multimedia Untuk Berbagai Macam Desain Yang Anda Inignkan', NULL),
('SJ0010', 'Make-Up Wisuda', NULL, NULL, NULL, 'Menerima Make-Up untuk acara Wisuda', 'Buat kamu para calon Wisudawan,\r\n\r\nSo tau kalo mo wisuda, jam 5  so di lokasi, kadang mo make-up musti kasana kamari cari tampa make-up. Mana harus antri karna tampa make-up juga layani banyak orang. Kesel? Stres? Galau?\r\n\r\nBelum lagi ketika selesai wisuda, mo cari tampa ba foto, bayangkan tenga hari tua musti ba antri di studio foto, ta panas-panas, macet leh.\r\n\r\nApa Solusinya??\r\n\r\nTorang bekerja sama dengan Hotel Gran Puri Manado dan Sarang Inovasi beking  gebrakan dengan promo gila. Paket wisuda,\r\n-Kamar Hotel\r\n-Make-Up\r\n-Foto Wisuda\r\n\r\nTau brapa dpe harga?\r\n\r\nCuma 1.500.000 rupiah.\r\nALL IN.\r\n\r\nNginap di hotel, subuh turun ke Sarang Inovasi untuk Make-Up, selesai wisuda balik ke hotel untuk foto wisuda.\r\n\r\nNikmat mana lagi yang kau pungkiri?\r\n\r\nSegera Reservasi sekarang juga!');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pesan`
--

CREATE TABLE `tbl_pesan` (
  `id_pesan` varchar(7) NOT NULL,
  `id_jasa` varchar(7) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kontak` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_trx`
--

CREATE TABLE `tbl_trx` (
  `id_trx` varchar(7) NOT NULL,
  `id_client` varchar(7) NOT NULL,
  `id_vendor` varchar(7) NOT NULL,
  `waktu` date NOT NULL,
  `feedback` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendor`
--

CREATE TABLE `tbl_vendor` (
  `id_vendor` varchar(7) NOT NULL,
  `vendor` varchar(50) NOT NULL,
  `id_jasa` varchar(7) NOT NULL,
  `kontak` varchar(13) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_vendor`
--

INSERT INTO `tbl_vendor` (`id_vendor`, `vendor`, `id_jasa`, `kontak`, `alamat`) VALUES
('VND001', 'Telly Catering', 'SJ0001', '08526023593', NULL),
('VND002', 'Esther Catering', 'SJ0001', NULL, NULL),
('VND003', 'Tuti & Friends', 'SJ0002', '082189819095', NULL),
('VND004', 'Yap and Team', 'SJ0003', '085299973833', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_client`
--
ALTER TABLE `tbl_client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `tbl_jasa`
--
ALTER TABLE `tbl_jasa`
  ADD PRIMARY KEY (`id_jasa`);

--
-- Indexes for table `tbl_pesan`
--
ALTER TABLE `tbl_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `tbl_trx`
--
ALTER TABLE `tbl_trx`
  ADD PRIMARY KEY (`id_trx`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_vendor` (`id_vendor`);

--
-- Indexes for table `tbl_vendor`
--
ALTER TABLE `tbl_vendor`
  ADD PRIMARY KEY (`id_vendor`),
  ADD KEY `id_jasa` (`id_jasa`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_trx`
--
ALTER TABLE `tbl_trx`
  ADD CONSTRAINT `tbl_trx_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `tbl_client` (`id_client`),
  ADD CONSTRAINT `tbl_trx_ibfk_2` FOREIGN KEY (`id_vendor`) REFERENCES `tbl_vendor` (`id_vendor`);

--
-- Constraints for table `tbl_vendor`
--
ALTER TABLE `tbl_vendor`
  ADD CONSTRAINT `tbl_vendor_ibfk_1` FOREIGN KEY (`id_jasa`) REFERENCES `tbl_jasa` (`id_jasa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
