-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 27 Okt 2023 pada 21.27
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
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `role`, `created_at`, `updated_at`, `email`) VALUES
(5, 'admin', 'Bharata', '$2b$10$pBM.DNc8cxm7YpFFPGaMYeWKSGQ12tFUJrA/J38bMMteCuaco87nO', 'admin', '2023-10-17 14:30:54', '2023-10-18 10:22:25', 'user1@ccc.com'),
(20, '', '', '$2b$10$8cmXXovERt8Q1uUxQo91uurzmbKYSP3/INUAakHjpcouFejdS60Fa', 'user', '2023-10-19 03:51:47', '2023-10-19 03:51:47', ''),
(23, 'fe8', 'fe', '$2b$10$23h4kW./P2q36XyUlP1SFuKDER0KuPbTNBKq0/C9K6ib/rEZumI6S', 'user', '2023-10-19 04:06:58', '2023-10-19 04:06:58', 'fe8@cc.com'),
(25, 'fe10', 'fe10', '$2b$10$svKmKEZ24SWzc8n4.6rFqO7uzttDZUgoYhNP0SVk9CzGtIB239nGy', 'user', '2023-10-19 04:10:15', '2023-10-19 04:10:15', 'aa@gg.c'),
(27, 'aa', 'aa12', '$2b$10$RMn.L9PsBgLEtZ79YQxHR.aHDQhpEZLBp60DHlBx4pH5/0EzQ6eOO', 'user', '2023-10-19 04:12:31', '2023-10-19 04:12:31', 'aa@bb.com'),
(28, 'aa', 'aa12', '$2b$10$EUXLizu47wS5zbqmodOVWu/Gp.a6480XU3hVhO86Rr9wjKjcYQaeq', 'user', '2023-10-19 04:12:41', '2023-10-19 04:12:41', 'aa@bb.ccccc'),
(39, 'aa', 'aa', '$2b$10$vPxt3xbstfYpFrrLuVOkgeeLbRjE9m2RdpS/1bo0H/cnpCY6kbo7K', 'admin', '2023-10-26 09:38:14', '2023-10-26 09:38:14', 'aa@ss.cc'),
(40, 'user', 'user', '$2b$10$5BcQRK9s1cRUmXoPiNDe2uKksHiCCLF6wtYu6m3i74/IzmSnUa7d.', 'user', '2023-10-26 12:33:09', '2023-10-26 12:33:09', 'aa@ww.xx'),
(42, 'dariadmin', 'dari admin', '$2b$10$MGMguSixs/ui7ImrGtzxRug9ZSEPx0II3xQn5sBYJhXdTHK0St7FW', 'user', '2023-10-26 15:37:59', '2023-10-26 15:37:59', 'min@ss.cc'),
(43, 'modal', 'modal', '$2b$10$827/dn3yoHWewvo1rlAZ5.rl3io2Kl/f8D95EP2jun65yM/2YxcJW', 'user', '2023-10-27 02:04:57', '2023-10-27 02:04:57', 'modal@ss.cc'),
(44, 'darimodal ', 'modal', '$2b$10$Bi2UI6kyPqWsTGMokohhEeC381MpXgV1ZK8et3ldj8QlVTUTx9BzG', 'user', '2023-10-27 02:28:02', '2023-10-27 02:28:02', 'modal@dd.cc'),
(46, 'refresh', 'refresh', '$2b$10$aX9mWgnTIFuv71XvmA./AOgNCuKoxsbH2/gj5gRL6LM4IrMvRXj7e', 'user', '2023-10-27 04:03:31', '2023-10-27 04:03:31', 'refresh@ss.cc'),
(48, 'modal', 'modal', '$2b$10$ShiySmwvdpSWUjigTmrTAOA3ByDKQPT43r3jOwrkSWLW8fH.OxQ92', 'user', '2023-10-27 10:39:01', '2023-10-27 10:39:01', 'modal@cc.dd');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
