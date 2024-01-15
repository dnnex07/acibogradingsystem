-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2020 at 04:25 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mGDO76bw3qtkNayiaFQpFtTdiJLeM1Ad`
--


--
-- Table structure for table `student`
--

CREATE TABLE `tblstudent` (
  `S_ID` int(11) NOT NULL,
  `FNAME` varchar(40) NOT NULL,
  `LNAME` varchar(40) NOT NULL,
  `BIRTHDATE` date NOT NULL,
  `EMAIL` varchar(150) NOT NULL,
  `ADDRESS` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudent`
--

INSERT INTO `tblstudent` (`S_ID`, `FNAME`, `LNAME`, `BIRTHDATE`,  `EMAIL`, `ADDRESS`) VALUES
(1, 'RAYMON', 'TORQUILLO', '1985-09-09', 'rtoquillo@gmail.com', 'Kabankalan City');


--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `COURSE_ID` int(11) NOT NULL,
  `COURSE_NAME` varchar(30) NOT NULL,
  `COURSEDESC` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`COURSE_ID`, `COURSE_NAME`, `COURSEDESC`) VALUES
(12, 'BSIT', 'COLLEGE'),
(13, 'BSBA-MM', 'COLLEGE'),
(14, 'BSBA-FM', 'COLLEGE'),
(15, 'BSA', 'COLLEGE'),
(18, 'BSCRIM', 'COLLEGE'),
(19, 'BPED', 'COLLEGE'),
(21, 'BSED-MATH', 'COLLEGE'),
(22, 'BSED-ENGLISH', 'COLLEGE'),
(23, 'BSED-PILIPINO', 'COLLEGE'),
(24, 'BSED-SCIENCE', 'COLLEGE'),
(25, 'BEED', 'COLLEGE');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `INST_ID` int(30) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `INST_EMAIL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`INST_ID`, `FIRSTNAME`, `LASTNAME`, `INST_EMAIL`) VALUES
(1, 'JOHN', 'CAÑETE', 'johncanete@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `ENROLLMENTID` int(11) NOT NULL,
  `STUDID` int(11) NOT NULL,
  `COURSEID` int(11) NOT NULL,
  `DATE_ENROLLED` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`ENROLLMENTID`, `STUDID`, `COURSEID`, `DATE_ENROLLED`) VALUES
(1, 2019527008, 1, '2019-08-09');

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `ASSIGN_ID` int(11) NOT NULL,
  `COURSE_ID` int(11) NOT NULL,
  `ASSIGNNAME` varchar(50) NOT NULL,
  `TOTAL_POINTS` varchar(20) NOT NULL,
  `DUE_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`ASSIGN_ID`, `COURSE_ID`, `ASSIGNNAME`, `TOTAL_POINTS`, `DUE_DATE`) VALUES
(1, 1, 'Programming', 30, '2023-11-17');

-- --------------------------------------------------------

--
-- Table structure for table `tblgrade`
--

CREATE TABLE `tblgrade` (
  `GRADE_ID` int(11) NOT NULL,
  `STUD_ID` int(11) NOT NULL,
  `ASSIGN_ID` int(11) NOT NULL,
  `POINTS_RECEIVED` varchar(150) NOT NULL,
  `DATE_GRADED` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblgrade`
--

INSERT INTO `tblgrade` (`GRADE_ID`, `STUD_ID`, `ASSIGNMENT_ID`, `POINTS_RECEIVED`, `DATE_GRADED`) VALUES
(1, 1, 1, 25, '2023-11-21');

-- --------------------------------------------------------

--
-- Table structure for table `courseInstructor`
--

CREATE TABLE `courseInstructor` (
  `COURSE_INSTID` int(11) NOT NULL,
  `COURSEID` int(11) NOT NULL,
  `INST_ID` int(11) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseInstructor`
--

INSERT INTO `courseInstructor` (`COURSE_INSTID`, `COURSEID`, `INST_ID`, `START_DATE`, `END_DATE`) VALUES
(1, 2, 1, '2019-03-18', '2019-08-15');


-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `USERSID` int(11) NOT NULL,
  `USERSNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `TYPE` varchar(40) NOT NULL,
  `STATUS` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`USERSID`, `USERSNAME`, `PASSWORD`, `NAME`, `TYPE`, `STATUS`) VALUES
(1, 'student', '12345', 'student', 'student', 'active'),
(2, 'admin', 'admin123', 'admin', 'admin', 'active'),
(3, 'instructor', '123', 'instructor', 'instructor', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblstudent`
--
ALTER TABLE `tblstudent`
  ADD PRIMARY KEY (`S_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`COURSE_ID`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`INST_ID`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`ENROLLMENTID`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`ASSIGN_ID`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`GRADE_ID`);

--
-- Indexes for table `courseInstructor`
--
ALTER TABLE `courseInstructor`
  ADD PRIMARY KEY (`COURSE_INSTID`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`USERID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblstudent`
--
ALTER TABLE `tblstudent`
  MODIFY `S_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `COURSE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `INST_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `ENROLLID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `ASSIGN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `GRADEID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `courseInstructor`
--
ALTER TABLE `courseInstructor`
  MODIFY `COURSE_INSTID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `USERID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

