-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 26 juil. 2021 à 08:12
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `task1`
--

-- --------------------------------------------------------

--
-- Structure de la table `cat`
--

DROP TABLE IF EXISTS `cat`;
CREATE TABLE IF NOT EXISTS `cat` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `name_cat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cat`
--

INSERT INTO `cat` (`id_cat`, `name_cat`) VALUES
(1, 'ménage'),
(2, 'courses'),
(3, 'devoirs'),
(4, 'rendez-vous'),
(5, 'loisirs'),
(6, 'divers');

-- --------------------------------------------------------

--
-- Structure de la table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE IF NOT EXISTS `task` (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `name_task` varchar(50) NOT NULL,
  `content_task` text NOT NULL,
  `date_task` date NOT NULL,
  `validate_task` tinyint(1) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_cat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_task`),
  KEY `task_user_FK` (`id_user`),
  KEY `task_cat0_FK` (`id_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name_user` varchar(50) NOT NULL,
  `first_name_user` varchar(50) NOT NULL,
  `login_user` varchar(50) NOT NULL,
  `mdp_user` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `first_name_user`, `login_user`, `mdp_user`) VALUES
(1, 'aa', 'aa', 'aa', '4124bc0a9335c27f086f24ba207a4912'),
(2, 'trez', 'trez', 'trez', '4760acd914e9e26ffe45445bede3db74'),
(12, 'cc', 'cc', 'cc', 'e0323a9039add2978bf5b49550572c7c'),
(13, 'pourtester', 'pourtesterpass', 'pour', 'f5d1278e8109edd94e1e4197e04873b9'),
(14, 'ee', 'ee', 'ee', '08a4415e9d594ff960030b921d42b91e'),
(19, 'gg', 'gg', 'gg', '73c18c59a39b18382081ec00bb456d43'),
(28, 'pp', 'pp', 'pp', 'c483f6ce851c9ecd9fb835ff7551737c'),
(29, 'pp', 'pp', 'pp', 'c483f6ce851c9ecd9fb835ff7551737c'),
(30, 'pp', 'pp', 'pp', 'c483f6ce851c9ecd9fb835ff7551737c'),
(31, 'll', 'kk', 'll', '5b54c0a045f179bcbbbc9abcb8b5cd4c');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_cat0_FK` FOREIGN KEY (`id_cat`) REFERENCES `cat` (`id_cat`),
  ADD CONSTRAINT `task_user_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
