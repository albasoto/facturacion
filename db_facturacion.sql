/*
Navicat MySQL Data Transfer

Source Server         : wendy
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_facturacion

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-02-03 09:40:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cab_factura
-- ----------------------------
DROP TABLE IF EXISTS `cab_factura`;
CREATE TABLE `cab_factura` (
  `ID_factura` int(10) NOT NULL AUTO_INCREMENT,
  `Id_Cliente` int(10) NOT NULL,
  `Fecha_factura` date NOT NULL,
  PRIMARY KEY (`ID_factura`),
  KEY `Id_Cliente` (`Id_Cliente`),
  CONSTRAINT `cab_factura_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `usuarios` (`CedulaCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cab_factura
-- ----------------------------
INSERT INTO `cab_factura` VALUES ('1001', '605478015', '2019-01-30');
INSERT INTO `cab_factura` VALUES ('1002', '1722345902', '2019-01-27');

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `Id_categoria` int(5) NOT NULL,
  `Nom_Categoria` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('200', 'POSTRES');
INSERT INTO `categorias` VALUES ('300', 'PLATOS FUERTES');
INSERT INTO `categorias` VALUES ('400', 'ENTRADAS');
INSERT INTO `categorias` VALUES ('500', 'SOPAS');
INSERT INTO `categorias` VALUES ('600', 'BEBIDAS');

-- ----------------------------
-- Table structure for det_factura
-- ----------------------------
DROP TABLE IF EXISTS `det_factura`;
CREATE TABLE `det_factura` (
  `IdDetalle` int(5) NOT NULL AUTO_INCREMENT,
  `ID_factura_FK` int(5) NOT NULL,
  `Cod_producto_FK` int(5) NOT NULL,
  `Cantidad` int(10) NOT NULL,
  `Subtotal` decimal(10,0) NOT NULL,
  `Iva` decimal(10,0) NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`IdDetalle`),
  KEY `ID_factura_FK` (`ID_factura_FK`),
  KEY `Cod_producto_FK` (`Cod_producto_FK`),
  CONSTRAINT `det_factura_ibfk_1` FOREIGN KEY (`ID_factura_FK`) REFERENCES `cab_factura` (`ID_factura`),
  CONSTRAINT `det_factura_ibfk_2` FOREIGN KEY (`Cod_producto_FK`) REFERENCES `productos` (`CodProd`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of det_factura
-- ----------------------------
INSERT INTO `det_factura` VALUES ('1', '1002', '103', '3', '14', '2', '16');
INSERT INTO `det_factura` VALUES ('2', '1001', '102', '4', '14', '2', '16');
INSERT INTO `det_factura` VALUES ('3', '1002', '111', '4', '14', '2', '16');

-- ----------------------------
-- Table structure for pedidosprov
-- ----------------------------
DROP TABLE IF EXISTS `pedidosprov`;
CREATE TABLE `pedidosprov` (
  `codPedido` int(10) NOT NULL AUTO_INCREMENT,
  `fechaPedido` date NOT NULL,
  `codProveedor` int(5) NOT NULL,
  `NomProducto` varchar(25) NOT NULL,
  `codProducto` int(5) NOT NULL,
  `numUnidades` int(5) NOT NULL,
  `precioProd` float NOT NULL,
  `Cod_provee_FK` int(5) NOT NULL,
  PRIMARY KEY (`codPedido`),
  KEY `Cod_provee_FK` (`Cod_provee_FK`),
  CONSTRAINT `pedidosprov_ibfk_1` FOREIGN KEY (`Cod_provee_FK`) REFERENCES `proveedores` (`CodProvee`)
) ENGINE=InnoDB AUTO_INCREMENT=2324 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedidosprov
-- ----------------------------
INSERT INTO `pedidosprov` VALUES ('234', '2019-01-01', '232', 'JURIS', '2355', '150', '3.67', '332');
INSERT INTO `pedidosprov` VALUES ('306', '2019-01-16', '210', 'CHIPOTLE', '4156', '5', '5', '332');
INSERT INTO `pedidosprov` VALUES ('307', '2019-01-07', '325', 'PLUMROSE', '234', '200', '4.6', '345');
INSERT INTO `pedidosprov` VALUES ('456', '2019-02-02', '34546', 'CERVECERIA NACIONAL', '2334', '150', '3.56', '333');
INSERT INTO `pedidosprov` VALUES ('1213', '2018-12-04', '123', 'COCA COLA', '3455', '100', '2.23', '345');
INSERT INTO `pedidosprov` VALUES ('2323', '2019-01-08', '15656', 'ILE', '987', '50', '1.1', '332');

-- ----------------------------
-- Table structure for pedidos_cli
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_cli`;
CREATE TABLE `pedidos_cli` (
  `IDpedido` int(10) NOT NULL AUTO_INCREMENT,
  `CodPedido` int(10) NOT NULL,
  `Det_pedido` varchar(150) NOT NULL,
  `Cantidad` int(10) NOT NULL,
  `Precio_U` float NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`IDpedido`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pedidos_cli
-- ----------------------------
INSERT INTO `pedidos_cli` VALUES ('102', '300', 'sopa de pollo', '1', '1.5', '1.5');
INSERT INTO `pedidos_cli` VALUES ('113', '1030', 'c', '1', '2.2', '2.2');
INSERT INTO `pedidos_cli` VALUES ('114', '1030', 'c', '1', '2.5', '2.5');
INSERT INTO `pedidos_cli` VALUES ('115', '1030', 'c', '2', '3.7', '7.4');
INSERT INTO `pedidos_cli` VALUES ('116', '1030', 'c', '2', '2.5', '5');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `CodProd` int(5) NOT NULL AUTO_INCREMENT,
  `NomProd` varchar(40) NOT NULL,
  `PrecioProd` float NOT NULL,
  `NumUnidades` int(5) NOT NULL,
  `Id_categoria_FK` int(5) NOT NULL,
  PRIMARY KEY (`CodProd`),
  KEY `Id_categoria_FK` (`Id_categoria_FK`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Id_categoria_FK`) REFERENCES `categorias` (`Id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('100', 'Enchiladas de Mole rojo', '3.7', '10', '300');
INSERT INTO `productos` VALUES ('101', 'Caldo de gallina pierna', '1.5', '5', '500');
INSERT INTO `productos` VALUES ('102', 'Chilaquiles con mole', '3.85', '6', '300');
INSERT INTO `productos` VALUES ('103', 'Capirotada', '4.8', '20', '200');
INSERT INTO `productos` VALUES ('104', 'helado copa de cafe', '2.7', '15', '200');
INSERT INTO `productos` VALUES ('105', 'Pozole rojo', '4.3', '6', '300');
INSERT INTO `productos` VALUES ('106', 'pastel de queso', '3.1', '19', '200');
INSERT INTO `productos` VALUES ('107', 'panque de elote', '3.5', '20', '400');
INSERT INTO `productos` VALUES ('108', 'burritos', '2.2', '60', '400');
INSERT INTO `productos` VALUES ('109', 'tacos de pollo', '2', '10', '400');
INSERT INTO `productos` VALUES ('110', 'nachos con huacamole', '2.1', '15', '400');
INSERT INTO `productos` VALUES ('111', 'quesadillas picantes', '2.45', '30', '400');
INSERT INTO `productos` VALUES ('112', 'burritos al pastor', '2.3', '14', '400');
INSERT INTO `productos` VALUES ('113', 'caldo de pata', '3.5', '20', '500');
INSERT INTO `productos` VALUES ('114', 'yaguarlocro', '2.5', '5', '500');
INSERT INTO `productos` VALUES ('115', 'gaseosa', '0.5', '23', '600');
INSERT INTO `productos` VALUES ('116', 'nestea', '0.75', '20', '600');
INSERT INTO `productos` VALUES ('117', 'saviloe', '1.05', '12', '600');

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `CodProvee` int(5) NOT NULL,
  `NomProvee` varchar(25) NOT NULL,
  PRIMARY KEY (`CodProvee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES ('332', 'mario Teran');
INSERT INTO `proveedores` VALUES ('333', 'Carlos Torres');
INSERT INTO `proveedores` VALUES ('345', 'Sofia vaca');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `IdCliente` int(5) NOT NULL,
  `CedulaCliente` int(10) NOT NULL,
  `NomCli` varchar(25) NOT NULL,
  `ApellCli` varchar(25) NOT NULL,
  `DirCli` varchar(50) NOT NULL,
  `FechaNacimCli` date NOT NULL,
  `TelCli` int(10) NOT NULL,
  `EmailCli` varchar(40) NOT NULL,
  `ContraseñaCli` varchar(30) NOT NULL,
  `Perfil` varchar(20) NOT NULL,
  PRIMARY KEY (`CedulaCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('6', '23243', 'sdfere', 'sdffd', 'dsfdgfg', '2019-01-13', '787989', 'efer@', 'wewre', 'cliente');
INSERT INTO `usuarios` VALUES ('6', '176854923', 'wefr', 'rgr', 'derer', '2019-01-16', '2324', 'fefrfre', '234', 'cliente');
INSERT INTO `usuarios` VALUES ('6', '601685662', 'julio', 'soto', 'quintana', '1980-01-02', '987654034', 'julio_soto@gmail.com', '094j', 'cliente');
INSERT INTO `usuarios` VALUES ('1', '605478015', 'Wendy', 'Soto', 'Comite', '1997-09-07', '605478015', 'sotowendy.097@gamil.com', '12345', 'admin');
INSERT INTO `usuarios` VALUES ('6', '605722404', 'alba', 'soto', 'chimborazo', '2020-02-06', '912342567', 'albita_lizet@hotmail.com', '123', 'cliente');
INSERT INTO `usuarios` VALUES ('6', '658489023', 'sofia', 'benavides', 'los chillos', '1960-06-19', '978452312', 'sofy_ben@hotmail.com', '369', 'cliente');
INSERT INTO `usuarios` VALUES ('9', '912345678', 'carmen', 'torres', 'carcelen', '1993-02-26', '987654312', 'carmen@yahoo.es', '890', 'cliente');
INSERT INTO `usuarios` VALUES ('2', '1722345902', 'carlos', 'fuentes', 'calderon', '1998-02-12', '987562019', 'carlos.nel@gmail.com', '246', 'cliente');
INSERT INTO `usuarios` VALUES ('7', '1722346789', 'maria', 'DB', 'quito', '2019-02-19', '23435', 'ee@ert', '2324', 'cliente');
INSERT INTO `usuarios` VALUES ('6', '1745238904', 'werr', 'ere', 'ff', '2019-01-08', '234444', 'efrefre', '123', 'cliente');
INSERT INTO `usuarios` VALUES ('8', '1756348902', 'mario', 'negal', 'manabi', '2019-02-20', '923456', 'wewurr@', '5657', 'cliente');
