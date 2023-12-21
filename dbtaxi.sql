-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: taxi_handler
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id_car` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `year_release` year NOT NULL,
  `color` varchar(15) NOT NULL,
  `number_plate` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_fare` int NOT NULL,
  PRIMARY KEY (`id_car`),
  KEY `id_fare` (`id_fare`),
  CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`id_fare`) REFERENCES `fares` (`id_fare`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Toyota','Corolla',2020,'Желтый','Т233АМ197',1),(2,'Hundai','Elantra',2021,'Желтый','О169ВМ77',2),(3,'Renault','Logan',2018,'Черный','Х571МТ177',2),(4,'BMW','3',2021,'Белый','Р774РК177',3),(5,'Hundai','Solaris',2020,'Желтый','А135ВМ197',1),(6,'Ford','Focus',2019,'Желтый','Х135ВМ197',2),(7,'Kia','Rio',2021,'Желтый','М135ВМ197',2),(8,'Ford','Transit',2021,'Черный','А432КК777',4),(9,'Mercedes-Benz','Sprinter',2019,'Черный','А472КК777',4),(10,'Ford','Transit',2021,'Черный','А432КК777',4),(11,'Volkswagen','Crafter',2022,'Белый','Е423КХ797',4),(12,'BMW','5',2023,'Синий','Е498КХ797',5),(13,'Audi','A6',2021,'Эмеральдный','Е873КХ797',5),(14,'Mercedes-Benz','C',2020,'Серый','Е834КХ797',3),(15,'Mercedes-Benz','E',2020,'Серый','Е835КХ797',5),(16,'Audi','A4',2017,'Оранжевый','Е41КХ797',3),(17,'Mercedes','C',2007,'Красный','Е111КХ777',5);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `name_first` varchar(25) NOT NULL,
  `name_second` varchar(25) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Ангелина','Шарапова','88403120953','luchezarfomin@example.com'),(2,'Станимир','Сорокина','82641036539','nikandr_68@example.org'),(3,'Светлана','Колесникова','81643743121','valerjan52@example.com'),(4,'Екатерина','Симонова','81924665540','erofe_1989@example.org'),(5,'Ульяна','Фомичев','81902574135','ksuvorova@example.com'),(6,'Доброслав','Максимова','87441550855','ljubim1992@example.com'),(7,'Агафон','Виноградова','86875576444','agap69@example.net'),(8,'Олег','Ильина','81386226840','shchukinaregina@example.net'),(9,'Герман','Авдеев','89718155835','gerasimovaksenija@example.com'),(10,'Назар','Беляева','84498217140','onufriribakov@example.org'),(11,'Велимир','Кошелев','84327181576','maksimovlazar@example.com'),(12,'Агата','Егорова','89973807814','blohinsolomon@example.com'),(13,'Борис','Беляев','83268173012','ruben2014@example.com'),(14,'Гаврила','Казакова','81710546031','marfa1994@example.com'),(15,'Максимильян','Потапов','82343085984','avdeevmartin@example.com'),(16,'Фаина','Куликов','88558569684','matveevruslan@example.com'),(18,'Анис','Анисимов','88005553535','anis@example.com');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `id_driver` int NOT NULL AUTO_INCREMENT,
  `name_first` varchar(25) NOT NULL,
  `name_second` varchar(25) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number_license` varchar(15) NOT NULL,
  `id_car` int NOT NULL,
  PRIMARY KEY (`id_driver`),
  KEY `fk_drivers_cars1_idx` (`id_car`),
  CONSTRAINT `fk_drivers_cars1` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id_car`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Корнил','Бобылева','+1234567890','gorshkovaregina@example.com','1392464',12),(2,'Юлиан','Селезнев','84638527942','ernest1970@example.com','6625006',16),(3,'Евсей','Быкова','83459143405','pavlovselivan@example.com','9877892',6),(4,'Аристарх','Тихонов','86315913604','gorbunovtimur@example.net','6281649',7),(5,'Будимир','Гришина','88995147958','elena_25@example.org','3858012',3),(6,'Варфоломей','Авдеев','80600576416','uvarovegor@example.com','8627187',13),(7,'Антип','Мельников','85630472033','karl_2016@example.net','6479701',4),(8,'Эраст','Кузьмина','81682716741','ckrjukova@example.com','6330085',5),(9,'Борис','Дмитриева','86913070859','rodionevdokimov@example.com','9769373',14),(10,'Юлиан','Тетерин','89962621032','ziminbogdan@example.org','1346128',10),(11,'Евграф','Архипов','86014857836','olga91@example.net','3090038',2),(12,'Фортунат','Кошелева','83018248603','stanimir_1972@example.net','1639580',8),(13,'Ермил','Исакова','85964618232','ippolit38@example.com','8092522',15),(14,'Кондратий','Дьячкова','88920558089','savinsofron@example.net','7513587',11),(15,'Галактион','Лаврентьева','85458083234','antonovdemjan@example.org','3514343',9),(16,'Геннадий','Соколов','82289764954','prohorprohorov@example.org','8588544',1),(17,'Петр','Васильев','85964618111','dsad@example.com','1392467',1);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`selebry`@`%`*/ /*!50003 TRIGGER `ValidateDriverEmail` BEFORE INSERT ON `drivers` FOR EACH ROW BEGIN
    IF NOT IsEmailValid(NEW.email) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid email format. Must be from @example.com domain.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fares`
--

DROP TABLE IF EXISTS `fares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fares` (
  `id_fare` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id_fare`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fares`
--

LOCK TABLES `fares` WRITE;
/*!40000 ALTER TABLE `fares` DISABLE KEYS */;
INSERT INTO `fares` VALUES (1,'Эконом','Дешевый тариф'),(2,'Комфорт','Комфортный по цене'),(3,'Комфорт+','Сверх уют'),(4,'Минивэн','Сверх место'),(5,'Бизнес','Ультра мега лакшери');
/*!40000 ALTER TABLE `fares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order details`
--

DROP TABLE IF EXISTS `order details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order details` (
  `id_order_detail` int NOT NULL AUTO_INCREMENT,
  `date_order` datetime NOT NULL,
  `payment_type` enum('cash','card') NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` enum('delivery','progress','done') NOT NULL,
  PRIMARY KEY (`id_order_detail`),
  CONSTRAINT `order details_ibfk_1` FOREIGN KEY (`id_order_detail`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order details`
--

LOCK TABLES `order details` WRITE;
/*!40000 ALTER TABLE `order details` DISABLE KEYS */;
INSERT INTO `order details` VALUES (1,'2022-10-24 00:00:00','cash',200.00,'done'),(2,'2022-10-27 00:00:00','cash',200.00,'done'),(3,'2022-10-25 00:00:00','cash',200.00,'done'),(4,'2022-10-27 08:26:45','cash',200.00,'done'),(5,'2023-10-27 10:22:56','card',2409.00,'done'),(6,'2023-10-27 02:25:29','cash',4738.00,'progress'),(7,'2023-10-27 08:04:51','cash',376.00,'done'),(8,'2023-10-27 08:29:12','cash',484.00,'delivery'),(9,'2023-10-27 02:12:11','card',4195.00,'progress'),(10,'2023-10-27 04:34:45','cash',4509.00,'delivery'),(11,'2023-10-27 20:01:13','cash',1883.00,'progress'),(12,'2023-10-27 16:12:41','cash',2952.00,'done'),(13,'2023-10-27 16:38:51','cash',4667.00,'delivery'),(14,'2023-10-27 12:10:40','card',4954.00,'progress'),(15,'2023-10-27 19:40:00','cash',1386.00,'progress'),(16,'2023-10-27 12:23:43','card',716.00,'done'),(17,'2023-10-27 01:54:52','card',3518.00,'progress'),(18,'2023-10-27 22:44:21','card',2147.00,'progress'),(19,'2023-10-27 07:14:05','card',3483.00,'progress'),(20,'2023-10-27 02:55:38','cash',1836.00,'done'),(21,'2023-10-27 04:22:31','cash',4492.00,'progress'),(22,'2023-10-27 02:57:08','cash',344.00,'delivery'),(23,'2023-10-27 20:45:25','card',3010.00,'progress'),(24,'2023-10-27 01:49:28','cash',2502.00,'delivery'),(25,'2023-10-27 16:24:16','cash',3470.00,'done'),(26,'2023-10-27 02:42:49','cash',3401.00,'delivery'),(27,'2023-10-27 19:25:29','card',2054.00,'delivery'),(28,'2023-10-27 22:34:57','card',2399.00,'done'),(29,'2023-10-27 00:49:28','cash',2882.00,'delivery'),(30,'2023-10-27 00:47:13','cash',2780.00,'delivery'),(31,'2023-10-27 22:28:18','card',1534.00,'done'),(32,'2023-10-27 15:56:35','card',1964.00,'delivery'),(33,'2023-10-27 09:10:59','cash',1488.00,'progress'),(34,'2023-10-27 14:10:09','cash',3159.00,'progress'),(35,'2023-10-27 06:38:38','cash',3203.00,'done'),(36,'2023-10-27 07:39:44','card',1385.00,'delivery'),(37,'2023-10-27 14:43:02','card',2764.00,'progress'),(38,'2023-10-27 14:54:35','cash',3637.00,'progress'),(39,'2023-10-27 14:06:27','cash',4296.00,'done'),(40,'2023-10-27 23:10:28','card',2521.00,'progress'),(41,'2023-10-27 04:27:25','card',4908.00,'done'),(42,'2023-10-27 16:46:41','card',2545.00,'progress'),(43,'2023-10-27 23:36:38','cash',2954.00,'delivery'),(44,'2023-10-27 09:46:39','cash',787.00,'progress'),(45,'2023-10-27 17:05:10','card',1037.00,'progress'),(46,'2023-10-27 23:34:15','cash',3779.00,'done'),(47,'2023-10-27 09:43:39','cash',1776.00,'progress'),(48,'2023-10-27 05:43:34','cash',2486.00,'delivery'),(49,'2023-10-27 03:02:34','cash',2483.00,'done'),(50,'2023-10-27 08:00:31','card',2630.00,'delivery');
/*!40000 ALTER TABLE `order details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`selebry`@`%`*/ /*!50003 TRIGGER `CheckOrderPaymentType` BEFORE INSERT ON `order details` FOR EACH ROW BEGIN
    IF NEW.payment_type NOT IN ('cash', 'card') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid payment type';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `id_driver` int NOT NULL,
  `address_source` varchar(255) NOT NULL,
  `address_target` varchar(255) NOT NULL,
  `id_fare` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_client` (`id_client`),
  KEY `id_driver` (`id_driver`),
  KEY `id_fare` (`id_fare`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_driver`) REFERENCES `drivers` (`id_driver`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_fare`) REFERENCES `fares` (`id_fare`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,4,5,'Мытищи, бульвар Гоголя, 21','Мытищи, спуск Ладыгина, 71',3),(2,5,12,'Мытищи, бульвар Гоголя, 41','Мытищи, бульвар Гоголя, 9',2),(3,14,14,'Сергиев Посад, бульвар Гоголя, 34','Сергиев Посад, пер. Домодедовская, 36',4),(4,12,11,'Красногорск, пер. Домодедовская, 72','Красногорск, ул. Бухарестская, 68',2),(5,8,13,'Сергиев Посад, пер. Бухарестская, 84','Сергиев Посад, пер. Ломоносова, 44',1),(6,14,6,'Мытищи, улица Ленина, 11','Мытищи, бульвар Гоголя, 35',5),(7,14,16,'Санк-Петербург, наб. Гагарина, 77','Санк-Петербург, улица Ленина, 80',4),(8,4,8,'Кашира, наб. Гагарина, 31','Кашира, бульвар Гоголя, 80',4),(9,3,6,'Сергиев Посад, пер. Домодедовская, 85','Сергиев Посад, спуск Бухарестская, 23',4),(10,6,16,'Красногорск, ул. Бухарестская, 8','Красногорск, бульвар Гоголя, 4',1),(11,4,2,'Кашира, улица Ленина, 48','Кашира, пер. Домодедовская, 89',3),(12,9,3,'Красногорск, пер. Бухарестская, 99','Красногорск, бульвар Гоголя, 22',2),(13,12,11,'Сергиев Посад, спуск Бухарестская, 41','Сергиев Посад, ул. Бухарестская, 26',5),(14,3,1,'Домодедово, пер. Ломоносова, 61','Домодедово, ул. Бухарестская, 85',4),(15,12,16,'Мытищи, ул. Бухарестская, 46','Мытищи, наб. Гагарина, 99',5),(16,7,10,'Чехов, пер. Домодедовская, 27','Чехов, улица Ленина, 71',1),(17,5,9,'Кашира, пер. Ломоносова, 86','Кашира, спуск Бухарестская, 19',2),(18,15,3,'Сергиев Посад, бульвар Гоголя, 3','Сергиев Посад, пер. Ломоносова, 100',3),(19,10,16,'Чехов, пер. Ломоносова, 72','Чехов, спуск Ладыгина, 89',3),(20,2,8,'Чехов, улица Ленина, 87','Чехов, наб. Гагарина, 32',2),(21,14,12,'Чехов, пер. Домодедовская, 80','Чехов, пер. Домодедовская, 9',1),(22,6,6,'Кашира, пер. Ломоносова, 1','Кашира, наб. Гагарина, 97',1),(23,4,14,'Красногорск, спуск Ладыгина, 82','Красногорск, наб. Гагарина, 70',4),(24,12,6,'Чехов, спуск Ладыгина, 70','Чехов, пер. Ломоносова, 85',3),(25,15,8,'Санк-Петербург, ул. Бухарестская, 75','Санк-Петербург, пер. Ломоносова, 68',1),(26,3,13,'Домодедово, пер. Ломоносова, 85','Домодедово, пер. Бухарестская, 31',2),(27,12,15,'Сергиев Посад, наб. Гагарина, 11','Сергиев Посад, спуск Ладыгина, 53',2),(28,12,12,'Сергиев Посад, спуск Бухарестская, 33','Сергиев Посад, пер. Ломоносова, 45',1),(29,8,5,'Кашира, бульвар Гоголя, 75','Кашира, улица Ленина, 66',3),(30,2,9,'Чехов, спуск Ладыгина, 24','Чехов, ул. Бухарестская, 95',3),(31,2,14,'Мытищи, спуск Ладыгина, 91','Мытищи, наб. Гагарина, 23',1),(32,5,14,'Санк-Петербург, улица Ленина, 93','Санк-Петербург, наб. Гагарина, 83',5),(33,14,10,'Санк-Петербург, пер. Ломоносова, 90','Санк-Петербург, спуск Бухарестская, 63',2),(34,1,16,'Мытищи, спуск Бухарестская, 39','Мытищи, спуск Ладыгина, 94',4),(35,4,6,'Сергиев Посад, спуск Бухарестская, 41','Сергиев Посад, пер. Домодедовская, 2',5),(36,14,10,'Москва, улица Ленина, 26','Москва, улица Ленина, 76',1),(37,13,1,'Кашира, ул. Бухарестская, 88','Кашира, пер. Домодедовская, 71',2),(38,7,4,'Москва, улица Ленина, 2','Москва, улица Ленина, 71',2),(39,2,13,'Санк-Петербург, пер. Бухарестская, 46','Санк-Петербург, спуск Ладыгина, 50',5),(40,7,1,'Сергиев Посад, пер. Ломоносова, 100','Сергиев Посад, пер. Бухарестская, 18',2),(41,4,16,'Красногорск, пер. Бухарестская, 9','Красногорск, бульвар Гоголя, 12',2),(42,13,4,'Москва, спуск Ладыгина, 34','Москва, спуск Бухарестская, 69',1),(43,5,6,'Домодедово, спуск Ладыгина, 10','Домодедово, пер. Бухарестская, 38',1),(44,5,14,'Мытищи, улица Ленина, 3','Мытищи, ул. Бухарестская, 22',5),(45,13,5,'Кашира, наб. Гагарина, 48','Кашира, ул. Бухарестская, 84',4),(46,3,6,'Домодедово, наб. Гагарина, 47','Домодедово, пер. Ломоносова, 38',5),(47,9,6,'Сергиев Посад, улица Ленина, 51','Сергиев Посад, наб. Гагарина, 23',1),(48,4,15,'Сергиев Посад, бульвар Гоголя, 38','Сергиев Посад, наб. Гагарина, 53',2),(49,13,8,'Москва, пер. Бухарестская, 64','Москва, спуск Ладыгина, 20',5),(50,6,3,'Кашира, ул. Бухарестская, 82','Кашира, бульвар Гоголя, 8',3),(52,1,1,'dad','das',1),(53,1,1,'fdsf','fdsf',1),(54,1,1,'Москва','Супер Город',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rates` (
  `id_rate` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `rate_client` int NOT NULL,
  `rate_driver` int NOT NULL,
  PRIMARY KEY (`id_rate`),
  KEY `id_order` (`id_order`),
  CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
INSERT INTO `rates` VALUES (1,1,9,1),(2,2,2,4),(3,3,7,0),(4,4,4,5),(5,5,1,0),(6,6,4,7),(7,7,1,8),(8,8,6,6),(9,9,2,10),(10,10,4,4),(11,11,3,8),(12,12,2,2),(13,13,5,4),(14,14,2,7),(15,15,9,10),(16,16,6,3),(17,17,2,1),(18,18,5,1),(19,19,6,7),(20,20,0,5),(21,21,2,6),(22,22,0,4),(23,23,6,3),(24,24,8,4),(25,25,6,6),(26,26,7,0),(27,27,3,8),(28,28,0,8),(29,29,3,2),(30,30,0,4),(31,31,2,10),(32,32,2,2),(33,33,2,2),(34,34,8,2),(35,35,9,1),(36,36,5,9),(37,37,2,6),(38,38,6,3),(39,39,3,4),(40,40,9,5),(41,41,9,10),(42,42,7,5),(43,43,0,6),(44,44,5,1),(45,45,9,6),(46,46,7,8),(47,47,7,5),(48,48,4,8),(49,49,0,9),(50,50,7,3),(53,5,4,5);
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`selebry`@`%`*/ /*!50003 TRIGGER `UpdateOrderStatusOnRate` AFTER INSERT ON `rates` FOR EACH ROW BEGIN
    UPDATE `order details`
    SET status = 'done'
    WHERE id_order_detail = NEW.id_order;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view_clients_no_orders`
--

DROP TABLE IF EXISTS `view_clients_no_orders`;
/*!50001 DROP VIEW IF EXISTS `view_clients_no_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_clients_no_orders` AS SELECT 
 1 AS `id_client`,
 1 AS `name_first`,
 1 AS `name_second`,
 1 AS `phone`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_drivers_cars`
--

DROP TABLE IF EXISTS `view_drivers_cars`;
/*!50001 DROP VIEW IF EXISTS `view_drivers_cars`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_drivers_cars` AS SELECT 
 1 AS `id_driver`,
 1 AS `name_first`,
 1 AS `name_second`,
 1 AS `phone`,
 1 AS `email`,
 1 AS `number_license`,
 1 AS `id_car`,
 1 AS `brand`,
 1 AS `model`,
 1 AS `year_release`,
 1 AS `color`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_orders_clients`
--

DROP TABLE IF EXISTS `view_orders_clients`;
/*!50001 DROP VIEW IF EXISTS `view_orders_clients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_orders_clients` AS SELECT 
 1 AS `id_order`,
 1 AS `name_first`,
 1 AS `name_second`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_orders_details_clients`
--

DROP TABLE IF EXISTS `view_orders_details_clients`;
/*!50001 DROP VIEW IF EXISTS `view_orders_details_clients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_orders_details_clients` AS SELECT 
 1 AS `id_order_detail`,
 1 AS `date_order`,
 1 AS `payment_type`,
 1 AS `cost`,
 1 AS `status`,
 1 AS `id_client`,
 1 AS `name_first`,
 1 AS `name_second`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_rates_details_clients`
--

DROP TABLE IF EXISTS `view_rates_details_clients`;
/*!50001 DROP VIEW IF EXISTS `view_rates_details_clients`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_rates_details_clients` AS SELECT 
 1 AS `id_rate`,
 1 AS `id_order`,
 1 AS `rate_client`,
 1 AS `rate_driver`,
 1 AS `id_order_detail`,
 1 AS `date_order`,
 1 AS `payment_type`,
 1 AS `cost`,
 1 AS `status`,
 1 AS `id_client`,
 1 AS `name_first`,
 1 AS `name_second`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_table_names`
--

DROP TABLE IF EXISTS `vw_table_names`;
/*!50001 DROP VIEW IF EXISTS `vw_table_names`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_table_names` AS SELECT 
 1 AS `TABLE_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'taxi_handler'
--
/*!50003 DROP FUNCTION IF EXISTS `CalculateOrderCost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` FUNCTION `CalculateOrderCost`(orderId INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
	DECLARE totalCost DECIMAL(10, 2);
    SELECT SUM(cost) INTO totalCost
    FROM `order details`
    WHERE order_id = orderId;
	return totalCost;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DeleteDriverFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` FUNCTION `DeleteDriverFunction`(driverId INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE success BOOLEAN DEFAULT FALSE;
    
    DELETE FROM drivers WHERE id_driver = driverId;

    IF ROW_COUNT() > 0 THEN
        SET success = TRUE;
    END IF;

    RETURN success;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getAverageDriverRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` FUNCTION `getAverageDriverRating`(driver_id INT) RETURNS decimal(3,2)
    DETERMINISTIC
BEGIN
    DECLARE avg_driver_rating DECIMAL(3, 2);

    -- Calculate average driver rating
    SELECT AVG(rate_driver)
    INTO avg_driver_rating
    FROM rates r
    JOIN orders o ON r.id_order = o.id_order
    WHERE o.id_driver = driver_id;

    -- Return the result
    RETURN avg_driver_rating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetClientFullName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` FUNCTION `GetClientFullName`(clientId INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE fullName VARCHAR(50);
    SELECT CONCAT(name_first, ' ', name_second) INTO fullName
    FROM clients
    WHERE id_client = clientId;
    RETURN fullName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetDriverEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` FUNCTION `GetDriverEmail`(driverId INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE driverEmail VARCHAR(50);
    SELECT email INTO driverEmail
    FROM drivers
    WHERE id_driver = driverId;
    RETURN driverEmail;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `InsertDriverFunction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` FUNCTION `InsertDriverFunction`(
    firstName VARCHAR(25),
    lastName VARCHAR(25),
    phone VARCHAR(20),
    email VARCHAR(50),
    licenseNumber VARCHAR(15),
    carId INT
) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE newDriverId INT;
    
    INSERT INTO drivers (name_first, name_second, phone, email, number_license)
    VALUES (firstName, lastName, phone, email, licenseNumber);

    SET newDriverId = LAST_INSERT_ID();

    RETURN newDriverId;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `IsEmailValid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` FUNCTION `IsEmailValid`(driverEmail VARCHAR(50)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE isValid BOOLEAN;

    IF driverEmail LIKE '%@example.com' THEN
        SET isValid = TRUE;
    ELSE
        SET isValid = FALSE;
    END IF;

    RETURN isValid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` PROCEDURE `DeleteClient`(IN clientId INT)
BEGIN
    DELETE FROM clients WHERE id_client = clientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCarsForBusinessFare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` PROCEDURE `GetCarsForBusinessFare`()
begin
	SELECT c.*
    FROM cars c
    JOIN fares f ON c.id_fare = f.id_fare
    WHERE f.title = 'Бизнес';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetClientOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` PROCEDURE `GetClientOrders`(IN clientId INT)
BEGIN
    SELECT *
    FROM orders
    WHERE id_client = clientId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` PROCEDURE `InsertClient`(
    IN firstName VARCHAR(25),
    IN lastName VARCHAR(25),
    IN phone VARCHAR(255),
    IN email VARCHAR(255)
)
BEGIN
    INSERT INTO clients (name_first, name_second, phone, email)
    VALUES (firstName, lastName, phone, email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDriverPhone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`selebry`@`%` PROCEDURE `UpdateDriverPhone`(IN driverId INT, IN newPhone VARCHAR(20))
BEGIN
    UPDATE drivers
    SET phone = newPhone
    WHERE id_driver = driverId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_clients_no_orders`
--

/*!50001 DROP VIEW IF EXISTS `view_clients_no_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`selebry`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_clients_no_orders` AS select `c`.`id_client` AS `id_client`,`c`.`name_first` AS `name_first`,`c`.`name_second` AS `name_second`,`c`.`phone` AS `phone`,`c`.`email` AS `email` from (`clients` `c` left join `orders` `o` on((`c`.`id_client` = `o`.`id_client`))) where (`o`.`id_client` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_drivers_cars`
--

/*!50001 DROP VIEW IF EXISTS `view_drivers_cars`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`selebry`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_drivers_cars` AS select `d`.`id_driver` AS `id_driver`,`d`.`name_first` AS `name_first`,`d`.`name_second` AS `name_second`,`d`.`phone` AS `phone`,`d`.`email` AS `email`,`d`.`number_license` AS `number_license`,`d`.`id_car` AS `id_car`,`c`.`brand` AS `brand`,`c`.`model` AS `model`,`c`.`year_release` AS `year_release`,`c`.`color` AS `color` from (`drivers` `d` join `cars` `c` on((`d`.`id_car` = `c`.`id_car`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_orders_clients`
--

/*!50001 DROP VIEW IF EXISTS `view_orders_clients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`selebry`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_orders_clients` AS select `o`.`id_order` AS `id_order`,`c`.`name_first` AS `name_first`,`c`.`name_second` AS `name_second` from (`orders` `o` join `clients` `c` on((`o`.`id_client` = `c`.`id_client`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_orders_details_clients`
--

/*!50001 DROP VIEW IF EXISTS `view_orders_details_clients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`selebry`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_orders_details_clients` AS select `od`.`id_order_detail` AS `id_order_detail`,`od`.`date_order` AS `date_order`,`od`.`payment_type` AS `payment_type`,`od`.`cost` AS `cost`,`od`.`status` AS `status`,`o`.`id_client` AS `id_client`,`c`.`name_first` AS `name_first`,`c`.`name_second` AS `name_second` from ((`order details` `od` join `orders` `o` on((`od`.`id_order_detail` = `o`.`id_order`))) join `clients` `c` on((`o`.`id_client` = `c`.`id_client`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_rates_details_clients`
--

/*!50001 DROP VIEW IF EXISTS `view_rates_details_clients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`selebry`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_rates_details_clients` AS select `r`.`id_rate` AS `id_rate`,`r`.`id_order` AS `id_order`,`r`.`rate_client` AS `rate_client`,`r`.`rate_driver` AS `rate_driver`,`od`.`id_order_detail` AS `id_order_detail`,`od`.`date_order` AS `date_order`,`od`.`payment_type` AS `payment_type`,`od`.`cost` AS `cost`,`od`.`status` AS `status`,`o`.`id_client` AS `id_client`,`c`.`name_first` AS `name_first`,`c`.`name_second` AS `name_second` from (((`rates` `r` join `orders` `o` on((`r`.`id_order` = `o`.`id_order`))) join `order details` `od` on((`r`.`id_order` = `od`.`id_order_detail`))) join `clients` `c` on((`o`.`id_client` = `c`.`id_client`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_table_names`
--

/*!50001 DROP VIEW IF EXISTS `vw_table_names`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_table_names` AS select `information_schema`.`tables`.`TABLE_NAME` AS `TABLE_NAME` from `information_schema`.`TABLES` where ((`information_schema`.`tables`.`TABLE_TYPE` = 'BASE TABLE') and (`information_schema`.`tables`.`TABLE_SCHEMA` = 'taxi_handler')) */;
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

-- Dump completed on 2023-12-21 23:50:50
