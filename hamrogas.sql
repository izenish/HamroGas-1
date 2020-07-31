-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2020 at 12:01 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hamrogas`
--

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('normal_user','admin','super_admin','guest') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal_user',
  `secret_key` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postby_id` int(6) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `is_verified` tinyint(1) DEFAULT 0,
  `verifiedby_id` int(6) DEFAULT 1,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_boy`
--

INSERT INTO `delivery_boy` (`id`, `name`, `username`, `email`, `password`, `user_type`, `secret_key`, `remarks`, `postby_id`, `created_at`, `is_verified`, `verifiedby_id`, `updated_at`, `status`) VALUES
(3, 'zenish prajapati', 'izenish', 'zenish77@gmail.com', 'Nepal123', 'super_admin', NULL, NULL, 1, '2020-03-14 14:01:15', 0, 1, NULL, 1),
(14, '', 'aman', 'test@yahoo.com', '202cb962ac59075b964b07152d234b70', 'normal_user', NULL, NULL, 1, '2019-07-28 14:13:58', 1, 1, '2020-03-14 19:35:02', 1),
(18, '', 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'admin', NULL, 1, '2019-07-30 16:25:01', 1, 1, '2019-07-30 22:11:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gas_cylinders`
--

CREATE TABLE `gas_cylinders` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `exc_price` smallint(6) NOT NULL,
  `new_price` smallint(6) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gas_cylinders`
--

INSERT INTO `gas_cylinders` (`id`, `title`, `content`, `author`, `featured_image`, `exc_price`, `new_price`, `stock`) VALUES
(1, 'SHREE GAS', '15L of SHREE domestic gas. Not for Commercial Use', '', 'gas3.jpg', 1350, 4000, 0),
(2, 'NEPAL GAS', '15L of NEPAL Gas domestic gas. Not for Commercial Use', '', 'gas1.jpg', 1350, 4000, 50),
(3, 'HIMAL GAS', '15L of HIMAL domestic gas. Not for Commercial Use', '', 'gas4.jpg', 1350, 4000, 5),
(4, 'BHERI GAS', '15L of BHERI domestic gas. Not for Commercial Use', '', 'gas2.jpg', 1350, 4000, 50);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `gas_name` varchar(30) NOT NULL,
  `purpose` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `gas_name`, `purpose`) VALUES
(1, 'HP GAS', 'Domestic purpose'),
(2, 'NEPAL Gas', 'Commercial purpose'),
(3, 'Sugam Gas', ''),
(4, 'Everest Gas', ''),
(5, 'Subhidha gas', '');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `cr_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `name`, `email`, `message`, `status`, `cr_date`) VALUES
(33, 'aman', 'masmas@gmail.com', 'alsfkjsk', 1, '2020-03-14 12:52:30'),
(34, 'Manisha', 'gora@yahoo.com', 'Great efforts!', 1, '2020-03-14 02:39:39'),
(35, 'Jenish Prajapati', 'zenish77@gmail.com', 'Wow!!!', 1, '2020-03-14 02:39:59'),
(36, 'Manish', 'manees@ymail.com', '(y) (y)', 1, '2020-03-14 02:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` bigint(20) NOT NULL,
  `card_exp_month` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `card_exp_year` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item_price` float(10,2) NOT NULL,
  `item_price_currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount_currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `card_number`, `card_exp_month`, `card_exp_year`, `item_name`, `item_number`, `item_price`, `item_price_currency`, `paid_amount`, `paid_amount_currency`, `txn_id`, `payment_status`, `created`, `modified`) VALUES
