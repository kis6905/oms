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
-- Table structure for table `oms_com_code`
--

DROP TABLE IF EXISTS `oms_com_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oms_com_code` (
  `codeGroup` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `codeTitle` varchar(255) DEFAULT NULL,
  `codeValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codeGroup`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_com_code`
--

LOCK TABLES `oms_com_code` WRITE;
/*!40000 ALTER TABLE `oms_com_code` DISABLE KEYS */;
INSERT INTO `oms_com_code` VALUES (0,1001,'Admin','1001'),(0,1002,'User','1002'),(1,1101,'Valid Password Fail Count','10'),(2,1201,'결재 상태 코드(대기)','1201'),(2,1202,'결재 상태 코드(완료)','1202'),(2,1203,'결재 상태 코드(철회)','1203'),(2,1204,'결재 상태 코드(반려)','1204'),(3,1301,'서비스 사용 여부(사용)','1301'),(3,1302,'서비스 사용 여부(사용안함)','1302');
/*!40000 ALTER TABLE `oms_com_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-09 21:51:37
