CREATE DATABASE  IF NOT EXISTS `unidb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `unidb`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: unidb
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classes` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `placeID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `placeID` (`placeID`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`placeID`) REFERENCES `places` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contacts` (
  `ID` int(10) unsigned NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_day_time`
--

DROP TABLE IF EXISTS `course_day_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course_day_time` (
  `courseID` int(10) unsigned DEFAULT NULL,
  `dayID` int(10) unsigned DEFAULT NULL,
  `timeID` int(10) unsigned DEFAULT NULL,
  KEY `courseID` (`courseID`),
  KEY `dayID` (`dayID`),
  KEY `timeID` (`timeID`),
  CONSTRAINT `course_day_time_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`ID`),
  CONSTRAINT `course_day_time_ibfk_2` FOREIGN KEY (`dayID`) REFERENCES `days` (`ID`),
  CONSTRAINT `course_day_time_ibfk_3` FOREIGN KEY (`timeID`) REFERENCES `times` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_day_time`
--

LOCK TABLES `course_day_time` WRITE;
/*!40000 ALTER TABLE `course_day_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_day_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_professor`
--

DROP TABLE IF EXISTS `course_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course_professor` (
  `courseID` int(10) unsigned DEFAULT NULL,
  `professorID` int(10) unsigned DEFAULT NULL,
  KEY `courseID` (`courseID`),
  KEY `professorID` (`professorID`),
  CONSTRAINT `course_professor_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`ID`),
  CONSTRAINT `course_professor_ibfk_2` FOREIGN KEY (`professorID`) REFERENCES `professors` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_professor`
--

LOCK TABLES `course_professor` WRITE;
/*!40000 ALTER TABLE `course_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_types`
--

DROP TABLE IF EXISTS `course_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `course_types` (
  `ID` int(10) unsigned NOT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_types`
--

LOCK TABLES `course_types` WRITE;
/*!40000 ALTER TABLE `course_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses` (
  `ID` int(10) unsigned NOT NULL,
  `semesterID` int(10) unsigned DEFAULT NULL,
  `moduleID` int(10) unsigned DEFAULT NULL,
  `classID` int(10) unsigned DEFAULT NULL,
  `courseTypeID` int(10) unsigned DEFAULT NULL,
  `minimumCapacity` int(10) DEFAULT NULL,
  `maximumCapacity` int(10) DEFAULT NULL,
  `currentCapacity` int(10) DEFAULT NULL,
  `courseURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `semesterID` (`semesterID`),
  KEY `moduleID` (`moduleID`),
  KEY `classID` (`classID`),
  KEY `courseTypeID` (`courseTypeID`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`semesterID`) REFERENCES `semesters` (`ID`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`moduleID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `courses_ibfk_3` FOREIGN KEY (`classID`) REFERENCES `classes` (`ID`),
  CONSTRAINT `courses_ibfk_4` FOREIGN KEY (`courseTypeID`) REFERENCES `course_types` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `days`
--

DROP TABLE IF EXISTS `days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `days` (
  `ID` int(10) unsigned NOT NULL,
  `day` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `days`
--

LOCK TABLES `days` WRITE;
/*!40000 ALTER TABLE `days` DISABLE KEYS */;
/*!40000 ALTER TABLE `days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `placeID` int(10) unsigned DEFAULT NULL,
  `contactID` int(10) unsigned DEFAULT NULL,
  `facultyID` int(10) unsigned DEFAULT NULL,
  `deanID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `placeID` (`placeID`),
  KEY `contactID` (`contactID`),
  KEY `facultyID` (`facultyID`),
  KEY `deanID` (`deanID`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`placeID`) REFERENCES `places` (`ID`),
  CONSTRAINT `departments_ibfk_2` FOREIGN KEY (`contactID`) REFERENCES `contacts` (`ID`),
  CONSTRAINT `departments_ibfk_3` FOREIGN KEY (`facultyID`) REFERENCES `faculties` (`ID`),
  CONSTRAINT `departments_ibfk_4` FOREIGN KEY (`deanID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_types`
--

DROP TABLE IF EXISTS `employee_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee_types` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hoursPerWeek` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_types`
--

LOCK TABLES `employee_types` WRITE;
/*!40000 ALTER TABLE `employee_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_roles`
--

DROP TABLE IF EXISTS `exam_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exam_roles` (
  `ID` int(10) unsigned NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_roles`
--

LOCK TABLES `exam_roles` WRITE;
/*!40000 ALTER TABLE `exam_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_staff`
--

DROP TABLE IF EXISTS `exam_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exam_staff` (
  `semesterID` int(10) unsigned DEFAULT NULL,
  `staffID` int(10) unsigned DEFAULT NULL,
  `examRoleID` int(10) unsigned DEFAULT NULL,
  KEY `semesterID` (`semesterID`),
  KEY `staffID` (`staffID`),
  KEY `examRoleID` (`examRoleID`),
  CONSTRAINT `exam_staff_ibfk_1` FOREIGN KEY (`semesterID`) REFERENCES `semesters` (`ID`),
  CONSTRAINT `exam_staff_ibfk_2` FOREIGN KEY (`staffID`) REFERENCES `staffs` (`ID`),
  CONSTRAINT `exam_staff_ibfk_3` FOREIGN KEY (`examRoleID`) REFERENCES `exam_roles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_staff`
--

LOCK TABLES `exam_staff` WRITE;
/*!40000 ALTER TABLE `exam_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_statuses`
--

DROP TABLE IF EXISTS `exam_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exam_statuses` (
  `ID` int(10) unsigned NOT NULL,
  `statusName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_statuses`
--

LOCK TABLES `exam_statuses` WRITE;
/*!40000 ALTER TABLE `exam_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faculties` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `placeID` int(10) unsigned DEFAULT NULL,
  `contactID` int(10) unsigned DEFAULT NULL,
  `deanID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `placeID` (`placeID`),
  KEY `contactID` (`contactID`),
  KEY `deanID` (`deanID`),
  CONSTRAINT `faculties_ibfk_1` FOREIGN KEY (`placeID`) REFERENCES `places` (`ID`),
  CONSTRAINT `faculties_ibfk_2` FOREIGN KEY (`contactID`) REFERENCES `contacts` (`ID`),
  CONSTRAINT `faculties_ibfk_3` FOREIGN KEY (`deanID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level_of_studies`
--

DROP TABLE IF EXISTS `level_of_studies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `level_of_studies` (
  `ID` int(10) unsigned NOT NULL,
  `isGraduate` tinyint(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level_of_studies`
--

LOCK TABLES `level_of_studies` WRITE;
/*!40000 ALTER TABLE `level_of_studies` DISABLE KEYS */;
/*!40000 ALTER TABLE `level_of_studies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors`
--

DROP TABLE IF EXISTS `majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `majors` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `placeID` int(10) unsigned DEFAULT NULL,
  `facultyID` int(10) unsigned DEFAULT NULL,
  `departmentID` int(10) unsigned DEFAULT NULL,
  `deanID` int(10) unsigned DEFAULT NULL,
  `levelofStudyID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `placeID` (`placeID`),
  KEY `facultyID` (`facultyID`),
  KEY `departmentID` (`departmentID`),
  KEY `deanID` (`deanID`),
  KEY `levelofStudyID` (`levelofStudyID`),
  CONSTRAINT `majors_ibfk_1` FOREIGN KEY (`placeID`) REFERENCES `places` (`ID`),
  CONSTRAINT `majors_ibfk_2` FOREIGN KEY (`facultyID`) REFERENCES `faculties` (`ID`),
  CONSTRAINT `majors_ibfk_3` FOREIGN KEY (`departmentID`) REFERENCES `departments` (`ID`),
  CONSTRAINT `majors_ibfk_4` FOREIGN KEY (`deanID`) REFERENCES `users` (`ID`),
  CONSTRAINT `majors_ibfk_5` FOREIGN KEY (`levelofStudyID`) REFERENCES `level_of_studies` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
/*!40000 ALTER TABLE `majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_groups`
--

DROP TABLE IF EXISTS `module_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `module_groups` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_groups`
--

LOCK TABLES `module_groups` WRITE;
/*!40000 ALTER TABLE `module_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_types`
--

DROP TABLE IF EXISTS `module_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `module_types` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_types`
--

LOCK TABLES `module_types` WRITE;
/*!40000 ALTER TABLE `module_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `modules` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `moduleTypeID` int(10) unsigned DEFAULT NULL,
  `moduleGroupID` int(10) unsigned DEFAULT NULL,
  `credits` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `moduleTypeID` (`moduleTypeID`),
  KEY `moduleGroupID` (`moduleGroupID`),
  CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`moduleTypeID`) REFERENCES `module_types` (`ID`),
  CONSTRAINT `modules_ibfk_2` FOREIGN KEY (`moduleGroupID`) REFERENCES `module_groups` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `places` (
  `ID` int(10) unsigned NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `floor` int(10) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `capacity` int(10) DEFAULT NULL,
  `size_sq_2` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_modules`
--

DROP TABLE IF EXISTS `pre_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pre_modules` (
  `moduleID` int(10) unsigned DEFAULT NULL,
  `preModuleID` int(10) unsigned DEFAULT NULL,
  KEY `moduleID` (`moduleID`),
  KEY `preModuleID` (`preModuleID`),
  CONSTRAINT `pre_modules_ibfk_1` FOREIGN KEY (`moduleID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `pre_modules_ibfk_2` FOREIGN KEY (`preModuleID`) REFERENCES `modules` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_modules`
--

LOCK TABLES `pre_modules` WRITE;
/*!40000 ALTER TABLE `pre_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_ranks`
--

DROP TABLE IF EXISTS `professor_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `professor_ranks` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_ranks`
--

LOCK TABLES `professor_ranks` WRITE;
/*!40000 ALTER TABLE `professor_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `professors` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned DEFAULT NULL,
  `rankID` int(10) unsigned DEFAULT NULL,
  `departmentID` int(10) unsigned DEFAULT NULL,
  `facultyID` int(10) unsigned DEFAULT NULL,
  `employeeTypeID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `rankID` (`rankID`),
  KEY `departmentID` (`departmentID`),
  KEY `facultyID` (`facultyID`),
  KEY `employeeTypeID` (`employeeTypeID`),
  CONSTRAINT `professors_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`),
  CONSTRAINT `professors_ibfk_2` FOREIGN KEY (`rankID`) REFERENCES `professor_ranks` (`ID`),
  CONSTRAINT `professors_ibfk_3` FOREIGN KEY (`departmentID`) REFERENCES `departments` (`ID`),
  CONSTRAINT `professors_ibfk_4` FOREIGN KEY (`facultyID`) REFERENCES `faculties` (`ID`),
  CONSTRAINT `professors_ibfk_5` FOREIGN KEY (`employeeTypeID`) REFERENCES `employee_types` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seasons` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `semesters` (
  `ID` int(10) unsigned NOT NULL,
  `academicYear` year(4) DEFAULT NULL,
  `seasonID` int(10) unsigned DEFAULT NULL,
  `startRegister` datetime DEFAULT NULL,
  `endRegister` datetime DEFAULT NULL,
  `startSemester` date DEFAULT NULL,
  `startCourses` date DEFAULT NULL,
  `endCourses` date DEFAULT NULL,
  `startExam` date DEFAULT NULL,
  `endExam` date DEFAULT NULL,
  `endSemester` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `seasonID` (`seasonID`),
  CONSTRAINT `semesters_ibfk_1` FOREIGN KEY (`seasonID`) REFERENCES `seasons` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_statuses`
--

DROP TABLE IF EXISTS `st_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `st_statuses` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_statuses`
--

LOCK TABLES `st_statuses` WRITE;
/*!40000 ALTER TABLE `st_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_roles`
--

DROP TABLE IF EXISTS `staff_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staff_roles` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_roles`
--

LOCK TABLES `staff_roles` WRITE;
/*!40000 ALTER TABLE `staff_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `staffs` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(10) unsigned DEFAULT NULL,
  `roleID` int(10) unsigned DEFAULT NULL,
  `departmentID` int(10) unsigned DEFAULT NULL,
  `employeeTypeID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `roleID` (`roleID`),
  KEY `departmentID` (`departmentID`),
  KEY `employeeTypeID` (`employeeTypeID`),
  CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`),
  CONSTRAINT `staffs_ibfk_2` FOREIGN KEY (`roleID`) REFERENCES `staff_roles` (`ID`),
  CONSTRAINT `staffs_ibfk_3` FOREIGN KEY (`departmentID`) REFERENCES `departments` (`ID`),
  CONSTRAINT `staffs_ibfk_4` FOREIGN KEY (`employeeTypeID`) REFERENCES `employee_types` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `studentNumber` int(10) DEFAULT NULL,
  `userID` int(10) unsigned DEFAULT NULL,
  `stStatusID` int(10) unsigned DEFAULT NULL,
  `majorID` int(10) unsigned DEFAULT NULL,
  `levelOfStudyID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `userID` (`userID`),
  KEY `stStatusID` (`stStatusID`),
  KEY `majorID` (`majorID`),
  KEY `levelOfStudyID` (`levelOfStudyID`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`stStatusID`) REFERENCES `st_statuses` (`ID`),
  CONSTRAINT `students_ibfk_3` FOREIGN KEY (`majorID`) REFERENCES `majors` (`ID`),
  CONSTRAINT `students_ibfk_4` FOREIGN KEY (`levelOfStudyID`) REFERENCES `level_of_studies` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_plan`
--

DROP TABLE IF EXISTS `study_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `study_plan` (
  `moduleID` int(10) unsigned DEFAULT NULL,
  `majorID` int(10) unsigned DEFAULT NULL,
  KEY `moduleID` (`moduleID`),
  KEY `majorID` (`majorID`),
  CONSTRAINT `study_plan_ibfk_1` FOREIGN KEY (`moduleID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `study_plan_ibfk_2` FOREIGN KEY (`majorID`) REFERENCES `majors` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plan`
--

LOCK TABLES `study_plan` WRITE;
/*!40000 ALTER TABLE `study_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `study_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `times`
--

DROP TABLE IF EXISTS `times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `times` (
  `ID` int(10) unsigned NOT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `times`
--

LOCK TABLES `times` WRITE;
/*!40000 ALTER TABLE `times` DISABLE KEYS */;
/*!40000 ALTER TABLE `times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcripts`
--

DROP TABLE IF EXISTS `transcripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transcripts` (
  `ID` int(10) unsigned NOT NULL,
  `courseID` int(10) unsigned DEFAULT NULL,
  `studentID` int(10) unsigned DEFAULT NULL,
  `grade` int(10) unsigned DEFAULT NULL,
  `examStatusID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `courseID` (`courseID`),
  KEY `studentID` (`studentID`),
  KEY `examStatusID` (`examStatusID`),
  CONSTRAINT `transcripts_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`ID`),
  CONSTRAINT `transcripts_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `students` (`ID`),
  CONSTRAINT `transcripts_ibfk_3` FOREIGN KEY (`examStatusID`) REFERENCES `exam_statuses` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcripts`
--

LOCK TABLES `transcripts` WRITE;
/*!40000 ALTER TABLE `transcripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `university` (
  `ID` int(10) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deanID` int(10) unsigned DEFAULT NULL,
  `placeID` int(10) unsigned DEFAULT NULL,
  `contactID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `deanID` (`deanID`),
  KEY `placeID` (`placeID`),
  KEY `contactID` (`contactID`),
  CONSTRAINT `university_ibfk_1` FOREIGN KEY (`deanID`) REFERENCES `users` (`ID`),
  CONSTRAINT `university_ibfk_2` FOREIGN KEY (`placeID`) REFERENCES `places` (`ID`),
  CONSTRAINT `university_ibfk_3` FOREIGN KEY (`contactID`) REFERENCES `contacts` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(225) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleID` int(10) unsigned DEFAULT NULL,
  `nationalID` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `fatherName` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `birthPlace` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(225) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `mobile` int(20) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idx_nationalID` (`nationalID`),
  KEY `roleID` (`roleID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `roles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-10  0:37:03
