-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-01-2014 a las 23:33:41
-- Versión del servidor: 5.5.25a
-- Versión de PHP: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `database_1v3.0`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accountType`
--

CREATE TABLE IF NOT EXISTS `accountType` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `idUsr` bigint(20) NOT NULL,
  `idFriend` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdUsr` (`idUsr`,`idFriend`),
  KEY `IdFriend` (`idFriend`),
  KEY `IdUsr_2` (`idUsr`),
  KEY `IdUsr_3` (`idUsr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friendSources`
--

CREATE TABLE IF NOT EXISTS `friendSources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idAccountType` int(8) NOT NULL,
  `userAccount` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdAccountType` (`idAccountType`),
  KEY `IdAccountType_2` (`idAccountType`),
  KEY `IdAccountType_3` (`idAccountType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitations`
--

CREATE TABLE IF NOT EXISTS `invitations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idUsr` bigint(20) NOT NULL,
  `idFriendSource` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdUsr` (`idUsr`),
  KEY `IdFriendSource` (`idFriendSource`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrationSources`
--

CREATE TABLE IF NOT EXISTS `registrationSources` (
  `idUsr` bigint(20) NOT NULL,
  `idAccountType` int(8) NOT NULL,
  `userAccount` varchar(50) NOT NULL,
  KEY `idUsr` (`idUsr`),
  KEY `idAccountType` (`idAccountType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routePoint`
--

CREATE TABLE IF NOT EXISTS `routePoint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idRoute` bigint(20) NOT NULL,
  `idSegment` bigint(20) NOT NULL,
  `latLng` point NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdRouteName` (`idRoute`,`idSegment`),
  KEY `IdSegment` (`idSegment`),
  KEY `IdRouteName_2` (`idRoute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `routeUsage`
--

CREATE TABLE IF NOT EXISTS `routeUsage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idRoutePoint` bigint(20) NOT NULL,
  `idUsrRoute` bigint(20) NOT NULL,
  `idTravelMode` int(5) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IdUsr` (`idRoutePoint`,`idUsrRoute`,`idTravelMode`),
  KEY `IdRoutePoint` (`idRoutePoint`),
  KEY `IdRouteName` (`idUsrRoute`),
  KEY `IdTravelMode` (`idTravelMode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `segment`
--

CREATE TABLE IF NOT EXISTS `segment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` polygon NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sharedRoutes`
--

CREATE TABLE IF NOT EXISTS `sharedRoutes` (
  `idUsrRoutes` bigint(20) NOT NULL,
  `idUsr_ToShareRouteWith` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  KEY `IdUsrToShare` (`idUsr_ToShareRouteWith`),
  KEY `IdUsrRoutes` (`idUsrRoutes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `travelMode`
--

CREATE TABLE IF NOT EXISTS `travelMode` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `mode` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usr`
--

CREATE TABLE IF NOT EXISTS `usr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` set('f','m') NOT NULL,
  `password` varchar(50) NOT NULL,
  `registerDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usrRoutes`
--

CREATE TABLE IF NOT EXISTS `usrRoutes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idUsr` bigint(20) NOT NULL,
  `idRoute` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdUsr` (`idUsr`),
  KEY `IdRoute` (`idRoute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_3` FOREIGN KEY (`IdFriend`) REFERENCES `usr` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`IdUsr`) REFERENCES `usr` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `friendSources`
--
ALTER TABLE `friendSources`
  ADD CONSTRAINT `friendSources_ibfk_1` FOREIGN KEY (`IdAccountType`) REFERENCES `accountType` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `invitations_ibfk_2` FOREIGN KEY (`IdFriendSource`) REFERENCES `friendSources` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invitations_ibfk_1` FOREIGN KEY (`IdUsr`) REFERENCES `usr` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registrationSources`
--
ALTER TABLE `registrationSources`
  ADD CONSTRAINT `registrationsources_ibfk_2` FOREIGN KEY (`idAccountType`) REFERENCES `accountType` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registrationsources_ibfk_1` FOREIGN KEY (`idUsr`) REFERENCES `usr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `routePoint`
--
ALTER TABLE `routePoint`
  ADD CONSTRAINT `routepoint_ibfk_1` FOREIGN KEY (`IdRoute`) REFERENCES `route` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `routePoint_ibfk_2` FOREIGN KEY (`IdSegment`) REFERENCES `segment` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `routeUsage`
--
ALTER TABLE `routeUsage`
  ADD CONSTRAINT `routeusage_ibfk_1` FOREIGN KEY (`IdUsrRoute`) REFERENCES `usrRoutes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `routeUsage_ibfk_2` FOREIGN KEY (`IdRoutePoint`) REFERENCES `routePoint` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `routeUsage_ibfk_4` FOREIGN KEY (`IdTravelMode`) REFERENCES `travelMode` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sharedRoutes`
--
ALTER TABLE `sharedRoutes`
  ADD CONSTRAINT `sharedroutes_ibfk_2` FOREIGN KEY (`IdUsr_ToShareRouteWith`) REFERENCES `usr` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sharedroutes_ibfk_1` FOREIGN KEY (`IdUsrRoutes`) REFERENCES `usrRoutes` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usrRoutes`
--
ALTER TABLE `usrRoutes`
  ADD CONSTRAINT `usrroutes_ibfk_2` FOREIGN KEY (`IdRoute`) REFERENCES `route` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usrroutes_ibfk_1` FOREIGN KEY (`IdUsr`) REFERENCES `usr` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
