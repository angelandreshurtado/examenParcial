-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2016 a las 06:25:27
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Admin', NULL, NULL, 1480521738, 1480521738),
('backend', 2, 'El acceso al panel de administración', NULL, NULL, 1480521739, 1480521739),
('moderator', 1, 'Moderador', NULL, NULL, 1480521738, 1480521738),
('r_main', 2, 'Ver la página de inicio de administración', NULL, NULL, 1480521738, 1480521738),
('r_role', 2, 'Ver los roles y derechos', NULL, NULL, 1480521739, 1480521739),
('r_user', 2, 'Buscando miembros', NULL, NULL, 1480521739, 1480521739),
('w_main', 2, 'Edición de la página de inicio de administración', NULL, NULL, 1480521738, 1480521738),
('w_role', 2, 'Cambio de funciones y derechos', NULL, NULL, 1480521739, 1480521739),
('w_user', 2, 'Cambiar usuario', NULL, NULL, 1480521739, 1480521739);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'backend'),
('admin', 'r_main'),
('admin', 'r_role'),
('admin', 'r_user'),
('admin', 'w_main'),
('admin', 'w_role'),
('admin', 'w_user'),
('moderator', 'backend'),
('moderator', 'r_main'),
('moderator', 'w_main');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`) VALUES
(1, 'departamento1'),
(2, 'departamento2'),
(3, 'departamento3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1480520913),
('m140209_132017_init', 1480520921),
('m140403_174025_create_account_table', 1480520924),
('m140504_113157_update_tables', 1480520945),
('m140504_130429_create_token_table', 1480520952),
('m140506_102106_rbac_init', 1480521142),
('m140830_171933_fix_ip_field', 1480520954),
('m140830_172703_change_account_table_name', 1480520955),
('m141222_110026_update_ip_field', 1480520958),
('m141222_135246_alter_username_length', 1480520961),
('m150502_100114_permissions_add', 1480521739),
('m150502_113940_admin_add', 1480521741),
('m150614_103145_update_social_account_table', 1480520968),
('m150623_212711_fix_username_notnull', 1480520969),
('m151218_234654_add_timezone_to_profile', 1480520970);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_pdt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `id_user`, `id_pdt`) VALUES
(1, 2, 3),
(2, 2, 3),
(3, 3, 2),
(4, 4, 3),
(5, 5, 2),
(6, 5, 1),
(7, 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `cuenta` float NOT NULL DEFAULT '0',
  `id_dpt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `id_user`, `username`, `cuenta`, `id_dpt`) VALUES
(1, 2, 'persona1', 0, 1),
(2, 3, 'persona2', 0.4, 2),
(3, 4, 'persona3', 0.75, 3),
(4, 5, 'persona4', 1.65, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`) VALUES
(1, 'café', 0.5),
(2, 'té', 0.4),
(3, 'agua', 0.75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(2, 'C7fxE8Mxf7cbUC2onc5AHzgP-GYt5CAM', 1480522118, 0),
(3, 'CY_f1xZyYG3Bm5LTEct-qJ_fDOJaXXXb', 1480522128, 0),
(4, 'jCGuaizM0blhzq_bkP0JMhonYHBpx93W', 1480522138, 0),
(5, 'Bs9OzRcthjsuVlsJYpSEYnWEh_9o6zLu', 1480522148, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
(1, 'admin', 'webmaster@example.com', '$2y$13$8NhGkIg4cq5W2ruFN0JSruOSCMfVcf2p50UqdVUhnpNYGlxya/FgS', 'z9_s2uDos8XZHs7vzicKeHohuCmijLTd', NULL, NULL, NULL, NULL, 1480521739, 1480521739, 0),
(2, 'persona1', 'personas1@gmail.com', '$2y$12$ImOGqbsRpitsE/6S5GBDGupiBFZAhIO/6gi8/qNOJZ0eiqfLxFigG', '6AStiCVoykw5fDkdrmgYpGWBn0VDfOj1', NULL, NULL, NULL, '::1', 1480522118, 1480522118, 0),
(3, 'persona2', 'personas2@gmail.com', '$2y$12$4vbo5fql721PiMu9nqBFs.ZBedOtEaVxu4NpwuVTPT.MpOiQFJj/m', 'kuf_rIPA7jhLzmOnQU8JR8mtKyAWUydh', NULL, NULL, NULL, '::1', 1480522128, 1480522128, 0),
(4, 'persona3', 'personas3@gmail.com', '$2y$12$PVl6Us9jhgYQnoUwzC7gjuStkadFCzGNAq1.Ooz70GAMaQgOq55uG', 'nPVr-DYsgiiHxNEZiHWwXBAtMXpyHnpw', NULL, NULL, NULL, '::1', 1480522138, 1480522138, 0),
(5, 'persona4', 'personas4@gmail.com', '$2y$12$HMRpMqyhN.SKD37dMpe.ReRbh/eJXmsXWhMUVhL0rDu7i3ugkRbQO', 'oKclTKXrq5RYRzoZPTV-GSA_dSajNAxw', NULL, NULL, NULL, '::1', 1480522148, 1480522148, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_pdt` (`id_pdt`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dpt` (`id_dpt`),
  ADD KEY `personas_ibfk_1` (`id_user`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `account_unique_code` (`code`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Indices de la tabla `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_email` (`email`),
  ADD UNIQUE KEY `user_unique_username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
