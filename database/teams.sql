
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teams`
--

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `car_reg` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_time_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `car_reg`, `contact`, `team_id`, `date_time`, `date_time_update`) VALUES
(1, 'aaa', 'AB09 TTY', '001', 1, '2023-05-19 00:46:07', '2023-05-19 05:12:55'),
(2, 'bbb', 'AB09 TTY', '002', 1, '2023-05-19 00:46:07', '2023-05-23 15:05:08'),
(3, 'test', 'asdf', '345', 1, '2023-05-23 15:05:36', '0000-00-00 00:00:00'),
(7, 'hhh', 'AB09 TTY', '6789', 3, '2023-05-19 00:46:07', '2023-05-23 15:08:14'),
(8, 'iii', 'AB09 TTY', '45367', 3, '2023-05-19 00:46:07', '2023-05-23 15:07:55'),
(9, 'jjj', 'AB09 TTY', '435', 3, '2023-05-19 00:46:07', '2023-05-23 15:07:34'),
(10, 'kkk', 'AB09 TTY', '2345', 4, '2023-05-19 00:46:07', '2023-05-23 15:09:50'),
(11, 'lll', 'AB09 TTY', '5467', 4, '2023-05-19 00:46:07', '2023-05-23 15:10:05'),
(12, 'mmm', 'AB09 TTY', '453656', 4, '2023-05-19 00:46:07', '2023-05-23 15:10:18'),
(13, 'aa', 'AB09 TTY', '4536', 5, '2023-05-19 00:46:07', '2023-05-23 15:10:43'),
(14, 'bb', 'AB09 TTY', '3456', 5, '2023-05-19 00:46:07', '2023-05-23 15:10:57'),
(15, 'cc', 'AB09 TTY', '980678', 5, '2023-05-19 00:46:07', '2023-05-23 15:11:13'),
(16, 'dd', 'AB09 TTY', '21345', 6, '2023-05-19 00:46:07', '2023-05-23 15:11:34'),
(17, 'ee', 'AB09 TTY', '2345', 6, '2023-05-19 00:46:07', '2023-05-23 15:11:51'),
(18, 'ff', 'AB09 TTY', '56789', 6, '2023-05-19 00:46:07', '2023-05-23 15:12:05'),
(19, 'gg', 'AB09 TTY', '897087', 7, '2023-05-19 00:46:07', '2023-05-23 15:12:35'),
(45454, 'test 2', 'dffgdsfg', '534564567', 1, '2023-05-25 00:34:50', '0000-00-00 00:00:00'),
(22, 'test ', 'sadf', '3456345435', 7, '2023-05-19 01:33:57', '2023-05-19 01:34:56'),
(32423, 'test 45563', 'rgdf', '43456', 7, '2023-05-19 04:21:02', '0000-00-00 00:00:00'),
(2343, 'test 5', 'dffg', '545645', 8, '2023-05-19 04:56:34', '0000-00-00 00:00:00'),
(34542, 'test 6', 'adsf', '45564556', 8, '2023-05-19 04:57:12', '0000-00-00 00:00:00'),
(56785, 'test 7', 'ghdg', '455654', 8, '2023-05-19 04:57:27', '0000-00-00 00:00:00'),
(33, 'test', 'adsf', '3245423454', 1, '2023-05-19 05:34:06', '0000-00-00 00:00:00'),
(234, 'dfg', 'fgh', '345', 2, '2023-05-23 15:05:53', '0000-00-00 00:00:00'),
(4325, 'fdg', 'sdf', '456', 2, '2023-05-23 15:06:07', '0000-00-00 00:00:00'),
(2345, 'dsf', 'sdf', '678', 2, '2023-05-23 15:06:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_id`, `team_name`) VALUES
(1, 'team1'),
(2, 'team2'),
(3, 'team3'),
(4, 'team4'),
(5, 'team5'),
(6, 'team6'),
(7, 'team7'),
(8, 'team8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
