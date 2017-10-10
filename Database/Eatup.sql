-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 09, 2017 at 03:31 PM
-- Server version: 5.7.19
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eatup`
--

-- --------------------------------------------------------

--
-- Table structure for table `eventregist`
--

CREATE TABLE `eventregist` (
  `userid` varchar(255) NOT NULL,
  `joinedEvent` bigint(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userlist`
--

CREATE TABLE `userlist` (
  `userid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userschedule`
--

CREATE TABLE `userschedule` (
  `hostid` varchar(255) NOT NULL,
  `eventid` bigint(40) NOT NULL,
  `StartTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `Duration` int(6) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Seat` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eventregist`
--
ALTER TABLE `eventregist`
  ADD KEY `constraint_userid_fk` (`userid`),
  ADD KEY `constraint_eventid_fk` (`joinedEvent`);

--
-- Indexes for table `userlist`
--
ALTER TABLE `userlist`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `userschedule`
--
ALTER TABLE `userschedule`
  ADD PRIMARY KEY (`eventid`),
  ADD UNIQUE KEY `eventIDIndex` (`eventid`),
  ADD KEY `constraint_userid2_fk` (`hostid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userschedule`
--
ALTER TABLE `userschedule`
  MODIFY `eventid` bigint(40) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `eventregist`
--
ALTER TABLE `eventregist`
  ADD CONSTRAINT `constraint_eventid_fk` FOREIGN KEY (`joinedEvent`) REFERENCES `userschedule` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `constraint_userid_fk` FOREIGN KEY (`userid`) REFERENCES `userlist` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userschedule`
--
ALTER TABLE `userschedule`
  ADD CONSTRAINT `constraint_userid2_fk` FOREIGN KEY (`hostid`) REFERENCES `userlist` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
