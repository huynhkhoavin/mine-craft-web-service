/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.21-MariaDB : Database - mine_craft_mods
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mine_craft_mods` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mine_craft_mods`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `account` */

insert  into `account`(`account_id`,`username`,`password`) values (1,'khoavin','af3033b84abc0a74b0a4f1527104e391');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(40) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values (1,'Adventure'),(2,'Creation'),(3,'CTM'),(4,'Custom Terrain'),(5,'MiniGame'),(6,'Parkour'),(7,'Puzzle'),(8,'PvP'),(9,'RedStone'),(10,'RollerCoaster'),(11,'Survival');

/*Table structure for table `error_code` */

DROP TABLE IF EXISTS `error_code`;

CREATE TABLE `error_code` (
  `response_code` varchar(20) DEFAULT NULL,
  `meaning` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `error_code` */

insert  into `error_code`(`response_code`,`meaning`) values ('200','Success!'),('201','Duplicate Insert Row'),('202','Unlike Success!'),('203','Like Success!'),('204','\r\nLogin success!'),('205','Login Failed!'),('206','Exist Item!');

/*Table structure for table `html_content` */

DROP TABLE IF EXISTS `html_content`;

CREATE TABLE `html_content` (
  `html_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `html_content` text NOT NULL,
  PRIMARY KEY (`html_content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `html_content` */

insert  into `html_content`(`html_content_id`,`html_content`) values (1,'&lt;p&gt;My Title&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n&lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1&quot; /&gt; \n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://www.jqueryscript.net/images/Minimalist-Image-Viewer-Lightbox-Plugin-with-jQuery.jpg&quot; style=&quot;height:221px; width:300px&quot; /&gt;&lt;/p&gt;\n&lt;p&gt;&lt;iframe frameborder=&quot;0&quot; height=&quot;200&quot; src=&quot;https://www.youtube.com/embed/HQFk0pEq2bI&quot; width=&quot;300&quot;&gt;&lt;/iframe&gt;&lt;/p&gt;\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\n');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_name` varchar(50) NOT NULL,
  `file_url` text NOT NULL,
  `image_url` text NOT NULL,
  `thumb_url` text NOT NULL,
  `author_name` varchar(100) NOT NULL,
  `version` varchar(30) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `description` text NOT NULL,
  `short_description` text NOT NULL,
  `hot_priority` int(11) NOT NULL,
  `download_count` int(11) NOT NULL,
  `video_code` varchar(20) NOT NULL,
  `is_verify` tinyint(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `category_id` (`category_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `item_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `item` */

insert  into `item`(`item_id`,`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,`create_time`) values (1,1,2,'Mine-Trucks Addon','http://azminecraftskins.com/mcpe/mcpemods/files/MineTrucks.addon','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/MineTrucks.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/MineTrucks.jpg','MattH44','1.0.6',NULL,'Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.\\\\nStoryline\\\\nYouve long ruled your kingdom but recently someone overthrew you! He is an evil man and your people is now being ruled by a complete maniac. You need to find a way to destroy him and take back your lost kingdom. To do this youll need a couple of different tools','Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.',4,1005,'',0,'2017-04-20 13:27:33'),(2,2,1,'Pocket Creatures Mod','http://azminecraftskins.com/mcpe/mcpemods/files/PocketCreaturesMod.zip','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/PocketCreaturesMod.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/PocketCreaturesMod.jpg','BlockMaster_203','1.0.6',NULL,'Thorpe Park is a theme park in England which now has been recreated in Minecraft Pocket Edition. There are more than 40 different attractions (and that includes everything from roller coasters to water rides). However, it should be noticed that its not a 1:1 scale recreation and some attractions have been moved or changed to make everything fit nicely together.','Thorpe Park is a theme park in England which now has been recreated in Minecraft Pocket Edition.',3,1025,'',0,'2017-04-20 13:29:44'),(3,3,1,'Castle Adventure','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/CastleAdventureV2.zip','https://dl.dropboxusercontent.com/u/26776365/mcpemaps/images/adventure/CastleAdventureV2.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemaps/thumbs/adventure/CastleAdventureV2.jpg','MattH44','1.0.6',NULL,'Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.\\\\nStoryline\\\\nYouve long ruled your kingdom but recently someone overthrew you! He is an evil man and your people is now being ruled by a complete maniac. You need to find a way to destroy him and take back your lost kingdom. To do this youll need a couple of different tools','Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.',4,1005,'',0,'2017-04-21 12:02:03'),(6,6,NULL,'Too Many Temples (And More)','http://azminecraftskins.com/mcpe/mcpeseeds/files/TooManyTemples.zip','http://azminecraftskins.com/mcpe/mcpeseeds/images/TooManyTemples.jpg','http://azminecraftskins.com/mcpe/mcpeseeds/thumbs/TooManyTemples.jpg','','','920847948','In this seed you will find yourself spawning very close to three different temples. And just within minutes of spawning you will be able to collect almost fifty gold and iron ingots! Besides the temples we will also show you how to find a village and two witch huts.\nIn front of spawn is the first temple. To find the treasures destroy the colored blocks in the center and drop down there. Avoid the pressure plate as it will trigger a deadly TNT trap. In total there are four chests.\n19 bones\n18 iron ingots\n19 gold ingots\n33 rotten flesh\nTo find the two other temples return to the spawn but this time walk in the opposite direction (just turn around) and you will find them.\n12 gold ingots\n9 iron ingots\n3 diamonds\n34 bones\n22 rotten flesh\nIn front of the temples is a river. Follow the river to the left and after a while take a turn to the left as seen in the images down below.\nPretty soon you will find a little village.\nContinue straight out into the swamp biome for a while to find the first witch hut.\nFollow the path of the water in the swamp biome to get to the second witch hut.','In this seed you will find yourself spawning very close to three different temples. And just within minutes of spawning you will be able to collect almost fifty gold and iron ingots! Besides the temples we will also show you how to find a village and two witch huts.',1,456,'',0,'2017-04-01 00:00:00'),(7,4,NULL,'Strong Gladiator','http://azminecraftskins.com/mcpe/mcpeskins/files/fantasy/StrongGladiator.png','http://azminecraftskins.com/mcpe/mcpeskins/images/fantasy/StrongGladiator.jpg','http://azminecraftskins.com/mcpe/mcpeskins/thumbs/fantasy/StrongGladiator.jpg','Irish','','','A Roman champion fighting in the gladiator games.','',1,123,'',0,'2017-04-01 00:00:00'),(8,5,1,'2101: A Minecraft Odyssey','http://azminecraftskins.com/mcpe/mcpetextures/files/2101AMinecraftOdyssey.zip','http://azminecraftskins.com/mcpe/mcpetextures/images/2101AMinecraftOdyssey.jpg','http://azminecraftskins.com/mcpe/mcpetextures/thumbs/2101AMinecraftOdyssey.jpg','keithross39','1.0.6','32x32','Creator: Mediocritus (original PC pack). This texture pack includes textures which are considered modern and futuristic. The creators main inspiration while designing the texture pack was 2001: A Space Odyssey which is a classic sci-fi movie from the 60s. Its a really useful texture pack if you are building a space station or anything similar which relates to space or the future in general.','This texture pack includes textures which are considered modern and futuristic.',1,11,'',0,'2017-04-01 00:00:00'),(9,1,NULL,'2101: A Minecraft Odyssey','http://azminecraftskins.com/mcpe/mcpetextures/files/2101AMinecraftOdyssey.zip','http://azminecraftskins.com/mcpe/mcpetextures/images/2101AMinecraftOdyssey.jpg','http://azminecraftskins.com/mcpe/mcpetextures/images/2101AMinecraftOdyssey.jpg','keithross39','1.0.6','32x32','Creator: Mediocritus (original PC pack). This texture pack includes textures which are considered modern and futuristic. The creators main inspiration while designing the texture pack was 2001: A Space Odyssey which is a classic sci-fi movie from the 60s. Its a really useful texture pack if you are building a space station or anything similar which relates to space or the future in general.','',0,2000,'',0,'2017-04-21 17:07:46'),(10,1,NULL,'Too Many Temples (And More)','http://azminecraftskins.com/mcpe/mcpemods/files/MineTrucks.addon','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/MineTrucks.jpg','https://dl.dropboxusercontent.com/u/26776365/mcpemods/thumbs/MineTrucks.jpg','',NULL,NULL,'Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.\\\\nStoryline\\\\nYouve long ruled your kingdom but recently someone overthrew you! He is an evil man and your people is now being ruled by a complete maniac. You need to find a way to destroy him and take back your lost kingdom. To do this youll need a couple of different tools','Recently an evil villager decided to overthrow your kingdom and proclaim himself as king. This obviously comes as bitter news and its up to you to take back what was once yours and reinstate yourself as king. Its a fun map where you need to search for clues to find the tools youll need to save the kingdom.',4,399,'',NULL,'2017-04-21 17:17:03');

/*Table structure for table `item_comment` */

DROP TABLE IF EXISTS `item_comment`;

CREATE TABLE `item_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(100) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `comment_message` text NOT NULL,
  `create_time` datetime NOT NULL,
  `like_count` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `item_comment` */

insert  into `item_comment`(`comment_id`,`item_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (2,'1','1','gasgsafasf','2017-04-19 13:43:37',100),(3,'1','1','Greate Job!','2017-04-21 09:28:29',34),(4,'1','1','hehela','2017-04-21 10:42:31',0),(5,'1','1','hehela','2017-04-21 10:59:35',0),(6,'1','1','aksdhasnd.asdkjasd','2017-04-21 10:59:56',0),(7,'1','1','aksdhasnd.asdkjasd','2017-04-21 11:05:17',0),(8,'1','1','aksdhasnd.asdkjasd','2017-04-21 13:06:11',0),(9,'1','1','aksdhasnd.asdkjasd','2017-04-21 13:06:13',0),(10,'1','1','sdfdsfdsfsdfds','2017-04-21 13:23:23',0),(11,'1','1','Hello','2017-04-21 13:25:36',0),(12,'1','1','´dasdas','2017-04-21 13:27:35',0),(13,'1','1','´dasd´dasd','2017-04-21 13:27:44',0),(14,'1','1','´dasdasdasdasdasd','2017-04-21 13:27:48',0),(15,'1','1','sdfdsfdsfdsfdsf','2017-04-21 13:28:56',0),(16,'1','1','22222','2017-04-21 15:09:57',0),(17,'1','1','22222','2017-04-21 15:32:17',0),(18,'8','1','hgfhghgf','2017-04-24 09:12:33',0),(19,'2','1','fghgfhgfh','2017-04-24 09:13:52',0),(20,'3','1','dsfdsfdsfds','2017-04-24 09:17:43',0),(21,'2','1','asdsadsad','2017-04-24 09:21:27',0),(22,'2','1','sadsadsa','2017-04-24 09:21:29',0),(23,'1','1','dfdsfdsfdsf','2017-04-25 15:07:32',0),(24,'10','1','hjkhjkjhkhj','2017-04-25 15:44:14',0);

/*Table structure for table `item_type` */

DROP TABLE IF EXISTS `item_type`;

CREATE TABLE `item_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(40) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `item_type` */

insert  into `item_type`(`type_id`,`type_name`) values (1,'AddOn'),(2,'Mod'),(3,'Map'),(4,'Skin'),(5,'Texture'),(6,'Seed');

/*Table structure for table `like` */

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `like` */

insert  into `like`(`like_id`,`comment_id`,`user_id`) values (1,1,'1'),(2,1,'1'),(3,1,'1'),(4,1,'1'),(5,1,'1'),(7,1,'2'),(21,2,'1'),(23,3,'1'),(24,20,'1');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` text NOT NULL,
  `news_thumb_url` text NOT NULL,
  `news_content_id` int(11) NOT NULL,
  `news_create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `news` */

insert  into `news`(`news_id`,`news_title`,`news_thumb_url`,`news_content_id`,`news_create_at`) values (1,'My Title','http://www.gettyimages.in/gi-resources/images/Homepage/Hero/US/MAR2016/prestige-587705839_full.jpg',1,'2017-04-23 10:28:57'),(2,'Haha','http://beebom.com/wp-content/uploads/2016/01/Reverse-Image-Search-Engines-Apps-And-Its-Uses-2016.jpg',1,'2017-04-24 10:29:01'),(3,'Keke','http://1.bp.blogspot.com/-SzGp9N3s138/UzBFiIOyonI/AAAAAAAAKkE/YzOOFiW61DI/s1600/Beautiful+Indian+Girls+Wallpapers+for+Desktop+Image+12.jpg',1,'2017-04-21 10:29:04');

/*Table structure for table `news_comment` */

DROP TABLE IF EXISTS `news_comment`;

CREATE TABLE `news_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_message` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `news_comment` */

insert  into `news_comment`(`comment_id`,`news_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (1,0,1,'hahahassiss','2017-04-24 13:28:34',NULL),(2,0,1,'hahahassiss','2017-04-24 13:28:40',NULL),(3,1,1,'hahahassiss','2017-04-24 13:32:41',NULL),(4,1,1,'hahahassiss','2017-04-24 13:39:32',NULL),(5,1,1,'hahahassiss','2017-04-24 13:39:34',NULL),(6,1,1,'hahahassiss','2017-04-24 13:39:34',NULL),(7,1,1,'hahahassiss','2017-04-24 13:39:34',NULL),(8,1,1,'hahahassiss','2017-04-24 13:39:35',NULL),(9,3,1,'Hello','2017-04-24 13:48:08',NULL),(10,2,1,'ttdd','2017-04-25 10:05:51',NULL),(11,2,1,'ddd','2017-04-25 10:05:54',NULL),(12,2,1,'daa','2017-04-25 10:06:05',NULL);

/*Table structure for table `upload_item` */

DROP TABLE IF EXISTS `upload_item`;

CREATE TABLE `upload_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `file_url` text,
  `image_url` text,
  `thumb_url` text,
  `author_name` text,
  `version` varchar(30) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `description` text,
  `short_description` text,
  `hot_priority` int(11) DEFAULT NULL,
  `download_count` int(11) DEFAULT NULL,
  `video_code` varchar(20) DEFAULT NULL,
  `is_verify` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `upload_item` */

insert  into `upload_item`(`item_id`,`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,`create_time`) values (22,1,1,'adsads','C:\\Users\\Dev02\\Downloads\\unlocker208.zip','C:\\Users\\Dev02\\Pictures\\Camera Roll\\img.PNG',NULL,'asdads','asdads','asdasd','asdasdadwd','asdasd',0,0,'asdads',0,'2017-04-25 13:23:41'),(23,1,1,'adsadsssssdwa','C:\\Users\\Dev02\\Downloads\\unlocker208.zip','C:\\Users\\Dev02\\Pictures\\Camera Roll\\img.PNG',NULL,'asdads','asdads','asdasd','asdasdadwd','asdasd',0,0,'asdads',0,'2017-04-25 13:24:01'),(24,1,1,'KhoaVin','C:\\Users\\Dev02\\Downloads\\OneKey_V14.5.8.215.rar','C:\\Users\\Dev02\\Pictures\\Camera Roll\\img.PNG',NULL,'asdads','asdads','asdasd','asdasdadwd','asdasd',0,0,'asdads',0,'2017-04-25 13:29:47'),(25,1,1,'khoavin2','C:\\Users\\Dev02\\Downloads\\OneKey_V14.5.8.215.rar','C:\\Users\\Dev02\\Pictures\\Camera Roll\\img.PNG',NULL,'asdads','asdads','asdasd','asdasdadwd','asdasd',0,0,'asdads',0,'2017-04-25 14:56:21'),(26,1,1,'khoavin3','C:\\Users\\Dev02\\Downloads\\IDM 6.23 Build 12 Full SinhVienIT.Net.rar','C:\\Users\\Dev02\\Pictures\\Camera Roll\\img.PNG',NULL,'asdads','asdads','asdasd','asdasdadwd','asdasd',0,0,'asdads',0,'2017-04-25 14:58:06'),(27,1,1,'khoavin4','C:\\Users\\Dev02\\Downloads\\IDM 6.23 Build 12 Full SinhVienIT.Net.rar','C:\\Users\\Dev02\\Pictures\\Camera Roll\\img.PNG',NULL,'asdads','asdads','asdasd','asdasdadwd','asdasd',0,0,'asdads',0,'2017-04-25 14:58:15'),(28,1,1,'khoavin5','C:\\Users\\Dev02\\Downloads\\android-auth-1.0 (1).zip','C:\\Users\\Dev02\\Pictures\\Camera Roll\\img.PNG',NULL,'asdads','asdads','asdasd','asdasdadwd','asdasd',0,0,'asdads',0,'2017-04-25 15:26:28'),(29,1,1,'khoavin6','C:\\Users\\Dev02\\Downloads\\Zip-master.zip','C:\\Users\\Dev02\\Pictures\\Camera Roll\\img.PNG',NULL,'asdads','asdads','asdasd','asdasdadwd','asdasd',0,0,'asdads',0,'2017-04-25 15:33:20'),(30,1,1,'khoavin7','C:\\Users\\Dev02\\Downloads\\Zip-master.zip','C:\\Users\\Dev02\\Desktop\\mini.jpg',NULL,'asdads','asdads','asdasd','asdasdadwd','asdasd',0,0,'asdads',0,'2017-04-25 15:41:26');

