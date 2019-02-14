/*
SQLyog Enterprise - MySQL GUI v8.18 
MySQL - 5.6.42-log : Database - characters2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `account_data` */

DROP TABLE IF EXISTS `account_data`;

CREATE TABLE `account_data` (
  `account` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `time` bigint(11) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  PRIMARY KEY (`account`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account_data` */

LOCK TABLES `account_data` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_instances_entered` */

DROP TABLE IF EXISTS `account_instances_entered`;

CREATE TABLE `account_instances_entered` (
  `AccountId` int(11) unsigned NOT NULL COMMENT 'Player account',
  `ExpireTime` bigint(40) NOT NULL COMMENT 'Time when instance was entered',
  `InstanceId` int(11) unsigned NOT NULL COMMENT 'ID of instance entered',
  PRIMARY KEY (`AccountId`,`InstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Instance reset limit system';

/*Data for the table `account_instances_entered` */

LOCK TABLES `account_instances_entered` WRITE;

UNLOCK TABLES;

/*Table structure for table `ahbot_category` */

DROP TABLE IF EXISTS `ahbot_category`;

CREATE TABLE `ahbot_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) DEFAULT NULL,
  `multiplier` decimal(20,2) NOT NULL,
  `max_auction_count` bigint(20) NOT NULL,
  `expire_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helper` (`category`,`multiplier`,`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ahbot_category` */

LOCK TABLES `ahbot_category` WRITE;

UNLOCK TABLES;

/*Table structure for table `ahbot_history` */

DROP TABLE IF EXISTS `ahbot_history`;

CREATE TABLE `ahbot_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buytime` bigint(20) NOT NULL,
  `item` bigint(20) NOT NULL,
  `bid` bigint(20) NOT NULL,
  `buyout` bigint(20) NOT NULL,
  `won` bigint(20) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `auction_house` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `won` (`won`),
  KEY `category` (`category`),
  KEY `auction_house` (`auction_house`),
  KEY `idx_ahbot_history_item` (`item`),
  KEY `idx_ahbot_history_won` (`won`),
  KEY `idx_ahbot_history_auction_house` (`auction_house`),
  KEY `idx_ahbot_history_category` (`category`),
  KEY `idx_ahbot_history_buytime` (`buytime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ahbot_history` */

LOCK TABLES `ahbot_history` WRITE;

UNLOCK TABLES;

/*Table structure for table `ahbot_price` */

DROP TABLE IF EXISTS `ahbot_price`;

CREATE TABLE `ahbot_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item` varchar(45) DEFAULT NULL,
  `price` decimal(20,2) NOT NULL,
  `auction_house` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ahbot_price_item` (`item`),
  KEY `idx_ahbot_price_item` (`item`),
  KEY `idx_ahbot_price_auction_house` (`auction_house`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ahbot_price` */

LOCK TABLES `ahbot_price` WRITE;

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_custom_strategy` */

DROP TABLE IF EXISTS `ai_playerbot_custom_strategy`;

CREATE TABLE `ai_playerbot_custom_strategy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `idx` bigint(20) DEFAULT NULL,
  `owner` bigint(20) DEFAULT NULL,
  `action_line` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ai_playerbot_custom_strategy` */

LOCK TABLES `ai_playerbot_custom_strategy` WRITE;

insert  into `ai_playerbot_custom_strategy`(`id`,`name`,`idx`,`owner`,`action_line`) values (1,'say',1,0,'critical health>emote::helpme!99,say::critical health!98'),(2,'say',2,0,'low health>emote::healme!99,say::low health!98'),(3,'say',3,0,'low mana>emote::oom!99,say::low mana!98'),(4,'say',4,0,'tank aoe>charge!99,say::taunt!98'),(5,'say',5,0,'medium aoe>say::aoe!99'),(6,'say',6,0,'can loot>say::loot!99');

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_db_store` */

DROP TABLE IF EXISTS `ai_playerbot_db_store`;

CREATE TABLE `ai_playerbot_db_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` bigint(20) NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ai_playerbot_db_store` */

LOCK TABLES `ai_playerbot_db_store` WRITE;

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_enchants` */

DROP TABLE IF EXISTS `ai_playerbot_enchants`;

CREATE TABLE `ai_playerbot_enchants` (
  `class` tinyint(2) NOT NULL,
  `spec` tinyint(2) NOT NULL,
  `spellid` bigint(6) NOT NULL,
  `slotid` tinyint(2) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL COMMENT 'name of the enchant',
  PRIMARY KEY (`class`,`spec`,`spellid`,`slotid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ai_playerbot_enchants` */

LOCK TABLES `ai_playerbot_enchants` WRITE;

insert  into `ai_playerbot_enchants`(`class`,`spec`,`spellid`,`slotid`,`name`) values (1,10,20034,15,'Crusader            '),(1,10,22779,17,'30 Hit            '),(1,10,27927,10,'4 All Stats            '),(1,10,27927,11,'4 All Stats             '),(1,10,27960,4,'6 All Stats  '),(1,10,27984,16,'Mongoose            '),(1,10,29483,2,'26 Attackpower 14 Crit            '),(1,10,33996,9,'26 Attackpower            '),(1,10,34002,8,'24 Attackpower               '),(1,10,34004,14,'12 Agility          '),(1,10,34007,7,'Minor Speed 6 Agility'),(1,10,35452,0,'34 Attackpower 16 Hit            '),(1,10,35490,6,'50 Attackpower 12 Crit            '),(1,11,20034,15,'Crusader            '),(1,11,20034,16,'Crusader            '),(1,11,22779,17,'30 Hit            '),(1,11,27927,10,'4 All Stats            '),(1,11,27927,11,'4 All Stats            '),(1,11,27960,4,'6 All Stats  '),(1,11,29483,2,'26 Attackpower 14 Crit            '),(1,11,33996,9,'26 Attackpower            '),(1,11,34002,8,'24 Attackpower               '),(1,11,34004,14,'12 Agility          '),(1,11,34007,7,'Minor Speed 6 Agility'),(1,11,35452,0,'34 Attackpower 16 Hit            '),(1,11,35490,6,'50 Attackpower 12 Crit            '),(1,12,22779,17,'30 Hit            '),(1,12,25072,9,'2% Threat            '),(1,12,27906,8,'12 Defense               '),(1,12,27927,10,'4 All Stats            '),(1,12,27927,11,'4 All Stats            '),(1,12,27954,7,'5% Root/Snare Resist 10 Hit'),(1,12,27960,4,'6 All Stats  '),(1,12,28004,15,'Battlemaster            '),(1,12,34009,16,'18 Stamina            '),(1,12,35433,2,'10 Dodge 15 Defense            '),(1,12,35443,0,'16 Defense 17 Dodge            '),(1,12,35495,6,'40 Stamina 12 Agility            '),(1,12,47051,14,'12 Defense          '),(2,20,22779,17,'30 Hit            '),(2,20,27926,10,'20 Healing 7 Spelldamage           '),(2,20,27926,11,'20 Healing 7 Spelldamage            '),(2,20,27945,16,'12 Intellect            '),(2,20,27954,7,'5% Root/Snare Resist 10 Hit'),(2,20,27960,4,'6 All Stats  '),(2,20,29475,2,'31 Healing 11 Spelldamage 5 mp5            '),(2,20,31370,6,'66 Healing 22 Spelldamage 20 Stamina            '),(2,20,33999,9,'35 Healing 12 Spelldamage            '),(2,20,34001,8,'12 Intellect               '),(2,20,34003,14,'20 Spell Penetration          '),(2,20,34010,15,'81 Healing 27 Spelldamage            '),(2,20,35445,0,'35 Healing 12 Spelldamage 7 mp5            '),(2,21,22779,17,'30 Hit            '),(2,21,25072,9,'2% Threat            '),(2,21,27906,8,'12 Defense               '),(2,21,27927,10,'4 All Stats            '),(2,21,27927,11,'4 All Stats            '),(2,21,27954,7,'5% Root/Snare Resist 10 Hit'),(2,21,27960,4,'6 All Stats  '),(2,21,28004,15,'Battlemaster            '),(2,21,34009,16,'18 Stamina            '),(2,21,35433,2,'10 Dodge 15 Defense            '),(2,21,35443,0,'16 Defense 17 Dodge            '),(2,21,35495,6,'40 Stamina 12 Agility            '),(2,21,47051,14,'12 Defense          '),(2,22,20034,15,'Crusader            '),(2,22,22779,17,'30 Hit            '),(2,22,27899,8,'12 Strength               '),(2,22,27927,10,'4 All Stats            '),(2,22,27927,11,'4 All Stats            '),(2,22,27960,4,'6 All Stats  '),(2,22,29483,2,'26 Attackpower 14 Crit            '),(2,22,33995,6,'50 Attackpower 12 Crit            '),(2,22,33996,9,'15 Strength            '),(2,22,34004,14,'12 Agility          '),(2,22,34007,7,'Minor Speed 6 Agility'),(2,22,37891,0,'17 Strength16 Intellect            '),(3,30,22779,17,'30 Hit            '),(3,30,25080,9,'15 Agility            '),(3,30,27927,10,'4 All Stats            '),(3,30,27927,11,'4 All Stats             '),(3,30,27951,7,'12 Agility'),(3,30,27960,4,'6 All Stats  '),(3,30,29483,2,'26 Attackpower 14 Crit            '),(3,30,34002,8,'24 Attackpower               '),(3,30,34004,14,'12 Agility          '),(3,30,35452,0,'34 Attackpower 16 Hit            '),(3,30,35495,6,'40 Stamina 12 Agility            '),(3,30,42620,15,'Greater Agility            '),(3,30,42620,16,'Greater Agility            '),(4,40,22779,17,'30 Hit            '),(4,40,25080,9,'15 Agility            '),(4,40,27927,10,'4 All Stats            '),(4,40,27927,11,'4 All Stats             '),(4,40,27951,7,'12 Agility'),(4,40,27960,4,'6 All Stats  '),(4,40,27984,15,'Mongoose            '),(4,40,27984,16,'Mongoose            '),(4,40,29483,2,'26 Attackpower 14 Crit            '),(4,40,34002,8,'24 Attackpower               '),(4,40,34004,14,'12 Agility          '),(4,40,35452,0,'34 Attackpower 16 Hit            '),(4,40,35495,6,'40 Stamina 12 Agility            '),(5,50,22779,17,'30 Hit   '),(5,50,27926,10,'20 Healing 7 Spelldamage            '),(5,50,27926,11,'20 Healing 7 Spelldamage            '),(5,50,27945,16,'12 Intellect            '),(5,50,27954,7,'5% Root/Snare Resist 10 Hit'),(5,50,27960,4,'6 All Stats  '),(5,50,29475,2,'31 Healing 11 Spelldamage 5 mp5            '),(5,50,31370,6,'66 Healing 22 Spelldamage 20 Stamina            '),(5,50,33999,9,'35 Healing 12 Spelldamage            '),(5,50,34001,8,'12 Intellect               '),(5,50,34003,14,'20 Spell Penetration          '),(5,50,34010,15,'81 Healing 27 Spelldamage            '),(5,50,35445,0,'35 Healing 12 Spelldamage 7 mp5            '),(7,70,22779,17,'30 Hit            '),(7,70,27926,10,'20 Healing 7 Spelldamage           '),(7,70,27926,11,'20 Healing 7 Spelldamage            '),(7,70,27945,16,'12 Intellect            '),(7,70,27954,7,'5% Root/Snare Resist 10 Hit'),(7,70,27960,4,'6 All Stats  '),(7,70,31370,6,'66 Healing 22 Spelldamage 20 Stamina            '),(7,70,33994,9,'15 Spell Hit            '),(7,70,34001,8,'12 Intellect               '),(7,70,34003,14,'20 Spell Penetration          '),(7,70,34010,15,'81 Healing 27 Spelldamage            '),(7,70,35406,2,'18 Spelldamage 10 Crit            '),(7,70,35447,0,'22 Spelldamage 14 Hit            '),(7,71,22779,17,'30 Hit            '),(7,71,25080,9,'15 Agility            '),(7,71,27927,10,'4 All Stats            '),(7,71,27927,11,'4 All Stats            '),(7,71,27951,7,'12 Agility'),(7,71,27960,4,'6 All Stats  '),(7,71,27977,15,'35 Agility            '),(7,71,27984,16,'Mongoose            '),(7,71,29483,2,'26 Attackpower 14 Crit            '),(7,71,34002,8,'24 Attackpower               '),(7,71,34004,14,'12 Agility          '),(7,71,35452,0,'34 Attackpower 16 Hit            '),(7,71,35495,6,'40 Stamina 12 Agility            '),(7,72,22779,17,'30 Hit            '),(7,72,27926,10,'20 Healing 7 Spelldamage           '),(7,72,27926,11,'20 Healing 7 Spelldamage            '),(7,72,27945,16,'12 Intellect            '),(7,72,27954,7,'5% Root/Snare Resist 10 Hit'),(7,72,27960,4,'6 All Stats  '),(7,72,29475,2,'31 Healing 11 Spelldamage 5 mp5            '),(7,72,31370,6,'66 Healing 22 Spelldamage 20 Stamina            '),(7,72,33999,9,'35 Healing 12 Spelldamage            '),(7,72,34001,8,'12 Intellect               '),(7,72,34003,14,'20 Spell Penetration          '),(7,72,34010,15,'81 Healing 27 Spelldamage            '),(7,72,35445,0,'35 Healing 12 Spelldamage 7 mp5            '),(8,80,22779,17,'30 Hit            '),(8,80,27927,10,'4 All Stats            '),(8,80,27927,11,'4 All Stats            '),(8,80,27945,16,'12 Intellect            '),(8,80,27954,7,'5% Root/Snare Resist 10 Hit'),(8,80,27960,4,'6 All Stats  '),(8,80,27975,15,'40 Spelldamage            '),(8,80,31372,6,'35 Spelldamage 20 Stamina            '),(8,80,33994,9,'15 Spell Hit            '),(8,80,34001,8,'12 Intellect               '),(8,80,34003,14,'20 Spell Penetration          '),(8,80,35406,2,'18 Spelldamage 10 Crit            '),(8,80,35447,0,'22 Spelldamage 14 Hit            '),(9,90,22779,17,'30 Hit            '),(9,90,27924,11,'12 Spelldamage            '),(9,90,27927,10,'4 All Stats            '),(9,90,27945,16,'12 Intellect            '),(9,90,27954,7,'5% Root/Snare Resist 10 Hit'),(9,90,27960,4,'6 All Stats  '),(9,90,27975,15,'40 Spelldamage            '),(9,90,31372,6,'35 Spelldamage 20 Stamina            '),(9,90,33994,9,'15 Spell Hit            '),(9,90,34001,8,'12 Intellect               '),(9,90,34003,14,'20 Spell Penetration          '),(9,90,35406,2,'18 Spelldamage 10 Crit            '),(9,90,35447,0,'22 Spelldamage 14 Hit            '),(11,110,22779,17,'30 Hit            '),(11,110,27926,10,'20 Healing 7 Spelldamage            '),(11,110,27926,11,'20 Healing 7 Spelldamage            '),(11,110,27945,16,'12 Intellect            '),(11,110,27954,7,'5% Root/Snare Resist 10 Hit'),(11,110,27960,4,'6 All Stats  '),(11,110,31370,6,'66 Healing 22 Spelldamage 20 Stamina            '),(11,110,33994,9,'15 Spell Hit            '),(11,110,34001,8,'12 Intellect               '),(11,110,34003,14,'20 Spell Penetration          '),(11,110,34010,15,'81 Healing 27 Spelldamage            '),(11,110,35406,2,'18 Spelldamage 10 Crit            '),(11,110,35447,0,'22 Spelldamage 14 Hit            '),(11,111,22779,17,'30 Hit            '),(11,111,25080,9,'15 Agility            '),(11,111,27927,10,'4 All Stats            '),(11,111,27927,11,'4 All Stats           '),(11,111,27951,7,'12 Agility'),(11,111,27960,4,'6 All Stats  '),(11,111,29483,2,'26 Attackpower 14 Crit            '),(11,111,34002,8,'24 Attackpower               '),(11,111,34004,14,'12 Agility          '),(11,111,35452,0,'34 Attackpower 16 Hit            '),(11,111,35495,6,'40 Stamina 12 Agility            '),(11,111,42620,15,'Greater Agility            '),(11,111,42620,16,'Greater Agility            '),(11,112,22779,17,'30 Hit            '),(11,112,27926,10,'20 Healing 7 Spelldamage            '),(11,112,27926,11,'20 Healing 7 Spelldamage            '),(11,112,27945,16,'12 Intellect            '),(11,112,27954,7,'5% Root/Snare Resist 10 Hit'),(11,112,27960,4,'6 All Stats  '),(11,112,29475,2,'31 Healing 11 Spelldamage 5 mp5            '),(11,112,31370,6,'66 Healing 22 Spelldamage 20 Stamina            '),(11,112,33999,9,'35 Healing 12 Spelldamage            '),(11,112,34001,8,'12 Intellect               '),(11,112,34003,14,'20 Spell Penetration          '),(11,112,34010,15,'81 Healing 27 Spelldamage            '),(11,112,35445,0,'35 Healing 12 Spelldamage 7 mp5            ');

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_equip_cache` */

DROP TABLE IF EXISTS `ai_playerbot_equip_cache`;

CREATE TABLE `ai_playerbot_equip_cache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clazz` mediumint(8) NOT NULL,
  `lvl` mediumint(8) NOT NULL,
  `slot` mediumint(8) NOT NULL,
  `quality` mediumint(8) NOT NULL,
  `item` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='PlayerbotAI equip Cache';

/*Data for the table `ai_playerbot_equip_cache` */

LOCK TABLES `ai_playerbot_equip_cache` WRITE;

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_guild_names` */

DROP TABLE IF EXISTS `ai_playerbot_guild_names`;

CREATE TABLE `ai_playerbot_guild_names` (
  `name_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  PRIMARY KEY (`name_id`),
  UNIQUE KEY `name_id` (`name_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=642 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='PlayerbotAI guild names';

/*Data for the table `ai_playerbot_guild_names` */

LOCK TABLES `ai_playerbot_guild_names` WRITE;

insert  into `ai_playerbot_guild_names`(`name_id`,`name`) values (1,'Black Guard'),(2,'Abyssal Kingdoms'),(3,'Acid Evil'),(4,'Addicts Muskateers'),(5,'Adventurers War'),(6,'Age of Red Water Clan'),(7,'Alivso Reason'),(8,'All Knights'),(9,'Allegiance of the Vile'),(10,'Alliance Clan'),(11,'Alliance of Defectives'),(12,'Alti Legions'),(13,'Anarchie Shi'),(14,'Anchors of the Nominal'),(15,'Ancients of Part Times'),(16,'Angelus Gods'),(17,'Angry Party'),(18,'Apocalyptic Lamont'),(19,'Architects of Green'),(20,'Army of Black Widows'),(21,'Army of Orgrimmar Minds'),(22,'Army of Three Horses'),(23,'Arrows of Midlight'),(24,'Artisans of Best Guild'),(25,'Assasins of the Pyrewood'),(26,'Assassins Bane'),(27,'Avatars of Warsong Stuff'),(28,'Axis of the Funky Night'),(29,'Azeroth Souls'),(30,'Azeroths Rabbits'),(31,'Bad Sentinels'),(32,'Banana Song'),(33,'Band of Tarantula Attack'),(34,'Band of the Dark Reveren'),(35,'Barcode Praised'),(36,'Basher Goats'),(37,'Basic Order'),(38,'Batman of Banished'),(39,'Betrayers of Lucky Child'),(40,'Blackwater Committee'),(41,'Blades of Lich Kings'),(42,'Blades of the Hive'),(43,'Blades of the Total'),(44,'Bleeding War'),(45,'Blessed Lair'),(46,'Blizzards of the Iron'),(47,'Blood Chaos'),(48,'Blood Intrigue'),(49,'Blood Samurai'),(50,'Bloodlust Good'),(51,'Bonds of Reported Ignore'),(52,'Booty Cry'),(53,'Border Knights'),(54,'Bossmans Targaryen'),(55,'Braveheart Heaven'),(56,'Brotherhood of Twilight'),(57,'Bruised Pain'),(58,'Burning Control'),(59,'Burning Oblivion'),(60,'Cabal of Kalimdor'),(61,'Cake Crusade'),(62,'Call of the Ironforge'),(63,'Carebears Thunder'),(64,'Carpe Heaven'),(65,'Carpe Regiment'),(66,'Children of Order'),(67,'Children of the Gods'),(68,'Circle of Amor E Bobby'),(69,'Clan of the Elven Toys'),(70,'Clan of the Strike Light'),(71,'Coalition of Super Best'),(72,'Collective Pimps'),(73,'Companions of the Gnome'),(74,'Company of the Vibe'),(75,'Conclave of the Triad'),(76,'Council of Final Demise'),(77,'Council of Hard Core Ord'),(78,'Craaweh Thrall'),(79,'Cradle Scourge'),(80,'Crimson Angels'),(81,'Crimson Saints'),(82,'Crusade of Oh'),(83,'Crusaders of Undead'),(84,'Cryptic Serenity'),(85,'Csa Rigged'),(86,'Cult of the Raging Raid'),(87,'Dalaran Fair'),(88,'Damage Inc'),(89,'Dark Alliance'),(90,'Dark Azeroth'),(91,'Dark Damage'),(92,'Dark Resistus'),(93,'Dark Samurai'),(94,'Dark Turtles'),(95,'Darken Mercenaries'),(96,'Darkened Malevolence'),(97,'Darkness of Sword Coast'),(98,'Dawn of Knights Society'),(99,'Dawn of Mad Sentry'),(100,'Dead Zug'),(101,'Death Darkness'),(102,'Death Knights'),(103,'Deathlike Goods'),(104,'Deaths Venoms'),(105,'Decree of the Phumpers'),(106,'Defenders of Da Raised'),(107,'Defenders of Hyuuga Dark'),(108,'Defenders of Sacred Harm'),(109,'Deths Lords'),(110,'Devil Circl'),(111,'Devils Klng'),(112,'Dharma Hand'),(113,'Dharma Thorn'),(114,'Dies Ravager'),(115,'Disciples of Dead Panda'),(116,'Disciples of the Rot'),(117,'Doomsday Youth'),(118,'Dorcha Knights'),(119,'Dots of Dead Skull'),(120,'Dragon Arms'),(121,'Dragonhawk Revolution'),(122,'Dragons Erythnul'),(123,'Dragons of the Black'),(124,'Drunken Thunder'),(125,'Drunks of Matoskan'),(126,'Dwarven Rock'),(127,'Dynasty of the Emerald'),(128,'Eastern Asylum'),(129,'Echo Sanctus'),(130,'Echoes of the Muphin'),(131,'Effreno Death'),(132,'Elite Guild'),(133,'Elite Legion'),(134,'Elite Veritas'),(135,'Elunes Meat'),(136,'Emerald Men'),(137,'Emerald Mjolnir'),(138,'Endless Defense'),(139,'Enemies of Bleeding'),(140,'Enternal Saber'),(141,'Evictors of the Returned'),(142,'Evil Guard'),(143,'Exalted Effect'),(144,'Eyes of a Night Elf'),(145,'Eyes of the Elton Souls'),(146,'Fallen Clan'),(147,'Fallen Milk'),(148,'Fenrir Seeker'),(149,'Final Army'),(150,'Flames of Ale Drinkers'),(151,'Flames of Antarian Chaos'),(152,'Forestt\'s Wrath'),(153,'Forgotten Within'),(154,'From Synergy'),(155,'Frozen Oblivion'),(156,'Gashlycrumb Rollers'),(157,'Giovannitwos Elune'),(158,'Glass Meridian'),(159,'Gnome Faction'),(160,'Gods Gold'),(161,'Gods of the Complete'),(162,'Gold Catchers'),(163,'Golden Legendz'),(164,'Golden Souls'),(165,'Goldshire Goats'),(166,'Good Azeroth'),(167,'Gotz Safety'),(168,'Grammaton Alliance'),(169,'Great Circle'),(170,'Guardians of Honor'),(171,'Guards of Frostmane'),(172,'Guild of La Mano Dragons'),(173,'Guild of the Puppet'),(174,'Haggles Brigade'),(175,'Hammer of the Moral'),(176,'Hand of the Iron'),(177,'Hands of Far Con Buddies'),(178,'Hearts Knights'),(179,'Hell Angels'),(180,'Hells Thorn'),(181,'Holy Darnassus'),(182,'Horde Abh'),(183,'Horde Dragons'),(184,'Horde Leaders'),(185,'Horde Squad'),(186,'Horde of Omnia'),(187,'Horde of Free Brigade'),(188,'Horde of Shadow Flush'),(189,'Hordes Buccaneers'),(190,'Hordes Marauders'),(191,'House Crusaders'),(192,'Immortality Honor'),(193,'Inside Poof'),(194,'Iron Boyz'),(195,'Iscariot Ginas'),(196,'Island Kimchi'),(197,'Jenovas Wild'),(198,'Kalimdor Darkness'),(199,'Keepers of Golden Misery'),(200,'Keggers of Alt Hand Aton'),(201,'Kill Mafia'),(202,'Killer Durotar'),(203,'Killer Force'),(204,'Kindred Yardies'),(205,'Kindred of King Assassin'),(206,'Kingdom of the Ordo Crew'),(207,'Kings Boys'),(208,'Kings Windstorm'),(209,'Kings of Blood Knuckle'),(210,'Kings of Dol Aegis'),(211,'Knight Combat'),(212,'Knight of Fuzzy Night'),(213,'Knights of Darkspear'),(214,'Knights of Heavens Grave'),(215,'Knights of Myrmidon Ivxx'),(216,'Knights of the Avenging'),(217,'Knights of the Ballpeen'),(218,'Knights of the Black'),(219,'Knights of the Bloodhoof'),(220,'Knights of the Sovereign'),(221,'Knights of the Storm'),(222,'Knights of the Zulian'),(223,'Last Ptesanwi'),(224,'League of Hate Crew Seek'),(225,'Legacy of Ninth Beard'),(226,'Legendary Sons'),(227,'Legion of Maple Syrup'),(228,'Legion of Public Works'),(229,'Legion of Three Course'),(230,'Legion of United Souls'),(231,'Legion of Westfall Gold'),(232,'Legion of the Dark'),(233,'Legionnaires of Skull'),(234,'Les Warriors'),(235,'Lifetakers Inc'),(236,'Light of Dark Spire'),(237,'Light of Jade Renegade'),(238,'Liquid Guild'),(239,'Lone Side'),(240,'Lords of Fallen Blood'),(241,'Los Frum'),(242,'Lost Boyz'),(243,'Lost Squad'),(244,'Mad Daggers'),(245,'Malice Fatale'),(246,'Mandate of Jade'),(247,'Marines of the Butt'),(248,'Mercenaries of the Death'),(249,'Midget Council'),(250,'Midgets of Dark Sexy'),(251,'Midnight Norrathians'),(252,'Midnight Slayer'),(253,'Midnight War'),(254,'Minions of the Shadow'),(255,'Ministry of the Allince'),(256,'Mithril Destiny'),(257,'Monarchs of Party Crew'),(258,'Money Call'),(259,'Moonwood Redeye'),(260,'Narrow Patrol'),(261,'New Clan'),(262,'Night Pack'),(263,'Nightmare Guild'),(264,'Ninja Pledge'),(265,'Nocturne of Totally Dead'),(266,'Obsidian Fish'),(267,'Old Cosa'),(268,'One Valor'),(269,'Opus Faithful'),(270,'Order of Alts oF Fate'),(271,'Order of Nagas Bike Hunt'),(272,'Order of Omega Wards'),(273,'Order of Pink'),(274,'Order of Shield Bed'),(275,'Order of the Alt Sheep'),(276,'Order of the Honor'),(277,'Order of the Divine Lord'),(278,'Ordo Force'),(279,'Orgrimmar Ones'),(280,'Out of Lw Downed Wrynn'),(281,'Out of Mithril Avengers'),(282,'Oxbloods Medivh'),(283,'Pally Guard'),(284,'Path of the Brain'),(285,'Peddlers of the Hidden'),(286,'Phantoms of Wicked'),(287,'Phoenix Keepers'),(288,'Pillowcase Azeroth'),(289,'Pillowcase Cats'),(290,'Pius Tribe'),(291,'Plague of Human Slayer'),(292,'Plan Hand'),(293,'Power of Tuatha De Blood'),(294,'Priest Guild'),(295,'Prophets of Fatima War'),(296,'Prophets of Outlaw'),(297,'Prophets of the Red Mean'),(298,'Protectors of Black Hand'),(299,'Pure Aequitas'),(300,'Question Thrall'),(301,'Quintessential Sister'),(302,'Rage of Prairie Black'),(303,'Rage of the Flame'),(304,'Raiders of Candy Heart'),(305,'Raiders of the Purple'),(306,'Raiders of the Sil'),(307,'Ram Runners'),(308,'Rangers Vengeance'),(309,'Rangers of Interitus'),(310,'Raven Clan'),(311,'Razzle Guardian'),(312,'Reapers of the Shadow'),(313,'Reckless Knights'),(314,'Red Byam'),(315,'Red Death'),(316,'Reign of Alliance Task'),(317,'Reign of Blazing Frell'),(318,'Reign of Pure Conway'),(319,'Restoration of Illegal'),(320,'Resurrection of Tenui'),(321,'Ronin Kalimdor'),(322,'Rotting Tears'),(323,'Ruins of Dark Azeroth'),(324,'Rulers of Devils'),(325,'Sacred Parts'),(326,'Sacred Society'),(327,'Sacrificial Brotherhood'),(328,'Sanguine Council'),(329,'Sapphic Exiles'),(330,'Savage Kalimdor'),(331,'Scourge of Eight Inches'),(332,'Scourge of Wow Knights'),(333,'Scythe Sauce'),(334,'Secret Clan'),(335,'Seki Council'),(336,'Seraph Legends'),(337,'Shaded Judgement'),(338,'Shadow America'),(339,'Shadow Boys'),(340,'Shadow Knights'),(341,'Shadowed Ghosts'),(342,'Shadowed Goat'),(343,'Shadows of Cole Trainz'),(344,'Shadows of Los Banditos'),(345,'Shattered Stormrage'),(346,'Silent Night'),(347,'Silver Fools'),(348,'Silversky Sun'),(349,'Sisters of Kalimdor'),(350,'Skulled Ironforge'),(351,'Slayers of the Primals'),(352,'Sleepy Steel'),(353,'Soldiers of Azeroth'),(354,'Soldiers of Stalker'),(355,'Sons of Lambent Virtue'),(356,'Sons of the Top Truth'),(357,'Soul Wish'),(358,'Souls of Elite Gnome'),(359,'Spanaway Metalheadz'),(360,'Spoony Demise'),(361,'Squires of Sacred Tribe'),(362,'Stagnant Jesters'),(363,'Stars of Gear Farming'),(364,'Stupid Crusaders'),(365,'Stop Guides'),(366,'Storm of the Mope\'s'),(367,'Stormrage Ferguson'),(368,'Stormtroopers of Fatima '),(369,'Stormwind Crew'),(370,'Straight Caedes'),(371,'Stronghold Angels'),(372,'Sturgeon Empire'),(373,'Survivors of Devil Club'),(374,'Sweet Bear'),(375,'Sword of Lost Evil'),(376,'Tainted Bunnies'),(377,'Talon of the Eclectic'),(378,'Team Kingdom'),(379,'Team United'),(380,'Tears of Eternal Kitties'),(381,'Tears of Phantom Druids'),(382,'Templar of Raid Dodgers'),(383,'Templars of Plagueware'),(384,'Terra Totem'),(385,'Terra War'),(386,'The Abiem'),(387,'The Aceofchaos'),(388,'The Afterlife'),(389,'The Aggression'),(390,'The Alliance of Dark'),(391,'The Altimate'),(392,'The Ancona Fire'),(393,'The Apocalypse'),(394,'The Arcane Monkey'),(395,'The Army of Spartans'),(396,'The Avalon'),(397,'The Avengers of Shining'),(398,'The Azure Gangstaz'),(399,'The Battlegnome'),(400,'The Black Hand Haven'),(401,'The Blackdraygon'),(402,'The Blackout'),(403,'The Blade'),(404,'The Blades of Caer Eel'),(405,'The Blades of Onyxia'),(406,'The Blood Red Violence'),(407,'The Blood of Red Powers'),(408,'The Bloodycrusaders'),(409,'The Blues Azeroth'),(410,'The Blues Grimfang'),(411,'The Bluethunder'),(412,'The Bonds of Arcane'),(413,'The Brimstone'),(414,'The Broken Chaos'),(415,'The Brood of Unknown'),(416,'The Burning Dog Firewall'),(417,'The Cabal'),(418,'The Cake Gankers'),(419,'The Cannabuddies'),(420,'The Circle of Shadow'),(421,'The Clan Blackwatch Few'),(422,'The Clan Cats'),(423,'The Clan Knights'),(424,'The Clean Combinations'),(425,'The Clean Up Guard'),(426,'The Council of Dark'),(427,'The Covenant'),(428,'The Crimson Guild'),(429,'The Crimson Marbock'),(430,'The Crusaders of Horde'),(431,'The Crusaders of Seksoni'),(432,'The Cult of Clan Brigade'),(433,'The Cult of the Pink'),(434,'The Daggers of the Vile'),(435,'The Dark'),(436,'The Dark Dogs'),(437,'The Dark Pain'),(438,'The Darkfall'),(439,'The Darkside Vanguard'),(440,'The Darkside of Initium'),(441,'The Daughters of the Eli'),(442,'The Daytripper'),(443,'The Deadfriends'),(444,'The Defiant'),(445,'The Dont Overwhelming'),(446,'The Doom Pasta'),(447,'The Dragon Redeye'),(448,'The Dragons Flame'),(449,'The Dreadlords'),(450,'The Dublainn Crown'),(451,'The Durban Protecters'),(452,'The Echoes of Goldshire'),(453,'The Elit of Dark Elune'),(454,'The Emissaries of Furiou'),(455,'The Eternal Chaos'),(456,'The Eternus'),(457,'The Exiie'),(458,'The Expendable Shadow'),(459,'The Faith of Desert'),(460,'The Family Misfits'),(461,'The Fere Darkness'),(462,'The Final Tears'),(463,'The Forsaken Boochies'),(464,'The Gates of the Bloody'),(465,'The Gnomes Lordaero'),(466,'The Gods of Blackscar'),(467,'The Gods of Twilight'),(468,'The Gold Fighters'),(469,'The Guardian Thieves'),(470,'The Guardians of Gnome'),(471,'The Hands of Redridge'),(472,'The Hawk'),(473,'The Hearts Images'),(474,'The Hellborn Die'),(475,'The Heroes Plague'),(476,'The Horde Farmer'),(477,'The Horde Honor'),(478,'The Hotpocket'),(479,'The Ignis Prophecy'),(480,'The Illuminatie'),(481,'The Immortal League'),(482,'The Independant'),(483,'The Infragilis Legion'),(484,'The Jag'),(485,'The Jookmaster'),(486,'The Kataclysm'),(487,'The Knight'),(488,'The Knightelf'),(489,'The Knights Thorn'),(490,'The Knights of Gods Fury'),(491,'The Knights of Lost Peon'),(492,'The Knights of Mortal'),(493,'The Knights of Samurai'),(494,'The Kobra'),(495,'The Leaders of Evil'),(496,'The Leaders of Life'),(497,'The League of Red Knight'),(498,'The Legacy Meathooks'),(499,'The Legion of the Blue'),(500,'The Legion of Death'),(501,'The Lemmings of Flaming'),(502,'The Let Blood Gamer'),(503,'The Light'),(504,'The Little Hunters'),(505,'The Lords of Vae Knight'),(506,'The Mercenaries'),(507,'The Midieval Vanguard'),(508,'The Might of Dark Tong'),(509,'The Mithril Justice'),(510,'The Mithril Pepsi'),(511,'The Mjollnir'),(512,'The Moo Licht'),(513,'The Morgantis'),(514,'The Mulletmen'),(515,'The Necrontyr of Eternal'),(516,'The Nedrage Kills'),(517,'The Night'),(518,'The Nightfall'),(519,'The Ninja Heroes'),(520,'The Order of Gold'),(521,'The Order of Warcraft'),(522,'The Order of Warsong'),(523,'The Over Louder'),(524,'The Overlord'),(525,'The Pants'),(526,'The Pie'),(527,'The Pretectors'),(528,'The Project Disease'),(529,'The Psychotics'),(530,'The Puggers'),(531,'The Pyreborne'),(532,'The Queen of Meow'),(533,'The Red Hood Thunder'),(534,'The Reign of Uber Enigma'),(535,'The Resurrection'),(536,'The Ring of Honor'),(537,'The Ropetown'),(538,'The Royal Militia Blanco'),(539,'The Samurai Banda'),(540,'The Sanity'),(541,'The Sauce'),(542,'The Schoolyard Reapers'),(543,'The Secrets of Hehog'),(544,'The Seers'),(545,'The Servants of Cyclone'),(546,'The Seven'),(547,'The Shadow Gate'),(548,'The Shadow Misfits'),(549,'The Shadow of Ninja Pain'),(550,'The Shadowborn'),(551,'The Shizam'),(552,'The Shockers'),(553,'The Shriek of Nightmare'),(554,'The Silent Grunts'),(555,'The Silent Legion'),(556,'The Skunkdesigns'),(557,'The Sorrow'),(558,'The Souls of Azeroth Old'),(559,'The Spazler'),(560,'The Squirrels'),(561,'The Stringville'),(562,'The Stronghold of Reds'),(563,'The Tha Handlers'),(564,'The Thieves of Moral'),(565,'The Thorium Claw'),(566,'The Thread'),(567,'The Thule'),(568,'The Thunderslayers'),(569,'The True Wow'),(570,'The Trusted Minions'),(571,'The Twilight Rangers'),(572,'The Tyraels Aggression'),(573,'The Ultimates'),(574,'The Unforgiven Heresy'),(575,'The Unholy Bards'),(576,'The Unsung Efficiency'),(577,'The Valley of the Demon'),(578,'The Valor'),(579,'The Violent Chaos'),(580,'The Virus Eternal'),(581,'The War'),(582,'The Warsong Gnomeregan'),(583,'The Westcoast'),(584,'The Wicked'),(585,'The Will of Chronicles'),(586,'The Windsword Nightmare'),(587,'The Wings of Oxy Claw'),(588,'The Wrath of Elton'),(589,'The Wut'),(590,'The Yoricks Assassins'),(591,'The Zeksonic Thieves'),(592,'Theramore Azeroth'),(593,'Thirstquencher Chaos'),(594,'Thralls Caribous'),(595,'Three Alive'),(596,'Titans of Blood Sun'),(597,'Torvus Dragons'),(598,'Tower of the Little'),(599,'True Team'),(600,'Tul Inc'),(601,'Twinks of Cold Club'),(602,'Twinks of Hidden Venture'),(603,'Ultimate Rules'),(604,'Undead Kingdom'),(605,'Unforgiven Destiny'),(606,'Unguilded War'),(607,'Unholy Cats'),(608,'Unholy Teeth'),(609,'Union of Burning Prz'),(610,'Unusual Guard'),(611,'Valiant Riderz'),(612,'Vanguard Omen'),(613,'Vanguard Redeemers'),(614,'Vanguard of Teutonic'),(615,'Vengeful Mayhem'),(616,'Verata Blackflame'),(617,'Vicious Renegade'),(618,'Vile Dead'),(619,'Voodoo Hearth'),(620,'War Legion'),(621,'Warlockian Tree'),(622,'Warlords of Kungfu Army'),(623,'Warriors of Happy Death'),(624,'Warriors of the Tundra'),(625,'Warsong Insanity'),(626,'Waste of Grey Death'),(627,'Wayfarers of Maple Leaf'),(628,'Wayward Agenda'),(629,'Web of Forgoten Warfare'),(630,'Wet Guard'),(631,'Wild Fire'),(632,'Will of the Forgotten'),(633,'Winds of Steve Irwin'),(634,'Wings of Emerald Minions'),(635,'Wintermane Good'),(636,'Witchhunters of Chaos'),(637,'With Sea'),(638,'Wrath of the Horde Troop'),(639,'Wtf Losers'),(640,'Xcalibur of Shogunz Depo'),(641,'Xelium Determination');

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_guild_tasks` */

DROP TABLE IF EXISTS `ai_playerbot_guild_tasks`;

CREATE TABLE `ai_playerbot_guild_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) NOT NULL,
  `guildid` bigint(20) NOT NULL,
  `time` bigint(20) NOT NULL,
  `validIn` bigint(20) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `guildid` (`guildid`),
  KEY `type` (`type`),
  KEY `idx_ai_playerbot_guild_tasks_value` (`value`),
  KEY `idx_ai_playerbot_guild_tasks_guildid` (`guildid`),
  KEY `idx_ai_playerbot_guild_tasks_type` (`type`),
  KEY `idx_ai_playerbot_guild_tasks_owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ai_playerbot_guild_tasks` */

LOCK TABLES `ai_playerbot_guild_tasks` WRITE;

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_names` */

DROP TABLE IF EXISTS `ai_playerbot_names`;

CREATE TABLE `ai_playerbot_names` (
  `name_id` mediumint(8) NOT NULL,
  `name` varchar(12) DEFAULT NULL,
  `gender` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`name_id`),
  UNIQUE KEY `name_id` (`name_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='PlayerbotAI RandomBot names';

/*Data for the table `ai_playerbot_names` */

LOCK TABLES `ai_playerbot_names` WRITE;

insert  into `ai_playerbot_names`(`name_id`,`name`,`gender`) values (1,'Aalart',0),(2,'Aalef',0),(3,'Aalot',0),(4,'Abantes',0),(5,'Abarrotz',0),(6,'Abas',0),(7,'Abascantus',0),(8,'Abbo',0),(9,'Abdalonymus',0),(10,'Abderos',0),(11,'Abelard',0),(12,'Aberardus',0),(13,'Aberkios',0),(14,'Aberri',0),(15,'Abimilki',0),(16,'Abisme',0),(17,'Ablabius',0),(18,'Ablerus',0),(19,'Abramius',0),(20,'Abreas',0),(21,'Abronychus',0),(22,'Absolon',0),(23,'Abundanitus',0),(24,'Abydos',0),(25,'Acaeus',0),(26,'Acamus',0),(27,'Acelin',0),(28,'Acessamenus',0),(29,'Acestes',0),(30,'Achard',0),(31,'Achart',0),(32,'Achestan',0),(33,'Achila',0),(34,'Achololim',0),(35,'Acindynus',0),(36,'Aclepiades',0),(37,'Acot',0),(38,'Acrisias',0),(39,'Acrisius',0),(40,'Acroneos',0),(41,'Actor',0),(42,'Acun',0),(43,'Acur',0),(44,'Adalbero',0),(45,'Adalbert',0),(46,'Adalbrecht',0),(47,'Adaldag',0),(48,'Adalfuns',0),(49,'Adalhard',0),(50,'Adaloald',0),(51,'Adame',0),(52,'Adei',0),(53,'Adeimanthos',0),(54,'Adelard',0),(55,'Adelardus',0),(56,'Adelchis',0),(57,'Adelphius',0),(58,'Adelredus',0),(59,'Adelroth',0),(60,'Adelstan',0),(61,'Adeluin',0),(62,'Adelulf',0),(63,'Adenot',0),(64,'Aderlard',0),(65,'Adestan',0),(66,'Adhamar',0),(67,'Adlard',0),(68,'Admago',0),(69,'Admetos',0),(70,'Adon',0),(71,'Adranus',0),(72,'Adrastos',0),(73,'Adrastus',0),(74,'Adred',0),(75,'Adrestus',0),(76,'Adri',0),(77,'Adrianus',0),(78,'Adrien',0),(79,'Adso',0),(80,'Adstan',0),(81,'Adur',0),(82,'Aeaces',0),(83,'Aeduin',0),(84,'Aeduuard',0),(85,'Aeduuin',0),(86,'Aega',0),(87,'Aegaeon',0),(88,'Aegelmaer',0),(89,'Aegicoros',0),(90,'Aegidius',0),(91,'Aegisthes',0),(92,'Aegon',0),(93,'Aeilmar',0),(94,'Aeimnestos',0),(95,'Aeldredus',0),(96,'Aeldret',0),(97,'Aelfraed',0),(98,'Aelgar',0),(99,'Aelger',0),(100,'Aelmar',0),(101,'Aelmer',0),(102,'Aeluin',0),(103,'Aeluuin',0),(104,'Aenesidemos',0),(105,'Aeolus',0),(106,'Aeropus',0),(107,'Aeschreas',0),(108,'Aesculapius',0),(109,'Aesepus',0),(110,'Aeson',0),(111,'Aesop',0),(112,'Aetes',0),(113,'Aethelmaer',0),(114,'Aethelraed',0),(115,'Aethon',0),(116,'Aetion',0),(117,'Aetios',0),(118,'Aetolos',0),(119,'Agamedes',0),(120,'Agamemnon',0),(121,'Aganbold',0),(122,'Agapenor',0),(123,'Agapetus',0),(124,'Agapias',0),(125,'Agastrophos',0),(126,'Agathocles',0),(127,'Agathon',0),(128,'Agbal',0),(129,'Ageio',0),(130,'Agelaus',0),(131,'Agenor',0),(132,'Ager',0),(133,'Agesilaus',0),(134,'Agetos',0),(135,'Agid',0),(136,'Agila',0),(137,'Agilbert',0),(138,'Agilof',0),(139,'Agilulf',0),(140,'Agin',0),(141,'Agino',0),(142,'Agis',0),(143,'Agiwulf',0),(144,'Agnellus',0),(145,'Agnien',0),(146,'Agobard',0),(147,'Agosti',0),(148,'Agoztar',0),(149,'Agrias',0),(150,'Agriwulf',0),(151,'Agu',0),(152,'Ahthari',0),(153,'Ahu',0),(154,'Aiantes',0),(155,'Aias',0),(156,'Aide',0),(157,'Aidoingus',0),(158,'Aiert',0),(159,'Aigeus',0),(160,'Aignen',0),(161,'Aigo',0),(162,'Aigulf',0),(163,'Ailbert',0),(164,'Ailbric',0),(165,'Ailbriht',0),(166,'Ailmar',0),(167,'Ailmer',0),(168,'Ailred',0),(169,'Ailuin',0),(170,'Ailwin',0),(171,'Ailwinus',0),(172,'Aimar',0),(173,'Aime',0),(174,'Aimeri',0),(175,'Aimeric',0),(176,'Aimeriguet',0),(177,'Aimery',0),(178,'Aingeru',0),(179,'Aintza',0),(180,'Aioro',0),(181,'Aire',0),(182,'Airopos',0),(183,'Aischylos',0),(184,'Aistan',0),(185,'Aistulf',0),(186,'Aita',0),(187,'Aithanarid',0),(188,'Aitor',0),(189,'Aitzol',0),(190,'Akadios',0),(191,'Akamas',0),(192,'Aketza',0),(193,'Aktis',0),(194,'Aktor',0),(195,'Akuhata',0),(196,'Alahis',0),(197,'Alain',0),(198,'Alainon',0),(199,'Alaire',0),(200,'Alana',0),(201,'Alane',0),(202,'Alanus',0),(203,'Alaon',0),(204,'Alar',0),(205,'Alarabi',0),(206,'Alard',0),(207,'Alarge',0),(208,'Alaric',0),(209,'Alaricus',0),(210,'Alart',0),(211,'Alastor',0),(212,'Alatheus',0),(213,'Alatz',0),(214,'Alaviv',0),(215,'Alazas',0),(216,'Alberi',0),(217,'Alberic',0),(218,'Albericus',0),(219,'Albertus',0),(220,'Albgast',0),(221,'Albi',0),(222,'Albin',0),(223,'Albinus',0),(224,'Albirich',0),(225,'Alboin',0),(226,'Albrict',0),(227,'Alcaeos',0),(228,'Alcandros',0),(229,'Alcher',0),(230,'Alcides',0),(231,'Alcimos',0),(232,'Alcinous',0),(233,'Alcmaion',0),(234,'Alcman',0),(235,'Alcock',0),(236,'Alcon',0),(237,'Aldebrand',0),(238,'Aldemund',0),(239,'Alderan',0),(240,'Aldin',0),(241,'Aldis',0),(242,'Aldo',0),(243,'Aldredus',0),(244,'Aldret',0),(245,'Alduin',0),(246,'Aldun',0),(247,'Aldus',0),(248,'Aldyn',0),(249,'Aleaume',0),(250,'Aleaumin',0),(251,'Alec',0),(252,'Aleck',0),(253,'Alector',0),(254,'Alein',0),(255,'Alektryon',0),(256,'Alerot',0),(257,'Alesander',0),(258,'Alesaunder',0),(259,'Alestan',0),(260,'Aleuas',0),(261,'Alewyn',0),(262,'Alex',0),(263,'Alexandir',0),(264,'Alexandros',0),(265,'Alexarchos',0),(266,'Alexias',0),(267,'Alexis',0),(268,'Alexon',0),(269,'Aleyn',0),(270,'Aleyne',0),(271,'Alfan',0),(272,'Alfonce',0),(273,'Alfredus',0),(274,'Algar',0),(275,'Alger',0),(276,'Algor',0),(277,'Aliaume',0),(278,'Alica',0),(279,'Alick',0),(280,'Aligern',0),(281,'Alimahus',0),(282,'Alisander',0),(283,'Alisandre',0),(284,'Alisaunder',0),(285,'Alistair',0),(286,'Alixandre',0),(287,'Alizaunder',0),(288,'Alkamenos',0),(289,'Alkestis',0),(290,'Alketas',0),(291,'Alkibiades',0),(292,'Alkides',0),(293,'Alkimachos',0),(294,'Alkiphron',0),(295,'Alkmaion',0),(296,'Alla',0),(297,'Allan',0),(298,'Allande',0),(299,'Allen',0),(300,'Alleyn',0),(301,'Allowin',0),(302,'Almanzor',0),(303,'Almer',0),(304,'Almeric',0),(305,'Almericus',0),(306,'Alo',0),(307,'Alodet',0),(308,'Aloeus',0),(309,'Alois',0),(310,'Alots',0),(311,'Aloysius',0),(312,'Alphaeus',0),(313,'Alpheos',0),(314,'Alphesiboeus',0),(315,'Alphios',0),(316,'Alphonsins',0),(317,'Alret',0),(318,'Alsandre',0),(319,'Altes',0),(320,'Altzibar',0),(321,'Aluer',0),(322,'Aluerad',0),(323,'Aluerd',0),(324,'Alueredus',0),(325,'Alured',0),(326,'Aluredus',0),(327,'Aluret',0),(328,'Aluuin',0),(329,'Aluuine',0),(330,'Alvar',0),(331,'Alvere',0),(332,'Alvery',0),(333,'Alvredus',0),(334,'Alwinus',0),(335,'Alwyn',0),(336,'Alwyne',0),(337,'Alyattes',0),(338,'Alyaume',0),(339,'Alypius',0),(340,'Alysandir',0),(341,'Amadeus',0),(342,'Amal',0),(343,'Amalaric',0),(344,'Amalric',0),(345,'Amalrich',0),(346,'Amalricus',0),(347,'Amalvis',0),(348,'Amand',0),(349,'Amanieu',0),(350,'Amarinceus',0),(351,'Amator',0),(352,'Amatus',0),(353,'Amaud',0),(354,'Amauri',0),(355,'Amaurri',0),(356,'Amaury',0),(357,'Ambe',0),(358,'Ambrico',0),(359,'Ambricus',0),(360,'Ambroise',0),(361,'Ambrosius',0),(362,'Ambroys',0),(363,'Ambure',0),(364,'Ame',0),(365,'Ameinias',0),(366,'Ameinokles',0),(367,'Amlien',0),(368,'Amer',0),(369,'Americ',0),(370,'Americus',0),(371,'Amery',0),(372,'Ames',0),(373,'Ametz',0),(374,'Amfrid',0),(375,'Amfridus',0),(376,'Amiantos',0),(377,'Amias',0),(378,'Amiel',0),(379,'Amigart',0),(380,'Amils',0),(381,'Amiot',0),(382,'Amirrutzes',0),(383,'Amis',0),(384,'Amisius',0),(385,'Ammius',0),(386,'Ammonianus',0),(387,'Amo',0),(388,'Amohia',0),(389,'Amompharetos',0),(390,'Amopaon',0),(391,'Ampelius',0),(392,'Amphiaraos',0),(393,'Amphidamos',0),(394,'Amphimachos',0),(395,'Amphimnestus',0),(396,'Amphinomous',0),(397,'Amphion',0),(398,'Amphios',0),(399,'Amphitrion',0),(400,'Ampho',0),(401,'Amuruza',0),(402,'Amyas',0),(403,'Amyntas',0),(404,'Amyntor',0),(405,'Amyon',0),(406,'Amyris',0),(407,'Amythaon',0),(408,'Anabesineos',0),(409,'Anacharsis',0),(410,'Anafrid',0),(411,'Anagastes',0),(412,'Anaia',0),(413,'Anakletos',0),(414,'Anakoz',0),(415,'Anakreon',0),(416,'Anartz',0),(417,'Anastasios',0),(418,'Anastasius',0),(419,'Anatolicus',0),(420,'Anatolius',0),(421,'Anaut',0),(422,'Anaxagoras',0),(423,'Anaxandridas',0),(424,'Anaxandrides',0),(425,'Anaxandros',0),(426,'Anaxarchos',0),(427,'Anaxilaus',0),(428,'Anaximander',0),(429,'Anaximenes',0),(430,'Anaxis',0),(431,'Anaxos',0),(432,'Ancelin',0),(433,'Ancelm',0),(434,'Ancelmus',0),(435,'Ancelot',0),(436,'Anchialus',0),(437,'Anchier',0),(438,'Anchimolios',0),(439,'Anchises',0),(440,'Anchitel',0),(441,'Ancus',0),(442,'Andagis',0),(443,'Ander',0),(444,'Andhari',0),(445,'Andima',0),(446,'Andoitz',0),(447,'Andokides',0),(448,'Andolin',0),(449,'Andoni',0),(450,'Andraemon',0),(451,'Andrash',0),(452,'Andrea',0),(453,'Andreas',0),(454,'Andreu',0),(455,'Andrew',0),(456,'Andries',0),(457,'Androbulos',0),(458,'Androcles',0),(459,'Androdamos',0),(460,'Androgeus',0),(461,'Andronicus',0),(462,'Aner',0),(463,'Aneristos',0),(464,'Anfroi',0),(465,'Anfroy',0),(466,'Angegisis',0),(467,'Angilbart',0),(468,'Angilbert',0),(469,'Anianus',0),(470,'Anicius',0),(471,'Aniketos',0),(472,'Anisodoros',0),(473,'Anixi',0),(474,'Anketel',0),(475,'Anketil',0),(476,'Anketin',0),(477,'Anko',0),(478,'Anno',0),(479,'Anquetil',0),(480,'Anquetin',0),(481,'Anschetillus',0),(482,'Anschitillus',0),(483,'Anscoul',0),(484,'Ansegisel',0),(485,'Ansehelm',0),(486,'Anseis',0),(487,'Anselet',0),(488,'Ansell',0),(489,'Ansellus',0),(490,'Anselm',0),(491,'Anselme',0),(492,'Anselmet',0),(493,'Anselmus',0),(494,'Ansfroi',0),(495,'Ansgor',0),(496,'Ansgot',0),(497,'Anshelmus',0),(498,'Ansiau',0),(499,'Ansila',0),(500,'Ansis',0),(501,'Anskar',0),(502,'Ansketil',0),(503,'Anskettell',0),(504,'Ansobert',0),(505,'Ansout',0),(506,'Ansprand',0),(507,'Anstill',0),(508,'Ansure',0),(509,'Antaeus',0),(510,'Antagoras',0),(511,'Antemion',0),(512,'Antenor',0),(513,'Anter',0),(514,'Anthelme',0),(515,'Anthemion',0),(516,'Anthemius',0),(517,'Anthimus',0),(518,'Anthon',0),(519,'Anthonius',0),(520,'Antichares',0),(521,'Antidoros',0),(522,'Antigenes',0),(523,'Antigonos',0),(524,'Antikles',0),(525,'Antilochus',0),(526,'Antinous',0),(527,'Antiochus',0),(528,'Antipatris',0),(529,'Antipatros',0),(530,'Antiphales',0),(531,'Antiphones',0),(532,'Antiphus',0),(533,'Antisthenes',0),(534,'Antoinne',0),(535,'Anton',0),(536,'Antoni',0),(537,'Antonius',0),(538,'AntoniusTone',0),(539,'Antony',0),(540,'Antoynel',0),(541,'Antso',0),(542,'Antton',0),(543,'Antxoka',0),(544,'Antyaume',0),(545,'Anysus',0),(546,'Anytos',0),(547,'Anytus',0),(548,'Aoric',0),(549,'Apahida',0),(550,'Apal',0),(551,'Apat',0),(552,'Apelles',0),(553,'Apellicon',0),(554,'Aphidnos',0),(555,'Api',0),(556,'Apisaon',0),(557,'Apollodoros',0),(558,'Apollophanes',0),(559,'Apollos',0),(560,'Arabante',0),(561,'Arabo',0),(562,'Araimfres',0),(563,'Aralar',0),(564,'Arano',0),(565,'Aranold',0),(566,'Arapeta',0),(567,'Aratus',0),(568,'Aratz',0),(569,'Arbert',0),(570,'Arbitio',0),(571,'Arbogast',0),(572,'Arbogastes',0),(573,'Arcadius',0),(574,'Arcas',0),(575,'Arcavius',0),(576,'Arcebaldus',0),(577,'Arcenbaldus',0),(578,'Arcesilaus',0),(579,'Archagoras',0),(580,'Archambaud',0),(581,'Archel',0),(582,'Archelaos',0),(583,'Archembald',0),(585,'Archesilaus',0),(587,'Archetel',0),(588,'Archil',0),(589,'Archilochus',0),(590,'Archimbalt',0),(591,'Archytas',0),(592,'Arcidamus',0),(593,'Arcturus',0),(594,'Arculf',0),(595,'Ardabur',0),(596,'Ardaric',0),(597,'Ardoin',0),(598,'Areilycus',0),(599,'Areisius',0),(600,'Areithous',0),(601,'Arenvald',0),(602,'Aresti',0),(603,'Argades',0),(604,'Argaeus',0),(605,'Argaith',0),(606,'Argi',0),(607,'Argider',0),(608,'Argina',0),(609,'Argoitz',0),(610,'Argos',0),(611,'Ariald',0),(612,'Ariaric',0),(613,'Aribert',0),(614,'Arichis',0),(615,'Aridolis',0),(616,'Arimir',0),(617,'Arioald',0),(618,'Arion',0),(619,'Aripert',0),(620,'Ariphron',0),(621,'Aristaeus',0),(622,'Aristagoras',0),(623,'Aristaios',0),(624,'Aristandros',0),(625,'Aristarchos',0),(626,'Aristarchus',0),(627,'Aristides',0),(628,'Aristion',0),(629,'Aristippus',0),(630,'Aristoboulos',0),(631,'Aristobulus',0),(632,'Aristocles',0),(633,'Aristocypros',0),(634,'Aristodemos',0),(635,'Aristogeiton',0),(636,'Aristomachos',0),(637,'Ariston',0),(638,'Aristonous',0),(639,'Aristonymos',0),(640,'Aristophanes',0),(642,'Aristos',0),(643,'Aristotles',0),(644,'Aristoxenus',0),(645,'Arius',0),(646,'Arixo',0),(647,'Armand',0),(648,'Armando',0),(649,'Armant',0),(650,'Armatus',0),(651,'Armenius',0),(652,'Armentarius',0),(653,'Armin',0),(654,'Armine',0),(655,'Arminel',0),(656,'Armundus',0),(657,'Arnaitz',0),(658,'Arnald',0),(659,'Arnaldus',0),(660,'Arnalt',0),(661,'Arnas',0),(662,'Arnaud',0),(663,'Arnaut',0),(664,'Arnegis',0),(665,'Arnegliscus',0),(666,'Arnet',0),(667,'Arnoald',0),(668,'Arnold',0),(669,'Arnoldus',0),(670,'Arnott',0),(671,'Arnoul',0),(672,'Arnould',0),(673,'Arnulf',0),(674,'Arnwald',0),(675,'Arold',0),(676,'Arotza',0),(677,'Arrabaios',0),(678,'Arrats',0),(679,'Arridaios',0),(680,'Arrosko',0),(681,'Arsaphius',0),(682,'Arsenios',0),(683,'Arsenius',0),(684,'Arsieu',0),(685,'Artaud',0),(686,'Artavasdas',0),(687,'Artemas',0),(688,'Artemidoros',0),(689,'Artemios',0),(691,'Arter',0),(692,'Arther',0),(693,'Artheur',0),(694,'Arthurius',0),(695,'Arthurus',0),(696,'Artizar',0),(697,'Artor',0),(698,'Artos',0),(699,'Artur',0),(700,'Arturus',0),(701,'Artus',0),(702,'Artzai',0),(703,'Artzeiz',0),(704,'Arvandus',0),(705,'Arvide',0),(706,'Arybbas',0),(707,'Asasthenes',0),(708,'Asbad',0),(709,'Asbadus',0),(710,'Ascalaphus',0),(711,'Ascalo',0),(712,'Ascanius',0),(713,'Ascelin',0),(714,'Ascelyn',0),(715,'Aschetel',0),(716,'Aschetil',0),(717,'Aschetin',0),(718,'Aschines',0),(719,'Ascila',0),(720,'Asdrubal',0),(721,'Asentzio',0),(722,'Asier',0),(723,'Asius',0),(724,'Askell',0),(725,'Asketel',0),(726,'Asketin',0),(727,'Asklepios',0),(728,'Asonides',0),(729,'Asopodoros',0),(730,'Asopus',0),(731,'Aspar',0),(732,'Asphalion',0),(733,'Aspuanis',0),(734,'Assaraeus',0),(735,'Asselin',0),(736,'Astacos',0),(737,'Astegal',0),(738,'Astell',0),(739,'Aster',0),(740,'Asteri',0),(741,'Asterion',0),(742,'Asterius',0),(743,'Asteropaeus',0),(744,'Astigar',0),(745,'Astin',0),(746,'Astor',0),(747,'Astorge',0),(748,'Astrabacus',0),(749,'Astyanax',0),(750,'Atacinus',0),(751,'Atarrabi',0),(752,'Atarratze',0),(753,'Ataulf',0),(754,'Ataulph',0),(755,'Athalaric',0),(756,'Athalwolf',0),(757,'Athamas',0),(758,'Athanagild',0),(759,'Athanaric',0),(760,'Atharid',0),(761,'Athaulf',0),(762,'Athelard',0),(763,'Athelardus',0),(764,'Athelstan',0),(765,'Athelston',0),(766,'Athenades',0),(767,'Athenaeus',0),(768,'Athenion',0),(769,'Athenodorus',0),(770,'Atiphates',0),(771,'Atreus',0),(772,'Atrometos',0),(773,'Atseden',0),(774,'Attaginas',0),(775,'Attaginos',0),(776,'Attalos',0),(777,'Atymnius',0),(778,'Atys',0),(779,'Atze',0),(780,'Atzo',0),(781,'Aubelet',0),(782,'Auberi',0),(783,'Aubert',0),(784,'Aubertin',0),(785,'Aubery',0),(786,'Aubin',0),(787,'Aubinnet',0),(788,'Aubour',0),(789,'Aubray',0),(790,'Aubri',0),(791,'Aubry',0),(792,'Audax',0),(793,'Audegar',0),(794,'Audemar',0),(795,'Audila',0),(796,'Audo',0),(797,'Audoen',0),(798,'Audoenus',0),(799,'Audoin',0),(800,'Audomar',0),(801,'Audoneus',0),(802,'Audouin',0),(803,'Audramnus',0),(804,'Audri',0),(805,'Augebert',0),(806,'Augias',0),(807,'Auguinare',0),(808,'Augustinus',0),(809,'Auletes',0),(810,'Aunger',0),(811,'Aunsellus',0),(812,'Aurel',0),(813,'Aurken',0),(814,'Aurre',0),(815,'Aurri',0),(816,'Ausout',0),(817,'Austin',0),(818,'Austinus',0),(819,'Austyn',0),(820,'Autesion',0),(821,'Autgar',0),(822,'Authari',0),(823,'Autodikos',0),(824,'Autolycus',0),(825,'Autolykos',0),(826,'Automedon',0),(827,'Autonous',0),(828,'Auveray',0),(829,'Auvere',0),(830,'Auver',0),(831,'Auvrai',0),(832,'Auxitius',0),(833,'Auxkin',0),(834,'Avenel',0),(835,'Averardus',0),(836,'Averay',0),(837,'Avere',0),(838,'Averet',0),(839,'Averey',0),(840,'Averitt',0),(841,'Avery',0),(842,'Avienus',0),(843,'Avila',0),(844,'Axular',0),(845,'Axylus',0),(846,'Aylard',0),(847,'Aylbricht',0),(848,'Aylewynus',0),(849,'Aylmer',0),(850,'Aylmerus',0),(851,'Aymar',0),(852,'Aymer',0),(853,'Aymeri',0),(854,'Aymie',0),(855,'Aymon',0),(856,'Ayol',0),(857,'Azeari',0),(858,'Azelinus',0),(859,'Azmar',0),(860,'Azer',0),(861,'Azeus',0),(862,'Azibar',0),(863,'Aznar',0),(864,'Azorius',0),(865,'Aztore',0),(866,'Azubeli',0),(867,'Azur',0),(868,'Azzo',0),(869,'Baalhaan',0),(870,'Babai',0),(871,'Babylas',0),(872,'Bacauda',0),(873,'Bacchides',0),(874,'Bacchios',0),(875,'Bacchylides',0),(876,'Bacenor',0),(877,'Bacis',0),(878,'Baderon',0),(879,'Badouim',0),(880,'Badua',0),(881,'Baduaruis',0),(882,'Baduila',0),(883,'Baerius',0),(884,'Baiardo',0),(885,'Baiarte',0),(886,'Baiona',0),(887,'Bakar',0),(888,'Baladi',0),(889,'Balan',0),(890,'Balasi',0),(891,'Baldavin',0),(892,'Baldemarus',0),(893,'Baldewin',0),(894,'Baldewyn',0),(895,'Baldewyne',0),(896,'Baldric',0),(897,'Balduin',0),(898,'Baldwyn',0),(899,'Balendin',0),(900,'Baleren',0),(901,'Balesio',0),(902,'Balian',0),(903,'Baligant',0),(904,'Balius',0),(905,'Bangin',0),(906,'Baptiste',0),(907,'Barat',0),(908,'Barates',0),(909,'Baraxil',0),(910,'Bardas',0),(911,'Bardin',0),(912,'Bardo',0),(913,'Bardol',0),(914,'Bardolf',0),(915,'Bardolphus',0),(916,'Bardulphus',0),(917,'Barea',0),(918,'Baret',0),(919,'Barnard',0),(920,'Barnet',0),(921,'Barnier',0),(922,'Baro',0),(923,'Barret',0),(924,'Barrett',0),(925,'Barthlemy',0),(926,'Bartholomeus',0),(927,'Bartram',0),(928,'Bartrem',0),(929,'Basajaun',0),(930,'Basan',0),(931,'Basbrun',0),(932,'Basequin',0),(933,'Basile',0),(934,'Basileides',0),(935,'Basileios',0),(936,'Basiliakos',0),(937,'Basilides',0),(938,'Basilius',0),(939,'Basill',0),(940,'Baso',0),(941,'Basuin',0),(942,'Basyle',0),(943,'Bathyaes',0),(944,'Batsuen',0),(945,'Batzas',0),(946,'Baudet',0),(947,'Baudkin',0),(948,'Baudoin',0),(949,'Baudouin',0),(950,'Baudoyn',0),(951,'Baudry',0),(952,'Baugulf',0),(953,'Bausan',0),(954,'Baut',0),(955,'Bauto',0),(956,'Bavo',0),(957,'Bawden',0),(958,'Bayard',0),(959,'Baynard',0),(960,'Baza',0),(961,'Bazil',0),(962,'Bazkoare',0),(963,'Bazzo',0),(964,'Beat',0),(965,'Beatus',0),(966,'Beaudonnier',0),(967,'Beaudouin',0),(968,'Begon',0),(969,'Begue',0),(970,'Behe',0),(971,'Beila',0),(972,'Bela',0),(973,'Belasko',0),(974,'Belin',0),(975,'Belos',0),(976,'Beltxe',0),(977,'Beltza',0),(978,'Benat',0),(979,'Bendis',0),(980,'Bendy',0),(981,'Benedick',0),(982,'Benedictus',0),(983,'Benedicus',0),(984,'Beneger',0),(985,'Beneoit',0),(986,'Benoit',0),(987,'Beneoite',0),(988,'Benet',0),(989,'Benett',0),(990,'Beneyt',0),(991,'Bnezet',0),(992,'Benger',0),(993,'Benild',0),(994,'Benkamin',0),(995,'Bennet',0),(996,'Benoet',0),(997,'Benoiet',0),(998,'Benoist',0),(999,'Benoit',0),(1000,'Beppolenus',0),(1001,'Berahthraben',0),(1002,'Berart',0),(1003,'Berasko',0),(1004,'Berbiz',0),(1005,'Berchar',0),(1006,'Berdaitz',0),(1007,'Berdoi',0),(1008,'Beremundo',0),(1009,'Berend',0),(1010,'Berengar',0),(1011,'Berengarius',0),(1012,'Berengerius',0),(1013,'Berengerus',0),(1014,'Berengier',0),(1015,'Berhdoldus',0),(1016,'Berhtolf',0),(1017,'Bri',0),(1018,'Berico',0),(1019,'Berig',0),(1020,'Berimud',0),(1021,'Berimund',0),(1022,'Berin',0),(1023,'Beringaer',0),(1024,'Beringer',0),(1025,'Berinhard',0),(1026,'Bernar',0),(1027,'Bernard',0),(1028,'Bernardus',0),(1029,'Bernart',0),(1030,'Bernat',0),(1031,'Bernier',0),(1032,'Berno',0),(1033,'Bero',0),(1034,'Beroald',0),(1035,'Beroldus',0),(1036,'Berolt',0),(1037,'Berriotxoa',0),(1038,'Bert',0),(1039,'Bertaut',0),(1040,'Bertelis',0),(1041,'Berteram',0),(1042,'Berthaire',0),(1043,'Berthar',0),(1044,'Berthomieu',0),(1045,'Bertie',0),(1046,'Bertilo',0),(1047,'Bertin',0),(1048,'Bertol',0),(1049,'Bertramus',0),(1050,'Bertran',0),(1051,'Bertrand',0),(1052,'Bertrannus',0),(1053,'Bertrant',0),(1054,'Bertulf',0),(1055,'Berwelfus',0),(1056,'Besgun',0),(1057,'Bessa',0),(1058,'Bessas',0),(1059,'Bessi',0),(1060,'Besso',0),(1061,'Betadur',0),(1062,'Betan',0),(1063,'Beti',0),(1064,'Betin',0),(1065,'Betyn',0),(1066,'Beuca',0),(1067,'Beucad',0),(1068,'Beuve',0),(1069,'Beuves',0),(1070,'Beves',0),(1071,'Bevon',0),(1072,'Bezilo',0),(1073,'Bianor',0),(1074,'Bias',0),(1075,'Bibianus',0),(1076,'Biche',0),(1077,'Bidari',0),(1078,'Bide',0),(1079,'Bidun',0),(1080,'Bigelis',0),(1081,'Bihar',0),(1082,'Bikendi',0),(1083,'Bilbo',0),(1084,'Bilimer',0),(1085,'Bilintx',0),(1086,'Billebaut',0),(1087,'Bingen',0),(1088,'Binizo',0),(1089,'Bion',0),(1090,'Birila',0),(1091,'Birinus',0),(1092,'Birjaio',0),(1093,'Bisaltes',0),(1094,'Bisinus',0),(1095,'Biton',0),(1096,'Bittor',0),(1097,'Bitxintxo',0),(1098,'Bixente',0),(1099,'Bixintxo',0),(1100,'Bizi',0),(1101,'Bladi',0),(1102,'Blaise',0),(1103,'Blaive',0),(1104,'Blancandrin',0),(1105,'Blanko',0),(1106,'Blasius',0),(1107,'Blathyllos',0),(1108,'Blaze',0),(1109,'Blutmund',0),(1110,'Bob',0),(1111,'Bobbie',0),(1112,'Bobby',0),(1113,'Bobo',0),(1114,'Bobs',0),(1115,'Bochard',0),(1116,'Bodenolf',0),(1117,'Bodkin',0),(1118,'Bodo',0),(1119,'Bodolev',0),(1120,'Bodoloff',0),(1121,'Bodwine',0),(1122,'Boethius',0),(1123,'Boethus',0),(1124,'Bohle',0),(1125,'Boiorix',0),(1126,'Boje',0),(1127,'Boltof',0),(1128,'Bomilcar',0),(1129,'Bon-Ami',0),(1130,'Boneface',0),(1131,'Bonifacius',0),(1132,'Bonifatius',0),(1133,'Bonne',0),(1134,'Bonyface',0),(1135,'Boodes',0),(1136,'Borani',0),(1137,'Borchert',0),(1138,'Bordat',0),(1139,'Borjes',0),(1140,'Bortzaioriz',0),(1141,'Borus',0),(1142,'Boso',0),(1143,'Bostar',0),(1144,'Boter',0),(1145,'Botolfe',0),(1146,'Botolph',0),(1147,'Botulf',0),(1148,'Bouchard',0),(1149,'Bouke',0),(1150,'Bovo',0),(1151,'Braga',0),(1152,'Brandila',0),(1153,'Brantome',0),(1154,'Bretonnet',0),(1155,'Brianus',0),(1156,'Briareus',0),(1157,'Briarus',0),(1158,'Brice',0),(1159,'Bricet',0),(1160,'Briceus',0),(1161,'Bricot',0),(1162,'Brien',0),(1163,'Brienus',0),(1164,'Brison',0),(1165,'Britius',0),(1166,'Brocard',0),(1167,'Broder',0),(1168,'Bruiant',0),(1169,'Brune',0),(1170,'Bruno',0),(1171,'Brunte',0),(1172,'Bruyant',0),(1173,'Bryan',0),(1174,'Bryant',0),(1175,'Bryennius',0),(1176,'Brygos',0),(1177,'Bucoli',0),(1178,'Bulis',0),(1179,'Burchard',0),(1180,'Burconius',0),(1181,'Burel',0),(1182,'Burgundus',0),(1183,'Burkardus',0),(1184,'Burnel',0),(1185,'Burni',0),(1186,'Burrhus',0),(1187,'Burutzagi',0),(1188,'Buselin',0),(1189,'Butacidas',0),(1190,'Butilin',0),(1191,'Butlilinus',0),(1192,'Caine',0),(1193,'Callimachus',0),(1194,'Callimorphus',0),(1195,'Callinicus',0),(1196,'Calopodius',0),(1197,'Canbeus',0),(1198,'Candac',0),(1199,'Cannabas',0),(1200,'Cannabaudes',0),(1201,'Cantacuzenes',0),(1202,'Canute',0),(1203,'Canutus',0),(1204,'Cappi',0),(1205,'Capuel',0),(1206,'Carbo',0),(1207,'Carellus',0),(1208,'Carenos',0),(1209,'Carinus',0),(1210,'Carle',0),(1211,'Carloman',0),(1212,'Carlon',0),(1213,'Carneades',0),(1214,'Carpophorus',0),(1215,'Carpus',0),(1216,'Carthalo',0),(1217,'Casambus',0),(1218,'Caschin',0),(1219,'Casjen',0),(1220,'Caspar',0),(1221,'Cassyon',0),(1222,'Castinus',0),(1223,'Castor',0),(1224,'Ceas',0),(1225,'Cebriones',0),(1226,'Celeas',0),(1227,'Centule',0),(1228,'Cephalos',0),(1229,'Cepheus',0),(1230,'Cephissos',0),(1231,'Cerularius',0),(1232,'Cethegus',0),(1233,'Ceubasnus',0),(1234,'Ceufroy',0),(1235,'Ceyx',0),(1236,'Chabrias',0),(1237,'Chacili',0),(1238,'Chaeremon',0),(1239,'Chairophon',0),(1240,'Chal',0),(1241,'Chalcodon',0),(1242,'Chalcon',0),(1243,'Chalie',0),(1244,'Chalin',0),(1246,'Challemoinne',0),(1247,'Challes',0),(1248,'Charax',0),(1249,'Charegiselus',0),(1250,'Chares',0),(1251,'Charibert',0),(1252,'Charidemos',0),(1253,'Charilaus',0),(1254,'Charillos',0),(1255,'Charle',0),(1256,'Charlemayn',0),(1257,'Charles',0),(1258,'Charlet',0),(1259,'Charlot',0),(1260,'Charlys',0),(1261,'Charmides',0),(1262,'Charon',0),(1263,'Charopos',0),(1264,'Chartain',0),(1265,'Chatbert',0),(1266,'Chazili',0),(1267,'Cheiron',0),(1268,'Cheldric',0),(1269,'Chenric',0),(1270,'Chernubles',0),(1271,'Chersis',0),(1272,'Chik',0),(1273,'Chilbudius',0),(1274,'Childebert',0),(1275,'Childebrand',0),(1276,'Childeric',0),(1277,'Chileos',0),(1278,'Chilon',0),(1279,'Chilperic',0),(1280,'Chindasuinth',0),(1281,'Chlodmer',0),(1282,'Chlodovech',0),(1283,'Chlodowig',0),(1284,'Chlotar',0),(1285,'Choerilos',0),(1286,'Choeros',0),(1287,'Chonrad',0),(1288,'Chremes',0),(1289,'Chremon',0),(1290,'Chremonides',0),(1291,'Chretzo',0),(1292,'Chrezzo',0),(1293,'Chrisogon',0),(1296,'Chrodegang',0),(1297,'Chromis',0),(1298,'Chromius',0),(1299,'Chroniates',0),(1300,'Chrysaor',0),(1301,'Chryses',0),(1302,'Chrysippos',0),(1303,'Chrysogones',0),(1304,'Chrysogonus',0),(1305,'Chrysolorus',0),(1306,'Chustaffus',0),(1307,'Cilix',0),(1308,'Cineas',0),(1309,'Cinyras',0),(1310,'Ciprianus',0),(1311,'Cisses',0),(1312,'Cisseus',0),(1313,'Clair',0),(1314,'Clairac',0),(1315,'Clarebald',0),(1316,'Clarembald',0),(1317,'Clarembaut',0),(1318,'Claren',0),(1319,'Clarenbald',0),(1320,'Clarien',0),(1321,'Clarifant',0),(1322,'Clarin',0),(1323,'Clarus',0),(1324,'Claudien',0),(1325,'Cleades',0),(1326,'Cleandros',0),(1327,'Cleathes',0),(1328,'Cleisthenes',0),(1329,'Clem',0),(1330,'Clemens',0),(1331,'Clement',0),(1332,'Cleobulus',0),(1333,'Cleodaeos',0),(1334,'Cleombrotos',0),(1335,'Cleomenes',0),(1336,'Cleon',0),(1337,'Cleonicus',0),(1338,'Cleonymus',0),(1339,'Cleph',0),(1340,'Clerebald',0),(1341,'Clerenbald',0),(1342,'Climborin',0),(1343,'Climenon',0),(1344,'Climent',0),(1345,'Clinias',0),(1346,'Clisthenes',0),(1347,'Clodomir',0),(1348,'Clonius',0),(1349,'Clotaire',0),(1350,'Clothair',0),(1351,'Clovis',0),(1352,'Clymenon',0),(1353,'Clyment',0),(1354,'Clytius',0),(1355,'Clytomedes',0),(1356,'Cniva',0),(1357,'Cnivida',0),(1358,'Cnoethos',0),(1359,'Cobbo',0),(1360,'Cobon',0),(1361,'Codros',0),(1362,'Coenus',0),(1363,'Coeranus',0),(1364,'Coes',0),(1365,'Cois',0),(1366,'Colbert',0),(1367,'Colias',0),(1368,'Colluthus',0),(1369,'Comentas',0),(1370,'Comentiolus',0),(1371,'Cometas',0),(1372,'Comitas',0),(1373,'Comitiolus',0),(1374,'Conandus',0),(1375,'Conanus',0),(1376,'Conayn',0),(1377,'Conon',0),(1378,'Constans',0),(1381,'Constantinus',0),(1382,'Con',0),(1383,'Copreus',0),(1384,'Corbinian',0),(1385,'Cordylion',0),(1386,'Corippus',0),(1387,'Cornel',0),(1388,'Cornelys',0),(1389,'Corney',0),(1390,'Coronos',0),(1391,'Corydallos',0),(1392,'Corydon',0),(1393,'Cosmas',0),(1394,'Costaine',0),(1395,'Costan',0),(1396,'Costane',0),(1397,'Costetine',0),(1398,'Costin',0),(1399,'Coumyn',0),(1400,'Courtois',0),(1401,'Cozard',0),(1402,'Crathis',0),(1403,'Cratinus',0),(1404,'Cratippus',0),(1405,'Crpin',0),(1406,'Crescentius',0),(1407,'Cresconius',0),(1408,'Cressant',0),(1409,'Cressin',0),(1410,'Cretheus',0),(1411,'Crethon',0),(1412,'Cretines',0),(1413,'Crios',0),(1414,'Crispian',0),(1415,'Crispianus',0),(1416,'Crispin',0),(1417,'Crispinian',0),(1418,'Crispinianus',0),(1419,'Crispinus',0),(1420,'Cristianus',0),(1421,'Crocus',0),(1422,'Croesus',0),(1423,'Cronos',0),(1424,'Crotila',0),(1425,'Cteatus',0),(1426,'Ctesippus',0),(1427,'Cudbert',0),(1428,'Cudbriht',0),(1429,'Cuddey',0),(1430,'Cuddie',0),(1431,'Cuddy',0),(1432,'Cunigast',0),(1433,'Cunimund',0),(1434,'Cuno',0),(1435,'Cunradus',0),(1436,'Cuphagoras',0),(1437,'Curincpert',0),(1438,'Curteis',0),(1439,'Cuthbrid',0),(1440,'Cyberniskos',0),(1441,'Cycnus',0),(1442,'Cylon',0),(1443,'Cynaegiros',0),(1444,'Cyncus',0),(1445,'Cyneas',0),(1446,'Cyniscus',0),(1447,'Cyon',0),(1448,'Cyprian',0),(1449,'Cypselos',0),(1450,'Cyr',0),(1451,'Cyrenios',0),(1452,'Cyriack',0),(1453,'Cyricus',0),(1454,'Cyril',0),(1455,'Cyrila',0),(1456,'Cytorissos',0),(1457,'Dabi',0),(1458,'Dadaces',0),(1459,'Dado',0),(1460,'Daedalos',0),(1461,'Daetor',0),(1462,'Dagilo',0),(1463,'Dagobert',0),(1464,'Dailus',0),(1465,'Daimbert',0),(1466,'Dalfin',0),(1467,'Dalmas',0),(1468,'Dalmatius',0),(1469,'Daluce',0),(1470,'Damasippus',0),(1471,'Damasithymos',0),(1472,'Damasos',0),(1473,'Damastor',0),(1474,'Damasus',0),(1475,'Damian',0),(1476,'Damianos',0),(1477,'Damianus',0),(1478,'Damiskos',0),(1479,'Dammo',0),(1480,'Damoetas',0),(1481,'Damon',0),(1482,'Danaos',0),(1483,'Danaus',0),(1484,'Danel',0),(1485,'Daniel',0),(1486,'Danielus',0),(1487,'Danje',0),(1488,'Danor',0),(1489,'Dapamort',0),(1490,'Daphis',0),(1491,'Daphnis',0),(1492,'Dardanus',0),(1493,'Dares',0),(1494,'Darius',0),(1495,'Daufari',0),(1496,'Daufer',0),(1497,'David',0),(1498,'Davos',0),(1499,'Decentius',0),(1500,'Decke',0),(1501,'Dederic',0),(1502,'Dederich',0),(1503,'Dederick',0),(1504,'Dedericus',0),(1505,'Deenes',0),(1506,'Deenys',0),(1507,'Degarre',0),(1508,'Degore',0),(1509,'Dei',0),(1510,'Deigenhardus',0),(1511,'Deinias',0),(1512,'Deinokrates',0),(1513,'Deinomenes',0),(1514,'Deiotones',0),(1515,'Deiphobus',0),(1516,'Deiphonous',0),(1517,'Deipylus',0),(1518,'Delion',0),(1519,'Demades',0),(1520,'Demaratos',0),(1521,'Demarmenos',0),(1522,'Demas',0),(1523,'Demeas',0),(1524,'Demetrios',0),(1525,'Democedes',0),(1526,'Democon',0),(1527,'Demodocus',0),(1528,'Demokrates',0),(1529,'Demoleon',0),(1530,'Demonax',0),(1531,'Demonous',0),(1532,'Demophlos',0),(1533,'Demosthenes',0),(1534,'Denes',0),(1535,'Denisot',0),(1536,'Dennet',0),(1537,'Dennie',0),(1538,'Dennis',0),(1539,'Denny',0),(1540,'Denyse',0),(1541,'Denysot',0),(1542,'Deon',0),(1543,'Derek',0),(1544,'Derkylos',0),(1545,'Derric',0),(1546,'Derrick',0),(1547,'Deryk',0),(1548,'Detlef',0),(1549,'Deukalion',0),(1550,'Deunoro',0),(1551,'Deuterius',0),(1552,'Dexicos',0),(1553,'Dexios',0),(1554,'Diactorides',0),(1555,'Diadromes',0),(1556,'Diadumenus',0),(1557,'Diagoras',0),(1558,'Diagur',0),(1559,'Dicaeus',0),(1560,'Diccon',0),(1561,'Dick',0),(1562,'Dicke',0),(1563,'Dicken',0),(1564,'Dickie',0),(1565,'Dickon',0),(1566,'Dickory',0),(1567,'Dicky',0),(1568,'Didericus',0),(1569,'Didymus',0),(1570,'Diegotxe',0),(1571,'Dieneces',0),(1572,'Dieter',0),(1573,'Diggin',0),(1574,'Diggory',0),(1575,'Digne',0),(1576,'Digory',0),(1577,'Dimarus',0),(1578,'Diocles',0),(1579,'Diodoros',0),(1580,'Diodorus',0),(1581,'Diokles',0),(1582,'Diomedes',0),(1583,'Dionisius',0),(1584,'Dionysios',0),(1586,'Dionysos',0),(1587,'Diophantus',0),(1588,'Diores',0),(1589,'Diosconis',0),(1590,'Dioscuros',0),(1591,'Diotrephes',0),(1592,'Dirk',0),(1593,'Dismas',0),(1594,'Distiratsu',0),(1595,'Dithyrambos',0),(1596,'Ditmarus',0),(1597,'Ditwinus',0),(1598,'Dmetor',0),(1599,'Dob',0),(1600,'Dobbin',0),(1601,'Dod',0),(1602,'Dodd',0),(1603,'Doddie',0),(1604,'Doddy',0),(1605,'Dodge',0),(1606,'Dodo',0),(1607,'Doete',0),(1608,'Dolfin',0),(1609,'Dolleo',0),(1610,'Dolon',0),(1611,'Dolops',0),(1612,'Domeka',0),(1613,'Domentziolus',0),(1614,'Domenyk',0),(1615,'Domianus',0),(1616,'Domiku',0),(1617,'Dominic',0),(1618,'Dominick',0),(1619,'Dominicus',0),(1620,'Dominix',0),(1621,'Dominy',0),(1622,'Domnicus',0),(1623,'Domninus',0),(1624,'Domnitziolus',0),(1625,'Donaldus',0),(1626,'Donat',0),(1627,'Donato',0),(1628,'Donestan',0),(1629,'Doneuuald',0),(1630,'Donnet',0),(1631,'Donostia',0),(1632,'Donston',0),(1633,'Donus',0),(1634,'Doolin',0),(1635,'Doreios',0),(1636,'Doreius',0),(1637,'Dorian',0),(1638,'Doriskos',0),(1639,'Dorjes',0),(1640,'Doros',0),(1641,'Dorotheus',0),(1642,'Doryssos',0),(1643,'Dosithios',0),(1644,'Draga',0),(1645,'Drest',0),(1646,'Dreu',0),(1647,'Dreue',0),(1648,'Dreues',0),(1649,'Dreux',0),(1650,'Drew',0),(1651,'Drewett',0),(1652,'Drimylos',0),(1653,'Droart',0),(1654,'Droet',0),(1655,'Drogo',0),(1656,'Dromeus',0),(1657,'Dro-on',0),(1658,'Droserius',0),(1659,'Drouet',0),(1660,'Droyn',0),(1661,'Dru',0),(1662,'Drue',0),(1663,'Druet',0),(1664,'Druettus',0),(1665,'Drugo',0),(1666,'Drust',0),(1667,'Dryas',0),(1668,'Dryops',0),(1669,'Drystan',0),(1670,'Dubius',0),(1671,'Ducetius',0),(1672,'Duche',0),(1673,'Duda',0),(1674,'Dudic',0),(1675,'Dudo',0),(1676,'Dudon',0),(1677,'Duihna',0),(1678,'Dukker',0),(1679,'Dulcissinuis',0),(1680,'Dulcitius',0),(1681,'Dump',0),(1682,'Dumphey',0),(1683,'Dumphry',0),(1684,'Dumpty',0),(1685,'Dunestan',0),(1686,'Dunixi',0),(1687,'Durand',0),(1688,'Durandus',0),(1689,'Durant',0),(1690,'Duris',0),(1691,'Dye',0),(1692,'Dymas',0),(1693,'Dymnos',0),(1694,'Dynamius',0),(1695,'Dyonisius',0),(1696,'Dyryke',0),(1697,'Eadmund',0),(1698,'Eaduin',0),(1699,'Eaduuard',0),(1700,'Ealdred',0),(1701,'Ealdwine',0),(1702,'Eate',0),(1703,'Ebbo',0),(1704,'Eberhardus',0),(1705,'Ebermud',0),(1706,'Eberwolf',0),(1707,'Ebrardus',0),(1708,'Ebrimud',0),(1709,'Ebroin',0),(1710,'Ebrulf',0),(1711,'Eburhart',0),(1712,'Echeus',0),(1713,'Echekrates',0),(1714,'Echelaos',0),(1715,'Echemmon',0),(1716,'Echemus',0),(1717,'Echephron',0),(1718,'Echepolus',0),(1719,'Echestratos',0),(1720,'Eck',0),(1721,'Eckardus',0),(1722,'Ecke',0),(1723,'Ecky',0),(1724,'Ede',0),(1725,'Edelstein',0),(1726,'Eden',0),(1727,'Eder',0),(1728,'Edica',0),(1729,'Edmod',0),(1730,'Edmond',0),(1731,'Edmundus',0),(1732,'Edon',0),(1733,'Edorta',0),(1734,'Edred',0),(1735,'Eduard',0),(1736,'Eduin',0),(1737,'Eduinus',0),(1738,'Edun',0),(1739,'Edur',0),(1740,'Eduuard',0),(1741,'Eduuin',0),(1742,'Eduuine',0),(1743,'Edward',0),(1744,'Edwardus',0),(1745,'Edzard',0),(1746,'Ee',0),(1747,'Eetion',0),(1748,'Eggihard',0),(1749,'Eggo',0),(1750,'Egidius',0),(1751,'Eginhardt',0),(1752,'Eginolf',0),(1753,'Egoi',0),(1754,'Egoitz',0),(1755,'Egon',0),(1756,'Eguen',0),(1757,'Eguerdi',0),(1758,'Egun',0),(1759,'Eguntsenti',0),(1760,'Eguzki',0),(1761,'Ehren',0),(1762,'Eicke',0),(1763,'Eicko',0),(1764,'Eidhart',0),(1765,'Eielt',0),(1766,'Eiffe',0),(1767,'Eigio',0),(1768,'Eilert',0),(1769,'Eilmer',0),(1770,'Einhard',0),(1771,'Einolfus',0),(1772,'Eioneus',0),(1773,'Eirenaios',0),(1774,'Ekain',0),(1775,'Ekaitz',0),(1776,'Ekhi',0),(1777,'Ekialde',0),(1778,'Elasus',0),(1779,'Elatos',0),(1780,'Elatreus',0),(1781,'Elazar',0),(1782,'Elbert',0),(1783,'Eldred',0),(1784,'Elduin',0),(1785,'Eleder',0),(1786,'Eleon',0),(1787,'Elephenor',0),(1788,'Elexander',0),(1789,'Elie',0),(1790,'Ellande',0),(1791,'Elmar',0),(1792,'Elmer',0),(1793,'Elorri',0),(1794,'Elpenor',0),(1795,'Elpides',0),(1796,'Elpidius',0),(1797,'Elshender',0),(1798,'Eluard',0),(1799,'Elured',0),(1800,'Eluret',0),(1801,'Elvin',0),(1802,'Elysandre',0),(1803,'Emambe',0),(1804,'Emaurri',0),(1805,'Emaus',0),(1806,'Embrico',0),(1807,'Emelricus',0),(1808,'Emenon',0),(1809,'Emercho',0),(1810,'Emeric',0),(1811,'Emerick',0),(1812,'Emericus',0),(1813,'Emery',0),(1814,'Emicho',0),(1815,'Emme',0),(1816,'Emmeran',0),(1817,'Emmerich',0),(1818,'Emond',0),(1819,'Emont',0),(1820,'Emory',0),(1821,'Empedocles',0),(1822,'Enaut',0),(1823,'Endemannus',0),(1824,'Endios',0),(1825,'Endira',0),(1826,'Endura',0),(1827,'Endymion',0),(1828,'Eneco',0),(1829,'Enego',0),(1830,'Eneko',0),(1831,'Enekoitz',0),(1832,'Eneto',0),(1833,'Enetz',0),(1834,'Engelard',0),(1835,'Engelier',0),(1836,'Engelke',0),(1837,'Engenes',0),(1838,'Engenouf',0),(1839,'Engeram',0),(1840,'Engeramus',0),(1841,'Engerramet',0),(1842,'Engerran',0),(1843,'Engerrand',0),(1844,'Engilbert',0),(1845,'Enguerran',0),(1846,'Enguerrand',0),(1847,'Enion',0),(1848,'Eniopus',0),(1849,'Enjorran',0),(1850,'Enjorren',0),(1851,'Ennaeus',0),(1852,'Enne',0),(1853,'Enno',0),(1854,'Ennodius',0),(1855,'Ennomus',0),(1856,'Ennychus',0),(1857,'Enops',0),(1858,'Enurchus',0),(1859,'Eos',0),(1860,'Epaenetus',0),(1861,'Epaphos',0),(1862,'Epaphroditus',0),(1863,'Epeigeus',0),(1864,'Epeius',0),(1865,'Ephialtes',0),(1866,'Epicurus',0),(1867,'Epicydes',0),(1868,'Epikrates',0),(1869,'Epimenes',0),(1870,'Epiphanes',0),(1871,'Epiphanius',0),(1872,'Epistor',0),(1873,'Epistrophos',0),(1874,'Epitrophos',0),(1875,'Epizelos',0),(1876,'Epowlett',0),(1877,'Eral',0),(1878,'Eraric',0),(1879,'Erart',0),(1880,'Erasistratus',0),(1881,'Eratosthenes',0),(1882,'Eratostheres',0),(1883,'Erauso',0),(1884,'Ercanbald',0),(1885,'Erchambaut',0),(1886,'Erchebald',0),(1887,'Erchembaut',0),(1888,'Erchenbaldus',0),(1889,'Erchinoald',0),(1890,'Erechtheus',0),(1891,'Ereinotz',0),(1892,'Erengier',0),(1893,'Eretmenus',0),(1894,'Ereuthalion',0),(1895,'Erginus',0),(1896,'Ergiyios',0),(1897,'Erichthonius',0),(1898,'Ericus',0),(1899,'Eriulf',0),(1900,'Eriz',0),(1901,'Erkenbaud',0),(1902,'Erlantz',0),(1903,'Erlembald',0),(1904,'Ermanaric',0),(1905,'Ermelandus',0),(1906,'Ermenoldus',0),(1907,'Ernald',0),(1908,'Ernaldus',0),(1909,'Ernaut',0),(1910,'Erneis',0),(1911,'Ernis',0),(1912,'Ernisius',0),(1913,'Ernold',0),(1914,'Ernoldus',0),(1915,'Ernolf',0),(1916,'Ernoul',0),(1917,'Ernoulet',0),(1918,'Ernoullet',0),(1919,'Ernst',0),(1920,'Ernust',0),(1921,'Erramu',0),(1922,'Erramun',0),(1923,'Errando',0),(1924,'Errapel',0),(1925,'Errolan',0),(1926,'Erroman',0),(1927,'Erruki',0),(1928,'Ertaut',0),(1929,'Eru',0),(1930,'Ervig',0),(1931,'Erwin',0),(1932,'Erxandros',0),(1933,'Eryalus',0),(1934,'Erysichton',0),(1935,'Eryx',0),(1936,'Eryximachos',0),(1937,'Escremiz',0),(1938,'Esdelot',0),(1939,'Esdert',0),(1940,'Eshmunazar',0),(1941,'Eskuin',0),(1942,'Esme',0),(1943,'Esmond',0),(1944,'Espan',0),(1945,'Espanelis',0),(1946,'Esprevere',0),(1947,'Estebe',0),(1948,'Estne',0),(1949,'Estmond',0),(1950,'Estorgan',0),(1951,'Estout',0),(1952,'Estramarin',0),(1953,'Eteocles',0),(1954,'Eteokles',0),(1955,'Eteonous',0),(1956,'Eteus',0),(1957,'Ethelbert',0),(1958,'Ethelmar',0),(1959,'Etienne',0),(1960,'Etor',0),(1961,'Etxahun',0),(1962,'Etxatxu',0),(1963,'Etxeberri',0),(1964,'Etxekopar',0),(1965,'Etxepare',0),(1966,'Euaemon',0),(1967,'Eualcidas',0),(1968,'Euanthes',0),(1969,'Euarestos',0),(1970,'Eubalus',0),(1971,'Eubulus',0),(1972,'Eucarpus',0),(1973,'Euchenor',0),(1974,'Eucleides',0),(1975,'Eudaemon',0),(1976,'Eude',0),(1977,'Eudes',0),(1978,'Eudon',0),(1979,'Eudorus',0),(1980,'Eudoxius',0),(1981,'Eudoxsus',0),(1982,'Eudoxus',0),(1983,'Eudropin',0),(1984,'Euenius',0),(1985,'Euenor',0),(1986,'Euenus',0),(1987,'Eugammon',0),(1988,'Eugenios',0),(1989,'Eugenius',0),(1990,'Euhemenis',0),(1991,'Euippus',0),(1992,'Eukles',0),(1993,'Eulalius',0),(1994,'Eulampius',0),(1995,'Eulogius',0),(1996,'Eumaeus',0),(1997,'Eumastas',0),(1998,'Eumelus',0),(1999,'Eumenes',0),(2000,'Eumneus',0),(2001,'Eumolpus',0),(2002,'Euneas',0),(2003,'Euonomos',0),(2004,'Eupalinus',0),(2005,'Eupatarius',0),(2006,'Euphemius',0),(2007,'Euphenes',0),(2008,'Euphorbos',0),(2009,'Euphorion',0),(2010,'Euphratas',0),(2011,'Euphronios',0),(2012,'Euphronius',0),(2013,'Eupolos',0),(2014,'Euric',0),(2015,'Euripides',0),(2016,'Euryanax',0),(2017,'Eurybates',0),(2018,'Eurybiades',0),(2019,'Eurycliedes',0),(2020,'Eurydamus',0),(2021,'Eurydemon',0),(2022,'Eurydemos',0),(2023,'Euryhus',0),(2024,'Eurykrates',0),(2025,'Eurykratides',0),(2026,'Euryleon',0),(2027,'Eurylochos',0),(2028,'Eurymachos',0),(2029,'Euryphon',0),(2030,'Eurypylos',0),(2031,'Eurystenes',0),(2032,'Eurysthenes',0),(2033,'Eurystheus',0),(2034,'Eurysthios',0),(2035,'Eurythion',0),(2036,'Eurytos',0),(2037,'Eusebius',0),(2038,'Eusko',0),(2039,'Eussorus',0),(2040,'Eustache',0),(2041,'Eustachius',0),(2042,'Eustacius',0),(2043,'Eustas',0),(2044,'Eustathius',0),(2045,'Eustochius',0),(2046,'Eustratius',0),(2047,'Eute',0),(2048,'Eutha',0),(2049,'Euthalius',0),(2050,'Eutharic',0),(2051,'Euthydemos',0),(2052,'Euthynos',0),(2053,'Eutolmius',0),(2054,'Eutropios',0),(2055,'Eutuches',0),(2056,'Eutychianus',0),(2057,'Eutychides',0),(2058,'Eutychius',0),(2059,'Eutychus',0),(2060,'Euvrouin',0),(2061,'Evaenetos',0),(2062,'Evagoras',0),(2063,'Evandros',0),(2064,'Evanetus',0),(2065,'Eve',0),(2066,'Evelthon',0),(2067,'Evenios',0),(2068,'Evenon',0),(2069,'Evenus',0),(2070,'Everardus',0),(2071,'Evert',0),(2072,'Everwinus',0),(2073,'Evios',0),(2074,'Evrardin',0),(2075,'Evrart',0),(2076,'Evrat',0),(2077,'Evrouin',0),(2078,'Evroul',0),(2079,'Evroult',0),(2080,'Ewmond',0),(2081,'Ewstace',0),(2082,'Exaduis',0),(2083,'Exekias',0),(2084,'Eylgar',0),(2085,'Ezkerra',0),(2086,'Eztebe',0),(2087,'Fabianus',0),(2088,'Fabien',0),(2089,'Fabyan',0),(2090,'Facco',0),(2091,'Fadiko',0),(2092,'Faenus',0),(2093,'Fairman',0),(2094,'Faldron',0),(2095,'Fallard',0),(2096,'Fameite',0),(2097,'Famte',0),(2098,'Fangeaux',0),(2099,'Faramond',0),(2100,'Faramund',0),(2101,'Fardulf',0),(2102,'Fareman',0),(2103,'Faremanne',0),(2104,'Farman',0),(2105,'Farmanus',0),(2106,'Farnobius',0),(2107,'Faro',0),(2108,'Faroald',0),(2109,'Farrimond',0),(2110,'Fastida',0),(2111,'Fastred',0),(2112,'Fato',0),(2113,'Fauques',0),(2114,'Faure',0),(2115,'Fawkes',0),(2116,'Fderic',0),(2117,'Fderyc',0),(2118,'Fehde',0),(2119,'Feletheus',0),(2120,'Felippe',0),(2121,'Felippo',0),(2122,'Felippot',0),(2123,'Feliz',0),(2124,'Felyse',0),(2125,'Ferand',0),(2126,'Ferant',0),(2127,'Ferentus',0),(2128,'Fermin',0),(2129,'Ferrand',0),(2130,'Ferrant',0),(2131,'Ferri',0),(2132,'Ferry',0),(2133,'Fersio',0),(2134,'Fersomeris',0),(2135,'Fery',0),(2136,'Feva',0),(2137,'Fiebras',0),(2138,'Fiehe',0),(2139,'Fiepto',0),(2140,'Fierelus',0),(2141,'Filibert',0),(2142,'Filimer',0),(2143,'Firman',0),(2144,'Firmin',0),(2145,'Firmine',0),(2146,'Firminus',0),(2147,'Firmo',0),(2148,'Fitel',0),(2149,'Fitellus',0),(2150,'Fithian',0),(2151,'Fizzilo',0),(2152,'Flaccitheus',0),(2153,'Flaco',0),(2154,'Flambard',0),(2155,'Flanbert',0),(2156,'Flavian',0),(2157,'Flodoard',0),(2158,'Floouen',0),(2159,'Florant',0),(2160,'Florence',0),(2161,'Florencius',0),(2162,'Florent',0),(2163,'Florentinus',0),(2164,'Florentius',0),(2165,'Flori',0),(2166,'Florian',0),(2167,'Floridee',0),(2168,'Floris',0),(2169,'Florivet',0),(2170,'Florus',0),(2171,'Fluellen',0),(2172,'Flurry',0),(2173,'Fluvant',0),(2174,'Focke',0),(2175,'Foke',0),(2176,'Folc',0),(2177,'Folcard',0),(2178,'Folke',0),(2179,'Folkert',0),(2180,'Folkes',0),(2181,'Folkher',0),(2182,'Folkmod',0),(2183,'Folmar',0),(2184,'Formerio',0),(2185,'Formosos',0),(2186,'Forsard',0),(2187,'Fortin',0),(2188,'Fortun',0),(2189,'Foucaud',0),(2190,'Foucaut',0),(2191,'Foucher',0),(2192,'Fouchier',0),(2193,'Foulk',0),(2194,'Foulque',0),(2195,'Foulqueret',0),(2196,'Fouquaut',0),(2197,'Fouque',0),(2198,'Fouqueret',0),(2199,'Fouques',0),(2200,'Fouquet',0),(2201,'Fourcaut',0),(2202,'Foursi',0),(2203,'Fowke',0),(2204,'Franceis',0),(2205,'Franceys',0),(2206,'Francio',0),(2207,'Franciscus',0),(2208,'Franco',0),(2209,'Francus',0),(2210,'Frankl',0),(2211,'Franque',0),(2212,'Franquet',0),(2213,'Frantzes',0),(2214,'Franz',0),(2215,'Fraomanius',0),(2216,'Fraunce',0),(2217,'Fraunk',0),(2218,'Fravitta',0),(2219,'Fray',0),(2220,'Fredegar',0),(2221,'Frederic',0),(2222,'Fredericus',0),(2223,'Frederik',0),(2224,'Freert',0),(2225,'Fremin',0),(2226,'Frerich',0),(2227,'Frery',0),(2228,'Freskin',0),(2229,'Fretela',0),(2230,'Fridebertus',0),(2231,'Fridebraht',0),(2232,'Frideric',0),(2233,'Fridericus',0),(2234,'Fridigern',0),(2235,'Fridolin',0),(2236,'Fridugis',0),(2237,'Fridurih',0),(2238,'Frigeridus',0),(2239,'Frilo',0),(2240,'Frithila',0),(2241,'Frithuric',0),(2242,'Fritigern',0),(2243,'Froila',0),(2244,'Fromondin',0),(2245,'Fromony',0),(2246,'Fructosus',0),(2247,'Fuabal',0),(2248,'Fuano',0),(2249,'Fulbert',0),(2250,'Fulbertus',0),(2251,'Fulchard',0),(2252,'Fulcher',0),(2253,'Fulco',0),(2254,'Fulgentius',0),(2255,'Fulk',0),(2256,'Fulke',0),(2257,'Fulko',0),(2258,'Fullofaudes',0),(2259,'Fulrad',0),(2260,'Fyrmyn',0),(2261,'Gabirel',0),(2262,'Gabo',0),(2263,'Gabon',0),(2264,'Gabrielius',0),(2265,'Gadaric',0),(2266,'Gadfrid',0),(2267,'Gagino',0),(2268,'Gahariet',0),(2269,'Gai',0),(2270,'Gaiallard',0),(2271,'Gaido',0),(2272,'Gaidon',0),(2273,'Gaifer',0),(2274,'Gaillard',0),(2275,'Gaillart',0),(2276,'Gainas',0),(2277,'Gairbert',0),(2278,'Gairebold',0),(2279,'Gairhard',0),(2280,'Gairovald',0),(2281,'Gaiseric',0),(2282,'Gaitzka',0),(2283,'Gaizka',0),(2284,'Gaizkine',0),(2285,'Gaizko',0),(2286,'Galafe',0),(2287,'Galafre',0),(2288,'Gale',0),(2289,'Galefridus',0),(2290,'Galenus',0),(2291,'Galeran',0),(2292,'Galeren',0),(2293,'Gales',0),(2294,'Galfridus',0),(2295,'Galien',0),(2296,'Galindo',0),(2297,'Galindus',0),(2298,'Gallien',0),(2299,'Gallienus',0),(2300,'Gallus',0),(2301,'Galoer',0),(2302,'Galot',0),(2303,'Galter',0),(2304,'Galterius',0),(2305,'Gamelin',0),(2306,'Gamelinus',0),(2307,'Gamellus',0),(2308,'Gamelus',0),(2309,'Gammell',0),(2310,'Ganelon',0),(2311,'Ganix',0),(2312,'Ganymedes',0),(2313,'Gar',0),(2314,'Garaile',0),(2315,'Garaona',0),(2316,'Garbrand',0),(2317,'Garibald',0),(2318,'Garikoitz',0),(2319,'Garin',0),(2320,'Garit',0),(2321,'Garner',0),(2322,'Garnet',0),(2323,'Garnier',0),(2324,'Garnot',0),(2325,'Garnotin',0),(2326,'Garoa',0),(2327,'Garrat',0),(2328,'Garratt',0),(2329,'Garrelt',0),(2330,'Garrett',0),(2331,'Garrit',0),(2332,'Garsille',0),(2333,'Gartxot',0),(2334,'Gartzea',0),(2335,'Gartzen',0),(2336,'Gartzi',0),(2337,'Gascot',0),(2338,'Gaskon',0),(2339,'Gasteiz',0),(2340,'Gastne',0),(2341,'Gaston',0),(2342,'Gau',0),(2343,'Gauanes',0),(2344,'Gauargi',0),(2345,'Gaubert',0),(2346,'Gauchier',0),(2347,'Gaude',0),(2348,'Gaudinus',0),(2349,'Gaueko',0),(2350,'Gaufrid',0),(2351,'Gaufridus',0),(2352,'Gaufroi',0),(2353,'Gauguein',0),(2354,'Gaumardas',0),(2355,'Gaur',0),(2356,'Gaut',0),(2357,'Gautbehrt',0),(2358,'Gautelen',0),(2359,'Gauterit',0),(2360,'Gauteron',0),(2361,'Gautier',0),(2362,'Gautzelin',0),(2363,'Gauvain',0),(2364,'Gauzelen',0),(2365,'Gauzpert',0),(2366,'Gavienus',0),(2367,'Gavin',0),(2368,'Gavinus',0),(2369,'Gawayne',0),(2370,'Gawen',0),(2371,'Gawin',0),(2372,'Gawn',0),(2373,'Gawne',0),(2374,'Gawter',0),(2375,'Gawyn',0),(2376,'Gawyne',0),(2377,'Gaxan',0),(2378,'Gaylord',0),(2379,'Gaztea',0),(2380,'Gebahard',0),(2381,'Geberic',0),(2382,'Gebhard',0),(2383,'Geboin',0),(2384,'Gebun',0),(2385,'Geerd',0),(2386,'Geertt',0),(2387,'Geffe',0),(2388,'Geffery',0),(2389,'Geffrai',0),(2390,'Geffray',0),(2391,'Geffrei',0),(2392,'Geffrey',0),(2393,'Geffroi',0),(2394,'Gefroi',0),(2395,'Gefroy',0),(2396,'Geike',0),(2397,'Geleon',0),(2398,'Gelfradus',0),(2399,'Gelimer',0),(2400,'Gelis',0),(2401,'Gelo',0),(2402,'Gelon',0),(2403,'Gelther',0),(2404,'Gemalfin',0),(2405,'Gembert',0),(2406,'Gemmel',0),(2407,'Genethlius',0),(2408,'Gennadios',0),(2409,'Gennadius',0),(2410,'Gentian',0),(2411,'Gentien',0),(2412,'Gento',0),(2413,'Gentza',0),(2414,'Geoff',0),(2415,'Geoffrey',0),(2416,'Geoffroi',0),(2417,'Geofridus',0),(2418,'Geordie',0),(2419,'George',0),(2420,'Georgie',0),(2421,'Georgius',0),(2422,'Georgus',0),(2423,'Georgy',0),(2424,'Ger',0),(2425,'Gerald',0),(2426,'Geraldo',0),(2427,'Geraldus',0),(2428,'Gerard',0),(2429,'Gerardus',0),(2430,'Gerasimos',0),(2431,'Gerazan',0),(2432,'Gerbert',0),(2433,'Gerbertus',0),(2434,'Gerbodo',0),(2435,'Gerbotho',0),(2436,'Gerente',0),(2437,'Gereon',0),(2438,'Gerfast',0),(2439,'Gergori',0),(2440,'Gerhardus',0),(2441,'Gerhart',0),(2442,'Gerier',0),(2443,'Gerin',0),(2444,'Gerjet',0),(2445,'Gerlach',0),(2446,'Gerlacus',0),(2447,'Gerland',0),(2448,'Germanus',0),(2449,'Gernandus',0),(2450,'Gerner',0),(2451,'Gernier',0),(2452,'Gero',0),(2453,'Gerold',0),(2454,'Geroldin',0),(2455,'Geroldus',0),(2456,'Gerolt',0),(2457,'Gerontius',0),(2458,'Gerould',0),(2459,'Gerrart',0),(2460,'Gerrit',0),(2461,'Gerulf',0),(2462,'Gerung',0),(2463,'Geruntius',0),(2464,'Gervais',0),(2465,'Gervaise',0),(2466,'Gervas',0),(2467,'Gervasius',0),(2468,'Gervassius',0),(2469,'Gervs',0),(2470,'Gervse',0),(2471,'Gervesin',0),(2472,'Gervesot',0),(2473,'Gervis',0),(2474,'Gerwald',0),(2475,'Gesalec',0),(2476,'Gesimund',0),(2477,'Getica',0),(2478,'Geuffroi',0),(2479,'Geve',0),(2480,'Gevehard',0),(2481,'Gib',0),(2482,'Gibbon',0),(2483,'Gibby',0),(2484,'Gide',0),(2485,'Gidie',0),(2486,'Gieffrinnet',0),(2487,'Gifardus',0),(2488,'Gifartus',0),(2489,'Gifemund',0),(2490,'Giff',0),(2491,'Gifford',0),(2492,'Gigo',0),(2493,'Gil',0),(2494,'Gilamu',0),(2495,'Gilberd',0),(2496,'Gilbertus',0),(2497,'Gildon',0),(2498,'Gile',0),(2499,'Gilebert',0),(2500,'Gilebertus',0),(2501,'Gilebin',0),(2502,'Gilen',0),(2503,'Gilesindo',0),(2504,'Gilet',0),(2505,'Gilibertus',0),(2506,'Gilius',0),(2507,'Gill',0),(2508,'Gillebertus',0),(2509,'Gilles',0),(2510,'Gillet',0),(2511,'Gilliame',0),(2512,'Gillius',0),(2513,'Gillot',0),(2514,'Gillotin',0),(2515,'Gilmyn',0),(2516,'Gilon',0),(2517,'Gilonem',0),(2518,'Gilot',0),(2519,'Gilow',0),(2520,'Gilpin',0),(2521,'Gimmo',0),(2522,'Giorgius',0),(2523,'Gipp',0),(2524,'Giradin',0),(2525,'Giraldus',0),(2526,'Girard',0),(2527,'Girardus',0),(2528,'Girars',0),(2529,'Girart',0),(2530,'Giraud',0),(2531,'Giraudus',0),(2532,'Giraut',0),(2533,'Girbers',0),(2534,'Giregilo',0),(2535,'Giriaume',0),(2536,'Girk',0),(2537,'Giro',0),(2538,'Giroldus',0),(2539,'Girout',0),(2540,'Giselberdus',0),(2541,'Giseler',0),(2542,'Gisfrid',0),(2543,'Gisilbehrt',0),(2544,'Gisilbert',0),(2545,'Gislebertus',0),(2546,'Giso',0),(2547,'Gisulf',0),(2548,'Gizon',0),(2549,'Glaukias',0),(2550,'Glaukos',0),(2551,'Glaumunt',0),(2552,'Glauperaht',0),(2553,'Glycerius',0),(2554,'Glycon',0),(2555,'Gnipho',0),(2556,'Goar',0),(2557,'Gobelin',0),(2558,'Gobert',0),(2559,'Gobin',0),(2560,'Goce',0),(2561,'Gocelinus',0),(2562,'Godafre',0),(2563,'Godafried',0),(2564,'Godard',0),(2565,'Godart',0),(2566,'Godbert',0),(2567,'Goddas',0),(2568,'Godebert',0),(2569,'Godefray',0),(2570,'Godefridus',0),(2571,'Godefroi',0),(2572,'Godefroy',0),(2573,'Godefry',0),(2574,'Godegisel',0),(2575,'Godehard',0),(2576,'Godeheard',0),(2577,'Godelot',0),(2578,'Godepert',0),(2579,'Godesmannus',0),(2580,'Godet',0),(2581,'Godewinus',0),(2582,'Godfery',0),(2583,'Godfree',0),(2584,'Godfreed',0),(2585,'Godfrey',0),(2586,'Godfry',0),(2587,'Godichal',0),(2588,'Godigisclus',0),(2589,'Godila',0),(2590,'Godilas',0),(2591,'Godin',0),(2592,'Godobald',0),(2593,'Godohelm',0),(2594,'Godscalcus',0),(2595,'Goduin',0),(2596,'Goduine',0),(2597,'Godun',0),(2598,'Godvynus',0),(2599,'Goeuuin',0),(2600,'Goffridus',0),(2601,'Gogo',0),(2602,'Goi',0),(2603,'Goiaricus',0),(2604,'Goin',0),(2605,'Goisfrid',0),(2606,'Goisfridus',0),(2607,'Goiz',0),(2608,'Goizeder',0),(2609,'Goldin',0),(2610,'Goldine',0),(2611,'Golding',0),(2612,'Goldkopf',0),(2613,'Golduin',0),(2614,'Goldwyn',0),(2615,'Golias',0),(2616,'Gomeric',0),(2617,'Gomesano',0),(2618,'Gonfroi',0),(2619,'Gontier',0),(2620,'Gora',0),(2621,'Gorbea',0),(2622,'Gordias',0),(2623,'Goren',0),(2624,'Gorgias',0),(2625,'Gorgion',0),(2626,'Gorgos',0),(2627,'Gorgythion',0),(2628,'Gorka',0),(2629,'Gorosti',0),(2630,'Gorri',0),(2631,'Gosbert',0),(2632,'Goscelin',0),(2633,'Goscelinus',0),(2634,'Gosfridus',0),(2635,'Gotteschalk',0),(2636,'Gottschalk',0),(2637,'Gotwinus',0),(2638,'Gotzon',0),(2639,'Gotzstaf',0),(2640,'Goubert',0),(2641,'Goumelet',0),(2642,'Gourdet',0),(2643,'Gouththas',0),(2644,'Gouzlim',0),(2645,'Gozbert',0),(2646,'Gozelinus',0),(2647,'Gozolon',0),(2648,'Gracien',0),(2649,'Gracyen',0),(2650,'Gralam',0),(2651,'Grandoye',0),(2652,'Granville',0),(2653,'Gratian',0),(2654,'Grawo',0),(2655,'Grefin',0),(2656,'Greg',0),(2657,'Grege',0),(2658,'Gregoras',0),(2659,'Gregorius',0),(2660,'Gregour',0),(2661,'Grenville',0),(2662,'Grifo',0),(2663,'Grifon',0),(2664,'Grigge',0),(2665,'Grimald',0),(2666,'Grimaldus',0),(2667,'Grimbald',0),(2668,'Grimbaldus',0),(2669,'Grimbaud',0),(2670,'Grimbol',0),(2671,'Grimbold',0),(2672,'Grimoald',0),(2673,'Grimold',0),(2674,'Gringoire',0),(2675,'Gris',0),(2676,'Grisigion',0),(2677,'Grisigon',0),(2678,'Gryllus',0),(2679,'Gualter',0),(2680,'Gualterius',0),(2681,'Gualtier',0),(2682,'Guarin',0),(2683,'Guarinet',0),(2684,'Guarinus',0),(2685,'Guarnier',0),(2686,'Guenes',0),(2687,'Gurart',0),(2688,'Gueri',0),(2689,'Gurin',0),(2690,'Guerinnet',0),(2691,'Guermont',0),(2692,'Guernier',0),(2693,'Guernon',0),(2694,'Guernot',0),(2695,'Gui',0),(2696,'Guiart',0),(2697,'Guibe',0),(2698,'Guibert',0),(2699,'Guibour',0),(2700,'Guichard',0),(2701,'Guido',0),(2702,'Guigue',0),(2703,'Guilhabert',0),(2704,'Guilhem',0),(2705,'Guilielm',0),(2706,'Guillame',0),(2707,'Guillaume',0),(2708,'Guille',0),(2709,'Guillelmus',0),(2710,'Guillemaque',0),(2711,'Guillemet',0),(2712,'Guillemin',0),(2713,'Guillemot',0),(2714,'Guillot',0),(2715,'Guillotin',0),(2716,'Guimar',0),(2717,'Guimart',0),(2718,'Guimer',0),(2719,'Guimond',0),(2720,'Guineboud',0),(2721,'Guinemant',0),(2722,'Guinemanz',0),(2723,'Guinemar',0),(2724,'Guinemat',0),(2725,'Guiot',0),(2726,'Guiraud',0),(2727,'Guiraudet',0),(2728,'Guiscard',0),(2729,'Guischard',0),(2730,'Gumpert',0),(2731,'Gundehar',0),(2732,'Gundiok',0),(2733,'Gundo',0),(2734,'Gundoald',0),(2735,'Gundobad',0),(2736,'Gundobald',0),(2737,'Gunnulf',0),(2738,'Guntard',0),(2739,'Gunter',0),(2740,'Gunteric',0),(2741,'Gunterius',0),(2742,'Gunterus',0),(2743,'Gunthar',0),(2744,'Gunthigis',0),(2745,'Guntmar',0),(2746,'Guntramn',0),(2747,'Guntramus',0),(2748,'Gunutz',0),(2749,'Gunzelinus',0),(2750,'Gurgos',0),(2751,'Gurutz',0),(2752,'Gusso',0),(2753,'Gutthikas',0),(2754,'Gutxi',0),(2755,'Guyat',0),(2756,'Guymar',0),(2757,'Guyon',0),(2758,'Gwalter',0),(2759,'Gwatkin',0),(2760,'Gwychardus',0),(2761,'Gwydo',0),(2762,'Gy',0),(2763,'Gyffard',0),(2764,'Gylaw',0),(2765,'Gylbard',0),(2766,'Gylbarde',0),(2767,'Gylbart',0),(2768,'Gylippos',0),(2769,'Gylis',0),(2770,'Gylmyne',0),(2771,'Gylys',0),(2772,'Gyrard',0),(2773,'Gyras',0),(2774,'Gyrtias',0),(2775,'Haat',0),(2776,'Hab',0),(2777,'Habbe',0),(2778,'Habbie',0),(2779,'Habbo',0),(2780,'Habreham',0),(2781,'Hacon',0),(2782,'Hacun',0),(2783,'Hadubrand',0),(2784,'Haemon',0),(2785,'Hagarih',0),(2786,'Hagen',0),(2787,'Haggith',0),(2788,'Hagias',0),(2789,'Hagilo',0),(2790,'Hagnon',0),(2791,'Haguin',0),(2792,'Haiete',0),(2793,'Haimirich',0),(2794,'Haimmon',0),(2795,'Haimo',0),(2796,'Haimona',0),(2797,'Hairud',0),(2798,'Haitz',0),(2799,'Hal',0),(2800,'Halebran',0),(2801,'Halinard',0),(2802,'Halisthertes',0),(2803,'Halius',0),(2804,'Halo',0),(2805,'Haluin',0),(2806,'Ham',0),(2807,'Hamelen',0),(2808,'Hamelin',0),(2809,'Hameline',0),(2810,'Hamelot',0),(2811,'Hamen',0),(2812,'Hamett',0),(2813,'Hamilax',0),(2814,'Hamilcar',0),(2815,'Hamiscora',0),(2816,'Hamlet',0),(2817,'Hamlin',0),(2818,'Hamlyn',0),(2819,'Hammond',0),(2820,'Hamnet',0),(2821,'Hamon',0),(2822,'Hamond',0),(2823,'Hamonet',0),(2824,'Hampsicora',0),(2825,'Hamund',0),(2826,'Handi',0),(2827,'Hank',0),(2828,'Hankin',0),(2829,'Hann',0),(2830,'Hannes',0),(2831,'Hanni',0),(2832,'Hannibal',0),(2834,'Hanno',0),(2835,'Hannon',0),(2836,'Hano',0),(2837,'Hanot',0),(2838,'Hanry',0),(2839,'Hans-Ruedi',0),(2840,'Hapertus',0),(2841,'Haquin',0),(2842,'Harald',0),(2843,'Haraldus',0),(2844,'Harber',0),(2845,'Harbert',0),(2846,'Harchier',0),(2847,'Harde',0),(2848,'Hardegin',0),(2849,'Hardi',0),(2850,'Harding',0),(2851,'Hardouin',0),(2852,'Harduinus',0),(2853,'Haribehrt',0),(2854,'Hariberct',0),(2855,'Hariman',0),(2856,'Harimann',0),(2857,'Haritz',0),(2858,'Haritzeder',0),(2859,'Hariwald',0),(2860,'Harkaitz',0),(2861,'Harm',0),(2862,'Harman',0),(2863,'Harmatidas',0),(2864,'Harmocydes',0),(2865,'Harmodios',0),(2866,'Harmon',0),(2867,'Haroldus',0),(2868,'Harpagos',0),(2869,'Harpalion',0),(2870,'Harpalos',0),(2871,'Harpernus',0),(2872,'Harpocras',0),(2873,'Harri',0),(2874,'Harry',0),(2875,'Hartmannus',0),(2876,'Hartmudus',0),(2877,'Hartmut',0),(2878,'Hartz',0),(2879,'Hary',0),(2880,'Hascouf',0),(2881,'Hasdrubal',0),(2882,'Hats',0),(2883,'Hauwe',0),(2884,'Haveron',0),(2885,'Hawkin',0),(2886,'Haymo',0),(2887,'Hebert',0),(2888,'Hecataeus',0),(2889,'Hecelin',0),(2890,'Hedlef',0),(2891,'Hegesandros',0),(2893,'Hegetoridas',0),(2894,'Hegoi',0),(2895,'Heibert',0),(2896,'Heidolfus',0),(2897,'Heimart',0),(2898,'Heimeri',0),(2899,'Heimerich',0),(2900,'Heimon',0),(2901,'Heine',0),(2902,'Heinricus',0),(2903,'Heinz',0),(2904,'Heirax',0),(2905,'Heiron',0),(2906,'Hektor',0),(2907,'Helain',0),(2908,'Heldebald',0),(2909,'Heldefredus',0),(2910,'Helenos',0),(2911,'Helfricus',0),(2912,'Helgaud',0),(2913,'Helgesippos',0),(2914,'Helgot',0),(2915,'Helicaon',0),(2916,'Helinand',0),(2917,'Heliodorus',0),(2918,'Helios',0),(2919,'Helisachar',0),(2920,'Helladius',0),(2921,'Helle',0),(2922,'Helmhart',0),(2923,'Helouyn',0),(2924,'Heloynet',0),(2925,'Hemarc',0),(2926,'Hemart',0),(2927,'Hemeri',0),(2928,'Hemmet',0),(2929,'Hemmo',0),(2930,'Hemonnet',0),(2931,'Hendereye',0),(2932,'Hendry',0),(2933,'Hene',0),(2934,'Henffen',0),(2935,'Henfrey',0),(2936,'Henko',0),(2937,'Hennsmann',0),(2938,'Henricus',0),(2939,'Henriet',0),(2940,'Henriot',0),(2941,'Henseus',0),(2942,'Hephaestos',0),(2943,'Heraclius',0),(2944,'Herakleides',0),(2945,'Herakleitos',0),(2946,'Heraklides',0),(2947,'Heral',0),(2948,'Herald',0),(2949,'Herauso',0),(2950,'Herbelot',0),(2951,'Herbertus',0),(2952,'Herbrand',0),(2953,'Herchembaut',0),(2954,'Herchier',0),(2955,'Herculles',0),(2956,'Herebert',0),(2957,'Herensuge',0),(2958,'Hereuuard',0),(2959,'Herewardus',0),(2960,'Herewart',0),(2961,'Heribehrt',0),(2962,'Heribert',0),(2963,'Heribrand',0),(2964,'Herilo',0),(2965,'Heriot',0),(2966,'Hrique',0),(2967,'Herluin',0),(2968,'Herman',0),(2969,'Hermangild',0),(2970,'Hermannus',0),(2971,'Hermeias',0),(2972,'Hermenfred',0),(2973,'Hermenigild',0),(2974,'Hermenion',0),(2975,'Herment',0),(2976,'Hermeros',0),(2977,'Herminafrid',0),(2978,'Hermippos',0),(2979,'Hermogenes',0),(2980,'Hermolaos',0),(2981,'Hermolycus',0),(2982,'Hermon',0),(2983,'Hermongenes',0),(2984,'Hermotimos',0),(2985,'Hernais',0),(2986,'Hernaudin',0),(2987,'Hernaut',0),(2988,'Hernays',0),(2989,'Hernegliscus',0),(2990,'Hernouet',0),(2991,'Hero',0),(2992,'Herodes',0),(2993,'Herodianus',0),(2994,'Herodion',0),(2995,'Herold',0),(2996,'Herolt',0),(2997,'Heromenes',0),(2998,'Herould',0),(2999,'Herriot',0),(3000,'Herry',0),(3001,'Hertwicus',0),(3002,'Heruuord',0),(3003,'Herve',0),(3004,'Herveus',0),(3005,'Hervey',0),(3006,'Hervi',0),(3007,'Herviet',0),(3008,'Hervisse',0),(3009,'Hervoet',0),(3010,'Hervouet',0),(3011,'Hervy',0),(3012,'Hesdin',0),(3013,'Htouyn',0),(3014,'Hetzkinus',0),(3015,'Heude',0),(3016,'Heudebrand',0),(3017,'Heurle',0),(3018,'Hew',0),(3019,'Hewe',0),(3020,'Hewelet',0),(3021,'Hewelin',0),(3022,'Hewerald',0),(3023,'Hewet',0),(3024,'Hewlett',0),(3025,'Heymeri',0),(3026,'Heymon',0),(3027,'Hibai',0),(3028,'Hibbe',0),(3029,'Hibbo',0),(3030,'Hicetaon',0),(3031,'Hick',0),(3032,'Hicket',0),(3033,'Hickie',0),(3034,'Hiero',0),(3035,'Hieronymus',0),(3036,'Higg',0),(3037,'Hildebad',0),(3038,'Hildebald',0),(3039,'Hildeberht',0),(3040,'Hildebold',0),(3041,'Hildebrand',0),(3042,'Hildebrandus',0),(3043,'Hildebrant',0),(3044,'Hildebrondus',0),(3045,'Hildegaud',0),(3046,'Hildeprand',0),(3047,'Hilderic',0),(3048,'Hilderith',0),(3049,'Hildibrand',0),(3050,'Hildigis',0),(3051,'Hilduin',0),(3052,'Hilfert',0),(3053,'Hilmagis',0),(3054,'Himel',0),(3055,'Himerius',0),(3056,'Himi',0),(3057,'Himilco',0),(3058,'Himnerith',0),(3059,'Hincmar',0),(3060,'Hinrich',0),(3061,'Hipparchos',0),(3062,'Hipparinos',0),(3063,'Hippasus',0),(3064,'Hippias',0),(3065,'Hippocon',0),(3066,'Hippoklides',0),(3068,'Hippolytos',0),(3069,'Hippomachos',0),(3070,'Hippomenes',0),(3071,'Hippon',0),(3072,'Hipponax',0),(3073,'Hipponicus',0),(3074,'Hipponous',0),(3075,'Hippotas',0),(3076,'Hippothous',0),(3077,'Hippotion',0),(3078,'Hique',0),(3079,'Hiram',0),(3080,'Hiruz',0),(3081,'Hisarna',0),(3082,'Hitch',0),(3083,'Hitchcock',0),(3084,'Hitz',0),(3085,'Hitzeder',0),(3086,'Hlodver',0),(3087,'Hluodohari',0),(3088,'Hluodowig',0),(3089,'Hnaufridus',0),(3090,'Hob',0),(3091,'Hobard',0),(3092,'Hobb',0),(3093,'Hobbie',0),(3094,'Hocequin',0),(3095,'Hodei',0),(3096,'Hodge',0),(3097,'Hodgkin',0),(3098,'Hohepa',0),(3099,'Hoiples',0),(3100,'Hokianga',0),(3101,'Holger',0),(3102,'Holiver',0),(3103,'Holo',0),(3104,'Homeros',0),(3105,'Hone',0),(3106,'Honfroi',0),(3107,'Honoratus',0),(3108,'Honor',0),(3109,'Honorius',0),(3110,'Honot',0),(3111,'Hootje',0),(3112,'Hori',0),(3113,'Hosbertus',0),(3114,'Hosebert',0),(3115,'Hosmundus',0),(3116,'Hosmunt',0),(3117,'Hotch',0),(3118,'Hotu',0),(3119,'Hotys',0),(3120,'Hotz',0),(3121,'Houdart',0),(3122,'Houdet',0),(3123,'Houdin',0),(3124,'Houdoin',0),(3125,'Houdouyn',0),(3126,'How',0),(3127,'Howard',0),(3128,'Howkin',0),(3129,'Hraban',0),(3130,'Hremfing',0),(3131,'Hroch',0),(3132,'Hrodebert',0),(3133,'Hrodgar',0),(3134,'Hrodgaud',0),(3135,'Hrodger',0),(3136,'Hrodo',0),(3137,'Hrodric',0),(3138,'Hrodrich',0),(3139,'Hrodulf',0),(3140,'Hrotmar',0),(3141,'Hrudolf',0),(3142,'Hruodiger',0),(3143,'Hruodland',0),(3144,'Hruodpehrt',0),(3145,'Huard',0),(3146,'Huart',0),(3147,'Hubard',0),(3148,'Hubelet',0),(3149,'Hubertus',0),(3150,'Hubie',0),(3151,'Huchon',0),(3152,'Hud',0),(3153,'Hudd',0),(3154,'Hudde',0),(3155,'Hue',0),(3156,'Huebald',0),(3157,'Huelin',0),(3158,'Huet',0),(3159,'Huffie',0),(3160,'Hugelin',0),(3161,'Huget',0),(3162,'Hugethun',0),(3163,'Huggett',0),(3164,'Huggin',0),(3165,'Hugh',0),(3166,'Hughoc',0),(3167,'Hugi',0),(3168,'Hugin',0),(3169,'Hugline',0),(3170,'Hugo',0),(3171,'Hugolinus',0),(3172,'Hugon',0),(3173,'Huguard',0),(3174,'Hugubehrt',0),(3175,'Hugubert',0),(3176,'Hugue',0),(3177,'Huguenin',0),(3178,'Hugues',0),(3179,'Huguet',0),(3180,'Huidelon',0),(3181,'Huidemar',0),(3182,'Huirangi',0),(3183,'Huitace',0),(3184,'Hulmul',0),(3185,'Humbert',0),(3186,'Humfery',0),(3187,'Humfredus',0),(3188,'Humfrey',0),(3189,'Humfridus',0),(3190,'Humfrye',0),(3191,'Huml',0),(3192,'Humph',0),(3193,'Humpherus',0),(3194,'Humphery',0),(3195,'Humphrey',0),(3196,'Humpty',0),(3197,'Hunald',0),(3198,'Hunberct',0),(3199,'Huneric',0),(3200,'Hunfray',0),(3201,'Hunfrid',0),(3202,'Hunfridus',0),(3203,'Hunigild',0),(3204,'Hunimund',0),(3205,'Hunout',0),(3206,'Hunulf',0),(3207,'Hunumund',0),(3208,'Huolo',0),(3209,'Huon',0),(3210,'Huoul',0),(3211,'Hupertus',0),(3212,'Hurko',0),(3213,'Hurmio',0),(3214,'Huroin',0),(3215,'Hurrey',0),(3216,'Hustaz',0),(3217,'Hutch',0),(3218,'Hutchin',0),(3219,'Hyakinthos',0),(3220,'Hydatius',0),(3221,'Hylas',0),(3222,'Hyllos',0),(3223,'Hyllus',0),(3224,'Hypatius',0),(3225,'Hypeirochus',0),(3226,'Hypenor',0),(3227,'Hyperenor',0),(3228,'Hyperion',0),(3229,'Hypsenor',0),(3230,'Hyrcanus',0),(3231,'Hyrtacus',0),(3232,'Hyrtius',0),(3233,'Iacobus',0),(3234,'Iakchos',0),(3235,'Iaki',0),(3236,'Ialmenes',0),(3237,'Iambulus',0),(3238,'Iamus',0),(3239,'Ianto',0),(3240,'Ianuarius',0),(3241,'Iasos',0),(3242,'Iatragoras',0),(3243,'Iatrokles',0),(3244,'Iban',0),(3245,'Ibanolis',0),(3246,'Ibar',0),(3247,'Ibba',0),(3248,'Ibon',0),(3249,'Ibykos',0),(3250,'Icarion',0),(3251,'Icarius',0),(3252,'Icarus',0),(3253,'Idaeus',0),(3254,'Idaios',0),(3255,'Idas',0),(3256,'Idomeneus',0),(3257,'Ieltxu',0),(3258,'Ifebrand',0),(3259,'Ignace',0),(3260,'Ignatius',0),(3261,'Igon',0),(3262,'Ihazintu',0),(3263,'Ihintza',0),(3264,'Ihmel',0),(3265,'Iigo',0),(3266,'Ikatz',0),(3267,'Iker',0),(3268,'Ilari',0),(3269,'Ilazki',0),(3270,'Ilberd',0),(3271,'Ilbert',0),(3272,'Ilbertus',0),(3273,'Ildebad',0),(3274,'Ilioneus',0),(3275,'Ilixo',0),(3276,'Illart',0),(3277,'Illyrius',0),(3278,'Ilus',0),(3279,'Imanol',0),(3280,'Imbart',0),(3281,'Imbert',0),(3282,'Imbertus',0),(3283,'Imbrasus',0),(3284,'Imbrius',0),(3285,'Imbrus',0),(3286,'Imgelramus',0),(3287,'Imninon',0),(3288,'Inachos',0),(3289,'Inachus',0),(3290,'Inaki',0),(3291,'Inaros',0),(3292,'Inautzi',0),(3293,'Indar',0),(3294,'Indartsu',0),(3295,'Inge',0),(3296,'Ingelram',0),(3297,'Ingelramnus',0),(3298,'Ingelrandus',0),(3299,'Ingelrannus',0),(3300,'Ingeram',0),(3301,'Ingerame',0),(3302,'Ingraham',0),(3303,'Ingram',0),(3304,'Ingramus',0),(3305,'Ingran',0),(3306,'Ingrannus',0),(3307,'Inguma',0),(3308,'Inigo',0),(3309,'Inko',0),(3310,'Inna',0),(3311,'Innocentius',0),(3312,'Intxixu',0),(3313,'Iobates',0),(3314,'Ioco',0),(3315,'Iolaos',0),(3316,'Iollas',0),(3317,'Ion',0),(3318,'Ionnacius',0),(3319,'Ionnes',0),(3320,'Iordanes',0),(3321,'Ioritz',0),(3322,'Ioseph',0),(3323,'Iosephius',0),(3324,'Iosephus',0),(3325,'Iovinus',0),(3326,'Iovivus',0),(3327,'Ipar',0),(3328,'Iparragirre',0),(3329,'Iphiclus',0),(3330,'Iphicrates',0),(3331,'Iphikrates',0),(3332,'Iphinous',0),(3333,'Iphitos',0),(3334,'Iphitus',0),(3335,'Ipolitus',0),(3336,'Ippolitus',0),(3337,'Ippollitt',0),(3338,'Iraitz',0),(3339,'Iratxo',0),(3340,'Iratze',0),(3341,'Iratzeder',0),(3342,'Iraunkor',0),(3343,'Irenaeus',0),(3344,'Irnerius',0),(3345,'Irnfried',0),(3346,'Iros',0),(3347,'Irrintzi',0),(3348,'Iruinea',0),(3349,'Irus',0),(3350,'Isaaces',0),(3351,'Isaacius',0),(3352,'Isagoras',0),(3353,'Isambard',0),(3354,'Isandros',0),(3355,'Ischenous',0),(3356,'Isembard',0),(3357,'Isembart',0),(3358,'Isemberd',0),(3359,'Isembert',0),(3360,'Isenbard',0),(3361,'Isenbardus',0),(3362,'Isidor',0),(3363,'Isidoros',0),(3364,'Isidorus',0),(3365,'Ision',0),(3366,'Ismaros',0),(3367,'Ismenios',0),(3368,'Iso',0),(3369,'Isocrates',0),(3370,'Isodemos',0),(3371,'Isokrates',0),(3372,'Isore',0),(3373,'Isusko',0),(3374,'Itheus',0),(3375,'Iturri',0),(3376,'Itxaso',0),(3377,'Itylus',0),(3378,'Itys',0),(3379,'Itzaina',0),(3380,'Itziar',0),(3381,'Ive',0),(3382,'Ivo',0),(3383,'Ivon',0),(3384,'Ivone',0),(3385,'Ivor',0),(3386,'Ivote',0),(3387,'Ivvanus',0),(3388,'Ixaka',0),(3389,'Ixidor',0),(3390,'Ixona',0),(3391,'Izaskun',0),(3392,'Izotz',0),(3393,'Iztal',0),(3394,'Jabbe',0),(3395,'Jabbo',0),(3396,'Jabnit',0),(3397,'Jacobo',0),(3398,'Jacquelin',0),(3399,'Jaime',0),(3400,'Jaizki',0),(3401,'Jakelin',0),(3402,'Jakes',0),(3403,'Jakobe',0),(3404,'Jakue',0),(3405,'Jal',0),(3406,'Jangleu',0),(3407,'Janpier',0),(3408,'Janto',0),(3409,'Japhet',0),(3410,'Jarto',0),(3411,'Jarvis',0),(3412,'Jasce',0),(3413,'Jasone',0),(3414,'Jatsu',0),(3415,'Jaunti',0),(3416,'Jaunzuria',0),(3417,'Jean',0),(3418,'Jeff',0),(3419,'Jeffcock',0),(3420,'Jeffery',0),(3421,'Jeffroy',0),(3422,'Jeffry',0),(3423,'Jehan',0),(3424,'Jeharraz',0),(3425,'Jehaue',0),(3426,'Jelde',0),(3427,'Jellrich',0),(3428,'Jellste',0),(3429,'Jenico',0),(3430,'Jep',0),(3431,'Jeph',0),(3432,'Jeremi',0),(3433,'Jervis',0),(3434,'Jessamy',0),(3435,'Jevan',0),(3436,'Jewell',0),(3437,'Jibbe',0),(3438,'Jibbo',0),(3439,'Jilde',0),(3440,'Joannes',0),(3441,'Job',0),(3442,'Jobba',0),(3443,'Joce',0),(3444,'Jocelin',0),(3445,'Jocelyn',0),(3446,'Jocet',0),(3447,'Joceus',0),(3448,'Joon',0),(3449,'Jodocus',0),(3450,'Joel',0),(3451,'Joeli',0),(3452,'Joffridus',0),(3453,'Jofridus',0),(3454,'Johan',0),(3455,'Johannes',0),(3456,'John',0),(3457,'Johun',0),(3458,'Jokin',0),(3459,'Jolanus',0),(3460,'Joldewin',0),(3461,'Jolin',0),(3462,'Jolis',0),(3463,'Jollan',0),(3464,'Jollanus',0),(3465,'Jollivet',0),(3466,'Jolyon',0),(3467,'Jonas',0),(3468,'Jonathas',0),(3469,'Jop',0),(3470,'Joppa',0),(3471,'Joppo',0),(3472,'Jordanes',0),(3473,'Joren',0),(3474,'Jorin',0),(3475,'Joris',0),(3476,'Josce',0),(3477,'Joscelin',0),(3478,'Joscelyn',0),(3479,'Josclyn',0),(3480,'Joseba',0),(3481,'Josepe',0),(3482,'Joss',0),(3483,'Josse',0),(3484,'Josson',0),(3485,'Josu',0),(3486,'Jourdain',0),(3487,'Jowell',0),(3488,'Jozeran',0),(3489,'Juan',0),(3490,'Juaneizu',0),(3491,'Juango',0),(3492,'Juantxiki',0),(3493,'Judbert',0),(3494,'Jude',0),(3495,'Judo',0),(3496,'Juel',0),(3497,'Juerg',0),(3498,'Julen',0),(3499,'Jules',0),(3500,'Julf',0),(3501,'Julianus',0),(3502,'Julien',0),(3503,'Julyan',0),(3504,'Jumel',0),(3505,'Jupp',0),(3506,'Jurdan',0),(3507,'Jurfaret',0),(3508,'Jurg',0),(3509,'Jurgi',0),(3510,'Jurke',0),(3511,'Juste',0),(3512,'Kacili',0),(3513,'Kadmos',0),(3514,'Kaenas',0),(3515,'Kaeneus',0),(3516,'Kahu',0),(3517,'Kahumanu',0),(3518,'Kahutea',0),(3519,'Kai',0),(3520,'Kaiet',0),(3521,'Kalchas',0),(3522,'Kalesius',0),(3523,'Kaletor',0),(3524,'Kalliaros',0),(3525,'Kallias',0),(3526,'Kallikles',0),(3527,'Kallikrates',0),(3528,'Kallimachos',0),(3529,'Kallinicus',0),(3530,'Kallinos',0),(3531,'Kallipides',0),(3532,'Kallipos',0),(3533,'Kallisthenes',0),(3534,'Kallon',0),(3535,'Kameirus',0),(3536,'Kamira',0),(3537,'Kandaules',0),(3538,'Kandaulo',0),(3539,'Kannadis',0),(3540,'Kapaneus',0),(3541,'Kapys',0),(3542,'Karipos',0),(3543,'Karles',0),(3544,'Karmel',0),(3545,'Karolus',0),(3546,'Karopophores',0),(3547,'Kasen',0),(3548,'Kasos',0),(3549,'Kassandros',0),(3550,'Kauldi',0),(3551,'Kaunos',0),(3552,'Kaxen',0),(3553,'Kebalinos',0),(3554,'Kebes',0),(3555,'Kekrops',0),(3556,'Kelemen',0),(3557,'Kelmen',0),(3558,'Kemen',0),(3559,'Kenard',0),(3560,'Kendrick',0),(3561,'Keneweard',0),(3562,'Kenewrec',0),(3563,'Kennard',0),(3564,'Kenric',0),(3565,'Kenricus',0),(3566,'Kenweard',0),(3567,'Kenwrec',0),(3568,'Keop',0),(3569,'Keos',0),(3570,'Kepa',0),(3571,'Kephalon',0),(3572,'Kephalos',0),(3573,'Kerameikos',0),(3574,'Kereama',0),(3575,'Kerehi',0),(3576,'Kerkyon',0),(3577,'Kerrich',0),(3578,'Keteus',0),(3579,'Kiliz',0),(3580,'Kimetz',0),(3581,'Kimon',0),(3582,'Kirphis',0),(3583,'Kismi',0),(3584,'Kittos',0),(3585,'Klaes',0),(3586,'Klaus',0),(3587,'Kleitos',0),(3588,'Kleobis',0),(3589,'Kleomenes',0),(3590,'Koert',0),(3591,'Kohuru',0),(3592,'Koines',0),(3593,'Koinos',0),(3594,'Koldo',0),(3595,'Koldobika',0),(3596,'Konon',0),(3597,'Koob',0),(3598,'Koragos',0),(3599,'Korax',0),(3600,'Kosmas',0),(3601,'Krantor',0),(3602,'Krateros',0),(3603,'Kreon',0),(3604,'Krinippos',0),(3605,'Krino',0),(3606,'Kristos',0),(3607,'Kritias',0),(3608,'Kritoboulos',0),(3609,'Kritodemos',0),(3610,'Kriton',0),(3611,'Kroisos',0),(3612,'Krokinos',0),(3613,'Ktesiphon',0),(3614,'Kuonrat',0),(3615,'Kupe',0),(3616,'Kusko',0),(3617,'Kyknos',0),(3618,'Kynaegeiros',0),(3619,'Kyrillos',0),(3620,'Kyrios',0),(3621,'Kyros',0),(3622,'Labdacus',0),(3623,'Labotas',0),(3624,'Lactanius',0),(3625,'Ladislaus',0),(3626,'Laertes',0),(3627,'Lafele',0),(3628,'Lagariman',0),(3629,'Lagos',0),(3630,'Lagot',0),(3631,'Laiamicho',0),(3632,'Laico',0),(3633,'Lain',0),(3634,'Laios',0),(3635,'Lallo',0),(3636,'Lamachos',0),(3637,'Lambard',0),(3638,'Lambekin',0),(3639,'Lambelin',0),(3640,'Lambequin',0),(3641,'Lambert',0),(3642,'Lambertus',0),(3643,'Lambin',0),(3644,'Lambkin',0),(3645,'Lamissio',0),(3646,'Lammert',0),(3647,'Lampo',0),(3648,'Lampon',0),(3649,'Lampridius',0),(3650,'Lampus',0),(3651,'Lamus',0),(3652,'Lancelet',0),(3653,'Lancelin',0),(3654,'Lancelot',0),(3655,'Lancelyn',0),(3656,'Landebert',0),(3657,'Lander',0),(3658,'Landico',0),(3659,'Lando',0),(3660,'Landoberct',0),(3661,'Landri',0),(3662,'Lanfranc',0),(3663,'Lanslet',0),(3664,'Lanzo',0),(3665,'Laodamas',0),(3666,'Laodocus',0),(3667,'Laogonus',0),(3668,'Laomedon',0),(3669,'Laphanes',0),(3670,'Lapurdi',0),(3671,'Larance',0),(3672,'Larendi',0),(3673,'Larenz',0),(3674,'Larkin',0),(3675,'Larra',0),(3676,'Lartaun',0),(3677,'Laskaris',0),(3678,'Lasos',0),(3679,'Lasthenes',0),(3680,'Lastur',0),(3681,'Latinius',0),(3682,'Lauaxeta',0),(3683,'Laudus',0),(3684,'Launce',0),(3685,'Launceletus',0),(3686,'Launcelot',0),(3687,'Launobaudus',0),(3688,'Launselot',0),(3689,'Launus',0),(3690,'Laureion',0),(3691,'Laurencius',0),(3692,'Laurent',0),(3693,'Laurentius',0),(3694,'Laurentzi',0),(3695,'Laurgain',0),(3696,'Laurin',0),(3697,'Lawrence',0),(3698,'Leagros',0),(3699,'Leal',0),(3700,'Leandros',0),(3701,'Learchos',0),(3702,'Leavold',0),(3703,'Lebuin',0),(3704,'Lecapenus',0),(3705,'Ledger',0),(3706,'Leert',0),(3707,'Leferich',0),(3708,'Leffeyne',0),(3709,'Lefric',0),(3710,'Lefrich',0),(3711,'Lefricus',0),(3712,'Lefuuinus',0),(3713,'Lefwinus',0),(3714,'Lefwyne',0),(3715,'Leger',0),(3716,'Lehen',0),(3717,'Leheren',0),(3718,'Lehior',0),(3719,'Lehoi',0),(3720,'Leicritus',0),(3721,'Leigh',0),(3722,'Leitus',0),(3723,'Leizarraga',0),(3724,'Lekubegi',0),(3725,'Lel',0),(3726,'Lemnus',0),(3727,'Lennard',0),(3728,'Lennor',0),(3729,'Lentfridus',0),(3730,'Leo',0),(3731,'Leocedes',0),(3732,'Leodegar',0),(3733,'Leodes',0),(3734,'Leofard',0),(3735,'Leofricus',0),(3736,'Leofuuin',0),(3737,'Leofuuinus',0),(3738,'Leoiar',0),(3739,'Leon',0),(3740,'Leonardus',0),(3741,'Leonel',0),(3742,'Leonhard',0),(3743,'Leonidas',0),(3744,'Leonidem',0),(3745,'Leonnatos',0),(3746,'Leontiades',0),(3747,'Leontis',0),(3748,'Leontius',0),(3749,'Leoprepes',0),(3750,'Leoric',0),(3751,'Leotychides',0),(3752,'Leouric',0),(3753,'Leouuinus',0),(3754,'Leovigild',0),(3755,'Ler',0),(3756,'Lertxun',0),(3757,'Letard',0),(3758,'Lethos',0),(3759,'Leucippus',0),(3760,'Leudbald',0),(3761,'Leufred',0),(3762,'Leufroy',0),(3763,'Leukos',0),(3764,'Leuric',0),(3765,'Leutfrid',0),(3766,'Leuthere',0),(3767,'Leuuin',0),(3768,'Leuuine',0),(3769,'Leuvibild',0),(3770,'Leveridge',0),(3771,'Levin',0),(3772,'Lewenhart',0),(3773,'Lewin',0),(3774,'Lewine',0),(3775,'Lewis',0),(3776,'Liafwine',0),(3777,'Lichas',0),(3778,'Licymnios',0),(3779,'Lie',0),(3780,'Liebte',0),(3781,'Lice',0),(3782,'Liellus',0),(3783,'Lienart',0),(3784,'Ligart',0),(3785,'Ligier',0),(3786,'Liher',0),(3787,'Lijart',0),(3788,'Linus',0),(3789,'Lion',0),(3790,'Lionet',0),(3791,'Liudhard',0),(3792,'Liudolf',0),(3793,'Liukardis',0),(3794,'Liulf',0),(3795,'Liutbald',0),(3796,'Liutbalt',0),(3797,'Liutpert',0),(3798,'Liutprand',0),(3799,'Liutward',0),(3800,'Livila',0),(3801,'Lizar',0),(3802,'Lizardi',0),(3803,'Lo',0),(3804,'Lodewicus',0),(3805,'Loert',0),(3806,'Lohitzun',0),(3807,'Loiola',0),(3808,'Lon',0),(3809,'Looys',0),(3810,'Lope',0),(3811,'Loramendi',0),(3812,'Lordi',0),(3813,'Lore',0),(3814,'Loren',0),(3815,'Lorence',0),(3816,'Lorencin',0),(3817,'Lorens',0),(3818,'Lorent',0),(3819,'Lorenz',0),(3820,'Lori',0),(3821,'Lorrenz',0),(3822,'Lothar',0),(3823,'Loup',0),(3824,'Louth',0),(3825,'Louve',0),(3826,'Louvel',0),(3827,'Love',0),(3828,'Lovel',0),(3829,'Lovell',0),(3830,'Loverich',0),(3831,'Loverick',0),(3832,'Lovet',0),(3833,'Lowis',0),(3834,'Lowrens',0),(3835,'Lowrie',0),(3836,'Loxias',0),(3837,'Loys',0),(3838,'Loyset',0),(3839,'Luar',0),(3840,'Lubbert',0),(3841,'Lucianus',0),(3842,'Lucien',0),(3843,'Ludewicus',0),(3844,'Ludoldus',0),(3845,'Ludovicus',0),(3846,'Ludwig',0),(3847,'Luhre',0),(3848,'Luitfridus',0),(3849,'Luitgarde',0),(3850,'Luitpold',0),(3851,'Luix',0),(3852,'Luk',0),(3853,'Luken',0),(3854,'Luki',0),(3855,'Lukos',0),(3856,'Lul',0),(3857,'Luli',0),(3858,'Lull',0),(3859,'Luppe',0),(3860,'Lutet',0),(3861,'Lutjen',0),(3862,'Luzaide',0),(3863,'Luzea',0),(3864,'Lvfridus',0),(3865,'Lycaon',0),(3866,'Lycaretos',0),(3867,'Lycidas',0),(3868,'Lycomedes',0),(3869,'Lycophon',0),(3870,'Lycophron',0),(3871,'Lycoris',0),(3872,'Lycurgos',0),(3873,'Lycus',0),(3874,'Lydus',0),(3875,'Lyell',0),(3876,'Lygdamis',0),(3877,'Lykomedes',0),(3878,'Lykon',0),(3879,'Lynceus',0),(3880,'Lyolf',0),(3881,'Lyon',0),(3882,'Lyonel',0),(3883,'Lyonell',0),(3884,'Lyonis',0),(3885,'Lysagoras',0),(3886,'Lysandros',0),(3887,'Lysanios',0),(3888,'Lysias',0),(3889,'Lysikles',0),(3890,'Lysimachos',0),(3891,'Lysippos',0),(3892,'Lysippus',0),(3893,'Lysis',0),(3894,'Lyulf',0),(3895,'Lyulph',0),(3896,'Macar',0),(3897,'Macarias',0),(3898,'Macedonius',0),(3899,'Machaon',0),(3900,'Madulnus',0),(3901,'Maelgut',0),(3902,'Maeon',0),(3903,'Magahard',0),(3904,'Maganhard',0),(3905,'Maginfred',0),(3906,'Maginrad',0),(3907,'Maginulf',0),(3908,'Magnentius',0),(3909,'Mago',0),(3910,'Maharbal',0),(3911,'Mahond',0),(3912,'Mahu',0),(3913,'Mahutia',0),(3914,'Maiandrios',0),(3915,'Maillart',0),(3916,'Maillet',0),(3917,'Mainard',0),(3918,'Mainardus',0),(3919,'Mainet',0),(3920,'Mainnet',0),(3921,'Maiorga',0),(3922,'Maiuel',0),(3923,'Maixent',0),(3924,'Majorian',0),(3925,'Maju',0),(3926,'Makarios',0),(3927,'Malabayn',0),(3928,'Malapallin',0),(3929,'Malbert',0),(3930,'Malcolinus',0),(3931,'Malcolum',0),(3932,'Malcude',0),(3933,'Malculinus',0),(3934,'Malculms',0),(3935,'Malculmus',0),(3936,'Malduit',0),(3937,'Maleos',0),(3938,'Males',0),(3939,'Malger',0),(3940,'Malise',0),(3941,'Mallobaudes',0),(3942,'Malo',0),(3943,'Malpramis',0),(3944,'Malprimis',0),(3945,'Malquiant',0),(3946,'Malun',0),(3947,'Mamme',0),(3948,'Mana',0),(3949,'Manard',0),(3950,'Manex',0),(3951,'Manfred',0),(3952,'Mangod',0),(3953,'Manifred',0),(3954,'Manoa',0),(3955,'Mansuetus',0),(3956,'Mantes',0),(3957,'Mantio',0),(3958,'Mantios',0),(3959,'Mantzio',0),(3960,'Manu',0),(3961,'Manzio',0),(3962,'Maore',0),(3963,'Mapen',0),(3964,'Maraulf',0),(3965,'Marc',0),(3966,'Marcel',0),(3967,'Marcian',0),(3968,'Marcion',0),(3969,'Marcomir',0),(3970,'Marcoul',0),(3971,'Marcule',0),(3972,'Marcus',0),(3973,'Marganice',0),(3974,'Margaris',0),(3975,'Maricho',0),(3976,'Maricus',0),(3977,'Marin',0),(3978,'Marius',0),(3979,'Marke',0),(3980,'Markel',0),(3981,'Marko',0),(3982,'Markus',0),(3983,'Marlo',0),(3984,'Marmaduc',0),(3985,'Marmaducus',0),(3986,'Marmedoke',0),(3987,'Marnes',0),(3988,'Maro',0),(3989,'Maron',0),(3990,'Marquardus',0),(3991,'Marque',0),(3992,'Marques',0),(3993,'Marsile',0),(3994,'Marsilion',0),(3995,'Marsyas',0),(3996,'Martel',0),(3997,'Martelet',0),(3998,'Marthanes',0),(3999,'Martin',0),(4000,'Martinet',0),(4001,'Martinianus',0),(4002,'Martino',0),(4003,'Martinus',0),(4004,'Martlet',0),(4005,'Martxel',0),(4006,'Martxelin',0),(4007,'Martxot',0),(4008,'Martyn',0),(4009,'Martyrius',0),(4010,'Maruthus',0),(4011,'Marz',0),(4012,'Maso',0),(4013,'Masso',0),(4014,'Mastor',0),(4015,'Matai',0),(4016,'Matei',0),(4017,'Matfrid',0),(4018,'Mathos',0),(4019,'Matia',0),(4020,'Matraien',0),(4021,'Mattin',0),(4022,'Matto',0),(4023,'Matullus',0),(4024,'Matxin',0),(4025,'Maucolyn',0),(4026,'Mauger',0),(4027,'Maugis',0),(4028,'Maukolum',0),(4029,'Maule',0),(4030,'Maulore',0),(4031,'Maurentius',0),(4032,'Maurianus',0),(4033,'Mauricius',0),(4034,'Maurie',0),(4035,'Maurin',0),(4036,'Maurinus',0),(4037,'Mauris',0),(4038,'Maurus',0),(4039,'Maury',0),(4040,'Maus',0),(4041,'Mausolos',0),(4042,'Maxentius',0),(4043,'Maximianus',0),(4044,'Maximin',0),(4045,'Maximinus',0),(4046,'Maynard',0),(4047,'Mazo',0),(4048,'Mazuste',0),(4049,'Mazzi',0),(4050,'Mecistes',0),(4051,'Mecistios',0),(4052,'Mdard',0),(4053,'Meder',0),(4054,'Mederi',0),(4055,'Medios',0),(4056,'Medon',0),(4057,'Medus',0),(4058,'Meffridus',0),(4059,'Megadates',0),(4060,'Megakles',0),(4061,'Megakreon',0),(4062,'Megapenthes',0),(4063,'Megareus',0),(4064,'Megas',0),(4065,'Megasthenes',0),(4066,'Megathenes',0),(4067,'Meges',0),(4068,'Meginhard',0),(4069,'Megistias',0),(4070,'Megistus',0),(4071,'Mehme',0),(4072,'Meidias',0),(4073,'Meiel',0),(4074,'Meimert',0),(4075,'Meine',0),(4076,'Meinfridus',0),(4077,'Meingotus',0),(4078,'Melampos',0),(4079,'Melampus',0),(4080,'Melanippos',0),(4081,'Melanthios',0),(4082,'Melanthos',0),(4083,'Melas',0),(4084,'Melchert',0),(4085,'Meleagros',0),(4086,'Melegros',0),(4087,'Meles',0),(4088,'Meletius',0),(4089,'Meliboeus',0),(4090,'Melicertes',0),(4091,'Mello',0),(4092,'Melmer',0),(4093,'Melmidoc',0),(4094,'Melminius',0),(4095,'Meme',0),(4096,'Memnon',0),(4097,'Menalcas',0),(4098,'Menandros',0),(4099,'Menares',0),(4100,'Menas',0),(4101,'Mendebal',0),(4102,'Mendiko',0),(4103,'Menekrates',0),(4104,'Menelaos',0),(4105,'Menestas',0),(4106,'Menesthes',0),(4107,'Menesthios',0),(4108,'Menexinos',0),(4109,'Mengotus',0),(4110,'Menke',0),(4111,'Menne',0),(4112,'Mennte',0),(4113,'Menoeces',0),(4114,'Menoitios',0),(4115,'Mentes',0),(4116,'Mentor',0),(4117,'Merbal',0),(4118,'Mercadier',0),(4119,'Mercurius',0),(4120,'Merick',0),(4121,'Meriet',0),(4122,'Merigot',0),(4123,'Meriones',0),(4124,'Mermadak',0),(4125,'Mermerus',0),(4126,'Merobaudes',0),(4127,'Merops',0),(4128,'Merovech',0),(4129,'Mervin',0),(4130,'Mervyn',0),(4131,'Mesaulius',0),(4132,'Mesthles',0),(4133,'Metallo',0),(4134,'Methodios',0),(4135,'Methodius',0),(4136,'Metiochus',0),(4137,'Meto',0),(4138,'Meton',0),(4139,'Metrobius',0),(4140,'Metron',0),(4141,'Metrophanes',0),(4142,'Meuric',0),(4143,'Meurik',0),(4144,'Meurisse',0),(4145,'Meurius',0),(4146,'Meus',0),(4147,'Mezzi',0),(4148,'Michael',0),(4149,'Michaelius',0),(4150,'Michele',0),(4151,'Michell',0),(4152,'Micythos',0),(4153,'Midas',0),(4154,'Midylos',0),(4155,'Miguel',0),(4156,'Mihali',0),(4157,'Mihi',0),(4158,'Mikel',0),(4159,'Mikelar',0),(4160,'Mikelats',0),(4161,'Mikeldi',0),(4162,'Mikkos',0),(4163,'Mikolas',0),(4164,'Mikon',0),(4165,'Milanion',0),(4166,'Mile',0),(4167,'Miles',0),(4168,'Milet',0),(4169,'Milian',0),(4170,'Milo',0),(4171,'Milon',0),(4172,'Milot',0),(4173,'Miltiades',0),(4174,'Mimke',0),(4175,'Min',0),(4176,'Minos',0),(4177,'Mintho',0),(4178,'Miquiel',0),(4179,'Mirande',0),(4180,'Misenus',0),(4181,'Mittainne',0),(4182,'Mitxaut',0),(4183,'Mitxel',0),(4184,'Mnasyllus',0),(4185,'Mnesiphilos',0),(4186,'Mnester',0),(4187,'Mnesus',0),(4188,'Modaharius',0),(4189,'Modares',0),(4190,'Moeris',0),(4191,'Mogel',0),(4192,'Moliones',0),(4193,'Molpagoras',0),(4194,'Monoecus',0),(4195,'Monomachus',0),(4196,'Montxo',0),(4197,'Mopsius',0),(4198,'Mopsus',0),(4199,'Mor',0),(4200,'Morcock',0),(4201,'Morel',0),(4202,'Mores',0),(4203,'Moricius',0),(4204,'Morin',0),(4205,'Moris',0),(4206,'Morise',0),(4207,'Moriset',0),(4208,'Morrice',0),(4209,'Morris',0),(4210,'Morry',0),(4211,'Morsimus',0),(4212,'Morys',0),(4213,'Moryse',0),(4214,'Moschion',0),(4215,'Moschus',0),(4216,'Mourice',0),(4217,'Muato',0),(4218,'Mulius',0),(4219,'Munderic',0),(4220,'Mundo',0),(4221,'Mundus',0),(4222,'Munifrid',0),(4223,'Munio',0),(4224,'Munizo',0),(4225,'Musaeus',0),(4226,'Musaios',0),(4227,'Musko',0),(4228,'Musonius',0),(4229,'Muttines',0),(4230,'Mutu',0),(4231,'Mydon',0),(4232,'Mygdon',0),(4233,'Myles',0),(4234,'Myrsinus',0),(4235,'Myrto',0),(4236,'Mys',0),(4237,'Nab',0),(4238,'Nabar',0),(4239,'Nadilo',0),(4240,'Nagal',0),(4241,'Nahia',0),(4242,'Naimes',0),(4243,'Naimon',0),(4244,'Namatius',0),(4245,'Namus',0),(4246,'Nanno',0),(4247,'Narkissos',0),(4248,'Nastes',0),(4249,'Naubolus',0),(4250,'Naukles',0),(4251,'Naulabates',0),(4252,'Nausithous',0),(4253,'Nauteus',0),(4254,'Nazares',0),(4255,'Neal',0),(4256,'Neale',0),(4257,'Napolion',0),(4258,'Nearchos',0),(4259,'Ned',0),(4260,'Neddie',0),(4261,'Neel',0),(4262,'Neil',0),(4263,'Nel',0),(4264,'Nele',0),(4265,'Neleos',0),(4266,'Nell',0),(4267,'Nelpus',0),(4268,'Neokles',0),(4269,'Neoptolemos',0),(4270,'Neozzo',0),(4271,'Nepotian',0),(4272,'Neritos',0),(4273,'Nestor',0),(4274,'Nvelet',0),(4275,'Ngakaukawa',0),(4276,'Ngati',0),(4277,'Niarchos',0),(4278,'Nibelungus',0),(4279,'Nicaise',0),(4280,'Nicandros',0),(4281,'Nicanor',0),(4282,'Nicephorus',0),(4283,'Nicetas',0),(4284,'Nicetius',0),(4285,'Nicholas',0),(4286,'Nicholaus',0),(4287,'Nichomachus',0),(4288,'Nicias',0),(4289,'Nicodromos',0),(4290,'Nicolao',0),(4291,'Nicolaus',0),(4292,'Nicomachos',0),(4293,'Nicon',0),(4294,'Nidada',0),(4295,'Nidungus',0),(4296,'Niel',0),(4297,'Nigelle',0),(4298,'Nigellus',0),(4299,'Nigs',0),(4300,'Nihe',0),(4301,'Nikandros',0),(4302,'Nikanor',0),(4303,'Nikasios',0),(4304,'Nikeratos',0),(4305,'Niketas',0),(4306,'Nikias',0),(4307,'Nikola',0),(4308,'Nikomachos',0),(4309,'Nikomedes',0),(4310,'Nilus',0),(4311,'Nino',0),(4312,'Nireus',0),(4313,'Nisos',0),(4314,'Nithard',0),(4315,'Niuzilo',0),(4316,'Nivelet',0),(4317,'Nob',0),(4318,'Noe',0),(4319,'Nol',0),(4320,'Noemon',0),(4321,'Noll',0),(4322,'Nolly',0),(4323,'Nomion',0),(4324,'Nonnosus',0),(4325,'Nonnus',0),(4326,'Norbert',0),(4327,'Nordbert',0),(4328,'Nordemann',0),(4329,'Note',0),(4330,'Nothon',0),(4331,'Notker',0),(4332,'Nott',0),(4333,'Numa',0),(4334,'Nuno',0),(4335,'Nute',0),(4336,'Nutkin',0),(4337,'Nutt',0),(4338,'Nuxila',0),(4339,'Nyctinus',0),(4340,'Nygell',0),(4341,'Nymphicus',0),(4342,'Nymphodorus',0),(4343,'Obeko',0),(4344,'Obert',0),(4345,'Ocealus',0),(4346,'Ochesius',0),(4347,'Ochos',0),(4348,'Ocke',0),(4349,'Ocytos',0),(4350,'Odaenathus',0),(4351,'Odard',0),(4352,'Odde',0),(4353,'Oddo',0),(4354,'Ode',0),(4355,'Odger',0),(4356,'Odibrand',0),(4357,'Odinel',0),(4358,'Odius',0),(4359,'Odo',0),(4360,'Odoin',0),(4361,'Odol',0),(4362,'Odon',0),(4363,'Odotheus',0),(4364,'Odouart',0),(4365,'Odovacar',0),(4366,'Odulf',0),(4367,'Odysseus',0),(4368,'Oeagnus',0),(4369,'Oecleus',0),(4370,'Oedipus',0),(4371,'Oenemaus',0),(4372,'Oeneus',0),(4373,'Oenomaus',0),(4374,'Oenopion',0),(4375,'Oenops',0),(4376,'Oenus',0),(4377,'Oger',0),(4378,'Ogerius',0),(4379,'Oggery',0),(4380,'Oggod',0),(4381,'Ogier',0),(4382,'Oicles',0),(4383,'Oidor',0),(4384,'Oier',0),(4385,'Oihan',0),(4386,'Oihenarte',0),(4387,'Oileas',0),(4388,'Oinatz',0),(4389,'Oinaz',0),(4390,'Olentzaro',0),(4391,'Oliatos',0),(4392,'Oliva',0),(4393,'Olivere',0),(4394,'Oliverus',0),(4395,'Olivier',0),(4396,'Olli',0),(4397,'Ollier',0),(4398,'Olly',0),(4399,'Olo',0),(4400,'Oltmann',0),(4401,'Olus',0),(4402,'Olver',0),(4403,'Olybrius',0),(4404,'Olympicus',0),(4405,'Olympio',0),(4406,'Olympiodorus',0),(4407,'Olympius',0),(4408,'Omer',0),(4409,'Omerus',0),(4410,'Omont',0),(4411,'Onamakritos',0),(4412,'Onbera',0),(4413,'Ondart',0),(4414,'Onesilos',0),(4415,'Onesimos',0),(4416,'Onesiphorus',0),(4417,'Onetas',0),(4418,'Onetor',0),(4419,'Onfroi',0),(4420,'Ongile',0),(4421,'Onias',0),(4422,'Onke',0),(4423,'Onne',0),(4424,'Onno',0),(4425,'Onntje',0),(4426,'Onomastos',0),(4427,'Onuphrius',0),(4428,'Ophelestes',0),(4429,'Opilano',0),(4430,'Opilio',0),(4431,'Opites',0),(4432,'Ops',0),(4433,'Orable',0),(4434,'Orain',0),(4435,'Orcus',0),(4436,'Orderic',0),(4437,'Orell',0),(4438,'Orestes',0),(4439,'Oresus',0),(4440,'Orges',0),(4441,'Oriabel',0),(4442,'Oriabiaus',0),(4443,'Oribasius',0),(4444,'Origen',0),(4445,'Orion',0),(4446,'Orius',0),(4447,'Orixe',0),(4448,'Orkatz',0),(4449,'Orland',0),(4450,'Oroites',0),(4451,'Oroitz',0),(4452,'Orpheus',0),(4453,'Orrick',0),(4454,'Orsilochus',0),(4455,'Orsiphantes',0),(4456,'Orthaeus',0),(4457,'Orti',0),(4458,'Ortle',0),(4459,'Ortolfus',0),(4460,'Ortwinus',0),(4461,'Ortzi',0),(4462,'Orythroneus',0),(4463,'Orzaize',0),(4464,'Osasun',0),(4465,'Osbarn',0),(4466,'Osbern',0),(4467,'Osbernus',0),(4468,'Osbertus',0),(4469,'Oscar',0),(4470,'Oseberne',0),(4471,'Osebertus',0),(4472,'Osewold',0),(4473,'Osgar',0),(4474,'Osgarus',0),(4475,'Oskarbi',0),(4476,'Oskell',0),(4477,'Osketel',0),(4478,'Oskitz',0),(4479,'Osman',0),(4480,'Osment',0),(4481,'Osmon',0),(4482,'Osmond',0),(4483,'Osmont',0),(4484,'Osmundus',0),(4485,'Osoitz',0),(4486,'Ospetsu',0),(4487,'Ospin',0),(4488,'Ostadar',0),(4489,'Ostargi',0),(4490,'Ostots',0),(4491,'Ostrogotha',0),(4492,'Osuin',0),(4493,'Osuuald',0),(4494,'Osuualdus',0),(4495,'Osuuol',0),(4496,'Osuuold',0),(4497,'Osuuoldus',0),(4498,'Oswall',0),(4499,'Oswell',0),(4500,'Oswinus',0),(4501,'Oswold',0),(4502,'Oswyn',0),(4503,'Otebon',0),(4504,'Otelin',0),(4505,'Otes',0),(4506,'Othes',0),(4507,'Othi',0),(4508,'Otho',0),(4509,'Othon',0),(4510,'Othone',0),(4511,'Othuel',0),(4512,'Oti',0),(4513,'Otis',0),(4514,'Otker',0),(4515,'Otois',0),(4516,'Oton',0),(4517,'Otreus',0),(4518,'Otrynteus',0),(4519,'Otsando',0),(4520,'Otsoa',0),(4521,'Otsoko',0),(4522,'Ottie',0),(4523,'Ottig',0),(4524,'Otto',0),(4525,'Otuel',0),(4526,'Otus',0),(4527,'Oudart',0),(4528,'Oudet',0),(4529,'Oudin',0),(4530,'Oudinet',0),(4531,'Oudinnet',0),(4532,'Ouein',0),(4533,'Ouen',0),(4534,'Ouin',0),(4535,'Oure',0),(4536,'Ourri',0),(4537,'Ouus',0),(4538,'Ovida',0),(4539,'Owain',0),(4540,'Owayne',0),(4541,'Owen',0),(4542,'Oweyn',0),(4543,'Owin',0),(4544,'Owine',0),(4545,'Owini',0),(4546,'Owun',0),(4547,'Owyne',0),(4548,'Oxarra',0),(4549,'Oxel',0),(4550,'Ozwell',0),(4551,'Pablo',0),(4552,'Pacatian',0),(4553,'Pachymeres',0),(4554,'Paeon',0),(4555,'Paen',0),(4556,'Pagane',0),(4557,'Paganel',0),(4558,'Paganus',0),(4559,'Pagen',0),(4560,'Pagomari',0),(4561,'Paikea',0),(4562,'Pain',0),(4563,'Paios',0),(4564,'Pair',0),(4565,'Palaechthon',0),(4566,'Palaemon',0),(4567,'Palamas',0),(4568,'Palladius',0),(4569,'Pallans',0),(4570,'Pallas',0),(4571,'Palmys',0),(4572,'Palque',0),(4573,'Pammon',0),(4574,'Pamphilus',0),(4575,'Panaetios',0),(4576,'Panaetius',0),(4577,'Panares',0),(4578,'Pancras',0),(4579,'Pancratius',0),(4580,'Pandaros',0),(4581,'Pandion',0),(4582,'Pandulf',0),(4583,'Panionos',0),(4584,'Panites',0),(4585,'Pankratios',0),(4586,'Pannet',0),(4587,'Panpili',0),(4588,'Pantagathus',0),(4589,'Pantares',0),(4590,'Panteleon',0),(4591,'Panthous',0),(4592,'Pantites',0),(4593,'Pantzeska',0),(4594,'Panuel',0),(4595,'Paopeus',0),(4596,'Paora',0),(4597,'Papias',0),(4598,'Papin',0),(4599,'Paraebates',0),(4600,'Parcin',0),(4601,'Pardus',0),(4602,'Paris',0),(4603,'Pariset',0),(4604,'Parmenides',0),(4605,'Parmenion',0),(4606,'Parsefal',0),(4607,'Parthenius',0),(4609,'Parzifal',0),(4610,'Paschalis',0),(4611,'Pasion',0),(4612,'Paskal',0),(4613,'Pastor',0),(4614,'Pataicos',0),(4615,'Pate',0),(4616,'Paterick',0),(4617,'Paternus',0),(4618,'Patey',0),(4619,'Paton',0),(4620,'Patrice',0),(4621,'Patricius',0),(4622,'Patriz',0),(4623,'Patrobas',0),(4624,'Patrobus',0),(4625,'Patroclus',0),(4626,'Patron',0),(4627,'Patrycke',0),(4628,'Patsy',0),(4629,'Pattin',0),(4630,'Pattrik',0),(4631,'Patxi',0),(4632,'Patza',0),(4633,'Paulaui',0),(4634,'Paulin',0),(4635,'Paulo',0),(4636,'Paulus',0),(4637,'Pausanius',0),(4638,'Payn',0),(4639,'Payne',0),(4640,'Paynel',0),(4641,'Pedaeus',0),(4642,'Pedasus',0),(4643,'Pedocles',0),(4644,'Pegarius',0),(4645,'Peirithous',0),(4646,'Peiros',0),(4647,'Peisandros',0),(4648,'Peithon',0),(4649,'Pelagius',0),(4650,'Pelagon',0),(4651,'Pelegon',0),(4652,'Peleus',0),(4653,'Peli',0),(4654,'Pelias',0),(4655,'Pelicles',0),(4656,'Pello',0),(4657,'Pelonus',0),(4658,'Pelopidas',0),(4659,'Peneleos',0),(4660,'Peneus',0),(4661,'Pentheus',0),(4662,'Penthylos',0),(4663,'Peolpidas',0),(4664,'Pepin',0),(4665,'Perceval',0),(4666,'Percevale',0),(4667,'Percheval',0),(4668,'Percival',0),(4669,'Percivale',0),(4670,'Perctarit',0),(4671,'Percyvallus',0),(4672,'Percyvell',0),(4673,'Perdikkas',0),(4674,'Perdix',0),(4675,'Peregrine',0),(4676,'Peregrinus',0),(4677,'Periandros',0),(4678,'Periclymenus',0),(4679,'Perieeres',0),(4680,'Perigenes',0),(4681,'Perikles',0),(4682,'Perimedes',0),(4683,'Perimos',0),(4684,'Periphas',0),(4685,'Periphetes',0),(4686,'Periscus',0),(4687,'Peritas',0),(4688,'Periumus',0),(4689,'Perrando',0),(4690,'Persefall',0),(4691,'Persivell',0),(4692,'Peru',0),(4693,'Peruanton',0),(4694,'Perutxo',0),(4695,'Pes',0),(4696,'Peteos',0),(4697,'Petri',0),(4698,'Petrigai',0),(4699,'Petronas',0),(4700,'Petruche',0),(4701,'Petrus',0),(4702,'Peukestes',0),(4703,'Phaedo',0),(4704,'Phaenippos',0),(4705,'Phaeops',0),(4706,'Phaestus',0),(4707,'Phaidon',0),(4708,'Phaidriades',0),(4709,'Phalanthus',0),(4710,'Phalces',0),(4711,'Phalinos',0),(4712,'Phanagoras',0),(4713,'Phancis',0),(4714,'Phanes',0),(4715,'Phanias',0),(4716,'Phantias',0),(4717,'Phareman',0),(4718,'Pharnaces',0),(4719,'Phausius',0),(4720,'Phegeus',0),(4721,'Pheidias',0),(4722,'Pheidippides',0),(4723,'Pheidon',0),(4724,'Phelipe',0),(4725,'Phelipot',0),(4726,'Phelippe',0),(4727,'Phelippot',0),(4728,'Pheliset',0),(4729,'Phelyp',0),(4730,'Phelypp',0),(4731,'Phemius',0),(4732,'Phereclus',0),(4733,'Pherecydes',0),(4734,'Pheres',0),(4735,'Pheronactus',0),(4736,'Phidias',0),(4737,'Phigaleios',0),(4738,'Phil',0),(4739,'Philagrius',0),(4740,'Philagros',0),(4741,'Philaon',0),(4742,'Philaretus',0),(4743,'Philbert',0),(4744,'Philcox',0),(4745,'Phileas',0),(4746,'Philemon',0),(4747,'Philetor',0),(4748,'Philibert',0),(4749,'Philiot',0),(4750,'Philip',0),(4751,'Philipon',0),(4752,'Philipot',0),(4753,'Philippe',0),(4754,'Philippicus',0),(4755,'Philippot',0),(4756,'Philippus',0),(4757,'Philiskos',0),(4758,'Philistos',0),(4759,'Philkin',0),(4760,'Phillipos',0),(4761,'Phillippus',0),(4762,'Phillipus',0),(4763,'Philocion',0),(4764,'Philocrates',0),(4765,'Philoctetes',0),(4766,'Philocypros',0),(4767,'Philoetius',0),(4768,'Philogus',0),(4769,'Philokles',0),(4770,'Philokrates',0),(4771,'Philolaos',0),(4772,'Philologus',0),(4773,'Philomen',0),(4774,'Philomenes',0),(4775,'Philometer',0),(4776,'Philon',0),(4777,'Philonikos',0),(4778,'Philopoemon',0),(4779,'Philostratos',0),(4780,'Philostratus',0),(4781,'Philotas',0),(4782,'Philotectes',0),(4783,'Philoxenos',0),(4784,'Philoxenus',0),(4785,'Philpoemon',0),(4786,'Philpot',0),(4787,'Phineus',0),(4788,'Phintias',0),(4789,'Phipp',0),(4790,'Phitelet',0),(4791,'Phlaris',0),(4792,'Phlegon',0),(4793,'Phlios',0),(4794,'Phoebammon',0),(4795,'Phoenix',0),(4796,'Phoibus',0),(4797,'Phoinix',0),(4798,'Phoitios',0),(4799,'Phokas',0),(4800,'Phokion',0),(4801,'Phorbas',0),(4802,'Phorcys',0),(4803,'Phormion',0),(4804,'Phormos',0),(4805,'Photinus',0),(4806,'Photius',0),(4807,'Phrixus',0),(4808,'Phrynichos',0),(4809,'Phrynikos',0),(4810,'Phrynon',0),(4811,'Phylacus',0),(4812,'Phylas',0),(4813,'Phylypp',0),(4814,'Phytheon',0),(4815,'Phythian',0),(4816,'Pi',0),(4817,'Piarres',0),(4818,'Piccolet',0),(4819,'Picot',0),(4820,'Pidytes',0),(4821,'Pierre',0),(4822,'Pierres',0),(4823,'Pigres',0),(4824,'Piligrim',0),(4825,'Pinabel',0),(4826,'Pinder',0),(4827,'Pip',0),(4828,'Pippin',0),(4829,'Piri',0),(4830,'Pirithoos',0),(4831,'Pirmin',0),(4832,'Pisistratos',0),(4833,'Pistias',0),(4834,'Pitama',0),(4835,'Pittacos',0),(4836,'Pittacus',0),(4837,'Pittheus',0),(4838,'Pixodarus',0),(4839,'Pizzo',0),(4840,'Plades',0),(4841,'Platiau',0),(4842,'Pleistarchos',0),(4843,'Pleistos',0),(4844,'Plutarch',0),(4845,'Plutinus',0),(4846,'Podaeleirus',0),(4847,'Podaleirus',0),(4848,'Podalinus',0),(4849,'Podarces',0),(4850,'Podargos',0),(4851,'Podaroes',0),(4852,'Podes',0),(4853,'Poeas',0),(4854,'Poecas',0),(4855,'Poimen',0),(4856,'Poince',0),(4857,'Poincet',0),(4858,'Polemion',0),(4859,'Polentzi',0),(4860,'Poliadas',0),(4861,'Pollio',0),(4862,'Polyas',0),(4863,'Polybius',0),(4864,'Polyctor',0),(4865,'Polydectes',0),(4866,'Polydeuces',0),(4867,'Polydius',0),(4868,'Polydoros',0),(4869,'Polyeides',0),(4870,'Polygonus',0),(4871,'Polykleitos',0),(4872,'Polykles',0),(4873,'Polykritos',0),(4874,'Polymedes',0),(4875,'Polyneices',0),(4876,'Polypemon',0),(4877,'Polyperchon',0),(4878,'Polyphemous',0),(4879,'Polyphetes',0),(4880,'Polyphontes',0),(4881,'Polypoetes',0),(4882,'Polyxeinus',0),(4883,'Ponce',0),(4884,'Poncet',0),(4885,'Ponche',0),(4886,'Ponteus',0),(4887,'Popin',0),(4888,'Popiniau',0),(4889,'Poppa',0),(4890,'Poppe',0),(4891,'Poppens',0),(4892,'Poppo',0),(4893,'Porchier',0),(4894,'Porphyrios',0),(4895,'Porphyrius',0),(4896,'Poseidon',0),(4897,'Posides',0),(4898,'Posidonios',0),(4899,'Potamius',0),(4900,'Potamon',0),(4901,'Potkin',0),(4902,'Poufille',0),(4903,'Poz',0),(4904,'Prades',0),(4905,'Praesentinus',0),(4906,'Praetextatus',0),(4907,'Pratinos',0),(4908,'Praxilaus',0),(4909,'Praxis',0),(4910,'Praxiteles',0),(4911,'Praxites',0),(4912,'Presebal',0),(4913,'Prexinos',0),(4914,'Priam',0),(4915,'Priamon',0),(4916,'Pricion',0),(4917,'Principius',0),(4918,'Prinetadas',0),(4919,'Priscian',0),(4920,'Priskos',0),(4921,'Probus',0),(4922,'Procrustes',0),(4923,'Proctus',0),(4924,'Proetus',0),(4925,'Prokles',0),(4926,'Prokopios',0),(4927,'Prokrustes',0),(4928,'Proreus',0),(4929,'Protagoras',0),(4930,'Protesilaus',0),(4931,'Prothoenor',0),(4932,'Prothous',0),(4933,'Protogenes',0),(4934,'Protus',0),(4935,'Proxenos',0),(4936,'Prymneus',0),(4937,'Prytanis',0),(4938,'Ptolemaios',0),(4939,'Ptolomaeus',0),(4940,'Pudes',0),(4941,'Puhi',0),(4942,'Pupt',0),(4943,'Puvis',0),(4944,'Pylades',0),(4945,'Pylaemenes',0),(4946,'Pylaeus',0),(4947,'Pylartes',0),(4948,'Pylas',0),(4949,'Pylenor',0),(4950,'Pyris',0),(4951,'Pyrrhus',0),(4952,'Pythagoras',0),(4953,'Pytheas',0),(4954,'Pythes',0),(4955,'Pythios',0),(4956,'Pythogenes',0),(4957,'Quabin',0),(4958,'Quenall',0),(4959,'Quintin',0),(4960,'Quintinus',0),(4961,'Quito',0),(4962,'Raaf',0),(4963,'Rab',0),(4964,'Rabbie',0),(4965,'Rabel',0),(4966,'Radagaisus',0),(4967,'Radamanthos',0),(4968,'Radigis',0),(4969,'Radoald',0),(4970,'Radolf',0),(4971,'Radulf',0),(4972,'Radulfus',0),(4973,'Rafe',0),(4974,'Raff',0),(4975,'Raffo',0),(4976,'Rafold',0),(4977,'Raganald',0),(4978,'Raganfrid',0),(4979,'Raganhard',0),(4980,'Raganher',0),(4981,'Ragenald',0),(4982,'Raginhart',0),(4983,'Raginmund',0),(4984,'Raginpert',0),(4985,'Ragnfred',0),(4986,'Raguenel',0),(4987,'Raguet',0),(4988,'Rahere',0),(4989,'Rahier',0),(4990,'Raignald',0),(4991,'Raiimond',0),(4992,'Raimbaud',0),(4993,'Raimbaut',0),(4994,'Raimer',0),(4995,'Raimond',0),(4996,'Raimund',0),(4997,'Raimundus',0),(4998,'Rainald',0),(4999,'Rainaldus',0),(5000,'Rainard',0),(5001,'Rainerius',0),(5002,'Rainerus',0),(5003,'Rainier',0),(5004,'Raitin',0),(5005,'Ralf',0),(5006,'Rammius',0),(5007,'Rampo',0),(5008,'Ran',0),(5009,'Ranald',0),(5010,'Rand',0),(5011,'Randal',0),(5012,'Randall',0),(5013,'Randle',0),(5014,'Randolph',0),(5015,'Randoul',0),(5016,'Randulfus',0),(5017,'Randull',0),(5018,'Randy',0),(5019,'Rangi',0),(5020,'Rankin',0),(5021,'Rannulf',0),(5022,'Rannulfus',0),(5023,'Ranulf',0),(5024,'Ranulfus',0),(5025,'Ranulph',0),(5026,'Ranulphus',0),(5027,'Raolet',0),(5028,'Raolin',0),(5029,'Raollet',0),(5030,'Raollin',0),(5031,'Raoul',0),(5032,'Raoulet',0),(5033,'Raoulin',0),(5034,'Rasequin',0),(5035,'Ratchis',0),(5036,'Ratier',0),(5037,'Ratilo',0),(5038,'Rauf',0),(5039,'Rauffe',0),(5040,'Raulf',0),(5041,'Raullin',0),(5042,'Raulyn',0),(5043,'Rausimod',0),(5044,'Rautio',0),(5045,'Rauve',0),(5046,'Rawkin',0),(5047,'Rawlin',0),(5048,'Raymundus',0),(5049,'Raynaldus',0),(5050,'Rayner',0),(5051,'Raynerus',0),(5052,'Raynoldus',0),(5053,'Razo',0),(5054,'Recared',0),(5055,'Reccared',0),(5056,'Recceswinth',0),(5057,'Rechiar',0),(5058,'Rechimund',0),(5059,'Recitach',0),(5060,'Redway',0),(5061,'Reginald',0),(5062,'Reginalde',0),(5063,'Reginaldus',0),(5064,'Reginar',0),(5065,'Regino',0),(5066,'Rgnier',0),(5067,'Reignald',0),(5068,'Reignolde',0),(5069,'Reimfred',0),(5070,'Reimond',0),(5071,'Reimund',0),(5072,'Reinald',0),(5073,'Reinboldus',0),(5074,'Reinfred',0),(5075,'Reinfrid',0),(5076,'Reinfridus',0),(5077,'Reinhold',0),(5078,'Reinold',0),(5079,'Reinoldus',0),(5080,'Reipert',0),(5081,'Rekitach',0),(5082,'Remert',0),(5083,'Remfrey',0),(5084,'Remi',0),(5085,'Remia',0),(5086,'Remier',0),(5087,'Remir',0),(5088,'Remismund',0),(5089,'Remmer',0),(5090,'Remon',0),(5091,'Remondin',0),(5092,'Remonnet',0),(5093,'Remont',0),(5094,'Rmy',0),(5095,'Renard',0),(5096,'Renart',0),(5097,'Renaud',0),(5098,'Renaudin',0),(5099,'Renaut',0),(5100,'Renfred',0),(5101,'Renfry',0),(5102,'Renier',0),(5103,'Renko',0),(5104,'Reno',0),(5105,'Renodet',0),(5106,'Renoldus',0),(5107,'Renonys',0),(5108,'Renost',0),(5109,'Renouart',0),(5110,'Renouf',0),(5111,'Renout',0),(5112,'Reolus',0),(5113,'Respa',0),(5114,'Resse',0),(5115,'Retemeris',0),(5116,'Reto',0),(5117,'Rewa',0),(5118,'Rex',0),(5119,'Reymnd',0),(5120,'Reynald',0),(5121,'Reynard',0),(5122,'Reynaud',0),(5123,'Reyner',0),(5124,'Reynfred',0),(5125,'Reynfrey',0),(5126,'Reynold',0),(5127,'Reynoldus',0),(5128,'Rhadamanthos',0),(5129,'Rhesus',0),(5130,'Rhexenor',0),(5131,'Rhima',0),(5132,'Ribald',0),(5133,'Ribes',0),(5134,'Ricard',0),(5135,'Ricardus',0),(5136,'Ricaud',0),(5137,'Rich',0),(5138,'Richal',0),(5139,'Richarde',0),(5140,'Richardin',0),(5141,'Richardus',0),(5142,'Richart',0),(5143,'Richemanus',0),(5144,'Richeut',0),(5145,'Richie',0),(5146,'Richier',0),(5147,'Richomer',0),(5148,'Richomeres',0),(5149,'Ricimer',0),(5150,'Rick',0),(5151,'Rickert',0),(5152,'Ricket',0),(5153,'Ricohard',0),(5154,'Ricon',0),(5155,'Rictiovarus',0),(5156,'Rikiar',0),(5157,'Ringerus',0),(5158,'Rionet',0),(5159,'Ripertus',0),(5160,'Rique',0),(5161,'Riquebourc',0),(5162,'Riquier',0),(5163,'Riso',0),(5164,'Rizon',0),(5165,'Rob',0),(5166,'Robard',0),(5167,'Robbie',0),(5168,'Rober',0),(5169,'Robertus',0),(5170,'Robin',0),(5171,'Robinet',0),(5172,'Robion',0),(5173,'Robyn',0),(5174,'Rocelinus',0),(5175,'Rodbertus',0),(5176,'Roderic',0),(5177,'Roderick',0),(5178,'Rodney',0),(5179,'Rodolf',0),(5180,'Rodolph',0),(5181,'Rodolphe',0),(5182,'Roduulf',0),(5183,'Rogatus',0),(5184,'Rogerin',0),(5185,'Rogerius',0),(5186,'Rogerus',0),(5187,'Roget',0),(5188,'Rogier',0),(5189,'Roguelin',0),(5190,'Roland',0),(5191,'Rolandus',0),(5192,'Rolant',0),(5193,'Roley',0),(5194,'Rolf',0),(5195,'Rolfe',0),(5196,'Rolft',0),(5197,'Rolland',0),(5198,'Rollant',0),(5199,'Rollin',0),(5200,'Rollo',0),(5201,'Rolph',0),(5202,'Romainne',0),(5203,'Romayne',0),(5204,'Romuald',0),(5205,'Ronald',0),(5206,'Roncin',0),(5207,'Rongo',0),(5208,'Roolf',0),(5209,'Roricus',0),(5210,'Roscelin',0),(5211,'Rosser',0),(5212,'Rostand',0),(5213,'Rotari',0),(5214,'Rotbert',0),(5215,'Rotbertus',0),(5216,'Rotgerius',0),(5217,'Rothad',0),(5218,'Rothari',0),(5219,'Rotrou',0),(5220,'Roucaud',0),(5221,'Rouland',0),(5222,'Roulant',0),(5223,'Roule',0),(5224,'Roulf',0),(5225,'Roumain',0),(5226,'Roumiet',0),(5227,'Rowland',0),(5228,'Rowley',0),(5229,'Ruald',0),(5230,'Rubertus',0),(5231,'Rudegerus',0),(5232,'Rudesind',0),(5233,'Rudolfus',0),(5234,'Rufier',0),(5235,'Ruisko',0),(5236,'Runo',0),(5237,'Russell',0),(5238,'Rusto',0),(5239,'Ruthardus',0),(5240,'Rychard',0),(5241,'Rycharde',0),(5242,'Saba',0),(5243,'Sabas',0),(5244,'Sabin',0),(5245,'Sabyllos',0),(5246,'Sadagares',0),(5247,'Sadun',0),(5248,'Saer',0),(5249,'Saerus',0),(5250,'Safrax',0),(5251,'Sagar',0),(5252,'Sagard',0),(5253,'Sagarus',0),(5254,'Saillot',0),(5255,'Sainte',0),(5256,'Salbatore',0),(5257,'Salicar',0),(5258,'Salla',0),(5259,'Salmoneus',0),(5260,'Samer',0),(5261,'Samo',0),(5262,'Samson',0),(5263,'Sandaili',0),(5264,'Sander',0),(5265,'Sanders',0),(5266,'Sandre',0),(5267,'Sandrin',0),(5268,'Sanduru',0),(5269,'Sandy',0),(5270,'Sangiban',0),(5271,'Sanguin',0),(5272,'Sansalas',0),(5273,'Santi',0),(5274,'Santikurtz',0),(5275,'Santio',0),(5276,'Santutxo',0),(5277,'Santxo',0),(5278,'Santxol',0),(5279,'Saphrax',0),(5280,'Sarapammon',0),(5281,'Sarilo',0),(5282,'Sarpedon',0),(5283,'Sarus',0),(5284,'Sasoin',0),(5285,'Satabus',0),(5286,'Satordi',0),(5287,'Satyros',0),(5288,'Saunder',0),(5289,'Saundre',0),(5290,'Savaric',0),(5291,'Sawney',0),(5292,'Sawnie',0),(5293,'Saxo',0),(5294,'Sayer',0),(5295,'Scaios',0),(5296,'Scamandius',0),(5297,'Scamandrius',0),(5298,'Schedius',0),(5299,'Scholasticus',0),(5300,'Sconea',0),(5301,'Scylax',0),(5302,'Scyllias',0),(5303,'Scythas',0),(5304,'Searl',0),(5305,'Searle',0),(5306,'Seaward',0),(5307,'Sebastianus',0),(5308,'Sebastos',0),(5309,'Seber',0),(5310,'Sede',0),(5311,'Segar',0),(5312,'Segarus',0),(5313,'Segeric',0),(5314,'Seguin',0),(5315,'Sehier',0),(5316,'Sein',0),(5317,'Seisames',0),(5318,'Selagus',0),(5319,'Selatse',0),(5320,'Seldomus',0),(5321,'Selenas',0),(5322,'Selepos',0),(5323,'Seleukos',0),(5324,'Selle',0),(5325,'Selles',0),(5326,'Seme',0),(5327,'Semeno',0),(5328,'Sendoa',0),(5329,'Senebaut',0),(5330,'Sengrat',0),(5331,'Senuthius',0),(5332,'Sequin',0),(5333,'Serell',0),(5334,'Sergius',0),(5335,'Seri',0),(5336,'Serill',0),(5337,'Serle',0),(5338,'Serlo',0),(5339,'Serlon',0),(5340,'Sernays',0),(5341,'Serrell',0),(5342,'Serrill',0),(5343,'Sesuldo',0),(5344,'Seuuard',0),(5345,'Seuuardus',0),(5346,'Seven',0),(5347,'Sevestre',0),(5348,'Sevrin',0),(5349,'Sewal',0),(5350,'Sewale',0),(5351,'Sewallus',0),(5352,'Seward',0),(5353,'Sewell',0),(5354,'Shapur',0),(5355,'Shilgen',0),(5356,'Shipitbaal',0),(5357,'Sibertus',0),(5358,'Sibico',0),(5359,'Sibilo',0),(5360,'Siboldus',0),(5361,'Sibragtus',0),(5362,'Sibratus',0),(5363,'Sicard',0),(5364,'Sicho',0),(5365,'Sicinnos',0),(5366,'Siculus',0),(5367,'Sidimund',0),(5368,'Siebrand',0),(5369,'Siefke',0),(5370,'Siegmyrth',0),(5371,'Sifridus',0),(5372,'Sigan',0),(5373,'Sigebert',0),(5374,'Sigenandus',0),(5375,'Sigeric',0),(5376,'Sigesar',0),(5377,'Sigibald',0),(5378,'Sigibert',0),(5379,'Sigibuld',0),(5380,'Sigismund',0),(5381,'Sigisvult',0),(5382,'Sikke',0),(5383,'Silanos',0),(5384,'Silban',0),(5385,'Silenos',0),(5386,'Silvestre',0),(5387,'Simmias',0),(5388,'Simo',0),(5389,'Simocatta',0),(5390,'Simoisius',0),(5391,'Simonides',0),(5392,'Sindel',0),(5393,'Sindila',0),(5394,'Sindo',0),(5395,'Sinibaldo',0),(5396,'Sinis',0),(5397,'Sinon',0),(5398,'Sippas',0),(5399,'Sirion',0),(5400,'Sirom',0),(5401,'Siromos',0),(5402,'Sisbert',0),(5403,'Sisebut',0),(5404,'Sisenand',0),(5405,'Sisyphus',0),(5406,'Sito',0),(5407,'Sittas',0),(5408,'Situli',0),(5409,'Sivis',0),(5410,'Siwardus',0),(5411,'Sjamme',0),(5412,'Skiron',0),(5413,'Smaragdus',0),(5414,'Smindyrides',0),(5415,'Smintheus',0),(5416,'Snaracho',0),(5417,'Snarung',0),(5418,'Snato',0),(5419,'Snazi',0),(5420,'Soas',0),(5421,'Socus',0),(5422,'Sohalet',0),(5423,'Sohier',0),(5424,'Soin',0),(5425,'Soke',0),(5426,'Sophanes',0),(5427,'Sophokles',0),(5428,'Soranus',0),(5429,'Sosibios',0),(5430,'Sosicles',0),(5431,'Sosigines',0),(5432,'Sosilus',0),(5433,'Sosimenes',0),(5434,'Sosipatros',0),(5435,'Sosthenes',0),(5436,'Sostias',0),(5437,'Sostratos',0),(5438,'Soter',0),(5439,'Sotil',0),(5440,'Souni',0),(5441,'Speciosus',0),(5442,'Spertias',0),(5443,'Speudon',0),(5444,'Speusippos',0),(5445,'Spinther',0),(5446,'Spirodion',0),(5447,'Staas',0),(5448,'Stace',0),(5449,'Stacey',0),(5450,'Stachys',0),(5451,'Stacius',0),(5452,'Stacy',0),(5453,'Stallo',0),(5454,'Starchari',0),(5455,'Stauracius',0),(5456,'Steffen',0),(5457,'Stentor',0),(5458,'Stephane',0),(5459,'Stephen',0),(5460,'Stesagoras',0),(5461,'Stesanor',0),(5462,'Stesilaus',0),(5463,'Sthenelaus',0),(5464,'Sthenelus',0),(5465,'Stichius',0),(5466,'Stielf',0),(5467,'Stilicho',0),(5468,'Stolos',0),(5469,'Strabo',0),(5470,'Strachys',0),(5471,'Strategius',0),(5472,'Stratios',0),(5473,'Straton',0),(5474,'Strophantes',0),(5475,'Strophius',0),(5476,'Strymon',0),(5477,'Su',0),(5478,'Suatrius',0),(5479,'Sueridus',0),(5480,'Sugar',0),(5481,'Suger',0),(5482,'Sugoi',0),(5483,'Suidbert',0),(5484,'Suidger',0),(5485,'Sumar',0),(5486,'Sunericus',0),(5487,'Sunnia',0),(5488,'Sunno',0),(5489,'Suntje',0),(5490,'Suppo',0),(5491,'Sustrai',0),(5492,'Sweert',0),(5493,'Swikerus',0),(5494,'Swirt',0),(5495,'Swittert',0),(5496,'Syagricus',0),(5497,'Syagrius',0),(5498,'Syagros',0),(5499,'Syennesis',0),(5500,'Syloson',0),(5501,'Sylvester',0),(5502,'Symeon',0),(5503,'Symeonius',0),(5504,'Synesius',0),(5505,'Syriack',0),(5506,'Syward',0),(5507,'Sywardus',0),(5508,'Tadica',0),(5509,'Taiaho',0),(5510,'Taillefer',0),(5511,'Taillemache',0),(5512,'Taine',0),(5513,'Taino',0),(5514,'Taki',0),(5515,'Talaemenes',0),(5516,'Talaos',0),(5517,'Talaus',0),(5518,'Talbot',0),(5519,'Talebot',0),(5520,'Tallo',0),(5521,'Talon',0),(5522,'Talos',0),(5523,'Talthybios',0),(5524,'Tams',0),(5525,'Tame',0),(5526,'Tamme',0),(5527,'Tanais',0),(5528,'Tanca',0),(5529,'Tancard',0),(5530,'Tancred',0),(5531,'Tancrede',0),(5532,'Tane',0),(5533,'Tankard',0),(5534,'Tarchaniotes',0),(5535,'Tarchon',0),(5536,'Tardu',0),(5537,'Tartalo',0),(5538,'Tassart',0),(5539,'Tassilo',0),(5540,'Tato',0),(5541,'Taua',0),(5542,'Taunui',0),(5543,'Taureas',0),(5544,'Taurin',0),(5545,'Tawno',0),(5546,'Te',0),(5547,'Tebaeus',0),(5548,'Tebald',0),(5549,'Tebaud',0),(5550,'Tebbe',0),(5551,'Tecton',0),(5552,'Tedbaldus',0),(5553,'Tedric',0),(5554,'Teebald',0),(5555,'Teias',0),(5556,'Teiresias',0),(5557,'Teja',0),(5558,'Tekori',0),(5559,'Tekukuni',0),(5560,'Telamon',0),(5561,'Telekles',0),(5562,'Telemacho',0),(5563,'Telemachos',0),(5564,'Telemachus',0),(5565,'Telephos',0),(5566,'Telephus',0),(5567,'Telesinus',0),(5568,'Telesphorus',0),(5569,'Telines',0),(5570,'Tellias',0),(5571,'Tellis',0),(5572,'Tello',0),(5573,'Telys',0),(5574,'Tem',0),(5575,'Temenos',0),(5576,'Temuera',0),(5577,'Tendao',0),(5578,'Tenes',0),(5579,'Tenny',0),(5580,'Tenthredon',0),(5581,'Teodbald',0),(5582,'Teodric',0),(5583,'Tere',0),(5584,'Tereus',0),(5585,'Tericius',0),(5586,'Terillos',0),(5587,'Terrell',0),(5588,'Terric',0),(5589,'Terrick',0),(5590,'Terricus',0),(5591,'Terry',0),(5592,'Tescelin',0),(5593,'Tetbald',0),(5594,'Tetramnestus',0),(5595,'Tettrino',0),(5596,'Teucer',0),(5597,'Teukros',0),(5598,'Teutamos',0),(5599,'Teuthranes',0),(5600,'Teuthras',0),(5601,'Teutobod',0),(5602,'Tevenot',0),(5603,'Thales',0),(5604,'Thaleus',0),(5605,'Thalpius',0),(5606,'Thalysios',0),(5607,'Thancharat',0),(5608,'Thancheri',0),(5609,'Thancred',0),(5610,'Thankmar',0),(5611,'Tharuaro',0),(5612,'Tharybis',0),(5613,'Thaulos',0),(5614,'Thaumastus',0),(5615,'Theagenes',0),(5616,'Theages',0),(5617,'Theas',0),(5618,'Theasides',0),(5619,'Thebaldus',0),(5620,'Thee',0),(5621,'Thela',0),(5622,'Themistius',0),(5623,'Theobald',0),(5624,'Theobaldus',0),(5626,'Theoclymnius',0),(5627,'Theoctistus',0),(5628,'Theocydes',0),(5629,'Theodahad',0),(5630,'Thodard',0),(5631,'Theodbald',0),(5632,'Theodehad',0),(5633,'Theodekles',0),(5634,'Theodemar',0),(5635,'Theodemer',0),(5636,'Theoderic',0),(5637,'Theodericus',0),(5638,'Theoderid',0),(5639,'Theodilacus',0),(5640,'Theodo',0),(5641,'Theodoracius',0),(5642,'Theodore',0),(5643,'Theodoretus',0),(5644,'Theodoric',0),(5645,'Theodoricus',0),(5646,'Theodoros',0),(5647,'Theodorus',0),(5648,'Theodotus',0),(5649,'Theodric',0),(5650,'Theodulf',0),(5651,'Theodulph',0),(5652,'Theodulus',0),(5653,'Theogenius',0),(5654,'Theognis',0),(5655,'Theomestor',0),(5656,'Theomestros',0),(5657,'Theon',0),(5658,'Theopemptus',0),(5659,'Theophanes',0),(5660,'Theophilius',0),(5661,'Theophilus',0),(5662,'Theophrastos',0),(5663,'Theophrastus',0),(5664,'Theophylact',0),(5667,'Theopompos',0),(5668,'Theopompus',0),(5669,'Theopropides',0),(5670,'Theoros',0),(5671,'Theos',0),(5672,'Theotimus',0),(5673,'Theotpert',0),(5674,'Theramenes',0),(5675,'Therapon',0),(5676,'Theras',0),(5677,'Thero',0),(5678,'Theron',0),(5679,'Thersandros',0),(5680,'Therseandros',0),(5681,'Thersilochus',0),(5682,'Thersites',0),(5683,'Thessalos',0),(5684,'Thestor',0),(5685,'Thettalos',0),(5686,'Theudebert',0),(5687,'Theudegisel',0),(5689,'Theuderic',0),(5690,'Theudis',0),(5691,'Theudoald',0),(5692,'Theudobald',0),(5693,'Theutgaud',0),(5694,'Theutlich',0),(5695,'Thibaud',0),(5696,'Thidrek',0),(5697,'Thibaut',0),(5698,'Thieme',0),(5699,'Thiemmo',0),(5700,'Thierri',0),(5701,'Thierry',0),(5702,'Thietmar',0),(5703,'Thilko',0),(5704,'Thim',0),(5705,'Thirkell',0),(5706,'Thiudimir',0),(5707,'Thiudorieks',0),(5708,'Thoas',0),(5709,'Thomas',0),(5710,'Thon',0),(5711,'Thonyn',0),(5712,'Thon',0),(5713,'Thorald',0),(5714,'Thorax',0),(5715,'Thore',0),(5716,'Thorismud',0),(5717,'Thorismund',0),(5718,'Thorkill',0),(5719,'Thorold',0),(5720,'Thouche',0),(5721,'Thrasamund',0),(5722,'Thrasaric',0),(5723,'Thrasidaios',0),(5724,'Thrasilaus',0),(5725,'Thrasius',0),(5726,'Thrasybulos',0),(5727,'Thrasyllus',0),(5728,'Thrasymedes',0),(5729,'Thraustila',0),(5730,'Threspotus',0),(5731,'Thrustanus',0),(5732,'Thrystan',0),(5733,'Thukydides',0),(5734,'Thurstan',0),(5735,'Thurstanus',0),(5736,'Thurstin',0),(5737,'Thybaudin',0),(5738,'Thybaut',0),(5739,'Thyestes',0),(5740,'Thymoetes',0),(5741,'Thymotes',0),(5742,'Thyrsis',0),(5743,'Thyrsos',0),(5744,'Tiaki',0),(5745,'Tiakinga',0),(5746,'Tib',0),(5747,'Tibald',0),(5748,'Tibalt',0),(5749,'Tibaut',0),(5750,'Tibbald',0),(5751,'Tibbott',0),(5752,'Tibost',0),(5753,'Tibout',0),(5754,'Tiebaut',0),(5755,'Tiele',0),(5756,'Tierri',0),(5757,'Tiessot',0),(5758,'Tika',0),(5759,'Timagenidas',0),(5760,'Timagoras',0),(5761,'Timais',0),(5762,'Timanthes',0),(5763,'Timasion',0),(5764,'Timasitheus',0),(5765,'Timesithius',0),(5766,'Timm',0),(5767,'Timnes',0),(5768,'Timo',0),(5769,'Timoleon',0),(5770,'Timon',0),(5771,'Timonax',0),(5772,'Timote',0),(5773,'Timotheus',0),(5774,'Timoti',0),(5775,'Timoxenos',0),(5776,'Timozel',0),(5777,'Tinnelt',0),(5778,'Tipi',0),(5779,'Tiro',0),(5780,'Tirrell',0),(5781,'Tirynthius',0),(5782,'Tisamenos',0),(5783,'Tisandros',0),(5784,'Tisias',0),(5785,'Tithonius',0),(5786,'Titormos',0),(5787,'Tityrus',0),(5788,'Tjalf',0),(5789,'Tjark',0),(5790,'Tlepolemus',0),(5791,'Tmolus',0),(5792,'Toa',0),(5793,'Tobar',0),(5794,'Todor',0),(5795,'Toms',0),(5796,'Tnjes',0),(5797,'Torleu',0),(5798,'Torphin',0),(5799,'Torquil',0),(5800,'Totakoxe',0),(5801,'Totila',0),(5802,'Trafstila',0),(5803,'Trapsta',0),(5804,'Trasaric',0),(5805,'Trasaricus',0),(5806,'Trasimondo',0),(5807,'Trechus',0),(5808,'Tribigild',0),(5809,'Tribonianus',0),(5810,'Tribunas',0),(5811,'Triopas',0),(5812,'Triptolemus',0),(5813,'Tristan',0),(5814,'Tristian',0),(5815,'Triston',0),(5816,'Tristram',0),(5817,'Triton',0),(5818,'Troezenus',0),(5819,'Trophimus',0),(5820,'Trophnus',0),(5821,'Tros',0),(5822,'Trostheri',0),(5823,'Trostila',0),(5824,'Truhtilo',0),(5825,'Trustan',0),(5826,'Trustram',0),(5827,'Trypho',0),(5828,'Trystrem',0),(5829,'Tuaivi',0),(5830,'Tufa',0),(5831,'Tuluin',0),(5832,'Turbertus',0),(5833,'Turgis',0),(5834,'Turold',0),(5835,'Turoldus',0),(5836,'Turpin',0),(5837,'Turquan',0),(5838,'Turrianus',0),(5839,'Turstan',0),(5840,'Turstanus',0),(5841,'Tursten',0),(5842,'Turstin',0),(5843,'Turstinus',0),(5844,'Tuste',0),(5845,'Tutain',0),(5846,'Tuu',0),(5847,'Tuyon',0),(5848,'Txanton',0),(5849,'Txaran',0),(5850,'Txartiko',0),(5851,'Txatxu',0),(5852,'Txerran',0),(5853,'Txeru',0),(5854,'Txilar',0),(5855,'Tximitx',0),(5856,'Txindoki',0),(5857,'Txomin',0),(5858,'Txordon',0),(5859,'Txurio',0),(5860,'Tybalt',0),(5861,'Tybaut',0),(5862,'Tybost',0),(5863,'Tybout',0),(5864,'Tychaeus',0),(5865,'Tydeides',0),(5866,'Tydeus',0),(5867,'Tymnes',0),(5868,'Tyndareus',0),(5869,'Tyndarios',0),(5870,'Tyon',0),(5871,'Tyrell',0),(5872,'Tzimisas',0),(5873,'Tzittas',0),(5874,'Ubarna',0),(5875,'Ubben',0),(5876,'Ubelteso',0),(5877,'Ubendu',0),(5878,'Ucalegon',0),(5879,'Ucco',0),(5880,'Uchered',0),(5881,'Ucke',0),(5882,'Uctred',0),(5883,'Udalaitz',0),(5884,'Udo',0),(5885,'Udona',0),(5886,'Uelert',0),(5887,'Ueli',0),(5888,'Ugaitz',0),(5889,'Ughtred',0),(5890,'Ugurtz',0),(5891,'Ugutz',0),(5892,'Uhin',0),(5893,'Uhredus',0),(5894,'Uhtred',0),(5895,'Uidt',0),(5896,'Ulert',0),(5897,'Ulfert',0),(5898,'Ulfilas',0),(5899,'Ulger',0),(5900,'Ulpt',0),(5901,'Ulricus',0),(5902,'Ulta',0),(5903,'Uluric',0),(5904,'Umea',0),(5905,'Umfray',0),(5906,'Umfrey',0),(5907,'Umfridus',0),(5908,'Umphrey',0),(5909,'Unai',0),(5910,'Unax',0),(5911,'Unigild',0),(5912,'Unila',0),(5913,'Unimund',0),(5914,'Uno',0),(5915,'Unsenis',0),(5916,'Untel',0),(5917,'Uptet',0),(5918,'Ur',0),(5919,'Uraias',0),(5920,'Uranius',0),(5921,'Urbasa',0),(5922,'Urbez',0),(5923,'Urbicus',0),(5924,'Urdaspal',0),(5925,'Urdin',0),(5926,'Urian',0),(5927,'Urianus',0),(5928,'Urien',0),(5929,'Urki',0),(5930,'Urko',0),(5931,'Urre',0),(5932,'Urritz',0),(5933,'Urs',0),(5934,'Urtats',0),(5935,'Urti',0),(5936,'Urtsin',0),(5937,'Urtsua',0),(5938,'Urtun',0),(5939,'Urtungo',0),(5940,'Urtzi',0),(5941,'Uryene',0),(5942,'Uwe',0),(5943,'Uwen',0),(5944,'Uzuri',0),(5945,'Vaanes',0),(5946,'Vacho',0),(5948,'Valamer',0),(5949,'Valamir',0),(5950,'Valantinus',0),(5951,'Valaravans',0),(5952,'Valdebron',0),(5953,'Valentinus',0),(5954,'Valia',0),(5955,'Valter',0),(5956,'Vandalarius',0),(5957,'Vandil',0),(5958,'Vane',0),(5959,'Vannes',0),(5960,'Varazes',0),(5961,'Varin',0),(5962,'Varocher',0),(5963,'Vasacius',0),(5964,'Vasey',0),(5965,'Vauquelin',0),(5966,'Vedast',0),(5967,'Veduco',0),(5968,'Veitel',0),(5969,'Venantius',0),(5970,'Venerandus',0),(5971,'Venyse',0),(5972,'Vetericus',0),(5973,'Vetranio',0),(5974,'Vetranis',0),(5975,'Vettias',0),(5976,'Vzian',0),(5977,'Viator',0),(5978,'Vicelin',0),(5979,'Victor',0),(5980,'Victorinus',0),(5981,'Vidans',0),(5982,'Videric',0),(5983,'Vidigoia',0),(5984,'Vidimir',0),(5985,'Viel',0),(5986,'Viennet',0),(5987,'Vigilius',0),(5988,'Vigor',0),(5989,'Viliame',0),(5990,'Viliaris',0),(5991,'Vilihame',0),(5992,'Villiame',0),(5993,'Vince',0),(5994,'Vincenot',0),(5995,'Vincent',0),(5996,'Vincentius',0),(5997,'Vincey',0),(5998,'Vinitharius',0),(5999,'Virus',0),(6000,'Visimar',0),(6001,'Vital',0),(6002,'Vitalianus',0),(6003,'Vitalius',0),(6004,'Vitel',0),(6005,'Vithimiris',0),(6006,'Vithmiris',0),(6007,'Vitigis',0),(6008,'Vittamar',0),(6009,'Vitus',0),(6010,'Vivianus',0),(6011,'Vivien',0),(6012,'Volusian',0),(6013,'Vulmar',0),(6014,'Vultuulf',0),(6015,'Vvillequin',0),(6016,'Vyell',0),(6017,'Waco',0),(6018,'Waibilo',0),(6019,'Waido',0),(6020,'Waihoroi',0),(6021,'Waimar',0),(6022,'Waimiria',0),(6023,'Waiofar',0),(6024,'Waisale',0),(6025,'Wala',0),(6026,'Walahfrid',0),(6027,'Walahmar',0),(6028,'Walaric',0),(6029,'Walchelim',0),(6030,'Walchelin',0),(6031,'Walcher',0),(6032,'Waldef',0),(6033,'Waldeof',0),(6034,'Waldeve',0),(6035,'Waldew',0),(6036,'Waldhar',0),(6037,'Waldhere',0),(6038,'Waldibert',0),(6039,'Waldief',0),(6040,'Waldipert',0),(6041,'Waldive',0),(6042,'Waldolanus',0),(6043,'Waldomar',0),(6044,'Waleran',0),(6045,'Walganus',0),(6046,'Walhbert',0),(6047,'Waliko',0),(6048,'Walkelin',0),(6049,'Walkelinus',0),(6050,'Wallevus',0),(6051,'Wallia',0),(6052,'Wally',0),(6053,'Waloco',0),(6054,'Walpurga',0),(6055,'Walt',0),(6056,'Walterius',0),(6057,'Walterus',0),(6058,'Waltgaud',0),(6059,'Wamba',0),(6060,'Wandilo',0),(6061,'Wandregisel',0),(6063,'Wandrille',0),(6064,'Warenheri',0),(6065,'Warin',0),(6066,'Wariner',0),(6067,'Warinhari',0),(6068,'Warinus',0),(6069,'Warmann',0),(6070,'Warnerius',0),(6071,'Warnerus',0),(6072,'Warren',0),(6073,'Warrenus',0),(6074,'Wasili',0),(6075,'Wat',0),(6076,'Water',0),(6077,'Watje',0),(6078,'Watkin',0),(6079,'Watkyn',0),(6080,'Watt',0),(6081,'Wattie',0),(6082,'Watty',0),(6083,'Wauter',0),(6084,'Wazo',0),(6085,'Wealdtheow',0),(6086,'Wecelo',0),(6087,'Weert',0),(6088,'Weffel',0),(6089,'Weidheri',0),(6090,'Weila',0),(6091,'Weinert',0),(6092,'Weintje',0),(6093,'Wella',0),(6094,'Welp',0),(6095,'Welpo',0),(6096,'Wene',0),(6097,'Wenert',0),(6098,'Wercha',0),(6099,'Wercrata',0),(6100,'Werdo',0),(6101,'Werinbert',0),(6102,'Werner',0),(6103,'Wernerus',0),(6104,'Wesh',0),(6105,'Wezilo',0),(6106,'Whatahui',0),(6107,'Wherehiko',0),(6108,'Wibert',0),(6109,'Wibil',0),(6110,'Wichard',0),(6111,'Wichmann',0),(6112,'Widargelt',0),(6113,'Widigast',0),(6114,'Wido',0),(6115,'Widogast',0),(6116,'Widradus',0),(6117,'Wiebrand',0),(6118,'Wiebt',0),(6119,'Wigandus',0),(6120,'Wigayn',0),(6121,'Wigo',0),(6122,'Wigstan',0),(6123,'Wihtred',0),(6124,'Wikerus',0),(6125,'Wilcke',0),(6126,'Wilcock',0),(6127,'Wilecoc',0),(6128,'Wilfred',0),(6129,'Wilhelm',0),(6130,'Wilhelmus',0),(6131,'Wiliam',0),(6132,'Wiliame',0),(6133,'Wilkie',0),(6134,'Wilkin',0),(6135,'Wilko',0),(6136,'Will',0),(6137,'Willahelm',0),(6138,'Willamar',0),(6139,'Willcock',0),(6140,'Willehad',0),(6141,'Willehelm',0),(6142,'Willelm',0),(6143,'Willelmus',0),(6144,'Willet',0),(6145,'William',0),(6146,'Williame',0),(6147,'Willibald',0),(6148,'Willibrord',0),(6149,'Willie',0),(6150,'Willmot',0),(6151,'Wilmot',0),(6152,'Wilred',0),(6153,'Wimarc',0),(6154,'Wimark',0),(6155,'Winebaud',0),(6156,'Winguric',0),(6157,'Winicho',0),(6158,'Wintar',0),(6159,'Wintherus',0),(6160,'Wintri',0),(6161,'Wirtje',0),(6162,'Wiscar',0),(6163,'Wiscard',0),(6164,'Wischard',0),(6165,'Wisgarus',0),(6166,'Wistan',0),(6167,'Wistanus',0),(6168,'Withari',0),(6169,'Withekindus',0),(6170,'Witige',0),(6171,'Wittigis',0),(6172,'Wittiza',0),(6173,'Wlfric',0),(6174,'Wlfriche',0),(6175,'Wlvricus',0),(6176,'Wobias',0),(6177,'Wocco',0),(6178,'Woco',0),(6179,'Wolkan',0),(6180,'Woltje',0),(6181,'Wortwinus',0),(6182,'Wracwulf',0),(6183,'Wulfram',0),(6184,'Wulfric',0),(6185,'Wultgar',0),(6186,'Wulurich',0),(6187,'Wunnihad',0),(6188,'Wurm',0),(6189,'Wy',0),(6190,'Wyat',0),(6191,'Wyliame',0),(6192,'Wylymot',0),(6193,'Wyman',0),(6194,'Wymar',0),(6195,'Wymarc',0),(6196,'Wymare',0),(6197,'Wymark',0),(6198,'Wymer',0),(6199,'Wymerus',0),(6200,'Wymon',0),(6201,'Wymond',0),(6202,'Wymund',0),(6203,'Wynkyn',0),(6204,'Wyon',0),(6205,'Wyschardus',0),(6206,'Wystan',0),(6207,'Ydevert',0),(6208,'Ymbert',0),(6209,'Yngerame',0),(6210,'Yon',0),(6211,'Ypolit',0),(6212,'Ypolitus',0),(6213,'Yric',0),(6214,'Ysembert',0),(6215,'Yuli',0),(6216,'Yvain',0),(6217,'Yve',0),(6218,'Yves',0),(6219,'Yvet',0),(6220,'Yvon',0),(6221,'Yvone',0),(6222,'Yvonnet',0),(6223,'Yvonus',0),(6224,'Ywain',0),(6225,'Xabat',0),(6226,'Xabier',0),(6227,'Xalbador',0),(6228,'Xantalen',0),(6229,'Xanthippos',0),(6230,'Xanthippus',0),(6231,'Xanthos',0),(6232,'Xanti',0),(6233,'Xarles',0),(6234,'Xavier',0),(6235,'Xefe',0),(6236,'Xenagoras',0),(6237,'Xenokrates',0),(6238,'Xenophanes',0),(6239,'Xenophon',0),(6240,'Ximun',0),(6241,'Xiphilinus',0),(6242,'Xofre',0),(6243,'Xuban',0),(6244,'Xurdin',0),(6245,'Xuthos',0),(6246,'Xuthus',0),(6247,'Zabal',0),(6248,'Zadornin',0),(6249,'Zagreus',0),(6250,'Zamolxis',0),(6251,'Zaracas',0),(6252,'Zarles',0),(6253,'Zebe',0),(6254,'Zeledon',0),(6255,'Zelimir',0),(6256,'Zemarchus',0),(6257,'Zenicetes',0),(6258,'Zeno',0),(6259,'Zenobius',0),(6260,'Zenodoros',0),(6261,'Zephyrinus',0),(6262,'Zernin',0),(6263,'Zeru',0),(6264,'Zeruko',0),(6265,'Zethus',0),(6266,'Zeuxidamos',0),(6267,'Zeuxis',0),(6268,'Zigor',0),(6269,'Zilar',0),(6270,'Zindel',0),(6271,'Zindelo',0),(6272,'Zinnridi',0),(6273,'Zinzo',0),(6274,'Ziper',0),(6275,'Zobe',0),(6276,'Zohiartze',0),(6277,'Zoil',0),(6278,'Zoilus',0),(6279,'Zoltan',0),(6280,'Zorion',0),(6281,'Zosimus',0),(6282,'Zuhaitz',0),(6283,'Zumar',0),(6284,'Zunbeltz',0),(6285,'Zuri',0),(6286,'Zuriko',0),(6287,'Zuzen',0),(6288,'Zwentibold',0),(6289,'Aafte',1),(6290,'Aals',1),(6291,'Aalz',1),(6292,'Aalfte',1),(6293,'Aalina',1),(6294,'Aaline',1),(6295,'Aalis',1),(6296,'Aaliz',1),(6297,'Aaltje',1),(6298,'Aanor',1),(6299,'Ababilia',1),(6300,'Abarne',1),(6301,'Abauntza',1),(6302,'Abbatissa',1),(6303,'Abbelina',1),(6304,'Abelie',1),(6305,'Abelota',1),(6306,'Abte',1),(6307,'Acelina',1),(6308,'Achaia',1),(6309,'Achethe',1),(6310,'Achradina',1),(6311,'Actae',1),(6312,'Act',1),(6313,'Ada',1),(6314,'Adala',1),(6315,'Adalberta',1),(6316,'Adaleide',1),(6317,'Adalheid',1),(6318,'Adalheidis',1),(6319,'Adalind',1),(6320,'Adalindis',1),(6321,'Adaliz',1),(6322,'Adallinda',1),(6323,'Adallindis',1),(6324,'Adalmut',1),(6325,'Adalrada',1),(6326,'Adaltrude',1),(6327,'Adaltrutis',1),(6328,'Adaluuidis',1),(6329,'Adalwara',1),(6330,'Adalwif',1),(6331,'Adda',1),(6332,'Addela',1),(6333,'Ade',1),(6334,'Adeia',1),(6335,'Adela',1),(6336,'Adelaide',1),(6337,'Adelaidis',1),(6338,'Adelais',1),(6339,'Adeldreda',1),(6340,'Adelena',1),(6341,'Adelheid',1),(6342,'Adelheidis',1),(6343,'Adelicia',1),(6344,'Adelid',1),(6345,'Adelie',1),(6346,'Adelin',1),(6347,'Adelina',1),(6348,'Adeline',1),(6349,'Adelisa',1),(6350,'Adeliz',1),(6351,'Adeliza',1),(6352,'Adeltrudis',1),(6353,'Adelysia',1),(6354,'Adeodata',1),(6355,'Adere',1),(6356,'Adte',1),(6357,'Adhela',1),(6358,'Adhelina',1),(6359,'Adila',1),(6360,'Admiranda',1),(6361,'Adonie',1),(6362,'Adula',1),(6363,'Aduna',1),(6364,'Adwala',1),(6365,'Aebbe',1),(6366,'Aedelflete',1),(6367,'Aeditha',1),(6368,'Aediva',1),(6369,'Aedon',1),(6370,'Aegiolea',1),(6371,'Aegle',1),(6372,'Aeileua',1),(6373,'Aeilgyuu',1),(6374,'Aeldid',1),(6375,'Aeldiet',1),(6376,'Aeldit',1),(6377,'Aeleis',1),(6378,'Aelesia',1),(6379,'Aelffled',1),(6380,'Aelfgiuee',1),(6381,'Aelfgiva',1),(6382,'Aelfgyd',1),(6383,'Aelfled',1),(6384,'Aelfleda',1),(6385,'Aelfryth',1),(6386,'Aelgytha',1),(6387,'Aelienor',1),(6388,'Aelina',1),(6389,'Aelis',1),(6390,'Aelisia',1),(6391,'Aelive',1),(6392,'Aelizia',1),(6393,'Aelueua',1),(6394,'Aenor',1),(6395,'Aerope',1),(6396,'Aes',1),(6397,'Aeschine',1),(6398,'Aetheldreda',1),(6399,'Aethelfleada',1),(6400,'Aethelind',1),(6401,'Aethelinda',1),(6402,'Aethelthryth',1),(6403,'Aetheria',1),(6404,'Aethre',1),(6405,'Agace',1),(6406,'Agacia',1),(6407,'Agacie',1),(6408,'Agamede',1),(6409,'Aganippe',1),(6410,'Agape',1),(6411,'Agapia',1),(6412,'Agarista',1),(6413,'Agas',1),(6414,'Agase',1),(6415,'Agate',1),(6416,'Agatha',1),(6417,'Agath',1),(6418,'Agathonice',1),(6419,'Agave',1),(6420,'Agentrudis',1),(6421,'Aggie',1),(6422,'Agglethrudis',1),(6423,'Aginaga',1),(6424,'Agirre',1),(6425,'Aglaia',1),(6426,'Aglaurus',1),(6427,'Agnella',1),(6428,'Agnesot',1),(6429,'Agneta',1),(6430,'Agnetis',1),(6431,'Agnus',1),(6432,'Agote',1),(6433,'Agurne',1),(6434,'Agurtzane',1),(6435,'Ahelis',1),(6436,'Ahelissa',1),(6437,'Aiago',1),(6438,'Aiala',1),(6439,'Aicelina',1),(6440,'Aicusa',1),(6441,'Aiglante',1),(6442,'Aiglente',1),(6443,'Aiglentine',1),(6444,'Aikaterine',1),(6445,'Ailda',1),(6446,'Aildreda',1),(6447,'Ailed',1),(6448,'Aileth',1),(6449,'Aileua',1),(6450,'Aileve',1),(6451,'Ailfled',1),(6452,'Ailhiet',1),(6453,'Ailid',1),(6454,'Ailiet',1),(6455,'Ailith',1),(6456,'Ailitha',1),(6457,'Ailiue',1),(6458,'Ailiva',1),(6459,'Ailleda',1),(6460,'Ailleth',1),(6461,'Ailletha',1),(6462,'Ailliva',1),(6463,'Ailova',1),(6464,'Ailufa',1),(6465,'Aimie',1),(6466,'Ainara',1),(6467,'Ainhoa',1),(6468,'Ainize',1),(6469,'Ainoa',1),(6470,'Aintza',1),(6471,'Aintzane',1),(6472,'Aintzile',1),(6473,'Aintzine',1),(6474,'Ainuesa',1),(6475,'Aiora',1),(6476,'Aisone',1),(6477,'Aithra',1),(6478,'Aitziber',1),(6479,'Aizeti',1),(6480,'Aizkorri',1),(6481,'Aizpea',1),(6482,'Aka',1),(6483,'Akelda',1),(6484,'Akenehi',1),(6485,'Aketa',1),(6486,'Akorda',1),(6487,'Ala',1),(6488,'Alaine',1),(6489,'Alainne',1),(6490,'Alais',1),(6491,'Alaitz',1),(6492,'Alazas',1),(6493,'Alazne',1),(6494,'Alba',1),(6495,'Albelenda',1),(6496,'Alberad',1),(6497,'Alberadis',1),(6498,'Albie',1),(6499,'Albizua',1),(6500,'Albrad',1),(6501,'Albrade',1),(6502,'Albray',1),(6503,'Albreda',1),(6504,'Albree',1),(6505,'Albruga',1),(6506,'Alburch',1),(6507,'Alburg',1),(6508,'Alcandre',1),(6509,'Alcestis',1),(6510,'Alcippe',1),(6511,'Alcmene',1),(6512,'Alcyone',1),(6513,'Alda',1),(6514,'Alded',1),(6515,'Aldet',1),(6516,'Aldeth',1),(6517,'Aldgid',1),(6518,'Aldguda',1),(6519,'Aldgudana',1),(6520,'Aldgyth',1),(6521,'Aldid',1),(6522,'Aldiet',1),(6523,'Aldieth',1),(6524,'Aldietha',1),(6525,'Aldis',1),(6526,'Aldith',1),(6527,'Alditha',1),(6528,'Aldiva',1),(6529,'Aldiytha',1),(6530,'Aldruth',1),(6531,'Alduara',1),(6532,'Alduenza',1),(6533,'Aldus',1),(6534,'Aldusa',1),(6535,'Alduse',1),(6536,'Aldyet',1),(6537,'Aldyt',1),(6538,'Aleidis',1),(6539,'Aleire',1),(6540,'Alemene',1),(6541,'Aleneite',1),(6542,'Alesandese',1),(6543,'Alesia',1),(6544,'Alesone',1),(6545,'Alesta',1),(6546,'Aleusa',1),(6547,'Alexandra',1),(6548,'Alexandria',1),(6549,'Alfgarda',1),(6550,'Alfild',1),(6551,'Alfled',1),(6552,'Alfleda',1),(6553,'Alflent',1),(6554,'Alflet',1),(6555,'Alfleta',1),(6556,'Alfreda',1),(6557,'Algaia',1),(6558,'Algyva',1),(6559,'Alhflaed',1),(6560,'Alhflead',1),(6561,'Alia',1),(6562,'Alianor',1),(6563,'Alianora',1),(6564,'Alice',1),(6565,'Alicen',1),(6566,'Alicia',1),(6567,'Alid',1),(6568,'Alienor',1),(6569,'Alienora',1),(6570,'Alina',1),(6571,'Aline',1),(6572,'Alis',1),(6573,'Alisaundre',1),(6574,'Alisceon',1),(6575,'Alise',1),(6576,'Alison',1),(6577,'Alisone',1),(6578,'Alisoun',1),(6579,'Aliss',1),(6580,'Alissende',1),(6581,'Alith',1),(6582,'Aliua',1),(6583,'Aliva',1),(6584,'Aliz',1),(6585,'Alize',1),(6586,'Alkain',1),(6587,'Alkmena',1),(6588,'Allemande',1),(6589,'Allie',1),(6590,'Allison',1),(6591,'Alma',1),(6592,'Almika',1),(6593,'Almt',1),(6594,'Almuth',1),(6595,'Almuza',1),(6596,'Aloa',1),(6597,'Alodia',1),(6598,'Alot',1),(6599,'Alote',1),(6600,'Alpaida',1),(6601,'Alpais',1),(6602,'Alse',1),(6603,'Alsneta',1),(6604,'Alson',1),(6605,'Althaea',1),(6606,'Althaia',1),(6607,'Althea',1),(6608,'Altzagarate',1),(6609,'Alueua',1),(6610,'Alueue',1),(6611,'Aluina',1),(6612,'Aluinnia',1),(6613,'Aluiua',1),(6614,'Alverat',1),(6615,'Alvered',1),(6616,'Alveua',1),(6617,'Alveva',1),(6618,'Alviua',1),(6619,'Alviva',1),(6620,'Alycie',1),(6621,'Alyna',1),(6622,'Alyon',1),(6623,'Alys',1),(6624,'Alyson',1),(6625,'Alysone',1),(6626,'Alyva',1),(6627,'Ama',1),(6628,'Amabil',1),(6629,'Amabili',1),(6630,'Amabilia',1),(6631,'Amabilis',1),(6632,'Amabilla',1),(6633,'Amabillia',1),(6634,'Amable',1),(6635,'Amaduena',1),(6636,'Amagoia',1),(6637,'Amaia',1),(6638,'Amalasuintha',1),(6639,'Amalberga',1),(6640,'Amalberta',1),(6641,'Amalbirga',1),(6642,'Amalfrida',1),(6643,'Amalfriede',1),(6644,'Amalgunde',1),(6645,'Amalone',1),(6646,'Amalur',1),(6647,'Amane',1),(6648,'Amarhyllis',1),(6649,'Amata',1),(6650,'Amathea',1),(6651,'Amatheia',1),(6652,'Amatza',1),(6653,'Ambra',1),(6654,'Amee',1),(6655,'Ameis',1),(6656,'Amelia',1),(6657,'Amelina',1),(6658,'Ameline',1),(6659,'Amelinne',1),(6660,'Amellia',1),(6661,'Amelot',1),(6662,'Amelyn',1),(6663,'Ameria',1),(6664,'Amestrin',1),(6665,'Amestris',1),(6666,'Amets',1),(6667,'Ametza',1),(6668,'Amfelice',1),(6669,'Amfelisia',1),(6670,'Amflis',1),(6671,'Amflisa',1),(6672,'Amflisia',1),(6673,'Amia',1),(6674,'Amiable',1),(6675,'Amic',1),(6676,'Amica',1),(6677,'Amicabilis',1),(6678,'Amicia',1),(6679,'Amicie',1),(6680,'Amie',1),(6681,'Amilamia',1),(6682,'Amilia',1),(6683,'Amiot',1),(6684,'Amira',1),(6685,'Amis',1),(6686,'Amiscia',1),(6687,'Amisia',1),(6688,'Amke',1),(6689,'Ammij',1),(6690,'Ammio',1),(6691,'Ammy',1),(6692,'Amoltrud',1),(6693,'Amparo',1),(6694,'Amphelice',1),(6695,'Amphelicia',1),(6696,'Amphillis',1),(6697,'Amphithoe',1),(6698,'Amphitrite',1),(6699,'Ampinomene',1),(6700,'Amplias',1),(6701,'Amulberga',1),(6702,'Amuna',1),(6703,'Amya',1),(6704,'Amycia',1),(6705,'Amye',1),(6706,'Amyfelyse',1),(6707,'Anabel',1),(6708,'Anabell',1),(6709,'Anabella',1),(6710,'Anabill',1),(6711,'Anabilla',1),(6712,'Anabille',1),(6713,'Anabul',1),(6714,'Anachorita',1),(6715,'Anaeaxi',1),(6716,'Anaiansi',1),(6717,'Anais',1),(6718,'Anastas',1),(6719,'Anastase',1),(6720,'Anastasia',1),(6721,'Anastatia',1),(6722,'Anaurra',1),(6723,'Anchoret',1),(6724,'Anchoretta',1),(6725,'Ancret',1),(6726,'Ancreta',1),(6727,'Ancrett',1),(6728,'Ande',1),(6729,'Anderazu',1),(6730,'Andere',1),(6731,'Anderexo',1),(6732,'Anderkina',1),(6733,'Andia',1),(6734,'Andikona',1),(6735,'Andion',1),(6736,'Andolie',1),(6737,'Andone',1),(6738,'Andonine',1),(6739,'Andre',1),(6740,'Andrea',1),(6741,'Andregoto',1),(6742,'Andrekina',1),(6743,'Andremisa',1),(6744,'Andreva',1),(6745,'Andrezuria',1),(6746,'Andrie',1),(6747,'Andromeda',1),(6748,'Ane',1),(6749,'Ans',1),(6750,'Anese',1),(6751,'Anesot',1),(6752,'Anestasia',1),(6753,'Anfelisa',1),(6754,'Anfelise',1),(6755,'Angaret',1),(6756,'Angel',1),(6757,'Angela',1),(6758,'Angelet',1),(6759,'Angelu',1),(6760,'Angnes',1),(6761,'Angnet',1),(6762,'Anis',1),(6763,'Aniz',1),(6764,'Ankerita',1),(6765,'Ankharet',1),(6766,'Anna',1),(6767,'Annabele',1),(6768,'Annabell',1),(6769,'Annabella',1),(6770,'Annabelle',1),(6771,'Annable',1),(6772,'Annais',1),(6773,'Annaple',1),(6774,'Annas',1),(6775,'Anne',1),(6776,'Anneis',1),(6777,'Annes',1),(6778,'Annestas',1),(6779,'Anneyce',1),(6780,'Anneys',1),(6781,'Anneyse',1),(6782,'Annice',1),(6783,'Annina',1),(6784,'Annis',1),(6785,'Annise',1),(6786,'Annke',1),(6787,'Annor',1),(6788,'Annora',1),(6789,'Annot',1),(6790,'Annys',1),(6791,'Anora',1),(6792,'Anoz',1),(6793,'Ansa',1),(6794,'Anselda',1),(6795,'Ansere',1),(6796,'Ansgard',1),(6797,'Ansitruda',1),(6798,'Anstes',1),(6799,'Anstey',1),(6800,'Anstice',1),(6801,'Anstis',1),(6802,'Anstiss',1),(6803,'Anstruda',1),(6804,'Antehe',1),(6805,'Anteia',1),(6806,'Antheia',1),(6807,'Anthoinette',1),(6808,'Anthousa',1),(6809,'Anthusa',1),(6810,'Anticleia',1),(6811,'Antigone',1),(6812,'Antiochis',1),(6813,'Antiope',1),(6814,'Antipatra',1),(6815,'Antje',1),(6816,'Antonia',1),(6817,'Antxone',1),(6818,'Antziasko',1),(6819,'Anunciacion',1),(6820,'Anyes',1),(6821,'Anysia',1),(6822,'Anzoy',1),(6823,'Apain',1),(6824,'Apala',1),(6825,'Apeline',1),(6826,'Aplin',1),(6827,'Apoline',1),(6828,'Appa',1),(6829,'Applin',1),(6830,'Appolina',1),(6831,'Appollonia',1),(6832,'Apseudes',1),(6833,'Araba',1),(6834,'Arabella',1),(6835,'Arabia',1),(6836,'Arable',1),(6837,'Aragundia',1),(6838,'Araitz',1),(6839,'Arama',1),(6840,'Arana',1),(6841,'Arandon',1),(6842,'Arantxa',1),(6843,'Arantza',1),(6844,'Arantzazu',1),(6845,'Arnzazu',1),(6846,'Araoz',1),(6847,'Arbeiza',1),(6848,'Arbekoa',1),(6849,'Arbell',1),(6850,'Arbella',1),(6851,'Arburua',1),(6852,'Areagne',1),(6853,'Areitio',1),(6854,'Areria',1),(6855,'Arete',1),(6856,'Arethusa',1),(6857,'Argeia',1),(6858,'Argentea',1),(6859,'Argentina',1),(6860,'Argi',1),(6861,'Argie',1),(6862,'Argiloain',1),(6863,'Ariadne',1),(6864,'Arianna',1),(6865,'Arie',1),(6866,'Arima',1),(6867,'Arisbe',1),(6868,'Aristonike',1),(6869,'Aristophane',1),(6870,'Ariturri',1),(6871,'Aritzaga',1),(6872,'Aritzeta',1),(6873,'Arkija',1),(6874,'Arlas',1),(6875,'Arlette',1),(6876,'Arluzea',1),(6877,'Armedaa',1),(6878,'Armentaria',1),(6879,'Armigil',1),(6880,'Armola',1),(6881,'Arnaude',1),(6882,'Arnotegi',1),(6883,'Aroha',1),(6884,'Arraitz',1),(6885,'Arrako',1),(6886,'Arrate',1),(6887,'Arrazubi',1),(6888,'Arrene',1),(6889,'Arreo',1),(6890,'Arriaka',1),(6891,'Arrieta',1),(6892,'Arrigorria',1),(6893,'Arriluzea',1),(6894,'Arritokieta',1),(6895,'Arrixaka',1),(6896,'Arrizabalaga',1),(6897,'Arrosa',1),(6898,'Arsinoe',1),(6899,'Artaynta',1),(6900,'Artazostra',1),(6901,'Artea',1),(6902,'Artederreta',1),(6903,'Artemidora',1),(6904,'Artemisia',1),(6905,'Artiga',1),(6906,'Artiza',1),(6907,'Artizar',1),(6908,'Artystone',1),(6909,'Artzanegi',1),(6910,'Artzeina',1),(6911,'Asa',1),(6912,'Ascelina',1),(6913,'Asceline',1),(6914,'Ascelinne',1),(6915,'Ascelot',1),(6916,'Aschilt',1),(6917,'Ascilia',1),(6918,'Ashena',1),(6919,'Asiturri',1),(6920,'Askoa',1),(6921,'Aspasia',1),(6922,'Asselyna',1),(6923,'Assuncion',1),(6924,'Astera',1),(6925,'Astrid',1),(6926,'Astyoche',1),(6927,'Astyocheia',1),(6928,'Atalanta',1),(6929,'Atallo',1),(6930,'At',1),(6931,'Athala',1),(6932,'Athanasia',1),(6933,'Athela',1),(6934,'Athelesia',1),(6935,'Atheleys',1),(6936,'Athelflead',1),(6937,'Athelina',1),(6938,'Athelinda',1),(6939,'Athelis',1),(6940,'Athelisa',1),(6941,'Athelisia',1),(6942,'Athelyna',1),(6943,'Athis',1),(6944,'Atilda',1),(6945,'Atossa',1),(6946,'Atotz',1),(6947,'Atsegie',1),(6948,'Atxarte',1),(6949,'Aua',1),(6950,'Auacyn',1),(6951,'Aubere',1),(6952,'Aubirge',1),(6953,'Aubourc',1),(6954,'Aubreda',1),(6955,'Aubrey',1),(6956,'Aude',1),(6957,'Audiarda',1),(6958,'Audofleda',1),(6959,'Audrey',1),(6960,'Audry',1),(6961,'Audrye',1),(6962,'Auekin',1),(6963,'Auelin',1),(6964,'Auelina',1),(6965,'Auelyna',1),(6966,'Auge',1),(6967,'Augo',1),(6968,'Augustina',1),(6969,'Auic',1),(6970,'Auice',1),(6971,'Auicia',1),(6972,'Auin',1),(6973,'Auina',1),(6974,'Auisia',1),(6975,'Auizia',1),(6976,'Aunflis',1),(6977,'Aunphelice',1),(6978,'Aurela',1),(6979,'Aurelia',1),(6980,'Aureliana',1),(6981,'Aurelne',1),(6982,'Auria',1),(6983,'Auriana',1),(6984,'Aurildis',1),(6985,'Auriol',1),(6986,'Auriola',1),(6987,'Aurkene',1),(6988,'Austie',1),(6989,'Austorga',1),(6991,'Autonoe',1),(6992,'Auxesia',1),(6993,'Ava',1),(6994,'Avacyn',1),(6995,'Aveis',1),(6996,'Avekin',1),(6997,'Avelina',1),(6998,'Aveline',1),(6999,'Avelot',1),(7000,'Avelyn',1),(7001,'Averell',1),(7002,'Averil',1),(7003,'Averill',1),(7004,'Aveza',1),(7005,'Avice',1),(7006,'Avicia',1),(7007,'Avila',1),(7008,'Avilina',1),(7009,'Avin',1),(7010,'Avina',1),(7011,'Avis',1),(7012,'Avoca',1),(7013,'Avril',1),(7014,'Awdrie',1),(7015,'Awhina',1),(7016,'Axiothea',1),(7017,'Axpe',1),(7018,'Ayala',1),(7019,'Aye',1),(7020,'Ayla',1),(7021,'Ayled',1),(7022,'Ayleth',1),(7023,'Aylett',1),(7024,'Ayliua',1),(7025,'Aylofa',1),(7026,'Aylufa',1),(7027,'Aylyetta',1),(7028,'Ayzebel',1),(7029,'Azella',1),(7030,'Azitain',1),(7031,'Baano',1),(7032,'Bab',1),(7033,'Babbe',1),(7034,'Babcock',1),(7035,'Babel',1),(7036,'Babesne',1),(7037,'Babeth',1),(7038,'Babetta',1),(7039,'Babitt',1),(7040,'Bable',1),(7041,'Babs',1),(7042,'Badelota',1),(7043,'Badia',1),(7044,'Baiakua',1),(7045,'Bakarne',1),(7046,'Bakene',1),(7047,'Baldechildis',1),(7048,'Balere',1),(7049,'Baltelda',1),(7051,'Balthildis',1),(7052,'Bar',1),(7053,'Barazorda',1),(7054,'Barbara',1),(7055,'Barbary',1),(7056,'Barbata',1),(7057,'Barbe',1),(7058,'Barber',1),(7059,'Barberella',1),(7060,'Barberry',1),(7061,'Barbery',1),(7062,'Barbeta',1),(7063,'Barbetta',1),(7064,'Barbie',1),(7065,'Barbot',1),(7066,'Barbota',1),(7067,'Barria',1),(7068,'Barrika',1),(7069,'Barsine',1),(7071,'Bartje',1),(7072,'Basaba',1),(7073,'Basagaitz',1),(7074,'Basalgo',1),(7075,'Basandre',1),(7076,'Basiane',1),(7077,'Basilea',1),(7078,'Basilia',1),(7079,'Basilie',1),(7080,'Basilina',1),(7081,'Basill',1),(7082,'Basilla',1),(7083,'Basille',1),(7084,'Basina',1),(7085,'Bassilly',1),(7086,'Baucis',1),(7087,'Baudegundis',1),(7088,'Baufte',1),(7089,'Bauin',1),(7090,'Bauke',1),(7091,'Bausanne',1),(7092,'Bauteut',1),(7093,'Bava',1),(7094,'Bavacin',1),(7095,'Bavin',1),(7096,'Bea',1),(7097,'Beat',1),(7098,'Beatasis',1),(7099,'Beaten',1),(7100,'Beatrice',1),(7101,'Beatricia',1),(7102,'Beatricie',1),(7103,'Beatricis',1),(7104,'Beatrix',1),(7105,'Batriz',1),(7106,'Beattie',1),(7107,'Beatty',1),(7108,'Beautrice',1),(7109,'Bechte',1),(7110,'Becke',1),(7111,'Becok',1),(7112,'Bedaio',1),(7113,'Bedeluue',1),(7114,'Bee',1),(7115,'Begga',1),(7116,'Begoa',1),(7117,'Begona',1),(7118,'Belanda',1),(7119,'Belaskita',1),(7120,'Belate',1),(7121,'Belegardis',1),(7122,'Bellisente',1),(7123,'Beloke',1),(7124,'Beltzane',1),(7125,'Bena',1),(7126,'Bencelina',1),(7127,'Benet',1),(7128,'Bengoa',1),(7129,'Bengoara',1),(7130,'Bengolarrea',1),(7131,'Benigna',1),(7132,'Bennitt',1),(7133,'Benoite',1),(7134,'Beraza',1),(7135,'Berberana',1),(7136,'Berehta',1),(7137,'Berenda',1),(7138,'Berenga',1),(7139,'Berengaria',1),(7140,'Brengre',1),(7141,'Berenike',1),(7142,'Berezi',1),(7143,'Bergard',1),(7144,'Bergundis',1),(7145,'Berhta',1),(7146,'Beriungis',1),(7147,'Berna',1),(7148,'Bernadette',1),(7149,'Bernewief',1),(7150,'Bernewif',1),(7151,'Berta',1),(7152,'Bertaida',1),(7153,'Berte',1),(7154,'Bertha',1),(7155,'Berthildis',1),(7156,'Berthlenda',1),(7157,'Bertildis',1),(7158,'Bertliana',1),(7159,'Bertrada',1),(7160,'Bertruda',1),(7161,'Bertswinda',1),(7162,'Berzijana',1),(7163,'Bete',1),(7164,'Betiko',1),(7165,'Betisa',1),(7166,'Betje',1),(7167,'Betlindis',1),(7168,'Beton',1),(7169,'Betrice',1),(7170,'Betrys',1),(7171,'Betryse',1),(7172,'Betteresse',1),(7173,'Bettin',1),(7174,'Bettina',1),(7175,'Bettrice',1),(7176,'Bettris',1),(7177,'Bettrys',1),(7178,'Betune',1),(7179,'Bianca',1),(7180,'Bibie',1),(7181,'Bidane',1),(7182,'Biddy',1),(7183,'Biedeluue',1),(7184,'Bitris',1),(7185,'Bitrix',1),(7186,'Bitriz',1),(7187,'Bitron',1),(7188,'Bihotz',1),(7189,'Bikarregi',1),(7190,'Bilda',1),(7191,'Bingene',1),(7192,'Binhildis',1),(7193,'Biolarra',1),(7194,'Bioti',1),(7195,'Bito',1),(7196,'Bittore',1),(7197,'Bittori',1),(7198,'Bitxi',1),(7199,'Bitxilore',1),(7200,'Bixenta',1),(7201,'Bizkaia',1),(7202,'Bizkargi',1),(7203,'Blanch',1),(7204,'Blanchette',1),(7205,'Blanchia',1),(7206,'Blaunche',1),(7207,'Blench',1),(7208,'Blissot',1),(7209,'Blitekin',1),(7210,'Blitha',1),(7211,'Blonde',1),(7212,'Bobila',1),(7213,'Boime',1),(7214,'Boke',1),(7215,'Boltiarda',1),(7216,'Bonajoia',1),(7217,'Bonassias',1),(7218,'Bonne',1),(7219,'Bonoque',1),(7220,'Bore',1),(7221,'Boukje',1),(7222,'Bova',1),(7223,'Boviardis',1),(7224,'Bragwayn',1),(7225,'Brangwayna',1),(7226,'Brangwine',1),(7227,'Branwyne',1),(7228,'Braya',1),(7229,'Brechtje',1),(7230,'Bride',1),(7231,'Bridget',1),(7232,'Brigette',1),(7233,'Brigida',1),(7234,'Brigit',1),(7235,'Brigitta',1),(7236,'Brise',1),(7237,'Briseis',1),(7238,'Brune',1),(7239,'Brunehaut',1),(7240,'Brunisente',1),(7241,'Brunissende',1),(7242,'Bryde',1),(7243,'Buiondo',1),(7244,'Burgondo',1),(7245,'Burgundefara',1),(7246,'Burtzea',1),(7247,'Bytzel',1),(7248,'Byzantia',1),(7249,'Caenis',1),(7250,'Caesaria',1),(7251,'Caleope',1),(7252,'Calla',1),(7253,'Callianeira',1),(7254,'Callianessa',1),(7255,'Calliphana',1),(7256,'Calypso',1),(7257,'Camilla',1),(7258,'Campana',1),(7259,'Canace',1),(7260,'Candida',1),(7261,'Carmel',1),(7262,'Cassander',1),(7263,'Cassandre',1),(7264,'Cassandry',1),(7265,'Casse',1),(7266,'Castianiera',1),(7267,'Catarine',1),(7268,'Catel',1),(7269,'Catelin',1),(7270,'Cateline',1),(7271,'Catella',1),(7272,'Catelot',1),(7273,'Caterina',1),(7274,'Caterine',1),(7275,'Catering',1),(7276,'Catharine',1),(7277,'Catherine',1),(7278,'Catherne',1),(7279,'Catin',1),(7280,'Catlin',1),(7281,'Caton',1),(7282,'Catrina',1),(7283,'Cattern',1),(7284,'Cattle',1),(7285,'Cecely',1),(7286,'Cecelya',1),(7287,'Cecelyna',1),(7288,'Cecil',1),(7289,'Cecili',1),(7290,'Cecilia',1),(7291,'Cecilie',1),(7292,'Cecille',1),(7293,'Cecillia',1),(7294,'Cecy',1),(7295,'Ceday',1),(7296,'Celestine',1),(7297,'Celestria',1),(7298,'Celia',1),(7299,'Celina',1),(7300,'Cervella',1),(7301,'Cesarea',1),(7302,'Chantal',1),(7303,'Charis',1),(7304,'Charito',1),(7305,'Charity',1),(7307,'Chione',1),(7308,'Chiore',1),(7309,'Chloe',1),(7310,'Chlo',1),(7311,'Chloris',1),(7313,'Chlotsuintha',1),(7314,'Chrisoogone',1),(7315,'Christina',1),(7316,'Chryse',1),(7317,'Chryseida',1),(7318,'Chryseis',1),(7319,'Chrysothemis',1),(7320,'Chuna',1),(7321,'Chunegundis',1),(7322,'Chydleluve',1),(7323,'Cicely',1),(7324,'Cicilia',1),(7325,'Cicily',1),(7326,'Cilia',1),(7327,'Cilissa',1),(7328,'Cilla',1),(7329,'Circe',1),(7330,'Cisse',1),(7331,'Cissie',1),(7332,'Cissota',1),(7333,'Clamancia',1),(7334,'Clara',1),(7335,'Clarae',1),(7336,'Claramunda',1),(7337,'Clarcia',1),(7338,'Clarell',1),(7339,'Claremonde',1),(7340,'Clariandra',1),(7341,'Claribel',1),(7342,'Clarice',1),(7343,'Claricia',1),(7344,'Claricie',1),(7345,'Clarimond',1),(7346,'Clariscia',1),(7347,'Clarissa',1),(7348,'Clarisse',1),(7349,'Claritia',1),(7350,'Clarrie',1),(7351,'Clarry',1),(7352,'Clarugge',1),(7353,'Clemencia',1),(7354,'Clemency',1),(7355,'Clemenicia',1),(7356,'Clemens',1),(7357,'Clementia',1),(7358,'Clementina',1),(7359,'Clementine',1),(7360,'Cler',1),(7361,'Cleremunda',1),(7362,'Clericia',1),(7363,'Climence',1),(7364,'Clio',1),(7365,'Clodauuiua',1),(7366,'Clothild',1),(7367,'Clotrada',1),(7368,'Clymence',1),(7369,'Clymene',1),(7370,'Clymere',1),(7371,'Colecta',1),(7372,'Coleite',1),(7373,'Colet',1),(7374,'Coleta',1),(7375,'Colte',1),(7376,'Colett',1),(7377,'Coletta',1),(7378,'Colina',1),(7379,'Colleite',1),(7380,'Collette',1),(7381,'Colubra',1),(7382,'Columba',1),(7383,'Comito',1),(7384,'Concepcion',1),(7385,'Condors',1),(7386,'Conegont',1),(7387,'Conegundis',1),(7388,'Conegunt',1),(7389,'Consolantia',1),(7390,'Constancia',1),(7391,'Constantia',1),(7392,'Constantina',1),(7393,'Constanza',1),(7394,'Contzel',1),(7395,'Corinne',1),(7396,'Corythia',1),(7397,'Coulombe',1),(7398,'Crapahildis',1),(7399,'Cratais',1),(7400,'Cresseid',1),(7401,'Cressid',1),(7402,'Creusa',1),(7403,'Crisa',1),(7404,'Criseida',1),(7405,'Criseyde',1),(7406,'Cristehildis',1),(7407,'Cristemburga',1),(7408,'Cristemia',1),(7409,'Cristyne',1),(7410,'Ctimene',1),(7411,'Cunegund',1),(7412,'Cunegundis',1),(7413,'Cus',1),(7414,'Cuss',1),(7415,'Cussata',1),(7416,'Cust',1),(7417,'Custa',1),(7418,'Custanc',1),(7419,'Custance',1),(7420,'Custancia',1),(7421,'Custans',1),(7422,'Custe',1),(7423,'Custins',1),(7424,'Cvenild',1),(7425,'Cybele',1),(7426,'Cycalye',1),(7427,'Cycly',1),(7428,'Cydippe',1),(7429,'Cymodoce',1),(7430,'Cymothoe',1),(7431,'Cyneburga',1),(7432,'Cyniburg',1),(7433,'Cyra',1),(7434,'Cyrene',1),(7435,'Cyrilla',1),(7436,'Cythereia',1),(7437,'Cytheris',1),(7438,'Dadin',1),(7439,'Dagarada',1),(7440,'Damaris',1),(7441,'Damaspia',1),(7442,'Dameta',1),(7443,'Dametta',1),(7444,'Damia',1),(7445,'Damiane',1),(7446,'Damisona',1),(7447,'Dana',1),(7448,'Danburga',1),(7449,'Dania',1),(7450,'Darklis',1),(7451,'Deari',1),(7452,'Decima',1),(7453,'Deianeira',1),(7454,'Deineira',1),(7455,'Deio',1),(7456,'Deiphobe',1),(7457,'Deipyle',1),(7458,'Delias',1),(7459,'Deloys',1),(7460,'Demetria',1),(7461,'Demophile',1),(7462,'Demuth',1),(7463,'Denis',1),(7464,'Dennet',1),(7465,'Denote',1),(7466,'Deonisia',1),(7467,'Deonysia',1),(7468,'Desdemona',1),(7469,'Desiderata',1),(7470,'Desirata',1),(7471,'Destasia',1),(7472,'Dever',1),(7473,'Dexamene',1),(7474,'Diamanda',1),(7475,'Diana',1),(7476,'Dianeme',1),(7477,'Dido',1),(7478,'Didyma',1),(7479,'Diene',1),(7480,'Dilli',1),(7481,'Dillo',1),(7482,'Dinae',1),(7483,'Dinah',1),(7484,'Diomede',1),(7485,'Dione',1),(7486,'Dionis',1),(7487,'Dionisia',1),(7488,'Dionycia',1),(7489,'Dionysia',1),(7490,'Diot',1),(7491,'Diota',1),(7492,'Dirce',1),(7493,'Dirtje',1),(7494,'Disdemona',1),(7495,'Distira',1),(7496,'Doda',1),(7497,'Dodda',1),(7498,'Dodie',1),(7499,'Dodo',1),(7500,'Dolichena',1),(7501,'Doll',1),(7502,'Dolly',1),(7503,'Dolore',1),(7504,'Dolores',1),(7505,'Doltza',1),(7506,'Domeka',1),(7507,'Domentzia',1),(7508,'Dominica',1),(7509,'Dominixe',1),(7510,'Dominy',1),(7511,'Domnica',1),(7512,'Domnola',1),(7513,'Donada',1),(7514,'Donata',1),(7515,'Donetzine',1),(7516,'Doniantsu',1),(7517,'Donianzu',1),(7518,'Donnet',1),(7519,'Dora',1),(7520,'Dorate',1),(7521,'Dorathea',1),(7522,'Dorathia',1),(7523,'Dorcas',1),(7524,'Dore',1),(7525,'Doreen',1),(7526,'Dorette',1),(7527,'Doria',1),(7528,'Doris',1),(7529,'Dorleta',1),(7530,'Dorothea',1),(7531,'Dorthy',1),(7532,'Dorythye',1),(7533,'Dot',1),(7534,'Dota',1),(7535,'Dothy',1),(7536,'Doto',1),(7537,'Dottie',1),(7538,'Douce',1),(7539,'Doue',1),(7540,'Dousabel',1),(7541,'Dousable',1),(7542,'Douset',1),(7543,'Dousin',1),(7544,'Douze',1),(7545,'Dowsabel',1),(7546,'Dowse',1),(7547,'Dowzable',1),(7548,'Drosis',1),(7549,'Drueta',1),(7550,'Drusilla',1),(7551,'Drypetis',1),(7552,'Duce',1),(7553,'Duda',1),(7554,'Dulanto',1),(7555,'Dulcia',1),(7556,'Dulcibella',1),(7557,'Dulcie',1),(7558,'Dulcinea',1),(7559,'Duleia',1),(7560,'Dunixe',1),(7561,'Durilda',1),(7562,'Dusa',1),(7563,'Dussabel',1),(7564,'Dussabele',1),(7565,'Duszabell',1),(7566,'Duua',1),(7567,'Duva',1),(7568,'Duze',1),(7569,'Dyana',1),(7570,'Dynamene',1),(7571,'Dyonisia',1),(7572,'Dyonisya',1),(7573,'Dyot',1),(7574,'Dyota',1),(7575,'Ead',1),(7576,'Eadburga',1),(7577,'Eadgithu',1),(7578,'Eadgyth',1),(7579,'Eadgytha',1),(7580,'Eadida',1),(7581,'Eadie',1),(7582,'Eadita',1),(7583,'Eadu',1),(7584,'Earthelinda',1),(7585,'Eberhild',1),(7586,'Ebertana',1),(7587,'Eburhild',1),(7588,'Eburhilt',1),(7589,'Eda',1),(7590,'Edan',1),(7591,'Edborough',1),(7592,'Edburga',1),(7593,'Edda',1),(7594,'Edde',1),(7595,'Edden',1),(7596,'Eddiva',1),(7597,'Eddiz',1),(7598,'Eddusa',1),(7599,'Ede',1),(7600,'Edeberga',1),(7601,'Edeborg',1),(7602,'Eded',1),(7603,'Edekin',1),(7604,'Edelin',1),(7605,'Edelina',1),(7606,'Edeline',1),(7607,'Edelinne',1),(7608,'Edelot',1),(7609,'Eden',1),(7610,'Ederne',1),(7611,'Ederra',1),(7612,'Edeua',1),(7613,'Edeva',1),(7614,'Edged',1),(7615,'Edgida',1),(7616,'Edgidia',1),(7617,'Edgyth',1),(7618,'Edgyue',1),(7619,'Edhida',1),(7620,'Edhiva',1),(7621,'Edid',1),(7622,'Edied',1),(7623,'Ediet',1),(7624,'Edihe',1),(7625,'Edila',1),(7626,'Edine',1),(7627,'Edit',1),(7628,'Editha',1),(7629,'Edithe',1),(7630,'Ediua',1),(7631,'Ediva',1),(7632,'Ediz',1),(7633,'Edney',1),(7634,'Edolina',1),(7635,'Edon',1),(7636,'Edonea',1),(7637,'Edony',1),(7638,'Edume',1),(7639,'Edurne',1),(7640,'Edurtzeta',1),(7641,'Edus',1),(7642,'Edy',1),(7643,'Edytha',1),(7644,'Edyva',1),(7645,'Effam',1),(7646,'Effemy',1),(7647,'Effie',1),(7648,'Effim',1),(7649,'Effum',1),(7650,'Eflead',1),(7651,'Ega',1),(7652,'Egecin',1),(7653,'Egelina',1),(7654,'Egeluuara',1),(7655,'Egeria',1),(7656,'Egesburga',1),(7657,'Egesloga',1),(7658,'Egiarte',1),(7659,'Egilior',1),(7660,'Egina',1),(7661,'Eglantine',1),(7662,'Eglentina',1),(7663,'Eglentine',1),(7664,'Eguene',1),(7665,'Eguzki',1),(7666,'Eguzkie',1),(7667,'Ehgelhild',1),(7668,'Ehgeluuara',1),(7669,'Eider',1),(7670,'Eidita',1),(7671,'Eidothee',1),(7672,'Eilaria',1),(7673,'Eileithyia',1),(7674,'Eileua',1),(7675,'Eileue',1),(7676,'Eileve',1),(7677,'Eilieue',1),(7678,'Eimde',1),(7679,'Ejte',1),(7680,'Ekhie',1),(7681,'Ela',1),(7682,'Elaia',1),(7683,'Elaine',1),(7684,'Elaisse',1),(7685,'Elana',1),(7686,'Elaria',1),(7687,'Elayne',1),(7688,'Elcmene',1),(7689,'Eldid',1),(7690,'Eldit',1),(7691,'Elduara',1),(7692,'Eleanora',1),(7693,'Electra',1),(7694,'Elen',1),(7695,'Elena',1),(7696,'Elene',1),(7697,'Eleua',1),(7698,'Elewisa',1),(7699,'Elewys',1),(7700,'Eleyn',1),(7701,'Eleyne',1),(7702,'Elfgifu',1),(7703,'Elflet',1),(7704,'Elfleta',1),(7705,'Elfred',1),(7706,'Elfrid',1),(7707,'Elfrida',1),(7708,'Elftrudis',1),(7709,'Elgiva',1),(7710,'Elia',1),(7711,'Elianor',1),(7712,'Elianora',1),(7713,'Elicia',1),(7714,'Elin',1),(7715,'Elinor',1),(7716,'Elinora',1),(7717,'Elisabete',1),(7718,'Elison',1),(7719,'Elisot',1),(7720,'Elisota',1),(7721,'Elixabete',1),(7722,'Elixane',1),(7723,'Elizabeth',1),(7724,'Elizamendi',1),(7725,'Elizmendi',1),(7726,'Elkano',1),(7727,'Ella',1),(7728,'Ellaire',1),(7729,'Ellen',1),(7730,'Ellene',1),(7731,'Ellenor',1),(7732,'Ellerete',1),(7733,'Ellice',1),(7734,'Ellie',1),(7735,'Ellin',1),(7736,'Ellot',1),(7737,'Ellota',1),(7738,'Ellyn',1),(7739,'Elmerich',1),(7740,'Eloisa',1),(7741,'Eloise',1),(7742,'Elorriaga',1),(7743,'Elota',1),(7744,'Elpir',1),(7745,'Else',1),(7746,'Elsebeth',1),(7747,'Elske',1),(7748,'Elueua',1),(7749,'Eluiua',1),(7750,'Eluiue',1),(7751,'Eluned',1),(7752,'Elurreta',1),(7753,'Eluska',1),(7754,'Eluyua',1),(7755,'Elveva',1),(7756,'Elvina',1),(7757,'Elwisia',1),(7758,'Elyenora',1),(7759,'Elyne',1),(7760,'Elysande',1),(7761,'Elysant',1),(7762,'Elyscia',1),(7763,'Ema',1),(7764,'Emayn',1),(7765,'Emblem',1),(7766,'Emblema',1),(7767,'Emblen',1),(7768,'Emblin',1),(7769,'Emblyn',1),(7770,'Emecin',1),(7771,'Emelenine',1),(7772,'Emelin',1),(7773,'Emelina',1),(7774,'Emeline',1),(7775,'Emelisse',1),(7776,'Emelnie',1),(7777,'Emelot',1),(7778,'Emelote',1),(7779,'Emeloth',1),(7780,'Emeludt',1),(7781,'Emelye',1),(7782,'Emelyn',1),(7783,'Emelyne',1),(7784,'Emengar',1),(7785,'Emenjart',1),(7786,'Emeny',1),(7787,'Emeria',1),(7788,'Emerita',1),(7789,'Emerlee',1),(7790,'Emersende',1),(7791,'Emery',1),(7792,'Emilia',1),(7793,'Emlin',1),(7794,'Emlyn',1),(7795,'Emm',1),(7796,'Emma',1),(7797,'Emmanaia',1),(7798,'Emme',1),(7799,'Emmelina',1),(7800,'Emmeline',1),(7801,'Emmet',1),(7802,'Emmete',1),(7803,'Emmony',1),(7804,'Emmot',1),(7805,'Emmota',1),(7806,'Emmote',1),(7807,'Emoni',1),(7808,'Emonie',1),(7809,'Emony',1),(7810,'Emota',1),(7811,'Emulea',1),(7812,'Emy',1),(7813,'Emylyna',1),(7814,'Enara',1),(7815,'Encarnacion',1),(7816,'Endeis',1),(7817,'Endera',1),(7818,'Enea',1),(7819,'Eneka',1),(7820,'Eneritz',1),(7821,'Engelberga',1),(7822,'Engelgard',1),(7823,'Engelsuit',1),(7824,'Engeluuara',1),(7825,'Engelwara',1),(7826,'Engle',1),(7827,'Enmeline',1),(7828,'Enna',1),(7829,'Enota',1),(7830,'Enyo',1),(7831,'Eormengard',1),(7832,'Eormengild',1),(7833,'Eos',1),(7834,'Epham',1),(7835,'Epicaste',1),(7836,'Epicelena',1),(7837,'Epiphania',1),(7838,'Eppie',1),(7839,'Erchantrudis',1),(7840,'Erchembrog',1),(7841,'Erdaie',1),(7842,'Erdie',1),(7843,'Erdoitza',1),(7844,'Erdotza',1),(7845,'Erdoza',1),(7846,'Ereleuva',1),(7847,'Erelieva',1),(7848,'Erembour',1),(7849,'Erembourc',1),(7850,'Eremburgis',1),(7851,'Ereprad',1),(7852,'Erguia',1),(7853,'Eriboea',1),(7854,'Erica',1),(7855,'Eriete',1),(7856,'Erigone',1),(7857,'Erika',1),(7858,'Eriopis',1),(7859,'Eriphyle',1),(7860,'Eris',1),(7861,'Erisenda',1),(7862,'Erkembrog',1),(7863,'Erkenbrog',1),(7864,'Erkenburoc',1),(7865,'Erkenrad',1),(7866,'Erkuden',1),(7867,'Erlea',1),(7868,'Erma',1),(7869,'Ermandrud',1),(7870,'Ermbourg',1),(7871,'Ermecin',1),(7872,'Ermegarde',1),(7873,'Ermegardis',1),(7874,'Ermengard',1),(7875,'Ermengarda',1),(7876,'Ermengarde',1),(7877,'Ermengardis',1),(7878,'Ermengart',1),(7879,'Ermenjart',1),(7880,'Ermentrudis',1),(7881,'Ermessenda',1),(7882,'Ermeswindis',1),(7883,'Ermie',1),(7884,'Ermin',1),(7885,'Ermina',1),(7886,'Ermingard',1),(7887,'Erminia',1),(7888,'Ermisenda',1),(7889,'Ermua',1),(7890,'Ernio',1),(7891,'Erniobe',1),(7892,'Erpsuid',1),(7893,'Erramune',1),(7894,'Erramusa',1),(7895,'Errasti',1),(7896,'Erregina',1),(7897,'Erremulluri',1),(7898,'Errictruda',1),(7899,'Errita',1),(7900,'Erromane',1),(7901,'Errosali',1),(7902,'Erroz',1),(7903,'Errukine',1),(7904,'Erta',1),(7905,'Esa',1),(7906,'Eschina',1),(7907,'Eschiva',1),(7908,'Esclairmonde',1),(7909,'Esclamonde',1),(7910,'Esclarmonde',1),(7911,'Esdeline',1),(7912,'Eskarne',1),(7913,'Eskolunbe',1),(7914,'Esozi',1),(7915,'Esperte',1),(7916,'Espoz',1),(7917,'Esquiva',1),(7918,'Essylt',1),(7919,'Estebeni',1),(7920,'Estibalitz',1),(7921,'Estibaliz',1),(7922,'Estienne',1),(7923,'Estrangia',1),(7924,'Estrelda',1),(7925,'Estrilda',1),(7926,'Estrildis',1),(7927,'Estrill',1),(7928,'Estrilld',1),(7929,'Etfled',1),(7930,'Ethel',1),(7931,'Ethelchif',1),(7932,'Etheldred',1),(7933,'Etheldritha',1),(7934,'Ethelenda',1),(7935,'Ethelgard',1),(7936,'Ethelgarda',1),(7937,'Ethelia',1),(7938,'Etorne',1),(7939,'Etxano',1),(7940,'Etxauarren',1),(7941,'Eucarpia',1),(7942,'Eudeline',1),(7943,'Eudocia',1),(7944,'Eudokia',1),(7945,'Eudoxia',1),(7946,'Eue',1),(7947,'Euerloga',1),(7948,'Eufamie',1),(7949,'Eufemia',1),(7950,'Eufemie',1),(7951,'Eufemma',1),(7952,'Eufemme',1),(7953,'Eufemmia',1),(7954,'Eufiama',1),(7955,'Eufrata',1),(7956,'Eugenia',1),(7957,'Eulari',1),(7958,'Eularia',1),(7959,'Eunate',1),(7960,'Eunice',1),(7961,'Eunisia',1),(7962,'Euodias',1),(7963,'Eupham',1),(7964,'Euphame',1),(7965,'Eupheme',1),(7966,'Euphemia',1),(7967,'Euphrasia',1),(7968,'Euphro',1),(7969,'Euphrosyne',1),(7970,'Euria',1),(7971,'Eurildis',1),(7972,'Eurohildis',1),(7973,'Europa',1),(7974,'Eurycleia',1),(7975,'Eurydike',1),(7976,'Eurynome',1),(7977,'Eusa',1),(7978,'Eusebia',1),(7979,'Eustachia',1),(7980,'Eustacia',1),(7981,'Evadne',1),(7982,'Evantia',1),(7983,'Evelina',1),(7984,'Evelyn',1),(7985,'Evemy',1),(7986,'Everelda',1),(7987,'Evereldis',1),(7988,'Everild',1),(7989,'Everilda',1),(7990,'Everildis',1),(7991,'Everill',1),(7992,'Evfemia',1),(7993,'Ewfame',1),(7994,'Extranea',1),(7995,'Ezkurra',1),(7996,'Ezozia',1),(7997,'Eztegune',1),(7998,'Fabia',1),(7999,'Fabiana',1),(8000,'Fabiola',1),(8001,'Fabrisse',1),(8002,'Fara',1),(8003,'Farahilda',1),(8004,'Fastrada',1),(8005,'Fede',1),(8006,'Feentje',1),(8007,'Feike',1),(8008,'Felica',1),(8009,'Felice',1),(8010,'Felicia',1),(8011,'Felis',1),(8012,'Felise',1),(8013,'Felisia',1),(8014,'Femmota',1),(8015,'Fermina',1),(8016,'Fieke',1),(8017,'Filisia',1),(8018,'Fillida',1),(8019,'Fillon',1),(8020,'Fillys',1),(8021,'Fina',1),(8022,'Finepopla',1),(8023,'Flavia',1),(8024,'Fleurie',1),(8025,'Flo',1),(8026,'Flora',1),(8027,'Flore',1),(8028,'Florence',1),(8029,'Florencia',1),(8030,'Florentia',1),(8031,'Florentxi',1),(8032,'Floria',1),(8033,'Florie',1),(8034,'Florina',1),(8035,'Florion',1),(8036,'Florymonde',1),(8037,'Floss',1),(8038,'Flossie',1),(8039,'Flouerana',1),(8040,'Flour',1),(8041,'Flourie',1),(8042,'Flur',1),(8043,'Flurekin',1),(8044,'Fluri',1),(8045,'Focktje',1),(8046,'Folclind',1),(8047,'Folclinda',1),(8048,'Folcrada',1),(8049,'Folcuuara',1),(8050,'Folgarda',1),(8051,'Folsuindis',1),(8052,'Folsuuendis',1),(8053,'Fordola',1),(8054,'Fortlifh',1),(8055,'Fortunata',1),(8056,'Fousafia',1),(8057,'Foy',1),(8058,'Francesca',1),(8059,'Francesse',1),(8060,'Francis',1),(8061,'Franqueite',1),(8062,'Frantsesa',1),(8063,'Frantxa',1),(8064,'Frantziska',1),(8065,'Frauuara',1),(8066,'Freadeyweed',1),(8067,'Fredeburgis',1),(8068,'Fredegonde',1),(8069,'Frederada',1),(8070,'Fredeuuara',1),(8071,'Frediswitha',1),(8072,'Frethegard',1),(8073,'Frethesuinda',1),(8075,'Fridayweed',1),(8076,'Fridegundis',1),(8077,'Fridesuenda',1),(8078,'Frideswid',1),(8079,'Fridewiga',1),(8080,'Fridiswed',1),(8081,'Fridiswid',1),(8082,'Fridswed',1),(8083,'Frisburgis',1),(8084,'Frithelinda',1),(8085,'Frithswith',1),(8086,'Frouuin',1),(8087,'Frouuina',1),(8088,'Fruitutsu',1),(8089,'Fryswyde',1),(8090,'Fye',1),(8091,'Gaatha',1),(8092,'Gabone',1),(8093,'Gabrielia',1),(8094,'Gace',1),(8095,'Gadea',1),(8096,'Gaenor',1),(8097,'Gailan',1),(8098,'Gailana',1),(8099,'Gaillarde',1),(8100,'Gainko',1),(8101,'Galatea',1),(8102,'Galiene',1),(8103,'Galienne',1),(8104,'Ganleya',1),(8105,'Ganor',1),(8106,'Garaie',1),(8107,'Garaitz',1),(8108,'Garazi',1),(8109,'Garbi',1),(8110,'Garbie',1),(8111,'Garbikunde',1),(8112,'Garbine',1),(8113,'Garden',1),(8114,'Gardotza',1),(8115,'Garoa',1),(8116,'Garralda',1),(8117,'Garrastazu',1),(8118,'Garthrite',1),(8119,'Gartrett',1),(8120,'Gartrite',1),(8121,'Gartrude',1),(8122,'Gartzene',1),(8123,'Gatty',1),(8124,'Gatzarieta',1),(8125,'Gaude',1),(8126,'Gaunlaya',1),(8127,'Gaunliena',1),(8128,'Gauzia',1),(8129,'Gaxi',1),(8130,'Gaxuxa',1),(8131,'Gaynore',1),(8132,'Gazelu',1),(8133,'Gazeta',1),(8134,'Gaztain',1),(8135,'Geaxi',1),(8136,'Gebke',1),(8137,'Geelte',1),(8138,'Geerta',1),(8139,'Geertje',1),(8140,'Geertke',1),(8141,'Geila',1),(8142,'Gelduuara',1),(8143,'Gele',1),(8144,'Gelen',1),(8145,'Gelleia',1),(8146,'Gemma',1),(8147,'Geneva',1),(8148,'Genevieve',1),(8149,'Genofeva',1),(8150,'Gentile',1),(8151,'Gentzane',1),(8152,'Georgia',1),(8153,'Geraxane',1),(8154,'Gerbaga',1),(8155,'Gerberga',1),(8156,'Gerburg',1),(8157,'Geredrudis',1),(8158,'Geretrudis',1),(8159,'Gerharde',1),(8160,'Gerhild',1),(8161,'Gerlent',1),(8162,'Gerlinda',1),(8163,'Germainne',1),(8164,'Germana',1),(8165,'Geroa',1),(8166,'Gersenda',1),(8167,'Gersendis',1),(8168,'Gersuenda',1),(8169,'Gersuinda',1),(8170,'Gersvinda',1),(8171,'Gert',1),(8172,'Gertie',1),(8173,'Gertje',1),(8174,'Gertrud',1),(8175,'Gertruda',1),(8176,'Gertrudis',1),(8177,'Gerty',1),(8178,'Geruuara',1),(8179,'Gesa',1),(8180,'Geske',1),(8181,'Gethrude',1),(8182,'Geua',1),(8183,'Geue',1),(8184,'Geuecok',1),(8185,'Geva',1),(8186,'Gileite',1),(8187,'Gilte',1),(8188,'Gilia',1),(8189,'Giliana',1),(8190,'Giliane',1),(8191,'Gill',1),(8192,'Gille',1),(8193,'Gilleis',1),(8194,'Gilleite',1),(8195,'Gillian',1),(8196,'Gillie',1),(8197,'Gillot',1),(8198,'Gillota',1),(8199,'Gilly',1),(8200,'Ginnade',1),(8201,'Giona',1),(8202,'Gipuzkoa',1),(8203,'Giraude',1),(8204,'Gisela',1),(8205,'Gisella',1),(8206,'Giselle',1),(8207,'Gisellee',1),(8208,'Gisila',1),(8209,'Gisla',1),(8210,'Gismon',1),(8211,'Giso',1),(8212,'Gixane',1),(8213,'Gladuse',1),(8214,'Glauce',1),(8215,'Glismoda',1),(8216,'Glismodis',1),(8217,'Glyke',1),(8218,'Godalinda',1),(8219,'Godeca',1),(8220,'Godecin',1),(8221,'Godefe',1),(8222,'Godelda',1),(8223,'Godeleve',1),(8224,'Godelif',1),(8225,'Godelinda',1),(8226,'Godeliva',1),(8227,'Godelive',1),(8228,'Godeue',1),(8229,'Godeva',1),(8230,'Godgeua',1),(8231,'Godgiua',1),(8232,'Godgiva',1),(8233,'Godid',1),(8234,'Godildis',1),(8235,'Godise',1),(8236,'Godit',1),(8237,'Goditha',1),(8238,'Godiuia',1),(8239,'Godleue',1),(8240,'Godleva',1),(8241,'Goduia',1),(8242,'Godusa',1),(8243,'Goduse',1),(8244,'Goduuara',1),(8245,'Godyf',1),(8246,'Goiatz',1),(8247,'Goikiria',1),(8248,'Goikoana',1),(8249,'Goiuria',1),(8250,'Goizane',1),(8251,'Goizargi',1),(8252,'Goldeheve',1),(8253,'Goldgeofu',1),(8254,'Goldgeve',1),(8255,'Goldhuie',1),(8256,'Goldyeua',1),(8257,'Goldyeue',1),(8258,'Goldyva',1),(8259,'Goldyve',1),(8260,'Golla',1),(8261,'Gonilda',1),(8262,'Gonnild',1),(8263,'Gonnilda',1),(8264,'Gonnora',1),(8265,'Gonora',1),(8266,'Gonore',1),(8267,'Goodeth',1),(8268,'Goodeve',1),(8269,'Goodife',1),(8270,'Gorane',1),(8271,'Goratze',1),(8272,'Gordia',1),(8273,'Gordiana',1),(8274,'Gorgo',1),(8275,'Gorostitza',1),(8276,'Gorria',1),(8277,'Gorritiz',1),(8278,'Gorriza',1),(8279,'Gothuuera',1),(8280,'Goto',1),(8281,'Gotzone',1),(8282,'Gozo',1),(8283,'Grace',1),(8284,'Gracia',1),(8285,'Gracye',1),(8286,'Graeca',1),(8287,'Gratianne',1),(8288,'Graxi',1),(8289,'Grazide',1),(8290,'Grece',1),(8291,'Grecia',1),(8292,'Grecie',1),(8293,'Grede',1),(8294,'Gredechin',1),(8295,'Gregoria',1),(8296,'Gresilda',1),(8297,'Greta',1),(8298,'Grete',1),(8299,'Gretje',1),(8300,'Gricia',1),(8301,'Grietje',1),(8302,'Grimuuara',1),(8303,'Grisegond',1),(8304,'Grisel',1),(8305,'Griseldis',1),(8306,'Grishild',1),(8307,'Grisigion',1),(8308,'Grisogonia',1),(8309,'Grissall',1),(8310,'Grissecon',1),(8311,'Grissel',1),(8312,'Grissell',1),(8313,'Grizel',1),(8314,'Grizzel',1),(8315,'Guanor',1),(8316,'Guda',1),(8317,'Gude',1),(8318,'Gudeliva',1),(8319,'Gudula',1),(8320,'Gudule',1),(8321,'Gudytha',1),(8322,'Gueanor',1),(8323,'Guener',1),(8324,'Guenevere',1),(8325,'Guiborc',1),(8326,'Guibourc',1),(8327,'Guillemete',1),(8328,'Guillemette',1),(8329,'Guillote',1),(8330,'Guiote',1),(8331,'Gumhild',1),(8332,'Gundesvinda',1),(8333,'Gundichild',1),(8334,'Gundiperga',1),(8335,'Gundrada',1),(8336,'Gundrea',1),(8337,'Gunel',1),(8338,'Gunild',1),(8339,'Gunilda',1),(8340,'Gunne',1),(8341,'Gunnell',1),(8342,'Gunneuare',1),(8343,'Gunnild',1),(8344,'Gunnilda',1),(8345,'Gunnilde',1),(8346,'Gunnildes',1),(8347,'Gunnilla',1),(8348,'Gunnilt',1),(8349,'Gunnora',1),(8350,'Gunnore',1),(8351,'Gunnota',1),(8352,'Gunnote',1),(8353,'Gunora',1),(8354,'Gunwar',1),(8355,'Gunware',1),(8356,'Guodhelda',1),(8357,'Guodlia',1),(8358,'Gure',1),(8359,'Gurutze',1),(8360,'Gurutzeta',1),(8361,'Guruzne',1),(8362,'Gwenhevare',1),(8363,'Gwenore',1),(8364,'Gyel',1),(8365,'Gygaea',1),(8366,'Gylle',1),(8367,'Gyly',1),(8368,'Gynuara',1),(8369,'Gyszel',1),(8370,'Hadaken',1),(8371,'Hadewidis',1),(8372,'Hadwis',1),(8373,'Hadwisa',1),(8374,'Hadwise',1),(8375,'Haidee',1),(8376,'Haize',1),(8377,'Halie',1),(8378,'Hana',1),(8379,'Hanneli',1),(8380,'Hanni',1),(8381,'Haouys',1),(8382,'Haoys',1),(8383,'Harbona',1),(8384,'Harmke',1),(8385,'Harmodias',1),(8386,'Harmonia',1),(8387,'Harriet',1),(8388,'Harsent',1),(8389,'Harwara',1),(8390,'Haueis',1),(8391,'Haurramari',1),(8392,'Haute',1),(8393,'Havisa',1),(8394,'Hawis',1),(8395,'Hawisa',1),(8396,'Hawise',1),(8397,'Hawisia',1),(8398,'Hawys',1),(8399,'Hawyse',1),(8400,'Hazeca',1),(8401,'Hecuba',1),(8402,'Hedewigis',1),(8403,'Hedheue',1),(8404,'Hegazti',1),(8405,'Hegelina',1),(8406,'Heidi',1),(8407,'Heidindrudis',1),(8408,'Heilewif',1),(8409,'Heilewis',1),(8410,'Heilewisa',1),(8411,'Heilswinda',1),(8412,'Hekabe',1),(8413,'Hekaline',1),(8414,'Hekate',1),(8415,'Helchen',1),(8416,'Heldeburga',1),(8417,'Hele',1),(8418,'Heleanor',1),(8419,'Helena',1),(8420,'Helene',1),(8421,'Heletradana',1),(8422,'Heleuuidis',1),(8423,'Helevisa',1),(8424,'Helewidis',1),(8425,'Helewis',1),(8426,'Helewisa',1),(8427,'Helewise',1),(8428,'Helewys',1),(8429,'Helewyse',1),(8430,'Heleyne',1),(8431,'Helga',1),(8432,'Helice',1),(8433,'Helike',1),(8434,'Helinda',1),(8435,'Heliodora',1),(8436,'Helis',1),(8437,'Helisende',1),(8438,'Helisent',1),(8439,'Helissent',1),(8440,'Helissente',1),(8441,'Hellanike',1),(8442,'Helle',1),(8443,'Helmech',1),(8444,'Helmet',1),(8445,'Helmeth',1),(8446,'Heloise',1),(8447,'Helouys',1),(8448,'Heloys',1),(8449,'Heloyson',1),(8450,'Heltrada',1),(8451,'Helueua',1),(8452,'Helvynya',1),(8453,'Helysoune',1),(8454,'Helyssent',1),(8455,'Hema',1),(8456,'Hemin',1),(8457,'Hemke',1),(8458,'Hengelsenda',1),(8459,'Heni',1),(8460,'Herden',1),(8461,'Herdin',1),(8462,'Herena',1),(8463,'Herenborg',1),(8464,'Herenfrida',1),(8465,'Herleva',1),(8466,'Herleve',1),(8467,'Herlinda',1),(8468,'Herlindis',1),(8469,'Hermana',1),(8470,'Hermelinda',1),(8471,'Hermengarda',1),(8472,'Hermengart',1),(8473,'Hermenjart',1),(8474,'Hermesent',1),(8475,'Hermessent',1),(8476,'Hermine',1),(8477,'Hermineite',1),(8478,'Hermione',1),(8479,'Herophile',1),(8480,'Hersent',1),(8481,'Hesione',1),(8482,'Hesse',1),(8483,'Hesychia',1),(8484,'Hette',1),(8485,'Hextilda',1),(8486,'Hiart',1),(8487,'Hida',1),(8488,'Hiemke',1),(8489,'Hientje',1),(8490,'Hilaera',1),(8491,'Hilargi',1),(8492,'Hildberta',1),(8493,'Hildborg',1),(8494,'Hildcardis',1),(8495,'Hilde',1),(8496,'Hildeberga',1),(8497,'Hildeburg',1),(8498,'Hildeburgis',1),(8499,'Hildegard',1),(8500,'Hildegarde',1),(8501,'Hildegardis',1),(8502,'Hildegund',1),(8503,'Hildelana',1),(8504,'Hildemunda',1),(8505,'Hildeswindis',1),(8506,'Hildeth',1),(8507,'Hildeuuara',1),(8508,'Hildeuuif',1),(8509,'Hildewara',1),(8510,'Hildewif',1),(8511,'Hildeyerd',1),(8512,'Hildiard',1),(8513,'Hilditha',1),(8514,'Hildithe',1),(8515,'Hildrada',1),(8516,'Hildwara',1),(8517,'Hildyard',1),(8518,'Hiliard',1),(8519,'Hilith',1),(8520,'Hilka',1),(8521,'Hilke',1),(8522,'Hillaria',1),(8523,'Hillda',1),(8524,'Hille',1),(8525,'Hiltrude',1),(8526,'Hinauri',1),(8527,'Hine',1),(8528,'Hinemoa',1),(8529,'Hinte',1),(8530,'Hippodameia',1),(8531,'Hippodamia',1),(8532,'Hippolyta',1),(8533,'Hira',1),(8534,'Hirmenlind',1),(8535,'Hismena',1),(8536,'Hodiern',1),(8537,'Hodierna',1),(8538,'Hodierne',1),(8539,'Hoki',1),(8540,'Honnor',1),(8541,'Honor',1),(8542,'Honorata',1),(8543,'Honore',1),(8544,'Honorte',1),(8545,'Honoria',1),(8546,'Honors',1),(8547,'Horenga',1),(8548,'Hostaruuara',1),(8549,'Houde',1),(8550,'Hruodgarda',1),(8551,'Hruotberta',1),(8552,'Hua',1),(8553,'Hugolinae',1),(8554,'Hugone',1),(8555,'Huguete',1),(8556,'Huguette',1),(8557,'Hunila',1),(8558,'Hursell',1),(8559,'Hutaosa',1),(8560,'Hylda',1),(8561,'Hylde',1),(8562,'Hyldeiard',1),(8563,'Hyolent',1),(8564,'Hypsipyle',1),(8565,'Hyrmina',1),(8566,'Hysode',1),(8567,'Hyssmaye',1),(8568,'Iaera',1),(8569,'Iaione',1),(8570,'Ianeira',1),(8571,'Ianessa',1),(8572,'Ianthe',1),(8573,'Ianuaria',1),(8574,'Ibabe',1),(8575,'Ibane',1),(8576,'Ibernalo',1),(8577,'Ibone',1),(8578,'Ida',1),(8579,'Idasgarda',1),(8580,'Ide',1),(8581,'Idemay',1),(8582,'Ideny',1),(8583,'Ideslef',1),(8584,'Idesuuif',1),(8585,'Ideswif',1),(8586,'Idisiardis',1),(8587,'Idoia',1),(8588,'Idoibaltzaga',1),(8589,'Idone',1),(8590,'Idonia',1),(8591,'Idony',1),(8592,'Idurre',1),(8593,'Iera',1),(8594,'Igaratza',1),(8595,'Igone',1),(8596,'Igotz',1),(8597,'Ihintza',1),(8598,'Ikerne',1),(8599,'Ikomar',1),(8600,'Ikuska',1),(8601,'Ilaria',1),(8602,'Ilazkie',1),(8603,'Ilene',1),(8604,'Ilia',1),(8605,'Iligardia',1),(8606,'Illaria',1),(8607,'Iloz',1),(8608,'Imagantia',1),(8609,'Imaigne',1),(8610,'Imania',1),(8611,'Imanie',1),(8612,'Imayn',1),(8613,'Imayne',1),(8614,'Imblen',1),(8615,'Imedia',1),(8616,'Imelda',1),(8617,'Imeyna',1),(8618,'Imicina',1),(8619,'Imma',1),(8620,'Imme',1),(8621,'Immine',1),(8622,'Imte',1),(8623,'Imyne',1),(8624,'Infe',1),(8625,'Ingaret',1),(8626,'Ingaretta',1),(8627,'Ingela',1),(8628,'Ingelswindis',1),(8629,'Ingeltrude',1),(8630,'Ingeltrudis',1),(8631,'Ingeluuara',1),(8632,'Ingelwara',1),(8633,'Ingerith',1),(8634,'Ingrede',1),(8635,'Inmaculada',1),(8636,'Ino',1),(8637,'Ioar',1),(8638,'Iodberta',1),(8639,'Iola',1),(8640,'Iolanthe',1),(8641,'Iole',1),(8642,'Iolitha',1),(8643,'Iomene',1),(8644,'Ione',1),(8645,'Ionna',1),(8646,'Ionnia',1),(8647,'Ionnina',1),(8648,'Iphianassa',1),(8649,'Iphigenia',1),(8650,'Iphimedeia',1),(8651,'Iphis',1),(8652,'Iphitheme',1),(8653,'Ipuza',1),(8654,'Iragarte',1),(8655,'Iraia',1),(8656,'Irakusne',1),(8657,'Irantzu',1),(8658,'Irati',1),(8659,'Iratxe',1),(8660,'Irene',1),(8661,'Iriberri',1),(8662,'Iride',1),(8663,'Irihapeti',1),(8664,'Iris',1),(8665,'Iristain',1),(8666,'Iriuela',1),(8667,'Irmele',1),(8668,'Irmengard',1),(8669,'Irmenhild',1),(8670,'Irmenlind',1),(8671,'Irua',1),(8672,'Irune',1),(8673,'Iruri',1),(8674,'Irutxeta',1),(8675,'Isa',1),(8676,'Isadora',1),(8677,'Isamaya',1),(8678,'Isard',1),(8679,'Isasi',1),(8680,'Isata',1),(8681,'Isaut',1),(8682,'Isburch',1),(8683,'Iseldis',1),(8684,'Iselota',1),(8685,'Isemay',1),(8686,'Isemeine',1),(8687,'Iseuda',1),(8688,'Iseult',1),(8689,'Iseut',1),(8690,'Ismanna',1),(8691,'Ismeina',1),(8692,'Ismena',1),(8693,'Ismene',1),(8694,'Ismenia',1),(8695,'Ismey',1),(8696,'Isold',1),(8697,'Isolde',1),(8698,'Isolt',1),(8699,'Isot',1),(8700,'Isota',1),(8701,'Isott',1),(8702,'Isotta',1),(8703,'Isouda',1),(8704,'Issa',1),(8705,'Issat',1),(8706,'Isurieta',1),(8707,'Isylte',1),(8708,'Italia',1),(8709,'Italica',1),(8710,'Itoiz',1),(8711,'Itsasne',1),(8712,'Itsaso',1),(8713,'Iturrieta',1),(8714,'Iturrisantu',1),(8715,'Itxaro',1),(8716,'Itxaso',1),(8717,'Itzal',1),(8718,'Itzia',1),(8719,'Itziar',1),(8720,'Iuetta',1),(8721,'Iuette',1),(8722,'Iuliana',1),(8723,'Iuotte',1),(8724,'Iurre',1),(8725,'Iustina',1),(8726,'Ivetta',1),(8727,'Ivette',1),(8728,'Ixone',1),(8729,'Izaga',1),(8730,'Izar',1),(8731,'Izaro',1),(8732,'Izaskun',1),(8733,'Izazkun',1),(8734,'Izett',1),(8735,'Izorne',1),(8736,'Izot',1),(8737,'Jacotte',1),(8738,'Jaione',1),(8739,'Jantje',1),(8740,'Jasone',1),(8741,'Jauregi',1),(8742,'Jehanne',1),(8743,'Jeike',1),(8744,'Jeliana',1),(8745,'Jellfte',1),(8746,'Jelyan',1),(8747,'Jenefer',1),(8748,'Jeneuer',1),(8749,'Jenningtje',1),(8750,'Jeromia',1),(8751,'Jervaise',1),(8752,'Jesmaine',1),(8753,'Jesmond',1),(8754,'Jessamine',1),(8755,'Jessimond',1),(8756,'Jesusa',1),(8757,'Jezebel',1),(8758,'Jilfte',1),(8759,'Jill',1),(8760,'Jismond',1),(8761,'Jivete',1),(8762,'Joana',1),(8763,'Joanna',1),(8764,'Jocasta',1),(8765,'Jocea',1),(8766,'Jocey',1),(8767,'Jocosa',1),(8768,'Jodoca',1),(8769,'Johi',1),(8770,'Joia',1),(8771,'Joie',1),(8772,'Joiha',1),(8773,'Jokie',1),(8774,'Joleicia',1),(8775,'Jolenta',1),(8776,'Jolicia',1),(8777,'Jone',1),(8778,'Jordan',1),(8779,'Josebe',1),(8780,'Josephine',1),(8781,'Josiane',1),(8782,'Josina',1),(8783,'Josse',1),(8784,'Jossy',1),(8785,'Josune',1),(8786,'Jourdenete',1),(8787,'Joveta',1),(8788,'Joxepa',1),(8789,'Joya',1),(8790,'Joye',1),(8791,'Joyeuse',1),(8792,'Joyse',1),(8793,'Judda',1),(8794,'Juelina',1),(8795,'Juet',1),(8796,'Juete',1),(8797,'Juetta',1),(8798,'Jugatx',1),(8799,'Juheta',1),(8800,'Juhota',1),(8801,'Juicea',1),(8802,'Juicia',1),(8803,'Julene',1),(8804,'Julian',1),(8805,'Juliana',1),(8806,'Juliane',1),(8807,'Julie',1),(8808,'Julienne',1),(8809,'Juliet',1),(8810,'Juliote',1),(8811,'Julitta',1),(8812,'Julyan',1),(8813,'June',1),(8814,'Jurdana',1),(8815,'Jurre',1),(8816,'Justina',1),(8817,'Juwete',1),(8818,'Juye',1),(8819,'Kaithren',1),(8820,'Kalare',1),(8821,'Kallisto',1),(8822,'Kallixeina',1),(8823,'Kalotte',1),(8824,'Karin',1),(8825,'Karine',1),(8826,'Karitate',1),(8827,'Karmele',1),(8828,'Kassandra',1),(8829,'Kat',1),(8830,'Katalin',1),(8831,'Katana',1),(8832,'Kate',1),(8833,'Katelin',1),(8834,'Katelina',1),(8835,'Kateline',1),(8836,'Katerin',1),(8837,'Katerina',1),(8838,'Katerine',1),(8839,'Katering',1),(8840,'Kateryn',1),(8841,'Kateryna',1),(8842,'Kateryne',1),(8843,'Katharina',1),(8844,'Katharine',1),(8845,'Katherin',1),(8846,'Katherine',1),(8847,'Katherne',1),(8848,'Katheryn',1),(8849,'Katheryne',1),(8850,'Kathren',1),(8851,'Kathrine',1),(8852,'Katina',1),(8853,'Katixa',1),(8854,'Katja',1),(8855,'Katrina',1),(8856,'Katrine',1),(8857,'Katring',1),(8858,'Katryne',1),(8859,'Kattalin',1),(8860,'Katte',1),(8861,'Kea',1),(8862,'Keina',1),(8863,'Kemma',1),(8864,'Kephissa',1),(8865,'Kharmion',1),(8866,'Khle',1),(8867,'Khloris',1),(8868,'Kiena',1),(8869,'Kiles',1),(8870,'Kima',1),(8871,'Kimbery',1),(8872,'Kinborough',1),(8873,'Kinburga',1),(8874,'Kineburga',1),(8875,'Kinna',1),(8876,'Kistie',1),(8877,'Kitt',1),(8878,'Kitty',1),(8879,'Kizkitza',1),(8880,'Kizzy',1),(8881,'Kleio',1),(8882,'Kleopatra',1),(8883,'Klymene',1),(8884,'Klytemnestra',1),(8885,'Knellste',1),(8886,'Kodes',1),(8887,'Koldobike',1),(8888,'Kontxesi',1),(8889,'Kontzeziona',1),(8890,'Kordel',1),(8891,'Kordula',1),(8892,'Kor',1),(8893,'Koritto',1),(8894,'Koru',1),(8895,'Krabelin',1),(8896,'Kriemhild',1),(8897,'Kungund',1),(8898,'Kuni',1),(8899,'Kupe',1),(8900,'Kupie',1),(8901,'Kydilla',1),(8902,'Kymme',1),(8903,'Kyneburg',1),(8904,'Kynna',1),(8905,'Kynthia',1),(8906,'Kypris',1),(8907,'Kyra',1),(8908,'Kytte',1),(8909,'Labda',1),(8910,'Labinia',1),(8911,'Ladina',1),(8912,'Laetitia',1),(8913,'Lagliua',1),(8914,'Laguia',1),(8915,'Laguntzane',1),(8916,'Laida',1),(8917,'Lais',1),(8918,'Lalage',1),(8919,'Lall',1),(8920,'Lally',1),(8921,'Lamia',1),(8922,'Lamiaran',1),(8923,'Lamindao',1),(8924,'Lamke',1),(8925,'Lampetie',1),(8926,'Lampito',1),(8927,'Landa',1),(8928,'Landburuga',1),(8929,'Landerra',1),(8930,'Landgarda',1),(8931,'Landrada',1),(8932,'Langhuie',1),(8933,'Langiva',1),(8934,'Langlaua',1),(8935,'Langlif',1),(8936,'Lanike',1),(8937,'Lanthildis',1),(8938,'Lantuuara',1),(8939,'Laodameia',1),(8940,'Laodamia',1),(8941,'Laodice',1),(8942,'Laothoe',1),(8943,'Larraintzar',1),(8944,'Larraitz',1),(8945,'Larrara',1),(8946,'Larrauri',1),(8947,'Larraza',1),(8948,'Lasagain',1),(8949,'Lasarte',1),(8950,'Lasthena',1),(8951,'Latona',1),(8952,'Latsari',1),(8953,'Latxe',1),(8954,'Laua',1),(8955,'Laura',1),(8956,'Laurana',1),(8957,'Laurente',1),(8958,'Laurentia',1),(8959,'Laureola',1),(8960,'Lauretia',1),(8961,'Lauretta',1),(8962,'Lavena',1),(8963,'Lavin',1),(8964,'Lavina',1),(8965,'Lebdrudis',1),(8966,'Lece',1),(8967,'Lecelin',1),(8968,'Lecelina',1),(8969,'Lecenta',1),(8970,'Lecia',1),(8971,'Lecie',1),(8972,'Leda',1),(8973,'Leddinga',1),(8974,'Lede',1),(8975,'Lefchild',1),(8976,'Leffeda',1),(8977,'Leffquen',1),(8978,'Lefled',1),(8979,'Lefleda',1),(8980,'Lefquen',1),(8981,'Lefquena',1),(8982,'Lefquene',1),(8983,'Lefquenn',1),(8984,'Lefqwen',1),(8985,'Lefwen',1),(8986,'Lefwenna',1),(8987,'Legarda',1),(8988,'Legarra',1),(8989,'Legendika',1),(8990,'Legundia',1),(8991,'Leioar',1),(8992,'Leire',1),(8993,'Leitz',1),(8994,'Lekaretxe',1),(8995,'Lena',1),(8996,'Leocadia',1),(8997,'Leofwena',1),(8998,'Leogife',1),(8999,'Leolina',1),(9000,'Leonina',1),(9001,'Leontia',1),(9002,'Leorin',1),(9003,'Lerate',1),(9004,'Lerden',1),(9005,'Letasu',1),(9006,'Lete',1),(9007,'Letia',1),(9008,'Letice',1),(9009,'Leticia',1),(9010,'Leto',1),(9011,'Letoys',1),(9012,'Letselina',1),(9013,'Lett',1),(9014,'Lette',1),(9015,'Lettice',1),(9016,'Lettie',1),(9017,'Letty',1),(9018,'Letyce',1),(9019,'Leucothea',1),(9020,'Leucotho',1),(9021,'Leueiua',1),(9022,'Leuekin',1),(9023,'Leuerun',1),(9024,'Leueua',1),(9025,'Leueue',1),(9026,'Leuieua',1),(9027,'Leuild',1),(9028,'Leuiua',1),(9029,'Leurona',1),(9030,'Leurun',1),(9031,'Leuruna',1),(9032,'Leuuich',1),(9033,'Leveva',1),(9034,'Lewana',1),(9035,'Lewen',1),(9036,'Lewena',1),(9037,'Lexuri',1),(9038,'Lezaeta',1),(9039,'Lezana',1),(9040,'Lezeta',1),(9041,'Lia',1),(9042,'Liana',1),(9043,'Liaueld',1),(9044,'Libourc',1),(9045,'Licia',1),(9046,'Lictina',1),(9047,'Lide',1),(9048,'Lidiardis',1),(9049,'Liecia',1),(9050,'Liedrada',1),(9051,'Liefhun',1),(9052,'Lieftet',1),(9053,'Lientje',1),(9054,'Liepmayt',1),(9055,'Lierni',1),(9056,'Lieste',1),(9057,'Lietgarda',1),(9058,'Lietgardis',1),(9059,'Lietuuif',1),(9060,'Lieuuara',1),(9061,'Liffild',1),(9062,'Lifgarda',1),(9063,'Ligarda',1),(9064,'Lige',1),(9065,'Lili',1),(9066,'Lilura',1),(9067,'Limnoreia',1),(9068,'Lina',1),(9069,'Linda',1),(9070,'Lindi',1),(9071,'Linet',1),(9072,'Linette',1),(9073,'Linnet',1),(9074,'Linniue',1),(9075,'Linota',1),(9076,'Linyeve',1),(9077,'Linyive',1),(9078,'Liobgytha',1),(9079,'Liobsynde',1),(9080,'Liodburga',1),(9081,'Liodgard',1),(9082,'Liodrada',1),(9083,'Lion',1),(9084,'Lioness',1),(9085,'Lirain',1),(9086,'Lisia',1),(9087,'Litburh',1),(9088,'Litgardis',1),(9089,'Litiardis',1),(9090,'Liuete',1),(9091,'Liueua',1),(9092,'Liuilda',1),(9093,'Liuitha',1),(9094,'Liuiua',1),(9095,'Liutgarde',1),(9096,'Livid',1),(9097,'Livith',1),(9098,'Lizarazu',1),(9099,'Lohitzune',1),(9100,'Loinaz',1),(9101,'Lois',1),(9102,'Lootje',1),(9103,'Lopene',1),(9104,'Lora',1),(9105,'Lore',1),(9106,'Lorella',1),(9107,'Lorencete',1),(9108,'Loreta',1),(9109,'Lorete',1),(9110,'Loretta',1),(9111,'Lorie',1),(9112,'Lota',1),(9113,'Louisa',1),(9114,'Louve',1),(9115,'Loverun',1),(9116,'Loza',1),(9117,'Lubias',1),(9118,'Lubje',1),(9119,'Lubke',1),(9120,'Lucardis',1),(9121,'Luce',1),(9122,'Lucete',1),(9123,'Lucette',1),(9124,'Lucey',1),(9125,'Luciana',1),(9126,'Lucie',1),(9127,'Lucina',1),(9128,'Lucque',1),(9129,'Lucy',1),(9130,'Luffechild',1),(9131,'Lugardis',1),(9132,'Luilda',1),(9133,'Luixa',1),(9134,'Lukene',1),(9135,'Lumka',1),(9136,'Lumke',1),(9137,'Luned',1),(9138,'Lunet',1),(9139,'Lunete',1),(9140,'Lur',1),(9141,'Lutisse',1),(9142,'Luuechild',1),(9143,'Lynette',1),(9144,'Lyneue',1),(9145,'Lyonnete',1),(9146,'Lype',1),(9147,'Lyra',1),(9148,'Lyse',1),(9149,'Lyveva',1),(9150,'Maarrieta',1),(9151,'Mab',1),(9152,'Mabbe',1),(9153,'Mabel',1),(9154,'Mabell',1),(9155,'Mabella',1),(9156,'Mabet',1),(9157,'Mabil',1),(9158,'Mabila',1),(9159,'Mabile',1),(9160,'Mabileite',1),(9161,'Mabilete',1),(9162,'Mabiley',1),(9163,'Mabilia',1),(9164,'Mabilie',1),(9165,'Mabill',1),(9166,'Mabilla',1),(9167,'Mabillae',1),(9168,'Mabillia',1),(9169,'Mabin',1),(9170,'Mable',1),(9171,'Mabley',1),(9172,'Mably',1),(9173,'Mabot',1),(9174,'Mabota',1),(9175,'Mabs',1),(9176,'Mabyle',1),(9177,'Macedonia',1),(9178,'Machtildis',1),(9179,'Mactilda',1),(9180,'Mactildis',1),(9181,'Madelgarde',1),(9182,'Madelrada',1),(9183,'Madge',1),(9184,'Madhalberta',1),(9185,'Maeonia',1),(9186,'Maera',1),(9187,'Maerwynn',1),(9188,'Mag',1),(9189,'Mage',1),(9190,'Magg',1),(9191,'Magge',1),(9192,'Maggie',1),(9193,'Maggot',1),(9194,'Maggote',1),(9195,'Maghenyld',1),(9196,'Maghtild',1),(9197,'Magot',1),(9198,'Magota',1),(9199,'Magote',1),(9200,'Magott',1),(9201,'Magthildis',1),(9202,'Magtildis',1),(9203,'Magy',1),(9204,'Mahald',1),(9205,'Mahalt',1),(9206,'Mahats',1),(9207,'Mahaud',1),(9208,'Mahault',1),(9209,'Mahaut',1),(9210,'Mahenyld',1),(9211,'Maheut',1),(9212,'Mahhild',1),(9213,'Mahina',1),(9214,'Mahthild',1),(9215,'Mahthildis',1),(9216,'Maia',1),(9217,'Maialen',1),(9218,'Maiandria',1),(9219,'Maider',1),(9220,'Maike',1),(9221,'Maiken',1),(9222,'Mairangi',1),(9223,'Mairenni',1),(9224,'Maisie',1),(9225,'Maitagarri',1),(9226,'Maitane',1),(9227,'Maite',1),(9228,'Maiteder',1),(9229,'Maitena',1),(9230,'Makatza',1),(9231,'Malasintha',1),(9232,'Malasuintha',1),(9233,'Maldea',1),(9234,'Malen',1),(9235,'Manel',1),(9236,'Maneld',1),(9237,'Mania',1),(9238,'Manild',1),(9239,'Manna',1),(9240,'Mantzia',1),(9241,'Map',1),(9242,'Marabel',1),(9243,'Marama',1),(9244,'Margar',1),(9245,'Margaret',1),(9246,'Margareta',1),(9247,'Margarete',1),(9248,'Margarett',1),(9249,'Margarette',1),(9250,'Margaria',1),(9251,'Margarit',1),(9252,'Margarita',1),(9253,'Margat',1),(9254,'Margeria',1),(9255,'Margerie',1),(9256,'Margerye',1),(9257,'Marget',1),(9258,'Margetta',1),(9259,'Margoret',1),(9260,'Margot',1),(9261,'Margrat',1),(9262,'Margreit',1),(9263,'Margret',1),(9264,'Margriet',1),(9265,'Margue',1),(9266,'Marguerin',1),(9267,'Marguerite',1),(9268,'Margueritte',1),(9269,'Marguerot',1),(9270,'Margyt',1),(9271,'Mari',1),(9272,'Maria',1),(9273,'Mariaka',1),(9274,'Maribella',1),(9275,'Marider',1),(9276,'Marilena',1),(9277,'Mariora',1),(9278,'Mariorie',1),(9279,'Mariory',1),(9280,'Maritxu',1),(9281,'Marjer',1),(9282,'Marjeria',1),(9283,'Marjoria',1),(9284,'Marjorie',1),(9285,'Marjory',1),(9286,'Markaret',1),(9287,'Markuuara',1),(9288,'Marlies',1),(9289,'Maronne',1),(9290,'Marozia',1),(9291,'Marpessa',1),(9292,'Marquise',1),(9293,'Marrory',1),(9294,'Marsilia',1),(9295,'Martha',1),(9296,'Martie',1),(9297,'Martine',1),(9298,'Martixa',1),(9299,'Martxelie',1),(9300,'Mary',1),(9301,'Maryell',1),(9302,'Masawa',1),(9303,'Masticana',1),(9304,'Matasuntha',1),(9305,'Mathe',1),(9306,'Matheld',1),(9307,'Mathena',1),(9308,'Mathila',1),(9309,'Mathild',1),(9310,'Mathildis',1),(9311,'Matild',1),(9312,'Matilde',1),(9313,'Matildis',1),(9314,'Matill',1),(9315,'Matilldis',1),(9316,'Matillis',1),(9317,'Mattie',1),(9318,'Matty',1),(9319,'Matxalen',1),(9320,'Maud',1),(9321,'Maude',1),(9322,'Maughtild',1),(9323,'Mauld',1),(9324,'Maura',1),(9325,'Mauriana',1),(9326,'Maut',1),(9327,'Mautild',1),(9328,'Mawd',1),(9329,'Mawde',1),(9330,'Mawt',1),(9331,'Maxencia',1),(9332,'Maximina',1),(9333,'Maynild',1),(9334,'Maysant',1),(9335,'Maysaunt',1),(9336,'Mazelina',1),(9337,'Meaka',1),(9338,'Mechtild',1),(9339,'Meckil',1),(9340,'Medea',1),(9341,'Medesicaste',1),(9342,'Meemte',1),(9343,'Meg',1),(9344,'Megaera',1),(9345,'Megara',1),(9346,'Megare',1),(9347,'Megaris',1),(9348,'Mege',1),(9349,'Megenberta',1),(9350,'Megendrod',1),(9351,'Megenhelda',1),(9352,'Megenlind',1),(9353,'Megenlioba',1),(9354,'Megensind',1),(9355,'Megensinda',1),(9356,'Megenuuara',1),(9357,'Megethia',1),(9358,'Megge',1),(9359,'Meggot',1),(9360,'Megy',1),(9361,'Mehenilda',1),(9362,'Meifte',1),(9363,'Meinburg',1),(9364,'Meinnelda',1),(9365,'Meinsent',1),(9366,'Meinswindis',1),(9367,'Meisent',1),(9368,'Meite',1),(9369,'Melania',1),(9370,'Melanie',1),(9371,'Melantho',1),(9372,'Meldred',1),(9373,'Melicent',1),(9374,'Melisant',1),(9375,'Melisenda',1),(9376,'Melisent',1),(9377,'Melisentia',1),(9378,'Melissa',1),(9379,'Melissent',1),(9380,'Melita',1),(9381,'Melite',1),(9382,'Melodia',1),(9383,'Melodie',1),(9384,'Melusine',1),(9385,'Menborch',1),(9386,'Mendi',1),(9387,'Mendia',1),(9388,'Mendiete',1),(9389,'Mendigaa',1),(9390,'Menelaia',1),(9391,'Menga',1),(9392,'Mengarde',1),(9393,'Menica',1),(9394,'Menosa',1),(9395,'Mentzia',1),(9396,'Meraud',1),(9397,'Mere',1),(9398,'Merewen',1),(9399,'Merewina',1),(9400,'Merget',1),(9401,'Mergret',1),(9402,'Merhild',1),(9403,'Meriall',1),(9404,'Meriel',1),(9405,'Merilda',1),(9406,'Merope',1),(9407,'Merwenna',1),(9408,'Meryall',1),(9409,'Meryld',1),(9410,'Methdin',1),(9411,'Methild',1),(9412,'Methildis',1),(9413,'Metis',1),(9414,'Metriche',1),(9415,'Metylda',1),(9416,'Michaela',1),(9417,'Michile',1),(9418,'Mientje',1),(9419,'Mikele',1),(9420,'Milagros',1),(9421,'Milborough',1),(9422,'Milbrer',1),(9423,'Milburegh',1),(9424,'Milburew',1),(9425,'Milburga',1),(9426,'Milburh',1),(9427,'Milbury',1),(9428,'Milcentia',1),(9429,'Mildthryth',1),(9430,'Milesent',1),(9431,'Milessent',1),(9432,'Milia',1),(9433,'Milicent',1),(9434,'Milicenta',1),(9435,'Milisandia',1),(9436,'Milisant',1),(9437,'Milisendis',1),(9438,'Milisent',1),(9439,'Milla',1),(9440,'Mille',1),(9441,'Millesant',1),(9442,'Millesenta',1),(9443,'Milo',1),(9444,'Milto',1),(9445,'Mina',1),(9446,'Minervina',1),(9447,'Miniain',1),(9448,'Minicea',1),(9449,'Minna',1),(9450,'Minnota',1),(9451,'Mique',1),(9452,'Mira',1),(9453,'Mirabell',1),(9454,'Mirabella',1),(9455,'Mirabelle',1),(9456,'Mirabilis',1),(9457,'Mirabillla',1),(9458,'Mirable',1),(9459,'Mirari',1),(9460,'Mirella',1),(9461,'Miren',1),(9462,'Mirentxu',1),(9463,'Miriald',1),(9464,'Miriel',1),(9465,'Miriela',1),(9466,'Mirield',1),(9467,'Mirielda',1),(9468,'Mirielis',1),(9469,'Miriella',1),(9470,'Miriild',1),(9471,'Mirils',1),(9472,'Missa',1),(9473,'Mitri',1),(9474,'Mitxoleta',1),(9475,'Moder',1),(9476,'Moderte',1),(9477,'Modesty',1),(9478,'Moe',1),(9479,'Mog',1),(9480,'Mogg',1),(9481,'Mogge',1),(9482,'Mogota',1),(9483,'Mohaut',1),(9484,'Molara',1),(9485,'Mold',1),(9486,'Molde',1),(9487,'Molora',1),(9488,'Molpadia',1),(9489,'Molt',1),(9490,'Monette',1),(9491,'Monima',1),(9492,'Monime',1),(9493,'Monlora',1),(9494,'Montagne',1),(9495,'Moolde',1),(9496,'Mopp',1),(9497,'Moppe',1),(9498,'Moschia',1),(9499,'Mott',1),(9500,'Motte',1),(9501,'Moude',1),(9502,'Moulde',1),(9503,'Moysant',1),(9504,'Moysent',1),(9505,'Munia',1),(9506,'Muno',1),(9507,'Munondoa',1),(9508,'Muntsaratz',1),(9509,'Murgindueta',1),(9510,'Murie',1),(9511,'Muriel',1),(9512,'Muriele',1),(9513,'Muriella',1),(9514,'Murienne',1),(9515,'Murina',1),(9516,'Muruzabal',1),(9517,'Muskilda',1),(9518,'Muskoa',1),(9519,'Muxika',1),(9520,'Mydrede',1),(9521,'Mykale',1),(9522,'Mylecent',1),(9523,'Mylisant',1),(9524,'Mylla',1),(9525,'Mylle',1),(9526,'Myrine',1),(9527,'Nabarne',1),(9528,'Nabarra',1),(9529,'Nafarroa',1),(9530,'Nagore',1),(9531,'Nahikari',1),(9532,'Naiara',1),(9533,'Nane',1),(9534,'Nantechildis',1),(9535,'Naroa',1),(9536,'Natividad',1),(9537,'Nausicaa',1),(9538,'Nazubal',1),(9539,'Neaera',1),(9540,'Negu',1),(9541,'Nekane',1),(9542,'Nell',1),(9543,'Nellie',1),(9544,'Nelly',1),(9545,'Nemerte',1),(9546,'Nephele',1),(9547,'Nerea',1),(9548,'Nereida',1),(9549,'Nesaea',1),(9550,'Nest',1),(9551,'Nesta',1),(9552,'Ngaio',1),(9553,'Ngawai',1),(9554,'Nicasia',1),(9555,'Nichola',1),(9556,'Nicholaa',1),(9557,'Nichole',1),(9558,'Nicholina',1),(9559,'Nicia',1),(9560,'Nicol',1),(9561,'Nicola',1),(9562,'Nicolaa',1),(9563,'Nicole',1),(9564,'Nicopolis',1),(9565,'Nidlebis',1),(9566,'Niesenn',1),(9567,'Nieves',1),(9568,'Nikaia',1),(9569,'Nikasepolis',1),(9570,'Niko',1),(9571,'Nikole',1),(9572,'Niobe',1),(9573,'Niree',1),(9574,'Noblete',1),(9575,'Nog',1),(9576,'Nogga',1),(9577,'Nogge',1),(9578,'Nonna',1),(9579,'Nora',1),(9580,'Nordrada',1),(9581,'Norma',1),(9582,'Nunile',1),(9583,'Nycaise',1),(9584,'Nyra',1),(9585,'Nyree',1),(9586,'Nyrie',1),(9587,'Nysa',1),(9588,'Ockje',1),(9589,'Oda',1),(9590,'Odala',1),(9591,'Odburga',1),(9592,'Odela',1),(9593,'Odelina',1),(9594,'Odgiva',1),(9595,'Odguda',1),(9596,'Odgudana',1),(9597,'Odiern',1),(9598,'Odierna',1),(9599,'Odierne',1),(9600,'Odila',1),(9601,'Odile',1),(9602,'Odilia',1),(9603,'Odlenda',1),(9604,'Odolina',1),(9605,'Odriana',1),(9606,'Oenone',1),(9607,'Ogiva',1),(9608,'Oianko',1),(9609,'Oiartza',1),(9610,'Oibar',1),(9611,'Oihana',1),(9612,'Oihane',1),(9613,'Oilandoi',1),(9614,'Oinaze',1),(9615,'Oitane',1),(9616,'Oitia',1),(9617,'Oka',1),(9618,'Okon',1),(9619,'Olaia',1),(9620,'Olaiz',1),(9621,'Olalla',1),(9622,'Olar',1),(9623,'Olaria',1),(9624,'Olartia',1),(9625,'Olatz',1),(9626,'Olburgis',1),(9627,'Olga',1),(9628,'Olif',1),(9629,'Oliff',1),(9630,'Olimpias',1),(9631,'Olite',1),(9632,'Oliua',1),(9633,'Olive',1),(9634,'Olivet',1),(9635,'Olivia',1),(9636,'Ollano',1),(9637,'Olleta',1),(9638,'Ollett',1),(9639,'Olligtie',1),(9640,'Oloriz',1),(9641,'Olyff',1),(9642,'Olyffe',1),(9643,'Olympias',1),(9644,'Olyve',1),(9645,'Omphale',1),(9646,'Onditz',1),(9647,'Ondiz',1),(9648,'Oneka',1),(9649,'Onintza',1),(9650,'Onora',1),(9651,'Opakua',1),(9652,'Optata',1),(9653,'Orabell',1),(9654,'Orabella',1),(9655,'Orabilia',1),(9656,'Orabilis',1),(9657,'Orabla',1),(9658,'Orable',1),(9659,'Orbaiz',1),(9660,'Ordizia',1),(9661,'Oreithuia',1),(9662,'Oreithyia',1),(9663,'Orella',1),(9664,'Orenge',1),(9665,'Orengia',1),(9666,'Oreute',1),(9667,'Organa',1),(9668,'Oria',1),(9669,'Oriabel',1),(9670,'Oriande',1),(9671,'Oriante',1),(9672,'Orieldis',1),(9673,'Oriholt',1),(9674,'Oriold',1),(9675,'Oriolda',1),(9676,'Oriolt',1),(9677,'Orithyia',1),(9678,'Oriz',1),(9679,'Oro',1),(9680,'Oroitze',1),(9681,'Ororbia',1),(9682,'Orose',1),(9683,'Orrao',1),(9684,'Orreaga',1),(9685,'Orsina',1),(9686,'Orsola',1),(9687,'Orthia',1),(9688,'Orzuri',1),(9689,'Osabide',1),(9690,'Osakun',1),(9691,'Osane',1),(9692,'Osasune',1),(9693,'Osgarda',1),(9694,'Osgiua',1),(9695,'Osina',1),(9696,'Osith',1),(9697,'Ositha',1),(9698,'Oskia',1),(9699,'Osteriz',1),(9700,'Osthryd',1),(9701,'Ostrogotho',1),(9702,'Ostryd',1),(9703,'Ostrythe',1),(9704,'Osyth',1),(9705,'Otberta',1),(9706,'Otgiua',1),(9707,'Otgiva',1),(9708,'Otilia',1),(9709,'Otonia',1),(9710,'Otsana',1),(9711,'Otsanda',1),(9712,'Ottavia',1),(9713,'Ottilia',1),(9714,'Otzaurte',1),(9715,'Ourlady',1),(9716,'Ourse',1),(9717,'Oydela',1),(9718,'Pacchild',1),(9719,'Palatina',1),(9720,'Pales',1),(9721,'Pandonia',1),(9722,'Pandwyna',1),(9723,'Panope',1),(9724,'Panora',1),(9725,'Panpoxa',1),(9726,'Patxi',1),(9727,'Pare',1),(9728,'Parezi',1),(9729,'Parise',1),(9730,'Parisete',1),(9731,'Parmys',1),(9732,'Parnel',1),(9733,'Parnell',1),(9734,'Paronel',1),(9735,'Parthenia',1),(9736,'Parthenope',1),(9737,'Parysatis',1),(9738,'Pasara',1),(9739,'Pasiphae',1),(9740,'Paskalin',1),(9741,'Pasques',1),(9742,'Passara',1),(9743,'Passerose',1),(9744,'Pateria',1),(9745,'Paternain',1),(9746,'Patricia',1),(9747,'Patty',1),(9748,'Pauee',1),(9749,'Paui',1),(9750,'Pauie',1),(9751,'Paula',1),(9752,'Pauli',1),(9753,'Paulina',1),(9754,'Paveya',1),(9755,'Paveye',1),(9756,'Paz',1),(9757,'Pechel',1),(9758,'Peg',1),(9759,'Peggy',1),(9760,'Pelela',1),(9761,'Pelopia',1),(9762,'Peneli',1),(9763,'Penelope',1),(9764,'Penne',1),(9765,'Pentecost',1),(9766,'Pentecouste',1),(9767,'Penthesilea',1),(9768,'Percalus',1),(9769,'Pereite',1),(9770,'Perialla',1),(9771,'Periboea',1),(9772,'Pericleia',1),(9773,'Pernel',1),(9774,'Pernella',1),(9775,'Pernelle',1),(9776,'Pero',1),(9777,'Peronel',1),(9778,'Peronele',1),(9779,'Peronell',1),(9780,'Peronelle',1),(9781,'Perrete',1),(9782,'Perronele',1),(9783,'Perronnele',1),(9784,'Perronnelle',1),(9785,'Perrote',1),(9786,'Perse',1),(9787,'Persephone',1),(9788,'Persis',1),(9789,'Pertesia',1),(9790,'Pertxenta',1),(9791,'Pervica',1),(9792,'Pervinca',1),(9793,'Peryna',1),(9794,'Peta',1),(9795,'Peternel',1),(9796,'Peternell',1),(9797,'Peternella',1),(9798,'Petje',1),(9799,'Petrona',1),(9800,'Petronel',1),(9801,'Petronella',1),(9802,'Petronilla',1),(9803,'Petronille',1),(9804,'Petronyl',1),(9805,'Phaedra',1),(9806,'Phaedre',1),(9807,'Phaedyme',1),(9808,'Phaethusa',1),(9809,'Phaia',1),(9810,'Pharahildis',1),(9811,'Phelipote',1),(9812,'Phelis',1),(9813,'Phemie',1),(9814,'Pherenike',1),(9815,'Pheretima',1),(9816,'Pherusa',1),(9817,'Phigaleia',1),(9818,'Philea',1),(9819,'Philinna',1),(9820,'Philip',1),(9821,'Philippe',1),(9822,'Philles',1),(9823,'Phillice',1),(9824,'Phillida',1),(9825,'Phillip',1),(9826,'Philomache',1),(9827,'Philomela',1),(9828,'Philomena',1),(9829,'Philona',1),(9830,'Philota',1),(9831,'Phoebe',1),(9832,'Phratagune',1),(9833,'Phryne',1),(9834,'Phylace',1),(9835,'Phylia',1),(9836,'Phyllis',1),(9837,'Phylo',1),(9838,'Phylomedusa',1),(9839,'Pia',1),(9840,'Piedad',1),(9841,'Pilar',1),(9842,'Pilare',1),(9843,'Pipa',1),(9844,'Pippa',1),(9845,'Pizkunde',1),(9846,'Placencia',1),(9847,'Placidia',1),(9848,'Placidina',1),(9849,'Pleasant',1),(9850,'Pleasaunce',1),(9851,'Plectrudis',1),(9852,'Plente',1),(9853,'Plesance',1),(9854,'Plesancia',1),(9855,'Plesantia',1),(9856,'Plesencia',1),(9857,'Podarge',1),(9858,'Pogge',1),(9859,'Poggy',1),(9860,'Poko',1),(9861,'Polly',1),(9862,'Polycaste',1),(9863,'Polydamna',1),(9864,'Polydora',1),(9865,'Polymede',1),(9866,'Polyxena',1),(9867,'Pompeiana',1),(9868,'Popelina',1),(9869,'Poyo',1),(9870,'Pozne',1),(9871,'Praeiecta',1),(9872,'Preciosa',1),(9873,'Precious',1),(9874,'Presentacion',1),(9875,'Primaveira',1),(9876,'Primeveire',1),(9877,'Printza',1),(9878,'Proba',1),(9879,'Probina',1),(9880,'Procne',1),(9881,'Procris',1),(9882,'Prone',1),(9883,'Pronle',1),(9884,'Proseria',1),(9885,'Protezy',1),(9886,'Prothasey',1),(9887,'Prothesia',1),(9888,'Proto',1),(9889,'Protogonia',1),(9890,'Prudencia',1),(9891,'Prudentia',1),(9892,'Prudie',1),(9893,'Prue',1),(9894,'Psamathe',1),(9895,'Psyche',1),(9896,'Pueyo',1),(9897,'Purificacion',1),(9898,'Purissimma',1),(9899,'Purnelle',1),(9900,'Purnle',1),(9901,'Putiputi',1),(9902,'Puy',1),(9903,'Pylia',1),(9904,'Pypa',1),(9905,'Pyrrha',1),(9906,'Pythias',1),(9907,'Quenburga',1),(9908,'Quenell',1),(9909,'Queneua',1),(9910,'Quenild',1),(9911,'Quenilda',1),(9912,'Quenill',1),(9913,'Quenilla',1),(9914,'Queniua',1),(9915,'Quenyeve',1),(9916,'Quenylda',1),(9917,'Quynel',1),(9918,'Qwinhild',1),(9919,'Ra',1),(9920,'Radagundis',1),(9921,'Radborg',1),(9922,'Radburg',1),(9923,'Radburgis',1),(9924,'Radegund',1),(9925,'Radeken',1),(9926,'Radgert',1),(9927,'Radlia',1),(9928,'Radogund',1),(9929,'Radsuinda',1),(9930,'Rainilda',1),(9931,'Rainildis',1),(9932,'Raisa',1),(9933,'Ramburga',1),(9934,'Rametta',1),(9935,'Ramona',1),(9936,'Rangi',1),(9937,'Rante',1),(9938,'Rata',1),(9939,'RayneReine',1),(9940,'Rechemay',1),(9941,'Reenste',1),(9942,'Reeste',1),(9943,'Regana',1),(9944,'Regenburuga',1),(9945,'Regenelda',1),(9946,'Regenlind',1),(9947,'Regenset',1),(9948,'Reginsuint',1),(9949,'Regneuuig',1),(9950,'Regula',1),(9951,'Reimerich',1),(9952,'Reinewif',1),(9953,'Reingard',1),(9954,'Reingardis',1),(9955,'Reingart',1),(9956,'Reingaud',1),(9957,'Reingod',1),(9958,'Reinhedis',1),(9959,'Reinne',1),(9960,'Reinsuent',1),(9961,'Relindis',1),(9962,'Remedios',1),(9963,'Renata',1),(9964,'Renburgis',1),(9965,'Renilla',1),(9966,'Rennewief',1),(9967,'Rerte',1),(9968,'Resli',1),(9969,'Reta',1),(9970,'Rewa',1),(9971,'Rewi',1),(9972,'Reyna',1),(9973,'Reyne',1),(9974,'Rhea',1),(9975,'Rhene',1),(9976,'Rhoda',1),(9977,'Rhode',1),(9978,'Rhodope',1),(9979,'Riberta',1),(9980,'Richardyne',1),(9981,'Richelda',1),(9982,'Richemeya',1),(9983,'Richenda',1),(9984,'Richenza',1),(9985,'Richessa',1),(9986,'Richil',1),(9987,'Richild',1),(9988,'Richildis',1),(9989,'Richill',1),(9990,'Richmal',1),(9991,'Richoard',1),(9992,'Richolda',1),(9993,'Riclindis',1),(9994,'Ricolda',1),(9995,'Ricsuinda',1),(9996,'Rieke',1),(9997,'Rikild',1),(9998,'Rikilda',1),(9999,'Rikilde',1),(10000,'Rikildis',1),(10001,'Rikmai',1),(10002,'Rinelt',1),(10003,'Rinilda',1),(10004,'Rinne',1),(10005,'Rinnett',1),(10006,'Rixenda',1),(10007,'Rixende',1),(10008,'Roana',1),(10009,'Roberge',1),(10010,'Rochilda',1),(10011,'Rodburga',1),(10012,'Rodelinda',1),(10013,'Rodgarda',1),(10014,'Rodgardae',1),(10015,'Roes',1),(10016,'Roese',1),(10017,'Roesia',1),(10018,'Roesli',1),(10019,'Rofsind',1),(10020,'Rogerete',1),(10021,'Roheis',1),(10022,'Roheisa',1),(10023,'Roheisia',1),(10024,'Rohese',1),(10025,'Rohesia',1),(10026,'Rohez',1),(10027,'Roimata',1),(10028,'Roisia',1),(10029,'Rokilda',1),(10030,'Roos',1),(10031,'Rosa',1),(10032,'Rosalind',1),(10033,'Rosalinda',1),(10034,'Rosaline',1),(10035,'Rosamond',1),(10036,'Rosamund',1),(10037,'Rosamunda',1),(10038,'Rosario',1),(10039,'Rose',1),(10040,'Roseaman',1),(10041,'Roseia',1),(10042,'Rosemond',1),(10043,'Rosemonde',1),(10044,'Rosemunda',1),(10045,'Roslindis',1),(10046,'Rosomon',1),(10047,'Rossamond',1),(10048,'Roste',1),(10049,'Roswitha',1),(10050,'Rotburga',1),(10051,'Rothaide',1),(10052,'Rothais',1),(10053,'Rothin',1),(10054,'Rotlenda',1),(10055,'Rotrude',1),(10056,'Rotrudis',1),(10057,'Rousse',1),(10058,'Roxane',1),(10059,'Royce',1),(10060,'Roysa',1),(10061,'Royse',1),(10062,'Roysia',1),(10063,'Rozeman',1),(10064,'Rubea',1),(10065,'Ruothilde',1),(10066,'Rupe',1),(10067,'Rustica',1),(10068,'Rusticana',1),(10069,'Rychyld',1),(10070,'Rykeld',1),(10071,'Sabbe',1),(10072,'Sabie',1),(10073,'Sabin',1),(10074,'Sabine',1),(10075,'Saby',1),(10076,'Sabyn',1),(10077,'Saethrith',1),(10078,'Saethryda',1),(10079,'Sagarduia',1),(10080,'Sagari',1),(10081,'Sageua',1),(10082,'Sageue',1),(10083,'Sahats',1),(10084,'Saieua',1),(10085,'Saintisme',1),(10086,'Saints',1),(10087,'Saioa',1),(10088,'Saiua',1),(10089,'Salerna',1),(10090,'Sallurtegi',1),(10091,'Saloua',1),(10092,'Salove',1),(10093,'Salvianella',1),(10094,'Samke',1),(10095,'Sanceline',1),(10096,'Sancha',1),(10097,'Sanche',1),(10098,'Sanctia',1),(10099,'Santutxo',1),(10100,'Sappho',1),(10101,'Sarke',1),(10102,'Sayeua',1),(10103,'Sayeva',1),(10104,'Sayntes',1),(10105,'Sayua',1),(10106,'Scholace',1),(10107,'Scholast',1),(10108,'Science',1),(10109,'Sciencia',1),(10110,'Scientia',1),(10111,'Scolacia',1),(10112,'Scolastica',1),(10113,'Scylla',1),(10114,'Sebasteia',1),(10115,'Seburg',1),(10116,'Seburga',1),(10117,'Seburuh',1),(10118,'Secile',1),(10119,'Sedaina',1),(10120,'Sedania',1),(10121,'Sedehanna',1),(10122,'Sedemai',1),(10123,'Sedemaiden',1),(10124,'Sedemode',1),(10125,'Sedille',1),(10126,'Sdillon',1),(10127,'Sedilon',1),(10128,'Seghuie',1),(10129,'Seheve',1),(10130,'Seiua',1),(10131,'Sela',1),(10132,'Selinah',1),(10133,'Seloua',1),(10134,'Seloue',1),(10135,'Selova',1),(10136,'Seluue',1),(10137,'Sely',1),(10138,'Semele',1),(10139,'Semera',1),(10140,'Sence',1),(10141,'Sens',1),(10142,'Senses',1),(10143,'Serena',1),(10144,'Sergia',1),(10145,'Seuar',1),(10146,'Seuare',1),(10147,'Sewenna',1),(10148,'Seyiua',1),(10149,'Seyua',1),(10150,'Sib',1),(10151,'Sibb',1),(10152,'Sibba',1),(10153,'Sibbe',1),(10154,'Sibbet',1),(10155,'Sibbly',1),(10156,'Sibbot',1),(10157,'Sibel',1),(10158,'Sibeli',1),(10159,'Sibell',1),(10160,'Sibella',1),(10161,'Sibely',1),(10162,'Sibil',1),(10163,'Sibile',1),(10164,'Sibilia',1),(10165,'Sibilie',1),(10166,'Sibilla',1),(10167,'Sibley',1),(10168,'Sibli',1),(10169,'Sibly',1),(10170,'Siborch',1),(10171,'Sibota',1),(10172,'Sibri',1),(10173,'Sibry',1),(10174,'Siburg',1),(10175,'Sibyll',1),(10176,'Sibylla',1),(10177,'Sicillia',1),(10178,'Siddon',1),(10179,'Sidney',1),(10180,'Sidonia',1),(10181,'Sidonie',1),(10182,'Sieber',1),(10183,'Sierida',1),(10184,'Sieverte',1),(10185,'Sigarda',1),(10186,'Sigberta',1),(10187,'Sigeberta',1),(10188,'Sigeburgis',1),(10189,'Sigerith',1),(10190,'Sigethrod',1),(10191,'Sigiburgis',1),(10192,'Silke',1),(10193,'Sillina',1),(10194,'Silva',1),(10195,'Similce',1),(10196,'Sina',1),(10197,'Sindonia',1),(10198,'Sira',1),(10199,'Sirida',1),(10200,'Siscella',1),(10201,'Sisilla',1),(10202,'Sisley',1),(10203,'Sisse',1),(10204,'Sissota',1),(10205,'Sisygambis',1),(10206,'Sjante',1),(10207,'Snelburch',1),(10208,'Soberich',1),(10209,'Sofie',1),(10210,'Soiartze',1),(10211,'Sokorri',1),(10212,'Sol',1),(10213,'Soledad',1),(10214,'Sonja',1),(10215,'Sophia',1),(10216,'Sophoniba',1),(10217,'Sophonisba',1),(10218,'Sophonsiba',1),(10219,'Sorauren',1),(10220,'Sorkunde',1),(10221,'Sorne',1),(10222,'Soskao',1),(10223,'Sotera',1),(10224,'Soterraa',1),(10225,'Souplice',1),(10226,'Speio',1),(10227,'Splendora',1),(10228,'Sreda',1),(10229,'Stacia',1),(10230,'Stamburc',1),(10231,'Stanborw',1),(10232,'Stanburch',1),(10233,'Stangiva',1),(10234,'Stanguie',1),(10235,'Stanhilda',1),(10236,'Stanild',1),(10237,'Stanilde',1),(10238,'Stanuie',1),(10239,'Stanyue',1),(10240,'Stateira',1),(10241,'Stenburch',1),(10242,'Stephanie',1),(10243,'Stheneboea',1),(10244,'Stientje',1),(10245,'Stilleuuara',1),(10246,'Stina',1),(10247,'Stonild',1),(10248,'Stonilda',1),(10249,'Stonildi',1),(10250,'Stratonice',1),(10251,'Strilleburg',1),(10252,'Sueta',1),(10253,'Sueteluue',1),(10254,'Suitburgis',1),(10255,'Sungyve',1),(10256,'Sunigilda',1),(10257,'Sunilda',1),(10258,'Sunna',1),(10259,'Sunngifu',1),(10260,'Susanna',1),(10261,'Swale',1),(10262,'Swantje',1),(10263,'Sweteloue',1),(10264,'Swetelove',1),(10265,'Swethyna',1),(10266,'Swetiue',1),(10267,'Swetyene',1),(10268,'Swetyne',1),(10269,'Syagria',1),(10270,'Syardis',1),(10271,'Sybbly',1),(10272,'Sybby',1),(10273,'Sybell',1),(10274,'Sybil',1),(10275,'Sybill',1),(10276,'Sybilla',1),(10277,'Sybille',1),(10278,'Sybyle',1),(10279,'Sybyll',1),(10280,'Sybyly',1),(10281,'Sycily',1),(10282,'Syele',1),(10283,'Synnove',1),(10284,'Sysley',1),(10285,'Syslye',1),(10286,'Tacey',1),(10287,'Tacia',1),(10288,'Tacye',1),(10289,'Taggett',1),(10290,'Taggy',1),(10291,'Taiaroa',1),(10292,'Talaitha',1),(10293,'Tamati',1),(10294,'Tatje',1),(10295,'Tawhaki',1),(10296,'Tece',1),(10297,'Tecmessa',1),(10298,'Tede',1),(10299,'Telephassa',1),(10300,'Teresa',1),(10301,'Terese',1),(10302,'Tetradia',1),(10303,'Tetxa',1),(10304,'Teudsindis',1),(10305,'Thais',1),(10306,'Thalassa',1),(10307,'Thaleia',1),(10308,'Thalke',1),(10309,'Thancuuara',1),(10310,'Thangustella',1),(10311,'Thea',1),(10312,'Theaduuara',1),(10313,'Theano',1),(10314,'Thebe',1),(10315,'Thedela',1),(10316,'Theeste',1),(10317,'Theldred',1),(10318,'Theldry',1),(10319,'Thelma',1),(10320,'Themis',1),(10321,'Theocharista',1),(10322,'Theodananda',1),(10323,'Theodelinda',1),(10324,'Theoderada',1),(10325,'Theodora',1),(10326,'Theodoracis',1),(10327,'Theodosia',1),(10328,'Theodotis',1),(10329,'Theognosia',1),(10330,'Theophane',1),(10331,'Theophania',1),(10332,'Theophano',1),(10333,'Theresa',1),(10334,'Thessala',1),(10335,'Thessalonike',1),(10336,'Thetis',1),(10337,'Theutberga',1),(10338,'Thidela',1),(10339,'Thieda',1),(10340,'Thietgarda',1),(10341,'Thietuuich',1),(10342,'Thietwara',1),(10343,'Thiodsind',1),(10344,'Thiodsuinda',1),(10345,'Thisbe',1),(10346,'Thiudigotho',1),(10347,'Thiutuuara',1),(10348,'Tho',1),(10349,'Thomassa',1),(10350,'Thomassia',1),(10351,'Thosa',1),(10352,'Thrasborg',1),(10353,'Thrudberga',1),(10354,'Thyia',1),(10355,'Tice',1),(10356,'Ticekin',1),(10357,'Tiece',1),(10358,'Tice',1),(10359,'Tiecelin',1),(10360,'Tiecia',1),(10361,'Tiede',1),(10362,'Tietlenda',1),(10363,'Tietza',1),(10364,'Tilda',1),(10365,'Till',1),(10366,'Tilla',1),(10367,'Tille',1),(10368,'Tillie',1),(10369,'Tillot',1),(10370,'Tillota',1),(10371,'Tillote',1),(10372,'Tilly',1),(10373,'Timandra',1),(10374,'Timo',1),(10375,'Tina',1),(10376,'Tiwho',1),(10377,'Tjabbend',1),(10378,'Tjalde',1),(10379,'Toda',1),(10380,'Toi',1),(10381,'Toloo',1),(10382,'Tomyris',1),(10383,'Tonna',1),(10384,'Toto',1),(10385,'Trhutborgana',1),(10386,'Trinidad',1),(10387,'Trissie',1),(10388,'Trixie',1),(10389,'Truda',1),(10390,'Trudi',1),(10391,'Trudlinde',1),(10392,'True',1),(10393,'Truffeni',1),(10394,'Trutilda',1),(10395,'Tryphena',1),(10396,'Tryphosa',1),(10397,'Tui',1),(10398,'Tungia',1),(10399,'Turi',1),(10400,'Txori',1),(10401,'Tyce',1),(10402,'Tyecelin',1),(10403,'Tyeceline',1),(10404,'Tyro',1),(10405,'Ualdburg',1),(10406,'Ualdethruda',1),(10407,'Uba',1),(10408,'Ubaga',1),(10409,'Ubarriaran',1),(10410,'Uda',1),(10411,'Udaberri',1),(10412,'Udala',1),(10413,'Udane',1),(10414,'Udara',1),(10415,'Udazken',1),(10416,'Udelina',1),(10417,'Udeline',1),(10418,'Udiarraga',1),(10419,'Udoz',1),(10420,'Ueremund',1),(10421,'Uerenburoc',1),(10422,'Uga',1),(10423,'Ugarte',1),(10424,'Uiburgis',1),(10425,'Uindborog',1),(10426,'Uinebarga',1),(10427,'Uireda',1),(10428,'Ula',1),(10429,'Ulfhild',1),(10430,'Ulgarda',1),(10431,'Uli',1),(10432,'Ulia',1),(10433,'Ulveva',1),(10434,'Unice',1),(10435,'Untza',1),(10436,'Untzizu',1),(10437,'Uoldolberta',1),(10438,'Uraburu',1),(10439,'Uralde',1),(10440,'Urbe',1),(10441,'Urcy',1),(10442,'Urdaiaga',1),(10443,'Urdie',1),(10444,'Urdina',1),(10445,'Uriarte',1),(10446,'Uribarri',1),(10447,'Urie',1),(10448,'Uriz',1),(10449,'Urkia',1),(10450,'Uronea',1),(10451,'Urraka',1),(10452,'Urrategi',1),(10453,'Urrea',1),(10454,'Urreturre',1),(10455,'Urretxa',1),(10456,'Urrexola',1),(10457,'Urrialdo',1),(10458,'Urroz',1),(10459,'Ursaly',1),(10460,'Ursel',1),(10461,'Urseley',1),(10462,'Ursell',1),(10463,'Ursola',1),(10464,'Urtune',1),(10465,'Urtza',1),(10466,'Urtzumu',1),(10467,'Uschi',1),(10468,'Usmene',1),(10469,'Usoa',1),(10470,'Usue',1),(10471,'Usune',1),(10472,'Utsune',1),(10473,'Uzuri',1),(10474,'adamerca',1),(10475,'Valdamerca',1),(10476,'Vanora',1),(10477,'Veleda',1),(10478,'Veneranda',1),(10479,'Verena',1),(10480,'Vesta',1),(10481,'Vigilantia',1),(10482,'Vigilia',1),(10483,'Violante',1),(10484,'Violet',1),(10485,'Violetta',1),(10486,'Violette',1),(10487,'Visitacion',1),(10488,'Vitula',1),(10489,'Vivian',1),(10490,'Viviana',1),(10491,'Vivien',1),(10492,'Vivienne',1),(10493,'Vreneli',1),(10494,'Vreni',1),(10495,'Vrowecin',1),(10496,'Vualdberta',1),(10497,'Vualdedruda',1),(10498,'Vualdetruda',1),(10499,'Vuifken',1),(10500,'Vuinetberta',1),(10501,'Vuissance',1),(10502,'Vuiuechin',1),(10503,'Wackrill',1),(10504,'Waerburg',1),(10505,'Waitohi',1),(10506,'Waldburg',1),(10507,'Waldrada',1),(10508,'Wander',1),(10509,'Wannore',1),(10510,'Wannour',1),(10511,'Wantelien',1),(10512,'Wantliana',1),(10513,'Warehild',1),(10514,'Watcelina',1),(10515,'Wavin',1),(10516,'Wea',1),(10517,'Wealdburg',1),(10518,'Wealhburg',1),(10519,'Weertje',1),(10520,'Wekerild',1),(10521,'Wemke',1),(10522,'Wendel',1),(10523,'Wenefreda',1),(10524,'Wenthelen',1),(10525,'Wentiliana',1),(10526,'Werburg',1),(10527,'Werburga',1),(10528,'Werburgh',1),(10529,'Werbyrgh',1),(10530,'Wereburga',1),(10531,'Whetu',1),(10532,'Wibke',1),(10533,'Wiblind',1),(10534,'Wiburge',1),(10535,'Wiburgis',1),(10536,'Wiemda',1),(10537,'Wifhildis',1),(10538,'Wihted',1),(10539,'Wilberga',1),(10540,'Wilgefortis',1),(10541,'Wilgeva',1),(10542,'Willelda',1),(10543,'Willelma',1),(10544,'Willesuindis',1),(10545,'Wilmetta',1),(10546,'Wilmke',1),(10547,'Wilmot',1),(10548,'Wimarc',1),(10549,'Wimarca',1),(10550,'Winefred',1),(10551,'Winifred',1),(10552,'Winnifred',1),(10553,'Wivecin',1),(10554,'Wivin',1),(10555,'Wlbergis',1),(10556,'Wlbgis',1),(10557,'Wlfeuua',1),(10558,'Wlfildis',1),(10559,'Wlgert',1),(10560,'Wlueth',1),(10561,'Wluiaa',1),(10562,'Wluiua',1),(10563,'Wluyua',1),(10564,'Wlveva',1),(10565,'Wocbke',1),(10566,'Wofled',1),(10567,'Wolfleda',1),(10568,'Wolueua',1),(10569,'Wolueue',1),(10570,'Woluiua',1),(10571,'Wubcke',1),(10572,'Wulfhilda',1),(10573,'Wulfhildis',1),(10574,'Wulfiue',1),(10575,'Wulfled',1),(10576,'Wulfleda',1),(10577,'Wulfrueua',1),(10578,'Wuluefa',1),(10579,'Wuluethia',1),(10580,'Wulueua',1),(10581,'Wuluiua',1),(10582,'Wuluiue',1),(10583,'Wulvela',1),(10584,'Wulvella',1),(10585,'Wulveva',1),(10586,'Wulveve',1),(10587,'Wulviva',1),(10588,'Wulwiua',1),(10589,'Wumke',1),(10590,'Wyberg',1),(10591,'Wybir',1),(10592,'Wybur',1),(10593,'Wyburgh',1),(10594,'Wynifreed',1),(10595,'Yayone',1),(10596,'Yda',1),(10597,'Ydany',1),(10598,'Ydeneye',1),(10599,'Ydenia',1),(10600,'Ydon',1),(10601,'Ydonea',1),(10602,'Yera',1),(10603,'Yfame',1),(10604,'Ylaire',1),(10605,'Ylaria',1),(10606,'Yllaria',1),(10607,'Ymanie',1),(10608,'Ymanya',1),(10609,'Ymanye',1),(10610,'Ymeisna',1),(10611,'Ymenia',1),(10612,'Ynstauncia',1),(10613,'Yolande',1),(10614,'Yolant',1),(10615,'Yootha',1),(10616,'Yordana',1),(10617,'Younice',1),(10618,'Yrmengardis',1),(10619,'Ysane',1),(10620,'Ysemay',1),(10621,'Ysenda',1),(10622,'Yseult',1),(10623,'Yseulte',1),(10624,'Ysmay',1),(10625,'Ysmeina',1),(10626,'Ysmena',1),(10627,'Ysmene',1),(10628,'Ysolt',1),(10629,'Ysopa',1),(10630,'Ysoria',1),(10631,'Ysoude',1),(10632,'Ysout',1),(10633,'Yulene',1),(10634,'Yvette',1),(10635,'Yzebel',1),(10636,'Xabadin',1),(10637,'Xanthe',1),(10638,'Xanthippe',1),(10639,'Xantippe',1),(10640,'Xaxi',1),(10641,'Xemein',1),(10642,'Xene',1),(10643,'Xenophile',1),(10644,'Ximena',1),(10645,'Xixili',1),(10646,'Xoramen',1),(10647,'Zabal',1),(10648,'Zabaleta',1),(10649,'Zaballa',1),(10650,'Zaloa',1),(10651,'Zamartze',1),(10652,'Zandua',1),(10653,'Zarala',1),(10654,'Zeberiogana',1),(10655,'Zelai',1),(10656,'Zelina',1),(10657,'Zelizi',1),(10658,'Zenobia',1),(10659,'Zerran',1),(10660,'Zikuaga',1),(10661,'Zilia',1),(10662,'Ziortza',1),(10663,'Zita',1),(10664,'Zoe',1),(10665,'Zohartze',1),(10666,'Zorione',1),(10667,'Zuberoa',1),(10668,'Zubia',1),(10669,'Zufiaurre',1),(10670,'Zuhaitz',1),(10671,'Zumadoia',1),(10672,'Zumalburu',1),(10673,'Zuri',1),(10674,'Zuria',1),(10675,'Zuriaa',1),(10676,'Zurie',1),(10677,'Zuza',1),(10678,'Zuzene',1),(10679,'Zwaante',1);

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_random_bots` */

DROP TABLE IF EXISTS `ai_playerbot_random_bots`;

CREATE TABLE `ai_playerbot_random_bots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) NOT NULL,
  `bot` bigint(20) NOT NULL,
  `time` bigint(20) NOT NULL,
  `validIn` bigint(20) DEFAULT NULL,
  `event` varchar(45) DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `bot` (`bot`),
  KEY `event` (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ai_playerbot_random_bots` */

LOCK TABLES `ai_playerbot_random_bots` WRITE;

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_rarity_cache` */

DROP TABLE IF EXISTS `ai_playerbot_rarity_cache`;

CREATE TABLE `ai_playerbot_rarity_cache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item` mediumint(8) NOT NULL,
  `rarity` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='PlayerbotAI Rarity Cache';

/*Data for the table `ai_playerbot_rarity_cache` */

LOCK TABLES `ai_playerbot_rarity_cache` WRITE;

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_rnditem_cache` */

DROP TABLE IF EXISTS `ai_playerbot_rnditem_cache`;

CREATE TABLE `ai_playerbot_rnditem_cache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lvl` mediumint(8) NOT NULL,
  `type` mediumint(8) NOT NULL,
  `item` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='PlayerbotAI Random Item Cache';

/*Data for the table `ai_playerbot_rnditem_cache` */

LOCK TABLES `ai_playerbot_rnditem_cache` WRITE;

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_speech` */

DROP TABLE IF EXISTS `ai_playerbot_speech`;

CREATE TABLE `ai_playerbot_speech` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `text` varchar(1024) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

/*Data for the table `ai_playerbot_speech` */

LOCK TABLES `ai_playerbot_speech` WRITE;

insert  into `ai_playerbot_speech`(`id`,`name`,`text`,`type`) values (1,'taunt','I have puppies under my armor!','say'),(2,'taunt','Bite me, <target>!','say'),(3,'taunt','Hey <target>! Guess what your mom said last night!','say'),(4,'taunt','<target>, you\'re so ugly you couldn\'t score in a monkey whorehouse with a bag of bananas!','say'),(5,'taunt','Shut up <target>, you\'ll never be the man your mother is!!','say'),(6,'taunt','Your mother was a hampster and your father smelt of elderberries!!!!','say'),(7,'taunt','I don\'t want to talk to you no more, you empty headed animal food trough wiper!!!','say'),(8,'taunt','I fart in your general direction!!!','say'),(9,'taunt','Go and boil your bottom, you son of a silly person!!!','say'),(10,'taunt','What are you going to do <target>, bleed on me? HAVE AT YOU!','say'),(11,'taunt','M-O-O-N! That spells aggro!','say'),(12,'taunt','You\'re about as useful as a one-legged man in an ass kicking contest.','say'),(13,'taunt','Hey <target>! Stop hitting on them, they\'re not your type. They aren\'t inflatable.','say'),(14,'taunt','<target> you\'re so far outta your league, you\'re playing a different sport.','say'),(15,'taunt','You made a big mistake today <target>, you got out of bed.','say'),(16,'taunt','I wanna try turning into a horse, but I need help. I\'ll be the front, you be yourself.','say'),(17,'taunt','Can I borrow your face for a few days? My ass is going on holiday....','say'),(18,'taunt','I\'d like to give you a going away present... First you do your part.','say'),(19,'taunt','Before you came along we were hungry, Now we\'re just fed up.','say'),(20,'taunt','I like you. People say I have no taste, but I like you.','say'),(21,'taunt','I think you have an inferiority complex, but that\'s okay, it\'s justified.','say'),(22,'taunt','Hence rotten thing! Or I shall shake thy bones out of thy garments.','say'),(23,'taunt','I can\'t believe I\'m wasting my time with you!','say'),(24,'taunt','I love it when someone insults me, it means I don\'t have to be nice anymore.','say'),(25,'taunt','Thou leathern-jerkin, crystal-button, knot-pated, agatering, puke-stocking, caddis-garter, smooth-tongue, Spanish pouch!','say'),(26,'taunt','Thou qualling bat-fowling malt-worm!','say'),(27,'taunt','Thou art truely an idol of idiot-worshippers!','say'),(28,'taunt','Thou misbegotten knotty-pated wagtail!','say'),(29,'taunt','Thou whoreson mandrake, thou art fitter to be worn in my cap than to wait at my heels!','say'),(30,'taunt','You! You scullion! You rampallian! You fustilarian! I\'ll tickle your catastrophe!','say'),(31,'taunt','Oh <target>! Thou infectious ill-nurtured flax-wench!','say'),(32,'taunt','We leak in your chimney, <target>!','say'),(33,'taunt','Oh thou bootless fen-sucked canker-blossom!','say'),(34,'taunt','Were I like thee I\'d throw away myself!','say'),(35,'taunt','O teach me <target>, how I should forget to think!','say'),(36,'taunt','Truly thou art damned, like an ill-roasted egg, all on one side!','say'),(37,'taunt','You starvelling, you eel-skin, you dried neat\'s-tongue, you bull\'s-pizzle, you stock-fish- O for breath to utter what is like thee!! -you tailor\'s-yard, you sheath, you bow-case, you vile standing tuck!','say'),(38,'taunt','Fie! Drop thee into the rotten mouth of Death!','say'),(39,'taunt','<target>, you are a fishmonger!','say'),(40,'taunt','I shall live to knock thy brains out!','say'),(41,'taunt','Most shallow are you, <target>!! Thou art worms-meat in respect of a good piece of flesh, indeed!!','say'),(42,'taunt','Vile wretch! O <target>, thou odiferous hell-hated pignut!','say'),(43,'taunt','<target>! Thy kiss is as comfortless as frozen water to a starved snake!','say'),(44,'taunt','I scorn you, scurvy companion. What, you poor, base, rascally, cheating, lack-linen mate! Away, you moldy rogue, away!','say'),(45,'taunt','Out of my sight! Thou dost infect my eyes <target>!','say'),(46,'taunt','PLAY TIME!!!!','say'),(47,'taunt','None shall pass!','say'),(48,'taunt','We\'re under attack! A vast, ye swabs! Repel the invaders!','say'),(49,'taunt','None may challenge the Brotherhood!','say'),(50,'taunt','Foolsss...Kill the one in the dress!','say'),(51,'taunt','I\'ll feed your soul to Hakkar himself! ','say'),(52,'taunt','Pride heralds the end of your world! Come, mortals! Face the wrath of the <randomfaction>!','say'),(53,'taunt','All my plans have led to this!','say'),(54,'taunt','Ahh! More lambs to the slaughter!','say'),(55,'taunt','Another day, another glorious battle!','say'),(56,'taunt','So, business... or pleasure?','say'),(57,'taunt','You are not prepared!','say'),(58,'taunt','The <randomfaction>\'s final conquest has begun! Once again the subjugation of this world is within our grasp. Let none survive! ','say'),(59,'taunt','Your death will be a painful one. ','say'),(60,'taunt','Cry for mercy! Your meaningless lives will soon be forfeit. ','say'),(61,'taunt','Abandon all hope! The <randomfaction> has returned to finish what was begun so many years ago. This time there will be no escape! ','say'),(62,'taunt','Alert! You are marked for Extermination! ','say'),(63,'taunt','The <subzone> is for guests only...','say'),(64,'taunt','Ha ha ha! You are hopelessly outmatched!','say'),(65,'taunt','I will crush your delusions of grandeur! ','say'),(66,'taunt','Forgive me, for you are about to lose the game.','say'),(67,'taunt','Struggling only makes it worse.','say'),(68,'taunt','Vermin! Leeches! Take my blood and choke on it!','say'),(69,'taunt','Not again... NOT AGAIN!','say'),(70,'taunt','My blood will be the end of you!','say'),(71,'taunt','Good, now you fight me!','say'),(72,'taunt','Get da move on, guards! It be killin\' time!','say'),(73,'taunt','Don\'t be delayin\' your fate. Come to me now. I make your sacrifice quick.','say'),(74,'taunt','You be dead soon enough!','say'),(75,'taunt','Mua-ha-ha!','say'),(76,'taunt','I be da predator! You da prey...','say'),(77,'taunt','You gonna leave in pieces!','say'),(78,'taunt','Death comes. Will your conscience be clear? ','say'),(79,'taunt','Your behavior will not be tolerated.','say'),(80,'taunt','The Menagerie is for guests only.','say'),(81,'taunt','Hmm, unannounced visitors, Preparations must be made... ','say'),(82,'taunt','Hostile entities detected. Threat assessment protocol active. Primary target engaged. Time minus thirty seconds to re-evaluation.','say'),(83,'taunt','New toys? For me? I promise I won\'t break them this time!','say'),(84,'taunt','I\'m ready to play!','say'),(85,'taunt','Shhh... it will all be over soon.','say'),(86,'taunt','Aaaaaughibbrgubugbugrguburgle!','say'),(87,'taunt','RwlRwlRwlRwl!','say'),(88,'taunt','You too, shall serve!','say'),(89,'taunt','Tell me... tell me everything!  Naughty secrets! I\'ll rip the secrets from your flesh!','say'),(90,'taunt','Prepare yourselves, the bells have tolled! Shelter your weak, your young and your old! Each of you shall pay the final sum! Cry for mercy; the reckoning has come!','say'),(91,'taunt','Where in Bonzo\'s brass buttons am I?','say'),(92,'taunt','I can bear it no longer! Goblin King! Goblin King! Wherever you may be! Take this <target> far away from me!','say'),(93,'taunt','You have thirteen hours in which to solve the labyrinth, before your baby brother becomes one of us... forever.','say'),(94,'taunt','So, the <subzone> is a piece of cake, is it? Well, let\'s see how you deal with this little slice... ','say'),(95,'taunt','Back off, I\'ll take you on, headstrong to take on anyone, I know that you are wrong, and this is not where you belong','say'),(96,'taunt','Show me whatcha got!','say'),(97,'taunt','To the death!','say'),(98,'taunt','Twin blade action, for a clean close shave every time.','say'),(99,'taunt','Bring it on!','say'),(100,'taunt','You\'re goin\' down!','say'),(101,'taunt','Stabby stab stab!','say'),(102,'taunt','Let\'s get this over quick; time is mana.','say'),(103,'taunt','I do not think you realise the gravity of your situation.','say'),(104,'taunt','I will bring honor to my family and my kingdom!','say'),(105,'taunt','Light, give me strength!','say'),(106,'taunt','My church is the field of battle - time to worship...','say'),(107,'taunt','I hold you in contempt...','say'),(108,'taunt','Face the hammer of justice!','say'),(109,'taunt','Prove your worth in the test of arms under the Light!','say'),(110,'taunt','All must fall before the might and right of my cause, you shall be next!','say'),(111,'taunt','Prepare to die!','say'),(112,'taunt','The beast with me is nothing compared to the beast within...','say'),(113,'taunt','Witness the firepower of this fully armed huntsman!','say'),(114,'critical health','Heal me! Quick!','yell'),(115,'critical health','Almost dead! Heal me!','yell'),(116,'critical health','Help! Heal me!','yell'),(117,'critical health','Somebody! Heal me!','yell'),(118,'critical health','Heal! Heal! Heal!','yell'),(119,'critical health','I am dying! Heal! Aaaaarhg!','yell'),(120,'critical health','Heal me!','yell'),(121,'critical health','I will die. I will die. I will die. Heal!','yell'),(122,'critical health','Healers, where are you? I am dying!','yell'),(123,'critical health','Oh the pain. Heal me quick!','yell'),(124,'low health','Need heal','say'),(125,'low health','Low health','say'),(126,'low health','Drop a heal. Please.','say'),(127,'low health','Could somebody drop a heal on me?','say'),(128,'low health','Hey! Better heal me now than rez later','say'),(129,'low health','I am sorry. Need another heal','say'),(130,'low health','Damn mobs. Heal me please','say'),(131,'low health','One more hit and I am done for. Heal please','say'),(132,'low health','Are there any healers?','say'),(133,'low health','Why do they always punch me in the face? Need heal','say'),(134,'low health','Can anybody heal me a bit?','say'),(135,'low mana','OOM','say'),(136,'low mana','I am out of mana','say'),(137,'low mana','Damn I wasted all my mana on this','say'),(138,'low mana','You should wait until I drink or regenerate my mana','say'),(139,'low mana','Low mana','say'),(140,'low mana','No mana. Again?','say'),(141,'low mana','Low mana. Wanna drink','say'),(142,'low mana','Do we have a vending machine? Out of mana again','say'),(143,'low mana','My mana is history','say'),(144,'low mana','I\'d get some drinks next time. Out of mana','say'),(145,'low mana','Where is my mana?','say'),(146,'aoe','Oh god!','say'),(147,'aoe','I am scared','say'),(148,'aoe','We are done for','say'),(149,'aoe','This is over','say'),(150,'aoe','This ends now','say'),(151,'aoe','Could somebody cast blizzard or something?','say'),(152,'aoe','Damn. The tank aggroed all the mobs around','say'),(153,'aoe','We gonna die. We gonna die. We gonna die.','say'),(154,'aoe','Whoa! So many toys to play with','say'),(155,'aoe','I gonna kill them all!','say'),(156,'aoe','If the tank dies we are history','say'),(157,'aoe','Aaaaaargh!','yell'),(158,'aoe','LEEEEERROOOYYYYYYYYYYYY JENNKINNNSSSSSS!!!!!!!','yell'),(159,'aoe','Right. What do we have in AOE?','say'),(160,'aoe','This gets interesting','say'),(161,'aoe','Cool. Get them in one place for a good flamestrike','say'),(162,'aoe','Kill! Kill! Kill!','say'),(163,'aoe','I think my pants are wet','say'),(164,'aoe','We are history','say'),(165,'aoe','I hope healers are ready. Leeeeroy!','say'),(166,'aoe','I hope they won\'t come for me','say'),(167,'aoe','Oh no. I can\'t see at this slaugther','say'),(168,'loot','I hope there will be some money','say'),(169,'loot','Loot! Loot!','say'),(170,'loot','My precious','say'),(171,'loot','I hope there is a shiny epic item waiting for me there','say'),(172,'loot','I have deep pockets and bags','say'),(173,'loot','All is mine!','say'),(174,'loot','Hope no gray shit today','say'),(175,'loot','This loot is MINE!','say'),(176,'loot','Looting is disgusting but I need money','say'),(177,'loot','Gold!','say'),(178,'loot','OK. Let\'s see what they\'ve got','say'),(179,'loot','Do not worry. I will loot eveything','say'),(180,'loot','I am loot ninja','say'),(181,'loot','Do I neeed to roll?','say'),(182,'loot','Somebody explain me, where they did put all this stuff?','say'),(183,'loot','No, I won\'t loot gray shit','say'),(184,'loot','I\'m first. I\'m first. I\'m first.','say'),(185,'loot','Give me your money!','say'),(186,'loot','My pockets are empty, I need to fill them','say'),(187,'loot','I\'ve got a new bag for this','say'),(188,'loot','I hope I won\'t aggro anybody while looting','say'),(189,'loot','Please don\'t watch. I am looting','say'),(190,'loot','Ha! You won\'t get any piece of it!','say'),(191,'loot','Looting is cool','say'),(192,'loot','I like new gear','say'),(193,'loot','I\'l quit if there is nothing valuable again','say'),(194,'loot','I hope it is be a pretty ring','say'),(195,'loot','I\'l rip the loot from you','say'),(196,'loot','Everybody stay off. I\'m going to loot','say'),(197,'loot','Sweet loot','say'),(198,'loot','The Roll God! Give me an epic today','say'),(199,'loot','Please give me new toys','say'),(200,'loot','I hope they carry tasties','say'),(201,'loot','The gold is mine. I\'l leave everyting, I promise','say'),(202,'loot','No, I can\'t resist','say'),(203,'loot','I want more!','say');

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_speech_probability` */

DROP TABLE IF EXISTS `ai_playerbot_speech_probability`;

CREATE TABLE `ai_playerbot_speech_probability` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `probability` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `ai_playerbot_speech_probability` */

LOCK TABLES `ai_playerbot_speech_probability` WRITE;

insert  into `ai_playerbot_speech_probability`(`id`,`name`,`probability`) values (1,'taunt',30),(2,'aoe',75),(3,'loot',20);

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_tele_cache` */

DROP TABLE IF EXISTS `ai_playerbot_tele_cache`;

CREATE TABLE `ai_playerbot_tele_cache` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `level` mediumint(8) NOT NULL,
  `map_id` mediumint(8) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='PlayerbotAI Tele Cache';

/*Data for the table `ai_playerbot_tele_cache` */

LOCK TABLES `ai_playerbot_tele_cache` WRITE;

UNLOCK TABLES;

/*Table structure for table `ai_playerbot_text` */

DROP TABLE IF EXISTS `ai_playerbot_text`;

CREATE TABLE `ai_playerbot_text` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;

/*Data for the table `ai_playerbot_text` */

LOCK TABLES `ai_playerbot_text` WRITE;

insert  into `ai_playerbot_text`(`id`,`key`,`text`) values (1,'suggest_instance','Anyone wants %instance?'),(2,'suggest_instance','Any groups for %instance?'),(3,'suggest_instance','Need help for %instance?'),(4,'suggest_instance','LFD: %instance.'),(5,'suggest_instance','Anyone needs %role for %instance?'),(6,'suggest_instance','Missing %role for %instance?'),(7,'suggest_instance','Can be a %role for %instance.'),(8,'suggest_instance','Need help with %instance?'),(9,'suggest_instance','Need %role help with %instance?'),(10,'suggest_instance','Anyone needs gear from %instance?'),(11,'suggest_instance','A little grind in %instance?'),(12,'suggest_instance','WTR %instance'),(13,'suggest_instance','Need help for %instance.'),(14,'suggest_instance','Wanna run %instance.'),(15,'suggest_instance','%role looks for %instance.'),(16,'suggest_instance','What about %instance?'),(17,'suggest_instance','Who wants to farm %instance?'),(18,'suggest_instance','Go in %instance?'),(19,'suggest_instance','Looking for %instance.'),(20,'suggest_instance','Need help with %instance quests?'),(21,'suggest_instance','Wanna quest in %instance.'),(22,'suggest_instance','Anyone with quests in %instance?'),(23,'suggest_instance','Could help with quests in %instance.'),(24,'suggest_instance','%role: any place in group for %instance?'),(25,'suggest_instance','Does anybody still run %instance this days?'),(26,'suggest_instance','%instance: anyone wants to take a %role?'),(27,'suggest_instance','Is there any point being %role in %instance?'),(28,'suggest_instance','It is really worth to go to %instance?'),(29,'suggest_instance','Anybody needs more people for %instance?'),(30,'suggest_instance','%instance bosses drop good gear. Wanna run?'),(31,'suggest_instance','What about %instance?'),(32,'suggest_instance','Anybody needs %role?'),(33,'suggest_instance','Anyone needs %role?'),(34,'suggest_instance','Who wants %instance?'),(35,'suggest_instance','Can anybody summon me at %instance?'),(36,'suggest_instance','Meet me in %instance'),(37,'suggest_instance','Wanna quick %instance run'),(38,'suggest_instance','Wanna full %instance run'),(39,'suggest_instance','How many times were you in %instance?'),(40,'suggest_instance','Another %instance run?'),(41,'suggest_instance','Wiped in %instance? Take me instead!'),(42,'suggest_instance','Take me in %instance please.'),(43,'suggest_instance','Quick %instance run?'),(44,'suggest_instance','Full %instance run?'),(45,'suggest_instance','Who can take %role to %instance?'),(46,'suggest_quest','Need help with %quest?'),(47,'suggest_quest','Anyone wants to share %quest?'),(48,'suggest_quest','Anyone doing %quest?'),(49,'suggest_quest','Wanna do %quest.'),(50,'suggest_trade','Anyone to farm %category?'),(51,'suggest_trade','Looking for help farming %category.'),(52,'suggest_trade','Damn %category are so expensive!'),(53,'suggest_trade','Wanna %category.'),(54,'suggest_trade','Need help with %category.'),(55,'suggest_trade','WTB %category.'),(56,'suggest_trade','Anyone interested in %category?'),(57,'suggest_trade','WTS %category.'),(58,'suggest_trade','I am selling %category cheaper than AH.'),(59,'suggest_trade','Who wants to farm %category?'),(60,'suggest_trade','Wanna farm %category.'),(61,'suggest_trade','Looking for party after %category.'),(62,'suggest_trade','Any %category are appreciated.'),(63,'suggest_trade','Buying anything of %category.'),(64,'suggest_trade','Wow, anybody is farming %category!'),(65,'suggest_trade','%category are selling mad in the AH.'),(66,'suggest_trade','AH is hot for %category.'),(67,'suggest_trade','%category are on the market.'),(68,'suggest_trade','Wanna trade some %category.'),(69,'suggest_trade','Need more %category.'),(70,'suggest_trade','Anybody can spare some %category?'),(71,'suggest_trade','Who wants %category?'),(72,'suggest_trade','Some %category please?'),(73,'suggest_trade','I should have got skill for %category.'),(74,'suggest_trade','I am dying for %category.'),(75,'suggest_trade','People are killing for %category.'),(76,'suggest_trade','%category is a great bargain!'),(77,'suggest_trade','Everybody is mad for %category!'),(78,'suggest_trade','Where is the best place to farm for %category?'),(79,'suggest_trade','I am all set for %category.'),(80,'suggest_trade','Is it good to sell %category?'),(81,'suggest_trade','I\'d probably keep all my %category with me.'),(82,'suggest_trade','Need group? Maybe to farm some %category?'),(83,'suggest_trade','I am still thinking about %category.'),(84,'suggest_trade','I heard about %category already, but my pockets are empty.'),(85,'suggest_trade','LFG for %category'),(86,'suggest_trade','Would selling %category make me rich?'),(87,'suggest_trade','OK. I an farming %category tomorrow.'),(88,'suggest_trade','Everyone is talking about %category.'),(89,'suggest_trade','I saw at least ten people farming for %category.'),(90,'suggest_trade','I sold all my %category yesterday. I am completely broke!'),(91,'suggest_trade','Wanna join a guild farming for %category.'),(92,'suggest_faction','Anyone farming %faction rep?'),(93,'suggest_faction','Anyone help with %faction?'),(94,'suggest_faction','Wanna quest for %faction.'),(95,'suggest_faction','%faction is the best.'),(96,'suggest_faction','Need just a bit to be %level with %faction.'),(97,'suggest_faction','Anyone got %level with %faction?'),(98,'suggest_faction','Who wants to be %level with %faction?'),(99,'suggest_faction','I\'ll never be %level with %faction.'),(100,'suggest_faction','Someone missing %faction rep?'),(101,'suggest_faction','Could help farming %faction rep.'),(102,'suggest_faction','The more rep the better. Especially with %faction.'),(103,'suggest_faction','%faction: need %rndK for %level.'),(104,'suggest_faction','Who can share %faction quests?'),(105,'suggest_faction','Any dungeons for %faction?'),(106,'suggest_faction','Wanna do %faction rep grind.'),(107,'suggest_faction','Let\'s farm %faction rep!'),(108,'suggest_faction','Farming for %faction rep.'),(109,'suggest_faction','Wanna farm for %faction.'),(110,'suggest_faction','Need help with %faction.'),(111,'suggest_faction','Is %faction sells something useful?'),(112,'suggest_faction','Are there %faction vendors?'),(113,'suggest_faction','Who farms %faction?'),(114,'suggest_faction','Which is the best way to farm %faction?'),(115,'suggest_faction','I hate %faction rep grind.'),(116,'suggest_faction','I am so tired of %faction.'),(117,'suggest_faction','Go for %faction?'),(118,'suggest_faction','Seems everyone is %level with %faction. Only me is late as usually.'),(119,'suggest_faction','LFG for %faction rep grind?'),(120,'suggest_faction','Can anobody suggest a good spot for %faction rep grind?'),(121,'suggest_faction','Would %faction rep benefit me?'),(122,'suggest_faction','Who would\'ve thought that %faction rep will be useful after all...'),(123,'suggest_faction','I wanna be exalted with all factions, starting with %faction.'),(124,'suggest_faction','Is there any point to improve my rep with %faction?'),(125,'suggest_faction','What is better for %faction? Quests or mob grinding?'),(126,'suggest_faction','Will grind %faction rep for you. Just give me some gold.'),(127,'suggest_faction','I think grinding rep with %faction would take forever.'),(128,'suggest_faction','I am killing for %faction every day now but still far from %level.'),(129,'suggest_faction','At %level AH deposits will decrease, right?'),(130,'suggest_faction','How many exalted reps do you have?'),(131,'suggest_faction','Who wants to be %level with %faction?'),(132,'suggest_faction','Damn. My guild did a good %faction grind yesterday without me.'),(133,'suggest_faction','Nobody wants to help me because I am %level with %faction.'),(134,'suggest_faction','Please stay away from %faction.'),(135,'suggest_something','Wanna party in %zone.'),(136,'suggest_something','Anyone is looking for %role?'),(137,'suggest_something','%role is looking for quild.'),(138,'suggest_something','Looking for gold.'),(139,'suggest_something','%role wants to join a good guild.'),(140,'suggest_something','Need a friend.'),(141,'suggest_something','Anyone feels alone?'),(142,'suggest_something','Boring...'),(143,'suggest_something','Who wants some?'),(144,'suggest_something','Go get me!'),(145,'suggest_something','Maybe a duel in %zone?'),(146,'suggest_something','Anybody doing something?'),(147,'suggest_something','%zone: is anybody here?'),(148,'suggest_something','%zone: where is everyone?'),(149,'suggest_something','Looks like I am alone in %zone.'),(150,'suggest_something','Meet me in %zone.'),(151,'suggest_something','Let\'s quest in %zone!'),(152,'suggest_something','%zone is the best place to be!'),(153,'suggest_something','Wanna go to %zone. Anybody with me?'),(154,'suggest_something','Who wants going to %zone?'),(155,'suggest_something','I don\'t like %zone. Where to go?'),(156,'suggest_something','Are there a good quests in %zone?'),(157,'suggest_something','Where to go after %zone?'),(158,'suggest_something','Who is in %zone?'),(159,'suggest_something','LFG in %zone.'),(160,'suggest_something','%zone is the worst place to be.'),(161,'suggest_something','Catch me in %zone!'),(162,'suggest_something','Go for %zone!'),(163,'suggest_something','Wanna quest in %zone'),(164,'suggest_something','Anyone has quests in %zone?'),(165,'suggest_something','Come here to %zone!'),(166,'suggest_something','Seems there is no Horde in %zone'),(167,'suggest_something','Seems there is no Alliance in %zone'),(168,'suggest_something','I am really tired of %zone. Maybe go somewhere else?'),(169,'suggest_sell','WTS %item for %gold.'),(170,'suggest_sell','Who wants %item for %gold?'),(171,'suggest_sell','Anyone wants %item? Only %gold.'),(172,'suggest_sell','Just %gold for %item!'),(173,'suggest_sell','Selling %item for %gold.'),(174,'suggest_sell','%item is yours just for %gold!'),(175,'suggest_sell','Ridiculus price of %gold for %item!'),(176,'suggest_sell','Wanna sell %item for %gold.'),(177,'suggest_sell','Who needs %item? Only %gold.'),(178,'suggest_sell','Anyone needs %item for %gold?'),(179,'suggest_sell','%gold for %item. Less than AH!'),(180,'suggest_sell','%item is expensive, but I\'d sell it for %gold.'),(181,'suggest_sell','You\'ll never find %item cheaper than %gold!'),(182,'suggest_sell','Need more than %item!'),(183,'suggest_sell','I have %item and need more.'),(184,'suggest_sell','Have %item. Who wants to buy for %gold?'),(185,'suggest_sell','Anyone WTB %item for %gold?'),(186,'suggest_sell','What about %item? For %gold.'),(187,'suggest_sell','Who said I am a bastard? %item for %gold is a good price.'),(188,'suggest_sell','I am selling %item? Just %gold.'),(189,'suggest_sell','LFG for farming. You can still buy %item I have for %gold.'),(190,'suggest_sell','Sold almost everything today. Still have %item for %gold.'),(191,'suggest_sell','What use for trade chat? Of course to sell %item for %gold.'),(192,'suggest_sell','Can anyone beat the price of %gold for %item?'),(193,'suggest_sell','Wanna stop trade chat? Just buy %item? For %gold!'),(194,'suggest_sell','Everybody spams in trade chat. Me too - %gold for %item!'),(195,'suggest_sell','Is %item any use? Just selling it for %gold.'),(196,'suggest_sell','I have %item ready to sell you for %gold.'),(197,'suggest_sell','Did nothing yesterday but have got %item. Selling it for %gold.'),(198,'suggest_sell','Farmed yesterday and got %item. Anyone wtb for %gold?'),(199,'suggest_sell','Bought %item yesterday. Anyone needs it for %gold?'),(200,'suggest_sell','Who asked for %item? The price is the same - %gold.'),(201,'suggest_sell','I sill have %item. WTB for %gold?'),(202,'suggest_sell','I used to have more than %item. Now needs to sell it for %gold.'),(203,'suggest_sell','I wish I have more than %item. You could buy it for %gold anyways.'),(204,'suggest_sell','What use for your gold? To buy my %item for %gold.'),(205,'suggest_sell','Please spare some gold for me. You can buy %item for %gold.'),(206,'suggest_sell','Is %gold is a good price for %item?'),(207,'suggest_sell','Just bought yesterday %items, but do not need it anymore. Anyone wants for %gold?'),(208,'suggest_sell','I am going to post %item on the AH but you can buy it now cheaper just for %gold.'),(209,'suggest_sell','Why the #!@ have I bought %item? Anyone needs it for %gold?');

UNLOCK TABLES;

/*Table structure for table `arena_team` */

DROP TABLE IF EXISTS `arena_team`;

CREATE TABLE `arena_team` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(255) NOT NULL,
  `captainguid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemColor` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderColor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `arena_team` */

LOCK TABLES `arena_team` WRITE;

UNLOCK TABLES;

/*Table structure for table `arena_team_member` */

DROP TABLE IF EXISTS `arena_team_member`;

CREATE TABLE `arena_team_member` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `played_week` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_week` int(10) unsigned NOT NULL DEFAULT '0',
  `played_season` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_season` int(10) unsigned NOT NULL DEFAULT '0',
  `personal_rating` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `arena_team_member` */

LOCK TABLES `arena_team_member` WRITE;

UNLOCK TABLES;

/*Table structure for table `arena_team_stats` */

DROP TABLE IF EXISTS `arena_team_stats`;

CREATE TABLE `arena_team_stats` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` int(10) unsigned NOT NULL DEFAULT '0',
  `games_week` int(10) unsigned NOT NULL DEFAULT '0',
  `wins_week` int(10) unsigned NOT NULL DEFAULT '0',
  `games_season` int(10) unsigned NOT NULL DEFAULT '0',
  `wins_season` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `arena_team_stats` */

LOCK TABLES `arena_team_stats` WRITE;

UNLOCK TABLES;

/*Table structure for table `auction` */

DROP TABLE IF EXISTS `auction`;

CREATE TABLE `auction` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `houseid` int(11) unsigned NOT NULL DEFAULT '0',
  `itemguid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_template` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `item_count` int(11) unsigned NOT NULL DEFAULT '0',
  `item_randompropertyid` int(11) NOT NULL DEFAULT '0',
  `itemowner` int(11) unsigned NOT NULL DEFAULT '0',
  `buyoutprice` int(11) NOT NULL DEFAULT '0',
  `time` bigint(40) unsigned NOT NULL DEFAULT '0',
  `moneyTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `buyguid` int(11) unsigned NOT NULL DEFAULT '0',
  `lastbid` int(11) NOT NULL DEFAULT '0',
  `startbid` int(11) NOT NULL DEFAULT '0',
  `deposit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auction` */

LOCK TABLES `auction` WRITE;

UNLOCK TABLES;

/*Table structure for table `bugreport` */

DROP TABLE IF EXISTS `bugreport`;

CREATE TABLE `bugreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Debug System';

/*Data for the table `bugreport` */

LOCK TABLES `bugreport` WRITE;

UNLOCK TABLES;

/*Table structure for table `calendar_events` */

DROP TABLE IF EXISTS `calendar_events`;

CREATE TABLE `calendar_events` (
  `eventId` bigint(10) unsigned NOT NULL DEFAULT '0',
  `creatorGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `guildId` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `dungeonId` int(10) NOT NULL DEFAULT '-1',
  `eventTime` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `calendar_events` */

LOCK TABLES `calendar_events` WRITE;

UNLOCK TABLES;

/*Table structure for table `calendar_invites` */

DROP TABLE IF EXISTS `calendar_invites`;

CREATE TABLE `calendar_invites` (
  `inviteId` bigint(10) unsigned NOT NULL DEFAULT '0',
  `eventId` bigint(10) unsigned NOT NULL DEFAULT '0',
  `inviteeGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `senderGuid` int(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `lastUpdateTime` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`inviteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `calendar_invites` */

LOCK TABLES `calendar_invites` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_account_data` */

DROP TABLE IF EXISTS `character_account_data`;

CREATE TABLE `character_account_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(11) unsigned NOT NULL DEFAULT '0',
  `time` bigint(11) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  PRIMARY KEY (`guid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_account_data` */

LOCK TABLES `character_account_data` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_achievement` */

DROP TABLE IF EXISTS `character_achievement`;

CREATE TABLE `character_achievement` (
  `guid` int(11) unsigned NOT NULL,
  `achievement` int(11) unsigned NOT NULL,
  `date` bigint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_achievement` */

LOCK TABLES `character_achievement` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_achievement_progress` */

DROP TABLE IF EXISTS `character_achievement_progress`;

CREATE TABLE `character_achievement_progress` (
  `guid` int(11) unsigned NOT NULL,
  `criteria` int(11) unsigned NOT NULL,
  `counter` int(11) unsigned NOT NULL,
  `date` bigint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_achievement_progress` */

LOCK TABLES `character_achievement_progress` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_action` */

DROP TABLE IF EXISTS `character_action`;

CREATE TABLE `character_action` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_action` */

LOCK TABLES `character_action` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_aura` */

DROP TABLE IF EXISTS `character_aura`;

CREATE TABLE `character_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `stackcount` int(11) unsigned NOT NULL DEFAULT '1',
  `remaincharges` int(11) unsigned NOT NULL DEFAULT '0',
  `basepoints0` int(11) NOT NULL DEFAULT '0',
  `basepoints1` int(11) NOT NULL DEFAULT '0',
  `basepoints2` int(11) NOT NULL DEFAULT '0',
  `periodictime0` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime1` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime2` int(11) unsigned NOT NULL DEFAULT '0',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `effIndexMask` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_aura` */

LOCK TABLES `character_aura` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_battleground_data` */

DROP TABLE IF EXISTS `character_battleground_data`;

CREATE TABLE `character_battleground_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  `team` int(11) unsigned NOT NULL DEFAULT '0',
  `join_x` float NOT NULL DEFAULT '0',
  `join_y` float NOT NULL DEFAULT '0',
  `join_z` float NOT NULL DEFAULT '0',
  `join_o` float NOT NULL DEFAULT '0',
  `join_map` int(11) NOT NULL DEFAULT '0',
  `mount_spell` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_battleground_data` */

LOCK TABLES `character_battleground_data` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_db_version` */

DROP TABLE IF EXISTS `character_db_version`;

CREATE TABLE `character_db_version` (
  `required_13994_00_characters_cooldown` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Last applied sql update to DB';

/*Data for the table `character_db_version` */

LOCK TABLES `character_db_version` WRITE;

insert  into `character_db_version`(`required_13994_00_characters_cooldown`) values (NULL);

UNLOCK TABLES;

/*Table structure for table `character_declinedname` */

DROP TABLE IF EXISTS `character_declinedname`;

CREATE TABLE `character_declinedname` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL DEFAULT '',
  `dative` varchar(15) NOT NULL DEFAULT '',
  `accusative` varchar(15) NOT NULL DEFAULT '',
  `instrumental` varchar(15) NOT NULL DEFAULT '',
  `prepositional` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `character_declinedname` */

LOCK TABLES `character_declinedname` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_equipmentsets` */

DROP TABLE IF EXISTS `character_equipmentsets`;

CREATE TABLE `character_equipmentsets` (
  `guid` int(11) NOT NULL DEFAULT '0',
  `setguid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setindex` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `iconname` varchar(100) NOT NULL,
  `ignore_mask` int(11) unsigned NOT NULL DEFAULT '0',
  `item0` int(11) unsigned NOT NULL DEFAULT '0',
  `item1` int(11) unsigned NOT NULL DEFAULT '0',
  `item2` int(11) unsigned NOT NULL DEFAULT '0',
  `item3` int(11) unsigned NOT NULL DEFAULT '0',
  `item4` int(11) unsigned NOT NULL DEFAULT '0',
  `item5` int(11) unsigned NOT NULL DEFAULT '0',
  `item6` int(11) unsigned NOT NULL DEFAULT '0',
  `item7` int(11) unsigned NOT NULL DEFAULT '0',
  `item8` int(11) unsigned NOT NULL DEFAULT '0',
  `item9` int(11) unsigned NOT NULL DEFAULT '0',
  `item10` int(11) unsigned NOT NULL DEFAULT '0',
  `item11` int(11) unsigned NOT NULL DEFAULT '0',
  `item12` int(11) unsigned NOT NULL DEFAULT '0',
  `item13` int(11) unsigned NOT NULL DEFAULT '0',
  `item14` int(11) unsigned NOT NULL DEFAULT '0',
  `item15` int(11) unsigned NOT NULL DEFAULT '0',
  `item16` int(11) unsigned NOT NULL DEFAULT '0',
  `item17` int(11) unsigned NOT NULL DEFAULT '0',
  `item18` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  KEY `Idx_setindex` (`setindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_equipmentsets` */

LOCK TABLES `character_equipmentsets` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_gifts` */

DROP TABLE IF EXISTS `character_gifts`;

CREATE TABLE `character_gifts` (
  `guid` int(20) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(20) unsigned NOT NULL DEFAULT '0',
  `flags` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_gifts` */

LOCK TABLES `character_gifts` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_glyphs` */

DROP TABLE IF EXISTS `character_glyphs`;

CREATE TABLE `character_glyphs` (
  `guid` int(11) unsigned NOT NULL,
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `glyph` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_glyphs` */

LOCK TABLES `character_glyphs` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_homebind` */

DROP TABLE IF EXISTS `character_homebind`;

CREATE TABLE `character_homebind` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zone` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_homebind` */

LOCK TABLES `character_homebind` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_instance` */

DROP TABLE IF EXISTS `character_instance`;

CREATE TABLE `character_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_instance` */

LOCK TABLES `character_instance` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_inventory` */

DROP TABLE IF EXISTS `character_inventory`;

CREATE TABLE `character_inventory` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int(11) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  `item_template` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  PRIMARY KEY (`item`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_inventory` */

LOCK TABLES `character_inventory` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_pet` */

DROP TABLE IF EXISTS `character_pet`;

CREATE TABLE `character_pet` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `modelid` int(11) unsigned DEFAULT '0',
  `CreatedBySpell` int(11) unsigned NOT NULL DEFAULT '0',
  `PetType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '1',
  `exp` int(11) unsigned NOT NULL DEFAULT '0',
  `Reactstate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT 'Pet',
  `renamed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `slot` int(11) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(11) unsigned NOT NULL DEFAULT '1',
  `curmana` int(11) unsigned NOT NULL DEFAULT '0',
  `curhappiness` int(11) unsigned NOT NULL DEFAULT '0',
  `savetime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `abdata` longtext,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

/*Data for the table `character_pet` */

LOCK TABLES `character_pet` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_pet_declinedname` */

DROP TABLE IF EXISTS `character_pet_declinedname`;

CREATE TABLE `character_pet_declinedname` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `genitive` varchar(12) NOT NULL DEFAULT '',
  `dative` varchar(12) NOT NULL DEFAULT '',
  `accusative` varchar(12) NOT NULL DEFAULT '',
  `instrumental` varchar(12) NOT NULL DEFAULT '',
  `prepositional` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `character_pet_declinedname` */

LOCK TABLES `character_pet_declinedname` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_queststatus` */

DROP TABLE IF EXISTS `character_queststatus`;

CREATE TABLE `character_queststatus` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `rewarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `explored` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timer` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mobcount1` int(11) unsigned NOT NULL DEFAULT '0',
  `mobcount2` int(11) unsigned NOT NULL DEFAULT '0',
  `mobcount3` int(11) unsigned NOT NULL DEFAULT '0',
  `mobcount4` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount1` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount2` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount3` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount4` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount5` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount6` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_queststatus` */

LOCK TABLES `character_queststatus` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_queststatus_daily` */

DROP TABLE IF EXISTS `character_queststatus_daily`;

CREATE TABLE `character_queststatus_daily` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_queststatus_daily` */

LOCK TABLES `character_queststatus_daily` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_queststatus_monthly` */

DROP TABLE IF EXISTS `character_queststatus_monthly`;

CREATE TABLE `character_queststatus_monthly` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_queststatus_monthly` */

LOCK TABLES `character_queststatus_monthly` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_queststatus_weekly` */

DROP TABLE IF EXISTS `character_queststatus_weekly`;

CREATE TABLE `character_queststatus_weekly` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_queststatus_weekly` */

LOCK TABLES `character_queststatus_weekly` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_reputation` */

DROP TABLE IF EXISTS `character_reputation`;

CREATE TABLE `character_reputation` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` int(11) unsigned NOT NULL DEFAULT '0',
  `standing` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_reputation` */

LOCK TABLES `character_reputation` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_skills` */

DROP TABLE IF EXISTS `character_skills`;

CREATE TABLE `character_skills` (
  `guid` int(11) unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` mediumint(9) unsigned NOT NULL,
  `value` mediumint(9) unsigned NOT NULL,
  `max` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_skills` */

LOCK TABLES `character_skills` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_social` */

DROP TABLE IF EXISTS `character_social`;

CREATE TABLE `character_social` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `guid_flags` (`guid`,`flags`),
  KEY `friend_flags` (`friend`,`flags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_social` */

LOCK TABLES `character_social` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_spell` */

DROP TABLE IF EXISTS `character_spell`;

CREATE TABLE `character_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`),
  KEY `Idx_spell` (`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_spell` */

LOCK TABLES `character_spell` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_spell_cooldown` */

DROP TABLE IF EXISTS `character_spell_cooldown`;

CREATE TABLE `character_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `SpellId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `SpellExpireTime` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell cooldown expire time',
  `Category` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category',
  `CategoryExpireTime` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category cooldown expire time',
  `ItemId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  PRIMARY KEY (`guid`,`SpellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `character_spell_cooldown` */

LOCK TABLES `character_spell_cooldown` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_stats` */

DROP TABLE IF EXISTS `character_stats`;

CREATE TABLE `character_stats` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower1` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower2` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower3` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower4` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower5` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower6` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpower7` int(10) unsigned NOT NULL DEFAULT '0',
  `strength` int(10) unsigned NOT NULL DEFAULT '0',
  `agility` int(10) unsigned NOT NULL DEFAULT '0',
  `stamina` int(10) unsigned NOT NULL DEFAULT '0',
  `intellect` int(10) unsigned NOT NULL DEFAULT '0',
  `spirit` int(10) unsigned NOT NULL DEFAULT '0',
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `resHoly` int(10) unsigned NOT NULL DEFAULT '0',
  `resFire` int(10) unsigned NOT NULL DEFAULT '0',
  `resNature` int(10) unsigned NOT NULL DEFAULT '0',
  `resFrost` int(10) unsigned NOT NULL DEFAULT '0',
  `resShadow` int(10) unsigned NOT NULL DEFAULT '0',
  `resArcane` int(10) unsigned NOT NULL DEFAULT '0',
  `blockPct` float unsigned NOT NULL DEFAULT '0',
  `dodgePct` float unsigned NOT NULL DEFAULT '0',
  `parryPct` float unsigned NOT NULL DEFAULT '0',
  `critPct` float unsigned NOT NULL DEFAULT '0',
  `rangedCritPct` float unsigned NOT NULL DEFAULT '0',
  `spellCritPct` float unsigned NOT NULL DEFAULT '0',
  `attackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `rangedAttackPower` int(10) unsigned NOT NULL DEFAULT '0',
  `spellPower` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_stats` */

LOCK TABLES `character_stats` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_talent` */

DROP TABLE IF EXISTS `character_talent`;

CREATE TABLE `character_talent` (
  `guid` int(11) unsigned NOT NULL,
  `talent_id` int(11) unsigned NOT NULL,
  `current_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`talent_id`,`spec`),
  KEY `talent_key` (`talent_id`),
  KEY `spec_key` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_talent` */

LOCK TABLES `character_talent` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_ticket` */

DROP TABLE IF EXISTS `character_ticket`;

CREATE TABLE `character_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_text` text,
  `response_text` text,
  `ticket_lastchange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_ticket` */

LOCK TABLES `character_ticket` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_tutorial` */

DROP TABLE IF EXISTS `character_tutorial`;

CREATE TABLE `character_tutorial` (
  `account` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Account Identifier',
  `tut0` int(11) unsigned NOT NULL DEFAULT '0',
  `tut1` int(11) unsigned NOT NULL DEFAULT '0',
  `tut2` int(11) unsigned NOT NULL DEFAULT '0',
  `tut3` int(11) unsigned NOT NULL DEFAULT '0',
  `tut4` int(11) unsigned NOT NULL DEFAULT '0',
  `tut5` int(11) unsigned NOT NULL DEFAULT '0',
  `tut6` int(11) unsigned NOT NULL DEFAULT '0',
  `tut7` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_tutorial` */

LOCK TABLES `character_tutorial` WRITE;

UNLOCK TABLES;

/*Table structure for table `characters` */

DROP TABLE IF EXISTS `characters`;

CREATE TABLE `characters` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) NOT NULL DEFAULT '',
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `playerBytes` int(10) unsigned NOT NULL DEFAULT '0',
  `playerBytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `playerFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `dungeon_difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` longtext,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cinematic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `totaltime` int(11) unsigned NOT NULL DEFAULT '0',
  `leveltime` int(11) unsigned NOT NULL DEFAULT '0',
  `logout_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `extra_flags` int(11) unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `at_login` int(11) unsigned NOT NULL DEFAULT '0',
  `zone` int(11) unsigned NOT NULL DEFAULT '0',
  `death_expire_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxi_path` text,
  `arenaPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `totalHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `todayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `totalKills` int(10) unsigned NOT NULL DEFAULT '0',
  `todayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `yesterdayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `chosenTitle` int(10) unsigned NOT NULL DEFAULT '0',
  `knownCurrencies` bigint(20) unsigned NOT NULL DEFAULT '0',
  `watchedFaction` int(10) unsigned NOT NULL DEFAULT '0',
  `drunk` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `health` int(10) unsigned NOT NULL DEFAULT '0',
  `power1` int(10) unsigned NOT NULL DEFAULT '0',
  `power2` int(10) unsigned NOT NULL DEFAULT '0',
  `power3` int(10) unsigned NOT NULL DEFAULT '0',
  `power4` int(10) unsigned NOT NULL DEFAULT '0',
  `power5` int(10) unsigned NOT NULL DEFAULT '0',
  `power6` int(10) unsigned NOT NULL DEFAULT '0',
  `power7` int(10) unsigned NOT NULL DEFAULT '0',
  `specCount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `activeSpec` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `exploredZones` longtext,
  `equipmentCache` longtext,
  `ammoId` int(10) unsigned NOT NULL DEFAULT '0',
  `knownTitles` longtext,
  `actionBars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleteInfos_Account` int(11) unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `characters` */

LOCK TABLES `characters` WRITE;

UNLOCK TABLES;

/*Table structure for table `corpse` */

DROP TABLE IF EXISTS `corpse`;

CREATE TABLE `corpse` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `player` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `phaseMask` smallint(5) unsigned NOT NULL DEFAULT '1',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `corpse_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_type` (`corpse_type`),
  KEY `instance` (`instance`),
  KEY `Idx_player` (`player`),
  KEY `Idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Death System';

/*Data for the table `corpse` */

LOCK TABLES `corpse` WRITE;

UNLOCK TABLES;

/*Table structure for table `creature_respawn` */

DROP TABLE IF EXISTS `creature_respawn`;

CREATE TABLE `creature_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

/*Data for the table `creature_respawn` */

LOCK TABLES `creature_respawn` WRITE;

UNLOCK TABLES;

/*Table structure for table `event_group_chosen` */

DROP TABLE IF EXISTS `event_group_chosen`;

CREATE TABLE `event_group_chosen` (
  `eventGroup` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventGroup`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest Group picked';

/*Data for the table `event_group_chosen` */

LOCK TABLES `event_group_chosen` WRITE;

UNLOCK TABLES;

/*Table structure for table `game_event_status` */

DROP TABLE IF EXISTS `game_event_status`;

CREATE TABLE `game_event_status` (
  `event` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Game event system';

/*Data for the table `game_event_status` */

LOCK TABLES `game_event_status` WRITE;

UNLOCK TABLES;

/*Table structure for table `gameobject_respawn` */

DROP TABLE IF EXISTS `gameobject_respawn`;

CREATE TABLE `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

/*Data for the table `gameobject_respawn` */

LOCK TABLES `gameobject_respawn` WRITE;

UNLOCK TABLES;

/*Table structure for table `group_instance` */

DROP TABLE IF EXISTS `group_instance`;

CREATE TABLE `group_instance` (
  `leaderGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`leaderGuid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `group_instance` */

LOCK TABLES `group_instance` WRITE;

UNLOCK TABLES;

/*Table structure for table `group_member` */

DROP TABLE IF EXISTS `group_member`;

CREATE TABLE `group_member` (
  `groupId` int(11) unsigned NOT NULL,
  `memberGuid` int(11) unsigned NOT NULL,
  `assistant` tinyint(1) unsigned NOT NULL,
  `subgroup` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`groupId`,`memberGuid`),
  KEY `Idx_memberGuid` (`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Groups';

/*Data for the table `group_member` */

LOCK TABLES `group_member` WRITE;

UNLOCK TABLES;

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `groupId` int(11) unsigned NOT NULL,
  `leaderGuid` int(11) unsigned NOT NULL,
  `mainTank` int(11) unsigned NOT NULL,
  `mainAssistant` int(11) unsigned NOT NULL,
  `lootMethod` tinyint(4) unsigned NOT NULL,
  `looterGuid` int(11) unsigned NOT NULL,
  `lootThreshold` tinyint(4) unsigned NOT NULL,
  `icon1` int(11) unsigned NOT NULL,
  `icon2` int(11) unsigned NOT NULL,
  `icon3` int(11) unsigned NOT NULL,
  `icon4` int(11) unsigned NOT NULL,
  `icon5` int(11) unsigned NOT NULL,
  `icon6` int(11) unsigned NOT NULL,
  `icon7` int(11) unsigned NOT NULL,
  `icon8` int(11) unsigned NOT NULL,
  `groupType` tinyint(1) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `raiddifficulty` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `leaderGuid` (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Groups';

/*Data for the table `groups` */

LOCK TABLES `groups` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild` */

DROP TABLE IF EXISTS `guild`;

CREATE TABLE `guild` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `leaderguid` int(6) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` int(5) NOT NULL DEFAULT '0',
  `EmblemColor` int(5) NOT NULL DEFAULT '0',
  `BorderStyle` int(5) NOT NULL DEFAULT '0',
  `BorderColor` int(5) NOT NULL DEFAULT '0',
  `BackgroundColor` int(5) NOT NULL DEFAULT '0',
  `info` varchar(500) NOT NULL DEFAULT '',
  `motd` varchar(128) NOT NULL DEFAULT '',
  `createdate` bigint(20) unsigned NOT NULL DEFAULT '0',
  `BankMoney` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

/*Data for the table `guild` */

LOCK TABLES `guild` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_bank_eventlog` */

DROP TABLE IF EXISTS `guild_bank_eventlog`;

CREATE TABLE `guild_bank_eventlog` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guild_bank_eventlog` */

LOCK TABLES `guild_bank_eventlog` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_bank_item` */

DROP TABLE IF EXISTS `guild_bank_item`;

CREATE TABLE `guild_bank_item` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_entry` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guild_bank_item` */

LOCK TABLES `guild_bank_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_bank_right` */

DROP TABLE IF EXISTS `guild_bank_right`;

CREATE TABLE `guild_bank_right` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rid` int(11) unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SlotPerDay` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guild_bank_right` */

LOCK TABLES `guild_bank_right` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_bank_tab` */

DROP TABLE IF EXISTS `guild_bank_tab`;

CREATE TABLE `guild_bank_tab` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(100) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`guildid`,`TabId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guild_bank_tab` */

LOCK TABLES `guild_bank_tab` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_eventlog` */

DROP TABLE IF EXISTS `guild_eventlog`;

CREATE TABLE `guild_eventlog` (
  `guildid` int(11) unsigned NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int(11) unsigned NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint(1) unsigned NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int(11) unsigned NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int(11) unsigned NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint(2) unsigned NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` bigint(20) unsigned NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guild Eventlog';

/*Data for the table `guild_eventlog` */

LOCK TABLES `guild_eventlog` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_member` */

DROP TABLE IF EXISTS `guild_member`;

CREATE TABLE `guild_member` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `pnote` varchar(31) NOT NULL DEFAULT '',
  `offnote` varchar(31) NOT NULL DEFAULT '',
  `BankResetTimeMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab0` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab0` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab1` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab1` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab2` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab2` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab3` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab3` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab4` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab4` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab5` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab5` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `guid_key` (`guid`),
  KEY `guildid_rank_key` (`guildid`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

/*Data for the table `guild_member` */

LOCK TABLES `guild_member` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_rank` */

DROP TABLE IF EXISTS `guild_rank`;

CREATE TABLE `guild_rank` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `rid` int(11) unsigned NOT NULL,
  `rname` varchar(255) NOT NULL DEFAULT '',
  `rights` int(3) unsigned NOT NULL DEFAULT '0',
  `BankMoneyPerDay` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`rid`),
  KEY `Idx_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

/*Data for the table `guild_rank` */

LOCK TABLES `guild_rank` WRITE;

UNLOCK TABLES;

/*Table structure for table `immersive_values` */

DROP TABLE IF EXISTS `immersive_values`;

CREATE TABLE `immersive_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `immersive_values` */

LOCK TABLES `immersive_values` WRITE;

UNLOCK TABLES;

/*Table structure for table `instance` */

DROP TABLE IF EXISTS `instance`;

CREATE TABLE `instance` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `resettime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `encountersMask` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `instance` */

LOCK TABLES `instance` WRITE;

UNLOCK TABLES;

/*Table structure for table `instance_reset` */

DROP TABLE IF EXISTS `instance_reset`;

CREATE TABLE `instance_reset` (
  `mapid` int(11) unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resettime` bigint(40) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`,`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `instance_reset` */

LOCK TABLES `instance_reset` WRITE;

UNLOCK TABLES;

/*Table structure for table `item_instance` */

DROP TABLE IF EXISTS `item_instance`;

CREATE TABLE `item_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  `text` longtext,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';

/*Data for the table `item_instance` */

LOCK TABLES `item_instance` WRITE;

UNLOCK TABLES;

/*Table structure for table `item_loot` */

DROP TABLE IF EXISTS `item_loot`;

CREATE TABLE `item_loot` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `itemid` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `suffix` int(11) unsigned NOT NULL DEFAULT '0',
  `property` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`itemid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';

/*Data for the table `item_loot` */

LOCK TABLES `item_loot` WRITE;

UNLOCK TABLES;

/*Table structure for table `mail` */

DROP TABLE IF EXISTS `mail`;

CREATE TABLE `mail` (
  `id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint(3) NOT NULL DEFAULT '41',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `body` longtext,
  `has_items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expire_time` bigint(40) unsigned NOT NULL DEFAULT '0',
  `deliver_time` bigint(40) unsigned NOT NULL DEFAULT '0',
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `cod` int(11) unsigned NOT NULL DEFAULT '0',
  `checked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Mail System';

/*Data for the table `mail` */

LOCK TABLES `mail` WRITE;

UNLOCK TABLES;

/*Table structure for table `mail_items` */

DROP TABLE IF EXISTS `mail_items`;

CREATE TABLE `mail_items` (
  `mail_id` int(11) NOT NULL DEFAULT '0',
  `item_guid` int(11) NOT NULL DEFAULT '0',
  `item_template` int(11) NOT NULL DEFAULT '0',
  `receiver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`mail_id`,`item_guid`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mail_items` */

LOCK TABLES `mail_items` WRITE;

UNLOCK TABLES;

/*Table structure for table `pet_aura` */

DROP TABLE IF EXISTS `pet_aura`;

CREATE TABLE `pet_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `stackcount` int(11) unsigned NOT NULL DEFAULT '1',
  `remaincharges` int(11) unsigned NOT NULL DEFAULT '0',
  `basepoints0` int(11) NOT NULL DEFAULT '0',
  `basepoints1` int(11) NOT NULL DEFAULT '0',
  `basepoints2` int(11) NOT NULL DEFAULT '0',
  `periodictime0` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime1` int(11) unsigned NOT NULL DEFAULT '0',
  `periodictime2` int(11) unsigned NOT NULL DEFAULT '0',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `effIndexMask` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

/*Data for the table `pet_aura` */

LOCK TABLES `pet_aura` WRITE;

UNLOCK TABLES;

/*Table structure for table `pet_spell` */

DROP TABLE IF EXISTS `pet_spell`;

CREATE TABLE `pet_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

/*Data for the table `pet_spell` */

LOCK TABLES `pet_spell` WRITE;

UNLOCK TABLES;

/*Table structure for table `pet_spell_cooldown` */

DROP TABLE IF EXISTS `pet_spell_cooldown`;

CREATE TABLE `pet_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pet_spell_cooldown` */

LOCK TABLES `pet_spell_cooldown` WRITE;

UNLOCK TABLES;

/*Table structure for table `petition` */

DROP TABLE IF EXISTS `petition`;

CREATE TABLE `petition` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(10) unsigned DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ownerguid`,`type`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

/*Data for the table `petition` */

LOCK TABLES `petition` WRITE;

UNLOCK TABLES;

/*Table structure for table `petition_sign` */

DROP TABLE IF EXISTS `petition_sign`;

CREATE TABLE `petition_sign` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(11) unsigned NOT NULL DEFAULT '0',
  `playerguid` int(11) unsigned NOT NULL DEFAULT '0',
  `player_account` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petitionguid`,`playerguid`),
  KEY `Idx_playerguid` (`playerguid`),
  KEY `Idx_ownerguid` (`ownerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

/*Data for the table `petition_sign` */

LOCK TABLES `petition_sign` WRITE;

UNLOCK TABLES;

/*Table structure for table `playerbot_quest_data` */

DROP TABLE IF EXISTS `playerbot_quest_data`;

CREATE TABLE `playerbot_quest_data` (
  `autocomplete` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`autocomplete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `playerbot_quest_data` */

LOCK TABLES `playerbot_quest_data` WRITE;

UNLOCK TABLES;

/*Table structure for table `playerbot_saved_data` */

DROP TABLE IF EXISTS `playerbot_saved_data`;

CREATE TABLE `playerbot_saved_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `combat_order` int(11) unsigned NOT NULL DEFAULT '0',
  `primary_target` int(11) unsigned NOT NULL DEFAULT '0',
  `secondary_target` int(11) unsigned NOT NULL DEFAULT '0',
  `pname` varchar(12) NOT NULL DEFAULT '',
  `sname` varchar(12) NOT NULL DEFAULT '',
  `combat_delay` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_follow` int(11) unsigned NOT NULL DEFAULT '1',
  `autoequip` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Persistent Playerbot settings per alt';

/*Data for the table `playerbot_saved_data` */

LOCK TABLES `playerbot_saved_data` WRITE;

UNLOCK TABLES;

/*Table structure for table `playerbot_talentspec` */

DROP TABLE IF EXISTS `playerbot_talentspec`;

CREATE TABLE `playerbot_talentspec` (
  `talentspec_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `class` tinyint(3) NOT NULL,
  `purpose` int(11) unsigned NOT NULL,
  `talent_10` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_11` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_12` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_13` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_14` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_15` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_16` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_17` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_18` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_19` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_20` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_21` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_22` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_23` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_24` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_25` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_26` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_27` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_28` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_29` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_30` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_31` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_32` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_33` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_34` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_35` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_36` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_37` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_38` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_39` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_40` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_41` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_42` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_43` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_44` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_45` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_46` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_47` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_48` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_49` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_50` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_51` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_52` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_53` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_54` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_55` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_56` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_57` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_58` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_59` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_60` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_61` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_62` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_63` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_64` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_65` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_66` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_67` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_68` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_69` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_70` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_71` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_72` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_73` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_74` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_75` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_76` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_77` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_78` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_79` smallint(5) unsigned NOT NULL DEFAULT '0',
  `talent_80` smallint(5) unsigned NOT NULL DEFAULT '0',
  `major_glyph_15` smallint(5) unsigned NOT NULL DEFAULT '0',
  `major_glyph_30` smallint(5) unsigned NOT NULL DEFAULT '0',
  `major_glyph_80` smallint(5) unsigned NOT NULL DEFAULT '0',
  `minor_glyph_15` smallint(5) unsigned NOT NULL DEFAULT '0',
  `minor_glyph_50` smallint(5) unsigned NOT NULL DEFAULT '0',
  `minor_glyph_70` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`talentspec_id`,`class`,`purpose`),
  UNIQUE KEY `talentspec_id` (`talentspec_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='PlayerbotAI TalentSpec system';

/*Data for the table `playerbot_talentspec` */

LOCK TABLES `playerbot_talentspec` WRITE;

insert  into `playerbot_talentspec`(`talentspec_id`,`name`,`class`,`purpose`,`talent_10`,`talent_11`,`talent_12`,`talent_13`,`talent_14`,`talent_15`,`talent_16`,`talent_17`,`talent_18`,`talent_19`,`talent_20`,`talent_21`,`talent_22`,`talent_23`,`talent_24`,`talent_25`,`talent_26`,`talent_27`,`talent_28`,`talent_29`,`talent_30`,`talent_31`,`talent_32`,`talent_33`,`talent_34`,`talent_35`,`talent_36`,`talent_37`,`talent_38`,`talent_39`,`talent_40`,`talent_41`,`talent_42`,`talent_43`,`talent_44`,`talent_45`,`talent_46`,`talent_47`,`talent_48`,`talent_49`,`talent_50`,`talent_51`,`talent_52`,`talent_53`,`talent_54`,`talent_55`,`talent_56`,`talent_57`,`talent_58`,`talent_59`,`talent_60`,`talent_61`,`talent_62`,`talent_63`,`talent_64`,`talent_65`,`talent_66`,`talent_67`,`talent_68`,`talent_69`,`talent_70`,`talent_71`,`talent_72`,`talent_73`,`talent_74`,`talent_75`,`talent_76`,`talent_77`,`talent_78`,`talent_79`,`talent_80`,`major_glyph_15`,`major_glyph_30`,`major_glyph_80`,`minor_glyph_15`,`minor_glyph_50`,`minor_glyph_70`) values (1,'Death Knight Fast Leveling (54/17/0)',6,6,1939,1939,1945,1945,1945,2217,2217,1948,1948,1948,1941,2086,2086,2086,1943,1942,1942,1942,1953,1953,1953,1943,1943,1943,1943,1944,1944,1944,2015,2015,1960,1960,1960,1936,1936,1955,1955,1955,2259,2259,1957,1958,1958,1958,2015,2034,2034,2034,2034,2034,1950,1950,1950,2031,2031,2031,2020,2020,1973,1973,1973,1973,1973,2042,2042,2042,2042,2042,1971,1971,1938,520,558,524,522,553,555),(2,'Death Knight PvP (50/3/18)',6,2490368,1939,1939,1945,1945,1945,1938,1938,1938,1938,1938,2217,2217,2086,2086,2086,1943,1943,1943,1943,1943,1950,1950,1950,2015,2015,1944,1944,1944,2015,1941,1954,1960,1960,1960,1936,1955,1955,1955,2259,2259,1957,1958,1958,1958,1936,2034,2034,2034,2034,2034,2031,2031,2031,2082,2082,1932,1932,1932,1934,1934,1934,1963,1963,1933,1933,1933,2008,2008,2004,2004,2004,513,558,771,522,514,553),(3,'Death Knight Blood Tanking (53/8/10)',6,21,1968,1968,1968,1968,1968,2031,2031,2031,2218,2218,2218,2218,2218,1933,1933,1933,1963,1963,2017,2017,2017,2017,2017,1938,1938,1938,1938,1938,1943,1943,1943,1943,1943,2086,2086,2086,1941,2217,2217,1942,1942,1942,1950,1950,1950,1944,1944,1944,1936,1936,2105,2105,2015,2015,2015,2019,2259,2259,1957,1958,1958,1958,1959,1959,1959,2034,2034,2034,2034,2034,1960,772,558,532,522,555,553),(4,'Death Knight Unholy Raid DPS (0/17/54)',6,49,1932,1932,1932,2082,2082,1934,1934,1934,1963,1963,2047,2047,2047,2047,2047,2225,2225,2004,2004,2004,2005,2005,2005,2005,2005,1984,2008,2008,2008,2011,2011,1996,2285,2285,2285,2285,2285,1962,1962,1962,2007,2216,2043,2043,2043,2036,2036,2036,2036,2036,2000,2003,2003,2003,2031,2031,2031,2020,2020,1973,1973,1973,1973,1973,2042,2042,2042,2042,2042,1971,1971,771,524,527,514,555,553),(5,'Druid Feral Leveling (0/55/16)',11,6,796,796,796,796,796,805,805,799,799,799,798,798,798,807,807,803,803,803,1914,1914,801,801,802,802,804,808,808,808,808,808,809,1798,1798,1794,1794,1795,1795,1795,1794,1792,1796,1921,1921,1921,1920,1918,1918,1918,1918,1918,1927,1920,1920,2266,821,821,822,822,822,824,824,824,824,824,827,826,826,826,1915,1915,1792,166,165,674,431,551,435),(6,'Druid Feral PVP (0/60/11)',11,131072,796,796,796,796,796,805,805,794,794,794,798,798,798,807,807,803,803,803,1914,1914,801,801,1792,1792,804,808,808,808,808,808,809,1798,1798,1794,1794,1795,1795,1795,1794,1919,1796,1919,1919,1920,1920,1918,1918,1918,1918,1918,1927,1920,2266,1793,1793,1793,1921,1921,1921,799,821,821,822,822,822,824,824,824,824,824,827,166,165,674,431,551,435),(7,'Druid Balance Leveling (58/0/13)',11,6,762,762,762,762,762,783,783,783,1822,1822,789,789,789,2240,764,792,792,792,792,792,788,2239,2239,2239,1782,790,790,790,1784,1784,793,1912,1912,1912,1785,1913,1913,1786,1786,1786,1923,1787,1924,1924,1924,1928,1928,1928,1785,1785,1926,1786,1786,784,784,784,1782,1782,821,821,822,822,822,826,826,826,822,822,827,1915,1915,176,175,180,431,433,435),(8,'Druid Balance PVP (58/0/13)',11,131072,762,762,762,762,762,1822,1822,763,763,783,2240,764,764,789,789,792,792,792,792,792,788,2239,2239,2239,1782,790,790,790,784,784,793,1912,1912,1912,784,1913,1913,1913,1786,1786,1923,1787,1924,1924,1924,1928,1928,1928,1925,1925,1926,1786,1786,1786,789,1782,1782,1783,1783,821,821,822,822,822,826,826,826,822,822,827,1915,176,175,180,431,433,435),(9,'Druid Restoration AoE (14/0/57)',11,56,823,823,823,821,821,841,841,826,826,826,1915,1915,827,829,829,829,830,830,830,843,843,843,843,843,831,828,828,828,828,828,825,825,825,825,825,1789,1789,1789,1789,1789,1791,1930,1930,1930,844,1797,1797,1797,1916,1916,1916,1916,1916,1917,1922,1922,1922,2238,2238,2238,2238,2238,1822,1822,783,783,783,789,789,789,2240,172,168,672,435,434,433),(10,'Druid Restoration Single (14/0/57)',11,24,821,821,823,823,823,826,826,826,824,824,824,824,1915,1915,827,829,829,829,830,830,830,831,828,828,828,828,828,1788,1788,825,825,844,1797,1797,1797,1789,1789,1789,1789,1789,1791,1930,1930,1930,1922,1922,1922,1916,1916,1916,1916,1916,1917,843,843,843,843,2238,2238,2238,2238,2238,1822,1822,783,783,783,789,789,789,2240,891,168,673,435,434,433),(11,'Druid Feral Tanking (0/58/13)',11,17,796,796,796,796,796,794,794,794,805,805,798,798,798,807,807,803,803,803,801,801,804,1162,799,799,799,808,808,808,808,808,809,1798,1798,1794,1794,1794,2241,2241,2241,1919,1796,1920,1920,1920,1919,1918,1918,1918,1918,1918,2266,1927,802,802,2242,2242,2242,1919,821,821,822,822,822,824,824,824,824,824,827,822,822,162,811,161,433,435,434),(12,'Druid Balance DPS (56/0/15)',11,18,762,762,762,762,762,783,783,783,1822,1822,2240,789,789,789,764,764,792,792,792,792,792,788,2239,2239,2239,1783,1783,790,790,790,793,1912,1912,1912,1785,1785,1785,1786,1786,1786,1786,1786,1787,1924,1924,1924,1928,1928,1928,1782,1926,1782,1782,784,784,784,822,822,822,822,822,821,821,826,826,826,1915,1915,827,829,829,176,175,180,431,433,435),(13,'Hunter Beast Mastery Leveling (53/18/0)',3,22,1382,1382,1382,1382,1382,1395,1395,1395,1624,1624,2138,1396,1396,1396,1396,1393,1393,1393,1393,1393,1387,1388,1388,1390,1390,1397,1397,1397,1397,1397,1386,1800,1800,1800,1385,1802,1802,1802,1802,1802,1803,2140,2140,2140,2137,2227,2227,2227,2227,2227,2139,1344,1344,1344,1344,1344,1343,1343,1343,1806,1806,1806,1818,1818,1349,1349,1349,1349,1349,1385,1396,361,354,356,440,439,441),(14,'Hunter PVP (11/53/7)',3,393216,1344,1344,1344,1344,1344,1349,1349,1349,1349,1349,1345,1343,1343,1343,1806,1806,1806,1819,1819,1348,1348,1348,1353,2197,2197,1362,1362,1362,1804,1804,1361,2130,2130,2130,2197,1807,1807,1807,1807,1807,1808,2132,2132,2132,2133,2134,2134,2134,2134,2134,2135,2133,2133,1382,1382,1382,1382,1382,1389,1389,1389,1389,1389,2138,1623,1623,1623,1623,1623,1810,1810,361,351,369,440,439,441),(15,'Hunter Survival DPS (0/15/56)',3,18,1623,1623,1623,1623,1623,1305,1305,1305,1810,1810,1622,1622,1622,1622,1622,1306,1306,1306,2229,2229,1321,1321,1321,2228,2228,1303,1303,1303,1303,1303,1325,1812,1812,2228,2141,2141,2141,1813,1813,1322,2143,2143,2143,1811,1811,1811,2144,2144,1813,2145,1813,1813,2229,1809,1809,1809,1344,1344,1344,1344,1344,1349,1349,1349,1349,1349,1806,1806,1806,1345,1818,368,366,691,440,439,441),(16,'Mage Frost Leveling (20/0/51)',8,6,37,37,37,37,37,73,73,73,1649,1649,69,61,61,61,1649,67,67,67,38,38,72,38,741,741,64,68,68,68,1737,1737,71,1738,1738,1738,1738,1740,1740,1853,1853,1738,1741,64,64,62,62,1856,1856,1856,1856,1856,1857,74,74,76,76,76,75,75,75,75,75,81,81,81,1845,1845,2222,2222,2222,2211,1845,331,700,323,445,451,448),(17,'Mage Frost PVP (20/0/51)',8,8192,38,38,38,37,37,65,65,65,73,73,69,61,61,61,73,741,741,67,67,67,72,1736,1736,1736,37,68,68,68,1737,1737,71,1738,1738,1738,1738,1740,1740,1853,1853,1738,1741,2214,2214,37,37,1856,1856,1856,1856,1856,1857,76,76,76,74,74,1650,1650,85,85,85,81,81,81,2211,75,2222,2222,2222,88,88,321,700,323,445,446,447),(18,'Mage Fire Leveling (20/51/0)',8,6,26,26,26,26,26,34,34,34,34,34,29,23,23,27,27,25,25,25,1639,1639,32,33,33,33,1639,35,35,35,35,35,36,1733,1733,1733,30,1734,1734,1734,30,30,1735,1849,1849,1850,1850,1851,1851,1851,1851,1851,1852,74,74,76,76,76,75,75,75,75,75,81,81,81,1845,1845,2222,2222,2222,1142,1142,324,328,697,445,451,611),(19,'Mage Arcane DPS (57/3/11)',8,18,76,76,76,74,74,75,75,75,75,75,2211,81,81,81,82,1142,1142,1142,2222,2222,86,77,77,77,77,421,421,421,1725,1725,87,1727,1727,1727,77,1843,1843,1728,1728,1728,2209,2209,2209,2209,2209,1846,1846,1846,1826,1826,1847,1728,1728,2222,1845,1845,1845,62,62,62,38,38,1649,1649,1649,73,73,69,1141,1141,1141,312,328,651,445,451,450),(20,'Paladin Protection Tank (0/53/18)',2,17,2185,2185,2185,2185,2185,1629,1629,1629,1629,1629,1501,1501,1501,1423,1423,1422,1422,1422,1423,1423,1431,1748,1748,1748,1423,1750,1750,1429,1429,1429,1751,1751,1751,1430,2282,1753,1753,1753,1421,1421,1754,2195,2195,2195,2194,2204,2204,2204,2200,2200,2196,2194,1421,1403,1403,1403,1403,1403,1631,1631,1407,1407,1407,1633,1633,1634,1634,1407,1755,1755,1755,705,702,561,452,455,456),(21,'Paladin Holy SpellPower Focus (51/20/0)',2,24,1432,1432,1432,1432,1432,1449,1449,1449,1449,1449,1461,1461,1461,1461,1461,1444,1444,1444,1435,1450,1450,1450,1433,1465,1465,1465,1627,1627,1627,1627,1627,1502,1745,1745,1745,1746,1746,1746,1746,1746,2199,2199,2199,2199,2199,2193,2193,2191,2191,1747,2192,1442,1442,1442,1442,1442,1748,1748,1748,1425,1425,2280,1423,1423,1423,1423,1422,1422,1422,2281,2281,196,200,706,452,455,454),(22,'Paladin Holy SpellCrit Focus (51/0/20)',2,8,1432,1432,1432,1432,1432,1449,1449,1449,1449,1449,1444,1444,1444,1461,1461,1461,1461,1461,1435,1450,1433,1465,1465,1465,1450,1627,1627,1627,1627,1627,1502,1745,1745,1745,1450,1746,1746,1746,1746,1746,2199,2199,2199,2199,2199,2193,2193,2191,2191,1747,2192,1407,1407,1407,1407,1407,1464,1464,1464,1401,1401,1411,1411,1411,1411,1411,1761,1761,1761,1634,1634,196,199,706,452,455,457),(23,'Paladin Fast Leveling (0/10/61)',2,6,1407,1407,1407,1407,1407,1631,1631,1464,1464,1464,1481,1411,1411,1411,1411,1761,1761,1761,1755,1755,1756,1410,1410,1410,1411,1402,1402,1402,1634,1634,1758,1758,1758,1441,2176,1759,1759,1759,2147,2147,1823,2179,2179,2179,2176,2149,2149,2149,2148,2148,2150,2185,2185,2185,2185,2185,1401,1401,1633,1633,1755,1757,1757,2148,1632,1632,1425,1425,1748,1748,1748,183,703,184,453,455,456),(24,'Paladin PVP Leveling (0/17/54)',2,393216,1407,1407,1407,1407,1407,1631,1631,1464,1464,1464,1481,1411,1411,1411,1411,1761,1761,1761,1634,1634,1756,1410,1410,1410,1411,1402,1402,1402,1757,1757,1758,1758,1758,1441,2176,1759,1759,1759,2147,2147,1823,2179,2179,2179,2176,2149,2149,2149,1401,1401,2150,2185,2185,2185,2185,2185,1632,1632,1425,1425,1748,1748,1748,1501,1501,1501,1423,1423,1521,1521,2148,183,703,198,453,455,452),(25,'Priest Shadow Leveling Build (13/0/58)',5,6,465,465,465,2027,2027,463,463,463,482,482,501,462,462,462,462,461,461,461,881,881,484,1638,1638,462,481,2267,2267,2267,1781,1781,521,1778,1778,1778,1778,1816,1816,1816,1906,1906,1779,1909,1909,1909,1778,1907,1907,1907,1907,1907,1910,1898,1898,1898,1898,1898,346,346,346,344,344,347,347,347,481,481,481,481,1777,1777,1777,261,262,708,460,459,462),(26,'Priest Shadow PVP Build (13/0/58)',5,131072,465,465,465,2027,2027,482,482,462,462,462,501,542,542,462,462,461,461,461,881,881,484,541,1638,1638,481,2267,2267,2267,1781,1781,521,1778,1778,1778,1778,1816,1816,1816,1906,1906,1779,1908,1909,1909,1909,1907,1907,1907,1907,1907,1910,1778,481,481,481,481,463,463,1898,1898,1898,1898,1898,346,346,346,344,344,347,347,347,261,262,708,460,459,462),(27,'Priest Holy Healing (14/57/0)',5,24,401,401,401,401,401,1181,1181,1181,1181,1181,361,361,361,406,406,406,408,408,408,442,1561,402,402,402,402,402,1766,1766,404,404,404,404,404,1768,1768,1767,1767,1767,1767,1767,1815,1768,1902,1902,1902,1905,1905,1905,1905,1905,1911,1903,1903,1903,1904,1904,1904,1898,1898,1898,1898,1898,346,346,346,344,344,347,347,347,348,255,251,709,460,463,462),(28,'Priest Discipline Healing (57/14/0)',5,24,1898,1898,1898,1898,1898,346,346,346,344,344,347,347,347,343,343,343,341,341,341,348,1201,1201,1201,1201,1201,1771,1771,1772,1772,1772,322,1858,1858,1858,351,1896,1896,1896,2235,2235,1774,1895,1895,1895,1901,1202,1202,1202,1202,1202,1897,1901,1894,1894,1773,1773,1773,401,401,401,401,401,1181,1181,1181,1181,1181,361,361,361,442,255,263,710,460,463,462),(29,'Priest Shadow DPS (13/0/58)',5,18,465,465,465,2027,2027,482,482,463,463,463,501,462,462,462,462,461,461,461,881,881,484,1777,1777,1777,462,2267,2267,2267,1781,1781,521,1778,1778,1778,1778,1906,1906,1816,1816,1816,1779,1909,1909,1909,1778,1907,1907,1907,1907,1907,1910,483,483,481,481,481,481,481,1898,1898,1898,1898,1898,346,346,346,344,344,347,347,347,261,262,269,460,459,463),(30,'Priest Shadow Raiding',5,34,1898,1898,1898,1898,1898,346,346,346,344,344,347,347,347,348,462,462,462,462,462,466,466,482,482,463,463,463,481,481,481,481,481,501,483,483,881,881,461,461,461,484,1638,1638,1777,1777,1777,1781,1781,2267,2267,2267,521,1778,1778,1778,1778,1778,1906,1906,1816,1816,1816,1779,1909,1909,1909,1907,1907,1907,1907,1907,1910,261,262,269,460,459,463),(31,'Rogue Leveling (13/53/5)',4,6,201,201,221,221,221,1827,1827,181,181,181,221,221,181,181,204,186,186,186,1122,1122,223,242,242,242,242,242,1706,1706,1703,1703,205,1705,1705,1705,1122,1825,1825,1825,1825,1825,1709,2074,2074,2073,2073,2075,2075,2075,2075,2075,2076,1122,1122,2244,2244,2244,2244,2244,270,270,270,270,270,273,273,273,2068,2068,269,269,269,409,398,715,465,468,466),(32,'Rogue PVP (16/0/55)',4,131072,241,241,241,261,261,244,244,244,262,262,1123,1123,1123,247,247,263,263,245,245,245,1701,1701,265,265,284,1713,1713,1713,1702,1702,381,1722,1722,1722,1702,2077,2077,1712,1712,1712,1714,1712,1712,1702,1702,2080,2080,2080,2080,2080,2081,270,270,270,270,270,277,277,277,2068,2068,382,269,269,269,269,269,1700,1700,2079,2079,392,408,405,468,469,464),(33,'Rogue Assassination (51/15/5)',4,2,270,270,270,270,270,277,277,277,273,273,273,269,269,269,269,269,268,268,268,268,268,682,682,682,280,283,283,283,283,283,281,274,274,1721,1721,1718,1718,1718,2069,2069,2069,1719,1715,1715,1715,2070,2070,2070,2070,2070,2071,221,221,221,221,221,181,181,181,181,181,182,182,182,182,182,2244,2244,2244,2244,2244,406,733,714,465,469,468),(34,'Shaman Enhancement Leveling/DPS (16/55/0)',7,22,610,610,610,614,614,613,613,613,613,613,617,611,611,611,607,602,602,602,602,602,616,2083,2083,2083,607,1643,1643,1643,1689,1689,1690,1692,1692,1692,901,2249,2054,2054,2055,2055,1693,1691,1691,1691,1689,2057,2057,2057,2057,2057,2058,607,2055,563,563,563,563,563,1645,1645,1645,561,561,561,565,565,565,565,565,1647,1647,231,228,229,476,552,473),(35,'Shaman Enhancement PVP (17/54/0)',7,131072,610,610,610,614,614,605,605,613,613,613,617,613,613,611,611,602,602,602,602,602,616,2083,2083,2083,611,1643,1643,1643,1689,1689,1690,1692,1692,1692,901,2054,2054,2249,2055,2055,1693,1691,1691,1691,2055,2057,2057,2057,2057,2057,2058,2056,2056,563,563,563,563,563,1640,1640,1640,1645,1645,1645,565,565,565,565,565,574,1689,231,229,215,476,552,473),(36,'Shaman Elemental Leveling/DPS (57/14/0)',7,22,563,563,563,563,563,561,561,561,564,564,574,565,565,565,565,565,1642,1642,1642,564,562,1682,1682,1682,1641,721,721,721,721,721,573,2052,2052,2052,1641,2049,2049,1686,1686,1686,1687,2051,2051,2051,2262,2252,2252,2252,2252,2252,2053,2262,1685,1685,1685,564,564,614,614,614,614,614,613,613,613,613,613,617,611,611,611,226,219,214,475,476,473),(37,'Shaman Elemental PVP (58/13/0)',7,131072,563,563,563,563,563,1640,1640,1640,561,561,574,565,565,565,565,1642,1642,1642,567,567,562,565,1641,1641,561,721,721,721,721,721,573,2052,2052,2052,575,1686,1686,1686,2262,2262,2050,2050,2050,1687,2051,2252,2252,2252,2252,2252,2053,2051,2051,1685,1685,614,614,614,614,614,605,605,613,613,613,617,611,611,611,613,613,220,219,213,475,552,473),(38,'Shaman Restoration (0/16/55)',7,24,586,586,586,586,586,593,593,593,593,593,582,583,583,583,581,588,588,588,594,594,591,594,594,594,581,592,592,592,592,592,590,2084,587,587,587,1696,1696,1696,1697,1697,1698,2059,2059,2061,2061,2063,2063,2063,2063,2063,2064,2060,2060,2061,581,614,614,614,614,614,613,613,613,613,613,611,611,611,607,607,607,751,737,212,475,473,470),(39,'Warlock Affliction Leveling (56/0/15)',9,6,1003,1003,1003,1003,1003,1004,1004,1101,1101,1284,1061,1284,1001,1001,1001,1764,1764,1764,1002,1002,1041,1763,1763,1763,1763,1042,1042,1042,1042,1042,1669,1669,1669,1669,1669,1667,1667,1667,1873,1873,1670,2245,1763,1878,1878,1876,1876,1876,1876,1876,2041,1878,1022,1875,1007,1007,944,944,944,944,944,943,943,943,943,943,967,967,967,967,967,755,760,911,482,477,478),(40,'Warlock Demonology Leveling (16/55/0)',9,6,1883,1883,1223,1223,1223,1242,1242,1242,1224,1224,1282,1226,1671,1671,1671,1262,1262,1262,1262,1262,1281,1227,1227,1261,1261,1244,1244,1244,1244,1244,1880,1263,1263,1263,1680,1673,1673,1673,1673,1673,1672,1882,1882,1882,1680,1885,1885,1885,1885,1885,1886,1884,1884,1884,1680,1003,1003,1003,1003,1003,1101,1101,1284,1284,1004,1001,1001,1001,1004,1007,1007,275,278,760,478,482,479),(41,'Warlock Affliction PVP (54/17/0)',9,131072,1003,1003,1003,1003,1003,1004,1004,1284,1284,1005,1061,1001,1001,1001,1005,1021,1021,1002,1002,1764,1081,1041,2205,2205,1764,1042,1042,1042,1042,1042,1669,1669,1669,1669,1669,1668,1668,1667,1667,1667,1670,2245,1878,1878,1878,1876,1876,1876,1876,1876,2041,1764,1007,1007,1223,1223,1223,1883,1883,1242,1242,1242,1224,1224,1671,1671,1671,1282,1226,1227,1227,911,282,274,477,478,482),(42,'Warlock Destruction DPS (0/13/58)',9,18,943,943,943,943,943,941,941,941,982,982,967,967,967,967,967,985,985,964,983,983,981,961,961,961,1817,966,966,966,966,966,968,986,986,986,1817,1677,1677,1677,1677,1677,2045,2045,2045,1888,1888,1890,1890,1890,1890,1890,1891,1888,1817,1678,1678,1678,1889,1889,1222,1222,1222,1223,1223,1242,1242,1242,1883,1883,1671,1671,1671,283,273,272,477,478,482),(43,'Warlock Demonology DPS (0/56/15)',9,18,1223,1223,1223,1883,1883,1225,1225,1225,1242,1242,1671,1671,1671,1282,1226,1262,1262,1262,1262,1262,1261,1261,1227,1227,1242,1244,1244,1244,1244,1244,1880,1263,1263,1263,1283,1673,1673,1673,1673,1673,1672,1884,1884,1884,1283,1885,1885,1885,1885,1885,1886,2261,2261,1882,1882,1882,943,943,943,943,943,944,944,944,944,944,967,967,967,967,967,283,278,272,477,478,482),(44,'Warrior Fury Leveling (18/53/0)',1,6,157,157,157,157,157,2250,2250,2250,159,159,661,661,661,166,166,1581,1581,1581,1581,1581,165,1657,1657,1657,155,156,156,156,156,156,167,1655,1655,1864,1864,1658,1658,1658,1658,1658,1866,1866,1866,1864,155,2234,2234,2234,2234,2234,1867,155,155,124,124,124,130,130,130,130,130,641,641,662,662,121,121,121,136,136,136,496,490,509,483,488,484),(45,'Warrior PVP Leveling Sword Spec (56/15/0)',1,393216,130,130,130,130,130,641,641,641,126,126,662,662,121,121,121,136,136,136,131,131,123,123,123,123,123,133,134,134,1859,1859,135,1663,1663,1862,1862,2283,1860,1860,1824,1824,1661,1662,1662,1662,1664,2231,2231,2231,2231,2231,1863,1664,1824,2232,2232,2232,157,157,157,157,157,2250,2250,2250,161,161,160,661,661,661,161,762,489,494,483,485,484),(46,'Warrior PVP Leveling Poleaxe Spec (56/15/0)',1,393216,130,130,130,130,130,641,641,641,126,126,662,662,121,121,121,136,136,136,131,131,132,132,132,132,132,133,134,134,1859,1859,135,1663,1663,1862,1862,2283,1860,1860,1824,1824,1661,1662,1662,1662,1664,2231,2231,2231,2231,2231,1863,1664,1824,2232,2232,2232,157,157,157,157,157,2250,2250,2250,161,161,160,661,661,661,161,762,489,494,483,485,484),(47,'Warrior PVP Leveling Mace Spec (56/15/0)',1,393216,130,130,130,130,130,641,641,641,126,126,662,662,121,121,121,136,136,136,131,131,125,125,125,125,125,133,134,134,1859,1859,135,1663,1663,1862,1862,2283,1860,1860,1824,1824,1661,1662,1662,1662,1664,2231,2231,2231,2231,2231,1863,1664,1824,2232,2232,2232,157,157,157,157,157,2250,2250,2250,161,161,160,661,661,661,161,762,489,494,483,485,484),(48,'Warrior Fury DPS (19/52/0)',1,6,157,157,157,157,157,2250,2250,2250,159,159,166,166,166,154,154,1581,1581,1581,1581,1581,165,1657,1657,1657,155,156,156,156,156,156,167,1655,1655,1864,1864,1658,1658,1658,1658,1658,1659,1866,1866,1866,155,2234,2234,2234,2234,2234,1867,1864,124,124,124,130,130,641,641,641,130,130,662,662,121,121,121,136,136,136,137,496,509,492,484,483,851),(49,'Warrior Arms DPS Sword Spec (54/17/0)',1,6,130,130,130,130,130,641,641,641,127,127,662,662,121,121,121,136,136,136,2232,2232,133,123,123,123,123,123,1859,1859,2232,137,135,1663,1862,1862,131,1824,1824,1824,2283,131,1661,1662,1662,1662,1664,2231,2231,2231,2231,2231,1863,1664,1860,1860,157,157,157,157,157,2250,2250,2250,161,161,161,161,161,160,154,1542,1542,500,494,489,484,485,483),(50,'Warrior Arms DPS Poleaxe Spec (54/17/0)',1,6,130,130,130,130,130,641,641,641,127,127,662,662,121,121,121,136,136,136,2232,2232,133,132,132,132,132,132,1859,1859,2232,137,135,1663,1862,1862,131,1824,1824,1824,2283,131,1661,1662,1662,1662,1664,2231,2231,2231,2231,2231,1863,1664,1860,1860,157,157,157,157,157,2250,2250,2250,161,161,161,161,161,160,154,1542,1542,500,494,489,484,485,483),(51,'Warrior Arms DPS Mace Spec (54/17/0)',1,6,130,130,130,130,130,641,641,641,127,127,662,662,121,121,121,136,136,136,2232,2232,133,125,125,125,125,125,1859,1859,2232,137,135,1663,1862,1862,131,1824,1824,1824,2283,131,1661,1662,1662,1662,1664,2231,2231,2231,2231,2231,1863,1664,1860,1860,157,157,157,157,157,2250,2250,2250,161,161,161,161,161,160,154,1542,1542,500,494,489,484,485,483),(52,'Warrior Protection (15/3/53)',1,17,1601,1601,1601,1601,1601,138,138,138,138,138,140,140,140,140,140,141,141,141,147,147,152,153,146,146,146,702,702,702,702,702,1660,1660,1660,1652,1652,1653,1653,1653,1654,1654,1666,1893,1893,1893,2236,1871,1871,1871,2246,2246,1872,148,2250,2250,2250,130,130,130,130,130,641,641,641,124,124,662,662,121,121,121,144,502,501,492,487,485,851),(53,'Pet Ferocity BM Hunter (Wolf suggested)',-2,54,2112,2112,2112,2125,2125,2125,2113,2113,2107,2129,2129,2129,2157,2107,2128,2253,2253,2128,2254,2254,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(54,'Pet Tenacity BM Hunter (Bear suggested)',-3,1,2116,2116,2116,2173,2173,2117,2277,2117,2122,2163,2163,2122,2172,2237,2123,2255,2255,2258,2258,2123,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(55,'Pet Cunning PvP (Bird of Prey suggested)',-1,2228224,2118,2118,2119,2127,2127,2127,2120,2120,2120,2165,2167,2167,2257,2257,2184,2278,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

UNLOCK TABLES;

/*Table structure for table `pvpstats_battlegrounds` */

DROP TABLE IF EXISTS `pvpstats_battlegrounds`;

CREATE TABLE `pvpstats_battlegrounds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `winner_team` tinyint(3) NOT NULL,
  `bracket_id` tinyint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pvpstats_battlegrounds` */

LOCK TABLES `pvpstats_battlegrounds` WRITE;

UNLOCK TABLES;

/*Table structure for table `pvpstats_players` */

DROP TABLE IF EXISTS `pvpstats_players`;

CREATE TABLE `pvpstats_players` (
  `battleground_id` bigint(20) unsigned NOT NULL,
  `character_guid` int(10) unsigned NOT NULL,
  `score_killing_blows` mediumint(8) unsigned NOT NULL,
  `score_deaths` mediumint(8) unsigned NOT NULL,
  `score_honorable_kills` mediumint(8) unsigned NOT NULL,
  `score_bonus_honor` mediumint(8) unsigned NOT NULL,
  `score_damage_done` mediumint(8) unsigned NOT NULL,
  `score_healing_done` mediumint(8) unsigned NOT NULL,
  `attr_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battleground_id`,`character_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pvpstats_players` */

LOCK TABLES `pvpstats_players` WRITE;

UNLOCK TABLES;

/*Table structure for table `saved_variables` */

DROP TABLE IF EXISTS `saved_variables`;

CREATE TABLE `saved_variables` (
  `NextArenaPointDistributionTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `NextDailyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `NextWeeklyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `NextMonthlyQuestResetTime` bigint(40) unsigned NOT NULL DEFAULT '0',
  `cleaning_flags` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Variable Saves';

/*Data for the table `saved_variables` */

LOCK TABLES `saved_variables` WRITE;

UNLOCK TABLES;

/*Table structure for table `world` */

DROP TABLE IF EXISTS `world`;

CREATE TABLE `world` (
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `world` */

LOCK TABLES `world` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
