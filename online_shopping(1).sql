-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2015 at 01:36 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CATEGORY_ID` int(11) NOT NULL,
  `CATEGORY_NAME` varchar(300) NOT NULL,
  `CATEGORY_DESCRIPTION` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CATEGORY_ID`, `CATEGORY_NAME`, `CATEGORY_DESCRIPTION`) VALUES
(1, 'BAKERY', 'This is a Bakery Description!!!Yes');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(128) NOT NULL,
  `FIRST_NAME` varchar(300) DEFAULT NULL,
  `LAST_NAME` varchar(300) NOT NULL,
  `EMAIL` varchar(300) NOT NULL,
  `ADDRESS` varchar(500) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  `PHONE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CUSTOMER_ID`, `USER_NAME`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `ADDRESS`, `CITY`, `PASSWORD`, `PHONE`) VALUES
(1, 'mujtahid', 'Mujtahid', 'Akon', 'mujtahid.akon@gmail.com', NULL, 'Dhaka', '81dc9bdb52d04dc20036dbd8313ed055', NULL),
(2, 'rashed', NULL, 'Rashed', 'rashed@gmail.com', NULL, 'Rajshahi', '827ccb0eea8a706c4c34a16891f84e7b', NULL),
(3, 'firoz', 'Firoz', 'Ahammed', 'firoz@gmail.com', NULL, NULL, '81dc9bdb52d04dc20036dbd8313ed055', NULL),
(4, 'abcd', 'abcd', 'efg', 'abcd.efg@gmail.com', NULL, NULL, '81dc9bdb52d04dc20036dbd8313ed055', NULL),
(6, 'tariq', 'tariq', 'adnan', 'tariq@gmail.com', NULL, NULL, '81dc9bdb52d04dc20036dbd8313ed055', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `OUTLET_ID` int(11) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  `FIRST_NAME` varchar(300) DEFAULT NULL,
  `LAST_NAME` varchar(300) DEFAULT NULL,
  `DESIGNATION` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(300) NOT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(500) DEFAULT NULL,
  `SALARY` double DEFAULT NULL,
  `HIRE_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EMPLOYEE_ID`, `OUTLET_ID`, `PASSWORD`, `FIRST_NAME`, `LAST_NAME`, `DESIGNATION`, `EMAIL`, `PHONE`, `ADDRESS`, `SALARY`, `HIRE_DATE`) VALUES
