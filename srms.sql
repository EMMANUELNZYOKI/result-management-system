-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2025 at 12:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2025-10-23 10:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `super_admin`
--

CREATE TABLE `super_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `super_admin`
--

INSERT INTO `super_admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'superadmin', '0192023a7bbd73250516f069df18b500', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblclasses`
--

CREATE TABLE `tblclasses` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(80) DEFAULT NULL,
  `ClassNameNumeric` int(4) DEFAULT NULL,
  `Section` varchar(5) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclasses`
--

INSERT INTO `tblclasses` (`id`, `ClassName`, `ClassNameNumeric`, `Section`, `CreationDate`, `UpdationDate`) VALUES
(1, 'multi-subject learners 1', 1, 'A', '2025-10-22 10:30:57', '2025-10-23 10:30:57'),
(2, 'multi-subject learners 2', 2, 'A', '2025-10-22 10:30:57', '2025-10-23 10:30:57'),
(4, 'multi-subject learners 3', 3, 'A', '2025-10-22 10:30:57', '2025-10-23 10:30:57'),
(5, 'multi-subject learners 4', 4, 'A', '2025-10-22 10:30:57', '2025-10-23 10:30:57'),
(6, 'multi-subject learners 5', 5, 'A', '2025-10-22 10:30:57', '2025-10-23 10:30:57'),
(7, 'multi-subject learners 6', 6, 'A', '2025-10-22 10:30:57', '2025-10-23 10:30:57'),
(8, 'multi-subject learners 7', 7, 'A', '2025-10-22 10:30:57', '2025-10-23 10:30:57'),
(9, 'multi-subject learners 8', 8, 'A', '2025-10-22 10:30:57', '2025-10-22 22:33:29');

-- --------------------------------------------------------

--
-- Table structure for table `tblnotice`
--

