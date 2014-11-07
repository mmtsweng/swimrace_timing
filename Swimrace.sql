-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 06, 2014 at 07:51 PM
-- Server version: 5.5.40
-- PHP Version: 5.4.34-0+deb7u1

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
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=151 ;

--
-- Dumping data for table `RaceSwimmers`
--

INSERT INTO `RaceSwimmers` (`ID`, `SwimmerID`, `RaceID`, `RacerNumber`, `HasFins`) VALUES
(1, 1, 3, 125, 0),
(2, 2, 3, 126, 0),
(3, 3, 3, 127, 0),
(4, 4, 3, 128, 0),
(5, 5, 3, 129, 0),
(6, 6, 3, 130, 0),
(7, 7, 3, 131, 0),
(8, 8, 3, 132, 0),
(9, 9, 3, 133, 0),
(10, 10, 3, 134, 0),
(11, 11, 3, 135, 0),
(12, 12, 3, 136, 0),
(13, 13, 3, 137, 0),
(14, 14, 3, 138, 0),
(15, 15, 3, 139, 0),
(16, 16, 3, 140, 0),
(17, 17, 3, 141, 0),
(18, 18, 3, 142, 0),
(19, 19, 3, 143, 0),
(20, 20, 3, 144, 0),
(21, 21, 3, 145, 0),
(22, 22, 3, 146, 0),
(23, 23, 3, 147, 0),
(24, 24, 3, 148, 0),
(25, 25, 3, 149, 0),
(26, 26, 3, 150, 0),
(27, 27, 3, 151, 0),
(28, 28, 3, 152, 0),
(29, 29, 3, 153, 0),
(30, 30, 3, 154, 0),
(31, 31, 3, 155, 1),
(32, 32, 2, 225, 0),
(33, 33, 2, 226, 0),
(34, 34, 2, 227, 0),
(35, 35, 2, 228, 0),
(36, 36, 2, 229, 0),
(37, 37, 2, 230, 0),
(38, 38, 2, 231, 0),
(39, 39, 2, 232, 0),
(40, 41, 2, 233, 0),
(41, 42, 2, 234, 0),
(42, 43, 2, 235, 0),
(43, 44, 2, 236, 0),
(44, 45, 2, 237, 0),
(45, 46, 2, 238, 0),
(46, 47, 2, 239, 0),
(47, 48, 2, 240, 0),
(48, 49, 2, 241, 0),
(49, 50, 2, 242, 0),
(50, 51, 2, 243, 0),
(51, 52, 2, 244, 0),
(52, 53, 2, 245, 0),
(53, 54, 2, 246, 0),
(54, 56, 2, 247, 0),
(55, 57, 2, 248, 0),
(56, 58, 2, 249, 0),
(57, 59, 2, 250, 0),
(58, 60, 2, 251, 0),
(59, 61, 2, 252, 0),
(60, 62, 2, 253, 0),
(61, 63, 2, 254, 0),
(62, 64, 2, 255, 0),
(63, 65, 2, 256, 0),
(64, 66, 2, 257, 0),
(65, 67, 2, 258, 0),
(66, 68, 2, 259, 0),
(67, 69, 2, 260, 0),
(68, 70, 2, 261, 0),
(69, 71, 2, 262, 0),
(70, 72, 2, 263, 0),
(71, 73, 2, 264, 0),
(72, 74, 2, 265, 0),
(73, 75, 2, 266, 0),
(74, 76, 2, 267, 0),
(75, 77, 2, 268, 1),
(76, 78, 2, 269, 1),
(77, 79, 2, 270, 1),
(78, 80, 2, 271, 1),
(79, 81, 1, 25, 0),
(80, 82, 1, 26, 0),
(81, 83, 1, 27, 0),
(82, 84, 1, 28, 0),
(83, 85, 1, 29, 0),
(84, 86, 1, 30, 0),
(85, 87, 1, 31, 0),
(86, 88, 1, 32, 0),
(87, 89, 1, 33, 0),
(88, 90, 1, 34, 0),
(89, 91, 1, 35, 0),
(90, 92, 1, 36, 0),
(91, 93, 1, 37, 0),
(92, 94, 1, 38, 0),
(93, 95, 1, 39, 0),
(94, 96, 1, 40, 0),
(95, 97, 1, 41, 0),
(96, 98, 1, 42, 0),
(97, 99, 1, 43, 0),
(98, 100, 1, 44, 0),
(99, 101, 1, 45, 0),
(100, 102, 1, 46, 0),
(101, 103, 1, 47, 0),
(102, 104, 1, 48, 0),
(103, 105, 1, 49, 0),
(104, 106, 1, 50, 0),
(105, 107, 1, 51, 0),
(106, 108, 1, 52, 0),
(107, 109, 1, 53, 0),
(108, 110, 1, 23, 0),
(109, 111, 1, 55, 0),
(110, 112, 1, 56, 0),
(111, 113, 1, 57, 0),
(112, 114, 1, 58, 0),
(113, 115, 1, 59, 0),
(114, 116, 1, 60, 0),
(115, 117, 1, 61, 0),
(116, 118, 1, 62, 0),
(117, 119, 1, 63, 0),
(118, 120, 1, 64, 0),
(119, 121, 1, 65, 0),
(120, 122, 1, 66, 0),
(121, 123, 1, 67, 0),
(122, 124, 1, 68, 0),
(123, 125, 1, 69, 0),
(124, 126, 1, 70, 0),
(125, 127, 1, 71, 0),
(126, 128, 1, 72, 0),
(127, 129, 1, 73, 0),
(128, 130, 1, 74, 0),
(129, 131, 1, 75, 0),
(130, 132, 1, 76, 0),
(131, 133, 1, 77, 0),
(132, 134, 1, 78, 0),
(133, 135, 1, 79, 0),
(134, 136, 1, 80, 0),
(135, 137, 1, 81, 0),
(136, 138, 1, 82, 0),
(137, 139, 1, 83, 0),
(138, 140, 1, 84, 0),
(139, 141, 1, 85, 0),
(140, 142, 1, 86, 0),
(141, 143, 1, 87, 0),
(142, 144, 1, 88, 0),
(143, 145, 1, 89, 0),
(144, 146, 1, 90, 0),
(145, 147, 1, 91, 0),
(146, 148, 1, 92, 0),
(147, 149, 1, 93, 0),
(148, 150, 1, 94, 1),
(149, 0, 0, 0, 0),
(150, 0, 0, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=armscii8 AUTO_INCREMENT=151 ;

--
-- Dumping data for table `Swimmers`
--

INSERT INTO `Swimmers` (`ID`, `FirstName`, `LastName`, `Gender`, `Birthdate`, `City`, `State`, `Country`) VALUES
(1, 'Amy', 'Alexander', 'F', '1972-07-17', 'Christiansted', '', 'USVI'),
(2, 'Alphonso', 'Andrews', 'M', '1958-01-27', 'St. Croix', '', 'USVI'),
(3, 'Jeremy', 'Berger', 'M', '1900-01-00', '', '', ''),
(4, 'Hannah', 'Boring', 'F', '2002-09-07', 'St. Croix', '', 'USVI'),
(5, 'Emma', 'Bourque', 'F', '1978-07-29', 'St. Croix', '', 'USVI'),
(6, 'Janette', 'Bowers', 'F', '1968-01-27', 'St. Croix', '', 'USVI'),
(7, 'Donna', 'Courtney', 'F', '1953-02-21', 'Georgetown', '', 'TX'),
(8, 'Mary Anne', 'Cunneen', 'F', '1966-08-13', 'Durham', '', 'NC'),
(9, 'Kelly', 'Cunneen', 'F', '1999-05-21', 'Durham', '', 'NC'),
(10, 'Steve', 'Dean', 'M', '1965-08-01', '', '', ''),
(11, 'Jake', 'Ettore', 'M', '1986-10-03', 'New York', '', 'NY'),
(12, 'John', 'Harper', 'M', '1959-08-03', 'St. Croix', '', 'USVI'),
(13, 'Kyle', 'Higgins', 'M', '1996-09-02', 'Cary', '', 'NC'),
(14, 'Laurel', 'Kimbrough', 'F', '1967-08-07', 'Atlanta', '', 'GA'),
(15, 'Graeme', 'Kirven', 'M', '1998-09-02', 'Durham', '', 'NC'),
(16, 'Ian', 'Kirven', 'M', '1996-11-11', 'Durham', '', 'NC'),
(17, 'Alexander', 'Kontos', 'M', '1996-11-10', 'Durham', '', 'NC'),
(18, 'Patricia', 'Mcgovern', 'F', '1949-05-09', 'New York', '', 'NY'),
(19, 'Kenneth', 'Morgan', 'F', '1968-06-20', 'Centennial', '', 'CO'),
(20, 'Erich', 'Narten', 'M', '1997-01-22', 'Durham', '', 'NC'),
(21, 'Randall', 'Nielsen', 'M', '1967-11-09', 'St. Croix', '', 'USVI'),
(22, 'Jennie', 'Ogden', 'F', '1978-11-14', 'St. Croix', '', 'USVI'),
(23, 'Patty', 'Patton', 'F', '1967-09-23', 'St. Croix', '', 'USVI'),
(24, 'Susan', 'Rodger', 'F', '1961-05-05', 'Durham', '', 'NC'),
(25, 'Leslie', 'Sparks', 'F', '1970-11-23', 'St. Croix', '', 'USVI'),
(26, 'Pamela', 'Terry', 'F', '1984-04-10', 'Christiansted', '', 'USVI'),
(27, 'Dennis', 'Thompson', 'M', '1954-09-09', 'Rockford', '', 'IL'),
(28, 'Tracy', 'White', 'F', '1972-10-14', 'Longwood', '', 'FL'),
(29, 'Ryan', 'Williams', 'M', '1973-05-25', 'Pompano Beach', '', 'FL'),
(30, 'Cliff', 'Wolf', 'M', '1953-03-31', 'Mamaroneck', '', 'NY'),
(31, 'Avery', 'Ross', 'F', '1947-07-03', 'New York City', '', 'NY'),
(32, 'Heather', 'Barna', 'F', '1971-04-27', 'Boston', '', 'MA'),
(33, 'Catherine', 'Bergstedt-Curry', 'F', '1965-11-20', 'Indianapolis', '', 'IN'),
(34, 'Kelly', 'Boring', 'F', '1971-01-19', 'St. Croix', '', 'USVI'),
(35, 'Douglas', 'Bosley', 'M', '1962-07-02', 'Somerville', '', 'MA'),
(36, 'Colette', 'Boulin', 'F', '1970-04-13', 'Washington', '', 'DC'),
(37, 'Deb', 'Cohen', 'F', '1965-04-16', 'Oakton', '', 'VA'),
(38, 'Andy', 'Cohen', 'M', '1965-09-13', 'Oakton', '', 'VA'),
(39, 'David', 'Conover', 'M', '1950-12-22', 'Great Falls', '', 'VA'),
(41, 'Stephanie', 'Crofton Carey', 'F', '1958-08-13', 'Brick', '', 'NJ'),
(42, 'John', 'Eaton', 'M', '1971-03-06', 'San Antonio', '', 'TX'),
(43, 'Esther', 'Ellis', 'F', '1980-03-28', 'St. Croix', '', 'USVI'),
(44, 'Brett', 'Ellis', 'M', '1975-05-30', 'St. Croix', '', 'USVI'),
(45, 'Maureen', 'Flynn', 'F', '1964-10-10', 'Jamaica Plain', '', 'MA'),
(46, 'Stirling ', 'Gardner', 'M', '1969-05-22', 'Houston', '', 'TX'),
(47, 'Daniel', 'Garriga-Cerni', 'M', '1999-11-15', 'Christiansted', '', 'USVI'),
(48, 'Marc', 'Gershel', 'M', '1971-11-24', 'New York', '', 'NY'),
(49, 'Matthew', 'Gillotti', 'M', '1988-05-05', '', '', ''),
(50, 'Jay', 'Gleason', 'M', '1974-10-02', 'St Croix', '', 'USVI'),
(51, 'Nathaniel', 'Greeley', 'M', '1997-05-14', 'Durham', '', 'NC'),
(52, 'Edward', 'Hardin', 'M', '1943-02-01', 'Atlanta', '', 'GA'),
(53, 'Laura', 'Hingle', 'F', '1965-01-06', 'Montville', '', 'NJ'),
(54, 'Helge', 'Hinrichs', 'M', '1967-12-05', 'Berlin', '', 'DE'),
(56, 'Megan', 'Jones', 'F', '1979-10-08', 'Charlottesville', '', 'VA'),
(57, 'Natalia', 'Kuipers', 'F', '2002-06-13', 'St. Croix', '', 'USVI'),
(58, 'Kelly', 'Kuipers', 'F', '1969-02-16', 'St. Croix', '', 'USVI'),
(59, 'Bradley', 'Leisure', 'M', '1954-09-24', 'Blain', '', 'PA'),
(60, 'Dedrick', 'Luikens', 'M', '1976-03-12', 'St. Croix', '', 'USVI'),
(61, 'Kara', 'Lukehart', 'F', '1971-04-03', 'Denver', '', 'NC'),
(62, 'Ray', 'Lutz', 'M', '1953-12-27', 'St. Croix', '', 'USVI'),
(63, 'Marshall', 'Morgan', 'M', '1954-02-22', 'Watertown', '', 'MA'),
(64, 'David', 'Oakes', 'M', '1954-10-04', 'Indianapolis', '', 'IN'),
(65, 'Susan', 'O''Connor', 'F', '1958-09-05', 'Scranton', '', 'PA'),
(66, 'Thomas', 'Olson', 'M', '1996-11-26', 'Durham', '', 'NC'),
(67, 'Laura', 'Parsons', 'F', '1961-05-24', 'Charlottesville', '', 'VA'),
(68, 'Emma', 'Rearson', 'F', '2000-08-01', 'Dresher ', '', 'PA'),
(69, 'Douglas', 'Schaefer', 'M', '1959-03-14', 'Denver', '', 'CO'),
(70, 'Gina', 'Soloperto', 'F', '1973-08-30', 'New York', '', 'NY'),
(71, 'Kirth', 'Steele', 'M', '1959-09-11', '', '', ''),
(72, 'Karen', 'Steele', 'F', '1970-05-26', '', '', ''),
(73, 'Oscar', 'Suzuki', 'M', '1979-06-06', 'Chapel Hill', '', 'NC'),
(74, 'Jacqueline', 'Wolfson', 'F', '1962-01-30', '', '', ''),
(75, 'Jude', 'Woodcock', 'F', '1956-03-05', 'St. John', '', 'USVI'),
(76, 'Valerie', 'Zemmel', 'F', '1980-05-05', '', '', ''),
(77, 'Joseph', 'Kasimer', 'M', '1950-10-13', 'Annandale', '', 'VA'),
(78, 'Christopher', 'Kontos', 'M', '1962-05-09', 'Durham', '', 'NC'),
(79, 'Caroline', 'Whitlock', 'F', '1961-04-22', 'Kent', '', 'WA'),
(80, 'Tammy', 'Zitello', 'F', '1962-02-09', 'Chamblee', '', 'GA'),
(81, 'Maxwell', 'Adams', 'M', '1969-10-06', 'Lancaster', '', 'PA'),
(82, 'Seth', 'Andrews', 'M', '1900-01-00', 'St. Croix', '', 'USVI'),
(83, 'Jennifer', 'Andrews', 'F', '1900-01-00', 'St. Croix', '', 'USVI'),
(84, 'Nicole', 'Angeli', 'F', '1986-11-26', 'Cabo Rojo', '', 'PR'),
(85, 'Elizabeth', 'Armstong', 'F', '1900-01-00', 'St. Croix', '', 'USVI'),
(86, 'Brian', 'Awe', 'M', '1984-09-20', 'Boston', '', 'MA'),
(87, 'Guy', 'Ben-Ishai', 'M', '1971-05-24', 'New York', '', 'NY'),
(88, 'Lidia', 'Boguslawska', 'F', '2001-09-25', 'St. Croix', '', 'USVI'),
(89, 'David', 'Bonita', 'M', '1975-07-17', 'New York', '', 'NY'),
(90, 'Jamie', 'Breen', 'M', '1961-08-07', 'Atlanta', '', 'GA'),
(91, 'Bonnie', 'Brown', 'F', '1967-09-21', 'Woodside', '', 'USVI'),
(92, 'Erin', 'Cahill', 'F', '1971-08-18', '', '', ''),
(93, 'Thomas', 'Calhoon', 'M', '1970-12-21', 'St. Croix', '', 'USVI'),
(94, 'Richard', 'Carter', 'M', '1977-07-31', 'Delray Beach', '', 'FL'),
(95, 'Jack', 'Courtney', 'M', '1953-06-03', 'Georgetown', '', 'TX'),
(96, 'David', 'Cowperthwaite', 'M', '1962-03-29', 'Parkes', '', 'NSW'),
(97, 'Fred', 'Creamer', 'M', '1961-12-06', 'Colorado Springs', '', 'CO'),
(98, 'Joseph', 'Croney', 'M', '1977-05-11', 'Christiansted', '', 'USVI'),
(99, 'Bruce', 'Diel', 'M', '1900-01-00', '', '', ''),
(100, 'Carina', 'Eisenhardt', 'F', '1975-09-09', 'Frederiksberg', '', 'DK'),
(101, 'John', 'Enquist', 'M', '1962-01-27', 'Old Greenwich', '', 'CT'),
(102, 'Gavin', 'Gassen', 'M', '1966-08-03', 'St. Croix', '', 'USVI'),
(103, 'Sarah', 'Greeley', 'F', '1964-07-27', 'Durham', '', 'NC'),
(104, 'Bob', 'Halk', 'M', '1900-01-00', 'St. Croix', '', 'USVI'),
(105, 'Corey', 'Hardin', 'M', '1970-01-22', 'Somerville', '', 'MA'),
(106, 'Petr', 'Havlik', 'M', '1986-11-20', 'Novy Jicin', '', 'DC'),
(107, 'Patty', 'Hermann', 'F', '1959-09-06', 'Houston', '', 'TN'),
(108, 'Shelley', 'Hollingsworth', 'F', '1972-08-10', 'Raleigh', '', 'NC'),
(109, 'Seth', 'Huston', 'M', '1964-10-20', 'Katy', '', 'TX'),
(110, 'Misty', 'Hyman', 'F', '1979-01-01', 'St. Croix', '', 'USVI'),
(111, 'Laura', 'Jones', 'F', '1995-07-23', 'Charlottesville', '', 'VA'),
(112, 'Ryan', 'Jurkovic', 'M', '1982-01-01', 'New York', '', 'NY'),
(113, 'Susan', 'Kasimer', 'F', '1982-04-13', 'Mclean', '', 'VA'),
(114, 'Erich', 'Kimbrough', 'M', '1962-08-22', 'Atlanta', '', 'GA'),
(115, 'Alex ', 'Kostich', 'M', '1900-01-00', 'Los Angeles', '', 'CA'),
(116, 'Laura', 'Lipscomb', 'F', '1953-12-23', 'Irving', '', 'TX'),
(117, 'Bob', 'Littlefield', 'M', '1961-12-16', 'Danville', '', 'CA'),
(118, 'Matt', 'Martelli', 'M', '1974-11-25', 'Philadelphia', '', 'PA'),
(119, 'Kathy', 'Masterson', 'F', '1949-08-10', 'Decatur', '', 'GA'),
(120, 'Jennifer', 'Mayfield', 'F', '1975-10-15', 'Holly Springs', '', 'NC'),
(121, 'Matthew', 'Mays', 'M', '1998-12-15', 'St. Croix', '', 'USVI'),
(122, 'Michael', 'Mcgean', 'M', '1995-05-06', 'Lincoln', '', 'MA'),
(123, 'Mary', 'Mclaughlin', 'F', '1963-10-29', 'Wildwood', '', 'MO'),
(124, 'Victor', 'Mestre', 'M', '1967-06-24', 'Key Biscayne', '', 'FL'),
(125, 'Jeff', 'Miller', 'M', '1961-05-14', 'St. Croix', '', 'USVI'),
(126, 'Louise', 'Mooney', 'F', '1981-02-25', '', '', ''),
(127, 'Vincent', 'Natali', 'M', '1970-12-19', 'Mercer Island', '', 'WA'),
(128, 'Todd', 'Newman', 'M', '1900-01-00', 'St. Croix', '', 'USVI'),
(129, 'Tina', 'Oakes', 'F', '1961-08-23', 'Indianapolis', '', 'IN'),
(130, 'Angelica', 'Pasqualini', 'F', '1978-11-21', '', '', ''),
(131, 'Martina', 'Pavlicova', 'F', '1972-01-02', 'New York', '', 'NY'),
(132, 'Chloe', 'Phillips-Hayden', 'F', '1999-07-13', 'St. Croix', '', 'USVI'),
(133, 'Beth', 'Prodoehl', 'F', '1963-12-30', 'Broomall', '', 'PA'),
(134, 'Andrew', 'Rearson', 'M', '1996-10-30', 'Dresher ', '', 'PA'),
(135, 'Jon', 'Reichlin', 'M', '1956-05-29', 'Gladwyne', '', 'PA'),
(136, 'Sarah', 'Ridgway', 'F', '1985-01-04', 'St. Croix', '', 'USVI'),
(137, 'Michael', 'Rogers', 'M', '1982-06-29', 'Christiansted', '', 'USVI'),
(138, 'Laura', 'Rosiecki', 'F', '1978-10-01', 'Manhattan Beach', '', 'CA'),
(139, 'Basil', 'Stamos', 'M', '1961-03-23', 'San Francisco ', '', 'CA'),
(140, 'Michelle', 'Staniunas', 'F', '1973-10-14', 'Raleigh', '', 'NC'),
(141, 'Greg', 'Sullivan', 'M', '1958-11-08', 'Sloatsburg', '', 'NY'),
(142, 'Jonathan', 'Thomas', 'M', '1999-01-15', 'St. Croix', '', 'USVI'),
(143, 'Liz', 'Uribe', 'F', '1987-08-16', 'Iowa City', '', 'IA'),
(144, 'Anthony', 'Utrie', 'M', '1962-07-25', 'West Bend', '', 'WI'),
(145, 'Jack', 'Van Coevering', 'M', '1958-11-17', 'Caledonia', '', 'MI'),
(146, 'Earl', 'Walton', 'M', '1973-03-09', '', '', ''),
(147, 'Janie', 'White', 'F', '1959-02-17', 'Paradise Valley', '', 'AZ'),
(148, 'Thierry', 'Wilbrandt', 'M', '1956-03-07', 'Indianapolis', '', 'IN'),
(149, 'Kami', 'Wood', 'F', '1967-02-26', 'Highlands Ranch', '', 'CO'),
(150, 'Patsy', 'Cowperthwaite', 'F', '1962-01-07', 'Parkes', '', 'NSW');

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
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 AUTO_INCREMENT=1 ;

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
