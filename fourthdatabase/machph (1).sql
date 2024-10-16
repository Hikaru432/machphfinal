-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2024 at 08:20 AM
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

--
-- Dumping data for table `accomplishtask`
--

INSERT INTO `accomplishtask` (`id`, `user_id`, `progress_percentage`, `car_id`, `mechanic_id`, `progressing`, `progressingpercentage`, `nameprogress`) VALUES
(124, 116, 46.00, 24, 5, 'Valve Train, Timing Chain or Belt', '100%', 'Mechanical Issues'),
(125, 116, 46.00, 24, 5, 'Oil Leaks, Oil Consumptionl, Oil Contamination', '100%', 'Oil'),
(126, 116, 53.00, 24, 5, 'Air Filter, Fuel Injection', '67%', 'Fuel and Air intake System');

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

--
-- Dumping data for table `approvals`
--

INSERT INTO `approvals` (`id`, `user_id`, `car_id`, `status`, `reason`, `timestamp`, `mechanic_id`) VALUES
(163, 116, 24, 1, '', '2024-10-15 09:49:55', 5);

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

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignment_id`, `user_id`, `car_id`, `mechanic_id`) VALUES
(795, 116, 24, 5);

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

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `date`, `created_at`, `booking_date`, `car_id`, `companyname`) VALUES
(28, 110, '2024-10-14', '2024-10-13 05:53:58', 1, 22, 'Honda Motorcycle'),
(29, 115, '2024-10-15', '2024-10-14 22:17:37', 1, 23, 'Hikaru Autoshop'),
(30, 116, '2024-10-16', '2024-10-15 09:49:02', 1, 24, 'Honda Motorcycle');

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

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `plateno`, `carmodel`, `year`, `bodyno`, `enginecc`, `gas`, `user_id`, `created_at`, `manufacturer_id`, `added_at`, `color`, `companyid`) VALUES
(22, '23e2', 'TMX Supremo 150', 2024, 'qr3q1r3', 150, 'Premium', 110, '2024-10-13 05:53:22', 9, '2024-10-13 05:53:22', 'Red', 2),
(23, '23e23d', 'Raider R150', 2020, 'c3c', 150, 'Regular', 115, '2024-10-14 22:16:30', 10, '2024-10-14 22:16:30', 'Red', 1),
(24, '12e12e', 'Skydrive Sport', 2020, '21e1', 170, 'Regular', 116, '2024-10-15 09:48:22', 10, '2024-10-15 09:48:22', 'red', 2);

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
(834, '24', 'Engine Overhaul', 'Valve Train', NULL, 5, 116),
(835, '24', 'Engine Overhaul', 'Timing Chain or Belt', NULL, 5, 116),
(836, '24', 'Engine Low Power', 'Fuel Injection', NULL, 5, 116),
(837, '24', 'Engine Low Power', 'Air Filter', NULL, 5, 116),
(838, '24', 'Engine Low Power', 'Throttle Body', NULL, 5, 116),
(839, '24', 'Battery', 'Battery Age', NULL, 5, 116),
(840, '24', 'Battery', 'Overcharging or Undercharging', NULL, 5, 116),
(841, '24', 'Battery', 'Corrosion', NULL, 5, 116),
(842, '24', 'Light', 'Faulty Bulbs', NULL, 5, 116),
(843, '24', 'Light', 'Inspect fuses', NULL, 5, 116),
(844, '24', 'Oil', 'Oil Leaks', NULL, 5, 116),
(845, '24', 'Oil', 'Oil Consumptionl', NULL, 5, 116),
(846, '24', 'Oil', 'Oil Contamination', NULL, 5, 116);

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
  `product_image` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `system` enum('Engine system','Maintenance system') DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `barcode`, `item_name`, `category`, `date_arrival`, `selling_price`, `original_price`, `profit`, `product_image`, `quantity`, `system`, `companyid`) VALUES
(20, '23232', 'Battery', 'It works based on the electrochemical reaction between lead and sulfuric acid.', '2024-05-22', 2421.00, 2000.00, 421.00, 'uploaded_img/battery.jpg', 11, 'Maintenance system', 1),
(21, '32423', 'Piston', ' acts as a movable end of the combustion chamber', '2024-05-20', 2232.00, 321.00, 1911.00, 'uploaded_img/piston1.jpg', 7, 'Engine system', 1),
(22, '231', 'Head light', 'efwefwef', '2024-05-30', 1232.00, 100.00, 1132.00, 'uploaded_img/Headlight-H21-E.jpg', 2, 'Maintenance system', 2);

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

--
-- Dumping data for table `repairrecord`
--

INSERT INTO `repairrecord` (`id`, `category`, `checkbox_value`, `quantity`, `user_id`, `car_id`, `other_product`, `mechanic_id`) VALUES
(209, 'Mechanical Issues', 'Cylinder Liner', 3, 116, 24, '', 5),
(210, 'Mechanical Issues', 'Piston Rings', 2, 116, 24, '', 5),
(211, 'Mechanical Issues', 'Connecting Rod', 2, 116, 24, '', 5),
(212, 'Mechanical Issues', 'Valves', 2, 116, 24, '', 5),
(213, 'Mechanical Issues', 'Timing Chain/Built', 2, 116, 24, '', 5),
(214, 'Mechanical Issues', 'Valve Springs', 2, 116, 24, '', 5),
(215, 'Battery', 'Battery Load Test', 0, 116, 24, '', 5),
(216, 'Battery', 'Charging System Inspection', 2, 116, 24, '', 5),
(217, 'Battery', 'Battery Tender or Trickle Charger', 2, 116, 24, '', 5);

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

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`serviceno`, `eo`, `elp`, `ep`, `battery`, `light`, `oil`, `water`, `brake`, `air`, `gas`, `tire`, `user_id`, `car_id`, `companyid`) VALUES
(220, '1', '2', NULL, '2', '2', '2', '3', '1', '1', '1', '1', 116, 24, 2);

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
  `image` varchar(100) NOT NULL,
  `barangay` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `municipality` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `companyid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `firstname`, `middlename`, `lastname`, `homeaddress`, `email`, `password`, `image`, `barangay`, `province`, `municipality`, `zipcode`, `role`, `companyid`) VALUES
(116, 'rexey', 'rexey', 'rexey', 'rexey', 'Brgy. Toril Road', 'rexey@gmail.com', '9a648d8f972747af7a48f5d69a0c42f1', 'rimuru tempest.jpg', 'talomo', 'Davao Region', 'Davao city', '8000', 'user', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `approvals`
--
ALTER TABLE `approvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=796;

--
-- AUTO_INCREMENT for table `autoshop`
--
ALTER TABLE `autoshop`
  MODIFY `companyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `diagnose`
--
ALTER TABLE `diagnose`
  MODIFY `repairid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=847;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `repairrecord`
--
ALTER TABLE `repairrecord`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `salesreport`
--
ALTER TABLE `salesreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `serviceno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT for table `servicebilling`
--
ALTER TABLE `servicebilling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_model`
--
ALTER TABLE `car_model`
  ADD CONSTRAINT `car_model_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