(1, 'Jenish Prajapati', 'zenish77@gmail.com', 4242424242424242, '08', '2022', 'Demo Product', 'PN12345', 1200.00, 'USD', '1200', 'usd', 'txn_1GMRoVDSTWXJ032VLdAX35gw', 'succeeded', '2020-03-14 10:26:31', '2020-03-14 10:26:31'),
(2, 'Aman Mool', 'amsbjasdb@gmail.com', 4242424242424242, '02', '2022', 'Demo Product', 'PN12345', 1200.00, 'USD', '1200', 'usd', 'txn_1GMW3qDSTWXJ032VKBpIlMH4', 'succeeded', '2020-03-14 14:58:39', '2020-03-14 14:58:39'),
(3, 'manish', 'masmas@gmail.com', 4242424242424242, '02', '2022', 'Demo Product', 'PN12345', 1200.00, 'USD', '1200', 'usd', 'txn_1GMW6uDSTWXJ032VtLbq3Nxv', 'succeeded', '2020-03-14 15:01:49', '2020-03-14 15:01:49'),
(4, 'jenish', 'zenish77@gmail.com', 4242424242424242, '6', '2022', 'Demo Product', 'PN12345', 1200.00, 'USD', '1200', 'usd', 'txn_1GMZtQDSTWXJ032V9u3sP0gQ', 'succeeded', '2020-03-14 19:04:08', '2020-03-14 19:04:08'),
(5, 'Random', 'lolololo@gmail.com', 378282246310005, '06', '2022', 'GAS', '2', 137500.00, 'NPR', '137500', 'npr', 'txn_1GMjt1DSTWXJ032VIQFuKDmc', 'succeeded', '2020-03-15 05:44:24', '2020-03-15 05:44:24'),
(6, 'Manish Gora', 'manisa33@gmail.com', 4242424242424242, '03', '2022', 'GAS', '2', 137500.00, 'NPR', '137500', 'npr', 'txn_1Gc845DSTWXJ032VGU86oljS', 'succeeded', '2020-04-26 16:35:28', '2020-04-26 16:35:28');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `Name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` smallint(6) NOT NULL,
  `stock` mediumint(9) NOT NULL,
  `ADD_Date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `Name`, `Content`, `image`, `Price`, `stock`, `ADD_Date`) VALUES
(17, 'manish', 'slfkdjlk', 'Screenshot (36).png', 0, 10000, '2020-03-13'),
(18, 'fdlksj', 'lfdaskjlaskdjf', 'Screenshot (36).png', 1500, 1500, '2020-03-13'),
(19, 'fasf;k', 'f;salfk;l', '7.jpg', 32767, 8388607, '2020-03-13'),
(20, 'dfak', 'sldkflksd', 'iris-letter-g-embroidery-design.jpg', 432, 234234, '2020-03-13'),
(21, ';lafsdk;', ';sfldk;lsdf', 'w4306.jpg', 4645, 545454, '2020-03-13'),
(22, 'ms', 'lskf', 'color.jpg', 150, 1800, '2020-03-14'),
(23, 'ms', 'lskf', 'color.jpg', 150, 1800, '2020-03-14'),
(24, 'manish', 'lksfjd', '7.jpg', 32767, 8972, '2020-03-14'),
(25, 'kjasdjk', 'sldfj', '7.jpg', 32767, 44342, '2020-03-14'),
(26, 'kjasdjkfsddfisodif', 'sldfjsfoisidijl', '83759881_2604859326234657_8240503062184067072_n.jpg', 3224, 23423, '2020-03-14'),
(27, 'lkfslkj', 'sdfjlsl', 'Cross-section-sketch-of-the-human-heart.png', 32767, 23423, '2020-03-14'),
(28, 'lkfslkjwrlkj', 'lwkrjwlke', '7.jpg', 323, 23, '2020-03-14'),
(29, 'aman', 'mool', 'w4306.jpg', 500, 560, '2020-03-14'),
(30, 'lskfj1', 'fslkjlksf', 'w4306.jpg', 32232, 3434, '2020-03-14'),
(31, 'ASFDSDFSADF', 'SDFSDFS', 'defaultimage.jpg', 1500, 500, '2020-03-14'),
(32, 'asflkd', 'sdfsf', 'defaultimage.jpg', 32767, 323333, '2020-03-14');

-- --------------------------------------------------------

--
-- Table structure for table `stove`
--

CREATE TABLE `stove` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `stock` varchar(255) NOT NULL,
  `new_price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stove`
--

INSERT INTO `stove` (`id`, `title`, `content`, `author`, `featured_image`, `stock`, `new_price`) VALUES
(1, 'Dual Burner', '', '', 'stove2.png', '5', 3075),
(2, 'Burner with Pans', '', '', 'stovewithpan.png', '0', 4195),
(3, 'Tri-Stove', '', '', 'stove3.png', '50', 6250),
(4, 'Quad Burner', '', '', 'stove4.png', '50', 7777);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(6) UNSIGNED NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postby_id` int(6) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `is_verified` tinyint(1) DEFAULT 0,
  `verifiedby_id` int(6) DEFAULT 1,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` int(10) NOT NULL,
  `item` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(3) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` bigint(20) NOT NULL,
  `longitude` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `postby_id`, `created_at`, `is_verified`, `verifiedby_id`, `updated_at`, `status`, `first_name`, `last_name`, `address`, `phone_number`, `item`, `payment`, `purpose`, `quantity`, `title`, `latitude`, `longitude`) VALUES
