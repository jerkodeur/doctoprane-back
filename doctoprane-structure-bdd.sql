-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: doctoprane
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(80) DEFAULT NULL,
  `lastname` varchar(55) DEFAULT NULL,
  `specialty` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `med_name` varchar(55) DEFAULT NULL,
  `order_name` varchar(55) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `dosage` int(11) DEFAULT NULL,
  `used` tinyint(1) DEFAULT '0',
  `morning` tinyint(1) DEFAULT NULL,
  `midday` tinyint(1) DEFAULT NULL,
  `evening` tinyint(1) DEFAULT NULL,
  `night` tinyint(1) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medication_doctor_idx` (`doctor_id`),
  KEY `fk_medication_patient_idx` (`patient_id`),
  CONSTRAINT `fk_medication_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medication_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medication_doctor`
--

DROP TABLE IF EXISTS `medication_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `medication_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medication_doctor_idx` (`doctor_id`),
  KEY `fk_medication_doctor_1_idx` (`medication_id`),
  CONSTRAINT `fk_medication_doctor_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_medication_doctor_2` FOREIGN KEY (`medication_id`) REFERENCES `medication` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medication_patient`
--

DROP TABLE IF EXISTS `medication_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication_patient` (
  `medication_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  KEY `fk_medication_user_1_idx` (`medication_id`),
  KEY `fk_medication_user_2_idx` (`patient_id`),
  CONSTRAINT `fk_medication_user_1` FOREIGN KEY (`medication_id`) REFERENCES `medication` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_medication_user_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-25  3:41:40
