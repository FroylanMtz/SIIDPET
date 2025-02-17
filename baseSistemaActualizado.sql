-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: siidpet
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ImputadosExpediente`
--

DROP TABLE IF EXISTS `ImputadosExpediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ImputadosExpediente` (
  `id_expediente` bigint unsigned NOT NULL,
  `id_imputado` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_expediente`,`id_imputado`),
  KEY `id_imputado` (`id_imputado`),
  CONSTRAINT `ImputadosExpediente_ibfk_1` FOREIGN KEY (`id_expediente`) REFERENCES `expediente` (`id`),
  CONSTRAINT `ImputadosExpediente_ibfk_2` FOREIGN KEY (`id_imputado`) REFERENCES `imputado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImputadosExpediente`
--

LOCK TABLES `ImputadosExpediente` WRITE;
/*!40000 ALTER TABLE `ImputadosExpediente` DISABLE KEYS */;
INSERT INTO `ImputadosExpediente` VALUES (1,1),(6,1),(1,10),(2,12);
/*!40000 ALTER TABLE `ImputadosExpediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acuerdo_reparatorio`
--

DROP TABLE IF EXISTS `acuerdo_reparatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acuerdo_reparatorio` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha_inicio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_fin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resultado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acuerdo_reparatorio`
--

LOCK TABLES `acuerdo_reparatorio` WRITE;
/*!40000 ALTER TABLE `acuerdo_reparatorio` DISABLE KEYS */;
INSERT INTO `acuerdo_reparatorio` VALUES (1,'2024-01-01','2024-01-01','Resultado del acuerdo','Prueba de observaciones',1,NULL,'2024-08-22 22:53:15'),(2,'2024-09-03','2024-09-05','aasdfasd','asdfasdfasdf',NULL,'2024-09-19 00:40:08','2024-09-19 00:40:08'),(3,'2024-09-03','2024-09-04','aasdfasd','asdfasdfasdf',NULL,'2024-09-19 00:41:54','2024-09-19 00:41:54'),(4,'2024-09-04','2024-09-07','resultado acuerdo reparatorio','algunas observaciones de esto',NULL,'2024-09-19 00:50:28','2024-09-19 00:50:28'),(5,'2024-09-04','2024-09-06','resultado','asdadasd',NULL,'2024-09-19 01:30:07','2024-09-19 01:30:07'),(6,'2024-09-04','2024-09-13','sdgfsdf adsf asdfasd','fasdf asdf asfasf asf adfasdf',NULL,'2024-09-19 01:31:03','2024-09-19 01:31:03'),(7,'2024-09-04','2024-09-13','sdgfsdf adsf asdfasd','fasdf asdf asfasf asf adfasdf',NULL,'2024-09-19 01:31:08','2024-09-19 01:31:08'),(8,'2024-09-11','2024-09-14','resultado de acuerdo reparatorio','observaciones del acuerdo reparatorio del expediente N-000',NULL,'2024-09-19 01:53:03','2024-09-19 03:40:54');
/*!40000 ALTER TABLE `acuerdo_reparatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acuerdo_sede_ministerial`
--

DROP TABLE IF EXISTS `acuerdo_sede_ministerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acuerdo_sede_ministerial` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `medidas_de_proteccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_inicio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_fin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_estatus_sede_ministerial` bigint unsigned NOT NULL,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acuerdo_sede_ministerial_id_estatus_sede_ministerial_foreign` (`id_estatus_sede_ministerial`),
  CONSTRAINT `acuerdo_sede_ministerial_id_estatus_sede_ministerial_foreign` FOREIGN KEY (`id_estatus_sede_ministerial`) REFERENCES `estatus_sede_ministerial` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acuerdo_sede_ministerial`
--

LOCK TABLES `acuerdo_sede_ministerial` WRITE;
/*!40000 ALTER TABLE `acuerdo_sede_ministerial` DISABLE KEYS */;
INSERT INTO `acuerdo_sede_ministerial` VALUES (1,'ejemplo de medidas de proteccion','2024-06-26','2024-06-26',1,'2024-06-27',1,NULL,'2024-06-26 02:37:24'),(2,'una medida, dos, tres','2024-06-27','2024-06-25',1,'2024-06-25',1,'2024-06-26 02:32:47','2024-06-26 02:37:07'),(3,'hola','2024-09-12','2024-09-17',1,'2024-09-14',1,'2024-09-14 01:47:21','2024-09-18 01:58:47');
/*!40000 ALTER TABLE `acuerdo_sede_ministerial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacion_medidas`
--

DROP TABLE IF EXISTS `asignacion_medidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion_medidas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha_inicio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_vencimiento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_medida_proteccion` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `asignacion_medidas_id_medida_proteccion_foreign` (`id_medida_proteccion`),
  CONSTRAINT `asignacion_medidas_id_medida_proteccion_foreign` FOREIGN KEY (`id_medida_proteccion`) REFERENCES `medida_proteccion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion_medidas`
--

LOCK TABLES `asignacion_medidas` WRITE;
/*!40000 ALTER TABLE `asignacion_medidas` DISABLE KEYS */;
INSERT INTO `asignacion_medidas` VALUES (1,'2024-03-10','2024-03-10',5,1,NULL,'2024-06-25 02:04:50'),(2,'2024-02-12','2024-02-12',1,1,'2024-06-25 02:02:34','2024-06-25 02:04:09'),(3,'2024-09-04','2024-09-13',1,1,'2024-09-12 23:44:00','2024-09-19 03:27:40');
/*!40000 ALTER TABLE `asignacion_medidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `evento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_fin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario_imputado`
--

DROP TABLE IF EXISTS `calendario_imputado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario_imputado` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_calendario` bigint unsigned NOT NULL,
  `id_imputado` bigint unsigned NOT NULL,
  `id_defensor` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendario_imputado_id_calendario_foreign` (`id_calendario`),
  KEY `calendario_imputado_id_imputado_foreign` (`id_imputado`),
  KEY `calendario_imputado_id_defensor_foreign` (`id_defensor`),
  CONSTRAINT `calendario_imputado_id_calendario_foreign` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id`),
  CONSTRAINT `calendario_imputado_id_defensor_foreign` FOREIGN KEY (`id_defensor`) REFERENCES `defensor` (`id`),
  CONSTRAINT `calendario_imputado_id_imputado_foreign` FOREIGN KEY (`id_imputado`) REFERENCES `imputado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario_imputado`
--

LOCK TABLES `calendario_imputado` WRITE;
/*!40000 ALTER TABLE `calendario_imputado` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendario_imputado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conclusion`
--

DROP TABLE IF EXISTS `conclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conclusion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_conclusion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conclusion`
--

LOCK TABLES `conclusion` WRITE;
/*!40000 ALTER TABLE `conclusion` DISABLE KEYS */;
INSERT INTO `conclusion` VALUES (1,'Conclusion1','2024-04-10',1,NULL,NULL);
/*!40000 ALTER TABLE `conclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinacion`
--

DROP TABLE IF EXISTS `coordinacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordinacion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinacion`
--

LOCK TABLES `coordinacion` WRITE;
/*!40000 ALTER TABLE `coordinacion` DISABLE KEYS */;
INSERT INTO `coordinacion` VALUES (1,'Coordinacion Victoria',1,NULL,NULL),(2,'Coordinacion Mante',0,NULL,NULL),(3,'Coordinacion Reynosa',0,NULL,NULL);
/*!40000 ALTER TABLE `coordinacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defensor`
--

DROP TABLE IF EXISTS `defensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defensor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint unsigned NOT NULL,
  `id_municipio` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_coordinacion` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `defensor_id_usuario_foreign` (`id_usuario`),
  KEY `defensor_id_municipio_foreign` (`id_municipio`),
  KEY `id_coordinacion` (`id_coordinacion`),
  CONSTRAINT `defensor_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  CONSTRAINT `defensor_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensor`
--

LOCK TABLES `defensor` WRITE;
/*!40000 ALTER TABLE `defensor` DISABLE KEYS */;
INSERT INTO `defensor` VALUES (1,1,2314,0,NULL,'2024-10-03 02:58:38',1),(2,20,2313,0,'2024-09-28 03:06:17','2024-10-03 01:33:36',2),(3,21,2313,1,'2024-10-03 02:11:23','2024-10-03 02:11:23',2),(4,22,2313,0,'2024-10-03 03:00:53','2024-10-16 04:05:52',1);
/*!40000 ALTER TABLE `defensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defensor_ugi`
--

DROP TABLE IF EXISTS `defensor_ugi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defensor_ugi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_defensor` bigint unsigned NOT NULL,
  `id_ugi` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `defensor_ugi_id_defensor_foreign` (`id_defensor`),
  KEY `defensor_ugi_id_ugi_foreign` (`id_ugi`),
  CONSTRAINT `defensor_ugi_id_defensor_foreign` FOREIGN KEY (`id_defensor`) REFERENCES `defensor` (`id`),
  CONSTRAINT `defensor_ugi_id_ugi_foreign` FOREIGN KEY (`id_ugi`) REFERENCES `ugi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defensor_ugi`
--

LOCK TABLES `defensor_ugi` WRITE;
/*!40000 ALTER TABLE `defensor_ugi` DISABLE KEYS */;
INSERT INTO `defensor_ugi` VALUES (1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `defensor_ugi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delito`
--

DROP TABLE IF EXISTS `delito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delito` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delito`
--

LOCK TABLES `delito` WRITE;
/*!40000 ALTER TABLE `delito` DISABLE KEYS */;
INSERT INTO `delito` VALUES (1,'Asesinato',1,NULL,'2024-10-07 21:23:32'),(2,'Delito 6',1,'2024-06-27 01:39:17','2024-09-06 03:02:28'),(3,'Delito 7',1,'2024-06-27 01:39:18','2024-09-06 03:02:35'),(4,'Delito 8',1,'2024-06-27 01:39:18','2024-09-06 03:02:41'),(5,'Delito 9',1,'2024-06-27 01:39:19','2024-10-07 21:23:34'),(6,'Delito  1 - editado',1,'2024-06-27 01:39:28','2024-10-07 21:24:05'),(7,'Delito 2',1,'2024-06-27 01:39:29','2024-09-06 03:01:41'),(8,'Delito 3',1,'2024-06-27 01:44:00','2024-09-06 03:01:48'),(9,'Delito 4',1,'2024-06-27 01:44:47','2024-09-06 03:01:55'),(10,'Delito 5',1,'2024-06-27 02:06:39','2024-10-24 23:42:46');
/*!40000 ALTER TABLE `delito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delito_proceso`
--

DROP TABLE IF EXISTS `delito_proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delito_proceso` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha_inicio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_fin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resultado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delito_proceso`
--

LOCK TABLES `delito_proceso` WRITE;
/*!40000 ALTER TABLE `delito_proceso` DISABLE KEYS */;
INSERT INTO `delito_proceso` VALUES (1,'2024-01-01','2024-01-10','Resultado delito proceso','Observacioneeees',1,NULL,NULL);
/*!40000 ALTER TABLE `delito_proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detencion`
--

DROP TABLE IF EXISTS `detencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detencion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resultado_examen` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detencion`
--

LOCK TABLES `detencion` WRITE;
/*!40000 ALTER TABLE `detencion` DISABLE KEYS */;
INSERT INTO `detencion` VALUES (1,'2024-01-01','12:00:00','Resultado 1',1,NULL,NULL);
/*!40000 ALTER TABLE `detencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrevista`
--

DROP TABLE IF EXISTS `entrevista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrevista` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_defensor` bigint unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entrevista_id_defensor_foreign` (`id_defensor`),
  CONSTRAINT `entrevista_id_defensor_foreign` FOREIGN KEY (`id_defensor`) REFERENCES `defensor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrevista`
--

LOCK TABLES `entrevista` WRITE;
/*!40000 ALTER TABLE `entrevista` DISABLE KEYS */;
INSERT INTO `entrevista` VALUES (1,4,'2024-04-17',NULL,1,NULL,'2024-10-10 23:10:16'),(2,1,'2024-05-23','saadsfdsfdad',1,'2024-05-23 03:49:35','2024-05-23 03:49:35'),(3,1,'2024-05-22','observaciones de ejemplo',1,'2024-05-23 04:01:09','2024-05-23 04:01:09'),(4,1,'2024-05-28','hola',1,'2024-05-28 01:58:53','2024-05-28 01:58:53'),(5,1,'2024-05-20','asdfasdfasdfad',1,'2024-05-28 02:27:02','2024-05-28 02:27:02'),(6,1,'2024-05-22','ejemplo 3:00 pm',1,'2024-05-28 03:03:07','2024-05-28 03:03:07'),(7,1,'2024-05-28','Hola, esto es un ejemplo',1,'2024-05-28 03:12:26','2024-05-28 03:12:26'),(8,1,'2024-07-26','ola',1,'2024-05-28 03:15:24','2024-06-01 04:28:09'),(9,1,'2024-07-04','algo',1,'2024-07-05 03:47:18','2024-09-05 04:01:41'),(10,1,'2024-07-10','aaaa',1,'2024-07-10 22:28:47','2024-07-10 22:28:47'),(11,1,'2024-07-11','asdfasdf',1,'2024-07-10 23:36:01','2024-07-10 23:36:01'),(12,1,'2024-09-03','asdfasdfasdf',1,'2024-09-05 02:54:18','2024-09-19 03:26:53');
/*!40000 ALTER TABLE `entrevista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escolaridad`
--

DROP TABLE IF EXISTS `escolaridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escolaridad` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escolaridad`
--

LOCK TABLES `escolaridad` WRITE;
/*!40000 ALTER TABLE `escolaridad` DISABLE KEYS */;
INSERT INTO `escolaridad` VALUES (1,'Licenciatura',1,NULL,NULL);
/*!40000 ALTER TABLE `escolaridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pais` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id_pais_foreign` (`id_pais`),
  CONSTRAINT `estado_id_pais_foreign` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Aguascalientes',118,NULL,NULL,NULL),(2,'Baja California',118,NULL,NULL,NULL),(3,'Baja California Sur',118,NULL,NULL,NULL),(4,'Campeche',118,NULL,NULL,NULL),(5,'Chiapas',118,NULL,NULL,NULL),(6,'Chihuahua',118,NULL,NULL,NULL),(7,'Coahuila',118,NULL,NULL,NULL),(8,'Colima',118,NULL,NULL,NULL),(9,'Ciudad de México',118,NULL,NULL,NULL),(10,'Durango',118,NULL,NULL,NULL),(11,'Estado de México',118,NULL,NULL,NULL),(12,'Guanajuato',118,NULL,NULL,NULL),(13,'Guerrero',118,NULL,NULL,NULL),(14,'Hidalgo',118,NULL,NULL,NULL),(15,'Jalisco',118,NULL,NULL,NULL),(16,'Michoacan',118,NULL,NULL,NULL),(17,'Morelos',118,NULL,NULL,NULL),(18,'Nayarit',118,NULL,NULL,NULL),(19,'Nuevo León',118,NULL,NULL,NULL),(20,'Oaxaca',118,NULL,NULL,NULL),(21,'Puebla',118,NULL,NULL,NULL),(22,'Queretaro',118,NULL,NULL,NULL),(23,'Quintana Roo',118,NULL,NULL,NULL),(24,'San Luis Potosí',118,NULL,NULL,NULL),(25,'Sinaloa',118,NULL,NULL,NULL),(26,'Sonora',118,NULL,NULL,NULL),(27,'Tabasco',118,NULL,NULL,NULL),(28,'Tamaulipas',118,NULL,NULL,NULL),(29,'Tlaxcala',118,NULL,NULL,NULL),(30,'Veracruz',118,NULL,NULL,NULL),(31,'Yucatán',118,NULL,NULL,NULL),(32,'Zacatecas',118,NULL,NULL,NULL);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus_sede_ministerial`
--

DROP TABLE IF EXISTS `estatus_sede_ministerial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatus_sede_ministerial` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus_sede_ministerial`
--

LOCK TABLES `estatus_sede_ministerial` WRITE;
/*!40000 ALTER TABLE `estatus_sede_ministerial` DISABLE KEYS */;
INSERT INTO `estatus_sede_ministerial` VALUES (1,'Estatus de sede',1,NULL,NULL);
/*!40000 ALTER TABLE `estatus_sede_ministerial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente`
--

DROP TABLE IF EXISTS `expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expediente` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `foja` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_ugi` bigint unsigned NOT NULL,
  `id_defensor` bigint unsigned DEFAULT NULL,
  `id_entrevista` bigint unsigned DEFAULT NULL,
  `nuc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_imputado` bigint unsigned DEFAULT NULL,
  `id_delito` bigint unsigned DEFAULT NULL,
  `id_victima` bigint unsigned DEFAULT NULL,
  `id_flagrancia` bigint unsigned DEFAULT NULL,
  `determinacion_mp` text COLLATE utf8mb4_unicode_ci,
  `id_asignacion_medidas` bigint unsigned DEFAULT NULL,
  `id_acuerdo_sede_ministerial` bigint unsigned DEFAULT NULL,
  `carpeta_procesal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audiencia_inicial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_juez_control` bigint unsigned DEFAULT NULL,
  `id_defensor_audiencia` bigint unsigned DEFAULT NULL,
  `cita_mecanismos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_acuerdo_reparatorio` bigint unsigned DEFAULT NULL,
  `fecha_formulacion_imputacion` date DEFAULT NULL,
  `fecha_vinculacion_proceso` date DEFAULT NULL,
  `id_delito_proceso` bigint unsigned DEFAULT NULL,
  `id_investigacion_complementaria` bigint unsigned DEFAULT NULL,
  `id_prorroga_plazo` bigint unsigned DEFAULT NULL,
  `id_medida_cautelar` bigint unsigned DEFAULT NULL,
  `audiencia_intermedia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_suspencion_condicional_proceso` bigint unsigned DEFAULT NULL,
  `id_procedimiento_abreviado` bigint unsigned DEFAULT NULL,
  `juicio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tribunal_enjuiciamiento` bigint unsigned DEFAULT NULL,
  `sentencia_juicio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_conclusion` bigint unsigned DEFAULT NULL,
  `visita_carcelaria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_impugnacion` bigint unsigned DEFAULT NULL,
  `id_orden_aprencion` bigint unsigned DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expediente_id_ugi_foreign` (`id_ugi`),
  KEY `expediente_id_defensor_foreign` (`id_defensor`),
  KEY `expediente_id_entrevista_foreign` (`id_entrevista`),
  KEY `expediente_id_imputado_foreign` (`id_imputado`),
  KEY `expediente_id_delito_foreign` (`id_delito`),
  KEY `expediente_id_victima_foreign` (`id_victima`),
  KEY `expediente_id_flagrancia_foreign` (`id_flagrancia`),
  KEY `expediente_id_asignacion_medidas_foreign` (`id_asignacion_medidas`),
  KEY `expediente_id_acuerdo_sede_ministerial_foreign` (`id_acuerdo_sede_ministerial`),
  KEY `expediente_id_juez_control_foreign` (`id_juez_control`),
  KEY `expediente_id_defensor_audiencia_foreign` (`id_defensor_audiencia`),
  KEY `expediente_id_acuerdo_reparatorio_foreign` (`id_acuerdo_reparatorio`),
  KEY `expediente_id_delito_proceso_foreign` (`id_delito_proceso`),
  KEY `expediente_id_investigacion_complementaria_foreign` (`id_investigacion_complementaria`),
  KEY `expediente_id_prorroga_plazo_foreign` (`id_prorroga_plazo`),
  KEY `expediente_id_medida_cautelar_foreign` (`id_medida_cautelar`),
  KEY `expediente_id_suspencion_condicional_proceso_foreign` (`id_suspencion_condicional_proceso`),
  KEY `expediente_id_procedimiento_abreviado_foreign` (`id_procedimiento_abreviado`),
  KEY `expediente_id_tribunal_enjuiciamiento_foreign` (`id_tribunal_enjuiciamiento`),
  KEY `expediente_id_conclusion_foreign` (`id_conclusion`),
  KEY `expediente_id_impugnacion_foreign` (`id_impugnacion`),
  KEY `expediente_id_orden_aprencion_foreign` (`id_orden_aprencion`),
  CONSTRAINT `expediente_id_acuerdo_reparatorio_foreign` FOREIGN KEY (`id_acuerdo_reparatorio`) REFERENCES `acuerdo_reparatorio` (`id`),
  CONSTRAINT `expediente_id_acuerdo_sede_ministerial_foreign` FOREIGN KEY (`id_acuerdo_sede_ministerial`) REFERENCES `acuerdo_sede_ministerial` (`id`),
  CONSTRAINT `expediente_id_asignacion_medidas_foreign` FOREIGN KEY (`id_asignacion_medidas`) REFERENCES `asignacion_medidas` (`id`),
  CONSTRAINT `expediente_id_conclusion_foreign` FOREIGN KEY (`id_conclusion`) REFERENCES `conclusion` (`id`),
  CONSTRAINT `expediente_id_defensor_audiencia_foreign` FOREIGN KEY (`id_defensor_audiencia`) REFERENCES `defensor` (`id`),
  CONSTRAINT `expediente_id_defensor_foreign` FOREIGN KEY (`id_defensor`) REFERENCES `defensor` (`id`),
  CONSTRAINT `expediente_id_delito_foreign` FOREIGN KEY (`id_delito`) REFERENCES `delito` (`id`),
  CONSTRAINT `expediente_id_delito_proceso_foreign` FOREIGN KEY (`id_delito_proceso`) REFERENCES `delito_proceso` (`id`),
  CONSTRAINT `expediente_id_entrevista_foreign` FOREIGN KEY (`id_entrevista`) REFERENCES `entrevista` (`id`),
  CONSTRAINT `expediente_id_flagrancia_foreign` FOREIGN KEY (`id_flagrancia`) REFERENCES `flagrancia` (`id`),
  CONSTRAINT `expediente_id_impugnacion_foreign` FOREIGN KEY (`id_impugnacion`) REFERENCES `impugnacion` (`id`),
  CONSTRAINT `expediente_id_imputado_foreign` FOREIGN KEY (`id_imputado`) REFERENCES `imputado` (`id`),
  CONSTRAINT `expediente_id_investigacion_complementaria_foreign` FOREIGN KEY (`id_investigacion_complementaria`) REFERENCES `investigacion_complementaria` (`id`),
  CONSTRAINT `expediente_id_juez_control_foreign` FOREIGN KEY (`id_juez_control`) REFERENCES `juez_control` (`id`),
  CONSTRAINT `expediente_id_medida_cautelar_foreign` FOREIGN KEY (`id_medida_cautelar`) REFERENCES `medida_cautelar` (`id`),
  CONSTRAINT `expediente_id_orden_aprencion_foreign` FOREIGN KEY (`id_orden_aprencion`) REFERENCES `orden_aprencion` (`id`),
  CONSTRAINT `expediente_id_procedimiento_abreviado_foreign` FOREIGN KEY (`id_procedimiento_abreviado`) REFERENCES `procedimiento_abreviado` (`id`),
  CONSTRAINT `expediente_id_prorroga_plazo_foreign` FOREIGN KEY (`id_prorroga_plazo`) REFERENCES `prorroga_plazo_investigacion_complementaria` (`id`),
  CONSTRAINT `expediente_id_suspencion_condicional_proceso_foreign` FOREIGN KEY (`id_suspencion_condicional_proceso`) REFERENCES `suspencion_condicional_proceso` (`id`),
  CONSTRAINT `expediente_id_tribunal_enjuiciamiento_foreign` FOREIGN KEY (`id_tribunal_enjuiciamiento`) REFERENCES `tribunal_enjuiciamiento` (`id`),
  CONSTRAINT `expediente_id_ugi_foreign` FOREIGN KEY (`id_ugi`) REFERENCES `ugi` (`id`),
  CONSTRAINT `expediente_id_victima_foreign` FOREIGN KEY (`id_victima`) REFERENCES `victima` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente`
--

LOCK TABLES `expediente` WRITE;
/*!40000 ALTER TABLE `expediente` DISABLE KEYS */;
INSERT INTO `expediente` VALUES (1,'003',1,1,1,'N-003',1,1,1,1,'DETERMINACION DEL MP EDITADOOO',1,1,'CARPETA PROCESAL EJEMEPLO','bbbbbbbbbb',1,3,'CITA MECANISMOS EJEMPLO',1,'2024-02-01','2020-02-01',1,1,1,1,'prueba de edición de la audiencia intermedia',1,1,'JUICIIO EJEMPLO',1,'SENTENCIA JUICIIO EJEMPLO',1,'resumen de visita',1,1,NULL,'2024-04-20 02:03:44','2024-10-10 23:08:04'),(2,'004',3,NULL,3,'N-004',NULL,NULL,4,4,'esto es una determinación del ministerio publico',2,2,'ejemploooo','ejemplo de audiencia inicial',5,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-14 23:57:28','2024-10-02 22:50:54'),(3,'001',1,NULL,11,'N-001',NULL,NULL,NULL,NULL,'klhjkllkjljlik',NULL,NULL,NULL,NULL,1,NULL,'prueba cita mecanismos 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-07-05 03:14:24','2024-07-10 23:36:01'),(4,'002',3,NULL,10,'M-002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cita mecanismos 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-07-05 03:15:48','2024-07-10 22:28:48'),(5,'005',6,NULL,9,'N-005',NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-07-05 03:16:35','2024-08-23 00:25:58'),(6,'000',1,NULL,12,'N-000',NULL,NULL,NULL,6,'dafdfasdf',3,3,'vadfadfadsfasf','asdfasdfasdf',1,1,'hola que tal como estas',8,'2024-09-18','2024-09-27',NULL,NULL,NULL,NULL,'daadsfadsf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-08-28 01:05:04','2024-09-19 03:28:19');
/*!40000 ALTER TABLE `expediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente_delito`
--

DROP TABLE IF EXISTS `expediente_delito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expediente_delito` (
  `id_expediente` bigint unsigned NOT NULL,
  `id_delito` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_expediente`,`id_delito`),
  KEY `id_delito` (`id_delito`),
  CONSTRAINT `expediente_delito_ibfk_1` FOREIGN KEY (`id_expediente`) REFERENCES `expediente` (`id`),
  CONSTRAINT `expediente_delito_ibfk_2` FOREIGN KEY (`id_delito`) REFERENCES `delito` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente_delito`
--

LOCK TABLES `expediente_delito` WRITE;
/*!40000 ALTER TABLE `expediente_delito` DISABLE KEYS */;
INSERT INTO `expediente_delito` VALUES (6,4),(2,6),(6,7);
/*!40000 ALTER TABLE `expediente_delito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flagrancia`
--

DROP TABLE IF EXISTS `flagrancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flagrancia` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flagrancia`
--

LOCK TABLES `flagrancia` WRITE;
/*!40000 ALTER TABLE `flagrancia` DISABLE KEYS */;
INSERT INTO `flagrancia` VALUES (1,'2024-04-07','15:40',1,NULL,'2024-06-21 01:57:21'),(2,'2024-06-17','04:58',1,'2024-06-19 02:58:57','2024-06-19 02:58:57'),(3,'2024-06-17','04:58',1,'2024-06-19 02:59:04','2024-06-19 02:59:04'),(4,'2024-06-08','16:07',1,'2024-06-19 03:07:53','2024-06-19 03:10:11'),(5,'2024-08-22','13:26',1,'2024-08-23 00:25:58','2024-08-23 00:25:58'),(6,'2024-09-20','14:53',1,'2024-09-12 01:33:30','2024-09-19 03:27:23');
/*!40000 ALTER TABLE `flagrancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impugnacion`
--

DROP TABLE IF EXISTS `impugnacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impugnacion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_impugnacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impugnacion`
--

LOCK TABLES `impugnacion` WRITE;
/*!40000 ALTER TABLE `impugnacion` DISABLE KEYS */;
INSERT INTO `impugnacion` VALUES (1,'Impugnacion1','2024-01-15',1,NULL,NULL);
/*!40000 ALTER TABLE `impugnacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imputado`
--

DROP TABLE IF EXISTS `imputado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imputado` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido_paterno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido_materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domicilio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pais` bigint unsigned NOT NULL,
  `id_estado` bigint unsigned NOT NULL,
  `id_municipio` bigint unsigned NOT NULL,
  `estado_civil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_de_nacimiento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_escolaridad` bigint unsigned NOT NULL,
  `id_ocupacion` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imputado_id_pais_foreign` (`id_pais`),
  KEY `imputado_id_estado_foreign` (`id_estado`),
  KEY `imputado_id_municipio_foreign` (`id_municipio`),
  KEY `imputado_id_escolaridad_foreign` (`id_escolaridad`),
  KEY `imputado_id_ocupacion_foreign` (`id_ocupacion`),
  CONSTRAINT `imputado_id_escolaridad_foreign` FOREIGN KEY (`id_escolaridad`) REFERENCES `escolaridad` (`id`),
  CONSTRAINT `imputado_id_estado_foreign` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`),
  CONSTRAINT `imputado_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  CONSTRAINT `imputado_id_ocupacion_foreign` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion` (`id`),
  CONSTRAINT `imputado_id_pais_foreign` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imputado`
--

LOCK TABLES `imputado` WRITE;
/*!40000 ALTER TABLE `imputado` DISABLE KEYS */;
INSERT INTO `imputado` VALUES (1,'Jose Alejandro','Segura','HDZ','8341234567','Xyz','masculino',1,1,1,'soltero/a','1997-02-12',1,1,1,NULL,'2024-09-12 00:18:52'),(4,'asdfas','dfasdf','asdfasdfas','8341609881','calle','Masculino',118,28,2313,'Soltero','12-02-1997',1,1,1,'2024-06-06 03:42:21','2024-09-06 23:00:37'),(5,'Pedro','Fernando',NULL,'8341609881','calle x & y','masculino',118,28,2313,'soltero/a','02-12-1998',1,1,1,'2024-06-06 03:58:47','2024-09-07 02:29:13'),(6,'a','b','c','8341609881','calle x colonia y','Masculino',118,2,2274,'Soltero','12-02-1997',1,1,1,'2024-06-06 04:09:24','2024-09-06 03:21:52'),(7,'algo','algo','algo','8341609881','calle','masculino',118,1,1,'soltero/a','2024-09-18',1,1,1,'2024-06-06 04:27:06','2024-09-19 23:49:03'),(8,'ignacio','asdasd','asdasd','8341609881','calle eucalipto esq durazno','Masculino',118,28,2313,'divorciado','19-01-2001',1,1,1,'2024-06-06 04:29:41','2024-06-11 03:36:18'),(9,'jose','martinez','rodriguez','8341698321','calle a b y c','masculino',118,28,2281,'solteo','10-05-1993',1,1,1,'2024-06-11 03:27:30','2024-06-11 04:05:05'),(10,'Laura Argelia','Perales','Perez','8341609881','16 y 18 Berriozabal','femenino',118,28,2313,'divorciado/a','2001-06-04',1,1,1,'2024-06-11 04:04:53','2024-09-05 03:58:53'),(11,'Jose Alejandro','Segura','Hernandez','8321034941','Paseo Bambusa 1730','masculino',118,28,2313,'soltero/a','1998-08-26',1,1,1,'2024-06-14 00:52:49','2024-09-06 03:21:50'),(12,'askdjl','lkjslksd','lkjaskdjl','8341609881','x','masculino',118,28,2275,'soltero/a','2024-07-10',1,1,1,'2024-07-11 00:36:10','2024-10-02 22:49:25');
/*!40000 ALTER TABLE `imputado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigacion_complementaria`
--

DROP TABLE IF EXISTS `investigacion_complementaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investigacion_complementaria` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigacion_complementaria`
--

LOCK TABLES `investigacion_complementaria` WRITE;
/*!40000 ALTER TABLE `investigacion_complementaria` DISABLE KEYS */;
INSERT INTO `investigacion_complementaria` VALUES (1,'2024-04-19','12:26:00',1,NULL,NULL);
/*!40000 ALTER TABLE `investigacion_complementaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juez_control`
--

DROP TABLE IF EXISTS `juez_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juez_control` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_municipio` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `juez_control_id_municipio_foreign` (`id_municipio`),
  CONSTRAINT `juez_control_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juez_control`
--

LOCK TABLES `juez_control` WRITE;
/*!40000 ALTER TABLE `juez_control` DISABLE KEYS */;
INSERT INTO `juez_control` VALUES (1,'Alejandro Segura ss',2280,1,NULL,'2024-10-24 23:43:39'),(2,'Unidad de Tramitación Masiva',2281,1,'2024-05-22 03:31:00','2024-05-22 03:31:00'),(3,'zdfzdf',2282,1,'2024-06-14 03:21:05','2024-06-14 03:21:05'),(4,'zdfzdf',2289,1,'2024-06-14 03:21:19','2024-10-16 04:04:04'),(5,'Unidad de Atención Inmediata',2290,1,'2024-06-27 01:28:45','2024-10-16 04:04:07');
/*!40000 ALTER TABLE `juez_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_cautelar`
--

DROP TABLE IF EXISTS `medida_cautelar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_cautelar` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_cautelar`
--

LOCK TABLES `medida_cautelar` WRITE;
/*!40000 ALTER TABLE `medida_cautelar` DISABLE KEYS */;
INSERT INTO `medida_cautelar` VALUES (1,'asdfasdfasdf',0,NULL,'2024-10-16 04:05:45'),(2,'medidas2',1,'2024-10-15 03:49:26','2024-10-15 03:51:11');
/*!40000 ALTER TABLE `medida_cautelar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_cautelar_a`
--

DROP TABLE IF EXISTS `medida_cautelar_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_cautelar_a` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_medida_cautelar` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medida_cautelar_a_id_medida_cautelar_foreign` (`id_medida_cautelar`),
  CONSTRAINT `medida_cautelar_a_id_medida_cautelar_foreign` FOREIGN KEY (`id_medida_cautelar`) REFERENCES `medida_cautelar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_cautelar_a`
--

LOCK TABLES `medida_cautelar_a` WRITE;
/*!40000 ALTER TABLE `medida_cautelar_a` DISABLE KEYS */;
INSERT INTO `medida_cautelar_a` VALUES (1,'Medida cautelar 1',1,1,NULL,NULL);
/*!40000 ALTER TABLE `medida_cautelar_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_proteccion`
--

DROP TABLE IF EXISTS `medida_proteccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_proteccion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_proteccion`
--

LOCK TABLES `medida_proteccion` WRITE;
/*!40000 ALTER TABLE `medida_proteccion` DISABLE KEYS */;
INSERT INTO `medida_proteccion` VALUES (1,'Medida144',1,NULL,'2024-10-16 04:06:24'),(2,'Medida2',1,'2024-04-20 02:31:02','2024-10-24 23:43:09'),(3,'Medida3',1,'2024-04-20 02:31:14','2024-04-20 02:31:14'),(4,'Medida2',1,'2024-04-20 02:31:21','2024-04-20 02:31:21'),(5,'Medida4',1,'2024-04-20 02:31:49','2024-04-20 02:31:49'),(6,'Medida5',0,'2024-04-24 01:08:18','2024-10-24 23:43:25'),(7,'aaaaaa',0,'2024-06-14 03:20:07','2024-10-16 04:05:31');
/*!40000 ALTER TABLE `medida_proteccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_11_24_203058_nuevas_tablas',1),(6,'2024_05_18_204615_create_calendario_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_estado` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `municipio_id_estado_foreign` (`id_estado`),
  CONSTRAINT `municipio_id_estado_foreign` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2752 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Aguascalientes',1,NULL,NULL,NULL),(2,'Asientos',1,NULL,NULL,NULL),(3,'Calvillo',1,NULL,NULL,NULL),(4,'Cosío',1,NULL,NULL,NULL),(5,'Jesús María',1,NULL,NULL,NULL),(6,'Pabellón de Arteaga',1,NULL,NULL,NULL),(7,'Rincón de Romos',1,NULL,NULL,NULL),(8,'San José de Gracia',1,NULL,NULL,NULL),(9,'Tepezalá',1,NULL,NULL,NULL),(10,'El Llano',1,NULL,NULL,NULL),(11,'San Francisco de los Romo',1,NULL,NULL,NULL),(12,'Ensenada',2,NULL,NULL,NULL),(13,'Mexicali',2,NULL,NULL,NULL),(14,'Tecate',2,NULL,NULL,NULL),(15,'Tijuana',2,NULL,NULL,NULL),(16,'Playas de Rosarito',2,NULL,NULL,NULL),(17,'Comondú',3,NULL,NULL,NULL),(18,'Mulegé',3,NULL,NULL,NULL),(19,'La Paz',3,NULL,NULL,NULL),(20,'Los Cabos',3,NULL,NULL,NULL),(21,'Loreto',3,NULL,NULL,NULL),(22,'Calkiní',4,NULL,NULL,NULL),(23,'Campeche',4,NULL,NULL,NULL),(24,'Carmen',4,NULL,NULL,NULL),(25,'Champotón',4,NULL,NULL,NULL),(26,'Hecelchakán',4,NULL,NULL,NULL),(27,'Hopelchén',4,NULL,NULL,NULL),(28,'Palizada',4,NULL,NULL,NULL),(29,'Tenabo',4,NULL,NULL,NULL),(30,'Escárcega',4,NULL,NULL,NULL),(31,'Calakmul',4,NULL,NULL,NULL),(32,'Candelaria',4,NULL,NULL,NULL),(33,'Abasolo',5,NULL,NULL,NULL),(34,'Acuña',5,NULL,NULL,NULL),(35,'Allende',5,NULL,NULL,NULL),(36,'Arteaga',5,NULL,NULL,NULL),(37,'Candela',5,NULL,NULL,NULL),(38,'Castaños',5,NULL,NULL,NULL),(39,'Cuatro Ciénegas',5,NULL,NULL,NULL),(40,'Escobedo',5,NULL,NULL,NULL),(41,'Francisco I. Madero',5,NULL,NULL,NULL),(42,'Frontera',5,NULL,NULL,NULL),(43,'General Cepeda',5,NULL,NULL,NULL),(44,'Guerrero',5,NULL,NULL,NULL),(45,'Hidalgo',5,NULL,NULL,NULL),(46,'Jiménez',5,NULL,NULL,NULL),(47,'Juárez',5,NULL,NULL,NULL),(48,'Lamadrid',5,NULL,NULL,NULL),(49,'Matamoros',5,NULL,NULL,NULL),(50,'Monclova',5,NULL,NULL,NULL),(51,'Morelos',5,NULL,NULL,NULL),(52,'Múzquiz',5,NULL,NULL,NULL),(53,'Nadadores',5,NULL,NULL,NULL),(54,'Nava',5,NULL,NULL,NULL),(55,'Ocampo',5,NULL,NULL,NULL),(56,'Parras',5,NULL,NULL,NULL),(57,'Piedras Negras',5,NULL,NULL,NULL),(58,'Progreso',5,NULL,NULL,NULL),(59,'Ramos Arizpe',5,NULL,NULL,NULL),(60,'Sabinas',5,NULL,NULL,NULL),(61,'Sacramento',5,NULL,NULL,NULL),(62,'Saltillo',5,NULL,NULL,NULL),(63,'San Buenaventura',5,NULL,NULL,NULL),(64,'San Juan de Sabinas',5,NULL,NULL,NULL),(65,'San Pedro',5,NULL,NULL,NULL),(66,'Sierra Mojada',5,NULL,NULL,NULL),(67,'Torreón',5,NULL,NULL,NULL),(68,'Viesca',5,NULL,NULL,NULL),(69,'Villa Unión',5,NULL,NULL,NULL),(70,'Zaragoza',5,NULL,NULL,NULL),(71,'Armería',6,NULL,NULL,NULL),(72,'Colima',6,NULL,NULL,NULL),(73,'Comala',6,NULL,NULL,NULL),(74,'Coquimatlán',6,NULL,NULL,NULL),(75,'Cuauhtémoc',6,NULL,NULL,NULL),(76,'Ixtlahuacán',6,NULL,NULL,NULL),(77,'Manzanillo',6,NULL,NULL,NULL),(78,'Minatitlán',6,NULL,NULL,NULL),(79,'Tecomán',6,NULL,NULL,NULL),(80,'Villa de Álvarez',6,NULL,NULL,NULL),(81,'Acacoyagua',7,NULL,NULL,NULL),(82,'Acala',7,NULL,NULL,NULL),(83,'Acapetahua',7,NULL,NULL,NULL),(84,'Altamirano',7,NULL,NULL,NULL),(85,'Amatán',7,NULL,NULL,NULL),(86,'Amatenango de la Frontera',7,NULL,NULL,NULL),(87,'Amatenango del Valle',7,NULL,NULL,NULL),(88,'Angel Albino Corzo',7,NULL,NULL,NULL),(89,'Arriaga',7,NULL,NULL,NULL),(90,'Bejucal de Ocampo',7,NULL,NULL,NULL),(91,'Bella Vista',7,NULL,NULL,NULL),(92,'Berriozábal',7,NULL,NULL,NULL),(93,'Bochil',7,NULL,NULL,NULL),(94,'El Bosque',7,NULL,NULL,NULL),(95,'Cacahoatán',7,NULL,NULL,NULL),(96,'Catazajá',7,NULL,NULL,NULL),(97,'Cintalapa',7,NULL,NULL,NULL),(98,'Coapilla',7,NULL,NULL,NULL),(99,'Comitán de Domínguez',7,NULL,NULL,NULL),(100,'La Concordia',7,NULL,NULL,NULL),(101,'Copainalá',7,NULL,NULL,NULL),(102,'Chalchihuitán',7,NULL,NULL,NULL),(103,'Chamula',7,NULL,NULL,NULL),(104,'Chanal',7,NULL,NULL,NULL),(105,'Chapultenango',7,NULL,NULL,NULL),(106,'Chenalhó',7,NULL,NULL,NULL),(107,'Chiapa de Corzo',7,NULL,NULL,NULL),(108,'Chiapilla',7,NULL,NULL,NULL),(109,'Chicoasén',7,NULL,NULL,NULL),(110,'Chicomuselo',7,NULL,NULL,NULL),(111,'Chilón',7,NULL,NULL,NULL),(112,'Escuintla',7,NULL,NULL,NULL),(113,'Francisco León',7,NULL,NULL,NULL),(114,'Frontera Comalapa',7,NULL,NULL,NULL),(115,'Frontera Hidalgo',7,NULL,NULL,NULL),(116,'La Grandeza',7,NULL,NULL,NULL),(117,'Huehuetán',7,NULL,NULL,NULL),(118,'Huixtán',7,NULL,NULL,NULL),(119,'Huitiupán',7,NULL,NULL,NULL),(120,'Huixtla',7,NULL,NULL,NULL),(121,'La Independencia',7,NULL,NULL,NULL),(122,'Ixhuatán',7,NULL,NULL,NULL),(123,'Ixtacomitán',7,NULL,NULL,NULL),(124,'Ixtapa',7,NULL,NULL,NULL),(125,'Ixtapangajoya',7,NULL,NULL,NULL),(126,'Jiquipilas',7,NULL,NULL,NULL),(127,'Jitotol',7,NULL,NULL,NULL),(128,'Juárez',7,NULL,NULL,NULL),(129,'Larráinzar',7,NULL,NULL,NULL),(130,'La Libertad',7,NULL,NULL,NULL),(131,'Mapastepec',7,NULL,NULL,NULL),(132,'Las Margaritas',7,NULL,NULL,NULL),(133,'Mazapa de Madero',7,NULL,NULL,NULL),(134,'Mazatán',7,NULL,NULL,NULL),(135,'Metapa',7,NULL,NULL,NULL),(136,'Mitontic',7,NULL,NULL,NULL),(137,'Motozintla',7,NULL,NULL,NULL),(138,'Nicolás Ruíz',7,NULL,NULL,NULL),(139,'Ocosingo',7,NULL,NULL,NULL),(140,'Ocotepec',7,NULL,NULL,NULL),(141,'Ocozocoautla de Espinosa',7,NULL,NULL,NULL),(142,'Ostuacán',7,NULL,NULL,NULL),(143,'Osumacinta',7,NULL,NULL,NULL),(144,'Oxchuc',7,NULL,NULL,NULL),(145,'Palenque',7,NULL,NULL,NULL),(146,'Pantelhó',7,NULL,NULL,NULL),(147,'Pantepec',7,NULL,NULL,NULL),(148,'Pichucalco',7,NULL,NULL,NULL),(149,'Pijijiapan',7,NULL,NULL,NULL),(150,'El Porvenir',7,NULL,NULL,NULL),(151,'Villa Comaltitlán',7,NULL,NULL,NULL),(152,'Pueblo Nuevo Solistahuacán',7,NULL,NULL,NULL),(153,'Rayón',7,NULL,NULL,NULL),(154,'Reforma',7,NULL,NULL,NULL),(155,'Las Rosas',7,NULL,NULL,NULL),(156,'Sabanilla',7,NULL,NULL,NULL),(157,'Salto de Agua',7,NULL,NULL,NULL),(158,'San Cristóbal de las Casas',7,NULL,NULL,NULL),(159,'San Fernando',7,NULL,NULL,NULL),(160,'Siltepec',7,NULL,NULL,NULL),(161,'Simojovel',7,NULL,NULL,NULL),(162,'Sitalá',7,NULL,NULL,NULL),(163,'Socoltenango',7,NULL,NULL,NULL),(164,'Solosuchiapa',7,NULL,NULL,NULL),(165,'Soyaló',7,NULL,NULL,NULL),(166,'Suchiapa',7,NULL,NULL,NULL),(167,'Suchiate',7,NULL,NULL,NULL),(168,'Sunuapa',7,NULL,NULL,NULL),(169,'Tapachula',7,NULL,NULL,NULL),(170,'Tapalapa',7,NULL,NULL,NULL),(171,'Tapilula',7,NULL,NULL,NULL),(172,'Tecpatán',7,NULL,NULL,NULL),(173,'Tenejapa',7,NULL,NULL,NULL),(174,'Teopisca',7,NULL,NULL,NULL),(175,'Tila',7,NULL,NULL,NULL),(176,'Tonalá',7,NULL,NULL,NULL),(177,'Totolapa',7,NULL,NULL,NULL),(178,'La Trinitaria',7,NULL,NULL,NULL),(179,'Tumbalá',7,NULL,NULL,NULL),(180,'Tuxtla Gutiérrez',7,NULL,NULL,NULL),(181,'Tuxtla Chico',7,NULL,NULL,NULL),(182,'Tuzantán',7,NULL,NULL,NULL),(183,'Tzimol',7,NULL,NULL,NULL),(184,'Unión Juárez',7,NULL,NULL,NULL),(185,'Venustiano Carranza',7,NULL,NULL,NULL),(186,'Villa Corzo',7,NULL,NULL,NULL),(187,'Villaflores',7,NULL,NULL,NULL),(188,'Yajalón',7,NULL,NULL,NULL),(189,'San Lucas',7,NULL,NULL,NULL),(190,'Zinacantán',7,NULL,NULL,NULL),(191,'San Juan Cancuc',7,NULL,NULL,NULL),(192,'Aldama',7,NULL,NULL,NULL),(193,'Benemérito de las Américas',7,NULL,NULL,NULL),(194,'Maravilla Tenejapa',7,NULL,NULL,NULL),(195,'Marqués de Comillas',7,NULL,NULL,NULL),(196,'Montecristo de Guerrero',7,NULL,NULL,NULL),(197,'San Andrés Duraznal',7,NULL,NULL,NULL),(198,'Santiago el Pinar',7,NULL,NULL,NULL),(199,'Capitán Luis Ángel Vidal',7,NULL,NULL,NULL),(200,'Rincón Chamula San Pedro',7,NULL,NULL,NULL),(201,'El Parral',7,NULL,NULL,NULL),(202,'Emiliano Zapata',7,NULL,NULL,NULL),(203,'Mezcalapa',7,NULL,NULL,NULL),(204,'Ahumada',8,NULL,NULL,NULL),(205,'Aldama',8,NULL,NULL,NULL),(206,'Allende',8,NULL,NULL,NULL),(207,'Aquiles Serdán',8,NULL,NULL,NULL),(208,'Ascensión',8,NULL,NULL,NULL),(209,'Bachíniva',8,NULL,NULL,NULL),(210,'Balleza',8,NULL,NULL,NULL),(211,'Batopilas de Manuel Gómez Morín',8,NULL,NULL,NULL),(212,'Bocoyna',8,NULL,NULL,NULL),(213,'Buenaventura',8,NULL,NULL,NULL),(214,'Camargo',8,NULL,NULL,NULL),(215,'Carichí',8,NULL,NULL,NULL),(216,'Casas Grandes',8,NULL,NULL,NULL),(217,'Coronado',8,NULL,NULL,NULL),(218,'Coyame del Sotol',8,NULL,NULL,NULL),(219,'La Cruz',8,NULL,NULL,NULL),(220,'Cuauhtémoc',8,NULL,NULL,NULL),(221,'Cusihuiriachi',8,NULL,NULL,NULL),(222,'Chihuahua',8,NULL,NULL,NULL),(223,'Chínipas',8,NULL,NULL,NULL),(224,'Delicias',8,NULL,NULL,NULL),(225,'Dr. Belisario Domínguez',8,NULL,NULL,NULL),(226,'Galeana',8,NULL,NULL,NULL),(227,'Santa Isabel',8,NULL,NULL,NULL),(228,'Gómez Farías',8,NULL,NULL,NULL),(229,'Gran Morelos',8,NULL,NULL,NULL),(230,'Guachochi',8,NULL,NULL,NULL),(231,'Guadalupe',8,NULL,NULL,NULL),(232,'Guadalupe y Calvo',8,NULL,NULL,NULL),(233,'Guazapares',8,NULL,NULL,NULL),(234,'Guerrero',8,NULL,NULL,NULL),(235,'Hidalgo del Parral',8,NULL,NULL,NULL),(236,'Huejotitán',8,NULL,NULL,NULL),(237,'Ignacio Zaragoza',8,NULL,NULL,NULL),(238,'Janos',8,NULL,NULL,NULL),(239,'Jiménez',8,NULL,NULL,NULL),(240,'Juárez',8,NULL,NULL,NULL),(241,'Julimes',8,NULL,NULL,NULL),(242,'López',8,NULL,NULL,NULL),(243,'Madera',8,NULL,NULL,NULL),(244,'Maguarichi',8,NULL,NULL,NULL),(245,'Manuel Benavides',8,NULL,NULL,NULL),(246,'Matachí',8,NULL,NULL,NULL),(247,'Matamoros',8,NULL,NULL,NULL),(248,'Meoqui',8,NULL,NULL,NULL),(249,'Morelos',8,NULL,NULL,NULL),(250,'Moris',8,NULL,NULL,NULL),(251,'Namiquipa',8,NULL,NULL,NULL),(252,'Nonoava',8,NULL,NULL,NULL),(253,'Nuevo Casas Grandes',8,NULL,NULL,NULL),(254,'Ocampo',8,NULL,NULL,NULL),(255,'Ojinaga',8,NULL,NULL,NULL),(256,'Praxedis G. Guerrero',8,NULL,NULL,NULL),(257,'Riva Palacio',8,NULL,NULL,NULL),(258,'Rosales',8,NULL,NULL,NULL),(259,'Rosario',8,NULL,NULL,NULL),(260,'San Francisco de Borja',8,NULL,NULL,NULL),(261,'San Francisco de Conchos',8,NULL,NULL,NULL),(262,'San Francisco del Oro',8,NULL,NULL,NULL),(263,'Santa Bárbara',8,NULL,NULL,NULL),(264,'Satevó',8,NULL,NULL,NULL),(265,'Saucillo',8,NULL,NULL,NULL),(266,'Temósachic',8,NULL,NULL,NULL),(267,'El Tule',8,NULL,NULL,NULL),(268,'Urique',8,NULL,NULL,NULL),(269,'Uruachi',8,NULL,NULL,NULL),(270,'Valle de Zaragoza',8,NULL,NULL,NULL),(271,'Azcapotzalco',9,NULL,NULL,NULL),(272,'Coyoacán',9,NULL,NULL,NULL),(273,'Cuajimalpa de Morelos',9,NULL,NULL,NULL),(274,'Gustavo A. Madero',9,NULL,NULL,NULL),(275,'Iztacalco',9,NULL,NULL,NULL),(276,'Iztapalapa',9,NULL,NULL,NULL),(277,'La Magdalena Contreras',9,NULL,NULL,NULL),(278,'Milpa Alta',9,NULL,NULL,NULL),(279,'Álvaro Obregón',9,NULL,NULL,NULL),(280,'Tláhuac',9,NULL,NULL,NULL),(281,'Tlalpan',9,NULL,NULL,NULL),(282,'Xochimilco',9,NULL,NULL,NULL),(283,'Benito Juárez',9,NULL,NULL,NULL),(284,'Cuauhtémoc',9,NULL,NULL,NULL),(285,'Miguel Hidalgo',9,NULL,NULL,NULL),(286,'Venustiano Carranza',9,NULL,NULL,NULL),(287,'Aguascalientes',1,NULL,NULL,NULL),(288,'Asientos',1,NULL,NULL,NULL),(289,'Calvillo',1,NULL,NULL,NULL),(290,'Cosío',1,NULL,NULL,NULL),(291,'Jesús María',1,NULL,NULL,NULL),(292,'Pabellón de Arteaga',1,NULL,NULL,NULL),(293,'Rincón de Romos',1,NULL,NULL,NULL),(294,'San José de Gracia',1,NULL,NULL,NULL),(295,'Tepezalá',1,NULL,NULL,NULL),(296,'El Llano',1,NULL,NULL,NULL),(297,'San Francisco de los Romo',1,NULL,NULL,NULL),(298,'Ensenada',2,NULL,NULL,NULL),(299,'Mexicali',2,NULL,NULL,NULL),(300,'Tecate',2,NULL,NULL,NULL),(301,'Tijuana',2,NULL,NULL,NULL),(302,'Playas de Rosarito',2,NULL,NULL,NULL),(303,'Comondú',3,NULL,NULL,NULL),(304,'Mulegé',3,NULL,NULL,NULL),(305,'La Paz',3,NULL,NULL,NULL),(306,'Los Cabos',3,NULL,NULL,NULL),(307,'Loreto',3,NULL,NULL,NULL),(308,'Calkiní',4,NULL,NULL,NULL),(309,'Campeche',4,NULL,NULL,NULL),(310,'Carmen',4,NULL,NULL,NULL),(311,'Champotón',4,NULL,NULL,NULL),(312,'Hecelchakán',4,NULL,NULL,NULL),(313,'Hopelchén',4,NULL,NULL,NULL),(314,'Palizada',4,NULL,NULL,NULL),(315,'Tenabo',4,NULL,NULL,NULL),(316,'Escárcega',4,NULL,NULL,NULL),(317,'Calakmul',4,NULL,NULL,NULL),(318,'Candelaria',4,NULL,NULL,NULL),(319,'Abasolo',5,NULL,NULL,NULL),(320,'Acuña',5,NULL,NULL,NULL),(321,'Allende',5,NULL,NULL,NULL),(322,'Arteaga',5,NULL,NULL,NULL),(323,'Candela',5,NULL,NULL,NULL),(324,'Castaños',5,NULL,NULL,NULL),(325,'Cuatro Ciénegas',5,NULL,NULL,NULL),(326,'Escobedo',5,NULL,NULL,NULL),(327,'Francisco I. Madero',5,NULL,NULL,NULL),(328,'Frontera',5,NULL,NULL,NULL),(329,'General Cepeda',5,NULL,NULL,NULL),(330,'Guerrero',5,NULL,NULL,NULL),(331,'Hidalgo',5,NULL,NULL,NULL),(332,'Jiménez',5,NULL,NULL,NULL),(333,'Juárez',5,NULL,NULL,NULL),(334,'Lamadrid',5,NULL,NULL,NULL),(335,'Matamoros',5,NULL,NULL,NULL),(336,'Monclova',5,NULL,NULL,NULL),(337,'Morelos',5,NULL,NULL,NULL),(338,'Múzquiz',5,NULL,NULL,NULL),(339,'Nadadores',5,NULL,NULL,NULL),(340,'Nava',5,NULL,NULL,NULL),(341,'Ocampo',5,NULL,NULL,NULL),(342,'Parras',5,NULL,NULL,NULL),(343,'Piedras Negras',5,NULL,NULL,NULL),(344,'Progreso',5,NULL,NULL,NULL),(345,'Ramos Arizpe',5,NULL,NULL,NULL),(346,'Sabinas',5,NULL,NULL,NULL),(347,'Sacramento',5,NULL,NULL,NULL),(348,'Saltillo',5,NULL,NULL,NULL),(349,'San Buenaventura',5,NULL,NULL,NULL),(350,'San Juan de Sabinas',5,NULL,NULL,NULL),(351,'San Pedro',5,NULL,NULL,NULL),(352,'Sierra Mojada',5,NULL,NULL,NULL),(353,'Torreón',5,NULL,NULL,NULL),(354,'Viesca',5,NULL,NULL,NULL),(355,'Villa Unión',5,NULL,NULL,NULL),(356,'Zaragoza',5,NULL,NULL,NULL),(357,'Armería',6,NULL,NULL,NULL),(358,'Colima',6,NULL,NULL,NULL),(359,'Comala',6,NULL,NULL,NULL),(360,'Coquimatlán',6,NULL,NULL,NULL),(361,'Cuauhtémoc',6,NULL,NULL,NULL),(362,'Ixtlahuacán',6,NULL,NULL,NULL),(363,'Manzanillo',6,NULL,NULL,NULL),(364,'Minatitlán',6,NULL,NULL,NULL),(365,'Tecomán',6,NULL,NULL,NULL),(366,'Villa de Álvarez',6,NULL,NULL,NULL),(367,'Acacoyagua',7,NULL,NULL,NULL),(368,'Acala',7,NULL,NULL,NULL),(369,'Acapetahua',7,NULL,NULL,NULL),(370,'Altamirano',7,NULL,NULL,NULL),(371,'Amatán',7,NULL,NULL,NULL),(372,'Amatenango de la Frontera',7,NULL,NULL,NULL),(373,'Amatenango del Valle',7,NULL,NULL,NULL),(374,'Angel Albino Corzo',7,NULL,NULL,NULL),(375,'Arriaga',7,NULL,NULL,NULL),(376,'Bejucal de Ocampo',7,NULL,NULL,NULL),(377,'Bella Vista',7,NULL,NULL,NULL),(378,'Berriozábal',7,NULL,NULL,NULL),(379,'Bochil',7,NULL,NULL,NULL),(380,'El Bosque',7,NULL,NULL,NULL),(381,'Cacahoatán',7,NULL,NULL,NULL),(382,'Catazajá',7,NULL,NULL,NULL),(383,'Cintalapa',7,NULL,NULL,NULL),(384,'Coapilla',7,NULL,NULL,NULL),(385,'Comitán de Domínguez',7,NULL,NULL,NULL),(386,'La Concordia',7,NULL,NULL,NULL),(387,'Copainalá',7,NULL,NULL,NULL),(388,'Chalchihuitán',7,NULL,NULL,NULL),(389,'Chamula',7,NULL,NULL,NULL),(390,'Chanal',7,NULL,NULL,NULL),(391,'Chapultenango',7,NULL,NULL,NULL),(392,'Chenalhó',7,NULL,NULL,NULL),(393,'Chiapa de Corzo',7,NULL,NULL,NULL),(394,'Chiapilla',7,NULL,NULL,NULL),(395,'Chicoasén',7,NULL,NULL,NULL),(396,'Chicomuselo',7,NULL,NULL,NULL),(397,'Chilón',7,NULL,NULL,NULL),(398,'Escuintla',7,NULL,NULL,NULL),(399,'Francisco León',7,NULL,NULL,NULL),(400,'Frontera Comalapa',7,NULL,NULL,NULL),(401,'Frontera Hidalgo',7,NULL,NULL,NULL),(402,'La Grandeza',7,NULL,NULL,NULL),(403,'Huehuetán',7,NULL,NULL,NULL),(404,'Huixtán',7,NULL,NULL,NULL),(405,'Huitiupán',7,NULL,NULL,NULL),(406,'Huixtla',7,NULL,NULL,NULL),(407,'La Independencia',7,NULL,NULL,NULL),(408,'Ixhuatán',7,NULL,NULL,NULL),(409,'Ixtacomitán',7,NULL,NULL,NULL),(410,'Ixtapa',7,NULL,NULL,NULL),(411,'Ixtapangajoya',7,NULL,NULL,NULL),(412,'Jiquipilas',7,NULL,NULL,NULL),(413,'Jitotol',7,NULL,NULL,NULL),(414,'Juárez',7,NULL,NULL,NULL),(415,'Larráinzar',7,NULL,NULL,NULL),(416,'La Libertad',7,NULL,NULL,NULL),(417,'Mapastepec',7,NULL,NULL,NULL),(418,'Las Margaritas',7,NULL,NULL,NULL),(419,'Mazapa de Madero',7,NULL,NULL,NULL),(420,'Mazatán',7,NULL,NULL,NULL),(421,'Metapa',7,NULL,NULL,NULL),(422,'Mitontic',7,NULL,NULL,NULL),(423,'Motozintla',7,NULL,NULL,NULL),(424,'Nicolás Ruíz',7,NULL,NULL,NULL),(425,'Ocosingo',7,NULL,NULL,NULL),(426,'Ocotepec',7,NULL,NULL,NULL),(427,'Ocozocoautla de Espinosa',7,NULL,NULL,NULL),(428,'Ostuacán',7,NULL,NULL,NULL),(429,'Osumacinta',7,NULL,NULL,NULL),(430,'Oxchuc',7,NULL,NULL,NULL),(431,'Palenque',7,NULL,NULL,NULL),(432,'Pantelhó',7,NULL,NULL,NULL),(433,'Pantepec',7,NULL,NULL,NULL),(434,'Pichucalco',7,NULL,NULL,NULL),(435,'Pijijiapan',7,NULL,NULL,NULL),(436,'El Porvenir',7,NULL,NULL,NULL),(437,'Villa Comaltitlán',7,NULL,NULL,NULL),(438,'Pueblo Nuevo Solistahuacán',7,NULL,NULL,NULL),(439,'Rayón',7,NULL,NULL,NULL),(440,'Reforma',7,NULL,NULL,NULL),(441,'Las Rosas',7,NULL,NULL,NULL),(442,'Sabanilla',7,NULL,NULL,NULL),(443,'Salto de Agua',7,NULL,NULL,NULL),(444,'San Cristóbal de las Casas',7,NULL,NULL,NULL),(445,'San Fernando',7,NULL,NULL,NULL),(446,'Siltepec',7,NULL,NULL,NULL),(447,'Simojovel',7,NULL,NULL,NULL),(448,'Sitalá',7,NULL,NULL,NULL),(449,'Socoltenango',7,NULL,NULL,NULL),(450,'Solosuchiapa',7,NULL,NULL,NULL),(451,'Soyaló',7,NULL,NULL,NULL),(452,'Suchiapa',7,NULL,NULL,NULL),(453,'Suchiate',7,NULL,NULL,NULL),(454,'Sunuapa',7,NULL,NULL,NULL),(455,'Tapachula',7,NULL,NULL,NULL),(456,'Tapalapa',7,NULL,NULL,NULL),(457,'Tapilula',7,NULL,NULL,NULL),(458,'Tecpatán',7,NULL,NULL,NULL),(459,'Tenejapa',7,NULL,NULL,NULL),(460,'Teopisca',7,NULL,NULL,NULL),(461,'Tila',7,NULL,NULL,NULL),(462,'Tonalá',7,NULL,NULL,NULL),(463,'Totolapa',7,NULL,NULL,NULL),(464,'La Trinitaria',7,NULL,NULL,NULL),(465,'Tumbalá',7,NULL,NULL,NULL),(466,'Tuxtla Gutiérrez',7,NULL,NULL,NULL),(467,'Tuxtla Chico',7,NULL,NULL,NULL),(468,'Tuzantán',7,NULL,NULL,NULL),(469,'Tzimol',7,NULL,NULL,NULL),(470,'Unión Juárez',7,NULL,NULL,NULL),(471,'Venustiano Carranza',7,NULL,NULL,NULL),(472,'Villa Corzo',7,NULL,NULL,NULL),(473,'Villaflores',7,NULL,NULL,NULL),(474,'Yajalón',7,NULL,NULL,NULL),(475,'San Lucas',7,NULL,NULL,NULL),(476,'Zinacantán',7,NULL,NULL,NULL),(477,'San Juan Cancuc',7,NULL,NULL,NULL),(478,'Aldama',7,NULL,NULL,NULL),(479,'Benemérito de las Américas',7,NULL,NULL,NULL),(480,'Maravilla Tenejapa',7,NULL,NULL,NULL),(481,'Marqués de Comillas',7,NULL,NULL,NULL),(482,'Montecristo de Guerrero',7,NULL,NULL,NULL),(483,'San Andrés Duraznal',7,NULL,NULL,NULL),(484,'Santiago el Pinar',7,NULL,NULL,NULL),(485,'Capitán Luis Ángel Vidal',7,NULL,NULL,NULL),(486,'Rincón Chamula San Pedro',7,NULL,NULL,NULL),(487,'El Parral',7,NULL,NULL,NULL),(488,'Emiliano Zapata',7,NULL,NULL,NULL),(489,'Mezcalapa',7,NULL,NULL,NULL),(490,'Ahumada',8,NULL,NULL,NULL),(491,'Aldama',8,NULL,NULL,NULL),(492,'Allende',8,NULL,NULL,NULL),(493,'Aquiles Serdán',8,NULL,NULL,NULL),(494,'Ascensión',8,NULL,NULL,NULL),(495,'Bachíniva',8,NULL,NULL,NULL),(496,'Balleza',8,NULL,NULL,NULL),(497,'Batopilas de Manuel Gómez Morín',8,NULL,NULL,NULL),(498,'Bocoyna',8,NULL,NULL,NULL),(499,'Buenaventura',8,NULL,NULL,NULL),(500,'Camargo',8,NULL,NULL,NULL),(501,'Carichí',8,NULL,NULL,NULL),(502,'Casas Grandes',8,NULL,NULL,NULL),(503,'Coronado',8,NULL,NULL,NULL),(504,'Coyame del Sotol',8,NULL,NULL,NULL),(505,'La Cruz',8,NULL,NULL,NULL),(506,'Cuauhtémoc',8,NULL,NULL,NULL),(507,'Cusihuiriachi',8,NULL,NULL,NULL),(508,'Chihuahua',8,NULL,NULL,NULL),(509,'Chínipas',8,NULL,NULL,NULL),(510,'Delicias',8,NULL,NULL,NULL),(511,'Dr. Belisario Domínguez',8,NULL,NULL,NULL),(512,'Galeana',8,NULL,NULL,NULL),(513,'Santa Isabel',8,NULL,NULL,NULL),(514,'Gómez Farías',8,NULL,NULL,NULL),(515,'Gran Morelos',8,NULL,NULL,NULL),(516,'Guachochi',8,NULL,NULL,NULL),(517,'Guadalupe',8,NULL,NULL,NULL),(518,'Guadalupe y Calvo',8,NULL,NULL,NULL),(519,'Guazapares',8,NULL,NULL,NULL),(520,'Guerrero',8,NULL,NULL,NULL),(521,'Hidalgo del Parral',8,NULL,NULL,NULL),(522,'Huejotitán',8,NULL,NULL,NULL),(523,'Ignacio Zaragoza',8,NULL,NULL,NULL),(524,'Janos',8,NULL,NULL,NULL),(525,'Jiménez',8,NULL,NULL,NULL),(526,'Juárez',8,NULL,NULL,NULL),(527,'Julimes',8,NULL,NULL,NULL),(528,'López',8,NULL,NULL,NULL),(529,'Madera',8,NULL,NULL,NULL),(530,'Maguarichi',8,NULL,NULL,NULL),(531,'Manuel Benavides',8,NULL,NULL,NULL),(532,'Matachí',8,NULL,NULL,NULL),(533,'Matamoros',8,NULL,NULL,NULL),(534,'Meoqui',8,NULL,NULL,NULL),(535,'Morelos',8,NULL,NULL,NULL),(536,'Moris',8,NULL,NULL,NULL),(537,'Namiquipa',8,NULL,NULL,NULL),(538,'Nonoava',8,NULL,NULL,NULL),(539,'Nuevo Casas Grandes',8,NULL,NULL,NULL),(540,'Ocampo',8,NULL,NULL,NULL),(541,'Ojinaga',8,NULL,NULL,NULL),(542,'Praxedis G. Guerrero',8,NULL,NULL,NULL),(543,'Riva Palacio',8,NULL,NULL,NULL),(544,'Rosales',8,NULL,NULL,NULL),(545,'Rosario',8,NULL,NULL,NULL),(546,'San Francisco de Borja',8,NULL,NULL,NULL),(547,'San Francisco de Conchos',8,NULL,NULL,NULL),(548,'San Francisco del Oro',8,NULL,NULL,NULL),(549,'Santa Bárbara',8,NULL,NULL,NULL),(550,'Satevó',8,NULL,NULL,NULL),(551,'Saucillo',8,NULL,NULL,NULL),(552,'Temósachic',8,NULL,NULL,NULL),(553,'El Tule',8,NULL,NULL,NULL),(554,'Urique',8,NULL,NULL,NULL),(555,'Uruachi',8,NULL,NULL,NULL),(556,'Valle de Zaragoza',8,NULL,NULL,NULL),(557,'Azcapotzalco',9,NULL,NULL,NULL),(558,'Coyoacán',9,NULL,NULL,NULL),(559,'Cuajimalpa de Morelos',9,NULL,NULL,NULL),(560,'Gustavo A. Madero',9,NULL,NULL,NULL),(561,'Iztacalco',9,NULL,NULL,NULL),(562,'Iztapalapa',9,NULL,NULL,NULL),(563,'La Magdalena Contreras',9,NULL,NULL,NULL),(564,'Milpa Alta',9,NULL,NULL,NULL),(565,'Álvaro Obregón',9,NULL,NULL,NULL),(566,'Tláhuac',9,NULL,NULL,NULL),(567,'Tlalpan',9,NULL,NULL,NULL),(568,'Xochimilco',9,NULL,NULL,NULL),(569,'Benito Juárez',9,NULL,NULL,NULL),(570,'Cuauhtémoc',9,NULL,NULL,NULL),(571,'Miguel Hidalgo',9,NULL,NULL,NULL),(572,'Venustiano Carranza',9,NULL,NULL,NULL),(573,'Canatlán',10,NULL,NULL,NULL),(574,'Canelas',10,NULL,NULL,NULL),(575,'Coneto de Comonfort',10,NULL,NULL,NULL),(576,'Cuencamé',10,NULL,NULL,NULL),(577,'Durango',10,NULL,NULL,NULL),(578,'General Simón Bolívar',10,NULL,NULL,NULL),(579,'Gómez Palacio',10,NULL,NULL,NULL),(580,'Guadalupe Victoria',10,NULL,NULL,NULL),(581,'Guanaceví',10,NULL,NULL,NULL),(582,'Hidalgo',10,NULL,NULL,NULL),(583,'Indé',10,NULL,NULL,NULL),(584,'Lerdo',10,NULL,NULL,NULL),(585,'Mapimí',10,NULL,NULL,NULL),(586,'Mezquital',10,NULL,NULL,NULL),(587,'Nazas',10,NULL,NULL,NULL),(588,'Nombre de Dios',10,NULL,NULL,NULL),(589,'Ocampo',10,NULL,NULL,NULL),(590,'El Oro',10,NULL,NULL,NULL),(591,'Otáez',10,NULL,NULL,NULL),(592,'Pánuco de Coronado',10,NULL,NULL,NULL),(593,'Peñón Blanco',10,NULL,NULL,NULL),(594,'Poanas',10,NULL,NULL,NULL),(595,'Pueblo Nuevo',10,NULL,NULL,NULL),(596,'Rodeo',10,NULL,NULL,NULL),(597,'San Bernardo',10,NULL,NULL,NULL),(598,'San Dimas',10,NULL,NULL,NULL),(599,'San Juan de Guadalupe',10,NULL,NULL,NULL),(600,'San Juan del Río',10,NULL,NULL,NULL),(601,'San Luis del Cordero',10,NULL,NULL,NULL),(602,'San Pedro del Gallo',10,NULL,NULL,NULL),(603,'Santa Clara',10,NULL,NULL,NULL),(604,'Santiago Papasquiaro',10,NULL,NULL,NULL),(605,'Súchil',10,NULL,NULL,NULL),(606,'Tamazula',10,NULL,NULL,NULL),(607,'Tepehuanes',10,NULL,NULL,NULL),(608,'Tlahualilo',10,NULL,NULL,NULL),(609,'Topia',10,NULL,NULL,NULL),(610,'Vicente Guerrero',10,NULL,NULL,NULL),(611,'Nuevo Ideal',10,NULL,NULL,NULL),(612,'Abasolo',11,NULL,NULL,NULL),(613,'Acámbaro',11,NULL,NULL,NULL),(614,'San Miguel de Allende',11,NULL,NULL,NULL),(615,'Apaseo el Alto',11,NULL,NULL,NULL),(616,'Apaseo el Grande',11,NULL,NULL,NULL),(617,'Atarjea',11,NULL,NULL,NULL),(618,'Celaya',11,NULL,NULL,NULL),(619,'Manuel Doblado',11,NULL,NULL,NULL),(620,'Comonfort',11,NULL,NULL,NULL),(621,'Coroneo',11,NULL,NULL,NULL),(622,'Cortazar',11,NULL,NULL,NULL),(623,'Cuerámaro',11,NULL,NULL,NULL),(624,'Doctor Mora',11,NULL,NULL,NULL),(625,'Dolores Hidalgo Cuna de la Independencia Nacional',11,NULL,NULL,NULL),(626,'Guanajuato',11,NULL,NULL,NULL),(627,'Huanímaro',11,NULL,NULL,NULL),(628,'Irapuato',11,NULL,NULL,NULL),(629,'Jaral del Progreso',11,NULL,NULL,NULL),(630,'Jerécuaro',11,NULL,NULL,NULL),(631,'León',11,NULL,NULL,NULL),(632,'Moroleón',11,NULL,NULL,NULL),(633,'Ocampo',11,NULL,NULL,NULL),(634,'Pénjamo',11,NULL,NULL,NULL),(635,'Pueblo Nuevo',11,NULL,NULL,NULL),(636,'Purísima del Rincón',11,NULL,NULL,NULL),(637,'Romita',11,NULL,NULL,NULL),(638,'Salamanca',11,NULL,NULL,NULL),(639,'Salvatierra',11,NULL,NULL,NULL),(640,'San Diego de la Unión',11,NULL,NULL,NULL),(641,'San Felipe',11,NULL,NULL,NULL),(642,'San Francisco del Rincón',11,NULL,NULL,NULL),(643,'San José Iturbide',11,NULL,NULL,NULL),(644,'San Luis de la Paz',11,NULL,NULL,NULL),(645,'Santa Catarina',11,NULL,NULL,NULL),(646,'Santa Cruz de Juventino Rosas',11,NULL,NULL,NULL),(647,'Santiago Maravatío',11,NULL,NULL,NULL),(648,'Silao de la Victoria',11,NULL,NULL,NULL),(649,'Tarandacuao',11,NULL,NULL,NULL),(650,'Tarimoro',11,NULL,NULL,NULL),(651,'Tierra Blanca',11,NULL,NULL,NULL),(652,'Uriangato',11,NULL,NULL,NULL),(653,'Valle de Santiago',11,NULL,NULL,NULL),(654,'Victoria',11,NULL,NULL,NULL),(655,'Villagrán',11,NULL,NULL,NULL),(656,'Xichú',11,NULL,NULL,NULL),(657,'Yuriria',11,NULL,NULL,NULL),(658,'Acapulco de Juárez',12,NULL,NULL,NULL),(659,'Ahuacuotzingo',12,NULL,NULL,NULL),(660,'Ajuchitlán del Progreso',12,NULL,NULL,NULL),(661,'Alcozauca de Guerrero',12,NULL,NULL,NULL),(662,'Alpoyeca',12,NULL,NULL,NULL),(663,'Apaxtla',12,NULL,NULL,NULL),(664,'Arcelia',12,NULL,NULL,NULL),(665,'Atenango del Río',12,NULL,NULL,NULL),(666,'Atlamajalcingo del Monte',12,NULL,NULL,NULL),(667,'Atlixtac',12,NULL,NULL,NULL),(668,'Atoyac de Álvarez',12,NULL,NULL,NULL),(669,'Ayutla de los Libres',12,NULL,NULL,NULL),(670,'Azoyú',12,NULL,NULL,NULL),(671,'Benito Juárez',12,NULL,NULL,NULL),(672,'Buenavista de Cuéllar',12,NULL,NULL,NULL),(673,'Coahuayutla de José María Izazaga',12,NULL,NULL,NULL),(674,'Cocula',12,NULL,NULL,NULL),(675,'Copala',12,NULL,NULL,NULL),(676,'Copalillo',12,NULL,NULL,NULL),(677,'Copanatoyac',12,NULL,NULL,NULL),(678,'Coyuca de Benítez',12,NULL,NULL,NULL),(679,'Coyuca de Catalán',12,NULL,NULL,NULL),(680,'Cuajinicuilapa',12,NULL,NULL,NULL),(681,'Cualác',12,NULL,NULL,NULL),(682,'Cuautepec',12,NULL,NULL,NULL),(683,'Cuetzala del Progreso',12,NULL,NULL,NULL),(684,'Cutzamala de Pinzón',12,NULL,NULL,NULL),(685,'Chilapa de Álvarez',12,NULL,NULL,NULL),(686,'Chilpancingo de los Bravo',12,NULL,NULL,NULL),(687,'Florencio Villarreal',12,NULL,NULL,NULL),(688,'General Canuto A. Neri',12,NULL,NULL,NULL),(689,'General Heliodoro Castillo',12,NULL,NULL,NULL),(690,'Huamuxtitlán',12,NULL,NULL,NULL),(691,'Huitzuco de los Figueroa',12,NULL,NULL,NULL),(692,'Iguala de la Independencia',12,NULL,NULL,NULL),(693,'Igualapa',12,NULL,NULL,NULL),(694,'Ixcateopan de Cuauhtémoc',12,NULL,NULL,NULL),(695,'Zihuatanejo de Azueta',12,NULL,NULL,NULL),(696,'Juan R. Escudero',12,NULL,NULL,NULL),(697,'Leonardo Bravo',12,NULL,NULL,NULL),(698,'Malinaltepec',12,NULL,NULL,NULL),(699,'Mártir de Cuilapan',12,NULL,NULL,NULL),(700,'Metlatónoc',12,NULL,NULL,NULL),(701,'Mochitlán',12,NULL,NULL,NULL),(702,'Olinalá',12,NULL,NULL,NULL),(703,'Ometepec',12,NULL,NULL,NULL),(704,'Pedro Ascencio Alquisiras',12,NULL,NULL,NULL),(705,'Petatlán',12,NULL,NULL,NULL),(706,'Pilcaya',12,NULL,NULL,NULL),(707,'Pungarabato',12,NULL,NULL,NULL),(708,'Quechultenango',12,NULL,NULL,NULL),(709,'San Luis Acatlán',12,NULL,NULL,NULL),(710,'San Marcos',12,NULL,NULL,NULL),(711,'San Miguel Totolapan',12,NULL,NULL,NULL),(712,'Taxco de Alarcón',12,NULL,NULL,NULL),(713,'Tecoanapa',12,NULL,NULL,NULL),(714,'Técpan de Galeana',12,NULL,NULL,NULL),(715,'Teloloapan',12,NULL,NULL,NULL),(716,'Tepecoacuilco de Trujano',12,NULL,NULL,NULL),(717,'Tetipac',12,NULL,NULL,NULL),(718,'Tixtla de Guerrero',12,NULL,NULL,NULL),(719,'Tlacoachistlahuaca',12,NULL,NULL,NULL),(720,'Tlacoapa',12,NULL,NULL,NULL),(721,'Tlalchapa',12,NULL,NULL,NULL),(722,'Tlalixtaquilla de Maldonado',12,NULL,NULL,NULL),(723,'Tlapa de Comonfort',12,NULL,NULL,NULL),(724,'Tlapehuala',12,NULL,NULL,NULL),(725,'La Unión de Isidoro Montes de Oca',12,NULL,NULL,NULL),(726,'Xalpatláhuac',12,NULL,NULL,NULL),(727,'Xochihuehuetlán',12,NULL,NULL,NULL),(728,'Xochistlahuaca',12,NULL,NULL,NULL),(729,'Zapotitlán Tablas',12,NULL,NULL,NULL),(730,'Zirándaro',12,NULL,NULL,NULL),(731,'Zitlala',12,NULL,NULL,NULL),(732,'Eduardo Neri',12,NULL,NULL,NULL),(733,'Acatepec',12,NULL,NULL,NULL),(734,'Marquelia',12,NULL,NULL,NULL),(735,'Cochoapa el Grande',12,NULL,NULL,NULL),(736,'José Joaquín de Herrera',12,NULL,NULL,NULL),(737,'Juchitán',12,NULL,NULL,NULL),(738,'Iliatenco',12,NULL,NULL,NULL),(739,'Acatlán',13,NULL,NULL,NULL),(740,'Acaxochitlán',13,NULL,NULL,NULL),(741,'Actopan',13,NULL,NULL,NULL),(742,'Agua Blanca de Iturbide',13,NULL,NULL,NULL),(743,'Ajacuba',13,NULL,NULL,NULL),(744,'Alfajayucan',13,NULL,NULL,NULL),(745,'Almoloya',13,NULL,NULL,NULL),(746,'Apan',13,NULL,NULL,NULL),(747,'El Arenal',13,NULL,NULL,NULL),(748,'Atitalaquia',13,NULL,NULL,NULL),(749,'Atlapexco',13,NULL,NULL,NULL),(750,'Atotonilco el Grande',13,NULL,NULL,NULL),(751,'Atotonilco de Tula',13,NULL,NULL,NULL),(752,'Calnali',13,NULL,NULL,NULL),(753,'Cardonal',13,NULL,NULL,NULL),(754,'Cuautepec de Hinojosa',13,NULL,NULL,NULL),(755,'Chapantongo',13,NULL,NULL,NULL),(756,'Chapulhuacán',13,NULL,NULL,NULL),(757,'Chilcuautla',13,NULL,NULL,NULL),(758,'Eloxochitlán',13,NULL,NULL,NULL),(759,'Emiliano Zapata',13,NULL,NULL,NULL),(760,'Epazoyucan',13,NULL,NULL,NULL),(761,'Francisco I. Madero',13,NULL,NULL,NULL),(762,'Huasca de Ocampo',13,NULL,NULL,NULL),(763,'Huautla',13,NULL,NULL,NULL),(764,'Huazalingo',13,NULL,NULL,NULL),(765,'Huehuetla',13,NULL,NULL,NULL),(766,'Huejutla de Reyes',13,NULL,NULL,NULL),(767,'Huichapan',13,NULL,NULL,NULL),(768,'Ixmiquilpan',13,NULL,NULL,NULL),(769,'Jacala de Ledezma',13,NULL,NULL,NULL),(770,'Jaltocán',13,NULL,NULL,NULL),(771,'Juárez Hidalgo',13,NULL,NULL,NULL),(772,'Lolotla',13,NULL,NULL,NULL),(773,'Metepec',13,NULL,NULL,NULL),(774,'San Agustín Metzquititlán',13,NULL,NULL,NULL),(775,'Metztitlán',13,NULL,NULL,NULL),(776,'Mineral del Chico',13,NULL,NULL,NULL),(777,'Mineral del Monte',13,NULL,NULL,NULL),(778,'La Misión',13,NULL,NULL,NULL),(779,'Mixquiahuala de Juárez',13,NULL,NULL,NULL),(780,'Molango de Escamilla',13,NULL,NULL,NULL),(781,'Nicolás Flores',13,NULL,NULL,NULL),(782,'Nopala de Villagrán',13,NULL,NULL,NULL),(783,'Omitlán de Juárez',13,NULL,NULL,NULL),(784,'San Felipe Orizatlán',13,NULL,NULL,NULL),(785,'Pacula',13,NULL,NULL,NULL),(786,'Pachuca de Soto',13,NULL,NULL,NULL),(787,'Pisaflores',13,NULL,NULL,NULL),(788,'Progreso de Obregón',13,NULL,NULL,NULL),(789,'Mineral de la Reforma',13,NULL,NULL,NULL),(790,'San Agustín Tlaxiaca',13,NULL,NULL,NULL),(791,'San Bartolo Tutotepec',13,NULL,NULL,NULL),(792,'San Salvador',13,NULL,NULL,NULL),(793,'Santiago de Anaya',13,NULL,NULL,NULL),(794,'Santiago Tulantepec de Lugo Guerrero',13,NULL,NULL,NULL),(795,'Singuilucan',13,NULL,NULL,NULL),(796,'Tasquillo',13,NULL,NULL,NULL),(797,'Tecozautla',13,NULL,NULL,NULL),(798,'Tenango de Doria',13,NULL,NULL,NULL),(799,'Tepeapulco',13,NULL,NULL,NULL),(800,'Tepehuacán de Guerrero',13,NULL,NULL,NULL),(801,'Tepeji del Río de Ocampo',13,NULL,NULL,NULL),(802,'Tepetitlán',13,NULL,NULL,NULL),(803,'Tetepango',13,NULL,NULL,NULL),(804,'Villa de Tezontepec',13,NULL,NULL,NULL),(805,'Tezontepec de Aldama',13,NULL,NULL,NULL),(806,'Tianguistengo',13,NULL,NULL,NULL),(807,'Tizayuca',13,NULL,NULL,NULL),(808,'Tlahuelilpan',13,NULL,NULL,NULL),(809,'Tlahuiltepa',13,NULL,NULL,NULL),(810,'Tlanalapa',13,NULL,NULL,NULL),(811,'Tlanchinol',13,NULL,NULL,NULL),(812,'Tlaxcoapan',13,NULL,NULL,NULL),(813,'Tolcayuca',13,NULL,NULL,NULL),(814,'Tula de Allende',13,NULL,NULL,NULL),(815,'Tulancingo de Bravo',13,NULL,NULL,NULL),(816,'Xochiatipan',13,NULL,NULL,NULL),(817,'Xochicoatlán',13,NULL,NULL,NULL),(818,'Yahualica',13,NULL,NULL,NULL),(819,'Zacualtipán de Ángeles',13,NULL,NULL,NULL),(820,'Zapotlán de Juárez',13,NULL,NULL,NULL),(821,'Zempoala',13,NULL,NULL,NULL),(822,'Zimapán',13,NULL,NULL,NULL),(823,'Acatic',14,NULL,NULL,NULL),(824,'Acatlán de Juárez',14,NULL,NULL,NULL),(825,'Ahualulco de Mercado',14,NULL,NULL,NULL),(826,'Amacueca',14,NULL,NULL,NULL),(827,'Amatitán',14,NULL,NULL,NULL),(828,'Ameca',14,NULL,NULL,NULL),(829,'San Juanito de Escobedo',14,NULL,NULL,NULL),(830,'Arandas',14,NULL,NULL,NULL),(831,'El Arenal',14,NULL,NULL,NULL),(832,'Atemajac de Brizuela',14,NULL,NULL,NULL),(833,'Atengo',14,NULL,NULL,NULL),(834,'Atenguillo',14,NULL,NULL,NULL),(835,'Atotonilco el Alto',14,NULL,NULL,NULL),(836,'Atoyac',14,NULL,NULL,NULL),(837,'Autlán de Navarro',14,NULL,NULL,NULL),(838,'Ayotlán',14,NULL,NULL,NULL),(839,'Ayutla',14,NULL,NULL,NULL),(840,'La Barca',14,NULL,NULL,NULL),(841,'Bolaños',14,NULL,NULL,NULL),(842,'Cabo Corrientes',14,NULL,NULL,NULL),(843,'Casimiro Castillo',14,NULL,NULL,NULL),(844,'Cihuatlán',14,NULL,NULL,NULL),(845,'Zapotlán el Grande',14,NULL,NULL,NULL),(846,'Cocula',14,NULL,NULL,NULL),(847,'Colotlán',14,NULL,NULL,NULL),(848,'Concepción de Buenos Aires',14,NULL,NULL,NULL),(849,'Cuautitlán de García Barragán',14,NULL,NULL,NULL),(850,'Cuautla',14,NULL,NULL,NULL),(851,'Cuquío',14,NULL,NULL,NULL),(852,'Chapala',14,NULL,NULL,NULL),(853,'Chimaltitán',14,NULL,NULL,NULL),(854,'Chiquilistlán',14,NULL,NULL,NULL),(855,'Degollado',14,NULL,NULL,NULL),(856,'Ejutla',14,NULL,NULL,NULL),(857,'Encarnación de Díaz',14,NULL,NULL,NULL),(858,'Etzatlán',14,NULL,NULL,NULL),(859,'El Grullo',14,NULL,NULL,NULL),(860,'Guachinango',14,NULL,NULL,NULL),(861,'Guadalajara',14,NULL,NULL,NULL),(862,'Hostotipaquillo',14,NULL,NULL,NULL),(863,'Huejúcar',14,NULL,NULL,NULL),(864,'Huejuquilla el Alto',14,NULL,NULL,NULL),(865,'La Huerta',14,NULL,NULL,NULL),(866,'Ixtlahuacán de los Membrillos',14,NULL,NULL,NULL),(867,'Ixtlahuacán del Río',14,NULL,NULL,NULL),(868,'Jalostotitlán',14,NULL,NULL,NULL),(869,'Jamay',14,NULL,NULL,NULL),(870,'Jesús María',14,NULL,NULL,NULL),(871,'Jilotlán de los Dolores',14,NULL,NULL,NULL),(872,'Jocotepec',14,NULL,NULL,NULL),(873,'Juanacatlán',14,NULL,NULL,NULL),(874,'Juchitlán',14,NULL,NULL,NULL),(875,'Lagos de Moreno',14,NULL,NULL,NULL),(876,'El Limón',14,NULL,NULL,NULL),(877,'Magdalena',14,NULL,NULL,NULL),(878,'Santa María del Oro',14,NULL,NULL,NULL),(879,'La Manzanilla de la Paz',14,NULL,NULL,NULL),(880,'Mascota',14,NULL,NULL,NULL),(881,'Mazamitla',14,NULL,NULL,NULL),(882,'Mexticacán',14,NULL,NULL,NULL),(883,'Mezquitic',14,NULL,NULL,NULL),(884,'Mixtlán',14,NULL,NULL,NULL),(885,'Ocotlán',14,NULL,NULL,NULL),(886,'Ojuelos de Jalisco',14,NULL,NULL,NULL),(887,'Pihuamo',14,NULL,NULL,NULL),(888,'Poncitlán',14,NULL,NULL,NULL),(889,'Puerto Vallarta',14,NULL,NULL,NULL),(890,'Villa Purificación',14,NULL,NULL,NULL),(891,'Quitupan',14,NULL,NULL,NULL),(892,'El Salto',14,NULL,NULL,NULL),(893,'San Cristóbal de la Barranca',14,NULL,NULL,NULL),(894,'San Diego de Alejandría',14,NULL,NULL,NULL),(895,'San Juan de los Lagos',14,NULL,NULL,NULL),(896,'San Julián',14,NULL,NULL,NULL),(897,'San Marcos',14,NULL,NULL,NULL),(898,'San Martín de Bolaños',14,NULL,NULL,NULL),(899,'San Martín Hidalgo',14,NULL,NULL,NULL),(900,'San Miguel el Alto',14,NULL,NULL,NULL),(901,'Gómez Farías',14,NULL,NULL,NULL),(902,'San Sebastián del Oeste',14,NULL,NULL,NULL),(903,'Santa María de los Ángeles',14,NULL,NULL,NULL),(904,'Sayula',14,NULL,NULL,NULL),(905,'Tala',14,NULL,NULL,NULL),(906,'Talpa de Allende',14,NULL,NULL,NULL),(907,'Tamazula de Gordiano',14,NULL,NULL,NULL),(908,'Tapalpa',14,NULL,NULL,NULL),(909,'Tecalitlán',14,NULL,NULL,NULL),(910,'Tecolotlán',14,NULL,NULL,NULL),(911,'Techaluta de Montenegro',14,NULL,NULL,NULL),(912,'Tenamaxtlán',14,NULL,NULL,NULL),(913,'Teocaltiche',14,NULL,NULL,NULL),(914,'Teocuitatlán de Corona',14,NULL,NULL,NULL),(915,'Tepatitlán de Morelos',14,NULL,NULL,NULL),(916,'Tequila',14,NULL,NULL,NULL),(917,'Teuchitlán',14,NULL,NULL,NULL),(918,'Tizapán el Alto',14,NULL,NULL,NULL),(919,'Tlajomulco de Zúñiga',14,NULL,NULL,NULL),(920,'San Pedro Tlaquepaque',14,NULL,NULL,NULL),(921,'Tolimán',14,NULL,NULL,NULL),(922,'Tomatlán',14,NULL,NULL,NULL),(923,'Tonalá',14,NULL,NULL,NULL),(924,'Tonaya',14,NULL,NULL,NULL),(925,'Tonila',14,NULL,NULL,NULL),(926,'Totatiche',14,NULL,NULL,NULL),(927,'Tototlán',14,NULL,NULL,NULL),(928,'Tuxcacuesco',14,NULL,NULL,NULL),(929,'Tuxcueca',14,NULL,NULL,NULL),(930,'Tuxpan',14,NULL,NULL,NULL),(931,'Unión de San Antonio',14,NULL,NULL,NULL),(932,'Unión de Tula',14,NULL,NULL,NULL),(933,'Valle de Guadalupe',14,NULL,NULL,NULL),(934,'Valle de Juárez',14,NULL,NULL,NULL),(935,'San Gabriel',14,NULL,NULL,NULL),(936,'Villa Corona',14,NULL,NULL,NULL),(937,'Villa Guerrero',14,NULL,NULL,NULL),(938,'Villa Hidalgo',14,NULL,NULL,NULL),(939,'Cañadas de Obregón',14,NULL,NULL,NULL),(940,'Yahualica de González Gallo',14,NULL,NULL,NULL),(941,'Zacoalco de Torres',14,NULL,NULL,NULL),(942,'Zapopan',14,NULL,NULL,NULL),(943,'Zapotiltic',14,NULL,NULL,NULL),(944,'Zapotitlán de Vadillo',14,NULL,NULL,NULL),(945,'Zapotlán del Rey',14,NULL,NULL,NULL),(946,'Zapotlanejo',14,NULL,NULL,NULL),(947,'San Ignacio Cerro Gordo',14,NULL,NULL,NULL),(948,'Acambay de Ruíz Castañeda',15,NULL,NULL,NULL),(949,'Acolman',15,NULL,NULL,NULL),(950,'Aculco',15,NULL,NULL,NULL),(951,'Almoloya de Alquisiras',15,NULL,NULL,NULL),(952,'Almoloya de Juárez',15,NULL,NULL,NULL),(953,'Almoloya del Río',15,NULL,NULL,NULL),(954,'Amanalco',15,NULL,NULL,NULL),(955,'Amatepec',15,NULL,NULL,NULL),(956,'Amecameca',15,NULL,NULL,NULL),(957,'Apaxco',15,NULL,NULL,NULL),(958,'Atenco',15,NULL,NULL,NULL),(959,'Atizapán',15,NULL,NULL,NULL),(960,'Atizapán de Zaragoza',15,NULL,NULL,NULL),(961,'Atlacomulco',15,NULL,NULL,NULL),(962,'Atlautla',15,NULL,NULL,NULL),(963,'Axapusco',15,NULL,NULL,NULL),(964,'Ayapango',15,NULL,NULL,NULL),(965,'Calimaya',15,NULL,NULL,NULL),(966,'Capulhuac',15,NULL,NULL,NULL),(967,'Coacalco de Berriozábal',15,NULL,NULL,NULL),(968,'Coatepec Harinas',15,NULL,NULL,NULL),(969,'Cocotitlán',15,NULL,NULL,NULL),(970,'Coyotepec',15,NULL,NULL,NULL),(971,'Cuautitlán',15,NULL,NULL,NULL),(972,'Chalco',15,NULL,NULL,NULL),(973,'Chapa de Mota',15,NULL,NULL,NULL),(974,'Chapultepec',15,NULL,NULL,NULL),(975,'Chiautla',15,NULL,NULL,NULL),(976,'Chicoloapan',15,NULL,NULL,NULL),(977,'Chiconcuac',15,NULL,NULL,NULL),(978,'Chimalhuacán',15,NULL,NULL,NULL),(979,'Donato Guerra',15,NULL,NULL,NULL),(980,'Ecatepec de Morelos',15,NULL,NULL,NULL),(981,'Ecatzingo',15,NULL,NULL,NULL),(982,'Huehuetoca',15,NULL,NULL,NULL),(983,'Hueypoxtla',15,NULL,NULL,NULL),(984,'Huixquilucan',15,NULL,NULL,NULL),(985,'Isidro Fabela',15,NULL,NULL,NULL),(986,'Ixtapaluca',15,NULL,NULL,NULL),(987,'Ixtapan de la Sal',15,NULL,NULL,NULL),(988,'Ixtapan del Oro',15,NULL,NULL,NULL),(989,'Ixtlahuaca',15,NULL,NULL,NULL),(990,'Xalatlaco',15,NULL,NULL,NULL),(991,'Jaltenco',15,NULL,NULL,NULL),(992,'Jilotepec',15,NULL,NULL,NULL),(993,'Jilotzingo',15,NULL,NULL,NULL),(994,'Jiquipilco',15,NULL,NULL,NULL),(995,'Jocotitlán',15,NULL,NULL,NULL),(996,'Joquicingo',15,NULL,NULL,NULL),(997,'Juchitepec',15,NULL,NULL,NULL),(998,'Lerma',15,NULL,NULL,NULL),(999,'Malinalco',15,NULL,NULL,NULL),(1000,'Melchor Ocampo',15,NULL,NULL,NULL),(1001,'Metepec',15,NULL,NULL,NULL),(1002,'Mexicaltzingo',15,NULL,NULL,NULL),(1003,'Morelos',15,NULL,NULL,NULL),(1004,'Naucalpan de Juárez',15,NULL,NULL,NULL),(1005,'Nezahualcóyotl',15,NULL,NULL,NULL),(1006,'Nextlalpan',15,NULL,NULL,NULL),(1007,'Nicolás Romero',15,NULL,NULL,NULL),(1008,'Nopaltepec',15,NULL,NULL,NULL),(1009,'Ocoyoacac',15,NULL,NULL,NULL),(1010,'Ocuilan',15,NULL,NULL,NULL),(1011,'El Oro',15,NULL,NULL,NULL),(1012,'Otumba',15,NULL,NULL,NULL),(1013,'Otzoloapan',15,NULL,NULL,NULL),(1014,'Otzolotepec',15,NULL,NULL,NULL),(1015,'Ozumba',15,NULL,NULL,NULL),(1016,'Papalotla',15,NULL,NULL,NULL),(1017,'La Paz',15,NULL,NULL,NULL),(1018,'Polotitlán',15,NULL,NULL,NULL),(1019,'Rayón',15,NULL,NULL,NULL),(1020,'San Antonio la Isla',15,NULL,NULL,NULL),(1021,'San Felipe del Progreso',15,NULL,NULL,NULL),(1022,'San Martín de las Pirámides',15,NULL,NULL,NULL),(1023,'San Mateo Atenco',15,NULL,NULL,NULL),(1024,'San Simón de Guerrero',15,NULL,NULL,NULL),(1025,'Santo Tomás',15,NULL,NULL,NULL),(1026,'Soyaniquilpan de Juárez',15,NULL,NULL,NULL),(1027,'Sultepec',15,NULL,NULL,NULL),(1028,'Tecámac',15,NULL,NULL,NULL),(1029,'Tejupilco',15,NULL,NULL,NULL),(1030,'Temamatla',15,NULL,NULL,NULL),(1031,'Temascalapa',15,NULL,NULL,NULL),(1032,'Temascalcingo',15,NULL,NULL,NULL),(1033,'Temascaltepec',15,NULL,NULL,NULL),(1034,'Temoaya',15,NULL,NULL,NULL),(1035,'Tenancingo',15,NULL,NULL,NULL),(1036,'Tenango del Aire',15,NULL,NULL,NULL),(1037,'Tenango del Valle',15,NULL,NULL,NULL),(1038,'Teoloyucan',15,NULL,NULL,NULL),(1039,'Teotihuacán',15,NULL,NULL,NULL),(1040,'Tepetlaoxtoc',15,NULL,NULL,NULL),(1041,'Tepetlixpa',15,NULL,NULL,NULL),(1042,'Tepotzotlán',15,NULL,NULL,NULL),(1043,'Tequixquiac',15,NULL,NULL,NULL),(1044,'Texcaltitlán',15,NULL,NULL,NULL),(1045,'Texcalyacac',15,NULL,NULL,NULL),(1046,'Texcoco',15,NULL,NULL,NULL),(1047,'Tezoyuca',15,NULL,NULL,NULL),(1048,'Tianguistenco',15,NULL,NULL,NULL),(1049,'Timilpan',15,NULL,NULL,NULL),(1050,'Tlalmanalco',15,NULL,NULL,NULL),(1051,'Tlalnepantla de Baz',15,NULL,NULL,NULL),(1052,'Tlatlaya',15,NULL,NULL,NULL),(1053,'Toluca',15,NULL,NULL,NULL),(1054,'Tonatico',15,NULL,NULL,NULL),(1055,'Tultepec',15,NULL,NULL,NULL),(1056,'Tultitlán',15,NULL,NULL,NULL),(1057,'Valle de Bravo',15,NULL,NULL,NULL),(1058,'Villa de Allende',15,NULL,NULL,NULL),(1059,'Villa del Carbón',15,NULL,NULL,NULL),(1060,'Villa Guerrero',15,NULL,NULL,NULL),(1061,'Villa Victoria',15,NULL,NULL,NULL),(1062,'Xonacatlán',15,NULL,NULL,NULL),(1063,'Zacazonapan',15,NULL,NULL,NULL),(1064,'Zacualpan',15,NULL,NULL,NULL),(1065,'Zinacantepec',15,NULL,NULL,NULL),(1066,'Zumpahuacán',15,NULL,NULL,NULL),(1067,'Zumpango',15,NULL,NULL,NULL),(1068,'Cuautitlán Izcalli',15,NULL,NULL,NULL),(1069,'Valle de Chalco Solidaridad',15,NULL,NULL,NULL),(1070,'Luvianos',15,NULL,NULL,NULL),(1071,'San José del Rincón',15,NULL,NULL,NULL),(1072,'Tonanitla',15,NULL,NULL,NULL),(1073,'Acuitzio',16,NULL,NULL,NULL),(1074,'Aguililla',16,NULL,NULL,NULL),(1075,'Álvaro Obregón',16,NULL,NULL,NULL),(1076,'Angamacutiro',16,NULL,NULL,NULL),(1077,'Angangueo',16,NULL,NULL,NULL),(1078,'Apatzingán',16,NULL,NULL,NULL),(1079,'Aporo',16,NULL,NULL,NULL),(1080,'Aquila',16,NULL,NULL,NULL),(1081,'Ario',16,NULL,NULL,NULL),(1082,'Arteaga',16,NULL,NULL,NULL),(1083,'Briseñas',16,NULL,NULL,NULL),(1084,'Buenavista',16,NULL,NULL,NULL),(1085,'Carácuaro',16,NULL,NULL,NULL),(1086,'Coahuayana',16,NULL,NULL,NULL),(1087,'Coalcomán de Vázquez Pallares',16,NULL,NULL,NULL),(1088,'Coeneo',16,NULL,NULL,NULL),(1089,'Contepec',16,NULL,NULL,NULL),(1090,'Copándaro',16,NULL,NULL,NULL),(1091,'Cotija',16,NULL,NULL,NULL),(1092,'Cuitzeo',16,NULL,NULL,NULL),(1093,'Charapan',16,NULL,NULL,NULL),(1094,'Charo',16,NULL,NULL,NULL),(1095,'Chavinda',16,NULL,NULL,NULL),(1096,'Cherán',16,NULL,NULL,NULL),(1097,'Chilchota',16,NULL,NULL,NULL),(1098,'Chinicuila',16,NULL,NULL,NULL),(1099,'Chucándiro',16,NULL,NULL,NULL),(1100,'Churintzio',16,NULL,NULL,NULL),(1101,'Churumuco',16,NULL,NULL,NULL),(1102,'Ecuandureo',16,NULL,NULL,NULL),(1103,'Epitacio Huerta',16,NULL,NULL,NULL),(1104,'Erongarícuaro',16,NULL,NULL,NULL),(1105,'Gabriel Zamora',16,NULL,NULL,NULL),(1106,'Hidalgo',16,NULL,NULL,NULL),(1107,'La Huacana',16,NULL,NULL,NULL),(1108,'Huandacareo',16,NULL,NULL,NULL),(1109,'Huaniqueo',16,NULL,NULL,NULL),(1110,'Huetamo',16,NULL,NULL,NULL),(1111,'Huiramba',16,NULL,NULL,NULL),(1112,'Indaparapeo',16,NULL,NULL,NULL),(1113,'Irimbo',16,NULL,NULL,NULL),(1114,'Ixtlán',16,NULL,NULL,NULL),(1115,'Jacona',16,NULL,NULL,NULL),(1116,'Jiménez',16,NULL,NULL,NULL),(1117,'Jiquilpan',16,NULL,NULL,NULL),(1118,'Juárez',16,NULL,NULL,NULL),(1119,'Jungapeo',16,NULL,NULL,NULL),(1120,'Lagunillas',16,NULL,NULL,NULL),(1121,'Madero',16,NULL,NULL,NULL),(1122,'Maravatío',16,NULL,NULL,NULL),(1123,'Marcos Castellanos',16,NULL,NULL,NULL),(1124,'Lázaro Cárdenas',16,NULL,NULL,NULL),(1125,'Morelia',16,NULL,NULL,NULL),(1126,'Morelos',16,NULL,NULL,NULL),(1127,'Múgica',16,NULL,NULL,NULL),(1128,'Nahuatzen',16,NULL,NULL,NULL),(1129,'Nocupétaro',16,NULL,NULL,NULL),(1130,'Nuevo Parangaricutiro',16,NULL,NULL,NULL),(1131,'Nuevo Urecho',16,NULL,NULL,NULL),(1132,'Numarán',16,NULL,NULL,NULL),(1133,'Ocampo',16,NULL,NULL,NULL),(1134,'Pajacuarán',16,NULL,NULL,NULL),(1135,'Panindícuaro',16,NULL,NULL,NULL),(1136,'Parácuaro',16,NULL,NULL,NULL),(1137,'Paracho',16,NULL,NULL,NULL),(1138,'Pátzcuaro',16,NULL,NULL,NULL),(1139,'Penjamillo',16,NULL,NULL,NULL),(1140,'Peribán',16,NULL,NULL,NULL),(1141,'La Piedad',16,NULL,NULL,NULL),(1142,'Purépero',16,NULL,NULL,NULL),(1143,'Puruándiro',16,NULL,NULL,NULL),(1144,'Queréndaro',16,NULL,NULL,NULL),(1145,'Quiroga',16,NULL,NULL,NULL),(1146,'Cojumatlán de Régules',16,NULL,NULL,NULL),(1147,'Los Reyes',16,NULL,NULL,NULL),(1148,'Sahuayo',16,NULL,NULL,NULL),(1149,'San Lucas',16,NULL,NULL,NULL),(1150,'Santa Ana Maya',16,NULL,NULL,NULL),(1151,'Salvador Escalante',16,NULL,NULL,NULL),(1152,'Senguio',16,NULL,NULL,NULL),(1153,'Susupuato',16,NULL,NULL,NULL),(1154,'Tacámbaro',16,NULL,NULL,NULL),(1155,'Tancítaro',16,NULL,NULL,NULL),(1156,'Tangamandapio',16,NULL,NULL,NULL),(1157,'Tangancícuaro',16,NULL,NULL,NULL),(1158,'Tanhuato',16,NULL,NULL,NULL),(1159,'Taretan',16,NULL,NULL,NULL),(1160,'Tarímbaro',16,NULL,NULL,NULL),(1161,'Tepalcatepec',16,NULL,NULL,NULL),(1162,'Tingambato',16,NULL,NULL,NULL),(1163,'Tingüindín',16,NULL,NULL,NULL),(1164,'Tiquicheo de Nicolás Romero',16,NULL,NULL,NULL),(1165,'Tlalpujahua',16,NULL,NULL,NULL),(1166,'Tlazazalca',16,NULL,NULL,NULL),(1167,'Tocumbo',16,NULL,NULL,NULL),(1168,'Tumbiscatío',16,NULL,NULL,NULL),(1169,'Turicato',16,NULL,NULL,NULL),(1170,'Tuxpan',16,NULL,NULL,NULL),(1171,'Tuzantla',16,NULL,NULL,NULL),(1172,'Tzintzuntzan',16,NULL,NULL,NULL),(1173,'Tzitzio',16,NULL,NULL,NULL),(1174,'Uruapan',16,NULL,NULL,NULL),(1175,'Venustiano Carranza',16,NULL,NULL,NULL),(1176,'Villamar',16,NULL,NULL,NULL),(1177,'Vista Hermosa',16,NULL,NULL,NULL),(1178,'Yurécuaro',16,NULL,NULL,NULL),(1179,'Zacapu',16,NULL,NULL,NULL),(1180,'Zamora',16,NULL,NULL,NULL),(1181,'Zináparo',16,NULL,NULL,NULL),(1182,'Zinapécuaro',16,NULL,NULL,NULL),(1183,'Ziracuaretiro',16,NULL,NULL,NULL),(1184,'Zitácuaro',16,NULL,NULL,NULL),(1185,'José Sixto Verduzco',16,NULL,NULL,NULL),(1186,'Amacuzac',17,NULL,NULL,NULL),(1187,'Atlatlahucan',17,NULL,NULL,NULL),(1188,'Axochiapan',17,NULL,NULL,NULL),(1189,'Ayala',17,NULL,NULL,NULL),(1190,'Coatlán del Río',17,NULL,NULL,NULL),(1191,'Cuautla',17,NULL,NULL,NULL),(1192,'Cuernavaca',17,NULL,NULL,NULL),(1193,'Emiliano Zapata',17,NULL,NULL,NULL),(1194,'Huitzilac',17,NULL,NULL,NULL),(1195,'Jantetelco',17,NULL,NULL,NULL),(1196,'Jiutepec',17,NULL,NULL,NULL),(1197,'Jojutla',17,NULL,NULL,NULL),(1198,'Jonacatepec de Leandro Valle',17,NULL,NULL,NULL),(1199,'Mazatepec',17,NULL,NULL,NULL),(1200,'Miacatlán',17,NULL,NULL,NULL),(1201,'Ocuituco',17,NULL,NULL,NULL),(1202,'Puente de Ixtla',17,NULL,NULL,NULL),(1203,'Temixco',17,NULL,NULL,NULL),(1204,'Tepalcingo',17,NULL,NULL,NULL),(1205,'Tepoztlán',17,NULL,NULL,NULL),(1206,'Tetecala',17,NULL,NULL,NULL),(1207,'Tetela del Volcán',17,NULL,NULL,NULL),(1208,'Tlalnepantla',17,NULL,NULL,NULL),(1209,'Tlaltizapán de Zapata',17,NULL,NULL,NULL),(1210,'Tlaquiltenango',17,NULL,NULL,NULL),(1211,'Tlayacapan',17,NULL,NULL,NULL),(1212,'Totolapan',17,NULL,NULL,NULL),(1213,'Xochitepec',17,NULL,NULL,NULL),(1214,'Yautepec',17,NULL,NULL,NULL),(1215,'Yecapixtla',17,NULL,NULL,NULL),(1216,'Zacatepec',17,NULL,NULL,NULL),(1217,'Zacualpan de Amilpas',17,NULL,NULL,NULL),(1218,'Temoac',17,NULL,NULL,NULL),(1219,'Coatetelco',17,NULL,NULL,NULL),(1220,'Xoxocotla',17,NULL,NULL,NULL),(1221,'Acaponeta',18,NULL,NULL,NULL),(1222,'Ahuacatlán',18,NULL,NULL,NULL),(1223,'Amatlán de Cañas',18,NULL,NULL,NULL),(1224,'Compostela',18,NULL,NULL,NULL),(1225,'Huajicori',18,NULL,NULL,NULL),(1226,'Ixtlán del Río',18,NULL,NULL,NULL),(1227,'Jala',18,NULL,NULL,NULL),(1228,'Xalisco',18,NULL,NULL,NULL),(1229,'Del Nayar',18,NULL,NULL,NULL),(1230,'Rosamorada',18,NULL,NULL,NULL),(1231,'Ruíz',18,NULL,NULL,NULL),(1232,'San Blas',18,NULL,NULL,NULL),(1233,'San Pedro Lagunillas',18,NULL,NULL,NULL),(1234,'Santa María del Oro',18,NULL,NULL,NULL),(1235,'Santiago Ixcuintla',18,NULL,NULL,NULL),(1236,'Tecuala',18,NULL,NULL,NULL),(1237,'Tepic',18,NULL,NULL,NULL),(1238,'Tuxpan',18,NULL,NULL,NULL),(1239,'La Yesca',18,NULL,NULL,NULL),(1240,'Bahía de Banderas',18,NULL,NULL,NULL),(1241,'Abasolo',19,NULL,NULL,NULL),(1242,'Agualeguas',19,NULL,NULL,NULL),(1243,'Los Aldamas',19,NULL,NULL,NULL),(1244,'Allende',19,NULL,NULL,NULL),(1245,'Anáhuac',19,NULL,NULL,NULL),(1246,'Apodaca',19,NULL,NULL,NULL),(1247,'Aramberri',19,NULL,NULL,NULL),(1248,'Bustamante',19,NULL,NULL,NULL),(1249,'Cadereyta Jiménez',19,NULL,NULL,NULL),(1250,'El Carmen',19,NULL,NULL,NULL),(1251,'Cerralvo',19,NULL,NULL,NULL),(1252,'Ciénega de Flores',19,NULL,NULL,NULL),(1253,'China',19,NULL,NULL,NULL),(1254,'Doctor Arroyo',19,NULL,NULL,NULL),(1255,'Doctor Coss',19,NULL,NULL,NULL),(1256,'Doctor González',19,NULL,NULL,NULL),(1257,'Galeana',19,NULL,NULL,NULL),(1258,'García',19,NULL,NULL,NULL),(1259,'San Pedro Garza García',19,NULL,NULL,NULL),(1260,'General Bravo',19,NULL,NULL,NULL),(1261,'General Escobedo',19,NULL,NULL,NULL),(1262,'General Terán',19,NULL,NULL,NULL),(1263,'General Treviño',19,NULL,NULL,NULL),(1264,'General Zaragoza',19,NULL,NULL,NULL),(1265,'General Zuazua',19,NULL,NULL,NULL),(1266,'Guadalupe',19,NULL,NULL,NULL),(1267,'Los Herreras',19,NULL,NULL,NULL),(1268,'Higueras',19,NULL,NULL,NULL),(1269,'Hualahuises',19,NULL,NULL,NULL),(1270,'Iturbide',19,NULL,NULL,NULL),(1271,'Juárez',19,NULL,NULL,NULL),(1272,'Lampazos de Naranjo',19,NULL,NULL,NULL),(1273,'Linares',19,NULL,NULL,NULL),(1274,'Marín',19,NULL,NULL,NULL),(1275,'Melchor Ocampo',19,NULL,NULL,NULL),(1276,'Mier y Noriega',19,NULL,NULL,NULL),(1277,'Mina',19,NULL,NULL,NULL),(1278,'Montemorelos',19,NULL,NULL,NULL),(1279,'Monterrey',19,NULL,NULL,NULL),(1280,'Parás',19,NULL,NULL,NULL),(1281,'Pesquería',19,NULL,NULL,NULL),(1282,'Los Ramones',19,NULL,NULL,NULL),(1283,'Rayones',19,NULL,NULL,NULL),(1284,'Sabinas Hidalgo',19,NULL,NULL,NULL),(1285,'Salinas Victoria',19,NULL,NULL,NULL),(1286,'San Nicolás de los Garza',19,NULL,NULL,NULL),(1287,'Hidalgo',19,NULL,NULL,NULL),(1288,'Santa Catarina',19,NULL,NULL,NULL),(1289,'Santiago',19,NULL,NULL,NULL),(1290,'Vallecillo',19,NULL,NULL,NULL),(1291,'Villaldama',19,NULL,NULL,NULL),(1292,'Abejones',20,NULL,NULL,NULL),(1293,'Acatlán de Pérez Figueroa',20,NULL,NULL,NULL),(1294,'Asunción Cacalotepec',20,NULL,NULL,NULL),(1295,'Asunción Cuyotepeji',20,NULL,NULL,NULL),(1296,'Asunción Ixtaltepec',20,NULL,NULL,NULL),(1297,'Asunción Nochixtlán',20,NULL,NULL,NULL),(1298,'Asunción Ocotlán',20,NULL,NULL,NULL),(1299,'Asunción Tlacolulita',20,NULL,NULL,NULL),(1300,'Ayotzintepec',20,NULL,NULL,NULL),(1301,'El Barrio de la Soledad',20,NULL,NULL,NULL),(1302,'Calihualá',20,NULL,NULL,NULL),(1303,'Candelaria Loxicha',20,NULL,NULL,NULL),(1304,'Ciénega de Zimatlán',20,NULL,NULL,NULL),(1305,'Ciudad Ixtepec',20,NULL,NULL,NULL),(1306,'Coatecas Altas',20,NULL,NULL,NULL),(1307,'Coicoyán de las Flores',20,NULL,NULL,NULL),(1308,'La Compañía',20,NULL,NULL,NULL),(1309,'Concepción Buenavista',20,NULL,NULL,NULL),(1310,'Concepción Pápalo',20,NULL,NULL,NULL),(1311,'Constancia del Rosario',20,NULL,NULL,NULL),(1312,'Cosolapa',20,NULL,NULL,NULL),(1313,'Cosoltepec',20,NULL,NULL,NULL),(1314,'Cuilápam de Guerrero',20,NULL,NULL,NULL),(1315,'Cuyamecalco Villa de Zaragoza',20,NULL,NULL,NULL),(1316,'Chahuites',20,NULL,NULL,NULL),(1317,'Chalcatongo de Hidalgo',20,NULL,NULL,NULL),(1318,'Chiquihuitlán de Benito Juárez',20,NULL,NULL,NULL),(1319,'Heroica Ciudad de Ejutla de Crespo',20,NULL,NULL,NULL),(1320,'Eloxochitlán de Flores Magón',20,NULL,NULL,NULL),(1321,'El Espinal',20,NULL,NULL,NULL),(1322,'Tamazulápam del Espíritu Santo',20,NULL,NULL,NULL),(1323,'Fresnillo de Trujano',20,NULL,NULL,NULL),(1324,'Guadalupe Etla',20,NULL,NULL,NULL),(1325,'Guadalupe de Ramírez',20,NULL,NULL,NULL),(1326,'Guelatao de Juárez',20,NULL,NULL,NULL),(1327,'Guevea de Humboldt',20,NULL,NULL,NULL),(1328,'Mesones Hidalgo',20,NULL,NULL,NULL),(1329,'Villa Hidalgo',20,NULL,NULL,NULL),(1330,'Heroica Ciudad de Huajuapan de León',20,NULL,NULL,NULL),(1331,'Huautepec',20,NULL,NULL,NULL),(1332,'Huautla de Jiménez',20,NULL,NULL,NULL),(1333,'Ixtlán de Juárez',20,NULL,NULL,NULL),(1334,'Heroica Ciudad de Juchitán de Zaragoza',20,NULL,NULL,NULL),(1335,'Loma Bonita',20,NULL,NULL,NULL),(1336,'Magdalena Apasco',20,NULL,NULL,NULL),(1337,'Magdalena Jaltepec',20,NULL,NULL,NULL),(1338,'Santa Magdalena Jicotlán',20,NULL,NULL,NULL),(1339,'Magdalena Mixtepec',20,NULL,NULL,NULL),(1340,'Magdalena Ocotlán',20,NULL,NULL,NULL),(1341,'Magdalena Peñasco',20,NULL,NULL,NULL),(1342,'Magdalena Teitipac',20,NULL,NULL,NULL),(1343,'Magdalena Tequisistlán',20,NULL,NULL,NULL),(1344,'Magdalena Tlacotepec',20,NULL,NULL,NULL),(1345,'Magdalena Zahuatlán',20,NULL,NULL,NULL),(1346,'Mariscala de Juárez',20,NULL,NULL,NULL),(1347,'Mártires de Tacubaya',20,NULL,NULL,NULL),(1348,'Matías Romero Avendaño',20,NULL,NULL,NULL),(1349,'Mazatlán Villa de Flores',20,NULL,NULL,NULL),(1350,'Miahuatlán de Porfirio Díaz',20,NULL,NULL,NULL),(1351,'Mixistlán de la Reforma',20,NULL,NULL,NULL),(1352,'Monjas',20,NULL,NULL,NULL),(1353,'Natividad',20,NULL,NULL,NULL),(1354,'Nazareno Etla',20,NULL,NULL,NULL),(1355,'Nejapa de Madero',20,NULL,NULL,NULL),(1356,'Ixpantepec Nieves',20,NULL,NULL,NULL),(1357,'Santiago Niltepec',20,NULL,NULL,NULL),(1358,'Oaxaca de Juárez',20,NULL,NULL,NULL),(1359,'Ocotlán de Morelos',20,NULL,NULL,NULL),(1360,'La Pe',20,NULL,NULL,NULL),(1361,'Pinotepa de Don Luis',20,NULL,NULL,NULL),(1362,'Pluma Hidalgo',20,NULL,NULL,NULL),(1363,'San José del Progreso',20,NULL,NULL,NULL),(1364,'Putla Villa de Guerrero',20,NULL,NULL,NULL),(1365,'Santa Catarina Quioquitani',20,NULL,NULL,NULL),(1366,'Reforma de Pineda',20,NULL,NULL,NULL),(1367,'La Reforma',20,NULL,NULL,NULL),(1368,'Reyes Etla',20,NULL,NULL,NULL),(1369,'Rojas de Cuauhtémoc',20,NULL,NULL,NULL),(1370,'Salina Cruz',20,NULL,NULL,NULL),(1371,'San Agustín Amatengo',20,NULL,NULL,NULL),(1372,'San Agustín Atenango',20,NULL,NULL,NULL),(1373,'San Agustín Chayuco',20,NULL,NULL,NULL),(1374,'San Agustín de las Juntas',20,NULL,NULL,NULL),(1375,'San Agustín Etla',20,NULL,NULL,NULL),(1376,'San Agustín Loxicha',20,NULL,NULL,NULL),(1377,'San Agustín Tlacotepec',20,NULL,NULL,NULL),(1378,'San Agustín Yatareni',20,NULL,NULL,NULL),(1379,'San Andrés Cabecera Nueva',20,NULL,NULL,NULL),(1380,'San Andrés Dinicuiti',20,NULL,NULL,NULL),(1381,'San Andrés Huaxpaltepec',20,NULL,NULL,NULL),(1382,'San Andrés Huayápam',20,NULL,NULL,NULL),(1383,'San Andrés Ixtlahuaca',20,NULL,NULL,NULL),(1384,'San Andrés Lagunas',20,NULL,NULL,NULL),(1385,'San Andrés Nuxiño',20,NULL,NULL,NULL),(1386,'San Andrés Paxtlán',20,NULL,NULL,NULL),(1387,'San Andrés Sinaxtla',20,NULL,NULL,NULL),(1388,'San Andrés Solaga',20,NULL,NULL,NULL),(1389,'San Andrés Teotilálpam',20,NULL,NULL,NULL),(1390,'San Andrés Tepetlapa',20,NULL,NULL,NULL),(1391,'San Andrés Yaá',20,NULL,NULL,NULL),(1392,'San Andrés Zabache',20,NULL,NULL,NULL),(1393,'San Andrés Zautla',20,NULL,NULL,NULL),(1394,'San Antonino Castillo Velasco',20,NULL,NULL,NULL),(1395,'San Antonino el Alto',20,NULL,NULL,NULL),(1396,'San Antonino Monte Verde',20,NULL,NULL,NULL),(1397,'San Antonio Acutla',20,NULL,NULL,NULL),(1398,'San Antonio de la Cal',20,NULL,NULL,NULL),(1399,'San Antonio Huitepec',20,NULL,NULL,NULL),(1400,'San Antonio Nanahuatípam',20,NULL,NULL,NULL),(1401,'San Antonio Sinicahua',20,NULL,NULL,NULL),(1402,'San Antonio Tepetlapa',20,NULL,NULL,NULL),(1403,'San Baltazar Chichicápam',20,NULL,NULL,NULL),(1404,'San Baltazar Loxicha',20,NULL,NULL,NULL),(1405,'San Baltazar Yatzachi el Bajo',20,NULL,NULL,NULL),(1406,'San Bartolo Coyotepec',20,NULL,NULL,NULL),(1407,'San Bartolomé Ayautla',20,NULL,NULL,NULL),(1408,'San Bartolomé Loxicha',20,NULL,NULL,NULL),(1409,'San Bartolomé Quialana',20,NULL,NULL,NULL),(1410,'San Bartolomé Yucuañe',20,NULL,NULL,NULL),(1411,'San Bartolomé Zoogocho',20,NULL,NULL,NULL),(1412,'San Bartolo Soyaltepec',20,NULL,NULL,NULL),(1413,'San Bartolo Yautepec',20,NULL,NULL,NULL),(1414,'San Bernardo Mixtepec',20,NULL,NULL,NULL),(1415,'San Blas Atempa',20,NULL,NULL,NULL),(1416,'San Carlos Yautepec',20,NULL,NULL,NULL),(1417,'San Cristóbal Amatlán',20,NULL,NULL,NULL),(1418,'San Cristóbal Amoltepec',20,NULL,NULL,NULL),(1419,'San Cristóbal Lachirioag',20,NULL,NULL,NULL),(1420,'San Cristóbal Suchixtlahuaca',20,NULL,NULL,NULL),(1421,'San Dionisio del Mar',20,NULL,NULL,NULL),(1422,'San Dionisio Ocotepec',20,NULL,NULL,NULL),(1423,'San Dionisio Ocotlán',20,NULL,NULL,NULL),(1424,'San Esteban Atatlahuca',20,NULL,NULL,NULL),(1425,'San Felipe Jalapa de Díaz',20,NULL,NULL,NULL),(1426,'San Felipe Tejalápam',20,NULL,NULL,NULL),(1427,'San Felipe Usila',20,NULL,NULL,NULL),(1428,'San Francisco Cahuacuá',20,NULL,NULL,NULL),(1429,'San Francisco Cajonos',20,NULL,NULL,NULL),(1430,'San Francisco Chapulapa',20,NULL,NULL,NULL),(1431,'San Francisco Chindúa',20,NULL,NULL,NULL),(1432,'San Francisco del Mar',20,NULL,NULL,NULL),(1433,'San Francisco Huehuetlán',20,NULL,NULL,NULL),(1434,'San Francisco Ixhuatán',20,NULL,NULL,NULL),(1435,'San Francisco Jaltepetongo',20,NULL,NULL,NULL),(1436,'San Francisco Lachigoló',20,NULL,NULL,NULL),(1437,'San Francisco Logueche',20,NULL,NULL,NULL),(1438,'San Francisco Nuxaño',20,NULL,NULL,NULL),(1439,'San Francisco Ozolotepec',20,NULL,NULL,NULL),(1440,'San Francisco Sola',20,NULL,NULL,NULL),(1441,'San Francisco Telixtlahuaca',20,NULL,NULL,NULL),(1442,'San Francisco Teopan',20,NULL,NULL,NULL),(1443,'San Francisco Tlapancingo',20,NULL,NULL,NULL),(1444,'San Gabriel Mixtepec',20,NULL,NULL,NULL),(1445,'San Ildefonso Amatlán',20,NULL,NULL,NULL),(1446,'San Ildefonso Sola',20,NULL,NULL,NULL),(1447,'San Ildefonso Villa Alta',20,NULL,NULL,NULL),(1448,'San Jacinto Amilpas',20,NULL,NULL,NULL),(1449,'San Jacinto Tlacotepec',20,NULL,NULL,NULL),(1450,'San Jerónimo Coatlán',20,NULL,NULL,NULL),(1451,'San Jerónimo Silacayoapilla',20,NULL,NULL,NULL),(1452,'San Jerónimo Sosola',20,NULL,NULL,NULL),(1453,'San Jerónimo Taviche',20,NULL,NULL,NULL),(1454,'San Jerónimo Tecóatl',20,NULL,NULL,NULL),(1455,'San Jorge Nuchita',20,NULL,NULL,NULL),(1456,'San José Ayuquila',20,NULL,NULL,NULL),(1457,'San José Chiltepec',20,NULL,NULL,NULL),(1458,'San José del Peñasco',20,NULL,NULL,NULL),(1459,'San José Estancia Grande',20,NULL,NULL,NULL),(1460,'San José Independencia',20,NULL,NULL,NULL),(1461,'San José Lachiguiri',20,NULL,NULL,NULL),(1462,'San José Tenango',20,NULL,NULL,NULL),(1463,'San Juan Achiutla',20,NULL,NULL,NULL),(1464,'San Juan Atepec',20,NULL,NULL,NULL),(1465,'Ánimas Trujano',20,NULL,NULL,NULL),(1466,'San Juan Bautista Atatlahuca',20,NULL,NULL,NULL),(1467,'San Juan Bautista Coixtlahuaca',20,NULL,NULL,NULL),(1468,'San Juan Bautista Cuicatlán',20,NULL,NULL,NULL),(1469,'San Juan Bautista Guelache',20,NULL,NULL,NULL),(1470,'San Juan Bautista Jayacatlán',20,NULL,NULL,NULL),(1471,'San Juan Bautista Lo de Soto',20,NULL,NULL,NULL),(1472,'San Juan Bautista Suchitepec',20,NULL,NULL,NULL),(1473,'San Juan Bautista Tlacoatzintepec',20,NULL,NULL,NULL),(1474,'San Juan Bautista Tlachichilco',20,NULL,NULL,NULL),(1475,'San Juan Bautista Tuxtepec',20,NULL,NULL,NULL),(1476,'San Juan Cacahuatepec',20,NULL,NULL,NULL),(1477,'San Juan Cieneguilla',20,NULL,NULL,NULL),(1478,'San Juan Coatzóspam',20,NULL,NULL,NULL),(1479,'San Juan Colorado',20,NULL,NULL,NULL),(1480,'San Juan Comaltepec',20,NULL,NULL,NULL),(1481,'San Juan Cotzocón',20,NULL,NULL,NULL),(1482,'San Juan Chicomezúchil',20,NULL,NULL,NULL),(1483,'San Juan Chilateca',20,NULL,NULL,NULL),(1484,'San Juan del Estado',20,NULL,NULL,NULL),(1485,'San Juan del Río',20,NULL,NULL,NULL),(1486,'San Juan Diuxi',20,NULL,NULL,NULL),(1487,'San Juan Evangelista Analco',20,NULL,NULL,NULL),(1488,'San Juan Guelavía',20,NULL,NULL,NULL),(1489,'San Juan Guichicovi',20,NULL,NULL,NULL),(1490,'San Juan Ihualtepec',20,NULL,NULL,NULL),(1491,'San Juan Juquila Mixes',20,NULL,NULL,NULL),(1492,'San Juan Juquila Vijanos',20,NULL,NULL,NULL),(1493,'San Juan Lachao',20,NULL,NULL,NULL),(1494,'San Juan Lachigalla',20,NULL,NULL,NULL),(1495,'San Juan Lajarcia',20,NULL,NULL,NULL),(1496,'San Juan Lalana',20,NULL,NULL,NULL),(1497,'San Juan de los Cués',20,NULL,NULL,NULL),(1498,'San Juan Mazatlán',20,NULL,NULL,NULL),(1499,'San Juan Mixtepec -Dto. 08 -',20,NULL,NULL,NULL),(1500,'San Juan Mixtepec -Dto. 26 -',20,NULL,NULL,NULL),(1501,'San Juan Ñumí',20,NULL,NULL,NULL),(1502,'San Juan Ozolotepec',20,NULL,NULL,NULL),(1503,'San Juan Petlapa',20,NULL,NULL,NULL),(1504,'San Juan Quiahije',20,NULL,NULL,NULL),(1505,'San Juan Quiotepec',20,NULL,NULL,NULL),(1506,'San Juan Sayultepec',20,NULL,NULL,NULL),(1507,'San Juan Tabaá',20,NULL,NULL,NULL),(1508,'San Juan Tamazola',20,NULL,NULL,NULL),(1509,'San Juan Teita',20,NULL,NULL,NULL),(1510,'San Juan Teitipac',20,NULL,NULL,NULL),(1511,'San Juan Tepeuxila',20,NULL,NULL,NULL),(1512,'San Juan Teposcolula',20,NULL,NULL,NULL),(1513,'San Juan Yaeé',20,NULL,NULL,NULL),(1514,'San Juan Yatzona',20,NULL,NULL,NULL),(1515,'San Juan Yucuita',20,NULL,NULL,NULL),(1516,'San Lorenzo',20,NULL,NULL,NULL),(1517,'San Lorenzo Albarradas',20,NULL,NULL,NULL),(1518,'San Lorenzo Cacaotepec',20,NULL,NULL,NULL),(1519,'San Lorenzo Cuaunecuiltitla',20,NULL,NULL,NULL),(1520,'San Lorenzo Texmelúcan',20,NULL,NULL,NULL),(1521,'San Lorenzo Victoria',20,NULL,NULL,NULL),(1522,'San Lucas Camotlán',20,NULL,NULL,NULL),(1523,'San Lucas Ojitlán',20,NULL,NULL,NULL),(1524,'San Lucas Quiaviní',20,NULL,NULL,NULL),(1525,'San Lucas Zoquiápam',20,NULL,NULL,NULL),(1526,'San Luis Amatlán',20,NULL,NULL,NULL),(1527,'San Marcial Ozolotepec',20,NULL,NULL,NULL),(1528,'San Marcos Arteaga',20,NULL,NULL,NULL),(1529,'San Martín de los Cansecos',20,NULL,NULL,NULL),(1530,'San Martín Huamelúlpam',20,NULL,NULL,NULL),(1531,'San Martín Itunyoso',20,NULL,NULL,NULL),(1532,'San Martín Lachilá',20,NULL,NULL,NULL),(1533,'San Martín Peras',20,NULL,NULL,NULL),(1534,'San Martín Tilcajete',20,NULL,NULL,NULL),(1535,'San Martín Toxpalan',20,NULL,NULL,NULL),(1536,'San Martín Zacatepec',20,NULL,NULL,NULL),(1537,'San Mateo Cajonos',20,NULL,NULL,NULL),(1538,'Capulálpam de Méndez',20,NULL,NULL,NULL),(1539,'San Mateo del Mar',20,NULL,NULL,NULL),(1540,'San Mateo Yoloxochitlán',20,NULL,NULL,NULL),(1541,'San Mateo Etlatongo',20,NULL,NULL,NULL),(1542,'San Mateo Nejápam',20,NULL,NULL,NULL),(1543,'San Mateo Peñasco',20,NULL,NULL,NULL),(1544,'San Mateo Piñas',20,NULL,NULL,NULL),(1545,'San Mateo Río Hondo',20,NULL,NULL,NULL),(1546,'San Mateo Sindihui',20,NULL,NULL,NULL),(1547,'San Mateo Tlapiltepec',20,NULL,NULL,NULL),(1548,'San Melchor Betaza',20,NULL,NULL,NULL),(1549,'San Miguel Achiutla',20,NULL,NULL,NULL),(1550,'San Miguel Ahuehuetitlán',20,NULL,NULL,NULL),(1551,'San Miguel Aloápam',20,NULL,NULL,NULL),(1552,'San Miguel Amatitlán',20,NULL,NULL,NULL),(1553,'San Miguel Amatlán',20,NULL,NULL,NULL),(1554,'San Miguel Coatlán',20,NULL,NULL,NULL),(1555,'San Miguel Chicahua',20,NULL,NULL,NULL),(1556,'San Miguel Chimalapa',20,NULL,NULL,NULL),(1557,'San Miguel del Puerto',20,NULL,NULL,NULL),(1558,'San Miguel del Río',20,NULL,NULL,NULL),(1559,'San Miguel Ejutla',20,NULL,NULL,NULL),(1560,'San Miguel el Grande',20,NULL,NULL,NULL),(1561,'San Miguel Huautla',20,NULL,NULL,NULL),(1562,'San Miguel Mixtepec',20,NULL,NULL,NULL),(1563,'San Miguel Panixtlahuaca',20,NULL,NULL,NULL),(1564,'San Miguel Peras',20,NULL,NULL,NULL),(1565,'San Miguel Piedras',20,NULL,NULL,NULL),(1566,'San Miguel Quetzaltepec',20,NULL,NULL,NULL),(1567,'San Miguel Santa Flor',20,NULL,NULL,NULL),(1568,'Villa Sola de Vega',20,NULL,NULL,NULL),(1569,'San Miguel Soyaltepec',20,NULL,NULL,NULL),(1570,'San Miguel Suchixtepec',20,NULL,NULL,NULL),(1571,'Villa Talea de Castro',20,NULL,NULL,NULL),(1572,'San Miguel Tecomatlán',20,NULL,NULL,NULL),(1573,'San Miguel Tenango',20,NULL,NULL,NULL),(1574,'San Miguel Tequixtepec',20,NULL,NULL,NULL),(1575,'San Miguel Tilquiápam',20,NULL,NULL,NULL),(1576,'San Miguel Tlacamama',20,NULL,NULL,NULL),(1577,'San Miguel Tlacotepec',20,NULL,NULL,NULL),(1578,'San Miguel Tulancingo',20,NULL,NULL,NULL),(1579,'San Miguel Yotao',20,NULL,NULL,NULL),(1580,'San Nicolás',20,NULL,NULL,NULL),(1581,'San Nicolás Hidalgo',20,NULL,NULL,NULL),(1582,'San Pablo Coatlán',20,NULL,NULL,NULL),(1583,'San Pablo Cuatro Venados',20,NULL,NULL,NULL),(1584,'San Pablo Etla',20,NULL,NULL,NULL),(1585,'San Pablo Huitzo',20,NULL,NULL,NULL),(1586,'San Pablo Huixtepec',20,NULL,NULL,NULL),(1587,'San Pablo Macuiltianguis',20,NULL,NULL,NULL),(1588,'San Pablo Tijaltepec',20,NULL,NULL,NULL),(1589,'San Pablo Villa de Mitla',20,NULL,NULL,NULL),(1590,'San Pablo Yaganiza',20,NULL,NULL,NULL),(1591,'San Pedro Amuzgos',20,NULL,NULL,NULL),(1592,'San Pedro Apóstol',20,NULL,NULL,NULL),(1593,'San Pedro Atoyac',20,NULL,NULL,NULL),(1594,'San Pedro Cajonos',20,NULL,NULL,NULL),(1595,'San Pedro Coxcaltepec Cántaros',20,NULL,NULL,NULL),(1596,'San Pedro Comitancillo',20,NULL,NULL,NULL),(1597,'San Pedro el Alto',20,NULL,NULL,NULL),(1598,'San Pedro Huamelula',20,NULL,NULL,NULL),(1599,'San Pedro Huilotepec',20,NULL,NULL,NULL),(1600,'San Pedro Ixcatlán',20,NULL,NULL,NULL),(1601,'San Pedro Ixtlahuaca',20,NULL,NULL,NULL),(1602,'San Pedro Jaltepetongo',20,NULL,NULL,NULL),(1603,'San Pedro Jicayán',20,NULL,NULL,NULL),(1604,'San Pedro Jocotipac',20,NULL,NULL,NULL),(1605,'San Pedro Juchatengo',20,NULL,NULL,NULL),(1606,'San Pedro Mártir',20,NULL,NULL,NULL),(1607,'San Pedro Mártir Quiechapa',20,NULL,NULL,NULL),(1608,'San Pedro Mártir Yucuxaco',20,NULL,NULL,NULL),(1609,'San Pedro Mixtepec -Dto. 22 -',20,NULL,NULL,NULL),(1610,'San Pedro Mixtepec -Dto. 26 -',20,NULL,NULL,NULL),(1611,'San Pedro Molinos',20,NULL,NULL,NULL),(1612,'San Pedro Nopala',20,NULL,NULL,NULL),(1613,'San Pedro Ocopetatillo',20,NULL,NULL,NULL),(1614,'San Pedro Ocotepec',20,NULL,NULL,NULL),(1615,'San Pedro Pochutla',20,NULL,NULL,NULL),(1616,'San Pedro Quiatoni',20,NULL,NULL,NULL),(1617,'San Pedro Sochiápam',20,NULL,NULL,NULL),(1618,'San Pedro Tapanatepec',20,NULL,NULL,NULL),(1619,'San Pedro Taviche',20,NULL,NULL,NULL),(1620,'San Pedro Teozacoalco',20,NULL,NULL,NULL),(1621,'San Pedro Teutila',20,NULL,NULL,NULL),(1622,'San Pedro Tidaá',20,NULL,NULL,NULL),(1623,'San Pedro Topiltepec',20,NULL,NULL,NULL),(1624,'San Pedro Totolápam',20,NULL,NULL,NULL),(1625,'Villa de Tututepec',20,NULL,NULL,NULL),(1626,'San Pedro Yaneri',20,NULL,NULL,NULL),(1627,'San Pedro Yólox',20,NULL,NULL,NULL),(1628,'San Pedro y San Pablo Ayutla',20,NULL,NULL,NULL),(1629,'Villa de Etla',20,NULL,NULL,NULL),(1630,'San Pedro y San Pablo Teposcolula',20,NULL,NULL,NULL),(1631,'San Pedro y San Pablo Tequixtepec',20,NULL,NULL,NULL),(1632,'San Pedro Yucunama',20,NULL,NULL,NULL),(1633,'San Raymundo Jalpan',20,NULL,NULL,NULL),(1634,'San Sebastián Abasolo',20,NULL,NULL,NULL),(1635,'San Sebastián Coatlán',20,NULL,NULL,NULL),(1636,'San Sebastián Ixcapa',20,NULL,NULL,NULL),(1637,'San Sebastián Nicananduta',20,NULL,NULL,NULL),(1638,'San Sebastián Río Hondo',20,NULL,NULL,NULL),(1639,'San Sebastián Tecomaxtlahuaca',20,NULL,NULL,NULL),(1640,'San Sebastián Teitipac',20,NULL,NULL,NULL),(1641,'San Sebastián Tutla',20,NULL,NULL,NULL),(1642,'San Simón Almolongas',20,NULL,NULL,NULL),(1643,'San Simón Zahuatlán',20,NULL,NULL,NULL),(1644,'Santa Ana',20,NULL,NULL,NULL),(1645,'Santa Ana Ateixtlahuaca',20,NULL,NULL,NULL),(1646,'Santa Ana Cuauhtémoc',20,NULL,NULL,NULL),(1647,'Santa Ana del Valle',20,NULL,NULL,NULL),(1648,'Santa Ana Tavela',20,NULL,NULL,NULL),(1649,'Santa Ana Tlapacoyan',20,NULL,NULL,NULL),(1650,'Santa Ana Yareni',20,NULL,NULL,NULL),(1651,'Santa Ana Zegache',20,NULL,NULL,NULL),(1652,'Santa Catalina Quierí',20,NULL,NULL,NULL),(1653,'Santa Catarina Cuixtla',20,NULL,NULL,NULL),(1654,'Santa Catarina Ixtepeji',20,NULL,NULL,NULL),(1655,'Santa Catarina Juquila',20,NULL,NULL,NULL),(1656,'Santa Catarina Lachatao',20,NULL,NULL,NULL),(1657,'Santa Catarina Loxicha',20,NULL,NULL,NULL),(1658,'Santa Catarina Mechoacán',20,NULL,NULL,NULL),(1659,'Santa Catarina Minas',20,NULL,NULL,NULL),(1660,'Santa Catarina Quiané',20,NULL,NULL,NULL),(1661,'Santa Catarina Tayata',20,NULL,NULL,NULL),(1662,'Santa Catarina Ticuá',20,NULL,NULL,NULL),(1663,'Santa Catarina Yosonotú',20,NULL,NULL,NULL),(1664,'Santa Catarina Zapoquila',20,NULL,NULL,NULL),(1665,'Santa Cruz Acatepec',20,NULL,NULL,NULL),(1666,'Santa Cruz Amilpas',20,NULL,NULL,NULL),(1667,'Santa Cruz de Bravo',20,NULL,NULL,NULL),(1668,'Santa Cruz Itundujia',20,NULL,NULL,NULL),(1669,'Santa Cruz Mixtepec',20,NULL,NULL,NULL),(1670,'Santa Cruz Nundaco',20,NULL,NULL,NULL),(1671,'Santa Cruz Papalutla',20,NULL,NULL,NULL),(1672,'Santa Cruz Tacache de Mina',20,NULL,NULL,NULL),(1673,'Santa Cruz Tacahua',20,NULL,NULL,NULL),(1674,'Santa Cruz Tayata',20,NULL,NULL,NULL),(1675,'Santa Cruz Xitla',20,NULL,NULL,NULL),(1676,'Santa Cruz Xoxocotlán',20,NULL,NULL,NULL),(1677,'Santa Cruz Zenzontepec',20,NULL,NULL,NULL),(1678,'Santa Gertrudis',20,NULL,NULL,NULL),(1679,'Santa Inés del Monte',20,NULL,NULL,NULL),(1680,'Santa Inés Yatzeche',20,NULL,NULL,NULL),(1681,'Santa Lucía del Camino',20,NULL,NULL,NULL),(1682,'Santa Lucía Miahuatlán',20,NULL,NULL,NULL),(1683,'Santa Lucía Monteverde',20,NULL,NULL,NULL),(1684,'Santa Lucía Ocotlán',20,NULL,NULL,NULL),(1685,'Santa María Alotepec',20,NULL,NULL,NULL),(1686,'Santa María Apazco',20,NULL,NULL,NULL),(1687,'Santa María la Asunción',20,NULL,NULL,NULL),(1688,'Heroica Ciudad de Tlaxiaco',20,NULL,NULL,NULL),(1689,'Ayoquezco de Aldama',20,NULL,NULL,NULL),(1690,'Santa María Atzompa',20,NULL,NULL,NULL),(1691,'Santa María Camotlán',20,NULL,NULL,NULL),(1692,'Santa María Colotepec',20,NULL,NULL,NULL),(1693,'Santa María Cortijo',20,NULL,NULL,NULL),(1694,'Santa María Coyotepec',20,NULL,NULL,NULL),(1695,'Santa María Chachoápam',20,NULL,NULL,NULL),(1696,'Villa de Chilapa de Díaz',20,NULL,NULL,NULL),(1697,'Santa María Chilchotla',20,NULL,NULL,NULL),(1698,'Santa María Chimalapa',20,NULL,NULL,NULL),(1699,'Santa María del Rosario',20,NULL,NULL,NULL),(1700,'Santa María del Tule',20,NULL,NULL,NULL),(1701,'Santa María Ecatepec',20,NULL,NULL,NULL),(1702,'Santa María Guelacé',20,NULL,NULL,NULL),(1703,'Santa María Guienagati',20,NULL,NULL,NULL),(1704,'Santa María Huatulco',20,NULL,NULL,NULL),(1705,'Santa María Huazolotitlán',20,NULL,NULL,NULL),(1706,'Santa María Ipalapa',20,NULL,NULL,NULL),(1707,'Santa María Ixcatlán',20,NULL,NULL,NULL),(1708,'Santa María Jacatepec',20,NULL,NULL,NULL),(1709,'Santa María Jalapa del Marqués',20,NULL,NULL,NULL),(1710,'Santa María Jaltianguis',20,NULL,NULL,NULL),(1711,'Santa María Lachixío',20,NULL,NULL,NULL),(1712,'Santa María Mixtequilla',20,NULL,NULL,NULL),(1713,'Santa María Nativitas',20,NULL,NULL,NULL),(1714,'Santa María Nduayaco',20,NULL,NULL,NULL),(1715,'Santa María Ozolotepec',20,NULL,NULL,NULL),(1716,'Santa María Pápalo',20,NULL,NULL,NULL),(1717,'Santa María Peñoles',20,NULL,NULL,NULL),(1718,'Santa María Petapa',20,NULL,NULL,NULL),(1719,'Santa María Quiegolani',20,NULL,NULL,NULL),(1720,'Santa María Sola',20,NULL,NULL,NULL),(1721,'Santa María Tataltepec',20,NULL,NULL,NULL),(1722,'Santa María Tecomavaca',20,NULL,NULL,NULL),(1723,'Santa María Temaxcalapa',20,NULL,NULL,NULL),(1724,'Santa María Temaxcaltepec',20,NULL,NULL,NULL),(1725,'Santa María Teopoxco',20,NULL,NULL,NULL),(1726,'Santa María Tepantlali',20,NULL,NULL,NULL),(1727,'Santa María Texcatitlán',20,NULL,NULL,NULL),(1728,'Santa María Tlahuitoltepec',20,NULL,NULL,NULL),(1729,'Santa María Tlalixtac',20,NULL,NULL,NULL),(1730,'Santa María Tonameca',20,NULL,NULL,NULL),(1731,'Santa María Totolapilla',20,NULL,NULL,NULL),(1732,'Santa María Xadani',20,NULL,NULL,NULL),(1733,'Santa María Yalina',20,NULL,NULL,NULL),(1734,'Santa María Yavesía',20,NULL,NULL,NULL),(1735,'Santa María Yolotepec',20,NULL,NULL,NULL),(1736,'Santa María Yosoyúa',20,NULL,NULL,NULL),(1737,'Santa María Yucuhiti',20,NULL,NULL,NULL),(1738,'Santa María Zacatepec',20,NULL,NULL,NULL),(1739,'Santa María Zaniza',20,NULL,NULL,NULL),(1740,'Santa María Zoquitlán',20,NULL,NULL,NULL),(1741,'Santiago Amoltepec',20,NULL,NULL,NULL),(1742,'Santiago Apoala',20,NULL,NULL,NULL),(1743,'Santiago Apóstol',20,NULL,NULL,NULL),(1744,'Santiago Astata',20,NULL,NULL,NULL),(1745,'Santiago Atitlán',20,NULL,NULL,NULL),(1746,'Santiago Ayuquililla',20,NULL,NULL,NULL),(1747,'Santiago Cacaloxtepec',20,NULL,NULL,NULL),(1748,'Santiago Camotlán',20,NULL,NULL,NULL),(1749,'Santiago Comaltepec',20,NULL,NULL,NULL),(1750,'Santiago Chazumba',20,NULL,NULL,NULL),(1751,'Santiago Choápam',20,NULL,NULL,NULL),(1752,'Santiago del Río',20,NULL,NULL,NULL),(1753,'Santiago Huajolotitlán',20,NULL,NULL,NULL),(1754,'Santiago Huauclilla',20,NULL,NULL,NULL),(1755,'Santiago Ihuitlán Plumas',20,NULL,NULL,NULL),(1756,'Santiago Ixcuintepec',20,NULL,NULL,NULL),(1757,'Santiago Ixtayutla',20,NULL,NULL,NULL),(1758,'Santiago Jamiltepec',20,NULL,NULL,NULL),(1759,'Santiago Jocotepec',20,NULL,NULL,NULL),(1760,'Santiago Juxtlahuaca',20,NULL,NULL,NULL),(1761,'Santiago Lachiguiri',20,NULL,NULL,NULL),(1762,'Santiago Lalopa',20,NULL,NULL,NULL),(1763,'Santiago Laollaga',20,NULL,NULL,NULL),(1764,'Santiago Laxopa',20,NULL,NULL,NULL),(1765,'Santiago Llano Grande',20,NULL,NULL,NULL),(1766,'Santiago Matatlán',20,NULL,NULL,NULL),(1767,'Santiago Miltepec',20,NULL,NULL,NULL),(1768,'Santiago Minas',20,NULL,NULL,NULL),(1769,'Santiago Nacaltepec',20,NULL,NULL,NULL),(1770,'Santiago Nejapilla',20,NULL,NULL,NULL),(1771,'Santiago Nundiche',20,NULL,NULL,NULL),(1772,'Santiago Nuyoó',20,NULL,NULL,NULL),(1773,'Santiago Pinotepa Nacional',20,NULL,NULL,NULL),(1774,'Santiago Suchilquitongo',20,NULL,NULL,NULL),(1775,'Santiago Tamazola',20,NULL,NULL,NULL),(1776,'Santiago Tapextla',20,NULL,NULL,NULL),(1777,'Villa Tejúpam de la Unión',20,NULL,NULL,NULL),(1778,'Santiago Tenango',20,NULL,NULL,NULL),(1779,'Santiago Tepetlapa',20,NULL,NULL,NULL),(1780,'Santiago Tetepec',20,NULL,NULL,NULL),(1781,'Santiago Texcalcingo',20,NULL,NULL,NULL),(1782,'Santiago Textitlán',20,NULL,NULL,NULL),(1783,'Santiago Tilantongo',20,NULL,NULL,NULL),(1784,'Santiago Tillo',20,NULL,NULL,NULL),(1785,'Santiago Tlazoyaltepec',20,NULL,NULL,NULL),(1786,'Santiago Xanica',20,NULL,NULL,NULL),(1787,'Santiago Xiacuí',20,NULL,NULL,NULL),(1788,'Santiago Yaitepec',20,NULL,NULL,NULL),(1789,'Santiago Yaveo',20,NULL,NULL,NULL),(1790,'Santiago Yolomécatl',20,NULL,NULL,NULL),(1791,'Santiago Yosondúa',20,NULL,NULL,NULL),(1792,'Santiago Yucuyachi',20,NULL,NULL,NULL),(1793,'Santiago Zacatepec',20,NULL,NULL,NULL),(1794,'Santiago Zoochila',20,NULL,NULL,NULL),(1795,'Nuevo Zoquiápam',20,NULL,NULL,NULL),(1796,'Santo Domingo Ingenio',20,NULL,NULL,NULL),(1797,'Santo Domingo Albarradas',20,NULL,NULL,NULL),(1798,'Santo Domingo Armenta',20,NULL,NULL,NULL),(1799,'Santo Domingo Chihuitán',20,NULL,NULL,NULL),(1800,'Santo Domingo de Morelos',20,NULL,NULL,NULL),(1801,'Santo Domingo Ixcatlán',20,NULL,NULL,NULL),(1802,'Santo Domingo Nuxaá',20,NULL,NULL,NULL),(1803,'Santo Domingo Ozolotepec',20,NULL,NULL,NULL),(1804,'Santo Domingo Petapa',20,NULL,NULL,NULL),(1805,'Santo Domingo Roayaga',20,NULL,NULL,NULL),(1806,'Santo Domingo Tehuantepec',20,NULL,NULL,NULL),(1807,'Santo Domingo Teojomulco',20,NULL,NULL,NULL),(1808,'Santo Domingo Tepuxtepec',20,NULL,NULL,NULL),(1809,'Santo Domingo Tlatayápam',20,NULL,NULL,NULL),(1810,'Santo Domingo Tomaltepec',20,NULL,NULL,NULL),(1811,'Santo Domingo Tonalá',20,NULL,NULL,NULL),(1812,'Santo Domingo Tonaltepec',20,NULL,NULL,NULL),(1813,'Santo Domingo Xagacía',20,NULL,NULL,NULL),(1814,'Santo Domingo Yanhuitlán',20,NULL,NULL,NULL),(1815,'Santo Domingo Yodohino',20,NULL,NULL,NULL),(1816,'Santo Domingo Zanatepec',20,NULL,NULL,NULL),(1817,'Santos Reyes Nopala',20,NULL,NULL,NULL),(1818,'Santos Reyes Pápalo',20,NULL,NULL,NULL),(1819,'Santos Reyes Tepejillo',20,NULL,NULL,NULL),(1820,'Santos Reyes Yucuná',20,NULL,NULL,NULL),(1821,'Santo Tomás Jalieza',20,NULL,NULL,NULL),(1822,'Santo Tomás Mazaltepec',20,NULL,NULL,NULL),(1823,'Santo Tomás Ocotepec',20,NULL,NULL,NULL),(1824,'Santo Tomás Tamazulapan',20,NULL,NULL,NULL),(1825,'San Vicente Coatlán',20,NULL,NULL,NULL),(1826,'San Vicente Lachixío',20,NULL,NULL,NULL),(1827,'San Vicente Nuñú',20,NULL,NULL,NULL),(1828,'Silacayoápam',20,NULL,NULL,NULL),(1829,'Sitio de Xitlapehua',20,NULL,NULL,NULL),(1830,'Soledad Etla',20,NULL,NULL,NULL),(1831,'Villa de Tamazulápam del Progreso',20,NULL,NULL,NULL),(1832,'Tanetze de Zaragoza',20,NULL,NULL,NULL),(1833,'Taniche',20,NULL,NULL,NULL),(1834,'Tataltepec de Valdés',20,NULL,NULL,NULL),(1835,'Teococuilco de Marcos Pérez',20,NULL,NULL,NULL),(1836,'Teotitlán de Flores Magón',20,NULL,NULL,NULL),(1837,'Teotitlán del Valle',20,NULL,NULL,NULL),(1838,'Teotongo',20,NULL,NULL,NULL),(1839,'Tepelmeme Villa de Morelos',20,NULL,NULL,NULL),(1840,'Tezoatlán de Segura y Luna',20,NULL,NULL,NULL),(1841,'San Jerónimo Tlacochahuaya',20,NULL,NULL,NULL),(1842,'Tlacolula de Matamoros',20,NULL,NULL,NULL),(1843,'Tlacotepec Plumas',20,NULL,NULL,NULL),(1844,'Tlalixtac de Cabrera',20,NULL,NULL,NULL),(1845,'Totontepec Villa de Morelos',20,NULL,NULL,NULL),(1846,'Trinidad Zaachila',20,NULL,NULL,NULL),(1847,'La Trinidad Vista Hermosa',20,NULL,NULL,NULL),(1848,'Unión Hidalgo',20,NULL,NULL,NULL),(1849,'Valerio Trujano',20,NULL,NULL,NULL),(1850,'San Juan Bautista Valle Nacional',20,NULL,NULL,NULL),(1851,'Villa Díaz Ordaz',20,NULL,NULL,NULL),(1852,'Yaxe',20,NULL,NULL,NULL),(1853,'Magdalena Yodocono de Porfirio Díaz',20,NULL,NULL,NULL),(1854,'Yogana',20,NULL,NULL,NULL),(1855,'Yutanduchi de Guerrero',20,NULL,NULL,NULL),(1856,'Villa de Zaachila',20,NULL,NULL,NULL),(1857,'San Mateo Yucutindoo',20,NULL,NULL,NULL),(1858,'Zapotitlán Lagunas',20,NULL,NULL,NULL),(1859,'Zapotitlán Palmas',20,NULL,NULL,NULL),(1860,'Santa Inés de Zaragoza',20,NULL,NULL,NULL),(1861,'Zimatlán de Álvarez',20,NULL,NULL,NULL),(1862,'Acajete',21,NULL,NULL,NULL),(1863,'Acateno',21,NULL,NULL,NULL),(1864,'Acatlán',21,NULL,NULL,NULL),(1865,'Acatzingo',21,NULL,NULL,NULL),(1866,'Acteopan',21,NULL,NULL,NULL),(1867,'Ahuacatlán',21,NULL,NULL,NULL),(1868,'Ahuatlán',21,NULL,NULL,NULL),(1869,'Ahuazotepec',21,NULL,NULL,NULL),(1870,'Ahuehuetitla',21,NULL,NULL,NULL),(1871,'Ajalpan',21,NULL,NULL,NULL),(1872,'Albino Zertuche',21,NULL,NULL,NULL),(1873,'Aljojuca',21,NULL,NULL,NULL),(1874,'Altepexi',21,NULL,NULL,NULL),(1875,'Amixtlán',21,NULL,NULL,NULL),(1876,'Amozoc',21,NULL,NULL,NULL),(1877,'Aquixtla',21,NULL,NULL,NULL),(1878,'Atempan',21,NULL,NULL,NULL),(1879,'Atexcal',21,NULL,NULL,NULL),(1880,'Atlixco',21,NULL,NULL,NULL),(1881,'Atoyatempan',21,NULL,NULL,NULL),(1882,'Atzala',21,NULL,NULL,NULL),(1883,'Atzitzihuacán',21,NULL,NULL,NULL),(1884,'Atzitzintla',21,NULL,NULL,NULL),(1885,'Axutla',21,NULL,NULL,NULL),(1886,'Ayotoxco de Guerrero',21,NULL,NULL,NULL),(1887,'Calpan',21,NULL,NULL,NULL),(1888,'Caltepec',21,NULL,NULL,NULL),(1889,'Camocuautla',21,NULL,NULL,NULL),(1890,'Caxhuacan',21,NULL,NULL,NULL),(1891,'Coatepec',21,NULL,NULL,NULL),(1892,'Coatzingo',21,NULL,NULL,NULL),(1893,'Cohetzala',21,NULL,NULL,NULL),(1894,'Cohuecan',21,NULL,NULL,NULL),(1895,'Coronango',21,NULL,NULL,NULL),(1896,'Coxcatlán',21,NULL,NULL,NULL),(1897,'Coyomeapan',21,NULL,NULL,NULL),(1898,'Coyotepec',21,NULL,NULL,NULL),(1899,'Cuapiaxtla de Madero',21,NULL,NULL,NULL),(1900,'Cuautempan',21,NULL,NULL,NULL),(1901,'Cuautinchán',21,NULL,NULL,NULL),(1902,'Cuautlancingo',21,NULL,NULL,NULL),(1903,'Cuayuca de Andrade',21,NULL,NULL,NULL),(1904,'Cuetzalan del Progreso',21,NULL,NULL,NULL),(1905,'Cuyoaco',21,NULL,NULL,NULL),(1906,'Chalchicomula de Sesma',21,NULL,NULL,NULL),(1907,'Chapulco',21,NULL,NULL,NULL),(1908,'Chiautla',21,NULL,NULL,NULL),(1909,'Chiautzingo',21,NULL,NULL,NULL),(1910,'Chiconcuautla',21,NULL,NULL,NULL),(1911,'Chichiquila',21,NULL,NULL,NULL),(1912,'Chietla',21,NULL,NULL,NULL),(1913,'Chigmecatitlán',21,NULL,NULL,NULL),(1914,'Chignahuapan',21,NULL,NULL,NULL),(1915,'Chignautla',21,NULL,NULL,NULL),(1916,'Chila',21,NULL,NULL,NULL),(1917,'Chila de la Sal',21,NULL,NULL,NULL),(1918,'Honey',21,NULL,NULL,NULL),(1919,'Chilchotla',21,NULL,NULL,NULL),(1920,'Chinantla',21,NULL,NULL,NULL),(1921,'Domingo Arenas',21,NULL,NULL,NULL),(1922,'Eloxochitlán',21,NULL,NULL,NULL),(1923,'Epatlán',21,NULL,NULL,NULL),(1924,'Esperanza',21,NULL,NULL,NULL),(1925,'Francisco Z. Mena',21,NULL,NULL,NULL),(1926,'General Felipe Ángeles',21,NULL,NULL,NULL),(1927,'Guadalupe',21,NULL,NULL,NULL),(1928,'Guadalupe Victoria',21,NULL,NULL,NULL),(1929,'Hermenegildo Galeana',21,NULL,NULL,NULL),(1930,'Huaquechula',21,NULL,NULL,NULL),(1931,'Huatlatlauca',21,NULL,NULL,NULL),(1932,'Huauchinango',21,NULL,NULL,NULL),(1933,'Huehuetla',21,NULL,NULL,NULL),(1934,'Huehuetlán el Chico',21,NULL,NULL,NULL),(1935,'Huejotzingo',21,NULL,NULL,NULL),(1936,'Hueyapan',21,NULL,NULL,NULL),(1937,'Hueytamalco',21,NULL,NULL,NULL),(1938,'Hueytlalpan',21,NULL,NULL,NULL),(1939,'Huitzilan de Serdán',21,NULL,NULL,NULL),(1940,'Huitziltepec',21,NULL,NULL,NULL),(1941,'Atlequizayan',21,NULL,NULL,NULL),(1942,'Ixcamilpa de Guerrero',21,NULL,NULL,NULL),(1943,'Ixcaquixtla',21,NULL,NULL,NULL),(1944,'Ixtacamaxtitlán',21,NULL,NULL,NULL),(1945,'Ixtepec',21,NULL,NULL,NULL),(1946,'Izúcar de Matamoros',21,NULL,NULL,NULL),(1947,'Jalpan',21,NULL,NULL,NULL),(1948,'Jolalpan',21,NULL,NULL,NULL),(1949,'Jonotla',21,NULL,NULL,NULL),(1950,'Jopala',21,NULL,NULL,NULL),(1951,'Juan C. Bonilla',21,NULL,NULL,NULL),(1952,'Juan Galindo',21,NULL,NULL,NULL),(1953,'Juan N. Méndez',21,NULL,NULL,NULL),(1954,'Lafragua',21,NULL,NULL,NULL),(1955,'Libres',21,NULL,NULL,NULL),(1956,'La Magdalena Tlatlauquitepec',21,NULL,NULL,NULL),(1957,'Mazapiltepec de Juárez',21,NULL,NULL,NULL),(1958,'Mixtla',21,NULL,NULL,NULL),(1959,'Molcaxac',21,NULL,NULL,NULL),(1960,'Cañada Morelos',21,NULL,NULL,NULL),(1961,'Naupan',21,NULL,NULL,NULL),(1962,'Nauzontla',21,NULL,NULL,NULL),(1963,'Nealtican',21,NULL,NULL,NULL),(1964,'Nicolás Bravo',21,NULL,NULL,NULL),(1965,'Nopalucan',21,NULL,NULL,NULL),(1966,'Ocotepec',21,NULL,NULL,NULL),(1967,'Ocoyucan',21,NULL,NULL,NULL),(1968,'Olintla',21,NULL,NULL,NULL),(1969,'Oriental',21,NULL,NULL,NULL),(1970,'Pahuatlán',21,NULL,NULL,NULL),(1971,'Palmar de Bravo',21,NULL,NULL,NULL),(1972,'Pantepec',21,NULL,NULL,NULL),(1973,'Petlalcingo',21,NULL,NULL,NULL),(1974,'Piaxtla',21,NULL,NULL,NULL),(1975,'Puebla',21,NULL,NULL,NULL),(1976,'Quecholac',21,NULL,NULL,NULL),(1977,'Quimixtlán',21,NULL,NULL,NULL),(1978,'Rafael Lara Grajales',21,NULL,NULL,NULL),(1979,'Los Reyes de Juárez',21,NULL,NULL,NULL),(1980,'San Andrés Cholula',21,NULL,NULL,NULL),(1981,'San Antonio Cañada',21,NULL,NULL,NULL),(1982,'San Diego la Mesa Tochimiltzingo',21,NULL,NULL,NULL),(1983,'San Felipe Teotlalcingo',21,NULL,NULL,NULL),(1984,'San Felipe Tepatlán',21,NULL,NULL,NULL),(1985,'San Gabriel Chilac',21,NULL,NULL,NULL),(1986,'San Gregorio Atzompa',21,NULL,NULL,NULL),(1987,'San Jerónimo Tecuanipan',21,NULL,NULL,NULL),(1988,'San Jerónimo Xayacatlán',21,NULL,NULL,NULL),(1989,'San José Chiapa',21,NULL,NULL,NULL),(1990,'San José Miahuatlán',21,NULL,NULL,NULL),(1991,'San Juan Atenco',21,NULL,NULL,NULL),(1992,'San Juan Atzompa',21,NULL,NULL,NULL),(1993,'San Martín Texmelucan',21,NULL,NULL,NULL),(1994,'San Martín Totoltepec',21,NULL,NULL,NULL),(1995,'San Matías Tlalancaleca',21,NULL,NULL,NULL),(1996,'San Miguel Ixitlán',21,NULL,NULL,NULL),(1997,'San Miguel Xoxtla',21,NULL,NULL,NULL),(1998,'San Nicolás Buenos Aires',21,NULL,NULL,NULL),(1999,'San Nicolás de los Ranchos',21,NULL,NULL,NULL),(2000,'San Pablo Anicano',21,NULL,NULL,NULL),(2001,'San Pedro Cholula',21,NULL,NULL,NULL),(2002,'San Pedro Yeloixtlahuaca',21,NULL,NULL,NULL),(2003,'San Salvador el Seco',21,NULL,NULL,NULL),(2004,'San Salvador el Verde',21,NULL,NULL,NULL),(2005,'San Salvador Huixcolotla',21,NULL,NULL,NULL),(2006,'San Sebastián Tlacotepec',21,NULL,NULL,NULL),(2007,'Santa Catarina Tlaltempan',21,NULL,NULL,NULL),(2008,'Santa Inés Ahuatempan',21,NULL,NULL,NULL),(2009,'Santa Isabel Cholula',21,NULL,NULL,NULL),(2010,'Santiago Miahuatlán',21,NULL,NULL,NULL),(2011,'Huehuetlán el Grande',21,NULL,NULL,NULL),(2012,'Santo Tomás Hueyotlipan',21,NULL,NULL,NULL),(2013,'Soltepec',21,NULL,NULL,NULL),(2014,'Tecali de Herrera',21,NULL,NULL,NULL),(2015,'Tecamachalco',21,NULL,NULL,NULL),(2016,'Tecomatlán',21,NULL,NULL,NULL),(2017,'Tehuacán',21,NULL,NULL,NULL),(2018,'Tehuitzingo',21,NULL,NULL,NULL),(2019,'Tenampulco',21,NULL,NULL,NULL),(2020,'Teopantlán',21,NULL,NULL,NULL),(2021,'Teotlalco',21,NULL,NULL,NULL),(2022,'Tepanco de López',21,NULL,NULL,NULL),(2023,'Tepango de Rodríguez',21,NULL,NULL,NULL),(2024,'Tepatlaxco de Hidalgo',21,NULL,NULL,NULL),(2025,'Tepeaca',21,NULL,NULL,NULL),(2026,'Tepemaxalco',21,NULL,NULL,NULL),(2027,'Tepeojuma',21,NULL,NULL,NULL),(2028,'Tepetzintla',21,NULL,NULL,NULL),(2029,'Tepexco',21,NULL,NULL,NULL),(2030,'Tepexi de Rodríguez',21,NULL,NULL,NULL),(2031,'Tepeyahualco',21,NULL,NULL,NULL),(2032,'Tepeyahualco de Cuauhtémoc',21,NULL,NULL,NULL),(2033,'Tetela de Ocampo',21,NULL,NULL,NULL),(2034,'Teteles de Avila Castillo',21,NULL,NULL,NULL),(2035,'Teziutlán',21,NULL,NULL,NULL),(2036,'Tianguismanalco',21,NULL,NULL,NULL),(2037,'Tilapa',21,NULL,NULL,NULL),(2038,'Tlacotepec de Benito Juárez',21,NULL,NULL,NULL),(2039,'Tlacuilotepec',21,NULL,NULL,NULL),(2040,'Tlachichuca',21,NULL,NULL,NULL),(2041,'Tlahuapan',21,NULL,NULL,NULL),(2042,'Tlaltenango',21,NULL,NULL,NULL),(2043,'Tlanepantla',21,NULL,NULL,NULL),(2044,'Tlaola',21,NULL,NULL,NULL),(2045,'Tlapacoya',21,NULL,NULL,NULL),(2046,'Tlapanalá',21,NULL,NULL,NULL),(2047,'Tlatlauquitepec',21,NULL,NULL,NULL),(2048,'Tlaxco',21,NULL,NULL,NULL),(2049,'Tochimilco',21,NULL,NULL,NULL),(2050,'Tochtepec',21,NULL,NULL,NULL),(2051,'Totoltepec de Guerrero',21,NULL,NULL,NULL),(2052,'Tulcingo',21,NULL,NULL,NULL),(2053,'Tuzamapan de Galeana',21,NULL,NULL,NULL),(2054,'Tzicatlacoyan',21,NULL,NULL,NULL),(2055,'Venustiano Carranza',21,NULL,NULL,NULL),(2056,'Vicente Guerrero',21,NULL,NULL,NULL),(2057,'Xayacatlán de Bravo',21,NULL,NULL,NULL),(2058,'Xicotepec',21,NULL,NULL,NULL),(2059,'Xicotlán',21,NULL,NULL,NULL),(2060,'Xiutetelco',21,NULL,NULL,NULL),(2061,'Xochiapulco',21,NULL,NULL,NULL),(2062,'Xochiltepec',21,NULL,NULL,NULL),(2063,'Xochitlán de Vicente Suárez',21,NULL,NULL,NULL),(2064,'Xochitlán Todos Santos',21,NULL,NULL,NULL),(2065,'Yaonáhuac',21,NULL,NULL,NULL),(2066,'Yehualtepec',21,NULL,NULL,NULL),(2067,'Zacapala',21,NULL,NULL,NULL),(2068,'Zacapoaxtla',21,NULL,NULL,NULL),(2069,'Zacatlán',21,NULL,NULL,NULL),(2070,'Zapotitlán',21,NULL,NULL,NULL),(2071,'Zapotitlán de Méndez',21,NULL,NULL,NULL),(2072,'Zaragoza',21,NULL,NULL,NULL),(2073,'Zautla',21,NULL,NULL,NULL),(2074,'Zihuateutla',21,NULL,NULL,NULL),(2075,'Zinacatepec',21,NULL,NULL,NULL),(2076,'Zongozotla',21,NULL,NULL,NULL),(2077,'Zoquiapan',21,NULL,NULL,NULL),(2078,'Zoquitlán',21,NULL,NULL,NULL),(2079,'Amealco de Bonfil',22,NULL,NULL,NULL),(2080,'Pinal de Amoles',22,NULL,NULL,NULL),(2081,'Arroyo Seco',22,NULL,NULL,NULL),(2082,'Cadereyta de Montes',22,NULL,NULL,NULL),(2083,'Colón',22,NULL,NULL,NULL),(2084,'Corregidora',22,NULL,NULL,NULL),(2085,'Ezequiel Montes',22,NULL,NULL,NULL),(2086,'Huimilpan',22,NULL,NULL,NULL),(2087,'Jalpan de Serra',22,NULL,NULL,NULL),(2088,'Landa de Matamoros',22,NULL,NULL,NULL),(2089,'El Marqués',22,NULL,NULL,NULL),(2090,'Pedro Escobedo',22,NULL,NULL,NULL),(2091,'Peñamiller',22,NULL,NULL,NULL),(2092,'Querétaro',22,NULL,NULL,NULL),(2093,'San Joaquín',22,NULL,NULL,NULL),(2094,'San Juan del Río',22,NULL,NULL,NULL),(2095,'Tequisquiapan',22,NULL,NULL,NULL),(2096,'Tolimán',22,NULL,NULL,NULL),(2097,'Cozumel',23,NULL,NULL,NULL),(2098,'Felipe Carrillo Puerto',23,NULL,NULL,NULL),(2099,'Isla Mujeres',23,NULL,NULL,NULL),(2100,'Othón P. Blanco',23,NULL,NULL,NULL),(2101,'Benito Juárez',23,NULL,NULL,NULL),(2102,'José María Morelos',23,NULL,NULL,NULL),(2103,'Lázaro Cárdenas',23,NULL,NULL,NULL),(2104,'Solidaridad',23,NULL,NULL,NULL),(2105,'Tulum',23,NULL,NULL,NULL),(2106,'Bacalar',23,NULL,NULL,NULL),(2107,'Puerto Morelos',23,NULL,NULL,NULL),(2108,'Ahualulco',24,NULL,NULL,NULL),(2109,'Alaquines',24,NULL,NULL,NULL),(2110,'Aquismón',24,NULL,NULL,NULL),(2111,'Armadillo de los Infante',24,NULL,NULL,NULL),(2112,'Cárdenas',24,NULL,NULL,NULL),(2113,'Catorce',24,NULL,NULL,NULL),(2114,'Cedral',24,NULL,NULL,NULL),(2115,'Cerritos',24,NULL,NULL,NULL),(2116,'Cerro de San Pedro',24,NULL,NULL,NULL),(2117,'Ciudad del Maíz',24,NULL,NULL,NULL),(2118,'Ciudad Fernández',24,NULL,NULL,NULL),(2119,'Tancanhuitz',24,NULL,NULL,NULL),(2120,'Ciudad Valles',24,NULL,NULL,NULL),(2121,'Coxcatlán',24,NULL,NULL,NULL),(2122,'Charcas',24,NULL,NULL,NULL),(2123,'Ebano',24,NULL,NULL,NULL),(2124,'Guadalcázar',24,NULL,NULL,NULL),(2125,'Huehuetlán',24,NULL,NULL,NULL),(2126,'Lagunillas',24,NULL,NULL,NULL),(2127,'Matehuala',24,NULL,NULL,NULL),(2128,'Mexquitic de Carmona',24,NULL,NULL,NULL),(2129,'Moctezuma',24,NULL,NULL,NULL),(2130,'Rayón',24,NULL,NULL,NULL),(2131,'Rioverde',24,NULL,NULL,NULL),(2132,'Salinas',24,NULL,NULL,NULL),(2133,'San Antonio',24,NULL,NULL,NULL),(2134,'San Ciro de Acosta',24,NULL,NULL,NULL),(2135,'San Luis Potosí',24,NULL,NULL,NULL),(2136,'San Martín Chalchicuautla',24,NULL,NULL,NULL),(2137,'San Nicolás Tolentino',24,NULL,NULL,NULL),(2138,'Santa Catarina',24,NULL,NULL,NULL),(2139,'Santa María del Río',24,NULL,NULL,NULL),(2140,'Santo Domingo',24,NULL,NULL,NULL),(2141,'San Vicente Tancuayalab',24,NULL,NULL,NULL),(2142,'Soledad de Graciano Sánchez',24,NULL,NULL,NULL),(2143,'Tamasopo',24,NULL,NULL,NULL),(2144,'Tamazunchale',24,NULL,NULL,NULL),(2145,'Tampacán',24,NULL,NULL,NULL),(2146,'Tampamolón Corona',24,NULL,NULL,NULL),(2147,'Tamuín',24,NULL,NULL,NULL),(2148,'Tanlajás',24,NULL,NULL,NULL),(2149,'Tanquián de Escobedo',24,NULL,NULL,NULL),(2150,'Tierra Nueva',24,NULL,NULL,NULL),(2151,'Vanegas',24,NULL,NULL,NULL),(2152,'Venado',24,NULL,NULL,NULL),(2153,'Villa de Arriaga',24,NULL,NULL,NULL),(2154,'Villa de Guadalupe',24,NULL,NULL,NULL),(2155,'Villa de la Paz',24,NULL,NULL,NULL),(2156,'Villa de Ramos',24,NULL,NULL,NULL),(2157,'Villa de Reyes',24,NULL,NULL,NULL),(2158,'Villa Hidalgo',24,NULL,NULL,NULL),(2159,'Villa Juárez',24,NULL,NULL,NULL),(2160,'Axtla de Terrazas',24,NULL,NULL,NULL),(2161,'Xilitla',24,NULL,NULL,NULL),(2162,'Zaragoza',24,NULL,NULL,NULL),(2163,'Villa de Arista',24,NULL,NULL,NULL),(2164,'Matlapa',24,NULL,NULL,NULL),(2165,'El Naranjo',24,NULL,NULL,NULL),(2166,'Ahome',25,NULL,NULL,NULL),(2167,'Angostura',25,NULL,NULL,NULL),(2168,'Badiraguato',25,NULL,NULL,NULL),(2169,'Concordia',25,NULL,NULL,NULL),(2170,'Cosalá',25,NULL,NULL,NULL),(2171,'Culiacán',25,NULL,NULL,NULL),(2172,'Choix',25,NULL,NULL,NULL),(2173,'Elota',25,NULL,NULL,NULL),(2174,'Escuinapa',25,NULL,NULL,NULL),(2175,'El Fuerte',25,NULL,NULL,NULL),(2176,'Guasave',25,NULL,NULL,NULL),(2177,'Mazatlán',25,NULL,NULL,NULL),(2178,'Mocorito',25,NULL,NULL,NULL),(2179,'Rosario',25,NULL,NULL,NULL),(2180,'Salvador Alvarado',25,NULL,NULL,NULL),(2181,'San Ignacio',25,NULL,NULL,NULL),(2182,'Sinaloa',25,NULL,NULL,NULL),(2183,'Navolato',25,NULL,NULL,NULL),(2184,'Aconchi',26,NULL,NULL,NULL),(2185,'Agua Prieta',26,NULL,NULL,NULL),(2186,'Alamos',26,NULL,NULL,NULL),(2187,'Altar',26,NULL,NULL,NULL),(2188,'Arivechi',26,NULL,NULL,NULL),(2189,'Arizpe',26,NULL,NULL,NULL),(2190,'Atil',26,NULL,NULL,NULL),(2191,'Bacadéhuachi',26,NULL,NULL,NULL),(2192,'Bacanora',26,NULL,NULL,NULL),(2193,'Bacerac',26,NULL,NULL,NULL),(2194,'Bacoachi',26,NULL,NULL,NULL),(2195,'Bácum',26,NULL,NULL,NULL),(2196,'Banámichi',26,NULL,NULL,NULL),(2197,'Baviácora',26,NULL,NULL,NULL),(2198,'Bavispe',26,NULL,NULL,NULL),(2199,'Benjamín Hill',26,NULL,NULL,NULL),(2200,'Caborca',26,NULL,NULL,NULL),(2201,'Cajeme',26,NULL,NULL,NULL),(2202,'Cananea',26,NULL,NULL,NULL),(2203,'Carbó',26,NULL,NULL,NULL),(2204,'La Colorada',26,NULL,NULL,NULL),(2205,'Cucurpe',26,NULL,NULL,NULL),(2206,'Cumpas',26,NULL,NULL,NULL),(2207,'Divisaderos',26,NULL,NULL,NULL),(2208,'Empalme',26,NULL,NULL,NULL),(2209,'Etchojoa',26,NULL,NULL,NULL),(2210,'Fronteras',26,NULL,NULL,NULL),(2211,'Granados',26,NULL,NULL,NULL),(2212,'Guaymas',26,NULL,NULL,NULL),(2213,'Hermosillo',26,NULL,NULL,NULL),(2214,'Huachinera',26,NULL,NULL,NULL),(2215,'Huásabas',26,NULL,NULL,NULL),(2216,'Huatabampo',26,NULL,NULL,NULL),(2217,'Huépac',26,NULL,NULL,NULL),(2218,'Imuris',26,NULL,NULL,NULL),(2219,'Magdalena',26,NULL,NULL,NULL),(2220,'Mazatán',26,NULL,NULL,NULL),(2221,'Moctezuma',26,NULL,NULL,NULL),(2222,'Naco',26,NULL,NULL,NULL),(2223,'Nácori Chico',26,NULL,NULL,NULL),(2224,'Nacozari de García',26,NULL,NULL,NULL),(2225,'Navojoa',26,NULL,NULL,NULL),(2226,'Nogales',26,NULL,NULL,NULL),(2227,'Onavas',26,NULL,NULL,NULL),(2228,'Opodepe',26,NULL,NULL,NULL),(2229,'Oquitoa',26,NULL,NULL,NULL),(2230,'Pitiquito',26,NULL,NULL,NULL),(2231,'Puerto Peñasco',26,NULL,NULL,NULL),(2232,'Quiriego',26,NULL,NULL,NULL),(2233,'Rayón',26,NULL,NULL,NULL),(2234,'Rosario',26,NULL,NULL,NULL),(2235,'Sahuaripa',26,NULL,NULL,NULL),(2236,'San Felipe de Jesús',26,NULL,NULL,NULL),(2237,'San Javier',26,NULL,NULL,NULL),(2238,'San Luis Río Colorado',26,NULL,NULL,NULL),(2239,'San Miguel de Horcasitas',26,NULL,NULL,NULL),(2240,'San Pedro de la Cueva',26,NULL,NULL,NULL),(2241,'Santa Ana',26,NULL,NULL,NULL),(2242,'Santa Cruz',26,NULL,NULL,NULL),(2243,'Sáric',26,NULL,NULL,NULL),(2244,'Soyopa',26,NULL,NULL,NULL),(2245,'Suaqui Grande',26,NULL,NULL,NULL),(2246,'Tepache',26,NULL,NULL,NULL),(2247,'Trincheras',26,NULL,NULL,NULL),(2248,'Tubutama',26,NULL,NULL,NULL),(2249,'Ures',26,NULL,NULL,NULL),(2250,'Villa Hidalgo',26,NULL,NULL,NULL),(2251,'Villa Pesqueira',26,NULL,NULL,NULL),(2252,'Yécora',26,NULL,NULL,NULL),(2253,'General Plutarco Elías Calles',26,NULL,NULL,NULL),(2254,'Benito Juárez',26,NULL,NULL,NULL),(2255,'San Ignacio Río Muerto',26,NULL,NULL,NULL),(2256,'Balancán',27,NULL,NULL,NULL),(2257,'Cárdenas',27,NULL,NULL,NULL),(2258,'Centla',27,NULL,NULL,NULL),(2259,'Centro',27,NULL,NULL,NULL),(2260,'Comalcalco',27,NULL,NULL,NULL),(2261,'Cunduacán',27,NULL,NULL,NULL),(2262,'Emiliano Zapata',27,NULL,NULL,NULL),(2263,'Huimanguillo',27,NULL,NULL,NULL),(2264,'Jalapa',27,NULL,NULL,NULL),(2265,'Jalpa de Méndez',27,NULL,NULL,NULL),(2266,'Jonuta',27,NULL,NULL,NULL),(2267,'Macuspana',27,NULL,NULL,NULL),(2268,'Nacajuca',27,NULL,NULL,NULL),(2269,'Paraíso',27,NULL,NULL,NULL),(2270,'Tacotalpa',27,NULL,NULL,NULL),(2271,'Teapa',27,NULL,NULL,NULL),(2272,'Tenosique',27,NULL,NULL,NULL),(2273,'Abasolo',28,NULL,NULL,NULL),(2274,'Aldama',28,NULL,NULL,NULL),(2275,'Altamira',28,NULL,NULL,NULL),(2276,'Antiguo Morelos',28,NULL,NULL,NULL),(2277,'Burgos',28,NULL,NULL,NULL),(2278,'Bustamante',28,NULL,NULL,NULL),(2279,'Camargo',28,NULL,NULL,NULL),(2280,'Casas',28,NULL,NULL,NULL),(2281,'Ciudad Madero',28,NULL,NULL,NULL),(2282,'Cruillas',28,NULL,NULL,NULL),(2283,'Gómez Farías',28,NULL,NULL,NULL),(2284,'González',28,NULL,NULL,NULL),(2285,'Güémez',28,NULL,NULL,NULL),(2286,'Guerrero',28,NULL,NULL,NULL),(2287,'Gustavo Díaz Ordaz',28,NULL,NULL,NULL),(2288,'Hidalgo',28,NULL,NULL,NULL),(2289,'Jaumave',28,NULL,NULL,NULL),(2290,'Jiménez',28,NULL,NULL,NULL),(2291,'Llera',28,NULL,NULL,NULL),(2292,'Mainero',28,NULL,NULL,NULL),(2293,'El Mante',28,NULL,NULL,NULL),(2294,'Matamoros',28,NULL,NULL,NULL),(2295,'Méndez',28,NULL,NULL,NULL),(2296,'Mier',28,NULL,NULL,NULL),(2297,'Miguel Alemán',28,NULL,NULL,NULL),(2298,'Miquihuana',28,NULL,NULL,NULL),(2299,'Nuevo Laredo',28,NULL,NULL,NULL),(2300,'Nuevo Morelos',28,NULL,NULL,NULL),(2301,'Ocampo',28,NULL,NULL,NULL),(2302,'Padilla',28,NULL,NULL,NULL),(2303,'Palmillas',28,NULL,NULL,NULL),(2304,'Reynosa',28,NULL,NULL,NULL),(2305,'Río Bravo',28,NULL,NULL,NULL),(2306,'San Carlos',28,NULL,NULL,NULL),(2307,'San Fernando',28,NULL,NULL,NULL),(2308,'San Nicolás',28,NULL,NULL,NULL),(2309,'Soto la Marina',28,NULL,NULL,NULL),(2310,'Tampico',28,NULL,NULL,NULL),(2311,'Tula',28,NULL,NULL,NULL),(2312,'Valle Hermoso',28,NULL,NULL,NULL),(2313,'Victoria',28,NULL,NULL,NULL),(2314,'Villagrán',28,NULL,NULL,NULL),(2315,'Xicoténcatl',28,NULL,NULL,NULL),(2316,'Amaxac de Guerrero',29,NULL,NULL,NULL),(2317,'Apetatitlán de Antonio Carvajal',29,NULL,NULL,NULL),(2318,'Atlangatepec',29,NULL,NULL,NULL),(2319,'Atltzayanca',29,NULL,NULL,NULL),(2320,'Apizaco',29,NULL,NULL,NULL),(2321,'Calpulalpan',29,NULL,NULL,NULL),(2322,'El Carmen Tequexquitla',29,NULL,NULL,NULL),(2323,'Cuapiaxtla',29,NULL,NULL,NULL),(2324,'Cuaxomulco',29,NULL,NULL,NULL),(2325,'Chiautempan',29,NULL,NULL,NULL),(2326,'Muñoz de Domingo Arenas',29,NULL,NULL,NULL),(2327,'Españita',29,NULL,NULL,NULL),(2328,'Huamantla',29,NULL,NULL,NULL),(2329,'Hueyotlipan',29,NULL,NULL,NULL),(2330,'Ixtacuixtla de Mariano Matamoros',29,NULL,NULL,NULL),(2331,'Ixtenco',29,NULL,NULL,NULL),(2332,'Mazatecochco de José María Morelos',29,NULL,NULL,NULL),(2333,'Contla de Juan Cuamatzi',29,NULL,NULL,NULL),(2334,'Tepetitla de Lardizábal',29,NULL,NULL,NULL),(2335,'Sanctórum de Lázaro Cárdenas',29,NULL,NULL,NULL),(2336,'Nanacamilpa de Mariano Arista',29,NULL,NULL,NULL),(2337,'Acuamanala de Miguel Hidalgo',29,NULL,NULL,NULL),(2338,'Natívitas',29,NULL,NULL,NULL),(2339,'Panotla',29,NULL,NULL,NULL),(2340,'San Pablo del Monte',29,NULL,NULL,NULL),(2341,'Santa Cruz Tlaxcala',29,NULL,NULL,NULL),(2342,'Tenancingo',29,NULL,NULL,NULL),(2343,'Teolocholco',29,NULL,NULL,NULL),(2344,'Tepeyanco',29,NULL,NULL,NULL),(2345,'Terrenate',29,NULL,NULL,NULL),(2346,'Tetla de la Solidaridad',29,NULL,NULL,NULL),(2347,'Tetlatlahuca',29,NULL,NULL,NULL),(2348,'Tlaxcala',29,NULL,NULL,NULL),(2349,'Tlaxco',29,NULL,NULL,NULL),(2350,'Tocatlán',29,NULL,NULL,NULL),(2351,'Totolac',29,NULL,NULL,NULL),(2352,'Ziltlaltépec de Trinidad Sánchez Santos',29,NULL,NULL,NULL),(2353,'Tzompantepec',29,NULL,NULL,NULL),(2354,'Xaloztoc',29,NULL,NULL,NULL),(2355,'Xaltocan',29,NULL,NULL,NULL),(2356,'Papalotla de Xicohténcatl',29,NULL,NULL,NULL),(2357,'Xicohtzinco',29,NULL,NULL,NULL),(2358,'Yauhquemehcan',29,NULL,NULL,NULL),(2359,'Zacatelco',29,NULL,NULL,NULL),(2360,'Benito Juárez',29,NULL,NULL,NULL),(2361,'Emiliano Zapata',29,NULL,NULL,NULL),(2362,'Lázaro Cárdenas',29,NULL,NULL,NULL),(2363,'La Magdalena Tlaltelulco',29,NULL,NULL,NULL),(2364,'San Damián Texóloc',29,NULL,NULL,NULL),(2365,'San Francisco Tetlanohcan',29,NULL,NULL,NULL),(2366,'San Jerónimo Zacualpan',29,NULL,NULL,NULL),(2367,'San José Teacalco',29,NULL,NULL,NULL),(2368,'San Juan Huactzinco',29,NULL,NULL,NULL),(2369,'San Lorenzo Axocomanitla',29,NULL,NULL,NULL),(2370,'San Lucas Tecopilco',29,NULL,NULL,NULL),(2371,'Santa Ana Nopalucan',29,NULL,NULL,NULL),(2372,'Santa Apolonia Teacalco',29,NULL,NULL,NULL),(2373,'Santa Catarina Ayometla',29,NULL,NULL,NULL),(2374,'Santa Cruz Quilehtla',29,NULL,NULL,NULL),(2375,'Santa Isabel Xiloxoxtla',29,NULL,NULL,NULL),(2376,'Acajete',30,NULL,NULL,NULL),(2377,'Acatlán',30,NULL,NULL,NULL),(2378,'Acayucan',30,NULL,NULL,NULL),(2379,'Actopan',30,NULL,NULL,NULL),(2380,'Acula',30,NULL,NULL,NULL),(2381,'Acultzingo',30,NULL,NULL,NULL),(2382,'Camarón de Tejeda',30,NULL,NULL,NULL),(2383,'Alpatláhuac',30,NULL,NULL,NULL),(2384,'Alto Lucero de Gutiérrez Barrios',30,NULL,NULL,NULL),(2385,'Altotonga',30,NULL,NULL,NULL),(2386,'Alvarado',30,NULL,NULL,NULL),(2387,'Amatitlán',30,NULL,NULL,NULL),(2388,'Naranjos Amatlán',30,NULL,NULL,NULL),(2389,'Amatlán de los Reyes',30,NULL,NULL,NULL),(2390,'Angel R. Cabada',30,NULL,NULL,NULL),(2391,'La Antigua',30,NULL,NULL,NULL),(2392,'Apazapan',30,NULL,NULL,NULL),(2393,'Aquila',30,NULL,NULL,NULL),(2394,'Astacinga',30,NULL,NULL,NULL),(2395,'Atlahuilco',30,NULL,NULL,NULL),(2396,'Atoyac',30,NULL,NULL,NULL),(2397,'Atzacan',30,NULL,NULL,NULL),(2398,'Atzalan',30,NULL,NULL,NULL),(2399,'Tlaltetela',30,NULL,NULL,NULL),(2400,'Ayahualulco',30,NULL,NULL,NULL),(2401,'Banderilla',30,NULL,NULL,NULL),(2402,'Benito Juárez',30,NULL,NULL,NULL),(2403,'Boca del Río',30,NULL,NULL,NULL),(2404,'Calcahualco',30,NULL,NULL,NULL),(2405,'Camerino Z. Mendoza',30,NULL,NULL,NULL),(2406,'Carrillo Puerto',30,NULL,NULL,NULL),(2407,'Catemaco',30,NULL,NULL,NULL),(2408,'Cazones de Herrera',30,NULL,NULL,NULL),(2409,'Cerro Azul',30,NULL,NULL,NULL),(2410,'Citlaltépetl',30,NULL,NULL,NULL),(2411,'Coacoatzintla',30,NULL,NULL,NULL),(2412,'Coahuitlán',30,NULL,NULL,NULL),(2413,'Coatepec',30,NULL,NULL,NULL),(2414,'Coatzacoalcos',30,NULL,NULL,NULL),(2415,'Coatzintla',30,NULL,NULL,NULL),(2416,'Coetzala',30,NULL,NULL,NULL),(2417,'Colipa',30,NULL,NULL,NULL),(2418,'Comapa',30,NULL,NULL,NULL),(2419,'Córdoba',30,NULL,NULL,NULL),(2420,'Cosamaloapan de Carpio',30,NULL,NULL,NULL),(2421,'Cosautlán de Carvajal',30,NULL,NULL,NULL),(2422,'Coscomatepec',30,NULL,NULL,NULL),(2423,'Cosoleacaque',30,NULL,NULL,NULL),(2424,'Cotaxtla',30,NULL,NULL,NULL),(2425,'Coxquihui',30,NULL,NULL,NULL),(2426,'Coyutla',30,NULL,NULL,NULL),(2427,'Cuichapa',30,NULL,NULL,NULL),(2428,'Cuitláhuac',30,NULL,NULL,NULL),(2429,'Chacaltianguis',30,NULL,NULL,NULL),(2430,'Chalma',30,NULL,NULL,NULL),(2431,'Chiconamel',30,NULL,NULL,NULL),(2432,'Chiconquiaco',30,NULL,NULL,NULL),(2433,'Chicontepec',30,NULL,NULL,NULL),(2434,'Chinameca',30,NULL,NULL,NULL),(2435,'Chinampa de Gorostiza',30,NULL,NULL,NULL),(2436,'Las Choapas',30,NULL,NULL,NULL),(2437,'Chocamán',30,NULL,NULL,NULL),(2438,'Chontla',30,NULL,NULL,NULL),(2439,'Chumatlán',30,NULL,NULL,NULL),(2440,'Emiliano Zapata',30,NULL,NULL,NULL),(2441,'Espinal',30,NULL,NULL,NULL),(2442,'Filomeno Mata',30,NULL,NULL,NULL),(2443,'Fortín',30,NULL,NULL,NULL),(2444,'Gutiérrez Zamora',30,NULL,NULL,NULL),(2445,'Hidalgotitlán',30,NULL,NULL,NULL),(2446,'Huatusco',30,NULL,NULL,NULL),(2447,'Huayacocotla',30,NULL,NULL,NULL),(2448,'Hueyapan de Ocampo',30,NULL,NULL,NULL),(2449,'Huiloapan de Cuauhtémoc',30,NULL,NULL,NULL),(2450,'Ignacio de la Llave',30,NULL,NULL,NULL),(2451,'Ilamatlán',30,NULL,NULL,NULL),(2452,'Isla',30,NULL,NULL,NULL),(2453,'Ixcatepec',30,NULL,NULL,NULL),(2454,'Ixhuacán de los Reyes',30,NULL,NULL,NULL),(2455,'Ixhuatlán del Café',30,NULL,NULL,NULL),(2456,'Ixhuatlancillo',30,NULL,NULL,NULL),(2457,'Ixhuatlán del Sureste',30,NULL,NULL,NULL),(2458,'Ixhuatlán de Madero',30,NULL,NULL,NULL),(2459,'Ixmatlahuacan',30,NULL,NULL,NULL),(2460,'Ixtaczoquitlán',30,NULL,NULL,NULL),(2461,'Jalacingo',30,NULL,NULL,NULL),(2462,'Xalapa',30,NULL,NULL,NULL),(2463,'Jalcomulco',30,NULL,NULL,NULL),(2464,'Jáltipan',30,NULL,NULL,NULL),(2465,'Jamapa',30,NULL,NULL,NULL),(2466,'Jesús Carranza',30,NULL,NULL,NULL),(2467,'Xico',30,NULL,NULL,NULL),(2468,'Jilotepec',30,NULL,NULL,NULL),(2469,'Juan Rodríguez Clara',30,NULL,NULL,NULL),(2470,'Juchique de Ferrer',30,NULL,NULL,NULL),(2471,'Landero y Coss',30,NULL,NULL,NULL),(2472,'Lerdo de Tejada',30,NULL,NULL,NULL),(2473,'Magdalena',30,NULL,NULL,NULL),(2474,'Maltrata',30,NULL,NULL,NULL),(2475,'Manlio Fabio Altamirano',30,NULL,NULL,NULL),(2476,'Mariano Escobedo',30,NULL,NULL,NULL),(2477,'Martínez de la Torre',30,NULL,NULL,NULL),(2478,'Mecatlán',30,NULL,NULL,NULL),(2479,'Mecayapan',30,NULL,NULL,NULL),(2480,'Medellín de Bravo',30,NULL,NULL,NULL),(2481,'Miahuatlán',30,NULL,NULL,NULL),(2482,'Las Minas',30,NULL,NULL,NULL),(2483,'Minatitlán',30,NULL,NULL,NULL),(2484,'Misantla',30,NULL,NULL,NULL),(2485,'Mixtla de Altamirano',30,NULL,NULL,NULL),(2486,'Moloacán',30,NULL,NULL,NULL),(2487,'Naolinco',30,NULL,NULL,NULL),(2488,'Naranjal',30,NULL,NULL,NULL),(2489,'Nautla',30,NULL,NULL,NULL),(2490,'Nogales',30,NULL,NULL,NULL),(2491,'Oluta',30,NULL,NULL,NULL),(2492,'Omealca',30,NULL,NULL,NULL),(2493,'Orizaba',30,NULL,NULL,NULL),(2494,'Otatitlán',30,NULL,NULL,NULL),(2495,'Oteapan',30,NULL,NULL,NULL),(2496,'Ozuluama de Mascareñas',30,NULL,NULL,NULL),(2497,'Pajapan',30,NULL,NULL,NULL),(2498,'Pánuco',30,NULL,NULL,NULL),(2499,'Papantla',30,NULL,NULL,NULL),(2500,'Paso del Macho',30,NULL,NULL,NULL),(2501,'Paso de Ovejas',30,NULL,NULL,NULL),(2502,'La Perla',30,NULL,NULL,NULL),(2503,'Perote',30,NULL,NULL,NULL),(2504,'Platón Sánchez',30,NULL,NULL,NULL),(2505,'Playa Vicente',30,NULL,NULL,NULL),(2506,'Poza Rica de Hidalgo',30,NULL,NULL,NULL),(2507,'Las Vigas de Ramírez',30,NULL,NULL,NULL),(2508,'Pueblo Viejo',30,NULL,NULL,NULL),(2509,'Puente Nacional',30,NULL,NULL,NULL),(2510,'Rafael Delgado',30,NULL,NULL,NULL),(2511,'Rafael Lucio',30,NULL,NULL,NULL),(2512,'Los Reyes',30,NULL,NULL,NULL),(2513,'Río Blanco',30,NULL,NULL,NULL),(2514,'Saltabarranca',30,NULL,NULL,NULL),(2515,'San Andrés Tenejapan',30,NULL,NULL,NULL),(2516,'San Andrés Tuxtla',30,NULL,NULL,NULL),(2517,'San Juan Evangelista',30,NULL,NULL,NULL),(2518,'Santiago Tuxtla',30,NULL,NULL,NULL),(2519,'Sayula de Alemán',30,NULL,NULL,NULL),(2520,'Soconusco',30,NULL,NULL,NULL),(2521,'Sochiapa',30,NULL,NULL,NULL),(2522,'Soledad Atzompa',30,NULL,NULL,NULL),(2523,'Soledad de Doblado',30,NULL,NULL,NULL),(2524,'Soteapan',30,NULL,NULL,NULL),(2525,'Tamalín',30,NULL,NULL,NULL),(2526,'Tamiahua',30,NULL,NULL,NULL),(2527,'Tampico Alto',30,NULL,NULL,NULL),(2528,'Tancoco',30,NULL,NULL,NULL),(2529,'Tantima',30,NULL,NULL,NULL),(2530,'Tantoyuca',30,NULL,NULL,NULL),(2531,'Tatatila',30,NULL,NULL,NULL),(2532,'Castillo de Teayo',30,NULL,NULL,NULL),(2533,'Tecolutla',30,NULL,NULL,NULL),(2534,'Tehuipango',30,NULL,NULL,NULL),(2535,'Álamo Temapache',30,NULL,NULL,NULL),(2536,'Tempoal',30,NULL,NULL,NULL),(2537,'Tenampa',30,NULL,NULL,NULL),(2538,'Tenochtitlán',30,NULL,NULL,NULL),(2539,'Teocelo',30,NULL,NULL,NULL),(2540,'Tepatlaxco',30,NULL,NULL,NULL),(2541,'Tepetlán',30,NULL,NULL,NULL),(2542,'Tepetzintla',30,NULL,NULL,NULL),(2543,'Tequila',30,NULL,NULL,NULL),(2544,'José Azueta',30,NULL,NULL,NULL),(2545,'Texcatepec',30,NULL,NULL,NULL),(2546,'Texhuacán',30,NULL,NULL,NULL),(2547,'Texistepec',30,NULL,NULL,NULL),(2548,'Tezonapa',30,NULL,NULL,NULL),(2549,'Tierra Blanca',30,NULL,NULL,NULL),(2550,'Tihuatlán',30,NULL,NULL,NULL),(2551,'Tlacojalpan',30,NULL,NULL,NULL),(2552,'Tlacolulan',30,NULL,NULL,NULL),(2553,'Tlacotalpan',30,NULL,NULL,NULL),(2554,'Tlacotepec de Mejía',30,NULL,NULL,NULL),(2555,'Tlachichilco',30,NULL,NULL,NULL),(2556,'Tlalixcoyan',30,NULL,NULL,NULL),(2557,'Tlalnelhuayocan',30,NULL,NULL,NULL),(2558,'Tlapacoyan',30,NULL,NULL,NULL),(2559,'Tlaquilpa',30,NULL,NULL,NULL),(2560,'Tlilapan',30,NULL,NULL,NULL),(2561,'Tomatlán',30,NULL,NULL,NULL),(2562,'Tonayán',30,NULL,NULL,NULL),(2563,'Totutla',30,NULL,NULL,NULL),(2564,'Tuxpan',30,NULL,NULL,NULL),(2565,'Tuxtilla',30,NULL,NULL,NULL),(2566,'Ursulo Galván',30,NULL,NULL,NULL),(2567,'Vega de Alatorre',30,NULL,NULL,NULL),(2568,'Veracruz',30,NULL,NULL,NULL),(2569,'Villa Aldama',30,NULL,NULL,NULL),(2570,'Xoxocotla',30,NULL,NULL,NULL),(2571,'Yanga',30,NULL,NULL,NULL),(2572,'Yecuatla',30,NULL,NULL,NULL),(2573,'Zacualpan',30,NULL,NULL,NULL),(2574,'Zaragoza',30,NULL,NULL,NULL),(2575,'Zentla',30,NULL,NULL,NULL),(2576,'Zongolica',30,NULL,NULL,NULL),(2577,'Zontecomatlán de López y Fuentes',30,NULL,NULL,NULL),(2578,'Zozocolco de Hidalgo',30,NULL,NULL,NULL),(2579,'Agua Dulce',30,NULL,NULL,NULL),(2580,'El Higo',30,NULL,NULL,NULL),(2581,'Nanchital de Lázaro Cárdenas del Río',30,NULL,NULL,NULL),(2582,'Tres Valles',30,NULL,NULL,NULL),(2583,'Carlos A. Carrillo',30,NULL,NULL,NULL),(2584,'Tatahuicapan de Juárez',30,NULL,NULL,NULL),(2585,'Uxpanapa',30,NULL,NULL,NULL),(2586,'San Rafael',30,NULL,NULL,NULL),(2587,'Santiago Sochiapan',30,NULL,NULL,NULL),(2588,'Abalá',31,NULL,NULL,NULL),(2589,'Acanceh',31,NULL,NULL,NULL),(2590,'Akil',31,NULL,NULL,NULL),(2591,'Baca',31,NULL,NULL,NULL),(2592,'Bokobá',31,NULL,NULL,NULL),(2593,'Buctzotz',31,NULL,NULL,NULL),(2594,'Cacalchén',31,NULL,NULL,NULL),(2595,'Calotmul',31,NULL,NULL,NULL),(2596,'Cansahcab',31,NULL,NULL,NULL),(2597,'Cantamayec',31,NULL,NULL,NULL),(2598,'Celestún',31,NULL,NULL,NULL),(2599,'Cenotillo',31,NULL,NULL,NULL),(2600,'Conkal',31,NULL,NULL,NULL),(2601,'Cuncunul',31,NULL,NULL,NULL),(2602,'Cuzamá',31,NULL,NULL,NULL),(2603,'Chacsinkín',31,NULL,NULL,NULL),(2604,'Chankom',31,NULL,NULL,NULL),(2605,'Chapab',31,NULL,NULL,NULL),(2606,'Chemax',31,NULL,NULL,NULL),(2607,'Chicxulub Pueblo',31,NULL,NULL,NULL),(2608,'Chichimilá',31,NULL,NULL,NULL),(2609,'Chikindzonot',31,NULL,NULL,NULL),(2610,'Chocholá',31,NULL,NULL,NULL),(2611,'Chumayel',31,NULL,NULL,NULL),(2612,'Dzán',31,NULL,NULL,NULL),(2613,'Dzemul',31,NULL,NULL,NULL),(2614,'Dzidzantún',31,NULL,NULL,NULL),(2615,'Dzilam de Bravo',31,NULL,NULL,NULL),(2616,'Dzilam González',31,NULL,NULL,NULL),(2617,'Dzitás',31,NULL,NULL,NULL),(2618,'Dzoncauich',31,NULL,NULL,NULL),(2619,'Espita',31,NULL,NULL,NULL),(2620,'Halachó',31,NULL,NULL,NULL),(2621,'Hocabá',31,NULL,NULL,NULL),(2622,'Hoctún',31,NULL,NULL,NULL),(2623,'Homún',31,NULL,NULL,NULL),(2624,'Huhí',31,NULL,NULL,NULL),(2625,'Hunucmá',31,NULL,NULL,NULL),(2626,'Ixil',31,NULL,NULL,NULL),(2627,'Izamal',31,NULL,NULL,NULL),(2628,'Kanasín',31,NULL,NULL,NULL),(2629,'Kantunil',31,NULL,NULL,NULL),(2630,'Kaua',31,NULL,NULL,NULL),(2631,'Kinchil',31,NULL,NULL,NULL),(2632,'Kopomá',31,NULL,NULL,NULL),(2633,'Mama',31,NULL,NULL,NULL),(2634,'Maní',31,NULL,NULL,NULL),(2635,'Maxcanú',31,NULL,NULL,NULL),(2636,'Mayapán',31,NULL,NULL,NULL),(2637,'Mérida',31,NULL,NULL,NULL),(2638,'Mocochá',31,NULL,NULL,NULL),(2639,'Motul',31,NULL,NULL,NULL),(2640,'Muna',31,NULL,NULL,NULL),(2641,'Muxupip',31,NULL,NULL,NULL),(2642,'Opichén',31,NULL,NULL,NULL),(2643,'Oxkutzcab',31,NULL,NULL,NULL),(2644,'Panabá',31,NULL,NULL,NULL),(2645,'Peto',31,NULL,NULL,NULL),(2646,'Progreso',31,NULL,NULL,NULL),(2647,'Quintana Roo',31,NULL,NULL,NULL),(2648,'Río Lagartos',31,NULL,NULL,NULL),(2649,'Sacalum',31,NULL,NULL,NULL),(2650,'Samahil',31,NULL,NULL,NULL),(2651,'Sanahcat',31,NULL,NULL,NULL),(2652,'San Felipe',31,NULL,NULL,NULL),(2653,'Santa Elena',31,NULL,NULL,NULL),(2654,'Seyé',31,NULL,NULL,NULL),(2655,'Sinanché',31,NULL,NULL,NULL),(2656,'Sotuta',31,NULL,NULL,NULL),(2657,'Sucilá',31,NULL,NULL,NULL),(2658,'Sudzal',31,NULL,NULL,NULL),(2659,'Suma',31,NULL,NULL,NULL),(2660,'Tahdziú',31,NULL,NULL,NULL),(2661,'Tahmek',31,NULL,NULL,NULL),(2662,'Teabo',31,NULL,NULL,NULL),(2663,'Tecoh',31,NULL,NULL,NULL),(2664,'Tekal de Venegas',31,NULL,NULL,NULL),(2665,'Tekantó',31,NULL,NULL,NULL),(2666,'Tekax',31,NULL,NULL,NULL),(2667,'Tekit',31,NULL,NULL,NULL),(2668,'Tekom',31,NULL,NULL,NULL),(2669,'Telchac Pueblo',31,NULL,NULL,NULL),(2670,'Telchac Puerto',31,NULL,NULL,NULL),(2671,'Temax',31,NULL,NULL,NULL),(2672,'Temozón',31,NULL,NULL,NULL),(2673,'Tepakán',31,NULL,NULL,NULL),(2674,'Tetiz',31,NULL,NULL,NULL),(2675,'Teya',31,NULL,NULL,NULL),(2676,'Ticul',31,NULL,NULL,NULL),(2677,'Timucuy',31,NULL,NULL,NULL),(2678,'Tinum',31,NULL,NULL,NULL),(2679,'Tixcacalcupul',31,NULL,NULL,NULL),(2680,'Tixkokob',31,NULL,NULL,NULL),(2681,'Tixmehuac',31,NULL,NULL,NULL),(2682,'Tixpéhual',31,NULL,NULL,NULL),(2683,'Tizimín',31,NULL,NULL,NULL),(2684,'Tunkás',31,NULL,NULL,NULL),(2685,'Tzucacab',31,NULL,NULL,NULL),(2686,'Uayma',31,NULL,NULL,NULL),(2687,'Ucú',31,NULL,NULL,NULL),(2688,'Umán',31,NULL,NULL,NULL),(2689,'Valladolid',31,NULL,NULL,NULL),(2690,'Xocchel',31,NULL,NULL,NULL),(2691,'Yaxcabá',31,NULL,NULL,NULL),(2692,'Yaxkukul',31,NULL,NULL,NULL),(2693,'Yobaín',31,NULL,NULL,NULL),(2694,'Apozol',32,NULL,NULL,NULL),(2695,'Apulco',32,NULL,NULL,NULL),(2696,'Atolinga',32,NULL,NULL,NULL),(2697,'Benito Juárez',32,NULL,NULL,NULL),(2698,'Calera',32,NULL,NULL,NULL),(2699,'Cañitas de Felipe Pescador',32,NULL,NULL,NULL),(2700,'Concepción del Oro',32,NULL,NULL,NULL),(2701,'Cuauhtémoc',32,NULL,NULL,NULL),(2702,'Chalchihuites',32,NULL,NULL,NULL),(2703,'Fresnillo',32,NULL,NULL,NULL),(2704,'Trinidad García de la Cadena',32,NULL,NULL,NULL),(2705,'Genaro Codina',32,NULL,NULL,NULL),(2706,'General Enrique Estrada',32,NULL,NULL,NULL),(2707,'General Francisco R. Murguía',32,NULL,NULL,NULL),(2708,'El Plateado de Joaquín Amaro',32,NULL,NULL,NULL),(2709,'General Pánfilo Natera',32,NULL,NULL,NULL),(2710,'Guadalupe',32,NULL,NULL,NULL),(2711,'Huanusco',32,NULL,NULL,NULL),(2712,'Jalpa',32,NULL,NULL,NULL),(2713,'Jerez',32,NULL,NULL,NULL),(2714,'Jiménez del Teul',32,NULL,NULL,NULL),(2715,'Juan Aldama',32,NULL,NULL,NULL),(2716,'Juchipila',32,NULL,NULL,NULL),(2717,'Loreto',32,NULL,NULL,NULL),(2718,'Luis Moya',32,NULL,NULL,NULL),(2719,'Mazapil',32,NULL,NULL,NULL),(2720,'Melchor Ocampo',32,NULL,NULL,NULL),(2721,'Mezquital del Oro',32,NULL,NULL,NULL),(2722,'Miguel Auza',32,NULL,NULL,NULL),(2723,'Momax',32,NULL,NULL,NULL),(2724,'Monte Escobedo',32,NULL,NULL,NULL),(2725,'Morelos',32,NULL,NULL,NULL),(2726,'Moyahua de Estrada',32,NULL,NULL,NULL),(2727,'Nochistlán de Mejía',32,NULL,NULL,NULL),(2728,'Noria de Ángeles',32,NULL,NULL,NULL),(2729,'Ojocaliente',32,NULL,NULL,NULL),(2730,'Pánuco',32,NULL,NULL,NULL),(2731,'Pinos',32,NULL,NULL,NULL),(2732,'Río Grande',32,NULL,NULL,NULL),(2733,'Sain Alto',32,NULL,NULL,NULL),(2734,'El Salvador',32,NULL,NULL,NULL),(2735,'Sombrerete',32,NULL,NULL,NULL),(2736,'Susticacán',32,NULL,NULL,NULL),(2737,'Tabasco',32,NULL,NULL,NULL),(2738,'Tepechitlán',32,NULL,NULL,NULL),(2739,'Tepetongo',32,NULL,NULL,NULL),(2740,'Teúl de González Ortega',32,NULL,NULL,NULL),(2741,'Tlaltenango de Sánchez Román',32,NULL,NULL,NULL),(2742,'Valparaíso',32,NULL,NULL,NULL),(2743,'Vetagrande',32,NULL,NULL,NULL),(2744,'Villa de Cos',32,NULL,NULL,NULL),(2745,'Villa García',32,NULL,NULL,NULL),(2746,'Villa González Ortega',32,NULL,NULL,NULL),(2747,'Villa Hidalgo',32,NULL,NULL,NULL),(2748,'Villanueva',32,NULL,NULL,NULL),(2749,'Zacatecas',32,NULL,NULL,NULL),(2750,'Trancoso',32,NULL,NULL,NULL),(2751,'Santa María de la Paz',32,NULL,NULL,NULL);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacion`
--

DROP TABLE IF EXISTS `ocupacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ocupacion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacion`
--

LOCK TABLES `ocupacion` WRITE;
/*!40000 ALTER TABLE `ocupacion` DISABLE KEYS */;
INSERT INTO `ocupacion` VALUES (1,'Contructor',1,NULL,NULL),(2,'Chofer',1,NULL,NULL),(3,'Policia',1,NULL,NULL);
/*!40000 ALTER TABLE `ocupacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_aprencion`
--

DROP TABLE IF EXISTS `orden_aprencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_aprencion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_aprencion`
--

LOCK TABLES `orden_aprencion` WRITE;
/*!40000 ALTER TABLE `orden_aprencion` DISABLE KEYS */;
INSERT INTO `orden_aprencion` VALUES (1,'2024-01-01','12:00:00','Observacion1',1,NULL,NULL);
/*!40000 ALTER TABLE `orden_aprencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Afganistán',NULL,NULL,NULL),(2,'Albania',NULL,NULL,NULL),(3,'Alemania',NULL,NULL,NULL),(4,'Andorra',NULL,NULL,NULL),(5,'Angola',NULL,NULL,NULL),(6,'Antigua y Barbuda',NULL,NULL,NULL),(7,'Arabia Saudita',NULL,NULL,NULL),(8,'Argelia',NULL,NULL,NULL),(9,'Argentina',NULL,NULL,NULL),(10,'Armenia',NULL,NULL,NULL),(11,'Australia',NULL,NULL,NULL),(12,'Austria',NULL,NULL,NULL),(13,'Azerbaiyán',NULL,NULL,NULL),(14,'Bahamas',NULL,NULL,NULL),(15,'Bangladés',NULL,NULL,NULL),(16,'Barbados',NULL,NULL,NULL),(17,'Baréin',NULL,NULL,NULL),(18,'Bélgica',NULL,NULL,NULL),(19,'Belice',NULL,NULL,NULL),(20,'Benín',NULL,NULL,NULL),(21,'Bielorrusia',NULL,NULL,NULL),(22,'Birmania',NULL,NULL,NULL),(23,'Bolivia',NULL,NULL,NULL),(24,'Bosnia y Herzegovina',NULL,NULL,NULL),(25,'Botsuana',NULL,NULL,NULL),(26,'Brasil',NULL,NULL,NULL),(27,'Brunéi',NULL,NULL,NULL),(28,'Bulgaria',NULL,NULL,NULL),(29,'Burkina Faso',NULL,NULL,NULL),(30,'Burundi',NULL,NULL,NULL),(31,'Bután',NULL,NULL,NULL),(32,'Cabo Verde',NULL,NULL,NULL),(33,'Camboya',NULL,NULL,NULL),(34,'Camerún',NULL,NULL,NULL),(35,'Canadá',NULL,NULL,NULL),(36,'Catar',NULL,NULL,NULL),(37,'Chad',NULL,NULL,NULL),(38,'Chile',NULL,NULL,NULL),(39,'China',NULL,NULL,NULL),(40,'Chipre',NULL,NULL,NULL),(41,'Ciudad del Vaticano',NULL,NULL,NULL),(42,'Colombia',NULL,NULL,NULL),(43,'Comoras',NULL,NULL,NULL),(44,'Corea del Norte',NULL,NULL,NULL),(45,'Corea del Sur',NULL,NULL,NULL),(46,'Costa de Marfil',NULL,NULL,NULL),(47,'Costa Rica',NULL,NULL,NULL),(48,'Croacia',NULL,NULL,NULL),(49,'Cuba',NULL,NULL,NULL),(50,'Dinamarca',NULL,NULL,NULL),(51,'Dominica',NULL,NULL,NULL),(52,'Ecuador',NULL,NULL,NULL),(53,'Egipto',NULL,NULL,NULL),(54,'El Salvador',NULL,NULL,NULL),(55,'Emiratos Árabes Unidos',NULL,NULL,NULL),(56,'Eritrea',NULL,NULL,NULL),(57,'Eslovaquia',NULL,NULL,NULL),(58,'Eslovenia',NULL,NULL,NULL),(59,'España',NULL,NULL,NULL),(60,'Estados Unidos',NULL,NULL,NULL),(61,'Estonia',NULL,NULL,NULL),(62,'Etiopía',NULL,NULL,NULL),(63,'Filipinas',NULL,NULL,NULL),(64,'Finlandia',NULL,NULL,NULL),(65,'Fiyi',NULL,NULL,NULL),(66,'Francia',NULL,NULL,NULL),(67,'Gabón',NULL,NULL,NULL),(68,'Gambia',NULL,NULL,NULL),(69,'Georgia',NULL,NULL,NULL),(70,'Ghana',NULL,NULL,NULL),(71,'Granada',NULL,NULL,NULL),(72,'Grecia',NULL,NULL,NULL),(73,'Guatemala',NULL,NULL,NULL),(74,'Guyana',NULL,NULL,NULL),(75,'Guinea',NULL,NULL,NULL),(76,'Guinea ecuatorial',NULL,NULL,NULL),(77,'Guinea-Bisáu',NULL,NULL,NULL),(78,'Haití',NULL,NULL,NULL),(79,'Honduras',NULL,NULL,NULL),(80,'Hungría',NULL,NULL,NULL),(81,'India',NULL,NULL,NULL),(82,'Indonesia',NULL,NULL,NULL),(83,'Irak',NULL,NULL,NULL),(84,'Irán',NULL,NULL,NULL),(85,'Irlanda',NULL,NULL,NULL),(86,'Islandia',NULL,NULL,NULL),(87,'Islas Marshall',NULL,NULL,NULL),(88,'Islas Salomón',NULL,NULL,NULL),(89,'Israel',NULL,NULL,NULL),(90,'Italia',NULL,NULL,NULL),(91,'Jamaica',NULL,NULL,NULL),(92,'Japón',NULL,NULL,NULL),(93,'Jordania',NULL,NULL,NULL),(94,'Kazajistán',NULL,NULL,NULL),(95,'Kenia',NULL,NULL,NULL),(96,'Kirguistán',NULL,NULL,NULL),(97,'Kiribati',NULL,NULL,NULL),(98,'Kuwait',NULL,NULL,NULL),(99,'Laos',NULL,NULL,NULL),(100,'Lesoto',NULL,NULL,NULL),(101,'Letonia',NULL,NULL,NULL),(102,'Líbano',NULL,NULL,NULL),(103,'Liberia',NULL,NULL,NULL),(104,'Libia',NULL,NULL,NULL),(105,'Liechtenstein',NULL,NULL,NULL),(106,'Lituania',NULL,NULL,NULL),(107,'Luxemburgo',NULL,NULL,NULL),(108,'Macedonia del Norte',NULL,NULL,NULL),(109,'Madagascar',NULL,NULL,NULL),(110,'Malasia',NULL,NULL,NULL),(111,'Malaui',NULL,NULL,NULL),(112,'Maldivas',NULL,NULL,NULL),(113,'Maldivas',NULL,NULL,NULL),(114,'Malta',NULL,NULL,NULL),(115,'Marruecos',NULL,NULL,NULL),(116,'Mauricio',NULL,NULL,NULL),(117,'Mauritania',NULL,NULL,NULL),(118,'México',NULL,NULL,NULL),(119,'Micronesia',NULL,NULL,NULL),(120,'Moldavia',NULL,NULL,NULL),(121,'Mónaco',NULL,NULL,NULL),(122,'Mongolia',NULL,NULL,NULL),(123,'Montenegro',NULL,NULL,NULL),(124,'Mozambique',NULL,NULL,NULL),(125,'Namibia',NULL,NULL,NULL),(126,'Nauru',NULL,NULL,NULL),(127,'Nepal',NULL,NULL,NULL),(128,'Nicaragua',NULL,NULL,NULL),(129,'Níger',NULL,NULL,NULL),(130,'Nigeria',NULL,NULL,NULL),(131,'Noruega',NULL,NULL,NULL),(132,'Nueva Zelanda',NULL,NULL,NULL),(133,'Omán',NULL,NULL,NULL),(134,'Países Bajos',NULL,NULL,NULL),(135,'Pakistán',NULL,NULL,NULL),(136,'Palaos',NULL,NULL,NULL),(137,'Panamá',NULL,NULL,NULL),(138,'Papúa Nueva Guinea',NULL,NULL,NULL),(139,'Paraguay',NULL,NULL,NULL),(140,'Perú',NULL,NULL,NULL),(141,'Polonia',NULL,NULL,NULL),(142,'Portugal',NULL,NULL,NULL),(143,'Reino Unido',NULL,NULL,NULL),(144,'República Centroafricana',NULL,NULL,NULL),(145,'República Checa',NULL,NULL,NULL),(146,'República del Congo',NULL,NULL,NULL),(147,'República Democrática del Congo',NULL,NULL,NULL),(148,'República Dominicana',NULL,NULL,NULL),(149,'República Sudafricana',NULL,NULL,NULL),(150,'Ruanda',NULL,NULL,NULL),(151,'Rumanía',NULL,NULL,NULL),(152,'Rusia',NULL,NULL,NULL),(153,'Samoa',NULL,NULL,NULL),(154,'San Cristóbal y Nieves',NULL,NULL,NULL),(155,'San Marino',NULL,NULL,NULL),(156,'San Vicente y las Granadinas',NULL,NULL,NULL),(157,'Santa Lucía',NULL,NULL,NULL),(158,'Santo Tomé y Príncipe',NULL,NULL,NULL),(159,'Senegal',NULL,NULL,NULL),(160,'Serbia',NULL,NULL,NULL),(161,'Seychelles',NULL,NULL,NULL),(162,'Sierra Leona',NULL,NULL,NULL),(163,'Singapur',NULL,NULL,NULL),(164,'Siria',NULL,NULL,NULL),(165,'Somalia',NULL,NULL,NULL),(166,'Sri Lanka',NULL,NULL,NULL),(167,'Suazilandia',NULL,NULL,NULL),(168,'Sudán',NULL,NULL,NULL),(169,'Sudán del Sur',NULL,NULL,NULL),(170,'Suecia',NULL,NULL,NULL),(171,'Suiza',NULL,NULL,NULL),(172,'Surinam',NULL,NULL,NULL),(173,'Tailandia',NULL,NULL,NULL),(174,'Tanzania',NULL,NULL,NULL),(175,'Tayikistán',NULL,NULL,NULL),(176,'Timor Oriental',NULL,NULL,NULL),(177,'Togo',NULL,NULL,NULL),(178,'Tonga',NULL,NULL,NULL),(179,'Trinidad y Tobago',NULL,NULL,NULL),(180,'Túnez',NULL,NULL,NULL),(181,'Turkmenistán',NULL,NULL,NULL),(182,'Turquía',NULL,NULL,NULL),(183,'Tuvalu',NULL,NULL,NULL),(184,'Ucrania',NULL,NULL,NULL),(185,'Uganda',NULL,NULL,NULL),(186,'Uruguay',NULL,NULL,NULL),(187,'Uzbekistán',NULL,NULL,NULL),(188,'Vanuatu',NULL,NULL,NULL),(189,'Venezuela',NULL,NULL,NULL),(190,'Vietnam',NULL,NULL,NULL),(191,'Yemen',NULL,NULL,NULL),(192,'Yibuti',NULL,NULL,NULL),(193,'Zambia',NULL,NULL,NULL),(194,'Zimbabue',NULL,NULL,NULL);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimiento_abreviado`
--

DROP TABLE IF EXISTS `procedimiento_abreviado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimiento_abreviado` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sentencia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimiento_abreviado`
--

LOCK TABLES `procedimiento_abreviado` WRITE;
/*!40000 ALTER TABLE `procedimiento_abreviado` DISABLE KEYS */;
INSERT INTO `procedimiento_abreviado` VALUES (1,'2024-01-10','Sentencia 1',1,NULL,NULL);
/*!40000 ALTER TABLE `procedimiento_abreviado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prorroga_plazo_investigacion_complementaria`
--

DROP TABLE IF EXISTS `prorroga_plazo_investigacion_complementaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prorroga_plazo_investigacion_complementaria` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prorroga_plazo_investigacion_complementaria`
--

LOCK TABLES `prorroga_plazo_investigacion_complementaria` WRITE;
/*!40000 ALTER TABLE `prorroga_plazo_investigacion_complementaria` DISABLE KEYS */;
INSERT INTO `prorroga_plazo_investigacion_complementaria` VALUES (1,'2024-04-19','12:00',1,NULL,NULL);
/*!40000 ALTER TABLE `prorroga_plazo_investigacion_complementaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Director General'),(3,'Director Defensoria'),(4,'Director Asesoria'),(5,'Jefe de Asesorias'),(6,'Defensor'),(7,'Asesor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspencion_condicional_proceso`
--

DROP TABLE IF EXISTS `suspencion_condicional_proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspencion_condicional_proceso` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha_inicio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_fin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resultado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reporte_cumplimiento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspencion_condicional_proceso`
--

LOCK TABLES `suspencion_condicional_proceso` WRITE;
/*!40000 ALTER TABLE `suspencion_condicional_proceso` DISABLE KEYS */;
INSERT INTO `suspencion_condicional_proceso` VALUES (1,'2024-04-01','2024-04-10','Resultado SCP','Reporte cumplimiento 1',1,NULL,NULL);
/*!40000 ALTER TABLE `suspencion_condicional_proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tribunal_enjuiciamiento`
--

DROP TABLE IF EXISTS `tribunal_enjuiciamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tribunal_enjuiciamiento` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_municipio` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tribunal_enjuiciamiento_id_municipio_foreign` (`id_municipio`),
  CONSTRAINT `tribunal_enjuiciamiento_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tribunal_enjuiciamiento`
--

LOCK TABLES `tribunal_enjuiciamiento` WRITE;
/*!40000 ALTER TABLE `tribunal_enjuiciamiento` DISABLE KEYS */;
INSERT INTO `tribunal_enjuiciamiento` VALUES (1,'Tribunal1',2290,1,NULL,'2024-10-15 02:47:52'),(2,'tribunal2',2305,0,'2024-10-15 00:43:36','2024-10-15 02:57:01');
/*!40000 ALTER TABLE `tribunal_enjuiciamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ugi`
--

DROP TABLE IF EXISTS `ugi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ugi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ugi`
--

LOCK TABLES `ugi` WRITE;
/*!40000 ALTER TABLE `ugi` DISABLE KEYS */;
INSERT INTO `ugi` VALUES (1,'UGI1',1,NULL,'2024-10-24 21:49:25'),(2,'UGI2',1,'2024-04-20 02:30:13','2024-10-24 21:49:29'),(3,'UGI2',1,'2024-04-20 02:30:22','2024-10-24 21:49:32'),(4,'UGI3',1,'2024-04-20 02:30:30','2024-10-24 21:49:41'),(5,'UGI4',1,'2024-04-20 02:30:38','2024-10-24 22:05:13'),(6,'UGI5',1,'2024-04-24 01:08:00','2024-10-24 22:05:15'),(7,'UGI6',1,'2024-04-24 05:39:22','2024-10-24 22:21:19'),(8,'uuuu',0,'2024-04-25 03:54:18','2024-10-24 21:09:16'),(9,'ugi test',0,'2024-10-17 01:50:16','2024-10-17 01:50:19'),(10,'ugi test',0,'2024-10-17 01:59:24','2024-10-17 01:59:26'),(11,'ugitest',0,'2024-10-17 01:59:35','2024-10-17 02:05:59'),(12,'UGI1 EDITADO',0,'2024-10-17 02:06:17','2024-10-24 21:09:18');
/*!40000 ALTER TABLE `ugi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ugi_municipio`
--

DROP TABLE IF EXISTS `ugi_municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ugi_municipio` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_municipio` bigint unsigned NOT NULL,
  `id_ugi` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ugi_municipio_id_municipio_foreign` (`id_municipio`),
  KEY `ugi_municipio_id_ugi_foreign` (`id_ugi`),
  CONSTRAINT `ugi_municipio_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  CONSTRAINT `ugi_municipio_id_ugi_foreign` FOREIGN KEY (`id_ugi`) REFERENCES `ugi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ugi_municipio`
--

LOCK TABLES `ugi_municipio` WRITE;
/*!40000 ALTER TABLE `ugi_municipio` DISABLE KEYS */;
INSERT INTO `ugi_municipio` VALUES (1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `ugi_municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fathername` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mothername` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDRol` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_idrol_foreign` (`IDRol`),
  CONSTRAINT `users_idrol_foreign` FOREIGN KEY (`IDRol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Froylán Mtz','Ss','ss','7311234532','ss@gmail.com',NULL,'$2y$10$vschSV4Rhtuux7Z.ZT6U/.5qm8baAEit9lJihePZD2xPoRidqA.pW',1,0,NULL,NULL,'2024-10-24 23:47:11','Masculino'),(2,'Administrador1',NULL,NULL,NULL,'prueba2@idpet.com.mx',NULL,'$2y$10$ulDBgGA7QzfIxS7F/r7uWuDq3PpDjIjcbX27qqwocTrjO1b/HlSSC',1,1,NULL,NULL,NULL,NULL),(3,'defensor',NULL,NULL,NULL,'defensor@hotmail.com',NULL,'$2y$10$wUVq5qOxR.9JItf7ERkFg.AviT8MlUrjniTSjIvb9S3Kt14vJTvUm',6,1,NULL,'2024-04-19 06:00:00','2024-09-21 02:17:28',NULL),(4,'Director General',NULL,NULL,NULL,'Director@hotmail.com',NULL,'$2y$10$p0DMSIOVgBtgrxYrqbP9ZOwn0d9Kz2pbloimVNil30Vyp9stXDQKK',2,1,NULL,'2024-04-19 06:00:00',NULL,NULL),(5,'Director Defensoria',NULL,NULL,NULL,'Directordefensoria@hotmail.com',NULL,'$2y$10$ritK/zZL2JKJa.EhjS7jJ.Qq649NG6b7D0VISmQoD4Zpyq0Bx0H4G',3,1,NULL,'2024-04-19 06:00:00',NULL,NULL),(6,'Director Asesoria',NULL,NULL,NULL,'Directorasesoria@hotmail.com',NULL,'$2y$10$CuqT3xDiODJc2ZI/PwKlxOeBNXgocN.MXwyMbZ8c7tiILj4SZLKEK',4,1,NULL,'2024-04-19 06:00:00',NULL,NULL),(7,'Jefe Asesorias',NULL,NULL,NULL,'Jefeasesorias@hotmail.com',NULL,'$2y$10$enSb7cRt4GTWTeTsRwWlNep69Y.KjcdtRkvbSYU.e/20xK39nraSi',5,1,NULL,'2024-04-19 06:00:00',NULL,NULL),(8,'Asesor',NULL,NULL,NULL,'Asesor@hotmail.com',NULL,'$2y$10$seK4yIuxHP1AhRmF2GR7LOvI4Sk4yB75Xl3hPi.EAAB8UtsJ4hIxG',6,1,NULL,'2024-04-19 06:00:00',NULL,NULL),(10,'Froylan Melquiades','Wbario','Martinez','8341609881','froy.12@hotmail.com',NULL,'$2y$10$0ZFmVCRbfVNiPYJ.PWCAf.hZ0tCq.iTlP7NUDqCIjPc13xyRMkcJu',6,1,NULL,'2024-09-26 06:00:00',NULL,'Masculino'),(13,'Froylan Melquiades','Wbario','Martinez','8341609881','froasdfy.12@hotmail.com',NULL,'$2y$10$TIWgtqgOVjhNErhOj2fqBu6Ep6YxpO6FaZNsMUmub7jxqrPejfQJ6',6,1,NULL,'2024-09-26 06:00:00',NULL,'Masculino'),(14,'aaa','aa','aa','111111111','test2709@test.com',NULL,'$2y$10$xIjF03pmY0NBAMPeULXZJe.X5jsJ0hqmShAfZE8JxqK7sAzNmSL1a',6,1,NULL,'2024-09-27 06:00:00',NULL,'Masculino'),(15,'bbbb','bbbb','bbbb','1111111111','froylanw@gmail.com',NULL,'$2y$10$EucTdppmdYjW2Ag8LmYs.ecJD7REmvmomh.UMT01GAx9W8AHI4g1q',6,1,NULL,'2024-09-27 06:00:00',NULL,'Masculino'),(16,'2222222222','222222222','22222222222','2222222222','test22709@test.com',NULL,'$2y$10$sgjP6lz2VnyYqNfKkfcDKuDEIUaZmUomzUVYV.7.DzTRdKaj7mHE2',6,1,NULL,'2024-09-27 06:00:00',NULL,'Masculino'),(17,'cccc','ccc','cccc','3333333333','test32709@test.com',NULL,'$2y$10$2ehpDvTsX6K5smIPnZPkR.cZavDJvQMhNxwQp9lrl1vCroCHyJNk6',6,1,NULL,'2024-09-27 06:00:00',NULL,'Femenino'),(18,'ddd','ddd','ddd','4444444444','test4270924@test.com',NULL,'$2y$10$LQTleGV4htte2PGT0Rdw/eLgJ8zP018psQOfhyH9PRPdnsl8EY26G',6,1,NULL,'2024-09-27 06:00:00',NULL,'Masculino'),(19,'fffff','fffff','fffff','5555555555','test5@test.com',NULL,'$2y$10$mJTh/8CgSo23q3ceyr7Vie2CagTMoEmaSKE.LB7tfM0dvoA7HxH9O',6,1,NULL,'2024-09-27 06:00:00',NULL,'Masculino'),(20,'aaaa','bbbb','ccccc','8341609881','pruebas3@test.com',NULL,'$2y$10$Ne/h07fsKotw1/D8K/Xo2eka/a6.YiO5S3xg.HJiPsipEfHMHpUEW',6,1,NULL,'2024-09-27 06:00:00','2024-10-02 22:40:30','Femenino'),(21,'carlos','sanchez','martinez','4411239384','algo@ejemplo.com',NULL,'$2y$10$SN0o2AgPteIyKkKuGE2ZieCld5YReqbfaqDsT9HnjbI5q9scuRt1K',6,1,NULL,'2024-10-02 06:00:00',NULL,'Femenino'),(22,'jorge','alberto','quiroga','8341609881','ejemplo2@gmail.com',NULL,'$2y$10$eiOSL2hDUWMdGKgteCmKG.VSmJD2iAkKj3pKAIIjMYkvne56Q.ZN.',6,1,NULL,'2024-10-02 06:00:00',NULL,'Masculino'),(23,'bbb','bbb','bbb','1111111111','faaa@gmail.com',NULL,'$2y$10$G2Q/vsLxp.8WJfcRHLcEO.x3TDjf4WKPuQCDaIfshtrfSXjLusiQ6',1,NULL,NULL,'2024-10-09 06:00:00','2024-10-10 03:56:08','Femenino');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `victima`
--

DROP TABLE IF EXISTS `victima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `victima` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido_paterno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido_materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domicilio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pais` bigint unsigned NOT NULL,
  `id_estado` bigint unsigned NOT NULL,
  `id_municipio` bigint unsigned NOT NULL,
  `estado_civil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_ocupacion` bigint unsigned NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `victima_id_pais_foreign` (`id_pais`),
  KEY `victima_id_estado_foreign` (`id_estado`),
  KEY `victima_id_municipio_foreign` (`id_municipio`),
  KEY `victima_id_ocupacion_foreign` (`id_ocupacion`),
  CONSTRAINT `victima_id_estado_foreign` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`),
  CONSTRAINT `victima_id_municipio_foreign` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  CONSTRAINT `victima_id_ocupacion_foreign` FOREIGN KEY (`id_ocupacion`) REFERENCES `ocupacion` (`id`),
  CONSTRAINT `victima_id_pais_foreign` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victima`
--

LOCK TABLES `victima` WRITE;
/*!40000 ALTER TABLE `victima` DISABLE KEYS */;
INSERT INTO `victima` VALUES (1,'Jose Alejandro','Segura','HDZ','8341234567','Xyz','masculino',118,28,2277,'soltero/a','1997-02-12',1,1,NULL,'2024-10-10 23:11:16'),(2,'froylan M','Wbario','Mtz','8341609881','Calle eucalipto esq. Durazno MF L18','Masculino',118,28,2313,'soltero/a','2024-06-14',1,1,'2024-06-15 03:43:07','2024-06-15 03:43:07'),(3,'Froy','M','w','8341609881','xyz','masculino',118,28,2313,'soltero/a','2024-06-18',1,1,'2024-06-18 00:11:21','2024-06-18 00:11:21'),(4,'aaaa','algo','algo','8341609881','calle xy','femenino',118,28,2311,'soltero/a','2024-06-10',1,1,'2024-06-18 00:36:35','2024-09-12 01:09:52'),(5,'Prueba 4','prueba 4','prueba 4','8341532345','Calle feliz entre tristeza y alegria','masculino',118,28,2313,'soltero/a','1997-02-12',1,1,'2024-09-12 00:27:45','2024-09-12 00:27:45'),(6,'test','test','test','8341112233','aaaa','masculino',118,28,2313,'soltero/a','2024-09-01',3,1,'2024-09-12 00:35:34','2024-09-12 00:35:34');
/*!40000 ALTER TABLE `victima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `victimasExpediente`
--

DROP TABLE IF EXISTS `victimasExpediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `victimasExpediente` (
  `id_expediente` bigint unsigned NOT NULL,
  `id_victima` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_expediente`,`id_victima`),
  KEY `id_victima` (`id_victima`),
  CONSTRAINT `victimasExpediente_ibfk_1` FOREIGN KEY (`id_expediente`) REFERENCES `expediente` (`id`),
  CONSTRAINT `victimasExpediente_ibfk_2` FOREIGN KEY (`id_victima`) REFERENCES `victima` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victimasExpediente`
--

LOCK TABLES `victimasExpediente` WRITE;
/*!40000 ALTER TABLE `victimasExpediente` DISABLE KEYS */;
INSERT INTO `victimasExpediente` VALUES (1,1),(2,1),(6,2),(6,3);
/*!40000 ALTER TABLE `victimasExpediente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28 10:51:35
