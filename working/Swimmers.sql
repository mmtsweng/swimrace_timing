-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 07, 2015 at 08:58 PM
-- Server version: 5.5.44-0+deb8u1
-- PHP Version: 5.6.13-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `Swimmers`
--

CREATE TABLE IF NOT EXISTS `Swimmers` (
`ID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Gender` varchar(2) NOT NULL,
  `Birthdate` date NOT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `Swimmers`
--

INSERT INTO `Swimmers` (`ID`, `FirstName`, `LastName`, `Gender`, `Birthdate`, `City`, `State`, `Country`) VALUES
(1, 'Amanda', 'Almon', 'F', '1979-11-07', 'Glassboro', 'NJ', ''),
(2, 'Alphonso', 'Andrews', 'M', '1958-11-07', 'St Croix', 'VI', ''),
(3, 'Meghan', 'Awe', 'F', '1984-11-07', 'Boston', 'MA', ''),
(4, 'Jennifer', 'Cappeto', 'F', '1977-11-07', 'Denver', 'CO', ''),
(5, 'Alicia', 'Churaman', 'F', '1968-11-07', 'St Croix', 'VI', ''),
(6, 'Louise', 'Conover', 'F', '1951-11-07', 'Great Falls', 'VA', ''),
(7, 'Lisa', 'Gay', 'F', '1978-11-07', 'St Croix', 'VI', ''),
(8, 'Adam', 'Granoff', 'M', '1978-11-07', 'New York', 'NY', ''),
(9, 'David', 'Greeley', 'M', '2003-11-07', 'Durham', 'NC', ''),
(10, 'Don', 'Greeley', 'M', '1957-11-07', 'Durham', 'NC', ''),
(11, 'Troy', 'Holloway', 'M', '1963-11-07', 'St Croix', 'VI', ''),
(12, 'Misty', 'Hyman', 'F', '1980-11-07', 'Phoenix', 'AZ', ''),
(13, 'Dave', 'Johnson', 'M', '1950-11-07', 'Houston', 'TX', ''),
(14, 'Robb', 'Kuczynski', 'M', '1985-11-07', 'St Croix', 'VI', ''),
(15, 'Stella', 'Valitutto', 'F', '1974-11-07', 'Tampa', 'FL', ''),
(16, 'Steve', 'Lee', 'M', '1955-11-07', 'Tulsa', 'OK', ''),
(17, 'Patricia', 'McGovern', 'F', '1949-11-07', 'New York', 'NY', ''),
(18, 'Billy', 'McKnight', 'M', '1966-11-07', 'St Pete Beach', 'FL', ''),
(19, 'Dan', 'Meek', 'M', '1956-11-07', 'Franklin', 'WI', ''),
(20, 'Randall', 'Nielsen', 'M', '1968-11-07', 'St Croix', 'VI', ''),
(21, 'Kelley', 'Roebuck', 'F', '1980-11-07', 'St Croix', 'VI', ''),
(22, 'LaShawn', 'Soto', 'F', '1965-11-07', 'St Croix', 'VI', ''),
(23, 'Susan', 'Stallard', 'F', '1963-11-07', 'Falls Church', 'VA', ''),
(24, 'Rebekah', 'Trevino', 'F', '1974-11-07', 'San Antonio', 'TX', ''),
(25, 'John', 'Urschel', 'M', '1970-11-07', 'Amherst', 'MA', ''),
(26, 'Aidan', 'Urschel', 'M', '2001-11-07', 'Amherst', 'MA', ''),
(27, 'Drew', 'Wall', 'M', '1980-11-07', 'St Croix', 'VI', ''),
(28, 'Patrick', 'Wright', 'M', '1973-11-07', 'Denver', 'CO', ''),
(29, 'Parker', 'Younger', 'M', '2004-11-07', 'St Croix', 'VI', ''),
(30, 'Lisa', 'McKnight', 'F', '1969-11-07', 'St Pete Beach', 'FL', ''),
(31, 'Paula', 'McNichols', 'F', '1943-11-07', 'Winchester', 'VA', ''),
(32, 'Michelle', 'Veilleux', 'F', '1968-11-07', 'Saint Petersburg', 'FL', ''),
(33, 'Paul', 'Allaire', 'M', '1960-11-07', 'Watkinsville', 'GA', ''),
(34, 'Erin', 'Andrews', 'F', '2004-11-07', 'St. Croix', 'VI', ''),
(35, 'Holly', 'Apple', 'F', '1965-11-07', 'Whitefish', 'MT', ''),
(36, 'Holly', 'Ball', 'F', '1966-11-07', 'Town And Country', 'MO', ''),
(37, 'Gonzalo', 'Berrios', 'M', '1987-11-07', 'St Croix', 'VI', ''),
(38, 'Edward', 'Boaz', 'M', '1954-11-07', 'Naples', 'FL', ''),
(39, 'Hannah', 'Boring', 'F', '2002-11-07', 'St. Croix', 'VI', ''),
(40, 'Emma', 'Bourque', 'F', '1978-11-05', 'St. Croix', 'VI', ''),
(41, 'Mike', 'Bourque', 'M', '1977-07-20', 'St. Croix', 'VI', ''),
(42, 'David', 'Conover', 'M', '1951-11-07', 'Great Falls', 'VA', ''),
(43, 'Karen', 'Dion', 'F', '1966-11-07', 'Lakeside', 'MT', ''),
(44, 'Jeff', 'Dykstra', 'M', '1973-11-07', 'St. Croix', 'VI', ''),
(45, 'Sara ', 'Fauguher', 'F', '1978-11-07', 'St Croix', 'VI', ''),
(46, 'Marc', 'Gershel', 'M', '1972-11-07', 'New York', 'NY', ''),
(47, 'Ariel', 'Granoff', 'F', '1985-11-07', 'New York', 'NY', ''),
(48, 'Matthew', 'Greeley', 'M', '2001-11-07', 'Durham', 'NC', ''),
(49, 'Craig', 'Harrington', 'M', '1956-11-07', 'Naples', 'FL', ''),
(50, 'Jeanine', 'Hartnett', 'F', '1950-11-07', 'New York', 'NY', ''),
(51, 'Reynold', 'Hoover', 'M', '1961-11-07', 'Silver Spring', 'MD', ''),
(52, 'Jan', 'Johnson', 'F', '1952-11-07', 'Houston', 'TX', ''),
(53, 'Megan', 'Jones', 'F', '1979-11-07', 'New York', 'NY', ''),
(54, 'Anthony M', 'Kelly', 'M', '1955-11-07', 'Houston', 'TX', ''),
(55, 'Keith', 'Kelly', 'M', '1952-11-07', 'Tulsa', 'OK', ''),
(56, 'Kelly', 'Kuipers', 'F', '1969-11-07', 'St Croix', 'VI', ''),
(57, 'Elizabeth', 'Lennon', 'F', '1963-11-07', 'Phoenix', 'AZ', ''),
(58, 'Rolf', 'Lindberg', 'M', '1960-11-07', 'Shoreview', 'MN', ''),
(59, 'Victoria', 'Long', 'F', '1982-11-07', 'Alexandria', 'VA', ''),
(60, 'Kari', 'Loya', 'M', '1971-11-07', 'Kingshill', 'VI', ''),
(61, 'Elizabeth', 'Makman', 'F', '1962-11-07', 'Kalispell', 'MT', ''),
(62, 'Darcy', 'Marshall', 'F', '1961-11-07', 'Houston', 'TX', ''),
(63, 'Joel', 'McGlynn', 'M', '1959-11-07', 'Englewood', 'CO', ''),
(64, 'Mollie', 'Nadler', 'F', '1984-11-07', 'St Croix', 'VI', ''),
(65, 'Alyssa', 'Nielsen', 'F', '1986-11-07', 'Houston', 'TX', ''),
(66, 'Susan', 'O''Connor', 'F', '1958-11-07', 'Scranton', 'PA', ''),
(67, 'Laura', 'Parsons', 'F', '1961-11-07', 'Lexington', 'VA', ''),
(68, 'Adriana', 'Saunier', 'F', '1955-11-07', 'Kalispell', 'MT', ''),
(69, 'Jan', 'Schoenbauer', 'F', '1954-11-07', 'Washington', 'DC', ''),
(70, 'Leonard', 'Shannon', 'M', '1955-11-07', 'Pike Road', 'AL', ''),
(71, 'Joseph', 'Shannon', 'M', '1956-11-07', 'Hoffman Estates', 'IL', ''),
(72, 'Denise', 'Smart', 'F', '1963-11-07', 'Tulsa', 'OK', ''),
(73, 'Faith', 'Snow', 'F', '2000-11-07', 'St Croix', 'VI', ''),
(74, 'Karen', 'Steele', 'F', '1970-11-07', 'Bethlehem', 'PA', ''),
(75, 'Kirth', 'Steele', 'M', '1959-11-07', 'Bethlehem', 'PA', ''),
(76, 'Natalia', 'Westphal', 'F', '1959-11-07', 'Whitefish', 'MT', ''),
(77, 'James', 'Whitehurst', 'M', '1947-11-07', 'St Croix', 'VI', ''),
(78, 'Kathy', 'Allaire', 'F', '1960-11-07', 'Watkinsville', 'GA', ''),
(79, 'Joseph', 'Kasimer', 'M', '1950-11-07', 'Annandale', 'VA', ''),
(80, 'Tammy', 'Zitello', 'F', '1962-11-07', 'Atlanta', 'GA', ''),
(81, 'Kate', 'Alexander', 'F', '1958-11-07', 'Grand Cayman', 'CAY', ''),
(82, 'Jennifer', 'Andrews', 'F', '1973-11-07', 'St. Croix', 'VI', ''),
(83, 'Seth', 'Andrews', 'M', '1973-11-07', 'St. Croix', 'VI', ''),
(84, 'Elizabeth', 'Armstrong', 'F', '1966-11-07', 'St. Croix', 'VI', ''),
(85, 'Brian', 'Awe', 'M', '1984-11-07', 'Boston', 'MA', ''),
(86, 'Hal', 'Ball', 'M', '1962-11-07', 'St. Louis', 'MO', ''),
(87, 'GUY', 'BEN-ISHAI', 'M', '1971-11-07', 'New York', 'NY', ''),
(88, 'Rob', 'Benson', 'M', '1968-11-07', 'Mount Desert', 'ME', ''),
(89, 'Julie', 'Billingsley', 'F', '1959-11-07', 'Chevy Chase', 'MD', ''),
(90, 'Lydia', 'Boguslawska', 'F', '2001-11-07', 'St. Croix', 'VI', ''),
(91, 'Kelly', 'Boring', 'F', '1971-11-07', 'St Croix', 'VI', ''),
(92, 'Jane', 'Botta', 'F', '1968-11-07', 'Frankfort', 'IL', ''),
(93, 'Susan', 'Bowman', 'F', '1956-11-07', 'New York', 'NY', ''),
(94, 'Webster', 'Bozzo', 'M', '1999-11-07', 'St Croix', 'Vi', ''),
(95, 'Jamie', 'Breen', 'M', '1961-11-07', 'Atlanta', 'GA', ''),
(96, 'Peter', 'Brohn', 'M', '1968-11-07', 'Houston', 'TX', ''),
(97, 'Karen', 'Brohn', 'F', '1969-11-07', 'Houston', 'TX', ''),
(98, 'Melissa', 'Bybee', 'F', '1966-11-07', 'New York', 'NY', ''),
(99, 'Nick', 'Clark', 'M', '1983-11-07', 'Dallas', 'TX', ''),
(100, 'Chad', 'Cook', 'M', '1976-11-07', 'Dallas', 'TX', ''),
(101, 'David', 'Cowperthwaite', 'M', '1962-11-07', 'Parkes', 'NSW', ''),
(102, 'Bob', 'Crew', 'M', '1959-11-07', 'Wichita', 'KS', ''),
(103, 'Portia', 'Culley', 'F', '2015-11-07', 'Lake Worth', 'FL', ''),
(104, 'Sydne', 'Didier', 'F', '1971-11-07', 'Amherst', 'MA', ''),
(105, 'Lisa', 'Dougherty', 'F', '1965-11-07', 'Bradenton', 'FL', ''),
(106, 'Tom', 'Dougherty', 'M', '1958-11-07', 'Bradenton', 'FL', ''),
(107, 'John', 'Enquist', 'M', '1962-11-07', 'Old Greenwich', 'CT', ''),
(108, 'Robert', 'Farris', 'M', '1955-11-07', 'Katy', 'TX', ''),
(109, 'Gabriela', 'Feibel', 'F', '1988-11-07', 'Arlington', 'VA', ''),
(110, 'Ryan', 'Finan', 'M', '1989-11-07', 'Christiansted', 'VI', ''),
(111, 'JeanMarc', 'Fontaine', 'M', '1970-11-07', 'Greenacres', 'FL', ''),
(112, 'Thomas', 'Fontaine', 'M', '2001-11-07', 'Greenacres', 'FL', ''),
(113, 'Aaron', 'Freedman', 'M', '1963-11-07', 'St. Petersburg', 'FL', ''),
(114, 'Gavin', 'Gassen', 'M', '1966-11-07', 'St Croix', 'VI', ''),
(115, 'Jason', 'Gleason', 'M', '1974-11-07', 'St Croix', 'VI', ''),
(116, 'Lyn', 'Goldsmith', 'F', '1952-11-07', 'New York', 'NY', ''),
(117, 'Christopher', 'Graefe', 'M', '1974-11-07', 'Jamaica Plain', 'MA', ''),
(118, 'Sarah', 'Greeley', 'F', '1964-11-07', 'Durham', 'NC', ''),
(119, 'Bob', 'Halk', 'M', '1971-11-07', 'St. Croix', 'VI', ''),
(120, 'Petr', 'Havlik', 'M', '1987-11-07', 'Washington', 'DC', ''),
(121, 'kris', 'helke', 'F', '1969-11-07', 'Charleston', 'SC', ''),
(122, 'Patricia', 'Hickey', 'F', '1969-11-07', 'Arlington', 'VA', ''),
(123, 'Laura', 'Jones', 'F', '1965-11-07', 'Charlottesville', 'VA', ''),
(124, 'Rob', 'Jones', 'M', '1965-11-07', 'Charlottesville', 'VA', ''),
(125, 'Steve', 'Kammererzalt', 'M', '1973-11-07', 'St. Croix', 'VI', ''),
(126, 'Susan', 'Kasimer', 'F', '1982-11-07', 'Mclean', 'VA', ''),
(127, 'Christian', 'Keldsen', 'M', '1976-11-07', 'Nuuk', 'Greenland', ''),
(128, 'Kari', 'Kennedy', 'F', '1968-11-07', 'Flower Mound', 'TX', ''),
(129, 'Erich', 'Kimbrough', 'M', '1962-11-07', 'Atlanta', 'GA', ''),
(130, 'Kathryn', 'Kirmayer', 'F', '1964-11-07', 'Silver Spring', 'MD', ''),
(131, 'Christopher', 'Kirwan', 'M', '1965-11-07', 'Overland Park', 'KS', ''),
(132, 'Allison', 'Klein', 'F', '1972-11-07', 'Arlington', 'VA', ''),
(133, 'Alex', 'Kostich', 'M', '1971-11-07', 'Los Angeles', 'CA', ''),
(134, 'Natalia', 'Kuipers', 'F', '2002-11-07', 'St. Croix', 'VI', ''),
(135, 'Pauline Claire', 'Leith', 'F', '1963-11-07', 'Houston', 'TX', ''),
(136, 'Karmen', 'Lenz', 'F', '1961-11-07', 'Macon', 'GA', ''),
(137, 'Antonio', 'Lewitt', 'M', '1999-11-07', 'St Croix', 'VI', ''),
(138, 'daniel', 'livingstone', 'M', '1980-11-07', 'New Bedford', 'MA', ''),
(139, 'Robin', 'Lyon', 'F', '1971-11-07', 'Scottsdale', 'AZ', ''),
(140, 'Jim', 'Lyon', 'M', '1965-11-07', 'Scottsdale', 'AZ', ''),
(141, 'Dirk', 'Marshall', 'M', '1962-11-07', 'Houston', 'TX', ''),
(142, 'Kristina', 'Martin', 'F', '1969-11-07', 'Boston', 'MA', ''),
(143, 'Brent', 'Mays', 'M', '1963-11-01', 'St. Croix', 'VI', ''),
(144, 'Matthew', 'Mays', 'M', '1999-11-07', 'St. Croix', 'VI', ''),
(145, 'Katherine', 'McCarty', 'F', '1988-11-07', 'Charlotte', 'NC', ''),
(146, 'Marshall', 'McCormick', 'M', '1998-11-07', 'St Croix', 'VI', ''),
(147, 'Maggie', 'Meehan', 'F', '1957-11-07', 'New York', 'Ny', ''),
(148, 'Mimi', 'Minnick', 'F', '1966-11-07', 'Fairfax', 'VA', ''),
(149, 'Stephanie', 'Mischke', 'F', '1971-11-07', 'St. Petersburg', 'FL', ''),
(150, 'Amy', 'Moore', 'F', '1988-11-07', 'St Croix', 'VI', ''),
(151, 'John', 'Morris', 'M', '1972-11-07', 'San Francisco ', 'CA', ''),
(152, 'Todd', 'Newman', 'M', '1952-11-07', 'St. Croix', 'VI', ''),
(153, 'Froilan', 'Oliveras', 'M', '1969-11-07', 'Salinas', 'PR', ''),
(154, 'Martina', 'Pavlicova', 'F', '1972-11-07', 'New York', 'NY', ''),
(155, 'Ralf', 'Porsch', 'M', '1958-11-07', 'Land O Lakes', 'FL', ''),
(156, 'Randy', 'Porter', 'M', '1961-11-07', 'Grapevine', 'TX', ''),
(157, 'Emma', 'Rearson', 'F', '2000-11-07', 'Dresher', 'PA', ''),
(158, 'Karina', 'Rowe', 'F', '1980-11-07', 'St Croix', 'VI', ''),
(159, 'Jennifer', 'Samway', 'F', '1967-11-07', 'Miami Beach', 'FL', ''),
(160, 'Jane', 'Schmidt', 'F', '1963-11-07', 'Pasadena', 'MD', ''),
(161, 'Robert', 'Schnittman', 'M', '1987-11-07', 'Atlanta', 'GA', ''),
(162, 'Robin', 'Seila', 'F', '1983-11-07', 'St Croix', 'VI', ''),
(163, 'Samantha', 'Shannon', 'F', '1982-11-07', 'Rochester', 'MN', ''),
(164, 'Daniel', 'Snyder', 'M', '1968-11-07', 'Los Gatos', 'CA', ''),
(165, 'greg', 'stanek', 'M', '1968-11-07', 'St Petersburg', 'FL', ''),
(166, 'Marcia', 'Taylor', 'F', '1955-11-07', 'St. Croix', 'VI', ''),
(167, 'Jonathan', 'Thomas', 'M', '1999-11-07', 'St Croix', 'VI', ''),
(168, 'Cheech', 'Thomas', 'M', '1947-11-07', 'St Croix', 'VI', ''),
(169, 'Ariel', 'Tormey', 'F', '1990-11-07', 'Frederiksted', 'VI', ''),
(170, 'John', 'Townsley', 'M', '1963-11-07', 'Dallas', 'TX', ''),
(171, 'Robert', 'Tozer', 'M', '1965-11-07', 'Bedford', 'PA', ''),
(172, 'Paul', 'Valitutto', 'M', '1971-11-07', 'Tampa', 'FL', ''),
(173, 'Christopher', 'Young', 'M', '1971-11-07', 'Columbia', 'MD', ''),
(174, 'Patsy', 'Cowperthwaite', 'F', '1962-11-07', 'Parkes', 'NSW', ''),
(175, 'Danielle', 'Gaudette', 'F', '1977-07-27', 'St. Croix', 'VI', ''),
(176, 'Jessica', 'Gruber', 'F', '1973-11-07', 'West Palm Beach', 'FL', ''),
(177, 'Nancy', 'Kavan', 'F', '1967-11-07', 'Anchorage', 'AK', ''),
(178, 'Kathleen', 'Moore', 'F', '1974-11-07', 'Windsor', 'VA', ''),
(179, 'Beth', 'Prodoehl', 'F', '1964-11-07', 'Broomall', 'PA', ''),
(180, 'Bridget', 'Klein', 'F', '1983-11-07', 'St Croix', 'VI', ''),
(181, 'Chloe', 'Phillips-Hayden', 'F', '1999-11-07', 'St Croix', 'VI', ''),
(182, 'Stephen', 'Wagner', 'M', '1978-10-05', 'Christiansted', 'VI', ''),
(183, 'Julie', 'Billingsley', 'F', '1978-10-05', 'Chevy Chase', 'MD', ''),
(184, 'Heidi', 'Snow', 'F', '1976-01-06', 'Christiansted', 'VI', ''),
(185, 'Colton', 'Fauquher', 'M', '2003-10-28', 'Frederiksted', 'VI', ''),
(186, 'Elizabeth', 'Armstrong', 'F', '1966-04-01', 'Christiansted', 'VI', ''),
(187, 'Wayne', 'Nichols', 'M', '1955-01-11', 'Christiansted', 'VI', ''),
(188, 'Gonzalo', 'Berrios', 'M', '1987-10-21', 'Frederiksted', 'VI', ''),
(189, 'Charlotte', 'Halk', 'F', '2004-07-02', 'Christiansted', 'VI', ''),
(190, 'James', 'Breen', 'M', '1961-08-07', 'Atlanta', 'GA', ''),
(191, 'Ryan', 'Williams', 'M', '1973-05-25', 'Pompano Beach', 'FL', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Swimmers`
--
ALTER TABLE `Swimmers`
 ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Swimmers`
--
ALTER TABLE `Swimmers`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=192;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
