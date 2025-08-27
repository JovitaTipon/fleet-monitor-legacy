-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2025 at 08:58 AM
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
-- Database: `onlinecarbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `user_type` VARCHAR(50) NOT NULL,
  `login_time` DATETIME NOT NULL,
  `createdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `login_logs`
INSERT INTO `login_logs` (`id`, `user_id`, `user_type`, `login_time`, `createdate`) VALUES
(1, 0, 'admin', '2025-08-11 03:18:06', '2025-08-11 00:00:00'),
(2, 0, 'user',  '2025-08-11 03:16:40', '2025-08-11 00:00:00');


-- --------------------------------------------------------

--
-- Table structure for table `tms_admin`
--

CREATE TABLE `tms_admin` (
  `a_id` int(11) NOT NULL,
  `a_name` varchar(200) NOT NULL,
  `a_email` varchar(200) NOT NULL,
  `a_pwd` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_admin`
--

INSERT INTO `tms_admin` (`a_id`, `a_name`, `a_email`, `a_pwd`) VALUES
(3, '', 'admin@gmail.com', '0192023a7bbd73250516f069df18b500');

-- --------------------------------------------------------

--
-- Table structure for table `tms_bookings`
--

CREATE TABLE `tms_bookings` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `driver_id` int(10) UNSIGNED DEFAULT NULL,
  `vehicle_id` int(10) UNSIGNED DEFAULT NULL,
  `pickup_point` varchar(255) NOT NULL,
  `dropoff_point` varchar(255) NOT NULL,
  `pickup_lat` decimal(10,7) DEFAULT NULL,
  `pickup_lng` decimal(10,7) DEFAULT NULL,
  `dropoff_lat` decimal(10,7) DEFAULT NULL,
  `dropoff_lng` decimal(10,7) DEFAULT NULL,
  `contact_phone` varchar(30) DEFAULT NULL,
  `seats_reserved` tinyint(3) UNSIGNED DEFAULT 1,
  `scheduled_at` datetime DEFAULT NULL,
  `booking_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','accepted','declined','cancelled','completed') NOT NULL DEFAULT 'pending',
  `payment_status` enum('unpaid','paid','partial') NOT NULL DEFAULT 'unpaid',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tms_bookings`
--

INSERT INTO `tms_bookings` (`booking_id`, `client_id`, `driver_id`, `vehicle_id`, `pickup_point`, `dropoff_point`, `pickup_lat`, `pickup_lng`, `dropoff_lat`, `dropoff_lng`, `contact_phone`, `seats_reserved`, `scheduled_at`, `booking_created_at`, `status`, `payment_status`, `notes`) VALUES
(1, 2, 5, 3, '100 Main St, Town', 'Airport Terminal 1', NULL, NULL, NULL, NULL, '+639171234567', 3, '2025-08-12 14:00:00', '2025-08-11 20:18:51', 'pending', 'unpaid', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tms_feedback`
--

CREATE TABLE `tms_feedback` (
  `f_id` int(11) NOT NULL,
  `f_uname` varchar(200) NOT NULL,
  `f_content` longtext NOT NULL,
  `f_status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_feedback`
--

INSERT INTO `tms_feedback` (`f_id`, `f_uname`, `f_content`, `f_status`) VALUES
(1, 'Elliot Gape', 'This is a demo feedback text. This is a demo feedback text. This is a demo feedback text.', 'Published'),
(2, 'Mark L. Anderson', 'Sample Feedback Text for testing! Sample Feedback Text for testing! Sample Feedback Text for testing!', 'Published'),
(3, 'Liam Moore ', 'test number 3', '');

-- --------------------------------------------------------

--
-- Table structure for table `tms_pwd_resets`
--

CREATE TABLE `tms_pwd_resets` (
  `r_id` int(11) NOT NULL,
  `r_email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_pwd_resets`
--

INSERT INTO `tms_pwd_resets` (`r_id`, `r_email`) VALUES
(2, 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tms_syslogs`
--

CREATE TABLE `tms_syslogs` (
  `l_id` int(11) NOT NULL,
  `u_id` varchar(200) NOT NULL,
  `u_email` varchar(200) NOT NULL,
  `u_ip` varbinary(200) NOT NULL,
  `u_city` varchar(200) NOT NULL,
  `u_country` varchar(200) NOT NULL,
  `pickup_point` text NOT NULL,
  `dropoff_point` text NOT NULL,
  `driver_id` text NOT NULL,
  `booking_date` text NOT NULL,
  `u_logintime` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tms_user`
--

CREATE TABLE `tms_user` (
  `u_id`              INT(11) NOT NULL AUTO_INCREMENT,
  `u_fname`           VARCHAR(200) NOT NULL,
  `u_lname`           VARCHAR(200) NOT NULL,
  `u_car_pax`         TEXT NOT NULL,
  `u_phone`           VARCHAR(200) NOT NULL,
  `u_addr`            VARCHAR(200) NOT NULL,
  `u_category`        VARCHAR(200) NOT NULL,
  `u_email`           VARCHAR(200) NOT NULL,
  `u_pwd`             VARCHAR(50)  NOT NULL, 
  `u_car_type`        VARCHAR(200) NOT NULL,
  `u_car_driver`      TEXT NOT NULL,
  `u_car_regno`       VARCHAR(200) NOT NULL,
  `u_car_bookdate`    VARCHAR(200) NOT NULL,
  `u_car_pickup`      VARCHAR(250) NOT NULL,
  `u_car_destination` VARCHAR(250) NOT NULL,
  `u_car_book_status` VARCHAR(200) NOT NULL,
  `u_car_date`        TEXT NOT NULL,
  `u_car_time`        TEXT NOT NULL,

  -- FIXED: must be DATETIME (or TIMESTAMP) to use CURRENT_TIMESTAMP
  `createdate`        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_car_createdate`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


--
-- Dumping data for table `tms_user`
--

INSERT INTO `tms_user` (`u_id`, `u_fname`, `u_lname`, `u_car_pax`, `u_phone`, `u_addr`, `u_category`, `u_email`, `u_pwd`, `u_car_type`, `u_car_driver`, `u_car_regno`, `u_car_bookdate`, `u_car_pickup`, `u_car_destination`, `u_car_book_status`, `u_car_date`, `u_car_time`, `createdate`, `u_car_createdate`) VALUES
(13, 'Clint', '01', '', '01600000000', 'Bogura,Bangladesh', 'User', 'clint@gmail.com', '123456', 'Sedan', '', 'CA2077', '2025-08-03', '', '', 'Pending', '', '', 2147483647, 2147483647),
(14, 'gerald', 'dela cruz', '', '12345678901', '9593 orchids str. pineda subdivision dau mabalacat city', 'Driver', 'delacruzgerald042088@gmail.com', '$2y$10$oU78lmLtAi7zuHLdu9/3CeA9pzypCuNnYuxVbI0uMr2', '', '', '', '', '', '', '', '', '', 2147483647, 2147483647),
(15, 'gerald', 'delacruz', '', '12345678901', '9593 orchids str. pineda subdivision dau mabalacat city', 'Driver', 'delacruzgerald042088@gmail.com', '$2y$10$j3G4RiXGLgKw69XjXdDe9uhdlXF2STn.9rDr4gfTtAY', '', '', '', '', '', '', '', '', '', 2147483647, 2147483647),
(16, 'driver2', 'last2', '', '09123456789', 'driver 00000', 'Driver', 'driver2@gmail.com', '$2y$10$u1NJBtogEoo1Vnvz.OTUxek63mHQR7ciInHOriglyuN', '', '', '', '', '', '', '', '', '', 2147483647, 2147483647),
(17, 'paul', '', '4', '', '', 'User', '', '$2y$10$i00yGJvfrmFyLgu7OGcMpu0MdT4sPFY3qcI2sEIh.6U', 'sedan', 'driver2', 'CA1234', '', 'no way', 'no destination', '', '2025-08-08', '04:47', 2147483647, 2147483647),
(18, 'geral', 'ddelacruz', '', '09222222', '22 street', 'User', 'client@gmail.com', '62608e08adc29a8d6dbc9754e659f125', '', '', '', '', '', '', '', '', '', 2147483647, 2147483647),
(19, 'three', 'four', '', '0945236548', 'pineda subd', 'User', 'three@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '', '', '', '', '', '', '', '', '', 2147483647, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `tms_user_add_driver`
--

CREATE TABLE `tms_user_add_driver` (
  `d_u_id`       INT(11) NOT NULL AUTO_INCREMENT,
  `u_id`         INT(50) NOT NULL,
  `u_fname`      VARCHAR(50) NOT NULL,
  `u_lname`      VARCHAR(50) NOT NULL,
  `u_phone`      VARCHAR(50) NOT NULL,
  `u_addr`       TEXT NOT NULL,
  `u_car_type`   TEXT NOT NULL,
  `u_car_regno`  TEXT NOT NULL,
  `u_car_bookdate` TEXT NOT NULL,
  `u_car_book_status` TEXT NOT NULL,
  `u_category`   TEXT NOT NULL,
  `u_email`      TEXT NOT NULL,
  `u_pwd`        TEXT NOT NULL,
  `createdate`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`d_u_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


--
-- Dumping data for table `tms_user_add_driver`
--

INSERT INTO `tms_user_add_driver` (`d_u_id`, `u_id`, `u_fname`, `u_lname`, `u_phone`, `u_addr`, `u_car_type`, `u_car_regno`, `u_car_bookdate`, `u_car_book_status`, `u_category`, `u_email`, `u_pwd`, `createdate`) VALUES
(1, 0, 'gerald', 'dela cruz', 2147483647, '9593 orchids str. pineda subdivision dau mabalacat city', '', '', '', '', 'Driver', 'delacruzgerald042088@gmail.com', '67a74306b06d0c01624fe0d0249a570f4d093747', '2025-08-02'),
(2, 0, 'gerald', 'delacruz', 2147483647, '9593 orchids str. pineda subdivision dau mabalacat city', '', '', '', '', 'Driver', 'delacruzgerald042088@gmail.com', '67a74306b06d0c01624fe0d0249a570f4d093747', '2025-08-02'),
(3, 0, 'driver2', 'last2', 2147483647, 'driver 00000', '', '', '', '', 'Driver', 'driver2@gmail.com', '67a74306b06d0c01624fe0d0249a570f4d093747', '2025-08-07');

-- --------------------------------------------------------

--
-- Table structure for table `tms_vehicle`
--

CREATE TABLE `tms_vehicle` (
  `v_id` int(11) NOT NULL,
  `v_name` varchar(200) NOT NULL,
  `v_reg_no` varchar(200) NOT NULL,
  `v_pass_no` varchar(200) NOT NULL,
  `v_driver` varchar(200) NOT NULL,
  `v_category` varchar(200) NOT NULL,
  `v_dpic` varchar(200) NOT NULL,
  `v_status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tms_vehicle`
--

INSERT INTO `tms_vehicle` (`v_id`, `v_name`, `v_reg_no`, `v_pass_no`, `v_driver`, `v_category`, `v_dpic`, `v_status`) VALUES
(3, 'Euro Bond', 'CA7766', '50', 'Vincent Pelletier', 'Matatu', '', 'Available'),
(4, 'Honda Accord', 'CA2077', '5', 'Joseph Yung', 'Bus', '', 'Booked'),
(5, 'Volkswagen Passat', 'CA1690', '5', 'Jesse Robinson', 'Sedan', 'volkswagen-passat-500.jpg', 'Available'),
(6, 'Nissan Rogue', 'CA1001', '7', 'Demo User', 'SUV', 'Nissan_Rogue_SV_2021.jpg', 'Available'),
(7, 'Subaru Legacy', 'CA7700', '5', 'John Settles', 'Bus', '', 'Available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `login_logs`
  MODIFY `id` INT NOT NULL AUTO_INCREMENT;
--
-- Indexes for table `tms_admin`
--
ALTER TABLE `tms_admin`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `tms_bookings`
--
ALTER TABLE `tms_bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `idx_driver_status_time` (`driver_id`,`status`,`scheduled_at`),
  ADD KEY `idx_client` (`client_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `tms_feedback`
--
ALTER TABLE `tms_feedback`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `tms_pwd_resets`
--
ALTER TABLE `tms_pwd_resets`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `tms_syslogs`
--
ALTER TABLE `tms_syslogs`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `tms_user`
--
ALTER TABLE `tms_user`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `tms_user_add_driver`
--
ALTER TABLE `tms_user_add_driver`
  ADD PRIMARY KEY (`d_u_id`);

--
-- Indexes for table `tms_vehicle`
--
ALTER TABLE `tms_vehicle`
  ADD PRIMARY KEY (`v_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tms_admin`
--
ALTER TABLE `tms_admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tms_bookings`
--
ALTER TABLE `tms_bookings`
  MODIFY `booking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tms_feedback`
--
ALTER TABLE `tms_feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tms_pwd_resets`
--
ALTER TABLE `tms_pwd_resets`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tms_syslogs`
--
ALTER TABLE `tms_syslogs`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tms_user`
--
ALTER TABLE `tms_user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tms_user_add_driver`
--
ALTER TABLE `tms_user_add_driver`
  MODIFY `d_u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tms_vehicle`
--
ALTER TABLE `tms_vehicle`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
