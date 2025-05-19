-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2025 a las 03:41:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rebuscando_sa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre_categoria` varchar(30) NOT NULL,
  `id_objeto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre_categoria`, `id_objeto`) VALUES
(2, 'encontrado', 2),
(3, 'perdido', 3),
(4, 'encontrado', 4),
(5, 'perdido', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `estado_categoria` varchar(30) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `estado_categoria`, `id_categoria`) VALUES
(2, 'llaves', 2),
(3, 'electronicos', 3),
(4, 'libros', 4),
(5, 'documentos', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `nombre_ciudad` varchar(20) NOT NULL,
  `id_region` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre_ciudad`, `id_region`) VALUES
(1, 'Santiago', 1),
(2, 'Valparaíso', 2),
(3, 'Concepción', 3),
(4, 'Antofagasta', 4),
(5, 'Talca', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id` int(11) NOT NULL,
  `nombre_comuna` varchar(20) NOT NULL,
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id`, `nombre_comuna`, `id_ciudad`) VALUES
(1, 'Providencia', 1),
(2, 'Cerro Alegre', 2),
(3, 'Concepción Centro', 3),
(4, 'Antofagasta Centro', 4),
(5, 'Talca Centro', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objeto`
--

CREATE TABLE `objeto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado_objeto` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `nombre_objeto` varchar(30) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `objeto`
--

INSERT INTO `objeto` (`id`, `descripcion`, `estado_objeto`, `marca`, `nombre_objeto`, `usuario_id`) VALUES
(2, 'Juego de llaves de casa y auto (Toyota Yaris), con un pequeño llavero de plata en forma de corazón.', 'usado', 'Toyota/Casa', 'Llaves Varias con Llavero', 2),
(3, 'Teléfono móvil iPhone 12, color azul oscuro, pantalla con trizadura leve en esquina superior derecha. Carcasa transparente.', 'usado_con_detalles', 'Apple', 'iPhone 12 Azul Oscuro', 3),
(4, 'Libro de tapa blanda \"El Principito\" de Antoine de Saint-Exupéry, edición de bolsillo, con algunas anotaciones en lápiz grafito.', 'usado', 'Salamandra', 'Libro El Principito (Bolsillo)', 4),
(5, 'Tarjeta Nacional Estudiantil (TNE) a nombre de Luis Alberto Vargas Torres. Vigente.', 'buen_estado', 'Junaeb', 'TNE (Pase Escolar)', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id` bigint(20) NOT NULL,
  `nombre_region` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `nombre_region`) VALUES
(1, 'Metropolitana de San'),
(2, 'Valparaíso'),
(3, 'Biobío'),
(4, 'Antofagasta'),
(5, 'Maule');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombres` varchar(40) NOT NULL,
  `password` varchar(15) NOT NULL,
  `run` varchar(13) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `apellidos`, `correo`, `direccion`, `fecha_nacimiento`, `nombres`, `password`, `run`, `telefono`, `id_comuna`, `id_rol`) VALUES
(1, 'Pérez González', 'juan.perez@example.cl', 'Av. Nueva Providencia 101', '1990-01-15', 'Juan Ignacio', 'passSegura123', '12345678-9', '911223344', 1, 2),
(2, 'Silva Rojas', 'maria.silva@example.cl', 'Calle Esmeralda 202', '1985-05-20', 'María José', 'claveFuerte456', '10987654-K', '922334455', 2, 2),
(3, 'Morales Castro', 'pedro.morales@example.cl', 'Orompello 303', '1995-11-01', 'Pedro Pablo', 'miContrasena789', '14725836-1', '933445566', 3, 2),
(4, 'Díaz Soto', 'ana.diaz@example.cl', 'Arturo Prat 404', '1980-07-10', 'Ana Luisa', 'secretoAbsoluto', '16789123-4', '944556677', 4, 1),
(5, 'Vargas Torres', 'luis.vargas@example.cl', '1 Oriente 505', '2000-03-25', 'Luis Alberto', 'password12345', '15321654-7', '955667788', 5, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1d3n31ye86gu8m4tx90e8hkhh` (`id_objeto`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgraqe5ulnifjo5vx8w45aapa7` (`id_categoria`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4t0a4x8jbya1ow2b25ahs08l3` (`id_region`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsxutxocveqbnpgfwb23wgufwv` (`id_ciudad`);

--
-- Indices de la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdm55sy4yyy7eln5290cpkwie3` (`usuario_id`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKboxe2nbk8bf7qn3s3ig45xb69` (`run`),
  ADD KEY `FK66usbodnsnmg7h3im4b6dj20n` (`id_comuna`),
  ADD KEY `FKdc3yt6c0ifauu675sn383tpih` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `objeto`
--
ALTER TABLE `objeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `FK1d3n31ye86gu8m4tx90e8hkhh` FOREIGN KEY (`id_objeto`) REFERENCES `objeto` (`id`);

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `FKgraqe5ulnifjo5vx8w45aapa7` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `FK4t0a4x8jbya1ow2b25ahs08l3` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`);

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `FKsxutxocveqbnpgfwb23wgufwv` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`);

--
-- Filtros para la tabla `objeto`
--
ALTER TABLE `objeto`
  ADD CONSTRAINT `FKdm55sy4yyy7eln5290cpkwie3` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK66usbodnsnmg7h3im4b6dj20n` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id`),
  ADD CONSTRAINT `FKdc3yt6c0ifauu675sn383tpih` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
