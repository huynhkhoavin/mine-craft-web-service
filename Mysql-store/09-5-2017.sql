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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`) values (1,'Adventure'),(2,'Creation'),(3,'CTM'),(4,'Custom Terrain'),(5,'MiniGame'),(6,'Parkour'),(7,'Puzzle'),(8,'PvP'),(9,'RedStone'),(10,'RollerCoaster'),(11,'Survival'),(12,'People'),(13,'None'),(14,'Movies'),(15,'TV'),(16,'Games'),(17,'Fantasy'),(18,'Mods'),(19,'Other');

/*Table structure for table `error_code` */

DROP TABLE IF EXISTS `error_code`;

CREATE TABLE `error_code` (
  `response_code` varchar(20) NOT NULL,
  `meaning` text,
  PRIMARY KEY (`response_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `error_code` */

insert  into `error_code`(`response_code`,`meaning`) values ('200','Success!'),('201','Duplicate Insert Row'),('202','Unlike Success!'),('203','Like Success!'),('204','\r\nLogin success!'),('205','Login Failed!'),('206','Exist Item!'),('207','SQL Exception!'),('208','Item was verified!'),('209','Upload item was verified or not exist!'),('210','User has registerd!'),('211','Spin success'),('212','Need more time to spin next turn'),('213','User_id doen\'t exist in reward list or already set information!'),('214','Spin status : YES'),('215','Spin status : NO'),('216','Not enough coin to buy this item!'),('217','This item already bought by this user');

/*Table structure for table `event_constant` */

DROP TABLE IF EXISTS `event_constant`;

