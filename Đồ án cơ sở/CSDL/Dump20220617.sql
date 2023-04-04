-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: java-school-project
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `p_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `cart_number` int NOT NULL,
  PRIMARY KEY (`p_id`,`user_id`),
  KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKpl6pbraeiswg0htp4k5yq8vt0` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (7,1,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `iv_id` bigint NOT NULL,
  `created_date` bigint DEFAULT NULL,
  `modified_date` bigint NOT NULL,
  `iv_address` varchar(255) DEFAULT NULL,
  `iv_describe` varchar(255) DEFAULT NULL,
  `iv_status` bit(1) NOT NULL,
  `iv_total` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`iv_id`),
  KEY `FKjunvl5maki3unqdvljk31kns3` (`user_id`),
  CONSTRAINT `FKjunvl5maki3unqdvljk31kns3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,1654699487837,1654699546363,'dsdasf fsafas','',_binary '',45000,1),(2,1654704681894,1654704752244,'abc xyz','',_binary '',207000,3),(3,1654704793388,1654704793471,'abc xyz','',_binary '\0',460000,1);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_detail`
--

DROP TABLE IF EXISTS `invoice_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_detail` (
  `iv_id` bigint NOT NULL,
  `p_id` bigint NOT NULL,
  `created_date` bigint DEFAULT NULL,
  `modified_date` bigint NOT NULL,
  `number` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`iv_id`,`p_id`),
  KEY `FKe53eaq597v1mvccca86tow1cv` (`p_id`),
  CONSTRAINT `FKe53eaq597v1mvccca86tow1cv` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`),
  CONSTRAINT `FKo6iq48l05cvhwyc4p2wxmo4ih` FOREIGN KEY (`iv_id`) REFERENCES `invoice` (`iv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_detail`
--

LOCK TABLES `invoice_detail` WRITE;
/*!40000 ALTER TABLE `invoice_detail` DISABLE KEYS */;
INSERT INTO `invoice_detail` VALUES (1,1,1654699487889,1654699487889,1,45000),(2,1,1654704681934,1654704681934,3,54000),(2,6,1654704681969,1654704681969,1,45000),(3,4,1654704793421,1654704793421,1,240000),(3,7,1654704793451,1654704793451,2,110000);
/*!40000 ALTER TABLE `invoice_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `p_id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint DEFAULT NULL,
  `modified_date` bigint NOT NULL,
  `p_des` varchar(255) DEFAULT NULL,
  `p_img` varchar(255) DEFAULT NULL,
  `p_is_active` bit(1) NOT NULL,
  `p_name` varchar(255) DEFAULT NULL,
  `p_number` int NOT NULL,
  `p_price` int NOT NULL,
  `pt_id` bigint NOT NULL,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `UK_cvxh4ke5sjvfak2ejkwd27wbr` (`p_name`),
  KEY `FKjidw1ojj7x6glaalmwj15jvu4` (`pt_id`),
  CONSTRAINT `FKjidw1ojj7x6glaalmwj15jvu4` FOREIGN KEY (`pt_id`) REFERENCES `product_type` (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1654699345378,1654704681922,'Khô gà cay, 100g, hũ','http://localhost:2222/img/1654698915040_pro-1.jpg',_binary '','Khô gà cay',46,54000,1),(2,1654703138964,1654703195607,'Trà xanh Nhật Bản, 100g, hộp','http://localhost:2222/img/1654698915040_pro-13.jpg',_binary '','Trà xanh Nhật Bản',50,105000,5),(3,1654703287148,1655293949059,'Trà Shan tuyết, 80g, hộp','http://localhost:2222/img/1654698915040_pro-14.jpg',_binary '\0','Trà Shan tuyết',50,210000,5),(4,1654703341024,1654704793411,'Nấm đông cô sấy khô, 150g, bịch','http://localhost:2222/img/1654698915040_pro-15.jpg',_binary '','Nấm đông cô sấy khô',49,240000,2),(5,1654703431093,1654703431093,'Cá chỉ vàng sấy lá chanh, 130g, hũ','http://localhost:2222/img/1654698915040_pro-25.jpg',_binary '','Cá chỉ vàng sấy lá chanh',20,80000,1),(6,1654703503231,1654704681960,'Kẹo hương thập cẩm dẻo, 300g, hũ\r\n\r\n\r\n','http://localhost:2222/img/1654698915040_pro-5.webp',_binary '','Kẹo hương thập cẩm dẻo',24,45000,4),(7,1654703721753,1654704793444,'Cà chua bi sấy dẻo, 225g, hũ','http://localhost:2222/img/1654698915040_pro-12.webp',_binary '','Cà chua bi sấy dẻo',23,110000,3),(8,1654703823372,1655293958518,'Chanh dây sấy dẻo, 225g, hũ','http://localhost:2222/img/1654698915040_pro-32.webp',_binary '\0','Chanh dây sấy dẻo',25,105000,3),(9,1654703909126,1654703933945,'Kẹo hương nha đam dẻo, 300g, hũ','http://localhost:2222/img/1654698915040_pro-7.webp',_binary '','Kẹo hương nha đam dẻo',20,45000,4),(10,1654703990436,1654703990436,'Bông atiso sấy khô, 225g, bịch','http://localhost:2222/img/1654698915040_pro-10.webp',_binary '','Bông atiso sấy khô',20,185000,2),(11,1654704081355,1654704081355,'Mực khô xé sợi ăn liền, 65g, hũ','http://localhost:2222/img/1654698915040_pro-3.webp',_binary '','Mực khô xé sợi',20,65000,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `pt_id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint DEFAULT NULL,
  `modified_date` bigint NOT NULL,
  `pt_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pt_id`),
  UNIQUE KEY `UK_rqq5v8ynf7nph1e25ueb9p7yh` (`pt_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,1654699160281,1654699160281,'Thịt khô'),(2,1654699172288,1654699172288,'Thảo mộc'),(3,1654699182454,1654699182454,'Trái cây sấy'),(4,1654699191531,1654699191531,'Bánh mứt'),(5,1654699200280,1654699200280,'Trà');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` bigint DEFAULT NULL,
  `modified_date` bigint NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_phone` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `user_role` int DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_j09k2v8lxofv2vecxu2hde9so` (`user_email`),
  UNIQUE KEY `UK_jnu1quvkutdk73q9fa4d7abe3` (`user_username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1654699045340,1654699537267,'khanhnganvt123@gmail.com','khanh ngan','$2a$10$fSdloh9kDQ/5uai7aJM4IOhHWk40OJb5Bum1tkC9cUT2GYL7R.Gam','0123456789',2,'ngan123'),(2,1654704229422,1654704229422,'abcxyz@gmail.com','abcxyz','$2a$10$a8vpnVgBUXI2oHZeepdGj.FEVYXbydlGbx525q6dK2wFxlICXqUby','0123654789',0,'abcxyz'),(3,1654704517380,1654704517380,'ngan1234@gmail.com','ngan','$2a$10$Gb6Qhjrri0suxVt16AS8Re2HV.HcLiBIFBusyJJ1.19RfRZZMMBVK','0321497856',1,'ngan1234');
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

-- Dump completed on 2022-06-17 16:30:48
