-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2018 at 08:38 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ujjwal`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_details`
--

CREATE TABLE `account_details` (
  `emp_id` varchar(255) NOT NULL,
  `bank` text NOT NULL,
  `account_no` int(11) NOT NULL,
  `account_holder_name` text NOT NULL,
  `ifsc_code` varchar(20) NOT NULL,
  `pan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `confirmation`
--

CREATE TABLE `confirmation` (
  `order_id` varchar(255) NOT NULL,
  `delivery_id` varchar(255) NOT NULL,
  `seller_id` varchar(255) NOT NULL,
  `seller_conf` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_boy_conf` tinyint(1) NOT NULL DEFAULT '0',
  `customer_conf` tinyint(1) NOT NULL DEFAULT '0',
  `payment_mode` varchar(255) NOT NULL DEFAULT 'Online'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_wallet`
--

CREATE TABLE `delivery_boy_wallet` (
  `order_id` varchar(255) NOT NULL,
  `emp_id` varchar(255) NOT NULL,
  `emp_amount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `main_wallet`
--

CREATE TABLE `main_wallet` (
  `order_id` varchar(255) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `seller_amount` int(11) NOT NULL,
  `delivery_boy_amount` int(11) NOT NULL,
  `company_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `emp_id` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `mobile` int(10) NOT NULL,
  `alt_mobile` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `aadhar` varchar(20) NOT NULL,
  `verification` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seller_details`
--

CREATE TABLE `seller_details` (
  `id` int(11) NOT NULL,
  `seller_id` varchar(25) NOT NULL,
  `location_lati` varchar(20) DEFAULT NULL,
  `location_longi` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet`
--

CREATE TABLE `seller_wallet` (
  `order_id` varchar(255) NOT NULL,
  `seller_id` varchar(255) NOT NULL,
  `seller_amount` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `confirmation`
--
ALTER TABLE `confirmation`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `delivery_boy_wallet`
--
ALTER TABLE `delivery_boy_wallet`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `main_wallet`
--
ALTER TABLE `main_wallet`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `aadhar` (`aadhar`);

--
-- Indexes for table `seller_details`
--
ALTER TABLE `seller_details`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `seller_wallet`
--
ALTER TABLE `seller_wallet`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery_boy_wallet`
--
ALTER TABLE `delivery_boy_wallet`
  ADD CONSTRAINT `delivery_boy_wallet_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `main_wallet` (`order_id`);

--
-- Constraints for table `main_wallet`
--
ALTER TABLE `main_wallet`
  ADD CONSTRAINT `main_wallet_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `confirmation` (`order_id`);

--
-- Constraints for table `seller_wallet`
--
ALTER TABLE `seller_wallet`
  ADD CONSTRAINT `seller_wallet_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `main_wallet` (`order_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
