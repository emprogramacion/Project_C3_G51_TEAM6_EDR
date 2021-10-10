-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `biological_data`
--

DROP TABLE IF EXISTS `biological_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `biological_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bibliographic_ref` varchar(100) DEFAULT NULL,
  `users_id` int NOT NULL,
  `geographic_id` int NOT NULL,
  `taxonomy_birds_id` int NOT NULL,
  `genetic_id` int NOT NULL,
  `parasite_id` int NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_biological_data_users1_idx` (`users_id`),
  KEY `fk_biological_data_taxonomy_birds1_idx` (`taxonomy_birds_id`),
  KEY `fk_biological_data_genetic1_idx` (`genetic_id`),
  KEY `fk_biological_data_parasite1_idx` (`parasite_id`),
  KEY `fk_biological_data_geographic1_idx` (`geographic_id`),
  CONSTRAINT `fk_biological_data_genetic1` FOREIGN KEY (`genetic_id`) REFERENCES `genetic` (`id`),
  CONSTRAINT `fk_biological_data_geographic1` FOREIGN KEY (`geographic_id`) REFERENCES `geographic` (`id`),
  CONSTRAINT `fk_biological_data_parasite1` FOREIGN KEY (`parasite_id`) REFERENCES `parasite` (`id`),
  CONSTRAINT `fk_biological_data_taxonomy_birds1` FOREIGN KEY (`taxonomy_birds_id`) REFERENCES `taxonomy_bird` (`id`),
  CONSTRAINT `fk_biological_data_users1` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biological_data`
--

LOCK TABLES `biological_data` WRITE;
/*!40000 ALTER TABLE `biological_data` DISABLE KEYS */;
INSERT INTO `biological_data` VALUES (1,'(Gonzalez-Quevedo, Rivera-Gutierrez and Pabón, 2016)',1,1,1,1,1,'2021-10-10','2021-10-10'),(2,'(Szymanski and Lovette, 2005)',2,2,2,2,2,'2021-10-10','2021-10-10'),(3,'(Svensson-Coelho et al. 2016)',3,3,3,3,3,'2021-10-10','2021-10-10'),(4,'(Marroquin-Flores et al., 2017)',4,4,4,4,4,'2021-10-10','2021-10-10'),(5,'(Lotta et al., 2016)',5,5,5,5,5,'2021-10-10','2021-10-10'),(6,'(Bensch et al., 2009)',6,6,6,6,6,'2021-10-10','2021-10-10');
/*!40000 ALTER TABLE `biological_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrie`
--

DROP TABLE IF EXISTS `countrie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrie`
--

LOCK TABLES `countrie` WRITE;
/*!40000 ALTER TABLE `countrie` DISABLE KEYS */;
INSERT INTO `countrie` VALUES (1,'Colombia'),(2,'Afganistán'),(3,'Albania'),(4,'Alemania'),(5,'Andorra'),(6,'Angola'),(7,'Anguilla'),(8,'Antártida'),(9,'Antigua Y Barbuda'),(10,'Antillas Holandesas'),(11,'Arabia Saudita'),(12,'Argelia'),(13,'Argentina'),(14,'Armenia'),(15,'Aruba'),(16,'Australia'),(17,'Austria'),(18,'Azerbaiyán'),(19,'Bahamas'),(20,'Bahrein'),(21,'Bangladesh'),(22,'Barbados'),(23,'Bélgica'),(24,'Belice'),(25,'Benín'),(26,'Bermudas'),(27,'Bhután'),(28,'Bielorrusia (Belarus)'),(29,'Birmania (Myanmar)'),(30,'Bolivia'),(31,'Bosnia Y Herzegovina'),(32,'Botswana'),(33,'Brasil'),(34,'Brunei'),(35,'Bulgaria'),(36,'Burkina Faso'),(37,'Burundi'),(38,'Cabo Verde'),(39,'Camboya'),(40,'Camerún'),(41,'Canadá'),(42,'Chad'),(43,'Chile'),(44,'China'),(45,'Chipre'),(46,'Ciudad Estado Del Vaticano (Santa Sede)'),(47,'Comores (Comoro)'),(48,'Congo'),(49,'Corea Del Norte'),(50,'Corea Del Sur'),(51,'Costa Del Marfil'),(52,'Costa Rica'),(53,'Croacia (Hrvatska)'),(54,'Cuba'),(55,'Dinamarca'),(56,'Djibouri'),(57,'Dominica'),(58,'Ecuador'),(59,'Egipto'),(60,'El Salvador'),(61,'Eritrea'),(62,'Eslovaquia'),(63,'Eslovenia'),(64,'España'),(65,'Estados Unidos'),(66,'Estonia'),(67,'Etiopía'),(68,'Exrepública Yugoslava De Macedonia'),(69,'Filipinas'),(70,'Finlandia'),(71,'Francia'),(72,'Gabón'),(73,'Gambia'),(74,'Georgia'),(75,'Georgia Del Sur Y Las Islas Sandwich Del Sur'),(76,'Ghana'),(77,'Gibraltar'),(78,'Granada'),(79,'Grecia'),(80,'Groenlandia'),(81,'Guadalupe'),(82,'Guam'),(83,'Guatemala'),(84,'Guayana'),(85,'Guayana Francesa'),(86,'Guinea'),(87,'Guinea Bissau'),(88,'Guinea Ecuatorial'),(89,'Haití'),(90,'Holanda'),(91,'Honduras'),(92,'Hong Kong R.A.E.'),(93,'Hungría'),(94,'India'),(95,'Indonesia'),(96,'Irak'),(97,'Irán'),(98,'Irlanda'),(99,'Isla De Bouvet'),(100,'Isla De Christmas'),(101,'Isla Heard E Islas Mcdonald'),(102,'Isla Norfolk'),(103,'Isla Pitcairn'),(104,'Islandia'),(105,'Islas Caimán'),(106,'Islas Cook'),(107,'Islas De Cocos O De Keeling'),(108,'Islas De Faroe'),(109,'Islas Fiyi (Fiji)'),(110,'Islas Malvinas (Islas Falkland)'),(111,'Islas Marianas Del Norte'),(112,'Islas Marshall'),(113,'Islas Menores De Estados Unidos'),(114,'Islas Palau'),(115,'Islas Salomón'),(116,'Islas Tokelau'),(117,'Islas Turks Y Caicos'),(118,'Islas Vírgenes (Estados Unidos)'),(119,'Islas Vírgenes (Reino Unido)'),(120,'Israel'),(121,'Italia'),(122,'Jamaica'),(123,'Japón'),(124,'Jordania'),(125,'Kazajstán'),(126,'Kenia'),(127,'Kirguizistán'),(128,'Kiribati'),(129,'Kuwait'),(130,'Laos'),(131,'Lesotho'),(132,'Letonia'),(133,'Líbano'),(134,'Liberia'),(135,'Libia'),(136,'Liechtenstein'),(137,'Lituania'),(138,'Luxemburgo'),(139,'Macao R.A.E.'),(140,'Madagascar'),(141,'Malasia'),(142,'Malawi'),(143,'Maldivas'),(144,'Malí'),(145,'Malta'),(146,'Marruecos'),(147,'Martinica'),(148,'Mauricio'),(149,'Mauritania'),(150,'Mayotte'),(151,'México'),(152,'Micronesia'),(153,'Moldavia'),(154,'Mónaco'),(155,'Mongolia'),(156,'Montserrat'),(157,'Mozambique'),(158,'Namibia'),(159,'Naurú'),(160,'Nepal'),(161,'Nicaragua'),(162,'Níger'),(163,'Nigeria'),(164,'Niue'),(165,'Noruega'),(166,'Nueva Caledonia'),(167,'Nueva Zelanda'),(168,'Omán'),(169,'Países Bajos'),(170,'Pakistán (Paquistán)'),(171,'Panamá'),(172,'Papua Nueva Guinea'),(173,'Paraguay'),(174,'Perú'),(175,'Polinesia Francesa'),(176,'Polonia'),(177,'Portugal'),(178,'Puerto Rico'),(179,'Qatar'),(180,'Reino Unido'),(181,'República Centroafricana'),(182,'República Checa'),(183,'República De Sudáfrica'),(184,'República Democrática Del Congo (Zaire)'),(185,'República Dominicana'),(186,'Reunión'),(187,'Ruanda'),(188,'Rumania'),(189,'Rusia'),(190,'Saint Kitts (San Cristóbal) Y Nevis'),(191,'Samoa'),(192,'Samoa Occidental'),(193,'San Marino'),(194,'San Pierre Y Miquelon'),(195,'San Vicente E Islas Granadinas'),(196,'Santa Helena'),(197,'Santa Lucía'),(198,'Santo Tomé Y Príncipe'),(199,'Senegal'),(200,'Seychelles'),(201,'Sierra Leona'),(202,'Singapur'),(203,'Siria'),(204,'Somalia'),(205,'Sri Lanka'),(206,'Sudán'),(207,'Suecia'),(208,'Suiza'),(209,'Surinam'),(210,'Svalbard E Islas Jan Mayen'),(211,'Swazilandia'),(212,'Tailandia'),(213,'Taiwán'),(214,'Tanzania'),(215,'Tayikistán'),(216,'Territorios Británicos Del Océano Indico'),(217,'Territorios Franceses Del Sur'),(218,'Togo'),(219,'Togo'),(220,'Tonga'),(221,'Trinidad Y Tobago'),(222,'Túnez'),(223,'Turkmenistán'),(224,'Turquía'),(225,'Tuvalú'),(226,'Ucrania'),(227,'Uganda'),(228,'Unión De Emiratos Árabes (Emiratos Árabes)'),(229,'Uruguay'),(230,'Uzbekistán'),(231,'Vanuatu'),(232,'Venezuela'),(233,'Vietnam'),(234,'Wallis E Islas Futuna'),(235,'Yemén (República Del Yemén)'),(236,'Yugoslavia (Federación Yugoslava)'),(237,'Zambia'),(238,'Zimbabwe');
/*!40000 ALTER TABLE `countrie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genetic`
--

DROP TABLE IF EXISTS `genetic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genetic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genbank_code` varchar(100) NOT NULL,
  `molecular_marker` varchar(100) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genetic`
