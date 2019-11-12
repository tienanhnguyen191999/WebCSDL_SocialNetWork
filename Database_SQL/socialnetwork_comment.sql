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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `parent` int(11) DEFAULT '0',
  `comment_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (61,30,45,'xin chào mọi người',0,'2019-11-07 16:33:29'),(62,30,45,'dsahkjdsakjdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss',0,'2019-11-07 16:33:44'),(63,30,45,'đá',0,'2019-11-07 16:34:53'),(64,30,45,'xin chào',0,'2019-11-07 16:34:55'),(65,30,45,'ádsad',0,'2019-11-07 16:38:04'),(66,30,45,'xin chào',0,'2019-11-07 16:38:07'),(67,30,45,'dsad',0,'2019-11-07 16:44:49'),(68,30,45,'xin chào mọi người',0,'2019-11-07 16:44:59'),(69,30,44,'xin chào',0,'2019-11-07 16:45:11'),(70,30,45,'Tiến anh',0,'2019-11-07 16:45:48'),(71,31,54,'sad',0,'2019-11-07 17:20:49'),(72,31,54,'Hello ',0,'2019-11-07 17:20:52'),(73,31,54,'=]]',0,'2019-11-07 17:20:54'),(74,31,54,'Xin chào ',0,'2019-11-07 17:20:56'),(75,31,54,'Nha',0,'2019-11-07 17:20:58'),(76,31,53,'xin chào ạ',0,'2019-11-07 17:23:01'),(77,32,55,'xin chào',0,'2019-11-07 17:29:13'),(78,32,55,'zc',0,'2019-11-07 17:31:31'),(79,32,55,'xin chào',0,'2019-11-07 17:31:45'),(80,NULL,NULL,NULL,0,'2019-11-07 17:34:06'),(81,NULL,NULL,NULL,0,'2019-11-07 17:34:16'),(82,NULL,NULL,NULL,0,'2019-11-07 17:36:19'),(83,NULL,NULL,NULL,0,'2019-11-07 17:36:22'),(84,NULL,NULL,NULL,0,'2019-11-07 17:36:47'),(85,NULL,NULL,NULL,0,'2019-11-07 17:36:56'),(86,NULL,NULL,NULL,0,'2019-11-07 17:37:20'),(87,32,55,'xin chào',0,'2019-11-07 17:37:46'),(88,32,55,'xin chào',0,'2019-11-07 17:40:30'),(89,32,55,'xin chào',0,'2019-11-07 17:42:44'),(90,32,55,'xin chào',0,'2019-11-07 17:44:08'),(91,32,55,'xin%20ch%C3%A0o',0,'2019-11-07 17:44:38'),(92,32,55,'\'+ val + \'',0,'2019-11-07 17:50:33'),(93,32,55,'\'+ val + \'',0,'2019-11-07 17:51:02'),(94,32,55,'\'+ val + \'',0,'2019-11-07 17:51:02'),(95,32,55,'\'+ val + \'',0,'2019-11-07 17:51:02'),(96,32,55,'xin%20chaodsa',0,'2019-11-07 17:51:04'),(97,32,55,'dsad',0,'2019-11-07 17:51:55'),(98,32,55,'dsad',0,'2019-11-07 17:51:56'),(99,32,55,'dsad',0,'2019-11-07 17:51:57'),(100,32,55,'dsad',0,'2019-11-07 17:51:57'),(101,32,55,'dsad',0,'2019-11-07 17:51:57'),(102,32,55,'dsaddsad',0,'2019-11-07 17:51:57'),(103,32,55,'dsaddsadsad',0,'2019-11-07 17:51:58'),(104,32,55,'dsaddsadsadsadsa',0,'2019-11-07 17:51:58'),(105,32,55,'dsaddsadsadsadsadsa',0,'2019-11-07 17:51:58'),(106,32,55,'dsaddsadsadsadsadsadsa',0,'2019-11-07 17:51:58'),(107,32,55,'dsaddsadsadsadsadsadsadsad',0,'2019-11-07 17:51:59'),(108,32,55,'dsaddsadsadsadsadsadsadsad',0,'2019-11-07 17:52:27'),(109,32,55,'dsaddsadsadsadsadsadsadsad',0,'2019-11-07 17:52:27'),(110,32,55,'xin chào',0,'2019-11-07 17:52:43'),(111,32,55,'xin%20ch%C3%A0o',0,'2019-11-07 17:53:23'),(112,25,32,'sạdklsad',0,'2019-11-08 01:48:05'),(113,25,32,'sạdklsad',0,'2019-11-08 01:48:05'),(114,25,32,'sạdklsad',0,'2019-11-08 01:48:06'),(115,25,32,'sạdklsad',0,'2019-11-08 01:48:06'),(116,25,32,'sạdklsad',0,'2019-11-08 01:48:07'),(117,25,32,'sạdklsad',0,'2019-11-08 01:48:07'),(118,25,32,'s%E1%BA%A1dklsad',0,'2019-11-08 01:48:13'),(119,25,32,'dsads',0,'2019-11-08 01:49:10'),(120,25,32,'xin%20ch%C3%A0o',0,'2019-11-08 01:49:13'),(121,25,31,'sadasjdlksad',0,'2019-11-08 01:50:30'),(122,25,31,'fuck%20yoi',0,'2019-11-08 01:50:34'),(123,25,31,'ahskjdhsaddddddddddddddddddddddddddddddadsadsadsakjdksakdjsakdsald',0,'2019-11-08 01:51:18'),(124,25,30,'sadas',0,'2019-11-08 01:54:26'),(125,25,30,'sad',0,'2019-11-08 01:54:27'),(126,25,30,'%E1%BA%A5djlksajdsaljdksajdlksajdjsajdlkjslkdjlksajlkdjlksajdlkjaslkjdlksajdsalkda',0,'2019-11-08 01:54:31'),(127,25,30,'jkjaslkjdlkajlkjdlksajlkdjsaljdlkjsadlksajdlkjsalkdjsajdlkjsalkdjsajdlksajdlksad',0,'2019-11-08 01:54:46'),(128,25,32,'dsadjsajdksad%5C',0,'2019-11-08 04:01:22'),(129,33,56,'Xin%20ch%C3%A0o%20m%E1%BB%8Di%20ng%C6%B0%E1%BB%9Di',0,'2019-11-08 12:25:33'),(130,33,56,'xin chào',0,'2019-11-08 12:37:14'),(131,25,32,'xin chào',0,'2019-11-08 12:54:07'),(132,25,32,'sadsad',0,'2019-11-08 12:57:31'),(133,25,32,'xin chào',0,'2019-11-08 12:57:34'),(134,25,31,'đá',0,'2019-11-08 13:04:26'),(135,22,57,'Xin chào',0,'2019-11-08 13:08:48'),(136,22,58,'dasdad',0,'2019-11-09 02:55:17'),(137,22,58,'xin chào',0,'2019-11-09 02:55:21'),(138,22,65,'dasd',0,'2019-11-09 03:11:32'),(139,22,60,'sadsad',0,'2019-11-09 03:12:09'),(140,22,61,'dsadsad',0,'2019-11-09 03:26:28'),(141,22,62,'dasd',0,'2019-11-09 03:29:11'),(142,22,63,'asdasd',0,'2019-11-09 03:29:14'),(143,22,64,'hello',0,'2019-11-09 03:29:17'),(144,35,72,'tienanhnguyenDa Comment',0,'2019-11-09 15:55:17'),(145,35,72,'asdasdsad',0,'2019-11-09 15:55:36'),(146,35,71,'Như shit, go hell ',0,'2019-11-09 15:56:15'),(147,35,72,'Xin trào',0,'2019-11-09 16:14:08'),(148,35,72,'dsadsad',0,'2019-11-09 16:14:37'),(149,29,42,'dấd',0,'2019-11-09 16:19:32'),(150,29,37,'xin chao',0,'2019-11-09 16:28:22'),(151,29,37,'sad',0,'2019-11-09 16:36:31'),(152,29,42,'Xin chafo',0,'2019-11-09 16:51:36'),(153,22,65,'dadsa',0,'2019-11-09 17:07:52'),(154,29,43,'Xin chaof moij nguowif',0,'2019-11-09 17:08:12'),(155,22,41,'xin chao',0,'2019-11-09 17:11:15'),(156,22,42,'xin chao',0,'2019-11-09 17:13:11'),(157,22,65,'dasdsad',0,'2019-11-09 17:16:55'),(158,22,42,'Xin chao` lan 2',0,'2019-11-09 17:17:12'),(159,22,43,'tienanh',0,'2019-11-09 17:41:03'),(160,22,43,'Liên Minh',0,'2019-11-09 17:43:28'),(161,22,42,'dsak;ldsaldl;sad',0,'2019-11-09 17:45:06'),(162,22,42,'dsadsakdsad',0,'2019-11-09 17:45:28'),(163,22,42,'dhaskjhdsad',0,'2019-11-09 17:45:36'),(164,22,65,'đá',0,'2019-11-09 17:58:26'),(165,22,43,'fasfsad',0,'2019-11-09 17:58:35'),(166,22,42,'sdasdsad',0,'2019-11-09 18:00:08'),(167,25,65,'XIn chào óc ',0,'2019-11-10 03:52:24'),(168,25,61,'Shit post',0,'2019-11-10 05:24:23'),(169,25,59,'frewf',0,'2019-11-10 05:26:39'),(170,25,59,'dsad',0,'2019-11-10 05:26:43'),(171,36,72,'dxkdjlkfjdslk',0,'2019-11-11 04:16:47'),(172,36,71,'sdklasl',0,'2019-11-11 04:17:02'),(173,35,68,'hjhk',0,'2019-11-11 04:28:06'),(174,35,68,'fgfdgfgf',0,'2019-11-11 04:28:16'),(175,35,68,'<script>alert(\'hello\')</script>',0,'2019-11-11 04:28:41');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
