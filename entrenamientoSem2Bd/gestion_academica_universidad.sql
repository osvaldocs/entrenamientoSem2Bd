-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: gestion_academica_universidad
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `id_docente` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `creditos` int NOT NULL,
  `semestre` int NOT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `codigo_2` (`codigo`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,1,'Desarrollo','Des_1',4,2),(2,5,'Habilidades para la vida','Hab_1',2,1),(3,4,'Rol directivo','Rdir_1',3,3);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_institucional` varchar(100) NOT NULL,
  `departamento_academico` varchar(100) NOT NULL,
  `anios_experiencia` int NOT NULL,
  PRIMARY KEY (`id_docente`),
  UNIQUE KEY `correo_institucional` (`correo_institucional`),
  CONSTRAINT `chk_exp` CHECK ((`anios_experiencia` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'Pedro Nel','pedroN@riwi.io','desarrollo',4),(2,'Sebastian Agudelo','sebas.a@riwi.io','desarrollo',6),(3,'Andrea Dominguez','andyD@riwi.io','desarrollo',1),(4,'Lina Ler','linaD@riwi.io','dirección',1),(5,'Juliana Vargas','juliV@riwi.io','habilidades_vida',3);
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_electronico` varchar(75) NOT NULL,
  `genero` enum('masculino','femenino') DEFAULT NULL,
  `identificacion` int NOT NULL,
  `carrera` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `nombre_completo` (`nombre_completo`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  UNIQUE KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'Alejandra Sierra','alegisgs@gmail.com','femenino',456284,'Enfermería','1985-08-26','2025-07-31 15:20:08'),(2,'Jacobo Sierra','jaco_s@gmail.com','masculino',4784695,'Actuación','2019-03-22','2025-07-31 15:20:08'),(3,'Pablo Campos','pablo.campos@gmail.com','masculino',7962089,'Desarrollador','1992-05-28','2025-07-31 15:20:08'),(4,'Lucas Campos','luki.campos@gmail.com','masculino',41254785,'Actuación','1999-03-03','2025-07-31 15:20:08'),(5,'Ciro Gómez','ciro_g@gmail.com','masculino',4854721,'Youtuber','2004-08-23','2025-07-31 15:20:08');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `id_inscripcion` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `id_curso` int NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `calificacion_final` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (1,1,2,'2025-07-31',4.5),(2,1,3,'2025-07-31',7.2),(3,2,2,'2025-07-31',9.0),(4,2,3,'2025-07-31',8.9),(5,3,2,'2025-07-31',8.2),(6,4,2,'2025-07-31',7.9),(7,3,1,'2025-07-31',3.8),(8,5,2,'2025-07-31',9.5);
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_historial_academico`
--

DROP TABLE IF EXISTS `vista_historial_academico`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_academico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_academico` AS SELECT 
 1 AS `nombre_estudiante`,
 1 AS `nombre_curso`,
 1 AS `nombre_docente`,
 1 AS `semestre`,
 1 AS `calificacion_final`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_historial_academico`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_academico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_academico` AS select `e`.`nombre_completo` AS `nombre_estudiante`,`c`.`nombre` AS `nombre_curso`,`d`.`nombre_completo` AS `nombre_docente`,`c`.`semestre` AS `semestre`,`i`.`calificacion_final` AS `calificacion_final` from (((`inscripciones` `i` join `estudiantes` `e` on((`i`.`id_estudiante` = `e`.`id_estudiante`))) join `cursos` `c` on((`i`.`id_curso` = `c`.`id_curso`))) join `docentes` `d` on((`c`.`id_docente` = `d`.`id_docente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-01 19:50:28
