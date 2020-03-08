-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2020 at 06:46 AM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PennyDay`
--

-- --------------------------------------------------------

--
-- Table structure for table `Location`
--
CREATE DATABASE PennyDay;

USE DATABASE PennyDay;
CREATE TABLE IF NOT EXISTS `Location` (
  `LocationID` int(11) NOT NULL,
  `LocationName` varchar(255) DEFAULT NULL,
  `LocationCost` decimal(10,0) DEFAULT NULL,
  `LocationTypeID` int(11) DEFAULT NULL,
  `LocationAddress` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Location`
--

INSERT INTO `Location` (`LocationID`, `LocationName`, `LocationCost`, `LocationTypeID`, `LocationAddress`) VALUES
(1, 'PGP Motorsports Park', 43, 1, '31003 144th Ave SE, Kent'),
(2, 'Gamma Ray Games', 20, 2, '501 E Pine St, Seattle, WA'),
(3, 'Discovery Park', 0, 3, '3801 Discovery Park Blvd, Seattle, WA'),
(4, 'iFLY - Seattle', 30, 4, '349 Tukwila Pkwy, Tukwila, WA'),
(5, 'Candere Cruising', 120, 5, '1341 N Northlake Way, Seattle, WA ');

-- --------------------------------------------------------

--
-- Table structure for table `LocationReviewsTable`
--
USE DATABASE PennyDay;
CREATE TABLE IF NOT EXISTS `LocationReviewsTable` (
  `LocationReviewTableID` int(11) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `ReviewID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LocationReviewsTable`
--

INSERT INTO `LocationReviewsTable` (`LocationReviewTableID`, `LocationID`, `ReviewID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `LocationType`
--
USE DATABASE PennyDay;
CREATE TABLE IF NOT EXISTS `LocationType` (
  `LocationTypeID` int(11) NOT NULL,
  `LocationTypeName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LocationType`
--

INSERT INTO `LocationType` (`LocationTypeID`, `LocationTypeName`) VALUES
(1, 'GO Karts'),
(2, 'Gaming'),
(3, 'Hiking'),
(4, 'Indoor Activity'),
(5, 'Outdoor Activity');

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--
USE DATABASE PennyDay;
CREATE TABLE IF NOT EXISTS `Reviews` (
  `ReviewID` int(11) NOT NULL,
  `ReviewNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`ReviewID`, `ReviewNumber`) VALUES
(1, 5),
(2, 4),
(3, 5),
(4, 3),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `UsersLocationTable`
--
USE DATABASE PennyDay;
CREATE TABLE IF NOT EXISTS `UsersLocationTable` (
  `UserLocationTableID` int(11) NOT NULL,
  `ProfileID` int(11) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UsersLocationTable`
--

INSERT INTO `UsersLocationTable` (`UserLocationTableID`, `ProfileID`, `LocationID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `UsersProfile`
--
USE DATABASE PennyDay;
CREATE TABLE IF NOT EXISTS `UsersProfile` (
  `ProfileID` int(11) NOT NULL,
  `ProfileName` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UsersProfile`
--

INSERT INTO `UsersProfile` (`ProfileID`, `ProfileName`, `Email`, `Address`, `City`) VALUES
(1, 'Nahom', 'nahom.alemu25@gmail.com', '2185 12th ave s', 'Des Moines'),
(2, 'Sartaj', 'sarsing22@gmail.com', '225 2nd ave N', 'Shoreline'),
(3, 'Ayush', 'ayush19seattle@gmail.com', '422 17th ave ', 'Lynnwood'),
(4, 'AJ', 'Alexanderthegreat@yahoo.com', '211 15th ave E', 'Renton'),
(5, 'Ivan', 'IvanDimav12@yahoo.com', '255 19th ave s ', 'Tacoma');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`LocationID`),
  ADD KEY `LocationTypeID` (`LocationTypeID`);

--
-- Indexes for table `LocationReviewsTable`
--
ALTER TABLE `LocationReviewsTable`
  ADD PRIMARY KEY (`LocationReviewTableID`),
  ADD KEY `LocationID` (`LocationID`),
  ADD KEY `ReviewID` (`ReviewID`);

--
-- Indexes for table `LocationType`
--
ALTER TABLE `LocationType`
  ADD PRIMARY KEY (`LocationTypeID`);

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`ReviewID`);

--
-- Indexes for table `UsersLocationTable`
--
ALTER TABLE `UsersLocationTable`
  ADD PRIMARY KEY (`UserLocationTableID`),
  ADD KEY `ProfileID` (`ProfileID`),
  ADD KEY `LocationID` (`LocationID`);

--
-- Indexes for table `UsersProfile`
--
ALTER TABLE `UsersProfile`
  ADD PRIMARY KEY (`ProfileID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Location`
--
ALTER TABLE `Location`
  ADD CONSTRAINT `Location_ibfk_1` FOREIGN KEY (`LocationTypeID`) REFERENCES `LocationType` (`LocationTypeID`);

--
-- Constraints for table `LocationReviewsTable`
--
ALTER TABLE `LocationReviewsTable`
  ADD CONSTRAINT `LocationReviewsTable_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`),
  ADD CONSTRAINT `LocationReviewsTable_ibfk_2` FOREIGN KEY (`ReviewID`) REFERENCES `Reviews` (`ReviewID`);

--
-- Constraints for table `UsersLocationTable`
--
ALTER TABLE `UsersLocationTable`
  ADD CONSTRAINT `UsersLocationTable_ibfk_1` FOREIGN KEY (`ProfileID`) REFERENCES `UsersProfile` (`ProfileID`),
  ADD CONSTRAINT `UsersLocationTable_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
