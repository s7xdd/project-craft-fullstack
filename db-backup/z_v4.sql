-- phpMyAdmin SQL Dump
-- version 5.2.2deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 02, 2025 at 04:22 AM
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
(1, 'Header', '2025-08-23 05:16:57', '2025-08-23 09:17:13'),
(2, 'Footer', '2025-09-01 00:24:18', '2025-09-01 00:24:18');

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

--
-- Dumping data for table `admin_menu_items`
--

INSERT INTO `admin_menu_items` (`id`, `label`, `link`, `parent_id`, `sort`, `class`, `menu_id`, `depth`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', 0, 0, NULL, 1, 0, '2025-08-31 19:32:50', '2025-08-31 19:32:58'),
(2, 'Kits', '/shop', 0, 1, NULL, 1, 0, '2025-08-31 19:32:58', '2025-08-31 19:38:04'),
(3, 'Offers', '/shop', 0, 2, NULL, 1, 0, '2025-08-31 19:38:04', '2025-08-31 19:38:14'),
(4, 'Shop', '/shop', 0, 3, NULL, 1, 0, '2025-08-31 19:38:14', '2025-08-31 19:38:23'),
(5, 'About us', '/about-us', 0, 8, NULL, 1, 0, '2025-08-31 19:38:23', '2025-08-31 19:39:42'),
(6, 'Contact us', '/contact-us', 0, 9, NULL, 1, 0, '2025-08-31 19:38:31', '2025-08-31 19:39:42'),
(7, 'Shop List', '#', 4, 6, NULL, 1, 1, '2025-08-31 19:38:44', '2025-08-31 19:39:42'),
(8, 'Product Listing', '/products', 7, 7, NULL, 1, 2, '2025-08-31 19:38:55', '2025-09-01 04:00:34'),
(9, 'Shop Details', '#', 4, 4, NULL, 1, 1, '2025-08-31 19:39:10', '2025-08-31 19:39:42'),
(10, 'Shop Details', '/shop', 9, 5, NULL, 1, 2, '2025-08-31 19:39:17', '2025-08-31 19:39:46'),
(11, 'Resources', '/', 0, 0, NULL, 2, 0, '2025-09-01 00:24:33', '2025-09-01 00:24:40'),
(12, 'Contact us', '/', 13, 3, NULL, 2, 1, '2025-09-01 00:24:40', '2025-09-01 00:25:04'),
(13, 'Support', '/', 0, 2, NULL, 2, 0, '2025-09-01 00:24:53', '2025-09-01 00:25:04'),
(14, 'Account', '/hello', 11, 1, NULL, 2, 1, '2025-09-01 00:24:57', '2025-09-01 00:27:12'),
(15, 'Help', '/', 0, 4, NULL, 2, 0, '2025-09-01 00:27:31', '2025-09-01 00:27:31');

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
(5, 'Size', 1, '2024-11-04 17:33:37', '2025-08-24 08:56:04'),
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
(9, 7, 'en', 78, 78, NULL, NULL, NULL, '2024-11-21 14:09:33', '2024-11-21 14:09:33'),
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
(78, 'facebook_link', 'https://www.facebook.com/ddd', NULL, '2020-11-16 15:26:36', '2025-09-01 00:40:00'),
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
(154, 'helpline_number', 'Supper Value Deals - Save more with coupons 2BD30X', NULL, '2023-07-08 10:52:39', '2025-08-31 21:41:11'),
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
(184, 'payment_method_images', '79,86,85,84', NULL, '2024-02-09 17:51:44', '2025-09-01 00:40:00'),
(185, 'footer_address', 'Deira & Al Qouz , Dubai, United Arab Emirates', 'en', '2024-02-09 17:58:38', '2024-02-09 17:58:38'),
(186, 'footer_phone', '+971 4 226 4212', NULL, '2024-02-09 17:58:38', '2024-02-09 17:58:38'),
(187, 'footer_email', 'info@zaiba-jew.com', NULL, '2024-02-09 17:58:38', '2024-02-09 17:58:38'),
(188, 'working_hours', 'Mon - Fri: 10:00 - 18:00', 'en', '2024-02-09 17:58:38', '2024-02-09 17:58:38'),
(189, 'footer_working_hours', 'Mon - Fri: 10:00 - 18:00', 'en', '2024-02-09 18:10:35', '2024-02-09 18:10:35'),
(190, 'helpline_title', 'Open Hours: Mon - Fri 8am - 6pm', NULL, '2024-02-09 18:42:41', '2025-08-31 21:41:11'),
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
(219, 'site_motto', 'ssss', NULL, '2025-08-23 10:08:53', '2025-09-01 00:19:17'),
(220, 'site_icon', '89', NULL, '2025-08-23 10:08:53', '2025-09-01 11:53:45'),
(221, 'base_color', NULL, NULL, '2025-08-23 10:08:53', '2025-08-23 10:08:53'),
(222, 'base_hov_color', NULL, NULL, '2025-08-23 10:08:53', '2025-08-23 10:08:53'),
(223, 'site_icon_light', '89', NULL, '2025-09-01 10:43:58', '2025-09-01 11:54:10');

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
(6, NULL, 'Test Category 1', 0, 1, '2025-09-02 08:10:04', '2025-09-02 08:10:04');

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
(10, 6, 'en', 'Test Category 1', 'test-category-1', 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-09-02 08:10:04', '2025-09-02 08:10:04');

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
(1, 'dsds', 'sddsds', NULL, NULL, 'home', 'top', '2025-08-23 09:01:41', '2025-08-31 20:59:28'),
(2, 'ssdsd', 'dds', NULL, NULL, 'home', 'middle', '2025-08-23 09:02:19', '2025-08-31 21:00:33');

-- --------------------------------------------------------

--
-- Table structure for table `collection_product_product`
--

CREATE TABLE `collection_product_product` (
  `collection_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, 'Terry D', 'rachel@oval9.com', '3128780396', 'general_enquiry', 'Do you need help with graphic design - brochures, banners, flyers, advertisements, social media posts, logos etc?\r\n\r\nWe charge a low fixed monthly fee. Let me know if you\'re interested and would like to see our portfolio.', '2025-05-22 11:23:20', '2025-05-22 11:23:20'),
(10, 'dssd dsds', 'sdds@gmail.com', '9923322332', 'dssdds', 'dsdsdssdds', '2025-09-01 18:16:01', '2025-09-01 18:16:01');

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
(1, 'Slider 1', 88, 72, NULL, NULL, 'test', 'occasion', 'occasion', 1, 'tedt', 2, 1, '2024-11-20 13:17:39', '2025-09-01 11:49:34'),
(2, 'Slider 2', 71, 71, NULL, NULL, 'test', 'category', 'category', 1, NULL, 1, 1, '2024-11-20 13:30:05', '2024-11-20 17:50:19');

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

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(12, 'default', '{\"uuid\":\"cc97fcd4-c5d7-462f-a693-912fc2680f45\",\"displayName\":\"App\\\\Mail\\\\ContactEnquiry\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":15:{s:8:\\\"mailable\\\";O:23:\\\"App\\\\Mail\\\\ContactEnquiry\\\":2:{s:7:\\\"contact\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\Contacts\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:3:\\\"job\\\";N;}\"}}', 0, NULL, 1756736161, 1756736161);

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
(1, 'English', 'en', 'en', 0, 1, '2019-01-20 20:13:20', '2019-01-20 20:13:20');

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
(28, NULL, '20250901-15241657', 9, NULL, '{\"name\":\"Test\",\"email\":\"Test@gmail.com\",\"address\":\"dsdsdsds\",\"zipcode\":\"33232\",\"city\":\"dsdsds\",\"phone\":\"2323322323\"}', '{\"name\":\"Test\",\"email\":\"Test@gmail.com\",\"address\":\"dsdsdsds\",\"zipcode\":\"33232\",\"city\":\"dsdsds\",\"phone\":\"2323322323\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 300000.00, 300000.00, 0.00, NULL, 0.00, NULL, NULL, 1756740256, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2025-09-01 19:24:16', '2025-09-01 19:24:16'),
(29, NULL, '20250901-15310496', 9, NULL, '{\"name\":\"Test\",\"email\":\"test@gmail.com\",\"address\":\"sdsds\",\"zipcode\":\"2332232\",\"city\":\"dsdsdsds\",\"phone\":\"32232323\"}', '{\"name\":\"Test\",\"email\":\"test@gmail.com\",\"address\":\"sdsds\",\"zipcode\":\"2332232\",\"city\":\"dsdsdsds\",\"phone\":\"32232323\"}', '', 'pending', 'cod', 'un_paid', NULL, NULL, 'free_shipping', 0.00, 0.0000, 5000.00, 5000.00, 0.00, NULL, 0.00, NULL, NULL, 1756740664, 0, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, '2025-09-01 19:31:04', '2025-09-01 19:31:04');

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
(37, 28, 'pending', 'The order has been placed successfully', '2025-09-01 15:24:16', '2025-09-01 19:24:16', '2025-09-01 19:24:16'),
(38, 29, 'pending', 'The order has been placed successfully', '2025-09-01 15:31:04', '2025-09-01 19:31:04', '2025-09-01 19:31:04');

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
(1, 'home', 'Home', '/storage/pages/image_3.webp,/storage/pages/image_4.png,/storage/pages/image_5.png', NULL, NULL, NULL, NULL, '/storage/videos/1734181450.mp4', 1, '2024-02-17 17:02:11', '2024-11-21 14:24:14'),
(7, 'contact_us', 'Contact Us', '/storage/pages/image_1.jpg', NULL, NULL, NULL, NULL, NULL, 1, '2024-02-17 17:02:11', '2024-12-24 20:42:27'),
(9, 'about_us', 'About Us', NULL, '', NULL, NULL, NULL, NULL, 1, '2024-02-17 17:02:11', '2025-08-31 09:39:11');

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
  `image1` longtext DEFAULT NULL,
  `image2` longtext DEFAULT NULL,
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
(1, 1, 'en', '', '', '', NULL, NULL, NULL, '', '', 'dsdssds', '[{\"icon\":[{\"storage\":\"base64\",\"name\":\"not-found-24bf5ca1-e02f-4654-bd71-8cff454d64c7.jpg\",\"url\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQEBLAEsAAD\\/4QEQRXhpZgAASUkqAAgAAAADAA4BAgDGAAAAMgAAABoBBQABAAAA+AAAABsBBQABAAAAAAEAAAAAAABXZWJzaXRlIHBhZ2Ugbm90IGZvdW5kIGVycm9yIDQwNC4gT29wcyB3b3JyaWVkIHJvYm90IGNoYXJhY3RlciBwZWVraW5nIG91dCBvZiBvdXRlciBzcGFjZS4gU2l0ZSBjcmFzaCBvbiB0ZWNobmljYWwgd29yayB3ZWIgZGVzaWduIHRlbXBsYXRlIHdpdGggY2hhdGJvdCBtYXNjb3QuIENhcnRvb24gb25saW5lIGJvdCBhc3Npc3RhbmNlIGZhaWx1cmUsAQAAAQAAACwBAAABAAAA\\/+EGOGh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyI+Cgk8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgoJCTxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6SXB0YzR4bXBDb3JlPSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wQ29yZS8xLjAveG1sbnMvIiAgIHhtbG5zOkdldHR5SW1hZ2VzR0lGVD0iaHR0cDovL3htcC5nZXR0eWltYWdlcy5jb20vZ2lmdC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBsdXM9Imh0dHA6Ly9ucy51c2VwbHVzLm9yZy9sZGYveG1wLzEuMC8iICB4bWxuczppcHRjRXh0PSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wRXh0LzIwMDgtMDItMjkvIiB4bWxuczp4bXBSaWdodHM9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9yaWdodHMvIiBwaG90b3Nob3A6Q3JlZGl0PSJHZXR0eSBJbWFnZXMiIEdldHR5SW1hZ2VzR0lGVDpBc3NldElEPSIxNDA0MDU5NzA2IiB4bXBSaWdodHM6V2ViU3RhdGVtZW50PSJodHRwczovL3d3dy5pc3RvY2twaG90by5jb20vbGVnYWwvbGljZW5zZS1hZ3JlZW1lbnQ\\/dXRtX21lZGl1bT1vcmdhbmljJmFtcDt1dG1fc291cmNlPWdvb2dsZSZhbXA7dXRtX2NhbXBhaWduPWlwdGN1cmwiIHBsdXM6RGF0YU1pbmluZz0iaHR0cDovL25zLnVzZXBsdXMub3JnL2xkZi92b2NhYi9ETUktUFJPSElCSVRFRC1FWENFUFRTRUFSQ0hFTkdJTkVJTkRFWElORyIgPgo8ZGM6Y3JlYXRvcj48cmRmOlNlcT48cmRmOmxpPmF6YXR2YWxlZXY8L3JkZjpsaT48L3JkZjpTZXE+PC9kYzpjcmVhdG9yPjxkYzpkZXNjcmlwdGlvbj48cmRmOkFsdD48cmRmOmxpIHhtbDpsYW5nPSJ4LWRlZmF1bHQiPldlYnNpdGUgcGFnZSBub3QgZm91bmQgZXJyb3IgNDA0LiBPb3BzIHdvcnJpZWQgcm9ib3QgY2hhcmFjdGVyIHBlZWtpbmcgb3V0IG9mIG91dGVyIHNwYWNlLiBTaXRlIGNyYXNoIG9uIHRlY2huaWNhbCB3b3JrIHdlYiBkZXNpZ24gdGVtcGxhdGUgd2l0aCBjaGF0Ym90IG1hc2NvdC4gQ2FydG9vbiBvbmxpbmUgYm90IGFzc2lzdGFuY2UgZmFpbHVyZTwvcmRmOmxpPjwvcmRmOkFsdD48L2RjOmRlc2NyaXB0aW9uPgo8cGx1czpMaWNlbnNvcj48cmRmOlNlcT48cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz48cGx1czpMaWNlbnNvclVSTD5odHRwczovL3d3dy5pc3RvY2twaG90by5jb20vcGhvdG8vbGljZW5zZS1nbTE0MDQwNTk3MDYtP3V0bV9tZWRpdW09b3JnYW5pYyZhbXA7dXRtX3NvdXJjZT1nb29nbGUmYW1wO3V0bV9jYW1wYWlnbj1pcHRjdXJsPC9wbHVzOkxpY2Vuc29yVVJMPjwvcmRmOmxpPjwvcmRmOlNlcT48L3BsdXM6TGljZW5zb3I+CgkJPC9yZGY6RGVzY3JpcHRpb24+Cgk8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSJ3Ij8+Cv\\/tAQhQaG90b3Nob3AgMy4wADhCSU0EBAAAAAAA6xwCUAAKYXphdHZhbGVldhwCeADGV2Vic2l0ZSBwYWdlIG5vdCBmb3VuZCBlcnJvciA0MDQuIE9vcHMgd29ycmllZCByb2JvdCBjaGFyYWN0ZXIgcGVla2luZyBvdXQgb2Ygb3V0ZXIgc3BhY2UuIFNpdGUgY3Jhc2ggb24gdGVjaG5pY2FsIHdvcmsgd2ViIGRlc2lnbiB0ZW1wbGF0ZSB3aXRoIGNoYXRib3QgbWFzY290LiBDYXJ0b29uIG9ubGluZSBib3QgYXNzaXN0YW5jZSBmYWlsdXJlHAJuAAxHZXR0eSBJbWFnZXMA\\/9sAQwAKBwcIBwYKCAgICwoKCw4YEA4NDQ4dFRYRGCMfJSQiHyIhJis3LyYpNCkhIjBBMTQ5Oz4+PiUuRElDPEg3PT47\\/9sAQwEKCwsODQ4cEBAcOygiKDs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7\\/8IAEQgBmAJkAwERAAIRAQMRAf\\/EABsAAQABBQEAAAAAAAAAAAAAAAAFAQIDBAYH\\/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAAezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQ17NesCYaxpZVBFxeuWM5sy7UtwAAAAAAAAAAAAAAAAAAAAAAAAAAAKGnZGbzG6mhqaNmpqWQAAgVLQqAKm3myEsjmykstm51AAAAAAAAAAAAAAAAAAAAAAAGvZC7zC9Mw+869IFS0CAAECgCoAArFChWJWans3oMa21AAAAAAAAAAAAAAAAAAAAFhA9Mc71xD7zRRUoIzRgoBAAqUgUAVAzRhoIFBBRUnM3rMblpQAAAAAAAAAAAAAAAAABr2cx1xz\\/XGlqIBQAgUALotAAgUAVAACBQQUBAnM3tcb3lAAAAAAAAAAAAAAAAGNOV7Y5btjFYAgFACKloAgAXS3mJKAultAAEChdFqgIAvjts76bOgAAAAAAAAAAAAAABD7zw\\/o5aeoAAgFAnuerTSs2ZcaRm5Mc9a9m1LFak1jWlZq2b+br0I2wAVigKCCgIGaMFI6vOu0zuoAAAAAAAAAAAAAKHId+fKdudAAAIBRUkcWwkM3cl1657pic56wGUh9SXzaxaXmCtY0LKgoBAoIKAgCsWg7DOuwzsAAAAAAAAAAAACw4T08YLpkUAAAgFACBtS6lgQAAgUAVAACLisYwoCBUoUgVPRsdJmUAAAAAAAAAAAC04D08YXpkCgLi0ARcWqAM0YSgAgAVKQKFxaqAAEChWKKAgCggCSl9Nx0qAAAAAAAAAAADifRy5rripQFAAAIBQBWKAlcamcakM0YTQ1mD3nRsFAFQAAipaViigIAoIAR6VnpLSgAAAAAAAAAAQPTHBenkBmjDVAC+JnGrTERW8lACN\\/N7Pj0lMaGMw0BgI\\/WOQ6417AVAArEnm5lERZjAEXFpQQBWOwzvr5oAAAAAAAAAAY08y9nHVsAAqWg6Xlvt\\/P1HJ9ufH9uZQBM89dxw6XS2GOgBQ0jME4bvy0rCoAGxL6nw63mjZ5f15UUBAFBACOlmu7zsAAAAAAAAAAct258b6OaAAKAqem+TvvZth5f6+GCy1QJDN9B83XLLrEbZr0KlC8lZdcFLOA7crC0F5Ydjz31vPY4fpz5jWSipkjECggBHSzXd52AAAAAAAAABQ8x9nDT1ECpQFAT3PffebqOc644bvyBQPQvN1lMa1ilAAADAWlSI3jkOuEC8rHqfDrnXXTy7tywhQEAVi0AR2Gd9hNAAAAAAAAAARe8+ceviEAAUB6P5e0rjVDzT1cI\\/UBRLYvf+bthLKoaiatYLMNWFEqt0SObtLkTzzvywgHU89drz6DkN44\\/phBQEAUEZjCI9Hz0mZQAAAAAAAAAOS78+R786xQAAoS2NejeXsIbefPPVxQCjruHTp+W9Gua3iM1LaAAAoI6nnvfl5brzgtZFT1Hh13JbDyzty1rEFAQBQRcWm1L6pjpcAAAAAAAAAAcD6eMF1yEAAVO+83Wc57Hnfp4ymNSGbrWcZ3wO883WWxrjOuI3UysSevNFZ9VjQE3rxZLmJx6tSdd\\/N6nG4PeOW6YuJ\\/Gu95dBzO88\\/rPS40ON3jVq0QBQQB22N9VNAAAAAAAAAADzf18IzcCAAN7N9M8nepG6z5r6+Ponl7TGNaGp5p6uNp6D5uu7jXn3fmJ3Xhi56pO+WDz7gJ3XhtXQnfRz22peu57ht45PpgemcOslLQ8x7cpbN7nn0HmXXnG2BAFBAkJfTcdLwAAAAAAAAAAeZ+vhobgQAB2\\/n69Jy2OE9HLnuuPRPL2mMa0NTzL1cR3Xn6ynPXAdudtbl4yevNFZ9WrOoF7OW51c9BuZvWY3A9McxvEzm+i8eog9Z8+68+kxruefQeZdecbYEXFpQReel46SUoAAAAAAAAAAHmvr4amphqsUANiX1Dx97zDZ576eVh2\\/n6Smdadnn\\/p5R+p1PHfScenG9caOoAAAKFIEjnXUY1yPXlD6nonHpNZ0OJ6YidZnsa67GxwXTnBamIQAEd9jfQzQAAAAAAAAAAA8+9XGF6ZCABMY16H5ewAAA17PK\\/Xx383vfN257WYHpkAXJN68WnO0dPRbAEzjU9m+fd+Vh6t5+uwoAAA846c4fUQBmjs876bOgAAAAAAAAAAAOM9HLl+2AgATGNeh+XsAAANezy318bo7Lh02sa4ztgASevNgm5G+eAx7gEdfz3D9Mc30yj1bz9dhQAAB5x05w+ogDtsb6nOgAAAAAAAAAAABA9McH6uVBAAzxJ40AB2HDpI51qWcP6OcNvI2I73zdoOyC6ZqDbvHfvCqQWPcKS9JjWzZxPbnYImc26UATeb1GNjiN457Wbjdl0LOoxrsM7AAAAAAAAAAAAAw2eW+zhZSAAKGeXBYB6J5e0xjWhqeZeriAN3N7fz9Y4gN51rBlubZcUu7nXQ5ta4rtyxWZZZ3GoTWcFAI6XGu559B5l157svUY3QzGzGwXAAAAAAAAAAAAAHAenjB9coqUAKAAE3z1tZuGoDpkZow0jKdVw6zeNaKR5jrJG+Zzn+mOf3kuZOq5dJHOrE5TriKud6Wq3SSUog7O859QMpkLo3C4AAAAAAAAAAAAEPvPnnr4oFSgKAAAQLl6fjvpuPTku\\/OB6YtloZEl+e9qMuNYV0emIreUbRuY3JRM42BaUNsyQOZ3jld4lc77HG7QVM5UyxtgAAAAAAAAAAAAsOX64ul0N557tztBQFxaC+XbzbEnee+p49MVWJDbzEU1nBVgS3nvTzZXpncL5dgG7jWzKBhMxUFTYjnd5j7JPG5IoZSpmKkhAAAAAAAAAAAAGua9YjGCH68+V78xQAujqePXoeW9coWm2AYUhd5rWKMlVIWWOyndTerDGYkc6yygDXMhlAAOQ3z7LHTbjSNWtkobcbwAAAAAAAAAAAMBrUMBaCicH6+OKygKnaebtP89aVWFphNwyAFpH6zF2ZgRCxsSZKWZ5ZLNqtAAaxcZi4wmrUhGrZ0ObU1jRMdbkbpcAAAAAAAAAAAUNGqGMxFSwxnMejlFdMVLSV577\\/AM3XSqwFphM5sgAFhq2YE0jTWUJOMy2GEAA1S8GQ4zU2I66WWi8AAAAAAAAAAAAAAFCNq0sMZaZYhqhPTx19Zw1U6jh13+W8xlBjMZeboAAAAABYYQADVLwDmbOzl3IzgAAAAAAAAAAAAAAA1DRq0tJWNgjdTju\\/LoeW5XGr5dSuVsjq7jNGAoXG8AAAAAADXKAAwmMvBlN6NwqAAAAAAAAAAAAAAAChhNc2TMAWmAsLS2qHFanW5uItBcbwAAAAAAMRjAANFMq3GYloyAAAAAAAAAAAAAAAAAAAAGE1aAtMBhKAsNs2AAAAAAAWmAAAGimCpmJWUAAAAAAAAAAAAAAAAAAAADEadYChYYwVNayYlAAAAAAAGsAAAZSSi4AAAAAAAAAAAAAAAAAAAAAGMjzXs4708pblvbzqyJuXIAAAAAAADXKAAFSUjIAAAAAAAAAAAAAAAAAAAAAAChC7zwXp5Y7N\\/Gu\\/8vahSgAAAAAABgLQACRjYAAAAAAAAAAAAAAAAAAAAAAAANWzke\\/OC3n0vyd7THQAAAAFhjLSgMZcXgG\\/G0AAAAAAAAAAAAAAAAAAAAAAAAADSsyS0MNAC00016AAvMkXlShgMAqTzZAzgAAAAAAAAAAAAAAAAAAAAAAAAAAFpiMJZWqaVm9LsgAAAAwFDLEgXgAAAAAAAAAAAAAAAAAAAAAAAAAAAAFppl5YW0AAABfFxsF4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABaWlpQAqXF5UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\/\\/8QAMBAAAQQBAgQGAgEEAwEAAAAAAgABAwQFEBESExQgFSEwMTRAIlA1IyQyMyVBgGD\\/2gAIAQEAAQUC\\/wDUpWIRT5CoyfK02T5iovG6y8crrxyBeOQLxyuvGqqbL03TZKm6G3XJMTF+6kuV4keZrCjzhI8vbJFdtGnIi9Db8e1ndkNyyCDL3BQZ11Hl6hqOaOX9jJPFC0uagBS5myaksTS9jNxP9Hd9Wd2eLJ24VDnAdQ2YbDfqiMQGfMQRqbK2pU7u76O3C+kQiZd7+b97kDxegzuz18vYhVbJV7P6eWaOAbGaXFNck9Tby+vVys9dVrcNof0RmMY2sypJDlL0vLbv\\/wAnljeKTV339Hf8e4DKM6GWGb9DcyMVVWLUtovSq8TULUTEMtXhAsfwqOlxg7OLljtiiqccUNMNoBY57VdprnQvzhgcofDvOKrxQ5AWG92Ptv6MnK1xuU4fvezXstv6joLHLo1phG1NaF6+0TlHcB4CJyPqovEwOvLW6qKWeJ2GXqISsdVDDIZ1o6rWovEgkgkqXZRmt6P7+ps+2mJyH3CIQG\\/kSsv9A7M8gfSEuEzLjPufbtxtzq6\\/2XdhbIX3tH2vt2+W3ZFI8UnobeWrvv8AVoWeltfZyt7mEvLb1mbWHG2ZlHho2Q4uozdBSRYymSkwqnpz1\\/UZ9tN329PGzc+j9fKXOnh1lAQk7BFzNsTbZ\\/CbikxtmKPurU5LT1qMNdcK3Zk59hTuKsY2GwpoZID7383ixtqaPwi4vCLikB45Ox227nfdYE\\/L6xm0YWJysT9rPs+mGr8c2maseXbQoPZcIxYHcYhc9+132YW4nUscdqO1VOrL3V4XsTiLAKuT9NV939PBv\\/d\\/WzVjhD0Pd6cHTVkRMA2JnsTttvrSqvanABYXfZO+6JzrLrJjX\\/IGuRcddNbQ1ZSd\\/bSaELcMkZRSO22pCQEsJX2bTNWOObVm3eSMopO\\/Bt\\/d\\/WtTdRZ138uzE1+da0zNjl1+2lW6eu77M77+i\\/vpla\\/Mi1MykKMHlkhiaGJTytBCRcyTvbbtwIfWyMvJpejjq\\/T1NL1jqbXZjYedcFE+7p3ZkVqAU+RgZPlBT5Ql4nKvEpl4nKvEn3isRzaMzG0sbxS64SvxSaZux6cUnKk0xUXKofVzknkmd278bX6i3pk5+VW7cOG0BeQySDEE1+WR3dy9FncXqz8+NvfLhw3NGZyerA1aujJgCxM88\\/pPtpWhexYZmZvq5guK93u+74qvyaumUsc+3RxkFip4NVVnFV4q2mNHaiauz82ZRg8kjY8tyFxfWvE0IBPDMrMTQyqkfDZWYb8EzbrD1+bZ0zVjggxtWO3N4LVXgtVWohhtM+3o4Wrwx\\/WyL73++lX6m1pfsdNVWK\\/j1d+E22mP+HK+2tP\\/AENNLzMhxcGsfBNUhpEMtuQJZVW+Ssv8fShX6appdsdTawfytMh8\\/wBClVe3YEWEfrXvnd+Gr8uDTMWOZYWK\\/j1d+Fpiy3pH7u3CSgsnCuoqsc8zzHqJOBPPK+tT5SzBaYuvz7emWscmozbvg\\/laZD5+rNv2ABSHRqDTg+vkG2vi8fLTu79leF55xFgFSkQxFRuEXh9tY6M4qSti51HoWhZYeT8Xfd7gcFv06Lb2llJOO6sXX5FTTJQW7Nrw+2sRVngsaXKNiS3JGcR9vusZj+mH7GWHhv8Adiv5D0J\\/jqlNyLSyYefYIuT9FCKsVXjfsxo\\/kRtDGRORKD4\\/oZX+R7JJZJzxmN5P2s4H9XuxX8h6E\\/x2ZyKQCikx1nnwWoudX7KDvz7W\\/UDuWO183etDyYsrY1g+P6GV\\/kezGY3l\\/bzEfHS7oZjgk8Xtrxe2vF7a8Xtrxe2qExz1FZN4qxZW0Q6QTFXlhmCeO9Tdn1rEITzVuaR8Favp7vUqcpW7TVIv8y0HLWxHxe4vF7i8YuLxi4sXentT6W8naitTTHPLFXmmT46ypIJYlisd9yWNpYiZxfT27Xk3i1xX8ervwuyraOrJDPHYCxjwleSCaFcTac02AjIlxMoqk0ygqxwKzaCqMkhSmo4ylN8S\\/DLDJCXZg\\/laZD59Ck0jf9JvMRPZM+\\/3MtByrejvu\\/oV8pLWh8cnUuXmli05MnBpHKcJwZMCZnYmmqwyJ8bC68MBNjYGUdeKNGQRtYyi4n4iZRQHKqdcYWRgMg3KJQIRI3GhZJPj7LKvPNj5fHJ145OjMrVnhYB0HRn2TPu32snX59TVtvT3fajjN0TCzXMfsZAQJm3d33eOWSJxys4pssC8TjRZVSZKySIiItndwqSknq8AQvzW22bR0EYRiMmzcwXRRxyNbxKdnF8cG8z+erPtqD7P9pyZk+Mg5nQVVNi\\/J2cX7GbfUQI01Ow6KrOKxlLdOW2hCxiYcLtEEsr0RT0iZdJIS6OVSRlE277hWiNDViFMzBLpDA0PY\\/8Ak3tq0qyFTmhjj3LnlHJ\\/UXMXumfZbpvf7JHoWuSrscXaIuRVcUy5IRgn8kJbFrLG0oNA8DKXyjbyZTxuCcvOtFwMpfb3QR8HayHun\\/s71WISY4k47rzAvdlCPn9gy1f30cWKOQHik7MfS5Qu7CxE5aF7IH3DV2YmOu7KVbrdWOLid2VUSZ90MByKKEYQ7R\\/xTPpJKETDerk6Ok1qfQ491JG+0bEhhd0zbN9j30d9eIUcrLIN\\/WXlssfDzLDfiJFxPoXsovftIBNFVB09R1LSnNeESKHH8tDEAaF7do6sSsSvNNVpyWVDXGMRbhb73\\/Tvs7loR7Jgd0VZ5I4YjGS5JzJ4ojmNbOsWO0B3oRQSBK2haR\\/7fVL27X\\/GbXpCe4IsAxj+hlDQ32aMd0Ee2lyEpYYcZPKosVACGvGCIG2KMSG5QeFQSvDL2R\\/7\\/pyhxgBcY6Rt+QNxP+iKJnT1t3GMQ7NlxrjdOTvo7bsdV+t9md99YPOT1i7pBeMhJjFR+4Dwj+pMN+ziZH5FqZcAQA4Q+sXt3HA7E9rgVL+rH+rIN0X4p330P31D+4m+uAcbszM36whYmONwRE0YBcmCQMjG66uu6ZztuADGH0H9+1m3cB4R\\/X36ZzwHGcRKiwvbAG2fyf6Be\\/bHHwt+xnrxWBtYeSNRu8U8aP8Ay9NyFlzomXUwLqoF1MCeeHdjEuyOPh\\/az1IbLBHy2k7XdhYrtcF1\\/EubcNcu8S6SV14fG6bH110VZdJXXSwLpK6KpX3ejC6A5ITZnJwjYf3G26eNOLtpYm5IDSeRDXhD03909VpQEWBv3bszoqolNy3Wz+kwO6aBMLD\\/APBbMuAVy2XLZcpctly2XAP\\/AIL\\/AP\\/EACkRAAEDAwQCAgICAwAAAAAAAAEAAhEQEjEgMEBQAyEEURNgFIAiMpD\\/2gAIAQMBAT8B\\/tLKkK4K4K5XK5XK5XBXBSFPdyFcFeripPAlXFXK4dncrip5Uq7rS5XHoZU9QXrPSz0pd9dUD0JdCJnbGEVChRSFCihyopChHPCB55d9bs+kFNJpPuk0lTSfdDwweaXTwZ6ActxnshynHiWlWq0K0K0K1RyhyHGNq0q0q06wJQEbBbtQrSrTut5BM7LRV51ATtkSiI1ip3Rx3naAip0gTukTrbV26OOfey0VcdQEbzhxm8Z2NpogVJk6W51SpUqVKlTsNq7eHGfstHurtTKzuuzoHTuzstHqrj7Qb6VoRaKtxQ0e60Sv5Q+kCDjR5X3mxqd43s\\/zleJ97ZoKOq2rkArVbtjjuzsATUmBRuKHFW40fI\\/3HtfjbEQvixJ0PuZ5L49LyfIBbAXhY5rYNBR1RUptTsjkHOw0VcaNxQ4q3GjyeIPX4vMRlePxhg0EAiCvxs+qijqCpo2p2RyHZ1jRBUFNxQ4UGjKHcFHZoKmVBTRUjYA5Ls6252TQZodJIGV\\/IeZgLxeYO9HOkbpzqA5T9bc7Jq06vkxYvDFghH158anHcOdIHLdjYuKuKuKuKuKGKFXGoQMojR5gSyAvH5rBa5Nu8r7hpJjRcVcVcVcVcUDUmsUA6luKHGkGEDKhRWxsyg0DFIoTot1NqUB0Lh73A6Fertc\\/dYUKKlylGgFSKQVBWFcrujcPXADaFtAjS5XKaEmsbZbRvR2BWhFm1aVBTRqhQiFFYUbxCb0zhrDfvoMHpz60tEbccYjp350NHvehQo7lx96GY\\/SCg0q0f05uKvUj9KcJq3P6XEot\\/TiJ\\/wCAX\\/\\/EACcRAAEDAgYCAwEBAQAAAAAAAAEAAhEQEgMgITAxQBNQMkFRYIBw\\/9oACAECAQE\\/Af8AUsFWlWFWFWFWFWFWFWFWFWFWlQfd2leMrxqwK0dCArQrFafZAEoYZQwwoA7UBWqPWDDKDAM57Vqj04BKGF+rRvpSPStw\\/wBUR6kj0LWEoNA23coFSrldS5EoniEUDAVylXKU3jpEd9uH+7saojTRAarXQK2kG2FrKjhFQYChayo0WsocdMjusZHRgegPbYyOgdfRHtYbI16heAvIryriryvIgQe0exhtk5Bm8jV5Gq8HOXQi4nYD1M7NwVwVw3T2AIEbOIdIrhj7zOdG2DCBnOajdPXwh97TjJqBAyudAywtFpmBjO81aN09dogbOIYFcMazmcZO8w\\/XWPWYJdtPMmrRAyvMDLCtKtVqtVqtVqjO81aN49bCGy8wKsEnNiVDdsijOMhM1HpML47OIZNWCAnPIK8hQeSav5o0VtyhSjR1GVeatCcYVxVxQ2j12fHYcYFWiTTE+VG81fzkFHZPpQjQ8UZUmTUCE+o49Cz47GIdYrhjSaYnyo3mr+aCgKkI5Zq6jKOOlWjWj6jjZPYZ8VrmJgTUK5qvanmTRvKuFMQUbuOo3ijjrVsBSE41B2Cezh\\/HPifHZHNHCRRuaERlchU7LeMxPaws+J8dkc1eIOYIr6zMH3U7LeMpPbwjrnIleNq8bV42rxtXjanCDQcqwVIlEQgcgRC4rKJTROS0K0K0K0K0JwioArNCe4DB3cT5UbzlLZREKVcpySrqATkvU5X1HCJ9DhmRuFgJXiCGGBWRUiUW\\/lZU5Az9RCClONQ6aXBSEdVarVx6LDMHoOf+Ua\\/9oTCAhRKsC8ahQg0UClTtB1Hej8hXkchifu1cFcE931llXK5ByuCNAVOQnaBTvTYbvrO7E\\/FPTJ3OQj6YGRle6dudid6Y9Ph8ZHmBvSpU0n27BARMVxOf4hsTqjiAI4hU1n\\/m8I\\/3g1RaCjhlWkLj+JYQDqpmj+P4sEhDEH2jqP40OI2IULRaKVKlSpUqVKn+An\\/V3\\/\\/EADwQAAECAwMHCwQCAQQDAAAAAAEAAgMRIRASMSAiMDJBUXEEEyMzQEJhcoGRoVBSkrFigqIUY4DBJDRg\\/9oACAEBAAY\\/Av8AlLnRmD+y69q62f8AUrF59FqxPZdXE+F1URdVEXVxPhYRPZa5H9V149lSPD\\/JUIP1rPjNHqs0Pf6LMggcSqOa3gFWO\\/3Wc4njoJz9MqhWbHf7rWD+LV0kH8SquLPMF0cRruB+oziRGt4ldG10T4WZdhrpIrneuRIdixxtmDJdZeG51VKNDLfFq6KIHfS7znBo3lShgxD8KjubH8VMmZtkdlsnxLgljLQYS0DWiHJwxdPHQzBkpP6VvjipB1132u+j3ojw0KXJ2f2cs+LMynnHSz7Rdf0jNxU4buI2j6Hee4NA2lXeTD+5V57i4+Ojx0AkAEWEgy3HIHhoZZYexxaRtCEOPJr9h2H6Dd14n2qcR3AbBo3vhwREfzkqsvUkuTl7WwIj53qSTYkOIIrS67Teog59hdDbNzUy9GYx0TUadqIOITmCOwxAJ3EIkSM2EHGTZ7VylsYgOhj2TGuMgSnta6GxkMVIbK6oTGxGubF1XhRYk+rIVzn2c5dvBm9c6+K2GCZNntUUNAA3DJphom81ewre32iDyg5vddu7dMow+THi\\/SCs06G15a8xJ03IRI5J8TWSa3nueeIodqSXK4zXOm6GZtLZXVCH+oMEwxIjm700XEzJKMe9mXZTl4KFDjRDDMInuzmuVF5LGxhIGU0xxwBXKQ5xEONg6WC5M2GS9kEmbpSnNR4cOMXmIQRmyUONezA2WHgmw4sQwzDcTqzmokRhm04W79LOVLRyaKfIf+u2FzjIDaubh5sL99huPiuc3cT2MOkDI4FF0g2ZwGWJeuTndYyju1EkyAVxlIQ+cqmSN+SHgAy+4aGfaWv7po7h2rmIZzBrHfZ46c1lbO5cbvdRdJGLvKF1TncSuo\\/yK1Xt4FdDH9HBdJDMt+zSYTslOmkYTi3NPaObYekf8DILWvDx9wyQ1omTQKsMH+y1B+SMR7QGj+WXm0YMXnAKbG33fe5VrZTIuipdsV6F0T\\/gq5EbI6ERGMzThVag\\/Jag\\/JFjsW0OjwkosPgezl7sBVOiu25U7THODMONreTjbV2VffSEPlBobdYMGqZo0fCpkzK5097DwFnNxRwO5XH+h35bIQ7xQa3AUFj4m3ZxU9I8fw7O3k471XaGQTYe3bxsLnYBPinvFVwyLuDRVxQDRJrcBZVZrC+HuGLV0XJneq7jFXlK\\/wDZX\\/kRrw+0ZBhPx7p3Iw3iTm5F1zS07jY7lB20baIAwZU8ciQ2ow36wx0Dz\\/Ds74m80yCMm+dWHX1tEEYxMeGUGd51X6Ycpbi2jsi89xcd5TYbcXGSbDbg0WOiuwaE57zV1dBUyyYsTgOzPO05o0TQdZ1XWufswbwyWz1WZxU99tVWK30qqXj6KkI+pVIQ91qMWqxajFnQ\\/YrNNdxsMN2DhJOhnFplkO5QcG0HG1vJx5naMPuNfLY7C1m9+d2aFD9bDLbltnqtqbbjdeJmjKiRPudKy+8yCzMxvys4k8dDMGRVdYY2XvvbO0AYlMhDYK2F7sAJlPinvHRiVjIQ2mqkMB2aX2tA0E5SV460StplqszQmxX35ncVjE91EiNL5tbPG2F4zPzYR3WUsDBtRm8eCkRLI5+JIiSMEMu3ldBnYB91LIDuIsxkudOrD\\/dogjF+PBOZEnINnRYxPdYxPdRIbcGlGmhPKHCrqN4dni8dA2HsxPC1z+8aNsh+v7sjeQqosgcP+0TutfJkyNqvXzNMJAyBCD8\\/dNXnyk35U2CyHxsg8Ta1neNXWvibMBwT\\/JbG82hDO7i4oNaJAdnjebQGMcX4cLeaGEP92Q\\/X92RvIbYf8SQii3cZWSGrOqBDdmMkam7sGReaZFHPNcbYdkFngTYCdVlTbdGtEpY\\/yWxvNoAxomTgrveOse0RfMn3gb\\/dsqchkId4oNbgKWOc1t5wFAi4wXTK6hyYx7brhOlkVrRMltFMwXSFkSF\\/YWP8a6QeAsI+wXbATrPzjaS2C4sbRq6hye6LDLRd22xnthOMzTxRY9t1w2ZfOxB0p\\/x7S7xAOXD9f1oYnlNjXnVwNjIn9cmTRMpl6Jj8ouYJw9+S9\\/onRXYNCLjibIflGhien6ybzzedghGjDpNg+3tUOJvEsuH6\\/rQxPKUAMSix2IV068OnonNGOzJpuqnTRz8iQqTggzbtQ5O3ZV3G2H5RoYnp+skR4wz+63d2u99hnliJD1gtYfitcfitcfitcfitcfimRImsbIj24tbMItLhI\\/xtERuz5QiMwPwjGhCneGQC8yC52G4SK5t2detkBMnYr76v\\/S\\/3HaoVXeptDQ4SH8Vrt\\/Fa7fxWu38Vrt\\/FObFIIDZ4WxIbHC600ojEiaxXRwyVSF\\/kukhlqHKIw8jf++2OhnvCSuu7ugay40S7205EP1\\/dkbyHJm2oOLd6vwzxG5X4ZuO+CukhmW8W3Lxks5xNmFxu8rNE3byvuibGoveZk2BjBMlUjC9ukrsRssl\\/ktjeZc9FGZsG9SFBZVV7bfGEStszoRCaxhA3rq4adDMNknCVt\\/m3Xd8rb8N0igI2Y7fsU2kEbws6GFQuHquseqlzvVZkMBTiODR4q7ycS\\/kVMmc1NUw3ouHvZce28FfZnQ\\/0pNaSfBdX7ldX8ou5upEs4Lqoa6qGr0pOiOQYMGiX0Ey1mVGRXRy3oRI44NUgr0KgOxZzZWzhvLeCk4Nes6AfRy6l6zYHu5UIZ5QrziSd5VAqi7xUwbxCF1XRstlvUmNAClJVClIEK\\/A9lIiRRf8AYpj6E5xLpE0aur\\/yU4Dv6uUiJEZJrbmtJ4LqiqwnIRog8oUhZIq65OkJNG5UeVrhXhKq2KslgusLpblqz4qQEg4Wl3ed8aHOXOsGePlRJ4mSuSPhKyoUx22QyefGs3HKutEyVejV8FQSt8DkFuHirp97HKVhecJ2Xr07wsDvtVFM62T65c26pqmxyMRmqbbZiyfaZZT2nAhFh2ZN5wzjj4aKRU2V8EGnfacbtl\\/YRZWgVK+Oim90lK9LjZDc7VZreNswsFKRVe3VWKuDagfCw79ll44MrluHrlZwBVJhUcFdBZdVXtQvRSQNio3QOG51tUXH0U9Vm9Bgm7ipfQ5N91MqTc0704xMRRGWDaK4wTNmCc7eVdMVTY4HJ\\/r2TzjIELYTj4INaJAKf0GYslvU1M2O5rrNizujHjiqi8fFZrQOAsLSKHcr7M5n6QcPXJ\\/r2SmsKhTFs\\/osy5UycMiRRgtwn8ZMR39ey86wTB1mq80zFklL6VMZM5VyC47EAccT2a\\/BN120bCulhvafBc9dIB1Z\\/VP9uGfc9okcNqkMB9NqvBF7sG1RcDrGZBWe0t+V1vwrsObYe129BrRIDs8gpfULsEy3jerr2lp8bGB4mCpCgHaJnH6ldismr0DpG7tqaSJFrtNVwXWM911rPdda33XWs911rPdZrgeByJnH6r0jK79qAnOQypkyXWA8F0UGI\\/0WbAa3zFVjMbwCzuVP9FnRIjvVapPqur+V1QXVNXVNXVhZoLT4FCHGN4HVeqLx+s0toJuNGhX+UuLnbtgWbDb7aW7EwUh9cwQizM2igsw0WCqVQf8AweFmKxWNmH\\/Av\\/\\/EACwQAQABAwEFCAMBAQEAAAAAAAERACExQRAgUWFxMECBkaGx0fBQwfHhgGD\\/2gAIAQEAAT8h\\/wCpFAlYr1MwVmfDZ9q1Z0fBQsdBVHD+D5p0PJ+VfQPmvsHzRqj4fKhsh4fmsp1SrGh1RWT3goqTOT+ayTcCT5FZ+OUD1pfn09fXX617R4+1OT1BPYcAzHFvIyg8msSeU0rMiPtatNvP9LVtb+mKCkHrfkoJJoQ44VIADkS+teTk2eW49gnmx3IAQQZHHbIgjUqIB\\/ZcajFnWPKpZyab+X4tkI5SCpbknbzVMg8G31zSpSZV2usUqGGdq0ExlK\\/DfLOJpSIJODTsJziX9L2IJCMJUEnI\\/dUTM+Q+HH8P16hrT3ifTFSdgUoy3DtcsyzETfvEQnPLnRq68mW34MS5hJFZfCvsUpedV2YSrBMEZ7BgWBM+tI99cxuLcCyLEdjPRiZxfz38eIkrgDf1YfwIqOgcdav3mj7HZmIf5AoireNgJsppWXOwJHBDVoNxhk5U6Lhyp+FGVCQlLEl4mUiaNstds6Jb\\/llyzahnCitYPd4CcPFqeRncRbNqhLgicZYqdpXkpETRlHvFv\\/VF1SQEGDcIm+KuLrrT2TTACOLqjltVyuC+h5d+URADK0liGPh+aVVVlezAELhflRCVMxhxogDCRXos86z1k2YCm4XY7kWWnhCtFnCOlTKCVjNN8J5jNvvT9ciLFZ8GjTBSiIi3hWEgr50T9LDLKS1CU6dYIKkhdjhDigzUNMs2+9FtqxYv7qbkSURpsM3YoAgYTZ49razSYGLTtWeRr3wbc0q0p0iHn19xNlncxiqzBZ61neTDAdN+zcxlx3BRkYSsw9Q4PejLAlXSp4KbHvd6ZtQgyzuuJPFuun9Eh2LAyL6TfcsLBBFjsoYns2Ufenepe+bGvh02NmB4me3BuECSddp4JFbLdwiqBdY9OL7PGsN9LrQNwei9au4ODfzdoEpMiL6bIEFLJx7Sc0l5H+R3jAAf9NwkbwEDuz7HBzoijcI1\\/LUemZWG+0YVaFn1JbhV13R5Gl0Uss7SwSwFjxo5h4J9ilbj9d8YRiY40pGAnQonDlJK\\/nq\\/nqh2msM33XcMYGzO9YWQItrV3aI+z+u7tbBya1kNjgaG9FwGGYSTbG3T6n+bY3fqjeuPbd1fAoEwICrbDUhcPHdBkgLq06HGj9OtCmK8Gpy+VJrg3PA38lMC8DVo\\/oODlsPQRHWxSqJlcvaRcY\\/c7vKm\\/ktPvLsQQCVwUOjiefVsYqBleVcokOBpURiuoGNwN6UyiWmgqM01X2th5VMhnOvM+\\/jWmDoVDjzlF5TvoPWhMNtgvLiqm8CEpYylybM7XQjkIdkL\\/wBLV2zl91f577jHmUFFpCwJnsJuEfud2UCXBT6P5DTcIQC+sY3bZ\\/UNsof1G9NZrXPhQVIpexMPYMM0Qj1k0dxKw5SWjpkgrQ+GzVsHWpc5FITfsAp0HDds9J++Xdo2YHzP8nsoZR507MEtQO2vgN00GfQMetGys06YbAJQHFr3cP0r2x\\/KtRPArQnrOnQ9Sv5b80anqVNYxQT47NsvWuXjWQULchD\\/AF3p77bb\\/pY7MlLhblbb8IuPHHpHdrFcq\\/Y\\/ewQKIQ89+ECf5+1FW7ljrvcUAPQ\\/tL2qfQD1pQLpftT8q8VPYNCXBhK8MfypQGrJwXjx+tplykBxrIRecXXYukOTlWTGSOBodnoiWvLrs57E4GtAygIDu059hP77CbgkzBgqPOLnpp957Yep\\/wBxpNLucGelfyPxUuBBI+NvWNPrpTuFMa3IHPV2OqDxVCBQXBmpcuo3L7BaRMURCGxYjr1q2uiemxtOCtk\\/01tlxZAm+tTg6p7Nst9foU5pgJxqV\\/M\\/FfzPxUydqTmoFhki+nY\\/a5E93n\\/R6dgkFn4KgAgIDZAzHmTs9d7mz7jhSEyNrQxfZ657q6CVM3cuxkyqw1qEkpJvnlQQgTeHXcPWIYPxR5GmKWbiIWIl3N+y4G2WiPMnYoEtgpJzPwVfb5naYcZB0BQYBwBod39Z2xGd2EP6zbDrxvds9d7mz7jhth39Sf3QkmnYy3k2XGukIqPPkY0tZF7TcOQDDSzevbRPWfZ2WuF7D42R5n\\/ONss8WvTX7zq1SFtWvt8zfxZxoTncQW+Aa0IMN7jveID1UEnqJjY4zsgJGCCdzgMi8DWiug4HLYiKwOrS46SvHZqMrgursXMuA1pqUErsmnXE9h\\/VXBqI6OPj\\/s9i7ZhxX9fuglCoKbB8vVdkfPuG0GM9bns9AOiPFJtIDSsLURFkLdRMkUCgCVwFaanHB895mf8AIj9b\\/pvc7H7bhsnpC8lps1bfNe5+92THgBNZANQsUSIHFuyaYA\\/fKtW5dXQpGZWV2fRcOx+9ybsx6BKKESyz\\/V+9Q8d+V\\/3f9N7nY\\/bcKzhEFCPDwkzUC9iXPQ02js9ZRuBQCHNRNvMzariJA\\/yl2gA5UDjUP3yXFoVXZ\\/C2\\/RcOx+9ybsW7rp63n3uyS5+DFQgMWcbyNBgUmv46v4qv4qv4qv4qkaGSUI12PfDKIONhs25bcjg4UhM6Gq4NTFFc\\/coRJNrzA1qeU4rmrASlgy7bi7CFafWsgIS6HOrolLK6m2BDYLK\\/kK\\/kK\\/gK\\/gKgGhRC8m02ODI0ywwyhFYU+OnnWeBYtFrzEktXm+nu75icWjWaUkcNqKhITTdKVDWBk47nrvc2fccN3mCVil4k1M9VOJXmj3sIqTWpohBcNIywcWkNfKo59c+VE5jOZpDiLoc2n75zt+iy940DzqRl++79vmbmX0g\\/fwrAADAYNkIgJzpbLigEj3yZC159fvPaiIq5XsZzI3lOa+k\\/NG+KST87RYOq42lEHqUeM2jL4o6xYSSlpu9Qh9K9Oun3ivXKpl64xLXUfTNPC7jzeBV4xZLrUFmGlbI42KKi+JauxOJdGpWfia9dckJCaCkZ0Ci9XQVwt0avsPzX2H5pihgDF6ArBBtdk2O5KCY73PTP+8bl61SHDr2ZNLZXONeMBdOvxQqib1jPFPw3VtiJcLmzUCOi8kPpTMD6cK\\/qFaJ9f8qtp\\/0u1zUWS03uZ0CsCCmXQlEs0cTdtHCgHg2naUOCPCuUog2EGkKXpDSiBsPlfinLgsjQukwt1roTtkTQyW2W3R73mfKppEgLBViJnOVBJq\\/S9O3WCOm7AsEE312pQzyTQ0ni2oOYnImpXVL3oB6uxxrU6BP7rQL2iWmYnUmjlFDjUISIkvX2tFGebWaXodY1iEV+yk1EhYA4m18uabhSuVvvpTnaFGRirUCaBLBuGioNCBWIodaS9SrOdGjy6sJJKRUBpTAb96+d2Zm2BOjzm8GRgBUQuPIfNEKRMRbYoTV2wkJ+9xSMksNKB3vdsXgooQcBsWITso9FcCAxGywuqfDWi4LlxFHrfZuqZeb3pQxvBctAcnJU3ByDA18BRZ5qfuvUgYnZLL3mK3x2udrMiRrOIvPczR4df4V7bKQl8trmzhpyXOHruRgkrSBSYARSQ1DjUONSzzPlR21TuaS9To2BPq0GLgRLLWd33n32T212R\\/HTnV9vQihEkbNa71D0FBBBjZP1eFJyyUJVE8qYmwoIDvCwTSyl2aZsSMg619JQ4yeugOK2TMnkbCiJ9ZpQOUU0umm6Pyn6freAiExJWSU6ldSjmXcVn2oZt+ktdGcEFYqnj2FbzD1v+9wLNabOBSkbGX+qdjqaGF39JRxq3pUmKCXYhfWliuhOhQTWUEpIUBykWJjZzHlQ6p7dK30aBNR3PLarxscQ4+x\\/3uj4Wx1P89tywKSiiOooCoCeX8DPsrPzlUqyeFDqXhseogPFTEnoPZUavxn+qIjo4UCZXG6GFBrupxou+tnEoZJKWCabuz0ve\\/526QxupoVl50J2uJweG0GYuFq6CZ\\/B3MtQuu\\/AoizHHcdQU8NOlQELsBgkbJQwnIPCluUVI28oCDwv++3N53m6MC15nOjgE12SYspahLzfiuYNqxQjUYwkXaVc7RxIedZlfmt3txO\\/fHTLTgmuCRpgeKinH8YV5ZpShL0mWxT0m4Y0vMn747xPFLIoDIAgDT8bHh40lx4qxyEqkWiXIo+98rKCSDzVDvV+eQrTTLuOTeQsjQxPH8fnNNAqZX9qYmOQbA+uSHpVgDAChY7jl3c1xoen5KHg6Op0ak09D+aVcEonOlntTCDq05heGkPi7XVdb5GvemNua+7R+Vjhug2HjTgQQS5oYd2OIcViswjx1CiNNtGhnrfqtf8AyV7wKhz1joLT5qip\\/nV\\/CqU95rpQmjE1f6mowJq+t\\/zBAhJodUVo3lsusn5lpmWtLFGJXPLs8lArATSoYehmjp2PzmUotrQTBzpHENJZXZfJKLM3Ioqwf+CUyFKU69c5UOKucrr0BQAwR\\/wV\\/9oADAMBAAIAAwAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUMOluakAAAAAAAAAAAAAAAAAAAAAAAAAAAARGDHbEt2zIBBXgAAAAAAAAAAAAAAAAAAAAAAAVmhKSbYlu2ZAAm8HgAAAAAAAAAAAAAAAAAAAAJ2pQJyTbUt2zLgE36CoAAAAAAAAAAAAAAAAAACqltIBKSPYlu2ZAAm\\/QJPgAAAAAAAAAAAAAAAAfKktpALSTbHR27IAE16BIegAAAAAAAAAAAAAAAL20ltICZM7nLfqZCMm\\/QJePwAAAAAAAAAAAAAATe2ktpTZmE6o9mLIAE36BINggAAAAAAAAAAAABNL20ltIBISbYlu2ZAA1\\/QJUMGAAAAAAAAAAAABdJe2kspAFSTbGt2zIAE16BIRgmAAAAAAAAAAAAFZL20ltIDIJC5tu2ZAA2\\/QJCMFwAAAAAAAAAAAdJNe3m5pAJERQANWzIR+TaBARg\\/AAAAAAAAAAANJJJ20AtIBFaAAIK2ZAQAPQJCMFkAAAAAAAAAABhJJe2DApAGbmm0STbYAAH6RIRgsgAAAAAAAAACAJZL0ABtIGIAAACQKbT8d\\/QJDsFoAAAAAAAAAAABJJe0RtpFYD5weLwvIMDX6BIR2sAAAAAAAAAACDJJLwDFtJAPySSQWwZSgK\\/QJCMmQAAAAAAAAAAcBJJMgfNpZGduSaZ+bDATJMBIRgoAAAAAAAAAAAgJJJgeoQIoRDyRIMz7IA8AQJCMaAAAAAAAAAAAMDJJYCFCJDOUmSONuDUB3gCBIR0AAAAAAAAAAADkJJZCrcKK4SSSSRsR7gIoCgJAPgAAAAAAAAAAAEBJIAAAAFCeSTJDtnrcAAADBIMAAAAAAAAAAAACgJJAAAAAhPiSQ7tsubgAAAYJAAAAAAAAAAAAAAMBJJ\\/+ljBAwySst6GTXbQgbe3gAAAAAAAAAAAAAsLJLq0oRIACB+J67XlgA8AAQKAAAAAAAAAAAAADhJJe2m+JEKyVDF9hqcez28SQaAAAAAAAAAAAAAIJZL20lsfACfP0r3MSTHLvSSQIAAAAAAAAAAAAALJJe2mBvStPB9k2QySG2okAAAAAAAAAAAAAAABQSFL28S0AB2MTMx8SSS221gLCIAAAAAAAAAAABASTpenC20ACXtwp7iSQU3AiCYKAAAAAAAAAAAAASCCK3S2mgAAAPw8SSSK2hCAAAAAAAAAAAAAAACAAYZs3a02AAAAAACSSRW1TAAAAAAAAAAAAAAAAKAAT8qKEm4AAAAAAASSAWzQAAAAAAAAAAAAAAACJQABbAC23AAAAAAASSSc0gAAAAAAAAAAAAAAAAAAAAKAAG2AAAAAAAASSSMkAAAAAAAAAAAAAAAAAAAAAQSW0kAAAAAAACSSSSAAAAAAAAAAAAAAAAAAAAAATdaeAAAAAAAASSSSAAAAAAAAAAAAAAAAAAAAAAASQzYAAAAAAACSSSAAAAAAAAAAAAAAAAAAAAAAAADHJAAAAACRJASTAAAAAAAAAAAAAAAAAAAAAAAAAALYACMm23t984AAAAAAAAAAAAAAAAAAAAAAAAAAACLBHAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALIAAACZQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQbJIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf\\/xAAmEQEAAgEDBAICAwEAAAAAAAABABEQICExMEBBUFFhYHGAofDB\\/9oACAEDAQE\\/EP5S0n3ZCsrKysrkPulPn3aHmMn4Eun2dgL5hA+UICPsVDmJ8RbiKedB2wyHygjx6tagnEU1gPPYeOkMgH06hzPgm639KMgj6Na5wlXntEprtLqW8+hKE5dP4CDi9o7LJ+8L4+NwsWsBvcOYLjmStln7w2X2E1nwvf8Aj6opSLe2OzmbbsBRvGU3QRKZRWHMpb9yglRQEJTdBEpitvs\\/E94tTiHHY2ee0eorO74Rx2A036JU91fsdoJD5uD6MT8Yo57pWdxWo0JTtpC80gW61gegB4iJz0Ru+QqvRlouWL6NzefBrwV0gG8RaxbWVRfV59vsV0qlY4itvTcgVoubzeUytFColNah5yt60pXQ59urX0bm81FaqnW82i7gW1AorC0XOfRlXVBvGkXpWSkrnvnEcJcSmtA85XjpjWRR2y4OjZkqK1Da8LUX4lvSG8DQFFZW2+qFvbvoqsrIJs4hF6RW4F34jSJBtrQvHNyrVqr\\/AH6j3SscseORbeVtUJd5SUiU10j57fk6FytMcGObPBoDQ7GPDKiBDoSV\\/j\\/s3c2\\/1Lk45Y8cmjKtucs8uiLe45uhUXm5rHBjmy8HnG7vMuR\\/tCJW\\/nRWiyBAA2zyx44NuXRjlnl0RR3HJCq1C2obYdifVPqgSjgWp9WFyYO\\/U54V4GjJTPqiDvlFiVro7k63F0eDh1bB0i2qn0B\\/UANnUrReTjrS3KN3uhuOvi6PBwlNSwqJZpKs\\/MakqNf586AuBU8GTjrXme7N6wo2aqqa2cKhdAkbIAsnk0LhtmwW5PAgVkLgVKnRABl3yoxb3gLxLyk5nme8Syo\\/HQvatHBjm0ooA2jaKJWFLzeE0KlQgKlBFvdwF7YonOnlnlLt30NVuogqWi0rNPORTchtIu5UpKSkqKE+CFGCtyAsqwg8ymBcMUKpaWnLDb0NnYPM43rIiQWxWwU4lifrC3iXAS4m8FAoqVDbQAcaPgwN\\/R7mL4Jx0AXifREvE8rlLiSgMbxFl4LhtzKaA6V288vTXF6guCQbca0uJpvC6ArqMBv0qWVBatNK\\/PTfhoMOAgVqNN4sT040LuspkqVKOgaa9TdAK0ZHKWd9XqbVtFcwKAHGa\\/Dq\\/KbqDZftOfwhaLgDcB5g3Eu\\/wlBRETn8NEcopxDZ7C5cv3Ycoa7lzebypUqVKlSpUr8AqV\\/K3\\/\\/EACQRAQACAQMFAQADAQAAAAAAAAEAETEQICEwQEFQUWFgcYCB\\/9oACAECAQE\\/EP8AUonifnPx179p+0\\/bZD+Mo8e7FwQXMD5YHAfEoOup4jJ+GIREz7HAEVniDzzDEO5YtH5ijPqwXgjs8T9aY1OdUhwdhTfSQxZ6dCgnmig4PSixE9GCtE8sgFHaDZfaZlOPQ874hNHTpUWipVdckLtJUL1xmNFoxMz7riUtBcXl5RUKSovzMFTEeQfZ9VxGrQRWOvz518h3\\/m6tvdxUZpC8qrieR9ireLuBRWkIEhmXCniciUUZJdG\\/MBBSXuRBYIUA9n5O8BWiDzc9iE2HZsx1BT3QXwQDbncdIUr0Qs7qhbPakrwR+s\\/eET6JhHuhT3HLODYlLStqgWx+k\\/SCqN5ZzOa1sqMZ5gBZ0UGnWLvn0cFaIZDc8mtf6dHY5mKrbMytz80RWQxZvVFxb0FtdXHt7W3StnQLaJUEdgXRVbdeGU8ui\\/iWfJZ42IrIIlmy7xp4Nai9o30Me3pzo8L91v8Aw3c91qHYoMRaLi23oFtSqx6PUdV686QidC8\\/vP7yv2f3i4ozoNcwbL2cFa+bpuq57bM6J0v5hwbnyGgXA8wA6DEuUOivUyxegXBRXVWjtxXQeJwvzX\\/ux2GmcHV84SgvQLa0VsFFsA8Q06DjTz1oK1ubiDjWlZfSfjtzQ6F+615pk0x65YQxpjLb2imkOfMYvGyydeY1qVMNcXRWjuMHQvo8a1\\/ppk0x6nnorNEJyRW7BqW1w0OXSrVdow1xdBit7jBHkVjddQttugFplRQz9ICpogKy\\/wA6YnRcdF1w0NaLtSDM\\/aAnGoAQbxvs7l2N+To4tLg0fNbqyjG1cwW1KrTJ6wFSzg7p8JvydHFFogiWTnDDBpuDZszmW2tEW55WuT1jxHd0V+7wFO6oCUNCIGBt6kKYiplcG9UDzLOSNCtUEslr8mOhVQjjVRcCiiKGZWWM8R3lAwp5OgHN3syaY9pGmO6YIgPMpLluIv2II\\/EW5egAUaKBbKfIBxtw1xSrg2V3vG\\/Opeln6RC715KvUBTFthEzLlpaWy4C4nmiwqK+GIJZoKckxGLUfppAMrKw4R59D\\/19j1PHo4KgRxKkqRGUu5j+o186Gyiqi4iY2bixb1Iq5lSpaT6aLivR8dT9J44ESzoKGY\\/eC+Z42o1Bvklrg5WAFaFPEtlGIvZZ0alXDBLlkr0dTbcoFsTEKXneNQb2sWGyza7yGVaXM6vfjTZCsNt6jG52XUPuXqxSEuNIq7nZUp0KNh6N8tHTjPvVuW00imhV6DtWot+luXDSQFulx4SpW3x2njZfF6PoTQi6oDwmK5iccRTlly2Ft3jtCJXp7l7qlbB4va47U54iV7YLjnth+zliCmvaYO4uvYBVEEpgsMc4lEPP8ItUAFmg5x\\/hStkdxwgsIw6tMplMplPusSxbhutP1Ki4p80WlpaWlpaWjTj3d6hc4YlvVuvfXxUvqX\\/Bbly5cv8AwZ\\/\\/xAAsEAEAAQMCBQMFAQEBAQEAAAABEQAhMUFREGFxgZEgobEwQMHR8FDx4YBg\\/9oACAEBAAE\\/EP8A6khSG6xUvYP7lrJ3+uqsT1kp\\/OD1SvagrgyuocERq+CpHyFX3tfwU\\/oOchr+cr3Khhl0jfE1zIESe3+yoErAVJgTJC8jU0aAT8yH2qcNsV7QPmpCAdB\\/apW0cjHxCp8Pdfl9CGr7jRnER6WoQlrA1Ex5heIWKGnOEVurBosG7MPYfmodF0WPMiuh5mHWMf6MWBEgAvQy9qgmOIT92\\/tUodw+\\/wBntTLAurfwHoC3AWwLE5bfXeIvCAmCDJO\\/ERdEJCd6iDujF7v5VuJhfeXPLU0nEpgequeP8vBCgw7tRrK05XUS9ipFRpS\\/jZKbpEpK93jcsSAEnMs9uI5sVxQSQN6fUgFAGYcNGOCJNHITePoHTn7qHBoI+i4YpRCPJp0cbSwDln5muhXpHmx2X5f467T6d+QMr0ptmYjl6n7+KhRGULBKaDofSeI2JgSXJG4bW9z6j9R1gLYX\\/NmTpUBYp8sH5Lf4YqikAFEM1o\\/wOr4rJyxi9ORy+moaoJWUyzpFvNPrUgAsqFgFK2nLpShqhndps659AIDYQyJW8Zb5b8X1XEZr8bojmjlj1rgKYBKXUiMFOf8AweWP8FoSG1l19OmakuJ0HQ\\/LP0z5SACEm0SExVwPRjQGipvpegunz2GRANzDRCxXeoWKQ5zpQrGRUMwKhEktOaQsw7RGEqKQmBfl4gY0qMjFUCy2LAsS0C9oQlC3UJbvQcR0UhcWvfHelJuXDmABrlzPamxxqSaCribc6CYu8ZnCOkU2\\/HAGJTEDE25UvhKojE4GF4louxwAbQcWrCaSvGYqI2pJmFNJN\\/pRE45kutDojim9IbvsX5adMCJIyOv3p4GlEAbtOLXQZeW3+G9O2RKrKv01w1IASctmc6Nt6MrUmiGNnOLVn0PIiFHQwxVoMgKaEYJv80\\/U\\/PqaRZVwHOgAHQ0jJl0b0y5BQKWVgsUk0gFxycTRkZoxOQRqEXtVxsc1NcG5RUYXomAC1EPsmkTHNN9aSwhZksi9jejVGBAVucoLLYxFLDJrAN2iaSXjGMdQjEjW1JUXIkgDDzOAEkBbsYqJ2ohiG8fVRaLMkEKTuSeTiyXTdfc\\/Hjb7xAFlYBS2IiMc3k2PPL6+GSoYRXCMYnfv9d9E05AqNmBqOtQdrhjZgaHrIkt0gRJxyiPepYibbcQbkSIwjQCGwBr+78j90\\/Yi0AMq0i2BJR\\/AepFYUJImCWYLLLGnP05rmvCOUemXhUEeRLnellXfan1rJo0AERGTTPoe\\/GrImNXd5+h9QiAwZYsfTcyLDpJnsw9qEQRkcJ9yuL0jD8Hu9OCYiKzSEtEEW11c6fXDVkAN8liDPW1uEKwXaJrcSwjkZfFCDqQ48sz4pu5CME26JvQpUUtrUNRt1nj3UQo9PjH6ptG21+7LHePoPozEkXXbkJfrbgEoURbIxJyl8\\/UaWAXWbTzJ3+4cpAAjfE9Tg77cS6CxzqD+shJBbOzbt6XjBh1TAUEX5YD3Gv6P81cdKTB0n1hRdLQNb6vL4opI5KUeTHZfm1BSFzx4o+FOQpVoObSImVzxYC2fhqjYM9jWpa5eK5zPw8NaXvHA3HCepq1iSYEj1rKILBAcihbyqQgxMLOlfxf5r+L\\/ADVxUQIAySekEjWwxCSY1vcyeo7cbsvc86VesD6j8H24dr+yAmp3ByeP4D1Ke8oJI0RycbkYXyyX4+Rxzb4WxY+Zex6kCQw7fwpagCWGCOe9J00MQDoafFLcQyQa0qst\\/QFc6hABrTSEYUvo93LsaUjKhpVNj5kX4ousIuqPyael4ThgAdTsAtEVLBoCA4SoLXdbH7dBp0SlTKuv1H0Nnj9\\/26wHjHS2d0n6J8CwAurpQ6C8jUv+nQOAyXXaAlaloFFOgOwBSZPtiSclGPHolQhgeM5uD\\/yjbEKsBUobrgpFyG0aVLqK4vYDXZt0paa88DraPeguwXSzFM17+9Cm4neZS6jkOHMYEnKKFvDgKMlQMBgX03o4SnVI89ucnNMBMAjsSbxh5ZOAKwXajhTJhJJI8uGdOU5o\\/NB2eN38rDkrHb5PQOkkCYlWChdxQAHqW+g+jm8\\/r+2RIASroUyFXBdDb2B6Lqdt0mGzp6YGSQ5LKx+XtxsQtg3M3lg7PpBUAldKGHCNZLHYW6zUj0LBSFJX6PWF+CEMlYlfEZcnRt35cRRkYSoQVySQQSvIqHQR5rHigpgx5xl6rL34ZPHHdod2DvS3mjwuUIkssHI3x6VVlu8XRCGjJlix339LSiyo8r9sby8xa\\/J2+lucmLmA7EHWeCiIAEq6UjQxLawebvf0wESm4dDyPemckTWD2DgjKspAVPjkySPlU\\/Hmx\\/Iontz8BpPuh+BScDqL88MwcroD80BO+N\\/wn5qOQEkEHtr24GJCPkIa8nLUMTxau5hdMou7KOKG83C6Y+Z8fTNDjVYJc5TPallmI4KiYP8AZs+2OYIfpHycCYRFmiRjyHr3NzlkG3cx2niVQjUIDlLi1u56jeL5ciX3HirGZiFAZ8taAatNG0C9HPR28tc8wleX1wxMWrTTCBlUI0LsSETXYdfka5ENCZQmjZd\\/N+KNTjZSwFRkNgat15ngLFoNAS1IzOHYdgg7fTaJUYxncWsY4GcwYGjddgaNUQDAFg+2WQtGdZ9YWZzUByqHEmhyq86yQuafi\\/FkHELZR9x9goBZiBLGFpaHDAsqKuJCSeIrS\\/lw+BXSJNXq8FhFvJboc+C5DgcC0vsUk4AosuZNqbrNJCeZy9Fm5kJCpDTbCK1EvRydKllczcy0fHvwATbLtJ7nvwKAvCPkfLwITnQu7CDNXVwuFl\\/gS+ONndbLcb8seGm4TiVMGo78alRgG53MObQAbeMpvGS+bR3fovEBxpgN+5Pbn9uzmh8Qfj6CKTcTS4+cd6BmBAGA4DCQ+CexL2pVZWV9DTjNZRgNC2ZOXBDFitVBdVOxNCI03F3eBGZEAlxYF1PzVoBAWBGy5UEUoUiIxjFvQ\\/aQoqwzj+d6kRlBLhnlDvtRBgFeSzHC7+2HgiBza4AKgErgooDXM1jsQduCJAEqtgogpsLpYPOerXu3H9z+D6IeWN6ee7gongTrAQH26WX+3iqEEkkk9Nh94kXG\\/LL2ON704g2X+BB59bTgAGZPlRIxIkPisowOqT8cLAESJPOOcUtqZDD0QQ65vTRQNRh6E9rkNKlKhEICdDHam7wj2zeOEAZumdUHy4Y7TOWUfeb9B43+SwtzX8WosG\\/MxFhYne1ude7cf3P4PQ0CMzkFjOfj0HyPmk1aOcniORg86\\/cM1r7gP5q0F65fwayY4KqBJEwGA5eibAQ7gXYFoWJItAQHBVSHMiseaQB9wSllc1\\/wj9046NRJY9nhkss0ksUgvCggAlc8BWsW5UUbM7VFBAOZC\\/s+ido4\\/wB58Uc5Ghl431CeAWF4d0Et7F+q8ZkxACAZy1Z7BX\\/MP3SMDkEMqPZ4xdPrQtMskeGoy0a0kk9k9KMItkinLKgEq7UBmbJXk06tXtvP3Cw8BHh9gBP5e\\/gM9B8cvaz2oSG1RiWZPpA1mvKXgqQmlAEkTBtQCkEhUnPadaWCllniqxdjmsvxSMyWR\\/gWDvTbHXaqyvD+rt+j7X04GAhAKBAQFA1BJsN3+R1+6Qoso85PsIT+Xvo0xGSxKsF2jHPmAE5lFK5JW+LsYehvQpT8lHnHelJhHCOR29DHqpKEBMd4ofbQGmEI9qtKNEWBs+se5UnFHIQcpoIQtlq5fx0KkPmUc6OwZeby4\\/1dv0fa+jRNjNHLQQuGx8NOuPup6RNOa75HtS4IyEs9PURlUAFxGzyfV5pppozFYgLMLHI4HUViSCFrU++kwJEh4ZzTF3oXCZXJrA9Suo5h\\/wC0n21O46l8nep0ScZjrWKQxaY0qRGxhJUwsulT5xMRNhb6ScSZiQWVajhhwBcDoc93+ZorBLx3mxpu9GiLidLdC5vdbdXiVuE1IAg9MGCCD\\/7AasNOS8UcAJSHWrPVkBgAscgq7TqIkea1OCHklShdzq3im4CwLl0cNQF0sT4D4O+33mQ3DtJE9qS4JW5jc88XLkQohPSG3Nj7Rahp9NpxoyQyx+E0f+UbwIsH2H5w0Yq+AXOZo8zxTrCGnPzkx3oFY9MUtxV4IzF70TIkCzBSEXO11JyFycI5ZP8AXq+QkX36jpVtUyFt8U5Zfek8HKfBsG3BHSYDQ5uxRZgi6VdiX4rb283BuOGn0e7cf3P4KHMgHtIyvJ7\\/ACIABA4DYOAU5WQSNQ35IoPKPvHiGMTEbHzDxJhaUSr1+i35kFJKdHnX\\/GqBBlMwSLTxSQIzCx3mI49NjgmyYTk0F6wjXra+46VgYmCdEtUl9ynT1g0svJyT3KvaX82pweREHsFMiJwfcN6FN2MnQZe1IGjYd\\/wdW\\/IodM0tlTqu9Ci7i5UVb9c47N6mBR32p2Pzw0+VOOY6PSpQLbo7XJzqfzale1QgruHhZqQWzfviasAtYBEjJEbV\\/wAyr\\/mVFuhngoLTUcYDyDj3hPCfltTejDWfb7tNMRl0D3D3D0IvBAIbLNxtMT+PplXREdRMfL5rLVYAtzc\\/\\/W1AFcsmkUCYQ4AdQdOlT2e4s9HDUQOC7UwmCxU7uzKHUYe9EQaSdu8D2oa57i+yKt2k51ASAm59j8qEWXSJ9xO0UuWmVKd2oAiZJDUao9XfxmiJEZaDkUDgXB1\\/qsWlE7urxEhAUCR1SbfugBnsp670pwoajFWNuokoWYXgI9RtUVhXW+KcvbpSSBgoR2aIFAQ7sPgaiRJLO3FB8qCZScHBuj3+7Ohy7LtCRHRArMTEsdqX7SS\\/NPIUmYl6D8+ae80NCvSKNHFe4IOd57PHlu5V7VDiOY+TToMZYR4mhmdWR45z487ViOGeAAbatneiYjmSCjQBST\\/DNeEsvhFAUCWCfuiLCAWMR0rn+f8AVJZMsdTramGhcxU0BCAQnrO1QTc3T2YpzOICAyeyeOAKgErgKKRImSw2Ofo5VIeuX58KgXtxnSW41c4uJNetQa5QMenU08bVYZABiCTBbUpmXe5hwRrtSnLHJA0UwjnanaggrX3OtTgxqUXI0RCZGPuo1Tr+lKrKy07HLhi5UAZFCcsXmfE7epVLQKVadD54vmdXt1pOYbCCehwlYTUUMAsC48rPXl6GBIBrt1KJjKUFnwVRlY6tvzRjYA8cJPh2Mt1ipCHWHLIQjXfnwDnBv2exoppxFy0aEIWMn\\/ulll9EDWZeyD2Crow+rRylsPxDMdChYyCiQZjn\\/ZokQh1\\/Wj0MDXUosTc8CurANnbg0BYx9y5lu5bcZ+MFuJJT0zSKvkwh2aPj0AoAlcBRQzOTo2\\/mpA2Cwa1K22gwcMlIBwCPRpl5MryMPuehAN8jU4nMNzpvU364IYmfxxycjSEmY2O2auUY2oWGeLJuadqWwFJVDhGJHYqQMdf2FKpXL6VI\\/u7hBlh78ByZg3egLtCSxYFQ96AAQkRs0VpebCz5ZnlNAQACAMHBkinndWDuK2aKuPM4GgHdCgRwH3AIsBNOuZZ4Rzn1eAGQeaKRbh6KpKomuYE42o1Zv9l4YriwRm89uBOEZDh0Pl7UdJgJWkTsLDY4uI7vCHo\\/ufk\\/PqKDVMJh3NqVVjYZPehvmA\\/dA5CDQDyHzJ8FHAeQH\\/PUIgGq75eCjrfVkcle6PseAwyVCR5UgpkNAMFSkmQKZdhq1B3mzJHTYocIBmNX7+aNEUiYmaUQY50kRQJy4f0pCQDvlp1KJZF\\/1TLbYOWdX\\/2rRAFNUz7r4owwgjYEt22CoZiL0kSgbtEaXJPIEe61FGrFRO4VGC8yudTJxmGzhI\\/WQMrkz6rwbTfd+UegoSMA6l6h70GoIWgVYzY5H+C1tfUpEYSGotIKVsbVGLJB3aNBNHQcHihqbR1J0Yw70anre8un7RRA05Pwg8zR4AafGlIkbZHWh4hwEt7lEkOL7+5zp6gAJLaw0BXBJKJlSUXLwuRvL\\/PN9ZBEcNM609LWYA7Q47Nx5NHEykfJZXMeMcKqSXJzRxzN39Kx\\/g5pKCXSSl6JYggo8MogVL6CJvNYM0YwndpXAO1YMNg4BUOoJEclLyAbhvL0GOtWhgIKfYDBxG9KdEvdnb68A3W9XPltIe013rBrcfDs8uEiMqBzoE3crd\\/ygmEazekRRITgAlYKgEx1qVFGQ3QmL0jKnjf+lRu0O7BV1YlN2+Rjt9eQ5X9dw8oJ6xo8ygKUrw9MyVcCkEDkBidP8wHuO9SzjbSErtwYZ0DiEta8WaSxG5l9gkib0kMesJoDmDaKNWgCAGA\\/zcqRgZKlCbB\\/O1OFDeYGnfFZRsgVZbadqPGoX\\/yvs1NBtMXfEUzAWDQGv8ddqAIGAfLz+xMFz9R0SkBQa45W7\\/noBAI5Go8U2sJgNF735XK037o\\/+nPggSSciyj3inQCQEA6FKj0+2AKAJXAUURavybf6UDm5PPC5Uto3lAHx2X5U3DFwkBRKJiMiCUYTuD9T2c0r3rP3VkP7udf8PQ\\/6lKlXT91PwjyPhxBQAq4CjAEvB\\/M\\/wCra60eGB8NqUOZrUGXxXwXpUD+RDy1NAjQPvLVPhHcgeSa1yNZU7SfFag2kg8\\/lW7zIU\\/NZTWsUfFfygOTWNfqv5oxu+Lw2t+CjijOQfmjJDXXke81Mlciyvz7f0HHr4o0i39Dp\\/sRRDnTbtyNysu03u4RceyZf8UBvc7cW\\/Ed6jJsxA+TegAgIPpOW50KUnAE1vICWOiOjUBAAlZXq6v+5h5d9aaJRGLuRrOlfHFrFjt9EFYCawSDeyhstdA81COk5f8A8FlV1K2R0UpXCe9OlR\\/xq3qAcr71oh6s0PAdB\\/8ABX\\/\\/2Q==\",\"size\":24175,\"type\":\"image\\/jpeg\",\"originalName\":\"not-found.jpg\",\"hash\":\"\"}],\"title\":\"ddddd\"},{\"icon\":[{\"storage\":\"base64\",\"name\":\"not-found-9882f85b-8cd9-4646-a3b1-6f6397a5f3b6.jpg\",\"url\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQEBLAEsAAD\\/4QEQRXhpZgAASUkqAAgAAAADAA4BAgDGAAAAMgAAABoBBQABAAAA+AAAABsBBQABAAAAAAEAAAAAAABXZWJzaXRlIHBhZ2Ugbm90IGZvdW5kIGVycm9yIDQwNC4gT29wcyB3b3JyaWVkIHJvYm90IGNoYXJhY3RlciBwZWVraW5nIG91dCBvZiBvdXRlciBzcGFjZS4gU2l0ZSBjcmFzaCBvbiB0ZWNobmljYWwgd29yayB3ZWIgZGVzaWduIHRlbXBsYXRlIHdpdGggY2hhdGJvdCBtYXNjb3QuIENhcnRvb24gb25saW5lIGJvdCBhc3Npc3RhbmNlIGZhaWx1cmUsAQAAAQAAACwBAAABAAAA\\/+EGOGh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyI+Cgk8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgoJCTxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6SXB0YzR4bXBDb3JlPSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wQ29yZS8xLjAveG1sbnMvIiAgIHhtbG5zOkdldHR5SW1hZ2VzR0lGVD0iaHR0cDovL3htcC5nZXR0eWltYWdlcy5jb20vZ2lmdC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBsdXM9Imh0dHA6Ly9ucy51c2VwbHVzLm9yZy9sZGYveG1wLzEuMC8iICB4bWxuczppcHRjRXh0PSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wRXh0LzIwMDgtMDItMjkvIiB4bWxuczp4bXBSaWdodHM9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9yaWdodHMvIiBwaG90b3Nob3A6Q3JlZGl0PSJHZXR0eSBJbWFnZXMiIEdldHR5SW1hZ2VzR0lGVDpBc3NldElEPSIxNDA0MDU5NzA2IiB4bXBSaWdodHM6V2ViU3RhdGVtZW50PSJodHRwczovL3d3dy5pc3RvY2twaG90by5jb20vbGVnYWwvbGljZW5zZS1hZ3JlZW1lbnQ\\/dXRtX21lZGl1bT1vcmdhbmljJmFtcDt1dG1fc291cmNlPWdvb2dsZSZhbXA7dXRtX2NhbXBhaWduPWlwdGN1cmwiIHBsdXM6RGF0YU1pbmluZz0iaHR0cDovL25zLnVzZXBsdXMub3JnL2xkZi92b2NhYi9ETUktUFJPSElCSVRFRC1FWENFUFRTRUFSQ0hFTkdJTkVJTkRFWElORyIgPgo8ZGM6Y3JlYXRvcj48cmRmOlNlcT48cmRmOmxpPmF6YXR2YWxlZXY8L3JkZjpsaT48L3JkZjpTZXE+PC9kYzpjcmVhdG9yPjxkYzpkZXNjcmlwdGlvbj48cmRmOkFsdD48cmRmOmxpIHhtbDpsYW5nPSJ4LWRlZmF1bHQiPldlYnNpdGUgcGFnZSBub3QgZm91bmQgZXJyb3IgNDA0LiBPb3BzIHdvcnJpZWQgcm9ib3QgY2hhcmFjdGVyIHBlZWtpbmcgb3V0IG9mIG91dGVyIHNwYWNlLiBTaXRlIGNyYXNoIG9uIHRlY2huaWNhbCB3b3JrIHdlYiBkZXNpZ24gdGVtcGxhdGUgd2l0aCBjaGF0Ym90IG1hc2NvdC4gQ2FydG9vbiBvbmxpbmUgYm90IGFzc2lzdGFuY2UgZmFpbHVyZTwvcmRmOmxpPjwvcmRmOkFsdD48L2RjOmRlc2NyaXB0aW9uPgo8cGx1czpMaWNlbnNvcj48cmRmOlNlcT48cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz48cGx1czpMaWNlbnNvclVSTD5odHRwczovL3d3dy5pc3RvY2twaG90by5jb20vcGhvdG8vbGljZW5zZS1nbTE0MDQwNTk3MDYtP3V0bV9tZWRpdW09b3JnYW5pYyZhbXA7dXRtX3NvdXJjZT1nb29nbGUmYW1wO3V0bV9jYW1wYWlnbj1pcHRjdXJsPC9wbHVzOkxpY2Vuc29yVVJMPjwvcmRmOmxpPjwvcmRmOlNlcT48L3BsdXM6TGljZW5zb3I+CgkJPC9yZGY6RGVzY3JpcHRpb24+Cgk8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSJ3Ij8+Cv\\/tAQhQaG90b3Nob3AgMy4wADhCSU0EBAAAAAAA6xwCUAAKYXphdHZhbGVldhwCeADGV2Vic2l0ZSBwYWdlIG5vdCBmb3VuZCBlcnJvciA0MDQuIE9vcHMgd29ycmllZCByb2JvdCBjaGFyYWN0ZXIgcGVla2luZyBvdXQgb2Ygb3V0ZXIgc3BhY2UuIFNpdGUgY3Jhc2ggb24gdGVjaG5pY2FsIHdvcmsgd2ViIGRlc2lnbiB0ZW1wbGF0ZSB3aXRoIGNoYXRib3QgbWFzY290LiBDYXJ0b29uIG9ubGluZSBib3QgYXNzaXN0YW5jZSBmYWlsdXJlHAJuAAxHZXR0eSBJbWFnZXMA\\/9sAQwAKBwcIBwYKCAgICwoKCw4YEA4NDQ4dFRYRGCMfJSQiHyIhJis3LyYpNCkhIjBBMTQ5Oz4+PiUuRElDPEg3PT47\\/9sAQwEKCwsODQ4cEBAcOygiKDs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7\\/8IAEQgBmAJkAwERAAIRAQMRAf\\/EABsAAQABBQEAAAAAAAAAAAAAAAAFAQIDBAYH\\/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAAezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQ17NesCYaxpZVBFxeuWM5sy7UtwAAAAAAAAAAAAAAAAAAAAAAAAAAAKGnZGbzG6mhqaNmpqWQAAgVLQqAKm3myEsjmykstm51AAAAAAAAAAAAAAAAAAAAAAAGvZC7zC9Mw+869IFS0CAAECgCoAArFChWJWans3oMa21AAAAAAAAAAAAAAAAAAAAFhA9Mc71xD7zRRUoIzRgoBAAqUgUAVAzRhoIFBBRUnM3rMblpQAAAAAAAAAAAAAAAAABr2cx1xz\\/XGlqIBQAgUALotAAgUAVAACBQQUBAnM3tcb3lAAAAAAAAAAAAAAAAGNOV7Y5btjFYAgFACKloAgAXS3mJKAultAAEChdFqgIAvjts76bOgAAAAAAAAAAAAAABD7zw\\/o5aeoAAgFAnuerTSs2ZcaRm5Mc9a9m1LFak1jWlZq2b+br0I2wAVigKCCgIGaMFI6vOu0zuoAAAAAAAAAAAAAKHId+fKdudAAAIBRUkcWwkM3cl1657pic56wGUh9SXzaxaXmCtY0LKgoBAoIKAgCsWg7DOuwzsAAAAAAAAAAAACw4T08YLpkUAAAgFACBtS6lgQAAgUAVAACLisYwoCBUoUgVPRsdJmUAAAAAAAAAAAC04D08YXpkCgLi0ARcWqAM0YSgAgAVKQKFxaqAAEChWKKAgCggCSl9Nx0qAAAAAAAAAAADifRy5rripQFAAAIBQBWKAlcamcakM0YTQ1mD3nRsFAFQAAipaViigIAoIAR6VnpLSgAAAAAAAAAAQPTHBenkBmjDVAC+JnGrTERW8lACN\\/N7Pj0lMaGMw0BgI\\/WOQ6417AVAArEnm5lERZjAEXFpQQBWOwzvr5oAAAAAAAAAAY08y9nHVsAAqWg6Xlvt\\/P1HJ9ufH9uZQBM89dxw6XS2GOgBQ0jME4bvy0rCoAGxL6nw63mjZ5f15UUBAFBACOlmu7zsAAAAAAAAAAct258b6OaAAKAqem+TvvZth5f6+GCy1QJDN9B83XLLrEbZr0KlC8lZdcFLOA7crC0F5Ydjz31vPY4fpz5jWSipkjECggBHSzXd52AAAAAAAAABQ8x9nDT1ECpQFAT3PffebqOc644bvyBQPQvN1lMa1ilAAADAWlSI3jkOuEC8rHqfDrnXXTy7tywhQEAVi0AR2Gd9hNAAAAAAAAAARe8+ceviEAAUB6P5e0rjVDzT1cI\\/UBRLYvf+bthLKoaiatYLMNWFEqt0SObtLkTzzvywgHU89drz6DkN44\\/phBQEAUEZjCI9Hz0mZQAAAAAAAAAOS78+R786xQAAoS2NejeXsIbefPPVxQCjruHTp+W9Gua3iM1LaAAAoI6nnvfl5brzgtZFT1Hh13JbDyzty1rEFAQBQRcWm1L6pjpcAAAAAAAAAAcD6eMF1yEAAVO+83Wc57Hnfp4ymNSGbrWcZ3wO883WWxrjOuI3UysSevNFZ9VjQE3rxZLmJx6tSdd\\/N6nG4PeOW6YuJ\\/Gu95dBzO88\\/rPS40ON3jVq0QBQQB22N9VNAAAAAAAAAADzf18IzcCAAN7N9M8nepG6z5r6+Ponl7TGNaGp5p6uNp6D5uu7jXn3fmJ3Xhi56pO+WDz7gJ3XhtXQnfRz22peu57ht45PpgemcOslLQ8x7cpbN7nn0HmXXnG2BAFBAkJfTcdLwAAAAAAAAAAeZ+vhobgQAB2\\/n69Jy2OE9HLnuuPRPL2mMa0NTzL1cR3Xn6ynPXAdudtbl4yevNFZ9WrOoF7OW51c9BuZvWY3A9McxvEzm+i8eog9Z8+68+kxruefQeZdecbYEXFpQReel46SUoAAAAAAAAAAHmvr4amphqsUANiX1Dx97zDZ576eVh2\\/n6Smdadnn\\/p5R+p1PHfScenG9caOoAAAKFIEjnXUY1yPXlD6nonHpNZ0OJ6YidZnsa67GxwXTnBamIQAEd9jfQzQAAAAAAAAAAA8+9XGF6ZCABMY16H5ewAAA17PK\\/Xx383vfN257WYHpkAXJN68WnO0dPRbAEzjU9m+fd+Vh6t5+uwoAAA846c4fUQBmjs876bOgAAAAAAAAAAAOM9HLl+2AgATGNeh+XsAAANezy318bo7Lh02sa4ztgASevNgm5G+eAx7gEdfz3D9Mc30yj1bz9dhQAAB5x05w+ogDtsb6nOgAAAAAAAAAAABA9McH6uVBAAzxJ40AB2HDpI51qWcP6OcNvI2I73zdoOyC6ZqDbvHfvCqQWPcKS9JjWzZxPbnYImc26UATeb1GNjiN457Wbjdl0LOoxrsM7AAAAAAAAAAAAAw2eW+zhZSAAKGeXBYB6J5e0xjWhqeZeriAN3N7fz9Y4gN51rBlubZcUu7nXQ5ta4rtyxWZZZ3GoTWcFAI6XGu559B5l157svUY3QzGzGwXAAAAAAAAAAAAAHAenjB9coqUAKAAE3z1tZuGoDpkZow0jKdVw6zeNaKR5jrJG+Zzn+mOf3kuZOq5dJHOrE5TriKud6Wq3SSUog7O859QMpkLo3C4AAAAAAAAAAAAEPvPnnr4oFSgKAAAQLl6fjvpuPTku\\/OB6YtloZEl+e9qMuNYV0emIreUbRuY3JRM42BaUNsyQOZ3jld4lc77HG7QVM5UyxtgAAAAAAAAAAAAsOX64ul0N557tztBQFxaC+XbzbEnee+p49MVWJDbzEU1nBVgS3nvTzZXpncL5dgG7jWzKBhMxUFTYjnd5j7JPG5IoZSpmKkhAAAAAAAAAAAAGua9YjGCH68+V78xQAujqePXoeW9coWm2AYUhd5rWKMlVIWWOyndTerDGYkc6yygDXMhlAAOQ3z7LHTbjSNWtkobcbwAAAAAAAAAAAMBrUMBaCicH6+OKygKnaebtP89aVWFphNwyAFpH6zF2ZgRCxsSZKWZ5ZLNqtAAaxcZi4wmrUhGrZ0ObU1jRMdbkbpcAAAAAAAAAAAUNGqGMxFSwxnMejlFdMVLSV577\\/AM3XSqwFphM5sgAFhq2YE0jTWUJOMy2GEAA1S8GQ4zU2I66WWi8AAAAAAAAAAAAAAFCNq0sMZaZYhqhPTx19Zw1U6jh13+W8xlBjMZeboAAAAABYYQADVLwDmbOzl3IzgAAAAAAAAAAAAAAA1DRq0tJWNgjdTju\\/LoeW5XGr5dSuVsjq7jNGAoXG8AAAAAADXKAAwmMvBlN6NwqAAAAAAAAAAAAAAAChhNc2TMAWmAsLS2qHFanW5uItBcbwAAAAAAMRjAANFMq3GYloyAAAAAAAAAAAAAAAAAAAAGE1aAtMBhKAsNs2AAAAAAAWmAAAGimCpmJWUAAAAAAAAAAAAAAAAAAAADEadYChYYwVNayYlAAAAAAAGsAAAZSSi4AAAAAAAAAAAAAAAAAAAAAGMjzXs4708pblvbzqyJuXIAAAAAAADXKAAFSUjIAAAAAAAAAAAAAAAAAAAAAAChC7zwXp5Y7N\\/Gu\\/8vahSgAAAAAABgLQACRjYAAAAAAAAAAAAAAAAAAAAAAAANWzke\\/OC3n0vyd7THQAAAAFhjLSgMZcXgG\\/G0AAAAAAAAAAAAAAAAAAAAAAAAADSsyS0MNAC00016AAvMkXlShgMAqTzZAzgAAAAAAAAAAAAAAAAAAAAAAAAAAFpiMJZWqaVm9LsgAAAAwFDLEgXgAAAAAAAAAAAAAAAAAAAAAAAAAAAAFppl5YW0AAABfFxsF4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABaWlpQAqXF5UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\/\\/8QAMBAAAQQBAgQGAgEEAwEAAAAAAgABAwQFEBESExQgFSEwMTRAIlA1IyQyMyVBgGD\\/2gAIAQEAAQUC\\/wDUpWIRT5CoyfK02T5iovG6y8crrxyBeOQLxyuvGqqbL03TZKm6G3XJMTF+6kuV4keZrCjzhI8vbJFdtGnIi9Db8e1ndkNyyCDL3BQZ11Hl6hqOaOX9jJPFC0uagBS5myaksTS9jNxP9Hd9Wd2eLJ24VDnAdQ2YbDfqiMQGfMQRqbK2pU7u76O3C+kQiZd7+b97kDxegzuz18vYhVbJV7P6eWaOAbGaXFNck9Tby+vVys9dVrcNof0RmMY2sypJDlL0vLbv\\/wAnljeKTV339Hf8e4DKM6GWGb9DcyMVVWLUtovSq8TULUTEMtXhAsfwqOlxg7OLljtiiqccUNMNoBY57VdprnQvzhgcofDvOKrxQ5AWG92Ptv6MnK1xuU4fvezXstv6joLHLo1phG1NaF6+0TlHcB4CJyPqovEwOvLW6qKWeJ2GXqISsdVDDIZ1o6rWovEgkgkqXZRmt6P7+ps+2mJyH3CIQG\\/kSsv9A7M8gfSEuEzLjPufbtxtzq6\\/2XdhbIX3tH2vt2+W3ZFI8UnobeWrvv8AVoWeltfZyt7mEvLb1mbWHG2ZlHho2Q4uozdBSRYymSkwqnpz1\\/UZ9tN329PGzc+j9fKXOnh1lAQk7BFzNsTbZ\\/CbikxtmKPurU5LT1qMNdcK3Zk59hTuKsY2GwpoZID7383ixtqaPwi4vCLikB45Ox227nfdYE\\/L6xm0YWJysT9rPs+mGr8c2maseXbQoPZcIxYHcYhc9+132YW4nUscdqO1VOrL3V4XsTiLAKuT9NV939PBv\\/d\\/WzVjhD0Pd6cHTVkRMA2JnsTttvrSqvanABYXfZO+6JzrLrJjX\\/IGuRcddNbQ1ZSd\\/bSaELcMkZRSO22pCQEsJX2bTNWOObVm3eSMopO\\/Bt\\/d\\/WtTdRZ138uzE1+da0zNjl1+2lW6eu77M77+i\\/vpla\\/Mi1MykKMHlkhiaGJTytBCRcyTvbbtwIfWyMvJpejjq\\/T1NL1jqbXZjYedcFE+7p3ZkVqAU+RgZPlBT5Ql4nKvEpl4nKvEn3isRzaMzG0sbxS64SvxSaZux6cUnKk0xUXKofVzknkmd278bX6i3pk5+VW7cOG0BeQySDEE1+WR3dy9FncXqz8+NvfLhw3NGZyerA1aujJgCxM88\\/pPtpWhexYZmZvq5guK93u+74qvyaumUsc+3RxkFip4NVVnFV4q2mNHaiauz82ZRg8kjY8tyFxfWvE0IBPDMrMTQyqkfDZWYb8EzbrD1+bZ0zVjggxtWO3N4LVXgtVWohhtM+3o4Wrwx\\/WyL73++lX6m1pfsdNVWK\\/j1d+E22mP+HK+2tP\\/AENNLzMhxcGsfBNUhpEMtuQJZVW+Ssv8fShX6appdsdTawfytMh8\\/wBClVe3YEWEfrXvnd+Gr8uDTMWOZYWK\\/j1d+Fpiy3pH7u3CSgsnCuoqsc8zzHqJOBPPK+tT5SzBaYuvz7emWscmozbvg\\/laZD5+rNv2ABSHRqDTg+vkG2vi8fLTu79leF55xFgFSkQxFRuEXh9tY6M4qSti51HoWhZYeT8Xfd7gcFv06Lb2llJOO6sXX5FTTJQW7Nrw+2sRVngsaXKNiS3JGcR9vusZj+mH7GWHhv8Adiv5D0J\\/jqlNyLSyYefYIuT9FCKsVXjfsxo\\/kRtDGRORKD4\\/oZX+R7JJZJzxmN5P2s4H9XuxX8h6E\\/x2ZyKQCikx1nnwWoudX7KDvz7W\\/UDuWO183etDyYsrY1g+P6GV\\/kezGY3l\\/bzEfHS7oZjgk8Xtrxe2vF7a8Xtrxe2qExz1FZN4qxZW0Q6QTFXlhmCeO9Tdn1rEITzVuaR8Favp7vUqcpW7TVIv8y0HLWxHxe4vF7i8YuLxi4sXentT6W8naitTTHPLFXmmT46ypIJYlisd9yWNpYiZxfT27Xk3i1xX8ervwuyraOrJDPHYCxjwleSCaFcTac02AjIlxMoqk0ygqxwKzaCqMkhSmo4ylN8S\\/DLDJCXZg\\/laZD59Ck0jf9JvMRPZM+\\/3MtByrejvu\\/oV8pLWh8cnUuXmli05MnBpHKcJwZMCZnYmmqwyJ8bC68MBNjYGUdeKNGQRtYyi4n4iZRQHKqdcYWRgMg3KJQIRI3GhZJPj7LKvPNj5fHJ145OjMrVnhYB0HRn2TPu32snX59TVtvT3fajjN0TCzXMfsZAQJm3d33eOWSJxys4pssC8TjRZVSZKySIiItndwqSknq8AQvzW22bR0EYRiMmzcwXRRxyNbxKdnF8cG8z+erPtqD7P9pyZk+Mg5nQVVNi\\/J2cX7GbfUQI01Ow6KrOKxlLdOW2hCxiYcLtEEsr0RT0iZdJIS6OVSRlE277hWiNDViFMzBLpDA0PY\\/8Ak3tq0qyFTmhjj3LnlHJ\\/UXMXumfZbpvf7JHoWuSrscXaIuRVcUy5IRgn8kJbFrLG0oNA8DKXyjbyZTxuCcvOtFwMpfb3QR8HayHun\\/s71WISY4k47rzAvdlCPn9gy1f30cWKOQHik7MfS5Qu7CxE5aF7IH3DV2YmOu7KVbrdWOLid2VUSZ90MByKKEYQ7R\\/xTPpJKETDerk6Ok1qfQ491JG+0bEhhd0zbN9j30d9eIUcrLIN\\/WXlssfDzLDfiJFxPoXsovftIBNFVB09R1LSnNeESKHH8tDEAaF7do6sSsSvNNVpyWVDXGMRbhb73\\/Tvs7loR7Jgd0VZ5I4YjGS5JzJ4ojmNbOsWO0B3oRQSBK2haR\\/7fVL27X\\/GbXpCe4IsAxj+hlDQ32aMd0Ee2lyEpYYcZPKosVACGvGCIG2KMSG5QeFQSvDL2R\\/7\\/pyhxgBcY6Rt+QNxP+iKJnT1t3GMQ7NlxrjdOTvo7bsdV+t9md99YPOT1i7pBeMhJjFR+4Dwj+pMN+ziZH5FqZcAQA4Q+sXt3HA7E9rgVL+rH+rIN0X4p330P31D+4m+uAcbszM36whYmONwRE0YBcmCQMjG66uu6ZztuADGH0H9+1m3cB4R\\/X36ZzwHGcRKiwvbAG2fyf6Be\\/bHHwt+xnrxWBtYeSNRu8U8aP8Ay9NyFlzomXUwLqoF1MCeeHdjEuyOPh\\/az1IbLBHy2k7XdhYrtcF1\\/EubcNcu8S6SV14fG6bH110VZdJXXSwLpK6KpX3ejC6A5ITZnJwjYf3G26eNOLtpYm5IDSeRDXhD03909VpQEWBv3bszoqolNy3Wz+kwO6aBMLD\\/APBbMuAVy2XLZcpctly2XAP\\/AIL\\/AP\\/EACkRAAEDAwQCAgICAwAAAAAAAAEAAhEQEjEgMEBQAyEEURNgFIAiMpD\\/2gAIAQMBAT8B\\/tLKkK4K4K5XK5XK5XBXBSFPdyFcFeripPAlXFXK4dncrip5Uq7rS5XHoZU9QXrPSz0pd9dUD0JdCJnbGEVChRSFCihyopChHPCB55d9bs+kFNJpPuk0lTSfdDwweaXTwZ6ActxnshynHiWlWq0K0K0K1RyhyHGNq0q0q06wJQEbBbtQrSrTut5BM7LRV51ATtkSiI1ip3Rx3naAip0gTukTrbV26OOfey0VcdQEbzhxm8Z2NpogVJk6W51SpUqVKlTsNq7eHGfstHurtTKzuuzoHTuzstHqrj7Qb6VoRaKtxQ0e60Sv5Q+kCDjR5X3mxqd43s\\/zleJ97ZoKOq2rkArVbtjjuzsATUmBRuKHFW40fI\\/3HtfjbEQvixJ0PuZ5L49LyfIBbAXhY5rYNBR1RUptTsjkHOw0VcaNxQ4q3GjyeIPX4vMRlePxhg0EAiCvxs+qijqCpo2p2RyHZ1jRBUFNxQ4UGjKHcFHZoKmVBTRUjYA5Ls6252TQZodJIGV\\/IeZgLxeYO9HOkbpzqA5T9bc7Jq06vkxYvDFghH158anHcOdIHLdjYuKuKuKuKuKGKFXGoQMojR5gSyAvH5rBa5Nu8r7hpJjRcVcVcVcVcUDUmsUA6luKHGkGEDKhRWxsyg0DFIoTot1NqUB0Lh73A6Fertc\\/dYUKKlylGgFSKQVBWFcrujcPXADaFtAjS5XKaEmsbZbRvR2BWhFm1aVBTRqhQiFFYUbxCb0zhrDfvoMHpz60tEbccYjp350NHvehQo7lx96GY\\/SCg0q0f05uKvUj9KcJq3P6XEot\\/TiJ\\/wCAX\\/\\/EACcRAAEDAgYCAwEBAQAAAAAAAAEAAhEQEgMgITAxQBNQMkFRYIBw\\/9oACAECAQE\\/Af8AUsFWlWFWFWFWFWFWFWFWFWFWlQfd2leMrxqwK0dCArQrFafZAEoYZQwwoA7UBWqPWDDKDAM57Vqj04BKGF+rRvpSPStw\\/wBUR6kj0LWEoNA23coFSrldS5EoniEUDAVylXKU3jpEd9uH+7saojTRAarXQK2kG2FrKjhFQYChayo0WsocdMjusZHRgegPbYyOgdfRHtYbI16heAvIryriryvIgQe0exhtk5Bm8jV5Gq8HOXQi4nYD1M7NwVwVw3T2AIEbOIdIrhj7zOdG2DCBnOajdPXwh97TjJqBAyudAywtFpmBjO81aN09dogbOIYFcMazmcZO8w\\/XWPWYJdtPMmrRAyvMDLCtKtVqtVqtVqjO81aN49bCGy8wKsEnNiVDdsijOMhM1HpML47OIZNWCAnPIK8hQeSav5o0VtyhSjR1GVeatCcYVxVxQ2j12fHYcYFWiTTE+VG81fzkFHZPpQjQ8UZUmTUCE+o49Cz47GIdYrhjSaYnyo3mr+aCgKkI5Zq6jKOOlWjWj6jjZPYZ8VrmJgTUK5qvanmTRvKuFMQUbuOo3ijjrVsBSE41B2Cezh\\/HPifHZHNHCRRuaERlchU7LeMxPaws+J8dkc1eIOYIr6zMH3U7LeMpPbwjrnIleNq8bV42rxtXjanCDQcqwVIlEQgcgRC4rKJTROS0K0K0K0K0JwioArNCe4DB3cT5UbzlLZREKVcpySrqATkvU5X1HCJ9DhmRuFgJXiCGGBWRUiUW\\/lZU5Az9RCClONQ6aXBSEdVarVx6LDMHoOf+Ua\\/9oTCAhRKsC8ahQg0UClTtB1Hej8hXkchifu1cFcE931llXK5ByuCNAVOQnaBTvTYbvrO7E\\/FPTJ3OQj6YGRle6dudid6Y9Ph8ZHmBvSpU0n27BARMVxOf4hsTqjiAI4hU1n\\/m8I\\/3g1RaCjhlWkLj+JYQDqpmj+P4sEhDEH2jqP40OI2IULRaKVKlSpUqVKn+An\\/V3\\/\\/EADwQAAECAwMHCwQCAQQDAAAAAAEAAgMRIRASMSAiMDJBUXEEEyMzQEJhcoGRoVBSkrFigqIUY4DBJDRg\\/9oACAEBAAY\\/Av8AlLnRmD+y69q62f8AUrF59FqxPZdXE+F1URdVEXVxPhYRPZa5H9V149lSPD\\/JUIP1rPjNHqs0Pf6LMggcSqOa3gFWO\\/3Wc4njoJz9MqhWbHf7rWD+LV0kH8SquLPMF0cRruB+oziRGt4ldG10T4WZdhrpIrneuRIdixxtmDJdZeG51VKNDLfFq6KIHfS7znBo3lShgxD8KjubH8VMmZtkdlsnxLgljLQYS0DWiHJwxdPHQzBkpP6VvjipB1132u+j3ojw0KXJ2f2cs+LMynnHSz7Rdf0jNxU4buI2j6Hee4NA2lXeTD+5V57i4+Ojx0AkAEWEgy3HIHhoZZYexxaRtCEOPJr9h2H6Dd14n2qcR3AbBo3vhwREfzkqsvUkuTl7WwIj53qSTYkOIIrS67Teog59hdDbNzUy9GYx0TUadqIOITmCOwxAJ3EIkSM2EHGTZ7VylsYgOhj2TGuMgSnta6GxkMVIbK6oTGxGubF1XhRYk+rIVzn2c5dvBm9c6+K2GCZNntUUNAA3DJphom81ewre32iDyg5vddu7dMow+THi\\/SCs06G15a8xJ03IRI5J8TWSa3nueeIodqSXK4zXOm6GZtLZXVCH+oMEwxIjm700XEzJKMe9mXZTl4KFDjRDDMInuzmuVF5LGxhIGU0xxwBXKQ5xEONg6WC5M2GS9kEmbpSnNR4cOMXmIQRmyUONezA2WHgmw4sQwzDcTqzmokRhm04W79LOVLRyaKfIf+u2FzjIDaubh5sL99huPiuc3cT2MOkDI4FF0g2ZwGWJeuTndYyju1EkyAVxlIQ+cqmSN+SHgAy+4aGfaWv7po7h2rmIZzBrHfZ46c1lbO5cbvdRdJGLvKF1TncSuo\\/yK1Xt4FdDH9HBdJDMt+zSYTslOmkYTi3NPaObYekf8DILWvDx9wyQ1omTQKsMH+y1B+SMR7QGj+WXm0YMXnAKbG33fe5VrZTIuipdsV6F0T\\/gq5EbI6ERGMzThVag\\/Jag\\/JFjsW0OjwkosPgezl7sBVOiu25U7THODMONreTjbV2VffSEPlBobdYMGqZo0fCpkzK5097DwFnNxRwO5XH+h35bIQ7xQa3AUFj4m3ZxU9I8fw7O3k471XaGQTYe3bxsLnYBPinvFVwyLuDRVxQDRJrcBZVZrC+HuGLV0XJneq7jFXlK\\/wDZX\\/kRrw+0ZBhPx7p3Iw3iTm5F1zS07jY7lB20baIAwZU8ciQ2ow36wx0Dz\\/Ds74m80yCMm+dWHX1tEEYxMeGUGd51X6Ycpbi2jsi89xcd5TYbcXGSbDbg0WOiuwaE57zV1dBUyyYsTgOzPO05o0TQdZ1XWufswbwyWz1WZxU99tVWK30qqXj6KkI+pVIQ91qMWqxajFnQ\\/YrNNdxsMN2DhJOhnFplkO5QcG0HG1vJx5naMPuNfLY7C1m9+d2aFD9bDLbltnqtqbbjdeJmjKiRPudKy+8yCzMxvys4k8dDMGRVdYY2XvvbO0AYlMhDYK2F7sAJlPinvHRiVjIQ2mqkMB2aX2tA0E5SV460StplqszQmxX35ncVjE91EiNL5tbPG2F4zPzYR3WUsDBtRm8eCkRLI5+JIiSMEMu3ldBnYB91LIDuIsxkudOrD\\/dogjF+PBOZEnINnRYxPdYxPdRIbcGlGmhPKHCrqN4dni8dA2HsxPC1z+8aNsh+v7sjeQqosgcP+0TutfJkyNqvXzNMJAyBCD8\\/dNXnyk35U2CyHxsg8Ta1neNXWvibMBwT\\/JbG82hDO7i4oNaJAdnjebQGMcX4cLeaGEP92Q\\/X92RvIbYf8SQii3cZWSGrOqBDdmMkam7sGReaZFHPNcbYdkFngTYCdVlTbdGtEpY\\/yWxvNoAxomTgrveOse0RfMn3gb\\/dsqchkId4oNbgKWOc1t5wFAi4wXTK6hyYx7brhOlkVrRMltFMwXSFkSF\\/YWP8a6QeAsI+wXbATrPzjaS2C4sbRq6hye6LDLRd22xnthOMzTxRY9t1w2ZfOxB0p\\/x7S7xAOXD9f1oYnlNjXnVwNjIn9cmTRMpl6Jj8ouYJw9+S9\\/onRXYNCLjibIflGhien6ybzzedghGjDpNg+3tUOJvEsuH6\\/rQxPKUAMSix2IV068OnonNGOzJpuqnTRz8iQqTggzbtQ5O3ZV3G2H5RoYnp+skR4wz+63d2u99hnliJD1gtYfitcfitcfitcfitcfimRImsbIj24tbMItLhI\\/xtERuz5QiMwPwjGhCneGQC8yC52G4SK5t2detkBMnYr76v\\/S\\/3HaoVXeptDQ4SH8Vrt\\/Fa7fxWu38Vrt\\/FObFIIDZ4WxIbHC600ojEiaxXRwyVSF\\/kukhlqHKIw8jf++2OhnvCSuu7ugay40S7205EP1\\/dkbyHJm2oOLd6vwzxG5X4ZuO+CukhmW8W3Lxks5xNmFxu8rNE3byvuibGoveZk2BjBMlUjC9ukrsRssl\\/ktjeZc9FGZsG9SFBZVV7bfGEStszoRCaxhA3rq4adDMNknCVt\\/m3Xd8rb8N0igI2Y7fsU2kEbws6GFQuHquseqlzvVZkMBTiODR4q7ycS\\/kVMmc1NUw3ouHvZce28FfZnQ\\/0pNaSfBdX7ldX8ou5upEs4Lqoa6qGr0pOiOQYMGiX0Ey1mVGRXRy3oRI44NUgr0KgOxZzZWzhvLeCk4Nes6AfRy6l6zYHu5UIZ5QrziSd5VAqi7xUwbxCF1XRstlvUmNAClJVClIEK\\/A9lIiRRf8AYpj6E5xLpE0aur\\/yU4Dv6uUiJEZJrbmtJ4LqiqwnIRog8oUhZIq65OkJNG5UeVrhXhKq2KslgusLpblqz4qQEg4Wl3ed8aHOXOsGePlRJ4mSuSPhKyoUx22QyefGs3HKutEyVejV8FQSt8DkFuHirp97HKVhecJ2Xr07wsDvtVFM62T65c26pqmxyMRmqbbZiyfaZZT2nAhFh2ZN5wzjj4aKRU2V8EGnfacbtl\\/YRZWgVK+Oim90lK9LjZDc7VZreNswsFKRVe3VWKuDagfCw79ll44MrluHrlZwBVJhUcFdBZdVXtQvRSQNio3QOG51tUXH0U9Vm9Bgm7ipfQ5N91MqTc0704xMRRGWDaK4wTNmCc7eVdMVTY4HJ\\/r2TzjIELYTj4INaJAKf0GYslvU1M2O5rrNizujHjiqi8fFZrQOAsLSKHcr7M5n6QcPXJ\\/r2SmsKhTFs\\/osy5UycMiRRgtwn8ZMR39ey86wTB1mq80zFklL6VMZM5VyC47EAccT2a\\/BN120bCulhvafBc9dIB1Z\\/VP9uGfc9okcNqkMB9NqvBF7sG1RcDrGZBWe0t+V1vwrsObYe129BrRIDs8gpfULsEy3jerr2lp8bGB4mCpCgHaJnH6ldismr0DpG7tqaSJFrtNVwXWM911rPdda33XWs911rPdZrgeByJnH6r0jK79qAnOQypkyXWA8F0UGI\\/0WbAa3zFVjMbwCzuVP9FnRIjvVapPqur+V1QXVNXVNXVhZoLT4FCHGN4HVeqLx+s0toJuNGhX+UuLnbtgWbDb7aW7EwUh9cwQizM2igsw0WCqVQf8AweFmKxWNmH\\/Av\\/\\/EACwQAQABAwEFCAMBAQEAAAAAAAERACExQRAgUWFxMECBkaGx0fBQwfHhgGD\\/2gAIAQEAAT8h\\/wCpFAlYr1MwVmfDZ9q1Z0fBQsdBVHD+D5p0PJ+VfQPmvsHzRqj4fKhsh4fmsp1SrGh1RWT3goqTOT+ayTcCT5FZ+OUD1pfn09fXX617R4+1OT1BPYcAzHFvIyg8msSeU0rMiPtatNvP9LVtb+mKCkHrfkoJJoQ44VIADkS+teTk2eW49gnmx3IAQQZHHbIgjUqIB\\/ZcajFnWPKpZyab+X4tkI5SCpbknbzVMg8G31zSpSZV2usUqGGdq0ExlK\\/DfLOJpSIJODTsJziX9L2IJCMJUEnI\\/dUTM+Q+HH8P16hrT3ifTFSdgUoy3DtcsyzETfvEQnPLnRq68mW34MS5hJFZfCvsUpedV2YSrBMEZ7BgWBM+tI99cxuLcCyLEdjPRiZxfz38eIkrgDf1YfwIqOgcdav3mj7HZmIf5AoireNgJsppWXOwJHBDVoNxhk5U6Lhyp+FGVCQlLEl4mUiaNstds6Jb\\/llyzahnCitYPd4CcPFqeRncRbNqhLgicZYqdpXkpETRlHvFv\\/VF1SQEGDcIm+KuLrrT2TTACOLqjltVyuC+h5d+URADK0liGPh+aVVVlezAELhflRCVMxhxogDCRXos86z1k2YCm4XY7kWWnhCtFnCOlTKCVjNN8J5jNvvT9ciLFZ8GjTBSiIi3hWEgr50T9LDLKS1CU6dYIKkhdjhDigzUNMs2+9FtqxYv7qbkSURpsM3YoAgYTZ49razSYGLTtWeRr3wbc0q0p0iHn19xNlncxiqzBZ61neTDAdN+zcxlx3BRkYSsw9Q4PejLAlXSp4KbHvd6ZtQgyzuuJPFuun9Eh2LAyL6TfcsLBBFjsoYns2Ufenepe+bGvh02NmB4me3BuECSddp4JFbLdwiqBdY9OL7PGsN9LrQNwei9au4ODfzdoEpMiL6bIEFLJx7Sc0l5H+R3jAAf9NwkbwEDuz7HBzoijcI1\\/LUemZWG+0YVaFn1JbhV13R5Gl0Uss7SwSwFjxo5h4J9ilbj9d8YRiY40pGAnQonDlJK\\/nq\\/nqh2msM33XcMYGzO9YWQItrV3aI+z+u7tbBya1kNjgaG9FwGGYSTbG3T6n+bY3fqjeuPbd1fAoEwICrbDUhcPHdBkgLq06HGj9OtCmK8Gpy+VJrg3PA38lMC8DVo\\/oODlsPQRHWxSqJlcvaRcY\\/c7vKm\\/ktPvLsQQCVwUOjiefVsYqBleVcokOBpURiuoGNwN6UyiWmgqM01X2th5VMhnOvM+\\/jWmDoVDjzlF5TvoPWhMNtgvLiqm8CEpYylybM7XQjkIdkL\\/wBLV2zl91f577jHmUFFpCwJnsJuEfud2UCXBT6P5DTcIQC+sY3bZ\\/UNsof1G9NZrXPhQVIpexMPYMM0Qj1k0dxKw5SWjpkgrQ+GzVsHWpc5FITfsAp0HDds9J++Xdo2YHzP8nsoZR507MEtQO2vgN00GfQMetGys06YbAJQHFr3cP0r2x\\/KtRPArQnrOnQ9Sv5b80anqVNYxQT47NsvWuXjWQULchD\\/AF3p77bb\\/pY7MlLhblbb8IuPHHpHdrFcq\\/Y\\/ewQKIQ89+ECf5+1FW7ljrvcUAPQ\\/tL2qfQD1pQLpftT8q8VPYNCXBhK8MfypQGrJwXjx+tplykBxrIRecXXYukOTlWTGSOBodnoiWvLrs57E4GtAygIDu059hP77CbgkzBgqPOLnpp957Yep\\/wBxpNLucGelfyPxUuBBI+NvWNPrpTuFMa3IHPV2OqDxVCBQXBmpcuo3L7BaRMURCGxYjr1q2uiemxtOCtk\\/01tlxZAm+tTg6p7Nst9foU5pgJxqV\\/M\\/FfzPxUydqTmoFhki+nY\\/a5E93n\\/R6dgkFn4KgAgIDZAzHmTs9d7mz7jhSEyNrQxfZ657q6CVM3cuxkyqw1qEkpJvnlQQgTeHXcPWIYPxR5GmKWbiIWIl3N+y4G2WiPMnYoEtgpJzPwVfb5naYcZB0BQYBwBod39Z2xGd2EP6zbDrxvds9d7mz7jhth39Sf3QkmnYy3k2XGukIqPPkY0tZF7TcOQDDSzevbRPWfZ2WuF7D42R5n\\/ONss8WvTX7zq1SFtWvt8zfxZxoTncQW+Aa0IMN7jveID1UEnqJjY4zsgJGCCdzgMi8DWiug4HLYiKwOrS46SvHZqMrgursXMuA1pqUErsmnXE9h\\/VXBqI6OPj\\/s9i7ZhxX9fuglCoKbB8vVdkfPuG0GM9bns9AOiPFJtIDSsLURFkLdRMkUCgCVwFaanHB895mf8AIj9b\\/pvc7H7bhsnpC8lps1bfNe5+92THgBNZANQsUSIHFuyaYA\\/fKtW5dXQpGZWV2fRcOx+9ybsx6BKKESyz\\/V+9Q8d+V\\/3f9N7nY\\/bcKzhEFCPDwkzUC9iXPQ02js9ZRuBQCHNRNvMzariJA\\/yl2gA5UDjUP3yXFoVXZ\\/C2\\/RcOx+9ybsW7rp63n3uyS5+DFQgMWcbyNBgUmv46v4qv4qv4qv4qkaGSUI12PfDKIONhs25bcjg4UhM6Gq4NTFFc\\/coRJNrzA1qeU4rmrASlgy7bi7CFafWsgIS6HOrolLK6m2BDYLK\\/kK\\/kK\\/gK\\/gKgGhRC8m02ODI0ywwyhFYU+OnnWeBYtFrzEktXm+nu75icWjWaUkcNqKhITTdKVDWBk47nrvc2fccN3mCVil4k1M9VOJXmj3sIqTWpohBcNIywcWkNfKo59c+VE5jOZpDiLoc2n75zt+iy940DzqRl++79vmbmX0g\\/fwrAADAYNkIgJzpbLigEj3yZC159fvPaiIq5XsZzI3lOa+k\\/NG+KST87RYOq42lEHqUeM2jL4o6xYSSlpu9Qh9K9Oun3ivXKpl64xLXUfTNPC7jzeBV4xZLrUFmGlbI42KKi+JauxOJdGpWfia9dckJCaCkZ0Ci9XQVwt0avsPzX2H5pihgDF6ArBBtdk2O5KCY73PTP+8bl61SHDr2ZNLZXONeMBdOvxQqib1jPFPw3VtiJcLmzUCOi8kPpTMD6cK\\/qFaJ9f8qtp\\/0u1zUWS03uZ0CsCCmXQlEs0cTdtHCgHg2naUOCPCuUog2EGkKXpDSiBsPlfinLgsjQukwt1roTtkTQyW2W3R73mfKppEgLBViJnOVBJq\\/S9O3WCOm7AsEE312pQzyTQ0ni2oOYnImpXVL3oB6uxxrU6BP7rQL2iWmYnUmjlFDjUISIkvX2tFGebWaXodY1iEV+yk1EhYA4m18uabhSuVvvpTnaFGRirUCaBLBuGioNCBWIodaS9SrOdGjy6sJJKRUBpTAb96+d2Zm2BOjzm8GRgBUQuPIfNEKRMRbYoTV2wkJ+9xSMksNKB3vdsXgooQcBsWITso9FcCAxGywuqfDWi4LlxFHrfZuqZeb3pQxvBctAcnJU3ByDA18BRZ5qfuvUgYnZLL3mK3x2udrMiRrOIvPczR4df4V7bKQl8trmzhpyXOHruRgkrSBSYARSQ1DjUONSzzPlR21TuaS9To2BPq0GLgRLLWd33n32T212R\\/HTnV9vQihEkbNa71D0FBBBjZP1eFJyyUJVE8qYmwoIDvCwTSyl2aZsSMg619JQ4yeugOK2TMnkbCiJ9ZpQOUU0umm6Pyn6freAiExJWSU6ldSjmXcVn2oZt+ktdGcEFYqnj2FbzD1v+9wLNabOBSkbGX+qdjqaGF39JRxq3pUmKCXYhfWliuhOhQTWUEpIUBykWJjZzHlQ6p7dK30aBNR3PLarxscQ4+x\\/3uj4Wx1P89tywKSiiOooCoCeX8DPsrPzlUqyeFDqXhseogPFTEnoPZUavxn+qIjo4UCZXG6GFBrupxou+tnEoZJKWCabuz0ve\\/526QxupoVl50J2uJweG0GYuFq6CZ\\/B3MtQuu\\/AoizHHcdQU8NOlQELsBgkbJQwnIPCluUVI28oCDwv++3N53m6MC15nOjgE12SYspahLzfiuYNqxQjUYwkXaVc7RxIedZlfmt3txO\\/fHTLTgmuCRpgeKinH8YV5ZpShL0mWxT0m4Y0vMn747xPFLIoDIAgDT8bHh40lx4qxyEqkWiXIo+98rKCSDzVDvV+eQrTTLuOTeQsjQxPH8fnNNAqZX9qYmOQbA+uSHpVgDAChY7jl3c1xoen5KHg6Op0ak09D+aVcEonOlntTCDq05heGkPi7XVdb5GvemNua+7R+Vjhug2HjTgQQS5oYd2OIcViswjx1CiNNtGhnrfqtf8AyV7wKhz1joLT5qip\\/nV\\/CqU95rpQmjE1f6mowJq+t\\/zBAhJodUVo3lsusn5lpmWtLFGJXPLs8lArATSoYehmjp2PzmUotrQTBzpHENJZXZfJKLM3Ioqwf+CUyFKU69c5UOKucrr0BQAwR\\/wV\\/9oADAMBAAIAAwAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUMOluakAAAAAAAAAAAAAAAAAAAAAAAAAAAARGDHbEt2zIBBXgAAAAAAAAAAAAAAAAAAAAAAAVmhKSbYlu2ZAAm8HgAAAAAAAAAAAAAAAAAAAAJ2pQJyTbUt2zLgE36CoAAAAAAAAAAAAAAAAAACqltIBKSPYlu2ZAAm\\/QJPgAAAAAAAAAAAAAAAAfKktpALSTbHR27IAE16BIegAAAAAAAAAAAAAAAL20ltICZM7nLfqZCMm\\/QJePwAAAAAAAAAAAAAATe2ktpTZmE6o9mLIAE36BINggAAAAAAAAAAAABNL20ltIBISbYlu2ZAA1\\/QJUMGAAAAAAAAAAAABdJe2kspAFSTbGt2zIAE16BIRgmAAAAAAAAAAAAFZL20ltIDIJC5tu2ZAA2\\/QJCMFwAAAAAAAAAAAdJNe3m5pAJERQANWzIR+TaBARg\\/AAAAAAAAAAANJJJ20AtIBFaAAIK2ZAQAPQJCMFkAAAAAAAAAABhJJe2DApAGbmm0STbYAAH6RIRgsgAAAAAAAAACAJZL0ABtIGIAAACQKbT8d\\/QJDsFoAAAAAAAAAAABJJe0RtpFYD5weLwvIMDX6BIR2sAAAAAAAAAACDJJLwDFtJAPySSQWwZSgK\\/QJCMmQAAAAAAAAAAcBJJMgfNpZGduSaZ+bDATJMBIRgoAAAAAAAAAAAgJJJgeoQIoRDyRIMz7IA8AQJCMaAAAAAAAAAAAMDJJYCFCJDOUmSONuDUB3gCBIR0AAAAAAAAAAADkJJZCrcKK4SSSSRsR7gIoCgJAPgAAAAAAAAAAAEBJIAAAAFCeSTJDtnrcAAADBIMAAAAAAAAAAAACgJJAAAAAhPiSQ7tsubgAAAYJAAAAAAAAAAAAAAMBJJ\\/+ljBAwySst6GTXbQgbe3gAAAAAAAAAAAAAsLJLq0oRIACB+J67XlgA8AAQKAAAAAAAAAAAAADhJJe2m+JEKyVDF9hqcez28SQaAAAAAAAAAAAAAIJZL20lsfACfP0r3MSTHLvSSQIAAAAAAAAAAAAALJJe2mBvStPB9k2QySG2okAAAAAAAAAAAAAAABQSFL28S0AB2MTMx8SSS221gLCIAAAAAAAAAAABASTpenC20ACXtwp7iSQU3AiCYKAAAAAAAAAAAAASCCK3S2mgAAAPw8SSSK2hCAAAAAAAAAAAAAAACAAYZs3a02AAAAAACSSRW1TAAAAAAAAAAAAAAAAKAAT8qKEm4AAAAAAASSAWzQAAAAAAAAAAAAAAACJQABbAC23AAAAAAASSSc0gAAAAAAAAAAAAAAAAAAAAKAAG2AAAAAAAASSSMkAAAAAAAAAAAAAAAAAAAAAQSW0kAAAAAAACSSSSAAAAAAAAAAAAAAAAAAAAAATdaeAAAAAAAASSSSAAAAAAAAAAAAAAAAAAAAAAASQzYAAAAAAACSSSAAAAAAAAAAAAAAAAAAAAAAAADHJAAAAACRJASTAAAAAAAAAAAAAAAAAAAAAAAAAALYACMm23t984AAAAAAAAAAAAAAAAAAAAAAAAAAACLBHAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALIAAACZQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQbJIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf\\/xAAmEQEAAgEDBAICAwEAAAAAAAABABEQICExMEBBUFFhYHGAofDB\\/9oACAEDAQE\\/EP5S0n3ZCsrKysrkPulPn3aHmMn4Eun2dgL5hA+UICPsVDmJ8RbiKedB2wyHygjx6tagnEU1gPPYeOkMgH06hzPgm639KMgj6Na5wlXntEprtLqW8+hKE5dP4CDi9o7LJ+8L4+NwsWsBvcOYLjmStln7w2X2E1nwvf8Aj6opSLe2OzmbbsBRvGU3QRKZRWHMpb9yglRQEJTdBEpitvs\\/E94tTiHHY2ee0eorO74Rx2A036JU91fsdoJD5uD6MT8Yo57pWdxWo0JTtpC80gW61gegB4iJz0Ru+QqvRlouWL6NzefBrwV0gG8RaxbWVRfV59vsV0qlY4itvTcgVoubzeUytFColNah5yt60pXQ59urX0bm81FaqnW82i7gW1AorC0XOfRlXVBvGkXpWSkrnvnEcJcSmtA85XjpjWRR2y4OjZkqK1Da8LUX4lvSG8DQFFZW2+qFvbvoqsrIJs4hF6RW4F34jSJBtrQvHNyrVqr\\/AH6j3SscseORbeVtUJd5SUiU10j57fk6FytMcGObPBoDQ7GPDKiBDoSV\\/j\\/s3c2\\/1Lk45Y8cmjKtucs8uiLe45uhUXm5rHBjmy8HnG7vMuR\\/tCJW\\/nRWiyBAA2zyx44NuXRjlnl0RR3HJCq1C2obYdifVPqgSjgWp9WFyYO\\/U54V4GjJTPqiDvlFiVro7k63F0eDh1bB0i2qn0B\\/UANnUrReTjrS3KN3uhuOvi6PBwlNSwqJZpKs\\/MakqNf586AuBU8GTjrXme7N6wo2aqqa2cKhdAkbIAsnk0LhtmwW5PAgVkLgVKnRABl3yoxb3gLxLyk5nme8Syo\\/HQvatHBjm0ooA2jaKJWFLzeE0KlQgKlBFvdwF7YonOnlnlLt30NVuogqWi0rNPORTchtIu5UpKSkqKE+CFGCtyAsqwg8ymBcMUKpaWnLDb0NnYPM43rIiQWxWwU4lifrC3iXAS4m8FAoqVDbQAcaPgwN\\/R7mL4Jx0AXifREvE8rlLiSgMbxFl4LhtzKaA6V288vTXF6guCQbca0uJpvC6ArqMBv0qWVBatNK\\/PTfhoMOAgVqNN4sT040LuspkqVKOgaa9TdAK0ZHKWd9XqbVtFcwKAHGa\\/Dq\\/KbqDZftOfwhaLgDcB5g3Eu\\/wlBRETn8NEcopxDZ7C5cv3Ycoa7lzebypUqVKlSpUr8AqV\\/K3\\/\\/EACQRAQACAQMFAQADAQAAAAAAAAEAETEQICEwQEFQUWFgcYCB\\/9oACAECAQE\\/EP8AUonifnPx179p+0\\/bZD+Mo8e7FwQXMD5YHAfEoOup4jJ+GIREz7HAEVniDzzDEO5YtH5ijPqwXgjs8T9aY1OdUhwdhTfSQxZ6dCgnmig4PSixE9GCtE8sgFHaDZfaZlOPQ874hNHTpUWipVdckLtJUL1xmNFoxMz7riUtBcXl5RUKSovzMFTEeQfZ9VxGrQRWOvz518h3\\/m6tvdxUZpC8qrieR9ireLuBRWkIEhmXCniciUUZJdG\\/MBBSXuRBYIUA9n5O8BWiDzc9iE2HZsx1BT3QXwQDbncdIUr0Qs7qhbPakrwR+s\\/eET6JhHuhT3HLODYlLStqgWx+k\\/SCqN5ZzOa1sqMZ5gBZ0UGnWLvn0cFaIZDc8mtf6dHY5mKrbMytz80RWQxZvVFxb0FtdXHt7W3StnQLaJUEdgXRVbdeGU8ui\\/iWfJZ42IrIIlmy7xp4Nai9o30Me3pzo8L91v8Aw3c91qHYoMRaLi23oFtSqx6PUdV686QidC8\\/vP7yv2f3i4ozoNcwbL2cFa+bpuq57bM6J0v5hwbnyGgXA8wA6DEuUOivUyxegXBRXVWjtxXQeJwvzX\\/ux2GmcHV84SgvQLa0VsFFsA8Q06DjTz1oK1ubiDjWlZfSfjtzQ6F+615pk0x65YQxpjLb2imkOfMYvGyydeY1qVMNcXRWjuMHQvo8a1\\/ppk0x6nnorNEJyRW7BqW1w0OXSrVdow1xdBit7jBHkVjddQttugFplRQz9ICpogKy\\/wA6YnRcdF1w0NaLtSDM\\/aAnGoAQbxvs7l2N+To4tLg0fNbqyjG1cwW1KrTJ6wFSzg7p8JvydHFFogiWTnDDBpuDZszmW2tEW55WuT1jxHd0V+7wFO6oCUNCIGBt6kKYiplcG9UDzLOSNCtUEslr8mOhVQjjVRcCiiKGZWWM8R3lAwp5OgHN3syaY9pGmO6YIgPMpLluIv2II\\/EW5egAUaKBbKfIBxtw1xSrg2V3vG\\/Opeln6RC715KvUBTFthEzLlpaWy4C4nmiwqK+GIJZoKckxGLUfppAMrKw4R59D\\/19j1PHo4KgRxKkqRGUu5j+o186Gyiqi4iY2bixb1Iq5lSpaT6aLivR8dT9J44ESzoKGY\\/eC+Z42o1Bvklrg5WAFaFPEtlGIvZZ0alXDBLlkr0dTbcoFsTEKXneNQb2sWGyza7yGVaXM6vfjTZCsNt6jG52XUPuXqxSEuNIq7nZUp0KNh6N8tHTjPvVuW00imhV6DtWot+luXDSQFulx4SpW3x2njZfF6PoTQi6oDwmK5iccRTlly2Ft3jtCJXp7l7qlbB4va47U54iV7YLjnth+zliCmvaYO4uvYBVEEpgsMc4lEPP8ItUAFmg5x\\/hStkdxwgsIw6tMplMplPusSxbhutP1Ki4p80WlpaWlpaWjTj3d6hc4YlvVuvfXxUvqX\\/Bbly5cv8AwZ\\/\\/xAAsEAEAAQMCBQMFAQEBAQEAAAABEQAhMUFREGFxgZEgobEwQMHR8FDx4YBg\\/9oACAEBAAE\\/EP8A6khSG6xUvYP7lrJ3+uqsT1kp\\/OD1SvagrgyuocERq+CpHyFX3tfwU\\/oOchr+cr3Khhl0jfE1zIESe3+yoErAVJgTJC8jU0aAT8yH2qcNsV7QPmpCAdB\\/apW0cjHxCp8Pdfl9CGr7jRnER6WoQlrA1Ex5heIWKGnOEVurBosG7MPYfmodF0WPMiuh5mHWMf6MWBEgAvQy9qgmOIT92\\/tUodw+\\/wBntTLAurfwHoC3AWwLE5bfXeIvCAmCDJO\\/ERdEJCd6iDujF7v5VuJhfeXPLU0nEpgequeP8vBCgw7tRrK05XUS9ipFRpS\\/jZKbpEpK93jcsSAEnMs9uI5sVxQSQN6fUgFAGYcNGOCJNHITePoHTn7qHBoI+i4YpRCPJp0cbSwDln5muhXpHmx2X5f467T6d+QMr0ptmYjl6n7+KhRGULBKaDofSeI2JgSXJG4bW9z6j9R1gLYX\\/NmTpUBYp8sH5Lf4YqikAFEM1o\\/wOr4rJyxi9ORy+moaoJWUyzpFvNPrUgAsqFgFK2nLpShqhndps659AIDYQyJW8Zb5b8X1XEZr8bojmjlj1rgKYBKXUiMFOf8AweWP8FoSG1l19OmakuJ0HQ\\/LP0z5SACEm0SExVwPRjQGipvpegunz2GRANzDRCxXeoWKQ5zpQrGRUMwKhEktOaQsw7RGEqKQmBfl4gY0qMjFUCy2LAsS0C9oQlC3UJbvQcR0UhcWvfHelJuXDmABrlzPamxxqSaCribc6CYu8ZnCOkU2\\/HAGJTEDE25UvhKojE4GF4louxwAbQcWrCaSvGYqI2pJmFNJN\\/pRE45kutDojim9IbvsX5adMCJIyOv3p4GlEAbtOLXQZeW3+G9O2RKrKv01w1IASctmc6Nt6MrUmiGNnOLVn0PIiFHQwxVoMgKaEYJv80\\/U\\/PqaRZVwHOgAHQ0jJl0b0y5BQKWVgsUk0gFxycTRkZoxOQRqEXtVxsc1NcG5RUYXomAC1EPsmkTHNN9aSwhZksi9jejVGBAVucoLLYxFLDJrAN2iaSXjGMdQjEjW1JUXIkgDDzOAEkBbsYqJ2ohiG8fVRaLMkEKTuSeTiyXTdfc\\/Hjb7xAFlYBS2IiMc3k2PPL6+GSoYRXCMYnfv9d9E05AqNmBqOtQdrhjZgaHrIkt0gRJxyiPepYibbcQbkSIwjQCGwBr+78j90\\/Yi0AMq0i2BJR\\/AepFYUJImCWYLLLGnP05rmvCOUemXhUEeRLnellXfan1rJo0AERGTTPoe\\/GrImNXd5+h9QiAwZYsfTcyLDpJnsw9qEQRkcJ9yuL0jD8Hu9OCYiKzSEtEEW11c6fXDVkAN8liDPW1uEKwXaJrcSwjkZfFCDqQ48sz4pu5CME26JvQpUUtrUNRt1nj3UQo9PjH6ptG21+7LHePoPozEkXXbkJfrbgEoURbIxJyl8\\/UaWAXWbTzJ3+4cpAAjfE9Tg77cS6CxzqD+shJBbOzbt6XjBh1TAUEX5YD3Gv6P81cdKTB0n1hRdLQNb6vL4opI5KUeTHZfm1BSFzx4o+FOQpVoObSImVzxYC2fhqjYM9jWpa5eK5zPw8NaXvHA3HCepq1iSYEj1rKILBAcihbyqQgxMLOlfxf5r+L\\/ADVxUQIAySekEjWwxCSY1vcyeo7cbsvc86VesD6j8H24dr+yAmp3ByeP4D1Ke8oJI0RycbkYXyyX4+Rxzb4WxY+Zex6kCQw7fwpagCWGCOe9J00MQDoafFLcQyQa0qst\\/QFc6hABrTSEYUvo93LsaUjKhpVNj5kX4ousIuqPyael4ThgAdTsAtEVLBoCA4SoLXdbH7dBp0SlTKuv1H0Nnj9\\/26wHjHS2d0n6J8CwAurpQ6C8jUv+nQOAyXXaAlaloFFOgOwBSZPtiSclGPHolQhgeM5uD\\/yjbEKsBUobrgpFyG0aVLqK4vYDXZt0paa88DraPeguwXSzFM17+9Cm4neZS6jkOHMYEnKKFvDgKMlQMBgX03o4SnVI89ucnNMBMAjsSbxh5ZOAKwXajhTJhJJI8uGdOU5o\\/NB2eN38rDkrHb5PQOkkCYlWChdxQAHqW+g+jm8\\/r+2RIASroUyFXBdDb2B6Lqdt0mGzp6YGSQ5LKx+XtxsQtg3M3lg7PpBUAldKGHCNZLHYW6zUj0LBSFJX6PWF+CEMlYlfEZcnRt35cRRkYSoQVySQQSvIqHQR5rHigpgx5xl6rL34ZPHHdod2DvS3mjwuUIkssHI3x6VVlu8XRCGjJlix339LSiyo8r9sby8xa\\/J2+lucmLmA7EHWeCiIAEq6UjQxLawebvf0wESm4dDyPemckTWD2DgjKspAVPjkySPlU\\/Hmx\\/Iontz8BpPuh+BScDqL88MwcroD80BO+N\\/wn5qOQEkEHtr24GJCPkIa8nLUMTxau5hdMou7KOKG83C6Y+Z8fTNDjVYJc5TPallmI4KiYP8AZs+2OYIfpHycCYRFmiRjyHr3NzlkG3cx2niVQjUIDlLi1u56jeL5ciX3HirGZiFAZ8taAatNG0C9HPR28tc8wleX1wxMWrTTCBlUI0LsSETXYdfka5ENCZQmjZd\\/N+KNTjZSwFRkNgat15ngLFoNAS1IzOHYdgg7fTaJUYxncWsY4GcwYGjddgaNUQDAFg+2WQtGdZ9YWZzUByqHEmhyq86yQuafi\\/FkHELZR9x9goBZiBLGFpaHDAsqKuJCSeIrS\\/lw+BXSJNXq8FhFvJboc+C5DgcC0vsUk4AosuZNqbrNJCeZy9Fm5kJCpDTbCK1EvRydKllczcy0fHvwATbLtJ7nvwKAvCPkfLwITnQu7CDNXVwuFl\\/gS+ONndbLcb8seGm4TiVMGo78alRgG53MObQAbeMpvGS+bR3fovEBxpgN+5Pbn9uzmh8Qfj6CKTcTS4+cd6BmBAGA4DCQ+CexL2pVZWV9DTjNZRgNC2ZOXBDFitVBdVOxNCI03F3eBGZEAlxYF1PzVoBAWBGy5UEUoUiIxjFvQ\\/aQoqwzj+d6kRlBLhnlDvtRBgFeSzHC7+2HgiBza4AKgErgooDXM1jsQduCJAEqtgogpsLpYPOerXu3H9z+D6IeWN6ee7gongTrAQH26WX+3iqEEkkk9Nh94kXG\\/LL2ON704g2X+BB59bTgAGZPlRIxIkPisowOqT8cLAESJPOOcUtqZDD0QQ65vTRQNRh6E9rkNKlKhEICdDHam7wj2zeOEAZumdUHy4Y7TOWUfeb9B43+SwtzX8WosG\\/MxFhYne1ude7cf3P4PQ0CMzkFjOfj0HyPmk1aOcniORg86\\/cM1r7gP5q0F65fwayY4KqBJEwGA5eibAQ7gXYFoWJItAQHBVSHMiseaQB9wSllc1\\/wj9046NRJY9nhkss0ksUgvCggAlc8BWsW5UUbM7VFBAOZC\\/s+ido4\\/wB58Uc5Ghl431CeAWF4d0Et7F+q8ZkxACAZy1Z7BX\\/MP3SMDkEMqPZ4xdPrQtMskeGoy0a0kk9k9KMItkinLKgEq7UBmbJXk06tXtvP3Cw8BHh9gBP5e\\/gM9B8cvaz2oSG1RiWZPpA1mvKXgqQmlAEkTBtQCkEhUnPadaWCllniqxdjmsvxSMyWR\\/gWDvTbHXaqyvD+rt+j7X04GAhAKBAQFA1BJsN3+R1+6Qoso85PsIT+Xvo0xGSxKsF2jHPmAE5lFK5JW+LsYehvQpT8lHnHelJhHCOR29DHqpKEBMd4ofbQGmEI9qtKNEWBs+se5UnFHIQcpoIQtlq5fx0KkPmUc6OwZeby4\\/1dv0fa+jRNjNHLQQuGx8NOuPup6RNOa75HtS4IyEs9PURlUAFxGzyfV5pppozFYgLMLHI4HUViSCFrU++kwJEh4ZzTF3oXCZXJrA9Suo5h\\/wC0n21O46l8nep0ScZjrWKQxaY0qRGxhJUwsulT5xMRNhb6ScSZiQWVajhhwBcDoc93+ZorBLx3mxpu9GiLidLdC5vdbdXiVuE1IAg9MGCCD\\/7AasNOS8UcAJSHWrPVkBgAscgq7TqIkea1OCHklShdzq3im4CwLl0cNQF0sT4D4O+33mQ3DtJE9qS4JW5jc88XLkQohPSG3Nj7Rahp9NpxoyQyx+E0f+UbwIsH2H5w0Yq+AXOZo8zxTrCGnPzkx3oFY9MUtxV4IzF70TIkCzBSEXO11JyFycI5ZP8AXq+QkX36jpVtUyFt8U5Zfek8HKfBsG3BHSYDQ5uxRZgi6VdiX4rb283BuOGn0e7cf3P4KHMgHtIyvJ7\\/ACIABA4DYOAU5WQSNQ35IoPKPvHiGMTEbHzDxJhaUSr1+i35kFJKdHnX\\/GqBBlMwSLTxSQIzCx3mI49NjgmyYTk0F6wjXra+46VgYmCdEtUl9ynT1g0svJyT3KvaX82pweREHsFMiJwfcN6FN2MnQZe1IGjYd\\/wdW\\/IodM0tlTqu9Ci7i5UVb9c47N6mBR32p2Pzw0+VOOY6PSpQLbo7XJzqfzale1QgruHhZqQWzfviasAtYBEjJEbV\\/wAyr\\/mVFuhngoLTUcYDyDj3hPCfltTejDWfb7tNMRl0D3D3D0IvBAIbLNxtMT+PplXREdRMfL5rLVYAtzc\\/\\/W1AFcsmkUCYQ4AdQdOlT2e4s9HDUQOC7UwmCxU7uzKHUYe9EQaSdu8D2oa57i+yKt2k51ASAm59j8qEWXSJ9xO0UuWmVKd2oAiZJDUao9XfxmiJEZaDkUDgXB1\\/qsWlE7urxEhAUCR1SbfugBnsp670pwoajFWNuokoWYXgI9RtUVhXW+KcvbpSSBgoR2aIFAQ7sPgaiRJLO3FB8qCZScHBuj3+7Ohy7LtCRHRArMTEsdqX7SS\\/NPIUmYl6D8+ae80NCvSKNHFe4IOd57PHlu5V7VDiOY+TToMZYR4mhmdWR45z487ViOGeAAbatneiYjmSCjQBST\\/DNeEsvhFAUCWCfuiLCAWMR0rn+f8AVJZMsdTramGhcxU0BCAQnrO1QTc3T2YpzOICAyeyeOAKgErgKKRImSw2Ofo5VIeuX58KgXtxnSW41c4uJNetQa5QMenU08bVYZABiCTBbUpmXe5hwRrtSnLHJA0UwjnanaggrX3OtTgxqUXI0RCZGPuo1Tr+lKrKy07HLhi5UAZFCcsXmfE7epVLQKVadD54vmdXt1pOYbCCehwlYTUUMAsC48rPXl6GBIBrt1KJjKUFnwVRlY6tvzRjYA8cJPh2Mt1ipCHWHLIQjXfnwDnBv2exoppxFy0aEIWMn\\/ulll9EDWZeyD2Crow+rRylsPxDMdChYyCiQZjn\\/ZokQh1\\/Wj0MDXUosTc8CurANnbg0BYx9y5lu5bcZ+MFuJJT0zSKvkwh2aPj0AoAlcBRQzOTo2\\/mpA2Cwa1K22gwcMlIBwCPRpl5MryMPuehAN8jU4nMNzpvU364IYmfxxycjSEmY2O2auUY2oWGeLJuadqWwFJVDhGJHYqQMdf2FKpXL6VI\\/u7hBlh78ByZg3egLtCSxYFQ96AAQkRs0VpebCz5ZnlNAQACAMHBkinndWDuK2aKuPM4GgHdCgRwH3AIsBNOuZZ4Rzn1eAGQeaKRbh6KpKomuYE42o1Zv9l4YriwRm89uBOEZDh0Pl7UdJgJWkTsLDY4uI7vCHo\\/ufk\\/PqKDVMJh3NqVVjYZPehvmA\\/dA5CDQDyHzJ8FHAeQH\\/PUIgGq75eCjrfVkcle6PseAwyVCR5UgpkNAMFSkmQKZdhq1B3mzJHTYocIBmNX7+aNEUiYmaUQY50kRQJy4f0pCQDvlp1KJZF\\/1TLbYOWdX\\/2rRAFNUz7r4owwgjYEt22CoZiL0kSgbtEaXJPIEe61FGrFRO4VGC8yudTJxmGzhI\\/WQMrkz6rwbTfd+UegoSMA6l6h70GoIWgVYzY5H+C1tfUpEYSGotIKVsbVGLJB3aNBNHQcHihqbR1J0Yw70anre8un7RRA05Pwg8zR4AafGlIkbZHWh4hwEt7lEkOL7+5zp6gAJLaw0BXBJKJlSUXLwuRvL\\/PN9ZBEcNM609LWYA7Q47Nx5NHEykfJZXMeMcKqSXJzRxzN39Kx\\/g5pKCXSSl6JYggo8MogVL6CJvNYM0YwndpXAO1YMNg4BUOoJEclLyAbhvL0GOtWhgIKfYDBxG9KdEvdnb68A3W9XPltIe013rBrcfDs8uEiMqBzoE3crd\\/ygmEazekRRITgAlYKgEx1qVFGQ3QmL0jKnjf+lRu0O7BV1YlN2+Rjt9eQ5X9dw8oJ6xo8ygKUrw9MyVcCkEDkBidP8wHuO9SzjbSErtwYZ0DiEta8WaSxG5l9gkib0kMesJoDmDaKNWgCAGA\\/zcqRgZKlCbB\\/O1OFDeYGnfFZRsgVZbadqPGoX\\/yvs1NBtMXfEUzAWDQGv8ddqAIGAfLz+xMFz9R0SkBQa45W7\\/noBAI5Go8U2sJgNF735XK037o\\/+nPggSSciyj3inQCQEA6FKj0+2AKAJXAUURavybf6UDm5PPC5Uto3lAHx2X5U3DFwkBRKJiMiCUYTuD9T2c0r3rP3VkP7udf8PQ\\/6lKlXT91PwjyPhxBQAq4CjAEvB\\/M\\/wCra60eGB8NqUOZrUGXxXwXpUD+RDy1NAjQPvLVPhHcgeSa1yNZU7SfFag2kg8\\/lW7zIU\\/NZTWsUfFfygOTWNfqv5oxu+Lw2t+CjijOQfmjJDXXke81Mlciyvz7f0HHr4o0i39Dp\\/sRRDnTbtyNysu03u4RceyZf8UBvc7cW\\/Ed6jJsxA+TegAgIPpOW50KUnAE1vICWOiOjUBAAlZXq6v+5h5d9aaJRGLuRrOlfHFrFjt9EFYCawSDeyhstdA81COk5f8A8FlV1K2R0UpXCe9OlR\\/xq3qAcr71oh6s0PAdB\\/8ABX\\/\\/2Q==\",\"size\":24175,\"type\":\"image\\/jpeg\",\"originalName\":\"not-found.jpg\",\"hash\":\"\"}],\"title\":\"ddadd\"}]', '[]', '', 'dd', '', '', '', 'SPECIAL PRODUCTSdsdsdsddd', '[{\"banner\":7},{\"banner\":2},{\"banner\":1}]', '', '', '', '', 'Meta Title Home', 'Meta Description Home', '', 'OG Title Home', 'OG Description Home', 'Twitter Title Home', 'Twitter Description Home', NULL, '2024-11-19 14:18:21', '2025-09-01 12:26:34');
INSERT INTO `page_translations` (`id`, `page_id`, `lang`, `title`, `content`, `sub_title`, `title1`, `title2`, `title3`, `heading1`, `content1`, `heading2`, `image1`, `image2`, `content2`, `heading3`, `content3`, `content4`, `content5`, `heading4`, `heading5`, `heading6`, `heading7`, `heading8`, `heading9`, `meta_title`, `meta_description`, `keywords`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `meta_image`, `created_at`, `updated_at`) VALUES
(2, 1, 'ae', NULL, NULL, NULL, NULL, NULL, NULL, 'DISCOVER ARABIC', NULL, 'NEW ARRIVAL OUR PICKS ARABIC', NULL, NULL, NULL, 'OCCASIONS ARABIC', NULL, NULL, NULL, 'SPECIAL PRODUCTS ARABIC', 'SHOP BY BRAND ARABIC', 'we are associated with Arabic', 'SHOP BY PARTNERS ARABIC', 'NEWSLETTER ARABIC', 'Sign up to be aware of our new products and all developments! Arabic', 'Meta Title Home Arabic', 'Meta Description  Home Arabic', 'Meta Keywords  Home Arabic', 'OG Title  Home Arabic', 'OG Description  Home Arabic', 'Twitter Title  Home Arabic', 'Twitter Description  Home Arabic', NULL, '2024-11-19 14:19:44', '2024-11-19 17:45:08'),
(3, 2, 'en', 'Privacy Policy', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fringilla nulla sed malesuada consectetur. Nulla congue elementum urna bibendum tincidunt. Donec lobortis mollis ipsum at egestas. Sed ultricies vulputate quam, ac pulvinar nisi mollis a. Donec convallis nisi non ultricies rhoncus. Ut ac sapien ac turpis condimentum consequat. In a nisl tempor, iaculis justo vitae, pellentesque tellus. Proin venenatis molestie leo id vehicula. Ut erat leo, molestie vel lorem nec, commodo iaculis ante. Aenean hendrerit lectus et odio placerat vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis pulvinar ipsum ut neque ultricies tempus. Suspendisse laoreet ac nisl eget vehicula. Curabitur aliquam nulla a justo auctor convallis. Morbi rhoncus facilisis nunc, ultrices iaculis orci fermentum ut. Integer lobortis, odio quis porttitor hendrerit, turpis lectus rutrum elit, non interdum lacus dolor in justo.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Aenean fermentum odio eget quam egestas, nec accumsan nibh euismod. Morbi quis auctor ante. Aliquam non justo a velit consequat iaculis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla sit amet augue eu elit sodales fringilla eu sit amet sem. Integer congue rutrum porta. Vestibulum maximus vulputate eros, eget maximus tortor facilisis at. Phasellus urna mi, commodo sed venenatis eu, blandit id ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed sagittis aliquam dui non varius. Quisque est libero, condimentum eget tortor et, fermentum egestas enim. Praesent luctus pharetra augue, vel rhoncus dolor tincidunt malesuada. Aliquam faucibus nunc purus, ac bibendum sem interdum id. Duis sapien lectus, euismod vitae risus tempus, porttitor pretium mauris. Duis luctus consequat vehicula. Etiam leo velit, sagittis sed augue congue, viverra dapibus eros. Nam rhoncus lorem vel nisl convallis consequat. Suspendisse tempor iaculis elementum. Nullam a lacus sit amet quam vestibulum tristique ac ac eros. Suspendisse cursus urna at eros fringilla ullamcorper quis in orci. Pellentesque a lorem dolor. Vivamus pharetra, sapien a porta cursus, est leo sollicitudin augue, ac hendrerit felis mi id metus.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title Privacy Policy', 'Meta Description Privacy Policy', 'Meta Keywords Privacy Policy', 'OG Title Privacy Policy', 'OG Description Privacy Policy', 'Twitter Title Privacy Policy', 'Twitter Description Privacy Policy', NULL, '2024-11-19 17:12:42', '2024-12-24 20:31:29'),
(4, 2, 'ae', 'Privacy policy Arabic', '<p>Privacy policy content Arabic</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title Privacy policy Arabic', 'Meta Description Privacy policy Arabic', 'Meta Keywords  Privacy policy Arabic', 'OG Title Privacy policy Arabic', 'OG Description  Privacy policy Arabic', 'Twitter Title Privacy policy Arabic', 'Twitter Description Privacy policy Arabic', NULL, '2024-11-19 17:16:08', '2024-11-19 17:16:08'),
(5, 3, 'en', 'Terms and Conditions', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fringilla nulla sed malesuada consectetur. Nulla congue elementum urna bibendum tincidunt. Donec lobortis mollis ipsum at egestas. Sed ultricies vulputate quam, ac pulvinar nisi mollis a. Donec convallis nisi non ultricies rhoncus. Ut ac sapien ac turpis condimentum consequat. In a nisl tempor, iaculis justo vitae, pellentesque tellus. Proin venenatis molestie leo id vehicula. Ut erat leo, molestie vel lorem nec, commodo iaculis ante. Aenean hendrerit lectus et odio placerat vehicula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis pulvinar ipsum ut neque ultricies tempus. Suspendisse laoreet ac nisl eget vehicula. Curabitur aliquam nulla a justo auctor convallis. Morbi rhoncus facilisis nunc, ultrices iaculis orci fermentum ut. Integer lobortis, odio quis porttitor hendrerit, turpis lectus rutrum elit, non interdum lacus dolor in justo.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Aenean fermentum odio eget quam egestas, nec accumsan nibh euismod. Morbi quis auctor ante. Aliquam non justo a velit consequat iaculis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla sit amet augue eu elit sodales fringilla eu sit amet sem. Integer congue rutrum porta. Vestibulum maximus vulputate eros, eget maximus tortor facilisis at. Phasellus urna mi, commodo sed venenatis eu, blandit id ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Sed sagittis aliquam dui non varius. Quisque est libero, condimentum eget tortor et, fermentum egestas enim. Praesent luctus pharetra augue, vel rhoncus dolor tincidunt malesuada. Aliquam faucibus nunc purus, ac bibendum sem interdum id. Duis sapien lectus, euismod vitae risus tempus, porttitor pretium mauris. Duis luctus consequat vehicula. Etiam leo velit, sagittis sed augue congue, viverra dapibus eros. Nam rhoncus lorem vel nisl convallis consequat. Suspendisse tempor iaculis elementum. Nullam a lacus sit amet quam vestibulum tristique ac ac eros. Suspendisse cursus urna at eros fringilla ullamcorper quis in orci. Pellentesque a lorem dolor. Vivamus pharetra, sapien a porta cursus, est leo sollicitudin augue, ac hendrerit felis mi id metus.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title terms en', NULL, NULL, 'OG Title terms en', NULL, 'Twitter Title terms en', NULL, NULL, '2024-11-19 17:16:51', '2024-12-24 20:31:19'),
(6, 3, 'ae', 'Terms and Conditions arabic', '<p>Terms and Conditions arabic content</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Meta Title terms ar', NULL, NULL, 'OG Title terms ar', NULL, 'Twitter Title terms ar', NULL, NULL, '2024-11-19 17:18:16', '2024-11-19 17:18:16'),
(7, 9, 'en', '', '', '', NULL, NULL, NULL, 'Test', '<p><strong>TestTestTestTestTestTestTestTestTestTestTest TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest</strong></p>', 'Test', '[{\"storage\":\"base64\",\"name\":\"not-found-036b97fe-9f1c-4e03-91d8-b1cbc842e154.jpg\",\"url\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQEBLAEsAAD\\/4QEQRXhpZgAASUkqAAgAAAADAA4BAgDGAAAAMgAAABoBBQABAAAA+AAAABsBBQABAAAAAAEAAAAAAABXZWJzaXRlIHBhZ2Ugbm90IGZvdW5kIGVycm9yIDQwNC4gT29wcyB3b3JyaWVkIHJvYm90IGNoYXJhY3RlciBwZWVraW5nIG91dCBvZiBvdXRlciBzcGFjZS4gU2l0ZSBjcmFzaCBvbiB0ZWNobmljYWwgd29yayB3ZWIgZGVzaWduIHRlbXBsYXRlIHdpdGggY2hhdGJvdCBtYXNjb3QuIENhcnRvb24gb25saW5lIGJvdCBhc3Npc3RhbmNlIGZhaWx1cmUsAQAAAQAAACwBAAABAAAA\\/+EGOGh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyI+Cgk8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgoJCTxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6SXB0YzR4bXBDb3JlPSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wQ29yZS8xLjAveG1sbnMvIiAgIHhtbG5zOkdldHR5SW1hZ2VzR0lGVD0iaHR0cDovL3htcC5nZXR0eWltYWdlcy5jb20vZ2lmdC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBsdXM9Imh0dHA6Ly9ucy51c2VwbHVzLm9yZy9sZGYveG1wLzEuMC8iICB4bWxuczppcHRjRXh0PSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wRXh0LzIwMDgtMDItMjkvIiB4bWxuczp4bXBSaWdodHM9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9yaWdodHMvIiBwaG90b3Nob3A6Q3JlZGl0PSJHZXR0eSBJbWFnZXMiIEdldHR5SW1hZ2VzR0lGVDpBc3NldElEPSIxNDA0MDU5NzA2IiB4bXBSaWdodHM6V2ViU3RhdGVtZW50PSJodHRwczovL3d3dy5pc3RvY2twaG90by5jb20vbGVnYWwvbGljZW5zZS1hZ3JlZW1lbnQ\\/dXRtX21lZGl1bT1vcmdhbmljJmFtcDt1dG1fc291cmNlPWdvb2dsZSZhbXA7dXRtX2NhbXBhaWduPWlwdGN1cmwiIHBsdXM6RGF0YU1pbmluZz0iaHR0cDovL25zLnVzZXBsdXMub3JnL2xkZi92b2NhYi9ETUktUFJPSElCSVRFRC1FWENFUFRTRUFSQ0hFTkdJTkVJTkRFWElORyIgPgo8ZGM6Y3JlYXRvcj48cmRmOlNlcT48cmRmOmxpPmF6YXR2YWxlZXY8L3JkZjpsaT48L3JkZjpTZXE+PC9kYzpjcmVhdG9yPjxkYzpkZXNjcmlwdGlvbj48cmRmOkFsdD48cmRmOmxpIHhtbDpsYW5nPSJ4LWRlZmF1bHQiPldlYnNpdGUgcGFnZSBub3QgZm91bmQgZXJyb3IgNDA0LiBPb3BzIHdvcnJpZWQgcm9ib3QgY2hhcmFjdGVyIHBlZWtpbmcgb3V0IG9mIG91dGVyIHNwYWNlLiBTaXRlIGNyYXNoIG9uIHRlY2huaWNhbCB3b3JrIHdlYiBkZXNpZ24gdGVtcGxhdGUgd2l0aCBjaGF0Ym90IG1hc2NvdC4gQ2FydG9vbiBvbmxpbmUgYm90IGFzc2lzdGFuY2UgZmFpbHVyZTwvcmRmOmxpPjwvcmRmOkFsdD48L2RjOmRlc2NyaXB0aW9uPgo8cGx1czpMaWNlbnNvcj48cmRmOlNlcT48cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz48cGx1czpMaWNlbnNvclVSTD5odHRwczovL3d3dy5pc3RvY2twaG90by5jb20vcGhvdG8vbGljZW5zZS1nbTE0MDQwNTk3MDYtP3V0bV9tZWRpdW09b3JnYW5pYyZhbXA7dXRtX3NvdXJjZT1nb29nbGUmYW1wO3V0bV9jYW1wYWlnbj1pcHRjdXJsPC9wbHVzOkxpY2Vuc29yVVJMPjwvcmRmOmxpPjwvcmRmOlNlcT48L3BsdXM6TGljZW5zb3I+CgkJPC9yZGY6RGVzY3JpcHRpb24+Cgk8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSJ3Ij8+Cv\\/tAQhQaG90b3Nob3AgMy4wADhCSU0EBAAAAAAA6xwCUAAKYXphdHZhbGVldhwCeADGV2Vic2l0ZSBwYWdlIG5vdCBmb3VuZCBlcnJvciA0MDQuIE9vcHMgd29ycmllZCByb2JvdCBjaGFyYWN0ZXIgcGVla2luZyBvdXQgb2Ygb3V0ZXIgc3BhY2UuIFNpdGUgY3Jhc2ggb24gdGVjaG5pY2FsIHdvcmsgd2ViIGRlc2lnbiB0ZW1wbGF0ZSB3aXRoIGNoYXRib3QgbWFzY290LiBDYXJ0b29uIG9ubGluZSBib3QgYXNzaXN0YW5jZSBmYWlsdXJlHAJuAAxHZXR0eSBJbWFnZXMA\\/9sAQwAKBwcIBwYKCAgICwoKCw4YEA4NDQ4dFRYRGCMfJSQiHyIhJis3LyYpNCkhIjBBMTQ5Oz4+PiUuRElDPEg3PT47\\/9sAQwEKCwsODQ4cEBAcOygiKDs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7\\/8IAEQgBmAJkAwERAAIRAQMRAf\\/EABsAAQABBQEAAAAAAAAAAAAAAAAFAQIDBAYH\\/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAAezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQ17NesCYaxpZVBFxeuWM5sy7UtwAAAAAAAAAAAAAAAAAAAAAAAAAAAKGnZGbzG6mhqaNmpqWQAAgVLQqAKm3myEsjmykstm51AAAAAAAAAAAAAAAAAAAAAAAGvZC7zC9Mw+869IFS0CAAECgCoAArFChWJWans3oMa21AAAAAAAAAAAAAAAAAAAAFhA9Mc71xD7zRRUoIzRgoBAAqUgUAVAzRhoIFBBRUnM3rMblpQAAAAAAAAAAAAAAAAABr2cx1xz\\/XGlqIBQAgUALotAAgUAVAACBQQUBAnM3tcb3lAAAAAAAAAAAAAAAAGNOV7Y5btjFYAgFACKloAgAXS3mJKAultAAEChdFqgIAvjts76bOgAAAAAAAAAAAAAABD7zw\\/o5aeoAAgFAnuerTSs2ZcaRm5Mc9a9m1LFak1jWlZq2b+br0I2wAVigKCCgIGaMFI6vOu0zuoAAAAAAAAAAAAAKHId+fKdudAAAIBRUkcWwkM3cl1657pic56wGUh9SXzaxaXmCtY0LKgoBAoIKAgCsWg7DOuwzsAAAAAAAAAAAACw4T08YLpkUAAAgFACBtS6lgQAAgUAVAACLisYwoCBUoUgVPRsdJmUAAAAAAAAAAAC04D08YXpkCgLi0ARcWqAM0YSgAgAVKQKFxaqAAEChWKKAgCggCSl9Nx0qAAAAAAAAAAADifRy5rripQFAAAIBQBWKAlcamcakM0YTQ1mD3nRsFAFQAAipaViigIAoIAR6VnpLSgAAAAAAAAAAQPTHBenkBmjDVAC+JnGrTERW8lACN\\/N7Pj0lMaGMw0BgI\\/WOQ6417AVAArEnm5lERZjAEXFpQQBWOwzvr5oAAAAAAAAAAY08y9nHVsAAqWg6Xlvt\\/P1HJ9ufH9uZQBM89dxw6XS2GOgBQ0jME4bvy0rCoAGxL6nw63mjZ5f15UUBAFBACOlmu7zsAAAAAAAAAAct258b6OaAAKAqem+TvvZth5f6+GCy1QJDN9B83XLLrEbZr0KlC8lZdcFLOA7crC0F5Ydjz31vPY4fpz5jWSipkjECggBHSzXd52AAAAAAAAABQ8x9nDT1ECpQFAT3PffebqOc644bvyBQPQvN1lMa1ilAAADAWlSI3jkOuEC8rHqfDrnXXTy7tywhQEAVi0AR2Gd9hNAAAAAAAAAARe8+ceviEAAUB6P5e0rjVDzT1cI\\/UBRLYvf+bthLKoaiatYLMNWFEqt0SObtLkTzzvywgHU89drz6DkN44\\/phBQEAUEZjCI9Hz0mZQAAAAAAAAAOS78+R786xQAAoS2NejeXsIbefPPVxQCjruHTp+W9Gua3iM1LaAAAoI6nnvfl5brzgtZFT1Hh13JbDyzty1rEFAQBQRcWm1L6pjpcAAAAAAAAAAcD6eMF1yEAAVO+83Wc57Hnfp4ymNSGbrWcZ3wO883WWxrjOuI3UysSevNFZ9VjQE3rxZLmJx6tSdd\\/N6nG4PeOW6YuJ\\/Gu95dBzO88\\/rPS40ON3jVq0QBQQB22N9VNAAAAAAAAAADzf18IzcCAAN7N9M8nepG6z5r6+Ponl7TGNaGp5p6uNp6D5uu7jXn3fmJ3Xhi56pO+WDz7gJ3XhtXQnfRz22peu57ht45PpgemcOslLQ8x7cpbN7nn0HmXXnG2BAFBAkJfTcdLwAAAAAAAAAAeZ+vhobgQAB2\\/n69Jy2OE9HLnuuPRPL2mMa0NTzL1cR3Xn6ynPXAdudtbl4yevNFZ9WrOoF7OW51c9BuZvWY3A9McxvEzm+i8eog9Z8+68+kxruefQeZdecbYEXFpQReel46SUoAAAAAAAAAAHmvr4amphqsUANiX1Dx97zDZ576eVh2\\/n6Smdadnn\\/p5R+p1PHfScenG9caOoAAAKFIEjnXUY1yPXlD6nonHpNZ0OJ6YidZnsa67GxwXTnBamIQAEd9jfQzQAAAAAAAAAAA8+9XGF6ZCABMY16H5ewAAA17PK\\/Xx383vfN257WYHpkAXJN68WnO0dPRbAEzjU9m+fd+Vh6t5+uwoAAA846c4fUQBmjs876bOgAAAAAAAAAAAOM9HLl+2AgATGNeh+XsAAANezy318bo7Lh02sa4ztgASevNgm5G+eAx7gEdfz3D9Mc30yj1bz9dhQAAB5x05w+ogDtsb6nOgAAAAAAAAAAABA9McH6uVBAAzxJ40AB2HDpI51qWcP6OcNvI2I73zdoOyC6ZqDbvHfvCqQWPcKS9JjWzZxPbnYImc26UATeb1GNjiN457Wbjdl0LOoxrsM7AAAAAAAAAAAAAw2eW+zhZSAAKGeXBYB6J5e0xjWhqeZeriAN3N7fz9Y4gN51rBlubZcUu7nXQ5ta4rtyxWZZZ3GoTWcFAI6XGu559B5l157svUY3QzGzGwXAAAAAAAAAAAAAHAenjB9coqUAKAAE3z1tZuGoDpkZow0jKdVw6zeNaKR5jrJG+Zzn+mOf3kuZOq5dJHOrE5TriKud6Wq3SSUog7O859QMpkLo3C4AAAAAAAAAAAAEPvPnnr4oFSgKAAAQLl6fjvpuPTku\\/OB6YtloZEl+e9qMuNYV0emIreUbRuY3JRM42BaUNsyQOZ3jld4lc77HG7QVM5UyxtgAAAAAAAAAAAAsOX64ul0N557tztBQFxaC+XbzbEnee+p49MVWJDbzEU1nBVgS3nvTzZXpncL5dgG7jWzKBhMxUFTYjnd5j7JPG5IoZSpmKkhAAAAAAAAAAAAGua9YjGCH68+V78xQAujqePXoeW9coWm2AYUhd5rWKMlVIWWOyndTerDGYkc6yygDXMhlAAOQ3z7LHTbjSNWtkobcbwAAAAAAAAAAAMBrUMBaCicH6+OKygKnaebtP89aVWFphNwyAFpH6zF2ZgRCxsSZKWZ5ZLNqtAAaxcZi4wmrUhGrZ0ObU1jRMdbkbpcAAAAAAAAAAAUNGqGMxFSwxnMejlFdMVLSV577\\/AM3XSqwFphM5sgAFhq2YE0jTWUJOMy2GEAA1S8GQ4zU2I66WWi8AAAAAAAAAAAAAAFCNq0sMZaZYhqhPTx19Zw1U6jh13+W8xlBjMZeboAAAAABYYQADVLwDmbOzl3IzgAAAAAAAAAAAAAAA1DRq0tJWNgjdTju\\/LoeW5XGr5dSuVsjq7jNGAoXG8AAAAAADXKAAwmMvBlN6NwqAAAAAAAAAAAAAAAChhNc2TMAWmAsLS2qHFanW5uItBcbwAAAAAAMRjAANFMq3GYloyAAAAAAAAAAAAAAAAAAAAGE1aAtMBhKAsNs2AAAAAAAWmAAAGimCpmJWUAAAAAAAAAAAAAAAAAAAADEadYChYYwVNayYlAAAAAAAGsAAAZSSi4AAAAAAAAAAAAAAAAAAAAAGMjzXs4708pblvbzqyJuXIAAAAAAADXKAAFSUjIAAAAAAAAAAAAAAAAAAAAAAChC7zwXp5Y7N\\/Gu\\/8vahSgAAAAAABgLQACRjYAAAAAAAAAAAAAAAAAAAAAAAANWzke\\/OC3n0vyd7THQAAAAFhjLSgMZcXgG\\/G0AAAAAAAAAAAAAAAAAAAAAAAAADSsyS0MNAC00016AAvMkXlShgMAqTzZAzgAAAAAAAAAAAAAAAAAAAAAAAAAAFpiMJZWqaVm9LsgAAAAwFDLEgXgAAAAAAAAAAAAAAAAAAAAAAAAAAAAFppl5YW0AAABfFxsF4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABaWlpQAqXF5UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\/\\/8QAMBAAAQQBAgQGAgEEAwEAAAAAAgABAwQFEBESExQgFSEwMTRAIlA1IyQyMyVBgGD\\/2gAIAQEAAQUC\\/wDUpWIRT5CoyfK02T5iovG6y8crrxyBeOQLxyuvGqqbL03TZKm6G3XJMTF+6kuV4keZrCjzhI8vbJFdtGnIi9Db8e1ndkNyyCDL3BQZ11Hl6hqOaOX9jJPFC0uagBS5myaksTS9jNxP9Hd9Wd2eLJ24VDnAdQ2YbDfqiMQGfMQRqbK2pU7u76O3C+kQiZd7+b97kDxegzuz18vYhVbJV7P6eWaOAbGaXFNck9Tby+vVys9dVrcNof0RmMY2sypJDlL0vLbv\\/wAnljeKTV339Hf8e4DKM6GWGb9DcyMVVWLUtovSq8TULUTEMtXhAsfwqOlxg7OLljtiiqccUNMNoBY57VdprnQvzhgcofDvOKrxQ5AWG92Ptv6MnK1xuU4fvezXstv6joLHLo1phG1NaF6+0TlHcB4CJyPqovEwOvLW6qKWeJ2GXqISsdVDDIZ1o6rWovEgkgkqXZRmt6P7+ps+2mJyH3CIQG\\/kSsv9A7M8gfSEuEzLjPufbtxtzq6\\/2XdhbIX3tH2vt2+W3ZFI8UnobeWrvv8AVoWeltfZyt7mEvLb1mbWHG2ZlHho2Q4uozdBSRYymSkwqnpz1\\/UZ9tN329PGzc+j9fKXOnh1lAQk7BFzNsTbZ\\/CbikxtmKPurU5LT1qMNdcK3Zk59hTuKsY2GwpoZID7383ixtqaPwi4vCLikB45Ox227nfdYE\\/L6xm0YWJysT9rPs+mGr8c2maseXbQoPZcIxYHcYhc9+132YW4nUscdqO1VOrL3V4XsTiLAKuT9NV939PBv\\/d\\/WzVjhD0Pd6cHTVkRMA2JnsTttvrSqvanABYXfZO+6JzrLrJjX\\/IGuRcddNbQ1ZSd\\/bSaELcMkZRSO22pCQEsJX2bTNWOObVm3eSMopO\\/Bt\\/d\\/WtTdRZ138uzE1+da0zNjl1+2lW6eu77M77+i\\/vpla\\/Mi1MykKMHlkhiaGJTytBCRcyTvbbtwIfWyMvJpejjq\\/T1NL1jqbXZjYedcFE+7p3ZkVqAU+RgZPlBT5Ql4nKvEpl4nKvEn3isRzaMzG0sbxS64SvxSaZux6cUnKk0xUXKofVzknkmd278bX6i3pk5+VW7cOG0BeQySDEE1+WR3dy9FncXqz8+NvfLhw3NGZyerA1aujJgCxM88\\/pPtpWhexYZmZvq5guK93u+74qvyaumUsc+3RxkFip4NVVnFV4q2mNHaiauz82ZRg8kjY8tyFxfWvE0IBPDMrMTQyqkfDZWYb8EzbrD1+bZ0zVjggxtWO3N4LVXgtVWohhtM+3o4Wrwx\\/WyL73++lX6m1pfsdNVWK\\/j1d+E22mP+HK+2tP\\/AENNLzMhxcGsfBNUhpEMtuQJZVW+Ssv8fShX6appdsdTawfytMh8\\/wBClVe3YEWEfrXvnd+Gr8uDTMWOZYWK\\/j1d+Fpiy3pH7u3CSgsnCuoqsc8zzHqJOBPPK+tT5SzBaYuvz7emWscmozbvg\\/laZD5+rNv2ABSHRqDTg+vkG2vi8fLTu79leF55xFgFSkQxFRuEXh9tY6M4qSti51HoWhZYeT8Xfd7gcFv06Lb2llJOO6sXX5FTTJQW7Nrw+2sRVngsaXKNiS3JGcR9vusZj+mH7GWHhv8Adiv5D0J\\/jqlNyLSyYefYIuT9FCKsVXjfsxo\\/kRtDGRORKD4\\/oZX+R7JJZJzxmN5P2s4H9XuxX8h6E\\/x2ZyKQCikx1nnwWoudX7KDvz7W\\/UDuWO183etDyYsrY1g+P6GV\\/kezGY3l\\/bzEfHS7oZjgk8Xtrxe2vF7a8Xtrxe2qExz1FZN4qxZW0Q6QTFXlhmCeO9Tdn1rEITzVuaR8Favp7vUqcpW7TVIv8y0HLWxHxe4vF7i8YuLxi4sXentT6W8naitTTHPLFXmmT46ypIJYlisd9yWNpYiZxfT27Xk3i1xX8ervwuyraOrJDPHYCxjwleSCaFcTac02AjIlxMoqk0ygqxwKzaCqMkhSmo4ylN8S\\/DLDJCXZg\\/laZD59Ck0jf9JvMRPZM+\\/3MtByrejvu\\/oV8pLWh8cnUuXmli05MnBpHKcJwZMCZnYmmqwyJ8bC68MBNjYGUdeKNGQRtYyi4n4iZRQHKqdcYWRgMg3KJQIRI3GhZJPj7LKvPNj5fHJ145OjMrVnhYB0HRn2TPu32snX59TVtvT3fajjN0TCzXMfsZAQJm3d33eOWSJxys4pssC8TjRZVSZKySIiItndwqSknq8AQvzW22bR0EYRiMmzcwXRRxyNbxKdnF8cG8z+erPtqD7P9pyZk+Mg5nQVVNi\\/J2cX7GbfUQI01Ow6KrOKxlLdOW2hCxiYcLtEEsr0RT0iZdJIS6OVSRlE277hWiNDViFMzBLpDA0PY\\/8Ak3tq0qyFTmhjj3LnlHJ\\/UXMXumfZbpvf7JHoWuSrscXaIuRVcUy5IRgn8kJbFrLG0oNA8DKXyjbyZTxuCcvOtFwMpfb3QR8HayHun\\/s71WISY4k47rzAvdlCPn9gy1f30cWKOQHik7MfS5Qu7CxE5aF7IH3DV2YmOu7KVbrdWOLid2VUSZ90MByKKEYQ7R\\/xTPpJKETDerk6Ok1qfQ491JG+0bEhhd0zbN9j30d9eIUcrLIN\\/WXlssfDzLDfiJFxPoXsovftIBNFVB09R1LSnNeESKHH8tDEAaF7do6sSsSvNNVpyWVDXGMRbhb73\\/Tvs7loR7Jgd0VZ5I4YjGS5JzJ4ojmNbOsWO0B3oRQSBK2haR\\/7fVL27X\\/GbXpCe4IsAxj+hlDQ32aMd0Ee2lyEpYYcZPKosVACGvGCIG2KMSG5QeFQSvDL2R\\/7\\/pyhxgBcY6Rt+QNxP+iKJnT1t3GMQ7NlxrjdOTvo7bsdV+t9md99YPOT1i7pBeMhJjFR+4Dwj+pMN+ziZH5FqZcAQA4Q+sXt3HA7E9rgVL+rH+rIN0X4p330P31D+4m+uAcbszM36whYmONwRE0YBcmCQMjG66uu6ZztuADGH0H9+1m3cB4R\\/X36ZzwHGcRKiwvbAG2fyf6Be\\/bHHwt+xnrxWBtYeSNRu8U8aP8Ay9NyFlzomXUwLqoF1MCeeHdjEuyOPh\\/az1IbLBHy2k7XdhYrtcF1\\/EubcNcu8S6SV14fG6bH110VZdJXXSwLpK6KpX3ejC6A5ITZnJwjYf3G26eNOLtpYm5IDSeRDXhD03909VpQEWBv3bszoqolNy3Wz+kwO6aBMLD\\/APBbMuAVy2XLZcpctly2XAP\\/AIL\\/AP\\/EACkRAAEDAwQCAgICAwAAAAAAAAEAAhEQEjEgMEBQAyEEURNgFIAiMpD\\/2gAIAQMBAT8B\\/tLKkK4K4K5XK5XK5XBXBSFPdyFcFeripPAlXFXK4dncrip5Uq7rS5XHoZU9QXrPSz0pd9dUD0JdCJnbGEVChRSFCihyopChHPCB55d9bs+kFNJpPuk0lTSfdDwweaXTwZ6ActxnshynHiWlWq0K0K0K1RyhyHGNq0q0q06wJQEbBbtQrSrTut5BM7LRV51ATtkSiI1ip3Rx3naAip0gTukTrbV26OOfey0VcdQEbzhxm8Z2NpogVJk6W51SpUqVKlTsNq7eHGfstHurtTKzuuzoHTuzstHqrj7Qb6VoRaKtxQ0e60Sv5Q+kCDjR5X3mxqd43s\\/zleJ97ZoKOq2rkArVbtjjuzsATUmBRuKHFW40fI\\/3HtfjbEQvixJ0PuZ5L49LyfIBbAXhY5rYNBR1RUptTsjkHOw0VcaNxQ4q3GjyeIPX4vMRlePxhg0EAiCvxs+qijqCpo2p2RyHZ1jRBUFNxQ4UGjKHcFHZoKmVBTRUjYA5Ls6252TQZodJIGV\\/IeZgLxeYO9HOkbpzqA5T9bc7Jq06vkxYvDFghH158anHcOdIHLdjYuKuKuKuKuKGKFXGoQMojR5gSyAvH5rBa5Nu8r7hpJjRcVcVcVcVcUDUmsUA6luKHGkGEDKhRWxsyg0DFIoTot1NqUB0Lh73A6Fertc\\/dYUKKlylGgFSKQVBWFcrujcPXADaFtAjS5XKaEmsbZbRvR2BWhFm1aVBTRqhQiFFYUbxCb0zhrDfvoMHpz60tEbccYjp350NHvehQo7lx96GY\\/SCg0q0f05uKvUj9KcJq3P6XEot\\/TiJ\\/wCAX\\/\\/EACcRAAEDAgYCAwEBAQAAAAAAAAEAAhEQEgMgITAxQBNQMkFRYIBw\\/9oACAECAQE\\/Af8AUsFWlWFWFWFWFWFWFWFWFWFWlQfd2leMrxqwK0dCArQrFafZAEoYZQwwoA7UBWqPWDDKDAM57Vqj04BKGF+rRvpSPStw\\/wBUR6kj0LWEoNA23coFSrldS5EoniEUDAVylXKU3jpEd9uH+7saojTRAarXQK2kG2FrKjhFQYChayo0WsocdMjusZHRgegPbYyOgdfRHtYbI16heAvIryriryvIgQe0exhtk5Bm8jV5Gq8HOXQi4nYD1M7NwVwVw3T2AIEbOIdIrhj7zOdG2DCBnOajdPXwh97TjJqBAyudAywtFpmBjO81aN09dogbOIYFcMazmcZO8w\\/XWPWYJdtPMmrRAyvMDLCtKtVqtVqtVqjO81aN49bCGy8wKsEnNiVDdsijOMhM1HpML47OIZNWCAnPIK8hQeSav5o0VtyhSjR1GVeatCcYVxVxQ2j12fHYcYFWiTTE+VG81fzkFHZPpQjQ8UZUmTUCE+o49Cz47GIdYrhjSaYnyo3mr+aCgKkI5Zq6jKOOlWjWj6jjZPYZ8VrmJgTUK5qvanmTRvKuFMQUbuOo3ijjrVsBSE41B2Cezh\\/HPifHZHNHCRRuaERlchU7LeMxPaws+J8dkc1eIOYIr6zMH3U7LeMpPbwjrnIleNq8bV42rxtXjanCDQcqwVIlEQgcgRC4rKJTROS0K0K0K0K0JwioArNCe4DB3cT5UbzlLZREKVcpySrqATkvU5X1HCJ9DhmRuFgJXiCGGBWRUiUW\\/lZU5Az9RCClONQ6aXBSEdVarVx6LDMHoOf+Ua\\/9oTCAhRKsC8ahQg0UClTtB1Hej8hXkchifu1cFcE931llXK5ByuCNAVOQnaBTvTYbvrO7E\\/FPTJ3OQj6YGRle6dudid6Y9Ph8ZHmBvSpU0n27BARMVxOf4hsTqjiAI4hU1n\\/m8I\\/3g1RaCjhlWkLj+JYQDqpmj+P4sEhDEH2jqP40OI2IULRaKVKlSpUqVKn+An\\/V3\\/\\/EADwQAAECAwMHCwQCAQQDAAAAAAEAAgMRIRASMSAiMDJBUXEEEyMzQEJhcoGRoVBSkrFigqIUY4DBJDRg\\/9oACAEBAAY\\/Av8AlLnRmD+y69q62f8AUrF59FqxPZdXE+F1URdVEXVxPhYRPZa5H9V149lSPD\\/JUIP1rPjNHqs0Pf6LMggcSqOa3gFWO\\/3Wc4njoJz9MqhWbHf7rWD+LV0kH8SquLPMF0cRruB+oziRGt4ldG10T4WZdhrpIrneuRIdixxtmDJdZeG51VKNDLfFq6KIHfS7znBo3lShgxD8KjubH8VMmZtkdlsnxLgljLQYS0DWiHJwxdPHQzBkpP6VvjipB1132u+j3ojw0KXJ2f2cs+LMynnHSz7Rdf0jNxU4buI2j6Hee4NA2lXeTD+5V57i4+Ojx0AkAEWEgy3HIHhoZZYexxaRtCEOPJr9h2H6Dd14n2qcR3AbBo3vhwREfzkqsvUkuTl7WwIj53qSTYkOIIrS67Teog59hdDbNzUy9GYx0TUadqIOITmCOwxAJ3EIkSM2EHGTZ7VylsYgOhj2TGuMgSnta6GxkMVIbK6oTGxGubF1XhRYk+rIVzn2c5dvBm9c6+K2GCZNntUUNAA3DJphom81ewre32iDyg5vddu7dMow+THi\\/SCs06G15a8xJ03IRI5J8TWSa3nueeIodqSXK4zXOm6GZtLZXVCH+oMEwxIjm700XEzJKMe9mXZTl4KFDjRDDMInuzmuVF5LGxhIGU0xxwBXKQ5xEONg6WC5M2GS9kEmbpSnNR4cOMXmIQRmyUONezA2WHgmw4sQwzDcTqzmokRhm04W79LOVLRyaKfIf+u2FzjIDaubh5sL99huPiuc3cT2MOkDI4FF0g2ZwGWJeuTndYyju1EkyAVxlIQ+cqmSN+SHgAy+4aGfaWv7po7h2rmIZzBrHfZ46c1lbO5cbvdRdJGLvKF1TncSuo\\/yK1Xt4FdDH9HBdJDMt+zSYTslOmkYTi3NPaObYekf8DILWvDx9wyQ1omTQKsMH+y1B+SMR7QGj+WXm0YMXnAKbG33fe5VrZTIuipdsV6F0T\\/gq5EbI6ERGMzThVag\\/Jag\\/JFjsW0OjwkosPgezl7sBVOiu25U7THODMONreTjbV2VffSEPlBobdYMGqZo0fCpkzK5097DwFnNxRwO5XH+h35bIQ7xQa3AUFj4m3ZxU9I8fw7O3k471XaGQTYe3bxsLnYBPinvFVwyLuDRVxQDRJrcBZVZrC+HuGLV0XJneq7jFXlK\\/wDZX\\/kRrw+0ZBhPx7p3Iw3iTm5F1zS07jY7lB20baIAwZU8ciQ2ow36wx0Dz\\/Ds74m80yCMm+dWHX1tEEYxMeGUGd51X6Ycpbi2jsi89xcd5TYbcXGSbDbg0WOiuwaE57zV1dBUyyYsTgOzPO05o0TQdZ1XWufswbwyWz1WZxU99tVWK30qqXj6KkI+pVIQ91qMWqxajFnQ\\/YrNNdxsMN2DhJOhnFplkO5QcG0HG1vJx5naMPuNfLY7C1m9+d2aFD9bDLbltnqtqbbjdeJmjKiRPudKy+8yCzMxvys4k8dDMGRVdYY2XvvbO0AYlMhDYK2F7sAJlPinvHRiVjIQ2mqkMB2aX2tA0E5SV460StplqszQmxX35ncVjE91EiNL5tbPG2F4zPzYR3WUsDBtRm8eCkRLI5+JIiSMEMu3ldBnYB91LIDuIsxkudOrD\\/dogjF+PBOZEnINnRYxPdYxPdRIbcGlGmhPKHCrqN4dni8dA2HsxPC1z+8aNsh+v7sjeQqosgcP+0TutfJkyNqvXzNMJAyBCD8\\/dNXnyk35U2CyHxsg8Ta1neNXWvibMBwT\\/JbG82hDO7i4oNaJAdnjebQGMcX4cLeaGEP92Q\\/X92RvIbYf8SQii3cZWSGrOqBDdmMkam7sGReaZFHPNcbYdkFngTYCdVlTbdGtEpY\\/yWxvNoAxomTgrveOse0RfMn3gb\\/dsqchkId4oNbgKWOc1t5wFAi4wXTK6hyYx7brhOlkVrRMltFMwXSFkSF\\/YWP8a6QeAsI+wXbATrPzjaS2C4sbRq6hye6LDLRd22xnthOMzTxRY9t1w2ZfOxB0p\\/x7S7xAOXD9f1oYnlNjXnVwNjIn9cmTRMpl6Jj8ouYJw9+S9\\/onRXYNCLjibIflGhien6ybzzedghGjDpNg+3tUOJvEsuH6\\/rQxPKUAMSix2IV068OnonNGOzJpuqnTRz8iQqTggzbtQ5O3ZV3G2H5RoYnp+skR4wz+63d2u99hnliJD1gtYfitcfitcfitcfitcfimRImsbIj24tbMItLhI\\/xtERuz5QiMwPwjGhCneGQC8yC52G4SK5t2detkBMnYr76v\\/S\\/3HaoVXeptDQ4SH8Vrt\\/Fa7fxWu38Vrt\\/FObFIIDZ4WxIbHC600ojEiaxXRwyVSF\\/kukhlqHKIw8jf++2OhnvCSuu7ugay40S7205EP1\\/dkbyHJm2oOLd6vwzxG5X4ZuO+CukhmW8W3Lxks5xNmFxu8rNE3byvuibGoveZk2BjBMlUjC9ukrsRssl\\/ktjeZc9FGZsG9SFBZVV7bfGEStszoRCaxhA3rq4adDMNknCVt\\/m3Xd8rb8N0igI2Y7fsU2kEbws6GFQuHquseqlzvVZkMBTiODR4q7ycS\\/kVMmc1NUw3ouHvZce28FfZnQ\\/0pNaSfBdX7ldX8ou5upEs4Lqoa6qGr0pOiOQYMGiX0Ey1mVGRXRy3oRI44NUgr0KgOxZzZWzhvLeCk4Nes6AfRy6l6zYHu5UIZ5QrziSd5VAqi7xUwbxCF1XRstlvUmNAClJVClIEK\\/A9lIiRRf8AYpj6E5xLpE0aur\\/yU4Dv6uUiJEZJrbmtJ4LqiqwnIRog8oUhZIq65OkJNG5UeVrhXhKq2KslgusLpblqz4qQEg4Wl3ed8aHOXOsGePlRJ4mSuSPhKyoUx22QyefGs3HKutEyVejV8FQSt8DkFuHirp97HKVhecJ2Xr07wsDvtVFM62T65c26pqmxyMRmqbbZiyfaZZT2nAhFh2ZN5wzjj4aKRU2V8EGnfacbtl\\/YRZWgVK+Oim90lK9LjZDc7VZreNswsFKRVe3VWKuDagfCw79ll44MrluHrlZwBVJhUcFdBZdVXtQvRSQNio3QOG51tUXH0U9Vm9Bgm7ipfQ5N91MqTc0704xMRRGWDaK4wTNmCc7eVdMVTY4HJ\\/r2TzjIELYTj4INaJAKf0GYslvU1M2O5rrNizujHjiqi8fFZrQOAsLSKHcr7M5n6QcPXJ\\/r2SmsKhTFs\\/osy5UycMiRRgtwn8ZMR39ey86wTB1mq80zFklL6VMZM5VyC47EAccT2a\\/BN120bCulhvafBc9dIB1Z\\/VP9uGfc9okcNqkMB9NqvBF7sG1RcDrGZBWe0t+V1vwrsObYe129BrRIDs8gpfULsEy3jerr2lp8bGB4mCpCgHaJnH6ldismr0DpG7tqaSJFrtNVwXWM911rPdda33XWs911rPdZrgeByJnH6r0jK79qAnOQypkyXWA8F0UGI\\/0WbAa3zFVjMbwCzuVP9FnRIjvVapPqur+V1QXVNXVNXVhZoLT4FCHGN4HVeqLx+s0toJuNGhX+UuLnbtgWbDb7aW7EwUh9cwQizM2igsw0WCqVQf8AweFmKxWNmH\\/Av\\/\\/EACwQAQABAwEFCAMBAQEAAAAAAAERACExQRAgUWFxMECBkaGx0fBQwfHhgGD\\/2gAIAQEAAT8h\\/wCpFAlYr1MwVmfDZ9q1Z0fBQsdBVHD+D5p0PJ+VfQPmvsHzRqj4fKhsh4fmsp1SrGh1RWT3goqTOT+ayTcCT5FZ+OUD1pfn09fXX617R4+1OT1BPYcAzHFvIyg8msSeU0rMiPtatNvP9LVtb+mKCkHrfkoJJoQ44VIADkS+teTk2eW49gnmx3IAQQZHHbIgjUqIB\\/ZcajFnWPKpZyab+X4tkI5SCpbknbzVMg8G31zSpSZV2usUqGGdq0ExlK\\/DfLOJpSIJODTsJziX9L2IJCMJUEnI\\/dUTM+Q+HH8P16hrT3ifTFSdgUoy3DtcsyzETfvEQnPLnRq68mW34MS5hJFZfCvsUpedV2YSrBMEZ7BgWBM+tI99cxuLcCyLEdjPRiZxfz38eIkrgDf1YfwIqOgcdav3mj7HZmIf5AoireNgJsppWXOwJHBDVoNxhk5U6Lhyp+FGVCQlLEl4mUiaNstds6Jb\\/llyzahnCitYPd4CcPFqeRncRbNqhLgicZYqdpXkpETRlHvFv\\/VF1SQEGDcIm+KuLrrT2TTACOLqjltVyuC+h5d+URADK0liGPh+aVVVlezAELhflRCVMxhxogDCRXos86z1k2YCm4XY7kWWnhCtFnCOlTKCVjNN8J5jNvvT9ciLFZ8GjTBSiIi3hWEgr50T9LDLKS1CU6dYIKkhdjhDigzUNMs2+9FtqxYv7qbkSURpsM3YoAgYTZ49razSYGLTtWeRr3wbc0q0p0iHn19xNlncxiqzBZ61neTDAdN+zcxlx3BRkYSsw9Q4PejLAlXSp4KbHvd6ZtQgyzuuJPFuun9Eh2LAyL6TfcsLBBFjsoYns2Ufenepe+bGvh02NmB4me3BuECSddp4JFbLdwiqBdY9OL7PGsN9LrQNwei9au4ODfzdoEpMiL6bIEFLJx7Sc0l5H+R3jAAf9NwkbwEDuz7HBzoijcI1\\/LUemZWG+0YVaFn1JbhV13R5Gl0Uss7SwSwFjxo5h4J9ilbj9d8YRiY40pGAnQonDlJK\\/nq\\/nqh2msM33XcMYGzO9YWQItrV3aI+z+u7tbBya1kNjgaG9FwGGYSTbG3T6n+bY3fqjeuPbd1fAoEwICrbDUhcPHdBkgLq06HGj9OtCmK8Gpy+VJrg3PA38lMC8DVo\\/oODlsPQRHWxSqJlcvaRcY\\/c7vKm\\/ktPvLsQQCVwUOjiefVsYqBleVcokOBpURiuoGNwN6UyiWmgqM01X2th5VMhnOvM+\\/jWmDoVDjzlF5TvoPWhMNtgvLiqm8CEpYylybM7XQjkIdkL\\/wBLV2zl91f577jHmUFFpCwJnsJuEfud2UCXBT6P5DTcIQC+sY3bZ\\/UNsof1G9NZrXPhQVIpexMPYMM0Qj1k0dxKw5SWjpkgrQ+GzVsHWpc5FITfsAp0HDds9J++Xdo2YHzP8nsoZR507MEtQO2vgN00GfQMetGys06YbAJQHFr3cP0r2x\\/KtRPArQnrOnQ9Sv5b80anqVNYxQT47NsvWuXjWQULchD\\/AF3p77bb\\/pY7MlLhblbb8IuPHHpHdrFcq\\/Y\\/ewQKIQ89+ECf5+1FW7ljrvcUAPQ\\/tL2qfQD1pQLpftT8q8VPYNCXBhK8MfypQGrJwXjx+tplykBxrIRecXXYukOTlWTGSOBodnoiWvLrs57E4GtAygIDu059hP77CbgkzBgqPOLnpp957Yep\\/wBxpNLucGelfyPxUuBBI+NvWNPrpTuFMa3IHPV2OqDxVCBQXBmpcuo3L7BaRMURCGxYjr1q2uiemxtOCtk\\/01tlxZAm+tTg6p7Nst9foU5pgJxqV\\/M\\/FfzPxUydqTmoFhki+nY\\/a5E93n\\/R6dgkFn4KgAgIDZAzHmTs9d7mz7jhSEyNrQxfZ657q6CVM3cuxkyqw1qEkpJvnlQQgTeHXcPWIYPxR5GmKWbiIWIl3N+y4G2WiPMnYoEtgpJzPwVfb5naYcZB0BQYBwBod39Z2xGd2EP6zbDrxvds9d7mz7jhth39Sf3QkmnYy3k2XGukIqPPkY0tZF7TcOQDDSzevbRPWfZ2WuF7D42R5n\\/ONss8WvTX7zq1SFtWvt8zfxZxoTncQW+Aa0IMN7jveID1UEnqJjY4zsgJGCCdzgMi8DWiug4HLYiKwOrS46SvHZqMrgursXMuA1pqUErsmnXE9h\\/VXBqI6OPj\\/s9i7ZhxX9fuglCoKbB8vVdkfPuG0GM9bns9AOiPFJtIDSsLURFkLdRMkUCgCVwFaanHB895mf8AIj9b\\/pvc7H7bhsnpC8lps1bfNe5+92THgBNZANQsUSIHFuyaYA\\/fKtW5dXQpGZWV2fRcOx+9ybsx6BKKESyz\\/V+9Q8d+V\\/3f9N7nY\\/bcKzhEFCPDwkzUC9iXPQ02js9ZRuBQCHNRNvMzariJA\\/yl2gA5UDjUP3yXFoVXZ\\/C2\\/RcOx+9ybsW7rp63n3uyS5+DFQgMWcbyNBgUmv46v4qv4qv4qv4qkaGSUI12PfDKIONhs25bcjg4UhM6Gq4NTFFc\\/coRJNrzA1qeU4rmrASlgy7bi7CFafWsgIS6HOrolLK6m2BDYLK\\/kK\\/kK\\/gK\\/gKgGhRC8m02ODI0ywwyhFYU+OnnWeBYtFrzEktXm+nu75icWjWaUkcNqKhITTdKVDWBk47nrvc2fccN3mCVil4k1M9VOJXmj3sIqTWpohBcNIywcWkNfKo59c+VE5jOZpDiLoc2n75zt+iy940DzqRl++79vmbmX0g\\/fwrAADAYNkIgJzpbLigEj3yZC159fvPaiIq5XsZzI3lOa+k\\/NG+KST87RYOq42lEHqUeM2jL4o6xYSSlpu9Qh9K9Oun3ivXKpl64xLXUfTNPC7jzeBV4xZLrUFmGlbI42KKi+JauxOJdGpWfia9dckJCaCkZ0Ci9XQVwt0avsPzX2H5pihgDF6ArBBtdk2O5KCY73PTP+8bl61SHDr2ZNLZXONeMBdOvxQqib1jPFPw3VtiJcLmzUCOi8kPpTMD6cK\\/qFaJ9f8qtp\\/0u1zUWS03uZ0CsCCmXQlEs0cTdtHCgHg2naUOCPCuUog2EGkKXpDSiBsPlfinLgsjQukwt1roTtkTQyW2W3R73mfKppEgLBViJnOVBJq\\/S9O3WCOm7AsEE312pQzyTQ0ni2oOYnImpXVL3oB6uxxrU6BP7rQL2iWmYnUmjlFDjUISIkvX2tFGebWaXodY1iEV+yk1EhYA4m18uabhSuVvvpTnaFGRirUCaBLBuGioNCBWIodaS9SrOdGjy6sJJKRUBpTAb96+d2Zm2BOjzm8GRgBUQuPIfNEKRMRbYoTV2wkJ+9xSMksNKB3vdsXgooQcBsWITso9FcCAxGywuqfDWi4LlxFHrfZuqZeb3pQxvBctAcnJU3ByDA18BRZ5qfuvUgYnZLL3mK3x2udrMiRrOIvPczR4df4V7bKQl8trmzhpyXOHruRgkrSBSYARSQ1DjUONSzzPlR21TuaS9To2BPq0GLgRLLWd33n32T212R\\/HTnV9vQihEkbNa71D0FBBBjZP1eFJyyUJVE8qYmwoIDvCwTSyl2aZsSMg619JQ4yeugOK2TMnkbCiJ9ZpQOUU0umm6Pyn6freAiExJWSU6ldSjmXcVn2oZt+ktdGcEFYqnj2FbzD1v+9wLNabOBSkbGX+qdjqaGF39JRxq3pUmKCXYhfWliuhOhQTWUEpIUBykWJjZzHlQ6p7dK30aBNR3PLarxscQ4+x\\/3uj4Wx1P89tywKSiiOooCoCeX8DPsrPzlUqyeFDqXhseogPFTEnoPZUavxn+qIjo4UCZXG6GFBrupxou+tnEoZJKWCabuz0ve\\/526QxupoVl50J2uJweG0GYuFq6CZ\\/B3MtQuu\\/AoizHHcdQU8NOlQELsBgkbJQwnIPCluUVI28oCDwv++3N53m6MC15nOjgE12SYspahLzfiuYNqxQjUYwkXaVc7RxIedZlfmt3txO\\/fHTLTgmuCRpgeKinH8YV5ZpShL0mWxT0m4Y0vMn747xPFLIoDIAgDT8bHh40lx4qxyEqkWiXIo+98rKCSDzVDvV+eQrTTLuOTeQsjQxPH8fnNNAqZX9qYmOQbA+uSHpVgDAChY7jl3c1xoen5KHg6Op0ak09D+aVcEonOlntTCDq05heGkPi7XVdb5GvemNua+7R+Vjhug2HjTgQQS5oYd2OIcViswjx1CiNNtGhnrfqtf8AyV7wKhz1joLT5qip\\/nV\\/CqU95rpQmjE1f6mowJq+t\\/zBAhJodUVo3lsusn5lpmWtLFGJXPLs8lArATSoYehmjp2PzmUotrQTBzpHENJZXZfJKLM3Ioqwf+CUyFKU69c5UOKucrr0BQAwR\\/wV\\/9oADAMBAAIAAwAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUMOluakAAAAAAAAAAAAAAAAAAAAAAAAAAAARGDHbEt2zIBBXgAAAAAAAAAAAAAAAAAAAAAAAVmhKSbYlu2ZAAm8HgAAAAAAAAAAAAAAAAAAAAJ2pQJyTbUt2zLgE36CoAAAAAAAAAAAAAAAAAACqltIBKSPYlu2ZAAm\\/QJPgAAAAAAAAAAAAAAAAfKktpALSTbHR27IAE16BIegAAAAAAAAAAAAAAAL20ltICZM7nLfqZCMm\\/QJePwAAAAAAAAAAAAAATe2ktpTZmE6o9mLIAE36BINggAAAAAAAAAAAABNL20ltIBISbYlu2ZAA1\\/QJUMGAAAAAAAAAAAABdJe2kspAFSTbGt2zIAE16BIRgmAAAAAAAAAAAAFZL20ltIDIJC5tu2ZAA2\\/QJCMFwAAAAAAAAAAAdJNe3m5pAJERQANWzIR+TaBARg\\/AAAAAAAAAAANJJJ20AtIBFaAAIK2ZAQAPQJCMFkAAAAAAAAAABhJJe2DApAGbmm0STbYAAH6RIRgsgAAAAAAAAACAJZL0ABtIGIAAACQKbT8d\\/QJDsFoAAAAAAAAAAABJJe0RtpFYD5weLwvIMDX6BIR2sAAAAAAAAAACDJJLwDFtJAPySSQWwZSgK\\/QJCMmQAAAAAAAAAAcBJJMgfNpZGduSaZ+bDATJMBIRgoAAAAAAAAAAAgJJJgeoQIoRDyRIMz7IA8AQJCMaAAAAAAAAAAAMDJJYCFCJDOUmSONuDUB3gCBIR0AAAAAAAAAAADkJJZCrcKK4SSSSRsR7gIoCgJAPgAAAAAAAAAAAEBJIAAAAFCeSTJDtnrcAAADBIMAAAAAAAAAAAACgJJAAAAAhPiSQ7tsubgAAAYJAAAAAAAAAAAAAAMBJJ\\/+ljBAwySst6GTXbQgbe3gAAAAAAAAAAAAAsLJLq0oRIACB+J67XlgA8AAQKAAAAAAAAAAAAADhJJe2m+JEKyVDF9hqcez28SQaAAAAAAAAAAAAAIJZL20lsfACfP0r3MSTHLvSSQIAAAAAAAAAAAAALJJe2mBvStPB9k2QySG2okAAAAAAAAAAAAAAABQSFL28S0AB2MTMx8SSS221gLCIAAAAAAAAAAABASTpenC20ACXtwp7iSQU3AiCYKAAAAAAAAAAAAASCCK3S2mgAAAPw8SSSK2hCAAAAAAAAAAAAAAACAAYZs3a02AAAAAACSSRW1TAAAAAAAAAAAAAAAAKAAT8qKEm4AAAAAAASSAWzQAAAAAAAAAAAAAAACJQABbAC23AAAAAAASSSc0gAAAAAAAAAAAAAAAAAAAAKAAG2AAAAAAAASSSMkAAAAAAAAAAAAAAAAAAAAAQSW0kAAAAAAACSSSSAAAAAAAAAAAAAAAAAAAAAATdaeAAAAAAAASSSSAAAAAAAAAAAAAAAAAAAAAAASQzYAAAAAAACSSSAAAAAAAAAAAAAAAAAAAAAAAADHJAAAAACRJASTAAAAAAAAAAAAAAAAAAAAAAAAAALYACMm23t984AAAAAAAAAAAAAAAAAAAAAAAAAAACLBHAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALIAAACZQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQbJIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf\\/xAAmEQEAAgEDBAICAwEAAAAAAAABABEQICExMEBBUFFhYHGAofDB\\/9oACAEDAQE\\/EP5S0n3ZCsrKysrkPulPn3aHmMn4Eun2dgL5hA+UICPsVDmJ8RbiKedB2wyHygjx6tagnEU1gPPYeOkMgH06hzPgm639KMgj6Na5wlXntEprtLqW8+hKE5dP4CDi9o7LJ+8L4+NwsWsBvcOYLjmStln7w2X2E1nwvf8Aj6opSLe2OzmbbsBRvGU3QRKZRWHMpb9yglRQEJTdBEpitvs\\/E94tTiHHY2ee0eorO74Rx2A036JU91fsdoJD5uD6MT8Yo57pWdxWo0JTtpC80gW61gegB4iJz0Ru+QqvRlouWL6NzefBrwV0gG8RaxbWVRfV59vsV0qlY4itvTcgVoubzeUytFColNah5yt60pXQ59urX0bm81FaqnW82i7gW1AorC0XOfRlXVBvGkXpWSkrnvnEcJcSmtA85XjpjWRR2y4OjZkqK1Da8LUX4lvSG8DQFFZW2+qFvbvoqsrIJs4hF6RW4F34jSJBtrQvHNyrVqr\\/AH6j3SscseORbeVtUJd5SUiU10j57fk6FytMcGObPBoDQ7GPDKiBDoSV\\/j\\/s3c2\\/1Lk45Y8cmjKtucs8uiLe45uhUXm5rHBjmy8HnG7vMuR\\/tCJW\\/nRWiyBAA2zyx44NuXRjlnl0RR3HJCq1C2obYdifVPqgSjgWp9WFyYO\\/U54V4GjJTPqiDvlFiVro7k63F0eDh1bB0i2qn0B\\/UANnUrReTjrS3KN3uhuOvi6PBwlNSwqJZpKs\\/MakqNf586AuBU8GTjrXme7N6wo2aqqa2cKhdAkbIAsnk0LhtmwW5PAgVkLgVKnRABl3yoxb3gLxLyk5nme8Syo\\/HQvatHBjm0ooA2jaKJWFLzeE0KlQgKlBFvdwF7YonOnlnlLt30NVuogqWi0rNPORTchtIu5UpKSkqKE+CFGCtyAsqwg8ymBcMUKpaWnLDb0NnYPM43rIiQWxWwU4lifrC3iXAS4m8FAoqVDbQAcaPgwN\\/R7mL4Jx0AXifREvE8rlLiSgMbxFl4LhtzKaA6V288vTXF6guCQbca0uJpvC6ArqMBv0qWVBatNK\\/PTfhoMOAgVqNN4sT040LuspkqVKOgaa9TdAK0ZHKWd9XqbVtFcwKAHGa\\/Dq\\/KbqDZftOfwhaLgDcB5g3Eu\\/wlBRETn8NEcopxDZ7C5cv3Ycoa7lzebypUqVKlSpUr8AqV\\/K3\\/\\/EACQRAQACAQMFAQADAQAAAAAAAAEAETEQICEwQEFQUWFgcYCB\\/9oACAECAQE\\/EP8AUonifnPx179p+0\\/bZD+Mo8e7FwQXMD5YHAfEoOup4jJ+GIREz7HAEVniDzzDEO5YtH5ijPqwXgjs8T9aY1OdUhwdhTfSQxZ6dCgnmig4PSixE9GCtE8sgFHaDZfaZlOPQ874hNHTpUWipVdckLtJUL1xmNFoxMz7riUtBcXl5RUKSovzMFTEeQfZ9VxGrQRWOvz518h3\\/m6tvdxUZpC8qrieR9ireLuBRWkIEhmXCniciUUZJdG\\/MBBSXuRBYIUA9n5O8BWiDzc9iE2HZsx1BT3QXwQDbncdIUr0Qs7qhbPakrwR+s\\/eET6JhHuhT3HLODYlLStqgWx+k\\/SCqN5ZzOa1sqMZ5gBZ0UGnWLvn0cFaIZDc8mtf6dHY5mKrbMytz80RWQxZvVFxb0FtdXHt7W3StnQLaJUEdgXRVbdeGU8ui\\/iWfJZ42IrIIlmy7xp4Nai9o30Me3pzo8L91v8Aw3c91qHYoMRaLi23oFtSqx6PUdV686QidC8\\/vP7yv2f3i4ozoNcwbL2cFa+bpuq57bM6J0v5hwbnyGgXA8wA6DEuUOivUyxegXBRXVWjtxXQeJwvzX\\/ux2GmcHV84SgvQLa0VsFFsA8Q06DjTz1oK1ubiDjWlZfSfjtzQ6F+615pk0x65YQxpjLb2imkOfMYvGyydeY1qVMNcXRWjuMHQvo8a1\\/ppk0x6nnorNEJyRW7BqW1w0OXSrVdow1xdBit7jBHkVjddQttugFplRQz9ICpogKy\\/wA6YnRcdF1w0NaLtSDM\\/aAnGoAQbxvs7l2N+To4tLg0fNbqyjG1cwW1KrTJ6wFSzg7p8JvydHFFogiWTnDDBpuDZszmW2tEW55WuT1jxHd0V+7wFO6oCUNCIGBt6kKYiplcG9UDzLOSNCtUEslr8mOhVQjjVRcCiiKGZWWM8R3lAwp5OgHN3syaY9pGmO6YIgPMpLluIv2II\\/EW5egAUaKBbKfIBxtw1xSrg2V3vG\\/Opeln6RC715KvUBTFthEzLlpaWy4C4nmiwqK+GIJZoKckxGLUfppAMrKw4R59D\\/19j1PHo4KgRxKkqRGUu5j+o186Gyiqi4iY2bixb1Iq5lSpaT6aLivR8dT9J44ESzoKGY\\/eC+Z42o1Bvklrg5WAFaFPEtlGIvZZ0alXDBLlkr0dTbcoFsTEKXneNQb2sWGyza7yGVaXM6vfjTZCsNt6jG52XUPuXqxSEuNIq7nZUp0KNh6N8tHTjPvVuW00imhV6DtWot+luXDSQFulx4SpW3x2njZfF6PoTQi6oDwmK5iccRTlly2Ft3jtCJXp7l7qlbB4va47U54iV7YLjnth+zliCmvaYO4uvYBVEEpgsMc4lEPP8ItUAFmg5x\\/hStkdxwgsIw6tMplMplPusSxbhutP1Ki4p80WlpaWlpaWjTj3d6hc4YlvVuvfXxUvqX\\/Bbly5cv8AwZ\\/\\/xAAsEAEAAQMCBQMFAQEBAQEAAAABEQAhMUFREGFxgZEgobEwQMHR8FDx4YBg\\/9oACAEBAAE\\/EP8A6khSG6xUvYP7lrJ3+uqsT1kp\\/OD1SvagrgyuocERq+CpHyFX3tfwU\\/oOchr+cr3Khhl0jfE1zIESe3+yoErAVJgTJC8jU0aAT8yH2qcNsV7QPmpCAdB\\/apW0cjHxCp8Pdfl9CGr7jRnER6WoQlrA1Ex5heIWKGnOEVurBosG7MPYfmodF0WPMiuh5mHWMf6MWBEgAvQy9qgmOIT92\\/tUodw+\\/wBntTLAurfwHoC3AWwLE5bfXeIvCAmCDJO\\/ERdEJCd6iDujF7v5VuJhfeXPLU0nEpgequeP8vBCgw7tRrK05XUS9ipFRpS\\/jZKbpEpK93jcsSAEnMs9uI5sVxQSQN6fUgFAGYcNGOCJNHITePoHTn7qHBoI+i4YpRCPJp0cbSwDln5muhXpHmx2X5f467T6d+QMr0ptmYjl6n7+KhRGULBKaDofSeI2JgSXJG4bW9z6j9R1gLYX\\/NmTpUBYp8sH5Lf4YqikAFEM1o\\/wOr4rJyxi9ORy+moaoJWUyzpFvNPrUgAsqFgFK2nLpShqhndps659AIDYQyJW8Zb5b8X1XEZr8bojmjlj1rgKYBKXUiMFOf8AweWP8FoSG1l19OmakuJ0HQ\\/LP0z5SACEm0SExVwPRjQGipvpegunz2GRANzDRCxXeoWKQ5zpQrGRUMwKhEktOaQsw7RGEqKQmBfl4gY0qMjFUCy2LAsS0C9oQlC3UJbvQcR0UhcWvfHelJuXDmABrlzPamxxqSaCribc6CYu8ZnCOkU2\\/HAGJTEDE25UvhKojE4GF4louxwAbQcWrCaSvGYqI2pJmFNJN\\/pRE45kutDojim9IbvsX5adMCJIyOv3p4GlEAbtOLXQZeW3+G9O2RKrKv01w1IASctmc6Nt6MrUmiGNnOLVn0PIiFHQwxVoMgKaEYJv80\\/U\\/PqaRZVwHOgAHQ0jJl0b0y5BQKWVgsUk0gFxycTRkZoxOQRqEXtVxsc1NcG5RUYXomAC1EPsmkTHNN9aSwhZksi9jejVGBAVucoLLYxFLDJrAN2iaSXjGMdQjEjW1JUXIkgDDzOAEkBbsYqJ2ohiG8fVRaLMkEKTuSeTiyXTdfc\\/Hjb7xAFlYBS2IiMc3k2PPL6+GSoYRXCMYnfv9d9E05AqNmBqOtQdrhjZgaHrIkt0gRJxyiPepYibbcQbkSIwjQCGwBr+78j90\\/Yi0AMq0i2BJR\\/AepFYUJImCWYLLLGnP05rmvCOUemXhUEeRLnellXfan1rJo0AERGTTPoe\\/GrImNXd5+h9QiAwZYsfTcyLDpJnsw9qEQRkcJ9yuL0jD8Hu9OCYiKzSEtEEW11c6fXDVkAN8liDPW1uEKwXaJrcSwjkZfFCDqQ48sz4pu5CME26JvQpUUtrUNRt1nj3UQo9PjH6ptG21+7LHePoPozEkXXbkJfrbgEoURbIxJyl8\\/UaWAXWbTzJ3+4cpAAjfE9Tg77cS6CxzqD+shJBbOzbt6XjBh1TAUEX5YD3Gv6P81cdKTB0n1hRdLQNb6vL4opI5KUeTHZfm1BSFzx4o+FOQpVoObSImVzxYC2fhqjYM9jWpa5eK5zPw8NaXvHA3HCepq1iSYEj1rKILBAcihbyqQgxMLOlfxf5r+L\\/ADVxUQIAySekEjWwxCSY1vcyeo7cbsvc86VesD6j8H24dr+yAmp3ByeP4D1Ke8oJI0RycbkYXyyX4+Rxzb4WxY+Zex6kCQw7fwpagCWGCOe9J00MQDoafFLcQyQa0qst\\/QFc6hABrTSEYUvo93LsaUjKhpVNj5kX4ousIuqPyael4ThgAdTsAtEVLBoCA4SoLXdbH7dBp0SlTKuv1H0Nnj9\\/26wHjHS2d0n6J8CwAurpQ6C8jUv+nQOAyXXaAlaloFFOgOwBSZPtiSclGPHolQhgeM5uD\\/yjbEKsBUobrgpFyG0aVLqK4vYDXZt0paa88DraPeguwXSzFM17+9Cm4neZS6jkOHMYEnKKFvDgKMlQMBgX03o4SnVI89ucnNMBMAjsSbxh5ZOAKwXajhTJhJJI8uGdOU5o\\/NB2eN38rDkrHb5PQOkkCYlWChdxQAHqW+g+jm8\\/r+2RIASroUyFXBdDb2B6Lqdt0mGzp6YGSQ5LKx+XtxsQtg3M3lg7PpBUAldKGHCNZLHYW6zUj0LBSFJX6PWF+CEMlYlfEZcnRt35cRRkYSoQVySQQSvIqHQR5rHigpgx5xl6rL34ZPHHdod2DvS3mjwuUIkssHI3x6VVlu8XRCGjJlix339LSiyo8r9sby8xa\\/J2+lucmLmA7EHWeCiIAEq6UjQxLawebvf0wESm4dDyPemckTWD2DgjKspAVPjkySPlU\\/Hmx\\/Iontz8BpPuh+BScDqL88MwcroD80BO+N\\/wn5qOQEkEHtr24GJCPkIa8nLUMTxau5hdMou7KOKG83C6Y+Z8fTNDjVYJc5TPallmI4KiYP8AZs+2OYIfpHycCYRFmiRjyHr3NzlkG3cx2niVQjUIDlLi1u56jeL5ciX3HirGZiFAZ8taAatNG0C9HPR28tc8wleX1wxMWrTTCBlUI0LsSETXYdfka5ENCZQmjZd\\/N+KNTjZSwFRkNgat15ngLFoNAS1IzOHYdgg7fTaJUYxncWsY4GcwYGjddgaNUQDAFg+2WQtGdZ9YWZzUByqHEmhyq86yQuafi\\/FkHELZR9x9goBZiBLGFpaHDAsqKuJCSeIrS\\/lw+BXSJNXq8FhFvJboc+C5DgcC0vsUk4AosuZNqbrNJCeZy9Fm5kJCpDTbCK1EvRydKllczcy0fHvwATbLtJ7nvwKAvCPkfLwITnQu7CDNXVwuFl\\/gS+ONndbLcb8seGm4TiVMGo78alRgG53MObQAbeMpvGS+bR3fovEBxpgN+5Pbn9uzmh8Qfj6CKTcTS4+cd6BmBAGA4DCQ+CexL2pVZWV9DTjNZRgNC2ZOXBDFitVBdVOxNCI03F3eBGZEAlxYF1PzVoBAWBGy5UEUoUiIxjFvQ\\/aQoqwzj+d6kRlBLhnlDvtRBgFeSzHC7+2HgiBza4AKgErgooDXM1jsQduCJAEqtgogpsLpYPOerXu3H9z+D6IeWN6ee7gongTrAQH26WX+3iqEEkkk9Nh94kXG\\/LL2ON704g2X+BB59bTgAGZPlRIxIkPisowOqT8cLAESJPOOcUtqZDD0QQ65vTRQNRh6E9rkNKlKhEICdDHam7wj2zeOEAZumdUHy4Y7TOWUfeb9B43+SwtzX8WosG\\/MxFhYne1ude7cf3P4PQ0CMzkFjOfj0HyPmk1aOcniORg86\\/cM1r7gP5q0F65fwayY4KqBJEwGA5eibAQ7gXYFoWJItAQHBVSHMiseaQB9wSllc1\\/wj9046NRJY9nhkss0ksUgvCggAlc8BWsW5UUbM7VFBAOZC\\/s+ido4\\/wB58Uc5Ghl431CeAWF4d0Et7F+q8ZkxACAZy1Z7BX\\/MP3SMDkEMqPZ4xdPrQtMskeGoy0a0kk9k9KMItkinLKgEq7UBmbJXk06tXtvP3Cw8BHh9gBP5e\\/gM9B8cvaz2oSG1RiWZPpA1mvKXgqQmlAEkTBtQCkEhUnPadaWCllniqxdjmsvxSMyWR\\/gWDvTbHXaqyvD+rt+j7X04GAhAKBAQFA1BJsN3+R1+6Qoso85PsIT+Xvo0xGSxKsF2jHPmAE5lFK5JW+LsYehvQpT8lHnHelJhHCOR29DHqpKEBMd4ofbQGmEI9qtKNEWBs+se5UnFHIQcpoIQtlq5fx0KkPmUc6OwZeby4\\/1dv0fa+jRNjNHLQQuGx8NOuPup6RNOa75HtS4IyEs9PURlUAFxGzyfV5pppozFYgLMLHI4HUViSCFrU++kwJEh4ZzTF3oXCZXJrA9Suo5h\\/wC0n21O46l8nep0ScZjrWKQxaY0qRGxhJUwsulT5xMRNhb6ScSZiQWVajhhwBcDoc93+ZorBLx3mxpu9GiLidLdC5vdbdXiVuE1IAg9MGCCD\\/7AasNOS8UcAJSHWrPVkBgAscgq7TqIkea1OCHklShdzq3im4CwLl0cNQF0sT4D4O+33mQ3DtJE9qS4JW5jc88XLkQohPSG3Nj7Rahp9NpxoyQyx+E0f+UbwIsH2H5w0Yq+AXOZo8zxTrCGnPzkx3oFY9MUtxV4IzF70TIkCzBSEXO11JyFycI5ZP8AXq+QkX36jpVtUyFt8U5Zfek8HKfBsG3BHSYDQ5uxRZgi6VdiX4rb283BuOGn0e7cf3P4KHMgHtIyvJ7\\/ACIABA4DYOAU5WQSNQ35IoPKPvHiGMTEbHzDxJhaUSr1+i35kFJKdHnX\\/GqBBlMwSLTxSQIzCx3mI49NjgmyYTk0F6wjXra+46VgYmCdEtUl9ynT1g0svJyT3KvaX82pweREHsFMiJwfcN6FN2MnQZe1IGjYd\\/wdW\\/IodM0tlTqu9Ci7i5UVb9c47N6mBR32p2Pzw0+VOOY6PSpQLbo7XJzqfzale1QgruHhZqQWzfviasAtYBEjJEbV\\/wAyr\\/mVFuhngoLTUcYDyDj3hPCfltTejDWfb7tNMRl0D3D3D0IvBAIbLNxtMT+PplXREdRMfL5rLVYAtzc\\/\\/W1AFcsmkUCYQ4AdQdOlT2e4s9HDUQOC7UwmCxU7uzKHUYe9EQaSdu8D2oa57i+yKt2k51ASAm59j8qEWXSJ9xO0UuWmVKd2oAiZJDUao9XfxmiJEZaDkUDgXB1\\/qsWlE7urxEhAUCR1SbfugBnsp670pwoajFWNuokoWYXgI9RtUVhXW+KcvbpSSBgoR2aIFAQ7sPgaiRJLO3FB8qCZScHBuj3+7Ohy7LtCRHRArMTEsdqX7SS\\/NPIUmYl6D8+ae80NCvSKNHFe4IOd57PHlu5V7VDiOY+TToMZYR4mhmdWR45z487ViOGeAAbatneiYjmSCjQBST\\/DNeEsvhFAUCWCfuiLCAWMR0rn+f8AVJZMsdTramGhcxU0BCAQnrO1QTc3T2YpzOICAyeyeOAKgErgKKRImSw2Ofo5VIeuX58KgXtxnSW41c4uJNetQa5QMenU08bVYZABiCTBbUpmXe5hwRrtSnLHJA0UwjnanaggrX3OtTgxqUXI0RCZGPuo1Tr+lKrKy07HLhi5UAZFCcsXmfE7epVLQKVadD54vmdXt1pOYbCCehwlYTUUMAsC48rPXl6GBIBrt1KJjKUFnwVRlY6tvzRjYA8cJPh2Mt1ipCHWHLIQjXfnwDnBv2exoppxFy0aEIWMn\\/ulll9EDWZeyD2Crow+rRylsPxDMdChYyCiQZjn\\/ZokQh1\\/Wj0MDXUosTc8CurANnbg0BYx9y5lu5bcZ+MFuJJT0zSKvkwh2aPj0AoAlcBRQzOTo2\\/mpA2Cwa1K22gwcMlIBwCPRpl5MryMPuehAN8jU4nMNzpvU364IYmfxxycjSEmY2O2auUY2oWGeLJuadqWwFJVDhGJHYqQMdf2FKpXL6VI\\/u7hBlh78ByZg3egLtCSxYFQ96AAQkRs0VpebCz5ZnlNAQACAMHBkinndWDuK2aKuPM4GgHdCgRwH3AIsBNOuZZ4Rzn1eAGQeaKRbh6KpKomuYE42o1Zv9l4YriwRm89uBOEZDh0Pl7UdJgJWkTsLDY4uI7vCHo\\/ufk\\/PqKDVMJh3NqVVjYZPehvmA\\/dA5CDQDyHzJ8FHAeQH\\/PUIgGq75eCjrfVkcle6PseAwyVCR5UgpkNAMFSkmQKZdhq1B3mzJHTYocIBmNX7+aNEUiYmaUQY50kRQJy4f0pCQDvlp1KJZF\\/1TLbYOWdX\\/2rRAFNUz7r4owwgjYEt22CoZiL0kSgbtEaXJPIEe61FGrFRO4VGC8yudTJxmGzhI\\/WQMrkz6rwbTfd+UegoSMA6l6h70GoIWgVYzY5H+C1tfUpEYSGotIKVsbVGLJB3aNBNHQcHihqbR1J0Yw70anre8un7RRA05Pwg8zR4AafGlIkbZHWh4hwEt7lEkOL7+5zp6gAJLaw0BXBJKJlSUXLwuRvL\\/PN9ZBEcNM609LWYA7Q47Nx5NHEykfJZXMeMcKqSXJzRxzN39Kx\\/g5pKCXSSl6JYggo8MogVL6CJvNYM0YwndpXAO1YMNg4BUOoJEclLyAbhvL0GOtWhgIKfYDBxG9KdEvdnb68A3W9XPltIe013rBrcfDs8uEiMqBzoE3crd\\/ygmEazekRRITgAlYKgEx1qVFGQ3QmL0jKnjf+lRu0O7BV1YlN2+Rjt9eQ5X9dw8oJ6xo8ygKUrw9MyVcCkEDkBidP8wHuO9SzjbSErtwYZ0DiEta8WaSxG5l9gkib0kMesJoDmDaKNWgCAGA\\/zcqRgZKlCbB\\/O1OFDeYGnfFZRsgVZbadqPGoX\\/yvs1NBtMXfEUzAWDQGv8ddqAIGAfLz+xMFz9R0SkBQa45W7\\/noBAI5Go8U2sJgNF735XK037o\\/+nPggSSciyj3inQCQEA6FKj0+2AKAJXAUURavybf6UDm5PPC5Uto3lAHx2X5U3DFwkBRKJiMiCUYTuD9T2c0r3rP3VkP7udf8PQ\\/6lKlXT91PwjyPhxBQAq4CjAEvB\\/M\\/wCra60eGB8NqUOZrUGXxXwXpUD+RDy1NAjQPvLVPhHcgeSa1yNZU7SfFag2kg8\\/lW7zIU\\/NZTWsUfFfygOTWNfqv5oxu+Lw2t+CjijOQfmjJDXXke81Mlciyvz7f0HHr4o0i39Dp\\/sRRDnTbtyNysu03u4RceyZf8UBvc7cW\\/Ed6jJsxA+TegAgIPpOW50KUnAE1vICWOiOjUBAAlZXq6v+5h5d9aaJRGLuRrOlfHFrFjt9EFYCawSDeyhstdA81COk5f8A8FlV1K2R0UpXCe9OlR\\/xq3qAcr71oh6s0PAdB\\/8ABX\\/\\/2Q==\",\"size\":24175,\"type\":\"image\\/jpeg\",\"originalName\":\"not-found.jpg\",\"hash\":\"\"}]', '[]', '', '[{\"title_1\":\"Helo\",\"content_1\":\"HeloHelo\"},{\"title_1\":\"Helo\",\"content_1\":\"HeloHeloHeloHelo\"}]', '', '', '', 'Our Commitment to You', '\"\"', '', '', '', '', 'Meta Title about', 'Meta Description about', '', 'OG Title about', 'OG Description about', 'Twitter Title about', 'Twitter Description  about', NULL, '2024-11-19 18:10:03', '2025-09-01 19:13:40'),
(8, 9, 'ae', 'Our Story', '<span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">At Zena &amp; Kazena, we believe that every piece of jewelry tells a story, a narrative of elegance, luxury, and individuality. Founded with a passion for exceptional artistry, our brand has grown into a symbol of sophistication and quality. Each collection is crafted by award-winning designers and jewelers, blending timeless designs with modern aesthetics to create unique and cherished pieces.</span>', NULL, NULL, NULL, NULL, 'Our Mission', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">Our mission is to redefine luxury jewelry by providing customers with exclusive, high-quality designs that celebrate life\'s special moments. From custom engagement rings to everyday elegance, Zena &amp; Kazena is committed to excellence, using only the finest materials and paying meticulous attention to detail in every piece.</span></p>', 'Why Choose Us?', NULL, NULL, '<ul style=\"padding-left: 1.5rem; color: rgb(85, 85, 85); font-size: 1rem; line-height: 1.6; font-family: NeueMontreal-Regular;\"><li><span style=\"font-weight: bolder;\">Exquisite Craftsmanship:</span>&nbsp;Our team of skilled artisans and gemologists ensures every piece is crafted to perfection.</li><li><span style=\"font-weight: bolder;\">Premium Quality:</span>&nbsp;We source the finest materials to create jewelry that stands the test of time.</li><li><span style=\"font-weight: bolder;\">Personalized Experience:</span>&nbsp;From custom designs to exclusive collections, our jewelry is made just for you.</li><li><span style=\"font-weight: bolder;\">Customer Satisfaction:</span>&nbsp;We are dedicated to providing a seamless, luxurious shopping experience with every purchase.</li></ul>', 'Our Collections', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">Discover a world of elegance with our exclusive collections. Each piece, from rings and earrings to necklaces and bracelets, is designed to complement the modern aesthetic while preserving the essence of timeless beauty. Our collections feature a blend of classic and contemporary designs, perfect for every occasion and personal style.</span></p>', '<p><span style=\"color: rgb(85, 85, 85); font-family: NeueMontreal-Regular; font-size: 16px;\">At Zena &amp; Kazena, we are not just selling jewelry; we are building relationships. We are committed to delivering exceptional value and quality, backed by a team dedicated to providing unmatched customer support. We invite you to experience the luxury, artistry, and personal touch that make Zena &amp; Kazena a brand cherished by customers worldwide.</span></p>', NULL, 'Our Commitment to You', NULL, NULL, NULL, NULL, NULL, 'Meta Title ar about', NULL, NULL, 'OG Title ar about', NULL, 'Twitter Title ar about', NULL, NULL, '2024-11-19 18:15:11', '2024-11-19 18:15:11'),
(9, 7, 'en', '', '', '', NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', 'zenakazena@yopmail.com', '', '', '', '', '', '', '', '', '', '<p>sddsd</p>', '', '', NULL, '2024-11-29 22:28:55', '2025-08-31 11:27:32'),
(10, 10, 'en', 'Mortgage', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 18px; text-align: center;\">A mortgage is a loan used to purchase real estate, where the property itself serves as collateral. It allows buyers to finance the majority of the purchase price while making an initial down payment. Borrowers agree to repay the loan in regular installments over a set term, typically 15 to 30 years, with each payment including both principal and interest. Mortgages can have fixed or adjustable interest rates, influencing the total cost of the loan. If the borrower fails to meet the repayment obligations, the lender has the right to foreclose on the property. Mortgages are essential for most homebuyers, providing a practical way to own property without needing the full purchase price upfront.</span></p>', NULL, NULL, NULL, NULL, 'How Mortgages Work', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 18px; background-color: rgb(236, 236, 236);\">Individuals and businesses use mortgages to buy real estate without paying the entire purchase price upfront. The borrower repays the loan plus interest over a specified number of years until they own the property free and clear. Most traditional mortgages are fully amortized. This means that the regular payment amount will stay the same, but different proportions of principal vs. interest will be paid over the life of the loan with each payment. Typical mortgage terms are for 15 or 30 years, but some mortages can run for longer terms. Mortgages are also known as liens against property or claims on property. If the borrower stops paying the mortgage, the lender can foreclose on the property. For example, a residential homebuyer pledges their house to their lender, which then has a claim on the property. This ensures the lender’s interest in the property should the buyer default on their financial obligation. In the case of foreclosure, the lender may evict the residents, sell the property, and use the money from the sale to pay off the mortgage debt.</span></p>', 'The Mortgage Process', '/storage/pages/1733577801_67544c49c3074.jpg', '/storage/pages/1733577801_67544c49c6090.jpg', '<p><span style=\"color: rgb(102, 102, 102); font-family: NeueMontreal-Regular; font-size: 18px; background-color: rgb(236, 236, 236);\">Would-be borrowers begin the process by applying to one or more mortgage lenders. The lender will ask for evidence that the borrower is capable of repaying the loan. This may include bank and investment statements, recent tax returns, and proof of current employment. The lender will generally run a credit check as well. If the application is approved, the lender will offer the borrower a loan of up to a certain amount and at a particular interest rate. Homebuyers can apply for a mortgage after they have chosen a property to buy or even while they are still shopping for one, thanks to a process known as pre-approval. Being pre-approved for a mortgage can give buyers an edge in a tight housing market because sellers will know that they have the money to back up their offer. Once a buyer and seller agree on the terms of their deal, they or their representatives will meet at what’s called a closing. This is when the borrower makes their down payment to the lender. The seller will transfer ownership of the property to the buyer and receive the agreed-upon sum of money, and the buyer will sign any remaining mortgage documents. The lender may charge fees for originating the loan (sometimes in the form of points) at the closing.</span></p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-07 16:19:13', '2024-12-07 21:23:21');
INSERT INTO `page_translations` (`id`, `page_id`, `lang`, `title`, `content`, `sub_title`, `title1`, `title2`, `title3`, `heading1`, `content1`, `heading2`, `image1`, `image2`, `content2`, `heading3`, `content3`, `content4`, `content5`, `heading4`, `heading5`, `heading6`, `heading7`, `heading8`, `heading9`, `meta_title`, `meta_description`, `keywords`, `og_title`, `og_description`, `twitter_title`, `twitter_description`, `meta_image`, `created_at`, `updated_at`) VALUES
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
  `short_description` text DEFAULT NULL,
  `tags` varchar(500) DEFAULT NULL,
  `lang` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

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
(1, 'jjjjjTest', NULL, 0, 'test', NULL, '', '[{\"title\":\"\",\"subtitle\":\"\"},{\"title\":\"\",\"subtitle\":\"\"},{\"title\":\"\",\"subtitle\":\"\"}]', '', '0', 0, NULL, '2025-08-23 09:31:35', '2025-08-31 11:58:58');

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
(1, 1, 'jjjjjTest', '<p>dsdd<br>&nbsp;</p>', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-23 09:31:35', '2025-08-31 11:58:58');

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
(24, 1);

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
(4, 67, 1, '2025-08-30 03:41:20', '2025-08-30 03:42:11');

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
(1, 'asdasd@asdasd.com', '2023-04-29 18:03:29', '2023-04-29 18:03:29');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `title`, `comment`, `status`, `sort_order`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Test', 'dddd', 'TestTest', 1, 0, '2025-08-23 09:34:31', '2025-08-31 21:54:21', NULL),
(2, 'Testdsdsds', 'dddd', 'TestTest', 1, 0, '2025-08-31 22:06:38', '2025-08-31 22:06:38', NULL),
(3, 'Testdsdsdsdsds', 'dddd', 'TestTest', 1, 0, '2025-08-31 22:06:44', '2025-08-31 22:06:44', NULL),
(4, 'abc', 'dddd', 'TestTest', 1, 0, '2025-08-31 22:06:51', '2025-08-31 22:06:51', NULL),
(5, 'Tesst', 'Tesst', 'TesstTesst', 1, 0, '2025-08-31 22:09:05', '2025-08-31 22:09:05', NULL),
(6, 'Test', 'dddd', 'TestTest', 0, 0, '2025-08-31 22:15:03', '2025-08-31 22:15:03', NULL),
(7, 'Test', 'dddd', 'TestTest', 1, 0, '2025-08-31 22:20:31', '2025-08-31 22:20:31', NULL),
(8, 'Test', 'dddd', 'TestTest', 1, 0, '2025-08-31 22:21:24', '2025-08-31 22:21:24', NULL),
(9, 'Test', 'dddd', 'TestTest', 1, 0, '2025-08-31 22:21:59', '2025-08-31 22:21:59', '[{\"storage\":\"base64\",\"name\":\"not-found-b4088e17-a789-49a3-a07c-b8139aec72b8.jpg\",\"url\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQEBLAEsAAD\\/4QEQRXhpZgAASUkqAAgAAAADAA4BAgDGAAAAMgAAABoBBQABAAAA+AAAABsBBQABAAAAAAEAAAAAAABXZWJzaXRlIHBhZ2Ugbm90IGZvdW5kIGVycm9yIDQwNC4gT29wcyB3b3JyaWVkIHJvYm90IGNoYXJhY3RlciBwZWVraW5nIG91dCBvZiBvdXRlciBzcGFjZS4gU2l0ZSBjcmFzaCBvbiB0ZWNobmljYWwgd29yayB3ZWIgZGVzaWduIHRlbXBsYXRlIHdpdGggY2hhdGJvdCBtYXNjb3QuIENhcnRvb24gb25saW5lIGJvdCBhc3Npc3RhbmNlIGZhaWx1cmUsAQAAAQAAACwBAAABAAAA\\/+EGOGh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyI+Cgk8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgoJCTxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6SXB0YzR4bXBDb3JlPSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wQ29yZS8xLjAveG1sbnMvIiAgIHhtbG5zOkdldHR5SW1hZ2VzR0lGVD0iaHR0cDovL3htcC5nZXR0eWltYWdlcy5jb20vZ2lmdC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBsdXM9Imh0dHA6Ly9ucy51c2VwbHVzLm9yZy9sZGYveG1wLzEuMC8iICB4bWxuczppcHRjRXh0PSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wRXh0LzIwMDgtMDItMjkvIiB4bWxuczp4bXBSaWdodHM9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9yaWdodHMvIiBwaG90b3Nob3A6Q3JlZGl0PSJHZXR0eSBJbWFnZXMiIEdldHR5SW1hZ2VzR0lGVDpBc3NldElEPSIxNDA0MDU5NzA2IiB4bXBSaWdodHM6V2ViU3RhdGVtZW50PSJodHRwczovL3d3dy5pc3RvY2twaG90by5jb20vbGVnYWwvbGljZW5zZS1hZ3JlZW1lbnQ\\/dXRtX21lZGl1bT1vcmdhbmljJmFtcDt1dG1fc291cmNlPWdvb2dsZSZhbXA7dXRtX2NhbXBhaWduPWlwdGN1cmwiIHBsdXM6RGF0YU1pbmluZz0iaHR0cDovL25zLnVzZXBsdXMub3JnL2xkZi92b2NhYi9ETUktUFJPSElCSVRFRC1FWENFUFRTRUFSQ0hFTkdJTkVJTkRFWElORyIgPgo8ZGM6Y3JlYXRvcj48cmRmOlNlcT48cmRmOmxpPmF6YXR2YWxlZXY8L3JkZjpsaT48L3JkZjpTZXE+PC9kYzpjcmVhdG9yPjxkYzpkZXNjcmlwdGlvbj48cmRmOkFsdD48cmRmOmxpIHhtbDpsYW5nPSJ4LWRlZmF1bHQiPldlYnNpdGUgcGFnZSBub3QgZm91bmQgZXJyb3IgNDA0LiBPb3BzIHdvcnJpZWQgcm9ib3QgY2hhcmFjdGVyIHBlZWtpbmcgb3V0IG9mIG91dGVyIHNwYWNlLiBTaXRlIGNyYXNoIG9uIHRlY2huaWNhbCB3b3JrIHdlYiBkZXNpZ24gdGVtcGxhdGUgd2l0aCBjaGF0Ym90IG1hc2NvdC4gQ2FydG9vbiBvbmxpbmUgYm90IGFzc2lzdGFuY2UgZmFpbHVyZTwvcmRmOmxpPjwvcmRmOkFsdD48L2RjOmRlc2NyaXB0aW9uPgo8cGx1czpMaWNlbnNvcj48cmRmOlNlcT48cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz48cGx1czpMaWNlbnNvclVSTD5odHRwczovL3d3dy5pc3RvY2twaG90by5jb20vcGhvdG8vbGljZW5zZS1nbTE0MDQwNTk3MDYtP3V0bV9tZWRpdW09b3JnYW5pYyZhbXA7dXRtX3NvdXJjZT1nb29nbGUmYW1wO3V0bV9jYW1wYWlnbj1pcHRjdXJsPC9wbHVzOkxpY2Vuc29yVVJMPjwvcmRmOmxpPjwvcmRmOlNlcT48L3BsdXM6TGljZW5zb3I+CgkJPC9yZGY6RGVzY3JpcHRpb24+Cgk8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSJ3Ij8+Cv\\/tAQhQaG90b3Nob3AgMy4wADhCSU0EBAAAAAAA6xwCUAAKYXphdHZhbGVldhwCeADGV2Vic2l0ZSBwYWdlIG5vdCBmb3VuZCBlcnJvciA0MDQuIE9vcHMgd29ycmllZCByb2JvdCBjaGFyYWN0ZXIgcGVla2luZyBvdXQgb2Ygb3V0ZXIgc3BhY2UuIFNpdGUgY3Jhc2ggb24gdGVjaG5pY2FsIHdvcmsgd2ViIGRlc2lnbiB0ZW1wbGF0ZSB3aXRoIGNoYXRib3QgbWFzY290LiBDYXJ0b29uIG9ubGluZSBib3QgYXNzaXN0YW5jZSBmYWlsdXJlHAJuAAxHZXR0eSBJbWFnZXMA\\/9sAQwAKBwcIBwYKCAgICwoKCw4YEA4NDQ4dFRYRGCMfJSQiHyIhJis3LyYpNCkhIjBBMTQ5Oz4+PiUuRElDPEg3PT47\\/9sAQwEKCwsODQ4cEBAcOygiKDs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7\\/8IAEQgBmAJkAwERAAIRAQMRAf\\/EABsAAQABBQEAAAAAAAAAAAAAAAAFAQIDBAYH\\/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAAezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQ17NesCYaxpZVBFxeuWM5sy7UtwAAAAAAAAAAAAAAAAAAAAAAAAAAAKGnZGbzG6mhqaNmpqWQAAgVLQqAKm3myEsjmykstm51AAAAAAAAAAAAAAAAAAAAAAAGvZC7zC9Mw+869IFS0CAAECgCoAArFChWJWans3oMa21AAAAAAAAAAAAAAAAAAAAFhA9Mc71xD7zRRUoIzRgoBAAqUgUAVAzRhoIFBBRUnM3rMblpQAAAAAAAAAAAAAAAAABr2cx1xz\\/XGlqIBQAgUALotAAgUAVAACBQQUBAnM3tcb3lAAAAAAAAAAAAAAAAGNOV7Y5btjFYAgFACKloAgAXS3mJKAultAAEChdFqgIAvjts76bOgAAAAAAAAAAAAAABD7zw\\/o5aeoAAgFAnuerTSs2ZcaRm5Mc9a9m1LFak1jWlZq2b+br0I2wAVigKCCgIGaMFI6vOu0zuoAAAAAAAAAAAAAKHId+fKdudAAAIBRUkcWwkM3cl1657pic56wGUh9SXzaxaXmCtY0LKgoBAoIKAgCsWg7DOuwzsAAAAAAAAAAAACw4T08YLpkUAAAgFACBtS6lgQAAgUAVAACLisYwoCBUoUgVPRsdJmUAAAAAAAAAAAC04D08YXpkCgLi0ARcWqAM0YSgAgAVKQKFxaqAAEChWKKAgCggCSl9Nx0qAAAAAAAAAAADifRy5rripQFAAAIBQBWKAlcamcakM0YTQ1mD3nRsFAFQAAipaViigIAoIAR6VnpLSgAAAAAAAAAAQPTHBenkBmjDVAC+JnGrTERW8lACN\\/N7Pj0lMaGMw0BgI\\/WOQ6417AVAArEnm5lERZjAEXFpQQBWOwzvr5oAAAAAAAAAAY08y9nHVsAAqWg6Xlvt\\/P1HJ9ufH9uZQBM89dxw6XS2GOgBQ0jME4bvy0rCoAGxL6nw63mjZ5f15UUBAFBACOlmu7zsAAAAAAAAAAct258b6OaAAKAqem+TvvZth5f6+GCy1QJDN9B83XLLrEbZr0KlC8lZdcFLOA7crC0F5Ydjz31vPY4fpz5jWSipkjECggBHSzXd52AAAAAAAAABQ8x9nDT1ECpQFAT3PffebqOc644bvyBQPQvN1lMa1ilAAADAWlSI3jkOuEC8rHqfDrnXXTy7tywhQEAVi0AR2Gd9hNAAAAAAAAAARe8+ceviEAAUB6P5e0rjVDzT1cI\\/UBRLYvf+bthLKoaiatYLMNWFEqt0SObtLkTzzvywgHU89drz6DkN44\\/phBQEAUEZjCI9Hz0mZQAAAAAAAAAOS78+R786xQAAoS2NejeXsIbefPPVxQCjruHTp+W9Gua3iM1LaAAAoI6nnvfl5brzgtZFT1Hh13JbDyzty1rEFAQBQRcWm1L6pjpcAAAAAAAAAAcD6eMF1yEAAVO+83Wc57Hnfp4ymNSGbrWcZ3wO883WWxrjOuI3UysSevNFZ9VjQE3rxZLmJx6tSdd\\/N6nG4PeOW6YuJ\\/Gu95dBzO88\\/rPS40ON3jVq0QBQQB22N9VNAAAAAAAAAADzf18IzcCAAN7N9M8nepG6z5r6+Ponl7TGNaGp5p6uNp6D5uu7jXn3fmJ3Xhi56pO+WDz7gJ3XhtXQnfRz22peu57ht45PpgemcOslLQ8x7cpbN7nn0HmXXnG2BAFBAkJfTcdLwAAAAAAAAAAeZ+vhobgQAB2\\/n69Jy2OE9HLnuuPRPL2mMa0NTzL1cR3Xn6ynPXAdudtbl4yevNFZ9WrOoF7OW51c9BuZvWY3A9McxvEzm+i8eog9Z8+68+kxruefQeZdecbYEXFpQReel46SUoAAAAAAAAAAHmvr4amphqsUANiX1Dx97zDZ576eVh2\\/n6Smdadnn\\/p5R+p1PHfScenG9caOoAAAKFIEjnXUY1yPXlD6nonHpNZ0OJ6YidZnsa67GxwXTnBamIQAEd9jfQzQAAAAAAAAAAA8+9XGF6ZCABMY16H5ewAAA17PK\\/Xx383vfN257WYHpkAXJN68WnO0dPRbAEzjU9m+fd+Vh6t5+uwoAAA846c4fUQBmjs876bOgAAAAAAAAAAAOM9HLl+2AgATGNeh+XsAAANezy318bo7Lh02sa4ztgASevNgm5G+eAx7gEdfz3D9Mc30yj1bz9dhQAAB5x05w+ogDtsb6nOgAAAAAAAAAAABA9McH6uVBAAzxJ40AB2HDpI51qWcP6OcNvI2I73zdoOyC6ZqDbvHfvCqQWPcKS9JjWzZxPbnYImc26UATeb1GNjiN457Wbjdl0LOoxrsM7AAAAAAAAAAAAAw2eW+zhZSAAKGeXBYB6J5e0xjWhqeZeriAN3N7fz9Y4gN51rBlubZcUu7nXQ5ta4rtyxWZZZ3GoTWcFAI6XGu559B5l157svUY3QzGzGwXAAAAAAAAAAAAAHAenjB9coqUAKAAE3z1tZuGoDpkZow0jKdVw6zeNaKR5jrJG+Zzn+mOf3kuZOq5dJHOrE5TriKud6Wq3SSUog7O859QMpkLo3C4AAAAAAAAAAAAEPvPnnr4oFSgKAAAQLl6fjvpuPTku\\/OB6YtloZEl+e9qMuNYV0emIreUbRuY3JRM42BaUNsyQOZ3jld4lc77HG7QVM5UyxtgAAAAAAAAAAAAsOX64ul0N557tztBQFxaC+XbzbEnee+p49MVWJDbzEU1nBVgS3nvTzZXpncL5dgG7jWzKBhMxUFTYjnd5j7JPG5IoZSpmKkhAAAAAAAAAAAAGua9YjGCH68+V78xQAujqePXoeW9coWm2AYUhd5rWKMlVIWWOyndTerDGYkc6yygDXMhlAAOQ3z7LHTbjSNWtkobcbwAAAAAAAAAAAMBrUMBaCicH6+OKygKnaebtP89aVWFphNwyAFpH6zF2ZgRCxsSZKWZ5ZLNqtAAaxcZi4wmrUhGrZ0ObU1jRMdbkbpcAAAAAAAAAAAUNGqGMxFSwxnMejlFdMVLSV577\\/AM3XSqwFphM5sgAFhq2YE0jTWUJOMy2GEAA1S8GQ4zU2I66WWi8AAAAAAAAAAAAAAFCNq0sMZaZYhqhPTx19Zw1U6jh13+W8xlBjMZeboAAAAABYYQADVLwDmbOzl3IzgAAAAAAAAAAAAAAA1DRq0tJWNgjdTju\\/LoeW5XGr5dSuVsjq7jNGAoXG8AAAAAADXKAAwmMvBlN6NwqAAAAAAAAAAAAAAAChhNc2TMAWmAsLS2qHFanW5uItBcbwAAAAAAMRjAANFMq3GYloyAAAAAAAAAAAAAAAAAAAAGE1aAtMBhKAsNs2AAAAAAAWmAAAGimCpmJWUAAAAAAAAAAAAAAAAAAAADEadYChYYwVNayYlAAAAAAAGsAAAZSSi4AAAAAAAAAAAAAAAAAAAAAGMjzXs4708pblvbzqyJuXIAAAAAAADXKAAFSUjIAAAAAAAAAAAAAAAAAAAAAAChC7zwXp5Y7N\\/Gu\\/8vahSgAAAAAABgLQACRjYAAAAAAAAAAAAAAAAAAAAAAAANWzke\\/OC3n0vyd7THQAAAAFhjLSgMZcXgG\\/G0AAAAAAAAAAAAAAAAAAAAAAAAADSsyS0MNAC00016AAvMkXlShgMAqTzZAzgAAAAAAAAAAAAAAAAAAAAAAAAAAFpiMJZWqaVm9LsgAAAAwFDLEgXgAAAAAAAAAAAAAAAAAAAAAAAAAAAAFppl5YW0AAABfFxsF4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABaWlpQAqXF5UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\/\\/8QAMBAAAQQBAgQGAgEEAwEAAAAAAgABAwQFEBESExQgFSEwMTRAIlA1IyQyMyVBgGD\\/2gAIAQEAAQUC\\/wDUpWIRT5CoyfK02T5iovG6y8crrxyBeOQLxyuvGqqbL03TZKm6G3XJMTF+6kuV4keZrCjzhI8vbJFdtGnIi9Db8e1ndkNyyCDL3BQZ11Hl6hqOaOX9jJPFC0uagBS5myaksTS9jNxP9Hd9Wd2eLJ24VDnAdQ2YbDfqiMQGfMQRqbK2pU7u76O3C+kQiZd7+b97kDxegzuz18vYhVbJV7P6eWaOAbGaXFNck9Tby+vVys9dVrcNof0RmMY2sypJDlL0vLbv\\/wAnljeKTV339Hf8e4DKM6GWGb9DcyMVVWLUtovSq8TULUTEMtXhAsfwqOlxg7OLljtiiqccUNMNoBY57VdprnQvzhgcofDvOKrxQ5AWG92Ptv6MnK1xuU4fvezXstv6joLHLo1phG1NaF6+0TlHcB4CJyPqovEwOvLW6qKWeJ2GXqISsdVDDIZ1o6rWovEgkgkqXZRmt6P7+ps+2mJyH3CIQG\\/kSsv9A7M8gfSEuEzLjPufbtxtzq6\\/2XdhbIX3tH2vt2+W3ZFI8UnobeWrvv8AVoWeltfZyt7mEvLb1mbWHG2ZlHho2Q4uozdBSRYymSkwqnpz1\\/UZ9tN329PGzc+j9fKXOnh1lAQk7BFzNsTbZ\\/CbikxtmKPurU5LT1qMNdcK3Zk59hTuKsY2GwpoZID7383ixtqaPwi4vCLikB45Ox227nfdYE\\/L6xm0YWJysT9rPs+mGr8c2maseXbQoPZcIxYHcYhc9+132YW4nUscdqO1VOrL3V4XsTiLAKuT9NV939PBv\\/d\\/WzVjhD0Pd6cHTVkRMA2JnsTttvrSqvanABYXfZO+6JzrLrJjX\\/IGuRcddNbQ1ZSd\\/bSaELcMkZRSO22pCQEsJX2bTNWOObVm3eSMopO\\/Bt\\/d\\/WtTdRZ138uzE1+da0zNjl1+2lW6eu77M77+i\\/vpla\\/Mi1MykKMHlkhiaGJTytBCRcyTvbbtwIfWyMvJpejjq\\/T1NL1jqbXZjYedcFE+7p3ZkVqAU+RgZPlBT5Ql4nKvEpl4nKvEn3isRzaMzG0sbxS64SvxSaZux6cUnKk0xUXKofVzknkmd278bX6i3pk5+VW7cOG0BeQySDEE1+WR3dy9FncXqz8+NvfLhw3NGZyerA1aujJgCxM88\\/pPtpWhexYZmZvq5guK93u+74qvyaumUsc+3RxkFip4NVVnFV4q2mNHaiauz82ZRg8kjY8tyFxfWvE0IBPDMrMTQyqkfDZWYb8EzbrD1+bZ0zVjggxtWO3N4LVXgtVWohhtM+3o4Wrwx\\/WyL73++lX6m1pfsdNVWK\\/j1d+E22mP+HK+2tP\\/AENNLzMhxcGsfBNUhpEMtuQJZVW+Ssv8fShX6appdsdTawfytMh8\\/wBClVe3YEWEfrXvnd+Gr8uDTMWOZYWK\\/j1d+Fpiy3pH7u3CSgsnCuoqsc8zzHqJOBPPK+tT5SzBaYuvz7emWscmozbvg\\/laZD5+rNv2ABSHRqDTg+vkG2vi8fLTu79leF55xFgFSkQxFRuEXh9tY6M4qSti51HoWhZYeT8Xfd7gcFv06Lb2llJOO6sXX5FTTJQW7Nrw+2sRVngsaXKNiS3JGcR9vusZj+mH7GWHhv8Adiv5D0J\\/jqlNyLSyYefYIuT9FCKsVXjfsxo\\/kRtDGRORKD4\\/oZX+R7JJZJzxmN5P2s4H9XuxX8h6E\\/x2ZyKQCikx1nnwWoudX7KDvz7W\\/UDuWO183etDyYsrY1g+P6GV\\/kezGY3l\\/bzEfHS7oZjgk8Xtrxe2vF7a8Xtrxe2qExz1FZN4qxZW0Q6QTFXlhmCeO9Tdn1rEITzVuaR8Favp7vUqcpW7TVIv8y0HLWxHxe4vF7i8YuLxi4sXentT6W8naitTTHPLFXmmT46ypIJYlisd9yWNpYiZxfT27Xk3i1xX8ervwuyraOrJDPHYCxjwleSCaFcTac02AjIlxMoqk0ygqxwKzaCqMkhSmo4ylN8S\\/DLDJCXZg\\/laZD59Ck0jf9JvMRPZM+\\/3MtByrejvu\\/oV8pLWh8cnUuXmli05MnBpHKcJwZMCZnYmmqwyJ8bC68MBNjYGUdeKNGQRtYyi4n4iZRQHKqdcYWRgMg3KJQIRI3GhZJPj7LKvPNj5fHJ145OjMrVnhYB0HRn2TPu32snX59TVtvT3fajjN0TCzXMfsZAQJm3d33eOWSJxys4pssC8TjRZVSZKySIiItndwqSknq8AQvzW22bR0EYRiMmzcwXRRxyNbxKdnF8cG8z+erPtqD7P9pyZk+Mg5nQVVNi\\/J2cX7GbfUQI01Ow6KrOKxlLdOW2hCxiYcLtEEsr0RT0iZdJIS6OVSRlE277hWiNDViFMzBLpDA0PY\\/8Ak3tq0qyFTmhjj3LnlHJ\\/UXMXumfZbpvf7JHoWuSrscXaIuRVcUy5IRgn8kJbFrLG0oNA8DKXyjbyZTxuCcvOtFwMpfb3QR8HayHun\\/s71WISY4k47rzAvdlCPn9gy1f30cWKOQHik7MfS5Qu7CxE5aF7IH3DV2YmOu7KVbrdWOLid2VUSZ90MByKKEYQ7R\\/xTPpJKETDerk6Ok1qfQ491JG+0bEhhd0zbN9j30d9eIUcrLIN\\/WXlssfDzLDfiJFxPoXsovftIBNFVB09R1LSnNeESKHH8tDEAaF7do6sSsSvNNVpyWVDXGMRbhb73\\/Tvs7loR7Jgd0VZ5I4YjGS5JzJ4ojmNbOsWO0B3oRQSBK2haR\\/7fVL27X\\/GbXpCe4IsAxj+hlDQ32aMd0Ee2lyEpYYcZPKosVACGvGCIG2KMSG5QeFQSvDL2R\\/7\\/pyhxgBcY6Rt+QNxP+iKJnT1t3GMQ7NlxrjdOTvo7bsdV+t9md99YPOT1i7pBeMhJjFR+4Dwj+pMN+ziZH5FqZcAQA4Q+sXt3HA7E9rgVL+rH+rIN0X4p330P31D+4m+uAcbszM36whYmONwRE0YBcmCQMjG66uu6ZztuADGH0H9+1m3cB4R\\/X36ZzwHGcRKiwvbAG2fyf6Be\\/bHHwt+xnrxWBtYeSNRu8U8aP8Ay9NyFlzomXUwLqoF1MCeeHdjEuyOPh\\/az1IbLBHy2k7XdhYrtcF1\\/EubcNcu8S6SV14fG6bH110VZdJXXSwLpK6KpX3ejC6A5ITZnJwjYf3G26eNOLtpYm5IDSeRDXhD03909VpQEWBv3bszoqolNy3Wz+kwO6aBMLD\\/APBbMuAVy2XLZcpctly2XAP\\/AIL\\/AP\\/EACkRAAEDAwQCAgICAwAAAAAAAAEAAhEQEjEgMEBQAyEEURNgFIAiMpD\\/2gAIAQMBAT8B\\/tLKkK4K4K5XK5XK5XBXBSFPdyFcFeripPAlXFXK4dncrip5Uq7rS5XHoZU9QXrPSz0pd9dUD0JdCJnbGEVChRSFCihyopChHPCB55d9bs+kFNJpPuk0lTSfdDwweaXTwZ6ActxnshynHiWlWq0K0K0K1RyhyHGNq0q0q06wJQEbBbtQrSrTut5BM7LRV51ATtkSiI1ip3Rx3naAip0gTukTrbV26OOfey0VcdQEbzhxm8Z2NpogVJk6W51SpUqVKlTsNq7eHGfstHurtTKzuuzoHTuzstHqrj7Qb6VoRaKtxQ0e60Sv5Q+kCDjR5X3mxqd43s\\/zleJ97ZoKOq2rkArVbtjjuzsATUmBRuKHFW40fI\\/3HtfjbEQvixJ0PuZ5L49LyfIBbAXhY5rYNBR1RUptTsjkHOw0VcaNxQ4q3GjyeIPX4vMRlePxhg0EAiCvxs+qijqCpo2p2RyHZ1jRBUFNxQ4UGjKHcFHZoKmVBTRUjYA5Ls6252TQZodJIGV\\/IeZgLxeYO9HOkbpzqA5T9bc7Jq06vkxYvDFghH158anHcOdIHLdjYuKuKuKuKuKGKFXGoQMojR5gSyAvH5rBa5Nu8r7hpJjRcVcVcVcVcUDUmsUA6luKHGkGEDKhRWxsyg0DFIoTot1NqUB0Lh73A6Fertc\\/dYUKKlylGgFSKQVBWFcrujcPXADaFtAjS5XKaEmsbZbRvR2BWhFm1aVBTRqhQiFFYUbxCb0zhrDfvoMHpz60tEbccYjp350NHvehQo7lx96GY\\/SCg0q0f05uKvUj9KcJq3P6XEot\\/TiJ\\/wCAX\\/\\/EACcRAAEDAgYCAwEBAQAAAAAAAAEAAhEQEgMgITAxQBNQMkFRYIBw\\/9oACAECAQE\\/Af8AUsFWlWFWFWFWFWFWFWFWFWFWlQfd2leMrxqwK0dCArQrFafZAEoYZQwwoA7UBWqPWDDKDAM57Vqj04BKGF+rRvpSPStw\\/wBUR6kj0LWEoNA23coFSrldS5EoniEUDAVylXKU3jpEd9uH+7saojTRAarXQK2kG2FrKjhFQYChayo0WsocdMjusZHRgegPbYyOgdfRHtYbI16heAvIryriryvIgQe0exhtk5Bm8jV5Gq8HOXQi4nYD1M7NwVwVw3T2AIEbOIdIrhj7zOdG2DCBnOajdPXwh97TjJqBAyudAywtFpmBjO81aN09dogbOIYFcMazmcZO8w\\/XWPWYJdtPMmrRAyvMDLCtKtVqtVqtVqjO81aN49bCGy8wKsEnNiVDdsijOMhM1HpML47OIZNWCAnPIK8hQeSav5o0VtyhSjR1GVeatCcYVxVxQ2j12fHYcYFWiTTE+VG81fzkFHZPpQjQ8UZUmTUCE+o49Cz47GIdYrhjSaYnyo3mr+aCgKkI5Zq6jKOOlWjWj6jjZPYZ8VrmJgTUK5qvanmTRvKuFMQUbuOo3ijjrVsBSE41B2Cezh\\/HPifHZHNHCRRuaERlchU7LeMxPaws+J8dkc1eIOYIr6zMH3U7LeMpPbwjrnIleNq8bV42rxtXjanCDQcqwVIlEQgcgRC4rKJTROS0K0K0K0K0JwioArNCe4DB3cT5UbzlLZREKVcpySrqATkvU5X1HCJ9DhmRuFgJXiCGGBWRUiUW\\/lZU5Az9RCClONQ6aXBSEdVarVx6LDMHoOf+Ua\\/9oTCAhRKsC8ahQg0UClTtB1Hej8hXkchifu1cFcE931llXK5ByuCNAVOQnaBTvTYbvrO7E\\/FPTJ3OQj6YGRle6dudid6Y9Ph8ZHmBvSpU0n27BARMVxOf4hsTqjiAI4hU1n\\/m8I\\/3g1RaCjhlWkLj+JYQDqpmj+P4sEhDEH2jqP40OI2IULRaKVKlSpUqVKn+An\\/V3\\/\\/EADwQAAECAwMHCwQCAQQDAAAAAAEAAgMRIRASMSAiMDJBUXEEEyMzQEJhcoGRoVBSkrFigqIUY4DBJDRg\\/9oACAEBAAY\\/Av8AlLnRmD+y69q62f8AUrF59FqxPZdXE+F1URdVEXVxPhYRPZa5H9V149lSPD\\/JUIP1rPjNHqs0Pf6LMggcSqOa3gFWO\\/3Wc4njoJz9MqhWbHf7rWD+LV0kH8SquLPMF0cRruB+oziRGt4ldG10T4WZdhrpIrneuRIdixxtmDJdZeG51VKNDLfFq6KIHfS7znBo3lShgxD8KjubH8VMmZtkdlsnxLgljLQYS0DWiHJwxdPHQzBkpP6VvjipB1132u+j3ojw0KXJ2f2cs+LMynnHSz7Rdf0jNxU4buI2j6Hee4NA2lXeTD+5V57i4+Ojx0AkAEWEgy3HIHhoZZYexxaRtCEOPJr9h2H6Dd14n2qcR3AbBo3vhwREfzkqsvUkuTl7WwIj53qSTYkOIIrS67Teog59hdDbNzUy9GYx0TUadqIOITmCOwxAJ3EIkSM2EHGTZ7VylsYgOhj2TGuMgSnta6GxkMVIbK6oTGxGubF1XhRYk+rIVzn2c5dvBm9c6+K2GCZNntUUNAA3DJphom81ewre32iDyg5vddu7dMow+THi\\/SCs06G15a8xJ03IRI5J8TWSa3nueeIodqSXK4zXOm6GZtLZXVCH+oMEwxIjm700XEzJKMe9mXZTl4KFDjRDDMInuzmuVF5LGxhIGU0xxwBXKQ5xEONg6WC5M2GS9kEmbpSnNR4cOMXmIQRmyUONezA2WHgmw4sQwzDcTqzmokRhm04W79LOVLRyaKfIf+u2FzjIDaubh5sL99huPiuc3cT2MOkDI4FF0g2ZwGWJeuTndYyju1EkyAVxlIQ+cqmSN+SHgAy+4aGfaWv7po7h2rmIZzBrHfZ46c1lbO5cbvdRdJGLvKF1TncSuo\\/yK1Xt4FdDH9HBdJDMt+zSYTslOmkYTi3NPaObYekf8DILWvDx9wyQ1omTQKsMH+y1B+SMR7QGj+WXm0YMXnAKbG33fe5VrZTIuipdsV6F0T\\/gq5EbI6ERGMzThVag\\/Jag\\/JFjsW0OjwkosPgezl7sBVOiu25U7THODMONreTjbV2VffSEPlBobdYMGqZo0fCpkzK5097DwFnNxRwO5XH+h35bIQ7xQa3AUFj4m3ZxU9I8fw7O3k471XaGQTYe3bxsLnYBPinvFVwyLuDRVxQDRJrcBZVZrC+HuGLV0XJneq7jFXlK\\/wDZX\\/kRrw+0ZBhPx7p3Iw3iTm5F1zS07jY7lB20baIAwZU8ciQ2ow36wx0Dz\\/Ds74m80yCMm+dWHX1tEEYxMeGUGd51X6Ycpbi2jsi89xcd5TYbcXGSbDbg0WOiuwaE57zV1dBUyyYsTgOzPO05o0TQdZ1XWufswbwyWz1WZxU99tVWK30qqXj6KkI+pVIQ91qMWqxajFnQ\\/YrNNdxsMN2DhJOhnFplkO5QcG0HG1vJx5naMPuNfLY7C1m9+d2aFD9bDLbltnqtqbbjdeJmjKiRPudKy+8yCzMxvys4k8dDMGRVdYY2XvvbO0AYlMhDYK2F7sAJlPinvHRiVjIQ2mqkMB2aX2tA0E5SV460StplqszQmxX35ncVjE91EiNL5tbPG2F4zPzYR3WUsDBtRm8eCkRLI5+JIiSMEMu3ldBnYB91LIDuIsxkudOrD\\/dogjF+PBOZEnINnRYxPdYxPdRIbcGlGmhPKHCrqN4dni8dA2HsxPC1z+8aNsh+v7sjeQqosgcP+0TutfJkyNqvXzNMJAyBCD8\\/dNXnyk35U2CyHxsg8Ta1neNXWvibMBwT\\/JbG82hDO7i4oNaJAdnjebQGMcX4cLeaGEP92Q\\/X92RvIbYf8SQii3cZWSGrOqBDdmMkam7sGReaZFHPNcbYdkFngTYCdVlTbdGtEpY\\/yWxvNoAxomTgrveOse0RfMn3gb\\/dsqchkId4oNbgKWOc1t5wFAi4wXTK6hyYx7brhOlkVrRMltFMwXSFkSF\\/YWP8a6QeAsI+wXbATrPzjaS2C4sbRq6hye6LDLRd22xnthOMzTxRY9t1w2ZfOxB0p\\/x7S7xAOXD9f1oYnlNjXnVwNjIn9cmTRMpl6Jj8ouYJw9+S9\\/onRXYNCLjibIflGhien6ybzzedghGjDpNg+3tUOJvEsuH6\\/rQxPKUAMSix2IV068OnonNGOzJpuqnTRz8iQqTggzbtQ5O3ZV3G2H5RoYnp+skR4wz+63d2u99hnliJD1gtYfitcfitcfitcfitcfimRImsbIj24tbMItLhI\\/xtERuz5QiMwPwjGhCneGQC8yC52G4SK5t2detkBMnYr76v\\/S\\/3HaoVXeptDQ4SH8Vrt\\/Fa7fxWu38Vrt\\/FObFIIDZ4WxIbHC600ojEiaxXRwyVSF\\/kukhlqHKIw8jf++2OhnvCSuu7ugay40S7205EP1\\/dkbyHJm2oOLd6vwzxG5X4ZuO+CukhmW8W3Lxks5xNmFxu8rNE3byvuibGoveZk2BjBMlUjC9ukrsRssl\\/ktjeZc9FGZsG9SFBZVV7bfGEStszoRCaxhA3rq4adDMNknCVt\\/m3Xd8rb8N0igI2Y7fsU2kEbws6GFQuHquseqlzvVZkMBTiODR4q7ycS\\/kVMmc1NUw3ouHvZce28FfZnQ\\/0pNaSfBdX7ldX8ou5upEs4Lqoa6qGr0pOiOQYMGiX0Ey1mVGRXRy3oRI44NUgr0KgOxZzZWzhvLeCk4Nes6AfRy6l6zYHu5UIZ5QrziSd5VAqi7xUwbxCF1XRstlvUmNAClJVClIEK\\/A9lIiRRf8AYpj6E5xLpE0aur\\/yU4Dv6uUiJEZJrbmtJ4LqiqwnIRog8oUhZIq65OkJNG5UeVrhXhKq2KslgusLpblqz4qQEg4Wl3ed8aHOXOsGePlRJ4mSuSPhKyoUx22QyefGs3HKutEyVejV8FQSt8DkFuHirp97HKVhecJ2Xr07wsDvtVFM62T65c26pqmxyMRmqbbZiyfaZZT2nAhFh2ZN5wzjj4aKRU2V8EGnfacbtl\\/YRZWgVK+Oim90lK9LjZDc7VZreNswsFKRVe3VWKuDagfCw79ll44MrluHrlZwBVJhUcFdBZdVXtQvRSQNio3QOG51tUXH0U9Vm9Bgm7ipfQ5N91MqTc0704xMRRGWDaK4wTNmCc7eVdMVTY4HJ\\/r2TzjIELYTj4INaJAKf0GYslvU1M2O5rrNizujHjiqi8fFZrQOAsLSKHcr7M5n6QcPXJ\\/r2SmsKhTFs\\/osy5UycMiRRgtwn8ZMR39ey86wTB1mq80zFklL6VMZM5VyC47EAccT2a\\/BN120bCulhvafBc9dIB1Z\\/VP9uGfc9okcNqkMB9NqvBF7sG1RcDrGZBWe0t+V1vwrsObYe129BrRIDs8gpfULsEy3jerr2lp8bGB4mCpCgHaJnH6ldismr0DpG7tqaSJFrtNVwXWM911rPdda33XWs911rPdZrgeByJnH6r0jK79qAnOQypkyXWA8F0UGI\\/0WbAa3zFVjMbwCzuVP9FnRIjvVapPqur+V1QXVNXVNXVhZoLT4FCHGN4HVeqLx+s0toJuNGhX+UuLnbtgWbDb7aW7EwUh9cwQizM2igsw0WCqVQf8AweFmKxWNmH\\/Av\\/\\/EACwQAQABAwEFCAMBAQEAAAAAAAERACExQRAgUWFxMECBkaGx0fBQwfHhgGD\\/2gAIAQEAAT8h\\/wCpFAlYr1MwVmfDZ9q1Z0fBQsdBVHD+D5p0PJ+VfQPmvsHzRqj4fKhsh4fmsp1SrGh1RWT3goqTOT+ayTcCT5FZ+OUD1pfn09fXX617R4+1OT1BPYcAzHFvIyg8msSeU0rMiPtatNvP9LVtb+mKCkHrfkoJJoQ44VIADkS+teTk2eW49gnmx3IAQQZHHbIgjUqIB\\/ZcajFnWPKpZyab+X4tkI5SCpbknbzVMg8G31zSpSZV2usUqGGdq0ExlK\\/DfLOJpSIJODTsJziX9L2IJCMJUEnI\\/dUTM+Q+HH8P16hrT3ifTFSdgUoy3DtcsyzETfvEQnPLnRq68mW34MS5hJFZfCvsUpedV2YSrBMEZ7BgWBM+tI99cxuLcCyLEdjPRiZxfz38eIkrgDf1YfwIqOgcdav3mj7HZmIf5AoireNgJsppWXOwJHBDVoNxhk5U6Lhyp+FGVCQlLEl4mUiaNstds6Jb\\/llyzahnCitYPd4CcPFqeRncRbNqhLgicZYqdpXkpETRlHvFv\\/VF1SQEGDcIm+KuLrrT2TTACOLqjltVyuC+h5d+URADK0liGPh+aVVVlezAELhflRCVMxhxogDCRXos86z1k2YCm4XY7kWWnhCtFnCOlTKCVjNN8J5jNvvT9ciLFZ8GjTBSiIi3hWEgr50T9LDLKS1CU6dYIKkhdjhDigzUNMs2+9FtqxYv7qbkSURpsM3YoAgYTZ49razSYGLTtWeRr3wbc0q0p0iHn19xNlncxiqzBZ61neTDAdN+zcxlx3BRkYSsw9Q4PejLAlXSp4KbHvd6ZtQgyzuuJPFuun9Eh2LAyL6TfcsLBBFjsoYns2Ufenepe+bGvh02NmB4me3BuECSddp4JFbLdwiqBdY9OL7PGsN9LrQNwei9au4ODfzdoEpMiL6bIEFLJx7Sc0l5H+R3jAAf9NwkbwEDuz7HBzoijcI1\\/LUemZWG+0YVaFn1JbhV13R5Gl0Uss7SwSwFjxo5h4J9ilbj9d8YRiY40pGAnQonDlJK\\/nq\\/nqh2msM33XcMYGzO9YWQItrV3aI+z+u7tbBya1kNjgaG9FwGGYSTbG3T6n+bY3fqjeuPbd1fAoEwICrbDUhcPHdBkgLq06HGj9OtCmK8Gpy+VJrg3PA38lMC8DVo\\/oODlsPQRHWxSqJlcvaRcY\\/c7vKm\\/ktPvLsQQCVwUOjiefVsYqBleVcokOBpURiuoGNwN6UyiWmgqM01X2th5VMhnOvM+\\/jWmDoVDjzlF5TvoPWhMNtgvLiqm8CEpYylybM7XQjkIdkL\\/wBLV2zl91f577jHmUFFpCwJnsJuEfud2UCXBT6P5DTcIQC+sY3bZ\\/UNsof1G9NZrXPhQVIpexMPYMM0Qj1k0dxKw5SWjpkgrQ+GzVsHWpc5FITfsAp0HDds9J++Xdo2YHzP8nsoZR507MEtQO2vgN00GfQMetGys06YbAJQHFr3cP0r2x\\/KtRPArQnrOnQ9Sv5b80anqVNYxQT47NsvWuXjWQULchD\\/AF3p77bb\\/pY7MlLhblbb8IuPHHpHdrFcq\\/Y\\/ewQKIQ89+ECf5+1FW7ljrvcUAPQ\\/tL2qfQD1pQLpftT8q8VPYNCXBhK8MfypQGrJwXjx+tplykBxrIRecXXYukOTlWTGSOBodnoiWvLrs57E4GtAygIDu059hP77CbgkzBgqPOLnpp957Yep\\/wBxpNLucGelfyPxUuBBI+NvWNPrpTuFMa3IHPV2OqDxVCBQXBmpcuo3L7BaRMURCGxYjr1q2uiemxtOCtk\\/01tlxZAm+tTg6p7Nst9foU5pgJxqV\\/M\\/FfzPxUydqTmoFhki+nY\\/a5E93n\\/R6dgkFn4KgAgIDZAzHmTs9d7mz7jhSEyNrQxfZ657q6CVM3cuxkyqw1qEkpJvnlQQgTeHXcPWIYPxR5GmKWbiIWIl3N+y4G2WiPMnYoEtgpJzPwVfb5naYcZB0BQYBwBod39Z2xGd2EP6zbDrxvds9d7mz7jhth39Sf3QkmnYy3k2XGukIqPPkY0tZF7TcOQDDSzevbRPWfZ2WuF7D42R5n\\/ONss8WvTX7zq1SFtWvt8zfxZxoTncQW+Aa0IMN7jveID1UEnqJjY4zsgJGCCdzgMi8DWiug4HLYiKwOrS46SvHZqMrgursXMuA1pqUErsmnXE9h\\/VXBqI6OPj\\/s9i7ZhxX9fuglCoKbB8vVdkfPuG0GM9bns9AOiPFJtIDSsLURFkLdRMkUCgCVwFaanHB895mf8AIj9b\\/pvc7H7bhsnpC8lps1bfNe5+92THgBNZANQsUSIHFuyaYA\\/fKtW5dXQpGZWV2fRcOx+9ybsx6BKKESyz\\/V+9Q8d+V\\/3f9N7nY\\/bcKzhEFCPDwkzUC9iXPQ02js9ZRuBQCHNRNvMzariJA\\/yl2gA5UDjUP3yXFoVXZ\\/C2\\/RcOx+9ybsW7rp63n3uyS5+DFQgMWcbyNBgUmv46v4qv4qv4qv4qkaGSUI12PfDKIONhs25bcjg4UhM6Gq4NTFFc\\/coRJNrzA1qeU4rmrASlgy7bi7CFafWsgIS6HOrolLK6m2BDYLK\\/kK\\/kK\\/gK\\/gKgGhRC8m02ODI0ywwyhFYU+OnnWeBYtFrzEktXm+nu75icWjWaUkcNqKhITTdKVDWBk47nrvc2fccN3mCVil4k1M9VOJXmj3sIqTWpohBcNIywcWkNfKo59c+VE5jOZpDiLoc2n75zt+iy940DzqRl++79vmbmX0g\\/fwrAADAYNkIgJzpbLigEj3yZC159fvPaiIq5XsZzI3lOa+k\\/NG+KST87RYOq42lEHqUeM2jL4o6xYSSlpu9Qh9K9Oun3ivXKpl64xLXUfTNPC7jzeBV4xZLrUFmGlbI42KKi+JauxOJdGpWfia9dckJCaCkZ0Ci9XQVwt0avsPzX2H5pihgDF6ArBBtdk2O5KCY73PTP+8bl61SHDr2ZNLZXONeMBdOvxQqib1jPFPw3VtiJcLmzUCOi8kPpTMD6cK\\/qFaJ9f8qtp\\/0u1zUWS03uZ0CsCCmXQlEs0cTdtHCgHg2naUOCPCuUog2EGkKXpDSiBsPlfinLgsjQukwt1roTtkTQyW2W3R73mfKppEgLBViJnOVBJq\\/S9O3WCOm7AsEE312pQzyTQ0ni2oOYnImpXVL3oB6uxxrU6BP7rQL2iWmYnUmjlFDjUISIkvX2tFGebWaXodY1iEV+yk1EhYA4m18uabhSuVvvpTnaFGRirUCaBLBuGioNCBWIodaS9SrOdGjy6sJJKRUBpTAb96+d2Zm2BOjzm8GRgBUQuPIfNEKRMRbYoTV2wkJ+9xSMksNKB3vdsXgooQcBsWITso9FcCAxGywuqfDWi4LlxFHrfZuqZeb3pQxvBctAcnJU3ByDA18BRZ5qfuvUgYnZLL3mK3x2udrMiRrOIvPczR4df4V7bKQl8trmzhpyXOHruRgkrSBSYARSQ1DjUONSzzPlR21TuaS9To2BPq0GLgRLLWd33n32T212R\\/HTnV9vQihEkbNa71D0FBBBjZP1eFJyyUJVE8qYmwoIDvCwTSyl2aZsSMg619JQ4yeugOK2TMnkbCiJ9ZpQOUU0umm6Pyn6freAiExJWSU6ldSjmXcVn2oZt+ktdGcEFYqnj2FbzD1v+9wLNabOBSkbGX+qdjqaGF39JRxq3pUmKCXYhfWliuhOhQTWUEpIUBykWJjZzHlQ6p7dK30aBNR3PLarxscQ4+x\\/3uj4Wx1P89tywKSiiOooCoCeX8DPsrPzlUqyeFDqXhseogPFTEnoPZUavxn+qIjo4UCZXG6GFBrupxou+tnEoZJKWCabuz0ve\\/526QxupoVl50J2uJweG0GYuFq6CZ\\/B3MtQuu\\/AoizHHcdQU8NOlQELsBgkbJQwnIPCluUVI28oCDwv++3N53m6MC15nOjgE12SYspahLzfiuYNqxQjUYwkXaVc7RxIedZlfmt3txO\\/fHTLTgmuCRpgeKinH8YV5ZpShL0mWxT0m4Y0vMn747xPFLIoDIAgDT8bHh40lx4qxyEqkWiXIo+98rKCSDzVDvV+eQrTTLuOTeQsjQxPH8fnNNAqZX9qYmOQbA+uSHpVgDAChY7jl3c1xoen5KHg6Op0ak09D+aVcEonOlntTCDq05heGkPi7XVdb5GvemNua+7R+Vjhug2HjTgQQS5oYd2OIcViswjx1CiNNtGhnrfqtf8AyV7wKhz1joLT5qip\\/nV\\/CqU95rpQmjE1f6mowJq+t\\/zBAhJodUVo3lsusn5lpmWtLFGJXPLs8lArATSoYehmjp2PzmUotrQTBzpHENJZXZfJKLM3Ioqwf+CUyFKU69c5UOKucrr0BQAwR\\/wV\\/9oADAMBAAIAAwAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUMOluakAAAAAAAAAAAAAAAAAAAAAAAAAAAARGDHbEt2zIBBXgAAAAAAAAAAAAAAAAAAAAAAAVmhKSbYlu2ZAAm8HgAAAAAAAAAAAAAAAAAAAAJ2pQJyTbUt2zLgE36CoAAAAAAAAAAAAAAAAAACqltIBKSPYlu2ZAAm\\/QJPgAAAAAAAAAAAAAAAAfKktpALSTbHR27IAE16BIegAAAAAAAAAAAAAAAL20ltICZM7nLfqZCMm\\/QJePwAAAAAAAAAAAAAATe2ktpTZmE6o9mLIAE36BINggAAAAAAAAAAAABNL20ltIBISbYlu2ZAA1\\/QJUMGAAAAAAAAAAAABdJe2kspAFSTbGt2zIAE16BIRgmAAAAAAAAAAAAFZL20ltIDIJC5tu2ZAA2\\/QJCMFwAAAAAAAAAAAdJNe3m5pAJERQANWzIR+TaBARg\\/AAAAAAAAAAANJJJ20AtIBFaAAIK2ZAQAPQJCMFkAAAAAAAAAABhJJe2DApAGbmm0STbYAAH6RIRgsgAAAAAAAAACAJZL0ABtIGIAAACQKbT8d\\/QJDsFoAAAAAAAAAAABJJe0RtpFYD5weLwvIMDX6BIR2sAAAAAAAAAACDJJLwDFtJAPySSQWwZSgK\\/QJCMmQAAAAAAAAAAcBJJMgfNpZGduSaZ+bDATJMBIRgoAAAAAAAAAAAgJJJgeoQIoRDyRIMz7IA8AQJCMaAAAAAAAAAAAMDJJYCFCJDOUmSONuDUB3gCBIR0AAAAAAAAAAADkJJZCrcKK4SSSSRsR7gIoCgJAPgAAAAAAAAAAAEBJIAAAAFCeSTJDtnrcAAADBIMAAAAAAAAAAAACgJJAAAAAhPiSQ7tsubgAAAYJAAAAAAAAAAAAAAMBJJ\\/+ljBAwySst6GTXbQgbe3gAAAAAAAAAAAAAsLJLq0oRIACB+J67XlgA8AAQKAAAAAAAAAAAAADhJJe2m+JEKyVDF9hqcez28SQaAAAAAAAAAAAAAIJZL20lsfACfP0r3MSTHLvSSQIAAAAAAAAAAAAALJJe2mBvStPB9k2QySG2okAAAAAAAAAAAAAAABQSFL28S0AB2MTMx8SSS221gLCIAAAAAAAAAAABASTpenC20ACXtwp7iSQU3AiCYKAAAAAAAAAAAAASCCK3S2mgAAAPw8SSSK2hCAAAAAAAAAAAAAAACAAYZs3a02AAAAAACSSRW1TAAAAAAAAAAAAAAAAKAAT8qKEm4AAAAAAASSAWzQAAAAAAAAAAAAAAACJQABbAC23AAAAAAASSSc0gAAAAAAAAAAAAAAAAAAAAKAAG2AAAAAAAASSSMkAAAAAAAAAAAAAAAAAAAAAQSW0kAAAAAAACSSSSAAAAAAAAAAAAAAAAAAAAAATdaeAAAAAAAASSSSAAAAAAAAAAAAAAAAAAAAAAASQzYAAAAAAACSSSAAAAAAAAAAAAAAAAAAAAAAAADHJAAAAACRJASTAAAAAAAAAAAAAAAAAAAAAAAAAALYACMm23t984AAAAAAAAAAAAAAAAAAAAAAAAAAACLBHAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALIAAACZQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQbJIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf\\/xAAmEQEAAgEDBAICAwEAAAAAAAABABEQICExMEBBUFFhYHGAofDB\\/9oACAEDAQE\\/EP5S0n3ZCsrKysrkPulPn3aHmMn4Eun2dgL5hA+UICPsVDmJ8RbiKedB2wyHygjx6tagnEU1gPPYeOkMgH06hzPgm639KMgj6Na5wlXntEprtLqW8+hKE5dP4CDi9o7LJ+8L4+NwsWsBvcOYLjmStln7w2X2E1nwvf8Aj6opSLe2OzmbbsBRvGU3QRKZRWHMpb9yglRQEJTdBEpitvs\\/E94tTiHHY2ee0eorO74Rx2A036JU91fsdoJD5uD6MT8Yo57pWdxWo0JTtpC80gW61gegB4iJz0Ru+QqvRlouWL6NzefBrwV0gG8RaxbWVRfV59vsV0qlY4itvTcgVoubzeUytFColNah5yt60pXQ59urX0bm81FaqnW82i7gW1AorC0XOfRlXVBvGkXpWSkrnvnEcJcSmtA85XjpjWRR2y4OjZkqK1Da8LUX4lvSG8DQFFZW2+qFvbvoqsrIJs4hF6RW4F34jSJBtrQvHNyrVqr\\/AH6j3SscseORbeVtUJd5SUiU10j57fk6FytMcGObPBoDQ7GPDKiBDoSV\\/j\\/s3c2\\/1Lk45Y8cmjKtucs8uiLe45uhUXm5rHBjmy8HnG7vMuR\\/tCJW\\/nRWiyBAA2zyx44NuXRjlnl0RR3HJCq1C2obYdifVPqgSjgWp9WFyYO\\/U54V4GjJTPqiDvlFiVro7k63F0eDh1bB0i2qn0B\\/UANnUrReTjrS3KN3uhuOvi6PBwlNSwqJZpKs\\/MakqNf586AuBU8GTjrXme7N6wo2aqqa2cKhdAkbIAsnk0LhtmwW5PAgVkLgVKnRABl3yoxb3gLxLyk5nme8Syo\\/HQvatHBjm0ooA2jaKJWFLzeE0KlQgKlBFvdwF7YonOnlnlLt30NVuogqWi0rNPORTchtIu5UpKSkqKE+CFGCtyAsqwg8ymBcMUKpaWnLDb0NnYPM43rIiQWxWwU4lifrC3iXAS4m8FAoqVDbQAcaPgwN\\/R7mL4Jx0AXifREvE8rlLiSgMbxFl4LhtzKaA6V288vTXF6guCQbca0uJpvC6ArqMBv0qWVBatNK\\/PTfhoMOAgVqNN4sT040LuspkqVKOgaa9TdAK0ZHKWd9XqbVtFcwKAHGa\\/Dq\\/KbqDZftOfwhaLgDcB5g3Eu\\/wlBRETn8NEcopxDZ7C5cv3Ycoa7lzebypUqVKlSpUr8AqV\\/K3\\/\\/EACQRAQACAQMFAQADAQAAAAAAAAEAETEQICEwQEFQUWFgcYCB\\/9oACAECAQE\\/EP8AUonifnPx179p+0\\/bZD+Mo8e7FwQXMD5YHAfEoOup4jJ+GIREz7HAEVniDzzDEO5YtH5ijPqwXgjs8T9aY1OdUhwdhTfSQxZ6dCgnmig4PSixE9GCtE8sgFHaDZfaZlOPQ874hNHTpUWipVdckLtJUL1xmNFoxMz7riUtBcXl5RUKSovzMFTEeQfZ9VxGrQRWOvz518h3\\/m6tvdxUZpC8qrieR9ireLuBRWkIEhmXCniciUUZJdG\\/MBBSXuRBYIUA9n5O8BWiDzc9iE2HZsx1BT3QXwQDbncdIUr0Qs7qhbPakrwR+s\\/eET6JhHuhT3HLODYlLStqgWx+k\\/SCqN5ZzOa1sqMZ5gBZ0UGnWLvn0cFaIZDc8mtf6dHY5mKrbMytz80RWQxZvVFxb0FtdXHt7W3StnQLaJUEdgXRVbdeGU8ui\\/iWfJZ42IrIIlmy7xp4Nai9o30Me3pzo8L91v8Aw3c91qHYoMRaLi23oFtSqx6PUdV686QidC8\\/vP7yv2f3i4ozoNcwbL2cFa+bpuq57bM6J0v5hwbnyGgXA8wA6DEuUOivUyxegXBRXVWjtxXQeJwvzX\\/ux2GmcHV84SgvQLa0VsFFsA8Q06DjTz1oK1ubiDjWlZfSfjtzQ6F+615pk0x65YQxpjLb2imkOfMYvGyydeY1qVMNcXRWjuMHQvo8a1\\/ppk0x6nnorNEJyRW7BqW1w0OXSrVdow1xdBit7jBHkVjddQttugFplRQz9ICpogKy\\/wA6YnRcdF1w0NaLtSDM\\/aAnGoAQbxvs7l2N+To4tLg0fNbqyjG1cwW1KrTJ6wFSzg7p8JvydHFFogiWTnDDBpuDZszmW2tEW55WuT1jxHd0V+7wFO6oCUNCIGBt6kKYiplcG9UDzLOSNCtUEslr8mOhVQjjVRcCiiKGZWWM8R3lAwp5OgHN3syaY9pGmO6YIgPMpLluIv2II\\/EW5egAUaKBbKfIBxtw1xSrg2V3vG\\/Opeln6RC715KvUBTFthEzLlpaWy4C4nmiwqK+GIJZoKckxGLUfppAMrKw4R59D\\/19j1PHo4KgRxKkqRGUu5j+o186Gyiqi4iY2bixb1Iq5lSpaT6aLivR8dT9J44ESzoKGY\\/eC+Z42o1Bvklrg5WAFaFPEtlGIvZZ0alXDBLlkr0dTbcoFsTEKXneNQb2sWGyza7yGVaXM6vfjTZCsNt6jG52XUPuXqxSEuNIq7nZUp0KNh6N8tHTjPvVuW00imhV6DtWot+luXDSQFulx4SpW3x2njZfF6PoTQi6oDwmK5iccRTlly2Ft3jtCJXp7l7qlbB4va47U54iV7YLjnth+zliCmvaYO4uvYBVEEpgsMc4lEPP8ItUAFmg5x\\/hStkdxwgsIw6tMplMplPusSxbhutP1Ki4p80WlpaWlpaWjTj3d6hc4YlvVuvfXxUvqX\\/Bbly5cv8AwZ\\/\\/xAAsEAEAAQMCBQMFAQEBAQEAAAABEQAhMUFREGFxgZEgobEwQMHR8FDx4YBg\\/9oACAEBAAE\\/EP8A6khSG6xUvYP7lrJ3+uqsT1kp\\/OD1SvagrgyuocERq+CpHyFX3tfwU\\/oOchr+cr3Khhl0jfE1zIESe3+yoErAVJgTJC8jU0aAT8yH2qcNsV7QPmpCAdB\\/apW0cjHxCp8Pdfl9CGr7jRnER6WoQlrA1Ex5heIWKGnOEVurBosG7MPYfmodF0WPMiuh5mHWMf6MWBEgAvQy9qgmOIT92\\/tUodw+\\/wBntTLAurfwHoC3AWwLE5bfXeIvCAmCDJO\\/ERdEJCd6iDujF7v5VuJhfeXPLU0nEpgequeP8vBCgw7tRrK05XUS9ipFRpS\\/jZKbpEpK93jcsSAEnMs9uI5sVxQSQN6fUgFAGYcNGOCJNHITePoHTn7qHBoI+i4YpRCPJp0cbSwDln5muhXpHmx2X5f467T6d+QMr0ptmYjl6n7+KhRGULBKaDofSeI2JgSXJG4bW9z6j9R1gLYX\\/NmTpUBYp8sH5Lf4YqikAFEM1o\\/wOr4rJyxi9ORy+moaoJWUyzpFvNPrUgAsqFgFK2nLpShqhndps659AIDYQyJW8Zb5b8X1XEZr8bojmjlj1rgKYBKXUiMFOf8AweWP8FoSG1l19OmakuJ0HQ\\/LP0z5SACEm0SExVwPRjQGipvpegunz2GRANzDRCxXeoWKQ5zpQrGRUMwKhEktOaQsw7RGEqKQmBfl4gY0qMjFUCy2LAsS0C9oQlC3UJbvQcR0UhcWvfHelJuXDmABrlzPamxxqSaCribc6CYu8ZnCOkU2\\/HAGJTEDE25UvhKojE4GF4louxwAbQcWrCaSvGYqI2pJmFNJN\\/pRE45kutDojim9IbvsX5adMCJIyOv3p4GlEAbtOLXQZeW3+G9O2RKrKv01w1IASctmc6Nt6MrUmiGNnOLVn0PIiFHQwxVoMgKaEYJv80\\/U\\/PqaRZVwHOgAHQ0jJl0b0y5BQKWVgsUk0gFxycTRkZoxOQRqEXtVxsc1NcG5RUYXomAC1EPsmkTHNN9aSwhZksi9jejVGBAVucoLLYxFLDJrAN2iaSXjGMdQjEjW1JUXIkgDDzOAEkBbsYqJ2ohiG8fVRaLMkEKTuSeTiyXTdfc\\/Hjb7xAFlYBS2IiMc3k2PPL6+GSoYRXCMYnfv9d9E05AqNmBqOtQdrhjZgaHrIkt0gRJxyiPepYibbcQbkSIwjQCGwBr+78j90\\/Yi0AMq0i2BJR\\/AepFYUJImCWYLLLGnP05rmvCOUemXhUEeRLnellXfan1rJo0AERGTTPoe\\/GrImNXd5+h9QiAwZYsfTcyLDpJnsw9qEQRkcJ9yuL0jD8Hu9OCYiKzSEtEEW11c6fXDVkAN8liDPW1uEKwXaJrcSwjkZfFCDqQ48sz4pu5CME26JvQpUUtrUNRt1nj3UQo9PjH6ptG21+7LHePoPozEkXXbkJfrbgEoURbIxJyl8\\/UaWAXWbTzJ3+4cpAAjfE9Tg77cS6CxzqD+shJBbOzbt6XjBh1TAUEX5YD3Gv6P81cdKTB0n1hRdLQNb6vL4opI5KUeTHZfm1BSFzx4o+FOQpVoObSImVzxYC2fhqjYM9jWpa5eK5zPw8NaXvHA3HCepq1iSYEj1rKILBAcihbyqQgxMLOlfxf5r+L\\/ADVxUQIAySekEjWwxCSY1vcyeo7cbsvc86VesD6j8H24dr+yAmp3ByeP4D1Ke8oJI0RycbkYXyyX4+Rxzb4WxY+Zex6kCQw7fwpagCWGCOe9J00MQDoafFLcQyQa0qst\\/QFc6hABrTSEYUvo93LsaUjKhpVNj5kX4ousIuqPyael4ThgAdTsAtEVLBoCA4SoLXdbH7dBp0SlTKuv1H0Nnj9\\/26wHjHS2d0n6J8CwAurpQ6C8jUv+nQOAyXXaAlaloFFOgOwBSZPtiSclGPHolQhgeM5uD\\/yjbEKsBUobrgpFyG0aVLqK4vYDXZt0paa88DraPeguwXSzFM17+9Cm4neZS6jkOHMYEnKKFvDgKMlQMBgX03o4SnVI89ucnNMBMAjsSbxh5ZOAKwXajhTJhJJI8uGdOU5o\\/NB2eN38rDkrHb5PQOkkCYlWChdxQAHqW+g+jm8\\/r+2RIASroUyFXBdDb2B6Lqdt0mGzp6YGSQ5LKx+XtxsQtg3M3lg7PpBUAldKGHCNZLHYW6zUj0LBSFJX6PWF+CEMlYlfEZcnRt35cRRkYSoQVySQQSvIqHQR5rHigpgx5xl6rL34ZPHHdod2DvS3mjwuUIkssHI3x6VVlu8XRCGjJlix339LSiyo8r9sby8xa\\/J2+lucmLmA7EHWeCiIAEq6UjQxLawebvf0wESm4dDyPemckTWD2DgjKspAVPjkySPlU\\/Hmx\\/Iontz8BpPuh+BScDqL88MwcroD80BO+N\\/wn5qOQEkEHtr24GJCPkIa8nLUMTxau5hdMou7KOKG83C6Y+Z8fTNDjVYJc5TPallmI4KiYP8AZs+2OYIfpHycCYRFmiRjyHr3NzlkG3cx2niVQjUIDlLi1u56jeL5ciX3HirGZiFAZ8taAatNG0C9HPR28tc8wleX1wxMWrTTCBlUI0LsSETXYdfka5ENCZQmjZd\\/N+KNTjZSwFRkNgat15ngLFoNAS1IzOHYdgg7fTaJUYxncWsY4GcwYGjddgaNUQDAFg+2WQtGdZ9YWZzUByqHEmhyq86yQuafi\\/FkHELZR9x9goBZiBLGFpaHDAsqKuJCSeIrS\\/lw+BXSJNXq8FhFvJboc+C5DgcC0vsUk4AosuZNqbrNJCeZy9Fm5kJCpDTbCK1EvRydKllczcy0fHvwATbLtJ7nvwKAvCPkfLwITnQu7CDNXVwuFl\\/gS+ONndbLcb8seGm4TiVMGo78alRgG53MObQAbeMpvGS+bR3fovEBxpgN+5Pbn9uzmh8Qfj6CKTcTS4+cd6BmBAGA4DCQ+CexL2pVZWV9DTjNZRgNC2ZOXBDFitVBdVOxNCI03F3eBGZEAlxYF1PzVoBAWBGy5UEUoUiIxjFvQ\\/aQoqwzj+d6kRlBLhnlDvtRBgFeSzHC7+2HgiBza4AKgErgooDXM1jsQduCJAEqtgogpsLpYPOerXu3H9z+D6IeWN6ee7gongTrAQH26WX+3iqEEkkk9Nh94kXG\\/LL2ON704g2X+BB59bTgAGZPlRIxIkPisowOqT8cLAESJPOOcUtqZDD0QQ65vTRQNRh6E9rkNKlKhEICdDHam7wj2zeOEAZumdUHy4Y7TOWUfeb9B43+SwtzX8WosG\\/MxFhYne1ude7cf3P4PQ0CMzkFjOfj0HyPmk1aOcniORg86\\/cM1r7gP5q0F65fwayY4KqBJEwGA5eibAQ7gXYFoWJItAQHBVSHMiseaQB9wSllc1\\/wj9046NRJY9nhkss0ksUgvCggAlc8BWsW5UUbM7VFBAOZC\\/s+ido4\\/wB58Uc5Ghl431CeAWF4d0Et7F+q8ZkxACAZy1Z7BX\\/MP3SMDkEMqPZ4xdPrQtMskeGoy0a0kk9k9KMItkinLKgEq7UBmbJXk06tXtvP3Cw8BHh9gBP5e\\/gM9B8cvaz2oSG1RiWZPpA1mvKXgqQmlAEkTBtQCkEhUnPadaWCllniqxdjmsvxSMyWR\\/gWDvTbHXaqyvD+rt+j7X04GAhAKBAQFA1BJsN3+R1+6Qoso85PsIT+Xvo0xGSxKsF2jHPmAE5lFK5JW+LsYehvQpT8lHnHelJhHCOR29DHqpKEBMd4ofbQGmEI9qtKNEWBs+se5UnFHIQcpoIQtlq5fx0KkPmUc6OwZeby4\\/1dv0fa+jRNjNHLQQuGx8NOuPup6RNOa75HtS4IyEs9PURlUAFxGzyfV5pppozFYgLMLHI4HUViSCFrU++kwJEh4ZzTF3oXCZXJrA9Suo5h\\/wC0n21O46l8nep0ScZjrWKQxaY0qRGxhJUwsulT5xMRNhb6ScSZiQWVajhhwBcDoc93+ZorBLx3mxpu9GiLidLdC5vdbdXiVuE1IAg9MGCCD\\/7AasNOS8UcAJSHWrPVkBgAscgq7TqIkea1OCHklShdzq3im4CwLl0cNQF0sT4D4O+33mQ3DtJE9qS4JW5jc88XLkQohPSG3Nj7Rahp9NpxoyQyx+E0f+UbwIsH2H5w0Yq+AXOZo8zxTrCGnPzkx3oFY9MUtxV4IzF70TIkCzBSEXO11JyFycI5ZP8AXq+QkX36jpVtUyFt8U5Zfek8HKfBsG3BHSYDQ5uxRZgi6VdiX4rb283BuOGn0e7cf3P4KHMgHtIyvJ7\\/ACIABA4DYOAU5WQSNQ35IoPKPvHiGMTEbHzDxJhaUSr1+i35kFJKdHnX\\/GqBBlMwSLTxSQIzCx3mI49NjgmyYTk0F6wjXra+46VgYmCdEtUl9ynT1g0svJyT3KvaX82pweREHsFMiJwfcN6FN2MnQZe1IGjYd\\/wdW\\/IodM0tlTqu9Ci7i5UVb9c47N6mBR32p2Pzw0+VOOY6PSpQLbo7XJzqfzale1QgruHhZqQWzfviasAtYBEjJEbV\\/wAyr\\/mVFuhngoLTUcYDyDj3hPCfltTejDWfb7tNMRl0D3D3D0IvBAIbLNxtMT+PplXREdRMfL5rLVYAtzc\\/\\/W1AFcsmkUCYQ4AdQdOlT2e4s9HDUQOC7UwmCxU7uzKHUYe9EQaSdu8D2oa57i+yKt2k51ASAm59j8qEWXSJ9xO0UuWmVKd2oAiZJDUao9XfxmiJEZaDkUDgXB1\\/qsWlE7urxEhAUCR1SbfugBnsp670pwoajFWNuokoWYXgI9RtUVhXW+KcvbpSSBgoR2aIFAQ7sPgaiRJLO3FB8qCZScHBuj3+7Ohy7LtCRHRArMTEsdqX7SS\\/NPIUmYl6D8+ae80NCvSKNHFe4IOd57PHlu5V7VDiOY+TToMZYR4mhmdWR45z487ViOGeAAbatneiYjmSCjQBST\\/DNeEsvhFAUCWCfuiLCAWMR0rn+f8AVJZMsdTramGhcxU0BCAQnrO1QTc3T2YpzOICAyeyeOAKgErgKKRImSw2Ofo5VIeuX58KgXtxnSW41c4uJNetQa5QMenU08bVYZABiCTBbUpmXe5hwRrtSnLHJA0UwjnanaggrX3OtTgxqUXI0RCZGPuo1Tr+lKrKy07HLhi5UAZFCcsXmfE7epVLQKVadD54vmdXt1pOYbCCehwlYTUUMAsC48rPXl6GBIBrt1KJjKUFnwVRlY6tvzRjYA8cJPh2Mt1ipCHWHLIQjXfnwDnBv2exoppxFy0aEIWMn\\/ulll9EDWZeyD2Crow+rRylsPxDMdChYyCiQZjn\\/ZokQh1\\/Wj0MDXUosTc8CurANnbg0BYx9y5lu5bcZ+MFuJJT0zSKvkwh2aPj0AoAlcBRQzOTo2\\/mpA2Cwa1K22gwcMlIBwCPRpl5MryMPuehAN8jU4nMNzpvU364IYmfxxycjSEmY2O2auUY2oWGeLJuadqWwFJVDhGJHYqQMdf2FKpXL6VI\\/u7hBlh78ByZg3egLtCSxYFQ96AAQkRs0VpebCz5ZnlNAQACAMHBkinndWDuK2aKuPM4GgHdCgRwH3AIsBNOuZZ4Rzn1eAGQeaKRbh6KpKomuYE42o1Zv9l4YriwRm89uBOEZDh0Pl7UdJgJWkTsLDY4uI7vCHo\\/ufk\\/PqKDVMJh3NqVVjYZPehvmA\\/dA5CDQDyHzJ8FHAeQH\\/PUIgGq75eCjrfVkcle6PseAwyVCR5UgpkNAMFSkmQKZdhq1B3mzJHTYocIBmNX7+aNEUiYmaUQY50kRQJy4f0pCQDvlp1KJZF\\/1TLbYOWdX\\/2rRAFNUz7r4owwgjYEt22CoZiL0kSgbtEaXJPIEe61FGrFRO4VGC8yudTJxmGzhI\\/WQMrkz6rwbTfd+UegoSMA6l6h70GoIWgVYzY5H+C1tfUpEYSGotIKVsbVGLJB3aNBNHQcHihqbR1J0Yw70anre8un7RRA05Pwg8zR4AafGlIkbZHWh4hwEt7lEkOL7+5zp6gAJLaw0BXBJKJlSUXLwuRvL\\/PN9ZBEcNM609LWYA7Q47Nx5NHEykfJZXMeMcKqSXJzRxzN39Kx\\/g5pKCXSSl6JYggo8MogVL6CJvNYM0YwndpXAO1YMNg4BUOoJEclLyAbhvL0GOtWhgIKfYDBxG9KdEvdnb68A3W9XPltIe013rBrcfDs8uEiMqBzoE3crd\\/ygmEazekRRITgAlYKgEx1qVFGQ3QmL0jKnjf+lRu0O7BV1YlN2+Rjt9eQ5X9dw8oJ6xo8ygKUrw9MyVcCkEDkBidP8wHuO9SzjbSErtwYZ0DiEta8WaSxG5l9gkib0kMesJoDmDaKNWgCAGA\\/zcqRgZKlCbB\\/O1OFDeYGnfFZRsgVZbadqPGoX\\/yvs1NBtMXfEUzAWDQGv8ddqAIGAfLz+xMFz9R0SkBQa45W7\\/noBAI5Go8U2sJgNF735XK037o\\/+nPggSSciyj3inQCQEA6FKj0+2AKAJXAUURavybf6UDm5PPC5Uto3lAHx2X5U3DFwkBRKJiMiCUYTuD9T2c0r3rP3VkP7udf8PQ\\/6lKlXT91PwjyPhxBQAq4CjAEvB\\/M\\/wCra60eGB8NqUOZrUGXxXwXpUD+RDy1NAjQPvLVPhHcgeSa1yNZU7SfFag2kg8\\/lW7zIU\\/NZTWsUfFfygOTWNfqv5oxu+Lw2t+CjijOQfmjJDXXke81Mlciyvz7f0HHr4o0i39Dp\\/sRRDnTbtyNysu03u4RceyZf8UBvc7cW\\/Ed6jJsxA+TegAgIPpOW50KUnAE1vICWOiOjUBAAlZXq6v+5h5d9aaJRGLuRrOlfHFrFjt9EFYCawSDeyhstdA81COk5f8A8FlV1K2R0UpXCe9OlR\\/xq3qAcr71oh6s0PAdB\\/8ABX\\/\\/2Q==\",\"size\":24175,\"type\":\"image\\/jpeg\",\"originalName\":\"not-found.jpg\",\"hash\":\"\"}]');
INSERT INTO `testimonials` (`id`, `name`, `title`, `comment`, `status`, `sort_order`, `created_at`, `updated_at`, `image`) VALUES
(10, 'Test', 'dddd', 'TestTest', 1, 0, '2025-08-31 22:57:42', '2025-08-31 22:57:42', '[{\"storage\":\"base64\",\"name\":\"not-found-e23967ce-cef0-467d-9310-15891ce14e28.jpg\",\"url\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQEBLAEsAAD\\/4QEQRXhpZgAASUkqAAgAAAADAA4BAgDGAAAAMgAAABoBBQABAAAA+AAAABsBBQABAAAAAAEAAAAAAABXZWJzaXRlIHBhZ2Ugbm90IGZvdW5kIGVycm9yIDQwNC4gT29wcyB3b3JyaWVkIHJvYm90IGNoYXJhY3RlciBwZWVraW5nIG91dCBvZiBvdXRlciBzcGFjZS4gU2l0ZSBjcmFzaCBvbiB0ZWNobmljYWwgd29yayB3ZWIgZGVzaWduIHRlbXBsYXRlIHdpdGggY2hhdGJvdCBtYXNjb3QuIENhcnRvb24gb25saW5lIGJvdCBhc3Npc3RhbmNlIGZhaWx1cmUsAQAAAQAAACwBAAABAAAA\\/+EGOGh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyI+Cgk8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgoJCTxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6SXB0YzR4bXBDb3JlPSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wQ29yZS8xLjAveG1sbnMvIiAgIHhtbG5zOkdldHR5SW1hZ2VzR0lGVD0iaHR0cDovL3htcC5nZXR0eWltYWdlcy5jb20vZ2lmdC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBsdXM9Imh0dHA6Ly9ucy51c2VwbHVzLm9yZy9sZGYveG1wLzEuMC8iICB4bWxuczppcHRjRXh0PSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wRXh0LzIwMDgtMDItMjkvIiB4bWxuczp4bXBSaWdodHM9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9yaWdodHMvIiBwaG90b3Nob3A6Q3JlZGl0PSJHZXR0eSBJbWFnZXMiIEdldHR5SW1hZ2VzR0lGVDpBc3NldElEPSIxNDA0MDU5NzA2IiB4bXBSaWdodHM6V2ViU3RhdGVtZW50PSJodHRwczovL3d3dy5pc3RvY2twaG90by5jb20vbGVnYWwvbGljZW5zZS1hZ3JlZW1lbnQ\\/dXRtX21lZGl1bT1vcmdhbmljJmFtcDt1dG1fc291cmNlPWdvb2dsZSZhbXA7dXRtX2NhbXBhaWduPWlwdGN1cmwiIHBsdXM6RGF0YU1pbmluZz0iaHR0cDovL25zLnVzZXBsdXMub3JnL2xkZi92b2NhYi9ETUktUFJPSElCSVRFRC1FWENFUFRTRUFSQ0hFTkdJTkVJTkRFWElORyIgPgo8ZGM6Y3JlYXRvcj48cmRmOlNlcT48cmRmOmxpPmF6YXR2YWxlZXY8L3JkZjpsaT48L3JkZjpTZXE+PC9kYzpjcmVhdG9yPjxkYzpkZXNjcmlwdGlvbj48cmRmOkFsdD48cmRmOmxpIHhtbDpsYW5nPSJ4LWRlZmF1bHQiPldlYnNpdGUgcGFnZSBub3QgZm91bmQgZXJyb3IgNDA0LiBPb3BzIHdvcnJpZWQgcm9ib3QgY2hhcmFjdGVyIHBlZWtpbmcgb3V0IG9mIG91dGVyIHNwYWNlLiBTaXRlIGNyYXNoIG9uIHRlY2huaWNhbCB3b3JrIHdlYiBkZXNpZ24gdGVtcGxhdGUgd2l0aCBjaGF0Ym90IG1hc2NvdC4gQ2FydG9vbiBvbmxpbmUgYm90IGFzc2lzdGFuY2UgZmFpbHVyZTwvcmRmOmxpPjwvcmRmOkFsdD48L2RjOmRlc2NyaXB0aW9uPgo8cGx1czpMaWNlbnNvcj48cmRmOlNlcT48cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz48cGx1czpMaWNlbnNvclVSTD5odHRwczovL3d3dy5pc3RvY2twaG90by5jb20vcGhvdG8vbGljZW5zZS1nbTE0MDQwNTk3MDYtP3V0bV9tZWRpdW09b3JnYW5pYyZhbXA7dXRtX3NvdXJjZT1nb29nbGUmYW1wO3V0bV9jYW1wYWlnbj1pcHRjdXJsPC9wbHVzOkxpY2Vuc29yVVJMPjwvcmRmOmxpPjwvcmRmOlNlcT48L3BsdXM6TGljZW5zb3I+CgkJPC9yZGY6RGVzY3JpcHRpb24+Cgk8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSJ3Ij8+Cv\\/tAQhQaG90b3Nob3AgMy4wADhCSU0EBAAAAAAA6xwCUAAKYXphdHZhbGVldhwCeADGV2Vic2l0ZSBwYWdlIG5vdCBmb3VuZCBlcnJvciA0MDQuIE9vcHMgd29ycmllZCByb2JvdCBjaGFyYWN0ZXIgcGVla2luZyBvdXQgb2Ygb3V0ZXIgc3BhY2UuIFNpdGUgY3Jhc2ggb24gdGVjaG5pY2FsIHdvcmsgd2ViIGRlc2lnbiB0ZW1wbGF0ZSB3aXRoIGNoYXRib3QgbWFzY290LiBDYXJ0b29uIG9ubGluZSBib3QgYXNzaXN0YW5jZSBmYWlsdXJlHAJuAAxHZXR0eSBJbWFnZXMA\\/9sAQwAKBwcIBwYKCAgICwoKCw4YEA4NDQ4dFRYRGCMfJSQiHyIhJis3LyYpNCkhIjBBMTQ5Oz4+PiUuRElDPEg3PT47\\/9sAQwEKCwsODQ4cEBAcOygiKDs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7\\/8IAEQgBmAJkAwERAAIRAQMRAf\\/EABsAAQABBQEAAAAAAAAAAAAAAAAFAQIDBAYH\\/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAAezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQ17NesCYaxpZVBFxeuWM5sy7UtwAAAAAAAAAAAAAAAAAAAAAAAAAAAKGnZGbzG6mhqaNmpqWQAAgVLQqAKm3myEsjmykstm51AAAAAAAAAAAAAAAAAAAAAAAGvZC7zC9Mw+869IFS0CAAECgCoAArFChWJWans3oMa21AAAAAAAAAAAAAAAAAAAAFhA9Mc71xD7zRRUoIzRgoBAAqUgUAVAzRhoIFBBRUnM3rMblpQAAAAAAAAAAAAAAAAABr2cx1xz\\/XGlqIBQAgUALotAAgUAVAACBQQUBAnM3tcb3lAAAAAAAAAAAAAAAAGNOV7Y5btjFYAgFACKloAgAXS3mJKAultAAEChdFqgIAvjts76bOgAAAAAAAAAAAAAABD7zw\\/o5aeoAAgFAnuerTSs2ZcaRm5Mc9a9m1LFak1jWlZq2b+br0I2wAVigKCCgIGaMFI6vOu0zuoAAAAAAAAAAAAAKHId+fKdudAAAIBRUkcWwkM3cl1657pic56wGUh9SXzaxaXmCtY0LKgoBAoIKAgCsWg7DOuwzsAAAAAAAAAAAACw4T08YLpkUAAAgFACBtS6lgQAAgUAVAACLisYwoCBUoUgVPRsdJmUAAAAAAAAAAAC04D08YXpkCgLi0ARcWqAM0YSgAgAVKQKFxaqAAEChWKKAgCggCSl9Nx0qAAAAAAAAAAADifRy5rripQFAAAIBQBWKAlcamcakM0YTQ1mD3nRsFAFQAAipaViigIAoIAR6VnpLSgAAAAAAAAAAQPTHBenkBmjDVAC+JnGrTERW8lACN\\/N7Pj0lMaGMw0BgI\\/WOQ6417AVAArEnm5lERZjAEXFpQQBWOwzvr5oAAAAAAAAAAY08y9nHVsAAqWg6Xlvt\\/P1HJ9ufH9uZQBM89dxw6XS2GOgBQ0jME4bvy0rCoAGxL6nw63mjZ5f15UUBAFBACOlmu7zsAAAAAAAAAAct258b6OaAAKAqem+TvvZth5f6+GCy1QJDN9B83XLLrEbZr0KlC8lZdcFLOA7crC0F5Ydjz31vPY4fpz5jWSipkjECggBHSzXd52AAAAAAAAABQ8x9nDT1ECpQFAT3PffebqOc644bvyBQPQvN1lMa1ilAAADAWlSI3jkOuEC8rHqfDrnXXTy7tywhQEAVi0AR2Gd9hNAAAAAAAAAARe8+ceviEAAUB6P5e0rjVDzT1cI\\/UBRLYvf+bthLKoaiatYLMNWFEqt0SObtLkTzzvywgHU89drz6DkN44\\/phBQEAUEZjCI9Hz0mZQAAAAAAAAAOS78+R786xQAAoS2NejeXsIbefPPVxQCjruHTp+W9Gua3iM1LaAAAoI6nnvfl5brzgtZFT1Hh13JbDyzty1rEFAQBQRcWm1L6pjpcAAAAAAAAAAcD6eMF1yEAAVO+83Wc57Hnfp4ymNSGbrWcZ3wO883WWxrjOuI3UysSevNFZ9VjQE3rxZLmJx6tSdd\\/N6nG4PeOW6YuJ\\/Gu95dBzO88\\/rPS40ON3jVq0QBQQB22N9VNAAAAAAAAAADzf18IzcCAAN7N9M8nepG6z5r6+Ponl7TGNaGp5p6uNp6D5uu7jXn3fmJ3Xhi56pO+WDz7gJ3XhtXQnfRz22peu57ht45PpgemcOslLQ8x7cpbN7nn0HmXXnG2BAFBAkJfTcdLwAAAAAAAAAAeZ+vhobgQAB2\\/n69Jy2OE9HLnuuPRPL2mMa0NTzL1cR3Xn6ynPXAdudtbl4yevNFZ9WrOoF7OW51c9BuZvWY3A9McxvEzm+i8eog9Z8+68+kxruefQeZdecbYEXFpQReel46SUoAAAAAAAAAAHmvr4amphqsUANiX1Dx97zDZ576eVh2\\/n6Smdadnn\\/p5R+p1PHfScenG9caOoAAAKFIEjnXUY1yPXlD6nonHpNZ0OJ6YidZnsa67GxwXTnBamIQAEd9jfQzQAAAAAAAAAAA8+9XGF6ZCABMY16H5ewAAA17PK\\/Xx383vfN257WYHpkAXJN68WnO0dPRbAEzjU9m+fd+Vh6t5+uwoAAA846c4fUQBmjs876bOgAAAAAAAAAAAOM9HLl+2AgATGNeh+XsAAANezy318bo7Lh02sa4ztgASevNgm5G+eAx7gEdfz3D9Mc30yj1bz9dhQAAB5x05w+ogDtsb6nOgAAAAAAAAAAABA9McH6uVBAAzxJ40AB2HDpI51qWcP6OcNvI2I73zdoOyC6ZqDbvHfvCqQWPcKS9JjWzZxPbnYImc26UATeb1GNjiN457Wbjdl0LOoxrsM7AAAAAAAAAAAAAw2eW+zhZSAAKGeXBYB6J5e0xjWhqeZeriAN3N7fz9Y4gN51rBlubZcUu7nXQ5ta4rtyxWZZZ3GoTWcFAI6XGu559B5l157svUY3QzGzGwXAAAAAAAAAAAAAHAenjB9coqUAKAAE3z1tZuGoDpkZow0jKdVw6zeNaKR5jrJG+Zzn+mOf3kuZOq5dJHOrE5TriKud6Wq3SSUog7O859QMpkLo3C4AAAAAAAAAAAAEPvPnnr4oFSgKAAAQLl6fjvpuPTku\\/OB6YtloZEl+e9qMuNYV0emIreUbRuY3JRM42BaUNsyQOZ3jld4lc77HG7QVM5UyxtgAAAAAAAAAAAAsOX64ul0N557tztBQFxaC+XbzbEnee+p49MVWJDbzEU1nBVgS3nvTzZXpncL5dgG7jWzKBhMxUFTYjnd5j7JPG5IoZSpmKkhAAAAAAAAAAAAGua9YjGCH68+V78xQAujqePXoeW9coWm2AYUhd5rWKMlVIWWOyndTerDGYkc6yygDXMhlAAOQ3z7LHTbjSNWtkobcbwAAAAAAAAAAAMBrUMBaCicH6+OKygKnaebtP89aVWFphNwyAFpH6zF2ZgRCxsSZKWZ5ZLNqtAAaxcZi4wmrUhGrZ0ObU1jRMdbkbpcAAAAAAAAAAAUNGqGMxFSwxnMejlFdMVLSV577\\/AM3XSqwFphM5sgAFhq2YE0jTWUJOMy2GEAA1S8GQ4zU2I66WWi8AAAAAAAAAAAAAAFCNq0sMZaZYhqhPTx19Zw1U6jh13+W8xlBjMZeboAAAAABYYQADVLwDmbOzl3IzgAAAAAAAAAAAAAAA1DRq0tJWNgjdTju\\/LoeW5XGr5dSuVsjq7jNGAoXG8AAAAAADXKAAwmMvBlN6NwqAAAAAAAAAAAAAAAChhNc2TMAWmAsLS2qHFanW5uItBcbwAAAAAAMRjAANFMq3GYloyAAAAAAAAAAAAAAAAAAAAGE1aAtMBhKAsNs2AAAAAAAWmAAAGimCpmJWUAAAAAAAAAAAAAAAAAAAADEadYChYYwVNayYlAAAAAAAGsAAAZSSi4AAAAAAAAAAAAAAAAAAAAAGMjzXs4708pblvbzqyJuXIAAAAAAADXKAAFSUjIAAAAAAAAAAAAAAAAAAAAAAChC7zwXp5Y7N\\/Gu\\/8vahSgAAAAAABgLQACRjYAAAAAAAAAAAAAAAAAAAAAAAANWzke\\/OC3n0vyd7THQAAAAFhjLSgMZcXgG\\/G0AAAAAAAAAAAAAAAAAAAAAAAAADSsyS0MNAC00016AAvMkXlShgMAqTzZAzgAAAAAAAAAAAAAAAAAAAAAAAAAAFpiMJZWqaVm9LsgAAAAwFDLEgXgAAAAAAAAAAAAAAAAAAAAAAAAAAAAFppl5YW0AAABfFxsF4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABaWlpQAqXF5UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\/\\/8QAMBAAAQQBAgQGAgEEAwEAAAAAAgABAwQFEBESExQgFSEwMTRAIlA1IyQyMyVBgGD\\/2gAIAQEAAQUC\\/wDUpWIRT5CoyfK02T5iovG6y8crrxyBeOQLxyuvGqqbL03TZKm6G3XJMTF+6kuV4keZrCjzhI8vbJFdtGnIi9Db8e1ndkNyyCDL3BQZ11Hl6hqOaOX9jJPFC0uagBS5myaksTS9jNxP9Hd9Wd2eLJ24VDnAdQ2YbDfqiMQGfMQRqbK2pU7u76O3C+kQiZd7+b97kDxegzuz18vYhVbJV7P6eWaOAbGaXFNck9Tby+vVys9dVrcNof0RmMY2sypJDlL0vLbv\\/wAnljeKTV339Hf8e4DKM6GWGb9DcyMVVWLUtovSq8TULUTEMtXhAsfwqOlxg7OLljtiiqccUNMNoBY57VdprnQvzhgcofDvOKrxQ5AWG92Ptv6MnK1xuU4fvezXstv6joLHLo1phG1NaF6+0TlHcB4CJyPqovEwOvLW6qKWeJ2GXqISsdVDDIZ1o6rWovEgkgkqXZRmt6P7+ps+2mJyH3CIQG\\/kSsv9A7M8gfSEuEzLjPufbtxtzq6\\/2XdhbIX3tH2vt2+W3ZFI8UnobeWrvv8AVoWeltfZyt7mEvLb1mbWHG2ZlHho2Q4uozdBSRYymSkwqnpz1\\/UZ9tN329PGzc+j9fKXOnh1lAQk7BFzNsTbZ\\/CbikxtmKPurU5LT1qMNdcK3Zk59hTuKsY2GwpoZID7383ixtqaPwi4vCLikB45Ox227nfdYE\\/L6xm0YWJysT9rPs+mGr8c2maseXbQoPZcIxYHcYhc9+132YW4nUscdqO1VOrL3V4XsTiLAKuT9NV939PBv\\/d\\/WzVjhD0Pd6cHTVkRMA2JnsTttvrSqvanABYXfZO+6JzrLrJjX\\/IGuRcddNbQ1ZSd\\/bSaELcMkZRSO22pCQEsJX2bTNWOObVm3eSMopO\\/Bt\\/d\\/WtTdRZ138uzE1+da0zNjl1+2lW6eu77M77+i\\/vpla\\/Mi1MykKMHlkhiaGJTytBCRcyTvbbtwIfWyMvJpejjq\\/T1NL1jqbXZjYedcFE+7p3ZkVqAU+RgZPlBT5Ql4nKvEpl4nKvEn3isRzaMzG0sbxS64SvxSaZux6cUnKk0xUXKofVzknkmd278bX6i3pk5+VW7cOG0BeQySDEE1+WR3dy9FncXqz8+NvfLhw3NGZyerA1aujJgCxM88\\/pPtpWhexYZmZvq5guK93u+74qvyaumUsc+3RxkFip4NVVnFV4q2mNHaiauz82ZRg8kjY8tyFxfWvE0IBPDMrMTQyqkfDZWYb8EzbrD1+bZ0zVjggxtWO3N4LVXgtVWohhtM+3o4Wrwx\\/WyL73++lX6m1pfsdNVWK\\/j1d+E22mP+HK+2tP\\/AENNLzMhxcGsfBNUhpEMtuQJZVW+Ssv8fShX6appdsdTawfytMh8\\/wBClVe3YEWEfrXvnd+Gr8uDTMWOZYWK\\/j1d+Fpiy3pH7u3CSgsnCuoqsc8zzHqJOBPPK+tT5SzBaYuvz7emWscmozbvg\\/laZD5+rNv2ABSHRqDTg+vkG2vi8fLTu79leF55xFgFSkQxFRuEXh9tY6M4qSti51HoWhZYeT8Xfd7gcFv06Lb2llJOO6sXX5FTTJQW7Nrw+2sRVngsaXKNiS3JGcR9vusZj+mH7GWHhv8Adiv5D0J\\/jqlNyLSyYefYIuT9FCKsVXjfsxo\\/kRtDGRORKD4\\/oZX+R7JJZJzxmN5P2s4H9XuxX8h6E\\/x2ZyKQCikx1nnwWoudX7KDvz7W\\/UDuWO183etDyYsrY1g+P6GV\\/kezGY3l\\/bzEfHS7oZjgk8Xtrxe2vF7a8Xtrxe2qExz1FZN4qxZW0Q6QTFXlhmCeO9Tdn1rEITzVuaR8Favp7vUqcpW7TVIv8y0HLWxHxe4vF7i8YuLxi4sXentT6W8naitTTHPLFXmmT46ypIJYlisd9yWNpYiZxfT27Xk3i1xX8ervwuyraOrJDPHYCxjwleSCaFcTac02AjIlxMoqk0ygqxwKzaCqMkhSmo4ylN8S\\/DLDJCXZg\\/laZD59Ck0jf9JvMRPZM+\\/3MtByrejvu\\/oV8pLWh8cnUuXmli05MnBpHKcJwZMCZnYmmqwyJ8bC68MBNjYGUdeKNGQRtYyi4n4iZRQHKqdcYWRgMg3KJQIRI3GhZJPj7LKvPNj5fHJ145OjMrVnhYB0HRn2TPu32snX59TVtvT3fajjN0TCzXMfsZAQJm3d33eOWSJxys4pssC8TjRZVSZKySIiItndwqSknq8AQvzW22bR0EYRiMmzcwXRRxyNbxKdnF8cG8z+erPtqD7P9pyZk+Mg5nQVVNi\\/J2cX7GbfUQI01Ow6KrOKxlLdOW2hCxiYcLtEEsr0RT0iZdJIS6OVSRlE277hWiNDViFMzBLpDA0PY\\/8Ak3tq0qyFTmhjj3LnlHJ\\/UXMXumfZbpvf7JHoWuSrscXaIuRVcUy5IRgn8kJbFrLG0oNA8DKXyjbyZTxuCcvOtFwMpfb3QR8HayHun\\/s71WISY4k47rzAvdlCPn9gy1f30cWKOQHik7MfS5Qu7CxE5aF7IH3DV2YmOu7KVbrdWOLid2VUSZ90MByKKEYQ7R\\/xTPpJKETDerk6Ok1qfQ491JG+0bEhhd0zbN9j30d9eIUcrLIN\\/WXlssfDzLDfiJFxPoXsovftIBNFVB09R1LSnNeESKHH8tDEAaF7do6sSsSvNNVpyWVDXGMRbhb73\\/Tvs7loR7Jgd0VZ5I4YjGS5JzJ4ojmNbOsWO0B3oRQSBK2haR\\/7fVL27X\\/GbXpCe4IsAxj+hlDQ32aMd0Ee2lyEpYYcZPKosVACGvGCIG2KMSG5QeFQSvDL2R\\/7\\/pyhxgBcY6Rt+QNxP+iKJnT1t3GMQ7NlxrjdOTvo7bsdV+t9md99YPOT1i7pBeMhJjFR+4Dwj+pMN+ziZH5FqZcAQA4Q+sXt3HA7E9rgVL+rH+rIN0X4p330P31D+4m+uAcbszM36whYmONwRE0YBcmCQMjG66uu6ZztuADGH0H9+1m3cB4R\\/X36ZzwHGcRKiwvbAG2fyf6Be\\/bHHwt+xnrxWBtYeSNRu8U8aP8Ay9NyFlzomXUwLqoF1MCeeHdjEuyOPh\\/az1IbLBHy2k7XdhYrtcF1\\/EubcNcu8S6SV14fG6bH110VZdJXXSwLpK6KpX3ejC6A5ITZnJwjYf3G26eNOLtpYm5IDSeRDXhD03909VpQEWBv3bszoqolNy3Wz+kwO6aBMLD\\/APBbMuAVy2XLZcpctly2XAP\\/AIL\\/AP\\/EACkRAAEDAwQCAgICAwAAAAAAAAEAAhEQEjEgMEBQAyEEURNgFIAiMpD\\/2gAIAQMBAT8B\\/tLKkK4K4K5XK5XK5XBXBSFPdyFcFeripPAlXFXK4dncrip5Uq7rS5XHoZU9QXrPSz0pd9dUD0JdCJnbGEVChRSFCihyopChHPCB55d9bs+kFNJpPuk0lTSfdDwweaXTwZ6ActxnshynHiWlWq0K0K0K1RyhyHGNq0q0q06wJQEbBbtQrSrTut5BM7LRV51ATtkSiI1ip3Rx3naAip0gTukTrbV26OOfey0VcdQEbzhxm8Z2NpogVJk6W51SpUqVKlTsNq7eHGfstHurtTKzuuzoHTuzstHqrj7Qb6VoRaKtxQ0e60Sv5Q+kCDjR5X3mxqd43s\\/zleJ97ZoKOq2rkArVbtjjuzsATUmBRuKHFW40fI\\/3HtfjbEQvixJ0PuZ5L49LyfIBbAXhY5rYNBR1RUptTsjkHOw0VcaNxQ4q3GjyeIPX4vMRlePxhg0EAiCvxs+qijqCpo2p2RyHZ1jRBUFNxQ4UGjKHcFHZoKmVBTRUjYA5Ls6252TQZodJIGV\\/IeZgLxeYO9HOkbpzqA5T9bc7Jq06vkxYvDFghH158anHcOdIHLdjYuKuKuKuKuKGKFXGoQMojR5gSyAvH5rBa5Nu8r7hpJjRcVcVcVcVcUDUmsUA6luKHGkGEDKhRWxsyg0DFIoTot1NqUB0Lh73A6Fertc\\/dYUKKlylGgFSKQVBWFcrujcPXADaFtAjS5XKaEmsbZbRvR2BWhFm1aVBTRqhQiFFYUbxCb0zhrDfvoMHpz60tEbccYjp350NHvehQo7lx96GY\\/SCg0q0f05uKvUj9KcJq3P6XEot\\/TiJ\\/wCAX\\/\\/EACcRAAEDAgYCAwEBAQAAAAAAAAEAAhEQEgMgITAxQBNQMkFRYIBw\\/9oACAECAQE\\/Af8AUsFWlWFWFWFWFWFWFWFWFWFWlQfd2leMrxqwK0dCArQrFafZAEoYZQwwoA7UBWqPWDDKDAM57Vqj04BKGF+rRvpSPStw\\/wBUR6kj0LWEoNA23coFSrldS5EoniEUDAVylXKU3jpEd9uH+7saojTRAarXQK2kG2FrKjhFQYChayo0WsocdMjusZHRgegPbYyOgdfRHtYbI16heAvIryriryvIgQe0exhtk5Bm8jV5Gq8HOXQi4nYD1M7NwVwVw3T2AIEbOIdIrhj7zOdG2DCBnOajdPXwh97TjJqBAyudAywtFpmBjO81aN09dogbOIYFcMazmcZO8w\\/XWPWYJdtPMmrRAyvMDLCtKtVqtVqtVqjO81aN49bCGy8wKsEnNiVDdsijOMhM1HpML47OIZNWCAnPIK8hQeSav5o0VtyhSjR1GVeatCcYVxVxQ2j12fHYcYFWiTTE+VG81fzkFHZPpQjQ8UZUmTUCE+o49Cz47GIdYrhjSaYnyo3mr+aCgKkI5Zq6jKOOlWjWj6jjZPYZ8VrmJgTUK5qvanmTRvKuFMQUbuOo3ijjrVsBSE41B2Cezh\\/HPifHZHNHCRRuaERlchU7LeMxPaws+J8dkc1eIOYIr6zMH3U7LeMpPbwjrnIleNq8bV42rxtXjanCDQcqwVIlEQgcgRC4rKJTROS0K0K0K0K0JwioArNCe4DB3cT5UbzlLZREKVcpySrqATkvU5X1HCJ9DhmRuFgJXiCGGBWRUiUW\\/lZU5Az9RCClONQ6aXBSEdVarVx6LDMHoOf+Ua\\/9oTCAhRKsC8ahQg0UClTtB1Hej8hXkchifu1cFcE931llXK5ByuCNAVOQnaBTvTYbvrO7E\\/FPTJ3OQj6YGRle6dudid6Y9Ph8ZHmBvSpU0n27BARMVxOf4hsTqjiAI4hU1n\\/m8I\\/3g1RaCjhlWkLj+JYQDqpmj+P4sEhDEH2jqP40OI2IULRaKVKlSpUqVKn+An\\/V3\\/\\/EADwQAAECAwMHCwQCAQQDAAAAAAEAAgMRIRASMSAiMDJBUXEEEyMzQEJhcoGRoVBSkrFigqIUY4DBJDRg\\/9oACAEBAAY\\/Av8AlLnRmD+y69q62f8AUrF59FqxPZdXE+F1URdVEXVxPhYRPZa5H9V149lSPD\\/JUIP1rPjNHqs0Pf6LMggcSqOa3gFWO\\/3Wc4njoJz9MqhWbHf7rWD+LV0kH8SquLPMF0cRruB+oziRGt4ldG10T4WZdhrpIrneuRIdixxtmDJdZeG51VKNDLfFq6KIHfS7znBo3lShgxD8KjubH8VMmZtkdlsnxLgljLQYS0DWiHJwxdPHQzBkpP6VvjipB1132u+j3ojw0KXJ2f2cs+LMynnHSz7Rdf0jNxU4buI2j6Hee4NA2lXeTD+5V57i4+Ojx0AkAEWEgy3HIHhoZZYexxaRtCEOPJr9h2H6Dd14n2qcR3AbBo3vhwREfzkqsvUkuTl7WwIj53qSTYkOIIrS67Teog59hdDbNzUy9GYx0TUadqIOITmCOwxAJ3EIkSM2EHGTZ7VylsYgOhj2TGuMgSnta6GxkMVIbK6oTGxGubF1XhRYk+rIVzn2c5dvBm9c6+K2GCZNntUUNAA3DJphom81ewre32iDyg5vddu7dMow+THi\\/SCs06G15a8xJ03IRI5J8TWSa3nueeIodqSXK4zXOm6GZtLZXVCH+oMEwxIjm700XEzJKMe9mXZTl4KFDjRDDMInuzmuVF5LGxhIGU0xxwBXKQ5xEONg6WC5M2GS9kEmbpSnNR4cOMXmIQRmyUONezA2WHgmw4sQwzDcTqzmokRhm04W79LOVLRyaKfIf+u2FzjIDaubh5sL99huPiuc3cT2MOkDI4FF0g2ZwGWJeuTndYyju1EkyAVxlIQ+cqmSN+SHgAy+4aGfaWv7po7h2rmIZzBrHfZ46c1lbO5cbvdRdJGLvKF1TncSuo\\/yK1Xt4FdDH9HBdJDMt+zSYTslOmkYTi3NPaObYekf8DILWvDx9wyQ1omTQKsMH+y1B+SMR7QGj+WXm0YMXnAKbG33fe5VrZTIuipdsV6F0T\\/gq5EbI6ERGMzThVag\\/Jag\\/JFjsW0OjwkosPgezl7sBVOiu25U7THODMONreTjbV2VffSEPlBobdYMGqZo0fCpkzK5097DwFnNxRwO5XH+h35bIQ7xQa3AUFj4m3ZxU9I8fw7O3k471XaGQTYe3bxsLnYBPinvFVwyLuDRVxQDRJrcBZVZrC+HuGLV0XJneq7jFXlK\\/wDZX\\/kRrw+0ZBhPx7p3Iw3iTm5F1zS07jY7lB20baIAwZU8ciQ2ow36wx0Dz\\/Ds74m80yCMm+dWHX1tEEYxMeGUGd51X6Ycpbi2jsi89xcd5TYbcXGSbDbg0WOiuwaE57zV1dBUyyYsTgOzPO05o0TQdZ1XWufswbwyWz1WZxU99tVWK30qqXj6KkI+pVIQ91qMWqxajFnQ\\/YrNNdxsMN2DhJOhnFplkO5QcG0HG1vJx5naMPuNfLY7C1m9+d2aFD9bDLbltnqtqbbjdeJmjKiRPudKy+8yCzMxvys4k8dDMGRVdYY2XvvbO0AYlMhDYK2F7sAJlPinvHRiVjIQ2mqkMB2aX2tA0E5SV460StplqszQmxX35ncVjE91EiNL5tbPG2F4zPzYR3WUsDBtRm8eCkRLI5+JIiSMEMu3ldBnYB91LIDuIsxkudOrD\\/dogjF+PBOZEnINnRYxPdYxPdRIbcGlGmhPKHCrqN4dni8dA2HsxPC1z+8aNsh+v7sjeQqosgcP+0TutfJkyNqvXzNMJAyBCD8\\/dNXnyk35U2CyHxsg8Ta1neNXWvibMBwT\\/JbG82hDO7i4oNaJAdnjebQGMcX4cLeaGEP92Q\\/X92RvIbYf8SQii3cZWSGrOqBDdmMkam7sGReaZFHPNcbYdkFngTYCdVlTbdGtEpY\\/yWxvNoAxomTgrveOse0RfMn3gb\\/dsqchkId4oNbgKWOc1t5wFAi4wXTK6hyYx7brhOlkVrRMltFMwXSFkSF\\/YWP8a6QeAsI+wXbATrPzjaS2C4sbRq6hye6LDLRd22xnthOMzTxRY9t1w2ZfOxB0p\\/x7S7xAOXD9f1oYnlNjXnVwNjIn9cmTRMpl6Jj8ouYJw9+S9\\/onRXYNCLjibIflGhien6ybzzedghGjDpNg+3tUOJvEsuH6\\/rQxPKUAMSix2IV068OnonNGOzJpuqnTRz8iQqTggzbtQ5O3ZV3G2H5RoYnp+skR4wz+63d2u99hnliJD1gtYfitcfitcfitcfitcfimRImsbIj24tbMItLhI\\/xtERuz5QiMwPwjGhCneGQC8yC52G4SK5t2detkBMnYr76v\\/S\\/3HaoVXeptDQ4SH8Vrt\\/Fa7fxWu38Vrt\\/FObFIIDZ4WxIbHC600ojEiaxXRwyVSF\\/kukhlqHKIw8jf++2OhnvCSuu7ugay40S7205EP1\\/dkbyHJm2oOLd6vwzxG5X4ZuO+CukhmW8W3Lxks5xNmFxu8rNE3byvuibGoveZk2BjBMlUjC9ukrsRssl\\/ktjeZc9FGZsG9SFBZVV7bfGEStszoRCaxhA3rq4adDMNknCVt\\/m3Xd8rb8N0igI2Y7fsU2kEbws6GFQuHquseqlzvVZkMBTiODR4q7ycS\\/kVMmc1NUw3ouHvZce28FfZnQ\\/0pNaSfBdX7ldX8ou5upEs4Lqoa6qGr0pOiOQYMGiX0Ey1mVGRXRy3oRI44NUgr0KgOxZzZWzhvLeCk4Nes6AfRy6l6zYHu5UIZ5QrziSd5VAqi7xUwbxCF1XRstlvUmNAClJVClIEK\\/A9lIiRRf8AYpj6E5xLpE0aur\\/yU4Dv6uUiJEZJrbmtJ4LqiqwnIRog8oUhZIq65OkJNG5UeVrhXhKq2KslgusLpblqz4qQEg4Wl3ed8aHOXOsGePlRJ4mSuSPhKyoUx22QyefGs3HKutEyVejV8FQSt8DkFuHirp97HKVhecJ2Xr07wsDvtVFM62T65c26pqmxyMRmqbbZiyfaZZT2nAhFh2ZN5wzjj4aKRU2V8EGnfacbtl\\/YRZWgVK+Oim90lK9LjZDc7VZreNswsFKRVe3VWKuDagfCw79ll44MrluHrlZwBVJhUcFdBZdVXtQvRSQNio3QOG51tUXH0U9Vm9Bgm7ipfQ5N91MqTc0704xMRRGWDaK4wTNmCc7eVdMVTY4HJ\\/r2TzjIELYTj4INaJAKf0GYslvU1M2O5rrNizujHjiqi8fFZrQOAsLSKHcr7M5n6QcPXJ\\/r2SmsKhTFs\\/osy5UycMiRRgtwn8ZMR39ey86wTB1mq80zFklL6VMZM5VyC47EAccT2a\\/BN120bCulhvafBc9dIB1Z\\/VP9uGfc9okcNqkMB9NqvBF7sG1RcDrGZBWe0t+V1vwrsObYe129BrRIDs8gpfULsEy3jerr2lp8bGB4mCpCgHaJnH6ldismr0DpG7tqaSJFrtNVwXWM911rPdda33XWs911rPdZrgeByJnH6r0jK79qAnOQypkyXWA8F0UGI\\/0WbAa3zFVjMbwCzuVP9FnRIjvVapPqur+V1QXVNXVNXVhZoLT4FCHGN4HVeqLx+s0toJuNGhX+UuLnbtgWbDb7aW7EwUh9cwQizM2igsw0WCqVQf8AweFmKxWNmH\\/Av\\/\\/EACwQAQABAwEFCAMBAQEAAAAAAAERACExQRAgUWFxMECBkaGx0fBQwfHhgGD\\/2gAIAQEAAT8h\\/wCpFAlYr1MwVmfDZ9q1Z0fBQsdBVHD+D5p0PJ+VfQPmvsHzRqj4fKhsh4fmsp1SrGh1RWT3goqTOT+ayTcCT5FZ+OUD1pfn09fXX617R4+1OT1BPYcAzHFvIyg8msSeU0rMiPtatNvP9LVtb+mKCkHrfkoJJoQ44VIADkS+teTk2eW49gnmx3IAQQZHHbIgjUqIB\\/ZcajFnWPKpZyab+X4tkI5SCpbknbzVMg8G31zSpSZV2usUqGGdq0ExlK\\/DfLOJpSIJODTsJziX9L2IJCMJUEnI\\/dUTM+Q+HH8P16hrT3ifTFSdgUoy3DtcsyzETfvEQnPLnRq68mW34MS5hJFZfCvsUpedV2YSrBMEZ7BgWBM+tI99cxuLcCyLEdjPRiZxfz38eIkrgDf1YfwIqOgcdav3mj7HZmIf5AoireNgJsppWXOwJHBDVoNxhk5U6Lhyp+FGVCQlLEl4mUiaNstds6Jb\\/llyzahnCitYPd4CcPFqeRncRbNqhLgicZYqdpXkpETRlHvFv\\/VF1SQEGDcIm+KuLrrT2TTACOLqjltVyuC+h5d+URADK0liGPh+aVVVlezAELhflRCVMxhxogDCRXos86z1k2YCm4XY7kWWnhCtFnCOlTKCVjNN8J5jNvvT9ciLFZ8GjTBSiIi3hWEgr50T9LDLKS1CU6dYIKkhdjhDigzUNMs2+9FtqxYv7qbkSURpsM3YoAgYTZ49razSYGLTtWeRr3wbc0q0p0iHn19xNlncxiqzBZ61neTDAdN+zcxlx3BRkYSsw9Q4PejLAlXSp4KbHvd6ZtQgyzuuJPFuun9Eh2LAyL6TfcsLBBFjsoYns2Ufenepe+bGvh02NmB4me3BuECSddp4JFbLdwiqBdY9OL7PGsN9LrQNwei9au4ODfzdoEpMiL6bIEFLJx7Sc0l5H+R3jAAf9NwkbwEDuz7HBzoijcI1\\/LUemZWG+0YVaFn1JbhV13R5Gl0Uss7SwSwFjxo5h4J9ilbj9d8YRiY40pGAnQonDlJK\\/nq\\/nqh2msM33XcMYGzO9YWQItrV3aI+z+u7tbBya1kNjgaG9FwGGYSTbG3T6n+bY3fqjeuPbd1fAoEwICrbDUhcPHdBkgLq06HGj9OtCmK8Gpy+VJrg3PA38lMC8DVo\\/oODlsPQRHWxSqJlcvaRcY\\/c7vKm\\/ktPvLsQQCVwUOjiefVsYqBleVcokOBpURiuoGNwN6UyiWmgqM01X2th5VMhnOvM+\\/jWmDoVDjzlF5TvoPWhMNtgvLiqm8CEpYylybM7XQjkIdkL\\/wBLV2zl91f577jHmUFFpCwJnsJuEfud2UCXBT6P5DTcIQC+sY3bZ\\/UNsof1G9NZrXPhQVIpexMPYMM0Qj1k0dxKw5SWjpkgrQ+GzVsHWpc5FITfsAp0HDds9J++Xdo2YHzP8nsoZR507MEtQO2vgN00GfQMetGys06YbAJQHFr3cP0r2x\\/KtRPArQnrOnQ9Sv5b80anqVNYxQT47NsvWuXjWQULchD\\/AF3p77bb\\/pY7MlLhblbb8IuPHHpHdrFcq\\/Y\\/ewQKIQ89+ECf5+1FW7ljrvcUAPQ\\/tL2qfQD1pQLpftT8q8VPYNCXBhK8MfypQGrJwXjx+tplykBxrIRecXXYukOTlWTGSOBodnoiWvLrs57E4GtAygIDu059hP77CbgkzBgqPOLnpp957Yep\\/wBxpNLucGelfyPxUuBBI+NvWNPrpTuFMa3IHPV2OqDxVCBQXBmpcuo3L7BaRMURCGxYjr1q2uiemxtOCtk\\/01tlxZAm+tTg6p7Nst9foU5pgJxqV\\/M\\/FfzPxUydqTmoFhki+nY\\/a5E93n\\/R6dgkFn4KgAgIDZAzHmTs9d7mz7jhSEyNrQxfZ657q6CVM3cuxkyqw1qEkpJvnlQQgTeHXcPWIYPxR5GmKWbiIWIl3N+y4G2WiPMnYoEtgpJzPwVfb5naYcZB0BQYBwBod39Z2xGd2EP6zbDrxvds9d7mz7jhth39Sf3QkmnYy3k2XGukIqPPkY0tZF7TcOQDDSzevbRPWfZ2WuF7D42R5n\\/ONss8WvTX7zq1SFtWvt8zfxZxoTncQW+Aa0IMN7jveID1UEnqJjY4zsgJGCCdzgMi8DWiug4HLYiKwOrS46SvHZqMrgursXMuA1pqUErsmnXE9h\\/VXBqI6OPj\\/s9i7ZhxX9fuglCoKbB8vVdkfPuG0GM9bns9AOiPFJtIDSsLURFkLdRMkUCgCVwFaanHB895mf8AIj9b\\/pvc7H7bhsnpC8lps1bfNe5+92THgBNZANQsUSIHFuyaYA\\/fKtW5dXQpGZWV2fRcOx+9ybsx6BKKESyz\\/V+9Q8d+V\\/3f9N7nY\\/bcKzhEFCPDwkzUC9iXPQ02js9ZRuBQCHNRNvMzariJA\\/yl2gA5UDjUP3yXFoVXZ\\/C2\\/RcOx+9ybsW7rp63n3uyS5+DFQgMWcbyNBgUmv46v4qv4qv4qv4qkaGSUI12PfDKIONhs25bcjg4UhM6Gq4NTFFc\\/coRJNrzA1qeU4rmrASlgy7bi7CFafWsgIS6HOrolLK6m2BDYLK\\/kK\\/kK\\/gK\\/gKgGhRC8m02ODI0ywwyhFYU+OnnWeBYtFrzEktXm+nu75icWjWaUkcNqKhITTdKVDWBk47nrvc2fccN3mCVil4k1M9VOJXmj3sIqTWpohBcNIywcWkNfKo59c+VE5jOZpDiLoc2n75zt+iy940DzqRl++79vmbmX0g\\/fwrAADAYNkIgJzpbLigEj3yZC159fvPaiIq5XsZzI3lOa+k\\/NG+KST87RYOq42lEHqUeM2jL4o6xYSSlpu9Qh9K9Oun3ivXKpl64xLXUfTNPC7jzeBV4xZLrUFmGlbI42KKi+JauxOJdGpWfia9dckJCaCkZ0Ci9XQVwt0avsPzX2H5pihgDF6ArBBtdk2O5KCY73PTP+8bl61SHDr2ZNLZXONeMBdOvxQqib1jPFPw3VtiJcLmzUCOi8kPpTMD6cK\\/qFaJ9f8qtp\\/0u1zUWS03uZ0CsCCmXQlEs0cTdtHCgHg2naUOCPCuUog2EGkKXpDSiBsPlfinLgsjQukwt1roTtkTQyW2W3R73mfKppEgLBViJnOVBJq\\/S9O3WCOm7AsEE312pQzyTQ0ni2oOYnImpXVL3oB6uxxrU6BP7rQL2iWmYnUmjlFDjUISIkvX2tFGebWaXodY1iEV+yk1EhYA4m18uabhSuVvvpTnaFGRirUCaBLBuGioNCBWIodaS9SrOdGjy6sJJKRUBpTAb96+d2Zm2BOjzm8GRgBUQuPIfNEKRMRbYoTV2wkJ+9xSMksNKB3vdsXgooQcBsWITso9FcCAxGywuqfDWi4LlxFHrfZuqZeb3pQxvBctAcnJU3ByDA18BRZ5qfuvUgYnZLL3mK3x2udrMiRrOIvPczR4df4V7bKQl8trmzhpyXOHruRgkrSBSYARSQ1DjUONSzzPlR21TuaS9To2BPq0GLgRLLWd33n32T212R\\/HTnV9vQihEkbNa71D0FBBBjZP1eFJyyUJVE8qYmwoIDvCwTSyl2aZsSMg619JQ4yeugOK2TMnkbCiJ9ZpQOUU0umm6Pyn6freAiExJWSU6ldSjmXcVn2oZt+ktdGcEFYqnj2FbzD1v+9wLNabOBSkbGX+qdjqaGF39JRxq3pUmKCXYhfWliuhOhQTWUEpIUBykWJjZzHlQ6p7dK30aBNR3PLarxscQ4+x\\/3uj4Wx1P89tywKSiiOooCoCeX8DPsrPzlUqyeFDqXhseogPFTEnoPZUavxn+qIjo4UCZXG6GFBrupxou+tnEoZJKWCabuz0ve\\/526QxupoVl50J2uJweG0GYuFq6CZ\\/B3MtQuu\\/AoizHHcdQU8NOlQELsBgkbJQwnIPCluUVI28oCDwv++3N53m6MC15nOjgE12SYspahLzfiuYNqxQjUYwkXaVc7RxIedZlfmt3txO\\/fHTLTgmuCRpgeKinH8YV5ZpShL0mWxT0m4Y0vMn747xPFLIoDIAgDT8bHh40lx4qxyEqkWiXIo+98rKCSDzVDvV+eQrTTLuOTeQsjQxPH8fnNNAqZX9qYmOQbA+uSHpVgDAChY7jl3c1xoen5KHg6Op0ak09D+aVcEonOlntTCDq05heGkPi7XVdb5GvemNua+7R+Vjhug2HjTgQQS5oYd2OIcViswjx1CiNNtGhnrfqtf8AyV7wKhz1joLT5qip\\/nV\\/CqU95rpQmjE1f6mowJq+t\\/zBAhJodUVo3lsusn5lpmWtLFGJXPLs8lArATSoYehmjp2PzmUotrQTBzpHENJZXZfJKLM3Ioqwf+CUyFKU69c5UOKucrr0BQAwR\\/wV\\/9oADAMBAAIAAwAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUMOluakAAAAAAAAAAAAAAAAAAAAAAAAAAAARGDHbEt2zIBBXgAAAAAAAAAAAAAAAAAAAAAAAVmhKSbYlu2ZAAm8HgAAAAAAAAAAAAAAAAAAAAJ2pQJyTbUt2zLgE36CoAAAAAAAAAAAAAAAAAACqltIBKSPYlu2ZAAm\\/QJPgAAAAAAAAAAAAAAAAfKktpALSTbHR27IAE16BIegAAAAAAAAAAAAAAAL20ltICZM7nLfqZCMm\\/QJePwAAAAAAAAAAAAAATe2ktpTZmE6o9mLIAE36BINggAAAAAAAAAAAABNL20ltIBISbYlu2ZAA1\\/QJUMGAAAAAAAAAAAABdJe2kspAFSTbGt2zIAE16BIRgmAAAAAAAAAAAAFZL20ltIDIJC5tu2ZAA2\\/QJCMFwAAAAAAAAAAAdJNe3m5pAJERQANWzIR+TaBARg\\/AAAAAAAAAAANJJJ20AtIBFaAAIK2ZAQAPQJCMFkAAAAAAAAAABhJJe2DApAGbmm0STbYAAH6RIRgsgAAAAAAAAACAJZL0ABtIGIAAACQKbT8d\\/QJDsFoAAAAAAAAAAABJJe0RtpFYD5weLwvIMDX6BIR2sAAAAAAAAAACDJJLwDFtJAPySSQWwZSgK\\/QJCMmQAAAAAAAAAAcBJJMgfNpZGduSaZ+bDATJMBIRgoAAAAAAAAAAAgJJJgeoQIoRDyRIMz7IA8AQJCMaAAAAAAAAAAAMDJJYCFCJDOUmSONuDUB3gCBIR0AAAAAAAAAAADkJJZCrcKK4SSSSRsR7gIoCgJAPgAAAAAAAAAAAEBJIAAAAFCeSTJDtnrcAAADBIMAAAAAAAAAAAACgJJAAAAAhPiSQ7tsubgAAAYJAAAAAAAAAAAAAAMBJJ\\/+ljBAwySst6GTXbQgbe3gAAAAAAAAAAAAAsLJLq0oRIACB+J67XlgA8AAQKAAAAAAAAAAAAADhJJe2m+JEKyVDF9hqcez28SQaAAAAAAAAAAAAAIJZL20lsfACfP0r3MSTHLvSSQIAAAAAAAAAAAAALJJe2mBvStPB9k2QySG2okAAAAAAAAAAAAAAABQSFL28S0AB2MTMx8SSS221gLCIAAAAAAAAAAABASTpenC20ACXtwp7iSQU3AiCYKAAAAAAAAAAAAASCCK3S2mgAAAPw8SSSK2hCAAAAAAAAAAAAAAACAAYZs3a02AAAAAACSSRW1TAAAAAAAAAAAAAAAAKAAT8qKEm4AAAAAAASSAWzQAAAAAAAAAAAAAAACJQABbAC23AAAAAAASSSc0gAAAAAAAAAAAAAAAAAAAAKAAG2AAAAAAAASSSMkAAAAAAAAAAAAAAAAAAAAAQSW0kAAAAAAACSSSSAAAAAAAAAAAAAAAAAAAAAATdaeAAAAAAAASSSSAAAAAAAAAAAAAAAAAAAAAAASQzYAAAAAAACSSSAAAAAAAAAAAAAAAAAAAAAAAADHJAAAAACRJASTAAAAAAAAAAAAAAAAAAAAAAAAAALYACMm23t984AAAAAAAAAAAAAAAAAAAAAAAAAAACLBHAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALIAAACZQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQbJIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf\\/xAAmEQEAAgEDBAICAwEAAAAAAAABABEQICExMEBBUFFhYHGAofDB\\/9oACAEDAQE\\/EP5S0n3ZCsrKysrkPulPn3aHmMn4Eun2dgL5hA+UICPsVDmJ8RbiKedB2wyHygjx6tagnEU1gPPYeOkMgH06hzPgm639KMgj6Na5wlXntEprtLqW8+hKE5dP4CDi9o7LJ+8L4+NwsWsBvcOYLjmStln7w2X2E1nwvf8Aj6opSLe2OzmbbsBRvGU3QRKZRWHMpb9yglRQEJTdBEpitvs\\/E94tTiHHY2ee0eorO74Rx2A036JU91fsdoJD5uD6MT8Yo57pWdxWo0JTtpC80gW61gegB4iJz0Ru+QqvRlouWL6NzefBrwV0gG8RaxbWVRfV59vsV0qlY4itvTcgVoubzeUytFColNah5yt60pXQ59urX0bm81FaqnW82i7gW1AorC0XOfRlXVBvGkXpWSkrnvnEcJcSmtA85XjpjWRR2y4OjZkqK1Da8LUX4lvSG8DQFFZW2+qFvbvoqsrIJs4hF6RW4F34jSJBtrQvHNyrVqr\\/AH6j3SscseORbeVtUJd5SUiU10j57fk6FytMcGObPBoDQ7GPDKiBDoSV\\/j\\/s3c2\\/1Lk45Y8cmjKtucs8uiLe45uhUXm5rHBjmy8HnG7vMuR\\/tCJW\\/nRWiyBAA2zyx44NuXRjlnl0RR3HJCq1C2obYdifVPqgSjgWp9WFyYO\\/U54V4GjJTPqiDvlFiVro7k63F0eDh1bB0i2qn0B\\/UANnUrReTjrS3KN3uhuOvi6PBwlNSwqJZpKs\\/MakqNf586AuBU8GTjrXme7N6wo2aqqa2cKhdAkbIAsnk0LhtmwW5PAgVkLgVKnRABl3yoxb3gLxLyk5nme8Syo\\/HQvatHBjm0ooA2jaKJWFLzeE0KlQgKlBFvdwF7YonOnlnlLt30NVuogqWi0rNPORTchtIu5UpKSkqKE+CFGCtyAsqwg8ymBcMUKpaWnLDb0NnYPM43rIiQWxWwU4lifrC3iXAS4m8FAoqVDbQAcaPgwN\\/R7mL4Jx0AXifREvE8rlLiSgMbxFl4LhtzKaA6V288vTXF6guCQbca0uJpvC6ArqMBv0qWVBatNK\\/PTfhoMOAgVqNN4sT040LuspkqVKOgaa9TdAK0ZHKWd9XqbVtFcwKAHGa\\/Dq\\/KbqDZftOfwhaLgDcB5g3Eu\\/wlBRETn8NEcopxDZ7C5cv3Ycoa7lzebypUqVKlSpUr8AqV\\/K3\\/\\/EACQRAQACAQMFAQADAQAAAAAAAAEAETEQICEwQEFQUWFgcYCB\\/9oACAECAQE\\/EP8AUonifnPx179p+0\\/bZD+Mo8e7FwQXMD5YHAfEoOup4jJ+GIREz7HAEVniDzzDEO5YtH5ijPqwXgjs8T9aY1OdUhwdhTfSQxZ6dCgnmig4PSixE9GCtE8sgFHaDZfaZlOPQ874hNHTpUWipVdckLtJUL1xmNFoxMz7riUtBcXl5RUKSovzMFTEeQfZ9VxGrQRWOvz518h3\\/m6tvdxUZpC8qrieR9ireLuBRWkIEhmXCniciUUZJdG\\/MBBSXuRBYIUA9n5O8BWiDzc9iE2HZsx1BT3QXwQDbncdIUr0Qs7qhbPakrwR+s\\/eET6JhHuhT3HLODYlLStqgWx+k\\/SCqN5ZzOa1sqMZ5gBZ0UGnWLvn0cFaIZDc8mtf6dHY5mKrbMytz80RWQxZvVFxb0FtdXHt7W3StnQLaJUEdgXRVbdeGU8ui\\/iWfJZ42IrIIlmy7xp4Nai9o30Me3pzo8L91v8Aw3c91qHYoMRaLi23oFtSqx6PUdV686QidC8\\/vP7yv2f3i4ozoNcwbL2cFa+bpuq57bM6J0v5hwbnyGgXA8wA6DEuUOivUyxegXBRXVWjtxXQeJwvzX\\/ux2GmcHV84SgvQLa0VsFFsA8Q06DjTz1oK1ubiDjWlZfSfjtzQ6F+615pk0x65YQxpjLb2imkOfMYvGyydeY1qVMNcXRWjuMHQvo8a1\\/ppk0x6nnorNEJyRW7BqW1w0OXSrVdow1xdBit7jBHkVjddQttugFplRQz9ICpogKy\\/wA6YnRcdF1w0NaLtSDM\\/aAnGoAQbxvs7l2N+To4tLg0fNbqyjG1cwW1KrTJ6wFSzg7p8JvydHFFogiWTnDDBpuDZszmW2tEW55WuT1jxHd0V+7wFO6oCUNCIGBt6kKYiplcG9UDzLOSNCtUEslr8mOhVQjjVRcCiiKGZWWM8R3lAwp5OgHN3syaY9pGmO6YIgPMpLluIv2II\\/EW5egAUaKBbKfIBxtw1xSrg2V3vG\\/Opeln6RC715KvUBTFthEzLlpaWy4C4nmiwqK+GIJZoKckxGLUfppAMrKw4R59D\\/19j1PHo4KgRxKkqRGUu5j+o186Gyiqi4iY2bixb1Iq5lSpaT6aLivR8dT9J44ESzoKGY\\/eC+Z42o1Bvklrg5WAFaFPEtlGIvZZ0alXDBLlkr0dTbcoFsTEKXneNQb2sWGyza7yGVaXM6vfjTZCsNt6jG52XUPuXqxSEuNIq7nZUp0KNh6N8tHTjPvVuW00imhV6DtWot+luXDSQFulx4SpW3x2njZfF6PoTQi6oDwmK5iccRTlly2Ft3jtCJXp7l7qlbB4va47U54iV7YLjnth+zliCmvaYO4uvYBVEEpgsMc4lEPP8ItUAFmg5x\\/hStkdxwgsIw6tMplMplPusSxbhutP1Ki4p80WlpaWlpaWjTj3d6hc4YlvVuvfXxUvqX\\/Bbly5cv8AwZ\\/\\/xAAsEAEAAQMCBQMFAQEBAQEAAAABEQAhMUFREGFxgZEgobEwQMHR8FDx4YBg\\/9oACAEBAAE\\/EP8A6khSG6xUvYP7lrJ3+uqsT1kp\\/OD1SvagrgyuocERq+CpHyFX3tfwU\\/oOchr+cr3Khhl0jfE1zIESe3+yoErAVJgTJC8jU0aAT8yH2qcNsV7QPmpCAdB\\/apW0cjHxCp8Pdfl9CGr7jRnER6WoQlrA1Ex5heIWKGnOEVurBosG7MPYfmodF0WPMiuh5mHWMf6MWBEgAvQy9qgmOIT92\\/tUodw+\\/wBntTLAurfwHoC3AWwLE5bfXeIvCAmCDJO\\/ERdEJCd6iDujF7v5VuJhfeXPLU0nEpgequeP8vBCgw7tRrK05XUS9ipFRpS\\/jZKbpEpK93jcsSAEnMs9uI5sVxQSQN6fUgFAGYcNGOCJNHITePoHTn7qHBoI+i4YpRCPJp0cbSwDln5muhXpHmx2X5f467T6d+QMr0ptmYjl6n7+KhRGULBKaDofSeI2JgSXJG4bW9z6j9R1gLYX\\/NmTpUBYp8sH5Lf4YqikAFEM1o\\/wOr4rJyxi9ORy+moaoJWUyzpFvNPrUgAsqFgFK2nLpShqhndps659AIDYQyJW8Zb5b8X1XEZr8bojmjlj1rgKYBKXUiMFOf8AweWP8FoSG1l19OmakuJ0HQ\\/LP0z5SACEm0SExVwPRjQGipvpegunz2GRANzDRCxXeoWKQ5zpQrGRUMwKhEktOaQsw7RGEqKQmBfl4gY0qMjFUCy2LAsS0C9oQlC3UJbvQcR0UhcWvfHelJuXDmABrlzPamxxqSaCribc6CYu8ZnCOkU2\\/HAGJTEDE25UvhKojE4GF4louxwAbQcWrCaSvGYqI2pJmFNJN\\/pRE45kutDojim9IbvsX5adMCJIyOv3p4GlEAbtOLXQZeW3+G9O2RKrKv01w1IASctmc6Nt6MrUmiGNnOLVn0PIiFHQwxVoMgKaEYJv80\\/U\\/PqaRZVwHOgAHQ0jJl0b0y5BQKWVgsUk0gFxycTRkZoxOQRqEXtVxsc1NcG5RUYXomAC1EPsmkTHNN9aSwhZksi9jejVGBAVucoLLYxFLDJrAN2iaSXjGMdQjEjW1JUXIkgDDzOAEkBbsYqJ2ohiG8fVRaLMkEKTuSeTiyXTdfc\\/Hjb7xAFlYBS2IiMc3k2PPL6+GSoYRXCMYnfv9d9E05AqNmBqOtQdrhjZgaHrIkt0gRJxyiPepYibbcQbkSIwjQCGwBr+78j90\\/Yi0AMq0i2BJR\\/AepFYUJImCWYLLLGnP05rmvCOUemXhUEeRLnellXfan1rJo0AERGTTPoe\\/GrImNXd5+h9QiAwZYsfTcyLDpJnsw9qEQRkcJ9yuL0jD8Hu9OCYiKzSEtEEW11c6fXDVkAN8liDPW1uEKwXaJrcSwjkZfFCDqQ48sz4pu5CME26JvQpUUtrUNRt1nj3UQo9PjH6ptG21+7LHePoPozEkXXbkJfrbgEoURbIxJyl8\\/UaWAXWbTzJ3+4cpAAjfE9Tg77cS6CxzqD+shJBbOzbt6XjBh1TAUEX5YD3Gv6P81cdKTB0n1hRdLQNb6vL4opI5KUeTHZfm1BSFzx4o+FOQpVoObSImVzxYC2fhqjYM9jWpa5eK5zPw8NaXvHA3HCepq1iSYEj1rKILBAcihbyqQgxMLOlfxf5r+L\\/ADVxUQIAySekEjWwxCSY1vcyeo7cbsvc86VesD6j8H24dr+yAmp3ByeP4D1Ke8oJI0RycbkYXyyX4+Rxzb4WxY+Zex6kCQw7fwpagCWGCOe9J00MQDoafFLcQyQa0qst\\/QFc6hABrTSEYUvo93LsaUjKhpVNj5kX4ousIuqPyael4ThgAdTsAtEVLBoCA4SoLXdbH7dBp0SlTKuv1H0Nnj9\\/26wHjHS2d0n6J8CwAurpQ6C8jUv+nQOAyXXaAlaloFFOgOwBSZPtiSclGPHolQhgeM5uD\\/yjbEKsBUobrgpFyG0aVLqK4vYDXZt0paa88DraPeguwXSzFM17+9Cm4neZS6jkOHMYEnKKFvDgKMlQMBgX03o4SnVI89ucnNMBMAjsSbxh5ZOAKwXajhTJhJJI8uGdOU5o\\/NB2eN38rDkrHb5PQOkkCYlWChdxQAHqW+g+jm8\\/r+2RIASroUyFXBdDb2B6Lqdt0mGzp6YGSQ5LKx+XtxsQtg3M3lg7PpBUAldKGHCNZLHYW6zUj0LBSFJX6PWF+CEMlYlfEZcnRt35cRRkYSoQVySQQSvIqHQR5rHigpgx5xl6rL34ZPHHdod2DvS3mjwuUIkssHI3x6VVlu8XRCGjJlix339LSiyo8r9sby8xa\\/J2+lucmLmA7EHWeCiIAEq6UjQxLawebvf0wESm4dDyPemckTWD2DgjKspAVPjkySPlU\\/Hmx\\/Iontz8BpPuh+BScDqL88MwcroD80BO+N\\/wn5qOQEkEHtr24GJCPkIa8nLUMTxau5hdMou7KOKG83C6Y+Z8fTNDjVYJc5TPallmI4KiYP8AZs+2OYIfpHycCYRFmiRjyHr3NzlkG3cx2niVQjUIDlLi1u56jeL5ciX3HirGZiFAZ8taAatNG0C9HPR28tc8wleX1wxMWrTTCBlUI0LsSETXYdfka5ENCZQmjZd\\/N+KNTjZSwFRkNgat15ngLFoNAS1IzOHYdgg7fTaJUYxncWsY4GcwYGjddgaNUQDAFg+2WQtGdZ9YWZzUByqHEmhyq86yQuafi\\/FkHELZR9x9goBZiBLGFpaHDAsqKuJCSeIrS\\/lw+BXSJNXq8FhFvJboc+C5DgcC0vsUk4AosuZNqbrNJCeZy9Fm5kJCpDTbCK1EvRydKllczcy0fHvwATbLtJ7nvwKAvCPkfLwITnQu7CDNXVwuFl\\/gS+ONndbLcb8seGm4TiVMGo78alRgG53MObQAbeMpvGS+bR3fovEBxpgN+5Pbn9uzmh8Qfj6CKTcTS4+cd6BmBAGA4DCQ+CexL2pVZWV9DTjNZRgNC2ZOXBDFitVBdVOxNCI03F3eBGZEAlxYF1PzVoBAWBGy5UEUoUiIxjFvQ\\/aQoqwzj+d6kRlBLhnlDvtRBgFeSzHC7+2HgiBza4AKgErgooDXM1jsQduCJAEqtgogpsLpYPOerXu3H9z+D6IeWN6ee7gongTrAQH26WX+3iqEEkkk9Nh94kXG\\/LL2ON704g2X+BB59bTgAGZPlRIxIkPisowOqT8cLAESJPOOcUtqZDD0QQ65vTRQNRh6E9rkNKlKhEICdDHam7wj2zeOEAZumdUHy4Y7TOWUfeb9B43+SwtzX8WosG\\/MxFhYne1ude7cf3P4PQ0CMzkFjOfj0HyPmk1aOcniORg86\\/cM1r7gP5q0F65fwayY4KqBJEwGA5eibAQ7gXYFoWJItAQHBVSHMiseaQB9wSllc1\\/wj9046NRJY9nhkss0ksUgvCggAlc8BWsW5UUbM7VFBAOZC\\/s+ido4\\/wB58Uc5Ghl431CeAWF4d0Et7F+q8ZkxACAZy1Z7BX\\/MP3SMDkEMqPZ4xdPrQtMskeGoy0a0kk9k9KMItkinLKgEq7UBmbJXk06tXtvP3Cw8BHh9gBP5e\\/gM9B8cvaz2oSG1RiWZPpA1mvKXgqQmlAEkTBtQCkEhUnPadaWCllniqxdjmsvxSMyWR\\/gWDvTbHXaqyvD+rt+j7X04GAhAKBAQFA1BJsN3+R1+6Qoso85PsIT+Xvo0xGSxKsF2jHPmAE5lFK5JW+LsYehvQpT8lHnHelJhHCOR29DHqpKEBMd4ofbQGmEI9qtKNEWBs+se5UnFHIQcpoIQtlq5fx0KkPmUc6OwZeby4\\/1dv0fa+jRNjNHLQQuGx8NOuPup6RNOa75HtS4IyEs9PURlUAFxGzyfV5pppozFYgLMLHI4HUViSCFrU++kwJEh4ZzTF3oXCZXJrA9Suo5h\\/wC0n21O46l8nep0ScZjrWKQxaY0qRGxhJUwsulT5xMRNhb6ScSZiQWVajhhwBcDoc93+ZorBLx3mxpu9GiLidLdC5vdbdXiVuE1IAg9MGCCD\\/7AasNOS8UcAJSHWrPVkBgAscgq7TqIkea1OCHklShdzq3im4CwLl0cNQF0sT4D4O+33mQ3DtJE9qS4JW5jc88XLkQohPSG3Nj7Rahp9NpxoyQyx+E0f+UbwIsH2H5w0Yq+AXOZo8zxTrCGnPzkx3oFY9MUtxV4IzF70TIkCzBSEXO11JyFycI5ZP8AXq+QkX36jpVtUyFt8U5Zfek8HKfBsG3BHSYDQ5uxRZgi6VdiX4rb283BuOGn0e7cf3P4KHMgHtIyvJ7\\/ACIABA4DYOAU5WQSNQ35IoPKPvHiGMTEbHzDxJhaUSr1+i35kFJKdHnX\\/GqBBlMwSLTxSQIzCx3mI49NjgmyYTk0F6wjXra+46VgYmCdEtUl9ynT1g0svJyT3KvaX82pweREHsFMiJwfcN6FN2MnQZe1IGjYd\\/wdW\\/IodM0tlTqu9Ci7i5UVb9c47N6mBR32p2Pzw0+VOOY6PSpQLbo7XJzqfzale1QgruHhZqQWzfviasAtYBEjJEbV\\/wAyr\\/mVFuhngoLTUcYDyDj3hPCfltTejDWfb7tNMRl0D3D3D0IvBAIbLNxtMT+PplXREdRMfL5rLVYAtzc\\/\\/W1AFcsmkUCYQ4AdQdOlT2e4s9HDUQOC7UwmCxU7uzKHUYe9EQaSdu8D2oa57i+yKt2k51ASAm59j8qEWXSJ9xO0UuWmVKd2oAiZJDUao9XfxmiJEZaDkUDgXB1\\/qsWlE7urxEhAUCR1SbfugBnsp670pwoajFWNuokoWYXgI9RtUVhXW+KcvbpSSBgoR2aIFAQ7sPgaiRJLO3FB8qCZScHBuj3+7Ohy7LtCRHRArMTEsdqX7SS\\/NPIUmYl6D8+ae80NCvSKNHFe4IOd57PHlu5V7VDiOY+TToMZYR4mhmdWR45z487ViOGeAAbatneiYjmSCjQBST\\/DNeEsvhFAUCWCfuiLCAWMR0rn+f8AVJZMsdTramGhcxU0BCAQnrO1QTc3T2YpzOICAyeyeOAKgErgKKRImSw2Ofo5VIeuX58KgXtxnSW41c4uJNetQa5QMenU08bVYZABiCTBbUpmXe5hwRrtSnLHJA0UwjnanaggrX3OtTgxqUXI0RCZGPuo1Tr+lKrKy07HLhi5UAZFCcsXmfE7epVLQKVadD54vmdXt1pOYbCCehwlYTUUMAsC48rPXl6GBIBrt1KJjKUFnwVRlY6tvzRjYA8cJPh2Mt1ipCHWHLIQjXfnwDnBv2exoppxFy0aEIWMn\\/ulll9EDWZeyD2Crow+rRylsPxDMdChYyCiQZjn\\/ZokQh1\\/Wj0MDXUosTc8CurANnbg0BYx9y5lu5bcZ+MFuJJT0zSKvkwh2aPj0AoAlcBRQzOTo2\\/mpA2Cwa1K22gwcMlIBwCPRpl5MryMPuehAN8jU4nMNzpvU364IYmfxxycjSEmY2O2auUY2oWGeLJuadqWwFJVDhGJHYqQMdf2FKpXL6VI\\/u7hBlh78ByZg3egLtCSxYFQ96AAQkRs0VpebCz5ZnlNAQACAMHBkinndWDuK2aKuPM4GgHdCgRwH3AIsBNOuZZ4Rzn1eAGQeaKRbh6KpKomuYE42o1Zv9l4YriwRm89uBOEZDh0Pl7UdJgJWkTsLDY4uI7vCHo\\/ufk\\/PqKDVMJh3NqVVjYZPehvmA\\/dA5CDQDyHzJ8FHAeQH\\/PUIgGq75eCjrfVkcle6PseAwyVCR5UgpkNAMFSkmQKZdhq1B3mzJHTYocIBmNX7+aNEUiYmaUQY50kRQJy4f0pCQDvlp1KJZF\\/1TLbYOWdX\\/2rRAFNUz7r4owwgjYEt22CoZiL0kSgbtEaXJPIEe61FGrFRO4VGC8yudTJxmGzhI\\/WQMrkz6rwbTfd+UegoSMA6l6h70GoIWgVYzY5H+C1tfUpEYSGotIKVsbVGLJB3aNBNHQcHihqbR1J0Yw70anre8un7RRA05Pwg8zR4AafGlIkbZHWh4hwEt7lEkOL7+5zp6gAJLaw0BXBJKJlSUXLwuRvL\\/PN9ZBEcNM609LWYA7Q47Nx5NHEykfJZXMeMcKqSXJzRxzN39Kx\\/g5pKCXSSl6JYggo8MogVL6CJvNYM0YwndpXAO1YMNg4BUOoJEclLyAbhvL0GOtWhgIKfYDBxG9KdEvdnb68A3W9XPltIe013rBrcfDs8uEiMqBzoE3crd\\/ygmEazekRRITgAlYKgEx1qVFGQ3QmL0jKnjf+lRu0O7BV1YlN2+Rjt9eQ5X9dw8oJ6xo8ygKUrw9MyVcCkEDkBidP8wHuO9SzjbSErtwYZ0DiEta8WaSxG5l9gkib0kMesJoDmDaKNWgCAGA\\/zcqRgZKlCbB\\/O1OFDeYGnfFZRsgVZbadqPGoX\\/yvs1NBtMXfEUzAWDQGv8ddqAIGAfLz+xMFz9R0SkBQa45W7\\/noBAI5Go8U2sJgNF735XK037o\\/+nPggSSciyj3inQCQEA6FKj0+2AKAJXAUURavybf6UDm5PPC5Uto3lAHx2X5U3DFwkBRKJiMiCUYTuD9T2c0r3rP3VkP7udf8PQ\\/6lKlXT91PwjyPhxBQAq4CjAEvB\\/M\\/wCra60eGB8NqUOZrUGXxXwXpUD+RDy1NAjQPvLVPhHcgeSa1yNZU7SfFag2kg8\\/lW7zIU\\/NZTWsUfFfygOTWNfqv5oxu+Lw2t+CjijOQfmjJDXXke81Mlciyvz7f0HHr4o0i39Dp\\/sRRDnTbtyNysu03u4RceyZf8UBvc7cW\\/Ed6jJsxA+TegAgIPpOW50KUnAE1vICWOiOjUBAAlZXq6v+5h5d9aaJRGLuRrOlfHFrFjt9EFYCawSDeyhstdA81COk5f8A8FlV1K2R0UpXCe9OlR\\/xq3qAcr71oh6s0PAdB\\/8ABX\\/\\/2Q==\",\"size\":24175,\"type\":\"image\\/jpeg\",\"originalName\":\"not-found.jpg\",\"hash\":\"\"}]');
INSERT INTO `testimonials` (`id`, `name`, `title`, `comment`, `status`, `sort_order`, `created_at`, `updated_at`, `image`) VALUES
(11, 'Test', 'dddd', 'TestTest', 1, 0, '2025-08-31 22:58:27', '2025-08-31 22:58:27', '[{\"storage\":\"base64\",\"name\":\"not-found-2e13c218-ff6b-4539-9c46-795e3386df44.jpg\",\"url\":\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQEBLAEsAAD\\/4QEQRXhpZgAASUkqAAgAAAADAA4BAgDGAAAAMgAAABoBBQABAAAA+AAAABsBBQABAAAAAAEAAAAAAABXZWJzaXRlIHBhZ2Ugbm90IGZvdW5kIGVycm9yIDQwNC4gT29wcyB3b3JyaWVkIHJvYm90IGNoYXJhY3RlciBwZWVraW5nIG91dCBvZiBvdXRlciBzcGFjZS4gU2l0ZSBjcmFzaCBvbiB0ZWNobmljYWwgd29yayB3ZWIgZGVzaWduIHRlbXBsYXRlIHdpdGggY2hhdGJvdCBtYXNjb3QuIENhcnRvb24gb25saW5lIGJvdCBhc3Npc3RhbmNlIGZhaWx1cmUsAQAAAQAAACwBAAABAAAA\\/+EGOGh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyI+Cgk8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgoJCTxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1sbnM6SXB0YzR4bXBDb3JlPSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wQ29yZS8xLjAveG1sbnMvIiAgIHhtbG5zOkdldHR5SW1hZ2VzR0lGVD0iaHR0cDovL3htcC5nZXR0eWltYWdlcy5jb20vZ2lmdC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnBsdXM9Imh0dHA6Ly9ucy51c2VwbHVzLm9yZy9sZGYveG1wLzEuMC8iICB4bWxuczppcHRjRXh0PSJodHRwOi8vaXB0Yy5vcmcvc3RkL0lwdGM0eG1wRXh0LzIwMDgtMDItMjkvIiB4bWxuczp4bXBSaWdodHM9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9yaWdodHMvIiBwaG90b3Nob3A6Q3JlZGl0PSJHZXR0eSBJbWFnZXMiIEdldHR5SW1hZ2VzR0lGVDpBc3NldElEPSIxNDA0MDU5NzA2IiB4bXBSaWdodHM6V2ViU3RhdGVtZW50PSJodHRwczovL3d3dy5pc3RvY2twaG90by5jb20vbGVnYWwvbGljZW5zZS1hZ3JlZW1lbnQ\\/dXRtX21lZGl1bT1vcmdhbmljJmFtcDt1dG1fc291cmNlPWdvb2dsZSZhbXA7dXRtX2NhbXBhaWduPWlwdGN1cmwiIHBsdXM6RGF0YU1pbmluZz0iaHR0cDovL25zLnVzZXBsdXMub3JnL2xkZi92b2NhYi9ETUktUFJPSElCSVRFRC1FWENFUFRTRUFSQ0hFTkdJTkVJTkRFWElORyIgPgo8ZGM6Y3JlYXRvcj48cmRmOlNlcT48cmRmOmxpPmF6YXR2YWxlZXY8L3JkZjpsaT48L3JkZjpTZXE+PC9kYzpjcmVhdG9yPjxkYzpkZXNjcmlwdGlvbj48cmRmOkFsdD48cmRmOmxpIHhtbDpsYW5nPSJ4LWRlZmF1bHQiPldlYnNpdGUgcGFnZSBub3QgZm91bmQgZXJyb3IgNDA0LiBPb3BzIHdvcnJpZWQgcm9ib3QgY2hhcmFjdGVyIHBlZWtpbmcgb3V0IG9mIG91dGVyIHNwYWNlLiBTaXRlIGNyYXNoIG9uIHRlY2huaWNhbCB3b3JrIHdlYiBkZXNpZ24gdGVtcGxhdGUgd2l0aCBjaGF0Ym90IG1hc2NvdC4gQ2FydG9vbiBvbmxpbmUgYm90IGFzc2lzdGFuY2UgZmFpbHVyZTwvcmRmOmxpPjwvcmRmOkFsdD48L2RjOmRlc2NyaXB0aW9uPgo8cGx1czpMaWNlbnNvcj48cmRmOlNlcT48cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz48cGx1czpMaWNlbnNvclVSTD5odHRwczovL3d3dy5pc3RvY2twaG90by5jb20vcGhvdG8vbGljZW5zZS1nbTE0MDQwNTk3MDYtP3V0bV9tZWRpdW09b3JnYW5pYyZhbXA7dXRtX3NvdXJjZT1nb29nbGUmYW1wO3V0bV9jYW1wYWlnbj1pcHRjdXJsPC9wbHVzOkxpY2Vuc29yVVJMPjwvcmRmOmxpPjwvcmRmOlNlcT48L3BsdXM6TGljZW5zb3I+CgkJPC9yZGY6RGVzY3JpcHRpb24+Cgk8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSJ3Ij8+Cv\\/tAQhQaG90b3Nob3AgMy4wADhCSU0EBAAAAAAA6xwCUAAKYXphdHZhbGVldhwCeADGV2Vic2l0ZSBwYWdlIG5vdCBmb3VuZCBlcnJvciA0MDQuIE9vcHMgd29ycmllZCByb2JvdCBjaGFyYWN0ZXIgcGVla2luZyBvdXQgb2Ygb3V0ZXIgc3BhY2UuIFNpdGUgY3Jhc2ggb24gdGVjaG5pY2FsIHdvcmsgd2ViIGRlc2lnbiB0ZW1wbGF0ZSB3aXRoIGNoYXRib3QgbWFzY290LiBDYXJ0b29uIG9ubGluZSBib3QgYXNzaXN0YW5jZSBmYWlsdXJlHAJuAAxHZXR0eSBJbWFnZXMA\\/9sAQwAKBwcIBwYKCAgICwoKCw4YEA4NDQ4dFRYRGCMfJSQiHyIhJis3LyYpNCkhIjBBMTQ5Oz4+PiUuRElDPEg3PT47\\/9sAQwEKCwsODQ4cEBAcOygiKDs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7\\/8IAEQgBmAJkAwERAAIRAQMRAf\\/EABsAAQABBQEAAAAAAAAAAAAAAAAFAQIDBAYH\\/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT\\/2gAMAwEAAhADEAAAAezAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQ17NesCYaxpZVBFxeuWM5sy7UtwAAAAAAAAAAAAAAAAAAAAAAAAAAAKGnZGbzG6mhqaNmpqWQAAgVLQqAKm3myEsjmykstm51AAAAAAAAAAAAAAAAAAAAAAAGvZC7zC9Mw+869IFS0CAAECgCoAArFChWJWans3oMa21AAAAAAAAAAAAAAAAAAAAFhA9Mc71xD7zRRUoIzRgoBAAqUgUAVAzRhoIFBBRUnM3rMblpQAAAAAAAAAAAAAAAAABr2cx1xz\\/XGlqIBQAgUALotAAgUAVAACBQQUBAnM3tcb3lAAAAAAAAAAAAAAAAGNOV7Y5btjFYAgFACKloAgAXS3mJKAultAAEChdFqgIAvjts76bOgAAAAAAAAAAAAAABD7zw\\/o5aeoAAgFAnuerTSs2ZcaRm5Mc9a9m1LFak1jWlZq2b+br0I2wAVigKCCgIGaMFI6vOu0zuoAAAAAAAAAAAAAKHId+fKdudAAAIBRUkcWwkM3cl1657pic56wGUh9SXzaxaXmCtY0LKgoBAoIKAgCsWg7DOuwzsAAAAAAAAAAAACw4T08YLpkUAAAgFACBtS6lgQAAgUAVAACLisYwoCBUoUgVPRsdJmUAAAAAAAAAAAC04D08YXpkCgLi0ARcWqAM0YSgAgAVKQKFxaqAAEChWKKAgCggCSl9Nx0qAAAAAAAAAAADifRy5rripQFAAAIBQBWKAlcamcakM0YTQ1mD3nRsFAFQAAipaViigIAoIAR6VnpLSgAAAAAAAAAAQPTHBenkBmjDVAC+JnGrTERW8lACN\\/N7Pj0lMaGMw0BgI\\/WOQ6417AVAArEnm5lERZjAEXFpQQBWOwzvr5oAAAAAAAAAAY08y9nHVsAAqWg6Xlvt\\/P1HJ9ufH9uZQBM89dxw6XS2GOgBQ0jME4bvy0rCoAGxL6nw63mjZ5f15UUBAFBACOlmu7zsAAAAAAAAAAct258b6OaAAKAqem+TvvZth5f6+GCy1QJDN9B83XLLrEbZr0KlC8lZdcFLOA7crC0F5Ydjz31vPY4fpz5jWSipkjECggBHSzXd52AAAAAAAAABQ8x9nDT1ECpQFAT3PffebqOc644bvyBQPQvN1lMa1ilAAADAWlSI3jkOuEC8rHqfDrnXXTy7tywhQEAVi0AR2Gd9hNAAAAAAAAAARe8+ceviEAAUB6P5e0rjVDzT1cI\\/UBRLYvf+bthLKoaiatYLMNWFEqt0SObtLkTzzvywgHU89drz6DkN44\\/phBQEAUEZjCI9Hz0mZQAAAAAAAAAOS78+R786xQAAoS2NejeXsIbefPPVxQCjruHTp+W9Gua3iM1LaAAAoI6nnvfl5brzgtZFT1Hh13JbDyzty1rEFAQBQRcWm1L6pjpcAAAAAAAAAAcD6eMF1yEAAVO+83Wc57Hnfp4ymNSGbrWcZ3wO883WWxrjOuI3UysSevNFZ9VjQE3rxZLmJx6tSdd\\/N6nG4PeOW6YuJ\\/Gu95dBzO88\\/rPS40ON3jVq0QBQQB22N9VNAAAAAAAAAADzf18IzcCAAN7N9M8nepG6z5r6+Ponl7TGNaGp5p6uNp6D5uu7jXn3fmJ3Xhi56pO+WDz7gJ3XhtXQnfRz22peu57ht45PpgemcOslLQ8x7cpbN7nn0HmXXnG2BAFBAkJfTcdLwAAAAAAAAAAeZ+vhobgQAB2\\/n69Jy2OE9HLnuuPRPL2mMa0NTzL1cR3Xn6ynPXAdudtbl4yevNFZ9WrOoF7OW51c9BuZvWY3A9McxvEzm+i8eog9Z8+68+kxruefQeZdecbYEXFpQReel46SUoAAAAAAAAAAHmvr4amphqsUANiX1Dx97zDZ576eVh2\\/n6Smdadnn\\/p5R+p1PHfScenG9caOoAAAKFIEjnXUY1yPXlD6nonHpNZ0OJ6YidZnsa67GxwXTnBamIQAEd9jfQzQAAAAAAAAAAA8+9XGF6ZCABMY16H5ewAAA17PK\\/Xx383vfN257WYHpkAXJN68WnO0dPRbAEzjU9m+fd+Vh6t5+uwoAAA846c4fUQBmjs876bOgAAAAAAAAAAAOM9HLl+2AgATGNeh+XsAAANezy318bo7Lh02sa4ztgASevNgm5G+eAx7gEdfz3D9Mc30yj1bz9dhQAAB5x05w+ogDtsb6nOgAAAAAAAAAAABA9McH6uVBAAzxJ40AB2HDpI51qWcP6OcNvI2I73zdoOyC6ZqDbvHfvCqQWPcKS9JjWzZxPbnYImc26UATeb1GNjiN457Wbjdl0LOoxrsM7AAAAAAAAAAAAAw2eW+zhZSAAKGeXBYB6J5e0xjWhqeZeriAN3N7fz9Y4gN51rBlubZcUu7nXQ5ta4rtyxWZZZ3GoTWcFAI6XGu559B5l157svUY3QzGzGwXAAAAAAAAAAAAAHAenjB9coqUAKAAE3z1tZuGoDpkZow0jKdVw6zeNaKR5jrJG+Zzn+mOf3kuZOq5dJHOrE5TriKud6Wq3SSUog7O859QMpkLo3C4AAAAAAAAAAAAEPvPnnr4oFSgKAAAQLl6fjvpuPTku\\/OB6YtloZEl+e9qMuNYV0emIreUbRuY3JRM42BaUNsyQOZ3jld4lc77HG7QVM5UyxtgAAAAAAAAAAAAsOX64ul0N557tztBQFxaC+XbzbEnee+p49MVWJDbzEU1nBVgS3nvTzZXpncL5dgG7jWzKBhMxUFTYjnd5j7JPG5IoZSpmKkhAAAAAAAAAAAAGua9YjGCH68+V78xQAujqePXoeW9coWm2AYUhd5rWKMlVIWWOyndTerDGYkc6yygDXMhlAAOQ3z7LHTbjSNWtkobcbwAAAAAAAAAAAMBrUMBaCicH6+OKygKnaebtP89aVWFphNwyAFpH6zF2ZgRCxsSZKWZ5ZLNqtAAaxcZi4wmrUhGrZ0ObU1jRMdbkbpcAAAAAAAAAAAUNGqGMxFSwxnMejlFdMVLSV577\\/AM3XSqwFphM5sgAFhq2YE0jTWUJOMy2GEAA1S8GQ4zU2I66WWi8AAAAAAAAAAAAAAFCNq0sMZaZYhqhPTx19Zw1U6jh13+W8xlBjMZeboAAAAABYYQADVLwDmbOzl3IzgAAAAAAAAAAAAAAA1DRq0tJWNgjdTju\\/LoeW5XGr5dSuVsjq7jNGAoXG8AAAAAADXKAAwmMvBlN6NwqAAAAAAAAAAAAAAAChhNc2TMAWmAsLS2qHFanW5uItBcbwAAAAAAMRjAANFMq3GYloyAAAAAAAAAAAAAAAAAAAAGE1aAtMBhKAsNs2AAAAAAAWmAAAGimCpmJWUAAAAAAAAAAAAAAAAAAAADEadYChYYwVNayYlAAAAAAAGsAAAZSSi4AAAAAAAAAAAAAAAAAAAAAGMjzXs4708pblvbzqyJuXIAAAAAAADXKAAFSUjIAAAAAAAAAAAAAAAAAAAAAAChC7zwXp5Y7N\\/Gu\\/8vahSgAAAAAABgLQACRjYAAAAAAAAAAAAAAAAAAAAAAAANWzke\\/OC3n0vyd7THQAAAAFhjLSgMZcXgG\\/G0AAAAAAAAAAAAAAAAAAAAAAAAADSsyS0MNAC00016AAvMkXlShgMAqTzZAzgAAAAAAAAAAAAAAAAAAAAAAAAAAFpiMJZWqaVm9LsgAAAAwFDLEgXgAAAAAAAAAAAAAAAAAAAAAAAAAAAAFppl5YW0AAABfFxsF4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABaWlpQAqXF5UAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\/\\/8QAMBAAAQQBAgQGAgEEAwEAAAAAAgABAwQFEBESExQgFSEwMTRAIlA1IyQyMyVBgGD\\/2gAIAQEAAQUC\\/wDUpWIRT5CoyfK02T5iovG6y8crrxyBeOQLxyuvGqqbL03TZKm6G3XJMTF+6kuV4keZrCjzhI8vbJFdtGnIi9Db8e1ndkNyyCDL3BQZ11Hl6hqOaOX9jJPFC0uagBS5myaksTS9jNxP9Hd9Wd2eLJ24VDnAdQ2YbDfqiMQGfMQRqbK2pU7u76O3C+kQiZd7+b97kDxegzuz18vYhVbJV7P6eWaOAbGaXFNck9Tby+vVys9dVrcNof0RmMY2sypJDlL0vLbv\\/wAnljeKTV339Hf8e4DKM6GWGb9DcyMVVWLUtovSq8TULUTEMtXhAsfwqOlxg7OLljtiiqccUNMNoBY57VdprnQvzhgcofDvOKrxQ5AWG92Ptv6MnK1xuU4fvezXstv6joLHLo1phG1NaF6+0TlHcB4CJyPqovEwOvLW6qKWeJ2GXqISsdVDDIZ1o6rWovEgkgkqXZRmt6P7+ps+2mJyH3CIQG\\/kSsv9A7M8gfSEuEzLjPufbtxtzq6\\/2XdhbIX3tH2vt2+W3ZFI8UnobeWrvv8AVoWeltfZyt7mEvLb1mbWHG2ZlHho2Q4uozdBSRYymSkwqnpz1\\/UZ9tN329PGzc+j9fKXOnh1lAQk7BFzNsTbZ\\/CbikxtmKPurU5LT1qMNdcK3Zk59hTuKsY2GwpoZID7383ixtqaPwi4vCLikB45Ox227nfdYE\\/L6xm0YWJysT9rPs+mGr8c2maseXbQoPZcIxYHcYhc9+132YW4nUscdqO1VOrL3V4XsTiLAKuT9NV939PBv\\/d\\/WzVjhD0Pd6cHTVkRMA2JnsTttvrSqvanABYXfZO+6JzrLrJjX\\/IGuRcddNbQ1ZSd\\/bSaELcMkZRSO22pCQEsJX2bTNWOObVm3eSMopO\\/Bt\\/d\\/WtTdRZ138uzE1+da0zNjl1+2lW6eu77M77+i\\/vpla\\/Mi1MykKMHlkhiaGJTytBCRcyTvbbtwIfWyMvJpejjq\\/T1NL1jqbXZjYedcFE+7p3ZkVqAU+RgZPlBT5Ql4nKvEpl4nKvEn3isRzaMzG0sbxS64SvxSaZux6cUnKk0xUXKofVzknkmd278bX6i3pk5+VW7cOG0BeQySDEE1+WR3dy9FncXqz8+NvfLhw3NGZyerA1aujJgCxM88\\/pPtpWhexYZmZvq5guK93u+74qvyaumUsc+3RxkFip4NVVnFV4q2mNHaiauz82ZRg8kjY8tyFxfWvE0IBPDMrMTQyqkfDZWYb8EzbrD1+bZ0zVjggxtWO3N4LVXgtVWohhtM+3o4Wrwx\\/WyL73++lX6m1pfsdNVWK\\/j1d+E22mP+HK+2tP\\/AENNLzMhxcGsfBNUhpEMtuQJZVW+Ssv8fShX6appdsdTawfytMh8\\/wBClVe3YEWEfrXvnd+Gr8uDTMWOZYWK\\/j1d+Fpiy3pH7u3CSgsnCuoqsc8zzHqJOBPPK+tT5SzBaYuvz7emWscmozbvg\\/laZD5+rNv2ABSHRqDTg+vkG2vi8fLTu79leF55xFgFSkQxFRuEXh9tY6M4qSti51HoWhZYeT8Xfd7gcFv06Lb2llJOO6sXX5FTTJQW7Nrw+2sRVngsaXKNiS3JGcR9vusZj+mH7GWHhv8Adiv5D0J\\/jqlNyLSyYefYIuT9FCKsVXjfsxo\\/kRtDGRORKD4\\/oZX+R7JJZJzxmN5P2s4H9XuxX8h6E\\/x2ZyKQCikx1nnwWoudX7KDvz7W\\/UDuWO183etDyYsrY1g+P6GV\\/kezGY3l\\/bzEfHS7oZjgk8Xtrxe2vF7a8Xtrxe2qExz1FZN4qxZW0Q6QTFXlhmCeO9Tdn1rEITzVuaR8Favp7vUqcpW7TVIv8y0HLWxHxe4vF7i8YuLxi4sXentT6W8naitTTHPLFXmmT46ypIJYlisd9yWNpYiZxfT27Xk3i1xX8ervwuyraOrJDPHYCxjwleSCaFcTac02AjIlxMoqk0ygqxwKzaCqMkhSmo4ylN8S\\/DLDJCXZg\\/laZD59Ck0jf9JvMRPZM+\\/3MtByrejvu\\/oV8pLWh8cnUuXmli05MnBpHKcJwZMCZnYmmqwyJ8bC68MBNjYGUdeKNGQRtYyi4n4iZRQHKqdcYWRgMg3KJQIRI3GhZJPj7LKvPNj5fHJ145OjMrVnhYB0HRn2TPu32snX59TVtvT3fajjN0TCzXMfsZAQJm3d33eOWSJxys4pssC8TjRZVSZKySIiItndwqSknq8AQvzW22bR0EYRiMmzcwXRRxyNbxKdnF8cG8z+erPtqD7P9pyZk+Mg5nQVVNi\\/J2cX7GbfUQI01Ow6KrOKxlLdOW2hCxiYcLtEEsr0RT0iZdJIS6OVSRlE277hWiNDViFMzBLpDA0PY\\/8Ak3tq0qyFTmhjj3LnlHJ\\/UXMXumfZbpvf7JHoWuSrscXaIuRVcUy5IRgn8kJbFrLG0oNA8DKXyjbyZTxuCcvOtFwMpfb3QR8HayHun\\/s71WISY4k47rzAvdlCPn9gy1f30cWKOQHik7MfS5Qu7CxE5aF7IH3DV2YmOu7KVbrdWOLid2VUSZ90MByKKEYQ7R\\/xTPpJKETDerk6Ok1qfQ491JG+0bEhhd0zbN9j30d9eIUcrLIN\\/WXlssfDzLDfiJFxPoXsovftIBNFVB09R1LSnNeESKHH8tDEAaF7do6sSsSvNNVpyWVDXGMRbhb73\\/Tvs7loR7Jgd0VZ5I4YjGS5JzJ4ojmNbOsWO0B3oRQSBK2haR\\/7fVL27X\\/GbXpCe4IsAxj+hlDQ32aMd0Ee2lyEpYYcZPKosVACGvGCIG2KMSG5QeFQSvDL2R\\/7\\/pyhxgBcY6Rt+QNxP+iKJnT1t3GMQ7NlxrjdOTvo7bsdV+t9md99YPOT1i7pBeMhJjFR+4Dwj+pMN+ziZH5FqZcAQA4Q+sXt3HA7E9rgVL+rH+rIN0X4p330P31D+4m+uAcbszM36whYmONwRE0YBcmCQMjG66uu6ZztuADGH0H9+1m3cB4R\\/X36ZzwHGcRKiwvbAG2fyf6Be\\/bHHwt+xnrxWBtYeSNRu8U8aP8Ay9NyFlzomXUwLqoF1MCeeHdjEuyOPh\\/az1IbLBHy2k7XdhYrtcF1\\/EubcNcu8S6SV14fG6bH110VZdJXXSwLpK6KpX3ejC6A5ITZnJwjYf3G26eNOLtpYm5IDSeRDXhD03909VpQEWBv3bszoqolNy3Wz+kwO6aBMLD\\/APBbMuAVy2XLZcpctly2XAP\\/AIL\\/AP\\/EACkRAAEDAwQCAgICAwAAAAAAAAEAAhEQEjEgMEBQAyEEURNgFIAiMpD\\/2gAIAQMBAT8B\\/tLKkK4K4K5XK5XK5XBXBSFPdyFcFeripPAlXFXK4dncrip5Uq7rS5XHoZU9QXrPSz0pd9dUD0JdCJnbGEVChRSFCihyopChHPCB55d9bs+kFNJpPuk0lTSfdDwweaXTwZ6ActxnshynHiWlWq0K0K0K1RyhyHGNq0q0q06wJQEbBbtQrSrTut5BM7LRV51ATtkSiI1ip3Rx3naAip0gTukTrbV26OOfey0VcdQEbzhxm8Z2NpogVJk6W51SpUqVKlTsNq7eHGfstHurtTKzuuzoHTuzstHqrj7Qb6VoRaKtxQ0e60Sv5Q+kCDjR5X3mxqd43s\\/zleJ97ZoKOq2rkArVbtjjuzsATUmBRuKHFW40fI\\/3HtfjbEQvixJ0PuZ5L49LyfIBbAXhY5rYNBR1RUptTsjkHOw0VcaNxQ4q3GjyeIPX4vMRlePxhg0EAiCvxs+qijqCpo2p2RyHZ1jRBUFNxQ4UGjKHcFHZoKmVBTRUjYA5Ls6252TQZodJIGV\\/IeZgLxeYO9HOkbpzqA5T9bc7Jq06vkxYvDFghH158anHcOdIHLdjYuKuKuKuKuKGKFXGoQMojR5gSyAvH5rBa5Nu8r7hpJjRcVcVcVcVcUDUmsUA6luKHGkGEDKhRWxsyg0DFIoTot1NqUB0Lh73A6Fertc\\/dYUKKlylGgFSKQVBWFcrujcPXADaFtAjS5XKaEmsbZbRvR2BWhFm1aVBTRqhQiFFYUbxCb0zhrDfvoMHpz60tEbccYjp350NHvehQo7lx96GY\\/SCg0q0f05uKvUj9KcJq3P6XEot\\/TiJ\\/wCAX\\/\\/EACcRAAEDAgYCAwEBAQAAAAAAAAEAAhEQEgMgITAxQBNQMkFRYIBw\\/9oACAECAQE\\/Af8AUsFWlWFWFWFWFWFWFWFWFWFWlQfd2leMrxqwK0dCArQrFafZAEoYZQwwoA7UBWqPWDDKDAM57Vqj04BKGF+rRvpSPStw\\/wBUR6kj0LWEoNA23coFSrldS5EoniEUDAVylXKU3jpEd9uH+7saojTRAarXQK2kG2FrKjhFQYChayo0WsocdMjusZHRgegPbYyOgdfRHtYbI16heAvIryriryvIgQe0exhtk5Bm8jV5Gq8HOXQi4nYD1M7NwVwVw3T2AIEbOIdIrhj7zOdG2DCBnOajdPXwh97TjJqBAyudAywtFpmBjO81aN09dogbOIYFcMazmcZO8w\\/XWPWYJdtPMmrRAyvMDLCtKtVqtVqtVqjO81aN49bCGy8wKsEnNiVDdsijOMhM1HpML47OIZNWCAnPIK8hQeSav5o0VtyhSjR1GVeatCcYVxVxQ2j12fHYcYFWiTTE+VG81fzkFHZPpQjQ8UZUmTUCE+o49Cz47GIdYrhjSaYnyo3mr+aCgKkI5Zq6jKOOlWjWj6jjZPYZ8VrmJgTUK5qvanmTRvKuFMQUbuOo3ijjrVsBSE41B2Cezh\\/HPifHZHNHCRRuaERlchU7LeMxPaws+J8dkc1eIOYIr6zMH3U7LeMpPbwjrnIleNq8bV42rxtXjanCDQcqwVIlEQgcgRC4rKJTROS0K0K0K0K0JwioArNCe4DB3cT5UbzlLZREKVcpySrqATkvU5X1HCJ9DhmRuFgJXiCGGBWRUiUW\\/lZU5Az9RCClONQ6aXBSEdVarVx6LDMHoOf+Ua\\/9oTCAhRKsC8ahQg0UClTtB1Hej8hXkchifu1cFcE931llXK5ByuCNAVOQnaBTvTYbvrO7E\\/FPTJ3OQj6YGRle6dudid6Y9Ph8ZHmBvSpU0n27BARMVxOf4hsTqjiAI4hU1n\\/m8I\\/3g1RaCjhlWkLj+JYQDqpmj+P4sEhDEH2jqP40OI2IULRaKVKlSpUqVKn+An\\/V3\\/\\/EADwQAAECAwMHCwQCAQQDAAAAAAEAAgMRIRASMSAiMDJBUXEEEyMzQEJhcoGRoVBSkrFigqIUY4DBJDRg\\/9oACAEBAAY\\/Av8AlLnRmD+y69q62f8AUrF59FqxPZdXE+F1URdVEXVxPhYRPZa5H9V149lSPD\\/JUIP1rPjNHqs0Pf6LMggcSqOa3gFWO\\/3Wc4njoJz9MqhWbHf7rWD+LV0kH8SquLPMF0cRruB+oziRGt4ldG10T4WZdhrpIrneuRIdixxtmDJdZeG51VKNDLfFq6KIHfS7znBo3lShgxD8KjubH8VMmZtkdlsnxLgljLQYS0DWiHJwxdPHQzBkpP6VvjipB1132u+j3ojw0KXJ2f2cs+LMynnHSz7Rdf0jNxU4buI2j6Hee4NA2lXeTD+5V57i4+Ojx0AkAEWEgy3HIHhoZZYexxaRtCEOPJr9h2H6Dd14n2qcR3AbBo3vhwREfzkqsvUkuTl7WwIj53qSTYkOIIrS67Teog59hdDbNzUy9GYx0TUadqIOITmCOwxAJ3EIkSM2EHGTZ7VylsYgOhj2TGuMgSnta6GxkMVIbK6oTGxGubF1XhRYk+rIVzn2c5dvBm9c6+K2GCZNntUUNAA3DJphom81ewre32iDyg5vddu7dMow+THi\\/SCs06G15a8xJ03IRI5J8TWSa3nueeIodqSXK4zXOm6GZtLZXVCH+oMEwxIjm700XEzJKMe9mXZTl4KFDjRDDMInuzmuVF5LGxhIGU0xxwBXKQ5xEONg6WC5M2GS9kEmbpSnNR4cOMXmIQRmyUONezA2WHgmw4sQwzDcTqzmokRhm04W79LOVLRyaKfIf+u2FzjIDaubh5sL99huPiuc3cT2MOkDI4FF0g2ZwGWJeuTndYyju1EkyAVxlIQ+cqmSN+SHgAy+4aGfaWv7po7h2rmIZzBrHfZ46c1lbO5cbvdRdJGLvKF1TncSuo\\/yK1Xt4FdDH9HBdJDMt+zSYTslOmkYTi3NPaObYekf8DILWvDx9wyQ1omTQKsMH+y1B+SMR7QGj+WXm0YMXnAKbG33fe5VrZTIuipdsV6F0T\\/gq5EbI6ERGMzThVag\\/Jag\\/JFjsW0OjwkosPgezl7sBVOiu25U7THODMONreTjbV2VffSEPlBobdYMGqZo0fCpkzK5097DwFnNxRwO5XH+h35bIQ7xQa3AUFj4m3ZxU9I8fw7O3k471XaGQTYe3bxsLnYBPinvFVwyLuDRVxQDRJrcBZVZrC+HuGLV0XJneq7jFXlK\\/wDZX\\/kRrw+0ZBhPx7p3Iw3iTm5F1zS07jY7lB20baIAwZU8ciQ2ow36wx0Dz\\/Ds74m80yCMm+dWHX1tEEYxMeGUGd51X6Ycpbi2jsi89xcd5TYbcXGSbDbg0WOiuwaE57zV1dBUyyYsTgOzPO05o0TQdZ1XWufswbwyWz1WZxU99tVWK30qqXj6KkI+pVIQ91qMWqxajFnQ\\/YrNNdxsMN2DhJOhnFplkO5QcG0HG1vJx5naMPuNfLY7C1m9+d2aFD9bDLbltnqtqbbjdeJmjKiRPudKy+8yCzMxvys4k8dDMGRVdYY2XvvbO0AYlMhDYK2F7sAJlPinvHRiVjIQ2mqkMB2aX2tA0E5SV460StplqszQmxX35ncVjE91EiNL5tbPG2F4zPzYR3WUsDBtRm8eCkRLI5+JIiSMEMu3ldBnYB91LIDuIsxkudOrD\\/dogjF+PBOZEnINnRYxPdYxPdRIbcGlGmhPKHCrqN4dni8dA2HsxPC1z+8aNsh+v7sjeQqosgcP+0TutfJkyNqvXzNMJAyBCD8\\/dNXnyk35U2CyHxsg8Ta1neNXWvibMBwT\\/JbG82hDO7i4oNaJAdnjebQGMcX4cLeaGEP92Q\\/X92RvIbYf8SQii3cZWSGrOqBDdmMkam7sGReaZFHPNcbYdkFngTYCdVlTbdGtEpY\\/yWxvNoAxomTgrveOse0RfMn3gb\\/dsqchkId4oNbgKWOc1t5wFAi4wXTK6hyYx7brhOlkVrRMltFMwXSFkSF\\/YWP8a6QeAsI+wXbATrPzjaS2C4sbRq6hye6LDLRd22xnthOMzTxRY9t1w2ZfOxB0p\\/x7S7xAOXD9f1oYnlNjXnVwNjIn9cmTRMpl6Jj8ouYJw9+S9\\/onRXYNCLjibIflGhien6ybzzedghGjDpNg+3tUOJvEsuH6\\/rQxPKUAMSix2IV068OnonNGOzJpuqnTRz8iQqTggzbtQ5O3ZV3G2H5RoYnp+skR4wz+63d2u99hnliJD1gtYfitcfitcfitcfitcfimRImsbIj24tbMItLhI\\/xtERuz5QiMwPwjGhCneGQC8yC52G4SK5t2detkBMnYr76v\\/S\\/3HaoVXeptDQ4SH8Vrt\\/Fa7fxWu38Vrt\\/FObFIIDZ4WxIbHC600ojEiaxXRwyVSF\\/kukhlqHKIw8jf++2OhnvCSuu7ugay40S7205EP1\\/dkbyHJm2oOLd6vwzxG5X4ZuO+CukhmW8W3Lxks5xNmFxu8rNE3byvuibGoveZk2BjBMlUjC9ukrsRssl\\/ktjeZc9FGZsG9SFBZVV7bfGEStszoRCaxhA3rq4adDMNknCVt\\/m3Xd8rb8N0igI2Y7fsU2kEbws6GFQuHquseqlzvVZkMBTiODR4q7ycS\\/kVMmc1NUw3ouHvZce28FfZnQ\\/0pNaSfBdX7ldX8ou5upEs4Lqoa6qGr0pOiOQYMGiX0Ey1mVGRXRy3oRI44NUgr0KgOxZzZWzhvLeCk4Nes6AfRy6l6zYHu5UIZ5QrziSd5VAqi7xUwbxCF1XRstlvUmNAClJVClIEK\\/A9lIiRRf8AYpj6E5xLpE0aur\\/yU4Dv6uUiJEZJrbmtJ4LqiqwnIRog8oUhZIq65OkJNG5UeVrhXhKq2KslgusLpblqz4qQEg4Wl3ed8aHOXOsGePlRJ4mSuSPhKyoUx22QyefGs3HKutEyVejV8FQSt8DkFuHirp97HKVhecJ2Xr07wsDvtVFM62T65c26pqmxyMRmqbbZiyfaZZT2nAhFh2ZN5wzjj4aKRU2V8EGnfacbtl\\/YRZWgVK+Oim90lK9LjZDc7VZreNswsFKRVe3VWKuDagfCw79ll44MrluHrlZwBVJhUcFdBZdVXtQvRSQNio3QOG51tUXH0U9Vm9Bgm7ipfQ5N91MqTc0704xMRRGWDaK4wTNmCc7eVdMVTY4HJ\\/r2TzjIELYTj4INaJAKf0GYslvU1M2O5rrNizujHjiqi8fFZrQOAsLSKHcr7M5n6QcPXJ\\/r2SmsKhTFs\\/osy5UycMiRRgtwn8ZMR39ey86wTB1mq80zFklL6VMZM5VyC47EAccT2a\\/BN120bCulhvafBc9dIB1Z\\/VP9uGfc9okcNqkMB9NqvBF7sG1RcDrGZBWe0t+V1vwrsObYe129BrRIDs8gpfULsEy3jerr2lp8bGB4mCpCgHaJnH6ldismr0DpG7tqaSJFrtNVwXWM911rPdda33XWs911rPdZrgeByJnH6r0jK79qAnOQypkyXWA8F0UGI\\/0WbAa3zFVjMbwCzuVP9FnRIjvVapPqur+V1QXVNXVNXVhZoLT4FCHGN4HVeqLx+s0toJuNGhX+UuLnbtgWbDb7aW7EwUh9cwQizM2igsw0WCqVQf8AweFmKxWNmH\\/Av\\/\\/EACwQAQABAwEFCAMBAQEAAAAAAAERACExQRAgUWFxMECBkaGx0fBQwfHhgGD\\/2gAIAQEAAT8h\\/wCpFAlYr1MwVmfDZ9q1Z0fBQsdBVHD+D5p0PJ+VfQPmvsHzRqj4fKhsh4fmsp1SrGh1RWT3goqTOT+ayTcCT5FZ+OUD1pfn09fXX617R4+1OT1BPYcAzHFvIyg8msSeU0rMiPtatNvP9LVtb+mKCkHrfkoJJoQ44VIADkS+teTk2eW49gnmx3IAQQZHHbIgjUqIB\\/ZcajFnWPKpZyab+X4tkI5SCpbknbzVMg8G31zSpSZV2usUqGGdq0ExlK\\/DfLOJpSIJODTsJziX9L2IJCMJUEnI\\/dUTM+Q+HH8P16hrT3ifTFSdgUoy3DtcsyzETfvEQnPLnRq68mW34MS5hJFZfCvsUpedV2YSrBMEZ7BgWBM+tI99cxuLcCyLEdjPRiZxfz38eIkrgDf1YfwIqOgcdav3mj7HZmIf5AoireNgJsppWXOwJHBDVoNxhk5U6Lhyp+FGVCQlLEl4mUiaNstds6Jb\\/llyzahnCitYPd4CcPFqeRncRbNqhLgicZYqdpXkpETRlHvFv\\/VF1SQEGDcIm+KuLrrT2TTACOLqjltVyuC+h5d+URADK0liGPh+aVVVlezAELhflRCVMxhxogDCRXos86z1k2YCm4XY7kWWnhCtFnCOlTKCVjNN8J5jNvvT9ciLFZ8GjTBSiIi3hWEgr50T9LDLKS1CU6dYIKkhdjhDigzUNMs2+9FtqxYv7qbkSURpsM3YoAgYTZ49razSYGLTtWeRr3wbc0q0p0iHn19xNlncxiqzBZ61neTDAdN+zcxlx3BRkYSsw9Q4PejLAlXSp4KbHvd6ZtQgyzuuJPFuun9Eh2LAyL6TfcsLBBFjsoYns2Ufenepe+bGvh02NmB4me3BuECSddp4JFbLdwiqBdY9OL7PGsN9LrQNwei9au4ODfzdoEpMiL6bIEFLJx7Sc0l5H+R3jAAf9NwkbwEDuz7HBzoijcI1\\/LUemZWG+0YVaFn1JbhV13R5Gl0Uss7SwSwFjxo5h4J9ilbj9d8YRiY40pGAnQonDlJK\\/nq\\/nqh2msM33XcMYGzO9YWQItrV3aI+z+u7tbBya1kNjgaG9FwGGYSTbG3T6n+bY3fqjeuPbd1fAoEwICrbDUhcPHdBkgLq06HGj9OtCmK8Gpy+VJrg3PA38lMC8DVo\\/oODlsPQRHWxSqJlcvaRcY\\/c7vKm\\/ktPvLsQQCVwUOjiefVsYqBleVcokOBpURiuoGNwN6UyiWmgqM01X2th5VMhnOvM+\\/jWmDoVDjzlF5TvoPWhMNtgvLiqm8CEpYylybM7XQjkIdkL\\/wBLV2zl91f577jHmUFFpCwJnsJuEfud2UCXBT6P5DTcIQC+sY3bZ\\/UNsof1G9NZrXPhQVIpexMPYMM0Qj1k0dxKw5SWjpkgrQ+GzVsHWpc5FITfsAp0HDds9J++Xdo2YHzP8nsoZR507MEtQO2vgN00GfQMetGys06YbAJQHFr3cP0r2x\\/KtRPArQnrOnQ9Sv5b80anqVNYxQT47NsvWuXjWQULchD\\/AF3p77bb\\/pY7MlLhblbb8IuPHHpHdrFcq\\/Y\\/ewQKIQ89+ECf5+1FW7ljrvcUAPQ\\/tL2qfQD1pQLpftT8q8VPYNCXBhK8MfypQGrJwXjx+tplykBxrIRecXXYukOTlWTGSOBodnoiWvLrs57E4GtAygIDu059hP77CbgkzBgqPOLnpp957Yep\\/wBxpNLucGelfyPxUuBBI+NvWNPrpTuFMa3IHPV2OqDxVCBQXBmpcuo3L7BaRMURCGxYjr1q2uiemxtOCtk\\/01tlxZAm+tTg6p7Nst9foU5pgJxqV\\/M\\/FfzPxUydqTmoFhki+nY\\/a5E93n\\/R6dgkFn4KgAgIDZAzHmTs9d7mz7jhSEyNrQxfZ657q6CVM3cuxkyqw1qEkpJvnlQQgTeHXcPWIYPxR5GmKWbiIWIl3N+y4G2WiPMnYoEtgpJzPwVfb5naYcZB0BQYBwBod39Z2xGd2EP6zbDrxvds9d7mz7jhth39Sf3QkmnYy3k2XGukIqPPkY0tZF7TcOQDDSzevbRPWfZ2WuF7D42R5n\\/ONss8WvTX7zq1SFtWvt8zfxZxoTncQW+Aa0IMN7jveID1UEnqJjY4zsgJGCCdzgMi8DWiug4HLYiKwOrS46SvHZqMrgursXMuA1pqUErsmnXE9h\\/VXBqI6OPj\\/s9i7ZhxX9fuglCoKbB8vVdkfPuG0GM9bns9AOiPFJtIDSsLURFkLdRMkUCgCVwFaanHB895mf8AIj9b\\/pvc7H7bhsnpC8lps1bfNe5+92THgBNZANQsUSIHFuyaYA\\/fKtW5dXQpGZWV2fRcOx+9ybsx6BKKESyz\\/V+9Q8d+V\\/3f9N7nY\\/bcKzhEFCPDwkzUC9iXPQ02js9ZRuBQCHNRNvMzariJA\\/yl2gA5UDjUP3yXFoVXZ\\/C2\\/RcOx+9ybsW7rp63n3uyS5+DFQgMWcbyNBgUmv46v4qv4qv4qv4qkaGSUI12PfDKIONhs25bcjg4UhM6Gq4NTFFc\\/coRJNrzA1qeU4rmrASlgy7bi7CFafWsgIS6HOrolLK6m2BDYLK\\/kK\\/kK\\/gK\\/gKgGhRC8m02ODI0ywwyhFYU+OnnWeBYtFrzEktXm+nu75icWjWaUkcNqKhITTdKVDWBk47nrvc2fccN3mCVil4k1M9VOJXmj3sIqTWpohBcNIywcWkNfKo59c+VE5jOZpDiLoc2n75zt+iy940DzqRl++79vmbmX0g\\/fwrAADAYNkIgJzpbLigEj3yZC159fvPaiIq5XsZzI3lOa+k\\/NG+KST87RYOq42lEHqUeM2jL4o6xYSSlpu9Qh9K9Oun3ivXKpl64xLXUfTNPC7jzeBV4xZLrUFmGlbI42KKi+JauxOJdGpWfia9dckJCaCkZ0Ci9XQVwt0avsPzX2H5pihgDF6ArBBtdk2O5KCY73PTP+8bl61SHDr2ZNLZXONeMBdOvxQqib1jPFPw3VtiJcLmzUCOi8kPpTMD6cK\\/qFaJ9f8qtp\\/0u1zUWS03uZ0CsCCmXQlEs0cTdtHCgHg2naUOCPCuUog2EGkKXpDSiBsPlfinLgsjQukwt1roTtkTQyW2W3R73mfKppEgLBViJnOVBJq\\/S9O3WCOm7AsEE312pQzyTQ0ni2oOYnImpXVL3oB6uxxrU6BP7rQL2iWmYnUmjlFDjUISIkvX2tFGebWaXodY1iEV+yk1EhYA4m18uabhSuVvvpTnaFGRirUCaBLBuGioNCBWIodaS9SrOdGjy6sJJKRUBpTAb96+d2Zm2BOjzm8GRgBUQuPIfNEKRMRbYoTV2wkJ+9xSMksNKB3vdsXgooQcBsWITso9FcCAxGywuqfDWi4LlxFHrfZuqZeb3pQxvBctAcnJU3ByDA18BRZ5qfuvUgYnZLL3mK3x2udrMiRrOIvPczR4df4V7bKQl8trmzhpyXOHruRgkrSBSYARSQ1DjUONSzzPlR21TuaS9To2BPq0GLgRLLWd33n32T212R\\/HTnV9vQihEkbNa71D0FBBBjZP1eFJyyUJVE8qYmwoIDvCwTSyl2aZsSMg619JQ4yeugOK2TMnkbCiJ9ZpQOUU0umm6Pyn6freAiExJWSU6ldSjmXcVn2oZt+ktdGcEFYqnj2FbzD1v+9wLNabOBSkbGX+qdjqaGF39JRxq3pUmKCXYhfWliuhOhQTWUEpIUBykWJjZzHlQ6p7dK30aBNR3PLarxscQ4+x\\/3uj4Wx1P89tywKSiiOooCoCeX8DPsrPzlUqyeFDqXhseogPFTEnoPZUavxn+qIjo4UCZXG6GFBrupxou+tnEoZJKWCabuz0ve\\/526QxupoVl50J2uJweG0GYuFq6CZ\\/B3MtQuu\\/AoizHHcdQU8NOlQELsBgkbJQwnIPCluUVI28oCDwv++3N53m6MC15nOjgE12SYspahLzfiuYNqxQjUYwkXaVc7RxIedZlfmt3txO\\/fHTLTgmuCRpgeKinH8YV5ZpShL0mWxT0m4Y0vMn747xPFLIoDIAgDT8bHh40lx4qxyEqkWiXIo+98rKCSDzVDvV+eQrTTLuOTeQsjQxPH8fnNNAqZX9qYmOQbA+uSHpVgDAChY7jl3c1xoen5KHg6Op0ak09D+aVcEonOlntTCDq05heGkPi7XVdb5GvemNua+7R+Vjhug2HjTgQQS5oYd2OIcViswjx1CiNNtGhnrfqtf8AyV7wKhz1joLT5qip\\/nV\\/CqU95rpQmjE1f6mowJq+t\\/zBAhJodUVo3lsusn5lpmWtLFGJXPLs8lArATSoYehmjp2PzmUotrQTBzpHENJZXZfJKLM3Ioqwf+CUyFKU69c5UOKucrr0BQAwR\\/wV\\/9oADAMBAAIAAwAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAUMOluakAAAAAAAAAAAAAAAAAAAAAAAAAAAARGDHbEt2zIBBXgAAAAAAAAAAAAAAAAAAAAAAAVmhKSbYlu2ZAAm8HgAAAAAAAAAAAAAAAAAAAAJ2pQJyTbUt2zLgE36CoAAAAAAAAAAAAAAAAAACqltIBKSPYlu2ZAAm\\/QJPgAAAAAAAAAAAAAAAAfKktpALSTbHR27IAE16BIegAAAAAAAAAAAAAAAL20ltICZM7nLfqZCMm\\/QJePwAAAAAAAAAAAAAATe2ktpTZmE6o9mLIAE36BINggAAAAAAAAAAAABNL20ltIBISbYlu2ZAA1\\/QJUMGAAAAAAAAAAAABdJe2kspAFSTbGt2zIAE16BIRgmAAAAAAAAAAAAFZL20ltIDIJC5tu2ZAA2\\/QJCMFwAAAAAAAAAAAdJNe3m5pAJERQANWzIR+TaBARg\\/AAAAAAAAAAANJJJ20AtIBFaAAIK2ZAQAPQJCMFkAAAAAAAAAABhJJe2DApAGbmm0STbYAAH6RIRgsgAAAAAAAAACAJZL0ABtIGIAAACQKbT8d\\/QJDsFoAAAAAAAAAAABJJe0RtpFYD5weLwvIMDX6BIR2sAAAAAAAAAACDJJLwDFtJAPySSQWwZSgK\\/QJCMmQAAAAAAAAAAcBJJMgfNpZGduSaZ+bDATJMBIRgoAAAAAAAAAAAgJJJgeoQIoRDyRIMz7IA8AQJCMaAAAAAAAAAAAMDJJYCFCJDOUmSONuDUB3gCBIR0AAAAAAAAAAADkJJZCrcKK4SSSSRsR7gIoCgJAPgAAAAAAAAAAAEBJIAAAAFCeSTJDtnrcAAADBIMAAAAAAAAAAAACgJJAAAAAhPiSQ7tsubgAAAYJAAAAAAAAAAAAAAMBJJ\\/+ljBAwySst6GTXbQgbe3gAAAAAAAAAAAAAsLJLq0oRIACB+J67XlgA8AAQKAAAAAAAAAAAAADhJJe2m+JEKyVDF9hqcez28SQaAAAAAAAAAAAAAIJZL20lsfACfP0r3MSTHLvSSQIAAAAAAAAAAAAALJJe2mBvStPB9k2QySG2okAAAAAAAAAAAAAAABQSFL28S0AB2MTMx8SSS221gLCIAAAAAAAAAAABASTpenC20ACXtwp7iSQU3AiCYKAAAAAAAAAAAAASCCK3S2mgAAAPw8SSSK2hCAAAAAAAAAAAAAAACAAYZs3a02AAAAAACSSRW1TAAAAAAAAAAAAAAAAKAAT8qKEm4AAAAAAASSAWzQAAAAAAAAAAAAAAACJQABbAC23AAAAAAASSSc0gAAAAAAAAAAAAAAAAAAAAKAAG2AAAAAAAASSSMkAAAAAAAAAAAAAAAAAAAAAQSW0kAAAAAAACSSSSAAAAAAAAAAAAAAAAAAAAAATdaeAAAAAAAASSSSAAAAAAAAAAAAAAAAAAAAAAASQzYAAAAAAACSSSAAAAAAAAAAAAAAAAAAAAAAAADHJAAAAACRJASTAAAAAAAAAAAAAAAAAAAAAAAAAALYACMm23t984AAAAAAAAAAAAAAAAAAAAAAAAAAACLBHAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALIAAACZQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQbJIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAf\\/xAAmEQEAAgEDBAICAwEAAAAAAAABABEQICExMEBBUFFhYHGAofDB\\/9oACAEDAQE\\/EP5S0n3ZCsrKysrkPulPn3aHmMn4Eun2dgL5hA+UICPsVDmJ8RbiKedB2wyHygjx6tagnEU1gPPYeOkMgH06hzPgm639KMgj6Na5wlXntEprtLqW8+hKE5dP4CDi9o7LJ+8L4+NwsWsBvcOYLjmStln7w2X2E1nwvf8Aj6opSLe2OzmbbsBRvGU3QRKZRWHMpb9yglRQEJTdBEpitvs\\/E94tTiHHY2ee0eorO74Rx2A036JU91fsdoJD5uD6MT8Yo57pWdxWo0JTtpC80gW61gegB4iJz0Ru+QqvRlouWL6NzefBrwV0gG8RaxbWVRfV59vsV0qlY4itvTcgVoubzeUytFColNah5yt60pXQ59urX0bm81FaqnW82i7gW1AorC0XOfRlXVBvGkXpWSkrnvnEcJcSmtA85XjpjWRR2y4OjZkqK1Da8LUX4lvSG8DQFFZW2+qFvbvoqsrIJs4hF6RW4F34jSJBtrQvHNyrVqr\\/AH6j3SscseORbeVtUJd5SUiU10j57fk6FytMcGObPBoDQ7GPDKiBDoSV\\/j\\/s3c2\\/1Lk45Y8cmjKtucs8uiLe45uhUXm5rHBjmy8HnG7vMuR\\/tCJW\\/nRWiyBAA2zyx44NuXRjlnl0RR3HJCq1C2obYdifVPqgSjgWp9WFyYO\\/U54V4GjJTPqiDvlFiVro7k63F0eDh1bB0i2qn0B\\/UANnUrReTjrS3KN3uhuOvi6PBwlNSwqJZpKs\\/MakqNf586AuBU8GTjrXme7N6wo2aqqa2cKhdAkbIAsnk0LhtmwW5PAgVkLgVKnRABl3yoxb3gLxLyk5nme8Syo\\/HQvatHBjm0ooA2jaKJWFLzeE0KlQgKlBFvdwF7YonOnlnlLt30NVuogqWi0rNPORTchtIu5UpKSkqKE+CFGCtyAsqwg8ymBcMUKpaWnLDb0NnYPM43rIiQWxWwU4lifrC3iXAS4m8FAoqVDbQAcaPgwN\\/R7mL4Jx0AXifREvE8rlLiSgMbxFl4LhtzKaA6V288vTXF6guCQbca0uJpvC6ArqMBv0qWVBatNK\\/PTfhoMOAgVqNN4sT040LuspkqVKOgaa9TdAK0ZHKWd9XqbVtFcwKAHGa\\/Dq\\/KbqDZftOfwhaLgDcB5g3Eu\\/wlBRETn8NEcopxDZ7C5cv3Ycoa7lzebypUqVKlSpUr8AqV\\/K3\\/\\/EACQRAQACAQMFAQADAQAAAAAAAAEAETEQICEwQEFQUWFgcYCB\\/9oACAECAQE\\/EP8AUonifnPx179p+0\\/bZD+Mo8e7FwQXMD5YHAfEoOup4jJ+GIREz7HAEVniDzzDEO5YtH5ijPqwXgjs8T9aY1OdUhwdhTfSQxZ6dCgnmig4PSixE9GCtE8sgFHaDZfaZlOPQ874hNHTpUWipVdckLtJUL1xmNFoxMz7riUtBcXl5RUKSovzMFTEeQfZ9VxGrQRWOvz518h3\\/m6tvdxUZpC8qrieR9ireLuBRWkIEhmXCniciUUZJdG\\/MBBSXuRBYIUA9n5O8BWiDzc9iE2HZsx1BT3QXwQDbncdIUr0Qs7qhbPakrwR+s\\/eET6JhHuhT3HLODYlLStqgWx+k\\/SCqN5ZzOa1sqMZ5gBZ0UGnWLvn0cFaIZDc8mtf6dHY5mKrbMytz80RWQxZvVFxb0FtdXHt7W3StnQLaJUEdgXRVbdeGU8ui\\/iWfJZ42IrIIlmy7xp4Nai9o30Me3pzo8L91v8Aw3c91qHYoMRaLi23oFtSqx6PUdV686QidC8\\/vP7yv2f3i4ozoNcwbL2cFa+bpuq57bM6J0v5hwbnyGgXA8wA6DEuUOivUyxegXBRXVWjtxXQeJwvzX\\/ux2GmcHV84SgvQLa0VsFFsA8Q06DjTz1oK1ubiDjWlZfSfjtzQ6F+615pk0x65YQxpjLb2imkOfMYvGyydeY1qVMNcXRWjuMHQvo8a1\\/ppk0x6nnorNEJyRW7BqW1w0OXSrVdow1xdBit7jBHkVjddQttugFplRQz9ICpogKy\\/wA6YnRcdF1w0NaLtSDM\\/aAnGoAQbxvs7l2N+To4tLg0fNbqyjG1cwW1KrTJ6wFSzg7p8JvydHFFogiWTnDDBpuDZszmW2tEW55WuT1jxHd0V+7wFO6oCUNCIGBt6kKYiplcG9UDzLOSNCtUEslr8mOhVQjjVRcCiiKGZWWM8R3lAwp5OgHN3syaY9pGmO6YIgPMpLluIv2II\\/EW5egAUaKBbKfIBxtw1xSrg2V3vG\\/Opeln6RC715KvUBTFthEzLlpaWy4C4nmiwqK+GIJZoKckxGLUfppAMrKw4R59D\\/19j1PHo4KgRxKkqRGUu5j+o186Gyiqi4iY2bixb1Iq5lSpaT6aLivR8dT9J44ESzoKGY\\/eC+Z42o1Bvklrg5WAFaFPEtlGIvZZ0alXDBLlkr0dTbcoFsTEKXneNQb2sWGyza7yGVaXM6vfjTZCsNt6jG52XUPuXqxSEuNIq7nZUp0KNh6N8tHTjPvVuW00imhV6DtWot+luXDSQFulx4SpW3x2njZfF6PoTQi6oDwmK5iccRTlly2Ft3jtCJXp7l7qlbB4va47U54iV7YLjnth+zliCmvaYO4uvYBVEEpgsMc4lEPP8ItUAFmg5x\\/hStkdxwgsIw6tMplMplPusSxbhutP1Ki4p80WlpaWlpaWjTj3d6hc4YlvVuvfXxUvqX\\/Bbly5cv8AwZ\\/\\/xAAsEAEAAQMCBQMFAQEBAQEAAAABEQAhMUFREGFxgZEgobEwQMHR8FDx4YBg\\/9oACAEBAAE\\/EP8A6khSG6xUvYP7lrJ3+uqsT1kp\\/OD1SvagrgyuocERq+CpHyFX3tfwU\\/oOchr+cr3Khhl0jfE1zIESe3+yoErAVJgTJC8jU0aAT8yH2qcNsV7QPmpCAdB\\/apW0cjHxCp8Pdfl9CGr7jRnER6WoQlrA1Ex5heIWKGnOEVurBosG7MPYfmodF0WPMiuh5mHWMf6MWBEgAvQy9qgmOIT92\\/tUodw+\\/wBntTLAurfwHoC3AWwLE5bfXeIvCAmCDJO\\/ERdEJCd6iDujF7v5VuJhfeXPLU0nEpgequeP8vBCgw7tRrK05XUS9ipFRpS\\/jZKbpEpK93jcsSAEnMs9uI5sVxQSQN6fUgFAGYcNGOCJNHITePoHTn7qHBoI+i4YpRCPJp0cbSwDln5muhXpHmx2X5f467T6d+QMr0ptmYjl6n7+KhRGULBKaDofSeI2JgSXJG4bW9z6j9R1gLYX\\/NmTpUBYp8sH5Lf4YqikAFEM1o\\/wOr4rJyxi9ORy+moaoJWUyzpFvNPrUgAsqFgFK2nLpShqhndps659AIDYQyJW8Zb5b8X1XEZr8bojmjlj1rgKYBKXUiMFOf8AweWP8FoSG1l19OmakuJ0HQ\\/LP0z5SACEm0SExVwPRjQGipvpegunz2GRANzDRCxXeoWKQ5zpQrGRUMwKhEktOaQsw7RGEqKQmBfl4gY0qMjFUCy2LAsS0C9oQlC3UJbvQcR0UhcWvfHelJuXDmABrlzPamxxqSaCribc6CYu8ZnCOkU2\\/HAGJTEDE25UvhKojE4GF4louxwAbQcWrCaSvGYqI2pJmFNJN\\/pRE45kutDojim9IbvsX5adMCJIyOv3p4GlEAbtOLXQZeW3+G9O2RKrKv01w1IASctmc6Nt6MrUmiGNnOLVn0PIiFHQwxVoMgKaEYJv80\\/U\\/PqaRZVwHOgAHQ0jJl0b0y5BQKWVgsUk0gFxycTRkZoxOQRqEXtVxsc1NcG5RUYXomAC1EPsmkTHNN9aSwhZksi9jejVGBAVucoLLYxFLDJrAN2iaSXjGMdQjEjW1JUXIkgDDzOAEkBbsYqJ2ohiG8fVRaLMkEKTuSeTiyXTdfc\\/Hjb7xAFlYBS2IiMc3k2PPL6+GSoYRXCMYnfv9d9E05AqNmBqOtQdrhjZgaHrIkt0gRJxyiPepYibbcQbkSIwjQCGwBr+78j90\\/Yi0AMq0i2BJR\\/AepFYUJImCWYLLLGnP05rmvCOUemXhUEeRLnellXfan1rJo0AERGTTPoe\\/GrImNXd5+h9QiAwZYsfTcyLDpJnsw9qEQRkcJ9yuL0jD8Hu9OCYiKzSEtEEW11c6fXDVkAN8liDPW1uEKwXaJrcSwjkZfFCDqQ48sz4pu5CME26JvQpUUtrUNRt1nj3UQo9PjH6ptG21+7LHePoPozEkXXbkJfrbgEoURbIxJyl8\\/UaWAXWbTzJ3+4cpAAjfE9Tg77cS6CxzqD+shJBbOzbt6XjBh1TAUEX5YD3Gv6P81cdKTB0n1hRdLQNb6vL4opI5KUeTHZfm1BSFzx4o+FOQpVoObSImVzxYC2fhqjYM9jWpa5eK5zPw8NaXvHA3HCepq1iSYEj1rKILBAcihbyqQgxMLOlfxf5r+L\\/ADVxUQIAySekEjWwxCSY1vcyeo7cbsvc86VesD6j8H24dr+yAmp3ByeP4D1Ke8oJI0RycbkYXyyX4+Rxzb4WxY+Zex6kCQw7fwpagCWGCOe9J00MQDoafFLcQyQa0qst\\/QFc6hABrTSEYUvo93LsaUjKhpVNj5kX4ousIuqPyael4ThgAdTsAtEVLBoCA4SoLXdbH7dBp0SlTKuv1H0Nnj9\\/26wHjHS2d0n6J8CwAurpQ6C8jUv+nQOAyXXaAlaloFFOgOwBSZPtiSclGPHolQhgeM5uD\\/yjbEKsBUobrgpFyG0aVLqK4vYDXZt0paa88DraPeguwXSzFM17+9Cm4neZS6jkOHMYEnKKFvDgKMlQMBgX03o4SnVI89ucnNMBMAjsSbxh5ZOAKwXajhTJhJJI8uGdOU5o\\/NB2eN38rDkrHb5PQOkkCYlWChdxQAHqW+g+jm8\\/r+2RIASroUyFXBdDb2B6Lqdt0mGzp6YGSQ5LKx+XtxsQtg3M3lg7PpBUAldKGHCNZLHYW6zUj0LBSFJX6PWF+CEMlYlfEZcnRt35cRRkYSoQVySQQSvIqHQR5rHigpgx5xl6rL34ZPHHdod2DvS3mjwuUIkssHI3x6VVlu8XRCGjJlix339LSiyo8r9sby8xa\\/J2+lucmLmA7EHWeCiIAEq6UjQxLawebvf0wESm4dDyPemckTWD2DgjKspAVPjkySPlU\\/Hmx\\/Iontz8BpPuh+BScDqL88MwcroD80BO+N\\/wn5qOQEkEHtr24GJCPkIa8nLUMTxau5hdMou7KOKG83C6Y+Z8fTNDjVYJc5TPallmI4KiYP8AZs+2OYIfpHycCYRFmiRjyHr3NzlkG3cx2niVQjUIDlLi1u56jeL5ciX3HirGZiFAZ8taAatNG0C9HPR28tc8wleX1wxMWrTTCBlUI0LsSETXYdfka5ENCZQmjZd\\/N+KNTjZSwFRkNgat15ngLFoNAS1IzOHYdgg7fTaJUYxncWsY4GcwYGjddgaNUQDAFg+2WQtGdZ9YWZzUByqHEmhyq86yQuafi\\/FkHELZR9x9goBZiBLGFpaHDAsqKuJCSeIrS\\/lw+BXSJNXq8FhFvJboc+C5DgcC0vsUk4AosuZNqbrNJCeZy9Fm5kJCpDTbCK1EvRydKllczcy0fHvwATbLtJ7nvwKAvCPkfLwITnQu7CDNXVwuFl\\/gS+ONndbLcb8seGm4TiVMGo78alRgG53MObQAbeMpvGS+bR3fovEBxpgN+5Pbn9uzmh8Qfj6CKTcTS4+cd6BmBAGA4DCQ+CexL2pVZWV9DTjNZRgNC2ZOXBDFitVBdVOxNCI03F3eBGZEAlxYF1PzVoBAWBGy5UEUoUiIxjFvQ\\/aQoqwzj+d6kRlBLhnlDvtRBgFeSzHC7+2HgiBza4AKgErgooDXM1jsQduCJAEqtgogpsLpYPOerXu3H9z+D6IeWN6ee7gongTrAQH26WX+3iqEEkkk9Nh94kXG\\/LL2ON704g2X+BB59bTgAGZPlRIxIkPisowOqT8cLAESJPOOcUtqZDD0QQ65vTRQNRh6E9rkNKlKhEICdDHam7wj2zeOEAZumdUHy4Y7TOWUfeb9B43+SwtzX8WosG\\/MxFhYne1ude7cf3P4PQ0CMzkFjOfj0HyPmk1aOcniORg86\\/cM1r7gP5q0F65fwayY4KqBJEwGA5eibAQ7gXYFoWJItAQHBVSHMiseaQB9wSllc1\\/wj9046NRJY9nhkss0ksUgvCggAlc8BWsW5UUbM7VFBAOZC\\/s+ido4\\/wB58Uc5Ghl431CeAWF4d0Et7F+q8ZkxACAZy1Z7BX\\/MP3SMDkEMqPZ4xdPrQtMskeGoy0a0kk9k9KMItkinLKgEq7UBmbJXk06tXtvP3Cw8BHh9gBP5e\\/gM9B8cvaz2oSG1RiWZPpA1mvKXgqQmlAEkTBtQCkEhUnPadaWCllniqxdjmsvxSMyWR\\/gWDvTbHXaqyvD+rt+j7X04GAhAKBAQFA1BJsN3+R1+6Qoso85PsIT+Xvo0xGSxKsF2jHPmAE5lFK5JW+LsYehvQpT8lHnHelJhHCOR29DHqpKEBMd4ofbQGmEI9qtKNEWBs+se5UnFHIQcpoIQtlq5fx0KkPmUc6OwZeby4\\/1dv0fa+jRNjNHLQQuGx8NOuPup6RNOa75HtS4IyEs9PURlUAFxGzyfV5pppozFYgLMLHI4HUViSCFrU++kwJEh4ZzTF3oXCZXJrA9Suo5h\\/wC0n21O46l8nep0ScZjrWKQxaY0qRGxhJUwsulT5xMRNhb6ScSZiQWVajhhwBcDoc93+ZorBLx3mxpu9GiLidLdC5vdbdXiVuE1IAg9MGCCD\\/7AasNOS8UcAJSHWrPVkBgAscgq7TqIkea1OCHklShdzq3im4CwLl0cNQF0sT4D4O+33mQ3DtJE9qS4JW5jc88XLkQohPSG3Nj7Rahp9NpxoyQyx+E0f+UbwIsH2H5w0Yq+AXOZo8zxTrCGnPzkx3oFY9MUtxV4IzF70TIkCzBSEXO11JyFycI5ZP8AXq+QkX36jpVtUyFt8U5Zfek8HKfBsG3BHSYDQ5uxRZgi6VdiX4rb283BuOGn0e7cf3P4KHMgHtIyvJ7\\/ACIABA4DYOAU5WQSNQ35IoPKPvHiGMTEbHzDxJhaUSr1+i35kFJKdHnX\\/GqBBlMwSLTxSQIzCx3mI49NjgmyYTk0F6wjXra+46VgYmCdEtUl9ynT1g0svJyT3KvaX82pweREHsFMiJwfcN6FN2MnQZe1IGjYd\\/wdW\\/IodM0tlTqu9Ci7i5UVb9c47N6mBR32p2Pzw0+VOOY6PSpQLbo7XJzqfzale1QgruHhZqQWzfviasAtYBEjJEbV\\/wAyr\\/mVFuhngoLTUcYDyDj3hPCfltTejDWfb7tNMRl0D3D3D0IvBAIbLNxtMT+PplXREdRMfL5rLVYAtzc\\/\\/W1AFcsmkUCYQ4AdQdOlT2e4s9HDUQOC7UwmCxU7uzKHUYe9EQaSdu8D2oa57i+yKt2k51ASAm59j8qEWXSJ9xO0UuWmVKd2oAiZJDUao9XfxmiJEZaDkUDgXB1\\/qsWlE7urxEhAUCR1SbfugBnsp670pwoajFWNuokoWYXgI9RtUVhXW+KcvbpSSBgoR2aIFAQ7sPgaiRJLO3FB8qCZScHBuj3+7Ohy7LtCRHRArMTEsdqX7SS\\/NPIUmYl6D8+ae80NCvSKNHFe4IOd57PHlu5V7VDiOY+TToMZYR4mhmdWR45z487ViOGeAAbatneiYjmSCjQBST\\/DNeEsvhFAUCWCfuiLCAWMR0rn+f8AVJZMsdTramGhcxU0BCAQnrO1QTc3T2YpzOICAyeyeOAKgErgKKRImSw2Ofo5VIeuX58KgXtxnSW41c4uJNetQa5QMenU08bVYZABiCTBbUpmXe5hwRrtSnLHJA0UwjnanaggrX3OtTgxqUXI0RCZGPuo1Tr+lKrKy07HLhi5UAZFCcsXmfE7epVLQKVadD54vmdXt1pOYbCCehwlYTUUMAsC48rPXl6GBIBrt1KJjKUFnwVRlY6tvzRjYA8cJPh2Mt1ipCHWHLIQjXfnwDnBv2exoppxFy0aEIWMn\\/ulll9EDWZeyD2Crow+rRylsPxDMdChYyCiQZjn\\/ZokQh1\\/Wj0MDXUosTc8CurANnbg0BYx9y5lu5bcZ+MFuJJT0zSKvkwh2aPj0AoAlcBRQzOTo2\\/mpA2Cwa1K22gwcMlIBwCPRpl5MryMPuehAN8jU4nMNzpvU364IYmfxxycjSEmY2O2auUY2oWGeLJuadqWwFJVDhGJHYqQMdf2FKpXL6VI\\/u7hBlh78ByZg3egLtCSxYFQ96AAQkRs0VpebCz5ZnlNAQACAMHBkinndWDuK2aKuPM4GgHdCgRwH3AIsBNOuZZ4Rzn1eAGQeaKRbh6KpKomuYE42o1Zv9l4YriwRm89uBOEZDh0Pl7UdJgJWkTsLDY4uI7vCHo\\/ufk\\/PqKDVMJh3NqVVjYZPehvmA\\/dA5CDQDyHzJ8FHAeQH\\/PUIgGq75eCjrfVkcle6PseAwyVCR5UgpkNAMFSkmQKZdhq1B3mzJHTYocIBmNX7+aNEUiYmaUQY50kRQJy4f0pCQDvlp1KJZF\\/1TLbYOWdX\\/2rRAFNUz7r4owwgjYEt22CoZiL0kSgbtEaXJPIEe61FGrFRO4VGC8yudTJxmGzhI\\/WQMrkz6rwbTfd+UegoSMA6l6h70GoIWgVYzY5H+C1tfUpEYSGotIKVsbVGLJB3aNBNHQcHihqbR1J0Yw70anre8un7RRA05Pwg8zR4AafGlIkbZHWh4hwEt7lEkOL7+5zp6gAJLaw0BXBJKJlSUXLwuRvL\\/PN9ZBEcNM609LWYA7Q47Nx5NHEykfJZXMeMcKqSXJzRxzN39Kx\\/g5pKCXSSl6JYggo8MogVL6CJvNYM0YwndpXAO1YMNg4BUOoJEclLyAbhvL0GOtWhgIKfYDBxG9KdEvdnb68A3W9XPltIe013rBrcfDs8uEiMqBzoE3crd\\/ygmEazekRRITgAlYKgEx1qVFGQ3QmL0jKnjf+lRu0O7BV1YlN2+Rjt9eQ5X9dw8oJ6xo8ygKUrw9MyVcCkEDkBidP8wHuO9SzjbSErtwYZ0DiEta8WaSxG5l9gkib0kMesJoDmDaKNWgCAGA\\/zcqRgZKlCbB\\/O1OFDeYGnfFZRsgVZbadqPGoX\\/yvs1NBtMXfEUzAWDQGv8ddqAIGAfLz+xMFz9R0SkBQa45W7\\/noBAI5Go8U2sJgNF735XK037o\\/+nPggSSciyj3inQCQEA6FKj0+2AKAJXAUURavybf6UDm5PPC5Uto3lAHx2X5U3DFwkBRKJiMiCUYTuD9T2c0r3rP3VkP7udf8PQ\\/6lKlXT91PwjyPhxBQAq4CjAEvB\\/M\\/wCra60eGB8NqUOZrUGXxXwXpUD+RDy1NAjQPvLVPhHcgeSa1yNZU7SfFag2kg8\\/lW7zIU\\/NZTWsUfFfygOTWNfqv5oxu+Lw2t+CjijOQfmjJDXXke81Mlciyvz7f0HHr4o0i39Dp\\/sRRDnTbtyNysu03u4RceyZf8UBvc7cW\\/Ed6jJsxA+TegAgIPpOW50KUnAE1vICWOiOjUBAAlZXq6v+5h5d9aaJRGLuRrOlfHFrFjt9EFYCawSDeyhstdA81COk5f8A8FlV1K2R0UpXCe9OlR\\/xq3qAcr71oh6s0PAdB\\/8ABX\\/\\/2Q==\",\"size\":24175,\"type\":\"image\\/jpeg\",\"originalName\":\"not-found.jpg\",\"hash\":\"\"}]');

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
(87, 'menu-bg-2', 'uploads/all/Q1kQuru4toeAllwfM7GNJHIF9FZsxhScq1XP4j7T.jpg', 9, 25425, 'jpg', 'image', NULL, '2024-11-28 23:22:12', '2024-11-28 23:22:12', NULL),
(88, 'not-found', 'uploads/all/o3ksiaaVJS0CvMvYrZkuPAc8Z5zRXT9QaYWonuBj.jpg', 9, 24175, 'jpg', 'image', NULL, '2025-08-31 21:27:45', '2025-08-31 21:27:45', NULL),
(89, 'Black-logo', 'uploads/all/xGrD9dD9CnEteMRvUCqjaRpemEYD6L4hKPzEkOYG.png', 9, 53875, 'png', 'image', NULL, '2025-09-01 10:42:44', '2025-09-01 10:42:44', NULL);

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
(9, NULL, NULL, 'admin', 'admin', 'admin@admin.com', NULL, 0, NULL, NULL, NULL, NULL, 0, '2023-02-24 15:02:20', NULL, NULL, '$2y$10$SZQz6.VKeBrC2uq2R7A3GOKnaAB8PQ.9FPvyPkPBGCbZmCQDGE7EW', NULL, NULL, NULL, '33kTXkXbFGxl248P8aH6DBMakvQm8TuROCZaFOrhdHLwu1SfjJMk6eV1txho', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2023-02-24 15:50:20', '2023-02-24 15:50:20', NULL, NULL, NULL, NULL),
(10, NULL, NULL, 'customer', 'Jisha', 'jisha1@yopmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, '2023-02-28 16:02:54', NULL, NULL, '$2y$10$Uj8997WyQkzvtGP4Nv9xIuyobn1mVtGDBjS8RhMqhpSockq9qZ5L.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, NULL, NULL, 0, '2023-02-28 16:40:54', '2023-02-28 16:40:54', NULL, NULL, NULL, NULL),
(11, NULL, NULL, 'customer', 'Beatrice Talley', 'hihuru@mailinator.com', NULL, 0, NULL, NULL, NULL, NULL, 0, '2023-04-11 20:28:48', NULL, 'A43SAQI88wOK9CFk5X0nhcEyOBraihql', '$2y$10$ttoR7zVOlbnhvH4h97G2YuNqolbzAgO37LEcBv33RExq.3McnZr72', NULL, NULL, NULL, 'pGpP6q1gD5KbVaudIADjBZsb5154NuEvslFA4qAf6BSJU6d5IGarj5B8qmwp', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2023-03-01 16:34:53', '2023-03-02 18:14:01', NULL, NULL, NULL, NULL),
(12, NULL, NULL, 'customer', 'Tst api', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, '212209', NULL, '$2y$10$EAVZ4tBtF3F3tm.kJMIK3eccNi/qmxT/ZTSWfXYUHY4Tm2pvvoNY.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'asdasdas@asdas.com', 0.00, 0, NULL, NULL, 0, '2023-05-01 13:23:02', '2024-11-15 14:16:00', NULL, NULL, NULL, NULL),
(54, NULL, NULL, 'customer', 'jisha', 'jishacustomer@yopmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$JGqlNyiRM5B4Qrmusv9QpeXykNxGvJCRAHzj1O9h33/h38BjXGNcW', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-11-26 22:24:10', '2024-11-26 22:24:10', NULL, NULL, NULL, NULL),
(55, NULL, NULL, 'customer', 'Dhanya', 'dhanya@123.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$bo55OTEKU7XYQNeGrXPGt.E2Ilzp3Ibar2Zvlf/Rrh0umeXSBvDWm', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-11-27 02:39:53', '2024-11-27 02:39:53', NULL, NULL, NULL, NULL),
(56, NULL, NULL, 'customer', 'test', 'test@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$6fgFdRj76ZAStzR5OxI0ueUrfvg8a9o0w8zb657KdpS3m9evHZjZ6', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-11-29 15:39:20', '2024-11-29 15:39:20', NULL, NULL, NULL, NULL),
(58, NULL, NULL, 'customer', 'Sarah John', 'jisha.jisha94@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$L9urSV.O3BCaHNQ05CCD8uIp9cgsjuMz6bCBqFapJjS//0VfcCvRG', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-11-29 22:38:44', '2024-11-29 22:38:44', NULL, NULL, NULL, NULL),
(59, NULL, NULL, 'customer', '12343#$%R#$', 'tester@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$oWOaXzXSVpxy7jo6fbY0HeON3NaRBDn9op6zpvuOcEsLp8F8quCR.', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-12-04 20:14:13', '2024-12-04 20:14:13', NULL, NULL, NULL, NULL),
(60, NULL, NULL, 'customer', 'Nevetha Test', 'nevetha.tomsher@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$G8ib7YLxgGGyze7J.5w3yetIA/nivzxH9WBAkbE1oi5aPtxP6vc2m', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sdfsvff#$%dvdf', 0.00, 0, NULL, NULL, 0, '2024-12-04 20:15:45', '2024-12-04 21:36:37', NULL, NULL, NULL, NULL),
(61, NULL, NULL, 'customer', 'Test User', 'test123@gmail.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$bgFVB5vQrzAeTvUrwdMQLef9jN/d3LvURIxXelk6RzDQEVoqOzjuS', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-12-05 16:38:45', '2024-12-05 16:38:45', NULL, NULL, NULL, NULL),
(62, NULL, NULL, 'customer', 'Jisha', 'jisha@yopmail.com', '47854962141994', 0, '/storage/profile/1733894444_6759212c0fc1e.png', '/storage/profile/1733894444_6759212c1332f.png', NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$7c6oGYrQ6PtuUkZ59KSyYOaLiVUbWY5XJhZY3ziQ.vFDWDNSnDAym', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2024-12-09 18:05:13', '2024-12-11 13:20:44', NULL, NULL, NULL, NULL),
(67, NULL, NULL, 'admin', 'Super Admin', 'admin@craft.com', NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '$2y$12$6xFvbu1SBhj8cN/izTjAUe.5tMyh7F45xpE3Pza5SGb5dopAc8m2K', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', 0.00, 0, NULL, NULL, 0, '2025-08-30 03:41:20', '2025-08-30 03:41:20', NULL, NULL, NULL, NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `product_seos`
--
ALTER TABLE `product_seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_tabs`
--
ALTER TABLE `product_tabs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=805;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

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
