-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2021 a las 15:41:36
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

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
  `ID_material` int(11) NOT NULL,
  `tipo_dni` varchar(3) NOT NULL,
  `nro_dni` int(11) NOT NULL,
  `kilos_acopiados` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`ID_ciudadano`, `nombre`, `apellido`, `direccion`, `telefono`) VALUES
(1, 'Ciudadano', 'Buena onda', 'Cooperativa', '685312684351'),
(2, 'Ciudadano', 'Buena onda', 'Cooperativa', '685312684351');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE `material` (
  `ID_material` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `formato_entrega` varchar(100) NOT NULL,
  `restricciones` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`ID_material`, `nombre`, `formato_entrega`, `restricciones`) VALUES
(2, 'Papel', 'Seco, apilado, sin suciedad', NULL),
(3, 'Cartón', 'Las cajas deben estar desarmadas, limpias y secas', 'No deben estar armadas, sucias y/o mojadas');

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
  `fecha_y_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acopio`
--
ALTER TABLE `acopio`
  ADD PRIMARY KEY (`tipo_dni`,`nro_dni`,`ID_material`),
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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `ID_ciudadano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `ID_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acopio`
--
ALTER TABLE `acopio`
  ADD CONSTRAINT `FK_ACOPIO_CARTONERO` FOREIGN KEY (`tipo_dni`,`nro_dni`) REFERENCES `cartonero` (`tipo_dni`, `nro_dni`),
  ADD CONSTRAINT `FK_ACOPIO_MATERIAL` FOREIGN KEY (`ID_material`) REFERENCES `material` (`ID_material`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_PEDIDO_CIUDADANO` FOREIGN KEY (`ciudadano`) REFERENCES `ciudadano` (`ID_ciudadano`),
  ADD CONSTRAINT `FK_PEDIDO_MATERIAL` FOREIGN KEY (`material`) REFERENCES `material` (`ID_material`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
