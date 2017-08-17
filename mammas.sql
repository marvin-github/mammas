-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: mammas
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
INSERT INTO `invoice_items` VALUES (1,37,1,99),(2,38,1,99),(3,39,1,99),(4,57,1,1),(5,60,1,1),(6,61,1,12),(7,61,2,12),(8,66,1,2),(9,67,1,2),(10,67,2,3),(11,68,1,4),(12,68,2,5);
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime DEFAULT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `debit` decimal(11,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upc` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra_cases` int(11) DEFAULT NULL,
  `extended_cost` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (15,'2017-07-26 00:00:00',1,1.00,NULL,1222,3,NULL,'2017-08-05 19:45:56',NULL,NULL,NULL,NULL),(16,'2017-07-26 00:00:00',2,12.00,3.00,2,3,NULL,'2017-08-06 01:36:22','surfs up','',NULL,34.00),(17,'2017-07-28 00:00:00',1,1.00,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(18,'2017-07-29 00:00:00',1,1.00,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL),(19,'2017-07-29 00:00:00',1,2.00,NULL,2,3,NULL,NULL,NULL,NULL,NULL,NULL),(20,'2017-07-29 00:00:00',1,2.00,NULL,2,3,NULL,NULL,NULL,NULL,NULL,NULL),(21,'2017-07-29 00:00:00',1,1.00,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(22,'2017-07-29 00:00:00',2,1.00,1.00,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL),(23,'2017-07-29 00:00:00',1,1.00,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(24,'2017-07-29 00:00:00',1,1.00,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(25,'2017-07-29 00:00:00',1,4.00,NULL,4,3,NULL,NULL,NULL,NULL,NULL,NULL),(26,'2017-07-29 00:00:00',1,1.00,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(27,'2017-07-29 00:00:00',1,1.00,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(28,'2017-07-29 00:00:00',1,1.00,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(29,'2017-07-29 00:00:00',1,1.00,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL),(30,'2017-07-29 00:00:00',1,22.00,NULL,22,3,NULL,NULL,NULL,NULL,NULL,NULL),(31,'2017-07-29 00:00:00',1,2.00,2.00,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL),(32,'2017-08-05 00:00:00',3,2.00,NULL,22,3,'2017-08-05 19:30:01','2017-08-05 19:30:01',NULL,NULL,NULL,NULL),(33,'2017-08-05 00:00:00',2,2.00,NULL,333,3,'2017-08-05 19:31:56','2017-08-05 19:32:06',NULL,NULL,NULL,NULL),(34,'2017-08-14 00:00:00',8,NULL,NULL,NULL,3,'2017-08-15 00:56:30','2017-08-15 00:56:30','',NULL,NULL,NULL),(35,'2017-08-14 00:00:00',1,NULL,NULL,NULL,3,'2017-08-15 01:04:26','2017-08-15 01:04:26','',NULL,NULL,NULL),(36,'2017-08-14 00:00:00',1,NULL,NULL,NULL,3,'2017-08-15 01:16:47','2017-08-15 01:16:47','',NULL,NULL,NULL),(37,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 00:22:53','2017-08-16 00:22:53','',NULL,NULL,NULL),(38,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 00:23:47','2017-08-16 00:23:47','',NULL,NULL,NULL),(39,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 00:28:08','2017-08-16 00:28:08','',NULL,NULL,NULL),(40,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 00:42:41','2017-08-16 00:42:41','',NULL,NULL,NULL),(41,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 00:44:40','2017-08-16 00:44:40','',NULL,NULL,NULL),(42,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 00:46:27','2017-08-16 00:46:27','',NULL,NULL,NULL),(43,'2017-08-15 00:00:00',2,NULL,NULL,NULL,3,'2017-08-16 00:47:15','2017-08-16 00:47:15','',NULL,NULL,NULL),(44,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 00:48:48','2017-08-16 00:48:48','',NULL,NULL,NULL),(45,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 00:52:08','2017-08-16 00:52:08','',NULL,NULL,NULL),(46,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 00:53:43','2017-08-16 00:53:43','',NULL,NULL,NULL),(47,'2017-08-15 00:00:00',2,NULL,NULL,NULL,3,'2017-08-16 00:54:59','2017-08-16 00:54:59','',NULL,NULL,NULL),(48,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:25:00','2017-08-16 01:25:00','',NULL,NULL,NULL),(49,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:31:06','2017-08-16 01:31:06','',NULL,NULL,NULL),(50,'2017-08-15 00:00:00',2,NULL,NULL,NULL,3,'2017-08-16 01:32:18','2017-08-16 01:32:18','',NULL,NULL,NULL),(51,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:34:10','2017-08-16 01:34:10','',NULL,NULL,NULL),(52,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:39:53','2017-08-16 01:39:53','',NULL,NULL,NULL),(53,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:41:16','2017-08-16 01:41:16','',NULL,NULL,NULL),(54,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:42:55','2017-08-16 01:42:55','',NULL,NULL,NULL),(55,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:44:13','2017-08-16 01:44:13','',NULL,NULL,NULL),(56,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:46:39','2017-08-16 01:46:39','',NULL,NULL,NULL),(57,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:49:17','2017-08-16 01:49:17','',NULL,NULL,NULL),(58,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:50:52','2017-08-16 01:50:52','',NULL,NULL,NULL),(59,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:51:38','2017-08-16 01:51:38','',NULL,NULL,NULL),(60,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:54:05','2017-08-16 01:54:05','',NULL,NULL,NULL),(61,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 01:54:26','2017-08-16 01:54:26','',NULL,NULL,NULL),(62,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 02:06:27','2017-08-16 02:06:27','',NULL,NULL,NULL),(63,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 02:09:20','2017-08-16 02:09:20','',NULL,NULL,NULL),(64,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 02:12:49','2017-08-16 02:12:49','',NULL,NULL,NULL),(65,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 02:26:11','2017-08-16 02:26:11','',NULL,NULL,NULL),(66,'2017-08-15 00:00:00',2,NULL,NULL,NULL,3,'2017-08-16 02:27:04','2017-08-16 02:27:04','',NULL,NULL,NULL),(67,'2017-08-15 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 02:28:52','2017-08-16 02:28:52','',NULL,NULL,NULL),(68,'2017-08-16 00:00:00',1,NULL,NULL,NULL,3,'2017-08-16 21:37:38','2017-08-16 21:37:38','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `upc` varchar(50) DEFAULT NULL,
  `package_counts` varchar(50) DEFAULT NULL,
  `case_count` int(11) DEFAULT NULL,
  `unit_cost` decimal(11,2) DEFAULT NULL,
  `retail_cost` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'flour tortilla','1234',NULL,NULL,NULL,NULL),(2,'corn tortilla','2222',NULL,NULL,NULL,NULL),(3,'gluten free tortilla','3333',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `store_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` VALUES (1,'hy vee store 100','123 main st',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'hy vee store 200','123 main st','','omaha','','','','',NULL,'2017-08-05 22:36:43',NULL,NULL),(3,'bakers store 10','123 main st',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'taco johns','c st','m st','omaha','ne','68111','402-222-2222','taca@cox.net','2017-08-05 22:16:09','2017-08-05 22:35:36',NULL,NULL),(5,'mammas','','','','','','','','2017-08-05 23:40:52','2017-08-05 23:40:52',NULL,NULL),(6,'menards','','','','','22222','','','2017-08-05 23:42:20','2017-08-06 00:49:49',NULL,NULL),(7,'no frills','abc st','','','','','','','2017-08-05 23:47:20','2017-08-05 23:47:32',NULL,NULL),(8,'hectors','','','omaha','','','','','2017-08-05 23:48:22','2017-08-05 23:48:39',NULL,NULL);
/*!40000 ALTER TABLE `merchants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'marvin','marvin.com','$2a$10$fI8u950s5eihcoAf6wXyfuv9.ARCmU5EPklMglYlQO4nuqW8OoQFy','2017-07-23 22:47:43','2017-07-23 22:47:43'),(2,'marvin1','marvin1','$2a$10$m9wiRS4SRBg9uZdYdjq.hOPaXaY84VAcA8zSFBxu78suefo3CN15m','2017-07-23 23:00:57','2017-07-23 23:00:57'),(3,'marvin2','marvin2','$2a$10$wZfLgtSrSp/2vdiBcHQhIOavg8Hm8qTsvkjUdkwOVZmqKjLVLwEhe','2017-07-23 23:33:13','2017-07-23 23:33:13'),(4,'jjjj','jjj','$2a$10$Em3R5bFpfJUyXHPYv0VFfuwfea5cn0uUUA5MQLbYK30odcKblV6fi','2017-07-23 23:34:35','2017-07-23 23:34:35'),(5,'marvin','marvin@marvin.com','$2a$10$6O.UmDsFOvgHc/zOdvVbAeYp2Aod4EqbGz1sBJ5NG7sP45PjBvfoS','2017-07-25 19:08:33','2017-07-25 19:08:33'),(6,'marvin2','marvin2','$2a$10$cYA2Da/ZlmyAuY4oLGT56uKpeV9p.4.LXLq1tHZ0zh1iUvHh836FK','2017-07-26 15:29:07','2017-07-26 15:29:07'),(7,'marvin3','marvin3','$2a$10$pHH1itfVXoYM6pxqqy3j/O5gJF9EJY3P3xiGLlyRF45guBcylTG76','2017-07-26 15:44:21','2017-07-26 15:44:21'),(8,'marvin3','marvin3','$2a$10$bldGDYdn5g2EA3quc232nuNjBHSwxs3VDq/DnhQeSWD6zxV1KLUGa','2017-07-26 15:57:54','2017-07-26 15:57:54');
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

-- Dump completed on 2017-08-16 20:50:42
