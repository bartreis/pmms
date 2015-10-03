# SQL Manager 2005 for MySQL 3.6.5.1
# ---------------------------------------
# Host     : bart-VirtualBox
# Port     : 3306
# Database : pmms


SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `pmms`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

#
# Structure for the `artigo` table : 
#

CREATE TABLE `artigo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artigo_penal` varchar(50) DEFAULT NULL,
  `obs` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Structure for the `artigo_has_pessoa` table : 
#

CREATE TABLE `artigo_has_pessoa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artigo_id` int(10) unsigned NOT NULL,
  `pessoa_id` int(10) unsigned NOT NULL,
  `data_prisao` date DEFAULT NULL,
  `obs` text,
  PRIMARY KEY (`id`,`artigo_id`,`pessoa_id`),
  KEY `artigo_has_pessoa_FKIndex1` (`artigo_id`),
  KEY `artigo_has_pessoa_FKIndex2` (`pessoa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for the `ci_sessions` table : 
#

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Structure for the `cor_pele` table : 
#

CREATE TABLE `cor_pele` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_cor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for the `foto` table : 
#

CREATE TABLE `foto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_foto_id` int(10) unsigned NOT NULL,
  `pessoa_id` int(10) unsigned NOT NULL,
  `descricao` text,
  `foto` text,
  `priority` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foto_FKIndex1` (`pessoa_id`),
  KEY `foto_FKIndex2` (`tipo_foto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for the `login_attempts` table : 
#

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Structure for the `pessoa` table : 
#

CREATE TABLE `pessoa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `foto_frente` text,
  `foto_lado_esquerdo` text,
  `foto_lado_direito` text,
  `foto_costas` text,
  `data_nasc` date DEFAULT NULL,
  `cor_pele_id` int(10) unsigned NOT NULL,
  `nome_mae` varchar(255) DEFAULT NULL,
  `nome_pai` varchar(255) DEFAULT NULL,
  `naturalidade` varchar(255) DEFAULT NULL,
  `nacionalidade` varchar(255) DEFAULT NULL,
  `tatuagens` text,
  `telefone_1` varchar(20) DEFAULT NULL,
  `telefone_2` varchar(20) DEFAULT NULL,
  `obs` text,
  `cadastrado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pessoa_FKIndex1` (`cor_pele_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for the `tipo_foto` table : 
#

CREATE TABLE `tipo_foto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_foto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for the `user_autologin` table : 
#

CREATE TABLE `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Structure for the `user_profiles` table : 
#

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Structure for the `users` table : 
#

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#
# Data for the `artigo` table  (LIMIT 0,500)
#

INSERT INTO `artigo` (`id`, `artigo_penal`, `obs`) VALUES 
  (1,'171 - Estelionato',NULL),
  (2,'155 - Furto',NULL),
  (3,'157 - Assalto',NULL),
  (4,'180 - Receptação',NULL);

COMMIT;

#
# Data for the `artigo_has_pessoa` table  (LIMIT 0,500)
#

INSERT INTO `artigo_has_pessoa` (`id`, `artigo_id`, `pessoa_id`, `data_prisao`, `obs`) VALUES 
  (1,2,1,NULL,NULL),
  (2,3,1,NULL,NULL),
  (3,1,1,NULL,NULL),
  (4,3,2,NULL,NULL),
  (5,1,2,NULL,NULL);

COMMIT;

#
# Data for the `ci_sessions` table  (LIMIT 0,500)
#

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES 
  ('1874c95bc353f083b6deab3c5cb77622','10.1.1.10','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36',1443896440,'a:4:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:1:\"1\";s:8:\"username\";s:6:\"albert\";s:6:\"status\";s:1:\"1\";}'),
  ('35089f17585e67c71dd6b25af9b0620a','10.1.1.10','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36',1443895790,'a:4:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:1:\"1\";s:8:\"username\";s:6:\"albert\";s:6:\"status\";s:1:\"1\";}'),
  ('36cf2c3f24c0968e87cddc8b975d0130','10.1.1.10','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36',1443895736,'a:4:{s:9:\"user_data\";s:0:\"\";s:7:\"user_id\";s:1:\"1\";s:8:\"username\";s:6:\"albert\";s:6:\"status\";s:1:\"0\";}');

COMMIT;

#
# Data for the `cor_pele` table  (LIMIT 0,500)
#

INSERT INTO `cor_pele` (`id`, `nome_cor`) VALUES 
  (1,'Negro'),
  (2,'Branca');

COMMIT;

#
# Data for the `foto` table  (LIMIT 0,500)
#

INSERT INTO `foto` (`id`, `tipo_foto_id`, `pessoa_id`, `descricao`, `foto`, `priority`) VALUES 
  (1,0,1,NULL,'1da7c-g.jpg',NULL),
  (2,0,1,NULL,'4b2d4-102e9401b5ced98db6d92b9453dc240b.jpg',NULL),
  (3,0,1,NULL,'2609c-12032164_560393797443022_61316612278184914_n.jpg',NULL),
  (4,0,2,NULL,'89ef4-fidel.jpg',NULL),
  (5,0,2,NULL,'06b5b-lula.jpg',NULL);

COMMIT;

#
# Data for the `pessoa` table  (LIMIT 0,500)
#

INSERT INTO `pessoa` (`id`, `nome`, `foto_frente`, `foto_lado_esquerdo`, `foto_lado_direito`, `foto_costas`, `data_nasc`, `cor_pele_id`, `nome_mae`, `nome_pai`, `naturalidade`, `nacionalidade`, `tatuagens`, `telefone_1`, `telefone_2`, `obs`, `cadastrado_em`) VALUES 
  (1,'Dilma Vana Rousseff Linhares','0be22-imagemcafpjryc.jpg',NULL,NULL,NULL,'1970-10-01',1,'Lula da Silva','Fidel Castro','Havana','Cubana','Simbolo comunista no \"RABO\"',NULL,NULL,'<p>\n\tCuidado ela &eacute; perigosa</p>\n',NULL),
  (2,'Luis Inácio Lula da Silva','d4e7b-lula-1-.png',NULL,NULL,NULL,'2045-10-27',1,'Puta','presidiario','Havana','Cubano','Che Guevara no ânus',NULL,NULL,NULL,NULL);

COMMIT;

#
# Data for the `users` table  (LIMIT 0,500)
#

INSERT INTO `users` (`id`, `username`, `password`, `email`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`) VALUES 
  (1,'albert','$2a$08$gGVPTOQrCOfVATlS8CQ8VeSwf0o./RCZyfslIbGqPVb3lqlZl3Y0G','bartreis@hotmail.com',1,0,NULL,NULL,NULL,NULL,'df97ee962e0ef79299e45a42736cb45f','10.1.1.10','2015-10-03 15:11:05','2015-10-03 15:01:41','2015-10-03 15:11:05');

COMMIT;

