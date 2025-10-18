-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: his_choray_n23dcpt077
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `bacsi`
--

DROP TABLE IF EXISTS `bacsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bacsi` (
  `doctor_id` int NOT NULL,
  `ho_ten` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chuyen_khoa` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Owner: Nguyễn Thị Ngọc Hân - N23DCPT077';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bacsi`
--

LOCK TABLES `bacsi` WRITE;
/*!40000 ALTER TABLE `bacsi` DISABLE KEYS */;
/*!40000 ALTER TABLE `bacsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benhnhan`
--

DROP TABLE IF EXISTS `benhnhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benhnhan` (
  `patient_id` int NOT NULL,
  `ho_ten` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cccd` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Owner: Nguyễn Thị Ngọc Hân - N23DCPT077';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benhnhan`
--

LOCK TABLES `benhnhan` WRITE;
/*!40000 ALTER TABLE `benhnhan` DISABLE KEYS */;
/*!40000 ALTER TABLE `benhnhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donthuoc`
--

DROP TABLE IF EXISTS `donthuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donthuoc` (
  `prescription_id` int NOT NULL,
  `record_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `ngay_lap` datetime DEFAULT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `fk_rx_hs` (`record_id`),
  KEY `fk_rx_bs` (`doctor_id`),
  CONSTRAINT `fk_rx_bs` FOREIGN KEY (`doctor_id`) REFERENCES `bacsi` (`doctor_id`),
  CONSTRAINT `fk_rx_hs` FOREIGN KEY (`record_id`) REFERENCES `hosobenhan` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Owner: Nguyễn Thị Ngọc Hân - N23DCPT077';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donthuoc`
--

LOCK TABLES `donthuoc` WRITE;
/*!40000 ALTER TABLE `donthuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `donthuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `invoice_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `tong_tien` decimal(12,2) DEFAULT NULL,
  `ngay_lap` datetime DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_hd_bn` (`patient_id`),
  CONSTRAINT `fk_hd_bn` FOREIGN KEY (`patient_id`) REFERENCES `benhnhan` (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Owner: Nguyễn Thị Ngọc Hân - N23DCPT077';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosobenhan`
--

DROP TABLE IF EXISTS `hosobenhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hosobenhan` (
  `record_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `ngay_kham` datetime DEFAULT NULL,
  `chan_doan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ghi_chu` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`record_id`),
  KEY `fk_hsbn_bn` (`patient_id`),
  KEY `fk_hsbn_bs` (`doctor_id`),
  CONSTRAINT `fk_hsbn_bn` FOREIGN KEY (`patient_id`) REFERENCES `benhnhan` (`patient_id`),
  CONSTRAINT `fk_hsbn_bs` FOREIGN KEY (`doctor_id`) REFERENCES `bacsi` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Owner: Nguyễn Thị Ngọc Hân - N23DCPT077';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosobenhan`
--

LOCK TABLES `hosobenhan` WRITE;
/*!40000 ALTER TABLE `hosobenhan` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosobenhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lichhen`
--

DROP TABLE IF EXISTS `lichhen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lichhen` (
  `appointment_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `thoi_gian` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `fk_lh_bn` (`patient_id`),
  KEY `fk_lh_bs` (`doctor_id`),
  CONSTRAINT `fk_lh_bn` FOREIGN KEY (`patient_id`) REFERENCES `benhnhan` (`patient_id`),
  CONSTRAINT `fk_lh_bs` FOREIGN KEY (`doctor_id`) REFERENCES `bacsi` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Owner: Nguyễn Thị Ngọc Hân - N23DCPT077';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichhen`
--

LOCK TABLES `lichhen` WRITE;
/*!40000 ALTER TABLE `lichhen` DISABLE KEYS */;
/*!40000 ALTER TABLE `lichhen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectinfo`
--

DROP TABLE IF EXISTS `projectinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectinfo` (
  `id` tinyint NOT NULL,
  `owner_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `projectinfo_chk_1` CHECK ((`id` = 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Case Study HIS Chợ Rẫy – Owner: Nguyễn Thị Ngọc Hân - N23DCPT077';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectinfo`
--

LOCK TABLES `projectinfo` WRITE;
/*!40000 ALTER TABLE `projectinfo` DISABLE KEYS */;
INSERT INTO `projectinfo` VALUES (1,'Nguyễn Thị Ngọc Hân','N23DCPT077','2025-10-18 08:47:34');
/*!40000 ALTER TABLE `projectinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoc`
--

DROP TABLE IF EXISTS `thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoc` (
  `medicine_id` int NOT NULL,
  `prescription_id` int NOT NULL,
  `ten_thuoc` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_luong` int DEFAULT NULL,
  `don_vi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lieu_dung` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`medicine_id`),
  KEY `fk_thuoc_rx` (`prescription_id`),
  CONSTRAINT `fk_thuoc_rx` FOREIGN KEY (`prescription_id`) REFERENCES `donthuoc` (`prescription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Owner: Nguyễn Thị Ngọc Hân - N23DCPT077';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xetnghiem`
--

DROP TABLE IF EXISTS `xetnghiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xetnghiem` (
  `labtest_id` int NOT NULL,
  `record_id` int NOT NULL,
  `ten_xn` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_qua` text COLLATE utf8mb4_unicode_ci,
  `thoi_gian_kq` datetime DEFAULT NULL,
  PRIMARY KEY (`labtest_id`),
  KEY `fk_xn_hs` (`record_id`),
  CONSTRAINT `fk_xn_hs` FOREIGN KEY (`record_id`) REFERENCES `hosobenhan` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Owner: Nguyễn Thị Ngọc Hân - N23DCPT077';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xetnghiem`
--

LOCK TABLES `xetnghiem` WRITE;
/*!40000 ALTER TABLE `xetnghiem` DISABLE KEYS */;
/*!40000 ALTER TABLE `xetnghiem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-18 16:14:03
