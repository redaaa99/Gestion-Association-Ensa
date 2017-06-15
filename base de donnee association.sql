-- phpMyAdmin SQL Dump 
-- version 4.1.14 
-- http://www.phpmyadmin.net 
-- 
-- Client :  127.0.0.1 
-- Généré le :  Jeu 15 Juin 2017 à 14:59 
-- Version du serveur :  5.6.17 
-- Version de PHP :  5.5.12 
SET sql_mode = "NO_AUTO_VALUE_ON_ZERO"; 

SET time_zone = "+00:00"; 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */; 
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */; 
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */; 
/*!40101 SET NAMES utf8 */; 
-- 
-- Base de données :  `association` 
-- 
-- -------------------------------------------------------- 
-- 
-- Structure de la table `campagne` 
-- 
CREATE TABLE IF NOT EXISTS `campagne` 
  ( 
     `numcampagne`   SMALLINT(6) NOT NULL, 
     `anneecampagne` SMALLINT(6) DEFAULT NULL, 
     `datedeb`       DATE DEFAULT NULL, 
     `datefin`       DATE DEFAULT NULL, 
     PRIMARY KEY (`numcampagne`) 
  ) 
engine=innodb 
DEFAULT charset=utf8; 

-- 
-- Contenu de la table `campagne` 
-- 
INSERT INTO `campagne` 
            (`numcampagne`, 
             `anneecampagne`, 
             `datedeb`, 
             `datefin`) 
VALUES      (1, 
             2017, 
             '2017-06-04', 
             '2017-09-23'), 
            (2, 
             2016, 
             '2016-09-06', 
             '2016-11-24'); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `cotisations` 
-- 
CREATE TABLE IF NOT EXISTS `cotisations` 
  ( 
     `numcotisation` SMALLINT(6) NOT NULL, 
     `montantann`    SMALLINT(6) DEFAULT NULL, 
     PRIMARY KEY (`numcotisation`) 
  ) 
engine=innodb 
DEFAULT charset=utf8; 

-- 
-- Contenu de la table `cotisations` 
-- 
INSERT INTO `cotisations` 
            (`numcotisation`, 
             `montantann`) 
VALUES      (1, 
             800), 
            (2, 
             1000), 
            (3, 
             1200), 
            (4, 
             1500); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `departement` 
-- 
CREATE TABLE IF NOT EXISTS `departement` 
  ( 
     `numdepartement` SMALLINT(6) NOT NULL auto_increment, 
     `nomdepartement` VARCHAR(30) DEFAULT NULL, 
     `numfac`         SMALLINT(11) UNSIGNED NOT NULL, 
     PRIMARY KEY (`numdepartement`), 
     KEY `numfac` (`numfac`), 
     KEY `numfac_2` (`numfac`) 
  ) 
engine=innodb 
DEFAULT charset=utf8 
auto_increment=15; 

-- 
-- Contenu de la table `departement` 
-- 
INSERT INTO `departement` 
            (`numdepartement`, 
             `nomdepartement`, 
             `numfac`) 
VALUES      (1, 
             'Informatique', 
             1), 
            (2, 
             'Electrique', 
             1), 
            (3, 
             'Lettres', 
             1), 
            (4, 
             'Informatique', 
             2), 
            (5, 
             'Economie', 
             2), 
            (6, 
             'Chimie', 
             3), 
            (7, 
             'Electronique', 
             3), 
            (8, 
             'Economie', 
             4), 
            (9, 
             'Informatique', 
             4), 
            (10, 
             'Industriel', 
             4), 
            (11, 
             'Nucleaire', 
             3), 
            (12, 
             'Chimie', 
             25), 
            (13, 
             'Medecine', 
             26), 
            (14, 
             'Economie', 
             27); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `diplome` 
-- 
CREATE TABLE IF NOT EXISTS `diplome` 
  ( 
     `numdiplome`     SMALLINT(6) NOT NULL auto_increment, 
     `type`           VARCHAR(30) DEFAULT NULL, 
     `numcotisation`  SMALLINT(6) NOT NULL, 
     `numdepartement` SMALLINT(6) NOT NULL, 
     PRIMARY KEY (`numdiplome`), 
     KEY `numdepartement` (`numdepartement`), 
     KEY `numdepartement_2` (`numdepartement`), 
     KEY `numcotisation` (`numcotisation`) 
  ) 
engine=innodb 
DEFAULT charset=utf8 
auto_increment=8; 

