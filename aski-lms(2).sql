-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2022 at 07:46 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aski-lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `Name`, `Email`, `Password`) VALUES
(1, 'Admin', 'admin@email.com', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `ap_id` int(10) NOT NULL,
  `studentName` varchar(255) NOT NULL,
  `st_id` int(20) NOT NULL,
  `teacher_id` int(20) NOT NULL,
  `time` datetime NOT NULL,
  `teacherName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `q_id` int(11) NOT NULL,
  `question_title` mediumtext DEFAULT NULL,
  `question_detail` mediumtext NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_code` int(11) NOT NULL,
  `question_img` varchar(255) DEFAULT NULL,
  `ques_points` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(30) NOT NULL DEFAULT 'Unanswered'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`q_id`, `question_title`, `question_detail`, `student_id`, `subject_code`, `question_img`, `ques_points`, `created_at`, `Status`) VALUES
(17, NULL, '7. If area of a rhombus is 506 cm² and length of diagonal is 23 cm. then find the length of other diagonal', 1, 2, 'maxresdefault (1).jpg', '10', '2022-09-18 23:08:44', 'Answered'),
(18, NULL, 'Why is tetraoxosulphate(vi) not used to prepare carbon (iv)oxide', 1, 4, 'question_1.png', '15', '2022-09-18 23:09:58', 'Unanswered'),
(19, NULL, 'What shows the various properties of selected object', 4, 7, 'media_483_483c8228-6aa8-4c20-8c78-c045a8bf8a74_image.png', '20', '2022-09-18 23:13:33', 'Answered'),
(20, NULL, 'if i was sent in school from 1st standard and im still in same school at 10th std how many years did i spent in that school ​', 3, 2, 'unnamed.png', '15', '2022-09-18 23:14:57', 'Unanswered'),
(21, NULL, 'Molten iron fills a mould, which has a volume of 200cm3. what is the volume when the iron cools and solidifies', 4, 3, '1.png', '30', '2022-09-18 23:15:48', 'Answered'),
(22, NULL, 'Write a query to display the Movie id, Theatre id, Screen number, Show time and Category of the movies which are running for more than 30 days. Category must be shown as CENTURY for movies running for more than 99 days and NA for less than 100 days. Sort the records base on the movie id in descending order', 3, 7, 'maxresdefault (4).jpg', '30', '2022-09-18 23:18:54', 'Answered');

-- --------------------------------------------------------

--
-- Table structure for table `solutions`
--

CREATE TABLE `solutions` (
  `sol_id` int(11) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `Solution` mediumtext NOT NULL,
  `sol_img` varchar(255) NOT NULL,
  `ques_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `solutions`
--

INSERT INTO `solutions` (`sol_id`, `answer`, `Solution`, `sol_img`, `ques_id`, `student_id`, `created_at`) VALUES
(8, 'This is Answer', 'If area of a rhombus is 506 cm² and length of diagonal is 23 cm. then find the length of other diagonal', 'maxresdefault (3).jpg', 21, 3, '2022-09-18 23:26:39'),
(9, 'Query test', '$sql = \"SELECT * FROM teacher\";\r\n  	$resultset = mysqli_query($db, $sql) or die(\"database error:\". mysqli_error($db));\r\n  	while( $t = mysqli_fetch_assoc($resultset) )', 'Screenshot 2022-09-18 232808.jpg', 22, 1, '2022-09-18 23:28:46'),
(10, 'This is The Answer', 'if Student.objects.filter(student_id=id).exists():', 'Screenshot 2022-09-18 232945.jpg', 19, 1, '2022-09-18 23:31:20'),
(11, 'Physics Answer', 'What shows the various properties of selected object', '2.webp', 17, 4, '2022-09-18 23:32:04');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `Full_Name` varchar(20) DEFAULT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `Rank` varchar(20) NOT NULL,
  `points` int(10) DEFAULT 100,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `username`, `Full_Name`, `Email`, `Password`, `phone`, `Rank`, `points`, `img`) VALUES
(0, 'Test', 'Test Name', 'test@gmail.com', '123456', '01871038150', 'Newbie', 135, 'pngtree-businessman-user-avatar-free-vector-png-image_1538405.jpg'),
(1, 'Ashik', 'AShikur Jaman Rakib', 'ashik@gmail.com', '12345', '015720752', 'Newbie', 63, 'rakib.jpg'),
(3, 'choyon', 'Chyon Muhammad', 'Some@gmail.com', '12345', NULL, 'Newbie', 115, 'pngtree-businessman-user-avatar-free-vector-png-image_1538405.jpg'),
(4, 'adiba', 'Tasneem Rahman ADiba', 'Adiba@gmail.com', '12345', '01720380747', 'Newbie', 775, 'adiba.jpg'),
(5, 'ferabiiiiiiii', 'Ferabi Ferabi', 'ferabi@ferabi.com', '12345', '12345678', 'Newbie', 10, 'ferabi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `s_code` int(11) NOT NULL,
  `Subject_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`s_code`, `Subject_Name`) VALUES
(1, 'Finance'),
(2, 'Math'),
(3, 'Physics'),
(4, 'Chemistry'),
(5, 'Economics'),
(6, 'Law'),
(7, 'Computer Science'),
(8, 'History'),
(9, 'Biology');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  `Education` varchar(30) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `cv` varchar(255) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'Unapproved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `Name`, `Email`, `Subject`, `Education`, `phone`, `address`, `profile_pic`, `cv`, `status`) VALUES
(15, 'ashik', 'ashik@gmail.com', 'Computer Science', 'BSCSE, UIU', '1234567890', 'Badda, Dhaka', 'rakib.jpg', 'cv2.jpg', 'Approved'),
(16, 'Tasneem ', 'adba001@gmail.com', 'Math', 'BSc in MATH, DU', '12345697870', 'Maijdhi, Noakhali', 'adiba.jpg', 'cv4.jpg', 'Approved'),
(17, 'Ferabiii', 'ferabi@ferabi.cpom', 'History', 'Fail in Every Subject', '321456987', 'Chor er polapan', 'ferabi.jpg', 'cv3.jpg', 'Unapproved'),
(18, 'Choyon', 'choyon@gmai.com', 'Physics', 'Scientist in Physics, MIT', '111100011100', 'Gulshan, Dhaka', 'pngtree-businessman-user-avatar-free-vector-png-image_1538405.jpg', 'cv1.jpg', 'Approved');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`ap_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`q_id`);

--
-- Indexes for table `solutions`
--
ALTER TABLE `solutions`
  ADD PRIMARY KEY (`sol_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`s_code`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `ap_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `q_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `solutions`
--
ALTER TABLE `solutions`
  MODIFY `sol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `s_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