/* Procedure structure for procedure `add_new_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_new_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_upload_item`(
	    in p_type_id int(11),
		in p_category_id int(11),
		in p_item_name VARCHAR(50),
		in p_file_url text,
		in p_image_url text,
		in p_thumb_url text,
		in p_author_name text,
		in p_version varchar(30),
		in p_size varchar(20),
		in p_description text,
		in p_short_description text,
		in p_hot_priority int(11),
		in p_video_code varchar(20),
		in p_download_count int(11),
		in p_is_verify int(11)
    )
BEGIN
select count(*) from mine_craft_mods.`item` where item.item_name = p_item_name into @check_exist_a;
SELECT COUNT(*) FROM mine_craft_mods.`upload_item` WHERE upload_item.item_name = p_item_name INTO @check_exist_b;
if ((@check_exist_a + @check_exist_b) = 0) then
	INSERT INTO `mine_craft_mods`.`upload_item`
            (`type_id`,
             `category_id`,
             `item_name`,
             `file_url`,
             `image_url`,
             `thumb_url`,
             `author_name`,
             `version`,
             `size`,
             `description`,
             `short_description`,
             `hot_priority`,
             `download_count`,
             `video_code`,
             `is_verify`,
             `create_time`)
VALUES (p_type_id,
        p_category_id,
        p_item_name,
        p_file_url,
        p_image_url,
        p_thumb_url,
        p_author_name,
        p_version,
        p_size,
        p_description,
        p_short_description,
        p_hot_priority,
        p_download_count,
        p_video_code,
        p_is_verify,
        NOW());
        select * from error_code where error_code.`response_code` = 200;
        else
        SELECT * FROM error_code WHERE error_code.`response_code` = 206;
        end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `admin_authentication` */