-- 
-- Contenu de la table `diplome` 
-- 
INSERT INTO `diplome` 
            (`numdiplome`, 
             `type`, 
             `numcotisation`, 
             `numdepartement`) 
VALUES      (1, 
             'Ingenieur en informatique', 
             3, 
             1), 
            (2, 
             'MBA', 
             2, 
             5), 
            (3, 
             'Liscence', 
             1, 
             6), 
            (4, 
             'Ph.d', 
             4, 
             11), 
            (5, 
             'BTS', 
             1, 
             12), 
            (6, 
             'Medecin', 
             3, 
             13), 
            (7, 
             'MBA', 
             2, 
             14); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `faculte` 
-- 
CREATE TABLE IF NOT EXISTS `faculte` 
  ( 
     `numfac` SMALLINT(11) UNSIGNED NOT NULL auto_increment, 
     `nomfac` VARCHAR(30) DEFAULT NULL, 
     PRIMARY KEY (`numfac`), 
     KEY `numfac` (`numfac`) 
  ) 
engine=innodb 
DEFAULT charset=utf8 
auto_increment=28; 

-- 
-- Contenu de la table `faculte` 
-- 
INSERT INTO `faculte` 
            (`numfac`, 
             `nomfac`) 
VALUES      (1, 
             'Harvard'), 
            (2, 
             'Oxford'), 
            (3, 
             'Cadi Ayad'), 
            (4, 
             'Hassan 2'), 
            (10, 
             'MIT'), 
            (11, 
             'MIIT'), 
            (12, 
             'MIIT'), 
            (13, 
             'MIIT'), 
            (14, 
             'MIIT'), 
            (15, 
             'MIIT'), 
            (16, 
             'MIT'), 
            (17, 
             'MIIT'), 
            (18, 
             'MIIT'), 
            (19, 
             'MMIIT'), 
            (20, 
             'MIT'), 
            (21, 
             'MIIE'), 
            (22, 
             'MIIT'), 
            (23, 
             'MIR'), 
            (24, 
             'MIIE'), 
            (25, 
             'MIT'), 
            (26, 
             'Medical School'), 
            (27, 
             'FJES'); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `membre` 
-- 
CREATE TABLE IF NOT EXISTS `membre` 
  ( 
     `nummembre`    SMALLINT(6) NOT NULL auto_increment, 
     `nommembre`    VARCHAR(30) DEFAULT NULL, 
     `prenommembre` VARCHAR(30) DEFAULT NULL, 
     `telmembre`    VARCHAR(30) DEFAULT NULL, 
     `datenaiss`    DATE DEFAULT NULL, 
     `adresse`      VARCHAR(40) DEFAULT NULL, 
     `membreca`     TINYINT(1) NOT NULL, 
     `membreex`     TINYINT(1) NOT NULL, 
     PRIMARY KEY (`nummembre`), 
     UNIQUE KEY `nummembre` (`nummembre`) 
  ) 
engine=innodb 
DEFAULT charset=utf8 
auto_increment=10; 

-- 
-- Contenu de la table `membre` 
-- 
INSERT INTO `membre` 
            (`nummembre`, 
             `nommembre`, 
             `prenommembre`, 
             `telmembre`, 
             `datenaiss`, 
             `adresse`, 
             `membreca`, 
             `membreex`) 
VALUES      (1, 
             'Reda', 
             'Meskali', 
             '0696110512', 
             '1996-06-26', 
             'Rue antaki', 
             1, 
             0), 
            (2, 
             'Gates', 
             'Bill', 
             '065555555', 
             '1996-06-26', 
             'Brooklyn', 
             0, 
             1), 
            (3, 
             'Jobs', 
             'Steve', 
             '0696110514', 
             '2017-06-24', 
             'Sillicon Valley', 
             1, 
             1), 
            (4, 
             'Steve', 
             'Balmers', 
             '068080955', 
             '1998-08-07', 
             'haha', 
             1, 
             0), 
            (9, 
             'Brad', 
             'Pitt', 
             '0685749678', 
             '1987-04-12', 
             'Hollywood', 
             1, 
             1); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `obtention` 
-- 
CREATE TABLE IF NOT EXISTS `obtention` 
  ( 
     `numobtention`   SMALLINT(6) NOT NULL auto_increment, 
     `nummembre`      SMALLINT(6) NOT NULL, 
     `numdiplome`     INT(11) NOT NULL, 
     `anneeobtention` YEAR(4) DEFAULT NULL, 
     PRIMARY KEY (`numobtention`), 
     UNIQUE KEY `numobtention` (`numobtention`), 
     KEY `nummembre` (`nummembre`), 
     KEY `numdiplome` (`numdiplome`) 
  ) 
