-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Bulan Mei 2019 pada 14.28
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alriftec_apps`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukmpbg_lowongan`
--

CREATE TABLE `ukmpbg_lowongan` (
  `id_lowongan` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `gaji` varchar(50) NOT NULL,
  `id_ukm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ukmpbg_lowongan`
--

INSERT INTO `ukmpbg_lowongan` (`id_lowongan`, `judul`, `deskripsi`, `gaji`, `id_ukm`) VALUES
(1, 'Pembuat Kerajinan', 'Dibutuhkan seseorang yang dapat membuat kerajinan tangan dari botol bekas.', '500000', 1),
(2, 'Sales', 'Mencari seseorang yang dapat memasarkan produk ke daerah Purbalingga Kota.', '1000000', 1),
(3, 'Pembuat Kerajinan', 'Dicari seseorang yang dapat membuat kerajinan dari kardus bekas', '600000', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukmpbg_lowongan_user`
--

CREATE TABLE `ukmpbg_lowongan_user` (
  `id_lowongan_user` int(11) NOT NULL,
  `id_lowongan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukmpbg_produk`
--

CREATE TABLE `ukmpbg_produk` (
  `id_produk` int(5) NOT NULL,
  `id_ukm` int(5) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `foto_produk` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ukmpbg_produk`
--

INSERT INTO `ukmpbg_produk` (`id_produk`, `id_ukm`, `nama_produk`, `foto_produk`, `harga`, `deskripsi`) VALUES
(1, 1, 'Boneka Horta', 'https://bibitbunga.com/wp-content/uploads/2016/04/boneka-horta.jpg', 50000, 'Boneka Horta (horta, dari kata hortikultura) adalah sebuah media tanam (lho, boneka kok media tanam ya?) yang terbuat dari serbuk kayu berbentuk boneka boneka lucu yang apabila disiram setiap hari akan tumbuh rambut berupa rumput hijau pada bagian atas kepalanya.'),
(2, 1, 'Kursi Bambu', 'https://i.ytimg.com/vi/FlBcLt-oetw/hqdefault.jpg', 250000, 'Menjual kerajinan kursi dari bambu Hitam dengan harga yang murah. melayani pegiriman keseluruh kota di Indonesia dan Luar Negeri.'),
(3, 2, 'Kemoceng', 'https://s3.bukalapak.com/img/3115360913/w-1000/268285663_04056158_4768_4a47_95f3_b4e9f3c11aa8_780_780.jpg', 6000, 'Ready stock kemoceng bulu ayam warna warni. \r\npanjang bulu 33 cm, panjang keseluruhan 45 cm. size besar bukan size untuk souvenir.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukmpbg_ukm`
--

CREATE TABLE `ukmpbg_ukm` (
  `id_ukm` int(5) NOT NULL,
  `nama_ukm` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `jam_buka` time NOT NULL,
  `jam_tutup` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ukmpbg_ukm`
--

INSERT INTO `ukmpbg_ukm` (`id_ukm`, `nama_ukm`, `alamat`, `jam_buka`, `jam_tutup`) VALUES
(1, 'UKM Purbalingga 1', 'Jl. MayJend Sungkono Kecamatan Kalimanah Kabupaten Purbalingga', '08:00:00', '15:00:00'),
(2, 'UKM Purbalingga 2', 'Ds. Blater Kecamatan Kalimanah Kabupaten Purbalingga', '11:00:00', '19:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukmpbg_user`
--

CREATE TABLE `ukmpbg_user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `g_id` varchar(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ukmpbg_user`
--

INSERT INTO `ukmpbg_user` (`id_user`, `username`, `password`, `g_id`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '107744235625410417242');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ukmpbg_lowongan`
--
ALTER TABLE `ukmpbg_lowongan`
  ADD PRIMARY KEY (`id_lowongan`),
  ADD KEY `id_ukm` (`id_ukm`);

--
-- Indeks untuk tabel `ukmpbg_lowongan_user`
--
ALTER TABLE `ukmpbg_lowongan_user`
  ADD PRIMARY KEY (`id_lowongan_user`),
  ADD KEY `id_lowongan` (`id_lowongan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `ukmpbg_produk`
--
ALTER TABLE `ukmpbg_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `ukmpbg_ukm`
--
ALTER TABLE `ukmpbg_ukm`
  ADD PRIMARY KEY (`id_ukm`);

--
-- Indeks untuk tabel `ukmpbg_user`
--
ALTER TABLE `ukmpbg_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

-- AUTO_INCREMENT untuk tabel `ukmpbg_lowongan`
--
ALTER TABLE `ukmpbg_lowongan`
  MODIFY `id_lowongan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `ukmpbg_lowongan_user`
--
ALTER TABLE `ukmpbg_lowongan_user`
  MODIFY `id_lowongan_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ukmpbg_produk`
--
ALTER TABLE `ukmpbg_produk`
  MODIFY `id_produk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `ukmpbg_ukm`
--
ALTER TABLE `ukmpbg_ukm`
  MODIFY `id_ukm` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ukmpbg_user`
--
ALTER TABLE `ukmpbg_user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ukmpbg_lowongan`
--
ALTER TABLE `ukmpbg_lowongan`
  ADD CONSTRAINT `ukmpbg_lowongan_ibfk_1` FOREIGN KEY (`id_ukm`) REFERENCES `ukmpbg_ukm` (`id_ukm`);

--
-- Ketidakleluasaan untuk tabel `ukmpbg_lowongan_user`
--
ALTER TABLE `ukmpbg_lowongan_user`
  ADD CONSTRAINT `ukmpbg_lowongan_user_ibfk_1` FOREIGN KEY (`id_lowongan`) REFERENCES `ukmpbg_lowongan` (`id_lowongan`),
  ADD CONSTRAINT `ukmpbg_lowongan_user_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `ukmpbg_user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
