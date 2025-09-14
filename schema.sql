# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.5-10.4.28-MariaDB)
# Database: Citation_net
# Generation Time: 2025-09-14 13:40:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Autori_Paper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Autori_Paper`;

CREATE TABLE `Autori_Paper` (
  `ORCID` varchar(255) NOT NULL,
  `DOI` varchar(255) NOT NULL,
  PRIMARY KEY (`ORCID`,`DOI`),
  KEY `DOI` (`DOI`),
  CONSTRAINT `autori_paper_ibfk_1` FOREIGN KEY (`ORCID`) REFERENCES `Studenti` (`ORCID`),
  CONSTRAINT `autori_paper_ibfk_2` FOREIGN KEY (`DOI`) REFERENCES `Paper` (`DOI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table Cita
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cita`;

CREATE TABLE `Cita` (
  `id_citazione` int(11) NOT NULL,
  `DOI_paper_citante` varchar(255) DEFAULT NULL,
  `DOI_paper_citato` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_citazione`),
  KEY `DOI_paper_citante` (`DOI_paper_citante`),
  KEY `DOI_paper_citato` (`DOI_paper_citato`),
  CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`DOI_paper_citante`) REFERENCES `Paper` (`DOI`),
  CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`DOI_paper_citato`) REFERENCES `Paper` (`DOI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table Paper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Paper`;

CREATE TABLE `Paper` (
  `DOI` varchar(255) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `abstract` text DEFAULT NULL,
  `bibtex` text DEFAULT NULL,
  `orcid_autore_principale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DOI`),
  KEY `orcid_autore_principale` (`orcid_autore_principale`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`orcid_autore_principale`) REFERENCES `Studenti` (`ORCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table Studenti
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Studenti`;

CREATE TABLE `Studenti` (
  `ORCID` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `universita` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `Studenti` WRITE;
/*!40000 ALTER TABLE `Studenti` DISABLE KEYS */;

INSERT INTO `Studenti` (`ORCID`, `nome`, `cognome`, `universita`)
VALUES
	('0009-0004-4055-3942','Giovanni','Patanè','UNICT');

/*!40000 ALTER TABLE `Studenti` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
