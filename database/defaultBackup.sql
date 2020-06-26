-- MySQL dump 10.13  Distrib 5.7.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ENCOMANAGER
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `tceenc`
--

DROP TABLE IF EXISTS `tceenc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tceenc` (
  `ENCCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `ENCCODIGOCLI` int(11) DEFAULT NULL,
  `ENCCODIGOUSU` int(11) DEFAULT NULL,
  `ENCENDERECOENTREGA` varchar(100) DEFAULT NULL,
  `ENCVALORENTREGA` decimal(10,2) DEFAULT NULL,
  `ENCVALORTOTAL` decimal(10,2) DEFAULT NULL,
  `ENCPAGO` tinyint(4) DEFAULT NULL,
  `ENCSOMENTECLIRECEBE` tinyint(4) DEFAULT NULL,
  `ENCDATAENTREGA` datetime DEFAULT NULL,
  `ENCNOMERECEPTOR` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ENCCODIGO`),
  KEY `ENCCODIGOCLI` (`ENCCODIGOCLI`),
  KEY `ENCCODIGOUSU` (`ENCCODIGOUSU`),
  CONSTRAINT `tceenc_ibfk_1` FOREIGN KEY (`ENCCODIGOCLI`) REFERENCES `tgpcli` (`CLICODIGO`),
  CONSTRAINT `tceenc_ibfk_2` FOREIGN KEY (`ENCCODIGOUSU`) REFERENCES `tgpusu` (`USUCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tceenc`
--

LOCK TABLES `tceenc` WRITE;
/*!40000 ALTER TABLE `tceenc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tceenc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tceien`
--

DROP TABLE IF EXISTS `tceien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tceien` (
  `IENCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `IENVALORTOTALPRO` decimal(10,2) DEFAULT NULL,
  `IENQUANTPRO` int(11) DEFAULT NULL,
  `IENCODIGOPRO` int(11) DEFAULT NULL,
  `IENCODIGOENC` int(11) DEFAULT NULL,
  PRIMARY KEY (`IENCODIGO`),
  KEY `IENCODIGOPRO` (`IENCODIGOPRO`),
  KEY `IENCODIGOENC` (`IENCODIGOENC`),
  CONSTRAINT `tceien_ibfk_1` FOREIGN KEY (`IENCODIGOPRO`) REFERENCES `tcepro` (`PROCODIGO`),
  CONSTRAINT `tceien_ibfk_2` FOREIGN KEY (`IENCODIGOENC`) REFERENCES `tceenc` (`ENCCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tceien`
--

LOCK TABLES `tceien` WRITE;
/*!40000 ALTER TABLE `tceien` DISABLE KEYS */;
/*!40000 ALTER TABLE `tceien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcepro`
--

DROP TABLE IF EXISTS `tcepro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcepro` (
  `PROCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `PRONOME` varchar(50) DEFAULT NULL,
  `PRODESCRICAO` varchar(100) DEFAULT NULL,
  `PROVALOR` decimal(10,2) DEFAULT NULL,
  `PROESPECIFICACAOUNID` char(1) DEFAULT NULL,
  `PROGASTOMINSERVICO` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcepro`
--

LOCK TABLES `tcepro` WRITE;
/*!40000 ALTER TABLE `tcepro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcepro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tceven`
--

DROP TABLE IF EXISTS `tceven`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tceven` (
  `VENCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `VENDATA` datetime DEFAULT NULL,
  `VENSTATUS` varchar(20) DEFAULT NULL,
  `VENCODIGOENC` int(11) DEFAULT NULL,
  PRIMARY KEY (`VENCODIGO`),
  KEY `VENCODIGOENC` (`VENCODIGOENC`),
  CONSTRAINT `tceven_ibfk_1` FOREIGN KEY (`VENCODIGOENC`) REFERENCES `tceenc` (`ENCCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tceven`
--

LOCK TABLES `tceven` WRITE;
/*!40000 ALTER TABLE `tceven` DISABLE KEYS */;
/*!40000 ALTER TABLE `tceven` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tclild`
--

DROP TABLE IF EXISTS `tclild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tclild` (
  `ILDCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `ILDDIA` date DEFAULT NULL,
  `ILDHORAINICIAL` time DEFAULT NULL,
  `ILDHORAFINAL` time DEFAULT NULL,
  `ILDCODIGOENC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ILDCODIGO`),
  KEY `ILDCODIGOENC` (`ILDCODIGOENC`),
  CONSTRAINT `tclild_ibfk_1` FOREIGN KEY (`ILDCODIGOENC`) REFERENCES `tceenc` (`ENCCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclild`
--

LOCK TABLES `tclild` WRITE;
/*!40000 ALTER TABLE `tclild` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgcace`
--

DROP TABLE IF EXISTS `tgcace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgcace` (
  `ACECODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `ACEDESCRICAO` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ACECODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgcace`
--

LOCK TABLES `tgcace` WRITE;
/*!40000 ALTER TABLE `tgcace` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgcace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgciat`
--

DROP TABLE IF EXISTS `tgciat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgciat` (
  `IATCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `IATCODIGOTUS` int(11) DEFAULT NULL,
  `IATCODIGOACE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IATCODIGO`),
  KEY `IATCODIGOACE` (`IATCODIGOACE`),
  KEY `IATCODIGOTUS` (`IATCODIGOTUS`),
  CONSTRAINT `tgciat_ibfk_1` FOREIGN KEY (`IATCODIGOACE`) REFERENCES `tgcace` (`ACECODIGO`),
  CONSTRAINT `tgciat_ibfk_2` FOREIGN KEY (`IATCODIGOTUS`) REFERENCES `tgctus` (`TUSCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgciat`
--

LOCK TABLES `tgciat` WRITE;
/*!40000 ALTER TABLE `tgciat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgciat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgcpar`
--

DROP TABLE IF EXISTS `tgcpar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgcpar` (
  `PARNOME` varchar(20) DEFAULT NULL,
  `PARTIPO` char(1) DEFAULT NULL,
  `PARDESCRICAO` varchar(60) DEFAULT NULL,
  `PARVALOR` varchar(30) DEFAULT NULL,
  `PARULTIMAALTER` datetime DEFAULT NULL,
  `PARCODIGOUSUULTIMAALTER` int(11) DEFAULT NULL,
  KEY `PARCODIGOUSUULTIMAALTER` (`PARCODIGOUSUULTIMAALTER`),
  CONSTRAINT `tgcpar_ibfk_1` FOREIGN KEY (`PARCODIGOUSUULTIMAALTER`) REFERENCES `tgpusu` (`USUCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgcpar`
--

LOCK TABLES `tgcpar` WRITE;
/*!40000 ALTER TABLE `tgcpar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgcpar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgctus`
--

DROP TABLE IF EXISTS `tgctus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgctus` (
  `TUSCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `TUSDESCRICAO` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`TUSCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgctus`
--

LOCK TABLES `tgctus` WRITE;
/*!40000 ALTER TABLE `tgctus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgctus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgpcli`
--

DROP TABLE IF EXISTS `tgpcli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgpcli` (
  `CLICODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `CLINOME` varchar(80) DEFAULT NULL,
  `CLIEMAIL` varchar(100) DEFAULT NULL,
  `CLICELULAR` varchar(15) DEFAULT NULL,
  `CLITELEFONE` varchar(15) DEFAULT NULL,
  `CLICPF` char(11) DEFAULT NULL,
  `CLICNPJ` char(14) DEFAULT NULL,
  `CLIENDERECO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CLICODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgpcli`
--

LOCK TABLES `tgpcli` WRITE;
/*!40000 ALTER TABLE `tgpcli` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgpcli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgpusu`
--

DROP TABLE IF EXISTS `tgpusu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgpusu` (
  `USUCODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `USUNOME` varchar(80) DEFAULT NULL,
  `USUCODIGOTUS` int(11) DEFAULT NULL,
  `USUSENHA` varchar(50) DEFAULT NULL,
  `USUEMAIL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USUCODIGO`),
  KEY `USUCODIGOTUS` (`USUCODIGOTUS`),
  CONSTRAINT `tgpusu_ibfk_1` FOREIGN KEY (`USUCODIGOTUS`) REFERENCES `tgctus` (`TUSCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgpusu`
--

LOCK TABLES `tgpusu` WRITE;
/*!40000 ALTER TABLE `tgpusu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgpusu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-20 14:52:53
