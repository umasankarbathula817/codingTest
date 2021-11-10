CREATE DATABASE  IF NOT EXISTS `lspnode` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lspnode`;
-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: lspnode
-- ------------------------------------------------------
-- Server version	5.7.36-0ubuntu0.18.04.1

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `cart_status` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (134,0,NULL,'1636559354693',0,NULL,NULL),(137,0,NULL,'1636559744400',0,NULL,NULL),(139,0,NULL,'1636559750703',0,NULL,NULL),(142,0,NULL,'1636560032708',0,NULL,NULL),(143,0,NULL,'1636560123229',0,NULL,NULL),(146,0,NULL,'1636560178852',0,NULL,NULL),(149,0,NULL,'1636560635068',0,NULL,NULL),(152,1,NULL,'1636561196378',0,NULL,NULL),(153,1,NULL,'1636561215850',0,NULL,NULL),(156,1,NULL,'1636561318535',0,NULL,NULL),(157,1,NULL,'1636561328413',0,NULL,NULL),(160,1,NULL,'1636561337142',0,NULL,NULL),(161,0,NULL,'1636561360609',0,NULL,NULL),(162,1,NULL,'1636561400925',0,NULL,NULL),(164,1,NULL,'1636561405506',0,NULL,NULL),(165,0,NULL,'1636561407260',0,NULL,NULL),(166,1,NULL,'1636561479792',0,NULL,NULL),(168,1,NULL,'1636561481813',0,NULL,NULL),(169,1,NULL,'1636561481813',0,NULL,NULL),(170,1,NULL,'1636561483359',0,NULL,NULL),(172,0,NULL,'1636561487965',0,NULL,NULL),(173,0,NULL,'1636561493105',0,NULL,NULL),(174,1,NULL,'1636561494961',0,NULL,NULL),(177,1,NULL,'1636561501682',0,NULL,NULL),(178,1,NULL,'1636561504968',0,NULL,NULL),(181,1,NULL,'1636561529663',0,NULL,NULL),(182,1,NULL,'1636561531622',0,NULL,NULL),(185,1,NULL,'1636561543831',0,NULL,NULL),(186,0,NULL,'1636561548697',0,NULL,NULL),(187,0,NULL,'1636561549164',0,NULL,NULL),(188,0,NULL,'1636561549325',0,NULL,NULL),(189,0,NULL,'1636561549510',0,NULL,NULL),(190,1,NULL,'1636561549828',0,NULL,NULL),(193,1,NULL,'1636561555674',0,NULL,NULL),(194,1,NULL,'1636561769337',0,NULL,NULL),(197,0,NULL,'1636561769337',0,NULL,NULL),(198,1,NULL,'1636561778872',0,NULL,NULL),(199,0,NULL,'1636561778872',0,NULL,NULL),(200,1,NULL,'1636561793319',0,NULL,NULL),(201,0,NULL,'1636561793319',0,NULL,NULL),(202,1,NULL,'1636561795492',0,NULL,NULL),(203,0,NULL,'1636561795492',0,NULL,NULL),(204,1,NULL,'1636561817277',0,NULL,NULL),(207,1,NULL,'1636561875582',0,NULL,NULL),(208,1,NULL,'1636561886027',0,NULL,NULL),(210,1,NULL,'1636561897619',0,NULL,NULL),(212,1,NULL,'1636562024062',0,NULL,NULL),(214,1,NULL,'1636562122292',0,NULL,NULL),(216,1,NULL,'1636562138986',0,NULL,NULL),(219,0,NULL,'1636562156230',0,NULL,NULL),(220,1,NULL,'1636562170827',0,NULL,NULL),(222,0,NULL,'1636562174044',0,NULL,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL,
  `amount` double DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (135,1000,NULL,1,NULL,134,1,NULL),(136,500,NULL,1,NULL,134,2,NULL),(138,1000,NULL,1,NULL,137,1,NULL),(140,500,NULL,1,NULL,139,2,NULL),(141,1000,NULL,1,NULL,139,1,NULL),(144,1000,NULL,1,NULL,143,1,'product1'),(145,500,NULL,1,NULL,143,2,'product2'),(147,6000,NULL,6,NULL,146,1,'product1'),(148,1000,NULL,2,NULL,146,2,'product2'),(150,2000,NULL,2,NULL,149,1,'product1'),(151,1500,NULL,3,NULL,149,2,'product2'),(154,4000,NULL,4,NULL,153,1,'product1'),(155,1500,NULL,3,NULL,153,2,'product2'),(158,2000,NULL,2,NULL,157,1,'product1'),(159,500,NULL,1,NULL,157,2,'product2'),(163,2000,NULL,2,NULL,162,1,'product1'),(167,1000,NULL,1,NULL,166,1,'product1'),(171,1000,NULL,1,NULL,170,1,'product1'),(175,3000,NULL,3,NULL,174,1,'product1'),(176,1000,NULL,2,NULL,174,2,'product2'),(179,1500,NULL,3,NULL,178,2,'product2'),(180,3000,NULL,3,NULL,178,1,'product1'),(183,4000,NULL,4,NULL,182,1,'product1'),(184,3000,NULL,6,NULL,182,2,'product2'),(191,3000,NULL,3,NULL,190,1,'product1'),(192,1000,NULL,2,NULL,190,2,'product2'),(195,2000,NULL,2,NULL,194,1,'product1'),(196,500,NULL,1,NULL,194,2,'product2'),(205,1000,NULL,1,NULL,204,1,'product1'),(206,1500,NULL,3,NULL,204,2,'product2'),(209,1000,NULL,1,NULL,208,1,'product1'),(211,1000,NULL,1,NULL,210,1,'product1'),(213,1000,NULL,1,NULL,212,1,'product1'),(215,1000,NULL,1,NULL,214,1,'product1'),(217,8000,NULL,8,NULL,216,1,'product1'),(218,3500,NULL,7,NULL,216,2,'product2'),(221,1000,NULL,1,NULL,220,1,'product1');
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (223);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5cypb0k23bovo3rn1a5jqs6j4` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,'product1 desc','product1',NULL,1,1000),(2,NULL,'product2 desc','product2',NULL,2,500);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,NULL,'category1 desc','category1',NULL),(2,NULL,'category2 desc','category2',NULL);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_num` varchar(255) DEFAULT NULL,
  `pin_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-10 22:08:06