/*!50003 DROP PROCEDURE IF EXISTS  `admin_authentication` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_authentication`(
		IN p_username varchar(50),
		in p_password varchar(50)
    )
BEGIN
	
	select count(*) from account where account.`username` = p_username and account.`password` = p_password into @check_login;
	if(@check_login = 1) then
		select * from error_code where response_code = 204;
	else
		select * from error_code where response_code = 205;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `create_item_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `create_item_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `create_item_comment`(
	in p_item_id int(11),
	IN p_user_id VARCHAR(50),
	in p_message TEXT
    )
BEGIN
	INSERT INTO `mine_craft_mods`.`item_comment`
            (
             `item_id`,
             `user_id`,
             `comment_message`,
             `create_time`)
VALUES (
        p_item_id,
        p_user_id,
        p_message,
        NOW());
        select * from error_code where `error_code`.`response_code`=200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `create_news_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `create_news_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `create_news_comment`(
		in p_news_id int(11),
		in p_user_id int(11),
		in p_comment_message text
    )
BEGIN
	INSERT INTO `mine_craft_mods`.`news_comment`
		    (`news_id`,
		    `user_id`,
		     `comment_message`,
		     `create_time`)
	VALUES (p_news_id,
	p_user_id,
		p_comment_message,
		NOW());
	SELECT * FROM error_code where error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_categories` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_categories` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_categories`()
BEGIN
SELECT * FROM category;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_item`(
		IN p_amount INT(11)
)
BEGIN		
	IF (p_amount = 0) THEN
	SELECT * FROM mine_craft_mods.`item`;
	ELSE 
	SELECT * FROM item limit p_amount;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_items`(
)
BEGIN		
	SELECT * FROM item;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_items_by_category` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_items_by_category` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_items_by_category`(
		IN p_category_id INT(11),
		IN p_limit_amount int(11)
    )
BEGIN
	IF (p_limit_amount > 0) THEN
		SELECT * from item where item.`category_id` = p_category_id limit p_limit_amount;
	ELSE
		SELECT * from item where item.`category_id` = p_category_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_item_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_item_comment`(
		IN p_item_id INT(40),
		IN p_limit_amount INT(11)
)
BEGIN		
	IF (p_limit_amount > 0) THEN 
	SELECT `item_comment`.`comment_id`,`item_comment`.`item_id`,`item_comment`.`comment_message`,`item_comment`.`like_count`,TIMEDIFF(NOW(),`item_comment`.`create_time`) as duration FROM mine_craft_mods.`item_comment` where `item_id`= p_item_id limit p_limit_amount;
	ELSE 
	SELECT `item_comment`.`comment_id`,`item_comment`.`item_id`,`item_comment`.`comment_message`,`item_comment`.`like_count`,TIMEDIFF(NOW(),`item_comment`.`create_time`) AS duration  FROM mine_craft_mods.`item_comment` WHERE `item_id`= p_item_id;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_item_type` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item_type` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_item_type`()
BEGIN
SELECT * FROM item_type;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_news_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_news_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_news_items`(
			in p_limit_amount int(11)
    )
BEGIN
	if(p_limit_amount > 0) then
	select * from news order by news.`news_create_at` desc limit p_limit_amount;
	else
	SELECT * FROM news ORDER BY news.`news_create_at` DESC;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_upload_item`(
		in p_start_datetime datetime,
		in p_end_datetime datetime
)
BEGIN
	select * from upload_item where (`create_time` >= p_start_datetime) AND (`create_time`<= p_end_datetime);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_error_code` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_error_code` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_error_code`()
BEGIN
	SELECT * FROM error_code;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_home_newest_news` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_home_newest_news` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_home_newest_news`(
		IN p_amount INT(11)
	    )
BEGIN		
	if (p_amount > 0 ) THEN
	select * FROM news limit p_amount;
	ELSE
	SELECT * FROM news;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_hot_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_hot_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_hot_items`(
		IN p_item_type INT(11),
		IN p_limit_count INT(11)
	    )
BEGIN		
	if (p_limit_count >0) THEN
	SELECT * FROM item where item.`type_id` = p_item_type order by item.`hot_priority` desc LIMIT p_limit_count;
	ELSE
		SELECT * FROM item WHERE item.`type_id` = p_item_type ORDER BY item.`hot_priority` DESC;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_html_content` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_html_content` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_html_content`(
		IN p_html_content_id int(11)
    )
BEGIN
	SELECT * FROM html_content where html_content.`html_content_id` = p_html_content_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_item_by_type` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_item_by_type` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_item_by_type`(
    in p_item_type_id int(11),
    in p_limit_amount INT(11)
    )
BEGIN
    if(p_limit_amount > 0) then
	select * from item where item.`type_id` = p_item_type_id limit p_limit_amount;
	else
	select * from item where item.`type_id` = p_item_type_id;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_news_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_news_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_news_comment`(
		IN p_news_id INT(11),
		IN p_limit_amount INT(11)
)
BEGIN		
	IF (p_limit_amount > 0) THEN 
	SELECT `news_comment`.`comment_id`,`news_comment`.`news_id`,`news_comment`.`user_id`,`news_comment`.`comment_message`,TIMEDIFF(NOW(),`news_comment`.`create_time`) as duration FROM `news_comment` where `news_id`= p_news_id limit p_limit_amount;
	ELSE 
	SELECT `news_comment`.`comment_id`,`news_comment`.`news_id`,`news_comment`.`user_id`,`news_comment`.`comment_message`,TIMEDIFF(NOW(),`news_comment`.`create_time`) AS duration FROM `news_comment` WHERE `news_id`= p_news_id;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `like_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `like_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `like_comment`(
	in p_user_id VARCHAR(50),
	in p_comment_id int(11)
)
BEGIN
	SELECT  COUNT(*) FROM `mine_craft_mods`.`like` WHERE ((comment_id = p_comment_id) AND (user_id = p_user_id)) into @check_liked;
	if(@check_liked = 0) then
		INSERT INTO `mine_craft_mods`.`like`(`comment_id`,`user_id`) VALUES (p_comment_id,p_user_id);
		select * from error_code where `error_code`.`response_code` = 203;
	else
		
		DELETE  FROM `mine_craft_mods`.`like` where (`like`.`user_id`= p_user_id) and (`like`.`comment_id` = p_comment_id);
		select * from error_code where response_code = 202;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `search_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `search_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `search_items`(
		IN p_search_keyword VARCHAR(50),
		IN p_limit_count INT(11)
)
BEGIN		
	if (p_limit_count >0) THEN
	SELECT * FROM `item`,`item_type`,`category` where
	(item.`author_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`item_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`category_id` = category.`category_id` AND category.`category_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`type_id` = `item_type`.`type_id` AND item_type.`type_name` LIKE CONCAT("%",p_search_keyword,"%"))
	GROUP BY item.`item_id` LIMIT p_limit_count;
	ELSE
	SELECT * FROM `item`,`item_type`,`category` WHERE
	(item.`author_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`item_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`category_id` = category.`category_id` AND category.`category_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`type_id` = `item_type`.`type_id` AND item_type.`type_name` LIKE CONCAT("%",p_search_keyword,"%"))
	GROUP BY item.`item_id`;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `search_related_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `search_related_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `search_related_items`(
		IN p_item_id INT(11),
		IN p_search_keyword VARCHAR(50),
		IN p_limit_count INT(11)
)
BEGIN		
	IF(p_limit_count > 0) THEN
	SELECT * FROM `item`,`item_type`,`category` WHERE(
	(item.`author_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`item_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`category_id` = category.`category_id` AND category.`category_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`type_id` = `item_type`.`type_id` AND item_type.`type_name` LIKE CONCAT("%",p_search_keyword,"%")))
	AND (item.`item_id` <> p_item_id)
	GROUP BY item.`item_id` LIMIT p_limit_count;
	ELSE 
	SELECT * FROM `item`,`item_type`,`category` WHERE(
	(item.`author_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`item_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`category_id` = category.`category_id` AND category.`category_name` LIKE CONCAT("%",p_search_keyword,"%")) OR
	(item.`type_id` = `item_type`.`type_id` AND item_type.`type_name` LIKE CONCAT("%",p_search_keyword,"%")))
	AND (item.`item_id` <> p_item_id)
	GROUP BY item.`item_id`;
	END IF;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
