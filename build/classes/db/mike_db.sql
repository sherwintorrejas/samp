-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2023 at 05:34 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mike_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `dept_id` int(10) NOT NULL,
  `dept_code` varchar(50) NOT NULL,
  `dept_desc` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`dept_id`, `dept_code`, `dept_desc`) VALUES
(1, 'BSIT', 'Bachelor of Science in Information Technology'),
(2, 'BSBA', 'Bachelor of Science in Business Administration');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enrollee`
--

CREATE TABLE `tbl_enrollee` (
  `en_id` int(10) NOT NULL,
  `s_id` int(10) NOT NULL,
  `dept_id` int(10) NOT NULL,
  `en_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_enrollee`
--

INSERT INTO `tbl_enrollee` (`en_id`, `s_id`, `dept_id`, `en_status`) VALUES
(1, 1, 1, 'Paid'),
(2, 7, 2, 'Paid'),
(3, 8, 1, 'Unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `s_id` int(10) NOT NULL,
  `s_fname` varchar(50) NOT NULL,
  `s_lname` varchar(50) NOT NULL,
  `s_gender` varchar(10) NOT NULL,
  `s_address` varchar(100) NOT NULL,
  `s_status` varchar(20) NOT NULL,
  `s_contact` varchar(20) NOT NULL,
  `s_email` varchar(60) NOT NULL,
  `s_image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`s_id`, `s_fname`, `s_lname`, `s_gender`, `s_address`, `s_status`, `s_contact`, `s_email`, `s_image`) VALUES
(1, 'John', 'Doe', 'Male', 'Test Address Location', 'Single', '09456454510', 'mike@test.com', ''),
(7, 'Mike', 'Test', 'Male', 'Address', 'Single', '0945464', 'test@email.com', ''),
(8, 'Joe', 'Test', 'Male', 'Test Address', 'Married', '0985465', 'test', ''),
(11, 'a', 'a', 'Male', 'as', 'Single', 'as', 'as', ''),
(12, 'b', 'b', 'Male', 'b', 'Single', 'b', 'b', ''),
(13, 'vv', 'vv', 'Male', 'vv', 'Single', 'vv', 'vv', 'src/images/IMG_0737.jpg'),
(14, 'sss', 'sss', 'Female', 'ggsss', 'Married', 'sss', 'ggsss', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(10) NOT NULL,
  `user_fname` varchar(50) NOT NULL,
  `user_lname` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_fname`, `user_lname`, `user_email`, `username`, `password`, `user_status`) VALUES
(1, 'Update', 'Testing', 'test@update.com', 'admins', 'admins', 'Active'),
(4, 'Fname', 'Lname', 'Email@test.com', 'username', 'password', 'Pending'),
(5, 'Mike', 'Test', 'email@trest.test', 'Miek', 'Mike', 'Pending'),
(7, 't', 't', 't', 't', '47mKTaMaEn1L3m5DAz9muidMqw636xxw7EFAK/YnPdg=', 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `tbl_enrollee`
--
ALTER TABLE `tbl_enrollee`
  ADD PRIMARY KEY (`en_id`),
  ADD KEY `enroll_student` (`s_id`),
  ADD KEY `enroll_department` (`dept_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `dept_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_enrollee`
--
ALTER TABLE `tbl_enrollee`
  MODIFY `en_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_enrollee`
--
ALTER TABLE `tbl_enrollee`
  ADD CONSTRAINT `enroll_department` FOREIGN KEY (`dept_id`) REFERENCES `tbl_department` (`dept_id`),
  ADD CONSTRAINT `enroll_student` FOREIGN KEY (`s_id`) REFERENCES `tbl_student` (`s_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
