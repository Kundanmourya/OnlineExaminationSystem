-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2023 at 01:49 PM
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
-- Database: `examsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question` varchar(45) NOT NULL,
  `answer` varchar(45) NOT NULL,
  `correct_answer` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`answer_id`, `exam_id`, `question`, `answer`, `correct_answer`, `status`) VALUES
(1, 3, 'A server side comments is of the form:', '<%-- comments --%>', '<%-- comments --%>', 'correct'),
(2, 3, 'Which of the following is true about ', 'All of the above.', 'All of the above.', 'correct'),
(3, 3, 'How constructor can be used for a servlet?', 'Initialization and Constructor function', 'Initialization and Constructor function', 'correct'),
(4, 3, 'How are java web applications packaged?', 'both jar and war', 'both jar and war', 'correct'),
(5, 4, 'A server side comments is of the form:', '<%-- comments --%>', '<%-- comments --%>', 'correct'),
(6, 4, 'How constructor can be used for a servlet?', 'Initialization and Constructor function', 'Initialization and Constructor function', 'correct'),
(7, 4, 'Which of the following is true about ', 'The ', 'All of the above.', 'incorrect'),
(8, 4, 'How are java web applications packaged?', 'both jar and war', 'both jar and war', 'correct'),
(9, 5, 'A server side comments is of the form:', '<%-- comments --%>', '<%-- comments --%>', 'correct'),
(10, 5, 'How constructor can be used for a servlet?', 'Initialization and Constructor function', 'Initialization and Constructor function', 'correct'),
(11, 5, 'How are java web applications packaged?', 'both jar and war', 'both jar and war', 'correct'),
(12, 5, 'Which of the following is true about ', 'All of the above.', 'All of the above.', 'correct'),
(13, 7, 'How constructor can be used for a servlet?', 'Initialization and Constructor function', 'Initialization and Constructor function', 'correct'),
(14, 7, 'A server side comments is of the form:', '<%-- comments --%>', '<%-- comments --%>', 'correct'),
(15, 7, 'Which of the following is true about ', 'The ', 'All of the above.', 'incorrect'),
(16, 7, 'How are java web applications packaged?', 'both jar and war', 'both jar and war', 'correct'),
(17, 8, 'How constructor can be used for a servlet?', 'Initialization and Constructor function', 'Initialization and Constructor function', 'correct'),
(18, 8, 'How are java web applications packaged?', 'both jar and war', 'both jar and war', 'correct'),
(19, 8, 'Which of the following is true about ', 'All of the above.', 'All of the above.', 'correct'),
(20, 8, 'A server side comments is of the form:', '<%-- comments --%>', '<%-- comments --%>', 'correct'),
(21, 9, 'How are java web applications packaged?', 'both jar and war', 'both jar and war', 'correct'),
(22, 9, 'How constructor can be used for a servlet?', 'Initialization and Constructor function', 'Initialization and Constructor function', 'correct'),
(23, 9, 'Which of the following is true about ', 'The ', 'All of the above.', 'incorrect'),
(24, 9, 'A server side comments is of the form:', '<%-- comments --%>', '<%-- comments --%>', 'correct');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_name` varchar(25) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `time` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_name`, `total_marks`, `time`) VALUES
('Enterprise Java', 20, '10');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `std_id` varchar(45) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `total_marks` varchar(45) NOT NULL,
  `obt_marks` varchar(45) DEFAULT NULL,
  `date` varchar(45) NOT NULL,
  `start_time` varchar(45) NOT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `exam_time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`exam_id`, `std_id`, `course_name`, `total_marks`, `obt_marks`, `date`, `start_time`, `end_time`, `exam_time`, `status`) VALUES
(1, '3', 'Enterprise Java', '20', NULL, '12-02-2023', '17:54:05.885', NULL, '10', NULL),
(2, '3', 'Enterprise Java', '20', NULL, '12-02-2023', '18:25:54.367', NULL, '10', NULL),
(3, '3', 'Enterprise Java', '20', '8', '12-02-2023', '18:40:36.757', '18:41:42.313', '10', 'Fail'),
(4, '3', 'Enterprise Java', '20', '6', '12-02-2023', '18:42:41.833', '18:43:12.658', '10', 'Fail'),
(5, '3', 'Enterprise Java', '20', '8', '12-02-2023', '18:48:50.975', '18:49:21.941', '10', 'Fail'),
(6, '3', 'Enterprise Java', '20', NULL, '12-02-2023', '18:52:05.572', NULL, '10', NULL),
(7, '3', 'Enterprise Java', '20', '6', '12-02-2023', '18:53:11.686', '18:53:45.639', '10', 'Fail'),
(8, '3', 'Enterprise Java', '20', '8', '12-02-2023', '19:00:48.405', '19:01:22.406', '10', 'Fail'),
(9, '3', 'Enterprise Java', '20', '6', '12-02-2023', '19:05:57.833', '19:06:33.081', '10', 'Fail');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `course_name` varchar(500) NOT NULL,
  `question` varchar(500) NOT NULL,
  `opt1` varchar(500) NOT NULL,
  `opt2` varchar(500) NOT NULL,
  `opt3` varchar(500) NOT NULL,
  `opt4` varchar(500) NOT NULL,
  `correct` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `course_name`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `correct`) VALUES
(1, 'Enterprise Java', 'Which of the following code is used to get an attribute in a HTTP Session object in servlets?', 'session.getAttribute(String name)', 'session.alterAttribute(String name)', 'session.updateAttribute(String name)', ' session.setAttribute(String name)', 'session.getAttribute(String name)'),
(3, 'Enterprise Java', 'How constructor can be used for a servlet?', 'Initialization', 'Constructor function', 'Initialization and Constructor function', 'Setup() method', 'Initialization and Constructor function'),
(4, 'Enterprise Java', 'Which of the following attributes are mandatory in jsp:getProperty tag?', 'name, property', 'type, id', 'id, property', 'name, type', 'name, property'),
(5, 'Enterprise Java', 'Which of the following attribute is used to have uncaught run-time exceptions automatically forwarded to an error processing page?', 'error', 'errorpage', 'exception', 'exceptionPage', 'errorpage'),
(6, 'Enterprise Java', 'Which of the following method can be used to read parameters names?', 'request.getParameter()', 'response.getParameter()', 'request.getParameterNames()', 'response.getParameterNames()', 'request.getParameterNames()'),
(7, 'Enterprise Java', 'RequestDispatcher presents the __________ package.', 'javax.servlet.http.*', 'javax.servlet.*', 'java.servlet.*', 'java.servlet.http.*', 'javax.servlet.*'),
(8, 'Enterprise Java', 'A server side comments is of the form:', '<%-- comments --%>', '<-- comments ...>', '<%= ------- %>', '<%@ directive attribute=\"val', '<%-- comments --%>'),
(9, 'Enterprise Java', ' _____________ is not a Web Application Technology.', 'Java Servlet', 'Java Server Pages', 'Java Server Faces', 'Enterprise Java Bean', 'Enterprise Java Bean'),
(10, 'Enterprise Java', 'How are java web applications packaged?', 'jar', 'war', 'zip', 'both jar and war', 'both jar and war'),
(11, 'Enterprise Java', 'Which of the following is true about \"c:redirect\" tag ?', 'The \" c:redirect \" tag redirects the browser to an alternate URL by providing automatically URL rewriting.', 'The \" c:redirect \" tag supports context-relative URLs', 'The \" c:redirect \" tag supports \" c:param\"  tag.', 'All of the above.', 'All of the above.');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `name` varchar(25) NOT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='		';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `user_type`, `contact`, `city`, `address`) VALUES
(1, 'admin', '', 'admin', 'admin@admin.com', 'admin', 'admin', '0', 'Mumbai', 'Maharashtra'),
(3, 'Kundan', 'Mourya', 'kgm', 'kgm@gmail.com', 'kgm@123', 'student', '1234567890', 'Mumbai', 'Maharashtra');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_name`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
