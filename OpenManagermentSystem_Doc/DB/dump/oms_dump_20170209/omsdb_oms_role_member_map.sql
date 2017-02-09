-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 52.79.169.39    Database: omsdb
-- ------------------------------------------------------
-- Server version	5.7.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oms_role_member_map`
--

DROP TABLE IF EXISTS `oms_role_member_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oms_role_member_map` (
  `roleId` int(11) NOT NULL,
  `memberId` varchar(255) NOT NULL,
  PRIMARY KEY (`roleId`,`memberId`),
  KEY `fk_oms_role_member_map_oms_role1_idx` (`roleId`),
  KEY `fk_oms_role_member_map_oms_member1_idx` (`memberId`),
  CONSTRAINT `fk_oms_role_member_map_oms_member1` FOREIGN KEY (`memberId`) REFERENCES `oms_member` (`memberId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oms_role_member_map_oms_role1` FOREIGN KEY (`roleId`) REFERENCES `oms_role` (`roleId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_role_member_map`
--

LOCK TABLES `oms_role_member_map` WRITE;
/*!40000 ALTER TABLE `oms_role_member_map` DISABLE KEYS */;
INSERT INTO `oms_role_member_map` VALUES (0,'admin'),(0,'iskwon'),(1,'admin'),(1,'iskwon'),(1,'itswoong'),(1,'parkchan'),(1,'rladkfl7'),(1,'test01'),(1,'yhbae'),(1,'ysjung'),(2,'admin'),(2,'iskwon'),(2,'itswoong'),(2,'kimgayoung'),(2,'leesomi'),(2,'park-ji'),(2,'parkchan'),(2,'rladkfl7'),(2,'sdwoo'),(2,'sehoon'),(2,'test01'),(2,'yhbae'),(2,'yoo-hn'),(2,'ysjung'),(3,'admin'),(3,'iskwon'),(3,'itswoong'),(3,'kimgayoung'),(3,'leesomi'),(3,'park-ji'),(3,'parkchan'),(3,'rladkfl7'),(3,'sdwoo'),(3,'sehoon'),(3,'test01'),(3,'yhbae'),(3,'yoo-hn'),(3,'ysjung'),(4,'admin'),(4,'iskwon'),(4,'itswoong'),(4,'kimgayoung'),(4,'leesomi'),(4,'park-ji'),(4,'parkchan'),(4,'rladkfl7'),(4,'sdwoo'),(4,'sehoon'),(4,'test01'),(4,'yhbae'),(4,'yoo-hn'),(4,'ysjung'),(5,'admin'),(5,'iskwon'),(5,'itswoong'),(5,'rladkfl7'),(5,'yhbae'),(5,'ysjung');
/*!40000 ALTER TABLE `oms_role_member_map` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-09 21:51:35
