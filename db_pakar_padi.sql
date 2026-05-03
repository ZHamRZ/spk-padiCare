-- ================================================================
-- DATABASE: db_pakar_padi
-- Sistem Pakar Diagnosis Penyakit Padi dengan Metode Certainty Factor
-- Logika: Gejala → Diagnosis Penyakit (CF) → Rekomendasi Pupuk & Pestisida
-- ================================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------
-- Buat Database
-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `db_pakar_padi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `db_pakar_padi`;

-- ================================================================
-- TABEL: users
-- Deskripsi: Menyimpan data pengguna (admin dan petani)
-- ================================================================
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `role` enum('admin','petani') NOT NULL DEFAULT 'petani',
  `alamat` text DEFAULT NULL,
  `catatan_profil` text DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: cache
-- Deskripsi: Cache system Laravel
-- ================================================================
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: cache_locks
-- Deskripsi: Cache locks untuk concurrency control
-- ================================================================
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: jobs
-- Deskripsi: Queue jobs Laravel
-- ================================================================
CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: job_batches
-- Deskripsi: Queue job batches Laravel
-- ================================================================
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: failed_jobs
-- Deskripsi: Failed queue jobs Laravel
-- ================================================================
CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: password_reset_tokens
-- Deskripsi: Token reset password
-- ================================================================
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: sessions
-- Deskripsi: Session management Laravel
-- ================================================================
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: kriteria
-- Deskripsi: Kriteria untuk penilaian pupuk dan pestisida
-- Jenis: benefit (semakin tinggi semakin baik) atau cost (semakin rendah semakin baik)
-- ================================================================
CREATE TABLE `kriteria` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` enum('benefit','cost') NOT NULL,
  `bobot` decimal(5,2) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kriteria_kode_unique` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: gejala
-- Deskripsi: Menyimpan daftar gejala penyakit padi
-- ================================================================
CREATE TABLE `gejala` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama_gejala` varchar(200) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gejala_kode_unique` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: penyakit
-- Deskripsi: Menyimpan daftar penyakit padi yang dapat didiagnosis
-- ================================================================
CREATE TABLE `penyakit` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `penyakit_kode_unique` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: penyakit_gejala
-- Deskripsi: Relasi many-to-many antara penyakit dan gejala
-- MB (Measure of Belief): Tingkat kepercayaan gejala mendukung penyakit
-- MD (Measure of Disbelief): Tingkat ketidakpercayaan gejala terhadap penyakit
-- CF (Certainty Factor) = MB - MD
-- ================================================================
CREATE TABLE `penyakit_gejala` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `id_gejala` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT 0.700,
  `md` decimal(4,3) NOT NULL DEFAULT 0.100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `penyakit_gejala_unique` (`id_penyakit`, `id_gejala`),
  KEY `penyakit_gejala_id_gejala_foreign` (`id_gejala`),
  CONSTRAINT `penyakit_gejala_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE,
  CONSTRAINT `penyakit_gejala_id_gejala_foreign` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: pupuk
