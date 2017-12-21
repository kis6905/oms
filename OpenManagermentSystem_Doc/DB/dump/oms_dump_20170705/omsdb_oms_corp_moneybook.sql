-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 114.202.137.254    Database: omsdb
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oms_corp_moneybook`
--

DROP TABLE IF EXISTS oms_corp_moneybook;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE oms_corp_moneybook (
  seq int(11) NOT NULL,
  usedDate varchar(10) NOT NULL,
  category varchar(255) NOT NULL,
  customer varchar(255) DEFAULT NULL,
  usedPlace varchar(255) DEFAULT NULL,
  price int(11) NOT NULL,
  note varchar(255) NOT NULL,
  receiptPath varchar(255) DEFAULT NULL,
  memberId varchar(255) NOT NULL,
  registeredDate datetime NOT NULL,
  modifiedDate datetime NOT NULL,
  PRIMARY KEY (seq)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_corp_moneybook`
--

INSERT INTO oms_corp_moneybook VALUES (0,'2017-02-23','식대','팀원','커피소녀',24000,'음료',NULL,'iskwon','2017-02-23 00:09:30','2017-02-23 00:09:30'),(1,'2017-02-15','음료','팀원','카드팩토리',15000,'음료',NULL,'iskwon','2017-02-23 00:09:47','2017-02-23 00:09:47'),(2,'2017-02-10','식대','현대카드','문배동육칼',16000,'야근 식대',NULL,'roh0sun','2017-02-23 15:13:43','2017-02-23 15:15:02'),(3,'2017-02-16','교통비','현대카드','여의도',28800,'심야 퇴근',NULL,'roh0sun','2017-02-23 15:14:42','2017-02-23 15:14:42'),(4,'2017-02-17','교통비','현대카드','여의도',29880,'심야 퇴근',NULL,'roh0sun','2017-02-23 15:15:39','2017-02-23 15:15:39'),(5,'2017-02-17','식대','현대카드','다미',6000,'야근 식대',NULL,'roh0sun','2017-02-23 15:16:14','2017-02-23 15:16:14'),(6,'2017-02-04','교통','본인','현대카드',31560,'택시비',NULL,'itswoong','2017-02-25 19:26:56','2017-02-25 19:26:56'),(7,'2017-02-06','식대','팀원','스타벅스',44000,'커피',NULL,'itswoong','2017-02-25 19:27:40','2017-02-25 19:27:40'),(8,'2017-02-06','물품','팀원','영풍문고',15800,'다이어리 구입',NULL,'itswoong','2017-02-25 19:30:21','2017-02-25 19:30:21'),(9,'2017-02-08','식대','팀원','티타임헬씨',13100,'커피',NULL,'itswoong','2017-02-25 19:30:57','2017-02-25 19:30:57'),(10,'2017-02-10','식대','팀원','커피소녀',13000,'커피',NULL,'itswoong','2017-02-25 19:31:16','2017-02-25 19:31:16'),(11,'2017-02-10','식대','팀원, 추천인력','장독대 김치찌개',104000,'회식 1차',NULL,'itswoong','2017-02-25 19:36:40','2017-02-25 19:36:40'),(12,'2017-02-11','회식','팀원, 추천인력','와바',381000,'회식 2차',NULL,'itswoong','2017-02-25 19:37:20','2017-02-25 19:37:20'),(13,'2017-02-11','회식','팀원, 추천인력','난장',30000,'회식 3차',NULL,'itswoong','2017-02-25 19:55:34','2017-02-25 19:55:34'),(14,'2017-02-13','교통','본인','현대카드',29640,'택시비',NULL,'itswoong','2017-02-25 19:57:53','2017-02-25 19:57:53'),(15,'2017-02-14','회식','국민카드','라도스트',51600,'국민카드 회식 3차',NULL,'itswoong','2017-02-25 20:00:53','2017-02-25 20:00:53'),(16,'2017-02-15','식대','팀원','GS25',59300,'간식비',NULL,'itswoong','2017-02-25 20:01:45','2017-02-25 20:01:45'),(17,'2017-02-16','식대','팀원','티타임헬씨',27200,'커피',NULL,'itswoong','2017-02-25 20:02:38','2017-02-25 20:02:38'),(18,'2017-02-17','회식','현대카드 운영팀','맨지기가매치킨',190000,'현대카드 운영팀 회식',NULL,'itswoong','2017-02-25 20:03:52','2017-02-25 20:03:52'),(19,'2017-02-18','식대','팀원','커피소녀',8000,'커피',NULL,'itswoong','2017-02-25 20:04:15','2017-02-25 20:04:15'),(20,'2017-02-21','식대','팀원','스타벅스',29900,'커피',NULL,'itswoong','2017-02-25 20:04:38','2017-02-25 20:04:38'),(21,'2017-02-22','교통','본인','현대카드',29880,'택시비',NULL,'itswoong','2017-02-25 20:58:24','2017-02-25 20:58:24'),(22,'2017-02-23','식대','팀원','스티머스',14000,'커피',NULL,'itswoong','2017-02-25 20:59:09','2017-02-25 20:59:09'),(23,'2017-02-23','식대','팀원','스타벅스',9200,'커피',NULL,'itswoong','2017-02-25 21:06:54','2017-02-25 21:06:54'),(24,'2017-02-23','식대','팀원','GS25',41100,'간식비',NULL,'itswoong','2017-02-25 21:08:39','2017-02-25 21:08:39'),(25,'2017-02-23','회식','팀원','비봉',150000,'팀 회식 1차',NULL,'itswoong','2017-02-25 21:11:28','2017-02-25 21:11:47'),(26,'2017-02-24','회식','팀원','마피아피자',238300,'팀 회식 2차',NULL,'itswoong','2017-02-25 21:12:57','2017-02-25 21:12:57'),(27,'2017-02-24','회식','팀원','치킨비어',136500,'회식',NULL,'itswoong','2017-02-25 21:24:13','2017-02-25 21:24:13'),(28,'2017-02-25','식대','팀원','GS25',8000,'간식비',NULL,'itswoong','2017-02-25 21:25:02','2017-02-25 21:25:02'),(29,'2017-02-25','식대','팀원','스타벅스',30400,'커피',NULL,'itswoong','2017-02-25 21:25:33','2017-02-25 21:25:33'),(30,'2017-02-28','식대','팀원','파스꾸찌',17000,'커피',NULL,'itswoong','2017-03-02 18:21:49','2017-03-02 18:21:49'),(31,'2017-03-06','간식','팀원','gs25',27900,'간식',NULL,'yhbae','2017-03-07 14:17:31','2017-03-07 14:17:31'),(32,'2017-03-06','음료','팀원','커피빈코리아',18000,'커피',NULL,'yhbae','2017-03-07 14:18:22','2017-03-07 14:18:22'),(33,'2017-03-06','음료','팀원','아리스타',12600,'커피',NULL,'yhbae','2017-03-07 14:19:03','2017-03-07 14:19:03'),(34,'2017-03-06','간식','팀원','오피스디포코리아',63550,'간식',NULL,'yhbae','2017-03-07 14:20:14','2017-03-07 14:20:14'),(35,'2017-03-07','회식','팀원','쿠치나후',200000,'팀원 회식',NULL,'yhbae','2017-03-07 14:21:28','2017-03-07 14:21:28'),(36,'2017-03-08','음료','팀원','아리스타',27200,'식사후 커피',NULL,'yhbae','2017-03-09 14:50:34','2017-03-09 14:50:34'),(37,'2017-03-13','음료','팀원','아리스타',20300,'식사후 커피',NULL,'yhbae','2017-03-15 11:18:23','2017-03-15 11:18:23'),(38,'2017-03-16','음료','팀원','아리스타',36700,'식사후 커피',NULL,'yhbae','2017-03-20 12:42:47','2017-03-20 12:42:47'),(39,'2017-03-15','음료','팀원','아리스타',16400,'식사후 커피',NULL,'yhbae','2017-03-20 12:43:15','2017-03-20 12:43:15'),(40,'2017-03-20','음료','팀원','아리스타',28400,'식사후 커피',NULL,'yhbae','2017-03-20 12:53:45','2017-03-20 12:53:45'),(41,'2017-03-21','음료','팀원','paulbassett',27900,'식사후 커피',NULL,'yhbae','2017-03-21 12:23:15','2017-03-21 12:23:15'),(43,'2017-03-28','교육용품','팀원','영풍문고',42500,'교육용 도서 구매',NULL,'yhbae','2017-03-30 11:19:29','2017-03-30 11:19:29'),(44,'2017-03-30','음료','팀원','아리스타',26700,'식사후 커피',NULL,'yhbae','2017-03-30 14:13:48','2017-03-30 14:13:48'),(45,'2017-03-30','간식','팀원','오피스디포코리아',99900,'간식',NULL,'yhbae','2017-03-30 14:14:25','2017-03-30 14:14:25'),(46,'2017-03-31','회식','팀원','마피아',298800,'팀회식',NULL,'yhbae','2017-03-31 15:43:52','2017-03-31 15:43:52'),(47,'2017-03-31','음료','팀원','paulbassett',53000,'팀원 회의',NULL,'yhbae','2017-03-31 15:47:57','2017-03-31 15:47:57'),(48,'2017-04-04','사무용품','팀원','오피스디포코리아',74600,'사무용품 구매',NULL,'yhbae','2017-04-05 14:20:47','2017-04-05 14:20:47'),(49,'2017-03-01','회식','팀원','와바',217900,'인프라기술팀 회식 2차',NULL,'itswoong','2017-04-06 12:35:25','2017-04-06 12:35:25'),(50,'2017-03-01','교통비','팀원','현대카드',29160,'택시비',NULL,'itswoong','2017-04-06 12:37:36','2017-04-06 12:37:36'),(51,'2017-03-01','식대','팀원','스타벅스',36200,'커피',NULL,'itswoong','2017-04-06 13:11:19','2017-04-06 13:11:19'),(52,'2017-03-05','식대','팀원','커피소녀',11500,'커피',NULL,'itswoong','2017-04-06 13:11:57','2017-04-06 13:11:57'),(53,'2017-03-07','식대','팀원','스타벅스',18000,'커피',NULL,'itswoong','2017-04-06 13:13:08','2017-04-06 13:13:08'),(54,'2017-03-08','회식','팀원','꼴통치킨',110000,'야식',NULL,'itswoong','2017-04-06 13:14:48','2017-04-06 13:14:48'),(55,'2017-03-08','교통','팀원','현대카드',29280,'택시비',NULL,'itswoong','2017-04-06 13:15:46','2017-04-06 13:15:46'),(56,'2017-03-10','회식','팀원','침킨비어',119000,'회식',NULL,'itswoong','2017-04-06 13:17:45','2017-04-06 13:17:45'),(57,'2017-03-09','식대','팀원','장독대김치끼개',10000,'저녁식사',NULL,'itswoong','2017-04-06 13:19:30','2017-04-06 13:19:30'),(58,'2017-03-11','식대','팀원','스타벅스',34300,'커피',NULL,'itswoong','2017-04-06 13:20:34','2017-04-06 13:20:34'),(59,'2017-03-13','교통','팀원','현대카드',30480,'택시비',NULL,'itswoong','2017-04-06 13:21:35','2017-04-06 13:21:35'),(60,'2017-03-13','식대','팀원','스타벅스',13300,'커피',NULL,'itswoong','2017-04-06 13:25:40','2017-04-06 13:25:40'),(61,'2017-03-14','회식','팀원','칸트치킨',289000,'이옥희과장 결혼축하 회식 2차',NULL,'itswoong','2017-04-06 13:27:06','2017-04-06 13:27:06'),(62,'2017-03-16','회식','팀원','칸느치킨',91000,'격려 회식',NULL,'itswoong','2017-04-06 13:27:53','2017-04-06 13:27:53'),(63,'2017-03-17','식대','팀원','티라레미수',12400,'커피',NULL,'itswoong','2017-04-06 13:29:14','2017-04-06 13:29:14'),(64,'2017-03-17','식대','팀원','티타임헬씨',17000,'커피',NULL,'itswoong','2017-04-06 13:29:46','2017-04-06 13:29:46'),(65,'2017-03-17','식대','팀원','gs25',11070,'간식비',NULL,'itswoong','2017-04-06 13:30:19','2017-04-06 13:30:19'),(66,'2017-03-18','식대','팀원','오페라빈',24200,'커피',NULL,'itswoong','2017-04-06 13:38:01','2017-04-06 13:38:01'),(67,'2017-03-20','식대','팀원','스타벅스',21200,'커피',NULL,'itswoong','2017-04-06 14:33:23','2017-04-06 14:35:23'),(68,'2017-03-22','회식','팀원','칸느치킨',54600,'격려회식',NULL,'itswoong','2017-04-06 14:34:00','2017-04-06 14:34:00'),(69,'2017-03-29','식대','팀원','스타벅스',12300,'커피',NULL,'itswoong','2017-04-06 14:34:35','2017-04-06 14:34:35'),(70,'2017-04-05','음료','팀원','아리스타',16600,'식사후 커피',NULL,'yhbae','2017-04-10 16:13:40','2017-04-10 16:13:40'),(71,'2017-04-10','음료','팀원','텀브커피',2500,'커피',NULL,'yhbae','2017-04-10 19:04:55','2017-04-10 19:04:55'),(72,'2017-04-10','음료','팀원','텀브커피',12200,'커피',NULL,'yhbae','2017-04-10 19:05:24','2017-04-10 19:05:24'),(73,'2017-04-10','음료','팀원','공차',8400,'커피',NULL,'yhbae','2017-04-11 17:49:39','2017-04-11 17:49:39'),(74,'2017-04-11','음료','팀원','7그램',10000,'커피',NULL,'yhbae','2017-04-11 17:50:11','2017-04-11 17:50:11'),(75,'2017-04-11','음료','팀원','7그램',47400,'커피',NULL,'yhbae','2017-04-11 17:51:04','2017-04-11 17:51:04'),(76,'2017-04-12','음료','팀원','paulbassett',8700,'커피',NULL,'yhbae','2017-04-12 19:50:58','2017-04-12 19:50:58'),(77,'2017-04-13','음료','팀원','아리스타',26200,'커피',NULL,'yhbae','2017-04-17 09:22:37','2017-04-17 09:22:37'),(78,'2017-04-13','음료','팀원','아리스타',6000,'커피',NULL,'yhbae','2017-04-17 09:23:02','2017-04-17 09:23:02'),(79,'2017-04-17','회식','팀원','마피아피자',146900,'팀회식',NULL,'yhbae','2017-04-21 16:55:07','2017-04-21 16:55:07'),(80,'2017-04-18','회식','팀원','칠성포차',36000,'팀회식',NULL,'yhbae','2017-04-21 16:58:24','2017-04-21 16:58:24'),(81,'2017-04-21','음료','팀원','paulbassett',15700,'커피',NULL,'yhbae','2017-04-21 16:59:49','2017-04-21 16:59:49'),(82,'2017-04-21','식사','팀원','소문난부자돼지국밥',20000,'야근식대',NULL,'yhbae','2017-04-24 10:24:20','2017-04-24 10:24:20'),(83,'2017-04-24','음료','팀원','아리스타',24400,'커피',NULL,'yhbae','2017-04-24 16:20:59','2017-04-24 16:20:59'),(84,'2017-04-03','식대','팀원','할리스커피',26400,'커피',NULL,'itswoong','2017-04-25 10:49:47','2017-04-25 10:49:47'),(85,'2017-04-04','회식','팀원','칸느치킨',232000,'b2b오픈기념 회식',NULL,'itswoong','2017-04-25 10:52:34','2017-04-25 10:52:34'),(86,'2017-04-05','식대','팀원','위캔카페',14500,'커피',NULL,'itswoong','2017-04-25 10:53:54','2017-04-25 10:53:54'),(87,'2017-04-07','식대','팀원','커피소녀',26000,'커피',NULL,'itswoong','2017-04-25 10:54:48','2017-04-25 10:54:48'),(88,'2017-04-07','도서','팀원','영풍문고',73100,'도서구입',NULL,'itswoong','2017-04-25 10:56:38','2017-04-25 10:56:38'),(89,'2017-04-09','식대','팀원','버거킹',8900,'저녁식사',NULL,'itswoong','2017-04-25 10:57:25','2017-04-25 10:57:25'),(90,'2017-04-09','식대','팀원','스타벅스',6100,'커피',NULL,'itswoong','2017-04-25 10:58:49','2017-04-25 10:58:49'),(91,'2017-04-11','식대','팀원','카페7그램',29700,'커피',NULL,'itswoong','2017-04-25 10:59:32','2017-04-25 10:59:32'),(92,'2017-04-12','식대','팀원','스타벅스',17600,'커피',NULL,'itswoong','2017-04-25 11:01:01','2017-04-25 11:01:01'),(93,'2017-04-12','식대','팀원','스타벅스',4900,'커피',NULL,'itswoong','2017-04-25 11:01:39','2017-04-25 11:01:39'),(94,'2017-04-12','식대','팀원','감성타코',66000,'저녁식사',NULL,'itswoong','2017-04-25 11:02:57','2017-04-25 11:02:57'),(95,'2017-04-12','식대','팀원','45도',35000,'저녁식사',NULL,'itswoong','2017-04-25 11:03:23','2017-04-25 11:03:23'),(96,'2017-04-13','접대','국민카드','로맨틱 키친',58000,'국민카드 현업과 회식',NULL,'itswoong','2017-04-25 11:04:07','2017-04-25 11:04:07'),(97,'2017-04-13','교통','팀원','국민카드',16440,'택시비',NULL,'itswoong','2017-04-25 11:04:33','2017-04-25 11:04:33'),(98,'2017-04-15','회식','팀원','마피아',143900,'격려회식',NULL,'itswoong','2017-04-25 11:05:24','2017-04-25 11:05:24'),(99,'2017-04-18','회식','팀원','생활맥주',106500,'격려회식',NULL,'itswoong','2017-04-25 11:05:59','2017-04-25 11:05:59'),(100,'2017-04-19','식대','팀원','스타벅스',11700,'커피',NULL,'itswoong','2017-04-25 11:06:51','2017-04-25 11:06:51'),(101,'2017-04-21','회식','팀원','마피아',179300,'팀회식 2차',NULL,'itswoong','2017-04-25 11:07:30','2017-04-25 11:07:30'),(102,'2017-04-24','식대','팀원','스타벅스',26100,'커피',NULL,'itswoong','2017-04-25 11:08:04','2017-04-25 11:08:04'),(103,'2017-04-24','음료','팀원','paulbassett',12000,'커피',NULL,'yhbae','2017-04-25 13:11:59','2017-04-25 13:11:59'),(104,'2017-04-25','회식','팀원','포리타',28500,'점심',NULL,'yhbae','2017-04-25 13:12:46','2017-04-25 13:12:46'),(105,'2017-04-25','회식','팀원','paulbassett',11000,'식사후 커피',NULL,'yhbae','2017-04-25 13:13:12','2017-04-25 13:13:12'),(106,'2017-04-26','회식','팀원','남오토코',137500,'회식',NULL,'yhbae','2017-04-27 16:48:39','2017-04-27 16:48:39'),(107,'2017-04-27','음료','팀원','아리스타',23900,'커피',NULL,'yhbae','2017-04-27 17:42:04','2017-04-27 17:42:04'),(108,'2017-04-27','도서','팀원','영풍문고',58000,'도서구매',NULL,'yhbae','2017-04-28 09:45:22','2017-04-28 16:59:14'),(109,'2017-04-26','식대','팀원','스타벅스',14000,'커피',NULL,'itswoong','2017-04-28 13:43:43','2017-04-28 13:43:43'),(110,'2017-04-27','회식','팀원','시원',77900,'b2b종료회식 3차',NULL,'itswoong','2017-04-28 13:45:11','2017-04-28 13:45:11'),(111,'2017-04-27','식대','팀원, 현대카드 운영팀','여의도맛집생수정',81000,'저녁식사',NULL,'itswoong','2017-04-28 13:45:42','2017-04-28 13:45:42'),(112,'2017-04-28','회식','팀원','세양원',102000,'팀회식',NULL,'yhbae','2017-04-28 17:02:51','2017-04-28 17:02:51'),(113,'2017-04-28','사무용품','팀원','오피스디포코리아',1900,'사무용품 구매',NULL,'yhbae','2017-04-28 17:03:58','2017-04-28 17:03:58'),(114,'2017-04-28','음료','팀원','달콤커피',23400,'식사후 커피',NULL,'yhbae','2017-04-28 17:04:39','2017-04-28 17:04:39'),(115,'2017-04-28','음료','팀원','아리스타',19500,'커피',NULL,'yhbae','2017-05-02 09:43:05','2017-05-02 09:43:05'),(116,'2017-05-02','음료','팀원','paulbassett',11000,'커피',NULL,'yhbae','2017-05-02 17:08:22','2017-05-02 17:08:22'),(117,'2017-04-28','식대','팀원','스타벅스',11600,'커피',NULL,'itswoong','2017-05-08 10:39:26','2017-05-08 10:39:26'),(118,'2017-05-04','음료','팀원','paulbassett',14200,'커피',NULL,'yhbae','2017-05-15 18:23:28','2017-05-15 18:23:28'),(119,'2017-05-10','음료','팀원','커피빈코리아',28200,'커피',NULL,'yhbae','2017-05-15 18:24:05','2017-05-15 18:24:05'),(120,'2017-05-10','음료','팀원','커피빈코리아',15500,'커피',NULL,'yhbae','2017-05-15 18:24:42','2017-05-15 18:24:42'),(121,'2017-05-11','음료','팀원','텀브커피',12600,'커피',NULL,'yhbae','2017-05-15 18:25:16','2017-05-15 18:25:16'),(122,'2017-05-12','음료','팀원','더착한커피',9000,'커피',NULL,'yhbae','2017-05-15 18:25:46','2017-05-15 18:25:46'),(123,'2017-05-15','음료','팀원','티타임헬씨',25100,'커피',NULL,'yhbae','2017-05-15 18:26:43','2017-05-15 18:26:43'),(124,'2017-05-08','tlreo','팀원','데바수스',16000,'커피',NULL,'itswoong','2017-05-17 17:21:05','2017-05-17 17:21:05'),(125,'2017-05-10','식대','팀원','스무디핫도그',10600,'커피',NULL,'itswoong','2017-05-17 17:22:11','2017-05-17 17:22:11'),(126,'2017-05-10','식대','팀원','골목길',68000,'저녁식사',NULL,'itswoong','2017-05-17 17:22:52','2017-05-17 17:22:52'),(127,'2017-05-10','회식','팀원','생활맥주',139500,'회식',NULL,'itswoong','2017-05-17 17:24:39','2017-05-17 17:24:39'),(128,'2017-05-11','식대','팀원','아리스타',34200,'커피',NULL,'itswoong','2017-05-17 17:25:58','2017-05-17 17:25:58'),(129,'2017-05-16','식대','팀원','아리스타',30600,'커피',NULL,'itswoong','2017-05-17 17:32:03','2017-05-17 17:32:03'),(130,'2017-05-17','도서 구매','팀원','영풍문고',54000,'도서 구매',NULL,'yhbae','2017-05-18 08:38:08','2017-05-18 08:38:08'),(131,'2017-05-18','야근식대','팀원','고봉삼계탕',56000,'야근식대',NULL,'yhbae','2017-05-19 10:00:40','2017-05-19 10:00:40'),(132,'2017-05-18','음료','팀원','paulbassett',23500,'커피',NULL,'yhbae','2017-05-19 10:01:08','2017-05-19 10:01:08'),(133,'2017-05-19','음료','팀원','커피소녀',15500,'커피',NULL,'yhbae','2017-05-19 10:17:38','2017-05-19 10:17:38'),(134,'2017-05-19','음료','팀원','스타벅스',23900,'커피',NULL,'yhbae','2017-05-19 13:07:44','2017-05-19 13:07:44'),(135,'2017-05-19','음료','팀원','스타벅스',23900,'커피',NULL,'yhbae','2017-05-19 15:01:58','2017-05-19 15:01:58'),(136,'2017-05-19','음료','팀원','스타벅스',12300,'커피',NULL,'yhbae','2017-05-19 15:02:22','2017-05-19 15:02:22'),(137,'2017-05-22','음료','팀원','아리스타',40800,'식사후 커피',NULL,'yhbae','2017-05-22 16:27:40','2017-05-22 16:27:40'),(138,'2017-05-23','회식','팀원','육회공작소',63000,'팀원 회식',NULL,'yhbae','2017-05-23 08:53:13','2017-05-23 08:53:13'),(139,'2017-05-23','음료','팀원','스티머스',28000,'식사후 커피',NULL,'yhbae','2017-05-23 13:54:48','2017-05-23 13:54:48'),(140,'2017-05-18','회식','팀원','태인양고기',28000,'팀회식',NULL,'itswoong','2017-05-24 09:31:26','2017-05-24 09:31:26'),(141,'2017-05-18','회식','팀원','마피아피자',92400,'팀회식2차',NULL,'itswoong','2017-05-24 09:32:04','2017-05-24 09:32:04'),(142,'2017-05-19','식대','팀원','스티머스',35000,'커피',NULL,'itswoong','2017-05-24 09:32:38','2017-05-24 09:32:38'),(143,'2017-05-19','교통','본인','현대카드',7700,'회의 참석',NULL,'itswoong','2017-05-24 09:33:38','2017-05-24 09:33:38'),(144,'2017-05-23','회식','팀원','마피아피자',115500,'팀회식',NULL,'yhbae','2017-05-25 12:18:01','2017-05-25 12:18:01'),(145,'2017-05-23','회식','팀원','태인양고기',98000,'팀원 회식',NULL,'yhbae','2017-05-25 12:18:33','2017-05-25 12:18:33'),(146,'2017-05-25','음료','팀원','아리스타',20400,'식사후 커피',NULL,'yhbae','2017-05-25 12:18:51','2017-05-25 12:18:51'),(147,'2017-05-26','음료','팀원','스타벅스',17900,'커피',NULL,'yhbae','2017-05-29 12:59:51','2017-05-29 12:59:51'),(148,'2017-05-29','음료','팀원','델타카페',21000,'커피',NULL,'yhbae','2017-05-29 13:00:21','2017-05-29 13:00:21'),(149,'2017-05-29','회식','팀원','정동각',54000,'팀회식',NULL,'yhbae','2017-05-29 13:00:52','2017-05-29 13:00:52'),(150,'2017-05-24','식대','팀원','텀브커피',12000,'면담',NULL,'itswoong','2017-05-30 10:11:38','2017-05-30 10:11:54'),(151,'2017-05-24','식대','팀원','티타임헬씨',10300,'커피',NULL,'itswoong','2017-05-30 10:12:22','2017-05-30 10:12:22'),(152,'2017-05-25','식대','팀원','엔제리너스',35800,'커피',NULL,'itswoong','2017-05-30 10:12:55','2017-05-30 10:12:55'),(153,'2017-05-25','회식','팀원','마피아',112000,'회식',NULL,'itswoong','2017-05-30 10:13:32','2017-05-30 10:13:32'),(154,'2017-05-26','식대','팀원','스타벅스',35600,'커피',NULL,'itswoong','2017-05-30 10:14:04','2017-05-30 10:14:04'),(155,'2017-05-30','음료','현대카드','스티머스',17500,'점심 후 커피',NULL,'yhbae','2017-05-30 12:54:01','2017-05-30 12:54:53'),(156,'2017-05-30','음료','팀원','빽다방',9000,'점심 후 음료',NULL,'yhbae','2017-05-30 12:54:35','2017-05-30 12:54:35'),(157,'2017-05-30','물품','팀원','오피스디포',236100,'사무용품구입',NULL,'itswoong','2017-05-30 14:30:04','2017-05-30 14:30:04'),(158,'2017-05-31','음료','팀원','아리스타',24000,'식사후 커피',NULL,'yhbae','2017-06-01 12:16:21','2017-06-01 12:16:21'),(159,'2017-05-31','음료','팀원','gs25',20200,'농구모임',NULL,'yhbae','2017-06-01 12:17:31','2017-06-01 12:17:31'),(160,'2017-06-01','음료','팀원','아리스타',27400,'식사후 커피',NULL,'yhbae','2017-06-01 12:17:50','2017-06-01 12:17:50'),(161,'2017-06-01','음료','팀원','스타벅스',12600,'커피',NULL,'yhbae','2017-06-02 09:11:12','2017-06-02 09:11:12'),(162,'2017-06-02','음료','팀원','스티머스',19000,'커피',NULL,'yhbae','2017-06-02 17:39:28','2017-06-02 17:39:28'),(163,'2017-05-31','식대','팀원','스타벅스',25800,'커피',NULL,'itswoong','2017-06-05 15:22:33','2017-06-05 15:22:33'),(164,'2017-06-01','식대','팀원','스타벅스',20800,'커피',NULL,'itswoong','2017-06-05 15:24:49','2017-06-05 15:24:49'),(165,'2017-06-03','교통','팀원','현대카드',32640,'택시비',NULL,'itswoong','2017-06-05 15:25:32','2017-06-05 15:25:32'),(166,'2017-06-05','식대','팀원','티타임헬씨',15100,'커피',NULL,'itswoong','2017-06-05 15:26:01','2017-06-05 15:26:01'),(167,'2017-06-05','식대','팀원','오피스디포',51750,'간식비',NULL,'itswoong','2017-06-05 15:26:27','2017-06-05 15:26:27'),(168,'2017-06-08','식대','팀원','스타벅스',27700,'커피',NULL,'itswoong','2017-06-12 10:31:38','2017-06-12 10:31:38'),(169,'2017-06-08','식대','팀원','아리스타',35000,'커피',NULL,'itswoong','2017-06-12 10:32:09','2017-06-12 10:32:09'),(170,'2017-06-08','식대','팀원','아리스타',2800,'커피',NULL,'itswoong','2017-06-12 10:32:30','2017-06-12 10:32:30'),(171,'2017-06-09','회식','현대카드 운영팀, 팀원','맨지기가매치킨',137000,'회식',NULL,'itswoong','2017-06-12 10:33:24','2017-06-12 10:33:24'),(172,'2017-06-09','식대','팀원','카페7그램',21400,'커피',NULL,'itswoong','2017-06-12 10:34:04','2017-06-12 10:34:04'),(173,'2017-06-09','회식','팀원','걸짝종로점',157000,'회식2차',NULL,'itswoong','2017-06-12 10:34:57','2017-06-12 10:34:57'),(174,'2017-06-07','음료','팀원','티타임헬씨',25600,'식사후 커피',NULL,'yhbae','2017-06-12 13:27:22','2017-06-12 13:27:22'),(175,'2017-06-12','음료','팀원','티타임헬씨',10800,'식사후 커피',NULL,'yhbae','2017-06-12 13:27:45','2017-06-12 13:27:45'),(176,'2017-06-14','음료','팀원','스티머스',14000,'식사후 커피',NULL,'yhbae','2017-06-14 18:23:19','2017-06-14 18:23:19'),(177,'2017-06-14','음료','팀원','카페7그램',59600,'커피',NULL,'yhbae','2017-06-14 18:23:43','2017-06-14 18:23:57'),(178,'2017-06-15','회식','팀원','아라곤',55000,'팀회식',NULL,'yhbae','2017-06-16 12:47:33','2017-06-16 12:47:33'),(179,'2017-06-15','음료','팀원','공차',34100,'식사후 커피',NULL,'yhbae','2017-06-16 12:48:07','2017-06-16 12:48:07'),(180,'2017-06-16','식대','팀원','글래드호텔',13200,'커피',NULL,'itswoong','2017-06-19 11:29:51','2017-06-19 11:29:51'),(181,'2017-06-17','식대','팀원','커피소녀',20500,'커피',NULL,'itswoong','2017-06-19 11:30:34','2017-06-19 11:30:34'),(182,'2017-06-18','식대','팀원','커피소녀',22500,'커피',NULL,'itswoong','2017-06-19 11:30:59','2017-06-19 11:30:59'),(183,'2017-06-19','식대','팀원','스타벅스',20600,'커피',NULL,'itswoong','2017-06-19 11:31:19','2017-06-19 11:31:19'),(184,'2017-06-20','회식','팀원','맨지기가매치킨',73000,'팀원 회식',NULL,'yhbae','2017-06-20 08:50:24','2017-06-20 08:50:24'),(185,'2017-06-19','식대','팀원','티타임헬씨',28800,'커피',NULL,'itswoong','2017-06-22 16:08:46','2017-06-22 16:08:46'),(186,'2017-06-21','식대','팀원','아리스타',28200,'커피',NULL,'itswoong','2017-06-22 16:09:16','2017-06-22 16:09:16'),(187,'2017-06-21','식대','팀장들','아이젠호프',77500,'현카PM모임',NULL,'itswoong','2017-06-22 16:10:46','2017-06-22 16:10:46'),(188,'2017-06-22','식대','팀원','스타벅스',18400,'신규인력 면담',NULL,'itswoong','2017-06-22 16:11:39','2017-06-22 16:11:39'),(189,'2017-06-22','팀 회식','팀원','육전면사무소',89500,'팀 회식',NULL,'yhbae','2017-06-26 12:31:39','2017-06-26 12:31:39'),(190,'2017-06-22','팀 회식','팀원','이태원천상',54000,'팀 회식',NULL,'yhbae','2017-06-26 12:32:05','2017-06-26 12:32:05'),(191,'2017-06-20','음료','팀원','델타카페',11000,'식사후 커피',NULL,'yhbae','2017-06-26 13:20:09','2017-06-26 13:20:09'),(192,'2017-06-23','식대','팀원','러브섬',13500,'커피',NULL,'itswoong','2017-06-27 14:08:20','2017-06-27 14:08:20'),(193,'2017-06-23','식대','팀원','러브섬',33500,'커피',NULL,'itswoong','2017-06-27 14:08:41','2017-06-27 14:08:41'),(194,'2017-06-27','음료','팀원','아리스타',14500,'식사후 커피',NULL,'yhbae','2017-06-29 09:44:19','2017-06-29 09:44:19'),(195,'2017-06-28','사무용품 및 간식','팀원','오피스디포코리아',204050,'사무용품 구매',NULL,'yhbae','2017-06-29 09:45:04','2017-06-29 09:45:04'),(196,'2017-06-27','물품','팀원','프리스비',99000,'맥북어댑터구입',NULL,'itswoong','2017-06-29 20:36:55','2017-06-29 20:36:55'),(197,'2017-06-29','식대','팀원','스타벅스',16900,'커피',NULL,'itswoong','2017-06-29 20:37:44','2017-06-29 20:37:44'),(198,'2017-06-30','커피','팀원','스타벅스',48400,'회의',NULL,'yhbae','2017-06-30 09:23:00','2017-06-30 09:23:00'),(199,'2017-06-30','회의','팀원','달콤커피',33100,'회의',NULL,'yhbae','2017-06-30 12:16:32','2017-06-30 12:16:32'),(200,'2017-06-29','회식','팀원','마피아',34500,'면담',NULL,'itswoong','2017-07-04 09:13:34','2017-07-04 09:13:34'),(201,'2017-06-30','식대','팀원','스타벅스',30400,'회의',NULL,'itswoong','2017-07-04 09:14:17','2017-07-04 09:14:17'),(202,'2017-07-03','식대','팀원','파스쿠지',10000,'커피',NULL,'itswoong','2017-07-04 09:14:48','2017-07-04 09:14:48');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed