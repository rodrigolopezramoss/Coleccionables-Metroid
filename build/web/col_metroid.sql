-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-08-2014 a las 11:18:07
-- Versión del servidor: 5.5.38-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `baloncesto`
--
CREATE DATABASE IF NOT EXISTS `col_metroid` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `col_metroid`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE IF NOT EXISTS `juego`
(`CodJue` int NOT NULL,
`NomJue` VARCHAR(45) NOT NULL,
`DescripJue` VARCHAR(85) NOT NULL,
PRIMARY KEY (`CodJue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


CREATE TABLE IF NOT EXISTS `zona`
(`CodZona` int NOT NULL,
`NomZona` VARCHAR(45) NOT NULL,
`DescripZona`VARCHAR(85) NOT NULL,
`CodJue` int NOT NULL,
FOREIGN KEY (`CodJue`) REFERENCES `juego`(`CodJue`),
PRIMARY KEY (`CodZona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


CREATE TABLE IF NOT EXISTS `coleccionables`
(`CodCol` int NOT NULL,
`NomCol` VARCHAR(45) NOT NULL,
`DescripcionCol` VARCHAR(85) NOT NULL,
`CodJue` int NOT NULL,
`CodZona` int NOT NULL,
FOREIGN KEY (`CodJue`) REFERENCES `juego`(`CodJue`),
FOREIGN KEY (`CodZona`) REFERENCES `zona`(`CodZona`),
PRIMARY KEY (`CodCol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


--
-- Volcado de datos para las tablas
--

INSERT INTO `juego` VALUES
(1,'Metroid/Metroid Zero Mission','Primer juego de la saga'),
(2,'Metroid Prime','Segundo juego de la saga'),
(3,'Metroid Prime 2: Echoes','Tercer juego de la saga');

INSERT INTO `zona` VALUES
(1,'Brinstar','Primera zona del juego',1),
(2,'Norfair','Zona con puntos calientes',1),
(3,'Crateria','Aquí está tu nave, punto de referencia',1),
(10,'Superficie de Tallon','Primera zona del juego',2),
(20,'Ruinas Chozo','Restos de una antigua y próspera civilización',2),
(100,'Tierras del templo','Comienzas el juego en este lugar',3);

INSERT INTO `coleccionables` VALUES
(1,'Expansión de energía','Ascensor de carga de la cubierta Gamma. Parte baja',2,10),
(2,'Expansión de misiles','Túnel del Ascensor B. Bajo el puente',2,10),
(3,'Expansión de energía','19H-15V. Este tanque es el primero que puedes hallar en el juego.',1,1);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
