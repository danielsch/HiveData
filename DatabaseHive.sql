-- MySQL dump 10.15  Distrib 10.0.18-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Hive
-- ------------------------------------------------------
-- Server version	10.0.18-MariaDB-log

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
-- Table structure for table `Annotation`
--

DROP TABLE IF EXISTS `Annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Annotation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedDate` datetime NOT NULL,
  `FileId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `FileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FileAnnoFk` (`FileId`),
  KEY `UserAnnoFk` (`UserId`),
  CONSTRAINT `FileAnnoFk` FOREIGN KEY (`FileId`) REFERENCES `VersionInfo` (`ID`),
  CONSTRAINT `UserAnnoFk` FOREIGN KEY (`UserId`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Annotation`
--

LOCK TABLES `Annotation` WRITE;
/*!40000 ALTER TABLE `Annotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Annotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileInfo`
--

DROP TABLE IF EXISTS `FileInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileInfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FileName` varchar(767) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FileNameKey` (`FileName`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileInfo`
--

LOCK TABLES `FileInfo` WRITE;
/*!40000 ALTER TABLE `FileInfo` DISABLE KEYS */;
INSERT INTO `FileInfo` VALUES (19,'2166_asset_optimization_systems_5_lessons_from_10y.pdf'),(24,'Asset-People-Tracking_-UGC_Asset-Util_-Longwall.pdf'),(42,'BP Deepwater Horizon Oil Spill.pdf'),(46,'BSR_UNG Supply Chain Report.pdf'),(32,'BSR_UNGC_SupplyChainReport.pdf'),(22,'Comments_Joshi (1).doc'),(35,'Deepwater and LLOG Operations.pdf'),(49,'Drilling for Oil in Deepwater.pdf'),(33,'eage2014_th_e102_04.pdf'),(43,'Energy White Paper.pdf'),(30,'Energy White Paper_Issues Paper_Chevron Australia.pdf'),(40,'Exctraction and Benefication of Ores.pdf'),(48,'Extractive Metallurgy.pdf'),(34,'Geomechanical Velocity Model Building.pdf'),(17,'Guan_Paper_2.pdf'),(20,'Increasing_Plant_Uptime_by_Learning_from_Airline_Best_Practice.pdf'),(41,'Integrating FWI with Surface-wave Inversion.pdf'),(45,'Integration of Surface Seismic.pdf'),(28,'longwall_mitchell.pdf'),(36,'Malachite and Leucomalachite.pdf'),(47,'Metal Extraction Processes.pdf'),(39,'Metallurgy and Mineral Processing.pdf'),(31,'n3_Keane_et_al_T.pdf'),(29,'PN Preamble_lp_v2.pdf'),(21,'Progress Towards Longwall Automation - has pretty graph.pdf'),(25,'Project.Master.EPFL.pdf'),(1,'sfdgsdfgsd'),(38,'Shell EWP Issues Paper.pdf'),(44,'Siege of Natural Gas.pdf'),(27,'Simulation of Development in Longwall Coal Mines.pdf'),(37,'Supply Chain of Timber Industry'),(23,'using-predictive-analytics-to-optimize-asset-maintenance-in-the-utilities-industry-codex964.pdf'),(26,'WhitePaper_Invensys_AssetPerformanceManagement_04-12.pdf');
/*!40000 ALTER TABLE `FileInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `History` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SearchDate` datetime NOT NULL,
  `Keyword` text,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserFk` (`UserId`),
  CONSTRAINT `UserFk` FOREIGN KEY (`UserId`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
/*!40000 ALTER TABLE `History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` char(255) DEFAULT NULL,
  `LastName` varchar(1024) DEFAULT NULL,
  `Pword` varchar(100) NOT NULL,
  `Admin` tinyint(1) DEFAULT NULL,
  `Sensitiv` tinyint(1) DEFAULT NULL,
  `Email` varchar(1024) DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `Role` char(255) DEFAULT NULL,
  `Title` char(4) DEFAULT NULL,
  `Gender` tinyint(1) DEFAULT NULL,
  `Location` char(255) DEFAULT NULL,
  `Telephone` varchar(1024) DEFAULT NULL,
  `Website` varchar(1024) DEFAULT NULL,
  `Bio` text,
  `UserName` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Dian','Octaviani','b8f8312b939f00abb38eeafd4fd107f3',1,1,'d.octaviani@DataHive.com','2015-05-25 10:02:06','Developer',NULL,0,'Perth','0','http://104.199.149.190',NULL,'Doctaviani'),(2,'Swoorup','Joshi','ac5a5dd7658194dcdc9695bed9ff5a75',1,1,'S.Joshi@DataHive.com','2015-05-25 10:03:16','Developer','Mr.',1,'Bhairahawa','346345643','http://104.199.149.190','advsdvasdvasdvasdvasdv','SJoshi'),(3,'Cameron','Russell','59c44fb5750051e1afbc8814dcd2a1c2',1,1,'C.Russell@DataHive.com','2015-05-25 10:04:49','Developer',NULL,1,'Perth','0','http://104.199.149.190',NULL,'CRussell'),(4,'Phillipe','Majuri','d5c40415cf871c5980de870858dd551c',1,1,'P.Majuri@DataHive.com','2015-05-25 10:05:51','Developer',NULL,1,'Perth','0','http://104.199.149.190',NULL,'PMajuri'),(5,'Aidan','Orr','231820c5c04e155be7ddebf4ece94da5',1,1,'A.Orr@DataHive.com','2015-05-25 10:07:06','Developer',NULL,1,'Perth','0','http://104.199.149.190',NULL,'AOrr'),(6,'Daniel','Schofield','2aed134614b35b8f15af521abd41e242',1,1,'D.Schofield@DataHive.com','2015-05-25 10:08:13','Developer',NULL,1,'Manchester','0','http://104.199.149.190',NULL,'Dschofield'),(7,'Admin','Admin','3b244e70702e8cbd5be48cfec22e6854',1,1,'Admin@DataHive.com','2015-05-25 10:09:01','Developer',NULL,0,'Perth','0','http://104.199.149.190',NULL,'Admin');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VersionInfo`
--

DROP TABLE IF EXISTS `VersionInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VersionInfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UploadDate` datetime NOT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CrcHash` varchar(767) DEFAULT NULL,
  `Description` longtext,
  `Author` varchar(1024) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `FileInfoId` int(11) DEFAULT NULL,
  `BoxViewID` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CrcHashUQ` (`CrcHash`),
  KEY `UserFileFK` (`UserId`),
  KEY `FileInfoId` (`FileInfoId`),
  CONSTRAINT `UserFileFK` FOREIGN KEY (`UserId`) REFERENCES `User` (`ID`),
  CONSTRAINT `VersionInfo_ibfk_1` FOREIGN KEY (`FileInfoId`) REFERENCES `FileInfo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VersionInfo`
--

LOCK TABLES `VersionInfo` WRITE;
/*!40000 ALTER TABLE `VersionInfo` DISABLE KEYS */;
INSERT INTO `VersionInfo` VALUES (41,'2015-06-04 03:26:47','2004-03-23 11:58:11','29cd92d6','','David  & Rasheda Keane',2,31,NULL),(42,'2015-06-04 03:26:50','2012-05-30 22:55:00','3026e92e','',NULL,2,32,NULL),(43,'2015-06-04 03:26:52','2014-06-19 22:42:01','df5436c2','','Schlumberger',2,33,NULL),(55,'2015-06-04 03:58:27','2005-10-25 07:34:44','779270b','','daw084',2,21,'84d457230634412da6652cf744e17848'),(56,'2015-06-04 03:58:27','2008-01-31 15:06:46','bd90f7c','',NULL,2,20,'3ba05ae28feb4835b9c7e33dafd64fe1'),(57,'2015-06-04 03:58:28','2015-04-20 15:55:43','c6f2745','',NULL,2,26,'b5914f608ddd4a7f89714548b4a9eca3'),(58,'2015-06-04 03:58:29','2009-12-04 06:38:43','6634d7cb','','ebaafi',2,28,'d481c7555a284ac0ac50fcd84c16c1f9'),(59,'2015-06-04 03:58:28','2006-03-27 08:59:57','df5b5b72','','guan',2,17,'54322dad245e48f1b4c7b43018d14569'),(60,'2015-06-04 03:58:28','2014-12-16 17:35:47','c43de65','','Mehmet S. Kizil, Alex McAlister, and Robert Pascoe',2,27,'c533b450c95143ae87ba84b60855180f'),(61,'2015-06-04 03:58:31','2015-01-07 14:51:14','618649f2','','Quang Nguyen, Sachin Kumar, Girish K.G, Cognizant Technology Solutions',2,23,'b472d5c31fbe4462bb494f405d9f7724'),(62,'2015-06-04 03:58:30','2014-11-26 09:25:17','239af3b3','','Greg Ferrar',2,24,'5063d847f17f43aba3d33804d00dffd2'),(63,'2015-06-04 03:58:32','2011-07-18 04:56:07','a26a02bb','','JOAQUIM',2,25,'e6a7ede7a79740d68c14105a7ca16719'),(64,'2015-06-04 03:58:31','2011-03-14 21:49:41','ed1456ad','','User',2,29,'1968ec9161d94e9685599fb9a3ac4b57'),(65,'2015-06-04 03:58:33','2013-09-09 16:06:21','5fca27e','','W',2,19,'d8d634546eba4e7e8bec2ce22d6b0030'),(66,'2015-06-04 06:43:13','2013-01-24 04:01:35','87cfcb0f','',NULL,2,35,'3efd246b4a45404489df68faf4da2826'),(67,'2015-06-04 06:43:13','2011-11-22 15:15:55','3bb578bd','',NULL,2,36,'0926ebdb633a41c58405a6f3ecfb0b05'),(68,'2015-06-04 06:43:13','2014-02-20 06:34:26','e8a6e84a','',NULL,2,30,'d4ce8660d9584b4f943530909596f9f2'),(70,'2015-06-04 06:43:14','2014-02-18 13:05:52','35e34c5d','',NULL,2,38,'71aa80979c0f431287a07363137975f6'),(71,'2015-06-04 06:43:14','2007-04-12 07:30:03','e656049','',NULL,2,39,'6640b9227ebc45ad83d2eade00266d00'),(72,'2015-06-04 06:43:15','2012-04-03 01:09:41','fa43c699','','US EPA, OSWER, Office of Resource Conservation and Recovery',2,40,'98067524c9f34ee5ab7724e9a662e070'),(73,'2015-06-04 06:43:15','2015-05-21 02:32:04','68f8cb1e','','Schlumberger',2,41,'a848509681144b7a828bfa63738f70fa'),(74,'2015-06-04 06:43:16','2010-09-19 00:45:03','a8b74cb4','','Jay.Hakes',2,42,'a5451a43375744ef87572aaf5a6d1e9b'),(75,'2015-06-04 06:43:16','2015-03-30 13:23:30','818aa704','',NULL,2,43,'da4cb4d0951940de93e3076f0ee08a44'),(76,'2015-06-04 06:43:16','2012-04-20 22:41:09','8fa31d56','',NULL,2,44,'2451b751d4ac47b29e80148167f75165'),(79,'2015-06-04 06:43:18','2014-02-19 17:45:22','f10c34ad','','Abdul Khaliq, Muhammad Akbar Rhamdhani, Geoffrey Brooks, Syed Masood',2,47,'a20c7efa1a2447e4baa5580b477d88df'),(80,'2015-06-04 06:43:17','2008-08-26 02:37:02','4300030e','',NULL,2,48,'80a40c086afb433a8ad519ca92090093'),(81,'2015-06-04 06:43:20','2014-06-09 18:35:03','5532304f','','Schlumberger',2,34,'608c79c7e3db4a18b4a9a0c4bbd023d0'),(82,'2015-06-04 06:43:20','2011-02-17 06:11:33','7a090689','','cbilyeu',2,49,'19b1dfa752be463c8dc9455ed7489c6e');
/*!40000 ALTER TABLE `VersionInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ViewHistory`
--

DROP TABLE IF EXISTS `ViewHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ViewHistory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DateViewed` datetime NOT NULL,
  `UserId` int(11) NOT NULL,
  `FileId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FileViewFk` (`FileId`),
  KEY `UserViewFK` (`UserId`),
  CONSTRAINT `FileViewFk` FOREIGN KEY (`FileId`) REFERENCES `VersionInfo` (`ID`),
  CONSTRAINT `UserViewFK` FOREIGN KEY (`UserId`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ViewHistory`
--

LOCK TABLES `ViewHistory` WRITE;
/*!40000 ALTER TABLE `ViewHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ViewHistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-04  7:09:31
