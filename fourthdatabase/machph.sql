-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2024 at 12:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `machph`
--

-- --------------------------------------------------------

--
-- Table structure for table `accomplishtask`
--

CREATE TABLE `accomplishtask` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `progress_percentage` decimal(5,2) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `mechanic_id` int(11) NOT NULL,
  `progressing` varchar(255) DEFAULT NULL,
  `progressingpercentage` varchar(10) DEFAULT NULL,
  `nameprogress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approvals`
--

CREATE TABLE `approvals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `mechanic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignment_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `autoshop`
--

CREATE TABLE `autoshop` (
  `companyid` int(11) NOT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  `companyemail` varchar(255) DEFAULT NULL,
  `companyphonenumber` varchar(15) DEFAULT NULL,
  `streetaddress` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `cpassword` varchar(255) DEFAULT NULL,
  `companyimage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `autoshop`
--

INSERT INTO `autoshop` (`companyid`, `companyname`, `companyemail`, `companyphonenumber`, `streetaddress`, `city`, `region`, `zipcode`, `country`, `cname`, `cpassword`, `companyimage`) VALUES
(1, 'Hikaru Autoshop', 'hikaruautoshop@gmail.com', '09485011228', 'Brgy. Toril Road', 'Davao city', 'Davao Region', '8000', 'Philippines', 'hikaru', 'hikaru', 'uploaded_img__komi_shouko_komi_san_wa_komyushou_desu_drawn_by_takita_takita3411__sample-84df7af5a1a6036f11006a616b97af2b.jpg'),
(2, 'Honda Motorcycle', 'honda@gmail.com', '09493943', 'Toril', 'Davao city', 'Davao del sur', '8000', 'Philippines', 'honda', 'honda', 'uploaded_imghonda-removebg-preview.png');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `booking_date` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `companyname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `plateno` varchar(20) DEFAULT NULL,
  `carmodel` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `bodyno` varchar(50) DEFAULT NULL,
  `enginecc` int(11) DEFAULT NULL,
  `gas` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `manufacturer_id` int(11) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `color` varchar(50) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `car_model`
--

CREATE TABLE `car_model` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `manufacturer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_model`
--

INSERT INTO `car_model` (`id`, `name`, `manufacturer_id`) VALUES
(16, ' Wave 110 Alpha', 9),
(17, 'TMX 125 Alpha', 9),
(18, 'RS125 Fi', 9),
(19, 'TMX Supremo 150', 9),
(20, 'XR150L', 9),
(21, 'Click 150i', 9),
(22, 'CBR150R', 9),
(23, 'CBR500R', 9),
(24, 'Rebel 500', 9),
(25, 'Wave 110 R', 9),
(26, 'XRM125 Motard', 9),
(27, 'Click 125', 9),
(28, 'Raider R150', 10),
(29, 'Smash 115', 10),
(30, 'Raider R150 Fi', 10),
(31, 'Skydrive Sport', 10),
(32, 'GSX-R1000', 10),
(33, 'Gixxer FI', 10),
(34, 'GSX-S1000 ABS', 10),
(35, 'GSX-S750', 10),
(36, 'RM-Z250', 10),
(37, 'SV 650A', 10),
(38, 'RM Z450', 10),
(39, 'bit110', 9),
(40, 'KRY 200', 11),
(41, 'Vios', 12);

-- --------------------------------------------------------

--
-- Table structure for table `diagnose`
--

CREATE TABLE `diagnose` (
  `repairid` int(11) NOT NULL,
  `plateno` varchar(255) DEFAULT NULL,
  `problem` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diagnose`
--

INSERT INTO `diagnose` (`repairid`, `plateno`, `problem`, `diagnosis`, `remarks`, `mechanic_id`, `user_id`) VALUES
(847, '25', 'Engine Overhaul', 'Piston and Piston Rings', NULL, 7, 116),
(848, '25', 'Engine Overhaul', 'Valve Train', NULL, 7, 116),
(849, '25', 'Engine Low Power', 'Fuel Injection', NULL, 7, 116),
(850, '25', 'Engine Low Power', 'Air Filter', NULL, 7, 116),
(851, '25', 'Engine Low Power', 'Throttle Body', NULL, 7, 116),
(852, '25', 'Electrical Problem', 'Coolant Leaks', NULL, 7, 116),
(853, '25', 'Electrical Problem', 'Oil Leaks', NULL, 7, 116),
(854, '25', 'Battery', 'Battery Age', NULL, 7, 116),
(855, '25', 'Battery', 'Overcharging or Undercharging', NULL, 7, 116),
(856, '27', 'Engine Overhaul', 'Piston and Piston Rings', NULL, 5, 122),
(857, '27', 'Engine Overhaul', 'Valve Train', NULL, 5, 122),
(858, '27', 'Engine Low Power', 'Fuel Injection', NULL, 5, 122),
(859, '27', 'Engine Low Power', 'Air Filter', NULL, 5, 122),
(860, '27', 'Battery', 'Battery Age', NULL, 5, 122),
(861, '27', 'Battery', 'Overcharging or Undercharging', NULL, 5, 122),
(862, '27', 'Light', 'Faulty Bulbs', NULL, 5, 122),
(863, '27', 'Light', 'Check wirings', NULL, 5, 122);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `progress_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`) VALUES
(9, 'Honda'),
(10, 'Suzuki'),
(11, 'Rusi'),
(12, 'Toyota');

-- --------------------------------------------------------

--
-- Table structure for table `mechanic`
--

CREATE TABLE `mechanic` (
  `mechanic_id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `employment` varchar(100) DEFAULT NULL,
  `jobrole` varchar(100) DEFAULT NULL,
  `last_progress_saved` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `companyid` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mechanic`
--

INSERT INTO `mechanic` (`mechanic_id`, `firstname`, `middlename`, `lastname`, `address`, `employment`, `jobrole`, `last_progress_saved`, `companyid`, `active`) VALUES
(5, 'q', 'q', 'q', 'q', 'Full-Time', 'Master Technician', '2024-06-02 06:32:24', 2, NULL),
(6, 'xs', 'xs', 'xs', 'Purok 3A Lobugan', 'Part-Time', 'Shop Foreman', '2024-06-12 13:35:24', 2, NULL),
(7, 'vv', 'vv', 'vv', 'vv', 'Temporary', 'Shop Foreman', '2024-08-26 12:14:10', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `date_arrival` date DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL,
  `product_image` longblob DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `system` enum('Engine system','Maintenance system') DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repairrecord`
--

CREATE TABLE `repairrecord` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `checkbox_value` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `other_product` varchar(255) DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesreport`
--

CREATE TABLE `salesreport` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `detail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `serviceno` int(11) NOT NULL,
  `eo` varchar(255) DEFAULT NULL,
  `elp` varchar(255) DEFAULT NULL,
  `ep` varchar(255) DEFAULT NULL,
  `battery` varchar(255) DEFAULT NULL,
  `light` varchar(255) DEFAULT NULL,
  `oil` varchar(255) DEFAULT NULL,
  `water` varchar(255) DEFAULT NULL,
  `brake` varchar(255) DEFAULT NULL,
  `air` varchar(255) DEFAULT NULL,
  `gas` varchar(255) DEFAULT NULL,
  `tire` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `servicebilling`
--

CREATE TABLE `servicebilling` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_date` date NOT NULL DEFAULT curdate(),
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `homeaddress` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` blob DEFAULT NULL,
  `barangay` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `companyid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accomplishtask`
--
ALTER TABLE `accomplishtask`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `approvals`
--
ALTER TABLE `approvals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_car` (`user_id`,`car_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- Indexes for table `autoshop`
--
ALTER TABLE `autoshop`
  ADD PRIMARY KEY (`companyid`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`);

--
-- Indexes for table `diagnose`
--
ALTER TABLE `diagnose`
  ADD PRIMARY KEY (`repairid`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mechanic`
--
ALTER TABLE `mechanic`
  ADD PRIMARY KEY (`mechanic_id`),
  ADD KEY `companyid` (`companyid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repairrecord`
--
ALTER TABLE `repairrecord`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `salesreport`
--
ALTER TABLE `salesreport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`serviceno`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `fk_companyid` (`companyid`);

--
-- Indexes for table `servicebilling`
--
ALTER TABLE `servicebilling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accomplishtask`
--
ALTER TABLE `accomplishtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `approvals`
--
ALTER TABLE `approvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=798;

--
-- AUTO_INCREMENT for table `autoshop`
--
ALTER TABLE `autoshop`
  MODIFY `companyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `diagnose`
--
ALTER TABLE `diagnose`
  MODIFY `repairid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=864;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mechanic`
--
ALTER TABLE `mechanic`
  MODIFY `mechanic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `repairrecord`
--
ALTER TABLE `repairrecord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `salesreport`
--
ALTER TABLE `salesreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `serviceno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `servicebilling`
--
ALTER TABLE `servicebilling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_model`
--
ALTER TABLE `car_model`
  ADD CONSTRAINT `car_model_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`mechanic_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
