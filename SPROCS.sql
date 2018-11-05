DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_FINISHERS`()
    NO SQL
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
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACEFINISHERS`()
    NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName,
    s.LastName, s.City, s.Country, r.Description,
    r.Cap, r.CapHex, rs.HasFins,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime)))
    AS averageDate,
    tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
AND rs.RaceID = r.ID
AND tr.RaceID = r.ID
AND ts.RaceSwimmerID = rs.ID
GROUP BY ts.RaceSwimmerID
ORDER BY rs.RaceID, averageDate$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_FINISHORDER`()
    NO SQL
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
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACERCOUNTS`()
    NO SQL
SELECT r.ID, r.Description, COUNT(rs.ID) as Swimmers
FROM RaceSwimmers AS rs, Races r
WHERE rs.RaceID = r.ID
GROUP BY r.ID$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_NONRACERS`()
    NO SQL
SELECT s.ID, s.FirstName, s.LastName
FROM Swimmers s
WHERE s.ID NOT IN (
    SELECT SwimmerID FROM RaceSwimmers)
    ORDER BY s.LastName LIMIT 0, 300$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACEFINISHERCOUNTS`()
    NO SQL
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
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACES`()
SELECT r.ID, r.Description, r.CapHex, r.Cap
FROM Races r$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACETIMES`()
    NO SQL
SELECT r.ID, r.Description, r.CapHex, t.StartTime
FROM Races r
LEFT JOIN TimeRace t ON r.ID = t.RaceID
AND t.Status = 1$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_SWIMMER`(IN `in_swimmerid` INT)
    NO SQL
SELECT ID, FirstName, LastName, City,
    Country, Birthdate, Gender
FROM Swimmers s
WHERE s.ID = in_swimmerid$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `INSERT_RACER`(IN `racernumber` INT, IN `swimmerid` INT, IN `raceid` INT, IN `hasfins` INT)
    NO SQL
INSERT INTO RaceSwimmers
    (SwimmerID, RaceID, RacerNumber, HasFins)
VALUES
    (swimmerid, raceid, racernumber, hasfins)$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_RACERS`()
    NO SQL
SELECT rs.ID, rs.RacerNumber, rs.SwimmerID, s.FirstName,
    s.LastName,s.Gender, s.Birthdate, s.City, s.Country,
    r.Description, r.Cap, rs.HasFins
FROM RaceSwimmers rs, Races r, Swimmers s
WHERE rs.SwimmerID = s.ID
AND rs.RaceID = r.ID
ORDER BY s.LastName, s.FirstName$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `INSERT_SWIMMER`(IN `in_firstname` VARCHAR(255), IN `in_lastname` VARCHAR(255), IN `in_city` VARCHAR(64), IN `in_country` VARCHAR(64), IN `in_birthdate` DATE, IN `in_gender` VARCHAR(4))
    NO SQL
Insert INTO Swimmers (FirstName, LastName, Gender,
        Birthdate, City, Country)
VALUES (in_firstname, in_lastname, in_gender,
        in_birthdate, in_city, in_country)$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `GET_SWIMMERS`()
    NO SQL
SELECT ID, FirstName, LastName, Gender, Birthdate
FROM Swimmers$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `INSERT_TIMERACE`(IN `in_race` INT, IN `in_date` DATETIME, IN `in_enable` INT)
    NO SQL
INSERT INTO TimeRace (RaceID, StartTime, Status)
    VALUES (in_race, in_date, in_enable)$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_OVERALL`()
    NO SQL
SELECT r.ID, rs.RacerNumber, rs.SwimmerID,
    s.FirstName, s.LastName, s.Gender, s.Birthdate,
    s.City, s.Country,
    TIMESTAMPDIFF(YEAR, s.Birthdate, NOW()) as Age,
    FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(ts.FinishTime)))
        AS EndTime, tr.StartTime
FROM Races r, RaceSwimmers rs, Swimmers s,
    TimeSwimmer ts, TimeRace tr
WHERE rs.SwimmerID = s.ID
    AND rs.RaceID = r.ID
    AND tr.RaceID = r.ID
    AND ts.RaceSwimmerID = rs.ID
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
LIMIT 5$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_OVERALL_FIN`()
    NO SQL
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
    AND ts.RaceSwimmerID = rs.ID
    AND rs.HasFins = 1
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
    LIMIT 1$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_OVERALL_19OVER`()
    NO SQL
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
    AND ts.RaceSwimmerID = rs.ID
    AND rs.HasFins = 0
    AND TIMESTAMPDIFF(YEAR, s.Birthdate,
                      NOW()) BETWEEN 19 AND 999
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
    LIMIT 5$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_WINNERS_BY_RACE_AGE`(IN `in_raceid` INT, IN `in_minage` INT, IN `in_maxage` INT)
    NO SQL
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
    AND TIMESTAMPDIFF(YEAR, s.Birthdate,
                      NOW()) BETWEEN in_minage AND in_maxage
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
    LIMIT 3$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `REPORT_OVERALL_UNDER19`()
    NO SQL
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
    AND ts.RaceSwimmerID = rs.ID
    AND rs.HasFins = 0
    AND TIMESTAMPDIFF(YEAR, s.Birthdate,
                      NOW()) BETWEEN 0 AND 18
    GROUP BY ts.RaceSwimmerID
    ORDER BY EndTime
    LIMIT 5$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `SP_RESETTIMERACE`(IN `in_race` INT)
    NO SQL
UPDATE TimeRace
    SET Status = 0
    WHERE RaceID = in_race$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `SP_FINISHRACER`(IN `in_racernumber` INT, IN `in_finishtime` DATETIME)
    NO SQL
INSERT INTO TimeSwimmer (RaceSwimmerID, FinishTime, Status)
VALUES (
    (SELECT rs.ID
     FROM RaceSwimmers rs
     WHERE rs.RacerNumber = in_racernumber),
    in_finishtime,
    1)$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `UPDATE_RACESWIMMERS`(IN `in_raceswimmerid` INT, IN `in_swimmerid` INT, IN `in_raceid` INT, IN `in_racernumber` INT, IN `in_hasfins` INT)
    NO SQL
UPDATE RaceSwimmers
SET SwimmerID=in_swimmerid,
    RaceID=in_raceid,
    RacerNumber=in_racernumber,
    HasFins=in_hasfins
WHERE ID=in_raceswimmerid$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`swimrace`@`localhost` PROCEDURE `UPDATE_SWIMMER`(IN `in_swimmerid` INT, IN `in_city` VARCHAR(50), IN `in_country` VARCHAR(64), IN `in_birthdate` DATE, IN `in_firstname` VARCHAR(255), IN `in_lastname` VARCHAR(255), IN `in_gender` VARCHAR(4))
    NO SQL
UPDATE Swimmers
SET Gender=in_gender,
    Birthdate=in_birthdate,
    City=in_city,
    Country=in_country
WHERE ID=in_swimmerid$$
DELIMITER ;
