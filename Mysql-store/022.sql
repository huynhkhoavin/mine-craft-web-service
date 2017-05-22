/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.54-cll : Database - mine_craft_mods
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mine_craft_mods` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `mine_craft_mods`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`account_id`,`username`,`password`,`role`) values (1,'khoavin','af3033b84abc0a74b0a4f1527104e391',1),(2,'admin','e10adc3949ba59abbe56e057f20f883e',2);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(40) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values (1,'Adventure'),(2,'Creation'),(3,'CTM'),(4,'Custom Terrain'),(5,'MiniGame'),(6,'Parkour'),(7,'Puzzle'),(8,'PvP'),(9,'RedStone'),(10,'RollerCoaster'),(11,'Survival'),(12,'People'),(13,'None');

/*Table structure for table `error_code` */

DROP TABLE IF EXISTS `error_code`;

CREATE TABLE `error_code` (
  `response_code` varchar(20) NOT NULL,
  `meaning` text,
  PRIMARY KEY (`response_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `error_code` */

insert  into `error_code`(`response_code`,`meaning`) values ('200','Success!'),('201','Duplicate Insert Row'),('202','Unlike Success!'),('203','Like Success!'),('204','\r\nLogin success!'),('205','Login Failed!'),('206','Exist Item!'),('207','SQL Exception!'),('208','Item was verified!'),('209','Upload item was verified or not exist!'),('210','User has registerd!'),('211','Spin success'),('212','Need more time to spin next turn'),('213','User_id doen\'t exist in reward list or already set information!'),('214','Spin status : YES'),('215','Spin status : NO');

/*Table structure for table `event_constant` */

DROP TABLE IF EXISTS `event_constant`;

