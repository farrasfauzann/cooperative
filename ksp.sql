-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2018 at 12:48 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ksp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cicilan`
--

CREATE TABLE `cicilan` (
  `id` int(11) NOT NULL,
  `kode_nasabah` varchar(100) DEFAULT NULL,
  `pinjaman_id` int(11) DEFAULT NULL,
  `cicilan_ke` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `denda`
--

CREATE TABLE `denda` (
  `id` int(11) UNSIGNED NOT NULL,
  `kode_nasabah` varchar(100) DEFAULT NULL,
  `pinjaman_id` int(11) DEFAULT NULL,
  `cicilan_ke` int(11) DEFAULT NULL,
  `jumlah` float DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keanggotaan`
--

CREATE TABLE `keanggotaan` (
  `id` int(11) UNSIGNED NOT NULL,
  `jenis` varchar(100) DEFAULT NULL,
  `simpanan_pokok` int(11) DEFAULT NULL,
  `simpanan_wajib` int(11) DEFAULT NULL,
  `bunga_simpanan` float DEFAULT NULL,
  `bunga_pinjaman` float DEFAULT NULL,
  `denda_pinjaman` float DEFAULT NULL,
  `keterangan` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keanggotaan`
--

INSERT INTO `keanggotaan` (`id`, `jenis`, `simpanan_pokok`, `simpanan_wajib`, `bunga_simpanan`, `bunga_pinjaman`, `denda_pinjaman`, `keterangan`) VALUES
(1, 'Masyarakat', 5000, 0, 0.5, 2, 0.2, 'Setelah simpanan di atas Rp. 1 juta'),
(2, 'Anggota', 5000, 50000, 0.7, 2, 0.2, 'Setelah ada saldo simpanan pokok'),
(3, 'Siswa', 0, 0, 0, 2, 0.2, 'Tanpa jasa');

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id` int(11) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `departemen` varchar(40) DEFAULT '',
  `alamat` varchar(200) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  `keanggotaan_id` int(11) DEFAULT NULL,
  `tgl_masuk` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id`, `kode`, `nama`, `departemen`, `alamat`, `hp`, `keanggotaan_id`, `tgl_masuk`) VALUES
(2, '1002', 'InAng', '0', 'Tenggilis, Surabaya', '', 1, '03/08/2017');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id` int(11) NOT NULL,
  `kode_nasabah` varchar(100) NOT NULL DEFAULT '',
  `jenis` enum('Uang','Barang') NOT NULL,
  `jumlah` int(20) NOT NULL,
  `bunga` float DEFAULT NULL,
  `total_bayar` int(20) DEFAULT NULL,
  `lama` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `attr` varchar(200) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preference`
--

INSERT INTO `preference` (`attr`, `value`) VALUES
('last_check_bunga', '2018-03-03'),
('kop_text', 'KOPERASI INDONESIA'),
('kop_koperasi', 'koperasi11.jpg'),
('kop_logo', 'Karya_Anak_Bangsa.jpg'),
('alamat', 'Jl. Raya Kalirungkut 7-9');

-- --------------------------------------------------------

--
-- Table structure for table `simpanan`
--

CREATE TABLE `simpanan` (
  `id` int(11) NOT NULL,
  `kode_nasabah` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `jenis` enum('Pokok','Wajib','Sukarela','Bunga','Ambil') NOT NULL,
  `jumlah` float NOT NULL,
  `sld` float DEFAULT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `simpanan`
--

INSERT INTO `simpanan` (`id`, `kode_nasabah`, `tanggal`, `jenis`, `jumlah`, `sld`, `created`) VALUES
(8, '1002', '2016-02-05', 'Pokok', 500, 500, 1464574448),
(9, '1002', '2016-05-30', 'Sukarela', 5000000, 10001000, 1464574468),
(10, '1002', '2016-03-01', 'Pokok', 500, 1000, 1464574487),
(11, '1002', '2016-03-01', 'Sukarela', 5000000, 5001000, 1464574510),
(16, '1002', '2016-06-01', 'Bunga', 25002.5, 10026000, 1464755054),
(17, '1002', '2016-06-04', 'Pokok', 500, 10026500, 1465003852),
(18, '1002', '2018-03-01', 'Bunga', 50132.5, 0, 1520095012);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `level` varchar(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `level`, `username`, `password`) VALUES
(5, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', '21232f297a57a5a743894a0e4a801fc3'),
(6, 'Teller', 'teller', '8482dfb1bca15b503101eb438f52deed', '8482dfb1bca15b503101eb438f52deed');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laporan`
-- (See below for the actual view)
--
CREATE TABLE `view_laporan` (
`id` int(11)
,`tabel` varchar(8)
,`kode_nasabah` varchar(100)
,`jumlah` double
,`tanggal` date
,`keterangan` varchar(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_laporan`
--
DROP TABLE IF EXISTS `view_laporan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laporan`  AS  select `simpanan`.`id` AS `id`,'simpanan' AS `tabel`,`simpanan`.`kode_nasabah` AS `kode_nasabah`,`simpanan`.`jumlah` AS `jumlah`,`simpanan`.`tanggal` AS `tanggal`,`simpanan`.`jenis` AS `keterangan` from `simpanan` union select `pinjaman`.`id` AS `id`,'pinjaman' AS `tabel`,`pinjaman`.`kode_nasabah` AS `kode_nasabah`,`pinjaman`.`jumlah` AS `jumlah`,`pinjaman`.`tanggal` AS `tanggal`,`pinjaman`.`lama` AS `keterangan` from `pinjaman` union select `cicilan`.`id` AS `id`,'cicilan' AS `tabel`,`cicilan`.`kode_nasabah` AS `kode_nasabah`,`cicilan`.`jumlah` AS `jumlah`,`cicilan`.`tanggal` AS `tanggal`,`cicilan`.`cicilan_ke` AS `keterangan` from `cicilan` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cicilan`
--
ALTER TABLE `cicilan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `denda`
--
ALTER TABLE `denda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cicilan`
--
ALTER TABLE `cicilan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `denda`
--
ALTER TABLE `denda`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keanggotaan`
--
ALTER TABLE `keanggotaan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pinjaman`
--
ALTER TABLE `pinjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `simpanan`
--
ALTER TABLE `simpanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
