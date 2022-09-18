-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mathu_similarity_index_database
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cached_simularity`
--

DROP TABLE IF EXISTS `cached_simularity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cached_simularity` (
  `cs_id` int NOT NULL AUTO_INCREMENT,
  `similarity` int NOT NULL,
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cached_simularity`
--

LOCK TABLES `cached_simularity` WRITE;
/*!40000 ALTER TABLE `cached_simularity` DISABLE KEYS */;
/*!40000 ALTER TABLE `cached_simularity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `problem_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`problem_id`,`date_time`,`user_email`),
  KEY `comments_user_email_idx` (`user_email`),
  CONSTRAINT `comments_problems_id` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`problem_id`),
  CONSTRAINT `comments_user_email` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `user_email` varchar(60) NOT NULL,
  `problem_id` int NOT NULL,
  PRIMARY KEY (`user_email`,`problem_id`),
  KEY `favorites_problem_id_idx` (`problem_id`),
  CONSTRAINT `favorites_problem_id` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`problem_id`),
  CONSTRAINT `favorites_user_email` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `user_email` varchar(60) NOT NULL,
  `search_input` longtext NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`user_email`,`date_time`),
  CONSTRAINT `history_user_email` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_links`
--

DROP TABLE IF EXISTS `problem_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem_links` (
  `link_id` int NOT NULL AUTO_INCREMENT,
  `problem_id` int NOT NULL,
  `link` longtext NOT NULL,
  PRIMARY KEY (`link_id`,`problem_id`),
  KEY `problem_links_id_idx` (`problem_id`),
  CONSTRAINT `problem_links_id` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`problem_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_links`
--

LOCK TABLES `problem_links` WRITE;
/*!40000 ALTER TABLE `problem_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_tags`
--

DROP TABLE IF EXISTS `problem_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem_tags` (
  `tag_id` int NOT NULL,
  `problem_id` int NOT NULL,
  PRIMARY KEY (`tag_id`,`problem_id`),
  KEY `problem_tags_problem_id_idx` (`problem_id`),
  CONSTRAINT `problem_tags_problem_id` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`problem_id`),
  CONSTRAINT `problem_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_tags`
--

LOCK TABLES `problem_tags` WRITE;
/*!40000 ALTER TABLE `problem_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `problem_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems` (
  `problem_id` int NOT NULL AUTO_INCREMENT,
  `problem` varchar(256) NOT NULL,
  PRIMARY KEY (`problem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (1,'lim _{x \rightarrow 2} 2 x+3'),(2,'lim _{x \rightarrow 2} 2 x+3'),(3,'7,11 \\%'),(4,'t^{0}-1'),(5,'y^{2}-4 y+2=0'),(6,'t'),(7,'mathrm{R} 2000'),(8,'V=0.68 pi r-frac{2}{3} pi r^{3} ackslash'),(9,'d'),(10,'x_{n}=x_{0}(1+r)^{t}'),(11,'7,7 \\%'),(12,'6 \\%'),(13,'a(x)=1+4 x^{2}-5 x-x^{3}'),(14,'T'),(15,'5,3 \\%'),(16,'t'),(17,'t'),(18,'15^{t h}'),(19,'7,1 \\%'),(20,'x^{3}+x^{2}-x+b'),(21,'15,63 \\%'),(22,'f(x)=x^{2}'),(23,'f(x)=frac{1}{x}'),(24,'12,7 \\%'),(25,'20 \\%'),(26,'ackslash'),(27,'mathrm{CD}'),(28,'240000'),(29,'13 \\%'),(30,'98000'),(31,'left(mathrm{CO}_{2}\right)'),(32,'lim _{h \rightarrow 0} frac{f(2+h)-f(2)}{h}'),(33,'-n^{3}-n^{2}+22 n+40=0'),(34,'frac{d y}{d x}'),(35,'frac{d y}{d x}'),(36,'x: x^{3}+3 x^{2}-9 x+5=0'),(37,'frac{d y}{d x}'),(38,'frac{d y}{d x}'),(39,'x y-3=sqrt{x^{7}}'),(40,'y=4 x-2'),(41,'f(x)=x^{3}+x^{2}-5 x-3'),(42,'f(x)=frac{1}{3} x^{3}-frac{7}{2} x^{2}+10 x-4'),(43,'f(x)=frac{2}{3} x^{3}-2 x^{2}-6 x+1'),(44,'g(x)=x^{3}+3 x^{2}-10 x'),(45,'ackslash'),(46,'f(x)=x^{3}+b x^{2}+c x+d'),(47,'Q(4 ; 1), T(p ; 3)'),(48,'sqrt{7}'),(49,'4 	imes 4^{2 a} 	imes 4^{2} 	imes 4^{a}'),(50,'m^{3} n^{2} div n m^{2} 	imes frac{m n}{2}'),(51,'y=2^{x}'),(52,'x: 2 x^{4}-5 x^{2}-12=0'),(53,'frac{2(x+1)}{x-4}+frac{2}{x+1}=frac{2}{(x-4)(x+1)}'),(54,'A B C'),(55,'f(x)=frac{1}{2} x^{2}+2'),(56,'h(x)=a^{x}+q'),(57,'m=-1'),(58,'sqrt{sqrt[3]{sqrt{4096}}}'),(59,'sqrt{frac{x^{2}}{8 x-16}-1} cdot sqrt{8(x-2)}'),(60,'ackslash'),(61,'x^{2}+5 x+9=0'),(62,'ackslash'),(63,'k(	heta)=	an frac{2 	heta}{3}'),(64,'y=-cos 2 	heta'),(65,'3^{x}+3^{x+1}=4 cdot 3^{x}'),(66,'frac{5^{2} cdot 5^{x}-5^{x+1}}{5^{x}+5^{x+2}}'),(67,'T_{mathrm{n}}=3 n^{2}-2 n+1'),(68,'y=	an 	heta-1'),(69,'m=frac{4}{5}'),(70,'x+2=frac{6}{x}'),(71,'sqrt{frac{19^{5008}+125 cdot 19^{5006}}{81}}'),(72,'frac{15^{n+1} cdot 9^{3 n-1} cdot 25^{n}}{45^{2 n}}'),(73,'b=d-frac{3}{2} D .'),(74,'f(	heta) a sin 	heta'),(75,'x^{2}+3 x-frac{56}{x(x+3)}=26'),(76,'15 ; 12 ; 5 ;'),(77,'y=-frac{2}{3} x+3'),(78,'K(-3 ; 6) ; L(1 ;-2)'),(79,'left(4 x^{2}\right)^{frac{1}{4}}(x)^{frac{1}{2}}'),(80,'y+2 x=1'),(81,'a x^{2}+b x+c=0'),(82,'t: 5 tleft(t-frac{5}{4}\right)=frac{-30}{5 t^{2}-frac{1}{4} t}+11'),(83,'left(-y^{2}\right)^{frac{4}{3}}'),(84,'frac{a sqrt{a sqrt{a}}}{sqrt[3]{a^{4}}}'),(85,'P hat{Q} R'),(86,'A B C D'),(87,'h'),(88,'k=frac{x^{2}-4}{2 x-5}'),(89,'k'),(90,'frac{b-a}{a^{frac{1}{2}}-b^{frac{1}{2}}}'),(91,'D'),(92,'x=frac{3 pm sqrt{9-p^{2}}}{2}'),(93,'(sqrt{x}-sqrt{2})(sqrt{x}+sqrt{2})'),(94,'x: frac{x sqrt[3]{x sqrt{x}}}{x}'),(95,'sqrt{72 x^{1} 00}+sqrt{32 x^{1} 00}'),(96,'P hat{S} R'),(97,'h(x)=frac{a}{x-p}+q'),(98,'0 geq 7 x^{2}-x+8'),(99,'B hat{C} A'),(100,'frac{(x-1)^{frac{1}{2}}}{x^{2}+2}'),(101,'frac{3}{sqrt{5}-1}'),(102,'ackslash'),(103,'x^{2}-1-y=0 ; y+x-5=0'),(104,'frac{2 x-20}{sqrt{x}-sqrt{10}}'),(105,'frac{x-4}{sqrt{x}+2}'),(106,'y-2 x=0 y-x^{2}-2 x+3=0'),(107,'f(x)=a(x+p)^{2}+q'),(108,'f(x)=a(x+p)^{2}+q'),(109,'g(x)=-left(frac{1}{2}\right)^{x+2}-1'),(110,'x^{2}+b x+c=0'),(111,'x'),(112,'4^{2 x}+3.4^{x}-28=0'),(113,'sqrt{x-3} cdot sqrt{x+1}=2 sqrt{3}'),(114,'g'),(115,'f(x)=frac{2}{x+1}-3'),(116,'4+p=sqrt{p+6}'),(117,'x: |'),(118,'A'),(119,'frac{f(x)}{g(x)} leq 0'),(120,'f(x)=a x^{2}+b x+c'),(121,'f(x)=sin x+1'),(122,'f(x)=2 	an x'),(123,'3 ackslash'),(124,'$ 2^{wedge} 2 ackslash'),(125,'7 $'),(126,'$ 60+87+40+13 $'),(127,'$ 25 ackslash'),(128,'50 $'),(129,'5 ; 3,0 ; 4,5 ; ldots ; ldots ; ldots ; ldots ; ldots ;'),(130,'$ 22^{wedge} 3 ackslash'),(131,'$ 6 $ ?'),(132,'$ 1'),(133,'$ ackslash'),(134,'$ 25 $'),(135,'sqrt{100}'),(136,'20 \\%'),(137,'7 e^{2} f+3 e f+2+4 e f'),(138,'3 	imes(-5)^{2}'),(139,'40000'),(140,'65'),(141,'-2 ackslash'),(142,'left(-5^{2}\right)=-5^{2}'),(143,'x'),(144,'10^{6}'),(145,'$ 2^{wedge}{3} ackslash'),(146,'$ 2 $'),(147,'$ ackslash operatorname{left}left(2^{wedge}{4} mid operatorname{right}\right)^{wedge}{3}=2^{wedge}{4 ackslash'),(148,'$left(9^{wedge} 2\right)^{wedge} 3 $'),(149,'5^{6}-5^{4}=5^{6-4}'),(150,'X Y'),(151,'mathrm{A}'),(152,'2 	imes 10^{2}+9 	imes 10+6'),(153,'7 	imes 10^{3}+7 	imes 10^{2}+7 	imes 10+7'),(154,'0,1,4,5,6'),(155,'M N'),(156,'$ 3^{wedge}{10}'),(157,'$ 21^{wedge}{4} $'),(158,'$ 6^{wedge}{3} ackslash'),(159,'$ 6^{wedge}{17} ackslash operatorname{div} 6^{wedge}{17} $'),(160,'$ 60^{wedge}{ackslash operatorname{circ}} $'),(161,'$ ackslash operatorname{mathrm}{mathrm{SR}} $'),(162,'sqrt{1,44}'),(163,'$>$'),(164,'$ 1,04 ackslash'),(165,'mathrm{AB}, mathrm{BC}, mathrm{CD}, ldots'),(166,'mathrm{R} 250'),(167,'egin{array}{l}'),(168,'lim _{x \rightarrow 2} 2 x+3'),(169,'7,11 \\%'),(170,'t^{0}-1'),(171,'y^{2}-4 y+2=0'),(172,'t'),(173,'mathrm{R} 2000'),(174,'V=0.68 pi r-frac{2}{3} pi r^{3} ackslash'),(175,'d'),(176,'x_{n}=x_{0}(1+r)^{t}'),(177,'7,7 \\%'),(178,'6 \\%'),(179,'a(x)=1+4 x^{2}-5 x-x^{3}'),(180,'T'),(181,'5,3 \\%'),(182,'t'),(183,'t'),(184,'15^{t h}'),(185,'7,1 \\%'),(186,'x^{3}+x^{2}-x+b'),(187,'15,63 \\%'),(188,'f(x)=x^{2}'),(189,'f(x)=frac{1}{x}'),(190,'12,7 \\%'),(191,'20 \\%'),(192,'ackslash'),(193,'mathrm{CD}'),(194,'240000'),(195,'13 \\%'),(196,'98000'),(197,'left(mathrm{CO}_{2}\right)'),(198,'lim _{h \rightarrow 0} frac{f(2+h)-f(2)}{h}'),(199,'-n^{3}-n^{2}+22 n+40=0'),(200,'frac{d y}{d x}'),(201,'frac{d y}{d x}'),(202,'x: x^{3}+3 x^{2}-9 x+5=0'),(203,'frac{d y}{d x}'),(204,'frac{d y}{d x}'),(205,'x y-3=sqrt{x^{7}}'),(206,'y=4 x-2'),(207,'f(x)=x^{3}+x^{2}-5 x-3'),(208,'f(x)=frac{1}{3} x^{3}-frac{7}{2} x^{2}+10 x-4'),(209,'f(x)=frac{2}{3} x^{3}-2 x^{2}-6 x+1'),(210,'g(x)=x^{3}+3 x^{2}-10 x'),(211,'ackslash'),(212,'f(x)=x^{3}+b x^{2}+c x+d'),(213,'Q(4 ; 1), T(p ; 3)'),(214,'sqrt{7}'),(215,'4 	imes 4^{2 a} 	imes 4^{2} 	imes 4^{a}'),(216,'m^{3} n^{2} div n m^{2} 	imes frac{m n}{2}'),(217,'y=2^{x}'),(218,'x: 2 x^{4}-5 x^{2}-12=0'),(219,'frac{2(x+1)}{x-4}+frac{2}{x+1}=frac{2}{(x-4)(x+1)}'),(220,'A B C'),(221,'f(x)=frac{1}{2} x^{2}+2'),(222,'h(x)=a^{x}+q'),(223,'m=-1'),(224,'sqrt{sqrt[3]{sqrt{4096}}}'),(225,'sqrt{frac{x^{2}}{8 x-16}-1} cdot sqrt{8(x-2)}'),(226,'ackslash'),(227,'x^{2}+5 x+9=0'),(228,'ackslash'),(229,'k(	heta)=	an frac{2 	heta}{3}'),(230,'y=-cos 2 	heta'),(231,'3^{x}+3^{x+1}=4 cdot 3^{x}'),(232,'frac{5^{2} cdot 5^{x}-5^{x+1}}{5^{x}+5^{x+2}}'),(233,'T_{mathrm{n}}=3 n^{2}-2 n+1'),(234,'y=	an 	heta-1'),(235,'m=frac{4}{5}'),(236,'x+2=frac{6}{x}'),(237,'sqrt{frac{19^{5008}+125 cdot 19^{5006}}{81}}'),(238,'frac{15^{n+1} cdot 9^{3 n-1} cdot 25^{n}}{45^{2 n}}'),(239,'b=d-frac{3}{2} D .'),(240,'f(	heta) a sin 	heta'),(241,'x^{2}+3 x-frac{56}{x(x+3)}=26'),(242,'15 ; 12 ; 5 ;'),(243,'y=-frac{2}{3} x+3'),(244,'K(-3 ; 6) ; L(1 ;-2)'),(245,'left(4 x^{2}\right)^{frac{1}{4}}(x)^{frac{1}{2}}'),(246,'y+2 x=1'),(247,'a x^{2}+b x+c=0'),(248,'t: 5 tleft(t-frac{5}{4}\right)=frac{-30}{5 t^{2}-frac{1}{4} t}+11'),(249,'left(-y^{2}\right)^{frac{4}{3}}'),(250,'frac{a sqrt{a sqrt{a}}}{sqrt[3]{a^{4}}}'),(251,'P hat{Q} R'),(252,'A B C D'),(253,'h'),(254,'k=frac{x^{2}-4}{2 x-5}'),(255,'k'),(256,'frac{b-a}{a^{frac{1}{2}}-b^{frac{1}{2}}}'),(257,'D'),(258,'x=frac{3 pm sqrt{9-p^{2}}}{2}'),(259,'(sqrt{x}-sqrt{2})(sqrt{x}+sqrt{2})'),(260,'x: frac{x sqrt[3]{x sqrt{x}}}{x}'),(261,'sqrt{72 x^{1} 00}+sqrt{32 x^{1} 00}'),(262,'P hat{S} R'),(263,'h(x)=frac{a}{x-p}+q'),(264,'0 geq 7 x^{2}-x+8'),(265,'B hat{C} A'),(266,'frac{(x-1)^{frac{1}{2}}}{x^{2}+2}'),(267,'frac{3}{sqrt{5}-1}'),(268,'ackslash'),(269,'x^{2}-1-y=0 ; y+x-5=0'),(270,'frac{2 x-20}{sqrt{x}-sqrt{10}}'),(271,'frac{x-4}{sqrt{x}+2}'),(272,'y-2 x=0 y-x^{2}-2 x+3=0'),(273,'f(x)=a(x+p)^{2}+q'),(274,'f(x)=a(x+p)^{2}+q'),(275,'g(x)=-left(frac{1}{2}\right)^{x+2}-1'),(276,'x^{2}+b x+c=0'),(277,'x'),(278,'4^{2 x}+3.4^{x}-28=0'),(279,'sqrt{x-3} cdot sqrt{x+1}=2 sqrt{3}'),(280,'g'),(281,'f(x)=frac{2}{x+1}-3'),(282,'4+p=sqrt{p+6}'),(283,'x: |'),(284,'A'),(285,'frac{f(x)}{g(x)} leq 0'),(286,'f(x)=a x^{2}+b x+c'),(287,'f(x)=sin x+1'),(288,'f(x)=2 	an x'),(289,'3 ackslash'),(290,'$ 2^{wedge} 2 ackslash'),(291,'7 $'),(292,'$ 60+87+40+13 $'),(293,'$ 25 ackslash'),(294,'50 $'),(295,'5 ; 3,0 ; 4,5 ; ldots ; ldots ; ldots ; ldots ; ldots ;'),(296,'$ 22^{wedge} 3 ackslash'),(297,'$ 6 $ ?'),(298,'$ 1'),(299,'$ ackslash'),(300,'$ 25 $'),(301,'sqrt{100}'),(302,'20 \\%'),(303,'7 e^{2} f+3 e f+2+4 e f'),(304,'3 	imes(-5)^{2}'),(305,'40000'),(306,'65'),(307,'-2 ackslash'),(308,'left(-5^{2}\right)=-5^{2}'),(309,'x'),(310,'10^{6}'),(311,'$ 2^{wedge}{3} ackslash'),(312,'$ 2 $'),(313,'$ ackslash operatorname{left}left(2^{wedge}{4} mid operatorname{right}\right)^{wedge}{3}=2^{wedge}{4 ackslash'),(314,'$left(9^{wedge} 2\right)^{wedge} 3 $'),(315,'5^{6}-5^{4}=5^{6-4}'),(316,'X Y'),(317,'mathrm{A}'),(318,'2 	imes 10^{2}+9 	imes 10+6'),(319,'7 	imes 10^{3}+7 	imes 10^{2}+7 	imes 10+7'),(320,'0,1,4,5,6'),(321,'M N'),(322,'$ 3^{wedge}{10}'),(323,'$ 21^{wedge}{4} $'),(324,'$ 6^{wedge}{3} ackslash'),(325,'$ 6^{wedge}{17} ackslash operatorname{div} 6^{wedge}{17} $'),(326,'$ 60^{wedge}{ackslash operatorname{circ}} $'),(327,'$ ackslash operatorname{mathrm}{mathrm{SR}} $'),(328,'sqrt{1,44}'),(329,'$>$'),(330,'$ 1,04 ackslash'),(331,'mathrm{AB}, mathrm{BC}, mathrm{CD}, ldots'),(332,'mathrm{R} 250'),(333,'egin{array}{l}');
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems_cached_simularity`
--

DROP TABLE IF EXISTS `problems_cached_simularity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problems_cached_simularity` (
  `problem_id` int NOT NULL,
  `cs_id` int NOT NULL,
  PRIMARY KEY (`problem_id`,`cs_id`),
  KEY `pcs_cs_id_idx` (`cs_id`),
  CONSTRAINT `pcs_cs_id` FOREIGN KEY (`cs_id`) REFERENCES `cached_simularity` (`cs_id`),
  CONSTRAINT `pcs_problem_id` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems_cached_simularity`
--

LOCK TABLES `problems_cached_simularity` WRITE;
/*!40000 ALTER TABLE `problems_cached_simularity` DISABLE KEYS */;
/*!40000 ALTER TABLE `problems_cached_simularity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_access_key`
--

DROP TABLE IF EXISTS `temporary_access_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporary_access_key` (
  `user_email` varchar(60) NOT NULL,
  `key` varchar(60) NOT NULL,
  PRIMARY KEY (`user_email`),
  CONSTRAINT `user_tak_email` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_access_key`
--

LOCK TABLES `temporary_access_key` WRITE;
/*!40000 ALTER TABLE `temporary_access_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_access_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `user_email` varchar(60) NOT NULL,
  `dark_theme` tinyint NOT NULL,
  PRIMARY KEY (`user_email`),
  CONSTRAINT `settings_user_email` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(60) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `password_salt` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `users_table_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2022-07-29  2:21:49
