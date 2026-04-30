-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 30, 2026 at 06:38 PM
-- Server version: 8.0.45-0ubuntu0.24.04.1
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spk_padi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_rekomendasi_pestisida`
--

CREATE TABLE `detail_rekomendasi_pestisida` (
  `id` bigint UNSIGNED NOT NULL,
  `id_rekomendasi` bigint UNSIGNED NOT NULL,
  `id_pestisida` bigint UNSIGNED NOT NULL,
  `nilai_vi` decimal(8,6) NOT NULL,
  `peringkat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_rekomendasi_pestisida`
--

INSERT INTO `detail_rekomendasi_pestisida` (`id`, `id_rekomendasi`, `id_pestisida`, `nilai_vi`, `peringkat`) VALUES
(37, 7, 1, 1.000000, 1),
(38, 7, 2, 0.755000, 2),
(39, 7, 6, 0.510000, 3),
(40, 7, 5, 0.353333, 4),
(41, 7, 3, 0.257500, 5),
(42, 7, 4, 0.245000, 6),
(43, 8, 1, 0.950000, 1),
(44, 8, 6, 0.680000, 2),
(45, 8, 2, 0.635000, 3),
(46, 8, 5, 0.303333, 4),
(47, 8, 3, 0.257500, 5),
(48, 8, 4, 0.245000, 6),
(49, 9, 1, 0.950000, 1),
(50, 9, 6, 0.680000, 2),
(51, 9, 2, 0.635000, 3),
(52, 9, 5, 0.303333, 4),
(53, 9, 3, 0.257500, 5),
(54, 9, 4, 0.245000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `detail_rekomendasi_pupuk`
--

CREATE TABLE `detail_rekomendasi_pupuk` (
  `id` bigint UNSIGNED NOT NULL,
  `id_rekomendasi` bigint UNSIGNED NOT NULL,
  `id_pupuk` bigint UNSIGNED NOT NULL,
  `nilai_vi` decimal(8,6) NOT NULL,
  `peringkat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_rekomendasi_pupuk`
--

INSERT INTO `detail_rekomendasi_pupuk` (`id`, `id_rekomendasi`, `id_pupuk`, `nilai_vi`, `peringkat`) VALUES
(37, 7, 4, 1.000000, 1),
(38, 7, 1, 0.650000, 2),
(39, 7, 2, 0.630000, 3),
(40, 7, 3, 0.565000, 4),
(41, 7, 6, 0.497500, 5),
(42, 7, 5, 0.470000, 6),
(43, 8, 4, 1.000000, 1),
(44, 8, 5, 0.570000, 2),
(45, 8, 2, 0.547500, 3),
(46, 8, 3, 0.540000, 4),
(47, 8, 6, 0.465000, 5),
(48, 8, 1, 0.415000, 6),
(49, 9, 4, 1.000000, 1),
(50, 9, 5, 0.570000, 2),
(51, 9, 2, 0.547500, 3),
(52, 9, 3, 0.540000, 4),
(53, 9, 6, 0.465000, 5),
(54, 9, 1, 0.415000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_gejala` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id`, `kode`, `nama_gejala`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'G01', 'Bercak belah ketupat (ujung runcing) pada daun', 'uploads/gejala/fe6f8e79-5966-4c4b-b633-57f81394fa46.jpg', '2026-04-18 02:57:49', '2026-04-20 20:49:00'),
(2, 'G02', 'Leher malai busuk, berubah warna coklat atau hitam dan patah', 'uploads/gejala/a84aa884-d9b0-496d-a4dc-259b252a18b5.jpg', '2026-04-18 02:57:49', '2026-04-20 20:50:13'),
(3, 'G03', 'Bulir padi hampa atau tidak berisi', 'uploads/gejala/5d566fd8-423d-4f32-818d-fbedcd635dcf.jpg', '2026-04-18 02:57:49', '2026-04-20 20:50:30'),
(4, 'G04', 'Daun menguning mulai dari ujung dan tepi (layu)', 'uploads/gejala/e83f90ca-05f0-4ae3-8708-39b32884f384.png', '2026-04-18 02:57:49', '2026-04-20 20:50:45'),
(5, 'G05', 'Tepi daun mengering, bergelombang, dan berwarna kelabu', 'uploads/gejala/1839b418-a04c-480c-a0cc-802b468fb1da.png', '2026-04-18 02:57:49', '2026-04-20 20:51:05'),
(6, 'G06', 'Seluruh tanaman layu mendadak (serangan berat)', 'uploads/gejala/72cf0450-8770-4fa5-9d76-231c501c8c95.png', '2026-04-18 02:57:49', '2026-04-20 20:51:19'),
(7, 'G07', 'Tanaman menjadi sangat kerdil dibanding tanaman sehat', 'uploads/gejala/703bd200-fe19-4200-a67b-9aab9a670b0a.jpg', '2026-04-18 02:57:49', '2026-04-20 20:52:29'),
(8, 'G08', 'Daun berubah warna menjadi kuning oranye', 'uploads/gejala/570dd050-09bb-44ef-8df8-b07fb0717290.jpg', '2026-04-18 02:57:49', '2026-04-20 20:52:50'),
(9, 'G09', 'Jumlah anakan berkurang drastis dan malai tidak keluar', 'uploads/gejala/e5d90d9d-0e22-417d-b607-ec4feb74e99c.png', '2026-04-18 02:57:49', '2026-04-20 20:53:09'),
(10, 'G10', 'Bercak oval keabu-abuan pada pelepah (dekat air)', 'uploads/gejala/722c4c15-09a0-490d-b2f9-76e76a016148.png', '2026-04-18 02:57:49', '2026-04-20 20:53:56'),
(11, 'G11', 'Bercak meluas ke atas membentuk pola seperti awan', 'uploads/gejala/1af7b75c-ca38-46f7-b0e1-d44dd323a1a8.png', '2026-04-18 02:57:49', '2026-04-20 20:58:56'),
(12, 'G12', 'Batang tanaman membusuk dan mudah rebah', 'uploads/gejala/e55e5035-5461-45b5-9408-148df051cffa.png', '2026-04-18 02:57:49', '2026-04-20 20:59:47'),
(13, 'G13', 'Bercak coklat oval merata (seperti biji wijen)', 'uploads/gejala/4c797a8d-ab36-4f94-a3fc-faef08d433db.png', '2026-04-18 02:57:49', '2026-04-20 21:00:06'),
(14, 'G14', 'Bercak hitam atau coklat pada kulit gabah', 'uploads/gejala/1ed0ec46-f86a-4b8b-8c70-b8e25202fe83.png', '2026-04-18 02:57:49', '2026-04-20 21:01:21'),
(15, 'G15', 'Daun mengering dan gugur lebih cepat', 'uploads/gejala/1cce48fa-52fa-4014-8eba-dae7ffb1e8d7.jpg', '2026-04-18 02:57:49', '2026-04-20 21:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `gejala_pestisida`
--

CREATE TABLE `gejala_pestisida` (
  `id` bigint UNSIGNED NOT NULL,
  `id_gejala` bigint UNSIGNED NOT NULL,
  `id_pestisida` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT '0.700',
  `md` decimal(4,3) NOT NULL DEFAULT '0.100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gejala_pestisida`
--

