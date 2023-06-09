-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Maio-2023 às 20:10
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `e_maza_game_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-05-08 06:03:38', '2023-05-08 06:03:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'api_subject_id', 'text', 'Api Subject Id', 0, 0, 1, 1, 1, 1, '{}', 3),
(59, 7, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(63, 8, 'id', 'text', 'Id', 1, 1, 0, 0, 0, 0, '{}', 1),
(64, 8, 'level', 'number', 'NIvel:', 1, 1, 1, 1, 1, 1, '{}', 2),
(65, 8, 'description', 'rich_text_box', 'Pergunta:', 1, 1, 1, 1, 1, 1, '{}', 3),
(66, 8, 'correct_answer', 'text', 'Resposta Certa', 1, 1, 1, 1, 1, 1, '{}', 4),
(67, 8, 'wrong_answer_01', 'text', 'Resposta Errada 1', 1, 0, 1, 1, 1, 1, '{}', 5),
(68, 8, 'wrong_answer_02', 'text', 'Resposta Errada 2', 1, 0, 1, 1, 1, 1, '{}', 6),
(69, 8, 'wrong_answer_03', 'text', 'Resposta Errada 3', 1, 0, 1, 1, 1, 1, '{}', 7),
(70, 8, 'user_id', 'text', 'Usuario', 0, 1, 1, 1, 1, 1, '{}', 8),
(71, 8, 'from_exame_details', 'text', 'Do Exame', 0, 0, 1, 1, 1, 1, '{}', 9),
(72, 8, 'subject_id', 'text', 'Disciplina', 1, 1, 1, 1, 1, 1, '{}', 10),
(73, 8, 'image_url', 'image', 'Imagem', 0, 0, 1, 1, 1, 1, '{}', 11),
(74, 8, 'created_at', 'timestamp', 'Criada aos', 0, 1, 1, 0, 0, 1, '{}', 12),
(75, 8, 'updated_at', 'timestamp', 'Actualizada aos:', 0, 0, 1, 0, 0, 0, '{}', 13),
(76, 8, 'deleted_at', 'timestamp', 'Deletada aos', 0, 0, 1, 0, 0, 0, '{}', 14),
(77, 8, 'question_belongsto_user_relationship', 'relationship', 'Usuario', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(78, 8, 'question_belongsto_subject_relationship', 'relationship', 'Disciplina', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Subject\",\"table\":\"subjects\",\"type\":\"belongsTo\",\"column\":\"subject_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(79, 7, 'subject_belongsto_user_relationship', 'relationship', 'Usuario', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(80, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(81, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 9, 'user_id', 'text', 'User Id', 0, 0, 0, 0, 0, 0, '{}', 2),
(83, 9, 'client_id', 'text', 'Client Id', 1, 0, 0, 0, 0, 0, '{}', 3),
(84, 9, 'name', 'text', 'Nome', 0, 1, 1, 1, 1, 1, '{}', 4),
(85, 9, 'scopes', 'text', 'Scopes', 0, 0, 0, 0, 0, 0, '{}', 5),
(86, 9, 'revoked', 'text', 'Revoked', 1, 0, 0, 0, 0, 0, '{}', 6),
(87, 9, 'created_at', 'timestamp', 'Criado aos', 0, 1, 1, 0, 0, 0, '{}', 7),
(88, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(89, 9, 'expires_at', 'text', 'Expira aos', 0, 1, 1, 0, 0, 0, '{}', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Usuario', 'Usuarios', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2023-05-08 06:03:37', '2023-05-08 07:36:15'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(7, 'subjects', 'subjects', 'Subject', 'Subjects', 'voyager-study', 'App\\Models\\Subject', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"name\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-05-08 06:57:05', '2023-05-08 07:28:11'),
(8, 'questions', 'questions', 'Pergunta', 'Perguntas', 'voyager-question', 'App\\Models\\Question', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"description\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-05-08 07:08:53', '2023-05-08 07:24:52'),
(9, 'oauth_access_tokens', 'oauth-access-tokens', 'Oauth Access Token', 'Oauth Access Tokens', 'voyager-key', 'App\\Models\\OauthAccessToken', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-05-09 07:50:22', '2023-05-09 07:53:06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
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
-- Estrutura da tabela `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-05-08 06:03:37', '2023-05-08 06:03:37');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-05-08 06:03:37', '2023-05-08 06:03:37', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 16, 1, '2023-05-08 06:03:37', '2023-05-08 07:39:25', 'voyager.media.index', NULL),
(3, 1, 'Usuario', '', '_self', 'voyager-person', '#000000', NULL, 4, '2023-05-08 06:03:37', '2023-05-08 07:44:30', 'voyager.users.index', 'null'),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 5, '2023-05-08 06:03:37', '2023-05-08 07:44:30', 'voyager.roles.index', NULL),
(5, 1, 'Gerir Site', '', '_self', 'voyager-tools', '#000000', NULL, 7, '2023-05-08 06:03:37', '2023-05-08 07:44:57', NULL, ''),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2023-05-08 06:03:37', '2023-05-08 07:39:37', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2023-05-08 06:03:37', '2023-05-08 07:39:37', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2023-05-08 06:03:37', '2023-05-08 07:39:37', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2023-05-08 06:03:37', '2023-05-08 07:39:37', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 5, '2023-05-08 06:03:37', '2023-05-08 07:42:41', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 16, 3, '2023-05-08 06:03:38', '2023-05-08 07:39:37', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 16, 2, '2023-05-08 06:03:38', '2023-05-08 07:39:29', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 16, 4, '2023-05-08 06:03:38', '2023-05-08 07:39:47', 'voyager.pages.index', NULL),
(14, 1, 'Disciplinas', '', '_self', 'voyager-study', '#000000', NULL, 2, '2023-05-08 06:57:05', '2023-05-08 07:47:50', 'voyager.subjects.index', 'null'),
(15, 1, 'Perguntas', '', '_self', 'voyager-question', '#000000', NULL, 3, '2023-05-08 07:08:53', '2023-05-08 07:48:25', 'voyager.questions.index', 'null'),
(16, 1, 'Outros dados', '', '_self', 'voyager-list', '#000000', NULL, 6, '2023-05-08 07:38:51', '2023-05-08 07:44:30', NULL, ''),
(17, 1, 'Oauth Access Tokens', '', '_self', 'voyager-key', NULL, NULL, 8, '2023-05-09 07:50:23', '2023-05-09 07:50:23', 'voyager.oauth-access-tokens.index', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(10, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(12, '2016_06_01_000004_create_oauth_clients_table', 1),
(13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(14, '2016_10_21_190000_create_roles_table', 1),
(15, '2016_10_21_190000_create_settings_table', 1),
(16, '2016_11_30_135954_create_permission_table', 1),
(17, '2016_11_30_141208_create_permission_role_table', 1),
(18, '2016_12_26_201236_data_types__add__server_side', 1),
(19, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(20, '2017_01_14_005015_create_translations_table', 1),
(21, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(22, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(23, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(24, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(25, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(26, '2017_08_05_000000_add_group_to_settings_table', 1),
(27, '2017_11_26_013050_add_user_role_relationship', 1),
(28, '2017_11_26_015000_create_user_roles_table', 1),
(29, '2018_03_11_000000_add_user_settings', 1),
(30, '2018_03_14_000000_add_details_to_data_types_table', 1),
(31, '2018_03_16_000000_make_settings_value_nullable', 1),
(32, '2019_08_19_000000_create_failed_jobs_table', 1),
(33, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0f7078eac2bb57df488f72a7913071e822f2ce2a5323d02f0986190076c45772c066760abd493a15', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Meu token', '[]', 0, '2023-05-09 08:17:12', '2023-05-09 08:17:13', '2024-05-09 10:17:12'),
('12d307dd81d0dd5f231a8a9c24e4739cc7e3ea8bed5ac2ff45b2673a0640a9d56a48fdd46c4a58a3', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Mais um token', '[]', 0, '2023-05-09 08:29:27', '2023-05-09 08:29:27', '2024-05-09 10:29:27'),
('2d095c5aa15207dc225742a3aa5cc2ba60fa6ae11c405ef1c4a0e344dc17d5054214d0462ca035c0', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Outro token', '[]', 0, '2023-05-09 08:31:50', '2023-05-09 08:31:50', '2024-05-09 10:31:50'),
('34df8161d78fe142cf8608873524f06e94433a51d6945e07be6ed94ecf4e135e52211c869f73e34b', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Mais um token', '[]', 0, '2023-05-09 08:29:05', '2023-05-09 08:29:05', '2024-05-09 10:29:05'),
('3b3329bfd8a6c4f689fe9a73c40d7f7891bff767f3d692419417d7f006a8542cc712d8fbc4f64bec', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Meu token 2', '[]', 0, '2023-05-09 08:50:43', '2023-05-09 08:50:43', '2024-05-09 10:50:43'),
('4fdd1d445cf707878bbe8bb036ea3df5852f699e38a88b20524ccf0f9ce5dd621c1cbb799a830174', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'eMazaApp', '[]', 0, '2023-05-09 08:54:27', '2023-05-09 08:54:27', '2024-05-09 10:54:27'),
('5225a412bf5ca364b747981cdef8095ff1fa8bab6abfaf2cf012a00028b2e93daa8e674ce963fb97', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Ultimo teste', '[]', 0, '2023-05-12 07:44:54', '2023-05-12 07:44:54', '2024-05-12 09:44:54'),
('552701431628cabb0a764b5ebb0a0836b6127927eeb7a03cfb9983765b8ff3f3384b8e2ceb97cdb7', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Mais um token', '[]', 0, '2023-05-09 08:27:56', '2023-05-09 08:27:56', '2024-05-09 10:27:56'),
('59bbc217a0901be2c2352492cdbb239aa760f9b3503d127e2eaeaac1a2cb0fdead1446a0b1c69357', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Xavier Admin\'s Token', '[]', 0, '2023-05-12 07:44:21', '2023-05-12 07:44:22', '2024-05-12 09:44:21'),
('6518aab1a29092b3381bd1fab205001c3a1635532f295bff7db987de84adb76b3586394847936e17', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Meu token 3', '[]', 0, '2023-05-09 08:52:49', '2023-05-09 08:52:49', '2024-05-09 10:52:49'),
('68dc1f938c5a70e2f5a71f79ef72b9851ba8b8385a554fa8330bd873d034eb94def1b806f3265032', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Xavier Admin\'s Token', '[]', 0, '2023-05-12 07:44:02', '2023-05-12 07:44:03', '2024-05-12 09:44:02'),
('6f41a41c54ad604334be5cd2bc26ccb3bfd6cf65824f5c1c4c5670824625b91b5aaaf0adb6f0151c', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Token de teste', '[]', 0, '2023-05-09 08:46:43', '2023-05-09 08:46:43', '2024-05-09 10:46:43'),
('c6f602717475e0604c9ba2ba6d2c05727045953ca0207419aba1bfd49a0f904d28a41d286d125a4f', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Xavier Admin\'s Token', '[]', 0, '2023-05-08 10:04:26', '2023-05-08 10:04:26', '2024-05-08 12:04:26'),
('c8a974e307b99e14c2dd4bec3781eeaa2c3c347a0cd4b7624a65f96c7c9b45f748db002a42e50b7e', 1, '991e1f53-a224-4954-91fe-f37132966da4', 'Xavier Admin\'s Token', '[]', 0, '2023-05-08 10:24:50', '2023-05-08 10:24:50', '2024-05-08 12:24:50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('991e1f39-ab35-4215-b56a-2f8e9202c858', NULL, 'eMazaGame Sever Personal Access Client', 'PmdI0i2mQIqKbWmuVJa1cbeNgQtocgyVsnx3mvkv', NULL, 'http://localhost', 1, 0, 0, '2023-05-08 09:48:39', '2023-05-08 09:48:39'),
('991e1f39-b7ef-450a-844c-3d6a9aa2e228', NULL, 'eMazaGame Sever Password Grant Client', 'WID6H6I5QscsJvFhcxSPiIppuPnB3CCYYnKeYUBP', 'users', 'http://localhost', 0, 1, 0, '2023-05-08 09:48:39', '2023-05-08 09:48:39'),
('991e1f53-a224-4954-91fe-f37132966da4', NULL, 'eMazaGame Sever Personal Access Client', 'vFh7lCnJDzuysIxzZmib8Q6sYwtTZ0Xlk9msvRKK', NULL, 'http://localhost', 1, 0, 0, '2023-05-08 09:48:56', '2023-05-08 09:48:56'),
('991e1f53-ab53-4045-aee3-1df7beabb01d', NULL, 'eMazaGame Sever Password Grant Client', 'bqg3v2TrUnlrqkMwZmzbhg7ER49hFHza8nTsoNL0', 'users', 'http://localhost', 0, 1, 0, '2023-05-08 09:48:56', '2023-05-08 09:48:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '991e1f39-ab35-4215-b56a-2f8e9202c858', '2023-05-08 09:48:39', '2023-05-08 09:48:39'),
(2, '991e1f53-a224-4954-91fe-f37132966da4', '2023-05-08 09:48:56', '2023-05-08 09:48:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-05-08 06:03:38', '2023-05-08 06:03:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(2, 'browse_bread', NULL, '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(3, 'browse_database', NULL, '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(4, 'browse_media', NULL, '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(5, 'browse_compass', NULL, '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(6, 'browse_menus', 'menus', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(7, 'read_menus', 'menus', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(8, 'edit_menus', 'menus', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(9, 'add_menus', 'menus', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(10, 'delete_menus', 'menus', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(11, 'browse_roles', 'roles', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(12, 'read_roles', 'roles', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(13, 'edit_roles', 'roles', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(14, 'add_roles', 'roles', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(15, 'delete_roles', 'roles', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(16, 'browse_users', 'users', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(17, 'read_users', 'users', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(18, 'edit_users', 'users', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(19, 'add_users', 'users', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(20, 'delete_users', 'users', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(21, 'browse_settings', 'settings', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(22, 'read_settings', 'settings', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(23, 'edit_settings', 'settings', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(24, 'add_settings', 'settings', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(25, 'delete_settings', 'settings', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(26, 'browse_categories', 'categories', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(27, 'read_categories', 'categories', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(28, 'edit_categories', 'categories', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(29, 'add_categories', 'categories', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(30, 'delete_categories', 'categories', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(31, 'browse_posts', 'posts', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(32, 'read_posts', 'posts', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(33, 'edit_posts', 'posts', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(34, 'add_posts', 'posts', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(35, 'delete_posts', 'posts', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(36, 'browse_pages', 'pages', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(37, 'read_pages', 'pages', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(38, 'edit_pages', 'pages', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(39, 'add_pages', 'pages', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(40, 'delete_pages', 'pages', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(41, 'browse_subjects', 'subjects', '2023-05-08 06:57:05', '2023-05-08 06:57:05'),
(42, 'read_subjects', 'subjects', '2023-05-08 06:57:05', '2023-05-08 06:57:05'),
(43, 'edit_subjects', 'subjects', '2023-05-08 06:57:05', '2023-05-08 06:57:05'),
(44, 'add_subjects', 'subjects', '2023-05-08 06:57:05', '2023-05-08 06:57:05'),
(45, 'delete_subjects', 'subjects', '2023-05-08 06:57:05', '2023-05-08 06:57:05'),
(46, 'browse_questions', 'questions', '2023-05-08 07:08:53', '2023-05-08 07:08:53'),
(47, 'read_questions', 'questions', '2023-05-08 07:08:53', '2023-05-08 07:08:53'),
(48, 'edit_questions', 'questions', '2023-05-08 07:08:53', '2023-05-08 07:08:53'),
(49, 'add_questions', 'questions', '2023-05-08 07:08:53', '2023-05-08 07:08:53'),
(50, 'delete_questions', 'questions', '2023-05-08 07:08:53', '2023-05-08 07:08:53'),
(51, 'browse_oauth_access_tokens', 'oauth_access_tokens', '2023-05-09 07:50:23', '2023-05-09 07:50:23'),
(52, 'read_oauth_access_tokens', 'oauth_access_tokens', '2023-05-09 07:50:23', '2023-05-09 07:50:23'),
(53, 'edit_oauth_access_tokens', 'oauth_access_tokens', '2023-05-09 07:50:23', '2023-05-09 07:50:23'),
(54, 'add_oauth_access_tokens', 'oauth_access_tokens', '2023-05-09 07:50:23', '2023-05-09 07:50:23'),
(55, 'delete_oauth_access_tokens', 'oauth_access_tokens', '2023-05-09 07:50:23', '2023-05-09 07:50:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(41, 3),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(54, 1),
(55, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-05-08 06:03:38', '2023-05-08 06:03:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `description` text NOT NULL,
  `correct_answer` varchar(150) NOT NULL,
  `wrong_answer_01` varchar(150) NOT NULL,
  `wrong_answer_02` varchar(150) NOT NULL,
  `wrong_answer_03` varchar(150) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `from_exame_details` varchar(150) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `image_url` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `questions`
--

INSERT INTO `questions` (`id`, `level`, `description`, `correct_answer`, `wrong_answer_01`, `wrong_answer_02`, `wrong_answer_03`, `user_id`, `from_exame_details`, `subject_id`, `image_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '<p>Oque e\' laravel?</p>', 'Framework', 'SGBD', 'IDE', 'Linguagem', 1, NULL, 1, NULL, '2023-05-08 07:30:37', '2023-05-08 07:30:37', NULL),
(2, 1, '<p>Oque e\' voyager?</p>', 'Pacote', 'Dependencia', 'Framework', 'IDE', 2, NULL, 3, NULL, '2023-05-08 07:31:36', '2023-05-08 07:31:36', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(2, 'user', 'Normal User', '2023-05-08 06:03:37', '2023-05-08 06:03:37'),
(3, 'professor', 'Professor', '2023-05-08 06:14:31', '2023-05-08 06:14:45');

-- --------------------------------------------------------

--
-- Estrutura da tabela `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'eMazaGame', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Bem vindo a area administrativa do eMazaGame', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\May2023\\ZVqJpuns0qo9cZLzPm0F.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `api_subject_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `api_subject_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Laravel', NULL, 1, '2023-05-08 07:28:27', '2023-05-08 07:28:27', NULL),
(2, 'Quasar', NULL, 1, '2023-05-08 07:28:45', '2023-05-08 07:28:45', NULL),
(3, 'Voyager', NULL, 1, '2023-05-08 07:28:59', '2023-05-08 07:28:59', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-05-08 06:03:38', '2023-05-08 06:03:38'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-05-08 06:03:38', '2023-05-08 06:03:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Xavier Admin', 'admin@admin.com', 'users\\May2023\\1gLwHc0QXY4yhoZhqZ9o.png', NULL, '$2y$10$fqtClANMRjiX/NS8CA0Vv.u0YGeBRQAxwn9vYsnYeMR37M6ozeV1S', 'rmFoici6X7eDMFXnjp8sFumDCOy8SksrtW5xxctXcRrLDBfVl9NctG5gmwjO', '{\"locale\":\"en\"}', '2023-05-08 06:03:38', '2023-05-08 06:11:22'),
(2, 3, 'Xavier Professor', 'antonio_xav@live.com', 'users/default.png', NULL, '$2y$10$J.Q0gfN/4SenXqmwdNQcvOPe2ObyrP/mKodrRvAGjL0fykt9QjeW2', NULL, '{\"locale\":\"pt\"}', '2023-05-08 06:15:54', '2023-05-08 06:15:54'),
(3, 2, 'Xavier User', 'antonio.cxu@gmail.com', 'users/default.png', NULL, '$2y$10$rwcpUO3qCGVKPaf3eoDkQOx44UzMhkoCrgTsru/IDZvmoYxtTRbXm', NULL, '{\"locale\":\"pt\"}', '2023-05-08 06:17:00', '2023-05-08 06:17:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Índices para tabela `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Índices para tabela `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Índices para tabela `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Índices para tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Índices para tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Índices para tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Índices para tabela `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Índices para tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Índices para tabela `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Índices para tabela `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de tabela `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Limitadores para a tabela `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
