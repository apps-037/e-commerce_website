-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 28, 2020 at 06:56 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Web Development', 1),
(2, 'App Development', 1),
(3, 'Digital Marketing', 1),
(4, 'Design Services', 1),
(5, 'Writing Services', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE IF NOT EXISTS `contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'apurva', 'apu@gmail.com', '495835742', 'hello', '2020-08-19 06:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_master`
--

DROP TABLE IF EXISTS `coupon_master`;
CREATE TABLE IF NOT EXISTS `coupon_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_type` varchar(10) NOT NULL,
  `cart_min_value` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon_master`
--

INSERT INTO `coupon_master` (`id`, `coupon_code`, `coupon_value`, `coupon_type`, `cart_min_value`, `status`) VALUES
(1, 'First50', 1000, 'Rupee', 1500, 1),
(2, 'First60', 20, 'Percentage', 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float DEFAULT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `txnid` varchar(20) DEFAULT NULL,
  `mihpayid` varchar(20) DEFAULT NULL,
  `ship_order_id` int(11) DEFAULT NULL,
  `ship_shipment_id` int(11) DEFAULT NULL,
  `payu_status` varchar(10) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_value` varchar(50) DEFAULT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `ship_order_id`, `ship_shipment_id`, `payu_status`, `coupon_id`, `coupon_value`, `coupon_code`, `added_on`) VALUES