-- Deskripsi: Menyimpan data jenis pupuk untuk tanaman padi
-- ================================================================
CREATE TABLE `pupuk` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kandungan` varchar(200) DEFAULT NULL,
  `kandungan_detail` text DEFAULT NULL,
  `fungsi_utama` text DEFAULT NULL,
  `takaran` text DEFAULT NULL,
  `efek_penggunaan` text DEFAULT NULL,
  `cara_aplikasi` text DEFAULT NULL,
  `jadwal_umur_aplikasi` text DEFAULT NULL,
  `frekuensi_aplikasi` text DEFAULT NULL,
  `harga_per_kg` decimal(10,2) NOT NULL,
  `satuan` varchar(20) NOT NULL DEFAULT 'kg',
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pupuk_kode_unique` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: pestisida
-- Deskripsi: Menyimpan data jenis pestisida untuk tanaman padi
-- Jenis: fungisida (jamur), bakterisida (bakteri), insektisida (serangga), herbisida (gulma)
-- ================================================================
CREATE TABLE `pestisida` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` enum('fungisida','bakterisida','insektisida','herbisida') NOT NULL,
  `bahan_aktif` varchar(200) DEFAULT NULL,
  `kandungan_detail` text DEFAULT NULL,
  `fungsi` text DEFAULT NULL,
  `dosis` varchar(100) DEFAULT NULL,
  `takaran` text DEFAULT NULL,
  `efek_penggunaan` text DEFAULT NULL,
  `cara_aplikasi` text DEFAULT NULL,
  `jadwal_umur_aplikasi` text DEFAULT NULL,
  `frekuensi_aplikasi` text DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `satuan_harga` varchar(30) NOT NULL DEFAULT 'per 100ml',
  `gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pestisida_kode_unique` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: penyakit_pupuk
-- Deskripsi: Relasi many-to-many antara penyakit dan pupuk
-- MB: Tingkat kepercayaan pupuk mencegah/mengatasi penyebab penyakit
-- MD: Tingkat ketidakpercayaan pupuk terhadap penyakit
-- LOGIKA UTAMA: Rekomendasi pupuk didasarkan pada penyakit yang terdiagnosis
-- ================================================================
CREATE TABLE `penyakit_pupuk` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `id_pupuk` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT 0.700,
  `md` decimal(4,3) NOT NULL DEFAULT 0.100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `penyakit_pupuk_unique` (`id_penyakit`, `id_pupuk`),
  KEY `penyakit_pupuk_id_pupuk_foreign` (`id_pupuk`),
  CONSTRAINT `penyakit_pupuk_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE,
  CONSTRAINT `penyakit_pupuk_id_pupuk_foreign` FOREIGN KEY (`id_pupuk`) REFERENCES `pupuk` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: penyakit_pestisida
-- Deskripsi: Relasi many-to-many antara penyakit dan pestisida
-- MB: Tingkat kepercayaan pestisida mengatasi/membasmi penyakit
-- MD: Tingkat ketidakpercayaan pestisida terhadap penyakit
-- LOGIKA UTAMA: Rekomendasi pestisida didasarkan pada penyakit yang terdiagnosis
-- ================================================================
CREATE TABLE `penyakit_pestisida` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `id_pestisida` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT 0.700,
  `md` decimal(4,3) NOT NULL DEFAULT 0.100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `penyakit_pestisida_unique` (`id_penyakit`, `id_pestisida`),
  KEY `penyakit_pestisida_id_pestisida_foreign` (`id_pestisida`),
  CONSTRAINT `penyakit_pestisida_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE,
  CONSTRAINT `penyakit_pestisida_id_pestisida_foreign` FOREIGN KEY (`id_pestisida`) REFERENCES `pestisida` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: gejala_pupuk (TIDAK DIGUNAKAN UNTUK REKOMENDASI UTAMA)
-- Deskripsi: Relasi historis antara gejala dan pupuk
-- CATATAN: Tabel ini tidak lagi digunakan dalam logika rekomendasi utama
-- Hanya dipertahankan untuk kompatibilitas backward
-- ================================================================
CREATE TABLE `gejala_pupuk` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_gejala` bigint UNSIGNED NOT NULL,
  `id_pupuk` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT 0.700,
  `md` decimal(4,3) NOT NULL DEFAULT 0.100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gejala_pupuk_unique` (`id_gejala`, `id_pupuk`),
  KEY `gejala_pupuk_id_pupuk_foreign` (`id_pupuk`),
  CONSTRAINT `gejala_pupuk_id_gejala_foreign` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gejala_pupuk_id_pupuk_foreign` FOREIGN KEY (`id_pupuk`) REFERENCES `pupuk` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: gejala_pestisida (TIDAK DIGUNAKAN UNTUK REKOMENDASI UTAMA)
