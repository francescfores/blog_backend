-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: mysql    Database: laravel
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_type_id` bigint unsigned DEFAULT NULL,
  `custom` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `component_component_type_id_foreign` (`component_type_id`),
  CONSTRAINT `component_component_type_id_foreign` FOREIGN KEY (`component_type_id`) REFERENCES `component_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (1,'2024-12-14 21:23:59','2024-12-14 21:23:59','page','desc',1,0),(2,'2024-12-14 21:23:59','2024-12-14 21:23:59','container','desc',2,0),(3,'2024-12-14 21:23:59','2024-12-14 21:23:59','grid','desc',3,0),(4,'2024-12-14 21:23:59','2024-12-14 21:23:59','card','desc',4,0),(5,'2024-12-14 21:23:59','2024-12-14 21:23:59','text','desc',5,0),(6,'2024-12-14 21:23:59','2024-12-14 21:23:59','heading','desc',6,0),(7,'2024-12-14 21:23:59','2024-12-14 21:23:59','image','desc',7,0),(8,'2024-12-14 21:23:59','2024-12-14 21:23:59','button','desc',8,0),(9,'2024-12-14 21:23:59','2024-12-14 21:23:59','icon','desc',9,0),(10,'2024-12-14 21:23:59','2024-12-14 21:23:59','divider','desc',10,0),(11,'2024-12-14 21:23:59','2024-12-14 21:23:59','spacer','desc',11,0),(12,'2024-12-14 21:23:59','2024-12-14 21:23:59','table_contents','desc',12,0),(13,'2024-12-14 21:23:59','2024-12-14 21:24:00','button3d','desc',13,0),(14,'2024-12-14 21:24:00','2024-12-14 21:24:00','codeplayground','codeplayground',14,0),(15,'2024-12-14 21:24:00','2024-12-14 21:24:00','image3d','desc',15,0),(16,'2024-12-14 21:34:54','2024-12-14 21:34:54','page 2','desc',1,0),(17,'2024-12-17 20:09:27','2024-12-17 20:09:27','page','desc',1,0),(18,'2024-12-17 20:21:08','2024-12-17 20:21:08','page','desc',1,0),(19,'2024-12-17 20:57:09','2024-12-17 20:57:09','page','desc',1,0),(21,'2024-12-18 22:30:58','2024-12-18 22:35:52','card 2','desc',4,1);
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_attribute`
--

DROP TABLE IF EXISTS `component_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component_attribute` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `component_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component_attribute_component_id_foreign` (`component_id`),
  CONSTRAINT `component_attribute_component_id_foreign` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_attribute`
--

