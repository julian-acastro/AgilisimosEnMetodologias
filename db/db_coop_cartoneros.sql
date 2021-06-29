-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2021 a las 21:23:57
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_coop_cartoneros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acopio`
--

CREATE TABLE `acopio` (
  `ID_acopio` int(11) NOT NULL,
  `ID_material` int(11) NOT NULL,
  `tipo_dni` varchar(3) NOT NULL,
  `nro_dni` int(11) NOT NULL,
  `kilos_acopiados` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acopio`
--

INSERT INTO `acopio` (`ID_acopio`, `ID_material`, `tipo_dni`, `nro_dni`, `kilos_acopiados`) VALUES
(1, 1, 'DNI', 33333333, 100.00),
(2, 2, 'DNI', 111111111, 500.00),
(3, 4, 'dni', 2147483647, 20.00),
(4, 3, 'DNI', 33333333, 30.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartonero`
--

CREATE TABLE `cartonero` (
  `tipo_dni` varchar(3) NOT NULL,
  `nro_dni` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `fecha_nac` date NOT NULL,
  `vehiculo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cartonero`
--

INSERT INTO `cartonero` (`tipo_dni`, `nro_dni`, `nombre`, `apellido`, `direccion`, `fecha_nac`, `vehiculo`) VALUES
('DNI', 33333333, 'Nacho', 'El campero', 'el campo', '1998-05-29', 'Camioneta'),
('DNI', 111111111, 'Zurdo', 'Castro', 'a la vuelta de su CASA', '2021-06-29', 'camion'),
('dni', 2147483647, 'Cacho', 'Cambiatodo', 'Con el Nico', '2000-06-29', 'camion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `ID_ciudadano` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL DEFAULT 'Ciudadano',
  `apellido` varchar(30) NOT NULL DEFAULT 'Buena onda',
  `direccion` varchar(30) NOT NULL DEFAULT 'Cooperativa',
  `telefono` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `ID_material` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `formato_entrega` varchar(100) NOT NULL,
  `restricciones` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`ID_material`, `nombre`, `formato_entrega`, `restricciones`) VALUES
(1, 'Papel', 'Embalado, seco, y limpio', 'Hasta ahora no hay.'),
(2, 'Tetrabrik', 'Totalmente vacios, aplastado, embalado', 'Con liquido en su interior'),
(3, 'Botellas de vidrio', 'Limpias, sin liquido en su interior', 'Botellas rotas'),
(4, 'Latas Aluminio', 'Aplastadas', 'NO hay hasta ahora'),
(5, 'Cartón', 'Embalado y cajas desarmadas', 'No tiene');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID_pedido` int(11) NOT NULL,
  `ciudadano` int(11) NOT NULL,
  `material` int(11) NOT NULL,
  `franja_horaria` varchar(10) NOT NULL,
  `cumple_retiro` tinyint(1) NOT NULL,
  `imagen` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) NOT NULL,
  `fecha_y_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `volumen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretaria`
--

CREATE TABLE `secretaria` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `contrasenia` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `secretaria`
--

INSERT INTO `secretaria` (`id_usuario`, `usuario`, `contrasenia`) VALUES
(1, 'secretaria', '$2y$10$3kMdKdDng8QgFRypZdw.CuVsXVwdIIcZ4EdFsysN069SbeAeAu.LS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acopio`
--
ALTER TABLE `acopio`
  ADD PRIMARY KEY (`ID_acopio`),
  ADD KEY `FK_ACOPIO_CARTONERO` (`tipo_dni`,`nro_dni`),
  ADD KEY `FK_ACOPIO_MATERIAL` (`ID_material`);

--
-- Indices de la tabla `cartonero`
--
ALTER TABLE `cartonero`
  ADD PRIMARY KEY (`tipo_dni`,`nro_dni`);

--
-- Indices de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`ID_ciudadano`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`ID_material`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID_pedido`,`ciudadano`,`material`),
  ADD UNIQUE KEY `AK_CIUDADANO_PEDIDO` (`ciudadano`),
  ADD UNIQUE KEY `AK_PEDIDO_MATERIAL` (`material`);

--
-- Indices de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acopio`
--
ALTER TABLE `acopio`
  MODIFY `ID_acopio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `ID_ciudadano` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `ID_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `secretaria`
--
ALTER TABLE `secretaria`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

<<<<<<< HEAD
git branch
=======
>>>>>>> sprint3
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acopio`
--
ALTER TABLE `acopio`
  ADD CONSTRAINT `FK_ACOPIO_CARTONERO` FOREIGN KEY (`tipo_dni`,`nro_dni`) REFERENCES `cartonero` (`tipo_dni`, `nro_dni`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ACOPIO_MATERIAL` FOREIGN KEY (`ID_material`) REFERENCES `material` (`ID_material`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_PEDIDO_CIUDADANO` FOREIGN KEY (`ciudadano`) REFERENCES `ciudadano` (`ID_ciudadano`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PEDIDO_MATERIAL` FOREIGN KEY (`material`) REFERENCES `material` (`ID_material`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