engine=innodb 
DEFAULT charset=utf8 
auto_increment=8; 

-- 
-- Contenu de la table `obtention` 
-- 
INSERT INTO `obtention` 
            (`numobtention`, 
             `nummembre`, 
             `numdiplome`, 
             `anneeobtention`) 
VALUES      (1, 
             2, 
             1, 
             1996), 
            (2, 
             1, 
             2, 
             1998), 
            (3, 
             1, 
             3, 
             1998), 
            (4, 
             3, 
             4, 
             1998), 
            (5, 
             4, 
             5, 
             1998), 
            (6, 
             9, 
             6, 
             1987), 
            (7, 
             9, 
             7, 
             1988); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `organisme` 
-- 
CREATE TABLE IF NOT EXISTS `organisme` 
  ( 
     `numorganisme` SMALLINT(6) NOT NULL auto_increment, 
     `nomorganisme` VARCHAR(30) DEFAULT NULL, 
     PRIMARY KEY (`numorganisme`), 
     KEY `numorganisme` (`numorganisme`) 
  ) 
engine=innodb 
DEFAULT charset=utf8 
auto_increment=3; 

-- 
-- Contenu de la table `organisme` 
-- 
INSERT INTO `organisme` 
            (`numorganisme`, 
             `nomorganisme`) 
VALUES      (1, 
             'Diamant Vert'), 
            (2, 
             'Microsoft'); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `sollicitation` 
-- 
CREATE TABLE IF NOT EXISTS `sollicitation` 
  ( 
     `numsollicitation`     SMALLINT(6) NOT NULL auto_increment, 
     `numcampagne`          SMALLINT(6) NOT NULL, 
     `datesollicit`         DATE DEFAULT NULL, 
     `numfichesollicit`     SMALLINT(6) DEFAULT NULL, 
     `membre`               BIT(1) DEFAULT NULL, 
     `nummembresolliciteur` SMALLINT(6) DEFAULT NULL, 
     `nummembresollicitee`  SMALLINT(6) DEFAULT NULL, 
     `numorganisme`         SMALLINT(6) DEFAULT NULL, 
     PRIMARY KEY (`numsollicitation`), 
     KEY `numcampagne` (`numcampagne`), 
     KEY `nummembresolliciteur` (`nummembresolliciteur`), 
     KEY `nummembresollicitee` (`nummembresollicitee`), 
     KEY `numorganisme` (`numorganisme`), 
     KEY `numorganisme_2` (`numorganisme`), 
     KEY `numorganisme_3` (`numorganisme`) 
  ) 
engine=innodb 
DEFAULT charset=utf8 
auto_increment=5; 

-- 
-- Contenu de la table `sollicitation` 
-- 
INSERT INTO `sollicitation` 
            (`numsollicitation`, 
             `numcampagne`, 
             `datesollicit`, 
             `numfichesollicit`, 
             `membre`, 
             `nummembresolliciteur`, 
             `nummembresollicitee`, 
             `numorganisme`) 
VALUES      (1, 
             1, 
             '2017-06-14', 
             1, 
             b'1', 
             1, 
             2, 
             NULL), 
            (2, 
             2, 
             '2016-11-16', 
             2, 
             b'1', 
             2, 
             1, 
             NULL), 
            (3, 
             2, 
             '2017-06-01', 
             1, 
             b'0', 
             1, 
             NULL, 
             1), 
            (4, 
             1, 
             '2017-06-22', 
             2, 
             b'0', 
             2, 
             NULL, 
             2); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `telephone` 
-- 
CREATE TABLE IF NOT EXISTS `telephone` 
  ( 
     `numtel`       VARCHAR(30) NOT NULL, 
     `numorganisme` SMALLINT(6) NOT NULL, 
     PRIMARY KEY (`numtel`), 
     KEY `numorganisme` (`numorganisme`) 
  ) 
engine=innodb 
DEFAULT charset=utf8; 

-- 
-- Contenu de la table `telephone` 
-- 
INSERT INTO `telephone` 
            (`numtel`, 
             `numorganisme`) 
VALUES      ('0524311726', 
             1), 
            ('0685857474', 
             1), 
            ('0624141239', 
             2); 