-- Deskripsi: Relasi historis antara gejala dan pestisida
-- CATATAN: Tabel ini tidak lagi digunakan dalam logika rekomendasi utama
-- Hanya dipertahankan untuk kompatibilitas backward
-- ================================================================
CREATE TABLE `gejala_pestisida` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_gejala` bigint UNSIGNED NOT NULL,
  `id_pestisida` bigint UNSIGNED NOT NULL,
  `mb` decimal(4,3) NOT NULL DEFAULT 0.700,
  `md` decimal(4,3) NOT NULL DEFAULT 0.100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gejala_pestisida_unique` (`id_gejala`, `id_pestisida`),
  KEY `gejala_pestisida_id_pestisida_foreign` (`id_pestisida`),
  CONSTRAINT `gejala_pestisida_id_gejala_foreign` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id`) ON DELETE CASCADE,
  CONSTRAINT `gejala_pestisida_id_pestisida_foreign` FOREIGN KEY (`id_pestisida`) REFERENCES `pestisida` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: rekomendasi
-- Deskripsi: Menyimpan hasil diagnosis dan rekomendasi untuk user
-- preferensi_pengguna: JSON berisi preferensi user (misal: organik, harga, dll)
-- ================================================================
CREATE TABLE `rekomendasi` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_penyakit` bigint UNSIGNED NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp(),
  `preferensi_label` varchar(50) DEFAULT NULL,
  `preferensi_pengguna` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rekomendasi_id_user_foreign` (`id_user`),
  KEY `rekomendasi_id_penyakit_foreign` (`id_penyakit`),
  CONSTRAINT `rekomendasi_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rekomendasi_id_penyakit_foreign` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: detail_rekomendasi_pupuk
-- Deskripsi: Detail rekomendasi pupuk untuk setiap hasil diagnosis
-- nilai_vi: Nilai akhir perhitungan (VI - Value Index) dari metode CF/SAW
-- peringkat: Ranking rekomendasi (1 = terbaik)
-- ================================================================
CREATE TABLE `detail_rekomendasi_pupuk` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_rekomendasi` bigint UNSIGNED NOT NULL,
  `id_pupuk` bigint UNSIGNED NOT NULL,
  `nilai_vi` decimal(8,6) NOT NULL,
  `peringkat` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detail_rekomendasi_pupuk_id_rekomendasi_foreign` (`id_rekomendasi`),
  KEY `detail_rekomendasi_pupuk_id_pupuk_foreign` (`id_pupuk`),
  CONSTRAINT `detail_rekomendasi_pupuk_id_rekomendasi_foreign` FOREIGN KEY (`id_rekomendasi`) REFERENCES `rekomendasi` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detail_rekomendasi_pupuk_id_pupuk_foreign` FOREIGN KEY (`id_pupuk`) REFERENCES `pupuk` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- TABEL: detail_rekomendasi_pestisida