INSERT INTO `gejala_pestisida` (`id`, `id_gejala`, `id_pestisida`, `mb`, `md`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0.900, 0.050, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(2, 1, 2, 0.850, 0.100, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(3, 1, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(4, 1, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(5, 1, 5, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(6, 1, 6, 0.200, 0.650, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(7, 2, 1, 0.900, 0.050, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(8, 2, 2, 0.850, 0.100, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(9, 2, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(10, 2, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(11, 2, 5, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(12, 2, 6, 0.200, 0.650, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(13, 3, 1, 0.750, 0.150, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(14, 3, 2, 0.650, 0.200, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(15, 3, 3, 0.100, 0.750, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(16, 3, 4, 0.100, 0.750, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(17, 3, 5, 0.350, 0.500, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(18, 3, 6, 0.200, 0.650, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(19, 4, 1, 0.100, 0.750, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(20, 4, 2, 0.100, 0.748, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(21, 4, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(22, 4, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(23, 4, 5, 0.800, 0.100, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(24, 4, 6, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(25, 5, 1, 0.250, 0.600, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(26, 5, 2, 0.250, 0.600, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(27, 5, 3, 0.750, 0.150, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(28, 5, 4, 0.800, 0.100, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(29, 5, 5, 0.150, 0.700, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(30, 5, 6, 0.100, 0.750, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(31, 6, 1, 0.150, 0.700, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(32, 6, 2, 0.150, 0.700, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(33, 6, 3, 0.700, 0.150, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(34, 6, 4, 0.800, 0.100, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(35, 6, 5, 0.150, 0.700, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(36, 6, 6, 0.100, 0.800, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(37, 7, 1, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(38, 7, 2, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(39, 7, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(40, 7, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(41, 7, 5, 0.800, 0.100, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(42, 7, 6, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(43, 8, 1, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(44, 8, 2, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(45, 8, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(46, 8, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(47, 8, 5, 0.850, 0.050, '2026-04-28 16:54:13', '2026-04-29 00:15:31'),
(48, 8, 6, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(49, 9, 1, 0.100, 0.750, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(50, 9, 2, 0.100, 0.750, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(51, 9, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(52, 9, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(53, 9, 5, 0.085, 0.050, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(54, 9, 6, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(55, 10, 1, 0.750, 0.150, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(56, 10, 2, 0.650, 0.200, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(57, 10, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(58, 10, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(59, 10, 5, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(60, 10, 6, 0.900, 0.050, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(61, 11, 1, 0.750, 0.150, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(62, 11, 2, 0.600, 0.250, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(63, 11, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(64, 11, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(65, 11, 5, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(66, 11, 6, 0.900, 0.050, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(67, 12, 1, 0.700, 0.200, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(68, 12, 2, 0.600, 0.250, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(69, 12, 3, 0.200, 0.600, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(70, 12, 4, 0.200, 0.600, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(71, 12, 5, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(72, 12, 6, 0.850, 0.100, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(73, 13, 1, 0.700, 0.150, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(74, 13, 2, 0.650, 0.200, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(75, 13, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(76, 13, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(77, 13, 5, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(78, 13, 6, 0.150, 0.700, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(79, 14, 1, 0.700, 0.150, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(80, 14, 2, 0.600, 0.200, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(81, 14, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(82, 14, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(83, 14, 5, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(84, 14, 6, 0.150, 0.700, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(85, 15, 1, 0.650, 0.200, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(86, 15, 2, 0.550, 0.250, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(87, 15, 3, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(88, 15, 4, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(89, 15, 5, 0.050, 0.850, '2026-04-28 16:54:13', '2026-04-29 00:15:32'),
(90, 15, 6, 0.150, 0.700, '2026-04-28 16:54:13', '2026-04-29 00:15:32');

-- --------------------------------------------------------

--
-- Table structure for table `gejala_pupuk`
--

CREATE TABLE `gejala_pupuk` (
  `id` bigint UNSIGNED NOT NULL,
  `id_gejala` bigint UNSIGNED NOT NULL,
  `id_pupuk` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT '0.700',
  `md` decimal(4,3) NOT NULL DEFAULT '0.100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gejala_pupuk`
--

INSERT INTO `gejala_pupuk` (`id`, `id_gejala`, `id_pupuk`, `mb`, `md`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0.850, 0.049, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(2, 1, 2, 0.500, 0.200, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(3, 1, 3, 0.150, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(4, 1, 4, 0.100, 0.800, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(5, 1, 5, 0.200, 0.500, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(6, 1, 6, 0.750, 0.150, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(7, 2, 1, 0.900, 0.100, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(8, 2, 2, 0.600, 0.200, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(9, 2, 3, 0.200, 0.600, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(10, 2, 4, 0.100, 0.800, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(11, 2, 5, 0.300, 0.500, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(12, 2, 6, 0.700, 0.100, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(13, 3, 1, 0.800, 0.100, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(14, 3, 2, 0.400, 0.500, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(15, 3, 3, 0.100, 0.800, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(16, 3, 4, 0.100, 0.900, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(17, 3, 5, 0.200, 0.600, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(18, 3, 6, 0.700, 0.100, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(19, 4, 1, 0.400, 0.350, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(20, 4, 2, 0.300, 0.450, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(21, 4, 3, 0.200, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(22, 4, 4, 0.150, 0.560, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(23, 4, 5, 0.200, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(24, 4, 6, 0.350, 0.400, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(25, 5, 1, 0.800, 0.100, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(26, 5, 2, 0.450, 0.350, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(27, 5, 3, 0.150, 0.650, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(28, 5, 4, 0.100, 0.800, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(29, 5, 5, 0.200, 0.600, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(30, 5, 6, 0.700, 0.150, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(31, 6, 1, 0.800, 0.100, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(32, 6, 2, 0.450, 0.350, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(33, 6, 3, 0.150, 0.650, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(34, 6, 4, 0.100, 0.800, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(35, 6, 5, 0.200, 0.600, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(36, 6, 6, 0.700, 0.150, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(37, 7, 1, 0.350, 0.400, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(38, 7, 2, 0.250, 0.500, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(39, 7, 3, 0.200, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(40, 7, 4, 0.150, 0.650, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(41, 7, 5, 0.200, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(42, 7, 6, 0.300, 0.448, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(43, 8, 1, 0.350, 0.400, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(44, 8, 2, 0.250, 0.500, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(45, 8, 3, 0.200, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(46, 8, 4, 0.150, 0.560, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(47, 8, 5, 0.200, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(48, 8, 6, 0.300, 0.450, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(49, 9, 1, 0.400, 0.350, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(50, 9, 2, 0.300, 0.450, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(51, 9, 3, 0.200, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(52, 9, 4, 0.150, 0.650, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(53, 9, 5, 0.200, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(54, 9, 6, 0.350, 0.400, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(55, 10, 1, 0.800, 0.100, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(56, 10, 2, 0.500, 0.300, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(57, 10, 3, 0.200, 0.600, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(58, 10, 4, 0.150, 0.700, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(59, 10, 5, 0.250, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(60, 10, 6, 0.700, 0.150, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(61, 11, 1, 0.800, 0.100, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(62, 11, 2, 0.500, 0.300, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(63, 11, 3, 0.200, 0.600, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(64, 11, 4, 0.150, 0.700, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(65, 11, 5, 0.250, 0.550, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(66, 11, 6, 0.700, 0.150, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(67, 12, 1, 0.800, 0.100, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(68, 12, 2, 0.450, 0.350, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(69, 12, 3, 0.200, 0.600, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(70, 12, 4, 0.100, 0.800, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(71, 12, 5, 0.200, 0.600, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(72, 12, 6, 0.700, 0.150, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(73, 13, 1, 0.650, 0.200, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(74, 13, 2, 0.400, 0.400, '2026-04-28 06:50:16', '2026-04-30 05:09:27'),
(75, 13, 3, 0.200, 0.600, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(76, 13, 4, 0.150, 0.700, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(77, 13, 5, 0.250, 0.550, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(78, 13, 6, 0.550, 0.250, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(79, 14, 1, 0.600, 0.200, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(80, 14, 2, 0.400, 0.400, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(81, 14, 3, 0.250, 0.549, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(82, 14, 4, 0.150, 0.700, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(83, 14, 5, 0.200, 0.600, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(84, 14, 6, 0.550, 0.250, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(85, 15, 1, 0.300, 0.500, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(86, 15, 2, 0.200, 0.600, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(87, 15, 3, 0.200, 0.600, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(88, 15, 4, 0.150, 0.700, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(89, 15, 5, 0.200, 0.600, '2026-04-28 06:50:17', '2026-04-30 05:09:27'),
(90, 15, 6, 0.300, 0.500, '2026-04-28 06:50:17', '2026-04-30 05:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` enum('benefit','cost') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot` decimal(5,2) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `kode`, `nama`, `jenis`, `bobot`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'C1', 'Jenis Penyakit', 'benefit', 0.35, 'Kesesuaian produk terhadap jenis penyakit yang dipilih', '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(2, 'C2', 'Harga', 'cost', 0.20, 'Harga per satuan produk yang tersedia di pasaran', '2026-04-18 02:57:49', '2026-04-29 00:20:55'),
(3, 'C3', 'Efektivitas', 'benefit', 0.25, 'Tingkat keberhasilan mengendalikan penyakit', '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(4, 'C4', 'Dampak Lingkungan', 'cost', 0.20, 'Pengaruh negatif terhadap lingkungan sawah', '2026-04-18 02:57:49', '2026-04-29 00:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '0001_01_01_000000_create_users_table', 1),
(11, '0001_01_01_000001_create_cache_table', 1),
(12, '0001_01_01_000002_create_jobs_table', 1),
(13, '2024_01_01_000100_create_penyakit_table', 1),
(14, '2024_01_01_000200_create_all_tables', 1),
(15, '2026_04_11_000300_add_profile_and_preference_columns', 1),
(16, '2026_04_11_000400_add_image_columns', 1),
(17, '2026_04_14_000500_add_detail_fields_to_pupuk_and_pestisida', 1),
(18, '2026_04_18_000500_add_gambar_to_gejala_table', 1),
(19, '2026_04_21_000600_add_phone_login_columns_to_users_table', 2),
(20, '2026_04_21_001000_ensure_otp_columns_exist_on_users_table', 2),
(21, '2026_04_27_000100_add_cf_rule_tables', 3),
(22, '2026_04_28_000200_add_symptom_rule_tables', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id`, `kode`, `nama`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'P01', 'Blast (Blas)', 'Penyakit yang disebabkan jamur Pyricularia oryzae. Umumnya menyerang daun dan leher malai padi.', 'uploads/penyakit/42976c8c-73d0-44f5-b8b7-0f21ad419329.jpg', '2026-04-18 02:57:49', '2026-04-20 20:06:06'),
(2, 'P02', 'Hawar Daun Bakteri (Kresek)', 'Penyakit yang disebabkan bakteri Xanthomonas oryzae pv. oryzae.', 'uploads/penyakit/8305199e-4903-4b19-8662-ee3f4d5a4eb3.jpg', '2026-04-18 02:57:49', '2026-04-20 20:06:28'),
(3, 'P03', 'Tungro', 'Penyakit virus kompleks RTBV dan RTSV yang ditularkan oleh hama wereng hijau (Nephotettix virescens).', 'uploads/penyakit/79987aee-2aee-454e-8a45-711b3cd072a6.jpg', '2026-04-18 02:57:49', '2026-04-20 20:06:46'),
(4, 'P04', 'Busuk Pelepah (Sheath Blight)', 'Penyakit yang disebabkan jamur Rhizoctonia solani dan menyerang pelepah daun padi.', 'uploads/penyakit/0425e780-b047-4a96-ab9f-4286f6804ec8.jpg', '2026-04-18 02:57:49', '2026-04-20 20:07:01'),
(5, 'P05', 'Bercak Coklat (Brown Spot)', 'Penyakit yang disebabkan jamur Bipolaris oryzae, dahulu dikenal sebagai Helminthosporium oryzae.', 'uploads/penyakit/d823fdd2-d7e8-4478-af28-80f143f50a11.jpg', '2026-04-18 02:57:49', '2026-04-20 20:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit_gejala`
--

CREATE TABLE `penyakit_gejala` (
  `id` bigint UNSIGNED NOT NULL,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `id_gejala` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT '0.700',
  `md` decimal(4,3) NOT NULL DEFAULT '0.100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penyakit_gejala`
--

INSERT INTO `penyakit_gejala` (`id`, `id_penyakit`, `id_gejala`, `mb`, `md`) VALUES
(1, 1, 1, 0.900, 0.050),
(2, 1, 2, 0.900, 0.050),
(3, 1, 3, 0.700, 0.150),
(4, 1, 14, 0.650, 0.200),
(5, 2, 4, 0.800, 0.100),
(6, 2, 5, 0.900, 0.500),
(7, 2, 6, 0.750, 0.100),
(9, 3, 7, 0.850, 0.050),
(10, 3, 8, 0.950, 0.020),
(11, 3, 9, 0.750, 0.100),
(12, 4, 6, 0.600, 0.202),
(13, 4, 10, 0.900, 0.050),
(14, 4, 11, 0.900, 0.050),
(15, 4, 12, 0.850, 0.050),
(17, 5, 13, 0.900, 0.050),
(18, 5, 14, 0.700, 0.150),
(19, 5, 15, 0.750, 0.100),
(20, 4, 3, 0.600, 0.250);

-- --------------------------------------------------------

--
-- Table structure for table `penyakit_pestisida`
--

CREATE TABLE `penyakit_pestisida` (
  `id` bigint UNSIGNED NOT NULL,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `id_pestisida` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT '0.700',
  `md` decimal(4,3) NOT NULL DEFAULT '0.100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penyakit_pestisida`
--

INSERT INTO `penyakit_pestisida` (`id`, `id_penyakit`, `id_pestisida`, `mb`, `md`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0.726, 0.216, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(2, 1, 2, 0.684, 0.244, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(3, 1, 3, 0.564, 0.324, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(4, 1, 4, 0.594, 0.304, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(5, 1, 5, 0.546, 0.336, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(6, 1, 6, 0.720, 0.220, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(7, 2, 1, 0.450, 0.408, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(8, 2, 2, 0.468, 0.388, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(9, 2, 3, 0.834, 0.144, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(10, 2, 4, 0.834, 0.144, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(11, 2, 5, 0.516, 0.356, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(12, 2, 6, 0.576, 0.316, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(13, 3, 1, 0.450, 0.408, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(14, 3, 2, 0.468, 0.388, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(15, 3, 3, 0.564, 0.324, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(16, 3, 4, 0.594, 0.304, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(17, 3, 5, 0.804, 0.164, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(18, 3, 6, 0.576, 0.316, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(19, 4, 1, 0.654, 0.264, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(20, 4, 2, 0.756, 0.196, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(21, 4, 3, 0.564, 0.324, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(22, 4, 4, 0.594, 0.304, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(23, 4, 5, 0.516, 0.356, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(24, 4, 6, 0.864, 0.124, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(25, 5, 1, 0.696, 0.236, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(26, 5, 2, 0.612, 0.292, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(27, 5, 3, 0.564, 0.324, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(28, 5, 4, 0.594, 0.304, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(29, 5, 5, 0.516, 0.356, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(30, 5, 6, 0.822, 0.152, '2026-04-28 01:24:45', '2026-04-28 01:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit_pupuk`
--

CREATE TABLE `penyakit_pupuk` (
  `id` bigint UNSIGNED NOT NULL,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `id_pupuk` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT '0.700',
  `md` decimal(4,3) NOT NULL DEFAULT '0.100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penyakit_pupuk`
--

INSERT INTO `penyakit_pupuk` (`id`, `id_penyakit`, `id_pupuk`, `mb`, `md`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0.804, 0.164, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(2, 1, 2, 0.792, 0.172, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(3, 1, 3, 0.570, 0.320, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(4, 1, 4, 0.726, 0.216, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(5, 1, 5, 0.756, 0.196, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(6, 1, 6, 0.708, 0.228, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(7, 2, 1, 0.648, 0.268, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(8, 2, 2, 0.720, 0.220, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(9, 2, 3, 0.498, 0.368, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(10, 2, 4, 0.654, 0.264, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(11, 2, 5, 0.714, 0.224, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(12, 2, 6, 0.708, 0.228, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(13, 3, 1, 0.648, 0.268, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(14, 3, 2, 0.720, 0.220, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(15, 3, 3, 0.498, 0.368, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(16, 3, 4, 0.684, 0.244, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(17, 3, 5, 0.786, 0.176, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(18, 3, 6, 0.708, 0.228, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(19, 4, 1, 0.648, 0.268, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(20, 4, 2, 0.720, 0.220, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(21, 4, 3, 0.498, 0.368, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(22, 4, 4, 0.726, 0.216, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(23, 4, 5, 0.786, 0.176, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(24, 4, 6, 0.636, 0.276, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(25, 5, 1, 0.648, 0.268, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(26, 5, 2, 0.720, 0.220, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(27, 5, 3, 0.540, 0.340, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(28, 5, 4, 0.696, 0.236, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(29, 5, 5, 0.786, 0.176, '2026-04-28 01:24:45', '2026-04-28 01:24:45'),
(30, 5, 6, 0.666, 0.256, '2026-04-28 01:24:45', '2026-04-28 01:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `pestisida`
--

CREATE TABLE `pestisida` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` enum('fungisida','bakterisida','insektisida','herbisida') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bahan_aktif` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kandungan_detail` text COLLATE utf8mb4_unicode_ci,
  `fungsi` text COLLATE utf8mb4_unicode_ci,
  `takaran` text COLLATE utf8mb4_unicode_ci,
  `efek_penggunaan` text COLLATE utf8mb4_unicode_ci,
  `cara_aplikasi` text COLLATE utf8mb4_unicode_ci,
  `jadwal_umur_aplikasi` text COLLATE utf8mb4_unicode_ci,
  `frekuensi_aplikasi` text COLLATE utf8mb4_unicode_ci,
  `dosis` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `satuan_harga` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'per 100ml',
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pestisida`
--

INSERT INTO `pestisida` (`id`, `kode`, `nama`, `jenis`, `bahan_aktif`, `kandungan_detail`, `fungsi`, `takaran`, `efek_penggunaan`, `cara_aplikasi`, `jadwal_umur_aplikasi`, `frekuensi_aplikasi`, `dosis`, `harga`, `satuan_harga`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'PS01', 'Amistartop 325 SC', 'fungisida', 'Azoksistrobin + Difenokonazol', 'Azoxystrobin: 200 g/L\r\nDifenoconazole: 125 g/L\r\nFormulasi: Suspensi pekat (SC)', 'Fungisida sistemik untuk mengendalikan penyakit jamur pada padi seperti blas, bercak daun, dan hawar pelepah', '±250–500 ml/ha', 'Menghambat perkembangan jamur, menjaga daun tetap sehat, dan meningkatkan potensi hasil panen', 'Disemprotkan merata ke seluruh bagian tanaman terutama daun, menggunakan sprayer', '20–30 HST (awal gejala atau pencegahan)\r\n40–50 HST (fase pembentukan malai)', '1–2 kali sesuai kondisi serangan', '0,5–1 ml/L', 150000.00, 'per 100ml', 'uploads/pestisida/caffafdd-e689-4417-a2f8-27bbdfc4118c.jpg', '2026-04-18 02:57:49', '2026-04-20 23:36:06'),
(2, 'PS02', 'Filia 525 SE', 'fungisida', 'Propikonazol + Trisiklazol', 'Propiconazole: 125 g/L\r\nTricyclazole: 400 g/L\r\nFormulasi: Suspo-emulsion (SE)', 'Fungisida sistemik untuk mengendalikan penyakit jamur pada padi terutama blas (daun dan leher malai)', '±250–400 ml/ha', 'Menekan perkembangan jamur, melindungi daun dan malai, serta mengurangi risiko gagal panen akibat penyakit', 'Disemprotkan merata ke seluruh bagian tanaman terutama daun dan malai menggunakan sprayer', '20–30 HST (fase vegetatif awal / pencegahan)\r\n40–55 HST (menjelang dan saat pembentukan malai)', '1–2 kali sesuai tingkat serangan', '1–1,5 ml/L', 125000.00, 'per 250ml', 'uploads/pestisida/fc375591-7cab-4300-af39-fcc5ec110372.jpg', '2026-04-18 02:57:49', '2026-04-20 23:37:26'),
(3, 'PS03', 'Bactocyn 12/5 WP', 'bakterisida', 'Streptomisin Sulfat', 'Streptomycin sulfate: 12%\r\nOxytetracycline: 5%\r\nFormulasi: Wettable Powder (WP)', 'Bakterisida untuk mengendalikan penyakit bakteri pada padi seperti hawar daun bakteri (kresek)', '±400–600 g/ha', 'Menghambat perkembangan bakteri, mengurangi penyebaran penyakit, dan menjaga kesehatan tanaman', 'Disemprotkan merata ke seluruh bagian tanaman terutama daun yang terinfeksi', 'Saat gejala awal muncul\r\nDapat diulang 7–10 hari kemudian jika diperlukan', '1–2 kali sesuai kondisi serangan', '1–2 g/L', 45000.00, 'per 100g', 'uploads/pestisida/0ad874dc-c1d2-4da4-8b28-bbd805d9ff72.jpg', '2026-04-18 02:57:49', '2026-04-20 23:39:30'),
(4, 'PS04', 'Agrept 20 WP', 'bakterisida', 'Streptomisin Sulfat 20%', 'Streptomycin sulfate: 20%\r\nFormulasi: Wettable Powder (WP)', 'Bakterisida untuk mengendalikan penyakit bakteri pada padi seperti hawar daun bakteri (kresek)', '±400–600 g/ha', 'Menekan perkembangan bakteri, mengurangi penyebaran penyakit, dan membantu menjaga kesehatan tanaman', 'Disemprotkan merata ke seluruh bagian tanaman terutama daun yang terinfeksi menggunakan sprayer', 'Saat gejala awal muncul\r\nUlangi 7–10 hari kemudian jika diperlukan', '1–2 kali sesuai kondisi serangan', '1,5 g/L', 25000.00, 'per 50g', 'uploads/pestisida/59d42504-dd9c-456e-aefe-5bfb6e692ae0.jpg', '2026-04-18 02:57:49', '2026-04-20 23:41:01'),
(5, 'PS05', 'Winder 50 EC', 'insektisida', 'Imidakloprid', 'Cypermethrin: 100 g/L\r\nFormulasi: Emulsifiable Concentrate (EC)', 'Insektisida untuk mengendalikan hama pada padi seperti wereng, ulat, dan penggerek batang', '±100–300 ml/ha', 'Membunuh hama dengan cepat, mengurangi kerusakan tanaman, dan menjaga pertumbuhan tetap optimal', 'Disemprotkan merata ke seluruh bagian tanaman terutama area yang terserang hama', 'Saat hama mulai terlihat\r\nUlangi 7–10 hari kemudian jika diperlukan', '1–2 kali sesuai tingkat serangan', '0,5–1 ml/L', 55000.00, 'per 100ml', 'uploads/pestisida/9b7ef6ca-abed-4781-9ca9-ca5f65fe5510.jpg', '2026-04-18 02:57:49', '2026-04-20 23:43:53'),
(6, 'PS06', 'Validacin 3 L', 'fungisida', 'Validamisin A', 'Validamycin A: 3% (±30 g/L)\r\nFormulasi: Larutan (L)', 'Fungisida antibiotik untuk mengendalikan penyakit hawar pelepah (sheath blight) pada padi', '±400–600 ml/ha', 'Menghambat perkembangan jamur, mengurangi penyebaran penyakit, dan menjaga kesehatan tanaman', 'Disemprotkan merata terutama pada bagian pelepah dan pangkal batang tanaman', '25–35 HST (awal gejala atau pencegahan)\r\nUlangi 7–10 hari kemudian jika diperlukan', '1–2 kali sesuai kondisi serangan', '1–2 ml/L', 25000.00, 'per 250ml', 'uploads/pestisida/55d0694c-e143-4352-a5ef-33607791269e.jpg', '2026-04-18 02:57:49', '2026-04-20 23:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `pupuk`
--

CREATE TABLE `pupuk` (
  `id` bigint UNSIGNED NOT NULL,
  `kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kandungan` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kandungan_detail` text COLLATE utf8mb4_unicode_ci,
  `fungsi_utama` text COLLATE utf8mb4_unicode_ci,
  `takaran` text COLLATE utf8mb4_unicode_ci,
  `efek_penggunaan` text COLLATE utf8mb4_unicode_ci,
  `cara_aplikasi` text COLLATE utf8mb4_unicode_ci,
  `jadwal_umur_aplikasi` text COLLATE utf8mb4_unicode_ci,
  `frekuensi_aplikasi` text COLLATE utf8mb4_unicode_ci,
  `harga_per_kg` decimal(10,2) NOT NULL,
  `satuan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kg',
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pupuk`
--

INSERT INTO `pupuk` (`id`, `kode`, `nama`, `kandungan`, `kandungan_detail`, `fungsi_utama`, `takaran`, `efek_penggunaan`, `cara_aplikasi`, `jadwal_umur_aplikasi`, `frekuensi_aplikasi`, `harga_per_kg`, `satuan`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'PK01', 'Urea', 'N 46%', 'Mengandung Nitrogen (N) sebesar ±46% dalam bentuk senyawa CO(NH₂)₂ (urea). Tidak memiliki kandungan unsur hara lain seperti fosfor (P) atau kalium (K), sehingga termasuk pupuk tunggal dengan fokus pada unsur nitrogen saja.', 'Pupuk nitrogen tinggi untuk pertumbuhan vegetatif, Nitrogen (N). Selain nitrogen, urea tidak mengandung unsur hara lain seperti fosfor (P) atau kalium (K), sehingga termasuk pupuk tunggal. Dalam tanah, urea akan mengalami proses perubahan menjadi amonia dan kemudian nitrat yang dapat diserap oleh tanaman untuk mendukung pertumbuhan vegetatif.', '±200–300 kg/ha', 'Meningkatkan pertumbuhan daun dan batang, mempercepat pembentukan anakan, serta membuat tanaman lebih hijau', 'Disebar merata di lahan (tabur), sebaiknya pada tanah lembab atau menjelang pengairan', '7–10 HST (awal tanam)\r\n20–25 HST (fase anakan)\r\n35–40 HST (menjelang pembentukan malai)', '2–3 kali selama masa tanam', 1800.00, 'kg', 'uploads/pupuk/f3dcde81-2f8e-4792-98ed-42181feed1cf.jpg', '2026-04-18 02:57:49', '2026-04-20 23:24:28'),
(2, 'PK02', 'NPK Phonska', 'N15% P15% K15% S10%', 'Nitrogen (N) 15% • Fosfor (P₂O₅) 15% • Kalium (K₂O) 15% • Sulfur (S) ±10%', 'Mendukung pertumbuhan seimbang (akar, batang, daun), memperkuat tanaman, serta meningkatkan pembentukan dan kualitas bulir padi', '±200–300 kg/ha (dapat disesuaikan dengan kondisi tanah)', 'Tanaman lebih kokoh, akar kuat, daun hijau sehat, serta hasil panen lebih optimal', 'Disebar merata di lahan (tabur), bisa dicampur dengan tanah atau diberikan saat kondisi lahan lembab', '7–10 HST (awal pertumbuhan)\r\n20–25 HST (fase anakan)', '2 kali selama masa tanam', 1840.00, 'kg', 'uploads/pupuk/79c0b49a-d7a1-4882-8929-c51850fd351e.png', '2026-04-18 02:57:49', '2026-04-20 23:27:12'),
(3, 'PK03', 'SP-36', 'P 36%', 'Fosfor (P₂O₅) total: ±36%\r\nFosfor larut dalam air: ±30%\r\nFosfor larut dalam asam sitrat: ±34%\r\nKalsium (Ca): ±15–20%\r\nSulfur (S): ±5%', 'Merangsang pertumbuhan akar, mempercepat pembentukan anakan, serta membantu pembentukan bunga dan bulir padi', '±100–150 kg/ha', 'Akar lebih kuat, tanaman lebih cepat tumbuh, dan pembentukan malai lebih optimal', 'Disebar merata di lahan dan sebaiknya dicampur dengan tanah saat pengolahan lahan atau awal tanam', 'Saat olah tanah (sebelum tanam)\r\n0–7 HST (awal tanam)', '1–2 kali selama masa tanam', 9900.00, 'kg', 'uploads/pupuk/ae55f8c4-5463-4e7a-b035-872c45f176b1.jpg', '2026-04-18 02:57:49', '2026-04-20 23:29:18'),
(4, 'PK04', 'KCl', 'K 60%', 'Kalium (K₂O): ±60%\r\nKlorida (Cl): ±45%\r\nKadar air: rendah (±1–2%)', 'Meningkatkan ketahanan tanaman terhadap penyakit, memperkuat batang agar tidak mudah rebah, serta meningkatkan kualitas dan pengisian bulir padi', '±75–100 kg/ha', 'Tanaman lebih kuat, tahan cekaman, dan hasil panen lebih bernas serta berkualitas', 'Disebar merata di lahan (tabur), bisa diberikan bersamaan dengan pupuk lain pada kondisi tanah lembab', '7–10 HST (awal pertumbuhan)\r\n30–35 HST (menjelang pembentukan malai)', '1–2 kali selama masa tanam', 12900.00, 'kg', 'uploads/pupuk/dbfae915-8ea3-4c2a-95aa-c6107c642b0d.jpg', '2026-04-18 02:57:49', '2026-04-20 23:30:50'),
(5, 'PK05', 'Pupuk Organik Kompos', 'C-organik ≥15%', 'Bahan organik: ±20–30%\r\nNitrogen (N): ±1–2%\r\nFosfor (P₂O₅): ±0.5–1%\r\nKalium (K₂O): ±1–2%\r\nC/N rasio: ±10–20\r\nMengandung unsur mikro (Ca, Mg, Fe, Zn, dll) dalam jumlah kecil', 'Memperbaiki struktur tanah, meningkatkan kesuburan tanah, serta membantu penyerapan unsur hara oleh tanaman', '±2–5 ton/ha', 'Tanah lebih gembur, daya simpan air meningkat, dan tanaman tumbuh lebih sehat', 'Ditebar merata lalu dicampur dengan tanah saat pengolahan lahan sebelum tanam', 'Saat olah tanah (sebelum tanam)', '1 kali setiap musim tanam', 640.00, 'kg', 'uploads/pupuk/0af83378-ac2d-4321-bf3d-7c0ad4b97ed3.jpg', '2026-04-18 02:57:49', '2026-04-20 23:32:02'),
(6, 'PK06', 'ZA (Amonium Sulfat)', 'N 21%, S 24%', 'Nitrogen (N): ±21%\r\nSulfur (S): ±24%\r\nBentuk: (NH₄)₂SO₄', 'Menambah unsur nitrogen dan sulfur, membantu pembentukan daun hijau, serta mendukung pembentukan protein pada tanaman', '±100–200 kg/ha', 'Daun lebih hijau, pertumbuhan lebih baik, dan tanaman lebih tahan terhadap kekurangan unsur hara tertentu', 'Disebar merata di lahan (tabur), sebaiknya pada tanah lembab atau sebelum pengairan', '7–10 HST (awal pertumbuhan)\r\n20–25 HST (fase anakan)', '1–2 kali selama masa tanam', 1360.00, 'kg', 'uploads/pupuk/9b3fe7b3-24ae-40d6-bcf6-429d49005b71.jpg', '2026-04-18 02:57:49', '2026-04-20 23:33:05');

-- --------------------------------------------------------

--
-- Table structure for table `rating_pestisida`
--

CREATE TABLE `rating_pestisida` (
  `id` bigint UNSIGNED NOT NULL,
  `id_pestisida` bigint UNSIGNED NOT NULL,
  `id_kriteria` bigint UNSIGNED NOT NULL,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `nilai` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rating_pestisida`
--

INSERT INTO `rating_pestisida` (`id`, `id_pestisida`, `id_kriteria`, `id_penyakit`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(2, 1, 2, 1, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(3, 1, 3, 1, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(4, 1, 4, 1, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(5, 2, 1, 1, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(6, 2, 2, 1, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(7, 2, 3, 1, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(8, 2, 4, 1, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(9, 3, 1, 1, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(10, 3, 2, 1, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(11, 3, 3, 1, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(12, 3, 4, 1, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(13, 4, 1, 1, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(14, 4, 2, 1, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(15, 4, 3, 1, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(16, 4, 4, 1, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(17, 5, 1, 1, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(18, 5, 2, 1, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(19, 5, 3, 1, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(20, 5, 4, 1, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(21, 6, 1, 1, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(22, 6, 2, 1, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(23, 6, 3, 1, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(24, 6, 4, 1, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(25, 1, 1, 2, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(26, 1, 2, 2, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(27, 1, 3, 2, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(28, 1, 4, 2, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(29, 2, 1, 2, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(30, 2, 2, 2, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(31, 2, 3, 2, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(32, 2, 4, 2, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(33, 3, 1, 2, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(34, 3, 2, 2, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(35, 3, 3, 2, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(36, 3, 4, 2, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(37, 4, 1, 2, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(38, 4, 2, 2, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(39, 4, 3, 2, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(40, 4, 4, 2, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(41, 5, 1, 2, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(42, 5, 2, 2, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(43, 5, 3, 2, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(44, 5, 4, 2, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(45, 6, 1, 2, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(46, 6, 2, 2, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(47, 6, 3, 2, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(48, 6, 4, 2, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(49, 1, 1, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(50, 1, 2, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(51, 1, 3, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(52, 1, 4, 3, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(53, 2, 1, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(54, 2, 2, 3, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(55, 2, 3, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(56, 2, 4, 3, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(57, 3, 1, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(58, 3, 2, 3, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(59, 3, 3, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(60, 3, 4, 3, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(61, 4, 1, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(62, 4, 2, 3, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(63, 4, 3, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(64, 4, 4, 3, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(65, 5, 1, 3, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(66, 5, 2, 3, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(67, 5, 3, 3, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(68, 5, 4, 3, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(69, 6, 1, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(70, 6, 2, 3, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(71, 6, 3, 3, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(72, 6, 4, 3, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(73, 1, 1, 4, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(74, 1, 2, 4, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(75, 1, 3, 4, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(76, 1, 4, 4, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(77, 2, 1, 4, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(78, 2, 2, 4, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(79, 2, 3, 4, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(80, 2, 4, 4, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(81, 3, 1, 4, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(82, 3, 2, 4, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(83, 3, 3, 4, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(84, 3, 4, 4, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(85, 4, 1, 4, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(86, 4, 2, 4, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(87, 4, 3, 4, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(88, 4, 4, 4, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(89, 5, 1, 4, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(90, 5, 2, 4, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(91, 5, 3, 4, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(92, 5, 4, 4, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(93, 6, 1, 4, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(94, 6, 2, 4, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(95, 6, 3, 4, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(96, 6, 4, 4, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(97, 1, 1, 5, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(98, 1, 2, 5, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(99, 1, 3, 5, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(100, 1, 4, 5, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(101, 2, 1, 5, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(102, 2, 2, 5, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(103, 2, 3, 5, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(104, 2, 4, 5, 2.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(105, 3, 1, 5, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(106, 3, 2, 5, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(107, 3, 3, 5, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(108, 3, 4, 5, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(109, 4, 1, 5, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(110, 4, 2, 5, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(111, 4, 3, 5, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(112, 4, 4, 5, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(113, 5, 1, 5, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(114, 5, 2, 5, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(115, 5, 3, 5, 1.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(116, 5, 4, 5, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(117, 6, 1, 5, 4.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(118, 6, 2, 5, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(119, 6, 3, 5, 5.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50'),
(120, 6, 4, 5, 3.00, '2026-04-18 02:57:50', '2026-04-18 02:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `rating_pupuk`
--

CREATE TABLE `rating_pupuk` (
  `id` bigint UNSIGNED NOT NULL,
  `id_pupuk` bigint UNSIGNED NOT NULL,
  `id_kriteria` bigint UNSIGNED NOT NULL,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `nilai` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rating_pupuk`
--

INSERT INTO `rating_pupuk` (`id`, `id_pupuk`, `id_kriteria`, `id_penyakit`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5.00, '2026-04-18 02:57:49', '2026-04-21 03:50:23'),
(2, 1, 2, 1, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(3, 1, 3, 1, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(4, 1, 4, 1, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(5, 2, 1, 1, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(6, 2, 2, 1, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(7, 2, 3, 1, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(8, 2, 4, 1, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(9, 3, 1, 1, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(10, 3, 2, 1, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(11, 3, 3, 1, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(12, 3, 4, 1, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(13, 4, 1, 1, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(14, 4, 2, 1, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(15, 4, 3, 1, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(16, 4, 4, 1, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(17, 5, 1, 1, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(18, 5, 2, 1, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(19, 5, 3, 1, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(20, 5, 4, 1, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(21, 6, 1, 1, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(22, 6, 2, 1, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(23, 6, 3, 1, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(24, 6, 4, 1, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(25, 1, 1, 2, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(26, 1, 2, 2, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(27, 1, 3, 2, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(28, 1, 4, 2, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(29, 2, 1, 2, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(30, 2, 2, 2, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(31, 2, 3, 2, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(32, 2, 4, 2, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(33, 3, 1, 2, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(34, 3, 2, 2, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(35, 3, 3, 2, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(36, 3, 4, 2, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(37, 4, 1, 2, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(38, 4, 2, 2, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(39, 4, 3, 2, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(40, 4, 4, 2, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(41, 5, 1, 2, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(42, 5, 2, 2, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(43, 5, 3, 2, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(44, 5, 4, 2, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(45, 6, 1, 2, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(46, 6, 2, 2, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(47, 6, 3, 2, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(48, 6, 4, 2, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(49, 1, 1, 3, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(50, 1, 2, 3, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(51, 1, 3, 3, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(52, 1, 4, 3, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(53, 2, 1, 3, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(54, 2, 2, 3, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(55, 2, 3, 3, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(56, 2, 4, 3, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(57, 3, 1, 3, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(58, 3, 2, 3, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(59, 3, 3, 3, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(60, 3, 4, 3, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(61, 4, 1, 3, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(62, 4, 2, 3, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(63, 4, 3, 3, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(64, 4, 4, 3, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(65, 5, 1, 3, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(66, 5, 2, 3, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(67, 5, 3, 3, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(68, 5, 4, 3, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(69, 6, 1, 3, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(70, 6, 2, 3, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(71, 6, 3, 3, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(72, 6, 4, 3, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(73, 1, 1, 4, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(74, 1, 2, 4, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(75, 1, 3, 4, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(76, 1, 4, 4, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(77, 2, 1, 4, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(78, 2, 2, 4, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(79, 2, 3, 4, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(80, 2, 4, 4, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(81, 3, 1, 4, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(82, 3, 2, 4, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(83, 3, 3, 4, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(84, 3, 4, 4, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(85, 4, 1, 4, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(86, 4, 2, 4, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(87, 4, 3, 4, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(88, 4, 4, 4, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(89, 5, 1, 4, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(90, 5, 2, 4, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(91, 5, 3, 4, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(92, 5, 4, 4, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(93, 6, 1, 4, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(94, 6, 2, 4, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(95, 6, 3, 4, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(96, 6, 4, 4, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(97, 1, 1, 5, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(98, 1, 2, 5, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(99, 1, 3, 5, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(100, 1, 4, 5, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(101, 2, 1, 5, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(102, 2, 2, 5, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(103, 2, 3, 5, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(104, 2, 4, 5, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(105, 3, 1, 5, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(106, 3, 2, 5, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(107, 3, 3, 5, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(108, 3, 4, 5, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(109, 4, 1, 5, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(110, 4, 2, 5, 1.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(111, 4, 3, 5, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(112, 4, 4, 5, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(113, 5, 1, 5, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(114, 5, 2, 5, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(115, 5, 3, 5, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(116, 5, 4, 5, 5.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(117, 6, 1, 5, 2.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(118, 6, 2, 5, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(119, 6, 3, 5, 3.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49'),
(120, 6, 4, 5, 4.00, '2026-04-18 02:57:49', '2026-04-18 02:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `rekomendasi`
--

CREATE TABLE `rekomendasi` (
  `id` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `preferensi_label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferensi_pengguna` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rekomendasi`
--

INSERT INTO `rekomendasi` (`id`, `id_user`, `id_penyakit`, `tanggal`, `preferensi_label`, `preferensi_pengguna`, `created_at`, `updated_at`) VALUES
(7, 15, 1, '2026-04-21 04:26:30', 'Efektivitas Maksimal', '{\"alasan\": null, \"preset\": \"efektif\", \"catatan\": null, \"kriteria\": [{\"id\": 1, \"kode\": \"C1\", \"nama\": \"Jenis Penyakit\", \"jenis\": \"benefit\", \"bobot_awal\": 0.35, \"bobot_final\": 0.35, \"preferensi_user\": 3}, {\"id\": 2, \"kode\": \"C2\", \"nama\": \"Harga\", \"jenis\": \"cost\", \"bobot_awal\": 0.25, \"bobot_final\": 0.25, \"preferensi_user\": 3}, {\"id\": 3, \"kode\": \"C3\", \"nama\": \"Efektivitas\", \"jenis\": \"benefit\", \"bobot_awal\": 0.25, \"bobot_final\": 0.25, \"preferensi_user\": 3}, {\"id\": 4, \"kode\": \"C4\", \"nama\": \"Dampak Lingkungan\", \"jenis\": \"cost\", \"bobot_awal\": 0.15, \"bobot_final\": 0.15, \"preferensi_user\": 3}], \"preset_label\": \"Efektivitas Maksimal\", \"gejala_terpilih\": [{\"id\": 1, \"kode\": \"G01\", \"gambar_url\": \"http://127.0.0.1:9000/uploads/gejala/fe6f8e79-5966-4c4b-b633-57f81394fa46.jpg\", \"nama_gejala\": \"Bercak belah ketupat (ujung runcing) pada daun\"}, {\"id\": 2, \"kode\": \"G02\", \"gambar_url\": \"http://127.0.0.1:9000/uploads/gejala/a84aa884-d9b0-496d-a4dc-259b252a18b5.jpg\", \"nama_gejala\": \"Leher malai busuk, berubah warna coklat atau hitam dan patah\"}, {\"id\": 3, \"kode\": \"G03\", \"gambar_url\": \"http://127.0.0.1:9000/uploads/gejala/5d566fd8-423d-4f32-818d-fbedcd635dcf.jpg\", \"nama_gejala\": \"Bulir padi hampa atau tidak berisi\"}]}', '2026-04-21 04:26:30', '2026-04-21 04:26:30'),
(8, 15, 5, '2026-04-21 04:26:30', 'Efektivitas Maksimal', '{\"alasan\": null, \"preset\": \"efektif\", \"catatan\": null, \"kriteria\": [{\"id\": 1, \"kode\": \"C1\", \"nama\": \"Jenis Penyakit\", \"jenis\": \"benefit\", \"bobot_awal\": 0.35, \"bobot_final\": 0.35, \"preferensi_user\": 3}, {\"id\": 2, \"kode\": \"C2\", \"nama\": \"Harga\", \"jenis\": \"cost\", \"bobot_awal\": 0.25, \"bobot_final\": 0.25, \"preferensi_user\": 3}, {\"id\": 3, \"kode\": \"C3\", \"nama\": \"Efektivitas\", \"jenis\": \"benefit\", \"bobot_awal\": 0.25, \"bobot_final\": 0.25, \"preferensi_user\": 3}, {\"id\": 4, \"kode\": \"C4\", \"nama\": \"Dampak Lingkungan\", \"jenis\": \"cost\", \"bobot_awal\": 0.15, \"bobot_final\": 0.15, \"preferensi_user\": 3}], \"preset_label\": \"Efektivitas Maksimal\", \"gejala_terpilih\": [{\"id\": 1, \"kode\": \"G01\", \"gambar_url\": \"http://127.0.0.1:9000/uploads/gejala/fe6f8e79-5966-4c4b-b633-57f81394fa46.jpg\", \"nama_gejala\": \"Bercak belah ketupat (ujung runcing) pada daun\"}, {\"id\": 2, \"kode\": \"G02\", \"gambar_url\": \"http://127.0.0.1:9000/uploads/gejala/a84aa884-d9b0-496d-a4dc-259b252a18b5.jpg\", \"nama_gejala\": \"Leher malai busuk, berubah warna coklat atau hitam dan patah\"}, {\"id\": 3, \"kode\": \"G03\", \"gambar_url\": \"http://127.0.0.1:9000/uploads/gejala/5d566fd8-423d-4f32-818d-fbedcd635dcf.jpg\", \"nama_gejala\": \"Bulir padi hampa atau tidak berisi\"}]}', '2026-04-21 04:26:30', '2026-04-21 04:26:30'),
(9, 17, 5, '2026-04-24 15:32:55', 'Efektivitas Maksimal', '{\"alasan\": null, \"preset\": \"efektif\", \"catatan\": null, \"kriteria\": [{\"id\": 1, \"kode\": \"C1\", \"nama\": \"Jenis Penyakit\", \"jenis\": \"benefit\", \"bobot_awal\": 0.35, \"bobot_final\": 0.35, \"preferensi_user\": 3}, {\"id\": 2, \"kode\": \"C2\", \"nama\": \"Harga\", \"jenis\": \"cost\", \"bobot_awal\": 0.25, \"bobot_final\": 0.25, \"preferensi_user\": 3}, {\"id\": 3, \"kode\": \"C3\", \"nama\": \"Efektivitas\", \"jenis\": \"benefit\", \"bobot_awal\": 0.25, \"bobot_final\": 0.25, \"preferensi_user\": 3}, {\"id\": 4, \"kode\": \"C4\", \"nama\": \"Dampak Lingkungan\", \"jenis\": \"cost\", \"bobot_awal\": 0.15, \"bobot_final\": 0.15, \"preferensi_user\": 3}], \"preset_label\": \"Efektivitas Maksimal\", \"gejala_terpilih\": [{\"id\": 3, \"kode\": \"G03\", \"gambar_url\": \"http://127.0.0.1:9000/uploads/gejala/5d566fd8-423d-4f32-818d-fbedcd635dcf.jpg\", \"nama_gejala\": \"Bulir padi hampa atau tidak berisi\"}, {\"id\": 7, \"kode\": \"G07\", \"gambar_url\": \"http://127.0.0.1:9000/uploads/gejala/703bd200-fe19-4200-a67b-9aab9a670b0a.jpg\", \"nama_gejala\": \"Tanaman menjadi sangat kerdil dibanding tanaman sehat\"}, {\"id\": 14, \"kode\": \"G14\", \"gambar_url\": \"http://127.0.0.1:9000/uploads/gejala/1ed0ec46-f86a-4b8b-8c70-b8e25202fe83.png\", \"nama_gejala\": \"Bercak hitam atau coklat pada kulit gabah\"}]}', '2026-04-24 15:32:55', '2026-04-24 15:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('KgehVyU3OosDlPCPLsLZ1HZUR1neUWJPeg1jJ1BR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSGVYeEx5bVNXNGZua3ZFOXE3U1p4SXRwM25kRmxNWnVZRXZCWVpEcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL3Jla29tZW5kYXNpL3ByZXZpZXcvY2V0YWsiO3M6NToicm91dGUiO3M6MzA6InVzZXIucmVrb21lbmRhc2kucHJldmlldy5jZXRhayI7fXM6MTY6ImRpYWdub3Npc19yZXN1bHQiO2E6NDp7czoxMjoic2tvclBlbnlha2l0IjthOjM6e2k6MDthOjk6e3M6ODoicGVueWFraXQiO086MTk6IkFwcFxNb2RlbHNcUGVueWFraXQiOjMzOntzOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjg6InBlbnlha2l0IjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6Nzp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJQMDEiO3M6NDoibmFtYSI7czoxMjoiQmxhc3QgKEJsYXMpIjtzOjk6ImRlc2tyaXBzaSI7czo5NToiUGVueWFraXQgeWFuZyBkaXNlYmFia2FuIGphbXVyIFB5cmljdWxhcmlhIG9yeXphZS4gVW11bW55YSBtZW55ZXJhbmcgZGF1biBkYW4gbGVoZXIgbWFsYWkgcGFkaS4iO3M6NjoiZ2FtYmFyIjtzOjU3OiJ1cGxvYWRzL3Blbnlha2l0LzQyOTc2YzhjLTczZDAtNDRmNS1iOGI3LTBmMjFhZDQxOTMyOS5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6MDY6MDYiO31zOjExOiIAKgBvcmlnaW5hbCI7YTo3OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IlAwMSI7czo0OiJuYW1hIjtzOjEyOiJCbGFzdCAoQmxhcykiO3M6OToiZGVza3JpcHNpIjtzOjk1OiJQZW55YWtpdCB5YW5nIGRpc2ViYWJrYW4gamFtdXIgUHlyaWN1bGFyaWEgb3J5emFlLiBVbXVtbnlhIG1lbnllcmFuZyBkYXVuIGRhbiBsZWhlciBtYWxhaSBwYWRpLiI7czo2OiJnYW1iYXIiO3M6NTc6InVwbG9hZHMvcGVueWFraXQvNDI5NzZjOGMtNzNkMC00NGY1LWI4YjctMGYyMWFkNDE5MzI5LmpwZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDowNjowNiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo2OiJnZWphbGEiO086Mzk6IklsbHVtaW5hdGVcRGF0YWJhc2VcRWxvcXVlbnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTo0OntpOjA7TzoxNzoiQXBwXE1vZGVsc1xHZWphbGEiOjMzOntzOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjY6ImdlamFsYSI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjY6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czo2OiJnYW1iYXIiO3M6NTU6InVwbG9hZHMvZ2VqYWxhL2ZlNmY4ZTc5LTU5NjYtNGM0Yi1iNjMzLTU3ZjgxMzk0ZmE0Ni5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6NDk6MDAiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMDp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJHMDEiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ2OiJCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjY6ImdhbWJhciI7czo1NToidXBsb2Fkcy9nZWphbGEvZmU2ZjhlNzktNTk2Ni00YzRiLWI2MzMtNTdmODEzOTRmYTQ2LmpwZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDo0OTowMCI7czoxNzoicGl2b3RfaWRfcGVueWFraXQiO2k6MTtzOjE1OiJwaXZvdF9pZF9nZWphbGEiO2k6MTtzOjg6InBpdm90X21iIjtzOjU6IjAuOTAwIjtzOjg6InBpdm90X21kIjtzOjU6IjAuMDUwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YToxOntzOjU6InBpdm90IjtPOjQ0OiJJbGx1bWluYXRlXERhdGFiYXNlXEVsb3F1ZW50XFJlbGF0aW9uc1xQaXZvdCI6Mzc6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO047czo4OiIAKgB0YWJsZSI7czoxNToicGVueWFraXRfZ2VqYWxhIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjA7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6NDp7czoxMToiaWRfcGVueWFraXQiO2k6MTtzOjk6ImlkX2dlamFsYSI7aToxO3M6MjoibWIiO3M6NToiMC45MDAiO3M6MjoibWQiO3M6NToiMC4wNTAiO31zOjExOiIAKgBvcmlnaW5hbCI7YTo0OntzOjExOiJpZF9wZW55YWtpdCI7aToxO3M6OToiaWRfZ2VqYWxhIjtpOjE7czoyOiJtYiI7czo1OiIwLjkwMCI7czoyOiJtZCI7czo1OiIwLjA1MCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjA7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YTowOnt9czoxMToicGl2b3RQYXJlbnQiO086MTk6IkFwcFxNb2RlbHNcUGVueWFraXQiOjMzOntzOjEzOiIAKgBjb25uZWN0aW9uIjtOO3M6ODoiACoAdGFibGUiO3M6ODoicGVueWFraXQiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MDtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTowOnt9czoxMToiACoAb3JpZ2luYWwiO2E6MDp7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTo0OntpOjA7czo0OiJrb2RlIjtpOjE7czo0OiJuYW1hIjtpOjI7czo5OiJkZXNrcmlwc2kiO2k6MztzOjY6ImdhbWJhciI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1zOjEyOiJwaXZvdFJlbGF0ZWQiO086MTc6IkFwcFxNb2RlbHNcR2VqYWxhIjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7TjtzOjg6IgAqAHRhYmxlIjtzOjY6ImdlamFsYSI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjowO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjA6e31zOjExOiIAKgBvcmlnaW5hbCI7YTowOnt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjM6e2k6MDtzOjQ6ImtvZGUiO2k6MTtzOjExOiJuYW1hX2dlamFsYSI7aToyO3M6NjoiZ2FtYmFyIjt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fXM6MTM6IgAqAGZvcmVpZ25LZXkiO3M6MTE6ImlkX3Blbnlha2l0IjtzOjEzOiIAKgByZWxhdGVkS2V5IjtzOjk6ImlkX2dlamFsYSI7fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjI3OiIAKgByZWxhdGlvbkF1dG9sb2FkQ2FsbGJhY2siO047czoyNjoiACoAcmVsYXRpb25BdXRvbG9hZENvbnRleHQiO047czoxMDoidGltZXN0YW1wcyI7YjoxO3M6MTM6InVzZXNVbmlxdWVJZHMiO2I6MDtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6Mzp7aTowO3M6NDoia29kZSI7aToxO3M6MTE6Im5hbWFfZ2VqYWxhIjtpOjI7czo2OiJnYW1iYXIiO31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxO086MTc6IkFwcFxNb2RlbHNcR2VqYWxhIjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo2OiJnZWphbGEiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTo2OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IkcwMiI7czoxMToibmFtYV9nZWphbGEiO3M6NjA6IkxlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czo2OiJnYW1iYXIiO3M6NTU6InVwbG9hZHMvZ2VqYWxhL2E4NGFhODg0LWQ5YjAtNDk2ZC1hNGRjLTI1OWIyNTJhMThiNS5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6NTA6MTMiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMDp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6NjoiZ2FtYmFyIjtzOjU1OiJ1cGxvYWRzL2dlamFsYS9hODRhYTg4NC1kOWIwLTQ5NmQtYTRkYy0yNTliMjUyYTE4YjUuanBnIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTE4IDEwOjU3OjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTIxIDA0OjUwOjEzIjtzOjE3OiJwaXZvdF9pZF9wZW55YWtpdCI7aToxO3M6MTU6InBpdm90X2lkX2dlamFsYSI7aToyO3M6ODoicGl2b3RfbWIiO3M6NToiMC45MDAiO3M6ODoicGl2b3RfbWQiO3M6NToiMC4wNTAiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6NToicGl2b3QiO086NDQ6IklsbHVtaW5hdGVcRGF0YWJhc2VcRWxvcXVlbnRcUmVsYXRpb25zXFBpdm90IjozNzp7czoxMzoiACoAY29ubmVjdGlvbiI7TjtzOjg6IgAqAHRhYmxlIjtzOjE1OiJwZW55YWtpdF9nZWphbGEiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MDtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTo0OntzOjExOiJpZF9wZW55YWtpdCI7aToxO3M6OToiaWRfZ2VqYWxhIjtpOjI7czoyOiJtYiI7czo1OiIwLjkwMCI7czoyOiJtZCI7czo1OiIwLjA1MCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjE7czo5OiJpZF9nZWphbGEiO2k6MjtzOjI6Im1iIjtzOjU6IjAuOTAwIjtzOjI6Im1kIjtzOjU6IjAuMDUwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MDtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjA6e31zOjExOiJwaXZvdFBhcmVudCI7cjoxMzY7czoxMjoicGl2b3RSZWxhdGVkIjtyOjE3NTtzOjEzOiIAKgBmb3JlaWduS2V5IjtzOjExOiJpZF9wZW55YWtpdCI7czoxMzoiACoAcmVsYXRlZEtleSI7czo5OiJpZF9nZWphbGEiO319czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjM6e2k6MDtzOjQ6ImtvZGUiO2k6MTtzOjExOiJuYW1hX2dlamFsYSI7aToyO3M6NjoiZ2FtYmFyIjt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MjtPOjE3OiJBcHBcTW9kZWxzXEdlamFsYSI6MzM6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NjoiZ2VqYWxhIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6Njp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjY6ImdhbWJhciI7czo1NToidXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDo1MDozMCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEwOntzOjI6ImlkIjtpOjM7czo0OiJrb2RlIjtzOjM6IkcwMyI7czoxMToibmFtYV9nZWphbGEiO3M6MzQ6IkJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6NjoiZ2FtYmFyIjtzOjU1OiJ1cGxvYWRzL2dlamFsYS81ZDU2NmZkOC00MjNkLTRmMzItODE4ZC1mYmVkY2Q2MzVkY2YuanBnIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTE4IDEwOjU3OjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTIxIDA0OjUwOjMwIjtzOjE3OiJwaXZvdF9pZF9wZW55YWtpdCI7aToxO3M6MTU6InBpdm90X2lkX2dlamFsYSI7aTozO3M6ODoicGl2b3RfbWIiO3M6NToiMC43MDAiO3M6ODoicGl2b3RfbWQiO3M6NToiMC4xNTAiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6NToicGl2b3QiO086NDQ6IklsbHVtaW5hdGVcRGF0YWJhc2VcRWxvcXVlbnRcUmVsYXRpb25zXFBpdm90IjozNzp7czoxMzoiACoAY29ubmVjdGlvbiI7TjtzOjg6IgAqAHRhYmxlIjtzOjE1OiJwZW55YWtpdF9nZWphbGEiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MDtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTo0OntzOjExOiJpZF9wZW55YWtpdCI7aToxO3M6OToiaWRfZ2VqYWxhIjtpOjM7czoyOiJtYiI7czo1OiIwLjcwMCI7czoyOiJtZCI7czo1OiIwLjE1MCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjE7czo5OiJpZF9nZWphbGEiO2k6MztzOjI6Im1iIjtzOjU6IjAuNzAwIjtzOjI6Im1kIjtzOjU6IjAuMTUwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MDtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjA6e31zOjExOiJwaXZvdFBhcmVudCI7cjoxMzY7czoxMjoicGl2b3RSZWxhdGVkIjtyOjE3NTtzOjEzOiIAKgBmb3JlaWduS2V5IjtzOjExOiJpZF9wZW55YWtpdCI7czoxMzoiACoAcmVsYXRlZEtleSI7czo5OiJpZF9nZWphbGEiO319czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjM6e2k6MDtzOjQ6ImtvZGUiO2k6MTtzOjExOiJuYW1hX2dlamFsYSI7aToyO3M6NjoiZ2FtYmFyIjt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MztPOjE3OiJBcHBcTW9kZWxzXEdlamFsYSI6MzM6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NjoiZ2VqYWxhIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6Njp7czoyOiJpZCI7aToxNDtzOjQ6ImtvZGUiO3M6MzoiRzE0IjtzOjExOiJuYW1hX2dlamFsYSI7czo0MToiQmVyY2FrIGhpdGFtIGF0YXUgY29rbGF0IHBhZGEga3VsaXQgZ2FiYWgiO3M6NjoiZ2FtYmFyIjtzOjU1OiJ1cGxvYWRzL2dlamFsYS8xZWQwZWM0Ni1mODZhLTRiOGItOGM3MC1iOGUyNTIwMmZlODMucG5nIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTE4IDEwOjU3OjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTIxIDA1OjAxOjIxIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTA6e3M6MjoiaWQiO2k6MTQ7czo0OiJrb2RlIjtzOjM6IkcxNCI7czoxMToibmFtYV9nZWphbGEiO3M6NDE6IkJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjY6ImdhbWJhciI7czo1NToidXBsb2Fkcy9nZWphbGEvMWVkMGVjNDYtZjg2YS00YjhiLThjNzAtYjhlMjUyMDJmZTgzLnBuZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNTowMToyMSI7czoxNzoicGl2b3RfaWRfcGVueWFraXQiO2k6MTtzOjE1OiJwaXZvdF9pZF9nZWphbGEiO2k6MTQ7czo4OiJwaXZvdF9tYiI7czo1OiIwLjY1MCI7czo4OiJwaXZvdF9tZCI7czo1OiIwLjIwMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo1OiJwaXZvdCI7Tzo0NDoiSWxsdW1pbmF0ZVxEYXRhYmFzZVxFbG9xdWVudFxSZWxhdGlvbnNcUGl2b3QiOjM3OntzOjEzOiIAKgBjb25uZWN0aW9uIjtOO3M6ODoiACoAdGFibGUiO3M6MTU6InBlbnlha2l0X2dlamFsYSI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjowO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjE7czo5OiJpZF9nZWphbGEiO2k6MTQ7czoyOiJtYiI7czo1OiIwLjY1MCI7czoyOiJtZCI7czo1OiIwLjIwMCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjE7czo5OiJpZF9nZWphbGEiO2k6MTQ7czoyOiJtYiI7czo1OiIwLjY1MCI7czoyOiJtZCI7czo1OiIwLjIwMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjA7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YTowOnt9czoxMToicGl2b3RQYXJlbnQiO3I6MTM2O3M6MTI6InBpdm90UmVsYXRlZCI7cjoxNzU7czoxMzoiACoAZm9yZWlnbktleSI7czoxMToiaWRfcGVueWFraXQiO3M6MTM6IgAqAHJlbGF0ZWRLZXkiO3M6OToiaWRfZ2VqYWxhIjt9fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTozOntpOjA7czo0OiJrb2RlIjtpOjE7czoxMToibmFtYV9nZWphbGEiO2k6MjtzOjY6ImdhbWJhciI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX19czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjQ6e2k6MDtzOjQ6ImtvZGUiO2k6MTtzOjQ6Im5hbWEiO2k6MjtzOjk6ImRlc2tyaXBzaSI7aTozO3M6NjoiZ2FtYmFyIjt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fXM6NToiY29jb2siO2k6MztzOjU6InRvdGFsIjtpOjQ7czo2OiJwZXJzZW4iO2Q6OTQ7czoxMDoiY29uZmlkZW5jZSI7ZDowLjg3MTk1Njg7czo2OiJjZl9yYXciO2Q6MC44NzE5NTY4O3M6MTQ6ImludGVycHJldGF0aW9uIjthOjM6e3M6NToibGFiZWwiO3M6MTM6IlNhbmdhdCBUaW5nZ2kiO3M6NToiY29sb3IiO3M6Nzoic3VjY2VzcyI7czo0OiJpY29uIjtzOjY6IuKck+KckyI7fXM6MTg6Im1hdGNoZWRfZ2VqYWxhX2lkcyI7YTozOntpOjA7aToxO2k6MTtpOjI7aToyO2k6Mzt9czoyMToibWF0Y2hlZF9nZWphbGFfZGV0YWlsIjthOjM6e2k6MDthOjc6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2ZlNmY4ZTc5LTU5NjYtNGM0Yi1iNjMzLTU3ZjgxMzk0ZmE0Ni5qcGciO3M6MjoibWIiO2Q6MC45O3M6MjoibWQiO2Q6MC4wNTtzOjI6ImNmIjtkOjAuODU7fWk6MTthOjc6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6MzoiRzAyIjtzOjExOiJuYW1hX2dlamFsYSI7czo2MDoiTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvYTg0YWE4ODQtZDliMC00OTZkLWE0ZGMtMjU5YjI1MmExOGI1LmpwZyI7czoyOiJtYiI7ZDowLjk7czoyOiJtZCI7ZDowLjA1O3M6MjoiY2YiO2Q6MC44NTt9aToyO2E6Nzp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7czoyOiJtYiI7ZDowLjc7czoyOiJtZCI7ZDowLjE1O3M6MjoiY2YiO2Q6MC41NTt9fX1pOjE7YTo5OntzOjg6InBlbnlha2l0IjtPOjE5OiJBcHBcTW9kZWxzXFBlbnlha2l0IjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo4OiJwZW55YWtpdCI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjc6e3M6MjoiaWQiO2k6NDtzOjQ6ImtvZGUiO3M6MzoiUDA0IjtzOjQ6Im5hbWEiO3M6Mjk6IkJ1c3VrIFBlbGVwYWggKFNoZWF0aCBCbGlnaHQpIjtzOjk6ImRlc2tyaXBzaSI7czo4MjoiUGVueWFraXQgeWFuZyBkaXNlYmFia2FuIGphbXVyIFJoaXpvY3RvbmlhIHNvbGFuaSBkYW4gbWVueWVyYW5nIHBlbGVwYWggZGF1biBwYWRpLiI7czo2OiJnYW1iYXIiO3M6NTc6InVwbG9hZHMvcGVueWFraXQvMDQyNWU3ODAtYjA0Ny00YTk2LWFiOWYtNDI4NmY2ODA0ZWM4LmpwZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDowNzowMSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjc6e3M6MjoiaWQiO2k6NDtzOjQ6ImtvZGUiO3M6MzoiUDA0IjtzOjQ6Im5hbWEiO3M6Mjk6IkJ1c3VrIFBlbGVwYWggKFNoZWF0aCBCbGlnaHQpIjtzOjk6ImRlc2tyaXBzaSI7czo4MjoiUGVueWFraXQgeWFuZyBkaXNlYmFia2FuIGphbXVyIFJoaXpvY3RvbmlhIHNvbGFuaSBkYW4gbWVueWVyYW5nIHBlbGVwYWggZGF1biBwYWRpLiI7czo2OiJnYW1iYXIiO3M6NTc6InVwbG9hZHMvcGVueWFraXQvMDQyNWU3ODAtYjA0Ny00YTk2LWFiOWYtNDI4NmY2ODA0ZWM4LmpwZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAy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bGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjQ6e2k6MDtzOjQ6ImtvZGUiO2k6MTtzOjQ6Im5hbWEiO2k6MjtzOjk6ImRlc2tyaXBzaSI7aTozO3M6NjoiZ2FtYmFyIjt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fXM6NToiY29jb2siO2k6MTtzOjU6InRvdGFsIjtpOjM7czo2OiJwZXJzZW4iO2Q6NTk7czoxMDoiY29uZmlkZW5jZSI7ZDowLjE4Mjg1Njk2O3M6NjoiY2ZfcmF3IjtkOjAuMTgyODU2OTY7czoxNDoiaW50ZXJwcmV0YXRpb24iO2E6Mzp7czo1OiJsYWJlbCI7czoxMzoiU2FuZ2F0IFJlbmRhaCI7czo1OiJjb2xvciI7czo2OiJkYW5nZXIiO3M6NDoiaWNvbiI7czoxOiI/Ijt9czoxODoibWF0Y2hlZF9nZWphbGFfaWRzIjthOjE6e2k6MDtpOjU7fXM6MjE6Im1hdGNoZWRfZ2VqYWxhX2RldGFpbCI7YToxOntpOjA7YTo3OntzOjI6ImlkIjtpOjU7czo0OiJrb2RlIjtzOjM6IkcwNSI7czoxMToibmFtYV9nZWphbGEiO3M6NTQ6IlRlcGkgZGF1biBtZW5nZXJpbmcsIGJlcmdlbG9tYmFuZywgZGFuIGJlcndhcm5hIGtlbGFidSI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzE4MzliNDE4LWEwNGMtNDgwYy1hMGNjLTgwMmI0NjhmYjFkYS5wbmciO3M6MjoibWIiO2Q6MC45O3M6MjoibWQiO2Q6MC41O3M6MjoiY2YiO2Q6MC40O319fX1zOjEwOiJnZWphbGFfaWRzIjthOjQ6e2k6MDtpOjE7aToxO2k6MjtpOjI7aTozO2k6MztpOjU7fXM6MTQ6ImdlamFsYV93ZWlnaHRzIjthOjQ6e2k6MTtkOjgwO2k6MjtkOjgwO2k6MztkOjgwO2k6NTtkOjgwO31zOjc6InN1bW1hcnkiO2E6NTp7czoxMzoidG9wX2RpYWdub3NpcyI7YTo5OntzOjg6InBlbnlha2l0IjtyOjEyO3M6NToiY29jb2siO2k6MztzOjU6InRvdGFsIjtpOjQ7czo2OiJwZXJzZW4iO2Q6OTQ7czoxMDoiY29uZmlkZW5jZSI7ZDowLjg3MTk1Njg7czo2OiJjZl9yYXciO2Q6MC44NzE5NTY4O3M6MTQ6ImludGVycHJldGF0aW9uIjthOjM6e3M6NToibGFiZWwiO3M6MTM6IlNhbmdhdCBUaW5nZ2kiO3M6NToiY29sb3IiO3M6Nzoic3VjY2VzcyI7czo0OiJpY29uIjtzOjY6IuKck+KckyI7fXM6MTg6Im1hdGNoZWRfZ2VqYWxhX2lkcyI7YTozOntpOjA7aToxO2k6MTtpOjI7aToyO2k6Mzt9czoyMToibWF0Y2hlZF9nZWphbGFfZGV0YWlsIjthOjM6e2k6MDthOjc6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2ZlNmY4ZTc5LTU5NjYtNGM0Yi1iNjMzLTU3ZjgxMzk0ZmE0Ni5qcGciO3M6MjoibWIiO2Q6MC45O3M6MjoibWQiO2Q6MC4wNTtzOjI6ImNmIjtkOjAuODU7fWk6MTthOjc6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6MzoiRzAyIjtzOjExOiJuYW1hX2dlamFsYSI7czo2MDoiTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvYTg0YWE4ODQtZDliMC00OTZkLWE0ZGMtMjU5YjI1MmExOGI1LmpwZyI7czoyOiJtYiI7ZDowLjk7czoyOiJtZCI7ZDowLjA1O3M6MjoiY2YiO2Q6MC44NTt9aToyO2E6Nzp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7czoyOiJtYiI7ZDowLjc7czoyOiJtZCI7ZDowLjE1O3M6MjoiY2YiO2Q6MC41NTt9fX1zOjEzOiJ0b3RhbF9tYXRjaGVzIjtpOjM7czoyMjoic2VsZWN0ZWRfc3ltcHRvbV90b3RhbCI7aTo0O3M6NjoibWV0aG9kIjtzOjE2OiJDZXJ0YWludHkgRmFjdG9yIjtzOjEwOiJjZl9mb3JtdWxhIjtzOjQ3OiJDRiA9IE1CIC0gTUQsIENGY29tYmluZSA9IENGMSArIENGMiAqICgxIC0gQ0YxKSI7fX1zOjE3OiJndWVzdF9yZWtvbWVuZGFzaSI7YToyOntzOjQ6Im1vZGUiO3M6NzoicHJldmlldyI7czo1OiJpdGVtcyI7YToxOntpOjA7YTo2OntzOjE0OiJyZWtvbWVuZGFzaV9pZCI7TjtzOjExOiJwZW55YWtpdF9pZCI7aToxO3M6MTM6InBlbnlha2l0X25hbWEiO3M6MTI6IkJsYXN0IChCbGFzKSI7czoxNjoicHJlZmVyZW5zaV9sYWJlbCI7czoxMToiSGVtYXQgQmlheWEiO3M6MTk6InByZWZlcmVuc2lfcGVuZ2d1bmEiO2E6NTp7czo2OiJhbGFzYW4iO047czo3OiJjYXRhdGFuIjtOO3M6MTU6ImdlamFsYV90ZXJwaWxpaCI7YTo0OntpOjA7YTo0OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IkcwMSI7czoxMToibmFtYV9nZWphbGEiO3M6NDY6IkJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9mZTZmOGU3OS01OTY2LTRjNGItYjYzMy01N2Y4MTM5NGZhNDYuanBnIjt9aToxO2E6NDp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9hODRhYTg4NC1kOWIwLTQ5NmQtYTRkYy0yNTliMjUyYTE4YjUuanBnIjt9aToyO2E6NDp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7fWk6MzthOjQ6e3M6MjoiaWQiO2k6NTtzOjQ6ImtvZGUiO3M6MzoiRzA1IjtzOjExOiJuYW1hX2dlamFsYSI7czo1NDoiVGVwaSBkYXVuIG1lbmdlcmluZywgYmVyZ2Vsb21iYW5nLCBkYW4gYmVyd2FybmEga2VsYWJ1IjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvMTgzOWI0MTgtYTA0Yy00ODBjLWEwY2MtODAyYjQ2OGZiMWRhLnBuZyI7fX1zOjg6ImtyaXRlcmlhIjthOjQ6e2k6MTtzOjI6IjYwIjtpOjI7czoyOiI2MCI7aTozO3M6MjoiNjAiO2k6NDtzOjI6IjYwIjt9czoxNDoiZ2VqYWxhX3dlaWdodHMiO2E6NDp7aToxO2Q6ODA7aToyO2Q6ODA7aTozO2Q6ODA7aTo1O2Q6ODA7fX1zOjc6InByZXZpZXciO2E6NTp7czo1OiJwdXB1ayI7YTozOntpOjA7YToxODp7czoyOiJpZCI7aTo0O3M6NDoia29kZSI7czo0OiJQSzA0IjtzOjQ6Im5hbWEiO3M6MzoiS0NsIjtzOjk6ImthbmR1bmdhbiI7czo1OiJLIDYwJSI7czoxNjoia2FuZHVuZ2FuX2RldGFpbCI7czo3MjoiS2FsaXVtIChL4oKCTyk6IMKxNjAlDQpLbG9yaWRhIChDbCk6IMKxNDUlDQpLYWRhciBhaXI6IHJlbmRhaCAowrEx4oCTMiUpIjtzOjEyOiJmdW5nc2lfdXRhbWEiO3M6MTQ0OiJNZW5pbmdrYXRrYW4ga2V0YWhhbmFuIHRhbmFtYW4gdGVyaGFkYXAgcGVueWFraXQsIG1lbXBlcmt1YXQgYmF0YW5nIGFnYXIgdGlkYWsgbXVkYWggcmViYWgsIHNlcnRhIG1lbmluZ2thdGthbiBrdWFsaXRhcyBkYW4gcGVuZ2lzaWFuIGJ1bGlyIHBhZGkiO3M6NzoidGFrYXJhbiI7czoxNjoiwrE3NeKAkzEwMCBrZy9oYSI7czoxMzoiY2FyYV9hcGxpa2FzaSI7czoxMDE6IkRpc2ViYXIgbWVyYXRhIGRpIGxhaGFuICh0YWJ1ciksIGJpc2EgZGliZXJpa2FuIGJlcnNhbWFhbiBkZW5nYW4gcHVwdWsgbGFpbiBwYWRhIGtvbmRpc2kgdGFuYWggbGVtYmFiIjtzOjE1OiJlZmVrX3BlbmdndW5hYW4iO3M6ODE6IlRhbmFtYW4gbGViaWgga3VhdCwgdGFoYW4gY2VrYW1hbiwgZGFuIGhhc2lsIHBhbmVuIGxlYmloIGJlcm5hcyBzZXJ0YSBiZXJrdWFsaXRhcyI7czoxMDoiZ2FtYmFyX3VybCI7czo3NjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvcHVwdWsvZGJmYWU5MTUtOGVhMy00YzJhLTk1YWEtYzYxMDdjNjQyYjBkLmpwZyI7czoxNzoiY2ZfcGVueWViYWJfdG90YWwiO2Q6LTAuOTk0NjtzOjE0OiJjZl9yZWtvbWVuZGFzaSI7ZDoxO3M6MTM6ImNmX3BlcmNlbnRhZ2UiO2Q6MTAwO3M6MTQ6ImludGVycHJldGF0aW9uIjthOjU6e3M6NToibGFiZWwiO3M6MjM6IlNhbmdhdCBEaXJla29tZW5kYXNpa2FuIjtzOjU6ImNvbG9yIjtzOjc6InN1Y2Nlc3MiO3M6NDoiaWNvbiI7czo2OiLinJPinJMiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjUyOiJSZWtvbWVuZGFzaSBzYW5nYXQga3VhdCBiZXJkYXNhcmthbiBhbmFsaXNpcyBnZWphbGEuIjtzOjExOiJiYWRnZV9jbGFzcyI7czoxMDoiYmctc3VjY2VzcyI7fXM6MTU6InN5bXB0b21fZGV0YWlscyI7YTo0OntpOjA7YTo2OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IkcwMSI7czoxMToibmFtYV9nZWphbGEiO3M6NDY6IkJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6MjoibWIiO2Q6MC4xO3M6MjoibWQiO2Q6MC44O3M6MTE6ImNmX3BlbnllYmFiIjtkOi0wLjc7fWk6MTthOjY6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6MzoiRzAyIjtzOjExOiJuYW1hX2dlamFsYSI7czo2MDoiTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjI6Im1iIjtkOjAuMTtzOjI6Im1kIjtkOjAuODtzOjExOiJjZl9wZW55ZWJhYiI7ZDotMC43O31pOjI7YTo2OntzOjI6ImlkIjtpOjM7czo0OiJrb2RlIjtzOjM6IkcwMyI7czoxMToibmFtYV9nZWphbGEiO3M6MzQ6IkJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6MjoibWIiO2Q6MC4xO3M6MjoibWQiO2Q6MC45O3M6MTE6ImNmX3BlbnllYmFiIjtkOi0wLjg7fWk6MzthOjY6e3M6MjoiaWQiO2k6NTtzOjQ6ImtvZGUiO3M6MzoiRzA1IjtzOjExOiJuYW1hX2dlamFsYSI7czo1NDoiVGVwaSBkYXVuIG1lbmdlcmluZywgYmVyZ2Vsb21iYW5nLCBkYW4gYmVyd2FybmEga2VsYWJ1IjtzOjI6Im1iIjtkOjAuMTtzOjI6Im1kIjtkOjAuODtzOjExOiJjZl9wZW55ZWJhYiI7ZDotMC43O319czoyMjoibWF0Y2hlZF9zeW1wdG9tc19jb3VudCI7aTo0O3M6OToicGVyaW5na2F0IjtpOjE7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7fWk6MTthOjE4OntzOjI6ImlkIjtpOjM7czo0OiJrb2RlIjtzOjQ6IlBLMDMiO3M6NDoibmFtYSI7czo1OiJTUC0zNiI7czo5OiJrYW5kdW5nYW4iO3M6NToiUCAzNiUiO3M6MTY6ImthbmR1bmdhbl9kZXRhaWwiO3M6MTQ0OiJGb3Nmb3IgKFDigoJP4oKFKSB0b3RhbDogwrEzNiUNCkZvc2ZvciBsYXJ1dCBkYWxhbSBhaXI6IMKxMzAlDQpGb3Nmb3IgbGFydXQgZGFsYW0gYXNhbSBzaXRyYXQ6IMKxMzQlDQpLYWxzaXVtIChDYSk6IMKxMTXigJMyMCUNClN1bGZ1ciAoUyk6IMKxNSUiO3M6MTI6ImZ1bmdzaV91dGFtYSI7czoxMDg6Ik1lcmFuZ3NhbmcgcGVydHVtYnVoYW4gYWthciwgbWVtcGVyY2VwYXQgcGVtYmVudHVrYW4gYW5ha2FuLCBzZXJ0YSBtZW1iYW50dSBwZW1iZW50dWthbiBidW5nYSBkYW4gYnVsaXIgcGFkaSI7czo3OiJ0YWthcmFuIjtzOjE3OiLCsTEwMOKAkzE1MCBrZy9oYSI7czoxMzoiY2FyYV9hcGxpa2FzaSI7czo5NzoiRGlzZWJhciBtZXJhdGEgZGkgbGFoYW4gZGFuIHNlYmFpa255YSBkaWNhbXB1ciBkZW5nYW4gdGFuYWggc2FhdCBwZW5nb2xhaGFuIGxhaGFuIGF0YXUgYXdhbCB0YW5hbSI7czoxNToiZWZla19wZW5nZ3VuYWFuIjtzOjgwOiJBa2FyIGxlYmloIGt1YXQsIHRhbmFtYW4gbGViaWggY2VwYXQgdHVtYnVoLCBkYW4gcGVtYmVudHVrYW4gbWFsYWkgbGViaWggb3B0aW1hbCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvcHVwdWsvYWU1NWY4YzQtNTQ2My00ZTdhLWIwMzUtODcyYzQ1ZjE3NmIxLmpwZyI7czoxNzoiY2ZfcGVueWViYWJfdG90YWwiO2Q6LTAuOTQ2O3M6MTQ6ImNmX3Jla29tZW5kYXNpIjtkOjAuOTc2O3M6MTM6ImNmX3BlcmNlbnRhZ2UiO2Q6OTguODtzOjE0OiJpbnRlcnByZXRhdGlvbiI7YTo1OntzOjU6ImxhYmVsIjtzOjIzOiJTYW5nYXQgRGlyZWtvbWVuZGFzaWthbiI7czo1OiJjb2xvciI7czo3OiJzdWNjZXNzIjtzOjQ6Imljb24iO3M6Njoi4pyT4pyTIjtzOjExOiJkZXNjcmlwdGlvbiI7czo1MjoiUmVrb21lbmRhc2kgc2FuZ2F0IGt1YXQgYmVyZGFzYXJrYW4gYW5hbGlzaXMgZ2VqYWxhLiI7czoxMToiYmFkZ2VfY2xhc3MiO3M6MTA6ImJnLXN1Y2Nlc3MiO31zOjE1OiJzeW1wdG9tX2RldGFpbHMiO2E6NDp7aTowO2E6Njp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJHMDEiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ2OiJCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjI6Im1iIjtkOjAuMTU7czoyOiJtZCI7ZDowLjU1O3M6MTE6ImNmX3BlbnllYmFiIjtkOi0wLjQ7fWk6MTthOjY6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6MzoiRzAyIjtzOjExOiJuYW1hX2dlamFsYSI7czo2MDoiTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjI6Im1iIjtkOjAuMjtzOjI6Im1kIjtkOjAuNjtzOjExOiJjZl9wZW55ZWJhYiI7ZDotMC40O31pOjI7YTo2OntzOjI6ImlkIjtpOjM7czo0OiJrb2RlIjtzOjM6IkcwMyI7czoxMToibmFtYV9nZWphbGEiO3M6MzQ6IkJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6MjoibWIiO2Q6MC4xO3M6MjoibWQiO2Q6MC44O3M6MTE6ImNmX3BlbnllYmFiIjtkOi0wLjc7fWk6MzthOjY6e3M6MjoiaWQiO2k6NTtzOjQ6ImtvZGUiO3M6MzoiRzA1IjtzOjExOiJuYW1hX2dlamFsYSI7czo1NDoiVGVwaSBkYXVuIG1lbmdlcmluZywgYmVyZ2Vsb21iYW5nLCBkYW4gYmVyd2FybmEga2VsYWJ1IjtzOjI6Im1iIjtkOjAuMTU7czoyOiJtZCI7ZDowLjY1O3M6MTE6ImNmX3BlbnllYmFiIjtkOi0wLjU7fX1zOjIyOiJtYXRjaGVkX3N5bXB0b21zX2NvdW50IjtpOjQ7czo5OiJwZXJpbmdrYXQiO2k6MjtzOjE4OiJwcmVmZXJlbmNlX2FwcGxpZWQiO2I6MTt9aToyO2E6MTg6e3M6MjoiaWQiO2k6NTtzOjQ6ImtvZGUiO3M6NDoiUEswNSI7czo0OiJuYW1hIjtzOjIwOiJQdXB1ayBPcmdhbmlrIEtvbXBvcyI7czo5OiJrYW5kdW5nYW4iO3M6MTY6IkMtb3JnYW5payDiiaUxNSUiO3M6MTY6ImthbmR1bmdhbl9kZXRhaWwiO3M6MTkzOiJCYWhhbiBvcmdhbmlrOiDCsTIw4oCTMzAlDQpOaXRyb2dlbiAoTik6IMKxMeKAkzIlDQpGb3Nmb3IgKFDigoJP4oKFKTogwrEwLjXigJMxJQ0KS2FsaXVtIChL4oKCTyk6IMKxMeKAkzIlDQpDL04gcmFzaW86IMKxMTDigJMyMA0KTWVuZ2FuZHVuZyB1bnN1ciBtaWtybyAoQ2EsIE1nLCBGZSwgWm4sIGRsbCkgZGFsYW0ganVtbGFoIGtlY2lsIjtzOjEyOiJmdW5nc2lfdXRhbWEiO3M6MTA3OiJNZW1wZXJiYWlraSBzdHJ1a3R1ciB0YW5haCwgbWVuaW5na2F0a2FuIGtlc3VidXJhbiB0YW5haCwgc2VydGEgbWVtYmFudHUgcGVueWVyYXBhbiB1bnN1ciBoYXJhIG9sZWggdGFuYW1hbiI7czo3OiJ0YWthcmFuIjtzOjE0OiLCsTLigJM1IHRvbi9oYSI7czoxMzoiY2FyYV9hcGxpa2FzaSI7czo3NzoiRGl0ZWJhciBtZXJhdGEgbGFsdSBkaWNhbXB1ciBkZW5nYW4gdGFuYWggc2FhdCBwZW5nb2xhaGFuIGxhaGFuIHNlYmVsdW0gdGFuYW0iO3M6MTU6ImVmZWtfcGVuZ2d1bmFhbiI7czo3NzoiVGFuYWggbGViaWggZ2VtYnVyLCBkYXlhIHNpbXBhbiBhaXIgbWVuaW5na2F0LCBkYW4gdGFuYW1hbiB0dW1idWggbGViaWggc2VoYXQiO3M6MTA6ImdhbWJhcl91cmwiO3M6NzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL3B1cHVrLzBhZjgzMzc4LWFjMmQtNDMyMS1iZjNkLTdjMGFkNGI5N2VkMy5qcGciO3M6MTc6ImNmX3BlbnllYmFiX3RvdGFsIjtkOi0wLjc5ODQ7czoxNDoiY2ZfcmVrb21lbmRhc2kiO2Q6MC44Mjg0O3M6MTM6ImNmX3BlcmNlbnRhZ2UiO2Q6OTEuNDI7czoxNDoiaW50ZXJwcmV0YXRpb24iO2E6NTp7czo1OiJsYWJlbCI7czoyMzoiU2FuZ2F0IERpcmVrb21lbmRhc2lrYW4iO3M6NToiY29sb3IiO3M6Nzoic3VjY2VzcyI7czo0OiJpY29uIjtzOjY6IuKck+KckyI7czoxMToiZGVzY3JpcHRpb24iO3M6NTI6IlJla29tZW5kYXNpIHNhbmdhdCBrdWF0IGJlcmRhc2Fya2FuIGFuYWxpc2lzIGdlamFsYS4iO3M6MTE6ImJhZGdlX2NsYXNzIjtzOjEwOiJiZy1zdWNjZXNzIjt9czoxNToic3ltcHRvbV9kZXRhaWxzIjthOjQ6e2k6MDthOjY6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czoyOiJtYiI7ZDowLjI7czoyOiJtZCI7ZDowLjU7czoxMToiY2ZfcGVueWViYWIiO2Q6LTAuMzt9aToxO2E6Njp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6MjoibWIiO2Q6MC4zO3M6MjoibWQiO2Q6MC41O3M6MTE6ImNmX3BlbnllYmFiIjtkOi0wLjI7fWk6MjthOjY6e3M6MjoiaWQiO2k6MztzOjQ6ImtvZGUiO3M6MzoiRzAzIjtzOjExOiJuYW1hX2dlamFsYSI7czozNDoiQnVsaXIgcGFkaSBoYW1wYSBhdGF1IHRpZGFrIGJlcmlzaSI7czoyOiJtYiI7ZDowLjI7czoyOiJtZCI7ZDowLjY7czoxMToiY2ZfcGVueWViYWIiO2Q6LTAuNDt9aTozO2E6Njp7czoyOiJpZCI7aTo1O3M6NDoia29kZSI7czozOiJHMDUiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjU0OiJUZXBpIGRhdW4gbWVuZ2VyaW5nLCBiZXJnZWxvbWJhbmcsIGRhbiBiZXJ3YXJuYSBrZWxhYnUiO3M6MjoibWIiO2Q6MC4yO3M6MjoibWQiO2Q6MC42O3M6MTE6ImNmX3BlbnllYmFiIjtkOi0wLjQ7fX1zOjIyOiJtYXRjaGVkX3N5bXB0b21zX2NvdW50IjtpOjQ7czo5OiJwZXJpbmdrYXQiO2k6MztzOjE4OiJwcmVmZXJlbmNlX2FwcGxpZWQiO2I6MTt9fXM6OToicGVzdGlzaWRhIjthOjI6e2k6MDthOjE3OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjQ6IlBTMDEiO3M6NDoibmFtYSI7czoxNzoiQW1pc3RhcnRvcCAzMjUgU0MiO3M6MTE6ImJhaGFuX2FrdGlmIjtzOjI5OiJBem9rc2lzdHJvYmluICsgRGlmZW5va29uYXpvbCI7czo2OiJmdW5nc2kiO3M6MTA4OiJGdW5naXNpZGEgc2lzdGVtaWsgdW50dWsgbWVuZ2VuZGFsaWthbiBwZW55YWtpdCBqYW11ciBwYWRhIHBhZGkgc2VwZXJ0aSBibGFzLCBiZXJjYWsgZGF1biwgZGFuIGhhd2FyIHBlbGVwYWgiO3M6NToiZG9zaXMiO3M6MTI6IjAsNeKAkzEgbWwvTCI7czoxMzoiY2FyYV9hcGxpa2FzaSI7czo4MDoiRGlzZW1wcm90a2FuIG1lcmF0YSBrZSBzZWx1cnVoIGJhZ2lhbiB0YW5hbWFuIHRlcnV0YW1hIGRhdW4sIG1lbmdndW5ha2FuIHNwcmF5ZXIiO3M6MTU6ImVmZWtfcGVuZ2d1bmFhbiI7czo5MzoiTWVuZ2hhbWJhdCBwZXJrZW1iYW5nYW4gamFtdXIsIG1lbmphZ2EgZGF1biB0ZXRhcCBzZWhhdCwgZGFuIG1lbmluZ2thdGthbiBwb3RlbnNpIGhhc2lsIHBhbmVuIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjgwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9wZXN0aXNpZGEvY2FmZmFmZGQtZTY4OS00NDE3LWEyZjgtMjdiYmRmYzQxMThjLmpwZyI7czoxNToiY2Zfc29sdXNpX3RvdGFsIjtkOjAuOTg2MjtzOjE0OiJjZl9yZWtvbWVuZGFzaSI7ZDoxO3M6MTM6ImNmX3BlcmNlbnRhZ2UiO2Q6MTAwO3M6MTQ6ImludGVycHJldGF0aW9uIjthOjU6e3M6NToibGFiZWwiO3M6MjM6IlNhbmdhdCBEaXJla29tZW5kYXNpa2FuIjtzOjU6ImNvbG9yIjtzOjc6InN1Y2Nlc3MiO3M6NDoiaWNvbiI7czo2OiLinJPinJMiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjUyOiJSZWtvbWVuZGFzaSBzYW5nYXQga3VhdCBiZXJkYXNhcmthbiBhbmFsaXNpcyBnZWphbGEuIjtzOjExOiJiYWRnZV9jbGFzcyI7czoxMDoiYmctc3VjY2VzcyI7fXM6MTU6InN5bXB0b21fZGV0YWlscyI7YTo0OntpOjA7YTo2OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IkcwMSI7czoxMToibmFtYV9nZWphbGEiO3M6NDY6IkJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6MjoibWIiO2Q6MC45O3M6MjoibWQiO2Q6MC4wNTtzOjk6ImNmX3NvbHVzaSI7ZDowLjg1O31pOjE7YTo2OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IkcwMiI7czoxMToibmFtYV9nZWphbGEiO3M6NjA6IkxlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czoyOiJtYiI7ZDowLjk7czoyOiJtZCI7ZDowLjA1O3M6OToiY2Zfc29sdXNpIjtkOjAuODU7fWk6MjthOjY6e3M6MjoiaWQiO2k6MztzOjQ6ImtvZGUiO3M6MzoiRzAzIjtzOjExOiJuYW1hX2dlamFsYSI7czozNDoiQnVsaXIgcGFkaSBoYW1wYSBhdGF1IHRpZGFrIGJlcmlzaSI7czoyOiJtYiI7ZDowLjc1O3M6MjoibWQiO2Q6MC4xNTtzOjk6ImNmX3NvbHVzaSI7ZDowLjY7fWk6MzthOjY6e3M6MjoiaWQiO2k6NTtzOjQ6ImtvZGUiO3M6MzoiRzA1IjtzOjExOiJuYW1hX2dlamFsYSI7czo1NDoiVGVwaSBkYXVuIG1lbmdlcmluZywgYmVyZ2Vsb21iYW5nLCBkYW4gYmVyd2FybmEga2VsYWJ1IjtzOjI6Im1iIjtkOjAuMjU7czoyOiJtZCI7ZDowLjY7czo5OiJjZl9zb2x1c2kiO2Q6LTAuMzU7fX1zOjIyOiJtYXRjaGVkX3N5bXB0b21zX2NvdW50IjtpOjQ7czo5OiJwZXJpbmdrYXQiO2k6MTtzOjE4OiJwcmVmZXJlbmNlX2FwcGxpZWQiO2I6MTt9aToxO2E6MTc6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6NDoiUFMwMiI7czo0OiJuYW1hIjtzOjEyOiJGaWxpYSA1MjUgU0UiO3M6MTE6ImJhaGFuX2FrdGlmIjtzOjI2OiJQcm9waWtvbmF6b2wgKyBUcmlzaWtsYXpvbCI7czo2OiJmdW5nc2kiO3M6MTAwOiJGdW5naXNpZGEgc2lzdGVtaWsgdW50dWsgbWVuZ2VuZGFsaWthbiBwZW55YWtpdCBqYW11ciBwYWRhIHBhZGkgdGVydXRhbWEgYmxhcyAoZGF1biBkYW4gbGVoZXIgbWFsYWkpIjtzOjU6ImRvc2lzIjtzOjEyOiIx4oCTMSw1IG1sL0wiO3M6MTM6ImNhcmFfYXBsaWthc2kiO3M6ODk6IkRpc2VtcHJvdGthbiBtZXJhdGEga2Ugc2VsdXJ1aCBiYWdpYW4gdGFuYW1hbiB0ZXJ1dGFtYSBkYXVuIGRhbiBtYWxhaSBtZW5nZ3VuYWthbiBzcHJheWVyIjtzOjE1OiJlZmVrX3BlbmdndW5hYW4iO3M6MTA2OiJNZW5la2FuIHBlcmtlbWJhbmdhbiBqYW11ciwgbWVsaW5kdW5naSBkYXVuIGRhbiBtYWxhaSwgc2VydGEgbWVuZ3VyYW5naSByaXNpa28gZ2FnYWwgcGFuZW4gYWtpYmF0IHBlbnlha2l0IjtzOjEwOiJnYW1iYXJfdXJsIjtzOjgwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9wZXN0aXNpZGEvZmMzNzU1OTEtN2NhYi00MzAwLWFmMzktZmNjNWVjMTEwMzcyLmpwZyI7czoxNToiY2Zfc29sdXNpX3RvdGFsIjtkOjAuOTQ3MTtzOjE0OiJjZl9yZWtvbWVuZGFzaSI7ZDowLjk3NzE7czoxMzoiY2ZfcGVyY2VudGFnZSI7ZDo5OC44NjtzOjE0OiJpbnRlcnByZXRhdGlvbiI7YTo1OntzOjU6ImxhYmVsIjtzOjIzOiJTYW5nYXQgRGlyZWtvbWVuZGFzaWthbiI7czo1OiJjb2xvciI7czo3OiJzdWNjZXNzIjtzOjQ6Imljb24iO3M6Njoi4pyT4pyTIjtzOjExOiJkZXNjcmlwdGlvbiI7czo1MjoiUmVrb21lbmRhc2kgc2FuZ2F0IGt1YXQgYmVyZGFzYXJrYW4gYW5hbGlzaXMgZ2VqYWxhLiI7czoxMToiYmFkZ2VfY2xhc3MiO3M6MTA6ImJnLXN1Y2Nlc3MiO31zOjE1OiJzeW1wdG9tX2RldGFpbHMiO2E6NDp7aTowO2E6Njp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJHMDEiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ2OiJCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjI6Im1iIjtkOjAuODU7czoyOiJtZCI7ZDowLjE7czo5OiJjZl9zb2x1c2kiO2Q6MC43NTt9aToxO2E6Njp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6MjoibWIiO2Q6MC44NTtzOjI6Im1kIjtkOjAuMTtzOjk6ImNmX3NvbHVzaSI7ZDowLjc1O31pOjI7YTo2OntzOjI6ImlkIjtpOjM7czo0OiJrb2RlIjtzOjM6IkcwMyI7czoxMToibmFtYV9nZWphbGEiO3M6MzQ6IkJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6MjoibWIiO2Q6MC42NTtzOjI6Im1kIjtkOjAuMjtzOjk6ImNmX3NvbHVzaSI7ZDowLjQ1O31pOjM7YTo2OntzOjI6ImlkIjtpOjU7czo0OiJrb2RlIjtzOjM6IkcwNSI7czoxMToibmFtYV9nZWphbGEiO3M6NTQ6IlRlcGkgZGF1biBtZW5nZXJpbmcsIGJlcmdlbG9tYmFuZywgZGFuIGJlcndhcm5hIGtlbGFidSI7czoyOiJtYiI7ZDowLjI1O3M6MjoibWQiO2Q6MC42O3M6OToiY2Zfc29sdXNpIjtkOi0wLjM1O319czoyMjoibWF0Y2hlZF9zeW1wdG9tc19jb3VudCI7aTo0O3M6OToicGVyaW5na2F0IjtpOjI7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7fX1zOjc6InN1bW1hcnkiO2E6NTp7czoxMjoidG90YWxfZ2VqYWxhIjtpOjQ7czoyODoidG90YWxfcHVwdWtfZGlyZWtvbWVuZGFzaWthbiI7aTozO3M6MzI6InRvdGFsX3Blc3Rpc2lkYV9kaXJla29tZW5kYXNpa2FuIjtpOjI7czoyMDoiZmlsdGVyX3Bvc2l0aXZlX29ubHkiO2I6MTtzOjU6InRvcF9uIjtOO31zOjExOiJtZXRob2RfaW5mbyI7YTozOntzOjIwOiJwdXB1a190cmFuc2Zvcm1hdGlvbiI7czoyOToiQ0ZfcmVrb21lbmRhc2kgPSAtQ0ZfcGVueWViYWIiO3M6MjQ6InBlc3Rpc2lkYV90cmFuc2Zvcm1hdGlvbiI7czo0NDoiQ0ZfcmVrb21lbmRhc2kgPSBDRl9zb2x1c2kgKHRhbnBhIHBlcnViYWhhbikiO3M6MTk6ImNvbWJpbmF0aW9uX2Zvcm11bGEiO3M6NDk6IkNGY29tYmluZSA9IENGMSArIENGMiAqICgxIC0gQ0YxKSB1bnR1ayBzYW1lIHNpZ24iO31zOjE1OiJwcmVmZXJlbmNlX2luZm8iO2E6NTp7czo2OiJwcmVzZXQiO3M6NToiaGVtYXQiO3M6MTY6ImNyaXRlcmlhX3dlaWdodHMiO2E6NDp7aToxO3M6MjoiNjAiO2k6MjtzOjI6IjYwIjtpOjM7czoyOiI2MCI7aTo0O3M6MjoiNjAiO31zOjE1OiJzeW1wdG9tX3dlaWdodHMiO2E6NDp7aToxO2Q6ODA7aToyO2Q6ODA7aTozO2Q6ODA7aTo1O2Q6ODA7fXM6MTE6ImRlc2NyaXB0aW9uIjtzOjY4OiJQcmVmZXJlbnNpIGluaSBtZW1wcmlvcml0YXNrYW4gYWx0ZXJuYXRpZiBkZW5nYW4gYmlheWEgbGViaWggcmVuZGFoLiI7czo3OiJhcHBsaWVkIjtiOjE7fX19fX19', 1777563520);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('wgzsribY1xvSbIxlZRUwPkDe3P1fSHu5rc6vIdyC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYnFlOTNGQTRCaFZhM2ZOWG9Kb0o3akRDYlY3RWkzZU9oUDhkYlFDeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL3Jla29tZW5kYXNpL3ByZXZpZXciO3M6NToicm91dGUiO3M6MjQ6InVzZXIucmVrb21lbmRhc2kucHJldmlldyI7fXM6MTY6ImRpYWdub3Npc19yZXN1bHQiO2E6NDp7czoxMjoic2tvclBlbnlha2l0IjthOjI6e2k6MDthOjk6e3M6ODoicGVueWFraXQiO086MTk6IkFwcFxNb2RlbHNcUGVueWFraXQiOjMzOntzOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjg6InBlbnlha2l0IjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6Nzp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJQMDEiO3M6NDoibmFtYSI7czoxMjoiQmxhc3QgKEJsYXMpIjtzOjk6ImRlc2tyaXBzaSI7czo5NToiUGVueWFraXQgeWFuZyBkaXNlYmFia2FuIGphbXVyIFB5cmljdWxhcmlhIG9yeXphZS4gVW11bW55YSBtZW55ZXJhbmcgZGF1biBkYW4gbGVoZXIgbWFsYWkgcGFkaS4iO3M6NjoiZ2FtYmFyIjtzOjU3OiJ1cGxvYWRzL3Blbnlha2l0LzQyOTc2YzhjLTczZDAtNDRmNS1iOGI3LTBmMjFhZDQxOTMyOS5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6MDY6MDYiO31zOjExOiIAKgBvcmlnaW5hbCI7YTo3OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IlAwMSI7czo0OiJuYW1hIjtzOjEyOiJCbGFzdCAoQmxhcykiO3M6OToiZGVza3JpcHNpIjtzOjk1OiJQZW55YWtpdCB5YW5nIGRpc2ViYWJrYW4gamFtdXIgUHlyaWN1bGFyaWEgb3J5emFlLiBVbXVtbnlhIG1lbnllcmFuZyBkYXVuIGRhbiBsZWhlciBtYWxhaSBwYWRpLiI7czo2OiJnYW1iYXIiO3M6NTc6InVwbG9hZHMvcGVueWFraXQvNDI5NzZjOGMtNzNkMC00NGY1LWI4YjctMGYyMWFkNDE5MzI5LmpwZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDowNjowNiI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo2OiJnZWphbGEiO086Mzk6IklsbHVtaW5hdGVcRGF0YWJhc2VcRWxvcXVlbnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTo0OntpOjA7TzoxNzoiQXBwXE1vZGVsc1xHZWphbGEiOjMzOntzOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjY6ImdlamFsYSI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjY6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czo2OiJnYW1iYXIiO3M6NTU6InVwbG9hZHMvZ2VqYWxhL2ZlNmY4ZTc5LTU5NjYtNGM0Yi1iNjMzLTU3ZjgxMzk0ZmE0Ni5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6NDk6MDAiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMDp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJHMDEiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ2OiJCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjY6ImdhbWJhciI7czo1NToidXBsb2Fkcy9nZWphbGEvZmU2ZjhlNzktNTk2Ni00YzRiLWI2MzMtNTdmODEzOTRmYTQ2LmpwZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDo0OTowMCI7czoxNzoicGl2b3RfaWRfcGVueWFraXQiO2k6MTtzOjE1OiJwaXZvdF9pZF9nZWphbGEiO2k6MTtzOjg6InBpdm90X21iIjtzOjU6IjAuOTAwIjtzOjg6InBpdm90X21kIjtzOjU6IjAuMDUwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YToxOntzOjU6InBpdm90IjtPOjQ0OiJJbGx1bWluYXRlXERhdGFiYXNlXEVsb3F1ZW50XFJlbGF0aW9uc1xQaXZvdCI6Mzc6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO047czo4OiIAKgB0YWJsZSI7czoxNToicGVueWFraXRfZ2VqYWxhIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjA7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6NDp7czoxMToiaWRfcGVueWFraXQiO2k6MTtzOjk6ImlkX2dlamFsYSI7aToxO3M6MjoibWIiO3M6NToiMC45MDAiO3M6MjoibWQiO3M6NToiMC4wNTAiO31zOjExOiIAKgBvcmlnaW5hbCI7YTo0OntzOjExOiJpZF9wZW55YWtpdCI7aToxO3M6OToiaWRfZ2VqYWxhIjtpOjE7czoyOiJtYiI7czo1OiIwLjkwMCI7czoyOiJtZCI7czo1OiIwLjA1MCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjA7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YTowOnt9czoxMToicGl2b3RQYXJlbnQiO086MTk6IkFwcFxNb2RlbHNcUGVueWFraXQiOjMzOntzOjEzOiIAKgBjb25uZWN0aW9uIjtOO3M6ODoiACoAdGFibGUiO3M6ODoicGVueWFraXQiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MDtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTowOnt9czoxMToiACoAb3JpZ2luYWwiO2E6MDp7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTo0OntpOjA7czo0OiJrb2RlIjtpOjE7czo0OiJuYW1hIjtpOjI7czo5OiJkZXNrcmlwc2kiO2k6MztzOjY6ImdhbWJhciI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1zOjEyOiJwaXZvdFJlbGF0ZWQiO086MTc6IkFwcFxNb2RlbHNcR2VqYWxhIjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7TjtzOjg6IgAqAHRhYmxlIjtzOjY6ImdlamFsYSI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjowO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjA6e31zOjExOiIAKgBvcmlnaW5hbCI7YTowOnt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjM6e2k6MDtzOjQ6ImtvZGUiO2k6MTtzOjExOiJuYW1hX2dlamFsYSI7aToyO3M6NjoiZ2FtYmFyIjt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fXM6MTM6IgAqAGZvcmVpZ25LZXkiO3M6MTE6ImlkX3Blbnlha2l0IjtzOjEzOiIAKgByZWxhdGVkS2V5IjtzOjk6ImlkX2dlamFsYSI7fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjI3OiIAKgByZWxhdGlvbkF1dG9sb2FkQ2FsbGJhY2siO047czoyNjoiACoAcmVsYXRpb25BdXRvbG9hZENvbnRleHQiO047czoxMDoidGltZXN0YW1wcyI7YjoxO3M6MTM6InVzZXNVbmlxdWVJZHMiO2I6MDtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6Mzp7aTowO3M6NDoia29kZSI7aToxO3M6MTE6Im5hbWFfZ2VqYWxhIjtpOjI7czo2OiJnYW1iYXIiO31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToxO086MTc6IkFwcFxNb2RlbHNcR2VqYWxhIjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo2OiJnZWphbGEiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTo2OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IkcwMiI7czoxMToibmFtYV9nZWphbGEiO3M6NjA6IkxlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czo2OiJnYW1iYXIiO3M6NTU6InVwbG9hZHMvZ2VqYWxhL2E4NGFhODg0LWQ5YjAtNDk2ZC1hNGRjLTI1OWIyNTJhMThiNS5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6NTA6MTMiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMDp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6NjoiZ2FtYmFyIjtzOjU1OiJ1cGxvYWRzL2dlamFsYS9hODRhYTg4NC1kOWIwLTQ5NmQtYTRkYy0yNTliMjUyYTE4YjUuanBnIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTE4IDEwOjU3OjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTIxIDA0OjUwOjEzIjtzOjE3OiJwaXZvdF9pZF9wZW55YWtpdCI7aToxO3M6MTU6InBpdm90X2lkX2dlamFsYSI7aToyO3M6ODoicGl2b3RfbWIiO3M6NToiMC45MDAiO3M6ODoicGl2b3RfbWQiO3M6NToiMC4wNTAiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6NToicGl2b3QiO086NDQ6IklsbHVtaW5hdGVcRGF0YWJhc2VcRWxvcXVlbnRcUmVsYXRpb25zXFBpdm90IjozNzp7czoxMzoiACoAY29ubmVjdGlvbiI7TjtzOjg6IgAqAHRhYmxlIjtzOjE1OiJwZW55YWtpdF9nZWphbGEiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MDtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTo0OntzOjExOiJpZF9wZW55YWtpdCI7aToxO3M6OToiaWRfZ2VqYWxhIjtpOjI7czoyOiJtYiI7czo1OiIwLjkwMCI7czoyOiJtZCI7czo1OiIwLjA1MCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjE7czo5OiJpZF9nZWphbGEiO2k6MjtzOjI6Im1iIjtzOjU6IjAuOTAwIjtzOjI6Im1kIjtzOjU6IjAuMDUwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MDtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjA6e31zOjExOiJwaXZvdFBhcmVudCI7cjoxMzY7czoxMjoicGl2b3RSZWxhdGVkIjtyOjE3NTtzOjEzOiIAKgBmb3JlaWduS2V5IjtzOjExOiJpZF9wZW55YWtpdCI7czoxMzoiACoAcmVsYXRlZEtleSI7czo5OiJpZF9nZWphbGEiO319czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjM6e2k6MDtzOjQ6ImtvZGUiO2k6MTtzOjExOiJuYW1hX2dlamFsYSI7aToyO3M6NjoiZ2FtYmFyIjt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MjtPOjE3OiJBcHBcTW9kZWxzXEdlamFsYSI6MzM6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NjoiZ2VqYWxhIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6Njp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjY6ImdhbWJhciI7czo1NToidXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDo1MDozMCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEwOntzOjI6ImlkIjtpOjM7czo0OiJrb2RlIjtzOjM6IkcwMyI7czoxMToibmFtYV9nZWphbGEiO3M6MzQ6IkJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6NjoiZ2FtYmFyIjtzOjU1OiJ1cGxvYWRzL2dlamFsYS81ZDU2NmZkOC00MjNkLTRmMzItODE4ZC1mYmVkY2Q2MzVkY2YuanBnIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTE4IDEwOjU3OjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTIxIDA0OjUwOjMwIjtzOjE3OiJwaXZvdF9pZF9wZW55YWtpdCI7aToxO3M6MTU6InBpdm90X2lkX2dlamFsYSI7aTozO3M6ODoicGl2b3RfbWIiO3M6NToiMC43MDAiO3M6ODoicGl2b3RfbWQiO3M6NToiMC4xNTAiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6NToicGl2b3QiO086NDQ6IklsbHVtaW5hdGVcRGF0YWJhc2VcRWxvcXVlbnRcUmVsYXRpb25zXFBpdm90IjozNzp7czoxMzoiACoAY29ubmVjdGlvbiI7TjtzOjg6IgAqAHRhYmxlIjtzOjE1OiJwZW55YWtpdF9nZWphbGEiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MDtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTo0OntzOjExOiJpZF9wZW55YWtpdCI7aToxO3M6OToiaWRfZ2VqYWxhIjtpOjM7czoyOiJtYiI7czo1OiIwLjcwMCI7czoyOiJtZCI7czo1OiIwLjE1MCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjE7czo5OiJpZF9nZWphbGEiO2k6MztzOjI6Im1iIjtzOjU6IjAuNzAwIjtzOjI6Im1kIjtzOjU6IjAuMTUwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MDtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjA6e31zOjExOiJwaXZvdFBhcmVudCI7cjoxMzY7czoxMjoicGl2b3RSZWxhdGVkIjtyOjE3NTtzOjEzOiIAKgBmb3JlaWduS2V5IjtzOjExOiJpZF9wZW55YWtpdCI7czoxMzoiACoAcmVsYXRlZEtleSI7czo5OiJpZF9nZWphbGEiO319czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjM6e2k6MDtzOjQ6ImtvZGUiO2k6MTtzOjExOiJuYW1hX2dlamFsYSI7aToyO3M6NjoiZ2FtYmFyIjt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fWk6MztPOjE3OiJBcHBcTW9kZWxzXEdlamFsYSI6MzM6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NjoiZ2VqYWxhIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6Njp7czoyOiJpZCI7aToxNDtzOjQ6ImtvZGUiO3M6MzoiRzE0IjtzOjExOiJuYW1hX2dlamFsYSI7czo0MToiQmVyY2FrIGhpdGFtIGF0YXUgY29rbGF0IHBhZGEga3VsaXQgZ2FiYWgiO3M6NjoiZ2FtYmFyIjtzOjU1OiJ1cGxvYWRzL2dlamFsYS8xZWQwZWM0Ni1mODZhLTRiOGItOGM3MC1iOGUyNTIwMmZlODMucG5nIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTE4IDEwOjU3OjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTIxIDA1OjAxOjIxIjt9czoxMToiACoAb3JpZ2luYWwiO2E6MTA6e3M6MjoiaWQiO2k6MTQ7czo0OiJrb2RlIjtzOjM6IkcxNCI7czoxMToibmFtYV9nZWphbGEiO3M6NDE6IkJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjY6ImdhbWJhciI7czo1NToidXBsb2Fkcy9nZWphbGEvMWVkMGVjNDYtZjg2YS00YjhiLThjNzAtYjhlMjUyMDJmZTgzLnBuZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNTowMToyMSI7czoxNzoicGl2b3RfaWRfcGVueWFraXQiO2k6MTtzOjE1OiJwaXZvdF9pZF9nZWphbGEiO2k6MTQ7czo4OiJwaXZvdF9tYiI7czo1OiIwLjY1MCI7czo4OiJwaXZvdF9tZCI7czo1OiIwLjIwMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo1OiJwaXZvdCI7Tzo0NDoiSWxsdW1pbmF0ZVxEYXRhYmFzZVxFbG9xdWVudFxSZWxhdGlvbnNcUGl2b3QiOjM3OntzOjEzOiIAKgBjb25uZWN0aW9uIjtOO3M6ODoiACoAdGFibGUiO3M6MTU6InBlbnlha2l0X2dlamFsYSI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjowO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjE7czo5OiJpZF9nZWphbGEiO2k6MTQ7czoyOiJtYiI7czo1OiIwLjY1MCI7czoyOiJtZCI7czo1OiIwLjIwMCI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjE7czo5OiJpZF9nZWphbGEiO2k6MTQ7czoyOiJtYiI7czo1OiIwLjY1MCI7czoyOiJtZCI7czo1OiIwLjIwMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjA7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YTowOnt9czoxMToicGl2b3RQYXJlbnQiO3I6MTM2O3M6MTI6InBpdm90UmVsYXRlZCI7cjoxNzU7czoxMzoiACoAZm9yZWlnbktleSI7czoxMToiaWRfcGVueWFraXQiO3M6MTM6IgAqAHJlbGF0ZWRLZXkiO3M6OToiaWRfZ2VqYWxhIjt9fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTozOntpOjA7czo0OiJrb2RlIjtpOjE7czoxMToibmFtYV9nZWphbGEiO2k6MjtzOjY6ImdhbWJhciI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX19czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjQ6e2k6MDtzOjQ6ImtvZGUiO2k6MTtzOjQ6Im5hbWEiO2k6MjtzOjk6ImRlc2tyaXBzaSI7aTozO3M6NjoiZ2FtYmFyIjt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoxOiIqIjt9fXM6NToiY29jb2siO2k6MjtzOjU6InRvdGFsIjtpOjQ7czo2OiJwZXJzZW4iO2Q6OTA7czoxMDoiY29uZmlkZW5jZSI7ZDowLjgwOTE5OTk5OTk5OTk5OTk7czo2OiJjZl9yYXciO2Q6MC44MDkxOTk5OTk5OTk5OTk5O3M6MTQ6ImludGVycHJldGF0aW9uIjthOjM6e3M6NToibGFiZWwiO3M6MTM6IlNhbmdhdCBUaW5nZ2kiO3M6NToiY29sb3IiO3M6Nzoic3VjY2VzcyI7czo0OiJpY29uIjtzOjY6IuKck+KckyI7fXM6MTg6Im1hdGNoZWRfZ2VqYWxhX2lkcyI7YToyOntpOjA7aToxO2k6MTtpOjI7fXM6MjE6Im1hdGNoZWRfZ2VqYWxhX2RldGFpbCI7YToyOntpOjA7YTo3OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IkcwMSI7czoxMToibmFtYV9nZWphbGEiO3M6NDY6IkJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9mZTZmOGU3OS01OTY2LTRjNGItYjYzMy01N2Y4MTM5NGZhNDYuanBnIjtzOjI6Im1iIjtkOjAuOTtzOjI6Im1kIjtkOjAuMDU7czoyOiJjZiI7ZDowLjg1O31pOjE7YTo3OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IkcwMiI7czoxMToibmFtYV9nZWphbGEiO3M6NjA6IkxlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2E4NGFhODg0LWQ5YjAtNDk2ZC1hNGRjLTI1OWIyNTJhMThiNS5qcGciO3M6MjoibWIiO2Q6MC45O3M6MjoibWQiO2Q6MC4wNTtzOjI6ImNmIjtkOjAuODU7fX19aToxO2E6OTp7czo4OiJwZW55YWtpdCI7TzoxOToiQXBwXE1vZGVsc1xQZW55YWtpdCI6MzM6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6ODoicGVueWFraXQiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTo3OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IlAwMiI7czo0OiJuYW1hIjtzOjI3OiJIYXdhciBEYXVuIEJha3RlcmkgKEtyZXNlaykiO3M6OToiZGVza3JpcHNpIjtzOjYzOiJQZW55YWtpdCB5YW5nIGRpc2ViYWJrYW4gYmFrdGVyaSBYYW50aG9tb25hcyBvcnl6YWUgcHYuIG9yeXphZS4iO3M6NjoiZ2FtYmFyIjtzOjU3OiJ1cGxvYWRzL3Blbnlha2l0LzgzMDUxOTllLTQ5MDMtNGIxOS04NjYyLWVlM2Y0ZDVhNGViMy5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6MDY6MjgiO31zOjExOiIAKgBvcmlnaW5hbCI7YTo3OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IlAwMiI7czo0OiJuYW1hIjtzOjI3OiJIYXdhciBEYXVuIEJha3RlcmkgKEtyZXNlaykiO3M6OToiZGVza3JpcHNpIjtzOjYzOiJQZW55YWtpdCB5YW5nIGRpc2ViYWJrYW4gYmFrdGVyaSBYYW50aG9tb25hcyBvcnl6YWUgcHYuIG9yeXphZS4iO3M6NjoiZ2FtYmFyIjtzOjU3OiJ1cGxvYWRzL3Blbnlha2l0LzgzMDUxOTllLTQ5MDMtNGIxOS04NjYyLWVlM2Y0ZDVhNGViMy5qcGciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6MDY6MjgiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6NjoiZ2VqYWxhIjtPOjM5OiJJbGx1bWluYXRlXERhdGFiYXNlXEVsb3F1ZW50XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6Mzp7aTowO086MTc6IkFwcFxNb2RlbHNcR2VqYWxhIjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo2OiJnZWphbGEiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTo2OntzOjI6ImlkIjtpOjQ7czo0OiJrb2RlIjtzOjM6IkcwNCI7czoxMToibmFtYV9nZWphbGEiO3M6NDc6IkRhdW4gbWVuZ3VuaW5nIG11bGFpIGRhcmkgdWp1bmcgZGFuIHRlcGkgKGxheXUpIjtzOjY6ImdhbWJhciI7czo1NToidXBsb2Fkcy9nZWphbGEvZTgzZjkwY2EtMDVmMC00YWUzLTg3MDgtMzliMzI4ODRmMzg0LnBuZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDo1MDo0NSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEwOntzOjI6ImlkIjtpOjQ7czo0OiJrb2RlIjtzOjM6IkcwNCI7czoxMToibmFtYV9nZWphbGEiO3M6NDc6IkRhdW4gbWVuZ3VuaW5nIG11bGFpIGRhcmkgdWp1bmcgZGFuIHRlcGkgKGxheXUpIjtzOjY6ImdhbWJhciI7czo1NToidXBsb2Fkcy9nZWphbGEvZTgzZjkwY2EtMDVmMC00YWUzLTg3MDgtMzliMzI4ODRmMzg0LnBuZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDo1MDo0NSI7czoxNzoicGl2b3RfaWRfcGVueWFraXQiO2k6MjtzOjE1OiJwaXZvdF9pZF9nZWphbGEiO2k6NDtzOjg6InBpdm90X21iIjtzOjU6IjAuODAwIjtzOjg6InBpdm90X21kIjtzOjU6IjAuMTAwIjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6MDp7fXM6MTc6IgAqAGNsYXNzQ2FzdENhY2hlIjthOjA6e31zOjIxOiIAKgBhdHRyaWJ1dGVDYXN0Q2FjaGUiO2E6MDp7fXM6MTM6IgAqAGRhdGVGb3JtYXQiO047czoxMDoiACoAYXBwZW5kcyI7YTowOnt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YToxOntzOjU6InBpdm90IjtPOjQ0OiJJbGx1bWluYXRlXERhdGFiYXNlXEVsb3F1ZW50XFJlbGF0aW9uc1xQaXZvdCI6Mzc6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO047czo4OiIAKgB0YWJsZSI7czoxNToicGVueWFraXRfZ2VqYWxhIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjA7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6NDp7czoxMToiaWRfcGVueWFraXQiO2k6MjtzOjk6ImlkX2dlamFsYSI7aTo0O3M6MjoibWIiO3M6NToiMC44MDAiO3M6MjoibWQiO3M6NToiMC4xMDAiO31zOjExOiIAKgBvcmlnaW5hbCI7YTo0OntzOjExOiJpZF9wZW55YWtpdCI7aToyO3M6OToiaWRfZ2VqYWxhIjtpOjQ7czoyOiJtYiI7czo1OiIwLjgwMCI7czoyOiJtZCI7czo1OiIwLjEwMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjA7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YTowOnt9czoxMToicGl2b3RQYXJlbnQiO3I6MTM2O3M6MTI6InBpdm90UmVsYXRlZCI7cjoxNzU7czoxMzoiACoAZm9yZWlnbktleSI7czoxMToiaWRfcGVueWFraXQiO3M6MTM6IgAqAHJlbGF0ZWRLZXkiO3M6OToiaWRfZ2VqYWxhIjt9fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTozOntpOjA7czo0OiJrb2RlIjtpOjE7czoxMToibmFtYV9nZWphbGEiO2k6MjtzOjY6ImdhbWJhciI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1pOjE7TzoxNzoiQXBwXE1vZGVsc1xHZWphbGEiOjMzOntzOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjY6ImdlamFsYSI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjY6e3M6MjoiaWQiO2k6NTtzOjQ6ImtvZGUiO3M6MzoiRzA1IjtzOjExOiJuYW1hX2dlamFsYSI7czo1NDoiVGVwaSBkYXVuIG1lbmdlcmluZywgYmVyZ2Vsb21iYW5nLCBkYW4gYmVyd2FybmEga2VsYWJ1IjtzOjY6ImdhbWJhciI7czo1NToidXBsb2Fkcy9nZWphbGEvMTgzOWI0MTgtYTA0Yy00ODBjLWEwY2MtODAyYjQ2OGZiMWRhLnBuZyI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNi0wNC0xOCAxMDo1Nzo0OSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNi0wNC0yMSAwNDo1MTowNSI7fXM6MTE6IgAqAG9yaWdpbmFsIjthOjEwOntzOjI6ImlkIjtpOjU7czo0OiJrb2RlIjtzOjM6IkcwNSI7czoxMToibmFtYV9nZWphbGEiO3M6NTQ6IlRlcGkgZGF1biBtZW5nZXJpbmcsIGJlcmdlbG9tYmFuZywgZGFuIGJlcndhcm5hIGtlbGFidSI7czo2OiJnYW1iYXIiO3M6NTU6InVwbG9hZHMvZ2VqYWxhLzE4MzliNDE4LWEwNGMtNDgwYy1hMGNjLTgwMmI0NjhmYjFkYS5wbmciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6NTE6MDUiO3M6MTc6InBpdm90X2lkX3Blbnlha2l0IjtpOjI7czoxNToicGl2b3RfaWRfZ2VqYWxhIjtpOjU7czo4OiJwaXZvdF9tYiI7czo1OiIwLjkwMCI7czo4OiJwaXZvdF9tZCI7czo1OiIwLjUwMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo1OiJwaXZvdCI7Tzo0NDoiSWxsdW1pbmF0ZVxEYXRhYmFzZVxFbG9xdWVudFxSZWxhdGlvbnNcUGl2b3QiOjM3OntzOjEzOiIAKgBjb25uZWN0aW9uIjtOO3M6ODoiACoAdGFibGUiO3M6MTU6InBlbnlha2l0X2dlamFsYSI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjowO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjI7czo5OiJpZF9nZWphbGEiO2k6NTtzOjI6Im1iIjtzOjU6IjAuOTAwIjtzOjI6Im1kIjtzOjU6IjAuNTAwIjt9czoxMToiACoAb3JpZ2luYWwiO2E6NDp7czoxMToiaWRfcGVueWFraXQiO2k6MjtzOjk6ImlkX2dlamFsYSI7aTo1O3M6MjoibWIiO3M6NToiMC45MDAiO3M6MjoibWQiO3M6NToiMC41MDAiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjI3OiIAKgByZWxhdGlvbkF1dG9sb2FkQ2FsbGJhY2siO047czoyNjoiACoAcmVsYXRpb25BdXRvbG9hZENvbnRleHQiO047czoxMDoidGltZXN0YW1wcyI7YjowO3M6MTM6InVzZXNVbmlxdWVJZHMiO2I6MDtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MDp7fXM6MTE6InBpdm90UGFyZW50IjtyOjEzNjtzOjEyOiJwaXZvdFJlbGF0ZWQiO3I6MTc1O3M6MTM6IgAqAGZvcmVpZ25LZXkiO3M6MTE6ImlkX3Blbnlha2l0IjtzOjEzOiIAKgByZWxhdGVkS2V5IjtzOjk6ImlkX2dlamFsYSI7fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjI3OiIAKgByZWxhdGlvbkF1dG9sb2FkQ2FsbGJhY2siO047czoyNjoiACoAcmVsYXRpb25BdXRvbG9hZENvbnRleHQiO047czoxMDoidGltZXN0YW1wcyI7YjoxO3M6MTM6InVzZXNVbmlxdWVJZHMiO2I6MDtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6Mzp7aTowO3M6NDoia29kZSI7aToxO3M6MTE6Im5hbWFfZ2VqYWxhIjtpOjI7czo2OiJnYW1iYXIiO31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319aToyO086MTc6IkFwcFxNb2RlbHNcR2VqYWxhIjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo2OiJnZWphbGEiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YTo2OntzOjI6ImlkIjtpOjY7czo0OiJrb2RlIjtzOjM6IkcwNiI7czoxMToibmFtYV9nZWphbGEiO3M6NDY6IlNlbHVydWggdGFuYW1hbiBsYXl1IG1lbmRhZGFrIChzZXJhbmdhbiBiZXJhdCkiO3M6NjoiZ2FtYmFyIjtzOjU1OiJ1cGxvYWRzL2dlamFsYS83MmNmMDQ1MC04NzcwLTRmYTUtOWQ3Ni0yMzFjNTAxYzhjOTUucG5nIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTE4IDEwOjU3OjQ5IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI2LTA0LTIxIDA0OjUxOjE5Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTA6e3M6MjoiaWQiO2k6NjtzOjQ6ImtvZGUiO3M6MzoiRzA2IjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiU2VsdXJ1aCB0YW5hbWFuIGxheXUgbWVuZGFkYWsgKHNlcmFuZ2FuIGJlcmF0KSI7czo2OiJnYW1iYXIiO3M6NTU6InVwbG9hZHMvZ2VqYWxhLzcyY2YwNDUwLTg3NzAtNGZhNS05ZDc2LTIzMWM1MDFjOGM5NS5wbmciO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMTggMTA6NTc6NDkiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjYtMDQtMjEgMDQ6NTE6MTkiO3M6MTc6InBpdm90X2lkX3Blbnlha2l0IjtpOjI7czoxNToicGl2b3RfaWRfZ2VqYWxhIjtpOjY7czo4OiJwaXZvdF9tYiI7czo1OiIwLjc1MCI7czo4OiJwaXZvdF9tZCI7czo1OiIwLjEwMCI7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjA6e31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MTp7czo1OiJwaXZvdCI7Tzo0NDoiSWxsdW1pbmF0ZVxEYXRhYmFzZVxFbG9xdWVudFxSZWxhdGlvbnNcUGl2b3QiOjM3OntzOjEzOiIAKgBjb25uZWN0aW9uIjtOO3M6ODoiACoAdGFibGUiO3M6MTU6InBlbnlha2l0X2dlamFsYSI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjowO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjQ6e3M6MTE6ImlkX3Blbnlha2l0IjtpOjI7czo5OiJpZF9nZWphbGEiO2k6NjtzOjI6Im1iIjtzOjU6IjAuNzUwIjtzOjI6Im1kIjtzOjU6IjAuMTAwIjt9czoxMToiACoAb3JpZ2luYWwiO2E6NDp7czoxMToiaWRfcGVueWFraXQiO2k6MjtzOjk6ImlkX2dlamFsYSI7aTo2O3M6MjoibWIiO3M6NToiMC43NTAiO3M6MjoibWQiO3M6NToiMC4xMDAiO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTowOnt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjI3OiIAKgByZWxhdGlvbkF1dG9sb2FkQ2FsbGJhY2siO047czoyNjoiACoAcmVsYXRpb25BdXRvbG9hZENvbnRleHQiO047czoxMDoidGltZXN0YW1wcyI7YjowO3M6MTM6InVzZXNVbmlxdWVJZHMiO2I6MDtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6MDp7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MDp7fXM6MTE6InBpdm90UGFyZW50IjtyOjEzNjtzOjEyOiJwaXZvdFJlbGF0ZWQiO3I6MTc1O3M6MTM6IgAqAGZvcmVpZ25LZXkiO3M6MTE6ImlkX3Blbnlha2l0IjtzOjEzOiIAKgByZWxhdGVkS2V5IjtzOjk6ImlkX2dlamFsYSI7fX1zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjI3OiIAKgByZWxhdGlvbkF1dG9sb2FkQ2FsbGJhY2siO047czoyNjoiACoAcmVsYXRpb25BdXRvbG9hZENvbnRleHQiO047czoxMDoidGltZXN0YW1wcyI7YjoxO3M6MTM6InVzZXNVbmlxdWVJZHMiO2I6MDtzOjk6IgAqAGhpZGRlbiI7YTowOnt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6Mzp7aTowO3M6NDoia29kZSI7aToxO3M6MTE6Im5hbWFfZ2VqYWxhIjtpOjI7czo2OiJnYW1iYXIiO31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTo0OntpOjA7czo0OiJrb2RlIjtpOjE7czo0OiJuYW1hIjtpOjI7czo5OiJkZXNrcmlwc2kiO2k6MztzOjY6ImdhbWJhciI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fX1zOjU6ImNvY29rIjtpOjI7czo1OiJ0b3RhbCI7aTozO3M6NjoicGVyc2VuIjtkOjgxO3M6MTA6ImNvbmZpZGVuY2UiO2Q6MC42MTcxNDI2O3M6NjoiY2ZfcmF3IjtkOjAuNjE3MTQyNjtzOjE0OiJpbnRlcnByZXRhdGlvbiI7YTozOntzOjU6ImxhYmVsIjtzOjY6IlRpbmdnaSI7czo1OiJjb2xvciI7czo3OiJzdWNjZXNzIjtzOjQ6Imljb24iO3M6Mzoi4pyTIjt9czoxODoibWF0Y2hlZF9nZWphbGFfaWRzIjthOjI6e2k6MDtpOjQ7aToxO2k6NTt9czoyMToibWF0Y2hlZF9nZWphbGFfZGV0YWlsIjthOjI6e2k6MDthOjc6e3M6MjoiaWQiO2k6NDtzOjQ6ImtvZGUiO3M6MzoiRzA0IjtzOjExOiJuYW1hX2dlamFsYSI7czo0NzoiRGF1biBtZW5ndW5pbmcgbXVsYWkgZGFyaSB1anVuZyBkYW4gdGVwaSAobGF5dSkiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9lODNmOTBjYS0wNWYwLTRhZTMtODcwOC0zOWIzMjg4NGYzODQucG5nIjtzOjI6Im1iIjtkOjAuODtzOjI6Im1kIjtkOjAuMTtzOjI6ImNmIjtkOjAuNzt9aToxO2E6Nzp7czoyOiJpZCI7aTo1O3M6NDoia29kZSI7czozOiJHMDUiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjU0OiJUZXBpIGRhdW4gbWVuZ2VyaW5nLCBiZXJnZWxvbWJhbmcsIGRhbiBiZXJ3YXJuYSBrZWxhYnUiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS8xODM5YjQxOC1hMDRjLTQ4MGMtYTBjYy04MDJiNDY4ZmIxZGEucG5nIjtzOjI6Im1iIjtkOjAuOTtzOjI6Im1kIjtkOjAuNTtzOjI6ImNmIjtkOjAuNDt9fX19czoxMDoiZ2VqYWxhX2lkcyI7YTo0OntpOjA7aToxO2k6MTtpOjI7aToyO2k6NDtpOjM7aTo1O31zOjE0OiJnZWphbGFfd2VpZ2h0cyI7YTo0OntpOjE7ZDo4MDtpOjI7ZDoxMDA7aTo0O2Q6ODA7aTo1O2Q6MTAwO31zOjc6InN1bW1hcnkiO2E6NTp7czoxMzoidG9wX2RpYWdub3NpcyI7YTo5OntzOjg6InBlbnlha2l0IjtyOjEyO3M6NToiY29jb2siO2k6MjtzOjU6InRvdGFsIjtpOjQ7czo2OiJwZXJzZW4iO2Q6OTA7czoxMDoiY29uZmlkZW5jZSI7ZDowLjgwOTE5OTk5OTk5OTk5OTk7czo2OiJjZl9yYXciO2Q6MC44MDkxOTk5OTk5OTk5OTk5O3M6MTQ6ImludGVycHJldGF0aW9uIjthOjM6e3M6NToibGFiZWwiO3M6MTM6IlNhbmdhdCBUaW5nZ2kiO3M6NToiY29sb3IiO3M6Nzoic3VjY2VzcyI7czo0OiJpY29uIjtzOjY6IuKck+KckyI7fXM6MTg6Im1hdGNoZWRfZ2VqYWxhX2lkcyI7YToyOntpOjA7aToxO2k6MTtpOjI7fXM6MjE6Im1hdGNoZWRfZ2VqYWxhX2RldGFpbCI7YToyOntpOjA7YTo3OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IkcwMSI7czoxMToibmFtYV9nZWphbGEiO3M6NDY6IkJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9mZTZmOGU3OS01OTY2LTRjNGItYjYzMy01N2Y4MTM5NGZhNDYuanBnIjtzOjI6Im1iIjtkOjAuOTtzOjI6Im1kIjtkOjAuMDU7czoyOiJjZiI7ZDowLjg1O31pOjE7YTo3OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IkcwMiI7czoxMToibmFtYV9nZWphbGEiO3M6NjA6IkxlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2E4NGFhODg0LWQ5YjAtNDk2ZC1hNGRjLTI1OWIyNTJhMThiNS5qcGciO3M6MjoibWIiO2Q6MC45O3M6MjoibWQiO2Q6MC4wNTtzOjI6ImNmIjtkOjAuODU7fX19czoxMzoidG90YWxfbWF0Y2hlcyI7aToyO3M6MjI6InNlbGVjdGVkX3N5bXB0b21fdG90YWwiO2k6NDtzOjY6Im1ldGhvZCI7czoxNjoiQ2VydGFpbnR5IEZhY3RvciI7czoxMDoiY2ZfZm9ybXVsYSI7czo0NzoiQ0YgPSBNQiAtIE1ELCBDRmNvbWJpbmUgPSBDRjEgKyBDRjIgKiAoMSAtIENGMSkiO319czoxNzoiZ3Vlc3RfcmVrb21lbmRhc2kiO2E6Mjp7czo0OiJtb2RlIjtzOjc6InByZXZpZXciO3M6NToiaXRlbXMiO2E6MTp7aTowO2E6Njp7czoxNDoicmVrb21lbmRhc2lfaWQiO047czoxMToicGVueWFraXRfaWQiO2k6MTtzOjEzOiJwZW55YWtpdF9uYW1hIjtzOjEyOiJCbGFzdCAoQmxhcykiO3M6MTY6InByZWZlcmVuc2lfbGFiZWwiO3M6ODoiU2VpbWJhbmciO3M6MTk6InByZWZlcmVuc2lfcGVuZ2d1bmEiO2E6NTp7czo2OiJhbGFzYW4iO047czo3OiJjYXRhdGFuIjtOO3M6MTU6ImdlamFsYV90ZXJwaWxpaCI7YTo0OntpOjA7YTo0OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IkcwMSI7czoxMToibmFtYV9nZWphbGEiO3M6NDY6IkJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9mZTZmOGU3OS01OTY2LTRjNGItYjYzMy01N2Y4MTM5NGZhNDYuanBnIjt9aToxO2E6NDp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9hODRhYTg4NC1kOWIwLTQ5NmQtYTRkYy0yNTliMjUyYTE4YjUuanBnIjt9aToyO2E6NDp7czoyOiJpZCI7aTo0O3M6NDoia29kZSI7czozOiJHMDQiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ3OiJEYXVuIG1lbmd1bmluZyBtdWxhaSBkYXJpIHVqdW5nIGRhbiB0ZXBpIChsYXl1KSI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2U4M2Y5MGNhLTA1ZjAtNGFlMy04NzA4LTM5YjMyODg0ZjM4NC5wbmciO31pOjM7YTo0OntzOjI6ImlkIjtpOjU7czo0OiJrb2RlIjtzOjM6IkcwNSI7czoxMToibmFtYV9nZWphbGEiO3M6NTQ6IlRlcGkgZGF1biBtZW5nZXJpbmcsIGJlcmdlbG9tYmFuZywgZGFuIGJlcndhcm5hIGtlbGFidSI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzE4MzliNDE4LWEwNGMtNDgwYy1hMGNjLTgwMmI0NjhmYjFkYS5wbmciO319czo4OiJrcml0ZXJpYSI7YTo0OntpOjE7czoyOiI2MCI7aToyO3M6MjoiNjAiO2k6MztzOjI6IjYwIjtpOjQ7czoyOiI2MCI7fXM6MTQ6ImdlamFsYV93ZWlnaHRzIjthOjQ6e2k6MTtkOjgwO2k6MjtkOjEwMDtpOjQ7ZDo4MDtpOjU7ZDoxMDA7fX1zOjc6InByZXZpZXciO2E6NTp7czo1OiJydW11cyI7YTozOntzOjc6ImNmX3J1bGUiO3M6MTI6IkNGID0gTUIgLSBNRCI7czoxMDoiY2ZfY29tYmluZSI7czozMzoiQ0Zjb21iaW5lID0gQ0YxICsgQ0YyICogKDEgLSBDRjEpIjtzOjEwOiJwcmVmZXJlbnNpIjtzOjcxOiJDRiBha2hpciA9IENGIGRhc2FyICsgcGVueWVzdWFpYW4gTUIvTUQgYmVyZGFzYXJrYW4gcHJlZmVyZW5zaSBwZW5nZ3VuYSI7fXM6ODoia3JpdGVyaWEiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjQ6e2k6MDthOjk6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MjoiQzEiO3M6NDoibmFtYSI7czoxNDoiSmVuaXMgUGVueWFraXQiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxMDoia2V0ZXJhbmdhbiI7czo1NDoiS2VzZXN1YWlhbiBwcm9kdWsgdGVyaGFkYXAgamVuaXMgcGVueWFraXQgeWFuZyBkaXBpbGloIjtzOjEwOiJib2JvdF9hd2FsIjtkOjAuMzU7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6ODoidWlfbGFiZWwiO3M6MTQ6IkplbmlzIFBlbnlha2l0IjtzOjc6InVpX2ljb24iO3M6NDoi8J+OryI7fWk6MTthOjk6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6MjoiQzIiO3M6NDoibmFtYSI7czo1OiJIYXJnYSI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjEwOiJrZXRlcmFuZ2FuIjtzOjQ4OiJIYXJnYSBwZXIgc2F0dWFuIHByb2R1ayB5YW5nIHRlcnNlZGlhIGRpIHBhc2FyYW4iO3M6MTA6ImJvYm90X2F3YWwiO2Q6MC4yO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjg6InVpX2xhYmVsIjtzOjU6Ik11cmFoIjtzOjc6InVpX2ljb24iO3M6NDoi8J+SsCI7fWk6MjthOjk6e3M6MjoiaWQiO2k6MztzOjQ6ImtvZGUiO3M6MjoiQzMiO3M6NDoibmFtYSI7czoxMToiRWZla3Rpdml0YXMiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxMDoia2V0ZXJhbmdhbiI7czo0MzoiVGluZ2thdCBrZWJlcmhhc2lsYW4gbWVuZ2VuZGFsaWthbiBwZW55YWtpdCI7czoxMDoiYm9ib3RfYXdhbCI7ZDowLjI1O3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjg6InVpX2xhYmVsIjtzOjc6IkVmZWt0aWYiO3M6NzoidWlfaWNvbiI7czozOiLimqEiO31pOjM7YTo5OntzOjI6ImlkIjtpOjQ7czo0OiJrb2RlIjtzOjI6IkM0IjtzOjQ6Im5hbWEiO3M6MTc6IkRhbXBhayBMaW5na3VuZ2FuIjtzOjU6ImplbmlzIjtzOjQ6ImNvc3QiO3M6MTA6ImtldGVyYW5nYW4iO3M6NDI6IlBlbmdhcnVoIG5lZ2F0aWYgdGVyaGFkYXAgbGluZ2t1bmdhbiBzYXdhaCI7czoxMDoiYm9ib3RfYXdhbCI7ZDowLjI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6ODoidWlfbGFiZWwiO3M6NDoiQW1hbiI7czo3OiJ1aV9pY29uIjtzOjQ6IvCfjLEiO319czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjU6InB1cHVrIjthOjY6e2k6MDthOjExOntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjQ6IlBLMDEiO3M6NDoibmFtYSI7czo0OiJVcmVhIjtzOjI6InZpIjtkOjAuNzk3Nzg3OTk5OTk5OTk5OTtzOjQ6Im1ldGEiO2E6MTM6e3M6MTA6ImdhbWJhcl91cmwiO3M6NzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL3B1cHVrL2YzZGNkZTgxLTJmOGUtNDc5Mi05OGVkLTQyMTgxZmVlZDFjZi5qcGciO3M6OToia2FuZHVuZ2FuIjtzOjU6Ik4gNDYlIjtzOjE2OiJrYW5kdW5nYW5fZGV0YWlsIjtzOjIyNzoiTWVuZ2FuZHVuZyBOaXRyb2dlbiAoTikgc2ViZXNhciDCsTQ2JSBkYWxhbSBiZW50dWsgc2VueWF3YSBDTyhOSOKCginigoIgKHVyZWEpLiBUaWRhayBtZW1pbGlraSBrYW5kdW5nYW4gdW5zdXIgaGFyYSBsYWluIHNlcGVydGkgZm9zZm9yIChQKSBhdGF1IGthbGl1bSAoSyksIHNlaGluZ2dhIHRlcm1hc3VrIHB1cHVrIHR1bmdnYWwgZGVuZ2FuIGZva3VzIHBhZGEgdW5zdXIgbml0cm9nZW4gc2FqYS4iO3M6MTE6ImJhaGFuX2FrdGlmIjtOO3M6MTI6ImZ1bmdzaV91dGFtYSI7czozNDQ6IlB1cHVrIG5pdHJvZ2VuIHRpbmdnaSB1bnR1ayBwZXJ0dW1idWhhbiB2ZWdldGF0aWYsIE5pdHJvZ2VuIChOKS4gU2VsYWluIG5pdHJvZ2VuLCB1cmVhIHRpZGFrIG1lbmdhbmR1bmcgdW5zdXIgaGFyYSBsYWluIHNlcGVydGkgZm9zZm9yIChQKSBhdGF1IGthbGl1bSAoSyksIHNlaGluZ2dhIHRlcm1hc3VrIHB1cHVrIHR1bmdnYWwuIERhbGFtIHRhbmFoLCB1cmVhIGFrYW4gbWVuZ2FsYW1pIHByb3NlcyBwZXJ1YmFoYW4gbWVuamFkaSBhbW9uaWEgZGFuIGtlbXVkaWFuIG5pdHJhdCB5YW5nIGRhcGF0IGRpc2VyYXAgb2xlaCB0YW5hbWFuIHVudHVrIG1lbmR1a3VuZyBwZXJ0dW1idWhhbiB2ZWdldGF0aWYuIjtzOjY6ImZ1bmdzaSI7TjtzOjc6InRha2FyYW4iO3M6MTc6IsKxMjAw4oCTMzAwIGtnL2hhIjtzOjU6ImRvc2lzIjtOO3M6MTU6ImVmZWtfcGVuZ2d1bmFhbiI7czoxMDc6Ik1lbmluZ2thdGthbiBwZXJ0dW1idWhhbiBkYXVuIGRhbiBiYXRhbmcsIG1lbXBlcmNlcGF0IHBlbWJlbnR1a2FuIGFuYWthbiwgc2VydGEgbWVtYnVhdCB0YW5hbWFuIGxlYmloIGhpamF1IjtzOjEzOiJjYXJhX2FwbGlrYXNpIjtzOjg1OiJEaXNlYmFyIG1lcmF0YSBkaSBsYWhhbiAodGFidXIpLCBzZWJhaWtueWEgcGFkYSB0YW5haCBsZW1iYWIgYXRhdSBtZW5qZWxhbmcgcGVuZ2FpcmFuIjtzOjIwOiJqYWR3YWxfdW11cl9hcGxpa2FzaSI7czo5MzoiN+KAkzEwIEhTVCAoYXdhbCB0YW5hbSkNCjIw4oCTMjUgSFNUIChmYXNlIGFuYWthbikNCjM14oCTNDAgSFNUIChtZW5qZWxhbmcgcGVtYmVudHVrYW4gbWFsYWkpIjtzOjE4OiJmcmVrdWVuc2lfYXBsaWthc2kiO3M6Mjg6IjLigJMzIGthbGkgc2VsYW1hIG1hc2EgdGFuYW0iO3M6MTI6ImdlamFsYV9jb2NvayI7YTo0OntpOjA7YTo2OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IkcwMSI7czoxMToibmFtYV9nZWphbGEiO3M6NDY6IkJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9mZTZmOGU3OS01OTY2LTRjNGItYjYzMy01N2Y4MTM5NGZhNDYuanBnIjtzOjI6Im1iIjtkOjAuODU7czoyOiJtZCI7ZDowLjA0OTt9aToxO2E6Njp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9hODRhYTg4NC1kOWIwLTQ5NmQtYTRkYy0yNTliMjUyYTE4YjUuanBnIjtzOjI6Im1iIjtkOjAuOTtzOjI6Im1kIjtkOjAuMTt9aToyO2E6Njp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7czoyOiJtYiI7ZDowLjg7czoyOiJtZCI7ZDowLjE7fWk6MzthOjY6e3M6MjoiaWQiO2k6MTQ7czo0OiJrb2RlIjtzOjM6IkcxNCI7czoxMToibmFtYV9nZWphbGEiO3M6NDE6IkJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvMWVkMGVjNDYtZjg2YS00YjhiLThjNzAtYjhlMjUyMDJmZTgzLnBuZyI7czoyOiJtYiI7ZDowLjY7czoyOiJtZCI7ZDowLjI7fX19czo2OiJkZXRhaWwiO2E6MTA6e3M6ODoiR0VKQUxBXzEiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1MjoiRzAxIC0gQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDowLjgwMTtzOjg6Im1iX2JvbnVzIjtkOjAuODU7czo4OiJtZF9ib251cyI7ZDowLjA0OTtzOjY6ImltcGFjdCI7ZDowLjgwMTtzOjI6ImNmIjtkOjAuODAxO3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjg6IkdFSkFMQV8yIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NjY6IkcwMiAtIExlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDowLjg7czo4OiJtYl9ib251cyI7ZDowLjk7czo4OiJtZF9ib251cyI7ZDowLjE7czo2OiJpbXBhY3QiO2Q6MC44O3M6MjoiY2YiO2Q6MC44O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjg6IkdFSkFMQV8zIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NDA6IkcwMyAtIEJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6MC43O3M6ODoibWJfYm9udXMiO2Q6MC44O3M6ODoibWRfYm9udXMiO2Q6MC4xO3M6NjoiaW1wYWN0IjtkOjAuNztzOjI6ImNmIjtkOjAuNztzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo5OiJHRUpBTEFfMTQiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo0NzoiRzE0IC0gQmVyY2FrIGhpdGFtIGF0YXUgY29rbGF0IHBhZGEga3VsaXQgZ2FiYWgiO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6MC40O3M6ODoibWJfYm9udXMiO2Q6MC42O3M6ODoibWRfYm9udXMiO2Q6MC4yO3M6NjoiaW1wYWN0IjtkOjAuNDtzOjI6ImNmIjtkOjAuNDtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo0OiJCQVNFIjthOjExOntzOjg6ImtyaXRlcmlhIjtzOjMxOiJBa3VtdWxhc2kga2V5YWtpbmFuIGRhc2FyIHBha2FyIjtzOjU6ImplbmlzIjtzOjQ6ImJhc2UiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7aToxO3M6ODoibWJfYm9udXMiO2k6MDtzOjg6Im1kX2JvbnVzIjtpOjA7czo2OiJpbXBhY3QiO2Q6MC42MTUwNDg7czo3OiJtYl9hd2FsIjtkOjAuOTk4ODtzOjc6Im1kX2F3YWwiO2Q6MC4zODM3NTI7czoyOiJjZiI7ZDowLjYxNTA0ODtzOjc6ImNhdGF0YW4iO3M6ODU6Ik5pbGFpIGF3YWwgZGliZW50dWsgZGFyaSBnYWJ1bmdhbiBzZW11YSBydWxlIGdlamFsYSB5YW5nIGNvY29rIGRlbmdhbiBhbHRlcm5hdGlmIGluaS4iO31zOjY6IlBSRVNFVCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE1OiJQcmVzZXQgc2VpbWJhbmciO3M6NToiamVuaXMiO3M6NjoicHJlc2V0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42O3M6ODoibWJfYm9udXMiO2Q6MC4wMztzOjg6Im1kX2JvbnVzIjtkOi0wLjAxO3M6NjoiaW1wYWN0IjtkOjAuMDQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NTc6IlNlbXVhIGFsdGVybmF0aWYgbWVuZGFwYXQgcGVueWVzdWFpYW4gbW9kZXJhdCBkYW4gc3RhYmlsLiI7fXM6MjoiQzEiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxNDoiSmVuaXMgUGVueWFraXQiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuNTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM7czo4OiJtZF9ib251cyI7ZDowLjAxODtzOjY6ImltcGFjdCI7ZDowLjAxMjtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NToiUHJlZmVyZW5zaSBpbmkgbWVtYmVyaSBwZW55ZXN1YWlhbiB0YW1iYWhhbiBwYWRhIG5pbGFpIGtleWFraW5hbi4iO31zOjI6IkMyIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NToiSGFyZ2EiO3M6NToiamVuaXMiO3M6NDoiY29zdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjE7czo4OiJtYl9ib251cyI7ZDowLjA2O3M6ODoibWRfYm9udXMiO2Q6MDtzOjY6ImltcGFjdCI7ZDowLjA2O3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjYwOiJQcmVmZXJlbnNpIGluaSBtZW1wZXJrdWF0IGFsdGVybmF0aWYgeWFuZyBsZWJpaCBoZW1hdCBiaWF5YS4iO31zOjI6IkMzIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTE6IkVmZWt0aXZpdGFzIjtzOjU6ImplbmlzIjtzOjc6ImJlbmVmaXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjYxNTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM2OTtzOjg6Im1kX2JvbnVzIjtkOjAuMDEzODY7czo2OiJpbXBhY3QiO2Q6MC4wMjMwNDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo4MzoiUHJlZmVyZW5zaSBpbmkgbWVtcGVya3VhdCBhbHRlcm5hdGlmIHlhbmcgcHVueWEga2V5YWtpbmFuIGRhc2FyIHBha2FyIGxlYmloIHRpbmdnaS4iO31zOjI6IkM0IjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTc6IkRhbXBhayBMaW5na3VuZ2FuIjtzOjU6ImplbmlzIjtzOjQ6ImNvc3QiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjY1O3M6ODoibWJfYm9udXMiO2Q6MC4wMzk7czo4OiJtZF9ib251cyI7ZDowLjAxMjY7czo2OiJpbXBhY3QiO2Q6MC4wMjY0O3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjY3OiJQcmVmZXJlbnNpIGluaSBtZW5kb3JvbmcgYWx0ZXJuYXRpZiB5YW5nIGxlYmloIGFtYW4gZGFuIHRlcmtlbmRhbGkuIjt9fXM6NzoiY2ZfbWV0YSI7YTo2OntzOjc6Im1iX2F3YWwiO2Q6MC45OTg4O3M6NzoibWRfYXdhbCI7ZDowLjM4Mzc1MjtzOjc6ImNmX2F3YWwiO2Q6MC42MTUwNDg7czo4OiJtYl9ha2hpciI7ZDoxO3M6ODoibWRfYWtoaXIiO2Q6MC40MTgyMTI7czo4OiJjZl9ha2hpciI7ZDowLjU4MTc4ODt9czo5OiJwZXJpbmdrYXQiO2k6MTtzOjg6ImNmX2FraGlyIjtkOjAuNzk3Nzg3OTk5OTk5OTk5OTtzOjE4OiJwcmVmZXJlbmNlX2FwcGxpZWQiO2I6MTtzOjE1OiJhZGp1c3RtZW50X2luZm8iO2E6Mjp7czoxMjoicHJlc2V0X2Jvb3N0IjtkOjAuMjE2O3M6MTg6InN5bXB0b21fYWRqdXN0bWVudCI7ZDowLjA3Njt9fWk6MTthOjExOntzOjI6ImlkIjtpOjY7czo0OiJrb2RlIjtzOjQ6IlBLMDYiO3M6NDoibmFtYSI7czoxOToiWkEgKEFtb25pdW0gU3VsZmF0KSI7czoyOiJ2aSI7ZDowLjY5NDAwMjtzOjQ6Im1ldGEiO2E6MTM6e3M6MTA6ImdhbWJhcl91cmwiO3M6NzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL3B1cHVrLzliM2ZlN2IzLTI0YWUtNDBkNi1iY2Y2LTQyOWQ0OTAwNWI3MS5qcGciO3M6OToia2FuZHVuZ2FuIjtzOjEyOiJOIDIxJSwgUyAyNCUiO3M6MTY6ImthbmR1bmdhbl9kZXRhaWwiO3M6NjM6Ik5pdHJvZ2VuIChOKTogwrEyMSUNClN1bGZ1ciAoUyk6IMKxMjQlDQpCZW50dWs6IChOSOKChCnigoJTT+KChCI7czoxMToiYmFoYW5fYWt0aWYiO047czoxMjoiZnVuZ3NpX3V0YW1hIjtzOjExNzoiTWVuYW1iYWggdW5zdXIgbml0cm9nZW4gZGFuIHN1bGZ1ciwgbWVtYmFudHUgcGVtYmVudHVrYW4gZGF1biBoaWphdSwgc2VydGEgbWVuZHVrdW5nIHBlbWJlbnR1a2FuIHByb3RlaW4gcGFkYSB0YW5hbWFuIjtzOjY6ImZ1bmdzaSI7TjtzOjc6InRha2FyYW4iO3M6MTc6IsKxMTAw4oCTMjAwIGtnL2hhIjtzOjU6ImRvc2lzIjtOO3M6MTU6ImVmZWtfcGVuZ2d1bmFhbiI7czoxMDU6IkRhdW4gbGViaWggaGlqYXUsIHBlcnR1bWJ1aGFuIGxlYmloIGJhaWssIGRhbiB0YW5hbWFuIGxlYmloIHRhaGFuIHRlcmhhZGFwIGtla3VyYW5nYW4gdW5zdXIgaGFyYSB0ZXJ0ZW50dSI7czoxMzoiY2FyYV9hcGxpa2FzaSI7czo4MzoiRGlzZWJhciBtZXJhdGEgZGkgbGFoYW4gKHRhYnVyKSwgc2ViYWlrbnlhIHBhZGEgdGFuYWggbGVtYmFiIGF0YXUgc2ViZWx1bSBwZW5nYWlyYW4iO3M6MjA6ImphZHdhbF91bXVyX2FwbGlrYXNpIjtzOjU2OiI34oCTMTAgSFNUIChhd2FsIHBlcnR1bWJ1aGFuKQ0KMjDigJMyNSBIU1QgKGZhc2UgYW5ha2FuKSI7czoxODoiZnJla3VlbnNpX2FwbGlrYXNpIjtzOjI4OiIx4oCTMiBrYWxpIHNlbGFtYSBtYXNhIHRhbmFtIjtzOjEyOiJnZWphbGFfY29jb2siO2E6NDp7aTowO2E6Njp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJHMDEiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ2OiJCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvZmU2ZjhlNzktNTk2Ni00YzRiLWI2MzMtNTdmODEzOTRmYTQ2LmpwZyI7czoyOiJtYiI7ZDowLjc1O3M6MjoibWQiO2Q6MC4xNTt9aToxO2E6Njp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9hODRhYTg4NC1kOWIwLTQ5NmQtYTRkYy0yNTliMjUyYTE4YjUuanBnIjtzOjI6Im1iIjtkOjAuNztzOjI6Im1kIjtkOjAuMTt9aToyO2E6Njp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7czoyOiJtYiI7ZDowLjc7czoyOiJtZCI7ZDowLjE7fWk6MzthOjY6e3M6MjoiaWQiO2k6MTQ7czo0OiJrb2RlIjtzOjM6IkcxNCI7czoxMToibmFtYV9nZWphbGEiO3M6NDE6IkJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvMWVkMGVjNDYtZjg2YS00YjhiLThjNzAtYjhlMjUyMDJmZTgzLnBuZyI7czoyOiJtYiI7ZDowLjU1O3M6MjoibWQiO2Q6MC4yNTt9fX1zOjY6ImRldGFpbCI7YToxMDp7czo4OiJHRUpBTEFfMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjUyOiJHMDEgLSBCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOjAuNjtzOjg6Im1iX2JvbnVzIjtkOjAuNzU7czo4OiJtZF9ib251cyI7ZDowLjE1O3M6NjoiaW1wYWN0IjtkOjAuNjtzOjI6ImNmIjtkOjAuNjtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMiI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjY2OiJHMDIgLSBMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6MC42O3M6ODoibWJfYm9udXMiO2Q6MC43O3M6ODoibWRfYm9udXMiO2Q6MC4xO3M6NjoiaW1wYWN0IjtkOjAuNjtzOjI6ImNmIjtkOjAuNjtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMyI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQwOiJHMDMgLSBCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOjAuNjtzOjg6Im1iX2JvbnVzIjtkOjAuNztzOjg6Im1kX2JvbnVzIjtkOjAuMTtzOjY6ImltcGFjdCI7ZDowLjY7czoyOiJjZiI7ZDowLjY7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6OToiR0VKQUxBXzE0IjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NDc6IkcxNCAtIEJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOjAuMztzOjg6Im1iX2JvbnVzIjtkOjAuNTU7czo4OiJtZF9ib251cyI7ZDowLjI1O3M6NjoiaW1wYWN0IjtkOjAuMztzOjI6ImNmIjtkOjAuMztzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo0OiJCQVNFIjthOjExOntzOjg6ImtyaXRlcmlhIjtzOjMxOiJBa3VtdWxhc2kga2V5YWtpbmFuIGRhc2FyIHBha2FyIjtzOjU6ImplbmlzIjtzOjQ6ImJhc2UiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7aToxO3M6ODoibWJfYm9udXMiO2k6MDtzOjg6Im1kX2JvbnVzIjtpOjA7czo2OiJpbXBhY3QiO2Q6MC41MDYyNTtzOjc6Im1iX2F3YWwiO2Q6MC45ODk4NzU7czo3OiJtZF9hd2FsIjtkOjAuNDgzNjI1O3M6MjoiY2YiO2Q6MC41MDYyNTtzOjc6ImNhdGF0YW4iO3M6ODU6Ik5pbGFpIGF3YWwgZGliZW50dWsgZGFyaSBnYWJ1bmdhbiBzZW11YSBydWxlIGdlamFsYSB5YW5nIGNvY29rIGRlbmdhbiBhbHRlcm5hdGlmIGluaS4iO31zOjY6IlBSRVNFVCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE1OiJQcmVzZXQgc2VpbWJhbmciO3M6NToiamVuaXMiO3M6NjoicHJlc2V0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42O3M6ODoibWJfYm9udXMiO2Q6MC4wMztzOjg6Im1kX2JvbnVzIjtkOi0wLjAxO3M6NjoiaW1wYWN0IjtkOjAuMDQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NTc6IlNlbXVhIGFsdGVybmF0aWYgbWVuZGFwYXQgcGVueWVzdWFpYW4gbW9kZXJhdCBkYW4gc3RhYmlsLiI7fXM6MjoiQzEiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxNDoiSmVuaXMgUGVueWFraXQiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuNTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM7czo4OiJtZF9ib251cyI7ZDowLjAxODtzOjY6ImltcGFjdCI7ZDowLjAxMjtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NToiUHJlZmVyZW5zaSBpbmkgbWVtYmVyaSBwZW55ZXN1YWlhbiB0YW1iYWhhbiBwYWRhIG5pbGFpIGtleWFraW5hbi4iO31zOjI6IkMyIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NToiSGFyZ2EiO3M6NToiamVuaXMiO3M6NDoiY29zdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjE7czo4OiJtYl9ib251cyI7ZDowLjA2O3M6ODoibWRfYm9udXMiO2Q6MDtzOjY6ImltcGFjdCI7ZDowLjA2O3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjYwOiJQcmVmZXJlbnNpIGluaSBtZW1wZXJrdWF0IGFsdGVybmF0aWYgeWFuZyBsZWJpaCBoZW1hdCBiaWF5YS4iO31zOjI6IkMzIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTE6IkVmZWt0aXZpdGFzIjtzOjU6ImplbmlzIjtzOjc6ImJlbmVmaXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjUwNjM7czo4OiJtYl9ib251cyI7ZDowLjAzMDM3ODtzOjg6Im1kX2JvbnVzIjtkOjAuMDE3NzczO3M6NjoiaW1wYWN0IjtkOjAuMDEyNjA1O3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjgzOiJQcmVmZXJlbnNpIGluaSBtZW1wZXJrdWF0IGFsdGVybmF0aWYgeWFuZyBwdW55YSBrZXlha2luYW4gZGFzYXIgcGFrYXIgbGViaWggdGluZ2dpLiI7fXM6MjoiQzQiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxNzoiRGFtcGFrIExpbmdrdW5nYW4iO3M6NToiamVuaXMiO3M6NDoiY29zdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuNjU7czo4OiJtYl9ib251cyI7ZDowLjAzOTtzOjg6Im1kX2JvbnVzIjtkOjAuMDEyNjtzOjY6ImltcGFjdCI7ZDowLjAyNjQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6Njc6IlByZWZlcmVuc2kgaW5pIG1lbmRvcm9uZyBhbHRlcm5hdGlmIHlhbmcgbGViaWggYW1hbiBkYW4gdGVya2VuZGFsaS4iO319czo3OiJjZl9tZXRhIjthOjY6e3M6NzoibWJfYXdhbCI7ZDowLjk4OTg3NTtzOjc6Im1kX2F3YWwiO2Q6MC40ODM2MjU7czo3OiJjZl9hd2FsIjtkOjAuNTA2MjU7czo4OiJtYl9ha2hpciI7ZDoxO3M6ODoibWRfYWtoaXIiO2Q6MC41MjE5OTg7czo4OiJjZl9ha2hpciI7ZDowLjQ3ODAwMjt9czo5OiJwZXJpbmdrYXQiO2k6MjtzOjg6ImNmX2FraGlyIjtkOjAuNjk0MDAyO3M6MTg6InByZWZlcmVuY2VfYXBwbGllZCI7YjoxO3M6MTU6ImFkanVzdG1lbnRfaW5mbyI7YToyOntzOjEyOiJwcmVzZXRfYm9vc3QiO2Q6MC4yMTY7czoxODoic3ltcHRvbV9hZGp1c3RtZW50IjtkOjAuMDc2O319aToyO2E6MTE6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6NDoiUEswMiI7czo0OiJuYW1hIjtzOjExOiJOUEsgUGhvbnNrYSI7czoyOiJ2aSI7ZDowLjM1NTcyMDAwMDAwMDAwMDA0O3M6NDoibWV0YSI7YToxMzp7czoxMDoiZ2FtYmFyX3VybCI7czo3NjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvcHVwdWsvNzljMGI0OWEtZDdhMS00ODgyLTg5MjktYzUxODUwZmQzNTFlLnBuZyI7czo5OiJrYW5kdW5nYW4iO3M6MTk6Ik4xNSUgUDE1JSBLMTUlIFMxMCUiO3M6MTY6ImthbmR1bmdhbl9kZXRhaWwiO3M6ODY6Ik5pdHJvZ2VuIChOKSAxNSUg4oCiIEZvc2ZvciAoUOKCgk/igoUpIDE1JSDigKIgS2FsaXVtIChL4oKCTykgMTUlIOKAoiBTdWxmdXIgKFMpIMKxMTAlIjtzOjExOiJiYWhhbl9ha3RpZiI7TjtzOjEyOiJmdW5nc2lfdXRhbWEiO3M6MTI3OiJNZW5kdWt1bmcgcGVydHVtYnVoYW4gc2VpbWJhbmcgKGFrYXIsIGJhdGFuZywgZGF1biksIG1lbXBlcmt1YXQgdGFuYW1hbiwgc2VydGEgbWVuaW5na2F0a2FuIHBlbWJlbnR1a2FuIGRhbiBrdWFsaXRhcyBidWxpciBwYWRpIjtzOjY6ImZ1bmdzaSI7TjtzOjc6InRha2FyYW4iO3M6NTg6IsKxMjAw4oCTMzAwIGtnL2hhIChkYXBhdCBkaXNlc3VhaWthbiBkZW5nYW4ga29uZGlzaSB0YW5haCkiO3M6NToiZG9zaXMiO047czoxNToiZWZla19wZW5nZ3VuYWFuIjtzOjgxOiJUYW5hbWFuIGxlYmloIGtva29oLCBha2FyIGt1YXQsIGRhdW4gaGlqYXUgc2VoYXQsIHNlcnRhIGhhc2lsIHBhbmVuIGxlYmloIG9wdGltYWwiO3M6MTM6ImNhcmFfYXBsaWthc2kiO3M6MTAwOiJEaXNlYmFyIG1lcmF0YSBkaSBsYWhhbiAodGFidXIpLCBiaXNhIGRpY2FtcHVyIGRlbmdhbiB0YW5haCBhdGF1IGRpYmVyaWthbiBzYWF0IGtvbmRpc2kgbGFoYW4gbGVtYmFiIjtzOjIwOiJqYWR3YWxfdW11cl9hcGxpa2FzaSI7czo1NjoiN+KAkzEwIEhTVCAoYXdhbCBwZXJ0dW1idWhhbikNCjIw4oCTMjUgSFNUIChmYXNlIGFuYWthbikiO3M6MTg6ImZyZWt1ZW5zaV9hcGxpa2FzaSI7czoyNDoiMiBrYWxpIHNlbGFtYSBtYXNhIHRhbmFtIjtzOjEyOiJnZWphbGFfY29jb2siO2E6NDp7aTowO2E6Njp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJHMDEiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ2OiJCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvZmU2ZjhlNzktNTk2Ni00YzRiLWI2MzMtNTdmODEzOTRmYTQ2LmpwZyI7czoyOiJtYiI7ZDowLjU7czoyOiJtZCI7ZDowLjI7fWk6MTthOjY6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6MzoiRzAyIjtzOjExOiJuYW1hX2dlamFsYSI7czo2MDoiTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvYTg0YWE4ODQtZDliMC00OTZkLWE0ZGMtMjU5YjI1MmExOGI1LmpwZyI7czoyOiJtYiI7ZDowLjY7czoyOiJtZCI7ZDowLjI7fWk6MjthOjY6e3M6MjoiaWQiO2k6MztzOjQ6ImtvZGUiO3M6MzoiRzAzIjtzOjExOiJuYW1hX2dlamFsYSI7czozNDoiQnVsaXIgcGFkaSBoYW1wYSBhdGF1IHRpZGFrIGJlcmlzaSI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzVkNTY2ZmQ4LTQyM2QtNGYzMi04MThkLWZiZWRjZDYzNWRjZi5qcGciO3M6MjoibWIiO2Q6MC40O3M6MjoibWQiO2Q6MC41O31pOjM7YTo2OntzOjI6ImlkIjtpOjE0O3M6NDoia29kZSI7czozOiJHMTQiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQxOiJCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzFlZDBlYzQ2LWY4NmEtNGI4Yi04YzcwLWI4ZTI1MjAyZmU4My5wbmciO3M6MjoibWIiO2Q6MC40O3M6MjoibWQiO2Q6MC40O319fXM6NjoiZGV0YWlsIjthOjEwOntzOjg6IkdFSkFMQV8xIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NTI6IkcwMSAtIEJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6MC4zO3M6ODoibWJfYm9udXMiO2Q6MC41O3M6ODoibWRfYm9udXMiO2Q6MC4yO3M6NjoiaW1wYWN0IjtkOjAuMztzOjI6ImNmIjtkOjAuMztzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMiI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjY2OiJHMDIgLSBMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6MC40O3M6ODoibWJfYm9udXMiO2Q6MC42O3M6ODoibWRfYm9udXMiO2Q6MC4yO3M6NjoiaW1wYWN0IjtkOjAuNDtzOjI6ImNmIjtkOjAuNDtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMyI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQwOiJHMDMgLSBCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjE7czo4OiJtYl9ib251cyI7ZDowLjQ7czo4OiJtZF9ib251cyI7ZDowLjU7czo2OiJpbXBhY3QiO2Q6LTAuMTtzOjI6ImNmIjtkOi0wLjE7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6OToiR0VKQUxBXzE0IjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NDc6IkcxNCAtIEJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOjA7czo4OiJtYl9ib251cyI7ZDowLjQ7czo4OiJtZF9ib251cyI7ZDowLjQ7czo2OiJpbXBhY3QiO2Q6MDtzOjI6ImNmIjtkOjA7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6NDoiQkFTRSI7YToxMTp7czo4OiJrcml0ZXJpYSI7czozMToiQWt1bXVsYXNpIGtleWFraW5hbiBkYXNhciBwYWthciI7czo1OiJqZW5pcyI7czo0OiJiYXNlIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2k6MTtzOjg6Im1iX2JvbnVzIjtpOjA7czo4OiJtZF9ib251cyI7aTowO3M6NjoiaW1wYWN0IjtkOjAuMTI7czo3OiJtYl9hd2FsIjtkOjAuOTI4O3M6NzoibWRfYXdhbCI7ZDowLjgwODtzOjI6ImNmIjtkOjAuMTI7czo3OiJjYXRhdGFuIjtzOjg1OiJOaWxhaSBhd2FsIGRpYmVudHVrIGRhcmkgZ2FidW5nYW4gc2VtdWEgcnVsZSBnZWphbGEgeWFuZyBjb2NvayBkZW5nYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo2OiJQUkVTRVQiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxNToiUHJlc2V0IHNlaW1iYW5nIjtzOjU6ImplbmlzIjtzOjY6InByZXNldCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuNjtzOjg6Im1iX2JvbnVzIjtkOjAuMDM7czo4OiJtZF9ib251cyI7ZDotMC4wMTtzOjY6ImltcGFjdCI7ZDowLjA0O3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjU3OiJTZW11YSBhbHRlcm5hdGlmIG1lbmRhcGF0IHBlbnllc3VhaWFuIG1vZGVyYXQgZGFuIHN0YWJpbC4iO31zOjI6IkMxIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTQ6IkplbmlzIFBlbnlha2l0IjtzOjU6ImplbmlzIjtzOjc6ImJlbmVmaXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjU7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6MC4wMTg7czo2OiJpbXBhY3QiO2Q6MC4wMTI7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjU6IlByZWZlcmVuc2kgaW5pIG1lbWJlcmkgcGVueWVzdWFpYW4gdGFtYmFoYW4gcGFkYSBuaWxhaSBrZXlha2luYW4uIjt9czoyOiJDMiI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjU6IkhhcmdhIjtzOjU6ImplbmlzIjtzOjQ6ImNvc3QiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDoxO3M6ODoibWJfYm9udXMiO2Q6MC4wNjtzOjg6Im1kX2JvbnVzIjtkOjA7czo2OiJpbXBhY3QiO2Q6MC4wNjtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2MDoiUHJlZmVyZW5zaSBpbmkgbWVtcGVya3VhdCBhbHRlcm5hdGlmIHlhbmcgbGViaWggaGVtYXQgYmlheWEuIjt9czoyOiJDMyI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjExOiJFZmVrdGl2aXRhcyI7czo1OiJqZW5pcyI7czo3OiJiZW5lZml0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC4xMjtzOjg6Im1iX2JvbnVzIjtkOjAuMDA3MjtzOjg6Im1kX2JvbnVzIjtkOjAuMDMxNjg7czo2OiJpbXBhY3QiO2Q6LTAuMDI0NDg7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6ODM6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIHB1bnlhIGtleWFraW5hbiBkYXNhciBwYWthciBsZWJpaCB0aW5nZ2kuIjt9czoyOiJDNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE3OiJEYW1wYWsgTGluZ2t1bmdhbiI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42NTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM5O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI2O3M6NjoiaW1wYWN0IjtkOjAuMDI2NDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NzoiUHJlZmVyZW5zaSBpbmkgbWVuZG9yb25nIGFsdGVybmF0aWYgeWFuZyBsZWJpaCBhbWFuIGRhbiB0ZXJrZW5kYWxpLiI7fX1zOjc6ImNmX21ldGEiO2E6Njp7czo3OiJtYl9hd2FsIjtkOjAuOTI4O3M6NzoibWRfYXdhbCI7ZDowLjgwODtzOjc6ImNmX2F3YWwiO2Q6MC4xMjtzOjg6Im1iX2FraGlyIjtkOjE7czo4OiJtZF9ha2hpciI7ZDowLjg2MDI4O3M6ODoiY2ZfYWtoaXIiO2Q6MC4xMzk3Mjt9czo5OiJwZXJpbmdrYXQiO2k6MztzOjg6ImNmX2FraGlyIjtkOjAuMzU1NzIwMDAwMDAwMDAwMDQ7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7czoxNToiYWRqdXN0bWVudF9pbmZvIjthOjI6e3M6MTI6InByZXNldF9ib29zdCI7ZDowLjIxNjtzOjE4OiJzeW1wdG9tX2FkanVzdG1lbnQiO2Q6MC4wNzY7fX1pOjM7YToxMTp7czoyOiJpZCI7aTo1O3M6NDoia29kZSI7czo0OiJQSzA1IjtzOjQ6Im5hbWEiO3M6MjA6IlB1cHVrIE9yZ2FuaWsgS29tcG9zIjtzOjI6InZpIjtkOjAuMDIyNjAwMDAwMDAwMDAwMDM3O3M6NDoibWV0YSI7YToxMzp7czoxMDoiZ2FtYmFyX3VybCI7czo3NjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvcHVwdWsvMGFmODMzNzgtYWMyZC00MzIxLWJmM2QtN2MwYWQ0Yjk3ZWQzLmpwZyI7czo5OiJrYW5kdW5nYW4iO3M6MTY6IkMtb3JnYW5payDiiaUxNSUiO3M6MTY6ImthbmR1bmdhbl9kZXRhaWwiO3M6MTkzOiJCYWhhbiBvcmdhbmlrOiDCsTIw4oCTMzAlDQpOaXRyb2dlbiAoTik6IMKxMeKAkzIlDQpGb3Nmb3IgKFDigoJP4oKFKTogwrEwLjXigJMxJQ0KS2FsaXVtIChL4oKCTyk6IMKxMeKAkzIlDQpDL04gcmFzaW86IMKxMTDigJMyMA0KTWVuZ2FuZHVuZyB1bnN1ciBtaWtybyAoQ2EsIE1nLCBGZSwgWm4sIGRsbCkgZGFsYW0ganVtbGFoIGtlY2lsIjtzOjExOiJiYWhhbl9ha3RpZiI7TjtzOjEyOiJmdW5nc2lfdXRhbWEiO3M6MTA3OiJNZW1wZXJiYWlraSBzdHJ1a3R1ciB0YW5haCwgbWVuaW5na2F0a2FuIGtlc3VidXJhbiB0YW5haCwgc2VydGEgbWVtYmFudHUgcGVueWVyYXBhbiB1bnN1ciBoYXJhIG9sZWggdGFuYW1hbiI7czo2OiJmdW5nc2kiO047czo3OiJ0YWthcmFuIjtzOjE0OiLCsTLigJM1IHRvbi9oYSI7czo1OiJkb3NpcyI7TjtzOjE1OiJlZmVrX3BlbmdndW5hYW4iO3M6Nzc6IlRhbmFoIGxlYmloIGdlbWJ1ciwgZGF5YSBzaW1wYW4gYWlyIG1lbmluZ2thdCwgZGFuIHRhbmFtYW4gdHVtYnVoIGxlYmloIHNlaGF0IjtzOjEzOiJjYXJhX2FwbGlrYXNpIjtzOjc3OiJEaXRlYmFyIG1lcmF0YSBsYWx1IGRpY2FtcHVyIGRlbmdhbiB0YW5haCBzYWF0IHBlbmdvbGFoYW4gbGFoYW4gc2ViZWx1bSB0YW5hbSI7czoyMDoiamFkd2FsX3VtdXJfYXBsaWthc2kiO3M6MzE6IlNhYXQgb2xhaCB0YW5haCAoc2ViZWx1bSB0YW5hbSkiO3M6MTg6ImZyZWt1ZW5zaV9hcGxpa2FzaSI7czoyNToiMSBrYWxpIHNldGlhcCBtdXNpbSB0YW5hbSI7czoxMjoiZ2VqYWxhX2NvY29rIjthOjQ6e2k6MDthOjY6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2ZlNmY4ZTc5LTU5NjYtNGM0Yi1iNjMzLTU3ZjgxMzk0ZmE0Ni5qcGciO3M6MjoibWIiO2Q6MC4yO3M6MjoibWQiO2Q6MC41O31pOjE7YTo2OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IkcwMiI7czoxMToibmFtYV9nZWphbGEiO3M6NjA6IkxlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2E4NGFhODg0LWQ5YjAtNDk2ZC1hNGRjLTI1OWIyNTJhMThiNS5qcGciO3M6MjoibWIiO2Q6MC4zO3M6MjoibWQiO2Q6MC41O31pOjI7YTo2OntzOjI6ImlkIjtpOjM7czo0OiJrb2RlIjtzOjM6IkcwMyI7czoxMToibmFtYV9nZWphbGEiO3M6MzQ6IkJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS81ZDU2NmZkOC00MjNkLTRmMzItODE4ZC1mYmVkY2Q2MzVkY2YuanBnIjtzOjI6Im1iIjtkOjAuMjtzOjI6Im1kIjtkOjAuNjt9aTozO2E6Njp7czoyOiJpZCI7aToxNDtzOjQ6ImtvZGUiO3M6MzoiRzE0IjtzOjExOiJuYW1hX2dlamFsYSI7czo0MToiQmVyY2FrIGhpdGFtIGF0YXUgY29rbGF0IHBhZGEga3VsaXQgZ2FiYWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS8xZWQwZWM0Ni1mODZhLTRiOGItOGM3MC1iOGUyNTIwMmZlODMucG5nIjtzOjI6Im1iIjtkOjAuMjtzOjI6Im1kIjtkOjAuNjt9fX1zOjY6ImRldGFpbCI7YToxMDp7czo4OiJHRUpBTEFfMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjUyOiJHMDEgLSBCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjM7czo4OiJtYl9ib251cyI7ZDowLjI7czo4OiJtZF9ib251cyI7ZDowLjU7czo2OiJpbXBhY3QiO2Q6LTAuMztzOjI6ImNmIjtkOi0wLjM7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6ODoiR0VKQUxBXzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo2NjoiRzAyIC0gTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjI7czo4OiJtYl9ib251cyI7ZDowLjM7czo4OiJtZF9ib251cyI7ZDowLjU7czo2OiJpbXBhY3QiO2Q6LTAuMjtzOjI6ImNmIjtkOi0wLjI7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6ODoiR0VKQUxBXzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo0MDoiRzAzIC0gQnVsaXIgcGFkaSBoYW1wYSBhdGF1IHRpZGFrIGJlcmlzaSI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC40O3M6ODoibWJfYm9udXMiO2Q6MC4yO3M6ODoibWRfYm9udXMiO2Q6MC42O3M6NjoiaW1wYWN0IjtkOi0wLjQ7czoyOiJjZiI7ZDotMC40O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjk6IkdFSkFMQV8xNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQ3OiJHMTQgLSBCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC40O3M6ODoibWJfYm9udXMiO2Q6MC4yO3M6ODoibWRfYm9udXMiO2Q6MC42O3M6NjoiaW1wYWN0IjtkOi0wLjQ7czoyOiJjZiI7ZDotMC40O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjQ6IkJBU0UiO2E6MTE6e3M6ODoia3JpdGVyaWEiO3M6MzE6IkFrdW11bGFzaSBrZXlha2luYW4gZGFzYXIgcGFrYXIiO3M6NToiamVuaXMiO3M6NDoiYmFzZSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtpOjE7czo4OiJtYl9ib251cyI7aTowO3M6ODoibWRfYm9udXMiO2k6MDtzOjY6ImltcGFjdCI7ZDotMC4zMTg0O3M6NzoibWJfYXdhbCI7ZDowLjY0MTY7czo3OiJtZF9hd2FsIjtkOjAuOTY7czoyOiJjZiI7ZDotMC4zMTg0O3M6NzoiY2F0YXRhbiI7czo4NToiTmlsYWkgYXdhbCBkaWJlbnR1ayBkYXJpIGdhYnVuZ2FuIHNlbXVhIHJ1bGUgZ2VqYWxhIHlhbmcgY29jb2sgZGVuZ2FuIGFsdGVybmF0aWYgaW5pLiI7fXM6NjoiUFJFU0VUIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTU6IlByZXNldCBzZWltYmFuZyI7czo1OiJqZW5pcyI7czo2OiJwcmVzZXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjY7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6LTAuMDE7czo2OiJpbXBhY3QiO2Q6MC4wNDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo1NzoiU2VtdWEgYWx0ZXJuYXRpZiBtZW5kYXBhdCBwZW55ZXN1YWlhbiBtb2RlcmF0IGRhbiBzdGFiaWwuIjt9czoyOiJDMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE0OiJKZW5pcyBQZW55YWtpdCI7czo1OiJqZW5pcyI7czo3OiJiZW5lZml0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC41O3M6ODoibWJfYm9udXMiO2Q6MC4wMztzOjg6Im1kX2JvbnVzIjtkOjAuMDE4O3M6NjoiaW1wYWN0IjtkOjAuMDEyO3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjY1OiJQcmVmZXJlbnNpIGluaSBtZW1iZXJpIHBlbnllc3VhaWFuIHRhbWJhaGFuIHBhZGEgbmlsYWkga2V5YWtpbmFuLiI7fXM6MjoiQzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1OiJIYXJnYSI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MTtzOjg6Im1iX2JvbnVzIjtkOjAuMDY7czo4OiJtZF9ib251cyI7ZDowO3M6NjoiaW1wYWN0IjtkOjAuMDY7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjA6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIGxlYmloIGhlbWF0IGJpYXlhLiI7fXM6MjoiQzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxMToiRWZla3Rpdml0YXMiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuMTtzOjg6Im1iX2JvbnVzIjtkOjAuMDA2O3M6ODoibWRfYm9udXMiO2Q6MC4wMzI0O3M6NjoiaW1wYWN0IjtkOi0wLjAyNjQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6ODM6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIHB1bnlhIGtleWFraW5hbiBkYXNhciBwYWthciBsZWJpaCB0aW5nZ2kuIjt9czoyOiJDNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE3OiJEYW1wYWsgTGluZ2t1bmdhbiI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42NTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM5O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI2O3M6NjoiaW1wYWN0IjtkOjAuMDI2NDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NzoiUHJlZmVyZW5zaSBpbmkgbWVuZG9yb25nIGFsdGVybmF0aWYgeWFuZyBsZWJpaCBhbWFuIGRhbiB0ZXJrZW5kYWxpLiI7fX1zOjc6ImNmX21ldGEiO2E6Njp7czo3OiJtYl9hd2FsIjtkOjAuNjQxNjtzOjc6Im1kX2F3YWwiO2Q6MC45NjtzOjc6ImNmX2F3YWwiO2Q6LTAuMzE4NDtzOjg6Im1iX2FraGlyIjtkOjAuODA2NjtzOjg6Im1kX2FraGlyIjtkOjE7czo4OiJjZl9ha2hpciI7ZDotMC4xOTM0O31zOjk6InBlcmluZ2thdCI7aTo0O3M6ODoiY2ZfYWtoaXIiO2Q6MC4wMjI2MDAwMDAwMDAwMDAwMzc7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7czoxNToiYWRqdXN0bWVudF9pbmZvIjthOjI6e3M6MTI6InByZXNldF9ib29zdCI7ZDowLjIxNjtzOjE4OiJzeW1wdG9tX2FkanVzdG1lbnQiO2Q6MC4wNzY7fX1pOjQ7YToxMTp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czo0OiJQSzAzIjtzOjQ6Im5hbWEiO3M6NToiU1AtMzYiO3M6MjoidmkiO2Q6LTAuMDc3OTk5OTk5OTk5OTk5OTY7czo0OiJtZXRhIjthOjEzOntzOjEwOiJnYW1iYXJfdXJsIjtzOjc2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9wdXB1ay9hZTU1ZjhjNC01NDYzLTRlN2EtYjAzNS04NzJjNDVmMTc2YjEuanBnIjtzOjk6ImthbmR1bmdhbiI7czo1OiJQIDM2JSI7czoxNjoia2FuZHVuZ2FuX2RldGFpbCI7czoxNDQ6IkZvc2ZvciAoUOKCgk/igoUpIHRvdGFsOiDCsTM2JQ0KRm9zZm9yIGxhcnV0IGRhbGFtIGFpcjogwrEzMCUNCkZvc2ZvciBsYXJ1dCBkYWxhbSBhc2FtIHNpdHJhdDogwrEzNCUNCkthbHNpdW0gKENhKTogwrExNeKAkzIwJQ0KU3VsZnVyIChTKTogwrE1JSI7czoxMToiYmFoYW5fYWt0aWYiO047czoxMjoiZnVuZ3NpX3V0YW1hIjtzOjEwODoiTWVyYW5nc2FuZyBwZXJ0dW1idWhhbiBha2FyLCBtZW1wZXJjZXBhdCBwZW1iZW50dWthbiBhbmFrYW4sIHNlcnRhIG1lbWJhbnR1IHBlbWJlbnR1a2FuIGJ1bmdhIGRhbiBidWxpciBwYWRpIjtzOjY6ImZ1bmdzaSI7TjtzOjc6InRha2FyYW4iO3M6MTc6IsKxMTAw4oCTMTUwIGtnL2hhIjtzOjU6ImRvc2lzIjtOO3M6MTU6ImVmZWtfcGVuZ2d1bmFhbiI7czo4MDoiQWthciBsZWJpaCBrdWF0LCB0YW5hbWFuIGxlYmloIGNlcGF0IHR1bWJ1aCwgZGFuIHBlbWJlbnR1a2FuIG1hbGFpIGxlYmloIG9wdGltYWwiO3M6MTM6ImNhcmFfYXBsaWthc2kiO3M6OTc6IkRpc2ViYXIgbWVyYXRhIGRpIGxhaGFuIGRhbiBzZWJhaWtueWEgZGljYW1wdXIgZGVuZ2FuIHRhbmFoIHNhYXQgcGVuZ29sYWhhbiBsYWhhbiBhdGF1IGF3YWwgdGFuYW0iO3M6MjA6ImphZHdhbF91bXVyX2FwbGlrYXNpIjtzOjU1OiJTYWF0IG9sYWggdGFuYWggKHNlYmVsdW0gdGFuYW0pDQow4oCTNyBIU1QgKGF3YWwgdGFuYW0pIjtzOjE4OiJmcmVrdWVuc2lfYXBsaWthc2kiO3M6Mjg6IjHigJMyIGthbGkgc2VsYW1hIG1hc2EgdGFuYW0iO3M6MTI6ImdlamFsYV9jb2NvayI7YTo0OntpOjA7YTo2OntzOjI6ImlkIjtpOjE7czo0OiJrb2RlIjtzOjM6IkcwMSI7czoxMToibmFtYV9nZWphbGEiO3M6NDY6IkJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9mZTZmOGU3OS01OTY2LTRjNGItYjYzMy01N2Y4MTM5NGZhNDYuanBnIjtzOjI6Im1iIjtkOjAuMTU7czoyOiJtZCI7ZDowLjU1O31pOjE7YTo2OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IkcwMiI7czoxMToibmFtYV9nZWphbGEiO3M6NjA6IkxlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2E4NGFhODg0LWQ5YjAtNDk2ZC1hNGRjLTI1OWIyNTJhMThiNS5qcGciO3M6MjoibWIiO2Q6MC4yO3M6MjoibWQiO2Q6MC42O31pOjI7YTo2OntzOjI6ImlkIjtpOjM7czo0OiJrb2RlIjtzOjM6IkcwMyI7czoxMToibmFtYV9nZWphbGEiO3M6MzQ6IkJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS81ZDU2NmZkOC00MjNkLTRmMzItODE4ZC1mYmVkY2Q2MzVkY2YuanBnIjtzOjI6Im1iIjtkOjAuMTtzOjI6Im1kIjtkOjAuODt9aTozO2E6Njp7czoyOiJpZCI7aToxNDtzOjQ6ImtvZGUiO3M6MzoiRzE0IjtzOjExOiJuYW1hX2dlamFsYSI7czo0MToiQmVyY2FrIGhpdGFtIGF0YXUgY29rbGF0IHBhZGEga3VsaXQgZ2FiYWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS8xZWQwZWM0Ni1mODZhLTRiOGItOGM3MC1iOGUyNTIwMmZlODMucG5nIjtzOjI6Im1iIjtkOjAuMjU7czoyOiJtZCI7ZDowLjU0OTt9fX1zOjY6ImRldGFpbCI7YToxMDp7czo4OiJHRUpBTEFfMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjUyOiJHMDEgLSBCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjQ7czo4OiJtYl9ib251cyI7ZDowLjE1O3M6ODoibWRfYm9udXMiO2Q6MC41NTtzOjY6ImltcGFjdCI7ZDotMC40O3M6MjoiY2YiO2Q6LTAuNDtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMiI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjY2OiJHMDIgLSBMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6LTAuNDtzOjg6Im1iX2JvbnVzIjtkOjAuMjtzOjg6Im1kX2JvbnVzIjtkOjAuNjtzOjY6ImltcGFjdCI7ZDotMC40O3M6MjoiY2YiO2Q6LTAuNDtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMyI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQwOiJHMDMgLSBCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjc7czo4OiJtYl9ib251cyI7ZDowLjE7czo4OiJtZF9ib251cyI7ZDowLjg7czo2OiJpbXBhY3QiO2Q6LTAuNztzOjI6ImNmIjtkOi0wLjc7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6OToiR0VKQUxBXzE0IjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NDc6IkcxNCAtIEJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjI5OTtzOjg6Im1iX2JvbnVzIjtkOjAuMjU7czo4OiJtZF9ib251cyI7ZDowLjU0OTtzOjY6ImltcGFjdCI7ZDotMC4yOTk7czoyOiJjZiI7ZDotMC4yOTk7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6NDoiQkFTRSI7YToxMTp7czo4OiJrcml0ZXJpYSI7czozMToiQWt1bXVsYXNpIGtleWFraW5hbiBkYXNhciBwYWthciI7czo1OiJqZW5pcyI7czo0OiJiYXNlIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2k6MTtzOjg6Im1iX2JvbnVzIjtpOjA7czo4OiJtZF9ib251cyI7aTowO3M6NjoiaW1wYWN0IjtkOi0wLjQ0Mjc2NDtzOjc6Im1iX2F3YWwiO2Q6MC41NDE7czo3OiJtZF9hd2FsIjtkOjAuOTgzNzY0O3M6MjoiY2YiO2Q6LTAuNDQyNzY0O3M6NzoiY2F0YXRhbiI7czo4NToiTmlsYWkgYXdhbCBkaWJlbnR1ayBkYXJpIGdhYnVuZ2FuIHNlbXVhIHJ1bGUgZ2VqYWxhIHlhbmcgY29jb2sgZGVuZ2FuIGFsdGVybmF0aWYgaW5pLiI7fXM6NjoiUFJFU0VUIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTU6IlByZXNldCBzZWltYmFuZyI7czo1OiJqZW5pcyI7czo2OiJwcmVzZXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjY7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6LTAuMDE7czo2OiJpbXBhY3QiO2Q6MC4wNDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo1NzoiU2VtdWEgYWx0ZXJuYXRpZiBtZW5kYXBhdCBwZW55ZXN1YWlhbiBtb2RlcmF0IGRhbiBzdGFiaWwuIjt9czoyOiJDMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE0OiJKZW5pcyBQZW55YWtpdCI7czo1OiJqZW5pcyI7czo3OiJiZW5lZml0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC41O3M6ODoibWJfYm9udXMiO2Q6MC4wMztzOjg6Im1kX2JvbnVzIjtkOjAuMDE4O3M6NjoiaW1wYWN0IjtkOjAuMDEyO3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjY1OiJQcmVmZXJlbnNpIGluaSBtZW1iZXJpIHBlbnllc3VhaWFuIHRhbWJhaGFuIHBhZGEgbmlsYWkga2V5YWtpbmFuLiI7fXM6MjoiQzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1OiJIYXJnYSI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MTtzOjg6Im1iX2JvbnVzIjtkOjAuMDY7czo4OiJtZF9ib251cyI7ZDowO3M6NjoiaW1wYWN0IjtkOjAuMDY7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjA6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIGxlYmloIGhlbWF0IGJpYXlhLiI7fXM6MjoiQzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxMToiRWZla3Rpdml0YXMiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuMTtzOjg6Im1iX2JvbnVzIjtkOjAuMDA2O3M6ODoibWRfYm9udXMiO2Q6MC4wMzI0O3M6NjoiaW1wYWN0IjtkOi0wLjAyNjQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6ODM6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIHB1bnlhIGtleWFraW5hbiBkYXNhciBwYWthciBsZWJpaCB0aW5nZ2kuIjt9czoyOiJDNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE3OiJEYW1wYWsgTGluZ2t1bmdhbiI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42NTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM5O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI2O3M6NjoiaW1wYWN0IjtkOjAuMDI2NDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NzoiUHJlZmVyZW5zaSBpbmkgbWVuZG9yb25nIGFsdGVybmF0aWYgeWFuZyBsZWJpaCBhbWFuIGRhbiB0ZXJrZW5kYWxpLiI7fX1zOjc6ImNmX21ldGEiO2E6Njp7czo3OiJtYl9hd2FsIjtkOjAuNTQxO3M6NzoibWRfYXdhbCI7ZDowLjk4Mzc2NDtzOjc6ImNmX2F3YWwiO2Q6LTAuNDQyNzY0O3M6ODoibWJfYWtoaXIiO2Q6MC43MDY7czo4OiJtZF9ha2hpciI7ZDoxO3M6ODoiY2ZfYWtoaXIiO2Q6LTAuMjk0O31zOjk6InBlcmluZ2thdCI7aTo1O3M6ODoiY2ZfYWtoaXIiO2Q6LTAuMDc3OTk5OTk5OTk5OTk5OTY7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7czoxNToiYWRqdXN0bWVudF9pbmZvIjthOjI6e3M6MTI6InByZXNldF9ib29zdCI7ZDowLjIxNjtzOjE4OiJzeW1wdG9tX2FkanVzdG1lbnQiO2Q6MC4wNzY7fX1pOjU7YToxMTp7czoyOiJpZCI7aTo0O3M6NDoia29kZSI7czo0OiJQSzA0IjtzOjQ6Im5hbWEiO3M6MzoiS0NsIjtzOjI6InZpIjtkOi0wLjIzODY0OTk5OTk5OTk5OTk3O3M6NDoibWV0YSI7YToxMzp7czoxMDoiZ2FtYmFyX3VybCI7czo3NjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvcHVwdWsvZGJmYWU5MTUtOGVhMy00YzJhLTk1YWEtYzYxMDdjNjQyYjBkLmpwZyI7czo5OiJrYW5kdW5nYW4iO3M6NToiSyA2MCUiO3M6MTY6ImthbmR1bmdhbl9kZXRhaWwiO3M6NzI6IkthbGl1bSAoS+KCgk8pOiDCsTYwJQ0KS2xvcmlkYSAoQ2wpOiDCsTQ1JQ0KS2FkYXIgYWlyOiByZW5kYWggKMKxMeKAkzIlKSI7czoxMToiYmFoYW5fYWt0aWYiO047czoxMjoiZnVuZ3NpX3V0YW1hIjtzOjE0NDoiTWVuaW5na2F0a2FuIGtldGFoYW5hbiB0YW5hbWFuIHRlcmhhZGFwIHBlbnlha2l0LCBtZW1wZXJrdWF0IGJhdGFuZyBhZ2FyIHRpZGFrIG11ZGFoIHJlYmFoLCBzZXJ0YSBtZW5pbmdrYXRrYW4ga3VhbGl0YXMgZGFuIHBlbmdpc2lhbiBidWxpciBwYWRpIjtzOjY6ImZ1bmdzaSI7TjtzOjc6InRha2FyYW4iO3M6MTY6IsKxNzXigJMxMDAga2cvaGEiO3M6NToiZG9zaXMiO047czoxNToiZWZla19wZW5nZ3VuYWFuIjtzOjgxOiJUYW5hbWFuIGxlYmloIGt1YXQsIHRhaGFuIGNla2FtYW4sIGRhbiBoYXNpbCBwYW5lbiBsZWJpaCBiZXJuYXMgc2VydGEgYmVya3VhbGl0YXMiO3M6MTM6ImNhcmFfYXBsaWthc2kiO3M6MTAxOiJEaXNlYmFyIG1lcmF0YSBkaSBsYWhhbiAodGFidXIpLCBiaXNhIGRpYmVyaWthbiBiZXJzYW1hYW4gZGVuZ2FuIHB1cHVrIGxhaW4gcGFkYSBrb25kaXNpIHRhbmFoIGxlbWJhYiI7czoyMDoiamFkd2FsX3VtdXJfYXBsaWthc2kiO3M6NzI6IjfigJMxMCBIU1QgKGF3YWwgcGVydHVtYnVoYW4pDQozMOKAkzM1IEhTVCAobWVuamVsYW5nIHBlbWJlbnR1a2FuIG1hbGFpKSI7czoxODoiZnJla3VlbnNpX2FwbGlrYXNpIjtzOjI4OiIx4oCTMiBrYWxpIHNlbGFtYSBtYXNhIHRhbmFtIjtzOjEyOiJnZWphbGFfY29jb2siO2E6NDp7aTowO2E6Njp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJHMDEiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ2OiJCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvZmU2ZjhlNzktNTk2Ni00YzRiLWI2MzMtNTdmODEzOTRmYTQ2LmpwZyI7czoyOiJtYiI7ZDowLjE7czoyOiJtZCI7ZDowLjg7fWk6MTthOjY6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6MzoiRzAyIjtzOjExOiJuYW1hX2dlamFsYSI7czo2MDoiTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvYTg0YWE4ODQtZDliMC00OTZkLWE0ZGMtMjU5YjI1MmExOGI1LmpwZyI7czoyOiJtYiI7ZDowLjE7czoyOiJtZCI7ZDowLjg7fWk6MjthOjY6e3M6MjoiaWQiO2k6MztzOjQ6ImtvZGUiO3M6MzoiRzAzIjtzOjExOiJuYW1hX2dlamFsYSI7czozNDoiQnVsaXIgcGFkaSBoYW1wYSBhdGF1IHRpZGFrIGJlcmlzaSI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzVkNTY2ZmQ4LTQyM2QtNGYzMi04MThkLWZiZWRjZDYzNWRjZi5qcGciO3M6MjoibWIiO2Q6MC4xO3M6MjoibWQiO2Q6MC45O31pOjM7YTo2OntzOjI6ImlkIjtpOjE0O3M6NDoia29kZSI7czozOiJHMTQiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQxOiJCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzFlZDBlYzQ2LWY4NmEtNGI4Yi04YzcwLWI4ZTI1MjAyZmU4My5wbmciO3M6MjoibWIiO2Q6MC4xNTtzOjI6Im1kIjtkOjAuNzt9fX1zOjY6ImRldGFpbCI7YToxMDp7czo4OiJHRUpBTEFfMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjUyOiJHMDEgLSBCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjc7czo4OiJtYl9ib251cyI7ZDowLjE7czo4OiJtZF9ib251cyI7ZDowLjg7czo2OiJpbXBhY3QiO2Q6LTAuNztzOjI6ImNmIjtkOi0wLjc7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6ODoiR0VKQUxBXzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo2NjoiRzAyIC0gTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjc7czo4OiJtYl9ib251cyI7ZDowLjE7czo4OiJtZF9ib251cyI7ZDowLjg7czo2OiJpbXBhY3QiO2Q6LTAuNztzOjI6ImNmIjtkOi0wLjc7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6ODoiR0VKQUxBXzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo0MDoiRzAzIC0gQnVsaXIgcGFkaSBoYW1wYSBhdGF1IHRpZGFrIGJlcmlzaSI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC44O3M6ODoibWJfYm9udXMiO2Q6MC4xO3M6ODoibWRfYm9udXMiO2Q6MC45O3M6NjoiaW1wYWN0IjtkOi0wLjg7czoyOiJjZiI7ZDotMC44O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjk6IkdFSkFMQV8xNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQ3OiJHMTQgLSBCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC41NTtzOjg6Im1iX2JvbnVzIjtkOjAuMTU7czo4OiJtZF9ib251cyI7ZDowLjc7czo2OiJpbXBhY3QiO2Q6LTAuNTU7czoyOiJjZiI7ZDotMC41NTtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo0OiJCQVNFIjthOjExOntzOjg6ImtyaXRlcmlhIjtzOjMxOiJBa3VtdWxhc2kga2V5YWtpbmFuIGRhc2FyIHBha2FyIjtzOjU6ImplbmlzIjtzOjQ6ImJhc2UiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7aToxO3M6ODoibWJfYm9udXMiO2k6MDtzOjg6Im1kX2JvbnVzIjtpOjA7czo2OiJpbXBhY3QiO2Q6LTAuNjE4NDU7czo3OiJtYl9hd2FsIjtkOjAuMzgwMzU7czo3OiJtZF9hd2FsIjtkOjAuOTk4ODtzOjI6ImNmIjtkOi0wLjYxODQ1O3M6NzoiY2F0YXRhbiI7czo4NToiTmlsYWkgYXdhbCBkaWJlbnR1ayBkYXJpIGdhYnVuZ2FuIHNlbXVhIHJ1bGUgZ2VqYWxhIHlhbmcgY29jb2sgZGVuZ2FuIGFsdGVybmF0aWYgaW5pLiI7fXM6NjoiUFJFU0VUIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTU6IlByZXNldCBzZWltYmFuZyI7czo1OiJqZW5pcyI7czo2OiJwcmVzZXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjY7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6LTAuMDE7czo2OiJpbXBhY3QiO2Q6MC4wNDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo1NzoiU2VtdWEgYWx0ZXJuYXRpZiBtZW5kYXBhdCBwZW55ZXN1YWlhbiBtb2RlcmF0IGRhbiBzdGFiaWwuIjt9czoyOiJDMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE0OiJKZW5pcyBQZW55YWtpdCI7czo1OiJqZW5pcyI7czo3OiJiZW5lZml0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC41O3M6ODoibWJfYm9udXMiO2Q6MC4wMztzOjg6Im1kX2JvbnVzIjtkOjAuMDE4O3M6NjoiaW1wYWN0IjtkOjAuMDEyO3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjY1OiJQcmVmZXJlbnNpIGluaSBtZW1iZXJpIHBlbnllc3VhaWFuIHRhbWJhaGFuIHBhZGEgbmlsYWkga2V5YWtpbmFuLiI7fXM6MjoiQzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1OiJIYXJnYSI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MTtzOjg6Im1iX2JvbnVzIjtkOjAuMDY7czo4OiJtZF9ib251cyI7ZDowO3M6NjoiaW1wYWN0IjtkOjAuMDY7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjA6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIGxlYmloIGhlbWF0IGJpYXlhLiI7fXM6MjoiQzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxMToiRWZla3Rpdml0YXMiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuMTtzOjg6Im1iX2JvbnVzIjtkOjAuMDA2O3M6ODoibWRfYm9udXMiO2Q6MC4wMzI0O3M6NjoiaW1wYWN0IjtkOi0wLjAyNjQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6ODM6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIHB1bnlhIGtleWFraW5hbiBkYXNhciBwYWthciBsZWJpaCB0aW5nZ2kuIjt9czoyOiJDNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE3OiJEYW1wYWsgTGluZ2t1bmdhbiI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42NTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM5O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI2O3M6NjoiaW1wYWN0IjtkOjAuMDI2NDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NzoiUHJlZmVyZW5zaSBpbmkgbWVuZG9yb25nIGFsdGVybmF0aWYgeWFuZyBsZWJpaCBhbWFuIGRhbiB0ZXJrZW5kYWxpLiI7fX1zOjc6ImNmX21ldGEiO2E6Njp7czo3OiJtYl9hd2FsIjtkOjAuMzgwMzU7czo3OiJtZF9hd2FsIjtkOjAuOTk4ODtzOjc6ImNmX2F3YWwiO2Q6LTAuNjE4NDU7czo4OiJtYl9ha2hpciI7ZDowLjU0NTM1O3M6ODoibWRfYWtoaXIiO2Q6MTtzOjg6ImNmX2FraGlyIjtkOi0wLjQ1NDY1O31zOjk6InBlcmluZ2thdCI7aTo2O3M6ODoiY2ZfYWtoaXIiO2Q6LTAuMjM4NjQ5OTk5OTk5OTk5OTc7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7czoxNToiYWRqdXN0bWVudF9pbmZvIjthOjI6e3M6MTI6InByZXNldF9ib29zdCI7ZDowLjIxNjtzOjE4OiJzeW1wdG9tX2FkanVzdG1lbnQiO2Q6MC4wNzY7fX19czo5OiJwZXN0aXNpZGEiO2E6Njp7aTowO2E6MTE6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6NDoiUFMwMSI7czo0OiJuYW1hIjtzOjE3OiJBbWlzdGFydG9wIDMyNSBTQyI7czoyOiJ2aSI7ZDowLjgwNzkwMztzOjQ6Im1ldGEiO2E6MTM6e3M6MTA6ImdhbWJhcl91cmwiO3M6ODA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL3Blc3Rpc2lkYS9jYWZmYWZkZC1lNjg5LTQ0MTctYTJmOC0yN2JiZGZjNDExOGMuanBnIjtzOjk6ImthbmR1bmdhbiI7TjtzOjE2OiJrYW5kdW5nYW5fZGV0YWlsIjtzOjc4OiJBem94eXN0cm9iaW46IDIwMCBnL0wNCkRpZmVub2NvbmF6b2xlOiAxMjUgZy9MDQpGb3JtdWxhc2k6IFN1c3BlbnNpIHBla2F0IChTQykiO3M6MTE6ImJhaGFuX2FrdGlmIjtzOjI5OiJBem9rc2lzdHJvYmluICsgRGlmZW5va29uYXpvbCI7czoxMjoiZnVuZ3NpX3V0YW1hIjtOO3M6NjoiZnVuZ3NpIjtzOjEwODoiRnVuZ2lzaWRhIHNpc3RlbWlrIHVudHVrIG1lbmdlbmRhbGlrYW4gcGVueWFraXQgamFtdXIgcGFkYSBwYWRpIHNlcGVydGkgYmxhcywgYmVyY2FrIGRhdW4sIGRhbiBoYXdhciBwZWxlcGFoIjtzOjc6InRha2FyYW4iO3M6MTc6IsKxMjUw4oCTNTAwIG1sL2hhIjtzOjU6ImRvc2lzIjtzOjEyOiIwLDXigJMxIG1sL0wiO3M6MTU6ImVmZWtfcGVuZ2d1bmFhbiI7czo5MzoiTWVuZ2hhbWJhdCBwZXJrZW1iYW5nYW4gamFtdXIsIG1lbmphZ2EgZGF1biB0ZXRhcCBzZWhhdCwgZGFuIG1lbmluZ2thdGthbiBwb3RlbnNpIGhhc2lsIHBhbmVuIjtzOjEzOiJjYXJhX2FwbGlrYXNpIjtzOjgwOiJEaXNlbXByb3RrYW4gbWVyYXRhIGtlIHNlbHVydWggYmFnaWFuIHRhbmFtYW4gdGVydXRhbWEgZGF1biwgbWVuZ2d1bmFrYW4gc3ByYXllciI7czoyMDoiamFkd2FsX3VtdXJfYXBsaWthc2kiO3M6Nzk6IjIw4oCTMzAgSFNUIChhd2FsIGdlamFsYSBhdGF1IHBlbmNlZ2FoYW4pDQo0MOKAkzUwIEhTVCAoZmFzZSBwZW1iZW50dWthbiBtYWxhaSkiO3M6MTg6ImZyZWt1ZW5zaV9hcGxpa2FzaSI7czozNDoiMeKAkzIga2FsaSBzZXN1YWkga29uZGlzaSBzZXJhbmdhbiI7czoxMjoiZ2VqYWxhX2NvY29rIjthOjQ6e2k6MDthOjY6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2ZlNmY4ZTc5LTU5NjYtNGM0Yi1iNjMzLTU3ZjgxMzk0ZmE0Ni5qcGciO3M6MjoibWIiO2Q6MC45O3M6MjoibWQiO2Q6MC4wNTt9aToxO2E6Njp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9hODRhYTg4NC1kOWIwLTQ5NmQtYTRkYy0yNTliMjUyYTE4YjUuanBnIjtzOjI6Im1iIjtkOjAuOTtzOjI6Im1kIjtkOjAuMDU7fWk6MjthOjY6e3M6MjoiaWQiO2k6MztzOjQ6ImtvZGUiO3M6MzoiRzAzIjtzOjExOiJuYW1hX2dlamFsYSI7czozNDoiQnVsaXIgcGFkaSBoYW1wYSBhdGF1IHRpZGFrIGJlcmlzaSI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzVkNTY2ZmQ4LTQyM2QtNGYzMi04MThkLWZiZWRjZDYzNWRjZi5qcGciO3M6MjoibWIiO2Q6MC43NTtzOjI6Im1kIjtkOjAuMTU7fWk6MzthOjY6e3M6MjoiaWQiO2k6MTQ7czo0OiJrb2RlIjtzOjM6IkcxNCI7czoxMToibmFtYV9nZWphbGEiO3M6NDE6IkJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvMWVkMGVjNDYtZjg2YS00YjhiLThjNzAtYjhlMjUyMDJmZTgzLnBuZyI7czoyOiJtYiI7ZDowLjc7czoyOiJtZCI7ZDowLjE1O319fXM6NjoiZGV0YWlsIjthOjEwOntzOjg6IkdFSkFMQV8xIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NTI6IkcwMSAtIEJlcmNhayBiZWxhaCBrZXR1cGF0ICh1anVuZyBydW5jaW5nKSBwYWRhIGRhdW4iO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6MC44NTtzOjg6Im1iX2JvbnVzIjtkOjAuOTtzOjg6Im1kX2JvbnVzIjtkOjAuMDU7czo2OiJpbXBhY3QiO2Q6MC44NTtzOjI6ImNmIjtkOjAuODU7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6ODoiR0VKQUxBXzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo2NjoiRzAyIC0gTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOjAuODU7czo4OiJtYl9ib251cyI7ZDowLjk7czo4OiJtZF9ib251cyI7ZDowLjA1O3M6NjoiaW1wYWN0IjtkOjAuODU7czoyOiJjZiI7ZDowLjg1O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjg6IkdFSkFMQV8zIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NDA6IkcwMyAtIEJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6MC42O3M6ODoibWJfYm9udXMiO2Q6MC43NTtzOjg6Im1kX2JvbnVzIjtkOjAuMTU7czo2OiJpbXBhY3QiO2Q6MC42O3M6MjoiY2YiO2Q6MC42O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjk6IkdFSkFMQV8xNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQ3OiJHMTQgLSBCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDowLjU1O3M6ODoibWJfYm9udXMiO2Q6MC43O3M6ODoibWRfYm9udXMiO2Q6MC4xNTtzOjY6ImltcGFjdCI7ZDowLjU1O3M6MjoiY2YiO2Q6MC41NTtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo0OiJCQVNFIjthOjExOntzOjg6ImtyaXRlcmlhIjtzOjMxOiJBa3VtdWxhc2kga2V5YWtpbmFuIGRhc2FyIHBha2FyIjtzOjU6ImplbmlzIjtzOjQ6ImJhc2UiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7aToxO3M6ODoibWJfYm9udXMiO2k6MDtzOjg6Im1kX2JvbnVzIjtpOjA7czo2OiJpbXBhY3QiO2Q6MC42NTEzMDY7czo3OiJtYl9hd2FsIjtkOjAuOTk5MjU7czo3OiJtZF9hd2FsIjtkOjAuMzQ3OTQ0O3M6MjoiY2YiO2Q6MC42NTEzMDY7czo3OiJjYXRhdGFuIjtzOjg1OiJOaWxhaSBhd2FsIGRpYmVudHVrIGRhcmkgZ2FidW5nYW4gc2VtdWEgcnVsZSBnZWphbGEgeWFuZyBjb2NvayBkZW5nYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo2OiJQUkVTRVQiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxNToiUHJlc2V0IHNlaW1iYW5nIjtzOjU6ImplbmlzIjtzOjY6InByZXNldCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuNjtzOjg6Im1iX2JvbnVzIjtkOjAuMDM7czo4OiJtZF9ib251cyI7ZDotMC4wMTtzOjY6ImltcGFjdCI7ZDowLjA0O3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjU3OiJTZW11YSBhbHRlcm5hdGlmIG1lbmRhcGF0IHBlbnllc3VhaWFuIG1vZGVyYXQgZGFuIHN0YWJpbC4iO31zOjI6IkMxIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTQ6IkplbmlzIFBlbnlha2l0IjtzOjU6ImplbmlzIjtzOjc6ImJlbmVmaXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjU7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6MC4wMTg7czo2OiJpbXBhY3QiO2Q6MC4wMTI7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjU6IlByZWZlcmVuc2kgaW5pIG1lbWJlcmkgcGVueWVzdWFpYW4gdGFtYmFoYW4gcGFkYSBuaWxhaSBrZXlha2luYW4uIjt9czoyOiJDMiI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjU6IkhhcmdhIjtzOjU6ImplbmlzIjtzOjQ6ImNvc3QiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjI1O3M6ODoibWJfYm9udXMiO2Q6MC4wMTU7czo4OiJtZF9ib251cyI7ZDowLjAyNztzOjY6ImltcGFjdCI7ZDotMC4wMTI7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjA6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIGxlYmloIGhlbWF0IGJpYXlhLiI7fXM6MjoiQzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxMToiRWZla3Rpdml0YXMiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuNjUxMztzOjg6Im1iX2JvbnVzIjtkOjAuMDM5MDc4O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI1NTM7czo2OiJpbXBhY3QiO2Q6MC4wMjY1MjU7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6ODM6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIHB1bnlhIGtleWFraW5hbiBkYXNhciBwYWthciBsZWJpaCB0aW5nZ2kuIjt9czoyOiJDNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE3OiJEYW1wYWsgTGluZ2t1bmdhbiI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42NTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM5O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI2O3M6NjoiaW1wYWN0IjtkOjAuMDI2NDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NzoiUHJlZmVyZW5zaSBpbmkgbWVuZG9yb25nIGFsdGVybmF0aWYgeWFuZyBsZWJpaCBhbWFuIGRhbiB0ZXJrZW5kYWxpLiI7fX1zOjc6ImNmX21ldGEiO2E6Njp7czo3OiJtYl9hd2FsIjtkOjAuOTk5MjU7czo3OiJtZF9hd2FsIjtkOjAuMzQ3OTQ0O3M6NzoiY2ZfYXdhbCI7ZDowLjY1MTMwNjtzOjg6Im1iX2FraGlyIjtkOjE7czo4OiJtZF9ha2hpciI7ZDowLjQwODA5NztzOjg6ImNmX2FraGlyIjtkOjAuNTkxOTAzO31zOjk6InBlcmluZ2thdCI7aToxO3M6ODoiY2ZfYWtoaXIiO2Q6MC44MDc5MDM7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7czoxNToiYWRqdXN0bWVudF9pbmZvIjthOjI6e3M6MTI6InByZXNldF9ib29zdCI7ZDowLjIxNjtzOjE4OiJzeW1wdG9tX2FkanVzdG1lbnQiO2Q6MC4wNzY7fX1pOjE7YToxMTp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czo0OiJQUzAyIjtzOjQ6Im5hbWEiO3M6MTI6IkZpbGlhIDUyNSBTRSI7czoyOiJ2aSI7ZDowLjY2OTM1MTtzOjQ6Im1ldGEiO2E6MTM6e3M6MTA6ImdhbWJhcl91cmwiO3M6ODA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL3Blc3Rpc2lkYS9mYzM3NTU5MS03Y2FiLTQzMDAtYWYzOS1mY2M1ZWMxMTAzNzIuanBnIjtzOjk6ImthbmR1bmdhbiI7TjtzOjE2OiJrYW5kdW5nYW5fZGV0YWlsIjtzOjc3OiJQcm9waWNvbmF6b2xlOiAxMjUgZy9MDQpUcmljeWNsYXpvbGU6IDQwMCBnL0wNCkZvcm11bGFzaTogU3VzcG8tZW11bHNpb24gKFNFKSI7czoxMToiYmFoYW5fYWt0aWYiO3M6MjY6IlByb3Bpa29uYXpvbCArIFRyaXNpa2xhem9sIjtzOjEyOiJmdW5nc2lfdXRhbWEiO047czo2OiJmdW5nc2kiO3M6MTAwOiJGdW5naXNpZGEgc2lzdGVtaWsgdW50dWsgbWVuZ2VuZGFsaWthbiBwZW55YWtpdCBqYW11ciBwYWRhIHBhZGkgdGVydXRhbWEgYmxhcyAoZGF1biBkYW4gbGVoZXIgbWFsYWkpIjtzOjc6InRha2FyYW4iO3M6MTc6IsKxMjUw4oCTNDAwIG1sL2hhIjtzOjU6ImRvc2lzIjtzOjEyOiIx4oCTMSw1IG1sL0wiO3M6MTU6ImVmZWtfcGVuZ2d1bmFhbiI7czoxMDY6Ik1lbmVrYW4gcGVya2VtYmFuZ2FuIGphbXVyLCBtZWxpbmR1bmdpIGRhdW4gZGFuIG1hbGFpLCBzZXJ0YSBtZW5ndXJhbmdpIHJpc2lrbyBnYWdhbCBwYW5lbiBha2liYXQgcGVueWFraXQiO3M6MTM6ImNhcmFfYXBsaWthc2kiO3M6ODk6IkRpc2VtcHJvdGthbiBtZXJhdGEga2Ugc2VsdXJ1aCBiYWdpYW4gdGFuYW1hbiB0ZXJ1dGFtYSBkYXVuIGRhbiBtYWxhaSBtZW5nZ3VuYWthbiBzcHJheWVyIjtzOjIwOiJqYWR3YWxfdW11cl9hcGxpa2FzaSI7czo5ODoiMjDigJMzMCBIU1QgKGZhc2UgdmVnZXRhdGlmIGF3YWwgLyBwZW5jZWdhaGFuKQ0KNDDigJM1NSBIU1QgKG1lbmplbGFuZyBkYW4gc2FhdCBwZW1iZW50dWthbiBtYWxhaSkiO3M6MTg6ImZyZWt1ZW5zaV9hcGxpa2FzaSI7czozNDoiMeKAkzIga2FsaSBzZXN1YWkgdGluZ2thdCBzZXJhbmdhbiI7czoxMjoiZ2VqYWxhX2NvY29rIjthOjQ6e2k6MDthOjY6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2ZlNmY4ZTc5LTU5NjYtNGM0Yi1iNjMzLTU3ZjgxMzk0ZmE0Ni5qcGciO3M6MjoibWIiO2Q6MC44NTtzOjI6Im1kIjtkOjAuMTt9aToxO2E6Njp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9hODRhYTg4NC1kOWIwLTQ5NmQtYTRkYy0yNTliMjUyYTE4YjUuanBnIjtzOjI6Im1iIjtkOjAuODU7czoyOiJtZCI7ZDowLjE7fWk6MjthOjY6e3M6MjoiaWQiO2k6MztzOjQ6ImtvZGUiO3M6MzoiRzAzIjtzOjExOiJuYW1hX2dlamFsYSI7czozNDoiQnVsaXIgcGFkaSBoYW1wYSBhdGF1IHRpZGFrIGJlcmlzaSI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzVkNTY2ZmQ4LTQyM2QtNGYzMi04MThkLWZiZWRjZDYzNWRjZi5qcGciO3M6MjoibWIiO2Q6MC42NTtzOjI6Im1kIjtkOjAuMjt9aTozO2E6Njp7czoyOiJpZCI7aToxNDtzOjQ6ImtvZGUiO3M6MzoiRzE0IjtzOjExOiJuYW1hX2dlamFsYSI7czo0MToiQmVyY2FrIGhpdGFtIGF0YXUgY29rbGF0IHBhZGEga3VsaXQgZ2FiYWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS8xZWQwZWM0Ni1mODZhLTRiOGItOGM3MC1iOGUyNTIwMmZlODMucG5nIjtzOjI6Im1iIjtkOjAuNjtzOjI6Im1kIjtkOjAuMjt9fX1zOjY6ImRldGFpbCI7YToxMDp7czo4OiJHRUpBTEFfMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjUyOiJHMDEgLSBCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOjAuNzU7czo4OiJtYl9ib251cyI7ZDowLjg1O3M6ODoibWRfYm9udXMiO2Q6MC4xO3M6NjoiaW1wYWN0IjtkOjAuNzU7czoyOiJjZiI7ZDowLjc1O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjg6IkdFSkFMQV8yIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NjY6IkcwMiAtIExlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDowLjc1O3M6ODoibWJfYm9udXMiO2Q6MC44NTtzOjg6Im1kX2JvbnVzIjtkOjAuMTtzOjY6ImltcGFjdCI7ZDowLjc1O3M6MjoiY2YiO2Q6MC43NTtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMyI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQwOiJHMDMgLSBCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOjAuNDU7czo4OiJtYl9ib251cyI7ZDowLjY1O3M6ODoibWRfYm9udXMiO2Q6MC4yO3M6NjoiaW1wYWN0IjtkOjAuNDU7czoyOiJjZiI7ZDowLjQ1O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjk6IkdFSkFMQV8xNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQ3OiJHMTQgLSBCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDowLjQ7czo4OiJtYl9ib251cyI7ZDowLjY7czo4OiJtZF9ib251cyI7ZDowLjI7czo2OiJpbXBhY3QiO2Q6MC40O3M6MjoiY2YiO2Q6MC40O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjQ6IkJBU0UiO2E6MTE6e3M6ODoia3JpdGVyaWEiO3M6MzE6IkFrdW11bGFzaSBrZXlha2luYW4gZGFzYXIgcGFrYXIiO3M6NToiamVuaXMiO3M6NDoiYmFzZSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtpOjE7czo4OiJtYl9ib251cyI7aTowO3M6ODoibWRfYm9udXMiO2k6MDtzOjY6ImltcGFjdCI7ZDowLjUxNTI1O3M6NzoibWJfYXdhbCI7ZDowLjk5Njg1O3M6NzoibWRfYXdhbCI7ZDowLjQ4MTY7czoyOiJjZiI7ZDowLjUxNTI1O3M6NzoiY2F0YXRhbiI7czo4NToiTmlsYWkgYXdhbCBkaWJlbnR1ayBkYXJpIGdhYnVuZ2FuIHNlbXVhIHJ1bGUgZ2VqYWxhIHlhbmcgY29jb2sgZGVuZ2FuIGFsdGVybmF0aWYgaW5pLiI7fXM6NjoiUFJFU0VUIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTU6IlByZXNldCBzZWltYmFuZyI7czo1OiJqZW5pcyI7czo2OiJwcmVzZXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjY7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6LTAuMDE7czo2OiJpbXBhY3QiO2Q6MC4wNDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo1NzoiU2VtdWEgYWx0ZXJuYXRpZiBtZW5kYXBhdCBwZW55ZXN1YWlhbiBtb2RlcmF0IGRhbiBzdGFiaWwuIjt9czoyOiJDMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE0OiJKZW5pcyBQZW55YWtpdCI7czo1OiJqZW5pcyI7czo3OiJiZW5lZml0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC41O3M6ODoibWJfYm9udXMiO2Q6MC4wMztzOjg6Im1kX2JvbnVzIjtkOjAuMDE4O3M6NjoiaW1wYWN0IjtkOjAuMDEyO3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjY1OiJQcmVmZXJlbnNpIGluaSBtZW1iZXJpIHBlbnllc3VhaWFuIHRhbWJhaGFuIHBhZGEgbmlsYWkga2V5YWtpbmFuLiI7fXM6MjoiQzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1OiJIYXJnYSI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC4yNTtzOjg6Im1iX2JvbnVzIjtkOjAuMDE1O3M6ODoibWRfYm9udXMiO2Q6MC4wMjc7czo2OiJpbXBhY3QiO2Q6LTAuMDEyO3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjYwOiJQcmVmZXJlbnNpIGluaSBtZW1wZXJrdWF0IGFsdGVybmF0aWYgeWFuZyBsZWJpaCBoZW1hdCBiaWF5YS4iO31zOjI6IkMzIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTE6IkVmZWt0aXZpdGFzIjtzOjU6ImplbmlzIjtzOjc6ImJlbmVmaXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjUxNTM7czo4OiJtYl9ib251cyI7ZDowLjAzMDkxODtzOjg6Im1kX2JvbnVzIjtkOjAuMDE3NDQ5O3M6NjoiaW1wYWN0IjtkOjAuMDEzNDY5O3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjgzOiJQcmVmZXJlbnNpIGluaSBtZW1wZXJrdWF0IGFsdGVybmF0aWYgeWFuZyBwdW55YSBrZXlha2luYW4gZGFzYXIgcGFrYXIgbGViaWggdGluZ2dpLiI7fXM6MjoiQzQiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxNzoiRGFtcGFrIExpbmdrdW5nYW4iO3M6NToiamVuaXMiO3M6NDoiY29zdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuNjU7czo4OiJtYl9ib251cyI7ZDowLjAzOTtzOjg6Im1kX2JvbnVzIjtkOjAuMDEyNjtzOjY6ImltcGFjdCI7ZDowLjAyNjQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6Njc6IlByZWZlcmVuc2kgaW5pIG1lbmRvcm9uZyBhbHRlcm5hdGlmIHlhbmcgbGViaWggYW1hbiBkYW4gdGVya2VuZGFsaS4iO319czo3OiJjZl9tZXRhIjthOjY6e3M6NzoibWJfYXdhbCI7ZDowLjk5Njg1O3M6NzoibWRfYXdhbCI7ZDowLjQ4MTY7czo3OiJjZl9hd2FsIjtkOjAuNTE1MjU7czo4OiJtYl9ha2hpciI7ZDoxO3M6ODoibWRfYWtoaXIiO2Q6MC41NDY2NDk7czo4OiJjZl9ha2hpciI7ZDowLjQ1MzM1MTt9czo5OiJwZXJpbmdrYXQiO2k6MjtzOjg6ImNmX2FraGlyIjtkOjAuNjY5MzUxO3M6MTg6InByZWZlcmVuY2VfYXBwbGllZCI7YjoxO3M6MTU6ImFkanVzdG1lbnRfaW5mbyI7YToyOntzOjEyOiJwcmVzZXRfYm9vc3QiO2Q6MC4yMTY7czoxODoic3ltcHRvbV9hZGp1c3RtZW50IjtkOjAuMDc2O319aToyO2E6MTE6e3M6MjoiaWQiO2k6NjtzOjQ6ImtvZGUiO3M6NDoiUFMwNiI7czo0OiJuYW1hIjtzOjEzOiJWYWxpZGFjaW4gMyBMIjtzOjI6InZpIjtkOi0wLjA1NDE5OTk5OTk5OTk5OTk3O3M6NDoibWV0YSI7YToxMzp7czoxMDoiZ2FtYmFyX3VybCI7czo4MDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvcGVzdGlzaWRhLzU1ZDA2OTRjLWUxNDMtNDM1Mi1hNWVmLTMzNjA3NzkxMjY5ZS5qcGciO3M6OToia2FuZHVuZ2FuIjtOO3M6MTY6ImthbmR1bmdhbl9kZXRhaWwiO3M6NTI6IlZhbGlkYW15Y2luIEE6IDMlICjCsTMwIGcvTCkNCkZvcm11bGFzaTogTGFydXRhbiAoTCkiO3M6MTE6ImJhaGFuX2FrdGlmIjtzOjEzOiJWYWxpZGFtaXNpbiBBIjtzOjEyOiJmdW5nc2lfdXRhbWEiO047czo2OiJmdW5nc2kiO3M6ODk6IkZ1bmdpc2lkYSBhbnRpYmlvdGlrIHVudHVrIG1lbmdlbmRhbGlrYW4gcGVueWFraXQgaGF3YXIgcGVsZXBhaCAoc2hlYXRoIGJsaWdodCkgcGFkYSBwYWRpIjtzOjc6InRha2FyYW4iO3M6MTc6IsKxNDAw4oCTNjAwIG1sL2hhIjtzOjU6ImRvc2lzIjtzOjEwOiIx4oCTMiBtbC9MIjtzOjE1OiJlZmVrX3BlbmdndW5hYW4iO3M6OTI6Ik1lbmdoYW1iYXQgcGVya2VtYmFuZ2FuIGphbXVyLCBtZW5ndXJhbmdpIHBlbnllYmFyYW4gcGVueWFraXQsIGRhbiBtZW5qYWdhIGtlc2VoYXRhbiB0YW5hbWFuIjtzOjEzOiJjYXJhX2FwbGlrYXNpIjtzOjc1OiJEaXNlbXByb3RrYW4gbWVyYXRhIHRlcnV0YW1hIHBhZGEgYmFnaWFuIHBlbGVwYWggZGFuIHBhbmdrYWwgYmF0YW5nIHRhbmFtYW4iO3M6MjA6ImphZHdhbF91bXVyX2FwbGlrYXNpIjtzOjg2OiIyNeKAkzM1IEhTVCAoYXdhbCBnZWphbGEgYXRhdSBwZW5jZWdhaGFuKQ0KVWxhbmdpIDfigJMxMCBoYXJpIGtlbXVkaWFuIGppa2EgZGlwZXJsdWthbiI7czoxODoiZnJla3VlbnNpX2FwbGlrYXNpIjtzOjM0OiIx4oCTMiBrYWxpIHNlc3VhaSBrb25kaXNpIHNlcmFuZ2FuIjtzOjEyOiJnZWphbGFfY29jb2siO2E6NDp7aTowO2E6Njp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJHMDEiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ2OiJCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvZmU2ZjhlNzktNTk2Ni00YzRiLWI2MzMtNTdmODEzOTRmYTQ2LmpwZyI7czoyOiJtYiI7ZDowLjI7czoyOiJtZCI7ZDowLjY1O31pOjE7YTo2OntzOjI6ImlkIjtpOjI7czo0OiJrb2RlIjtzOjM6IkcwMiI7czoxMToibmFtYV9nZWphbGEiO3M6NjA6IkxlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2E4NGFhODg0LWQ5YjAtNDk2ZC1hNGRjLTI1OWIyNTJhMThiNS5qcGciO3M6MjoibWIiO2Q6MC4yO3M6MjoibWQiO2Q6MC42NTt9aToyO2E6Njp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7czoyOiJtYiI7ZDowLjI7czoyOiJtZCI7ZDowLjY1O31pOjM7YTo2OntzOjI6ImlkIjtpOjE0O3M6NDoia29kZSI7czozOiJHMTQiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQxOiJCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzFlZDBlYzQ2LWY4NmEtNGI4Yi04YzcwLWI4ZTI1MjAyZmU4My5wbmciO3M6MjoibWIiO2Q6MC4xNTtzOjI6Im1kIjtkOjAuNzt9fX1zOjY6ImRldGFpbCI7YToxMDp7czo4OiJHRUpBTEFfMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjUyOiJHMDEgLSBCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjQ1O3M6ODoibWJfYm9udXMiO2Q6MC4yO3M6ODoibWRfYm9udXMiO2Q6MC42NTtzOjY6ImltcGFjdCI7ZDotMC40NTtzOjI6ImNmIjtkOi0wLjQ1O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjg6IkdFSkFMQV8yIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NjY6IkcwMiAtIExlaGVyIG1hbGFpIGJ1c3VrLCBiZXJ1YmFoIHdhcm5hIGNva2xhdCBhdGF1IGhpdGFtIGRhbiBwYXRhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC40NTtzOjg6Im1iX2JvbnVzIjtkOjAuMjtzOjg6Im1kX2JvbnVzIjtkOjAuNjU7czo2OiJpbXBhY3QiO2Q6LTAuNDU7czoyOiJjZiI7ZDotMC40NTtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMyI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQwOiJHMDMgLSBCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjQ1O3M6ODoibWJfYm9udXMiO2Q6MC4yO3M6ODoibWRfYm9udXMiO2Q6MC42NTtzOjY6ImltcGFjdCI7ZDotMC40NTtzOjI6ImNmIjtkOi0wLjQ1O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjk6IkdFSkFMQV8xNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQ3OiJHMTQgLSBCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC41NTtzOjg6Im1iX2JvbnVzIjtkOjAuMTU7czo4OiJtZF9ib251cyI7ZDowLjc7czo2OiJpbXBhY3QiO2Q6LTAuNTU7czoyOiJjZiI7ZDotMC41NTtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo0OiJCQVNFIjthOjExOntzOjg6ImtyaXRlcmlhIjtzOjMxOiJBa3VtdWxhc2kga2V5YWtpbmFuIGRhc2FyIHBha2FyIjtzOjU6ImplbmlzIjtzOjQ6ImJhc2UiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7aToxO3M6ODoibWJfYm9udXMiO2k6MDtzOjg6Im1kX2JvbnVzIjtpOjA7czo2OiJpbXBhY3QiO2Q6LTAuNDIyMzM4O3M6NzoibWJfYXdhbCI7ZDowLjU2NDg7czo3OiJtZF9hd2FsIjtkOjAuOTg3MTM4O3M6MjoiY2YiO2Q6LTAuNDIyMzM4O3M6NzoiY2F0YXRhbiI7czo4NToiTmlsYWkgYXdhbCBkaWJlbnR1ayBkYXJpIGdhYnVuZ2FuIHNlbXVhIHJ1bGUgZ2VqYWxhIHlhbmcgY29jb2sgZGVuZ2FuIGFsdGVybmF0aWYgaW5pLiI7fXM6NjoiUFJFU0VUIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTU6IlByZXNldCBzZWltYmFuZyI7czo1OiJqZW5pcyI7czo2OiJwcmVzZXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjY7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6LTAuMDE7czo2OiJpbXBhY3QiO2Q6MC4wNDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo1NzoiU2VtdWEgYWx0ZXJuYXRpZiBtZW5kYXBhdCBwZW55ZXN1YWlhbiBtb2RlcmF0IGRhbiBzdGFiaWwuIjt9czoyOiJDMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE0OiJKZW5pcyBQZW55YWtpdCI7czo1OiJqZW5pcyI7czo3OiJiZW5lZml0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC41O3M6ODoibWJfYm9udXMiO2Q6MC4wMztzOjg6Im1kX2JvbnVzIjtkOjAuMDE4O3M6NjoiaW1wYWN0IjtkOjAuMDEyO3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjY1OiJQcmVmZXJlbnNpIGluaSBtZW1iZXJpIHBlbnllc3VhaWFuIHRhbWJhaGFuIHBhZGEgbmlsYWkga2V5YWtpbmFuLiI7fXM6MjoiQzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1OiJIYXJnYSI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MTtzOjg6Im1iX2JvbnVzIjtkOjAuMDY7czo4OiJtZF9ib251cyI7ZDowO3M6NjoiaW1wYWN0IjtkOjAuMDY7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjA6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIGxlYmloIGhlbWF0IGJpYXlhLiI7fXM6MjoiQzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxMToiRWZla3Rpdml0YXMiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuMTtzOjg6Im1iX2JvbnVzIjtkOjAuMDA2O3M6ODoibWRfYm9udXMiO2Q6MC4wMzI0O3M6NjoiaW1wYWN0IjtkOi0wLjAyNjQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6ODM6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIHB1bnlhIGtleWFraW5hbiBkYXNhciBwYWthciBsZWJpaCB0aW5nZ2kuIjt9czoyOiJDNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE3OiJEYW1wYWsgTGluZ2t1bmdhbiI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42NTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM5O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI2O3M6NjoiaW1wYWN0IjtkOjAuMDI2NDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NzoiUHJlZmVyZW5zaSBpbmkgbWVuZG9yb25nIGFsdGVybmF0aWYgeWFuZyBsZWJpaCBhbWFuIGRhbiB0ZXJrZW5kYWxpLiI7fX1zOjc6ImNmX21ldGEiO2E6Njp7czo3OiJtYl9hd2FsIjtkOjAuNTY0ODtzOjc6Im1kX2F3YWwiO2Q6MC45ODcxMzg7czo3OiJjZl9hd2FsIjtkOi0wLjQyMjMzODtzOjg6Im1iX2FraGlyIjtkOjAuNzI5ODtzOjg6Im1kX2FraGlyIjtkOjE7czo4OiJjZl9ha2hpciI7ZDotMC4yNzAyO31zOjk6InBlcmluZ2thdCI7aTozO3M6ODoiY2ZfYWtoaXIiO2Q6LTAuMDU0MTk5OTk5OTk5OTk5OTc7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7czoxNToiYWRqdXN0bWVudF9pbmZvIjthOjI6e3M6MTI6InByZXNldF9ib29zdCI7ZDowLjIxNjtzOjE4OiJzeW1wdG9tX2FkanVzdG1lbnQiO2Q6MC4wNzY7fX1pOjM7YToxMTp7czoyOiJpZCI7aTo1O3M6NDoia29kZSI7czo0OiJQUzA1IjtzOjQ6Im5hbWEiO3M6MTI6IldpbmRlciA1MCBFQyI7czoyOiJ2aSI7ZDotMC4xOTQyOTM5OTk5OTk5OTk5NztzOjQ6Im1ldGEiO2E6MTM6e3M6MTA6ImdhbWJhcl91cmwiO3M6ODA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL3Blc3Rpc2lkYS85YjdlZjZjYS1hYmVkLTQ3ODEtOWNhOS1jYTVmNjVmZTU1MTAuanBnIjtzOjk6ImthbmR1bmdhbiI7TjtzOjE2OiJrYW5kdW5nYW5fZGV0YWlsIjtzOjYzOiJDeXBlcm1ldGhyaW46IDEwMCBnL0wNCkZvcm11bGFzaTogRW11bHNpZmlhYmxlIENvbmNlbnRyYXRlIChFQykiO3M6MTE6ImJhaGFuX2FrdGlmIjtzOjEyOiJJbWlkYWtsb3ByaWQiO3M6MTI6ImZ1bmdzaV91dGFtYSI7TjtzOjY6ImZ1bmdzaSI7czo4OToiSW5zZWt0aXNpZGEgdW50dWsgbWVuZ2VuZGFsaWthbiBoYW1hIHBhZGEgcGFkaSBzZXBlcnRpIHdlcmVuZywgdWxhdCwgZGFuIHBlbmdnZXJlayBiYXRhbmciO3M6NzoidGFrYXJhbiI7czoxNzoiwrExMDDigJMzMDAgbWwvaGEiO3M6NToiZG9zaXMiO3M6MTI6IjAsNeKAkzEgbWwvTCI7czoxNToiZWZla19wZW5nZ3VuYWFuIjtzOjk1OiJNZW1idW51aCBoYW1hIGRlbmdhbiBjZXBhdCwgbWVuZ3VyYW5naSBrZXJ1c2FrYW4gdGFuYW1hbiwgZGFuIG1lbmphZ2EgcGVydHVtYnVoYW4gdGV0YXAgb3B0aW1hbCI7czoxMzoiY2FyYV9hcGxpa2FzaSI7czo3OToiRGlzZW1wcm90a2FuIG1lcmF0YSBrZSBzZWx1cnVoIGJhZ2lhbiB0YW5hbWFuIHRlcnV0YW1hIGFyZWEgeWFuZyB0ZXJzZXJhbmcgaGFtYSI7czoyMDoiamFkd2FsX3VtdXJfYXBsaWthc2kiO3M6Njk6IlNhYXQgaGFtYSBtdWxhaSB0ZXJsaWhhdA0KVWxhbmdpIDfigJMxMCBoYXJpIGtlbXVkaWFuIGppa2EgZGlwZXJsdWthbiI7czoxODoiZnJla3VlbnNpX2FwbGlrYXNpIjtzOjM0OiIx4oCTMiBrYWxpIHNlc3VhaSB0aW5na2F0IHNlcmFuZ2FuIjtzOjEyOiJnZWphbGFfY29jb2siO2E6NDp7aTowO2E6Njp7czoyOiJpZCI7aToxO3M6NDoia29kZSI7czozOiJHMDEiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQ2OiJCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvZmU2ZjhlNzktNTk2Ni00YzRiLWI2MzMtNTdmODEzOTRmYTQ2LmpwZyI7czoyOiJtYiI7ZDowLjA1O3M6MjoibWQiO2Q6MC44NTt9aToxO2E6Njp7czoyOiJpZCI7aToyO3M6NDoia29kZSI7czozOiJHMDIiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjYwOiJMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS9hODRhYTg4NC1kOWIwLTQ5NmQtYTRkYy0yNTliMjUyYTE4YjUuanBnIjtzOjI6Im1iIjtkOjAuMDU7czoyOiJtZCI7ZDowLjg1O31pOjI7YTo2OntzOjI6ImlkIjtpOjM7czo0OiJrb2RlIjtzOjM6IkcwMyI7czoxMToibmFtYV9nZWphbGEiO3M6MzQ6IkJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6MTA6ImdhbWJhcl91cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL2dlamFsYS81ZDU2NmZkOC00MjNkLTRmMzItODE4ZC1mYmVkY2Q2MzVkY2YuanBnIjtzOjI6Im1iIjtkOjAuMzU7czoyOiJtZCI7ZDowLjU7fWk6MzthOjY6e3M6MjoiaWQiO2k6MTQ7czo0OiJrb2RlIjtzOjM6IkcxNCI7czoxMToibmFtYV9nZWphbGEiO3M6NDE6IkJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvMWVkMGVjNDYtZjg2YS00YjhiLThjNzAtYjhlMjUyMDJmZTgzLnBuZyI7czoyOiJtYiI7ZDowLjA1O3M6MjoibWQiO2Q6MC44NTt9fX1zOjY6ImRldGFpbCI7YToxMDp7czo4OiJHRUpBTEFfMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjUyOiJHMDEgLSBCZXJjYWsgYmVsYWgga2V0dXBhdCAodWp1bmcgcnVuY2luZykgcGFkYSBkYXVuIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjg7czo4OiJtYl9ib251cyI7ZDowLjA1O3M6ODoibWRfYm9udXMiO2Q6MC44NTtzOjY6ImltcGFjdCI7ZDotMC44O3M6MjoiY2YiO2Q6LTAuODtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMiI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjY2OiJHMDIgLSBMZWhlciBtYWxhaSBidXN1aywgYmVydWJhaCB3YXJuYSBjb2tsYXQgYXRhdSBoaXRhbSBkYW4gcGF0YWgiO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6LTAuODtzOjg6Im1iX2JvbnVzIjtkOjAuMDU7czo4OiJtZF9ib251cyI7ZDowLjg1O3M6NjoiaW1wYWN0IjtkOi0wLjg7czoyOiJjZiI7ZDotMC44O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjg6IkdFSkFMQV8zIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NDA6IkcwMyAtIEJ1bGlyIHBhZGkgaGFtcGEgYXRhdSB0aWRhayBiZXJpc2kiO3M6NToiamVuaXMiO3M6NjoiZ2VqYWxhIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2Q6LTAuMTU7czo4OiJtYl9ib251cyI7ZDowLjM1O3M6ODoibWRfYm9udXMiO2Q6MC41O3M6NjoiaW1wYWN0IjtkOi0wLjE1O3M6MjoiY2YiO2Q6LTAuMTU7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6OToiR0VKQUxBXzE0IjthOjk6e3M6ODoia3JpdGVyaWEiO3M6NDc6IkcxNCAtIEJlcmNhayBoaXRhbSBhdGF1IGNva2xhdCBwYWRhIGt1bGl0IGdhYmFoIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjg7czo4OiJtYl9ib251cyI7ZDowLjA1O3M6ODoibWRfYm9udXMiO2Q6MC44NTtzOjY6ImltcGFjdCI7ZDotMC44O3M6MjoiY2YiO2Q6LTAuODtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo0OiJCQVNFIjthOjExOntzOjg6ImtyaXRlcmlhIjtzOjMxOiJBa3VtdWxhc2kga2V5YWtpbmFuIGRhc2FyIHBha2FyIjtzOjU6ImplbmlzIjtzOjQ6ImJhc2UiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7aToxO3M6ODoibWJfYm9udXMiO2k6MDtzOjg6Im1kX2JvbnVzIjtpOjA7czo2OiJpbXBhY3QiO2Q6LTAuNTU1NjA3O3M6NzoibWJfYXdhbCI7ZDowLjQ0MjcwNjtzOjc6Im1kX2F3YWwiO2Q6MC45OTgzMTM7czoyOiJjZiI7ZDotMC41NTU2MDc7czo3OiJjYXRhdGFuIjtzOjg1OiJOaWxhaSBhd2FsIGRpYmVudHVrIGRhcmkgZ2FidW5nYW4gc2VtdWEgcnVsZSBnZWphbGEgeWFuZyBjb2NvayBkZW5nYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo2OiJQUkVTRVQiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxNToiUHJlc2V0IHNlaW1iYW5nIjtzOjU6ImplbmlzIjtzOjY6InByZXNldCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuNjtzOjg6Im1iX2JvbnVzIjtkOjAuMDM7czo4OiJtZF9ib251cyI7ZDotMC4wMTtzOjY6ImltcGFjdCI7ZDowLjA0O3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjU3OiJTZW11YSBhbHRlcm5hdGlmIG1lbmRhcGF0IHBlbnllc3VhaWFuIG1vZGVyYXQgZGFuIHN0YWJpbC4iO31zOjI6IkMxIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTQ6IkplbmlzIFBlbnlha2l0IjtzOjU6ImplbmlzIjtzOjc6ImJlbmVmaXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjU7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6MC4wMTg7czo2OiJpbXBhY3QiO2Q6MC4wMTI7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjU6IlByZWZlcmVuc2kgaW5pIG1lbWJlcmkgcGVueWVzdWFpYW4gdGFtYmFoYW4gcGFkYSBuaWxhaSBrZXlha2luYW4uIjt9czoyOiJDMiI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjU6IkhhcmdhIjtzOjU6ImplbmlzIjtzOjQ6ImNvc3QiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjc7czo4OiJtYl9ib251cyI7ZDowLjA0MjtzOjg6Im1kX2JvbnVzIjtkOjAuMDEwODtzOjY6ImltcGFjdCI7ZDowLjAzMTI7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjA6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIGxlYmloIGhlbWF0IGJpYXlhLiI7fXM6MjoiQzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxMToiRWZla3Rpdml0YXMiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuMTtzOjg6Im1iX2JvbnVzIjtkOjAuMDA2O3M6ODoibWRfYm9udXMiO2Q6MC4wMzI0O3M6NjoiaW1wYWN0IjtkOi0wLjAyNjQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6ODM6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIHB1bnlhIGtleWFraW5hbiBkYXNhciBwYWthciBsZWJpaCB0aW5nZ2kuIjt9czoyOiJDNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE3OiJEYW1wYWsgTGluZ2t1bmdhbiI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42NTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM5O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI2O3M6NjoiaW1wYWN0IjtkOjAuMDI2NDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NzoiUHJlZmVyZW5zaSBpbmkgbWVuZG9yb25nIGFsdGVybmF0aWYgeWFuZyBsZWJpaCBhbWFuIGRhbiB0ZXJrZW5kYWxpLiI7fX1zOjc6ImNmX21ldGEiO2E6Njp7czo3OiJtYl9hd2FsIjtkOjAuNDQyNzA2O3M6NzoibWRfYXdhbCI7ZDowLjk5ODMxMztzOjc6ImNmX2F3YWwiO2Q6LTAuNTU1NjA3O3M6ODoibWJfYWtoaXIiO2Q6MC41ODk3MDY7czo4OiJtZF9ha2hpciI7ZDoxO3M6ODoiY2ZfYWtoaXIiO2Q6LTAuNDEwMjk0O31zOjk6InBlcmluZ2thdCI7aTo0O3M6ODoiY2ZfYWtoaXIiO2Q6LTAuMTk0MjkzOTk5OTk5OTk5OTc7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7czoxNToiYWRqdXN0bWVudF9pbmZvIjthOjI6e3M6MTI6InByZXNldF9ib29zdCI7ZDowLjIxNjtzOjE4OiJzeW1wdG9tX2FkanVzdG1lbnQiO2Q6MC4wNzY7fX1pOjQ7YToxMTp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czo0OiJQUzAzIjtzOjQ6Im5hbWEiO3M6MTY6IkJhY3RvY3luIDEyLzUgV1AiO3M6MjoidmkiO2Q6LTAuMzkwNjM2OTk5OTk5OTk5OTY7czo0OiJtZXRhIjthOjEzOntzOjEwOiJnYW1iYXJfdXJsIjtzOjgwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9wZXN0aXNpZGEvMGFkODc0ZGMtYzFkMi00ZGE0LThiMjgtYmJkODA1ZDlmZjcyLmpwZyI7czo5OiJrYW5kdW5nYW4iO047czoxNjoia2FuZHVuZ2FuX2RldGFpbCI7czo3OToiU3RyZXB0b215Y2luIHN1bGZhdGU6IDEyJQ0KT3h5dGV0cmFjeWNsaW5lOiA1JQ0KRm9ybXVsYXNpOiBXZXR0YWJsZSBQb3dkZXIgKFdQKSI7czoxMToiYmFoYW5fYWt0aWYiO3M6MTk6IlN0cmVwdG9taXNpbiBTdWxmYXQiO3M6MTI6ImZ1bmdzaV91dGFtYSI7TjtzOjY6ImZ1bmdzaSI7czo5NDoiQmFrdGVyaXNpZGEgdW50dWsgbWVuZ2VuZGFsaWthbiBwZW55YWtpdCBiYWt0ZXJpIHBhZGEgcGFkaSBzZXBlcnRpIGhhd2FyIGRhdW4gYmFrdGVyaSAoa3Jlc2VrKSI7czo3OiJ0YWthcmFuIjtzOjE2OiLCsTQwMOKAkzYwMCBnL2hhIjtzOjU6ImRvc2lzIjtzOjk6IjHigJMyIGcvTCI7czoxNToiZWZla19wZW5nZ3VuYWFuIjtzOjk0OiJNZW5naGFtYmF0IHBlcmtlbWJhbmdhbiBiYWt0ZXJpLCBtZW5ndXJhbmdpIHBlbnllYmFyYW4gcGVueWFraXQsIGRhbiBtZW5qYWdhIGtlc2VoYXRhbiB0YW5hbWFuIjtzOjEzOiJjYXJhX2FwbGlrYXNpIjtzOjc1OiJEaXNlbXByb3RrYW4gbWVyYXRhIGtlIHNlbHVydWggYmFnaWFuIHRhbmFtYW4gdGVydXRhbWEgZGF1biB5YW5nIHRlcmluZmVrc2kiO3M6MjA6ImphZHdhbF91bXVyX2FwbGlrYXNpIjtzOjc1OiJTYWF0IGdlamFsYSBhd2FsIG11bmN1bA0KRGFwYXQgZGl1bGFuZyA34oCTMTAgaGFyaSBrZW11ZGlhbiBqaWthIGRpcGVybHVrYW4iO3M6MTg6ImZyZWt1ZW5zaV9hcGxpa2FzaSI7czozNDoiMeKAkzIga2FsaSBzZXN1YWkga29uZGlzaSBzZXJhbmdhbiI7czoxMjoiZ2VqYWxhX2NvY29rIjthOjQ6e2k6MDthOjY6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2ZlNmY4ZTc5LTU5NjYtNGM0Yi1iNjMzLTU3ZjgxMzk0ZmE0Ni5qcGciO3M6MjoibWIiO2Q6MC4wNTtzOjI6Im1kIjtkOjAuODU7fWk6MTthOjY6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6MzoiRzAyIjtzOjExOiJuYW1hX2dlamFsYSI7czo2MDoiTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvYTg0YWE4ODQtZDliMC00OTZkLWE0ZGMtMjU5YjI1MmExOGI1LmpwZyI7czoyOiJtYiI7ZDowLjA1O3M6MjoibWQiO2Q6MC44NTt9aToyO2E6Njp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7czoyOiJtYiI7ZDowLjE7czoyOiJtZCI7ZDowLjc1O31pOjM7YTo2OntzOjI6ImlkIjtpOjE0O3M6NDoia29kZSI7czozOiJHMTQiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQxOiJCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzFlZDBlYzQ2LWY4NmEtNGI4Yi04YzcwLWI4ZTI1MjAyZmU4My5wbmciO3M6MjoibWIiO2Q6MC4wNTtzOjI6Im1kIjtkOjAuODU7fX19czo2OiJkZXRhaWwiO2E6MTA6e3M6ODoiR0VKQUxBXzEiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1MjoiRzAxIC0gQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC44O3M6ODoibWJfYm9udXMiO2Q6MC4wNTtzOjg6Im1kX2JvbnVzIjtkOjAuODU7czo2OiJpbXBhY3QiO2Q6LTAuODtzOjI6ImNmIjtkOi0wLjg7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6ODoiR0VKQUxBXzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo2NjoiRzAyIC0gTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjg7czo4OiJtYl9ib251cyI7ZDowLjA1O3M6ODoibWRfYm9udXMiO2Q6MC44NTtzOjY6ImltcGFjdCI7ZDotMC44O3M6MjoiY2YiO2Q6LTAuODtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMyI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQwOiJHMDMgLSBCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjY1O3M6ODoibWJfYm9udXMiO2Q6MC4xO3M6ODoibWRfYm9udXMiO2Q6MC43NTtzOjY6ImltcGFjdCI7ZDotMC42NTtzOjI6ImNmIjtkOi0wLjY1O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjk6IkdFSkFMQV8xNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQ3OiJHMTQgLSBCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC44O3M6ODoibWJfYm9udXMiO2Q6MC4wNTtzOjg6Im1kX2JvbnVzIjtkOjAuODU7czo2OiJpbXBhY3QiO2Q6LTAuODtzOjI6ImNmIjtkOi0wLjg7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6NDoiQkFTRSI7YToxMTp7czo4OiJrcml0ZXJpYSI7czozMToiQWt1bXVsYXNpIGtleWFraW5hbiBkYXNhciBwYWthciI7czo1OiJqZW5pcyI7czo0OiJiYXNlIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2k6MTtzOjg6Im1iX2JvbnVzIjtpOjA7czo4OiJtZF9ib251cyI7aTowO3M6NjoiaW1wYWN0IjtkOi0wLjc3MDc5MztzOjc6Im1iX2F3YWwiO2Q6MC4yMjgzNjM7czo3OiJtZF9hd2FsIjtkOjAuOTk5MTU2O3M6MjoiY2YiO2Q6LTAuNzcwNzkzO3M6NzoiY2F0YXRhbiI7czo4NToiTmlsYWkgYXdhbCBkaWJlbnR1ayBkYXJpIGdhYnVuZ2FuIHNlbXVhIHJ1bGUgZ2VqYWxhIHlhbmcgY29jb2sgZGVuZ2FuIGFsdGVybmF0aWYgaW5pLiI7fXM6NjoiUFJFU0VUIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTU6IlByZXNldCBzZWltYmFuZyI7czo1OiJqZW5pcyI7czo2OiJwcmVzZXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjY7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6LTAuMDE7czo2OiJpbXBhY3QiO2Q6MC4wNDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo1NzoiU2VtdWEgYWx0ZXJuYXRpZiBtZW5kYXBhdCBwZW55ZXN1YWlhbiBtb2RlcmF0IGRhbiBzdGFiaWwuIjt9czoyOiJDMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE0OiJKZW5pcyBQZW55YWtpdCI7czo1OiJqZW5pcyI7czo3OiJiZW5lZml0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC41O3M6ODoibWJfYm9udXMiO2Q6MC4wMztzOjg6Im1kX2JvbnVzIjtkOjAuMDE4O3M6NjoiaW1wYWN0IjtkOjAuMDEyO3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjY1OiJQcmVmZXJlbnNpIGluaSBtZW1iZXJpIHBlbnllc3VhaWFuIHRhbWJhaGFuIHBhZGEgbmlsYWkga2V5YWtpbmFuLiI7fXM6MjoiQzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1OiJIYXJnYSI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MTtzOjg6Im1iX2JvbnVzIjtkOjAuMDY7czo4OiJtZF9ib251cyI7ZDowO3M6NjoiaW1wYWN0IjtkOjAuMDY7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjA6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIGxlYmloIGhlbWF0IGJpYXlhLiI7fXM6MjoiQzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxMToiRWZla3Rpdml0YXMiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuMTtzOjg6Im1iX2JvbnVzIjtkOjAuMDA2O3M6ODoibWRfYm9udXMiO2Q6MC4wMzI0O3M6NjoiaW1wYWN0IjtkOi0wLjAyNjQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6ODM6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIHB1bnlhIGtleWFraW5hbiBkYXNhciBwYWthciBsZWJpaCB0aW5nZ2kuIjt9czoyOiJDNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE3OiJEYW1wYWsgTGluZ2t1bmdhbiI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42NTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM5O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI2O3M6NjoiaW1wYWN0IjtkOjAuMDI2NDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NzoiUHJlZmVyZW5zaSBpbmkgbWVuZG9yb25nIGFsdGVybmF0aWYgeWFuZyBsZWJpaCBhbWFuIGRhbiB0ZXJrZW5kYWxpLiI7fX1zOjc6ImNmX21ldGEiO2E6Njp7czo3OiJtYl9hd2FsIjtkOjAuMjI4MzYzO3M6NzoibWRfYXdhbCI7ZDowLjk5OTE1NjtzOjc6ImNmX2F3YWwiO2Q6LTAuNzcwNzkzO3M6ODoibWJfYWtoaXIiO2Q6MC4zOTMzNjM7czo4OiJtZF9ha2hpciI7ZDoxO3M6ODoiY2ZfYWtoaXIiO2Q6LTAuNjA2NjM3O31zOjk6InBlcmluZ2thdCI7aTo1O3M6ODoiY2ZfYWtoaXIiO2Q6LTAuMzkwNjM2OTk5OTk5OTk5OTY7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7czoxNToiYWRqdXN0bWVudF9pbmZvIjthOjI6e3M6MTI6InByZXNldF9ib29zdCI7ZDowLjIxNjtzOjE4OiJzeW1wdG9tX2FkanVzdG1lbnQiO2Q6MC4wNzY7fX1pOjU7YToxMTp7czoyOiJpZCI7aTo0O3M6NDoia29kZSI7czo0OiJQUzA0IjtzOjQ6Im5hbWEiO3M6MTI6IkFncmVwdCAyMCBXUCI7czoyOiJ2aSI7ZDotMC4zOTA2MzY5OTk5OTk5OTk5NjtzOjQ6Im1ldGEiO2E6MTM6e3M6MTA6ImdhbWJhcl91cmwiO3M6ODA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91cGxvYWRzL3Blc3Rpc2lkYS81OWQ0MjUwNC1kZDljLTQ1NmUtYWVmZS01YmZiNmU2OTJhZTAuanBnIjtzOjk6ImthbmR1bmdhbiI7TjtzOjE2OiJrYW5kdW5nYW5fZGV0YWlsIjtzOjU4OiJTdHJlcHRvbXljaW4gc3VsZmF0ZTogMjAlDQpGb3JtdWxhc2k6IFdldHRhYmxlIFBvd2RlciAoV1ApIjtzOjExOiJiYWhhbl9ha3RpZiI7czoyMzoiU3RyZXB0b21pc2luIFN1bGZhdCAyMCUiO3M6MTI6ImZ1bmdzaV91dGFtYSI7TjtzOjY6ImZ1bmdzaSI7czo5NDoiQmFrdGVyaXNpZGEgdW50dWsgbWVuZ2VuZGFsaWthbiBwZW55YWtpdCBiYWt0ZXJpIHBhZGEgcGFkaSBzZXBlcnRpIGhhd2FyIGRhdW4gYmFrdGVyaSAoa3Jlc2VrKSI7czo3OiJ0YWthcmFuIjtzOjE2OiLCsTQwMOKAkzYwMCBnL2hhIjtzOjU6ImRvc2lzIjtzOjc6IjEsNSBnL0wiO3M6MTU6ImVmZWtfcGVuZ2d1bmFhbiI7czoxMDA6Ik1lbmVrYW4gcGVya2VtYmFuZ2FuIGJha3RlcmksIG1lbmd1cmFuZ2kgcGVueWViYXJhbiBwZW55YWtpdCwgZGFuIG1lbWJhbnR1IG1lbmphZ2Ega2VzZWhhdGFuIHRhbmFtYW4iO3M6MTM6ImNhcmFfYXBsaWthc2kiO3M6OTU6IkRpc2VtcHJvdGthbiBtZXJhdGEga2Ugc2VsdXJ1aCBiYWdpYW4gdGFuYW1hbiB0ZXJ1dGFtYSBkYXVuIHlhbmcgdGVyaW5mZWtzaSBtZW5nZ3VuYWthbiBzcHJheWVyIjtzOjIwOiJqYWR3YWxfdW11cl9hcGxpa2FzaSI7czo2ODoiU2FhdCBnZWphbGEgYXdhbCBtdW5jdWwNClVsYW5naSA34oCTMTAgaGFyaSBrZW11ZGlhbiBqaWthIGRpcGVybHVrYW4iO3M6MTg6ImZyZWt1ZW5zaV9hcGxpa2FzaSI7czozNDoiMeKAkzIga2FsaSBzZXN1YWkga29uZGlzaSBzZXJhbmdhbiI7czoxMjoiZ2VqYWxhX2NvY29rIjthOjQ6e2k6MDthOjY6e3M6MjoiaWQiO2k6MTtzOjQ6ImtvZGUiO3M6MzoiRzAxIjtzOjExOiJuYW1hX2dlamFsYSI7czo0NjoiQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhL2ZlNmY4ZTc5LTU5NjYtNGM0Yi1iNjMzLTU3ZjgxMzk0ZmE0Ni5qcGciO3M6MjoibWIiO2Q6MC4wNTtzOjI6Im1kIjtkOjAuODU7fWk6MTthOjY6e3M6MjoiaWQiO2k6MjtzOjQ6ImtvZGUiO3M6MzoiRzAyIjtzOjExOiJuYW1hX2dlamFsYSI7czo2MDoiTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvYTg0YWE4ODQtZDliMC00OTZkLWE0ZGMtMjU5YjI1MmExOGI1LmpwZyI7czoyOiJtYiI7ZDowLjA1O3M6MjoibWQiO2Q6MC44NTt9aToyO2E6Njp7czoyOiJpZCI7aTozO3M6NDoia29kZSI7czozOiJHMDMiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjM0OiJCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjEwOiJnYW1iYXJfdXJsIjtzOjc3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXBsb2Fkcy9nZWphbGEvNWQ1NjZmZDgtNDIzZC00ZjMyLTgxOGQtZmJlZGNkNjM1ZGNmLmpwZyI7czoyOiJtYiI7ZDowLjE7czoyOiJtZCI7ZDowLjc1O31pOjM7YTo2OntzOjI6ImlkIjtpOjE0O3M6NDoia29kZSI7czozOiJHMTQiO3M6MTE6Im5hbWFfZ2VqYWxhIjtzOjQxOiJCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czoxMDoiZ2FtYmFyX3VybCI7czo3NzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VwbG9hZHMvZ2VqYWxhLzFlZDBlYzQ2LWY4NmEtNGI4Yi04YzcwLWI4ZTI1MjAyZmU4My5wbmciO3M6MjoibWIiO2Q6MC4wNTtzOjI6Im1kIjtkOjAuODU7fX19czo2OiJkZXRhaWwiO2E6MTA6e3M6ODoiR0VKQUxBXzEiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1MjoiRzAxIC0gQmVyY2FrIGJlbGFoIGtldHVwYXQgKHVqdW5nIHJ1bmNpbmcpIHBhZGEgZGF1biI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC44O3M6ODoibWJfYm9udXMiO2Q6MC4wNTtzOjg6Im1kX2JvbnVzIjtkOjAuODU7czo2OiJpbXBhY3QiO2Q6LTAuODtzOjI6ImNmIjtkOi0wLjg7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6ODoiR0VKQUxBXzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo2NjoiRzAyIC0gTGVoZXIgbWFsYWkgYnVzdWssIGJlcnViYWggd2FybmEgY29rbGF0IGF0YXUgaGl0YW0gZGFuIHBhdGFoIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjg7czo4OiJtYl9ib251cyI7ZDowLjA1O3M6ODoibWRfYm9udXMiO2Q6MC44NTtzOjY6ImltcGFjdCI7ZDotMC44O3M6MjoiY2YiO2Q6LTAuODtzOjc6ImNhdGF0YW4iO3M6NTM6IlJ1bGUgcGFrYXIgbGFuZ3N1bmcgYW50YXJhIGdlamFsYSBkYW4gYWx0ZXJuYXRpZiBpbmkuIjt9czo4OiJHRUpBTEFfMyI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQwOiJHMDMgLSBCdWxpciBwYWRpIGhhbXBhIGF0YXUgdGlkYWsgYmVyaXNpIjtzOjU6ImplbmlzIjtzOjY6ImdlamFsYSI7czoxNToicHJlZmVyZW5zaV91c2VyIjtOO3M6Njoic2lnbmFsIjtkOi0wLjY1O3M6ODoibWJfYm9udXMiO2Q6MC4xO3M6ODoibWRfYm9udXMiO2Q6MC43NTtzOjY6ImltcGFjdCI7ZDotMC42NTtzOjI6ImNmIjtkOi0wLjY1O3M6NzoiY2F0YXRhbiI7czo1MzoiUnVsZSBwYWthciBsYW5nc3VuZyBhbnRhcmEgZ2VqYWxhIGRhbiBhbHRlcm5hdGlmIGluaS4iO31zOjk6IkdFSkFMQV8xNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjQ3OiJHMTQgLSBCZXJjYWsgaGl0YW0gYXRhdSBjb2tsYXQgcGFkYSBrdWxpdCBnYWJhaCI7czo1OiJqZW5pcyI7czo2OiJnZWphbGEiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7TjtzOjY6InNpZ25hbCI7ZDotMC44O3M6ODoibWJfYm9udXMiO2Q6MC4wNTtzOjg6Im1kX2JvbnVzIjtkOjAuODU7czo2OiJpbXBhY3QiO2Q6LTAuODtzOjI6ImNmIjtkOi0wLjg7czo3OiJjYXRhdGFuIjtzOjUzOiJSdWxlIHBha2FyIGxhbmdzdW5nIGFudGFyYSBnZWphbGEgZGFuIGFsdGVybmF0aWYgaW5pLiI7fXM6NDoiQkFTRSI7YToxMTp7czo4OiJrcml0ZXJpYSI7czozMToiQWt1bXVsYXNpIGtleWFraW5hbiBkYXNhciBwYWthciI7czo1OiJqZW5pcyI7czo0OiJiYXNlIjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO047czo2OiJzaWduYWwiO2k6MTtzOjg6Im1iX2JvbnVzIjtpOjA7czo4OiJtZF9ib251cyI7aTowO3M6NjoiaW1wYWN0IjtkOi0wLjc3MDc5MztzOjc6Im1iX2F3YWwiO2Q6MC4yMjgzNjM7czo3OiJtZF9hd2FsIjtkOjAuOTk5MTU2O3M6MjoiY2YiO2Q6LTAuNzcwNzkzO3M6NzoiY2F0YXRhbiI7czo4NToiTmlsYWkgYXdhbCBkaWJlbnR1ayBkYXJpIGdhYnVuZ2FuIHNlbXVhIHJ1bGUgZ2VqYWxhIHlhbmcgY29jb2sgZGVuZ2FuIGFsdGVybmF0aWYgaW5pLiI7fXM6NjoiUFJFU0VUIjthOjk6e3M6ODoia3JpdGVyaWEiO3M6MTU6IlByZXNldCBzZWltYmFuZyI7czo1OiJqZW5pcyI7czo2OiJwcmVzZXQiO3M6MTU6InByZWZlcmVuc2lfdXNlciI7aTo2MDtzOjY6InNpZ25hbCI7ZDowLjY7czo4OiJtYl9ib251cyI7ZDowLjAzO3M6ODoibWRfYm9udXMiO2Q6LTAuMDE7czo2OiJpbXBhY3QiO2Q6MC4wNDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo1NzoiU2VtdWEgYWx0ZXJuYXRpZiBtZW5kYXBhdCBwZW55ZXN1YWlhbiBtb2RlcmF0IGRhbiBzdGFiaWwuIjt9czoyOiJDMSI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE0OiJKZW5pcyBQZW55YWtpdCI7czo1OiJqZW5pcyI7czo3OiJiZW5lZml0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC41O3M6ODoibWJfYm9udXMiO2Q6MC4wMztzOjg6Im1kX2JvbnVzIjtkOjAuMDE4O3M6NjoiaW1wYWN0IjtkOjAuMDEyO3M6MjoiY2YiO047czo3OiJjYXRhdGFuIjtzOjY1OiJQcmVmZXJlbnNpIGluaSBtZW1iZXJpIHBlbnllc3VhaWFuIHRhbWJhaGFuIHBhZGEgbmlsYWkga2V5YWtpbmFuLiI7fXM6MjoiQzIiO2E6OTp7czo4OiJrcml0ZXJpYSI7czo1OiJIYXJnYSI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MTtzOjg6Im1iX2JvbnVzIjtkOjAuMDY7czo4OiJtZF9ib251cyI7ZDowO3M6NjoiaW1wYWN0IjtkOjAuMDY7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6NjA6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIGxlYmloIGhlbWF0IGJpYXlhLiI7fXM6MjoiQzMiO2E6OTp7czo4OiJrcml0ZXJpYSI7czoxMToiRWZla3Rpdml0YXMiO3M6NToiamVuaXMiO3M6NzoiYmVuZWZpdCI7czoxNToicHJlZmVyZW5zaV91c2VyIjtpOjYwO3M6Njoic2lnbmFsIjtkOjAuMTtzOjg6Im1iX2JvbnVzIjtkOjAuMDA2O3M6ODoibWRfYm9udXMiO2Q6MC4wMzI0O3M6NjoiaW1wYWN0IjtkOi0wLjAyNjQ7czoyOiJjZiI7TjtzOjc6ImNhdGF0YW4iO3M6ODM6IlByZWZlcmVuc2kgaW5pIG1lbXBlcmt1YXQgYWx0ZXJuYXRpZiB5YW5nIHB1bnlhIGtleWFraW5hbiBkYXNhciBwYWthciBsZWJpaCB0aW5nZ2kuIjt9czoyOiJDNCI7YTo5OntzOjg6ImtyaXRlcmlhIjtzOjE3OiJEYW1wYWsgTGluZ2t1bmdhbiI7czo1OiJqZW5pcyI7czo0OiJjb3N0IjtzOjE1OiJwcmVmZXJlbnNpX3VzZXIiO2k6NjA7czo2OiJzaWduYWwiO2Q6MC42NTtzOjg6Im1iX2JvbnVzIjtkOjAuMDM5O3M6ODoibWRfYm9udXMiO2Q6MC4wMTI2O3M6NjoiaW1wYWN0IjtkOjAuMDI2NDtzOjI6ImNmIjtOO3M6NzoiY2F0YXRhbiI7czo2NzoiUHJlZmVyZW5zaSBpbmkgbWVuZG9yb25nIGFsdGVybmF0aWYgeWFuZyBsZWJpaCBhbWFuIGRhbiB0ZXJrZW5kYWxpLiI7fX1zOjc6ImNmX21ldGEiO2E6Njp7czo3OiJtYl9hd2FsIjtkOjAuMjI4MzYzO3M6NzoibWRfYXdhbCI7ZDowLjk5OTE1NjtzOjc6ImNmX2F3YWwiO2Q6LTAuNzcwNzkzO3M6ODoibWJfYWtoaXIiO2Q6MC4zOTMzNjM7czo4OiJtZF9ha2hpciI7ZDoxO3M6ODoiY2ZfYWtoaXIiO2Q6LTAuNjA2NjM3O31zOjk6InBlcmluZ2thdCI7aTo2O3M6ODoiY2ZfYWtoaXIiO2Q6LTAuMzkwNjM2OTk5OTk5OTk5OTY7czoxODoicHJlZmVyZW5jZV9hcHBsaWVkIjtiOjE7czoxNToiYWRqdXN0bWVudF9pbmZvIjthOjI6e3M6MTI6InByZXNldF9ib29zdCI7ZDowLjIxNjtzOjE4OiJzeW1wdG9tX2FkanVzdG1lbnQiO2Q6MC4wNzY7fX19czoxNToicHJlZmVyZW5jZV9pbmZvIjthOjU6e3M6NjoicHJlc2V0IjtzOjg6InNlaW1iYW5nIjtzOjE2OiJjcml0ZXJpYV93ZWlnaHRzIjthOjQ6e2k6MTtzOjI6IjYwIjtpOjI7czoyOiI2MCI7aTozO3M6MjoiNjAiO2k6NDtzOjI6IjYwIjt9czoxNToic3ltcHRvbV93ZWlnaHRzIjthOjQ6e2k6MTtkOjgwO2k6MjtkOjEwMDtpOjQ7ZDo4MDtpOjU7ZDoxMDA7fXM6MTE6ImRlc2NyaXB0aW9uIjtzOjY5OiJQcmVmZXJlbnNpIGluaSBtZW1iZXJpa2FuIHBlbnllc3VhaWFuIG1vZGVyYXQgdW50dWsgc2VtdWEgYWx0ZXJuYXRpZi4iO3M6NzoiYXBwbGllZCI7YjoxO319fX19fQ==', 1777555920);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','petani') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'petani',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `catatan_profil` text COLLATE utf8mb4_unicode_ci,
  `foto_profil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_otp_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_otp_expires_at` timestamp NULL DEFAULT NULL,
  `login_otp_sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `role`, `email`, `no_telp`, `alamat`, `catatan_profil`, `foto_profil`, `email_verified_at`, `phone_verified_at`, `password`, `remember_token`, `login_otp_code`, `login_otp_expires_at`, `login_otp_sent_at`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$xk285n/k.G5xwjBHvIFDIu0W7TFej95e6YwPkcvf.qUTl1bAttITG', NULL, NULL, NULL, NULL, '2026-04-18 02:57:48', '2026-04-18 02:57:48'),
(15, 'zamhariro', 'zamhariro', 'petani', 'zamharpg@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$8QLa1RYrBVrSoj5jimYxWu6DCKDx8Iz5annx/ZlpwchHf01rBw/Ky', NULL, NULL, NULL, NULL, '2026-04-21 04:25:42', '2026-04-21 04:25:42'),
(16, 'akun2', 'akun2', 'petani', 'zamhakt@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$458Vd84iebHpkfL.kk49Qeoyrn6BZJDcbUrXs3hCsycCtg5Tj.JRK', NULL, NULL, NULL, NULL, '2026-04-24 15:15:42', '2026-04-24 15:15:42'),
(17, 'akun123', 'akun123', 'petani', 'zamharirozam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$tolMniWpxYeZy6lAekSLt.QXOVl62zgX.1Yiq6xF5gqxxKD9191mi', NULL, NULL, NULL, NULL, '2026-04-24 15:31:35', '2026-04-24 15:31:35'),
(18, 'zam123', 'zam123', 'petani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$iFeuUIfbnqc8JSWI7oRXZ.7QmjHbD2ErAIqoj.yK7m.EQIXCWcsb6', NULL, NULL, NULL, NULL, '2026-04-28 01:52:44', '2026-04-28 01:52:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `detail_rekomendasi_pestisida`
--
ALTER TABLE `detail_rekomendasi_pestisida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_rekomendasi_pestisida_id_rekomendasi_foreign` (`id_rekomendasi`),
  ADD KEY `detail_rekomendasi_pestisida_id_pestisida_foreign` (`id_pestisida`);

--
-- Indexes for table `detail_rekomendasi_pupuk`
--
ALTER TABLE `detail_rekomendasi_pupuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_rekomendasi_pupuk_id_rekomendasi_foreign` (`id_rekomendasi`),
  ADD KEY `detail_rekomendasi_pupuk_id_pupuk_foreign` (`id_pupuk`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gejala_kode_unique` (`kode`);

--
-- Indexes for table `gejala_pestisida`
--
ALTER TABLE `gejala_pestisida`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gejala_pestisida_id_gejala_id_pestisida_unique` (`id_gejala`,`id_pestisida`),
  ADD KEY `gejala_pestisida_id_pestisida_foreign` (`id_pestisida`);

--
-- Indexes for table `gejala_pupuk`
--
ALTER TABLE `gejala_pupuk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gejala_pupuk_id_gejala_id_pupuk_unique` (`id_gejala`,`id_pupuk`),
  ADD KEY `gejala_pupuk_id_pupuk_foreign` (`id_pupuk`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kriteria_kode_unique` (`kode`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penyakit_kode_unique` (`kode`);

--
-- Indexes for table `penyakit_gejala`
--
ALTER TABLE `penyakit_gejala`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penyakit_gejala_id_penyakit_id_gejala_unique` (`id_penyakit`,`id_gejala`),
  ADD KEY `penyakit_gejala_id_gejala_foreign` (`id_gejala`);

--
-- Indexes for table `penyakit_pestisida`
--
ALTER TABLE `penyakit_pestisida`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penyakit_pestisida_id_penyakit_id_pestisida_unique` (`id_penyakit`,`id_pestisida`),
  ADD KEY `penyakit_pestisida_id_pestisida_foreign` (`id_pestisida`);

--
-- Indexes for table `penyakit_pupuk`
--
ALTER TABLE `penyakit_pupuk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penyakit_pupuk_id_penyakit_id_pupuk_unique` (`id_penyakit`,`id_pupuk`),
  ADD KEY `penyakit_pupuk_id_pupuk_foreign` (`id_pupuk`);

--
-- Indexes for table `pestisida`
--
ALTER TABLE `pestisida`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pestisida_kode_unique` (`kode`);

--
-- Indexes for table `pupuk`
--
ALTER TABLE `pupuk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pupuk_kode_unique` (`kode`);

--
-- Indexes for table `rating_pestisida`
--
ALTER TABLE `rating_pestisida`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rating_pestisida_id_pestisida_id_kriteria_id_penyakit_unique` (`id_pestisida`,`id_kriteria`,`id_penyakit`),
  ADD KEY `rating_pestisida_id_kriteria_foreign` (`id_kriteria`),
  ADD KEY `rating_pestisida_id_penyakit_foreign` (`id_penyakit`);

--
-- Indexes for table `rating_pupuk`
--
ALTER TABLE `rating_pupuk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rating_pupuk_id_pupuk_id_kriteria_id_penyakit_unique` (`id_pupuk`,`id_kriteria`,`id_penyakit`),
  ADD KEY `rating_pupuk_id_kriteria_foreign` (`id_kriteria`),
  ADD KEY `rating_pupuk_id_penyakit_foreign` (`id_penyakit`);

--
-- Indexes for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekomendasi_id_user_foreign` (`id_user`),
  ADD KEY `rekomendasi_id_penyakit_foreign` (`id_penyakit`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_no_telp_unique` (`no_telp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_rekomendasi_pestisida`
--
ALTER TABLE `detail_rekomendasi_pestisida`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `detail_rekomendasi_pupuk`
--
ALTER TABLE `detail_rekomendasi_pupuk`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `gejala_pestisida`
--
ALTER TABLE `gejala_pestisida`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `gejala_pupuk`
--
ALTER TABLE `gejala_pupuk`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penyakit_gejala`
--
ALTER TABLE `penyakit_gejala`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `penyakit_pestisida`
--
ALTER TABLE `penyakit_pestisida`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `penyakit_pupuk`
--
ALTER TABLE `penyakit_pupuk`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pestisida`
--
ALTER TABLE `pestisida`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pupuk`
--
ALTER TABLE `pupuk`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rating_pestisida`
--
ALTER TABLE `rating_pestisida`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `rating_pupuk`
--
ALTER TABLE `rating_pupuk`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_rekomendasi_pestisida`
--
ALTER TABLE `detail_rekomendasi_pestisida`
  ADD CONSTRAINT `detail_rekomendasi_pestisida_id_pestisida_foreign` FOREIGN KEY (`id_pestisida`) REFERENCES `pestisida` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_rekomendasi_pestisida_id_rekomendasi_foreign` FOREIGN KEY (`id_rekomendasi`) REFERENCES `rekomendasi` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_rekomendasi_pupuk`
--
ALTER TABLE `detail_rekomendasi_pupuk`
  ADD CONSTRAINT `detail_rekomendasi_pupuk_id_pupuk_foreign` FOREIGN KEY (`id_pupuk`) REFERENCES `pupuk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_rekomendasi_pupuk_id_rekomendasi_foreign` FOREIGN KEY (`id_rekomendasi`) REFERENCES `rekomendasi` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gejala_pestisida`
--
ALTER TABLE `gejala_pestisida`
  ADD CONSTRAINT `gejala_pestisida_id_gejala_foreign` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gejala_pestisida_id_pestisida_foreign` FOREIGN KEY (`id_pestisida`) REFERENCES `pestisida` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gejala_pupuk`
--
ALTER TABLE `gejala_pupuk`
  ADD CONSTRAINT `gejala_pupuk_id_gejala_foreign` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gejala_pupuk_id_pupuk_foreign` FOREIGN KEY (`id_pupuk`) REFERENCES `pupuk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `penyakit_gejala`
--
ALTER TABLE `penyakit_gejala`
  ADD CONSTRAINT `penyakit_gejala_id_gejala_foreign` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penyakit_gejala_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `penyakit_pestisida`
--
ALTER TABLE `penyakit_pestisida`
  ADD CONSTRAINT `penyakit_pestisida_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penyakit_pestisida_id_pestisida_foreign` FOREIGN KEY (`id_pestisida`) REFERENCES `pestisida` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `penyakit_pupuk`
--
ALTER TABLE `penyakit_pupuk`
  ADD CONSTRAINT `penyakit_pupuk_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penyakit_pupuk_id_pupuk_foreign` FOREIGN KEY (`id_pupuk`) REFERENCES `pupuk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rating_pestisida`
--
ALTER TABLE `rating_pestisida`
  ADD CONSTRAINT `rating_pestisida_id_kriteria_foreign` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_pestisida_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_pestisida_id_pestisida_foreign` FOREIGN KEY (`id_pestisida`) REFERENCES `pestisida` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rating_pupuk`
--
ALTER TABLE `rating_pupuk`
  ADD CONSTRAINT `rating_pupuk_id_kriteria_foreign` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_pupuk_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_pupuk_id_pupuk_foreign` FOREIGN KEY (`id_pupuk`) REFERENCES `pupuk` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rekomendasi`
--
ALTER TABLE `rekomendasi`
  ADD CONSTRAINT `rekomendasi_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rekomendasi_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
