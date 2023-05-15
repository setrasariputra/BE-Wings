-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Bulan Mei 2023 pada 15.01
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
(13, '2023_05_10_233305_create_transaction_details_table', 4),
(14, '2023_05_12_095817_create_product_images_table', 5),
(15, '2023_05_12_100310_create_product_stocks_table', 6);

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
(1, 'SKUSKILNP', 'SO Klin Pewangi', 15000, 'IDR', 10, '13 cm x 10 cm', 'PCS', '2023-05-09 21:08:23', '2023-05-09 21:08:23', NULL),
(2, 'SKUGVBR', 'Giv Biru', 11000, 'IDR', NULL, '5 cm x 7 cm', 'PCS', '2023-05-09 21:08:23', '2023-05-09 21:08:23', NULL),
(3, 'SKUSKILNL', 'SO Klin Liquid', 18000, 'IDR', NULL, '13 cm x 10 cm', 'PCS', '2023-05-09 21:08:23', '2023-05-09 21:08:23', NULL),
(4, 'SKUSFTBR', 'So Soft Biru', 34000, 'IDR', 12, '13 cm x 10 cm x 5 cm', 'PCS', '2023-05-14 07:10:37', '2023-05-14 07:10:37', NULL),
(5, 'SKUEPLQ', 'Ekonomi Power Liquid', 15000, 'IDR', 5, '12 cm x 13 cm x 7 cm', 'PCS', '2023-05-14 07:15:17', '2023-05-14 07:15:17', NULL),
(6, 'Tes', 'Tes', 5000, 'IDR', 10, '12 cm', 'PCS', '2023-05-14 08:40:33', '2023-05-14 08:43:09', '2023-05-14 08:43:09'),
(7, 'tesss', 'tesss', 4000, 'IDR', 10, 'tess dim', 'PCS', '2023-05-14 09:03:53', '2023-05-14 09:04:07', '2023-05-14 09:04:07'),
(8, 'Tes', 'tess', 800, 'IDR', 9, 'tes dim', 'PCS', '2023-05-14 09:17:50', '2023-05-14 09:18:04', '2023-05-14 09:18:04'),
(9, 'SKUSKLT', 'SO Klin Lantai ', 14000, 'IDR', 8, '13 cm x 10 cm x 11 cm', 'PCS', '2023-05-14 09:30:03', '2023-05-14 09:30:03', NULL),
(10, 'SKUSKLPWTL', 'SO Klin Pewangi Kental', 12500, 'IDR', 6, '10 cm x 11 cm 7 cm', 'PCS', '2023-05-14 09:32:34', '2023-05-14 09:32:34', NULL),
(11, 'SKUDACF', 'Daia Deterjen Clean & Fresh', 18000, 'IDR', 5, '13 cm x 12 cm x 10 cm', 'PCS', '2023-05-14 10:16:58', '2023-05-14 10:16:58', NULL),
(12, 'SKUFRDO', 'Florida Orange', 7500, 'IDR', NULL, '12 cm x 10 cm x 7 cm', 'PCS', '2023-05-14 10:57:57', '2023-05-14 10:57:57', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filesize` varchar(255) NOT NULL,
  `filetype` varchar(255) NOT NULL,
  `fileurl` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `filename`, `filesize`, `filetype`, `fileurl`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 12, '1684068305Floridina-orange.jpg', '77369', 'jpg', './uploads/products', '2023-05-14 12:33:01', '2023-05-14 12:45:05', NULL),
(3, 11, '1684068227daia-deterjen-clean-and-fresh.jpeg', '30366', 'jpeg', './uploads/products', '2023-05-14 12:43:47', '2023-05-14 12:43:47', NULL),
(4, 10, '1684068265soklin-pewangi-kental.jpg', '67839', 'jpg', './uploads/products', '2023-05-14 12:44:25', '2023-05-14 12:44:25', NULL),
(5, 9, '1684068310soklin-lantai.jpeg', '25848', 'jpeg', './uploads/products', '2023-05-14 12:45:10', '2023-05-14 12:45:10', NULL),
(6, 5, '1684068361ekonomi-power-liquid.jpg', '91112', 'jpg', './uploads/products', '2023-05-14 12:46:01', '2023-05-14 12:46:01', NULL),
(7, 4, '1684068398sosoft-wings.jpeg', '46303', 'jpeg', './uploads/products', '2023-05-14 12:46:38', '2023-05-14 12:46:38', NULL),
(8, 2, '1684068426giv-biru.jpeg', '32169', 'jpeg', './uploads/products', '2023-05-14 12:47:06', '2023-05-14 12:47:06', NULL),
(9, 3, '1684068458soklin-liquid.jpg', '58341', 'jpg', './uploads/products', '2023-05-14 12:47:38', '2023-05-14 12:47:38', NULL),
(10, 1, '1684068494soklin-pewangi.jpg', '55442', 'jpg', './uploads/products', '2023-05-14 12:48:14', '2023-05-14 12:48:14', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 100, '2023-05-13 00:05:30', '2023-05-13 00:05:30', NULL),
(2, 3, 100, '2023-05-13 00:05:30', '2023-05-13 00:05:30', NULL),
(3, 1, 100, '2023-05-13 00:06:07', '2023-05-13 00:06:07', NULL),
(4, 4, 100, '2023-05-13 00:06:07', '2023-05-13 00:06:07', NULL),
(5, 5, 100, '2023-05-13 00:06:07', '2023-05-13 00:06:07', NULL),
(6, 6, 100, '2023-05-13 00:06:07', '2023-05-13 00:06:07', NULL),
(7, 7, 50, '2023-05-14 09:03:53', '2023-05-14 09:03:53', NULL);

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
(1, 1, 2, 11000, 2, 'PCS', 22000, 'IDR', '2023-05-10 19:00:43', '2023-05-10 19:00:43', NULL),
(2, 1, 3, 18000, 1, 'PCS', 18000, 'IDR', '2023-05-10 19:00:43', '2023-05-10 19:00:43', NULL),
(3, 1, 1, 13500, 2, 'PCS', 27000, 'IDR', '2023-05-10 19:00:43', '2023-05-10 19:00:43', NULL),
(4, 2, 2, 11000, 3, 'PCS', 33000, 'IDR', '2023-05-10 19:27:39', '2023-05-10 19:27:39', NULL),
(5, 2, 3, 18000, 3, 'PCS', 54000, 'IDR', '2023-05-10 19:27:39', '2023-05-10 19:27:39', NULL),
(6, 3, 2, 11000, 5, 'PCS', 55000, 'IDR', '2023-05-10 20:58:32', '2023-05-10 20:58:32', NULL),
(7, 4, 2, 11000, 1, 'PCS', 11000, 'IDR', '2023-05-10 21:09:32', '2023-05-10 21:09:32', NULL),
(8, 4, 3, 18000, 3, 'PCS', 54000, 'IDR', '2023-05-10 21:09:32', '2023-05-10 21:09:32', NULL),
(9, 4, 1, 13500, 1, 'PCS', 13500, 'IDR', '2023-05-10 21:09:32', '2023-05-10 21:09:32', NULL),
(10, 5, 2, 11000, 1, 'PCS', 11000, 'IDR', '2023-05-10 21:21:33', '2023-05-10 21:21:33', NULL),
(11, 5, 3, 18000, 2, 'PCS', 36000, 'IDR', '2023-05-10 21:21:33', '2023-05-10 21:21:33', NULL),
(12, 6, 1, 13500, 4, 'PCS', 54000, 'IDR', '2023-05-10 21:21:52', '2023-05-10 21:21:52', NULL),
(13, 6, 3, 18000, 1, 'PCS', 18000, 'IDR', '2023-05-10 21:21:52', '2023-05-10 21:21:52', NULL),
(14, 7, 2, 11000, 3, 'PCS', 33000, 'IDR', '2023-05-11 00:41:20', '2023-05-11 00:41:20', NULL),
(15, 7, 3, 18000, 2, 'PCS', 36000, 'IDR', '2023-05-11 00:41:20', '2023-05-11 00:41:20', NULL),
(16, 8, 2, 11000, 2, 'PCS', 22000, 'IDR', '2023-05-11 00:42:16', '2023-05-11 00:42:16', NULL),
(17, 8, 3, 18000, 2, 'PCS', 36000, 'IDR', '2023-05-11 00:42:16', '2023-05-11 00:42:16', NULL),
(18, 8, 1, 13500, 2, 'PCS', 27000, 'IDR', '2023-05-11 00:42:16', '2023-05-11 00:42:16', NULL),
(19, 9, 2, 11000, 1, 'PCS', 11000, 'IDR', '2023-05-13 07:21:37', '2023-05-13 07:21:37', NULL),
(20, 9, 3, 18000, 1, 'PCS', 18000, 'IDR', '2023-05-13 07:21:37', '2023-05-13 07:21:37', NULL),
(21, 10, 2, 11000, 1, 'PCS', 11000, 'IDR', '2023-05-13 23:55:23', '2023-05-13 23:55:23', NULL),
(22, 10, 3, 18000, 1, 'PCS', 18000, 'IDR', '2023-05-13 23:55:23', '2023-05-13 23:55:23', NULL),
(23, 11, 2, 11000, 2, 'PCS', 22000, 'IDR', '2023-05-14 02:32:33', '2023-05-14 02:32:33', NULL),
(24, 11, 3, 18000, 1, 'PCS', 18000, 'IDR', '2023-05-14 02:32:33', '2023-05-14 02:32:33', NULL),
(25, 11, 1, 13500, 1, 'PCS', 13500, 'IDR', '2023-05-14 02:32:33', '2023-05-14 02:32:33', NULL),
(26, 12, 2, 11000, 10, 'PCS', 110000, 'IDR', '2023-05-14 02:55:17', '2023-05-14 02:55:17', NULL),
(27, 13, 2, 11000, 5, 'PCS', 55000, 'IDR', '2023-05-14 04:53:29', '2023-05-14 04:53:29', NULL),
(28, 13, 3, 18000, 5, 'PCS', 90000, 'IDR', '2023-05-14 04:53:29', '2023-05-14 04:53:29', NULL),
(29, 13, 1, 13500, 5, 'PCS', 67500, 'IDR', '2023-05-14 04:53:29', '2023-05-14 04:53:29', NULL),
(30, 14, 11, 17100, 2, 'PCS', 34200, 'IDR', '2023-05-14 11:14:08', '2023-05-14 11:14:08', NULL),
(31, 14, 5, 14250, 1, 'PCS', 14250, 'IDR', '2023-05-14 11:14:08', '2023-05-14 11:14:08', NULL),
(32, 15, 12, 7500, 1, 'PCS', 7500, 'IDR', '2023-05-14 12:52:24', '2023-05-14 12:52:24', NULL),
(33, 15, 11, 17100, 1, 'PCS', 17100, 'IDR', '2023-05-14 12:52:24', '2023-05-14 12:52:24', NULL),
(34, 15, 2, 11000, 1, 'PCS', 11000, 'IDR', '2023-05-14 12:52:24', '2023-05-14 12:52:24', NULL),
(35, 15, 4, 29920, 1, 'PCS', 29920, 'IDR', '2023-05-14 12:52:24', '2023-05-14 12:52:24', NULL);

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
(1, 'TRX', '001', 1, 67000, '2023-05-11', '2023-05-10 19:00:43', '2023-05-10 19:00:43', NULL),
(2, 'TRX', '002', 1, 87000, '2023-05-11', '2023-05-10 19:27:39', '2023-05-10 19:27:39', NULL),
(3, 'TRX', '003', 1, 55000, '2023-05-11', '2023-05-10 20:58:32', '2023-05-10 20:58:32', NULL),
(4, 'TRX', '004', 1, 78500, '2023-05-11', '2023-05-10 21:09:32', '2023-05-10 21:09:32', NULL),
(5, 'TRX', '005', 1, 47000, '2023-05-11', '2023-05-10 21:21:33', '2023-05-10 21:21:33', NULL),
(6, 'TRX', '006', 1, 72000, '2023-05-11', '2023-05-10 21:21:52', '2023-05-10 21:21:52', NULL),
(7, 'TRX', '007', 1, 69000, '2023-05-11', '2023-05-11 00:41:20', '2023-05-11 00:41:20', NULL),
(8, 'TRX', '008', 1, 85000, '2023-05-11', '2023-05-11 00:42:16', '2023-05-11 00:42:16', NULL),
(9, 'TRX', '009', 1, 29000, '2023-05-13', '2023-05-13 07:21:37', '2023-05-13 07:21:37', NULL),
(10, 'TRX', '010', 1, 29000, '2023-05-13', '2023-05-13 23:55:23', '2023-05-13 23:55:23', NULL),
(11, 'TRX', '011', 1, 53500, '2023-05-14', '2023-05-14 02:32:33', '2023-05-14 02:32:33', NULL),
(12, 'TRX', '012', 1, 110000, '2023-05-14', '2023-05-14 02:55:17', '2023-05-14 02:55:17', NULL),
(13, 'TRX', '013', 1, 212500, '2023-05-14', '2023-05-14 04:53:29', '2023-05-14 04:53:29', NULL),
(14, 'TRX', '014', 1, 48450, '2023-05-14', '2023-05-14 11:14:08', '2023-05-14 11:14:08', NULL),
(15, 'TRX', '015', 1, 65520, '2023-05-14', '2023-05-14 12:52:24', '2023-05-14 12:52:24', NULL);

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
-- Indeks untuk tabel `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_stocks_product_id_foreign` (`product_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `transaction_headers`
--
ALTER TABLE `transaction_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ketidakleluasaan untuk tabel `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD CONSTRAINT `product_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

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
