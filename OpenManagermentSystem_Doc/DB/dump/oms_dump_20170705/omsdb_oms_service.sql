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
-- Table structure for table `oms_service`
--

DROP TABLE IF EXISTS oms_service;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE oms_service (
  serviceId int(11) NOT NULL,
  roleId int(11) NOT NULL,
  title varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  sliderImage varchar(255) NOT NULL,
  iconImage varchar(255) NOT NULL,
  pageName varchar(255) NOT NULL,
  pageUrl varchar(255) NOT NULL,
  useYNCodeGroup int(11) NOT NULL,
  useYNCode int(11) NOT NULL,
  registeredDate datetime NOT NULL,
  modifiedDate datetime NOT NULL,
  PRIMARY KEY (serviceId),
  KEY fk_oms_service_oms_role1_idx (roleId),
  KEY fk_oms_service_oms_com_code1_idx (useYNCodeGroup,useYNCode),
  CONSTRAINT fk_oms_service_oms_com_code1 FOREIGN KEY (useYNCodeGroup, useYNCode) REFERENCES oms_com_code (codeGroup, `code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_oms_service_oms_role1 FOREIGN KEY (roleId) REFERENCES oms_role (roleId) ON DELETE NO ACTION ON UPDATE NO ACTION
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_service`
--

INSERT INTO oms_service VALUES (1,1,'법카 관리','법인카드 사용 내역을 관리할 수 있습니다.','slider-service-01.png','icon-service-01.png','corp_moneybook','/service/corp/moneybook',3,1301,'2016-09-03 00:00:00','2016-09-03 00:00:00'),(2,2,'지출 관리','개인 지출 내역을 관리할 수 있습니다.','slider-service-02.png','icon-service-02.png','person_moneybook','/service/person/moneybook',3,1301,'2016-09-03 00:00:00','2016-09-03 00:00:00'),(3,3,'통계','법인카드, 개인 지출 통계를 확인할 수 있습니다.','slider-service-03.png','icon-service-03.png','statistic','/service/statistic',3,1302,'2016-09-03 00:00:00','2016-09-03 00:00:00'),(4,4,'분석','법인카드, 개인 지출을 분석할 수 있습니다.','slider-service-04.png','icon-service-04.png','analysis','/service/analysis',3,1302,'2016-09-03 00:00:00','2016-09-03 00:00:00'),(5,5,'결재 처리','내가 받은 결재를 조회 및 처리할 수 있습니다.','slider-service-05.png','icon-service-05.png','received_approval','/service/received/approval',3,1301,'2016-09-03 00:00:00','2016-09-03 00:00:00'),(6,2,'올린 결재','내가 올린 결재를 조회 및 철회할 수 있습니다.','slider-service-06.png','icon-service-06.png','sent_approval','/service/sent/approval',3,1301,'2016-09-03 00:00:00','2016-09-03 00:00:00'),(100,0,'회원 관리','회원을 관리할 수 있습니다.','slider-service-100.png','icon-service-100.png','member','/admin/member',3,1301,'2016-09-03 00:00:00','2016-09-03 00:00:00'),(101,0,'Data 조회','각 회원 별 법인카드, 개인 지출 내역 및 통계를 확인할 수 있습니다.','slider-service-101.png','icon-service-101.png','data','/admin/data',3,1301,'2016-09-03 00:00:00','2016-09-03 00:00:00'),(102,0,'결재 조회','승인된 결재 내용을 확인할 수 있습니다.','slider-service-102.png','icon-service-102.png','approval','/admin/approval',3,1301,'2016-09-03 00:00:00','2016-09-03 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
