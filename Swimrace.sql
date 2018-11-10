-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 10, 2018 at 04:28 PM
-- Server version: 10.1.34-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Swimrace`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_FINISHERS` ()  NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName,
    s.LastName, s.City, s.Country, r.Description,
    r.Cap, r.CapHex, rs.HasFins,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime)))
    AS averageDate, tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
AND rs.RaceID = r.ID
AND tr.RaceID = r.ID
AND ts.RaceSwimmerID = rs.ID
GROUP BY ts.RaceSwimmerID
ORDER BY averageDate$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_FINISHORDER` ()  NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName,
    s.LastName, s.Gender, s.Birthdate, s.City,
    s.Country,r.Description, r.Cap, r.CapHex, rs.HasFins,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime)))
    AS averageDate, tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
AND rs.RaceID = r.ID
AND tr.RaceID = r.ID
AND ts.RaceSwimmerID = rs.ID
GROUP BY ts.RaceSwimmerID
ORDER BY averageDate$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_NONRACERS` ()  NO SQL
SELECT s.ID, s.FirstName, s.LastName
FROM Swimmers s
WHERE s.ID NOT IN (
    SELECT SwimmerID FROM RaceSwimmers)
    ORDER BY s.LastName LIMIT 0, 300$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACEFINISHERCOUNTS` ()  NO SQL
SELECT COUNT(DISTINCT rs.SwimmerID) as Swimmers,
    COUNT(DISTINCT ts.RaceSwimmerID) as Finishers,
    r.Description, r.CapHex
FROM RaceSwimmers rs
LEFT JOIN TimeSwimmer ts ON ts.RaceSwimmerID = rs.ID
    JOIN Races r on rs.RaceID = r.ID
GROUP BY rs.RaceID
UNION
SELECT COUNT(DISTINCT rs.SwimmerID) as Swimmers,
    COUNT(DISTINCT ts.RaceSwimmerID) as Finishers,
    "Overall", "#008080"
FROM RaceSwimmers rs
LEFT JOIN TimeSwimmer ts ON ts.RaceSwimmerID = rs.ID
    JOIN Races r on rs.RaceID = r.ID$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACEFINISHERS` ()  NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName,
    s.LastName, s.City, s.Country, r.Description,
    r.Cap, r.CapHex, rs.HasFins,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime))) AS averageDate,
    TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age,
    tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
AND rs.RaceID = r.ID
AND tr.RaceID = r.ID
AND ts.RaceSwimmerID = rs.ID
GROUP BY ts.RaceSwimmerID
ORDER BY rs.RaceID, averageDate$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACERCOUNTS` ()  NO SQL
SELECT r.ID, r.Description, COUNT(rs.ID) as Swimmers
FROM RaceSwimmers AS rs, Races r
WHERE rs.RaceID = r.ID
GROUP BY r.ID$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACERS` ()  NO SQL
SELECT rs.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName,
    s.LastName,s.Gender, s.Birthdate, s.City, s.Country,
    r.Description, r.Cap, rs.HasFins
FROM RaceSwimmers rs, Races r, Swimmers s
WHERE rs.SwimmerID = s.ID
AND rs.RaceID = r.ID
AND rs.Status = 1
ORDER BY s.LastName, s.FirstName$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACES` ()  SELECT r.ID, r.Description, r.CapHex, r.Cap
FROM Races r$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACETIMES` ()  NO SQL
SELECT r.ID, r.Description, r.CapHex, t.StartTime
FROM Races r
LEFT JOIN TimeRace t ON r.ID = t.RaceID
AND t.Status = 1$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_SWIMMER` (IN `in_swimmerid` INT)  NO SQL
SELECT ID, FirstName, LastName, City,
    Country, Birthdate, Gender
FROM Swimmers s
WHERE s.ID = in_swimmerid$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_SWIMMERS` ()  NO SQL
SELECT ID, FirstName, LastName, Gender, Birthdate
FROM Swimmers$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `INSERT_RACER` (IN `racernumber` INT, IN `swimmerid` INT, IN `raceid` INT, IN `hasfins` INT)  NO SQL
INSERT INTO RaceSwimmers
    (SwimmerID, RaceID, RacerNumber, HasFins)
VALUES
    (swimmerid, raceid, racernumber, hasfins)$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `INSERT_SWIMMER` (IN `in_firstname` VARCHAR(255), IN `in_lastname` VARCHAR(255), IN `in_city` VARCHAR(64), IN `in_country` VARCHAR(64), IN `in_birthdate` DATE, IN `in_gender` VARCHAR(4))  NO SQL
Insert INTO Swimmers (FirstName, LastName, Gender,
        Birthdate, City, Country)
VALUES (in_firstname, in_lastname, in_gender,
        in_birthdate, in_city, in_country)$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `INSERT_TIMERACE` (IN `in_race` INT, IN `in_date` DATETIME, IN `in_enable` INT)  NO SQL
