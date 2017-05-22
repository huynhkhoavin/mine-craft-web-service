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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `event_constant` */

insert  into `event_constant`(`constaint_id`,`constaint_meaning`,`constaint_value`) values (1,'Luky Number',3),(2,'Spin Duration',12);

/*Table structure for table `event_param` */

DROP TABLE IF EXISTS `event_param`;

CREATE TABLE `event_param` (
  `param_id` int(11) NOT NULL AUTO_INCREMENT,
  `param_meaning` text NOT NULL,
  `param_type` int(11) NOT NULL,
  `param_value` int(11) NOT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `event_param` */

insert  into `event_param`(`param_id`,`param_meaning`,`param_type`,`param_value`) values (1,'Lucky Number',0,20000),(2,'spin_duration',1,43200);

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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

/*Data for the table `item_comment` */

insert  into `item_comment`(`comment_id`,`item_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (104,'1','n8D45lrZviNuzMU5gOFl1IvZxve2','c?i b?p','2017-05-04 14:03:13',0),(105,'1','n8D45lrZviNuzMU5gOFl1IvZxve2','c?i b?p','2017-05-04 14:05:47',0),(106,'7','n8D45lrZviNuzMU5gOFl1IvZxve2','cá','2017-05-04 14:06:51',0),(107,'7','n8D45lrZviNuzMU5gOFl1IvZxve2','c?i b?p','2017-05-04 14:06:54',0),(108,'10','qCve4oIdHBeZdWVHFYLfDjaVWeH2','dhjv','2017-05-04 14:15:16',0),(109,'2817','n8D45lrZviNuzMU5gOFl1IvZxve2','hu','2017-05-04 15:26:33',0),(110,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','xão','2017-05-04 15:52:38',0),(111,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','jdhdib','2017-05-04 15:53:10',0),(112,'2560','qCve4oIdHBeZdWVHFYLfDjaVWeH2','gns','2017-05-04 16:07:45',0),(113,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','j','2017-05-04 16:23:55',0),(114,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','cãi nhau','2017-05-04 16:32:13',0),(115,'2672','qdZ3Q5vu06MlSmq2K9LzbgytWWx1','here','2017-05-04 16:50:42',0),(116,'1437','qCve4oIdHBeZdWVHFYLfDjaVWeH2',',','2017-05-05 09:27:00',0),(117,'2075','qCve4oIdHBeZdWVHFYLfDjaVWeH2','sgdg','2017-05-05 11:17:42',0),(118,'2817','qCve4oIdHBeZdWVHFYLfDjaVWeH2','gfd','2017-05-05 03:46:48',0),(119,'2817','qCve4oIdHBeZdWVHFYLfDjaVWeH2','fdsa','2017-05-05 03:47:16',0),(120,'1','qCve4oIdHBeZdWVHFYLfDjaVWeH2','ân ','2017-05-05 03:49:03',0),(121,'1','qCve4oIdHBeZdWVHFYLfDjaVWeH2','Chủ tịch TP Đà Nẵng đi chợ để nghe ý kiến tiểu thương','2017-05-05 03:51:07',0),(122,'2561','qCve4oIdHBeZdWVHFYLfDjaVWeH2','xzx','2017-05-05 04:09:37',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `like` */

insert  into `like`(`like_id`,`comment_id`,`user_id`) values (1,1,'1'),(2,1,'1'),(3,1,'1'),(4,1,'1'),(5,1,'1'),(7,1,'2'),(21,2,'1'),(23,3,'1'),(24,20,'1'),(25,1,'1'),(26,1,'2'),(27,2,'93rGobFFrzVNk4Nku8fH2vz4hp42');

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
  `user_id` varchar(50) NOT NULL,
  `comment_message` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `news_comment` */

insert  into `news_comment`(`comment_id`,`news_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (1,0,'1','hahahassiss','2017-04-24 13:28:34',NULL),(2,0,'1','hahahassiss','2017-04-24 13:28:40',NULL),(3,1,'1','hahahassiss','2017-04-24 13:32:41',NULL),(4,1,'1','hahahassiss','2017-04-24 13:39:32',NULL),(5,1,'1','hahahassiss','2017-04-24 13:39:34',NULL),(6,1,'1','hahahassiss','2017-04-24 13:39:34',NULL),(7,1,'1','hahahassiss','2017-04-24 13:39:34',NULL),(8,1,'1','hahahassiss','2017-04-24 13:39:35',NULL),(9,3,'1','Hello','2017-04-24 13:48:08',NULL),(10,2,'1','ttdd','2017-04-25 10:05:51',NULL),(11,2,'1','ddd','2017-04-25 10:05:54',NULL),(12,2,'1','daa','2017-04-25 10:06:05',NULL),(13,1,'1','xcvxcvxcv','2017-04-25 15:50:06',NULL),(14,2,'1','dsfdsfdsf','2017-04-26 13:51:20',NULL),(15,2,'1','sdfdfdsf','2017-04-26 13:51:22',NULL),(16,2,'1','kjjklj','2017-04-26 13:52:59',NULL),(17,1,'0','kasdhadgsmansbdk','2017-05-05 05:57:50',NULL),(18,1,'0','kasdhadgsmansbdk','2017-05-05 05:59:11',NULL),(19,2,'0','gfd','2017-05-05 06:07:09',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `reward` */

insert  into `reward`(`reward_id`,`user_id`,`resource_id`,`email`,`nation_name`) values (19,'n8D45lrZviNuzMU5gOFl1IvZxve2',7,'trungtghgchhhgg',''),(20,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'',''),(21,'nPqM0PcDNUWGQJ9QHEMbajLP8S63',1,'',''),(22,'93rGobFFrzVNk4Nku8fH2vz4hp42',7,'',''),(23,'93rGobFFrzVNk4Nku8fH2vz4hp42',7,'','');

/*Table structure for table `spin_list` */

DROP TABLE IF EXISTS `spin_list`;

CREATE TABLE `spin_list` (
  `spin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `spin_datetime` datetime NOT NULL,
  PRIMARY KEY (`spin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

/*Data for the table `spin_list` */

insert  into `spin_list`(`spin_id`,`user_id`,`resource_id`,`spin_datetime`) values (1,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-27 13:42:05'),(177,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 16:31:48'),(178,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 16:32:23'),(179,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:33:16'),(180,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'2017-04-28 16:33:39'),(181,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 16:38:37'),(182,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 16:43:40'),(183,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 16:44:02'),(184,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:44:26'),(185,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',5,'2017-04-28 16:44:55'),(186,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:50:21'),(187,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:54:05'),(188,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 17:03:39'),(189,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 17:04:35'),(190,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-04-28 17:08:59'),(191,'93rGobFFrzVNk4Nku8fH2vz4hp42',2,'2017-04-28 17:17:22'),(192,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-04-28 17:17:26'),(193,'93rGobFFrzVNk4Nku8fH2vz4hp42',6,'2017-04-28 17:17:30'),(194,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-04-28 17:17:34'),(195,'93rGobFFrzVNk4Nku8fH2vz4hp42',5,'2017-04-28 17:17:39'),(196,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 17:20:01'),(197,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 17:20:34'),(198,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 17:21:10'),(199,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 17:21:33'),(200,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-04-28 17:21:58'),(201,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 18:10:54'),(202,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 09:47:31'),(203,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 09:47:57'),(204,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 10:20:56'),(205,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 10:54:42'),(206,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 11:11:30'),(207,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 11:12:55'),(208,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 11:13:18'),(209,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 13:41:24'),(210,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 13:42:01'),(211,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 13:42:16'),(212,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 13:42:36'),(213,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 13:42:44'),(214,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 13:42:49'),(215,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 13:43:29'),(216,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 13:59:58'),(217,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 14:10:02'),(218,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 14:31:58'),(219,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 14:32:40'),(220,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 16:33:52'),(221,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 16:42:26'),(222,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 16:57:42'),(223,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 16:59:30'),(224,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 17:00:00'),(225,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 17:05:54'),(226,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 17:06:30'),(227,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 17:07:01'),(228,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 13:55:33'),(229,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-04 15:16:40'),(230,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-04 15:17:23'),(231,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 15:17:56'),(232,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',5,'2017-05-04 15:27:40'),(233,'n8D45lrZviNuzMU5gOFl1IvZxve2',4,'2017-05-04 15:29:41'),(234,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 15:30:17'),(235,'n8D45lrZviNuzMU5gOFl1IvZxve2',5,'2017-05-04 15:30:24'),(236,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-04 15:31:38'),(237,'n8D45lrZviNuzMU5gOFl1IvZxve2',2,'2017-05-04 15:32:17'),(238,'qdZ3Q5vu06MlSmq2K9LzbgytWWx1',5,'2017-05-04 16:59:14'),(239,'n8D45lrZviNuzMU5gOFl1IvZxve2',6,'2017-05-04 17:05:51'),(240,'n8D45lrZviNuzMU5gOFl1IvZxve2',4,'2017-05-04 17:06:06'),(241,'n8D45lrZviNuzMU5gOFl1IvZxve2',7,'2017-05-04 17:06:19'),(242,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 17:11:31'),(243,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-05 09:46:49'),(244,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-05 03:55:40'),(245,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-05 04:43:01'),(246,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-05 05:03:07'),(247,'nPqM0PcDNUWGQJ9QHEMbajLP8S63',1,'2017-05-05 05:41:57'),(248,'nPqM0PcDNUWGQJ9QHEMbajLP8S63',6,'2017-05-05 05:46:09'),(249,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-05 05:56:31'),(250,'93rGobFFrzVNk4Nku8fH2vz4hp42',7,'2017-05-05 06:12:12'),(251,'93rGobFFrzVNk4Nku8fH2vz4hp42',2,'2017-05-05 06:13:04'),(252,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-05-05 06:13:39'),(253,'93rGobFFrzVNk4Nku8fH2vz4hp42',7,'2017-05-05 06:13:49'),(254,'93rGobFFrzVNk4Nku8fH2vz4hp42',6,'2017-05-05 06:14:04');

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

insert  into `user`(`user_id`,`user_name`,`user_coint`,`last_spin_datetime`) values ('93rGobFFrzVNk4Nku8fH2vz4hp42','Huynh Khoa Vin',9,'2017-05-05 06:14:04'),('asdadawds','KhoaVin',0,'2017-04-26 11:19:36'),('n8D45lrZviNuzMU5gOFl1IvZxve2','Pamobile Dev02',26,'2017-04-26 11:19:36'),('nPqM0PcDNUWGQJ9QHEMbajLP8S63','Huỳnh Khoa Vin',1,'2017-04-26 11:19:36'),('qCve4oIdHBeZdWVHFYLfDjaVWeH2','Pamobile Dev04',141,'2017-04-26 11:19:36'),('qdZ3Q5vu06MlSmq2K9LzbgytWWx1','Trung My Nguyen',0,'2017-04-26 11:19:36');

/* Procedure structure for procedure `add_new_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_new_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `add_new_upload_item`(
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
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
select count(*) from mine_craft_mods.`item` where item.item_name = p_item_name and `item`.`type_id` = p_type_id into @check_exist_a;
SELECT COUNT(*) FROM mine_craft_mods.`upload_item` WHERE upload_item.item_name = p_item_name and `upload_item`.`type_id` = p_type_id INTO @check_exist_b;
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

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `admin_authentication`(
		IN p_username VARCHAR(50),
		IN p_password VARCHAR(50)
    )
BEGIN
	
	SELECT COUNT(*) FROM account WHERE account.`username` = p_username AND account.`password` = p_password INTO @check_login;
	IF(@check_login = 1) THEN
		SELECT * FROM error_code WHERE response_code = 204;
	ELSE
		SELECT * FROM error_code WHERE response_code = 205;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `check_next_spin_turn` */

/*!50003 DROP PROCEDURE IF EXISTS  `check_next_spin_turn` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `check_next_spin_turn`(
		in p_user_id varchar(50) character set utf8
)
BEGIN
	select `event_constant`.`constaint_value` from `event_constant` where `event_constant`.`constaint_id` = 2 into @duration;
	select addtime(`user`.`last_spin_datetime`,SEC_TO_time(@duration*3600)) from `user` where `user`.`user_id` = p_user_id into @next_turn;
	SELECT TIMEDIFF(@next_turn,NOW()) AS Duration from `user` where `user`.`user_id` = p_user_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `check_spin_state` */

/*!50003 DROP PROCEDURE IF EXISTS  `check_spin_state` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `check_spin_state`(IN p_user_id VARCHAR(50) character set utf8
    )
BEGIN
		--	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	SELECT `event_constant`.`constaint_value` FROM `event_constant` WHERE `event_constant`.`constaint_id` = 2 INTO @duration;
	SELECT ADDTIME(`user`.`last_spin_datetime`,SEC_TO_TIME(@duration*3600)) FROM `user` WHERE `user`.`user_id` = p_user_id INTO @next_turn;
	SELECT TIMEDIFF(@next_turn,NOW())FROM `user` WHERE `user`.`user_id` = p_user_id into @check;
	
	if(@check < 0) then
	select * from `error_code` where `error_code`.`response_code` = 214;
	else
		SELECT * FROM `error_code` WHERE `error_code`.`response_code` = 215;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `create_item_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `create_item_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `create_item_comment`(
	IN p_item_id INT(11),
	IN p_user_id VARCHAR(50),
	IN p_message TEXT
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
        SELECT * FROM error_code WHERE `error_code`.`response_code`=200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `create_news_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `create_news_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `create_news_comment`(
		IN p_news_id INT(11),
		IN p_user_id INT(11),
		IN p_comment_message TEXT
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
	SELECT * FROM error_code WHERE error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `delete_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `delete_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `delete_upload_item`(
			IN p_item_id INT(11)
    )
BEGIN
    
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	DELETE
		
		FROM `mine_craft_mods`.`upload_item`
		WHERE `item_id` = p_item_id;
		SELECT * FROM error_code WHERE error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `download_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `download_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `download_item`(
	IN p_item_id INT(11)
    )
BEGIN
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	SELECT item.`download_count` FROM item WHERE `item_id` = p_item_id INTO @download;
	UPDATE `mine_craft_mods`.`item` SET `download_count` = (@download + 1)
	WHERE `item_id` = p_item_id;
	SELECT * FROM error_code WHERE error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `do_spin` */

/*!50003 DROP PROCEDURE IF EXISTS  `do_spin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `do_spin`(
		IN p_user_id VARCHAR(50) CHARACTER SET utf8
    )
BEGIN
		--	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	-- check last spin date time
	
	-- variable to check spin is valid if @valid >= 1
	select `event_constant`.`constaint_value` from `event_constant` where `event_constant`.`constaint_id` = 2 into @duration;
	SELECT timestampdiff(hour, user.`last_spin_datetime`,NOW()) FROM `user` WHERE `user`.`user_id` = p_user_id INTO @valid_spin;
	
	-- variable to save lucky number from event constaint
	SELECT `event_constant`.`constaint_value` FROM `event_constant` WHERE `event_constant`.`constaint_id` = 1 INTO @lucky_number;
	
	-- variable to save spin amount in spin list
	SELECT COUNT(`spin_list`.`spin_id`) FROM `spin_list` INTO @spin_count;
	
	-- lucky sequence of this turn
	SELECT (@spin_count % @lucky_number) INTO @lucky_sequence;
	
	-- valid spin
	IF(@valid_spin >= @duration) THEN
			SELECT NOW() INTO @spin_time;
			-- Get USD reward
		IF(@lucky_sequence = (@lucky_number-1)) THEN
			-- get result by rand in (1,3,5,7)
			SELECT ((FLOOR(RAND()*(3-0+1))+0)*2 + 1) INTO @result;
			
			SELECT `resource`.`resource_value` FROM `resource` WHERE `resource`.`resource_id` = @result INTO @resource_value;
			SELECT `resource`.`resource_meaning` FROM `resource` WHERE  `resource`.`resource_id` = @result INTO @resource_meaning;
			
			INSERT INTO `mine_craft_mods`.`spin_list`
				    (`user_id`,
				     `resource_id`,
				     `spin_datetime`)
			VALUES (p_user_id,
				@result,
				@spin_time);
			-- UPDATE datetime for user
			UPDATE `mine_craft_mods`.`user`
			SET `last_spin_datetime` = @spin_time
			WHERE `user_id` = p_user_id;
			-- add user to reward board
			
			INSERT INTO `mine_craft_mods`.`reward`
				    (
				     `user_id`,
				     `resource_id`,
				     `email`,
				     `nation_name`)
			VALUES (
				p_user_id,
				@result,
				'',
				'');			
			-- return response code
			
			SELECT `error_code`.`response_code`,`error_code`.`meaning`,@result AS result,@resource_meaning AS resource_meaning FROM `error_code` WHERE `error_code`.`response_code` = 211;
			
			
			-- Get Coin reward
		ELSE
			SELECT ((FLOOR(RAND()*(3-0+1))+0)*2 + 2) INTO @result;
			
			INSERT INTO `mine_craft_mods`.`spin_list`
				    (`user_id`,
				     `resource_id`,
				     `spin_datetime`)
		         VALUES (p_user_id,
				@result,
				@spin_time);
				
				-- get resource value
				SELECT `resource`.`resource_value` FROM `resource` WHERE `resource`.`resource_id` = @result INTO @resource_value;
				SELECT `resource`.`resource_meaning` FROM `resource` WHERE  `resource`.`resource_id` = @result INTO @resource_meaning;
				
				-- get user current coin
				SELECT `user`.`user_coint` FROM `user` WHERE `user`.`user_id` = p_user_id INTO @current_coin;
				
				-- Update new coin for user
				UPDATE `mine_craft_mods`.`user`
				SET `user_coint` = (@current_coin + @resource_value),
				`last_spin_datetime` = @spin_time
				WHERE `user_id` = p_user_id;
				
			SELECT `error_code`.`response_code`,`error_code`.`meaning`,@result AS result,@resource_meaning AS resource_meaning FROM `error_code` WHERE `error_code`.`response_code` = 211;	
			
		END IF;
	
	ELSE
		SELECT `error_code`.`response_code`,`error_code`.`meaning` FROM `error_code` WHERE `error_code`.`response_code` = 212;
	
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_admin_role` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_admin_role` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_admin_role`(
		IN p_user_name VARCHAR(50)
    )
BEGIN
    --	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	SELECT `account`.`role` FROM account WHERE account.`username` = p_user_name;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_categories` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_categories` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_all_categories`()
BEGIN
SELECT * FROM category;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_all_item`(
		IN p_amount INT(11)
)
BEGIN		
	IF (p_amount = 0) THEN
	SELECT * FROM mine_craft_mods.`item`;
	ELSE 
	SELECT * FROM item LIMIT p_amount;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_all_items`(
)
BEGIN		
	SELECT * FROM item;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_items_by_category` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_items_by_category` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_all_items_by_category`(
		IN p_category_id INT(11),
		IN p_limit_amount INT(11)
    )
BEGIN
	IF (p_limit_amount > 0) THEN
		SELECT * FROM item WHERE item.`category_id` = p_category_id LIMIT p_limit_amount;
	ELSE
		SELECT * FROM item WHERE item.`category_id` = p_category_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_item_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_all_item_comment`(
		IN p_item_id INT(40),
		IN p_limit_amount INT(11)
)
BEGIN		
	IF (p_limit_amount > 0) THEN 
	SELECT `item_comment`.`comment_id`,`item_comment`.`item_id`,`item_comment`.`user_id`,`item_comment`.`comment_message`,`item_comment`.`like_count`,TIMEDIFF(NOW(),`item_comment`.`create_time`) AS duration FROM mine_craft_mods.`item_comment` WHERE `item_id`= p_item_id ORDER BY item_comment.`create_time` DESC LIMIT p_limit_amount;
	ELSE 
	SELECT `item_comment`.`comment_id`,`item_comment`.`item_id`,`item_comment`.`user_id`,`item_comment`.`comment_message`,`item_comment`.`like_count`,TIMEDIFF(NOW(),`item_comment`.`create_time`) AS duration  FROM mine_craft_mods.`item_comment` WHERE `item_id`= p_item_id ORDER BY item_comment.`create_time` DESC;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_item_type` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_item_type` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_all_item_type`()
BEGIN
SELECT * FROM item_type;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_news_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_news_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_all_news_items`(
			IN p_limit_amount INT(11)
    )
BEGIN
	IF(p_limit_amount > 0) THEN
	SELECT * FROM news ORDER BY news.`news_create_at` DESC LIMIT p_limit_amount;
	ELSE
	SELECT * FROM news ORDER BY news.`news_create_at` DESC;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_all_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_all_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_all_upload_item`(
		IN p_start_datetime DATETIME,
		IN p_end_datetime DATETIME
)
BEGIN
	SELECT * FROM upload_item WHERE (`create_time` >= p_start_datetime) AND (`create_time`<= p_end_datetime);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_error_code` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_error_code` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_error_code`()
BEGIN
	SELECT * FROM error_code;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_home_newest_news` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_home_newest_news` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_home_newest_news`(
		IN p_amount INT(11)
	    )
BEGIN		
	IF (p_amount > 0 ) THEN
	SELECT * FROM news LIMIT p_amount;
	ELSE
	SELECT * FROM news;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_hot_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_hot_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_hot_items`(
		IN p_item_type INT(11),
		IN p_limit_count INT(11)
	    )
BEGIN		
	IF (p_limit_count >0) THEN
	SELECT * FROM item WHERE item.`type_id` = p_item_type ORDER BY item.`hot_priority` DESC LIMIT p_limit_count;
	ELSE
		SELECT * FROM item WHERE item.`type_id` = p_item_type ORDER BY item.`hot_priority` DESC;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_html_content` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_html_content` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_html_content`(
		IN p_html_content_id INT(11)
    )
BEGIN
	SELECT * FROM html_content WHERE html_content.`html_content_id` = p_html_content_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_item_by_type` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_item_by_type` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_item_by_type`(
    IN p_item_type_id INT(11),
    IN p_limit_amount INT(11)
    )
BEGIN
    IF(p_limit_amount > 0) THEN
	SELECT * FROM item WHERE item.`type_id` = p_item_type_id LIMIT p_limit_amount;
	ELSE
	SELECT * FROM item WHERE item.`type_id` = p_item_type_id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_news_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_news_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_news_comment`(
		IN p_news_id INT(11),
		IN p_limit_amount INT(11)
)
BEGIN		
	IF (p_limit_amount > 0) THEN 
	SELECT `news_comment`.`comment_id`,`news_comment`.`news_id`,`news_comment`.`user_id`,`news_comment`.`comment_message`,TIMEDIFF(NOW(),`news_comment`.`create_time`) AS duration FROM `news_comment` WHERE `news_id`= p_news_id ORDER BY news_comment.`create_time` DESC  LIMIT p_limit_amount;
	ELSE 
	SELECT `news_comment`.`comment_id`,`news_comment`.`news_id`,`news_comment`.`user_id`,`news_comment`.`comment_message`,TIMEDIFF(NOW(),`news_comment`.`create_time`) AS duration FROM `news_comment` WHERE `news_id`= p_news_id ORDER BY news_comment.`create_time` DESC;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_reward_list` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_reward_list` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_reward_list`()
BEGIN
	SELECT user.`user_name`,`resource`.`resource_meaning`,`reward`.`nation_name` FROM reward, resource,`user` WHERE `reward`.`resource_id` = `resource`.`resource_id` AND reward.`user_id` = user.`user_id`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_spin_duration` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_spin_duration` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_spin_duration`()
BEGIN
	select `event_constant`.`constaint_value` from `event_constant` where `event_constant`.`constaint_id` = 2;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_user_info` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_user_info` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `get_user_info`(
		IN p_user_id VARCHAR(50) CHARACTER SET utf8
    )
BEGIN
	
	SELECT * FROM `user` WHERE (`user`.`user_id` = p_user_id);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `like_comment` */

/*!50003 DROP PROCEDURE IF EXISTS  `like_comment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `like_comment`(
	IN p_user_id VARCHAR(50) character set utf8,
	IN p_comment_id INT(11)
)
BEGIN
	SELECT  COUNT(*) FROM `mine_craft_mods`.`like` WHERE ((comment_id = p_comment_id) AND (user_id = p_user_id)) INTO @check_liked;
	IF(@check_liked = 0) THEN
		INSERT INTO `mine_craft_mods`.`like`(`comment_id`,`user_id`) VALUES (p_comment_id,p_user_id);
		SELECT * FROM error_code WHERE `error_code`.`response_code` = 203;
	ELSE
		
		DELETE  FROM `mine_craft_mods`.`like` WHERE (`like`.`user_id`= p_user_id) AND (`like`.`comment_id` = p_comment_id);
		SELECT * FROM error_code WHERE response_code = 202;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `login` */

/*!50003 DROP PROCEDURE IF EXISTS  `login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `login`(
		IN p_user_id VARCHAR(50) character set utf8,
		IN p_user_name VARCHAR(50) character set utf8
    )
BEGIN
		--	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	SELECT COUNT(*) FROM `user` WHERE `user`.`user_id` = p_user_id INTO @check_user;
	IF (@check_user = 0) THEN
	INSERT INTO `mine_craft_mods`.`user`
            (`user_id`,
	     `user_name`,
             `user_coint`,
             `last_spin_datetime`)
		VALUES (p_user_id,
		p_user_name,
		0,
		'2017-04-01 11:08:03');
		SELECT * FROM error_code WHERE error_code.`response_code` = 200;
	ELSE 
		SELECT * FROM error_code WHERE error_code.`response_code` = 210;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `reset_spin_datetime` */

/*!50003 DROP PROCEDURE IF EXISTS  `reset_spin_datetime` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `reset_spin_datetime`(
		IN p_user_id INT(11)
    )
BEGIN
		UPDATE `mine_craft_mods`.`user`
		SET
		  `last_spin_datetime` = '2017-04-26 11:19:36'
		WHERE 
		  `user_id` = p_user_id;
		  SELECT * FROM error_code WHERE error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `search_items` */

/*!50003 DROP PROCEDURE IF EXISTS  `search_items` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `search_items`(
		IN p_search_keyword VARCHAR(50) CHARACTER SET utf8,
		IN p_limit_count INT(11)
)
BEGIN		
	IF (p_limit_count >0) THEN
	SELECT * FROM `item`,`item_type`,`category` WHERE
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

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `search_related_items`(
		IN p_item_id INT(11),
		IN p_search_keyword VARCHAR(50) CHARACTER SET utf8,
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

/* Procedure structure for procedure `send_reward_info` */

/*!50003 DROP PROCEDURE IF EXISTS  `send_reward_info` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `send_reward_info`(
		IN p_user_id VARCHAR(50),
		IN p_email VARCHAR(100),
		IN p_nation_name VARCHAR(100)
)
BEGIN
    		--	EXCEPTION CATCH
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	--
	SELECT COUNT(*) FROM `reward` WHERE `reward`.`user_id` = p_user_id AND reward.`email` LIKE '' INTO @check_exist;
	IF(@check_exist = 1 ) THEN
		UPDATE `mine_craft_mods`.`reward`
		SET 
		  
		  `email` = p_email,
		  `nation_name` = p_nation_name
		WHERE `user_id` = p_user_id;
		SELECT * FROM error_code WHERE error_code.`response_code` = 200;
	ELSE
		SELECT * FROM error_code WHERE error_code.`response_code` = 213;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `update_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `update_upload_item`(
		IN p_item_id INT(11),
		IN p_type_id INT(11),
		IN p_category_id INT(11),
		IN p_item_name VARCHAR(50),
		IN p_file_url TEXT,
		IN p_image_url TEXT,
		IN p_thumb_url TEXT,
		IN p_author_name TEXT,
		IN p_version VARCHAR(30),
		IN p_size VARCHAR(20),
		IN p_description TEXT,
		IN p_short_description TEXT,
		IN p_hot_priority INT(11),
		IN p_video_code VARCHAR(20),
		IN p_download_count INT(11)
		)
BEGIN
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	
	SELECT * FROM error_code WHERE error_code.`response_code` = 207;
	
	UPDATE `mine_craft_mods`.`upload_item`
	SET `item_id` = p_item_id,
	  `type_id` = p_type_id,
	  `category_id` = p_category_id,
	  `item_name` = p_item_name,
	  `file_url` = p_file_url,
	  `image_url` = p_image_url,
	  `thumb_url` = p_thumb_url,
	  `author_name` = p_author_name,
	  `version` = p_version,
	  `size` = p_size,
	  `description` = p_description,
	  `short_description` = p_short_description,
	  `hot_priority` = p_hot_priority,
	  `download_count` = p_download_count,
	  `video_code` = p_video_code,
	  `is_verify` = 0,
	  `create_time` = NOW()
	WHERE `item_id` = p_item_id;
	SELECT * FROM error_code WHERE error_code.`response_code` = 200;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `verify_upload_item` */

/*!50003 DROP PROCEDURE IF EXISTS  `verify_upload_item` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mcpecenter`@`42.119.150.188` PROCEDURE `verify_upload_item`(
		IN p_upload_item_id INT(11)
    )
BEGIN
	-- update is verify of upload item
	SELECT COUNT(*) FROM `upload_item` WHERE (`upload_item`.`item_id` = p_upload_item_id) INTO @check_upload_item;
		IF (@check_upload_item = 1) 
		THEN	
			SELECT COUNT(*) FROM `upload_item` WHERE ( `upload_item`.`item_id` = p_upload_item_id AND `upload_item`.`is_verify` = 1) INTO @check;
			
			IF(@check = 0) 
			THEN
				UPDATE `mine_craft_mods`.`upload_item`
				SET 
				  `is_verify` = 1
				WHERE `item_id` = p_upload_item_id;
				-- insert from upload item to item table
				INSERT INTO `item` (`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,
				`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,`create_time`)
				SELECT
				`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,
				`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,NOW()
				FROM   upload_item
				WHERE  `upload_item`.`item_id` = p_upload_item_id;
				
				-- delete from upload item  
				DELETE
				FROM `mine_craft_mods`.`upload_item`
				WHERE `item_id` = p_upload_item_id;
				-- response result of insert
				SELECT * FROM error_code WHERE error_code.`response_code` = 200;
			ELSE
				SELECT * FROM error_code WHERE error_code.`response_code` = 208;
			END IF;
		ELSE
			SELECT * FROM error_code WHERE error_code.`response_code` = 209;
		END IF;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;