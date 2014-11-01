-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 01, 2014 at 10:38 PM
-- Server version: 5.5.40
-- PHP Version: 5.4.4-14+deb7u14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Swimrace`
--

-- --------------------------------------------------------

--
-- Table structure for table `Races`
--

CREATE TABLE IF NOT EXISTS `Races` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  `Cap` varchar(64) NOT NULL,
  `CapHex` varchar(16) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Races`
--

INSERT INTO `Races` (`ID`, `Description`, `Cap`, `CapHex`) VALUES
(1, '5 Mile', 'Yellow', '#FFFF00'),
(2, '2 Mile', 'Green', '#33CC33'),
(3, '1 Mile', 'Pink', '#FF66CC');

-- --------------------------------------------------------

--
-- Table structure for table `RaceSwimmers`
--

CREATE TABLE IF NOT EXISTS `RaceSwimmers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SwimmerID` int(11) NOT NULL,
  `RaceID` int(11) NOT NULL,
  `RacerNumber` int(11) NOT NULL,
  `HasFins` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `RaceSwimmers`
--

INSERT INTO `RaceSwimmers` (`ID`, `SwimmerID`, `RaceID`, `RacerNumber`, `HasFins`) VALUES
(2, 1, 1, 13, 1),
(3, 3, 1, 4, 0),
(5, 7, 2, 16, 0),
(9, 9, 3, 9, 1),
(11, 5, 3, 12, 1),
(12, 2, 3, 17, 0),
(13, 8, 2, 14, 1),
(14, 4, 2, 15, 0),
(15, 10, 1, 1, 0),
(16, 12, 1, 2, 0),
(17, 13, 2, 3, 1),
(18, 14, 1, 5, 0),
(19, 15, 2, 6, 0),
(20, 16, 1, 11, 0),
(21, 17, 1, 8, 0),
(22, 18, 1, 7, 0),
(23, 19, 3, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Results`
--

CREATE TABLE IF NOT EXISTS `Results` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Birthdate` date NOT NULL,
  `Gender` varchar(3) NOT NULL,
  `RaceID` int(11) NOT NULL,
  `RaceDescription` varchar(255) NOT NULL,
  `Cap` varchar(32) NOT NULL,
  `CapHex` varchar(32) NOT NULL,
  `HasFins` tinyint(1) NOT NULL,
  `StartTime` datetime NOT NULL,
  `FinishTime` datetime NOT NULL,
  `SwimmerID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Table structure for table `Swimmers`
--

CREATE TABLE IF NOT EXISTS `Swimmers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Gender` varchar(2) NOT NULL,
  `Birthdate` date NOT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `Swimmers`
--

INSERT INTO `Swimmers` (`ID`, `FirstName`, `LastName`, `Gender`, `Birthdate`, `City`, `State`, `Country`) VALUES
(1, 'Matt', 'Brown', 'M', '1974-06-14', 'Seattle', 'WA', 'USA'),
(2, 'Megan', 'Brown', 'F', '1974-08-11', 'Seattle', 'WA', 'USA'),
(3, 'Ted', 'Rychlik', 'M', '1960-01-01', 'Seattle', 'WA', 'USA'),
(4, 'Suzanne', 'Rychlik', 'F', '1974-08-13', 'Seattle', 'WA', 'USA'),
(5, 'Taylor', 'Brown', 'F', '2005-09-14', 'Seattle', 'WA', 'USA'),
(7, 'Luis', 'Rosa', 'M', '1981-08-07', 'Seattle', 'WA', 'USA'),
(8, 'Roger', 'Goodell', 'M', '1988-06-01', 'New York', 'NY', 'USA'),
(9, 'Kyleigh', 'Rychlik', 'F', '2010-01-01', 'Seattle', 'WA', 'USA'),
(10, 'Alex', 'Kostich', 'M', '0000-00-00', 'San Diego', 'CA', 'USA'),
(11, 'Alex', 'Kostich', 'M', '0000-00-00', 'San Diego', 'CA', 'USA'),
(12, 'Brian', 'Brady', 'M', '0000-00-00', 'Miami', 'FL', 'USA'),
(13, 'Mathew', 'Mays', 'M', '0000-00-00', 'Atlanta', 'GA', 'USA'),
(14, 'Jonathan', 'Thomas', 'M', '0000-00-00', 'Paris', '', 'FRA'),
(15, 'Tim', 'O''Neill', 'M', '0000-00-00', 'Seattle', 'WA', 'USA'),
(16, 'Geoffrey', 'Munger', 'M', '0000-00-00', 'Seattle', 'WA', 'USA'),
(17, 'Bob', 'Haulk', 'M', '0000-00-00', 'Christensted', 'St. Croix', 'USVI'),
(18, 'Jim', 'Harper', 'M', '0000-00-00', 'Los Angeles', 'CA', 'USA'),
(19, 'Brent', 'Mays', 'M', '0000-00-00', 'Seattle', 'WA', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `TimeRace`
--

CREATE TABLE IF NOT EXISTS `TimeRace` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RaceID` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `TimeRace`
--

INSERT INTO `TimeRace` (`ID`, `RaceID`, `StartTime`, `Status`) VALUES
(1, 1, '2014-10-17 19:50:41', 1),
(2, 2, '2014-10-17 19:51:09', 1),
(3, 3, '2014-10-17 19:51:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `TimeSwimmer`
--

CREATE TABLE IF NOT EXISTS `TimeSwimmer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RaceSwimmerID` int(11) NOT NULL,
  `FinishTime` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `TimeSwimmer`
--

INSERT INTO `TimeSwimmer` (`ID`, `RaceSwimmerID`, `FinishTime`, `Status`) VALUES
(1, 15, '2014-10-17 19:53:06', 1),
(2, 16, '2014-10-17 19:53:25', 1),
(3, 17, '2014-10-17 19:53:42', 1),
(4, 3, '2014-10-17 19:54:01', 1),
(5, 18, '2014-10-17 19:54:12', 1),
(6, 19, '2014-10-17 19:54:15', 1),
(7, 22, '2014-10-17 19:54:58', 1),
(8, 21, '2014-10-17 19:55:00', 1),
(9, 9, '2014-10-17 19:55:03', 1),
(10, 23, '2014-10-17 19:55:09', 1),
(11, 20, '2014-10-17 19:55:13', 1),
(12, 11, '2014-10-17 19:55:16', 1),
(13, 2, '2014-10-17 19:55:19', 1),
(14, 13, '2014-10-17 19:55:21', 1),
(15, 14, '2014-10-17 19:55:25', 1),
(16, 5, '2014-10-17 19:55:27', 1),
(17, 12, '2014-10-17 19:55:29', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
