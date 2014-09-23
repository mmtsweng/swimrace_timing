-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 23, 2014 at 09:00 AM
-- Server version: 5.5.38
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
(2, '2-Mile', 'Green', '#33CC33'),
(3, '1-Mile', 'Pink', '#FF66CC');

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
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `RaceSwimmers`
--

INSERT INTO `RaceSwimmers` (`ID`, `SwimmerID`, `RaceID`, `RacerNumber`, `HasFins`) VALUES
(2, 1, 1, 123, 0),
(3, 4, 3, 77, 1),
(4, 3, 2, 5, 0),
(5, 7, 2, 321, 0),
(6, 2, 3, 23, 0),
(7, 5, 3, 17, 0),
(8, 8, 1, 666, 0);

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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Swimmers`
--

INSERT INTO `Swimmers` (`ID`, `FirstName`, `LastName`, `Gender`, `Birthdate`) VALUES
(1, 'Matt', 'Brown', 'M', '1974-06-14'),
(2, 'Megan', 'Brown', 'F', '1974-08-11'),
(3, 'Ted', 'Rychlik', 'M', '1960-01-01'),
(4, 'Suzanne', 'Rychlik', 'F', '1974-08-13'),
(5, 'Taylor', 'Brown', 'F', '2005-09-14'),
(7, 'Luis', 'Rosa', 'M', '1981-08-07'),
(8, 'Roger', 'Goodell', 'M', '1988-06-01');

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
(1, 1, '2014-12-09 12:15:20', 0),
(2, 1, '2014-12-09 12:15:20', 0),
(3, 1, '2014-12-09 12:15:20', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
