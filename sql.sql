-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2019 at 04:35 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(23) NOT NULL,
  `pengirim` varchar(255) DEFAULT NULL,
  `penerima` varchar(50) NOT NULL,
  `chat` text,
  `file` varchar(100) NOT NULL,
  `chatTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `pengirim`, `penerima`, `chat`, `file`, `chatTime`) VALUES
(209, 'shadiqal', 'kaka', 'ss', '', '2019-04-27 05:36:32'),
(208, 'kuliahkoding', 'kaka', 'oi bro', '', '2019-04-27 05:34:21'),
(207, 'kuliahkoding', 'kaka', 'oi bro\n', '', '2019-04-27 05:34:16'),
(206, 'kuliahkoding', 'kaka', 'broðŸ™†â€â™‚ï¸ðŸ™†â€â™‚ï¸ðŸ™…â€â™‚ï¸ðŸ™…â€â™‚ï¸\n', '', '2019-04-27 05:34:10'),
(205, 'kuliahkoding', 'kaka', 'bro\n', '', '2019-04-27 05:33:59'),
(204, 'kuliahkoding', 'kaka', 'bro\n', '', '2019-04-27 05:33:56'),
(203, 'kuliahkoding', 'kaka', 'bro', '', '2019-04-27 05:33:52'),
(202, 'shadiqal', 'kuliahkoding', 'sehat bro', '', '2019-04-27 05:33:03'),
(201, 'shadiqal', 'kuliahkoding', 'sehat ðŸ˜„ðŸ˜„', '', '2019-04-27 05:23:20'),
(200, 'kuliahkoding', 'shadiqal', 'apa kabarðŸ™‹â€â™‚ï¸ðŸ™‹â€â™‚ï¸\n', '', '2019-04-27 05:22:54'),
(199, 'kuliahkoding', 'shadiqal', 'apa kabarðŸ™‹â€â™‚ï¸ðŸ™‹â€â™‚ï¸\n', '', '2019-04-27 05:22:53'),
(198, 'shadiqal', 'kuliahkoding', 'hai', '', '2019-04-27 05:19:52'),
(197, 'kuliahkoding', 'shadiqal', 'hai', '', '2019-04-27 05:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `namaLengkap` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `email`, `gambar`, `namaLengkap`, `password`) VALUES
('kaka', 'kaka@gmail.com', 'roni.jpg', 'Kaka roni', '123'),
('kuliahkoding', 'jaka@gmail.com', 'kuliahKoding.png', 'kuliah Koding ', 'kuliahkoding123'),
('shadiqal', 'shadiqalmughni12@gmail.com', 'shadiq.jpg', 'Shadiq al mughni', 'sadik123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
