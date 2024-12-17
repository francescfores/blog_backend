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
  `nick` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_type_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component_component_type_id_foreign` (`component_type_id`),
  CONSTRAINT `component_component_type_id_foreign` FOREIGN KEY (`component_type_id`) REFERENCES `component_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (1,'2024-12-14 21:23:59','2024-12-14 21:23:59','page','desc',1),(2,'2024-12-14 21:23:59','2024-12-14 21:23:59','container','desc',2),(3,'2024-12-14 21:23:59','2024-12-14 21:23:59','grid','desc',3),(4,'2024-12-14 21:23:59','2024-12-14 21:23:59','card','desc',4),(5,'2024-12-14 21:23:59','2024-12-14 21:23:59','text','desc',5),(6,'2024-12-14 21:23:59','2024-12-14 21:23:59','heading','desc',6),(7,'2024-12-14 21:23:59','2024-12-14 21:23:59','image','desc',7),(8,'2024-12-14 21:23:59','2024-12-14 21:23:59','button','desc',8),(9,'2024-12-14 21:23:59','2024-12-14 21:23:59','icon','desc',9),(10,'2024-12-14 21:23:59','2024-12-14 21:23:59','divider','desc',10),(11,'2024-12-14 21:23:59','2024-12-14 21:23:59','spacer','desc',11),(12,'2024-12-14 21:23:59','2024-12-14 21:23:59','table_contents','desc',12),(13,'2024-12-14 21:23:59','2024-12-14 21:24:00','button3d','desc',13),(14,'2024-12-14 21:24:00','2024-12-14 21:24:00','codeplayground','codeplayground',14),(15,'2024-12-14 21:24:00','2024-12-14 21:24:00','image3d','desc',15),(16,'2024-12-14 21:34:54','2024-12-14 21:34:54','page 2','desc',1);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `component_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component_attribute_component_id_foreign` (`component_id`),
  CONSTRAINT `component_attribute_component_id_foreign` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_attribute`
--

LOCK TABLES `component_attribute` WRITE;
/*!40000 ALTER TABLE `component_attribute` DISABLE KEYS */;
INSERT INTO `component_attribute` VALUES (1,'2024-12-14 21:23:59','2024-12-14 22:27:27','styles','flex flex-col  bg-bgPrim text-textPrimary w-full min-h-screen  items-center items-center pt-16',1),(2,'2024-12-14 21:23:59','2024-12-14 23:09:49','styles','container w-full min-h-10',2),(3,'2024-12-14 21:23:59','2024-12-14 21:50:12','styles','p-4 grid grid-cols-3 bg-bgSeco gap-2 w-full  items-center  justify-center',3),(4,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','p-4 rounded bg-bgTern w-full flex flex-col',4),(5,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','text-textPrimary text-md text-textPrimary whitespace-pre-line',5),(6,'2024-12-14 21:23:59','2024-12-14 21:23:59','text_label','Text',5),(7,'2024-12-14 21:23:59','2024-12-14 21:23:59','anchor','text',5),(8,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','font-semibold text-3xl md:text-4xl xl:text-5xl text-textPrimary',6),(9,'2024-12-14 21:23:59','2024-12-14 21:23:59','text_label','Text',6),(10,'2024-12-14 21:23:59','2024-12-14 21:23:59','anchor','text',6),(11,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','',7),(12,'2024-12-14 21:23:59','2024-12-14 21:23:59','url','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrVLGzO55RQXipmjnUPh09YUtP-BW3ZTUeAA&s',7),(13,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','flex bg-primary px-4 py-2 rounded w-32 justify-center  items-center text-white',8),(14,'2024-12-14 21:23:59','2024-12-14 21:23:59','label','Button',8),(15,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','text-textPrimary fa fa-book',9),(16,'2024-12-14 21:23:59','2024-12-14 21:41:36','styles','flex w-full   fill-bgPrim rotate-0',10),(17,'2024-12-14 21:23:59','2024-12-14 21:43:14','svg','<svg class=\"fill-bgSeco bg-bgPrim\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 1000 100\" >\r\n                <path d=\"M0 0v99.7C62 69 122.4 48.7 205 66c83.8 17.6 160.5 20.4 240-12 54-22 110-26 173-10a392.2 392.2 0 0 0 222-5c55-17 110.3-36.9 160-27.2V0H0Z\" opacity=\".5\"></path>\r\n                <path d=\"M0 0v74.7C62 44 122.4 28.7 205 46c83.8 17.6 160.5 25.4 240-7 54-22 110-21 173-5 76.5 19.4 146.5 23.3 222 0 55-17 110.3-31.9 160-22.2V0H0Z\"></path>\r\n            </svg>',10),(18,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','py-10 w-full',11),(19,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','flex flex-col col-span-2 flex-wrap md:sticky md:top-[62px]',12),(20,'2024-12-14 21:23:59','2024-12-14 21:23:59','list','title,test 2,item3',12),(21,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles','',13),(22,'2024-12-14 21:23:59','2024-12-14 21:23:59','styles_button','btn_secondary',13),(23,'2024-12-14 21:23:59','2024-12-14 21:23:59','label','Button',13),(24,'2024-12-14 21:23:59','2024-12-14 21:23:59','url','Button',13),(25,'2024-12-14 21:23:59','2024-12-14 21:23:59','height','30px',13),(26,'2024-12-14 21:23:59','2024-12-14 21:23:59','width','100px',13),(27,'2024-12-14 21:23:59','2024-12-14 21:23:59','raise','10',13),(28,'2024-12-14 21:23:59','2024-12-14 21:23:59','rounded','10px',13),(29,'2024-12-14 21:23:59','2024-12-14 21:24:00','border','10px',13),(30,'2024-12-14 21:23:59','2024-12-14 21:24:00','border_style','solid #FF4769 4px',13),(31,'2024-12-14 21:23:59','2024-12-14 21:24:00','bg_front_color','#FF1F48',13),(32,'2024-12-14 21:23:59','2024-12-14 21:24:00','bg_shadow_color','rgba(217, 217, 217, 0.35);',13),(33,'2024-12-14 21:23:59','2024-12-14 21:24:00','bg_back_color','#E00029',13),(34,'2024-12-14 21:23:59','2024-12-14 21:24:00','font_color','#fff',13),(35,'2024-12-14 21:23:59','2024-12-14 21:24:00','font_body_weight','400',13),(36,'2024-12-14 21:23:59','2024-12-14 21:24:00','font_size','16px',13),(37,'2024-12-14 21:23:59','2024-12-14 21:24:00','ripple','false',13),(38,'2024-12-14 21:24:00','2024-12-14 21:24:00','styles','w-full',14),(39,'2024-12-14 21:24:00','2024-12-14 21:24:00','html','<p>Testing</p>',14),(40,'2024-12-14 21:24:00','2024-12-14 21:24:00','css','p{color:red}',14),(41,'2024-12-14 21:24:00','2024-12-14 21:24:00','js','console.log(\'testing\');',14),(42,'2024-12-14 21:24:00','2024-12-14 21:24:00','height','h-[300px]',14),(43,'2024-12-14 21:24:00','2024-12-14 21:24:00','bg_color_1','bg-[#151528]',14),(44,'2024-12-14 21:24:00','2024-12-14 21:24:00','bg_color_2','bg-[#2A2A50]',14),(45,'2024-12-14 21:24:00','2024-12-14 21:24:00','text_color_1','text-[#d8d6ff]',14),(46,'2024-12-14 21:24:00','2024-12-14 21:24:00','text_color_2','text-[#7e73a2]',14),(47,'2024-12-14 21:24:00','2024-12-14 21:24:00','rounded','rounded-lg',14),(48,'2024-12-14 21:24:00','2024-12-14 21:24:00','show_iframe','true',14),(49,'2024-12-14 21:24:00','2024-12-14 21:24:00','styles','py-10 w-full h-full',15),(50,'2024-12-14 21:24:00','2024-12-14 21:24:00','img_url','https://pngimg.com/uploads/venom/venom_PNG41.png',15),(51,'2024-12-14 21:24:00','2024-12-14 21:24:00','img_bg_url','https://64.media.tumblr.com/47c08a8cea06364a20db6d3137d221eb/7cbec6d1017fc497-c6/s1280x1920/a4959ce4bff4ed4bfe22b899dc21a22cf8a55a6e.png',15),(52,'2024-12-14 21:34:54','2024-12-14 21:50:00','styles','flex flex-col  bg-bgPrim text-textPrimary w-full min-h-screen items-center pt-16',16);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2024-12-14 21:23:59','2024-12-14 21:23:59','Testing components',' Lyft launching cross-platform service this week ',' The place is close to Barceloneta Beach and bus stop just 2 min by walk and near to \"Naviglio\" where you can enjoy the main night life in Barcelona. ',0,NULL,NULL,1),(2,'2024-12-14 21:34:54','2024-12-17 20:06:18','¿Qué es Flexbox?','Flexbox con Tailwind CSS','descEn el desarrollo web, Flexbox es una herramienta fundamental para crear diseños de interfaz responsivos y adaptativos.',113,NULL,1,2);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_component`
--

