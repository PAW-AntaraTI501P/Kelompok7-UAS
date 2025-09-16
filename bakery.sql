-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Sep 2025 pada 04.51
-- Versi server: 8.4.3
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bakery`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `status` enum('finish','process') NOT NULL,
  `tanggal` timestamp NOT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `bukti_bayar` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`id`, `status`, `tanggal`, `total_harga`, `bukti_bayar`, `user_id`) VALUES
(2, 'finish', '2025-09-12 02:01:41', 40000.00, 'buktiBayar-1757642501462-703683226.jpg', 7),
(3, 'finish', '2025-09-13 08:55:02', 40000.00, 'buktiBayar-1757753702615-870366655.png', 7),
(5, 'finish', '2025-09-14 13:02:27', 26000.00, 'buktiBayar-1757854947392-872122970.jpg', 7),
(6, 'finish', '2025-09-16 01:36:20', 137000.00, 'buktiBayar-1757986579996-724569056.jpeg', 13),
(7, 'finish', '2025-09-16 01:37:15', 75000.00, 'buktiBayar-1757986635627-957929122.jpeg', 12),
(8, 'finish', '2025-09-16 01:39:09', 130000.00, 'buktiBayar-1757986749536-130407027.png', 14),
(9, 'finish', '2025-09-16 01:50:39', 160000.00, 'buktiBayar-1757987439706-727864667.png', 13),
(10, 'finish', '2025-09-16 02:13:39', 20000.00, 'buktiBayar-1757988819884-309034948.jpeg', 12),
(11, 'finish', '2025-09-16 02:17:43', 20000.00, 'buktiBayar-1757989063295-442741685.jpeg', 12),
(12, 'process', '2025-09-16 02:27:01', 15000.00, 'buktiBayar-1757989621910-89053002.png', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_item`
--

CREATE TABLE `order_item` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `subtotal` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `order_item`
--

INSERT INTO `order_item` (`id`, `order_id`, `product_id`, `qty`, `subtotal`) VALUES
(3, 2, 8, 1, 25000),
(4, 2, 10, 1, 15000),
(5, 3, 2, 1, 20000),
(6, 3, 4, 1, 20000),
(8, 5, 5, 2, 26000),
(9, 6, 8, 1, 25000),
(10, 6, 15, 1, 28000),
(11, 6, 18, 1, 20000),
(12, 6, 19, 1, 28000),
(13, 6, 21, 2, 36000),
(14, 7, 13, 1, 75000),
(15, 8, 7, 1, 15000),
(16, 8, 8, 1, 25000),
(17, 8, 10, 1, 15000),
(18, 8, 13, 1, 75000),
(19, 9, 4, 3, 60000),
(20, 9, 8, 3, 75000),
(21, 9, 16, 1, 25000),
(22, 10, 2, 1, 20000),
(23, 11, 2, 1, 20000),
(24, 12, 7, 1, 15000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `namaProduct` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `stok` int NOT NULL,
  `kategori` enum('cake','pastry','bread','cookies') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `namaProduct`, `price`, `description`, `image`, `stok`, `kategori`) VALUES
