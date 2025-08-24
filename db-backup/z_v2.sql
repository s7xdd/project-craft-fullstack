-- phpMyAdmin SQL Dump
-- version 5.2.2deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 23, 2025 at 06:10 AM
-- Server version: 11.8.2-MariaDB-1 from Debian
-- PHP Version: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `z_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `abilities`
--

CREATE TABLE `abilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `entity_id` bigint(20) UNSIGNED DEFAULT NULL,
  `entity_type` varchar(191) DEFAULT NULL,
  `only_owned` tinyint(1) NOT NULL DEFAULT 0,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `country_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `longitude` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `latitude` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `set_default` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `type`, `name`, `address`, `country_id`, `state_id`, `city_id`, `country_name`, `state_name`, `city`, `longitude`, `latitude`, `postal_code`, `phone`, `set_default`, `created_at`, `updated_at`) VALUES
(2, 50, 'others', 'Jisha Renjith Ravi', 'Al Dorrah building', 229, 3798, NULL, 'United Arab Emirates', 'Dubai', 'Al Nahda', '55.374681499', '25.2750441', NULL, '971568650838', 0, '2024-02-15 21:31:56', '2024-02-15 21:58:13'),
(3, 50, 'work', 'Jisha P', 'Tomsher technology, ML 5, Wafi Residence, DHCC', 229, 3798, NULL, 'United Arab Emirates', 'Dubai', 'DHCC', '55.3874681499', '25.2850448', NULL, '971568650838', 1, '2024-02-15 21:37:54', '2024-02-15 21:58:13'),
(5, 58, NULL, 'Jisha P', 'Wafi residence,\r\nDubai Healthcare City', NULL, NULL, NULL, NULL, NULL, 'DHC', NULL, NULL, '00000', '1122334455', 0, '2024-12-13 21:55:16', '2024-12-13 21:55:16'),
(6, 63, NULL, 'mn', 'bm mbmn m, ,m', NULL, NULL, NULL, NULL, NULL, 'hb mnm', NULL, NULL, NULL, '1234567893', 0, '2024-12-18 22:37:11', '2024-12-18 22:37:11'),
(7, 60, NULL, 'Test', 'Dhejejzhjwjj', NULL, NULL, NULL, NULL, NULL, 'Dxb', NULL, NULL, NULL, '74568152460', 1, '2024-12-20 16:30:49', '2024-12-20 16:31:45'),
(8, 60, NULL, 'Dhjsnmak', 'Bbxbnxjsjjj', NULL, NULL, NULL, NULL, NULL, 'Avbnann', NULL, NULL, NULL, '21548709354', 0, '2024-12-20 16:37:49', '2024-12-20 16:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Header', '2025-08-23 05:16:57', '2025-08-23 09:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_items`
--

CREATE TABLE `admin_menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `class` varchar(255) DEFAULT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_translations`
--

CREATE TABLE `app_translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `lang_key` varchar(255) DEFAULT NULL,
  `lang_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(5, 'Size', 1, '2024-11-04 17:33:37', '2024-11-04 17:38:16'),
(6, 'Color', 1, '2024-11-04 18:10:34', '2024-11-04 18:10:34'),
(7, 'test', 1, '2025-08-23 09:46:11', '2025-08-23 09:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_category`
--

CREATE TABLE `attribute_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` bigint(20) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `attribute_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(2, 5, 'Size', 'en', '2024-11-04 17:33:37', '2024-11-04 17:38:16'),
(3, 5, 'حجم', 'ae', '2024-11-04 17:35:39', '2024-11-04 17:38:19'),
(4, 6, 'Color', 'en', '2024-11-04 18:10:34', '2024-11-04 18:10:34'),
(5, 6, 'لون', 'ae', '2024-11-04 18:12:27', '2024-11-04 18:12:27'),
(6, 7, 'test', 'en', '2025-08-23 09:46:11', '2025-08-23 09:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `is_active`, `created_at`, `updated_at`) VALUES
(10, 5, 1, '2024-11-04 17:45:40', '2024-11-04 17:45:40'),
(12, 5, 1, '2024-11-04 17:50:56', '2024-11-04 17:53:39'),
(13, 5, 1, '2024-11-04 17:53:17', '2024-11-04 17:53:17'),
(14, 5, 1, '2024-11-04 18:09:32', '2024-11-04 18:09:32'),
(15, 6, 1, '2024-11-04 18:10:42', '2024-11-04 18:10:42'),
(16, 6, 1, '2024-11-04 18:10:47', '2024-11-04 18:10:47'),
(17, 6, 1, '2024-11-04 18:10:55', '2024-11-04 18:10:55'),
(18, 7, 1, '2025-08-23 09:46:20', '2025-08-23 09:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value_translations`
--

CREATE TABLE `attribute_value_translations` (
  `id` int(11) NOT NULL,
  `attribute_value_id` int(11) NOT NULL,
  `lang` varchar(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `attribute_value_translations`
--

INSERT INTO `attribute_value_translations` (`id`, `attribute_value_id`, `lang`, `value`, `created_at`, `updated_at`) VALUES
(1, 10, 'en', '2.5', '2024-11-04 21:45:40', '2024-11-04 21:49:26'),
(3, 12, 'en', '2.6', '2024-11-04 21:50:56', '2024-11-04 21:50:56'),
(4, 13, 'en', '2.7', '2024-11-04 21:53:17', '2024-11-04 21:53:17'),
(5, 10, 'ae', 'مقاس 2.5', '2024-11-04 22:00:04', '2024-11-04 22:00:04'),
(6, 14, 'en', '2.8', '2024-11-04 22:09:33', '2024-11-04 22:09:33'),
(7, 15, 'en', 'Gold', '2024-11-04 22:10:42', '2024-11-04 22:11:30'),
(8, 16, 'en', 'Silver', '2024-11-04 22:10:47', '2024-11-04 22:10:47'),
(9, 17, 'en', 'Rose Gold', '2024-11-04 22:10:55', '2024-11-04 22:10:55'),
(10, 15, 'ae', 'ذهب', '2024-11-04 22:11:21', '2024-11-04 22:11:21'),
(11, 16, 'ae', 'فضي', '2024-11-04 22:11:48', '2024-11-04 22:11:48'),
(12, 17, 'ae', 'الذهب الوردي', '2024-11-04 22:12:05', '2024-11-04 22:12:05'),
(13, 18, 'en', 'tws', '2025-08-23 05:46:20', '2025-08-23 05:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `link_type` varchar(191) DEFAULT NULL,
  `link_ref` varchar(191) DEFAULT NULL,
  `link_ref_id` int(11) DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `link_type`, `link_ref`, `link_ref_id`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Banner 1', 'external', 'external', NULL, 'https://www.google.com', 1, '2024-11-13 16:04:43', '2024-11-19 14:26:54'),
(2, 'Banner 2', 'product', 'product', 30, NULL, 1, '2024-11-13 16:52:40', '2024-11-20 18:06:42'),
(4, 'center', 'category', 'category', 1, NULL, 1, '2024-11-21 13:13:18', '2024-11-21 13:13:18'),
(5, 'mid 1', 'product', 'product', 30, NULL, 1, '2024-11-21 14:08:53', '2024-11-21 14:08:53'),
(6, 'mid 2', 'product', 'product', 32, NULL, 1, '2024-11-21 14:09:12', '2024-11-21 14:09:12'),
(7, 'mid 3', 'category', 'category', 2, NULL, 1, '2024-11-21 14:09:32', '2024-11-21 14:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `banner_translations`
--

CREATE TABLE `banner_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `banner_id` bigint(20) UNSIGNED NOT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `mobile_image` int(11) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `btn_text` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_translations`
--

INSERT INTO `banner_translations` (`id`, `banner_id`, `lang`, `image`, `mobile_image`, `title`, `sub_title`, `btn_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 73, 73, 'Necklaces & Body Jewels', 'We\'ve discovered a better than ever cream foundation for light', NULL, '2024-11-13 16:04:43', '2024-11-25 15:39:04'),
(2, 1, 'ae', 26, 28, 'Jewels', 'Best Buy', 'View', '2024-11-13 16:50:35', '2024-11-30 23:44:12'),
(3, 2, 'en', 74, 74, 'Jewelry & Charm Rings', 'We\'ve discovered a better than ever cream foundation for light', 'Button Text Banner 22222', '2024-11-13 16:52:40', '2024-11-25 15:40:00'),
(4, 2, 'ae', 22, 47, 'Jewelry & Charm Rings', 'Best Buy', 'View', '2024-11-13 16:56:43', '2024-11-30 23:44:55'),
(6, 4, 'en', 75, 75, NULL, NULL, NULL, '2024-11-21 13:13:18', '2024-11-21 13:13:18'),
(7, 5, 'en', 77, 77, NULL, NULL, NULL, '2024-11-21 14:08:53', '2024-11-21 14:08:53'),
(8, 6, 'en', 76, 76, NULL, NULL, NULL, '2024-11-21 14:09:12', '2024-11-21 14:09:12'),
(9, 7, 'en', 78, 78, NULL, NULL, NULL, '2024-11-21 14:09:33', '2024-11-21 14:09:33'),
(10, 5, 'ae', 77, 77, 'mid 1', 'mid 1', 'Submit', '2024-11-30 23:41:20', '2024-11-30 23:41:20'),
(11, 6, 'ae', 76, 76, 'mid 2', 'mid 2', 'Submit', '2024-11-30 23:42:42', '2024-11-30 23:42:42'),
(12, 7, 'ae', 78, 78, 'mid 3', 'mid 3', 'Submit', '2024-11-30 23:43:31', '2024-11-30 23:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `winner` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `product_id`, `user_id`, `amount`, `winner`, `created_at`, `updated_at`) VALUES
(1, 42, 58, 160000.00, 0, '2024-12-13 22:49:42', '2024-12-13 22:49:42'),
(2, 42, 56, 160001.00, 0, '2024-12-14 18:02:42', '2024-12-14 18:02:42'),
(3, 42, 63, 500000.00, 0, '2024-12-18 22:17:30', '2024-12-18 22:17:30'),
(4, 42, 63, 500002.00, 0, '2024-12-18 22:18:35', '2024-12-18 22:18:35'),
(5, 42, 63, 500005.00, 0, '2024-12-18 22:18:51', '2024-12-18 22:18:51'),
(6, 42, 60, 800000.00, 0, '2024-12-20 17:07:34', '2024-12-20 17:07:34'),
(7, 42, 63, 900000.00, 1, '2024-12-20 17:14:59', '2024-12-20 22:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ar_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `blog_date` date DEFAULT NULL,
  `seo_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(100) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `slug`, `title`, `ar_title`, `content`, `ar_content`, `image`, `status`, `blog_date`, `seo_title`, `seo_description`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `keywords`, `meta_image`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 'Al-Douri-Group-participated-in-Anuga-2019-3', 'Al Douri Group, participated in Anuga 2019', 'شاركت مجموعة الدوري في معرض أنوجا 2019arabic', '<p>Al Douri Group is proud to announce its participation at Anuga 2019, one the world&rsquo;s largest trade fair for food and beverages. The food fair will take place from 5th &ndash; 9th October 2019 in Cologne and will welcome more than 7,000 exhibitors and about 165,000 visitors from 198 countries. In addition, this year Anuga celebrates its 100th anniversary!!!!!</p>', '<p>تفتخر مجموعة الدوري بإعلان مشاركتها في معرض أنوجا 2019، أحد أكبر المعارض التجارية للأغذية والمشروبات في العالم. سيقام معرض الأغذية في الفترة من 5 إلى 9 أكتوبر 2019 في كولونيا وسيستقبل أكثر من 7000 عارض وحوالي 165000 زائر من 198 دولة. بالإضافة إلى ذلك، تحتفل أنوجا هذا العام بالذكرى المئوية لتأسيسها!!!!!!</p>', '14', 1, '2023-10-20', 'Meta Title 2019', 'Meta description 2019', 'OG Title 2019', 'OG Description 2019', 'Twitter Title 2019', 'Twitter Description 2019', 'Keywords 2019', '14', NULL, NULL, '2024-02-20 16:22:45', '2024-02-20 17:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `added_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `is_active`, `added_by`, `created_at`, `updated_at`) VALUES
(1, 'Harry Winston', 1, NULL, '2024-10-26 15:04:37', '2024-11-21 14:15:58'),
(2, 'Graff', 1, NULL, '2024-11-13 16:59:57', '2024-11-21 14:16:24'),
(3, 'Cartier', 1, NULL, '2024-11-21 14:17:07', '2024-11-21 14:17:07'),
(4, 'Tiffany & co', 1, NULL, '2024-11-21 14:17:48', '2024-11-21 14:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `brand_translations`
--

CREATE TABLE `brand_translations` (
  `id` bigint(20) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo` int(11) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `og_title` varchar(191) DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `twitter_title` varchar(191) DEFAULT NULL,
  `twitter_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `brand_translations`
--

INSERT INTO `brand_translations` (`id`, `brand_id`, `lang`, `name`, `slug`, `logo`, `meta_title`, `meta_description`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Harry Winston', 'harry-winston', 70, 'Meta Title en', 'Meta Description en', 'OG Title en', 'OG Description en', 'Twitter Title en', 'Twitter Description en', 'Meta Keywords en', '2024-10-26 15:04:37', '2024-11-21 14:15:58'),
(2, 1, 'ae', 'العلامة التجارية 1', 'alaalam-altgary-1', 70, 'Meta Title ar', 'Meta Description ar', 'OG Title ar', 'OG Description ar', 'Twitter Title ar', 'Twitter Description ar', 'Meta Keywords ar', '2024-10-26 16:07:00', '2024-11-21 14:16:05'),
(3, 2, 'en', 'Graff', 'graff', 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-13 16:59:57', '2024-11-21 14:16:24'),
(4, 2, 'ae', 'جراف', 'graf', 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-21 14:16:41', '2024-12-04 22:02:28'),
(5, 3, 'en', 'Cartier', 'cartier', 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-21 14:17:07', '2024-11-21 14:17:07'),
(6, 3, 'ae', 'Cartier', 'cartier', 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-21 14:17:19', '2024-11-21 14:17:19'),
(7, 4, 'en', 'Tiffany & co', 'tiffany-co', 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-21 14:17:48', '2024-11-21 14:17:48'),
(8, 4, 'ae', 'Tiffany & co', 'tiffany-co', 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-21 14:18:01', '2024-11-21 14:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  `lang` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `lang`, `created_at`, `updated_at`) VALUES
(2, 'system_default_currency', '29', NULL, '2018-10-16 08:36:58', '2023-05-30 15:22:19'),
(3, 'currency_format', '1', NULL, '2018-10-17 10:01:59', '2018-10-17 10:01:59'),
(4, 'symbol_format', '3', NULL, '2018-10-17 10:01:59', '2023-06-14 17:48:44'),
(5, 'no_of_decimals', '2', NULL, '2018-10-17 10:01:59', '2023-07-08 14:34:41'),
(52, 'guest_checkout_active', '1', NULL, '2020-01-22 15:36:38', '2020-01-22 15:36:38'),
(53, 'facebook_pixel', '0', NULL, '2020-01-22 19:43:58', '2020-01-22 19:43:58'),
(57, 'shipping_type', 'flat_rate', NULL, '2020-07-01 20:49:56', '2023-07-12 01:14:15'),
(62, 'google_recaptcha', '0', NULL, '2020-08-17 14:13:37', '2020-08-17 14:13:37'),
(70, 'contact_address', NULL, NULL, '2020-11-16 15:26:36', '2020-11-16 15:26:36'),
(71, 'contact_phone', '+971 50 792 4960', NULL, '2020-11-16 15:26:36', '2023-05-30 09:02:58'),
(72, 'contact_email', 'info@industrytechstore.com', NULL, '2020-11-16 15:26:36', '2023-05-30 09:02:58'),
(76, 'frontend_copyright_text', '© 2023 ITS All Rights Reserved | WEBSITE BY TOMSHER', NULL, '2020-11-16 15:26:36', '2020-11-16 15:26:36'),
(77, 'show_social_links', 'on', NULL, '2020-11-16 15:26:36', '2023-05-25 11:57:51'),
(78, 'facebook_link', 'https://www.facebook.com/', NULL, '2020-11-16 15:26:36', '2024-02-09 17:51:44'),
(79, 'twitter_link', 'https://twitter.com/?lang=en', NULL, '2020-11-16 15:26:36', '2024-02-09 17:51:44'),
(80, 'instagram_link', 'https://www.instagram.com/', NULL, '2020-11-16 15:26:36', '2024-02-09 17:51:44'),
(81, 'youtube_link', 'https://www.youtube.com/', NULL, '2020-11-16 15:26:36', '2024-02-09 17:51:44'),
(82, 'linkedin_link', 'https://www.linkedin.com/', NULL, '2020-11-16 15:26:36', '2024-02-09 17:51:44'),
(90, 'home_categories', '[\"1\",\"2\"]', NULL, '2020-11-16 15:26:36', '2024-11-15 17:21:13'),
(91, 'top10_categories', '[]', NULL, '2020-11-16 15:26:36', '2020-11-16 15:26:36'),
(92, 'top10_brands', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"9\",\"10\",\"11\",\"12\",\"13\"]', NULL, '2020-11-16 15:26:36', '2023-10-05 21:08:46'),
(105, 'timezone', NULL, NULL, '2020-11-16 15:26:36', '2020-11-16 15:26:36'),
(109, 'decimal_separator', '1', NULL, '2020-12-31 00:45:56', '2020-12-31 00:45:56'),
(117, 'google_map', '1', NULL, '2021-07-27 22:49:39', '2021-07-27 22:49:39'),
(124, 'frontend_copyright_text', '© 2024 ZK. All rights reverved.', 'en', '2023-05-25 11:53:10', '2024-11-30 17:13:03'),
(125, 'contact_address', NULL, 'en', '2023-05-25 11:57:16', '2023-05-25 11:57:16'),
(126, 'whatsapp_link', 'https://www.whatsapp.com/', NULL, '2023-05-25 16:00:01', '2024-02-09 17:51:44'),
(128, 'home_banner_status', '0', NULL, '2023-05-25 16:04:16', '2024-01-24 19:15:20'),
(130, 'home_ads_banner_status', '1', NULL, '2023-05-29 08:34:37', '2023-05-29 12:08:31'),
(131, 'home_ads_banner', '[\"8\",\"9\",\"10\"]', NULL, '2023-05-29 08:34:37', '2023-05-29 12:08:31'),
(132, 'home_large_banner', '[\"15\"]', NULL, '2023-05-29 17:10:44', '2024-01-23 15:08:18'),
(133, 'home_large_banner_status', '1', NULL, '2023-05-29 13:10:53', '2024-01-23 15:08:18'),
(134, 'site_name', NULL, NULL, '2023-06-01 15:39:57', '2023-06-01 15:39:57'),
(135, 'system_logo_white', NULL, NULL, '2023-06-01 15:39:57', '2023-06-01 15:39:57'),
(136, 'system_logo_black', NULL, NULL, '2023-06-01 15:39:57', '2023-06-01 15:39:57'),
(137, 'admin_login_background', NULL, NULL, '2023-06-01 15:39:57', '2023-06-01 15:39:57'),
(138, 'flat_rate_shipping_cost', '100', NULL, '2023-07-06 13:58:44', '2023-07-07 13:10:34'),
(145, 'free_shipping_status', '1', NULL, '2023-07-07 13:31:51', '2024-02-05 18:17:35'),
(146, 'free_shipping_min_amount', '500', NULL, '2023-07-07 13:31:51', '2024-02-05 18:17:57'),
(147, 'free_shipping_max_amount', '0', NULL, '2023-07-07 13:31:51', '2024-02-03 14:32:30'),
(148, 'header_logo', NULL, NULL, '2023-07-08 10:52:39', '2023-07-08 10:52:39'),
(149, 'show_language_switcher', NULL, NULL, '2023-07-08 10:52:39', '2023-07-08 10:52:39'),
(150, 'show_currency_switcher', 'on', NULL, '2023-07-08 10:52:39', '2023-07-08 10:52:39'),
(151, 'header_stikcy', NULL, NULL, '2023-07-08 10:52:39', '2023-07-08 10:52:39'),
(152, 'topbar_banner', NULL, NULL, '2023-07-08 10:52:39', '2023-07-08 10:52:39'),
(153, 'topbar_banner_link', NULL, NULL, '2023-07-08 10:52:39', '2023-07-08 10:52:39'),
(154, 'helpline_number', '(+971) 828 4153', NULL, '2023-07-08 10:52:39', '2024-11-28 23:21:50'),
(155, 'header_menu_labels', NULL, NULL, '2023-07-08 10:52:39', '2023-07-08 10:52:39'),
(156, 'header_menu_links', NULL, NULL, '2023-07-08 10:52:39', '2023-07-08 10:52:39'),
(157, 'cod_status', '1', NULL, '2023-07-12 08:08:26', '2023-07-12 08:08:46'),
(158, 'cod_min_amount', '0', NULL, '2023-07-12 08:10:50', '2023-07-12 08:11:15'),
(159, 'cod_max_amount', '0', NULL, '2023-07-12 08:10:50', '2023-07-12 08:11:15'),
(160, 'admin_emails', 'shabeer@tomsher.com,shabeer1@tomsher.com', NULL, '2023-07-12 15:36:19', '2023-07-12 15:36:19'),
(161, 'pickup_from_store', 'on', NULL, '2023-09-02 02:57:14', '2023-09-02 02:57:14'),
(162, 'cat_banner_status', '0', NULL, '2023-10-05 20:57:39', '2023-10-05 21:11:35'),
(163, 'cat_banner', '[\"12\"]', NULL, '2023-10-05 20:57:39', '2023-10-05 21:11:35'),
(164, 'catsection_categories', '[\"9\",\"10\",\"11\",\"26\",\"12\",\"13\",\"32\",\"22\"]', NULL, '2023-10-05 20:57:39', '2023-10-05 21:11:21'),
(165, 'latest_products', '[\"8\",\"1\"]', NULL, '2023-10-05 21:08:34', '2023-11-20 19:20:53'),
(166, 'best_selling', NULL, NULL, '2023-10-05 21:08:35', '2023-11-20 19:20:53'),
(167, 'trending_products', NULL, NULL, '2023-12-09 20:10:15', '2024-11-15 17:20:58'),
(171, 'home_banner', NULL, NULL, '2024-01-23 15:07:44', '2024-11-15 17:20:35'),
(173, 'home_mid_banner_status', '0', NULL, '2024-01-23 15:14:29', '2024-01-24 14:42:20'),
(175, 'home_footer_point_1', '{\"title\":\"DELIVERY\",\"sub_title\":\"Free delivery for orders over AED 150.Worldwide delivery.\"}', NULL, '2024-01-23 17:17:48', '2024-01-23 17:33:03'),
(176, 'home_footer_point_2', '{\"title\":\"CUSTOMER CARE\",\"sub_title\":\"Contact us by email info@zaibajewelry.com\"}', NULL, '2024-01-23 17:17:48', '2024-01-23 17:33:03'),
(177, 'home_footer_point_3', '{\"title\":\"SECURE PAYMENT\",\"sub_title\":\"Debit card, credit card & PayPal\"}', NULL, '2024-01-23 17:17:48', '2024-01-23 17:33:03'),
(178, 'home_footer_point_4', '{\"title\":\"GUARANTEE\",\"sub_title\":\"Give a second life to your ZAIBA jewelry.\"}', NULL, '2024-01-23 17:17:48', '2024-01-23 17:33:03'),
(179, 'new_collection_categories', '[\"1\",\"4\",\"2\"]', NULL, '2024-01-24 13:57:34', '2024-11-15 17:19:07'),
(180, 'default_shipping_amount', '50', NULL, '2024-02-03 14:15:15', '2024-02-03 14:34:12'),
(181, 'default_return_time', '0', NULL, '2024-02-03 14:32:22', '2024-02-03 14:32:22'),
(182, 'social_title', 'Follow Us', NULL, '2024-02-09 17:51:44', '2024-11-15 18:14:56'),
(183, 'social_sub_title', 'Stay current with updates from our social channels.', NULL, '2024-02-09 17:51:44', '2024-02-09 17:51:44'),
(184, 'payment_method_images', '79', NULL, '2024-02-09 17:51:44', '2024-11-21 15:56:55'),
(185, 'footer_address', 'Deira & Al Qouz , Dubai, United Arab Emirates', 'en', '2024-02-09 17:58:38', '2024-02-09 17:58:38'),
(186, 'footer_phone', '+971 4 226 4212', NULL, '2024-02-09 17:58:38', '2024-02-09 17:58:38'),
(187, 'footer_email', 'info@zaiba-jew.com', NULL, '2024-02-09 17:58:38', '2024-02-09 17:58:38'),
(188, 'working_hours', 'Mon - Fri: 10:00 - 18:00', 'en', '2024-02-09 17:58:38', '2024-02-09 17:58:38'),
(189, 'footer_working_hours', 'Mon - Fri: 10:00 - 18:00', 'en', '2024-02-09 18:10:35', '2024-02-09 18:10:35'),
(190, 'helpline_title', 'mega sale discount all item up to 15% for christmas event', NULL, '2024-02-09 18:42:41', '2024-11-30 17:12:10'),
(191, 'vat_percentage', '5', NULL, '2024-02-09 21:54:38', '2024-02-09 21:59:23'),
(192, 'discover_categories', '[\"1\",\"4\",\"2\",\"5\"]', 'en', '2024-11-19 14:27:32', '2024-11-25 19:23:17'),
(193, 'home_mid_banner', '[\"1\",\"2\"]', 'en', '2024-11-19 18:32:53', '2024-11-19 14:35:52'),
(194, 'new_arrival_products', '[\"30\",\"32\",\"33\",\"34\"]', 'en', '2024-11-19 15:13:05', '2024-11-25 19:18:36'),
(195, 'home_occasions', '[\"2\",\"1\",\"3\",\"4\",\"5\",\"6\"]', 'en', '2024-11-19 15:27:41', '2024-11-25 19:26:14'),
(196, 'home_center_banner', '[\"4\"]', 'en', '2024-11-19 19:59:12', '2024-11-21 13:50:17'),
(197, 'special_products', '[\"32\",\"34\",\"35\",\"36\"]', 'en', '2024-11-19 16:03:30', '2024-11-25 21:08:16'),
(198, 'home_mid_section_banner', '[\"5\",\"6\",\"7\"]', NULL, '2024-11-19 20:05:19', '2024-11-21 14:09:56'),
(199, 'header_category_logo', '87', NULL, '2024-11-28 23:21:50', '2024-11-28 23:23:18'),
(200, 'header_category_title_1', 'SHOP BY CATEGORY', NULL, '2024-11-28 23:21:50', '2024-11-28 23:23:19'),
(201, 'header_categories', '[\"1\",\"4\",\"2\"]', NULL, '2024-11-28 23:21:50', '2024-11-28 23:23:19'),
(202, 'header_category_title_2', 'SHOP BY BRANDS', NULL, '2024-11-28 23:21:51', '2024-11-28 23:23:19'),
(203, 'header_brands', '[\"3\",\"2\",\"1\",\"4\"]', NULL, '2024-11-28 23:21:51', '2024-11-28 23:23:19'),
(204, 'header_category_title_3', 'SHOP BY OCCASSION', NULL, '2024-11-28 23:21:51', '2024-11-28 23:23:19'),
(205, 'header_occasions', '[\"3\",\"2\",\"4\",\"5\",\"6\",\"1\"]', NULL, '2024-11-28 23:21:51', '2024-11-28 23:23:19'),
(206, 'auction_home_mid_banner', '[\"1\",\"2\"]', 'en', '2024-12-14 07:43:40', '2024-12-14 21:11:18'),
(207, 'auction_home_center_banner', '[\"4\"]', 'en', '2024-12-14 07:46:08', '2024-12-14 21:11:47'),
(208, 'auction_home_mid_section_banner', '[\"5\",\"6\",\"7\"]', NULL, '2024-12-14 07:48:41', '2024-12-14 21:12:18'),
(209, 'rent_home_mid_banner', '[\"1\",\"2\"]', 'en', '2024-12-14 12:26:27', '2024-12-14 21:15:29'),
(210, 'rent_home_center_banner', '[\"4\"]', 'en', '2024-12-14 12:26:27', '2024-12-14 21:15:47'),
(211, 'rent_home_mid_section_banner', '[\"5\",\"7\",\"6\"]', NULL, '2024-12-14 12:26:27', '2024-12-14 21:16:13'),
(212, 'auction_discover_categories', '[\"1\",\"4\",\"2\",\"5\"]', 'en', '2024-12-14 21:11:06', '2024-12-14 21:11:06'),
(213, 'auction_new_arrival_products', '[\"42\"]', 'en', '2024-12-14 21:11:36', '2024-12-14 21:11:36'),
(214, 'auction_special_products', '[\"42\"]', 'en', '2024-12-14 21:12:02', '2024-12-14 21:12:02'),
(215, 'rent_discover_categories', '[\"1\",\"4\",\"2\",\"5\"]', 'en', '2024-12-14 21:15:23', '2024-12-14 21:15:23'),
(216, 'rent_new_arrival_products', '[\"38\",\"39\"]', 'en', '2024-12-14 21:15:40', '2024-12-14 21:15:40'),
(217, 'rent_special_products', '[\"38\",\"39\"]', 'en', '2024-12-14 21:15:58', '2024-12-14 21:15:58'),
(218, 'website_name', 'test', NULL, '2025-08-23 10:08:53', '2025-08-23 10:08:53'),
(219, 'site_motto', NULL, NULL, '2025-08-23 10:08:53', '2025-08-23 10:08:53'),
(220, 'site_icon', NULL, NULL, '2025-08-23 10:08:53', '2025-08-23 10:08:53'),
(221, 'base_color', NULL, NULL, '2025-08-23 10:08:53', '2025-08-23 10:08:53'),
(222, 'base_hov_color', NULL, NULL, '2025-08-23 10:08:53', '2025-08-23 10:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `temp_user_id` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_stock_id` int(11) DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `price` double(20,2) DEFAULT 0.00,
  `offer_price` double(20,2) DEFAULT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `offer_tag` varchar(255) DEFAULT NULL,
  `tax` double(20,2) DEFAULT 0.00,
  `shipping_cost` double(20,2) DEFAULT 0.00,
  `shipping_type` varchar(30) NOT NULL DEFAULT '',
  `discount` double(10,2) NOT NULL DEFAULT 0.00,
  `offer_discount` double(10,2) NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_applied` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `temp_user_id`, `product_id`, `product_stock_id`, `variation`, `quantity`, `price`, `offer_price`, `offer_id`, `offer_tag`, `tax`, `shipping_cost`, `shipping_type`, `discount`, `offer_discount`, `coupon_code`, `coupon_applied`, `status`, `created_at`, `updated_at`) VALUES
(6, NULL, '0f40c102-434b-4342-847e-2ada26f352d51', 30, 8, NULL, 5, 150000.00, 150000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-23 18:13:40', '2024-11-23 18:35:57'),
(8, NULL, '0f40c102-434b-4342-847e-2ada26f352d51', 34, 13, NULL, 7, 300000.00, 299000.00, NULL, 'AED 1000 OFF', 104650.00, 0.00, '', 1000.00, 0.00, NULL, 0, 0, '2024-11-23 18:13:50', '2024-11-23 19:14:06'),
(9, NULL, '0f40c102-434b-4342-847e-2ada26f352d51', 32, 9, NULL, 5, 100000.00, 100000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-23 18:23:21', '2024-11-23 19:14:13'),
(10, NULL, '0f40c102-434b-4342-847e-2ada26f352d51', 33, 12, NULL, 1, 120000.00, 120000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-23 18:29:57', '2024-11-23 18:29:57'),
(19, NULL, '1cf64bfb-a940-43b6-8300-62b2a220e2a1', 32, 9, NULL, 1, 100000.00, 99000.00, NULL, 'AED 1000 OFF', 0.00, 0.00, '', 1000.00, 0.00, NULL, 0, 0, '2024-11-26 14:47:21', '2024-11-26 14:47:25'),
(20, NULL, 'ace38bab-ae16-4c74-b1d1-615b41b3d773', 30, 8, NULL, 1, 150000.00, 150000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-26 15:33:06', '2024-11-26 15:33:06'),
(22, NULL, 'guest_67461583864896.30413188', 33, 12, NULL, 1, 120000.00, 120000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-27 02:37:55', '2024-11-27 02:37:55'),
(23, NULL, 'guest_674615a8aa8354.25675362', 34, 13, NULL, 1, 300000.00, 300000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-27 02:38:32', '2024-11-27 02:38:32'),
(26, NULL, 'guest_6749b031602976.07447885', 35, 15, NULL, 1, 4300.00, 4300.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-29 20:14:41', '2024-11-29 20:14:41'),
(30, NULL, 'guest_674b2301d878e6.70646135', 30, 8, NULL, 1, 150000.00, 150000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-30 22:36:49', '2024-11-30 22:36:49'),
(31, NULL, 'c1422628-c813-4799-8a16-e9b536ef77ed', 33, 12, NULL, 1, 120000.00, 120000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-30 23:01:38', '2024-11-30 23:01:38'),
(32, NULL, '0adbf587-6db7-431e-b977-bb59f58daeed', 30, 8, NULL, 1, 150000.00, 150000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-11-30 23:30:03', '2024-11-30 23:30:03'),
(34, NULL, 'ca20c965-4b4e-4726-a256-62cbf7a850f3', 36, 16, NULL, 1, 1600.00, 1600.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-03 19:59:06', '2024-12-03 19:59:06'),
(35, NULL, 'ca20c965-4b4e-4726-a256-62cbf7a850f3', 32, 10, NULL, 6, 50000.00, 50000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-03 20:22:23', '2024-12-03 20:22:30'),
(37, NULL, 'guest_674f54df2be108.34668327', 32, 9, NULL, 1, 100000.00, 100000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-04 02:58:39', '2024-12-04 02:58:39'),
(40, NULL, 'guest_675041c90b84f8.33079609', 35, 15, NULL, 1, 4300.00, 4300.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-04 19:49:29', '2024-12-04 19:49:29'),
(41, NULL, 'guest_675041d6311359.99115957', 32, 9, NULL, 1, 100000.00, 100000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-04 19:49:42', '2024-12-04 19:49:42'),
(42, NULL, 'guest_675041e6ad44e2.80091152', 34, 13, NULL, 1, 300000.00, 300000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-04 19:49:58', '2024-12-04 19:49:58'),
(43, NULL, 'guest_6750424ba85572.98487988', 35, 15, NULL, 1, 4300.00, 4300.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-04 19:51:39', '2024-12-04 19:51:39'),
(45, 56, NULL, 33, 12, NULL, 1, 120000.00, 120000.00, NULL, '', 0.00, 0.00, 'free', 0.00, 0.00, NULL, 0, 0, '2024-12-04 19:58:30', '2024-12-05 21:30:03'),
(52, NULL, 'guest_67514113aaac22.42676796', 35, 15, NULL, 1, 4300.00, 4300.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-05 13:58:43', '2024-12-05 13:58:43'),
(69, NULL, 'guest_6751642f5f6800.40207038', 32, 9, NULL, 1, 100000.00, 100000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-05 16:28:31', '2024-12-05 16:28:31'),
(70, NULL, 'guest_6751643ba2adf5.45438736', 32, 9, NULL, 1, 100000.00, 100000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-05 16:28:43', '2024-12-05 16:28:43'),
(71, NULL, 'guest_675164760ea930.35091165', 32, 9, NULL, 1, 100000.00, 100000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-05 16:29:42', '2024-12-05 16:29:42'),
(72, NULL, 'guest_675164a12baf57.43473527', 33, 12, NULL, 1, 120000.00, 120000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-05 16:30:25', '2024-12-05 16:30:25'),
(73, NULL, 'guest_67516500c5a9b2.71326868', 33, 12, NULL, 1, 120000.00, 120000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-05 16:32:00', '2024-12-05 16:32:00'),
(74, NULL, 'dc2d63c1-aa4a-42c6-82bb-dfbe34487c78', 33, 12, NULL, 1, 120000.00, 120000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-05 16:32:07', '2024-12-05 16:32:07'),
(75, NULL, 'dc2d63c1-aa4a-42c6-82bb-dfbe34487c78', 32, 9, NULL, 1, 100000.00, 100000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-05 16:34:28', '2024-12-05 16:34:28'),
(76, NULL, 'dc2d63c1-aa4a-42c6-82bb-dfbe34487c78', 39, 19, NULL, 1, 1600.00, 1600.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-05 16:34:54', '2024-12-05 16:34:54'),
(77, NULL, 'dc2d63c1-aa4a-42c6-82bb-dfbe34487c78', 30, 8, NULL, 1, 150000.00, 135000.00, NULL, '10% OFF', 0.00, 0.00, '', 15000.00, 0.00, NULL, 0, 0, '2024-12-05 16:36:08', '2024-12-05 16:36:15'),
(88, 62, NULL, 30, 8, NULL, 1, 70000.00, 70000.00, NULL, '', 0.00, 0.00, 'free', 0.00, 0.00, NULL, 0, 0, '2024-12-09 18:00:32', '2025-01-04 00:50:22'),
(89, 62, NULL, 32, 9, NULL, 1, 100000.00, 100000.00, NULL, '', 0.00, 0.00, 'free', 0.00, 0.00, NULL, 0, 0, '2024-12-09 18:00:47', '2025-01-04 00:50:22'),
(92, 63, NULL, 38, 18, NULL, 1, 350.00, 350.00, NULL, '', 17.50, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2024-12-18 22:42:46', '2024-12-18 22:42:46'),
(115, 58, NULL, 30, 8, NULL, 1, 70000.00, 63000.00, NULL, '10% OFF', 0.00, 0.00, 'free', 0.00, 0.00, NULL, 0, 0, '2024-12-24 19:51:25', '2024-12-24 19:59:06'),
(116, 62, NULL, 47, 29, NULL, 1, 2000.00, 2000.00, NULL, '', 0.00, 0.00, 'free', 0.00, 0.00, NULL, 0, 0, '2025-01-04 00:48:48', '2025-01-04 00:50:22'),
(117, NULL, '6b9cb2f9-cd54-480c-ab94-bdceb12be38d', 33, 12, NULL, 1, 120000.00, 120000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2025-08-23 08:07:40', '2025-08-23 08:07:40'),
(118, NULL, 'guest_68a94398e8afd7.30930727', 32, 9, NULL, 1, 100000.00, 100000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2025-08-23 08:29:12', '2025-08-23 08:29:12'),
(119, NULL, 'guest_68a943f2565b06.48372408', 32, 9, NULL, 1, 100000.00, 100000.00, NULL, '', 0.00, 0.00, '', 0.00, 0.00, NULL, 0, 0, '2025-08-23 08:30:42', '2025-08-23 08:30:42'),
(120, 60, NULL, 39, 19, NULL, 1, 1600.00, 1600.00, NULL, '', 0.00, 0.00, 'free', 0.00, 0.00, NULL, 0, 0, '2025-08-23 08:39:22', '2025-08-23 08:39:28'),
(121, 60, NULL, 39, 20, NULL, 1, 1500.00, 1500.00, NULL, '', 0.00, 0.00, 'free', 0.00, 0.00, NULL, 0, 0, '2025-08-23 08:39:26', '2025-08-23 08:39:28');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `level`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 0, 'Party Wear', 0, 1, '2024-11-02 08:54:49', '2024-11-02 12:03:39'),
(2, 0, 'Daily Wear', 0, 1, '2024-11-02 11:38:23', '2024-11-13 17:00:21'),
(4, 1, 'Bangles', 1, 1, '2024-11-02 13:46:57', '2024-11-25 16:08:35'),
(5, 0, 'Rings', 0, 1, '2024-11-25 17:12:31', '2024-11-30 17:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` int(11) DEFAULT NULL,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `og_title` varchar(191) DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `twitter_title` varchar(191) DEFAULT NULL,
  `twitter_description` text DEFAULT NULL,
  `meta_keyword` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `lang`, `name`, `slug`, `icon`, `meta_title`, `meta_description`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `meta_keyword`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Party Wear', 'party-wear', 81, 'Party wear meta title', 'Party wear Meta Description', 'Party wear OG Title', 'Party wear OG Description', 'Party wear Twitter Title', 'Party wear Twitter Description', 'Party wear Meta Keywords', '2024-11-02 08:54:49', '2024-11-25 16:08:35'),
(2, 2, 'en', 'Daily Wear', 'daily-wear', 39, 'Daily Wear eng Meta Title', 'Daily Wear eng Meta Description', 'Daily Wear eng OG Title', 'Daily Wear eng  OG Description', 'Daily Wear eng Twitter Title', 'Daily Wear eng Twitter Description', 'Daily Wear eng Meta Keywords', '2024-11-02 11:38:24', '2024-11-13 17:00:21'),
(4, 2, 'ae', 'الارتداء اليومي', 'alartdaaa-alyomy', 41, 'الارتداء اليومي Meta Title', 'الارتداء اليومي Meta Description', 'الارتداء اليومي OG Title', 'الارتداء اليومي OG Description', 'الارتداء اليومي Twitter Title', 'الارتداء اليومي Twitter Description', 'الارتداء اليومي Meta Keywords', '2024-11-02 12:01:10', '2024-11-02 12:01:10'),
(5, 4, 'en', 'Bangles', 'bangles', 80, '111111', '22222', '44444', '55555', '66666', '77777', '33333', '2024-11-02 13:46:57', '2024-11-25 16:01:25'),
(6, 4, 'ae', 'الأساور', 'alasaor', 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-04 12:38:19', '2024-11-04 12:38:19'),
(7, 1, 'ae', 'ملابس الحفلات', 'mlabs-alhflat', 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-22 16:39:32', '2024-11-30 23:47:25'),
(8, 5, 'en', 'Rings', 'rings12', 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-25 17:12:31', '2024-11-30 23:51:29'),
(9, 5, 'ae', 'Rings', 'rings', 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-30 23:48:28', '2024-11-30 23:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL,
  `cost` double(20,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `city_translations`
--

CREATE TABLE `city_translations` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collection_products`
--

CREATE TABLE `collection_products` (
  `id` int(11) NOT NULL,
  `collectiontitle` varchar(255) NOT NULL,
  `collectiondescription` text DEFAULT NULL,
  `collectionimage1` varchar(255) DEFAULT NULL,
  `collectionimage2` varchar(255) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `page_reference` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collection_products`
--

INSERT INTO `collection_products` (`id`, `collectiontitle`, `collectiondescription`, `collectionimage1`, `collectionimage2`, `page`, `page_reference`, `created_at`, `updated_at`) VALUES
(1, 'dsds', 'sddsds', NULL, NULL, 'chairs', 'top-left', '2025-08-23 09:01:41', '2025-08-23 09:01:41'),
(2, 'ssdsd', 'dds', NULL, NULL, 'chairs', 'top-left', '2025-08-23 09:02:19', '2025-08-23 09:02:19');

-- --------------------------------------------------------

--
-- Table structure for table `collection_product_product`
--

CREATE TABLE `collection_product_product` (
  `collection_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collection_product_product`
--

INSERT INTO `collection_product_product` (`collection_product_id`, `product_id`) VALUES
(1, 33),
(1, 34),
(2, 34),
(1, 35),
(2, 35);

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(11) NOT NULL,
  `order_type` varchar(11) DEFAULT 'sales',
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `admin_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `vendor_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `share_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `paid_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `commissions`
--

INSERT INTO `commissions` (`id`, `order_type`, `order_id`, `product_id`, `vendor_id`, `total_amount`, `admin_amount`, `vendor_amount`, `share_percentage`, `paid_status`, `created_at`, `updated_at`) VALUES
(1, 'sales', 22, 33, 1, 120000.00, 1200.00, 118800.00, 1.00, 1, '2024-12-20 22:43:53', '2024-12-20 22:43:53'),
(2, 'rent', 81, 39, 1, 3200.00, 32.00, 3168.00, 1.00, 1, '2024-12-20 22:44:45', '2024-12-20 22:44:45'),
(4, 'sales', 26, 34, 1, 300000.00, 3000.00, 297000.00, 1.00, 1, '2024-12-23 18:15:13', '2024-12-23 18:15:13');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@yopmail.com', '1122334455', NULL, 'Test message', '2024-02-21 19:40:50', '2024-02-21 19:40:50'),
(3, 'Jisha P', 'jisha@yopmail.com', '+971568650838', 'Sample subject', 'Sample message', '2024-02-21 19:42:40', '2024-02-21 19:42:40'),
(4, 'Jisha P', 'jisha@yopmai', '+971568650838', 'Sample subject', 'Sample message', '2024-02-21 19:46:18', '2024-02-21 19:46:18'),
(5, 'Jisha P', 'jisha@yopmail.com', '+971568650838', 'Sample subject', 'Sample message', '2024-02-21 19:47:33', '2024-02-21 19:47:33'),
(6, 'Jisha P', 'jisha@yopmail.com', '+971568650838', 'Sample subject', 'Sample message', '2024-02-21 19:48:52', '2024-02-21 19:48:52'),
(7, 'test ms', 'nv@gmail.com', 'sdgfvgv#$%T', 'general_enquiry', 'dummy text', '2024-12-05 17:45:17', '2024-12-05 17:45:17'),
(8, 'test demo', 'nevetha.tomsher@gmail.com', 'dsfvdvdfv', 'general_enquiry', 'ewfsfcs', '2024-12-20 16:44:42', '2024-12-20 16:44:42'),
(9, 'Terry D', 'rachel@oval9.com', '3128780396', 'general_enquiry', 'Do you need help with graphic design - brochures, banners, flyers, advertisements, social media posts, logos etc?\r\n\r\nWe charge a low fixed monthly fee. Let me know if you\'re interested and would like to see our portfolio.', '2025-05-22 11:23:20', '2025-05-22 11:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `details` longtext NOT NULL,
  `discount` double(20,2) NOT NULL,
  `discount_type` varchar(100) NOT NULL,
  `start_date` int(11) NOT NULL,
  `end_date` int(11) NOT NULL,
  `one_time_use` tinyint(1) NOT NULL DEFAULT 0,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `user_id`, `type`, `code`, `details`, `discount`, `discount_type`, `start_date`, `end_date`, `one_time_use`, `is_used`, `created_at`, `updated_at`) VALUES
(1, NULL, 'product_base', 'NEWPRO10', '[{\"product_id\":\"30\"},{\"product_id\":\"35\"},{\"product_id\":\"36\"}]', 10.00, 'amount', 1734307200, 1735516800, 1, 0, '2024-11-09 15:47:47', '2024-12-20 18:06:52'),
(2, NULL, 'cart_base', 'NEWORDER40ED', '{\"min_buy\":\"499\",\"max_discount\":\"300\"}', 50.00, 'percent', 1731110400, 1733702400, 1, 0, '2024-11-09 15:49:46', '2024-11-09 15:50:36'),
(4, NULL, 'cart_base', '10OFF', '{\"min_buy\":\"100\",\"max_discount\":\"200\"}', 10.00, 'amount', 1754006400, 1759536000, 0, 0, '2024-12-05 16:42:06', '2025-08-23 08:35:21');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `coupon_usages`
--

INSERT INTO `coupon_usages` (`id`, `user_id`, `coupon_id`, `created_at`, `updated_at`) VALUES
(2, 60, 4, '2024-12-05 17:21:17', '2024-12-05 17:21:17'),
(3, 60, 1, '2024-12-20 18:07:18', '2024-12-20 18:07:18'),
(4, 60, 4, '2025-08-23 08:36:09', '2025-08-23 08:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 8, '2019-08-01 17:35:09', '2019-08-01 17:35:09'),
(5, 10, '2023-02-28 16:40:54', '2023-02-28 16:40:54'),
(6, 11, '2023-03-01 16:34:53', '2023-03-01 16:34:53'),
(7, 12, '2023-05-01 13:23:02', '2023-05-01 13:23:02'),
(8, 44, '2023-11-10 20:29:45', '2023-11-10 20:29:45'),
(9, 45, '2023-11-10 20:56:37', '2023-11-10 20:56:37'),
(10, 46, '2023-11-10 20:58:57', '2023-11-10 20:58:57'),
(11, 47, '2023-11-10 21:00:28', '2023-11-10 21:00:28'),
(12, 48, '2023-11-10 21:02:21', '2023-11-10 21:02:21'),
(13, 49, '2023-11-10 21:03:13', '2023-11-10 21:03:13'),
(14, 50, '2023-11-10 21:04:21', '2023-11-10 21:04:21'),
(15, 51, '2024-02-15 14:37:03', '2024-02-15 14:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '70b90ca6-19dc-4112-83d5-3efd01d4fc79', 'database', 'default', '{\"uuid\":\"70b90ca6-19dc-4112-83d5-3efd01d4fc79\",\"displayName\":\"App\\\\Mail\\\\ContactEnquiry\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:23:\\\"App\\\\Mail\\\\ContactEnquiry\\\":3:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Contacts\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"jisha.tomsher@gmail.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"jisha.tomsher@gmail.com\" using the following authenticators: \"LOGIN\", \"PLAIN\", \"XOAUTH2\". Authenticator \"LOGIN\" returned \"Expected response code \"235\" but got code \"535\", with message \"535-5.7.8 Username and Password not accepted. For more information, go to\r\n535 5.7.8  https://support.google.com/mail/?p=BadCredentials 6a1803df08f44-6f8b3f29120sm90114696d6.89 - gsmtp\".\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got code \"535\", with message \"535-5.7.8 Username and Password not accepted. For more information, go to\r\n535 5.7.8  https://support.google.com/mail/?p=BadCredentials 6a1803df08f44-6f8b3f29120sm90114696d6.89 - gsmtp\".\". Authenticator \"XOAUTH2\" returned \"Expected response code \"235\" but got code \"334\", with message \"334 eyJzdGF0dXMiOiI0MDAiLCJzY2hlbWVzIjoiQmVhcmVyIiwic2NvcGUiOiJodHRwczovL21haWwuZ29vZ2xlLmNvbS8ifQ==\".\". in /home/tomsher2022/zena-kazena-new/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php:226\nStack trace:\n#0 /home/tomsher2022/zena-kazena-new/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(161): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 /home/tomsher2022/zena-kazena-new/vendor/symfony/mailer/Transport/Smtp/EsmtpTransport.php(118): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 /home/tomsher2022/zena-kazena-new/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(254): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO [127.0.0.1...\', Array)\n#3 /home/tomsher2022/zena-kazena-new/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(277): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 /home/tomsher2022/zena-kazena-new/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(209): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 /home/tomsher2022/zena-kazena-new/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 /home/tomsher2022/zena-kazena-new/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(573): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(213): Illuminate\\Mail\\Mailer->send(\'emails.contactf...\', Array, Object(Closure))\n#10 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#11 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(214): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#12 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(83): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#13 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#14 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#15 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#16 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#17 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#18 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#19 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#20 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#21 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#23 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#24 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(126): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#27 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#28 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#29 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#30 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(176): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#31 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(138): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(121): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#33 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#34 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#35 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#36 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#37 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Container/Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#38 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Console/Command.php(211): Illuminate\\Container\\Container->call(Array)\n#39 /home/tomsher2022/zena-kazena-new/vendor/symfony/console/Command/Command.php(326): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#40 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Console/Command.php(181): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 /home/tomsher2022/zena-kazena-new/vendor/symfony/console/Application.php(1096): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 /home/tomsher2022/zena-kazena-new/vendor/symfony/console/Application.php(324): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 /home/tomsher2022/zena-kazena-new/vendor/symfony/console/Application.php(175): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 /home/tomsher2022/zena-kazena-new/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(201): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 /home/tomsher2022/zena-kazena-new/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 {main}', '2025-05-22 15:24:05');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `faq_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `title` text DEFAULT NULL,
  `ar_title` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `ar_content` longtext DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `faq_category_id`, `question`, `answer`, `is_active`, `title`, `ar_title`, `content`, `ar_content`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, '', '', 1, 'Question 1 English edited', 'Question 1 arabic edited', '<p>Answer 1 english edited</p>', '<p>Answer 1 arabic edited</p>', 1, 1, '2024-02-20 21:06:33', '2024-02-21 13:25:11'),
(3, NULL, '', '', 1, 'Question 2 english', 'Question 2 arabic', '<p>Answer 1 english</p>', '<p>Answer 2 arabic</p>', 2, 1, '2024-02-21 13:26:18', '2024-02-21 13:26:18'),
(4, 1, 'Ts', 'TsTsTs', 1, NULL, NULL, NULL, NULL, 0, 1, '2025-08-23 09:21:29', '2025-08-23 09:21:29');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `slug`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test', 1, 0, '2025-08-23 09:20:05', '2025-08-23 09:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `firebase_notifications`
--

CREATE TABLE `firebase_notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `item_type` varchar(255) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `mobile_image` int(11) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `btn_text` varchar(191) DEFAULT NULL,
  `link_type` varchar(191) DEFAULT NULL,
  `link_ref` varchar(191) DEFAULT NULL,
  `link_ref_id` int(11) DEFAULT NULL,
  `link` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `name`, `image`, `mobile_image`, `title`, `sub_title`, `btn_text`, `link_type`, `link_ref`, `link_ref_id`, `link`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Slider 1', 72, 72, NULL, NULL, NULL, 'occasion', 'occasion', 1, NULL, 2, 1, '2024-11-20 13:17:39', '2024-11-20 17:50:09'),
(2, 'Slider 2', 71, 71, NULL, NULL, NULL, 'category', 'category', 1, NULL, 1, 1, '2024-11-20 13:30:05', '2024-11-20 17:50:19');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `app_lang_code` varchar(255) DEFAULT 'en',
  `rtl` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `app_lang_code`, `rtl`, `status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'en', 0, 1, '2019-01-20 20:13:20', '2019-01-20 20:13:20'),
(4, 'Arabic', 'ae', 'ar', 1, 1, '2019-04-29 01:34:12', '2023-02-27 18:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_08_11_073824_create_menus_wp_table', 1),
(2, '2017_08_11_074006_create_menu_items_wp_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `mortgages`
--

CREATE TABLE `mortgages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `metal` varchar(50) DEFAULT NULL,
  `metal_type` varchar(11) DEFAULT NULL,
  `weight` float NOT NULL DEFAULT 0,
  `eid_no` varchar(191) DEFAULT NULL,
  `id_image_back` varchar(255) DEFAULT NULL,
  `id_image` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `mortgages`
--

INSERT INTO `mortgages` (`id`, `name`, `email`, `phone`, `description`, `duration`, `metal`, `metal_type`, `weight`, `eid_no`, `id_image_back`, `id_image`, `product_image`, `created_at`, `updated_at`) VALUES
(1, 'Jisha P', 'jisha@yopmail.com', '1122334455', 'Testing mortgage form submission', NULL, NULL, NULL, 0, NULL, NULL, '/storage/mortgages/1733384598_6751599624050.png', '/storage/mortgages/1733384598_6751599625f1a.jpg', '2024-12-05 15:43:18', '2024-12-05 15:43:18'),
(2, 'Student 1', 'stud1@yopmail.com', '1452364545', 'fgfdhgfghgfhgfhgh', NULL, NULL, NULL, 0, NULL, NULL, '/storage/mortgages/1733384699_675159fb407a9.jpg', '/storage/mortgages/1733384699_675159fb41e50.jpg', '2024-12-05 15:44:59', '2024-12-05 15:44:59'),
(3, 'Jisha P test', 'jishatest@yopmail.com', '11223344556', 'qwertyokkndvm xmcvbkxcmvk,cxklvkcmvknxck', NULL, NULL, NULL, 0, NULL, NULL, '/storage/mortgages/1733384756_67515a349160c.jpg', '/storage/mortgages/1733384756_67515a3492e34.png', '2024-12-05 15:45:56', '2024-12-05 15:45:56'),
(4, 'sdfcsdc', 'test@gmail.com', '1234567890', 'sdfdsfdgfv', 5, 'rose_gold', '22k', 6, 'sdcdvcdvdxvv dggx', '/storage/mortgages/1734526744_6762c718d0ef2.jpg', '/storage/mortgages/1734526744_6762c718cfac4.jpg', '/storage/mortgages/1734526744_6762c718d1013.jpg', '2024-12-18 20:59:04', '2024-12-18 20:59:04'),
(5, 'fdvcdxfv', 'test1@gmail.com', '34546546556', 'rrfgvfdbfbgb', 2, 'silver', '22k', 0, 'fgvfbfhghfb#$%^', '/storage/mortgages/1734527229_6762c8fda6edb.jpg', '/storage/mortgages/1734527229_6762c8fda5b15.jpg', '/storage/mortgages/1734527229_6762c8fda701d.jpg', '2024-12-18 21:07:09', '2024-12-18 21:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('10874c96-85ed-4a26-8ef0-8d6881f7cee3', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"confirmed\"}', '2023-04-29 14:40:45', '2023-04-28 20:01:24', '2023-04-29 14:40:45'),
('143b5897-75af-4c35-997e-6044fc644260', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"placed\"}', '2023-03-30 13:46:28', '2023-03-01 16:44:51', '2023-03-30 13:46:28'),
('1c4ccc7c-61fe-4b1e-87a8-71c3d984b799', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":36,\"status\":\"picked_up\"}', '2023-10-16 18:24:25', '2023-05-22 19:59:36', '2023-10-16 18:24:25'),
('208a9e04-af4f-4b20-a2fe-758c34abf9d5', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"paid\"}', '2023-04-29 14:40:45', '2023-04-05 19:40:22', '2023-04-29 14:40:45'),
('2249d5b6-f11e-4321-8a17-4ee4fd55f309', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":36,\"status\":\"on_the_way\"}', '2023-10-16 18:24:25', '2023-05-22 19:58:46', '2023-10-16 18:24:25'),
('32658161-6fda-407b-9e1d-acbb0ec6aecd', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"unpaid\"}', NULL, '2023-03-02 14:19:28', '2023-03-02 14:19:28'),
('36217afe-609a-44a1-94a5-e2c36d7db22b', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":36,\"status\":\"on_the_way\"}', NULL, '2023-05-22 19:58:46', '2023-05-22 19:58:46'),
('40b21ab1-3262-45e3-93b0-8726296aadcb', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"picked_up\"}', NULL, '2023-04-28 20:01:30', '2023-04-28 20:01:30'),
('440b1d4b-1ddb-46d5-b31c-afec77827f07', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"confirmed\"}', NULL, '2023-04-28 20:01:24', '2023-04-28 20:01:24'),
('4a112ad7-c2d7-4c24-8423-af1be70de088', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"placed\"}', NULL, '2023-03-01 16:44:51', '2023-03-01 16:44:51'),
('55499536-24c1-47b0-aaa6-6fe093aba420', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"unpaid\"}', '2023-03-30 13:46:28', '2023-03-02 14:19:28', '2023-03-30 13:46:28'),
('61b58e1d-33e1-44f6-8414-db55ffc530ab', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"unpaid\"}', '2023-04-29 14:40:45', '2023-04-05 19:40:26', '2023-04-29 14:40:45'),
('7a7b1091-73d4-4757-b40c-e5ec3d56a080', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"paid\"}', '2023-03-30 13:46:28', '2023-03-02 14:19:23', '2023-03-30 13:46:28'),
('985fbbec-a385-4143-aa58-ff82917dcc8d', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"paid\"}', '2023-04-29 14:40:45', '2023-04-28 20:01:11', '2023-04-29 14:40:45'),
('aa17fbbe-9307-4a4d-89e7-7dc9a0373053', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 9, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"picked_up\"}', '2023-04-29 14:40:45', '2023-04-28 20:01:30', '2023-04-29 14:40:45'),
('b425c00c-7a12-43a9-a9d7-23630af94ceb', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"paid\"}', NULL, '2023-03-02 14:19:23', '2023-03-02 14:19:23'),
('bfb3c633-897c-4f84-ad9f-9ec5c427bd7b', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":36,\"status\":\"picked_up\"}', NULL, '2023-05-22 19:59:36', '2023-05-22 19:59:36'),
('d5305933-bab0-4645-a6e9-83dee21aebce', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"unpaid\"}', NULL, '2023-04-05 19:40:26', '2023-04-05 19:40:26'),
('deef0958-14aa-4068-976d-71c1ea0851e0', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"paid\"}', NULL, '2023-04-28 20:01:11', '2023-04-28 20:01:11'),
('f3de2632-f252-4862-bc87-7f199d5a1671', 'App\\Notifications\\OrderNotification', 'App\\Models\\User', 11, '{\"order_id\":1,\"order_code\":\"20230301-12444261\",\"user_id\":11,\"seller_id\":9,\"status\":\"paid\"}', NULL, '2023-04-05 19:40:22', '2023-04-05 19:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `occasions`
--

CREATE TABLE `occasions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `occasions`
--

INSERT INTO `occasions` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Wedding', 1, '2024-11-07 16:17:27', '2024-11-25 16:54:48'),
(2, 'Birthday', 1, '2024-11-07 16:23:33', '2024-11-07 16:23:33'),
(3, 'Anniversary', 1, '2024-11-25 16:22:15', '2024-11-25 16:22:15'),
(4, 'Graduation', 1, '2024-11-25 16:23:12', '2024-11-25 16:54:43'),
(5, 'New Gift Ideas', 1, '2024-11-25 19:25:14', '2024-11-25 19:25:49'),
(6, 'Others', 1, '2024-11-25 19:25:45', '2024-11-25 19:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `occasion_translations`
--

CREATE TABLE `occasion_translations` (
  `id` bigint(20) NOT NULL,
  `occasion_id` int(11) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo` int(11) DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `og_title` varchar(191) DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `twitter_title` varchar(191) DEFAULT NULL,
  `twitter_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `occasion_translations`
--

INSERT INTO `occasion_translations` (`id`, `occasion_id`, `lang`, `name`, `slug`, `logo`, `meta_title`, `meta_description`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Wedding', 'wedding', 51, 'Meta Title Wedding', 'Meta Description Wedding', 'OG Title Wedding', 'OG Description Wedding', 'Twitter Title Wedding', 'Twitter Description Wedding', 'Meta Keywords Wedding', '2024-11-07 16:17:27', '2024-11-07 16:17:27'),
(2, 1, 'ae', 'قِرَان', 'kran', 47, 'Meta Title Wedding قِرَان', 'Meta Description Wedding قِرَان', 'OG Title Wedding قِرَان', 'OG Description Wedding قِرَان', 'Twitter Title Wedding قِرَان', 'Twitter Description Wedding قِرَان', 'Meta Keywords Wedding قِرَان', '2024-11-07 16:19:02', '2024-11-07 16:19:02'),
(3, 2, 'en', 'Birthday', 'birthday', 56, 'birthday 1111', 'birthday  2222', 'birthday  444', 'birthday 555', 'birthday 666', 'birthday 777', 'birthday  3333', '2024-11-07 16:23:33', '2024-11-07 16:23:33'),
(4, 2, 'ae', 'عيد ميلاد', 'aayd-mylad', 56, 'birthday 11111111111111111', 'birthday 2222222222', 'birthday 44444444444', 'birthday 5555555555555', 'birthday 666666666', 'birthday 77777777777', 'birthday 333333333333', '2024-11-07 16:24:27', '2024-11-07 16:24:27'),
(5, 3, 'en', 'Anniversary', 'anniversary', 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-25 16:22:15', '2024-11-25 16:22:15'),
(6, 4, 'en', 'Graduation', 'graduation', 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-25 16:23:12', '2024-11-25 16:23:12'),
(7, 5, 'en', 'New Gift Ideas', 'new-gift-ideas', 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-25 19:25:14', '2024-11-25 19:25:14'),
(8, 6, 'en', 'Others', 'others', 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-25 19:25:45', '2024-11-25 19:25:45'),
(9, 3, 'ae', 'Anniversary', 'anniversary-ar', 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-30 23:53:44', '2024-11-30 23:53:44'),
(10, 4, 'ae', 'Graduation', 'graduation', 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 22:04:08', '2024-12-04 22:04:08'),
(11, 5, 'ae', 'New Gift Ideas', 'new-gift-ideas', 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 22:04:39', '2024-12-04 22:04:39'),
(12, 6, 'ae', 'Others', 'others', 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-04 22:05:02', '2024-12-04 22:05:02');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `combined_order_id` int(11) DEFAULT NULL,
  `code` mediumtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `estimated_delivery` date DEFAULT NULL,
  `shipping_address` longtext DEFAULT NULL,
  `billing_address` longtext DEFAULT NULL,
  `order_notes` text DEFAULT NULL,
  `delivery_status` varchar(20) DEFAULT 'pending',
  `payment_type` varchar(20) DEFAULT NULL COMMENT 'cash_on_delivery, card, card_wallet\r\n',
  `payment_status` varchar(20) DEFAULT 'unpaid',
  `payment_details` longtext DEFAULT NULL,
  `payment_tracking_id` varchar(191) DEFAULT NULL,
  `shipping_type` varchar(50) NOT NULL,
  `shipping_cost` double(20,2) DEFAULT NULL,
  `tax` double(10,4) DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `sub_total` double(20,2) NOT NULL DEFAULT 0.00,
  `coupon_discount` double(20,2) NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(191) DEFAULT NULL,
  `offer_discount` double(20,2) NOT NULL DEFAULT 0.00,
  `tracking_code` varchar(255) DEFAULT NULL,
  `delivery_completed_date` datetime DEFAULT NULL,
  `date` int(11) NOT NULL,
  `cancel_request` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - not requested, 1 - requested',
  `cancel_request_date` datetime DEFAULT NULL,
  `cancel_approval` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - Pending, 1 - Approved',
  `cancel_approval_date` datetime DEFAULT NULL,
  `cancel_reason` text DEFAULT NULL,
  `return_request` tinyint(1) DEFAULT 0,
  `return_request_date` datetime DEFAULT NULL,
  `return_approval` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 - Pending, 1 - Approved',
  `return_approval_date` datetime DEFAULT NULL,
  `return_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `combined_order_id`, `code`, `user_id`, `estimated_delivery`, `shipping_address`, `billing_address`, `order_notes`, `delivery_status`, `payment_type`, `payment_status`, `payment_details`, `payment_tracking_id`, `shipping_type`, `shipping_cost`, `tax`, `grand_total`, `sub_total`, `coupon_discount`, `coupon_code`, `offer_discount`, `tracking_code`, `delivery_completed_date`, `date`, `cancel_request`, `cancel_request_date`, `cancel_approval`, `cancel_approval_date`, `cancel_reason`, `return_request`, `return_request_date`, `return_approval`, `return_approval_date`, `return_reason`, `created_at`, `updated_at`) VALUES
(4, 6, '20240205-14001977', 8, NULL, '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', 'Please leave at door. Don\'t ring door bell', 'cancelled', 'cash_on_delivery', 'un_paid', NULL, NULL, 'flat_rate', 50.00, 0.0000, 2116.50, 2066.50, 0.00, NULL, 0.00, NULL, NULL, 1707127219, 1, '2024-02-05 18:18:10', 1, '2024-02-09 16:56:28', 'unknown order', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0', '2024-02-05 18:00:19', '2024-02-09 20:56:28'),
(5, 7, '20240205-14071519', 10, NULL, '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', 'Please leave at door. Don\'t ring door bell', 'pending', 'cash_on_delivery', 'un_paid', NULL, NULL, 'flat_rate', 50.00, 0.0000, 2116.50, 2066.50, 0.00, NULL, 0.00, NULL, NULL, 1707127635, 0, NULL, 0, NULL, NULL, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0', '2024-02-05 18:07:15', '2024-02-05 18:07:15'),
(6, 8, '20240205-14144697', 8, NULL, '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', 'Please leave at door. Don\'t ring door bell', 'confirmed', 'cash_on_delivery', 'paid', NULL, NULL, 'flat_rate', 50.00, 0.0000, 2116.50, 2066.50, 0.00, NULL, 0.00, NULL, NULL, 1707128086, 1, '2024-02-08 16:58:04', 2, '2024-02-09 16:58:15', NULL, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0', '2024-02-05 18:14:46', '2024-11-15 14:33:19'),
(7, 9, '20240205-14180728', 10, NULL, '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', 'Please leave at door. Don\'t ring door bell', 'pending', 'cash_on_delivery', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 535.50, 535.50, 0.00, NULL, 0.00, NULL, NULL, 1707128287, 0, NULL, 0, NULL, NULL, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0', '2024-02-05 18:18:07', '2024-02-05 18:18:07'),
(8, 10, '20240205-16471166', 10, NULL, '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', '{\"name\":\"Jisha P\",\"email\":\"test1@gmail.com\",\"address\":\"Flat No 303, Building name, city name, country name\",\"country\":\"United Arab Emirates\",\"state\":\"Dubai\",\"city\":\"Dubai\",\"phone\":\"+971568650838\",\"longitude\":\"55.32320022583008\",\"latitude\":\"25.234836109953527\"}', 'Please leave at door. Don\'t ring door bell', 'confirmed', 'card', 'paid', '{\"order_id\":\"20240205-16471166\",\"tracking_id\":\"113051184649\",\"bank_ref_no\":\"191086\",\"order_status\":\"Success\",\"failure_message\":\"\",\"payment_mode\":\"Credit Card\",\"card_name\":\"MasterCard\",\"status_code\":\"00\",\"status_message\":\"Approved\",\"currency\":\"AED\",\"amount\":\"24653.77\",\"billing_name\":\"Jisha P\",\"billing_address\":\"Flat No 303, Building name, city name, country name\",\"billing_city\":\"Dubai\",\"billing_state\":\"Dubai\",\"billing_zip\":\"\",\"billing_country\":\"United Arab Emirates\",\"billing_tel\":\"971568650838\",\"billing_email\":\"test1@gmail.com\",\"delivery_name\":\"\",\"delivery_address\":\"\",\"delivery_city\":\"\",\"delivery_state\":\"\",\"delivery_zip\":\"\",\"delivery_country\":\"\",\"delivery_tel\":\"\",\"merchant_param1\":\"\",\"merchant_param2\":\"\",\"merchant_param3\":\"\",\"merchant_param4\":\"\",\"merchant_param5\":\"\",\"vault\":\"N\",\"offer_type\":\"null\",\"offer_code\":\"null\",\"discount_value\":\"0.0\",\"mer_amount\":\"24653.77\",\"eci_value\":\"02\",\"card_holder_name\":\"\",\"bank_qsi_no\":\"59434722847950\",\"bank_receipt_no\":\"403612191086\",\"merchant_param6\":\"5123450008\"}', '113051184649', 'free_shipping', 0.00, 0.0000, 24653.77, 24653.77, 0.00, NULL, 0.00, NULL, NULL, 1707137231, 0, NULL, 0, NULL, NULL, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0', '2024-02-05 20:47:11', '2024-11-15 14:33:12'),
(9, NULL, '20241126-14260959', 54, NULL, '{\"name\":\"Jisha P\",\"email\":\"jishacustomer@yopmail.com\",\"address\":\"Wafi residence,\",\"zipcode\":\"00000\",\"city\":\"Dubai\",\"phone\":\"1122334455\"}', '{\"name\":\"Jisha P\",\"email\":\"jishacustomer@yopmail.com\",\"address\":\"Wafi residence,\",\"zipcode\":\"00000\",\"city\":\"Dubai\",\"phone\":\"1122334455\"}', 'Please call', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 49000.00, 50000.00, 0.00, NULL, 1000.00, NULL, NULL, 1732631169, 0, NULL, 0, NULL, NULL, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0', '2024-11-26 22:26:09', '2024-11-26 22:26:09'),
(10, NULL, '20241126-18405433', 55, NULL, '{\"name\":\"Dhanya\",\"email\":\"dhanya@123.com\",\"address\":\"grdg\",\"zipcode\":\"98765\",\"city\":\"tgd\",\"phone\":\"765423456789\"}', '{\"name\":\"Dhanya\",\"email\":\"dhanya@123.com\",\"address\":\"grdg\",\"zipcode\":\"98765\",\"city\":\"tgd\",\"phone\":\"765423456789\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 150000.00, 150000.00, 0.00, NULL, 0.00, NULL, NULL, 1732646454, 0, NULL, 0, NULL, NULL, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0', '2024-11-27 02:40:54', '2024-11-27 02:40:54'),
(11, NULL, '20241129-07414040', 56, NULL, '{\"name\":\"Test\",\"email\":\"test@gmail.com\",\"address\":\"Dubai\",\"zipcode\":\"000000\",\"city\":\"Dubai\",\"phone\":\"874562854\"}', '{\"name\":\"Test\",\"email\":\"test@gmail.com\",\"address\":\"Dubai\",\"zipcode\":\"000000\",\"city\":\"Dubai\",\"phone\":\"874562854\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 120000.00, 120000.00, 0.00, NULL, 0.00, NULL, NULL, 1732866100, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-11-29 15:41:40', '2024-11-29 15:41:40'),
(12, NULL, '20241130-09191532', 9, NULL, '{\"name\":\"Dhanya\",\"email\":\"dhanya@tomsher.com\",\"address\":\"Test addres\",\"zipcode\":\"00\",\"city\":\"Dubai\",\"phone\":\"9876543\"}', '{\"name\":\"Dhanya\",\"email\":\"dhanya@tomsher.com\",\"address\":\"Test addres\",\"zipcode\":\"00\",\"city\":\"Dubai\",\"phone\":\"9876543\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 219000.00, 220000.00, 0.00, NULL, 1000.00, NULL, NULL, 1732958355, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-11-30 17:19:15', '2024-11-30 17:19:15'),
(13, NULL, '20241130-10230865', 56, NULL, '{\"name\":\"Test\",\"email\":\"test@gmail.com\",\"address\":\"Wafi Residence\",\"zipcode\":\"000000\",\"city\":\"Dubai\",\"phone\":\"5841542365\"}', '{\"name\":\"Test\",\"email\":\"test@gmail.com\",\"address\":\"Wafi Residence\",\"zipcode\":\"000000\",\"city\":\"Dubai\",\"phone\":\"5841542365\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 151600.00, 151600.00, 0.00, NULL, 0.00, NULL, NULL, 1732962188, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-11-30 18:23:08', '2024-11-30 18:23:08'),
(14, NULL, '20241204-09182027', 56, NULL, '{\"name\":\"Nimitha\",\"email\":\"test@gmail.com\",\"address\":\"Wafi Residence\",\"zipcode\":\"000000\",\"city\":\"Dubai\",\"phone\":\"5841542365\"}', '{\"name\":\"Nimitha\",\"email\":\"test@gmail.com\",\"address\":\"Wafi Residence\",\"zipcode\":\"000000\",\"city\":\"Dubai\",\"phone\":\"5841542365\"}', 'Urgent Requirement', 'cancelled', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 600000.00, 600000.00, 0.00, NULL, 0.00, NULL, NULL, 1733303900, 1, '2024-12-05 12:55:03', 1, '2025-08-23 04:40:29', 'High price', 0, NULL, 0, NULL, NULL, '2024-12-04 17:18:20', '2025-08-23 08:40:29'),
(15, NULL, '20241205-08043792', 60, NULL, '{\"name\":\"test\",\"email\":\"test@gmail.com\",\"address\":\"al karama\",\"zipcode\":\"243445\",\"city\":\"dubai\",\"phone\":\"svcdcv\"}', '{\"name\":\"test\",\"email\":\"test@gmail.com\",\"address\":\"al karama\",\"zipcode\":\"243445\",\"city\":\"dubai\",\"phone\":\"svcdcv\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 255000.00, 255000.00, 0.00, NULL, 0.00, NULL, NULL, 1733385877, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-05 16:04:37', '2024-12-05 16:04:37'),
(16, NULL, '20241205-09211763', 60, NULL, '{\"name\":\"Nevetha\",\"email\":\"nevetha.tomsher@gmail.com\",\"address\":\"al jadaff\",\"zipcode\":\"12345\",\"city\":\"Dubai\",\"phone\":\"asdcfvb\"}', '{\"name\":\"Nevetha\",\"email\":\"nevetha.tomsher@gmail.com\",\"address\":\"al jadaff\",\"zipcode\":\"12345\",\"city\":\"Dubai\",\"phone\":\"asdcfvb\"}', '', 'confirmed', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 1350.00, 1600.00, 150.00, '10OFF', 100.00, NULL, NULL, 1733390477, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-05 17:21:17', '2024-12-05 17:31:32'),
(17, NULL, '20241205-09380685', 60, NULL, '{\"name\":\"Demo\",\"email\":\"nevetha.tomsher@gmail.com\",\"address\":\"Al karama\",\"zipcode\":\"46378\",\"city\":\"Dubai\",\"phone\":\"scvdfvjdksvn\"}', '{\"name\":\"Test nivi\",\"email\":\"nevetha.tomsher@gmail.com\",\"address\":\"Hamdan street\",\"zipcode\":\"12435\",\"city\":\"Abu Dhabi\",\"phone\":\"050342536271839\"}', 'test info here', 'confirmed', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 4650.00, 4650.00, 0.00, NULL, 0.00, NULL, NULL, 1733391486, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-05 17:38:06', '2024-12-06 14:54:11'),
(18, NULL, '20241213-13554883', 58, NULL, '{\"name\":\"Jisha P\",\"email\":\"jisha@yopmail.com\",\"address\":\"Wafi residence,\\r\\nDubai Healthcare City\",\"zipcode\":\"00000\",\"city\":\"DHC\",\"phone\":\"1122334455\"}', '{\"name\":\"Jisha P\",\"email\":\"jisha@yopmail.com\",\"address\":\"Wafi residence,\\r\\nDubai Healthcare City\",\"zipcode\":\"00000\",\"city\":\"DHC\",\"phone\":\"1122334455\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 255000.00, 270000.00, 0.00, NULL, 15000.00, NULL, NULL, 1734098148, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-13 21:55:48', '2024-12-13 21:55:48'),
(19, NULL, '20241219-14345270', 60, NULL, '{\"name\":\"test\",\"email\":\"nevetha.tomsher@gmail.com\",\"address\":\"ascsdc\",\"zipcode\":\"345354\",\"city\":\"sdzcdscv\",\"phone\":\"fcfsdvfdxgv\"}', '{\"name\":\"test\",\"email\":\"nevetha.tomsher@gmail.com\",\"address\":\"ascsdc\",\"zipcode\":\"345354\",\"city\":\"sdzcdscv\",\"phone\":\"fcfsdvfdxgv\"}', 'demo', 'delivered', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 121.5000, 1336.50, 1350.00, 0.00, NULL, 135.00, NULL, NULL, 1734618892, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-19 22:34:52', '2024-12-20 14:27:47'),
(20, NULL, '20241219-14501143', 60, NULL, '{\"name\":\"etgrt\",\"email\":\"dfgvfd@fegjvdjk.com\",\"address\":\"dfgvfdv\",\"zipcode\":\"bgfbfgbgf\",\"city\":\"dfvbfvb\",\"phone\":\"gfbgnbghn\"}', '{\"name\":\"etgrt\",\"email\":\"dfgvfd@fegjvdjk.com\",\"address\":\"dfgvfdv\",\"zipcode\":\"bgfbfgbgf\",\"city\":\"dfvbfvb\",\"phone\":\"gfbgnbghn\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 2000.00, 2000.00, 0.00, NULL, 0.00, NULL, NULL, 1734619811, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-19 22:50:11', '2024-12-19 22:50:11'),
(21, NULL, '20241220-06202412', 60, NULL, '{\"name\":\"test user\",\"email\":\"nevetha.tomsher@gmail.com\",\"address\":\"dummy address\",\"zipcode\":\"152036\",\"city\":\"dubai\",\"phone\":\"0502563215\"}', '{\"name\":\"test user\",\"email\":\"nevetha.tomsher@gmail.com\",\"address\":\"dummy address\",\"zipcode\":\"152036\",\"city\":\"dubai\",\"phone\":\"0502563215\"}', '', 'cancelled', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 424300.00, 424300.00, 0.00, NULL, 0.00, NULL, NULL, 1734675624, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-20 14:20:24', '2025-08-23 10:02:08'),
(22, NULL, '20241220-08232730', 60, NULL, '{\"name\":\"Test\",\"email\":\"nevetha.tomsher@hmail.com\",\"address\":\"Steghsn\",\"zipcode\":\"Wtuwhbw\",\"city\":\"Dubai\",\"phone\":\"05035362728\"}', '{\"name\":\"Test\",\"email\":\"nevetha.tomsher@hmail.com\",\"address\":\"Steghsn\",\"zipcode\":\"Wtuwhbw\",\"city\":\"Dubai\",\"phone\":\"05035362728\"}', 'Test', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 139.0000, 534604.00, 534600.00, 0.00, NULL, 135.00, NULL, NULL, 1734683007, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-20 16:23:27', '2024-12-20 16:23:27'),
(23, NULL, '20241220-09110591', 60, NULL, '{\"name\":\"Dhjsnmak\",\"email\":\"nevegh@gnajk.com\",\"address\":\"Bbxbnxjsjjj\",\"zipcode\":\"Evhneje\",\"city\":\"Avbnann\",\"phone\":\"21548709354\"}', '{\"name\":\"Dhjsnmak\",\"email\":\"nevegh@gnajk.com\",\"address\":\"Bbxbnxjsjjj\",\"zipcode\":\"Evhneje\",\"city\":\"Avbnann\",\"phone\":\"21548709354\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 135000.00, 150000.00, 0.00, NULL, 15000.00, NULL, NULL, 1734685865, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-20 17:11:05', '2024-12-20 17:11:05'),
(24, NULL, '20241220-10071873', 60, NULL, '{\"name\":\"Test\",\"email\":\"fvdxfv@fhjf.com\",\"address\":\"Dhejejzhjwjj\",\"zipcode\":\"sdgfvdgv\",\"city\":\"Dxb\",\"phone\":\"74568152460\"}', '{\"name\":\"Test\",\"email\":\"fvdxfv@fhjf.com\",\"address\":\"Dhejejzhjwjj\",\"zipcode\":\"sdgfvdgv\",\"city\":\"Dxb\",\"phone\":\"74568152460\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 62990.00, 70000.00, 10.00, 'NEWPRO10', 7000.00, NULL, NULL, 1734689238, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-20 18:07:18', '2024-12-20 18:07:18'),
(25, NULL, '20241223-09010691', 9, NULL, '{\"name\":\"Dhanya\",\"email\":\"dhanya@tomsher.com\",\"address\":\"gbtrgbt\",\"zipcode\":\"00\",\"city\":\"dv\",\"phone\":\"fref\"}', '{\"name\":\"Dhanya\",\"email\":\"dhanya@tomsher.com\",\"address\":\"gbtrgbt\",\"zipcode\":\"00\",\"city\":\"dv\",\"phone\":\"fref\"}', '', 'pending', 'card', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 463000.00, 470000.00, 0.00, NULL, 7000.00, NULL, NULL, 1734944466, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-23 17:01:06', '2024-12-23 17:01:06'),
(26, NULL, '20241223-09011537', 9, NULL, '{\"name\":\"Dhanya\",\"email\":\"dhanya@tomsher.com\",\"address\":\"gbtrgbt\",\"zipcode\":\"00\",\"city\":\"dv\",\"phone\":\"fref\"}', '{\"name\":\"Dhanya\",\"email\":\"dhanya@tomsher.com\",\"address\":\"gbtrgbt\",\"zipcode\":\"00\",\"city\":\"dv\",\"phone\":\"fref\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 463000.00, 470000.00, 0.00, NULL, 7000.00, NULL, NULL, 1734944475, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2024-12-23 17:01:15', '2024-12-23 17:01:15'),
(27, NULL, '20250823-04360960', 60, NULL, '{\"name\":\"Test\",\"email\":\"tes@gmail.om\",\"address\":\"Test\",\"zipcode\":\"88888\",\"city\":\"Test\",\"phone\":\"971555656565\"}', '{\"name\":\"Test\",\"email\":\"tes@gmail.om\",\"address\":\"Test\",\"zipcode\":\"88888\",\"city\":\"Test\",\"phone\":\"971555656565\"}', '', 'picked_up', 'cod', 'paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 8590.00, 8600.00, 10.00, '10OFF', 0.00, NULL, NULL, 1755923769, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2025-08-23 08:36:09', '2025-08-23 08:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_stock_id` int(11) DEFAULT NULL,
  `variation` longtext DEFAULT NULL,
  `og_price` double(20,2) DEFAULT NULL,
  `offer_price` double(20,2) NOT NULL DEFAULT 0.00,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) DEFAULT 'pending',
  `return_expiry_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_stock_id`, `variation`, `og_price`, `offer_price`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `return_expiry_date`, `created_at`, `updated_at`) VALUES
(13, 9, 32, 10, '[{\"name\":\"Color\",\"value\":\"Silver\"}]', 50000.00, 49000.00, 49000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-11-26 14:26:09', '2024-11-26 14:26:09'),
(14, 10, 30, 8, '[]', 150000.00, 150000.00, 150000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-11-26 18:40:54', '2024-11-26 18:40:54'),
(15, 11, 33, 12, '[]', 120000.00, 120000.00, 120000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-11-29 07:41:40', '2024-11-29 07:41:40'),
(16, 12, 32, 9, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 100000.00, 99000.00, 99000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-11-30 09:19:15', '2024-11-30 09:19:15'),
(17, 12, 33, 12, '[]', 120000.00, 120000.00, 120000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-11-30 09:19:15', '2024-11-30 09:19:15'),
(18, 13, 30, 8, '[]', 150000.00, 150000.00, 150000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-11-30 10:23:08', '2024-11-30 10:23:08'),
(19, 13, 36, 16, '[]', 1600.00, 1600.00, 1600.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-11-30 10:23:08', '2024-11-30 10:23:08'),
(20, 14, 32, 9, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 100000.00, 100000.00, 300000.00, 0.00, 0.00, 3, 'unpaid', 'confirmed', NULL, '2024-12-04 09:18:20', '2024-12-05 22:24:49'),
(21, 14, 32, 9, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 100000.00, 100000.00, 100000.00, 0.00, 0.00, 1, 'unpaid', 'confirmed', NULL, '2024-12-04 09:18:20', '2024-12-05 22:24:49'),
(22, 14, 32, 9, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 100000.00, 100000.00, 200000.00, 0.00, 0.00, 2, 'unpaid', 'confirmed', NULL, '2024-12-04 09:18:20', '2024-12-05 22:24:49'),
(23, 15, 41, 23, '[]', 255000.00, 255000.00, 255000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-05 08:04:37', '2024-12-05 08:04:37'),
(24, 16, 36, 16, '[]', 1600.00, 1500.00, 1500.00, 0.00, 0.00, 1, 'unpaid', 'confirmed', NULL, '2024-12-05 09:21:17', '2024-12-05 17:31:32'),
(25, 17, 35, 15, '[]', 4300.00, 4300.00, 4300.00, 0.00, 0.00, 1, 'unpaid', 'confirmed', NULL, '2024-12-05 09:38:07', '2024-12-06 14:54:11'),
(26, 17, 38, 18, '[]', 350.00, 350.00, 350.00, 0.00, 0.00, 1, 'unpaid', 'confirmed', NULL, '2024-12-05 09:38:07', '2024-12-06 14:54:11'),
(27, 18, 30, 8, '[]', 150000.00, 135000.00, 135000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-13 13:55:48', '2024-12-13 13:55:48'),
(28, 18, 33, 12, '[]', 120000.00, 120000.00, 120000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-13 13:55:48', '2024-12-13 13:55:48'),
(29, 19, 45, 27, '[]', 1350.00, 1215.00, 1215.00, 121.50, 0.00, 1, 'unpaid', 'delivered', NULL, '2024-12-19 14:34:52', '2024-12-20 14:27:47'),
(30, 20, 46, 28, '[]', 2000.00, 2000.00, 2000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-19 14:50:11', '2024-12-19 14:50:11'),
(31, 21, 33, 12, '[]', 120000.00, 120000.00, 120000.00, 0.00, 0.00, 1, 'unpaid', 'cancelled', NULL, '2024-12-20 06:20:24', '2025-08-23 10:02:09'),
(32, 21, 35, 15, '[]', 4300.00, 4300.00, 4300.00, 0.00, 0.00, 1, 'unpaid', 'cancelled', NULL, '2024-12-20 06:20:24', '2025-08-23 10:02:09'),
(33, 21, 34, 13, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 300000.00, 300000.00, 300000.00, 0.00, 0.00, 1, 'unpaid', 'cancelled', NULL, '2024-12-20 06:20:24', '2025-08-23 10:02:09'),
(34, 22, 33, 12, '[]', 120000.00, 120000.00, 120000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-20 08:23:27', '2024-12-20 08:23:27'),
(35, 22, 32, 9, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 100000.00, 100000.00, 100000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-20 08:23:27', '2024-12-20 08:23:27'),
(36, 22, 35, 15, '[]', 4300.00, 4300.00, 12900.00, 0.00, 0.00, 3, 'unpaid', 'pending', NULL, '2024-12-20 08:23:27', '2024-12-20 08:23:27'),
(37, 22, 45, 27, '[]', 1350.00, 1215.00, 1215.00, 121.50, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-20 08:23:27', '2024-12-20 08:23:27'),
(38, 22, 38, 18, '[]', 350.00, 350.00, 350.00, 17.50, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-20 08:23:27', '2024-12-20 08:23:27'),
(39, 22, 34, 13, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 300000.00, 300000.00, 300000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-20 08:23:27', '2024-12-20 08:23:27'),
(40, 23, 30, 8, '[]', 150000.00, 135000.00, 135000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-20 09:11:05', '2024-12-20 09:11:05'),
(41, 24, 30, 8, '[]', 70000.00, 63000.00, 63000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-20 10:07:18', '2024-12-20 10:07:18'),
(42, 25, 34, 13, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 300000.00, 300000.00, 300000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-23 09:01:06', '2024-12-23 09:01:06'),
(43, 25, 30, 8, '[]', 70000.00, 63000.00, 63000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-23 09:01:06', '2024-12-23 09:01:06'),
(44, 25, 32, 9, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 100000.00, 100000.00, 100000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-23 09:01:06', '2024-12-23 09:01:06'),
(45, 26, 34, 13, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 300000.00, 300000.00, 300000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-23 09:01:15', '2024-12-23 09:01:15'),
(46, 26, 30, 8, '[]', 70000.00, 63000.00, 63000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-23 09:01:15', '2024-12-23 09:01:15'),
(47, 26, 32, 9, '[{\"name\":\"Color\",\"value\":\"Gold\"}]', 100000.00, 100000.00, 100000.00, 0.00, 0.00, 1, 'unpaid', 'pending', NULL, '2024-12-23 09:01:15', '2024-12-23 09:01:15'),
(48, 27, 35, 15, '[]', 4300.00, 4300.00, 8600.00, 0.00, 0.00, 2, 'paid', 'picked_up', NULL, '2025-08-23 04:36:09', '2025-08-23 08:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `payment_details` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `order_payments`
--

INSERT INTO `order_payments` (`id`, `order_id`, `payment_status`, `payment_details`, `created_at`, `updated_at`) VALUES
(3, 8, 'Success', '{\"order_id\":\"20240205-16471166\",\"tracking_id\":\"113051184649\",\"bank_ref_no\":\"191086\",\"order_status\":\"Success\",\"failure_message\":\"\",\"payment_mode\":\"Credit Card\",\"card_name\":\"MasterCard\",\"status_code\":\"00\",\"status_message\":\"Approved\",\"currency\":\"AED\",\"amount\":\"24653.77\",\"billing_name\":\"Jisha P\",\"billing_address\":\"Flat No 303, Building name, city name, country name\",\"billing_city\":\"Dubai\",\"billing_state\":\"Dubai\",\"billing_zip\":\"\",\"billing_country\":\"United Arab Emirates\",\"billing_tel\":\"971568650838\",\"billing_email\":\"test1@gmail.com\",\"delivery_name\":\"\",\"delivery_address\":\"\",\"delivery_city\":\"\",\"delivery_state\":\"\",\"delivery_zip\":\"\",\"delivery_country\":\"\",\"delivery_tel\":\"\",\"merchant_param1\":\"\",\"merchant_param2\":\"\",\"merchant_param3\":\"\",\"merchant_param4\":\"\",\"merchant_param5\":\"\",\"vault\":\"N\",\"offer_type\":\"null\",\"offer_code\":\"null\",\"discount_value\":\"0.0\",\"mer_amount\":\"24653.77\",\"eci_value\":\"02\",\"card_holder_name\":\"\",\"bank_qsi_no\":\"59434722847950\",\"bank_receipt_no\":\"403612191086\",\"merchant_param6\":\"5123450008\"}', '2024-02-05 20:47:52', '2024-02-05 20:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL COMMENT 'pending, confirmed, picked_up, on_the_way, delivered, cancelled',
  `description` varchar(255) DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `order_tracking`
--

INSERT INTO `order_tracking` (`id`, `order_id`, `status`, `description`, `status_date`, `created_at`, `updated_at`) VALUES
(4, 4, 'pending', 'The order has been placed successfully', '2024-02-05 14:00:19', '2024-02-05 18:00:19', '2024-02-05 18:00:19'),
(5, 5, 'pending', 'The order has been placed successfully', '2024-02-05 14:07:15', '2024-02-05 18:07:15', '2024-02-05 18:07:15'),
(6, 6, 'pending', 'The order has been placed successfully', '2024-02-05 14:14:46', '2024-02-05 18:14:46', '2024-02-05 18:14:46'),
(7, 7, 'pending', 'The order has been placed successfully', '2024-02-05 14:18:07', '2024-02-05 18:18:07', '2024-02-05 18:18:07'),
(8, 8, 'pending', 'The order has been placed successfully', '2024-02-05 16:47:11', '2024-02-05 20:47:11', '2024-02-05 20:47:11'),
(9, 9, 'pending', 'The order has been placed successfully', '2024-11-26 14:26:09', '2024-11-26 22:26:09', '2024-11-26 22:26:09'),
(10, 10, 'pending', 'The order has been placed successfully', '2024-11-26 18:40:54', '2024-11-27 02:40:54', '2024-11-27 02:40:54'),
(11, 11, 'pending', 'The order has been placed successfully', '2024-11-29 07:41:40', '2024-11-29 15:41:40', '2024-11-29 15:41:40'),
(12, 12, 'pending', 'The order has been placed successfully', '2024-11-30 09:19:15', '2024-11-30 17:19:15', '2024-11-30 17:19:15'),
(13, 13, 'pending', 'The order has been placed successfully', '2024-11-30 10:23:08', '2024-11-30 18:23:08', '2024-11-30 18:23:08'),
(14, 14, 'pending', 'The order has been placed successfully', '2024-12-04 09:18:20', '2024-12-04 17:18:20', '2024-12-04 17:18:20'),
(15, 15, 'pending', 'The order has been placed successfully', '2024-12-05 08:04:37', '2024-12-05 16:04:37', '2024-12-05 16:04:37'),
(16, 16, 'pending', 'The order has been placed successfully', '2024-12-05 09:21:17', '2024-12-05 17:21:17', '2024-12-05 17:21:17'),
(17, 16, 'confirmed', NULL, '2024-12-05 09:31:32', '2024-12-05 17:31:32', '2024-12-05 17:31:32'),
(18, 17, 'pending', 'The order has been placed successfully', '2024-12-05 09:38:06', '2024-12-05 17:38:06', '2024-12-05 17:38:06'),
(19, 14, 'confirmed', NULL, '2024-12-05 14:24:49', '2024-12-05 22:24:49', '2024-12-05 22:24:49'),
(20, 17, 'confirmed', NULL, '2024-12-06 06:54:11', '2024-12-06 14:54:11', '2024-12-06 14:54:11'),
(21, 18, 'pending', 'The order has been placed successfully', '2024-12-13 13:55:48', '2024-12-13 21:55:48', '2024-12-13 21:55:48'),
(22, 19, 'pending', 'The order has been placed successfully', '2024-12-19 14:34:52', '2024-12-19 22:34:52', '2024-12-19 22:34:52'),
(23, 20, 'pending', 'The order has been placed successfully', '2024-12-19 14:50:11', '2024-12-19 22:50:11', '2024-12-19 22:50:11'),
(24, 21, 'pending', 'The order has been placed successfully', '2024-12-20 06:20:24', '2024-12-20 14:20:24', '2024-12-20 14:20:24'),
(25, 19, 'confirmed', NULL, '2024-12-20 06:25:29', '2024-12-20 14:25:29', '2024-12-20 14:25:29'),
(26, 19, 'picked_up', NULL, '2024-12-20 06:25:54', '2024-12-20 14:25:54', '2024-12-20 14:25:54'),
(27, 19, 'delivered', NULL, '2024-12-20 06:27:47', '2024-12-20 14:27:47', '2024-12-20 14:27:47'),
(28, 22, 'pending', 'The order has been placed successfully', '2024-12-20 08:23:27', '2024-12-20 16:23:27', '2024-12-20 16:23:27'),
(29, 23, 'pending', 'The order has been placed successfully', '2024-12-20 09:11:05', '2024-12-20 17:11:05', '2024-12-20 17:11:05'),
(30, 24, 'pending', 'The order has been placed successfully', '2024-12-20 10:07:18', '2024-12-20 18:07:18', '2024-12-20 18:07:18'),
(31, 25, 'pending', 'The order has been placed successfully', '2024-12-23 09:01:06', '2024-12-23 17:01:06', '2024-12-23 17:01:06'),
(32, 26, 'pending', 'The order has been placed successfully', '2024-12-23 09:01:15', '2024-12-23 17:01:15', '2024-12-23 17:01:15'),
(33, 27, 'pending', 'The order has been placed successfully', '2025-08-23 04:36:09', '2025-08-23 08:36:09', '2025-08-23 08:36:09'),
(34, 27, 'confirmed', NULL, '2025-08-23 04:38:19', '2025-08-23 08:38:19', '2025-08-23 08:38:19'),
(35, 27, 'picked_up', NULL, '2025-08-23 04:38:21', '2025-08-23 08:38:21', '2025-08-23 08:38:21'),
(36, 21, 'cancelled', NULL, '2025-08-23 06:02:08', '2025-08-23 10:02:08', '2025-08-23 10:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `slug`, `image`, `image1`, `image2`, `image3`, `image4`, `video`, `status`, `created_at`, `updated_at`) VALUES
(1, 'home', 'Shop Home Page', '/storage/pages/image_3.webp,/storage/pages/image_4.png,/storage/pages/image_5.png', NULL, NULL, NULL, NULL, '/storage/videos/1734181450.mp4', 1, '2024-02-17 17:02:11', '2024-11-21 14:24:14'),
(2, 'privacy_policy', 'Privacy Policy', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:02:11', '2024-02-17 17:02:11'),
(3, 'terms', 'Terms and Conditions', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:02:11', '2024-02-17 17:02:11'),
(4, 'refund_return', 'Refund and Returns Policy', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-02-17 17:02:11', '2024-02-17 17:02:11'),
(5, 'find_us', 'Find Us', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-02-17 17:02:11', '2024-02-17 17:02:11'),
(6, 'news', 'News', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-02-17 17:02:11', '2024-02-17 17:02:11'),
(7, 'contact_us', 'Contact Us', '/storage/pages/image_1.jpg', NULL, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:02:11', '2024-12-24 20:42:27'),
(8, 'faq', 'Frequently Asked Questions (FAQ)', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2024-02-17 17:02:11', '2024-02-17 17:02:11'),
(9, 'about_us', 'About Us', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:02:11', '2024-02-17 17:02:11'),
(10, 'mortgage', 'Mortgage', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-12-07 13:18:25', '2024-12-07 13:18:25'),
(11, 'sales', 'Sales', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-12-07 13:18:25', '2024-12-07 13:18:25'),
(12, 'auction_home', 'Auction Home Page', '/storage/pages/image_1.webp,/storage/pages/image_2.png', '/storage/pages/auction_image_1.png', '/storage/pages/auction_image_2.png', '/storage/pages/auction_image_3.png', '/storage/pages/auction_image_4.png', '/storage/videos/1734181450.mp4', 1, '2024-02-17 17:02:11', '2024-12-14 21:13:10'),
(13, 'rent_home', 'Rent Home Page', '/storage/pages/image_1.webp,/storage/pages/image_2.png,/storage/pages/image_3.png', NULL, NULL, NULL, NULL, '/storage/videos/1734181450.mp4', 1, '2024-02-17 17:02:11', '2024-12-14 21:16:42'),
(14, 'shipping_policy', 'Shipping Policy', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:02:11', '2024-02-17 17:02:11'),
(15, 'return_policy', 'Return Policy', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:02:11', '2024-02-17 17:02:11'),
(16, 'customer_login', 'Customer Login', '/storage/pages/image_1.jpg', NULL, NULL, NULL, NULL, NULL, 1, '2025-01-21 01:16:20', '2025-01-21 01:27:06'),
(17, 'customer_register', 'Customer Registration', '/storage/pages/1737381931_678e582b060c4.jpg', NULL, NULL, NULL, NULL, NULL, 1, '2025-01-21 01:17:14', '2025-01-21 02:05:31'),
(18, 'vendor_login', 'Vendor Login', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-21 01:17:39', '2025-01-21 01:17:39'),
(19, 'vendor_register', 'Vendor Registration', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-01-21 01:18:07', '2025-01-21 01:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `title1` varchar(255) DEFAULT NULL,
  `title2` varchar(255) DEFAULT NULL,
  `title3` varchar(255) DEFAULT NULL,
  `heading1` varchar(255) DEFAULT NULL,
  `content1` longtext DEFAULT NULL,
  `heading2` varchar(255) DEFAULT NULL,
  `image1` varchar(191) DEFAULT NULL,
  `image2` varchar(191) DEFAULT NULL,
  `content2` longtext DEFAULT NULL,
  `heading3` varchar(255) DEFAULT NULL,
  `content3` longtext DEFAULT NULL,
  `content4` text DEFAULT NULL,
  `content5` text DEFAULT NULL,
  `heading4` varchar(255) DEFAULT NULL,
  `heading5` varchar(255) DEFAULT NULL,
  `heading6` varchar(255) DEFAULT NULL,
  `heading7` varchar(255) DEFAULT NULL,
  `heading8` varchar(255) DEFAULT NULL,
  `heading9` varchar(255) DEFAULT NULL,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `keywords` longtext DEFAULT NULL,
  `og_title` mediumtext DEFAULT NULL,
  `og_description` longtext DEFAULT NULL,
  `twitter_title` mediumtext DEFAULT NULL,
  `twitter_description` longtext DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `page_translations`
--

INSERT INTO `page_translations` (`id`, `page_id`, `lang`, `title`, `content`, `sub_title`, `title1`, `title2`, `title3`, `heading1`, `content1`, `heading2`, `image1`, `image2`, `content2`, `heading3`, `content3`, `content4`, `content5`, `heading4`, `heading5`, `heading6`, `heading7`, `heading8`, `heading9`, `meta_title`, `meta_description`, `keywords`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `meta_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 'DISCOVER', NULL, 'NEW ARRIVAL OUR PICKS', NULL, NULL, NULL, 'OCCASIONS', NULL, NULL, 'Create your rings with award-winning jewellers', 'SPECIAL PRODUCTS', 'SHOP BY BRAND', 'we are associated with', 'SHOP BY PARTNERS', 'NEWSLETTER', 'Sign up to be aware of our new products and all developments!', 'Meta Title Home', 'Meta Description Home', 'Meta Keywords Home', 'OG Title Home', 'OG Description Home', 'Twitter Title Home', 'Twitter Description Home', NULL, '2024-11-19 14:18:21', '2024-12-14 21:26:53'),
(2, 1, 'ae', NULL, NULL, NULL, NULL, NULL, NULL, 'DISCOVER ARABIC', NULL, 'NEW ARRIVAL OUR PICKS ARABIC', NULL, NULL, NULL, 'OCCASIONS ARABIC', NULL, NULL, NULL, 'SPECIAL PRODUCTS ARABIC', 'SHOP BY BRAND ARABIC', 'we are associated with Arabic', 'SHOP BY PARTNERS ARABIC', 'NEWSLETTER ARABIC', 'Sign up to be aware of our new products and all developments! Arabic', 'Meta Title Home Arabic', 'Meta Description  Home Arabic', 'Meta Keywords  Home Arabic', 'OG Title  Home Arabic', 'OG Description  Home Arabic', 'Twitter Title  Home Arabic', 'Twitter Description  Home Arabic', NULL, '2024-11-19 14:19:44', '2024-11-19 17:45:08'),
(3, 2, 'en', 'Privacy Policy', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fringilla nulla sed malesuada consectetur. Nulla congue elementum urna bibendum tincidunt. Donec lobortis mollis ipsum at egestas. Sed ultricies vulputate quam, ac pulvinar nisi mollis a. Donec convallis nisi non ultricies rhoncus. Ut ac sapien ac turpis condimentum consequat. In a nisl tempor, iaculis justo vitae, pellentesque tellus. Proin venenatis molestie leo id vehicula. Ut erat leo, molestie vel lorem nec, commodo iaculis ante. Aenean hendrerit lectus et odio placerat vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis pulvinar ipsum ut neque ultricies tempus. Suspendisse laoreet ac nisl eget vehicula. Curabitur aliquam nulla a justo auctor convallis. Morbi rhoncus facilisis nunc, ultrices iaculis orci fermentum ut. Integer lobortis, odio quis porttitor hendrerit, turpis lectus rutrum elit, non interdum lacus dolor in justo.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Aenean fermentum odio eget quam egestas, nec accumsan nibh euismod. Morbi quis auctor ante. Aliquam non justo a velit consequat iaculis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla sit amet augue eu elit sodales fringilla eu sit amet sem. Integer congue rutrum porta. Vestibulum maximus vulputate eros, eget maximus tortor facilisis at. Phasellus urna mi, commodo sed venenatis eu, blandit id ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed sagittis aliquam dui non varius. Quisque est libero, condimentum eget tortor et, fermentum egestas enim. Praesent luctus pharetra augue, vel rhoncus dolor tincidunt malesuada. Aliquam faucibus nunc purus, ac bibendum sem interdum id. Duis sapien lectus, euismod vitae risus tempus, porttitor pretium mauris. Duis luctus consequat vehicula. Etiam leo velit, sagittis sed augue congue, viverra dapibus eros. Nam rhoncus lorem vel nisl convallis consequat. Suspendisse tempor iaculis elementum. Nullam a lacus sit amet quam vestibulum tristique ac ac eros. Suspendisse cursus urna at eros fringilla ullamcorper quis in orci. Pellentesque a lorem dolor. Vivamus pharetra, sapien a porta cursus, est leo sollicitudin augue, ac hendrerit felis mi id metus.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title Privacy Policy', 'Meta Description Privacy Policy', 'Meta Keywords Privacy Policy', 'OG Title Privacy Policy', 'OG Description Privacy Policy', 'Twitter Title Privacy Policy', 'Twitter Description Privacy Policy', NULL, '2024-11-19 17:12:42', '2024-12-24 20:31:29'),
(4, 2, 'ae', 'Privacy policy Arabic', '<p>Privacy policy content Arabic</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title Privacy policy Arabic', 'Meta Description Privacy policy Arabic', 'Meta Keywords  Privacy policy Arabic', 'OG Title Privacy policy Arabic', 'OG Description  Privacy policy Arabic', 'Twitter Title Privacy policy Arabic', 'Twitter Description Privacy policy Arabic', NULL, '2024-11-19 17:16:08', '2024-11-19 17:16:08'),
(5, 3, 'en', 'Terms and Conditions', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fringilla nulla sed malesuada consectetur. Nulla congue elementum urna bibendum tincidunt. Donec lobortis mollis ipsum at egestas. Sed ultricies vulputate quam, ac pulvinar nisi mollis a. Donec convallis nisi non ultricies rhoncus. Ut ac sapien ac turpis condimentum consequat. In a nisl tempor, iaculis justo vitae, pellentesque tellus. Proin venenatis molestie leo id vehicula. Ut erat leo, molestie vel lorem nec, commodo iaculis ante. Aenean hendrerit lectus et odio placerat vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis pulvinar ipsum ut neque ultricies tempus. Suspendisse laoreet ac nisl eget vehicula. Curabitur aliquam nulla a justo auctor convallis. Morbi rhoncus facilisis nunc, ultrices iaculis orci fermentum ut. Integer lobortis, odio quis porttitor hendrerit, turpis lectus rutrum elit, non interdum lacus dolor in justo.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Aenean fermentum odio eget quam egestas, nec accumsan nibh euismod. Morbi quis auctor ante. Aliquam non justo a velit consequat iaculis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla sit amet augue eu elit sodales fringilla eu sit amet sem. Integer congue rutrum porta. Vestibulum maximus vulputate eros, eget maximus tortor facilisis at. Phasellus urna mi, commodo sed venenatis eu, blandit id ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed sagittis aliquam dui non varius. Quisque est libero, condimentum eget tortor et, fermentum egestas enim. Praesent luctus pharetra augue, vel rhoncus dolor tincidunt malesuada. Aliquam faucibus nunc purus, ac bibendum sem interdum id. Duis sapien lectus, euismod vitae risus tempus, porttitor pretium mauris. Duis luctus consequat vehicula. Etiam leo velit, sagittis sed augue congue, viverra dapibus eros. Nam rhoncus lorem vel nisl convallis consequat. Suspendisse tempor iaculis elementum. Nullam a lacus sit amet quam vestibulum tristique ac ac eros. Suspendisse cursus urna at eros fringilla ullamcorper quis in orci. Pellentesque a lorem dolor. Vivamus pharetra, sapien a porta cursus, est leo sollicitudin augue, ac hendrerit felis mi id metus.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title terms en', NULL, NULL, 'OG Title terms en', NULL, 'Twitter Title terms en', NULL, NULL, '2024-11-19 17:16:51', '2024-12-24 20:31:19'),
(6, 3, 'ae', 'Terms and Conditions arabic', '<p>Terms and Conditions arabic content</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title terms ar', NULL, NULL, 'OG Title terms ar', NULL, 'Twitter Title terms ar', NULL, NULL, '2024-11-19 17:18:16', '2024-11-19 17:18:16'),
(7, 9, 'en', 'Our Story', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">At Zena & Kazena, we believe that every piece of jewelry tells a story, a narrative of elegance, luxury, and individuality. Founded with a passion for exceptional artistry, our brand has grown into a symbol of sophistication and quality. Each collection is crafted by award-winning designers and jewelers, blending timeless designs with modern aesthetics to create unique and cherished pieces.</span></p>', NULL, NULL, NULL, NULL, 'Our Mission', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">Our mission is to redefine luxury jewelry by providing customers with exclusive, high-quality designs that celebrate life\'s special moments. From custom engagement rings to everyday elegance, Zena & Kazena is committed to excellence, using only the finest materials and paying meticulous attention to detail in every piece.</span></p>', 'Why Choose Us?', NULL, NULL, '<ul style=\"padding-left: 1.5rem; color: rgb(85, 85, 85); font-size: 1rem; line-height: 1.6; font-family: NeueMontreal-Regular;\"><li><span style=\"font-weight: bolder;\">Exquisite Craftsmanship:</span> Our team of skilled artisans and gemologists ensures every piece is crafted to perfection.</li><li><span style=\"font-weight: bolder;\">Premium Quality:</span> We source the finest materials to create jewelry that stands the test of time.</li><li><span style=\"font-weight: bolder;\">Personalized Experience:</span> From custom designs to exclusive collections, our jewelry is made just for you.</li><li><span style=\"font-weight: bolder;\">Customer Satisfaction:</span> We are dedicated to providing a seamless, luxurious shopping experience with every purchase.</li></ul>', 'Our Collections', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">Discover a world of elegance with our exclusive collections. Each piece, from rings and earrings to necklaces and bracelets, is designed to complement the modern aesthetic while preserving the essence of timeless beauty. Our collections feature a blend of classic and contemporary designs, perfect for every occasion and personal style.</span></p>', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">At Zena & Kazena, we are not just selling jewelry; we are building relationships. We are committed to delivering exceptional value and quality, backed by a team dedicated to providing unmatched customer support. We invite you to experience the luxury, artistry, and personal touch that make Zena & Kazena a brand cherished by customers worldwide.</span></p>', NULL, 'Our Commitment to You', NULL, NULL, NULL, NULL, NULL, 'Meta Title about', 'Meta Description about', 'Meta Keywords about', 'OG Title about', 'OG Description about', 'Twitter Title about', 'Twitter Description  about', NULL, '2024-11-19 18:10:03', '2024-11-19 18:13:34'),
(8, 9, 'ae', 'Our Story', '<span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">At Zena &amp; Kazena, we believe that every piece of jewelry tells a story, a narrative of elegance, luxury, and individuality. Founded with a passion for exceptional artistry, our brand has grown into a symbol of sophistication and quality. Each collection is crafted by award-winning designers and jewelers, blending timeless designs with modern aesthetics to create unique and cherished pieces.</span>', NULL, NULL, NULL, NULL, 'Our Mission', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">Our mission is to redefine luxury jewelry by providing customers with exclusive, high-quality designs that celebrate life\'s special moments. From custom engagement rings to everyday elegance, Zena &amp; Kazena is committed to excellence, using only the finest materials and paying meticulous attention to detail in every piece.</span></p>', 'Why Choose Us?', NULL, NULL, '<ul style=\"padding-left: 1.5rem; color: rgb(85, 85, 85); font-size: 1rem; line-height: 1.6; font-family: NeueMontreal-Regular;\"><li><span style=\"font-weight: bolder;\">Exquisite Craftsmanship:</span>&nbsp;Our team of skilled artisans and gemologists ensures every piece is crafted to perfection.</li><li><span style=\"font-weight: bolder;\">Premium Quality:</span>&nbsp;We source the finest materials to create jewelry that stands the test of time.</li><li><span style=\"font-weight: bolder;\">Personalized Experience:</span>&nbsp;From custom designs to exclusive collections, our jewelry is made just for you.</li><li><span style=\"font-weight: bolder;\">Customer Satisfaction:</span>&nbsp;We are dedicated to providing a seamless, luxurious shopping experience with every purchase.</li></ul>', 'Our Collections', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">Discover a world of elegance with our exclusive collections. Each piece, from rings and earrings to necklaces and bracelets, is designed to complement the modern aesthetic while preserving the essence of timeless beauty. Our collections feature a blend of classic and contemporary designs, perfect for every occasion and personal style.</span></p>', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">At Zena &amp; Kazena, we are not just selling jewelry; we are building relationships. We are committed to delivering exceptional value and quality, backed by a team dedicated to providing unmatched customer support. We invite you to experience the luxury, artistry, and personal touch that make Zena &amp; Kazena a brand cherished by customers worldwide.</span></p>', NULL, 'Our Commitment to You', NULL, NULL, NULL, NULL, NULL, 'Meta Title ar about', NULL, NULL, 'OG Title ar about', NULL, 'Twitter Title ar about', NULL, NULL, '2024-11-19 18:15:11', '2024-11-19 18:15:11'),
(9, 7, 'en', 'Contact Us', 'Dubai - Mall of the Emirates<br/>\r\nDubai - Bayt Damas<br/>\r\nDubai - Dubai Mall', NULL, NULL, NULL, NULL, 'Get in Touch', NULL, 'Location', NULL, NULL, NULL, '(+971) 828 4153', NULL, NULL, NULL, 'zenakazena@yopmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-29 22:28:55', '2024-11-30 23:35:59'),
(10, 10, 'en', 'Mortgage', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 18px; text-align: center;\">A mortgage is a loan used to purchase real estate, where the property itself serves as collateral. It allows buyers to finance the majority of the purchase price while making an initial down payment. Borrowers agree to repay the loan in regular installments over a set term, typically 15 to 30 years, with each payment including both principal and interest. Mortgages can have fixed or adjustable interest rates, influencing the total cost of the loan. If the borrower fails to meet the repayment obligations, the lender has the right to foreclose on the property. Mortgages are essential for most homebuyers, providing a practical way to own property without needing the full purchase price upfront.</span></p>', NULL, NULL, NULL, NULL, 'How Mortgages Work', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 18px; background-color: rgb(236, 236, 236);\">Individuals and businesses use mortgages to buy real estate without paying the entire purchase price upfront. The borrower repays the loan plus interest over a specified number of years until they own the property free and clear. Most traditional mortgages are fully amortized. This means that the regular payment amount will stay the same, but different proportions of principal vs. interest will be paid over the life of the loan with each payment. Typical mortgage terms are for 15 or 30 years, but some mortages can run for longer terms. Mortgages are also known as liens against property or claims on property. If the borrower stops paying the mortgage, the lender can foreclose on the property. For example, a residential homebuyer pledges their house to their lender, which then has a claim on the property. This ensures the lender’s interest in the property should the buyer default on their financial obligation. In the case of foreclosure, the lender may evict the residents, sell the property, and use the money from the sale to pay off the mortgage debt.</span></p>', 'The Mortgage Process', '/storage/pages/1733577801_67544c49c3074.jpg', '/storage/pages/1733577801_67544c49c6090.jpg', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 18px; background-color: rgb(236, 236, 236);\">Would-be borrowers begin the process by applying to one or more mortgage lenders. The lender will ask for evidence that the borrower is capable of repaying the loan. This may include bank and investment statements, recent tax returns, and proof of current employment. The lender will generally run a credit check as well. If the application is approved, the lender will offer the borrower a loan of up to a certain amount and at a particular interest rate. Homebuyers can apply for a mortgage after they have chosen a property to buy or even while they are still shopping for one, thanks to a process known as pre-approval. Being pre-approved for a mortgage can give buyers an edge in a tight housing market because sellers will know that they have the money to back up their offer. Once a buyer and seller agree on the terms of their deal, they or their representatives will meet at what’s called a closing. This is when the borrower makes their down payment to the lender. The seller will transfer ownership of the property to the buyer and receive the agreed-upon sum of money, and the buyer will sign any remaining mortgage documents. The lender may charge fees for originating the loan (sometimes in the form of points) at the closing.</span></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-07 16:19:13', '2024-12-07 21:23:21'),
(11, 10, 'ae', 'الرهن العقاري', '<p>الرهن العقاري هو قرض يستخدم لشراء العقارات، حيث يعمل العقار نفسه كضمان. وهو يسمح للمشترين بتمويل غالبية سعر الشراء مع سداد دفعة أولى. ويوافق المقترضون على سداد القرض على أقساط منتظمة على مدى فترة محددة، عادة من 15 إلى 30 عامًا، مع كل دفعة تشمل كلًا من أصل القرض والفائدة. يمكن أن تكون أسعار الفائدة على الرهن العقاري ثابتة أو قابلة للتعديل، مما يؤثر على التكلفة الإجمالية للقرض. إذا فشل المقترض في الوفاء بالتزامات السداد، يحق للمقرض حجز العقار. الرهن العقاري ضروري لمعظم مشتري المنازل، حيث يوفر طريقة عملية لامتلاك العقارات دون الحاجة إلى دفع سعر الشراء بالكامل مقدمًا.</p>', NULL, NULL, NULL, NULL, 'كيف تعمل الرهون العقارية', '<p>يستخدم الأفراد والشركات الرهن العقاري لشراء العقارات دون دفع سعر الشراء بالكامل مقدمًا. يسدد المقترض القرض بالإضافة إلى الفائدة على مدى عدد محدد من السنوات حتى يمتلك العقار خاليًا من الديون. يتم سداد معظم الرهن العقاري التقليدي بالكامل. وهذا يعني أن مبلغ الدفع المنتظم سيبقى كما هو، ولكن سيتم دفع نسب مختلفة من رأس المال مقابل الفائدة على مدار عمر القرض مع كل دفعة. تكون شروط الرهن العقاري النموذجية لمدة 15 أو 30 عامًا، ولكن بعض الرهن العقاري يمكن أن يستمر لفترات أطول. تُعرف الرهن العقاري أيضًا باسم الامتيازات على الممتلكات أو المطالبات على الممتلكات. إذا توقف المقترض عن سداد الرهن العقاري، فيمكن للمقرض حجز العقار. على سبيل المثال، يرهن مشتري المساكن منزله للمقرض، الذي يكون له بعد ذلك مطالبة على العقار. وهذا يضمن مصلحة المقرض في العقار في حالة تخلف المشتري عن سداد التزاماته المالية. في حالة الحجز العقاري، يجوز للمقرض طرد السكان وبيع العقار واستخدام الأموال من البيع لسداد دين الرهن العقاري.</p>', 'عملية الرهن العقاري', '/storage/pages/1733577801_67544c49c3074.jpg', '/storage/pages/1733577801_67544c49c6090.jpg', '<p>يبدأ المقترضون المحتملون العملية بالتقدم إلى أحد أو أكثر من المقرضين العقاريين. سيطلب المقرض دليلاً على أن المقترض قادر على سداد القرض. قد يشمل ذلك البيانات المصرفية والاستثمارية، والإقرارات الضريبية الأخيرة، وإثبات العمل الحالي. سيقوم المقرض عمومًا بإجراء فحص ائتماني أيضًا. إذا تمت الموافقة على الطلب، فسيعرض المقرض على المقترض قرضًا يصل إلى مبلغ معين وبمعدل فائدة معين. يمكن لمشتري المنازل التقدم بطلب للحصول على قرض عقاري بعد اختيارهم للعقار الذي يشترونه أو حتى أثناء تسوقهم لشراء واحد، وذلك بفضل عملية تُعرف باسم الموافقة المسبقة. يمكن أن يمنح الحصول على الموافقة المسبقة على الرهن العقاري المشترين ميزة في سوق الإسكان الضيق لأن البائعين سيعرفون أن لديهم المال لدعم عرضهم. بمجرد أن يتفق المشتري والبائع على شروط صفقتهما، سيجتمعان أو ممثلوهما في ما يسمى بالإغلاق. هذا هو الوقت الذي يقوم فيه المقترض بدفع دفعته المقدمة للمقرض. يقوم البائع بنقل ملكية العقار إلى المشتري ويحصل على المبلغ المتفق عليه من المال، ويقوم المشتري بالتوقيع على أي مستندات رهن عقاري متبقية. قد يفرض المقرض رسومًا مقابل إصدار القرض (أحيانًا في شكل نقاط) عند الإغلاق.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-07 16:32:52', '2024-12-07 16:32:52'),
(12, 11, 'en', 'Sales', '<p><span style=\"font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\">Aenean fermentum odio eget quam egestas, nec accumsan nibh euismod. Morbi quis auctor ante. Aliquam non justo a velit consequat iaculis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla sit amet augue eu elit sodales fringilla eu sit amet sem. Integer congue rutrum porta. Vestibulum maximus vulputate eros, eget maximus tortor facilisis at. Phasellus urna mi, commodo sed venenatis eu, blandit id ipsum.</span></p>', NULL, NULL, NULL, NULL, 'How sales works', '<p><span style=\"font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fringilla nulla sed malesuada consectetur. Nulla congue elementum urna bibendum tincidunt. Donec lobortis mollis ipsum at egestas. Sed ultricies vulputate quam, ac pulvinar nisi mollis a. Donec convallis nisi non ultricies rhoncus. Ut ac sapien ac turpis condimentum consequat. In a nisl tempor, iaculis justo vitae, pellentesque tellus. Proin venenatis molestie leo id vehicula. Ut erat leo, molestie vel lorem nec, commodo iaculis ante. Aenean hendrerit lectus et odio placerat vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis pulvinar ipsum ut neque ultricies tempus. Suspendisse laoreet ac nisl eget vehicula. Curabitur aliquam nulla a justo auctor convallis. Morbi rhoncus facilisis nunc, ultrices iaculis orci fermentum ut. Integer lobortis, odio quis porttitor hendrerit, turpis lectus rutrum elit, non interdum lacus dolor in justo.</span></p>', 'The sales process', '/storage/pages/1735042530_676aa5e22e687.jpg', '/storage/pages/1735042530_676aa5e230745.jpg', '<p><span style=\"font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\">Sed sagittis aliquam dui non varius. Quisque est libero, condimentum eget tortor et, fermentum egestas enim. Praesent luctus pharetra augue, vel rhoncus dolor tincidunt malesuada. Aliquam faucibus nunc purus, ac bibendum sem interdum id. Duis sapien lectus, euismod vitae risus tempus, porttitor pretium mauris. Duis luctus consequat vehicula. Etiam leo velit, sagittis sed augue congue, viverra dapibus eros. Nam rhoncus lorem vel nisl convallis consequat. Suspendisse tempor iaculis elementum. Nullam a lacus sit amet quam vestibulum tristique ac ac eros. Suspendisse cursus urna at eros fringilla ullamcorper quis in orci. Pellentesque a lorem dolor. Vivamus pharetra, sapien a porta cursus, est leo sollicitudin augue, ac hendrerit felis mi id metus.</span></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-07 16:44:38', '2024-12-24 20:15:30'),
(13, 11, 'ae', 'المبيعات', '<p>المبيعات content</p>', NULL, NULL, NULL, NULL, 'كيف تعمل المبيعات', '<p>كيف تعمل المبيعات content</p>', 'عملية المبيعات', '/storage/pages/1733577801_67544c49c3074.jpg', '/storage/pages/1733577801_67544c49c6090.jpg', '<p>عملية المبيعات content ss</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-07 16:46:34', '2024-12-07 16:46:34'),
(14, 12, 'en', 'HOW IT WORKS!', 'Gurantee 100% polyurethane and 100% polyester', 'Create Account', 'Select Products', 'Bid your Quote', 'Bid your Quote', 'DISCOVER', 'We free shipping for all oders over $199', 'NEW ARRIVAL OUR PICKS', '/tmp/php8hsP63', NULL, 'Guarante 100% secure payment online on our website', NULL, 'Guarante 100% secure payment online on our website', NULL, 'Create your rings with award-winning jewellers', 'SPECIAL PRODUCTS', 'SHOP BY BRAND', 'We are partnered with:', 'SHOP BY PARTNERS', 'Newsletter', 'Sign up to be aware of our new products and all developments!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-14 20:56:52', '2024-12-14 21:53:12'),
(15, 13, 'en', NULL, NULL, NULL, NULL, NULL, NULL, 'DISCOVER', NULL, 'NEW ARRIVAL OUR PICKS', NULL, NULL, NULL, NULL, NULL, NULL, 'Create your rings with award-winning jewellers', 'SPECIAL PRODUCTS', 'SHOP BY BRAND', 'we are associated with:', 'SHOP BY PARTNERS', 'Newsletter', 'Sign up to be aware of our new products and all developments!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-14 21:15:23', '2024-12-14 21:26:02'),
(16, 14, 'en', 'Shipping Policy', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fringilla nulla sed malesuada consectetur. Nulla congue elementum urna bibendum tincidunt. Donec lobortis mollis ipsum at egestas. Sed ultricies vulputate quam, ac pulvinar nisi mollis a. Donec convallis nisi non ultricies rhoncus. Ut ac sapien ac turpis condimentum consequat. In a nisl tempor, iaculis justo vitae, pellentesque tellus. Proin venenatis molestie leo id vehicula. Ut erat leo, molestie vel lorem nec, commodo iaculis ante. Aenean hendrerit lectus et odio placerat vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis pulvinar ipsum ut neque ultricies tempus. Suspendisse laoreet ac nisl eget vehicula. Curabitur aliquam nulla a justo auctor convallis. Morbi rhoncus facilisis nunc, ultrices iaculis orci fermentum ut. Integer lobortis, odio quis porttitor hendrerit, turpis lectus rutrum elit, non interdum lacus dolor in justo.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Aenean fermentum odio eget quam egestas, nec accumsan nibh euismod. Morbi quis auctor ante. Aliquam non justo a velit consequat iaculis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla sit amet augue eu elit sodales fringilla eu sit amet sem. Integer congue rutrum porta. Vestibulum maximus vulputate eros, eget maximus tortor facilisis at. Phasellus urna mi, commodo sed venenatis eu, blandit id ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed sagittis aliquam dui non varius. Quisque est libero, condimentum eget tortor et, fermentum egestas enim. Praesent luctus pharetra augue, vel rhoncus dolor tincidunt malesuada. Aliquam faucibus nunc purus, ac bibendum sem interdum id. Duis sapien lectus, euismod vitae risus tempus, porttitor pretium mauris. Duis luctus consequat vehicula. Etiam leo velit, sagittis sed augue congue, viverra dapibus eros. Nam rhoncus lorem vel nisl convallis consequat. Suspendisse tempor iaculis elementum. Nullam a lacus sit amet quam vestibulum tristique ac ac eros. Suspendisse cursus urna at eros fringilla ullamcorper quis in orci. Pellentesque a lorem dolor. Vivamus pharetra, sapien a porta cursus, est leo sollicitudin augue, ac hendrerit felis mi id metus.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title Privacy Policy', 'Meta Description Privacy Policy', 'Meta Keywords Privacy Policy', 'OG Title Privacy Policy', 'OG Description Privacy Policy', 'Twitter Title Privacy Policy', 'Twitter Description Privacy Policy', NULL, '2024-11-19 17:12:42', '2024-12-24 20:31:29'),
(17, 15, 'en', 'Return Policy', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fringilla nulla sed malesuada consectetur. Nulla congue elementum urna bibendum tincidunt. Donec lobortis mollis ipsum at egestas. Sed ultricies vulputate quam, ac pulvinar nisi mollis a. Donec convallis nisi non ultricies rhoncus. Ut ac sapien ac turpis condimentum consequat. In a nisl tempor, iaculis justo vitae, pellentesque tellus. Proin venenatis molestie leo id vehicula. Ut erat leo, molestie vel lorem nec, commodo iaculis ante. Aenean hendrerit lectus et odio placerat vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis pulvinar ipsum ut neque ultricies tempus. Suspendisse laoreet ac nisl eget vehicula. Curabitur aliquam nulla a justo auctor convallis. Morbi rhoncus facilisis nunc, ultrices iaculis orci fermentum ut. Integer lobortis, odio quis porttitor hendrerit, turpis lectus rutrum elit, non interdum lacus dolor in justo.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Aenean fermentum odio eget quam egestas, nec accumsan nibh euismod. Morbi quis auctor ante. Aliquam non justo a velit consequat iaculis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla sit amet augue eu elit sodales fringilla eu sit amet sem. Integer congue rutrum porta. Vestibulum maximus vulputate eros, eget maximus tortor facilisis at. Phasellus urna mi, commodo sed venenatis eu, blandit id ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed sagittis aliquam dui non varius. Quisque est libero, condimentum eget tortor et, fermentum egestas enim. Praesent luctus pharetra augue, vel rhoncus dolor tincidunt malesuada. Aliquam faucibus nunc purus, ac bibendum sem interdum id. Duis sapien lectus, euismod vitae risus tempus, porttitor pretium mauris. Duis luctus consequat vehicula. Etiam leo velit, sagittis sed augue congue, viverra dapibus eros. Nam rhoncus lorem vel nisl convallis consequat. Suspendisse tempor iaculis elementum. Nullam a lacus sit amet quam vestibulum tristique ac ac eros. Suspendisse cursus urna at eros fringilla ullamcorper quis in orci. Pellentesque a lorem dolor. Vivamus pharetra, sapien a porta cursus, est leo sollicitudin augue, ac hendrerit felis mi id metus.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title Privacy Policy', 'Meta Description Privacy Policy', 'Meta Keywords Privacy Policy', 'OG Title Privacy Policy', 'OG Description Privacy Policy', 'Twitter Title Privacy Policy', 'Twitter Description Privacy Policy', NULL, '2024-11-19 17:12:42', '2024-12-24 20:31:29'),
(18, 16, 'en', '1 YEAR ZENA & KAZENA BRAND WARRANTY', 'Zena & Kazena Promise for Exchange and Upgrades.', NULL, NULL, NULL, NULL, '30 DAY RETURN POLICY', 'Zena & Kazena Promise for Exchange and Upgrades.', 'FREE SHIPPING', NULL, NULL, 'Durotan free shipping for all orders over AED 199', 'SECURE PAYMENT', 'We guarantee 100% secure with online payment on our site.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 01:27:06', '2025-01-21 01:27:06'),
(19, 16, 'ae', '1 YEAR ZENA & KAZENA BRAND WARRANTY', 'Zena & Kazena Promise for Exchange and Upgrades.', NULL, NULL, NULL, NULL, '30 DAY RETURN POLICY', 'Zena & Kazena Promise for Exchange and Upgrades.', 'FREE SHIPPING', NULL, NULL, 'Durotan free shipping for all orders over AED 199', 'SECURE PAYMENT', 'We guarantee 100% secure with online payment on our site.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 01:28:07', '2025-01-21 01:28:07'),
(20, 17, 'en', '1 YEAR ZENA & KAZENA BRAND WARRANTY', 'Zena & Kazena Promise for Exchange and Upgrades.', NULL, NULL, NULL, NULL, '30 DAY RETURN POLICY', 'Zena & Kazena Promise for Exchange and Upgrades.', 'FREE SHIPPING', NULL, NULL, 'Durotan free shipping for all orders over AED 199', 'SECURE PAYMENT', 'We guarantee 100% secure with online payment on our site.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 01:33:16', '2025-01-21 01:33:16'),
(21, 18, 'en', '1 YEAR ZENA & KAZENA BRAND WARRANTY', 'Zena & Kazena Promise for Exchange and Upgrades.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 01:33:57', '2025-01-21 01:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `image`, `link`, `sort_order`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Malabar Logo', '64', 'https://www.google.com', 1, 1, NULL, NULL, '2024-11-20 17:28:22', '2024-11-20 17:37:17'),
(3, 'Kalyan', '58', 'https://www.google.com/test', 2, 1, NULL, NULL, '2024-11-20 17:31:09', '2024-11-20 17:31:09'),
(4, 'Royal Dubai', '62', 'https://www.google.com', 4, 1, NULL, NULL, '2024-11-20 17:37:42', '2024-11-20 17:37:42'),
(5, 'Cara', '59', 'https://www.google.com', 3, 1, NULL, NULL, '2024-11-20 17:38:06', '2024-11-20 17:38:06'),
(6, 'Pure Gold', '57', 'https://www.google.com/test', 5, 1, NULL, NULL, '2024-11-20 17:38:31', '2024-11-20 17:38:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('jisha@yopmail.com', '6klIo4NyBtQ6JQttlSrgdhqeUR3l5axjoWovzOqnrZdIhl4oFUBMcUkMa0xqd9hL', '2024-12-09 18:02:31'),
('test@gmail.com', 'ydOYut4tLG0DBqhHZznMjzMhHHLugeBPXvGCDAKOFWYIB7BSx07VbIVO9tWZwxtw', '2024-12-18 22:45:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `payment_details` longtext DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `txn_code` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `guard_name` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `title`, `guard_name`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'manage_roles', 'Manage Roles', 'web', 1, NULL, NULL),
(4, 'manage_products', 'Manage Products', 'web', 1, NULL, NULL),
(5, 'manage_categories', 'Manage Categories', 'web', 1, NULL, NULL),
(6, 'manage_brands', 'Manage Brands', 'web', 1, NULL, NULL),
(7, 'manage_attributes', 'Manage Attributes', 'web', 1, NULL, NULL),
(9, 'product_reviews', 'Manage Product Reviews', 'web', 1, NULL, NULL),
(10, 'manage_orders', 'Manage Orders', 'web', 1, NULL, NULL),
(11, 'manage_customers', 'Manage Customers', 'web', 1, NULL, NULL),
(12, 'upload_files', 'Manage Uploaded Files', 'web', 1, NULL, NULL),
(13, 'view_reports', 'View Reports', 'web', 1, NULL, NULL),
(14, 'manage_marketing', 'Manage Marketing', 'web', 1, NULL, NULL),
(15, 'website_setup', 'Manage Website Setup', 'web', 1, NULL, NULL),
(17, 'manage_staffs', 'Manage Staffs', 'web', 1, NULL, NULL),
(18, 'settings', 'Manage General Settings', 'web', 1, NULL, NULL),
(19, 'popups', 'popups', 'web', 0, NULL, NULL),
(20, 'accreditations', 'accreditations', 'web', 0, NULL, NULL),
(21, 'manage_blogs', 'Manage Blogs', 'web', 1, NULL, NULL),
(22, 'manage_faq', 'Manage FAQ', 'web', 1, NULL, NULL),
(23, 'manage_services', 'Manage Services', 'web', 1, '2025-08-23 05:29:20', '2025-08-23 05:29:20'),
(24, 'manage_projects', 'Manage Projects', 'web', 1, '2025-08-23 05:29:20', '2025-08-23 05:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
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
(2, 'App\\Models\\User', 10, 'API Token', 'cb1a58c5da480c2a9dba2b87ab5ecabf09511797e789f14d3e589d9a778e57dc', '[\"*\"]', NULL, '2023-05-01 13:04:02', '2023-05-01 13:04:02'),
(3, 'App\\Models\\User', 10, 'API Token', '878cbbe3fd6789ecb0e74f2a067346a86b60f1b06c8a05d00d5dbf68791a9d45', '[\"*\"]', '2023-05-01 16:15:18', '2023-05-01 13:04:55', '2023-05-01 16:15:18'),
(4, 'App\\Models\\User', 12, 'tokens', '0a51d24d2ca7d58fe26dfd9c8e5de8d14b6c5dd5f3a873a96db7db9d1a42f86b', '[\"*\"]', NULL, '2023-05-01 13:23:02', '2023-05-01 13:23:02'),
(5, 'App\\Models\\User', 8, 'API Token', '6257dd27e7537375b27ebba70238da587d9e33d8a3ea35b614f456bbda84463b', '[\"*\"]', NULL, '2023-05-01 17:06:02', '2023-05-01 17:06:02'),
(6, 'App\\Models\\User', 8, 'API Token', '427b3b4061633732ea2879f86e62f5b864fe57b4e3465e361e2e7ae4f6e351aa', '[\"*\"]', NULL, '2023-05-01 17:10:13', '2023-05-01 17:10:13'),
(7, 'App\\Models\\User', 8, 'API Token', '3fa464fb83ff034051a45db6cb52c155862db08b05131bfac595bf4b0fc95f22', '[\"*\"]', NULL, '2023-05-01 17:10:41', '2023-05-01 17:10:41'),
(8, 'App\\Models\\User', 8, 'API Token', '2dd3449ebc67aa8d7d5d302c8c3afbb80176def09b59c850ef613c9cadd4f088', '[\"*\"]', NULL, '2023-05-01 17:11:21', '2023-05-01 17:11:21'),
(9, 'App\\Models\\User', 8, 'API Token', '5bde5df55d8957126a79257e70ce2a9c1a92a261b8ab199f0620ea947f39022a', '[\"*\"]', NULL, '2023-05-01 17:11:29', '2023-05-01 17:11:29'),
(10, 'App\\Models\\User', 8, 'API Token', 'd2b3dcc9f1d068f003ca9cb36e493ea3ba4100586981b05de34e85b4cae99bad', '[\"*\"]', NULL, '2023-05-01 17:11:36', '2023-05-01 17:11:36'),
(11, 'App\\Models\\User', 8, 'API Token', 'b7e65f1b07ed58a8ea9fb0cb9427ac6c205f822bd3ddefb5c13247084e9e01b2', '[\"*\"]', NULL, '2023-05-01 17:11:58', '2023-05-01 17:11:58'),
(12, 'App\\Models\\User', 8, 'API Token', '757de513b738f58ddd5fcc9e00bafc4bf65a8cae032132addbf45c780c788d6e', '[\"*\"]', NULL, '2023-05-01 17:12:47', '2023-05-01 17:12:47'),
(13, 'App\\Models\\User', 8, 'API Token', '8f39b3d467b75298767872298ca73ff5d2c1a04ff4f98da26daea9cd73949e20', '[\"*\"]', NULL, '2023-05-01 17:14:19', '2023-05-01 17:14:19'),
(14, 'App\\Models\\User', 8, 'API Token', '6e83023805be6da836f45c947de62b817ef15675e20c6d11927e0169a5915f57', '[\"*\"]', NULL, '2023-05-01 17:14:45', '2023-05-01 17:14:45'),
(15, 'App\\Models\\User', 8, 'API Token', '588d886c0ac7a226c5b6277417d2f055b7b00f995c45c4831ad51940a07e602f', '[\"*\"]', NULL, '2023-05-01 17:15:49', '2023-05-01 17:15:49'),
(16, 'App\\Models\\User', 8, 'API Token', '16dbf940c5fbbd265ebb6b83b75259696a28030b1ff2b0eb402e343b9443f751', '[\"*\"]', NULL, '2023-05-01 17:16:46', '2023-05-01 17:16:46'),
(17, 'App\\Models\\User', 8, 'API Token', '7b6f22ddf7e2812edf1e21f87fd2560a5f8e25ef04a48fe817d6bb116de50ca1', '[\"*\"]', NULL, '2023-05-01 17:16:58', '2023-05-01 17:16:58'),
(18, 'App\\Models\\User', 8, 'API Token', '3838dfd8289f5c261f87f242f8c03431ae0332e1f9cce3a6a23f40b93614dcb5', '[\"*\"]', NULL, '2023-05-01 17:18:05', '2023-05-01 17:18:05'),
(19, 'App\\Models\\User', 8, 'API Token', '74ccae0a407da9b5e98af485492abb69be9b83026e3db7b41f3f233d3b476484', '[\"*\"]', NULL, '2023-05-01 17:18:32', '2023-05-01 17:18:32'),
(21, 'App\\Models\\User', 44, 'API Token', '14432090165fa58d841090eccb25be980114e464f6ed6d6c4465e3d695588319', '[\"*\"]', NULL, '2023-11-10 20:50:36', '2023-11-10 20:50:36'),
(22, 'App\\Models\\User', 50, 'API Token', 'cbab47af4998256bd9a09a3aa8500f6ecc41255ab702ac4760fa45d49138bbed', '[\"*\"]', NULL, '2023-11-10 21:06:50', '2023-11-10 21:06:50'),
(23, 'App\\Models\\User', 50, 'API Token', 'd770c92d2f90b9e559108781dd28c1bf2d09f3d10b1cd8cd3e0b899547d94d56', '[\"*\"]', '2023-11-28 17:02:01', '2023-11-10 21:08:38', '2023-11-28 17:02:01'),
(24, 'App\\Models\\User', 50, 'API Token', 'caabaf1fd22f4309891d730e51ea948ecb33953657bb3ea2fe46e2bf9d6863f9', '[\"*\"]', '2023-11-10 21:53:49', '2023-11-10 21:46:09', '2023-11-10 21:53:49'),
(25, 'App\\Models\\User', 50, 'API Token', 'ca26fcd0281531a25c6e5a856085c10853ad1f93fc4dd15dea3296d38a3fe5f9', '[\"*\"]', NULL, '2023-11-13 14:09:06', '2023-11-13 14:09:06'),
(26, 'App\\Models\\User', 50, 'API Token', 'f78f7aa1ededa9e20c0ebaf701d7fb3c5893b10bb71b2bc01474277184e1e633', '[\"*\"]', NULL, '2023-11-28 17:01:44', '2023-11-28 17:01:44'),
(27, 'App\\Models\\User', 50, 'API Token', '3534a7a8a66b6981bfbd72a82e5fdb40a7cabc3ba5dd1b95c656d72471e70b22', '[\"*\"]', NULL, '2024-02-15 14:17:48', '2024-02-15 14:17:48'),
(28, 'App\\Models\\User', 50, 'API Token', '8b78752412d725d0e49ef955f76927f5bf8e8d44aa55c5de0de33ae7cb82b0df', '[\"*\"]', NULL, '2024-02-15 14:19:41', '2024-02-15 14:19:41'),
(31, 'App\\Models\\User', 50, 'API Token', '3f79ce092f5efd0979ae581a56bf5bddb04c56c03969652736562c9afa37f4ea', '[\"*\"]', '2024-02-15 21:58:13', '2024-02-15 21:19:36', '2024-02-15 21:58:13'),
(32, 'App\\Models\\User', 51, 'API Token', '2329b95d47a5085e02ad55703acd070c7df61047b7bf79ae87260957196be89e', '[\"*\"]', '2024-02-16 21:54:39', '2024-02-16 15:23:05', '2024-02-16 21:54:39'),
(33, 'App\\Models\\User', 51, 'API Token', 'af9d0b07721c2c933d5013068cffeeffa2b7c6de593ca2922b7c7f9b072ac9e8', '[\"*\"]', NULL, '2024-02-16 17:14:54', '2024-02-16 17:14:54'),
(34, 'App\\Models\\User', 51, 'API Token', 'df7ff2eac14653104548c4f6bc9f53b5a44219952f44c0c5b3d0e77e31f8bb73', '[\"*\"]', NULL, '2024-02-16 17:15:07', '2024-02-16 17:15:07'),
(35, 'App\\Models\\User', 51, 'API Token', '7fedfd68531d1e0f1e8589f9ff5220079e2b91186320aabbc276adb95b868704', '[\"*\"]', NULL, '2024-02-16 19:11:43', '2024-02-16 19:11:43'),
(36, 'App\\Models\\User', 51, 'API Token', '3ec95553ce3abc1e1009f0a97a04d3a1bdde2e8ad3b86d425efc9e0a8fdd122c', '[\"*\"]', NULL, '2024-02-16 19:12:09', '2024-02-16 19:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `sku` varchar(191) NOT NULL,
  `type` enum('sale','rent','auction') NOT NULL DEFAULT 'sale',
  `slug` mediumtext NOT NULL,
  `product_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '	0-Single, 1-Variant	',
  `auction_start_date` datetime DEFAULT NULL,
  `auction_end_date` datetime DEFAULT NULL,
  `auction_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-Not Completed, 1-Completed',
  `auction_winner` int(10) UNSIGNED DEFAULT NULL,
  `added_by` varchar(6) NOT NULL DEFAULT 'admin',
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `occasion_id` int(11) DEFAULT NULL,
  `vat` float(5,2) NOT NULL DEFAULT 0.00,
  `photos` varchar(2000) DEFAULT NULL,
  `thumbnail_img` varchar(100) DEFAULT NULL,
  `video_provider` varchar(20) DEFAULT NULL,
  `video_link` varchar(100) DEFAULT NULL,
  `unit_price` double(20,2) NOT NULL,
  `deposit` decimal(10,2) DEFAULT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `variant_product` int(11) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) NOT NULL DEFAULT '[]',
  `choice_options` mediumtext DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `published` int(11) NOT NULL DEFAULT 1,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = On, 0 = Off',
  `featured` int(11) NOT NULL DEFAULT 0,
  `seller_featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(11) NOT NULL DEFAULT 0,
  `unit` varchar(20) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `low_stock_quantity` int(11) DEFAULT NULL,
  `discount` double(20,2) DEFAULT NULL,
  `discount_type` varchar(10) DEFAULT NULL,
  `discount_start_date` int(11) DEFAULT NULL,
  `discount_end_date` int(11) DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `tax_type` varchar(10) DEFAULT NULL,
  `shipping_type` varchar(20) DEFAULT 'flat_rate',
  `shipping_cost` text DEFAULT NULL,
  `est_shipping_days` int(11) DEFAULT NULL,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `return_refund` tinyint(1) NOT NULL DEFAULT 0,
  `auction_product` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `type`, `slug`, `product_type`, `auction_start_date`, `auction_end_date`, `auction_status`, `auction_winner`, `added_by`, `user_id`, `vendor_id`, `category_id`, `brand_id`, `occasion_id`, `vat`, `photos`, `thumbnail_img`, `video_provider`, `video_link`, `unit_price`, `deposit`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `variations`, `published`, `approved`, `cash_on_delivery`, `featured`, `seller_featured`, `current_stock`, `unit`, `min_qty`, `low_stock_quantity`, `discount`, `discount_type`, `discount_start_date`, `discount_end_date`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `est_shipping_days`, `num_of_sale`, `rating`, `return_refund`, `auction_product`, `created_at`, `updated_at`) VALUES
(30, 'Elegant Silver Bangle With Diamonds', 'SKU0001', 'sale', 'elegant-silver-bangle-with-diamonds-2', 0, NULL, NULL, 0, NULL, 'admin', 9, NULL, 4, 4, 1, 0.00, '/storage/products/2024/11/SKU0001/main/SKU0001_gallery_4.jpg,/storage/products/2024/11/SKU0001/main/SKU0001_gallery_5.webp,/storage/products/2024/11/SKU0001/main/SKU0001_gallery_6.jpg,/storage/products/2024/11/SKU0001/main/SKU0001_gallery_7.webp', '/storage/products/2024/11/SKU0001/main/SKU0001.webp', 'vimeo', 'https://vimeo.com/367945766', 0.00, NULL, NULL, 0, '[]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 10.00, 'percent', 1733011200, 1735689540, NULL, NULL, 'flat_rate', NULL, NULL, 7, 0.00, 0, 0, '2024-11-14 16:16:30', '2024-12-23 17:01:15'),
(32, 'White Gold Diamond Earrings', 'SKU00021', 'sale', 'product-2-variant', 1, NULL, NULL, 0, NULL, 'admin', 9, NULL, 2, 3, 2, 0.00, '/storage/products/2024/11/SKU00021/main/SKU00021_gallery_3.jpg,/storage/products/2024/11/SKU00021/main/SKU00021_gallery_5.jpg,/storage/products/2024/11/SKU00021/main/SKU00021_gallery_5.webp,/storage/products/2024/11/SKU00021/main/SKU00021_gallery_4.jpg', '/storage/products/2024/11/SKU00021/main/SKU00021.webp', 'youtube', 'https://youtu.be/99ZU9piXq14?si=fYFn2imXbo3m1NTT', 0.00, NULL, NULL, 0, '[\"6\"]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 1000.00, 'amount', 1732406400, 1733011140, NULL, NULL, 'flat_rate', NULL, NULL, 11, 0.00, 0, 0, '2024-11-14 16:22:06', '2024-12-23 17:01:15'),
(33, 'Swirling Luxe Diamond Stud Earrings', 'SKU00011', 'sale', 'swirling-luxe-diamond-stud-earrings', 0, NULL, NULL, 0, NULL, 'admin', NULL, 1, 1, 1, 2, 0.00, '/storage/products/2024/11/SKU00011/main/SKU00011_gallery_5.jpg,/storage/products/2024/11/SKU00011/main/SKU00011_gallery_2.webp', '/storage/products/2024/11/SKU00011/main/SKU00011.webp', 'youtube', NULL, 0.00, NULL, NULL, 0, '[]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 0.00, 'amount', NULL, NULL, NULL, NULL, 'flat_rate', NULL, NULL, 5, 0.00, 0, 0, '2024-11-22 11:56:37', '2024-12-20 16:23:27'),
(34, 'Generic Diamond Pendant Necklace', 'SKU00010', 'sale', 'generic-diamond-pendant-necklace', 1, NULL, NULL, 0, NULL, 'admin', 9, 1, 1, 2, 1, 0.00, '/storage/products/2024/11/SKU00010/main/SKU00010_gallery_3.webp,/storage/products/2024/11/SKU00010/main/SKU00010_gallery_4.jpg,/storage/products/2024/11/SKU00010/main/SKU00010_gallery_5.jpg', '/storage/products/2024/11/SKU00010/main/SKU00010.webp', 'youtube', NULL, 0.00, NULL, NULL, 0, '[\"6\"]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 1000.00, 'amount', 1730419200, 1732406340, NULL, NULL, 'flat_rate', NULL, NULL, 4, 0.00, 0, 0, '2024-11-22 14:14:32', '2024-12-23 17:01:15'),
(35, 'White Diamond Zircon Ring', 'DR152667', 'sale', 'white-diamond-zircon-ring', 0, NULL, NULL, 0, NULL, 'admin', 9, NULL, 5, 1, 3, 0.00, '/storage/products/2024/11/DR152667/main/DR152667_gallery_1.jpg,/storage/products/2024/11/DR152667/main/DR152667_gallery_2.jpg,/storage/products/2024/11/DR152667/main/DR152667_gallery_3.jpg,/storage/products/2024/11/DR152667/main/DR152667_gallery_4.jpg', '/storage/products/2024/11/DR152667/main/DR152667.jpeg', 'youtube', NULL, 0.00, NULL, NULL, 0, '[]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 0.00, 'amount', NULL, NULL, NULL, NULL, 'flat_rate', NULL, NULL, 7, 0.00, 0, 0, '2024-11-25 19:05:39', '2025-08-23 08:36:09'),
(36, 'Caitlyn minimalist jewelry set', 'MJ29380', 'sale', 'caitlyn-minimalist-jewelry-set', 0, NULL, NULL, 0, NULL, 'admin', 9, NULL, 2, 2, 4, 0.00, '/storage/products/2024/11/MJ29380/main/MJ29380_gallery_1.webp,/storage/products/2024/11/MJ29380/main/MJ29380_gallery_2.webp,/storage/products/2024/11/MJ29380/main/MJ29380_gallery_3.webp,/storage/products/2024/11/MJ29380/main/MJ29380_gallery_4.jpg', '/storage/products/2024/11/MJ29380/main/MJ29380.webp', 'youtube', NULL, 0.00, NULL, NULL, 0, '[]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 100.00, 'amount', 1733184000, 1734479940, NULL, NULL, 'flat_rate', NULL, NULL, 2, 0.00, 0, 0, '2024-11-25 19:36:14', '2024-12-05 17:21:17'),
(38, 'White Gold Ring with Diamond Stud', 'NV123432', 'rent', 'white-gold-ring-with-diamond-stud', 0, NULL, NULL, 0, NULL, 'admin', 9, NULL, 5, 3, 5, 5.00, '/storage/products/2024/12/NV123432/main/NV123432_gallery_2.webp,/storage/products/2024/12/NV123432/main/NV123432_gallery_2.jpg,/storage/products/2024/12/NV123432/main/NV123432_gallery_3.jpg', '/storage/products/2024/12/NV123432/main/NV123432.jpg', 'youtube', NULL, 0.00, 500.00, NULL, 0, '[]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 0.00, 'amount', NULL, NULL, NULL, NULL, 'flat_rate', NULL, NULL, 2, 0.00, 0, 0, '2024-12-04 14:47:47', '2024-12-20 16:23:27'),
(39, 'gold banlge with ancient perls', 'NV123433', 'rent', 'gold-banlge-with-ancient-perls', 1, NULL, NULL, 0, NULL, 'admin', 9, 1, 4, 2, 4, 0.00, '/storage/products/2024/12/NV123432/main/NV123432_gallery_1.jpg,/storage/products/2024/12/NV123432/main/NV123432_gallery_3.jpg,/storage/products/2024/12/NV123433/main/NV123433_gallery_3.jpg,/storage/products/2024/12/NV123433/main/NV123433_gallery_4.jpg', '/storage/products/2024/12/NV123433/main/NV123433.jpg', 'youtube', NULL, 0.00, 1500.00, NULL, 0, '[\"6\"]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 0.00, 'amount', NULL, NULL, NULL, NULL, 'flat_rate', NULL, NULL, 0, 0.00, 0, 0, '2024-12-04 15:09:50', '2024-12-04 19:53:38'),
(41, 'Bridal Wear Diamond Necklace', 'DN266178', 'sale', 'bridal-wear-diamond-necklace', 0, NULL, NULL, 0, NULL, 'admin', 9, NULL, 1, 4, 1, 0.00, '/storage/products/2024/12/DN266178/main/DN266178_gallery_1.jpg,/storage/products/2024/12/DN266178/main/DN266178_gallery_2.webp,/storage/products/2024/12/DN266178/main/DN266178_gallery_3.jpg', '/storage/products/2024/12/DN266178/main/DN266178.jpg', 'youtube', NULL, 0.00, NULL, NULL, 0, '[]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 0.00, 'amount', NULL, NULL, NULL, NULL, 'flat_rate', NULL, NULL, 1, 0.00, 0, 0, '2024-12-05 15:08:24', '2024-12-05 16:04:37'),
(42, 'Elegant Silver Bangle With Diamonds', 'ASKU0001', 'auction', 'elegant-silver-bangle-with-diamonds-2', 0, '2024-12-08 00:00:00', '2024-12-25 23:59:00', 1, 63, 'admin', 9, NULL, 4, 4, 1, 0.00, '/storage/products/2024/11/SKU0001/main/SKU0001_gallery_4.jpg,/storage/products/2024/11/SKU0001/main/SKU0001_gallery_5.webp,/storage/products/2024/11/SKU0001/main/SKU0001_gallery_6.jpg,/storage/products/2024/11/SKU0001/main/SKU0001_gallery_7.webp', '/storage/products/2024/11/SKU0001/main/SKU0001.webp', 'vimeo', 'https://vimeo.com/367945766', 0.00, NULL, NULL, 0, '[]', NULL, NULL, 1, 1, 1, 0, 0, 0, NULL, 1, NULL, 10.00, 'percent', 1733011200, 1735689540, NULL, NULL, 'flat_rate', NULL, NULL, 3, 0.00, 0, 0, '2024-11-14 16:16:30', '2024-12-20 22:47:04'),
(43, 'Test product', 'TP0440', 'sale', 'test-product', 0, NULL, NULL, 0, NULL, 'vendor', NULL, 13, 5, NULL, NULL, 5.00, '/storage/products/2024/12/TP0440/main/TP0440_gallery_1.jpg', NULL, 'youtube', NULL, 0.00, NULL, NULL, 0, '[]', NULL, NULL, 0, 0, 1, 0, 0, 0, NULL, 1, NULL, 0.00, 'amount', NULL, NULL, NULL, NULL, 'flat_rate', NULL, NULL, 0, 0.00, 0, 0, '2024-12-19 21:14:55', '2024-12-19 21:14:55'),
(44, 'Bag', 'BH0905', 'rent', 'bag', 0, NULL, NULL, 0, NULL, 'vendor', 9, 13, 1, 3, 1, 0.00, '/storage/products/2024/12/BH0905/main/BH0905_gallery_1.jpg', '/storage/products/2024/12/BH0905/main/BH0905.jpg', 'youtube', NULL, 0.00, 100.00, NULL, 0, '[]', NULL, NULL, 1, 0, 1, 0, 0, 0, NULL, 1, NULL, 50.00, 'amount', 1733616000, 1735430400, NULL, NULL, 'flat_rate', NULL, NULL, 0, 0.00, 0, 0, '2024-12-19 21:57:15', '2024-12-24 20:28:17'),
(45, 'Luxury Watch', 'LW35267', 'sale', 'luxury-watch', 0, NULL, NULL, 0, NULL, 'vendor', 9, 13, 2, 4, 5, 0.00, '/storage/products/2024/12/LW35267/main/LW35267_gallery_1.jpg', '/storage/products/2024/12/LW35267/main/LW35267.jpg', 'youtube', NULL, 0.00, NULL, NULL, 0, '[\"6\"]', NULL, NULL, 1, 0, 1, 0, 0, 0, NULL, 1, NULL, 10.00, 'percent', 1734220800, 1735430400, NULL, NULL, 'flat_rate', NULL, NULL, 2, 0.00, 0, 0, '2024-12-19 22:24:51', '2024-12-24 20:27:55'),
(46, 'Demo product', 'DM46372', 'sale', 'demo-product', 0, NULL, NULL, 0, NULL, 'vendor', NULL, 13, 5, 2, 4, 0.00, '/storage/products/2024/12/DM46372/main/DM46372_gallery_1.jpg', '/storage/products/2024/12/DM46372/main/DM46372.jpg', 'youtube', NULL, 0.00, NULL, NULL, 0, '[]', NULL, NULL, 1, 0, 1, 0, 0, 0, NULL, 2, NULL, 0.00, 'amount', NULL, NULL, NULL, NULL, 'flat_rate', NULL, NULL, 1, 0.00, 0, 0, '2024-12-19 22:47:57', '2024-12-19 22:50:11'),
(47, 'Vendor Test Product', '1111111', 'sale', 'vendor-test-product', 1, NULL, NULL, 0, NULL, 'vendor', NULL, 7, 1, 2, 4, 0.00, '/storage/products/2024/12/1111111/main/1111111_gallery_1.jpg,/storage/products/2024/12/1111111/main/1111111_gallery_2.jpg,/storage/products/2024/12/1111111/main/1111111_gallery_3.jpg', '/storage/products/2024/12/1111111/main/1111111.jpg', 'youtube', 'www.youtube.com', 0.00, NULL, NULL, 0, '[\"6\",\"5\"]', NULL, NULL, 1, 0, 1, 0, 0, 0, NULL, 1, NULL, 5.00, 'percent', 1734897600, 1735329600, NULL, NULL, 'flat_rate', NULL, NULL, 0, 0.00, 0, 0, '2024-12-30 17:24:11', '2024-12-30 23:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_varient_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `product_varient_id`, `attribute_id`, `attribute_value_id`, `created_at`, `updated_at`) VALUES
(94, 32, 9, 6, 15, '2024-11-25 09:47:36', '2024-11-25 09:47:36'),
(95, 32, 10, 6, 16, '2024-11-25 09:47:36', '2024-11-25 09:47:36'),
(96, 32, 11, 6, 17, '2024-11-25 09:47:36', '2024-11-25 09:47:36'),
(133, 39, 19, 6, 15, '2024-12-05 07:00:41', '2024-12-05 07:00:41'),
(134, 39, 20, 6, 17, '2024-12-05 07:00:41', '2024-12-05 07:00:41'),
(135, 34, 13, 6, 15, '2024-12-05 07:27:55', '2024-12-05 07:27:55'),
(136, 34, 14, 6, 17, '2024-12-05 07:27:55', '2024-12-05 07:27:55'),
(137, 45, 27, 6, 15, '2024-12-24 12:27:55', '2024-12-24 12:27:55'),
(138, 47, 29, 6, 15, '2024-12-30 05:24:12', '2024-12-30 05:24:12'),
(139, 47, 29, 5, 10, '2024-12-30 05:24:12', '2024-12-30 05:24:12'),
(140, 47, 30, 6, 15, '2024-12-30 05:24:12', '2024-12-30 05:24:12'),
(141, 47, 30, 5, 12, '2024-12-30 05:24:12', '2024-12-30 05:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_seos`
--

CREATE TABLE `product_seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` mediumtext DEFAULT NULL,
  `og_title` mediumtext DEFAULT NULL,
  `og_description` longtext DEFAULT NULL,
  `twitter_title` mediumtext DEFAULT NULL,
  `twitter_description` longtext DEFAULT NULL,
  `lang` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_seos`
--

INSERT INTO `product_seos` (`id`, `product_id`, `meta_title`, `meta_description`, `meta_keywords`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `lang`, `created_at`, `updated_at`) VALUES
(12, 30, 'Elegant Silver Bangle With Diamonds', 'Meta Description Product 1', 'Product 1,meta keywords product 1', 'Elegant Silver Bangle With Diamonds', 'OG Description Product 1', 'Elegant Silver Bangle With Diamonds', 'Twitter Description Product 1', 'en', '2024-11-14 16:16:31', '2024-11-25 21:28:38'),
(14, 32, 'Meta Title Product 2 Variant', 'Meta Description Product 2 Variant', 'Product 2 Variant', 'OG Title Product 2 Variant', 'OG Description Product 2 Variant', 'Twitter Title Product 2 Variant', 'Twitter Description Product 2 Variant', 'en', '2024-11-14 16:22:07', '2024-11-14 16:22:07'),
(15, 32, 'Meta Title Product 2 Variant arabic', 'Meta Description Product 2 Variant arabic', 'Product 2 Variant,arabic', 'OG Title Product 2 Variant arabic', 'OG Description Product 2 Variant arabic', 'Twitter Title Product 2 Variant arabic', 'Twitter Description Product 2 Variant arabic', 'ae', '2024-11-15 13:29:24', '2024-11-15 13:29:24'),
(16, 33, 'Swirling Luxe Diamond Stud Earrings', NULL, '', 'Swirling Luxe Diamond Stud Earrings', NULL, 'Swirling Luxe Diamond Stud Earrings', NULL, 'en', '2024-11-22 11:56:39', '2024-11-25 18:42:57'),
(17, 33, '22k Gold earrings', NULL, '', '22k Gold earrings', NULL, '22k Gold earrings', NULL, 'ae', '2024-11-22 12:09:53', '2024-11-22 12:09:53'),
(18, 34, 'Generic Diamond Pendant Necklace', NULL, '', 'Generic Diamond Pendant Necklace', NULL, 'Generic Diamond Pendant Necklace', NULL, 'en', '2024-11-22 14:14:32', '2024-11-25 18:55:44'),
(19, 34, 'Temple necklace', NULL, '', 'Temple necklace', NULL, 'Temple necklace', NULL, 'ae', '2024-11-22 14:16:12', '2024-11-22 14:16:12'),
(20, 35, 'White Diamond Zircon Ring', NULL, '', 'White Diamond Zircon Ring', NULL, 'White Diamond Zircon Ring', NULL, 'en', '2024-11-25 19:05:39', '2024-11-25 19:05:39'),
(21, 36, 'Caitlyn minimalist jewelry set', NULL, '', 'Caitlyn minimalist jewelry set', NULL, 'Caitlyn minimalist jewelry set', NULL, 'en', '2024-11-25 19:36:14', '2024-11-25 19:36:14'),
(23, 38, 'White Gold Ring with Diamond Stud', NULL, '', 'White Gold Ring with Diamond Stud', NULL, 'White Gold Ring with Diamond Stud', NULL, 'en', '2024-12-04 14:47:47', '2024-12-04 14:47:47'),
(24, 39, 'gold banlge with ancient perls', NULL, '', 'gold banlge with ancient perls', NULL, 'gold banlge with ancient perls', NULL, 'en', '2024-12-04 15:09:50', '2024-12-04 15:09:50'),
(26, 41, 'Bridal Wear Diamond Necklace', NULL, '', 'Bridal Wear Diamond Necklace', NULL, 'Bridal Wear Diamond Necklace', NULL, 'en', '2024-12-05 15:08:24', '2024-12-05 15:08:24'),
(27, 42, 'Elegant Silver Bangle With Diamonds', NULL, '', 'Elegant Silver Bangle With Diamonds', NULL, 'Elegant Silver Bangle With Diamonds', NULL, 'en', '2024-12-13 22:48:22', '2024-12-13 22:48:22'),
(28, 45, 'Luxury Watch', NULL, '', 'Luxury Watch', NULL, 'Luxury Watch', NULL, 'en', '2024-12-24 20:27:55', '2024-12-24 20:27:55'),
(29, 44, 'Bag', NULL, '', 'Bag', NULL, 'Bag', NULL, 'en', '2024-12-24 20:28:17', '2024-12-24 20:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sku` varchar(255) DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `high_bid_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `offer_price` double(20,2) NOT NULL DEFAULT 0.00,
  `offer_tag` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `status`, `sku`, `price`, `high_bid_amount`, `qty`, `offer_price`, `offer_tag`, `image`, `created_at`, `updated_at`) VALUES
(8, 30, NULL, 1, 'SKU0001', 70000.00, 0.00, 2, 63000.00, '10% OFF', NULL, '2024-11-14 16:16:31', '2024-12-23 17:01:15'),
(9, 32, NULL, 1, 'SKU00021', 100000.00, 0.00, 3, 99000.00, 'AED 1000 OFF', '/storage/products/2024/11/SKU00021/SKU00021_gallery_1.webp', '2024-11-14 16:22:07', '2024-12-23 17:01:15'),
(10, 32, NULL, 1, 'SKU00022', 50000.00, 0.00, 10, 49000.00, 'AED 1000 OFF', '/storage/products/2024/11/SKU00022/SKU00022_gallery_1.jpg', '2024-11-14 16:22:07', '2024-11-25 15:52:07'),
(11, 32, NULL, 1, 'SKU00023', 90000.00, 0.00, 15, 89000.00, 'AED 1000 OFF', '/storage/products/2024/11/SKU00023/SKU00023_gallery_1.jpg', '2024-11-14 16:22:07', '2024-11-25 15:52:07'),
(12, 33, NULL, 1, 'SKU00011', 120000.00, 0.00, 6, 120000.00, '', NULL, '2024-11-22 11:56:39', '2025-08-23 10:02:09'),
(13, 34, NULL, 1, 'SKU00010', 300000.00, 0.00, 8, 300000.00, '', '/storage/products/2024/11/SKU00010/SKU00010_gallery_1.jpg', '2024-11-22 14:14:32', '2025-08-23 10:02:09'),
(14, 34, NULL, 1, 'SKU00020', 310000.00, 0.00, 6, 310000.00, '', '/storage/products/2024/11/SKU00020/SKU00020_gallery_1.webp', '2024-11-22 14:14:32', '2024-11-25 18:52:11'),
(15, 35, NULL, 1, 'DR152667', 4300.00, 0.00, 4, 4300.00, '', NULL, '2024-11-25 19:05:39', '2025-08-23 10:02:09'),
(16, 36, NULL, 1, 'MJ29380', 1600.00, 0.00, 0, 1500.00, 'AED 100 OFF', NULL, '2024-11-25 19:36:14', '2024-12-05 17:21:17'),
(18, 38, NULL, 1, 'NV123432', 350.00, 0.00, 23, 350.00, '', NULL, '2024-12-04 14:47:47', '2024-12-20 16:23:27'),
(19, 39, NULL, 1, 'NV123433', 1600.00, 0.00, 80, 1600.00, '', '/storage/products/2024/12/NV123432/NV123432_gallery_1.jpg', '2024-12-04 15:09:50', '2024-12-05 15:00:41'),
(20, 39, NULL, 1, 'NV123434', 1500.00, 0.00, 60, 1500.00, '', '/storage/products/2024/12/NV123433/NV123433_gallery_1.jpg', '2024-12-04 15:09:50', '2024-12-05 15:00:41'),
(23, 41, NULL, 1, 'DN266178', 255000.00, 0.00, 20, 255000.00, '', NULL, '2024-12-05 15:08:24', '2024-12-05 16:04:37'),
(24, 42, NULL, 1, 'ASKU0001', 150000.00, 900000.00, 1, 135000.00, '10% OFF', NULL, '2024-11-14 16:16:31', '2024-12-20 17:14:59'),
(25, 43, NULL, 1, 'TP0440', 0.00, 0.00, 0, 0.00, '', NULL, '2024-12-19 21:14:55', '2024-12-19 21:14:55'),
(26, 44, NULL, 1, 'BH0905', 5000.00, 0.00, 4, 4950.00, 'AED 50 OFF', NULL, '2024-12-19 21:57:15', '2024-12-19 21:57:15'),
(27, 45, NULL, 1, 'LW35267', 1350.00, 0.00, 4, 1215.00, '10% OFF', NULL, '2024-12-19 22:24:51', '2024-12-20 16:23:27'),
(28, 46, NULL, 1, 'DM46372', 2000.00, 0.00, 6, 2000.00, '', NULL, '2024-12-19 22:47:57', '2024-12-19 22:50:11'),
(29, 47, NULL, 1, '1111111', 2000.00, 0.00, 5, 2000.00, '', '/storage/products/2024/12/1111111/1111111_gallery_1.jpg', '2024-12-30 17:24:12', '2024-12-30 17:24:12'),
(30, 47, NULL, 1, '222222', 2500.00, 0.00, 3, 2500.00, '', '/storage/products/2024/12/222222/222222_gallery_1.jpg', '2024-12-30 17:24:12', '2024-12-30 17:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_tabs`
--

CREATE TABLE `product_tabs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `lang` varchar(2) DEFAULT NULL,
  `heading` varchar(191) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tabs`
--

INSERT INTO `product_tabs` (`id`, `product_id`, `lang`, `heading`, `content`, `created_at`, `updated_at`) VALUES
(25, 32, 'ae', 'Tab 1 Product 2 Variant  arabic', '<p>Product 2 Variant tab1 desc&nbsp;&nbsp;arabic</p>', '2024-11-15 13:29:24', '2024-11-15 13:29:24'),
(26, 32, 'ae', 'Tab 2 Product 2 Variant arabic', '<p>Product 2 Variant tab2 desc&nbsp;arabic</p>', '2024-11-15 13:29:24', '2024-11-15 13:29:24'),
(37, 33, 'ae', 'المواصفات', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\">العميل مهم جدًا، العميل سيتبعه العميل. كان الدهليز نقيًا، وكان المنفذ أميت فالفاليس أو التحرش والابتسامة. لا تضع أي واجبات منزلية في عطلة نهاية الأسبوع. بعض الناس لا يريدون أن يطالبوا به، فهو مختلف، أو أنه موظف. غدًا هو مصير القوس، وعنصر الجرة ليس مهمًا. غدًا، توربيس تورتور، سوسكيبيت كويس مي هندريريت، صلصة سوسيبت أوج. من المهم أن تعرف ما يحدث أمامك. غدًا تطير شركة الطيران أحيانًا، فليكن CNN الخاص بي. بالنسبة إلى Morbi Sapien، أحتاج إلى الاستثمار في بعض المال. الآن هي مركبة الإنتاج الضخم. حتى السهام خوفي، ولكن وقت الألم يأتي في بعض الأحيان كان الأمر صاخبًا تمامًا، لكن كرة القدم كانت رائعة.</font></p>', '2024-11-22 12:21:30', '2024-11-22 12:21:30'),
(38, 33, 'ae', 'الوصف', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\">لقد كان الأمر مريحًا تمامًا، إلا أنه كان من الممتع جدًا متابعة المركبات القوسية. غدا جرة feugiat في جرة euismod sollicitudin نعم، حياتي سوف تكون دائما، ووضع الماكرو. حتى لا يكون هناك ultricies التي تسبب السم ولكن ليس الأرض. منع الخوف من الحياة أو الموت، لا يخمر. لا يوجد سائق عربة حكيم، أو الأعظم هو مجرد جعبة. الآن بعد أن أصبحت البوابة الجماعية، أصبحت بحاجة إلى الأيروس، أصبح الأمر واضحًا. في بعض المراهقين العظماء، يتم استهداف الحياة بالدعاية. القارب دافئ وكبير وقوي. ولكن لا يوجد الزناد. لقد كانت طريقة سهلة للغاية للحصول على فرج.</font></p>', '2024-11-22 12:21:30', '2024-11-22 12:21:30'),
(39, 33, 'ae', 'المراجعات', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\">الغد ليس أعظم وطن، فهو يحتاج إلى الحداد. Maecenas quis eleifend leo ولكن هناك دائما بعض المال. هيا نعيش، ليس هناك استثمار عقاري، إلا جرة لاسينيا، ولا صلصة الضحك دائما من قبل. في عالم مغلق هناك عالم مغلق. على حدود ميسيناس، لا توجد مركبات للشرب، ولا يوجد سعر عادل يجب دفعه، ويجب متابعة البحيرة ليس قبل ذلك. لا حياة إلا الملكية، الفيلي المبتلى، الفيل العظيم. لا أحد مسؤول عن الماكياج أو المؤلف. احتاج Maecenas إلى قوس. يحتاج الأطفال إلى معرفة ما يجب عليهم فعله، ومن يجب أن يكون المعلم في الوقت الحالي.</font></p>', '2024-11-22 12:21:30', '2024-11-22 12:21:30'),
(44, 34, 'ae', 'مواصفات', '<p>لكن اللاسينيا الناعمة تحتاج إلى ابتسامة. الأطفال كانوا طاهرين من قبل، سواء كانوا كرتونيين أم لا، لأن ullamcorper يعمل. كل لعبة كرة قدم تحتاج إلى ترويج جيد. فالوادي أحيانًا حكيم، ومركبات حمل الفيل كما الجميع يكره الطعام، لكن الصلصة يجب أن توضع في مرطبان. وعندما يولد الأوركيون، ستلد الجبال ريشًا ومهمازات كبيرة، وسيولد فأر سخيف. إنها ليست شاحنات نقية. حتى النتيجة والإعلان سهلا. لا يوجد ولا بوتقة بيئية. الآن أصبح الأمر ممتعًا على الهاتف الذكي أو السيارة. حتى يكون القطر التناسلي دائمًا هو نفسه convallis.</p><p><br></p><p>التعليق يسطح البحيرة، وهو مصنوع من المركبات. Cras et vulputate Tellus، لكن viverra turpis. Maecenas لا يحتاج حتى إلى القوس. يترتب على ذلك بهار السيرة الذاتية هندريريت. الضحك يُطري الخبز ولا يُملق الفناء؛ حتى الشاحنات، يبدو الأمر كما لو أنه يتملق الفينيناتيس، ليو مي فيوجيات نفسه، الأعضاء يتملقون النخبة النقية وليس الليجولا. حتى كرة القدم الآن، ولكن الآن في كرة السلة، يريد أن يكون ناعمًا. حتى يحتاج إلى السهام، فليكن طاهراً قليلاً. تمامًا مثل الكتلة، يجب أن يكون المكياج كثيرًا، وبعض الأسهم. Fusce turpis dui، tincidunt sed nisl sit amet، jaculis feugiat الآن.</p>', '2024-11-22 14:49:05', '2024-11-22 14:49:05'),
(45, 34, 'ae', 'الأوصاف', '<p>آخذ حياتي كلها، أو أجعل نهاياتي جميلة. يزين الأطفال أحيانًا جعبة إيروس أكومسان. كسرير مأساوي ومكتب طبي لمصلحة شاحنات المدرسة الثانوية. بعض قوس الدعاية. الخوف المعلق المعلق، eleifend quis tincidunt in، يتخمر كيف. الطبيب هو المسؤول عن العلاج الطبي للمريض. حان الوقت لشرب السم، وبعض البروتينات الرائعة. الهدف الدهليزي rhoncus pulvinar. وحتى ذلك الحين، لا يقع البروتين دائمًا في الزجاجة.</p><p><br></p><p>لكنه ألم في الوادي. في الواقع، الأخبار وبعض الأخبار. الآن والباب الكبير. Aenean tincidunt أكره المتملقات من الاتحاد الأوروبي. لكن من هو الطبيب؟ الأطفال الذين يكرهون المدرسة. لقد تحدثت مع الموظف من قبل. كما أنه ليس من الحكمة.</p><p><br></p><p>لا يوجد أي عنصر، الزناد ملائم دائمًا، الوعاء الحر يتبعه إيروس، ليس فقط أن كتلة حياتي مهمة. يرصد Aenean porttitor للإعلان عن البروتين. يتم تحضيره للشرب أثناء الحمل. لا يوجد سرير غير وسادة. الآن، حتى العنصر الأساسي للحياة. لم تكن كل واحدة منها نظيفة ولا مزخرفة. لكن الفيل يضحك على ذلك. كما يريد شخص الآن، خميرة من الحاجة، تزيين كيف. يا أصدقاء إينيان، الضحك هو عنصر الوادي، الذي ينعي فقط الليجولا، لكنه ينعي الأسد والقوس. ولا غرفة معيشة حزينة كالقوس لجمال المكان.</p><p><br></p><p>حتى feugeat facilisis المختلفة. لكن كرة السلة وحياة إيروس واجبات منزلية. كان كورابيتور رائعا. سيرة موريس تحتاج إلى قراءة رسالة حزن من قلب حياته. وادي موربي لاسينيا نفسه نتيجة شرب العنصر النقي و. في ligula fringilla، الشوكولاتة هي كرة القدم، والوادي هو. حتى أمام الحلق، لن تكون هناك نتيجة. Vivamus condimentum ultrices diam، يخشى أعضاء euismod وجود ultrices قيل أن الغد ليس الوقت المناسب للقيام بالواجبات المنزلية.</p><p><br></p><p>كما أنه يستثمر في كرة القدم لصالح فريق كرة السلة في البلاد. لا توجد وسائل التواصل الاجتماعي. يجب أن تكون الأسرة سعيدة، ويجب أن تكون عطلة نهاية الأسبوع ممتعة، ويجب أن يكون الأطفال سعداء، والنتيجة هي أنه إذا لم يكن الأمر كذلك. لا يوجد شيء اسمه أعضاء. وعندما يولد الأوركيون، ستلد الجبال ريشًا ومهمازات كبيرة، وسيولد فأر سخيف. يستثمر الأطفال في لاسينيا إيروس ولا يحتاجون إليها. في حالة وجود مستوى عال من كرة القدم. نحن لا نعيش في الدهليز. عدد صحيح laoreet rutrum velit لا tincidunt. ليست هناك حاجة، لا حاجة للحكمة، لا حاجة لعنصر الحزن، لا حاجة للأهداف، لا حاجة للراحة كما هي الآن. لكن ليس لاعبي فوجيات. الأطفال من ثمن القوس. إنهم لاعبون مختلفون تمامًا. لا ينبغي أن يكون هناك طعام فقط للطعم أو للصلصة. ومن المهم أن نلاحظ أنه لا يوجد سعر السوق الشامل.</p>', '2024-11-22 14:49:06', '2024-11-22 14:49:06'),
(103, 32, 'en', 'Description', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold is a precious metal that has been treasured for its beauty and value throughout human history. It is a dense, soft, and malleable metal with a distinctive yellow color. Gold is highly sought after for use in jewelry and coins due to its rarity, non-corrosive nature, and resistance to tarnish.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">When used in jewelry, gold is typically alloyed with other metals to increase its strength and durability. As mentioned earlier, gold is measured in carats, which indicates its purity. 24-carat gold is the purest form, but it\'s relatively soft for jewelry-making. Common carat values for gold jewelry are 18K, 14K, and 10K, with the higher numbers indicating higher gold content.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold jewelry is versatile and timeless, suitable for various styles and occasions. It serves as an excellent backdrop for diamonds, enhancing their brilliance and sparkle.</span></p>', '2024-11-25 17:47:36', '2024-11-25 17:47:36'),
(104, 32, 'en', 'Material Instructions', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio velit nostrum, et, soluta sit a voluptatibus unde, omnis sapiente ex cumque culpa commodi harum aperiam? Iure fuga expedita in blanditiis.</span></p>', '2024-11-25 17:47:36', '2024-11-25 17:47:36'),
(105, 32, 'en', 'Returns & Exchanges', '<ul style=\"padding: 25px 0px 0px 14px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; list-style: none; color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><li style=\"position: relative;\">Easy and complimentary, within 14 days</li><li style=\"position: relative;\">See conditions and procedure in our return FAQs</li><li style=\"position: relative;\">Customer is responsible for shipping charges when making -returns and shipping/handling fees of original purchase is non-refundable.</li></ul>', '2024-11-25 17:47:36', '2024-11-25 17:47:36'),
(146, 33, 'en', 'Specifications', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum purus erat, porttitor sit amet convallis vel, molestie ac risus. Nullam posuere congue volutpat. Aliquam nec velit egestas, varius nibh vel, molestie est. Cras tincidunt volutpat arcu, nec elementum urna rhoncus sit amet. Cras turpis tortor, suscipit quis mi hendrerit, condimentum suscipit augue. Suspendisse ex ante, tincidunt eget quam quis, condimentum consectetur mauris. Cras porttitor interdum elit, sit amet rhoncus mi. Morbi sapien enim, imperdiet in mi eget, aliquam laoreet nisl. Nunc a sapien id massa vehicula vestibulum. Donec sagittis mi metus, at tempus dolor eleifend in. Integer tincidunt interdum erat, eu dignissim turpis pellentesque sed.</span></p>', '2024-11-25 18:42:57', '2024-11-25 18:42:57'),
(147, 33, 'en', 'Description', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Integer commodo erat nisi, sit amet fringilla arcu vehicula consectetur. Cras feugiat urna in urna euismod sollicitudin. Etiam vitae semper mi, et posuere tortor. Ut ut nulla ultricies felis rutrum venenatis sed non tellus. Proin volutpat metus vel diam imperdiet, eu feugiat nisl fermentum. Nullam vehicula urna sapien, vel maximus justo pharetra ac. Nunc id massa porta, lobortis eros eget, efficitur purus. In aliquam eleifend magna, vitae iaculis augue ultricies in. Phasellus fermentum ac magna et vulputate. Nullam sed tortor felis. Praesent vestibulum erat facilisis vulputate consequat.</span></p>', '2024-11-25 18:42:57', '2024-11-25 18:42:57'),
(148, 33, 'en', 'Reviews', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Cras non maximus diam, eget luctus velit. Maecenas quis eleifend leo. Sed laoreet aliquam semper. Vivamus rutrum, nulla sit amet placerat dignissim, quam urna lacinia nisi, nec condimentum risus ante semper nisi. In a tellus venenatis est rhoncus venenatis. Maecenas finibus, nulla sed vehicula bibendum, neque purus pretium justo, eget consectetur sem lacus non ante. Nulla vitae quam mattis, vulputate felis quis, eleifend magna. Nullam rutrum sapien quis neque auctor efficitur. Maecenas eget arcu erat. Pellentesque id diam dapibus, egestas tortor quis, tempor sem.</span></p>', '2024-11-25 18:42:57', '2024-11-25 18:42:57'),
(171, 35, 'en', 'Material Instructions', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio velit nostrum, et, soluta sit a voluptatibus unde, omnis sapiente ex cumque culpa commodi harum aperiam? Iure fuga expedita in blanditiis.</span></p>', '2024-11-25 19:12:54', '2024-11-25 19:12:54'),
(172, 35, 'en', 'Returns & Exchanges', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 25px 0px 0px 14px; list-style: none; color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><li style=\"position: relative;\">Easy and complimentary, within 14 days</li><li style=\"position: relative;\">See conditions and procedure in our return FAQs</li><li style=\"position: relative;\">Customer is responsible for shipping charges when making -returns and shipping/handling fees of original purchase is non-refundable.</li></ul>', '2024-11-25 19:12:54', '2024-11-25 19:12:54'),
(173, 35, 'en', 'Description', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold is a precious metal that has been treasured for its beauty and value throughout human history. It is a dense, soft, and malleable metal with a distinctive yellow color. Gold is highly sought after for use in jewelry and coins due to its rarity, non-corrosive nature, and resistance to tarnish.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">When used in jewelry, gold is typically alloyed with other metals to increase its strength and durability. As mentioned earlier, gold is measured in carats, which indicates its purity. 24-carat gold is the purest form, but it\'s relatively soft for jewelry-making. Common carat values for gold jewelry are 18K, 14K, and 10K, with the higher numbers indicating higher gold content.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold jewelry is versatile and timeless, suitable for various styles and occasions. It serves as an excellent backdrop for diamonds, enhancing their brilliance and sparkle.</span></p>', '2024-11-25 19:12:54', '2024-11-25 19:12:54'),
(204, 34, 'en', 'Specification', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Integer quis ornare leo. Proin non tempor ligula. Suspendisse fermentum quam ante, sit amet sagittis massa iaculis quis. Ut metus est, posuere porta ex nec, mollis tincidunt massa. Quisque dui enim, consectetur sed vestibulum a, condimentum non justo. Ut sodales facilisis nisl et elementum. Praesent tellus nisl, scelerisque sit amet urna sed, placerat malesuada tortor. Ut quis massa mollis, rutrum risus sit amet, convallis neque. Integer placerat urna lorem, non mollis nulla elementum nec.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed non lacinia nisl. Nullam auctor placerat augue sit amet faucibus. Nunc fringilla lacus vitae elit blandit laoreet. Aenean quis nibh scelerisque, malesuada arcu in, dapibus justo. Praesent vestibulum accumsan lacus, non mollis nibh ultrices non. Morbi sagittis sem eros, id aliquam leo porttitor in. Maecenas aliquet elit eu erat tincidunt sagittis a et erat. Fusce vitae ligula sem. Mauris efficitur, velit interdum gravida viverra, augue neque eleifend sem, sit amet pharetra sem leo eget purus. Nulla mauris eros, tristique nec sem molestie, dictum rhoncus felis. Quisque iaculis finibus nibh non rhoncus. Sed in tempor turpis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras sollicitudin imperdiet arcu, vel fermentum purus. Vestibulum consequat neque vitae metus vulputate, sit amet ornare nunc feugiat.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Morbi sed lacus eu justo faucibus volutpat at vel est. Phasellus ac venenatis purus. Fusce sed lectus tortor. Sed tincidunt sit amet arcu nec sagittis. Proin eu metus ultrices, malesuada velit tempus, aliquam magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec suscipit, quam sed sollicitudin feugiat, erat est iaculis quam, ut pellentesque neque diam ut nisi. Aenean varius risus lorem, dapibus accumsan diam fringilla sit amet. Ut varius accumsan enim finibus suscipit. Morbi eget felis commodo, elementum metus sit amet, varius justo. Sed non dolor iaculis, posuere metus id, sodales metus. Donec vestibulum tempus sodales.</p>', '2024-12-05 15:27:55', '2024-12-05 15:27:55'),
(205, 34, 'en', 'Description', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Proin sed eleifend neque, eu dignissim purus. Vivamus dui mauris, suscipit ac convallis varius, scelerisque nec orci. Nunc erat eros, sollicitudin a augue id, luctus cursus diam. Nullam pharetra tortor auctor vehicula hendrerit. Ut sagittis enim in ligula dapibus, ac mollis metus elementum. Nullam libero magna, aliquet nec vehicula vitae, aliquam sit amet leo. Duis hendrerit nibh ut orci consequat, non ultricies diam porta. Etiam tristique diam vitae massa vestibulum, id dignissim purus bibendum. Nam pellentesque at libero at interdum. Donec id tincidunt ipsum, in varius enim. Integer et massa lacus. Quisque id elit vitae orci viverra tristique eget luctus orci. Suspendisse faucibus viverra erat, ut elementum nulla. Fusce pharetra ante consectetur, porttitor diam in, aliquam sem. Etiam commodo urna tellus, feugiat aliquam quam pellentesque ac.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed suscipit risus eget lacinia mollis. Pellentesque purus ante, viverra vel sem non, ullamcorper cursus enim. Quisque eu cursus dui, eget ullamcorper augue. Nam convallis interdum sapien, et vehicula dolor eleifend ut. Quisque odio elit, condimentum at erat ut, cursus posuere urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce non aliquet purus. Donec consequat et augue ut facilisis. Nulla a neque et neque fringilla ultrices. Nunc blandit fringilla sapien vel vehicula. Donec venenatis diam semper ipsum accumsan convallis.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Suspendisse blandit tristique lacus, ac efficitur ex vehicula eget. Cras et vulputate tellus, sed viverra turpis. Maecenas nec enim eget mauris dictum sagittis. Fusce consequat condimentum lorem vitae hendrerit. Proin blandit risus nec diam blandit, eget blandit justo sodales. Donec aliquet, est ut blandit venenatis, leo mi feugiat ipsum, sodales blandit elit purus nec ligula. Etiam felis nunc, ultrices sed nunc in, finibus mollis velit. Donec eget sagittis diam, sit amet aliquam purus. Ut justo massa, rutrum eget tellus sit amet, sagittis aliquam ligula. Fusce turpis dui, tincidunt sed nisl sit amet, iaculis feugiat nunc.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Phasellus volutpat ullamcorper leo, vel efficitur mi finibus rutrum. Pellentesque ornare interdum eros accumsan pharetra. Ut tristique lectus et orci hendrerit, in commodo turpis aliquet. Aliquam a augue arcu. Suspendisse diam metus, eleifend quis tincidunt in, fermentum ut quam. Duis aliquet orci sit amet lobortis auctor. Praesent bibendum venenatis lorem, in aliquam magna dapibus et. Vestibulum rhoncus pulvinar iaculis. Donec semper dapibus lacus non lobortis.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Praesent sed convallis dolor. Proin rhoncus euismod lorem ac aliquam. Nunc ac vestibulum magna. Aenean tincidunt odio eu accumsan blandit. Sed quis lacinia orci. Pellentesque quis odio turpis. Curabitur molestie lectus ante. Etiam non est sapien.</p>', '2024-12-05 15:27:55', '2024-12-05 15:27:55'),
(212, 41, 'en', 'Description', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold is a precious metal that has been treasured for its beauty and value throughout human history. It is a dense, soft, and malleable metal with a distinctive yellow color. Gold is highly sought after for use in jewelry and coins due to its rarity, non-corrosive nature, and resistance to tarnish.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">When used in jewelry, gold is typically alloyed with other metals to increase its strength and durability. As mentioned earlier, gold is measured in carats, which indicates its purity. 24-carat gold is the purest form, but it\'s relatively soft for jewelry-making. Common carat values for gold jewelry are 18K, 14K, and 10K, with the higher numbers indicating higher gold content.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold jewelry is versatile and timeless, suitable for various styles and occasions. It serves as an excellent backdrop for diamonds, enhancing their brilliance and sparkle.</span></p>', '2024-12-05 16:03:19', '2024-12-05 16:03:19'),
(213, 41, 'en', 'Material Instructions', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio velit nostrum, et, soluta sit a voluptatibus unde, omnis sapiente ex cumque culpa commodi harum aperiam? Iure fuga expedita in blanditiis.</span></p>', '2024-12-05 16:03:19', '2024-12-05 16:03:19'),
(214, 41, 'en', 'Returns & Exchanges', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 25px 0px 0px 14px; list-style: none; color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><li style=\"position: relative;\">Easy and complimentary, within 14 days</li><li style=\"position: relative;\">See conditions and procedure in our return FAQs</li><li style=\"position: relative;\">Customer is responsible for shipping charges when making -returns and shipping/handling fees of original purchase is non-refundable.</li></ul>', '2024-12-05 16:03:19', '2024-12-05 16:03:19'),
(215, 36, 'en', 'Description', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold is a precious metal that has been treasured for its beauty and value throughout human history. It is a dense, soft, and malleable metal with a distinctive yellow color. Gold is highly sought after for use in jewelry and coins due to its rarity, non-corrosive nature, and resistance to tarnish.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">When used in jewelry, gold is typically alloyed with other metals to increase its strength and durability. As mentioned earlier, gold is measured in carats, which indicates its purity. 24-carat gold is the purest form, but it\'s relatively soft for jewelry-making. Common carat values for gold jewelry are 18K, 14K, and 10K, with the higher numbers indicating higher gold content.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold jewelry is versatile and timeless, suitable for various styles and occasions. It serves as an excellent backdrop for diamonds, enhancing their brilliance and sparkle.</span></p>', '2024-12-05 17:01:47', '2024-12-05 17:01:47'),
(216, 36, 'en', 'Material Instructions', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio velit nostrum, et, soluta sit a voluptatibus unde, omnis sapiente ex cumque culpa commodi harum aperiam? Iure fuga expedita in blanditiis.</span></p>', '2024-12-05 17:01:47', '2024-12-05 17:01:47'),
(217, 36, 'en', 'Returns & Exchanges', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 25px 0px 0px 14px; list-style: none; color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><li style=\"position: relative;\">Easy and complimentary, within 14 days</li><li style=\"position: relative;\">See conditions and procedure in our return FAQs</li><li style=\"position: relative;\">Customer is responsible for shipping charges when making -returns and shipping/handling fees of original purchase is non-refundable.</li></ul>', '2024-12-05 17:01:47', '2024-12-05 17:01:47'),
(221, 46, 'en', 'Specification', 'Integer commodo erat nisi, sit amet fringilla arcu vehicula consectetur. Cras feugiat urna in urna euismod sollicitudin. Etiam vitae semper mi, et posuere tortor. Ut ut nulla ultricies felis rutrum venenatis sed non tellus. Proin volutpat metus vel diam imperdiet, eu feugiat nisl fermentum. Nullam vehicula urna sapien, vel maximus justo pharetra ac. Nunc id massa porta, lobortis eros eget, efficitur purus. In aliquam eleifend magna, vitae iaculis augue ultricies in. Phasellus fermentum ac magna et vulputate. Nullam sed tortor felis. Praesent vestibulum erat facilisis vulputate consequat.', '2024-12-19 22:47:57', '2024-12-19 22:47:57'),
(222, 30, 'en', 'Description', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold is a precious metal that has been treasured for its beauty and value throughout human history. It is a dense, soft, and malleable metal with a distinctive yellow color. Gold is highly sought after for use in jewelry and coins due to its rarity, non-corrosive nature, and resistance to tarnish.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">When used in jewelry, gold is typically alloyed with other metals to increase its strength and durability. As mentioned earlier, gold is measured in carats, which indicates its purity. 24-carat gold is the purest form, but it\'s relatively soft for jewelry-making. Common carat values for gold jewelry are 18K, 14K, and 10K, with the higher numbers indicating higher gold content.</span><br style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Gold jewelry is versatile and timeless, suitable for various styles and occasions. It serves as an excellent backdrop for diamonds, enhancing their brilliance and sparkle.</span></p>', '2024-12-20 17:33:01', '2024-12-20 17:33:01'),
(223, 30, 'en', 'Material Instructions', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">Lorem ipsum dolor sit amet consectetur adipisicing elit. Distinctio velit nostrum, et, soluta sit a voluptatibus unde, omnis sapiente ex cumque culpa commodi harum aperiam? Iure fuga expedita in blanditiis.</span></p>', '2024-12-20 17:33:01', '2024-12-20 17:33:01'),
(224, 30, 'en', 'Returns & Exchanges', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 25px 0px 0px 14px; list-style: none; color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\"><li style=\"position: relative;\">Easy and complimentary, within 14 days</li><li style=\"position: relative;\">See conditions and procedure in our return FAQs</li><li style=\"position: relative;\">Customer is responsible for shipping charges when making -returns and shipping/handling fees of original purchase is non-refundable.</li></ul>', '2024-12-20 17:33:01', '2024-12-20 17:33:01'),
(225, 45, 'en', 'Features', 'Integer commodo erat nisi, sit amet fringilla arcu vehicula consectetur. Cras feugiat urna in urna euismod sollicitudin. Etiam vitae semper mi, et posuere tortor. Ut ut nulla ultricies felis rutrum venenatis sed non tellus. Proin volutpat metus vel diam imperdiet, eu feugiat nisl fermentum. Nullam vehicula urna sapien, vel maximus justo pharetra ac. Nunc id massa porta, lobortis eros eget, efficitur purus. In aliquam eleifend magna, vitae iaculis augue ultricies in. Phasellus fermentum ac magna et vulputate. Nullam sed tortor felis. Praesent vestibulum erat facilisis vulputate consequat.', '2024-12-24 20:27:55', '2024-12-24 20:27:55'),
(226, 44, 'en', 'Shipping', 'Integer commodo erat nisi, sit amet fringilla arcu vehicula consectetur. Cras feugiat urna in urna euismod sollicitudin. Etiam vitae semper mi, et posuere tortor. Ut ut nulla ultricies felis rutrum venenatis sed non tellus. Proin volutpat metus vel diam imperdiet, eu feugiat nisl fermentum. Nullam vehicula urna sapien, vel maximus justo pharetra ac. Nunc id massa porta, lobortis eros eget, efficitur purus. In aliquam eleifend magna, vitae iaculis augue ultricies in. Phasellus fermentum ac magna et vulputate. Nullam sed tortor felis. Praesent vestibulum erat facilisis vulputate consequat.', '2024-12-24 20:28:17', '2024-12-24 20:28:17'),
(227, 44, 'en', 'specification', 'In aliquam eleifend magna, vitae iaculis augue ultricies in. Phasellus fermentum ac magna et vulputate. Nullam sed tortor felis. Praesent vestibulum erat facilisis vulputate consequat.', '2024-12-24 20:28:17', '2024-12-24 20:28:17'),
(228, 47, 'en', 'Tab 1', 'zdvdcxvdfsgfdg', '2024-12-30 17:24:12', '2024-12-30 17:24:12'),
(229, 47, 'en', 'Tab 2', 'dfvgsdgbdfbdfbggbv', '2024-12-30 17:24:12', '2024-12-30 17:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `tags` varchar(500) DEFAULT NULL,
  `lang` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `name`, `unit`, `description`, `tags`, `lang`, `created_at`, `updated_at`) VALUES
(29, 30, 'Elegant Silver Bangle With Diamonds', '24 gram', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">This stunning pair of 18K white and yellow gold curb chain earrings are jewellery box staples suitable for any occasion. The white gold diamond links are removable so that the earrings may be worn as single hoops for a more understated look.</span></p>', 'Product 1,product one', 'en', '2024-11-14 16:16:30', '2024-11-25 21:28:38'),
(31, 32, 'White Gold Diamond Earrings', '8 gram', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">This stunning pair of 18K white and yellow gold curb chain earrings are jewellery box staples suitable for any occasion. The white gold diamond links are removable so that the earrings may be worn as single hoops for a more understated look.</span></p>', 'Product 2 Variant,2 variant', 'en', '2024-11-14 16:22:06', '2024-11-25 16:50:12'),
(32, 32, 'Product 2 Variant arabic', '8 gram arabic', '<p>Product 2 Variant description&nbsp;&nbsp;arabic</p>', 'Product 2 Variant,2 variant,arabic', 'ae', '2024-11-15 13:29:24', '2024-11-15 13:29:24'),
(33, 33, 'Swirling Luxe Diamond Stud Earrings', '16 gram', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum purus erat, porttitor sit amet convallis vel, molestie ac risus. Nullam posuere congue volutpat. Aliquam nec velit egestas, varius nibh vel, molestie est. Cras tincidunt volutpat arcu, nec elementum urna rhoncus sit amet. Cras turpis tortor, suscipit quis mi hendrerit, condimentum suscipit augue. Suspendisse ex ante, tincidunt eget quam quis, condimentum consectetur mauris. Cras porttitor interdum elit, sit amet rhoncus mi. Morbi sapien enim, imperdiet in mi eget, aliquam laoreet nisl. Nunc a sapien id massa vehicula vestibulum. Donec sagittis mi metus, at tempus dolor eleifend in. Integer tincidunt interdum erat, eu dignissim turpis pellentesque sed.</span></p>', '22k,earring,gold', 'en', '2024-11-22 11:56:37', '2024-11-25 18:42:57'),
(34, 33, 'أقراط من الذهب عيار 22', '16 جرام', '<p>العميل مهم جدًا، العميل سيتبعه العميل. كان الدهليز نقيًا، وكان المنفذ أميت فالفاليس أو التحرش والابتسامة. لا تضع أي واجبات منزلية في عطلة نهاية الأسبوع. بعض الناس لا يريدون أن يطالبوا به، فهو مختلف، أو أنه موظف. غدًا هو مصير القوس، وعنصر الجرة ليس مهمًا. غدًا، توربيس تورتور، سوسكيبيت كويس مي هندريريت، صلصة سوسيبت أوج. من المهم أن تعرف ما يحدث أمامك. غدًا تطير شركة الطيران أحيانًا، فليكن CNN الخاص بي. بالنسبة إلى Morbi Sapien، أحتاج إلى الاستثمار في بعض المال. الآن هي مركبة الإنتاج الضخم. حتى السهام خوفي، ولكن وقت الألم يأتي في بعض الأحيان كان الأمر صاخبًا تمامًا، لكن كرة القدم كانت رائعة.</p>', '16 جرام,أقراط ذهبية', 'ae', '2024-11-22 12:09:53', '2024-11-22 12:09:53'),
(35, 34, 'Generic Diamond Pendant Necklace', '40gm', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Vivamus placerat malesuada felis. Nam imperdiet tortor quis augue gravida, a varius ante dapibus. Nunc sed nibh nec dui mattis rutrum eu laoreet lorem. Vivamus malesuada cursus eros, et volutpat massa viverra quis. Phasellus sodales lacus sit amet congue varius. Etiam lacus libero, euismod ut erat vel, malesuada euismod lacus. Sed suscipit nisl magna, et tincidunt odio pellentesque sit amet.</span></p>', 'necklace,temple design', 'en', '2024-11-22 14:14:32', '2024-11-25 18:55:44'),
(36, 34, 'قلادة المعبد', '40gm', '<p>Proin sed eleifend neque، الاتحاد الأوروبي الكرامة النقية. Vivamus dui mauris، suscipit ac convallis varius، شوكولاتة ولا orci. الآن حان وقت القلق بشأن الأخبار ومسار الحداد. لا توجد مركبات المؤلف جعبة تورتور هندريت. وأما السهام في ليجولا البروتين، وعنصر الخوف الناعم. لا توجد سفن كبيرة، ولا شاحنات، ولا مركبات للحياة، فليكن هناك بعض البضائع. Duis hendrerit nibh ut orci consequat، وليس ultricies diam porta. حتى القطر الحزين لكتلة دهليز الحياة، يجب أن يكون سكرانًا. في الواقع، الأطفال أحرار في بعض الأحيان. حتى ذلك المطور نفسه، في الكازينو. بحيرة كاملة وشاملة. كل من يعيش في المستشفى يحتاج إلى رسم كاريكاتوري حزين. لقد كان رسمًا كاريكاتوريًا للحلق، لذا لم يكن هناك أي عنصر. ستتم مطاردة جعبة Fusce من قبل، حيث دخل عامل العبارة في وقت ما. إنها أيضًا فكرة جيدة للأرض، نوع من الفوجيات مثل الحبيبات و</p>', 'قلادة المعبد,قلادة', 'ae', '2024-11-22 14:16:12', '2024-11-22 14:16:12'),
(37, 35, 'White Diamond Zircon Ring', 'Pc', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">This stunning pair of 18K white and yellow gold curb chain earrings are jewellery box staples suitable for any occasion. The white gold diamond links are removable so that the earrings may be worn as single hoops for a more understated look.</span></p>', '', 'en', '2024-11-25 19:05:39', '2024-11-25 19:12:54'),
(38, 36, 'Caitlyn minimalist jewelry set', 'Pc', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">This stunning pair of 18K white and yellow gold curb chain earrings are jewellery box staples suitable for any occasion. The white gold diamond links are removable so that the earrings may be worn as single hoops for a more understated look.</span></p>', '', 'en', '2024-11-25 19:36:14', '2024-11-25 19:40:28'),
(40, 38, 'White Gold Ring with Diamond Stud', 'pc', NULL, '', 'en', '2024-12-04 14:47:47', '2024-12-04 14:47:47'),
(41, 39, 'gold banlge with ancient perls', 'pc', NULL, '', 'en', '2024-12-04 15:09:50', '2024-12-04 15:09:50'),
(43, 41, 'Bridal Wear Diamond Necklace', 'pc', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 16px;\">This stunning pair of 18K white and yellow gold curb chain earrings are jewellery box staples suitable for any occasion. The white gold diamond links are removable so that the earrings may be worn as single hoops for a more understated look.</span></p>', '', 'en', '2024-12-05 15:08:24', '2024-12-05 15:32:27'),
(44, 42, 'Elegant Silver Bangle With Diamonds', '24 gram', NULL, '', 'en', '2024-12-13 22:48:22', '2024-12-13 22:48:22'),
(45, 43, 'Test product', '1pc', NULL, '', 'en', '2024-12-19 21:14:55', '2024-12-19 21:14:55'),
(46, 44, 'Bag', '1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum purus erat, porttitor sit amet convallis vel, molestie ac risus. Nullam posuere congue volutpat. Aliquam nec velit egestas, varius nibh vel, molestie est. Cras tincidunt volutpat arcu, nec elementum urna rhoncus sit amet. Cras turpis tortor, suscipit quis mi hendrerit, condimentum suscipit augue. Suspendisse ex ante, tincidunt eget quam quis, condimentum consectetur mauris. Cras porttitor interdum elit, sit amet rhoncus mi. Morbi sapien enim, imperdiet in mi eget, aliquam laoreet nisl. Nunc a sapien id massa vehicula vestibulum. Donec sagittis mi metus, at tempus dolor eleifend in. Integer tincidunt interdum erat, eu dignissim turpis pellentesque sed.</p>', '', 'en', '2024-12-19 21:57:15', '2024-12-19 21:57:15'),
(47, 45, 'Luxury Watch', '1pc', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum purus erat, porttitor sit amet convallis vel, molestie ac risus. Nullam posuere congue volutpat. Aliquam nec velit egestas, varius nibh vel, molestie est. Cras tincidunt volutpat arcu, nec elementum urna rhoncus sit amet. Cras turpis tortor, suscipit quis mi hendrerit, condimentum suscipit augue. Suspendisse ex ante, tincidunt eget quam quis, condimentum consectetur mauris. Cras porttitor interdum elit, sit amet rhoncus mi. Morbi sapien enim, imperdiet in mi eget, aliquam laoreet nisl. Nunc a sapien id massa vehicula vestibulum. Donec sagittis mi metus, at tempus dolor eleifend in. Integer tincidunt interdum erat, eu dignissim turpis pellentesque sed.</p>', '', 'en', '2024-12-19 22:24:51', '2024-12-19 22:24:51'),
(48, 46, 'Demo product', '1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum purus erat, porttitor sit amet convallis vel, molestie ac risus. Nullam posuere congue volutpat. Aliquam nec velit egestas, varius nibh vel, molestie est. Cras tincidunt volutpat arcu, nec elementum urna rhoncus sit amet. Cras turpis tortor, suscipit quis mi hendrerit, condimentum suscipit augue. Suspendisse ex ante, tincidunt eget quam quis, condimentum consectetur mauris. Cras porttitor interdum elit, sit amet rhoncus mi. Morbi sapien enim, imperdiet in mi eget, aliquam laoreet nisl. Nunc a sapien id massa vehicula vestibulum. Donec sagittis mi metus, at tempus dolor eleifend in. Integer tincidunt interdum erat, eu dignissim turpis pellentesque sed.</p>', '', 'en', '2024-12-19 22:47:57', '2024-12-19 22:47:57'),
(49, 47, 'Vendor Test Product', '24 gram', 'hdjvasjdfgbsakjvhkjjcmds mnnckj sdcm mnnkjxncmv dcn kjncxv kjcxm ,mxcnv mxcznvjjxczkcjkxzjckdz', 'sfndjkfg,sdgdfsgfg,fdsgfbv,cn,bvn,g,hf,rfgtr', 'en', '2024-12-30 17:24:11', '2024-12-30 17:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `photos` text DEFAULT NULL,
  `highlights` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `completion_status` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `subtitle`, `sort_order`, `slug`, `image`, `photos`, `highlights`, `tags`, `completion_status`, `status`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Test', NULL, 0, 'test', NULL, NULL, '[{\"title\":null,\"subtitle\":null},{\"title\":null,\"subtitle\":null},{\"title\":null,\"subtitle\":null}]', '', '0', 0, NULL, '2025-08-23 09:31:35', '2025-08-23 09:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `project_translations`
--

CREATE TABLE `project_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `lang` varchar(10) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `twitter_title` varchar(255) DEFAULT NULL,
  `twitter_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_translations`
--

INSERT INTO `project_translations` (`id`, `project_id`, `name`, `description`, `lang`, `meta_title`, `meta_description`, `meta_keywords`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test', '<p>dsdd<br></p>', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-23 09:31:35', '2025-08-23 09:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `recently_viewed_products`
--

CREATE TABLE `recently_viewed_products` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `guest_token` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `recently_viewed_products`
--

INSERT INTO `recently_viewed_products` (`id`, `user_id`, `guest_token`, `product_id`, `created_at`, `updated_at`) VALUES
(6, NULL, '0f40c102-434b-4342-847e-2ada26f352d5', 34, '2024-11-23 14:01:08', '2024-11-23 18:14:29'),
(7, NULL, '0f40c102-434b-4342-847e-2ada26f352d5', 33, '2024-11-23 14:09:51', '2024-11-23 17:25:27'),
(8, NULL, '0f40c102-434b-4342-847e-2ada26f352d5', 30, '2024-11-23 15:57:46', '2024-11-23 18:13:37'),
(9, NULL, '0f40c102-434b-4342-847e-2ada26f352d5', 32, '2024-11-23 18:13:44', '2024-11-23 19:14:28'),
(10, NULL, 'd50b0d21-74fb-4783-95ba-0c19d836e280', 34, '2024-11-23 23:43:07', '2024-12-03 20:36:32'),
(11, 9, NULL, 30, '2024-11-23 23:44:49', '2024-12-13 22:46:16'),
(12, NULL, 'd50b0d21-74fb-4783-95ba-0c19d836e280', 32, '2024-11-23 23:46:03', '2024-11-30 16:51:07'),
(13, NULL, '1cf64bfb-a940-43b6-8300-62b2a220e2a1', 32, '2024-11-25 13:21:59', '2024-11-26 16:19:11'),
(14, 9, NULL, 32, '2024-11-25 16:14:22', '2024-12-04 22:35:13'),
(15, 9, NULL, 33, '2024-11-25 18:29:10', '2024-12-19 21:56:30'),
(16, 9, NULL, 34, '2024-11-25 18:43:34', '2024-11-25 22:52:16'),
(17, NULL, '1cf64bfb-a940-43b6-8300-62b2a220e2a1', 30, '2024-11-25 18:57:48', '2024-11-25 18:57:48'),
(18, 9, NULL, 35, '2024-11-25 19:06:07', '2024-11-25 21:59:31'),
(19, 9, NULL, 36, '2024-11-25 19:38:28', '2024-11-25 19:40:37'),
(20, NULL, 'd32824fd-a919-405c-94e9-1acdd56e86ba', 30, '2024-11-25 21:19:59', '2024-11-25 21:20:51'),
(21, NULL, 'd32824fd-a919-405c-94e9-1acdd56e86ba', 33, '2024-11-25 21:20:08', '2024-11-25 21:20:08'),
(22, NULL, 'd32824fd-a919-405c-94e9-1acdd56e86ba', 36, '2024-11-25 21:23:04', '2024-11-25 21:23:04'),
(23, NULL, 'd32824fd-a919-405c-94e9-1acdd56e86ba', 32, '2024-11-25 22:04:33', '2024-11-25 22:04:33'),
(24, NULL, 'ace38bab-ae16-4c74-b1d1-615b41b3d773', 30, '2024-11-26 15:32:52', '2024-11-26 15:32:52'),
(25, NULL, '4bafb809-5775-41e7-8b35-a7c2018d85e7', 30, '2024-11-26 17:28:41', '2024-11-26 17:28:41'),
(26, NULL, '8860fd47-5f5a-4042-80b6-79c5c9c3dac6', 32, '2024-11-26 19:39:31', '2024-11-26 19:39:31'),
(27, 54, NULL, 32, '2024-11-26 22:24:30', '2024-11-26 22:24:41'),
(28, NULL, 'f5020902-a956-4737-9b97-8e8a543b635b', 30, '2024-11-27 02:38:42', '2024-11-27 02:38:42'),
(29, NULL, 'e1e5a4f6-81aa-4fd6-9c02-4c66e8d65d82', 32, '2024-11-27 04:11:08', '2024-11-27 04:11:08'),
(30, NULL, 'e4871766-8a65-4cf3-9543-550db42f25bf', 32, '2024-11-28 13:15:23', '2024-11-28 13:15:23'),
(31, NULL, 'c1422628-c813-4799-8a16-e9b536ef77ed', 33, '2024-11-30 23:00:54', '2024-11-30 23:17:15'),
(32, NULL, 'd50b0d21-74fb-4783-95ba-0c19d836e280', 33, '2024-11-30 23:02:11', '2024-12-03 18:15:52'),
(33, NULL, '0adbf587-6db7-431e-b977-bb59f58daeed', 34, '2024-11-30 23:19:16', '2024-11-30 23:19:16'),
(34, NULL, '637124e2-fdd7-4a8c-9e1a-9daac7655ab2', 32, '2024-11-30 23:20:18', '2024-11-30 23:20:18'),
(35, NULL, 'fcb7bf49-10fd-48ec-bf77-a1da6f9166aa', 36, '2024-11-30 23:20:38', '2024-11-30 23:20:38'),
(36, NULL, 'a45c8817-5d49-428d-8685-e240f9e9d7a3', 36, '2024-11-30 23:20:38', '2024-11-30 23:20:38'),
(37, NULL, 'e261d950-7ca3-4620-b8c3-f8cfaa367f33', 36, '2024-11-30 23:20:44', '2024-11-30 23:20:44'),
(38, NULL, 'e6d4e522-ebab-4727-b952-d6173a4a79d0', 36, '2024-11-30 23:20:57', '2024-11-30 23:20:57'),
(39, NULL, '9f9bc328-de6b-42c9-af08-5e2bc7ecd7ef', 33, '2024-11-30 23:21:41', '2024-11-30 23:23:31'),
(40, NULL, '0adbf587-6db7-431e-b977-bb59f58daeed', 30, '2024-11-30 23:29:50', '2024-11-30 23:29:50'),
(41, NULL, 'b1110cf0-5b24-4a6d-9e8d-999f346044ad', 33, '2024-12-01 04:18:24', '2024-12-01 04:18:24'),
(42, NULL, 'ca20c965-4b4e-4726-a256-62cbf7a850f3', 32, '2024-12-03 18:18:17', '2024-12-03 20:22:14'),
(43, NULL, 'ca20c965-4b4e-4726-a256-62cbf7a850f3', 36, '2024-12-03 19:30:51', '2024-12-03 19:30:51'),
(44, 56, NULL, 32, '2024-12-03 20:25:27', '2024-12-04 14:04:29'),
(45, NULL, '0a46ceb3-8b86-4b26-94c2-81ee6ee31ee0', 32, '2024-12-04 02:58:40', '2024-12-04 13:49:11'),
(46, NULL, '5f67b129-e2f9-47de-9cef-da61c138f045', 32, '2024-12-04 13:50:48', '2024-12-04 13:50:48'),
(47, NULL, '5f67b129-e2f9-47de-9cef-da61c138f045', 36, '2024-12-04 13:51:29', '2024-12-04 13:51:29'),
(48, 56, NULL, 38, '2024-12-04 15:01:49', '2024-12-18 21:09:28'),
(49, 56, NULL, 39, '2024-12-04 15:10:28', '2024-12-11 18:39:09'),
(51, NULL, 'f8f3ca77-29ba-41d1-9f74-b90102a7c4a9', 39, '2024-12-04 17:37:37', '2024-12-05 15:00:46'),
(52, NULL, '6556ce28-9bb3-4354-a26a-83b55236dc24', 38, '2024-12-04 19:55:14', '2024-12-04 19:58:01'),
(53, NULL, '6556ce28-9bb3-4354-a26a-83b55236dc24', 39, '2024-12-04 19:55:31', '2024-12-04 19:55:31'),
(54, NULL, '6556ce28-9bb3-4354-a26a-83b55236dc24', 30, '2024-12-04 19:55:57', '2024-12-04 19:57:53'),
(55, 56, NULL, 33, '2024-12-04 20:32:07', '2024-12-04 20:32:07'),
(56, 60, NULL, 30, '2024-12-04 22:05:16', '2025-08-23 08:39:06'),
(57, 60, NULL, 33, '2024-12-04 22:07:45', '2024-12-20 17:31:16'),
(58, 60, NULL, 34, '2024-12-04 22:16:33', '2024-12-20 17:23:49'),
(59, 60, NULL, 38, '2024-12-04 22:18:35', '2024-12-05 19:00:32'),
(60, NULL, 'e75c6217-a567-4127-b0df-44f58a5cd192', 33, '2024-12-04 22:44:14', '2024-12-04 22:44:14'),
(61, 9, NULL, 39, '2024-12-04 22:45:07', '2024-12-23 18:10:32'),
(62, NULL, 'e75c6217-a567-4127-b0df-44f58a5cd192', 38, '2024-12-04 22:54:42', '2024-12-04 22:54:42'),
(63, NULL, 'e75c6217-a567-4127-b0df-44f58a5cd192', 30, '2024-12-04 22:55:02', '2024-12-04 22:55:02'),
(64, NULL, '5f6aa796-1bce-4dc5-8c86-ef97d10fb08d', 30, '2024-12-04 22:59:32', '2024-12-04 23:00:48'),
(65, NULL, '5f6aa796-1bce-4dc5-8c86-ef97d10fb08d', 39, '2024-12-04 22:59:47', '2024-12-04 23:00:32'),
(66, NULL, '5f6aa796-1bce-4dc5-8c86-ef97d10fb08d', 32, '2024-12-04 23:00:15', '2024-12-04 23:00:49'),
(67, NULL, '5f6aa796-1bce-4dc5-8c86-ef97d10fb08d', 33, '2024-12-04 23:00:16', '2024-12-04 23:00:49'),
(68, NULL, '5f6aa796-1bce-4dc5-8c86-ef97d10fb08d', 34, '2024-12-04 23:00:17', '2024-12-04 23:00:49'),
(69, NULL, '5f6aa796-1bce-4dc5-8c86-ef97d10fb08d', 35, '2024-12-04 23:00:21', '2024-12-04 23:00:50'),
(70, NULL, '5f6aa796-1bce-4dc5-8c86-ef97d10fb08d', 36, '2024-12-04 23:00:23', '2024-12-04 23:00:50'),
(71, NULL, '5f6aa796-1bce-4dc5-8c86-ef97d10fb08d', 38, '2024-12-04 23:00:30', '2024-12-04 23:00:32'),
(72, NULL, 'f8f3ca77-29ba-41d1-9f74-b90102a7c4a9', 38, '2024-12-05 13:07:54', '2024-12-05 18:14:22'),
(73, NULL, '6f0cd7b6-0467-4cf4-81bf-34d0ff379865', 35, '2024-12-05 13:59:06', '2024-12-05 13:59:06'),
(74, NULL, '6ef32fbe-c05f-47a1-afc3-99fac3cef9f0', 30, '2024-12-05 14:17:13', '2024-12-05 14:17:13'),
(75, 60, NULL, 36, '2024-12-05 14:26:01', '2024-12-05 17:02:20'),
(76, 60, NULL, 35, '2024-12-05 14:28:50', '2024-12-05 15:11:19'),
(77, NULL, '0a46ceb3-8b86-4b26-94c2-81ee6ee31ee0', 38, '2024-12-05 14:56:31', '2024-12-05 14:57:20'),
(78, 60, NULL, 41, '2024-12-05 15:10:38', '2024-12-20 15:17:04'),
(79, NULL, '69867638-7e74-423c-a4f8-d9591d6ecd07', 39, '2024-12-05 15:39:39', '2024-12-05 16:24:37'),
(80, NULL, '69867638-7e74-423c-a4f8-d9591d6ecd07', 33, '2024-12-05 15:40:57', '2024-12-05 15:41:05'),
(81, NULL, 'db1295b5-d04b-4caa-a5b6-6242c69bd936', 39, '2024-12-05 15:40:58', '2024-12-05 15:40:58'),
(82, NULL, 'db1295b5-d04b-4caa-a5b6-6242c69bd936', 38, '2024-12-05 15:41:29', '2024-12-05 15:41:29'),
(83, NULL, 'dc2d63c1-aa4a-42c6-82bb-dfbe34487c78', 33, '2024-12-05 16:32:04', '2024-12-05 16:32:04'),
(84, 61, NULL, 38, '2024-12-05 16:39:22', '2024-12-05 16:39:22'),
(85, 61, NULL, 39, '2024-12-05 16:42:51', '2024-12-05 16:42:51'),
(86, NULL, '69867638-7e74-423c-a4f8-d9591d6ecd07', 32, '2024-12-05 16:52:13', '2024-12-05 16:52:13'),
(87, 60, NULL, 39, '2024-12-05 19:15:23', '2025-08-23 08:39:25'),
(88, NULL, 'd50b0d21-74fb-4783-95ba-0c19d836e280', 39, '2024-12-05 20:48:24', '2024-12-05 20:48:24'),
(89, NULL, '154b824c-0ce6-4d97-8f4e-3c63d09a122d', 39, '2024-12-05 21:30:48', '2024-12-05 21:31:00'),
(90, NULL, '06e195a0-244f-4fa5-b870-2ed84e2f4d37', 36, '2024-12-09 20:26:14', '2024-12-09 20:26:14'),
(91, NULL, 'd0168dc5-190f-487f-9f10-ff5d1883f1ba', 39, '2024-12-10 07:57:19', '2024-12-10 07:57:19'),
(92, NULL, '7977e2bc-14f8-4bed-899a-4b4ce767da19', 38, '2024-12-10 09:45:57', '2024-12-10 09:45:57'),
(93, NULL, '5a8cfad7-8739-43a7-a516-45fd7eda9a7c', 38, '2024-12-10 13:49:49', '2024-12-10 13:49:49'),
(94, NULL, '5a8cfad7-8739-43a7-a516-45fd7eda9a7c', 39, '2024-12-10 13:50:10', '2024-12-10 18:49:30'),
(95, NULL, '9dfcf7e8-afa8-4285-9415-c9f647ce216d', 39, '2024-12-12 11:11:54', '2024-12-12 11:11:54'),
(96, NULL, 'd2a0a474-1569-47f0-a15e-f258659069a4', 38, '2024-12-12 13:42:29', '2024-12-12 13:42:29'),
(97, NULL, 'd1efb250-d150-4e3c-b626-e79cccedc946', 38, '2024-12-12 22:09:12', '2024-12-13 00:59:50'),
(98, 9, NULL, 42, '2024-12-13 22:48:33', '2024-12-24 20:23:17'),
(99, NULL, 'guest_6756bfc0d73b49.31631915', 42, '2024-12-13 22:48:49', '2024-12-13 22:48:49'),
(100, 58, NULL, 42, '2024-12-13 22:49:18', '2024-12-13 22:49:46'),
(101, NULL, '8d4e5c1c-2f20-4e55-9d0b-61e828bfbc42', 39, '2024-12-14 12:44:41', '2024-12-14 12:44:41'),
(102, NULL, '97dd6f05-3ef6-4982-8936-f06bae0c0cc8', 38, '2024-12-14 14:54:39', '2024-12-14 14:54:39'),
(103, NULL, 'd1efb250-d150-4e3c-b626-e79cccedc946', 42, '2024-12-14 18:01:55', '2024-12-14 18:01:55'),
(104, 56, NULL, 42, '2024-12-14 18:02:19', '2024-12-18 20:44:14'),
(105, NULL, '010b1af5-e5db-4365-9ec1-6b213ed631b0', 33, '2024-12-15 00:00:59', '2024-12-15 00:00:59'),
(106, NULL, 'abe00b64-55dd-4bcd-a572-bd40e7721ebd', 30, '2024-12-15 00:02:26', '2024-12-15 00:02:26'),
(107, NULL, 'e9ed3c38-0c29-4b4a-afa9-ce458d185e7a', 35, '2024-12-15 00:26:21', '2024-12-15 00:26:21'),
(108, NULL, 'e7c668ac-abd0-4408-8371-196f4f1b99ed', 34, '2024-12-15 04:44:47', '2024-12-15 04:44:47'),
(109, NULL, 'a7f2173a-5430-4f0a-a634-753e72003588', 36, '2024-12-15 05:07:09', '2024-12-15 05:07:09'),
(110, NULL, 'bf602ae3-2233-4052-a6f2-27640f726555', 32, '2024-12-15 06:56:21', '2024-12-15 06:56:21'),
(111, NULL, '00436b1c-8f12-41cf-a32e-a05a754367ca', 35, '2024-12-17 05:07:58', '2024-12-17 05:07:58'),
(112, NULL, 'dd13328a-5fc9-41dc-89e9-7c304e360d15', 30, '2024-12-17 05:18:05', '2024-12-17 05:18:05'),
(113, NULL, 'e11d2540-a3e2-4084-a92d-e33deaa2c115', 33, '2024-12-17 05:19:12', '2024-12-17 05:19:12'),
(114, NULL, 'bde5a677-7ce3-4b6f-a728-58bc2583f7e2', 30, '2024-12-17 16:13:33', '2024-12-17 16:13:33'),
(115, NULL, 'bde5a677-7ce3-4b6f-a728-58bc2583f7e2', 38, '2024-12-17 16:13:50', '2024-12-17 16:13:50'),
(116, NULL, '846d440f-75ae-473d-89d1-40f045bebc4c', 39, '2024-12-17 16:29:51', '2024-12-17 16:30:15'),
(117, NULL, '7dd5e35a-737e-4226-af9f-55fa4c76caf1', 38, '2024-12-18 20:32:59', '2024-12-18 20:32:59'),
(118, NULL, '7dd5e35a-737e-4226-af9f-55fa4c76caf1', 42, '2024-12-18 21:23:15', '2024-12-18 21:23:15'),
(119, 63, NULL, 38, '2024-12-18 21:48:10', '2024-12-18 22:42:56'),
(120, 63, NULL, 39, '2024-12-18 21:49:25', '2024-12-18 22:15:21'),
(121, 63, NULL, 42, '2024-12-18 22:16:54', '2024-12-20 17:15:02'),
(122, NULL, 'guest_6763f931953ff3.92807545', 42, '2024-12-19 18:46:18', '2024-12-19 18:46:18'),
(123, NULL, 'guest_6763f931953ff3.92807545', 30, '2024-12-19 18:46:24', '2024-12-19 18:46:24'),
(124, NULL, 'guest_6763f931953ff3.92807545', 38, '2024-12-19 18:52:56', '2024-12-19 18:52:56'),
(125, 9, NULL, 44, '2024-12-19 22:09:33', '2024-12-19 22:09:33'),
(126, 60, NULL, 44, '2024-12-19 22:14:26', '2024-12-20 16:55:40'),
(127, NULL, 'guest_6763f931953ff3.92807545', 44, '2024-12-19 22:19:12', '2024-12-19 22:19:12'),
(128, NULL, 'guest_6763f931953ff3.92807545', 45, '2024-12-19 22:25:43', '2024-12-19 22:43:31'),
(129, 60, NULL, 45, '2024-12-19 22:28:01', '2024-12-20 17:25:03'),
(130, 60, NULL, 32, '2024-12-20 14:14:10', '2024-12-20 14:15:30'),
(131, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 34, '2024-12-20 15:01:53', '2024-12-20 15:25:57'),
(132, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 33, '2024-12-20 15:02:02', '2024-12-20 15:32:37'),
(133, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 30, '2024-12-20 15:10:44', '2024-12-20 15:10:44'),
(134, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 44, '2024-12-20 15:14:16', '2024-12-20 15:14:16'),
(135, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 41, '2024-12-20 15:14:30', '2024-12-20 15:14:30'),
(136, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 32, '2024-12-20 15:34:30', '2024-12-20 15:34:30'),
(137, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 36, '2024-12-20 15:34:39', '2024-12-20 15:34:39'),
(138, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 35, '2024-12-20 15:34:46', '2024-12-20 15:34:46'),
(139, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 45, '2024-12-20 15:35:19', '2024-12-20 15:35:19'),
(140, NULL, '80918806-8f6a-46a0-9bb8-b60efddd4b3a', 38, '2024-12-20 15:35:41', '2024-12-20 16:03:17'),
(141, NULL, 'ef741434-05f6-4ee8-aa21-623984e389cb', 30, '2024-12-20 16:56:03', '2024-12-20 16:56:03'),
(142, NULL, 'a14aa3de-6526-4c0d-b0f0-d833e0d43da2', 35, '2024-12-20 16:58:09', '2024-12-20 16:58:09'),
(143, 60, NULL, 42, '2024-12-20 17:02:28', '2024-12-20 17:07:37'),
(144, NULL, '6243b480-e5d4-4a33-be0b-1346ff1d23f8', 33, '2024-12-20 17:13:21', '2024-12-20 17:13:21'),
(145, NULL, '2a9854c6-f0c2-4a8b-8d3d-4508d480ec05', 32, '2024-12-20 18:56:09', '2024-12-20 18:56:09'),
(146, NULL, '9b3fe131-dbad-4a6a-83e7-b2cefc910e0f', 34, '2024-12-20 19:18:22', '2024-12-20 19:18:22'),
(147, NULL, '488d9ab2-218e-4714-99c6-a4b103751556', 36, '2024-12-20 19:20:19', '2024-12-20 19:20:19'),
(148, NULL, '0ecea69d-8637-482e-b11a-75cbb2b7a1e2', 44, '2024-12-20 23:06:17', '2024-12-20 23:06:17'),
(149, NULL, '9a647375-b5d7-4fa2-925b-b73099860233', 38, '2024-12-20 23:08:15', '2024-12-20 23:08:15'),
(150, NULL, '4cde50c7-98f6-4313-9484-d28d7fd65d72', 45, '2024-12-20 23:09:02', '2024-12-20 23:09:02'),
(151, NULL, 'e448fd83-652d-40b4-a79e-808cf302b320', 46, '2024-12-20 23:10:47', '2024-12-20 23:10:47'),
(152, NULL, '705b47c9-25e9-439d-874c-41b1b7952134', 39, '2024-12-21 00:55:10', '2024-12-21 00:55:10'),
(153, NULL, '7d43dd6a-2775-4afb-b042-f005075da73d', 30, '2024-12-21 16:58:27', '2024-12-21 16:58:27'),
(154, NULL, '7435f78c-731e-439e-9859-a14d54df15e2', 41, '2024-12-21 17:01:24', '2024-12-21 17:01:24'),
(155, NULL, 'cd265523-7ffd-42af-bc80-d647d9a835b5', 36, '2024-12-21 19:34:49', '2024-12-21 19:34:49'),
(156, NULL, '0ef8cb24-1f0f-484a-a061-0fd04d0f9114', 42, '2024-12-21 20:40:21', '2024-12-21 20:40:21'),
(157, NULL, 'd3d00c4d-69e2-44a9-93dd-5eb80da3158e', 39, '2024-12-22 02:57:12', '2024-12-22 02:57:12'),
(158, NULL, '491b0e7a-3c5f-4475-b735-be3375de4fcc', 44, '2024-12-22 05:30:12', '2024-12-22 05:30:12'),
(159, NULL, 'f5b76e79-b4e5-4211-9e6a-928ab558a0c4', 38, '2024-12-22 05:37:03', '2024-12-22 05:37:03'),
(160, NULL, 'f2a86be2-05d2-4533-887f-8abd284af4e8', 33, '2024-12-23 18:45:23', '2024-12-23 18:45:23'),
(161, NULL, '67494c66-3fba-47bb-8b95-1ed05f7a3b87', 34, '2024-12-23 18:56:27', '2024-12-23 18:56:27'),
(162, NULL, 'c721eb2f-a8a1-48c3-8971-508ec1dcad84', 35, '2024-12-23 19:24:57', '2024-12-23 19:24:57'),
(163, NULL, '96e6b9a2-b89c-4ce7-a250-303d19ba9493', 33, '2024-12-23 20:54:58', '2024-12-23 22:22:38'),
(164, NULL, '96e6b9a2-b89c-4ce7-a250-303d19ba9493', 32, '2024-12-23 20:55:09', '2024-12-25 22:13:33'),
(165, NULL, '96e6b9a2-b89c-4ce7-a250-303d19ba9493', 30, '2024-12-23 20:55:15', '2024-12-24 19:51:25'),
(166, NULL, '96e6b9a2-b89c-4ce7-a250-303d19ba9493', 34, '2024-12-23 20:55:28', '2024-12-23 20:55:28'),
(167, NULL, '8ad7f0f5-401c-4a9f-8c76-70915772cacc', 32, '2024-12-24 05:54:27', '2024-12-24 05:54:27'),
(168, NULL, 'f8df607c-3698-4db8-82e3-612c418cbf61', 44, '2024-12-24 06:41:59', '2024-12-24 06:41:59'),
(169, NULL, '47baa62d-88a2-45e1-b176-97cfe3f2c778', 45, '2024-12-24 06:44:11', '2024-12-24 06:44:11'),
(170, NULL, '9ee16d04-b6cb-4192-8764-247f470953b2', 39, '2024-12-24 06:54:17', '2024-12-24 06:54:17'),
(171, NULL, '02d10d06-b8c0-4746-9126-46e1b8197b83', 46, '2024-12-24 07:05:27', '2024-12-24 07:05:27'),
(172, NULL, '2a8806e1-15f8-4665-bf96-99c7cba67d78', 38, '2024-12-24 07:05:27', '2024-12-24 07:05:27'),
(173, NULL, '9eccaeca-dd33-4dfa-a370-d91150638523', 36, '2024-12-24 07:21:01', '2024-12-24 07:21:01'),
(174, NULL, 'guest_67691afe0b4557.37713583', 39, '2024-12-24 22:00:27', '2024-12-24 22:00:27'),
(175, NULL, '64c26667-e397-45d5-af73-946edd59f145', 42, '2024-12-25 13:32:09', '2024-12-25 13:32:09'),
(176, NULL, 'eed2958c-547f-45cb-946f-13225beea76f', 30, '2024-12-25 13:32:47', '2024-12-25 13:32:47'),
(177, NULL, '9f5c41e8-2826-430c-b1d1-e206817d9e28', 41, '2024-12-25 13:38:19', '2024-12-25 13:38:19'),
(178, NULL, 'ac17c06a-b450-4701-913a-b96bf328e2a0', 46, '2024-12-26 13:08:24', '2024-12-26 13:08:24'),
(179, NULL, 'efe97799-bdf4-425f-b61a-273277eac101', 44, '2024-12-26 13:09:48', '2024-12-26 13:09:48'),
(180, NULL, '0be5d75f-fa60-4e8a-8043-d7349026c310', 39, '2024-12-26 13:12:21', '2024-12-26 13:12:21'),
(181, NULL, '5a5a4af1-315b-447a-ae12-51e1963aca7b', 45, '2024-12-26 13:15:16', '2024-12-26 13:15:16'),
(182, NULL, '1f39822a-5db0-4a3a-b1a1-39e72957897e', 38, '2024-12-26 13:22:09', '2024-12-26 13:22:09'),
(183, NULL, '1a0ae0fa-7b85-4491-9292-4b6d03440a30', 36, '2024-12-26 13:30:06', '2024-12-26 13:30:06'),
(184, NULL, '5d455d01-5334-43d8-969a-dfb0eab269cd', 32, '2024-12-26 14:05:57', '2024-12-26 14:05:57'),
(185, NULL, 'bf5499f8-b8ba-4764-815e-dda1b9f4807a', 33, '2024-12-26 15:28:57', '2024-12-26 15:28:57'),
(186, NULL, '0c8882f4-9884-48c9-9880-47baa3faa3c3', 35, '2024-12-26 16:08:10', '2024-12-26 16:08:10'),
(187, NULL, 'e21351a0-d26e-495b-a162-7f6a556c4a96', 34, '2024-12-26 16:18:27', '2024-12-26 16:18:27'),
(188, NULL, 'e92fe035-aabb-4277-907a-83d2839514f5', 44, '2024-12-27 14:16:52', '2024-12-27 14:16:52'),
(189, NULL, '14d87c11-28ea-4f50-8de4-63452a9c5766', 44, '2024-12-28 18:13:00', '2024-12-28 18:13:00'),
(190, NULL, 'a9657d57-d3ee-433c-878f-14ce2e283260', 39, '2024-12-28 18:18:10', '2024-12-28 18:18:10'),
(191, NULL, 'ab7d92c7-2e2c-4b28-b98d-1f0b5f6b4416', 38, '2024-12-28 18:30:14', '2024-12-28 18:30:14'),
(192, NULL, '7b365d38-17cc-4af4-bdd3-0fbf3aa330e5', 44, '2024-12-28 19:17:02', '2024-12-28 19:17:02'),
(193, NULL, 'fbb56388-df96-4ffd-8c98-f2c127d95c1f', 46, '2024-12-28 19:19:58', '2024-12-28 19:19:58'),
(194, NULL, 'e151ce1c-7602-4a01-b858-44eeefc993f6', 39, '2024-12-28 19:28:16', '2024-12-28 19:28:16'),
(195, NULL, '1faa56f2-facc-4fd9-8c1b-f1642d6773dc', 38, '2024-12-28 19:29:10', '2024-12-28 19:29:10'),
(196, NULL, '4d551bf8-627e-4193-82c9-af39cbba5013', 45, '2024-12-28 19:29:11', '2024-12-28 19:29:11'),
(197, NULL, '887ba9e1-427b-4008-b9fe-ac3395767dd1', 36, '2024-12-28 19:41:06', '2024-12-28 19:41:06'),
(198, NULL, 'fb4413ac-7377-4300-a640-8a8273f96301', 32, '2024-12-28 20:56:16', '2024-12-28 20:56:16'),
(199, NULL, 'c9f80e51-df5f-404b-b112-1957706109b4', 42, '2024-12-29 03:11:15', '2024-12-29 03:11:15'),
(200, NULL, 'b2b88f00-8bb5-482d-b5b5-0edac91cb8f8', 30, '2024-12-29 03:33:09', '2024-12-29 03:33:09'),
(201, NULL, '5c0eb12f-0f2b-43b9-9809-5b0b1e44de5d', 41, '2024-12-29 03:33:47', '2024-12-29 03:33:47'),
(202, NULL, '96e6b9a2-b89c-4ce7-a250-303d19ba9493', 47, '2024-12-30 23:53:38', '2024-12-30 23:53:38'),
(203, NULL, 'd754d186-e866-46d3-8f1c-90353d918fa7', 35, '2024-12-30 23:24:15', '2024-12-30 23:24:15'),
(204, NULL, '3f2cde7a-6321-40c2-bd84-1cc6eb2ef7dd', 33, '2024-12-30 23:56:14', '2024-12-30 23:56:14'),
(205, NULL, '9b767085-598f-4089-8536-98fd10f487ea', 34, '2024-12-31 00:04:23', '2024-12-31 00:04:23'),
(206, NULL, '836f6171-6d3c-400f-bb79-8630d3309134', 39, '2024-12-31 13:15:06', '2024-12-31 13:15:06'),
(207, NULL, '7cd0d25f-ee63-49a9-9d7a-fa550a47773e', 38, '2024-12-31 13:23:21', '2024-12-31 13:23:21'),
(208, NULL, '9bbc9446-bcc1-4cbd-acda-b059338e3b29', 44, '2024-12-31 13:39:23', '2024-12-31 13:39:23'),
(209, NULL, 'a5e632cd-d724-4e43-ae83-01d60f2f2d03', 39, '2024-12-31 14:39:27', '2024-12-31 14:39:27'),
(210, NULL, 'edc0fbd5-67d4-4740-94ae-d915290ebf6f', 46, '2024-12-31 14:40:48', '2024-12-31 14:40:48'),
(211, NULL, '16c19959-8425-4766-8f03-e3207ed0cb5a', 38, '2024-12-31 14:41:11', '2024-12-31 14:41:11'),
(212, NULL, 'ad77fe60-60ed-4ac4-b1e3-b74b4dc77545', 45, '2024-12-31 14:43:23', '2024-12-31 14:43:23'),
(213, NULL, 'a129fa8d-ef70-4139-b749-bc9d6dc37594', 44, '2024-12-31 14:51:18', '2024-12-31 14:51:18'),
(214, NULL, 'c9d78db7-3dcd-441c-8977-90560ebda8c3', 36, '2024-12-31 16:08:58', '2024-12-31 16:08:58'),
(215, NULL, '39ee3aee-88dc-4a8a-8231-e84e29852bb4', 32, '2024-12-31 16:09:27', '2024-12-31 16:09:27'),
(216, NULL, '86be40a7-b68f-478d-b798-74dccd53cd3d', 42, '2024-12-31 20:05:17', '2024-12-31 20:05:17'),
(217, NULL, '8e8f076d-a878-4c8c-b974-7b466a3858f2', 30, '2024-12-31 20:09:09', '2024-12-31 20:09:09'),
(218, NULL, 'fd1b976e-252f-4291-82ea-8889459111b2', 41, '2024-12-31 20:15:21', '2024-12-31 20:15:21'),
(219, NULL, 'd1a9f785-0f12-4408-9d3a-dfc6a7b1b0c0', 35, '2025-01-02 09:57:00', '2025-01-02 09:57:00'),
(220, NULL, '00493d6f-d03b-43a8-9810-726159b89d58', 33, '2025-01-02 10:22:11', '2025-01-02 10:22:11'),
(221, NULL, 'f4c834bd-3257-4056-9a66-74d35b31bfae', 34, '2025-01-03 07:58:59', '2025-01-03 07:58:59'),
(222, NULL, 'be9a900d-2fed-4dd1-b08a-e26297a81321', 39, '2025-01-03 16:51:11', '2025-01-03 16:51:11'),
(223, NULL, '54d4bd4e-4cad-45bb-a33d-6334b3fba10d', 38, '2025-01-03 16:53:21', '2025-01-03 16:53:21'),
(224, NULL, '7d3fa478-18ed-4ef5-afd4-29ab230ea32b', 44, '2025-01-03 17:07:27', '2025-01-03 17:07:27'),
(225, NULL, 'b1e8db96-7413-490d-94d8-9df6aeb2c203', 44, '2025-01-03 17:55:27', '2025-01-03 17:55:27'),
(226, NULL, '7539dd17-ad04-4426-a9c9-a8fd006a0d4b', 46, '2025-01-03 17:56:16', '2025-01-03 17:56:16'),
(227, NULL, 'ce03b55c-16d7-4b0f-9985-b693dd4c19db', 30, '2025-01-03 18:04:48', '2025-01-03 18:04:48'),
(228, NULL, '1e195bdf-a695-442a-98d3-55f579109d3c', 45, '2025-01-03 18:09:28', '2025-01-03 18:09:28'),
(229, NULL, '493283a9-6d18-48eb-80d9-00e8275188eb', 41, '2025-01-03 18:10:15', '2025-01-03 18:10:15'),
(230, NULL, '55cf9580-5382-470c-9d90-d81ee551dea8', 38, '2025-01-03 18:15:10', '2025-01-03 18:15:10'),
(231, NULL, '700c55ee-4a78-479e-b152-a35f9eb805e7', 39, '2025-01-03 18:15:14', '2025-01-03 18:15:14'),
(232, NULL, '9468e71e-0854-475e-a32e-aee0d09b8082', 42, '2025-01-03 18:30:27', '2025-01-03 18:30:27'),
(233, NULL, 'bfc1a513-0c38-495e-b885-c1c52f7ff707', 32, '2025-01-03 18:54:21', '2025-01-03 18:54:21'),
(234, NULL, '96abdd65-d50c-4f74-b33c-88f6a010e390', 36, '2025-01-03 23:30:24', '2025-01-03 23:30:24'),
(235, NULL, '563c84c4-4865-4db5-9da9-86b13db46204', 44, '2025-01-04 08:31:30', '2025-01-04 08:31:30'),
(236, NULL, '5370e899-e555-4718-8122-e726fffd1192', 33, '2025-01-05 05:13:15', '2025-01-05 05:13:15'),
(237, NULL, '8c49a032-1e7a-49b2-bd8a-5122c474f4b1', 35, '2025-01-05 05:33:47', '2025-01-05 05:33:47'),
(238, NULL, 'f74c41d7-0691-4c0a-8227-cb5cfb426b61', 39, '2025-01-07 18:29:05', '2025-01-07 18:29:05'),
(239, NULL, '2c04e25a-92d3-4b28-bd57-3143695c4f2d', 38, '2025-01-07 18:30:16', '2025-01-07 18:30:16'),
(240, NULL, 'e959f052-28bd-4de7-96b7-707a5e98f49a', 44, '2025-01-07 18:30:58', '2025-01-07 18:30:58'),
(241, NULL, '4c6d409a-7aed-44fe-9d54-ebb052831e42', 44, '2025-01-07 18:58:11', '2025-01-07 18:58:11'),
(242, NULL, '1ccd639c-5b23-4c3b-853e-5364868c10b8', 45, '2025-01-07 18:59:12', '2025-01-07 18:59:12'),
(243, NULL, '11fdacb8-d5e2-4a15-9a35-160987830607', 39, '2025-01-07 19:02:00', '2025-01-07 19:02:00'),
(244, NULL, '8d266b20-db11-499a-9f1b-8e0b34100fa0', 42, '2025-01-07 19:03:47', '2025-01-07 19:03:47'),
(245, NULL, '82a8d6ce-2d13-4053-a2e8-291c4440e633', 46, '2025-01-07 19:10:00', '2025-01-07 19:10:00'),
(246, NULL, '4c1d8f6f-4c07-46af-a4a6-14679fc32702', 30, '2025-01-07 19:15:28', '2025-01-07 19:15:28'),
(247, NULL, '59aa40b0-fee9-40be-b2b1-1558bf8c7a55', 38, '2025-01-07 23:23:15', '2025-01-07 23:23:15'),
(248, NULL, 'c95b154e-1380-4fef-8a65-f31c0d8a65a3', 41, '2025-01-07 23:23:24', '2025-01-07 23:23:24'),
(249, NULL, '037e9584-9a50-40b5-80a0-35c6b67b33ca', 35, '2025-01-08 01:16:01', '2025-01-08 01:16:01'),
(250, NULL, '52662227-1f26-4b4a-afe3-151c253e6998', 33, '2025-01-08 01:21:00', '2025-01-08 01:21:00'),
(251, NULL, '63ff53dd-f710-4c1d-b354-10e9ebacd2cd', 34, '2025-01-08 02:21:18', '2025-01-08 02:21:18'),
(252, NULL, 'df51fc1c-d253-4869-ae11-9b4bc08eacbb', 47, '2025-01-08 03:51:46', '2025-01-08 03:51:46'),
(253, NULL, '1867dc72-810f-4a7f-ac1f-bc5cc30b3dce', 47, '2025-01-08 14:04:18', '2025-01-08 14:04:18'),
(254, NULL, '49632e05-2015-4e94-8604-716f13a7cb3e', 44, '2025-01-09 05:57:12', '2025-01-09 05:57:12'),
(255, NULL, '9a532412-bf3e-4ed0-aa3a-5e5dfcd3991d', 36, '2025-01-09 14:37:26', '2025-01-09 14:37:26'),
(256, NULL, '1458ad01-76bc-420c-847f-04cb9fb8b977', 32, '2025-01-09 15:10:15', '2025-01-09 15:10:15'),
(257, NULL, '67537f07-f93e-47bc-9392-662641866e40', 32, '2025-01-12 12:00:58', '2025-01-12 12:00:58'),
(258, NULL, '07485d98-43c4-49de-b20a-533700d5fb40', 36, '2025-01-12 12:31:05', '2025-01-12 12:31:05'),
(259, NULL, '0c6f0334-f9f8-41da-a475-8e76244dae12', 44, '2025-01-14 11:44:13', '2025-01-14 11:44:13'),
(260, NULL, 'fb8d7f8b-1e04-4138-a758-f5fd62c9c66c', 44, '2025-01-14 13:49:13', '2025-01-14 13:49:13'),
(261, NULL, '90d1ff00-81fb-4bea-93b8-3f4da6901340', 32, '2025-01-15 08:40:25', '2025-01-15 08:40:25'),
(262, NULL, '6dc55758-63c5-4773-aa83-62a645096fcb', 36, '2025-01-15 09:06:12', '2025-01-15 09:06:12'),
(263, NULL, '3070bea6-2916-44e1-9393-ce3fd56d0696', 47, '2025-01-15 14:14:18', '2025-01-15 14:14:18'),
(264, NULL, '11703c2b-a8c1-4b42-a128-851c0894973c', 39, '2025-01-16 18:18:48', '2025-01-16 18:18:48'),
(265, NULL, '4c47983f-76a2-460a-9e98-639436588c4a', 38, '2025-01-16 18:19:22', '2025-01-16 18:19:22'),
(266, NULL, '7f8b954e-74b9-45b5-b449-855869eb100b', 44, '2025-01-16 19:00:10', '2025-01-16 19:00:10'),
(267, NULL, '9c2dc567-6952-470f-9326-cdfe9ec9d7f5', 44, '2025-01-16 19:11:11', '2025-01-16 19:11:11'),
(268, NULL, 'ade7aeee-a074-4ab2-9f80-fd38f1561ca5', 46, '2025-01-16 19:13:21', '2025-01-16 19:13:21'),
(269, NULL, '1ba592e5-aee5-4a3c-a78b-2459bea5b389', 45, '2025-01-16 19:13:47', '2025-01-16 19:13:47'),
(270, NULL, 'dfad4a9c-a7da-4e54-b4ad-9277103c684e', 39, '2025-01-16 19:13:48', '2025-01-16 19:13:48'),
(271, NULL, 'df450c44-6bc8-4a6d-be16-785dc1210fdd', 42, '2025-01-16 19:13:58', '2025-01-16 19:13:58'),
(272, NULL, '40fd3ba4-64f5-44a9-97d7-1a270f226e26', 30, '2025-01-16 20:10:06', '2025-01-16 20:10:06'),
(273, NULL, 'f65c11bd-0be2-426b-b3f2-1ab3e90d8301', 41, '2025-01-16 20:10:21', '2025-01-16 20:10:21'),
(274, NULL, '4c085cbe-2f06-495f-b866-d107dff11ef2', 38, '2025-01-16 20:17:26', '2025-01-16 20:17:26'),
(275, NULL, '675f8faa-c7de-4c79-9be1-750f54f2b922', 33, '2025-01-16 21:03:49', '2025-01-16 21:03:49'),
(276, NULL, '3c1ad6cd-f39c-406e-bb08-d6d0f2fec9eb', 34, '2025-01-16 21:14:49', '2025-01-16 21:14:49'),
(277, NULL, 'f880f985-ba2e-48e3-a115-912bdfff7c94', 35, '2025-01-16 21:30:00', '2025-01-16 21:30:00'),
(278, NULL, '432b652e-110b-464e-82d5-694842b8bc0e', 47, '2025-01-18 17:43:18', '2025-01-18 17:43:18'),
(279, NULL, 'b22d13cf-a13d-4041-9b31-7deeb9979977', 44, '2025-01-18 20:16:13', '2025-01-18 20:16:13'),
(280, NULL, '867e4598-c847-40a0-b63d-6f1a3a7ced4d', 47, '2025-01-18 23:24:18', '2025-01-18 23:24:18'),
(281, NULL, '188330e4-71c6-4ccd-90c2-0290d5f16728', 32, '2025-01-18 23:37:23', '2025-01-18 23:37:23'),
(282, NULL, 'eedc8b0e-abe7-40fc-a2bb-84c40aa34d9b', 36, '2025-01-19 00:47:25', '2025-01-19 00:47:25'),
(283, NULL, '2cfcc207-5cc5-4ed7-b9a0-d3c558f330ca', 44, '2025-01-19 13:21:10', '2025-01-19 13:21:10'),
(284, NULL, 'f98a3245-f830-405c-9d11-16937b3df74d', 39, '2025-01-19 16:51:48', '2025-01-19 16:51:48'),
(285, NULL, '9455969e-f7bc-43d0-8ad8-c8c36aa0378d', 38, '2025-01-19 17:46:12', '2025-01-19 17:46:12'),
(286, NULL, '2cadec6e-4a64-40ae-98a2-8d82662b4ee6', 45, '2025-01-19 18:08:01', '2025-01-19 18:08:01'),
(287, NULL, '4a31a425-e4cb-4893-842d-71b0f1faa9b7', 39, '2025-01-19 18:08:21', '2025-01-19 18:08:21'),
(288, NULL, '19e0b56d-7ef0-4670-a2e5-9b1b0fd56729', 42, '2025-01-19 18:10:25', '2025-01-19 18:10:25'),
(289, NULL, '930ba36d-ef92-4f9f-8354-94678bc1ee36', 46, '2025-01-19 18:12:58', '2025-01-19 18:12:58'),
(290, NULL, '800dafe4-49c9-498f-aa6d-de16f090997a', 30, '2025-01-19 18:25:58', '2025-01-19 18:25:58'),
(291, NULL, '0754cfe7-d35b-4d30-9255-8fee3e6be510', 41, '2025-01-19 18:29:09', '2025-01-19 18:29:09'),
(292, NULL, '81b4b6ab-f737-4c41-af20-63a71b708712', 44, '2025-01-19 18:29:10', '2025-01-19 18:29:10'),
(293, NULL, 'b5cf7dd3-e970-4216-bfb2-d6155a80b323', 38, '2025-01-19 18:30:01', '2025-01-19 18:30:01'),
(294, NULL, 'dd38314e-037e-4fb5-9cac-9f67b10db33c', 35, '2025-01-19 19:04:10', '2025-01-19 19:04:10'),
(295, NULL, 'af675b53-c653-4264-9825-6d90e7779b28', 33, '2025-01-19 19:53:57', '2025-01-19 19:53:57'),
(296, NULL, '6074c554-e367-45b9-a2a3-fdee2b2d298e', 34, '2025-01-19 20:09:02', '2025-01-19 20:09:02'),
(297, NULL, '1d375d8e-c462-45c2-b8f3-d6270fa8db44', 45, '2025-01-20 00:03:00', '2025-01-20 00:03:00'),
(298, NULL, 'd585d9ca-6171-418b-8f94-aac76728261d', 39, '2025-01-20 00:07:05', '2025-01-20 00:07:05'),
(299, NULL, '67af6ddc-720f-4ddd-8a17-1cf0f4a56732', 42, '2025-01-20 00:08:00', '2025-01-20 00:08:00'),
(300, NULL, 'b829ed1a-b432-44d0-8fe2-bc1aa8c2bb43', 46, '2025-01-20 00:36:09', '2025-01-20 00:36:09'),
(301, NULL, '865a3788-8afb-4fba-a6ba-c3ee89807148', 41, '2025-01-20 00:36:10', '2025-01-20 00:36:10'),
(302, NULL, 'd30ff5c6-cb57-4a77-b3c4-56b8437436fd', 38, '2025-01-20 00:42:48', '2025-01-20 00:42:48'),
(303, NULL, '085c2a1e-caad-487d-81e3-d2dbcc3d610a', 44, '2025-01-20 00:43:24', '2025-01-20 00:43:24'),
(304, NULL, 'b4961616-2ce8-4930-8b5a-983cdb8fa7fa', 30, '2025-01-20 00:44:58', '2025-01-20 00:44:58'),
(305, NULL, 'edc5ba21-fcbe-4e82-8001-1ea34f5fe20c', 35, '2025-01-20 01:47:25', '2025-01-20 01:47:25'),
(306, NULL, '1691c728-d79f-4edf-b092-2fcdffe5664b', 34, '2025-01-20 02:14:48', '2025-01-20 02:14:48'),
(307, NULL, 'b8315e7a-366e-49a4-a03b-4e679aab510d', 33, '2025-01-20 02:41:57', '2025-01-20 02:41:57'),
(308, NULL, '7b34afa4-33cf-48be-8da3-93ceea0709a3', 32, '2025-01-23 13:20:26', '2025-01-23 13:20:38'),
(309, NULL, 'e255445c-4606-4e55-9a2d-923237ac1cfe', 32, '2025-01-23 17:21:10', '2025-01-23 17:21:10'),
(310, NULL, '6e4e1c41-3742-4746-a071-397ce59a4edc', 44, '2025-01-23 23:25:27', '2025-01-23 23:25:27'),
(311, NULL, '7a49e2b5-66fc-47eb-9c4a-6edeccaa1f18', 30, '2025-02-04 02:10:00', '2025-02-04 02:10:00'),
(312, NULL, '513b81ae-ad59-47cb-aba8-2f7678487732', 44, '2025-02-08 00:02:28', '2025-02-08 00:02:28'),
(313, NULL, '8e0aac74-a6bf-4a46-88cb-258ef400e09f', 47, '2025-02-10 10:31:24', '2025-02-10 10:31:24'),
(314, NULL, '4e8cbfd4-cec6-4562-9924-f58d601b1700', 33, '2025-02-10 10:39:04', '2025-02-10 10:39:04'),
(315, NULL, 'd5ee48cc-c19f-41f5-be4c-123f03e3440c', 41, '2025-02-11 22:12:47', '2025-02-11 22:12:47'),
(316, NULL, '358bc6f6-b57d-41f7-89fe-2e10154e0702', 35, '2025-02-15 09:10:49', '2025-02-15 09:10:49'),
(317, NULL, 'c3a825b5-8c35-4094-bba1-431ecbaeea21', 34, '2025-02-15 20:02:52', '2025-02-15 20:02:52'),
(318, NULL, 'cbccdd9a-ef22-4673-b495-5b967f8d8668', 30, '2025-02-20 06:46:01', '2025-02-20 06:46:01'),
(319, NULL, '90a4330d-2fe2-47c6-99cf-0690e4bbd133', 32, '2025-02-20 06:46:07', '2025-02-20 06:46:07'),
(320, NULL, '34d255bd-7d3b-49ce-8f4f-151ecc8f68be', 38, '2025-02-20 06:46:25', '2025-02-20 06:46:25'),
(321, NULL, '5dee8f97-20b8-42b4-be09-20bf2a18ae1c', 46, '2025-02-20 06:46:27', '2025-02-20 06:46:27'),
(322, NULL, 'fd9216f4-1996-43d6-b609-1f3d4b2e4677', 44, '2025-02-20 06:46:30', '2025-02-20 06:46:30'),
(323, NULL, '2deefac0-a7d6-49c2-a43d-55eefd004349', 45, '2025-02-20 06:46:52', '2025-02-20 06:46:52'),
(324, NULL, 'e96feba5-6d98-4c55-9c01-cddccec1a6a0', 33, '2025-02-20 06:47:02', '2025-02-20 06:47:02'),
(325, NULL, 'e0f6de5a-c017-4c76-ba58-f5ff819ff527', 47, '2025-02-20 06:47:03', '2025-02-20 06:47:03'),
(326, NULL, '0494a191-e1d8-4772-9dae-ec8284876c6a', 35, '2025-02-20 06:47:14', '2025-02-20 06:47:14'),
(327, NULL, '29d92761-8721-4f76-af81-19daa5e53dad', 42, '2025-02-20 06:47:27', '2025-02-20 06:47:27'),
(328, NULL, 'e4f742d5-e93b-43ab-8fcb-49fec31911bf', 38, '2025-02-20 06:47:43', '2025-02-20 06:47:43'),
(329, NULL, '9b2d746a-4434-47b1-bae2-062b0b618ded', 44, '2025-02-20 06:47:51', '2025-02-20 06:47:51'),
(330, NULL, '8fed8e4f-1f2d-4fcf-965d-b8e80a008db3', 39, '2025-02-20 06:48:02', '2025-02-20 06:48:02'),
(331, NULL, '34b903be-e4f1-428c-a0dc-6542885bc8bd', 34, '2025-02-20 06:48:03', '2025-02-20 06:48:03'),
(332, NULL, '04a2af78-5f91-4935-8764-788c0fcbb8f6', 39, '2025-02-20 06:48:27', '2025-02-20 06:48:27'),
(333, NULL, '870d5008-2687-4486-b06f-c5ecb8ecb639', 41, '2025-02-20 06:48:44', '2025-02-20 06:48:44'),
(334, NULL, '852fce6c-1f03-443c-9a0d-c90427e2b323', 36, '2025-02-20 06:49:02', '2025-02-20 06:49:02'),
(335, NULL, '91afcc7c-00eb-45e7-9e87-89624241387c', 34, '2025-02-20 19:22:09', '2025-02-20 19:22:09'),
(336, NULL, '7bf4c9fd-e9ae-415c-99ab-266c31f09874', 36, '2025-02-20 19:23:11', '2025-02-20 19:23:11'),
(337, NULL, 'bafda5b8-41c0-4352-926d-ed4762f3e0dd', 30, '2025-02-20 19:23:38', '2025-02-20 19:23:38'),
(338, NULL, '8f998872-9aaf-4d23-a282-91e7de93dd3a', 46, '2025-02-20 19:24:03', '2025-02-20 19:24:03'),
(339, NULL, '14884c44-cc6f-43e4-bf33-4f03f30de0a0', 47, '2025-02-20 19:24:25', '2025-02-20 19:24:25'),
(340, NULL, 'ff0af1f1-6b16-4d26-9046-3da47b4be8ed', 38, '2025-02-20 19:41:20', '2025-02-20 19:41:20'),
(341, NULL, 'e2b4613e-f4c4-4467-86fb-4802fb373322', 45, '2025-02-20 19:41:55', '2025-02-20 19:41:55'),
(342, NULL, '010d5302-3474-47b1-a22c-80fdd203ad98', 35, '2025-02-20 19:42:24', '2025-02-20 19:42:24'),
(343, NULL, '30258ca3-c9aa-4b05-9e87-61723783f48a', 32, '2025-02-20 19:42:53', '2025-02-20 19:42:53'),
(344, NULL, '3d8726b1-8a12-43c2-89aa-6cb4a73a597b', 41, '2025-02-20 19:45:42', '2025-02-20 19:45:42'),
(345, NULL, '96553c57-e47c-43b5-a87c-3aa882ffb51d', 33, '2025-02-20 19:46:45', '2025-02-20 19:46:45'),
(346, NULL, 'f53b2a3e-c1e4-423d-9742-b1f2e4f150da', 39, '2025-02-20 19:50:04', '2025-02-20 19:50:04'),
(347, NULL, '03c9b6c0-f583-47de-baf7-caaadded6f57', 42, '2025-02-20 19:58:02', '2025-02-20 19:58:02'),
(348, NULL, 'c820964e-8c7a-4dba-9509-236517dd6d5e', 44, '2025-02-20 19:59:30', '2025-02-20 19:59:30'),
(349, NULL, '34f6fa91-ec22-4eaa-b883-26dbed943fc1', 39, '2025-02-20 20:02:26', '2025-02-20 20:02:26'),
(350, NULL, 'cd047d84-329d-4a35-853a-27206b72c966', 42, '2025-02-20 20:05:12', '2025-02-20 20:05:12'),
(351, NULL, '0e864c21-f330-40db-9700-8f77b3fe7664', 30, '2025-02-20 20:09:31', '2025-02-20 20:09:31'),
(352, NULL, 'c9d2dd27-8dd6-47fc-9633-690b2ceba7bd', 38, '2025-02-20 20:11:39', '2025-02-20 20:11:39'),
(353, NULL, '4d76e57f-9307-4fbe-a03f-b276044e040b', 32, '2025-02-20 20:50:40', '2025-02-20 20:50:40'),
(354, NULL, '2f458ca5-2c8e-4788-9d65-f2cb79f7514b', 44, '2025-02-20 20:54:16', '2025-02-20 20:54:16'),
(355, NULL, 'bedc9563-9d4d-4459-831a-bc9d32e83dcb', 34, '2025-02-25 11:47:33', '2025-02-25 11:47:33'),
(356, NULL, '05d59bf3-71de-4af2-9535-dde6610c4f0c', 46, '2025-02-26 13:24:29', '2025-02-26 13:24:29'),
(357, NULL, '483be35c-ef50-4121-8bfb-1394068bf737', 38, '2025-02-26 13:24:42', '2025-02-26 13:24:42'),
(358, NULL, '3ce88298-9bbe-40ca-88c8-bbc866b3191d', 36, '2025-02-26 13:37:19', '2025-02-26 13:37:19'),
(359, NULL, 'cfef3fa5-5040-4563-b5d0-d8832d1147ed', 38, '2025-02-26 13:45:48', '2025-02-26 13:45:48'),
(360, NULL, 'dc740a77-c39f-4d9f-bff4-ada92187d375', 34, '2025-02-26 13:48:26', '2025-02-26 13:48:26'),
(361, NULL, '6709080c-8fec-4cbb-8029-c6f0b50944c8', 32, '2025-02-26 13:52:00', '2025-02-26 13:52:00'),
(362, NULL, '5620759e-8585-433f-bac6-79c5b05afcd9', 33, '2025-02-26 13:53:22', '2025-02-26 13:53:22'),
(363, NULL, 'b65a9ff7-9b67-48b7-be66-a581e7789f7c', 30, '2025-02-26 13:56:20', '2025-02-26 13:56:20'),
(364, NULL, '329e2d4c-2d18-4d15-aea5-837ee23379b5', 42, '2025-02-26 13:56:31', '2025-02-26 13:56:31'),
(365, NULL, 'e035a4e9-63d4-4a3b-bbbe-d124eda0920d', 39, '2025-02-26 13:58:31', '2025-02-26 13:58:31'),
(366, NULL, 'a8b0568f-5955-4252-8193-58a89beefa92', 32, '2025-03-01 12:19:43', '2025-03-01 12:19:43'),
(367, NULL, 'f3b256af-bd27-4b75-8241-ea697f4b17c9', 33, '2025-03-08 06:33:18', '2025-03-08 06:33:18'),
(368, NULL, '28b4ade4-6a8c-41ab-a4c2-b99e8b0b8810', 34, '2025-03-08 08:53:33', '2025-03-08 08:53:33'),
(369, NULL, 'bb861d04-b344-4a90-bece-c85d4d9d2c94', 36, '2025-03-09 03:27:36', '2025-03-09 03:27:36'),
(370, NULL, 'be979870-e47d-4b11-be2c-141f815eb183', 36, '2025-03-14 10:38:35', '2025-03-14 10:38:35'),
(371, NULL, '585e92b6-d91c-4f61-b45b-42d0c899bc90', 35, '2025-03-14 10:38:36', '2025-03-14 10:38:36'),
(372, NULL, '742dea18-19d8-48cf-b1d3-91e0a999b8d5', 34, '2025-03-14 10:38:36', '2025-03-14 10:38:36'),
(373, NULL, '0740775a-a416-43d2-9177-ae9fbe78207a', 33, '2025-03-14 10:38:37', '2025-03-14 10:38:37'),
(374, NULL, '79cf8df7-9c3f-484f-90f4-0999565d9d66', 32, '2025-03-14 10:38:37', '2025-03-14 10:38:37'),
(375, NULL, '96aee793-3a02-4b05-b551-0295f3ad1265', 30, '2025-03-14 10:38:38', '2025-03-14 10:38:38'),
(376, NULL, 'f38bae3e-faeb-4710-8599-583ec8707dc6', 45, '2025-03-14 10:38:58', '2025-03-14 10:38:58'),
(377, NULL, '8d33638e-db83-46e0-8087-c8763b0c56ac', 36, '2025-03-14 10:38:59', '2025-03-14 10:38:59'),
(378, NULL, 'a2a79fb1-1f11-4baa-9f7d-ccea84a839b2', 38, '2025-03-14 10:39:04', '2025-03-14 10:39:04'),
(379, NULL, '76aa05aa-74fb-4d67-bca8-8c3d85ad0a05', 46, '2025-03-14 10:39:06', '2025-03-14 10:39:06'),
(380, NULL, 'eca8654d-7911-4a12-96c4-0c732c7db2b4', 35, '2025-03-14 10:39:08', '2025-03-14 10:39:08'),
(381, NULL, 'ed594670-5cbb-452e-861a-acefe579899d', 41, '2025-03-14 10:39:13', '2025-03-14 10:39:13'),
(382, NULL, '4e5b47c6-bd1e-4a58-8e12-b52cade5f2ed', 44, '2025-03-14 10:39:14', '2025-03-14 10:39:14'),
(383, NULL, 'b9a607b0-acf7-4170-9668-9dc88c7d23eb', 47, '2025-03-14 10:39:15', '2025-03-14 10:39:15'),
(384, NULL, 'ca43b47c-760d-44d1-bcc8-17d1c291844e', 34, '2025-03-14 10:39:16', '2025-03-14 10:39:16'),
(385, NULL, '453039e9-2001-4b8d-afee-87c6246f79fb', 33, '2025-03-14 10:39:20', '2025-03-14 10:39:20'),
(386, NULL, 'eb88e1ad-0dfb-42c4-84c2-beebef9217b7', 34, '2025-03-20 19:06:52', '2025-03-20 19:06:52'),
(387, NULL, '284af761-52f7-4b1c-bd87-cbf6b9221488', 36, '2025-03-20 19:07:49', '2025-03-20 19:07:49'),
(388, NULL, '2a973d27-6679-4393-add4-dfa7c4a4138e', 30, '2025-03-20 19:08:14', '2025-03-20 19:08:14'),
(389, NULL, 'ad84aa97-859b-44f2-8e09-337155f92cbd', 46, '2025-03-20 19:08:37', '2025-03-20 19:08:37'),
(390, NULL, '2f5ff1d2-8362-4ef4-9ae9-9ca94222bcc1', 35, '2025-03-20 19:08:57', '2025-03-20 19:08:57'),
(391, NULL, 'd7749b50-1cff-42ef-a428-b4da53105748', 32, '2025-03-20 19:09:15', '2025-03-20 19:09:15'),
(392, NULL, '19d29a98-b0c5-4b3d-8fce-216f406047cb', 33, '2025-03-20 19:09:31', '2025-03-20 19:09:31'),
(393, NULL, 'ed761ddc-ab11-4276-973c-de5c7bd6deab', 47, '2025-03-20 19:11:40', '2025-03-20 19:11:40'),
(394, NULL, '43e17f05-2029-450f-be88-10b13e4dc8dc', 41, '2025-03-20 19:12:44', '2025-03-20 19:12:44'),
(395, NULL, '39f8f596-4ef3-45aa-a9c5-78b3d44d3024', 45, '2025-03-20 19:14:34', '2025-03-20 19:14:34'),
(396, NULL, '1b52b4f6-1d93-4080-bcd5-cd8a23da8447', 38, '2025-03-20 19:16:03', '2025-03-20 19:16:03'),
(397, NULL, '0618883f-d469-40a7-bdf7-03f4ed067614', 44, '2025-03-20 19:17:14', '2025-03-20 19:17:14'),
(398, NULL, '45616f4e-2112-48db-8c68-500e7932717c', 39, '2025-03-20 19:18:12', '2025-03-20 19:18:12'),
(399, NULL, 'd45ff43e-ea2f-4c5c-99f9-456be4aaf3e0', 42, '2025-03-20 19:18:36', '2025-03-20 19:18:36'),
(400, NULL, 'b7a77830-5cd5-494a-b0d4-aea4d0489a9c', 35, '2025-03-30 05:16:38', '2025-03-30 05:16:38'),
(401, NULL, '04e34571-b1fe-4662-9dd2-4f82528baa8c', 34, '2025-03-30 11:05:48', '2025-03-30 11:05:48'),
(402, NULL, '6a2f5cb1-8cad-49da-8ee8-dc64b4001d96', 32, '2025-04-02 13:43:14', '2025-04-02 13:43:14'),
(403, NULL, 'f4c0ac65-fc49-4b31-a679-f07e2b6bccf2', 33, '2025-04-02 13:55:20', '2025-04-02 13:55:20'),
(404, NULL, '0c7fe8e0-ffda-4d9a-8a07-12421aa6f864', 36, '2025-04-02 14:10:16', '2025-04-02 14:10:14'),
(405, NULL, 'f7412f80-b229-49db-aa5c-7a8673425d92', 35, '2025-04-02 14:23:59', '2025-04-02 14:23:59'),
(406, NULL, '47ce241b-5d07-4b68-b806-dce70061e1c0', 34, '2025-04-02 14:36:57', '2025-04-02 14:36:57'),
(407, NULL, '2f33712d-08cc-47e2-b4e8-abf0dfff08f3', 30, '2025-04-02 14:54:26', '2025-04-02 14:54:26'),
(408, NULL, '2c181bd5-c2d2-4ffb-bf6e-281b5e58c967', 44, '2025-04-02 16:20:13', '2025-04-02 16:20:13'),
(409, NULL, '58f7bb06-5fb2-4f62-a674-2a65d3e8a618', 41, '2025-04-02 18:31:39', '2025-04-02 18:31:39'),
(410, NULL, 'b412df7e-7585-4457-9db4-36178e96f315', 45, '2025-04-02 19:15:56', '2025-04-02 19:15:56'),
(411, NULL, '404a221b-56a8-49ce-88a7-fd9022dd4027', 47, '2025-04-02 19:57:26', '2025-04-02 19:57:26'),
(412, NULL, '067e29a3-1b51-4e19-ad3f-1d20dedb1520', 38, '2025-04-02 20:42:26', '2025-04-02 20:42:26'),
(413, NULL, '6e26506a-8b54-4f20-9395-45f4e632ec2b', 46, '2025-04-02 21:34:23', '2025-04-02 21:34:23'),
(414, NULL, '3a4474d1-3bcf-4178-980e-39af8e61d2a1', 39, '2025-04-02 22:24:37', '2025-04-02 22:24:37'),
(415, NULL, '83a921a7-328e-47fe-91c5-31220681b436', 42, '2025-04-02 23:17:59', '2025-04-02 23:17:59'),
(416, NULL, '2dad0b0e-dc35-4fc0-a5d3-727f471956c5', 44, '2025-04-03 05:37:52', '2025-04-03 05:37:52'),
(417, NULL, '6b7e9352-8312-44e8-ac15-fde001d77533', 39, '2025-04-03 06:33:55', '2025-04-03 06:33:55'),
(418, NULL, '52f3a1d1-9ba0-4732-83d6-033e31451763', 38, '2025-04-03 07:28:24', '2025-04-03 07:28:24'),
(419, NULL, '251723fd-f854-497c-83ee-0cbbab7b7883', 44, '2025-04-07 13:21:06', '2025-04-07 13:21:06'),
(420, NULL, 'cdf4b6f5-60cf-48ac-8e6a-3b1c3284ef2a', 33, '2025-04-08 12:00:31', '2025-04-08 12:00:31'),
(421, NULL, '119aee87-e209-4716-a7b6-f667465740b3', 34, '2025-04-08 13:57:34', '2025-04-08 13:57:34'),
(422, NULL, 'ac621e23-10f4-484d-9b48-56798d1c10a1', 32, '2025-04-08 15:40:32', '2025-04-08 15:40:32'),
(423, NULL, '8dce6c72-831f-438c-ad12-f2b19508947c', 44, '2025-04-08 17:34:05', '2025-04-08 17:34:05'),
(424, NULL, 'ddcc84e5-0d47-4d2f-8ad3-b8622bef3721', 36, '2025-04-08 19:33:35', '2025-04-08 19:33:35'),
(425, NULL, '8b548ec0-3705-4e2e-8f2c-f22a07a05df7', 35, '2025-04-08 20:30:28', '2025-04-08 20:30:28'),
(426, NULL, 'd440c62a-0d16-4b0c-8c1f-4d1588b981d3', 41, '2025-04-08 21:16:58', '2025-04-08 21:16:58'),
(427, NULL, 'deb2ed58-7f91-4e5f-85fe-fa4f08cdc1fa', 47, '2025-04-08 22:07:29', '2025-04-08 22:07:29'),
(428, NULL, '5de7d740-d3d2-4a8a-8f70-79392c27f054', 30, '2025-04-08 23:08:13', '2025-04-08 23:08:13'),
(429, NULL, '3329b159-705b-487b-9e88-9537b4383dd8', 45, '2025-04-09 01:04:59', '2025-04-09 01:04:59'),
(430, NULL, '4b54955e-3b52-4429-8737-ee31508d94d3', 38, '2025-04-09 03:21:44', '2025-04-09 03:21:44'),
(431, NULL, '887c1052-f4a3-4ca2-9a62-55b675d432cf', 46, '2025-04-09 05:15:17', '2025-04-09 05:15:17'),
(432, NULL, '3c042cc9-409a-492e-9f26-cf36b4612fce', 39, '2025-04-09 07:00:28', '2025-04-09 07:00:28'),
(433, NULL, 'd9d4dd3c-6555-463c-86c1-09ead1f4394d', 42, '2025-04-09 11:05:07', '2025-04-09 11:05:07'),
(434, NULL, '764728f8-37cf-475c-b248-c0c4dd9403d7', 33, '2025-04-09 21:48:15', '2025-04-09 21:48:15'),
(435, NULL, '2f853c63-c4d0-4fcf-b7aa-c61d59a90e98', 44, '2025-04-10 04:53:40', '2025-04-10 04:53:40'),
(436, NULL, 'ebd56e80-706e-4e28-b705-3e39397589b3', 38, '2025-04-10 08:00:23', '2025-04-10 08:00:23'),
(437, NULL, '28680d30-33e5-4fc7-92b1-362ed83e34e2', 44, '2025-04-11 21:05:33', '2025-04-11 21:05:33'),
(438, NULL, '77d86069-c9f5-4b1e-81bc-82cfdf35ca59', 39, '2025-04-12 02:12:57', '2025-04-12 02:12:57'),
(439, NULL, '09d2283d-9baf-4914-a7b6-d344bde1edef', 33, '2025-04-14 16:35:42', '2025-04-14 16:35:42'),
(440, NULL, '57422bdb-0da9-424a-bc9d-5101ffa7c57d', 34, '2025-04-14 18:28:47', '2025-04-14 18:28:47'),
(441, NULL, '8f6600bb-20ef-4d3b-a97e-b104407f75ca', 32, '2025-04-14 21:09:37', '2025-04-14 21:09:37'),
(442, NULL, 'd2e73418-c3cb-43c1-a5e8-370d8a6fa423', 44, '2025-04-14 21:57:40', '2025-04-14 21:57:40'),
(443, NULL, '1f594a83-4ce7-4522-904a-f19f832dea50', 36, '2025-04-14 23:13:57', '2025-04-14 23:13:57'),
(444, NULL, '755dd846-3a8d-41c8-8e33-87e56e576674', 41, '2025-04-15 00:36:11', '2025-04-15 00:36:11'),
(445, NULL, 'ce890c95-1e8a-463f-8f80-53e1da80df11', 47, '2025-04-15 04:52:47', '2025-04-15 04:52:47'),
(446, NULL, '91d6bc0b-8412-44b2-9d89-eb30382ade24', 35, '2025-04-15 07:41:15', '2025-04-15 07:41:15'),
(447, NULL, '33059f65-346b-4a77-b32a-fbd07337f70f', 30, '2025-04-15 10:38:46', '2025-04-15 10:38:46'),
(448, NULL, '01cbbbd2-c73e-4133-a697-b5ab5e095da6', 45, '2025-04-15 20:08:02', '2025-04-15 20:08:02'),
(449, NULL, '4da47516-fe5a-4b31-8e68-ae3e444e7aad', 38, '2025-04-15 23:21:03', '2025-04-15 23:21:03'),
(450, NULL, '4cf27481-37c9-43a8-a1a9-7cf69078e890', 46, '2025-04-16 00:06:06', '2025-04-16 00:06:06'),
(451, NULL, '543150c0-f631-4fd8-b3df-8b8f90fbab9d', 39, '2025-04-16 03:34:59', '2025-04-16 03:34:59'),
(452, NULL, 'c0d01ad6-96f9-4156-a4be-a5739da3cc2d', 42, '2025-04-16 06:14:05', '2025-04-16 06:14:05'),
(453, NULL, 'e2fc3c84-288a-4358-bdae-8a6451e9ff11', 44, '2025-04-17 11:21:45', '2025-04-17 11:21:45'),
(454, NULL, 'fd712c65-806b-4cd0-8198-10f8d0e5f060', 38, '2025-04-17 11:50:11', '2025-04-17 11:50:11'),
(455, NULL, '71589976-b7fc-4ed1-9916-deb794996705', 39, '2025-04-19 23:57:43', '2025-04-19 23:57:43'),
(456, NULL, '8bd56661-32c5-4ca6-b55f-e4f8603d1eae', 33, '2025-04-20 06:33:47', '2025-04-20 06:33:47'),
(457, NULL, '6e1e52f8-b43a-480d-b7de-e934e62e9ea1', 34, '2025-04-20 07:38:24', '2025-04-20 07:38:24'),
(458, NULL, '95d5d47d-795a-44de-86b4-6fdc0bea2f19', 32, '2025-04-20 08:57:02', '2025-04-20 08:57:02'),
(459, NULL, 'a2617bde-f8b1-4f02-b5dd-de34458d1bad', 44, '2025-04-20 10:26:28', '2025-04-20 10:26:28'),
(460, NULL, '9c89a023-de44-438f-8736-3cb4a57372d4', 41, '2025-04-20 12:29:11', '2025-04-20 12:29:11'),
(461, NULL, '141657c1-19c7-451a-ad8f-4889735e2542', 36, '2025-04-20 15:03:15', '2025-04-20 15:03:15'),
(462, NULL, '20e7c4ec-b69e-493f-9fed-6c7a5ac49348', 47, '2025-04-20 18:33:15', '2025-04-20 18:33:15'),
(463, NULL, 'ff11b05b-bb2d-4d46-81ad-c97fe348a618', 35, '2025-04-20 21:19:03', '2025-04-20 21:19:03'),
(464, NULL, '2c96688f-416e-4df5-8dbb-fbf80a1cb424', 30, '2025-04-21 04:02:59', '2025-04-21 04:02:59'),
(465, NULL, 'af4185c9-ca4d-4917-950a-5810ef2df32c', 45, '2025-04-21 07:15:40', '2025-04-21 07:15:40'),
(466, NULL, 'ddfb3cd0-32e3-419f-b68b-cc7342a10b06', 38, '2025-04-21 12:05:13', '2025-04-21 12:05:13'),
(467, NULL, '286aea6a-2adc-4901-9100-c0dd2511ac91', 46, '2025-04-21 14:30:19', '2025-04-21 14:30:19'),
(468, NULL, 'a46d979e-385d-4e87-835f-ca7470f2ca0b', 39, '2025-04-21 16:59:09', '2025-04-21 16:59:09'),
(469, NULL, '2a73a98e-42cb-41c0-a480-4a829fd1b442', 42, '2025-04-21 21:24:23', '2025-04-21 21:24:23'),
(470, NULL, '86e75f20-1428-48b3-8c30-f8a41729f12f', 44, '2025-04-23 18:58:50', '2025-04-23 18:58:50'),
(471, NULL, '2c548088-4772-4163-8823-35c98210003b', 38, '2025-04-24 08:16:20', '2025-04-24 08:16:20'),
(472, NULL, 'c441a1a5-8a4d-417b-95b7-7c835aeb218b', 34, '2025-04-25 03:12:44', '2025-04-25 03:12:44'),
(473, NULL, '5ef564c5-a00d-46b9-824f-cd84048a773e', 33, '2025-04-25 12:51:33', '2025-04-25 12:51:33'),
(474, NULL, '40624a04-eba0-43e4-a22c-559e221f7a70', 34, '2025-04-25 14:19:48', '2025-04-25 14:19:48'),
(475, NULL, '7f4b1259-ebba-47e4-955e-63825532505c', 32, '2025-04-25 16:42:41', '2025-04-25 16:42:41'),
(476, NULL, '8c82ed71-a81c-4017-9191-c90d731f4ef4', 44, '2025-04-25 18:44:13', '2025-04-25 18:44:13'),
(477, NULL, 'cf8afc2e-1644-4597-a1ec-f5687b4cc55e', 41, '2025-04-25 19:35:00', '2025-04-25 19:35:00'),
(478, NULL, '2f04adc7-7531-4cd3-8b8d-818ec32b6eba', 36, '2025-04-25 21:47:22', '2025-04-25 21:47:22'),
(479, NULL, '1d597256-3a35-41e8-b43b-e18c8fb248d6', 47, '2025-04-26 03:58:39', '2025-04-26 03:58:39'),
(480, NULL, 'c3f03d3c-c400-4f1e-9ccf-1723ebe02ec6', 39, '2025-04-26 11:35:20', '2025-04-26 11:35:20'),
(481, NULL, '14768e3c-3b48-4207-8e92-feccc2f9f2d1', 35, '2025-04-26 12:10:14', '2025-04-26 12:10:14'),
(482, NULL, '21cbcc8e-acef-41e9-8826-534b52ce360f', 39, '2025-04-26 15:53:01', '2025-04-26 15:53:01'),
(483, NULL, 'be41c702-bd7f-4d43-ac5d-86399a8c39cb', 30, '2025-04-26 20:54:41', '2025-04-26 20:54:41'),
(484, NULL, 'c225b55a-ac77-45ac-aa55-8254fb3d22dc', 45, '2025-04-27 00:06:29', '2025-04-27 00:06:29'),
(485, NULL, '8fe2c0f9-0aa3-4a2d-b3b0-57adee3e594b', 38, '2025-04-27 02:02:11', '2025-04-27 02:02:11'),
(486, NULL, 'c34704a7-0cc1-41f2-b0a9-4f627bc3c03a', 46, '2025-04-27 03:53:43', '2025-04-27 03:53:43'),
(487, NULL, '3d91b64b-17b2-4ef9-aa68-6f8f132464ef', 39, '2025-04-27 06:43:14', '2025-04-27 06:43:14'),
(488, NULL, 'cbad082a-08b3-4c31-a855-25c8abe2bbfc', 42, '2025-04-27 16:25:58', '2025-04-27 16:25:58'),
(489, NULL, '62c7a144-c967-4a94-842f-dead8c29d5b0', 32, '2025-04-28 05:48:20', '2025-04-28 05:48:20'),
(490, NULL, '91fe6ef6-3688-4633-ad8b-ec6bb08a5843', 38, '2025-04-28 08:52:34', '2025-04-28 08:52:34'),
(491, NULL, 'd48730a8-5983-457c-9e5d-9a3e5ae42b51', 38, '2025-04-28 22:18:56', '2025-04-28 22:18:56'),
(492, NULL, '01e35f8e-f160-4e08-8b58-30722bb5d35e', 32, '2025-04-30 06:14:51', '2025-04-30 06:14:51'),
(493, NULL, '3f49f0ec-b4ff-4179-be94-4c53ffe0230a', 44, '2025-04-30 08:56:23', '2025-04-30 08:56:23'),
(494, NULL, 'becbdcbe-c62c-4772-a9bd-5db1a5db1b84', 38, '2025-05-01 08:25:18', '2025-05-01 08:25:18'),
(495, NULL, '7cbb58e5-212a-4141-bb21-3f427e5f44a0', 33, '2025-05-01 13:47:58', '2025-05-01 13:47:58'),
(496, NULL, '21a56e28-aba8-4c85-a119-41de5f014191', 34, '2025-05-01 15:15:28', '2025-05-01 15:15:28'),
(497, NULL, '885aac91-0f8b-4e92-bdfe-234d393e132b', 32, '2025-05-01 15:51:54', '2025-05-01 15:51:54'),
(498, NULL, '43c2abed-988a-4bcf-b249-8dceef6d8ff1', 44, '2025-05-01 16:34:45', '2025-05-01 16:34:45'),
(499, NULL, '5273de4a-4c0e-478b-89e2-db638a533891', 41, '2025-05-01 17:46:22', '2025-05-01 17:46:22'),
(500, NULL, '31c0a12c-5273-4403-a238-f557b1b790cd', 36, '2025-05-01 18:46:35', '2025-05-01 18:46:35'),
(501, NULL, 'a159201e-8e67-4a13-8630-92ea4e52313f', 47, '2025-05-01 19:46:33', '2025-05-01 19:46:33'),
(502, NULL, 'c3886f0f-6faf-488d-96d8-a307fcce7fa7', 35, '2025-05-02 07:19:42', '2025-05-02 07:19:42'),
(503, NULL, 'ad64b5a8-155b-403b-9b8d-3ccc5f2b49c2', 30, '2025-05-02 12:51:59', '2025-05-02 12:51:59'),
(504, NULL, 'd750937b-9e75-4a99-be22-93d2fd455f65', 45, '2025-05-02 16:42:41', '2025-05-02 16:42:41'),
(505, NULL, 'fef1414b-82d8-47cc-acbd-88c8886cc628', 38, '2025-05-02 17:55:37', '2025-05-02 17:55:37'),
(506, NULL, '2be1417c-b9fe-4a41-a242-9966e861bcec', 46, '2025-05-02 19:05:18', '2025-05-02 19:05:18'),
(507, NULL, 'ca716b52-d1e3-4d48-854d-d98bdfce5499', 39, '2025-05-02 22:58:26', '2025-05-02 22:58:26'),
(508, NULL, 'd75c90aa-edd5-4834-af69-8177f7175d8b', 32, '2025-05-03 07:21:39', '2025-05-03 07:21:39'),
(509, NULL, '88404f1e-cd49-459a-9808-8ed7991e4a49', 42, '2025-05-03 22:05:16', '2025-05-03 22:05:16'),
(510, NULL, 'f74e444c-d875-411e-9ef6-52761ac8351d', 39, '2025-05-03 23:29:18', '2025-05-03 23:29:18'),
(511, NULL, 'cfc4f0c4-9c0a-4ea6-b20c-8830bcc18482', 44, '2025-05-06 11:08:25', '2025-05-06 11:08:25'),
(512, NULL, '80fef797-d6f4-4ec3-8db3-26775e243e36', 33, '2025-05-07 03:30:08', '2025-05-07 03:30:08'),
(513, NULL, '5603b23c-c1cd-4507-86ca-3a24a4f0a607', 34, '2025-05-07 07:46:15', '2025-05-07 07:46:15');
INSERT INTO `recently_viewed_products` (`id`, `user_id`, `guest_token`, `product_id`, `created_at`, `updated_at`) VALUES
(514, NULL, '78475745-1dd4-428d-97de-3c651f83d85a', 32, '2025-05-07 12:32:31', '2025-05-07 12:32:31'),
(515, NULL, 'c1dd913e-e292-43a9-8d0d-9f016cac1039', 44, '2025-05-07 13:22:26', '2025-05-07 13:22:26'),
(516, NULL, '78aa727e-2e9a-49a2-b265-02fc42d30d7c', 41, '2025-05-07 16:55:28', '2025-05-07 16:55:28'),
(517, NULL, '11228b6d-e776-491d-9e39-438492268602', 47, '2025-05-07 19:41:22', '2025-05-07 19:41:22'),
(518, NULL, 'ca7ee617-6705-4f0c-97bc-12dac4536d43', 36, '2025-05-07 20:40:25', '2025-05-07 20:40:25'),
(519, NULL, '1ba7c2ab-6b04-4cf8-a2a4-873602b72ea7', 38, '2025-05-08 01:11:30', '2025-05-08 01:11:30'),
(520, NULL, '025830ca-5271-4949-8775-5c04a13a0ce1', 35, '2025-05-08 03:15:08', '2025-05-08 03:15:08'),
(521, NULL, '9d5a7601-7003-4341-9958-bc3df8e4be6c', 30, '2025-05-08 12:28:45', '2025-05-08 12:28:45'),
(522, NULL, '431d36c1-2411-44c5-91f6-c056dd20658f', 45, '2025-05-08 16:11:54', '2025-05-08 16:11:54'),
(523, NULL, 'eab2a822-7403-463a-b13b-967e9c7a81cb', 38, '2025-05-08 19:45:59', '2025-05-08 19:45:59'),
(524, NULL, '57a4c00e-643a-4165-8144-9892ff7821d6', 46, '2025-05-08 21:35:43', '2025-05-08 21:35:43'),
(525, NULL, 'c0c8eea8-70e6-4532-a260-59fa329fcced', 39, '2025-05-08 23:41:13', '2025-05-08 23:41:13'),
(526, NULL, 'd2778041-cbf4-4f88-9a43-03b670d99049', 42, '2025-05-10 05:50:13', '2025-05-10 05:50:13'),
(527, NULL, '95a6c3c4-0c16-4478-930b-dd1abc6ec2d5', 39, '2025-05-11 07:17:32', '2025-05-11 07:17:32'),
(528, NULL, 'fe2e2d19-4625-4841-9a70-8bb2601a7791', 33, '2025-05-12 16:11:10', '2025-05-12 16:11:10'),
(529, NULL, '8ba51615-8201-46d4-a010-fb0d4fda1eb5', 34, '2025-05-12 19:24:08', '2025-05-12 19:24:08'),
(530, NULL, 'f3b77327-a8f2-4a25-aa32-2ea2e6bc96be', 44, '2025-05-12 21:55:48', '2025-05-12 21:55:48'),
(531, NULL, 'e3b275ba-b40c-4a9b-afdb-14e1239175c2', 32, '2025-05-13 11:43:29', '2025-05-13 11:43:29'),
(532, NULL, '37b5f8e1-8e76-4f6b-9300-323ff8e18c3c', 44, '2025-05-13 15:46:55', '2025-05-13 15:46:55'),
(533, NULL, 'eb91c3d9-a09b-43d0-b77e-49f13f641fbd', 41, '2025-05-13 18:20:47', '2025-05-13 18:20:47'),
(534, NULL, '6dd3cf5a-e9ee-4937-9474-6957d26f01a5', 47, '2025-05-13 20:06:11', '2025-05-13 20:06:11'),
(535, NULL, '2bd82763-2336-43b3-a00e-f062a0838998', 36, '2025-05-13 22:12:56', '2025-05-13 22:12:56'),
(536, NULL, '83739fa0-2f9e-4043-9902-73be338f8caa', 35, '2025-05-13 23:59:39', '2025-05-13 23:59:39'),
(537, NULL, '518470c5-6cfb-435a-9274-0e7718a38d33', 30, '2025-05-14 09:10:04', '2025-05-14 09:10:04'),
(538, NULL, 'f60a9ebf-090d-4e31-90cc-ee3c6ec19d7e', 45, '2025-05-14 16:37:29', '2025-05-14 16:37:29'),
(539, NULL, '5610e481-ff85-4c06-93ad-aba532968832', 39, '2025-05-14 20:58:51', '2025-05-14 20:58:51'),
(540, NULL, '285bea48-0c7b-4a3a-a54b-4c3c879c9041', 38, '2025-05-15 00:04:06', '2025-05-15 00:04:06'),
(541, NULL, '36f9f647-d613-4ebb-a036-46af82feb381', 38, '2025-05-15 05:44:26', '2025-05-15 05:44:26'),
(542, NULL, '4782006c-9a7f-4dfc-a314-223605822996', 46, '2025-05-15 06:53:11', '2025-05-15 06:53:11'),
(543, NULL, 'e2ea9450-f0d6-4c91-9c42-4e7ae0bdec28', 39, '2025-05-15 08:02:29', '2025-05-15 08:02:29'),
(544, NULL, 'd15f574c-b18f-4bf6-91c8-324accafe386', 42, '2025-05-16 06:37:09', '2025-05-16 06:37:09'),
(545, NULL, 'b2f5a8cd-6734-4c2f-9d87-37f9d06b5447', 39, '2025-05-18 08:19:38', '2025-05-18 08:19:38'),
(546, NULL, 'ac81e0c4-8a4d-4b48-a415-550cdc3d2634', 33, '2025-05-18 12:25:35', '2025-05-18 12:25:35'),
(547, NULL, 'c530c72a-02f7-49c7-9fee-62cefe7c0906', 34, '2025-05-18 14:51:57', '2025-05-18 14:51:57'),
(548, NULL, '581c34cd-9912-484f-8a2d-c6643e79d81a', 32, '2025-05-19 13:36:35', '2025-05-19 13:36:35'),
(549, NULL, '0f5b3cdf-9171-4367-ac51-12e57ab5e40c', 44, '2025-05-19 17:09:51', '2025-05-19 17:09:51'),
(550, NULL, '9f682b53-5ec0-4488-ae1b-6bde085280ce', 41, '2025-05-19 19:18:39', '2025-05-19 19:18:39'),
(551, NULL, '3a0e3436-0c51-4d1d-8f42-aa17130fb49e', 44, '2025-05-19 22:16:59', '2025-05-19 22:16:59'),
(552, NULL, '37de10d3-e3fd-4b20-8024-19344e5db285', 47, '2025-05-19 23:56:50', '2025-05-19 23:56:50'),
(553, NULL, 'cdb7e441-2a38-48cc-8f75-b9b437277da2', 36, '2025-05-20 01:29:03', '2025-05-20 01:29:03'),
(554, NULL, '1a5efbf1-3fee-4e54-8160-1a83cc88c632', 35, '2025-05-20 06:03:25', '2025-05-20 06:03:25'),
(555, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 45, '2025-05-20 14:16:11', '2025-05-20 14:22:32'),
(556, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 32, '2025-05-20 14:16:41', '2025-05-20 14:23:01'),
(557, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 47, '2025-05-20 14:17:48', '2025-05-20 14:23:07'),
(558, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 30, '2025-05-20 14:18:01', '2025-05-20 14:23:16'),
(559, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 46, '2025-05-20 14:18:09', '2025-05-20 14:22:46'),
(560, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 44, '2025-05-20 14:18:39', '2025-05-20 14:21:37'),
(561, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 39, '2025-05-20 14:19:03', '2025-05-20 14:22:51'),
(562, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 38, '2025-05-20 14:19:13', '2025-05-20 14:23:11'),
(563, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 35, '2025-05-20 14:19:21', '2025-05-20 14:22:56'),
(564, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 33, '2025-05-20 14:19:48', '2025-05-20 14:23:36'),
(565, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 42, '2025-05-20 14:20:10', '2025-05-20 14:23:45'),
(566, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 41, '2025-05-20 14:20:29', '2025-05-20 14:23:50'),
(567, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 34, '2025-05-20 14:20:38', '2025-05-20 14:23:31'),
(568, NULL, 'b40db2cc-cae4-4e0d-aa2f-7f01fd0ceaba', 36, '2025-05-20 14:20:47', '2025-05-20 14:23:55'),
(569, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 34, '2025-05-20 10:35:00', '2025-05-20 10:45:58'),
(570, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 45, '2025-05-20 10:35:34', '2025-05-20 10:45:10'),
(571, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 30, '2025-05-20 10:35:53', '2025-05-20 10:49:51'),
(572, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 41, '2025-05-20 10:36:03', '2025-05-20 10:40:31'),
(573, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 47, '2025-05-20 10:36:09', '2025-05-20 10:40:36'),
(574, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 32, '2025-05-20 10:36:53', '2025-05-20 10:45:52'),
(575, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 39, '2025-05-20 10:37:36', '2025-05-20 10:39:28'),
(576, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 46, '2025-05-20 10:37:53', '2025-05-20 10:43:30'),
(577, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 38, '2025-05-20 10:39:55', '2025-05-20 10:43:02'),
(578, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 44, '2025-05-20 10:41:37', '2025-05-20 10:53:28'),
(579, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 36, '2025-05-20 10:42:01', '2025-05-20 10:45:26'),
(580, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 35, '2025-05-20 10:42:27', '2025-05-20 10:44:45'),
(581, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 42, '2025-05-20 10:43:16', '2025-05-20 10:55:34'),
(582, NULL, 'b851a798-d3da-49ad-b818-59e18fd8f877', 33, '2025-05-20 10:49:32', '2025-05-20 10:53:02'),
(583, NULL, 'c01ca014-f255-4615-a873-f92d40579bed', 36, '2025-05-20 12:30:37', '2025-05-20 12:30:37'),
(584, NULL, '67033294-c70a-4e62-ade8-514d0e89d3d4', 30, '2025-05-20 16:41:18', '2025-05-20 16:41:18'),
(585, NULL, 'd5391629-6964-46b6-9019-93e1d584fa20', 45, '2025-05-20 17:53:08', '2025-05-20 17:53:08'),
(586, NULL, '3837b3f6-c4bc-47b7-b89a-dce55b8a3159', 38, '2025-05-20 19:33:18', '2025-05-20 19:33:18'),
(587, NULL, '71a3405d-eabd-4162-b01e-e9d148fd65e9', 32, '2025-05-20 21:58:44', '2025-05-20 21:58:44'),
(588, NULL, 'a5dd9439-a30d-4aa6-b967-f68f77f1ff98', 46, '2025-05-20 23:34:11', '2025-05-20 23:34:11'),
(589, NULL, 'c4408789-af7f-4cb0-9f9a-3722ce3de64c', 39, '2025-05-21 00:18:06', '2025-05-21 00:18:06'),
(590, NULL, '34e85dd6-5138-4daf-ab2b-d267fa247b4d', 38, '2025-05-21 01:02:18', '2025-05-21 01:02:18'),
(591, NULL, '00727b8e-bcf3-44db-ad8b-a2047d5f85da', 35, '2025-05-21 02:38:16', '2025-05-21 02:38:16'),
(592, NULL, 'b15d0448-9af6-417f-b727-fe749d7132e6', 33, '2025-05-21 02:54:45', '2025-05-21 02:54:45'),
(593, NULL, '4094e63d-90fa-405e-a335-b8a255e25769', 38, '2025-05-21 02:59:55', '2025-05-21 02:59:55'),
(594, NULL, 'f2129bee-50ab-488a-ac6f-d6ff9eb868ed', 44, '2025-05-21 03:11:49', '2025-05-21 03:11:49'),
(595, NULL, '57b80478-1c61-4f5f-8b6d-45f1eacaec10', 38, '2025-05-21 03:12:49', '2025-05-21 03:12:49'),
(596, NULL, 'c247c382-3423-4694-a07c-228e69b290b4', 46, '2025-05-21 03:59:17', '2025-05-21 03:59:17'),
(597, NULL, 'db3e1650-3d96-40d2-afc4-ff536b322186', 42, '2025-05-21 04:08:02', '2025-05-21 04:08:02'),
(598, NULL, '3d4e5a8e-425e-4caa-8769-e0acac7cf33c', 41, '2025-05-21 04:30:01', '2025-05-21 04:30:01'),
(599, NULL, '665ee357-c263-43e8-a258-2366e03244f2', 39, '2025-05-21 04:35:01', '2025-05-21 04:35:01'),
(600, NULL, 'd34fe2c6-c800-4375-8cfb-49741f9fc61d', 47, '2025-05-21 04:45:59', '2025-05-21 04:45:59'),
(601, NULL, 'bdf3600e-258d-4cb6-ae56-ceff0890fb01', 30, '2025-05-21 05:05:08', '2025-05-21 05:05:08'),
(602, NULL, '0146d0a7-6e30-483d-a275-d36ea71de748', 39, '2025-05-21 05:26:40', '2025-05-21 05:26:40'),
(603, NULL, '19cd3b94-b9d0-47f8-9ae3-148464228ea2', 44, '2025-05-21 05:41:00', '2025-05-21 05:41:00'),
(604, NULL, 'f5f4c08c-2a1f-4ed8-9370-016bc2b9a612', 32, '2025-05-21 08:20:30', '2025-05-21 08:20:30'),
(605, NULL, '138fe353-6a1a-41df-a7af-c25e9aa49558', 39, '2025-05-21 23:38:07', '2025-05-21 23:38:07'),
(606, NULL, '3d6e6b17-fb24-46e9-ad12-2c07527823f3', 42, '2025-05-23 10:22:34', '2025-05-23 10:22:34'),
(607, NULL, '5daddf66-a080-46e1-b8ab-5215e835f956', 33, '2025-05-26 01:17:03', '2025-05-26 01:17:03'),
(608, NULL, '66c685d5-aefa-4b62-846c-bc4beb3d8c2b', 34, '2025-05-26 04:15:21', '2025-05-26 04:15:21'),
(609, NULL, 'b6a22d8e-99ff-48f7-840d-b927d9c6bdea', 35, '2025-05-26 04:50:24', '2025-05-26 04:50:24'),
(610, NULL, '70d644f3-2e7e-44e0-8311-92af0f07b9cf', 32, '2025-05-26 10:07:17', '2025-05-26 10:07:17'),
(611, NULL, '8e4d35fb-d137-4887-ad88-ad0c9cc05b25', 44, '2025-05-26 18:24:38', '2025-05-26 18:24:38'),
(612, NULL, '285ea23c-bec5-4e0f-a1e3-0d6eeb28a837', 39, '2025-05-26 20:53:49', '2025-05-26 20:53:49'),
(613, NULL, 'e5af9ac1-9cc4-48d6-9e2e-937e41ba0db6', 41, '2025-05-26 23:01:04', '2025-05-26 23:01:04'),
(614, NULL, '8e7d8cea-a30b-4dd5-9d77-7830a07cd874', 47, '2025-05-27 04:41:11', '2025-05-27 04:41:11'),
(615, NULL, '5671cac0-4a75-43cf-b31b-457035b9ecdd', 36, '2025-05-27 05:49:53', '2025-05-27 05:49:53'),
(616, NULL, '4a82d1c2-ee08-446a-8d85-f7ecc073643c', 35, '2025-05-27 06:58:28', '2025-05-27 06:58:28'),
(617, NULL, 'ac8a6f62-f3ac-4033-8bae-9fe555957f18', 30, '2025-05-27 09:17:17', '2025-05-27 09:17:17'),
(618, NULL, '92840586-3dab-4800-9e62-82cbfc01e3bf', 44, '2025-05-27 11:52:28', '2025-05-27 11:52:28'),
(619, NULL, '950b1b7c-3f7d-4493-ace9-00dad2f8546d', 35, '2025-05-27 16:20:19', '2025-05-27 16:20:19'),
(620, NULL, '4fb674d8-c3c1-4ff2-99f0-c52ae1f40829', 36, '2025-05-27 19:28:23', '2025-05-27 19:28:23'),
(621, NULL, '77917187-2b24-4d80-80fd-496155adcf00', 45, '2025-05-27 19:38:53', '2025-05-27 19:38:53'),
(622, NULL, '01ad0206-5938-4153-96ea-8eb015e5ae5b', 38, '2025-05-27 21:43:11', '2025-05-27 21:43:11'),
(623, NULL, '88eab98b-19d6-4214-8a76-f7b36d76a684', 46, '2025-05-28 03:04:17', '2025-05-28 03:04:17'),
(624, NULL, '3f5d4721-2586-4fa0-aa5a-c2fad76b94c8', 39, '2025-05-28 04:45:00', '2025-05-28 04:45:00'),
(625, NULL, '13213196-8c5b-407b-b127-7a905c2b1b62', 38, '2025-05-28 22:24:52', '2025-05-28 22:24:52'),
(626, NULL, 'fa8b2463-51c3-4c3b-b1a8-ffe755c9a79c', 41, '2025-05-29 07:16:51', '2025-05-29 07:16:51'),
(627, NULL, '95ba0566-7774-4e93-9b48-746fe32f0c92', 42, '2025-05-30 03:47:34', '2025-05-30 03:47:34'),
(628, NULL, 'e5ed502d-6104-4218-94fb-8b7367a1ad8d', 34, '2025-05-30 08:31:35', '2025-05-30 08:31:35'),
(629, NULL, '87cce539-f05e-4f59-9ea3-394dd29e66e3', 33, '2025-05-31 17:56:30', '2025-05-31 17:56:30'),
(630, NULL, '10d07430-e94e-43da-8a90-beea7ebb57fb', 34, '2025-05-31 20:26:24', '2025-05-31 20:26:24'),
(631, NULL, '83622a99-6132-4f64-89c2-6f510d20e5cd', 32, '2025-06-01 07:45:59', '2025-06-01 07:45:59'),
(632, NULL, '08c4c94b-c33b-4ef4-b479-952e200cfd14', 44, '2025-06-01 10:25:41', '2025-06-01 10:25:41'),
(633, NULL, '50f89570-636d-4be2-9ddc-ad7db3237bfd', 41, '2025-06-01 11:43:35', '2025-06-01 11:43:35'),
(634, NULL, '46205ab8-6e9b-4e79-b983-52db33add918', 47, '2025-06-01 17:10:50', '2025-06-01 17:10:50'),
(635, NULL, 'e7ea0c98-b82b-4cf4-8bb3-a63b388556f6', 36, '2025-06-01 18:19:58', '2025-06-01 18:19:58'),
(636, NULL, '0b726244-2205-47df-a0b2-c97c3bc9b4da', 35, '2025-06-01 19:24:04', '2025-06-01 19:24:04'),
(637, NULL, '1a8b8272-a35a-49d5-9d15-132decc84feb', 30, '2025-06-01 20:27:56', '2025-06-01 20:27:56'),
(638, NULL, '17ab2288-e64a-499e-bac7-f02ab3284e52', 33, '2025-06-01 23:49:35', '2025-06-01 23:49:35'),
(639, NULL, 'af09fa92-7bf2-4476-9756-8d35ffd25b46', 39, '2025-06-02 02:18:19', '2025-06-02 02:18:19'),
(640, NULL, 'b558a795-27d8-4b9c-badd-bad60e163926', 45, '2025-06-02 05:47:28', '2025-06-02 05:47:28'),
(641, NULL, '0a549cfd-8bea-436d-9f1b-ac48e593b3e4', 38, '2025-06-02 06:24:28', '2025-06-02 06:24:28'),
(642, NULL, '20ff4216-aac7-42b6-99ab-750b66c02884', 46, '2025-06-02 10:10:54', '2025-06-02 10:10:54'),
(643, NULL, '748621ab-0082-4f4b-8b8b-22472955ff83', 39, '2025-06-02 11:03:46', '2025-06-02 11:03:46'),
(644, NULL, 'b493195a-5fe5-434e-8747-5fbe237eb5f7', 32, '2025-06-02 21:32:34', '2025-06-02 21:32:34'),
(645, NULL, '52203648-8f46-4495-85d8-8af54926aea1', 36, '2025-06-03 01:09:16', '2025-06-03 01:09:16'),
(646, NULL, '4bc001db-2df7-4e97-8694-8b099b808346', 42, '2025-06-03 04:14:45', '2025-06-03 04:14:45'),
(647, NULL, '24a584d1-5050-4351-8f24-b9a2f590fcbd', 30, '2025-06-03 06:10:47', '2025-06-03 06:10:47'),
(648, NULL, '8251ef39-54d4-4ebd-9e23-126604a8c5cf', 38, '2025-06-03 18:45:50', '2025-06-03 18:45:50'),
(649, NULL, '8074abaf-2cec-423a-ad33-afa1a2a0c234', 42, '2025-06-04 15:20:59', '2025-06-04 15:20:59'),
(650, NULL, 'd36fa8df-1d6e-497a-9754-26b292c4c3f7', 33, '2025-06-05 23:01:29', '2025-06-05 23:01:29'),
(651, NULL, 'e48b0cc7-9932-46ce-8db5-e777de6a72b9', 34, '2025-06-06 04:32:12', '2025-06-06 04:32:12'),
(652, NULL, '908c07e3-bb55-4e6e-b6b4-4805b4107384', 32, '2025-06-06 19:55:43', '2025-06-06 19:55:43'),
(653, NULL, '0cd7934b-376d-4cd6-84d9-198eba295cb0', 44, '2025-06-06 20:15:33', '2025-06-06 20:15:33'),
(654, NULL, 'ea2850cc-1070-45f9-a16d-873d4a77b1e7', 41, '2025-06-06 20:34:25', '2025-06-06 20:34:25'),
(655, NULL, '14a4e47e-a677-4639-981d-ce66d20c6e00', 47, '2025-06-06 22:11:02', '2025-06-06 22:11:02'),
(656, NULL, '0f933242-9d9e-4ced-817a-72ae306896e2', 36, '2025-06-06 22:44:28', '2025-06-06 22:44:28'),
(657, NULL, 'a34d75ff-8c6a-4539-8c79-ae9a6f07e4fc', 35, '2025-06-06 23:04:08', '2025-06-06 23:04:08'),
(658, NULL, '53a3232a-5ae3-4142-947a-7cc01c44edb2', 30, '2025-06-07 06:15:59', '2025-06-07 06:15:59'),
(659, NULL, 'fc2e63ed-8f01-4354-b492-038d547c7f17', 38, '2025-06-07 13:01:44', '2025-06-07 13:01:44'),
(660, NULL, '3aacf4a7-f7ed-4c8b-ae78-ee3cc0924432', 45, '2025-06-07 13:30:12', '2025-06-07 13:30:12'),
(661, NULL, 'dc96cb8c-c754-4029-a2ba-2f3f2691bc80', 46, '2025-06-07 18:32:49', '2025-06-07 18:32:49'),
(662, NULL, '8322dc5c-e82e-4d21-8bca-6b18a7f57d88', 39, '2025-06-07 18:58:14', '2025-06-07 18:58:14'),
(663, NULL, 'd6a85b2a-fcad-4abc-8389-f984af317e77', 36, '2025-06-09 02:05:04', '2025-06-09 02:05:04'),
(664, NULL, '74201bc1-1eb7-4474-9cb1-49959aabdba0', 32, '2025-06-09 02:38:15', '2025-06-09 02:38:15'),
(665, NULL, '61eb8c36-3b35-41f7-8848-222f6fbd7413', 39, '2025-06-09 21:03:32', '2025-06-09 21:03:32'),
(666, NULL, 'd5ead366-7c1f-4084-99f3-4e2c2e49a9c4', 38, '2025-06-10 06:35:00', '2025-06-10 06:35:00'),
(667, NULL, '9b23a01b-a731-4e33-98b9-d65f2559730f', 42, '2025-06-10 07:06:00', '2025-06-10 07:06:00'),
(668, NULL, '7a228224-7a0b-4504-8394-5817b6237475', 33, '2025-06-11 04:05:00', '2025-06-11 04:05:00'),
(669, NULL, '683d6920-25e3-4790-9081-46a949053410', 34, '2025-06-11 18:08:52', '2025-06-11 18:08:52'),
(670, NULL, 'c0de780c-5749-4fec-85bb-10ff309af850', 44, '2025-06-12 03:35:29', '2025-06-12 03:35:29'),
(671, NULL, '09942020-901f-4863-9fc2-aaf060ae56a2', 41, '2025-06-12 03:53:04', '2025-06-12 03:53:04'),
(672, NULL, 'dbcafb39-a86f-454d-895d-05476c0d7b56', 32, '2025-06-12 04:09:25', '2025-06-12 04:09:25'),
(673, NULL, 'ba85264b-6efa-4116-bf6c-7058d8653e41', 47, '2025-06-12 04:40:51', '2025-06-12 04:40:51'),
(674, NULL, '9b4a40e0-c34b-4604-ba63-c3a4e46f2252', 36, '2025-06-12 05:22:45', '2025-06-12 05:22:45'),
(675, NULL, 'fbf83546-d1dd-4733-99b9-f2f81c1d3253', 35, '2025-06-12 05:34:28', '2025-06-12 05:34:28'),
(676, NULL, 'f8b8ab9d-6a6e-4688-84f2-3ef66a24ca49', 30, '2025-06-12 23:55:55', '2025-06-12 23:55:55'),
(677, NULL, '564d6b91-0d0b-457c-a398-6f5711b53414', 38, '2025-06-13 00:30:06', '2025-06-13 00:30:06'),
(678, NULL, 'd14ed5af-f440-45c9-baa8-1c6239b7f8cb', 45, '2025-06-13 01:00:56', '2025-06-13 01:00:56'),
(679, NULL, '60343149-b460-4435-b5a6-03e402fe1dc7', 39, '2025-06-13 01:33:51', '2025-06-13 01:33:51'),
(680, NULL, '7a6df15a-5cab-47b3-9182-3f6e734bce1c', 46, '2025-06-13 02:02:12', '2025-06-13 02:02:12'),
(681, NULL, '9579a25d-4ef5-451d-985f-1d5082a09c3e', 32, '2025-06-15 06:48:03', '2025-06-15 06:48:03'),
(682, NULL, '34a1a020-b704-404a-9b45-0295cd988327', 36, '2025-06-17 02:29:32', '2025-06-17 02:29:32'),
(683, NULL, '21d8c569-b68e-4341-9f2c-002e9d18d524', 32, '2025-06-17 09:57:59', '2025-06-17 09:57:59'),
(684, NULL, '95b36291-a271-465c-8e0a-e19080d24b76', 32, '2025-06-17 10:00:04', '2025-06-17 10:00:04'),
(685, NULL, 'f4bcfa00-1cf7-4319-a23d-d9915304c6bd', 42, '2025-06-17 16:53:53', '2025-06-17 16:53:53'),
(686, NULL, '72981fcf-70a2-4e70-a4b7-c68d71fbcfd3', 42, '2025-06-18 03:23:32', '2025-06-18 03:23:32'),
(687, NULL, 'bd2da342-d5a9-43f5-9c3c-4fb2a6770b88', 32, '2025-06-18 11:13:59', '2025-06-18 11:13:59'),
(688, NULL, 'f2aa3c1d-efee-4903-877f-79f006fe8f10', 42, '2025-06-18 11:41:54', '2025-06-18 11:41:54'),
(689, NULL, '29541fb8-19f9-4ac9-8bc3-ec2093405a84', 42, '2025-06-18 19:18:37', '2025-06-18 19:18:37'),
(690, NULL, '1eda25ca-1111-4c07-9d68-a5b605c12dec', 32, '2025-06-19 03:30:16', '2025-06-19 03:30:15'),
(691, NULL, 'cab639c6-4270-4bd7-acb8-3d13ca277183', 33, '2025-06-19 20:29:58', '2025-06-19 20:29:58'),
(692, NULL, '7ecabf90-64f3-49ff-9efe-032fcad5a898', 32, '2025-06-20 00:14:48', '2025-06-20 00:14:48'),
(693, NULL, '73f8ff41-d0db-4edd-9926-67f7ddaf42bc', 42, '2025-06-20 06:23:26', '2025-06-20 06:23:26'),
(694, NULL, '1ea7705c-f3d8-4f5e-aa9d-00585a138b15', 44, '2025-06-20 09:26:13', '2025-06-20 09:26:13'),
(695, NULL, '6194eb97-d644-4144-a87b-6dfa28ba4f93', 42, '2025-06-20 12:23:18', '2025-06-20 12:23:18'),
(696, NULL, '40dbb546-0c06-473f-9611-c51135529544', 42, '2025-06-20 16:19:40', '2025-06-20 16:19:40'),
(697, NULL, 'de9ea096-0bc0-40c8-9ec4-1ca838d22744', 32, '2025-06-20 16:44:05', '2025-06-20 16:44:05'),
(698, NULL, '5976d122-5c22-4ebc-9772-5306568656ec', 32, '2025-06-20 16:59:45', '2025-06-20 16:59:45'),
(699, NULL, '65ed0859-82fe-47ae-83bf-93fd7515039b', 32, '2025-06-20 20:08:09', '2025-06-20 20:08:09'),
(700, NULL, 'ef73f371-efc0-4e9d-b47a-ec61d6c130da', 42, '2025-06-21 04:48:19', '2025-06-21 04:48:19'),
(701, NULL, 'ae84d4dd-c671-422d-a741-6bd357366a16', 32, '2025-06-21 08:10:48', '2025-06-21 08:10:48'),
(702, NULL, 'bdc34e40-5123-4080-b376-7fb47d86502d', 42, '2025-06-21 08:21:59', '2025-06-21 08:21:59'),
(703, NULL, '2000d78c-ec0d-4239-8eca-ba812aae858d', 42, '2025-06-21 11:29:56', '2025-06-21 11:29:56'),
(704, NULL, '6de514e4-2ede-43d4-9d81-455b7bfc379c', 32, '2025-06-21 15:02:57', '2025-06-21 15:02:57'),
(705, NULL, '838f3659-e89d-4fc5-a29d-689733395180', 32, '2025-06-21 15:04:10', '2025-06-21 15:04:10'),
(706, NULL, '8740739f-d2e1-4d54-8917-48a8b3dfb460', 32, '2025-06-21 15:06:10', '2025-06-21 15:06:10'),
(707, NULL, 'f8e36342-2de1-4b57-8937-1d4e153ede8f', 42, '2025-06-21 15:22:43', '2025-06-21 15:22:43'),
(708, NULL, '70282605-8f03-40ad-9b42-05b09ee17bb5', 42, '2025-06-21 19:44:06', '2025-06-21 19:44:06'),
(709, NULL, '7e7ab466-bfc9-4a81-b983-94ba7fda835d', 42, '2025-06-21 23:26:45', '2025-06-21 23:26:45'),
(710, NULL, '38062b0a-c6ba-4146-974e-15e4ddef3291', 32, '2025-06-22 00:12:17', '2025-06-22 00:12:17'),
(711, NULL, 'd058ad8c-cedd-4e86-b4af-98cf2750eb99', 42, '2025-06-22 02:06:53', '2025-06-22 02:06:53'),
(712, NULL, 'c050ae6c-e5e1-4300-963d-57ce43127cc6', 32, '2025-06-22 12:14:36', '2025-06-22 12:14:36'),
(713, NULL, '1b69eb37-f8e7-42b9-bf2b-5ae3e3e3e198', 32, '2025-06-22 20:59:52', '2025-06-22 20:59:52'),
(714, NULL, '71782493-bd3d-473c-8dc8-10c18bd42de3', 33, '2025-06-23 04:37:20', '2025-06-23 04:37:20'),
(715, NULL, 'ebb41f00-8261-4e0e-a47d-eb2d4802ded2', 32, '2025-06-23 04:58:48', '2025-06-23 04:58:48'),
(716, NULL, '8d6d8b13-4bf6-4a19-a09b-15389f55ef31', 32, '2025-06-23 12:47:59', '2025-06-23 12:47:59'),
(717, NULL, '5e8437cb-1fa5-416c-96bb-f45cd53931c2', 33, '2025-06-23 15:04:01', '2025-06-23 15:04:01'),
(718, NULL, 'd2f1b9ad-ee33-4b7c-b347-d4e099c4aefc', 33, '2025-06-23 21:19:45', '2025-06-23 21:19:45'),
(719, NULL, '95b22c8a-d755-43f2-b15c-59d3bdfc1ddf', 32, '2025-06-23 21:25:04', '2025-06-23 21:25:04'),
(720, NULL, '5e745688-3b0a-42b5-948f-4b8fbe48c6a4', 34, '2025-06-23 21:45:27', '2025-06-23 21:45:27'),
(721, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 34, '2025-06-24 04:04:11', '2025-06-24 04:10:57'),
(722, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 47, '2025-06-24 04:06:11', '2025-06-24 04:14:44'),
(723, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 41, '2025-06-24 04:06:37', '2025-06-24 04:10:47'),
(724, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 45, '2025-06-24 04:07:02', '2025-06-24 04:10:25'),
(725, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 44, '2025-06-24 04:07:23', '2025-06-24 04:16:44'),
(726, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 38, '2025-06-24 04:08:13', '2025-06-24 04:18:20'),
(727, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 36, '2025-06-24 04:10:14', '2025-06-24 04:12:13'),
(728, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 39, '2025-06-24 04:11:16', '2025-06-24 04:16:29'),
(729, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 35, '2025-06-24 04:14:17', '2025-06-24 04:17:33'),
(730, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 42, '2025-06-24 04:14:34', '2025-06-24 04:16:13'),
(731, NULL, 'f7b1b209-deb1-404c-937d-63ea97b3f481', 32, '2025-06-24 08:14:35', '2025-06-24 08:14:35'),
(732, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 46, '2025-06-24 04:16:05', '2025-06-24 04:17:47'),
(733, NULL, '729a7cb0-d5a5-495f-99b7-a75b4d65b9f7', 30, '2025-06-24 04:18:07', '2025-06-24 04:18:07'),
(734, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 45, '2025-06-24 08:21:32', '2025-06-24 08:21:32'),
(735, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 30, '2025-06-24 08:23:35', '2025-06-24 08:23:35'),
(736, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 35, '2025-06-24 08:26:32', '2025-06-24 08:26:32'),
(737, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 33, '2025-06-24 08:28:34', '2025-06-24 08:28:34'),
(738, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 47, '2025-06-24 08:31:23', '2025-06-24 08:31:23'),
(739, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 46, '2025-06-24 08:33:32', '2025-06-24 08:33:32'),
(740, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 39, '2025-06-24 08:34:23', '2025-06-24 08:34:23'),
(741, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 38, '2025-06-24 08:35:51', '2025-06-24 08:35:51'),
(742, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 44, '2025-06-24 08:37:36', '2025-06-24 08:37:36'),
(743, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 41, '2025-06-24 08:38:21', '2025-06-24 08:38:21'),
(744, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 42, '2025-06-24 08:39:53', '2025-06-24 08:39:53'),
(745, NULL, '58c307ab-b66a-48ae-bc5d-6f3a9b3f4aae', 36, '2025-06-24 08:42:41', '2025-06-24 08:42:41'),
(746, NULL, '39db5307-e64d-405b-a269-d48d0c270e20', 44, '2025-06-24 08:50:24', '2025-06-24 08:50:24'),
(747, NULL, '15e9593b-5bd2-495b-8579-15ef93063187', 38, '2025-06-24 09:09:34', '2025-06-24 09:09:34'),
(748, NULL, '15e9593b-5bd2-495b-8579-15ef93063187', 42, '2025-06-24 09:13:10', '2025-06-24 09:18:01'),
(749, NULL, '15e9593b-5bd2-495b-8579-15ef93063187', 39, '2025-06-24 09:16:07', '2025-06-24 09:16:07'),
(750, NULL, '00aea340-1cdf-4c09-bcf0-1c3a7b8d2a1b', 32, '2025-06-24 05:28:12', '2025-06-24 05:28:12'),
(751, NULL, 'aa26d995-ffc2-4bb9-a735-85f0abacb38f', 32, '2025-06-24 08:51:37', '2025-06-24 08:51:37'),
(752, NULL, '6c16bbf7-2aae-446a-b7e0-093a26f4aff9', 34, '2025-06-24 09:02:03', '2025-06-24 09:02:03'),
(753, NULL, 'daaeea5e-f24c-4eab-8b13-d1a9190cad4a', 38, '2025-06-24 09:26:21', '2025-06-24 09:26:21'),
(754, NULL, '5c65f55d-fc45-45c6-93e2-d2d0a8bbb336', 47, '2025-06-24 09:53:43', '2025-06-24 09:53:43'),
(755, NULL, '0f380941-266c-4fe4-8d57-2117f03127d0', 34, '2025-06-24 13:35:45', '2025-06-24 13:35:45'),
(756, NULL, '2188e076-73b4-45e7-bf30-dc82540644b1', 38, '2025-06-24 13:53:05', '2025-06-24 13:53:04'),
(757, NULL, '9a438bd1-7c1f-436b-80f9-d380e6463375', 34, '2025-06-24 17:56:17', '2025-06-24 17:56:17'),
(758, NULL, 'fca5d1d0-e194-4cef-84a7-f83f26ce76f2', 32, '2025-06-24 18:03:05', '2025-06-24 18:03:05'),
(759, NULL, '3120c70f-8020-4f4c-a6e3-437eba8c49d5', 47, '2025-06-24 18:12:05', '2025-06-24 18:12:05'),
(760, NULL, '1ca32aa4-2578-4422-831c-a2107bc9d159', 32, '2025-06-24 18:30:51', '2025-06-24 18:30:51'),
(761, NULL, 'f361b049-f3ba-4970-968d-c932b17153cf', 32, '2025-06-24 19:07:24', '2025-06-24 19:07:24'),
(762, NULL, '40bfdee4-b53a-40e0-aa59-39853df73ab7', 34, '2025-06-24 22:06:34', '2025-06-24 22:06:34'),
(763, NULL, '76c0103b-537d-4435-8305-e7844a4f3dd2', 34, '2025-06-25 01:46:27', '2025-06-25 01:46:27'),
(764, NULL, 'df9c6013-b6ae-40ed-ad16-e8864d3f1daf', 47, '2025-06-25 02:03:19', '2025-06-25 02:03:19'),
(765, NULL, '03e00a6f-61a1-460c-a634-44de267cc854', 32, '2025-06-25 04:26:05', '2025-06-25 04:26:05'),
(766, NULL, '4c88a917-3c51-472a-83a6-ed825ed25d33', 34, '2025-06-25 08:33:58', '2025-06-25 08:33:58'),
(767, NULL, '5878c363-04fb-46fa-8052-443f7be2ad84', 32, '2025-06-25 08:55:45', '2025-06-25 08:55:45'),
(768, NULL, '59655bbb-2a9e-421d-9653-40d7b81c32b9', 32, '2025-06-25 08:59:20', '2025-06-25 08:59:20'),
(769, NULL, '4aa6041d-a375-452a-9510-9e07110650d2', 47, '2025-06-25 09:15:57', '2025-06-25 09:15:57'),
(770, NULL, '3428f8ba-0255-43ff-8270-26759a8ff4d6', 36, '2025-06-25 11:39:23', '2025-06-25 11:39:23'),
(771, NULL, '7e39543e-ac54-4e8e-83a3-c6df961ac48e', 34, '2025-06-25 13:27:50', '2025-06-25 13:27:50'),
(772, NULL, 'bbe66568-d240-4834-9883-fa97696a3fc9', 32, '2025-06-25 13:55:31', '2025-06-25 13:55:31'),
(773, NULL, '07fa8951-b930-48bc-ad31-059decba8b33', 32, '2025-06-25 15:19:13', '2025-06-25 15:19:13'),
(774, NULL, '52b782a8-ae80-4282-bca7-1497dfb972f2', 32, '2025-06-25 16:07:35', '2025-06-25 16:07:35'),
(775, NULL, '04ffadff-c2be-4449-897e-3cf56e1fbfa3', 47, '2025-06-25 16:09:41', '2025-06-25 16:09:41'),
(776, NULL, '329e5af4-515c-4a0d-919f-3f8fa79e2e6e', 32, '2025-06-25 16:17:28', '2025-06-25 16:17:28'),
(777, NULL, 'bc12944c-79eb-4131-abae-cbf0b967d82d', 32, '2025-06-25 22:04:52', '2025-06-25 22:04:52'),
(778, NULL, '1c7759ac-9d68-4e8f-85ac-b4e522c1d2cb', 32, '2025-06-25 22:59:16', '2025-06-25 22:59:16'),
(779, NULL, '0886d5ab-984c-4da3-a62a-9a537e4d8204', 34, '2025-06-26 01:42:15', '2025-06-26 01:42:15'),
(780, NULL, '97397c5a-e861-4562-bc14-663a7ff72746', 32, '2025-06-26 02:01:05', '2025-06-26 02:01:05'),
(781, NULL, '1a128ae1-def1-481b-930e-9c89efa79730', 35, '2025-06-26 02:22:15', '2025-06-26 02:22:15'),
(782, NULL, '2ef2156b-4009-4b0e-b049-e09219f8c8d7', 44, '2025-06-26 02:42:23', '2025-06-26 02:42:23'),
(783, NULL, '1fba37d9-5e8e-4593-b878-88c80354eeba', 32, '2025-06-26 02:51:15', '2025-06-26 02:51:15'),
(784, NULL, '2535e720-c93b-4ac3-9c87-ddb639d27f0e', 32, '2025-06-26 03:27:23', '2025-06-26 03:27:23'),
(785, NULL, '4306c771-d349-4c51-aa74-88581a439abb', 34, '2025-06-26 03:52:08', '2025-06-26 03:52:08'),
(786, NULL, '2735b3a7-4527-48de-a0b6-1462bfd535f3', 32, '2025-06-26 04:18:07', '2025-06-26 04:18:07'),
(787, NULL, '5eec5d23-a9ed-465b-be4d-8063b93b6984', 47, '2025-06-26 04:39:47', '2025-06-26 04:39:47'),
(788, NULL, '782c6908-7120-4814-8af5-a846f2710596', 36, '2025-06-26 04:58:55', '2025-06-26 04:58:55'),
(789, NULL, 'bf7d1a44-d054-46df-9b58-e30671080ed4', 34, '2025-06-26 06:01:04', '2025-06-26 06:01:04'),
(790, NULL, '6c9be948-5559-4cb6-bda6-9034df56defb', 32, '2025-06-26 06:20:57', '2025-06-26 06:20:57'),
(791, NULL, 'c511444e-00ed-4bc4-a246-8d39b3df46e2', 44, '2025-06-26 06:42:32', '2025-06-26 06:42:32'),
(792, NULL, 'f5ee5117-c207-46c7-9d2d-2e71b505ae6c', 35, '2025-06-26 07:01:12', '2025-06-26 07:01:12'),
(793, NULL, '75b8566e-08a7-4b84-9dce-d3aafe1741b0', 41, '2025-06-26 07:21:45', '2025-06-26 07:21:45'),
(794, NULL, '5a143eba-e588-4bfd-8455-d67913eb3ccb', 32, '2025-06-26 08:18:47', '2025-06-26 08:18:47'),
(795, NULL, '88991609-32f2-495d-844b-fed82a42811a', 34, '2025-06-26 08:27:13', '2025-06-26 08:27:13'),
(796, NULL, '21729347-8f0f-499e-91a7-8098c0556f9c', 32, '2025-06-26 08:52:41', '2025-06-26 08:52:41'),
(797, NULL, 'db452206-ef45-440c-866b-701ccab2c04f', 47, '2025-06-26 09:14:25', '2025-06-26 09:14:25'),
(798, NULL, '381c47c1-2e61-4628-b923-3a12f5467396', 32, '2025-06-26 09:54:10', '2025-06-26 09:54:10'),
(799, NULL, 'bf9d24ee-798e-4d88-afa4-88d810c7fa94', 32, '2025-06-26 09:59:39', '2025-06-26 09:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `rent_orders`
--

CREATE TABLE `rent_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(20) UNSIGNED DEFAULT NULL,
  `product_id` int(20) DEFAULT NULL,
  `product_stock_id` int(20) DEFAULT NULL,
  `variation` longtext DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `shipping_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`shipping_address`)),
  `billing_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`billing_address`)),
  `delivery_status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_type` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'un_paid',
  `no_of_days` int(11) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `deposit` decimal(10,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_notes` text DEFAULT NULL,
  `tracking_code` varchar(255) DEFAULT NULL,
  `cancel_request` tinyint(1) DEFAULT 0 COMMENT '	0 - not requested, 1 - requested	',
  `cancel_request_date` datetime DEFAULT NULL,
  `cancel_reason` varchar(255) DEFAULT NULL,
  `cancel_approval` tinyint(1) DEFAULT 0 COMMENT '	0 - Pending, 1 - Approved',
  `cancel_approval_date` datetime DEFAULT NULL,
  `shipping_type` varchar(255) NOT NULL DEFAULT 'free_shipping',
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `offer_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `delivery_viewed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rent_orders`
--

INSERT INTO `rent_orders` (`id`, `user_id`, `product_id`, `product_stock_id`, `variation`, `sku`, `quantity`, `shipping_address`, `billing_address`, `delivery_status`, `payment_type`, `payment_status`, `no_of_days`, `sub_total`, `deposit`, `grand_total`, `tax`, `start_date`, `end_date`, `order_code`, `order_date`, `order_notes`, `tracking_code`, `cancel_request`, `cancel_request_date`, `cancel_reason`, `cancel_approval`, `cancel_approval_date`, `shipping_type`, `shipping_cost`, `offer_discount`, `coupon_discount`, `delivery_viewed`, `created_at`, `updated_at`) VALUES
(66, 56, 39, 19, NULL, 'NV123433', 2, '\"{\\\"name\\\":\\\"Jesna\\\",\\\"email\\\":\\\"jesna@gmail.com\\\",\\\"address\\\":\\\"Buteena\\\",\\\"zipcode\\\":\\\"000001\\\",\\\"city\\\":\\\"Sharjah\\\",\\\"phone\\\":\\\"5841542365\\\"}\"', '\"{\\\"name\\\":\\\"Jesna\\\",\\\"email\\\":\\\"jesna@gmail.com\\\",\\\"address\\\":\\\"Buteena\\\",\\\"zipcode\\\":\\\"000001\\\",\\\"city\\\":\\\"Sharjah\\\",\\\"phone\\\":\\\"5841542365\\\"}\"', 'pending', 'cod', 'un_paid', 2, 6400.00, 1500.00, 7900.00, 0.00, '2024-12-05', '2024-12-06', '20241205-07015271', '2024-12-05 15:01:52', '', NULL, 0, NULL, NULL, 0, NULL, 'free_shipping', 0.00, 0.00, 0.00, 0, '2024-12-05 15:01:52', '2024-12-05 15:02:19'),
(67, 56, 38, 18, NULL, 'NV123432', 1, NULL, NULL, 'pending', NULL, 'un_paid', 3, 1050.00, 500.00, 1550.00, 0.00, '2024-12-09', '2024-12-11', '20241205-08305234', '2024-12-05 16:30:52', NULL, NULL, 0, NULL, NULL, 0, NULL, 'free_shipping', 0.00, 0.00, 0.00, 0, '2024-12-05 16:30:52', '2024-12-05 16:30:52'),
(68, 56, 39, 19, NULL, 'NV123433', 1, NULL, NULL, 'pending', NULL, 'un_paid', 1, 1600.00, 1500.00, 3100.00, 0.00, '2024-12-05', '2024-12-05', '20241205-08540851', '2024-12-05 16:54:08', NULL, NULL, 0, NULL, NULL, 0, NULL, 'free_shipping', 0.00, 0.00, 0.00, 0, '2024-12-05 16:54:08', '2024-12-05 16:54:08'),
(69, 56, 39, 19, NULL, 'NV123433', 1, '\"{\\\"name\\\":\\\"Nimitha\\\",\\\"email\\\":\\\"test@gmail.com\\\",\\\"address\\\":\\\"Wafi Residence\\\",\\\"zipcode\\\":\\\"000000\\\",\\\"city\\\":\\\"Dubai\\\",\\\"phone\\\":\\\"5841542365\\\"}\"', '\"{\\\"name\\\":\\\"Nimitha\\\",\\\"email\\\":\\\"test@gmail.com\\\",\\\"address\\\":\\\"Wafi Residence\\\",\\\"zipcode\\\":\\\"000000\\\",\\\"city\\\":\\\"Dubai\\\",\\\"phone\\\":\\\"5841542365\\\"}\"', 'pending', 'cod', 'un_paid', 1, 1600.00, 1500.00, 3100.00, 0.00, '2024-12-05', '2024-12-05', '20241205-08550097', '2024-12-05 16:55:00', '', NULL, 0, NULL, NULL, 0, NULL, 'free_shipping', 0.00, 0.00, 0.00, 0, '2024-12-05 16:55:00', '2024-12-05 16:55:18'),
(72, 56, 39, 19, NULL, 'NV123433', 1, '\"{\\\"name\\\":\\\"Nimitha\\\",\\\"email\\\":\\\"test@gmail.com\\\",\\\"address\\\":\\\"Wafi Residence\\\",\\\"zipcode\\\":\\\"000000\\\",\\\"city\\\":\\\"Dubai\\\",\\\"phone\\\":\\\"5841542365\\\"}\"', '\"{\\\"name\\\":\\\"Nimitha\\\",\\\"email\\\":\\\"test@gmail.com\\\",\\\"address\\\":\\\"Wafi Residence\\\",\\\"zipcode\\\":\\\"000000\\\",\\\"city\\\":\\\"Dubai\\\",\\\"phone\\\":\\\"5841542365\\\"}\"', 'pending', 'cod', 'un_paid', 1, 1600.00, 1500.00, 3100.00, 0.00, '2024-12-05', '2024-12-05', '20241205-09025056', '2024-12-05 17:02:50', '', NULL, 0, NULL, NULL, 0, NULL, 'free_shipping', 0.00, 0.00, 0.00, 0, '2024-12-05 17:02:50', '2024-12-05 17:03:11'),
(78, 60, 38, 18, NULL, 'NV123432', 1, '\"{\\\"name\\\":\\\"test\\\",\\\"email\\\":\\\"nevetha.tomsher@gmail.com\\\",\\\"address\\\":\\\"deira\\\",\\\"zipcode\\\":\\\"57589\\\",\\\"city\\\":\\\"Dubai\\\",\\\"phone\\\":\\\"jhadsbsjk\\\"}\"', '\"{\\\"name\\\":\\\"test\\\",\\\"email\\\":\\\"nevetha.tomsher@gmail.com\\\",\\\"address\\\":\\\"deira\\\",\\\"zipcode\\\":\\\"57589\\\",\\\"city\\\":\\\"Dubai\\\",\\\"phone\\\":\\\"jhadsbsjk\\\"}\"', 'pending', 'cod', 'un_paid', 1, 350.00, 500.00, 850.00, 0.00, '2024-12-06', '2024-12-06', '20241205-11020157', '2024-12-05 19:02:01', '', NULL, 0, NULL, NULL, 0, NULL, 'free_shipping', 0.00, 0.00, 0.00, 0, '2024-12-05 19:02:01', '2024-12-05 19:02:42'),
(80, 56, 39, 19, NULL, 'NV123433', 1, '\"{\\\"name\\\":\\\"Nimitha\\\",\\\"email\\\":\\\"test@gmail.com\\\",\\\"address\\\":\\\"Wafi Residence\\\",\\\"zipcode\\\":\\\"000000\\\",\\\"city\\\":\\\"Dubai\\\",\\\"phone\\\":\\\"5841542365\\\"}\"', '\"{\\\"name\\\":\\\"Nimitha\\\",\\\"email\\\":\\\"test@gmail.com\\\",\\\"address\\\":\\\"Wafi Residence\\\",\\\"zipcode\\\":\\\"000000\\\",\\\"city\\\":\\\"Dubai\\\",\\\"phone\\\":\\\"5841542365\\\"}\"', 'pending', 'cod', 'un_paid', 1, 1600.00, 1500.00, 3100.00, 0.00, '2024-12-05', '2024-12-05', '20241205-13163496', '2024-12-05 21:16:34', '', NULL, 0, NULL, NULL, 0, NULL, 'free_shipping', 0.00, 0.00, 0.00, 0, '2024-12-05 21:16:34', '2024-12-05 21:16:47'),
(81, 56, 39, 19, NULL, 'NV123433', 2, '\"{\\\"name\\\":\\\"james\\\",\\\"email\\\":\\\"james@gmail.com\\\",\\\"address\\\":\\\"Buteena\\\",\\\"zipcode\\\":\\\"000012\\\",\\\"city\\\":\\\"Sharjah\\\",\\\"phone\\\":\\\"9876543214\\\"}\"', '\"{\\\"name\\\":\\\"james\\\",\\\"email\\\":\\\"james@gmail.com\\\",\\\"address\\\":\\\"Buteena\\\",\\\"zipcode\\\":\\\"000012\\\",\\\"city\\\":\\\"Sharjah\\\",\\\"phone\\\":\\\"9876543214\\\"}\"', 'delivered', 'cod', 'paid', 1, 3200.00, 1500.00, 4700.00, 0.00, '2024-12-11', '2024-12-11', '20241211-10391569', '2024-12-11 18:39:15', '', NULL, 0, NULL, NULL, 0, NULL, 'free_shipping', 0.00, 0.00, 0.00, 0, '2024-12-11 18:39:15', '2024-12-20 22:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `rent_order_tracking`
--

CREATE TABLE `rent_order_tracking` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT '	pending, confirmed, picked_up, on_the_way, delivered, cancelled, returned	',
  `description` text DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rent_order_tracking`
--

INSERT INTO `rent_order_tracking` (`id`, `order_id`, `status`, `description`, `status_date`, `created_at`, `updated_at`) VALUES
(70, 66, 'pending', 'The order has been placed successfully', '2024-12-05 07:02:19', '2024-12-05 15:02:19', '2024-12-05 15:02:19'),
(71, 69, 'pending', 'The order has been placed successfully', '2024-12-05 08:55:20', '2024-12-05 16:55:20', '2024-12-05 16:55:20'),
(72, 72, 'pending', 'The order has been placed successfully', '2024-12-05 09:03:11', '2024-12-05 17:03:11', '2024-12-05 17:03:11'),
(73, 78, 'pending', 'The order has been placed successfully', '2024-12-05 11:02:42', '2024-12-05 19:02:42', '2024-12-05 19:02:42'),
(74, 80, 'pending', 'The order has been placed successfully', '2024-12-05 13:16:47', '2024-12-05 21:16:47', '2024-12-05 21:16:47'),
(75, 81, 'pending', 'The order has been placed successfully', '2024-12-11 10:39:28', '2024-12-11 18:39:28', '2024-12-11 18:39:28'),
(76, 81, 'delivered', NULL, '2024-12-20 14:44:10', '2024-12-20 22:44:10', '2024-12-20 22:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `viewed` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `comment`, `status`, `viewed`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 1, 'asdasd', 1, 0, '2023-04-28 20:51:13', '2023-04-28 20:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', 1, NULL, NULL),
(2, 'Admin', 'web', 1, NULL, NULL),
(9, 'Manager', 'web', 1, '2024-02-26 14:31:25', '2024-02-26 14:31:25'),
(10, 'Content Writer', 'web', 1, '2024-02-26 14:32:15', '2024-02-26 14:32:15'),
(14, 'Testing Role', 'web', 1, '2024-10-14 10:09:33', '2024-10-16 13:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(17, 1),
(18, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(3, 9),
(11, 9),
(12, 9),
(20, 9),
(12, 10),
(17, 10),
(3, 14),
(10, 14),
(11, 14),
(18, 14);

-- --------------------------------------------------------

--
-- Table structure for table `role_translations`
--

CREATE TABLE `role_translations` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `role_translations`
--

INSERT INTO `role_translations` (`id`, `role_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 3, 'Shop Manger', 'en', '2023-05-01 18:16:07', '2023-05-01 18:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `metal` varchar(50) DEFAULT NULL,
  `metal_type` varchar(11) DEFAULT NULL,
  `weight` float NOT NULL DEFAULT 0,
  `eid_no` varchar(191) DEFAULT NULL,
  `id_image_back` varchar(255) DEFAULT NULL,
  `id_image` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `name`, `email`, `phone`, `description`, `metal`, `metal_type`, `weight`, `eid_no`, `id_image_back`, `id_image`, `product_image`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@gmail.com', '1234567890', 'dfcscsdfgvfd', 'gold', '18k', 2, '2343546546576', '/storage/sales/1734526546_6762c652b075a.jpg', '/storage/sales/1734526546_6762c652af346.jpg', '/storage/sales/1734526546_6762c652b085a.png', '2024-12-18 20:55:46', '2024-12-18 20:55:46');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `temp_user_id` varchar(191) DEFAULT NULL,
  `query` varchar(1000) NOT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `user_id`, `temp_user_id`, `query`, `ip_address`, `created_at`, `updated_at`) VALUES
(2, 11, NULL, 'dcs', '192.168.1.1', '2020-03-08 08:29:09', '2020-03-08 08:29:09'),
(3, 10, NULL, 'das', '192.168.1.2', '2020-03-08 08:29:15', '2020-03-08 08:29:50'),
(4, NULL, '59432007cd0d79c97b8f', 'aasdas', '::1', '2023-03-31 08:58:19', '2023-03-31 08:58:19'),
(5, NULL, '59432007cd0d79c97b8f', 'aasdas', '::1', '2023-03-31 08:58:30', '2023-03-31 08:58:30'),
(6, NULL, '59432007cd0d79c97b8f', 'aasdas', '::1', '2023-03-31 08:58:32', '2023-03-31 08:58:32'),
(7, NULL, '59432007cd0d79c97b8f', 'aasdas', '::1', '2023-03-31 08:58:32', '2023-03-31 08:58:32'),
(8, NULL, '59432007cd0d79c97b8f', 'h', '::1', '2023-03-31 08:58:33', '2023-03-31 08:58:33'),
(9, NULL, '59432007cd0d79c97b8f', 'he', '::1', '2023-03-31 08:58:34', '2023-03-31 08:58:34'),
(10, NULL, '59432007cd0d79c97b8f', 'hen', '::1', '2023-03-31 08:58:34', '2023-03-31 08:58:34'),
(11, NULL, '59432007cd0d79c97b8f', 'hen', '::1', '2023-03-31 08:59:04', '2023-03-31 08:59:04'),
(12, NULL, '59432007cd0d79c97b8f', 'hen', '::1', '2023-03-31 08:59:06', '2023-03-31 08:59:06'),
(13, NULL, '59432007cd0d79c97b8f', 'hen', '::1', '2023-03-31 08:59:50', '2023-03-31 08:59:50'),
(14, NULL, '59432007cd0d79c97b8f', 'hen', '::1', '2023-03-31 08:59:58', '2023-03-31 08:59:58'),
(15, NULL, '59432007cd0d79c97b8f', 'hen', '::1', '2023-03-31 14:50:24', '2023-03-31 14:50:24'),
(16, NULL, '59432007cd0d79c97b8f', 'hen', '::1', '2023-03-31 14:50:25', '2023-03-31 14:50:25'),
(17, NULL, '59432007cd0d79c97b8f', 'hen', '::1', '2023-03-31 14:50:25', '2023-03-31 14:50:25'),
(18, NULL, '59432007cd0d79c97b8f', 'h', '::1', '2023-03-31 14:50:30', '2023-03-31 14:50:30'),
(19, NULL, '59432007cd0d79c97b8f', 'he', '::1', '2023-03-31 14:50:30', '2023-03-31 14:50:30'),
(20, NULL, '59432007cd0d79c97b8f', 'he', '::1', '2023-03-31 14:50:31', '2023-03-31 14:50:31'),
(21, 10, NULL, 'he', '::1', '2023-03-31 14:50:32', '2023-03-31 14:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `sort_order`, `slug`, `price`, `image`, `status`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'ddsd', 0, 'ddsdsddsd', NULL, NULL, 0, NULL, '2025-08-23 09:30:45', '2025-08-23 09:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `service_translations`
--

CREATE TABLE `service_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `lang` varchar(10) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `twitter_title` varchar(255) DEFAULT NULL,
  `twitter_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_translations`
--

INSERT INTO `service_translations` (`id`, `service_id`, `name`, `description`, `lang`, `meta_title`, `meta_description`, `meta_keywords`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'ddsd', '<p>sdsdds<br></p>', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-23 09:30:45', '2025-08-23 09:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `name_ar` varchar(191) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `address_ar` varchar(191) NOT NULL,
  `delivery_pickup_latitude` decimal(8,6) DEFAULT NULL,
  `delivery_pickup_longitude` decimal(9,6) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `name`, `name_ar`, `phone`, `email`, `address`, `address_ar`, `delivery_pickup_latitude`, `delivery_pickup_longitude`, `status`, `created_at`, `updated_at`) VALUES
(31, 'Sharjah shop', 'الشارقة شوب', '11111111111111', 'sharjah@yopmail.com', 'Sharjah Shop\r\nSharjah', 'الشارقة شوب\r\nمدينة الشارقة', 25.328435, 0.000000, 1, '2023-05-18 20:21:28', '2024-02-05 18:33:26'),
(32, 'Dubai Shop', 'متجر دبي', '222222222', 'dubai@yopmail.com', 'Dubai Shop\r\nDubai mall', 'متجر دبي\r\nدبي مول', 25.197230, 55.279747, 1, '2023-05-18 20:23:39', '2023-05-18 20:23:39'),
(27, 'Kerala Shop', 'متجر كيرلا', '222222222', 'kerala@yopmail.com', 'Kerala shop\r\nkerala', 'متجر ولاية كيرالا\r\nولاية كيرالا', 9.318327, 76.611084, 1, '2023-05-18 18:46:07', '2023-05-18 19:28:05'),
(36, 'Jisha', 'الجيشا', '33333333', 'jisha@yopmail.com', 'Jisha', 'الجيشا', 20.593684, 78.962880, 1, '2023-05-19 16:15:52', '2023-09-05 12:28:30'),
(37, 'Ajman Shop', 'عجمان شوب', '2222222', 'ajman@yopmail.com', 'Ajman shop', 'عجمان شوب', 25.405217, 55.513643, 1, '2023-05-22 20:02:43', '2023-05-22 20:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `shop_user`
--

CREATE TABLE `shop_user` (
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_users`
--

CREATE TABLE `shop_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_users`
--

INSERT INTO `shop_users` (`id`, `shop_id`, `user_id`, `created_at`, `updated_at`) VALUES
(17, 37, 40, '2023-05-22 20:02:43', '2023-05-22 20:02:43'),
(12, 32, 35, '2023-05-18 20:23:39', '2023-05-18 20:23:39'),
(11, 31, 34, '2023-05-18 20:21:28', '2023-05-18 20:21:28'),
(7, 27, 30, '2023-05-18 18:46:07', '2023-05-18 18:46:07'),
(16, 36, 39, '2023-05-19 16:15:52', '2023-05-19 16:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 13, 14, '2023-05-01 18:16:11', '2024-10-16 13:46:15'),
(2, 52, 9, '2024-10-16 13:47:00', '2024-10-16 13:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'asdasd@asdasd.com', '2023-04-29 18:03:29', '2023-04-29 18:03:29'),
(2, 'nevetha.tomsher@gmail.com', '2024-12-04 21:04:15', '2024-12-04 21:04:15'),
(3, 'vendor.n@yopmail.com', '2024-12-19 18:40:29', '2024-12-19 18:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `title`, `comment`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Test', NULL, 'TestTest', 1, 0, '2025-08-23 09:34:31', '2025-08-23 09:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gateway` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `additional_content` text DEFAULT NULL,
  `mpesa_request` varchar(255) DEFAULT NULL,
  `mpesa_receipt` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `lang_key` text DEFAULT NULL,
  `lang_value` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `external_link` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `external_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '21_century', 'uploads/all/loRQKFPyzW6ZHfgJXNH02UdCXoUONRB8UJnYQ9wl.png', 9, 46243, 'png', 'image', NULL, '2024-10-25 16:11:04', '2024-10-25 16:11:04', NULL),
(2, '360_F_91819468_ZkdfPr7zPwm8ZVOXhAILwD4fwkvs2PZR', 'uploads/all/hh1ghh1rgVzuDmmsGzmtviRYAMsL9QGgPQ4X4p4o.jpg', 9, 31601, 'jpg', 'image', NULL, '2024-10-25 16:11:04', '2024-10-25 16:11:04', NULL),
(3, 'Acm', 'uploads/all/vd66ZytwtH9Lqy8AmSeRoE5py3qnJDTKmVvJATBY.png', 9, 24583, 'png', 'image', NULL, '2024-10-25 16:11:04', '2024-10-25 16:11:04', NULL),
(4, 'ACM_gel', 'uploads/all/QEaujFJiXp4tcXVRgiy0wRZGWkG2qQAU6zHpO5SK.png', 9, 142345, 'png', 'image', NULL, '2024-10-25 16:11:05', '2024-10-25 16:11:22', '2024-10-25 16:11:22'),
(5, '239.1', 'uploads/all/UhHILCsd4Y7AR4cFNFuZpJPzEmoSnTvfkAOvE5cK.webp', 9, 24954, 'webp', 'image', NULL, '2024-11-02 08:53:43', '2024-11-02 08:53:43', NULL),
(6, '513818FDBAA00_1', 'uploads/all/2ZHSblLVSQ5S1JFgTsp7Qp6Uyj66D0qUwEdnlhC3.webp', 9, 43094, 'webp', 'image', NULL, '2024-11-02 08:53:43', '2024-11-02 08:53:43', NULL),
(7, 'about-img1', 'uploads/all/rf11CcyZqd2FqJ93tq8KycrVtU9xdRzAXgwDjqhl.png', 9, 231206, 'png', 'image', NULL, '2024-11-02 08:53:43', '2024-11-02 08:53:43', NULL),
(8, 'about-img2', 'uploads/all/HIE858thCjYERl3XMIPxuXu10NZnzPewjzSFAcA2.png', 9, 261282, 'png', 'image', NULL, '2024-11-02 08:53:43', '2024-11-02 08:53:43', NULL),
(9, 'banner-img1', 'uploads/all/cDB5RsYRU3vm8MmfpOV8PEdi7Ii1MpcJ54h4r9ho.jpg', 9, 297314, 'jpg', 'image', NULL, '2024-11-02 08:53:43', '2024-11-02 08:53:43', NULL),
(10, 'category_img1', 'uploads/all/vlpPT7f3k9W32Lqu4cxEgkgU2xk4ebB09FtCCSX3.png', 9, 64317, 'png', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(11, 'category_img2', 'uploads/all/UmOkYYifiuPQ7Dhu5QrxlUCmhADgZmiWcvit1AqX.png', 9, 98862, 'png', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(12, 'bnnta10005_2', 'uploads/all/15uXEDHmLfCmZK6Ub1qkw0D2V5bA2hvt9zz6QKTu.jpg', 9, 255709, 'jpg', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(13, 'bnnta10005_1', 'uploads/all/Bn41pL5V8y1lcNx42yhZJpGoYKF6oBMYoQrsW8RX.jpg', 9, 309624, 'jpg', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(14, 'category_img3', 'uploads/all/dVjfZQzpaMCFchdFcgaRFCxdOFQ8CcwspIhpa8dn.png', 9, 51954, 'png', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(15, 'category_img4', 'uploads/all/ZQa6ROwQvtI07FapTJy9sKlKhUIRXff0ZQqZNznE.png', 9, 57549, 'png', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(16, 'banner-img2', 'uploads/all/IetlJVNvUo1ImeF2SJWoxuSzBDhyJ0JDIC715TAi.jpg', 9, 627759, 'jpg', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(17, 'category_img5', 'uploads/all/YMnkLzKapOklErzUovoyLwEbxLiRGWcnOt6xQMdq.png', 9, 77530, 'png', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(18, 'costumer-icon', 'uploads/all/fxWDQ9erfKLL3wywnyM1d64wTfmqoCsMlhK1Zrji.svg', 9, 51791, 'svg', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(19, 'bnnta10005', 'uploads/all/be0N2EgYlGogfdKkmVdEYLbTD7sStlm5wGj7A1iN.jpg', 9, 707522, 'jpg', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(20, 'ernta10011_1', 'uploads/all/XhrQAzcom1FNWxo3lwbVSlmmxrcxAQSI08k1nd0i.jpg', 9, 236158, 'jpg', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(21, 'ernta10011_s', 'uploads/all/K2GujlYo6x1YLirZfvF3sOH0xbviX7Tvk6WpaFXg.jpg', 9, 226681, 'jpg', 'image', NULL, '2024-11-02 08:53:44', '2024-11-02 08:53:44', NULL),
(22, 'f-img-1', 'uploads/all/nEI5Y9i1YxQ5IdoS1RqjgyqF0RQlt78BmgGm0Jzs.jpg', 9, 234476, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(23, 'ernta10011_m', 'uploads/all/0zd3n1oqdeked1Yu2t2w0lOYaLehLU96RFOR4guy.jpg', 9, 373218, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(24, 'f-img-2', 'uploads/all/HqEpbH34aFiJHxUhSv8rWQuoWBpsZqa4n5AOv0P5.jpg', 9, 158706, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(25, 'ernta10011', 'uploads/all/y9U8X2UrUn0uX8ZidagyoImms1Ke1Pr05GCcQkwN.jpg', 9, 458022, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(26, 'f-img-4', 'uploads/all/U6gUYeIiaN65OlwlhL07a6A0Iq4xgH9W74PS28gi.jpg', 9, 120677, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(27, 'Gold-Engagement-Rings-Styles', 'uploads/all/ibCw07nXgu8E1MLBmqLt95YY4S84h7nffGj6uMkh.jpg', 9, 83292, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(28, 'f-img-3', 'uploads/all/ooM4KY6QzRJ3L1YGvyUx5WJ9gjcIsmZ4WICKI4h5.jpg', 9, 273455, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(29, 'hicon-1', 'uploads/all/dJCm1OajFIX71anQv8CA03yTUzdnWB0grgPYykpp.svg', 9, 30274, 'svg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(30, 'images', 'uploads/all/igxAxiDSLwiHWhMs0gsESiN4nQvSaBfO5Xk8xnQq.jpg', 9, 4724, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(31, 'guides-img1', 'uploads/all/trSpZJQv043r58htCItZmUgf3zVa6oTPhfuYLJRI.jpg', 9, 269636, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(32, 'guides-img2', 'uploads/all/738285VLoXfEs1XeFxnYKAMS4uS0FNIGGGQzGjfY.jpg', 9, 289348, 'jpg', 'image', NULL, '2024-11-02 08:53:45', '2024-11-02 08:53:45', NULL),
(33, 'inspired-img1', 'uploads/all/opDNNu1AR88r5rJeLZvpTfcowMssR2WGTTwRDpjX.png', 9, 208805, 'png', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(34, 'guides-img3', 'uploads/all/8bZ3wdfQg2OqPZ12ksp4uj57kCdb8SLM7obgi2ve.jpg', 9, 341131, 'jpg', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(35, 'inspired-img2', 'uploads/all/lbxE5mqZZlMJnp993N0n9S1qFOrXcLfMTVJXcaIa.png', 9, 235367, 'png', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(36, 'inspired-img3', 'uploads/all/DkOynqNnOdGOQqGogSC53Xl6rwHvcldVcnXUVviF.png', 9, 187099, 'png', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(37, 'jewellery_necklace_banner', 'uploads/all/WeCoQWJ6kAz0rHBN0GzTtxzUmG529oKwgGMEzDcI.webp', 9, 84204, 'webp', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(38, 'inspired-img4', 'uploads/all/PgfMEJaBL7nkWcMutysJDhXFu00dbekM2EnOAjzY.png', 9, 229272, 'png', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(39, 'menu-img-02', 'uploads/all/vgPG5zyQPXBslvLJJjrLd6n65b2HXhIjyU3I4WZp.webp', 9, 240732, 'webp', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(40, 'menu-img-01', 'uploads/all/m5mbeEsBghsnMw0IQDzVpi2JJEJiIq081xIimrf6.webp', 9, 278144, 'webp', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(41, 'menu-img-03', 'uploads/all/pNln9SuIrDvsfZw8KZFkA2fxMYSBCUeFEgcXFJSY.webp', 9, 257050, 'webp', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(42, 'nknta10104', 'uploads/all/U4dSAEjO4BmFvKRL5HLWLWqMK4UQ9D17jTnUteiD.jpg', 9, 214910, 'jpg', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(43, 'nknta10104_2', 'uploads/all/va2OwgxWufoqJTFmyknfV0MTIrQ8p1LLn0xJh7GA.jpg', 9, 232029, 'jpg', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(44, 'nknta10104_1', 'uploads/all/l0jwSoPFe1Nk1HtKaS0CPB9BZyCJOF78fGfXyCQq.jpg', 9, 283819, 'jpg', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(45, 'join-bg', 'uploads/all/Rl8wiiSDT8nvHrQ3ZJFBAn0JKLZOq4s3Pjg5iBZB.jpg', 9, 732730, 'jpg', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(46, 'USANAKT23ER01_1_3', 'uploads/all/pDJPjt1835ipw1QslXzvRKEbDn4VoSeYhEfhxWoR.jpg', 9, 388005, 'jpg', 'image', NULL, '2024-11-02 08:53:46', '2024-11-02 08:53:46', NULL),
(47, 'WHPS288745_0_r', 'uploads/all/tMoRWdqPONU1qVNkDNfVuowcyQZf6d4ZDgo1BRD7.jpg', 9, 26063, 'jpg', 'image', NULL, '2024-11-02 08:53:47', '2024-11-02 08:53:47', NULL),
(48, 'USANAKT23ER01_S_3', 'uploads/all/3QsrdXI28XdCJYB4Uem0Mgk6O7pRhCyrNTvjUIP9.jpg', 9, 177777, 'jpg', 'image', NULL, '2024-11-02 08:53:47', '2024-11-02 08:53:47', NULL),
(49, 'USANAKT23ER01_M_3', 'uploads/all/lwzOixbXFqhZD5dtcyRHHCyZtqVUJbyXhPpOdQ3v.jpg', 9, 461316, 'jpg', 'image', NULL, '2024-11-02 08:53:48', '2024-11-02 08:53:48', NULL),
(50, 'USANAKT23ER01_4', 'uploads/all/cv2houawIQG72LEIxoliNtAVf6IRT7yCfuaNoX3S.jpg', 9, 798142, 'jpg', 'image', NULL, '2024-11-02 08:53:48', '2024-11-02 08:53:48', NULL),
(51, 'col-01', 'uploads/all/JZvaJAghZ7n1QXIq99kkc2iLC9f0o3VnDvEdbToD.jpg', 9, 130877, 'jpg', 'image', NULL, '2024-11-07 16:16:18', '2024-11-07 16:16:18', NULL),
(52, 'col-02', 'uploads/all/6HaQNLBJHfx5dUcPF25TV178biFitIWuPNUfve4v.jpg', 9, 105362, 'jpg', 'image', NULL, '2024-11-07 16:16:18', '2024-11-07 16:16:18', NULL),
(53, 'col-04', 'uploads/all/Y6WxxWpyD8X9tlpXkDtGUaiXFsAwBDZFwbKfgGCS.jpg', 9, 105526, 'jpg', 'image', NULL, '2024-11-07 16:16:18', '2024-11-07 16:16:18', NULL),
(54, 'col-05', 'uploads/all/h85yTRDhF53cA5eLSn0I0pdBikwNab3Vhf19I0jm.jpg', 9, 103048, 'jpg', 'image', NULL, '2024-11-07 16:16:18', '2024-11-07 16:16:18', NULL),
(55, 'col-06', 'uploads/all/9jrTjuvxxQzbmIPzMFb4UdgejFRgIZWqTtnVQU7O.jpg', 9, 104319, 'jpg', 'image', NULL, '2024-11-07 16:16:19', '2024-11-07 16:16:19', NULL),
(56, 'col-03', 'uploads/all/yAowh1ewGdiWdx9nsJTXMddGDdahUHT10rfY8gmH.jpg', 9, 113709, 'jpg', 'image', NULL, '2024-11-07 16:16:19', '2024-11-07 16:16:19', NULL),
(57, 'brand_1', 'uploads/all/AxaxOG5H98z6WrhMyfmDMTLaZRw5NKWQZsn4HqZ6.png', 9, 10298, 'png', 'image', NULL, '2024-11-20 17:27:05', '2024-11-20 17:27:05', NULL),
(58, 'brand_3', 'uploads/all/1n0I0bNnq2yttWKZKgFpxduHvdQJagVNePrIQdGn.png', 9, 6698, 'png', 'image', NULL, '2024-11-20 17:27:05', '2024-11-20 17:27:05', NULL),
(59, 'brand_4', 'uploads/all/zsMVD0OyVDJ6qFrbj9f0WAOYXoFSeMUqkC4M8TBm.png', 9, 12195, 'png', 'image', NULL, '2024-11-20 17:27:05', '2024-11-20 17:27:05', NULL),
(60, 'brand_5', 'uploads/all/gKjIM2ywNcmy5eByH39LKByxJBAVDv1iC6MrQysc.png', 9, 8987, 'png', 'image', NULL, '2024-11-20 17:27:05', '2024-11-20 17:27:05', NULL),
(61, 'brand_6', 'uploads/all/ouE1uQBYMlpAFVTk8UH1nVsROeh4kaE1gAtqLXnX.png', 9, 9338, 'png', 'image', NULL, '2024-11-20 17:27:05', '2024-11-20 17:27:05', NULL),
(62, 'brand_2', 'uploads/all/l6q6uKjsWYW3TWsrhdOvbHOUHmge4ffgKIyVCgCb.png', 9, 15181, 'png', 'image', NULL, '2024-11-20 17:27:05', '2024-11-20 17:27:05', NULL),
(63, 'brand_7', 'uploads/all/OmS9EdUm6t4ySRYQxzztsZiir0VgpTSL4ApbFeje.png', 9, 9937, 'png', 'image', NULL, '2024-11-20 17:27:05', '2024-11-20 17:27:05', NULL),
(64, 'brand_8', 'uploads/all/IJgpKFDAqvubzprp5jkN7rh6tgd0883iFB0J1F0g.png', 9, 13642, 'png', 'image', NULL, '2024-11-20 17:27:05', '2024-11-20 17:27:05', NULL),
(65, 'brand_3', 'uploads/all/4hGdyjUk4pzfH8WkVn51ZbScp3KSpZdc0kr0rch6.png', 9, 4599, 'png', 'image', NULL, '2024-11-20 17:27:18', '2024-11-20 17:27:18', NULL),
(66, 'brand_4', 'uploads/all/6S8QrQ2JEit6AoOKmaelNdyVVlKjq2dKnQHOaSyx.png', 9, 4302, 'png', 'image', NULL, '2024-11-20 17:27:18', '2024-11-20 17:27:18', NULL),
(67, 'brand_5', 'uploads/all/wyZIpCXrLENWdPjKX7R2stOsLD12ofVcyS1h7NY4.png', 9, 5538, 'png', 'image', NULL, '2024-11-20 17:27:19', '2024-11-20 17:27:19', NULL),
(68, 'brand_6', 'uploads/all/yoJEZOMmEcvljoWeJGGffXedOENkvWDffjOiQPIH.png', 9, 2612, 'png', 'image', NULL, '2024-11-20 17:27:19', '2024-11-20 17:27:19', NULL),
(69, 'brand_7', 'uploads/all/BlZbvbuMaf3cD20dB4jECrdWmdt4iBns9BzcmX0B.png', 9, 6868, 'png', 'image', NULL, '2024-11-20 17:27:19', '2024-11-20 17:27:19', NULL),
(70, 'brand_8', 'uploads/all/9d8RCqzOiE4fZ0Sy4qf3Iowtu7iFPsir65idwSyD.png', 9, 8044, 'png', 'image', NULL, '2024-11-20 17:27:19', '2024-11-20 17:27:19', NULL),
(71, 'banner03', 'uploads/all/FwdKBmKKjRvBFAuyHOZ8L7aoNGBMQfvXsATi1Qcy.jpg', 9, 496295, 'jpg', 'image', NULL, '2024-11-20 17:27:58', '2024-11-20 17:27:58', NULL),
(72, 'banner02', 'uploads/all/33HxXKs0B0uXhbusEc3Sgo925K1DLDLz0u3bf7ul.jpg', 9, 814640, 'jpg', 'image', NULL, '2024-11-20 17:27:58', '2024-11-20 17:27:58', NULL),
(73, 'offer-01', 'uploads/all/AaFPTxbWA0Iw7IeZmZrI281VQgb6jLvchryzSHzr.jpg', 9, 170129, 'jpg', 'image', NULL, '2024-11-20 18:06:03', '2024-11-20 18:06:03', NULL),
(74, 'offer-02', 'uploads/all/G3mfVb5CnhogTF1h6JLlVnal3DUHEmHmFmwrXQ2n.jpg', 9, 90744, 'jpg', 'image', NULL, '2024-11-20 18:06:14', '2024-11-20 18:06:14', NULL),
(75, 'AD-Banner', 'uploads/all/fqPVwbM9t7QmUaG3upvICdS3yJsmmW2ELEMRM371.jpg', 9, 1332536, 'jpg', 'image', NULL, '2024-11-21 13:12:55', '2024-11-21 13:12:55', NULL),
(76, 'ad-01', 'uploads/all/jTPyROCJJVGRMFV2CMnIeeQFUuAmGlfzFpsU18Qb.jpg', 9, 180668, 'jpg', 'image', NULL, '2024-11-21 14:08:28', '2024-11-21 14:08:28', NULL),
(77, 'ad-02', 'uploads/all/Pfx4PH4bOgJv1DkuuHWbND0qclLi3XSzmCMRdtHq.jpg', 9, 186232, 'jpg', 'image', NULL, '2024-11-21 14:08:28', '2024-11-21 14:08:28', NULL),
(78, 'ad-03', 'uploads/all/0GgQATt1waHPnxzX7JNnTXS7zfUxPybJaptrNwWi.jpg', 9, 207080, 'jpg', 'image', NULL, '2024-11-21 14:08:28', '2024-11-21 14:08:28', NULL),
(79, 'payment', 'uploads/all/WRYRNuOPrWCltCwo0gpOmHDPrcFPCqnS2ncekqMQ.svg', 9, 18862, 'svg', 'image', NULL, '2024-11-21 15:54:36', '2024-11-21 15:54:36', NULL),
(80, 'cat-02', 'uploads/all/w9cVIcNyGBAoxzyqrgBPEfCkQDE1NfdeVt9GJTsO.jpg', 9, 64753, 'jpg', 'image', NULL, '2024-11-25 16:01:14', '2024-11-25 16:01:14', NULL),
(81, 'cat-03', 'uploads/all/MNkyFPeBE4EsVplkOTTVAdKLZeh7xTBd5BlX8Ag3.jpg', 9, 53300, 'jpg', 'image', NULL, '2024-11-25 16:06:06', '2024-11-25 16:06:06', NULL),
(82, 'col-02', 'uploads/all/IfpVqeMsm9VoQaVyNua2hIzTjsBL7IePm1xqgaDv.jpg', 9, 105362, 'jpg', 'image', NULL, '2024-11-25 16:21:58', '2024-11-25 16:21:58', NULL),
(83, 'col-04', 'uploads/all/DnCOywZrZrk7PWexyWdCaiAiqB32KeIUHJGGOvSQ.jpg', 9, 105526, 'jpg', 'image', NULL, '2024-11-25 16:23:01', '2024-11-25 16:23:01', NULL),
(84, 'cat-01', 'uploads/all/0GbMwgq98zyswYNz5dkQtOpHmkDllSvIevqSwtfW.jpg', 9, 52633, 'jpg', 'image', NULL, '2024-11-25 17:12:24', '2024-11-25 17:12:24', NULL),
(85, 'col-05', 'uploads/all/JWlD27lTGndmyIHchtdeaMwjKcMph4i8Yavqedif.jpg', 9, 103048, 'jpg', 'image', NULL, '2024-11-25 19:25:04', '2024-11-25 19:25:04', NULL),
(86, 'col-06', 'uploads/all/aq9Rsdy5Re3zScrOMpl4TbLUjC2zRsBQfhZEuQAf.jpg', 9, 104319, 'jpg', 'image', NULL, '2024-11-25 19:25:31', '2024-11-25 19:25:31', NULL),
(87, 'menu-bg-2', 'uploads/all/Q1kQuru4toeAllwfM7GNJHIF9FZsxhScq1XP4j7T.jpg', 9, 25425, 'jpg', 'image', NULL, '2024-11-28 23:22:12', '2024-11-28 23:22:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) DEFAULT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'customer',
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `eid_no` varchar(255) DEFAULT NULL,
  `eid_approval_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-Pending, 1-Approved, 2-Denied',
  `eid_image_front` varchar(255) DEFAULT NULL,
  `eid_image_back` varchar(255) DEFAULT NULL,
  `otp` varchar(50) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text DEFAULT NULL,
  `new_email_verificiation_code` text DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `device_token` varchar(255) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `avatar_original` varchar(256) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT 0.00,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `referral_code` varchar(255) DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider_id`, `user_type`, `name`, `email`, `eid_no`, `eid_approval_status`, `eid_image_front`, `eid_image_back`, `otp`, `otp_expiry`, `is_phone_verified`, `email_verified_at`, `verification_code`, `new_email_verificiation_code`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `status`, `device_token`, `avatar`, `avatar_original`, `address`, `country`, `state`, `city`, `postal_code`, `phone`, `balance`, `banned`, `referral_code`, `customer_package_id`, `remaining_uploads`, `created_at`, `updated_at`, `created_by`, `updated_by`, `deleted_at`, `deleted_by`) VALUES
(1, NULL, NULL, 'admin', 'admin', 'admin@homeiq.com', NULL, 0, NULL, NULL, NULL, NULL, 0, '2023-02-24 20:02:20', NULL, NULL, '$2y$12$SfuI4RHZOWAyQ4Zri1wrEujk3Pf6Bi1RcRhVX/p8nrd/8/9RN5GKu', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2023-02-24 20:50:20', '2023-02-24 20:50:20', NULL, NULL, NULL, NULL),
(3, NULL, NULL, 'seller', 'Mr. Seller', 'seller@example.com', NULL, 0, NULL, NULL, NULL, NULL, 0, '2018-12-12 02:00:00', NULL, NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', NULL, NULL, NULL, 'frCWh8cA9TY32rC1ot0DH4Xxshsko76IZ66oZ2dSWOjPnvX30aIYSSTpe7Pb', 0, NULL, 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', NULL, 'Demo address', 'US', NULL, 'Demo city', '1234', NULL, 0.00, 0, '3dLUoHsR1l', NULL, NULL, '2018-10-07 11:42:57', '2020-03-05 09:33:22', NULL, NULL, NULL, NULL),
(8, NULL, NULL, 'customer', 'Mr. Customer', 'customer@example.com', NULL, 0, NULL, NULL, NULL, NULL, 0, '2018-12-12 02:00:00', NULL, NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', NULL, NULL, NULL, '9ndcz5o7xgnuxctJIbvUQcP41QKmgnWCc7JDSnWdHOvipOP2AijpamCNafEe', 0, NULL, 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', NULL, 'Demo address', 'US', NULL, 'Demo city', '1234', NULL, 0.00, 0, '8zJTyXTlTT', NULL, NULL, '2018-10-07 11:42:57', '2020-03-03 12:26:11', NULL, NULL, NULL, NULL),
(9, NULL, NULL, 'admin', 'admin', 'admin@admin.com', NULL, 0, NULL, NULL, NULL, NULL, 0, '2023-02-24 15:02:20', NULL, NULL, '$2y$10$SZQz6.VKeBrC2uq2R7A3GOKnaAB8PQ.9FPvyPkPBGCbZmCQDGE7EW', NULL, NULL, NULL, 'QVFN2KBp2xiprVlkT2Ud7FYBxTKXphZdwb48qEHYvokLyFYIqlP1IMHHPIVc', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2023-02-24 15:50:20', '2023-02-24 15:50:20', NULL, NULL, NULL, NULL),
(10, NULL, NULL, 'customer', 'Jisha', 'jisha1@yopmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, '2023-02-28 16:02:54', NULL, NULL, '$2y$10$Uj8997WyQkzvtGP4Nv9xIuyobn1mVtGDBjS8RhMqhpSockq9qZ5L.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, NULL, 0, '2023-02-28 16:40:54', '2023-02-28 16:40:54', NULL, NULL, NULL, NULL),
(11, NULL, NULL, 'customer', 'Beatrice Talley', 'hihuru@mailinator.com', NULL, 0, NULL, NULL, NULL, NULL, 0, '2023-04-11 20:28:48', NULL, 'A43SAQI88wOK9CFk5X0nhcEyOBraihql', '$2y$10$ttoR7zVOlbnhvH4h97G2YuNqolbzAgO37LEcBv33RExq.3McnZr72', NULL, NULL, NULL, 'pGpP6q1gD5KbVaudIADjBZsb5154NuEvslFA4qAf6BSJU6d5IGarj5B8qmwp', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2023-03-01 16:34:53', '2023-03-02 18:14:01', NULL, NULL, NULL, NULL),
(12, NULL, NULL, 'customer', 'Tst api', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, '212209', NULL, '$2y$10$EAVZ4tBtF3F3tm.kJMIK3eccNi/qmxT/ZTSWfXYUHY4Tm2pvvoNY.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdasdas@asdas.com', 0.00, 0, NULL, NULL, 0, '2023-05-01 13:23:02', '2024-11-15 14:16:00', NULL, NULL, NULL, NULL),
(13, NULL, NULL, 'staff', 'Jisha P', 'jishaaa@yopmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$KaTTv3ebBQiZWl9ioKf47ejj8XLWqEG6lD/jzLYKrMjc1Yr1Qvq.C', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1122334455', 0.00, 0, NULL, NULL, 0, '2023-05-01 18:16:11', '2024-10-16 13:46:15', NULL, NULL, NULL, NULL),
(52, NULL, NULL, 'staff', 'Abhinandh', 'abhi@yopmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$aK8fKjfuTTIGNbg3yus4qOQMvKzOifSO57qAT2nwsW0IGyJ4kgccq', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123454321', 0.00, 0, NULL, NULL, 0, '2024-10-16 13:47:00', '2024-10-16 13:47:00', NULL, NULL, NULL, NULL),
(54, NULL, NULL, 'customer', 'jisha', 'jishacustomer@yopmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$JGqlNyiRM5B4Qrmusv9QpeXykNxGvJCRAHzj1O9h33/h38BjXGNcW', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-11-26 22:24:10', '2024-11-26 22:24:10', NULL, NULL, NULL, NULL),
(55, NULL, NULL, 'customer', 'Dhanya', 'dhanya@123.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$bo55OTEKU7XYQNeGrXPGt.E2Ilzp3Ibar2Zvlf/Rrh0umeXSBvDWm', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-11-27 02:39:53', '2024-11-27 02:39:53', NULL, NULL, NULL, NULL),
(56, NULL, NULL, 'customer', 'test', 'test@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$6fgFdRj76ZAStzR5OxI0ueUrfvg8a9o0w8zb657KdpS3m9evHZjZ6', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-11-29 15:39:20', '2024-11-29 15:39:20', NULL, NULL, NULL, NULL),
(58, NULL, NULL, 'customer', 'Sarah John', 'jisha.jisha94@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$L9urSV.O3BCaHNQ05CCD8uIp9cgsjuMz6bCBqFapJjS//0VfcCvRG', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-11-29 22:38:44', '2024-11-29 22:38:44', NULL, NULL, NULL, NULL),
(59, NULL, NULL, 'customer', '12343#$%R#$', 'tester@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$oWOaXzXSVpxy7jo6fbY0HeON3NaRBDn9op6zpvuOcEsLp8F8quCR.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-12-04 20:14:13', '2024-12-04 20:14:13', NULL, NULL, NULL, NULL),
(60, NULL, NULL, 'customer', 'Nevetha Test', 'nevetha.tomsher@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$G8ib7YLxgGGyze7J.5w3yetIA/nivzxH9WBAkbE1oi5aPtxP6vc2m', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sdfsvff#$%dvdf', 0.00, 0, NULL, NULL, 0, '2024-12-04 20:15:45', '2024-12-04 21:36:37', NULL, NULL, NULL, NULL),
(61, NULL, NULL, 'customer', 'Test User', 'test123@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$bgFVB5vQrzAeTvUrwdMQLef9jN/d3LvURIxXelk6RzDQEVoqOzjuS', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-12-05 16:38:45', '2024-12-05 16:38:45', NULL, NULL, NULL, NULL),
(62, NULL, NULL, 'customer', 'Jisha', 'jisha@yopmail.com', '47854962141994', 0, '/storage/profile/1733894444_6759212c0fc1e.png', '/storage/profile/1733894444_6759212c1332f.png', NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$7c6oGYrQ6PtuUkZ59KSyYOaLiVUbWY5XJhZY3ziQ.vFDWDNSnDAym', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-12-09 18:05:13', '2024-12-11 13:20:44', NULL, NULL, NULL, NULL),
(63, NULL, NULL, 'customer', 'ntest', 'ntest@gmail.com', 'dgfvdfgvgfdvfb', 1, '/storage/profile/1734529988_6762d3c46ba3a.jpg', '/storage/profile/1734529988_6762d3c46ce69.jpg', NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$lvzFgl9ZK5mDZ2ExsTBPgOvpzMWj.mOx8w7cu6KGhdMj85hDTEXTy', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'regfdgvdgvdf', 0.00, 0, NULL, NULL, 0, '2024-12-18 21:47:58', '2024-12-18 21:58:43', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(25) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) NOT NULL,
  `business_type` varchar(255) DEFAULT NULL,
  `profit_share` decimal(5,2) DEFAULT 0.00,
  `registration_number` varchar(255) DEFAULT NULL,
  `trade_license` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('pending','approved','cancelled','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `email`, `phone`, `account_holder_name`, `account_number`, `branch_name`, `ifsc_code`, `password`, `remember_token`, `business_name`, `business_type`, `profit_share`, `registration_number`, `trade_license`, `address`, `logo`, `is_active`, `status`, `created_at`, `updated_at`) VALUES
(1, 'guest', 'guest@gmail.com', '12345678900', NULL, NULL, NULL, NULL, '$2y$12$6yf9XRYkBJLx9tBMf.urz.t.3I24e.J89/O3h7eBQFBdj25tJT/qG', NULL, 'ABC Technology', 'Jewellery', 1.00, NULL, 'vendors/licenses/klMqKKeab5OpO4gPhZDeMVL8rpxKqWDpHAI2XIip.pdf', 'Dubai, UAE', 'vendors/logos/QYKDcdvIBhvtWdFgMTfn0mtZBwl6tOaZogkOpfrI.webp', 1, 'pending', '2024-11-28 10:56:50', '2024-11-30 17:16:19'),
(2, 'Test Vendor', 'test@gmail.com', '9876543210', NULL, NULL, NULL, NULL, '$2y$12$6yf9XRYkBJLx9tBMf.urz.t.3I24e.J89/O3h7eBQFBdj25tJT/qG', NULL, 'XYZ Technologies', 'Gold Smith', 1.00, NULL, 'vendors/licenses/iqf1HnX9rOg7lmXsMcmhdCaVno1uoldSSBR7PjsK.pdf', 'Dubai, UAE', 'vendors/logos/fF5TK9VqxqsF4yTq28WpcRiiG2gUBNoCmoXL5IIC.png', 1, 'pending', '2024-11-29 02:07:02', '2024-11-30 17:23:08'),
(6, 'Test Vendor', 'vendornew@gmail.com', '12345678900', NULL, NULL, NULL, NULL, '$2y$12$VMMb3ACNRT6A1OwmyR1UNeuAf168aiGZgPBnP/qg7ftEvjPzWSimC', NULL, 'MNM Business', 'Trading', 1.00, NULL, 'vendors/licenses/aRnLDHRZqHQxRGWfXMXN73b2tSrG9QrN07KcZwva.pdf', 'Ajman, UAE', 'vendors/logos/stmZbMwDLa6ffu9DtkweInop5KFsTsIy5cl3oZ1s.jpg', 0, 'pending', '2024-11-30 20:56:02', '2024-11-30 20:56:02'),
(7, 'Jisha Seller', 'jishaseller@yopmail.com', '971568650838', NULL, NULL, NULL, NULL, '$2y$12$tZbOa8BpRf9Ab2n5pVjW8e//FCHI0j.5hZVveMVzmbk1NXfI3qf1u', NULL, 'Wonder World', 'Online', 5.00, NULL, 'vendors/licenses/kpBsSRpuyjxsq97sw0GcZxK3bFQDh4OHoiH4TWUF.jpg', 'Wafi residence,\r\nDubai Healthcare City', 'vendors/logos/4m2UNSUQvscst4VAqrJP8g2GAlMJx7wl6pzVIRIS.jpg', 1, 'pending', '2024-12-14 14:10:00', '2024-12-14 14:14:19'),
(8, 'thtrh', 'admin@zaiba.com', 'hrhyth', NULL, NULL, NULL, NULL, '$2y$12$SJfDR/PS4FOjvzVPvAGNw.e.VVUknWFmbgvplrbtmvklj7.Fvbgu6', NULL, 'fhfh', 'yhygt', 1.00, NULL, 'vendors/licenses/wWXYt3ymFXj6zxUMGg1uBFcM2rmtQ0p9y4xnQzC1.txt', 'yhyth', 'vendors/logos/AdhLzNHTfTH3mtoExtYGCoMRMzFjYVVxbovCJO2w.txt', 0, 'pending', '2024-12-18 18:34:21', '2024-12-18 18:34:21'),
(9, 'Test Vendor', 'awsed@gmail.com', '9876543211', NULL, NULL, NULL, NULL, '$2y$12$x3Vf8taIt42D064DjR4EgOrRL.URj3MGWYL6UdOPpkI0VsJGzmAze', NULL, 'MNM Business', 'Trading', 1.00, NULL, 'vendors/licenses/vlwJIzzzYoumBHigZJXjtmis8gR9FvObGWxvF7SI.jpg', 'sdx', 'vendors/logos/V1AAa8xCjEEgYNl3eyA34SkYnZ8kCNDDd78lpzPS.jpg', 0, 'pending', '2024-12-18 18:38:43', '2024-12-18 18:38:43'),
(10, 'vendor test', 'vtest@gmail.com', 'sdfvdgvfd', NULL, NULL, NULL, NULL, '$2y$12$l88yv6Flkfx2ZSg4EdxZ0uMqcjF1Auo6B3yDK7O7ZofdSU4vEB6Dm', NULL, 'shaso designs', 'jewellery', 1.00, NULL, 'vendors/licenses/CM8mjlbUTEnbGlbhaT7b5v45VMFZwWmA8b5Sjb8M.jpg', 'tefcdfvx', 'vendors/logos/ZKjwMT4m3r4hv6rErwRG06R8d4dU91rcnjTwl29Z.jpg', 0, 'pending', '2024-12-18 22:48:33', '2024-12-18 22:48:33'),
(12, 'vendortest', 'vendortest@gmail.com', 'sdfvdvdfgv', NULL, NULL, NULL, NULL, '$2y$12$MPgtaIfeyey7WRfbKIiSVOPi1wJPxeGgU92DRIaDwgxn9bPiuNOaG', NULL, 'shaso', 'jewels', 1.00, NULL, 'vendors/licenses/VftAKbAxnRaBdk1c0FAZNmYLmCOFH1n1sBBs6CGQ.jpg', 'dfgfh', 'vendors/logos/veKfDUw0BShmn9fjiLL6tvT8FDgRBcBp26gqIYlm.jpg', 1, 'pending', '2024-12-18 22:52:03', '2024-12-18 22:54:36'),
(13, 'Vendor N', 'vendor.n@yopmail.com', 'dscdfvdfv#$%cv', NULL, NULL, NULL, NULL, '$2y$12$Vb1NEaSzpVNS995UJ9ot..0aEgknXFBPEjQXALsUqSsEg/I4sB7yu', NULL, 'N designs', 'fashion', 10.00, NULL, 'vendors/licenses/Nxt9TEFh7VnWV66mSdHNDjkJLVZvjgn0AyWjwN7B.jpg', 'test adres', 'vendors/logos/RotDIdQ4Hgh3Lt4iEDRDuFdSNrbqgU2AU7uySerz.webp', 1, 'pending', '2024-12-19 18:25:31', '2025-08-23 08:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_stock_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `product_stock_id`, `created_at`, `updated_at`) VALUES
(1, 56, 32, 9, '2024-12-04 14:04:51', '2024-12-04 14:04:51'),
(8, 60, 33, 12, '2024-12-04 22:18:00', '2024-12-04 22:18:00'),
(10, 9, 39, 19, '2024-12-04 22:45:14', '2024-12-04 22:45:14'),
(11, 60, 35, 15, '2024-12-05 15:14:05', '2024-12-05 15:14:05'),
(12, 56, 38, 18, '2024-12-18 21:09:10', '2024-12-18 21:09:10'),
(13, 63, 38, 18, '2024-12-18 22:11:14', '2024-12-18 22:11:14'),
(15, 58, 32, 9, '2024-12-24 20:02:33', '2024-12-24 20:02:33'),
(16, 58, 34, 13, '2024-12-24 20:02:35', '2024-12-24 20:02:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abilities`
--
ALTER TABLE `abilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abilities_scope_index` (`scope`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `app_translations`
--
ALTER TABLE `app_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_category`
--
ALTER TABLE `attribute_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `attribute_value_translations`
--
ALTER TABLE `attribute_value_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_value_id` (`attribute_value_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_translations`
--
ALTER TABLE `banner_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_id` (`banner_id`),
  ADD KEY `image` (`image`),
  ADD KEY `mobile_image` (`mobile_image`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_translations`
--
ALTER TABLE `brand_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_stock_id` (`product_stock_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_translations`
--
ALTER TABLE `city_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collection_products`
--
ALTER TABLE `collection_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collection_product_product`
--
ALTER TABLE `collection_product_product`
  ADD PRIMARY KEY (`collection_product_id`,`product_id`),
  ADD KEY `fk_product` (`product_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `firebase_notifications`
--
ALTER TABLE `firebase_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `mortgages`
--
ALTER TABLE `mortgages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `occasions`
--
ALTER TABLE `occasions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `occasion_translations`
--
ALTER TABLE `occasion_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occasion_id` (`occasion_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_stock_id` (`product_stock_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `unit_price` (`unit_price`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `occasion_id` (`occasion_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_vendor_id` (`vendor_id`),
  ADD KEY `auction_winner` (`auction_winner`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_ibfk_1` (`attribute_id`),
  ADD KEY `product_attributes_ibfk_2` (`attribute_value_id`),
  ADD KEY `product_attributes_ibfk_3` (`product_id`),
  ADD KEY `product_attributes_ibfk_4` (`product_varient_id`);

--
-- Indexes for table `product_seos`
--
ALTER TABLE `product_seos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_tabs`
--
ALTER TABLE `product_tabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `fk_projects_parent` (`parent_id`);

--
-- Indexes for table `project_translations`
--
ALTER TABLE `project_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_project_translation_project` (`project_id`);

--
-- Indexes for table `recently_viewed_products`
--
ALTER TABLE `recently_viewed_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rent_orders`
--
ALTER TABLE `rent_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rent_orders_user_id_foreign` (`user_id`),
  ADD KEY `rent_orders_product_id_foreign` (`product_id`),
  ADD KEY `rent_orders_product_stock_id_foreign` (`product_stock_id`);

--
-- Indexes for table `rent_order_tracking`
--
ALTER TABLE `rent_order_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `role_translations`
--
ALTER TABLE `role_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `fk_services_parent` (`parent_id`);

--
-- Indexes for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_service_translation_service` (`service_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD PRIMARY KEY (`shop_id`,`user_id`),
  ADD KEY `shop_user_shop_id_index` (`shop_id`),
  ADD KEY `shop_user_user_id_index` (`user_id`);

--
-- Indexes for table `shop_users`
--
ALTER TABLE `shop_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_users_shop_id_foreign` (`shop_id`),
  ADD KEY `shop_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_stock_id` (`product_stock_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abilities`
--
ALTER TABLE `abilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_translations`
--
ALTER TABLE `app_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attribute_category`
--
ALTER TABLE `attribute_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `attribute_value_translations`
--
ALTER TABLE `attribute_value_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `banner_translations`
--
ALTER TABLE `banner_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brand_translations`
--
ALTER TABLE `brand_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48357;

--
-- AUTO_INCREMENT for table `city_translations`
--
ALTER TABLE `city_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collection_products`
--
ALTER TABLE `collection_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `firebase_notifications`
--
ALTER TABLE `firebase_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mortgages`
--
ALTER TABLE `mortgages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `occasions`
--
ALTER TABLE `occasions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `occasion_translations`
--
ALTER TABLE `occasion_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `product_seos`
--
ALTER TABLE `product_seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_tabs`
--
ALTER TABLE `product_tabs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_translations`
--
ALTER TABLE `project_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recently_viewed_products`
--
ALTER TABLE `recently_viewed_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=800;

--
-- AUTO_INCREMENT for table `rent_orders`
--
ALTER TABLE `rent_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `rent_order_tracking`
--
ALTER TABLE `rent_order_tracking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `role_translations`
--
ALTER TABLE `role_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_translations`
--
ALTER TABLE `service_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `shop_users`
--
ALTER TABLE `shop_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4122;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27194;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  ADD CONSTRAINT `admin_menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD CONSTRAINT `attribute_translations_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_value_translations`
--
ALTER TABLE `attribute_value_translations`
  ADD CONSTRAINT `attribute_value_translations_ibfk_1` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banner_translations`
--
ALTER TABLE `banner_translations`
  ADD CONSTRAINT `banner_translations_ibfk_1` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner_translations_ibfk_2` FOREIGN KEY (`image`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `banner_translations_ibfk_3` FOREIGN KEY (`mobile_image`) REFERENCES `uploads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `brand_translations`
--
ALTER TABLE `brand_translations`
  ADD CONSTRAINT `brand_translations_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_stock_id`) REFERENCES `product_stocks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collection_product_product`
--
ALTER TABLE `collection_product_product`
  ADD CONSTRAINT `fk_collection_product` FOREIGN KEY (`collection_product_id`) REFERENCES `collection_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `commissions`
--
ALTER TABLE `commissions`
  ADD CONSTRAINT `commissions_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commissions_ibfk_3` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD CONSTRAINT `coupon_usages_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `occasion_translations`
--
ALTER TABLE `occasion_translations`
  ADD CONSTRAINT `occasion_translations_ibfk_1` FOREIGN KEY (`occasion_id`) REFERENCES `occasions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_stock_id`) REFERENCES `product_stocks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD CONSTRAINT `order_payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD CONSTRAINT `order_tracking_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`occasion_id`) REFERENCES `occasions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_5` FOREIGN KEY (`auction_winner`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_ibfk_2` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attributes_ibfk_4` FOREIGN KEY (`product_varient_id`) REFERENCES `product_stocks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_seos`
--
ALTER TABLE `product_seos`
  ADD CONSTRAINT `product_seos_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD CONSTRAINT `product_stocks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tabs`
--
ALTER TABLE `product_tabs`
  ADD CONSTRAINT `product_tabs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD CONSTRAINT `product_translations_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_projects_parent` FOREIGN KEY (`parent_id`) REFERENCES `projects` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `project_translations`
--
ALTER TABLE `project_translations`
  ADD CONSTRAINT `fk_project_translation_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recently_viewed_products`
--
ALTER TABLE `recently_viewed_products`
  ADD CONSTRAINT `recently_viewed_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recently_viewed_products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_services_parent` FOREIGN KEY (`parent_id`) REFERENCES `services` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD CONSTRAINT `fk_service_translation_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`product_stock_id`) REFERENCES `product_stocks` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
