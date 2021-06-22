-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2021 a las 02:01:51
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acopio`
--

INSERT INTO `acopio` (`ID_acopio`, `ID_material`, `tipo_dni`, `nro_dni`, `kilos_acopiados`) VALUES
(3, 5, 'dni', 25368958, 100.00),
(7, 5, 'dni', 43664912, 655.00);

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

--
-- Volcado de datos para la tabla `cartonero`
--

INSERT INTO `cartonero` (`tipo_dni`, `nro_dni`, `nombre`, `apellido`, `direccion`, `fecha_nac`, `vehiculo`) VALUES
('dni', 12345678, 'Pepe', 'Cibrian', 'a la vuelta de la esquina', '2021-06-01', 'Auto'),
('dni', 25368958, 'Raúl', 'Gonzalez', 'San Martín', '2021-06-08', 'Bicicleta'),
('dni', 43664912, 'Julian', 'Pérez', 'Piedras 123', '2021-04-01', 'Camión');

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
(1, 'Ciudadano', 'Buena onda', 'Cooperativa', '0303456'),
(5, 'Juan ', 'Paco', 'Pedro de la Mar 125', '0303456'),
(6, 'Adriana', 'Grigoli', 'San Martin 1097', '2421241215'),
(7, 'Adriana', 'Grigoli', 'San Martin 1097', '2421241215'),
(8, 'Adriana', 'Grigoli', 'San Martin 1097', '2421241215'),
(9, 'Adriana', 'Grigoli', 'San Martin 1097', '2421241215'),
(10, 'Adriana', 'Grigoli', 'San Martin 1097', '2421241215');

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
(5, 'Plásticos', 'Con muchas restricciones', 'No se aceptan envases de yogurt y de queso blanco'),
(8, 'Tetra-Brick', 'llenitos', 'Sin contenido'),
(9, 'Latas de aluminio', 'Aplastadas y secas', 'Sin contenido'),
(10, 'Botellas de vidrio', 'Enteras y secas', 'Sin roturas mayores y sin contenido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID_pedido` int(11) NOT NULL,
  `ciudadano` int(11) NOT NULL,
  `material` int(11) NOT NULL,
  `franja_horaria` varchar(30) NOT NULL,
  `cumple_retiro` tinyint(1) NOT NULL,
  `imagen` varchar(30) DEFAULT NULL,
  `direccion` varchar(30) NOT NULL,
  `fecha_y_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `volumen` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`ID_pedido`, `ciudadano`, `material`, `franja_horaria`, `cumple_retiro`, `imagen`, `direccion`, `fecha_y_hora`, `volumen`) VALUES
(3, 5, 8, 'Turno tarde de 13 pm a 17 pm', 1, NULL, 'Pedro de la Mar 125', '2021-06-22 03:17:00', 'entra en una caja.'),
(4, 6, 5, 'Turno mañana de 9 am a 12 am', 1, NULL, 'San Martin 1097', '2021-06-22 04:46:00', 'entra en el baúl de un auto.'),
(6, 8, 5, 'Turno mañana de 9 am a 12 am', 1, NULL, 'San Martin 1097', '2021-06-22 04:59:00', 'entra en una caja.'),
(7, 9, 5, 'Turno mañana de 9 am a 12 am', 1, NULL, 'San Martin 1097', '2021-06-22 04:59:00', 'entra en una caja.'),
(8, 10, 5, 'Turno mañana de 9 am a 12 am', 1, NULL, 'San Martin 1097', '2021-06-22 05:00:00', 'entra en una caja.');

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
  ADD PRIMARY KEY (`ID_pedido`) USING BTREE,
  ADD KEY `ciudadano` (`ciudadano`,`material`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acopio`
--
ALTER TABLE `acopio`
  MODIFY `ID_acopio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `ID_ciudadano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `ID_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acopio`
--
ALTER TABLE `acopio`
  ADD CONSTRAINT `FK_ACOPIO_CARTONERO` FOREIGN KEY (`tipo_dni`,`nro_dni`) REFERENCES `cartonero` (`tipo_dni`, `nro_dni`),
  ADD CONSTRAINT `acopio_ibfk_1` FOREIGN KEY (`ID_material`) REFERENCES `material` (`ID_material`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_PEDIDO_CIUDADANO` FOREIGN KEY (`ciudadano`) REFERENCES `ciudadano` (`ID_ciudadano`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
