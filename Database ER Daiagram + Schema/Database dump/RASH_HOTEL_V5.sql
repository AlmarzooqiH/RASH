-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 23, 2023 at 10:55 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `RASH_HOTEL`
--

-- --------------------------------------------------------

--
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `ID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` text NOT NULL,
  `Type` varchar(20) NOT NULL DEFAULT 'Customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`ID`, `Username`, `Password`, `Type`) VALUES
(1, 'Hamad', 'fb84a45f6df7d1d17036f939f1cfeb87339ff5dbdf411222f3762dd76779a287', 'ADMIN'),
(2, 'Rashid', 'da130d6b90444936782ad41347c3f313f8f45822b41f6319564be9a60aeb25dd', 'ADMIN'),
(3, 'Mohammad', '42c5da453bef31c6ae183e7afd88c0eb5d174a2564635e182d73691a300e0bd1', 'ADMIN'),
(4, 'John Doe', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Customer'),
(14, 'abcdefg', '5c80565db6f29da0b01aa12522c37b32f121cbe47a861ef7f006cb22922dffa1', 'Customer'),
(15, 'abcdefg', '5c80565db6f29da0b01aa12522c37b32f121cbe47a861ef7f006cb22922dffa1', 'Customer'),
(16, 'abcdefg', '5c80565db6f29da0b01aa12522c37b32f121cbe47a861ef7f006cb22922dffa1', 'Customer'),
(17, 'Thank you', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Customer'),
(18, 'M', '8ce86a6ae65d3692e7305e2c58ac62eebd97d3d943e093f577da25c36988246b', 'Customer'),
(19, 'First_0wner', '7d1a54127b222502f5b79b5fb0803061152a44f92b37e23c6527baf665d4da9a', 'Customer'),
(21, 'testtt', '4620077dc40987aa46275e81391e8a473b9c361a9e5775307748035eff763890', 'Customer'),
(22, 'Hams', 'e4ad93ca07acb8d908a3aa41e920ea4f4ef4f26e7f86cf8291c5db289780a5ae', 'Customer'),
(23, '3zooz123', '7d1a54127b222502f5b79b5fb0803061152a44f92b37e23c6527baf665d4da9a', 'Customer'),
(24, '3zooz1234', '7d1a54127b222502f5b79b5fb0803061152a44f92b37e23c6527baf665d4da9a', 'Customer'),
(25, '3zooz12344', '7d1a54127b222502f5b79b5fb0803061152a44f92b37e23c6527baf665d4da9a', 'Customer'),
(26, 'Hamadeeeeeefdwwdfv', '212b358db80f5c3eacee3125aa61631e56e46b3935365ff8f631e42f430464e9', 'Customer'),
(27, 'abcdefghjkl', 'c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646', 'Customer'),
(28, '7soonIsPro', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Customer'),
(29, '7soonIsProo', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Customer'),
(30, '7soonIsProoo', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Customer'),
(31, 'TESTING', '1234567890', 'Customer'),
(32, 'HHH', 'c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646', 'Customer'),
(33, 'TEST2', 'c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646', 'Customer'),
(34, 'TEST3', 'c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646', 'Customer'),
(35, 'BobTheBuilder', 'c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646', 'Customer'),
(36, 'bujasim', '9a7228dd4c0065204458bc1fa3cf8568f63b951c99e08713a03b9854080f7a10', 'Customer'),
(37, 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'Customer'),
(38, 'b', '3e23e8160039594a33894f6564e1b1348bbd7a0088d42c4acb73eeaed59c009d', 'ADMIN'),
(39, 'ebadidi', 'b9c545f570307ee74f17bbec9d28aede3f079819972716278c5c9d3ab4b91fb6', 'Customer'),
(40, 'FinalTest', '0f12e5aafb43c2b85edb6ac6f56c5c99adb055c4a081b14ae91e13afb2f36e22', 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `Booking`
--

CREATE TABLE `Booking` (
  `BID` int(12) NOT NULL,
  `Arrival` date NOT NULL,
  `Departure` date NOT NULL,
  `CID` int(11) NOT NULL,
  `RID` int(6) NOT NULL,
  `HID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Booking`
--

INSERT INTO `Booking` (`BID`, `Arrival`, `Departure`, `CID`, `RID`, `HID`) VALUES
(1, '2023-11-19', '2023-11-20', 1, 0, 1),
(34, '2023-11-21', '2023-11-26', 23, 1, 1),
(45, '2023-11-22', '2023-11-30', 9, 0, 1),
(84, '2023-11-23', '2023-12-03', 20, 50, 2),
(88, '2023-11-23', '2023-11-25', 20, 0, 1),
(89, '2023-11-23', '2023-11-26', 20, 99, 3),
(90, '2023-11-22', '2023-11-26', 20, 100, 3),
(91, '2023-11-23', '2023-12-09', 15, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `CID` int(11) NOT NULL,
  `Phone#` text NOT NULL,
  `AID` int(11) NOT NULL,
  `Email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Fname`, `Lname`, `CID`, `Phone#`, `AID`, `Email`) VALUES
('Jhon', 'Doe', 1, '0501234567', 4, 'JhoneDoe@gmail.com'),
('mmmm', 'mnbbm', 2, '1234567890', 14, 'L@L.COM'),
('Yes', 'No', 3, '1234567890', 17, 'L@L.COM'),
('k', 'L', 4, '1234567890', 18, 'L@L.COM'),
('Rashid', 'Al Alawi', 5, '000000000000', 19, 'L@L.COM'),
('Mfl7', 'Theyab', 6, '000000000000', 22, 'L@L.COM'),
('Abu Jaber', 'Al Jaberi', 7, '000000000000', 23, 'L@L.COM'),
('Abu Jaber', 'Al Jaberi', 8, '000000000000', 24, 'L@L.COM'),
('Abu Jaber', 'Al Jaberi', 9, '000000000000', 25, 'L@L.COM'),
('heheheeh', 'hawhawhaw', 10, '000000000000', 26, 'L@L.COM'),
('Hamadddd', 'lkjhgfdsa', 11, '000000000000', 27, 'L@L.COM'),
('Hamaddddo', 'lkjhgfdsa', 12, '000000000000', 28, 'L@L.COM'),
('Hamaddddo', 'lkjhgfdsa', 13, '000000000000', 29, 'L@L.COM'),
('Hamaddddo', 'lkjhgfdsa', 14, '000000000000', 30, 'L@L.COM'),
('H', 'H', 15, '000000000000', 32, 'L@L.COM'),
('TEST2', 'TEST2', 16, '000000000000', 33, 'L@L.COM'),
('TEST3', 'TEST3', 17, '000000000000', 34, 'L@L.COM'),
('Bob', 'Smith', 18, '000000000000', 35, 'L@L.COM'),
('Mohammd', 'Jassmi', 19, '0551037928', 36, '202014645@uaeu.ac.ae'),
('kjh', 'hjkl', 20, '000000000000', 37, 'a@a.com'),
('A', 'a', 21, '000000000000', 38, 'a@a.com'),
('Moulay', 'Badidi', 22, '0501234567', 39, 'ebadidi@uaeu.ac.ae'),
('Final test', 'Final test', 23, '0556690390', 40, 'finalTest@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `EID` int(11) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `JobTitle` text NOT NULL,
  `AID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`EID`, `FName`, `LName`, `JobTitle`, `AID`) VALUES
(1, 'Hamad', 'Almarzooqi', 'OWNER', 1),
(2, 'Rashid', 'Alalawi', 'OWNER', 2),
(3, 'Mohammad', 'Al Samneh', 'OWNER', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Hotel`
--

CREATE TABLE `Hotel` (
  `HID` int(6) NOT NULL,
  `Location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Hotel`
--

INSERT INTO `Hotel` (`HID`, `Location`) VALUES
(1, 'Abu Dhabi'),
(2, 'New York'),
(3, 'Paris');

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE `Room` (
  `RID` int(6) NOT NULL,
  `Type` text NOT NULL,
  `HID` int(6) NOT NULL,
  `Room#` int(4) NOT NULL,
  `Price` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Room`
--

INSERT INTO `Room` (`RID`, `Type`, `HID`, `Room#`, `Price`) VALUES
(0, 'Hamad\'s Special Room', 1, 0, 999999),
(1, 'Quad Bedroom', 1, 1, 5000),
(2, 'Apartment', 1, 2, 6886),
(3, 'Studio', 1, 3, 630),
(4, 'Quad Bedroom', 1, 4, 4122),
(5, 'Standard suite rooms', 1, 5, 9449),
(6, 'Penthouse apartment', 1, 6, 6844),
(7, 'Suite', 1, 7, 1356),
(8, 'Standard suite rooms', 1, 8, 4890),
(9, 'Standard suite rooms', 1, 9, 4864),
(10, 'Suite', 1, 10, 8494),
(11, 'Suite', 1, 11, 8732),
(12, 'Penthouse suite living room', 1, 12, 3430),
(13, 'Penthouse apartment', 1, 13, 8098),
(14, 'Apartment', 1, 14, 2708),
(15, 'Studio', 1, 15, 7059),
(16, 'Apartment', 1, 16, 9916),
(17, 'Penthouse suite living room', 1, 17, 4820),
(18, 'Penthouse suite living room', 1, 18, 6756),
(19, 'Penthouse apartment', 1, 19, 7102),
(20, 'Standard suite rooms', 1, 20, 6721),
(21, 'Studio', 1, 21, 6157),
(22, 'Standard suite rooms', 1, 22, 792),
(23, 'Suite', 1, 23, 1611),
(24, 'Standard suite rooms', 1, 24, 7342),
(25, 'Suite', 1, 25, 6784),
(26, 'Standard suite rooms', 1, 26, 8608),
(27, 'Deluxe Hotel rooms', 1, 27, 7776),
(28, 'Quad Bedroom', 1, 28, 3683),
(29, 'Penthouse suite living room', 1, 29, 5707),
(30, 'Apartment', 1, 30, 5949),
(31, 'Apartment', 1, 31, 5113),
(32, 'Standard suite rooms', 1, 32, 2991),
(33, 'Penthouse apartment', 1, 33, 4726),
(34, 'Deluxe Hotel rooms', 1, 34, 786),
(35, 'Apartment', 1, 35, 2043),
(36, 'Presidential suite', 1, 36, 8970),
(37, 'Penthouse apartment', 1, 37, 8966),
(38, 'Hospitality suite', 1, 38, 2616),
(39, 'Suite', 1, 39, 4718),
(40, 'Quad Bedroom', 1, 40, 9524),
(41, 'Deluxe Hotel rooms', 1, 41, 919),
(42, 'Penthouse apartment', 1, 42, 9256),
(43, 'Deluxe Hotel rooms', 1, 43, 4952),
(44, 'Presidential suite', 1, 44, 8432),
(45, 'Quad Bedroom', 1, 45, 923),
(46, 'Penthouse suite living room', 1, 46, 9942),
(47, 'Standard suite rooms', 1, 47, 9279),
(48, 'Quad Bedroom', 1, 48, 1995),
(49, 'Deluxe Hotel rooms', 1, 49, 5162),
(50, 'Quad Bedroom', 2, 1, 4627),
(51, 'Penthouse suite living room', 2, 2, 2082),
(52, 'Penthouse suite living room', 2, 3, 5469),
(53, 'Penthouse apartment', 2, 4, 2202),
(54, 'Studio', 2, 5, 2966),
(55, 'Penthouse suite living room', 2, 6, 7284),
(56, 'Presidential suite', 2, 7, 5382),
(57, 'Apartment', 2, 8, 9513),
(58, 'Penthouse suite living room', 2, 9, 9020),
(59, 'Penthouse apartment', 2, 10, 5384),
(60, 'Standard suite rooms', 2, 11, 9818),
(61, 'Presidential suite', 2, 12, 1494),
(62, 'Standard suite rooms', 2, 13, 2572),
(63, 'Studio', 2, 14, 7123),
(64, 'Apartment', 2, 15, 1053),
(65, 'Presidential suite', 2, 16, 6530),
(66, 'Presidential suite', 2, 17, 7978),
(67, 'Penthouse suite living room', 2, 18, 3538),
(68, 'Standard suite rooms', 2, 19, 9936),
(69, 'Presidential suite', 2, 20, 3002),
(70, 'Quad Bedroom', 2, 21, 6258),
(71, 'Penthouse apartment', 2, 22, 1311),
(72, 'Quad Bedroom', 2, 23, 6454),
(73, 'Quad Bedroom', 2, 24, 4455),
(74, 'Deluxe Hotel rooms', 2, 25, 9115),
(75, 'Suite', 2, 26, 4355),
(76, 'Presidential suite', 2, 27, 4521),
(77, 'Standard suite rooms', 2, 28, 3170),
(78, 'Penthouse suite living room', 2, 29, 4881),
(79, 'Quad Bedroom', 2, 30, 2094),
(80, 'Presidential suite', 2, 31, 1670),
(81, 'Penthouse suite living room', 2, 32, 9600),
(82, 'Presidential suite', 2, 33, 9258),
(83, 'Presidential suite', 2, 34, 1072),
(84, 'Studio', 2, 35, 2952),
(85, 'Presidential suite', 2, 36, 7280),
(86, 'Standard suite rooms', 2, 37, 8307),
(87, 'Apartment', 2, 38, 2937),
(88, 'Suite', 2, 39, 5747),
(89, 'Studio', 2, 40, 7320),
(90, 'Presidential suite', 2, 41, 1927),
(91, 'Deluxe Hotel rooms', 2, 42, 5595),
(92, 'Apartment', 2, 43, 5173),
(93, 'Apartment', 2, 44, 3863),
(94, 'Penthouse apartment', 2, 45, 5892),
(95, 'Quad Bedroom', 2, 46, 2402),
(96, 'Presidential suite', 2, 47, 5502),
(97, 'Penthouse suite living room', 2, 48, 1872),
(98, 'Standard suite rooms', 2, 49, 8367),
(99, 'Standard suite rooms', 3, 1, 9066),
(100, 'Presidential suite', 3, 2, 1488),
(101, 'Hospitality suite', 3, 3, 4747),
(102, 'Presidential suite', 3, 4, 2342),
(103, 'Studio', 3, 5, 5670),
(104, 'Apartment', 3, 6, 1277),
(105, 'Suite', 3, 7, 6199),
(106, 'Penthouse suite living room', 3, 8, 7229),
(107, 'Quad Bedroom', 3, 9, 6751),
(108, 'Hospitality suite', 3, 10, 4404),
(109, 'Standard suite rooms', 3, 11, 5422),
(110, 'Penthouse suite living room', 3, 12, 7853),
(111, 'Deluxe Hotel rooms', 3, 13, 1897),
(112, 'Hospitality suite', 3, 14, 1628),
(113, 'Penthouse suite living room', 3, 15, 4048),
(114, 'Penthouse apartment', 3, 16, 8251),
(115, 'Quad Bedroom', 3, 17, 6962),
(116, 'Quad Bedroom', 3, 18, 6440),
(117, 'Hospitality suite', 3, 19, 6036),
(118, 'Quad Bedroom', 3, 20, 9239),
(119, 'Apartment', 3, 21, 9148),
(120, 'Studio', 3, 22, 4679),
(121, 'Apartment', 3, 23, 8875),
(122, 'Standard suite rooms', 3, 24, 8922),
(123, 'Presidential suite', 3, 25, 8324),
(124, 'Apartment', 3, 26, 5457),
(125, 'Penthouse suite living room', 3, 27, 2331),
(126, 'Studio', 3, 28, 7688),
(127, 'Penthouse apartment', 3, 29, 5563),
(128, 'Apartment', 3, 30, 3280),
(129, 'Penthouse apartment', 3, 31, 6873),
(130, 'Deluxe Hotel rooms', 3, 32, 5774),
(131, 'Suite', 3, 33, 9832),
(132, 'Standard suite rooms', 3, 34, 4652),
(133, 'Penthouse suite living room', 3, 35, 1183),
(134, 'Suite', 3, 36, 7667),
(135, 'Quad Bedroom', 3, 37, 9291),
(136, 'Suite', 3, 38, 3880),
(137, 'Apartment', 3, 39, 9311),
(138, 'Deluxe Hotel rooms', 3, 40, 2488),
(139, 'Apartment', 3, 41, 3973),
(140, 'Suite', 3, 42, 4283),
(141, 'Standard suite rooms', 3, 43, 3793),
(142, 'Penthouse suite living room', 3, 44, 513),
(143, 'Studio', 3, 45, 1471),
(144, 'Penthouse apartment', 3, 46, 882),
(145, 'Suite', 3, 47, 3591),
(146, 'Presidential suite', 3, 48, 8732),
(147, 'Deluxe Hotel rooms', 3, 49, 9488);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Booking`
--
ALTER TABLE `Booking`
  ADD PRIMARY KEY (`BID`),
  ADD KEY `Booking-Customer-FK` (`CID`),
  ADD KEY `Booking-Hotel-FK` (`HID`),
  ADD KEY `Booking-room-FK` (`RID`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CID`),
  ADD KEY `Customer-Account-FK` (`AID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EID`),
  ADD KEY `Employee-Account-FK` (`AID`);

--
-- Indexes for table `Hotel`
--
ALTER TABLE `Hotel`
  ADD PRIMARY KEY (`HID`);

--
-- Indexes for table `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`RID`),
  ADD KEY `Hotel-Room-FK` (`HID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `Booking`
--
ALTER TABLE `Booking`
  MODIFY `BID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `CID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `EID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Hotel`
--
ALTER TABLE `Hotel`
  MODIFY `HID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Room`
--
ALTER TABLE `Room`
  MODIFY `RID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Booking`
--
ALTER TABLE `Booking`
  ADD CONSTRAINT `Booking-Customer-FK` FOREIGN KEY (`CID`) REFERENCES `Customer` (`CID`),
  ADD CONSTRAINT `Booking-Hotel-FK` FOREIGN KEY (`HID`) REFERENCES `Hotel` (`HID`),
  ADD CONSTRAINT `Booking-room-FK` FOREIGN KEY (`RID`) REFERENCES `Room` (`RID`);

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `Customer-Account-FK` FOREIGN KEY (`AID`) REFERENCES `Account` (`ID`);

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee-Account-FK` FOREIGN KEY (`AID`) REFERENCES `Account` (`ID`);

--
-- Constraints for table `Room`
--
ALTER TABLE `Room`
  ADD CONSTRAINT `Hotel-Room-FK` FOREIGN KEY (`HID`) REFERENCES `Hotel` (`HID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
