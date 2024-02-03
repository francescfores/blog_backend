-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
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
  PRIMARY KEY (`id`),
  KEY `component_component_type_id_foreign` (`component_type_id`),
  CONSTRAINT `component_component_type_id_foreign` FOREIGN KEY (`component_type_id`) REFERENCES `component_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (2,'2024-01-22 21:28:43','2024-01-23 01:02:24','grid lg:grid-cols-2','Grid layout 1 column',2),(3,'2024-01-22 21:28:43','2024-01-22 21:28:43','card 1','card component',3),(4,'2024-01-22 21:28:43','2024-01-22 21:28:43','title h1','title component',4),(5,'2024-01-22 21:28:43','2024-01-22 21:28:43','text p','text component',4),(6,'2024-01-22 21:28:43','2024-01-22 21:28:43','img component','img',5),(8,'2024-01-22 21:30:00','2024-01-22 21:30:00','card 1','card component',3),(10,'2024-01-22 21:55:41','2024-01-22 21:56:20','sm:grid-cols-2 md:grid-cols-3','Grid layout 1 column',2),(11,'2024-01-23 00:00:06','2024-01-23 00:00:25','main','main',2),(13,'2024-01-23 00:36:43','2024-01-24 00:57:38','Page','Page',1),(14,'2024-01-23 01:22:53','2024-01-23 01:22:53','main','main',7),(15,'2024-01-23 19:50:47','2024-01-23 19:50:47','card 1','card component',3),(17,'2024-01-23 20:35:49','2024-01-23 20:36:43','title h2','title component',4),(18,'2024-01-23 20:56:54','2024-01-23 20:58:05','title h3','title component',4),(19,'2024-01-23 21:01:00','2024-01-23 21:01:20','title h4','title component',4),(20,'2024-01-24 02:14:27','2024-01-24 02:15:15','card 2','card component',3),(23,'2024-01-24 03:39:08','2024-01-24 03:39:08','image3d','image3d',10),(24,'2024-01-30 14:08:47','2024-01-30 14:08:47','button','button',11),(25,'2024-01-30 14:09:19','2024-01-30 14:09:19','Page','Page',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_attribute`
--

