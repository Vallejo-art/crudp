-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2020 a las 19:26:07
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basepy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `fullname`, `phone`, `email`) VALUES
(1, 'Isaac Salatiel Tovar Covarrubias', '8661544843', 'isaac-salatiel@hotmail.com'),
(16, 'Alan Fidencio Tovar ', '86645623486', 'soy_john-cena@otmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `estatus` int(10) NOT NULL DEFAULT 1,
  `fechaCrea` timestamp NOT NULL DEFAULT current_timestamp(),
  `fechaModifica` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `usuario`, `contraseña`, `estatus`, `fechaCrea`, `fechaModifica`) VALUES
(1, 'Isaac', 'I17050142', 'tec', 1, '2020-10-14 19:01:06', NULL),
(4, 'Pako', 'I17050145', 'tec', 1, '2020-10-15 14:33:53', NULL),
(5, 'Marvin', 'I17050138', 'tec', 1, '2020-10-15 14:34:14', NULL),
(7, 'isaac', 'roxaz', '$2b$12$czwb.yIzODmthAVyTq7tuu5iIa3EytM7A', 1, '2020-10-28 05:46:37', NULL),
(8, 'emanuel', '2', '$2b$12$O3LHUzGHu7j.QHSa4KXZ7O.8EP6QGjMM0', 1, '2020-10-28 05:51:52', NULL),
(9, 'Zory', '2', '$2b$12$kEQRkRXum9zevZC3QT6hauJQWOUqPKleH', 1, '2020-10-28 05:53:01', NULL),
(10, 'isaac', 'roxaz', '$2b$12$jKbzYBweUpfdhhDGseBTrOHdJh2xWtttQ', 1, '2020-10-28 17:34:32', NULL),
(11, 'Alan', 'Alan', '$2b$12$DpiVn87ojohw4K/.xKR6rOWDL8Fp/JYOv', 1, '2020-10-28 17:42:46', NULL),
(12, 'Pako', '', '$2b$12$/WbzEGD9.x9S2Ok5sCnboe0BKxtxlY1kB', 1, '2020-10-28 17:43:59', NULL),
(13, 'ceila ', 'ceila', '$2b$12$XzwKvk7gGagcXibbV7QNMOM1wiXc7qURp', 1, '2020-10-28 17:44:14', NULL),
(18, '3', '3', '$2b$12$rz9nx6nruo/yCz3E6MAJcuNaJeFTIN5Yh8aDgCBXE1MWqTK7lYeJa', 1, '2020-11-03 16:46:54', NULL),
(19, '4', '4', '$2b$12$kGG3vpPVckdtUEXEOdOvCufvyYFdUMcpdfO93vZIaULJO/VC0cYcy', 1, '2020-11-03 16:48:06', NULL),
(20, 'isaac', 'isaac', '$2b$12$WfJ.ma4Ka8jrr7Xq4ABP9OTHEPqW7s5dzwMmrAgYIZJb2SDaYI.d2', 1, '2020-11-03 16:51:27', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
