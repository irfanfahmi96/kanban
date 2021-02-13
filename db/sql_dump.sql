-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for osx10.15 (x86_64)
--
-- Host: localhost    Database: kanban
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_filename` varchar(255) CHARACTER SET utf8 NOT NULL,
  `attachment_original_filename` varchar(255) CHARACTER SET utf8 NOT NULL,
  `attachment_task_id` int(11) NOT NULL,
  `attachment_creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `attachment_user_id` int(11) NOT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_name` varchar(255) NOT NULL,
  `board_default` tinyint(1) NOT NULL,
  `board_order` int(11) NOT NULL,
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` VALUES (1,'Personal',1,5),(8,'Walk-In Sales Department',0,0),(9,'Online Sales Department',0,1),(10,'Design Department',0,2),(11,'Production Department',0,3),(12,'Packaging Department',0,4);
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards_users`
--

DROP TABLE IF EXISTS `boards_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards_users` (
  `board_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards_users`
--

LOCK TABLES `boards_users` WRITE;
/*!40000 ALTER TABLE `boards_users` DISABLE KEYS */;
INSERT INTO `boards_users` VALUES (1,1),(8,1),(9,1),(10,1),(11,1),(12,1);
/*!40000 ALTER TABLE `boards_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `conf_background_image` varchar(200) DEFAULT NULL,
  `conf_navbar_color` int(11) NOT NULL,
  `conf_administrator_email` varchar(255) NOT NULL,
  `conf_administrator_name` varchar(255) NOT NULL,
  `conf_date_format` int(11) NOT NULL,
  `conf_background_opacity` float NOT NULL DEFAULT 0.2,
  `conf_session_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES ('eca68f2b2de52855d043d8ab7adac011.jpg',19,'info@digitalborder.net','DigitalBorder',2,0.1,'');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `containers`
--

DROP TABLE IF EXISTS `containers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `containers` (
  `container_id` int(11) NOT NULL AUTO_INCREMENT,
  `container_board` int(11) NOT NULL,
  `container_name` varchar(255) NOT NULL,
  `container_order` int(11) NOT NULL,
  `container_color` varchar(11) NOT NULL,
  `container_done` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`container_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containers`
--

LOCK TABLES `containers` WRITE;
/*!40000 ALTER TABLE `containers` DISABLE KEYS */;
INSERT INTO `containers` VALUES (1,1,'TO DO LIST',0,'7',0),(5,1,'DO TODAY',1,'16',0),(7,1,'DONE',3,'10',1),(15,1,'IN PROGRESS',2,'14',0),(43,8,'NEW ORDER',0,'7',0),(44,8,'DESIGNING',0,'16',0),(45,8,'PRE-FLIGHT',0,'14',0),(46,8,'PROCEED',0,'10',1),(47,9,'NEW ORDER',0,'7',0),(48,9,'DESIGNING',0,'16',0),(49,9,'PRE-FLIGHT',0,'14',0),(50,9,'PROCEED',0,'10',1);
/*!40000 ALTER TABLE `containers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_periods`
--

DROP TABLE IF EXISTS `task_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_periods` (
  `task_periods_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `task_date_start` datetime NOT NULL,
  `task_date_stop` datetime DEFAULT NULL,
  `task_periods_user` int(11) NOT NULL,
  PRIMARY KEY (`task_periods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_periods`
--

LOCK TABLES `task_periods` WRITE;
/*!40000 ALTER TABLE `task_periods` DISABLE KEYS */;
INSERT INTO `task_periods` VALUES (1,12,'2016-10-16 19:52:44','2016-10-16 19:53:59',1),(2,14,'2016-10-16 19:58:54','2016-10-16 19:59:14',1),(3,14,'2016-10-16 19:59:33','2016-10-16 19:59:39',1),(7,12,'2016-10-17 13:09:27','2016-10-17 13:09:53',1),(8,12,'2016-10-17 13:09:50','2016-10-17 13:09:53',1),(9,12,'2016-10-17 13:09:55','2016-10-17 13:09:56',1),(10,12,'2016-10-17 13:11:07','2016-10-17 13:11:09',1),(11,12,'2016-10-17 13:11:24','2016-10-17 13:11:30',1),(12,34,'2016-10-17 23:17:52','2016-10-17 23:26:44',1),(13,34,'2016-10-17 23:26:22','2016-10-17 23:26:44',1),(15,7,'2016-10-19 19:45:54','2016-10-19 19:45:55',1),(23,38,'2016-10-19 19:48:23','2016-10-19 20:08:12',1),(26,38,'2016-10-19 20:08:03','2016-10-19 20:08:12',1),(27,38,'2016-10-19 20:08:12','2016-10-19 20:11:44',1),(29,38,'2016-10-19 20:11:47','2016-10-19 20:12:12',1),(31,39,'2016-10-19 20:18:56','2016-10-19 20:19:00',1),(32,39,'2016-10-19 20:19:21','2016-10-19 20:19:27',1),(33,32,'2016-10-19 20:26:00','2016-10-19 20:45:54',1),(34,34,'2016-10-19 21:27:28','2016-10-19 21:34:51',1),(37,35,'2016-10-30 14:01:42','2016-10-30 14:01:46',1),(38,35,'2016-10-30 14:01:48','2016-10-30 14:01:48',1),(39,35,'2016-10-30 14:01:53','2016-10-30 14:01:55',1),(40,35,'2016-10-30 14:01:56','2016-10-30 14:01:57',1),(41,35,'2016-10-30 14:01:57','2016-10-30 14:01:57',1),(42,35,'2016-10-30 14:01:58','2016-10-30 14:01:58',1),(43,35,'2016-10-30 14:01:59','2016-10-30 14:01:59',1),(44,34,'2016-10-30 14:02:12','2016-10-30 14:02:21',1),(45,35,'2016-10-30 17:21:51','2016-10-30 17:21:59',1),(46,35,'2016-10-30 18:01:23','2016-10-30 18:01:24',1),(47,34,'2016-10-31 10:53:07','2016-10-31 11:10:37',1),(48,38,'2016-10-31 18:52:45','2016-10-31 18:52:51',1),(49,38,'2016-10-31 18:52:58','2016-10-31 18:57:21',1),(51,5,'2016-10-31 18:57:11','2016-10-31 18:57:18',1),(56,38,'2016-10-31 19:08:09','2016-10-31 19:08:09',1),(59,38,'2016-10-31 19:10:21','2016-10-31 19:10:25',1),(60,38,'2016-10-31 19:10:26','2016-10-31 19:14:45',1),(61,38,'2016-10-31 19:14:47','2016-10-31 19:14:48',1),(62,5,'2016-10-31 19:14:50','2016-10-31 19:14:51',1),(63,5,'2016-10-31 19:14:54','2016-10-31 19:14:57',1),(64,5,'2016-10-31 19:14:58','2016-10-31 19:15:00',1),(65,5,'2016-10-31 19:15:54','2016-10-31 19:15:57',1),(66,5,'2016-10-31 19:15:58','2016-10-31 19:15:59',1),(67,5,'2016-10-31 19:16:00','2016-10-31 19:16:01',1),(68,5,'2016-10-31 19:16:01','2016-10-31 19:16:02',1),(70,5,'2016-11-01 18:38:39','2016-11-01 18:38:44',1),(71,44,'2016-11-01 18:38:56','2016-11-01 18:44:49',1),(72,44,'2016-11-01 18:44:53','2016-11-01 18:44:55',1),(73,5,'2016-11-01 18:44:57','2016-11-01 18:44:59',1),(74,5,'2016-11-01 18:45:04','2016-11-01 18:45:10',1),(75,5,'2016-11-01 18:45:13','2016-11-01 18:45:15',1),(76,5,'2016-11-01 18:45:18','2016-11-01 18:45:20',1),(77,5,'2016-11-01 18:46:18','2016-11-01 18:46:20',1),(78,5,'2016-11-01 18:46:21','2016-11-01 18:46:23',1),(79,5,'2016-11-01 18:46:24','2016-11-01 18:46:26',1),(80,44,'2016-11-01 18:47:39','2016-11-01 18:47:44',1),(81,44,'2016-11-01 18:47:46','2016-11-01 18:47:48',1),(82,44,'2016-11-01 18:47:49','2016-11-01 18:47:51',1),(83,44,'2016-11-01 18:47:52','2016-11-01 18:47:59',1),(84,5,'2016-11-01 18:49:33','2016-11-01 18:51:01',1),(85,44,'2016-11-01 18:51:04','2016-11-01 18:58:32',1),(86,38,'2016-11-01 18:58:35','2016-11-01 18:58:44',1),(87,5,'2016-11-01 18:58:45','2016-11-01 19:00:28',1),(88,44,'2016-11-01 19:00:29','2016-11-01 19:00:34',1),(89,37,'2016-11-01 19:00:35','2016-11-01 19:00:39',1),(90,38,'2016-11-01 19:01:19','2016-11-01 19:01:21',1),(91,5,'2016-11-01 19:01:22','2016-11-01 19:01:25',1),(92,44,'2016-11-01 19:01:26','2016-11-01 19:03:18',1),(93,35,'2016-11-01 19:04:01','2016-11-01 19:04:45',1),(94,47,'2016-11-01 19:37:24','2016-11-01 19:37:25',1),(95,38,'2016-11-01 19:55:22','2016-11-01 19:55:32',1),(96,38,'2016-11-01 19:57:25','2016-11-01 19:57:26',1),(97,38,'2016-11-01 19:58:40','2016-11-01 19:58:42',1),(98,38,'2016-11-01 20:05:57','2016-11-01 20:05:58',1),(99,38,'2016-11-01 20:15:52','2016-11-01 20:15:53',1),(100,38,'2016-11-01 20:15:57','2016-11-01 20:16:00',1),(101,38,'2016-11-01 20:34:25','2016-11-01 20:34:26',1),(102,64,'2016-11-02 20:35:31','2016-11-02 20:35:37',1),(103,38,'2016-11-03 21:41:45','2016-11-03 22:10:57',1),(104,67,'2016-11-05 12:05:17','2016-11-05 12:25:13',1),(105,71,'2016-11-05 19:31:47','2016-11-05 19:31:48',1),(106,74,'2021-01-23 08:16:04','2021-01-23 08:16:07',1),(107,74,'2021-01-23 08:16:13','2021-01-23 08:16:14',1);
/*!40000 ALTER TABLE `task_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_title` varchar(255) NOT NULL,
  `task_description` text NOT NULL,
  `task_user` int(11) NOT NULL,
  `task_date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `task_due_date` datetime DEFAULT NULL,
  `task_date_closed` timestamp NULL DEFAULT NULL,
  `task_container` int(11) NOT NULL,
  `task_order` int(11) NOT NULL,
  `task_time_spent` time DEFAULT NULL,
  `task_time_estimate` time DEFAULT NULL,
  `task_color` varchar(20) DEFAULT '0',
  `task_archived` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (5,'Send project start to Joe','Quisque rutrum. Donec orci lectus, aliquam ut, faucibus non, euismod id, nulla. Ut non enim eleifend felis pretium feugiat. Praesent metus tellus, elementum eu, semper a, adipiscing nec, purus.\r\n\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Vestibulum rutrum, mi nec elementum vehicula, eros quam gravida nisl, id fringilla neque ante vel mi. Suspendisse faucibus, nunc et pellentesque egestas, lacus ante convallis tellus, vitae iaculis lacus elit id tortor. Fusce pharetra convallis urna.',0,'2016-10-11 20:02:32','0000-00-00 00:00:00',NULL,5,2,'00:18:10','00:22:10','1',0),(8,'Setting dei container','aggiungere pagina con form per aggiungere i container',0,'2016-10-11 20:12:55','0000-00-00 00:00:00',NULL,6,3,'00:00:00','00:00:00','1',0),(12,'My blu task 2','asd',0,'2016-10-14 20:52:33','2016-10-27 13:26:00',NULL,6,1,'00:01:53','00:00:00','1',0),(14,'da fare completa','Duis lobortis massa imperdiet quam. Morbi nec metus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia.',0,'2016-10-14 21:18:25','0000-00-00 00:00:00',NULL,6,2,'00:00:26','00:00:02','1',0),(28,'asd','ad',0,'2016-10-17 12:14:12','0000-00-00 00:00:00',NULL,8,1,'00:00:00','00:00:00','1',0),(33,'Call John for appointment','',0,'2016-10-17 21:15:09','0000-00-00 00:00:00','2016-10-23 20:41:23',1,10,'00:00:00','00:00:00','1',0),(34,'Study new competitors','',0,'2016-10-17 21:15:26','0000-00-00 00:00:00','2016-10-30 16:30:26',7,0,'00:33:36','01:00:01','1',0),(37,'Send email to Joe','with details of briefing',0,'2016-10-17 21:17:41','0000-00-00 00:00:00',NULL,1,7,'00:00:04','00:00:00','1',0),(38,'Create a pitch for startup','',0,'2016-10-17 21:26:14','0000-00-00 00:00:00','2016-10-19 19:17:36',1,9,'01:02:30','00:15:00','1',0),(56,'Buy new software','Software 1, Software 2',0,'2016-11-01 18:52:29','0000-00-00 00:00:00',NULL,1,1,'00:00:00','00:00:00','13',0),(57,'Call Patrick ','',0,'2016-11-01 18:52:50','2016-11-18 19:55:00','2016-11-06 12:35:25',5,1,'00:00:00','00:00:00','',0),(64,'Start new project','New description here.',0,'2016-11-02 19:35:25','0000-00-00 00:00:00',NULL,1,2,'00:00:06','01:00:00','8',0),(69,'Write a letter','',0,'2016-11-03 20:40:20','2016-11-02 21:43:00','2021-01-23 08:34:51',7,1,'00:00:00','00:00:00','12',0),(70,'Publish beta program','',0,'2016-11-03 20:40:35','0000-00-00 00:00:00',NULL,15,0,'00:00:00','00:00:00','5',0),(71,'Write a newsletter','',0,'2016-11-03 20:40:56','0000-00-00 00:00:00',NULL,15,1,'00:00:01','00:00:00','3',0),(72,'Buy myKanban webApp','',0,'2016-11-03 20:41:22','0000-00-00 00:00:00','2016-11-03 20:41:31',1,11,'00:00:00','00:00:00','10',0),(74,'TEST','test',1,'2021-01-23 08:15:56','0000-00-00 00:00:00',NULL,43,2,'00:00:04','00:00:00','6',1),(75,'TEST2','',1,'2021-01-28 04:12:32','0000-00-00 00:00:00',NULL,43,1,'00:00:00','00:00:00','6',0),(76,'TEST2','',1,'2021-02-03 23:30:25','0000-00-00 00:00:00','2021-02-04 23:41:03',43,1,'00:00:00','00:00:00','3',0);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_todo`
--

DROP TABLE IF EXISTS `tasks_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_todo`
--

LOCK TABLES `tasks_todo` WRITE;
/*!40000 ALTER TABLE `tasks_todo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_last_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_daily_reminder` tinyint(1) NOT NULL DEFAULT 0,
  `user_permissions` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','One','admin@admin.com','5f4dcc3b5aa765d61d8327deb882cf99',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-13 12:27:50