(2, 'Blueberry Cake', 20000, 'A delectable slice of blueberry cheesecake, featuring a rich, creamy filling topped with a glistening swirl of tangy blueberry sauce, rests upon a buttery graham cracker crust.', 'product-1757642572172-161833670.jpg', 0, 'cake'),
(4, 'Tiramisu Chocolate Cake', 20000, 'A luxurious dessert that artfully layers a rich chocolate cake, coffee-soaked for an authentic kick, with a light and creamy mascarpone filling, all finished with a dusting of fine cocoa powder.', 'product-1757642582968-460080732.jpg', 0, 'cake'),
(5, 'Croissant', 13000, 'A croissant is a buttery, flaky French pastry characterized by its iconic crescent shape and a delicate, layered texture that is both crisp on the outside and soft on the inside.', 'product-1757642589898-323350675.jpg', 18, 'pastry'),
(6, 'Ham-Burger', 15000, 'A **hamburger** is a popular sandwich featuring a cooked patty of ground meat, typically beef, served inside a sliced bun with various toppings and condiments.', 'product-1757642596052-163220055.jpg', 8, 'bread'),
(7, 'Bungeoppang', 15000, 'Bungeoppang is a popular Korean street food, a fish-shaped pastry with a crispy, waffle-like exterior and a sweet filling of red bean paste.', 'product-1757642604281-364891547.jpg', 8, 'bread'),
(8, 'Cinnamon Roll', 25000, 'A cinnamon roll is a sweet, coiled pastry made from yeast dough, generously filled with a cinnamon and sugar mixture, and typically topped with a sweet glaze or cream cheese frosting.', 'product-1757642613646-930239869.jpg', 5, 'pastry'),
(9, 'Soft Bakes Cookies', 15000, 'Sink your teeth into pure bliss with our irresistibly soft and chewy cookies.', 'product-1757642638492-79577762.jpg', 10, 'cookies'),
(10, 'Redvelvet Cookies', 15000, 'Indulge in a decadent treat with our rich, crimson-hued Red Velvet Cookies, featuring a hint of cocoa and creamy white chocolate chips in every soft bite.', 'product-1757642649701-232007117.jpg', 9, 'cookies'),
(11, 'Sourdough Bread', 45000, 'Asli prancis, fresh from the oven', 'product-1757641097125-647275653.jpg', 5, 'bread'),
(12, 'Birthday Cake', 85000, 'A beautifully simple white cake, topped with plump, red strawberries and a single golden candle, stands ready for a cozy celebration.', 'product-1757754389184-345694078.jpg', 0, 'cake'),
(13, 'Strawberry Birthday Cake', 75000, 'Asli prancis, fresh from the oven', 'product-1757754728692-135397361.jpg', 0, 'cake'),
(14, 'Love Birthday Cake', 75000, 'A sweet, heart-shaped pink cake with a subtly textured frosting is lovingly inscribed with \"happy birthday my love\" in white icing.', 'product-1757754873145-949314449.jpg', 2, 'cake'),
(15, 'Cherry Pie', 28000, 'A slice of cherry pie offers a buttery crust filled with sweet-tart cherries in every bite', 'product-1757841557342-692614138.jpg', 3, 'pastry'),
(16, 'Blueberry Pancake', 25000, 'Pancake with blueberry on the top', 'product-1757845002910-445560204.jpg', 4, 'cake'),
(17, 'Vanila Cupcake', 7000, 'Cupcake with vanila cream', 'product-1757845120095-18928891.jpg', 20, 'cake'),
(18, 'Pretzel', 20000, 'The perfect saltiness in your mouth', 'product-1757845220561-491996770.jpg', 4, 'bread'),
(19, 'Focaccia', 28000, 'Focaccia – fluffy Italian flatbread drizzled with olive oil, herbs, and pure happiness.', 'product-1757869269198-77979638.jpg', 4, 'bread'),
(20, 'Pistachio Cookies', 18000, 'Pistachio cookies – buttery, nutty, and irresistibly crunchy with every bite.', 'product-1757869413020-634490991.jpg', 10, 'cookies'),
(21, 'Nutella Stuffed Cookies', 18000, 'Nutella cookies – soft, gooey, and filled with rich chocolate-hazelnut goodness.', 'product-1757869517098-795076785.jpg', 8, 'cookies'),
(22, 'Oatmeal Raisin Cookies', 18000, 'Oatmeal raisin cookies – chewy, wholesome, and naturally sweet with juicy raisins.', 'product-1757869597207-354754829.jpg', 10, 'cookies'),
(23, 'Strawberry Danish Pastry', 20000, 'Strawberry Danish pastry – buttery, flaky layers topped with luscious cream and sweet, juicy strawberries.', 'product-1757869753303-456487166.jpg', 10, 'pastry'),
(25, 'Plain Bagel', 15000, 'Soft, chewy, and golden-baked to perfection. A classic bagel with a simple taste that pairs well with any spread or topping.', 'product-1757987852735-987350498.jpg', 20, 'bread'),
(26, 'tambah data', 20000, 'ppp', 'product-1757988979311-134636559.png', 20, 'pastry');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `passwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('cust','admin') NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `passwd`, `email`, `role`, `image`) VALUES
(1, 'uls uls', 'uls123', 'uls123', 'uls@gmail.com', 'cust', NULL),
(5, 'ulul ulul', 'ulsss', '$2b$10$MUatcStzLwZ2vTQyI6EAMOLNoFsJEOspOP5jdWybUYbHvaVMNafrq', 'ulsulul@gmail.com', 'cust', NULL),
(6, 'lulu luthfiah', 'lulultfh', '$2b$10$wPpd3xh5.S0NU0fg/P4mKuAs4Xj.X5CEvnENR37vMAF/qTBOx68bC', 'lululuthfiah@gmail.com', 'cust', NULL),
(7, 'Lulu', 'luluaja', '$2b$10$DOop3B.U7w75FxHuELTe8.LbTCYJakvjduw0GZhU5TrRdHyUEwMyS', 'luluaja@gmail.com', 'cust', 'profileImage-1757986961672-906864266.jpg'),
(8, 'Admin', 'admin', 'admin123', 'admin@gmail.com', 'admin', NULL),
(9, 'Admin1', 'admin_', '$2b$10$RYkjVx5qnZgpI6/aNCY4eeS68ll3JMmsfEFG7jmLpBaxx0uaWC.rq', 'admin1@admin.com', 'admin', NULL),
(12, 'nanta', 'nanta', '$2b$10$dH0M8A3W6W/w27gDUfCXXuJk1m4DbmgcvgC8g/RYMBTB.2fAJH3GG', 'nanta@gmail.com', 'cust', 'profileImage-1757988871075-135103889.jpg'),
(13, 'piscok', 'piscokcok', '$2b$10$YkpgjJDYxn4CM6nc0o3AmO2JwNJnDQ3e4Bvppe2Iup3dDI0OI8ZCm', 'piscok@gmail.com', 'cust', 'profileImage-1757986976693-61668990.jpg'),
(14, 'husna', 'husna', '$2b$10$ZyGYhMqxybtYQQHAEWKj.uaY9nQ4OCu1u48LaA56eAmUTUTi8Xkea', 'husna@example.com', 'cust', 'profileImage-1757986851178-110128138.png'),
(15, 'azizah', 'azizadmin', '$2b$10$DcIyt06fpIP5y087f08T9u4Mq.aPXnRwua8mrUPKlWvJ9TQfUNqaO', 'azizadmin@gmail.com', 'admin', NULL),
(16, 'nanta', 'nanta1', '$2b$10$upGzIQ4wbPhOJ97osGOdFu2wkCjoWoA8m3N1vJRivfbzA24r9tYy6', 'nano@gmail.com', 'admin', NULL),
(17, 'husnadmin', 'husnadmin', '$2b$10$rCQO5IB9wwMZnfU8OdMK5epqe0qy4g3gWkfvwn6LMxAp8gwJDbPsq', 'husnadmin@example.com', 'admin', NULL),
(18, 'husna k', 'husnaaaa', '$2b$10$86uvyiLM8PjFvGoRuu63GeykVGqbj1RntqXyJoHXVi8VNBZjH3aPK', 'husnakamila333@gmail.com', 'cust', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_user` (`user_id`);

--
-- Indeks untuk tabel `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order` (`order_id`),
  ADD KEY `fk_product` (`product_id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
