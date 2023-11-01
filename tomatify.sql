-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 01 Nov 2023 pada 12.53
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tomatify`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `savepredict`
--

CREATE TABLE `savepredict` (
  `id` int(11) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `confidence` decimal(5,2) NOT NULL,
  `description` text NOT NULL,
  `prevention` text NOT NULL,
  `userId` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `savepredict`
--

INSERT INTO `savepredict` (`id`, `kelas`, `confidence`, `description`, `prevention`, `userId`, `created_at`) VALUES
(58, 'late blight', 3.05, 'Penyakit late blight, juga dikenal sebagai penyakit busuk daun, merupakan salah satu penyakit yang paling merusak pada tanaman tomat yang disebabkan oleh agen patogen bernama Phytophthora infestans (Mont.)', 'Pengendalian penyakit busuk daun dalam konteks budidaya tomat melibatkan sejumlah praktik pertanian dan tindakan pengendalian. Hal ini mencakup implementasi rotasi tanaman dan masa bera (periode tanah tidak ditanami), eliminasi tanaman tomat yang telah terinfeksi penyakit busuk daun, dan penghindaran produk tomat yang telah terkontaminasi. Selain itu, aplikasi fungisida juga merupakan metode umum untuk mengurangi perkembangan penyakit ini', 80, '2023-11-01 04:53:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `role`, `created_at`, `updated_at`, `email`) VALUES
(51, 'admin', 'admin', '$2b$10$OnzXGDAA3UqJCnb8/qWIa.YbM0bkkUScZVuIW1NoM1ALa8UKVZydO', 'admin', '2023-10-28 04:58:06', '2023-10-29 16:53:42', 'admin@ss.xx'),
(60, 'user', 'user', '$2b$10$ZT4Eyc0rQspNL/PBgJjU9u1amZU7FmkbKoA0TUse0q9ZW/OXjdEvW', 'user', '2023-10-29 15:51:09', '2023-10-29 15:51:09', 'user@cc.zz'),
(61, 'wayan', 'wayan', '$2b$10$lpcdBzk2JEVbM.QwcGBOHuydHECHBEmNBRLUFulCnc.6KJwG1HpKG', 'user', '2023-10-30 02:27:00', '2023-10-30 02:27:00', 'wayan@gmail.com'),
(63, 'nyoman', 'nyoman', '$2b$10$U0AMdW2n.2FXuGhZ/rvzoeeg.aig5DvEzwfT3Gma9uOKYVzX8z/my', 'user', '2023-10-30 02:27:40', '2023-10-30 02:29:16', 'nyoman@gmail.com'),
(64, 'putu', 'putu', '$2b$10$hgxFqjBgFZJipTEPQ6JQEeoPGucfIkXDXmIOtmjSelEifqBbbwW4K', 'user', '2023-10-30 02:28:03', '2023-10-30 02:33:18', 'putu@gmail.com'),
(65, 'gede', 'gede', '$2b$10$.CEQaSs0Bni3KYeTDOyiXu7isokkhY.VLsR9L2MlASw344oawRXDO', 'user', '2023-10-30 10:36:53', '2023-10-30 10:37:51', 'gede@yahoo.com'),
(66, 'kadek', 'kadek', '$2b$10$A1hLEAY4rdRWC0Y2/uqQSuOeEjzPK8o4CQKIgZAnthT6mJpl6uQj6', 'user', '2023-10-30 10:42:05', '2023-10-30 10:42:05', 'kadek@gmail.com'),
(67, 'komang', 'komang', '$2b$10$x4Wm4TyLdYz7w/9TDZFKw.PpgLvdoFTBnS3eneL5FXjZi7TGdW0xm', 'user', '2023-10-30 10:44:52', '2023-10-30 10:44:52', 'komang@gmail.com'),
(80, 'tespredik', 'tes predik', '$2b$10$/zG3HcozEsbXabZQK2XLTeX2YO8P8NJ7n4LaYalYGsvOov/6WPQXe', 'user', '2023-11-01 04:51:45', '2023-11-01 04:51:45', 'tes@ss.ff');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `savepredict`
--
ALTER TABLE `savepredict`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `savepredict`
--
ALTER TABLE `savepredict`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `savepredict`
--
ALTER TABLE `savepredict`
  ADD CONSTRAINT `fk_savepredict_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