LOCK TABLES `post_component` WRITE;
/*!40000 ALTER TABLE `post_component` DISABLE KEYS */;
INSERT INTO `post_component` VALUES (1,NULL,NULL,1,1),(2,NULL,NULL,16,2);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_subcomponent`
--

LOCK TABLES `relation_subcomponent` WRITE;
/*!40000 ALTER TABLE `relation_subcomponent` DISABLE KEYS */;
INSERT INTO `relation_subcomponent` VALUES (1,2,1,NULL,NULL),(2,3,2,NULL,NULL),(3,4,2,NULL,NULL),(4,5,2,NULL,NULL),(5,7,1,NULL,NULL),(7,15,13,NULL,NULL),(8,16,15,NULL,NULL),(9,17,15,NULL,NULL),(10,18,11,NULL,NULL),(11,19,11,NULL,NULL),(14,23,11,NULL,NULL),(15,24,11,NULL,NULL),(16,25,11,NULL,NULL),(18,27,11,NULL,NULL),(19,28,11,NULL,NULL),(20,29,11,NULL,NULL),(21,30,11,NULL,NULL),(22,31,11,NULL,NULL),(23,32,11,NULL,NULL),(25,34,11,NULL,NULL),(26,35,11,NULL,NULL),(27,36,11,NULL,NULL);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcomponent`
--

