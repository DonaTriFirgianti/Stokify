-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Bulan Mei 2025 pada 06.36
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris_barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'Barang Kertas HVS A4 70gr telah diperbarui', 'App\\Models\\Item', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"quantity\":152},\"old\":{\"quantity\":76}}', NULL, '2025-05-20 09:18:34', '2025-05-20 09:18:34'),
(2, 'default', 'Barang Kertas HVS A4 70gr telah diperbarui', 'App\\Models\\Item', 'updated', 13, 'App\\Models\\User', 1, '{\"attributes\":{\"quantity\":76},\"old\":{\"quantity\":152}}', NULL, '2025-05-20 09:18:41', '2025-05-20 09:18:41'),
(3, 'default', 'Barang Binder Clip No. 107 telah diperbarui', 'App\\Models\\Item', 'updated', 12, 'App\\Models\\User', 1, '{\"attributes\":{\"quantity\":15},\"old\":{\"quantity\":2}}', NULL, '2025-05-20 09:19:28', '2025-05-20 09:19:28'),
(4, 'default', 'Barang Whiteboard Magnat 120x240cm telah diperbarui', 'App\\Models\\Item', 'updated', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"quantity\":12},\"old\":{\"quantity\":8}}', NULL, '2025-05-20 09:24:57', '2025-05-20 09:24:57'),
(5, 'default', 'Barang laptop hp pavilion telah ditambahkan', 'App\\Models\\Item', 'created', 14, NULL, NULL, '{\"attributes\":{\"name\":\"laptop hp pavilion\",\"description\":\"Laptop untuk keperluan kantor\",\"quantity\":10,\"category_id\":6,\"supplier_id\":1}}', NULL, '2025-05-23 21:18:41', '2025-05-23 21:18:41'),
(6, 'default', 'Barang Kabel HDMI 2.0 telah ditambahkan', 'App\\Models\\Item', 'created', 15, NULL, NULL, '{\"attributes\":{\"name\":\"Kabel HDMI 2.0\",\"description\":\"Kabel HDMI berkualitas tinggi untuk resolusi 4K\",\"quantity\":15,\"category_id\":8,\"supplier_id\":1}}', NULL, '2025-05-23 21:21:42', '2025-05-23 21:21:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_dona.123@gmail.com|127.0.0.1', 'i:1;', 1747208133),
('laravel_cache_dona.123@gmail.com|127.0.0.1:timer', 'i:1747208133;', 1747208133);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Elektronik Kantor', 'Perangkat elektronik untuk kebutuhan perkantoran', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(2, 'Furniture', 'Perabotan dan perlengkapan kantor', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(3, 'Alat Tulis', 'Peralatan tulis menulis dan sekolah', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(4, 'Peralatan Dapur', 'Peralatan untuk dapur dan pantry kantor', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(5, 'ATK', 'Alat Tulis Kantor dan perlengkapan administrasi', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(6, 'Perangkat IT', 'Komputer dan perlengkapan teknologi informasi', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(7, 'Alat Kebersihan', 'Peralatan kebersihan dan pemeliharaan', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(8, 'Peralatan Presentasi', 'Alat pendukung presentasi dan rapat', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(9, 'Konsumsi', 'Bahan makanan dan minuman kantor', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(10, 'Lainnya', 'Barang-barang lain yang tidak termasuk kategori', '2025-05-13 04:45:24', '2025-05-13 04:45:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `quantity`, `category_id`, `supplier_id`, `created_at`, `updated_at`) VALUES
(1, 'Printer Epson L380', 'Printer all-in-one dengan isi ulang tinta botolan', 18, 6, 1, '2025-05-13 04:45:24', '2025-05-20 08:16:31'),
(2, 'Kursi Direktur Leather', 'Kursi eksekutif berbahan kulit asli', 11, 2, 2, '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(3, 'Proyektor Epson EB-X41', 'Proyektor HD 3LCD 3600 lumen', 18, 8, 3, '2025-05-13 04:45:24', '2025-05-13 18:35:45'),
(4, 'Amplop Coklat Ukuran F4', 'Desain ergonomis untuk kenyamanan maksimal', 26, 1, 4, '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(5, 'Mesin Fotocopy Canon IR 2525', 'Desain ergonomis untuk kenyamanan maksimal', 13, 1, 3, '2025-05-13 04:45:24', '2025-05-20 08:04:58'),
(6, 'Penghapus Whiteboard Joyko', 'Tersedia dalam berbagai warna dan ukuran', 60, 9, 6, '2025-05-13 04:45:24', '2025-05-13 18:35:12'),
(7, 'Laptop ASUS ROG Zephyrus', 'Mudah dioperasikan dan perawatan sederhana', 14, 9, 5, '2025-05-13 04:45:24', '2025-05-13 18:35:00'),
(8, 'Lemari Arsip Besi 4 Susun', 'Dengan teknologi terkini dan hemat energi', 60, 9, 7, '2025-05-13 04:45:24', '2025-05-13 18:36:21'),
(9, 'AC Split Panasonic 1 PK', 'Mudah dioperasikan dan perawatan sederhana', 40, 7, 2, '2025-05-13 04:45:24', '2025-05-13 18:34:33'),
(10, 'Timbangan Digital 30kg', 'Produk berkualitas tinggi dengan garansi resmi', 35, 3, 8, '2025-05-13 04:45:24', '2025-05-13 18:34:45'),
(11, 'Whiteboard Magnat 120x240cm', 'Harga kompetitif dengan kualitas terjamin', 12, 8, 9, '2025-05-13 04:45:24', '2025-05-20 09:24:57'),
(12, 'Binder Clip No. 107', 'Produk berkualitas tinggi dengan garansi resmi', 15, 6, 6, '2025-05-13 04:45:24', '2025-05-20 09:19:28'),
(13, 'Kertas HVS A4 70gr', 'Dengan teknologi terkini dan hemat energi', 76, 2, 7, '2025-05-13 04:45:24', '2025-05-20 09:18:41'),
(14, 'laptop hp pavilion', 'Laptop untuk keperluan kantor', 10, 6, 1, '2025-05-23 21:18:41', '2025-05-23 21:18:41'),
(15, 'Kabel HDMI 2.0', 'Kabel HDMI berkualitas tinggi untuk resolusi 4K', 15, 8, 1, '2025-05-23 21:21:42', '2025-05-23 21:21:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_13_110308_create_categories_table', 1),
(5, '2025_05_13_110309_create_suppliers_table', 1),
(6, '2025_05_13_110310_create_items_table', 1),
(7, '2025_05_13_110312_create_transactions_table', 1),
(8, '2025_05_13_113132_add_role_to_users_table', 1),
(9, '2025_05_13_160440_add_last_login_at_to_users_table', 2),
(10, '2025_05_13_180507_create_activity_log_table', 3),
(11, '2025_05_13_180508_add_event_column_to_activity_log_table', 3),
(12, '2025_05_13_180509_add_batch_uuid_column_to_activity_log_table', 3),
(13, '2025_05_20_020242_create_loans_table', 4),
(14, '2025_05_20_161802_create_activity_log_table', 5),
(15, '2025_05_20_161803_add_event_column_to_activity_log_table', 5),
(16, '2025_05_20_161804_add_batch_uuid_column_to_activity_log_table', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('P1GH5ZYPxqBpA0Uc3Mw1p8wE3DdqtqXow8kDSGAq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ242dmJzNXhJWUduSkhja2FpUm5MMGRsMnVPcDJQT1dseHN5NE1wUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9pdGVtcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzQ4MDYwNTQyO319', 1748060551);

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'CV Sumber Makmur Jaya', 'info@sumbermakmurjaya.co.id', '(021) 55678901', 'Jl. Sudirman No. 45, Jakarta Pusat', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(2, 'PT Barokah Perkasa', 'barokah.perkasa@gmail.com', '081234567890', 'Komplek Ruko Permata Hijau Blok B2, Surabaya', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(3, 'UD Mandiri Sejahtera', 'mandiri.sejahtera@yahoo.com', '(031) 4567890', 'Jl. Raya Darmo No. 12, Surabaya', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(4, 'PT Yayasan Prabowo Utama', 'kbradtke@boehm.org', '+1-272-968-5319', 'Jln. Umalas No. 97, Administrasi Jakarta Timur 67797, Sulteng', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(5, 'Fa PT Mulyani Purnawati Tbk Sejahtera', 'abashirian@moore.biz', '+1-310-505-0325', 'Jln. Umalas No. 97, Administrasi Jakarta Timur 67797, Sulteng', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(6, 'CV PT Handayani Abadi', 'easton75@reinger.com', '515-982-8711', 'Jln. Umalas No. 97, Administrasi Jakarta Timur 67797, Sulteng', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(7, 'Fa Perum Mayasari (Persero) Tbk Sejahtera', 'uschuster@streich.com', '1-484-583-6203', 'Jln. Umalas No. 97, Administrasi Jakarta Timur 67797, Sulteng', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(8, 'CV UD Sihombing Makmur', 'wbrekke@nolan.com', '531-524-9577', 'Jln. Umalas No. 97, Administrasi Jakarta Timur 67797, Sulteng', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(9, 'PT PD Sitorus Utama', 'beahan.tobin@williamson.com', '689-412-9185', 'Jln. Umalas No. 97, Administrasi Jakarta Timur 67797, Sulteng', '2025-05-13 04:45:24', '2025-05-13 04:45:24'),
(10, 'PT Yayasan Nugroho Wibisono (Persero) Tbk Abadi', 'scot.okon@johnston.com', '(425) 395-3210', 'Jln. Umalas No. 97, Administrasi Jakarta Timur 67797, Sulteng', '2025-05-13 04:45:24', '2025-05-13 04:45:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `item_id`, `quantity`, `type`, `notes`, `created_at`, `updated_at`) VALUES
(1, 11, 46, 'in', 'Stok opname', '2024-10-10 08:21:21', '2025-05-13 04:45:24'),
(2, 12, 9, 'in', 'Retur barang dari konsumen', '2025-01-04 03:20:20', '2025-05-13 04:45:24'),
(3, 2, 3, 'out', 'Barang rusak', '2024-06-05 14:51:17', '2025-05-13 04:45:24'),
(4, 12, 7, 'out', 'Hadiah untuk klien', '2025-04-04 08:35:42', '2025-05-13 04:45:24'),
(5, 11, 30, 'out', 'Penggunaan internal', '2024-10-14 10:12:32', '2025-05-13 04:45:24'),
(6, 9, 50, 'out', 'Pengiriman ke cabang', '2024-12-28 12:32:43', '2025-05-13 04:45:24'),
(7, 4, 26, 'in', 'Penambahan stok dari pemasok', '2024-08-29 03:13:52', '2025-05-13 04:45:24'),
(8, 11, 28, 'out', 'Barang rusak', '2024-08-13 18:21:20', '2025-05-13 04:45:24'),
(9, 2, 14, 'in', 'Penambahan stok dari pemasok', '2025-02-12 21:34:12', '2025-05-13 04:45:24'),
(10, 1, 8, 'in', 'Penyesuaian stok sistem', '2024-05-18 02:23:55', '2025-05-13 04:45:24'),
(11, 3, 2, 'out', NULL, '2025-05-13 18:35:45', '2025-05-13 18:35:45'),
(12, 8, 10, 'out', NULL, '2025-05-13 18:36:21', '2025-05-13 18:36:21'),
(13, 11, 20, 'in', NULL, '2025-05-13 18:36:40', '2025-05-13 18:36:40'),
(14, 1, 5, 'in', NULL, '2025-04-14 00:55:13', '2025-05-14 00:55:15'),
(16, 13, 76, 'in', NULL, '2025-05-20 09:18:34', '2025-05-20 09:18:34'),
(17, 12, 13, 'in', NULL, '2025-05-20 09:19:28', '2025-05-20 09:19:28'),
(18, 11, 4, 'in', NULL, '2025-05-20 09:24:57', '2025-05-20 09:24:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `last_login_at`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$iaNdTTXQAmQc7j3HvFAC/urpgL9KHhHrfUnLfD7b4iZHfN1aiIxwi', 'jV0Gm6ca6RBqV8Y1fYdOe4BfbSNKgSO4eJSVe7rUAo9cxvT4Jd1MRTLFJAa5', NULL, '2025-05-13 04:45:22', '2025-05-13 04:45:22', 'admin'),
(2, 'User', 'user@gmail.com', NULL, '$2y$12$f5.dPUOoaIRHzOLm6NDIBe7wY2f3WbD5LxnvbPQ0Xh1ZCePr0ytV.', 'NKodn5avyCPny53HPdIL57AZBWvUNomSyROUh2dqB82FfBgLxYINgb1O3lgV', NULL, '2025-05-13 04:45:22', '2025-05-13 04:45:22', 'user'),
(3, 'Theo Ritchie', 'monica06@example.org', '2025-05-13 04:45:22', '$2y$12$sTXLA66ejqYPbxU7ZQgMS.jIV0/s.mT1ZlvRh9CA7m8bjy2ho04fi', 'XRJWzE6HMU', NULL, '2025-05-13 04:45:24', '2025-05-13 04:45:24', 'user'),
(4, 'Mrs. Mabel Spencer', 'bernice.grady@example.net', '2025-05-13 04:45:22', '$2y$12$XxYa/x1VpN9e4bV5rIcQROLMtw494x2vdylXoPheydEzj6mjRDGWy', 'sBC5UnFvvO', NULL, '2025-05-13 04:45:24', '2025-05-13 04:45:24', 'user'),
(5, 'Hilton Feest', 'alysha.jaskolski@example.com', '2025-05-13 04:45:23', '$2y$12$cLBv3GCECvdNkqFf4HaV9OiyWZztHzJiOOFLkse.I2cFuKUUbgBu.', 'tdk3RjZ2TZ', NULL, '2025-05-13 04:45:24', '2025-05-13 04:45:24', 'user'),
(6, 'Spencer Anderson', 'lsenger@example.org', '2025-05-13 04:45:23', '$2y$12$FYlwxQ3fVVv4JdDiXMTeGe4KLrBs8AswpbcUegII64xC10ZcQj4BW', '0WJh0eajqT', NULL, '2025-05-13 04:45:24', '2025-05-13 04:45:24', 'user'),
(7, 'Margie Cole III', 'xleannon@example.com', '2025-05-13 04:45:23', '$2y$12$JRfgPKi4iM/xpR5bb6r7te1AwyC3bsij1DJvKl8uyQ1R/WIwcLkiq', 'cgPsslfXxO', NULL, '2025-05-13 04:45:24', '2025-05-13 04:45:24', 'user'),
(8, 'admin2', 'admin.123@gmail.com', NULL, '$2y$12$Uf4rYl7v8.FvWxIp0WUXhu2R8EF/QKzYYPNAmMGEEDLEljYkOsj46', NULL, NULL, '2025-05-14 00:32:39', '2025-05-14 00:32:39', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_category_id_foreign` (`category_id`),
  ADD KEY `items_supplier_id_foreign` (`supplier_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_email_unique` (`email`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_item_id_foreign` (`item_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `items_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
