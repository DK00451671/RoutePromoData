-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 19, 2013 at 02:42 AM
-- Server version: 5.5.32-31.0-log
-- PHP Version: 5.3.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `otu19101_PVM`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categoria`
--

CREATE TABLE IF NOT EXISTS `Categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `Categoria`
--

INSERT INTO `Categoria` (`id`, `valor`) VALUES
(1, 'Reposteria'),
(2, 'Dulceria'),
(3, 'Desechable'),
(4, 'Fiestas'),
(5, 'Abarrotes'),
(6, 'Plasticos');

-- --------------------------------------------------------

--
-- Table structure for table `Clase`
--

CREATE TABLE IF NOT EXISTS `Clase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `Clase`
--

INSERT INTO `Clase` (`id`, `valor`) VALUES
(3, 'Servicio a domicilio');

-- --------------------------------------------------------

--
-- Table structure for table `Cliente`
--

CREATE TABLE IF NOT EXISTS `Cliente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreComercio` varchar(50) NOT NULL,
  `nombreCliente` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `posGeo` point DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `idGiroComer` bigint(20) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `estatus` enum('activo','inactivo') NOT NULL,
  `idClase` bigint(20) NOT NULL,
  `idZona` bigint(20) NOT NULL,
  `diasCredito` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idClase` (`idClase`,`idZona`),
  KEY `idClase_2` (`idClase`,`idZona`),
  KEY `idZona` (`idZona`),
  KEY `idZona_2` (`idZona`),
  KEY `idGiroComer` (`idGiroComer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=222 ;

--
-- Dumping data for table `Cliente`
--

INSERT INTO `Cliente` (`id`, `nombreComercio`, `nombreCliente`, `direccion`, `posGeo`, `referencia`, `idGiroComer`, `telefono`, `comentario`, `estatus`, `idClase`, `idZona`, `diasCredito`) VALUES
(50, 'Rey Maya', 'desconocido', 'desconocida', NULL, 'Frente a carniceria la Alameda', 7, 'desconocido', 'NULL', 'activo', 3, 17, 0),
(51, 'Tacos Ruben', 'Rube', 'Morelos esquina Pedro Figueroa', NULL, 'Fuera del OXXO de Morelos', 1, 'desconocido', 'NULL', 'inactivo', 3, 1, 0),
(52, 'la flor de san luis', 'no', 'int. mdo. hidalgo', NULL, 'no', 20, 'no', 'NULL', 'activo', 3, 18, 0),
(53, 'fted', 'tyur', 'morelos', NULL, '000', 1, '67859', 'NULL', 'inactivo', 3, 1, 0),
(55, 'jugos del puente', 'lilia', 'Boulevard y Guadalupe Victoria', NULL, 'frente paleteria michoacana', 21, 'no', 'NULL', 'activo', 3, 19, 0),
(56, 'desayuno Cheli', 'Araceli', 'mercado Morelos plancha 245', NULL, 'contra esquina tortilleria', 65, '461 128 40 4', 'NULL', 'activo', 3, 1, 0),
(57, 'fonda Rosy', 'Rosy', 'mercado Hidalgo plancha 6 planta alta', NULL, 'subiendo escaleras a mano derecha', 9, 'no', 'NULL', 'activo', 3, 18, 0),
(58, 'fonda Lupita', 'Lupita', 'mercado Hidalgo plancha  8', NULL, 'subiendo escaleras a mano derecha la ultima', 9, 'no', 'NULL', 'activo', 3, 18, 0),
(59, 'semillas y chiles don Chava', 'Chava', 'mercado Hidalgo local 22', NULL, ' por la capilla al fondo y vuelta a mano derecha ', 20, 'no', 'NULL', 'activo', 3, 18, 0),
(60, 'chiles y mole', 'no', 'mercado Hidalgo local 119 pasillo 6', NULL, 'atras de plaza de zapatos', 20, 'no', 'NULL', 'activo', 3, 18, 0),
(61, 'semillas y chiles', 'no', 'mercado Hidalgo local 20', NULL, 'por la capilla al fondo a la derecha', 20, 'no', 'NULL', 'activo', 3, 18, 0),
(62, 'la feria del mole', 'no', 'mercado Hidalgo local 39 pasillo 6', NULL, 'atras de plaza de zapatos', 20, 'no', 'NULL', 'activo', 3, 18, 0),
(63, 'cremeria y salchichoneria', 'no', 'mercado Hidalgo local 41', NULL, 'por capilla vuelta a la derecha y al final', 22, 'no', 'NULL', 'activo', 3, 18, 0),
(64, 'fonda doÃ±a Lupe', 'Lupe', 'mercado hidalgo plancha 196-198', NULL, 'pasillo central a lado de la luna', 9, 'no', 'NULL', 'activo', 3, 18, 0),
(65, 'tacos Alex', 'no', 'ext. mdo Hidalgo ', NULL, ' a lado de estacionamiento mdo hidalgo', 1, 'no', 'NULL', 'activo', 3, 18, 0),
(66, 'delichurros', 'no', 'andador corregidora ', NULL, 'por empanadas Guille', 23, 'no', 'NULL', 'activo', 3, 19, 0),
(67, 'bolsas y joyeria el Carmen', 'no', 'el Carmen', NULL, 'frente a quesadillas Gaspe', 24, 'no', 'NULL', 'activo', 3, 19, 0),
(68, 'cajetas la Vencedora', 'no', 'Manuel Doblado', NULL, 'frente a Ryse', 25, 'no', 'NULL', 'activo', 3, 19, 0),
(69, 'puesto de frutas', 'no', 'mercado Hidalgo plancha 40', NULL, '3er pasillo ', 26, 'no', 'NULL', 'activo', 3, 18, 0),
(70, 'el puestecito', 'no', 'calzada esquina Morelos', NULL, 'afuera farmacia  del ahorro', 27, 'no', 'NULL', 'activo', 3, 19, 0),
(71, 'gorditas tercera orden', 'no', 'calzada Independencia ', NULL, 'afuera templo tercera orden', 2, 'no', 'NULL', 'activo', 3, 6, 0),
(72, 'puesto dulces regionales', 'no', 'Boulevard y puente peatonal', NULL, 'salir por plaza de zapatos vuelta a la izquierda ', 28, 'no', 'NULL', 'activo', 3, 20, 0),
(73, 'puesto de camotes', 'no', 'boulevard y puente peatonal', NULL, 'bajando puente,parada de camion, tianguis lunes', 29, 'no', 'NULL', 'activo', 3, 20, 0),
(74, 'gorditas', 'no', 'Boulevard y Guadalupe Victoria', NULL, 'frente paleteria michoacana', 2, 'no', 'NULL', 'activo', 3, 20, 0),
(75, 'gorditas Lupita', 'Lupita', 'Morelos 281-a ', NULL, 'Morelos y 16 de Septiembre', 2, 'no', 'NULL', 'activo', 3, 21, 0),
(76, 'La burbuja feliz', 'no', '16 de Septiembre ', NULL, 'entre morelos y madero', 30, 'no', 'NULL', 'activo', 3, 22, 0),
(77, 'tacos de canasta Luis', 'Luis', '16 de septiembre ', NULL, 'frente al OXXO , ', 1, 'no', 'NULL', 'activo', 3, 22, 0),
(78, 'cocina economica Yoko', 'no', '16 de septiembre  ', NULL, 'esquina con texcoco', 9, 'no', 'NULL', 'activo', 3, 22, 0),
(79, 'tortas Hilarion', 'Hilarion', 'boulevard ', NULL, 'boulevard y agrarismo', 31, 'no', 'NULL', 'activo', 3, 20, 0),
(80, 'cajetas la Reyna', 'no ', 'ext. mercado morelos ', NULL, 'a lado perfumeria la principal', 25, 'no', 'NULL', 'activo', 3, 1, 0),
(81, 'malteadas', 'Conchita', 'plan de iguala 408', NULL, 'frente a estacionamiento CMQ', 9, 'no', 'NULL', 'activo', 3, 21, 0),
(82, 'boutique Imagen', 'no', 'centro comercial morelos  interior', NULL, 'frente papeleria nuevo mundo', 32, 'no', 'NULL', 'activo', 3, 21, 0),
(83, 'centro naturista Samar', 'no', 'morelos , plaza de sn Francisco interior', NULL, 'frente mercado Morelos', 7, '61 6b 08 61', 'NULL', 'activo', 3, 21, 0),
(84, 'pasteleria del bajio ', 'no', 'Allende ', NULL, 'frente jardin de sn Agustin', 33, 'no', 'NULL', 'activo', 3, 23, 0),
(85, 'dulces  regionales', 'Rosa', 'calzada Independencia', NULL, 'exterior templo de tercera orden', 28, 'no', 'NULL', 'activo', 3, 6, 0),
(86, 'Joyeria  Acuario', 'no', 'pasaje Guadalupe 12', NULL, 'frente al jardin principal antes de Copel', 24, 'no', 'NULL', 'activo', 3, 8, 0),
(87, 'Hamburguesas Tresguerras', 'no', 'Carmen esquina Tresguerras', NULL, 'a lado del templo del Carmen', 34, 'no', 'NULL', 'activo', 3, 24, 0),
(88, 'tacos el norteÃ±o', 'no', 'Boulevard esquina Allende', NULL, 'a lado de farmacia del Ahorro', 1, 'no', 'NULL', 'activo', 3, 20, 0),
(89, 'Chicharrones y frituras Martha Mireya', 'no', 'jardin principal', NULL, 'frente a Copel', 35, 'no', 'NULL', 'activo', 3, 8, 0),
(90, 'chicharrones y frituras doÃ±a Rosy', 'no', 'jardin principal ', NULL, 'frente de zapateria Capa de Ozono', 35, 'no', 'NULL', 'activo', 3, 8, 0),
(91, 'estetica Zara', 'no', 'andador Nicolas Bravo 106', NULL, 'entrar por allende a media cuadra izquierda', 36, 'no', 'NULL', 'activo', 3, 25, 0),
(92, 'estetica Carmela', 'no', 'andador Nicolas Bravo 104-a', NULL, 'entrar por Allende a media cuadra izquierda', 36, 'no', 'NULL', 'activo', 3, 25, 0),
(93, 'estetica Rosy', 'no', 'Pedro Figueroa', NULL, 'frente mercado Morelos ', 36, 'no', 'NULL', 'activo', 3, 1, 0),
(94, 'estetica Stlits', 'no', 'centro comercial Morelos interior', NULL, 'frente papeleria nuevo mundo', 36, 'no', 'NULL', 'activo', 3, 21, 0),
(95, 'paleteria de yogurth', 'no', 'morelos', NULL, 'a lado del OXXO', 37, 'no', 'NULL', 'activo', 3, 21, 0),
(96, 'Rostiseria Mexico', 'no', 'morelos', NULL, 'a lado de papeleria nuevo mundo', 38, 'no', 'NULL', 'activo', 3, 21, 0),
(97, 'Aguas de coco', 'no', 'Morelos esq Luis Cortazar', NULL, 'a lado del salon de mercado Morelos', 6, 'no', 'NULL', 'activo', 3, 21, 0),
(98, 'Aguacates y miel', 'no', 'morelos', NULL, 'a lado del OXXO', 39, 'no', 'NULL', 'activo', 3, 21, 0),
(99, 'Aguas frescas', 'no', 'Nicolas Bravo', NULL, 'frente plaza de los zapatos', 6, 'no', 'NULL', 'activo', 3, 25, 0),
(100, 'chicharrones', 'no', 'jardin de sn Agustin', NULL, 'entre casa de la cultura y traje regionales purisima', 35, 'no', 'NULL', 'activo', 3, 26, 0),
(101, 'Italian pizza', 'no', 'Portal Colunga', NULL, 'andador santa Cecilia, lado de parisina', 40, 'no', 'NULL', 'activo', 3, 19, 0),
(102, 'Cerveza de Raiz', 'no', 'Portal Colunga', NULL, 'andador sta Cecilia , lado parisina', 9, 'no', 'NULL', 'activo', 3, 19, 0),
(103, 'Paleteria la Michoacana', 'no', 'Portal Colunga', NULL, 'andador sta Cecilia esq. con precios de Mexico', 37, 'no', 'NULL', 'activo', 3, 19, 0),
(104, 'Tacos de canasta el jardin', 'no', 'jardin principal', NULL, 'esquina precios de Mexico', 1, 'no', 'NULL', 'activo', 3, 8, 0),
(105, 'Don Crispy', 'no', 'Andador Gongora 100', NULL, 'a lado  de Banamex', 9, 'no', 'NULL', 'activo', 3, 19, 0),
(106, 'Helados y paletas Wing', 'no', 'Andador Gongora', NULL, 'frente a Banamex', 37, 'no', 'NULL', 'activo', 3, 19, 0),
(107, 'Chicharrones seÃ±or Gallo', 'no', 'calzada independencia', NULL, 'a lado del monumento Juan Pablo II', 35, 'no', 'NULL', 'activo', 3, 6, 0),
(108, 'Pronto torta', 'no', 'Guadalupe 107 -a ', NULL, 'entre Madero y 5 de Mayo', 31, 'no', 'NULL', 'activo', 3, 27, 0),
(109, 'Aguas frescas y elotes', 'no', 'jardin de sn Agustin', NULL, 'frente a trajes regionales la purisima', 6, 'no', 'NULL', 'activo', 3, 26, 0),
(110, 'Tostadas de cueritos El Carmen', 'no', 'Carmen', NULL, 'Carmen esquina andadpr Corregidora', 41, 'no', 'NULL', 'activo', 3, 24, 0),
(111, 'Cafe Dolce Peccati', 'no', 'Madero', NULL, 'entre Obregon y Calzada Independencia', 42, 'no', 'NULL', 'activo', 3, 28, 0),
(112, 'Comida corrida Jerico', 'no', 'Guadalupe 128-c', NULL, 'entre Madero y 5 de Mayo', 9, 'no', 'NULL', 'activo', 3, 27, 0),
(113, 'Tortas,desayunos y copias', 'no', 'Guadalupe 217', NULL, 'entre 5 de Mayo y Manuel Altamirano', 9, 'no', 'NULL', 'activo', 3, 27, 0),
(114, 'Cafe reposteria ', 'no', 'Guadalupe', NULL, 'entre la paz y Manuel Altamirano', 42, 'no', 'NULL', 'activo', 3, 27, 0),
(115, 'Caramel ', 'no', 'Manuel Altamirano 241 -a', NULL, 'alameda y Guadalupe', 42, 'no', 'NULL', 'activo', 3, 17, 0),
(116, 'Hawallan Paradise', 'no', 'Andador Gongora 113-b', NULL, 'entre Kodak y Helados Regios', 42, 'no', 'NULL', 'activo', 3, 19, 0),
(117, 'Puesto de dulces regionales', 'no', 'Andador Corregidora', NULL, 'frente a Telmex', 28, 'no', 'NULL', 'activo', 3, 24, 0),
(118, 'Cacahuates y elotes don Mario', 'no', 'Alameda', NULL, 'lado de los juegos', 43, 'no', 'NULL', 'activo', 3, 17, 0),
(119, 'Fresas congeladas y chocomiles', 'no', 'Alameda', NULL, 'lado de los juegos', 44, 'no', 'NULL', 'activo', 3, 17, 0),
(120, 'Tostadas 2x1', 'no', 'Alameda', NULL, 'lado de los juegos', 41, 'no', 'NULL', 'activo', 3, 17, 0),
(121, 'Tostadas el Tochon', 'no', 'Alameda', NULL, 'lado de los juegos', 41, 'no', 'NULL', 'activo', 3, 17, 0),
(122, 'Vaquitas Alameda', 'no', 'Alameda', NULL, 'lado de juegos', 45, 'no', 'NULL', 'activo', 3, 17, 0),
(123, 'Elotes el nuevo Kiosko', 'no', 'Alameda', NULL, 'lado de juegos ', 43, 'no', 'NULL', 'activo', 3, 17, 0),
(124, 'Tostadas el  Tochon 2', 'no ', 'Alameda', NULL, 'lado de juegos', 41, 'no', 'NULL', 'activo', 3, 17, 0),
(125, 'Cafe Expresso', 'no', 'Riva Palacio', NULL, 'a una cuadra de la alameda', 42, 'no ', 'NULL', 'activo', 3, 29, 0),
(126, 'Tomates y ensaladas', 'no', 'Riva Palacio 227', NULL, 'a lado de carniceria  alameda', 9, 'no', 'NULL', 'activo', 3, 29, 0),
(127, 'Cheers restaurant bar', 'no', 'Riva Palacio 227 ', NULL, 'arriba de carniceria alameda', 7, 'no', 'NULL', 'activo', 3, 29, 0),
(128, 'Abarrotes , frutas  y verduras', 'no', 'Riva Palacio 201-b', NULL, '5 de Mayo y Riva Palacio', 46, 'no', 'NULL', 'activo', 3, 29, 0),
(129, 'BuÃ±uelos doÃ±a Luz', 'no', 'calzada independencia', NULL, 'atras de monumento Juan Pablo II', 48, 'no', 'NULL', 'activo', 3, 6, 0),
(130, 'BuÃ±uelos Juanita', 'no', 'calzada independencia', NULL, 'a un costado de monumento Juan PabloII', 48, 'no', 'NULL', 'activo', 3, 6, 0),
(131, 'buÃ±uelos la Chinita', 'no', 'calzada independencia', NULL, 'afuera puerta lateral Sn Francisco', 48, 'no', 'NULL', 'activo', 3, 6, 0),
(132, 'buÃ±uelos LupÃ­ta', 'no', 'calzada independencia', NULL, 'atras de tostadas de cueritos por banqueta', 48, 'no', 'NULL', 'activo', 3, 6, 0),
(133, 'Tostadas Agus', 'no', 'calzada independencia', NULL, 'frente a monumento Juan Pablo II', 41, 'no', 'NULL', 'activo', 3, 6, 0),
(134, 'Cueritos 2', 'no', 'calzada independencia', NULL, 'a lado del arbol ,frente a catedral', 41, 'no', 'NULL', 'activo', 3, 6, 0),
(135, 'jugos y elotes Martha', 'no', 'andador Nicolas Bravo', NULL, 'afuera de refrigeraciones nieto', 21, 'no', 'NULL', 'activo', 3, 25, 0),
(136, 'tacos la abuela', 'no', 'morelos', NULL, 'frente dulceria  salazar', 1, 'no', 'NULL', 'activo', 3, 21, 0),
(137, 'tortas chucky', 'no', 'andador gongora', NULL, 'afuera de Banamex', 31, 'no', 'NULL', 'activo', 3, 30, 0),
(138, 'Tacos de canasta la guera', 'no', 'gongora', NULL, 'afuera de Banamex', 1, 'no', 'NULL', 'activo', 3, 30, 0),
(139, 'Gorditas 2', 'no', 'calzada independencia', NULL, 'afuera de catedral , a orilla de banqueta', 2, 'no', 'NULL', 'activo', 3, 6, 0),
(140, 'gorditas catedral', 'no', 'calzada independencia', NULL, 'esquina puerta de catedral', 2, 'no', 'NULL', 'activo', 3, 6, 0),
(141, 'tortas las Tortugas 2', 'no', 'Madero', NULL, 'Madero esquina Guadalupe frente a catedral', 31, 'no', 'NULL', 'activo', 3, 28, 0),
(142, 'tacos de canasta El gordo', 'no', 'Gongora', NULL, 'afuera de Kodak', 1, 'no', 'NULL', 'activo', 3, 30, 0),
(143, 'tortas las Tortugas', 'no', 'calzada independencia 101-a', NULL, 'a lado de farmacia del Ahorro', 31, 'no', 'NULL', 'activo', 3, 6, 0),
(144, 'cintos y carteras', 'no', 'calzada independencia', NULL, 'afuera farmacia del Ahorro ', 49, 'no', 'NULL', 'activo', 3, 6, 0),
(145, 'aguacates y frutas', 'no', 'morelos', NULL, 'frente a dulceria salazar', 39, 'no', 'NULL', 'activo', 3, 21, 0),
(146, 'tacos Celaya', 'no', 'Nicolas Bravo', NULL, 'afuera de dulceria Salazar', 1, 'no', 'NULL', 'activo', 3, 25, 0),
(147, 'tacos Sn Agustin', 'no', 'Nicolas Bravo', NULL, 'afuera dulceria salazar', 1, 'no', 'NULL', 'activo', 3, 25, 0),
(148, 'tostadas Sn Agustin', 'no', 'plaza de Sn Agustin', NULL, 'frente a trajes regionales la purisima', 41, 'no', 'NULL', 'activo', 3, 31, 0),
(149, 'tortilleria Mary', 'no', 'andador Guadalupana - Boulevard', NULL, 'ext 2a puerta mdo Hidalgo', 50, 'no', 'NULL', 'activo', 3, 32, 0),
(150, 'tacos de higado', 'no', 'Boulevard', NULL, 'andador Guadalupana-Boulevard esquina', 1, 'no', 'NULL', 'activo', 3, 20, 0),
(151, 'aguacates', 'no', 'andador Guadalupana-Boulevard', NULL, 'a lado de tacos de higado ', 39, 'no', 'NULL', 'activo', 3, 20, 0),
(152, 'Rosti Pizza', 'no', 'boulevard', NULL, 'a dos locales de tacos de higado hacia Coppel', 40, 'no', 'NULL', 'activo', 3, 20, 0),
(153, 'tacos de bisteck el chino', 'no', 'Morelos', NULL, 'frente a tacos Zalaya', 1, 'no', 'NULL', 'activo', 3, 21, 0),
(154, 'gorditas Adrian', 'no', 'mercado Morelos', NULL, 'puerta lateral derecha 1a', 2, 'no', 'NULL', 'activo', 3, 1, 0),
(155, 'tortas Julio', 'no', 'mercado Morelos', NULL, 'puerta lateral derecha 1a', 31, 'no', 'NULL', 'activo', 3, 1, 0),
(156, 'jugos Leo', 'no', 'mercado Morelos', NULL, '2a calle lado derecho ', 66, 'no', 'NULL', 'activo', 3, 1, 0),
(157, 'frutas frescas Mary Chuy', 'no', 'andador Nicolas Bravo', NULL, 'esquina con Zaragoza', 26, 'no', 'NULL', 'activo', 3, 25, 0),
(158, 'jugos Sandy', 'no', 'andador Nicolas Bravo', NULL, 'esquina Zaragoza', 21, 'no', 'NULL', 'activo', 3, 25, 0),
(159, 'tacos dorados Lupita', 'no', 'morelos', NULL, 'frente tacos Zalaya', 1, 'no', 'NULL', 'activo', 3, 21, 0),
(160, 'tacos dorados', 'no', 'morelos', NULL, 'frente tacos Zalaya', 1, 'no', 'NULL', 'activo', 3, 21, 0),
(161, 'aguas frescas 2', 'no', 'morelos', NULL, 'frente a tacos Zalaya', 6, 'no', 'NULL', 'activo', 3, 21, 0),
(162, 'fruta picada', 'no', 'calzada independencia', NULL, 'atras monumento Juan Pablo II', 26, 'no', 'NULL', 'activo', 3, 6, 0),
(163, 'aguas frescas 3', 'no', 'calzada independencia', NULL, 'a la izquierda del monumento Juan Pablo II', 6, 'no', 'NULL', 'activo', 3, 6, 0),
(164, 'pescados dorados', 'no', 'morelos', NULL, 'afuera del OXXO', 51, 'no', 'NULL', 'activo', 3, 21, 0),
(165, 'tacos Zalaya', 'no', 'morelos', NULL, 'frente dulceria salazar', 1, 'no', 'NULL', 'activo', 3, 21, 0),
(166, 'tacos morelos', 'no', 'morelos', NULL, 'a lado de Coppel plaza morelos', 1, 'no', 'NULL', 'activo', 3, 21, 0),
(167, 'Pranzo Pizza', 'no', 'morelos', NULL, 'a lado de Coppel plaza morelos', 40, 'no', 'NULL', 'activo', 3, 21, 0),
(168, 'fuente de sodas Rayito de luna', 'no', 'ext mercado Morelos 65', NULL, 'calle lateral derecha ext mdo morelos', 52, 'no', 'NULL', 'activo', 3, 1, 0),
(169, 'fruteria', 'no', 'andador Guadalupana -Boulevard', NULL, 'afuera de Guadalupana', 26, 'no', 'NULL', 'activo', 3, 33, 0),
(170, 'bisuteria Glamour', 'no', 'andador corregidora', NULL, ' a  lado de Telmex', 53, 'no', 'NULL', 'activo', 3, 34, 0),
(171, 'empanadas la tia Guille', 'no', 'andador corregidora', NULL, 'cerca de Telmex', 54, 'no', 'NULL', 'activo', 3, 34, 0),
(172, 'bisuteria Impor 5', 'no', 'andador corregidora 102-b', NULL, 'lado de Telmex', 53, 'no', 'NULL', 'activo', 3, 34, 0),
(173, 'ropa casual', 'no', 'andador corregidora 102', NULL, 'lado de Telmex', 32, 'no', 'NULL', 'activo', 3, 34, 0),
(174, 'ceramica', 'no', 'portal Colunga', NULL, 'frente a panaderia del Sol', 55, 'no', 'NULL', 'activo', 3, 35, 0),
(175, 'hierberas 55-b', 'no', 'andador Guadalupana-Boulevard', NULL, 'afuera de guadalupana', 56, 'no', 'NULL', 'activo', 3, 33, 0),
(176, 'hierbera 55-c doÃ±a Caye', 'Caye', 'andador Guadalupana -Boulevard', NULL, 'afuera de negocio de ropa', 56, 'no', 'NULL', 'activo', 3, 33, 0),
(177, 'hierbera 55-d', 'no', 'Nicolas Bravo', NULL, 'afuera de la Guadalupana ', 56, 'no', 'NULL', 'activo', 3, 25, 0),
(178, 'tacos los Molcajetes', 'no', 'Nicolas Bravo', NULL, 'a lado de estacionamiento de mdo Hidalgo', 1, 'no', 'NULL', 'activo', 3, 25, 0),
(179, 'verdura', 'no', 'andador Guadalupana-Boulevard', NULL, 'afuera de la Guadalupana', 57, 'no', 'NULL', 'activo', 3, 33, 0),
(180, 'verdura  SEÃ‘OR', 'no', 'andador Guadalupana-Boulevard', NULL, 'afuera de la Guadalupana, bajando las escaleras', 57, 'no', 'NULL', 'activo', 3, 33, 0),
(181, 'verdura SEÃ‘ORA', 'no', 'andador Guadalupana-Boulevard', NULL, 'frente a Guadalupana,bajando escaleras', 57, 'no', 'NULL', 'activo', 3, 33, 0),
(182, '  la nueva zapateria', 'no', 'portal colunga 101-a', NULL, 'a lado de paleteria michoacana', 58, 'no', 'NULL', 'activo', 3, 35, 0),
(183, 'tacos el Brayan', 'no', '5 de Mayo ', NULL, 'entre Guadalupe y Obregon', 1, 'no', 'NULL', 'activo', 3, 36, 0),
(184, 'jugos y desayunos', 'Conchita Aboytes', 'plan de iguala 108 ', NULL, 'frente estacionamiento de CMQ', 52, 'no', 'NULL', 'activo', 3, 37, 0),
(185, 'De Cafe Gourmet', 'no', 'madero ', NULL, 'frente a la primaria Moises Zaens', 42, 'no', 'NULL', 'activo', 3, 28, 0),
(186, 'El Brunch', 'no', 'privada Venustiano Carranza 117', NULL, 'entre Venustiano Carranza y parque Morelos', 9, 'no', 'NULL', 'activo', 3, 38, 0),
(187, 'dulces', 'no', 'Morelos', NULL, 'a lado Bancomer', 28, 'no', 'NULL', 'activo', 3, 21, 0),
(188, 'revistas', 'no', 'portal Colunga', NULL, 'frente precios de Mexico', 59, 'no', 'NULL', 'activo', 3, 35, 0),
(189, 'dulces regionales', 'no', 'calzada independencia', NULL, 'frente a Kodak', 28, 'no', 'NULL', 'activo', 3, 6, 0),
(190, 'chicharrones y fritura 2', 'no', 'privada Venustiano Carranza', NULL, 'entre Venustiano Carranza y parque Morelos', 35, 'no', 'NULL', 'activo', 3, 38, 0),
(191, 'barbacoa  el orgullo del mercado hidalgo', 'no', 'andador Guadalupana -Boulevard', NULL, 'exterior 2a puerta mercado hidalgo', 1, 'no', 'NULL', 'activo', 3, 18, 0),
(192, 'pescado frito Juanito', 'no', 'Boulevard', NULL, 'entre zapateria Bhermanos y Coppel', 51, 'no', 'NULL', 'activo', 3, 20, 0),
(193, 'tacos el puente', 'no', 'Boulevard', NULL, 'cerca de escalera del puente hacia Allende', 1, 'no', 'NULL', 'activo', 3, 20, 0),
(194, 'energeticos Alonso', 'no', 'plaza de sn Agustin', NULL, 'frente a trajes regionales la purisima', 52, 'no', 'NULL', 'activo', 3, 31, 0),
(195, 'cocina economica', 'no', 'Nicolas Bravo 205', NULL, 'entre Juarez y Zaragoza', 9, 'no', 'NULL', 'activo', 3, 25, 0),
(196, 'jugos don ToÃ±o', 'no', 'Gongora', NULL, 'afuera de Banamex', 21, 'no', 'NULL', 'activo', 3, 30, 0),
(197, 'tamales 1', 'no', 'Mutualismo', NULL, 'esquina con Diego Rivera', 4, 'no', 'NULL', 'activo', 3, 39, 0),
(198, 'gorditas Paty', 'no', 'Mutualismo', NULL, 'afuera del IMSS', 2, 'no', 'NULL', 'activo', 3, 39, 0),
(199, 'tamales Rosy', 'no', 'Mutualismo', NULL, 'afuera del IMSS', 4, 'no', 'NULL', 'activo', 3, 39, 0),
(200, ' Nuevo taco', 'no', 'Mutualismo', NULL, 'afuera del IMSS', 60, 'no', 'NULL', 'activo', 3, 39, 0),
(201, 'tacos Chavos', 'no', 'Mutualismo', NULL, 'afuera del IMSS', 1, 'no', 'NULL', 'activo', 3, 39, 0),
(202, 'jugos y gelatinas don ToÃ±o', 'no', 'Mutualismo', NULL, 'afuera del IMSS', 21, 'no', 'NULL', 'activo', 3, 39, 0),
(203, 'desayunos jugos y tortas', 'no', 'Mutualismo 102', NULL, 'entre Diego Rivera y Boulevard ', 5, 'no', 'NULL', 'activo', 3, 39, 0),
(204, 'la empanada Real', 'no', 'Mutualismo 102-b', NULL, 'entre Diego Rivera y Boulevard', 54, 'no', 'NULL', 'activo', 3, 39, 0),
(205, 'tacos de guisado Leo', 'no', 'Hidalgo y Abasolo', NULL, 'frente a la gasolinera', 1, 'no', 'NULL', 'activo', 3, 40, 0),
(206, 'gorditas Francis', 'no', 'Hidalgo y Abasolo', NULL, 'frente a la gasolinera', 2, 'no', 'NULL', 'activo', 3, 40, 0),
(207, 'jugos y yogurth', 'no', 'Abasolo 309', NULL, 'a lado de paqueteria Aeroflash hacia la prepa ', 5, 'no', 'NULL', 'activo', 3, 40, 0),
(208, 'la Abeja', 'no', 'Morelos 108', NULL, 'a lado de Bancomer', 61, 'no', 'NULL', 'activo', 3, 21, 0),
(209, 'casa SaldaÃ±a', 'no', 'jardin principal  local 108', NULL, 'a lado de modatelas', 62, 'no', 'NULL', 'activo', 3, 8, 0),
(210, 'cajetas la Reyna 2', 'no', 'el Carmen', NULL, 'frente a quesadillas Gaspe', 25, 'no', 'NULL', 'activo', 3, 24, 0),
(211, 'cajetas la Chivita', 'no', 'Manuel doblado 103', NULL, 'entre Juarez y Aldama', 25, 'no', 'NULL', 'activo', 3, 41, 0),
(212, 'gorditas el comal', 'no', 'Manuel Doblado 502-b', NULL, 'frente a la prepa oficial', 2, 'no', 'NULL', 'activo', 3, 41, 0),
(213, 'empanadas la tia Guille 2', 'no', 'Abasolo 501', NULL, 'frente a la prepa oficial', 54, 'no', 'NULL', 'activo', 3, 40, 0),
(214, 'jugos y tortas ', 'no', 'Abasolo 501-c', NULL, 'frente a la prepa oficial', 5, 'no', 'NULL', 'activo', 3, 40, 0),
(215, 'tortas y pizza', 'no', 'Abasolo 503', NULL, 'frente a la prepa oficial', 31, 'no', 'NULL', 'activo', 3, 40, 0),
(216, 'jugos y tortas Naty', 'no', 'Mercado 5 de febrero', NULL, 'puerta principal ,Manuel Doblado', 5, 'no', 'NULL', 'activo', 3, 5, 0),
(217, 'papeleria la Carpeta', 'no', 'exterior mercado 5 de febrero 202', NULL, 'calle Cuahutemoc', 62, 'no', 'NULL', 'activo', 3, 5, 0),
(218, 'La Fragatta', 'no', 'Guanajuato 100-a', NULL, 'Obregon y Guanajuato ', 63, 'no', 'NULL', 'activo', 3, 42, 0),
(219, 'tacos los Sirlon', 'no', 'Obregon ', NULL, 'esquina Aguilar y Maya', 1, 'no', 'NULL', 'activo', 3, 43, 0),
(220, 'panaderia Kpan', 'no', 'Madero 135', NULL, 'frente a escuela Moises Saenz', 64, 'no', 'NULL', 'activo', 3, 28, 0),
(221, 'verduras', 'no', 'int mdo morelos local 98', NULL, '2 entrada lateral izquierda', 57, 'no', 'NULL', 'activo', 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Costos`
--

CREATE TABLE IF NOT EXISTS `Costos` (
  `idProveedor` bigint(20) NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `costo` int(15) NOT NULL,
  `comentarios` varchar(100) DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL,
  KEY `idProducto` (`idProducto`),
  KEY `idProveedor` (`idProveedor`),
  KEY `idProducto_2` (`idProducto`),
  KEY `idProveedor_2` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Estatus`
--

CREATE TABLE IF NOT EXISTS `Estatus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Estatus`
--

INSERT INTO `Estatus` (`id`, `valor`) VALUES
(1, 'enviado a almacen'),
(2, 'impreso en almacen'),
(3, 'eliminado por almacen'),
(4, 'eliminado por vendedor');

-- --------------------------------------------------------

--
-- Table structure for table `GiroComer`
--

CREATE TABLE IF NOT EXISTS `GiroComer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `GiroComer`
--

INSERT INTO `GiroComer` (`id`, `valor`) VALUES
(1, 'Tacos'),
(2, 'Gorditas'),
(3, 'Ambulante Hierbas'),
(4, 'Tamales'),
(5, 'juego y licuados'),
(6, 'Aguas Frescas'),
(7, 'Restaurante'),
(9, 'Comida Rapida'),
(11, 'Ferreteria'),
(20, 'semillas y chiles'),
(21, 'jugos'),
(22, 'cremeria'),
(23, 'churros azucarados'),
(24, 'joyeria'),
(25, 'cajetas'),
(26, 'fruteria'),
(27, 'carteras y cintos'),
(28, 'dulces regionales'),
(29, 'camotes'),
(30, 'tintoreria'),
(31, 'tortas'),
(32, 'ropa'),
(33, 'pasteleria'),
(34, 'hamburguesas'),
(35, 'chicharrones y fritura'),
(36, 'estetica'),
(37, 'paleteria'),
(38, 'Rostiseria'),
(39, 'Aguacates'),
(40, 'pizzeria'),
(41, 'tostadas de cueros'),
(42, 'cafeteria'),
(43, 'elotes'),
(44, 'Fresas congeladas'),
(45, 'Vaquitas'),
(46, 'Abarrotes'),
(47, 'Giro Comercial'),
(48, 'buÃ±uelos'),
(49, 'cintos'),
(50, 'Tortilleria'),
(51, 'pescado'),
(52, 'jugo y licuados'),
(53, 'bisuteria'),
(54, 'empanadas'),
(55, 'ceramica'),
(56, 'hierbas'),
(57, 'verdura'),
(58, 'zapateria'),
(59, 'Revistas'),
(60, 'tacos de canasta'),
(61, 'Telas'),
(62, 'Papeleria'),
(63, 'Ensaladas'),
(64, 'Panaderia'),
(65, 'NULL'),
(66, 'jugos2');

-- --------------------------------------------------------

--
-- Table structure for table `HorarioVisitaCliente`
--

CREATE TABLE IF NOT EXISTS `HorarioVisitaCliente` (
  `idCliente` bigint(20) NOT NULL,
  `horario` time NOT NULL,
  KEY `idCliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `HorarioVisitaCliente`
--

INSERT INTO `HorarioVisitaCliente` (`idCliente`, `horario`) VALUES
(50, '10:00:00'),
(51, '10:00:00'),
(52, '11:00:00'),
(53, '00:00:00'),
(55, '08:00:00'),
(56, '08:00:00'),
(57, '09:00:00'),
(58, '09:00:00'),
(59, '08:30:00'),
(60, '08:30:00'),
(61, '08:30:00'),
(62, '08:30:00'),
(63, '08:30:00'),
(64, '08:30:00'),
(65, '11:00:00'),
(66, '13:00:00'),
(67, '11:30:00'),
(68, '11:30:00'),
(69, '11:00:00'),
(70, '11:00:00'),
(71, '11:30:00'),
(72, '11:00:00'),
(73, '11:00:00'),
(74, '11:30:00'),
(75, '11:00:00'),
(76, '11:00:00'),
(77, '11:00:00'),
(78, '11:00:00'),
(79, '09:00:00'),
(80, '11:30:00'),
(81, '11:30:00'),
(82, '00:00:00'),
(83, '00:00:00'),
(84, '11:00:00'),
(85, '11:30:00'),
(86, '11:30:00'),
(87, '16:30:00'),
(88, '16:30:00'),
(89, '13:30:00'),
(90, '13:30:00'),
(91, '17:00:00'),
(92, '17:00:00'),
(93, '17:00:00'),
(94, '17:00:00'),
(95, '11:00:00'),
(96, '11:00:00'),
(97, '11:30:00'),
(98, '11:00:00'),
(99, '11:00:00'),
(100, '11:00:00'),
(101, '11:30:00'),
(102, '11:30:00'),
(103, '11:30:00'),
(104, '13:00:00'),
(105, '11:30:00'),
(106, '11:30:00'),
(107, '11:30:00'),
(108, '13:00:00'),
(109, '11:30:00'),
(110, '13:00:00'),
(111, '13:00:00'),
(112, '13:00:00'),
(113, '13:00:00'),
(114, '13:30:00'),
(115, '13:30:00'),
(116, '11:30:00'),
(117, '11:30:00'),
(118, '13:30:00'),
(119, '13:30:00'),
(120, '13:30:00'),
(121, '13:30:00'),
(122, '13:30:00'),
(123, '13:30:00'),
(124, '13:30:00'),
(125, '13:30:00'),
(126, '13:30:00'),
(127, '13:30:00'),
(128, '13:30:00'),
(129, '17:00:00'),
(130, '17:00:00'),
(131, '17:00:00'),
(132, '17:00:00'),
(133, '23:30:00'),
(134, '23:30:00'),
(135, '23:00:00'),
(136, '14:00:00'),
(137, '11:00:00'),
(138, '11:00:00'),
(139, '09:00:00'),
(140, '11:00:00'),
(141, '13:00:00'),
(142, '11:00:00'),
(143, '09:30:00'),
(144, '09:30:00'),
(145, '11:00:00'),
(146, '11:00:00'),
(147, '11:00:00'),
(148, '09:30:00'),
(149, '09:30:00'),
(150, '09:30:00'),
(151, '09:30:00'),
(152, '11:00:00'),
(153, '08:30:00'),
(154, '09:30:00'),
(155, '09:30:00'),
(156, '09:30:00'),
(157, '09:00:00'),
(158, '09:30:00'),
(159, '11:00:00'),
(160, '11:00:00'),
(161, '11:00:00'),
(162, '09:00:00'),
(163, '11:00:00'),
(164, '11:00:00'),
(165, '08:30:00'),
(166, '08:30:00'),
(167, '08:30:00'),
(168, '08:30:00'),
(169, '08:30:00'),
(170, '11:30:00'),
(171, '11:30:00'),
(172, '11:30:00'),
(173, '11:30:00'),
(174, '11:30:00'),
(175, '08:30:00'),
(176, '08:30:00'),
(177, '08:30:00'),
(178, '09:00:00'),
(179, '09:30:00'),
(180, '09:30:00'),
(181, '09:30:00'),
(182, '11:00:00'),
(183, '11:00:00'),
(184, '10:00:00'),
(185, '11:00:00'),
(186, '11:00:00'),
(187, '11:00:00'),
(188, '11:00:00'),
(189, '11:00:00'),
(190, '11:00:00'),
(191, '09:00:00'),
(192, '09:00:00'),
(193, '09:00:00'),
(194, '09:00:00'),
(195, '09:00:00'),
(196, '08:30:00'),
(197, '07:40:00'),
(198, '07:40:00'),
(199, '07:40:00'),
(200, '07:40:00'),
(201, '07:40:00'),
(202, '07:40:00'),
(203, '07:40:00'),
(204, '07:40:00'),
(205, '08:00:00'),
(206, '08:00:00'),
(207, '08:00:00'),
(208, '11:00:00'),
(209, '11:00:00'),
(210, '11:30:00'),
(211, '11:30:00'),
(212, '08:00:00'),
(213, '08:00:00'),
(214, '08:00:00'),
(215, '08:00:00'),
(216, '08:00:00'),
(217, '08:00:00'),
(218, '11:30:00'),
(219, '11:30:00'),
(220, '11:30:00'),
(221, '08:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `Marca`
--

CREATE TABLE IF NOT EXISTS `Marca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `Marca`
--

INSERT INTO `Marca` (`id`, `nombre`) VALUES
(1, 'Aluzamich'),
(2, 'Alumidan'),
(3, 'Alurich'),
(4, 'Reyma'),
(5, 'Dart'),
(12, 'Sin Marca');

-- --------------------------------------------------------

--
-- Table structure for table `NotaVenta`
--

CREATE TABLE IF NOT EXISTS `NotaVenta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idVenta` bigint(20) NOT NULL,
  `idProducto` bigint(20) NOT NULL,
  `cantidad` double DEFAULT NULL,
  `precio` double NOT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idVenta` (`idVenta`),
  KEY `idProducto` (`idProducto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=110 ;

--
-- Dumping data for table `NotaVenta`
--

INSERT INTO `NotaVenta` (`id`, `idVenta`, `idProducto`, `cantidad`, `precio`, `total`) VALUES
(62, 34, 60, 10, 5, 50),
(63, 34, 61, 9, 6.5, 58.5),
(64, 34, 62, 8, 7, 56),
(65, 34, 63, 7, 8.5, 59.5),
(66, 35, 60, 10, 9, 90),
(67, 35, 61, 9, 8, 72),
(68, 36, 60, 10.5, 9, 94.5),
(69, 36, 61, 9.5, 8, 76),
(70, 37, 61, 10.5, 9, 94.5),
(71, 37, 62, 9.5, 8, 76),
(72, 38, 60, 10.5, 9, 94.5),
(73, 38, 61, 9.5, 8, 76),
(74, 39, 60, 10.5, 9, 94.5),
(75, 39, 61, 9.5, 8, 76),
(76, 40, 60, 10.5, 9, 94.5),
(77, 40, 61, 9.5, 8, 76),
(78, 41, 60, 10.5, 9, 94.5),
(79, 41, 61, 9.5, 8, 76),
(80, 42, 60, 10.5, 9, 94.5),
(81, 42, 61, 9.5, 8, 76),
(82, 43, 60, 10.5, 9, 94.5),
(83, 43, 61, 9.5, 8, 76),
(84, 44, 60, 10.5, 9, 94.5),
(85, 44, 61, 9.5, 8, 76),
(86, 45, 60, 10.5, 9, 94.5),
(87, 45, 61, 9.5, 8, 76),
(88, 46, 60, 10.5, 9, 94.5),
(89, 46, 61, 9.5, 8, 76),
(90, 47, 60, 10.5, 9, 94.5),
(91, 47, 61, 9.5, 8, 76),
(92, 48, 60, 10.5, 9, 94.5),
(93, 48, 61, 9.5, 8, 76),
(94, 49, 60, 10.5, 6, 63),
(95, 50, 60, 10, 5, 50),
(96, 50, 61, 9, 6.5, 58.5),
(97, 50, 62, 8, 7, 56),
(98, 50, 63, 7, 8.5, 59.5),
(99, 51, 67, 10, 3, 30),
(100, 52, 60, 10, 5, 50),
(101, 52, 61, 9, 6.5, 58.5),
(102, 52, 62, 8, 7, 56),
(103, 52, 63, 7, 8.5, 59.5),
(104, 53, 61, 8.5, 1, 8.5),
(105, 54, 60, 9, 1, 9),
(106, 54, 61, 8.5, 2, 17),
(107, 54, 62, 8, 3, 24),
(108, 55, 61, 8.5, 3, 25.5),
(109, 56, 61, 8.5, 3, 25.5);

-- --------------------------------------------------------

--
-- Table structure for table `Permisos`
--

CREATE TABLE IF NOT EXISTS `Permisos` (
  `idUsuario` bigint(20) NOT NULL,
  `admin-clientes` tinyint(1) NOT NULL,
  `admin-usuarios` tinyint(1) NOT NULL,
  `admin-producto` tinyint(1) NOT NULL,
  `admin-vendedores` tinyint(1) NOT NULL,
  `recepcion-modifi` tinyint(1) NOT NULL,
  `recepcion-eliminar` tinyint(1) NOT NULL,
  `reporte` tinyint(1) NOT NULL,
  `registrar` tinyint(1) NOT NULL,
  KEY `IdUsuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Permisos`
--

INSERT INTO `Permisos` (`idUsuario`, `admin-clientes`, `admin-usuarios`, `admin-producto`, `admin-vendedores`, `recepcion-modifi`, `recepcion-eliminar`, `reporte`, `registrar`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 0, 0, 0, 0, 1, 1, 0, 1),
(3, 0, 0, 0, 0, 1, 1, 0, 1),
(4, 0, 0, 0, 0, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Precio`
--

CREATE TABLE IF NOT EXISTS `Precio` (
  `idProducto` bigint(20) NOT NULL,
  `condicion` double NOT NULL,
  `idClase` bigint(20) NOT NULL,
  `precio_` double NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  KEY `IdClase` (`idClase`),
  KEY `IdClase_2` (`idClase`),
  KEY `IdProducto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Precio`
--

INSERT INTO `Precio` (`idProducto`, `condicion`, `idClase`, `precio_`, `fechaCreacion`) VALUES
(60, 19, 3, 9, '2013-12-15 15:39:50'),
(60, 20, 3, 8.95, '2013-12-15 15:39:50'),
(61, 19, 3, 8.5, '2013-12-15 15:42:30'),
(62, 19, 3, 8, '2013-12-15 15:46:21'),
(62, 20, 3, 8.1, '2013-12-15 15:46:21'),
(63, 19, 3, 9.5, '2013-12-15 15:48:40'),
(63, 20, 3, 9.45, '2013-12-15 15:48:40'),
(64, 19, 3, 10.5, '2013-12-15 15:51:38'),
(64, 20, 3, 10.175, '2013-12-15 15:51:38'),
(65, 19, 3, 15.5, '2013-12-15 15:52:38'),
(65, 20, 3, 13, '2013-12-15 15:52:38'),
(66, 39, 3, 9.5, '2013-12-15 15:59:13'),
(66, 40, 3, 9.5, '2013-12-15 15:59:13'),
(67, 39, 3, 10, '2013-12-15 16:09:11'),
(67, 40, 3, 9.5, '2013-12-15 16:09:11'),
(68, 19, 3, 24.5, '2013-12-15 16:11:41'),
(68, 20, 3, 23.75, '2013-12-15 16:11:41'),
(69, 19, 3, 20.5, '2013-12-15 16:15:54'),
(69, 20, 3, 19.8, '2013-12-15 16:15:54');

-- --------------------------------------------------------

--
-- Table structure for table `Productos`
--

CREATE TABLE IF NOT EXISTS `Productos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `codigo` varchar(15) NOT NULL,
  `idSubCategoria` bigint(20) NOT NULL,
  `idUnidad` bigint(20) NOT NULL,
  `idMarca` bigint(20) NOT NULL,
  `especial` tinyint(1) NOT NULL,
  `estatus` enum('activo','eliminado') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idSubCategoria` (`idSubCategoria`),
  KEY `idUnidad` (`idUnidad`),
  KEY `idMarca` (`idMarca`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `Productos`
--

INSERT INTO `Productos` (`id`, `nombre`, `descripcion`, `codigo`, `idSubCategoria`, `idUnidad`, `idMarca`, `especial`, `estatus`) VALUES
(60, 'VASO PLAST 4CH 50PZ', 'CJA 20PQT', 'VP-CH', 2, 1, 4, 0, 'activo'),
(61, 'VASO PLAST 5 AZUL 50PZ', 'CJA 20PQT', 'VP-5A', 2, 1, 4, 0, 'activo'),
(62, 'VASO PLAST 5 1/2 50PZ', 'CJA 20PQT', 'VP-5-1/2', 2, 1, 4, 0, 'activo'),
(63, 'VASO PLAST 6 50PZ', 'CJA 20PQT', 'VP-6', 2, 1, 4, 0, 'activo'),
(64, 'VASO PLAST 8 50PZ', 'CJA 20PQT', 'VP-8', 2, 1, 4, 0, 'activo'),
(65, 'VASO PLAST 12 50PZ', 'CJA 20PQT', 'VP-12', 2, 1, 4, 0, 'activo'),
(66, 'VASO PLAST 16A 25PZ', 'CJA 40PQT', 'VP-16A', 2, 1, 4, 0, 'activo'),
(67, 'VASO PLAST 16L 25PZ', 'CJA 40PQT', 'VP-16L', 2, 1, 12, 0, 'activo'),
(68, 'VASO PLAST REYMA LT 25PZ', 'CJA 20PQT', 'VP-RLT', 2, 1, 4, 0, 'activo'),
(69, 'VASO PLAST REYMA 1/2 25PZ', 'CJA 20PQT', 'VP-R1/2', 2, 1, 4, 0, 'activo');

-- --------------------------------------------------------

--
-- Table structure for table `Proveedor`
--

CREATE TABLE IF NOT EXISTS `Proveedor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `estatus` enum('activo','inactivo') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Proveedor`
--

INSERT INTO `Proveedor` (`id`, `nombre`, `empresa`, `telefono`, `direccion`, `estatus`) VALUES
(1, 'Sergio', 'AYARI', NULL, NULL, 'activo'),
(2, 'Arturo', 'Bodega Raymundo', NULL, NULL, 'activo');

-- --------------------------------------------------------

--
-- Table structure for table `Roll`
--

CREATE TABLE IF NOT EXISTS `Roll` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Roll`
--

INSERT INTO `Roll` (`id`, `valor`) VALUES
(1, 'Administrador'),
(2, 'Recepcionista'),
(3, 'Vendedor'),
(4, 'Repartidor');

-- --------------------------------------------------------

--
-- Table structure for table `SubCategoria`
--

CREATE TABLE IF NOT EXISTS `SubCategoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCategoria` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategoria` (`idCategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `SubCategoria`
--

INSERT INTO `SubCategoria` (`id`, `idCategoria`, `nombre`) VALUES
(1, 3, 'Papel'),
(2, 3, 'Vaso Plastico'),
(3, 3, 'Tapa Plastico'),
(4, 3, 'Vaso Unicel'),
(5, 3, 'Tapa Unicel'),
(6, 3, 'Charola Unicel'),
(7, 3, 'Charola Plastico'),
(8, 3, 'Contenedor Plastico'),
(9, 3, 'Contenedor Unicel'),
(10, 6, 'Popote'),
(11, 6, 'Bolsa Plastico'),
(12, 6, 'Bolsa Polipapel'),
(13, 6, 'Bolsa Policeda');

-- --------------------------------------------------------

--
-- Table structure for table `Unidad`
--

CREATE TABLE IF NOT EXISTS `Unidad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Unidad`
--

INSERT INTO `Unidad` (`id`, `valor`) VALUES
(1, 'PQT'),
(2, 'CJA'),
(3, 'BLS'),
(4, 'KG');

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `passwd` varchar(10) NOT NULL,
  `idRoll` bigint(20) NOT NULL,
  `fechaReg` datetime NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `estatus` enum('activo','eliminado') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdRoll` (`idRoll`),
  KEY `IdRoll_2` (`idRoll`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Usuario`
--

INSERT INTO `Usuario` (`id`, `nombre`, `usuario`, `passwd`, `idRoll`, `fechaReg`, `sexo`, `estatus`) VALUES
(1, 'admin', 'admin', 'nimda', 1, '2013-10-27 00:00:00', 'M', 'activo'),
(2, 'JOSUE RICO', 'jrico', 'qwerty', 3, '2013-10-29 00:00:00', 'M', 'activo'),
(3, 'BLANCA JUAREZ', 'blanc', 'qwerty', 2, '2013-10-29 00:00:00', 'F', 'activo'),
(4, 'JORGE RICO', '123', 'qwerty', 3, '2013-10-29 00:00:00', 'M', 'activo'),
(5, 'test', '123', '123', 1, '2013-12-05 00:00:00', 'M', 'activo');

-- --------------------------------------------------------

--
-- Table structure for table `Venta`
--

CREATE TABLE IF NOT EXISTS `Venta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idEstatus` bigint(20) NOT NULL,
  `idUsuario` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `credito` tinyint(1) NOT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `subTotal` double NOT NULL,
  `granTotal` double NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaImpresion` datetime DEFAULT NULL,
  `fechaDistribucion` datetime DEFAULT NULL,
  `fechaRecibido` datetime DEFAULT NULL,
  `fechaProgRecibido` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idEstatus` (`idEstatus`,`idUsuario`,`idCliente`),
  KEY `idEstatus_2` (`idEstatus`,`idUsuario`,`idCliente`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idCliente` (`idCliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `Venta`
--

INSERT INTO `Venta` (`id`, `idEstatus`, `idUsuario`, `idCliente`, `credito`, `comentario`, `subTotal`, `granTotal`, `fechaCreacion`, `fechaImpresion`, `fechaDistribucion`, `fechaRecibido`, `fechaProgRecibido`) VALUES
(30, 2, 2, 120, 1, 'dsfdsf', 151.5, 151.5, '2013-12-14 14:20:56', NULL, NULL, NULL, '2013-12-01 00:00:00'),
(31, 2, 2, 123, 0, 'Enviar urgente', 50, 224, '2013-12-14 14:31:57', NULL, NULL, NULL, '2013-12-02 00:00:00'),
(32, 2, 2, 123, 0, 'Enviar urgente', 50, 224, '2013-12-14 14:32:03', NULL, NULL, NULL, '2013-12-03 00:00:00'),
(33, 2, 2, 123, 0, 'Enviar urgente', 224, 224, '2013-12-14 14:49:36', NULL, NULL, NULL, NULL),
(34, 2, 2, 84, 0, 'Enviar urgente', 224, 224, '2013-12-17 12:41:25', '2013-12-05 10:00:00', NULL, NULL, NULL),
(35, 2, 2, 84, 0, 'Enviar urgente', 162, 224, '2013-12-17 12:44:39', '2013-12-05 10:00:00', NULL, NULL, NULL),
(36, 2, 2, 84, 0, 'Enviar urgente', 170.5, 224, '2013-12-17 12:45:20', '2013-12-05 10:00:00', NULL, NULL, NULL),
(37, 2, 2, 84, 0, 'Enviar urgente', 170.5, 224, '2013-12-17 12:46:04', '2013-12-05 10:00:00', NULL, NULL, NULL),
(38, 2, 2, 84, 0, 'edd', 170.5, 170.5, '2013-12-17 12:48:45', '2013-12-05 10:00:00', NULL, NULL, NULL),
(39, 2, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 12:55:07', '2013-12-05 10:00:00', NULL, NULL, NULL),
(40, 2, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 13:01:44', '2013-12-18 12:38:26', NULL, NULL, NULL),
(41, 1, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 14:08:15', NULL, NULL, NULL, '2013-12-02 00:00:00'),
(42, 1, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 14:08:44', NULL, NULL, NULL, NULL),
(43, 1, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 14:09:39', NULL, NULL, NULL, NULL),
(44, 1, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 14:10:24', NULL, NULL, NULL, NULL),
(45, 1, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 14:44:46', NULL, NULL, NULL, NULL),
(46, 1, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 14:44:57', NULL, NULL, NULL, NULL),
(47, 1, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 14:48:55', NULL, NULL, NULL, NULL),
(48, 1, 2, 84, 0, '', 170.5, 170.5, '2013-12-17 14:49:00', NULL, NULL, NULL, NULL),
(49, 1, 2, 115, 1, '', 63, 63, '2013-12-18 11:51:59', NULL, NULL, NULL, NULL),
(50, 1, 2, 123, 0, 'Enviar urgente', 224, 224, '2013-12-18 12:30:29', NULL, NULL, NULL, NULL),
(51, 1, 2, 84, 1, '', 30, 30, '2013-12-18 12:49:39', NULL, NULL, NULL, NULL),
(52, 1, 2, 123, 0, 'Enviar urgente', 224, 224, '2013-12-18 12:53:59', NULL, NULL, NULL, NULL),
(53, 1, 2, 205, 0, '', 8.5, 8.5, '2013-12-18 12:56:13', NULL, NULL, NULL, NULL),
(54, 1, 2, 76, 1, '', 50, 50, '2013-12-18 12:57:20', NULL, NULL, NULL, NULL),
(55, 1, 2, 213, 0, '', 25.5, 25.5, '2013-12-18 23:28:40', NULL, NULL, NULL, NULL),
(56, 1, 2, 205, 1, '', 25.5, 25.5, '2013-12-19 00:47:39', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Zona`
--

CREATE TABLE IF NOT EXISTS `Zona` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `Zona`
--

INSERT INTO `Zona` (`id`, `valor`) VALUES
(1, 'Mercado Morelos'),
(2, 'Seguro Mutualismo'),
(3, 'Hidalgo y Abasolo'),
(4, 'Prepa Oficial'),
(5, 'Mercado 5 Febrero'),
(6, 'Centro-Calzada'),
(8, 'Jardin Principal'),
(17, 'Alameda'),
(18, 'mercado  hidalgo'),
(19, 'centro'),
(20, 'boulevard'),
(21, 'Morelos'),
(22, '16 de septiembre'),
(23, 'Allende'),
(24, 'Carmen'),
(25, 'Nicolas Bravo'),
(26, 'Jardin de sn Agustin'),
(27, 'Guadalupe'),
(28, 'Madero'),
(29, 'Riva Palacio'),
(30, 'Gongora'),
(31, 'plaza Sn Agustin'),
(32, 'ext mdo Hidalgo'),
(33, 'andador Guadalupana-Boulevard'),
(34, 'andador corregidora'),
(35, 'portal colunga'),
(36, '5 de mayo'),
(37, 'plan de Iguala'),
(38, 'Venustiano Carranza'),
(39, 'Mutualismo'),
(40, 'Abasolo'),
(41, 'Manuel Doblado'),
(42, 'Guanajuato'),
(43, 'Obregon');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Cliente`
--
ALTER TABLE `Cliente`
  ADD CONSTRAINT `Cliente_ibfk_3` FOREIGN KEY (`idZona`) REFERENCES `Zona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Cliente_ibfk_1` FOREIGN KEY (`idGiroComer`) REFERENCES `GiroComer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Cliente_ibfk_2` FOREIGN KEY (`idClase`) REFERENCES `Clase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Costos`
--
ALTER TABLE `Costos`
  ADD CONSTRAINT `Costos_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `Productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Costos_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `Proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `HorarioVisitaCliente`
--
ALTER TABLE `HorarioVisitaCliente`
  ADD CONSTRAINT `HorarioVisitaCliente_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `NotaVenta`
--
ALTER TABLE `NotaVenta`
  ADD CONSTRAINT `NotaVenta_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `Productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `NotaVenta_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `Venta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Permisos`
--
ALTER TABLE `Permisos`
  ADD CONSTRAINT `Permisos_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Precio`
--
ALTER TABLE `Precio`
  ADD CONSTRAINT `Precio_ibfk_3` FOREIGN KEY (`idClase`) REFERENCES `Clase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Precio_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `Productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_3` FOREIGN KEY (`idMarca`) REFERENCES `Marca` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`idSubCategoria`) REFERENCES `SubCategoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Productos_ibfk_2` FOREIGN KEY (`idUnidad`) REFERENCES `Unidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SubCategoria`
--
ALTER TABLE `SubCategoria`
  ADD CONSTRAINT `SubCategoria_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `Categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`idRoll`) REFERENCES `Roll` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Venta`
--
ALTER TABLE `Venta`
  ADD CONSTRAINT `Venta_ibfk_1` FOREIGN KEY (`idEstatus`) REFERENCES `Estatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Venta_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Venta_ibfk_3` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
