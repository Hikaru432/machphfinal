-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2024 at 12:22 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

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
(131, 102, 8, 1, '', '2024-05-15 06:30:38', 1),
(132, 102, 9, 1, '', '2024-05-15 06:30:53', 1),
(133, 103, 10, 1, '', '2024-05-21 15:16:35', 2),
(134, 104, 11, 1, '', '2024-05-29 12:07:53', 2),
(136, 105, 12, 1, '', '2024-06-12 13:36:34', 5);

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
(773, 103, 10, 2),
(774, 104, 11, 3),
(775, 103, 10, 5),
(776, 105, 12, 6);

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
(10, 'dsd', 'RS125 Fi', 2020, 'qre3', 125, 'Regular', 103, '2024-05-21 15:14:14', 9, '2024-05-21 15:14:14', 'red', 2),
(11, '1101', 'KRY 200', 2018, 'd234r34', 200, 'Regular', 104, '2024-05-29 12:03:22', 11, '2024-05-29 12:03:22', 'blue', 2),
(12, 'cxc', 'TMX 125 Alpha', 2020, 'sdc', 125, 'Regular', 105, '2024-06-12 13:34:25', 9, '2024-06-12 13:34:25', 'red', 2);

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
(40, 'KRY 200', 11);

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
(11, 'Rusi');

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
(6, 'xs', 'xs', 'xs', 'Purok 3A Lobugan', 'Part-Time', 'Shop Foreman', '2024-06-12 13:35:24', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `detail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `payment_method`, `order_date`, `detail`) VALUES
(24, 103, NULL, NULL, '4653.00', 'cash', '2024-05-21 15:18:21', 0),
(25, 104, NULL, NULL, '4653.00', 'cash', '2024-05-29 12:13:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_date` date NOT NULL DEFAULT curdate(),
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `order_date`, `price`) VALUES
(39, 24, 20, 1, '2024-05-21', '2421.00'),
(40, 24, 21, 1, '2024-05-21', '2232.00'),
(41, 25, 20, 1, '2024-05-29', '2421.00'),
(42, 25, 21, 1, '2024-05-29', '2232.00');

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
(20, '23232', 'Battery', 'It works based on the electrochemical reaction between lead and sulfuric acid.', '2024-05-22', '2421.00', '2000.00', '421.00', 'uploaded_img/battery.jpg', 11, 'Maintenance system', 1),
(21, '32423', 'Piston', ' acts as a movable end of the combustion chamber', '2024-05-20', '2232.00', '321.00', '1911.00', 'uploaded_img/piston1.jpg', 7, 'Engine system', 1),
(22, '231', 'Head light', 'efwefwef', '2024-05-30', '1232.00', '100.00', '1132.00', 'uploaded_img/Headlight-H21-E.jpg', 2, 'Maintenance system', 2);

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `progress_percentage` decimal(5,2) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `mechanic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`id`, `user_id`, `progress_percentage`, `car_id`, `mechanic_id`) VALUES
(24, 103, '100.00', 10, 2),
(25, 103, '50.00', 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `repair`
--

CREATE TABLE `repair` (
  `repairid` int(11) NOT NULL,
  `plateno` varchar(255) DEFAULT NULL,
  `problem` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repair`
--

INSERT INTO `repair` (`repairid`, `plateno`, `problem`, `diagnosis`, `remarks`, `mechanic_id`, `user_id`) VALUES
(755, '10', 'Engine Overhaul', 'Piston and Piston Rings', NULL, 2, 103),
(756, '10', 'Battery', 'Battery Age', NULL, 2, 103),
(757, '10', 'Oil', 'Oil Contamination', NULL, 2, 103),
(758, '10', 'Gas', 'Fuel Pump Failure', NULL, 2, 103),
(759, '11', 'Engine Overhaul', 'Piston and Piston Rings', NULL, 2, 104),
(760, '11', 'Engine Overhaul', 'Timing Chain or Belt', NULL, 2, 104),
(761, '11', 'Light', 'Inspect fuses', NULL, 2, 104),
(762, '10', 'Engine Overhaul', 'Piston and Piston Rings', NULL, 5, 103),
(763, '10', 'Battery', 'Battery Age', NULL, 5, 103),
(764, '12', 'Engine Overhaul', 'Valve Train', NULL, 5, 105),
(765, '12', 'Engine Low Power', 'Air Filter', NULL, 5, 105),
(766, '12', 'Battery', 'Battery Age', NULL, 5, 105);

