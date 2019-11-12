-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: socialnetwork
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `noti_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_get_noti` int(11) DEFAULT NULL,
  `user_action` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `link` varchar(45) DEFAULT NULL,
  `noti_at` timestamp NULL DEFAULT NULL,
  `seen` int(11) DEFAULT '0',
  PRIMARY KEY (`noti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,29,22,1,'newfeed#post43','2019-11-09 17:58:35',0),(2,29,22,1,'newfeed#post42','2019-11-09 18:00:08',0),(8,22,25,22,'newsfeed#post60','2019-11-10 05:27:10',1),(16,34,22,3,'#','2019-11-10 10:25:45',0),(17,33,22,3,'#','2019-11-10 10:25:46',0),(18,32,22,3,'#','2019-11-10 10:25:47',0),(19,31,22,3,'#','2019-11-10 10:25:47',0),(20,30,22,3,'#','2019-11-10 10:25:48',0),(22,34,22,3,'#','2019-11-10 10:27:15',0),(23,33,22,3,'#','2019-11-10 10:27:16',0),(24,32,22,3,'#','2019-11-10 10:27:17',0),(25,31,22,3,'#','2019-11-10 10:27:17',0),(26,30,22,3,'#','2019-11-10 10:27:18',0),(33,34,22,3,'#','2019-11-10 10:30:30',0),(34,33,22,3,'#','2019-11-10 10:30:32',0),(35,32,22,3,'#','2019-11-10 10:30:32',0),(36,31,22,3,'#','2019-11-10 10:30:33',0),(37,30,22,3,'#','2019-11-10 10:30:34',0),(38,28,22,3,'#','2019-11-10 11:03:54',0),(39,28,22,3,'#','2019-11-10 11:04:01',0),(40,28,22,3,'#','2019-11-10 11:04:02',0),(41,27,22,3,'#','2019-11-10 11:04:18',0),(42,26,22,3,'#','2019-11-10 11:04:18',0),(43,24,22,3,'#','2019-11-10 11:04:19',0),(44,23,22,3,'#','2019-11-10 11:04:19',0),(45,21,22,3,'#','2019-11-10 11:04:20',0),(46,20,22,3,'#','2019-11-10 11:04:21',0),(47,19,22,3,'#','2019-11-10 11:04:21',0),(48,18,22,3,'#','2019-11-10 11:04:21',0),(49,5,22,3,'#','2019-11-10 11:04:24',0),(50,4,22,3,'#','2019-11-10 11:04:24',0),(51,22,35,21,'newsfeed#post73','2019-11-10 11:35:45',0),(52,22,35,21,'newsfeed#post65','2019-11-10 11:35:50',0),(53,22,35,21,'newsfeed#post64','2019-11-10 11:35:51',0),(54,22,35,21,'newsfeed#post63','2019-11-10 11:35:52',0),(55,22,35,22,'newsfeed#post28','2019-11-10 11:35:53',0),(56,22,35,22,'newsfeed#post62','2019-11-10 11:36:05',0),(58,35,36,1,'newsfeed#post72','2019-11-11 04:16:47',1),(59,35,36,21,'newsfeed#post72','2019-11-11 04:16:55',1),(60,35,36,22,'newsfeed#post71','2019-11-11 04:16:57',1),(61,35,36,1,'newsfeed#post71','2019-11-11 04:17:02',1),(63,34,35,3,'#','2019-11-11 04:26:39',0),(64,33,35,3,'#','2019-11-11 04:26:40',0),(65,32,35,3,'#','2019-11-11 04:26:40',0),(66,31,35,3,'#','2019-11-11 04:26:41',0),(67,30,35,3,'#','2019-11-11 04:26:42',0),(68,29,35,3,'#','2019-11-11 04:26:43',0);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-12 19:54:10
