-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Bulan Mei 2023 pada 10.06
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

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
(3, '2023_05_10_165146_create_users_table', 1),
(10, '2023_05_10_035059_create_products_table', 2),
(12, '2023_05_10_232216_create_transaction_headers_table', 3),
(13, '2023_05_10_233305_create_transaction_details_table', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_code` varchar(18) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `dimension` varchar(50) NOT NULL,
  `unit` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `price`, `currency`, `discount`, `dimension`, `unit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SKUSKILNP', 'SO Klin Pewangi', 15000, 'IDR', 10, '13 cm x 10 cm', 'PCS', '2023-05-10 04:08:23', '2023-05-10 04:08:23', NULL),
(2, 'SKUGVBR', 'Giv Biru', 11000, 'IDR', NULL, '5 cm x 7 cm', 'PCS', '2023-05-10 04:08:23', '2023-05-10 04:08:23', NULL),
(3, 'SKUSKILNL', 'SO Klin Liquid', 18000, 'IDR', NULL, '13 cm x 10 cm', 'PCS', '2023-05-10 04:08:23', '2023-05-10 04:08:23', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_header_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit` varchar(5) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaction_details`
--

INSERT INTO `transaction_details` (`id`, `transaction_header_id`, `product_id`, `price`, `qty`, `unit`, `subtotal`, `currency`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 11000, 2, 'PCS', 22000, 'IDR', '2023-05-11 02:00:43', '2023-05-11 02:00:43', NULL),
(2, 1, 3, 18000, 1, 'PCS', 18000, 'IDR', '2023-05-11 02:00:43', '2023-05-11 02:00:43', NULL),
(3, 1, 1, 13500, 2, 'PCS', 27000, 'IDR', '2023-05-11 02:00:43', '2023-05-11 02:00:43', NULL),
(4, 2, 2, 11000, 3, 'PCS', 33000, 'IDR', '2023-05-11 02:27:39', '2023-05-11 02:27:39', NULL),
(5, 2, 3, 18000, 3, 'PCS', 54000, 'IDR', '2023-05-11 02:27:39', '2023-05-11 02:27:39', NULL),
(6, 3, 2, 11000, 5, 'PCS', 55000, 'IDR', '2023-05-11 03:58:32', '2023-05-11 03:58:32', NULL),
(7, 4, 2, 11000, 1, 'PCS', 11000, 'IDR', '2023-05-11 04:09:32', '2023-05-11 04:09:32', NULL),
(8, 4, 3, 18000, 3, 'PCS', 54000, 'IDR', '2023-05-11 04:09:32', '2023-05-11 04:09:32', NULL),
(9, 4, 1, 13500, 1, 'PCS', 13500, 'IDR', '2023-05-11 04:09:32', '2023-05-11 04:09:32', NULL),
(10, 5, 2, 11000, 1, 'PCS', 11000, 'IDR', '2023-05-11 04:21:33', '2023-05-11 04:21:33', NULL),
(11, 5, 3, 18000, 2, 'PCS', 36000, 'IDR', '2023-05-11 04:21:33', '2023-05-11 04:21:33', NULL),
(12, 6, 1, 13500, 4, 'PCS', 54000, 'IDR', '2023-05-11 04:21:52', '2023-05-11 04:21:52', NULL),
(13, 6, 3, 18000, 1, 'PCS', 18000, 'IDR', '2023-05-11 04:21:52', '2023-05-11 04:21:52', NULL),
(14, 7, 2, 11000, 3, 'PCS', 33000, 'IDR', '2023-05-11 07:41:20', '2023-05-11 07:41:20', NULL),
(15, 7, 3, 18000, 2, 'PCS', 36000, 'IDR', '2023-05-11 07:41:20', '2023-05-11 07:41:20', NULL),
(16, 8, 2, 11000, 2, 'PCS', 22000, 'IDR', '2023-05-11 07:42:16', '2023-05-11 07:42:16', NULL),
(17, 8, 3, 18000, 2, 'PCS', 36000, 'IDR', '2023-05-11 07:42:16', '2023-05-11 07:42:16', NULL),
(18, 8, 1, 13500, 2, 'PCS', 27000, 'IDR', '2023-05-11 07:42:16', '2023-05-11 07:42:16', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_headers`
--

CREATE TABLE `transaction_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_code` varchar(3) NOT NULL,
  `document_number` varchar(10) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaction_headers`
--

INSERT INTO `transaction_headers` (`id`, `document_code`, `document_number`, `user_id`, `total`, `date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'TRX', '001', 1, 67000, '2023-05-11', '2023-05-11 02:00:43', '2023-05-11 02:00:43', NULL),
(2, 'TRX', '002', 1, 87000, '2023-05-11', '2023-05-11 02:27:39', '2023-05-11 02:27:39', NULL),
(3, 'TRX', '003', 1, 55000, '2023-05-11', '2023-05-11 03:58:32', '2023-05-11 03:58:32', NULL),
(4, 'TRX', '004', 1, 78500, '2023-05-11', '2023-05-11 04:09:32', '2023-05-11 04:09:32', NULL),
(5, 'TRX', '005', 1, 47000, '2023-05-11', '2023-05-11 04:21:33', '2023-05-11 04:21:33', NULL),
(6, 'TRX', '006', 1, 72000, '2023-05-11', '2023-05-11 04:21:52', '2023-05-11 04:21:52', NULL),
(7, 'TRX', '007', 1, 69000, '2023-05-11', '2023-05-11 07:41:20', '2023-05-11 07:41:20', NULL),
(8, 'TRX', '008', 1, 85000, '2023-05-11', '2023-05-11 07:42:16', '2023-05-11 07:42:16', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `user`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'setrasariputra', '$2y$10$cai9j4QTHFHAkmten/h4yu8/weiuTOvfubzURYQycLeX7Gs93SF/C', '2023-05-10 02:46:36', '2023-05-10 02:46:36', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_details_transaction_header_id_foreign` (`transaction_header_id`),
  ADD KEY `transaction_details_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `transaction_headers`
--
ALTER TABLE `transaction_headers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_headers_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `transaction_headers`
--
ALTER TABLE `transaction_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transaction_details_transaction_header_id_foreign` FOREIGN KEY (`transaction_header_id`) REFERENCES `transaction_headers` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaction_headers`
--
ALTER TABLE `transaction_headers`
  ADD CONSTRAINT `transaction_headers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
