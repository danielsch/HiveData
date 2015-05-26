-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: localhost    Database: Hive
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_
ZONE */;
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
  CONSTRAINT `FileAnnoFk` FOREIGN KEY (`FileId`) REFERENCES `VersionInfo` (`Id`),
  CONSTRAINT `UserAnnoFk` FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `UserFk` FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Telephone` int(20) DEFAULT NULL,
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
INSERT INTO `User` VALUES (1,'Dian','Octaviani','b8f8312b939f00abb38eeafd4fd107f3',1,1,'d.octaviani@DataHive.com','2015-05-25 10:02:06','Developer',NULL,NULL,'Perth',0,'http://104.199.149.190',NULL,'Doctaviani'),(2,'Swoorup','Joshi','ac5a5dd7658194dcdc9695bed9ff5a75',1,1,'S.Joshi@DataHive.com','2015-05-25 10:03:16','Developer',NULL,NULL,'Perth',0,'http://104.199.149.190',NULL,'SJoshi'),(3,'Cameron','Russell','59c44fb5750051e1afbc8814dcd2a1c2',1,1,'C.Russell@DataHive.com','2015-05-25 10:04:49','Developer',NULL,NULL,'Perth',0,'http://104.199.149.190',NULL,'CRussell'),(4,'Phillipe','Majuri','d5c40415cf871c5980de870858dd551c',1,1,'P.Majuri@DataHive.com','2015-05-25 10:05:51','Developer',NULL,NULL,'Perth',0,'http://104.199.149.190',NULL,'PMajuri'),(5,'Aidan','Orr','231820c5c04e155be7ddebf4ece94da5',1,1,'A.Orr@DataHive.com','2015-05-25 10:07:06','Developer',NULL,NULL,'Perth',0,'http://104.199.149.190',NULL,'AOrr'),(6,'Daniel','Schofield','2aed134614b35b8f15af521abd41e242',1,1,'D.Schofield@DataHive.com','2015-05-25 10:08:13','Developer',NULL,NULL,'Manchester',0,'http://104.199.149.190',NULL,'Dschofield'),(7,'Admin','Admin','3b244e70702e8cbd5be48cfec22e6854',1,1,'Admin@DataHive.com','2015-05-25 10:09:01','Developer',NULL,NULL,'Perth',0,'http://104.199.149.190',NULL,'Admin');
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
  `hash` varchar(767) DEFAULT NULL,
  `FileInfoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CrcHashUQ` (`CrcHash`),
  KEY `UserFileFK` (`UserId`),
  KEY `FileInfoId` (`FileInfoId`),
  CONSTRAINT `UserFileFK` FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`),
  CONSTRAINT `VersionInfo_ibfk_1` FOREIGN KEY (`FileInfoId`) REFERENCES `FileInfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `FileViewFk` FOREIGN KEY (`FileId`) REFERENCES `VersionInfo` (`Id`),
  CONSTRAINT `UserViewFK` FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
