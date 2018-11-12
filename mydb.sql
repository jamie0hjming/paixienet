-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add goodsinfo',8,'add_goodsinfo'),(23,'Can change goodsinfo',8,'change_goodsinfo'),(24,'Can delete goodsinfo',8,'delete_goodsinfo'),(25,'Can add lun_bo',9,'add_lun_bo'),(26,'Can change lun_bo',9,'change_lun_bo'),(27,'Can delete lun_bo',9,'delete_lun_bo'),(28,'Can add sport_f1_shoes',10,'add_sport_f1_shoes'),(29,'Can change sport_f1_shoes',10,'change_sport_f1_shoes'),(30,'Can delete sport_f1_shoes',10,'delete_sport_f1_shoes'),(31,'Can add sport_f3_shoes',11,'add_sport_f3_shoes'),(32,'Can change sport_f3_shoes',11,'change_sport_f3_shoes'),(33,'Can delete sport_f3_shoes',11,'delete_sport_f3_shoes'),(34,'Can add sport_f2_shoes',12,'add_sport_f2_shoes'),(35,'Can change sport_f2_shoes',12,'change_sport_f2_shoes'),(36,'Can delete sport_f2_shoes',12,'delete_sport_f2_shoes'),(37,'Can add cart',13,'add_cart'),(38,'Can change cart',13,'change_cart'),(39,'Can delete cart',13,'delete_cart'),(40,'Can add order',14,'add_order'),(41,'Can change order',14,'change_order'),(42,'Can delete order',14,'delete_order'),(43,'Can add order goods',15,'add_ordergoods'),(44,'Can change order goods',15,'change_ordergoods'),(45,'Can delete order goods',15,'delete_ordergoods'),(46,'Can add use1r',16,'add_use1r'),(47,'Can change use1r',16,'change_use1r'),(48,'Can delete use1r',16,'delete_use1r');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `is_select` tinyint(1) NOT NULL,
  `shoes_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_shoes_id_c33f96f9_fk_myapp_sport_f1_shoes_id` (`shoes_id`),
  KEY `cart_user_id_1361a739_fk_myapp_user_id` (`user_id`),
  CONSTRAINT `cart_shoes_id_c33f96f9_fk_myapp_sport_f1_shoes_id` FOREIGN KEY (`shoes_id`) REFERENCES `myapp_sport_f1_shoes` (`id`),
  CONSTRAINT `cart_user_id_1361a739_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (152,10,0,6,13),(153,16,0,3,13),(169,6,0,7,14);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'myapp','cart'),(8,'myapp','goodsinfo'),(9,'myapp','lun_bo'),(14,'myapp','order'),(15,'myapp','ordergoods'),(10,'myapp','sport_f1_shoes'),(12,'myapp','sport_f2_shoes'),(11,'myapp','sport_f3_shoes'),(16,'myapp','use1r'),(7,'myapp','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-02 04:55:45.608233'),(2,'auth','0001_initial','2018-11-02 04:55:54.897092'),(3,'admin','0001_initial','2018-11-02 04:55:57.209931'),(4,'admin','0002_logentry_remove_auto_add','2018-11-02 04:55:57.356522'),(5,'contenttypes','0002_remove_content_type_name','2018-11-02 04:55:58.554675'),(6,'auth','0002_alter_permission_name_max_length','2018-11-02 04:55:59.451015'),(7,'auth','0003_alter_user_email_max_length','2018-11-02 04:56:00.279314'),(8,'auth','0004_alter_user_username_opts','2018-11-02 04:56:00.339225'),(9,'auth','0005_alter_user_last_login_null','2018-11-02 04:56:00.971456'),(10,'auth','0006_require_contenttypes_0002','2018-11-02 04:56:01.017870'),(11,'auth','0007_alter_validators_add_error_messages','2018-11-02 04:56:01.084234'),(12,'auth','0008_alter_user_username_max_length','2018-11-02 04:56:01.845335'),(18,'sessions','0001_initial','2018-11-02 04:56:04.811509'),(19,'myapp','0006_sport_f1_shoes','2018-11-04 07:13:36.663344'),(21,'myapp','0006_sport_f2_shoes','2018-11-04 08:23:09.370435'),(25,'myapp','0001_initial','2018-11-10 12:27:14.835146'),(26,'myapp','0002_user_account','2018-11-10 13:13:35.078492');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_goodsinfo`
