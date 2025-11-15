/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.0.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: hormarket
-- ------------------------------------------------------
-- Server version	12.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(256) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_email` (`admin_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `admin` VALUES
(1,'admin@store.ma','scrypt:32768:8:1$1IPuNUQ8v8Y6uZhf$600100c35453a69da566240048b19dbd91af374c86815679ae76fd9544a9243a9fff194a184816d6b9629cc16f06792dbadee8e29f66f2958ecbe3d7ce040a39');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `order_total_price` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `orders` VALUES
(1,1,1,'2024-11-10',6,48),
(2,2,10,'2024-11-11',10,60),
(3,4,5,'2024-11-11',15,60),
(4,1,17,'2024-11-12',20,20),
(5,6,3,'2024-11-12',12,84),
(6,3,11,'2024-11-12',8,56),
(7,8,14,'2024-11-10',3,75);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_categorie` varchar(50) NOT NULL,
  `product_price` int(11) NOT NULL,
  `current_stock_quantity` int(11) NOT NULL,
  `product_entering_date` date NOT NULL,
  `product_expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `product` VALUES
(1,'Coca Cola','drinks',8,150,'2024-11-01','2025-06-01'),
(2,'Sidi Ali Water','drinks',5,200,'2024-11-05','2026-11-05'),
(3,'Centrale Lait','drinks',7,80,'2024-11-10','2024-11-25'),
(4,'Hawai Tropical','drinks',6,120,'2024-11-08','2025-05-08'),
(5,'Tomatoes','vegetables',4,50,'2024-11-12','2024-11-19'),
(6,'Potatoes','vegetables',3,100,'2024-11-10','2024-12-10'),
(7,'Onions','vegetables',3,75,'2024-11-11','2024-12-11'),
(8,'Carrots','vegetables',4,60,'2024-11-12','2024-11-26'),
(9,'Peppers','vegetables',5,40,'2024-11-12','2024-11-20'),
(10,'Oranges','fruits',6,90,'2024-11-09','2024-11-23'),
(11,'Apples','fruits',7,70,'2024-11-08','2024-12-08'),
(12,'Bananas','fruits',8,85,'2024-11-11','2024-11-18'),
(13,'Watermelon','fruits',15,30,'2024-11-10','2024-11-24'),
(14,'Dates','fruits',25,45,'2024-11-01','2025-02-01'),
(15,'Jaouda Yogurt','dairy',4,100,'2024-11-11','2024-11-21'),
(16,'Cheese Vache qui rit','dairy',12,60,'2024-11-05','2025-01-05'),
(17,'Khobz','bakery',1,200,'2024-11-12','2024-11-13'),
(18,'Batbout','bakery',2,80,'2024-11-12','2024-11-14');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_email` varchar(50) NOT NULL,
  `staff_password` varchar(256) NOT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_email` (`staff_email`)
) ENGINE=InnoDB AUTO_INCREMENT=33342 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `staff` VALUES
(1,'staff1@store.ma','scrypt:32768:8:1$t8LR4shQiR05ghur$01898fb377b7bd7f3e6e412a1329351000be37aa65ac01ecb535b370cc1dbaceba4f7d7b55fd6263a3e9d395501a29a4482de1d8fac56669c3ebe1234322f774',1),
(2,'staff2@store.ma','scrypt:32768:8:1$BDtpKIVV60mDzCXz$39646016effc730a417fedffaa158c51771973b3d8505316bf27455902cb73ad41ef4791b8f428048402cf7754ab9e47828fb43c03a7d64f5318ac533955de36',1),
(33341,'haitamhsa799@gmail.com','scrypt:32768:8:1$VbPjee83anl8VuhP$1c2a246bfba7be38f6e80320d4039bb9f5de885eb84473e1baa6524ae3f64f1d3c7c48d7a26201cf8dfa802bfb33c0f8a4137cc81492ccbb8a70820320b521c8',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `stock_history`
--

DROP TABLE IF EXISTS `stock_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_history` (
  `stock_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity_change` int(11) DEFAULT NULL,
  `quantity_after` int(11) DEFAULT NULL,
  `change_date` date NOT NULL,
  `change_type` varchar(50) NOT NULL,
  PRIMARY KEY (`stock_history_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `stock_history_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_history`
--

LOCK TABLES `stock_history` WRITE;
/*!40000 ALTER TABLE `stock_history` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `stock_history` VALUES
(1,1,150,150,'2024-11-01','initial_stock'),
(2,1,-6,144,'2024-11-10','sale'),
(3,10,-10,90,'2024-11-11','sale'),
(4,5,-15,50,'2024-11-11','sale'),
(5,17,200,200,'2024-11-12','restock'),
(6,17,-20,180,'2024-11-12','sale'),
(7,3,-12,80,'2024-11-12','sale');
/*!40000 ALTER TABLE `stock_history` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_fullname` varchar(50) NOT NULL,
  `user_region` varchar(50) NOT NULL,
  `user_phone` varchar(50) NOT NULL,
  `user_sign_up_date` date NOT NULL,
  `user_sexe` varchar(10) NOT NULL,
  `user_age` int(11) NOT NULL,
  `user_loyality` tinyint(1) NOT NULL,
  `user_ordering_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_phone` (`user_phone`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `user` VALUES
(1,'Mohammed Alami','Casablanca','0612345678','2023-05-15','M',35,1,45),
(2,'Fatima Zahra Bennani','Rabat','0623456789','2023-08-22','F',28,1,32),
(3,'Youssef El Amrani','Tangier','0634567890','2024-01-10','M',42,0,8),
(4,'Khadija Idrissi','Fes','0645678901','2023-03-05','F',31,1,58),
(5,'Omar Tazi','Marrakech','0656789012','2024-06-18','M',25,0,5),
(6,'Salma Benjelloun','Casablanca','0667890123','2023-11-30','F',38,1,41),
(7,'Hamza Chakir','Agadir','0678901234','2024-09-12','M',29,0,3),
(8,'Aicha Squalli','Meknes','0689012345','2023-07-08','F',45,1,67),
(9,'mohammed alaoui','guelmim','0601660203','2025-11-13','male',22,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(256) NOT NULL,
  `is_user` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `user_account` VALUES
(1,'mohammed.alami@gmail.com','scrypt:32768:8:1$Xrl0AstAkDUDseik$a95620544adfe83a2bc383e2165ed6899329e73eaaf807cecc2583680074f152fbe6fcd2824f6bd22f398ab0a2a3082934f3afdc3d265f0cf8295264a40ebac6',1),
(2,'fatima.bennani@gmail.com','scrypt:32768:8:1$FRCONUha3T7r1TZy$aebf54f998ba384af316f5852de44a2a6f01359ba2a084b83f84a0bbd182064b475192191747e9d695eaa5147cea2c08f836c2650567596be59ed05744827610',1),
(3,'youssef.amrani@gmail.com','scrypt:32768:8:1$XevkAlKk0TG5wqUE$ab5f5b539e2eab68e89cd3a71406902504a00d123bbc89fc1f4937abdfabf6f569891370308ccab03e22baad207c1db698a372f271fb804ab299b141c69eee5d',1),
(4,'khadija.idrissi@gmail.com','scrypt:32768:8:1$jsDVk14rDSsRZZ0j$131bb12931604725c493d0a5e71fd183ddeb4095a08dbf14d7c08e5775e450f3dac748072773f96a49c08f99deebda30c2c0ff694003063d4a48a41a321b9ce4',1),
(5,'omar.tazi@gmail.com','scrypt:32768:8:1$04C51ARgO3R38sd9$48c57c127d2b54d53293bebca40524085b1ec1238d6540e4d8473742196790707e84de5eaaf3e71b24fd3e741a40aaa908970db46ddfdc5d86b1a0093f35351f',1),
(6,'salma.benjelloun@gmail.com','scrypt:32768:8:1$fEojVcDXFrZzEhwT$99ca972127bc758a3596a84b4b950352741b067161d447c95b6805b5daf4c05cdacd2865d46029982b9841572c0e7480efc1dc1e1c6abf44edc4ad7b59d39c3a',1),
(7,'hamza.chakir@gmail.com','scrypt:32768:8:1$kKpfKybfATMZlSzm$084be9a89db6cbc72dec0d808b186a77c474e7b4c3099d6a192e3d7b33b20a4d2ad0169ab6b6f41405d67ce1a4264ca285b485862ebd83b4315fd4ecde550e08',1),
(8,'aicha.squalli@gmail.com','scrypt:32768:8:1$MyksCwrlYVGYfmNl$6119f07a61f77d4596586f604bc6cb0841776bc2a434cab1534938ee18df78c309431d78419ae247501b6bad9ae245e8a5158a6f82660084b0edb7938dacb295',1),
(9,'mohammedalaoui6@gmail.com','scrypt:32768:8:1$nfLOiI6DHdwVP6sd$de1672730fc44329829de3d662b35fdefd528978a0f0ddd4d450d33857aea640735daab27cd8902f9326cdaafdc8eee0582e880c48313b520895f9210d944775',NULL);
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-11-15  9:15:12
