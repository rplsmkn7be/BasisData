-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2025 at 11:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `detil_pesan`
--

CREATE TABLE `detil_pesan` (
  `id_pesan` int(5) NOT NULL,
  `id_produk` varchar(5) NOT NULL,
  `jumlah` int(5) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detil_pesan`
--

INSERT INTO `detil_pesan` (`id_pesan`, `id_produk`, `jumlah`, `harga`) VALUES
(1001, 'PR001', 1, 8500000),
(1001, 'PR002', 2, 150000),
(1002, 'PR003', 1, 350000),
(1003, 'PR005', 3, 80000),
(1004, 'PR004', 1, 2100000);

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `id_faktur` int(5) NOT NULL,
  `id_pesan` int(5) NOT NULL,
  `tgl_faktur` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`id_faktur`, `id_pesan`, `tgl_faktur`) VALUES
(2001, 1001, '2025-10-06'),
(2002, 1002, '2025-10-07'),
(2003, 1003, '2025-10-08'),
(2004, 1004, '2025-10-09'),
(2005, 1005, '2025-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `kuitansi`
--

CREATE TABLE `kuitansi` (
  `id_kuitansi` int(5) NOT NULL,
  `id_faktur` int(5) NOT NULL,
  `tgl_kuitansi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kuitansi`
--

INSERT INTO `kuitansi` (`id_kuitansi`, `id_faktur`, `tgl_kuitansi`) VALUES
(3001, 2001, '2025-10-06'),
(3002, 2002, '2025-10-07'),
(3003, 2003, '2025-10-08'),
(3004, 2004, '2025-10-09'),
(3005, 2005, '2025-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(5) NOT NULL,
  `nm_pelanggan` varchar(40) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nm_pelanggan`, `alamat`, `telepon`, `email`) VALUES
('P0001', 'Budi Santoso', 'Jl. Teratai No.15, Bandung', '081234567890', 'budi@gmail.com'),
('P0002', 'Sinta Dewi', 'Jl. Mawar No.7, Cimahi', '081288899900', 'sinta@yahoo.com'),
('P0003', 'Andi Pratama', 'Jl. Anggrek No.5, Sukabumi', '081355512345', 'andipratama@mycompany.com'),
('P0004', 'Dewi Larasati', 'Jl. Anggrek No.11, Cimahi', '081377788899', 'dewi@gmail.com'),
('P0005', 'Rizky Ananda', 'Jl. Kenanga No.9, Garut', '081366600000', 'rizky@ymail.com'),
('P0006', 'Lina Marlina', 'Jl. Soka No.21, Bandung', '081299911122', 'lina.marlina@gmail.com'),
('P0007', 'Fahri Ramadhan', 'Jl. Dahlia No.18, Cimahi', '081355577799', 'fahri.ramadhan@yahoo.com'),
('P0008', 'Tasya Amelia', 'Jl. Mawar No.30, Garut', '081377788899', 'tasya.amelia@outlook.com');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(5) NOT NULL,
  `id_pelanggan` varchar(5) NOT NULL,
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_pelanggan`, `tgl_pesan`) VALUES
(1001, 'P0001', '2025-10-01'),
(1002, 'P0002', '2025-10-02'),
(1003, 'P0003', '2025-10-03'),
(1004, 'P0004', '2025-10-04'),
(1005, 'P0005', '2025-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(5) NOT NULL,
  `nm_produk` varchar(30) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `stock` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nm_produk`, `satuan`, `harga`, `stock`) VALUES
('PR001', 'Laptop Asus A409', 'unit', 8500000, 10),
('PR002', 'Mouse Logitech M170', 'pcs', 150000, 30),
('PR003', 'Keyboard Rexus Daxa', 'pcs', 350000, 20),
('PR004', 'Monitor Samsung 24\"', 'unit', 2100000, 15),
('PR005', 'Flashdisk Sandisk 32GB', 'pcs', 80000, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detil_pesan`
--
ALTER TABLE `detil_pesan`
  ADD PRIMARY KEY (`id_pesan`,`id_produk`),
  ADD KEY `FK_detil_pesan` (`id_produk`),
  ADD KEY `id_pesan` (`id_pesan`);

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`id_faktur`),
  ADD KEY `Faktur_Pesanesan` (`id_pesan`);

--
-- Indexes for table `kuitansi`
--
ALTER TABLE `kuitansi`
  ADD PRIMARY KEY (`id_kuitansi`),
  ADD KEY `Kuitansi_Faktur` (`id_faktur`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `Pesan_Pelanggan` (`id_pelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detil_pesan`
--
ALTER TABLE `detil_pesan`
  ADD CONSTRAINT `FK_detil_pesan` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `FK_detil_pesan2` FOREIGN KEY (`id_pesan`) REFERENCES `pesan` (`id_pesan`);

--
-- Constraints for table `faktur`
--
ALTER TABLE `faktur`
  ADD CONSTRAINT `Faktur_Pesanesan` FOREIGN KEY (`id_pesan`) REFERENCES `pesan` (`id_pesan`);

--
-- Constraints for table `kuitansi`
--
ALTER TABLE `kuitansi`
  ADD CONSTRAINT `Kuitansi_Faktur` FOREIGN KEY (`id_faktur`) REFERENCES `faktur` (`id_faktur`);

--
-- Constraints for table `pesan`
--
ALTER TABLE `pesan`
  ADD CONSTRAINT `Pesan_Pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
