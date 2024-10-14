-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2024 at 04:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drinkingorder`
--
CREATE DATABASE IF NOT EXISTS `drinkingorder` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `drinkingorder`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ProductDetailID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL,
  `ToppingList` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`ID`, `UserID`, `ProductDetailID`, `Quantity`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ToppingList`) VALUES
(1, 1, 26, 45, 0, '2024-10-10 14:17:13.000', 1, '26'),
(2, 1, 10, 1, 0, '2024-10-10 14:17:40.000', 1, '10,38');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ID`, `Name`, `IsDeleted`, `CreatedAt`, `CreatedBy`) VALUES
(1, 'Fresh Fruit', 0, '2024-05-19 10:52:57.000', 1),
(2, 'Coffee', 0, '2024-05-19 10:52:57.000', 1),
(3, 'Cacao', 0, '2024-05-19 10:52:57.000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ID` int(11) NOT NULL,
  `OrderDetailID` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comment` longtext DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL,
  `ImgURL` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `ID` int(11) NOT NULL,
  `LocationName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `shipperID` int(11) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`ID`, `LocationName`, `shipperID`, `IsDeleted`, `CreatedAt`, `CreatedBy`) VALUES
(31, 'Ba Đình', NULL, 0, '2024-10-06 21:10:11.127', 1),
(32, 'Bắc Từ Liêm', NULL, 0, '2024-10-06 21:10:11.127', 1),
(33, 'Cầu Giấy', NULL, 0, '2024-10-06 21:10:11.127', 1),
(34, 'Đống Đa', NULL, 0, '2024-10-06 21:10:11.127', 1),
(35, 'Hà Đông', NULL, 0, '2024-10-06 21:10:11.127', 1),
(36, 'Hai Bà Trưng', NULL, 0, '2024-10-06 21:10:11.127', 1),
(37, 'Hoàn Kiếm', NULL, 0, '2024-10-06 21:10:11.127', 1),
(38, 'Hoàng Mai', NULL, 0, '2024-10-06 21:10:11.127', 1),
(39, 'Long Biên', NULL, 0, '2024-10-06 21:10:11.127', 1),
(40, 'Nam Từ Liêm', NULL, 0, '2024-10-06 21:10:11.127', 1),
(41, 'Tây Hồ', NULL, 0, '2024-10-06 21:10:11.127', 1),
(42, 'Thanh Xuân', NULL, 0, '2024-10-06 21:10:11.127', 1),
(43, 'Ba Vì', NULL, 0, '2024-10-06 21:10:11.127', 1),
(44, 'Chương Mỹ', NULL, 0, '2024-10-06 21:10:11.127', 1),
(45, 'Đan Phượng', NULL, 0, '2024-10-06 21:10:11.127', 1),
(46, 'Đông Anh', NULL, 0, '2024-10-06 21:10:11.127', 1),
(47, 'Gia Lâm', NULL, 0, '2024-10-06 21:10:11.127', 1),
(48, 'Hoài Đức', NULL, 0, '2024-10-06 21:10:11.127', 1),
(49, 'Mê Linh', NULL, 0, '2024-10-06 21:10:11.127', 1),
(50, 'Mỹ Đức', NULL, 0, '2024-10-06 21:10:11.127', 1),
(51, 'Phú Xuyên', NULL, 0, '2024-10-06 21:10:11.127', 1),
(52, 'Phúc Thọ', NULL, 0, '2024-10-06 21:10:11.127', 1),
(53, 'Quốc Oai', NULL, 0, '2024-10-06 21:10:11.127', 1),
(54, 'Sóc Sơn', NULL, 0, '2024-10-06 21:10:11.127', 1),
(55, 'Thạch Thất', NULL, 0, '2024-10-06 21:10:11.127', 1),
(56, 'Thanh Oai', NULL, 0, '2024-10-06 21:10:11.127', 1),
(57, 'Thanh Trì', NULL, 0, '2024-10-06 21:10:11.127', 1),
(58, 'Thường Tín', NULL, 0, '2024-10-06 21:10:11.127', 1),
(59, 'Ứng Hòa', NULL, 0, '2024-10-06 21:10:11.127', 1),
(60, 'Sơn Tây', NULL, 0, '2024-10-06 21:10:11.127', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Fullname` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Status` varchar(100) DEFAULT 'Pending',
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL,
  `Notes` longtext DEFAULT NULL,
  `paymentMethod` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `ID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductDetailID` int(11) DEFAULT NULL,
  `ToppingID` longtext DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `ID` int(11) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Content` longtext DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL,
  `imgURL` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`ID`, `CategoryID`, `Title`, `Content`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `imgURL`) VALUES
(12, 1, 'Great product!', 'I absolutely love this product. Highly recommended!', 0, '2024-01-15 00:00:00.000', 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(13, 2, 'Not satisfied', 'The product did not meet my expectations.', 0, '2024-01-16 00:00:00.000', 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(14, 3, 'Excellent quality', 'The quality is superb. Will buy again.', 0, '2024-01-17 00:00:00.000', 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(15, 1, 'Value for money', 'Great value for the price.', 0, '2024-01-18 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(16, 2, 'Not worth it', 'The product broke after a week of use.', 1, '2024-01-19 00:00:00.000', 3, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(17, 3, 'Very happy', 'I am very happy with my purchase.', 0, '2024-01-20 00:00:00.000', 3, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(18, 1, 'Disappointed', 'Did not perform as advertised.', 1, '2024-01-21 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(19, 2, 'Good customer service', 'Customer service was very helpful.', 0, '2024-01-22 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(20, 3, 'Highly recommend', 'Would highly recommend to others.', 0, '2024-01-23 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(21, 1, 'Average product', 'It is an average product for the price.', 0, '2024-01-24 00:00:00.000', 3, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(22, 2, 'Fast shipping', 'The product arrived quickly.', 0, '2024-01-25 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(23, 3, 'Terrible experience', 'I had a terrible experience with this product.', 1, '2024-01-26 00:00:00.000', 4, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(24, 3, 'Very durable', 'The product is very durable and long-lasting.', 0, '2024-01-27 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(25, 1, 'Poor quality', 'Quality is not as expected.', 1, '2024-01-28 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(26, 1, 'Satisfied', 'Overall, I am satisfied with the purchase.', 0, '2024-01-29 00:00:00.000', 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(27, 2, 'Excellent choice', 'Excellent choice for the price.', 0, '2024-01-30 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(28, 3, 'Not recommended', 'I would not recommend this product.', 1, '2024-01-31 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(29, 3, 'Superb', 'The product is superb in every way.', 0, '2024-02-01 00:00:00.000', 2, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(30, 2, 'Okay product', 'It is an okay product, nothing special.', 0, '2024-02-02 00:00:00.000', 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(31, 2, 'Will buy again', 'Definitely will buy this product again.', 0, '2024-02-03 00:00:00.000', 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(32, 2, 'test2', 'test123123', 0, '2024-05-20 19:44:46.490', 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(33, 1, 'tesy', 'Ã¡dasd', 0, '2024-05-22 01:05:52.463', 1, 'https://th.bing.com/th/id/OIG4.LgUj9FIjzUbdTSMn0mRg'),
(34, 1, 'tesyasdasd', 'sdfsdfdsf', 0, '2024-05-22 10:16:53.493', 1, NULL),
(35, 1, 'hehe', 'asdasdasd', 0, '2024-05-22 10:17:50.590', 1, 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D'),
(36, 1, '123', '123', 0, '2024-07-07 21:35:43.517', 1, 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `description` longtext DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `CategoryID`, `Name`, `IsDeleted`, `CreatedAt`, `description`, `CreatedBy`) VALUES
(1, 1, 'Nước ép Dưa hấu', 0, '2024-10-10 10:00:00.000', 'Nước ép dưa hấu tươi mát', 1),
(2, 1, 'Sinh tố Dứa', 0, '2024-10-10 10:05:00.000', 'Sinh tố dứa tươi', 1),
(3, 1, 'Sinh tố Xoài', 0, '2024-10-10 10:10:00.000', 'Sinh tố xoài ngọt ngào', 1),
(4, 2, 'Cà phê Đen', 0, '2024-10-10 10:15:00.000', 'Cà phê đen đậm đà', 1),
(5, 2, 'Cà phê Sữa Đá', 0, '2024-10-10 10:20:00.000', 'Cà phê sữa đá thơm ngon', 1),
(6, 2, 'Espresso', 0, '2024-10-10 10:25:00.000', 'Cà phê espresso đậm chất Ý', 1),
(7, 3, 'Socola Nóng', 0, '2024-10-10 10:30:00.000', 'Socola nóng thơm lừng', 1),
(8, 3, 'Cacao Đá Xay', 0, '2024-10-10 10:35:00.000', 'Cacao đá xay mát lạnh', 1),
(9, 3, 'Sinh tố Cacao', 0, '2024-10-10 10:40:00.000', 'Sinh tố cacao đậm đà', 1),
(10, 1, 'Nước ép Cam', 0, '2024-10-10 10:45:00.000', 'Nước ép cam nguyên chất', 1),
(11, 1, 'Sinh tố Dâu', 0, '2024-10-10 10:50:00.000', 'Sinh tố dâu tươi ngon', 1),
(12, 1, 'Nước ép Táo', 0, '2024-10-10 10:55:00.000', 'Nước ép táo tươi mát', 1),
(13, 2, 'Cappuccino', 0, '2024-10-10 11:00:00.000', 'Cappuccino đậm đà với bọt sữa mịn', 1),
(14, 2, 'Mocha', 0, '2024-10-10 11:05:00.000', 'Mocha thơm lừng hương vị cà phê và socola', 1),
(15, 2, 'Macchiato', 0, '2024-10-10 11:10:00.000', 'Cà phê Macchiato với lớp bọt sữa béo ngậy', 1),
(16, 3, 'Socola Đá Xay', 0, '2024-10-10 11:15:00.000', 'Socola đá xay mát lạnh', 1),
(17, 3, 'Cacao Nóng', 0, '2024-10-10 11:20:00.000', 'Cacao nóng béo ngậy và thơm lừng', 1),
(18, 3, 'Cacao Kem Tươi', 0, '2024-10-10 11:25:00.000', 'Cacao mát lạnh với kem tươi phủ trên', 1),
(19, 1, 'Nước ép Dứa', 0, '2024-10-10 11:30:00.000', 'Nước ép dứa tươi mát giúp giải nhiệt', 1),
(20, 1, 'Sinh tố Xoài', 0, '2024-10-10 11:35:00.000', 'Sinh tố xoài thơm ngon, béo ngậy', 1),
(21, 1, 'Nước ép Cà Rốt', 0, '2024-10-10 11:40:00.000', 'Nước ép cà rốt bổ dưỡng cho sức khỏe', 1),
(22, 2, 'Latte', 0, '2024-10-10 11:45:00.000', 'Cà phê Latte với sữa tươi béo ngậy', 1),
(23, 2, 'Cà phê đen', 0, '2024-10-10 11:50:00.000', 'Cà phê đen nguyên chất đậm vị', 1),
(24, 2, 'Espresso', 0, '2024-10-10 11:55:00.000', 'Ly cà phê Espresso thơm lừng, đậm đà', 1),
(25, 3, 'Cacao Đá', 0, '2024-10-10 12:00:00.000', 'Cacao đá thơm ngon và mát lạnh', 1),
(26, 3, 'Cacao Sữa Đặc', 0, '2024-10-10 12:05:00.000', 'Cacao sữa đặc béo ngậy, thơm lừng', 1),
(27, 3, 'Cacao Bạc Hà', 0, '2024-10-10 12:10:00.000', 'Hương vị cacao kết hợp với bạc hà tươi mát', 1);

-- --------------------------------------------------------

--
-- Table structure for table `productdetail`
--

CREATE TABLE `productdetail` (
  `ID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `ImageURL` longtext DEFAULT NULL,
  `Size` varchar(20) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `hold` int(11) DEFAULT 0,
  `ImportPrice` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productdetail`
--

INSERT INTO `productdetail` (`ID`, `ProductID`, `ImageURL`, `Size`, `Stock`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `price`, `discount`, `hold`, `ImportPrice`) VALUES
(1, 1, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 50, 0, '2024-10-10 12:15:00.000', 3, 263923, 10, 0, 1.2),
(2, 2, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 40, 0, '2024-10-10 12:20:00.000', 3, 679787.66, 5, 0, 1.5),
(3, 3, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Large', 60, 0, '2024-10-10 12:25:00.000', 3, 617168.75, 15, 0, 2),
(4, 4, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 30, 0, '2024-10-10 12:30:00.000', 3, 46480.78, 8, 0, 1.8),
(5, 5, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Large', 20, 0, '2024-10-10 12:35:00.000', 3, 350897.71, 12, 0, 2.1),
(6, 6, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 45, 0, '2024-10-10 12:40:00.000', 3, 615046.22, 7, 0, 1.3),
(7, 7, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 35, 0, '2024-10-10 12:45:00.000', 3, 32537.99, 6, 0, 1.6),
(8, 8, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Large', 25, 0, '2024-10-10 12:50:00.000', 3, 287551.34, 13, 0, 2.3),
(9, 9, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 55, 0, '2024-10-10 12:55:00.000', 3, 340142.75, 9, 0, 1.4),
(10, 10, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Large', 60, 0, '2024-10-10 13:00:00.000', 3, 828059.77, 14, 0, 2.5),
(11, 11, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 45, 0, '2024-10-10 13:05:00.000', 3, 139870.63, 10, 0, 1.7),
(12, 12, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 65, 0, '2024-10-10 13:10:00.000', 3, 185173.88, 5, 0, 1.6),
(13, 13, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Large', 50, 0, '2024-10-10 13:15:00.000', 3, 496257.51, 12, 0, 2.4),
(14, 14, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 35, 0, '2024-10-10 13:20:00.000', 3, 925765.97, 8, 0, 1.8),
(15, 15, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 40, 0, '2024-10-10 13:25:00.000', 3, 160057.34, 7, 0, 1.3),
(16, 16, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Large', 60, 0, '2024-10-10 13:30:00.000', 3, 982988.82, 9, 0, 2.1),
(17, 17, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 45, 0, '2024-10-10 13:35:00.000', 3, 464772.11, 10, 0, 1.9),
(18, 18, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 55, 0, '2024-10-10 13:40:00.000', 3, 354894.12, 6, 0, 1.4),
(19, 19, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Large', 50, 0, '2024-10-10 13:45:00.000', 3, 370154.29, 13, 0, 2.2),
(20, 20, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 35, 0, '2024-10-10 13:50:00.000', 3, 776089.14, 8, 0, 1.6),
(21, 21, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 60, 0, '2024-10-10 13:55:00.000', 3, 779982.83, 5, 0, 1.2),
(22, 22, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Large', 45, 0, '2024-10-10 14:00:00.000', 3, 571646.8, 10, 0, 2),
(23, 23, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 50, 0, '2024-10-10 14:05:00.000', 3, 508285.51, 7, 0, 1.9),
(24, 24, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 40, 0, '2024-10-10 14:10:00.000', 3, 816487.2, 8, 0, 1.3),
(25, 25, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Large', 60, 0, '2024-10-10 14:15:00.000', 3, 567579.48, 12, 0, 2.3),
(26, 26, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 45, 0, '2024-10-10 14:20:00.000', 3, 378435.84, 9, 0, 1.8),
(27, 27, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 55, 0, '2024-10-10 14:25:00.000', 3, 179440.79, 7, 0, 1.1),
(28, 1, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Medium', 50, 0, '2024-10-10 12:15:00.000', 3, 25000, 10, 0, 10000),
(29, 2, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 40, 0, '2024-10-10 12:20:00.000', 3, 30000, 5, 0, 50000),
(30, 3, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 60, 0, '2024-10-10 12:25:00.000', 3, 40000, 15, 0, 20000),
(31, 4, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 30, 0, '2024-10-10 12:30:00.000', 3, 32000, 8, 0, 25000),
(32, 5, 'https://theallnaturalvegan.com/wp-content/uploads/2023/08/mango-juice-featured-image.jpg', 'Small', 10, 0, '2024-10-10 12:35:00.000', 3, 45000, 12, 0, 13000);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ID`, `Name`, `IsDeleted`, `CreatedAt`) VALUES
(1, 'Admin', 0, '2024-05-19 13:48:28.640'),
(2, 'Marketing', 0, '2024-05-19 13:48:28.640'),
(3, 'Sale', 0, '2024-05-19 13:48:28.640'),
(4, 'Sale leader', 0, '2024-05-19 13:48:50.670'),
(5, 'User', 0, '2024-05-19 13:48:59.990'),
(6, 'Inventory', 0, '2024-06-23 07:34:59.700');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `ID` int(11) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Value` varchar(150) DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  `CreatedBy` int(11) DEFAULT 1,
  `isDeleted` tinyint(4) DEFAULT 0,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`ID`, `Type`, `Value`, `Order`, `CreatedBy`, `isDeleted`, `description`) VALUES
(1, 'Money', 'VND', 1, 1, 0, 'This is a setting'),
(2, 'Time', '24h', 2, 1, 0, 'This is a setting'),
(3, 'COD', '45', 1, 1, 1, 'COD limit');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `ID` int(11) NOT NULL,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ImageURL` longtext DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Backlink` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`ID`, `Title`, `ImageURL`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `ProductId`, `Notes`, `Backlink`) VALUES
(1, 'Title 1', 'https://img.freepik.com/premium-vector/modern-sale-banner-website-slider-template-design_54925-46.jpg', 0, '2024-06-06 00:00:00.000', 0, NULL, NULL, 'empty'),
(2, 'Title 2', 'https://i.pinimg.com/736x/b6/89/96/b68996b0aeb13339740f961ada455a77.jpg', 0, '2024-06-06 00:00:00.000', 0, NULL, '', 'empty');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `ID` int(11) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Fullname` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Role` int(11) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL,
  `Avatar` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `Role`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`) VALUES
