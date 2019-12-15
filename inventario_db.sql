-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2019 at 05:37 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventario_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `id` int(10) UNSIGNED NOT NULL,
  `sucursal_id` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `celular` varchar(155) NOT NULL,
  `tipo` enum('ADMIN','EMPLEADO') NOT NULL,
  `fecha_reg` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`id`, `sucursal_id`, `nombre`, `direccion`, `celular`, `tipo`, `fecha_reg`) VALUES
(1, 1, 'admin', 'direccion admin', '78945612', 'ADMIN', '2019-11-22'),
(2, 2, 'PEDRO CARVAJAL MAMANI', 'ZONA LOS OLIVOS CALLE 4 #22', '68432145', 'EMPLEADO', '2019-11-22'),
(3, 3, 'PEDRO GONZALES', 'ZONA LOS PEDREGALES CALLE 3 #33', '68412345', 'EMPLEADO', '2019-11-22'),
(4, 2, 'RODOLFO VILLEGAS', 'ZONA NORTE', '78525252', 'EMPLEADO', '2019-12-03'),
(5, 3, 'ALBERTO MAMANI', 'ZONA LOS OLIVOS CALLE 3 # 32', '78945666', 'EMPLEADO', '2019-11-22'),
(6, 2, 'PATRICIA', 'ZONA PRUEBA', '78933333', 'EMPLEADO', '2019-11-22'),
(7, 1, 'JORGE CLAVIJO', 'ZONA FERROVIARIA C.3 #22', '6788889', 'EMPLEADO', '2019-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(6),
(6),
(6),
(6);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `fecha_reg`) VALUES
(1, 'P001', 'PRODUCTO 1', NULL, '2019-11-22'),
(2, 'P002', 'PRODUCTO 2', NULL, '2019-11-22'),
(3, 'P003', 'PRODUCTO 3', NULL, '2019-11-22'),
(5, 'P004', 'PRODUCTO 4', 'PRODUCTO 4 DESCRIPCION', '2019-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `producto_sucursal`
--

CREATE TABLE `producto_sucursal` (
  `id` int(10) UNSIGNED NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `sucursal_id` int(10) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `fecha_reg` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto_sucursal`
--

INSERT INTO `producto_sucursal` (`id`, `producto_id`, `sucursal_id`, `stock`, `fecha_reg`) VALUES
(1, 1, 1, 85, '2019-11-22'),
(2, 2, 1, 100, '2019-11-22'),
(3, 3, 1, 100, '2019-11-22'),
(4, 1, 2, 100, '2019-11-22'),
(5, 5, 2, 100, '2019-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `sucursales`
--

CREATE TABLE `sucursales` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sucursales`
--

INSERT INTO `sucursales` (`id`, `nombre`, `descripcion`, `fecha_reg`) VALUES
(1, 'CENTRAL', 'SUCURSAL CENTRAL', '2019-11-22'),
(2, 'SUCURSAL 1', 'PRIMERA SUCURSAL', '2019-11-22'),
(3, 'SUCURSAL 2', NULL, '2019-11-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sucursal_id` (`sucursal_id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indexes for table `producto_sucursal`
--
ALTER TABLE `producto_sucursal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `sucursal_id` (`sucursal_id`);

--
-- Indexes for table `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `producto_sucursal`
--
ALTER TABLE `producto_sucursal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `producto_sucursal`
--
ALTER TABLE `producto_sucursal`
  ADD CONSTRAINT `producto_sucursal_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_sucursal_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_sucursal_ibfk_3` FOREIGN KEY (`sucursal_id`) REFERENCES `sucursales` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
