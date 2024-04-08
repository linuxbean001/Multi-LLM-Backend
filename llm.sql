-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2024 at 11:22 AM
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
-- Database: `llm`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `llm`
--

CREATE TABLE `llm` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `version_title` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2014_10_12_200000_add_two_factor_columns_to_users_table', 2),
(6, '2024_03_12_125715_create_sessions_table', 2),
(7, '2024_03_13_065239_add_facebook_id_column', 3),
(8, '2024_03_19_123814_create_llm_table', 4),
(9, '2024_03_19_130811_create_plan_table', 5),
(10, '2024_03_13_065239_add_extra_column', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(8, 'App\\Models\\User', 26, 'Personal Access Token', '796443cde1954ca4430fd338ef49c6c003eceb82e269598f3d3be38c18e096b8', '[\"*\"]', '2024-03-19 05:01:22', '2024-03-19 04:58:05', '2024-03-19 05:01:22'),
(9, 'App\\Models\\User', 29, 'Personal Access Token', 'fc9d5c8ede47972c5edd7a00dc7c1f1739e130c623d08b3ec5092914aa577904', '[\"*\"]', '2024-03-19 09:22:13', '2024-03-19 09:20:14', '2024-03-19 09:22:13'),
(10, 'App\\Models\\User', 29, 'Personal Access Token', 'daac3589d6a55852a5cd314a56a284da70a2aefc81e8888d5d3a978b0a67328a', '[\"*\"]', '2024-03-21 05:38:32', '2024-03-21 05:06:59', '2024-03-21 05:38:32'),
(11, 'App\\Models\\User', 29, 'Personal Access Token', '638a1e7da0ec059b915903a0912d483dfc37d49aa5c4dab18ba4b704e1d24dad', '[\"*\"]', NULL, '2024-03-21 05:37:36', '2024-03-21 05:37:36'),
(12, 'App\\Models\\User', 32, 'Personal Access Token', 'a3668c30588b630ba5c6aec190e0622fe68b86985dc4222dce2113f2c47e8b89', '[\"*\"]', NULL, '2024-04-05 05:35:25', '2024-04-05 05:35:25'),
(13, 'App\\Models\\User', 31, 'Personal Access Token', 'c8dc42a77c55e0e588bab137f08e9a7e15431513574adec59a05c7dedaf221f2', '[\"*\"]', NULL, '2024-04-05 06:21:16', '2024-04-05 06:21:16'),
(21, 'App\\Models\\User', 34, 'Personal Access Token', 'b687687394a64619143d2693dc974dec28ad943152cce934f9e71f8f77cd0e42', '[\"*\"]', NULL, '2024-04-08 01:49:51', '2024-04-08 01:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6HEVZynBcHGG5OliwAbAWLKkiRbivC3PgSxD1Mnz', 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRDVzbEJ6aVFoRmhhaDk3RDlNQ0R6bnpjc3ZLTmY1cVJCQkk4UnFvcyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjc7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkTGZQRVhIRWpJd1dGWVByNE5VZ1lFdUJTNXZkbVhaTlc0cXE2bEFDd2hZZlNVQS92YVVKOU8iO30=', 1710843919),
('8zl3p95ycokSa2DSqoWFcZohShmajTNXIKoUpg4S', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjNNaVlpQjVSSGZJeFZ6ak9qMmp1UUx4RTF0RWozY1hEZnZKSlBjciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1712314996);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT 2,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `profile_photo`, `role_id`, `email`, `email_verified_at`, `password`, `google_id`, `facebook_id`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Vishal', NULL, NULL, 2, 'vishal@gmail.com', NULL, '$2y$10$3G5fWP/pxfnURaUDqSYZG.UkBwjWAUQgoUCr5ZyE/4mGeR1Zwn.3u', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-12 07:44:15', '2024-03-12 07:44:15'),
(26, 'Suresh', NULL, NULL, 2, 'suresh@gmail.com', NULL, '$2y$10$BnpFPbjCh6iMdMc5qOVxU.D27bc9fm8rIAdAjy3i..SlxcNpU.icK', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-19 04:52:38', '2024-03-19 04:52:38'),
(27, 'Vishal Raghuwanshi', NULL, NULL, 2, 'vraghuwanshi68@gmail.com', NULL, '$2y$10$LfPEXHEjIwWFYPr4NUgYEuBS5vdmXZNW4qq6lACwhYfSUA/vaUJ9O', NULL, '7060106854088591', NULL, NULL, NULL, NULL, '2024-03-19 04:55:18', '2024-03-19 04:55:18'),
(29, 'Test', '21 march', NULL, 2, '1vishal@gmail.com', NULL, '$2y$10$bBxRPQ6v4XlGcIJ0tUX1NOpAUjUpo2iv5zh/iwUdoN1/blJ7DbAjy', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-19 09:07:08', '2024-03-21 05:26:09'),
(30, 'Test', '21 march', NULL, 2, '2vishal@gmail.com', NULL, '$2y$10$SYPEHS.oOi5GL4yHXWFyferuu1873vCElPY41nnXHXw2.owhnbOyK', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-21 05:23:20', '2024-03-21 05:29:35'),
(31, 'Test', '21 march', NULL, 2, 'ttt@gmail.com', NULL, '$2y$10$w1P5dSXEhW6I3IET.Zrj9OOXBoccrBEkZHTnXsnwPiFRI7l5hzWBa', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-21 05:23:59', '2024-03-21 05:23:59'),
(32, 'Ravi', 'Rathore', NULL, 2, 'ravirathore.linuxbean@gmail.com', NULL, '$2y$10$euCIHPXqlwPF2OoChziXrO129LeMHfvvSSFIWOD64GZF3SPg8alEm', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 05:34:13', '2024-04-05 05:34:13'),
(33, 'Ravi', 'Rathore', NULL, 2, 'aish123@gmail.com', NULL, '$2y$10$0qpvhP1T876nBiwfKwebmugqsEhpxmlEhvcvVdKFa9dC6gR6TDtk.', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 07:24:31', '2024-04-05 07:24:31'),
(34, 'Isha', 'Rajput', NULL, 2, 'ishaa@gmail.com', NULL, '$2y$10$aSVYxcIU5gzQgEiai29Y.eqe4qDs2NGvEU2mokJxM7ZxOnGSJmmTm', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 07:53:57', '2024-04-05 07:53:57'),
(35, 'Isha', 'Rajput', NULL, 2, 'ravirathsadasdore.linuxbean@gmail.com', NULL, '$2y$10$fX9JyZ5DEvPDlGhDSQAOm.eXEf1pmGQIBxJyHmfLP4eunL03I8lX.', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-08 01:30:14', '2024-04-08 01:30:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `llm`
--
ALTER TABLE `llm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `llm`
--
ALTER TABLE `llm`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
