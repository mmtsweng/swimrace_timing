-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 09, 2019 at 05:20 PM
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
  `Country` varchar(255) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=armscii8;

--
-- Dumping data for table `Swimmers`
--

INSERT INTO `Swimmers` (`ID`, `FirstName`, `LastName`, `Gender`, `Birthdate`, `City`, `State`, `Country`) VALUES
(1, 'Paul', 'Aiello', 'M', '1975-06-12', 'Calgary', 'AB', ' '),
(2, 'Carla', 'Albano', 'F', '1958-02-10', 'Hollywood', 'FL', ' '),
(3, 'Nicole', 'Angeli', 'F', '1986-11-26', 'Frederiksted', 'VI', ' '),
(4, 'Barry', 'Armstrong', 'M', '1959-12-21', 'Medfield', 'MA', ' '),
(5, 'Elizabeth', 'Armstrong', 'F', '1966-06-26', 'Christiansted', 'VI', ' '),
(6, 'Aaron', 'Aten', 'M', '1985-06-16', 'Louisville', 'KY', ' '),
(7, 'Alexandra', 'Bain', 'F', '1977-01-30', 'Miami Beach', 'FL', ' '),
(8, 'Hal', 'Ball', 'M', '1961-11-17', 'St. Louis', 'MO', ' '),
(9, 'Holly', 'Ball', 'F', '1966-02-14', 'St. Louis', 'MO', ' '),
(10, 'Andrew', 'Barndt', 'M', '1983-07-24', 'Philadelphia', 'PA', ' '),
(11, 'Shari', 'Bashaw', 'F', '1961-08-24', 'Christiansted', 'VI', ' '),
(12, 'Ken', 'Bjurstrom', 'M', '1963-05-31', 'Grafton', 'WI', ' '),
(13, 'Carol', 'Boudreau', 'F', '1958-08-27', 'Coral Gables', 'FL', ' '),
(14, 'David', 'Boudreau', 'M', '1958-07-26', 'Coral Gables', 'FL', ' '),
(15, 'Diana', 'Bowen', 'F', '1985-10-19', 'Charlottesville', 'VA', ' '),
(16, 'Garett', 'Brada', 'M', '1984-08-08', 'Encinitas', 'CA', ' '),
(17, 'Ines', 'Braun', 'F', '1976-12-05', 'New York', 'NY', ' '),
(18, 'Jamie', 'Breen', 'M', '1961-08-07', 'Atlanta', 'GA', ' '),
(19, 'John', 'Broschard', 'M', '1960-03-29', 'Hershey', 'PA', ' '),
(20, 'Bob', 'Burrow', 'M', '1963-03-10', 'Weston', 'MA', ' '),
(21, 'Shannon', 'Burrow', 'F', '1962-02-27', 'Weston', 'MA', ' '),
(22, 'Amanda', 'Butz', 'F', '1988-11-09', 'Maryland Hts', 'MO', ' '),
(23, 'Joseph', 'Caffrey', 'M', '1995-07-28', 'Ramsey', 'NJ', ' '),
(24, 'Bradford', 'Chatigny', 'M', '1974-07-03', 'Charlotte', 'NC', ' '),
(25, 'Laurence', 'Cohen', 'M', '1956-01-04', 'New Orleans', 'LA', ' '),
(26, 'David', 'Conover', 'M', '1950-12-22', 'Great Falls', 'VA', ' '),
(27, 'Ben', 'Courtney', 'M', '1986-05-09', 'San Rafael', 'TX', ' '),
(28, 'Jack', 'Courtney', 'M', '1953-06-03', 'Georgetown', 'TX', ' '),
(29, 'Cindy', 'Cowell', 'F', '1960-05-13', 'Eugene', 'OR', ' '),
(30, 'Mary', 'Cowell-Sharpe', 'F', '1957-11-08', 'Nantucket', 'MA', ' '),
(31, 'Parker', 'Cox', 'M', '1991-01-03', 'Boston', 'MA', ' '),
(32, 'Mary', 'Curl', 'F', '1957-01-24', 'Louisville', 'KY', ' '),
(33, 'Craik', 'Davis', 'M', '1951-11-22', 'Signal Mtn', 'TN', ' '),
(34, 'Sydne', 'Didier', 'F', '1971-03-09', 'Amherst', 'MA', ' '),
(35, 'Caroline', 'Donnelly', 'F', '1962-03-24', 'Louisville', 'KY', ''),
(36, 'Megan', 'Driscoll', 'F', '1984-12-08', 'St. Thomas', 'VI', ' '),
(37, 'Evan', 'Dykstra', 'M', '2005-12-20', 'Christiansted', 'VI', ' '),
(38, 'Laura', 'Ely', 'F', '1964-10-11', 'Stonington', 'CT', ' '),
(39, 'Richard', 'Ely', 'M', '1962-10-04', 'Stonington', 'CT', ' '),
(40, 'Dominique', 'Estlund', 'F', '1968-07-08', 'Portland', 'OR', ' '),
(41, 'Eric', 'Finkelstein', 'M', '1960-07-24', 'Denver', 'CO', ' '),
(42, 'Kimberly', 'Fitzpatrick', 'F', '1970-03-21', 'Tucson', 'AZ', ' '),
(43, 'Alexandra', 'Foster', 'F', '1958-06-26', 'Thomaston', 'CT', ' '),
(44, 'Emily', 'Frank', 'F', '1967-05-08', 'Beaconsfield', 'QC', ' '),
(45, 'Mary', 'Frawley', 'F', '1973-09-03', 'Loudonville', 'NY', ' '),
(46, 'Derek', 'Frenzel', 'M', '1991-10-25', 'Tacoma', 'WA', ' '),
(47, 'Morgan', 'Garner', 'F', '2007-04-13', 'Christiansted', 'VI', ' '),
(48, 'David', 'Gassert', 'M', '1961-06-08', 'Harrisburg', 'PA', ' '),
(49, 'Karla', 'Gibbs', 'F', '1954-04-06', 'Simpsonville', 'KY', ' '),
(50, 'Kaden', 'Gleason', 'M', '2007-06-12', 'Christiansted', 'VI', ' '),
(51, 'Simon', 'Glud Gronlund', 'M', '1982-04-09', 'Virum', 'DE', ' '),
(52, 'Alex', 'Golubitsky', 'M', '1981-06-07', 'St Thomas', 'VI', ' '),
(53, 'Romeo', 'Gomez Morales', 'M', '1956-05-10', 'Corregidora', 'MX', ' '),
(54, 'Anne Marie', 'Goode', 'F', '1976-12-02', 'Christiansted', 'VI', ' '),
(55, 'Heidi', 'Graumann', 'F', '1959-06-13', 'Portland', 'OR', ' '),
(56, 'Gary', 'Gray', 'M', '1952-05-31', 'Denver', 'CO', ' '),
(57, 'David', 'Greeley', 'M', '2003-10-08', 'Durham', 'NC', ' '),
(58, 'Matthew', 'Greeley', 'M', '2001-04-21', 'Durham', 'NC', ' '),
(59, 'Nathaniel', 'Greeley', 'M', '1997-05-14', 'Durham', 'NC', ' '),
(60, 'Sarah', 'Greeley', 'F', '1964-07-27', 'Durham', 'NC', ' '),
(61, 'Myron', 'Greer', 'M', '1966-01-18', 'Charlotte', 'NC', ' '),
(62, 'Rick', 'Guerrieri', 'M', '1989-01-19', 'Christiansted', 'VI', ' '),
(63, 'Myrna', 'Haag', 'F', '1958-11-03', 'Tampa', 'FL', ' '),
(64, 'Bob', 'Halk', 'M', '1972-04-16', 'Christiansted', 'VI', ' '),
(65, 'Joe', 'Hammond', 'M', '1968-12-03', 'Alexandria', 'VA', ' '),
(66, 'Allen', 'Hance', 'M', '1959-03-27', 'Providence', 'RI', ' '),
(67, 'Corey', 'Hardin', 'M', '1970-01-22', 'Somerville', 'MA', ' '),
(68, 'Edward J', 'Hardin', 'M', '1943-02-01', 'Atlanta', 'GA', ' '),
(69, 'Scott', 'Heintzelman', 'M', '1966-12-01', 'Mechanicsburg', 'PA', ' '),
(70, 'Jonathan', 'Horowitz', 'M', '1970-05-05', 'New York', 'NY', ' '),
(71, 'John', 'Hourihan', 'M', '1955-11-02', 'Christiansted', 'VI', ' '),
(72, 'Jessica', 'Howington', 'F', '1976-05-17', 'Christiansted', 'VI', ' '),
(73, 'Ned', 'Jacobs', 'M', '1951-10-03', 'Christiansted', 'VI', ' '),
(74, 'Laura', 'Jones', 'F', '1965-07-23', 'Falmouth', 'MA', ' '),
(75, 'Rob', 'Jones', 'M', '1965-03-31', 'Falmouth', 'MA', ' '),
(76, 'Susan', 'Kasimer', 'F', '1982-04-13', 'Mclean', 'VA', ' '),
(77, 'Ben', 'Keidan', 'M', '1973-03-02', 'Boulder', 'CO', ' '),
(78, 'Gene', 'Kennedy', 'M', '1959-10-02', 'Charlotte', 'NC', ' '),
(79, 'Lisa', 'Kiebzak', 'F', '1962-12-08', 'Asheville', 'NC', ' '),
(80, 'David', 'Kilroy', 'M', '1969-11-20', 'Swampscott', 'MA', ' '),
(81, 'Barbara', 'Kosciewicz', 'F', '1969-08-12', 'Katy', 'TX', ' '),
(82, 'Alex', 'Kostich', 'M', '1918-01-01', 'Los Angeles', 'CA', ' '),
(83, 'Adrienne', 'Kramer', 'F', '1965-12-18', 'Asheville', 'NC', ' '),
(84, 'Norah', 'Kute', 'F', '1957-01-18', 'Louisville', 'KY', ' '),
(85, 'Gray', 'Lackey', 'M', '1987-12-15', 'Vilas', 'NC', ' '),
(86, 'Mason', 'Lambert', 'M', '2006-09-01', 'Christiansted', 'VI', ' '),
(87, 'Matthew', 'Latimer', 'M', '1992-10-18', 'Richmond', 'VA', ' '),
(88, 'Paysan', 'Lau', 'M', '2004-12-22', 'Houston', 'TX', ' '),
(89, 'Prescott', 'Lau', 'M', '2003-06-03', 'Houston', 'TX', ' '),
(90, 'Matthew', 'Lau ', 'M', '1975-04-04', 'Houston', 'TX', ' '),
(91, 'Donald', 'Lauer', 'M', '1970-09-26', 'Phoenix', 'AZ', ' '),
(92, 'Frans', 'Lawaetz', 'M', '1978-10-10', 'Boston', 'MA', ' '),
(93, 'Jens', 'Lawaetz', 'M', '1979-08-14', 'Christiansted', 'VI', ' '),
(94, 'Doug', 'Lee', 'M', '1956-03-14', 'Charlotte', 'NC', ' '),
(95, 'Bradley', 'Leisure', 'M', '1954-09-24', 'Blain', 'PA', ' '),
(96, 'John', 'Lesko', 'M', '1955-02-03', 'West Bend', 'WI', ' '),
(97, 'Alana', 'Libow', 'F', '1980-03-03', 'Miami  ', 'FL', ' '),
(98, 'Ryan', 'Linehan', 'M', '1975-02-10', 'Westport Island', 'ME', ' '),
(99, 'Stacy', 'Linehan', 'F', '1971-05-04', 'Westport Island', 'ME', ' '),
(100, 'Alice', 'Long', 'F', '1970-10-05', 'Seattle', 'WA', ' '),
(101, 'Zong', 'Luo', 'F', '1975-08-04', 'Swarthmore', 'PA', ' '),
(102, 'Jim', 'Martin', 'M', '1958-01-21', 'Louisville', 'KY', ' '),
(103, 'Pamela', 'Martin', 'F', '1957-10-17', 'Louisville', 'KY', ' '),
(104, 'Bryan', 'Mason', 'M', '1975-01-22', 'St Thomas', 'VI', ' '),
(105, 'Britney', 'Matcheck', 'F', '1985-02-12', 'Fayetteville', 'GA', ' '),
(106, 'Megan', 'Mault', 'F', '1981-07-29', 'Christiansted', 'VI', ' '),
(107, 'Jennifer', 'May', 'F', '1969-01-31', 'Elm Grove', 'WI', ' '),
(108, 'John', 'May', 'M', '1967-10-27', 'Elm Grove', 'WI', ' '),
(109, 'Daryan', 'Maynard', 'M', '2008-09-25', 'Christiansted', 'VI', ' '),
(110, 'Geoff', 'Mcgean', 'M', '1961-12-20', 'Lincoln', 'MA', ' '),
(111, 'Michael', 'Mcgean', 'M', '1995-05-06', 'Charlotte', 'NC', ' '),
(112, 'Wendy', 'Medley', 'F', '1954-02-13', 'Louisville', 'KY', ' '),
(113, 'George', 'Miller', 'M', '1974-08-25', 'Chicago', 'IL', ' '),
(114, 'Jeff', 'Miller', 'M', '1961-05-14', 'Christiansted', 'VI', ' '),
(115, 'Peter', 'Monko', 'M', '1979-12-04', 'Chicago', 'IL', ' '),
(116, 'Kevin', 'Moran', 'M', '1973-12-13', 'Christiansted', 'VI', ' '),
(117, 'Kathy', 'Murray', 'F', '1959-05-06', 'Charlotte', 'NC', ' '),
(118, 'Craig', 'Nelson', 'M', '1958-10-07', 'Golden', 'CO', ' '),
(119, 'Todd', 'Newman', 'M', '1952-05-04', 'Christiansted', 'VI', ' '),
(120, 'Joe', 'Noonan', 'M', '1996-03-25', 'Christiansted', 'VI', ' '),
(121, 'Paul', 'O\'brien', 'M', '1959-11-28', 'Charlotte', 'NC', ' '),
(122, 'Trisha', 'Oeth', 'F', '1979-05-27', 'Boulder', 'CO', ' '),
(123, 'Erin', 'Orourke', 'F', '1970-12-18', 'Winter Park', 'CO', ' '),
(124, 'Adrienne', 'Patterson', 'F', '1968-08-19', 'Buckeye', 'AZ', ' '),
(125, 'Dean', 'Patterson', 'M', '1962-06-28', 'Buckeye', 'AZ', ' '),
(126, 'Nicoline', 'Rasmussen', 'F', '1988-04-23', 'Alsgarde', 'DE', ' '),
(127, 'Mark', 'Richards', 'M', '1955-09-25', 'Denver', 'CO', ' '),
(128, 'Paul', 'Riegel', 'M', '1962-05-18', 'Cedarburg', 'WI', ' '),
(129, 'Andrew', 'Row', 'M', '1991-09-11', 'Cambridge', 'MA', ' '),
(130, 'Elissa', 'Ruddy', 'F', '1970-09-29', 'Portland', 'OR', ' '),
(131, 'Jamie', 'Rusignuolo', 'F', '1980-05-05', 'Watchung', 'NJ', ' '),
(132, 'Jennifer', 'Samway', 'F', '1967-10-09', 'Miami Beach', 'FL', ' '),
(133, 'Michael', 'Samway', 'M', '1968-05-01', 'Miami Beach', 'FL', ' '),
(134, 'Hayes', 'Sanborn', 'M', '1975-09-25', 'Chicago', 'IL', ' '),
(135, 'David', 'Scammell', 'M', '1947-01-05', 'Lafayette', 'LA', ' '),
(136, 'Robyn', 'Schaffer', 'F', '1962-12-18', 'Pikesville', 'MD', ' '),
(137, 'Allysa', 'Seely', 'F', '1989-01-04', 'Phoenix', 'AZ', ' '),
(138, 'Catherine', 'Seguin', 'F', '1982-06-04', 'Christiansted', 'VI', ' '),
(139, 'Gillian', 'Sherbourne', 'F', '1965-09-18', 'Atlanta', 'GA', ' '),
(140, 'Jay', 'Singh', 'M', '1964-07-06', 'Atlanta', 'GA', ' '),
(141, 'Robert', 'Sokol', 'M', '1970-07-13', 'Washington', 'DC', ' '),
(142, 'Victoria', 'Sperber', 'F', '2005-10-14', 'Christiansted', 'VI', ' '),
(143, 'Kelly', 'Spivey', 'F', '1963-03-18', 'Valrico', 'FL', ' '),
(144, 'Pam', 'Stachelek', 'F', '1966-06-29', 'Greenville', 'SC', ' '),
(145, 'Lisa', 'Stephenson', 'F', '1974-09-08', 'Gaithersburg', 'MD', ' '),
(146, 'Stacy', 'Stone', 'F', '1979-03-13', 'Christiansted', 'VI', ' '),
(147, 'Julie', 'Tafuto', 'F', '1966-03-18', 'Hummelstown', 'PA', ' '),
(148, 'Jan', 'Tawakol', 'M', '1971-06-27', 'Christiansted', 'VI', ' '),
(149, 'Marcia', 'Taylor', 'F', '1955-07-03', 'Christiansted', 'VI', ' '),
(150, 'Arthur', 'Tiedemann', 'M', '1965-08-08', 'Rye', 'NY', ' '),
(151, 'Kate', 'Tiedemann', 'F', '1968-12-06', 'Rye', 'NY', ' '),
(152, 'Guy', 'Tomberlin', 'M', '1964-06-13', 'Bluemont', 'VA', ' '),
(153, 'Frank', 'Tomizuka', 'M', '1960-03-17', 'Tucson', 'AZ', ' '),
(154, 'Heather', 'Traber', 'F', '1966-05-06', 'Providence', 'RI', ' '),
(155, 'Drew', 'Ulichney', 'M', '1969-03-06', 'Wayne', 'PA', ' '),
(156, 'Julie', 'Van Cleave', 'F', '1959-04-26', 'Elm Grove', 'WI', ' '),
(157, 'Alaina', 'Van Horn', 'F', '1981-04-10', 'Washington', 'DC', ' '),
(158, 'Alejandro', 'Vicens', 'M', '1973-03-04', 'San Juan', 'PR', ' '),
(159, 'Ellen', 'Weinberg', 'F', '1961-02-03', 'New York', 'NY', ' '),
(160, 'Nancy', 'Westbrook', 'F', '1955-01-15', 'Tampa', 'FL', ' '),
(161, 'Brandon', 'White', 'M', '1984-09-29', 'Bloomfield', 'NY', ' '),
(162, 'M J', 'White', 'F', '1959-03-06', 'Charlotte', 'NC', ' '),
(163, 'Nancy', 'White', 'F', '1955-07-11', 'Jacksonville', 'FL', ' '),
(164, 'Andrew', 'Whitley-Williams', 'M', '1989-01-28', 'Charlotte', 'NC', ' '),
(165, 'Andy', 'Wilson', 'M', '1963-10-14', 'Ransom Canyon', 'TX', ' '),
(166, 'Bill', 'Wilson', 'M', '1964-08-11', 'Atlanta', 'GA', ' '),
(167, 'Heidi', 'Wilson', 'F', '1967-09-30', 'Ransom Canyon', 'TX', ' '),
(168, 'Malorie', 'Winne-Diaz', 'F', '1985-04-10', 'St Thomas', 'VI', ' '),
(169, 'Jude', 'Woodcock', 'F', '1956-05-03', 'Christiansted', 'VI', ' '),
(170, 'Emma', 'Wright', 'F', '2006-02-10', 'Peach Tree City', 'GA', ' ');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
