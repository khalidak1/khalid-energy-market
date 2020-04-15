-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 15, 2020 at 12:02 PM
-- Server version: 5.7.29-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khalid_energy_market`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator_super_user`
--

CREATE TABLE `administrator_super_user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `tx_address` text NOT NULL,
  `tokens` varchar(20) NOT NULL DEFAULT '0',
  `carbon_credits` varchar(20) NOT NULL DEFAULT '0',
  `energy_units` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator_super_user`
--

INSERT INTO `administrator_super_user` (`id`, `name`, `email`, `password`, `tx_address`, `tokens`, `carbon_credits`, `energy_units`) VALUES
(1, 'Khalid', 'admin@khalid.io', 'Iostream', '0xAf55F3B7DC65c8f8577cf00C8C5CA7b6E8Cc4433', '1000000', '1000000', '1000000');

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tx_address` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `value` float NOT NULL,
  `tx_hash` varchar(50) NOT NULL,
  `carbon_credits` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buy_token`
--

CREATE TABLE `buy_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tx_address` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `no_of_tokens` float NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `buy_tx_id` varchar(100) NOT NULL,
  `currency` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buy_token`
--

INSERT INTO `buy_token` (`id`, `user_id`, `user_name`, `email`, `tx_address`, `amount`, `no_of_tokens`, `status`, `date`, `buy_tx_id`, `currency`) VALUES
(38, 189, 'test', 'test@khalid.io', '0x00c4bc23481c04081170d91f902f732b687673b0', 1000, 416.67, 'Approved', '2020-04-08 17:25:43', 'Account', 'Dollar'),
(39, 184, 'Arpita Birla', 'arpita@khyalid.io', '0xa977de8de97d8336389c275da3ce906b079b3885', 12, 5, 'Approved', '2020-04-14 18:28:37', 'ggygtfffgfgfgasfgdasfdas54465654', 'Dollar'),
(40, 189, 'test', 'test@khalid.io', '0x00c4bc23481c04081170d91f902f732b687673b0', 1000, 416.67, 'Approved', '2020-04-14 18:42:36', 'buy', 'Dollar');

-- --------------------------------------------------------

--
-- Table structure for table `carbon_credits`
--

CREATE TABLE `carbon_credits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_tx_id` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `process` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carbon_credits`
--

