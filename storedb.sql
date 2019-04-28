-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 28 أبريل 2019 الساعة 15:28
-- إصدار الخادم: 10.1.30-MariaDB
-- PHP Version: 7.1.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storedb`
--

-- --------------------------------------------------------

--
-- بنية الجدول `app_clients`
--

CREATE TABLE `app_clients` (
  `ClientId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_expenses_categories`
--

CREATE TABLE `app_expenses_categories` (
  `ExpenseId` tinyint(3) UNSIGNED NOT NULL,
  `ExpenseName` varchar(30) NOT NULL,
  `FixedPayment` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_expenses_daily_list`
--

CREATE TABLE `app_expenses_daily_list` (
  `DExpenseId` int(10) UNSIGNED NOT NULL,
  `ExpenseId` tinyint(3) UNSIGNED NOT NULL,
  `Payment` decimal(7,2) NOT NULL,
  `Created` datetime NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_notifications`
--

CREATE TABLE `app_notifications` (
  `NotificationId` int(10) UNSIGNED NOT NULL,
  `Title` varchar(30) NOT NULL,
  `Content` varchar(255) NOT NULL,
  `Type` tinyint(2) NOT NULL,
  `Created` datetime NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL,
  `Seen` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_products_categories`
--

CREATE TABLE `app_products_categories` (
  `CategoryId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Image` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_products_list`
--

CREATE TABLE `app_products_list` (
  `ProductId` int(10) UNSIGNED NOT NULL,
  `CategoryId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Image` varchar(30) DEFAULT NULL,
  `Quantity` smallint(5) UNSIGNED NOT NULL,
  `Price` decimal(6,2) NOT NULL,
  `Unit` tinyint(1) NOT NULL,
  `BarCode` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_purchases_invoices`
--

CREATE TABLE `app_purchases_invoices` (
  `InvoiceId` int(10) UNSIGNED NOT NULL,
  `SupplierId` int(10) UNSIGNED NOT NULL,
  `PaymentType` tinyint(1) NOT NULL,
  `PaymentStatus` tinyint(1) NOT NULL,
  `Created` date NOT NULL,
  `Discount` decimal(8,2) DEFAULT NULL,
  `UserId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_purchases_invoices_details`
--

CREATE TABLE `app_purchases_invoices_details` (
  `Id` int(10) UNSIGNED NOT NULL,
  `ProductId` int(10) UNSIGNED NOT NULL,
  `Quantity` smallint(6) NOT NULL,
  `ProductPrice` decimal(7,2) NOT NULL,
  `InvoiceId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_purchases_invoices_receipts`
--

CREATE TABLE `app_purchases_invoices_receipts` (
  `ReceiptId` int(10) UNSIGNED NOT NULL,
  `InvoiceId` int(10) UNSIGNED NOT NULL,
  `PaymentType` tinyint(1) NOT NULL,
  `PaymentAmount` decimal(8,2) NOT NULL,
  `PaymentLiteral` varchar(60) NOT NULL,
  `BankName` varchar(30) DEFAULT NULL,
  `BankAccountNumber` varchar(30) DEFAULT NULL,
  `CheckNumber` varchar(15) DEFAULT NULL,
  `TransferedTo` varchar(30) DEFAULT NULL,
  `Created` date NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_sales_invoices`
--

CREATE TABLE `app_sales_invoices` (
  `InvoiceId` int(10) UNSIGNED NOT NULL,
  `ClientId` int(10) UNSIGNED NOT NULL,
  `PaymentType` tinyint(1) NOT NULL,
  `PaymentStatus` tinyint(1) NOT NULL,
  `Created` date NOT NULL,
  `Discount` decimal(8,2) DEFAULT NULL,
  `UserId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_sales_invoices_details`
--

CREATE TABLE `app_sales_invoices_details` (
  `Id` int(10) UNSIGNED NOT NULL,
  `ProductId` int(10) UNSIGNED NOT NULL,
  `Quantity` smallint(6) NOT NULL,
  `ProductPrice` decimal(7,2) NOT NULL,
  `InvoiceId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_sales_invoices_receipts`
--

CREATE TABLE `app_sales_invoices_receipts` (
  `ReceiptId` int(10) UNSIGNED NOT NULL,
  `InvoiceId` int(10) UNSIGNED NOT NULL,
  `PaymentType` tinyint(1) NOT NULL,
  `PaymentAmount` decimal(8,2) NOT NULL,
  `PaymentLiteral` varchar(60) NOT NULL,
  `BankName` varchar(30) DEFAULT NULL,
  `BankAccountNumber` varchar(30) DEFAULT NULL,
  `CheckNumber` varchar(15) DEFAULT NULL,
  `TransferedTo` varchar(30) DEFAULT NULL,
  `Created` date NOT NULL,
  `UserId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_suppliers`
--

CREATE TABLE `app_suppliers` (
  `SupplierId` int(10) UNSIGNED NOT NULL,
  `Name` varchar(40) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_users`
--

CREATE TABLE `app_users` (
  `UserId` int(10) UNSIGNED NOT NULL,
  `Username` varchar(12) NOT NULL,
  `Password` char(60) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `SubscriptionDate` date NOT NULL,
  `LastLogin` datetime NOT NULL,
  `GroupId` tinyint(1) UNSIGNED NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `app_users`
--

INSERT INTO `app_users` (`UserId`, `Username`, `Password`, `Email`, `PhoneNumber`, `SubscriptionDate`, `LastLogin`, `GroupId`, `Status`) VALUES
(1, 'admin', '$2a$07$yeNCSNwRpYopOhv0TrrReO0C4Wi7SyOYpdAtAYFfM4w.l4e6Q8jEW', 'admin@hotmail.com', '0100000002222', '2019-04-28', '2019-04-28 15:21:40', 1, 1),
(2, 'sayed', '$2a$07$yeNCSNwRpYopOhv0TrrReOunIisW1b8.JDsNKxyuF3O29C6ouWfCC', 'sayed@hotmail.com', '2454545', '2019-04-28', '2019-04-28 15:24:42', 1, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `app_users_groups`
--

CREATE TABLE `app_users_groups` (
  `GroupId` tinyint(1) UNSIGNED NOT NULL,
  `GroupName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `app_users_groups`
--

INSERT INTO `app_users_groups` (`GroupId`, `GroupName`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- بنية الجدول `app_users_groups_privileges`
--

CREATE TABLE `app_users_groups_privileges` (
  `Id` tinyint(3) UNSIGNED NOT NULL,
  `GroupId` tinyint(1) UNSIGNED NOT NULL,
  `PrivilegeId` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_users_privileges`
--

CREATE TABLE `app_users_privileges` (
  `PrivilegeId` tinyint(3) UNSIGNED NOT NULL,
  `Privilege` varchar(30) NOT NULL,
  `PrivilegeTitle` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- بنية الجدول `app_users_profiles`
--

CREATE TABLE `app_users_profiles` (
  `UserId` int(10) UNSIGNED NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Image` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `app_users_profiles`
--

INSERT INTO `app_users_profiles` (`UserId`, `FirstName`, `LastName`, `Address`, `DOB`, `Image`) VALUES
(1, 'adham', 'allam', NULL, NULL, NULL),
(2, 'sayed', 'allam', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_clients`
--
ALTER TABLE `app_clients`
  ADD PRIMARY KEY (`ClientId`);

--
-- Indexes for table `app_expenses_categories`
--
ALTER TABLE `app_expenses_categories`
  ADD PRIMARY KEY (`ExpenseId`);

--
-- Indexes for table `app_expenses_daily_list`
--
ALTER TABLE `app_expenses_daily_list`
  ADD PRIMARY KEY (`DExpenseId`),
  ADD KEY `ExpenseId` (`ExpenseId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `app_notifications`
--
ALTER TABLE `app_notifications`
  ADD PRIMARY KEY (`NotificationId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `app_products_categories`
--
ALTER TABLE `app_products_categories`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `app_products_list`
--
ALTER TABLE `app_products_list`
  ADD PRIMARY KEY (`ProductId`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Indexes for table `app_purchases_invoices`
--
ALTER TABLE `app_purchases_invoices`
  ADD PRIMARY KEY (`InvoiceId`),
  ADD KEY `SupplierId` (`SupplierId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `app_purchases_invoices_details`
--
ALTER TABLE `app_purchases_invoices_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProductId` (`ProductId`),
  ADD KEY `InvoiceId` (`InvoiceId`);

--
-- Indexes for table `app_purchases_invoices_receipts`
--
ALTER TABLE `app_purchases_invoices_receipts`
  ADD PRIMARY KEY (`ReceiptId`),
  ADD KEY `InvoiceId` (`InvoiceId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `app_sales_invoices`
--
ALTER TABLE `app_sales_invoices`
  ADD PRIMARY KEY (`InvoiceId`),
  ADD KEY `ClientId` (`ClientId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `app_sales_invoices_details`
--
ALTER TABLE `app_sales_invoices_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProductId` (`ProductId`),
  ADD KEY `InvoiceId` (`InvoiceId`);

--
-- Indexes for table `app_sales_invoices_receipts`
--
ALTER TABLE `app_sales_invoices_receipts`
  ADD PRIMARY KEY (`ReceiptId`),
  ADD KEY `InvoiceId` (`InvoiceId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `app_suppliers`
--
ALTER TABLE `app_suppliers`
  ADD PRIMARY KEY (`SupplierId`);

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `GroupId` (`GroupId`);

--
-- Indexes for table `app_users_groups`
--
ALTER TABLE `app_users_groups`
  ADD PRIMARY KEY (`GroupId`);

--
-- Indexes for table `app_users_groups_privileges`
--
ALTER TABLE `app_users_groups_privileges`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `GroupId` (`GroupId`),
  ADD KEY `PrivilegeId` (`PrivilegeId`);

--
-- Indexes for table `app_users_privileges`
--
ALTER TABLE `app_users_privileges`
  ADD PRIMARY KEY (`PrivilegeId`);

--
-- Indexes for table `app_users_profiles`
--
ALTER TABLE `app_users_profiles`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_clients`
--
ALTER TABLE `app_clients`
  MODIFY `ClientId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_expenses_categories`
--
ALTER TABLE `app_expenses_categories`
  MODIFY `ExpenseId` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_expenses_daily_list`
--
ALTER TABLE `app_expenses_daily_list`
  MODIFY `DExpenseId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_notifications`
--
ALTER TABLE `app_notifications`
  MODIFY `NotificationId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_products_categories`
--
ALTER TABLE `app_products_categories`
  MODIFY `CategoryId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_products_list`
--
ALTER TABLE `app_products_list`
  MODIFY `ProductId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_purchases_invoices`
--
ALTER TABLE `app_purchases_invoices`
  MODIFY `InvoiceId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_purchases_invoices_details`
--
ALTER TABLE `app_purchases_invoices_details`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_purchases_invoices_receipts`
--
ALTER TABLE `app_purchases_invoices_receipts`
  MODIFY `ReceiptId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_sales_invoices`
--
ALTER TABLE `app_sales_invoices`
  MODIFY `InvoiceId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_sales_invoices_details`
--
ALTER TABLE `app_sales_invoices_details`
  MODIFY `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_sales_invoices_receipts`
--
ALTER TABLE `app_sales_invoices_receipts`
  MODIFY `ReceiptId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_suppliers`
--
ALTER TABLE `app_suppliers`
  MODIFY `SupplierId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `UserId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_users_groups`
--
ALTER TABLE `app_users_groups`
  MODIFY `GroupId` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_users_groups_privileges`
--
ALTER TABLE `app_users_groups_privileges`
  MODIFY `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_users_privileges`
--
ALTER TABLE `app_users_privileges`
  MODIFY `PrivilegeId` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_users_profiles`
--
ALTER TABLE `app_users_profiles`
  MODIFY `UserId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `app_expenses_daily_list`
--
ALTER TABLE `app_expenses_daily_list`
  ADD CONSTRAINT `app_expenses_daily_list_ibfk_1` FOREIGN KEY (`ExpenseId`) REFERENCES `app_expenses_categories` (`ExpenseId`),
  ADD CONSTRAINT `app_expenses_daily_list_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);

--
-- القيود للجدول `app_notifications`
--
ALTER TABLE `app_notifications`
  ADD CONSTRAINT `app_notifications_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);

--
-- القيود للجدول `app_products_list`
--
ALTER TABLE `app_products_list`
  ADD CONSTRAINT `app_products_list_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `app_products_categories` (`CategoryId`);

--
-- القيود للجدول `app_purchases_invoices`
--
ALTER TABLE `app_purchases_invoices`
  ADD CONSTRAINT `app_purchases_invoices_ibfk_1` FOREIGN KEY (`SupplierId`) REFERENCES `app_suppliers` (`SupplierId`),
  ADD CONSTRAINT `app_purchases_invoices_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);

--
-- القيود للجدول `app_purchases_invoices_details`
--
ALTER TABLE `app_purchases_invoices_details`
  ADD CONSTRAINT `app_purchases_invoices_details_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `app_products_list` (`ProductId`),
  ADD CONSTRAINT `app_purchases_invoices_details_ibfk_2` FOREIGN KEY (`InvoiceId`) REFERENCES `app_purchases_invoices` (`InvoiceId`);

--
-- القيود للجدول `app_purchases_invoices_receipts`
--
ALTER TABLE `app_purchases_invoices_receipts`
  ADD CONSTRAINT `app_purchases_invoices_receipts_ibfk_1` FOREIGN KEY (`InvoiceId`) REFERENCES `app_purchases_invoices` (`InvoiceId`),
  ADD CONSTRAINT `app_purchases_invoices_receipts_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);

--
-- القيود للجدول `app_sales_invoices`
--
ALTER TABLE `app_sales_invoices`
  ADD CONSTRAINT `app_sales_invoices_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `app_clients` (`ClientId`),
  ADD CONSTRAINT `app_sales_invoices_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);

--
-- القيود للجدول `app_sales_invoices_details`
--
ALTER TABLE `app_sales_invoices_details`
  ADD CONSTRAINT `app_sales_invoices_details_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `app_products_list` (`ProductId`),
  ADD CONSTRAINT `app_sales_invoices_details_ibfk_2` FOREIGN KEY (`InvoiceId`) REFERENCES `app_sales_invoices` (`InvoiceId`);

--
-- القيود للجدول `app_sales_invoices_receipts`
--
ALTER TABLE `app_sales_invoices_receipts`
  ADD CONSTRAINT `app_sales_invoices_receipts_ibfk_1` FOREIGN KEY (`InvoiceId`) REFERENCES `app_sales_invoices` (`InvoiceId`),
  ADD CONSTRAINT `app_sales_invoices_receipts_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);

--
-- القيود للجدول `app_users`
--
ALTER TABLE `app_users`
  ADD CONSTRAINT `app_users_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `app_users_groups` (`GroupId`);

--
-- القيود للجدول `app_users_groups_privileges`
--
ALTER TABLE `app_users_groups_privileges`
  ADD CONSTRAINT `app_users_groups_privileges_ibfk_1` FOREIGN KEY (`GroupId`) REFERENCES `app_users_groups` (`GroupId`),
  ADD CONSTRAINT `app_users_groups_privileges_ibfk_2` FOREIGN KEY (`PrivilegeId`) REFERENCES `app_users_privileges` (`PrivilegeId`);

--
-- القيود للجدول `app_users_profiles`
--
ALTER TABLE `app_users_profiles`
  ADD CONSTRAINT `app_users_profiles_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `app_users` (`UserId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
