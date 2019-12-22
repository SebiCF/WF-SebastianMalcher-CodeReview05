-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Dez 2019 um 15:39
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
-- Datenbank: `cr05_sebastian_malcher_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(101) DEFAULT NULL,
  `account_password` varchar(101) DEFAULT NULL,
  `cus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `account`
--

INSERT INTO `account` (`account_id`, `account_name`, `account_password`, `cus_id`) VALUES
(0, 'Acc_Mark', '11111', 1),
(1, 'ACC_Kenny', '2112112', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(101) DEFAULT NULL,
  `admin_email` varchar(101) DEFAULT NULL,
  `admin_mobile` varchar(101) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_mobile`) VALUES
(0, 'HEAD_Admin', 'admin@email.com', '0613131313');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `car_details` varchar(101) DEFAULT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`car_id`, `car_details`, `location_id`) VALUES
(0, 'Volvo', 1),
(1, 'Opel', 1),
(2, 'VW', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(71) NOT NULL,
  `cus_address` varchar(101) NOT NULL,
  `cus_mobile` varchar(71) NOT NULL,
  `cus_email` varchar(101) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_address`, `cus_mobile`, `cus_email`) VALUES
(1, 'Mark', 'Wien', '0664555222222', 'mark@yuhu.com'),
(2, 'Kenny', 'Wien', '0681777777777772', 'kenny@yuhu.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `end_location`
--

CREATE TABLE `end_location` (
  `end_location_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `end_location`
--

INSERT INTO `end_location` (`end_location_id`, `location_id`) VALUES
(0, 0),
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `inquiry`
--

CREATE TABLE `inquiry` (
  `inquiry_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `start_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `inquiry`
--

INSERT INTO `inquiry` (`inquiry_id`, `account_id`, `payment_id`, `car_id`, `start_location_id`) VALUES
(0, 1, 0, 0, 1),
(2, 0, 1, 2, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_amount` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `inquiry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_amount`, `cus_id`, `report_id`, `admin_id`, `inquiry_id`) VALUES
(1, 1000, 2, 1, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `location_details` varchar(101) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`location_id`, `location_details`) VALUES
(0, 'Headquarters'),
(1, 'Station Gürtel'),
(2, 'Station Margareten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment_option`
--

CREATE TABLE `payment_option` (
  `payment_id` int(11) NOT NULL,
  `payment_details` varchar(101) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `payment_option`
--

INSERT INTO `payment_option` (`payment_id`, `payment_details`) VALUES
(0, 'Credit Card'),
(1, 'PayPal');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `inquiry_id` int(11) NOT NULL,
  `damage_details` varchar(101) DEFAULT NULL,
  `report_details` varchar(101) DEFAULT NULL,
  `car_id` int(11) NOT NULL,
  `end_location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `report`
--

INSERT INTO `report` (`report_id`, `inquiry_id`, `damage_details`, `report_details`, `car_id`, `end_location_id`) VALUES
(1, 0, 'damage', 'damage', 0, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `start_location`
--

CREATE TABLE `start_location` (
  `start_location_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `start_location`
--

INSERT INTO `start_location` (`start_location_id`, `location_id`) VALUES
(0, 0),
(1, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `cus_id` (`cus_id`);

--
-- Indizes für die Tabelle `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indizes für die Tabelle `end_location`
--
ALTER TABLE `end_location`
  ADD PRIMARY KEY (`end_location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indizes für die Tabelle `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`inquiry_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `payment_id` (`payment_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `start_location_id` (`start_location_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `inquiry_id` (`inquiry_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indizes für die Tabelle `payment_option`
--
ALTER TABLE `payment_option`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indizes für die Tabelle `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `inquiry_id` (`inquiry_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `end_location_id` (`end_location_id`);

--
-- Indizes für die Tabelle `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_location_id`),
  ADD KEY `location_id` (`location_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`);

--
-- Constraints der Tabelle `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints der Tabelle `end_location`
--
ALTER TABLE `end_location`
  ADD CONSTRAINT `end_location_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints der Tabelle `inquiry`
--
ALTER TABLE `inquiry`
  ADD CONSTRAINT `inquiry_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `inquiry_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment_option` (`payment_id`),
  ADD CONSTRAINT `inquiry_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `inquiry_ibfk_4` FOREIGN KEY (`start_location_id`) REFERENCES `start_location` (`start_location_id`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`),
  ADD CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  ADD CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`inquiry_id`) REFERENCES `inquiry` (`inquiry_id`);

--
-- Constraints der Tabelle `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`inquiry_id`) REFERENCES `inquiry` (`inquiry_id`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `report_ibfk_3` FOREIGN KEY (`end_location_id`) REFERENCES `end_location` (`end_location_id`);

--
-- Constraints der Tabelle `start_location`
--
ALTER TABLE `start_location`
  ADD CONSTRAINT `start_location_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
