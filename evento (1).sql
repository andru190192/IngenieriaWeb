-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2017 a las 02:08:04
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `evento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `cur_id` int(10) UNSIGNED NOT NULL,
  `exp_id` int(10) UNSIGNED NOT NULL,
  `cur_nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cur_descripcion` text COLLATE utf8_spanish_ci,
  `cur_precio` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`cur_id`, `exp_id`, `cur_nombre`, `cur_descripcion`, `cur_precio`) VALUES
(1, 1, 'Java Básico', 'Crea proyectos en Java\r\nAprende lo mejor de Java como lenguaje\r\nPrograma orientado a objetos\r\nConectate a bases de datos desde Java', '80.00'),
(2, 2, 'Python y Django', 'Hola Mundo en Python\r\nFunciones y Variables en Python\r\nCrear clases en Python\r\nDjango Profesional\r\nEstructura MVC\r\nConstruir un API RESTful', '80.00'),
(3, 3, 'Introducción a PHP', 'Dominar la programación orientada a objetos\r\nConectarte a bases de datos\r\nAdministrar tus dependencias con Composer\r\nAprender lo nuevo de PHP 7\r\n', '80.00'),
(4, 1, 'Ruby Básico', 'Comprender las partes principales de Ruby\r\nManejar estructuras de datos \r\nEntender el flujo y control de un programa\r\nUsar el intérprete de Ruby\r\n', '80.00'),
(5, 2, 'Go Avanzado', 'Aprovechar al máximo el standard library\r\nCrea web apps con Revel\r\nManeja DBs con Upper.io\r\nConcurrencia con Goroutines\r\nCrea Pruebas Unitarias', '80.00'),
(6, 3, 'React con Redux', 'Compilar tu proyecto con webpack\r\nImplementar Redux\r\nServer-side rendering\r\nDesplegar a producción\r\nCrear componentes con JSX', '80.00'),
(7, 1, 'Angular 4', '\r\nDominar conceptos básicos y avanzados de Angular 4\r\nProgramar con Typescript\r\nDesarrollar un proyecto de Angular 4 de principio a fin\r\nAprender a implementar animaciones en Angular 4\r\nImplementar RxJS', '80.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expositores`
--

CREATE TABLE `expositores` (
  `exp_id` int(10) UNSIGNED NOT NULL,
  `exp_nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `exp_apellido` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `exp_correo` text COLLATE utf8_spanish_ci,
  `exp_web` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `expositores`
--

INSERT INTO `expositores` (`exp_id`, `exp_nombre`, `exp_apellido`, `exp_correo`, `exp_web`) VALUES
(1, 'Pablo', 'Gutierrez', 'pgutierrez@gmail.com', 'www.pablogutierrez.com'),
(2, 'Victor', 'Eras', 'veras@hotmail.es', 'www.victoreras.com'),
(3, 'Adrian', 'Conza', 'aconza@yahoo.es', 'www.adrianconza.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `fac_id` int(10) UNSIGNED NOT NULL,
  `per_id` int(10) UNSIGNED NOT NULL,
  `fact_fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `per_id` int(10) UNSIGNED NOT NULL,
  `cur_id` int(10) UNSIGNED NOT NULL,
  `per_cedula` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `per_nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `per_apellido` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `per_direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `per_correo` text COLLATE utf8_spanish_ci NOT NULL,
  `per_nacionalidad` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_talleres`
--

CREATE TABLE `personas_talleres` (
  `pt_id` int(10) UNSIGNED NOT NULL,
  `per_id` int(10) UNSIGNED NOT NULL,
  `tal_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talleres`
--

CREATE TABLE `talleres` (
  `tal_id` int(10) UNSIGNED NOT NULL,
  `exp_id` int(10) UNSIGNED NOT NULL,
  `tal_nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tal_descripcion` text COLLATE utf8_spanish_ci,
  `tal_precio` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `talleres`
--

INSERT INTO `talleres` (`tal_id`, `exp_id`, `tal_nombre`, `tal_descripcion`, `tal_precio`) VALUES
(1, 1, 'Introducción a Machine Learning', 'Entiende qué es la Inteligencia Artificial y las partes que la componen, aprende qué es machine learning, comienza a utilizar TensorFlow y escribe tus primeros algoritmos de machine learning con Python.', '25.00'),
(2, 2, 'Redes Neuronales y Backpropagation', 'Diseña redes neuronales desde la matemática y el método Backpropagation. La retropropagación es el método de cálculo de errores más usado en Machine Learning. Escribirás el código de una red neuronal que identifique patrones y los recuerde con este taller.', '25.00'),
(3, 3, 'Administración de Servidores Linux', 'Aprende a administrar el sistema operativo más usado en servidores. Configura discos, usuarios, servicios, permisos en un sistema operativo Linux y automatiza procesos con scripts. Prepárate para certificarte como Administrador Linux e inicia tu carrera como DevOps.', '25.00'),
(4, 2, 'Data Science', 'Conviértete en un experto de las Ciencias de Datos y domina técnicas, herramientas y algoritmos usados por profesionales de Data Science. De SQL a Machine Learning. Crea procesos de ETL en local o en AWS.', '25.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`cur_id`),
  ADD KEY `expositor_fk` (`exp_id`);

--
-- Indices de la tabla `expositores`
--
ALTER TABLE `expositores`
  ADD PRIMARY KEY (`exp_id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`fac_id`),
  ADD KEY `cliente_fk` (`per_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`per_id`),
  ADD UNIQUE KEY `per_cedula` (`per_cedula`),
  ADD KEY `curso_fk` (`cur_id`);

--
-- Indices de la tabla `personas_talleres`
--
ALTER TABLE `personas_talleres`
  ADD PRIMARY KEY (`pt_id`),
  ADD KEY `per_id_fk` (`per_id`),
  ADD KEY `tal_id_fk` (`tal_id`);

--
-- Indices de la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD PRIMARY KEY (`tal_id`),
  ADD KEY `exp_fk` (`exp_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `cur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `expositores`
--
ALTER TABLE `expositores`
  MODIFY `exp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `fac_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `per_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas_talleres`
--
ALTER TABLE `personas_talleres`
  MODIFY `pt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `talleres`
--
ALTER TABLE `talleres`
  MODIFY `tal_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `expositor_fk` FOREIGN KEY (`exp_id`) REFERENCES `expositores` (`exp_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `cliente_fk` FOREIGN KEY (`per_id`) REFERENCES `personas` (`per_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `curso_fk` FOREIGN KEY (`cur_id`) REFERENCES `cursos` (`cur_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `personas_talleres`
--
ALTER TABLE `personas_talleres`
  ADD CONSTRAINT `per_id_fk` FOREIGN KEY (`per_id`) REFERENCES `personas` (`per_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tal_id_fk` FOREIGN KEY (`tal_id`) REFERENCES `talleres` (`tal_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `talleres`
--
ALTER TABLE `talleres`
  ADD CONSTRAINT `exp_fk` FOREIGN KEY (`exp_id`) REFERENCES `expositores` (`exp_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
