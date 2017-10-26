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
-- Temporary view structure for view `invoice_downloads`
--

DROP TABLE IF EXISTS `invoice_downloads`;
/*!50001 DROP VIEW IF EXISTS `invoice_downloads`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `invoice_downloads` AS SELECT 
 1 AS `invoice_id`,
 1 AS `start_date`,
 1 AS `merchant_name`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

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
  `cost` decimal(11,2) DEFAULT NULL,
  `discounted_item` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
INSERT INTO `invoice_items` VALUES (103,141,3,1,1.30,NULL),(105,142,3,1,1.50,NULL),(106,142,4,1,3.00,NULL),(107,143,3,1,1.30,NULL),(108,144,3,9,13.30,NULL),(109,145,3,9,13.30,NULL),(110,146,3,10,13.00,NULL),(111,147,3,1,1.50,NULL),(112,148,3,1,1.30,NULL),(113,148,4,2,6.00,NULL),(114,148,5,2,2.60,NULL),(115,148,6,2,3.70,NULL),(116,148,7,2,4.20,NULL),(117,148,8,2,4.20,NULL),(118,148,9,2,4.20,NULL),(119,149,3,1,1.50,NULL),(120,150,3,1,1.50,NULL),(121,152,3,1,1.30,'*'),(122,153,3,5,6.50,'*'),(123,153,4,1,3.00,NULL),(124,153,5,1,1.30,NULL),(125,154,3,1,1.30,'*'),(126,155,3,1,1.30,'*'),(127,156,3,2,2.60,'*'),(128,156,4,2,6.00,NULL);
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
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (141,'2017-10-08 00:00:00',1,12,'2017-10-08 16:48:43','2017-10-08 16:48:43','','0'),(142,'2017-10-09 00:00:00',2,12,'2017-10-10 00:45:25','2017-10-10 00:45:25','','0'),(143,'2017-10-13 00:00:00',1,12,'2017-10-13 23:09:25','2017-10-13 23:09:25','','0'),(144,'2017-10-14 00:00:00',1,12,'2017-10-14 15:00:54','2017-10-14 15:00:54','','0'),(145,'2017-10-14 00:00:00',1,12,'2017-10-14 15:07:34','2017-10-14 15:07:34','','0'),(146,'2017-10-14 00:00:00',1,12,'2017-10-14 15:12:13','2017-10-14 15:12:13','','0'),(147,'2017-10-14 00:00:00',98,12,'2017-10-14 22:28:29','2017-10-14 22:28:29','','1'),(148,'2017-10-16 00:00:00',1,12,'2017-10-17 01:31:32','2017-10-17 01:31:32','','0'),(149,'2017-10-17 00:00:00',46,12,'2017-10-18 00:56:28','2017-10-18 00:56:28','','0'),(150,'2017-10-22 00:00:00',90,12,'2017-10-22 20:57:46','2017-10-22 20:57:46','','1'),(151,'2017-10-24 00:00:00',1,12,'2017-10-25 01:31:22','2017-10-25 01:31:22','','0'),(152,'2017-10-24 00:00:00',1,12,'2017-10-25 01:38:00','2017-10-25 01:38:00','','0'),(153,'2017-10-24 00:00:00',1,12,'2017-10-25 01:38:51','2017-10-25 01:38:51','','0'),(154,'2017-10-24 00:00:00',1,12,'2017-10-25 01:55:28','2017-10-25 01:55:28','','0'),(155,'2017-10-24 00:00:00',1,12,'2017-10-25 02:11:03','2017-10-25 02:11:03','','0'),(156,'2017-10-24 00:00:00',1,12,'2017-10-25 02:29:31','2017-10-25 02:29:31','','0');
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
  `description` text,
  `upc` text,
  `package_counts` text,
  `unit_cost` double DEFAULT NULL,
  `case_cost` double DEFAULT NULL,
  `retail_cost` double DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `discount_start_date` datetime DEFAULT NULL,
  `discount_end_date` datetime DEFAULT NULL,
  `mimick_item` int(11) DEFAULT NULL,
  `mamas_item` int(11) DEFAULT NULL,
  `mexicana_item` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (3,'Corn Tortillas 6 in/ 26 oz.','35392-12234','32 ct./ 9 pkg.cs.',1.5,13.5,1.99,0.2,'2017-01-01 00:00:00','2017-12-31 00:00:00',1,1,0),(4,'Corn Tortillas 6 in/ 86 oz.','35392-12242','80 ct./ 6 pkg.cs.',3,18,3.99,0,NULL,NULL,1,1,0),(5,'Flour Tortillas 6 in/ 12 oz.','35392-14122','10 ct./ 12 pkg.cs.',1.3,15.6,1.79,0,NULL,NULL,1,1,0),(6,'Flour Tortillas 8 in/ 20 oz.','35392-24121','10 ct./ 12 pkg.cs.',1.85,22.2,2.49,0,NULL,NULL,1,1,0),(7,'Flour Tortillas 10 in/ 23 oz.','35392-41214','10 ct./ 12 pkg.cs.',2.1,25.2,2.79,0,NULL,NULL,1,1,0),(8,'W. Wheat Tortillas 8 in/ 20 oz. ','35392-34123','10 ct./ 12 pkg.cs.',2.1,25.2,2.79,0,NULL,NULL,1,1,0),(9,'Low Carb Wheat 7 in/ 9 oz.','35392-34220','8 ct./ 12 pkg.cs.',2.1,25.2,2.79,0,NULL,NULL,1,1,0),(10,'L.F.Flour Tortillas 10 in/ 18 oz.','35392-40910','8 ct./ 12 pkg.cs.',1.9,22.8,2.59,0,NULL,NULL,1,1,0),(11,'L.F.Flour Tortillas 8 in/ 20 oz.','78704-40915','10 ct./ 12 pkg.cs.',1.7,20.4,2.39,0,NULL,NULL,1,1,0),(12,'L.F.Flour Tortillas 7 in/ 16 oz.','78704-40916','10 ct./ 12 pkg.cs.',1.45,17.4,1.99,0,NULL,NULL,1,1,0),(13,'Sun Dried Tomato Wrap','73219-00703','14 oz./ 12 pkg.cs.',2.48,29.76,3.29,0,NULL,NULL,1,0,1),(14,'Spinach Pesto Wrap','73219-00704','14 oz./ 12 pkg.cs.',2.48,29.76,3.29,0,NULL,NULL,1,0,1),(15,'Roasted Red Pepper Wrap','73219-00705','14 oz./ 12 pkg.cs.',2.48,29.76,3.29,0,NULL,NULL,1,0,1),(16,'Corn Tortillas 6 in/ 32 oz.','743010-12501','34 ct./ 18 pkg.cs.',1.45,26.1,1.89,0,NULL,NULL,1,0,1),(17,'Corn Tortillas 6 in/ 90 oz.','743010-12502','90 ct./ 6 pkg.cs.',3,18,3.59,0,NULL,NULL,1,0,1),(18,'Corn Tortillas 4 in/ 30 oz.','743010-12506','60 ct./ 20 pkg.cs.',1.85,37,2.55,0,NULL,NULL,1,0,1),(19,'Flour Tortillas 6 in/ 11 oz.','743010-12503','10 ct./ 12 pkgs.',1.05,12.6,1.39,0,NULL,NULL,1,0,1),(20,'Flour Tortillas 8 in/ 16 oz.','743010-12504','10 ct./ 12 pkgs.',1.35,16.2,1.75,0,NULL,NULL,1,0,1),(21,'Flour Tortillas 10 in/ 20 oz.','743010-12505','8 ct./ 12 pkgs.',1.5,18,1.95,0,NULL,NULL,1,0,1),(22,'Corn Tortillas 6 in','6000','80 ct./ 6 pkg.cs.',19,0,0,0,NULL,NULL,1,0,0),(23,'Flour Tortillas 6 in','6100','12 ct./ 30 pkg.cs.',28,0,0,0,NULL,NULL,1,0,0),(24,'Flour Tortillas 8 in','6200','12 ct./ 18 pkg.cs.',25,0,0,0,NULL,NULL,1,0,0),(25,'Flour Tortillas 10 in','6300','12ct./ 16 pkg.cs.',29,0,0,0,NULL,NULL,1,0,0),(26,'Flour Tortilla 13 in','6400','12ct./ 12 pkg.cs.',40,0,0,0,NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_2`
--

DROP TABLE IF EXISTS `items_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items_2` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `upc` varchar(50) DEFAULT NULL,
  `package_counts` varchar(50) DEFAULT NULL,
  `unit_cost` decimal(11,2) DEFAULT NULL,
  `case_cost` decimal(11,2) DEFAULT NULL,
  `retail_cost` decimal(11,2) DEFAULT NULL,
  `discount_amount` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_2`
--

LOCK TABLES `items_2` WRITE;
/*!40000 ALTER TABLE `items_2` DISABLE KEYS */;
INSERT INTO `items_2` VALUES (3,'Corn Tortillas 6 in/ 26 oz.','35392-12234','32 ct./ 9 pkg.cs.',1.50,13.50,1.99,1.00),(4,'Corn Tortillas 6 in/ 86 oz.','35392-12242','80 ct./ 6 pkg.cs.',3.00,18.00,3.99,0.00),(5,'Flour Tortillas 6 in/ 12 oz.','35392-14122','10 ct./ 12 pkg.cs.',1.30,15.60,1.79,0.00),(6,'Flour Tortillas 8 in/ 20 oz.','35392-24121','10 ct./ 12 pkg.cs.',1.85,22.20,2.49,0.00),(7,'Flour Tortillas 10 in/ 23 oz.','35392-41214','10 ct./ 12 pkg.cs.',2.10,25.20,2.79,0.00),(8,'W. Wheat Tortillas 8 in/ 20 oz. ','35392-34123','10 ct./ 12 pkg.cs.',2.10,25.20,2.79,0.00),(9,'Low Carb Wheat 7 in/ 9 oz.','35392-34220','8 ct./ 12 pkg.cs.',2.10,25.20,2.79,0.00),(10,'L.F.Flour Tortillas 10 in/ 18 oz.','35392-40910','8 ct./ 12 pkg.cs.',1.90,22.80,2.59,0.00),(11,'L.F.Flour Tortillas 8 in/ 20 oz.','78704-40915','10 ct./ 12 pkg.cs.',1.70,20.40,2.39,0.00),(12,'L.F.Flour Tortillas 7 in/ 16 oz.','78704-40916','10 ct./ 12 pkg.cs.',1.45,17.40,1.99,0.00),(13,'Sun Dried Tomato Wrap','73219-00703','14 oz./ 12 pkg.cs.',2.48,29.76,3.29,0.00),(14,'Spinach Pesto Wrap','73219-00704','14 oz./ 12 pkg.cs.',2.48,29.76,3.29,0.00),(15,'Roasted Red Pepper Wrap','73219-00705','14 oz./ 12 pkg.cs.',2.48,29.76,3.29,0.00),(16,'Corn Tortillas 6 in/ 32 oz.','743010-12501','34 ct./ 18 pkg.cs.',1.45,26.10,1.89,0.00),(17,'Corn Tortillas 6 in/ 90 oz.','743010-12502','90 ct./ 6 pkg.cs.',3.00,18.00,3.59,0.00),(18,'Corn Tortillas 4 in/ 30 oz.','743010-12506','60 ct./ 20 pkg.cs.',1.85,37.00,2.55,0.00),(19,'Flour Tortillas 6 in/ 11 oz.','743010-12503','10 ct./ 12 pkgs.',1.05,12.60,1.39,0.00),(20,'Flour Tortillas 8 in/ 16 oz.','743010-12504','10 ct./ 12 pkgs.',1.35,16.20,1.75,0.00),(21,'Flour Tortillas 10 in/ 20 oz.','743010-12505','8 ct./ 12 pkgs.',1.50,18.00,1.95,0.00);
/*!40000 ALTER TABLE `items_2` ENABLE KEYS */;
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
  `store_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type` int(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `discount` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_start_date` datetime DEFAULT NULL,
  `discount_end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` VALUES (1,'Walmart Supercenter','776','3010 E 23 Street','Fremont','NE','68025','402-727-0414',0,'2017-08-19 00:00:00','2017-10-09 20:46:02','yes','2017-01-01 00:00:00','2018-01-01 00:00:00'),(2,'Walmart Supercenter','1943','4700 N 27 street','Lincoln','NE','68521','402-438-4377',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(3,'Walmart Supercenter','1965','3201 Manawa Center Drive','Council Bluffs','IA','51501','712-366-3326',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(4,'Walmart Supercenter','2847','10504 S 15 Street','Bellevue','NE','68123','402-292-0156',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(5,'Walmart Supercenter','3278','8700 Andermatt Drive','Lincoln','NE','68526','402-484-6166',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(6,'Walmart Supercenter','2432','2500 Jamie Lane','Lincoln','NE','68512','402-975-6171',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(7,'Walmart Supercenter','3823','3400 N 85 Street','Lincoln','NE','68507','402-466-0447',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(8,'Walmart Supercenter','5141','16960 W Maple Road','Omaha','NE','68116','402-289-9238',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(9,'Walmart Supercenter','3267','18201 Wright Street','Omaha','NE','68130','402-330-4400',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(10,'Walmart Supercenter','5361','12850 L Street','Omaha','NE','68137','402-697-1054',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(11,'Walmart Supercenter','1637','6304 N 99 Street','Omaha','NE','68134','402-492-9344',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(12,'Walmart Supercenter','3151','5018 Ames Avenue','Omaha','NE','68104','402-970-9301',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(13,'Walmart Supercenter','1671','8525 S 71 Plaza','Papillion','NE','68133','402-597-8977',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(14,'Walmart Supercenter','4600','11350 Wickersham Blvd','Gretna','NE','68028','402-881-3530',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(15,'Walmart Supercenter','4568','1882 Holly Street','Blair','NE','68008','402-533-8272',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(16,'Walmart Supercenter','4358','1606 S 72 Street','Omaha','NE','68124','402-393-9560',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(17,'Walmart Supercenter','3150','1800 N 16 Street','Council Bluffs','IA','51501','712-890-3914',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(18,'Walmart Neighborhood Market','4138','13105 Birch Drive','Omaha','NE','68164','402-686-2055',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(19,'Walmart Neighborhood Market','3153','6710 S 167 Street','Omaha','NE','68135','402-609-5703',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(20,'Walmart Neighborhood Market','3152','2451 N 90 Street','Omaha','NE','68134','402-513-4030',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(21,'Walmart Neighborhood Market','3172','5051 L Street','Omaha','NE','68117','402-541-0820',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(22,'Walmart Neighborhood Market','4139','360 NSaddlecreek','Omaha','NE','68131','402-970-6491',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(23,'Walmart Neighborhood Market','3173','9460 Giles Road','La Vista','NE','68128','402-513-4207',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(24,'Walmart Neighborhood Market','3154','2109 Towne Centre Dr','Bellevue','NE','68123','402-686-2040',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(25,'Baker\'s','301','4405 N 72 Street','Omaha','NE','68134','402-571-3057',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(26,'Baker\'s','311','5555 N 90 Street','Omaha','NE','68134','402-571-6850',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(27,'Baker\'s','316','7312 N 30 Street','Omaha','NE','68112','402-451-7070',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(28,'Baker\'s','318','801 Galvin Rd S','Bellevue','NE','68005','402-292-7070',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(29,'Baker\'s','319','888 Saddlecreek Rd','Omaha','NE','68106','402-551-0613',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(30,'Baker\'s','320','17370 Lakeside Hills Rd','Omaha','NE','68164','402-333-2454',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(31,'Baker\'s','321','505 N 155 Plaza','Omaha','NE','68154','402-498-5717',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(32,'Baker\'s','323','1531 N Bell Street','Fremont','NE','68025','402-727-8622',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(33,'Baker\'s','300','3614 Twin Creek Drive  ','Bellevue','NE','68123','402-292-3992',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(34,'Baker\'s','302','12025 W Center Rd','Omaha','NE','68144','402-334-5290',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(35,'Baker\'s','315','13250 W Maple Rd','Omaha','NE','68164','402-496-9200',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(36,'HyVee','1185','840- E 23 Street','Fremont','NE','68025','402-727-6717',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(37,'HyVee','1385','5010 O Street','Lincoln','NE','68502','402-483-7707',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(38,'HyVee','1386','1601 N 84 Street','Lincoln','NE','68505','402-467-5505',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(39,'HyVee','1387','5020 N 27 Street','Lincoln','NE','68521','402-477-4764',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(40,'HyVee','1388','6001 Village Drive','Lincoln','NE','68516','402-421-2462',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(41,'HyVee','1390','7151 Stacy Lane','Lincoln','NE','68516','402-489-4244',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(42,'HyVee','1471','747 N 132 Street','Omaha','NE','68154','402-493-2911',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(43,'HyVee','1470','7910 Cass Street','Omaha','NE','68114','402-384-8668',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(44,'HyVee','1092','2323 W Broadway','Council Bluffs','NE','51501','712-328-9792',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(45,'HyVee','1101','1745 Madison Avenue','Council Bluffs','NE','51503','712-322-9260',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(46,'HyVee','1474','3410 N 156 Street','Omaha','NE','68116','402-493-0390',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(47,'HyVee','1472','17810 Welch Plaza','Omaha','NE','68135','402-896-4168',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(48,'HyVee','1465','5150 51 Street','Omaha','NE','68106','402-553-2664',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(49,'HyVee','1466','14591 Stony Brook Blvd','Omaha','NE','68137','402-697-0811',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(50,'HyVee','1467','10808 Fort Street','Omaha','NE','68164','402-493-2089',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(51,'HyVee','1469','8809 W Center Rd','Omaha','NE','68124','402-384-9072',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(52,'HyVee','1514','11650 S 73 Street','Papillion','NE','68046','402-597-5790',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(53,'HyVee','1535','9707 Q Street','Omaha','NE','68127','402-339-3047',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(54,'HyVee','7030','757 W Broadway','Council Bluffs','IA','51501','712-328-3146',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(55,'Family Fare','3774','5110 S 108 Street','Omaha','NE','68137','402-592-2005',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(56,'Family Fare','3791','1801 Valley View Dr','Council Bluffs','IA','51503','712-322-4326',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(57,'Family Fare','3776','5101 Harrison Street','Omaha','NE','68157','402-733-6771',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(58,'Family Fare','3779','5019 Grover Street','Omaha','NE','68106','402-551-6865',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(59,'Family Fare','3780','2650 N 90 Street','Omaha','NE','68134','402-390-0440',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(60,'Family Fare','3785','3003 N 108 Street','Omaha','NE','68164','402-493-5833',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(61,'Family Fare','3795','7402 N 30 Street','Omaha','NE','68112','402-408-1040',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(62,'Family Fare','3784','14444 W Center Rd','Omaha','NE','68144','402-334-1415',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(63,'Family Fare','3788','1510 Harlan Drive','Bellevue','NE','68005','402-291-7170',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(64,'Family Fare','3797','820 N Saddlecreek Rd','Omaha','NE','68132','402-556-9225',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(65,'Family Fare','3792','238 S 8 Street','Blair','NE','68008','402-426-4757',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(66,'Family Fare','3799','1230 N Washington St','Papillion','NE','68046','402-408-2401',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(67,'Family Fare','3800','3026 S 24 Street','Omaha','NE','68108','402-341-2079',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(68,'Family Fare','3811','1221 S 203 Street','Omaha','NE','68130','402-896-4339',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(69,'Nuestra Familia Super','3775','1826 Vinton Street','Omaha','NE','68108','402-346-2447',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(70,'Nuestra Familia Super','3793','3548 Q Street','Omaha','NE','68107','402-733-4700',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(71,'Nuestra Familia Super','3733','2900 Leavenworth Street','Omaha','NE','68105','402-346-2447',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(72,'Russ\'s','1','1709 Washington','Lincoln','NE','68502','402-477-1238',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(73,'Russ\'s','2','130 N 66 Street','Lincoln','NE','68505','402-466-8111',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(74,'Russ\'s','14','6300 Havelock','Lincoln','NE','68507','402-464-5804',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(75,'Russ\'s','16','4400 S 33 Street Court','Lincoln','NE','68516','402-420-1414',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(76,'Russ\'s','21','1550 S Coddington','Lincoln','NE','68522','402-477-6236',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(77,'Super Saver','4','233 N 48 Street','Lincoln','NE','68504','402-464-8552',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(78,'Super Saver','9','2662 Cornhusker Hwy','Lincoln','NE','68521','402-466-7100',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(79,'Super Saver','11','5440 S 56 Street','Lincoln','NE','68516','402-423-7181',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(80,'Super Saver','12','1141 N Broadway','Council Bluffs','IA','51501','712-322-8778',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(81,'Super Saver','17','2525 Pine Lake Road','Lincoln','NE','68512','402-420-2000',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(82,'Super Saver','20','5710 S 144 Street','Omaha','NE','68137','402-895-6611',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(83,'Super Saver','26','840 Fallbrook Blvd','Lincoln','NE','68521','402-438-8880',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(84,'Fareway','43','17070 Audrey Street','Omaha','NE','68136','402-895-2989',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(85,'Fareway','49','1325 Jersey Street','Papillion','NE','68046','402-331-6938',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(86,'Fareway','73','310 McKenzie Avenue','Council Bluffs','IA','51503','712-328-4176',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(87,'Fareway','103','3070 N 90 Street','Omaha','NE','68134','402-573-5669',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(88,'Phil\'s Foodway','1','3030 Ames Avenue','Omaha','NE','68111','402-451-8993',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(89,'Cubby\'s','3','601 S 13 Street','Omaha','NE','68102','402-341-2900',0,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(90,'Howard\'s Charro Cafe','1','4443 S 13 Street','Omaha','NE','68107','402-731-3776',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(91,'Patrick\'s Market','1','1416 Howard Street','Omaha','NE','68102','402-884-1600',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(92,'Stokes Restaurant','2','1122 Howard Street','Omaha','NE','68102','402-408-9000',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(93,'Stokes Restaurant','1','13615 California Street','Omaha','NE','68154','402-498-0804',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(94,'California Taco','1','3235 California Street','Omaha','NE','68131','402-342-0212',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(95,'K N J Grocery','1','3301 California Street','Omaha','NE','68131','402-422-1058',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(96,'All Nations','1','715 S 24 Street','Omaha','NE','68102','402-346-6771',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(97,'Nettie\'s Restaurant','1','7110 Railroad Avenue','Bellevue','NE','68147','402-733-3359',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(98,'El Pueblito Market','1','5114 S 24 Street','Omaha','NE','68107','402-614-0800',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(99,'Amigo\'s Market','1','2102 Q Street','Omaha','NE','68107','402-715-5919',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(100,'Carneceria Mexico Market','1','3914 Q Street','Omaha','NE','68107','402-932-1722',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(101,'La Mexicana Market','1','1603 Vinton Street','Omaha','NE','68108','402-346-9147',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(102,'Eat The Worm','1','1213 Howard street','Omaha','NE','68102','402-614-4240',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(103,'Candle Light Bar','1','5031 Grover Street','Omaha','NE','68106','402-504-4966',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(104,'Red Eye Tavern','1','8437 W Center Road','Omaha','NE','68124','402-393-7775',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(105,'Costa El Sol Restaurant','1','4454 S 84 Street','Omaha','NE','68127','402-596-1978',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(106,'Guaca Maya Restaurant','1','5002 S 33 Street','Omaha','NE','68107','402-733-3440',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(107,'Jams Restaurant','1','7814 W Dodge Road','Omaha','NE','68114','402-399-8300',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(108,'Azteca Restaurant','1','9429 S 142 Street','Omaha','NE','68138','402-896-6766',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(109,'IGA','1','4646 W Huntington Avenue','Lincoln','NE','68524','402-470-2000',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL),(110,'Darby\'s Tavern','1','6503 Sunshine Drive','Omaha','NE','68107','402-733-9696',1,'2017-08-19 00:00:00','2017-08-19 00:00:00','no',NULL,NULL);
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
  `admin` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'marvin','marvin.com','$2a$10$fI8u950s5eihcoAf6wXyfuv9.ARCmU5EPklMglYlQO4nuqW8OoQFy','2017-07-23 22:47:43','2017-07-23 22:47:43',NULL),(2,'marvin1','marvin1','$2a$10$m9wiRS4SRBg9uZdYdjq.hOPaXaY84VAcA8zSFBxu78suefo3CN15m','2017-07-23 23:00:57','2017-07-23 23:00:57',NULL),(3,'marvin2','marvin2','$2a$10$wZfLgtSrSp/2vdiBcHQhIOavg8Hm8qTsvkjUdkwOVZmqKjLVLwEhe','2017-07-23 23:33:13','2017-07-23 23:33:13',NULL),(4,'jjjj','jjj','$2a$10$Em3R5bFpfJUyXHPYv0VFfuwfea5cn0uUUA5MQLbYK30odcKblV6fi','2017-07-23 23:34:35','2017-07-23 23:34:35',NULL),(5,'marvin','marvin@marvin.com','$2a$10$6O.UmDsFOvgHc/zOdvVbAeYp2Aod4EqbGz1sBJ5NG7sP45PjBvfoS','2017-07-25 19:08:33','2017-07-25 19:08:33',NULL),(6,'marvin2','marvin2','$2a$10$cYA2Da/ZlmyAuY4oLGT56uKpeV9p.4.LXLq1tHZ0zh1iUvHh836FK','2017-07-26 15:29:07','2017-07-26 15:29:07',NULL),(7,'marvin3','marvin3','$2a$10$pHH1itfVXoYM6pxqqy3j/O5gJF9EJY3P3xiGLlyRF45guBcylTG76','2017-07-26 15:44:21','2017-07-26 15:44:21',NULL),(8,'marvin3','marvin3','$2a$10$bldGDYdn5g2EA3quc232nuNjBHSwxs3VDq/DnhQeSWD6zxV1KLUGa','2017-07-26 15:57:54','2017-07-26 15:57:54',NULL),(9,'larry','','$2a$10$Zjc/DLs/6QnUvVDBCmeGpeUb3xpPdHQY2fiSBFAkVA7y3f6ZJAPKG','2017-08-24 01:18:21','2017-08-24 01:18:21',NULL),(10,'marvin','','$2a$10$T3RPei/87AtBIdj.KC3bvePcHWEj6EGb7lAOGDFoDqFG5grSAWKq.','2017-08-24 01:21:39','2017-08-24 01:21:39',NULL),(11,'larry','','$2a$10$ccgCgft/2UwSd9w80YoLDuF2YnpQtu5PZkA2coalwShtZVlV8Jpb.','2017-08-24 01:23:34','2017-08-24 01:23:34',NULL),(12,'a','a','$2a$10$GTxfcxzNbFbFidaFS9aX2e4mtSDV1UaEvy.tciwOZZJ5Skt5zd7.m','2017-09-20 01:17:24','2017-09-20 01:17:24',1),(13,'b','b','$2a$10$t8fxr29zrjZePiUuuFOpf.8PbS7bejkIOeNuTXWonTk1pvhzNpO5W','2017-09-20 01:52:43','2017-09-20 01:52:43',0),(14,'c','c','$2a$10$w9JfSTZcQXTF3PeXi8m9EeW8k/JzqFHwGEQI7vmUI2mICcha7Sv5y','2017-09-20 12:00:48','2017-09-20 12:00:48',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `invoice_downloads`
--

/*!50001 DROP VIEW IF EXISTS `invoice_downloads`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `invoice_downloads` AS select `i`.`id` AS `invoice_id`,`i`.`start_date` AS `start_date`,`m`.`merchant_name` AS `merchant_name`,sum(`d`.`cost`) AS `total` from ((`invoices` `i` join `invoice_items` `d` on((`d`.`invoice_id` = `i`.`id`))) join `merchants` `m` on((`m`.`id` = `i`.`merchant_id`))) group by `i`.`id`,`i`.`start_date`,`m`.`merchant_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-25 13:32:17