-- Deskripsi: Detail rekomendasi pestisida untuk setiap hasil diagnosis
-- nilai_vi: Nilai akhir perhitungan (VI - Value Index) dari metode CF/SAW
-- peringkat: Ranking rekomendasi (1 = terbaik)
-- ================================================================
CREATE TABLE `detail_rekomendasi_pestisida` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_rekomendasi` bigint UNSIGNED NOT NULL,
  `id_pestisida` bigint UNSIGNED NOT NULL,
  `nilai_vi` decimal(8,6) NOT NULL,
  `peringkat` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detail_rekomendasi_pestisida_id_rekomendasi_foreign` (`id_rekomendasi`),
  KEY `detail_rekomendasi_pestisida_id_pestisida_foreign` (`id_pestisida`),
  CONSTRAINT `detail_rekomendasi_pestisida_id_rekomendasi_foreign` FOREIGN KEY (`id_rekomendasi`) REFERENCES `rekomendasi` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detail_rekomendasi_pestisida_id_pestisida_foreign` FOREIGN KEY (`id_pestisida`) REFERENCES `pestisida` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================================
-- DUMMY DATA (Opsional - untuk testing)
-- ================================================================

-- Data User Admin
INSERT INTO `users` (`nama`, `username`, `role`, `password`, `created_at`, `updated_at`) 
VALUES ('Administrator', 'admin', 'admin', '$2y$12$L9vXzK8hJqR3mN5pQ7wYtO.uVxGzH2kF6jD8sA1cE9bW4nM0rL3iP', NOW(), NOW());

-- Data Kriteria (contoh)
INSERT INTO `kriteria` (`kode`, `nama`, `jenis`, `bobot`, `keterangan`, `created_at`, `updated_at`) VALUES
('C001', 'Efektivitas', 'benefit', 0.30, 'Tingkat efektivitas dalam mengatasi masalah', NOW(), NOW()),
('C002', 'Harga', 'cost', 0.25, 'Biaya pembelian produk', NOW(), NOW()),
('C003', 'Ketersediaan', 'benefit', 0.20, 'Kemudahan mendapatkan produk di pasaran', NOW(), NOW()),
('C004', 'Keamanan', 'benefit', 0.15, 'Tingkat keamanan bagi tanaman dan lingkungan', NOW(), NOW()),
('C005', 'Kemudahan Aplikasi', 'benefit', 0.10, 'Kemudahan dalam penggunaan/aplikasi', NOW(), NOW());

-- Data Gejala (contoh)
INSERT INTO `gejala` (`kode`, `nama_gejala`, `gambar`, `created_at`, `updated_at`) VALUES
('G001', 'Daun berwarna kuning', NULL, NOW(), NOW()),
('G002', 'Bercak coklat pada daun', NULL, NOW(), NOW()),
('G003', 'Daun layu dan mengering', NULL, NOW(), NOW()),
('G004', 'Batang busuk', NULL, NOW(), NOW()),
('G005', 'Pertumbuhan terhambat', NULL, NOW(), NOW()),
('G006', 'Bulat-bulat kecil pada daun', NULL, NOW(), NOW()),
('G007', 'Daun bergaris-garis coklat', NULL, NOW(), NOW()),
('G008', 'Malai padi kosong', NULL, NOW(), NOW());

-- Data Penyakit (contoh)
INSERT INTO `penyakit` (`kode`, `nama`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
('P001', 'Penyakit Blas', 'Penyakit jamur yang menyerang daun, leher malai, dan butir padi.', NULL, NOW(), NOW()),
('P002', 'Penyakit Hawar Daun Bakteri', 'Penyakit bakteri yang menyebabkan daun layu dan mengering.', NULL, NOW(), NOW()),
('P003', 'Penyakit Tungro', 'Penyakit virus yang ditularkan oleh wereng hijau.', NULL, NOW(), NOW()),
('P004', 'Penyakit Bercak Coklat', 'Penyakit jamur yang menyebabkan bercak coklat pada daun.', NULL, NOW(), NOW());

-- Data Penyakit-Gejala (contoh dengan CF)
INSERT INTO `penyakit_gejala` (`id_penyakit`, `id_gejala`, `mb`, `md`, `created_at`, `updated_at`) VALUES
(1, 1, 0.800, 0.100, NOW(), NOW()),
(1, 2, 0.900, 0.050, NOW(), NOW()),
(1, 6, 0.850, 0.100, NOW(), NOW()),
(1, 8, 0.750, 0.150, NOW(), NOW()),
(2, 1, 0.700, 0.200, NOW(), NOW()),
(2, 3, 0.850, 0.100, NOW(), NOW()),
(2, 4, 0.900, 0.050, NOW(), NOW()),
(3, 1, 0.650, 0.250, NOW(), NOW()),
(3, 5, 0.800, 0.150, NOW(), NOW()),
(3, 7, 0.750, 0.200, NOW(), NOW()),
(4, 2, 0.850, 0.100, NOW(), NOW()),
(4, 6, 0.700, 0.200, NOW(), NOW());

-- Data Pupuk (contoh)
INSERT INTO `pupuk` (`kode`, `nama`, `kandungan`, `kandungan_detail`, `fungsi_utama`, `takaran`, `efek_penggunaan`, `cara_aplikasi`, `jadwal_umur_aplikasi`, `frekuensi_aplikasi`, `harga_per_kg`, `satuan`, `gambar`, `created_at`, `updated_at`) VALUES
('PUP001', 'Urea', 'N 46%', 'Nitrogen (N) 46%.', 'Merangsang pertumbuhan vegetatif secara maksimal.', '100-300 kg per hektare', 'Daun menjadi hijau tua dan rimbun.', 'Ditabur merata atau dikocor', '7-10 HST dan 21-25 HST', '2 kali per musim', 3500.00, 'kg', NULL, NOW(), NOW()),
('PUP002', 'NPK Phonska', 'N 15%, P 15%, K 15%, S 10%', 'Nitrogen 15%, Fosfat 15%, Kalium 15%, Sulfur 10%.', 'Nutrisi seimbang untuk semua fase pertumbuhan.', '150-300 kg per hektare', 'Tanaman tumbuh sehat merata.', 'Ditugal atau ditabur', '7-10 HST dan 21-25 HST', '2 kali per musim', 4500.00, 'kg', NULL, NOW(), NOW()),
('PUP003', 'SP-36', 'P 36%', 'Fosfat (P2O5) 36%.', 'Pembentukan akar dan memacu pembungaan.', '100-200 kg per hektare', 'Akar lebih lebat, bunga serempak.', 'Pupuk dasar saat olah lahan', '0-7 HST', '1 kali per musim', 4000.00, 'kg', NULL, NOW(), NOW()),
('PUP004', 'KCl', 'K 60%', 'Kalium (K2O) 60%.', 'Meningkatkan kualitas hasil panen.', '50-100 kg per hektare', 'Gabah lebih berbobot.', 'Ditabur saat fase generatif', '35-45 HST', '1 kali per musim', 5000.00, 'kg', NULL, NOW(), NOW()),
('PUP005', 'Kompos', 'C-organik >= 15%', 'Karbon organik dan mikroorganisme baik.', 'Memperbaiki struktur tanah.', '1-5 ton per hektare', 'Tanah gembur dan subur.', 'Dicampur dengan tanah', 'H-7 hingga H-2 sebelum tanam', '1 kali per musim', 500.00, 'kg', NULL, NOW(), NOW()),
('PUP006', 'ZA', 'N 21%, S 24%', 'Nitrogen 21% dan Sulfur 24%.', 'Sumber nitrogen dan sulfur.', '50-150 kg per hektare', 'Daun hijau segar.', 'Ditabur di sekitar pangkal', '30-35 HST', '1 kali per musim', 3000.00, 'kg', NULL, NOW(), NOW());

-- Data Pestisida (contoh)
INSERT INTO `pestisida` (`kode`, `nama`, `jenis`, `bahan_aktif`, `kandungan_detail`, `fungsi`, `dosis`, `takaran`, `efek_penggunaan`, `cara_aplikasi`, `jadwal_umur_aplikasi`, `frekuensi_aplikasi`, `harga`, `satuan_harga`, `gambar`, `created_at`, `updated_at`) VALUES
('PES001', 'Amistar Top', 'fungisida', 'Azoksistrobin + Difenokonazol', 'Azoksistrobin 200 g/l dan Difenokonazol 125 g/l.', 'Mengendalikan penyakit jamur spektrum luas.', NULL, '0.5-1 ml per liter air', 'Tanaman terbebas dari jamur.', 'Disemprotkan merata', '40-45 HST dan 60-65 HST', '1-2 kali per musim', 75000.00, 'per 100ml', NULL, NOW(), NOW()),
('PES002', 'Filia 525 SE', 'fungisida', 'Propikonazol + Trisiklazol', 'Propikonazol 125 g/l dan Trisiklazol 400 g/l.', 'Mengendalikan penyakit blas pada padi.', NULL, '1-1.5 ml per liter air', 'Menghentikan penyebaran jamur.', 'Penyemprotan volume tinggi', '30, 40, dan 60 HST', '2-3 kali per musim', 85000.00, 'per 100ml', NULL, NOW(), NOW()),
('PES003', 'Bactocyn', 'bakterisida', 'Oksitetrasiklin', 'Oksitetrasiklin, antibiotik pertanian.', 'Membasmi bakteri patogen.', NULL, '1-2 ml per liter air', 'Kerusakan akibat bakteri berhenti.', 'Disemprotkan atau dikocorkan', '20 HST atau saat gejala muncul', 'Interval 4-7 hari', 60000.00, 'per 100ml', NULL, NOW(), NOW()),
('PES004', 'Agrept 20 WP', 'bakterisida', 'Streptomisin sulfat', 'Streptomisin sulfat 20%.', 'Mengendalikan layu bakteri dan hawar daun.', NULL, '1-2 gram per liter air', 'Bakteri patogen mati secara sistemik.', 'Disemprotkan atau dikocorkan', 'Segera setelah gejala terlihat', 'Interval 5-7 hari', 55000.00, 'per 100ml', NULL, NOW(), NOW()),
('PES005', 'Winder 50 EC', 'insektisida', 'Imidakloprid', 'Imidakloprid.', 'Mengendalikan hama penusuk-penghisap.', NULL, '0.5-1 ml per liter air', 'Hama lumpuh dan mati.', 'Disemprotkan pada daun', '15-40 HST', '1 minggu sekali', 70000.00, 'per 100ml', NULL, NOW(), NOW()),
('PES006', 'Validacin 3 L', 'bakterisida', 'Validamisin A', 'Validamisin A 3%.', 'Mengendalikan hawar pelepah.', NULL, '1-2 ml per liter air', 'Bercak mengering dan penyebaran berhenti.', 'Fokus pada pelepah batang bawah', '30-50 HST', 'Interval 7-10 hari', 65000.00, 'per 100ml', NULL, NOW(), NOW());

-- Data Penyakit-Pupuk (REKOMENDASI BERBASIS PENYAKIT)
-- MB: seberapa besar pupuk membantu mencegah/mengatasi penyebab penyakit
-- MD: seberapa kecil kontribusi pupuk
INSERT INTO `penyakit_pupuk` (`id_penyakit`, `id_pupuk`, `mb`, `md`, `created_at`, `updated_at`) VALUES
-- Penyakit Blas (P001) - Butuh K tinggi untuk ketahanan
(1, 4, 0.850, 0.100, NOW(), NOW()), -- KCl
(1, 2, 0.750, 0.150, NOW(), NOW()), -- NPK Phonska
(1, 5, 0.700, 0.200, NOW(), NOW()), -- Kompos
-- Hawar Daun Bakteri (P002) - Butuh N seimbang
(2, 1, 0.600, 0.300, NOW(), NOW()), -- Urea (hati-hati, N berlebihan bisa memperparah)
(2, 2, 0.800, 0.150, NOW(), NOW()), -- NPK Phonska
(2, 5, 0.750, 0.150, NOW(), NOW()), -- Kompos
-- Tungro (P003) - Butuh tanaman sehat
(3, 2, 0.700, 0.200, NOW(), NOW()), -- NPK Phonska
(3, 5, 0.800, 0.100, NOW(), NOW()), -- Kompos
(3, 4, 0.650, 0.250, NOW(), NOW()), -- KCl
-- Bercak Coklat (P004) - Butuh K dan Si
(4, 4, 0.800, 0.150, NOW(), NOW()), -- KCl
(4, 2, 0.750, 0.150, NOW(), NOW()), -- NPK Phonska
(4, 5, 0.700, 0.200, NOW(), NOW()); -- Kompos

-- Data Penyakit-Pestisida (REKOMENDASI BERBASIS PENYAKIT)
-- MB: seberapa efektif pestisida mengatasi penyakit
-- MD: seberapa tidak efektif
INSERT INTO `penyakit_pestisida` (`id_penyakit`, `id_pestisida`, `mb`, `md`, `created_at`, `updated_at`) VALUES
-- Penyakit Blas (P001) - Fungisida
(1, 1, 0.900, 0.050, NOW(), NOW()), -- Amistar Top
(1, 2, 0.950, 0.030, NOW(), NOW()), -- Filia 525 SE
-- Hawar Daun Bakteri (P002) - Bakterisida
(2, 3, 0.850, 0.100, NOW(), NOW()), -- Bactocyn
(2, 4, 0.900, 0.050, NOW(), NOW()), -- Agrept 20 WP
-- Tungro (P003) - Insektisida (vektor wereng)
(3, 5, 0.800, 0.150, NOW(), NOW()), -- Winder 50 EC
-- Bercak Coklat (P004) - Fungisida
(4, 1, 0.850, 0.100, NOW(), NOW()), -- Amistar Top
(4, 2, 0.800, 0.150, NOW(), NOW()); -- Filia 525 SE

-- ================================================================
-- INDEX TAMBAHAN UNTUK OPTIMISASI QUERY
-- ================================================================
ALTER TABLE `penyakit_gejala` ADD INDEX `idx_penyakit` (`id_penyakit`);
ALTER TABLE `penyakit_gejala` ADD INDEX `idx_gejala` (`id_gejala`);
ALTER TABLE `penyakit_pupuk` ADD INDEX `idx_penyakit_pupuk` (`id_penyakit`);
ALTER TABLE `penyakit_pupuk` ADD INDEX `idx_pupuk_penyakit` (`id_pupuk`);
ALTER TABLE `penyakit_pestisida` ADD INDEX `idx_penyakit_pestisida` (`id_penyakit`);
ALTER TABLE `penyakit_pestisida` ADD INDEX `idx_pestisida_penyakit` (`id_pestisida`);
ALTER TABLE `rekomendasi` ADD INDEX `idx_tanggal` (`tanggal`);
ALTER TABLE `detail_rekomendasi_pupuk` ADD INDEX `idx_peringkat` (`peringkat`);
ALTER TABLE `detail_rekomendasi_pestisida` ADD INDEX `idx_peringkat_pestisida` (`peringkat`);

COMMIT;

-- ================================================================
-- CATATAN PENTING TENTANG LOGIKA SISTEM
-- ================================================================
-- 
-- ALUR DIAGNOSIS DAN REKOMENDASI (LOGIKA BARU):
-- 1. User memilih gejala yang dialami tanaman padi
-- 2. Sistem menghitung Certainty Factor (CF) untuk setiap penyakit:
--    - CF = MB - MD (untuk setiap gejala)
--    - CF_combined = CF1 + CF2 * (1 - CF1) (kombinasi multiple gejala)
-- 3. Penyakit dengan CF tertinggi menjadi hasil diagnosis
-- 4. Berdasarkan penyakit yang terdiagnosis, sistem mengambil:
--    - Rekomendasi Pupuk dari tabel `penyakit_pupuk`
--    - Rekomendasi Pestisida dari tabel `penyakit_pestisida`
-- 5. Perhitungan akhir menggunakan metode SAW/CF untuk ranking:
--    - Untuk PUPUK: CF_rekomendasi = -CF_penyebab (negasi, karena pupuk adalah pencegahan)
--    - Untuk PESTISIDA: CF_rekomendasi = CF_solusi (langsung, karena pestisida adalah pengobatan)
-- 6. Hasil ranking ditampilkan kepada user dengan detail lengkap
--
-- TABEL YANG TIDAK DIGUNAKAN UNTUK REKOMENDASI UTAMA:
-- - gejala_pupuk: Hanya untuk kompatibilitas backward, tidak digunakan dalam logika baru
-- - gejala_pestisida: Hanya untuk kompatibilitas backward, tidak digunakan dalam logika baru
--
-- BEST PRACTICE:
-- - Selalu gunakan eager loading saat query relasi untuk menghindari N+1 query
-- - Gunakan transaction untuk operasi yang melibatkan multiple tables
-- - Index kolom foreign key untuk performa query yang optimal
-- - Validasi input user sebelum proses diagnosis
-- ================================================================