--

LOCK TABLES `genetic` WRITE;
/*!40000 ALTER TABLE `genetic` DISABLE KEYS */;
INSERT INTO `genetic` VALUES (1,'KX130085','CYTB','2021-10-10','2021-10-10'),(2,'AY640129','CYTB','2021-10-10','2021-10-10'),(3,'KC680664','CYTB','2021-10-10','2021-10-10'),(4,'MF077678','CYTB','2021-10-10','2021-10-10'),(5,'KF699312','CYTB','2021-10-10','2021-10-10'),(6,'KF717054','CYTB','2021-10-10','2021-10-10');
/*!40000 ALTER TABLE `genetic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geographic`
--

DROP TABLE IF EXISTS `geographic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geographic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `location` varchar(100) NOT NULL,
  `elevation` float NOT NULL,
  `countrie_id` int NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_geographic_countrie1_idx` (`countrie_id`),
  CONSTRAINT `fk_geographic_countrie1` FOREIGN KEY (`countrie_id`) REFERENCES `countrie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geographic`
--

LOCK TABLES `geographic` WRITE;
/*!40000 ALTER TABLE `geographic` DISABLE KEYS */;
INSERT INTO `geographic` VALUES (1,10.8292,-73.6923,'Sierra Nevada de Santa Marta, San Lorenzo ridge',1.64,1,'2021-10-09','2021-10-09'),(2,37.09,-95.712,'NA',259,65,'2021-10-09','2021-10-09'),(3,-0.6333,-76.1333,'Tiputini Biodiversity Station, Orellana  Province',267,58,'2021-10-09','2021-10-09'),(4,35.5241,-107.35,'Nuevo Mexico, Mesa Chivato',2.421,65,'2021-10-09','2021-10-09'),(5,4.61667,-73.7167,'PNN Chingaza, Estacion Monte Redondo',3.1,1,'2021-10-09','2021-10-09'),(6,4.71667,-75.45,'PNN Los Nevados, El Bosque',3.3,1,'2021-10-09','2021-10-09');
/*!40000 ALTER TABLE `geographic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parasite`
--

DROP TABLE IF EXISTS `parasite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parasite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(100) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parasite`
--

LOCK TABLES `parasite` WRITE;
/*!40000 ALTER TABLE `parasite` DISABLE KEYS */;
INSERT INTO `parasite` VALUES (1,'Hemoproteus','2021-10-10','2021-10-10'),(2,'Hemoproteus','2021-10-10','2021-10-10'),(3,'Hemoproteus','2021-10-10','2021-10-10'),(4,'Hemoproteus','2021-10-10','2021-10-10'),(5,'Leucocytozoon','2021-10-10','2021-10-10'),(6,'Leucocytozoon','2021-10-10','2021-10-10');
/*!40000 ALTER TABLE `parasite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrador','Personal encargado del sistema'),(2,'Usuario','Investigador');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `decription` mediumtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `identification` varchar(100) NOT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
INSERT INTO `support` VALUES (1,1,'Problema cuenta','riorte@gmail.com','1145437290','2021-10-10'),(2,2,'Dudas al Ingresar Datos','smedina@yahoo.com','95542379','2021-10-10');
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomy_bird`
--

DROP TABLE IF EXISTS `taxonomy_bird`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxonomy_bird` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` varchar(50) NOT NULL,
  `family` varchar(50) NOT NULL,
  `species` varchar(50) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_bird`
--

LOCK TABLES `taxonomy_bird` WRITE;
/*!40000 ALTER TABLE `taxonomy_bird` DISABLE KEYS */;
INSERT INTO `taxonomy_bird` VALUES (1,'Passeriformes','Emberizidae','Atlapetes melanocephalus','2021-10-10','2021-10-10'),(2,'Passeriformes','Parulidae','Setophaga petechia','2021-10-10','2021-10-10'),(3,'Passeriformes','Thamnophilidae','Hafferia fortis','2021-10-10','2021-10-10'),(4,'Passeriformes','Passerellidae','Spizella passerina','2021-10-10','2021-10-10'),(5,'Passeriformes','Emberizidae','Arremon torquatus','2021-10-10','2021-10-10'),(6,'Passeriformes','Emberizidae','Zonotrichia capensis','2021-10-10','2021-10-10');
/*!40000 ALTER TABLE `taxonomy_bird` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `names` varchar(100) NOT NULL,
  `last_names` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `state` int NOT NULL DEFAULT '0',
  `roles_id` int NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_roles_idx` (`roles_id`),
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Diana','Gil','diag@hotmail.com','54366',1,1,'2021-10-10','2021-10-10'),(2,'Eduardo','Hernandez','elnene@yahoo.com','54366',1,2,'2021-10-10','2021-10-10'),(3,'Ricardo','Ortega','riorte@gmail.com','48374',1,2,'2021-10-10','2021-10-10'),(4,'Luis','Ruiz','lruiz@gmail.com','92036',1,2,'2021-10-10','2021-10-10'),(5,'Erasmo','Martinez','elmono@yahoo.com','28104',1,2,'2021-10-10','2021-10-10'),(6,'Leidy','Valderrama','leivalde@gmail.com','72054',1,2,'2021-10-10','2021-10-10'),(7,'Sergio','Medina','smedina@yahoo.com','90281',1,2,'2021-10-10','2021-10-10');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-10 11:36:06