LOCK TABLES `subcomponent` WRITE;
/*!40000 ALTER TABLE `subcomponent` DISABLE KEYS */;
INSERT INTO `subcomponent` VALUES (1,'2024-12-14 21:23:59','2024-12-14 21:23:59',2,1,NULL,NULL),(2,'2024-12-14 21:23:59','2024-12-14 21:23:59',3,NULL,1,NULL),(3,'2024-12-14 21:23:59','2024-12-14 21:23:59',4,NULL,2,NULL),(4,'2024-12-14 21:23:59','2024-12-14 21:23:59',4,NULL,2,NULL),(5,'2024-12-14 21:23:59','2024-12-14 21:23:59',4,NULL,2,NULL),(6,'2024-12-14 21:23:59','2024-12-14 21:23:59',10,1,NULL,NULL),(7,'2024-12-14 21:23:59','2024-12-14 21:23:59',11,NULL,1,NULL),(9,'2024-12-14 21:35:46','2024-12-14 23:11:42',10,16,NULL,1),(11,'2024-12-14 21:43:32','2024-12-14 23:11:42',2,16,NULL,2),(13,'2024-12-14 21:48:00','2024-12-14 23:11:16',3,16,NULL,0),(15,'2024-12-14 21:48:55','2024-12-14 23:10:25',2,NULL,13,0),(16,'2024-12-14 21:51:19','2024-12-14 23:10:50',6,NULL,15,0),(17,'2024-12-14 21:51:51','2024-12-14 23:10:50',5,NULL,15,1),(18,'2024-12-14 21:54:47','2024-12-14 23:11:46',6,NULL,11,0),(19,'2024-12-14 21:54:56','2024-12-14 23:11:46',5,NULL,11,1),(23,'2024-12-14 23:13:49','2024-12-17 20:02:55',14,NULL,11,2),(24,'2024-12-17 20:00:53','2024-12-17 20:02:55',6,NULL,11,3),(25,'2024-12-17 20:01:33','2024-12-17 20:02:55',5,NULL,11,4),(27,'2024-12-17 20:02:20','2024-12-17 20:02:55',6,NULL,11,5),(28,'2024-12-17 20:02:45','2024-12-17 20:02:57',14,NULL,11,7),(29,'2024-12-17 20:02:51','2024-12-17 20:02:57',5,NULL,11,6),(30,'2024-12-17 20:03:57','2024-12-17 20:03:57',5,NULL,11,9),(31,'2024-12-17 20:03:59','2024-12-17 20:03:59',14,NULL,11,10),(32,'2024-12-17 20:04:00','2024-12-17 20:04:00',5,NULL,11,11),(34,'2024-12-17 20:04:01','2024-12-17 20:04:01',14,NULL,11,13),(35,'2024-12-17 20:05:29','2024-12-17 20:05:29',6,NULL,11,13),(36,'2024-12-17 20:05:31','2024-12-17 20:05:31',5,NULL,11,14);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `subcomponent_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcomponent_attribute_subcomponent_id_foreign` (`subcomponent_id`),
  CONSTRAINT `subcomponent_attribute_subcomponent_id_foreign` FOREIGN KEY (`subcomponent_id`) REFERENCES `subcomponent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcomponent_attribute`