CREATE TABLE `tblnotice` (
  `id` int(11) NOT NULL,
  `noticeTitle` varchar(255) DEFAULT NULL,
  `noticeDetails` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblnotice`
--

INSERT INTO `tblnotice` (`id`, `noticeTitle`, `noticeDetails`, `postingDate`) VALUES
(2, 'Notice regarding result Delearation', 'Date: October 23, 2025\r\nSubject: Declaration of Examination Results\r\n\r\nThis is to inform all students that the results for the Mid-Term / Final Examinations of the current academic session will be declared on October 28, 2025.\r\n\r\nStudents will be able to view their results through the Student Result Management System (SRMS) by logging in with their respective Roll Numbers and Class details.\r\n\r\nYou are advised to:\r\n\r\nVerify your details carefully after viewing your results.\r\n\r\nReport any discrepancies (if found) to the Examination Cell within 5 working days of result publication.\r\n\r\nDownload and save a copy of your result for your personal record.\r\n\r\nFor any queries related to result access or technical support, please contact the admin office at support@srms.edu.in\r\n or visit the school’s IT helpdesk during working hours.\r\n\r\nWe wish all students the very best of luck for their results!\r\n\r\nBy Order,\r\nExamination Controller\r\nStudent Result Management System (SRMS)', '2025-10-23 14:34:58'),
(3, 'Test Notice', 'Date: October 23, 2025\r\nSubject: Upcoming Test Schedule\r\n\r\nThis is to notify all students that the upcoming internal tests for the current academic term will commence from November 3, 2025. Detailed subject-wise schedules will be displayed on the classroom notice boards and made available through the Student Result Management System (SRMS).\r\n\r\nStudents are advised to:\r\n\r\nCheck the timetable carefully and be present in their respective examination rooms at least 15 minutes before the scheduled time.\r\n\r\nCarry their valid student ID card for verification.\r\n\r\nStrictly follow all examination rules and maintain discipline during the tests.\r\n\r\nAny student facing timetable conflicts should report to the Examination Controller’s office within two working days from the date of this notice.\r\n\r\nWe wish all students the best of preparation and success in their upcoming tests.\r\n\r\nBy Order,\r\nExamination Controller\r\nStudent Result Management System (SRMS)', '2025-10-23 14:48:32'),
(6, 'School Closing Announcement', 'Date: October 23, 2025\r\nSubject: School Closing for End of Term\r\n\r\nThis is to inform all students, teachers, and parents that the school will officially close on Friday, October 31, 2025, for the end of the academic term.\r\n\r\nAll classes, examinations, and extracurricular activities will be completed before the closing date. Students are advised to:\r\n\r\nClear all pending assignments and library dues before the closing day.\r\n\r\nCollect their progress reports from class teachers.\r\n\r\nEnsure personal belongings are taken home.\r\n\r\nThe school will reopen on Monday, January 6, 2026.\r\nWe wish everyone a restful and enjoyable holiday.\r\n\r\nBy Order\r\nSchool Administration\r\nStudent Result Management System (SRMS)', '2025-10-22 23:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `tblresult`
--

CREATE TABLE `tblresult` (
  `id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblresult`
--

INSERT INTO `tblresult` (`id`, `StudentId`, `ClassId`, `SubjectId`, `marks`, `PostingDate`, `UpdationDate`) VALUES
(2, 1, 1, 2, 100, '2024-05-10 10:30:57', NULL),
(3, 1, 1, 1, 80, '2024-05-10 10:30:57', NULL),
(4, 1, 1, 5, 78, '2024-05-10 10:30:57', NULL),
(5, 1, 1, 4, 60, '2024-05-10 10:30:57', NULL),
(6, 2, 4, 2, 90, '2024-05-10 10:30:57', NULL),
(7, 2, 4, 1, 75, '2024-05-10 10:30:57', NULL),
(8, 2, 4, 5, 56, '2024-05-10 10:30:57', NULL),
(9, 2, 4, 4, 80, '2024-05-10 10:30:57', NULL),
(10, 4, 7, 2, 54, '2024-05-10 10:30:57', NULL),
(11, 4, 7, 1, 85, '2024-05-10 10:30:57', NULL),
(12, 4, 7, 5, 55, '2024-05-10 10:30:57', NULL),
(13, 4, 7, 7, 65, '2024-05-10 10:30:57', NULL),
(14, 5, 8, 2, 75, '2024-05-10 10:30:57', NULL),
(15, 5, 8, 1, 56, '2024-05-10 10:30:57', NULL),
(16, 5, 8, 5, 52, '2024-05-10 10:30:57', NULL),
(17, 5, 8, 4, 80, '2024-05-10 10:30:57', NULL),
(18, 6, 9, 8, 80, '2024-05-20 15:20:18', NULL),
(19, 6, 9, 8, 70, '2024-05-20 15:20:18', NULL),
(20, 6, 9, 2, 90, '2024-05-20 15:20:18', NULL),
(21, 6, 9, 1, 60, '2024-05-20 15:20:18', NULL),
(22, 7, 9, 8, 98, '2025-10-22 22:55:36', NULL),
(23, 7, 9, 8, 90, '2025-10-22 22:55:36', NULL),
(24, 7, 9, 2, 87, '2025-10-22 22:55:36', NULL),
(25, 7, 9, 1, 95, '2025-10-22 22:55:36', NULL),
(26, 8, 8, 2, 78, '2025-10-23 09:35:54', NULL),
(27, 8, 8, 1, 87, '2025-10-23 09:35:54', NULL),
(28, 8, 8, 5, 98, '2025-10-23 09:35:54', NULL),
(29, 8, 8, 4, 67, '2025-10-23 09:35:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `StudentId` int(11) NOT NULL,
  `StudentName` varchar(100) DEFAULT NULL,
  `RollId` varchar(100) DEFAULT NULL,
  `StudentEmail` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DOB` varchar(100) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`StudentId`, `StudentName`, `RollId`, `StudentEmail`, `Gender`, `DOB`, `ClassId`, `RegDate`, `UpdationDate`, `Status`) VALUES
