-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2019 at 11:36 AM
-- Server version: 10.3.17-MariaDB-0+deb10u1
-- PHP Version: 7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Swimrace`
--

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
