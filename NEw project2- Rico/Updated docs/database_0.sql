-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 13, 2014 at 03:53 PM
-- Server version: 5.5.32-31.0-log
-- PHP Version: 5.3.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `otu19101_client`
--

-- --------------------------------------------------------

--
-- Table structure for table `Contacto`
--

CREATE TABLE IF NOT EXISTS `Contacto` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Usuario` varchar(15) DEFAULT NULL,
  `Telefono` varchar(12) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Id_Empresa` bigint(20) unsigned NOT NULL,
  `Id_Puesto` bigint(20) unsigned NOT NULL,
  `Id_Contrasena` bigint(20) unsigned DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `Id_Empresa` (`Id_Empresa`,`Id_Puesto`),
  KEY `Id_Puesto` (`Id_Puesto`),
  KEY `Id_Contrasena` (`Id_Contrasena`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `Contacto`
--

INSERT INTO `Contacto` (`Id`, `Nombre`, `Usuario`, `Telefono`, `Email`, `Id_Empresa`, `Id_Puesto`, `Id_Contrasena`, `Activo`) VALUES
(87, 'Viviana Gonzalez', NULL, '3311485043', 'viviana@otu.mx', 146, 5, 103, 1),
(88, 'Juan Carlos Haro', NULL, '--------', 'theforestbeer@hotmail.com', 147, 6, 104, 1),
(89, 'Marco Ballesteros', NULL, '38985761', 'lacafegourmet@hotmail.com', 148, 5, 105, 1),
(90, 'Daniel Placencia', NULL, '3318171600', 'dan_up35@hotmail.com', 149, 5, 106, 1),
(91, 'Angel Espinoza', NULL, '3317164759', 'angel.espinoza@live.com.mx', 150, 5, 107, 1),
(92, 'Antonio Mendez', NULL, '12016731', 'iltonopizza@gmail.com', 151, 5, 108, 1),
(93, 'Guillermo Quiroz', NULL, '3310859043', 'lafaena_gourmet@yahoo.com.mx', 152, 5, 109, 1),
(94, 'Saul ', NULL, '6731068967', 'arq.saulguerrero@gmail.com', 153, 5, 110, 1),
(104, 'Tuticia', NULL, '12345', 'tuti@tuti.com', 163, 6, 120, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Contacts`
--

CREATE TABLE IF NOT EXISTS `Contacts` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Id_User` bigint(20) unsigned NOT NULL,
  `Id_Contact_User` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `Id_User` (`Id_User`),
  KEY `Id_Contact_User` (`Id_Contact_User`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `Contrasenas`
--

CREATE TABLE IF NOT EXISTS `Contrasenas` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Id_Contacto` bigint(20) unsigned DEFAULT NULL,
  `Contrasena` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `Id_Usuario` (`Id_Contacto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `Contrasenas`
--

INSERT INTO `Contrasenas` (`Id`, `Id_Contacto`, `Contrasena`) VALUES
(103, 87, 'contrasena'),
(104, 88, 'contrasena'),
(105, 89, 'contrasena'),
(106, 90, 'contrasena'),
(107, 91, 'contrasena'),
(108, 92, 'contrasena'),
(109, 93, 'contrasena'),
(110, 94, 'contrasena'),
(120, 104, 'qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `Data`
--

CREATE TABLE IF NOT EXISTS `Data` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Id_User` bigint(20) unsigned NOT NULL,
  `Id_Variable` bigint(20) unsigned NOT NULL,
  `Value` double DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Posicion` point DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `Id_User` (`Id_User`),
  KEY `Id_Variable` (`Id_Variable`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2757192 ;

-- --------------------------------------------------------

--
-- Table structure for table `Dias_Semana`
--

CREATE TABLE IF NOT EXISTS `Dias_Semana` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Lunes` tinyint(1) DEFAULT NULL,
  `Martes` tinyint(1) DEFAULT NULL,
  `Miercoles` tinyint(1) DEFAULT NULL,
  `Jueves` tinyint(1) DEFAULT NULL,
  `Viernes` tinyint(1) DEFAULT NULL,
  `Sabado` tinyint(1) DEFAULT NULL,
  `Domingo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Dias_Semana`
--

INSERT INTO `Dias_Semana` (`Id`, `Lunes`, `Martes`, `Miercoles`, `Jueves`, `Viernes`, `Sabado`, `Domingo`) VALUES
(1, 0, 0, 0, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Edades`
--

CREATE TABLE IF NOT EXISTS `Edades` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `18-25` tinyint(1) DEFAULT NULL,
  `26-36` tinyint(1) DEFAULT NULL,
  `37-50` tinyint(1) DEFAULT NULL,
  `51-80` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Edades`
--

INSERT INTO `Edades` (`Id`, `18-25`, `26-36`, `37-50`, `51-80`) VALUES
(1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Empresa`
--

CREATE TABLE IF NOT EXISTS `Empresa` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Domicilio` varchar(100) NOT NULL,
  `Colonia` varchar(50) NOT NULL,
  `Ciudad` varchar(30) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `RFC` varchar(15) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `CodigoPostal` varchar(6) NOT NULL,
  `Edad` tinyint(4) NOT NULL,
  `WEB` varchar(50) NOT NULL,
  `FechaRegistro` date NOT NULL,
  `PosicionGeografica` point NOT NULL,
  `Id_Giro` bigint(20) unsigned NOT NULL,
  `Id_Logo` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `Id_Giro` (`Id_Giro`),
  KEY `Id_Logo` (`Id_Logo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

--
-- Dumping data for table `Empresa`
--

INSERT INTO `Empresa` (`Id`, `Nombre`, `Domicilio`, `Colonia`, `Ciudad`, `Estado`, `RFC`, `Telefono`, `CodigoPostal`, `Edad`, `WEB`, `FechaRegistro`, `PosicionGeografica`, `Id_Giro`, `Id_Logo`) VALUES
(146, 'Tacos de Olla', 'Calle Belen s/n', 'Hacienda San Jose', 'Tlaquepaque', 'Jalisco', '---------', '17305490', '45601', 127, '---------', '2013-11-21', 0x000000000101000000939d8bf56f9a344054c61a2931da59c0, 7, 53),
(147, 'The Forest Beer', 'Independencia 990 (atras del iteso)', 'Arroyo seco', 'Tlaquepaque', 'Jalisco', '------', '38983607', '400601', 127, 'facebook.com/theforestbeer', '2013-11-21', 0x0000000001010000008cd874ffd39a344054c61a298bda59c0, 6, 54),
(148, 'Cofee Time', 'Independencia 990', 'Arroyo seco', 'Tlaquepaque', 'Jalisco', '------', '38985761', '45601', 127, 'facebook.com/CoffeTimeIteso', '2013-11-21', 0x0000000001010000004f4adc91c19a344054c61ac189da59c0, 9, 55),
(149, 'Daniel Plascencia', 'Calle Sinaloa 837-A', 'El Mante', 'Zapopan', 'Jalisco', '------', '3318171600', '45325', 127, '------', '2013-11-21', 0x00000000010100000047a214d7609b344054c61a13ddda59c0, 6, 56),
(150, 'Aloha', 'Periferico Sur 75', 'El Mante', 'Zapopan', 'Jalisco', '----', '3317164759', '45325', 127, '----', '2013-11-21', 0x0000000001010000007a5bf886939c344054c61a2dffda59c0, 6, 57),
(151, 'IL ToÃ±o Pizza', 'Camino al Iteso 8650 Local A2', 'Loma Bonita', 'Tlaquepaque', 'Jalisco', '------', '12016731', '45589', 127, '-------', '2013-11-21', 0x000000000101000000f34fdb07ed9c344054c61af98dda59c0, 9, 58),
(152, 'La Faena Gourmet', 'Av. Camino al Iteso 8650 Local A9', 'Loma Bonita', 'Tlaquepaque', 'Jalisco', '-------', '38555002', '00000', 127, '------', '2013-11-21', 0x000000000101000000822fcefc099d344054c61a6d83da59c0, 6, 59),
(153, 'Sushi Pepe', 'Av. Camino al Iteso 8650  B4B', 'El Mante', 'Tlaquepaque', 'Jalisco', '-----', '3338555292', '00000', 127, '------', '2013-11-21', 0x00000000010100000072b5839ada9c344054c61a5988da59c0, 8, 60),
(163, 'Tuticia', 'Desconocida', 'Desconocida', 'Guadalajara', 'Jalisco', 'Desconocida', '12345', '54321', 127, 'Desconocida', '2013-11-29', 0x000000000101000000001fbc76699b34404450357a35da59c0, 6, 70);

-- --------------------------------------------------------

--
-- Table structure for table `Genero`
--

CREATE TABLE IF NOT EXISTS `Genero` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Femenino` tinyint(1) DEFAULT NULL,
  `Masculino` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Genero`
--

INSERT INTO `Genero` (`Id`, `Femenino`, `Masculino`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Giros`
--

CREATE TABLE IF NOT EXISTS `Giros` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `Giros`
--

INSERT INTO `Giros` (`Id`, `Nombre`, `Descripcion`) VALUES
(5, 'cafe', 'cafe'),
(6, 'bar', 'bar'),
(7, 'tacos', 'tacos'),
(8, 'restaurante', 'restaurante'),
(9, 'Comida Rapida', ''),
(10, 'hot-dogs', ''),
(11, 'pizza', ''),
(28, 'Restaurante-Bar', ''),
(33, 'Hamburguesas', ''),
(34, 'Sishi-Bar', '');

-- --------------------------------------------------------

--
-- Table structure for table `Horarios`
--

CREATE TABLE IF NOT EXISTS `Horarios` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `00:00` tinyint(1) DEFAULT NULL,
  `01:00` tinyint(1) DEFAULT NULL,
  `02:00` tinyint(1) DEFAULT NULL,
  `03:00` tinyint(1) DEFAULT NULL,
  `04:00` tinyint(1) DEFAULT NULL,
  `05:00` tinyint(1) DEFAULT NULL,
  `06:00` tinyint(1) DEFAULT NULL,
  `07:00` tinyint(1) DEFAULT NULL,
  `08:00` tinyint(1) DEFAULT NULL,
  `09:00` tinyint(1) DEFAULT NULL,
  `10:00` tinyint(1) DEFAULT NULL,
  `11:00` tinyint(1) DEFAULT NULL,
  `12:00` tinyint(1) DEFAULT NULL,
  `13:00` tinyint(1) DEFAULT NULL,
  `14:00` tinyint(1) DEFAULT NULL,
  `15:00` tinyint(1) DEFAULT NULL,
  `16:00` tinyint(1) DEFAULT NULL,
  `17:00` tinyint(1) DEFAULT NULL,
  `18:00` tinyint(1) DEFAULT NULL,
  `19:00` tinyint(1) DEFAULT NULL,
  `20:00` tinyint(1) DEFAULT NULL,
  `21:00` tinyint(1) DEFAULT NULL,
  `22:00` tinyint(1) DEFAULT NULL,
  `23:00` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Horarios`
--

INSERT INTO `Horarios` (`Id`, `00:00`, `01:00`, `02:00`, `03:00`, `04:00`, `05:00`, `06:00`, `07:00`, `08:00`, `09:00`, `10:00`, `11:00`, `12:00`, `13:00`, `14:00`, `15:00`, `16:00`, `17:00`, `18:00`, `19:00`, `20:00`, `21:00`, `22:00`, `23:00`) VALUES
(1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Logos`
--

CREATE TABLE IF NOT EXISTS `Logos` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Id_Empresa` bigint(20) unsigned DEFAULT NULL,
  `Logo` longblob NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `Id_Empresa` (`Id_Empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Dumping data for table `Logos`
--

INSERT INTO `Logos` (`Id`, `Id_Empresa`, `Logo`) VALUES
(53, 146, ''),
(54, 147, ''),
(55, 148, ''),
(56, 149, ''),
(57, 150, ''),
(58, 151, ''),
(59, 152, ''),
(60, 153, ''),
(70, 163, '');

-- --------------------------------------------------------

--
-- Table structure for table `Paquetes`
--

CREATE TABLE IF NOT EXISTS `Paquetes` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Valor` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Paquetes`
--

INSERT INTO `Paquetes` (`Id`, `Valor`) VALUES
(1, 100),
(2, 300),
(3, 500),
(4, 800),
(5, 1500),
(6, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `Promocion`
--

CREATE TABLE IF NOT EXISTS `Promocion` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Fecha_Registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Id_Empresa` bigint(20) unsigned NOT NULL,
  `Fecha_Inicio` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Fecha_Fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Id_Genero` bigint(20) unsigned NOT NULL,
  `Id_Edad` bigint(20) unsigned NOT NULL,
  `Id_Transporte` bigint(20) unsigned NOT NULL,
  `Id_Horario` bigint(20) unsigned NOT NULL,
  `Id_Dias_Semana` bigint(20) unsigned NOT NULL,
  `Id_Paquete` bigint(20) unsigned NOT NULL,
  `Mensaje` varchar(141) NOT NULL,
  `Cobertura` set('100','200','300','400','500','600','700','800','900','1km','2km','3km','4km','5km') NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `Id_Empresa` (`Id_Empresa`),
  KEY `Id_Genero` (`Id_Genero`),
  KEY `Id_Edad` (`Id_Edad`),
  KEY `Id_Transporte` (`Id_Transporte`),
  KEY `Id_Horario` (`Id_Horario`),
  KEY `Id_Dias_Semana` (`Id_Dias_Semana`),
  KEY `Id_Paquete` (`Id_Paquete`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `Promociones_Enviadas`
--

CREATE TABLE IF NOT EXISTS `Promociones_Enviadas` (
  `Id` bigint(20) unsigned NOT NULL,
  `Id_Usuario` bigint(20) unsigned NOT NULL,
  `Id_Ruta` bigint(20) unsigned NOT NULL,
  `Id_Promocion` bigint(20) unsigned NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `Id_Usuario` (`Id_Usuario`,`Id_Ruta`,`Id_Promocion`),
  KEY `Id_Promocion` (`Id_Promocion`),
  KEY `Id_Ruta` (`Id_Ruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Promociones_Recibidas`
--

CREATE TABLE IF NOT EXISTS `Promociones_Recibidas` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Id_Promocion_Enviada` bigint(20) unsigned NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `Id_Promocion_Enviada` (`Id_Promocion_Enviada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Promociones_Usadas`
--

CREATE TABLE IF NOT EXISTS `Promociones_Usadas` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Id_Promocion_Enviada` bigint(20) unsigned NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `Id_Promocion_Enviada` (`Id_Promocion_Enviada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Puestos`
--

CREATE TABLE IF NOT EXISTS `Puestos` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `Puestos`
--

INSERT INTO `Puestos` (`Id`, `Nombre`, `Descripcion`) VALUES
(2, 'agente de venta', '-------'),
(3, 'promotor', 'dddddddddd'),
(5, 'director', '--------------'),
(6, 'gerente', ''),
(7, 'jefe', '-------'),
(21, 'socio', ''),
(30, 'test6', ''),
(31, 'test7', '');

-- --------------------------------------------------------

--
-- Table structure for table `Ruta`
--

CREATE TABLE IF NOT EXISTS `Ruta` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Id_Usuario` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `Id_Usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Ruta_Detalles`
--

CREATE TABLE IF NOT EXISTS `Ruta_Detalles` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Ruta` bigint(20) unsigned DEFAULT NULL,
  `Id_Secuencia` bigint(20) unsigned DEFAULT NULL,
  `Id_Sector` bigint(20) unsigned DEFAULT NULL,
  `Coordenadas` point NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Ruta` (`Id_Ruta`),
  KEY `Id_Secuencia` (`Id_Secuencia`),
  KEY `Id_Sector` (`Id_Sector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Ruta_Uso`
--

CREATE TABLE IF NOT EXISTS `Ruta_Uso` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Id_Usuario` bigint(20) unsigned NOT NULL,
  `Hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Id_Punto_Detalle` bigint(20) unsigned NOT NULL,
  `Id_Ruta` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_Punto_Detalle` (`Id_Punto_Detalle`),
  UNIQUE KEY `Id` (`Id`),
  KEY `Id_Ruta` (`Id_Ruta`),
  KEY `Id_Usuario` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Secuencia`
--

CREATE TABLE IF NOT EXISTS `Secuencia` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Ruta` bigint(20) unsigned NOT NULL,
  `Valor` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Ruta` (`Id_Ruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Segmento`
--

CREATE TABLE IF NOT EXISTS `Segmento` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Valor` polygon NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_contacto` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=361 ;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `valor`, `fecha`, `id_contacto`) VALUES
(359, 'eae7a789e759c99d264a8d00a1c0daad85399a6f', '2013-11-29 06:21:04', 104),
(360, '32a1180c6a717eaffda32f3341280871391ba14d', '2013-12-02 21:12:59', 87);

-- --------------------------------------------------------

--
-- Table structure for table `Transporte`
--

CREATE TABLE IF NOT EXISTS `Transporte` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Caminando` tinyint(1) DEFAULT NULL,
  `Bicicleta` tinyint(1) DEFAULT NULL,
  `Autobus` tinyint(1) DEFAULT NULL,
  `Automovil` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Transporte`
--

INSERT INTO `Transporte` (`Id`, `Caminando`, `Bicicleta`, `Autobus`, `Automovil`) VALUES
(1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `Id` bigint(20) unsigned NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` set('f','m') DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `UsersMovil`
--

CREATE TABLE IF NOT EXISTS `UsersMovil` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` set('f','m') DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `Variables`
--

CREATE TABLE IF NOT EXISTS `Variables` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Contacto`
--
ALTER TABLE `Contacto`
  ADD CONSTRAINT `Contacto_ibfk_4` FOREIGN KEY (`Id_Contrasena`) REFERENCES `Contrasenas` (`Id`),
  ADD CONSTRAINT `Contacto_ibfk_2` FOREIGN KEY (`Id_Puesto`) REFERENCES `Puestos` (`Id`),
  ADD CONSTRAINT `Contacto_ibfk_3` FOREIGN KEY (`Id_Empresa`) REFERENCES `Empresa` (`Id`);

--
-- Constraints for table `Empresa`
--
ALTER TABLE `Empresa`
  ADD CONSTRAINT `Empresa_ibfk_2` FOREIGN KEY (`Id_Logo`) REFERENCES `Logos` (`Id`),
  ADD CONSTRAINT `Empresa_ibfk_1` FOREIGN KEY (`Id_Giro`) REFERENCES `Giros` (`Id`);

--
-- Constraints for table `Logos`
--
ALTER TABLE `Logos`
  ADD CONSTRAINT `Logos_ibfk_1` FOREIGN KEY (`Id_Empresa`) REFERENCES `Empresa` (`Id`);

--
-- Constraints for table `Promocion`
--
ALTER TABLE `Promocion`
  ADD CONSTRAINT `Promocion_ibfk_7` FOREIGN KEY (`Id_Paquete`) REFERENCES `Paquetes` (`Id`),
  ADD CONSTRAINT `Promocion_ibfk_1` FOREIGN KEY (`Id_Empresa`) REFERENCES `Empresa` (`Id`),
  ADD CONSTRAINT `Promocion_ibfk_2` FOREIGN KEY (`Id_Genero`) REFERENCES `Genero` (`Id`),
  ADD CONSTRAINT `Promocion_ibfk_3` FOREIGN KEY (`Id_Edad`) REFERENCES `Edades` (`Id`),
  ADD CONSTRAINT `Promocion_ibfk_4` FOREIGN KEY (`Id_Transporte`) REFERENCES `Transporte` (`Id`),
  ADD CONSTRAINT `Promocion_ibfk_5` FOREIGN KEY (`Id_Horario`) REFERENCES `Horarios` (`Id`),
  ADD CONSTRAINT `Promocion_ibfk_6` FOREIGN KEY (`Id_Dias_Semana`) REFERENCES `Dias_Semana` (`Id`);

--
-- Constraints for table `Promociones_Enviadas`
--
ALTER TABLE `Promociones_Enviadas`
  ADD CONSTRAINT `Promociones_Enviadas_ibfk_1` FOREIGN KEY (`Id_Promocion`) REFERENCES `Promocion` (`Id`);

--
-- Constraints for table `Promociones_Recibidas`
--
ALTER TABLE `Promociones_Recibidas`
  ADD CONSTRAINT `Promociones_Recibidas_ibfk_1` FOREIGN KEY (`Id_Promocion_Enviada`) REFERENCES `Promociones_Enviadas` (`Id`);

--
-- Constraints for table `Promociones_Usadas`
--
ALTER TABLE `Promociones_Usadas`
  ADD CONSTRAINT `Promociones_Usadas_ibfk_1` FOREIGN KEY (`Id_Promocion_Enviada`) REFERENCES `Promociones_Enviadas` (`Id`);

--
-- Constraints for table `Ruta_Detalles`
--
ALTER TABLE `Ruta_Detalles`
  ADD CONSTRAINT `Ruta_Detalles_ibfk_3` FOREIGN KEY (`Id_Sector`) REFERENCES `Secuencia` (`Id_Ruta`),
  ADD CONSTRAINT `Ruta_Detalles_ibfk_1` FOREIGN KEY (`Id_Ruta`) REFERENCES `Ruta` (`Id`),
  ADD CONSTRAINT `Ruta_Detalles_ibfk_2` FOREIGN KEY (`Id_Secuencia`) REFERENCES `Secuencia` (`Id_Ruta`);

--
-- Constraints for table `Ruta_Uso`
--
ALTER TABLE `Ruta_Uso`
  ADD CONSTRAINT `Ruta_Uso_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `Users` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
