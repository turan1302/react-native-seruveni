-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: db
-- Üretim Zamanı: 07 Kas 2024, 16:18:07
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
(3, 'Test3 Resim', 'Test3 Açıklama', 'images/test3.jpg', 2, '2024-11-03 11:32:21', '2024-11-01 10:09:21', '2024-11-03 11:32:21'),
(5, 'Test Bilgisayar', 'Güzel Bilgisyar', 'images/test1-2-672cd7520d0b0.jpeg', 2, '2024-11-07 15:06:14', '2024-11-07 15:05:54', '2024-11-07 15:06:14'),
(6, 'Test Bilgisayar', 'Güzel bir bilgisayar', 'images/test1-2-672cd79324adf.jpeg', 2, NULL, '2024-11-07 15:06:59', '2024-11-07 15:06:59'),
(7, 'Test Kamera', 'Kamera resmi çekildi', 'images/test1-2-672cdc4130306.jpeg', 2, NULL, '2024-11-07 15:26:57', '2024-11-07 15:26:57'),
(8, 'Araba', 'Spor Araba', 'images/test1-2-672cdc9a36eda.jpg', 2, NULL, '2024-11-07 15:28:26', '2024-11-07 15:28:26');

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
('000a2ff23d00bb7413947b2f81fdda2bed25133fbec2de60d347e29c18cb917fb257e5a3e6203b9c', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:39', '2024-11-03 11:34:39', '2024-11-03 12:34:39'),
('018da525a183133b3c269bec958eec455041ac060fcd9caa8688fad89bac139e20267e969aacf177', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:28:28', '2024-11-07 15:28:28', '2024-11-07 16:28:28'),
('03bf9e780d8f7c2d5f87f5598f9a50f934ead836550e6c482bf5bb875d9588fd8bbb7b8866620fe5', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:56', '2024-11-07 15:27:56', '2024-11-07 16:27:56'),
('04c234279ce33cfb1d8d0eef3305b3dbbbbf80352457108c08aa25df06264bbada2ceec2d99d6889', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:23:21', '2024-11-05 08:23:21', '2024-11-05 09:23:21'),
('068078e5451319a6882746d5521dc4dacb36e514f0909b386efe3a04c14fb3def41517cea359b771', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:10:45', '2024-11-05 09:10:45', '2024-11-05 10:10:45'),
('071cc6b877f8da949bce64a702323a963cc26a40224648fd36e88d45bec1b5cb000a89f9f00d90f8', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:41', '2024-11-07 15:27:41', '2024-11-07 16:27:41'),
('08b23147f43c64b1ea077d0740a58a9a3ae6bc69f7cddcd87ac8f0cf280ed3dd3e1e2f2df72dc463', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('09b5182a610854e6d0de6b1493f83f1b26d5bc605c5842c01fd316fa551a18166f30bf566713d6fe', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:10', '2024-11-02 07:41:10', '2024-11-02 08:41:10'),
('09e1acc78e1bc8417c782a6500c44aee94a4c5b954da138a02cbef6deb3ebd831df3489fbc4a73b2', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:09:03', '2024-11-03 11:09:03', '2024-11-03 12:09:03'),
('0a591e387bee9932100606dca2e73e6d8e0ac6cef0c7f3effadd49caa64f0147bad7e279dab58ef9', 2, 1, 'gallery', '[]', 0, '2024-11-03 10:55:22', '2024-11-03 10:55:22', '2024-11-03 11:55:22'),
('0a59c91311edea8d80207f805bfe457dfe15c0f0f39a2213f2af41b110ea764f2a80b8219567fc1c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('0c02567d5c98d8dec53271257d7f9139caa1fb886951c188201803ea46cd982fe3b3ba4431582adb', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:14', '2024-11-02 07:46:14', '2024-11-02 08:46:14'),
('0d46bf34692e098e61e34f8adb6f7ac121ca6f1696f20aab523db883cacc1b8bfc48b98ce526df13', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:53', '2024-11-02 07:45:53', '2024-11-02 08:45:53'),
('0dbdd345005cd66911094f8ff38b98b01f5732331762f921a7a998c2f3411509262618108f5f4694', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:12', '2024-11-02 07:46:12', '2024-11-02 08:46:12'),
('0e457c1781fb5ae0e4343c346816af7102b4799f2ead9848f79fee437d721c7faef579d17ef584a7', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:16:56', '2024-11-05 09:16:56', '2024-11-05 10:16:56'),
('0eab072a45d9f705ce9fd2c981ea989fb06594a83fa9532e864d90f5af3c8c0759187d4df862b9a3', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:22:16', '2024-11-07 15:22:16', '2024-11-07 16:22:16'),
('0f0ff5359ab1609a552ae9e075c8a9e6e4d20e022306846d1f891c2f8340bde0cf52f79686b18e77', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:37', '2024-11-02 07:45:37', '2024-11-02 08:45:37'),
('1031b8d24bf6588f40679e72c2689c28cf8429208002a9f1f2bf4009f24ae26c47f6f1f25b8c938d', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:26:30', '2024-11-03 11:26:30', '2024-11-03 12:26:30'),
('10bdcf91cc7f13029b682bb0aefe56afa07ab082432225a70f06e980a8b4f3568a0d8cc98b676bf0', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:46', '2024-11-03 11:34:46', '2024-11-03 12:34:46'),
('1132e45e3d11eb9a641742ddad52fbbbcb629263a96ce2415ac3fce40b6dd848f04ac17c853907f9', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:54:35', '2024-11-02 07:54:35', '2024-11-02 08:54:35'),
('138a7126dbeafb28e4ac545e23ee5ab1eb28f822c9996d1fe28d3d71e5701859544d7aa8c877c305', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:25', '2024-11-07 15:02:25', '2024-11-07 16:02:25'),
('149e6d68324345d93a695901bda2fd85655b9e136519134a29d5c3b625cc160b4cdbb81b35937ae1', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:28:32', '2024-11-03 11:28:32', '2024-11-03 12:28:32'),
('16002f6f930c898bf1ecb3fa994ded202ad6ccc12c627beddeee2fa15705718ba0c8b8b01a9a2bac', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:32:17', '2024-11-03 11:32:17', '2024-11-03 12:32:17'),
('169e48dd8e11410ffccef5ed010b51fa4a6e1881478e3febad38b33efaca8a3ac376944979f53419', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:25:59', '2024-11-05 08:25:59', '2024-11-05 09:25:59'),
('16c6c42d962245e419dd8e76ad457b72aa142ea4805a186554083c36646ab851f28717e3964baed3', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:04:30', '2024-11-03 11:04:30', '2024-11-03 12:04:30'),
('17092bd0e125cd6c47e303307899a20cfb330fc00e73869a28ed609c0513457a6f3e0b28947b30b0', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:26:59', '2024-11-07 15:26:59', '2024-11-07 16:26:59'),
('175c212c7285a8fdefd5af196af92fcec0eb93977ec6a97a2786603c85726af08400ad009b1ba717', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('17ed123da37aa00f770263c88831a7bbc9b25fe4fe5c65ff098bda2d9a9c2db083d6eba7dac23245', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:05:38', '2024-11-07 15:05:38', '2024-11-07 16:05:38'),
('1957d97f15922daa98c7bb1f9ffa99d2d377bc631dbf088cb51d1c6d0cbca457223110ecdbdf9f3b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:51', '2024-11-02 07:45:51', '2024-11-02 08:45:51'),
('19724faff4175e6f05dbacda17f935f7f69ca9bb1c43f95a54a44b1530d4345148b36c1a551496bd', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:29:36', '2024-11-03 11:29:36', '2024-11-03 12:29:36'),
('1b247f2806030b3f4d81abbd917216cc92bbb45684dcdf9bb028a1425a6006f4e2b82e1d41b0427c', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:45', '2024-11-03 11:34:45', '2024-11-03 12:34:45'),
('20b7080716e1d565173941fc9775dc20afae82c15b7da00614001ceaea361988c27f5952f0505144', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:26:51', '2024-11-05 08:26:51', '2024-11-05 09:26:51'),
('20d51d637c93884fd39f5b38f4af90698e2e254e5e7d490feab785aefb23099a443ef3a24121fdd4', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:14:22', '2024-11-05 09:14:22', '2024-11-05 10:14:22'),
('2206f11bd0da512a4d3667b712f3682456c0aef3d3c7c8831603e86096ed8ea084fbfb8814745298', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:36', '2024-11-03 11:34:36', '2024-11-03 12:34:36'),
('22c569dbfddde64360a225b2ec164b7c6ca46386350d0f8beb0db14050c6a7f92d11731e9bc900ce', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:25:38', '2024-11-03 11:25:38', '2024-11-03 12:25:38'),
('233775d669473d2940be9c3257869fbaae8951e1a60b9f097d5252fd84f5983995ed0a6839ee7f6e', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:28:10', '2024-11-07 15:28:10', '2024-11-07 16:28:10'),
('244be4d5284e55198e07646e29076ed650571ac32b38b99dc7fa5c75c0dcdc1badd9631705797a57', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:11:28', '2024-11-03 11:11:28', '2024-11-03 12:11:28'),
('26cf3f43360ca2303c9217f11a498da051b4f08bc42d07f7b50b3d2aafc60c4bf1134e4a54ed350c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:54:35', '2024-11-02 07:54:35', '2024-11-02 08:54:35'),
('29acf566388523adf13d1b8509e6c6cf66f291de0f80e1139c032c36244b13a5c5ee417811ac9255', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:32:19', '2024-11-03 11:32:19', '2024-11-03 12:32:19'),
('2ab9489c1025e86ec6616eb4a9a8e70136cc7800b17025c0b8363ef4da5431e35dab62032986b759', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:11:24', '2024-11-02 07:11:24', '2024-11-02 08:11:24'),
('2af04c4bc1821f624320b7d776e32df7ae4f8f1b4d24d31fb09d6ef025c82a28c79b39650a988753', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:04:09', '2024-11-05 09:04:09', '2024-11-05 10:04:09'),
('2b479725f0507b9a5ed75e1a00a5517a92fd618660ceb686f08791f1963f4f09dd7e9f8d1050eab5', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:55', '2024-11-07 15:27:55', '2024-11-07 16:27:55'),
('2cb22d3fb1e8380c682b28d5dbefea7d919168b2b5efb5da7abf52ae8e01b9c52f7bab76934de24d', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:09:00', '2024-11-05 09:09:00', '2024-11-05 10:09:00'),
('2f7a08355e361f937242496b15b8c206767785c30ffb91917c898756406d93887904cf79c87bc5c4', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:09', '2024-11-02 07:45:09', '2024-11-02 08:45:09'),
('30d60d3d1cbf6cfda430ecb727520af17f4ee0d46198506fbf6d17146a43de44e91fbfad7f35d811', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:09:12', '2024-11-03 11:09:12', '2024-11-03 12:09:12'),
('3159e8f26f1603f7511b1bad1792d8748678924371c3afa2f3943d8b9b0df4d7c999c18830e08e63', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:18:23', '2024-11-07 15:18:23', '2024-11-07 16:18:23'),
('328389367fbff70b48eeb58b901bf85fb8dea154c9e19768f42a725fc8ad7ec647bae44a01d10bab', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:08:52', '2024-11-07 15:08:52', '2024-11-07 16:08:52'),
('32d92147cca6f505f9702d03ddf15fb74a78ba17735284ad1dde3dafb3f8c24426eb994d3228dc23', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:12', '2024-11-02 07:46:12', '2024-11-02 08:46:12'),
('33357a63f3ed48dd2634af313a88c6fd97d45d1cb90e5bde0040c33fe93932db5e23c9e11812e6d2', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:00:28', '2024-11-05 09:00:28', '2024-11-05 10:00:28'),
('33a5dea3c6ad1bf62a5ebee7feca7761b7880b3f69acdbde2481a1277893d5b05679526cab38f1d4', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:08:41', '2024-11-03 11:08:42', '2024-11-03 12:08:41'),
('34336e00c7c4ae29a3592f0361884af997839dfa99b040b2a0762c1595da3c8f4fda56212c15a1b3', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:42:02', '2024-11-05 08:42:02', '2024-11-05 09:42:02'),
('352de8b1a833ea217b53bb410250a29b703e9a1df470ff16a01b98aba736b36ca217d1c28b0331e7', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:03:37', '2024-11-05 09:03:37', '2024-11-05 10:03:37'),
('3916cde2d21a7f0d1394338ccbc6a8b57d40823bb378e57e065b8baf83f11b885d95d7ab04ed35be', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:01:42', '2024-11-05 09:01:42', '2024-11-05 10:01:42'),
('39a20d28e49fe3a3805cf5a6c869297e0a8bce14e0d88d200ea1fad345b74afb23f7d276d437d4d5', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:29', '2024-11-07 15:27:29', '2024-11-07 16:27:29'),
('39ed1753892d5f6fac0b89dee72ee54681c88ddcfb7b0e3eaa1116dec5191435ea434528203554fe', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:59:45', '2024-11-05 08:59:45', '2024-11-05 09:59:45'),
('3ab8fbaf6a1888e6c127ffe2336d98893b403389e6804f48c3c95bfbf5bca457ee8f489227780661', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:07:03', '2024-11-05 09:07:03', '2024-11-05 10:07:03'),
('3b82844a591b702032ecb7aff86a1035e03e46a663e3ea346353a365411e3158fd3b335b868eca52', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:25:43', '2024-11-03 11:25:43', '2024-11-03 12:25:43'),
('3b9fe7f0e92278ef3fd06d9e17abcd887d17cf7251306e3c5e2eb796a23bf0f5ff5d7456eecdf5cb', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:02', '2024-11-02 07:41:02', '2024-11-02 08:41:02'),
('3dbedd3c8f7b99359ef1d8478af17284ee1ab8bb7cf5f701cdea82e174856c82e21cc58d6c11d55f', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:25:33', '2024-11-03 11:25:33', '2024-11-03 12:25:33'),
('3f7550bb7f7bbc7f573d19ec93b46c15005a5834fc4e110ca5c47d6f98c61f24a695c87ca595c8b9', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:32:58', '2024-11-03 11:32:58', '2024-11-03 12:32:58'),
('3f99869dbf7e13c501fc82c5aecf2efcf3d987eaa331cb7cc858332a4e5e94c6cff7f41da18239de', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:32:49', '2024-11-03 11:32:49', '2024-11-03 12:32:49'),
('40d754735f4551d6ad0dc72c849ac99b9099113530cafbc66933e57586f89c9a2d157f4f091cfcf1', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:05:34', '2024-11-03 11:05:34', '2024-11-03 12:05:34'),
('40f4aeeaed0cfec2b75ffe9d86643b4664ff08611215b92c8bc3766ac88e256435cf052848a7e148', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:22:16', '2024-11-07 15:22:16', '2024-11-07 16:22:16'),
('40f81405db419671a9e3ed15575f7858371ddd611fcbc44842ecbc791f04e62a20168c4474b5752d', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:03', '2024-11-07 15:02:03', '2024-11-07 16:02:03'),
('419f41ffa073314ebe7afb5644294ed1aa62dbf9c5bc7ae32c522074603d70b38ef14cfc60a4da77', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:25:47', '2024-11-03 11:25:47', '2024-11-03 12:25:47'),
('431b5341bd11ddfbf5d897c6da0988906f58d06d75bebf1dce6ce99848a089fbc9abf23307bb1563', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:20', '2024-11-02 07:41:20', '2024-11-02 08:41:20'),
('43b8d95e8139e5911a00069953a6160eea3aea4a97945c09cafc63ee0006b04b87a966bee1c4dddf', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('44c1ee056e308b98f76a6b815cf386e1ad9886c74a511750e3626dde694cb92b708f143db9934958', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:00:25', '2024-11-07 15:00:25', '2024-11-07 16:00:25'),
('452ba942aff198021e4a015c81be452095fbbf802241d470508aaf68e820b9fe6637d23d6b04306e', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:32:48', '2024-11-05 08:32:48', '2024-11-05 09:32:48'),
('45b983aa91ca7dbddd6418465db5a11c9c096e92ab5a2e76475ff9248b940004e57839c8ca4a1124', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:21:46', '2024-11-07 15:21:46', '2024-11-07 16:21:46'),
('47c2e22aec94a946ab26a6689ed3df80529203eddf963135947603a8637479bd6ea8ce56b6e6f80f', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:38', '2024-11-02 07:45:38', '2024-11-02 08:45:38'),
('483bfe84835302962a87f7fcef0ae1b4edf2bd03f3a27712381d3f0273d4600a9e7e9486315577f5', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:05:37', '2024-11-07 15:05:37', '2024-11-07 16:05:37'),
('4847eb396fc4dcc92d0b04b00b533c1ce93bdf8abd0ee364bf8aef1ff144402ecd0d4da870ea6c72', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:14:34', '2024-11-05 09:14:34', '2024-11-05 10:14:34'),
('48ad5c7cc3231b5d7663e7d8b8777886fd64beb9a86ca973bd5aa49bfbef5d5215819ba6f4cd6b5f', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:09', '2024-11-02 07:45:09', '2024-11-02 08:45:09'),
('494b62bb67651fce46e71bea1ea7bde1eeb7a033bf0e48ae461252b1c31ba4baa9af46101ee563ea', 2, 1, 'gallery', '[]', 0, '2024-11-07 14:50:51', '2024-11-07 14:50:51', '2024-11-07 15:50:51'),
('497b1682515cf817bcdcc493c36caed7e161c30f17d5d3a344659540296a8a8e358909d4c17dfeaf', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:22:14', '2024-11-07 15:22:14', '2024-11-07 16:22:14'),
('49f4415738cd44d0cff88c50ce5dd68f7d29d40428dcd50c3b915d1baf5fcb0824ba4753df2c9ef0', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:25:40', '2024-11-07 15:25:40', '2024-11-07 16:25:40'),
('4a60b0ba9e90385d828d2e8d05bc475520bca6b69eb3dfe7cdbe27e97178f2f33fc6ee437813eec8', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:20:14', '2024-11-02 07:20:14', '2024-11-02 08:20:14'),
('4aa07433d39fed6a739d702307d091fad712d15c8bbdf7a5317d74918de324f04d3ac9409ca78bc5', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:37', '2024-11-02 07:45:37', '2024-11-02 08:45:37'),
('4c02ac6d497454bf64330e18b3617a8a1437e6483a71fea3c238cc8833d03d45c77304b76f04eb96', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:34', '2024-11-07 15:02:34', '2024-11-07 16:02:34'),
('4ceed8923ebedfd4ceeb59679790184f15d6dc66d5679a6624fe1a7b7aa52b872c23da8b7072c786', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:13:58', '2024-11-05 09:13:58', '2024-11-05 10:13:58'),
('4f2f34a10f534df7312a99791c7d94f6f2ac1efd6a23c281afea49c5344e42441f1b28a01f661cbc', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:16', '2024-11-02 07:41:16', '2024-11-02 08:41:16'),
('4f7cd82acaf9baa0ee5020b69141ae3c46f5347228c22821b6ec60509da0940299adc100e6dfce79', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:27:47', '2024-11-03 11:27:47', '2024-11-03 12:27:47'),
('4fd0a827be97ab0eac08130c14889ed52a7c0c2bde58f2c8a930d361ecc824edf18fc4dc0939811a', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:32:13', '2024-11-03 11:32:13', '2024-11-03 12:32:13'),
('509635c96489a2da5bdc5edc7defcbb9d5a7724b015a2e5c513a4300fc8b301126ae3f22dc75d5f7', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:33:45', '2024-11-03 11:33:45', '2024-11-03 12:33:45'),
('50d6bc5a9708fd120bc8a06485aa5eeaf7a3e913a4da33cc403810f8e776e083d362b1e4bd233940', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:00', '2024-11-02 07:41:00', '2024-11-02 08:41:00'),
('511765cedf19c5d5b7444c3ac4215395c04007667f223e62a83f358a72c4784057ca3045baa29ac9', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:02:54', '2024-11-05 09:02:54', '2024-11-05 10:02:54'),
('51a7847e1403241d8d582ad7469360ce545827e5bc22a4b1aecc78c25dda2cd7ef35fd0756c4a457', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:15:13', '2024-11-05 09:15:13', '2024-11-05 10:15:13'),
('51da969736754faa4792c693a4c5d4eee9b80454f74f8f1d431adbe86315b772cb3f8e114fd9c4ab', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:28:11', '2024-11-03 11:28:11', '2024-11-03 12:28:11'),
('52024b79a4b70f7f91954c3b1ff175cef1083e4b2d6325089285377cedf06b81b4d5f379c4e14047', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:32:46', '2024-11-05 08:32:46', '2024-11-05 09:32:46'),
('5214691b49a449ab5712b943af814303adb40628fc9ff3370fc95c2e0b7752eb995bdc29a4781a5d', 2, 1, 'gallery', '[]', 0, '2024-11-07 14:49:13', '2024-11-07 14:49:13', '2024-11-07 15:49:13'),
('5233d15e4677ff3c6c4fee67a9c921df76bf4eaaac6636a8e08b349a92b5726e2a124a2dacc1906c', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:58:00', '2024-11-05 08:58:00', '2024-11-05 09:58:00'),
('52cbe84905e4e40939257ec15b1a837f134e0d20af6dd2cc65e9ff59b97d46da7c43e4d757a078ec', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:06:12', '2024-11-07 15:06:12', '2024-11-07 16:06:12'),
('5359d0cea06eaed8bf34ca3067be679c9ad59b6a61767244f1b2d31fea245bd041424392288aa953', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:53', '2024-11-02 07:45:53', '2024-11-02 08:45:53'),
('546b1260d29c361750cb6c5d0c223d2fe48a3f64b789451872a4aa8eb41810092b14f6e508a9fbc6', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:16:14', '2024-11-05 09:16:14', '2024-11-05 10:16:14'),
('554127722515da3b19c6798e453f2e3fe620773fe7e1313cf7f4bc75ec445e6b81ff91cf57e37454', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:59:07', '2024-11-05 08:59:07', '2024-11-05 09:59:07'),
('55af684b5ded16189d05e5392773dee0c3999c0d386f320616beb0149d17a9e28bdc1fc51086b641', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:08:36', '2024-11-03 11:08:36', '2024-11-03 12:08:36'),
('56c1865c44f609e4088bb7b5017f884248064a8f54d27a2d80982ffcf7d1a41e98bcf121c8e7c6eb', 2, 1, 'gallery', '[]', 0, '2024-11-07 14:50:48', '2024-11-07 14:50:48', '2024-11-07 15:50:48'),
('56c2a2e6261c90a6148fa53384d6494a31fdc9dcf9d3468d4a85e7525b64c80dfdbfbc120adb258d', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('57487b5c212cf99d142068bfa5685e5d387bd7b65f79cdd74a619bdd14c7d7cfd68cbc4c6c8d664b', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:43', '2024-11-07 15:27:43', '2024-11-07 16:27:43'),
('575c310694ac1d6c28b0f661f3a01ede223e7e6f84c8967800cf95735e2f56ec6c9a97c34d2a72b3', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:31', '2024-11-07 15:02:31', '2024-11-07 16:02:31'),
('57aca3bdab916d64f07576d1e51aff6046332244d7b0f5582284a6d50d7d0696321e0d7d353320ea', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:04:30', '2024-11-03 11:04:30', '2024-11-03 12:04:30'),
('58367f3500b0d17ddc0bea2f94b06475a4212a1010e3733f2cb25c785997f8f0df9073b98a403fda', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:27:25', '2024-11-03 11:27:25', '2024-11-03 12:27:25'),
('58769ed84b720c6f82aaa0bd79018258946796c5ba456dfab820ef9d999dfa23f3891f2f821efdac', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:26:10', '2024-11-07 15:26:10', '2024-11-07 16:26:10'),
('58f2910070ce9f69d264f48f2b3ad82fa2c8896363a4b8dfd90476d1797236068f87bc919ee5ab71', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:37', '2024-11-03 11:34:37', '2024-11-03 12:34:37'),
('5a942e2301670a89510946d47c508c1a7ca51048ac98120b2834f35963b6c23bc3abe3b386972215', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:22:14', '2024-11-07 15:22:14', '2024-11-07 16:22:14'),
('5acc514f9238615294c53c960eb535eb18b4bee2487bf000dbee77f6782185adde58f89bbb5e4591', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:22', '2024-11-07 15:27:22', '2024-11-07 16:27:22'),
('5b0b576e8028bbbc676104d7a542e5e12963767703bb9eca0ab902cd6e6e3f4525997c026e4d35f4', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:26:12', '2024-11-07 15:26:12', '2024-11-07 16:26:12'),
('5c568adda722822cc9fe2bb75a74bb189ae46a605efe84e886e80a1222d014e589e3d91c04291631', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:05:37', '2024-11-07 15:05:37', '2024-11-07 16:05:37'),
('5d4740cf8280e037156e929ba24e73c50f3822884059a3d138129212e36428492e0e5c475443da2d', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02'),
('5e09bd3a055d229dca677d16509860f7701c9432b1c9d47ce726d2713394c1cc9b7d4d1508546f9d', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:25:40', '2024-11-07 15:25:40', '2024-11-07 16:25:40'),
('5e2810a9a112e38eb1d253a702865f222ccdd33674d23c94f3aaa7728cbf4a29bdbe697b0c164419', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:58:04', '2024-11-05 08:58:04', '2024-11-05 09:58:04'),
('5e80d52d5b61d6e03b5ab2c35c41c4b791bd2d5b0dab81774dc435e7be9e3a755c461f37476d4c03', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:50:22', '2024-11-05 08:50:22', '2024-11-05 09:50:22'),
('5f6c99d91fc24da8dc61bc14259cf9cedc5add1e26f8b5f19cf0bca57a30cacbdb80638eafad30e8', 2, 1, 'gallery', '[]', 0, '2024-11-07 14:51:48', '2024-11-07 14:51:48', '2024-11-07 15:51:48'),
('5fd5df87d08e674e486f788a00e5610688274b32d697b3af51c0c584313d609bfd30044e09e62bdf', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:54', '2024-11-02 07:45:54', '2024-11-02 08:45:54'),
('61eca02d815f047d989d8664f8a5283a3732a8c5a010452a8493109e6308dce516df06776cee8219', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:04:30', '2024-11-03 11:04:30', '2024-11-03 12:04:30'),
('62cad00c8b27117adc8d7e13b6ac805662235144857bd20552f0cb2eff8fc26b70751ae42363b3f5', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:55:21', '2024-11-05 08:55:21', '2024-11-05 09:55:21'),
('62f792fb33c83e2dd9905e489f6456f429d40f0bd785b9d2818cf8bf0b49f826d5ec276ec98d410b', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:09:00', '2024-11-03 11:09:00', '2024-11-03 12:09:00'),
('6337f29c665bac66ffe7a4fed21d188ee724bbf1a1e268c955499a32edd1093cf5f9032b125ed91b', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:47', '2024-11-03 11:34:47', '2024-11-03 12:34:47'),
('65757ef5391a374e04cc4c0d8d5fb83323d2c5ee0fb22cc27b0d25872ae220a0a66ee9c6fb3b6687', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:51', '2024-11-02 07:45:51', '2024-11-02 08:45:51'),
('658676dce32007c1b3c51006afb6b0f407c912ad717a3f5d8e556dfee9479524b3b72352296c8637', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:01:28', '2024-11-07 15:01:28', '2024-11-07 16:01:28'),
('65b9405d110dabcc226a0bc552d5f96cb79ef286ae3b021f8796414934df22e54a078269b05c13c3', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:06:27', '2024-11-05 09:06:27', '2024-11-05 10:06:27'),
('65bc218acebc685053b1c9448283ae6f164a5caeabf78c3619370ecd7f1b32bb9f8d69b763260b9e', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:32:23', '2024-11-03 11:32:23', '2024-11-03 12:32:23'),
('65ef68620896b5cd820a4c71546f57cda5aa34edfa5d7f1733672b8b6abeea345812556d78e305a9', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:12:16', '2024-11-03 11:12:16', '2024-11-03 12:12:16'),
('663324bb8f18e3bc0340940a4f05724d052c20887b7ff8b6a66e539c6d7e238b6f070365d7d06373', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:08', '2024-11-02 07:45:08', '2024-11-02 08:45:08'),
('663af05fba40839134810f9aab2245332cd10118458ca90d2762f9c0232e72673479344011387f33', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02'),
('67569c1d1a82749ac2c3151bd50272a28d497a885a7c9d19c3d830f0c35a041df4984bc1e0ea3329', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:26', '2024-11-07 15:27:26', '2024-11-07 16:27:26'),
('678a32da674fcd6f2ddd17b34513e9a7785da1569af3a91f7df6824b334ba04cae23a252e6589f27', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:01:08', '2024-11-05 09:01:08', '2024-11-05 10:01:08'),
('67928bc50536c706ede8488f2c2f02512078463d4f546f69f4446677ab973d701489a80cd5b6c649', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:56:32', '2024-11-05 08:56:32', '2024-11-05 09:56:32'),
('67d0653aea2493143f76da145d7472a8e160297156f0ae30d772a623d54a4f0ecaba43c8c3efd6c8', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:23', '2024-11-02 07:41:23', '2024-11-02 08:41:23'),
('6814a2a25c994d51217d9c6cc7bf17fcde6499f5d942902d867d07392b86bd6b37344793be0cc2d3', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:33:41', '2024-11-02 07:33:41', '2024-11-02 08:33:41'),
('693d9c0d34bd7932665f724c5b42541712dd5b8c4a3dd9ebec582d3ea4d4ca5ca633ae2d124cc84a', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:24', '2024-11-02 07:41:24', '2024-11-02 08:41:24'),
('6a5245ac3f406a0ec3b8fc36f2d142cd42dac10e6a682a8c2610283b0e948afc8f4b8b0f7dac3aee', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:31', '2024-11-07 15:02:31', '2024-11-07 16:02:31'),
('6adb6a2937a684026fcaeccafcc44ccec5154863350eab519671a2419f957d54c8965252560b4202', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:25:38', '2024-11-03 11:25:38', '2024-11-03 12:25:38'),
('6d281210995fe564340c84d21253f185bb92e436a84bb84a5fc8bb2b8dda3f5d291b128d55ae20d0', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:43:33', '2024-11-05 08:43:33', '2024-11-05 09:43:33'),
('6d9bbca99299742dda55a06b5c08427c8d6d1a10f1a56772c1d39119f458f31989b19f90648a588a', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:08:23', '2024-11-05 09:08:23', '2024-11-05 10:08:23'),
('6fd4b682ecffef7b8ff480b604450865722262badfb2c51494db33d4a57916fe71c49a99a61c8c48', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:09:13', '2024-11-03 11:09:13', '2024-11-03 12:09:13'),
('6fff249db0e751966fe9a29ae1d381c5825859f5e4806f9fe1873446bd19ef66d74ac407926de0d1', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:16', '2024-11-02 07:41:16', '2024-11-02 08:41:16'),
('725fa2ab38833c0dcc0131b5f5183f004bc72e05bbd63ba7ab775985f39a43e2c68637deaa206169', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:22:42', '2024-11-07 15:22:42', '2024-11-07 16:22:42'),
('73067eff4fba530f6165552fceb757a8cd303d8efab4605a3cd86ce7cc54b454d41d7be368bf4b61', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:35:06', '2024-11-05 08:35:06', '2024-11-05 09:35:06'),
('7342a8675a28e02d9fc41c3327507cf38d92328dc13fa5606c827331e67d01a951ccb704901c923c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:58:04', '2024-11-02 07:58:04', '2024-11-02 08:58:04'),
('741bd111832460be94b700d0f326e49afd139c01d6c6a9f59ac2269aa75fc95912f2f204030f539c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:39', '2024-11-02 07:45:39', '2024-11-02 08:45:39'),
('74fb0d15e61517db32c1cec14b4690dbf6cb9f911157fbf1e6b95f616b17318a689fb34f4a32c51d', 2, 1, 'gallery', '[]', 0, '2024-11-03 10:55:22', '2024-11-03 10:55:22', '2024-11-03 11:55:22'),
('76a527a4f8aa7551840dcbf03f8d0acc1c4bc0dc6f4d995209d992310f020c26d3a46f950fa8747c', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:08:36', '2024-11-03 11:08:36', '2024-11-03 12:08:36'),
('78622c1b5800e79ded879370d98e747279afeaa6cb78cbfbfb06cd4dd1ed030a07ef3d63bffd8de1', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:38', '2024-11-02 07:45:38', '2024-11-02 08:45:38'),
('78635ce044c7452a2ebc28aba1bcbf026633d4ccdd1eb7c2b5be05c8fdb30541a583dac1d79bbb0a', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:25:27', '2024-11-07 15:25:27', '2024-11-07 16:25:27'),
('79647d976f7800cc02f902f36628842baa88079a7bda60985c30634a9c8bce1c4508d18ba82c1aca', 2, 1, 'gallery', '[]', 0, '2024-11-07 14:53:14', '2024-11-07 14:53:14', '2024-11-07 15:53:14'),
('7a2d5ac98d3d92ebf3c80438dddac7cf29692302ed15db6c7d077edc4852d1222ffe996f2d81e378', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:00:46', '2024-11-05 09:00:46', '2024-11-05 10:00:46'),
('7a8c6b0e7dc10865820e167f652957ba25de53cef084032bdd949564a437fb750dce036f6e8415b3', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('7b23fe0dca503902abb54e91c54cfc3b274ff21329aa86ddbf1ef1e445010e8d88fb77eed66bb005', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:28:54', '2024-11-03 11:28:54', '2024-11-03 12:28:54'),
('7b7a9d78725f7e036cb034deb70d0a284b350c9abe23a19a3a67c9b1a08e83fed1f76b8f1413fa85', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:14', '2024-11-02 07:46:14', '2024-11-02 08:46:14'),
('7ccb3dfac05e36848e27aaee614823ba754d0d66108f45fb183de4c1a545353cb86538d02263df12', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:06:01', '2024-11-05 09:06:01', '2024-11-05 10:06:01'),
('7f5d3c2c968439dc222902301e0ae354b8827758608d3bb2319e1cbb493a7563d80911d478dbe7af', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:08:28', '2024-11-07 15:08:28', '2024-11-07 16:08:28'),
('7fa5c2a21dd6c78f5fcde9560df1a69a519fe300ef866548c8432988f03621f7e7c5be8433bd6a84', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:24:38', '2024-11-07 15:24:38', '2024-11-07 16:24:38'),
('8013e3ef700c4d58bd9cac2deff2aa29ccc4e3a61fd5413a08ccbeff758776450509a51b76467c71', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:04:30', '2024-11-05 09:04:30', '2024-11-05 10:04:30'),
('80b7a4db5d94be63574009eea25695448cccae999fa07f8e787d446831d0c8a6be65ca4f807c61db', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:08:36', '2024-11-03 11:08:36', '2024-11-03 12:08:36'),
('80cdae53c4d3873fe8a0548c96c2978f27c9562c0a6f0dfe8e0ac88da22f741dc9a2b51e1a4d49f6', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:05:40', '2024-11-03 11:05:40', '2024-11-03 12:05:40'),
('824ad8c7367e38788017c5ac9f1e34cc73fbff998f0df12aad381f5a71963e54c54a59aa270fca48', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:27:47', '2024-11-03 11:27:47', '2024-11-03 12:27:47'),
('84b221eb4dff1f27c2a9a63560dcdb43625c0388c1541402054cf45bdadab3417db34d011cc575b4', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:25', '2024-11-07 15:02:25', '2024-11-07 16:02:25'),
('85c8fef66c3fe3a72f3bf17a291119ebfb0855731ca8aa8141459ea80fa043a8668754d253567ca3', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:42', '2024-11-03 11:34:42', '2024-11-03 12:34:42'),
('85ee6fbdf96ab50c0de7aadd1747f2097e83ba8ef9c10434026a13c180e5113b6a614f56877984a7', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:32:56', '2024-11-03 11:32:56', '2024-11-03 12:32:56'),
('8634c3d1c11783b8601c80001d8806074af7be2859b3dd6d704297ec2fdcf34738874b5ca3f76771', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:31:43', '2024-11-05 08:31:43', '2024-11-05 09:31:43'),
('86db1ece3623bcedb7ae5eefc2d6390d14f1103b47b0762cecc387868c226d8f6119988768931ad1', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:32:56', '2024-11-05 08:32:56', '2024-11-05 09:32:56'),
('8769951c6ca5f6a18b7fc17ddce78680f25c21eed7680db9f74ebc6f06273f676bd629e173a19dc0', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:03:43', '2024-11-05 09:03:43', '2024-11-05 10:03:43'),
('87cad7248c30b2b1560b3a89cfce0166c596c12890d08286b20055e6da2b490784aeb4d3a9534548', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:19', '2024-11-03 11:34:19', '2024-11-03 12:34:19'),
('87df68e0a54bb2d728c5fd9f8c469cad520b861bd56fea317345700b05066fd7c4be0e693748bb38', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:24:41', '2024-11-07 15:24:41', '2024-11-07 16:24:41'),
('88ad8dcf06e9b70409a737b8777b42343b40a73b857b4a1c6eabd93b9eb54d0ab8f41c6dc086d20b', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:36', '2024-11-07 15:27:36', '2024-11-07 16:27:36'),
('88d09379f6b0d39f66a06519aeba37d94661683b199194f0425aa2fda22f7f5a27aa331298071459', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:58:16', '2024-11-05 08:58:16', '2024-11-05 09:58:16'),
('8ab0fa39c089be21641c3a777f4da2f63039400a394dc0b74c3f636f18fe8346bc8f76e15779a95b', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:07', '2024-11-03 11:34:07', '2024-11-03 12:34:07'),
('8beb6b91798301e5e5f67f0088c60646a973a3f2176d81be2001c4f8f81ce905642764e4659f107a', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:28:08', '2024-11-03 11:28:08', '2024-11-03 12:28:08'),
('8bf64dbc87afdc11c838489f6d5d637e7ddf7836b441b19120029e915296a85851ee082275413696', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:30:28', '2024-11-03 11:30:28', '2024-11-03 12:30:28'),
('8ceb1c0edaf3c733cca54361c99d83d6a76c33bc2b3edb08eb4a04a6027476454ccb6bce7f857e5d', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:33:39', '2024-11-03 11:33:39', '2024-11-03 12:33:39'),
('8e5a35aa4b8d0daf17d423e478679cd058e50d51449c86057dd0643a1bfc4bfe866c86d5a766585d', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:23:19', '2024-11-07 15:23:19', '2024-11-07 16:23:19'),
('8ec724db2c76efdca0360f880284c58d887b9cb357201e4528fbbd9dbf367a04dc77cebe2e9d78c4', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:25:57', '2024-11-05 08:25:57', '2024-11-05 09:25:57'),
('8fed33795cca8baae3497a40bbe80e1b8ed6a91538eb71b87ee8cdf52425f914b979c1e943e13bea', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:16:56', '2024-11-05 09:16:56', '2024-11-05 10:16:56'),
('90d08d6a4e6823cfabf75912cea833b576369847760d5b7d20c5d5c34592096e137df91f5c318d10', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:05:39', '2024-11-03 11:05:39', '2024-11-03 12:05:39'),
('946abe10bb1a368e11dec6ab3cca373467523975106a76845401d7a4f4d4f830480dfd4d3a0cbb76', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:24', '2024-11-02 07:41:24', '2024-11-02 08:41:24'),
('95e413783a18500c5bc3903499cf42a0a00b4a804052476898348e2fcc93f864495a64976392fcc5', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:08:41', '2024-11-03 11:08:42', '2024-11-03 12:08:41'),
('98ba96a71432e7e4f0cb1119ffc214eda7404061275c53fd419154fb94bd3065fb870915ccea4097', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:49:19', '2024-11-05 08:49:19', '2024-11-05 09:49:19'),
('9938b2b45d4d521ae8cc9f512fe15b645b4e245a08d2aaa7a7db53d1b71831dfdadc425a550f6a1d', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:25:27', '2024-11-07 15:25:27', '2024-11-07 16:25:27'),
('99e1d99a1b02abc38926079bc619fe969918176d6c1ef78ce4a20594e6cb74e648b5502b4deedd9b', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:33:26', '2024-11-03 11:33:26', '2024-11-03 12:33:26'),
('9a059c31744c26c1f487d662a8d8095fd7e67b818d8d7f558ded4e5707f3a2619df35bdc161adadc', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:25:59', '2024-11-05 08:25:59', '2024-11-05 09:25:59'),
('9ba8f94ac580c5848c6a68e476e824eadad9a494b9b2255d5c6dd0d29f877bbc914c58f2a709938d', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:14', '2024-11-02 07:46:14', '2024-11-02 08:46:14'),
('9c3cab87f1c2a9afe55e6e6f8a52c3dd4827b34e2b81f1525479b9a51fdc926364b8c3c9ea58b237', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:34:29', '2024-11-03 11:34:29', '2024-11-03 12:34:29'),
('9c8763297841e0c3ceb52cb39ea128867854278f9e533ee9adcc5e9795122782581ea5c730a64dd9', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('9cbbce7507e12406c5128e262c0a2a0373d6eca6cb47439155d8eeccbad396ecd71388020379ce52', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:01', '2024-11-07 15:27:01', '2024-11-07 16:27:01'),
('9cc7738991a236a9bde8043fad87e06cbcb242e29b6ba5ad91074dd3df44f7e1e30ebaf04dccf0ec', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:05:56', '2024-11-07 15:05:56', '2024-11-07 16:05:56'),
('9cd3c5c9259f85d3e5e8c0927b3eeee05b5be6820577ff3f3dd89fc5e282ad7853d3839d222d5502', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:25:29', '2024-11-03 11:25:29', '2024-11-03 12:25:29'),
('9ce27874ce3899a67cc42a18d75850265e6b3af69d6c7d63010ced5c0316fc3f98cb9b8e9fa9c65f', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:32:39', '2024-11-03 11:32:39', '2024-11-03 12:32:39'),
('9e6578ae03931a770afd33b21a19cfaa465aee6edc449a84d2e3e576f24c7449ff069ca7fd231d3c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:40:33', '2024-11-02 07:40:33', '2024-11-02 08:40:33'),
('9e9be375dd8ad1d7aec433bd69f0fb470e1b288f84d6479764347e0340bd2587adcc200071ea92b3', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:01:36', '2024-11-05 09:01:36', '2024-11-05 10:01:36'),
('a1377bd8f85223f9b731f18ab1d2c8699365c1a720c793a44c05b1ec61121f6bedaf0136d5d05a73', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:31:15', '2024-11-03 11:31:15', '2024-11-03 12:31:15'),
('a1c0bc06439856e7d289eac69d3de4fe29904f7c9ebd1a39923b9700fe605af728b73b2798f222f0', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:55:53', '2024-11-05 08:55:53', '2024-11-05 09:55:53'),
('a1fa58cdfc2a6b0f97d540a3bd0517fc16800a99b4cff994074a18fa8589336425d0035614ff0d84', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:10:46', '2024-11-05 09:10:46', '2024-11-05 10:10:46'),
('a23f6ad75a3cb9ece48226389f24c802b18a6797688dfd66626a5e7c5549b3f6df4c8bfbf8b390ea', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:27:47', '2024-11-03 11:27:47', '2024-11-03 12:27:47'),
('a25a840492bdc5fecb0785dea08a3a5a14ff4d03fb56d9b2ea6deb888c3f07f8a8ce96f855bcb54f', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:15', '2024-11-02 07:46:15', '2024-11-02 08:46:15'),
('a28abe7f6549de765cf2236ae201e158570a6f0e05c4493092d18c7feeead141380fae8d00c97b8b', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:38', '2024-11-07 15:27:38', '2024-11-07 16:27:38'),
('a2c0e3c8ef559cb2a63b90be998d0c7c9c6e5faefd51ae567912426738abbcb19c30e4544decbe9a', 2, 1, 'gallery', '[]', 0, '2024-11-07 14:50:49', '2024-11-07 14:50:49', '2024-11-07 15:50:49'),
('a4a47e40563204e4fb23020ecb753b6316cf0d582ff0d9eea2d76d7fa96cfc99aebb811f406c41eb', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:28:03', '2024-11-07 15:28:03', '2024-11-07 16:28:03'),
('a5dae68e1e46b4f9ac3b120cf76c2c6b893863e456e49b8d8dec10229c6820bd2cf2b61dfdb397ee', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:57:29', '2024-11-05 08:57:29', '2024-11-05 09:57:29'),
('a66f3707dea0ca75cfd63a54b277f52963a67b6cd67983d3b10916c88ce99200d51d31a2f3905713', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:05:20', '2024-11-05 09:05:20', '2024-11-05 10:05:20'),
('a725418b9a381a61eb1d4bc0c059fd8444c5756ad723ab8d23e477157b99a6c5f326e30bdfc9051b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:02', '2024-11-02 07:41:02', '2024-11-02 08:41:02'),
('a791439299cdabad9bb0c56b36e4de548d5b58610353c97cdbde6908e5f36d2a476d8f2de74b777e', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:50:41', '2024-11-05 08:50:41', '2024-11-05 09:50:41'),
('a82b0b09cb647877814246efe3edc29924f03c5fefc6f06fe15fc0c2201df0bbd3e9d7b89ae485c9', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:01:38', '2024-11-07 15:01:38', '2024-11-07 16:01:38'),
('a89286b8bcae0bb8307450342c142db55aad76369d2961eb8c87dc754329a32551afed36ec205bbe', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:12:45', '2024-11-05 09:12:45', '2024-11-05 10:12:45'),
('aa09b3c1d6275d0d73bd629b3b240bbe701b03587925d1dfdcc9a1834757330af81c6058ba3e4d8e', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:54', '2024-11-02 07:45:54', '2024-11-02 08:45:54'),
('ab24d97842e79fc097771f1aba08f09dad72a9caf22329871cac805df64c080a600f34dabfe37f48', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:40:33', '2024-11-02 07:40:33', '2024-11-02 08:40:33'),
('abb45650fce9c4620356aa4cfa5e4a74aa6f1fa40e5a216ca908cde2831b32b71339f6bbaa1ddcc3', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:20:16', '2024-11-02 07:20:16', '2024-11-02 08:20:16'),
('abd1344182404732e57db64c1d876c52a71ae4447af036bd4ab1dfb9f016f6bdc09012e9663fc6cb', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:08:41', '2024-11-03 11:08:41', '2024-11-03 12:08:41'),
('acd626ed2fa9bd0704cedcbaeb08d049f45b064957184cab344ef2f415ffad017c95cae4c561ef4f', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:13:35', '2024-11-05 09:13:35', '2024-11-05 10:13:35'),
('afe0c2c95f85a5eeb4b55a76ac7db6521c96950706607513093c47c1a4a034dccbfc132482910910', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:25:35', '2024-11-03 11:25:35', '2024-11-03 12:25:35'),
('b00a3a7e7fe94d92fdd0e74772c2d92e250e334cdd6362af1fc6f6155bc42e1018f75a00edda3be1', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('b038d48a358753ecb473d289609f8b1fd961c5780ad55a9c19cccdfe4fd37a6c8e92037b73e8286f', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:05:06', '2024-11-05 09:05:06', '2024-11-05 10:05:06'),
('b03ef76d89e7f9d902a82e001c60aefea1d06ec0ca46b7bbe2de01bf03b8e6b19b131c2330e8dad0', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:23:23', '2024-11-05 08:23:23', '2024-11-05 09:23:23'),
('b0ca6de2a04d4b9b27f3ce95fc12fefece2b382c8cac13ebcd1f930e2de1bb28f60a02fef7c06441', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:11:12', '2024-11-03 11:11:12', '2024-11-03 12:11:12'),
('b13dae7fab632fc1d0097948c3178f8c89f25b6e40c3b792fe6305c72c07e40af41deb7c7bc6e3e7', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:26:12', '2024-11-07 15:26:12', '2024-11-07 16:26:12'),
('b2a46394bedf6e33df6e95020f2e0e824fdeddd355b9aea9e2acfce6ef5d5ef3292b99251927da27', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:39', '2024-11-02 07:45:39', '2024-11-02 08:45:39'),
('b4dec286f5ba681dbe65b18aa83f6b5e2f4eca213df5fcbdce7b99ae5725b29a92aeb1144fe05d96', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:05:39', '2024-11-03 11:05:39', '2024-11-03 12:05:39'),
('b4ee1e2f4a5a5b278178de1daaf64d3b372ace0b59f4871c0f36c66a20326952a85b7f827a699a39', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:54', '2024-11-02 07:45:54', '2024-11-02 08:45:54'),
('b5724a631283e673a5299b55be668374336edc675a33ec845b87c5b092fa8f3049560052e3986615', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:13:57', '2024-11-05 09:13:57', '2024-11-05 10:13:57'),
('b67b4ef6ff3fd3103993ba3895486521735255f15812690407d816dbf41a932be4de5b009cee1cbb', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:24:40', '2024-11-07 15:24:40', '2024-11-07 16:24:40'),
('b6c945709045519d7c3e4a7695559219e36c5d46c1e1af01db96c62e1ccefeef5067e8b0ffd615f7', 2, 1, 'gallery', '[]', 0, '2024-11-07 14:51:56', '2024-11-07 14:51:57', '2024-11-07 15:51:56'),
('b7165253ed669a246b08380ebe37b8399f9f9d8d30604e38ddf6c4673725baa5cdd62ac65f4f7215', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:30:56', '2024-11-03 11:30:56', '2024-11-03 12:30:56'),
('b7af1c7098dc179bfa92f73714aad343b84c43a0589a42773c45105e1801d579e5bdbd253b1578ef', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:48:45', '2024-11-05 08:48:45', '2024-11-05 09:48:45'),
('ba3f055ed8e02026d957f47286ddab8e977b2fc6e3faef2854d705115d065810653d74b2c77f9d04', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:06:33', '2024-11-05 09:06:33', '2024-11-05 10:06:33'),
('ba825fa378c6fb6917efd68ebcf3b20dd4865ea44b6940700e109a5e59872b9044e55b4983230a61', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:21:46', '2024-11-07 15:21:46', '2024-11-07 16:21:46'),
('bb5c9f862ac0007c029ab758d488d3a5ba86ec37d872d2849586a85192e0dbc2ece057b460692c83', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:11:32', '2024-11-05 09:11:32', '2024-11-05 10:11:32'),
('bbfb5fd13c848905476b80f8477a20a63ba6340b22cbf8d177ec7d075b0e0be7c8d9de5ba7513a9f', 2, 1, 'gallery', '[]', 0, '2024-11-01 12:31:08', '2024-11-01 12:31:08', '2024-11-01 13:31:08'),
('bcc4ec504dbe7a3b94f6fc4f2478e102d8ae86a98f9d950533553c0aeec9ba09d12afbd550293d56', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:31:55', '2024-11-03 11:31:55', '2024-11-03 12:31:55'),
('bcd376bf153435471f0007337241912849ad3007f4c7e805a9cc40cd73f07c313a108cb60a051604', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:53', '2024-11-02 07:45:53', '2024-11-02 08:45:53'),
('bffd2d07e9a6a023316190269bd5084a4c97a4b9f63ab89c7a38793cb9c9dd17dc8f1c6434bee7ef', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:14:28', '2024-11-05 09:14:28', '2024-11-05 10:14:28'),
('c0b23e7c1ea5225c1bff74ad71dc7972c4388ca560e1829e91929daba19b98efe3469e45feaef59e', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:09:10', '2024-11-03 11:09:10', '2024-11-03 12:09:10'),
('c474ef19fa70cfd43e883c4f9e4026397682780937d5b420ab54b5a2ec4a8e7ae1e2201511cb9e85', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:16:57', '2024-11-05 09:16:58', '2024-11-05 10:16:57'),
('c477842c02b3611fbe5a0c028dfd7fc5160ddbe31305df0a4965a4c412d2a166b85a68628ea08360', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:36', '2024-11-07 15:27:36', '2024-11-07 16:27:36'),
('c73124307747e54b17d7589a687386fd5d11a7d56158abb248a2b138ad9acbc07dc6b2a697c43103', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:36', '2024-11-07 15:02:36', '2024-11-07 16:02:36'),
('c7974855081e2d75b93fda612536e10f4c6a0867a1cdd027864297488e2b38e6318fd9ec56fe52b0', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:23', '2024-11-07 15:27:23', '2024-11-07 16:27:23'),
('c8156796511c3d2bfb0f354e94ee42df35cf64a8ac466746afa294aa87eff2fb07e092637a16e8a1', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:10', '2024-11-02 07:41:10', '2024-11-02 08:41:10'),
('c85fe2ca5155455cdda7817bcc3c4d886327f0ec82f9b36afc3f3e5fcba46aa59eb9d7222b937d06', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:58:04', '2024-11-02 07:58:04', '2024-11-02 08:58:04'),
('caab374431daca20df5cf35f26c4e493b440d4b120d3a58933ab970d0890b26a4b4ef7ef88c7243a', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:07:08', '2024-11-07 15:07:08', '2024-11-07 16:07:08'),
('cac537b4a51ff81ee8da1375d31219a20362f7e8ff3122573d2bc7273b3d34e426ed104739856a90', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:11:12', '2024-11-03 11:11:12', '2024-11-03 12:11:12'),
('cafd4eb436b279fcde43a67249279675665d9aa1edbc1e1550054c4fba00305b306e5deb2fb63b12', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:11:01', '2024-11-03 11:11:01', '2024-11-03 12:11:01'),
('cb0541bc2c6e57450c2efa7c1fb9013cd61fb1b4d616579702dc80742e5f8b983d634763fcc31e57', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:13:07', '2024-11-03 11:13:07', '2024-11-03 12:13:07'),
('cbc8902a40cff399cf7476bffe79b7c6ff50da782ed2b36cdaa3a57996e6ba967480e129ac7fb6c5', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:58:37', '2024-11-05 08:58:37', '2024-11-05 09:58:37'),
('cbdc4a4a42148ec29dfc08af7eef3d3dcbcf242ba173bf5fc399eb432de552143fe601b5a69e1c44', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('cd22e20f288448b40158cb0f71927326562247b275dcf87241b0f3e63dccf29fff7a08b9c84ba76c', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:08:46', '2024-11-07 15:08:46', '2024-11-07 16:08:46'),
('cd5d7f7c65ee9f588b239ba9369a7dc3ee40d86feb94ea9e50d655a545781f7f11781bb45d078e76', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02'),
('cde08f0df0b3864f108d63efa494c69eb7ffb0859c2955563bb39af9ab457f9b0f4ffb40eda8977e', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:08', '2024-11-07 15:02:08', '2024-11-07 16:02:08'),
('cf1748377f4e84186ce1926b52576a680aab27262509df460cbd6c97a1bff93bb6d01b519c28217d', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:48:55', '2024-11-05 08:48:55', '2024-11-05 09:48:55'),
('cffcb94aa113cc4131f8edd8738677d18f7341771d221830513bccc65de798a87337e660c5b7de2b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:06', '2024-11-02 07:45:06', '2024-11-02 08:45:06'),
('d013d0030b2c2c622e38bd042a5e645457c4a9f1d5c2ca30560dbe5518085f0025ac9709481b0692', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:09:00', '2024-11-03 11:09:00', '2024-11-03 12:09:00'),
('d154508a5df899464454a031b003b66913c5fef899939681f91a4dfdc10ac64665a2d33ffc2e0480', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:56', '2024-11-07 15:27:56', '2024-11-07 16:27:56'),
('d1a6f310ddea507dccada12b508ef27e0bdeda02b45d68c226e202fc283dbd129fb8ee363295bfb6', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:36:08', '2024-11-02 07:36:08', '2024-11-02 08:36:08'),
('d1af1daf25ae61ba56ea6428eceb199d9087624e3c27a9a25ce98c8579c3bc60dd4381301f7f5e6c', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:22:40', '2024-11-07 15:22:40', '2024-11-07 16:22:40'),
('d262e262384824f62b93b6cc1428eb6378da45bcb99608cba4e7d13df72ce4f302cf90c4dff2ff0c', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:26:46', '2024-11-03 11:26:46', '2024-11-03 12:26:46'),
('d2bd451499d8053d7030c774dfcf18daa7bb287c17c06b7f702a683fa6ee3817ca6007532229c5fa', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:07:01', '2024-11-07 15:07:01', '2024-11-07 16:07:01'),
('d2e1c7b09e4bd5a8e9ed4a9ade50b011df7a8c5a93b009bbb4c036364205d434099536fc06cf0f15', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:30:12', '2024-11-03 11:30:12', '2024-11-03 12:30:12'),
('d4407ecfbde2eb551a5c61041e00f09ec4498b4e346c0dbcc9378ca0ac7538ac6c6badbfe3da2042', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:40:21', '2024-11-02 07:40:21', '2024-11-02 08:40:21'),
('d5896b282e7a04bc6a89c71769d6ef73a73648903e34b226a36271d46a1dfd9f6a609c4614f026e9', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:28:10', '2024-11-07 15:28:10', '2024-11-07 16:28:10'),
('d5cc21618e655c5980d3d5ffab9b2fd49c3a84c8cbcd63c816230c07bab51c049311849e3aa67e8d', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:38', '2024-11-07 15:27:38', '2024-11-07 16:27:38'),
('d643eebc27eeea4b33c01e196edcc6e9665dfd50a2375b369a11287fb17ddd1957a3ece0b0374103', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:25:33', '2024-11-03 11:25:33', '2024-11-03 12:25:33'),
('d84ce6951cdc14030cb3c4f5cf112cfcf911149dfe645e72a9b9a852f600373b5a5bb891c3252046', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:28:10', '2024-11-03 11:28:10', '2024-11-03 12:28:10'),
('d90ec48631530dd41557621f748d963f3d0a07d6c4507bc655eeadd60fa683f6078242097d254ad1', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:06:16', '2024-11-07 15:06:16', '2024-11-07 16:06:16'),
('d9c5ee8345f0206f2a720c6bf981582665a30596e89934fbd6c5618dfea8b9f1f4ef9d5da036bdd0', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:54', '2024-11-02 07:45:54', '2024-11-02 08:45:54'),
('dcf9fd7643eafaf938b31669e18347cae60ef207915cf8b2bf19861e89fdc669d45d766917764092', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:00', '2024-11-02 07:41:00', '2024-11-02 08:41:00'),
('de7fc5687af2bf64528f5df7f40f5b8b86902a0ef77090c3cf93cd32bcce6f98b8bce44da146472b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:32:23', '2024-11-02 07:32:23', '2024-11-02 08:32:23'),
('df2788b15f69c7b50b1bf5d838c9e58f3bd53de5c70503d01954fa3496843480bb39f04d7513588e', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02'),
('dfcca4d84d0c2048f2c74e818a970a75cdccacdc89cd705fb2ceda3ee9cd29260356a1d27d2cc634', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:40:33', '2024-11-02 07:40:33', '2024-11-02 08:40:33'),
('e003c09b3386d72eabc4c36532b0f9c09295df8829946936dde08f354df6ecef6cad1be03f01e32b', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:01:20', '2024-11-05 09:01:20', '2024-11-05 10:01:20'),
('e1141e4c88298201b1f017e9ec00526d0da1c13f3747106b09e06f9c8caacc3d8a02fa30a0949a3b', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:45:39', '2024-11-02 07:45:39', '2024-11-02 08:45:39'),
('e1d95d114efcd21595db72bb8a678b651e356d11d22e0472348c85ec9d67fda7f758a6f2bd4f7782', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:25:59', '2024-11-05 08:25:59', '2024-11-05 09:25:59'),
('e3fd8d7026b0736d7575cdab97e05c8861699f29f854f395ab314132007bdae81419d6e6a556fb26', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:46:14', '2024-11-02 07:46:14', '2024-11-02 08:46:14'),
('e73dd54d935ad57ba286f8f20fe1b8555a163a6a981f58b4f4bbe9709f7344b8145cdfc0e098f671', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:23:18', '2024-11-07 15:23:19', '2024-11-07 16:23:18'),
('e8e6babc0ac053d89373c606689c3f9c631f3b99abae5c6dd94d2c9562acbd421c5b2e9cb99287bb', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:02:07', '2024-11-05 09:02:07', '2024-11-05 10:02:07'),
('e99e73fcf5b76f05ea2e569606cd7cc7c821c88d41ca3cff7cfad4580ec7ce500746ae986182ce5d', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:16', '2024-11-02 07:41:16', '2024-11-02 08:41:16'),
('ec6970924bf595f5309c53e5f88ea3c17877417d27bea2139b64f1ba62f3acc84d04336e9797274c', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:03', '2024-11-02 07:41:04', '2024-11-02 08:41:03'),
('eced159d79180a54593ea99ef2519c80223b48a17b76176598c046566d26596f80f30ff93a53b280', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:33:08', '2024-11-03 11:33:08', '2024-11-03 12:33:08'),
('edede37b11e0ede212aa5c400364c59bcad310c76176d14ffe7810b04cfabcdf385e24aa6bcb10c8', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:32:46', '2024-11-05 08:32:46', '2024-11-05 09:32:46');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('edfb8d47bae720715863dc5345a56dcef21e23f144067508716e1841cbb557de47129f77a50efdd3', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:15:22', '2024-11-05 09:15:22', '2024-11-05 10:15:22'),
('ee5546e189fd01b715d88c7c6a69bbc82f7ed5436da05b6ad29d755de19103be7ccc38746e8ed46c', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:41', '2024-11-07 15:27:41', '2024-11-07 16:27:41'),
('eeb43f28f5139a9e463175e8423b6cb0638dae94f3f30c4020176455e5bdec3e5b930f9737b96538', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:08:38', '2024-11-05 09:08:38', '2024-11-05 10:08:38'),
('eedf35401ebb657f1fa7c152748adfe7d7804539e499175c45f9f85502cb4b08c532ed36cf1b9587', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:00', '2024-11-07 15:02:00', '2024-11-07 16:02:00'),
('eefcb7bf1c490c80f91ac61361b8deb6b539bd57a4c4518f05bdc3a0075c7e3710c2f63b81a04e75', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:13:06', '2024-11-05 09:13:06', '2024-11-05 10:13:06'),
('ef0246188853bc40caae7b4208da65b1be56c965402f53a3898a21dfbd172666ceaaacdd5974ac61', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:25:36', '2024-11-03 11:25:36', '2024-11-03 12:25:36'),
('ef338b87696c87c587e304fccc442c20ecd85a13a7b8c274be146cce3c67ca9cfaa85ab667c8d37e', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:05:39', '2024-11-07 15:05:39', '2024-11-07 16:05:39'),
('ef95f16f1d34dc254ee74ea6a88dd01f2eb5ab218ba0557cbd9f3b573857165d5f455f0ca6bde50b', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:11:25', '2024-11-05 09:11:25', '2024-11-05 10:11:25'),
('f0b6883cdbaa6a7253fe8bee120709040fbc0b14b6fa5e46c7ebab06ecd8416d448b22c992cb8fae', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:07:04', '2024-11-07 15:07:04', '2024-11-07 16:07:04'),
('f149627399d3058bcbcedfeae85ab8c6dbce093bdbbaacf9968f9de41dd6f3f51f627b99b9b1d15c', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:03:15', '2024-11-05 09:03:15', '2024-11-05 10:03:15'),
('f1533e0df2c0f6ca5cfe5541a4d86ae6be9b58ff0b5b867c6507d0cac6d1fde8a059994a46d52715', 2, 1, 'gallery', '[]', 0, '2024-11-07 14:49:11', '2024-11-07 14:49:11', '2024-11-07 15:49:11'),
('f35d35129952fe44cf0bd381ea81fbc7e70be242f8e2ae024bf4cb83f1d86ce74ec33aa21dee5a8c', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:07:21', '2024-11-05 09:07:21', '2024-11-05 10:07:21'),
('f4fed5fb04228387f81cc743808408f5724f09df944ec0f814ace2d9f78435d28b926de57c8c361a', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:43:08', '2024-11-05 08:43:08', '2024-11-05 09:43:08'),
('f5f8a3b30c5b85c9b2db98ec2d227b148c5fc3a235e71c12af136d0f55a347c32a50f0ea788b8629', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:24:40', '2024-11-07 15:24:40', '2024-11-07 16:24:40'),
('f6fba87e28871c68836a40710c9d7e70c6d338990a91aaa145288b6e3f25a1953c82639a7ba4ed83', 2, 1, 'gallery', '[]', 0, '2024-11-03 10:55:20', '2024-11-03 10:55:20', '2024-11-03 11:55:20'),
('f729c86ad3cf8a90e67c81b5d3d0226f8f36c45a23503db4a992e0c7019ea139b1ac6d273b3e656b', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:33:13', '2024-11-03 11:33:13', '2024-11-03 12:33:13'),
('f768e5aa5ad642b666d20de77cac929064aa1d03162089c5c98b46a2aa40da28ff87c67e12e14778', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:58:04', '2024-11-02 07:58:04', '2024-11-02 08:58:04'),
('f7a8de2e670bdfcab74d9d98a26815a8005b2ac0a7381ddd26ed9bad2193f1a580514dbdf6948067', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:03', '2024-11-02 07:55:03', '2024-11-02 08:55:03'),
('f9d7faa4e11990a9249be1369b5670fd1ceb832e1cbafd8014fd5047da52bf35e1255099b7fe7414', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:22:40', '2024-11-07 15:22:40', '2024-11-07 16:22:40'),
('fad16a4ee7980014a756fa27c20961dd094d9504dbc9d68df74088aea7df76968c0a348fbad1e2e6', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:27:23', '2024-11-07 15:27:23', '2024-11-07 16:27:23'),
('fb6a320339c73dad9229068129bd36fbb57792c323edbe6b11377b1c76d926bf74e7de5f89635343', 2, 1, 'gallery', '[]', 0, '2024-11-07 14:50:44', '2024-11-07 14:50:44', '2024-11-07 15:50:44'),
('fb820aa8d28b10f10229884ef3b1dfc8f47197104051f7bc7e52fbd2e3054e8cf155b1f58d1da594', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:41:00', '2024-11-02 07:41:00', '2024-11-02 08:41:00'),
('fb839be027dbac62650c03b45fe2ce8727496220ab25d473c954ba938a983e592112ba7ec13daf0c', 2, 1, 'gallery', '[]', 0, '2024-11-07 15:02:25', '2024-11-07 15:02:25', '2024-11-07 16:02:25'),
('fc230be846a498eb2cbce857dd23253c398d2ec925470857abea97e4ad956522662b3773b9469050', 2, 1, 'gallery', '[]', 0, '2024-11-05 08:58:55', '2024-11-05 08:58:55', '2024-11-05 09:58:55'),
('fc2ea3ab0866735d07d1c9234668482cfc9841f0ccd3758917a6c7fd1dabeda0d13ec0adeba9072e', 2, 1, 'gallery', '[]', 0, '2024-11-03 11:09:00', '2024-11-03 11:09:00', '2024-11-03 12:09:00'),
('fc4592b92db13f41c1d3b32fb6513f3599ba3304bf022e962b37f7161ed60a0b09ea4a6f5e6e4d2f', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:12:52', '2024-11-05 09:12:52', '2024-11-05 10:12:52'),
('fcda35f31f94f5c1e56ce9a680192cf90e0bd2007e24edb4c4a2fb09ad8d543fd4c488fa8b1beb60', 2, 1, 'gallery', '[]', 0, '2024-11-02 07:55:02', '2024-11-02 07:55:02', '2024-11-02 08:55:02'),
('fcf72391c72431c45a183b3d079b49350fc4dd879b1fed6a3e1488354eb9c0b785ce4065c82b5bc9', 2, 1, 'gallery', '[]', 0, '2024-11-05 09:14:17', '2024-11-05 09:14:17', '2024-11-05 10:14:17');

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
  MODIFY `img_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
