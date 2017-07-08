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
-- Table structure for table `oms_persistent_login`
--

DROP TABLE IF EXISTS oms_persistent_login;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE oms_persistent_login (
  memberId varchar(255) NOT NULL,
  series varchar(64) NOT NULL,
  tokenValue varchar(64) NOT NULL,
  lastUsed datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (memberId)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_persistent_login`
--

INSERT INTO oms_persistent_login VALUES ('choyj','3iD1hcLv+ZLsie72mmK/2Q==','xjVTfLLK2JJ35GlvP3NvbifU1EwOohXYHemueqzSqjw=','2017-04-06 17:12:06'),('iskwon','e597fA9yaBR/Kwiu3IvbJQ==','v9+O+PnyaaOoKd8KReyahyFkGMBQFI5pWQ9qqLkAbt8=','2017-07-03 17:17:09'),('kimgayoung','gCCVLe85tf0zbNbs27GXRQ==','cwUH+YxrI19MQIlgQTVxp9dONbhKPp4yGkEWqorxVtg=','2017-04-06 17:56:29'),('parkchan','4r365H+icuHt1oNmHrlKaw==','qqu1pDFPMIMufRppYtQ/ai0G19BQ6znDPQcvcWUUeBU=','2017-05-10 12:31:56'),('sdwoo','L/neufarjCPHIhouAw7lpQ==','mL+AlEo8bkf+smGAnZaoqaDuGcHOhX0Wx2OaTx+dn0Q=','2017-03-31 15:19:29'),('ysjung','tdkisuAZiB5STHYzLygYOA==','J2LfF/y0yQRJrgO8KOVQQnkQqslI3e8peZrBYTSs6SM=','2017-03-02 00:41:51');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