(1, 1, '81dc9bdb52d04dc20036dbd8313ed055', NULL, 'admin', 'admin', 'admin@localhost.com', NULL, NULL, 10000, '2014-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_orders`
--

CREATE TABLE `inventory_orders` (
  `INV_ORDER_ID` int(11) NOT NULL,
  `OUTLET_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `AMOUNT` double NOT NULL,
  `DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ORDER_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  `ORDER_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `STATUS` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `outlets`
--

CREATE TABLE `outlets` (
  `OUTLET_ID` int(11) NOT NULL,
  `OUTLET_NAME` varchar(300) NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `outlets`
--

INSERT INTO `outlets` (`OUTLET_ID`, `OUTLET_NAME`, `DESCRIPTION`) VALUES
(1, 'AJIMPUR', 'This is Ajimpur outlet');

-- --------------------------------------------------------

--
-- Table structure for table `price_history`
--

CREATE TABLE `price_history` (
  `PRICE_HISTORY_ID` int(11) NOT NULL,
  `OUTLET_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `PRICE` double NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `PRODUCT_ID` int(11) NOT NULL,
  `OUTLET_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  `SUB_CAT_ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(300) NOT NULL,
  `UNIT_QUANTITY` double DEFAULT NULL,
  `BUY_UNIT_PRICE` double NOT NULL,
  `SELL_UNIT_PRICE` double NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `PRODUCT_IN_STOCK` double NOT NULL,
  `PRODUCT_VENDOR` varchar(300) DEFAULT NULL,
  `RATING` double DEFAULT '0',
  `IMAGE` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`PRODUCT_ID`, `OUTLET_ID`, `CATEGORY_ID`, `SUB_CAT_ID`, `PRODUCT_NAME`, `UNIT_QUANTITY`, `BUY_UNIT_PRICE`, `SELL_UNIT_PRICE`, `DESCRIPTION`, `PRODUCT_IN_STOCK`, `PRODUCT_VENDOR`, `RATING`, `IMAGE`) VALUES
(1, 1, 1, 1, 'PRAN FUN BITE LAYER CAKE BANANA 25GM', 1, 8, 10, 'This is a Banana Cake Description!!!', 100, 'Whow Knows!!!', 3, 'demo.jpg'),
(2, 1, 1, 1, 'ORION CUSTARD PREM. SOFT CAKE 276GM', 1, 400, 440, 'This is a Soft Cake Description', 120, 'I Don&#039;t Know', 4, 'demo.jpg'),
(3, 1, 1, 2, 'RAMLY CHICKEN BURGER 420GM', 1, 265, 275, 'This is a product Description', 10, 'PRODUCT_VENDOR', 5, 'product_1.jpg'),
(4, 1, 1, 2, 'RAMLY FISH BURGER 650GM', 1, 390, 405, 'DESCRIPTION', 10, 'PRODUCT_VENDOR', 3, 'product_1.jpg'),
(5, 1, 1, 2, 'CROWN FARMS FILO PASTRY SHEET 500G', 1, 190, 200, 'DESCRIPTION', 5, 'PRODUCT_VENDOR', 4, 'product_1.jpg'),
(6, 1, 1, 2, 'DOUX CHICKEN BURGER 6PCS 310GM', 1, 243, 253, 'DESCRIPTION', 20, 'PRODUCT_VENDOR', 3.5, 'product_1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products_ordered`
--

CREATE TABLE `products_ordered` (
  `PRODUCT_ID` int(11) NOT NULL,
  `OUTLET_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `QUANTITY` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `SUB_CAT_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  `NAME` varchar(300) NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`SUB_CAT_ID`, `CATEGORY_ID`, `NAME`, `DESCRIPTION`) VALUES
(1, 1, 'CAKE', 'This is Cake Description!!!'),
(2, 1, 'snacks', 'This is a SUB CATEGORY DESCRIPTION');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CATEGORY_ID`),
  ADD UNIQUE KEY `CATEGORY_NAME` (`CATEGORY_NAME`),
  ADD UNIQUE KEY `CATEGORY_ID` (`CATEGORY_ID`),
  ADD UNIQUE KEY `CATEGORY_ID_2` (`CATEGORY_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CUSTOMER_ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `USER_NAME` (`USER_NAME`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD KEY `OUTLET_ID` (`OUTLET_ID`);

--
-- Indexes for table `inventory_orders`
--
ALTER TABLE `inventory_orders`
  ADD PRIMARY KEY (`INV_ORDER_ID`),
  ADD KEY `OUTLET_ID` (`OUTLET_ID`),
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`EMPLOYEE_ID`,`ORDER_ID`),
  ADD KEY `ORDER_ID` (`ORDER_ID`);

--
-- Indexes for table `outlets`
--
ALTER TABLE `outlets`
  ADD PRIMARY KEY (`OUTLET_ID`),
  ADD UNIQUE KEY `OUTLET_NAME` (`OUTLET_NAME`);

--
-- Indexes for table `price_history`
--
ALTER TABLE `price_history`
  ADD PRIMARY KEY (`PRICE_HISTORY_ID`),
  ADD KEY `OUTLET_ID` (`OUTLET_ID`),
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`PRODUCT_ID`,`OUTLET_ID`),
  ADD KEY `SUB_CAT_ID` (`SUB_CAT_ID`),
  ADD KEY `CATEGORY_ID` (`CATEGORY_ID`),
  ADD KEY `OUTLET_ID` (`OUTLET_ID`);

--
-- Indexes for table `products_ordered`
--
ALTER TABLE `products_ordered`
  ADD PRIMARY KEY (`PRODUCT_ID`,`OUTLET_ID`,`ORDER_ID`),
  ADD KEY `OUTLET_ID` (`OUTLET_ID`),
  ADD KEY `ORDER_ID` (`ORDER_ID`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`SUB_CAT_ID`,`CATEGORY_ID`),
  ADD KEY `CATEGORY_ID` (`CATEGORY_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EMPLOYEE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `inventory_orders`
--
ALTER TABLE `inventory_orders`
  MODIFY `INV_ORDER_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `outlets`
--
ALTER TABLE `outlets`
  MODIFY `OUTLET_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `price_history`
--
ALTER TABLE `price_history`
  MODIFY `PRICE_HISTORY_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `SUB_CAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`OUTLET_ID`) REFERENCES `outlets` (`OUTLET_ID`);

--
-- Constraints for table `inventory_orders`
--
ALTER TABLE `inventory_orders`
  ADD CONSTRAINT `inventory_orders_ibfk_1` FOREIGN KEY (`OUTLET_ID`) REFERENCES `products` (`OUTLET_ID`),
  ADD CONSTRAINT `inventory_orders_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`OUTLET_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`CUSTOMER_ID`);

--
-- Constraints for table `order_status`
--
ALTER TABLE `order_status`
  ADD CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employees` (`EMPLOYEE_ID`),
  ADD CONSTRAINT `order_status_ibfk_2` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`);

--
-- Constraints for table `price_history`
--
ALTER TABLE `price_history`
  ADD CONSTRAINT `price_history_ibfk_1` FOREIGN KEY (`OUTLET_ID`) REFERENCES `products` (`OUTLET_ID`),
  ADD CONSTRAINT `price_history_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`OUTLET_ID`) REFERENCES `outlets` (`OUTLET_ID`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `sub_categories` (`CATEGORY_ID`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`SUB_CAT_ID`) REFERENCES `sub_categories` (`SUB_CAT_ID`);

--
-- Constraints for table `products_ordered`
--
ALTER TABLE `products_ordered`
  ADD CONSTRAINT `products_ordered_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`),
  ADD CONSTRAINT `products_ordered_ibfk_2` FOREIGN KEY (`OUTLET_ID`) REFERENCES `products` (`OUTLET_ID`),
  ADD CONSTRAINT `products_ordered_ibfk_3` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`);

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `categories` (`CATEGORY_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
