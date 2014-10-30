/*
SQLyog Ultimate v8.61 
MySQL - 5.5.16 : Database - project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `project`;

/*Table structure for table `grupo_alum` */

DROP TABLE IF EXISTS `grupo_alum`;

CREATE TABLE `grupo_alum` (
  `id_grupo_aux` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_grupo_aux`),
  KEY `id_grupo` (`id_grupo`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `grupo_alum_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`),
  CONSTRAINT `grupo_alum_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `usuario` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grupo_alum` */

/*Table structure for table `grupos` */

DROP TABLE IF EXISTS `grupos`;

CREATE TABLE `grupos` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `orden` varchar(30) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `grupos` */

insert  into `grupos`(`id_grupo`,`nombre`,`avatar`,`orden`,`estatus`) values (1,'ITCI-71',NULL,NULL,1),(2,'ITIC-72',NULL,NULL,1),(3,'ITIC-73',NULL,NULL,1),(4,'ITIC-74',NULL,NULL,1);

/*Table structure for table `mat_maes` */

DROP TABLE IF EXISTS `mat_maes`;

CREATE TABLE `mat_maes` (
  `id_mat_aux` int(11) NOT NULL AUTO_INCREMENT,
  `id_maestro` int(11) DEFAULT NULL,
  `id_materia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_mat_aux`),
  KEY `id_maestro` (`id_maestro`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `mat_maes_ibfk_1` FOREIGN KEY (`id_maestro`) REFERENCES `usuario` (`iduser`),
  CONSTRAINT `mat_maes_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `mat_maes` */

insert  into `mat_maes`(`id_mat_aux`,`id_maestro`,`id_materia`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(6,4,2),(7,4,3),(8,4,4);

/*Table structure for table `materias` */

DROP TABLE IF EXISTS `materias`;

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `orden` varchar(100) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `materias` */

insert  into `materias`(`id_materia`,`nombre`,`avatar`,`orden`,`estatus`) values (1,'Español',NULL,'1',1),(2,'Matemáticas',NULL,'1',1),(3,'POO',NULL,'1',1),(4,'Economía',NULL,'1',1);

/*Table structure for table `preguntas` */

DROP TABLE IF EXISTS `preguntas`;

CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `preguntas` */

insert  into `preguntas`(`id_pregunta`,`nombre`,`estatus`,`avatar`) values (2,'pregunta1',1,';)'),(3,'pregunta2\r\n',1,';)'),(4,'pregunta3',1,';)'),(5,'pregunta4',1,';)'),(6,'pregunta5',1,';)'),(7,'pregunta6',1,';)'),(8,'pregunta7',1,';)'),(9,'pregunta8',1,';)'),(10,'pregunta9',1,';)'),(11,'pregunta10',1,';)'),(12,'pregunta11',1,';)'),(13,'pregunta12',1,';)'),(14,'pregunta13',1,';)'),(15,'pregunta14',1,';)');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `street` varchar(250) DEFAULT NULL,
  `num1` int(11) DEFAULT NULL,
  `num2` int(11) DEFAULT NULL,
  `col` varchar(250) DEFAULT NULL,
  `mun` varchar(250) DEFAULT NULL,
  `est` varchar(250) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `cor` varchar(250) DEFAULT NULL,
  `user` varchar(250) DEFAULT NULL,
  `cont` varchar(250) DEFAULT NULL,
  `lvl` varchar(10) DEFAULT NULL,
  `estatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`iduser`,`name`,`fname`,`lname`,`phone`,`street`,`num1`,`num2`,`col`,`mun`,`est`,`cp`,`cor`,`user`,`cont`,`lvl`,`estatus`) values (1,'Monica','mendez','gutierrez','7225859911','Camino Real',1,2,'',NULL,NULL,NULL,NULL,'monica','202cb962ac59075b964b07152d234b70','2','1'),(2,'Daniel','martinez','rojas','7225859977','Veracruz',1,2,NULL,NULL,NULL,NULL,NULL,'daniel','202cb962ac59075b964b07152d234b70','3','1'),(3,'Jairo','Rojas','Martinez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jairo','202cb962ac59075b964b07152d234b70','3','1'),(4,'Bertin','Boilla','Rivas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bertin','202cb962ac59075b964b07152d234b70','2','1'),(5,'Juan','Bonifacio','Martinez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'juan','202cb962ac59075b964b07152d234b70','1','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
