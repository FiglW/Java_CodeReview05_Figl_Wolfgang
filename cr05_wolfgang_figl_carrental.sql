-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Dez 2019 um 15:27
-- Server-Version: 10.4.10-MariaDB
-- PHP-Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr05_wolfgang_figl_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin_car`
--

CREATE TABLE `admin_car` (
  `admin_ID` int(11) NOT NULL,
  `admin_firstName` varchar(55) NOT NULL,
  `admin_lastName` varchar(55) NOT NULL,
  `admin_email` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `admin_car`
--

INSERT INTO `admin_car` (`admin_ID`, `admin_firstName`, `admin_lastName`, `admin_email`) VALUES
(10, 'Hans', 'Huber', 'hans.huber@gmail.com'),
(11, 'Peter', 'Mayer', 'peter.may@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `book_ID` int(11) NOT NULL,
  `book_description` varchar(55) NOT NULL,
  `book_type` varchar(55) NOT NULL,
  `book_date` date NOT NULL,
  `user_ID` int(11) NOT NULL,
  `admin_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`book_ID`, `book_description`, `book_type`, `book_date`, `user_ID`, `admin_ID`) VALUES
(50, 'Ikea Süd Lieferung nach Hauptbanhof', 'Möbellieferung', '2019-12-21', 20, 10),
(51, 'Business Meeting in Limo', 'Limousinen Meeting', '2019-12-22', 21, 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `car_ID` int(11) NOT NULL,
  `type` varchar(55) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `reserved` tinyint(1) NOT NULL,
  `startLocation` varchar(55) NOT NULL,
  `endLocation` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`car_ID`, `type`, `available`, `reserved`, `startLocation`, `endLocation`) VALUES
(30, 'Big Van', 1, 0, 'Westbahnhof', 'Hauptbahnhof'),
(31, 'Big Van', 0, 1, 'Ikea Süd', 'Hauptbahnhof'),
(32, 'Kombi', 1, 0, 'St.Pölten', 'Wien'),
(33, 'Cabrio', 1, 0, 'Wien', 'Salzburg'),
(34, 'Limousine', 1, 0, 'Wien', 'Graz');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `report`
--

CREATE TABLE `report` (
  `report_ID` int(11) NOT NULL,
  `damage` varchar(55) NOT NULL,
  `book_ID` int(11) NOT NULL,
  `car_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `report`
--

INSERT INTO `report` (`report_ID`, `damage`, `book_ID`, `car_ID`) VALUES
(60, 'Linke Seite leichter Kratzer', 50, 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `user_ID` int(55) NOT NULL,
  `firstName` varchar(55) NOT NULL,
  `lastName` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_ID`, `firstName`, `lastName`, `email`, `birth_date`) VALUES
(20, 'Julia', 'Testfrau', 'julia.testfrau@mail.com', '2001-12-18'),
(21, 'Max', 'Testmann', 'max.testmann@mail.com', '2003-12-18'),
(22, 'Karl', 'Depp', 'karli.depp@mail.com', '2001-11-18'),
(23, 'Hubert', 'Gurke', 'hubert.gurkenmeister@mail.com', '1983-12-10');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admin_car`
--
ALTER TABLE `admin_car`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`book_ID`),
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `admin_ID` (`admin_ID`);

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_ID`);

--
-- Indizes für die Tabelle `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_ID`),
  ADD KEY `book_ID` (`book_ID`),
  ADD KEY `car_ID` (`car_ID`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_ID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`admin_ID`) REFERENCES `admin_car` (`admin_ID`);

--
-- Constraints der Tabelle `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`book_ID`) REFERENCES `booking` (`book_ID`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`car_ID`) REFERENCES `cars` (`car_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
