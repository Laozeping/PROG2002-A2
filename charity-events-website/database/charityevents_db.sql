-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: charityevents_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Gala Dinner','Formal charity dinner events','2025-10-01 17:58:33'),(2,'Fun Run','Fun run fundraising events','2025-10-01 17:58:33'),(3,'Silent Auction','Silent auction events','2025-10-01 17:58:33'),(4,'Concert','Charity concert events','2025-10-01 17:58:33'),(5,'Workshop','Educational and workshop events','2025-10-01 17:58:33'),(6,'Community Fair','Community fair events','2025-10-01 17:58:33');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `full_description` text,
  `category_id` int DEFAULT NULL,
  `organization_id` int DEFAULT NULL,
  `event_date` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `venue_details` text,
  `ticket_price` decimal(10,2) DEFAULT '0.00',
  `goal_amount` decimal(10,2) NOT NULL,
  `current_amount` decimal(10,2) DEFAULT '0.00',
  `max_attendees` int DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_suspended` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `organization_id` (`organization_id`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `events_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Hope Light Annual Charity Gala','Grand annual fundraising dinner','Join us for this unforgettable evening featuring exquisite dining, inspiring speeches, and wonderful entertainment. All proceeds will support education programs for underprivileged children.',1,1,'2025-10-15 18:30:00','Sydney Convention Centre','Grand Ballroom, Level 3',150.00,50000.00,32500.00,300,'/images/event1.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33'),(2,'Urban Fun Run 2025','5km fun run event','Put on your running shoes and join our 5km fun run! Suitable for all ages and fitness levels. Includes T-shirt, medal, and post-race refreshments.',2,2,'2025-09-20 08:00:00','Centennial Park','Main Entrance, Federation Way',25.00,20000.00,12500.00,500,'/images/event2.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33'),(3,'Art Treasures Auction','Exclusive art treasures auction evening','Experience a unique art night bidding on exclusive works from local and international artists. Includes cocktails and appetizers.',3,1,'2025-11-05 19:00:00','Art Gallery of Sydney','Modern Art Wing',75.00,30000.00,18000.00,150,'/images/event3.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33'),(4,'Care Concert','Charity concert by local musicians','Enjoy an evening of classical and contemporary music performed by renowned local musicians. All proceeds will go towards medical equipment purchases.',4,2,'2025-10-28 19:30:00','Sydney Opera House','Utzon Room',60.00,15000.00,8900.00,200,'/images/event4.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33'),(5,'Children Coding Education','Free programming education course','A one-day introductory programming workshop teaching children basic programming concepts and creative thinking.',5,1,'2025-09-12 10:00:00','University of Technology Sydney','Building 11, Room 302',0.00,5000.00,3200.00,30,'/images/event5.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33'),(6,'Autumn Community Fair','Family-friendly community fair','Enjoy food, crafts, games, and entertainment. A wonderful weekend activity for the whole family.',6,1,'2025-09-25 10:00:00','Hyde Park','North of Archibald Fountain',5.00,8000.00,4500.00,1000,'/images/event6.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33'),(7,'Healthy Living Seminar','Nutrition and healthy living education','Learn how to improve quality of life through healthy eating and lifestyle. Includes healthy lunch and information package.',5,2,'2025-10-10 09:00:00','Royal Botanic Garden','The Calyx, Mrs Macquaries Road',20.00,6000.00,3800.00,80,'/images/event7.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33'),(8,'Winter Charity Ball','Formal winter ball fundraising event','Put on your finest attire and join our Winter Charity Ball. Includes dinner, dancing, and raffle activities.',1,2,'2025-06-20 19:00:00','The Star Hotel','Crystal Ballroom',120.00,40000.00,28500.00,250,'/images/event8.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33'),(9,'Beach Cleanup Day','Community beach cleaning environmental activity','Join our beach cleanup activity to protect the marine environment. Gloves, bags, and refreshments provided.',6,1,'2025-08-15 09:00:00','Bondi Beach','South End, near Icebergs',0.00,2000.00,1500.00,100,'/images/event9.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33'),(10,'Photography Exhibition Fundraising','Charity photography exhibition','Admire and purchase beautiful works by local photographers. All sales proceeds will be donated to charity projects.',3,2,'2025-07-22 10:00:00','Paddington Arts District','45 Oxford Street Gallery',10.00,12000.00,7500.00,120,'/images/event10.jpg',1,0,'2025-10-01 17:58:33','2025-10-01 17:58:33');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `mission_statement` text,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'Hope Light Charity Foundation','Dedicated to helping underprivileged children and families improve their living conditions','Creating a better future for vulnerable groups through education and community support','contact@hopelight.org','+61 2 1234 5678','123 Charity Street, Sydney NSW 2000','2025-10-01 17:58:33'),(2,'Care Aid Organization','Non-profit organization focused on medical assistance and health promotion','Ensuring everyone has access to basic medical services and health knowledge','info@careaid.org','+61 3 9876 5432','456 Hope Avenue, Melbourne VIC 3000','2025-10-01 17:58:33');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int DEFAULT NULL,
  `attendee_name` varchar(255) NOT NULL,
  `attendee_email` varchar(255) NOT NULL,
  `attendee_phone` varchar(50) DEFAULT NULL,
  `ticket_quantity` int DEFAULT '1',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--

LOCK TABLES `registrations` WRITE;
/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-02 21:09:19
