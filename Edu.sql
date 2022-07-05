-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Edu
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `C`
--

DROP TABLE IF EXISTS `C`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C` (
  `Cid` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cname` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `Ctype` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Cid`),
  UNIQUE KEY `iCCid` (`Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C`
--

LOCK TABLES `C` WRITE;
/*!40000 ALTER TABLE `C` DISABLE KEYS */;
INSERT INTO `C` VALUES ('0001','英语1',3,'必修:astro chem math phys cs'),('0002','英语2',3,'必修:au cs ee se'),('0003','电动力学',4,'必修: cs ee phys'),('0004','固体物理',4,'必修: cs ee phys'),('0005','大学物理',4,'必修: au ee'),('0006','微积分',4,'必修: cs se au ee'),('0007','概率论',3,'必修: cs se au ee'),('0008','离散数学',3,'必修: cs se au'),('0009','人工智能导论',3,'必修: cs se au'),('0010','计算机网络',3,'必修: cs se au ee'),('0011','编译原理',3,'必修: cs se'),('0012','嵌入式系统',3,'必修: cs'),('0013','软件工程',4,'必修: se'),('0014','自动控制理论',4,'必修: au'),('0015','Matlab高级编程',4,'必修: ee'),('0016','量子力学',4,'必修: math phys'),('0017','高等线性代数',3,'必修: math'),('0018','统计力学',3,'必修: phys'),('0019','天体物理',3,'必修: astro'),('0020','有机合成',3,'必修: chem');
/*!40000 ALTER TABLE `C` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger dC
before delete on C
for each row
begin
 delete from TC where TC.Cid = OLD.Cid;
 delete from SC where TC.Cid = OLD.Cid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `M`
--

DROP TABLE IF EXISTS `M`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `M` (
  `Mid` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mname` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Yid` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Mid`),
  UNIQUE KEY `iMMidYid` (`Mid`,`Yid`),
  KEY `fMY` (`Yid`),
  CONSTRAINT `fMY` FOREIGN KEY (`Yid`) REFERENCES `Y` (`Yid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `M`
--

LOCK TABLES `M` WRITE;
/*!40000 ALTER TABLE `M` DISABLE KEYS */;
INSERT INTO `M` VALUES ('astro','天文','sci'),('au','自动化','sist'),('chem','化学','sci'),('cs','计算机科学与技术','sist'),('ee','电子工程','sist'),('math','数学','sci'),('phys','物理','sci'),('se','软件工程','sist');
/*!40000 ALTER TABLE `M` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `S`
--

DROP TABLE IF EXISTS `S`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `S` (
  `Sid` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Sname` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ssex` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sage` int(11) DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `Mid` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Sid`),
  UNIQUE KEY `iSSidMid` (`Sid`,`Mid`),
  KEY `fSM` (`Mid`),
  CONSTRAINT `fSM` FOREIGN KEY (`Mid`) REFERENCES `M` (`Mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `S`
--

LOCK TABLES `S` WRITE;
/*!40000 ALTER TABLE `S` DISABLE KEYS */;
INSERT INTO `S` VALUES ('20191101','绍亮','男',20,20,'cs'),('20191102','张妍','女',20,23,'cs'),('20191103','潘家豪','男',19,24,'cs'),('20191201','蔡兆紫','女',19,25,'ee'),('20191202','杜恒辰','男',20,18,'ee'),('20191203','曹燕','女',20,28,'ee'),('20191301','江彥安','男',20,18,'au'),('20191302','齐宜欣','女',20,28,'au'),('20191401','乔梦','女',20,21,'se'),('20191402','李俊盛','男',20,23,'se'),('20192101','萧子轩','男',20,21,'math'),('20192102','甘星宇','男',20,26,'math'),('20192103','陳白和','女',18,22,'math'),('20192201','徐雅晴','女',19,21,'phys'),('20192202','徐建伟','男',20,23,'phys'),('20192301','陳睿駿','男',20,23,'chem'),('20192302','王淑婷','女',20,20,'chem'),('20192401','陳幸明','男',21,20,'astro'),('20192402','邱淑吟','女',20,20,'astro');
/*!40000 ALTER TABLE `S` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger dS
before delete on S
for each row
begin
 delete from SC where SC.Sid = OLD.Sid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SC`
--

DROP TABLE IF EXISTS `SC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SC` (
  `Sid` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cid` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double DEFAULT NULL,
  `Tid` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Sid`,`Cid`),
  UNIQUE KEY `iSCSidCidTid` (`Sid`,`Cid`,`Tid`),
  KEY `fSCC` (`Cid`),
  KEY `fSCT` (`Tid`),
  CONSTRAINT `fSCC` FOREIGN KEY (`Cid`) REFERENCES `C` (`Cid`),
  CONSTRAINT `fSCS` FOREIGN KEY (`Sid`) REFERENCES `S` (`Sid`),
  CONSTRAINT `fSCT` FOREIGN KEY (`Tid`) REFERENCES `T` (`Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SC`
--

LOCK TABLES `SC` WRITE;
/*!40000 ALTER TABLE `SC` DISABLE KEYS */;
INSERT INTO `SC` VALUES ('20191101','0003',82,'20019201'),('20191101','0004',0,'20019201'),('20191101','0006',90,'20019201'),('20191101','0009',0,'20019101'),('20191101','0010',50,'20019101'),('20191101','0011',78,'20019101'),('20191101','0012',86,'20019101'),('20191102','0003',92,'20019201'),('20191102','0004',0,'20019201'),('20191102','0006',94,'20019201'),('20191102','0009',83,'20019101'),('20191102','0010',80,'20019101'),('20191102','0011',88,'20019101'),('20191102','0012',93,'20019101'),('20191201','0006',59,'20019203'),('20191201','0007',100,'20019203'),('20191201','0012',0,'20019101'),('20191203','0010',90,'20019101'),('20191302','0006',92,'20019203'),('20191302','0007',84,'20019203'),('20191401','0003',87,'20019201'),('20191401','0004',0,'20019201'),('20191401','0006',91,'20019201'),('20191401','0009',88,'20019101'),('20191401','0010',82,'20019101'),('20191401','0011',84,'20019101'),('20191401','0013',85,'20019102');
/*!40000 ALTER TABLE `SC` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger gainCredit
after update on SC
for each row
begin
 if OLD.score < 60 and NEW.score >= 60 then
  update S set credit = credit + (select credit from C where C.Cid = NEW.Cid) where S.Sid = NEW.Sid;
 end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `T`
--

DROP TABLE IF EXISTS `T`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T` (
  `Tid` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tname` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tsex` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tage` int(11) DEFAULT NULL,
  `rank` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Yid` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Tid`),
  UNIQUE KEY `iTTidYid` (`Tid`,`Yid`),
  KEY `fTY` (`Yid`),
  CONSTRAINT `fTY` FOREIGN KEY (`Yid`) REFERENCES `Y` (`Yid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T`
--

LOCK TABLES `T` WRITE;
/*!40000 ALTER TABLE `T` DISABLE KEYS */;
INSERT INTO `T` VALUES ('20019101','林雅婷','女',42,'副教授','sist'),('20019102','张士杰','男',48,'教授','sist'),('20019103','陳孟中','男',38,'教授','sist'),('20019104','李月虹','女',51,'教授','sist'),('20019105','黎靜怡','女',33,'讲师','sist'),('20019106','陳仁豪','男',43,'讲师','sist'),('20019107','卢燕','女',39,'讲师','sist'),('20019108','方斌','男',41,'副教授','sist'),('20019201','于华清','男',41,'副教授','sci'),('20019202','闻阳冰','男',43,'副教授','sci'),('20019203','張明如','女',37,'讲师','sci'),('20019204','高冰昀','女',44,'讲师','sci'),('20019205','陳信','男',48,'教授','sci'),('20019206','丁佩珊','女',46,'教授','sci'),('20019207','吳武然','男',46,'副教授','sci'),('20019208','王哲','男',43,'副教授','sci');
/*!40000 ALTER TABLE `T` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger dT
before delete on T
for each row
begin
 delete from TC where TC.Tid = OLD.Tid;
 delete from SC where TC.Tid = OLD.Tid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TC`
--

DROP TABLE IF EXISTS `TC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TC` (
  `Tid` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cid` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Croom` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Tid`,`Cid`),
  UNIQUE KEY `iTCTidCid` (`Tid`,`Cid`),
  KEY `fTCC` (`Cid`),
  CONSTRAINT `fTCC` FOREIGN KEY (`Cid`) REFERENCES `C` (`Cid`),
  CONSTRAINT `fTCT` FOREIGN KEY (`Tid`) REFERENCES `T` (`Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TC`
--

LOCK TABLES `TC` WRITE;
/*!40000 ALTER TABLE `TC` DISABLE KEYS */;
INSERT INTO `TC` VALUES ('20019101','0009','A301','《人工智能导论》'),('20019101','0010','A306','《计算机网络》'),('20019101','0011','A201','《编译原理》'),('20019101','0012','A306','《嵌入式系统》'),('20019102','0009','A203','《人工智能导论》'),('20019102','0010','A303','《计算机网络》'),('20019102','0011','A303','《编译原理》'),('20019102','0013','A103','《软件工程》'),('20019102','0014','A203','《自动控制学》'),('20019103','0010','A203','《计算机网络》'),('20019103','0011','A302','《编译原理》'),('20019103','0015','A402','《MATLAB编程与工程应用》'),('20019201','0003','A201','《电动力学导论》'),('20019201','0004','A203','《固体物理》'),('20019201','0005','A103','《大学物理学》'),('20019201','0006','A301','《微积分》'),('20019202','0003','A204','《电动力学导论》'),('20019202','0004','A104','《固体物理基础》'),('20019203','0006','A401','《微积分》'),('20019203','0007','A201','《概率论基础教程》'),('20019203','0008','A301','《离散数学》'),('20019204','0005','A401','《大学物理学》'),('20019204','0006','A301','《托马斯微积分》'),('20019204','0007','A301','《概率论基础》'),('20019204','0008','A101','《离散数学及其应用》');
/*!40000 ALTER TABLE `TC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `U`
--

DROP TABLE IF EXISTS `U`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U` (
  `Uid` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pword` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grp` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Uid`),
  UNIQUE KEY `iUUid` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `U`
--

LOCK TABLES `U` WRITE;
/*!40000 ALTER TABLE `U` DISABLE KEYS */;
INSERT INTO `U` VALUES ('20019101','2fa4ea1508417ece5eaa4696542c584d936b0f36ede7ec53f63ad7ed1fe5e7e5','T'),('20191101','4016fd949201499f0c1842ade3cb4d9f41cf4ff38522c0cb083b80050b73c475','S'),('20191102','1bbd8ceb55cfbee8291f6924b2177e62610e01571fc4edc2dc189b8750183990','S'),('20191201','b2b3cb0cacf5600f73a4ff1fe13e88be7998ef1e0ba1ce48673d39283f23ff92','S');
/*!40000 ALTER TABLE `U` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Y`
--

DROP TABLE IF EXISTS `Y`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Y` (
  `Yid` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Yname` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Yid`),
  UNIQUE KEY `iYYid` (`Yid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Y`
--

LOCK TABLES `Y` WRITE;
/*!40000 ALTER TABLE `Y` DISABLE KEYS */;
INSERT INTO `Y` VALUES ('sci','理学院'),('sist','信息科学技术学院');
/*!40000 ALTER TABLE `Y` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ccj`
--

DROP TABLE IF EXISTS `ccj`;
/*!50001 DROP VIEW IF EXISTS `ccj`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ccj` (
  `Sid` tinyint NOT NULL,
  `Cname` tinyint NOT NULL,
  `score` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `df`
--

DROP TABLE IF EXISTS `df`;
/*!50001 DROP VIEW IF EXISTS `df`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `df` (
  `Tid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `Cname` tinyint NOT NULL,
  `Sid` tinyint NOT NULL,
  `Sname` tinyint NOT NULL,
  `score` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `jgl`
--

DROP TABLE IF EXISTS `jgl`;
/*!50001 DROP VIEW IF EXISTS `jgl`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jgl` (
  `Tid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `jgl` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `jgrs`
--

DROP TABLE IF EXISTS `jgrs`;
/*!50001 DROP VIEW IF EXISTS `jgrs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jgrs` (
  `Tid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `rsjg` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `jstj`
--

DROP TABLE IF EXISTS `jstj`;
/*!50001 DROP VIEW IF EXISTS `jstj`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jstj` (
  `Tid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `Cname` tinyint NOT NULL,
  `pjf` tinyint NOT NULL,
  `jgl` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `jsxx`
--

DROP TABLE IF EXISTS `jsxx`;
/*!50001 DROP VIEW IF EXISTS `jsxx`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `jsxx` (
  `Tid` tinyint NOT NULL,
  `Tname` tinyint NOT NULL,
  `Tsex` tinyint NOT NULL,
  `Tage` tinyint NOT NULL,
  `rank` tinyint NOT NULL,
  `Yname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `kb`
--

DROP TABLE IF EXISTS `kb`;
/*!50001 DROP VIEW IF EXISTS `kb`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `kb` (
  `Sid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `Cname` tinyint NOT NULL,
  `Tname` tinyint NOT NULL,
  `Croom` tinyint NOT NULL,
  `book` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `kxk`
--

DROP TABLE IF EXISTS `kxk`;
/*!50001 DROP VIEW IF EXISTS `kxk`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `kxk` (
  `Sid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `Cname` tinyint NOT NULL,
  `Tid` tinyint NOT NULL,
  `Tname` tinyint NOT NULL,
  `Croom` tinyint NOT NULL,
  `book` tinyint NOT NULL,
  `Ctype` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `mfrs`
--

DROP TABLE IF EXISTS `mfrs`;
/*!50001 DROP VIEW IF EXISTS `mfrs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `mfrs` (
  `Tid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `Cname` tinyint NOT NULL,
  `mfrs` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `pjcj`
--

DROP TABLE IF EXISTS `pjcj`;
/*!50001 DROP VIEW IF EXISTS `pjcj`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `pjcj` (
  `Tid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `pjf` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `skb`
--

DROP TABLE IF EXISTS `skb`;
/*!50001 DROP VIEW IF EXISTS `skb`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `skb` (
  `Tid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `Cname` tinyint NOT NULL,
  `Croom` tinyint NOT NULL,
  `book` tinyint NOT NULL,
  `mfrs` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `skrs`
--

DROP TABLE IF EXISTS `skrs`;
/*!50001 DROP VIEW IF EXISTS `skrs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `skrs` (
  `Tid` tinyint NOT NULL,
  `Cid` tinyint NOT NULL,
  `rs` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `xsxx`
--

DROP TABLE IF EXISTS `xsxx`;
/*!50001 DROP VIEW IF EXISTS `xsxx`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `xsxx` (
  `Sid` tinyint NOT NULL,
  `Sname` tinyint NOT NULL,
  `Ssex` tinyint NOT NULL,
  `Sage` tinyint NOT NULL,
  `credit` tinyint NOT NULL,
  `Mname` tinyint NOT NULL,
  `Yname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ccj`
--

/*!50001 DROP TABLE IF EXISTS `ccj`*/;
/*!50001 DROP VIEW IF EXISTS `ccj`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ccj` AS select `SC`.`Sid` AS `Sid`,`C`.`Cname` AS `Cname`,`SC`.`score` AS `score` from (`C` join `SC`) where `SC`.`Cid` = `C`.`Cid` and `SC`.`score` > 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `df`
--

/*!50001 DROP TABLE IF EXISTS `df`*/;
/*!50001 DROP VIEW IF EXISTS `df`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `df` AS select `SC`.`Tid` AS `Tid`,`SC`.`Cid` AS `Cid`,`C`.`Cname` AS `Cname`,`SC`.`Sid` AS `Sid`,`S`.`Sname` AS `Sname`,`SC`.`score` AS `score` from ((`SC` join `C`) join `S`) where `SC`.`score` = 0 and `SC`.`Cid` = `C`.`Cid` and `SC`.`Sid` = `S`.`Sid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jgl`
--

/*!50001 DROP TABLE IF EXISTS `jgl`*/;
/*!50001 DROP VIEW IF EXISTS `jgl`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jgl` AS select `skrs`.`Tid` AS `Tid`,`skrs`.`Cid` AS `Cid`,`jgrs`.`rsjg` * 100 / `skrs`.`rs` AS `jgl` from (`skrs` join `jgrs`) where `skrs`.`Tid` = `jgrs`.`Tid` and `skrs`.`Cid` = `jgrs`.`Cid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jgrs`
--

/*!50001 DROP TABLE IF EXISTS `jgrs`*/;
/*!50001 DROP VIEW IF EXISTS `jgrs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jgrs` AS select `SC`.`Tid` AS `Tid`,`SC`.`Cid` AS `Cid`,count(0) AS `rsjg` from `SC` where `SC`.`score` >= 60 group by `SC`.`Tid`,`SC`.`Cid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jstj`
--

/*!50001 DROP TABLE IF EXISTS `jstj`*/;
/*!50001 DROP VIEW IF EXISTS `jstj`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jstj` AS select `pjcj`.`Tid` AS `Tid`,`pjcj`.`Cid` AS `Cid`,`C`.`Cname` AS `Cname`,`pjcj`.`pjf` AS `pjf`,`jgl`.`jgl` AS `jgl` from ((`pjcj` join `jgl`) join `C`) where `pjcj`.`Tid` = `jgl`.`Tid` and `pjcj`.`Cid` = `jgl`.`Cid` and `pjcj`.`Cid` = `C`.`Cid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jsxx`
--

/*!50001 DROP TABLE IF EXISTS `jsxx`*/;
/*!50001 DROP VIEW IF EXISTS `jsxx`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jsxx` AS select `T`.`Tid` AS `Tid`,`T`.`Tname` AS `Tname`,`T`.`Tsex` AS `Tsex`,`T`.`Tage` AS `Tage`,`T`.`rank` AS `rank`,`Y`.`Yname` AS `Yname` from (`T` join `Y`) where `T`.`Yid` = `Y`.`Yid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kb`
--

/*!50001 DROP TABLE IF EXISTS `kb`*/;
/*!50001 DROP VIEW IF EXISTS `kb`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kb` AS select `SC`.`Sid` AS `Sid`,`SC`.`Cid` AS `Cid`,`C`.`Cname` AS `Cname`,`T`.`Tname` AS `Tname`,`TC`.`Croom` AS `Croom`,`TC`.`book` AS `book` from (((`C` join `T`) join `SC`) join `TC`) where `SC`.`Cid` = `TC`.`Cid` and `SC`.`Tid` = `TC`.`Tid` and `SC`.`Cid` = `C`.`Cid` and `SC`.`Tid` = `T`.`Tid` and `SC`.`score` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kxk`
--

/*!50001 DROP TABLE IF EXISTS `kxk`*/;
/*!50001 DROP VIEW IF EXISTS `kxk`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kxk` AS select `S`.`Sid` AS `Sid`,`TC`.`Cid` AS `Cid`,`C`.`Cname` AS `Cname`,`TC`.`Tid` AS `Tid`,`T`.`Tname` AS `Tname`,`TC`.`Croom` AS `Croom`,`TC`.`book` AS `book`,`C`.`Ctype` AS `Ctype` from (((`S` join `C`) join `T`) join `TC`) where `TC`.`Tid` = `T`.`Tid` and `TC`.`Cid` = `C`.`Cid` and !(`TC`.`Cid` in (select `SC`.`Cid` from `SC` where `SC`.`Sid` = `S`.`Sid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mfrs`
--

/*!50001 DROP TABLE IF EXISTS `mfrs`*/;
/*!50001 DROP VIEW IF EXISTS `mfrs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mfrs` AS select `SC`.`Tid` AS `Tid`,`SC`.`Cid` AS `Cid`,`C`.`Cname` AS `Cname`,count(`SC`.`Sid`) AS `mfrs` from (`SC` join `C`) where `SC`.`score` = 0 and `SC`.`Cid` = `C`.`Cid` group by `SC`.`Tid`,`SC`.`Cid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pjcj`
--

/*!50001 DROP TABLE IF EXISTS `pjcj`*/;
/*!50001 DROP VIEW IF EXISTS `pjcj`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pjcj` AS select `SC`.`Tid` AS `Tid`,`SC`.`Cid` AS `Cid`,avg(`SC`.`score`) AS `pjf` from `SC` group by `SC`.`Tid`,`SC`.`Cid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `skb`
--

/*!50001 DROP TABLE IF EXISTS `skb`*/;
/*!50001 DROP VIEW IF EXISTS `skb`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `skb` AS select `TC`.`Tid` AS `Tid`,`TC`.`Cid` AS `Cid`,`mfrs`.`Cname` AS `Cname`,`TC`.`Croom` AS `Croom`,`TC`.`book` AS `book`,`mfrs`.`mfrs` AS `mfrs` from (`TC` join `mfrs`) where `TC`.`Tid` = `mfrs`.`Tid` and `TC`.`Cid` = `mfrs`.`Cid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `skrs`
--

/*!50001 DROP TABLE IF EXISTS `skrs`*/;
/*!50001 DROP VIEW IF EXISTS `skrs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `skrs` AS select `SC`.`Tid` AS `Tid`,`SC`.`Cid` AS `Cid`,count(`SC`.`Sid`) AS `rs` from `SC` group by `SC`.`Tid`,`SC`.`Cid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `xsxx`
--

/*!50001 DROP TABLE IF EXISTS `xsxx`*/;
/*!50001 DROP VIEW IF EXISTS `xsxx`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `xsxx` AS select `S`.`Sid` AS `Sid`,`S`.`Sname` AS `Sname`,`S`.`Ssex` AS `Ssex`,`S`.`Sage` AS `Sage`,`S`.`credit` AS `credit`,`M`.`Mname` AS `Mname`,`Y`.`Yname` AS `Yname` from ((`S` join `M`) join `Y`) where `S`.`Mid` = `M`.`Mid` and `M`.`Yid` = `Y`.`Yid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-15  6:20:40
