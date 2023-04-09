-- MySQL dump 10.13  Distrib 5.6.51, for Linux (x86_64)
--
-- Host: prod-chiholee-smartdba-cluster.cluster-cgkgybnzurln.ap-northeast-2.rds.amazonaws.com    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='';

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add product',7,'add_product'),(26,'Can change product',7,'change_product'),(27,'Can delete product',7,'delete_product'),(28,'Can view product',7,'view_product'),(29,'Can add order',8,'add_order'),(30,'Can change order',8,'change_order'),(31,'Can delete order',8,'delete_order'),(32,'Can view order',8,'view_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `last_update_time` datetime(6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'pbkdf2_sha256$260000$PHDOuiOQ88gcUCn0K2wscs$8KGGsXPS+j4g482xCt2cPa4YnFCDRrbqOe16Ce9SN7s=','2023-04-09 06:04:06.286033',1,'admin','','','test@gmail.com',1,1,'2023-04-08 11:19:55.000000','010-7572-2721',41,'남','서울시 영등포구 문래동 모아미래도아파트','2023-04-08 11:22:13.828765','홍길동'),(2,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:24:29.974994',1,'aws','','','aws@gmail.com',1,1,'2023-04-09 03:15:42.000000','010-9999-9999',21,'남','서울시 강남구','2023-04-09 03:23:32.455432','테스트유저'),(4,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-22 06:33:37.000000',0,'gimjieun','지원','홍','jongsugim@example.com',0,1,'2022-04-12 05:04:29.000000','011-582-0469',69,'남','부산광역시 성동구 양재천808거리','2023-04-09 06:26:24.000000','김준영'),(5,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-08 20:38:23.000000',1,'seonghoi','하은','이','hyeonu76@example.org',1,1,'2022-03-24 17:22:15.000000','016-704-3014',59,'남','인천광역시 노원구 논현1로 (상호이마을)','2023-04-08 14:30:53.000000','서정훈'),(6,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-21 11:07:30.000000',1,'gangyeonghyi','성민','김','wi@example.net',0,1,'2021-11-24 15:27:04.000000','031-950-6363',66,'여','제주특별자치도 하남시 선릉0길 (지우윤박마을)','2023-04-09 10:02:00.000000','구민준'),(7,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.412835',0,'bagminji','경자','김','gyeonghyigim@example.com',0,1,'2022-08-30 02:23:46.000000','063-829-4907',39,'남','부산광역시 성동구 논현708가','2023-04-09 03:07:28.000000','김현준'),(8,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-07 07:22:30.000000',1,'ggim','지우','양','seonghyeon12@example.org',1,1,'2021-10-12 00:02:00.000000','042-639-9480',23,'여','대구광역시 구로구 양재천4거리 (성훈심리)','2023-04-08 17:24:03.000000','김성민'),(9,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-24 02:08:04.000000',1,'sujini','종수','김','yujingim@example.com',0,1,'2021-06-12 06:37:16.000000','070-7370-7911',34,'남','전라북도 가평군 봉은사로 (순옥이읍)','2023-04-08 21:01:51.000000','박경숙'),(10,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-17 08:38:34.000000',0,'gyeonghyi90','현숙','신','eunyeong68@example.com',1,1,'2023-02-23 04:00:31.000000','017-631-0341',49,'여','울산광역시 북구 반포대83거리','2023-04-08 20:19:53.000000','안민지'),(11,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-08 00:05:45.000000',1,'seoyejun','민석','이','hongareum@example.net',0,1,'2022-12-31 05:00:37.000000','054-133-5836',34,'남','인천광역시 서구 석촌호수길','2023-04-09 08:20:51.000000','김상철'),(12,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-22 18:01:54.000000',1,'ijongsu','수민','강','igeonu@example.com',0,1,'2022-09-18 15:31:49.000000','062-321-5977',38,'남','세종특별자치시 남구 논현9가','2023-04-09 08:35:12.000000','강서윤'),(13,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-13 12:44:16.000000',1,'seoyun68','주원','권','yeonghogim@example.org',0,1,'2022-07-13 23:53:53.000000','011-169-4466',66,'여','대구광역시 도봉구 잠실62로','2023-04-08 17:08:38.000000','심영길'),(14,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-11 15:18:47.000000',0,'zyang','준혁','안','jseo@example.net',1,1,'2023-02-17 14:24:26.000000','017-217-7328',52,'여','경기도 횡성군 반포대가 (아름김면)','2023-04-08 18:43:56.000000','김준서'),(15,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-08 16:27:12.000000',0,'eunyeongbag','정남','박','jiyeonson@example.com',0,1,'2021-07-11 00:23:26.000000','011-330-5568',36,'남','대전광역시 송파구 압구정로','2023-04-09 01:42:29.000000','이미숙'),(16,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-23 15:38:15.000000',0,'jeongho42','상호','이','iseoyun@example.org',0,1,'2021-12-19 00:47:28.000000','062-552-0004',37,'여','전라북도 안양시 만안구 도산대길 (예원남김리)','2023-04-09 08:28:15.000000','김지혜'),(17,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-07 04:47:15.000000',0,'minjungo','도윤','최','yangjihun@example.org',0,1,'2022-04-11 10:39:52.000000','053-763-1635',66,'남','경기도 수원시 장안구 삼성3로 (정호박손읍)','2023-04-09 05:32:42.000000','박경수'),(18,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-16 08:17:23.000000',1,'ocoe','미영','이','junseoi@example.org',0,1,'2021-04-25 09:07:05.000000','052-835-3710',76,'남','충청북도 논산시 반포대로','2023-04-08 21:04:16.000000','김준영'),(19,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-14 09:08:53.000000',0,'gimgeonu','경수','김','sumin48@example.com',0,1,'2021-10-12 23:11:11.000000','041-891-9314',51,'여','전라북도 고성군 영동대51길 (경자지이읍)','2023-04-09 03:57:37.000000','강혜진'),(20,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-06 19:23:00.000000',0,'seongsugim','숙자','이','jongsu40@example.org',1,1,'2021-09-30 23:57:50.000000','044-327-9208',78,'여','충청남도 포천시 가락405길','2023-04-09 06:44:53.000000','강상호'),(21,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-23 19:52:43.000000',0,'yeongjin27','수빈','이','gimjunho@example.org',1,1,'2023-01-11 05:12:08.000000','042-374-8901',50,'남','세종특별자치시 양천구 선릉거리','2023-04-08 16:48:00.000000','김보람'),(22,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-11 19:26:20.000000',1,'donghyeonbag','영식','김','jieunbag@example.net',0,1,'2022-02-25 09:10:09.000000','017-572-5054',53,'여','충청남도 제천시 압구정032거리','2023-04-08 18:57:32.000000','배미경'),(23,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-25 17:02:54.000000',1,'misugan','지은','문','ogsungim@example.net',0,1,'2022-10-15 21:39:30.000000','070-1006-3214',37,'여','대전광역시 노원구 봉은사96길 (현우홍읍)','2023-04-09 03:36:41.000000','최옥순'),(24,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-14 09:03:49.000000',0,'hyeonsug05','수진','권','bagsiu@example.org',1,1,'2022-06-22 22:05:28.000000','061-321-6638',42,'남','서울특별시 중구 서초중앙로 (유진김리)','2023-04-09 12:28:34.000000','김미정'),(25,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-03 19:44:32.000000',0,'yunseonghyeon','주원','김','ggim@example.org',0,1,'2022-03-17 06:15:27.000000','018-585-2449',45,'남','광주광역시 동대문구 압구정68거리 (정훈황장면)','2023-04-08 20:26:56.000000','김성진'),(26,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-02 05:39:18.000000',0,'yeonghwanbag','서윤','이','jiyeongi@example.com',1,1,'2023-02-02 18:35:47.000000','018-990-1020',41,'여','광주광역시 송파구 강남대8로 (영호양김읍)','2023-04-08 22:46:04.000000','성종수'),(27,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-05 06:46:20.000000',1,'ieungyeong','건우','신','gimyeonghwan@example.net',1,1,'2022-08-20 01:03:48.000000','051-914-4564',78,'남','울산광역시 남구 반포대로 (민재김정읍)','2023-04-09 05:32:25.000000','이예지'),(28,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-04 12:55:27.000000',0,'gimjia','준혁','김','idonghyeon@example.net',1,1,'2023-04-01 22:24:00.000000','053-581-8843',61,'남','전라북도 하남시 서초대6길 (광수조마을)','2023-04-08 18:20:04.000000','황예지'),(29,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-15 19:25:39.000000',0,'jihugim','미숙','김','jongsugim@example.com',1,1,'2022-09-29 06:48:39.000000','010-7253-4105',47,'남','경상북도 안양시 동안구 오금거리','2023-04-09 02:00:09.000000','김정숙'),(30,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-17 12:35:32.000000',0,'jimingang','민준','최','mijeongan@example.com',0,1,'2022-11-11 13:32:05.000000','043-925-8468',74,'여','울산광역시 은평구 역삼15거리 (은경오김리)','2023-04-08 15:36:39.000000','최서영'),(31,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.427240',1,'ci','지원','박','ibag@example.org',0,1,'2022-07-17 11:27:30.000000','061-662-6372',79,'여','부산광역시 양천구 선릉65로','2023-04-09 01:49:28.000000','한준혁'),(32,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-05 05:32:36.000000',1,'jeongsubin','보람','김','fbag@example.org',1,1,'2022-03-26 09:02:44.000000','032-445-1543',61,'여','인천광역시 남구 오금0길','2023-04-08 19:41:58.000000','박순자'),(33,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-25 09:54:37.000000',0,'gangjinho','지후','김','seosunja@example.net',1,1,'2023-02-03 23:37:25.000000','053-047-5378',76,'남','전라남도 청양군 봉은사길','2023-04-08 21:07:45.000000','장민수'),(34,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-16 20:29:34.000000',0,'vgim','영진','백','whwang@example.net',0,1,'2021-11-03 16:41:14.000000','018-662-0254',36,'여','경상남도 남양주시 개포066길 (지혜이김리)','2023-04-09 03:13:06.000000','배경희'),(35,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-07 16:47:07.000000',1,'jeonghun49','도현','양','gimseoyun@example.net',0,1,'2022-11-10 05:34:19.000000','070-6772-0337',19,'남','강원도 당진시 영동대길 (서준이안면)','2023-04-09 08:14:43.000000','이광수'),(36,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.536179',1,'bjin','예진','이','wcoe@example.net',1,1,'2021-09-28 10:30:13.000000','044-997-8429',27,'남','부산광역시 강동구 언주18가','2023-04-09 10:56:37.000000','민윤서'),(37,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-04 14:49:56.000000',0,'sanghobae','지영','박','juweon69@example.net',1,1,'2023-01-27 07:17:20.000000','011-568-6723',68,'여','대구광역시 강서구 논현로','2023-04-09 09:11:24.000000','황영순'),(38,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-16 14:09:23.000000',0,'isubin','성수','박','gimyeeun@example.org',1,1,'2021-06-09 11:53:35.000000','044-323-7026',61,'여','울산광역시 구로구 테헤란9거리 (정희장마을)','2023-04-08 21:07:22.000000','엄도현'),(39,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-14 09:45:54.000000',1,'subin06','예준','신','jaehyeon51@example.net',1,1,'2022-01-27 17:19:52.000000','011-743-9140',72,'남','서울특별시 서초구 강남대35가','2023-04-09 06:54:51.000000','황옥자'),(40,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-10 14:46:14.000000',1,'qgim','옥순','오','areum46@example.com',0,1,'2022-08-25 19:21:35.000000','044-411-1469',64,'여','경기도 청주시 상당구 서초대길 (예진지박동)','2023-04-08 22:22:55.000000','김영수'),(41,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-30 19:49:18.000000',1,'hyeonjungim','상현','장','sunog74@example.org',1,1,'2021-07-07 12:08:01.000000','033-027-3672',21,'여','서울특별시 강서구 논현거리 (예진김권리)','2023-04-08 19:36:31.000000','이영희'),(42,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-08 14:12:46.000000',1,'yeonghomun','미숙','김','minsui@example.org',1,1,'2023-03-12 09:24:52.000000','031-411-2976',55,'남','울산광역시 중구 역삼거리 (병철윤김동)','2023-04-08 13:46:58.000000','이성훈'),(43,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-25 20:37:06.000000',1,'sangceol56','영식','김','zgim@example.com',0,1,'2022-06-09 09:07:08.000000','031-620-3754',61,'여','대전광역시 서초구 백제고분로','2023-04-09 01:51:03.000000','전준서'),(44,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-15 03:02:14.000000',1,'yeongjingim','예지','박','yejii@example.com',1,1,'2023-03-14 03:42:23.000000','054-355-8990',43,'여','충청북도 보은군 선릉25로 (지우윤이면)','2023-04-09 08:38:50.000000','전지훈'),(45,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-24 17:25:09.000000',0,'eunjigang','민준','김','po@example.com',0,1,'2022-06-18 23:11:35.000000','044-286-1205',50,'남','충청북도 오산시 서초대4로 (서윤김동)','2023-04-08 19:11:04.000000','신성훈'),(46,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-12 20:19:35.000000',1,'yujin78','현숙','이','jeongung62@example.net',1,1,'2022-03-30 00:31:34.000000','063-251-8810',72,'남','세종특별자치시 중랑구 백제고분로 (건우송이동)','2023-04-08 14:19:37.000000','김숙자'),(47,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-20 09:19:20.000000',0,'sangho53','영자','허','seonghomun@example.net',1,1,'2023-03-20 19:44:58.000000','053-434-8082',56,'여','울산광역시 관악구 백제고분거리','2023-04-08 17:34:57.000000','박순옥'),(48,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-15 13:39:44.000000',0,'gimyeonghyi','영진','김','seoyeongim@example.org',1,1,'2021-07-26 06:14:36.000000','070-3486-1679',36,'남','서울특별시 양천구 도산대848가','2023-04-08 22:37:44.000000','김성민'),(49,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-26 08:28:41.000000',1,'hayunseo','정훈','곽','yeongjin11@example.net',0,1,'2022-05-08 22:30:13.000000','061-609-3956',53,'여','전라북도 군포시 봉은사거리','2023-04-09 02:58:43.000000','이수빈'),(50,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-29 06:39:48.000000',1,'gyeongsuggim','순자','임','jeongjabag@example.com',0,1,'2021-11-16 21:51:24.000000','055-677-6685',28,'남','대전광역시 서구 삼성로','2023-04-08 13:49:39.000000','최영수'),(51,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-17 08:30:54.000000',1,'hwangseoyeon','은정','박','vbag@example.net',1,1,'2022-04-17 00:03:24.000000','032-594-7900',58,'남','경기도 군포시 개포0가 (지혜김양리)','2023-04-08 21:22:07.000000','이준서'),(52,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-21 22:20:04.000000',1,'li','영호','박','sanghunsim@example.net',1,1,'2021-10-05 09:00:01.000000','070-8340-6596',43,'남','제주특별자치도 화성시 오금거리','2023-04-08 18:53:39.000000','이수진'),(53,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.521990',0,'boram14','현우','심','angeonu@example.net',0,1,'2021-06-26 03:06:50.000000','018-374-0255',26,'남','전라남도 연천군 선릉거리 (정자김이읍)','2023-04-09 12:40:10.000000','김성호'),(54,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-24 13:29:06.000000',0,'gimeunjeong','상훈','김','zgim@example.com',0,1,'2021-07-31 07:31:07.000000','041-808-3610',45,'남','충청남도 고양시 일산서구 삼성5가 (승현김마을)','2023-04-08 15:44:21.000000','김민수'),(55,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-31 18:01:13.000000',0,'seonghyeonhwang','준영','김','jeongunggim@example.com',0,1,'2022-03-27 14:12:09.000000','019-585-0960',68,'여','제주특별자치도 안산시 오금6거리 (우진최진동)','2023-04-08 14:49:07.000000','곽경희'),(56,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.541648',0,'bagseongsu','예준','백','jgim@example.org',1,1,'2021-11-30 13:46:06.000000','064-786-8311',38,'여','전라남도 고양시 덕양구 압구정길 (지우주동)','2023-04-09 09:40:32.000000','박준서'),(57,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-23 03:34:05.000000',1,'vi','현주','김','jia46@example.com',1,1,'2021-12-04 09:07:32.000000','051-159-2896',37,'여','인천광역시 은평구 개포가','2023-04-08 15:30:46.000000','김준호'),(58,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-05 20:19:16.000000',0,'ohwang','하은','박','pheo@example.com',1,1,'2023-01-30 15:52:01.000000','044-832-7026',75,'남','충청북도 태안군 도산대621로','2023-04-09 08:11:54.000000','장명자'),(59,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-31 21:46:08.000000',0,'subin58','상현','박','ogjai@example.com',1,1,'2021-05-04 14:02:30.000000','016-496-6370',48,'남','광주광역시 동작구 선릉거리 (정호박읍)','2023-04-09 09:49:08.000000','김영길'),(60,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-26 22:58:10.000000',1,'minseobaeg','아름','김','yejin93@example.org',0,1,'2023-03-13 08:29:34.000000','054-521-2111',74,'남','전라남도 부천시 오정구 압구정96가','2023-04-08 14:14:53.000000','신건우'),(61,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-30 11:03:01.000000',0,'vcoe','상철','손','ci@example.net',1,1,'2021-10-26 06:49:23.000000','018-131-8452',22,'남','경상북도 청주시 흥덕구 강남대길 (상호홍차읍)','2023-04-09 08:34:47.000000','김민지'),(62,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-20 04:59:06.000000',1,'gimjihun','준서','김','jieun38@example.net',1,1,'2022-04-05 23:26:28.000000','033-690-7010',69,'여','대구광역시 동구 선릉6길','2023-04-09 10:57:15.000000','송지우'),(63,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.393633',1,'acoe','명숙','지','si@example.com',0,1,'2022-10-08 22:34:04.000000','031-865-9126',45,'남','경상남도 강릉시 서초대718가','2023-04-08 20:11:22.000000','김정웅'),(64,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-30 16:57:06.000000',0,'imminjae','영자','이','ygim@example.net',0,1,'2022-07-08 18:00:13.000000','054-687-3574',33,'남','부산광역시 은평구 서초중앙8길 (영일이오리)','2023-04-09 00:19:29.000000','박성현'),(65,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-11 14:20:54.000000',0,'zi','민재','김','minjae48@example.org',1,1,'2022-07-17 20:56:46.000000','061-179-0594',56,'여','경상북도 수원시 석촌호수031길','2023-04-09 02:26:03.000000','오준서'),(66,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-18 05:45:26.000000',0,'ebag','지후','손','xbag@example.org',0,1,'2021-04-26 02:41:43.000000','053-932-1843',33,'남','전라북도 광명시 영동대27가 (성훈김김리)','2023-04-09 00:25:58.000000','최영철'),(67,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-02 06:58:23.000000',0,'mijeongbag','상훈','이','jeongja14@example.org',1,1,'2021-06-20 04:02:44.000000','062-733-0363',30,'여','강원도 고양시 일산동구 양재천거리 (지원양김면)','2023-04-08 23:59:50.000000','강경숙'),(68,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-06 11:02:05.000000',1,'eunjeonggweon','준서','김','gimcunja@example.com',0,1,'2021-07-18 06:56:10.000000','017-181-6085',22,'남','경기도 홍천군 삼성538가','2023-04-08 19:23:58.000000','이현우'),(69,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-05 06:29:36.000000',0,'jeongnaman','영숙','허','yeongja40@example.org',0,1,'2021-11-26 17:10:02.000000','064-714-2318',58,'여','서울특별시 용산구 도산대617길 (지은김김동)','2023-04-08 23:16:21.000000','안미영'),(70,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.425158',1,'bcoe','도현','권','jeongjahong@example.com',0,1,'2022-03-02 10:11:41.000000','063-022-3686',72,'남','대전광역시 중구 삼성706길 (정자신김마을)','2023-04-08 22:45:56.000000','김지원'),(71,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-17 23:08:55.000000',0,'ijiyeon','지원','윤','myeongja29@example.net',0,1,'2022-09-02 23:05:39.000000','041-893-0086',46,'남','광주광역시 광진구 봉은사가','2023-04-09 07:00:52.000000','최지아'),(72,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 03:02:18.000000',0,'gcoe','명자','장','zan@example.net',1,1,'2022-05-14 15:14:24.000000','064-751-5451',72,'남','충청남도 논산시 서초대로','2023-04-08 22:27:08.000000','윤성수'),(73,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-13 21:18:55.000000',1,'gimmigyeong','병철','최','suminbaeg@example.net',1,1,'2021-08-19 07:21:01.000000','055-451-8864',28,'남','충청북도 안산시 상록구 석촌호수길','2023-04-08 13:55:51.000000','이현준'),(75,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-27 01:50:27.000000',0,'cno','은주','안','pgim@example.net',0,1,'2022-08-11 14:13:20.000000','070-7661-3478',21,'남','광주광역시 강서구 백제고분거리 (미영윤면)','2023-04-09 01:15:09.000000','성성민'),(76,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-04 22:18:56.000000',1,'yunseojo','정웅','심','jieungim@example.net',1,1,'2022-11-24 12:09:21.000000','041-952-4232',79,'여','세종특별자치시 구로구 서초대4가','2023-04-08 13:21:10.000000','서서준'),(77,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-28 01:14:32.000000',0,'eunyeonggwag','중수','이','hhwang@example.org',0,1,'2022-04-25 22:20:42.000000','064-742-9335',19,'남','강원도 화성시 개포2가','2023-04-09 12:29:38.000000','이승현'),(78,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-08 14:05:03.000000',0,'ugim','현주','김','bagseoyeon@example.org',0,1,'2022-07-03 11:52:51.000000','043-953-8466',80,'남','부산광역시 송파구 역삼00길','2023-04-09 05:14:21.000000','양현우'),(79,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.400688',1,'areum31','상호','박','ijeongnam@example.com',1,1,'2021-11-19 20:36:29.000000','043-358-6875',75,'남','전라남도 동두천시 서초대길','2023-04-08 18:38:51.000000','김영숙'),(80,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-21 03:32:25.000000',1,'coesunog','수진','이','byeongceol98@example.com',1,1,'2021-05-04 05:58:46.000000','019-383-4890',32,'여','대전광역시 광진구 테헤란8길 (춘자허읍)','2023-04-08 13:06:24.000000','최영환'),(81,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.395837',1,'anminji','하윤','하','seongsu68@example.com',1,1,'2023-03-13 17:51:28.000000','019-683-2063',27,'여','제주특별자치도 계룡시 역삼3거리','2023-04-09 04:56:45.000000','김영희'),(82,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-26 02:28:55.000000',1,'ogo','병철','안','sgim@example.net',0,1,'2022-07-04 19:04:35.000000','053-072-9599',35,'여','경상북도 안성시 강남대087거리 (성현김김리)','2023-04-08 18:09:53.000000','권서준'),(83,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-08 18:59:35.000000',1,'gyeonghyigim','경수','김','namsugja@example.org',0,1,'2022-04-15 06:33:21.000000','010-8071-2243',27,'여','대구광역시 강북구 테헤란700길','2023-04-08 19:45:31.000000','장지현'),(84,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-30 09:26:59.000000',0,'yeongsu18','영순','최','nbag@example.net',0,1,'2021-05-01 15:09:49.000000','032-089-0254',77,'여','울산광역시 은평구 잠실로','2023-04-09 11:15:45.000000','장지은'),(85,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-07 15:57:33.000000',0,'seoyeongim','상철','하','bi@example.com',1,1,'2021-05-12 04:52:03.000000','062-757-3972',28,'여','충청북도 영월군 잠실78길','2023-04-09 02:26:37.000000','김정호'),(86,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-18 07:51:46.000000',1,'jeongsubag','정남','성','junho77@example.org',1,1,'2022-05-25 21:12:26.000000','061-446-4949',53,'여','대전광역시 서구 역삼거리 (예준차김마을)','2023-04-09 04:55:38.000000','조정자'),(87,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-22 01:39:17.000000',1,'mhan','지훈','김','gimjongsu@example.com',1,1,'2021-10-15 16:24:18.000000','031-591-8155',69,'남','경기도 홍성군 테헤란02길','2023-04-08 22:48:30.000000','김윤서'),(88,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-04 10:58:42.000000',1,'mgang','정자','이','yeonghoi@example.com',0,1,'2021-07-18 05:51:44.000000','070-7422-4046',35,'여','광주광역시 노원구 압구정가','2023-04-09 06:59:55.000000','박현숙'),(89,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-31 13:59:22.000000',1,'sanghunbag','경희','양','iyeongsun@example.org',1,1,'2022-10-30 13:33:17.000000','018-774-1477',26,'남','대구광역시 마포구 서초중앙716로','2023-04-09 01:19:37.000000','안은주'),(90,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-16 06:56:30.000000',1,'seongjin88','성훈','최','bagjihye@example.net',0,1,'2022-05-03 22:41:03.000000','010-9337-9512',59,'남','경상북도 삼척시 삼성가 (지혜김민마을)','2023-04-09 12:10:05.000000','권정수'),(91,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-02 20:30:32.000000',0,'igim','서윤','황','junhyeog60@example.com',0,1,'2021-09-06 06:39:13.000000','063-279-6822',34,'여','제주특별자치도 용인시 학동가 (명자김리)','2023-04-08 22:51:37.000000','김성현'),(92,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-19 10:26:19.000000',1,'yeeun72','민지','조','imiyeong@example.org',1,1,'2023-03-30 13:20:13.000000','019-854-0071',77,'남','서울특별시 영등포구 반포대34거리 (미영김리)','2023-04-08 17:42:29.000000','김정남'),(93,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-13 04:11:23.000000',0,'gimyeweon','서영','최','yeongsigjeon@example.com',0,1,'2021-04-09 22:15:08.000000','017-753-9972',61,'남','제주특별자치도 가평군 강남대로 (지혜박나면)','2023-04-09 01:34:32.000000','민정자'),(94,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-03 23:02:38.000000',1,'ogsun78','정남','이','gwangsubag@example.net',0,1,'2021-06-23 02:13:01.000000','051-397-3965',50,'여','충청남도 영월군 반포대72로 (예준김엄마을)','2023-04-08 21:02:02.000000','이승현'),(95,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 07:54:04.000000',1,'sbag','준혁','백','hi@example.com',1,1,'2021-11-07 10:05:41.000000','017-222-9085',67,'남','제주특별자치도 여주시 서초대거리 (정웅김리)','2023-04-09 04:06:34.000000','김명자'),(96,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-13 11:10:55.000000',1,'ieunju','미숙','박','yeonghoyang@example.net',0,1,'2023-01-15 15:20:56.000000','062-106-0293',62,'남','제주특별자치도 용인시 처인구 양재천길','2023-04-08 15:32:52.000000','황서영'),(97,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-11 08:07:23.000000',1,'lan','은정','김','jeongjuweon@example.org',1,1,'2021-05-24 04:43:32.000000','055-996-3997',44,'여','전라남도 단양군 양재천길','2023-04-08 16:42:04.000000','이현정'),(98,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-04-09 06:33:56.520348',1,'bhwang','정자','김','jiyeong96@example.com',1,1,'2022-07-01 10:00:46.000000','064-730-0917',70,'남','경기도 오산시 양재천47거리 (은경김읍)','2023-04-09 09:22:24.000000','이현지'),(99,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-30 14:36:02.000000',1,'yeongsig43','성민','김','zcoe@example.org',0,1,'2022-05-18 21:19:05.000000','070-9662-5162',52,'여','전라남도 동두천시 백제고분201가 (중수남읍)','2023-04-09 05:45:46.000000','김선영'),(100,'pbkdf2_sha256$260000$mexj7X6zszC2iBHFSkaZAS$Yn0sBX2MVaZzrDi5KWH5WONNDb31m3AwGNshJmv4waI=','2023-03-23 10:58:27.000000',0,'gyeongsucoe','수민','박','jieunhong@example.com',0,1,'2022-08-03 09:54:18.000000','019-749-8630',25,'남','충청남도 화천군 논현616거리','2023-04-09 09:24:30.000000','김상훈');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_user_id_group_id_4c1623b6_uniq` (`user_id`,`group_id`),
  KEY `customer_groups_group_id_902232a5_fk_auth_group_id` (`group_id`),
  CONSTRAINT `customer_groups_group_id_902232a5_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `customer_groups_user_id_0ae62faf_fk_customer_id` FOREIGN KEY (`user_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_user_permissions`
--

DROP TABLE IF EXISTS `customer_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_user_permissions_user_id_permission_id_475a7b09_uniq` (`user_id`,`permission_id`),
  KEY `customer_user_permis_permission_id_2c3e834e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `customer_user_permis_permission_id_2c3e834e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `customer_user_permissions_user_id_39b368c8_fk_customer_id` FOREIGN KEY (`user_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_user_permissions`
--

LOCK TABLES `customer_user_permissions` WRITE;
/*!40000 ALTER TABLE `customer_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_customer_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_customer_id` FOREIGN KEY (`user_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-08 11:22:01.985749','1','admin',2,'[{\"changed\": {\"fields\": [\"Name\", \"Phone number\", \"Age\", \"Gender\", \"Address\"]}}]',6,1),(2,'2023-04-08 11:22:13.835122','1','admin',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',6,1),(3,'2023-04-09 03:17:01.805786','2','aws',1,'[{\"added\": {}}]',6,1),(4,'2023-04-09 03:19:26.359786','2','aws',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',6,1),(5,'2023-04-09 03:19:34.830596','2','aws',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',6,1),(6,'2023-04-09 03:23:32.462173','2','aws',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,1),(7,'2023-04-09 03:24:40.377294','3','test',3,'',6,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'order','order'),(7,'order','product'),(6,'order','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-08 11:16:46.545581'),(2,'contenttypes','0002_remove_content_type_name','2023-04-08 11:16:46.655916'),(3,'auth','0001_initial','2023-04-08 11:16:47.144222'),(4,'auth','0002_alter_permission_name_max_length','2023-04-08 11:16:47.312201'),(5,'auth','0003_alter_user_email_max_length','2023-04-08 11:16:47.328579'),(6,'auth','0004_alter_user_username_opts','2023-04-08 11:16:47.337790'),(7,'auth','0005_alter_user_last_login_null','2023-04-08 11:16:47.348962'),(8,'auth','0006_require_contenttypes_0002','2023-04-08 11:16:47.355245'),(9,'auth','0007_alter_validators_add_error_messages','2023-04-08 11:16:47.370380'),(10,'auth','0008_alter_user_username_max_length','2023-04-08 11:16:47.379637'),(11,'auth','0009_alter_user_last_name_max_length','2023-04-08 11:16:47.392828'),(12,'auth','0010_alter_group_name_max_length','2023-04-08 11:16:47.492987'),(13,'auth','0011_update_proxy_permissions','2023-04-08 11:16:47.511430'),(14,'auth','0012_alter_user_first_name_max_length','2023-04-08 11:16:47.524993'),(15,'order','0001_initial','2023-04-08 11:16:48.464465'),(16,'admin','0001_initial','2023-04-08 11:16:48.669881'),(17,'admin','0002_logentry_remove_auto_add','2023-04-08 11:16:48.682611'),(18,'admin','0003_logentry_add_action_flag_choices','2023-04-08 11:16:48.693963'),(19,'sessions','0001_initial','2023-04-08 11:16:48.745236'),(20,'order','0002_auto_20230408_1119','2023-04-08 11:19:44.670535'),(21,'order','0003_user_name','2023-04-08 11:21:22.347363'),(22,'order','0004_auto_20230408_1125','2023-04-08 11:25:51.193203'),(23,'order','0005_alter_order_table','2023-04-08 12:00:24.143264');
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
INSERT INTO `django_session` VALUES ('16jhg18f1e78ka26ux9x6gg2oh5d4wvl','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERWonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4R03VQ:1plOb6:1NKDZBK7lMyZbdhizdRBJQlgKv5x-65YjWHY7YL73Ro','2023-04-23 06:32:20.498963'),('2mr8ishtql7ghhp3ls2przo4rumlh1cg','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERFsTpdwzEz1QHiQ-q9ya51W1dghyKPGiXtxbT63q4fweFehm1QTyn7NBAQE1oASZQCici5Vw0wITO8syOVAatEhi2EEAHzJn0LD5f4IY3VA:1plOb6:7c36W8VnUb2mb17RQWcAlIayP1Y6wSF_PM8JfH_Vz-0','2023-04-23 06:32:20.378866'),('4vf0o71vvej371hjur7awtvex60d8iu6','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERCsXpdwzEz1QHiQ-q9ya51W1dghyKPGiXtxbT63q4fweFehm1QTyn7NBAQE1oASZQCici5Vw0wITO8syOVAatEhi2EEAHzJn0LD5f3rc3UQ:1plObb:IuH49fjuU9LBBLmJMNVP82CDh54zsk33yoMvaAY0S9Y','2023-04-23 06:32:51.270371'),('5hwu4j11xl9uin3wpst0v2s1m1lw3mlk','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHER2ojT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4ug3WA:1plOce:GYYOIsf-dr-yMCQbSXtmjBktIPQyh3vAuh8PleyZuqg','2023-04-23 06:33:56.555034'),('66572xpwjpzk31enluga2t0s0exl1mcy','.eJxVjMsOwiAQRf-FtSEzUl4u3fsNZBhAqoYmpV0Z_92QdKHbe865bxFo32rYe17DnMRFOBSn3zESP3MbJD2o3RfJS9vWOcqhyIN2eVtSfl0P9--gUq-jNojnXDwaiKgJLcAESuFEpLxPBpjQW3bsSRXQKoNhCxF0xFJIO_H5AuG5N1Y:1plObb:i9LRqyES5vS8x9Tx7yO3lfki71fVvATZwPr05bCECxk','2023-04-23 06:32:51.162219'),('67oahukbfdll6hh4357ownnfbpx72d6o','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOHP:Apn3XktA4_IFz5FD0vFAsanL7Q8BS55gCawgkq1ChJI','2023-04-23 06:11:59.120699'),('6j1rzwvfj0ireqqwxv3b950lafbcd73p','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOTV:n3qGKGEPHozpx9IvNg6zWQQBZpb-HJpLppxrt--fBCU','2023-04-23 06:24:29.981212'),('6ow2d53ncsjcwub4q55h9264kqjunqqd','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOb6:nKHUeNsMSO8gs5ET5OIzvk4QDjlPeBZveQNZxrpZplc','2023-04-23 06:32:20.355716'),('72v26mcd1ko285wy75knb3yax7ybhkyq','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERyojT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bQ3Vg:1plOce:SGb8PydEOw5evHayuvdgCwkLcpUFASQG4pWaIcn1YxY','2023-04-23 06:33:56.541324'),('73nf7p6rjxfpu2m37jmm2k663d1qn5id','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOFW:T8eUh8Mj3qFTOqrqng4SkteTCUxPp-zWjQFmb60eOb0','2023-04-23 06:10:02.037186'),('8g43z1fsu689iu8s5iliqzglatmvia7n','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOKp:0zC1cKmz5n8UOX026DSwyV1jvUprU0LegD25_uvucms','2023-04-23 06:15:31.718424'),('8rb98syric3xgsv5djkavujlni4rc8io','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOIf:yT-zdt6eC9nw2Cfr7GYcnq4U79DXW5-r7hguXU6kdi4','2023-04-23 06:13:17.474189'),('9eyhpb7qmmfwbar2y2re1o2vjx13ti21','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOIM:if_xUR2UVqpXuS02xvoMaUe6yoYmOOpbB4WngrEhJKg','2023-04-23 06:12:58.604210'),('9nw2flnhylu3d3ck7kuzh631pt6lvoyw','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOIY:NGUTyX0LWayee5mVPMDmMlBflFNeti6AbGVTjSWnSzo','2023-04-23 06:13:10.228208'),('a1cw0cc7sqfwh2vbc4sgwbnjzxwrgnso','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOce:E2wK_j_yZCeG63Ctxc7U90wNMkU6Z6HKO_tlI3TWsIU','2023-04-23 06:33:56.397987'),('ars94y77ykz2tep5dwxmdvtk6e3vlhhg','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERVpx-t0D8THWA-KB6b5Jb3dYlyKHIg3Z5azG9rof7d1Col1EbxHPKDg0E1IQWYAKlcCJSzkUDTOgsz-xIZdAqgWELAXTAnEnP4vMFvSg3JA:1plOce:EX6fMmfbXcYmHGIDOJl3JG54EUB3e9u6ucKuApHG55U','2023-04-23 06:33:56.418078'),('bc362dv9024oz9lewxdn8vwzreyv8470','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERCsXpdwzEz1QHiQ-q9ya51W1dghyKPGiXtxbT63q4fweFehm1QTyn7NBAQE1oASZQCici5Vw0wITO8syOVAatEhi2EEAHzJn0LD5f3rc3UQ:1plOb6:EvIpmzs9VHHV7r-lPtcT6opUI1vybAng9zn0ZmUUGUw','2023-04-23 06:32:20.498537'),('bf67rmc5jh393h90lhjlf75z4pf9m049','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERWonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4R03VQ:1plOce:Mul0jmIQhY2WS3CWpGhlr4etsUmRa-TYszfTWq8TqEg','2023-04-23 06:33:56.527938'),('bigcksubqn222106ptdabzcnl4h75oj2','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOJO:BE7-nZC9hjNrbfuQzBHFRc8jp8yCGOh-bv7Hm7xVFcE','2023-04-23 06:14:02.837088'),('bkfpsp599u7r9gutzhgr0fa9u87k8bdc','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOTC:RbYqlrBr3teEiU6IwBSjcKz4E01ovPTdQk8StMZATlo','2023-04-23 06:24:10.353861'),('c15703pru56ef6x4wgttkcfavsibzjad','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plONq:2DAq4fNiL_aiPnYA972tmE4TMfW8-6SClX0J0aEOuWk','2023-04-23 06:18:38.881690'),('crlk7i87mrlqitmt50htrlh4moxh2wzm','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plObb:L8aK2sKl5sDWNkuYJqu662TB4t_L3vzOIKN2EtXTYxc','2023-04-23 06:32:51.257155'),('ctaxsmn4l57fifwkfai195occ5ww4ho9','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERVpx-t0D8THWA-KB6b5Jb3dYlyKHIg3Z5azG9rof7d1Col1EbxHPKDg0E1IQWYAKlcCJSzkUDTOgsz-xIZdAqgWELAXTAnEnP4vMFvSg3JA:1plObb:uOJN23B1hQlCZY6ZDNNqsEcFasMfYHUgG-yExdenUVA','2023-04-23 06:32:51.263831'),('d66osukuy6eezobftowhefkrujd0yb4p','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOTW:31T6TTe_JJO-0Eu6Ak0j_3Xzko7St6bYNaiKmVPuRGI','2023-04-23 06:24:30.972751'),('df5v0bh5gv9b1pcbn7r38o4qmoke7j8k','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOSj:A_EefzG0HE-zGBE7D1g3jNbVcVBlWXHPivk3lLOk1Qs','2023-04-23 06:23:41.094940'),('eviadde7rko83d9c1bmph4pi0lsqbtrn','.eJxVjMsOwiAQRf-FtSEzUl4u3fsNZBhAqoYmpV0Z_92QdKHbe865bxFo32rYe17DnMRFeCdOv2MkfuY2SHpQuy-Sl7atc5RDkQft8rak_Loe7t9BpV5HbRDPuXg0EFETWoAJlMKJSHmfDDCht-zYkyqgVQbDFiLoiKWQduLzBeaCN14:1plOb6:Bc6GoDOfw3SbggQSlIiTADdpB7gzbwV4AMyycO9zLVk','2023-04-23 06:32:20.387075'),('fekb9i3wsj2yixwttqj6b8kmbiam6hag','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOIe:0I7fK_CrQllAlM5HySEaZyVH1iM3cGC2T1lF7H3rXVs','2023-04-23 06:13:16.475533'),('ftwsvqi6kp5iebsfei1741bo6bfs23ge','.eJxVjMsOwiAQRf-FtSEzUl4u3fsNZBhAqoYmpV0Z_92QdKHbe865bxFo32rYe17DnMRFOBSn3zESP3MbJD2o3RfJS9vWOcqhyIN2eVtSfl0P9--gUq-jNojnXDwaiKgJLcAESuFEpLxPBpjQW3bsSRXQKoNhCxF0xFJIO_H5AuG5N1Y:1plOb6:H_7xdnDIW04IeY0ur5a6w6Pn7DEhnts60PU5yeWlYDI','2023-04-23 06:32:20.487835'),('fu6sg50xiyrzi337oan72v8fyufkhecs','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHER1onT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-5ec3XQ:1plOce:wXJNHyT-zqiaixmw8PjePoO8HTRDdsVRSHyslG3Ai0Y','2023-04-23 06:33:56.406907'),('gw1sqbfthverhec2kovnrx8tmdryf2du','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHER1onT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-5ec3XQ:1plOb6:ooUfXj2tnzDHQCgvFFKf2aDx0Y1Rr8bsF5eNRZ7Vppo','2023-04-23 06:32:20.365061'),('h4zhuqr1p7mz93yqwsj8p3ni87owde5e','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERyojT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bQ3Vg:1plOb6:9Vu8XhTwHXeYah26CM7tFY6EPJWuayjOZGL2i-JzsVA','2023-04-23 06:32:20.384311'),('h7alng4l6vby72mek9xgrmcfgggh6yms','.eJxVjMsOwiAQRf-FtSEzUl4u3fsNZBhAqoYmpV0Z_92QdKHbe865bxFo32rYe17DnMRFeCdOv2MkfuY2SHpQuy-Sl7atc5RDkQft8rak_Loe7t9BpV5HbRDPuXg0EFETWoAJlMKJSHmfDDCht-zYkyqgVQbDFiLoiKWQduLzBeaCN14:1plOce:WcqkSlA8h1WyJ7L3Y0j6-S-U-VvQymNI0JN7IIh81TU','2023-04-23 06:33:56.527640'),('he6ldukag6bjw6yyggzzkvxxw7aeln9p','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERVpx-t0D8THWA-KB6b5Jb3dYlyKHIg3Z5azG9rof7d1Col1EbxHPKDg0E1IQWYAKlcCJSzkUDTOgsz-xIZdAqgWELAXTAnEnP4vMFvSg3JA:1plOb6:I_E53lZqiexZH6PUzRMFidkQmYukA8fRubtF8ewP5dA','2023-04-23 06:32:20.374201'),('hxo48kvd7ctvy3b80dus990iq9pcief5','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plONr:RRq_uS5D-h3j3V_05f3GSVqrzqM79ViNwDtLYrIZeGs','2023-04-23 06:18:39.871883'),('idtdf1o07106uyu471l9a29etyhjm02k','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERyojT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bQ3Vg:1plObb:k-q2Wfet3WCvagAetG3OfTt2UyBNnYuVV1Xc0OYQOr4','2023-04-23 06:32:51.143202'),('io2m64643pg6brkj5zu9ob9x85xuyfzm','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plNwf:cw6Z0Dnq66ezY9ixLyNX7uqD6zkriNYSTrBgEbaW_Pc','2023-04-23 05:50:33.471535'),('k3rgum3bu49rr7borka5un57bhjahvlq','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHER2ojT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4ug3WA:1plObb:48BmKhIunaLwekFhHb1X2vJ2-o2uSt5CKTN7iSqM0MM','2023-04-23 06:32:51.140787'),('k87nhbo4662gjsew6h9ja2xg3ehtsekj','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plNxg:XEy5iyBZYXEErC2de7L1akxlIMft4MSwPgGYUPWxvLo','2023-04-23 05:51:36.434760'),('kwa3sqksl4x9o2jr5b0mg6p3wajp0xo0','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOIN:cgesttxUcE7YaUDjW5BKEvLHAcNgnv0ZXyMuAtKkfWE','2023-04-23 06:12:59.612344'),('ln1r5fvf9pg0wcqiie4faja8xwzjxxjx','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERFsTpdwzEz1QHiQ-q9ya51W1dghyKPGiXtxbT63q4fweFehm1QTyn7NBAQE1oASZQCici5Vw0wITO8syOVAatEhi2EEAHzJn0LD5f4IY3VA:1plObb:b-A-ggXCB0JCZ2vYvYckPlvfU5hlmNmf8kuqgnX59FE','2023-04-23 06:32:51.138636'),('lv5qwudengo0o0mvu0oynul3h3tmp5g8','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOJN:ZinaZ-GMem9sx1qYGFmrefIcwcamf9pjVnmtf2LJIYY','2023-04-23 06:14:01.840799'),('mdx58hrddm35qkrumcnadm4xy3hxcnoz','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOCs:pwo2mn-W0WLQB8TtIRxNUYERdlVC--DjB-8mQkx16SU','2023-04-23 06:07:18.434607'),('njnodaimn4lf6is4qtfiwmfnpj52ilh5','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plO8p:Q-hdjShK2XAUngeuKHsDGswYrOzNrV4h6dPullu6Z2s','2023-04-23 06:03:07.378887'),('noz71ga8pekw6letzakfit1rv8vc5nv3','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERCsXpdwzEz1QHiQ-q9ya51W1dghyKPGiXtxbT63q4fweFehm1QTyn7NBAQE1oASZQCici5Vw0wITO8syOVAatEhi2EEAHzJn0LD5f3rc3UQ:1plOce:kbFUtTGk-Grw88Nj4EefE5LhMN0giET5AAaSZCGgohs','2023-04-23 06:33:56.435676'),('nt1t55aisscol7in8qr63vqngvbmd8qi','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOFD:zPMahHYbxrH7C5iagiJo5vs_dvUCGKbDooWEfSSph-U','2023-04-23 06:09:43.091588'),('qcg61raufokyvl66amc73l97csnkrrxr','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOHE:zRKowym44nqTGl1ALliGKvK3ZjJ1mAKWcgdy0WPumOE','2023-04-23 06:11:48.669135'),('qjh4nnh7wlbxkn2upbstiaaica5esf12','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOTB:jULt216adPaasK5nFL_glUaREPLhPZx16En6Q6yUHx4','2023-04-23 06:24:09.358490'),('qwnslwoqqzfh2e7lc421l6ac13gxjjzw','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOSi:DSi84BmSkOWwFn6OvK09nLW_SGdsW85y-iHFnz-TZ9A','2023-04-23 06:23:40.101191'),('r9mw6dl2o2di4izlnd1ysbw8tsjnahap','.eJxVjMsOwiAQRf-FtSEzUl4u3fsNZBhAqoYmpV0Z_92QdKHbe865bxFo32rYe17DnMRFeCdOv2MkfuY2SHpQuy-Sl7atc5RDkQft8rak_Loe7t9BpV5HbRDPuXg0EFETWoAJlMKJSHmfDDCht-zYkyqgVQbDFiLoiKWQduLzBeaCN14:1plObb:FwZViNF6VrWVi3g91DcmcHTQIGXfDsVp3x7jLgFIN_0','2023-04-23 06:32:51.270247'),('seitsa54mi1d3ba378xeyyglt7ky6b8x','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERWonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4R03VQ:1plObb:64I2Ff0oCxk_MDRvY7zjuGQpsSKdZRoruVzcJrEZDOQ','2023-04-23 06:32:51.170406'),('sj9rne1141uycu8831tq9hwc65ack7cx','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHER1onT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-5ec3XQ:1plObb:aDkNH-C3_OEe_OOj_aI95DxtBUckm_f0UC0w33DoDkc','2023-04-23 06:32:51.131788'),('ty6rnbg3je3ogx3zc0pdwuev1qo26v6o','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOKo:Q0BdaveZ1bujUm16sycdybc9uQR8w4N5K4oSOAGrXFI','2023-04-23 06:15:30.722371'),('uu91ekuz9wha62byyi15stua6dmwcn2o','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOKT:ehwMBIhiB0_4v460mEpRS4toMA9NA5UK5onYjEelJzM','2023-04-23 06:15:09.242792'),('uv8r87h5b4zc3jofyl3ryx6me90p50h4','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plO66:dOeVu69tJh0pirHMCuqgXxlYsZXRdcY-RrpPMWLggUw','2023-04-23 06:00:18.635695'),('v7lvn3213ouccyz2ddcst5xopnaij3wn','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERRonT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4bc3Vg:1plOHQ:FPRm29lU7UIXuX1T46_w45Tk48l7yZAodgKhjmM8M74','2023-04-23 06:12:00.119209'),('vmhz5xs1kfkcmgupqd7n56qacew8mtdz','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHERFsTpdwzEz1QHiQ-q9ya51W1dghyKPGiXtxbT63q4fweFehm1QTyn7NBAQE1oASZQCici5Vw0wITO8syOVAatEhi2EEAHzJn0LD5f4IY3VA:1plOce:2Hsaia9-yRzWxb9_yzLLuyBeshZeDOrDoyKbVqgTVXw','2023-04-23 06:33:56.429352'),('wzgpfsmkgfrn7x72iyc169mavru72n8h','.eJxVjMsOwiAQRf-FtSEzUl4u3fsNZBhAqoYmpV0Z_92QdKHbe865bxFo32rYe17DnMRFOBSn3zESP3MbJD2o3RfJS9vWOcqhyIN2eVtSfl0P9--gUq-jNojnXDwaiKgJLcAESuFEpLxPBpjQW3bsSRXQKoNhCxF0xFJIO_H5AuG5N1Y:1plOce:JPhTcCVBEEpzyY5WdQca2lc_li25yTlWCYe5o1k_cwI','2023-04-23 06:33:56.402018'),('yc96dzkscb4fa7fgh8f090aaa5r8z8wi','.eJxVjEEOwiAQRe_C2pCZUqC4dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFcxSAuv5snfsbSQXhQuVfJtezb6mVX5EmbnGuIr9vp_h1karnXBnGIyaEBj5rQAoygFI5EyrlggAmd5YkdqQRaRTBswYP2mBLpSXy-uis3Hw:1plOCt:mNsmeY98iBoV9qrNfdOnB2ATO-E3KRggYRRD-OuCOVk','2023-04-23 06:07:19.432048'),('z8yil1r6q2mpzwfn396317ang9ar7cbv','.eJxVjEEOwiAQRe_C2pAZKVBcuvcMZBhAqgaS0q6MdzckXej2v_f-W3jat-L3nla_RHER2ojT7xiIn6kOEh9U701yq9u6BDkUedAuby2m1_Vw_w4K9TJqg3hO2aGBgJrQAkygFE5EyrlogAmd5ZkdqQxaJTBsIYAOmDPpWXy-4ug3WA:1plOb6:imd7AVdWkpdEseBY3MczJy6JU702IeHpLddegSYTR20','2023-04-23 06:32:20.490011');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ord_id` int NOT NULL AUTO_INCREMENT,
  `promo_id` varchar(255) DEFAULT NULL,
  `order_cnt` int NOT NULL,
  `order_price` int NOT NULL,
  `order_dt` varchar(255) NOT NULL,
  `last_update_time` datetime(6) NOT NULL,
  `cust_id` bigint NOT NULL,
  `prd_id` int NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `order_prd_id_f3688dba_fk_product_prd_id` (`prd_id`),
  KEY `order_cust_id_a1158f81_fk_customer_id` (`cust_id`),
  CONSTRAINT `order_cust_id_a1158f81_fk_customer_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `order_prd_id_f3688dba_fk_product_prd_id` FOREIGN KEY (`prd_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'',1,7000,'20230408','2023-04-08 12:02:52.256221',1,6),(2,'',1,4000,'20230408','2023-04-08 12:06:28.528623',1,3),(3,'',4,60000,'20230408','2023-04-08 12:07:17.693547',1,5),(4,'',2,6000,'20230408','2023-04-08 12:10:51.844961',1,1),(5,'',4,32000,'20230408','2023-04-08 12:10:53.745286',1,2),(6,'',2,22000,'20230408','2023-04-08 12:10:56.108406',1,7),(7,'',2,6000,'20230408','2023-04-08 12:17:35.791423',1,1),(8,'',1,3000,'20230408','2023-04-08 12:17:35.974817',1,1),(9,'',4,72000,'20230408','2023-04-08 12:17:40.319758',1,8),(10,'',4,44000,'20230408','2023-04-08 12:17:41.142553',1,7),(11,'',3,24000,'20230409','2023-04-09 03:24:08.426994',2,2),(12,'',1,3000,'20230409','2023-04-09 06:15:30.992542',2,1),(13,'',4,12000,'20230409','2023-04-09 06:15:31.911045',63,1),(14,'',2,6000,'20230409','2023-04-09 06:15:35.862734',2,1),(15,'',1,3000,'20230409','2023-04-09 06:15:36.412324',63,1),(16,'',2,6000,'20230409','2023-04-09 06:15:38.006160',2,1),(17,'',4,12000,'20230409','2023-04-09 06:15:39.611532',63,1),(18,'',2,6000,'20230409','2023-04-09 06:15:42.072321',2,1),(19,'',2,6000,'20230409','2023-04-09 06:15:42.161269',63,1),(20,'',4,12000,'20230409','2023-04-09 06:15:45.761514',63,1),(21,'',3,9000,'20230409','2023-04-09 06:15:45.797460',2,1),(22,'',2,6000,'20230409','2023-04-09 06:15:48.024237',2,1),(23,'',1,3000,'20230409','2023-04-09 06:15:49.149919',63,1),(24,'',3,9000,'20230409','2023-04-09 06:15:50.986673',2,1),(25,'',3,9000,'20230409','2023-04-09 06:15:53.181300',63,1),(26,'',3,9000,'20230409','2023-04-09 06:15:55.965592',2,1),(27,'',1,3000,'20230409','2023-04-09 06:15:57.487493',2,1),(28,'',2,6000,'20230409','2023-04-09 06:15:58.167313',63,1),(29,'',4,12000,'20230409','2023-04-09 06:18:39.131211',2,1),(30,'',1,3000,'20230409','2023-04-09 06:18:40.070289',63,1),(31,'',2,6000,'20230409','2023-04-09 06:18:43.431042',2,1),(32,'',3,9000,'20230409','2023-04-09 06:18:44.958758',63,1),(33,'',1,3000,'20230409','2023-04-09 06:18:46.504233',2,1),(34,'',4,12000,'20230409','2023-04-09 06:18:47.132529',63,1),(35,'',1,3000,'20230409','2023-04-09 06:18:49.539283',63,1),(36,'',1,3000,'20230409','2023-04-09 06:18:50.180625',2,1),(37,'',1,3000,'20230409','2023-04-09 06:18:50.756214',63,1),(38,'',3,9000,'20230409','2023-04-09 06:18:53.679392',2,1),(39,'',2,6000,'20230409','2023-04-09 06:18:55.438531',63,1),(40,'',2,6000,'20230409','2023-04-09 06:18:55.741932',2,1),(41,'',3,9000,'20230409','2023-04-09 06:18:58.057629',2,1),(42,'',3,9000,'20230409','2023-04-09 06:18:58.655493',63,1),(43,'',4,12000,'20230409','2023-04-09 06:19:00.959948',63,1),(44,'',4,12000,'20230409','2023-04-09 06:19:02.188912',2,1),(45,'',3,9000,'20230409','2023-04-09 06:19:03.457834',63,1),(46,'',4,12000,'20230409','2023-04-09 06:19:06.830735',2,1),(47,'',3,9000,'20230409','2023-04-09 06:19:07.445711',63,1),(48,'',3,9000,'20230409','2023-04-09 06:19:09.910879',63,1),(49,'',4,12000,'20230409','2023-04-09 06:19:11.808031',2,1),(50,'',2,6000,'20230409','2023-04-09 06:19:14.532690',63,1),(51,'',1,3000,'20230409','2023-04-09 06:24:49.260117',63,1),(52,'',4,72000,'20230409','2023-04-09 06:24:54.220834',63,9),(53,'',2,8000,'20230409','2023-04-09 06:25:20.105049',2,3),(54,'',3,4800,'20230409','2023-04-09 06:32:20.759836',79,10),(55,'',3,4800,'20230409','2023-04-09 06:33:03.560500',63,10),(56,'',2,22000,'20230409','2023-04-09 06:33:07.973703',81,4),(57,'',4,44000,'20230409','2023-04-09 06:33:08.987981',7,4),(58,'',4,16000,'20230409','2023-04-09 06:33:13.105488',79,3),(59,'',4,32000,'20230409','2023-04-09 06:33:46.088677',2,2),(60,'',4,44000,'20230409','2023-04-09 06:34:01.467055',98,4),(61,'',1,18000,'20230409','2023-04-09 06:34:10.213446',79,9),(62,'',2,16000,'20230409','2023-04-09 06:34:17.438189',36,2),(63,'',3,33000,'20230409','2023-04-09 06:34:20.416066',70,4),(64,'',2,14000,'20230409','2023-04-09 06:34:25.885205',79,6),(65,'',4,28000,'20230409','2023-04-09 06:34:34.732160',31,6),(66,'',4,44000,'20230409','2023-04-09 06:34:38.885146',79,7);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `last_update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'새우튀김','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/06.jpg','분식',3000,'2023-04-07 03:06:17.020331'),(2,'김치','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/01.jpg','반찬',8000,'2023-04-07 03:11:08.706238'),(3,'떡볶이','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/02.jpg','분식',4000,'2023-04-07 03:22:06.514964'),(4,'삼겹살','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/04.jpg','육류',11000,'2023-04-07 14:51:54.891245'),(5,'삼계탕','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/05.jpg','육류',15000,'2023-04-07 14:52:18.753837'),(6,'발효빵','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/03.jpg','빵',7000,'2023-04-07 14:53:03.838920'),(7,'고추전','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/07.jpg','분식',11000,'2023-04-07 14:53:30.601177'),(8,'족발','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/08.jpg','안주',18000,'2023-04-07 14:53:59.291312'),(9,'치킨','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/09.jpg','육류',18000,'2023-04-07 14:54:28.374265'),(10,'핫도그','https://workshop-img.s3.ap-northeast-2.amazonaws.com/img/food/10.jpg','분식',1600,'2023-04-07 14:54:41.590185');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-09 22:44:48