(1, 'sarita', '0001', 'sarita@gmail.com', 'Female', '1995-03-03', 1, '2025-10-23 10:30:57', NULL, 1),
(2, 'Anuj', '0002', 'anuj@gmail.com', 'Male', '1995-02-02', 4, '2025-10-23 10:30:57', NULL, 0),
(3, 'amit', '0003', 'amit@gmail.com', 'Male', '2014-08-06', 6, '2025-10-23 10:30:57', NULL, 1),
(4, 'rahul', '0004', 'rahul@gmail.com', 'Male', '2001-02-03', 7, '2025-10-23 10:30:57', NULL, 1),
(6, 'Shiv', '0005', 'shiv@gmail.com', 'Male', '2007-01-12', 9, '2025-10-23 15:19:40', NULL, 1),
(7, 'kajax', '777', 'kajax@gmail.com', 'Male', '2000-12-24', 9, '2025-10-22 22:53:57', NULL, 1),
(8, 'joy', '0381', 'joy@gmail.com', 'Female', '1996-12-17', 8, '2025-10-23 09:35:22', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjectcombination`
--

CREATE TABLE `tblsubjectcombination` (
  `id` int(11) NOT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `Updationdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubjectcombination`
--

INSERT INTO `tblsubjectcombination` (`id`, `ClassId`, `SubjectId`, `status`, `CreationDate`, `Updationdate`) VALUES
(3, 2, 5, 0, '2024-05-01 10:30:57', '2024-06-07 05:25:49'),
(4, 1, 2, 0, '2024-05-01 10:30:57', '2025-10-22 23:01:52'),
(5, 1, 4, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(6, 1, 5, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(8, 4, 4, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(10, 4, 1, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(12, 4, 2, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(13, 4, 5, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(14, 6, 1, 0, '2024-05-01 10:30:57', '2025-10-22 23:02:03'),
(15, 6, 2, 0, '2024-05-01 10:30:57', '2025-10-22 23:02:13'),
(16, 6, 4, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(17, 6, 6, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(18, 7, 1, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(19, 7, 7, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(20, 7, 2, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(21, 7, 6, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(22, 7, 5, 0, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(23, 8, 1, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(24, 8, 2, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(25, 8, 4, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(26, 8, 6, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(27, 8, 5, 0, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(28, 9, 1, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(29, 9, 2, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(30, 9, 8, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(31, 9, 8, 1, '2024-05-01 10:30:57', '2024-06-07 04:28:00'),
(32, 9, 6, 1, '2025-10-22 23:01:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubjects`
--

CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubjects`
--

INSERT INTO `tblsubjects` (`id`, `SubjectName`, `SubjectCode`, `Creationdate`, `UpdationDate`) VALUES
(1, 'Maths', 'MTH01', '2025-10-23 10:30:57', NULL),
(2, 'English', 'ENG11', '2025-10-23 10:30:57', NULL),
(4, 'Science', 'SC1', '2025-10-23 10:30:57', NULL),
(5, 'Music', 'MS', '2025-10-23 10:30:57', NULL),
(6, 'Social Studies', 'SS08', '2025-10-23 10:30:57', NULL),
(7, 'Physics', 'PH03', '2025-10-23 10:30:57', NULL),
(8, 'Chemistry', 'CH65', '2025-10-23 10:30:57', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `super_admin`
--
ALTER TABLE `super_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblclasses`
--
ALTER TABLE `tblclasses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblnotice`
--
ALTER TABLE `tblnotice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblresult`
--
ALTER TABLE `tblresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`StudentId`);

--
-- Indexes for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `super_admin`
--
ALTER TABLE `super_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblclasses`
--
ALTER TABLE `tblclasses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblnotice`
--
ALTER TABLE `tblnotice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblresult`
--
ALTER TABLE `tblresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblsubjectcombination`
--
ALTER TABLE `tblsubjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tblsubjects`
--
ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