--

LOCK TABLES `subcomponent_attribute` WRITE;
/*!40000 ALTER TABLE `subcomponent_attribute` DISABLE KEYS */;
INSERT INTO `subcomponent_attribute` VALUES (3,'2024-12-14 21:50:22','2024-12-14 21:53:21','styles','flex flex-col container w-full min-h-10 mx-auto gap-10 pt-10',15),(4,'2024-12-14 21:51:10','2024-12-14 21:54:34','styles','grid grid-cols-1 bg-bgSeco gap-2 w-full  items-center  justify-center',13),(5,'2024-12-14 21:51:48','2024-12-14 21:51:48','text_label','Flexbox con Tailwind CSS',16),(6,'2024-12-14 21:52:49','2024-12-14 21:52:49','text_label','En el desarrollo web, Flexbox es una herramienta fundamental para crear diseños de interfaz responsivos y adaptativos.',17),(7,'2024-12-14 21:54:52','2024-12-14 21:54:52','text_label','¿Qué es Flexbox?',18),(10,'2024-12-14 23:08:57','2024-12-14 23:12:50','text_label','Flexbox, o \"Flexible Box\", es un módulo de diseño de CSS que se utiliza para crear layouts unidimensionales, tanto vertical como horizontalmente. Esto lo convierte en una excelente opción para alinear elementos de manera dinámica sin tener que usar floats o position.\r\n\r\nAl usar Flexbox en Tailwind, puedes evitar escribir CSS personalizado, ya que Tailwind provee clases que puedes aplicar directamente en tus elementos.\r\n\r\n\r\nEjemplo básico de Flexbox en HTML con Tailwind:',19),(11,'2024-12-14 23:09:49','2024-12-14 23:09:49','styles','container w-full min-h-10 gap-10 flex flex-col',11),(12,'2024-12-17 20:00:16','2024-12-17 20:00:16','html','<div class=\"flex justify-center items-center h-screen bg-gray-200\">\r\n  <div class=\"flex flex-col gap-y-4\">\r\n    <div class=\"bg-blue-500 text-white p-4\">Elemento 1</div>\r\n    <div class=\"bg-green-500 text-white p-4\">Elemento 2</div>\r\n    <div class=\"bg-red-500 text-white p-4\">Elemento 3</div>\r\n  </div>\r\n</div>',23),(13,'2024-12-17 20:01:04','2024-12-17 20:01:04','text_label','Clases Flex en Tailwind CSS',24),(14,'2024-12-17 20:01:42','2024-12-17 20:01:42','text_label','- flex: Activa el comportamiento Flexbox en un contenedor.\r\n\r\n- flex-row / flex-col: Define la dirección de los elementos hijos (horizontal o vertical).\r\n\r\n- justify-start, justify-center, justify-end, justify-between, justify-around, justify-evenly: Controla la alineación horizontal de los elementos dentro de un contenedor flex.\r\n\r\n- items-start, items-center, items-end, items-stretch: Controla la alineación vertical de los elementos dentro de un contenedor flex.\r\n\r\n- flex-wrap / flex-nowrap: Define si los elementos deben ocupar varias filas cuando no caben en una sola.\r\n\r\n- gap-x-4, gap-y-4: Añade espacio entre los elementos hijos. Puedes cambiar el valor (4, 2, 8, etc.) según la necesidad.',25),(15,'2024-12-17 20:02:26','2024-12-17 20:02:26','text_label','Ejemplos prácticos de Flexbox con Tailwind',27),(16,'2024-12-17 20:03:05','2024-12-17 20:03:05','text_label','Centrado de un elemento en pantalla',29),(17,'2024-12-17 20:03:33','2024-12-17 20:03:33','html','<div class=\"flex items-center justify-center h-screen bg-gray-200\">\r\n  <div class=\"bg-blue-500 text-white p-10 rounded-lg\">\r\n    ¡Estoy centrado!\r\n  </div>\r\n</div>',28),(18,'2024-12-17 20:04:31','2024-12-17 20:04:31','text_label','Distribución de elementos en una barra de navegación',30),(19,'2024-12-17 20:04:41','2024-12-17 20:04:41','html','<nav class=\"flex justify-between bg-gray-800 text-white p-4\">\r\n  <div class=\"text-lg font-semibold\">Mi Sitio</div>\r\n  <div class=\"flex gap-x-4\">\r\n    <a href=\"#\" class=\"hover:text-gray-300\">Inicio</a>\r\n    <a href=\"#\" class=\"hover:text-gray-300\">Acerca</a>\r\n    <a href=\"#\" class=\"hover:text-gray-300\">Contacto</a>\r\n  </div>\r\n</nav>',31),(20,'2024-12-17 20:04:55','2024-12-17 20:04:55','text_label','Grid de tarjetas responsivas',32),(21,'2024-12-17 20:05:18','2024-12-17 20:05:18','html','<div class=\"flex flex-wrap gap-4 p-4\">\r\n  <div class=\"flex-1 min-w-[250px] bg-blue-200 p-4 rounded-lg\">Tarjeta 1</div>\r\n  <div class=\"flex-1 min-w-[250px] bg-green-200 p-4 rounded-lg\">Tarjeta 2</div>\r\n  <div class=\"flex-1 min-w-[250px] bg-red-200 p-4 rounded-lg\">Tarjeta 3</div>\r\n</div>',34),(22,'2024-12-17 20:06:03','2024-12-17 20:06:03','text_label','Conclusión',35),(23,'2024-12-17 20:06:07','2024-12-17 20:06:07','text_label','Usar Flexbox con Tailwind CSS es una excelente manera de crear interfaces limpias, rápidas y responsivas sin tener que preocuparse demasiado por CSS personalizado. Gracias a sus clases predefinidas, es fácil alinear, distribuir y manipular elementos de forma eficiente, lo que ahorra tiempo y esfuerzo en el desarrollo.',36);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

-- Dump completed on 2024-12-17 20:08:22