-- -------------------------------------------------------- 
-- 
-- Structure de la table `versement` 
-- 
CREATE TABLE IF NOT EXISTS `versement` 
  ( 
     `numversement`     SMALLINT(6) NOT NULL, 
     `dateversement`    DATE DEFAULT NULL, 
     `montantversement` SMALLINT(6) DEFAULT NULL, 
     `cotisation`       BIT(1) DEFAULT NULL, 
     `anneeversement`   YEAR(4) DEFAULT NULL, 
     `nummembre`        SMALLINT(6) DEFAULT NULL, 
     `numsollicitation` SMALLINT(6) NOT NULL, 
     PRIMARY KEY (`numversement`), 
     KEY `nummembre` (`nummembre`), 
     KEY `numsollicitation` (`numsollicitation`), 
     KEY `numsollicitation_2` (`numsollicitation`) 
  ) 
engine=innodb 
DEFAULT charset=utf8; 

-- 
-- Contenu de la table `versement` 
-- 
INSERT INTO `versement` 
            (`numversement`, 
             `dateversement`, 
             `montantversement`, 
             `cotisation`, 
             `anneeversement`, 
             `nummembre`, 
             `numsollicitation`) 
VALUES      (1, 
             '2017-05-22', 
             5000, 
             b'0', 
             2017, 
             1, 
             1), 
            (2, 
             '2017-05-20', 
             2500, 
             b'1', 
             2017, 
             2, 
             1), 
            (3, 
             '2016-10-03', 
             2200, 
             b'0', 
             2016, 
             1, 
             2), 
            (4, 
             '2017-06-16', 
             1112, 
             b'0', 
             2018, 
             2, 
             4); 

-- 
-- Contraintes pour les tables exportées 
-- 
-- 
-- Contraintes pour la table `departement` 
-- 
ALTER TABLE `departement` 
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`numfac`) REFERENCES 
  `faculte` (`numfac`) ON DELETE CASCADE ON UPDATE CASCADE; 

-- 
-- Contraintes pour la table `diplome` 
-- 
ALTER TABLE `diplome` 
  ADD CONSTRAINT `diplome_ibfk_1` FOREIGN KEY (`numcotisation`) REFERENCES 
  `cotisations` (`numcotisation`) ON DELETE CASCADE ON UPDATE CASCADE, 
  ADD CONSTRAINT `fk_dep_diplo` FOREIGN KEY (`numdepartement`) REFERENCES 
  `departement` (`numdepartement`) ON DELETE CASCADE ON UPDATE CASCADE; 

-- 
-- Contraintes pour la table `obtention` 
-- 
ALTER TABLE `obtention` 
  ADD CONSTRAINT `obtention_ibfk_1` FOREIGN KEY (`nummembre`) REFERENCES 
  `membre` (`nummembre`) ON DELETE CASCADE ON UPDATE CASCADE; 

-- 
-- Contraintes pour la table `sollicitation` 
-- 
ALTER TABLE `sollicitation` 
  ADD CONSTRAINT `sollicitation_ibfk_1` FOREIGN KEY (`numcampagne`) REFERENCES 
  `campagne` (`numcampagne`) ON DELETE CASCADE ON UPDATE CASCADE, 
  ADD CONSTRAINT `sollicitation_ibfk_4` FOREIGN KEY (`numorganisme`) REFERENCES 
  `organisme` (`numorganisme`) ON DELETE CASCADE ON UPDATE CASCADE, 
  ADD CONSTRAINT `sollicitation_ibfk_5` FOREIGN KEY (`nummembresolliciteur`) 
  REFERENCES `membre` (`nummembre`) ON DELETE CASCADE ON UPDATE CASCADE, 
  ADD CONSTRAINT `sollicitation_ibfk_6` FOREIGN KEY (`nummembresollicitee`) 
  REFERENCES `membre` (`nummembre`) ON DELETE CASCADE ON UPDATE CASCADE; 

-- 
-- Contraintes pour la table `telephone` 
-- 
ALTER TABLE `telephone` 
  ADD CONSTRAINT `telephone_ibfk_1` FOREIGN KEY (`numorganisme`) REFERENCES 
  `organisme` (`numorganisme`) ON DELETE CASCADE ON UPDATE CASCADE; 

-- 
-- Contraintes pour la table `versement` 
-- 
ALTER TABLE `versement` 
  ADD CONSTRAINT `versement_ibfk_1` FOREIGN KEY (`numsollicitation`) REFERENCES 
  `sollicitation` (`numsollicitation`) ON DELETE CASCADE ON UPDATE CASCADE, 
  ADD CONSTRAINT `versement_ibfk_2` FOREIGN KEY (`nummembre`) REFERENCES 
  `membre` (`nummembre`) ON DELETE CASCADE ON UPDATE CASCADE; 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */; 
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */; 
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */; 