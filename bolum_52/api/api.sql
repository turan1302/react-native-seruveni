-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: db
-- Üretim Zamanı: 08 Eki 2024, 16:40:29
-- Sunucu sürümü: 8.3.0
-- PHP Sürümü: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `api`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QB0QlHzoa9YxCykM1MLlOGvNNaYZzF3U2l7ofRO5', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkNtVUJNWkxXUHdjYWd1dVczcDB0S255eUZRMU5vRmpoVnljY1NxQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728404327),
('uydCrLEuCG8LVvIlysJ7jK2IdM15qlJFxiChtwSQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTI1dGdLU09DN0VESkg0WTBNQWJEQlFvT0J1MHk3Q2l5UkhmUTB4eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728401617),
('VnaJuSkMGd4TyxUQaFXrac2Yx07lbM4WuYFzmMYF', NULL, '127.0.0.1', 'okhttp/4.9.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUFRVmNUc2RxaVQ5djRNa2VSRzJVOFREME1RSlJVdlBnaURRMmdjQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/cGFnZT0xMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728405510);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Jerad Smitham', 'ewisozk@example.org', NULL, '$2y$12$ZeixtDGXJYabQj3JPpn9d.FXie1tafWtXg0mKHg5GwX4XDDq0OHq2', NULL, '2024-10-08 15:29:25', '2024-10-08 15:29:25'),
(2, 'Helen Torp II', 'abshire.israel@example.com', NULL, '$2y$12$gCQljFyjPp4Bc7XkpRpjQObh5S4oemUFIu.PoTx5I3kwce.Zrj972', NULL, '2024-10-08 15:29:25', '2024-10-08 15:29:25'),
(3, 'Miss Kamille Mitchell', 'vwalsh@example.com', NULL, '$2y$12$fKT9wd7iH5brhdsoH0xTNuxO03eE7Vi7U2m7NzvNHOVK8U8ZM3u4S', NULL, '2024-10-08 15:29:26', '2024-10-08 15:29:26'),
(4, 'Josh Gerlach', 'paucek.ida@example.org', NULL, '$2y$12$Q/uKWOJSKS.tSlhs9lSefexD3mMOuPb.Kj1gi0Qp13nx420Y6Hfru', NULL, '2024-10-08 15:29:26', '2024-10-08 15:29:26'),
(5, 'Nathaniel Crist III', 'brannon00@example.com', NULL, '$2y$12$ahIdxMlp5IpBX5E6P7DyZO1/5w8DhnCnCdrn9hX5ZNKZ4SvqjJkYS', NULL, '2024-10-08 15:29:26', '2024-10-08 15:29:26'),
(6, 'Zoila Price', 'jerrold61@example.org', NULL, '$2y$12$vV7ygM/sckjruuHD/s88WuH36BmTqCGVzvkGvhhsaY4nelrhWCjgG', NULL, '2024-10-08 15:29:26', '2024-10-08 15:29:26'),
(7, 'Ms. Ludie Haley', 'dibbert.enos@example.org', NULL, '$2y$12$0itGtMchSxCsJgXYAqQZSeDEfktydt37Be5FTRXnjHWpPX/bqcAi6', NULL, '2024-10-08 15:29:27', '2024-10-08 15:29:27'),
(8, 'Damian Bahringer', 'gdamore@example.com', NULL, '$2y$12$t/CrlSYlBNaKbzlOTROF.OIMTHIPLQdjFgZG8Khr4vt07JX2BpD0y', NULL, '2024-10-08 15:29:27', '2024-10-08 15:29:27'),
(9, 'Ellis Lebsack DVM', 'udickinson@example.org', NULL, '$2y$12$PZ5c/CT6wLt3FoCB1SC3vuK6QTGNj45cATvWO5/8NoMnrKn5lO7NS', NULL, '2024-10-08 15:29:27', '2024-10-08 15:29:27'),
(10, 'Miss Jessyca Medhurst V', 'mohammad.hagenes@example.org', NULL, '$2y$12$0gE.8yaA1ZEesoH0RgS03ulTTvAn2FbKoYg9GiXF/abQWrucrOXUa', NULL, '2024-10-08 15:29:27', '2024-10-08 15:29:27'),
(11, 'Bernard Steuber', 'ulices.damore@example.net', NULL, '$2y$12$S90n/jNuC0L5gnGgHc4haeavxa8ljCQTHAtX.OEdElr6hdjcElk2W', NULL, '2024-10-08 15:29:28', '2024-10-08 15:29:28'),
(12, 'Omari Gleichner', 'ozella10@example.com', NULL, '$2y$12$h5AN2LI0izKY4RS9PeAroeBLT9qCRZI9Uiaj6.mRYsmwtz6a.nzFK', NULL, '2024-10-08 15:29:28', '2024-10-08 15:29:28'),
(13, 'Susanna Howe', 'consuelo33@example.org', NULL, '$2y$12$XRvND96fYQNYCQjb7nLsmeurceFh7y91Ip2mwNmGom2SCV3n0KAZy', NULL, '2024-10-08 15:29:28', '2024-10-08 15:29:28'),
(14, 'Jeffery Larson', 'barton96@example.com', NULL, '$2y$12$ot7zRHnqj4U6h8r7nJQliu1ohOKqkgSb16c1tldT0IzxZ1Q/MxU3i', NULL, '2024-10-08 15:29:28', '2024-10-08 15:29:28'),
(15, 'Prof. Yasmine Langworth MD', 'pwest@example.net', NULL, '$2y$12$KrqOZ6.y9gK4lPcyXTK36OrqsnOOCEAe1K7n1lRoUW4zSiT6qDkfG', NULL, '2024-10-08 15:29:29', '2024-10-08 15:29:29'),
(16, 'Layne Reinger', 'maeve01@example.com', NULL, '$2y$12$BzFqN/1K4sTM4PkEbrqOqenlqksLWO2QE6JaM.Yh8PYkT4CWYoxSe', NULL, '2024-10-08 15:29:29', '2024-10-08 15:29:29'),
(17, 'Dr. Terry Koepp', 'sigrid36@example.net', NULL, '$2y$12$1SNenljR1KWFa3oGC7T0COp6TIYAKApL0eEN4zxw0YaZIN.7wjS3m', NULL, '2024-10-08 15:29:29', '2024-10-08 15:29:29'),
(18, 'Mr. Vicente Marks', 'anita.tremblay@example.net', NULL, '$2y$12$mczCmHy0SjOvYfT9Psq48.awJuhMTusmJfI2K.oRgxgcoi8RFBldy', NULL, '2024-10-08 15:29:29', '2024-10-08 15:29:29'),
(19, 'Percival Senger', 'cassin.mariane@example.net', NULL, '$2y$12$8Hb7Xvq7y6YDSjQXOITu.ux7WO1pxRknxwW09Jh5vur2uGSVGw8Ze', NULL, '2024-10-08 15:29:29', '2024-10-08 15:29:29'),
(20, 'Raphaelle Schaefer', 'hessel.darwin@example.net', NULL, '$2y$12$XLa7u49tF7icc7EWfVbKyuMs6G1vpsXzEAfBGxAZnXQAx1eQIY7FK', NULL, '2024-10-08 15:29:30', '2024-10-08 15:29:30'),
(21, 'Vicente Satterfield', 'roberts.marquis@example.org', NULL, '$2y$12$TJt5wHKuHAQ0P4GaWChxIOsAYWy8GFDdpyZdfCLw21f8hxwTrS4j2', NULL, '2024-10-08 15:29:30', '2024-10-08 15:29:30'),
(22, 'Jaquelin Gerhold', 'cielo45@example.com', NULL, '$2y$12$jWeQ3phZnqiwSZuh6Gqf9eCTaMklutrJemBNQZBoMWrwQ01Rfmaia', NULL, '2024-10-08 15:29:30', '2024-10-08 15:29:30'),
(23, 'Dr. Elaina Rohan Jr.', 'elvie.nader@example.org', NULL, '$2y$12$y5iGduE/SrvX84IUn6i5VOpwXE5/Zd7eCNi9A3NDGYIH6zCSiwQHK', NULL, '2024-10-08 15:29:30', '2024-10-08 15:29:30'),
(24, 'Dr. Elyse Luettgen', 'vidal.turner@example.org', NULL, '$2y$12$M2WwxXTSZcLx3pdKs7Szbu/sQGcOotBzLluFpkrdQdYOHDcQYAPi.', NULL, '2024-10-08 15:29:31', '2024-10-08 15:29:31'),
(25, 'Prof. Edmond Russel II', 'dstanton@example.net', NULL, '$2y$12$JXxjlcWaLMLLsqCMgDvYkOf.JSbuM9Rglphb4O7jNj8kGVfDpCROS', NULL, '2024-10-08 15:29:31', '2024-10-08 15:29:31'),
(26, 'Neal Bechtelar V', 'josefa90@example.org', NULL, '$2y$12$8XTBKEIuV1CpKz4m8.E2fOtFIp5nbxiwBiw/7sDl.OkKBCnSO4epa', NULL, '2024-10-08 15:29:31', '2024-10-08 15:29:31'),
(27, 'Jaime Langworth', 'marshall52@example.net', NULL, '$2y$12$OSqVIoVwoVJY8v.OR5kJw.6Bl34tpeoRGRu2hD/KDbBuYyDMjjA8.', NULL, '2024-10-08 15:29:31', '2024-10-08 15:29:31'),
(28, 'Althea Prosacco', 'parisian.jules@example.com', NULL, '$2y$12$D2tuQlZTf7H/Aq698/6J2emkPT.CtqMVP98C.lSiR0eho6iOLN5iS', NULL, '2024-10-08 15:29:32', '2024-10-08 15:29:32'),
(29, 'Ariane Pollich', 'gusikowski.marina@example.org', NULL, '$2y$12$sHV.jrd6MwwTVCeGtjaP2Oe0yrEwLSlHK4NLgXLlHgJn/n1/twSSe', NULL, '2024-10-08 15:29:32', '2024-10-08 15:29:32'),
(30, 'Mrs. Odie Osinski DVM', 'jessy.jast@example.net', NULL, '$2y$12$H6CTbVMKUOcoEie5VxmT/uTml6odfQdN.gGa8t2TvuZEpnk03hGEC', NULL, '2024-10-08 15:29:32', '2024-10-08 15:29:32'),
(31, 'Taryn Rohan', 'hodkiewicz.dorris@example.net', NULL, '$2y$12$dZ/W.8GC4VJjCBEnT0ifaeNdVtzveNYB.DEn8p/0VWDc4IJHGvvYa', NULL, '2024-10-08 15:29:32', '2024-10-08 15:29:32'),
(32, 'Miss Skyla Glover', 'estell.vonrueden@example.net', NULL, '$2y$12$vTSW5btDzFb5mdj4ZnCwkOkwNq9cxXqvLXfvC.rgr7M4Drow1HqxK', NULL, '2024-10-08 15:29:33', '2024-10-08 15:29:33'),
(33, 'Natalie Ledner Jr.', 'keeling.vivian@example.net', NULL, '$2y$12$0Mcjbh7H37s9Aw/C598EUuy3mgYrathm69iuijj4/1eMz7u1gZh2G', NULL, '2024-10-08 15:29:33', '2024-10-08 15:29:33'),
(34, 'Prof. Florian Von', 'rkuhn@example.com', NULL, '$2y$12$jT65qwtVgdtihRqCyT/30u9CjEH9CNmDkO1vceto1SR3fzpXlQswy', NULL, '2024-10-08 15:29:33', '2024-10-08 15:29:33'),
(35, 'Chanelle Marquardt', 'marks.malvina@example.net', NULL, '$2y$12$Qj8OxMVM8OziCmkLK5TBM.EuxewR.BOwhIIZBUaxAJbMvYOdYMUtK', NULL, '2024-10-08 15:29:33', '2024-10-08 15:29:33'),
(36, 'Miss Alivia Tromp', 'kelvin76@example.org', NULL, '$2y$12$V.Cmp6916hcXx/YDFoM4Ne9JGqsI9iO3FGq6C4kxY0xzpMdM6hnAe', NULL, '2024-10-08 15:29:34', '2024-10-08 15:29:34'),
(37, 'Addison Quigley DVM', 'austyn66@example.org', NULL, '$2y$12$knGj8kffQFlzVFDlirkACuvBzP.mhbLfSCEQLdhVJfAqItxL8FX2i', NULL, '2024-10-08 15:29:34', '2024-10-08 15:29:34'),
(38, 'Mr. Manuela McCullough', 'iwiza@example.net', NULL, '$2y$12$qPkhLBJv8PCFmhR6Qx1NfOAVoASRy.fBU89./2gU10AgM/i8Vzun.', NULL, '2024-10-08 15:29:34', '2024-10-08 15:29:34'),
(39, 'Prof. Vito Collier', 'tyrique.satterfield@example.net', NULL, '$2y$12$wxI5ZUqtf5VyHXOWpRP4/uNQPy3Kmaxg6vK4hlWokoBXpfyoVzUSa', NULL, '2024-10-08 15:29:34', '2024-10-08 15:29:34'),
(40, 'Janiya Nikolaus MD', 'lboehm@example.net', NULL, '$2y$12$bzl8GrNJF94j7vKJRpeXouAlRukm2E4RwPQgeTmR0NdhbLALvceuG', NULL, '2024-10-08 15:29:35', '2024-10-08 15:29:35'),
(41, 'Miguel Ebert', 'jacinto13@example.com', NULL, '$2y$12$wqNcoLvAWY5qAsPLjDr/VOQp8eUIyRxYsGugcXuoQ3e1PDZU34uzS', NULL, '2024-10-08 15:29:35', '2024-10-08 15:29:35'),
(42, 'Prof. Geovany Kiehn V', 'njaskolski@example.org', NULL, '$2y$12$E7H2DdHt2oDeIaVzXYe2xus3r18L2Fos3Ra7QQw1t3Dt/drDk1KUC', NULL, '2024-10-08 15:29:35', '2024-10-08 15:29:35'),
(43, 'Denis Muller', 'nhyatt@example.org', NULL, '$2y$12$Q9Fq3BIPl5wyHb1tCT8OqeO.bcXOeCkVH1EOiw0ArntZjyLql9ISi', NULL, '2024-10-08 15:29:35', '2024-10-08 15:29:35'),
(44, 'Abdiel Hirthe II', 'darrin61@example.net', NULL, '$2y$12$283brZGHLt1RXCGR4vIbMe6AWCWyuUkQ2hE7wPeSrRljxzh9zc4Iu', NULL, '2024-10-08 15:29:36', '2024-10-08 15:29:36'),
(45, 'Elliot Rath', 'ferry.delphia@example.org', NULL, '$2y$12$aZEP8vDN3XaD851mpzDhBeKg1E1EF.edWRpsYzOpEYcdLcH.0qmSy', NULL, '2024-10-08 15:29:36', '2024-10-08 15:29:36'),
(46, 'Leatha Smith', 'ualtenwerth@example.org', NULL, '$2y$12$mWT5bMa0lVEfTg7kA5yEf.BRy88F8X.m1fZLgR.fRnXS6E1twWSOi', NULL, '2024-10-08 15:29:36', '2024-10-08 15:29:36'),
(47, 'Miss Katlynn Schmeler', 'ian95@example.org', NULL, '$2y$12$Gsugr08BX9JGn6EATCR2yOI5hEnk9UcfWYio6IiXlLIN65iyXBQby', NULL, '2024-10-08 15:29:36', '2024-10-08 15:29:36'),
(48, 'Shawna Wehner DVM', 'wfahey@example.net', NULL, '$2y$12$iip8HvAVDMjZF20THtmX1OE.xst3xfomy89Pg7n3M6XsTnh1PJJE.', NULL, '2024-10-08 15:29:37', '2024-10-08 15:29:37'),
(49, 'Mrs. Alysa McCullough V', 'elvera89@example.org', NULL, '$2y$12$jwWA1XlU13wL1kTvVvLdh.1Dfm5lA1rf1TaZ6s/7Rgu/8fxwT/pHO', NULL, '2024-10-08 15:29:37', '2024-10-08 15:29:37'),
(50, 'Mitchell Stiedemann', 'buckridge.declan@example.com', NULL, '$2y$12$z4Cs/0mnUw.Ek5bREyYx2esvbD6GqX.grTyrQRVXuByEj5HFVrgzy', NULL, '2024-10-08 15:29:37', '2024-10-08 15:29:37'),
(51, 'Loy Leffler', 'gerlach.carlie@example.org', NULL, '$2y$12$RjIIjJTuj9DqfuqCPEaDhuYLKFpM3Wkkn1mOoRNkjK3Pyv9TLE8xS', NULL, '2024-10-08 15:29:37', '2024-10-08 15:29:37'),
(52, 'Mekhi Rutherford', 'vfisher@example.org', NULL, '$2y$12$YuiKWxwl54vRQ186ZfEtG.k1fiBe1mWAF/47yxG7iqoaDl0F6biHe', NULL, '2024-10-08 15:29:38', '2024-10-08 15:29:38'),
(53, 'August Collier DDS', 'eda.shanahan@example.org', NULL, '$2y$12$cGLpcePcI3rHVeRRTIsec.qEM8UteiYZFfewx0LjSDAIlk7oiIlDi', NULL, '2024-10-08 15:29:38', '2024-10-08 15:29:38'),
(54, 'Prof. Jules Pacocha', 'damian.kertzmann@example.net', NULL, '$2y$12$/4GFZr7vhrqQjYmjetzsa.sqVECxDYJHlCQnA6vcU69pvHX5iVJsK', NULL, '2024-10-08 15:29:38', '2024-10-08 15:29:38'),
(55, 'Arturo Roob', 'murphy.judah@example.com', NULL, '$2y$12$QY2eb6ZXrOOz8dNc9r8TPuDl5OYLVEdvmQFTecng0Khm17PD5lReW', NULL, '2024-10-08 15:29:38', '2024-10-08 15:29:38'),
(56, 'Elvera Turner', 'letha.schowalter@example.org', NULL, '$2y$12$.vHHsu7qGiICeRhbLmJ4oOOIc15vH3oZ3i/I8eHkM.IN.FXABsxGq', NULL, '2024-10-08 15:29:39', '2024-10-08 15:29:39'),
(57, 'Lenny Upton', 'elnora.johns@example.com', NULL, '$2y$12$wZhWJ9r1BonDVJStnx//..DK5T0.dKWLwdk62yfKdR38pNIg0GGoG', NULL, '2024-10-08 15:29:39', '2024-10-08 15:29:39'),
(58, 'Santos Hessel', 'stiedemann.wilburn@example.com', NULL, '$2y$12$ij4/ELf2m4iAM4rqzQG78.S0M5ieNciuQr4gE9x4DtMK7Wb9mtWK2', NULL, '2024-10-08 15:29:39', '2024-10-08 15:29:39'),
(59, 'Amalia Balistreri', 'donavon.lesch@example.org', NULL, '$2y$12$6o7zYWuK00.S3k4wLtFYe.ESMQP3bi/ZAj8sswFsJrqVL8S6FIPFe', NULL, '2024-10-08 15:29:39', '2024-10-08 15:29:39'),
(60, 'Ms. Pamela Kerluke III', 'sipes.donald@example.org', NULL, '$2y$12$YCj2z4zcrnFiLixMwBZ/meAqflI1/azRLfYlKBdxDN/znqvAgvwfu', NULL, '2024-10-08 15:29:40', '2024-10-08 15:29:40'),
(61, 'Noah Padberg DDS', 'lonnie.dibbert@example.org', NULL, '$2y$12$tF.A.bJxFbBluXAjgiYWTOmexN0jhd2IEzWJyZPBkQ8X1DAKz54uO', NULL, '2024-10-08 15:29:40', '2024-10-08 15:29:40'),
(62, 'Mrs. Hertha Beahan', 'alda28@example.org', NULL, '$2y$12$jKCpICZ.KHH.9eJtHejsA.Y1fMw8iXqHiq7xSJwQU7gYsd5EU5J5q', NULL, '2024-10-08 15:29:40', '2024-10-08 15:29:40'),
(63, 'Prof. Geovanny Wuckert', 'feest.darwin@example.net', NULL, '$2y$12$MFNbtGV2mCeQOpQuJiP.mesGiajY3UaTwKOpWoK.9McRZWhp4BeWy', NULL, '2024-10-08 15:29:40', '2024-10-08 15:29:40'),
(64, 'Patrick Huel', 'pedro.douglas@example.net', NULL, '$2y$12$vRDqJcvL9CbFXl3htMe9/O77mvHNBQq92r5zTiiwNpDz4qDxUXCja', NULL, '2024-10-08 15:29:41', '2024-10-08 15:29:41'),
(65, 'Evalyn Kemmer II', 'ohayes@example.org', NULL, '$2y$12$wJAvekP/0Maz4Q8tXY4FueByCiKfjsFk5dzk7vzA8JATV.2g2S8Uq', NULL, '2024-10-08 15:29:41', '2024-10-08 15:29:41'),
(66, 'Linnie Rolfson', 'tmann@example.com', NULL, '$2y$12$/qeuWQpCGRS72HluzFJQsuzGquNfe1r938Azh6f2aFONCRPF7wMAa', NULL, '2024-10-08 15:29:41', '2024-10-08 15:29:41'),
(67, 'Ms. Kailee Kerluke PhD', 'rodrick91@example.org', NULL, '$2y$12$xitr4tsmALaaQ1WjQGs3I.D.o7xAHPPVn6n96EMa.l5AmtDqHFbfu', NULL, '2024-10-08 15:29:41', '2024-10-08 15:29:41'),
(68, 'Mitchell Weimann', 'eloy.zboncak@example.com', NULL, '$2y$12$BhUCVicTtLli3q4CLszROOlyssx8T3rk390l49OMQCtwzcFOxf15O', NULL, '2024-10-08 15:29:42', '2024-10-08 15:29:42'),
(69, 'Dr. Andy Ferry', 'allan34@example.com', NULL, '$2y$12$NOU11HVg8oANgDDn5YoyvOzi/C5xDAOnVqx0tWGp2Sagg3KbURbpy', NULL, '2024-10-08 15:29:42', '2024-10-08 15:29:42'),
(70, 'Ardith Stark', 'streich.kaelyn@example.net', NULL, '$2y$12$yEmNivh4dObED5w1Rj5jNeng2WOba665ZhTybtsYAPTNSJZvQ65ju', NULL, '2024-10-08 15:29:42', '2024-10-08 15:29:42'),
(71, 'Dr. Verla Heller DVM', 'jamel19@example.net', NULL, '$2y$12$/zghV9U/N2GkVQhI6xvmyu/d3hwyQwVi.tIwQW6ududWg3kzcNdk.', NULL, '2024-10-08 15:29:42', '2024-10-08 15:29:42'),
(72, 'Kendrick Zieme IV', 'mstanton@example.com', NULL, '$2y$12$m5N2QEQE6ljG7mvV2imj4OdIHS5Da29gKJCRrTCKHxe/haFSqC.8S', NULL, '2024-10-08 15:29:43', '2024-10-08 15:29:43'),
(73, 'Dr. Hilton Kassulke III', 'porter.hessel@example.net', NULL, '$2y$12$xKa7wsBGACuK0w02PJsg0.VfDBVKlR5MWhbpVfxeIppPeGCRjEyKy', NULL, '2024-10-08 15:29:43', '2024-10-08 15:29:43'),
(74, 'Johnny Zulauf', 'margie.bartoletti@example.org', NULL, '$2y$12$jm56mYZoRvOynKM3oOhU8u3tXoY5on42wVFNNOci7ERpR0IHE52om', NULL, '2024-10-08 15:29:43', '2024-10-08 15:29:43'),
(75, 'Manuel Carroll', 'una.flatley@example.net', NULL, '$2y$12$IJtOC/sbW82tzBEG3LZS9e47MjhtxCWte6NHuxFhyAFwV92owatAy', NULL, '2024-10-08 15:29:43', '2024-10-08 15:29:43'),
(76, 'Maida Beahan I', 'frami.elena@example.com', NULL, '$2y$12$SsKQgzcx1QHV22pFEXX2W.EgxyikuHOKRpMlNzLlC6O3KdMRxGOrK', NULL, '2024-10-08 15:29:44', '2024-10-08 15:29:44'),
(77, 'Clementina Emard', 'zoey.buckridge@example.com', NULL, '$2y$12$zBecm4gJ8PqIMmYbYHWHu..MZ2dwvo0WTTAARP9jiLX0MqL00er/G', NULL, '2024-10-08 15:29:44', '2024-10-08 15:29:44'),
(78, 'Orville Bailey', 'sydney.mosciski@example.com', NULL, '$2y$12$emI8HFnlwQkXYI/Tlh5PluZjVHkk6Mcpd7iE28ffbriYk3zP.Jumq', NULL, '2024-10-08 15:29:44', '2024-10-08 15:29:44'),
(79, 'Dorcas Kris PhD', 'yschmitt@example.net', NULL, '$2y$12$NkK7vOg5XP.hxbOiICemteIca/xCR8No5eEP5qSu97H8s5mwlfMe.', NULL, '2024-10-08 15:29:44', '2024-10-08 15:29:44'),
(80, 'Pascale Aufderhar', 'zbaumbach@example.com', NULL, '$2y$12$g5LFvbc/qXUKDCPG8IIaHegkCbVd9H3of0q4NqSvAToDLmt7MGqwC', NULL, '2024-10-08 15:29:45', '2024-10-08 15:29:45'),
(81, 'Madonna Herzog', 'haley.marvin@example.com', NULL, '$2y$12$8jhmSxSKjgK489tjdnQ0cOqVsn6ekzpY796B.GvX/toSmpei4feHi', NULL, '2024-10-08 15:29:45', '2024-10-08 15:29:45'),
(82, 'Miss Casandra Hand', 'estella.white@example.net', NULL, '$2y$12$Ua7BZ9o/77286OP2b/tKle3FYT/ud6goJvZ.ejgAgNoSKrQkiP.iy', NULL, '2024-10-08 15:29:45', '2024-10-08 15:29:45'),
(83, 'Dr. Arnaldo Lockman III', 'duncan.sporer@example.org', NULL, '$2y$12$2Q9nahA.SVy.tXBz3YzxtOEsaivib/1maG2byci63XchPYGoubwlW', NULL, '2024-10-08 15:29:45', '2024-10-08 15:29:45'),
(84, 'Mr. Gerard Rice Sr.', 'ettie27@example.org', NULL, '$2y$12$Tcc4v/TVLjl1YR1WPJCCfuqo5mpxSc5NaW6ocFjGnwmv9oHn985jq', NULL, '2024-10-08 15:29:46', '2024-10-08 15:29:46'),
(85, 'Cyrus Stamm', 'icarter@example.org', NULL, '$2y$12$5Pq3ZS5NhPA8Lpq.Cg96IuSV/7ex3SDIrWMqshbkxt2MpfrnQVLQ6', NULL, '2024-10-08 15:29:46', '2024-10-08 15:29:46'),
(86, 'George Jones', 'dusty.jakubowski@example.org', NULL, '$2y$12$huWz1HYmGqZ.Nr7TxRCbR.IpwwQLEcxAirivAy.ZZzTdYrH8FydsW', NULL, '2024-10-08 15:29:46', '2024-10-08 15:29:46'),
(87, 'Issac Littel', 'klein.katarina@example.org', NULL, '$2y$12$bQ8JUuh2vRqO77SI0xjgQe9362ADxhmhaoKlhKOdQoBBNsruLBaPe', NULL, '2024-10-08 15:29:46', '2024-10-08 15:29:46'),
(88, 'Mr. Sterling Satterfield Jr.', 'lavina86@example.org', NULL, '$2y$12$iigi3UKDalk5I/dLLiEh7eDa9/FVCfc8cWnWVnp3SCEplhU6z7nbe', NULL, '2024-10-08 15:29:47', '2024-10-08 15:29:47'),
(89, 'Augusta Herzog', 'jamil.pagac@example.org', NULL, '$2y$12$javfCV9C/Aygb.rXPhABjOP.mUzaDKWCgtBCZmkkMtk/doldfxHCG', NULL, '2024-10-08 15:29:47', '2024-10-08 15:29:47'),
(90, 'Asha Hermiston', 'labadie.abbigail@example.com', NULL, '$2y$12$Yoo6iuLqyonEzTJeTCr4KuYBzSTNrABAnlLaaAmCzVfeJA82f8BH.', NULL, '2024-10-08 15:29:47', '2024-10-08 15:29:47'),
(91, 'Rashawn Champlin', 'hermina96@example.com', NULL, '$2y$12$L2pGDIUgGRgy7kxBCtLRQ.cEvVtmHBB/5388ENf5t3E7vJ0IpMtGS', NULL, '2024-10-08 15:29:48', '2024-10-08 15:29:48'),
(92, 'Prof. Viviane Weimann V', 'oturcotte@example.net', NULL, '$2y$12$ymzvFKgxnbje5MtLhOnac.i/k4PGh/B63Et0.k2RBh0u1m7zDTy2.', NULL, '2024-10-08 15:29:48', '2024-10-08 15:29:48'),
(93, 'Lew Gutkowski', 'leda43@example.org', NULL, '$2y$12$oHfLIAv8iLZFHCNlILwR5OFb/HO6H80XKmdXf7LBsebM762L.imIu', NULL, '2024-10-08 15:29:48', '2024-10-08 15:29:48'),
(94, 'Kimberly Mohr', 'billie45@example.net', NULL, '$2y$12$AxfCD4MG6Xlj23o12Y22muzl0OswJduxpaVWYSIFXSDgkpYqGBwHC', NULL, '2024-10-08 15:29:48', '2024-10-08 15:29:48'),
(95, 'Alena Volkman', 'ushanahan@example.net', NULL, '$2y$12$.gPMsZk5Taz4kP1v86hfQecJShuE43A8D9NKFsgsPE94k7.LNatNa', NULL, '2024-10-08 15:29:49', '2024-10-08 15:29:49'),
(96, 'Sally Kiehn', 'beryl63@example.net', NULL, '$2y$12$gsVQu/.zbyghwT07QLi9sOWLGeiGUmjrBL0iUfBz0AuFT/sRGmbZ2', NULL, '2024-10-08 15:29:49', '2024-10-08 15:29:49'),
(97, 'Arturo Beatty DDS', 'rohan.mohammed@example.org', NULL, '$2y$12$kT3FThN8uV9Sq9DkwDoGquTTRtXKjdeMWymN6lBdqpL9CcWRQPmM2', NULL, '2024-10-08 15:29:49', '2024-10-08 15:29:49'),
(98, 'Ivory Ledner', 'kihn.eula@example.net', NULL, '$2y$12$A/9FCH4S.O0lavTjWsB8GebNs8XMYT0mkx6DORtXKnZ.SD96wXoU6', NULL, '2024-10-08 15:29:49', '2024-10-08 15:29:49'),
(99, 'Efren Bartell IV', 'marlon.davis@example.net', NULL, '$2y$12$eWBNarRII1eSm1405kHMXe5xOc1RMnITGsR/sfZJEsFHBx00b3SNG', NULL, '2024-10-08 15:29:50', '2024-10-08 15:29:50'),
(100, 'Milo Roberts', 'bertram.stark@example.org', NULL, '$2y$12$Th6yBBrYrfI.OdVP8ew/0exkIO1yJTK3oLBalc7Xdm4xo7D0HRE7G', NULL, '2024-10-08 15:29:50', '2024-10-08 15:29:50'),
(101, 'Mr. Dejon Cummings IV', 'osinski.lavonne@example.net', NULL, '$2y$12$9rtdjZNIkcvkTgquMjRKsOCeudcqO5XxP.2EM5MGudkRY900QuLVa', NULL, '2024-10-08 15:29:50', '2024-10-08 15:29:50'),
(102, 'Keely Dicki III', 'aokuneva@example.net', NULL, '$2y$12$1bZyPwlhEVXb1gUZkDsI/uLEk3M9Nob/rjqC.SAtTyNN7zTQ0WZTG', NULL, '2024-10-08 15:29:50', '2024-10-08 15:29:50'),
(103, 'Devante Kemmer', 'gsteuber@example.org', NULL, '$2y$12$oO4yHkzv/WdNXAnHM2GHguwTSlLamsj8.E/1totkVs8a0qYIKPMGi', NULL, '2024-10-08 15:29:51', '2024-10-08 15:29:51'),
(104, 'Prof. Pearline Wolff II', 'stephany46@example.com', NULL, '$2y$12$8nhKwOMGqgcgGnJcri1Sfe2YJ4SYLu4FvO7Hvfkbaq3YqlYoxIVbK', NULL, '2024-10-08 15:29:51', '2024-10-08 15:29:51'),
(105, 'Gussie Buckridge', 'ydaniel@example.com', NULL, '$2y$12$5jK31VC1m4bPEUumiJTRIuVE5IfsLXxWHNQpEb5w9s08pXL9HVZ4i', NULL, '2024-10-08 15:29:51', '2024-10-08 15:29:51'),
(106, 'Dr. Matilde Kuhic MD', 'aheller@example.net', NULL, '$2y$12$8YEMwSmWsZbojp2yjqbBculvY/K7vjLyOwXeCHb22SD8V4xHE7Jzm', NULL, '2024-10-08 15:29:51', '2024-10-08 15:29:51'),
(107, 'Susanna Torphy', 'towne.daphney@example.org', NULL, '$2y$12$wCuTJvxwE3JsUTjnSeK0WOho63P0lCB7kyMv1aoq36t6dN2o9sWl.', NULL, '2024-10-08 15:29:52', '2024-10-08 15:29:52'),
(108, 'Angelo Harvey', 'carroll.jerad@example.com', NULL, '$2y$12$dSFU3tG9sGPAlrSGlB5.6ue62n/b.tspbaeqKGfV/iR3Dqw1MdpfW', NULL, '2024-10-08 15:29:52', '2024-10-08 15:29:52'),
(109, 'Prof. Dedrick Ortiz V', 'abbott.alverta@example.org', NULL, '$2y$12$kPVywYg6HWoEqYMsVThsweJBQLonhHE9vpDV5ATbiBAbsfwkeVNY.', NULL, '2024-10-08 15:29:52', '2024-10-08 15:29:52'),
(110, 'Dannie Sanford', 'greenfelder.mikayla@example.net', NULL, '$2y$12$zmp7QDEPh7sgAe7PjIp6PupAUUlzUI/vKHHYI6VJHgwTnNUlPGTcK', NULL, '2024-10-08 15:29:52', '2024-10-08 15:29:52'),
(111, 'Cassidy Ratke V', 'balistreri.gladys@example.net', NULL, '$2y$12$E35oG6UACTFYuDBspv7xI.svee1v52Fli7bweHMhIBGGGqfP33QG2', NULL, '2024-10-08 15:29:53', '2024-10-08 15:29:53'),
(112, 'Nora Wuckert', 'annabel64@example.net', NULL, '$2y$12$njg3ePAFwLP09z263OE91eXWouuzEjiYtjrCkenWsITnyZPFqSuv2', NULL, '2024-10-08 15:29:53', '2024-10-08 15:29:53'),
(113, 'Miss Dena Streich', 'marks.ian@example.net', NULL, '$2y$12$oijsTw63KDUZ.SqzRP9ZaeKK5OvQfWGcdgJueeIugOj4uPfPqHWxG', NULL, '2024-10-08 15:29:53', '2024-10-08 15:29:53'),
(114, 'Beau Marks', 'lester.romaguera@example.net', NULL, '$2y$12$dQ0wnzWueBC.aIRCxNGmxu4T1Ts6sIBOjoAvQwiBBbi7iFsHX4Oce', NULL, '2024-10-08 15:29:53', '2024-10-08 15:29:53'),
(115, 'Lolita Howell', 'eddie.ziemann@example.net', NULL, '$2y$12$pip6SooLUiXoYFKBh6yzdeoYPBSgk86V85CgW86Qq9vXpo0r0.1VW', NULL, '2024-10-08 15:29:54', '2024-10-08 15:29:54'),
(116, 'Eileen Jones Jr.', 'schultz.rae@example.com', NULL, '$2y$12$z.qKlE0yudhmay5PYPsF6uWHWWJpE8Co5/pI9ZF7.wwvTFQJTF/va', NULL, '2024-10-08 15:29:54', '2024-10-08 15:29:54'),
(117, 'Darrell Emard', 'von.jessica@example.org', NULL, '$2y$12$S2mmnoJAVZpmIk35foDNtOTxpz32wKF2dPMsJVMHGDqyQZ9/cgP3y', NULL, '2024-10-08 15:29:54', '2024-10-08 15:29:54'),
(118, 'Haley Franecki', 'imani.yost@example.org', NULL, '$2y$12$nHBXQyFyDOh2Gs88L0Y.4urx5D3GlhXeC/IZ/hCGi/BHGHNbT/nsy', NULL, '2024-10-08 15:29:54', '2024-10-08 15:29:54'),
(119, 'Phyllis Jaskolski', 'jacobson.tressa@example.org', NULL, '$2y$12$oPCxpCwvd4Ngmke6FzJ./ObIFGIOpc4vw4Zn6PVQS181KgP7A3cW6', NULL, '2024-10-08 15:30:37', '2024-10-08 15:30:37'),
(120, 'Silas Kovacek II', 'simonis.nick@example.com', NULL, '$2y$12$akJtuXJzIIwHgFkFq3Uwg..Qtt.gOJAkaHuxnWh9xksAdYtaV4mj.', NULL, '2024-10-08 15:30:37', '2024-10-08 15:30:37'),
(121, 'Melody Nicolas', 'lindsay.kerluke@example.com', NULL, '$2y$12$c31qTib/o2W65vcL0ZKRuuDt86fCQSZtw0J9WqqEtK3Xp5gY0h39y', NULL, '2024-10-08 15:30:37', '2024-10-08 15:30:37'),
(122, 'Dr. Ahmed Romaguera', 'hadley.schuster@example.com', NULL, '$2y$12$DcDe1EHWKGXGaZoHRERfiO95XKdWQmVSwcTsoNkJuYl.SSzLZj9DK', NULL, '2024-10-08 15:30:38', '2024-10-08 15:30:38'),
(123, 'Hilton Mitchell', 'steuber.beverly@example.com', NULL, '$2y$12$msGgbpMZLX6/r33FX/CSrefuVkRWIuNemlGWb315AuUzDX.5uTxxS', NULL, '2024-10-08 15:30:38', '2024-10-08 15:30:38'),
(124, 'Mauricio Predovic', 'wilhelm.ernser@example.org', NULL, '$2y$12$5LAS5G5dAc9atpGGoN/Kzup9IVxtPGWvzhZjHFv/dM8Z/WMwgFdf.', NULL, '2024-10-08 15:30:38', '2024-10-08 15:30:38'),
(125, 'Rae Heidenreich', 'fkunze@example.net', NULL, '$2y$12$fdx2bIJir/.hWYmJdX5F1.SO8ZCpGTfXLhJsKjIAfpWia622USMve', NULL, '2024-10-08 15:30:38', '2024-10-08 15:30:38'),
(126, 'Makenna Smith', 'adella31@example.org', NULL, '$2y$12$4n/cojrDgRTtHdIAbTZhH.ocR78cnmI2wfKkH34JKB0S.eQtFnrcO', NULL, '2024-10-08 15:30:39', '2024-10-08 15:30:39'),
(127, 'Tomas Homenick', 'ethan12@example.com', NULL, '$2y$12$hXdHoiBVJqxlRiXEZ8sjyuGpRT.0Hv/p9jDvfhJpG420a47A6B7z.', NULL, '2024-10-08 15:30:39', '2024-10-08 15:30:39'),
(128, 'Giles Hoppe', 'agibson@example.org', NULL, '$2y$12$JHlbJtve0OkZVcdMY.KiDeoul/TtFnLnwlhC2.YPYneFaJ0vou7DK', NULL, '2024-10-08 15:30:39', '2024-10-08 15:30:39'),
(129, 'Mrs. Kirsten Heidenreich MD', 'runte.gwen@example.com', NULL, '$2y$12$MM04PYCdeiejewBTpTXMZOfImqm72sGG.mrVY6OdgN4V13p2BvApm', NULL, '2024-10-08 15:30:39', '2024-10-08 15:30:39'),
(130, 'Eugenia Adams', 'paucek.fatima@example.com', NULL, '$2y$12$8AXc9GSDmY61eKn.WB3/EefUX4dw7HwjUkKnjqzQyI2KA7/4jlzSm', NULL, '2024-10-08 15:30:40', '2024-10-08 15:30:40'),
(131, 'Holly Kshlerin', 'veum.earline@example.net', NULL, '$2y$12$kvt/s8J9HYygQZkYk3Umk.88Y0WBw90EzhHphe25brcgxEO/5xg6C', NULL, '2024-10-08 15:30:40', '2024-10-08 15:30:40'),
(132, 'Adrain Nikolaus', 'mking@example.net', NULL, '$2y$12$WBcnLl5cGMzUA.KngJht5egDkQHYH3JrVNBC2qdEp6B2hZ.tIKgna', NULL, '2024-10-08 15:30:40', '2024-10-08 15:30:40'),
(133, 'Meaghan Dickens', 'donna.mann@example.net', NULL, '$2y$12$DAYVbJoYXw9RHY/FaAspeu2DyRlR43KpgImxR1uKK/2D7dJkXbzSO', NULL, '2024-10-08 15:30:40', '2024-10-08 15:30:40'),
(134, 'Jonas Braun', 'moshe.goyette@example.com', NULL, '$2y$12$.DUN9FkyBktj/zCsPiKsLOdR/3Z9nh9FxXEZ4Yuh0Gqms11SKeFui', NULL, '2024-10-08 15:30:41', '2024-10-08 15:30:41'),
(135, 'Dr. Sister Schaden', 'senger.jaclyn@example.org', NULL, '$2y$12$/rMAOgf0F.95xkjzAtFkYO1F.weetVFVGX2BHKLI4VVmLgXDlyC22', NULL, '2024-10-08 15:30:41', '2024-10-08 15:30:41'),
(136, 'Dr. Lionel Kris II', 'bert48@example.com', NULL, '$2y$12$WVoPVBIFTC3a7a.eNdDT2uWKCdelacZXSihZnpvl.LBpleVnaVmfa', NULL, '2024-10-08 15:30:41', '2024-10-08 15:30:41'),
(137, 'Jadon Weber', 'raina.lemke@example.org', NULL, '$2y$12$GFKKfahThlxAbv3GZ/enUujGANQ6.3TuLN7LflpzbWpi7f/EAim.e', NULL, '2024-10-08 15:30:41', '2024-10-08 15:30:41'),
(138, 'Olen Jerde', 'eldon29@example.org', NULL, '$2y$12$0hXstGY3aSM2sfU5cJak4ejF.1AXXo05Jy4VqMeHUoj8/cIvoAKDO', NULL, '2024-10-08 15:30:42', '2024-10-08 15:30:42'),
(139, 'Carolina Nitzsche', 'jaeden36@example.org', NULL, '$2y$12$korlYgubuUd25avf7k6Mquy4R0ss3dXrt1wb7OiVxKligF29.P16S', NULL, '2024-10-08 15:30:42', '2024-10-08 15:30:42'),
(140, 'Shanie Mitchell', 'jena51@example.com', NULL, '$2y$12$HwQYykQXDpEjaWBk9OCKuORg2R6MIPr6LvEaF7XgP0TQ5nIal.ehi', NULL, '2024-10-08 15:30:42', '2024-10-08 15:30:42'),
(141, 'Prof. Noel Rolfson', 'dach.alejandrin@example.net', NULL, '$2y$12$2kWSzPGYd4GD7kMx68x2zu2oPbL/z6qsKZM84PPLo8951OF7//qZq', NULL, '2024-10-08 15:30:42', '2024-10-08 15:30:42'),
(142, 'Rachel Considine', 'nheidenreich@example.net', NULL, '$2y$12$o4z0blVcXIzsX.qH/2zX1O247lRAs81VZW4y36YTCKFNamkPHeQaK', NULL, '2024-10-08 15:30:43', '2024-10-08 15:30:43'),
(143, 'Mrs. Aliyah Willms V', 'jkuvalis@example.org', NULL, '$2y$12$J.NUDa4T0M2qg8Ac31WVEuW4HrFOQZzn2Gk/EVlG7SfYbMTMMNT/e', NULL, '2024-10-08 15:30:43', '2024-10-08 15:30:43'),
(144, 'Dr. Alverta Bradtke', 'oral08@example.com', NULL, '$2y$12$eu2IJMOB/lLbUfzpPkZFIOq7gbhs/wtFdeb.8PJI3TE8rSgMRcMtu', NULL, '2024-10-08 15:30:43', '2024-10-08 15:30:43'),
(145, 'Ismael Mills IV', 'ian98@example.net', NULL, '$2y$12$aeFFdWD2Dmu6VtHQ.2EUEOxGD.hSq.SOMxbyZSoji9mkJbUuepm7.', NULL, '2024-10-08 15:30:43', '2024-10-08 15:30:43'),
(146, 'Mrs. Kaylin Pfeffer', 'nasir.beer@example.net', NULL, '$2y$12$NqUQQdjooFpq/5.CLPTkGecj56H1BEP.2rchvAx7N6SDnXEYg6MYK', NULL, '2024-10-08 15:30:44', '2024-10-08 15:30:44'),
(147, 'Mrs. Lacey Murazik DVM', 'xgutmann@example.org', NULL, '$2y$12$v7NBPr7SxiVF1sp5ZsuxyO9s4Bmzfvxrb.wC7qzBbuKuTA/Uh0fD.', NULL, '2024-10-08 15:30:44', '2024-10-08 15:30:44'),
(148, 'Jarod Spinka', 'marianna62@example.com', NULL, '$2y$12$rP6yC/A8JC8/d1BJdi/zP.MAczGlc0ZY8igzfhEXByHmr60v2AFBq', NULL, '2024-10-08 15:30:44', '2024-10-08 15:30:44'),
(149, 'Dameon Gottlieb', 'ischuppe@example.org', NULL, '$2y$12$WvViEwYiU6ok7TZ1vueDiuimM6HZgoC3o4mkBTf4O6BwWhLqTo2FS', NULL, '2024-10-08 15:30:44', '2024-10-08 15:30:44'),
(150, 'Prof. Aric Murazik', 'vbrakus@example.org', NULL, '$2y$12$TZjaoK/oNxUHlR2LGbM3yep0dZ.odons8LIsqGnoBmJ4Irgmcvyo.', NULL, '2024-10-08 15:30:45', '2024-10-08 15:30:45'),
(151, 'Prof. Jarrett Hickle MD', 'gklocko@example.net', NULL, '$2y$12$q2huT8VwXpHRHP6BGG9LP.eH6bLBTxisPhB/yuWqKk83Ug7MTZN3G', NULL, '2024-10-08 15:30:45', '2024-10-08 15:30:45'),
(152, 'Miller Wisoky', 'bstreich@example.net', NULL, '$2y$12$XjE6Z1rr7.zFDA6Ucp8QwOrVb9XbwYJSt.vOROR4teHOOywEPTzbm', NULL, '2024-10-08 15:30:45', '2024-10-08 15:30:45'),
(153, 'Prof. Pedro Erdman', 'antonette69@example.net', NULL, '$2y$12$.JxIfrN0PL9MeUYawkAMy.83iJqhZ4bj8t6dECS8b7kRKjg1qGvZK', NULL, '2024-10-08 15:30:45', '2024-10-08 15:30:45'),
(154, 'Mrs. Krystel Hamill', 'ova.bailey@example.org', NULL, '$2y$12$bC0cYF3QUZHdujHnYXWmc.UcGNc/yroa0OvlJSYEgZUn7fA3JUf8C', NULL, '2024-10-08 15:30:46', '2024-10-08 15:30:46'),
(155, 'Mrs. Alexa Pacocha', 'erick03@example.net', NULL, '$2y$12$3YQ8EDFirEUsxMxW9oBXb.klEXjJB9b5x/WiyEUhI1KPDBuEYQb4i', NULL, '2024-10-08 15:30:46', '2024-10-08 15:30:46'),
(156, 'Rashawn Huel I', 'adalberto32@example.net', NULL, '$2y$12$jrLZ39st4Q3gtZdMdc6uMuSqVllezR//VAur3/DoX50PDAoImY8.y', NULL, '2024-10-08 15:30:46', '2024-10-08 15:30:46'),
(157, 'Ally Boehm', 'bborer@example.net', NULL, '$2y$12$eIPpRB/7/HVVruASpF3.KeMuFwAuyliv0gLLU0rp.xDt8HC3uPb8S', NULL, '2024-10-08 15:30:47', '2024-10-08 15:30:47'),
(158, 'Tierra Bechtelar', 'amani91@example.net', NULL, '$2y$12$a4nGYzaG0a4aeFvAAFy32OJ7PZ7LJ/qfTrhIQDFW/9aDh8/bvRmA2', NULL, '2024-10-08 15:30:47', '2024-10-08 15:30:47'),
(159, 'Prof. Estevan Lind PhD', 'skyla.little@example.com', NULL, '$2y$12$TywQqUNMh7gtZn7MQaEv1.Ywqa4U.TKXNVOaceBolI2/q/z4TwzYC', NULL, '2024-10-08 15:30:47', '2024-10-08 15:30:47'),
(160, 'Fiona Stroman', 'viva.huel@example.org', NULL, '$2y$12$mFWunmfVLwNeF4xs39XcGOJ5Nk71Xl6iKa07qbxlUme5BqDAd3.TS', NULL, '2024-10-08 15:30:47', '2024-10-08 15:30:47'),
(161, 'Prof. Delfina Cremin', 'ytorphy@example.com', NULL, '$2y$12$6nCZfu70nzufclry2jRwluGVhZ9IsQDOpeXtv02Rn6FyFalsjZyhK', NULL, '2024-10-08 15:30:48', '2024-10-08 15:30:48'),
(162, 'Norma Rau', 'volkman.ellsworth@example.net', NULL, '$2y$12$cxtGwIo6gvHzI7ez24iLiuhoW5cDhVT4Pgu/LEVRyL87YwmDfXj6e', NULL, '2024-10-08 15:30:48', '2024-10-08 15:30:48'),
(163, 'Abner Veum II', 'champlin.tessie@example.net', NULL, '$2y$12$qX4A/ap/ed4.CAEfb.OGJ.KY9u5.QWGYt3v9MpESYQB5hyXpEFEk.', NULL, '2024-10-08 15:30:48', '2024-10-08 15:30:48'),
(164, 'Tyshawn Weber', 'dlegros@example.net', NULL, '$2y$12$OQbIQQu1j8NZ1Xhu7uC1eOeAe/SszkQawBbohNDEAVWC/BkYUmxDS', NULL, '2024-10-08 15:30:48', '2024-10-08 15:30:48'),
(165, 'Lulu Yost IV', 'hwhite@example.com', NULL, '$2y$12$VQ6Ku6qeUTapwTbVX8C6aOMGA9Uwn8bXuZbItrkQcADu3WQbSR6Om', NULL, '2024-10-08 15:30:49', '2024-10-08 15:30:49'),
(166, 'Keely Windler II', 'norberto23@example.org', NULL, '$2y$12$xRw3m3SIVYZcYvlBK9ZhA.o.jI30rCKJ3ScDCKEbY7pNWdIEjctCe', NULL, '2024-10-08 15:30:49', '2024-10-08 15:30:49'),
(167, 'Trace Armstrong', 'ida07@example.net', NULL, '$2y$12$7c/oetvL3FmDRXzubBJCA.5OabfG5Nk9Rc1i1AuvcBQo81dcrbUr.', NULL, '2024-10-08 15:30:49', '2024-10-08 15:30:49'),
(168, 'Kolby Schimmel', 'zgoyette@example.org', NULL, '$2y$12$D7fAxNPajMlluHAcLK2yMuWZJfFUoS.wgolWIEW77ExPy5YCsZ9a2', NULL, '2024-10-08 15:30:49', '2024-10-08 15:30:49'),
(169, 'Geovanny Kovacek', 'nayeli69@example.net', NULL, '$2y$12$KOnF5TqvlzvYI0rTc/fepexT5SY0KrSAGQEweXZ8nTadUE92oC.Gq', NULL, '2024-10-08 15:30:50', '2024-10-08 15:30:50'),
(170, 'Margie Hauck Jr.', 'eveum@example.org', NULL, '$2y$12$8ptSYQkX/LUBLYf97b/jvOQm8YQNtJ/5LclfO4ig13m3.WNFlKGZS', NULL, '2024-10-08 15:30:50', '2024-10-08 15:30:50'),
(171, 'Wilford Hudson', 'sjohnson@example.org', NULL, '$2y$12$pgmsqyROfbkoHDyXwmUlbuS8aZM2KKi23N6azqwuj9tI5YT4hfF4K', NULL, '2024-10-08 15:30:50', '2024-10-08 15:30:50'),
(172, 'Dr. Damon Franecki', 'felipe.konopelski@example.org', NULL, '$2y$12$6LG8fmct9suUoPP6PU87Jem6tCGzlOa2fjoQpuscGWyJWzljIOnPG', NULL, '2024-10-08 15:30:50', '2024-10-08 15:30:50'),
(173, 'Dr. Alva Russel MD', 'tbecker@example.com', NULL, '$2y$12$S69qlnFUWQxHEgz0MpqT5eNu5ShUYQVeAddzh.d73e6/A3u5G68Ma', NULL, '2024-10-08 15:30:51', '2024-10-08 15:30:51'),
(174, 'Mr. Lawrence Schimmel DDS', 'fstrosin@example.org', NULL, '$2y$12$3L95IzU6T99fUqQY2RULsupfpg9YTb.IIEiYfSiZ4sEawEpS0Xt.q', NULL, '2024-10-08 15:30:51', '2024-10-08 15:30:51'),
(175, 'Miracle Hodkiewicz MD', 'mcdermott.kieran@example.com', NULL, '$2y$12$.CS09Rh7Qgart.lwc0LSreV639YGTIDbIkgcjdwYL92llc2fcLjyS', NULL, '2024-10-08 15:30:51', '2024-10-08 15:30:51'),
(176, 'Dr. Brandy Larson DVM', 'fred41@example.org', NULL, '$2y$12$nB3BQ1nnrLmWRUEptW05au5Zzk0tvAEboGoBQRUAwgro51p08zg0C', NULL, '2024-10-08 15:30:51', '2024-10-08 15:30:51'),
(177, 'Ralph Lynch', 'einar.jacobson@example.net', NULL, '$2y$12$Q0amuA0MPjtEsCfoW/dU2er/6sHuaa/BlTSrl8aNOqDm1WzEBPocy', NULL, '2024-10-08 15:30:52', '2024-10-08 15:30:52'),
(178, 'Dr. Althea Weissnat I', 'tluettgen@example.org', NULL, '$2y$12$pOTpFO.EI3XLkILRj68fgu9m2hiicuwrpG8t0JideaTONHOquUtKq', NULL, '2024-10-08 15:30:52', '2024-10-08 15:30:52'),
(179, 'Cristina Hand', 'upton.angie@example.org', NULL, '$2y$12$8T2O9nd7gNxq9BtuRLIGReU4.JjWiwJlWt62j4M1L0Q423zxPXExq', NULL, '2024-10-08 15:30:52', '2024-10-08 15:30:52'),
(180, 'Candace Swaniawski V', 'marlon57@example.org', NULL, '$2y$12$87kI8JkRE1rWqn/pfleSU..HPZt6kRvJTqF3yBdBc63j06FTs7b.K', NULL, '2024-10-08 15:30:52', '2024-10-08 15:30:52'),
(181, 'Prof. Anne Buckridge', 'torp.lola@example.com', NULL, '$2y$12$f1vfaJ655VW9sWle.FJEdOnD4BErGax0.S8hj/1s8311DM0vN3Nza', NULL, '2024-10-08 15:30:53', '2024-10-08 15:30:53'),
(182, 'Jakob Sanford', 'magnus39@example.net', NULL, '$2y$12$nk5YKdmsZr7c1GfQgsCJV.vpNrrUTS9vpfY0T5jQBjlMS3JHBxbbq', NULL, '2024-10-08 15:30:53', '2024-10-08 15:30:53'),
(183, 'Bell Funk', 'trever.jakubowski@example.net', NULL, '$2y$12$hDWmBrVR7OlAkooaNhzdp.iXdIzeoa5L7w4HZd5qp68R2n3hM.5AS', NULL, '2024-10-08 15:30:53', '2024-10-08 15:30:53'),
(184, 'Ernestine Bailey', 'alice00@example.com', NULL, '$2y$12$h2r5iIW5EoVUd9zN.JEx6uM5gb2sPpqaF6.N30u3GgRRtuTwOCU3C', NULL, '2024-10-08 15:30:53', '2024-10-08 15:30:53'),
(185, 'Cole Kertzmann', 'vance50@example.org', NULL, '$2y$12$6IoFub9VRyUoQTHEnk9d4.SYdnCGRQesPc72JkWf3spD12SNfAhcG', NULL, '2024-10-08 15:30:54', '2024-10-08 15:30:54'),
(186, 'Mr. Barney Lakin II', 'destany79@example.org', NULL, '$2y$12$hpZnxcfs6HVzBEWozx4M1eZcfP.pUVpUoVEcu87j6.3FKriUC/EQ.', NULL, '2024-10-08 15:30:54', '2024-10-08 15:30:54'),
(187, 'Skye Hauck', 'emmalee.lind@example.com', NULL, '$2y$12$vd8uCjnQFBm.xfwFqtWB6OgiUav7OAOJIZRNbUwyXoTataSR60XoO', NULL, '2024-10-08 15:30:54', '2024-10-08 15:30:54'),
(188, 'Myriam Dare', 'ulemke@example.com', NULL, '$2y$12$UixhMwijF5SzliVaG./dz.oP6GXWCLrgod4DQAK9OCqz3VZRrRGvO', NULL, '2024-10-08 15:30:54', '2024-10-08 15:30:54'),
(189, 'Cole Klein PhD', 'catalina.nolan@example.org', NULL, '$2y$12$nsDqxuDp2TzPDm.zLKWdAOA1iqZdaQBbnu622fryM3JyN6Hb1lSvO', NULL, '2024-10-08 15:30:55', '2024-10-08 15:30:55'),
(190, 'Prof. Emily Grady', 'devyn83@example.com', NULL, '$2y$12$sIs66u.mA2f5OtnxgYOByevHY/DgfYXVodZi1ZkZEUzIWWiSkvo22', NULL, '2024-10-08 15:30:55', '2024-10-08 15:30:55'),
(191, 'Dr. Roel Runte III', 'cory33@example.net', NULL, '$2y$12$A4ofV0.504Xrmni/i04ER.GwD66c8VPGLmn5V8kIrst2PeVFgv1aS', NULL, '2024-10-08 15:30:55', '2024-10-08 15:30:55'),
(192, 'Jess Wolf', 'hunter46@example.com', NULL, '$2y$12$GO6K2Q2TFpQD5xRQgTDZcu1.yLbXggmOLR0o2clKBKwztSDF1mMsq', NULL, '2024-10-08 15:30:55', '2024-10-08 15:30:55'),
(193, 'Prof. Gregg Hilpert', 'verna45@example.net', NULL, '$2y$12$pHg3laP1uUNvJw7q1z6hfu6wLHq9ZWi1QqDqB/Q4TSgLdQtdoHMx.', NULL, '2024-10-08 15:30:56', '2024-10-08 15:30:56'),
(194, 'Miss Lois Lueilwitz', 'karson02@example.org', NULL, '$2y$12$q5ER4xCqDAq8rfrJswFXDukNHdqWmHbqd.vvamvW4OmwHnW4TcGmm', NULL, '2024-10-08 15:30:56', '2024-10-08 15:30:56'),
(195, 'Wilford Wiza', 'gerald.runolfsdottir@example.org', NULL, '$2y$12$N/Obo1azyFyAB6ARKi7ZGuCeWUiWjbAC/cRaw1BJHD2Oz6FMBcT62', NULL, '2024-10-08 15:30:56', '2024-10-08 15:30:56'),
(196, 'Patience Renner', 'kunze.wilfredo@example.org', NULL, '$2y$12$LK2s893yxiML6gayc.kRQ.MOyw4MGvy.muhcmHe7DNHWQzdNw849G', NULL, '2024-10-08 15:30:56', '2024-10-08 15:30:56'),
(197, 'Ms. Rhianna Greenfelder II', 'witting.kevin@example.net', NULL, '$2y$12$Qywy.vwrqKeZL29wbPrvV..zjn25nuDgSDoYY0NUkdsyOhXCENikS', NULL, '2024-10-08 15:30:57', '2024-10-08 15:30:57'),
(198, 'Jamie Lesch DVM', 'collin.keebler@example.net', NULL, '$2y$12$KiPgP7mvBwMwl3f69NzKlOW0bQvdTTN3kleMWkLJKcPViaWfgcFKK', NULL, '2024-10-08 15:30:57', '2024-10-08 15:30:57'),
(199, 'Eulah Goodwin MD', 'qfranecki@example.net', NULL, '$2y$12$mLvhV57Ss/0HyUQ0r5SByO4wq0w.m./67kPGr9KkSi.vpQoiynIZ.', NULL, '2024-10-08 15:30:57', '2024-10-08 15:30:57'),
(200, 'Elvera Rempel', 'mallie92@example.org', NULL, '$2y$12$me0E245aUm81aH3NhU2Pg.wsFV18iz8L9MYsx/V1qmnk6PR96WA2O', NULL, '2024-10-08 15:30:57', '2024-10-08 15:30:57');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Tablo için indeksler `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