(1, '', 1, '2020-03-13 08:58:22', 0, 1, NULL, 1, '', '', '', 0, '', '', '', 0, '', 0, 0),
(2, 'manisha_gora@hotmail.com', 1, '2020-03-13 09:21:17', 0, 1, NULL, 1, 'mani', 'we', '', 234, 'sagar gas', '', 'Domestic Purpose', 3, '', 0, 0),
(8, 'monikagora52@gmail.com', 1, '2020-03-13 09:52:16', 0, 1, NULL, 1, 'ertt', 'erqr3', 'seeeee', 1234, 'sagar gas', '', 'Domestic Purpose', 5, '', 0, 0),
(9, 'abhieshagora52@gmail.com', 1, '2020-03-13 09:57:08', 0, 1, NULL, 1, 'weee', 'erqr3we', 'seeeee', 1234, 'sagar gas', '', 'Domestic Purpose', 5, 'MIS.jpg', 0, 0),
(13, 'khadksaishika1@gmail.com', 1, '2020-03-14 05:21:04', 0, 1, NULL, 1, 'sdas', 'asdass', 'bht', 1234567890, 'nepal', '', 'comercial', 3, 'bg.jpg', 0, 0),
(14, 'khadksssssssssaishika1@gmail.com', 1, '2020-03-14 05:22:29', 0, 1, NULL, 1, 'what', 'asdaswjhattts', 'bhtttt', 1234567899, 'sagar', '', 'domestic', 3, 'bg.jpg', 0, 0),
(15, 'khadksssssssssaishwika1@gmail.com', 1, '2020-03-14 05:24:33', 0, 1, NULL, 1, 'whate', 'asdaswjhatttsw', 'bhttttw', 1234567699, 'nepal', '', 'comercial', 3, 'slide1.jpg', 0, 0),
(17, 'monika1gora52@gmail.com', 1, '2020-03-14 05:28:40', 0, 1, NULL, 1, 'aniiiiiiii', 'we', 'weddwq', 1232567899, 'nepal', '', 'comercial', 5, 'logoDark.JPG', 0, 0),
(22, 'manishea_gora@hotmail.com', 1, '2020-03-14 07:42:40', 0, 1, NULL, 1, 'egerg', 'rgrr', 'qeq2e', 1234567890, 'nepal', 'COD', 'comercial', 4, 'banner2.jpg', 0, 0),
(23, 'maanisha_gora@hotmail.com', 1, '2020-03-14 07:52:23', 0, 1, NULL, 1, 'asd', 'sdsd', 'bkt', 1234567890, 'sagar', 'COD', 'domestic', 1, 'bg.jpg', 0, 0),
(25, 'abhieasdshagora52@gmail.com', 1, '2020-03-14 07:54:08', 0, 1, NULL, 1, 'asd', 'sdsd', 'qw', 1232567899, 'sagar', 'COD', 'comercial', 1, 'bg.jpg', 0, 0),
(26, 'abhieasdsdsdshagora52@gmail.com', 1, '2020-03-14 07:54:39', 0, 1, NULL, 1, 'asd', 'sdsd', 'qw', 1232567899, 'sagar', 'COD', 'comercial', 1, 'bg.jpg', 0, 0),
(27, 'abherieasdsdsdshagora52@gmail.com', 1, '2020-03-14 07:56:28', 0, 1, NULL, 1, 'asd', 'sdsd', 'qw', 1232567899, 'sagar', 'COD', 'comercial', 1, 'bg.jpg', 0, 0),
(28, 'abherieaersdsdsdshagora52@gmail.com', 1, '2020-03-14 07:56:39', 0, 1, NULL, 1, 'asd', 'sdsd', 'qw', 1232567899, 'sagar', 'Pay Online', 'comercial', 1, 'bg.jpg', 0, 0),
(29, 'aha@gmail.com', 1, '2020-03-14 09:05:21', 0, 1, NULL, 1, 'a', 'hjg', 'Bhaktapur', 2147483647, 'sagar', 'COD', 'domestic', 3, 'defaultimage.jpg', 0, 0),
(30, 'zesanish77@gmail.com', 1, '2020-03-14 09:10:01', 0, 1, NULL, 1, 'refer', 'rfqer', 'erfq3', 2147483647, 'sagar', 'Pay Online', 'domestic', 3, 'defaultimage.jpg', 0, 0),
(31, 'ahas@gmail.com', 1, '2020-03-14 09:12:52', 0, 1, NULL, 1, 'a', 'hjg', 'Bhaktapur', 2147483647, 'sagar', 'Pay Online', 'domestic', 3, 'defaultimage.jpg', 0, 0),
(32, 'as33333@yahoo.com', 1, '2020-03-14 09:15:55', 0, 1, NULL, 1, 'as', 'sa', 'bharka', 2147483647, 'sagar', 'Pay Online', 'domestic', 2, 'defaultimage.jpg', 0, 0),
(33, 'wwrw@gmail.com', 1, '2020-03-14 11:37:58', 0, 1, NULL, 1, 'wewewe', 'rrrrrr', 'Bhaktapur', 2147483647, 'HP GAS', 'Pay Online', 'Domestic purpose', 2, 'adv1.jpg', 0, 0),
(34, 'rar@gmail.com', 1, '2020-03-14 13:18:02', 0, 1, NULL, 1, 'Manish', 'Hengo', 'suryabinayak', 2147483647, 'NEPAL Gas', 'Pay Online', 'Domestic purpose', 2, 'stove2.jpeg', 0, 0),
(35, 'gora@yahoo.com', 1, '2020-03-14 13:36:28', 0, 1, NULL, 1, 'Maneesha', 'Gora', 'Bhaktapur', 2147483647, 'HP GAS', 'Pay Online', 'Domestic purpose', 1, 'blue10.jpg', 0, 0),
(36, 'admin@gmail.com', 1, '2020-03-14 14:22:47', 0, 1, NULL, 1, 'Zenish', 'Prajapati', 'libali', 2147483647, 'Everest Gas', 'Pay Online', 'Commercial purpose', 2, 'adv1.jpg', 0, 0),
(37, 'khwopa@hotmail.com', 1, '2020-03-15 00:25:32', 0, 1, NULL, 1, 'Khwopa', 'Canteen', 'Libali', 2147483647, 'HP GAS', 'Pay Online', 'Commercial purpose', 3, 'blue5.jpg', 0, 0),
(38, 'pzenish@gmail.com', 1, '2020-04-11 08:24:39', 0, 1, NULL, 1, 'Jenish', 'Prajapati', 'Bhaktapur', 2147483647, 'HP GAS', 'COD', 'Domestic purpose', 1, 'blue5.jpg', 0, 0),
(39, 'test1@ymail.com', 1, '2020-04-11 08:28:40', 0, 1, NULL, 1, 'Test', 'Test', 'nepal', 2147483647, 'HP GAS', 'COD', 'Commercial purpose', 3, '1195247805040623617.jpg', 0, 0),
(42, 'manisa33@gmail.com', 1, '2020-04-26 10:49:02', 0, 1, NULL, 1, 'Manisha', 'Gora', 'suryabinayak', 2147483647, 'NEPAL Gas', 'Pay Online', 'Domestic purpose', 2, 'blue5.jpg', 0, 0),
(43, 'tester@ymail.com', 1, '2020-06-28 04:41:00', 0, 1, NULL, 1, 'Random', 'Long', 'Byasi Gate, Nagarkot Rd, Bhaktapur 44800', 2147483647, 'HP GAS', 'COD', 'Domestic purpose', 1, 'Capture.JPG', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `verifiedby_id` (`verifiedby_id`),
  ADD KEY `postby_id` (`postby_id`);

--
-- Indexes for table `gas_cylinders`
--
ALTER TABLE `gas_cylinders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stove`
--
ALTER TABLE `stove`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `verifiedby_id` (`verifiedby_id`),
  ADD KEY `postby_id` (`postby_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `gas_cylinders`
--
ALTER TABLE `gas_cylinders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `stove`
--
ALTER TABLE `stove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