(1, 'admin@gmail.com', '12345678', 'John Doe', 'Male', '1234 Elm Street, Springfield, IL', '123-456-7890', 1, 1, '2024-05-22 23:21:10.153', 1, 'https://www.svgrepo.com/show/452030/avatar-default.svg'),
(2, 'd', '123', 'Jane Doe', 'Female', '2345 Oak Street, Springfield, IL', '234-567-8901', 2, 0, '2024-05-22 23:21:10.153', 2, 'https://www.svgrepo.com/show/452030/avatar-default.svg'),
(3, 'c', '123', 'Jim Beam', 'Male', '3456 Pine Street, Springfield, IL', '345-678-9012', 3, 0, '2024-05-22 23:21:10.153', 3, 'https://www.svgrepo.com/show/452030/avatar-default.svg'),
(4, 'b', '123', 'Jack Daniels', 'Male', '4567 Maple Street, Springfield, IL', '456-789-0123', 4, 0, '2024-05-22 23:21:10.153', 4, 'https://www.svgrepo.com/show/452030/avatar-default.svg'),
(5, 'user5@example.com', 'hashed_password5', 'Johnny Walker', 'Male', '5678 Cedar Street, Springfield, IL', '567-890-1234', 1, 0, '2024-05-22 23:21:10.153', 1, 'https://www.svgrepo.com/show/452030/avatar-default.svg'),
(6, 'user6@example.com', 'hashed_password6', 'Jill Valentine', 'Female', '6789 Birch Street, Springfield, IL', '678-901-2345', 2, 0, '2024-05-22 23:21:10.153', 2, 'https://www.svgrepo.com/show/452030/avatar-default.svg'),
(7, 'user7@example.com', 'hashed_password7', 'Chris Redfield', 'Male', '7890 Spruce Street, Springfield, IL', '789-012-3456', 3, 0, '2024-05-22 23:21:10.153', 3, 'https://www.svgrepo.com/show/452030/avatar-default.svg');

