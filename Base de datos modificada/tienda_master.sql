-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-02-2022 a las 18:39:53
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_master`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Manga Corta'),
(3, 'Manga larga'),
(4, 'Sudaderas'),
(5, 'POP'),
(11, 'Tirantes'),
(24, 'Ofertas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_pedidos`
--

CREATE TABLE `lineas_pedidos` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `unidades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lineas_pedidos`
--

INSERT INTO `lineas_pedidos` (`id`, `pedido_id`, `producto_id`, `unidades`) VALUES
(56, 25, 7, 1),
(57, 26, 2, 2),
(58, 26, 3, 1),
(61, 29, 13, 1),
(64, 31, 5, 1),
(65, 32, 37, 1),
(66, 33, 1, 1),
(67, 34, 37, 1),
(68, 35, 39, 1),
(69, 35, 1, 1),
(70, 36, 1, 1),
(71, 37, 37, 1),
(72, 38, 34, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `coste` float(200,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `provincia`, `localidad`, `direccion`, `coste`, `estado`, `fecha`, `hora`, `fecha_entrega`) VALUES
(25, 1, 'Madrid', 'San Martín', 'C/ Madrid, 3', 37.00, 'sended', '2022-01-02', '22:49:47', '2022-01-12'),
(26, 1, 'sf', 'sf', 'sdf', 36.00, 'sended', '2022-01-02', '23:03:40', '2022-01-14'),
(29, 19, 'Madrid', 'Madrid', 'C/ Cuatro', 1.80, 'confirm', '2022-01-14', '11:00:31', NULL),
(31, 19, 'Madrid', 'Madrid', 'C/ Cuatro', 25.00, 'confirm', '2022-02-06', '17:56:42', NULL),
(32, 19, 'Madrid', 'Madrid', 'C/ Cuatro', 14.95, 'confirm', '2022-02-06', '17:59:50', NULL),
(33, 19, 'Madrid', 'Madrid', 'C/ Cuatro', 10.00, 'confirm', '2022-02-06', '18:02:13', NULL),
(34, 1, 'Madrid', 'Madrid', 'C/ Via Limite ', 14.95, 'confirm', '2022-02-06', '18:33:58', NULL),
(35, 34, 'Madrid', 'Madrid', 'C/ Gran Vía', 28.95, 'confirm', '2022-02-06', '20:23:52', NULL),
(36, 1, 'Madrid', 'Madrid', 'C/ Via Limite ', 10.00, 'confirm', '2022-02-08', '23:09:54', NULL),
(37, 1, 'Madrid', 'Madrid', 'C/ Via Limite ', 12.95, 'confirm', '2022-02-08', '23:49:00', NULL),
(38, 1, 'Madrid', 'Madrid', 'C/ Via Limite ', 10.00, 'confirm', '2022-02-09', '00:04:46', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` float(100,2) NOT NULL,
  `precio_sin_oferta` float(100,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `oferta` varchar(2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `nombre`, `descripcion`, `precio`, `precio_sin_oferta`, `stock`, `oferta`, `fecha`, `imagen`) VALUES
(1, 1, 'Modelo A', 'Camisa sencilla a rayas', 10.00, 0.00, 19, 'no', '2020-12-15', 'ghd.jpg'),
(2, 1, 'Modelo B', 'Marinero', 12.00, 0.00, 1, 'no', '2020-12-15', 'hmgoepprod.jpg'),
(3, 1, 'Sencilla gris', 'Sencilla gris\r\n', 12.00, 15.00, 0, 'si', '2020-12-15', 'uuu.jpg'),
(5, 4, 'Sudadera gris', 'Sudadera gris básica', 25.00, 25.00, 10, 'si', '2020-12-28', '5.jpeg'),
(6, 3, 'Larga R1', 'Camisa larga gris', 11.95, 15.00, 3, 'si', '2020-12-28', '6.jpeg'),
(7, 4, 'Sudadera yellow', 'Sudadera amarilla', 37.00, 37.00, 1, 'no', '2020-12-28', '7.jpeg'),
(11, 3, 'larga bicolor', 'larga bicolor', 21.06, 21.06, 0, 'si', '2020-12-28', '11.jpeg'),
(13, 11, 'Tirantes azul', 'Sencilla azul', 1.80, 1.80, 0, 'si', '2021-02-04', '13.jpeg'),
(15, 1, 'Camiseta Blanca', 'Camiseta Blanca Básica', 11.00, 13.00, 15, 'si', '2022-01-03', '15.jpeg'),
(34, 1, 'Camiseta Letras', 'Camiseta Letras', 10.00, 10.00, 10, 'no', '2022-02-02', '34.jpeg'),
(35, 5, 'Bob Esponja', 'Bob Esponja', 25.00, 25.00, 1, 'no', '2022-02-02', '35.jpeg'),
(36, 5, 'Sudadera Minnie', 'Sudadera Minnie', 22.45, 24.95, 2, 'si', '2022-02-03', '36.jpeg'),
(37, 3, 'Rosa Crop', 'Rosa Crop', 12.95, 13.10, 1, 'si', '2022-02-03', '37.jpeg'),
(38, 1, 'Negra Manga Corta', 'Negra Manga Corta', 5.00, 5.00, 30, 'no', '2022-02-03', '38.jpeg'),
(39, 1, 'Camiseta Colores', 'Camiseta Colores', 18.95, 18.95, 2, 'no', '2022-02-06', '39.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `provincia` varchar(20) NOT NULL,
  `ciudad` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `rol`, `imagen`, `provincia`, `ciudad`, `direccion`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', '$2y$04$ZXAzQItgQpM9SIK8c9uzB.fVToPCDUj8V6W0.sV.vsrPPjSsLuI8q', 'admin', NULL, 'Madrid', 'Madrid', 'C/ Via Limite '),
(19, 'Cristina', 'Rodríguez', 'cris@cris.es', '$2y$04$YJyc2qtW8I7VBlZNTXkCeuBU24dM4nAj8HK2ZfKTvasq2XC4djXIq', 'user', NULL, 'Madrid', 'Madrid', 'C/ Cuatro'),
(20, 'Sergio', 'Rodriguez', 'sergio@sergio.com', '$2y$04$WtbeBgPwADXs6ZpR5NzbQuHwIUkTHB0VX.kDbN7giBJ9FC6dE7GV.', 'user', NULL, '', '', ''),
(24, 'Tolomena', 'Fernandez', 'tolomena@tolomena.com', '$2y$04$Bypd0NfERhuDkIqQevoW9uT.VPmBU1b23rtaueaSdZapSREDFWZaC', 'user', NULL, 'Madrid', 'Madrid', 'C/ Tolomena, 3 '),
(28, 'Hilario', 'Rodríguez', 'hilario@hilario.com', '$2y$04$eDV74B.A7CuCC3iN0ebt.exTeP0Dx678.4SMbs/PFRU1zFyQn7S2G', 'user', NULL, 'Madrid', 'Madrid', 'C/ Hilario'),
(30, 'Pedro', 'Jimenez', 'pedrojimenez@hotmail.com', '$2y$04$myGKJT9GLvyIWJ1J7Haivu6Dn44NiRH9k6sz.b.cA7VL/Hyao3iIK', 'user', NULL, 'Madrid', 'Madrid', 'C/ Jimenez 2'),
(32, 'Dionisio', 'Rodriguez', 'dionisio@rodriguez.com', '$2y$04$9MUkTzIcyZFczpu0Ycj5ieLMs9jv2tmyT4JZVjLTRn.fI54GrIKgu', 'user', NULL, 'Ávila', 'San García de Ingelmos', 'C/ SanGarcia'),
(33, 'Ángel', 'Lopez', 'angel@lopez.com', '$2y$04$CEX8CZv4xkZ.j8HNPXN.pupoHguJPEfZS9ENbOx65hwmYEgQ/jFQC', 'user', NULL, 'Zaragoza', 'Zaragoza', 'C/ Margarita'),
(34, 'Coral', 'Sánchez Pérez', 'coral@coral.es', '$2y$04$LeC5SIC57u7vh2R9qCQPWenWYADhel9R84Bd/YYUFo3zbyHQXKS4q', 'user', NULL, 'Madrid', 'Madrid', 'C/ Gran Vía');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lineas_pedidos`
--
ALTER TABLE `lineas_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_linea_pedido` (`pedido_id`),
  ADD KEY `fk_linea_producto` (`producto_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_usuario` (`usuario_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto_categoria` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `lineas_pedidos`
--
ALTER TABLE `lineas_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lineas_pedidos`
--
ALTER TABLE `lineas_pedidos`
  ADD CONSTRAINT `fk_linea_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_linea_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