CREATE TABLE `event_constant` (
  `constaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `constaint_meaning` text,
  `constaint_value` int(11) NOT NULL,
  PRIMARY KEY (`constaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `event_constant` */

insert  into `event_constant`(`constaint_id`,`constaint_meaning`,`constaint_value`) values (1,'Luky Number',3);

/*Table structure for table `event_param` */

DROP TABLE IF EXISTS `event_param`;

CREATE TABLE `event_param` (
  `param_id` int(11) NOT NULL AUTO_INCREMENT,
  `param_meaning` text NOT NULL,
  `param_type` int(11) NOT NULL,
  `param_value` int(11) NOT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `event_param` */

insert  into `event_param`(`param_id`,`param_meaning`,`param_type`,`param_value`) values (1,'Lucky Number',0,20000);

/*Table structure for table `html_content` */

DROP TABLE IF EXISTS `html_content`;

CREATE TABLE `html_content` (
  `html_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `html_content` text NOT NULL,
  PRIMARY KEY (`html_content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2864 DEFAULT CHARSET=utf8;

/*Data for the table `item` */


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
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

/*Data for the table `item_comment` */

insert  into `item_comment`(`comment_id`,`item_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (104,'1','n8D45lrZviNuzMU5gOFl1IvZxve2','c?i b?p','2017-05-04 14:03:13',0),(105,'1','n8D45lrZviNuzMU5gOFl1IvZxve2','c?i b?p','2017-05-04 14:05:47',0),(106,'7','n8D45lrZviNuzMU5gOFl1IvZxve2','cá','2017-05-04 14:06:51',0),(107,'7','n8D45lrZviNuzMU5gOFl1IvZxve2','c?i b?p','2017-05-04 14:06:54',0),(108,'10','qCve4oIdHBeZdWVHFYLfDjaVWeH2','dhjv','2017-05-04 14:15:16',0),(109,'2817','n8D45lrZviNuzMU5gOFl1IvZxve2','hu','2017-05-04 15:26:33',0),(110,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','xão','2017-05-04 15:52:38',0),(111,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','jdhdib','2017-05-04 15:53:10',0),(112,'2560','qCve4oIdHBeZdWVHFYLfDjaVWeH2','gns','2017-05-04 16:07:45',0),(113,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','j','2017-05-04 16:23:55',0),(114,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','cãi nhau','2017-05-04 16:32:13',0),(115,'2672','qdZ3Q5vu06MlSmq2K9LzbgytWWx1','here','2017-05-04 16:50:42',0),(116,'1437','qCve4oIdHBeZdWVHFYLfDjaVWeH2',',','2017-05-05 09:27:00',0),(117,'2075','qCve4oIdHBeZdWVHFYLfDjaVWeH2','sgdg','2017-05-05 11:17:42',0);

/*Table structure for table `item_type` */

DROP TABLE IF EXISTS `item_type`;

CREATE TABLE `item_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(40) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `item_type` */

insert  into `item_type`(`type_id`,`type_name`) values (1,'AddOn'),(2,'Mod'),(3,'Map'),(4,'Skin'),(5,'Texture'),(6,'Seed');

/*Table structure for table `like` */

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `like` */

insert  into `like`(`like_id`,`comment_id`,`user_id`) values (1,1,'1'),(2,1,'1'),(3,1,'1'),(4,1,'1'),(5,1,'1'),(7,1,'2'),(21,2,'1'),(23,3,'1'),(24,20,'1'),(25,1,'1'),(26,1,'2');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` text NOT NULL,
  `news_thumb_url` text NOT NULL,
  `news_content_id` int(11) NOT NULL,
  `news_create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `news_comment` */

insert  into `news_comment`(`comment_id`,`news_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (1,0,1,'hahahassiss','2017-04-24 13:28:34',NULL),(2,0,1,'hahahassiss','2017-04-24 13:28:40',NULL),(3,1,1,'hahahassiss','2017-04-24 13:32:41',NULL),(4,1,1,'hahahassiss','2017-04-24 13:39:32',NULL),(5,1,1,'hahahassiss','2017-04-24 13:39:34',NULL),(6,1,1,'hahahassiss','2017-04-24 13:39:34',NULL),(7,1,1,'hahahassiss','2017-04-24 13:39:34',NULL),(8,1,1,'hahahassiss','2017-04-24 13:39:35',NULL),(9,3,1,'Hello','2017-04-24 13:48:08',NULL),(10,2,1,'ttdd','2017-04-25 10:05:51',NULL),(11,2,1,'ddd','2017-04-25 10:05:54',NULL),(12,2,1,'daa','2017-04-25 10:06:05',NULL),(13,1,1,'xcvxcvxcv','2017-04-25 15:50:06',NULL),(14,2,1,'dsfdsfdsf','2017-04-26 13:51:20',NULL),(15,2,1,'sdfdfdsf','2017-04-26 13:51:22',NULL),(16,2,1,'kjjklj','2017-04-26 13:52:59',NULL);

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_meaning` text NOT NULL,
  `resource_type` int(11) NOT NULL,
  `resource_value` int(11) NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `resource` */

insert  into `resource`(`resource_id`,`resource_meaning`,`resource_type`,`resource_value`) values (1,'15 USD',2,15),(2,'5 Coin',1,5),(3,'20 USD',2,20),(4,'10 Coin',1,10),(5,'5 USD',2,5),(6,'1 Coin',1,1),(7,'10 USD',2,10),(8,'3 Coin',1,3);

/*Table structure for table `reward` */

DROP TABLE IF EXISTS `reward`;

CREATE TABLE `reward` (
  `reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nation_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `reward` */

insert  into `reward`(`reward_id`,`user_id`,`resource_id`,`email`,`nation_name`) values (19,'n8D45lrZviNuzMU5gOFl1IvZxve2',7,'trungtghgchhhgg','');

/*Table structure for table `spin_list` */

DROP TABLE IF EXISTS `spin_list`;

CREATE TABLE `spin_list` (
  `spin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `spin_datetime` datetime NOT NULL,
  PRIMARY KEY (`spin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

/*Data for the table `spin_list` */

insert  into `spin_list`(`spin_id`,`user_id`,`resource_id`,`spin_datetime`) values (1,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-27 13:42:05'),(177,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 16:31:48'),(178,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 16:32:23'),(179,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:33:16'),(180,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'2017-04-28 16:33:39'),(181,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 16:38:37'),(182,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 16:43:40'),(183,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 16:44:02'),(184,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:44:26'),(185,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',5,'2017-04-28 16:44:55'),(186,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:50:21'),(187,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:54:05'),(188,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 17:03:39'),(189,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 17:04:35'),(190,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-04-28 17:08:59'),(191,'93rGobFFrzVNk4Nku8fH2vz4hp42',2,'2017-04-28 17:17:22'),(192,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-04-28 17:17:26'),(193,'93rGobFFrzVNk4Nku8fH2vz4hp42',6,'2017-04-28 17:17:30'),(194,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-04-28 17:17:34'),(195,'93rGobFFrzVNk4Nku8fH2vz4hp42',5,'2017-04-28 17:17:39'),(196,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 17:20:01'),(197,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 17:20:34'),(198,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 17:21:10'),(199,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 17:21:33'),(200,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-04-28 17:21:58'),(201,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 18:10:54'),(202,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 09:47:31'),(203,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 09:47:57'),(204,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 10:20:56'),(205,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 10:54:42'),(206,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 11:11:30'),(207,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 11:12:55'),(208,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 11:13:18'),(209,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 13:41:24'),(210,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 13:42:01'),(211,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 13:42:16'),(212,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 13:42:36'),(213,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 13:42:44'),(214,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 13:42:49'),(215,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 13:43:29'),(216,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 13:59:58'),(217,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 14:10:02'),(218,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 14:31:58'),(219,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 14:32:40'),(220,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 16:33:52'),(221,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 16:42:26'),(222,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 16:57:42'),(223,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 16:59:30'),(224,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 17:00:00'),(225,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 17:05:54'),(226,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 17:06:30'),(227,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 17:07:01'),(228,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 13:55:33'),(229,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-04 15:16:40'),(230,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-04 15:17:23'),(231,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 15:17:56'),(232,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',5,'2017-05-04 15:27:40'),(233,'n8D45lrZviNuzMU5gOFl1IvZxve2',4,'2017-05-04 15:29:41'),(234,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 15:30:17'),(235,'n8D45lrZviNuzMU5gOFl1IvZxve2',5,'2017-05-04 15:30:24'),(236,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-04 15:31:38'),(237,'n8D45lrZviNuzMU5gOFl1IvZxve2',2,'2017-05-04 15:32:17'),(238,'qdZ3Q5vu06MlSmq2K9LzbgytWWx1',5,'2017-05-04 16:59:14'),(239,'n8D45lrZviNuzMU5gOFl1IvZxve2',6,'2017-05-04 17:05:51'),(240,'n8D45lrZviNuzMU5gOFl1IvZxve2',4,'2017-05-04 17:06:06'),(241,'n8D45lrZviNuzMU5gOFl1IvZxve2',7,'2017-05-04 17:06:19'),(242,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 17:11:31'),(243,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-05 09:46:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=1637 DEFAULT CHARSET=utf8;

/*Data for the table `upload_item` */

insert  into `upload_item`(`item_id`,`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,`create_time`) values (1627,3,0,'Turok Dimension','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/TurokDimension.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/TurokDimension.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/TurokDimension.jpg','generalhawkins','','','Let us begin by just noting that this map includes more than fifty different types of challenges. For the most part they relate to mob battles and parkour. The reason why we decided to review this map was primarily because of the amazing amount of hours it must have taken to build this.\nThe creations in the map arent necessarily the most amazing looking but thats the part which makes it unique and fun to play. Play this map if you are looking for an adventure with lots of different challenges.\nImportant: Before starting the adventure make sure to set the map to survival mode. You can click on the edit button to the right of the world title in Minecraft PE to do this.','',1,0,NULL,1,'2017-05-04 15:21:47'),(1628,3,0,'The Prision','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/ThePrision.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/ThePrision.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/ThePrision.jpg','kapiolando','','','Read before downloading. Before starting the map having the most difficulty because otherwise no good. Do not forget to leave your like and comment','',1,0,NULL,1,'2017-05-04 15:21:47'),(1629,3,0,'World of keralis.','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/WorldOfKeralis.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/WorldOfKeralis.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/WorldOfKeralis.jpg','Kakkak','','','Hope you like this map thank','',1,0,NULL,1,'2017-05-04 15:21:47'),(1630,3,0,'Map Grand Theft Auto','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/MapGTA.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/MapGTA.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/MapGTA.jpg','locapzo','','','Update map for Minecraft PE versions 0.14.0','',1,0,NULL,1,'2017-05-04 15:21:47'),(1631,3,0,'Tomb Crafter 2: Egypt','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/TombCrafter2.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/TombCrafter2.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/TombCrafter2.jpg','minecraftstyler777, chipscz','','','Tomb Crafter 2: Egypt is an adventure map inspired by the Tomb Raider adventure games. Your mission is to venture into an old temple and obtain an ancient (and possibly magic) artifact known as Tutankhamuns helmet. Some of the challenges include parkour, a puzzle and mob battles. Be careful and watch out for the deadly traps.\nStoryline\nYouve been sent to Egypt on a mission to find and retrieve a long forgotten artifact known as Tutankhamuns helmet. Its believed to give whoever wears the helmet god-like powers and as a result you can probably imagine its worth. (Tutankhamun was actually an Egyptian pharaoh (1332-1323 BC). The story about the helmet with magic powers is fiction though, just thought Id clarify that.)\nRules\nSet difficulty to max\nGamemode must be set to survival\nThere are several traps throughout the map. Be careful, otherwise theres a good chance youll die and have to start over.\nIf you enjoyed this map make sure to check out Tomb Crafter 1. Personally, I think part 2 was better but part 1 is definitely worth playing too!','',1,0,NULL,1,'2017-05-04 15:21:47'),(1632,3,0,'Temple Adventure V0.1','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/TempleAdventureV01.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/TempleAdventureV01.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/TempleAdventureV01.jpg','RieLiIcECoOl','','','Made In Indonesia\nJangan Lupa Join Grub FB Kami\nBerbagi Info MCPE Indonesia','',1,0,NULL,1,'2017-05-04 15:21:47'),(1633,3,0,'Mysterious Witch V2','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/MysteriousWitchV2.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/MysteriousWitchV2.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/MysteriousWitchV2.jpg','GentaMCPE','','','A small family that live in a mystery forest, 1 day the mother accidently dead. From that day the father always feel upset and leave Marry behind, he went to the forest until Marry found the truth behind, the adventure begin…\n\nMap Rules:\n\n- Follow the story lines\n\n- Difficulty: Normal','',1,0,NULL,1,'2017-05-04 15:21:47'),(1634,3,0,'Modern House','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/ModernHouse.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/ModernHouse.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/ModernHouse.jpg','MnabilYaser','','','Hello guys!\n\nI have made a new modern house for MCPE…\n\nThis is my second housing map so plz like it :)\n\nThis map also contains some redstones but only 4 which way different from my first one (the first 1 is redstone-themed modern house)\n\nRedstones in the map:\n\n1) Toggle Trapdoor as fence gate\n\n2) 2 doors opened when you step on the pressure plate\n\n3) Item frame door lock\n\n4) Auto-brewing station','',1,0,NULL,1,'2017-05-04 15:21:47'),(1635,3,0,'Summoners Rift','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/SummonersRift.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/SummonersRift.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/SummonersRift.jpg','Bình Thuo`ng','','','Map for fan\'s game  LoL or Dota Allstar :D','',1,0,NULL,1,'2017-05-04 15:21:47'),(1636,3,0,'The AfterHand Map','http://azminecraftskins.com/mcpe/mcpemaps/files/adventure/TheAfterHandMap.zip','http://azminecraftskins.com/mcpe/mcpemaps/images/adventure/TheAfterHandMap.jpg','http://azminecraftskins.com/mcpe/mcpemaps/thumbs/adventure/TheAfterHandMap.jpg','DiamondKing567','','','You must get out alive or stay stranded on another planet!!! Your mission is to escape. Map III infected will be the next map after this one!!! Good Luck astronauts!!!!','',1,0,NULL,1,'2017-05-04 15:21:47');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_coint` int(11) DEFAULT NULL,
  `last_spin_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_coint`,`last_spin_datetime`) values ('93rGobFFrzVNk4Nku8fH2vz4hp42','Huynh Khoa Vin',0,'2017-04-01 11:08:03'),('n8D45lrZviNuzMU5gOFl1IvZxve2','Pamobile Dev02',26,'2017-05-04 17:06:19'),('nPqM0PcDNUWGQJ9QHEMbajLP8S63','Huỳnh Khoa Vin',0,'2017-04-01 11:08:03'),('qCve4oIdHBeZdWVHFYLfDjaVWeH2','Pamobile Dev04',118,'2017-05-05 09:46:49'),('qdZ3Q5vu06MlSmq2K9LzbgytWWx1','Trung My Nguyen',0,'2017-04-26 11:19:36');

/* Procedure structure for procedure `get_all_item_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_all_item_comment`(
		IN p_item_id INT(40),
		IN p_limit_amount INT(11)
)
BEGIN		
	IF (p_limit_amount > 0) THEN 
	SELECT `item_comment`.`comment_id`,`item_comment`.`item_id`,`item_comment`.`user_id`,`item_comment`.`comment_message`,`item_comment`.`like_count`,TIMEDIFF(NOW(),`item_comment`.`create_time`) as duration FROM mine_craft_mods.`item_comment` where `item_id`= p_item_id order by item_comment.`create_time` desc limit p_limit_amount;
	ELSE 
	SELECT `item_comment`.`comment_id`,`item_comment`.`item_id`,`item_comment`.`user_id`,`item_comment`.`comment_message`,`item_comment`.`like_count`,TIMEDIFF(NOW(),`item_comment`.`create_time`) AS duration  FROM mine_craft_mods.`item_comment` WHERE `item_id`= p_item_id ORDER BY item_comment.`create_time` DESC;
	end if;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;