-- --------------------------------------------------------

--
-- Table structure for table `selected_checkboxes`
--

CREATE TABLE `selected_checkboxes` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `checkbox_value` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `other_product` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `selected_checkboxes`
--

INSERT INTO `selected_checkboxes` (`id`, `category`, `checkbox_value`, `quantity`, `user_id`, `car_id`, `other_product`) VALUES
(148, 'Mechanical Issues', 'Cylinder Liner', 1, 103, 10, NULL),
(149, 'Mechanical Issues', 'Piston', 2, 103, 10, NULL),
(150, 'Battery', 'Battery Replacement', 0, 103, 10, NULL),
(151, 'Oil', 'Seal Replacement', 2, 103, 10, NULL),
(152, 'Gas', 'Fuel Tank Replacement', 2, 103, 10, NULL),
(153, 'Mechanical Issues', 'Cylinder Liner', 4, 104, 11, NULL),
(154, 'Mechanical Issues', 'Piston', 3, 104, 11, NULL),
(155, 'Mechanical Issues', 'Timing Belt', 3, 104, 11, NULL),
(156, 'Light', 'Bulb Socket Cleaning', 3, 104, 11, NULL),
(157, 'Light', 'Bulb Socket Cleaning', 2, 103, 10, NULL),
(158, 'Mechanical Issues', 'Cylinder Liner', 2, 105, 12, NULL),
(159, 'Mechanical Issues', 'Piston', 1, 105, 12, NULL);

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
(199, '1', NULL, NULL, '3', '1', '2', '1', '1', '1', '2', '1', 103, 10, 2),
(200, '1', NULL, NULL, '1', '3', '1', '1', '1', '1', '1', '1', 104, 11, 2),
(201, '1', '2', NULL, '2', '1', '1', '1', '1', '1', '1', '1', 105, 12, 2);

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
(103, 'x', 'x', 'x', 'x', 'x', 'x@gmail.com', '9dd4e461268c8034f5c8564e155c67a6', '1e5f5db708b24238c9d6573ab4e8af0b.jpg', 'x', 'x', 'x', 'x', 'user', 2),
(104, 'japet', 'japet', 'japet', 'japet', 'japet', 'japet@gmail.com', 'e1585642ed899cb01521f491fdf26745', '6cb72185e496ca2cbe72ae907e02f6ba.jpg', 'japet', 'japet', 'japet', 'japet', 'user', 2),
(105, 'love', 'love', 'love', 'love', 'love', 'love@gmail.com', 'b5c0b187fe309af0f4d35982fd961d7e', '526a67c0fd92fea4410a809190b32828.jpg', 'love', 'love', 'love', 'love', 'user', 2);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `repair`
--
ALTER TABLE `repair`
  ADD PRIMARY KEY (`repairid`);

--
-- Indexes for table `selected_checkboxes`
--
ALTER TABLE `selected_checkboxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`serviceno`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `fk_companyid` (`companyid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approvals`
--
ALTER TABLE `approvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=777;

--
-- AUTO_INCREMENT for table `autoshop`
--
ALTER TABLE `autoshop`
  MODIFY `companyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mechanic`
--
ALTER TABLE `mechanic`
  MODIFY `mechanic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `repair`
--
ALTER TABLE `repair`
  MODIFY `repairid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767;

--
-- AUTO_INCREMENT for table `selected_checkboxes`
--
ALTER TABLE `selected_checkboxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `serviceno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

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