--

DROP TABLE IF EXISTS `myapp_goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_num` varchar(10) NOT NULL,
  `img` varchar(100) NOT NULL,
  `old_price` varchar(10) NOT NULL,
  `new_price` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_goodsinfo`
--

LOCK TABLES `myapp_goodsinfo` WRITE;
/*!40000 ALTER TABLE `myapp_goodsinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `myapp_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_lun_bo`
--

DROP TABLE IF EXISTS `myapp_lun_bo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_lun_bo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `track_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_lun_bo`
--

LOCK TABLES `myapp_lun_bo` WRITE;
/*!40000 ALTER TABLE `myapp_lun_bo` DISABLE KEYS */;
INSERT INTO `myapp_lun_bo` VALUES (1,'img/imgs/lun_bo1_01.jpg','1'),(2,'img/imgs/lun_bo1_02.jpg','2'),(3,'img/imgs/lun_bo1_03.jpg','3'),(4,'img/imgs/lun_bo1_04.jpg','4');
/*!40000 ALTER TABLE `myapp_lun_bo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_order`
--

DROP TABLE IF EXISTS `myapp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_order_user_id_98783cea_fk_myapp_user_id` (`user_id`),
  CONSTRAINT `myapp_order_user_id_98783cea_fk_myapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_order`
--

LOCK TABLES `myapp_order` WRITE;
/*!40000 ALTER TABLE `myapp_order` DISABLE KEYS */;
INSERT INTO `myapp_order` VALUES (47,'2018-11-11 14:36:34.398326',1,'154194699424624',14),(48,'2018-11-11 15:06:55.991072',1,'154194881511041',14),(49,'2018-11-11 15:07:08.198766',1,'154194882821495',14),(50,'2018-11-11 15:24:43.777708',1,'154194988374142',14),(51,'2018-11-11 15:24:59.141078',1,'154194989992221',14),(52,'2018-11-12 00:58:23.245165',1,'154198430353875',14),(53,'2018-11-12 01:06:22.470674',1,'154198478273476',14),(54,'2018-11-12 01:16:09.681004',1,'154198536926312',14),(55,'2018-11-12 01:28:17.690663',1,'154198609758845',14),(56,'2018-11-12 01:35:38.397081',1,'154198653837562',14),(57,'2018-11-12 01:48:25.162302',1,'154198730543276',14),(58,'2018-11-12 01:51:18.691532',1,'154198747829106',14),(59,'2018-11-12 01:56:08.429755',1,'154198776817224',14),(60,'2018-11-12 02:07:10.326408',1,'154198843040339',14),(61,'2018-11-12 02:10:06.219384',1,'154198860687233',14),(62,'2018-11-12 02:10:27.559902',1,'154198862772870',14),(63,'2018-11-12 02:15:39.481703',1,'154198893947161',14);
/*!40000 ALTER TABLE `myapp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_ordergoods`
--

DROP TABLE IF EXISTS `myapp_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `sport_f1_shoes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_ordergoods_order_id_c15463b8_fk_myapp_order_id` (`order_id`),
  KEY `myapp_ordergoods_sport_f1_shoes_id_9b40e247_fk_myapp_spo` (`sport_f1_shoes_id`),
  CONSTRAINT `myapp_ordergoods_order_id_c15463b8_fk_myapp_order_id` FOREIGN KEY (`order_id`) REFERENCES `myapp_order` (`id`),
  CONSTRAINT `myapp_ordergoods_sport_f1_shoes_id_9b40e247_fk_myapp_spo` FOREIGN KEY (`sport_f1_shoes_id`) REFERENCES `myapp_sport_f1_shoes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_ordergoods`
--