LOCK TABLES `component_attribute` WRITE;
/*!40000 ALTER TABLE `component_attribute` DISABLE KEYS */;
INSERT INTO `component_attribute` VALUES (1,'2024-12-14 21:23:59','2024-12-14 22:27:27','styles','flex flex-col  bg-bgPrim text-textPrimary w-full min-h-screen  items-center items-center pt-16',1),(2,'2024-12-14 21:23:59','2024-12-14 23:09:49','styles','container w-full min-h-10',2),(3,'2024-12-14 21:23:59','2024-12-14 21:50:12','styles','p-4 grid grid-cols-3 bg-bgSeco gap-2 w-full  items-center  justify-center',3),(4,'2024-12-14 21:23:59','2024-12-17 20:49:50','styles','p-4 rounded bg-bgTern w-full flex flex-col gap-4',4),(5,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','text-textPrimary text-md text-textPrimary whitespace-pre-line',5),(6,'2024-12-14 21:23:59','2024-12-14 21:23:59','text_label','Text',5),(7,'2024-12-14 21:23:59','2024-12-14 21:23:59','anchor','text',5),(8,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','font-semibold text-3xl md:text-4xl xl:text-5xl text-textPrimary',6),(9,'2024-12-14 21:23:59','2024-12-14 21:23:59','text_label','Text',6),(10,'2024-12-14 21:23:59','2024-12-14 21:23:59','anchor','text',6),(11,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','',7),(12,'2024-12-14 21:23:59','2024-12-14 21:23:59','url','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrVLGzO55RQXipmjnUPh09YUtP-BW3ZTUeAA&s',7),(13,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','flex bg-primary px-4 py-2 rounded w-32 justify-center  items-center text-white',8),(14,'2024-12-14 21:23:59','2024-12-14 21:23:59','label','Button',8),(15,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','text-textPrimary fa fa-book',9),(16,'2024-12-14 21:23:59','2024-12-14 21:41:36','styles','flex w-full   fill-bgPrim rotate-0',10),(17,'2024-12-14 21:23:59','2024-12-14 21:43:14','svg','<svg class=\"fill-bgSeco bg-bgPrim\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 1000 100\" >\r\n                <path d=\"M0 0v99.7C62 69 122.4 48.7 205 66c83.8 17.6 160.5 20.4 240-12 54-22 110-26 173-10a392.2 392.2 0 0 0 222-5c55-17 110.3-36.9 160-27.2V0H0Z\" opacity=\".5\"></path>\r\n                <path d=\"M0 0v74.7C62 44 122.4 28.7 205 46c83.8 17.6 160.5 25.4 240-7 54-22 110-21 173-5 76.5 19.4 146.5 23.3 222 0 55-17 110.3-31.9 160-22.2V0H0Z\"></path>\r\n            </svg>',10),(18,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','py-10 w-full',11),(19,'2024-12-14 21:23:59','2024-12-17 21:03:36','styles','flex flex-col col-span-1 flex-wrap md:sticky md:top-[62px]',12),(20,'2024-12-14 21:23:59','2024-12-14 21:23:59','list','title,test 2,item3',12),(21,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','',13),(22,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles_button','btn_secondary',13),(23,'2024-12-14 21:23:59','2024-12-14 21:23:59','label','Button',13),(24,'2024-12-14 21:23:59','2024-12-14 21:23:59','url','Button',13),(25,'2024-12-14 21:23:59','2024-12-14 21:23:59','height','30px',13),(26,'2024-12-14 21:23:59','2024-12-14 21:23:59','width','100px',13),(27,'2024-12-14 21:23:59','2024-12-14 21:23:59','raise','10',13),(28,'2024-12-14 21:23:59','2024-12-14 21:23:59','rounded','10px',13),(29,'2024-12-14 21:23:59','2024-12-14 21:24:00','border','10px',13),(30,'2024-12-14 21:23:59','2024-12-14 21:24:00','border_style','solid #FF4769 4px',13),(31,'2024-12-14 21:23:59','2024-12-14 21:24:00','bg_front_color','#FF1F48',13),(32,'2024-12-14 21:23:59','2024-12-14 21:24:00','bg_shadow_color','rgba(217, 217, 217, 0.35);',13),(33,'2024-12-14 21:23:59','2024-12-14 21:24:00','bg_back_color','#E00029',13),(34,'2024-12-14 21:23:59','2024-12-14 21:24:00','font_color','#fff',13),(35,'2024-12-14 21:23:59','2024-12-14 21:24:00','font_body_weight','400',13),(36,'2024-12-14 21:23:59','2024-12-14 21:24:00','font_size','16px',13),(37,'2024-12-14 21:23:59','2024-12-14 21:24:00','ripple','false',13),(38,'2024-12-14 21:24:00','2024-12-14 21:24:00','styles','w-full',14),(39,'2024-12-14 21:24:00','2024-12-17 20:46:18','html','',14),(40,'2024-12-14 21:24:00','2024-12-17 21:14:31','css','',14),(41,'2024-12-14 21:24:00','2024-12-17 20:46:18','js','',14),(42,'2024-12-14 21:24:00','2024-12-14 21:24:00','height','h-[300px]',14),(43,'2024-12-14 21:24:00','2024-12-14 21:24:00','bg_color_1','bg-[#151528]',14),(44,'2024-12-14 21:24:00','2024-12-14 21:24:00','bg_color_2','bg-[#2A2A50]',14),(45,'2024-12-14 21:24:00','2024-12-14 21:24:00','text_color_1','text-[#d8d6ff]',14),(46,'2024-12-14 21:24:00','2024-12-14 21:24:00','text_color_2','text-[#7e73a2]',14),(47,'2024-12-14 21:24:00','2024-12-14 21:24:00','rounded','rounded-lg',14),(48,'2024-12-14 21:24:00','2024-12-14 21:24:00','show_iframe','true',14),(49,'2024-12-14 21:24:00','2024-12-14 21:24:00','styles','py-10 w-full h-full',15),(50,'2024-12-14 21:24:00','2024-12-14 21:24:00','img_url','https://pngimg.com/uploads/venom/venom_PNG41.png',15),(51,'2024-12-14 21:24:00','2024-12-14 21:24:00','img_bg_url','https://64.media.tumblr.com/47c08a8cea06364a20db6d3137d221eb/7cbec6d1017fc497-c6/s1280x1920/a4959ce4bff4ed4bfe22b899dc21a22cf8a55a6e.png',15),(52,'2024-12-14 21:34:54','2024-12-14 21:50:00','styles','flex flex-col  bg-bgPrim text-textPrimary w-full min-h-screen items-center pt-16',16),(53,'2024-12-17 20:09:27','2024-12-17 20:09:27','styles','flex flex-col  bg-bgPrim text-textPrimary w-full min-h-screen  justify-center items-center items-center pt-16',17),(54,'2024-12-17 20:21:08','2024-12-17 20:21:08','styles','flex flex-col  bg-bgPrim text-textPrimary w-full min-h-screen  justify-center items-center items-center pt-16',18),(55,'2024-12-17 20:57:09','2024-12-17 20:57:09','styles','flex flex-col  bg-bgPrim text-textPrimary w-full min-h-screen  justify-center items-center items-center pt-16',19),(56,'2024-12-18 22:30:58','2024-12-18 22:44:41','styles','flex flex-col w-full p-4 rounded-md bg-bgSeco border-l-4 border-b-4 border-blue-300 p-0 gap-4 flex flex-col relative',21);
/*!40000 ALTER TABLE `component_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_type`
--

DROP TABLE IF EXISTS `component_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_type`
--

LOCK TABLES `component_type` WRITE;
/*!40000 ALTER TABLE `component_type` DISABLE KEYS */;
INSERT INTO `component_type` VALUES (1,'2024-12-14 21:23:59','2024-12-14 21:23:59','page','desc'),(2,'2024-12-14 21:23:59','2024-12-14 21:23:59','container','desc'),(3,'2024-12-14 21:23:59','2024-12-14 21:23:59','grid','desc'),(4,'2024-12-14 21:23:59','2024-12-14 21:23:59','card','desc'),(5,'2024-12-14 21:23:59','2024-12-14 21:23:59','text','desc'),(6,'2024-12-14 21:23:59','2024-12-14 21:23:59','heading','desc'),(7,'2024-12-14 21:23:59','2024-12-14 21:23:59','image','desc'),(8,'2024-12-14 21:23:59','2024-12-14 21:23:59','button','desc'),(9,'2024-12-14 21:23:59','2024-12-14 21:23:59','icon','desc'),(10,'2024-12-14 21:23:59','2024-12-14 21:23:59','divider','desc'),(11,'2024-12-14 21:23:59','2024-12-14 21:23:59','spacer','desc'),(12,'2024-12-14 21:23:59','2024-12-14 21:23:59','table_contents','desc'),(13,'2024-12-14 21:23:59','2024-12-14 21:23:59','button3d','desc'),(14,'2024-12-14 21:24:00','2024-12-14 21:24:00','codeplayground','desc'),(15,'2024-12-14 21:24:00','2024-12-14 21:24:00','image3d','desc');
/*!40000 ALTER TABLE `component_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `component_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_post_id_foreign` (`post_id`),
  KEY `images_component_id_foreign` (`component_id`),
  CONSTRAINT `images_component_id_foreign` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE,
  CONSTRAINT `images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1121,'2014_10_12_000000_create_users_table',1),(1122,'2014_10_12_100000_create_password_reset_tokens_table',1),(1123,'2019_08_19_000000_create_failed_jobs_table',1),(1124,'2019_12_14_000001_create_personal_access_tokens_table',1),(1125,'2022_12_15_003335_create_post_categories_table',1),(1126,'2022_12_15_003336_create_clients_table',1),(1127,'2022_12_15_003336_create_posts_table',1),(1128,'2023_01_24_150536_cretae_post_comments_table',1),(1129,'2023_06_07_224956_create_permission_tables',1),(1130,'2024_01_15_211128_post',1),(1131,'2024_01_15_211129_component_type',1),(1132,'2024_01_15_211130_component',1),(1133,'2024_01_15_211137_post_component',1),(1134,'2024_01_15_211151_component_attribute',1),(1135,'2024_01_15_211152_post_component_attribute',1),(1136,'2024_01_15_211306_subcomponent',1),(1137,'2024_01_15_211308_subcomponent_attribute',1),(1138,'2024_01_15_211309_create_images_table',1),(1139,'2024_01_19_170625_relation_subcomponents',1),(1140,'2024_01_24_000505_add_order_to_subcomponent_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `post_category_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_client_id_foreign` (`client_id`),
  KEY `post_user_id_foreign` (`user_id`),
  KEY `post_post_category_id_foreign` (`post_category_id`),
  CONSTRAINT `post_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_post_category_id_foreign` FOREIGN KEY (`post_category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (2,'2024-12-14 21:34:54','2024-12-18 23:18:05','Qué es Flexbox?','Flexbox con Tailwind CSS','En el desarrollo web, Flexbox es una herramienta fundamental para crear diseos de interfaz responsivos y adaptativos.',156,NULL,1,2),(3,'2024-12-17 20:09:27','2024-12-18 22:04:33','Cómo Centrar un div en CSS','Formas y Buenas Prácticas','Centrar elementos en CSS es una habilidad fundamental para cualquier desarrollador web. Aunque puede parecer sencillo, existen múltiples métodos para lograrlo.',66,NULL,1,2),(4,'2024-12-17 20:21:08','2024-12-18 22:10:43','Cómo Crear un Botón 3D en CSS','Guía Paso a Paso','En este tutorial, vamos a aprender cómo construir un botón 3D en CSS usando clases modulares',91,NULL,1,1),(5,'2024-12-17 20:57:09','2024-12-18 22:51:06','Cosas Básicas de Angular que Debes Conocer','Domina los conceptos esenciales','Angular es un framework de desarrollo front-end de código abierto creado y mantenido por Google.',246,NULL,1,4);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,'2024-12-14 21:23:59','2024-12-14 21:23:59','general','desc','img'),(2,'2024-12-14 21:23:59','2024-12-14 21:23:59','css','desc','img'),(3,'2024-12-14 21:23:59','2024-12-14 21:23:59','javascript','desc','img'),(4,'2024-12-14 21:23:59','2024-12-14 21:23:59','frameworks','desc','img');
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comments`
--

DROP TABLE IF EXISTS `post_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  KEY `post_comments_client_id_foreign` (`client_id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `post_comments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comments`
--

LOCK TABLES `post_comments` WRITE;
/*!40000 ALTER TABLE `post_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_component`
--

DROP TABLE IF EXISTS `post_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_component` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `component_id` bigint unsigned DEFAULT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_component_component_id_foreign` (`component_id`),
  KEY `post_component_post_id_foreign` (`post_id`),
  CONSTRAINT `post_component_component_id_foreign` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_component_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_component`
--

LOCK TABLES `post_component` WRITE;
/*!40000 ALTER TABLE `post_component` DISABLE KEYS */;
INSERT INTO `post_component` VALUES (2,NULL,NULL,16,2),(3,NULL,NULL,17,3),(4,NULL,NULL,18,4),(5,NULL,NULL,19,5);
/*!40000 ALTER TABLE `post_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_component_attribute`
--

DROP TABLE IF EXISTS `post_component_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_component_attribute` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `post_component_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_component_attribute_post_component_id_foreign` (`post_component_id`),
  CONSTRAINT `post_component_attribute_post_component_id_foreign` FOREIGN KEY (`post_component_id`) REFERENCES `post_component` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_component_attribute`
--

LOCK TABLES `post_component_attribute` WRITE;
/*!40000 ALTER TABLE `post_component_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_component_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `post_category_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_client_id_foreign` (`client_id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_post_category_id_foreign` (`post_category_id`),
  CONSTRAINT `posts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_post_category_id_foreign` FOREIGN KEY (`post_category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_subcomponent`
--

DROP TABLE IF EXISTS `relation_subcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_subcomponent` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subcomponent_related_id` bigint unsigned NOT NULL,
  `subcomponent_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relation_subcomponent_subcomponent_related_id_foreign` (`subcomponent_related_id`),
  KEY `relation_subcomponent_subcomponent_id_foreign` (`subcomponent_id`),
  CONSTRAINT `relation_subcomponent_subcomponent_id_foreign` FOREIGN KEY (`subcomponent_id`) REFERENCES `subcomponent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relation_subcomponent_subcomponent_related_id_foreign` FOREIGN KEY (`subcomponent_related_id`) REFERENCES `subcomponent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_subcomponent`
--

LOCK TABLES `relation_subcomponent` WRITE;
/*!40000 ALTER TABLE `relation_subcomponent` DISABLE KEYS */;
INSERT INTO `relation_subcomponent` VALUES (1,2,1,NULL,NULL),(2,3,2,NULL,NULL),(3,4,2,NULL,NULL),(4,5,2,NULL,NULL),(5,7,1,NULL,NULL),(7,15,13,NULL,NULL),(8,16,15,NULL,NULL),(9,17,15,NULL,NULL),(10,18,11,NULL,NULL),(11,19,11,NULL,NULL),(14,23,11,NULL,NULL),(15,24,11,NULL,NULL),(16,25,11,NULL,NULL),(18,27,11,NULL,NULL),(19,28,11,NULL,NULL),(20,29,11,NULL,NULL),(21,30,11,NULL,NULL),(22,31,11,NULL,NULL),(23,32,11,NULL,NULL),(25,34,11,NULL,NULL),(26,35,11,NULL,NULL),(27,36,11,NULL,NULL),(28,40,37,NULL,NULL),(29,41,40,NULL,NULL),(30,42,40,NULL,NULL),(32,44,39,NULL,NULL),(33,45,39,NULL,NULL),(34,46,39,NULL,NULL),(35,47,39,NULL,NULL),(36,48,39,NULL,NULL),(37,49,39,NULL,NULL),(38,50,39,NULL,NULL),(39,51,39,NULL,NULL),(40,52,39,NULL,NULL),(41,53,39,NULL,NULL),(42,54,39,NULL,NULL),(43,55,39,NULL,NULL),(44,56,39,NULL,NULL),(45,57,39,NULL,NULL),(46,61,58,NULL,NULL),(47,62,61,NULL,NULL),(48,63,61,NULL,NULL),(49,64,60,NULL,NULL),(50,65,60,NULL,NULL),(51,66,60,NULL,NULL),(52,67,60,NULL,NULL),(54,69,60,NULL,NULL),(55,70,60,NULL,NULL),(56,71,60,NULL,NULL),(57,72,60,NULL,NULL),(58,73,60,NULL,NULL),(59,74,73,NULL,NULL),(60,75,73,NULL,NULL),(61,76,60,NULL,NULL),(62,77,60,NULL,NULL),(63,78,60,NULL,NULL),(64,79,60,NULL,NULL),(66,81,60,NULL,NULL),(67,82,60,NULL,NULL),(68,83,60,NULL,NULL),(69,84,60,NULL,NULL),(70,85,60,NULL,NULL),(71,86,60,NULL,NULL),(72,90,87,NULL,NULL),(73,91,90,NULL,NULL),(75,93,90,NULL,NULL),(77,95,89,NULL,NULL),(78,96,95,NULL,NULL),(79,97,95,NULL,NULL),(80,98,96,NULL,NULL),(85,103,96,NULL,NULL),(86,104,96,NULL,NULL),(87,105,96,NULL,NULL),(88,106,96,NULL,NULL),(89,107,96,NULL,NULL),(92,110,96,NULL,NULL),(93,111,96,NULL,NULL),(94,112,96,NULL,NULL),(95,113,96,NULL,NULL),(97,115,96,NULL,NULL),(98,116,96,NULL,NULL),(99,117,96,NULL,NULL),(100,118,96,NULL,NULL),(102,120,96,NULL,NULL),(103,121,96,NULL,NULL),(104,122,96,NULL,NULL),(106,124,96,NULL,NULL),(107,125,96,NULL,NULL),(108,126,96,NULL,NULL),(109,127,96,NULL,NULL),(110,128,96,NULL,NULL),(111,129,96,NULL,NULL),(112,130,96,NULL,NULL),(113,131,96,NULL,NULL),(114,132,96,NULL,NULL),(115,133,96,NULL,NULL),(116,134,96,NULL,NULL),(117,135,96,NULL,NULL),(118,136,96,NULL,NULL),(119,137,96,NULL,NULL),(120,138,96,NULL,NULL),(121,139,96,NULL,NULL),(122,140,96,NULL,NULL),(123,141,96,NULL,NULL),(124,142,96,NULL,NULL),(125,143,96,NULL,NULL),(126,144,96,NULL,NULL),(128,146,96,NULL,NULL),(129,147,96,NULL,NULL),(130,148,96,NULL,NULL),(131,149,96,NULL,NULL),(132,150,149,NULL,NULL),(133,151,96,NULL,NULL),(134,154,153,NULL,NULL),(135,157,96,NULL,NULL),(136,158,157,NULL,NULL),(137,159,158,NULL,NULL),(139,161,157,NULL,NULL);
/*!40000 ALTER TABLE `relation_subcomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'superadmin','api','2024-12-14 21:23:59','2024-12-14 21:23:59'),(2,'admin','api','2024-12-14 21:23:59','2024-12-14 21:23:59'),(3,'user','api','2024-12-14 21:23:59','2024-12-14 21:23:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcomponent`
--

DROP TABLE IF EXISTS `subcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcomponent` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `component_child_id` bigint unsigned DEFAULT NULL,
  `component_parent_id` bigint unsigned DEFAULT NULL,
  `subcomponent_id` bigint unsigned DEFAULT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcomponent_component_child_id_foreign` (`component_child_id`),
  KEY `subcomponent_component_parent_id_foreign` (`component_parent_id`),
  CONSTRAINT `subcomponent_component_child_id_foreign` FOREIGN KEY (`component_child_id`) REFERENCES `component` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subcomponent_component_parent_id_foreign` FOREIGN KEY (`component_parent_id`) REFERENCES `component` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcomponent`
--

LOCK TABLES `subcomponent` WRITE;
/*!40000 ALTER TABLE `subcomponent` DISABLE KEYS */;
INSERT INTO `subcomponent` VALUES (1,'2024-12-14 21:23:59','2024-12-14 21:23:59',2,1,NULL,NULL),(2,'2024-12-14 21:23:59','2024-12-14 21:23:59',3,NULL,1,NULL),(3,'2024-12-14 21:23:59','2024-12-14 21:23:59',4,NULL,2,NULL),(4,'2024-12-14 21:23:59','2024-12-14 21:23:59',4,NULL,2,NULL),(5,'2024-12-14 21:23:59','2024-12-14 21:23:59',4,NULL,2,NULL),(6,'2024-12-14 21:23:59','2024-12-14 21:23:59',10,1,NULL,NULL),(7,'2024-12-14 21:23:59','2024-12-14 21:23:59',11,NULL,1,NULL),(9,'2024-12-14 21:35:46','2024-12-14 23:11:42',10,16,NULL,1),(11,'2024-12-14 21:43:32','2024-12-14 23:11:42',2,16,NULL,2),(13,'2024-12-14 21:48:00','2024-12-14 23:11:16',3,16,NULL,0),(15,'2024-12-14 21:48:55','2024-12-14 23:10:25',2,NULL,13,0),(16,'2024-12-14 21:51:19','2024-12-14 23:10:50',6,NULL,15,0),(17,'2024-12-14 21:51:51','2024-12-14 23:10:50',5,NULL,15,1),(18,'2024-12-14 21:54:47','2024-12-14 23:11:46',6,NULL,11,0),(19,'2024-12-14 21:54:56','2024-12-14 23:11:46',5,NULL,11,1),(23,'2024-12-14 23:13:49','2024-12-17 20:02:55',14,NULL,11,2),(24,'2024-12-17 20:00:53','2024-12-17 20:02:55',6,NULL,11,3),(25,'2024-12-17 20:01:33','2024-12-17 20:02:55',5,NULL,11,4),(27,'2024-12-17 20:02:20','2024-12-17 20:02:55',6,NULL,11,5),(28,'2024-12-17 20:02:45','2024-12-17 20:02:57',14,NULL,11,7),(29,'2024-12-17 20:02:51','2024-12-17 20:02:57',5,NULL,11,6),(30,'2024-12-17 20:03:57','2024-12-17 20:03:57',5,NULL,11,9),(31,'2024-12-17 20:03:59','2024-12-17 20:03:59',14,NULL,11,10),(32,'2024-12-17 20:04:00','2024-12-17 20:04:00',5,NULL,11,11),(34,'2024-12-17 20:04:01','2024-12-17 20:04:01',14,NULL,11,13),(35,'2024-12-17 20:05:29','2024-12-17 20:05:29',6,NULL,11,13),(36,'2024-12-17 20:05:31','2024-12-17 20:05:31',5,NULL,11,14),(37,'2024-12-17 20:10:49','2024-12-17 20:10:49',3,17,NULL,1),(38,'2024-12-17 20:10:59','2024-12-17 20:10:59',10,17,NULL,1),(39,'2024-12-17 20:11:03','2024-12-17 20:11:03',2,17,NULL,1),(40,'2024-12-17 20:11:07','2024-12-17 20:11:07',2,NULL,37,1),(41,'2024-12-17 20:13:16','2024-12-17 20:13:16',6,NULL,40,1),(42,'2024-12-17 20:13:20','2024-12-17 20:13:20',5,NULL,40,2),(44,'2024-12-17 20:15:04','2024-12-17 20:15:04',5,NULL,39,2),(45,'2024-12-17 20:15:41','2024-12-17 20:15:41',6,NULL,39,2),(46,'2024-12-17 20:15:45','2024-12-17 20:15:45',5,NULL,39,3),(47,'2024-12-17 20:15:48','2024-12-17 20:15:48',14,NULL,39,4),(48,'2024-12-17 20:16:40','2024-12-17 20:16:40',5,NULL,39,5),(49,'2024-12-17 20:16:43','2024-12-17 20:16:43',6,NULL,39,6),(50,'2024-12-17 20:16:45','2024-12-17 20:16:45',5,NULL,39,7),(51,'2024-12-17 20:16:52','2024-12-17 20:16:52',14,NULL,39,8),(52,'2024-12-17 20:17:07','2024-12-17 20:17:07',5,NULL,39,9),(53,'2024-12-17 20:17:08','2024-12-17 20:17:08',5,NULL,39,10),(54,'2024-12-17 20:17:09','2024-12-17 20:17:09',14,NULL,39,11),(55,'2024-12-17 20:17:18','2024-12-17 20:17:18',5,NULL,39,12),(56,'2024-12-17 20:17:21','2024-12-17 20:17:21',6,NULL,39,13),(57,'2024-12-17 20:17:22','2024-12-17 20:17:22',5,NULL,39,14),(58,'2024-12-17 20:38:52','2024-12-18 21:44:14',3,18,NULL,0),(59,'2024-12-17 20:38:56','2024-12-18 21:50:37',10,18,NULL,1),(60,'2024-12-17 20:39:07','2024-12-18 21:50:37',2,18,NULL,2),(61,'2024-12-17 20:39:55','2024-12-17 20:39:55',2,NULL,58,1),(62,'2024-12-17 20:41:00','2024-12-17 20:41:00',6,NULL,61,1),(63,'2024-12-17 20:41:06','2024-12-17 20:41:06',5,NULL,61,2),(64,'2024-12-17 20:41:55','2024-12-18 21:43:53',5,NULL,60,0),(65,'2024-12-17 20:41:57','2024-12-18 21:43:53',13,NULL,60,1),(66,'2024-12-17 20:42:25','2024-12-18 21:43:53',6,NULL,60,2),(67,'2024-12-17 20:42:27','2024-12-18 21:44:45',5,NULL,60,3),(69,'2024-12-17 20:42:31','2024-12-18 21:44:45',14,NULL,60,4),(70,'2024-12-17 20:45:39','2024-12-18 21:44:42',6,NULL,60,5),(71,'2024-12-17 20:45:41','2024-12-18 21:44:36',14,NULL,60,6),(72,'2024-12-17 20:45:43','2024-12-18 21:44:36',5,NULL,60,7),(73,'2024-12-17 20:48:52','2024-12-18 21:44:36',4,NULL,60,8),(74,'2024-12-17 20:49:19','2024-12-17 20:49:35',5,NULL,73,1),(75,'2024-12-17 20:49:31','2024-12-17 20:49:35',6,NULL,73,0),(76,'2024-12-17 20:51:11','2024-12-18 21:44:36',6,NULL,60,9),(77,'2024-12-17 20:51:12','2024-12-18 21:44:36',5,NULL,60,10),(78,'2024-12-17 20:51:17','2024-12-18 21:44:36',14,NULL,60,11),(79,'2024-12-17 20:52:40','2024-12-18 21:44:36',6,NULL,60,12),(81,'2024-12-17 20:52:41','2024-12-18 21:44:36',5,NULL,60,13),(82,'2024-12-17 20:52:42','2024-12-18 21:44:36',14,NULL,60,14),(83,'2024-12-17 20:53:50','2024-12-18 21:44:36',5,NULL,60,15),(84,'2024-12-17 20:53:53','2024-12-18 21:44:36',14,NULL,60,16),(85,'2024-12-17 20:53:54','2024-12-18 21:44:36',6,NULL,60,17),(86,'2024-12-17 20:54:52','2024-12-18 21:44:36',5,NULL,60,18),(87,'2024-12-17 20:58:37','2024-12-17 20:58:37',3,19,NULL,1),(88,'2024-12-17 20:58:38','2024-12-17 20:58:38',10,19,NULL,1),(89,'2024-12-17 20:58:42','2024-12-17 20:58:42',2,19,NULL,1),(90,'2024-12-17 20:59:27','2024-12-17 20:59:27',2,NULL,87,1),(91,'2024-12-17 21:00:08','2024-12-17 21:00:08',6,NULL,90,1),(93,'2024-12-17 21:00:08','2024-12-17 21:00:08',5,NULL,90,3),(95,'2024-12-17 21:00:49','2024-12-17 21:00:49',3,NULL,89,1),(96,'2024-12-17 21:02:34','2024-12-17 21:02:34',2,NULL,95,1),(97,'2024-12-17 21:02:38','2024-12-17 21:02:38',12,NULL,95,2),(98,'2024-12-17 21:04:56','2024-12-17 21:21:00',6,NULL,96,0),(103,'2024-12-17 21:09:12','2024-12-17 21:21:00',5,NULL,96,1),(104,'2024-12-17 21:10:16','2024-12-17 21:21:00',6,NULL,96,2),(105,'2024-12-17 21:10:19','2024-12-17 21:21:00',5,NULL,96,3),(106,'2024-12-17 21:10:24','2024-12-17 21:21:00',14,NULL,96,4),(107,'2024-12-17 21:11:23','2024-12-17 21:21:00',14,NULL,96,5),(110,'2024-12-17 21:16:57','2024-12-17 21:21:00',6,NULL,96,6),(111,'2024-12-17 21:17:00','2024-12-17 21:21:00',5,NULL,96,7),(112,'2024-12-17 21:17:27','2024-12-17 21:21:00',14,NULL,96,8),(113,'2024-12-17 21:17:52','2024-12-17 21:21:00',6,NULL,96,9),(115,'2024-12-17 21:18:19','2024-12-17 21:21:00',5,NULL,96,10),(116,'2024-12-17 21:18:36','2024-12-17 21:21:00',14,NULL,96,11),(117,'2024-12-17 21:19:02','2024-12-17 21:21:00',6,NULL,96,12),(118,'2024-12-17 21:19:03','2024-12-17 21:21:00',5,NULL,96,13),(120,'2024-12-17 21:19:30','2024-12-17 21:21:00',14,NULL,96,14),(121,'2024-12-17 21:20:10','2024-12-17 21:21:00',5,NULL,96,15),(122,'2024-12-17 21:20:12','2024-12-17 21:21:02',14,NULL,96,17),(124,'2024-12-17 21:21:27','2024-12-17 21:21:27',6,NULL,96,18),(125,'2024-12-17 21:21:49','2024-12-17 21:21:49',5,NULL,96,19),(126,'2024-12-17 21:22:12','2024-12-17 21:22:12',14,NULL,96,20),(127,'2024-12-17 21:22:58','2024-12-17 21:22:58',5,NULL,96,21),(128,'2024-12-17 21:23:00','2024-12-17 21:23:00',14,NULL,96,22),(129,'2024-12-18 19:13:13','2024-12-18 19:13:13',6,NULL,96,23),(130,'2024-12-18 19:13:16','2024-12-18 19:13:16',5,NULL,96,24),(131,'2024-12-18 19:13:22','2024-12-18 19:13:22',14,NULL,96,25),(132,'2024-12-18 19:13:25','2024-12-18 19:13:25',5,NULL,96,26),(133,'2024-12-18 19:13:29','2024-12-18 19:13:29',14,NULL,96,27),(134,'2024-12-18 19:16:09','2024-12-18 19:16:09',14,NULL,96,28),(135,'2024-12-18 19:16:47','2024-12-18 19:16:47',6,NULL,96,29),(136,'2024-12-18 19:16:50','2024-12-18 19:16:50',5,NULL,96,30),(137,'2024-12-18 19:17:52','2024-12-18 19:17:52',14,NULL,96,31),(138,'2024-12-18 19:18:39','2024-12-18 19:18:39',6,NULL,96,32),(139,'2024-12-18 19:18:43','2024-12-18 19:18:43',5,NULL,96,33),(140,'2024-12-18 19:19:49','2024-12-18 19:19:49',14,NULL,96,34),(141,'2024-12-18 19:20:22','2024-12-18 19:20:22',6,NULL,96,35),(142,'2024-12-18 19:20:25','2024-12-18 19:20:25',5,NULL,96,36),(143,'2024-12-18 19:21:35','2024-12-18 19:21:35',14,NULL,96,37),(144,'2024-12-18 19:26:41','2024-12-18 19:26:41',6,NULL,96,38),(146,'2024-12-18 19:27:04','2024-12-18 19:27:04',5,NULL,96,39),(147,'2024-12-18 19:28:23','2024-12-18 19:28:23',6,NULL,96,40),(148,'2024-12-18 19:28:25','2024-12-18 19:28:25',5,NULL,96,41),(149,'2024-12-18 19:40:12','2024-12-18 19:40:12',4,NULL,96,42),(150,'2024-12-18 19:40:20','2024-12-18 19:40:20',5,NULL,149,1),(151,'2024-12-18 19:40:35','2024-12-18 19:40:35',7,NULL,96,43),(152,'2024-12-18 22:27:45','2024-12-18 22:27:45',4,4,NULL,1),(153,'2024-12-18 22:35:04','2024-12-18 22:35:04',2,21,NULL,1),(154,'2024-12-18 22:35:18','2024-12-18 22:35:18',9,NULL,153,1),(155,'2024-12-18 22:35:28','2024-12-18 22:35:28',6,21,NULL,1),(156,'2024-12-18 22:35:31','2024-12-18 22:35:31',5,21,NULL,1),(157,'2024-12-18 22:37:58','2024-12-18 22:37:58',21,NULL,96,44),(158,'2024-12-18 22:37:58','2024-12-18 22:37:58',2,NULL,157,44),(159,'2024-12-18 22:37:59','2024-12-18 22:37:59',9,NULL,158,NULL),(161,'2024-12-18 22:37:59','2024-12-18 22:37:59',5,NULL,157,44);
/*!40000 ALTER TABLE `subcomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcomponent_attribute`
--

DROP TABLE IF EXISTS `subcomponent_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcomponent_attribute` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subcomponent_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcomponent_attribute_subcomponent_id_foreign` (`subcomponent_id`),
  CONSTRAINT `subcomponent_attribute_subcomponent_id_foreign` FOREIGN KEY (`subcomponent_id`) REFERENCES `subcomponent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcomponent_attribute`
--

LOCK TABLES `subcomponent_attribute` WRITE;
/*!40000 ALTER TABLE `subcomponent_attribute` DISABLE KEYS */;
INSERT INTO `subcomponent_attribute` VALUES (3,'2024-12-14 21:50:22','2024-12-14 21:53:21','styles','flex flex-col container w-full min-h-10 mx-auto gap-10 pt-10',15),(4,'2024-12-14 21:51:10','2024-12-14 21:54:34','styles','grid grid-cols-1 bg-bgSeco gap-2 w-full  items-center  justify-center',13),(5,'2024-12-14 21:51:48','2024-12-14 21:51:48','text_label','Flexbox con Tailwind CSS',16),(6,'2024-12-14 21:52:49','2024-12-18 21:56:40','text_label','En el desarrollo web, Flexbox es una herramienta fundamental para crear diseños de interfaz responsivos y adaptativos.',17),(7,'2024-12-14 21:54:52','2024-12-18 21:56:48','text_label','¿Qué es Flexbox?',18),(10,'2024-12-14 23:08:57','2024-12-18 21:56:57','text_label','Flexbox, o \"Flexible Box\", es un módulo de diseño de CSS que se utiliza para crear layouts unidimensionales, tanto vertical como horizontalmente. Esto lo convierte en una excelente opción para alinear elementos de manera dinámica sin tener que usar floats o position.\r\n\r\nAl usar Flexbox en Tailwind, puedes evitar escribir CSS personalizado, ya que Tailwind provee clases que puedes aplicar directamente en tus elementos.\r\n\r\nEjemplo básico de Flexbox en HTML con Tailwind:',19),(11,'2024-12-14 23:09:49','2024-12-17 20:19:53','styles','container w-full min-h-10 gap-10 flex flex-col py-20',11),(12,'2024-12-17 20:00:16','2024-12-17 20:00:16','html','<div class=\"flex justify-center items-center h-screen bg-gray-200\">\r\n  <div class=\"flex flex-col gap-y-4\">\r\n    <div class=\"bg-blue-500 text-white p-4\">Elemento 1</div>\r\n    <div class=\"bg-green-500 text-white p-4\">Elemento 2</div>\r\n    <div class=\"bg-red-500 text-white p-4\">Elemento 3</div>\r\n  </div>\r\n</div>',23),(13,'2024-12-17 20:01:04','2024-12-17 20:01:04','text_label','Clases Flex en Tailwind CSS',24),(14,'2024-12-17 20:01:42','2024-12-18 21:58:54','text_label','- flex: Activa el comportamiento Flexbox en un contenedor.\r\n\r\n- flex-row / flex-col: Define la dirección de los elementos hijos (horizontal o vertical).\r\n\r\n- justify-start, justify-center, justify-end, justify-between, justify-around, justify-evenly: Controla la alineación horizontal de los elementos dentro de un contenedor flex.\r\n\r\n- items-start, items-center, items-end, items-stretch: Controla la alineación vertical de los elementos dentro de un contenedor flex.\r\n\r\n- flex-wrap / flex-nowrap: Define si los elementos deben ocupar varias filas cuando no caben en una sola.\r\n\r\n- gap-x-4, gap-y-4: Añade espacio entre los elementos hijos. Puedes cambiar el valor (4, 2, 8, etc.) según la necesidad.',25),(15,'2024-12-17 20:02:26','2024-12-18 21:59:04','text_label','Ejemplos prácticos de Flexbox con Tailwind',27),(16,'2024-12-17 20:03:05','2024-12-17 20:03:05','text_label','Centrado de un elemento en pantalla',29),(17,'2024-12-17 20:03:33','2024-12-17 20:03:33','html','<div class=\"flex items-center justify-center h-screen bg-gray-200\">\r\n  <div class=\"bg-blue-500 text-white p-10 rounded-lg\">\r\n    Estoy centrado!\r\n  </div>\r\n</div>',28),(18,'2024-12-17 20:04:31','2024-12-18 21:59:14','text_label','Distribución de elementos en una barra de navegación',30),(19,'2024-12-17 20:04:41','2024-12-17 20:04:41','html','<nav class=\"flex justify-between bg-gray-800 text-white p-4\">\r\n  <div class=\"text-lg font-semibold\">Mi Sitio</div>\r\n  <div class=\"flex gap-x-4\">\r\n    <a href=\"#\" class=\"hover:text-gray-300\">Inicio</a>\r\n    <a href=\"#\" class=\"hover:text-gray-300\">Acerca</a>\r\n    <a href=\"#\" class=\"hover:text-gray-300\">Contacto</a>\r\n  </div>\r\n</nav>',31),(20,'2024-12-17 20:04:55','2024-12-17 20:04:55','text_label','Grid de tarjetas responsivas',32),(21,'2024-12-17 20:05:18','2024-12-17 20:05:18','html','<div class=\"flex flex-wrap gap-4 p-4\">\r\n  <div class=\"flex-1 min-w-[250px] bg-blue-200 p-4 rounded-lg\">Tarjeta 1</div>\r\n  <div class=\"flex-1 min-w-[250px] bg-green-200 p-4 rounded-lg\">Tarjeta 2</div>\r\n  <div class=\"flex-1 min-w-[250px] bg-red-200 p-4 rounded-lg\">Tarjeta 3</div>\r\n</div>',34),(22,'2024-12-17 20:06:03','2024-12-18 21:59:37','text_label','Conclusión',35),(23,'2024-12-17 20:06:07','2024-12-18 21:59:29','text_label','Usar Flexbox con Tailwind CSS es una excelente manera de crear interfaces limpias, rápidas y responsivas sin tener que preocuparse demasiado por CSS personalizado. Gracias a sus clases predefinidas, es fácil alinear, distribuir y manipular elementos de forma eficiente, lo que ahorra tiempo y esfuerzo en el desarrollo.',36),(24,'2024-12-17 20:12:08','2024-12-17 20:13:04','styles','grid grid-cols-1 bg-bgSeco gap-2 w-full  items-center  justify-center',37),(25,'2024-12-17 20:13:25','2024-12-18 21:51:04','text_label','Cómo Centrar un div en CSS',41),(26,'2024-12-17 20:13:36','2024-12-18 21:51:11','text_label','Formas y Buenas Prácticas',42),(27,'2024-12-17 20:14:08','2024-12-17 20:14:08','styles','flex flex-col container w-full min-h-10 mx-auto gap-10 pt-10',40),(29,'2024-12-17 20:15:18','2024-12-18 21:51:20','text_label','Centrar elementos en CSS es una habilidad fundamental para cualquier desarrollador web. Aunque puede parecer sencillo, existen múltiples métodos para lograrlo, cada uno con sus ventajas y casos de uso específicos.\r\n\r\nEn este artículo, exploraremos diversas técnicas para centrar un div tanto horizontal como verticalmente utilizando CSS puro, Flexbox, Grid y otras herramientas modernas.',44),(30,'2024-12-17 20:16:15','2024-12-17 20:19:32','styles','container w-full min-h-10 gap-10 flex flex-col py-20',39),(31,'2024-12-17 20:17:41','2024-12-17 20:17:41','text_label','Centrando un div Horizontalmente',45),(32,'2024-12-17 20:17:49','2024-12-18 21:51:30','text_label','Usando margin: auto, este es uno de los métodos más sencillos para centrar un div horizontalmente dentro de su contenedor.',46),(33,'2024-12-17 20:17:58','2024-12-18 21:52:08','text_label','Al establecer margin: 0 auto en el div interno, se distribuyen automáticamente los márgenes izquierdo y derecho, centrando el elemento horizontalmente.',48),(34,'2024-12-17 20:18:07','2024-12-17 20:18:07','text_label','Centrando un div Tanto Horizontal como Verticalmente',49),(35,'2024-12-17 20:18:15','2024-12-18 21:52:17','text_label','Usando Flexbox, es ideal para centrar en ambas direcciones simultáneamente.',50),(36,'2024-12-17 20:18:24','2024-12-17 20:18:24','text_label','justify-content: center y align-items: center centran el elemento en ambas direcciones.',52),(37,'2024-12-17 20:18:30','2024-12-18 21:52:43','text_label','Usando Grid, también permite una fácil alineación en ambas direcciones.',53),(38,'2024-12-17 20:18:40','2024-12-17 20:18:40','text_label','place-items: center centra el contenido tanto horizontal como verticalmente.',55),(39,'2024-12-17 20:18:47','2024-12-18 21:53:03','text_label','Conclusión',56),(40,'2024-12-17 20:18:56','2024-12-18 21:52:56','text_label','Centrar un div en CSS puede lograrse de múltiples maneras, cada una adecuada para diferentes escenarios y necesidades. Desde métodos tradicionales como margin: auto hasta técnicas modernas usando Flexbox y Grid, es esencial entender las ventajas y limitaciones de cada enfoque. Al dominar estas técnicas, podrás crear diseños más limpios, eficientes y responsivos para tus proyectos web.',57),(41,'2024-12-17 20:39:40','2024-12-17 20:39:40','styles','grid grid-cols-1 bg-bgSeco gap-2 w-full  items-center  justify-center',58),(42,'2024-12-17 20:40:22','2024-12-17 20:40:22','styles','flex flex-col container w-full min-h-10 mx-auto gap-10 pt-10',61),(43,'2024-12-17 20:41:15','2024-12-18 22:03:14','text_label','Crear un Botón 3D en CSS',62),(44,'2024-12-17 20:41:24','2024-12-18 22:03:26','text_label','Guía Paso a Paso',63),(45,'2024-12-17 20:41:42','2024-12-17 20:41:42','styles','container w-full min-h-10 gap-10 flex flex-col py-20',60),(46,'2024-12-17 20:42:07','2024-12-18 21:43:15','text_label','En este tutorial, vamos a aprender cómo construir un botón 3D en CSS usando clases modulares. Dividiremos el botón en capas para que cada una tenga su propio propósito y podamos fácilmente aplicar diferentes temas y estilos. Esto te permitirá tener un botón personalizable y reutilizable en tu proyecto.',64),(48,'2024-12-17 20:43:02','2024-12-17 20:43:02','text_label','Estructura del Componente',66),(49,'2024-12-17 20:43:29','2024-12-18 21:43:37','text_label','Para crear un botón 3D, dividiremos el componente en varias partes: la capa principal (front), la capa intermedia (back) y la sombra (shadow). Vamos a utilizar las siguientes clases, cada una de las cuales cumple una función específica:\r\n\r\nCapa sombra: Un nivel de sombra debajo (.btn_shadow).\r\n\r\nCapa trasero: Un fondo adicional detrás del botón (.btn_back).\r\n\r\nCapa frontal: La capa visible y principal del botón (.btn_front).\r\n\r\nPrueba a modificar la elevación para ver una vista explosionada de las capas',67),(51,'2024-12-17 20:44:51','2024-12-17 20:44:51','html','<div class=\"flex flex-col justify-center items-center h-screen\">\r\n  <div class=\"btn btn_primary btn_shadow\" >\r\n    <div class=\"btn_back\">\r\n      <div class=\"btn_front\">\r\n        <p>Button</p>\r\n      </div>\r\n    </div>\r\n  </div>\r\n  <input class=\"mt-auto\" type=\"range\" id=\"button_range\" \r\n         min=\"0\" max=\"80\" value=\"20\" oninput=\"obtenerValor()\">\r\n  <p id=\"valor_actual\">Valor actual: 20</p> \r\n</div>',69),(52,'2024-12-17 20:45:00','2024-12-17 20:45:00','js','var raise=20;\r\n \r\nfunction obtenerValor() {\r\n  // Obtn el elemento input por su ID\r\n  var rangeInput = document.getElementById(\"button_range\");\r\n\r\n  // Obtn el valor actual del input de rango\r\n  var valor = rangeInput.value;\r\n  var btn = document.querySelector(\".btn\");\r\n    var style = btn.style;\r\n  style.setProperty(\'--raise\', valor+\'px\');\r\n  raise=valor;\r\n  // Actualiza el texto para mostrar el valor actual\r\n  document.getElementById(\"valor_actual\").textContent = \"Valor actual: \" + valor;\r\n}',69),(53,'2024-12-17 20:45:18','2024-12-17 20:45:18','css','.btn {\r\n  --font_body_family:Ubuntu;\r\n  --height:50px; \r\n  --width:150px;\r\n  --raise:10px;\r\n  --rounded:5px;\r\n  --rotate:20;\r\n  --rotate_invers:0;\r\n  --border:4px;\r\n  --border_style:solid #004c65 var(--border);\r\n  --bg_front_color:#AAD3EA;\r\n  --bg_front_color_hover:rgba(170,211,234,0.08);\r\n  --bg_shadow_color:#4B4B4B84;\r\n  --bg_back_color:#004c65;\r\n  --font_color:white;\r\n  --font_body_weight:800;\r\n  --font_size:16px;\r\n  height:calc(var(--height) + var(--raise)*2);\r\n  font-family:var(--font_body_family);\r\n  width:calc(var(--width));\r\n  color:var(--font_color);\r\n  font-weight:var(--font_body_weight);\r\n  font-size:var(--font_size);\r\n  position:relative;\r\n}\r\n.btn:active {\r\n  opacity:0.80;\r\n}\r\n.btn_primary {\r\n  --bg_shadow_color:rgba(217,217,217,0.7);\r\n  --bg_front_color:#FF1F48;\r\n  --bg_back_color:#E00029;\r\n  --border_style:solid #FF4769 var(--border);\r\n  --font_color:#fff;\r\n}\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute; \r\n  top:0;\r\n  height:calc(var(--height));\r\n  margin-top:calc(var(--raise)*2);\r\n  width:var(--width);\r\n  background:var(--bg_shadow_color);\r\n  border-radius:var(--rounded);\r\n  border:var(--border) solid transparent;\r\n}\r\n.btn .btn_back:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  top:0;\r\n  height:calc(var(--height));\r\n  margin-top:var(--raise);\r\n  width:var(--width);\r\n  background:var(--bg_back_color);\r\n  border-radius:var(--rounded);\r\n  transition:transform 0.2s ease-out;\r\n  border:var(--border) solid transparent;\r\n}\r\n.btn .btn_front {\r\n  position:absolute;\r\n  height:calc(var(--height));\r\n  width:calc(var(--width));\r\n  top:0;\r\n  background:var(--bg_front_color);\r\n  display:flex;\r\n  align-items:center;\r\n  justify-content:center;\r\n  border-radius:var(--rounded);\r\n  border:var(--border_style);\r\n  transition:transform 0.2s ease-out;\r\n}',69),(54,'2024-12-17 20:45:50','2024-12-18 21:45:20','text_label','Explicación del css',70),(55,'2024-12-17 20:46:04','2024-12-17 20:46:04','css','.btn {\r\n  /*--font_body_family: Ubuntu; ...*/\r\n  height:calc(var(--height) + var(--raise)*2);\r\n  font-family:var(--font_body_family);\r\n  width:calc(var(--width));\r\n  color:var(--font_color);\r\n  font-weight:var(--font_body_weight);\r\n  font-size:var(--font_size);\r\n  position:relative;\r\n}\r\n\r\n.btn_primary {\r\n  --bg_shadow_color:rgba(217,217,217,0.7);\r\n  --bg_front_color:#FF1F48;\r\n  --bg_back_color:#E00029;\r\n  --border_style:solid #FF4769 var(--border);\r\n  --font_color:#fff;\r\n}\r\n\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute; \r\n  top:0;\r\n  height:calc(var(--height));\r\n  margin-top:calc(var(--raise)*2);\r\n  width:var(--width);\r\n  background:var(--bg_shadow_color);\r\n  border-radius:var(--rounded);\r\n  border:var(--border) solid transparent;\r\n}\r\n.btn .btn_back {\r\n  width:var(--width);\r\n}\r\n.btn .btn_back:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  height:calc(var(--height));\r\n  margin-top:var(--raise);\r\n  width:var(--width);\r\n  background:var(--bg_back_color);\r\n  border-radius:var(--rounded);\r\n  border:var(--border) solid transparent;\r\n}\r\n.btn .btn_front {\r\n  position:absolute;\r\n  height:calc(var(--height));\r\n  width:calc(var(--width));\r\n  background:var(--bg_front_color);\r\n  display:flex;\r\n  align-items:center;\r\n  justify-content:center;\r\n  border-radius:var(--rounded);\r\n  border:var(--border_style);\r\n}',71),(56,'2024-12-17 20:46:29','2024-12-17 20:46:29','show_iframe','false',71),(57,'2024-12-17 20:47:20','2024-12-18 21:45:36','text_label','.btn :\r\n\r\n\r\n\r\nDefine variables esenciales como la altura, el ancho y la elevación 3D.\r\n\r\nHeight: calcula la altura combinando la altura base y la elevación (raise) de las capas de sombra y fondo.\r\n\r\nPosition: relative es esencial para el efecto de sombra y profundidad, ya que permite que los elementos hijos con posición absoluta tomen como referencia la capa principal.\r\n\r\n.btn_primary : \r\n\r\n\r\n\r\nPermite aplicar diferentes combinaciones de colores y efectos sin duplicar la estructura principal del botón,\r\n\r\nejemplo: \'.btn_primary\', \'.btn_secondary\', etc.\r\n\r\n.btn_shadow:before\r\n\r\n\r\n\r\nCapa de sombra, al crear la sombra con un pseudo-elemento (:before) y\r\n\r\nposition: absolute, la sombra se puede diseñar, mover y estilizar independientemente del contenido del botón,\r\n\r\nusando un margin-top desplazamos hacia abajo dos veces la elevacion la de la sombra + la capa intermedia.\r\n\r\n.btn_back:before\r\n\r\n\r\n\r\n Capa de intermedia, situada entre la sombra y la capa frontal del botón, \r\n\r\n se comporta de manera similar a la sombra, pero desplazada solo una vez en lugar de dos, usando margin-top.\r\n\r\n.btn_front:\r\n\r\n\r\n\r\nLa capa visible del botón, que está posicionada sobre las demás capas, position: absolute la coloca en la parte superior.\r\n\r\nEl contenido se centra vertical y horizontalmente con display: flex.',72),(58,'2024-12-17 20:49:40','2024-12-18 21:45:55','text_label','¿Por qué se usa content: \" \";?',75),(59,'2024-12-17 20:50:32','2024-12-17 20:50:32','styles','font-semibold text-3xl text-textPrimary',75),(60,'2024-12-17 20:50:45','2024-12-18 21:47:03','text_label','Sin content, los pseudo-elementos ::before o ::after no se renderizan en absoluto. \r\n\r\nAl establecer content: \" \";, aunque el contenido sea vacío, \r\n\r\npermite que el pseudo-elemento se muestre y que los demás estilos (como background, position, y height) se apliquen.',74),(61,'2024-12-17 20:51:23','2024-12-18 21:47:13','text_label','Animaciones Interactivas del Botón',76),(62,'2024-12-17 20:51:37','2024-12-18 21:49:43','text_label','Para conseguir este efecto, dividimos el botón en tres partes: izquierda, centro y derecha. Cuando pasamos el cursor sobre una de las partes del botón, agregamos las clases correspondientes a esa sección. Por ejemplo, al pasar el cursor por la izquierda, añadimos las clases btn_front_left y btn_shadow_left, y eliminamos las otras clases para mantener solo las que corresponden a esa posición.',77),(63,'2024-12-17 20:51:59','2024-12-17 20:51:59','html','<div class=\"flex flex-col flex-wrap justify-center items-center h-screen\">\r\n  <div class=\"btn btn_primary btn_shadow\" >\r\n  <div class=\"btn_back\">\r\n    <div class=\"btn_front\">\r\n      <p>Button</p>\r\n    </div>\r\n  </div>  \r\n</div>\r\n</div>',78),(64,'2024-12-17 20:52:14','2024-12-17 20:52:14','css','.btn {\r\n  --font_body_family:Ubuntu;\r\n  --height:50px;  \r\n  --width:150px;\r\n  --raise:10px;\r\n  --rounded:5px;\r\n  --rotate:20;\r\n  --rotate_invers:0;\r\n  --border:4px;\r\n  --border_style:solid #004c65 var(--border);\r\n  --bg_front_color:#AAD3EA;\r\n  --bg_front_color_hover:rgba(170,211,234,0.08);\r\n  --bg_shadow_color:#4B4B4B84;\r\n  --bg_back_color:#004c65;\r\n  --font_color:white;\r\n  --font_body_weight:800;\r\n  --font_size:16px;\r\n  height:calc(var(--height) + var(--raise)*2);\r\n  font-family:var(--font_body_family);\r\n  width:calc(var(--width));\r\n  color:var(--font_color);\r\n  font-weight:var(--font_body_weight);\r\n  font-size:var(--font_size);\r\n  position:relative;\r\n}\r\n.btn:active {\r\n  opacity:0.80;\r\n}\r\n.btn_primary {\r\n  --bg_shadow_color:rgba(217,217,217,0.7);\r\n  --bg_front_color:#FF1F48;\r\n  --bg_back_color:#E00029;\r\n  --border_style:solid #FF4769 var(--border);\r\n  --font_color:#fff;\r\n}\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute; \r\n  top:0;\r\n  height:calc(var(--height));\r\n  margin-top:calc(var(--raise)*2);\r\n  width:var(--width);\r\n  background:var(--bg_shadow_color);\r\n  border-radius:var(--rounded);\r\n  border:var(--border) solid transparent;\r\n}\r\n.btn .btn_back:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  top:0;\r\n  height:calc(var(--height));\r\n  margin-top:var(--raise);\r\n  width:var(--width);\r\n  background:var(--bg_back_color);\r\n  border-radius:var(--rounded);\r\n  transition:transform 0.2s ease-out;\r\n  border:var(--border) solid transparent;\r\n}\r\n.btn .btn_front {  \r\n  position:absolute;\r\n  height:calc(var(--height));\r\n  width:calc(var(--width));\r\n  top:0;\r\n  background:var(--bg_front_color);\r\n  display:flex;\r\n  align-items:center;\r\n  justify-content:center;\r\n  border-radius:var(--rounded);\r\n  border:var(--border_style);\r\n  transition:transform 0.2s ease-out;\r\n}\r\n/*btn_shadow events*/\r\n.btn_shadow_left:before {\r\n  transition:transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate_invers))) translateY(calc((var(--raise)*0.6) * -1 ));\r\n}\r\n.btn_shadow_right:before {\r\n  transition:transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate))) translateY(calc((var(--raise)*0.6) * -1 ));\r\n}\r\n.btn_shadow_default:before {\r\n  transform:skew(0) translateZ(0);\r\n}\r\n.btn_shadow_default:hover:before {\r\n  transform:translateY(calc((var(--raise) / 2) * -1 ));\r\n}\r\n.btn_shadow_default:active:before {\r\n  transform:translateY(calc((var(--raise)) * -1 ));\r\n}\r\n.btn_shadow_left:active:before {\r\n  transform:translateY(calc((var(--raise)) * -1 ));\r\n}\r\n.btn_shadow_right:active:before {\r\n  transform:translateY(calc((var(--raise)) * -1 ));\r\n}\r\n/*btn_front events*/\r\n  .btn_front_left {\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_front_right {\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n  transition:transform 0.2s ease-out;\r\n}\r\n.btn_front_default {\r\n  transform:skew(0) translateZ(0);\r\n  transition:transform 0.2s ease-out;\r\n}\r\n.btn_front_left:active {\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_right:active {\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_default:hover {\r\n  transform:translateY(calc(var(--raise)/ 2 ));\r\n}\r\n.btn_front_default:active {\r\n  transform:skewY(0) translateY(var(--raise));\r\n}',78),(65,'2024-12-17 20:52:15','2024-12-17 20:52:15','js','var raise=10;\r\nbtn = document.querySelector(\'.btn\');\r\n\r\n  var loading=false;\r\n  var style = btn.style;\r\n  style.setProperty(\'--raise\', raise+\'px\');\r\n  btn.addEventListener(\'mousemove\', event => {\r\n    if(raise>0){\r\n       const width = btn.offsetWidth;\r\n    const height = btn.offsetHeight;\r\n    const rotationDegrees = Math.atan((height * (raise) + raise) / (width )) ;\r\n    const btnWidth = btn.offsetWidth;\r\n    const mouseX = event.clientX - btn.getBoundingClientRect().left;\r\n\r\n    style.setProperty(\'--rotate\', (rotationDegrees));\r\n    style.setProperty(\'--rotate_invers\', (rotationDegrees * -1));\r\n\r\n    this.rotate_Y = -10 * ((mouseX - btnWidth / 2) / (btnWidth / 2));\r\n    if(this.rotate_Y>2){\r\n      btn.classList.remove(\'btn_shadow_default\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_right\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_right\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_left\');\r\n    }\r\n    if(this.rotate_Y>-2 && this.rotate_Y<2){\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_default\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_right\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_default\');\r\n    }\r\n    if(this.rotate_Y<-2){\r\n      console.log(\'right\');\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_default\');\r\n      btn.classList.add(\'btn_shadow_left\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_right\');\r\n    }\r\n   \r\n    }\r\n  });',78),(66,'2024-12-17 20:52:56','2024-12-18 21:47:39','text_label','Animación de Carga del Botón',79),(67,'2024-12-17 20:53:05','2024-12-18 21:49:51','text_label','Para animar la carga del botón, agregaremos un contenedor .btn_loading_wrapp, que se compone de un texto .txt_loading para mostrar el estado de carga, otro texto .txt_loaded para indicar cuando se ha completado, y otro elemento .btn_loading_2 que muestra la progresión.',81),(68,'2024-12-17 20:53:26','2024-12-17 20:53:26','html','<div class=\"flex flex-col flex-wrap overflow-x-hidden  justify-center items-center h-screen\">\r\n<div class=\"btn btn_primary btn_shadow btn_loading\" >\r\n  <div class=\"btn_back\">\r\n    <div class=\"btn_front\">\r\n      <div class=\"btn_loading_wrapp opacity-0\">\r\n        <p class=\"txt_loading\">Loading</p>\r\n        <p class=\"txt_loaded hidden\">succes</p>\r\n      </div>\r\n      <p>Hover</p>\r\n    </div>\r\n  </div> \r\n</div> \r\n</div>',82),(69,'2024-12-17 20:53:26','2024-12-17 20:53:26','css','.btn{\r\n  --font-body-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif;\r\n  --height: 50px;\r\n  --raise: 10px;  \r\n  --rounded: 5px;\r\n  --rotate: 1;\r\n  --rotate_invers: 1 * - 1;\r\n  --border:4px;\r\n  --border_style:solid #004c65 var(--border);\r\n  --bg-front-color: #AAD3EA;\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-back-color: #004c65;\r\n  --font-color: white;\r\n  --font-body-weight:800;\r\n  --width:180px;\r\n}\r\n \r\n.btn_primary{\r\n  --bg-shadow-color: #D9D9D9; \r\n  --bg-front-color: #FF1F48;\r\n  --bg-back-color: #E00029;  \r\n  --border_style:solid #FF4769 var(--border);\r\n  --font-color: #fff;\r\n} \r\n\r\n.btn p{\r\n  font-weight:var(--font-body-weight);\r\n}\r\n.btn_shadow {\r\n  height: calc(var(--height) + var(--raise));\r\n  font-family:var(--font-body-family);\r\n  width:var(--width);\r\n  color:var(--font-color);\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  height: var(--height);\r\n  margin-top: calc(var(--raise) + (var(--raise)/1.2)); \r\n  width:var(--width);\r\n  background: var(--bg-shadow-color);\r\n  border-radius: var(--rounded);\r\n  transition:transform 0.2s ease-out;\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn .btn_back:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  margin-top: var(--raise);\r\n  width:var(--width);\r\n  border: var(--border) solid transparent;\r\n  background: var(--bg-back-color);\r\n  border-radius:var(--rounded);\r\n  transition:transform 0.1s ease-out;\r\n} \r\n.btn .btn_front{\r\n  position: absolute;\r\n  height: var(--height);\r\n  width:var(--width);\r\n  background: var(--bg-front-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  transition:transform 0.1s ease-out;\r\n}\r\n\r\n\r\n/*on mouse move in button zone add classes*/\r\n.btn_shadow_left:before{\r\n  transition: transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_shadow_right:before{\r\n  transition:transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n}\r\n.btn_shadow_default:before{\r\n  transform:skew(0) translateZ(0);\r\n}\r\n\r\n.btn_shadow_default:hover:before{\r\n  transform: translateY(-5px);\r\n}\r\n.btn_shadow_default:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_left:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_right:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n/*btn_front events*/\r\n.btn_front_left{\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_front_right{\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n  transition:transform 0.2s ease-out;\r\n}\r\n.btn_front_default{\r\n  transform:skew(0) translateZ(0);\r\n  transition:transform 0.2s ease-out;\r\n}\r\n\r\n.btn_front_left:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_right:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_default:hover{\r\n  transform: translateY(calc(var(--raise) * 0.5));\r\n\r\n}\r\n.btn_front_default:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n\r\n/*loading*/\r\n.btn_loading_wrapp{\r\n  position: absolute;\r\n  height: var(--height);\r\n   width:var(--width);\r\n\r\n  margin-left:calc(var(--border)*-1);/* padding for borders of parent */\r\n  margin-right:calc(var(--border)*-1);/* padding for borders of parent */\r\n  background: var(--bg-back-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  overflow: hidden;\r\n  z-index:1;\r\n}\r\n\r\n.btn_loading_wrapp:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  width: 0;\r\n  left: 0;\r\n  right: 0;\r\n  background: var(--bg-front-color);\r\n  z-index:-1;\r\n}\r\n\r\n.btn_loading_2:before{\r\n  width:100%;\r\n  transition: width 1s ease-in;\r\n}\r\n \r\n\r\n/*animation text*/\r\n.btn_loading_2 .txt_loading{\r\n  animation: slide-up 0.5s ease-in-out;\r\n    position:absolute\r\n\r\n}\r\n.btn_loading_2 .txt_loaded{\r\n  animation: slide-down 0.5s ease-in-out;\r\n    position:absolute\r\n\r\n}\r\n@keyframes slide-down {\r\n  0% {\r\n    transform: translateY(-150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}\r\n@keyframes slide-up {\r\n  0% {\r\n    transform: translateY(150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}',82),(70,'2024-12-17 20:53:26','2024-12-17 20:53:26','js','var raise=10; \r\nbtn = document.querySelector(\'.btn\');\r\n\r\n  var loading=false;\r\n  var style = btn.style; \r\n  style.setProperty(\'--raise\', raise+\'px\');\r\n  btn.addEventListener(\'mousemove\', event => {\r\n    if(raise>0){\r\n       const width = btn.offsetWidth;\r\n    const height = btn.offsetHeight;\r\n    const rotationDegrees = Math.atan((height * (raise) + raise) / (width )) ;\r\n    const btnWidth = btn.offsetWidth;\r\n    const mouseX = event.clientX - btn.getBoundingClientRect().left;\r\n\r\n    style.setProperty(\'--rotate\', (rotationDegrees));\r\n    style.setProperty(\'--rotate_invers\', (rotationDegrees * -1));\r\n\r\n    this.rotate_Y = -10 * ((mouseX - btnWidth / 2) / (btnWidth / 2));\r\n    if(this.rotate_Y>2){\r\n      btn.classList.remove(\'btn_shadow_default\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_right\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_right\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_left\');\r\n    }\r\n    if(this.rotate_Y>-2 && this.rotate_Y<2){\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_default\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_right\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_default\');\r\n    }\r\n    if(this.rotate_Y<-2){\r\n      console.log(\'right\');\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_default\');\r\n      btn.classList.add(\'btn_shadow_left\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_right\');\r\n    }\r\n   \r\n    }\r\n  });\r\n  btn.addEventListener(\"click\", function() {\r\n    if(!loading){\r\n    const childElement= btn.querySelector(\'.btn_loading_wrapp\');\r\n    childElement.classList.remove(\'opacity-0\');\r\n    childElement.classList.add(\'flex\',\'btn_loading_2\');\r\n    document.querySelector(\'.btn_loading\').style.pointerEvents = \"none\";\r\n    document.querySelector(\'.btn_front\').style.pointerEvents = \"none\";\r\n    document.querySelector(\'.txt_loaded\').classList.add(\'hidden\');\r\n    document.querySelector(\'.txt_loading\').classList.remove(\'hidden\');\r\n    } \r\n  });',82),(71,'2024-12-17 20:54:01','2024-12-18 21:50:05','text_label','Como extra, podemos agregar otra animación de progreso; en este caso, el efecto de agua usando el contenedor bubble, que contiene el agua (water) y el líquido (liquid).',83),(72,'2024-12-17 20:54:32','2024-12-17 20:54:32','html','<div class=\"flex flex-col flex-wrap overflow-x-hidden  justify-center items-center h-screen\">\r\n<div class=\"btn btn_primary btn_shadow btn_loading\" >\r\n  <div class=\"btn_back\">\r\n    <div class=\"btn_front\">\r\n      <div class=\"btn_loading_wrapp opacity-0\">\r\n         <div class=\"bubble\">\r\n          <div id=\"water\" class=\"water\">\r\n            <svg viewBox=\"0 0 560 40\" class=\"water_wave water_wave_back\">\r\n              <path d=\"M140 20C70 20 70 0 0 0V40H560V0C490 0 490 20 420 20C350 20 350 0 280 0C210 0 210 20 140 20Z\" />\r\n            </svg>\r\n            <svg viewBox=\"0 0 560 40\" class=\"water_wave water_wave_front\">\r\n              <path d=\"M140 20C70 20 70 0 0 0V40H560V0C490 0 490 20 420 20C350 20 350 0 280 0C210 0 210 20 140 20Z\" />\r\n            </svg>\r\n\r\n            <div class=\"liquid\"> \r\n            </div> \r\n          </div>\r\n          </div>\r\n        <p class=\"txt_loading\">Loading</p>\r\n        <p class=\"txt_loaded hidden\">succes</p>\r\n      </div>\r\n      <p>Hover</p>\r\n    </div>\r\n  </div> \r\n</div> \r\n</div>',84),(73,'2024-12-17 20:54:32','2024-12-17 20:54:32','css','.btn{\r\n  --font-body-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif;\r\n  --height: 50px;\r\n  --raise: 10px;  \r\n  --rounded: 5px;\r\n  --rotate: 1;\r\n  --rotate_invers: 1 * - 1;\r\n  --border:4px;\r\n  --border_style:solid #004c65 var(--border);\r\n  --bg-front-color: #AAD3EA;\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-back-color: #004c65;\r\n  --font-color: white;\r\n  --font-body-weight:800;\r\n  --width:180px;\r\n}\r\n \r\n.btn_primary{\r\n  --bg-shadow-color: #D9D9D9; \r\n  --bg-front-color: #FF1F48;\r\n  --bg-back-color: #E00029;  \r\n  --border_style:solid #FF4769 var(--border);\r\n  --font-color: #fff;\r\n} \r\n\r\n.btn p{\r\n  font-weight:var(--font-body-weight);\r\n}\r\n.btn_shadow {\r\n  height: calc(var(--height) + var(--raise));\r\n  font-family:var(--font-body-family);\r\n  width:var(--width);\r\n  color:var(--font-color);\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  height: var(--height);\r\n  margin-top: calc(var(--raise) + (var(--raise)/1.2)); \r\n  width:var(--width);\r\n  background: var(--bg-shadow-color);\r\n  border-radius: var(--rounded);\r\n  transition:transform 0.2s ease-out;\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn .btn_back:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  margin-top: var(--raise);\r\n  width:var(--width);\r\n  border: var(--border) solid transparent;\r\n  background: var(--bg-back-color);\r\n  border-radius:var(--rounded);\r\n  transition:transform 0.1s ease-out;\r\n} \r\n.btn .btn_front{\r\n  position: absolute;\r\n  height: var(--height);\r\n  width:var(--width);\r\n  background: var(--bg-front-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  transition:transform 0.1s ease-out;\r\n}\r\n\r\n\r\n/*on mouse move in button zone add classes*/\r\n.btn_shadow_left:before{\r\n  transition: transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_shadow_right:before{\r\n  transition:transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n}\r\n.btn_shadow_default:before{\r\n  transform:skew(0) translateZ(0);\r\n}\r\n\r\n.btn_shadow_default:hover:before{\r\n  transform: translateY(-5px);\r\n}\r\n.btn_shadow_default:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_left:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_right:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n/*btn_front events*/\r\n.btn_front_left{\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_front_right{\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n  transition:transform 0.2s ease-out;\r\n}\r\n.btn_front_default{\r\n  transform:skew(0) translateZ(0);\r\n  transition:transform 0.2s ease-out;\r\n}\r\n\r\n.btn_front_left:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_right:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_default:hover{\r\n  transform: translateY(calc(var(--raise) * 0.5));\r\n\r\n}\r\n.btn_front_default:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n\r\n/*loading*/\r\n.btn_loading_wrapp{\r\n  position: absolute;\r\n  height: var(--height);\r\n   width:var(--width);\r\n\r\n  margin-left:calc(var(--border)*-1);/* padding for borders of parent */\r\n  margin-right:calc(var(--border)*-1);/* padding for borders of parent */\r\n  background: var(--bg-back-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  overflow: hidden;\r\n  z-index:1;\r\n}\r\n\r\n.btn_loading_wrapp:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  width: 0;\r\n  left: 0;\r\n  right: 0;\r\n  background: var(--bg-front-color);\r\n  z-index:-1;\r\n}\r\n\r\n.btn_loading_2:before{\r\n  width:100%;\r\n  transition: width 1s ease-in;\r\n}\r\n \r\n\r\n/*animation text*/\r\n.btn_loading_2 .txt_loading{\r\n  animation: slide-up 0.5s ease-in-out;\r\n    position:absolute\r\n\r\n}\r\n.btn_loading_2 .txt_loaded{\r\n  animation: slide-down 0.5s ease-in-out;\r\n    position:absolute\r\n\r\n}\r\n@keyframes slide-down {\r\n  0% {\r\n    transform: translateY(-150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}\r\n@keyframes slide-up {\r\n  0% {\r\n    transform: translateY(150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}\r\n\r\n/* water*/\r\n.bubble { \r\n/*     --bg-front-color: #95D44A; */\r\n/*   --bg-back-color: #52A934; */\r\n  --bg_front_color:#E00029;\r\n  --bg_back_color:#FF4769; \r\n  width: 100%; \r\n  height: 100%;\r\n  background-color: var(--bg-front-color);\r\n  overflow: hidden;\r\n  transform: translate(0, 0);\r\n/* border-radius:var(--rounded); */\r\n}\r\n.bubble .water {\r\n  position: absolute;\r\n  left: 0;\r\n  top: 0;\r\n  z-index: 2;\r\n  width: 100%;\r\n  height: 100%;\r\n  -webkit-transform: translate(0, 100%);\r\n  transform: translate(0, 100%); \r\n} \r\n.bubble .water_wave_back {\r\n  width:200%;\r\n  left: 0;\r\n  top:0;\r\n  position:relative;\r\n  fill: var(--bg_back_color);\r\n  \r\n  animation: wave-back 0.8s infinite linear;\r\n}\r\n.bubble .water_wave_front {\r\n    margin-top: 8px;\r\n  width:200%;\r\n  left: 0;\r\n  top:0;\r\n  position:absolute;\r\n  fill: var(--bg_front_color);\r\n  animation: wave-front 0.6s infinite linear;\r\n}\r\n\r\n.liquid{\r\n  background:var(--bg_front_color);\r\n  width: 100%;\r\n  height: 120%;\r\n  margin-top:-6px;\r\n  \r\n}\r\n\r\n\r\n@keyframes wave-front {\r\n  100% { \r\n    transform: translate(-50%, 0);\r\n  }\r\n}\r\n@keyframes wave-back {\r\n  100% {\r\n    transform: translate(-50%, 0);\r\n  }\r\n}',84),(74,'2024-12-17 20:54:32','2024-12-17 20:54:32','js','var raise=10; \r\nbtn = document.querySelector(\'.btn\');\r\n\r\n  var loading=false;\r\n  var style = btn.style; \r\n  style.setProperty(\'--raise\', raise+\'px\');\r\n  btn.addEventListener(\'mousemove\', event => {\r\n    if(raise>0){\r\n       const width = btn.offsetWidth;\r\n    const height = btn.offsetHeight;\r\n    const rotationDegrees = Math.atan((height * (raise) + raise) / (width )) ;\r\n    const btnWidth = btn.offsetWidth;\r\n    const mouseX = event.clientX - btn.getBoundingClientRect().left;\r\n\r\n    style.setProperty(\'--rotate\', (rotationDegrees));\r\n    style.setProperty(\'--rotate_invers\', (rotationDegrees * -1));\r\n\r\n    this.rotate_Y = -10 * ((mouseX - btnWidth / 2) / (btnWidth / 2));\r\n    if(this.rotate_Y>2){\r\n      btn.classList.remove(\'btn_shadow_default\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_right\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_right\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_left\');\r\n    }\r\n    if(this.rotate_Y>-2 && this.rotate_Y<2){\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_default\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_right\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_default\');\r\n    }\r\n    if(this.rotate_Y<-2){\r\n      console.log(\'right\');\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_default\');\r\n      btn.classList.add(\'btn_shadow_left\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_right\');\r\n    }\r\n   \r\n    }\r\n  });\r\n  btn.addEventListener(\"click\", function() {\r\n    if(!loading){\r\n      //loading=true;\r\n    console.log(\'eeeeee\')\r\n    const childElement= btn.querySelector(\'.btn_loading_wrapp\');\r\n    childElement.classList.remove(\'opacity-0\');\r\n    childElement.classList.add(\'flex\',\'btn_loading_2\');\r\n    document.querySelector(\'.btn_loading\').style.pointerEvents = \"none\";\r\n    document.querySelector(\'.btn_front\').style.pointerEvents = \"none\";\r\n    //document.querySelector(\'.btn_front\').style.opacity = \"0.8\";\r\n    document.querySelector(\'.txt_loaded\').classList.add(\'hidden\');\r\n    document.querySelector(\'.txt_loading\').classList.remove(\'hidden\');\r\n                /* water effect loading */\r\n    const water = document.querySelector(\".water\");\r\n\r\nlet percent = 0;\r\nlet x = 150;\r\n\r\nconst interval = setInterval(() => { \r\n  percent++;\r\n  water.style.transform = `translate(0, ${100 - percent}%)`;\r\n  if (percent === x) {\r\n    clearInterval(interval);\r\n  }\r\n}, 10);\r\n      \r\n    setTimeout(function() {\r\n        document.querySelector(\'.txt_loaded\').classList.remove(\'hidden\');\r\n    document.querySelector(\'.txt_loading\').classList.add(\'hidden\');\r\n          setTimeout(function() {\r\n     childElement.classList.add(\'opacity-0\');\r\n    childElement.classList.remove(\'flex\',\'btn_loading_2\');\r\n    document.querySelector(\'.btn_loading\').style.pointerEvents = \"auto\";\r\n    document.querySelector(\'.btn_front\').style.pointerEvents = \"auto\";\r\n    //document.querySelector(\'.btn_front\').style.opacity = \"1\";\r\n    }, 1000);\r\n    }, 3000);\r\n    }\r\n  });',84),(75,'2024-12-17 20:54:49','2024-12-18 21:50:13','text_label','Conclusión',85),(76,'2024-12-17 20:55:50','2024-12-18 21:50:22','text_label','Un botón 3D con animaciones agrega interactividad y atractivo, mejorando la experiencia del usuario. Dividirlo en capas crea profundidad, transformando un simple botón en un elemento funcional y llamativo.',86),(77,'2024-12-17 20:59:22','2024-12-17 20:59:22','styles','container w-full min-h-10 gap-10 flex flex-col py-20',89),(78,'2024-12-17 20:59:38','2024-12-17 20:59:38','styles','flex flex-col container w-full min-h-10 mx-auto gap-10 pt-10',90),(79,'2024-12-17 20:59:59','2024-12-17 20:59:59','styles','grid grid-cols-1 bg-bgSeco gap-2 w-full  items-center  justify-center',87),(80,'2024-12-17 21:01:36','2024-12-17 21:11:10','styles','p-2 grid grid-cols-3  gap-8 w-full  items-start  justify-center',95),(81,'2024-12-17 21:03:48','2024-12-17 21:09:58','styles','col-span-2 w-full min-h-10 py-10\r\nw-full  gap-10 flex flex-col',96),(82,'2024-12-17 21:08:44','2024-12-18 21:25:35','text_label','Introducción a Angular',98),(83,'2024-12-17 21:13:13','2024-12-18 21:25:51','text_label','Angular es un framework de desarrollo front-end de código abierto creado y mantenido por Google. Está diseñado para crear aplicaciones web dinámicas, robustas y escalables, especialmente aplicaciones web de estilo Single Page Application (SPA) y Progressive Web App (PWA), utilizando HTML, CSS y TypeScript, un superconjunto de JavaScript que extiende sus capacidades al incluir tipado estático, lo que mejora la seguridad del código y facilita el desarrollo de aplicaciones complejas.',103),(84,'2024-12-17 21:13:22','2024-12-17 21:13:22','text_label','Componentes',104),(85,'2024-12-17 21:13:40','2024-12-18 21:26:06','text_label','¿Qué son y cuál es su función en Angular?\r\n\r\nUn componente es la unidad básica de construcción de una interfaz en Angular. Representa una parte de la aplicación, como un encabezado, un formulario o una lista. Cada componente tiene una lógica asociada (TypeScript) y una vista (HTML y CSS) que define cómo se presenta en la interfaz.\r\n\r\nEjemplo de un componente simple:',105),(86,'2024-12-17 21:13:56','2024-12-17 21:13:56','js','import { Component } from \'@angular/core\';\r\n\r\n@Component({\r\n  selector: \'app-mi-componente\',\r\n  templateUrl: \'./mi-componente.component.html\',\r\n  styleUrls: [\'./mi-componente.component.css\']\r\n})\r\nexport class MiComponenteComponent {\r\n  mensaje = \"Hola, Angular!\";\r\n}',106),(87,'2024-12-17 21:13:56','2024-12-17 21:14:31','show_iframe','false',106),(88,'2024-12-17 21:15:03','2024-12-17 21:15:03','html','<h1>{{ mensaje }}</h1>',107),(89,'2024-12-17 21:15:03','2024-12-17 21:15:03','show_iframe','false',107),(90,'2024-12-17 21:15:44','2024-12-18 19:22:53','height','h-10',107),(91,'2024-12-17 21:15:50','2024-12-18 19:22:23','height','h-[200px]',106),(93,'2024-12-17 21:17:09','2024-12-18 21:26:20','text_label','Módulos',110),(94,'2024-12-17 21:17:14','2024-12-18 21:30:00','text_label','El rol de los módulos en la organización del proyecto\r\n\r\nUn módulo agrupa componentes, directivas, servicios y otras partes relacionadas de una aplicación Angular. Facilitan la organización del código, el mantenimiento y la carga de funcionalidades específicas solo cuando son necesarias (carga diferida o lazy loading).\r\n\r\nCada aplicación Angular tiene al menos un módulo principal, el AppModule, que es el punto de entrada de la aplicación. Además, puedes crear módulos adicionales para organizar funcionalidades específicas.\r\n\r\nEl decorador @NgModule se utiliza para declarar un módulo. Ejemplo:',111),(95,'2024-12-17 21:17:36','2024-12-18 21:30:27','js','@NgModule({\r\n  declarations: [EjemploComponent], // Componentes, directivas, pipes\r\n  imports: [BrowserModule],         // Módulos externos\r\n  providers: [],                    // Servicios\r\n  bootstrap: [AppComponent]         // Componente raíz\r\n})\r\nexport class AppModule { }',112),(96,'2024-12-17 21:17:36','2024-12-17 21:17:36','show_iframe','false',112),(97,'2024-12-17 21:17:42','2024-12-18 19:23:09','height','h-[200px]',112),(98,'2024-12-17 21:17:57','2024-12-17 21:17:57','text_label','Data Binding',113),(99,'2024-12-17 21:18:25','2024-12-18 21:31:05','text_label','Tipos de Data Binding\r\n\r\nEl data binding en Angular conecta la lógica de la aplicación (modelo de datos) con su representación visual (vista). Se clasifica en:\r\n\r\nUnidireccional (Interpolación): Permite mostrar datos en la vista.\r\n\r\nProperty Binding: Vincula atributos de elementos HTML a propiedades del componente.\r\n\r\nEvent Binding: Vincula eventos de usuario (clics, entradas de texto) a métodos del componente.\r\n\r\nBidireccional (Two-Way Binding): Sincroniza datos entre la vista y el modelo en ambos sentidos.',115),(100,'2024-12-17 21:18:43','2024-12-18 21:31:26','html','<!--Interpolación:-->\r\n<p>{{ mensaje }}</p>\r\n\r\n<!--Property Binding:-->\r\n<input [value]=\"valor\">\r\n\r\n<!--Event Binding:-->\r\n<button (click)=\"accion()\">Click</button>\r\n\r\n<!--Two-Way Binding (con [(ngModel)]):-->\r\n<input [(ngModel)]=\"nombre\">',116),(101,'2024-12-17 21:18:43','2024-12-17 21:18:44','show_iframe','false',116),(102,'2024-12-17 21:18:50','2024-12-18 19:23:17','height','h-[200px]',116),(103,'2024-12-17 21:19:10','2024-12-17 21:19:10','text_label','Directivas',117),(104,'2024-12-17 21:19:18','2024-12-18 21:32:33','text_label','Directivas estructurales\r\n\r\nLas directivas estructurales alteran el DOM al agregar o eliminar elementos.\r\n\r\n*ngIf: Renderiza un elemento basado en una condición.\r\n\r\n*ngFor: Itera sobre una colección para crear elementos.',118),(105,'2024-12-17 21:19:51','2024-12-17 21:19:51','html','<p *ngIf=\"mostrar\">Este texto aparece si mostrar es verdadero.</p>\r\n\r\n<li *ngFor=\"let item of lista\">{{ item }}</li>',120),(106,'2024-12-17 21:19:51','2024-12-17 21:19:51','show_iframe','false',120),(107,'2024-12-17 21:19:57','2024-12-18 19:23:26','height','h-24',120),(108,'2024-12-17 21:20:19','2024-12-18 21:33:23','text_label','Directivas de atributo\r\n\r\nModifican la apariencia o comportamiento de un elemento existente.\r\n\r\n\r\n ngClass: Aplica clases dinámicamente.\r\n\r\n ngStyle: Aplica estilos dinámicos.\r\n\r\nngClass: Aplica clases dinmicamente.\r\n\r\nngStyle: Aplica estilos dinmicos.',121),(109,'2024-12-17 21:20:40','2024-12-18 21:33:38','html','<p [ngClass]=\"{ \'activo\': estado }\">Texto con clase dinámica.</p>\r\n\r\n<p [ngStyle]=\"{ color: colorVariable }\">Texto con estilo dinámico.</p>',122),(110,'2024-12-17 21:20:40','2024-12-17 21:20:40','show_iframe','false',122),(111,'2024-12-17 21:20:50','2024-12-18 19:23:34','height','h-24',122),(112,'2024-12-17 21:21:38','2024-12-17 21:21:38','text_label','Servicios',124),(113,'2024-12-17 21:21:56','2024-12-18 21:34:33','text_label','Uso de servicios para lógica compartida\r\n\r\nLos servicios son clases especializadas que encapsulan lógica de negocio, manejo de datos o interacciones con APIs externas. Permiten separar las responsabilidades del componente, lo que mejora la organización y facilita la reutilización de código.\r\n\r\nAngular utiliza un sistema de inyección de dependencias (DI) para gestionar la creación y la provisión de servicios. Este sistema asegura que los componentes reciban solo las instancias de servicios que necesitan, reduciendo el acoplamiento entre módulos.',125),(114,'2024-12-17 21:22:23','2024-12-17 21:22:23','js','import { Injectable } from \'@angular/core\';\r\n\r\n@Injectable({\r\n  providedIn: \'root\'\r\n})\r\nexport class MiServicio {\r\n  obtenerDatos() {\r\n    return [\'dato1\', \'dato2\', \'dato3\'];\r\n  }\r\n}',126),(115,'2024-12-17 21:22:23','2024-12-17 21:22:23','show_iframe','false',126),(116,'2024-12-17 21:22:41','2024-12-17 21:22:41','height','h-[200px]',126),(117,'2024-12-17 21:23:08','2024-12-18 21:34:48','text_label','Este servicio puede inyectarse en un componente para acceder a sus métodos, ejemplo:',127),(118,'2024-12-17 21:23:21','2024-12-17 21:23:21','js','import { MiServicio } from \'services/MiServicio\';\r\n\r\nexport class MiComponenteComponent {\r\n  constructor(private miServicio: MiServicio) { \r\n  console.log(this.obtenerDatos());\r\n  }\r\n}',128),(119,'2024-12-17 21:23:21','2024-12-17 21:23:21','show_iframe','false',128),(120,'2024-12-17 21:32:33','2024-12-18 19:12:14','text_label','Domina los conceptos esenciales',93),(121,'2024-12-18 19:12:05','2024-12-18 19:12:05','text_label','Cosas Básicas de Angular que Debes Conocer',91),(122,'2024-12-18 19:13:59','2024-12-18 19:13:59','text_label','Qué son los Pipes y cómo transforman datos\r\n\r\nUn pipe es una función que permite transformar los datos antes de que se muestren en la vista. Es especialmente útil para formatear fechas, monedas o cadenas de texto de manera consistente.\r\n\r\nEjemplos comunes:',130),(123,'2024-12-18 19:14:12','2024-12-18 19:14:12','text_label','Pipes',129),(124,'2024-12-18 19:14:26','2024-12-18 19:14:26','js','<p>{{ fechaActual | date:\'shortDate\' }}</p>\r\n\r\n<p>{{ precio | currency:\'USD\' }}</p>',131),(125,'2024-12-18 19:14:26','2024-12-18 19:14:26','show_iframe','false',131),(127,'2024-12-18 19:15:10','2024-12-18 19:24:11','height','h-24',131),(128,'2024-12-18 19:15:30','2024-12-18 19:15:30','text_label','Pipes personalizados',132),(129,'2024-12-18 19:15:42','2024-12-18 19:15:42','js','@Pipe({ name: \'mayusculas\' })\r\nexport class MayusculasPipe implements PipeTransform {\r\n  transform(valor: string): string {\r\n    return valor.toUpperCase();\r\n  }\r\n}',133),(130,'2024-12-18 19:15:42','2024-12-18 19:15:42','show_iframe','false',133),(131,'2024-12-18 19:16:03','2024-12-18 19:24:34','height','h-32',133),(132,'2024-12-18 19:16:25','2024-12-18 19:16:25','js','<p>{{ \'hola mundo\' | mayusculas }}</p>',134),(133,'2024-12-18 19:16:25','2024-12-18 19:16:25','show_iframe','false',134),(134,'2024-12-18 19:16:33','2024-12-18 19:25:17','height','h-10',134),(135,'2024-12-18 19:17:04','2024-12-18 21:35:24','text_label','Navegación entre componentes\r\n\r\nEl sistema de routing permite construir aplicaciones de una sola página (SPA), donde la navegación entre vistas no requiere recargar la página completa. Cada ruta se asocia con un componente específico, lo que facilita la gestión de vistas dinámicas.\r\n\r\nEl módulo de rutas (RouterModule) configura las rutas principales y los parámetros necesarios para la navegación. Esto incluye rutas estáticas, dinámicas y redirecciones.\r\n\r\n\r\nConfiguración básica:',136),(136,'2024-12-18 19:17:47','2024-12-18 19:17:47','text_label','Routing',135),(137,'2024-12-18 19:18:19','2024-12-18 19:18:19','js','const rutas: Routes = [\r\n  { path: \'inicio\', component: InicioComponent },\r\n  { path: \'detalle/:id\', component: DetalleComponent },\r\n];\r\n@NgModule({\r\n  imports: [RouterModule.forRoot(rutas)],\r\n  exports: [RouterModule]\r\n})\r\nexport class AppRoutingModule { }',137),(138,'2024-12-18 19:18:19','2024-12-18 19:18:19','show_iframe','false',137),(139,'2024-12-18 19:18:27','2024-12-18 19:25:38','height','h-[200px]',137),(140,'2024-12-18 19:18:52','2024-12-18 19:18:52','text_label','Eventos y comunicación entre componentes',138),(141,'2024-12-18 19:19:01','2024-12-18 19:19:27','text_label','Comunicación entre componentes\r\n\r\nEn Angular, los componentes necesitan intercambiar datos para trabajar de forma efectiva:\r\n\r\nInput: Permite que un componente padre pase datos a un hijo.\r\n\r\nOutput: Permite que un componente hijo emita eventos al padre.\r\n\r\nEsta comunicación es fundamental para mantener la modularidad y la claridad en aplicaciones complejas.\r\n\r\n\r\nEjemplo de uso de @Input y @Output:',139),(142,'2024-12-18 19:19:59','2024-12-18 19:19:59','js','// Componente hijo\r\n@Component({\r\n  selector: \'app-hijo\',\r\n  template: `<button (click)=\"enviarEvento()\">Emitir evento</button>`\r\n})\r\nexport class HijoComponent {\r\n  @Output() eventoEmitido = new EventEmitter<string>();\r\n\r\n  enviarEvento() {\r\n    this.eventoEmitido.emit(\'Datos enviados desde el hijo\');\r\n  }\r\n}\r\n\r\n// Componente padre\r\n@Component({\r\n  selector: \'app-padre\',\r\n  template: `<app-hijo (eventoEmitido)=\"recibirEvento($event)\"></app-hijo>`\r\n})\r\nexport class PadreComponent {\r\n  recibirEvento(mensaje: string) {\r\n    console.log(mensaje);\r\n  }\r\n}',140),(143,'2024-12-18 19:19:59','2024-12-18 19:19:59','show_iframe','false',140),(145,'2024-12-18 19:20:38','2024-12-18 19:20:38','text_label','Ciclo de vida de un componente',141),(146,'2024-12-18 19:20:45','2024-12-18 19:21:01','text_label','Métodos clave del ciclo de vida\r\n\r\nEl ciclo de vida de un componente en Angular es el conjunto de etapas por las que pasa un componente desde su creación hasta su destrucción. Estas etapas son gestionadas por Angular mediante hooks de ciclo de vida, que son métodos que se pueden implementar dentro de un componente para ejecutar lógica en momentos específicos del ciclo.\r\n\r\nConocer y utilizar estos hooks de manera adecuada permite manejar eventos clave, optimizar el rendimiento y mantener un código más limpio y estructurado.\r\n\r\nA continuación, se presenta un ejemplo de un componente en Angular que utiliza los hooks de ciclo de vida:',142),(147,'2024-12-18 19:24:02','2024-12-18 19:25:05','height','h-56',128),(148,'2024-12-18 19:26:03','2024-12-18 19:26:03','js','import { Component, Input, OnInit, OnChanges, DoCheck, AfterViewInit, OnDestroy, SimpleChanges } from \'@angular/core\';\r\n\r\n@Component({\r\n  selector: \'app-ciclo-vida\',\r\n  template: `\r\n    <h1>{{titulo}}</h1>\r\n    <p>Contenido dinámico: {{contenido}}</p>\r\n  `\r\n})\r\nexport class CicloVidaComponent implements OnInit, OnChanges, DoCheck, AfterViewInit, OnDestroy {\r\n\r\n  @Input() titulo: string = \'\'; // Propiedad de entrada recibida desde el componente padre\r\n  contenido: string = \'\'; // Estado interno del componente\r\n\r\n  constructor() {\r\n    // Se utiliza para inicializar propiedades o preparar dependencias antes de cualquier renderización.\r\n    console.log(\'Constructor: Se inicializa el componente.\');\r\n  }\r\n\r\n  ngOnChanges(changes: SimpleChanges): void {\r\n    // Detecta cambios en las propiedades de entrada y reacciona a ellos.\r\n    console.log(\'ngOnChanges: Cambios detectados en @Input\', changes);\r\n  }\r\n\r\n  ngOnInit(): void {\r\n    // Ideal para inicializar lógica o cargar datos necesarios al momento de renderizar el componente por primera vez.\r\n    console.log(\'ngOnInit: El componente ha sido inicializado.\');\r\n    this.contenido = \'Este contenido se carga al inicializar el componente.\';\r\n  }\r\n\r\n  ngDoCheck(): void {\r\n    // Permite personalizar la detección de cambios cuando Angular verifica el estado del componente.\r\n    console.log(\'ngDoCheck: Verificando cambios manualmente.\');\r\n  }\r\n\r\n  ngAfterViewInit(): void {\r\n    // Se ejecuta después de que el DOM asociado al componente ha sido inicializado.\r\n    console.log(\'ngAfterViewInit: La vista y elementos hijos están completamente cargados.\');\r\n  }\r\n\r\n  ngOnDestroy(): void {\r\n    // Ideal para liberar recursos, cancelar suscripciones o limpiar datos al eliminar el componente.\r\n    console.log(\'ngOnDestroy: El componente está siendo destruido.\');\r\n  }\r\n}',143),(149,'2024-12-18 19:26:03','2024-12-18 19:26:03','show_iframe','false',143),(150,'2024-12-18 19:27:11','2024-12-18 19:27:11','text_label','Inyección de Dependencias',144),(151,'2024-12-18 19:27:33','2024-12-18 19:28:05','text_label','¿Qué es y por qué es importante?\r\n\r\nLa inyección de dependencias (DI) es un patrón de diseño en el que las dependencias (como servicios) se proporcionan a los componentes en lugar de ser creadas por ellos. Esto fomenta un diseño más flexible, desacoplado y fácil de probar.\r\n\r\nJerarquía de inyectores en Angular\r\n\r\nAngular gestiona un árbol de inyectores para determinar el alcance de las dependencias:\r\n\r\nRaíz (root): Servicios compartidos por toda la aplicación.\r\n\r\nComponente: Servicios específicos de un componente o módulo.\r\n\r\nEn la sección Servicios se puede ver como se usa la inyección de dependencia',146),(152,'2024-12-18 19:29:06','2024-12-18 19:29:06','text_label','Su capacidad para organizar el código, optimizar el rendimiento y facilitar el mantenimiento lo convierte en una opción confiable para aplicaciones tanto pequeñas como empresariales. Con el respaldo de Google y una comunidad activa, Angular sigue siendo una herramienta clave en el desarrollo web.',148),(153,'2024-12-18 19:29:16','2024-12-18 19:29:16','text_label','Conclusión',147),(154,'2024-12-18 19:37:07','2024-12-18 19:41:30','list','Componentes,Módulos',97),(155,'2024-12-18 19:37:14','2024-12-18 19:41:40','anchor','Componentes',104),(156,'2024-12-18 19:37:24','2024-12-18 19:41:49','anchor','Módulos',110),(157,'2024-12-18 19:40:26','2024-12-18 19:40:26','text_label','A continuación, se presenta un diagrama que ilustra cómo se interconectan estos conceptos.',150),(158,'2024-12-18 19:40:59','2024-12-18 19:40:59','url','https://docs.angular.lat/generated/images/guide/architecture/overview2.png',151),(159,'2024-12-18 22:00:51','2024-12-18 22:00:51','html','<div class=\"contenedor\">\r\n  <div class=\"centrado\">Contenido Centrado</div>\r\n</div>',47),(160,'2024-12-18 22:01:00','2024-12-18 22:01:00','html','<div class=\"flex-both-contenedor\">\r\n  <div class=\"flex-both-centrado\">Contenido Centrado</div>\r\n</div>',51),(161,'2024-12-18 22:01:12','2024-12-18 22:01:12','html','<div class=\"grid-both-contenedor\">\r\n  <div class=\"grid-both-centrado\">Contenido Centrado</div>\r\n</div>',54),(162,'2024-12-18 22:02:01','2024-12-18 22:02:01','css','.contenedor {\r\n  width: 100%;\r\n  background-color: #f0f0f0;\r\n}\r\n\r\n.centrado {\r\n  width: 50%;\r\n  margin: 0 auto; /* Centra horizontalmente */\r\n  background-color: #4CAF50;\r\n  padding: 20px;\r\n  text-align: center;\r\n}',47),(163,'2024-12-18 22:02:11','2024-12-18 22:02:11','css','.flex-both-contenedor {\r\n  display: flex;\r\n  justify-content: center; /* Centra horizontalmente */\r\n  align-items: center; /* Centra verticalmente */\r\n  height:100vh;\r\n  background-color: #f0f0f0;\r\n}\r\n\r\n.flex-both-centrado {\r\n  background-color: #673ab7;\r\n  padding: 20px;\r\n  color: white;\r\n}',51),(164,'2024-12-18 22:02:20','2024-12-18 22:02:20','css','.grid-both-contenedor {\r\n  display: grid;\r\n  place-items: center; /* Centra horizontal y verticalmente */\r\n  height:100vh;\r\n  background-color: #f0f0f0;\r\n}\r\n\r\n.grid-both-centrado {\r\n  background-color: #3f51b5;\r\n  padding: 20px;\r\n  color: white;\r\n}',54),(165,'2024-12-18 22:36:24','2024-12-18 22:48:26','styles','absolute left-0 top-0 bg-bgPrim rounded-full -translate-y-[24px] -translate-x-[24px] p-2 h-10 w-10',153),(166,'2024-12-18 22:36:56','2024-12-18 22:36:56','styles','text-blue-300 fa-solid fa-circle-info text-[24px]',154),(167,'2024-12-18 22:37:59','2024-12-18 22:37:59','styles','absolute left-0 top-0 bg-bgPrim rounded-full -translate-y-[24px] -translate-x-[24px] p-2 h-10 w-10',158),(168,'2024-12-18 22:37:59','2024-12-18 22:37:59','styles','text-blue-300 fa-solid fa-circle-info text-[24px]',159),(169,'2024-12-18 22:38:54','2024-12-18 22:38:54','text_label','A continuación, se presenta un diagrama que ilustra cómo se interconectan estos conceptos.',161),(170,'2024-12-18 22:42:09','2024-12-18 22:42:14','styles','hidden',155);
/*!40000 ALTER TABLE `subcomponent_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'superadmin','superadmin@gmail.com',NULL,'$2y$10$SR0cEQYvdma9jU1oM6I8YOrnpgQFTzHb7gLKnjhhdRyAw7NZQn5Ee','977502170','Calle','super','admin',NULL,'2024-12-14 21:23:59','2024-12-14 21:23:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-18 23:42:28
