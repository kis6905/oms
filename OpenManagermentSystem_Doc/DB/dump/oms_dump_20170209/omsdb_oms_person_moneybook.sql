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
-- Table structure for table `oms_person_moneybook`
--

DROP TABLE IF EXISTS `oms_person_moneybook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oms_person_moneybook` (
  `seq` int(11) NOT NULL,
  `usedDate` varchar(10) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `usedPlace` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `receiptPath` varchar(255) DEFAULT NULL,
  `memberId` varchar(255) NOT NULL,
  `registeredDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`seq`),
  KEY `fk_oms_person_moneybook_oms_member1_idx` (`memberId`),
  CONSTRAINT `fk_oms_person_moneybook_oms_member1` FOREIGN KEY (`memberId`) REFERENCES `oms_member` (`memberId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_person_moneybook`
--

LOCK TABLES `oms_person_moneybook` WRITE;
/*!40000 ALTER TABLE `oms_person_moneybook` DISABLE KEYS */;
INSERT INTO `oms_person_moneybook` VALUES (26,'2016-12-08','저녁식대',60000,NULL,'저녁식대',NULL,'yoo-hn','2016-12-26 10:17:45','2016-12-26 10:17:45'),(27,'2017-01-11','저녁식대',4100,NULL,'저녁식대','/resources/images/receipt/iskwon_receipt_20170115161622.png','iskwon','2017-01-12 19:22:17','2017-01-15 16:16:22'),(28,'2017-01-12','저녁식대',23000,NULL,'저녁식대','/resources/images/receipt/iskwon_receipt_20170115161516.png','iskwon','2017-01-12 19:22:57','2017-01-29 15:02:56'),(29,'2017-01-13','저녁식대',4100,NULL,'저녁식대','/resources/images/receipt/iskwon_receipt_20170115161327.png','iskwon','2017-01-15 16:13:27','2017-01-15 16:13:27'),(30,'2017-01-17','저녁식대',13500,NULL,'저녁식대','/resources/images/receipt/iskwon_receipt_20170118084002.png','iskwon','2017-01-18 08:40:02','2017-01-29 15:03:05'),(31,'2017-01-20','저녁식대',4100,NULL,'저녁식대','/resources/images/receipt/iskwon_receipt_20170123124357.png','iskwon','2017-01-23 12:43:57','2017-01-24 09:07:08'),(32,'2017-01-23','저녁식대',9100,NULL,'저녁식대','/resources/images/receipt/iskwon_receipt_20170124090613.png','iskwon','2017-01-24 09:06:13','2017-01-24 09:07:36'),(33,'2017-01-24','저녁식대',24100,NULL,'저녁식대','/resources/images/receipt/iskwon_receipt_20170201120456.png','iskwon','2017-02-01 12:04:56','2017-02-01 12:04:56'),(34,'2017-01-31','저녁식대',4100,NULL,'저녁식대','/resources/images/receipt/iskwon_receipt_20170201120534.png','iskwon','2017-02-01 12:05:34','2017-02-01 12:05:34'),(35,'2017-01-31','저녁식대',8700,NULL,'저녁식대',NULL,'sehoon','2017-02-01 12:14:35','2017-02-01 12:14:35'),(36,'2017-02-09','저녁 식대비',7000,NULL,'저녁 식대비',NULL,'park-ji','2017-02-01 18:24:42','2017-02-01 18:24:42'),(37,'2017-02-10','저녁식대',12000,NULL,'저녁식대비',NULL,'park-ji','2017-02-02 10:19:47','2017-02-02 10:19:47'),(38,'2017-02-02','저녁식대비',13000,NULL,'저녁식대비',NULL,'park-ji','2017-02-02 11:20:57','2017-02-02 11:20:57'),(39,'2017-02-01','저녁식대',24100,NULL,'저녁식대','/resources/images/receipt/iskwon_receipt_20170203070435.png','iskwon','2017-02-03 07:04:35','2017-02-03 07:04:35');
/*!40000 ALTER TABLE `oms_person_moneybook` ENABLE KEYS */;
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
