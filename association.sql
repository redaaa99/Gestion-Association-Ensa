-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 31 Mai 2017 à 20:12
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE IF NOT EXISTS `campagne` (
  `NumCampagne` smallint(6) NOT NULL,
  `AnneeCampagne` smallint(6) DEFAULT NULL,
  `DateDeb` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  PRIMARY KEY (`NumCampagne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `cotisations`
--

CREATE TABLE IF NOT EXISTS `cotisations` (
  `NumCotisation` smallint(6) NOT NULL,
  `MontantAnn` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`NumCotisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cotisations`
--

INSERT INTO `cotisations` (`NumCotisation`, `MontantAnn`) VALUES
(1, 800),
(2, 1000),
(3, 1200),
(4, 1500);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE IF NOT EXISTS `departement` (
  `NumDepartement` smallint(6) NOT NULL AUTO_INCREMENT,
  `NomDepartement` varchar(30) DEFAULT NULL,
  `NumFac` smallint(11) unsigned NOT NULL,
  PRIMARY KEY (`NumDepartement`),
  KEY `NumFac` (`NumFac`),
  KEY `NumFac_2` (`NumFac`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`NumDepartement`, `NomDepartement`, `NumFac`) VALUES
(1, 'Informatique', 1),
(2, 'Electrique', 1),
(3, 'Lettres', 1),
(4, 'Informatique', 2),
(5, 'Economie', 2),
(6, 'Chimie', 3),
(7, 'Electronique', 3),
(8, 'Economie', 4),
(9, 'Informatique', 4),
(10, 'Industriel', 4),
(11, 'Nucleaire', 3);

-- --------------------------------------------------------

--
-- Structure de la table `diplome`
--

CREATE TABLE IF NOT EXISTS `diplome` (
  `NumDiplome` smallint(6) NOT NULL AUTO_INCREMENT,
  `Type` varchar(30) DEFAULT NULL,
  `NumCotisation` smallint(6) NOT NULL,
  `NumDepartement` smallint(6) NOT NULL,
  PRIMARY KEY (`NumDiplome`),
  KEY `NumDepartement` (`NumDepartement`),
  KEY `NumDepartement_2` (`NumDepartement`),
  KEY `NumCotisation` (`NumCotisation`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `diplome`
--

INSERT INTO `diplome` (`NumDiplome`, `Type`, `NumCotisation`, `NumDepartement`) VALUES
(1, 'Ingenieur en informatique', 3, 1),
(2, 'MBA', 2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `faculte`
--

CREATE TABLE IF NOT EXISTS `faculte` (
  `NumFac` smallint(11) unsigned NOT NULL AUTO_INCREMENT,
  `NomFac` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NumFac`),
  KEY `NumFac` (`NumFac`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `faculte`
--

INSERT INTO `faculte` (`NumFac`, `NomFac`) VALUES
(1, 'Harvard'),
(2, 'Oxford'),
(3, 'Cadi Ayad'),
(4, 'Hassan 2');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE IF NOT EXISTS `membre` (
  `NumMembre` smallint(6) NOT NULL,
  `NomMembre` varchar(30) DEFAULT NULL,
  `PrenomMembre` varchar(30) DEFAULT NULL,
  `TelMembre` varchar(30) DEFAULT NULL,
  `DateNaiss` date DEFAULT NULL,
  `Adresse` varchar(40) DEFAULT NULL,
  `membreCA` bit(1) DEFAULT NULL,
  PRIMARY KEY (`NumMembre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `membre`
--

INSERT INTO `membre` (`NumMembre`, `NomMembre`, `PrenomMembre`, `TelMembre`, `DateNaiss`, `Adresse`, `membreCA`) VALUES
(1, 'Reda', 'Meskali', '0696110512', '1996-06-26', 'Rue antaki', b'1'),
(2, 'Taleb', 'Brahim', '065555555', '1996-06-26', 'test', b'0');

-- --------------------------------------------------------

--
-- Structure de la table `obtention`
--

CREATE TABLE IF NOT EXISTS `obtention` (
  `NumObtention` smallint(6) NOT NULL AUTO_INCREMENT,
  `NumMembre` smallint(6) NOT NULL,
  `NumDiplome` int(11) NOT NULL,
  `AnneeObtention` year(4) DEFAULT NULL,
  PRIMARY KEY (`NumObtention`),
  UNIQUE KEY `NumObtention` (`NumObtention`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `obtention`
--

INSERT INTO `obtention` (`NumObtention`, `NumMembre`, `NumDiplome`, `AnneeObtention`) VALUES
(1, 2, 1, 1996),
(2, 1, 2, 1998);

-- --------------------------------------------------------

--
-- Structure de la table `organisme`
--

CREATE TABLE IF NOT EXISTS `organisme` (
  `NumOrganisme` smallint(6) NOT NULL AUTO_INCREMENT,
  `NomOrganisme` varchar(30) DEFAULT NULL,
  `idTel` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumOrganisme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sollicitation`
--

CREATE TABLE IF NOT EXISTS `sollicitation` (
  `NumSollicitation` smallint(6) NOT NULL AUTO_INCREMENT,
  `NumCampagne` smallint(6) NOT NULL,
  `DateSollicit` date DEFAULT NULL,
  `NumFicheSollicit` smallint(6) DEFAULT NULL,
  `Membre` bit(1) DEFAULT NULL,
  `NumMembreSolliciteur` smallint(6) DEFAULT NULL,
  `NumMembreSollicitee` smallint(6) NOT NULL,
  `NumOrganisme` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumSollicitation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `versement`
--

CREATE TABLE IF NOT EXISTS `versement` (
  `NumVersement` smallint(6) NOT NULL,
  `DateVersement` date DEFAULT NULL,
  `MontantVersement` smallint(6) DEFAULT NULL,
  `Cotisation` bit(1) DEFAULT NULL,
  `AnneeVersement` year(4) DEFAULT NULL,
  `NumMembre` smallint(6) DEFAULT NULL,
  `NumCampagne` int(11) DEFAULT NULL,
  PRIMARY KEY (`NumVersement`),
  KEY `NumMembre` (`NumMembre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `versement`
--

INSERT INTO `versement` (`NumVersement`, `DateVersement`, `MontantVersement`, `Cotisation`, `AnneeVersement`, `NumMembre`, `NumCampagne`) VALUES
(1, '2017-05-22', 5000, b'0', 2017, 1, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`NumFac`) REFERENCES `faculte` (`NumFac`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `diplome`
--
ALTER TABLE `diplome`
  ADD CONSTRAINT `diplome_ibfk_1` FOREIGN KEY (`NumCotisation`) REFERENCES `cotisations` (`NumCotisation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dep_diplo` FOREIGN KEY (`NumDepartement`) REFERENCES `departement` (`NumDepartement`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `versement`
--
ALTER TABLE `versement`
  ADD CONSTRAINT `fk_verse_memb` FOREIGN KEY (`NumMembre`) REFERENCES `membre` (`NumMembre`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
