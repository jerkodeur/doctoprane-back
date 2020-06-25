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
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Greta','Devicci','general'),(2,'Taegyun','Hwarang','dentist');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (2,'Doliprane','headache',1,1,'2020-06-30',1,0,1,NULL,1,NULL,'2020-06-25 00:00:00'),(3,'Donormyl','headache',1,1,'2020-06-30',1,1,NULL,NULL,1,NULL,'2020-06-25 00:00:00'),(4,'Amoxicilline','Toothache',2,1,'2020-07-02',1,1,NULL,1,1,NULL,'2020-06-25 03:31:36'),(5,'Tramadol','Back Pain',1,2,'2020-06-28',1,0,1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `medication_doctor`
--

LOCK TABLES `medication_doctor` WRITE;
/*!40000 ALTER TABLE `medication_doctor` DISABLE KEYS */;
INSERT INTO `medication_doctor` VALUES (2,1,2),(3,1,3),(4,2,4),(5,1,5);
/*!40000 ALTER TABLE `medication_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `medication_patient`
--

LOCK TABLES `medication_patient` WRITE;
/*!40000 ALTER TABLE `medication_patient` DISABLE KEYS */;
INSERT INTO `medication_patient` VALUES (2,1),(3,1),(4,1),(5,2);
/*!40000 ALTER TABLE `medication_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Jérôme','Martin'),(2,'Florent','Descartes');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-25  3:42:39