INSERT INTO TimeRace (RaceID, StartTime, Status)
    VALUES (in_race, in_date, in_enable)$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_OVERALL` (IN `in_raceid` INT)  NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID,
    s.FirstName, s.LastName, s.Gender, s.Birthdate,
    s.City, s.Country,
    TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime)))
        AS EndTime, tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
    AND r.ID = in_raceid
    AND rs.RaceID = r.ID
    AND tr.RaceID = r.ID
    AND ts.RaceSwimmerID = rs.ID
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
LIMIT 5$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_OVERALL_19OVER` (IN `in_raceid` INT)  NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID,
    s.FirstName, s.LastName, s.Gender, s.Birthdate,
    s.City, s.Country,
    TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime)))
        AS EndTime,
    tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
    AND r.ID = in_raceid
    AND rs.RaceID = r.ID
    AND tr.RaceID = r.ID
    AND ts.RaceSwimmerID = rs.ID
    AND rs.HasFins = 0
    AND TIMESTAMPDIFF(YEAR, s.Birthdate,
                      NOW()) BETWEEN 19 AND 999
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
    LIMIT 5$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_OVERALL_FIN` (IN `in_raceid` INT)  NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID,
    s.FirstName, s.LastName, s.Gender, s.Birthdate,
    s.City, s.Country,
    TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime)))
        AS EndTime,
    tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
    AND r.ID = in_raceid
    AND rs.RaceID = r.ID
    AND tr.RaceID = r.ID
    AND ts.RaceSwimmerID = rs.ID
    AND rs.HasFins = 1
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
    LIMIT 1$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_OVERALL_UNDER19` (IN `in_raceid` INT)  NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID,
    s.FirstName, s.LastName, s.Gender, s.Birthdate,
    s.City, s.Country,
    TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime)))
        AS EndTime,
    tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
    AND r.ID = in_raceid
    AND rs.RaceID = r.ID
    AND tr.RaceID = r.ID
    AND ts.RaceSwimmerID = rs.ID
    AND rs.HasFins = 0
    AND TIMESTAMPDIFF(YEAR, s.Birthdate,
                      NOW()) BETWEEN 0 AND 18
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
    LIMIT 5$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_WINNERS_BY_RACE_AGE` (IN `in_raceid` INT, IN `in_minage` INT, IN `in_maxage` INT, IN `in_gender` VARCHAR(2))  NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID,
    s.FirstName, s.LastName, s.Gender, s.Birthdate,
    s.City, s.Country,
    TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime)))
        AS EndTime,
    tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
    AND rs.RaceID = r.ID
    AND tr.RaceID = r.ID
    AND r.ID = in_raceid
    AND ts.RaceSwimmerID = rs.ID
    AND rs.HasFins = 0
    AND s.Gender = in_gender
    AND TIMESTAMPDIFF(YEAR, s.Birthdate,
                      NOW()) BETWEEN in_minage AND in_maxage
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
    LIMIT 3$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `SP_FINISHRACER` (IN `in_racernumber` INT, IN `in_finishtime` DATETIME)  NO SQL
INSERT INTO TimeSwimmer (RaceSwimmerID, FinishTime)
VALUES (
    (SELECT rs.ID
     FROM RaceSwimmers rs
     WHERE rs.RacerNumber = in_racernumber),
    in_finishtime)$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `SP_GETRACERSSWIMMING` ()  NO SQL
SELECT r.ID, r.Description, rs.RacerNumber, rs.SwimmerID, s.FirstName, s.LastName,
        TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age
FROM Races r, RaceSwimmers rs, Swimmers s
WHERE rs.SwimmerID = s.ID
AND rs.ID NOT IN (
    SELECT RaceSwimmerID FROM TimeSwimmer)
AND rs.RaceID = r.ID
GROUP BY s.ID
ORDER BY rs.RaceID, rs.RacerNumber$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `SP_RESETTIMERACE` (IN `in_race` INT)  NO SQL
UPDATE TimeRace
    SET Status = 0
    WHERE RaceID = in_race$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `UPDATE_RACESWIMMERS` (IN `in_raceswimmerid` INT, IN `in_swimmerid` INT, IN `in_raceid` INT, IN `in_racernumber` INT, IN `in_hasfins` INT)  NO SQL
UPDATE RaceSwimmers
SET SwimmerID=in_swimmerid,
    RaceID=in_raceid,
    RacerNumber=in_racernumber,
    HasFins=in_hasfins
WHERE ID=in_raceswimmerid$$

CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `UPDATE_SWIMMER` (IN `in_swimmerid` INT, IN `in_city` VARCHAR(50), IN `in_country` VARCHAR(64), IN `in_birthdate` DATE, IN `in_firstname` VARCHAR(255), IN `in_lastname` VARCHAR(255), IN `in_gender` VARCHAR(4))  NO SQL
UPDATE Swimmers
SET Gender=in_gender,
    Birthdate=in_birthdate,
    City=in_city,
    Country=in_country
WHERE ID=in_swimmerid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Races`
--

