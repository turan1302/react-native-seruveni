-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: db
-- Üretim Zamanı: 02 Kas 2024, 08:06:16
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
-- Veritabanı: `gallery_backend_youtube`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `clients`
--

CREATE TABLE `clients` (
  `id` bigint UNSIGNED NOT NULL,
  `c_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `clients`
--

INSERT INTO `clients` (`id`, `c_name`, `c_surname`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'Test Soyad', 'test@hotmail.com', NULL, '$2y$12$xs8adg32TPVeAyrICkQdTeyr2I2UwBBl9YwbQK0cKaOu09rXE/M6q', NULL, '2024-10-25 11:15:55', '2024-10-25 11:15:55'),
(2, 'Test1', 'Test1 Soyad', 'test1@hotmail.com', NULL, '$2y$12$TkdEfam7Y5v.RzeKq9Fd0uIBOljMdCgA8hOB9S9E43zIBt715bEPG', NULL, '2024-10-26 07:53:18', '2024-10-26 07:53:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `images`
--

CREATE TABLE `images` (
  `img_id` bigint UNSIGNED NOT NULL,
  `img_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_desc` text COLLATE utf8mb4_unicode_ci,
  `img_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_client` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `img_created_at` timestamp NULL DEFAULT NULL,
  `img_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `images`
--

INSERT INTO `images` (`img_id`, `img_name`, `img_desc`, `img_image`, `img_client`, `deleted_at`, `img_created_at`, `img_updated_at`) VALUES
(1, 'Test1 Resim', 'Test1 Açıklama', 'images/test1.jpg', 2, NULL, '2024-11-02 10:09:21', NULL),
(2, 'Test2 Resim', 'Test2 Açıklama', 'images/test2.jpg', 2, NULL, '2024-11-02 10:09:21', NULL),
(3, 'Test3 Resim', 'Test3 Açıklama', 'images/test3.jpg', 2, NULL, '2024-11-01 10:09:21', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_25_103903_create_client_models_table', 1),
(10, '2024_10_25_104118_create_oauth_auth_codes_table', 2),
(11, '2024_10_25_104119_create_oauth_access_tokens_table', 2),
(12, '2024_10_25_104120_create_oauth_refresh_tokens_table', 2),
(13, '2024_10_25_104121_create_oauth_clients_table', 2),
(14, '2024_10_25_104122_create_oauth_personal_access_clients_table', 2),
(15, '2024_10_25_111810_create_oauth_auth_codes_table', 3),
(16, '2024_10_25_111811_create_oauth_access_tokens_table', 4),
(17, '2024_10_25_111812_create_oauth_refresh_tokens_table', 5),
(18, '2024_10_25_111813_create_oauth_clients_table', 6),
(19, '2024_10_25_111814_create_oauth_personal_access_clients_table', 7),
(20, '2024_11_01_122111_create_image_models_table', 7);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0004d8fecfb31ca2103f2fdaf19f52431641ce94ffe448130e5d7f3c3030244befa6773f65281e0a', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:08', '2024-11-02 07:45:08', '2024-11-02 08:45:08'),
('08b23147f43c64b1ea077d0740a58a9a3ae6bc69f7cddcd87ac8f0cf280ed3dd3e1e2f2df72dc463', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('09b5182a610854e6d0de6b1493f83f1b26d5bc605c5842c01fd316fa551a18166f30bf566713d6fe', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:10', '2024-11-02 07:41:10', '2024-11-02 08:41:10'),
('0a59c91311edea8d80207f805bfe457dfe15c0f0f39a2213f2af41b110ea764f2a80b8219567fc1c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('0c02567d5c98d8dec53271257d7f9139caa1fb886951c188201803ea46cd982fe3b3ba4431582adb', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:14', '2024-11-02 07:46:14', '2024-11-02 08:46:14'),
('0d46bf34692e098e61e34f8adb6f7ac121ca6f1696f20aab523db883cacc1b8bfc48b98ce526df13', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:53', '2024-11-02 07:45:53', '2024-11-02 08:45:53'),
('0dbdd345005cd66911094f8ff38b98b01f5732331762f921a7a998c2f3411509262618108f5f4694', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:12', '2024-11-02 07:46:12', '2024-11-02 08:46:12'),
('0f0ff5359ab1609a552ae9e075c8a9e6e4d20e022306846d1f891c2f8340bde0cf52f79686b18e77', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:37', '2024-11-02 07:45:37', '2024-11-02 08:45:37'),
('1132e45e3d11eb9a641742ddad52fbbbcb629263a96ce2415ac3fce40b6dd848f04ac17c853907f9', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:54:35', '2024-11-02 07:54:35', '2024-11-02 08:54:35'),
('175c212c7285a8fdefd5af196af92fcec0eb93977ec6a97a2786603c85726af08400ad009b1ba717', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('1957d97f15922daa98c7bb1f9ffa99d2d377bc631dbf088cb51d1c6d0cbca457223110ecdbdf9f3b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:51', '2024-11-02 07:45:51', '2024-11-02 08:45:51'),
('26cf3f43360ca2303c9217f11a498da051b4f08bc42d07f7b50b3d2aafc60c4bf1134e4a54ed350c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:54:35', '2024-11-02 07:54:35', '2024-11-02 08:54:35'),
('2ab9489c1025e86ec6616eb4a9a8e70136cc7800b17025c0b8363ef4da5431e35dab62032986b759', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:11:24', '2024-11-02 07:11:24', '2024-11-02 08:11:24'),
('2f7a08355e361f937242496b15b8c206767785c30ffb91917c898756406d93887904cf79c87bc5c4', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:09', '2024-11-02 07:45:09', '2024-11-02 08:45:09'),
('32d92147cca6f505f9702d03ddf15fb74a78ba17735284ad1dde3dafb3f8c24426eb994d3228dc23', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:12', '2024-11-02 07:46:12', '2024-11-02 08:46:12'),
('3b9fe7f0e92278ef3fd06d9e17abcd887d17cf7251306e3c5e2eb796a23bf0f5ff5d7456eecdf5cb', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:02', '2024-11-02 07:41:02', '2024-11-02 08:41:02'),
('431b5341bd11ddfbf5d897c6da0988906f58d06d75bebf1dce6ce99848a089fbc9abf23307bb1563', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:20', '2024-11-02 07:41:20', '2024-11-02 08:41:20'),
('43b8d95e8139e5911a00069953a6160eea3aea4a97945c09cafc63ee0006b04b87a966bee1c4dddf', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('47c2e22aec94a946ab26a6689ed3df80529203eddf963135947603a8637479bd6ea8ce56b6e6f80f', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:38', '2024-11-02 07:45:38', '2024-11-02 08:45:38'),
('48ad5c7cc3231b5d7663e7d8b8777886fd64beb9a86ca973bd5aa49bfbef5d5215819ba6f4cd6b5f', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:09', '2024-11-02 07:45:09', '2024-11-02 08:45:09'),
('4a60b0ba9e90385d828d2e8d05bc475520bca6b69eb3dfe7cdbe27e97178f2f33fc6ee437813eec8', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:20:14', '2024-11-02 07:20:14', '2024-11-02 08:20:14'),
('4aa07433d39fed6a739d702307d091fad712d15c8bbdf7a5317d74918de324f04d3ac9409ca78bc5', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:37', '2024-11-02 07:45:37', '2024-11-02 08:45:37'),
('4f2f34a10f534df7312a99791c7d94f6f2ac1efd6a23c281afea49c5344e42441f1b28a01f661cbc', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:16', '2024-11-02 07:41:16', '2024-11-02 08:41:16'),
('50d6bc5a9708fd120bc8a06485aa5eeaf7a3e913a4da33cc403810f8e776e083d362b1e4bd233940', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:00', '2024-11-02 07:41:00', '2024-11-02 08:41:00'),
('5359d0cea06eaed8bf34ca3067be679c9ad59b6a61767244f1b2d31fea245bd041424392288aa953', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:53', '2024-11-02 07:45:53', '2024-11-02 08:45:53'),
('56c2a2e6261c90a6148fa53384d6494a31fdc9dcf9d3468d4a85e7525b64c80dfdbfbc120adb258d', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('5d4740cf8280e037156e929ba24e73c50f3822884059a3d138129212e36428492e0e5c475443da2d', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02'),
('5fd5df87d08e674e486f788a00e5610688274b32d697b3af51c0c584313d609bfd30044e09e62bdf', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:54', '2024-11-02 07:45:54', '2024-11-02 08:45:54'),
('65757ef5391a374e04cc4c0d8d5fb83323d2c5ee0fb22cc27b0d25872ae220a0a66ee9c6fb3b6687', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:51', '2024-11-02 07:45:51', '2024-11-02 08:45:51'),
('663324bb8f18e3bc0340940a4f05724d052c20887b7ff8b6a66e539c6d7e238b6f070365d7d06373', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:08', '2024-11-02 07:45:08', '2024-11-02 08:45:08'),
('663af05fba40839134810f9aab2245332cd10118458ca90d2762f9c0232e72673479344011387f33', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02'),
('67d0653aea2493143f76da145d7472a8e160297156f0ae30d772a623d54a4f0ecaba43c8c3efd6c8', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:23', '2024-11-02 07:41:23', '2024-11-02 08:41:23'),
('6814a2a25c994d51217d9c6cc7bf17fcde6499f5d942902d867d07392b86bd6b37344793be0cc2d3', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:33:41', '2024-11-02 07:33:41', '2024-11-02 08:33:41'),
('693d9c0d34bd7932665f724c5b42541712dd5b8c4a3dd9ebec582d3ea4d4ca5ca633ae2d124cc84a', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:24', '2024-11-02 07:41:24', '2024-11-02 08:41:24'),
('6fff249db0e751966fe9a29ae1d381c5825859f5e4806f9fe1873446bd19ef66d74ac407926de0d1', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:16', '2024-11-02 07:41:16', '2024-11-02 08:41:16'),
('7342a8675a28e02d9fc41c3327507cf38d92328dc13fa5606c827331e67d01a951ccb704901c923c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:58:04', '2024-11-02 07:58:04', '2024-11-02 08:58:04'),
('741bd111832460be94b700d0f326e49afd139c01d6c6a9f59ac2269aa75fc95912f2f204030f539c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:39', '2024-11-02 07:45:39', '2024-11-02 08:45:39'),
('78622c1b5800e79ded879370d98e747279afeaa6cb78cbfbfb06cd4dd1ed030a07ef3d63bffd8de1', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:38', '2024-11-02 07:45:38', '2024-11-02 08:45:38'),
('7a8c6b0e7dc10865820e167f652957ba25de53cef084032bdd949564a437fb750dce036f6e8415b3', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('7b7a9d78725f7e036cb034deb70d0a284b350c9abe23a19a3a67c9b1a08e83fed1f76b8f1413fa85', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:14', '2024-11-02 07:46:14', '2024-11-02 08:46:14'),
('946abe10bb1a368e11dec6ab3cca373467523975106a76845401d7a4f4d4f830480dfd4d3a0cbb76', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:24', '2024-11-02 07:41:24', '2024-11-02 08:41:24'),
('9ba8f94ac580c5848c6a68e476e824eadad9a494b9b2255d5c6dd0d29f877bbc914c58f2a709938d', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:14', '2024-11-02 07:46:14', '2024-11-02 08:46:14'),
('9c8763297841e0c3ceb52cb39ea128867854278f9e533ee9adcc5e9795122782581ea5c730a64dd9', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('9e6578ae03931a770afd33b21a19cfaa465aee6edc449a84d2e3e576f24c7449ff069ca7fd231d3c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:40:33', '2024-11-02 07:40:33', '2024-11-02 08:40:33'),
('a25a840492bdc5fecb0785dea08a3a5a14ff4d03fb56d9b2ea6deb888c3f07f8a8ce96f855bcb54f', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('a725418b9a381a61eb1d4bc0c059fd8444c5756ad723ab8d23e477157b99a6c5f326e30bdfc9051b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:02', '2024-11-02 07:41:02', '2024-11-02 08:41:02'),
('aa09b3c1d6275d0d73bd629b3b240bbe701b03587925d1dfdcc9a1834757330af81c6058ba3e4d8e', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:54', '2024-11-02 07:45:54', '2024-11-02 08:45:54'),
('ab24d97842e79fc097771f1aba08f09dad72a9caf22329871cac805df64c080a600f34dabfe37f48', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:40:33', '2024-11-02 07:40:33', '2024-11-02 08:40:33'),
('abb45650fce9c4620356aa4cfa5e4a74aa6f1fa40e5a216ca908cde2831b32b71339f6bbaa1ddcc3', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:20:16', '2024-11-02 07:20:16', '2024-11-02 08:20:16'),
('b00a3a7e7fe94d92fdd0e74772c2d92e250e334cdd6362af1fc6f6155bc42e1018f75a00edda3be1', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('b2a46394bedf6e33df6e95020f2e0e824fdeddd355b9aea9e2acfce6ef5d5ef3292b99251927da27', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:39', '2024-11-02 07:45:39', '2024-11-02 08:45:39'),
('b4ee1e2f4a5a5b278178de1daaf64d3b372ace0b59f4871c0f36c66a20326952a85b7f827a699a39', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:54', '2024-11-02 07:45:54', '2024-11-02 08:45:54'),
('bbfb5fd13c848905476b80f8477a20a63ba6340b22cbf8d177ec7d075b0e0be7c8d9de5ba7513a9f', 2, 1, 'gallery', '[]', 0, '2024-11-01 12:31:08', '2024-11-01 12:31:08', '2024-11-01 13:31:08'),
('bcd376bf153435471f0007337241912849ad3007f4c7e805a9cc40cd73f07c313a108cb60a051604', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:53', '2024-11-02 07:45:53', '2024-11-02 08:45:53'),
('c8156796511c3d2bfb0f354e94ee42df35cf64a8ac466746afa294aa87eff2fb07e092637a16e8a1', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:10', '2024-11-02 07:41:10', '2024-11-02 08:41:10'),
('c85fe2ca5155455cdda7817bcc3c4d886327f0ec82f9b36afc3f3e5fcba46aa59eb9d7222b937d06', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:58:04', '2024-11-02 07:58:04', '2024-11-02 08:58:04'),
('cbdc4a4a42148ec29dfc08af7eef3d3dcbcf242ba173bf5fc399eb432de552143fe601b5a69e1c44', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('cd5d7f7c65ee9f588b239ba9369a7dc3ee40d86feb94ea9e50d655a545781f7f11781bb45d078e76', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02'),
('cffcb94aa113cc4131f8edd8738677d18f7341771d221830513bccc65de798a87337e660c5b7de2b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:06', '2024-11-02 07:45:06', '2024-11-02 08:45:06'),
('d1a6f310ddea507dccada12b508ef27e0bdeda02b45d68c226e202fc283dbd129fb8ee363295bfb6', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:36:08', '2024-11-02 07:36:08', '2024-11-02 08:36:08'),
('d4407ecfbde2eb551a5c61041e00f09ec4498b4e346c0dbcc9378ca0ac7538ac6c6badbfe3da2042', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:40:21', '2024-11-02 07:40:21', '2024-11-02 08:40:21'),
('d9c5ee8345f0206f2a720c6bf981582665a30596e89934fbd6c5618dfea8b9f1f4ef9d5da036bdd0', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:54', '2024-11-02 07:45:54', '2024-11-02 08:45:54'),
('dcf9fd7643eafaf938b31669e18347cae60ef207915cf8b2bf19861e89fdc669d45d766917764092', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:00', '2024-11-02 07:41:00', '2024-11-02 08:41:00'),
('de7fc5687af2bf64528f5df7f40f5b8b86902a0ef77090c3cf93cd32bcce6f98b8bce44da146472b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:32:23', '2024-11-02 07:32:23', '2024-11-02 08:32:23'),
('df2788b15f69c7b50b1bf5d838c9e58f3bd53de5c70503d01954fa3496843480bb39f04d7513588e', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02'),
('dfcca4d84d0c2048f2c74e818a970a75cdccacdc89cd705fb2ceda3ee9cd29260356a1d27d2cc634', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:40:33', '2024-11-02 07:40:33', '2024-11-02 08:40:33'),
('e1141e4c88298201b1f017e9ec00526d0da1c13f3747106b09e06f9c8caacc3d8a02fa30a0949a3b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:39', '2024-11-02 07:45:39', '2024-11-02 08:45:39'),
('e3fd8d7026b0736d7575cdab97e05c8861699f29f854f395ab314132007bdae81419d6e6a556fb26', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:14', '2024-11-02 07:46:14', '2024-11-02 08:46:14'),
('e99e73fcf5b76f05ea2e569606cd7cc7c821c88d41ca3cff7cfad4580ec7ce500746ae986182ce5d', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:16', '2024-11-02 07:41:16', '2024-11-02 08:41:16'),
('ec6970924bf595f5309c53e5f88ea3c17877417d27bea2139b64f1ba62f3acc84d04336e9797274c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:03', '2024-11-02 07:41:04', '2024-11-02 08:41:03'),
('f768e5aa5ad642b666d20de77cac929064aa1d03162089c5c98b46a2aa40da28ff87c67e12e14778', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:58:04', '2024-11-02 07:58:04', '2024-11-02 08:58:04'),
('f7a8de2e670bdfcab74d9d98a26815a8005b2ac0a7381ddd26ed9bad2193f1a580514dbdf6948067', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('fb820aa8d28b10f10229884ef3b1dfc8f47197104051f7bc7e52fbd2e3054e8cf155b1f58d1da594', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:00', '2024-11-02 07:41:00', '2024-11-02 08:41:00'),
('fcda35f31f94f5c1e56ce9a680192cf90e0bd2007e24edb4c4a2fb09ad8d543fd4c488fa8b1beb60', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'sYltYwhdBLAFHQNzkCdWZ4rEIkAxnTlp7nkdv2k0', NULL, 'http://localhost', 1, 0, 0, '2024-11-01 12:29:46', '2024-11-01 12:29:46');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-11-01 12:29:46', '2024-11-01 12:29:46');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Tablo için indeksler `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`);

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
-- Tablo için indeksler `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Tablo için indeksler `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Tablo için indeksler `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Tablo için indeksler `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

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
-- Tablo için AUTO_INCREMENT değeri `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `images`
--
ALTER TABLE `images`
  MODIFY `img_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
