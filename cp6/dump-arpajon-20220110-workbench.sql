CREATE DATABASE  IF NOT EXISTS `arpajon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `arpajon`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: arpajon
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses` (
  `id_cur` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `coeff` tinyint DEFAULT NULL,
  `id_teach` tinyint DEFAULT NULL,
  `book` mediumblob,
  PRIMARY KEY (`id_cur`),
  KEY `fk_courses_teachers` (`id_teach`),
  CONSTRAINT `fk_courses_teachers` FOREIGN KEY (`id_teach`) REFERENCES `teachers` (`id_teach`),
  CONSTRAINT `ck_courses_coeff` CHECK ((`coeff` between 1 and 12)),
  CONSTRAINT `nn_courses_title` CHECK ((`title` is not null))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('CP1','Maquetter une application',1,2,NULL),('CP2','Réaliser une interface utilisateur web statique et adaptable',2,4,NULL),('CP3','Développer une interface utilisateur web dynamique',3,3,NULL),('CP4','Réaliser une interface utilisateur avec une solution de gestion de contenu ou e-commerce',1,2,NULL),('CP5','Créer une base de données',1,4,NULL),('CP6','Développer les composants d\'accès aux données',2,4,NULL),('CP7','Développer la partie back-end d\'une application web ou web mobile',3,3,NULL),('CP8','Elaborer et mettre en oeuvre des composants dans une application de gestion de contenu ou e-commerce',2,1,NULL),('ENG','Anglais',1,NULL,NULL),('PRJ','Gestion du projet final',3,1,NULL),('TRE','Technique de Recherche d\'Emploi',1,5,NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follow` (
  `id_stud` tinyint NOT NULL,
  `id_cur` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `score` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_stud`,`id_cur`),
  KEY `fk_follow_courses` (`id_cur`),
  CONSTRAINT `fk_follow_courses` FOREIGN KEY (`id_cur`) REFERENCES `courses` (`id_cur`),
  CONSTRAINT `fk_follow_students` FOREIGN KEY (`id_stud`) REFERENCES `students` (`id_stud`),
  CONSTRAINT `ck_follow_score` CHECK ((`score` between 1 and 20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (1,'CP1',9),(1,'CP2',9),(1,'CP3',10),(1,'CP4',19),(1,'CP5',17),(1,'CP6',6),(1,'CP7',19),(1,'CP8',6),(1,'ENG',17),(1,'PRJ',14),(1,'TRE',12),(2,'CP1',16),(2,'CP2',9),(2,'CP3',8),(2,'CP4',10),(2,'CP5',13),(2,'CP6',16),(2,'CP7',11),(2,'CP8',9),(2,'ENG',17),(2,'PRJ',15),(2,'TRE',20),(3,'CP1',9),(3,'CP2',9),(3,'CP3',17),(3,'CP4',6),(3,'CP5',10),(3,'CP6',16),(3,'CP7',20),(3,'CP8',6),(3,'ENG',9),(3,'PRJ',6),(3,'TRE',18),(4,'CP1',13),(4,'CP2',16),(4,'CP3',12),(4,'CP4',14),(4,'CP5',9),(4,'CP6',16),(4,'CP7',9),(4,'CP8',19),(4,'ENG',13),(4,'PRJ',11),(4,'TRE',18),(5,'CP1',15),(5,'CP2',12),(5,'CP3',19),(5,'CP4',17),(5,'CP5',19),(5,'CP6',20),(5,'CP7',6),(5,'CP8',12),(5,'ENG',7),(5,'PRJ',7),(5,'TRE',17),(6,'CP1',18),(6,'CP2',19),(6,'CP3',17),(6,'CP4',20),(6,'CP5',9),(6,'CP6',15),(6,'CP7',16),(6,'CP8',19),(6,'ENG',12),(6,'PRJ',13),(6,'TRE',11),(7,'CP1',9),(7,'CP2',12),(7,'CP3',17),(7,'CP4',19),(7,'CP5',18),(7,'CP6',19),(7,'CP7',18),(7,'CP8',13),(7,'ENG',12),(7,'PRJ',19),(7,'TRE',9),(8,'CP1',10),(8,'CP2',20),(8,'CP3',13),(8,'CP4',20),(8,'CP5',16),(8,'CP6',15),(8,'CP7',13),(8,'CP8',11),(8,'ENG',16),(8,'PRJ',17),(8,'TRE',18),(9,'CP1',12),(9,'CP2',9),(9,'CP3',20),(9,'CP4',17),(9,'CP5',11),(9,'CP6',6),(9,'CP7',14),(9,'CP8',10),(9,'ENG',14),(9,'PRJ',19),(9,'TRE',7),(10,'CP1',8),(10,'CP2',10),(10,'CP3',7),(10,'CP4',11),(10,'CP5',11),(10,'CP6',7),(10,'CP7',15),(10,'CP8',15),(10,'ENG',11),(10,'PRJ',15),(10,'TRE',15),(11,'CP1',8),(11,'CP2',20),(11,'CP3',10),(11,'CP4',14),(11,'CP5',7),(11,'CP6',7),(11,'CP7',8),(11,'CP8',18),(11,'ENG',20),(11,'PRJ',6),(11,'TRE',14),(12,'CP1',15),(12,'CP2',20),(12,'CP3',19),(12,'CP4',12),(12,'CP5',20),(12,'CP6',10),(12,'CP7',16),(12,'CP8',18),(12,'ENG',8),(12,'PRJ',13),(12,'TRE',19),(13,'CP1',8),(13,'CP2',11),(13,'CP3',7),(13,'CP4',13),(13,'CP5',15),(13,'CP6',9),(13,'CP7',15),(13,'CP8',17),(13,'ENG',19),(13,'PRJ',20),(13,'TRE',16),(14,'CP1',7),(14,'CP2',19),(14,'CP3',13),(14,'CP4',17),(14,'CP5',8),(14,'CP6',6),(14,'CP7',19),(14,'CP8',9),(14,'ENG',6),(14,'PRJ',9),(14,'TRE',19),(15,'CP1',11),(15,'CP2',13),(15,'CP3',18),(15,'CP4',14),(15,'CP5',19),(15,'CP6',12),(15,'CP7',10),(15,'CP8',19),(15,'ENG',8),(15,'PRJ',19),(15,'TRE',6);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `id_stud` tinyint NOT NULL AUTO_INCREMENT,
  `fname` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `sex` enum('F','M') COLLATE utf8mb4_general_ci NOT NULL,
  `tel` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_stud`),
  UNIQUE KEY `uq_students_tel` (`tel`),
  KEY `idx_students_fname` (`fname`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Waya','2000-05-26','F','06 12 54 89 71'),(2,'Christine','2000-11-02','F','06 12 54 09 71'),(3,'Abdoul','1989-07-12','M','07 12 54 89 71'),(4,'Adil','1998-02-01','M','07 22 54 89 71'),(5,'Arnaud','1994-07-12','M','07 55 61 45 71'),(6,'Fabrice','1991-08-22','M','01 12 33 89 71'),(7,'Gaël','1990-01-06','M','06 78 54 89 21'),(8,'Gore','1980-07-12','M','06 55 54 11 71'),(9,'Emmanuel','1996-03-04','M','06 11 22 33 44'),(10,'Peter','1983-08-16','M','06 05 05 81 79'),(11,'Quentin','1995-04-15','M','07 80 91 52 46'),(12,'Philippe','1991-06-07','M','06 64 54 89 00'),(13,'Zackaria','1998-09-25','M','06 21 00 89 79'),(14,'Kamel','2002-10-06','M','07 11 54 22 99'),(15,'Xavier','1993-12-10','M','06 00 00 00 00');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teachers` (
  `id_teach` tinyint NOT NULL AUTO_INCREMENT,
  `fname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `grade` tinyint DEFAULT NULL,
  `dos` date DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_teach`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `teachers_chk_1` CHECK ((`grade` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Nadjet',3,'2020-09-15','nadjet@mygreta.fr'),(2,'Martin',2,'2021-10-20','martin@mygreta.fr'),(3,'Saman',2,'2021-03-11','saman@mygreta.fr'),(4,'Lesly',4,'1994-04-05','lesly@mygreta.fr'),(5,'Olivier',4,'2002-05-19','olivier@mygreta.fr'),(6,'Soupramanien',5,'2018-01-20','soupramanien@mygreta.fr');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'arpajon'
--

--
-- Dumping routines for database 'arpajon'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-10 22:09:12
