-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2021 at 12:16 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_dj`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_category`
--

CREATE TABLE `adminapp_category` (
  `id` bigint(20) NOT NULL,
  `category` varchar(30) NOT NULL,
  `cat_status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminapp_category`
--

INSERT INTO `adminapp_category` (`id`, `category`, `cat_status`) VALUES
(2, 'Fiction', 'UNBLOCK'),
(9, 'Non-Fiction', 'BLOCK'),
(10, 'Kids', 'BLOCK'),
(11, 'Novels', 'BLOCK'),
(12, 'Self-Help', 'BLOCK'),
(13, 'Cook-Book', 'BLOCK');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_product`
--

CREATE TABLE `adminapp_product` (
  `id` bigint(20) NOT NULL,
  `productname` varchar(60) NOT NULL,
  `productprice` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `discountprice` int(11) NOT NULL,
  `productimage` varchar(100) DEFAULT NULL,
  `proddiscription` varchar(100) NOT NULL,
  `categoryindex` int(11) NOT NULL,
  `subcategoryindex` int(11) NOT NULL,
  `prod_status` varchar(30) NOT NULL,
  `author` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminapp_product`
--

INSERT INTO `adminapp_product` (`id`, `productname`, `productprice`, `discount`, `discountprice`, `productimage`, `proddiscription`, `categoryindex`, `subcategoryindex`, `prod_status`, `author`) VALUES
(12, 'Life Of Pie', 140, 5, 133, 'product/images/action1.jpg', 'best', 2, 1, 'BLOCK', 'Yana Martel'),
(13, 'The Call Of The Wild', 200, 8, 184, 'product/images/action3_HXhRYnR.jpg', 'best', 2, 1, 'BLOCK', 'Jack london'),
(14, 'The Three Musketeers', 210, 20, 168, 'product/images/action2.jpg', 'best', 2, 1, 'BLOCK', 'Alexzander dumas'),
(15, 'Stephen King', 180, 10, 162, 'product/images/horror1.jpg', 'best', 2, 14, 'BLOCK', 'Carrie'),
(16, 'Brazen and the beast', 130, 20, 104, 'product/images/romance1.jpg', 'best', 12, 29, 'BLOCK', 'Sarah Maclean'),
(17, 'Royal Holiday', 140, 25, 105, 'product/images/romance2.jpg', 'best', 12, 29, 'BLOCK', 'Jasmine Guillory'),
(18, 'The Savior', 160, 25, 120, 'product/images/romance3.jpg', 'best', 12, 29, 'BLOCK', 'J. R. Ward'),
(19, 'Power Of Habit', 200, 20, 160, 'product/images/power_of_habit.jpg', 'best', 12, 30, 'BLOCK', 'Charles duhigg'),
(20, 'Memories of a geisha', 150, 20, 120, 'product/images/historic3.jpg', 'best', 9, 16, 'BLOCK', 'Arthur Golden'),
(21, 'The Help', 170, 10, 153, 'product/images/historic1_KId9WMS.jpg', 'The Help is s', 9, 16, 'BLOCK', 'Kathryn Stokett'),
(22, '1776', 200, 15, 170, 'product/images/histry2.jpg', 'best', 9, 16, 'BLOCK', 'David McCullough');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_subcategory`
--

CREATE TABLE `adminapp_subcategory` (
  `id` bigint(20) NOT NULL,
  `subcategory` varchar(50) NOT NULL,
  `categoryint` int(11) NOT NULL,
  `subcat_status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminapp_subcategory`
--

INSERT INTO `adminapp_subcategory` (`id`, `subcategory`, `categoryint`, `subcat_status`) VALUES
(1, 'Action Adventure', 2, 'BLOCK'),
(2, 'Suspense', 2, 'BLOCK'),
(13, 'Thriller', 2, 'BLOCK'),
(14, 'Horror', 2, 'BLOCK'),
(15, 'Mystery', 2, 'BLOCK'),
(16, 'History', 9, 'BLOCK'),
(17, 'Philosophy', 9, 'BLOCK'),
(18, 'Biography', 9, 'BLOCK'),
(19, 'Autobiography', 9, 'BLOCK'),
(20, 'Spirituality', 9, 'BLOCK'),
(21, 'Travel', 9, 'BLOCK'),
(22, 'Art/Architecture', 9, 'BLOCK'),
(23, 'Adventure', 10, 'BLOCK'),
(24, 'Cars & Trucks', 10, 'BLOCK'),
(25, 'Activity Books', 10, 'BLOCK'),
(26, 'Finance', 12, 'BLOCK'),
(27, 'Stock Market', 12, 'BLOCK'),
(28, 'Relationship', 12, 'BLOCK'),
(29, 'Romance', 12, 'BLOCK'),
(30, 'Mental Health', 12, 'BLOCK');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add sub category', 8, 'add_subcategory'),
(30, 'Can change sub category', 8, 'change_subcategory'),
(31, 'Can delete sub category', 8, 'delete_subcategory'),
(32, 'Can view sub category', 8, 'view_subcategory'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add userdata', 10, 'add_userdata'),
(38, 'Can change userdata', 10, 'change_userdata'),
(39, 'Can delete userdata', 10, 'delete_userdata'),
(40, 'Can view userdata', 10, 'view_userdata'),
(41, 'Can add userdata', 11, 'add_userdata'),
(42, 'Can change userdata', 11, 'change_userdata'),
(43, 'Can delete userdata', 11, 'delete_userdata'),
(44, 'Can view userdata', 11, 'view_userdata'),
(45, 'Can add wishlist', 12, 'add_wishlist'),
(46, 'Can change wishlist', 12, 'change_wishlist'),
(47, 'Can delete wishlist', 12, 'delete_wishlist'),
(48, 'Can view wishlist', 12, 'view_wishlist'),
(49, 'Can add cart', 13, 'add_cart'),
(50, 'Can change cart', 13, 'change_cart'),
(51, 'Can delete cart', 13, 'delete_cart'),
(52, 'Can view cart', 13, 'view_cart'),
(53, 'Can add buynow', 14, 'add_buynow'),
(54, 'Can change buynow', 14, 'change_buynow'),
(55, 'Can delete buynow', 14, 'delete_buynow'),
(56, 'Can view buynow', 14, 'view_buynow'),
(57, 'Can add orderplace', 15, 'add_orderplace'),
(58, 'Can change orderplace', 15, 'change_orderplace'),
(59, 'Can delete orderplace', 15, 'delete_orderplace'),
(60, 'Can view orderplace', 15, 'view_orderplace');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$g7hpNBPkHNeS91tAT8YF5x$SFhAo9lfBs+YTK1pCqsXiEJ+4f25i+Ub/pOy3bzk2tw=', '2021-06-14 15:22:19.685695', 1, 'nayankhadse', 'Nayan', 'Khadse', 'nayan@gmail.com', 1, 1, '2021-05-13 14:14:47.230965'),
(2, 'pbkdf2_sha256$260000$Hny5LyLswKcK1U3rs0UpaR$Q03KK2b+gecJDaMcJMnjej+fritJpeXUbeQ1erJo28w=', '2021-05-24 18:43:18.959101', 0, 'nayank', 'nayan', 'khadse', 'nayan@gmail.com', 0, 1, '2021-05-19 17:43:27.714361'),
(3, 'pbkdf2_sha256$260000$zKgUNCh7onlshm2fxdDccB$Hemm/t71hgAQm+X1+P7z6FymfP3+OUgxgcwPFeF0l+I=', '2021-05-24 18:47:34.609331', 0, 'rahulbhosale', 'rahul', 'bhosale', 'rahul@gmail.com', 0, 1, '2021-05-20 14:14:14.811710');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'adminapp', 'category'),
(9, 'adminapp', 'product'),
(8, 'adminapp', 'subcategory'),
(10, 'adminapp', 'userdata'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(14, 'shop', 'buynow'),
(13, 'shop', 'cart'),
(15, 'shop', 'orderplace'),
(11, 'shop', 'userdata'),
(12, 'shop', 'wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-05-13 12:03:01.392659'),
(2, 'auth', '0001_initial', '2021-05-13 12:03:18.979672'),
(3, 'admin', '0001_initial', '2021-05-13 12:03:23.689502'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-05-13 12:03:23.760543'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-13 12:03:23.821541'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-05-13 12:03:25.711541'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-05-13 12:03:27.493672'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-05-13 12:03:28.951643'),
(9, 'auth', '0004_alter_user_username_opts', '2021-05-13 12:03:29.048150'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-05-13 12:03:30.210368'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-05-13 12:03:30.272547'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-05-13 12:03:30.350289'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-05-13 12:03:32.050649'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-05-13 12:03:33.306325'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-05-13 12:03:34.941551'),
(16, 'auth', '0011_update_proxy_permissions', '2021-05-13 12:03:35.041822'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-05-13 12:03:36.208421'),
(18, 'sessions', '0001_initial', '2021-05-13 12:03:38.799886'),
(19, 'adminapp', '0001_initial', '2021-05-14 16:28:17.044287'),
(20, 'adminapp', '0002_subcategory', '2021-05-15 08:51:41.550383'),
(21, 'adminapp', '0003_subcategory_categoryint', '2021-05-15 10:24:45.457830'),
(22, 'adminapp', '0004_subcategory_subcat_status', '2021-05-15 13:07:43.597134'),
(23, 'adminapp', '0005_product', '2021-05-18 15:57:56.594384'),
(24, 'adminapp', '0006_product_proddiscription', '2021-05-18 16:45:08.020038'),
(25, 'adminapp', '0007_auto_20210518_2227', '2021-05-18 16:57:29.554470'),
(26, 'adminapp', '0008_product_prod_status', '2021-05-19 05:27:40.691109'),
(27, 'adminapp', '0009_userdata', '2021-06-01 15:41:38.483211'),
(28, 'adminapp', '0010_auto_20210601_2118', '2021-06-01 15:50:08.727867'),
(29, 'adminapp', '0011_alter_userdata_mobile_number', '2021-06-01 15:50:51.492969'),
(30, 'adminapp', '0012_userdata_email', '2021-06-01 17:22:47.220369'),
(31, 'adminapp', '0013_delete_userdata', '2021-06-07 19:08:14.205565'),
(32, 'shop', '0001_initial', '2021-06-07 19:08:15.504069'),
(33, 'adminapp', '0014_product_author', '2021-06-10 18:31:24.084833'),
(34, 'shop', '0002_auto_20210615_1627', '2021-06-15 10:58:29.458145'),
(35, 'shop', '0003_cart', '2021-06-16 08:58:07.293462'),
(36, 'shop', '0004_buynow', '2021-06-16 09:49:24.065815'),
(37, 'shop', '0005_auto_20210617_0136', '2021-06-16 20:06:46.152107'),
(38, 'shop', '0006_orderplace', '2021-06-17 14:38:27.142739'),
(39, 'shop', '0007_alter_userdata_mobile_number', '2021-06-23 07:52:31.406740'),
(40, 'shop', '0008_alter_userdata_mobile_number', '2021-06-23 07:55:24.866333');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('39tdix0n6oa72pdd67xcmtrq4bhc16ng', 'eyJ1c2VyIjoicmFodWxiaG9zYWxlIiwidXNlcmlkIjoxfQ:1lwL8w:o3PQeZvXr6MOoNi3yP0zIN0_LQQDOKMM-1pe_sjMdh4', '2021-07-08 08:55:26.780119'),
('8kr0cpcynowybep1ricq2sim8arxn2w5', 'eyJ1c2VyIjoidmlydWsiLCJ1c2VyaWQiOjV9:1lvytg:88oCoMqdlmd-BWbySdHM9plik95HXe4ocOOvsNUhKJE', '2021-07-07 09:10:12.761522'),
('93lsw4l9f7xf8rd6e4czn464zz30n4hh', 'eyJ1c2VyIjoicHJhdmlubSJ9:1lqUfr:nw81T3UBgAWKGTHHQKJUkhvlP14RmI72eFkisZKl-lI', '2021-06-22 05:53:15.857113'),
('9y16w6pgm1thne5t3bt29xwwtgicgj96', 'eyJ1c2VyIjoicmFodWxiaG9zYWxlIiwidXNlcmlkIjoxfQ:1m0mAU:A5RfG7MWBaAREWLHhljLlFJSJEjB9aQOpN5roQZT3F0', '2021-07-20 14:35:22.525172'),
('cbrnqmr0gur6yxa0ud0khebvsyvvppn2', '.eJxVjEEOwiAQRe_C2hCgEBiX7j0DGWYGqZo2Ke3KeHdt0oVu_3vvv1TGbW1567LkkdVZWXX63QrSQ6Yd8B2n26xpntZlLHpX9EG7vs4sz8vh_h007O1bg3OGeYiSgIAHgloMWRi8j4KMREIOA9aSTPE-RQ_igiSqEgCq9er9Af0DOKk:1lo35g:7bqZNvBFCqlD_qnwwLM8NxV0NxFjtKSmP_0F58z3sx8', '2021-06-15 12:01:48.954361'),
('eqy4rn3cu22lyjwqexwamf2alyw2xd6s', '.eJxVjEEOwiAQRe_C2hCgEBiX7j0DGWYGqZo2Ke3KeHdt0oVu_3vvv1TGbW1567LkkdVZWXX63QrSQ6Yd8B2n26xpntZlLHpX9EG7vs4sz8vh_h007O1bg3OGeYiSgIAHgloMWRi8j4KMREIOA9aSTPE-RQ_igiSqEgCq9er9Af0DOKk:1lr4Cr:qSXcpYkk6exbtmpYDtNAjPZ9LjW6FjL2jBOHaad22qY', '2021-06-23 19:49:41.306293'),
('hm099yaz6kwynrvndij0tqqz2p45xvuu', '.eJxVjEEOwiAQRe_C2hCgEBiX7j0DGWYGqZo2Ke3KeHdt0oVu_3vvv1TGbW1567LkkdVZWXX63QrSQ6Yd8B2n26xpntZlLHpX9EG7vs4sz8vh_h007O1bg3OGeYiSgIAHgloMWRi8j4KMREIOA9aSTPE-RQ_igiSqEgCq9er9Af0DOKk:1lnliu:gyaDvaz2P7oaHZxFhm88WV8gsXcMu-wOVJ6wGDMyJg0', '2021-06-14 17:29:08.209621'),
('hx84ssni0uvxzx270u9x5dueeeijooj9', 'eyJ1c2VyIjoicmFodWxiaG9zYWxlIiwidXNlcmlkIjoxfQ:1m6ral:tmlAl3QLr5bOy8kAFEJ98GTMX8A3LJ3lZ1cq_Gfu-1w', '2021-08-06 09:35:39.038869'),
('hxik3t0ul9kwqusmj64qyxbl4vl34idx', '.eJxVjEEOwiAQRe_C2hCgEBiX7j0DGWYGqZo2Ke3KeHdt0oVu_3vvv1TGbW1567LkkdVZWXX63QrSQ6Yd8B2n26xpntZlLHpX9EG7vs4sz8vh_h007O1bg3OGeYiSgIAHgloMWRi8j4KMREIOA9aSTPE-RQ_igiSqEgCq9er9Af0DOKk:1liX1I:78h_hBZib1njfJEHcEnUQpM7kY59jQgdoygQYFhkzhM', '2021-05-31 06:46:28.192842'),
('k0zwba95858q4kf0puo2wkn8z9jazeid', '.eJxVjEEOwiAQRe_C2hCgEBiX7j0DGWYGqZo2Ke3KeHdt0oVu_3vvv1TGbW1567LkkdVZWXX63QrSQ6Yd8B2n26xpntZlLHpX9EG7vs4sz8vh_h007O1bg3OGeYiSgIAHgloMWRi8j4KMREIOA9aSTPE-RQ_igiSqEgCq9er9Af0DOKk:1lmVYA:_oEVTQ5UeSqvGU3_3BlGSZeMq9GdAAQ8uVKrTe9ICYk', '2021-06-11 06:00:50.114931'),
('rt94ixdu0p7l4ngzie4nydt005q9n5h5', 'eyJ1c2VyIjoicmFodWxiaG9zYWxlIiwidXNlcmlkIjoxfQ:1lyg26:KGYj-U15CnoxHGHKodnxQHpQvrrhEBnOC-Ei3nATq30', '2021-07-14 19:38:02.380746'),
('rvip6im00ym3pv7dit6kwecuxlaf3yxs', '.eJxVjEEOwiAQRe_C2hCgEBiX7j0DGWYGqZo2Ke3KeHdt0oVu_3vvv1TGbW1567LkkdVZWXX63QrSQ6Yd8B2n26xpntZlLHpX9EG7vs4sz8vh_h007O1bg3OGeYiSgIAHgloMWRi8j4KMREIOA9aSTPE-RQ_igiSqEgCq9er9Af0DOKk:1lqyLD:mSwH0xE7-EGhnRoww39_t7FXTVeEnKYGzRZgBSArfiE', '2021-06-23 13:33:55.139537'),
('vzdgwv6vpv258pvmhonat57ials7vlfo', '.eJxVjEEOwiAQRe_C2hCgEBiX7j0DGWYGqZo2Ke3KeHdt0oVu_3vvv1TGbW1567LkkdVZWXX63QrSQ6Yd8B2n26xpntZlLHpX9EG7vs4sz8vh_h007O1bg3OGeYiSgIAHgloMWRi8j4KMREIOA9aSTPE-RQ_igiSqEgCq9er9Af0DOKk:1lnxIh:DaGXn8KoZhvACHmGpAkVDhyF7x35SpFFW8KWkr3PDy4', '2021-06-15 05:50:51.805154'),
('wu71zswdxgyfmy3lkds03mptd4pqwzt5', 'e30:1llFEZ:_aRHkU5-JlFrpDRmYQC5AaKW1YV77O_PhvwBmj8zHO4', '2021-06-07 18:23:23.657458'),
('yxf281qr9cqsplpfutdatxoi8aqjhn6v', '.eJxVjEEOwiAQRe_C2hCgEBiX7j0DGWYGqZo2Ke3KeHdt0oVu_3vvv1TGbW1567LkkdVZWXX63QrSQ6Yd8B2n26xpntZlLHpX9EG7vs4sz8vh_h007O1bg3OGeYiSgIAHgloMWRi8j4KMREIOA9aSTPE-RQ_igiSqEgCq9er9Af0DOKk:1lp3vG:5NTa-MIE7pHaLTLg3aN-oZln9mdA-Aqy4n-42ZA0OGc', '2021-06-18 07:07:14.148119');

-- --------------------------------------------------------

--
-- Table structure for table `shop_buynow`
--

CREATE TABLE `shop_buynow` (
  `id` bigint(20) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_buynow`
--

INSERT INTO `shop_buynow` (`id`, `pid`, `uid`, `qty`) VALUES
(51, 13, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_cart`
--

CREATE TABLE `shop_cart` (
  `id` bigint(20) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_cart`
--

INSERT INTO `shop_cart` (`id`, `pid`, `uid`, `qty`) VALUES
(8, 12, 1, 2),
(9, 21, 1, 1),
(10, 20, 2, 2),
(11, 17, 2, 1),
(13, 18, 6, 1),
(14, 13, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shop_orderplace`
--

CREATE TABLE `shop_orderplace` (
  `id` bigint(20) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_orderplace`
--

INSERT INTO `shop_orderplace` (`id`, `pid`, `uid`, `qty`, `price`) VALUES
(54, 21, 1, 2, 572),
(55, 12, 1, 2, 572),
(56, 21, 1, 2, 572),
(57, 12, 1, 2, 572),
(58, 17, 2, 1, 345),
(59, 20, 2, 2, 345),
(60, 15, 2, 1, 182),
(61, 17, 6, 2, 230),
(62, 16, 6, 1, 124),
(63, 16, 6, 2, 228),
(64, 13, 6, 3, 672),
(65, 18, 6, 1, 672),
(66, 13, 6, 1, 204),
(67, 21, 1, 2, 572),
(68, 12, 1, 2, 572),
(69, 13, 1, 1, 603),
(70, 21, 1, 1, 603),
(71, 12, 1, 2, 603);

-- --------------------------------------------------------

--
-- Table structure for table `shop_userdata`
--

CREATE TABLE `shop_userdata` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_status` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `mobile_number` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_userdata`
--

INSERT INTO `shop_userdata` (`id`, `username`, `password`, `firstname`, `lastname`, `email`, `user_status`, `address`, `mobile_number`) VALUES
(1, 'rahulbhosale', 'rahul123', 'rahul', 'bhosale', 'rahul@gmail.com', 'BLOCK', 'rahatni phata', 222525252),
(2, 'pravinm', 'pravin123', 'Pravin', 'Mandawakar', 'pravin@gmail.com', 'BLOCK', 'kalewadi phata, near rahatani phata', 9190191919),
(5, 'viruk', 'viru123', 'viru', 'kurzekar', 'nk@gmail.com', 'BLOCK', 'none', 5050505050),
(6, 'abhikhadse', 'abhi123', 'Abhi', 'Khadase', 'abhi@dmail.com', 'BLOCK', 'none', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shop_wishlist`
--

CREATE TABLE `shop_wishlist` (
  `id` bigint(20) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_wishlist`
--

INSERT INTO `shop_wishlist` (`id`, `pid`, `uid`) VALUES
(11, 17, 2),
(13, 13, 2),
(14, 17, 6),
(15, 12, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminapp_category`
--
ALTER TABLE `adminapp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_product`
--
ALTER TABLE `adminapp_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_subcategory`
--
ALTER TABLE `adminapp_subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `shop_buynow`
--
ALTER TABLE `shop_buynow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_cart`
--
ALTER TABLE `shop_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_orderplace`
--
ALTER TABLE `shop_orderplace`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_userdata`
--
ALTER TABLE `shop_userdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_wishlist`
--
ALTER TABLE `shop_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminapp_category`
--
ALTER TABLE `adminapp_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `adminapp_product`
--
ALTER TABLE `adminapp_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `adminapp_subcategory`
--
ALTER TABLE `adminapp_subcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `shop_buynow`
--
ALTER TABLE `shop_buynow`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `shop_cart`
--
ALTER TABLE `shop_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `shop_orderplace`
--
ALTER TABLE `shop_orderplace`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `shop_userdata`
--
ALTER TABLE `shop_userdata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shop_wishlist`
--
ALTER TABLE `shop_wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