LOCK TABLES `myapp_ordergoods` WRITE;
/*!40000 ALTER TABLE `myapp_ordergoods` DISABLE KEYS */;
INSERT INTO `myapp_ordergoods` VALUES (4,6,47,3),(5,9,47,30),(6,7,49,8),(7,6,51,3),(8,8,52,8),(9,4,53,1),(10,5,54,1),(11,2,55,1),(12,4,56,1),(13,5,56,9),(14,5,57,9),(15,6,57,10),(16,8,58,3),(17,11,59,3),(18,14,59,8),(19,4,60,23),(20,4,61,8),(21,16,62,28),(22,13,63,28);
/*!40000 ALTER TABLE `myapp_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_sport_f1_shoes`
--

DROP TABLE IF EXISTS `myapp_sport_f1_shoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_sport_f1_shoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `sc` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `img1` varchar(100) NOT NULL,
  `img2` varchar(100) NOT NULL,
  `img3` varchar(100) NOT NULL,
  `img4` varchar(100) NOT NULL,
  `img5` varchar(100) NOT NULL,
  `s1` varchar(100) NOT NULL,
  `s2` varchar(100) NOT NULL,
  `s3` varchar(100) NOT NULL,
  `s4` varchar(100) NOT NULL,
  `s5` varchar(100) NOT NULL,
  `c1` varchar(100) NOT NULL,
  `size` varchar(6) NOT NULL,
  `num` int(11) NOT NULL,
  `id_num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_sport_f1_shoes`
--

LOCK TABLES `myapp_sport_f1_shoes` WRITE;
/*!40000 ALTER TABLE `myapp_sport_f1_shoes` DISABLE KEYS */;
INSERT INTO `myapp_sport_f1_shoes` VALUES (1,'img/list-1/J4/l1.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',89,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,1),(2,'img/list-1/J4/l2.jpg','邦特 男士低帮系带耐磨休闲潮流板鞋 白灰 81389',899,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,2),(3,'img/list-1/J4/l3.jpg','八哥篮球鞋男子2015新款正品透气耐磨大码鞋战靴高帮休闲运动鞋男',799,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,3),(4,'img/list-1/J4/l4.jpg','新百伦 999玩味轻烧Elite男女低帮系带耐磨复古休闲鞋 黑色 ML999AF',699,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,4),(5,'img/list-1/J4/l5.jpg','八哥篮球鞋男乔4代2015秋冬耐磨aj4正品折扣高帮战靴气垫运动鞋男',599,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,5),(6,'img/list-1/J4/l6.jpg','鸿星尔克 男板鞋/休闲鞋 藏青 11113302126-601',499,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,6),(7,'img/list-1/J4/l7.jpg','roshe run八哥情侣鞋跑步鞋夏季透气男女网面跑鞋休闲运动鞋男女',399,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,7),(8,'img/list-1/J4/l8.jpg','八哥bage男鞋鞋跑步鞋2015秋冬新款运动鞋休闲鞋慢跑鞋旅游鞋子',299,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,8),(9,'img/list-1/J4/l9.jpg','特步 男子低帮系带防滑减震跑步鞋 黑绿 986219113188',199,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,9),(10,'img/list-1/J4/l10.jpg','乔丹 男子低帮系带透气耐磨轻便跑步鞋 黑色/闪亮红 XM2560211',99,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,10),(11,'img/list-1/J4/l11.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',100,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,11),(12,'img/list-1/J4/l12.jpg','邦特 男士低帮系带耐磨休闲潮流板鞋 白灰 81389',110,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,12),(13,'img/list-1/J4/l13.jpg','八哥篮球鞋男子2015新款正品透气耐磨大码鞋战靴高帮休闲运动鞋男',120,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,13),(14,'img/list-1/J4/l14.jpg','新百伦 999玩味轻烧Elite男女低帮系带耐磨复古休闲鞋 黑色 ML999AF',130,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,14),(15,'img/list-1/J4/l15.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',998,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,15),(16,'img/list-1/J4/l16.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',888,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,16),(17,'img/list-1/J4/l17.jpg','邦特 男士低帮系带耐磨休闲潮流板鞋 白灰 81389',120,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,17),(18,'img/list-1/J4/l18.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',69,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,18),(19,'img/list-1/J4/l19.jpg','roshe run八哥情侣鞋跑步鞋夏季透气男女网面跑鞋休闲运动鞋男女',799,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,19),(20,'img/list-1/J4/l20.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',123,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,20),(21,'img/list-1/J4/l21.jpg','邦特 男士低帮系带耐磨休闲潮流板鞋 白灰 81389',89,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,21),(22,'img/list-1/J4/l22.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',866,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,22),(23,'img/list-1/J4/l23.jpg','邦特 男士低帮系带耐磨休闲潮流板鞋 白灰 81389',668,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,23),(24,'img/list-1/J4/l24.jpg','特步 男子低帮系带防滑减震跑步鞋 黑绿 986219113188\n',666,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,24),(25,'img/list-1/J4/l25.jpg','邦特 男士低帮系带耐磨休闲潮流板鞋 白灰 81389',785,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,25),(26,'img/list-1/J4/l26.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',89,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,26),(27,'img/list-1/J4/l27.jpg','roshe run八哥情侣鞋跑步鞋夏季透气男女网面跑鞋休闲运动鞋男女\n',100,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,27),(28,'img/list-1/J4/l28.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',89,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,28),(29,'img/list-1/J4/l29.jpg','邦特 男士低帮系带耐磨休闲潮流板鞋 白灰 81389',79,'img/list-1/J4/i21.jpg','img/list-1/J4/i22.jpg','img/list-1/J4/i23.jpg','img/list-1/J4/i24.jpg','img/list-1/J4/i25.jpg','img/list-1/J4/o1.jpg','img/list-1/J4/o2.jpg','img/list-1/J4/o3.jpg','img/list-1/J4/o4.jpg','img/list-1/J4/o5.jpg','img/list-1/J4/c2.jpg','39',39,29),(30,'img/list-1/J4/l30.jpg','邦特 韩版休闲男士厚底轻便减震系带跑步鞋 深蓝 81289',69,'img/list-1/J4/i11.jpg','img/list-1/J4/i12.jpg','img/list-1/J4/i13.jpg','img/list-1/J4/i14.jpg','img/list-1/J4/i15.jpg','img/list-1/J4/s1.jpg','img/list-1/J4/s2.jpg','img/list-1/J4/s3.jpg','img/list-1/J4/s4.jpg','img/list-1/J4/s5.jpg','img/list-1/J4/c1.jpg','39',39,30);
/*!40000 ALTER TABLE `myapp_sport_f1_shoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myapp_user`
--

DROP TABLE IF EXISTS `myapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `password` varchar(256) NOT NULL,
  `token` varchar(256) NOT NULL,
  `imgRoot` varchar(256) NOT NULL,
  `account` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myapp_user`
--

LOCK TABLES `myapp_user` WRITE;
/*!40000 ALTER TABLE `myapp_user` DISABLE KEYS */;
INSERT INTO `myapp_user` VALUES (8,'111111','b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d','bad43188-4737-3484-91a1-cf58cec98e01','1.jpg','13900000000'),(9,'111111','b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d','3dc2451a-d5af-3b6a-9df8-26858f99ebbe','1.jpg','13900000002'),(10,'AAAAA','27a7e950096f8944110dbd99a141aaa29430051622abe0316aa1827af84a68b10e5e87b6e6781f8605ac354ff67c022672877c6d46eca40ba820a44fd24d5694','d2a4acf7-d2c1-34e6-9df3-5bceb44cbd3c','1.jpg','13900000001'),(12,'12321','802eab6edce7d8a280e905a6d01f7df68180b30b80f28eae896c04a7be7ad1e26355f292a74dc86c6292cbf928558185cb26a63e7d6632e49d18b9685bb7dfd9','b0bfc7ac-e89b-3bdf-8b77-b6b04adf3578','1.jpg','123123123'),(13,'111111','b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d','e2076bd4-dd8d-362e-9285-0cd582364c65','1.jpg','13900000004'),(14,'111111','b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d','0533693e-aece-3dbc-afa9-f527328587e4','1.jpg','13900000005');
/*!40000 ALTER TABLE `myapp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-12 11:09:21