LOCK TABLES `component_attribute` WRITE;
/*!40000 ALTER TABLE `component_attribute` DISABLE KEYS */;
INSERT INTO `component_attribute` VALUES (2,'2024-01-22 21:28:43','2024-01-22 21:57:21','styles','grid lg:grid-cols-2 place-items-center pt-16 pb-8 md:pt-12 md:pb-24',2),(3,'2024-01-22 21:28:43','2024-01-23 14:43:17','styles','w-full p-4 rounded-md',3),(4,'2024-01-22 21:28:43','2024-01-23 20:59:10','styles','font-semibold text-6xl md:text-7xl xl:text-8xl  text-textPrimary',4),(5,'2024-01-22 21:28:43','2024-01-22 21:28:43','text_label','title',4),(6,'2024-01-22 21:28:43','2024-01-23 19:54:00','styles','text-textSecondary mt-2 leading-relaxed',5),(7,'2024-01-22 21:28:43','2024-01-22 21:28:43','text_label','text',5),(8,'2024-01-22 21:28:43','2024-01-22 21:28:43','styles','w-full h-full',6),(9,'2024-01-22 21:28:43','2024-01-22 21:28:43','url','day92-freelancing.svg',6),(11,'2024-01-22 21:30:00','2024-01-22 21:30:59','styles','flex gap-4 items-start',8),(14,'2024-01-22 21:55:41','2024-01-22 21:55:41','styles','grid sm:grid-cols-2 md:grid-cols-3 mt-16 gap-16',10),(15,'2024-01-23 00:00:06','2024-01-24 00:55:19','styles','max-w-screen-xl mx-auto p-5',11),(17,'2024-01-23 00:36:43','2024-01-23 18:29:45','styles','flex text-textPrimary bg-bgPrim gap-4 p-2',13),(18,'2024-01-23 01:22:53','2024-01-23 16:21:31','styles','max-w-screen-xl mx-auto px-5 gap-4 grid',14),(19,'2024-01-23 19:50:47','2024-01-24 00:44:23','styles','w-1/2 p-4 rounded-md bg-bgPrim',15),(20,'2024-01-23 20:35:49','2024-01-23 20:59:26','styles','font-semibold text-5xl md:text-6xl xl:text7xl  text-textPrimary',17),(21,'2024-01-23 20:35:49','2024-01-23 20:37:06','text_label','title h2',17),(22,'2024-01-23 20:56:54','2024-01-23 21:00:42','styles','font-semibold text-4xl md:text-5xl xl:text6xl  text-textPrimary',18),(23,'2024-01-23 20:56:54','2024-01-23 21:15:23','text_label','title h3',18),(24,'2024-01-23 21:01:00','2024-01-23 21:15:07','styles','font-semibold text-3xl md:text-4xl xl:text-5xl  text-textPrimary',19),(25,'2024-01-23 21:01:00','2024-01-23 21:01:20','text_label','title h4',19),(26,'2024-01-24 02:14:27','2024-01-24 02:15:15','styles','w-1/2 p-4 rounded-md bg-bgSeco',20),(29,'2024-01-24 03:39:08','2024-01-24 04:02:32','styles','p-4',23),(30,'2024-01-24 03:39:08','2024-01-24 03:45:04','img_url','rhino.png',23),(31,'2024-01-24 03:39:08','2024-01-24 04:24:56','img_bg_url','main-qimg-9ae33dc5b87dbac9b5c979e72b3c426f-lq.jpeg',23),(32,'2024-01-30 14:08:47','2024-01-30 14:08:47','styles','p-4 relative m-0  rounded-none bg-transparent  shadow-none ',24),(33,'2024-01-30 14:08:47','2024-01-30 14:08:47','styles_button','p-4 relative m-0  rounded-none bg-transparent  shadow-none ',24),(34,'2024-01-30 14:08:47','2024-01-30 14:08:47','label','button',24),(35,'2024-01-30 14:08:47','2024-01-30 14:08:47','url','www.google.com',24),(36,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','flex text-textPrimary bg-bgPrim gap-4 p-2',25);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_type`
--

LOCK TABLES `component_type` WRITE;
/*!40000 ALTER TABLE `component_type` DISABLE KEYS */;
INSERT INTO `component_type` VALUES (1,'2024-01-22 21:28:43','2024-01-22 21:28:43','page','type page'),(2,'2024-01-22 21:28:43','2024-01-22 21:28:43','grid','type grid'),(3,'2024-01-22 21:28:43','2024-01-22 21:28:43','card','desc'),(4,'2024-01-22 21:28:43','2024-01-22 21:28:43','text','desc'),(5,'2024-01-22 21:28:43','2024-01-22 21:28:43','img','desc'),(6,'2024-01-23 00:35:43','2024-01-23 00:35:43','main','desc'),(7,'2024-01-23 01:22:53','2024-01-23 01:22:53','main','desc'),(8,'2024-01-24 03:36:27','2024-01-24 03:36:27','main','desc'),(9,'2024-01-24 03:38:53','2024-01-24 03:38:53','main','desc'),(10,'2024-01-24 03:39:08','2024-01-24 03:39:08','image3d','image3d'),(11,'2024-01-30 14:08:47','2024-01-30 14:08:47','button','button');
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
  `post_content_id` bigint unsigned DEFAULT NULL,
  `component_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_post_id_foreign` (`post_id`),
  KEY `images_post_content_id_foreign` (`post_content_id`),
  KEY `images_component_id_foreign` (`component_id`),
  CONSTRAINT `images_component_id_foreign` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE,
  CONSTRAINT `images_post_content_id_foreign` FOREIGN KEY (`post_content_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'2024-01-24 03:44:47','2024-01-24 03:44:47','rhino.png','public/blog/components//rhino.png','img',NULL,NULL,23),(2,'2024-01-24 03:45:04','2024-01-24 03:45:04','rhino.png','public/blog/components//rhino.png','img',NULL,NULL,23),(3,'2024-01-24 03:45:29','2024-01-24 03:45:29','rhino.png','public/blog/components//rhino.png','img',NULL,NULL,20),(4,'2024-01-24 03:46:12','2024-01-24 03:46:12','rhino.png','public/blog/components//rhino.png','img',NULL,NULL,23),(5,'2024-01-24 04:24:48','2024-01-24 04:24:48','main-qimg-9ae33dc5b87dbac9b5c979e72b3c426f-lq.jpeg','public/blog/components//main-qimg-9ae33dc5b87dbac9b5c979e72b3c426f-lq.jpeg','img',NULL,NULL,23),(6,'2024-01-24 04:24:56','2024-01-24 04:24:56','main-qimg-9ae33dc5b87dbac9b5c979e72b3c426f-lq.jpeg','public/blog/components//main-qimg-9ae33dc5b87dbac9b5c979e72b3c426f-lq.jpeg','img',NULL,NULL,23);
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
) ENGINE=InnoDB AUTO_INCREMENT=3377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (3349,'2014_10_12_000000_create_users_table',1),(3350,'2014_10_12_100000_create_password_reset_tokens_table',1),(3351,'2019_08_19_000000_create_failed_jobs_table',1),(3352,'2019_12_14_000001_create_personal_access_tokens_table',1),(3353,'2022_12_15_003335_create_post_categories_table',1),(3354,'2022_12_15_003335_create_post_content_types_table',1),(3355,'2022_12_15_003336_create_clients_table',1),(3356,'2022_12_15_003336_create_post_content_type_attributes_table',1),(3357,'2022_12_15_003336_create_posts_table',1),(3358,'2022_12_15_003337_create_post_contents_table',1),(3359,'2022_12_15_003338_create_post_content_attributes_table',1),(3360,'2022_12_15_003338_create_post_subcontents_table',1),(3361,'2023_01_24_150529_create_post_tags_table',1),(3362,'2023_01_24_150530_create_posts_tags_table',1),(3363,'2023_01_24_150536_cretae_post_comments_table',1),(3364,'2023_06_07_224956_create_permission_tables',1),(3365,'2024_01_13_210601_post_content_attributes_custom',1),(3366,'2024_01_15_211128_post',1),(3367,'2024_01_15_211129_component_type',1),(3368,'2024_01_15_211130_component',1),(3369,'2024_01_15_211137_post_component',1),(3370,'2024_01_15_211151_component_attribute',1),(3371,'2024_01_15_211152_post_component_attribute',1),(3372,'2024_01_15_211306_subcomponent',1),(3373,'2024_01_15_211308_subcomponent_attribute',1),(3374,'2024_01_15_211309_create_posts_images_table',1),(3375,'2024_01_19_170625_relation_subcomponents',1),(3376,'2024_01_24_000505_add_order_to_subcomponent_table',2);
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
INSERT INTO `post` VALUES (1,'2024-01-22 21:28:43','2024-01-24 00:56:01','Building a Magical 3D Button','subname','Bet you can\'t click just once!',NULL,NULL,NULL),(2,'2024-01-23 00:31:39','2024-01-23 00:31:39','Magic button','Magic button','desc',NULL,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,'2024-01-22 21:28:43','2024-01-22 21:28:43','cat1','desc','img');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_component`
--

LOCK TABLES `post_component` WRITE;
/*!40000 ALTER TABLE `post_component` DISABLE KEYS */;
INSERT INTO `post_component` VALUES (4,NULL,NULL,13,2),(6,NULL,NULL,25,1);
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
-- Table structure for table `post_content_attributes`
--

DROP TABLE IF EXISTS `post_content_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_content_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `post_content_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_content_attributes_post_content_id_foreign` (`post_content_id`),
  CONSTRAINT `post_content_attributes_post_content_id_foreign` FOREIGN KEY (`post_content_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_content_attributes`
--

LOCK TABLES `post_content_attributes` WRITE;
/*!40000 ALTER TABLE `post_content_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_content_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_content_attributes_custom`
--

DROP TABLE IF EXISTS `post_content_attributes_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_content_attributes_custom` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `post_content_id` bigint unsigned DEFAULT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_content_attributes_custom_post_content_id_foreign` (`post_content_id`),
  KEY `post_content_attributes_custom_post_id_foreign` (`post_id`),
  CONSTRAINT `post_content_attributes_custom_post_content_id_foreign` FOREIGN KEY (`post_content_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_content_attributes_custom_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_content_attributes_custom`
--

LOCK TABLES `post_content_attributes_custom` WRITE;
/*!40000 ALTER TABLE `post_content_attributes_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_content_attributes_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_content_type_attributes`
--

DROP TABLE IF EXISTS `post_content_type_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_content_type_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_content_type_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_content_type_attributes_post_content_type_id_foreign` (`post_content_type_id`),
  CONSTRAINT `post_content_type_attributes_post_content_type_id_foreign` FOREIGN KEY (`post_content_type_id`) REFERENCES `post_content_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_content_type_attributes`
--

LOCK TABLES `post_content_type_attributes` WRITE;
/*!40000 ALTER TABLE `post_content_type_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_content_type_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_content_types`
--

DROP TABLE IF EXISTS `post_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_content_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_content_types`
--

LOCK TABLES `post_content_types` WRITE;
/*!40000 ALTER TABLE `post_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_contents`
--

DROP TABLE IF EXISTS `post_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_contents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `post_content_type_id` bigint unsigned DEFAULT NULL,
  `post_content_id` bigint unsigned DEFAULT NULL,
  `recycled_id` bigint unsigned DEFAULT NULL,
  `copied_id` bigint unsigned DEFAULT NULL,
  `global` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_contents_post_id_foreign` (`post_id`),
  KEY `post_contents_post_content_type_id_foreign` (`post_content_type_id`),
  KEY `post_contents_post_content_id_foreign` (`post_content_id`),
  CONSTRAINT `post_contents_post_content_id_foreign` FOREIGN KEY (`post_content_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_contents_post_content_type_id_foreign` FOREIGN KEY (`post_content_type_id`) REFERENCES `post_content_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_contents_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_contents`
--

LOCK TABLES `post_contents` WRITE;
/*!40000 ALTER TABLE `post_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_subcontents`
--

DROP TABLE IF EXISTS `post_subcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_subcontents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content_child_id` bigint unsigned DEFAULT NULL,
  `content_parent_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_subcontents_content_child_id_foreign` (`content_child_id`),
  KEY `post_subcontents_content_parent_id_foreign` (`content_parent_id`),
  CONSTRAINT `post_subcontents_content_child_id_foreign` FOREIGN KEY (`content_child_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_subcontents_content_parent_id_foreign` FOREIGN KEY (`content_parent_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_subcontents`
--

LOCK TABLES `post_subcontents` WRITE;
/*!40000 ALTER TABLE `post_subcontents` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_subcontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
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
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned DEFAULT NULL,
  `post_tag_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_post_tag_id_foreign` (`post_tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_tags_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_subcomponent`
--

LOCK TABLES `relation_subcomponent` WRITE;
/*!40000 ALTER TABLE `relation_subcomponent` DISABLE KEYS */;
INSERT INTO `relation_subcomponent` VALUES (2,3,2,NULL,NULL),(3,4,2,NULL,NULL),(4,6,5,NULL,NULL),(9,12,11,NULL,NULL),(10,13,11,NULL,NULL),(12,15,14,NULL,NULL),(15,21,20,NULL,NULL),(16,22,20,NULL,NULL),(68,78,77,NULL,NULL),(69,79,77,NULL,NULL),(70,80,79,NULL,NULL),(71,81,79,NULL,NULL),(72,83,82,NULL,NULL),(73,84,82,NULL,NULL),(74,85,84,NULL,NULL),(75,86,84,NULL,NULL),(76,88,87,NULL,NULL),(77,89,87,NULL,NULL),(78,90,89,NULL,NULL),(79,91,89,NULL,NULL),(80,93,92,NULL,NULL),(81,94,92,NULL,NULL),(82,95,94,NULL,NULL),(83,96,94,NULL,NULL),(84,98,97,NULL,NULL),(85,99,97,NULL,NULL),(86,100,99,NULL,NULL),(87,101,99,NULL,NULL),(88,103,102,NULL,NULL),(89,104,102,NULL,NULL),(90,105,104,NULL,NULL),(91,106,104,NULL,NULL),(93,109,108,NULL,NULL),(94,110,108,NULL,NULL),(95,111,110,NULL,NULL),(96,112,110,NULL,NULL),(98,114,113,NULL,NULL),(99,115,113,NULL,NULL),(100,116,115,NULL,NULL),(101,117,115,NULL,NULL),(103,119,118,NULL,NULL),(104,120,118,NULL,NULL),(105,121,120,NULL,NULL),(106,122,120,NULL,NULL),(108,124,123,NULL,NULL),(109,125,123,NULL,NULL),(110,126,125,NULL,NULL),(111,127,125,NULL,NULL),(113,129,128,NULL,NULL),(114,130,128,NULL,NULL),(115,131,130,NULL,NULL),(116,132,130,NULL,NULL),(118,134,133,NULL,NULL),(119,135,133,NULL,NULL),(120,136,135,NULL,NULL),(121,137,135,NULL,NULL),(125,142,141,NULL,NULL),(126,143,142,NULL,NULL),(127,144,142,NULL,NULL),(128,145,144,NULL,NULL),(129,146,144,NULL,NULL),(130,147,141,NULL,NULL),(131,148,147,NULL,NULL),(132,149,147,NULL,NULL),(133,150,149,NULL,NULL),(134,151,149,NULL,NULL),(135,152,141,NULL,NULL),(136,153,152,NULL,NULL),(137,154,152,NULL,NULL),(138,155,154,NULL,NULL),(139,156,154,NULL,NULL),(140,157,141,NULL,NULL),(141,158,157,NULL,NULL),(142,159,157,NULL,NULL),(143,160,159,NULL,NULL),(144,161,159,NULL,NULL),(145,162,141,NULL,NULL),(146,163,162,NULL,NULL),(147,164,162,NULL,NULL),(148,165,164,NULL,NULL),(149,166,164,NULL,NULL),(150,167,141,NULL,NULL),(151,168,167,NULL,NULL),(152,169,167,NULL,NULL),(153,170,169,NULL,NULL),(154,171,169,NULL,NULL),(156,175,139,NULL,NULL),(157,176,139,NULL,NULL),(159,178,176,NULL,NULL),(160,179,178,NULL,NULL),(161,180,178,NULL,NULL),(162,181,140,NULL,NULL),(163,182,140,NULL,NULL),(164,184,183,NULL,NULL),(168,188,183,NULL,NULL),(172,192,183,NULL,NULL),(173,193,192,NULL,NULL),(174,194,193,NULL,NULL),(175,195,193,NULL,NULL),(176,196,195,NULL,NULL),(177,197,195,NULL,NULL),(178,198,192,NULL,NULL),(179,199,198,NULL,NULL),(180,200,198,NULL,NULL),(181,201,200,NULL,NULL),(182,202,200,NULL,NULL),(183,203,192,NULL,NULL),(184,204,203,NULL,NULL),(185,205,203,NULL,NULL),(186,206,205,NULL,NULL),(187,207,205,NULL,NULL),(188,208,192,NULL,NULL),(189,209,208,NULL,NULL),(190,210,208,NULL,NULL),(191,211,210,NULL,NULL),(192,212,210,NULL,NULL),(193,213,192,NULL,NULL),(194,214,213,NULL,NULL),(195,215,213,NULL,NULL),(196,216,215,NULL,NULL),(197,217,215,NULL,NULL),(198,218,192,NULL,NULL),(199,219,218,NULL,NULL),(200,220,218,NULL,NULL),(201,221,220,NULL,NULL),(202,222,220,NULL,NULL),(210,230,184,NULL,NULL),(211,231,230,NULL,NULL),(212,232,184,NULL,NULL),(214,234,232,NULL,NULL),(215,235,234,NULL,NULL),(216,236,234,NULL,NULL),(217,237,188,NULL,NULL),(219,239,237,NULL,NULL),(220,240,239,NULL,NULL),(221,241,239,NULL,NULL),(223,258,257,NULL,NULL),(224,259,258,NULL,NULL),(225,260,259,NULL,NULL),(226,261,258,NULL,NULL),(227,262,261,NULL,NULL),(228,263,262,NULL,NULL),(229,264,262,NULL,NULL),(230,265,257,NULL,NULL),(231,266,265,NULL,NULL),(232,267,266,NULL,NULL),(233,268,267,NULL,NULL),(234,269,267,NULL,NULL),(235,270,257,NULL,NULL),(236,271,270,NULL,NULL),(237,272,271,NULL,NULL),(238,273,271,NULL,NULL),(239,274,273,NULL,NULL),(240,275,273,NULL,NULL),(241,276,270,NULL,NULL),(242,277,276,NULL,NULL),(243,278,276,NULL,NULL),(244,279,278,NULL,NULL),(245,280,278,NULL,NULL),(246,281,270,NULL,NULL),(247,282,281,NULL,NULL),(248,283,281,NULL,NULL),(249,284,283,NULL,NULL),(250,285,283,NULL,NULL),(251,286,270,NULL,NULL),(252,287,286,NULL,NULL),(253,288,286,NULL,NULL),(254,289,288,NULL,NULL),(255,290,288,NULL,NULL),(256,291,270,NULL,NULL),(257,292,291,NULL,NULL),(258,293,291,NULL,NULL),(259,294,293,NULL,NULL),(260,295,293,NULL,NULL),(261,296,270,NULL,NULL),(262,297,296,NULL,NULL),(263,298,296,NULL,NULL),(264,299,298,NULL,NULL),(265,300,298,NULL,NULL);
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
INSERT INTO `roles` VALUES (1,'superadmin','api','2024-01-22 21:28:43','2024-01-22 21:28:43'),(2,'admin','api','2024-01-22 21:28:43','2024-01-22 21:28:43'),(3,'user','api','2024-01-22 21:28:43','2024-01-22 21:28:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcomponent`
--

LOCK TABLES `subcomponent` WRITE;
/*!40000 ALTER TABLE `subcomponent` DISABLE KEYS */;
INSERT INTO `subcomponent` VALUES (2,'2024-01-22 21:28:43','2024-01-22 21:28:43',3,NULL,1,NULL),(3,'2024-01-22 21:28:43','2024-01-22 21:28:43',4,NULL,2,NULL),(4,'2024-01-22 21:28:43','2024-01-22 21:28:43',5,NULL,2,NULL),(5,'2024-01-22 21:28:43','2024-01-22 21:28:43',3,NULL,1,NULL),(6,'2024-01-22 21:28:43','2024-01-22 21:28:43',6,NULL,5,NULL),(8,'2024-01-22 21:28:43','2024-01-22 21:28:43',4,NULL,7,NULL),(9,'2024-01-22 21:28:43','2024-01-22 21:28:43',5,NULL,7,NULL),(11,'2024-01-22 21:28:55','2024-01-22 21:28:55',3,NULL,10,NULL),(12,'2024-01-22 21:28:55','2024-01-22 21:28:55',4,NULL,11,NULL),(13,'2024-01-22 21:28:55','2024-01-22 21:28:55',5,NULL,11,NULL),(14,'2024-01-22 21:28:55','2024-01-22 21:28:55',3,NULL,10,NULL),(15,'2024-01-22 21:28:55','2024-01-22 21:28:55',6,NULL,14,NULL),(17,'2024-01-22 21:28:55','2024-01-22 21:28:55',4,NULL,16,NULL),(18,'2024-01-22 21:28:55','2024-01-22 21:28:55',5,NULL,16,NULL),(19,'2024-01-22 21:30:59','2024-01-22 21:30:59',6,8,NULL,NULL),(20,'2024-01-22 21:30:59','2024-01-22 21:30:59',2,8,NULL,NULL),(21,'2024-01-22 21:31:58','2024-01-22 21:31:58',4,NULL,20,NULL),(22,'2024-01-22 21:31:58','2024-01-22 21:31:58',5,NULL,20,NULL),(77,'2024-01-22 21:56:29','2024-01-22 21:56:29',8,10,NULL,NULL),(78,'2024-01-22 21:56:29','2024-01-22 21:56:29',6,NULL,77,NULL),(79,'2024-01-22 21:56:29','2024-01-22 21:56:29',2,NULL,77,NULL),(80,'2024-01-22 21:56:29','2024-01-22 21:56:29',4,NULL,79,NULL),(81,'2024-01-22 21:56:29','2024-01-22 21:56:29',5,NULL,79,NULL),(82,'2024-01-22 21:56:43','2024-01-22 21:56:43',8,10,NULL,NULL),(83,'2024-01-22 21:56:43','2024-01-22 21:56:43',6,NULL,82,NULL),(84,'2024-01-22 21:56:43','2024-01-22 21:56:43',2,NULL,82,NULL),(85,'2024-01-22 21:56:43','2024-01-22 21:56:43',4,NULL,84,NULL),(86,'2024-01-22 21:56:43','2024-01-22 21:56:43',5,NULL,84,NULL),(87,'2024-01-22 21:56:43','2024-01-22 21:56:43',8,10,NULL,NULL),(88,'2024-01-22 21:56:43','2024-01-22 21:56:43',6,NULL,87,NULL),(89,'2024-01-22 21:56:43','2024-01-22 21:56:43',2,NULL,87,NULL),(90,'2024-01-22 21:56:43','2024-01-22 21:56:43',4,NULL,89,NULL),(91,'2024-01-22 21:56:43','2024-01-22 21:56:43',5,NULL,89,NULL),(92,'2024-01-22 21:56:43','2024-01-22 21:56:43',8,10,NULL,NULL),(93,'2024-01-22 21:56:43','2024-01-22 21:56:43',6,NULL,92,NULL),(94,'2024-01-22 21:56:43','2024-01-22 21:56:43',2,NULL,92,NULL),(95,'2024-01-22 21:56:43','2024-01-22 21:56:43',4,NULL,94,NULL),(96,'2024-01-22 21:56:43','2024-01-22 21:56:43',5,NULL,94,NULL),(97,'2024-01-22 21:56:43','2024-01-22 21:56:43',8,10,NULL,NULL),(98,'2024-01-22 21:56:43','2024-01-22 21:56:43',6,NULL,97,NULL),(99,'2024-01-22 21:56:43','2024-01-22 21:56:43',2,NULL,97,NULL),(100,'2024-01-22 21:56:43','2024-01-22 21:56:43',4,NULL,99,NULL),(101,'2024-01-22 21:56:43','2024-01-22 21:56:43',5,NULL,99,NULL),(102,'2024-01-22 21:56:43','2024-01-22 21:56:43',8,10,NULL,NULL),(103,'2024-01-22 21:56:43','2024-01-22 21:56:43',6,NULL,102,NULL),(104,'2024-01-22 21:56:43','2024-01-22 21:56:43',2,NULL,102,NULL),(105,'2024-01-22 21:56:43','2024-01-22 21:56:43',4,NULL,104,NULL),(106,'2024-01-22 21:56:43','2024-01-22 21:56:43',5,NULL,104,NULL),(108,'2024-01-22 21:57:30','2024-01-22 21:57:30',8,NULL,107,NULL),(109,'2024-01-22 21:57:30','2024-01-22 21:57:30',6,NULL,108,NULL),(110,'2024-01-22 21:57:30','2024-01-22 21:57:30',2,NULL,108,NULL),(111,'2024-01-22 21:57:30','2024-01-22 21:57:30',4,NULL,110,NULL),(112,'2024-01-22 21:57:30','2024-01-22 21:57:30',5,NULL,110,NULL),(113,'2024-01-22 21:57:30','2024-01-22 21:57:30',8,NULL,107,NULL),(114,'2024-01-22 21:57:30','2024-01-22 21:57:30',6,NULL,113,NULL),(115,'2024-01-22 21:57:30','2024-01-22 21:57:30',2,NULL,113,NULL),(116,'2024-01-22 21:57:30','2024-01-22 21:57:30',4,NULL,115,NULL),(117,'2024-01-22 21:57:30','2024-01-22 21:57:30',5,NULL,115,NULL),(118,'2024-01-22 21:57:30','2024-01-22 21:57:30',8,NULL,107,NULL),(119,'2024-01-22 21:57:30','2024-01-22 21:57:30',6,NULL,118,NULL),(120,'2024-01-22 21:57:30','2024-01-22 21:57:30',2,NULL,118,NULL),(121,'2024-01-22 21:57:30','2024-01-22 21:57:30',4,NULL,120,NULL),(122,'2024-01-22 21:57:30','2024-01-22 21:57:30',5,NULL,120,NULL),(123,'2024-01-22 21:57:30','2024-01-22 21:57:30',8,NULL,107,NULL),(124,'2024-01-22 21:57:30','2024-01-22 21:57:30',6,NULL,123,NULL),(125,'2024-01-22 21:57:30','2024-01-22 21:57:30',2,NULL,123,NULL),(126,'2024-01-22 21:57:30','2024-01-22 21:57:30',4,NULL,125,NULL),(127,'2024-01-22 21:57:30','2024-01-22 21:57:30',5,NULL,125,NULL),(128,'2024-01-22 21:57:30','2024-01-22 21:57:30',8,NULL,107,NULL),(129,'2024-01-22 21:57:30','2024-01-22 21:57:30',6,NULL,128,NULL),(130,'2024-01-22 21:57:30','2024-01-22 21:57:30',2,NULL,128,NULL),(131,'2024-01-22 21:57:30','2024-01-22 21:57:30',4,NULL,130,NULL),(132,'2024-01-22 21:57:30','2024-01-22 21:57:30',5,NULL,130,NULL),(133,'2024-01-22 21:57:30','2024-01-22 21:57:30',8,NULL,107,NULL),(134,'2024-01-22 21:57:30','2024-01-22 21:57:30',6,NULL,133,NULL),(135,'2024-01-22 21:57:30','2024-01-22 21:57:30',2,NULL,133,NULL),(136,'2024-01-22 21:57:30','2024-01-22 21:57:30',4,NULL,135,NULL),(137,'2024-01-22 21:57:30','2024-01-22 21:57:30',5,NULL,135,NULL),(139,'2024-01-23 00:39:01','2024-01-23 00:39:01',2,NULL,138,NULL),(140,'2024-01-23 00:39:40','2024-01-23 00:39:40',2,NULL,138,NULL),(141,'2024-01-23 00:39:58','2024-01-23 00:39:58',10,NULL,138,NULL),(142,'2024-01-23 00:39:58','2024-01-23 00:39:58',8,NULL,141,NULL),(143,'2024-01-23 00:39:58','2024-01-23 00:39:58',6,NULL,142,NULL),(144,'2024-01-23 00:39:58','2024-01-23 00:39:58',2,NULL,142,NULL),(145,'2024-01-23 00:39:58','2024-01-23 00:39:58',4,NULL,144,NULL),(146,'2024-01-23 00:39:58','2024-01-23 00:39:58',5,NULL,144,NULL),(147,'2024-01-23 00:39:58','2024-01-23 00:39:58',8,NULL,141,NULL),(148,'2024-01-23 00:39:58','2024-01-23 00:39:58',6,NULL,147,NULL),(149,'2024-01-23 00:39:58','2024-01-23 00:39:58',2,NULL,147,NULL),(150,'2024-01-23 00:39:58','2024-01-23 00:39:58',4,NULL,149,NULL),(151,'2024-01-23 00:39:58','2024-01-23 00:39:58',5,NULL,149,NULL),(152,'2024-01-23 00:39:58','2024-01-23 00:39:58',8,NULL,141,NULL),(153,'2024-01-23 00:39:58','2024-01-23 00:39:58',6,NULL,152,NULL),(154,'2024-01-23 00:39:58','2024-01-23 00:39:58',2,NULL,152,NULL),(155,'2024-01-23 00:39:58','2024-01-23 00:39:58',4,NULL,154,NULL),(156,'2024-01-23 00:39:58','2024-01-23 00:39:58',5,NULL,154,NULL),(157,'2024-01-23 00:39:58','2024-01-23 00:39:58',8,NULL,141,NULL),(158,'2024-01-23 00:39:58','2024-01-23 00:39:58',6,NULL,157,NULL),(159,'2024-01-23 00:39:58','2024-01-23 00:39:58',2,NULL,157,NULL),(160,'2024-01-23 00:39:58','2024-01-23 00:39:58',4,NULL,159,NULL),(161,'2024-01-23 00:39:58','2024-01-23 00:39:58',5,NULL,159,NULL),(162,'2024-01-23 00:39:58','2024-01-23 00:39:58',8,NULL,141,NULL),(163,'2024-01-23 00:39:58','2024-01-23 00:39:58',6,NULL,162,NULL),(164,'2024-01-23 00:39:58','2024-01-23 00:39:58',2,NULL,162,NULL),(165,'2024-01-23 00:39:58','2024-01-23 00:39:58',4,NULL,164,NULL),(166,'2024-01-23 00:39:58','2024-01-23 00:39:58',5,NULL,164,NULL),(167,'2024-01-23 00:39:58','2024-01-23 00:39:58',8,NULL,141,NULL),(168,'2024-01-23 00:39:58','2024-01-23 00:39:58',6,NULL,167,NULL),(169,'2024-01-23 00:39:58','2024-01-23 00:39:58',2,NULL,167,NULL),(170,'2024-01-23 00:39:58','2024-01-23 00:39:58',4,NULL,169,NULL),(171,'2024-01-23 00:39:59','2024-01-23 00:39:59',5,NULL,169,NULL),(175,'2024-01-23 01:03:43','2024-01-23 01:03:43',6,NULL,139,NULL),(176,'2024-01-23 01:04:03','2024-01-23 01:04:03',8,NULL,139,NULL),(178,'2024-01-23 01:04:03','2024-01-23 01:04:03',2,NULL,176,NULL),(179,'2024-01-23 01:04:03','2024-01-23 01:04:03',4,NULL,178,NULL),(180,'2024-01-23 01:04:03','2024-01-23 01:04:03',5,NULL,178,NULL),(181,'2024-01-23 01:11:00','2024-01-23 01:11:00',4,NULL,140,NULL),(182,'2024-01-23 01:11:15','2024-01-23 01:11:15',5,NULL,140,NULL),(183,'2024-01-23 01:23:39','2024-01-23 01:23:39',14,13,NULL,NULL),(184,'2024-01-23 01:25:18','2024-01-24 00:24:55',2,NULL,183,0),(188,'2024-01-23 01:26:38','2024-01-24 00:25:13',2,NULL,183,1),(192,'2024-01-23 01:26:53','2024-01-24 00:25:13',10,NULL,183,2),(193,'2024-01-23 01:26:53','2024-01-24 00:17:34',8,NULL,192,2),(194,'2024-01-23 01:26:53','2024-01-23 01:26:53',6,NULL,193,NULL),(195,'2024-01-23 01:26:53','2024-01-23 01:26:53',2,NULL,193,NULL),(196,'2024-01-23 01:26:53','2024-01-23 01:26:53',4,NULL,195,NULL),(197,'2024-01-23 01:26:53','2024-01-23 01:26:53',5,NULL,195,NULL),(198,'2024-01-23 01:26:53','2024-01-24 00:17:34',8,NULL,192,0),(199,'2024-01-23 01:26:53','2024-01-23 01:26:53',6,NULL,198,NULL),(200,'2024-01-23 01:26:53','2024-01-23 01:26:53',2,NULL,198,NULL),(201,'2024-01-23 01:26:53','2024-01-23 01:26:53',4,NULL,200,NULL),(202,'2024-01-23 01:26:53','2024-01-23 01:26:53',5,NULL,200,NULL),(203,'2024-01-23 01:26:53','2024-01-24 00:17:34',8,NULL,192,1),(204,'2024-01-23 01:26:53','2024-01-23 01:26:53',6,NULL,203,NULL),(205,'2024-01-23 01:26:53','2024-01-23 01:26:53',2,NULL,203,NULL),(206,'2024-01-23 01:26:53','2024-01-23 01:26:53',4,NULL,205,NULL),(207,'2024-01-23 01:26:53','2024-01-23 01:26:53',5,NULL,205,NULL),(208,'2024-01-23 01:26:53','2024-01-24 00:17:34',8,NULL,192,3),(209,'2024-01-23 01:26:54','2024-01-23 01:26:54',6,NULL,208,NULL),(210,'2024-01-23 01:26:54','2024-01-23 01:26:54',2,NULL,208,NULL),(211,'2024-01-23 01:26:54','2024-01-23 01:26:54',4,NULL,210,NULL),(212,'2024-01-23 01:26:54','2024-01-23 01:26:54',5,NULL,210,NULL),(213,'2024-01-23 01:26:54','2024-01-24 00:17:34',8,NULL,192,4),(214,'2024-01-23 01:26:54','2024-01-23 01:26:54',6,NULL,213,NULL),(215,'2024-01-23 01:26:54','2024-01-23 01:26:54',2,NULL,213,NULL),(216,'2024-01-23 01:26:54','2024-01-23 01:26:54',4,NULL,215,NULL),(217,'2024-01-23 01:26:54','2024-01-23 01:26:54',5,NULL,215,NULL),(218,'2024-01-23 01:26:54','2024-01-24 00:17:34',8,NULL,192,5),(219,'2024-01-23 01:26:54','2024-01-23 01:26:54',6,NULL,218,NULL),(220,'2024-01-23 01:26:54','2024-01-23 01:26:54',2,NULL,218,NULL),(221,'2024-01-23 01:26:54','2024-01-23 01:26:54',4,NULL,220,NULL),(222,'2024-01-23 01:26:54','2024-01-23 01:26:54',5,NULL,220,NULL),(230,'2024-01-23 14:03:14','2024-01-24 00:25:08',3,NULL,184,0),(231,'2024-01-23 14:03:32','2024-01-23 14:03:32',6,NULL,230,NULL),(232,'2024-01-23 14:07:44','2024-01-24 00:25:08',8,NULL,184,1),(234,'2024-01-23 14:07:44','2024-01-23 14:07:44',2,NULL,232,NULL),(235,'2024-01-23 14:07:44','2024-01-23 14:07:44',4,NULL,234,NULL),(236,'2024-01-23 14:07:44','2024-01-23 14:07:44',5,NULL,234,NULL),(237,'2024-01-23 14:32:16','2024-01-23 14:32:16',8,NULL,188,NULL),(239,'2024-01-23 14:32:16','2024-01-24 00:22:56',2,NULL,237,0),(240,'2024-01-23 14:32:16','2024-01-23 14:32:16',4,NULL,239,NULL),(241,'2024-01-23 14:32:16','2024-01-23 14:32:16',5,NULL,239,NULL),(242,'2024-01-23 14:42:26','2024-01-23 14:42:26',3,2,NULL,NULL),(245,'2024-01-23 23:17:55','2024-01-23 23:17:55',4,3,NULL,NULL),(246,'2024-01-23 23:18:02','2024-01-23 23:18:02',5,3,NULL,NULL),(249,'2024-01-24 00:45:54','2024-01-24 02:23:13',19,15,NULL,0),(251,'2024-01-24 02:10:47','2024-01-24 02:23:13',5,15,NULL,1),(252,'2024-01-24 02:14:27','2024-01-24 04:14:02',19,20,NULL,1),(253,'2024-01-24 02:14:27','2024-01-24 04:14:02',5,20,NULL,2),(255,'2024-01-24 03:53:01','2024-01-24 04:14:00',23,20,NULL,0),(257,'2024-01-30 14:09:19','2024-01-30 14:09:19',14,25,NULL,NULL),(258,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,257,NULL),(259,'2024-01-30 14:09:19','2024-01-30 14:09:19',3,NULL,258,NULL),(260,'2024-01-30 14:09:19','2024-01-30 14:09:19',6,NULL,259,NULL),(261,'2024-01-30 14:09:19','2024-01-30 14:09:19',8,NULL,258,NULL),(262,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,261,NULL),(263,'2024-01-30 14:09:19','2024-01-30 14:09:19',4,NULL,262,NULL),(264,'2024-01-30 14:09:19','2024-01-30 14:09:19',5,NULL,262,NULL),(265,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,257,NULL),(266,'2024-01-30 14:09:19','2024-01-30 14:09:19',8,NULL,265,NULL),(267,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,266,NULL),(268,'2024-01-30 14:09:19','2024-01-30 14:09:19',4,NULL,267,NULL),(269,'2024-01-30 14:09:19','2024-01-30 14:09:19',5,NULL,267,NULL),(270,'2024-01-30 14:09:19','2024-01-30 14:09:19',10,NULL,257,NULL),(271,'2024-01-30 14:09:19','2024-01-30 14:09:19',8,NULL,270,NULL),(272,'2024-01-30 14:09:19','2024-01-30 14:09:19',6,NULL,271,NULL),(273,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,271,NULL),(274,'2024-01-30 14:09:19','2024-01-30 14:09:19',4,NULL,273,NULL),(275,'2024-01-30 14:09:19','2024-01-30 14:09:19',5,NULL,273,NULL),(276,'2024-01-30 14:09:19','2024-01-30 14:09:19',8,NULL,270,NULL),(277,'2024-01-30 14:09:19','2024-01-30 14:09:19',6,NULL,276,NULL),(278,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,276,NULL),(279,'2024-01-30 14:09:19','2024-01-30 14:09:19',4,NULL,278,NULL),(280,'2024-01-30 14:09:19','2024-01-30 14:09:19',5,NULL,278,NULL),(281,'2024-01-30 14:09:19','2024-01-30 14:09:19',8,NULL,270,NULL),(282,'2024-01-30 14:09:19','2024-01-30 14:09:19',6,NULL,281,NULL),(283,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,281,NULL),(284,'2024-01-30 14:09:19','2024-01-30 14:09:19',4,NULL,283,NULL),(285,'2024-01-30 14:09:19','2024-01-30 14:09:19',5,NULL,283,NULL),(286,'2024-01-30 14:09:19','2024-01-30 14:09:19',8,NULL,270,NULL),(287,'2024-01-30 14:09:19','2024-01-30 14:09:19',6,NULL,286,NULL),(288,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,286,NULL),(289,'2024-01-30 14:09:19','2024-01-30 14:09:19',4,NULL,288,NULL),(290,'2024-01-30 14:09:19','2024-01-30 14:09:19',5,NULL,288,NULL),(291,'2024-01-30 14:09:19','2024-01-30 14:09:19',8,NULL,270,NULL),(292,'2024-01-30 14:09:19','2024-01-30 14:09:19',6,NULL,291,NULL),(293,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,291,NULL),(294,'2024-01-30 14:09:19','2024-01-30 14:09:19',4,NULL,293,NULL),(295,'2024-01-30 14:09:19','2024-01-30 14:09:19',5,NULL,293,NULL),(296,'2024-01-30 14:09:19','2024-01-30 14:09:19',8,NULL,270,NULL),(297,'2024-01-30 14:09:19','2024-01-30 14:09:19',6,NULL,296,NULL),(298,'2024-01-30 14:09:19','2024-01-30 14:09:19',2,NULL,296,NULL),(299,'2024-01-30 14:09:19','2024-01-30 14:09:19',4,NULL,298,NULL),(300,'2024-01-30 14:09:19','2024-01-30 14:09:19',5,NULL,298,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcomponent_attribute`
--

LOCK TABLES `subcomponent_attribute` WRITE;
/*!40000 ALTER TABLE `subcomponent_attribute` DISABLE KEYS */;
INSERT INTO `subcomponent_attribute` VALUES (1,'2024-01-22 21:28:43','2024-01-22 21:28:43','styles','bg-white border-4 border-red-200',2),(2,'2024-01-22 21:28:43','2024-01-22 21:28:43','text_label','Marketdddddddddddding wssssssssebsite done with Astro',3),(3,'2024-01-22 21:28:43','2024-01-22 21:28:43','styles','text-lg mt-4 text-slate-600 max-w-xl',4),(4,'2024-01-22 21:28:43','2024-01-22 21:28:43','styles','flex w-full py-6 md:order-1 hidden md:block',5),(6,'2024-01-22 21:28:43','2024-01-22 21:28:43','text_label','Everything you need to start a website',8),(7,'2024-01-22 21:28:43','2024-01-22 21:28:43','text_label','Astro comes batteries included. It takes the best parts of state-of-the-art tools and adds its own innovations.',9),(9,'2024-01-22 21:28:55','2024-01-22 21:28:55','text_label','Markfffffffffffeting website done with Astro',12),(10,'2024-01-22 21:28:55','2024-01-22 21:28:55','styles','text-lg mt-4 text-slate-600 max-w-xl',13),(11,'2024-01-22 21:28:55','2024-01-22 21:28:55','styles','flex w-full py-6 md:order-1 hidden md:block',14),(12,'2024-01-22 21:28:55','2024-01-22 21:28:55','text_label','Everything you need to start a website',17),(13,'2024-01-22 21:28:55','2024-01-22 21:28:55','text_label','Astro comes batteries included. It takes the best parts of state-of-the-art tools and adds its own innovations.',18),(14,'2024-01-22 21:31:19','2024-01-22 21:31:19','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',19),(15,'2024-01-22 21:32:21','2024-01-22 21:32:21','styles','font-semibold text-lg',21),(16,'2024-01-22 21:32:21','2024-01-22 21:32:21','text_label','On-Demand Components',21),(17,'2024-01-22 21:32:32','2024-01-22 21:32:32','styles','text-slate-500 mt-2 leading-relaxed',22),(18,'2024-01-22 21:32:32','2024-01-22 21:32:32','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',22),(19,'2024-01-22 21:33:24','2024-01-22 21:34:12','styles','flex flex-col',20),(74,'2024-01-22 21:56:29','2024-01-22 21:56:29','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',78),(75,'2024-01-22 21:56:29','2024-01-22 21:56:29','styles','flex flex-col',79),(76,'2024-01-22 21:56:29','2024-01-22 21:56:29','styles','font-semibold text-lg',80),(77,'2024-01-22 21:56:29','2024-01-22 21:56:29','text_label','On-Demand Components',80),(78,'2024-01-22 21:56:29','2024-01-22 21:56:29','styles','text-slate-500 mt-2 leading-relaxed',81),(79,'2024-01-22 21:56:29','2024-01-22 21:56:29','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',81),(80,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',83),(81,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','flex flex-col',84),(82,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','font-semibold text-lg',85),(83,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','On-Demand Components',85),(84,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','text-slate-500 mt-2 leading-relaxed',86),(85,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',86),(86,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',88),(87,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','flex flex-col',89),(88,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','font-semibold text-lg',90),(89,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','On-Demand Components',90),(90,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','text-slate-500 mt-2 leading-relaxed',91),(91,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',91),(92,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',93),(93,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','flex flex-col',94),(94,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','font-semibold text-lg',95),(95,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','On-Demand Components',95),(96,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','text-slate-500 mt-2 leading-relaxed',96),(97,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',96),(98,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',98),(99,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','flex flex-col',99),(100,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','font-semibold text-lg',100),(101,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','On-Demand Components',100),(102,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','text-slate-500 mt-2 leading-relaxed',101),(103,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',101),(104,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',103),(105,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','flex flex-col',104),(106,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','font-semibold text-lg',105),(107,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','On-Demand Components',105),(108,'2024-01-22 21:56:43','2024-01-22 21:56:43','styles','text-slate-500 mt-2 leading-relaxed',106),(109,'2024-01-22 21:56:43','2024-01-22 21:56:43','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',106),(110,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',109),(111,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','flex flex-col',110),(112,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','font-semibold text-lg',111),(113,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','On-Demand Components',111),(114,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','text-slate-500 mt-2 leading-relaxed',112),(115,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',112),(116,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',114),(117,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','flex flex-col',115),(118,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','font-semibold text-lg',116),(119,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','On-Demand Components',116),(120,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','text-slate-500 mt-2 leading-relaxed',117),(121,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',117),(122,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',119),(123,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','flex flex-col',120),(124,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','font-semibold text-lg',121),(125,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','On-Demand Components',121),(126,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','text-slate-500 mt-2 leading-relaxed',122),(127,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',122),(128,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',124),(129,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','flex flex-col',125),(130,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','font-semibold text-lg',126),(131,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','On-Demand Components',126),(132,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','text-slate-500 mt-2 leading-relaxed',127),(133,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',127),(134,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',129),(135,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','flex flex-col',130),(136,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','font-semibold text-lg',131),(137,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','On-Demand Components',131),(138,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','text-slate-500 mt-2 leading-relaxed',132),(139,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',132),(140,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',134),(141,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','flex flex-col',135),(142,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','font-semibold text-lg',136),(143,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','On-Demand Components',136),(144,'2024-01-22 21:57:30','2024-01-22 21:57:30','styles','text-slate-500 mt-2 leading-relaxed',137),(145,'2024-01-22 21:57:30','2024-01-22 21:57:30','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',137),(146,'2024-01-22 22:02:09','2024-01-22 22:02:09','text_label','Astroship is a starter template for startupsdddd, masrketing websites & landing pages. Built with Astro.build and TailwindCSS. You can quickly create any website with this starter.',13),(147,'2024-01-22 22:02:52','2024-01-22 22:02:52','styles','text-4xl lg:text-5xl font-bold lg:tracking-tight',17),(148,'2024-01-22 22:02:59','2024-01-22 22:03:14','styles','text-lg mt-4 text-slate-600',18),(149,'2024-01-22 22:03:32','2024-01-22 22:03:32','styles','text-5xl lg:text-6xl xl:text-7xl font-bold lg:tracking-tight xl:tracking-tighter',12),(150,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',143),(151,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','flex flex-col',144),(152,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','font-semibold text-lg',145),(153,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','On-Demand Components',145),(154,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','text-slate-500 mt-2 leading-relaxed',146),(155,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',146),(156,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',148),(157,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','flex flex-col',149),(158,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','font-semibold text-lg',150),(159,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','On-Demand Components',150),(160,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','text-slate-500 mt-2 leading-relaxed',151),(161,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',151),(162,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',153),(163,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','flex flex-col',154),(164,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','font-semibold text-lg',155),(165,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','On-Demand Components',155),(166,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','text-slate-500 mt-2 leading-relaxed',156),(167,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',156),(168,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',158),(169,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','flex flex-col',159),(170,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','font-semibold text-lg',160),(171,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','On-Demand Components',160),(172,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','text-slate-500 mt-2 leading-relaxed',161),(173,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',161),(174,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',163),(175,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','flex flex-col',164),(176,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','font-semibold text-lg',165),(177,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','On-Demand Components',165),(178,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','text-slate-500 mt-2 leading-relaxed',166),(179,'2024-01-23 00:39:58','2024-01-23 00:39:58','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',166),(180,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',168),(181,'2024-01-23 00:39:58','2024-01-23 00:39:58','styles','flex flex-col',169),(182,'2024-01-23 00:39:59','2024-01-23 00:39:59','styles','font-semibold text-lg',170),(183,'2024-01-23 00:39:59','2024-01-23 00:39:59','text_label','On-Demand Components',170),(184,'2024-01-23 00:39:59','2024-01-23 00:39:59','styles','text-slate-500 mt-2 leading-relaxed',171),(185,'2024-01-23 00:39:59','2024-01-23 00:39:59','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',171),(187,'2024-01-23 01:04:03','2024-01-23 01:04:03','styles','flex flex-col',178),(188,'2024-01-23 01:04:03','2024-01-23 01:06:35','styles','text-5xl lg:text-6xl xl:text-7xl font-bold lg:tracking-tight xl:tracking-tighter',179),(189,'2024-01-23 01:04:03','2024-01-23 01:05:36','text_label','Marketing website done with Astro',179),(190,'2024-01-23 01:04:03','2024-01-23 01:06:53','styles','text-lg mt-4 text-slate-600 max-w-xl',180),(191,'2024-01-23 01:04:03','2024-01-23 01:05:48','text_label','Astroship is a starter template for startups, marketing websites & landing pages. Built with Astro.build and TailwindCSS. You can quickly create any website with this starter.',180),(192,'2024-01-23 01:04:55','2024-01-23 01:05:09','styles','w-full h-full py-6 md:order-1 hidden md:block',175),(193,'2024-01-23 01:11:00','2024-01-23 01:11:00','styles','mt-16 md:mt-0',140),(194,'2024-01-23 01:11:28','2024-01-23 01:11:28','text_label','Everything you need to start a website',181),(195,'2024-01-23 01:11:32','2024-01-23 01:11:32','text_label','Astro comes batteries included. It takes the best parts of state-of-the-art tools and adds its own innovations.',182),(196,'2024-01-23 01:11:43','2024-01-23 01:11:43','styles','text-4xl lg:text-5xl font-bold lg:tracking-tight',181),(197,'2024-01-23 01:11:56','2024-01-23 01:11:56','styles','text-lg mt-4 text-slate-600',182),(199,'2024-01-23 01:26:53','2024-01-23 01:26:53','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',194),(200,'2024-01-23 01:26:53','2024-01-23 01:26:53','styles','flex flex-col',195),(201,'2024-01-23 01:26:53','2024-01-23 01:26:53','styles','font-semibold text-lg',196),(202,'2024-01-23 01:26:53','2024-01-24 00:23:28','text_label','d',196),(203,'2024-01-23 01:26:53','2024-01-23 14:30:35','styles','text-slate-200 mt-2 leading-relaxed',197),(204,'2024-01-23 01:26:53','2024-01-23 14:33:15','text_label','Build your site using React, Svelte, Vue, Preact, web components, or just plain ol\' HTML + JavaScript.',197),(205,'2024-01-23 01:26:53','2024-01-23 01:26:53','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',199),(206,'2024-01-23 01:26:53','2024-01-23 01:26:53','styles','flex flex-col',200),(207,'2024-01-23 01:26:53','2024-01-23 01:26:53','styles','font-semibold text-lg',201),(208,'2024-01-23 01:26:53','2024-01-23 01:26:53','text_label','On-Demand Components',201),(209,'2024-01-23 01:26:53','2024-01-23 14:30:17','styles','text-slate-200 mt-2 leading-relaxed',202),(210,'2024-01-23 01:26:53','2024-01-23 01:26:53','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',202),(211,'2024-01-23 01:26:53','2024-01-23 01:26:53','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',204),(212,'2024-01-23 01:26:53','2024-01-23 01:26:53','styles','flex flex-col',205),(213,'2024-01-23 01:26:53','2024-01-23 01:26:53','styles','font-semibold text-lg',206),(214,'2024-01-23 01:26:53','2024-01-23 01:26:53','text_label','On-Demand Components',206),(215,'2024-01-23 01:26:53','2024-01-23 14:30:31','styles','text-slate-200 mt-2 leading-relaxed',207),(216,'2024-01-23 01:26:53','2024-01-23 01:26:53','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',207),(217,'2024-01-23 01:26:54','2024-01-23 01:26:54','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',209),(218,'2024-01-23 01:26:54','2024-01-23 01:26:54','styles','flex flex-col',210),(219,'2024-01-23 01:26:54','2024-01-23 01:26:54','styles','font-semibold text-lg',211),(220,'2024-01-23 01:26:54','2024-01-23 01:26:54','text_label','On-Demand Components',211),(221,'2024-01-23 01:26:54','2024-01-23 14:30:48','styles','text-slate-200 mt-2 leading-relaxed',212),(222,'2024-01-23 01:26:54','2024-01-23 01:26:54','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',212),(223,'2024-01-23 01:26:54','2024-01-23 01:26:54','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',214),(224,'2024-01-23 01:26:54','2024-01-23 01:26:54','styles','flex flex-col',215),(225,'2024-01-23 01:26:54','2024-01-23 01:26:54','styles','font-semibold text-lg',216),(226,'2024-01-23 01:26:54','2024-01-23 01:26:54','text_label','On-Demand Components',216),(227,'2024-01-23 01:26:54','2024-01-23 14:30:44','styles','text-slate-200 mt-2 leading-relaxed',217),(228,'2024-01-23 01:26:54','2024-01-23 01:26:54','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',217),(229,'2024-01-23 01:26:54','2024-01-23 01:26:54','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',219),(230,'2024-01-23 01:26:54','2024-01-23 01:26:54','styles','flex flex-col',220),(231,'2024-01-23 01:26:54','2024-01-23 01:26:54','styles','font-semibold text-lg',221),(232,'2024-01-23 01:26:54','2024-01-23 01:26:54','text_label','On-Demand Components',221),(233,'2024-01-23 01:26:54','2024-01-23 14:30:39','styles','text-slate-200 mt-2 leading-relaxed',222),(234,'2024-01-23 01:26:54','2024-01-23 01:26:54','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',222),(242,'2024-01-23 14:03:41','2024-01-23 14:12:28','styles','w-full h-full py-6 md:order-1 hidden md:block',230),(244,'2024-01-23 14:07:44','2024-01-23 14:07:44','styles','flex flex-col',234),(245,'2024-01-23 14:07:44','2024-01-23 14:11:44','styles','text-5xl lg:text-6xl xl:text-7xl font-bold lg:tracking-tight xl:tracking-tighter',235),(246,'2024-01-23 14:07:44','2024-01-24 00:57:09','text_label','Marketingddd website done with Astro',235),(247,'2024-01-23 14:07:44','2024-01-23 14:11:28','styles','text-lg mt-4 text-slate-600 max-w-xl',236),(248,'2024-01-23 14:07:44','2024-01-23 15:07:40','text_label','💡 Astroship is a starter template for startups, marketing websites & landing pages. Built with Astro.build and TailwindCSS. You can quickly create any website with this starter.',236),(250,'2024-01-23 14:32:16','2024-01-23 14:32:16','styles','flex flex-col',239),(252,'2024-01-23 14:32:16','2024-01-23 15:09:37','text_label','⛏️ Everything you need to start a website',240),(253,'2024-01-23 14:32:16','2024-01-23 14:32:16','styles','text-slate-500 mt-2 leading-relaxed',241),(254,'2024-01-23 14:32:16','2024-01-23 14:32:51','text_label','Astro comes batteries included. It takes the best parts of state-of-the-art tools and adds its own innovations.',241),(255,'2024-01-23 14:32:30','2024-01-23 14:32:30','styles','w-full',188),(258,'2024-01-24 02:10:55','2024-01-24 02:10:55','text_label','Some quick example text to build on the card title and make up the bulk of the card\'s content.',251),(259,'2024-01-24 02:15:33','2024-01-24 02:15:33','styles','font-semibold text-3xl md:text-4xl xl:text-5xl  text-textSecondary',252),(260,'2024-01-24 02:16:03','2024-01-24 02:17:46','styles','text-textTertiary mt-2 leading-relaxed',253),(264,'2024-01-24 04:02:39','2024-01-24 04:02:39','img_url','rhino.png',255),(265,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','w-full h-full py-6 md:order-1 hidden md:block',259),(266,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','flex flex-col',262),(267,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','text-5xl lg:text-6xl xl:text-7xl font-bold lg:tracking-tight xl:tracking-tighter',263),(268,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','Marketingddd website done with Astro',263),(269,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','text-lg mt-4 text-slate-600 max-w-xl',264),(270,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','💡 Astroship is a starter template for startups, marketing websites & landing pages. Built with Astro.build and TailwindCSS. You can quickly create any website with this starter.',264),(271,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','w-full',265),(272,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','flex flex-col',267),(273,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','⛏️ Everything you need to start a website',268),(274,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','text-slate-500 mt-2 leading-relaxed',269),(275,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','Astro comes batteries included. It takes the best parts of state-of-the-art tools and adds its own innovations.',269),(276,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',272),(277,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','flex flex-col',273),(278,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','font-semibold text-lg',274),(279,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','On-Demand Components',274),(280,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','text-slate-200 mt-2 leading-relaxed',275),(281,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',275),(282,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',277),(283,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','flex flex-col',278),(284,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','font-semibold text-lg',279),(285,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','On-Demand Components',279),(286,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','text-slate-200 mt-2 leading-relaxed',280),(287,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',280),(288,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',282),(289,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','flex flex-col',283),(290,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','font-semibold text-lg',284),(291,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','d',284),(292,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','text-slate-200 mt-2 leading-relaxed',285),(293,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','Build your site using React, Svelte, Vue, Preact, web components, or just plain ol\' HTML + JavaScript.',285),(294,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',287),(295,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','flex flex-col',288),(296,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','font-semibold text-lg',289),(297,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','On-Demand Components',289),(298,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','text-slate-200 mt-2 leading-relaxed',290),(299,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',290),(300,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',292),(301,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','flex flex-col',293),(302,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','font-semibold text-lg',294),(303,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','On-Demand Components',294),(304,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','text-slate-200 mt-2 leading-relaxed',295),(305,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',295),(306,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','mt-1 bg-black rounded-full  p-2 w-8 h-8 shrink-0',297),(307,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','flex flex-col',298),(308,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','font-semibold text-lg',299),(309,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','On-Demand Components',299),(310,'2024-01-30 14:09:19','2024-01-30 14:09:19','styles','text-slate-200 mt-2 leading-relaxed',300),(311,'2024-01-30 14:09:19','2024-01-30 14:09:19','text_label','Need some JS? Astro can automatically hydrate interactive components when they become visible on the page.',300);
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
INSERT INTO `users` VALUES (1,'superadmin','superadmin@gmail.com',NULL,'$2y$10$cMBwXY3/VwvuK6u.Dhg7iu2nHank0nuwXP.02mRTWmfsGAEWEmWjW','977502170','Calle','super','admin',NULL,'2024-01-22 21:28:43','2024-01-22 21:28:43');
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

-- Dump completed on 2024-01-30 14:09:42