CREATE TABLE `event_constant` (
  `constaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `constaint_meaning` text,
  `constaint_value` int(11) NOT NULL,
  PRIMARY KEY (`constaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `event_constant` */

insert  into `event_constant`(`constaint_id`,`constaint_meaning`,`constaint_value`) values (1,'Luky Number',20000),(2,'Spin Duration',12),(3,'Video Coin Amount',20);

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
  `price` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `category_id` (`category_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `item_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2865 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

/*Data for the table `item_comment` */

insert  into `item_comment`(`comment_id`,`item_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (106,'7','n8D45lrZviNuzMU5gOFl1IvZxve2','cá','2017-05-04 14:06:51',0),(108,'10','qCve4oIdHBeZdWVHFYLfDjaVWeH2','dhjv','2017-05-04 14:15:16',0),(109,'2817','n8D45lrZviNuzMU5gOFl1IvZxve2','hu','2017-05-04 15:26:33',0),(110,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','xão','2017-05-04 15:52:38',0),(111,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','jdhdib','2017-05-04 15:53:10',0),(112,'2560','qCve4oIdHBeZdWVHFYLfDjaVWeH2','gns','2017-05-04 16:07:45',0),(113,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','j','2017-05-04 16:23:55',0),(114,'2560','n8D45lrZviNuzMU5gOFl1IvZxve2','cãi nhau','2017-05-04 16:32:13',0),(115,'2672','qdZ3Q5vu06MlSmq2K9LzbgytWWx1','here','2017-05-04 16:50:42',0),(116,'1437','qCve4oIdHBeZdWVHFYLfDjaVWeH2',',','2017-05-05 09:27:00',0),(117,'2075','qCve4oIdHBeZdWVHFYLfDjaVWeH2','sgdg','2017-05-05 11:17:42',0),(118,'2817','qCve4oIdHBeZdWVHFYLfDjaVWeH2','gfd','2017-05-05 03:46:48',0),(119,'2817','qCve4oIdHBeZdWVHFYLfDjaVWeH2','fdsa','2017-05-05 03:47:16',0),(120,'1','qCve4oIdHBeZdWVHFYLfDjaVWeH2','ân ','2017-05-05 03:49:03',0),(121,'1','qCve4oIdHBeZdWVHFYLfDjaVWeH2','Chủ tịch TP Đà Nẵng đi chợ để nghe ý kiến tiểu thương','2017-05-05 03:51:07',0),(122,'2561','qCve4oIdHBeZdWVHFYLfDjaVWeH2','xzx','2017-05-05 04:09:37',0),(123,'2560','qCve4oIdHBeZdWVHFYLfDjaVWeH2','s','2017-05-07 22:51:01',0),(124,'2560','qCve4oIdHBeZdWVHFYLfDjaVWeH2','222','2017-05-07 23:11:45',0),(125,'2560','qCve4oIdHBeZdWVHFYLfDjaVWeH2','555','2017-05-07 23:15:26',0),(126,'1','V2ImZSkKPAZZxdyyLuJZtp3QcFk2','','2017-05-09 22:28:35',0),(127,'1','V2ImZSkKPAZZxdyyLuJZtp3QcFk2','hehe hoho haha','2017-05-09 22:28:54',0),(128,'1','V2ImZSkKPAZZxdyyLuJZtp3QcFk2','ecs','2017-05-16 05:31:17',0),(129,'2560','GsiyHijfybPo6NG1iX7pUMre9EB2','thank you','2017-05-17 05:02:23',0),(130,'2560','GsiyHijfybPo6NG1iX7pUMre9EB2','nice','2017-05-17 05:05:40',0);

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `news_comment` */

insert  into `news_comment`(`comment_id`,`news_id`,`user_id`,`comment_message`,`create_time`,`like_count`) values (22,1,'0','011d0111','2017-05-08 01:19:15',NULL),(23,2,'0','vvvv','2017-05-08 01:19:45',NULL),(24,2,'qCve4oIdHBeZdWVHFYLfDjaVWeH2','rrr','2017-05-08 01:20:22',NULL),(25,2,'qCve4oIdHBeZdWVHFYLfDjaVWeH2','ggg','2017-05-09 03:43:41',NULL),(26,3,'qCve4oIdHBeZdWVHFYLfDjaVWeH2','ggg','2017-05-09 03:43:59',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `reward` */

insert  into `reward`(`reward_id`,`user_id`,`resource_id`,`email`,`nation_name`) values (30,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'yyyyy','Vietnam'),(31,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'ttoo','France'),(35,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'g@gmai.com','Antarctica'),(36,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'u@g.com','Central African Republic'),(37,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'c@gmail.com','Canada'),(38,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',1,'','');

/*Table structure for table `spin_list` */

DROP TABLE IF EXISTS `spin_list`;

CREATE TABLE `spin_list` (
  `spin_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `spin_datetime` datetime NOT NULL,
  PRIMARY KEY (`spin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8;

/*Data for the table `spin_list` */

insert  into `spin_list`(`spin_id`,`user_id`,`resource_id`,`spin_datetime`) values (1,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-27 13:42:05'),(177,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 16:31:48'),(178,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 16:32:23'),(179,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:33:16'),(180,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'2017-04-28 16:33:39'),(181,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 16:38:37'),(182,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 16:43:40'),(183,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 16:44:02'),(184,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:44:26'),(185,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',5,'2017-04-28 16:44:55'),(186,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:50:21'),(187,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 16:54:05'),(188,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 17:03:39'),(189,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-04-28 17:04:35'),(190,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-04-28 17:08:59'),(191,'93rGobFFrzVNk4Nku8fH2vz4hp42',2,'2017-04-28 17:17:22'),(192,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-04-28 17:17:26'),(193,'93rGobFFrzVNk4Nku8fH2vz4hp42',6,'2017-04-28 17:17:30'),(194,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-04-28 17:17:34'),(195,'93rGobFFrzVNk4Nku8fH2vz4hp42',5,'2017-04-28 17:17:39'),(196,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 17:20:01'),(197,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 17:20:34'),(198,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-04-28 17:21:10'),(199,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-04-28 17:21:33'),(200,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-04-28 17:21:58'),(201,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-04-28 18:10:54'),(202,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 09:47:31'),(203,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 09:47:57'),(204,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 10:20:56'),(205,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 10:54:42'),(206,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 11:11:30'),(207,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 11:12:55'),(208,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 11:13:18'),(209,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 13:41:24'),(210,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 13:42:01'),(211,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 13:42:16'),(212,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 13:42:36'),(213,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 13:42:44'),(214,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 13:42:49'),(215,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-03 13:43:29'),(216,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 13:59:58'),(217,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 14:10:02'),(218,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 14:31:58'),(219,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 14:32:40'),(220,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 16:33:52'),(221,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 16:42:26'),(222,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 16:57:42'),(223,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-03 16:59:30'),(224,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-03 17:00:00'),(225,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-03 17:05:54'),(226,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-03 17:06:30'),(227,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-03 17:07:01'),(228,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 13:55:33'),(229,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-04 15:16:40'),(230,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-04 15:17:23'),(231,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 15:17:56'),(232,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',5,'2017-05-04 15:27:40'),(233,'n8D45lrZviNuzMU5gOFl1IvZxve2',4,'2017-05-04 15:29:41'),(234,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 15:30:17'),(235,'n8D45lrZviNuzMU5gOFl1IvZxve2',5,'2017-05-04 15:30:24'),(236,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-04 15:31:38'),(237,'n8D45lrZviNuzMU5gOFl1IvZxve2',2,'2017-05-04 15:32:17'),(238,'qdZ3Q5vu06MlSmq2K9LzbgytWWx1',5,'2017-05-04 16:59:14'),(239,'n8D45lrZviNuzMU5gOFl1IvZxve2',6,'2017-05-04 17:05:51'),(240,'n8D45lrZviNuzMU5gOFl1IvZxve2',4,'2017-05-04 17:06:06'),(241,'n8D45lrZviNuzMU5gOFl1IvZxve2',7,'2017-05-04 17:06:19'),(242,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-04 17:11:31'),(243,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-05 09:46:49'),(244,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-05 03:55:40'),(245,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-05 04:43:01'),(246,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-05 05:03:07'),(247,'nPqM0PcDNUWGQJ9QHEMbajLP8S63',1,'2017-05-05 05:41:57'),(248,'nPqM0PcDNUWGQJ9QHEMbajLP8S63',6,'2017-05-05 05:46:09'),(249,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-05 05:56:31'),(250,'93rGobFFrzVNk4Nku8fH2vz4hp42',7,'2017-05-05 06:12:12'),(251,'93rGobFFrzVNk4Nku8fH2vz4hp42',2,'2017-05-05 06:13:04'),(252,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-05-05 06:13:39'),(253,'93rGobFFrzVNk4Nku8fH2vz4hp42',7,'2017-05-05 06:13:49'),(254,'93rGobFFrzVNk4Nku8fH2vz4hp42',6,'2017-05-05 06:14:04'),(255,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-05 06:27:52'),(256,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-05 06:49:07'),(257,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-05 07:02:06'),(258,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-05 07:09:53'),(259,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',7,'2017-05-05 11:29:37'),(260,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',4,'2017-05-07 22:22:41'),(261,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-07 22:35:28'),(262,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-07 23:45:37'),(263,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-07 23:54:16'),(264,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-07 23:54:35'),(265,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'2017-05-07 23:54:58'),(266,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-08 01:06:43'),(267,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-08 01:07:02'),(268,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',5,'2017-05-08 01:07:21'),(269,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-08 01:09:25'),(270,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-08 01:09:46'),(271,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',5,'2017-05-08 01:10:08'),(272,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-08 01:16:38'),(273,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-08 01:16:51'),(274,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-08 01:17:06'),(275,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-09 01:08:06'),(276,'93rGobFFrzVNk4Nku8fH2vz4hp42',2,'2017-05-09 02:02:22'),(277,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'2017-05-09 02:36:19'),(278,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-09 02:53:22'),(279,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-09 02:53:40'),(280,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-09 02:54:00'),(281,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-09 03:12:39'),(282,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-09 03:13:03'),(283,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-09 03:13:19'),(284,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',4,'2017-05-09 03:19:02'),(285,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-09 03:19:29'),(286,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',3,'2017-05-09 03:19:51'),(287,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-09 03:23:48'),(288,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-09 03:24:05'),(289,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',1,'2017-05-09 03:24:19'),(290,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',8,'2017-05-09 03:25:12'),(291,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-09 03:25:32'),(292,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'2017-05-09 03:25:49'),(293,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',6,'2017-05-09 03:29:22'),(294,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-09 03:29:40'),(295,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',7,'2017-05-09 03:30:08'),(296,'93rGobFFrzVNk4Nku8fH2vz4hp42',8,'2017-05-09 03:41:07'),(297,'qCve4oIdHBeZdWVHFYLfDjaVWeH2',2,'2017-05-09 21:31:37'),(298,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',1,'2017-05-09 21:52:43'),(299,'qdZ3Q5vu06MlSmq2K9LzbgytWWx1',6,'2017-05-09 21:55:53'),(300,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',2,'2017-05-11 04:07:16'),(301,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',4,'2017-05-12 04:51:48'),(302,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',6,'2017-05-16 05:32:57'),(303,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',4,'2017-05-16 05:43:13'),(304,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',6,'2017-05-16 05:48:02'),(305,'V2ImZSkKPAZZxdyyLuJZtp3QcFk2',8,'2017-05-16 05:48:52'),(306,'GsiyHijfybPo6NG1iX7pUMre9EB2',6,'2017-05-17 05:18:48');

/*Table structure for table `store_manager` */

DROP TABLE IF EXISTS `store_manager`;

CREATE TABLE `store_manager` (
  `sm_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bought_datetime` datetime NOT NULL,
  PRIMARY KEY (`sm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `store_manager` */

insert  into `store_manager`(`sm_id`,`item_id`,`user_id`,`bought_datetime`) values (1,1,'93rGobFFrzVNk4Nku8fH2vz4hp42','2017-05-08 03:25:59'),(2,2571,'93rGobFFrzVNk4Nku8fH2vz4hp42','2017-05-09 02:38:01'),(3,2,'93rGobFFrzVNk4Nku8fH2vz4hp42','2017-05-09 03:15:33'),(4,7,'93rGobFFrzVNk4Nku8fH2vz4hp42','2017-05-09 03:22:28'),(5,7,'qCve4oIdHBeZdWVHFYLfDjaVWeH2','2017-05-09 03:44:41');

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
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1643 DEFAULT CHARSET=utf8;

/*Data for the table `upload_item` */

insert  into `upload_item`(`item_id`,`type_id`,`category_id`,`item_name`,`file_url`,`image_url`,`thumb_url`,`author_name`,`version`,`size`,`description`,`short_description`,`hot_priority`,`download_count`,`video_code`,`is_verify`,`create_time`,`price`) values (1641,1,13,'gg','http://azminecraftskins.com/mcpe/mcpemods/gg.addon','http://azminecraftskins.com/mcpe/mcpemods/gg.jpg','http://azminecraftskins.com/mcpe/mcpemods/gg.jpg','dfg','regsdccds','sdcd','xc','sc',0,0,'cz',0,'2017-05-08 04:19:35',0);