-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: localhost    Database: Hive
-- ------------------------------------------------------
-- Server version	5.5.29

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
  CONSTRAINT `FileAnnoFk` FOREIGN KEY (`FileId`) REFERENCES `VersionInfo` (`Id`),
  CONSTRAINT `UserAnnoFk` FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`)
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
  `FilePath` text NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FileNameKey` (`FileName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileInfo`
--

LOCK TABLES `FileInfo` WRITE;
/*!40000 ALTER TABLE `FileInfo` DISABLE KEYS */;
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
  CONSTRAINT `UserFk` FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`)
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
  `Telephone` int(20) DEFAULT NULL,
  `Website` varchar(1024) DEFAULT NULL,
  `Bio` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
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
  `FileName` varchar(767) DEFAULT NULL,
  `UploadDate` datetime NOT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `Author` varchar(1024) DEFAULT NULL,
  `FilePath` text,
  `UserId` int(11) NOT NULL,
  `hash` varchar(767) DEFAULT NULL,
  `FileInfoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FileName` (`FileName`),
  UNIQUE KEY `HashUQ` (`hash`),
  KEY `UserFileFK` (`UserId`),
  KEY `FileInfoId` (`FileInfoId`),
  CONSTRAINT `UserFileFK` FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`),
  CONSTRAINT `VersionInfo_ibfk_1` FOREIGN KEY (`FileInfoId`) REFERENCES `FileInfo` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VersionInfo`
--

LOCK TABLES `VersionInfo` WRITE;
/*!40000 ALTER TABLE `VersionInfo` DISABLE KEYS */;
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
  CONSTRAINT `FileViewFk` FOREIGN KEY (`FileId`) REFERENCES `VersionInfo` (`Id`),
  CONSTRAINT `UserViewFK` FOREIGN KEY (`UserId`) REFERENCES `User` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ViewHistory`
--

LOCK TABLES `ViewHistory` WRITE;
/*!40000 ALTER TABLE `ViewHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ViewHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Hive'
--

--
-- Dumping routines for database 'Hive'
--
/*!50003 DROP PROCEDURE IF EXISTS `InsertDoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertDoc`(
	in FilePath1 varchar(500),
    in User int,
    in DateCreated date,
    in FileName1 varchar(50),
    in DataType1 varchar(20),
    in Author1 varchar(50)
)
BEGIN


if exists (select * from File where FileName = FileName1) then
     select -1;
 else
     insert into File (FileName,UploadDate, CreatedDate, DataType, Author, FilePath, UserId) 
     values(FileName1, now(), DateCreated, DataType1, Author1,FilePath1, User);
     
     select last_insert_id();
 end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidateUser`(
	IN UName VARCHAR(45),
	IN Pword VARCHAR(100)
)
BEGIN
	  DECLARE UserId INT; 
      DECLARE LastLoginDate DATETIME;
     
	SELECT 
		id = UserId
	FROM 
		User
	WHERE 
		UserName = UName
        AND Password = Pword;
     
      IF UserId IS NOT NULL 
		THEN
            BEGIN
            UPDATE User
			SET LastLoginDate = NOW()
			WHERE Id = UserId;
			SELECT  UserId 'ID'; -- User valid.
            END;
		ELSE 
            SELECT -1; -- User invalid.
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-20 20:23:13
