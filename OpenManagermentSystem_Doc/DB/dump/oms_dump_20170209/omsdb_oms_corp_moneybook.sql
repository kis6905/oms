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
-- Table structure for table `oms_corp_moneybook`
--

DROP TABLE IF EXISTS `oms_corp_moneybook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oms_corp_moneybook` (
  `seq` int(11) NOT NULL,
  `usedDate` varchar(10) NOT NULL,
  `category` varchar(255) NOT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `usedPlace` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `receiptPath` varchar(255) DEFAULT NULL,
  `memberId` varchar(255) NOT NULL,
  `registeredDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  PRIMARY KEY (`seq`),
  KEY `queryCondition_inx` (`memberId`,`usedDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='- member 를 삭제하더라도 기록을 남기기 위해 member 테이블과 관계맺지 않는다.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_corp_moneybook`
--

LOCK TABLES `oms_corp_moneybook` WRITE;
/*!40000 ALTER TABLE `oms_corp_moneybook` DISABLE KEYS */;
INSERT INTO `oms_corp_moneybook` VALUES (2,'2016-08-03','식대','직원','현대카드 카드팩토리',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(3,'2016-08-05','식대','직원','kbs 카페',18000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(4,'2016-08-07','식대','직원','커피소녀',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(5,'2016-08-08','식대','직원','7그램',12000,'모닝 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(6,'2016-08-09','식대','직원','커피소녀',12000,'저녁 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(7,'2016-08-10','식대','직원','할리스 커피',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 11:57:49'),(8,'2016-08-11','식대','직원','커피소녀',6000,'모닝 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(9,'2016-08-12','식대','직원','7그램',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(10,'2016-08-13','식대','직원','커피소녀',6500,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(11,'2016-08-14','식대','직원','kbs 카페',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(12,'2016-08-15','식대','직원','kbs 카페',7200,'모닝 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(13,'2016-08-16','식대','직원','현대카드 카드팩토리',8400,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(14,'2016-08-17','식대','직원','커피소녀',9000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(15,'2016-08-18','식대','직원','버거킹',25000,'야근 간식',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(16,'2016-08-19','식대','직원','7그램',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(17,'2016-08-20','식대','직원','커피소녀',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(19,'2016-08-23','식대','직원','현대카드 카드팩토리',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(20,'2016-08-24','식대','직원','kbs 카페',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(21,'2016-08-25','식대','직원','커피소녀',4000,'저녁 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(22,'2016-08-26','식대','직원','kbs 카페',12000,'점심 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(23,'2016-08-28','식대','직원','7gram',7400,'모닝 커피',NULL,'iskwon','2016-09-04 05:04:48','2016-09-04 05:04:48'),(24,'2016-09-01','식대','직원','할리스커피',8200,'모닝 커피',NULL,'iskwon','2016-09-04 08:18:31','2016-09-04 08:18:31'),(25,'2016-09-01','식대','직원','7그램',4500,'점심커피 한잔',NULL,'iskwon','2016-09-04 08:31:20','2016-09-04 11:58:18'),(26,'2016-08-01','식대','직원','커피소녀',14000,'점심',NULL,'iskwon','2016-09-04 08:47:26','2016-09-04 08:47:26'),(27,'2016-09-05','식대','직원','kbs 카페',6000,'직원 사기 증진',NULL,'iskwon','2016-09-04 11:59:50','2016-09-09 23:42:48'),(28,'2016-08-30','식대','직원','마피아 피자',154800,'회식',NULL,'yhbae','2016-09-05 03:23:15','2016-09-08 19:36:20'),(29,'2016-09-02','식대','팀원','커피소녀',22000,'팀원 사기 증진',NULL,'yhbae','2016-09-05 03:24:52','2016-10-03 10:28:22'),(30,'2016-09-06','식대','팀원','kbs 카페',10000,'팀원 사기 증진',NULL,'yhbae','2016-09-05 23:16:40','2016-10-03 10:28:46'),(31,'2016-09-06','회의','현대카드','카페 7그램',9000,'회의',NULL,'yhbae','2016-09-06 05:55:02','2016-10-03 10:28:56'),(32,'2016-09-07','식대','팀원','kbs 카페',8500,'팀원 사기 증진',NULL,'yhbae','2016-09-06 23:06:01','2016-10-03 10:29:03'),(33,'2016-09-07','식대','팀원','kbs 본관 파스쿠찌',12600,'팀원 사기 증진',NULL,'yhbae','2016-09-07 02:22:38','2016-10-03 10:29:10'),(34,'2016-09-08','식대','팀원','카페 7그램',43300,'팀원 사기 증진',NULL,'yhbae','2016-09-08 02:51:21','2016-10-03 10:29:23'),(35,'2016-09-08','식대','팀원','마피아피자',149300,'팀원 사기 증진',NULL,'yhbae','2016-09-08 19:36:59','2016-10-03 10:29:29'),(36,'2016-09-09','식대','팀원','kbs 카페',11500,'팀원 사기 증진',NULL,'yhbae','2016-09-08 23:27:29','2016-10-03 10:29:41'),(39,'2016-09-06','접대','현대카드','고깃집',65000,'접대',NULL,'iskwon','2016-09-10 01:32:57','2016-09-10 01:32:57'),(40,'2016-09-12','식대','팀원','커피소녀',29500,'팀원 사기 증진',NULL,'yhbae','2016-09-11 20:25:56','2016-09-11 20:25:56'),(41,'2016-09-12','식대','팀원','커피소녀',22500,'팀원 사기 증진',NULL,'yhbae','2016-09-11 21:46:46','2016-09-11 21:46:46'),(42,'2016-09-19','식대','팀원','kbs 카페',10500,'팀원 사기 증진',NULL,'yhbae','2016-09-18 23:08:18','2016-09-18 23:08:18'),(43,'2016-09-20','식대','팀원','kbs 카페',10400,'직원 사기 증진',NULL,'yhbae','2016-09-19 23:03:08','2016-09-19 23:03:08'),(44,'2016-09-21','식대','팀원','kbs 카페',13100,'직원 사기 증진',NULL,'yhbae','2016-09-20 23:11:08','2016-09-20 23:11:08'),(45,'2016-09-21','식대','팀원','스타벅스',33600,'팀원 사기 증진',NULL,'yhbae','2016-09-21 03:08:29','2016-09-21 03:08:29'),(46,'2016-09-21','식대','팀원','스타벅스',4100,'팀원 사기 증진',NULL,'yhbae','2016-09-21 03:46:34','2016-09-21 03:46:34'),(47,'2016-09-22','식대','팀원','kbs 카페',11100,'팀원 사기 증진',NULL,'yhbae','2016-09-21 23:06:20','2016-09-21 23:06:20'),(48,'2016-09-23','식대','팀원','커피소녀',16500,'팀원 사기 증진',NULL,'yhbae','2016-09-22 20:37:59','2016-09-22 20:37:59'),(49,'2016-09-23','도서구매','팀원','영풍문고',150000,'자기개발을 통한 실무능력 향상',NULL,'yhbae','2016-09-23 01:12:46','2016-09-23 01:12:46'),(50,'2016-09-23','회의','팀원','커피소녀',28500,'회의',NULL,'yhbae','2016-09-23 04:27:58','2016-09-23 04:27:58'),(51,'2016-09-23','회식','팀원','노래방',30000,'회식',NULL,'yhbae','2016-09-24 21:49:19','2016-09-24 21:49:19'),(52,'2016-09-24','회식','팀원','노래방',101500,'회식',NULL,'yhbae','2016-09-24 21:49:46','2016-09-24 21:49:46'),(53,'2016-09-26','식대','팀원','커피소녀',37500,'팀원 사기 증진',NULL,'yhbae','2016-09-25 21:10:23','2016-09-25 21:10:23'),(54,'2016-09-26','식대','팀원','kbs 카페',11100,'팀원 사시 증진',NULL,'yhbae','2016-09-25 23:09:31','2016-09-25 23:09:31'),(55,'2016-09-26','식대','팀원','7그램',26800,'팀원 사기 증진',NULL,'yhbae','2016-09-26 02:13:40','2016-09-26 02:13:40'),(56,'2016-09-28','식대','팀원','kbs 카페',11000,'팀원 사기 증진',NULL,'yhbae','2016-09-27 22:58:54','2016-09-27 22:58:54'),(57,'2016-09-28','식대','팀원','kbs 카페',20400,'팀원 사기 증진',NULL,'yhbae','2016-09-27 23:19:06','2016-09-27 23:19:06'),(58,'2016-09-28','회의','팀원','커피소녀',11500,'회의',NULL,'yhbae','2016-09-28 03:29:43','2016-09-28 03:29:43'),(59,'2016-09-28','회의','팀원','커피소녀',6000,'회의',NULL,'yhbae','2016-09-28 03:30:44','2016-09-28 03:30:44'),(60,'2016-09-28','식대','팀원','마포만두',15000,'간식',NULL,'yhbae','2016-09-28 05:18:25','2016-09-28 05:18:25'),(61,'2016-09-29','식대','팀원','kbs 카페',29900,'팀원 사기 증진',NULL,'yhbae','2016-09-29 00:20:44','2016-09-29 00:20:44'),(62,'2016-09-29','식대','팀원','둘둘치킨',100000,'저녁 식대',NULL,'yhbae','2016-10-02 00:36:27','2016-10-02 00:36:27'),(64,'2016-10-02','식대','팀원','커피소녀',15000,'사기증진',NULL,'iskwon','2016-10-03 07:49:19','2016-10-03 07:49:19'),(65,'2016-10-03','식대','팀원','kbs 카페',10500,'사기증진',NULL,'iskwon','2016-10-03 07:50:37','2016-10-03 07:50:37'),(67,'2016-10-04','식대','팀원','커피소녀',25500,'팀원 사기 증진',NULL,'yhbae','2016-10-03 20:25:06','2016-10-03 20:25:06'),(68,'2016-10-04','식대','팀원','kbs 카페',10500,'팀원 사기 증진',NULL,'yhbae','2016-10-03 23:04:48','2016-10-03 23:04:48'),(69,'2016-10-05','식대','팀원','kbs 카페',12000,'팀원 사기 증진',NULL,'yhbae','2016-10-04 22:59:30','2016-10-04 22:59:30'),(70,'2016-10-04','회의','팀원','카페7그램',19700,'회의',NULL,'yhbae','2016-10-05 00:49:27','2016-10-05 00:49:27'),(71,'2016-10-04','회의','팀원','카페7그램',14300,'회의',NULL,'yhbae','2016-10-05 00:50:04','2016-10-05 00:50:04'),(72,'2016-10-04','회의','팀원','카페7그램',9500,'회의',NULL,'yhbae','2016-10-05 00:50:36','2016-10-05 00:50:36'),(73,'2016-10-05','식대','팀원','티라레미수',74900,'팀원 사기 증진',NULL,'yhbae','2016-10-05 05:08:08','2016-10-05 05:08:08'),(74,'2016-10-05','식대','팀원','티라레미수',2500,'팀원 사기 증진',NULL,'yhbae','2016-10-05 05:08:51','2016-10-05 05:08:51'),(75,'2016-10-05','식대','팀원','티라레미수',4400,'팀원 사기 증진',NULL,'yhbae','2016-10-05 05:09:42','2016-10-05 05:09:42'),(76,'2016-10-05','식대','팀원','티라레미수',8000,'팀원 사기 증진',NULL,'yhbae','2016-10-05 05:10:19','2016-10-05 05:10:19'),(77,'2016-10-06','식대','팀원','글래드호텔 카페',12600,'팀원 사기 증진',NULL,'yhbae','2016-10-05 23:51:44','2016-10-05 23:51:44'),(78,'2016-10-06','식대','팀원','kbs 카페',9500,'팀원 사기 증진',NULL,'yhbae','2016-10-05 23:52:16','2016-10-05 23:52:16'),(79,'2016-10-07','식대','팀원','kbs 카페',25000,'팀원 사기 증진',NULL,'yhbae','2016-10-06 23:18:48','2016-10-06 23:18:48'),(80,'2016-10-07','회식','팀원','매드포갈릭 영등포타임스퀘어',79600,'회식',NULL,'yhbae','2016-10-09 20:18:00','2016-10-09 20:18:00'),(81,'2016-10-07','회식','팀원','키스더티라미수 타임스퀘어',14700,'회식',NULL,'yhbae','2016-10-09 20:19:15','2016-10-09 20:19:15'),(82,'2016-10-08','식대','팀원','커피소녀',21000,'팀원 사기 증진',NULL,'yhbae','2016-10-09 20:20:01','2016-10-09 20:20:01'),(83,'2016-10-10','식대','팀원','kbs 카페',12000,'팀원 사기 증진',NULL,'yhbae','2016-10-09 23:02:19','2016-10-09 23:02:19'),(84,'2016-10-11','식대','팀원','글래드호텔 카페',17400,'팀원 사기 증진',NULL,'yhbae','2016-10-10 21:33:51','2016-10-10 21:33:51'),(85,'2016-10-11','식대','팀원','kbs 카페',11500,'팀원 사기 증진',NULL,'yhbae','2016-10-10 23:00:08','2016-10-10 23:00:08'),(86,'2016-10-13','식대','팀원','kbs 카페',8500,'팀원 사기 증진',NULL,'yhbae','2016-10-13 00:16:16','2016-10-13 00:16:16'),(87,'2016-10-11','식대','팀원','7그램',8500,'사기 증진',NULL,'iskwon','2016-10-13 08:40:11','2016-10-13 08:40:11'),(89,'2016-10-14','식대','팀원','kbs 카페',12000,'팀원 사기 증진',NULL,'yhbae','2016-10-13 22:59:39','2016-10-13 22:59:39'),(90,'2016-10-17','식대','팀원','kbs 카페',9000,'팀원 사기 증진',NULL,'yhbae','2016-10-16 23:02:31','2016-10-16 23:02:31'),(91,'2016-10-17','식대','팀원','kbs 카페',12000,'팀원 사기 증진',NULL,'yhbae','2016-10-16 23:20:06','2016-10-16 23:20:06'),(92,'2016-10-18','식대','팀원','kbs 카페',8900,'팀원 사기 증진',NULL,'yhbae','2016-10-17 23:11:02','2016-10-17 23:11:02'),(93,'2016-10-18','회의','팀원','커피소녀',11000,'회의',NULL,'yhbae','2016-10-18 03:26:04','2016-10-18 03:26:04'),(94,'2016-10-19','식대','팀원','둘둘치킨',149000,'저녁 겸 회식',NULL,'yhbae','2016-10-18 21:18:47','2016-10-18 21:18:47'),(95,'2016-10-20','식대','팀원','스타벅스',20400,'팀원 사기 증진',NULL,'yhbae','2016-10-19 21:16:26','2016-10-19 21:16:26'),(96,'2016-10-20','식대','팀원','스타벅스',20300,'팀원 사기 증진',NULL,'yhbae','2016-10-19 21:16:52','2016-10-19 21:16:52'),(97,'2016-10-20','식대','팀원','kbs 카페',7500,'팀원 사기 증진',NULL,'yhbae','2016-10-19 23:58:49','2016-10-19 23:58:49'),(98,'2016-10-21','식대','팀원','아리스타',15100,'팀원 사기 증진',NULL,'yhbae','2016-10-20 23:20:07','2016-10-20 23:20:07'),(99,'2016-10-21','식대','팀원','아리스타',12900,'팀원 사기 증진',NULL,'yhbae','2016-10-20 23:28:48','2016-10-20 23:28:48'),(100,'2016-10-23','식대','팀원','커피소녀',17000,'팀원 사기 증진',NULL,'yhbae','2016-10-23 20:21:52','2016-10-23 20:21:52'),(101,'2016-10-24','식대','팀원','kbs 카페',14000,'팀원 사기 증진',NULL,'yhbae','2016-10-23 23:00:21','2016-10-23 23:00:21'),(102,'2016-10-24','식대','팀원','kbs 카페',15800,'팀원 사기 증진',NULL,'yhbae','2016-10-23 23:31:06','2016-10-23 23:31:06'),(103,'2016-10-25','식대','팀원','kbs 카페',10400,'팀원 사기 증진',NULL,'yhbae','2016-10-24 23:08:20','2016-10-24 23:08:20'),(104,'2016-10-21','회식','팀원','마피아',250600,'회식',NULL,'yhbae','2016-10-25 04:04:20','2016-11-02 02:57:53'),(105,'2016-10-25','식대','팀원','육회공작소',20000,'저녁식대',NULL,'yhbae','2016-10-28 01:11:03','2016-10-28 01:11:03'),(106,'2016-11-03','음료','팀원','kbs 카페',11000,'점심 후 커피',NULL,'yhbae','2016-11-02 23:07:35','2016-11-02 23:07:35'),(107,'2016-11-04','음료','팀원','아리스타',13600,'점심 후 커피',NULL,'yhbae','2016-11-03 23:04:23','2016-11-03 23:04:23'),(108,'2016-11-04','회식','팀원','육회공작소',43500,'회식',NULL,'yhbae','2016-11-07 19:16:22','2016-11-07 19:16:22'),(109,'2016-11-05','회식','팀원','명동찌개마을',22000,'회식',NULL,'yhbae','2016-11-07 19:16:56','2016-11-07 19:16:56'),(110,'2016-11-08','음료','팀원','kbs 카페',12500,'점심 후 커피',NULL,'yhbae','2016-11-07 22:12:17','2016-11-07 22:12:17'),(111,'2016-11-08','간식','팀원','이마트',99170,'간식 구매',NULL,'yhbae','2016-11-08 03:14:33','2016-11-16 02:41:07'),(112,'2016-11-08','회식','팀원','보드람치킨',103000,'회식',NULL,'yhbae','2016-11-08 19:18:34','2016-11-08 19:18:34'),(113,'2016-11-09','음료','팀원','kbs 카페',9000,'점심 후 커피',NULL,'yhbae','2016-11-08 23:47:14','2016-11-08 23:47:14'),(114,'2016-11-11','음료','팀원','kbs 카페',13600,'점심 후 커피',NULL,'yhbae','2016-11-10 22:08:20','2016-11-10 22:08:20'),(115,'2016-11-11','음료','팀원','kbs 카페',15900,'점심 후 커피',NULL,'yhbae','2016-11-10 22:37:43','2016-11-10 22:37:43'),(116,'2016-11-11','음료','팀원','파스쿠찌',66500,'휴식',NULL,'yhbae','2016-11-11 02:18:11','2016-11-11 02:18:11'),(117,'2016-11-15','음료','팀원','kbs 카페',11000,'점심 후 커피',NULL,'yhbae','2016-11-14 22:09:49','2016-11-14 22:09:49'),(118,'2016-11-15','저녁 겸 회식','팀원','보드람',54000,'저녁 겸 회식',NULL,'yhbae','2016-11-15 22:01:17','2016-11-15 22:01:17'),(119,'2016-11-16','음료','팀원','kbs 카페',11500,'점심 후 커피',NULL,'yhbae','2016-11-15 22:01:53','2016-11-15 22:01:53'),(120,'2016-11-16','간식','팀원','오피스디포코리아',98900,'간식 구매',NULL,'yhbae','2016-11-16 02:40:53','2016-11-16 02:41:23'),(121,'2016-11-17','음료','팀원','kbs 카페',10500,'점심 후 커피',NULL,'yhbae','2016-11-16 22:06:37','2016-11-16 22:06:37'),(122,'2016-11-18','음료','팀원','kbs 카페',18000,'점심 후 커피',NULL,'yhbae','2016-11-17 22:04:40','2016-11-17 22:04:40'),(123,'2016-11-18','음료','팀원','kbs 카페',12000,'점심 후 커피',NULL,'yhbae','2016-11-17 22:16:56','2016-11-17 22:16:56'),(124,'2016-11-19','회식','팀원','캐슬노래바',180000,'회식',NULL,'yhbae','2016-11-20 21:57:13','2016-11-20 21:57:13'),(125,'2016-11-21','회의','팀원','스타벅스',11300,'회의',NULL,'yhbae','2016-11-21 03:14:27','2016-11-21 03:14:27'),(126,'2016-11-28','음료','팀원','커피빈 코리아',28900,'식사 후 음료',NULL,'yhbae','2016-11-29 00:38:38','2016-11-29 00:38:38'),(127,'2016-11-28','음료','팀원','커피빈 코리아',17900,'식사 후 음료',NULL,'yhbae','2016-11-29 00:39:03','2016-11-29 00:39:03'),(128,'2016-11-29','저녁 겸 회식','팀원','치킨뽀끼',100000,'저녁 겸 회식',NULL,'yhbae','2016-11-29 21:00:46','2016-11-29 21:00:46'),(129,'2016-12-01','식대','팀원','구이구이',28000,'저녁 식대',NULL,'iskwon','2016-12-01 02:21:28','2016-12-01 02:21:51'),(134,'2016-12-01','식대','팀원','조은날',14500,'커피 5명',NULL,'ysjung','2016-12-04 10:23:34','2016-12-04 10:23:34'),(135,'2016-12-02','식대','팀원','엔젤위치스커피',26500,'커피 5명',NULL,'ysjung','2016-12-04 10:25:14','2016-12-04 10:25:14'),(136,'2016-12-03','식대','팀원','폴바셋',20000,'커피 4명',NULL,'ysjung','2016-12-04 10:26:06','2016-12-04 10:26:06'),(141,'2016-12-01','회식','팀원','화목순대',45000,'격려 회식',NULL,'itswoong','2016-12-05 21:13:01','2016-12-05 21:13:01'),(142,'2016-12-05','식대','팀원','테스크',10000,'테스트',NULL,'test01','2016-12-05 21:13:42','2016-12-05 21:13:42'),(143,'2016-12-01','식대','팀원','편의점',22000,'핫식스 구매',NULL,'itswoong','2016-12-05 21:16:33','2016-12-05 21:16:33'),(144,'2016-12-01','식대','팀원','나주곰탕',28000,'저녁식사',NULL,'itswoong','2016-12-05 21:17:22','2016-12-05 21:17:22'),(145,'2016-12-02','물품','팀원','알파문구',6000,'케이블구입',NULL,'itswoong','2016-12-05 21:18:02','2016-12-05 21:18:02'),(146,'2016-12-02','물품','팀원','편의점',4500,'종이컵 구입',NULL,'itswoong','2016-12-05 21:18:46','2016-12-05 21:18:46'),(147,'2016-12-02','식대','팀원','광화문참순대',25000,'저녁식사',NULL,'itswoong','2016-12-05 21:19:30','2016-12-05 21:19:30'),(148,'2016-12-04','식대','팀원','나주곰탕',166000,'저녁식사',NULL,'itswoong','2016-12-05 21:20:03','2016-12-05 21:20:03'),(149,'2016-12-05','식대','팀원','커피빈',10000,'커피 2명',NULL,'ysjung','2016-12-06 12:47:41','2016-12-06 12:47:41'),(150,'2016-12-05','식대','팀원','거성치킨',74000,'치킨과 맥주',NULL,'ysjung','2016-12-06 12:49:15','2016-12-06 12:49:15'),(151,'2016-12-06','식대','팀원','조은날',21000,'커피 8명',NULL,'ysjung','2016-12-06 12:49:53','2016-12-06 12:49:53'),(152,'2016-12-06','간식','팀원','파스쿠치',27500,'간식',NULL,'yhbae','2016-12-06 17:25:38','2016-12-06 17:25:38'),(153,'2016-12-06','식대','팀원','셀란',7000,'커피',NULL,'itswoong','2016-12-07 16:06:22','2016-12-07 16:06:22'),(154,'2016-12-07','음료','팀원','스타벅스',25500,'간식',NULL,'yhbae','2016-12-08 13:05:28','2016-12-08 13:05:28'),(155,'2016-12-07','식대','팀원','둘둘치킨',89000,'저녁 식대',NULL,'yhbae','2016-12-08 13:07:26','2016-12-08 13:07:26'),(156,'2016-12-07','택시비','국민카드','광화문',27740,'야근후 택시',NULL,'ysjung','2016-12-08 13:51:24','2016-12-08 13:51:24'),(157,'2016-12-07','식대','팀원','조은날',21000,'커피 7명',NULL,'ysjung','2016-12-08 13:52:10','2016-12-08 13:52:10'),(158,'2016-12-08','간식비','팀원','홈플러스 익스프레스',122770,'간식비',NULL,'ysjung','2016-12-08 13:53:20','2016-12-08 13:53:20'),(159,'2016-12-08','식대','팀원','스위트몬스터',31500,'커피 9명',NULL,'ysjung','2016-12-08 19:49:28','2016-12-08 19:49:28'),(160,'2016-12-09','식대','팀원','커피빈',11500,'커피 2명',NULL,'ysjung','2016-12-09 12:09:19','2016-12-09 12:09:19'),(161,'2016-12-09','음료','팀원','kbs 카페',4500,'점심 후 커피',NULL,'yhbae','2016-12-09 12:46:45','2016-12-09 12:46:45'),(162,'2016-12-07','식대','팀원','짬뽕상회',76000,'저녁식사',NULL,'itswoong','2016-12-09 21:54:48','2016-12-09 21:54:48'),(163,'2016-12-10','회식','팀원','로맨틱',112000,'격려회식',NULL,'itswoong','2016-12-11 21:28:50','2016-12-11 21:28:50'),(164,'2016-12-11','커피','팀원','파스쿠찌',11000,'커피',NULL,'itswoong','2016-12-11 21:29:52','2016-12-11 21:29:52'),(165,'2016-12-14','식대','팀원','감성타코',58300,'팀원 친목',NULL,'ysjung','2016-12-14 12:00:15','2016-12-14 12:00:15'),(166,'2016-12-13','식대','팀원','파스쿠찌',73300,'커피',NULL,'itswoong','2016-12-15 15:46:06','2016-12-15 15:46:06'),(167,'2016-12-14','교통','팀원','국민카드',15360,'야근 택시비',NULL,'itswoong','2016-12-15 15:47:10','2016-12-15 15:47:10'),(168,'2016-12-15','교통','팀원','국민카드',16200,'야근 택시비',NULL,'itswoong','2016-12-15 15:47:38','2016-12-15 15:47:38'),(169,'2016-12-15','식대','팀원','한마루화로구이',96000,'점심 식사',NULL,'ysjung','2016-12-16 10:06:05','2016-12-16 10:06:05'),(170,'2016-12-15','식대','팀원','되는집',64000,'저녁식사',NULL,'itswoong','2016-12-16 10:06:11','2016-12-16 10:06:11'),(171,'2016-12-16','교통','팀원','국민카드',15840,'야근 택시비',NULL,'itswoong','2016-12-16 10:06:56','2016-12-16 10:06:56'),(172,'2016-12-15','도서구입','팀원','교보문고',69000,'도서구매',NULL,'ysjung','2016-12-16 10:07:03','2016-12-16 10:07:03'),(173,'2016-12-16','택시비','국민카드','광화문',28780,'야근 후 택시',NULL,'ysjung','2016-12-16 10:10:51','2016-12-16 10:10:51'),(174,'2016-12-17','교통','팀원','국민카드',15720,'야근 택시비',NULL,'itswoong','2016-12-17 16:48:11','2016-12-17 16:48:11'),(175,'2016-12-17','식대','팀원','커피빈',41300,'커피',NULL,'itswoong','2016-12-17 16:48:44','2016-12-17 16:48:44'),(176,'2016-12-17','택시비','국민카드','광화문',29740,'야근해 택시비',NULL,'ysjung','2016-12-19 10:45:48','2016-12-19 10:45:48'),(177,'2016-12-19','택시비','국민카드','광화문',24500,'야근해 택시비',NULL,'ysjung','2016-12-19 10:46:24','2016-12-19 10:46:24'),(178,'2016-12-18','식대','팀원','서브웨이',15300,'주말 점심 식대',NULL,'itswoong','2016-12-19 22:22:27','2016-12-19 22:22:27'),(179,'2016-12-19','식대','팀원','김밥천국',50000,'야식비',NULL,'itswoong','2016-12-19 22:23:04','2016-12-19 22:23:04'),(180,'2016-12-19','식대','팀원','카페자스',24300,'커피 6명',NULL,'ysjung','2016-12-19 22:23:56','2016-12-19 22:23:56'),(181,'2016-12-19','기타','팀원','현대목욕탕',28000,'사우나 사용',NULL,'itswoong','2016-12-19 22:24:23','2016-12-19 22:24:23'),(182,'2016-12-19','식대','팀원','파스쿠치',21400,'커피 4명',NULL,'ysjung','2016-12-19 22:24:38','2016-12-19 22:24:38'),(183,'2016-12-19','기타','팀원','현대목욕탕',24000,'사우나 사용',NULL,'itswoong','2016-12-19 22:24:53','2016-12-19 22:24:53'),(184,'2016-12-19','식대','팀원','씨유',5700,'간식비',NULL,'itswoong','2016-12-19 22:25:25','2016-12-19 22:25:25'),(185,'2016-12-20','택시비','국민카드','광화문',29340,'야근해 택시',NULL,'ysjung','2016-12-20 13:57:14','2016-12-20 13:57:14'),(186,'2016-12-20','교통비','팀원','국민카드',15480,'야근 택시비',NULL,'itswoong','2016-12-20 21:43:06','2016-12-20 21:43:06'),(187,'2016-12-20','식대','팀원','미니스톱',8600,'간식구입',NULL,'itswoong','2016-12-20 21:43:58','2016-12-20 21:43:58'),(188,'2016-12-21','식대','팀원','세븐일레븐',10100,'간식비',NULL,'itswoong','2016-12-21 01:56:50','2016-12-21 01:56:50'),(189,'2016-12-21','교통','팀원','국민카드',16200,'야근 택시비',NULL,'itswoong','2016-12-21 11:05:07','2016-12-21 11:05:07'),(190,'2016-12-20','식대','팀원','슈퍼커피광화문점',15500,'커피 6명',NULL,'ysjung','2016-12-21 11:50:29','2016-12-21 11:50:29'),(191,'2016-12-21','식대','팀원','커피투어',46500,'커피 14명',NULL,'ysjung','2016-12-21 14:56:42','2016-12-21 14:56:42'),(192,'2016-12-21','식대','팀원','커피 투어',9000,'커피 2명',NULL,'ysjung','2016-12-21 14:57:08','2016-12-21 14:57:08'),(193,'2016-12-22','택시비','국민카드','광화문',30720,'야근해 택시비',NULL,'ysjung','2016-12-22 11:35:58','2016-12-22 11:35:58'),(194,'2016-12-12','음료','팀원','스타벅스',9400,'음료',NULL,'yhbae','2016-12-22 15:48:32','2016-12-22 15:48:32'),(195,'2016-12-16','송년회','팀원','사대부집곳간',403000,'팀 송년회',NULL,'yhbae','2016-12-22 15:49:25','2016-12-22 15:49:38'),(196,'2016-12-22','식대','팀원','김밥천국',23500,'야식비',NULL,'itswoong','2016-12-23 13:05:08','2016-12-23 13:05:08'),(197,'2016-12-22','교통비','팀원','국민카드',16680,'야근 택시비',NULL,'itswoong','2016-12-23 13:16:46','2016-12-23 13:16:46'),(198,'2016-12-23','식대','팀원','세븐일레븐',13000,'간식비',NULL,'itswoong','2016-12-23 13:17:40','2016-12-23 13:17:40'),(199,'2016-12-22','식대','팀원','지리산흑돼지',49000,'저녁식사',NULL,'itswoong','2016-12-23 13:18:41','2016-12-23 13:18:41'),(200,'2016-12-23','교통비','팀원','국민카드',16560,'야근택시비',NULL,'itswoong','2016-12-23 13:19:31','2016-12-23 13:19:31'),(201,'2016-12-23','식대','팀원','홈프러스익스프레스',193520,'간식구입',NULL,'itswoong','2016-12-23 13:20:28','2016-12-23 13:20:28'),(202,'2016-12-23','택시비','국민카드','광화문',28840,'야근해 택시비',NULL,'ysjung','2016-12-23 21:13:44','2016-12-23 21:13:44'),(203,'2016-12-24','택시비','국민카드','광화문',28920,'야근후 택시',NULL,'ysjung','2016-12-26 09:36:38','2016-12-26 09:36:38'),(204,'2016-12-27','택시비','국민카드','광화문',29100,'야근후 택시비',NULL,'ysjung','2016-12-27 09:50:11','2016-12-27 09:50:11'),(205,'2016-12-24','식대','팀원','이모네감자탕',91000,'새벽 식사',NULL,'itswoong','2016-12-27 11:59:08','2016-12-27 11:59:08'),(206,'2016-12-24','교통','팀원','국민카드',13600,'야근 택시비',NULL,'itswoong','2016-12-27 11:59:46','2016-12-27 11:59:46'),(207,'2016-12-27','교통','팀원','국민카드',15480,'야근 택시비',NULL,'itswoong','2016-12-27 12:00:13','2016-12-27 12:00:13'),(208,'2016-12-27','식대','팀원','서브웨이',14600,'저녁식사',NULL,'itswoong','2016-12-27 19:38:10','2016-12-27 19:38:10'),(209,'2016-12-28','회식','팀원','마피아피자',190400,'송년회 2차 회식',NULL,'itswoong','2016-12-28 10:03:31','2016-12-28 10:03:31'),(210,'2016-12-28','회식','팀원','캐슬노래바',100000,'회식',NULL,'yhbae','2016-12-28 13:25:05','2016-12-28 13:25:05'),(211,'2016-12-29','식대','팀원','슈퍼커피',18500,'커피 6명',NULL,'ysjung','2016-12-29 19:04:11','2016-12-29 19:04:11'),(212,'2016-12-30','식대','팀원','수퍼커피',16500,'커피 6명',NULL,'ysjung','2016-12-30 15:08:33','2016-12-30 15:08:33'),(213,'2016-12-28','식대','팀원','한옥집',29000,'저녁식사',NULL,'itswoong','2016-12-30 17:26:59','2016-12-30 17:26:59'),(214,'2016-12-29','식대','팀원','장박사부대찌개',50000,'저녁식사',NULL,'itswoong','2016-12-30 17:27:51','2016-12-30 17:27:51'),(215,'2016-12-30','회식','팀원','작은하늘',48000,'회식',NULL,'itswoong','2016-12-30 17:28:30','2016-12-30 17:28:30'),(216,'2016-12-30','식대','팀원','할매집',149000,'저녁식사',NULL,'itswoong','2017-01-02 12:11:18','2017-01-02 12:11:18'),(217,'2017-01-03','교통','팀원','국민카드',16440,'야근 택시비',NULL,'itswoong','2017-01-04 23:45:43','2017-01-04 23:45:43'),(218,'2017-01-04','교통','팀원','국민카드',15720,'야근 택시비',NULL,'itswoong','2017-01-04 23:46:35','2017-01-04 23:46:35'),(219,'2017-01-04','식대','팀원','대장금',21000,'저녁식사',NULL,'itswoong','2017-01-04 23:47:04','2017-01-04 23:47:04'),(220,'2017-01-05','교통','팀원','국민카드',16800,'택시비',NULL,'itswoong','2017-01-05 20:48:54','2017-01-05 20:48:54'),(221,'2017-01-06','식대','팀원','대장금',36000,'저녁식사',NULL,'itswoong','2017-01-08 14:05:47','2017-01-08 14:05:47'),(222,'2017-01-06','식대','팀원','서브웨이',7300,'저녁식사',NULL,'itswoong','2017-01-08 14:06:23','2017-01-08 14:06:23'),(223,'2017-01-06','식대','팀원','미티스톱',14600,'간식',NULL,'itswoong','2017-01-08 14:12:38','2017-01-08 14:12:38'),(224,'2017-01-06','교통','팀원','국민카드',16800,'택시비',NULL,'itswoong','2017-01-08 14:13:05','2017-01-08 14:13:05'),(225,'2017-01-07','회식','팀원','로맨틱키친',183000,'회식',NULL,'itswoong','2017-01-08 14:13:41','2017-01-08 14:13:41'),(226,'2017-01-07','교통','팀원','국민카드',13200,'택시비',NULL,'itswoong','2017-01-08 14:14:33','2017-01-08 14:14:33'),(227,'2017-01-07','식대','팀원','아시아아시아',64000,'저녁식사',NULL,'itswoong','2017-01-08 14:15:01','2017-01-08 14:15:01'),(228,'2017-01-08','식대','팀원','커피빈',10000,'커피',NULL,'itswoong','2017-01-08 14:15:25','2017-01-08 14:15:25'),(229,'2017-01-09','교통','팀원','국민카드',15240,'택시비',NULL,'itswoong','2017-01-16 22:01:39','2017-01-16 22:01:39'),(230,'2017-01-09','식대','팀원','한옥집',24000,'저녁식사',NULL,'itswoong','2017-01-16 22:08:13','2017-01-16 22:08:13'),(231,'2017-01-10','접대','국민카드','로맨틱 키친',142500,'현업과 회식',NULL,'itswoong','2017-01-16 22:09:16','2017-01-16 22:09:16'),(232,'2017-01-10','교통','팀원','국민카드',16200,'택시비',NULL,'itswoong','2017-01-16 22:09:43','2017-01-16 22:09:43'),(233,'2017-01-11','커피','팀원','커피빈',10000,'커피',NULL,'itswoong','2017-01-16 22:10:25','2017-01-16 22:10:25'),(234,'2017-01-11','식대','팀원','새봄떡국국수',18000,'저녁식사',NULL,'itswoong','2017-01-16 22:11:04','2017-01-16 22:11:04'),(235,'2017-01-12','교통비','팀원','국민카드',15600,'택시비',NULL,'itswoong','2017-01-16 22:11:35','2017-01-16 22:11:35'),(236,'2017-01-13','교통','팀원','국민카드',15960,'택비시',NULL,'itswoong','2017-01-16 22:12:16','2017-01-16 22:12:16'),(237,'2017-01-14','접대','국민카드','로맨틱 키친',183500,'현업과 회식',NULL,'itswoong','2017-01-16 22:12:53','2017-01-16 22:12:53'),(238,'2017-01-14','교통','팀원','국민카드',16080,'택시비',NULL,'itswoong','2017-01-16 22:14:03','2017-01-16 22:14:03'),(239,'2017-01-14','식대','팀원','김밥천국',6000,'저녁식사',NULL,'itswoong','2017-01-16 22:16:05','2017-01-16 22:16:05'),(240,'2017-01-15','식대','팀원','GS25',19550,'간식구입',NULL,'itswoong','2017-01-16 22:16:59','2017-01-16 22:16:59'),(241,'2017-01-15','교통','팀원','국민카드',14500,'택시비',NULL,'itswoong','2017-01-16 22:18:25','2017-01-16 22:18:25'),(242,'2017-01-15','식대','팀원','김밥천국',13500,'저녁식사',NULL,'itswoong','2017-01-16 22:18:59','2017-01-16 22:18:59'),(243,'2017-01-15','식대','팀원','커피빈',10400,'커피',NULL,'itswoong','2017-01-16 22:19:25','2017-01-16 22:19:25'),(244,'2017-01-16','식대','팀원','광화문 뚝감',16000,'아침식사',NULL,'itswoong','2017-01-16 22:20:20','2017-01-16 22:20:20'),(245,'2017-01-16','식대','팀원','스타벅스',65600,'커피',NULL,'itswoong','2017-01-16 22:21:00','2017-01-16 22:21:00'),(246,'2017-01-16','기타','팀원','대호사우나',7000,'사우나',NULL,'itswoong','2017-01-16 22:21:36','2017-01-16 22:21:36'),(247,'2017-01-16','회식','팀원','마피아',128400,'회식',NULL,'yhbae','2017-01-17 15:09:22','2017-01-17 15:09:22'),(248,'2017-01-17','음료','팀원','아리스타',18400,'점심 후 커피',NULL,'yhbae','2017-01-17 15:11:40','2017-01-17 15:11:40'),(249,'2017-01-19','음료','팀원','아리스타',22400,'점심 후 커피',NULL,'yhbae','2017-01-19 12:12:35','2017-01-19 12:12:35'),(250,'2017-01-13','음료','팀원','아리스타',15200,'식사후 커피',NULL,'yhbae','2017-01-19 13:05:41','2017-01-19 13:05:41'),(251,'2017-01-12','음료','팀원','아리스타',20500,'식사후커피',NULL,'yhbae','2017-01-19 13:06:30','2017-01-19 13:06:30'),(252,'2017-01-09','음료','팀원','아리스타',11800,'식사후 커피',NULL,'yhbae','2017-01-19 13:09:34','2017-01-19 13:09:34'),(253,'2017-01-06','음료','팀원','커피빈코리아',20100,'커피',NULL,'yhbae','2017-01-19 13:12:13','2017-01-19 13:12:13'),(254,'2017-01-12','점심식사','팀원','샹그리라',47000,'점심식사',NULL,'yhbae','2017-01-19 13:20:49','2017-01-19 13:20:49'),(255,'2017-01-20','간식','팀원','오피스디포코리아',70200,'간식',NULL,'yhbae','2017-01-20 10:58:45','2017-01-20 10:58:45'),(256,'2017-01-20','음료','팀원','스타벅스',17500,'식사후 커피',NULL,'yhbae','2017-01-20 13:09:51','2017-01-20 13:09:51'),(257,'2017-01-20','음료','팀원','투썸',22300,'커피',NULL,'yhbae','2017-01-23 08:01:29','2017-01-23 08:01:29'),(258,'2017-01-23','가습기','팀원','오피스디포코리아',53000,'사무실 건조함으로 인한 가습기 구매',NULL,'yhbae','2017-01-23 10:09:57','2017-01-23 10:09:57'),(259,'2017-01-23','음료','팀원','아리스타',16600,'식사후 커피',NULL,'yhbae','2017-01-23 12:15:24','2017-01-23 12:15:24'),(260,'2017-01-17','식대','팀원','미니스톱',9400,'간식',NULL,'itswoong','2017-01-24 19:48:45','2017-01-24 19:48:45'),(261,'2017-01-17','식대','팀원','오븐에빠진닭',97500,'야식',NULL,'itswoong','2017-01-24 19:49:22','2017-01-24 19:49:22'),(262,'2017-01-17','교통','팀원','국민카드',15000,'택시비',NULL,'itswoong','2017-01-24 19:49:58','2017-01-24 19:49:58'),(263,'2017-01-17','식대','팀원','나주곰탕',24000,'저녁식사',NULL,'itswoong','2017-01-24 19:51:20','2017-01-24 19:51:20'),(264,'2017-01-18','식대','팀원','gs25',54400,'간식비',NULL,'itswoong','2017-01-24 19:53:01','2017-01-24 19:53:01'),(265,'2017-01-18','교통','팀원','국민카드',15360,'택시비',NULL,'itswoong','2017-01-24 19:53:33','2017-01-24 19:53:33'),(266,'2017-01-18','회식','국민카드','비어할레',450000,'프로젝트 종료 회식 2차',NULL,'itswoong','2017-01-24 19:54:53','2017-01-24 19:54:53'),(267,'2017-01-19','회식','국민카드','센스노래장',230000,'프로젝트 종료 회식 3차',NULL,'itswoong','2017-01-24 19:55:50','2017-01-24 19:55:50'),(268,'2017-01-19','회식','국민카드','화목',71000,'프로젝트 종료 회식 4차',NULL,'itswoong','2017-01-24 19:56:47','2017-01-24 19:56:47'),(269,'2017-01-19','교통','팀원','국민카드',15840,'택시비',NULL,'itswoong','2017-01-24 19:57:16','2017-01-24 19:57:16'),(270,'2017-01-19','식대','팀원','커피빈',9300,'커피',NULL,'itswoong','2017-01-24 19:57:53','2017-01-24 19:57:53'),(271,'2017-01-20','교통','팀원','국민카드',16560,'택시비',NULL,'itswoong','2017-01-24 19:58:38','2017-01-24 19:58:38'),(272,'2017-01-20','식대','팀원','파스쿠찌',39400,'커피',NULL,'itswoong','2017-01-24 19:59:20','2017-01-24 19:59:20'),(273,'2017-01-23','식대','팀원','커피빈',16000,'커피',NULL,'itswoong','2017-01-24 19:59:51','2017-01-24 19:59:51'),(274,'2017-01-21','교통','팀원','국민카드',14900,'택시비',NULL,'itswoong','2017-01-24 20:00:53','2017-01-24 20:00:53'),(275,'2017-01-24','교통','팀원','국민카드',15600,'택시비',NULL,'itswoong','2017-01-24 20:01:31','2017-01-24 20:01:31'),(276,'2017-01-02','식대','팀원','슈퍼커피 광화문점',13000,'커피 5명',NULL,'ysjung','2017-01-25 10:29:22','2017-01-25 10:29:22'),(277,'2017-01-03','간식비','팀원','홈플러스익스프레스',148370,'간식비',NULL,'ysjung','2017-01-25 10:32:05','2017-01-25 10:32:05'),(278,'2017-01-06','식대','팀원','엔젤위치스커피',29500,'커피 5명',NULL,'ysjung','2017-01-25 10:34:18','2017-01-25 10:34:18'),(279,'2017-01-06','식대','팀원','아시아아시아',147200,'저녁식대',NULL,'ysjung','2017-01-25 10:36:55','2017-01-25 10:36:55'),(280,'2017-01-25','음료','팀원','아리스타',11800,'식사후 커피',NULL,'yhbae','2017-01-25 12:14:55','2017-01-25 12:14:55'),(281,'2017-01-07','식대','팀원','커피빈',22700,'커피 4명',NULL,'ysjung','2017-01-25 13:07:31','2017-01-25 13:07:31'),(282,'2017-01-09','식대','팀원','파스쿠치',9000,'커피 2명',NULL,'ysjung','2017-01-25 13:08:14','2017-01-25 13:08:14'),(283,'2017-01-10','식대','팀원','카페자스',14800,'커피 4명',NULL,'ysjung','2017-01-25 13:09:09','2017-01-25 13:09:09'),(284,'2017-01-12','식대','팀원','파스쿠치',37500,'커피 7명',NULL,'ysjung','2017-01-25 13:09:49','2017-01-25 13:09:49'),(285,'2017-01-13','식대','팀원','커피베이',15300,'커피 5명',NULL,'ysjung','2017-01-25 13:10:34','2017-01-25 13:10:34'),(286,'2017-01-16','식대','팀원','폴바셋',26900,'커피 8명',NULL,'ysjung','2017-01-25 13:11:27','2017-01-25 13:11:27'),(287,'2017-01-20','식대','팀원','파스쿠치',23800,'커피 5명',NULL,'ysjung','2017-01-25 13:12:52','2017-01-25 13:12:52'),(288,'2017-01-20','도서구입','팀원','교보문고',63100,'도서구입',NULL,'ysjung','2017-01-25 13:13:42','2017-01-25 13:13:42'),(289,'2017-01-24','식대','팀원','스위트 몬스터',8000,'커피 2명',NULL,'ysjung','2017-01-25 13:15:12','2017-01-25 13:15:12'),(290,'2017-01-25','식대','팀원','파스쿠치',18600,'커피 3명',NULL,'ysjung','2017-01-25 13:16:05','2017-01-25 13:16:05'),(291,'2017-01-25','회식','팀원','로맨틱 키친',129000,'회식',NULL,'itswoong','2017-01-25 21:41:15','2017-01-25 21:41:15'),(292,'2017-01-25','교통','팀원','국민카드',15600,'택시비',NULL,'itswoong','2017-01-25 21:41:48','2017-01-25 21:41:48'),(293,'2017-01-25','회식','팀원','캐슬노래방',220000,'팀회식',NULL,'yhbae','2017-01-26 12:31:27','2017-01-26 12:31:27'),(294,'2017-01-26','음료','팀원','아리스타',3000,'식사후 커피',NULL,'yhbae','2017-01-26 12:31:58','2017-01-26 12:31:58'),(295,'2017-01-26','음료','팀원','아리스타',33400,'식사후 커피',NULL,'yhbae','2017-01-26 12:32:27','2017-01-26 12:32:27'),(296,'2017-01-26','식대','팀원','이모네감자탕',45000,'식사',NULL,'itswoong','2017-01-31 10:42:22','2017-01-31 10:42:22'),(297,'2017-01-26','교통','팀원','국민카드',16920,'택시비',NULL,'itswoong','2017-01-31 10:42:44','2017-01-31 10:42:44'),(298,'2017-01-27','교통','팀원','국민카드',13000,'택시비',NULL,'itswoong','2017-01-31 10:43:15','2017-01-31 10:43:15'),(299,'2017-01-31','음료','팀원','아리스타',16400,'식사후 커피',NULL,'yhbae','2017-01-31 12:16:14','2017-01-31 12:16:14'),(300,'2017-01-31','음료','팀원','paulbassett',5300,'커피',NULL,'yhbae','2017-01-31 18:23:15','2017-01-31 18:23:15');
/*!40000 ALTER TABLE `oms_corp_moneybook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-09 21:51:34