INSERT INTO `carbon_credits` (`id`, `user_id`, `user_tx_id`, `amount`, `process`, `date`, `status`) VALUES
(11, 189, '0x00c4bc23481c04081170d91f902f732b687673b0', 49, 'Amount Requested / Buy', '2020-04-08 17:29:09', 'Approved'),
(12, 184, '0xa977de8de97d8336389c275da3ce906b079b3885', 70, 'Amount Requested / Buy', '2020-04-14 18:32:12', 'Approved'),
(13, 189, '0x00c4bc23481c04081170d91f902f732b687673b0', 1000, 'Amount Requested / Buy', '2020-04-14 18:43:39', 'Pending'),
(14, 189, '0x00c4bc23481c04081170d91f902f732b687673b0', 10, 'Amount Sent / Sold', '2020-04-14 18:44:13', 'Approved'),
(15, 189, '0x00c4bc23481c04081170d91f902f732b687673b0', 10, 'Amount Sent / Sold', '2020-04-15 09:36:18', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `energy_credits`
--

CREATE TABLE `energy_credits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_tx_id` varchar(100) NOT NULL,
  `amount` float NOT NULL,
  `process` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `energy_credits`
--

INSERT INTO `energy_credits` (`id`, `user_id`, `user_tx_id`, `amount`, `process`, `date`, `status`) VALUES
(16, 184, '0xa977de8de97d8336389c275da3ce906b079b3885', 20, 'Amount Requested / Buy EC', '2020-04-14 18:29:55', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `entrc_price`
--

CREATE TABLE `entrc_price` (
  `id` int(11) NOT NULL,
  `price` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `entrc_price`
--

INSERT INTO `entrc_price` (`id`, `price`, `date`) VALUES
(1, 2.12, '2018-01-26 10:48:40'),
(2, 2.4, '2018-04-28 11:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `header` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `header`
--

INSERT INTO `header` (`id`, `header`, `date`) VALUES
(1, '<p>You can Now Buy/Sell KEM Tokens From&nbsp;<a href="http://coinexchange.io/" target="_blank">coinexchange.io</a>&nbsp;and Enjoy</p>\n', '2020-04-08 17:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `kyc`
--

CREATE TABLE `kyc` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_name` varchar(50) NOT NULL,
  `file` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kyc`
--

INSERT INTO `kyc` (`id`, `user_id`, `document_name`, `file`, `status`, `date`, `username`, `email`) VALUES
(126, 184, 'KYC Document', '1584631294bala.png', 'Pending', '2020-04-08 17:05:28', 'arpita', 'arpita@khalid.io'),
(127, 189, 'KYC Document', '15857370192858212181.jpg', 'Verified', '2020-04-01 11:09:28', 'test', 'test@khalid.io'),
(128, 189, 'KYC Document', '1585737064Bilde-03.02.2018-19-15-01.jpg', 'Verified', '2020-04-01 11:09:33', 'test', 'test@khalid.io');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `notification` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `for` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT 'Unread'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `notification`, `date`, `for`, `user_id`, `status`) VALUES
(1, 'Admin Account Profile Updated', '2020-04-08 17:14:01', 'admin', 0, 'Read'),
(2, 'A Buy Request has Been Initiated', '2020-04-08 17:24:00', 'user', 189, 'Unread'),
(3, 'A Buy Request has been Initiated', '2020-04-08 17:24:00', 'admin', 0, 'Unread'),
(4, 'Buy Token Request Approved', '2020-04-08 17:25:43', 'admin', 0, 'Unread'),
(5, 'Your Buy Token Request Approved, Balance Has Been Added To Your Wallet', '2020-04-08 17:25:43', 'user', 189, 'Unread'),
(6, 'A Send Request Executed to 0x6aff49e563d4898aaf65c060f0f9d4caeada7122', '2020-04-08 17:26:22', 'user', 189, 'Unread'),
(7, 'A Send Request Exected from 0x00c4bc23481c04081170d91f902f732b687673b0 to 0x6aff49e563d4898aaf65c060f0f9d4caeada7122 from User', '2020-04-08 17:26:22', 'admin', 0, 'Unread'),
(8, 'A Carbon Credit of49, Buy Request has Been Initiated from you', '2020-04-08 17:29:09', 'user', 189, 'Unread'),
(9, 'A Carbon Credit Buy Request has been Initiated', '2020-04-08 17:29:09', 'admin', 0, 'Unread'),
(10, 'A Send Request Executed to 0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433 ', '2020-04-10 10:58:04', 'user', 189, 'Unread'),
(11, 'A Send Request Exected from 0x00c4bc23481c04081170d91f902f732b687673b0 to 0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433  from User', '2020-04-10 10:58:04', 'admin', 0, 'Unread'),
(12, 'A Send Request Executed to 0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433 ', '2020-04-10 10:59:28', 'user', 189, 'Unread'),
(13, 'A Send Request Exected from 0x00c4bc23481c04081170d91f902f732b687673b0 to 0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433  from User', '2020-04-10 10:59:28', 'admin', 0, 'Unread'),
(14, 'Withdraw Requests has been made From A User', '2020-04-14 12:53:02', 'admin', 0, 'Unread'),
(15, 'You raised Withdraw Request of 10', '2020-04-14 12:53:02', 'user', 189, 'Unread'),
(16, 'A Buy Request has Been Initiated', '2020-04-14 18:27:36', 'user', 184, 'Unread'),
(17, 'A Buy Request has been Initiated', '2020-04-14 18:27:36', 'admin', 0, 'Unread'),
(18, 'Buy Token Request Approved', '2020-04-14 18:28:37', 'admin', 0, 'Unread'),
(19, 'Your Buy Token Request Approved, Balance Has Been Added To Your Wallet', '2020-04-14 18:28:37', 'user', 184, 'Unread'),
(20, 'A energy Credit of20, Buy Request has Been Initiated from you', '2020-04-14 18:29:55', 'user', 184, 'Unread'),
(21, 'A energy Credit Buy Request has been Initiated', '2020-04-14 18:29:55', 'admin', 0, 'Unread'),
(22, 'A Carbon Credit of70, Buy Request has Been Initiated from you', '2020-04-14 18:32:12', 'user', 184, 'Unread'),
(23, 'A Carbon Credit Buy Request has been Initiated', '2020-04-14 18:32:12', 'admin', 0, 'Unread'),
(24, 'A Send Request Executed to 0x6aff49e563d4898aaf65c060f0f9d4caeada7122', '2020-04-14 18:36:52', 'user', 189, 'Unread'),
(25, 'A Send Request Exected from 0x00c4bc23481c04081170d91f902f732b687673b0 to 0x6aff49e563d4898aaf65c060f0f9d4caeada7122 from User', '2020-04-14 18:36:52', 'admin', 0, 'Unread'),
(26, 'A Buy Request has Been Initiated', '2020-04-14 18:38:07', 'user', 189, 'Unread'),
(27, 'A Buy Request has been Initiated', '2020-04-14 18:38:07', 'admin', 0, 'Unread'),
(28, 'Withdraw Requests has been made From A User', '2020-04-14 18:40:21', 'admin', 0, 'Unread'),
(29, 'You raised Withdraw Request of 10', '2020-04-14 18:40:21', 'user', 189, 'Unread'),
(30, 'Withdraw Token Request Approved', '2020-04-14 18:42:14', 'admin', 0, 'Unread'),
(31, 'Your Withdraw Token Request Approved', '2020-04-14 18:42:14', 'user', 28, 'Unread'),
(32, 'Withdraw Token Request Approved', '2020-04-14 18:42:17', 'admin', 0, 'Unread'),
(33, 'Your Withdraw Token Request Approved', '2020-04-14 18:42:17', 'user', 27, 'Unread'),
(34, 'Buy Token Request Approved', '2020-04-14 18:42:36', 'admin', 0, 'Unread'),
(35, 'Your Buy Token Request Approved, Balance Has Been Added To Your Wallet', '2020-04-14 18:42:36', 'user', 189, 'Unread'),
(36, 'A Send Request Executed to 0x6aff49e563d4898aaf65c060f0f9d4caeada7122', '2020-04-14 18:43:17', 'user', 189, 'Unread'),
(37, 'A Send Request Exected from 0x00c4bc23481c04081170d91f902f732b687673b0 to 0x6aff49e563d4898aaf65c060f0f9d4caeada7122 from User', '2020-04-14 18:43:17', 'admin', 0, 'Unread'),
(38, 'A Carbon Credit of1000, Buy Request has Been Initiated from you', '2020-04-14 18:43:39', 'user', 189, 'Unread'),
(39, 'A Carbon Credit Buy Request has been Initiated', '2020-04-14 18:43:39', 'admin', 0, 'Unread'),
(40, 'A Carbon Credit of10, Exchange Request has Been Initiated from you and Approved', '2020-04-14 18:44:13', 'user', 189, 'Unread'),
(41, 'A Carbon Credit Exchange Request has been Initiated', '2020-04-14 18:44:13', 'admin', 0, 'Unread'),
(42, 'A Carbon Credit of10, Exchange Request has Been Initiated from you and Approved', '2020-04-15 09:36:18', 'user', 189, 'Unread'),
(43, 'A Carbon Credit Exchange Request has been Initiated', '2020-04-15 09:36:18', 'admin', 0, 'Unread'),
(44, 'Withdraw Requests has been made From A User', '2020-04-15 09:37:08', 'admin', 0, 'Unread'),
(45, 'You raised Withdraw Request of 10', '2020-04-15 09:37:08', 'user', 189, 'Unread');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  `otp` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sell_requests`
--

CREATE TABLE `sell_requests` (
  `id` int(11) NOT NULL,
  `to_address` varchar(50) NOT NULL,
  `from_address` varchar(50) NOT NULL,
  `token` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tx_hash` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Success'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sell_requests`
--

INSERT INTO `sell_requests` (`id`, `to_address`, `from_address`, `token`, `date`, `tx_hash`, `user_id`, `user_name`, `status`) VALUES
(135, '0x6aff49e563d4898aaf65c060f0f9d4caeada7122', '0x00c4bc23481c04081170d91f902f732b687673b0', 100, '2020-04-08 17:26:22', '0xa9b6bf63b8fc4d53f4dcf2723c08b5067b7a53e239400a13bd6be6c91c4f6c4e', 189, 'test', 'Success'),
(136, '0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433 ', '0x00c4bc23481c04081170d91f902f732b687673b0', 10, '2020-04-10 10:58:04', '0x4ced0306353e0f5e53ed9afcdb18ffb37b7a53e239400a13bd6be6c91c4f6c4e', 189, 'test', 'Success'),
(137, '0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433 ', '0x00c4bc23481c04081170d91f902f732b687673b0', 100, '2020-04-10 10:59:28', '0xdd9ab74a0feccedee6f302caba6a02377b7a53e239400a13bd6be6c91c4f6c4e', 189, 'test', 'Success'),
(138, '0x6aff49e563d4898aaf65c060f0f9d4caeada7122', '0x00c4bc23481c04081170d91f902f732b687673b0', 10, '2020-04-14 18:36:52', '0x55677d45c535a88138c5e1d95fd057f57b7a53e239400a13bd6be6c91c4f6c4e', 189, 'test', 'Success'),
(139, '0x6aff49e563d4898aaf65c060f0f9d4caeada7122', '0x00c4bc23481c04081170d91f902f732b687673b0', 10, '2020-04-14 18:43:17', '0x4abe8d648b8281b2a5fc88a5981659867b7a53e239400a13bd6be6c91c4f6c4e', 189, 'test', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `send_carbon_credits_requests`
--

CREATE TABLE `send_carbon_credits_requests` (
  `id` int(11) NOT NULL,
  `to_address` varchar(50) NOT NULL,
  `from_address` varchar(50) NOT NULL,
  `token` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tx_hash` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Success'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `send_energy_credits_requests`
--

CREATE TABLE `send_energy_credits_requests` (
  `id` int(11) NOT NULL,
  `to_address` varchar(50) NOT NULL,
  `from_address` varchar(50) NOT NULL,
  `token` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tx_hash` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Success'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `question` text NOT NULL,
  `description` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `ans` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `id` int(11) NOT NULL,
  `to` varchar(70) NOT NULL,
  `from` varchar(70) NOT NULL,
  `tx_address` varchar(100) NOT NULL,
  `tokens` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL,
  `process` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'KEM'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`id`, `to`, `from`, `tx_address`, `tokens`, `date`, `status`, `process`, `type`) VALUES
(12, '0x6aff49e563d4898aaf65c060f0f9d4caeada7122', '0x00c4bc23481c04081170d91f902f732b687673b0', '0x55677d45c535a88138c5e1d95fd057f57b7a53e239400a13bd6be6c91c4f6c4e', 10, '2020-04-14 18:36:52', 'Success', 'Sent Tokens', 'KEM'),
(13, '0x00c4bc23481c04081170d91f902f732b687673b0', '0x00c4bc23481c04081170d91f902f732b687673b0', '0x2ae2bca50ce3fec67533cd5d3d06a5fb7b7a53e239400a13bd6be6c91c4f6c4e', 10, '2020-04-14 18:42:14', 'Success', 'Withdraw Tokens', 'KEM'),
(14, '0x00c4bc23481c04081170d91f902f732b687673b0', '0x00c4bc23481c04081170d91f902f732b687673b0', '0xdd33d325f8b59e25a855abf9101c7e7f7b7a53e239400a13bd6be6c91c4f6c4e', 10, '2020-04-14 18:42:17', 'Success', 'Withdraw Tokens', 'KEM'),
(15, '0x00c4bc23481c04081170d91f902f732b687673b0', '0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433 : KEM ADMIN', '0x6a096f3ecae75dc4b20f5753ff0e72767b7a53e239400a13bd6be6c91c4f6c4e', 416.67, '2020-04-14 18:42:36', 'Success', 'Buy Tokens', 'KEM'),
(16, '0x6aff49e563d4898aaf65c060f0f9d4caeada7122', '0x00c4bc23481c04081170d91f902f732b687673b0', '0x4abe8d648b8281b2a5fc88a5981659867b7a53e239400a13bd6be6c91c4f6c4e', 10, '2020-04-14 18:43:17', 'Success', 'Sent Tokens', 'KEM'),
(17, '0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433 : SXT ADMIN', '0x00c4bc23481c04081170d91f902f732b687673b0', '0x60a8e5af8cccc6ec9b510ef66f625ac87b7a53e239400a13bd6be6c91c4f6c4e', 1, '2020-04-14 18:44:13', 'Success', 'Credited in Exchange to Carbon Credits', 'SXT'),
(18, '0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433 : SXT ADMIN', '0x00c4bc23481c04081170d91f902f732b687673b0', '0x60a8e5af8cccc6ec9b510ef66f625ac87b7a53e239400a13bd6be6c91c4f6c4e', 10, '2020-04-14 18:44:13', 'Success', 'Sell Carbon Credits', 'Carbon Credits'),
(19, '0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433 : SXT ADMIN', '0x00c4bc23481c04081170d91f902f732b687673b0', '0x6386b1fc0e3099d031dc69447cca85207b7a53e239400a13bd6be6c91c4f6c4e', 1, '2020-04-15 09:36:18', 'Success', 'Credited in Exchange to Carbon Credits', 'SXT'),
(20, '0xAf55F3B7DC65c8f9577cf00C8C5CA7b6E8Cc4433 : SXT ADMIN', '0x00c4bc23481c04081170d91f902f732b687673b0', '0x6386b1fc0e3099d031dc69447cca85207b7a53e239400a13bd6be6c91c4f6c4e', 10, '2020-04-15 09:36:18', 'Success', 'Sell Carbon Credits', 'Carbon Credits');

-- --------------------------------------------------------

--
-- Table structure for table `tx_addresses`
--

CREATE TABLE `tx_addresses` (
  `id` int(11) NOT NULL,
  `tx_address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tx_addresses`
--

INSERT INTO `tx_addresses` (`id`, `tx_address`, `email`, `status`) VALUES
(1, '0xaec1b8bf6196225e5e8848e220a58867a23d5a95', 'crazykane2000@gmail.com', 'Used'),
(2, '0xd085ad2c03f2d8dadc9d686fe2979a073b700f2f', 'crazykane2000@gmail.com', 'Used'),
(3, '0x1b6e5b5c16ac60ee58819a248f0d969f540472ba', 'crazykane2000@gmail.com', 'Used'),
(4, '0xb4799d2278a60958e6e4a602de4bec0bca85fd06', 'coke@outlook.co.th', 'Used'),
(5, '0x6302f8774a817747d4a0b90f7cb2fcf46c3c5b12', 'info@solarxell.com', 'Used'),
(6, '0xf34d006ccc5a6170b4be62df767a7d966dba1687', 'guptavinshu@gmail.com', 'Used'),
(7, '0x1c2541b18d5345f5635f09ee2fd85fe2ca0590e5', 'squad@gmail.com', 'Used'),
(8, '0x483cfb0ea5629fa9ded547782d42398bd2cbba97', 'kinie@ahrvo.io', 'Used'),
(9, '0xa977de8de97d8336389c275da3ce906b079b3885', 'arpita@ahrvo.io', 'Used'),
(10, '0xd44a5bcd12762672ceb03350233100b3baae95be', 'Furongli@khalid.io', 'Used'),
(11, '0x361cad0d9d8f02322af1d8c2ec0446658401e8b0', '', 'Used'),
(12, '0x3173a69df2e8c24faae1fb649fa85ca82f53ad29', '', 'Used'),
(13, '0xe1e6899edc07abac87d277ec010c5f0e7292a789', '', 'Used'),
(14, '0xa3b13e73627e11f7cfe520a70449700841b0305f', 'khalid98@khalid.io', 'Used'),
(15, '0xe950339bd45909441b939eab7911a5899331a91a', 'kinie2@gmail.com', 'Used'),
(16, '0x2e14120e63b49ea959a0681cb09252d5166fbd26', 'simmi@gmail.com', 'Used'),
(17, '0x00c4bc23481c04081170d91f902f732b687673b0', 'test@khalid.io', 'Used'),
(18, '0x6aff49e563d4898aaf65c060f0f9d4caeada7122', 'test1@khalid.io', 'Used'),
(19, '0x0301f04484c0991a50496ea45e9a07c204c2094b', '', 'Pending'),
(20, '0x7ccb20cf8728081bb54f7f4cbcfb7835d3bd28ab', 'kishan@mailinator.com', 'Pending'),
(21, '0x63f6ba60768c756a4a34391933556dd3b489ed46', 'crazykane2000@gmail.com', 'Pending'),
(22, '0x184d11bd6c5bd928a82d4572000edddb52d0ba3c', 'guptavinshu@gmail.com', 'Pending'),
(23, '0xcbe6f7f3465fa4d3569091b30ea4dc4d1b43aa05', 'cyberrichh@gmail.com', 'Pending'),
(24, '0x7f5b55e7490535c6112287ced2c87aa0973416c8', 'Jo.tran@hotmail.com', 'Pending'),
(25, '0xd1805ad0cad1a519744344fba1337f5972541483', 'peter@fmstech.asia', 'Pending'),
(32, '0xe55dc41c52e1cf0caf5fbe2beca12c793a785a75', 'support@catpops.in', 'Pending'),
(27, '0xed839f2d99001f132e3b2564c9fbb1e7181691a2', 'crazykane2000@gmail.com', 'Pending'),
(29, '0xf1f96fafa0ce122cbeca891302fe5dd26724c3e0', 'peter@fmstech.asia', 'Pending'),
(30, '0x4ac88294385a2a0d3a073fbf9301efe509d513ee', 'ksgtk@me.com', 'Pending'),
(31, '0xb8be6b5ce7d9b5f9ceb71c301db0887370ef576e', 'kjma0870@gmail.com', 'Pending'),
(33, '0xb1c776df45ab315f3c1d87dfa1a34287d1b90d73', 'youknock58@gmail.com', 'Pending'),
(35, '0xceecf88e206baf013eb0028250b4b3035220513d', 'test@test.com', 'Pending'),
(36, '0x6dd51734c32e10451af2fa8f5c3f95d62f9a45ee', 'airum111@gmail.com', 'Pending'),
(37, '0x66770cb38bef6a5e86836d81bd2df1a2e002bc10', 'wnldpdyd21@gmail.com', 'Pending'),
(38, '0x877e4d2364067e158d06ec867f0ae5572b260858', 'chinka12g@gmail.com', 'Pending'),
(39, '0xb72f3f2abbb776f54308fb2db4b77ba13b5156e3', 'arpitabirla@gmail.com', 'Pending'),
(40, '0xe09703b59492e88c99a0aa60081f3062ee14ad68', 'cyberrichhk@gmail.com', 'Pending'),
(41, '0x26c36ce0a78cbe878592ac1b893064272f3ac09a', 'c.sato.rb@gmail.com', 'Pending'),
(43, '0x85215d028c3c7e5ed80c6c7e3c568aaf06b4421c', 'cyberrichh@gmail.com', 'Pending'),
(45, '0x5f84faab7dbdf7b919946ece0a12c3b823c45c04', 'harvey@lanotdesign.com', 'Pending'),
(72, '0xd604994dc6432f93865e86e6624dc15417224883', 'ritamg123@gmail.com', 'Pending'),
(48, '0xbb0c702c5f8cd243a775890e83fc3c8ccace06ea', 'guptavinshu@gmail.comdd', 'Pending'),
(49, '0x04fdfe8a1f97a86cc08543fc09468548fc00e46a', 'guptawvinshu@gmail.com', 'Pending'),
(50, '0x88205b8d7d51d9296b219519355a65c9d0ecf0e6', 'guptaddvinshu@gmail.com', 'Pending'),
(53, '0x2ced8b532c93a447ab364847481958c4975d00e1', 'care.cookiestudio@gmail.com', 'Pending'),
(54, '0x0e7879110e81bddee510777e5312357275bce526', 'care.cookiestudio@gmail.com', 'Pending'),
(55, '0xee3d942c22b359f19465f8d891fa073189d0e9d3', 'care.cookiestudio@gmail.com', 'Pending'),
(56, '0xf0bdcaffb5e266029e3e589900c8d07f1e5f0aab', 'care.cookiestudio@gmail.com', 'Pending'),
(59, '0x3023999a73874af93bf7f3ce7922be4dd82b831f', 'care.cookiestudio@gmail.com', 'Pending'),
(60, '0x9f0cf9d402462a084924b067c3a383abfb8782a9', 'care.cookiestudio@gmail.com', 'Pending'),
(61, '0x115ceaba706b486a9c08d9bd2c9ce82f0ab7a2a7', 'care.cookiestudio@gmail.com', 'Pending'),
(71, '0x512ce33fa98038d43a89ae4c379ffa424eb8f529', 'care.cookiestudio@gmail.com', 'Pending'),
(64, '0xcaa3dc93bb0a297c7772e5ce314d716f1df0b7aa', 'care.cookiestudio@gmail.com', 'Pending'),
(65, '0x2d45c9070ba30d92c92817b570a3b13c5c501aa8', 'care.cookiestudio@gmail.com', 'Pending'),
(66, '0x5283f8721f145833cab3f9ca3b074b8936807a92', 'care.cookiestudio@gmail.com', 'Pending'),
(67, '0xe9875d2ebbe1b454d66c6a1c4abd2d33e9b2bcae', 'Cyberrichhk@gmail.com', 'Pending'),
(68, '0x749258932d5dfed1c4c5f3db70b01a2280bb39fd', 'c.sato.rb@gmail.com', 'Pending'),
(69, '0x21eb0cf0aa59d2670d76ee30217e65b44fbefaae', 'cyberrichhk@gmail.com', 'Pending'),
(70, '0xf28efa3943e3452257dfc210cd693183f7db7e43', 'cyberrichhk@gmail.com', 'Pending'),
(73, '0xe1d597fb9ceb7d4abfcea0a19ce024f92ad57482', 'Crazykane2000@gmail.com', 'Pending'),
(74, '0x8127681e89758465b3a36e787a8f0b09fd9bc4b2', 'fsvhiro2003@yahoo.co.jp', 'Pending'),
(75, '0x33fe59a5781f7e5664f5ac364fbd5f6e329828fe', 'noguchipintoerikson@gmail.com', 'Pending'),
(76, '0xf27f4662ef0298c0e11d6fcb35e728d63512d0cc', 'admin@bigbang.com', 'Pending'),
(77, '0x877c916e6cfdda1eea1eb1c4b8845b19e664fd98', 'wnldpdyd21@gmail.com', 'Pending'),
(78, '0x70cbea6cbfcc4cc7b90ccc63e6fcadb32f8bcc7a', 'arpitabirla@gmail.com', 'Pending'),
(79, '0xfb4f7cf92e1fdedc6bf222166d94cf5bb4215ea9', 'kishan@mailinator.com', 'Pending'),
(80, '0x53415cafacb8340b1e4a9a7174f55f2fa57454a5', 'arpitabirla@mailinator.com', 'Pending'),
(81, '0xa44f1c2c1c07867581004ee758095d087211389b', 'pchevry@gmail.com', 'Pending'),
(82, '0x0c0607ad074a629e3d4b7f3a61e9a187830faa41', 'kys58229277@gmail.com', 'Pending'),
(83, '0x371d8da09735068083245b494bd12d3f0bea63f7', 'yosikawa72@naver.com', 'Pending'),
(84, '0x3a54be99326864e43b4e2d8cc817bb850c04c1ed', 'daebak4979@gmail.com', 'Pending'),
(85, '0x392c3774658fb680c29f6edcb0470de17d79ab33', 'gin@bax-tv.com', 'Pending'),
(86, '0x2c8811af49286d20ee4b388783fab8f09d4c62a0', 'peter@fmstech.asia', 'Pending'),
(87, '0x10c3d54044803bf92a14c75a9c040494d6487d98', 'ritamg123@gmail.com', 'Pending'),
(88, '0x361de0159c63911fdb2260a1a75903f2d5d05886', 'crazykane2000@gmail.com', 'Pending'),
(89, '0xc267c4d35fb681a731410d90f69a62359e60c5b6', 'dalma929@naver.com', 'Pending'),
(90, '0x7eb989928681ee67ba8f4f5ce5890333b03697d1', 'nnnnnnnn103103@gmail.com', 'Pending'),
(91, '0x168daf5a4edf803082f61acc5402c67d65ee2ebf', 'golden_baek@naver.com', 'Pending'),
(92, '0x1c0f2405bba3aefd80354a809209d59e263226b6', 'opopyk@naver.com', 'Pending'),
(93, '0x1ebcafbc71ccc49df19ebbe37345e53fe0120aa1', 'irielife11196@gmail.com', 'Pending'),
(94, '0x524b301c5bf46f16e47667637e70d1d1a1c815ec', 'new2s@hanmail.net', 'Pending'),
(95, '0x1e7d7191da13a9a448476fcc7e28b7f0d1e2a607', 'stout2408@gmail.com', 'Pending'),
(96, '0x722f482941e4074762b3903da2f0b04df4f162f3', 'mehwa2000@gmail.com', 'Pending'),
(97, '0xdbb05cc2f6d69538c100ee32071f21dc15bd4ce9', 'pairworld@naver.com', 'Pending'),
(98, '0x23438dd8ef6e7efd30622469564d841b6934b0fa', 'perfectpeople38@gmail.com', 'Pending'),
(99, '0x7e1ec7108ffc428455ff9451c8a5000ee0450a9f', 'Kkh180407', 'Pending'),
(100, '0xd5d7d1cea8169c62e9b6d14d2e344eadb71ee552', 'kkh180407@gmail.com', 'Pending'),
(101, '0xfd32f83f1904790016ba8969449b1e733d5fa499', 'litjeong@naver.com', 'Pending'),
(102, '0xa6d382a622f8daa4a4188f655605cac89462731a', 'jtl1291@gmail.com ', 'Pending'),
(103, '0x725866e1ccac3d5309b458e18a41391c4cf4e129', 'hakmoon21@gmail.com', 'Pending'),
(104, '0x999b64caaad5ea4c99553430ae5e13cd4532b070', 'yelllim8@gmail.com', 'Pending'),
(105, '0x3392395ebc6b22f6fb67661a4ef6a946d338df6b', 'aaaa5149999@gmail.com', 'Pending'),
(106, '0xf34b4a758806b284b590aa0f149f950220bafa14', 'qkddk6@naver.com', 'Pending'),
(107, '0xe43ad26c5870ff15c506d9e8b7c1c42f718e77bf', 'jtl1291@hanmail.net', 'Pending'),
(108, '0xa9ad1eb948c9ddf0e40e446d2e19db7e32ff4cde', 'kimkj8259@gmail.com', 'Pending'),
(109, '0x3a3411dc85b8adb45fdd69a1b456cce4a97e255d', 'kkh84511@gmail.com', 'Pending'),
(110, '0xa003b76f2581f5639f4829db202c5e5e08f6058e', 'lol08070301@gmail.com', 'Pending'),
(111, '0x02d7298873779ed50a9c3c2543baa6fb0978ace6', 'hkisac@hanmail.net', 'Pending'),
(112, '0x4930ad9f47f81e7f20a411dfa59a9e052ec96807', 'a01041186602@gmail.com', 'Pending'),
(113, '0xd724a0e3ef4fa317b68909b886293d5b62603076', 'salangtu@gmail.com', 'Pending'),
(114, '0x929a639cdd638724279bedd1804f2d64d012fac1', 'wooree31311@gmail.com', 'Pending'),
(115, '0x37e541ed7f2845f047fe17fa1f021766cc26f6f0', 'youknock58@gmail.com', 'Pending'),
(116, '0x4c3a2177c83a2b5a77f546fa8ad533a6e75b735a', 'ito3135@gmail.com', 'Pending'),
(117, '0x52d100bc9e62c404bd6ff03cd41f35a81d2e05f5', 'globaldevery25@gmail.com', 'Pending'),
(118, '0xc8b31990d5a0d3024257fbccbb86dfb62297d887', 'hkshins777@gmail.com', 'Pending'),
(119, '0x226cd94d08ded63b142ce4e7c3d1ac0e1e2be4cd', 'goldmedal', 'Pending'),
(120, '0x41168e21add5d3241d89d526a23ab899cb3e8210', '7002coin@gmail.com', 'Pending'),
(121, '0x5c9ccef4999b0785a67c051ef71ac3a7593f1d23', 'tower4688 ', 'Pending'),
(122, '0x622e357c73f0e110fb2734a4d50ea77397b863b0', 'tower4688 @naver.com', 'Pending'),
(123, '0x6fef0715bcf5642b7ac67d47662010853d28ead9', 'kunihiko_okudaira@yahoo.co.jp', 'Pending'),
(124, '0x24fefd5f1863983f92dd21d72e8df7d122b4e7dc', 'tower4688@ naver.com ', 'Pending'),
(125, '0x906db5b38aa7174230557a9b936130efb48e4457', 'generation_next21a@yahoo.co.jp', 'Pending'),
(126, '0xda4f1d55cfa7f65689dc4199edc7509c95112ad0', 'watanabe@symphony-co.biz', 'Pending'),
(127, '0x9be1248878553b2351698f1ae17757dd94f58f25', '2914kanakororin@gmail.com', 'Pending'),
(128, '0xc49797a214166951c8d20dcab710d9b2793f4f8c', 'hky8520@nate.com ', 'Pending'),
(129, '0x9fa52bedf2084255fe224366a6c1188f8ed7d2ac', 'hky85200@nate.com', 'Pending'),
(130, '0x901f94c4506013c2aa0e5f6d9c52826a00360d87', 'yell-lim@hanmail.net', 'Pending'),
(131, '0xd8844f981bfbae568a78e553dfd18ebb71dc40bf', 'yelllim@naver.com', 'Pending'),
(132, '0xf8219ed450911929ad3f2051f0f3a133f6e1ea71', 'tower4688@naver.com', 'Pending'),
(133, '0x18a878940341cc0c6f9ed19f02dd28179b213c9f', '0363.masart@gmail.com', 'Pending'),
(134, '0xdde613c5651f24b7377c58b1f24967b0ce605f6b', 'jtl1291b@gmail.com', 'Pending'),
(135, '0xf2b02074db60999eef74ea47445f1fe159eda0e8', 'hyounmi8259@gmail.com', 'Pending'),
(136, '0x339a57a5730e9cacbc2411ac4818cf74966d60c7', 'hyoun8259@gmail.com', 'Pending'),
(137, '0xbc1ea64d5f52a14f33ec185ff4b489b360805bce', 'sanjihan0330@gmail.com', 'Pending'),
(138, '0x45eb2fae31a68838a403d120d1bd7afae7a16f94', 'c_sato_rb@yahoo.co.jp', 'Pending'),
(139, '0xb2dad9a644aae08f7ef1c855e4d2ded98ccb4c85', 'clanpee.sns@gmail.com', 'Pending'),
(140, '0x206504cec13d80008a9f3f75bc57ece78baf7860', 'chinka12g@gmail.com', 'Pending'),
(141, '0x220d969330131b1df955fce3b490cb1317b5519a', 'sco9626@naver.com', 'Pending'),
(142, '0x30d580d83245ab92387c75b6d18208a495d0e63d', 'oksong9626@hanmail.net', 'Pending'),
(143, '0xf160e81e82c253858f48886f586bab3762bc57af', 'nakao.rays@gmail.com', 'Pending'),
(144, '0xbec648eecb5daac5c2a7da76c8c95cf8018ab762', 'cha6588@naver.com', 'Pending'),
(145, '0xd1589cbf05f4872ebb1b8b99cbae29a5d1b05464', 'angou0802@gmail.com', 'Pending'),
(146, '0xf297b27b91dd939848a79af40b69bf9c9ed2678f', 'sanggon8009@gmail.com', 'Pending'),
(147, '0x4da88207364bf0c1b220c087d77b706ef0a877b8', 'buliliare@gmail.com', 'Pending'),
(148, '0x419575abfd690f27aa499ad8ea3162a772ee0696', 'priyankamodi76@gmail.com', 'Pending'),
(149, '0x247a891e1cc7bfe2a59a5f978ee43a943db9af42', '', 'Pending'),
(150, '0x2dd7b00abc13e4330afacff8429df53d7710d7dd', '', 'Pending'),
(151, '0xd65f4e667379896618bc849541fb37ccb55560cc', '', 'Pending'),
(152, '0x068abe765d9adbd7505bf44db210ae7a7e9bbcaa', '', 'Pending'),
(153, '0x1b3fee80f01d8b048d72596ccf10178f64c40fd8', '', 'Pending'),
(154, '0xa935503abf4ab7068c077ad1d98cb989e6bdb776', '', 'Pending'),
(155, '0x38e7a6dc722a63c6da374036c93747fcdba7e0da', '', 'Pending'),
(156, '0xc20340247d876a29b5a4d0ed19e353aa10e1478a', '', 'Pending'),
(157, '0xed249e47244ee0563420275fe0dccb8aa38ff3b5', '', 'Pending'),
(158, '0xb50267b1f756d4a600d29bd50fd66ac3b596b22e', '', 'Pending'),
(159, '0xb0d0d3349e2ef6c21c49bc2496d5e86dae6821c5', '', 'Pending'),
(160, '0x7a69c81d830a38cb50651d0d045d0a9a895d329c', '', 'Pending'),
(161, '0xb7b3899b4b15ff7f54ffdc7129d345b25a0fce30', '', 'Pending'),
(162, '0xf1a263d9f259c735929b96bbcb8ae762a6bbec0f', '', 'Pending'),
(163, '0x50747badc200aa8c432361e303e3a107c1b74ee1', '', 'Pending'),
(164, '0xa52848df48cdc91cd9ed40a3e72acc3dc2ce7c7e', '', 'Pending'),
(165, '0x4e4697452af98f3f518e6ec3e1f77165cc35079b', '', 'Pending'),
(166, '0x204b0ffdbf3419572c110d4a9dfb1e203c582f2f', '', 'Pending'),
(167, '0x91338ef98261c3b5dcd8d767bb8892515bcba9b8', '', 'Pending'),
(168, '0xd5653234f5f63d8cd6bcd94b4bf48f697047c33e', '', 'Pending'),
(169, '0x921aec0b8b87b608d283752dd85aca1e7a534912', '', 'Pending'),
(170, '0x5472f50c26cda3cd147bf9bf3189b6a5028234f4', '', 'Pending'),
(171, '0x555c472da13f5fef5b69a1411f9cae5d932b276d', '', 'Pending'),
(172, '0xd544017bba7b0bf219da92ed33f5d0e6ca15b72e', '', 'Pending'),
(173, '0xf40d9a9d7da2f011a0e7bd25aca7fb754243c2fb', '', 'Pending'),
(174, '0xc372f087e9871aba1d559a6974a28ab2b4b7368c', '', 'Pending'),
(175, '0x4a78a69782098a2328d10c0a1331ef4b14a1a931', '', 'Pending'),
(176, '0x93f7aafd88c3a0c0e989e05c0bde2ff0e305e55c', '', 'Pending'),
(177, '0x813dfeac265e30d2dd9a82780c2c73a552c55f82', '', 'Pending'),
(178, '0xd09f346685c21616c84a400da75488bf0c8d107a', '', 'Pending'),
(179, '0x17e62003da65e48dc8e205a9c65c8d6ce5b9474c', '', 'Pending'),
(180, '0x7ce13e773c381fb546f1dd01bb17e4c5bb94d6f5', '', 'Pending'),
(181, '0xd0382bfbc9a8d124b4bbbf320224bdd81d424a0a', '', 'Pending'),
(182, '0x79edef7a020dc802092ff117c88281080c2ae64c', '', 'Pending'),
(183, '0xd48c4a457d24a0033541aa23c70b312950bbd5da', '', 'Pending'),
(184, '0xa54f3b29ea3b301b4a1a835cfb04de108d508e6a', '', 'Pending'),
(185, '0x4911f3351cfc6179fe8c5c8033e118faf949d228', '', 'Pending'),
(186, '0x85417ee9e95742e400290b8c82157906c8058865', '', 'Pending'),
(187, '0xac65cdb538a7c162ae8843393660e0400632b9f9', '', 'Pending'),
(188, '0x8800626780c5e5002eb97ced5eb6d181fe972950', '', 'Pending'),
(189, '0x2f175f6ac223feef0edd6ce74477f9d7242d1509', '', 'Pending'),
(190, '0xd557753769ec8e9ef375b48c9037293b19c5c9de', '', 'Pending'),
(191, '0x5ca6d7b5dcbe8fd8c20eda52347514ce63ac47c3', '', 'Pending'),
(192, '0x25128d5574ed514cad91394bf08b3de96ede7575', '', 'Pending'),
(193, '0xe78ab7cb498be564a23a4caaa0bb1fca7c34bcfa', '', 'Pending'),
(194, '0x8f82d77c55e013b3aa5d4774841f302b3d92fae4', '', 'Pending'),
(195, '0x854ed01b4e83727aa85bec251b54278bdb4a60a1', '', 'Pending'),
(196, '0x43df2f0c928004afb1d29a36258f218796bfdbd2', '', 'Pending'),
(197, '0x8d294d053e341733556eaca86d82f33efa972084', '', 'Pending'),
(198, '0x140b96702f13ca6024a53b66cb05bf0aa96b0fb0', '', 'Pending'),
(199, '0x700af7b87fa248b17deb5071b41aa949b9197724', '', 'Pending'),
(200, '0x4293273bc0c3bcc5d1e0a20c2c8c01a1fc395587', '', 'Pending'),
(201, '0x697111812ffa20966c1ca2ffe1f71639e061f66d', '', 'Pending'),
(202, '0xac1f8a51076e192574957c1ee82a478e95015242', '', 'Pending'),
(203, '0xa77cef079806636796a5828894a0a1da6e90136f', '', 'Pending'),
(204, '0x7b21430befa31706e683ca8bdf9145d15eac31c8', '', 'Pending'),
(205, '0xe97fca87876607321796ca8b3516e1ff8eb75b12', '', 'Pending'),
(206, '0x9425385b51875d2aa650c0a8726525f690d25673', '', 'Pending'),
(207, '0x4436d6c2529c734baa961386d0debfd384e3678a', '', 'Pending'),
(208, '0x5b2b97a9166c124cabb10c16489eaf069b9fd561', '', 'Pending'),
(209, '0xa9f98d08f6dcdd1c64dc88777668dfc2778913e9', '', 'Pending'),
(210, '0x4b6380c8392ed9c4aaaef4d11040043489170c69', '', 'Pending'),
(211, '0x4f91d4dd3340b2e1064e4f0f38c0db1882588193', '', 'Pending'),
(212, '0xcdb2b8ac05b6a7d421950a84de1c1b9510755c30', '', 'Pending'),
(213, '0x1051f0bc8117b517fdecaf91063fb510300ed808', '', 'Pending'),
(214, '0xe37442ebd27def971159327b6d6e5c5adca3f11c', '', 'Pending'),
(215, '0xab2ea6a80948dff81e67773936643c91adae8542', '', 'Pending'),
(216, '0x57d3a1a45c28ba0d49c7804f5002644032e48fd4', '', 'Pending'),
(217, '0x8bed65421139e4e8a7c0eaca6076496078eb5991', '', 'Pending'),
(218, '0x4af967640453984f120052287bda32e906a12a6a', '', 'Pending'),
(219, '0x9566594167ea7336ba940f1345ed84f3ab683360', '', 'Pending'),
(220, '0xd4945c5aa2d0cda840bd141fb812d0eaadb8f126', '', 'Pending'),
(221, '0x6d516ad444f9c8d2fefd056f9fc9ed24ac641ec0', '', 'Pending'),
(222, '0xcf43d5c2caf1aefb956b5e56f0c499df71b25381', '', 'Pending'),
(223, '0xa2dbda6a1f1a9a7a068a3e1a3db165777d70e01a', '', 'Pending'),
(224, '0x5486a684d0a3208748981bbebd2b0acd5e9af9b9', '', 'Pending'),
(225, '0x0996d63f21f8ea927e89486057b71f2b48bc8517', '', 'Pending'),
(226, '0x8bba88d4dc9b0d4b4955ce14462923f22cb58d09', '', 'Pending'),
(227, '0x95230cbf06154e2e17d1d729eb8494787157b410', '', 'Pending'),
(228, '0x4c8febc310ec0d32fc2d82f97f2638771b738582', '', 'Pending'),
(229, '0x65ac6e738f1f2928efec64c0d432aced3e4c7502', '', 'Pending'),
(230, '0x28adbffe1e56d73a02bf5e77f7c9f71f63833980', '', 'Pending'),
(231, '0x92bc1905ba25abdc01e343f80ddbfa955ffb3b64', '', 'Pending'),
(232, '0x6737402dfe1e8ccbdfdda9d250df6c1f4698f9ea', '', 'Pending'),
(233, '0x99379b1d287b95ad44415fa6591a4b037c24b67c', '', 'Pending'),
(234, '0xc77bffc2d06dd3fe9b05c0ce3f02a2fd941810e3', '', 'Pending'),
(235, '0xa06198c1ea90ce402aec21aa51f572410438772e', '', 'Pending'),
(236, '0xcd7676739d5d85618c5a6e66fba4719d44330956', '', 'Pending'),
(237, '0x854d3faa4c28ffa4092621766f6e347342cce8e1', '', 'Pending'),
(238, '0x3dfdfb9a1d8e243aef859748124c5e7b5f158ad1', '', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tx_address` varchar(60) NOT NULL,
  `file` varchar(150) NOT NULL DEFAULT 'default.jpg',
  `gender` varchar(10) NOT NULL DEFAULT 'Male',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verified` varchar(20) NOT NULL DEFAULT 'Yes',
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL DEFAULT 'Not Defined',
  `activation_code` varchar(50) NOT NULL,
  `tutorial_taken` varchar(10) NOT NULL DEFAULT 'No',
  `balance` varchar(10) NOT NULL DEFAULT '0',
  `kyc_approved` varchar(20) NOT NULL DEFAULT 'Pending',
  `g_auth_key` varchar(50) NOT NULL DEFAULT '123456987',
  `carbon_credits` float NOT NULL DEFAULT '100',
  `energy_credits` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `tx_address`, `file`, `gender`, `date`, `verified`, `password`, `phone`, `activation_code`, `tutorial_taken`, `balance`, `kyc_approved`, `g_auth_key`, `carbon_credits`, `energy_credits`) VALUES
(184, 'Arpita Birla', 'arpita@khyalid.io', '0xa977de8de97d8336389c275da3ce906b079b3885', '1584680686download.jpg', 'Male', '2020-04-14 18:32:12', 'Yes', 'pass', '', '5e738c55f1b1a', 'Yes', '198.77', 'Approved', '1234', 70, 20),
(189, 'test', 'test@khalid.io', '0x00c4bc23481c04081170d91f902f732b687673b0', 'default.jpg', 'Male', '2020-04-15 09:36:18', 'Yes', 'password', 'Not Defined', '5e846a547a858', 'Yes', '579.44', 'Approved', '123456987', 29, 0);

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(11) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_name` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `withdraw_wallet_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`id`, `amount`, `user_id`, `date`, `user_name`, `status`, `withdraw_wallet_address`) VALUES
(27, '10', 189, '2020-04-14 18:42:17', 'test', 'Approved', '0x00c4bc23481c04081170d91f902f732b687673b0'),
(28, '10', 189, '2020-04-14 18:42:14', 'test', 'Approved', '0x00c4bc23481c04081170d91f902f732b687673b0'),
(29, '10', 189, '2020-04-15 09:37:08', 'test', 'Pending', '0x00c4bc23481c04081170d91f902f732b687673b0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator_super_user`
--
ALTER TABLE `administrator_super_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_token`
--
ALTER TABLE `buy_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carbon_credits`
--
ALTER TABLE `carbon_credits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `energy_credits`
--
ALTER TABLE `energy_credits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entrc_price`
--
ALTER TABLE `entrc_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyc`
--
ALTER TABLE `kyc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sell_requests`
--
ALTER TABLE `sell_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_carbon_credits_requests`
--
ALTER TABLE `send_carbon_credits_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_energy_credits_requests`
--
ALTER TABLE `send_energy_credits_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tx_addresses`
--
ALTER TABLE `tx_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator_super_user`
--
ALTER TABLE `administrator_super_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `buy_token`
--
ALTER TABLE `buy_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `carbon_credits`
--
ALTER TABLE `carbon_credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `energy_credits`
--
ALTER TABLE `energy_credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `entrc_price`
--
ALTER TABLE `entrc_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kyc`
--
ALTER TABLE `kyc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sell_requests`
--
ALTER TABLE `sell_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `send_carbon_credits_requests`
--
ALTER TABLE `send_carbon_credits_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT for table `send_energy_credits_requests`
--
ALTER TABLE `send_energy_credits_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tx_addresses`
--
ALTER TABLE `tx_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;
--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
