CREATE DATABASE  IF NOT EXISTS `database` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `database`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: database
-- ------------------------------------------------------
-- Server version	5.6.17-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `CIN` int(11) NOT NULL,
  PRIMARY KEY (`CIN`),
  CONSTRAINT `CIN3` FOREIGN KEY (`CIN`) REFERENCES `personnes` (`CIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1234567);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conseil`
--

DROP TABLE IF EXISTS `conseil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conseil` (
  `CIN` int(11) NOT NULL,
  PRIMARY KEY (`CIN`),
  CONSTRAINT `cin6` FOREIGN KEY (`CIN`) REFERENCES `personnes` (`CIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conseil`
--

LOCK TABLES `conseil` WRITE;
/*!40000 ALTER TABLE `conseil` DISABLE KEYS */;
INSERT INTO `conseil` VALUES (5678901);
/*!40000 ALTER TABLE `conseil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `demanderesume`
--

DROP TABLE IF EXISTS `demanderesume`;
/*!50001 DROP VIEW IF EXISTS `demanderesume`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `demanderesume` (
  `id` tinyint NOT NULL,
  `CIN` tinyint NOT NULL,
  `nom` tinyint NOT NULL,
  `prenom` tinyint NOT NULL,
  `filliere` tinyint NOT NULL,
  `annee` tinyint NOT NULL,
  `matiere` tinyint NOT NULL,
  `devoir` tinyint NOT NULL,
  `Etat` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `demandes`
--

DROP TABLE IF EXISTS `demandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CIN` int(11) NOT NULL,
  `Prof1` int(11) DEFAULT NULL,
  `Prof2` int(11) DEFAULT NULL,
  `Matiere` int(11) NOT NULL,
  `Raison` varchar(300) NOT NULL,
  `Etat` int(11) DEFAULT NULL,
  `Rapport` varchar(300) DEFAULT NULL,
  `Note1` int(11) DEFAULT NULL,
  `Note2` int(11) DEFAULT NULL,
  `Devoir` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Etudiant_idx` (`CIN`),
  KEY `Prof1_idx` (`Prof1`),
  KEY `Prof2_idx` (`Prof2`),
  KEY `Matiere_idx` (`Matiere`),
  CONSTRAINT `Etudiant` FOREIGN KEY (`CIN`) REFERENCES `etudiants` (`CIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Matiere2` FOREIGN KEY (`Matiere`) REFERENCES `matiere` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Prof1` FOREIGN KEY (`Prof1`) REFERENCES `professeur` (`CIN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Prof2` FOREIGN KEY (`Prof2`) REFERENCES `professeur` (`CIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes`
--

LOCK TABLES `demandes` WRITE;
/*!40000 ALTER TABLE `demandes` DISABLE KEYS */;
INSERT INTO `demandes` VALUES (4,2345678,4567890,4567890,7,'incertitude',5,'erreur de calcul',3,0,1),(5,8749241,4567890,4567890,6,'Incertitude',5,NULL,6,0,2),(6,8749241,4567890,3456789,3,'Bizarre',5,NULL,2,0,2),(7,8749241,3456789,4567890,3,'Redoubler',5,'Trompé de personne\r\n',3,0,1),(8,8749241,NULL,NULL,3,'nnnn',-1,NULL,NULL,NULL,1),(9,8749241,4567890,4567890,6,'incertitude',5,NULL,5,0,1);
/*!40000 ALTER TABLE `demandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enseigne`
--

DROP TABLE IF EXISTS `enseigne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enseigne` (
  `CIN` int(11) NOT NULL,
  `idMatiere` int(11) NOT NULL,
  PRIMARY KEY (`CIN`,`idMatiere`),
  KEY `matiere_idx` (`idMatiere`),
  CONSTRAINT `matiere` FOREIGN KEY (`idMatiere`) REFERENCES `matiere` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professer` FOREIGN KEY (`CIN`) REFERENCES `professeur` (`CIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enseigne`
--

LOCK TABLES `enseigne` WRITE;
/*!40000 ALTER TABLE `enseigne` DISABLE KEYS */;
INSERT INTO `enseigne` VALUES (3456789,3),(4567890,3),(4567890,5),(4567890,6),(4567890,7),(4567890,8);
/*!40000 ALTER TABLE `enseigne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etudiants` (
  `CIN` int(11) NOT NULL,
  `NbreDemande` int(11) DEFAULT '0',
  `filliere` int(11) NOT NULL,
  `annee` int(11) NOT NULL,
  PRIMARY KEY (`CIN`),
  KEY `filliereeleve_idx` (`filliere`),
  CONSTRAINT `filliereeleve` FOREIGN KEY (`filliere`) REFERENCES `filliere` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CIN` FOREIGN KEY (`CIN`) REFERENCES `personnes` (`CIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiants`
--

LOCK TABLES `etudiants` WRITE;
/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
INSERT INTO `etudiants` VALUES (2345678,1,2,1),(8749241,6,1,1);
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `etudiantsresume`
--

DROP TABLE IF EXISTS `etudiantsresume`;
/*!50001 DROP VIEW IF EXISTS `etudiantsresume`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `etudiantsresume` (
  `prenom` tinyint NOT NULL,
  `nom` tinyint NOT NULL,
  `CIN` tinyint NOT NULL,
  `annee` tinyint NOT NULL,
  `filliere` tinyint NOT NULL,
  `NbreDemande` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `filliere`
--

DROP TABLE IF EXISTS `filliere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filliere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitulé` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filliere`
--

LOCK TABLES `filliere` WRITE;
/*!40000 ALTER TABLE `filliere` DISABLE KEYS */;
INSERT INTO `filliere` VALUES (1,'GL'),(2,'RT');
/*!40000 ALTER TABLE `filliere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matiere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intitulé` varchar(45) NOT NULL,
  `filliere` int(11) NOT NULL,
  `annee` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filliere_idx` (`filliere`),
  CONSTRAINT `filliere` FOREIGN KEY (`filliere`) REFERENCES `filliere` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matiere`
--

LOCK TABLES `matiere` WRITE;
/*!40000 ALTER TABLE `matiere` DISABLE KEYS */;
INSERT INTO `matiere` VALUES (3,'Analyse',1,1),(5,'Compléxité',1,1),(6,'Francais',1,1),(7,'Réseau',2,1),(8,'Anglais',2,1);
/*!40000 ALTER TABLE `matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnes`
--

DROP TABLE IF EXISTS `personnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnes` (
  `CIN` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`CIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnes`
--

LOCK TABLES `personnes` WRITE;
/*!40000 ALTER TABLE `personnes` DISABLE KEYS */;
INSERT INTO `personnes` VALUES (1234567,'Khalil','Mhiri','bonjour'),(2345678,'Ahmed','Tounsi','bonjour'),(3456789,'Khaled','Badri','bonjour'),(4567890,'Ali','Blel','bonjour'),(5678901,'Ahmed','Cherif','bonjour'),(8749241,'Karim','Belhaj','bonjour');
/*!40000 ALTER TABLE `personnes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeur` (
  `CIN` int(11) NOT NULL,
  `nbreDCorection` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`CIN`),
  CONSTRAINT `CIN4` FOREIGN KEY (`CIN`) REFERENCES `personnes` (`CIN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeur`
--

LOCK TABLES `professeur` WRITE;
/*!40000 ALTER TABLE `professeur` DISABLE KEYS */;
INSERT INTO `professeur` VALUES (3456789,1),(4567890,4);
/*!40000 ALTER TABLE `professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `professeurresumé`
--

DROP TABLE IF EXISTS `professeurresumé`;
/*!50001 DROP VIEW IF EXISTS `professeurresumé`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `professeurresumé` (
  `Nom` tinyint NOT NULL,
  `Prenom` tinyint NOT NULL,
  `nbreDCorection` tinyint NOT NULL,
  `CIN` tinyint NOT NULL,
  `idMatiere` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `demanderesume`
--

/*!50001 DROP TABLE IF EXISTS `demanderesume`*/;
/*!50001 DROP VIEW IF EXISTS `demanderesume`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `demanderesume` AS select `d`.`id` AS `id`,`e`.`CIN` AS `CIN`,`p`.`nom` AS `nom`,`p`.`prenom` AS `prenom`,`f`.`intitulé` AS `filliere`,`e`.`annee` AS `annee`,`m`.`intitulé` AS `matiere`,`d`.`Devoir` AS `devoir`,`d`.`Etat` AS `Etat` from ((((`etudiants` `e` join `demandes` `d`) join `personnes` `p`) join `filliere` `f`) join `matiere` `m`) where ((`p`.`CIN` = `e`.`CIN`) and (`e`.`CIN` = `d`.`CIN`) and (`f`.`id` = `e`.`filliere`) and (`m`.`id` = `d`.`Matiere`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `etudiantsresume`
--

/*!50001 DROP TABLE IF EXISTS `etudiantsresume`*/;
/*!50001 DROP VIEW IF EXISTS `etudiantsresume`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `etudiantsresume` AS select `p`.`prenom` AS `prenom`,`p`.`nom` AS `nom`,`p`.`CIN` AS `CIN`,`e`.`annee` AS `annee`,`e`.`filliere` AS `filliere`,`e`.`NbreDemande` AS `NbreDemande` from (`etudiants` `e` join `personnes` `p`) where (`e`.`CIN` = `p`.`CIN`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `professeurresumé`
--

/*!50001 DROP TABLE IF EXISTS `professeurresumé`*/;
/*!50001 DROP VIEW IF EXISTS `professeurresumé`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `professeurresumé` AS select `i`.`nom` AS `Nom`,`i`.`prenom` AS `Prenom`,`p`.`nbreDCorection` AS `nbreDCorection`,`p`.`CIN` AS `CIN`,`e`.`idMatiere` AS `idMatiere` from ((`professeur` `p` join `personnes` `i`) join `enseigne` `e`) where ((`p`.`CIN` = `i`.`CIN`) and (`e`.`CIN` = `p`.`CIN`)) */;
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

-- Dump completed on 2014-05-25 23:45:58
