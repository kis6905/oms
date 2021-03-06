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
-- Table structure for table `oms_member`
--

DROP TABLE IF EXISTS `oms_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oms_member` (
  `memberId` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `passwordFailCnt` int(11) NOT NULL DEFAULT '0',
  `memberName` varchar(255) NOT NULL,
  `gradeCodeGroup` int(11) NOT NULL,
  `gradeCode` int(11) NOT NULL,
  `corpCardLimit` int(11) DEFAULT NULL,
  `registeredDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`memberId`),
  KEY `fk_oms_member_oms_com_code_idx` (`gradeCodeGroup`,`gradeCode`),
  CONSTRAINT `fk_oms_member_oms_com_code` FOREIGN KEY (`gradeCodeGroup`, `gradeCode`) REFERENCES `oms_com_code` (`codeGroup`, `code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_member`
--

LOCK TABLES `oms_member` WRITE;
/*!40000 ALTER TABLE `oms_member` DISABLE KEYS */;
INSERT INTO `oms_member` VALUES ('admin','772898cd01656a0b68e2c80efde7bb8e4c865acd79f71cea0624f8001e736632',0,'관리자',0,1001,1000000,'2016-12-01 01:42:48','2016-12-04 11:22:04','2017-02-03 10:00:04'),('iskwon','11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d',0,'권일수',0,1001,1000000,'2016-09-03 02:00:01','2016-12-03 08:42:58','2017-01-15 16:12:26'),('itswoong','1f4995213d8bf6e54c6e2ea83cde6c7c7ef477abe03d653acd75f81c97a531a1',0,'한수웅',0,1002,2000000,'2016-11-29 21:09:29','2016-12-03 04:55:54','2017-01-31 10:44:41'),('kimgayoung','11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d',0,'김가영',0,1002,0,'2016-12-28 12:01:22','2016-12-28 12:01:22','2017-01-02 13:12:28'),('leesomi','11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d',0,'이소미',0,1002,0,'2017-01-02 09:23:01','2017-01-02 09:23:01','2017-01-02 10:14:09'),('park-ji','11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d',0,'박정인',0,1002,0,'2016-12-28 12:00:41','2016-12-28 12:00:41','2017-02-02 12:21:44'),('parkchan','32abfcfead181759a69b28136e55812bbc433b36151d1e139b5104aea31bbd9f',0,'박찬',0,1002,1000000,'2016-11-29 21:02:13','2017-01-02 13:09:48','2017-01-02 17:29:47'),('rladkfl7','7d28d0fd60bf088e1a25a675099090ca1bf77428a74a0a15b1f0cabbf8d81de1',0,'김아리',0,1002,1000000,'2016-12-26 10:11:44','2017-01-02 13:25:53','2017-01-02 13:24:42'),('sdwoo','11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d',0,'우성두',0,1002,0,'2016-12-26 10:01:57','2016-12-31 21:04:17','2017-01-19 12:10:43'),('sehoon','11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d',0,'최세훈',0,1002,0,'2017-02-01 12:12:01','2017-02-01 12:12:01','2017-02-01 12:16:05'),('test01','11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d',0,'테스트',0,1002,1000000,'2016-12-05 21:11:22','2016-12-26 12:47:04','2017-01-01 21:39:19'),('yhbae','11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d',0,'배영환',0,1002,1000000,'2016-09-05 03:21:49','2016-12-04 20:25:44','2017-02-06 09:11:03'),('yoo-hn','11556783b5d1c42555cae755df65582c3fbb00240cf60239c537fafc92b86f6d',0,'유하나',0,1002,0,'2016-12-26 10:09:28','2016-12-26 10:09:28','2017-01-01 22:31:11'),('ysjung','d21dd495e13a1e53ca0bbebb1aa7c2a4385b5f1098fc0228c1ae567948a1d1a4',0,'정용석',0,1002,1000000,'2016-11-29 21:06:41','2016-12-04 10:29:49','2017-02-05 23:55:21');
/*!40000 ALTER TABLE `oms_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-09 21:51:36
