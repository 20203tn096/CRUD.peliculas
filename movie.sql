-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2021 a las 02:47:00
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `movie`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_movie` ()  BEGIN
SELECT * FROM movie_registration;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create` (`p_name` VARCHAR(255), `p_description` VARCHAR(255), `p_premiereDate` DATE, `p_collection` DOUBLE)  BEGIN

INSERT INTO movie_registration(name,description,premiereDate,collection)
VALUES(p_name,p_description,p_premiereDate,p_collection);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete` (`p_idMovie` INT)  BEGIN

UPDATE movie_registration
SET status=0
WHERE idMovie=p_idMovie;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update` (`p_idMovie` INT, `p_name` VARCHAR(255), `p_description` VARCHAR(255), `p_premiereDate` DATE, `p_collection` DOUBLE)  BEGIN 
UPDATE movie_registration
SET name=p_name, description=p_description, premiereDate=p_premiereDate,collection=p_collection
WHERE idMovie = p_idMovie;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movie_registration`
--

CREATE TABLE `movie_registration` (
  `idMovie` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `premiereDate` date NOT NULL,
  `collection` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movie_registration`
--

INSERT INTO `movie_registration` (`idMovie`, `name`, `description`, `premiereDate`, `collection`, `status`) VALUES
(1, 'Eli ', 'Pelicula de Terror', '2021-07-31', 15222.5, 1),
(2, 'Chucky', 'Película de un muñeco', '2021-08-09', 48955, 0),
(3, '¿Qué le paso a lunes?', 'Película de controversia', '2021-08-26', 568952.455, 1),
(4, 'Guerra del futuro', 'Película de entretenimiento y Acción ', '2021-08-18', 5756942.5, 0),
(5, 'La llorona', 'Película de Terror Mexicana', '2021-08-25', 5412632.2, 1),
(6, 'IT', 'Película de Terror', '2021-08-26', 456212.25, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movie_registration`
--
ALTER TABLE `movie_registration`
  ADD PRIMARY KEY (`idMovie`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movie_registration`
--
ALTER TABLE `movie_registration`
  MODIFY `idMovie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
