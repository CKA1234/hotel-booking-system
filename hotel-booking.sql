-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2026 at 01:20 PM
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
-- Database: `hotel-booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `adminname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `adminname`, `email`, `mypassword`, `created_at`) VALUES
(1, 'admin.first@gmail', 'admin.first@gmail', '$2y$10$ovhIYNg/BAoIMOo0cQKzb.ZO3yMHQq6bnMkip12xYvlbKLClKo9d.', '2026-03-06 13:43:10'),
(2, 'admin.second@gmail', 'admin.second@gmail', '$2y$10$xhCV9JC1cm8LAO0urZO7WuSIzmC77uw309tMYJnAxJ0ICwXeQ4dEi', '2026-03-13 19:01:54');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `check_in` varchar(200) NOT NULL,
  `check_out` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` int(40) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `hotel_name` varchar(200) NOT NULL,
  `room_name` varchar(200) NOT NULL,
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'pending',
  `payment` varchar(50) DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `check_in`, `check_out`, `email`, `phone_number`, `full_name`, `hotel_name`, `room_name`, `user_id`, `created_at`, `status`, `payment`) VALUES
(3, '20260223', '2026-02-27', 'cyrilasumin@gmail.com', 544106400, 'Cyril Asumin', 'The Plaza Hotel', 'Standard Room', 3, '2026-02-22 14:05:34', 'pending', 'unpaid'),
(4, '20260223', '2026-02-27', 'cyrilasumin@gmail.com', 544106400, 'Cyril Asumin', 'The Plaza Hotel', 'Standard Room', 3, '2026-02-22 14:05:48', 'pending', 'unpaid'),
(5, '2026/02/23', '2026/02/27', 'cyrilasumin@gmail.com', 544106400, 'Cyril Asumin', 'The Plaza Hotel', 'Standard Room', 3, '2026-02-22 14:18:46', 'pending', 'unpaid'),
(6, '2026/02/24', '2026/02/28', 'cyrilasumin@gmail.com', 544106400, 'Cyril Asumin', 'The Plaza Hotel', 'Standard Room', 3, '2026-02-22 14:20:27', 'Done', 'unpaid');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` int(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `image`, `description`, `location`, `status`, `created_at`) VALUES
(1, 'Sheraton', 'services-1.jpg', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.', 'Cairo', 1, '2026-01-08 14:46:09'),
(2, 'The Plaza Hotel', 'image_4.jpg', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.', 'New York', 1, '2026-01-08 14:46:09'),
(3, 'The Ritz', 'image_4.jpg', 'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.', 'Paris', 1, '2026-01-08 14:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `num_persons` int(10) NOT NULL,
  `size` int(10) NOT NULL,
  `view` varchar(200) NOT NULL,
  `num_beds` int(10) NOT NULL,
  `hotel_id` int(10) NOT NULL,
  `hotel_name` varchar(200) NOT NULL,
  `status` int(5) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `image`, `price`, `num_persons`, `size`, `view`, `num_beds`, `hotel_id`, `hotel_name`, `status`, `created_at`) VALUES
(1, 'Suite Room', 'room-1.jpg', 200.00, 1, 50, 'Sea View', 2, 1, 'Sheraton', 1, '2026-01-09 14:05:27'),
(2, 'Standard Room', 'room-2.jpg', 100.00, 4, 60, 'Sea View', 2, 2, 'The Plaza Hotel', 1, '2026-01-09 14:05:27'),
(3, 'Family Room', 'room-3.jpg', 70.00, 5, 45, 'Sea View', 2, 3, 'The Ritz', 1, '2026-01-09 14:05:27'),
(4, 'Deluxe Room', 'room-4.jpg', 90.00, 5, 55, 'Sea View', 1, 1, 'Sheraton', 1, '2026-01-09 14:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `mypassword`, `created_at`) VALUES
(3, 'cyrilasumin', 'cyrilasumin@gmail.com', '$2y$10$ovhIYNg/BAoIMOo0cQKzb.ZO3yMHQq6bnMkip12xYvlbKLClKo9d.', '2026-01-05 14:58:27'),
(5, 'Samuel Grant ', 'samgrant@gmail.com', '$2y$10$r0QLfMT1ZHVEF7pYuwE3SOmqIB3RTdbrbbyO6bn.CE5/4vEb1olBG', '2026-02-16 13:14:47');

-- --------------------------------------------------------

--
-- Table structure for table `utilities`
--

CREATE TABLE `utilities` (
  `id` int(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `room_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilities`
--

INSERT INTO `utilities` (`id`, `name`, `icon`, `description`, `room_id`, `created_at`) VALUES
(1, 'Tea Coffee', 'flaticon-diet', 'A small river named Duden flows by their place and supplies it with the necessary', 1, '2026-02-09 18:26:26'),
(2, 'Hot Showers', 'flaticon-workout', 'A small river named Duden flows by their place and supplies it with the necessary', 2, '2026-02-09 18:26:26'),
(3, 'Laundry', 'flaticon-diet-1', 'A small river named Duden flows by their place and supplies it with the necessary', 3, '2026-02-09 18:26:26'),
(4, 'Air Conditioning', 'flaticon-first', 'A small river named Duden flows by their place and supplies it with the necessary', 1, '2026-02-09 18:26:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utilities`
--
ALTER TABLE `utilities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `utilities`
--
ALTER TABLE `utilities`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
