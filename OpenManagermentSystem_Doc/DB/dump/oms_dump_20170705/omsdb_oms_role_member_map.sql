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
-- Table structure for table `oms_role_member_map`
--

DROP TABLE IF EXISTS oms_role_member_map;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE oms_role_member_map (
  roleId int(11) NOT NULL,
  memberId varchar(255) NOT NULL,
  PRIMARY KEY (roleId,memberId),
  KEY fk_oms_role_member_map_oms_role1_idx (roleId),
  KEY fk_oms_role_member_map_oms_member1_idx (memberId),
  CONSTRAINT fk_oms_role_member_map_oms_member1 FOREIGN KEY (memberId) REFERENCES oms_member (memberId) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_oms_role_member_map_oms_role1 FOREIGN KEY (roleId) REFERENCES oms_role (roleId) ON DELETE CASCADE ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_role_member_map`
--

INSERT INTO oms_role_member_map VALUES (0,'admin'),(0,'iskwon'),(1,'admin'),(1,'iskwon'),(1,'itswoong'),(1,'roh0sun'),(1,'yhbae'),(1,'ysjung'),(2,'admin'),(2,'choyj'),(2,'iskwon'),(2,'itswoong'),(2,'jangtae87'),(2,'kimgayoung'),(2,'klareast'),(2,'leeesomi'),(2,'leehoon'),(2,'parkchan'),(2,'qkrwjddls2'),(2,'roh0sun'),(2,'shchoi'),(2,'yhbae'),(2,'ysjung'),(3,'admin'),(3,'choyj'),(3,'iskwon'),(3,'itswoong'),(3,'jangtae87'),(3,'kimgayoung'),(3,'klareast'),(3,'leeesomi'),(3,'leehoon'),(3,'parkchan'),(3,'qkrwjddls2'),(3,'roh0sun'),(3,'shchoi'),(3,'yhbae'),(3,'ysjung'),(4,'admin'),(4,'choyj'),(4,'iskwon'),(4,'itswoong'),(4,'jangtae87'),(4,'kimgayoung'),(4,'klareast'),(4,'leeesomi'),(4,'leehoon'),(4,'parkchan'),(4,'qkrwjddls2'),(4,'roh0sun'),(4,'shchoi'),(4,'yhbae'),(4,'ysjung'),(5,'admin'),(5,'iskwon'),(5,'itswoong'),(5,'roh0sun'),(5,'yhbae');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