-- --------------------------------------------------------

--
-- Table structure for table `topping`
--

CREATE TABLE `topping` (
  `ID` int(11) NOT NULL,
  `ToppingName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 1,
  `CreatedDate` datetime(3) DEFAULT current_timestamp(3),
  `LastUpdated` datetime(3) DEFAULT current_timestamp(3),
  `Img` longtext DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topping`
--

INSERT INTO `topping` (`ID`, `ToppingName`, `Price`, `IsDeleted`, `CreatedDate`, `LastUpdated`, `Img`, `ProductID`) VALUES
(1, 'Dâu tây cắt lát', 7303, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 1),
(2, 'Hạt chia', 18609, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 2),
(3, 'Kem tươi', 15135, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 3),
(4, 'Siro vani', 17848, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 4),
(5, 'Trân châu đen', 5836, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 5),
(6, 'Sô cô la vụn', 9636, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 6),
(7, 'Mứt trái cây', 10671, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 7),
(8, 'Hạt điều rang', 4449, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 8),
(9, 'Hạnh nhân cắt lát', 6233, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 9),
(10, 'Bột protein', 15816, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 10),
(11, 'Hạt điều', 4379, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 11),
(12, 'Bột cacao', 8450, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 12),
(13, 'Thạch trái cây', 9112, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 13),
(14, 'Kem cheese', 18208, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 14),
(15, 'Hạt chia', 7705, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 15),
(16, 'Trái cây tươi', 17902, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 16),
(17, 'Đường', 10394, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 17),
(18, 'Bột protein', 14264, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 18),
(19, 'Mứt dâu', 2139, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 19),
(20, 'Hạt điều rang', 19903, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 20),
(21, 'Dâu tây cắt lát', 19098, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 21),
(22, 'Hạt chia', 15780, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 22),
(23, 'Kem tươi', 19607, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 23),
(24, 'Siro vani', 12695, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 24),
(25, 'Trân châu đen', 2654, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 25),
(26, 'Sô cô la vụn', 9184, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 26),
(27, 'Mứt trái cây', 17959, 0, '2024-10-10 20:06:24.000', '2024-10-10 20:06:24.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 27),
(28, 'Dâu tây cắt lát', 9364, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 2),
(29, 'Hạt chia', 5391, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 1),
(30, 'Kem tươi', 14865, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 5),
(31, 'Siro vani', 2153, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 1),
(32, 'Trân châu đen', 18171, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 2),
(33, 'Sô cô la vụn', 10396, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 3),
(34, 'Mứt trái cây', 13464, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 3),
(35, 'Hạt điều rang', 16133, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 6),
(36, 'Hạnh nhân cắt lát', 2274, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 4),
(37, 'Bột protein', 14969, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 8),
(38, 'Hạt điều', 12026, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 10),
(39, 'Bột cacao', 13221, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 11),
(40, 'Thạch trái cây', 10027, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 3),
(41, 'Kem cheese', 8473, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 13),
(42, 'Hạt chia', 10283, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 17),
(43, 'Trái cây tươi', 5998, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 15),
(44, 'Đường', 15139, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 12),
(45, 'Bột protein', 19702, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 19),
(46, 'Mứt dâu', 15094, 0, '2024-10-10 20:07:38.000', '2024-10-10 20:07:38.000', 'https://www.alattefood.com/wp-content/uploads/2023/06/Crumb-Cake-Topping-80.jpg', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Fullname` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT 0,
  `CreatedAt` datetime(3) DEFAULT current_timestamp(3),
  `CreatedBy` int(11) DEFAULT NULL,
  `Avatar` longtext,
  `ChangeHistory` longtext DEFAULT NULL,
  `Location` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Email`, `Password`, `Fullname`, `Gender`, `Address`, `Phone`, `IsDeleted`, `CreatedAt`, `CreatedBy`, `Avatar`, `ChangeHistory`, `Location`) VALUES
(1, 'mailsendbot1006@gmail.com', '12345678', 'testing', 'Female', 'Hà Nội', '012345678', 0, '2024-10-10 21:15:39.727', 0, 'https://www.svgrepo.com/show/452030/avatar-default.svg', NULL, 'Chương Mỹ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProductDetailID` (`ProductDetailID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `shipperID` (`shipperID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductDetailID` (`ProductDetailID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CategoryID` (`CategoryID`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `productdetail`
--
ALTER TABLE `productdetail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `Role` (`Role`);

--
-- Indexes for table `topping`
--
ALTER TABLE `topping`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `productdetail`
--
ALTER TABLE `productdetail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `topping`
--
ALTER TABLE `topping`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`ProductDetailID`) REFERENCES `productdetail` (`ID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`shipperID`) REFERENCES `staff` (`ID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`ID`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductDetailID`) REFERENCES `productdetail` (`ID`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`CreatedBy`) REFERENCES `staff` (`ID`);

--
-- Constraints for table `productdetail`
--
ALTER TABLE `productdetail`
  ADD CONSTRAINT `productdetail_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ID`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `staff` (`ID`);

--
-- Constraints for table `slider`
--
ALTER TABLE `slider`
  ADD CONSTRAINT `slider_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `product` (`ID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Role`) REFERENCES `role` (`ID`);

--
-- Constraints for table `topping`
--
ALTER TABLE `topping`
  ADD CONSTRAINT `topping_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;