CREATE TABLE `Races` (
  `ID` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Cap` varchar(64) NOT NULL,
  `IsEnabled` int(11) NOT NULL DEFAULT '1',
  `CapHex` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `Races`
--

INSERT INTO `Races` (`ID`, `Description`, `Cap`, `IsEnabled`, `CapHex`) VALUES
(1, '5 Mile', 'Yellow', 1, '#FFFF00'),
(2, '2 Mile', 'Green', 1, '#33CC33'),
(3, '1 Mile', 'Pink', 1, '#FF66CC');

-- --------------------------------------------------------

--
-- Table structure for table `RaceSwimmers`
--

CREATE TABLE `RaceSwimmers` (
  `ID` int(11) NOT NULL,
  `SwimmerID` int(11) NOT NULL,
  `RaceID` int(11) NOT NULL,
  `RacerNumber` int(11) NOT NULL,
  `HasFins` int(11) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `RaceSwimmers`
--

INSERT INTO `RaceSwimmers` (`ID`, `SwimmerID`, `RaceID`, `RacerNumber`, `HasFins`, `Status`) VALUES
(2, 128, 3, 101, 0, 1),
(3, 13, 1, 3, 0, 1),
(4, 91, 1, 2, 0, 1),
(5, 149, 1, 4, 0, 1),
(6, 67, 3, 102, 0, 1),
(7, 4, 1, 5, 0, 1),
(8, 122, 1, 6, 1, 1),
(9, 93, 3, 103, 0, 1),
(10, 172, 2, 201, 0, 1),
(11, 43, 2, 0, 0, 1),
(12, 77, 1, 7, 1, 1),
(13, 119, 2, 203, 0, 1),
(14, 23, 2, 204, 0, 1),
(15, 211, 1, 8, 0, 1),
(16, 62, 3, 104, 0, 1),
(17, 63, 3, 105, 1, 1),
(18, 54, 1, 9, 0, 1),
(19, 150, 3, 106, 0, 1),
(20, 50, 1, 10, 0, 1),
(21, 41, 3, 107, 0, 1),
(22, 46, 1, 11, 0, 1),
(23, 204, 3, 108, 0, 1),
(24, 7, 3, 109, 0, 1),
(25, 194, 1, 12, 0, 1),
(26, 205, 1, 13, 0, 1),
(27, 110, 3, 110, 0, 1),
(28, 111, 1, 14, 0, 1),
(29, 40, 3, 111, 0, 1),
(30, 112, 2, 205, 1, 1),
(31, 187, 2, 206, 0, 1),
(32, 34, 3, 112, 0, 1),
(33, 84, 3, 113, 0, 1),
(34, 226, 2, 207, 0, 1),
(35, 52, 1, 15, 0, 1),
(37, 202, 3, 114, 0, 1),
(38, 159, 1, 16, 0, 1),
(39, 18, 2, 208, 0, 1),
(40, 185, 2, 209, 0, 1),
(41, 186, 2, 210, 0, 1),
(42, 184, 2, 211, 0, 1),
(43, 225, 2, 212, 0, 1),
(44, 147, 2, 213, 0, 1),
(45, 90, 1, 17, 0, 1),
(46, 113, 1, 18, 0, 1),
(47, 82, 2, 214, 0, 1),
(48, 14, 2, 215, 0, 1),
(49, 71, 3, 115, 0, 1),
(50, 72, 1, 19, 0, 1),
(51, 227, 2, 216, 0, 1),
(52, 36, 3, 116, 0, 1),
(53, 144, 1, 20, 0, 1),
(54, 127, 3, 117, 0, 1),
(55, 224, 2, 217, 0, 1),
(56, 70, 1, 21, 0, 1),
(57, 114, 1, 22, 0, 1),
(58, 85, 2, 218, 0, 1),
(59, 216, 1, 23, 0, 1),
(60, 74, 2, 219, 0, 1),
(61, 87, 1, 24, 0, 1),
(62, 183, 1, 25, 0, 1),
(63, 163, 2, 220, 0, 1),
(64, 133, 3, 118, 0, 1),
(65, 120, 2, 230, 0, 1),
(66, 176, 1, 26, 0, 1),
(67, 175, 2, 222, 0, 1),
(68, 8, 2, 223, 0, 1),
(69, 76, 1, 27, 0, 1),
(70, 126, 1, 28, 0, 1),
(71, 151, 2, 224, 0, 1),
(72, 152, 2, 225, 0, 1),
(73, 1, 1, 49, 0, 1),
(74, 53, 3, 119, 0, 1),
(75, 220, 2, 226, 0, 1),
(76, 219, 3, 120, 0, 1),
(77, 197, 1, 29, 0, 1),
(78, 25, 1, 30, 1, 1),
(79, 223, 3, 121, 1, 1),
(80, 79, 1, 31, 1, 1),
(81, 221, 2, 227, 0, 1),
(82, 222, 2, 228, 0, 1),
(83, 83, 1, 32, 0, 1),
(84, 164, 2, 229, 0, 1),
(85, 203, 1, 33, 0, 1),
(86, 153, 3, 122, 0, 1),
(87, 100, 1, 34, 0, 1),
(88, 160, 1, 35, 0, 1),
(89, 118, 1, 36, 0, 1),
(90, 30, 3, 123, 0, 1),
(91, 56, 3, 124, 1, 1),
(92, 31, 1, 37, 0, 1),
(93, 146, 1, 38, 0, 1),
(94, 162, 1, 50, 0, 1),
(95, 190, 1, 51, 0, 1),
(96, 10, 1, 52, 0, 1),
(97, 11, 1, 53, 0, 1),
(98, 59, 2, 232, 0, 1),
(99, 58, 2, 231, 0, 1),
(100, 5, 1, 54, 0, 1),
(101, 143, 1, 55, 0, 1),
(102, 117, 1, 56, 0, 1),
(103, 213, 1, 57, 0, 1),
(104, 206, 1, 58, 0, 1),
(105, 135, 1, 59, 0, 1),
(107, 24, 1, 60, 0, 1),
(108, 130, 1, 61, 0, 1),
(109, 129, 1, 62, 0, 1),
(110, 96, 1, 63, 0, 1),
(111, 26, 1, 64, 0, 1),
(112, 22, 1, 65, 0, 1),
(113, 145, 2, 233, 0, 1),
(114, 75, 3, 125, 0, 1),
(115, 136, 1, 66, 0, 1),
(116, 139, 2, 234, 0, 1),
(117, 19, 2, 235, 0, 1),
(118, 125, 2, 236, 0, 1),
(119, 27, 2, 237, 0, 1),
(120, 214, 2, 238, 0, 1),
(121, 81, 2, 239, 0, 1),
(122, 106, 3, 126, 1, 1),
(123, 33, 2, 240, 0, 1),
(124, 94, 2, 241, 0, 1),
(125, 95, 2, 242, 0, 1),
(126, 101, 1, 68, 0, 1),
(127, 165, 3, 127, 0, 1),
(128, 195, 1, 67, 0, 1),
(129, 168, 1, 39, 0, 1),
(130, 141, 1, 40, 0, 1),
(131, 37, 1, 41, 0, 1),
(132, 92, 1, 42, 0, 1),
(133, 44, 3, 128, 0, 1),
(134, 200, 3, 129, 0, 1),
(135, 121, 1, 43, 0, 1),
(136, 109, 1, 44, 0, 1),
(137, 12, 1, 45, 0, 1),
(138, 108, 1, 46, 0, 1),
(139, 169, 3, 130, 0, 1),
(140, 102, 3, 131, 0, 1),
(141, 21, 3, 132, 0, 1),
(142, 181, 3, 133, 0, 1),
(143, 228, 1, 47, 0, 1),
(144, 171, 1, 48, 0, 1),
(145, 166, 2, 243, 0, 1),
(146, 88, 2, 244, 0, 1),
(148, 64, 3, 135, 0, 1),
(150, 65, 1, 70, 0, 1),
(151, 218, 3, 134, 0, 1),
(152, 217, 3, 136, 0, 1),
(153, 140, 2, 245, 0, 1),
(154, 105, 2, 246, 0, 1),
(155, 104, 3, 137, 0, 1),
(156, 99, 2, 247, 0, 1),
(157, 179, 3, 138, 0, 1),
(158, 45, 1, 71, 0, 1),
(159, 86, 2, 248, 0, 1),
(160, 180, 1, 72, 0, 1),
(161, 123, 1, 73, 0, 1),
(162, 15, 3, 139, 0, 1),
(163, 16, 3, 140, 0, 1),
(164, 116, 1, 74, 0, 1),
(165, 193, 1, 75, 0, 1),
(166, 57, 1, 76, 0, 1),
(167, 155, 1, 77, 0, 1),
(168, 32, 1, 78, 0, 1),
(169, 170, 3, 141, 0, 1),
(170, 68, 1, 79, 0, 1),
(171, 9, 1, 80, 0, 1),
(172, 60, 3, 142, 0, 1),
(173, 78, 2, 249, 0, 1),
(174, 39, 3, 143, 0, 1),
(175, 69, 2, 250, 0, 1),
(176, 198, 2, 251, 0, 1),
(177, 208, 3, 144, 0, 1),
(178, 80, 3, 145, 0, 1),
(179, 192, 1, 81, 0, 1),
(180, 178, 1, 82, 0, 1),
(181, 177, 1, 83, 0, 1),
(182, 97, 1, 84, 0, 1),
(183, 182, 1, 85, 1, 1),
(184, 148, 1, 86, 0, 1),
(185, 189, 2, 252, 0, 1),
(186, 29, 1, 87, 0, 1),
(187, 6, 2, 253, 0, 1),
(188, 132, 1, 88, 0, 1),
(189, 209, 1, 89, 0, 1),
(190, 47, 1, 90, 0, 1),
(191, 191, 2, 254, 0, 1),
(192, 167, 1, 91, 0, 1),
(193, 38, 1, 92, 0, 1),
(194, 3, 3, 146, 0, 1),
(195, 73, 2, 255, 0, 1),
(196, 61, 2, 256, 0, 1),
(197, 35, 2, 257, 0, 1),
(198, 89, 1, 93, 0, 1),
(199, 201, 1, 94, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Swimmers`
--

CREATE TABLE `Swimmers` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Gender` varchar(2) NOT NULL,
  `Birthdate` date NOT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `Swimmers`
--

INSERT INTO `Swimmers` (`ID`, `FirstName`, `LastName`, `Gender`, `Birthdate`, `City`, `State`, `Country`) VALUES
(1, 'Aida', 'Abas Burgos', 'F', '1981-04-17', 'Bristol', 'GB', ''),
(2, 'Elizabeth', 'Abbott', 'F', '1982-06-16', 'Arnold', 'MD', ''),
(3, 'Jonathan', 'Adams', 'M', '1981-07-17', 'Gardens', 'FL', ''),
(4, 'Stephanie', 'Adcock', 'F', '1966-02-24', 'Kingston Springs', 'TN', ''),
(5, 'Carla', 'Albano', 'F', '1958-02-10', 'Hollywood', 'FL', ''),
(6, 'Amanda', 'Almon', 'F', '1978-11-24', 'Sewell', 'NJ', ''),
(7, 'Wendy', 'Ammon', 'F', '1960-07-10', 'Port of Spain', 'TT', ''),
(8, 'Jill', 'Anderson', 'F', '1956-03-02', 'Prescott', 'AZ', ''),
(9, 'Tess', 'Andres', 'F', '1981-03-07', 'Richmond', 'VA', ''),
(10, 'Derek', 'Argust', 'M', '1968-07-27', 'Alexandria', 'VA', ''),
(11, 'Todd', 'Argust', 'M', '1971-02-13', 'Plymouth', 'MI', ''),
(12, 'Barry', 'Armstrong', 'M', '1959-12-21', 'Medfield', 'MA', ''),
(13, 'Elizabeth', 'Armstrong', 'F', '1966-06-26', 'Christiansted', 'VI', ''),
(14, 'Kenneth', 'Auld', 'M', '1961-02-03', 'Norwell', 'GB', ''),
(15, 'Brett', 'Baddorf', 'M', '1980-06-23', 'Memphis', 'VA', ''),
(16, 'Sarah', 'Baddorf', 'F', '1984-04-03', 'Memphis', 'TN', ''),
(17, 'Alexandra', 'Bain', 'F', '1977-01-30', 'MIAMI BEACH', 'FL', ''),
(18, 'Gilda', 'Barboza', 'F', '1981-11-27', 'Pleasant Hill', 'CA', ''),
(19, 'Heather', 'Barna', 'F', '1971-04-27', 'Boston', 'MA', ''),
(20, 'Dean', 'Barnes', 'M', '1974-08-12', 'Ontario', 'OR', ''),
(21, 'Shari', 'Bashaw', 'F', '1961-08-24', 'Christiansted', 'VI', ''),
(22, 'Heather', 'Berken', 'F', '1971-12-30', 'Cedarburg', 'WI', ''),
(23, 'Marie', 'Berry', 'F', '1971-03-29', 'Nashville', 'TN', ''),
(24, 'Lori', 'Block', 'F', '1963-08-10', 'Dublin', 'CA', ''),
(25, 'Pat', 'Blosser', 'M', '1965-03-17', 'Christiansted', 'VI', ''),
(26, 'Virginia', 'Bogdan', 'F', '1979-10-21', 'Owings Mills', 'MD', ''),
(27, 'Douglas', 'Bosley', 'M', '1962-07-02', 'Somerville', 'MA', ''),
(28, 'Janette', 'Bowers', 'F', '1968-01-27', 'Frederiksted', 'VI', ''),
(29, 'Susan', 'Bowman', 'F', '1956-01-10', 'New York', 'NY', ''),
(30, 'Bonnie', 'Brady', 'F', '1959-12-03', 'Turnersville', 'NJ', ''),
(31, 'Brian', 'Brady', 'M', '1987-11-05', 'Christiansted', 'VI', ''),
(32, 'Jamie', 'Breen', 'M', '1961-08-07', 'Atlanta', 'GA', ''),
(33, 'Barbara', 'Bryden', 'F', '1960-11-21', 'Toronto', 'ON', ''),
(34, 'Susan', 'Buchman', 'F', '1979-02-04', 'Pittsburgh', 'PA', ''),
(35, 'Catherine', 'Burnett', 'F', '1963-02-21', 'Leesburg', 'VA', ''),
(36, 'Marlon', 'Cameron', 'M', '1978-04-26', 'Brighton', 'GB', ''),
(37, 'Natalie', 'Ceccato', 'F', '1976-09-01', 'Whitby', 'ON', ''),
(38, 'Steve', 'Childers', 'M', '1965-01-31', 'Los Angeles', 'CA', ''),
(39, 'Justin', 'Chiles', 'M', '1983-06-19', 'Washington', 'DC', ''),
(40, 'David', 'Conover', 'M', '1950-12-22', 'Great Falls ', 'VA', 'VA'),
(41, 'Joseph', 'Conrad', 'M', '1977-12-18', 'Nashville', 'TN', ''),
(42, 'John j', 'Coombs', 'M', '1962-07-15', 'Boston', 'MA', ''),
(43, 'Donald p', 'Cooper', 'M', '1958-09-30', 'Madison', 'TN', ''),
(44, 'Steve', 'Core', 'M', '1966-05-03', 'Leesburg', 'VA', ''),
(45, 'Heather', 'Core', 'F', '1968-07-21', 'Leesburg', 'VA', ''),
(46, 'Chris', 'Cowley', 'M', '1982-12-29', 'Nashville', 'TN', ''),
(47, 'Joe', 'Croney', 'M', '1977-11-05', 'Christiansted', 'VI', ''),
(48, 'Joseph', 'Croney', 'M', '1977-11-05', 'Christiansted', 'VI', ''),
(49, 'Kishan', 'Dabhi', 'M', '1992-11-19', 'AHMEDABAD', 'IN', ''),
(50, 'Michelle', 'Davidson', 'F', '1970-06-11', 'Neptune', 'NJ', ''),
(51, 'Susan', 'Deakin', 'F', '1964-11-23', 'Pittsburgh', 'PA', ''),
(52, 'Sydne', 'Didier', 'F', '1971-03-09', 'Amherst', 'MA', ''),
(53, 'Bruce', 'Diel', 'M', '1948-12-25', 'Wake Forest', 'NC', ''),
(54, 'Michael', 'Dizon-Bumann', 'M', '2004-01-23', 'Christiansted', 'VI', ''),
(55, 'Brian', 'Donnelly', 'M', '1960-09-07', 'Manahawkin', 'NJ', ''),
(56, 'Rashawn', 'Drew', 'F', '1988-06-26', 'Christiansted', 'VI', ''),
(57, 'Craig', 'Dunbar', 'M', '1963-02-07', 'Midlothian', 'VA', ''),
(58, 'Evan', 'Dykstra', 'M', '2005-12-20', 'Christiansted', 'VI', ''),
(59, 'Jeff', 'Dykstra', 'M', '1973-04-08', 'Christiansted', 'VI', ''),
(60, 'Cody', 'Emery', 'M', '1984-05-27', 'Seattle', 'WA', ''),
(61, 'Michael', 'Erbesfeld', 'M', '1979-10-29', 'Washington', 'DC', ''),
(62, 'Marti', 'Erickson', 'F', '1951-11-26', 'Brentwood', 'TN', ''),
(63, 'Robert', 'Erickson', 'M', '1946-05-26', 'Brentwood', 'TN', ''),
(64, 'Johannes', 'Ernharth', 'M', '1968-10-17', 'Pittsburgh', 'PA', ''),
(65, 'Libby', 'Ernharth', 'F', '1972-04-01', 'Pittsburgh', 'PA', ''),
(66, 'Cookie', 'Estlow', 'F', '1958-11-08', 'CHATSWORTH', 'NJ', ''),
(67, 'Kaye', 'Evans', 'F', '1947-03-19', 'Kingshill', 'VI', ''),
(68, 'Heather', 'Fairbanks', 'F', '1969-04-04', 'Midlothian', 'VA', ''),
(69, 'Marina', 'Falcone', 'F', '1987-06-05', 'tampa', 'FL', ''),
(70, 'Peter', 'Favreau', 'M', '1968-12-20', 'Manchester', 'NH', ''),
(71, 'Lillian', 'Fernley', 'F', '1957-10-10', 'Burbank', 'CA', ''),
(72, 'Thomas', 'Fernley, Jr,', 'M', '1977-12-03', 'Burbank', 'CA', ''),
(73, 'Chris', 'Ferraras', 'M', '1981-01-12', 'Christiansted', 'VI', ''),
(74, 'Eric', 'Finkelstein', 'M', '1960-07-24', 'Denver', 'CO', ''),
(75, 'Karen', 'Finucan Clarkson', 'F', '1960-05-20', 'Bethesda', 'MD', ''),
(76, 'James', 'Forbes', 'M', '1968-08-13', 'Denver', 'CO', ''),
(77, 'Mark', 'Formica', 'M', '1948-02-29', 'Port Charlotte', 'FL', ''),
(78, 'Rachel', 'Frentsos', 'F', '1971-04-14', 'Annapolis', 'MD', ''),
(79, 'Brad', 'Gair', 'M', '1960-05-17', 'Brooklyn', 'NY', 'NY'),
(80, 'Shawn', 'George', 'M', '1975-05-12', 'Christiansted', 'TN', ''),
(81, 'Kaeden', 'Gleason', 'M', '0000-00-00', 'Christiansted', 'VI', ''),
(82, 'Thomas', 'Goggins', 'M', '1958-08-13', 'Weston', 'MA', ''),
(83, 'Dan', 'Goldfarb', 'M', '1968-05-07', 'Burke', 'VA', ''),
(84, 'Adam', 'Goode', 'M', '1979-11-20', 'Pittsburgh', 'PA', ''),
(85, 'Laura', 'Gorinski', 'F', '1990-09-30', 'Arlington', 'VA', ''),
(86, 'Andrew', 'Grannell', 'M', '1947-05-23', 'Annapolis', 'MD', ''),
(87, 'Gary', 'Gray', 'M', '1952-05-31', 'Denver', 'CO', ''),
(88, 'Al', 'Gruber', 'M', '1956-03-26', 'Annapolis', 'MD', ''),
(89, 'Ana', 'Gutierrez', 'F', '1961-09-18', 'Frederiksted', 'VI', ''),
(90, 'Myrna', 'Haag', 'F', '1958-11-03', 'Tampa', 'FL', ''),
(91, 'Robert', 'Halk', 'M', '1972-04-16', 'Christiansted', 'VI', ''),
(92, 'Marni', 'Hamilton', 'F', '1961-10-30', 'Toronto', 'ON', ''),
(93, 'Joe', 'Hammond', 'M', '1968-12-03', 'Alexandria', 'VA', ''),
(94, 'Corey', 'Hardin', 'M', '1970-01-22', 'Somerville', 'MA', ''),
(95, 'Edward j', 'Hardin', 'M', '1943-02-01', 'Atlanta', 'GA', ''),
(96, 'William f', 'Haselden', 'M', '1961-03-15', 'Chapin', 'SC', ''),
(97, 'Alison', 'Hayden', 'F', '1971-12-17', 'Kinnelon', 'NJ', ''),
(98, 'Sean', 'Heffernan', 'M', '1950-09-06', 'BOSTON', 'MA', ''),
(99, 'Kara', 'Hefner', 'F', '1971-03-04', 'Cary', 'NC', ''),
(100, 'Cynthia', 'Henley', 'F', '1958-06-17', 'Palmetto Bay', 'FL', ''),
(101, 'Elizabeth', 'Hetzler', 'F', '1979-10-09', 'Washington', 'DC', ''),
(102, 'John', 'Hourihan', 'M', '1955-11-02', 'Christiansted', 'VI', ''),
(103, 'Steve', 'Hughes', 'M', '1948-11-07', 'Little Rock', 'AR', ''),
(104, 'Richard', 'Janiszewski', 'M', '1968-01-31', 'Severna Park', 'MD', ''),
(105, 'Natalie', 'Janiszewski', 'F', '1967-01-09', 'Severna Park', 'MD', ''),
(106, 'Ethan', 'Jiron', 'M', '1971-12-22', 'Allston', 'MA', ''),
(107, 'Patrick', 'Jiron', 'M', '1937-12-04', 'CLEARLAKE OKS', 'CA', ''),
(108, 'Laura', 'Jones', 'F', '1965-07-23', 'Charlottesville', 'VA', ''),
(109, 'Rob', 'Jones', 'M', '1965-03-31', 'Charlottesville', 'VA', ''),
(110, 'Peter', 'Kalibat', 'M', '1958-11-13', 'Princeton', 'NJ', ''),
(111, 'Rebecca', 'Kalibat', 'F', '1963-08-14', 'Princeton', 'NJ', ''),
(112, 'Joseph', 'Kasimer', 'M', '1950-10-13', 'Annandale', 'VA', ''),
(113, 'Susan', 'Kasimer', 'F', '1982-04-13', 'McLean', 'VA', ''),
(114, 'Kristy', 'Kellogg', 'F', '1962-05-11', 'Springfield', 'VA', ''),
(115, 'Anne', 'Kendrick', 'F', '1951-08-29', 'Nashville', 'TN', ''),
(116, 'Erich', 'Kimbrough', 'M', '1962-08-22', 'Atlanta', 'GA', ''),
(117, 'Bill', 'Korey', 'M', '1963-09-18', 'Wilton Manors', 'FL', ''),
(118, 'Natalia', 'Kuipers', 'F', '2002-06-13', 'Christiansted', 'VI', ''),
(119, 'Valerie', 'Kwaiben', 'F', '1963-05-26', 'San Jose', 'CA', ''),
(120, 'Mason', 'Lambert', 'M', '2006-09-01', 'Christiansted', 'VI', ''),
(121, 'Frans', 'Lawaetz', 'M', '1978-10-10', 'Boston', 'MA', ''),
(122, 'Karmen', 'Lenz', 'F', '1961-10-14', 'Macon', 'GA', ''),
(123, 'Denise', 'Letendre', 'F', '1988-08-28', 'Richmond', 'VA', ''),
(124, 'Alana', 'Libow', 'F', '1980-03-03', 'MIAMI BEACH', 'FL', ''),
(125, 'Laura', 'Lipcsei', 'F', '1968-10-03', 'Toronto', 'ON', ''),
(126, 'Carlos', 'Lloreda', 'M', '1954-06-28', 'Miami', 'FL', ''),
(127, 'Jeff', 'Lukomski', 'M', '1964-01-15', 'Los Angeles', 'CA', ''),
(128, 'Raymond', 'Lutz', 'M', '1953-12-27', 'Christiansted', 'VI', ''),
(129, 'Deborah', 'Mackay', 'F', '1962-03-22', 'Vero Beach', 'FL', ''),
(130, 'Gregory', 'Mackay', 'M', '1959-08-26', 'Vero Beach', 'FL', ''),
(131, 'Marc', 'Mansour', 'M', '1964-07-29', 'Boston', 'MA', ''),
(132, 'Matt', 'Martelli', 'M', '1974-11-25', 'Philadelphia', 'PA', ''),
(133, 'Megan', 'Mault', 'F', '1981-07-29', 'Christiansted', 'VI', ''),
(134, 'John', 'May', 'M', '1967-10-27', 'ELM GROVE', 'WI', ''),
(135, 'Jennifer', 'May', 'F', '1969-01-31', 'Muskego', 'WI', ''),
(136, 'Howard', 'Mccue', 'M', '1974-06-19', 'Needham', 'MA', ''),
(137, 'Babs', 'Mcdonald', 'F', '1953-11-07', 'athens', 'GA', ''),
(138, 'George', 'Mesora', 'M', '1961-05-02', 'Davidsonville', 'MD', ''),
(139, 'Elizabeth', 'Mesora', 'F', '1958-07-13', 'Davidsonville', 'MD', ''),
(140, 'Danielle', 'Miceli', 'F', '1987-05-04', 'Pittsburgh', 'PA', ''),
(141, 'Jeff', 'Miller', 'M', '1961-05-14', 'St. John', 'VI', ''),
(142, 'Dixon', 'Mitchell', 'M', '1967-02-11', 'hickory', 'NC', ''),
(143, 'Don', 'Mitchell', 'M', '1946-11-02', 'Fort Lauderdale', 'FL', ''),
(144, 'Mark', 'Monticino', 'M', '1963-07-15', 'Annapolis', 'MD', ''),
(145, 'Kevin ', 'Moran', 'M', '1973-12-13', 'Christiansted', 'VI', ''),
(146, 'Kenneth', 'Morgan', 'M', '1963-01-08', 'Saint Petersburg', 'FL', ''),
(147, 'Celia', 'Morse', 'F', '1961-03-31', 'Nashville', 'TN', 'TN'),
(148, 'Douglas', 'Nelson', 'M', '1955-03-13', 'Christiansted', 'VI', ''),
(149, 'Todd', 'Newman', 'M', '1952-05-04', 'Christiansted', 'VI', ''),
(150, 'Randall', 'Nielsen', 'M', '1967-11-09', 'Christiansted', 'VI', ''),
(151, 'Claire', 'Olechowski', 'F', '1991-02-02', 'Virginia beach', 'VA', ''),
(152, 'Mark', 'Olechowski', 'M', '1959-09-25', 'Annapolis', 'MD', ''),
(153, 'Derek', 'Parsons', 'M', '1960-02-17', 'Sarasota', 'TX', 'FL'),
(154, 'Ashley', 'Peeler', 'F', '1976-01-01', 'Miami', 'FL', ''),
(155, 'Jay', 'Peluso', 'M', '1971-07-15', 'Richmond', 'VA', ''),
(156, 'Deb', 'Peters', 'F', '1962-02-14', 'VENICE', 'FL', ''),
(157, 'Gene', 'Peters', 'M', '1962-02-26', 'VENICE', 'FL', ''),
(158, 'Erin', 'Poe', 'F', '1978-01-20', 'Tampa', 'FL', ''),
(159, 'Frankie', 'Proctor', 'M', '1957-01-28', 'Ft Lauderdale', 'FL', ''),
(160, 'Beth', 'Prodoehl', 'F', '1963-12-30', 'Broomall', 'PA', ''),
(161, 'Rhian', 'Purdy', 'F', '1967-06-10', 'Miami', 'FL', ''),
(162, 'Kristin', 'Putchinski', 'F', '1975-07-17', 'Baltimore', 'MD', ''),
(163, 'Lindy', 'Radow', 'F', '1966-11-29', 'Atlanta', 'GA', ''),
(164, 'Jennifer', 'Regelman', 'F', '1975-01-17', 'Burke', 'VA', ''),
(165, 'Raul', 'Reis', 'M', '1964-04-23', 'Boston', 'MA', ''),
(166, 'Renee', 'Reiser', 'F', '1966-11-05', 'Annapolis', 'MD', ''),
(167, 'Curt', 'Reynolds', 'M', '1960-10-27', 'CHESAPEAK BCH', 'MD', ''),
(168, 'Mark', 'Richards', 'M', '1955-09-25', 'Denver', 'CO', ''),
(169, 'Andrea', 'Ripperger', 'F', '1981-07-29', 'Alexandria', 'VA', ''),
(170, 'Amara', 'Rivera', 'F', '1987-08-18', 'Washington', 'DC', ''),
(171, 'Marcos', 'Rodriguez', 'M', '1959-10-29', 'San Juan', 'PR', ''),
(172, 'Valerie', 'Rogers', 'F', '1954-04-10', 'San Jose', 'CA', ''),
(173, 'Magdalena', 'Sagardia', 'F', '1964-07-05', 'NEW YORK', 'NY', ''),
(174, 'Joshua', 'Salas', 'M', '1985-03-14', 'Tampa', 'Fl', ''),
(175, 'Michael', 'Samway', 'M', '1968-05-01', 'Miami Beach', 'FL', ''),
(176, 'Jennifer', 'Samway', 'F', '1967-10-09', 'Miami Beach', 'FL', ''),
(177, 'Emma', 'Schaefer', 'F', '1988-07-09', 'W Bloomfield', 'MI', ''),
(178, 'Molly', 'Schaefer', 'F', '1993-01-12', 'W Bloomfield', 'MI', ''),
(179, 'Tony', 'Schumacher', 'M', '1987-03-25', 'Fort Collins', 'CO', ''),
(180, 'Joseph', 'Scott', 'M', '1979-05-26', 'Arlington', 'VA', ''),
(181, 'Catherine', 'Seguin', 'F', '1982-06-04', 'Christiansted', 'VI', ''),
(182, 'Robin', 'Seila', 'F', '1983-03-22', 'Christiansted', 'VI', ''),
(183, 'Kathleen', 'Shankwitz', 'F', '1961-04-30', 'Bozeman', 'MT', ''),
(184, 'Dennis', 'Shea', 'M', '1943-11-05', 'Tierra Verde', 'FL', ''),
(185, 'Paula', 'Shea', 'F', '1957-10-19', 'Tierra Verde', 'FL', ''),
(186, 'Diane', 'Shea-Piser', 'F', '1941-07-29', 'St Petersburg', 'FL', ''),
(187, 'Cory', 'Siri', 'F', '1970-12-17', 'Pittsburgh', 'PA', 'PA'),
(188, 'Robert', 'Smith', 'M', '1971-03-14', 'Destin', 'FL', ''),
(189, 'Jaidan', 'Soe Camacho', 'M', '2004-01-14', 'Christiansted', 'VI', ''),
(190, 'Brent', 'Spear', 'M', '1975-02-28', 'Fort Worth', 'TX', ''),
(191, 'Victoria', 'Sperber', 'F', '2005-10-14', 'Christiansted', 'VI', ''),
(192, 'Sarah', 'Sprague', 'F', '1988-04-20', 'W Bloomfield', 'MI', ''),
(193, 'Richard', 'Stauffer', 'M', '1955-02-04', 'Richmond', 'VA', ''),
(194, 'Nancy', 'Steadman Martin', 'F', '1954-07-05', 'Oceanport', 'NJ', ''),
(195, 'Jessica', 'Stokes', 'F', '1976-09-09', 'Somerville', 'MA', ''),
(196, 'Jan', 'Tawakol', 'M', '1971-06-27', 'Christiansted', 'VI', ''),
(197, 'Marcia', 'Taylor', 'F', '1955-07-03', 'Kingshill', 'VI', ''),
(198, 'Win', 'Thomas', 'M', '1949-01-12', 'Christiansted', 'VT', ''),
(199, 'Eduard', 'Tiozzo', 'M', '1973-06-19', 'Coral Gables', 'FL', ''),
(200, 'Guy', 'Tomberlin', 'M', '1964-06-13', 'Bluemont', 'VA', ''),
(201, 'Paul', 'Towers', 'M', '1975-12-02', 'Manhattan Bch', 'CA', ''),
(202, 'John', 'Urschel', 'M', '1970-11-08', 'Amherst', 'MA', ''),
(203, 'Ricardo', 'Valdivia', 'M', '1964-12-26', 'South Miami', 'FL', ''),
(204, 'Stella', 'Valitutto', 'F', '1974-05-26', 'Tampa', 'Fl', 'FL'),
(205, 'Paul', 'Valitutto', 'M', '1971-10-09', 'Clearwater', 'FL', ''),
(206, 'Julie', 'Van Cleave', 'F', '1959-04-26', 'Elm Grove', 'WI', ''),
(207, 'Kristin', 'Volz', 'F', '1973-10-02', 'PLANTATION', 'FL', ''),
(208, 'John', 'Walker', 'M', '1956-01-01', 'Mountain City', 'TN', ''),
(209, 'Ellen', 'Weinberg', 'F', '1961-02-03', 'New York', 'NY', ''),
(210, 'Blair', 'Whitaker', 'M', '1961-04-21', 'Denver', 'CO', ''),
(211, 'Ashley', 'Whitney', 'F', '1979-08-21', 'Nashville', 'TN', ''),
(212, 'Megan', 'Wilson', 'F', '1981-04-07', 'NEW YORK', 'NY', ''),
(213, 'Andrea', 'Woodburn', 'F', '1963-12-09', 'Fort Lauderdale', 'FL', ''),
(214, 'Jude', 'Woodcock', 'F', '1956-05-03', 'St. John', 'VI', ''),
(215, 'Annette', 'Wooddell', 'F', '1964-11-26', 'Brandywine', 'MD', ''),
(216, 'Carol', 'Wortman', 'F', '1966-11-27', 'Alexandria', 'VA', ''),
(217, 'Grace', 'Yaegel', 'F', '2004-04-13', 'Huntingdon', 'PA', ''),
(218, 'Tom', 'Yaegel', 'M', '1978-07-18', 'Huntingdon VY', 'PA', ''),
(219, 'Patricia', 'Young', 'F', '1960-06-23', 'Atlanta', 'GA', ''),
(220, 'Savannah', 'Young', 'F', '1992-09-06', 'Atlanta', 'GA', ''),
(221, 'Jack', 'Zedlitz', 'M', '1974-09-08', 'Oklahoma City', 'OK', ''),
(222, 'Trip', 'Zedlitz', 'M', '1971-07-07', 'Belvedere Tiburon', 'CA', ''),
(223, 'Cathy', 'Blosser', 'F', '1967-02-12', 'Christiansted', 'VI', ''),
(224, 'Barbara', 'West', 'F', '1948-03-05', 'Pittsfield', 'MA', ''),
(225, 'Laurie', 'Brenner', 'F', '1955-10-17', 'Pittsfield', 'MA', ''),
(226, 'Alison', 'Dixon', 'F', '1962-11-03', 'Pittsfield', 'MA', ''),
(227, 'Dan', 'Rogacki', 'M', '1947-06-02', 'Pittsfield', 'MA', ''),
(228, 'Brent', 'Mays', 'M', '1964-09-20', 'Christiansted', '', 'VI');

-- --------------------------------------------------------

--
-- Table structure for table `TimeRace`
--

CREATE TABLE `TimeRace` (
  `ID` int(11) NOT NULL,
  `RaceID` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

-- --------------------------------------------------------

--
-- Table structure for table `TimeSwimmer`
--

CREATE TABLE `TimeSwimmer` (
  `ID` int(11) NOT NULL,
  `RaceSwimmerID` int(11) NOT NULL,
  `FinishTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Races`
--
ALTER TABLE `Races`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RaceSwimmers`
--
ALTER TABLE `RaceSwimmers`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RacerNumber` (`RacerNumber`);

--
-- Indexes for table `Swimmers`
--
ALTER TABLE `Swimmers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TimeRace`
--
ALTER TABLE `TimeRace`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TimeSwimmer`
--
ALTER TABLE `TimeSwimmer`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Races`
--
ALTER TABLE `Races`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `RaceSwimmers`
--
ALTER TABLE `RaceSwimmers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT for table `Swimmers`
--
ALTER TABLE `Swimmers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;
--
-- AUTO_INCREMENT for table `TimeRace`
--
ALTER TABLE `TimeRace`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `TimeSwimmer`
--
ALTER TABLE `TimeSwimmer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
