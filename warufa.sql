-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 12, 2019 at 11:14 AM
-- Server version: 10.2.24-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warufa`
--

-- --------------------------------------------------------

--
-- Table structure for table `sysware_careers`
--

CREATE TABLE `sysware_careers` (
  `career_id` int(11) NOT NULL,
  `career_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `career_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `career_date_created` date NOT NULL,
  `career_date_updated` date DEFAULT NULL,
  `career_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sysware_careers`
--

INSERT INTO `sysware_careers` (`career_id`, `career_title`, `career_desc`, `career_date_created`, `career_date_updated`, `career_admin`) VALUES
(1, 'title 1', 'desc 1', '2019-08-05', NULL, 1),
(2, 'career 2', 'desc 2', '2019-08-05', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sysware_career_forms`
--

CREATE TABLE `sysware_career_forms` (
  `career_form_id` int(11) NOT NULL,
  `career_form_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `career_form_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `career_form_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `career_form_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `career_form_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `career_form_date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sysware_contact_forms`
--

CREATE TABLE `sysware_contact_forms` (
  `contact_form_id` int(11) NOT NULL,
  `contact_form_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_form_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_form_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_form_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_form_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_form_date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sysware_events`
--

CREATE TABLE `sysware_events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date_created` date NOT NULL,
  `event_date_updated` date DEFAULT NULL,
  `event_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sysware_events`
--

INSERT INTO `sysware_events` (`event_id`, `event_title`, `event_desc`, `event_image`, `event_date_created`, `event_date_updated`, `event_admin`) VALUES
(1, 'title 1', 'desc 1', 'image 1', '2019-08-05', NULL, 1),
(2, 'titlel 2', 'desc 2', 'image 2', '2019-08-05', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sysware_event_images`
--

CREATE TABLE `sysware_event_images` (
  `event_image_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sysware_event_images`
--

INSERT INTO `sysware_event_images` (`event_image_id`, `image_id`, `event_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sysware_images`
--

CREATE TABLE `sysware_images` (
  `image_id` int(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sysware_images`
--

INSERT INTO `sysware_images` (`image_id`, `image_name`) VALUES
(1, '1'),
(2, '2');

-- --------------------------------------------------------

--
-- Table structure for table `sysware_news`
--

CREATE TABLE `sysware_news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `news_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `news_date_created` date NOT NULL,
  `news_date_updated` date DEFAULT NULL,
  `news_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sysware_news`
--

INSERT INTO `sysware_news` (`news_id`, `news_title`, `news_desc`, `news_date_created`, `news_date_updated`, `news_admin`) VALUES
(1, 'titl 1', 'desc 1', '0000-00-00', NULL, 0),
(2, 'title 1', 'desc 1', '2019-08-05', NULL, 1),
(3, 'title 2', 'desc 2', '2019-08-05', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sysware_partners`
--

CREATE TABLE `sysware_partners` (
  `partner_id` int(11) NOT NULL,
  `partner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_view` int(11) NOT NULL DEFAULT 0,
  `partner_visit` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sysware_partners`
--

INSERT INTO `sysware_partners` (`partner_id`, `partner_name`, `partner_view`, `partner_visit`) VALUES
(1, '1', 0, 0),
(2, '1', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sysware_users`
--

CREATE TABLE `sysware_users` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_date_created` date NOT NULL,
  `user_date_updated` date DEFAULT NULL,
  `user_role` enum('admin','author') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sysware_users`
--

INSERT INTO `sysware_users` (`user_id`, `user_first_name`, `user_last_name`, `user_email`, `user_password`, `user_date_created`, `user_date_updated`, `user_role`) VALUES
(1, 'first1', 'last1', 'email 1', 'pass 1', '2019-08-05', NULL, 'admin'),
(2, 'first2', 'last2', 'email2', 'pass 2', '2019-08-05', NULL, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sysware_careers`
--
ALTER TABLE `sysware_careers`
  ADD PRIMARY KEY (`career_id`);

--
-- Indexes for table `sysware_career_forms`
--
ALTER TABLE `sysware_career_forms`
  ADD PRIMARY KEY (`career_form_id`);

--
-- Indexes for table `sysware_contact_forms`
--
ALTER TABLE `sysware_contact_forms`
  ADD PRIMARY KEY (`contact_form_id`);

--
-- Indexes for table `sysware_events`
--
ALTER TABLE `sysware_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `sysware_event_images`
--
ALTER TABLE `sysware_event_images`
  ADD PRIMARY KEY (`event_image_id`);

--
-- Indexes for table `sysware_images`
--
ALTER TABLE `sysware_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `sysware_news`
--
ALTER TABLE `sysware_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `sysware_partners`
--
ALTER TABLE `sysware_partners`
  ADD PRIMARY KEY (`partner_id`);

--
-- Indexes for table `sysware_users`
--
ALTER TABLE `sysware_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sysware_careers`
--
ALTER TABLE `sysware_careers`
  MODIFY `career_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sysware_career_forms`
--
ALTER TABLE `sysware_career_forms`
  MODIFY `career_form_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sysware_contact_forms`
--
ALTER TABLE `sysware_contact_forms`
  MODIFY `contact_form_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sysware_events`
--
ALTER TABLE `sysware_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sysware_event_images`
--
ALTER TABLE `sysware_event_images`
  MODIFY `event_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sysware_images`
--
ALTER TABLE `sysware_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sysware_news`
--
ALTER TABLE `sysware_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sysware_partners`
--
ALTER TABLE `sysware_partners`
  MODIFY `partner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sysware_users`
--
ALTER TABLE `sysware_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