(1, 1, 'COD', 164299, 'Success', '3', 'eaad21770607ee0b25ba', '', 0, 0, '', 0, '', '', '2020-05-15 10:29:38'),
(3, 1, 'COD', 10, 'pending', '2', '8834142e7821c1889b33', '', 0, 0, '', 0, '', '', '2020-05-20 07:44:24'),
(4, 1, 'COD', 12000, 'pending', '2', '1bf668ba03dc15833001', '', 0, 0, '', 0, '', '', '2020-05-20 07:56:44'),
(5, 1, 'payu', 16998, 'pending', '3', '8b1b93a4b63e0b2307a0', '', 0, 0, '', 0, '', '', '2020-05-20 08:10:37'),
(6, 1, 'payu', 16998, 'success', '1', 'da1f0fd6ae533d8a2f70', '403993715521005867', 0, 0, '', 0, '', '', '2020-05-20 08:22:27'),
(7, 3, 'COD', 1560, 'pending', '3', '36f4e1a258f5649996b5', '', 0, 0, '', 0, '', '', '2020-05-22 11:24:46'),
(8, 3, 'COD', 1900, 'pending', '3', '54a9bf67d824479004a4', '', 0, 0, '', 0, '', '', '2020-05-22 11:27:17'),
(9, 1, 'COD', 1900, 'pending', '4', '62d6625c440ecc84aa78', '', 0, 0, '', 0, '', '', '2020-05-22 09:58:57'),
(10, 1, 'COD', 150, 'pending', '3', '3532b3a4441fa64e2918', '', 0, 0, '', 0, '', '', '2020-05-23 10:45:15'),
(11, 1, 'COD', 50, 'pending', '3', '1fbc5a06bfa6e2299f79', '', 0, 0, '', 0, '', '', '2020-05-25 06:49:19'),
(13, 1, 'COD', 1560, 'pending', '1', '68d2cc3d52d8f21197fb', '', 0, 0, '', 1, '1000', 'First50', '2020-05-26 08:06:32'),
(14, 1, 'COD', 560, 'pending', '1', '901aa3cb126d2448d5e9', '', 0, 0, '', 1, '1000', 'First50', '2020-05-26 08:07:48'),
(16, 1, 'COD', 1560, 'pending', '4', 'af5421697c0e596ca7f9', '', 38845635, 38565829, '', 0, '', '', '2020-05-25 06:49:42'),
(18, 5, 'COD', 1900, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-05 11:15:47'),
(19, 5, 'COD', 1350, 'pending', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-09-05 01:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 2, 1, 155800),
(2, 1, 1, 1, 8499),
(4, 3, 10, 1, 10),
(5, 4, 6, 8, 1500),
(6, 5, 1, 2, 8499),
(7, 6, 1, 2, 8499),
(8, 7, 9, 1, 1560),
(9, 8, 8, 1, 1900),
(10, 9, 8, 1, 1900),
(11, 10, 11, 3, 50),
(12, 11, 11, 1, 50),
(13, 16, 9, 1, 1560),
(14, 13, 9, 1, 1560),
(15, 14, 9, 1, 1560),
(19, 18, 8, 1, 1900),
(20, 19, 7, 1, 1350),
(21, 0, 8, 1, 1900),
(22, 0, 6, 1, 1500),
(23, 0, 10, 1, 355),
(24, 0, 9, 1, 1560),
(25, 0, 6, 1, 1500),
(26, 0, 3, 1, 115900),
(27, 0, 1, 1, 8499),
(28, 0, 7, 1, 1350),
(29, 0, 3, 1, 115900),
(30, 0, 8, 1, 1900),
(31, 0, 3, 1, 115900),
(32, 0, 2, 1, 155800);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `sub_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(1, 1, 1, 'Realme C3 (Frozen Blue, 64 GB) (4 GB RAM)', 9999, 8499, 10, '799153645_303b4a46-a701-4b43-b9c1-d98a2b53422f.jpg', 'Mauris dapibus tellus quis risus maximus molestie. Curabitur eget tortor tellus.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus scelerisque quis nisi porta congue. Aenean sed maximus ligula. Vestibulum quis eros id ex condimentum lacinia. Nam interdum finibus odio, sit amet commodo erat varius sed. In at velit velit. Nullam vitae gravida mi. Donec aliquet nunc non ipsum bibendum, et elementum nibh lobortis. Fusce tempor elit at mauris luctus euismod. Donec eu massa eros. Aenean maximus vitae nisl ut sollicitudin. Aenean urna arcu, laoreet at ante eget, maximus mattis lacus. Mauris dapibus tellus quis risus maximus molestie. Curabitur eget tortor tellus.', 'Realme C3 (Frozen Blue, 64 GB) (4 GB RAM)', 'Realme C3 (Frozen Blue, 64 GB) (4 GB RAM)', 'Realme C3 (Frozen Blue, 64 GB) (4 GB RAM)', 1),
(2, 1, 2, 'APPLE IPHONE 11 PRO MAX (512GB) - MIDNIGHT GREEN', 165800, 155800, 4, '942626953_iphone.jpg', 'Aenean tempus ut leo nec laoreet. Vestibulum ut est neque.', 'Curabitur eget augue dolor. Curabitur id dapibus massa. Vestibulum at enim quis metus ultrices posuere vitae sit amet eros. Morbi et libero pellentesque, efficitur odio nec, congue lorem. Vestibulum faucibus, risus eget pretium efficitur, neque nulla eleifend purus, non venenatis lorem ligula vel nulla. Fusce finibus efficitur sapien vitae laoreet. Integer imperdiet justo sed tellus dictum, at egestas arcu finibus. Fusce et augue elit. Praesent tincidunt purus in purus dictum volutpat. Aenean tempus ut leo nec laoreet. Vestibulum ut est neque.', 'APPLE IPHONE 11 PRO MAX (512GB) - MIDNIGHT GREEN', '', 'APPLE IPHONE 11 PRO MAX (512GB) - MIDNIGHT GREEN', 1),
(3, 1, 3, 'Samsung Galaxy S10 Plus 1TB (Ceramic White, 12GB RAM)', 115900, 115900, 5, '567328558_samsung-galaxy-s10-plus-1tb-ceramic-white-12gb-ram-.jpg', 'Nullam purus lorem, tincidunt vitae tristique non, imperdiet ut urna.', 'Nullam a nunc et lorem ornare faucibus. Etiam tortor lacus, auctor eget enim at, tincidunt dignissim magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin tincidunt eros eget felis tempor, id volutpat ipsum lacinia. Donec scelerisque risus non purus scelerisque tristique. Mauris enim ligula, condimentum sed iaculis nec, porttitor eu nunc. Sed hendrerit vel arcu vitae iaculis. Phasellus vehicula molestie leo. Nullam purus lorem, tincidunt vitae tristique non, imperdiet ut urna.', 'Samsung Galaxy S10 Plus 1TB (Ceramic White, 12GB RAM)', 'Samsung Galaxy S10 Plus 1TB (Ceramic White, 12GB RAM)', 'Samsung Galaxy S10 Plus 1TB (Ceramic White, 12GB RAM)', 1),
(4, 2, 4, 'SHEEN-SOLID TROUSER-OLIVE', 1999, 1200, 3, '697347005_2__1538219531_49.204.69.38_600x.jpg', 'per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 'Duis a felis congue, feugiat est non, suscipit quam. In elit lacus, auctor sed lacus eget, egestas consectetur leo. Duis pellentesque pharetra ante, ac ornare nibh faucibus id. Integer pulvinar malesuada nisl. Nulla vel orci nunc. Nullam a tellus eu ex ullamcorper mollis. Donec commodo ligula a accumsan fermentum. Mauris sed orci lacinia, posuere leo molestie, pretium mi. Cras sodales, neque id cursus fermentum, mi purus vehicula sem, vel laoreet lorem justo id tortor. Sed ut urna ut ipsum vestibulum commodo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut commodo ullamcorper quam non pulvinar.', 'SHEEN-SOLID TROUSER-OLIVE', 'SHEEN-SOLID TROUSER-OLIVE', 'SHEEN-SOLID TROUSER-OLIVE', 1),
(5, 2, 1, 'NATURE-LINEN SHIRT-GREEN', 2799, 2399, 8, '812581380_nature_green-0224_600x.jpg', 'a nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Nunc auctor turpis ante, eget bibendum mi mollis in. Aliquam quis neque ut libero malesuada auctor. Aliquam interdum enim at commodo gravida. Donec nisl sem, molestie ut quam quis, vulputate venenatis ipsum. Aenean quis ex ut magna accumsan fringilla. Quisque id ex massa. Sed libero ante, fringilla ac condimentum in, porttitor ac risus. Integer mattis odio nec nunc semper imperdiet. In porttitor tellus eget sapien vulputate, eu euismod lacus aliquet. Maecenas molestie elit augue, sit amet fringilla dolor congue et. Nunc eu libero auctor, sollicitudin lectus quis, porta ligula. In vel ullamcorper risus. Nullam viverra, mi sit amet laoreet luctus, urna nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'NATURE-LINEN SHIRT-GREEN', 'NATURE-LINEN SHIRT-GREEN', 'NATURE-LINEN SHIRT-GREEN', 1),
(6, 2, 2, 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 1999, 1500, 8, '931830512__8-(1)-E5x-104831-NJD.jpg', 'lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 'Duis in risus quis lectus dictum fringilla. Aenean tempor pellentesque velit id ullamcorper. Ut id aliquam odio. Morbi id pharetra libero, ut tempor nisi. Maecenas a lectus nec risus maximus rutrum. Mauris vel elit ut magna semper laoreet nec sed magna. Quisque eleifend vel sem non malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget posuere orci, eu ultrices sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet ex dictum nisl bibendum elementum non in turpis. In bibendum ipsum nunc, bibendum lacinia lacus maximus eu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus aliquam lacus quis urna tristique suscipit. Praesent vitae mi mollis dui facilisis convallis eu faucibus augue.', 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 'Monte Carlo Turquoise Blue Solid Collar T Shirt', 1),
(7, 4, 3, 'Floral Print Polo T-shirt', 1900, 1350, 7, '309027777_Floral-Print-Polo-T-shirt.jpg', 'isl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Nunc auctor turpis ante, eget bibendum mi mollis in. Aliquam quis neque ut libero malesuada auctor. Aliquam interdum enim at commodo gravida. Donec nisl sem, molestie ut quam quis, vulputate venenatis ipsum. Aenean quis ex ut magna accumsan fringilla. Quisque id ex massa. Sed libero ante, fringilla ac condimentum in, porttitor ac risus. Integer mattis odio nec nunc semper imperdiet. In porttitor tellus eget sapien vulputate, eu euismod lacus aliquet. Maecenas molestie elit augue, sit amet fringilla dolor congue et. Nunc eu libero auctor, sollicitudin lectus quis, porta ligula. In vel ullamcorper risus. Nullam viverra, mi sit amet laoreet luctus, urna nisl pharetra orci, at condimentum nisl lorem elementum ipsum.', 'Floral Print Polo T-shirt', 'Floral Print Polo T-shirt', 'Floral Print Polo T-shirt', 1),
(8, 4, 4, 'Floral Embroidered Polo T-shirt', 1120, 1900, 10, '651584201_Floral-Embroidered-Polo-T-shirt.jpg', 'rius, lacus velit aliquam ex, in dignissim sem eros ac erat. Vestibulum ac arcu tortor.', 'Vestibulum in auctor turpis. Quisque hendrerit eget turpis et molestie. Phasellus nec nibh a lacus rhoncus eleifend. Donec suscipit id diam non mattis. Fusce eu luctus leo. Etiam eget dui libero. Etiam eros lorem, rhoncus et convallis eget, tempus vel tellus. Nam at diam quis nisl tincidunt aliquam. Quisque placerat magna non libero interdum varius vel id risus. Vivamus mollis maximus fermentum. Donec eget nulla dui. Sed ultricies malesuada metus, non feugiat purus fringilla ac. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer accumsan, tortor id eleifend varius, lacus velit aliquam ex, in dignissim sem eros ac erat. Vestibulum ac arcu tortor.', 'Floral Embroidered Polo T-shirt', 'Floral Embroidered Polo T-shirt', 'Floral Embroidered Polo T-shirt', 1),
(9, 4, 1, 'Floral Print Polo T-shirt Latest', 650, 1560, 10, '526258680_Floral-Print-Polo-T-shirt1.jpg', 's mus. Vestibulum eget posuere orci, eu ultrices sapien. Orc', 'aximus rutrum. Mauris vel elit ut magna semper laoreet nec sed magna. Quisque eleifend vel sem non malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget posuere orci, eu ultrices sapien. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam sit amet ex d', 'Floral Print Polo T-shirt Latest', '', 'Floral Print Polo T-shirt Latest', 1),
(10, 1, 2, 'School website', 334, 355, 5, 'app.png', 'efsdfbvdfbgd', 'fvds', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shiprocket_token`
--

DROP TABLE IF EXISTS `shiprocket_token`;
CREATE TABLE IF NOT EXISTS `shiprocket_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(500) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shiprocket_token`
--

INSERT INTO `shiprocket_token` (`id`, `token`, `added_on`) VALUES
(1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQ5NDkwOSwiaXNzIjoiaHR0cHM6Ly9hcGl2Mi5zaGlwcm9ja2V0LmluL3YxL2V4dGVybmFsL2F1dGgvbG9naW4iLCJpYXQiOjE1OTA0MDQ4NTMsImV4cCI6MTU5MTI2ODg1MywibmJmIjoxNTkwNDA0ODUzLCJqdGkiOiJWZU4zaE5YMm1LdVY4cXB0In0.YKracv-yDKppYb2FISr5zE_4gEGWIAz-HzIa6cit9nw', '2020-05-24 23:37:26');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `sub_categories` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `sub_categories`, `status`) VALUES
(1, 2, 'Static', 1),
(2, 2, 'Dynamic', 1),
(3, 1, 'Static', 1),
(4, 1, 'Dynamic', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `password`, `name`, `email`, `mobile`, `added_on`) VALUES
(1, '', 'Apurva', 'apu@gmail.com', '78984332', '2020-08-19 06:24:00'),
(5, 'ert1', 'Apurva Saini', '2018037@iiitdmj.ac.in', '8085520210', '2020-09-03 05:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `added_on`) VALUES
(16, 1, 4, '2020-05-13 08:54:24'),
(17, 5, 8, '2020-09-16 04:48:13'),
(18, 5, 7, '2020-09-16 04:48:15'),
(19, 5, 6, '2020-09-16 04:48:20');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
