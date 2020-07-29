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
  `ENCOBSERVACAO` varchar(200) DEFAULT NULL,
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
  `PROESPECIFICACAOUNID` char(2) DEFAULT NULL,
  `PROGASTOMINSERVICO` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROCODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcepro`
--

LOCK TABLES `tcepro` WRITE;
/*!40000 ALTER TABLE `tcepro` DISABLE KEYS */;
INSERT INTO `tcepro` VALUES (1,'Bolo de chocolate','Bolo com massa de chocolate e cobertura de chocolate',75.50,'KG',120),(2,'PÃ£o de queijo','pÃ£o de queijo do dia',8.50,'KG',45),(3,'Pão francês',NULL,5.00,'KG',60),(4,'Coxinha pequena','Coxinha com massa de batata, 5cm de altura',20.00,'KG',140),(5,'Coxinha média','Coxinha com massa de batata, 7cm de altura',20.00,'KG',160),(6,'Coxinha grande','Coxinha com massa de batata, 10cm de altura',20.00,'KG',180);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgcace`
--

LOCK TABLES `tgcace` WRITE;
/*!40000 ALTER TABLE `tgcace` DISABLE KEYS */;
INSERT INTO `tgcace` VALUES (1,'Permissão total'),(2,'Excluir Usuários');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgciat`
--

LOCK TABLES `tgciat` WRITE;
/*!40000 ALTER TABLE `tgciat` DISABLE KEYS */;
INSERT INTO `tgciat` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `tgciat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgcpar`
--

DROP TABLE IF EXISTS `tgcpar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tgcpar` (
  `PARNOME` varchar(20) NOT NULL,
  `PARTIPO` char(1) DEFAULT NULL,
  `PARDESCRICAO` varchar(60) DEFAULT NULL,
  `PARVALOR` varchar(30) DEFAULT NULL,
  `PARULTIMAALTER` datetime DEFAULT NULL,
  `PARCODIGOUSUULTIMAALTER` int(11) DEFAULT NULL,
  PRIMARY KEY (`PARNOME`),
  KEY `PARCODIGOUSUULTIMAALTER` (`PARCODIGOUSUULTIMAALTER`),
  CONSTRAINT `tgcpar_ibfk_1` FOREIGN KEY (`PARCODIGOUSUULTIMAALTER`) REFERENCES `tgpusu` (`USUCODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgcpar`
--

LOCK TABLES `tgcpar` WRITE;
/*!40000 ALTER TABLE `tgcpar` DISABLE KEYS */;
INSERT INTO `tgcpar` VALUES ('MINUTOSERVDIARIO','I','Valor em minutos do tempo de serviço por funcionario','300','2020-07-28 00:00:00',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgctus`
--

LOCK TABLES `tgctus` WRITE;
/*!40000 ALTER TABLE `tgctus` DISABLE KEYS */;
INSERT INTO `tgctus` VALUES (1,'Administrador geral');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgpcli`
--

LOCK TABLES `tgpcli` WRITE;
/*!40000 ALTER TABLE `tgpcli` DISABLE KEYS */;
INSERT INTO `tgpcli` VALUES (1,'Thiago','thiago@gmail.com','34995624587',NULL,'41258965478',NULL,'av teste 1, nº200, uberlândia'),(2,'Antenor','antenor@gmail.com','34965847541','3447589562','78452136584',NULL,'av rondon pacheco, nº405, uberlândia'),(3,'soft company','softcompany@gmail.com','39985475632','3452145874',NULL,'44336645000175','av castelo branco, nº580, uberlândia'),(4,'empresa teste','empreteste@teste.com','','3441564251','','41256325000154','endereco teste');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgpusu`
--

LOCK TABLES `tgpusu` WRITE;
/*!40000 ALTER TABLE `tgpusu` DISABLE KEYS */;
INSERT INTO `tgpusu` VALUES (2,'antenor',1,'827ccb0eea8a706c4c34a16891f84e7b','antenor@gmail.com'),(19,'bia',1,'e10adc3949ba59abbe56e057f20f883e','bia@teste.com'),(21,'meire',1,'fcea920f7412b5da7be0cf42b8c93759','meire@gmail.com'),(24,'andreia',1,'6ebe76c9fb411be97b3b0d48b791a7c9','andreia@hotmail.com'),(25,'miguel',1,'d553d148479a268914cecb77b2b88e6a','miguel@gmail.com');
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

-- Dump completed on 2020-07-29  1:32:06
