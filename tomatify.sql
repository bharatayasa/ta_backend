-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 28 Nov 2023 pada 18.14
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
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `savepredict`
--

INSERT INTO `savepredict` (`id`, `kelas`, `confidence`, `description`, `prevention`, `userId`, `created_at`, `status`) VALUES
(65, 'septoria leaf spot', 12.90, 'Penyakit Septoria Leaf Spot disebabkan oleh infeksi jamur Septoria lycopersici. Gejala khasnya adalah timbulnya lesi awal berbentuk bintik-bintik kecil yang di keadaan lembab, yang pada tahap selanjutnya berkembang menjadi bintik-bintik yang berbentuk lingkaran dengan diameter sekitar 1/8 inci', 'Pencegahan penyakit Septoria Leaf Spot dapat dilakukan melalui tindakan-tindakan berikut. Pertama, mempertahankan jarak yang memadai antara tanaman tomat untuk memfasilitasi pengeringan daun yang lebih cepat. Selanjutnya, penyiraman pangkal tanaman tomat sebaiknya dilakukan pada waktu pagi guna mengurangi kelembaban dan potensi daun yang basah. Penting untuk menghindari perawatan tanaman tomat ketika daunnya dalam kondisi basah, karena tindakan ini dapat meminimalkan risiko penyebaran mikroorganisme penyebab penyakit', 83, '2023-11-01', 'nonaktif'),
(87, 'leaf mold', 60.21, 'Penyakit jamur daun tomat, yang juga dikenal sebagai leaf mold, merupakan penyakit yang sering ditemukan pada tanaman tomat. Kejadian penyakit ini umumnya terkait dengan lingkungan yang memiliki suhu tinggi dan kelembaban tinggi, kondisi yang mendukung penyebaran penyakit dan pertumbuhan patogen dengan cepat. Penyakit ini disebabkan oleh patogen Cladosporium fulvum (C. fulvum)', 'Langkah - langkah yang dapat diterapkan dalam budidaya tanaman tomat untuk mengatasi penyakit leaf mold melibatkan serangkaian tindakan. Pertama, daun yang telah terinfeksi harus diidentifikasi dan dipotong, lalu daun-daun tersebut harus dibuang dengan jarak yang cukup jauh dari area pertanian untuk menghindari penularan penyakit. Selanjutnya, dapat digunakan fungisida organik, seperti ekstrak bawang putih, yang memiliki kemampuan dalam mengendalikan populasi jamur. Pemberian pupuk harus dilakukan sesuai dengan dosis yang telah ditetapkan dalam pedoman budidaya tanaman tomat, untuk memastikan pertumbuhan tanaman yang sehat dan kuat dalam menghadapi tekanan penyakit', 83, '2023-11-02', 'aktif'),
(92, 'bacterial spot', 10.97, 'Penyakit bacterial spot terjadi akibat infeksi oleh empat spesies bakteri dari genus Xanthomonas. Manifestasi awal penyakit ini adalah munculnya lesi berukuran kecil yang berwarna kuning pada daun muda, yang selanjutnya mengalami perkembangan menjadi lesi basah dan memiliki sifat berminyak pada daun yang sudah lebih tua, ditandai dengan perubahan warna menjadi cokelat hingga merah kecoklatan', 'Melakukan penanaman dengan bibit yang bebas penyakit merupakan hal yang penting dalam upaya pengendalian penyakit bakteri, sebab bakteri dapat dengan mudah berpindah ke bibit tanaman melalui benih yang terkontaminasi. Disarankan untuk mengurangi aktivitas penanganan tanaman, seperti pemangkasan dan pengikatan, pada tingkat yang minimal karena luka yang terbentuk akibat penanganan tersebut memberikan akses bagi bakteri untuk masuk ke dalam sistem tanaman', 83, '2023-11-03', 'nonaktif'),
(93, 'bacterial spot', 10.97, 'Penyakit bacterial spot terjadi akibat infeksi oleh empat spesies bakteri dari genus Xanthomonas. Manifestasi awal penyakit ini adalah munculnya lesi berukuran kecil yang berwarna kuning pada daun muda, yang selanjutnya mengalami perkembangan menjadi lesi basah dan memiliki sifat berminyak pada daun yang sudah lebih tua, ditandai dengan perubahan warna menjadi cokelat hingga merah kecoklatan', 'Melakukan penanaman dengan bibit yang bebas penyakit merupakan hal yang penting dalam upaya pengendalian penyakit bakteri, sebab bakteri dapat dengan mudah berpindah ke bibit tanaman melalui benih yang terkontaminasi. Disarankan untuk mengurangi aktivitas penanganan tanaman, seperti pemangkasan dan pengikatan, pada tingkat yang minimal karena luka yang terbentuk akibat penanganan tersebut memberikan akses bagi bakteri untuk masuk ke dalam sistem tanaman', 60, '2023-11-03', 'aktif'),
(98, 'healthy', 45.48, 'Tanaman tomat yang dalam keadaan sehat atau Healthy dicirikan oleh daun yang memiliki tekstur lembut, berwarna hijau dengan intensitas warna yang berada dalam rentang dari hijau sedang hingga gelap, serta memiliki batang yang kuat dan kokoh', 'Tanaman tomat yang sehat atau Healthy membutuhkan makronutrien seperti nitrogen, fosfor, dan kalium, dan mikronutrien seperti magnesium, kalsium, dan seng', 61, '2023-11-04', 'nonaktif'),
(110, 'leaf mold', 9.88, 'Penyakit jamur daun tomat, yang juga dikenal sebagai leaf mold, merupakan penyakit yang sering ditemukan pada tanaman tomat. Kejadian penyakit ini umumnya terkait dengan lingkungan yang memiliki suhu tinggi dan kelembaban tinggi, kondisi yang mendukung penyebaran penyakit dan pertumbuhan patogen dengan cepat. Penyakit ini disebabkan oleh patogen Cladosporium fulvum (C. fulvum)', 'Langkah - langkah yang dapat diterapkan dalam budidaya tanaman tomat untuk mengatasi penyakit leaf mold melibatkan serangkaian tindakan. Pertama, daun yang telah terinfeksi harus diidentifikasi dan dipotong, lalu daun-daun tersebut harus dibuang dengan jarak yang cukup jauh dari area pertanian untuk menghindari penularan penyakit. Selanjutnya, dapat digunakan fungisida organik, seperti ekstrak bawang putih, yang memiliki kemampuan dalam mengendalikan populasi jamur. Pemberian pupuk harus dilakukan sesuai dengan dosis yang telah ditetapkan dalam pedoman budidaya tanaman tomat, untuk memastikan pertumbuhan tanaman yang sehat dan kuat dalam menghadapi tekanan penyakit', 67, '2023-11-07', 'aktif'),
(156, 'bacterial spot', 10.97, 'Penyakit bacterial spot terjadi akibat infeksi oleh empat spesies bakteri dari genus Xanthomonas. Manifestasi awal penyakit ini adalah munculnya lesi berukuran kecil yang berwarna kuning pada daun muda, yang selanjutnya mengalami perkembangan menjadi lesi basah dan memiliki sifat berminyak pada daun yang sudah lebih tua, ditandai dengan perubahan warna menjadi cokelat hingga merah kecoklatan', 'Melakukan penanaman dengan bibit yang bebas penyakit merupakan hal yang penting dalam upaya pengendalian penyakit bakteri, sebab bakteri dapat dengan mudah berpindah ke bibit tanaman melalui benih yang terkontaminasi. Disarankan untuk mengurangi aktivitas penanganan tanaman, seperti pemangkasan dan pengikatan, pada tingkat yang minimal karena luka yang terbentuk akibat penanganan tersebut memberikan akses bagi bakteri untuk masuk ke dalam sistem tanaman', 60, '2023-11-09', 'nonaktif'),
(185, 'septoria leaf spot', 9.83, 'Penyakit Septoria Leaf Spot disebabkan oleh infeksi jamur Septoria lycopersici. Gejala khasnya adalah timbulnya lesi awal berbentuk bintik-bintik kecil yang di keadaan lembab, yang pada tahap selanjutnya berkembang menjadi bintik-bintik yang berbentuk lingkaran dengan diameter sekitar 1/8 inci', 'Pencegahan penyakit Septoria Leaf Spot dapat dilakukan melalui tindakan-tindakan berikut. Pertama, mempertahankan jarak yang memadai antara tanaman tomat untuk memfasilitasi pengeringan daun yang lebih cepat. Selanjutnya, penyiraman pangkal tanaman tomat sebaiknya dilakukan pada waktu pagi guna mengurangi kelembaban dan potensi daun yang basah. Penting untuk menghindari perawatan tanaman tomat ketika daunnya dalam kondisi basah, karena tindakan ini dapat meminimalkan risiko penyebaran mikroorganisme penyebab penyakit', 125, '2023-11-13', 'aktif'),
(192, 'healthy', 45.48, 'Tanaman tomat yang dalam keadaan sehat atau Healthy dicirikan oleh daun yang memiliki tekstur lembut, berwarna hijau dengan intensitas warna yang berada dalam rentang dari hijau sedang hingga gelap, serta memiliki batang yang kuat dan kokoh', 'Tanaman tomat yang sehat atau Healthy membutuhkan makronutrien seperti nitrogen, fosfor, dan kalium, dan mikronutrien seperti magnesium, kalsium, dan seng', 126, '2023-11-14', 'aktif'),
(202, 'yellow leaf curl', 47.22, 'Ciri khas pada tanaman yang mengalami infeksi penyakit Yellow leaf curl adalah adanya gejala seperti stunting (pertumbuhan terhambat), klorosis daun yang melengkung ke arah atas, pengurangan ukuran daun, dan penurunan hasil produksi tomat. Penyakit ini disebarkan dari satu tanaman ke tanaman lainnya melalui serangga', 'Penyakit Yellow Leaf Curl dapat ditekan melalui metode pengendalian kimia. Setelah terjangkit oleh virus, tidak ada pengobatan yang efektif untuk infeksi tersebut, oleh karena itu, untuk mengelola populasi serangga yang berpotensi menyebarkan virus, digunakan insektisida dari keluarga piretroid. Insektisida ini dapat diterapkan sebagai pembasmi tanah atau semprotan selama tahap pembibitan tanaman untuk mengurangi populasi serangga yang berpotensi menyebabkan penyebaran virus', 125, '2023-11-14', 'aktif'),
(203, 'yellow leaf curl', 10.22, 'Ciri khas pada tanaman yang mengalami infeksi penyakit Yellow leaf curl adalah adanya gejala seperti stunting (pertumbuhan terhambat), klorosis daun yang melengkung ke arah atas, pengurangan ukuran daun, dan penurunan hasil produksi tomat. Penyakit ini disebarkan dari satu tanaman ke tanaman lainnya melalui serangga', 'Penyakit Yellow Leaf Curl dapat ditekan melalui metode pengendalian kimia. Setelah terjangkit oleh virus, tidak ada pengobatan yang efektif untuk infeksi tersebut, oleh karena itu, untuk mengelola populasi serangga yang berpotensi menyebarkan virus, digunakan insektisida dari keluarga piretroid. Insektisida ini dapat diterapkan sebagai pembasmi tanah atau semprotan selama tahap pembibitan tanaman untuk mengurangi populasi serangga yang berpotensi menyebabkan penyebaran virus', 126, '2023-11-14', 'aktif'),
(237, 'leaf mold', 33.85, 'Penyakit jamur daun tomat, yang juga dikenal sebagai leaf mold, merupakan penyakit yang sering ditemukan pada tanaman tomat. Kejadian penyakit ini umumnya terkait dengan lingkungan yang memiliki suhu tinggi dan kelembaban tinggi, kondisi yang mendukung penyebaran penyakit dan pertumbuhan patogen dengan cepat. Penyakit ini disebabkan oleh patogen Cladosporium fulvum (C. fulvum)', 'Langkah - langkah yang dapat diterapkan dalam budidaya tanaman tomat untuk mengatasi penyakit leaf mold melibatkan serangkaian tindakan. Pertama, daun yang telah terinfeksi harus diidentifikasi dan dipotong, lalu daun-daun tersebut harus dibuang dengan jarak yang cukup jauh dari area pertanian untuk menghindari penularan penyakit. Selanjutnya, dapat digunakan fungisida organik, seperti ekstrak bawang putih, yang memiliki kemampuan dalam mengendalikan populasi jamur. Pemberian pupuk harus dilakukan sesuai dengan dosis yang telah ditetapkan dalam pedoman budidaya tanaman tomat, untuk memastikan pertumbuhan tanaman yang sehat dan kuat dalam menghadapi tekanan penyakit', 126, '2023-11-15', 'aktif'),
(245, 'leaf mold', 60.21, 'Penyakit jamur daun tomat, yang juga dikenal sebagai leaf mold, merupakan penyakit yang sering ditemukan pada tanaman tomat. Kejadian penyakit ini umumnya terkait dengan lingkungan yang memiliki suhu tinggi dan kelembaban tinggi, kondisi yang mendukung penyebaran penyakit dan pertumbuhan patogen dengan cepat. Penyakit ini disebabkan oleh patogen Cladosporium fulvum (C. fulvum)', 'Langkah - langkah yang dapat diterapkan dalam budidaya tanaman tomat untuk mengatasi penyakit leaf mold melibatkan serangkaian tindakan. Pertama, daun yang telah terinfeksi harus diidentifikasi dan dipotong, lalu daun-daun tersebut harus dibuang dengan jarak yang cukup jauh dari area pertanian untuk menghindari penularan penyakit. Selanjutnya, dapat digunakan fungisida organik, seperti ekstrak bawang putih, yang memiliki kemampuan dalam mengendalikan populasi jamur. Pemberian pupuk harus dilakukan sesuai dengan dosis yang telah ditetapkan dalam pedoman budidaya tanaman tomat, untuk memastikan pertumbuhan tanaman yang sehat dan kuat dalam menghadapi tekanan penyakit', 126, '2023-11-16', 'aktif'),
(250, 'leaf mold', 60.21, 'Penyakit jamur daun tomat, yang juga dikenal sebagai leaf mold, merupakan penyakit yang sering ditemukan pada tanaman tomat. Kejadian penyakit ini umumnya terkait dengan lingkungan yang memiliki suhu tinggi dan kelembaban tinggi, kondisi yang mendukung penyebaran penyakit dan pertumbuhan patogen dengan cepat. Penyakit ini disebabkan oleh patogen Cladosporium fulvum (C. fulvum)', 'Langkah - langkah yang dapat diterapkan dalam budidaya tanaman tomat untuk mengatasi penyakit leaf mold melibatkan serangkaian tindakan. Pertama, daun yang telah terinfeksi harus diidentifikasi dan dipotong, lalu daun-daun tersebut harus dibuang dengan jarak yang cukup jauh dari area pertanian untuk menghindari penularan penyakit. Selanjutnya, dapat digunakan fungisida organik, seperti ekstrak bawang putih, yang memiliki kemampuan dalam mengendalikan populasi jamur. Pemberian pupuk harus dilakukan sesuai dengan dosis yang telah ditetapkan dalam pedoman budidaya tanaman tomat, untuk memastikan pertumbuhan tanaman yang sehat dan kuat dalam menghadapi tekanan penyakit', 60, '2023-11-16', 'aktif'),
(251, 'healthy', 38.61, 'Tanaman tomat yang dalam keadaan sehat atau Healthy dicirikan oleh daun yang memiliki tekstur lembut, berwarna hijau dengan intensitas warna yang berada dalam rentang dari hijau sedang hingga gelap, serta memiliki batang yang kuat dan kokoh', 'Tanaman tomat yang sehat atau Healthy membutuhkan makronutrien seperti nitrogen, fosfor, dan kalium, dan mikronutrien seperti magnesium, kalsium, dan seng', 61, '2023-11-16', 'aktif'),
(253, 'leaf mold', 40.45, 'Penyakit jamur daun tomat, yang juga dikenal sebagai leaf mold, merupakan penyakit yang sering ditemukan pada tanaman tomat. Kejadian penyakit ini umumnya terkait dengan lingkungan yang memiliki suhu tinggi dan kelembaban tinggi, kondisi yang mendukung penyebaran penyakit dan pertumbuhan patogen dengan cepat. Penyakit ini disebabkan oleh patogen Cladosporium fulvum (C. fulvum)', 'Langkah - langkah yang dapat diterapkan dalam budidaya tanaman tomat untuk mengatasi penyakit leaf mold melibatkan serangkaian tindakan. Pertama, daun yang telah terinfeksi harus diidentifikasi dan dipotong, lalu daun-daun tersebut harus dibuang dengan jarak yang cukup jauh dari area pertanian untuk menghindari penularan penyakit. Selanjutnya, dapat digunakan fungisida organik, seperti ekstrak bawang putih, yang memiliki kemampuan dalam mengendalikan populasi jamur. Pemberian pupuk harus dilakukan sesuai dengan dosis yang telah ditetapkan dalam pedoman budidaya tanaman tomat, untuk memastikan pertumbuhan tanaman yang sehat dan kuat dalam menghadapi tekanan penyakit', 126, '2023-11-16', 'aktif'),
(260, 'late blight', 85.11, 'Penyakit late blight, juga dikenal sebagai penyakit busuk daun, merupakan salah satu penyakit yang paling merusak pada tanaman tomat yang disebabkan oleh agen patogen bernama Phytophthora infestans (Mont.)', 'Pengendalian penyakit busuk daun dalam konteks budidaya tomat melibatkan sejumlah praktik pertanian dan tindakan pengendalian. Hal ini mencakup implementasi rotasi tanaman dan masa bera (periode tanah tidak ditanami), eliminasi tanaman tomat yang telah terinfeksi penyakit busuk daun, dan penghindaran produk tomat yang telah terkontaminasi. Selain itu, aplikasi fungisida juga merupakan metode umum untuk mengurangi perkembangan penyakit ini', 126, '2023-11-17', 'aktif'),
(271, 'mosaic virus', 6.96, 'Mosaic Virus merupakan jenis virus tumbuhan yang memiliki kemampuan penyebaran yang sangat tinggi. Virus ini memiliki potensi untuk menginfeksi tanaman tomat, baik yang tumbuh di dalam rumah kaca maupun di lingkungan terbuka. Efek dari infeksi Mosaic virus termasuk terjadinya perubahan warna daun menjadi belang hijau pada daun yang masih muda maupun daun yang sudah tua, pertumbuhan tanaman yang terhambat, dan terkadang distorsi pada bentuk daun', 'Untuk mencegah Mosaic Virus, disarankan untuk mengadopsi beberapa tindakan pencegahan yang disarankan. Pertama, pemilihan bibit yang berasal dari tanaman yang sehat dan tidak pernah terjangkit virus adalah langkah penting. Jika tanaman sudah terinfeksi mosaic virus, tindakan isolasi dapat diterapkan dengan mengelilinginya menggunakan kantong plastik yang diisi dengan pupuk kompos. Selain itu, tindakan isolasi juga dapat dilakukan dengan menjaga jarak fisik yang cukup jauh antara tanaman tomat yang terinfeksi dan tanaman tomat lainnya untuk meminimalkan risiko penularan virus', 139, '2023-11-19', 'aktif'),
(273, 'leaf mold', 97.57, 'Penyakit jamur daun tomat, yang juga dikenal sebagai leaf mold, merupakan penyakit yang sering ditemukan pada tanaman tomat. Kejadian penyakit ini umumnya terkait dengan lingkungan yang memiliki suhu tinggi dan kelembaban tinggi, kondisi yang mendukung penyebaran penyakit dan pertumbuhan patogen dengan cepat. Penyakit ini disebabkan oleh patogen Cladosporium fulvum (C. fulvum)', 'Langkah - langkah yang dapat diterapkan dalam budidaya tanaman tomat untuk mengatasi penyakit leaf mold melibatkan serangkaian tindakan. Pertama, daun yang telah terinfeksi harus diidentifikasi dan dipotong, lalu daun-daun tersebut harus dibuang dengan jarak yang cukup jauh dari area pertanian untuk menghindari penularan penyakit. Selanjutnya, dapat digunakan fungisida organik, seperti ekstrak bawang putih, yang memiliki kemampuan dalam mengendalikan populasi jamur. Pemberian pupuk harus dilakukan sesuai dengan dosis yang telah ditetapkan dalam pedoman budidaya tanaman tomat, untuk memastikan pertumbuhan tanaman yang sehat dan kuat dalam menghadapi tekanan penyakit', 126, '2023-11-19', 'aktif'),
(278, 'leaf mold', 40.45, 'Penyakit jamur daun tomat, yang juga dikenal sebagai leaf mold, merupakan penyakit yang sering ditemukan pada tanaman tomat. Kejadian penyakit ini umumnya terkait dengan lingkungan yang memiliki suhu tinggi dan kelembaban tinggi, kondisi yang mendukung penyebaran penyakit dan pertumbuhan patogen dengan cepat. Penyakit ini disebabkan oleh patogen Cladosporium fulvum (C. fulvum)', 'Langkah - langkah yang dapat diterapkan dalam budidaya tanaman tomat untuk mengatasi penyakit leaf mold melibatkan serangkaian tindakan. Pertama, daun yang telah terinfeksi harus diidentifikasi dan dipotong, lalu daun-daun tersebut harus dibuang dengan jarak yang cukup jauh dari area pertanian untuk menghindari penularan penyakit. Selanjutnya, dapat digunakan fungisida organik, seperti ekstrak bawang putih, yang memiliki kemampuan dalam mengendalikan populasi jamur. Pemberian pupuk harus dilakukan sesuai dengan dosis yang telah ditetapkan dalam pedoman budidaya tanaman tomat, untuk memastikan pertumbuhan tanaman yang sehat dan kuat dalam menghadapi tekanan penyakit', 139, '2023-11-20', 'aktif'),
(280, 'healthy', 30.20, 'Tanaman tomat yang dalam keadaan sehat atau Healthy dicirikan oleh daun yang memiliki tekstur lembut, berwarna hijau dengan intensitas warna yang berada dalam rentang dari hijau sedang hingga gelap, serta memiliki batang yang kuat dan kokoh', 'Tanaman tomat yang sehat atau Healthy membutuhkan makronutrien seperti nitrogen, fosfor, dan kalium, dan mikronutrien seperti magnesium, kalsium, dan seng', 139, '2023-11-20', 'aktif'),
(282, 'yellow leaf curl', 34.76, 'Ciri khas pada tanaman yang mengalami infeksi penyakit Yellow leaf curl adalah adanya gejala seperti stunting (pertumbuhan terhambat), klorosis daun yang melengkung ke arah atas, pengurangan ukuran daun, dan penurunan hasil produksi tomat. Penyakit ini disebarkan dari satu tanaman ke tanaman lainnya melalui serangga', 'Penyakit Yellow Leaf Curl dapat ditekan melalui metode pengendalian kimia. Setelah terjangkit oleh virus, tidak ada pengobatan yang efektif untuk infeksi tersebut, oleh karena itu, untuk mengelola populasi serangga yang berpotensi menyebarkan virus, digunakan insektisida dari keluarga piretroid. Insektisida ini dapat diterapkan sebagai pembasmi tanah atau semprotan selama tahap pembibitan tanaman untuk mengurangi populasi serangga yang berpotensi menyebabkan penyebaran virus', 126, '2023-11-21', 'nonaktif'),
(294, 'leaf mold', 9.88, 'Penyakit jamur daun tomat, yang juga dikenal sebagai leaf mold, merupakan penyakit yang sering ditemukan pada tanaman tomat. Kejadian penyakit ini umumnya terkait dengan lingkungan yang memiliki suhu tinggi dan kelembaban tinggi, kondisi yang mendukung penyebaran penyakit dan pertumbuhan patogen dengan cepat. Penyakit ini disebabkan oleh patogen Cladosporium fulvum (C. fulvum)', 'Langkah - langkah yang dapat diterapkan dalam budidaya tanaman tomat untuk mengatasi penyakit leaf mold melibatkan serangkaian tindakan. Pertama, daun yang telah terinfeksi harus diidentifikasi dan dipotong, lalu daun-daun tersebut harus dibuang dengan jarak yang cukup jauh dari area pertanian untuk menghindari penularan penyakit. Selanjutnya, dapat digunakan fungisida organik, seperti ekstrak bawang putih, yang memiliki kemampuan dalam mengendalikan populasi jamur. Pemberian pupuk harus dilakukan sesuai dengan dosis yang telah ditetapkan dalam pedoman budidaya tanaman tomat, untuk memastikan pertumbuhan tanaman yang sehat dan kuat dalam menghadapi tekanan penyakit', 139, '2023-11-22', 'nonaktif'),
(305, 'healthy', 30.20, 'Tanaman tomat yang dalam keadaan sehat atau Healthy dicirikan oleh daun yang memiliki tekstur lembut, berwarna hijau dengan intensitas warna yang berada dalam rentang dari hijau sedang hingga gelap, serta memiliki batang yang kuat dan kokoh', 'Tanaman tomat yang sehat atau Healthy membutuhkan makronutrien seperti nitrogen, fosfor, dan kalium, dan mikronutrien seperti magnesium, kalsium, dan seng', 60, '2023-11-28', 'aktif'),
(306, 'late blight', 1.19, 'Penyakit late blight, juga dikenal sebagai penyakit busuk daun, merupakan salah satu penyakit yang paling merusak pada tanaman tomat yang disebabkan oleh agen patogen bernama Phytophthora infestans (Mont.)', 'Pengendalian penyakit busuk daun dalam konteks budidaya tomat melibatkan sejumlah praktik pertanian dan tindakan pengendalian. Hal ini mencakup implementasi rotasi tanaman dan masa bera (periode tanah tidak ditanami), eliminasi tanaman tomat yang telah terinfeksi penyakit busuk daun, dan penghindaran produk tomat yang telah terkontaminasi. Selain itu, aplikasi fungisida juga merupakan metode umum untuk mengurangi perkembangan penyakit ini', 139, '2023-11-28', 'nonaktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` enum('admin','petani') NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `role`, `created_at`, `updated_at`, `email`) VALUES
(60, 'user', 'user', '$2b$10$7Q3LJTHqoSKpYOMzR/SZNuDCs1B5y7JSR79i8bJi1eHTk.BNQOI6u', 'petani', '2023-10-29', '2023-11-28 03:46:00', 'johndoe@example.com'),
(61, 'wayan', 'wayan', '$2b$10$lpcdBzk2JEVbM.QwcGBOHuydHECHBEmNBRLUFulCnc.6KJwG1HpKG', 'petani', '2023-10-30', '2023-11-28 03:46:00', 'wayan@gmail.com'),
(63, 'nyoman', 'nyoman', '$2b$10$U0AMdW2n.2FXuGhZ/rvzoeeg.aig5DvEzwfT3Gma9uOKYVzX8z/my', 'petani', '2023-10-30', '2023-11-28 03:46:00', 'nyoman@gmail.com'),
(64, 'putu', 'putu', '$2b$10$hgxFqjBgFZJipTEPQ6JQEeoPGucfIkXDXmIOtmjSelEifqBbbwW4K', 'petani', '2023-10-30', '2023-11-28 03:46:00', 'putu@gmail.com'),
(65, 'gede', 'gede', '$2b$10$.CEQaSs0Bni3KYeTDOyiXu7isokkhY.VLsR9L2MlASw344oawRXDO', 'petani', '2023-10-30', '2023-11-28 03:46:00', 'gede@yahoo.com'),
(66, 'kadek', 'kadek', '$2b$10$A1hLEAY4rdRWC0Y2/uqQSuOeEjzPK8o4CQKIgZAnthT6mJpl6uQj6', 'petani', '2023-10-30', '2023-11-28 03:46:00', 'kadek@gmail.com'),
(67, 'komang', 'komang', '$2b$10$jt0rXEr8MG0KaKcakWCrQ.092LQoBxeI3LF8TJEE1anj/O7Vgjovy', 'petani', '2023-10-30', '2023-11-28 03:46:00', 'komang@gmail.com'),
(83, 'nengah', 'nengah', '$2b$10$BdjMx2h8t64TTr9fP1BWd.Qjs7hPniBqLJvJtJmM94mlGdKWkyTg.', 'petani', '2023-11-01', '2023-11-28 03:46:00', 'nengah@gmail.com'),
(111, 'username', 'name', '$2b$10$SVX4mdCoX0Fa4Tgj8eCWmOGadJb0wp4.bDRSCoWiqvUwc/JsXYVRO', 'petani', '2023-11-11', '2023-11-28 03:46:00', 'email@kk.ll'),
(117, 'gede', 'gede', '$2b$10$xle5OFKfl2U9AkS2Pb7Bdu4qT2P351zAQioTNJWZ4Oic7u93bRPVK', 'admin', '2023-11-11', '2023-11-11 07:41:14', 'pw@ss.gede'),
(118, 'suksma', 'suksma', '$2b$10$scpGkvT12FGQTF4UeC981uZsBQYidLe6O8VfGbBwqAGfgBo8GuCby', 'admin', '2023-11-11', '2023-11-11 07:44:39', 'tes@ss.suksma'),
(119, 'ubah', 'ubah', '$2b$10$h90RABR30HGROtkMlMk.3.R7UYokgb4j6F30iOnGl7oxhMPd8MzzC', 'admin', '2023-11-11', '2023-11-11 07:18:10', 'conf@cc.ubah'),
(120, 'regis', 'regis', '$2b$10$rxkuZ43gwT6SptYXfMuLYulPoq3DmeAhAaNwxh43pX8VxNdn5mSdu', 'petani', '2023-11-11', '2023-11-28 03:46:00', 'regis@cc.dd'),
(121, 'showpw', 'show', '$2b$10$/nPLiv1Mjc.rf01t40h8iOhzgFMMTUS3U0Bh.pyYbtxC53eJ8.4wy', 'petani', '2023-11-11', '2023-11-28 03:46:00', 'sho@ss.cc'),
(122, 'userbaru', 'baru', '$2b$10$Lh6.uLK2vwmNjRLmw.JsguMpEpgjKAJd5J8XsIN28EuT3wJxxKJLS', 'petani', '2023-11-12', '2023-11-28 03:46:00', 'baru@cc.mm'),
(125, 'made', 'made', '$2b$10$g5t5kan3L.YyDnUpmKhMD.UIt4UfZEHhZQZArlFBYPjAr68Jm77tG', 'petani', '2023-11-13', '2023-11-28 03:46:00', 'made@gmail.com'),
(126, 'ketut', 'ketut', '$2b$10$cl6fyHY4pC.x5qAmfv9GpuZfCf9pONHwll0nqHzwyGgMgoJgbxta6', 'petani', '2023-11-14', '2023-11-28 03:46:00', 'ketut@gmail.com'),
(127, 'regis', 'regis', '$2b$10$DF38vShH0RfFQrdE0c6h8e7Uz.9Wzk32n51mcpwy8v5eyDKLa.IK.', 'petani', '2023-11-14', '2023-11-28 03:46:00', 'regis@gmail.com'),
(128, 'newui', 'newui', '$2b$10$yzYd/KnbllBnobCKDt8dzOgtYX3VRvBOt4ufq5ir6R5GcP8.GMHtu', 'petani', '2023-11-15', '2023-11-28 03:46:00', 'new@gmail.com'),
(129, 'tes', 'tes', '$2b$10$JS8Rf2G2MLTJg5iqdojWR.qZWB4A7I6F4ddon.mIevV1bW.lJ4M1W', 'petani', '2023-11-16', '2023-11-28 03:46:00', 'tes@aa.su'),
(130, 'Ubah', 'ubah', '$2b$10$CsfQMPEXaYb1LdwZKP5/N.mfHdoKWi3jFwp7SE97G1oqlqHN3G0Ty', 'petani', '2023-11-16', '2023-11-28 03:46:00', 'ui@ss.ubah'),
(133, 'aa', 'aa', '$2b$10$.bkqpfHIXDTsWU5hqPTayOnORzHvzqMMew6HAQalPX0Ms7RVYbjKK', 'petani', '2023-11-18', '2023-11-28 03:46:00', 'email@gmail.com'),
(135, 'wewe', 'bb', '$2b$10$26paa0v5pAEPhepzcUynhepUSh9mM3KaUx6FO8Sgs6oyKoBX3cQHi', 'petani', '2023-11-18', '2023-11-28 03:46:00', 'ada@gmail.com'),
(137, 'upper', 'uppwer', '$2b$10$wkqLHXVuTdocxjcA8Pt3L.o.ztasLnoxx2mV0Jq6FyD0epDeDLmLm', 'petani', '2023-11-18', '2023-11-28 03:46:00', 'upper@gmial.com'),
(138, 'admin', 'admin', '$2b$10$GgSy3gwyJKlMuuqDyOhc7OV03cJb8TKWgexYmxpUdohRf0D7q4Cxm', 'admin', '2023-11-19', '2023-11-19 03:42:13', 'admin@admin.admin'),
(139, 'bhar', 'I Wayan Bharatayasa', '$2b$10$M83jD9qI8vLCe/eFU6sd3O2R1W/Bz3bVPcwJmV8aVAf8G7p/uHvqC', 'petani', '2023-11-19', '2023-11-28 03:55:07', 'bharata@gmail.com'),
(140, 'bharwww', 'bharata', '$2b$10$a6A2KRUYTo7w46q4fKMnNuCCNHhqpeCRWB8Sn7ut8qSCn1Banmooi', 'petani', '2023-11-20', '2023-11-28 03:46:00', 'email@email.email'),
(141, 'bharubah', 'ubah', '$2b$10$X9yfi5Z1wCfW3CNOhYirOOuGkJT/OvhdkCj00WUnO5wyMqRkummxa', 'petani', '2023-11-20', '2023-11-28 03:46:00', 'email@email.sss'),
(143, 'petani', 'petani', '$2b$10$c8st/yTCuIwLIMJSFq3pg.v7wueDXnBQ9ovmRhhSxPH7pKycH4OWm', 'petani', '2023-11-28', '2023-11-28 03:53:28', 'petani@gmail.com'),
(144, 'tani', 'tani', '$2b$10$qRXsqoA/w/yb7IrdDYVicexmVH3a497nWEuUAk/Wq8.iENv3ERhae', 'petani', '2023-11-28', '2023-11-28 04:01:13', 'tani@gmail.com');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

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
