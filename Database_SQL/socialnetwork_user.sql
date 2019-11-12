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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT 'user.png',
  `poster` varchar(200) DEFAULT 'poster.png',
  `age` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `day` varchar(2) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `work` varchar(45) DEFAULT NULL,
  `about` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `iduser_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'tienanh',NULL,NULL,NULL,NULL,'poster.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'tienanh',NULL,NULL,NULL,NULL,'poster.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'tienanh',NULL,NULL,NULL,NULL,'poster.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'tienanh',NULL,NULL,NULL,NULL,'poster.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'tienanh',NULL,NULL,NULL,NULL,'poster.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'tienanh',NULL,NULL,NULL,NULL,'poster.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,'poster.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,'poster.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'das',NULL,NULL,NULL,NULL,'poster.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'as','as','a','sASas',NULL,'poster.png',NULL,NULL,'on','2','Mar','2002','BHS','sAS',NULL,NULL),(11,'tienanh','NGuyen','tienanhnguyen191999@gmail.com','mrciik99',NULL,'poster.png',NULL,NULL,'male','2','Feb','2001','VNM','HaNoi',NULL,NULL),(12,'Thanh','Binh','tienanhnguyen191999@gmail.com.vn','mrcool99',NULL,'poster.png',NULL,NULL,'male','4','Apr','2007','VNM','HaNoi',NULL,NULL),(13,'thanhBinh','Nguyen','binh123@gmail.com','mrcool99',NULL,'poster.png',NULL,NULL,'male','2','Jan','2000','NRU','tienanh',NULL,NULL),(14,'tienanh','nugyen','tienanh213@gmail.cpm','123456',NULL,'poster.png',NULL,NULL,'male','2','Feb','2002','BRB','HaNoi',NULL,NULL),(15,'tuenanh','nguyen','23@gmial.com','mrcool99',NULL,'poster.png',NULL,NULL,'female','2','Mar','2001','BHR','sad',NULL,NULL),(16,'tienanh','tienans','asds@gmail.com','mrcool99',NULL,'poster.png',NULL,NULL,'male','1','Mar','2002','AZE','dsa',NULL,NULL),(17,'das','dsa','dsa@gmail.com','123432',NULL,'poster.png',NULL,NULL,'male','1','Feb','2002','AZE','HaNoi',NULL,NULL),(18,'abc','123','abc@gmail.com','123456',NULL,'poster.png',NULL,NULL,'male','4','Feb','2004','DNK','asd',NULL,NULL),(19,'tieanh','nguyen','tienanhnguyen191999@gmail.com.vb','mrcool99',NULL,'poster.png',NULL,NULL,'male','2','Jan','2000','AFG','hanoi',NULL,NULL),(20,'dasd','dsad','ads@gfmail.com','123456',NULL,'poster.png',NULL,NULL,'male','2','Feb','2001','DZA','HaNoi',NULL,NULL),(21,'dasd','sad','2@gmail.com','adsadasd',NULL,'poster.png',NULL,NULL,'male','2','Feb','2002','DZA','asd',NULL,NULL),(22,'tienanh','nguyen','123456@gmail.com','123456','716848460220917833721331.jpg','bia15599542228350939169.jpg',NULL,NULL,'male','2','Apr','2004','DZA','HaNoi',NULL,NULL),(23,'tienanh','nguyen','123456@gmail.com','123456','user.png','poster.png',NULL,NULL,'male','2','Apr','2004','DZA','HaNoi',NULL,NULL),(24,'tienanh','nguyen','123456@gmail.com','123456','user.png','poster.png',NULL,NULL,'male','2','Apr','2004','DZA','HaNoi',NULL,NULL),(25,'abc','abc','abc@gmail.com.vn','123456','user.png','poster.png',NULL,NULL,'male','17','Nov','2009','AZE','hanoi',NULL,NULL),(26,'tienhanh','nguyen','1234567@gmail.com','123456','user.png','poster.png',NULL,NULL,'male','18','Nov','2011','BHS','sad',NULL,NULL),(27,'sad','sad','1@gmai.com','123456','user.png','poster.png',NULL,NULL,'male','3','Jun','2000','AIA','dsa',NULL,NULL),(28,'wqe','eqw','123456@gmail.co','123456','user.png','poster.png',NULL,NULL,'male','18','Jan','2002','AUT','hanoi',NULL,NULL),(29,'das','dsa','a@abc.com','mrcool99','user.png','poster.png',NULL,NULL,'male','4','Mar','2004','CUB','dsa',NULL,NULL),(30,'tienanh','nguyen','tienanh@gmail.com','mrcool99','user.png','poster.png',NULL,NULL,'male','6','Mar','2004','ALB','123213',NULL,NULL),(31,'asd','das','tienanhnguyen1919999@gmail.com','mrcool99','user.png','poster.png',NULL,NULL,'male','4','Apr','2002','AGO','tienanh',NULL,NULL),(32,'dsad','dsad','asdsd@gmail.com','123456','user.png','poster.png',NULL,NULL,'male','4','Nov','2001',NULL,'',NULL,NULL),(33,'tienanh','Nguyen','tienanhnguyne191999@gmail.com','mrcool99','user.png','poster.png',NULL,NULL,'male','5','Mar',NULL,'ASM','Ha Nội',NULL,NULL),(34,'tienanh','nguyen','tienanh@gmail.com.vn','mrcool99','envato50768763577534605.png','poster.png',NULL,NULL,'male',NULL,NULL,NULL,NULL,'sad',NULL,NULL),(35,'tiennanh','nguyen','abcd1234@gmail.com','mrcool99','799638528023409625281649.jpg','bia25220808544633275046.jpg',NULL,NULL,'male','4','Apr','2002','AUT','HaNoi',NULL,NULL),(36,'tienanh','Nguyen','tienanhnguyen191999@gmail.com.cg','mrcool99','9ac010f4790487f1507b0a65e5ef3e658627538105304890003.jpg','bia166284190881606402180.jpg',NULL,NULL,'female','14','Sep','2009','AUS','hanoi',NULL,NULL);
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

-- Dump completed on 2019-11-12 19:54:10
