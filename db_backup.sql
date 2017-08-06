-- MySQL dump 10.13  Distrib 5.6.37, for Linux (x86_64)
--
-- Host: localhost    Database: skyline
-- ------------------------------------------------------
-- Server version	5.6.37

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `aid` varchar(45) NOT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin','rashid');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anotice`
--

DROP TABLE IF EXISTS `anotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anotice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `sub` varchar(100) DEFAULT NULL,
  `body` varchar(200) DEFAULT NULL,
  `ufile` longblob,
  `filename` varchar(45) DEFAULT NULL,
  `pdate` varchar(45) DEFAULT NULL,
  `expdate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anotice`
--

LOCK TABLES `anotice` WRITE;
/*!40000 ALTER TABLE `anotice` DISABLE KEYS */;
INSERT INTO `anotice` VALUES (2,'sessional datesheet for final year','Dear student your sessionalwill be started on 30th septamber. It is complusary for all the students. ','','','12-04-2017','04/10/2017'),(3,'project','dear students please sumit you idea and team member name before 4 aug','','','01-08-2017','05/08/2017'),(4,'project','18 aug is last to synopsis ','','','04-08-2017','18/08/2017');
/*!40000 ALTER TABLE `anotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(45) DEFAULT NULL,
  `rid` varchar(45) DEFAULT NULL,
  `msg` varchar(2000) DEFAULT NULL,
  `mdate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'1415310031','1.vineet','hello','30 Jul 2017 2:30:34 PM'),(2,'589257','2.rashid ahmad','h','30 Jul 2017 2:31:45 PM'),(3,'123456','1.harshita mishra','hero','01 Aug 2017 4:23:05 PM'),(4,'123456','2.rashid ahmad','hero','01 Aug 2017 4:23:05 PM'),(5,'1415310031','2.gaurav','hello','01 Aug 2017 4:25:28 PM'),(6,'123456','2.rashid ahmad','kk','01 Aug 2017 4:25:59 PM'),(7,'1415310031','2.gaurav','hellof','01 Aug 2017 4:26:13 PM'),(8,'123456','2.rashid ahmad','hello','01 Aug 2017 4:36:42 PM'),(9,'1415310031','2.gaurav','hhj','01 Aug 2017 4:38:16 PM');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `fid` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('123456','gaurav','gs89065@gmail.com','9458058994','HsURwRKV'),('589257','vineet','vineet16tiwari@gmail.com','9718623959','MbFFfSxE');
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_course`
--

DROP TABLE IF EXISTS `faculty_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty_course` (
  `fid` varchar(45) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_course`
--

LOCK TABLES `faculty_course` WRITE;
/*!40000 ALTER TABLE `faculty_course` DISABLE KEYS */;
INSERT INTO `faculty_course` VALUES ('d79aau','BTech-CS1'),('d79aau','BTech-CS2'),('80ni9S','BTech-EC1'),('80ni9S','BTech-ME1'),('AAGom ','BTech-CS3'),('AAGom ','MCA1'),('AAGom ','MCA2'),('5hv748','MBA1'),('5hv748','MBA2'),('85674a','BTech-CS1'),('85674a','BTech-IT1'),('85674a','BTech-EC1'),('5 7e78','BTech-CS1'),('5 7e78','BTech-ME1'),('et9rtS','BTech-CS2'),('et9rtS','BTech-IT1'),('et9rtS','BTech-EC1'),('6enp67','MCA1'),('6enp67','MBA1'),('SP2nu9','BTech-IT1'),('SP2nu9','MCA2'),('SP2nu9','MBA2'),('7D44h7','BTech-IT1'),('7D44h7','BTech-EC1'),('589257','BTech-CS4'),('123456','BTech-CS4');
/*!40000 ALTER TABLE `faculty_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fnotice`
--

DROP TABLE IF EXISTS `fnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fnotice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `sub` varchar(200) DEFAULT NULL,
  `body` varchar(500) DEFAULT NULL,
  `ufile` longblob,
  `filename` varchar(45) DEFAULT NULL,
  `pdate` varchar(45) DEFAULT NULL,
  `expdate` varchar(45) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `fid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnotice`
--

LOCK TABLES `fnotice` WRITE;
/*!40000 ALTER TABLE `fnotice` DISABLE KEYS */;
INSERT INTO `fnotice` VALUES (1,'assignment submission','All students are requested to submit there assignment on 25th april.','','','14-04-2017','31/05/2017',' BTech-CS1 BTech-CS2','d79aau');
/*!40000 ALTER TABLE `fnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `roll` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `course` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roll`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1415310017,'harshita mishra','sharvan kumar','harshita1101mishra@gmail.com','BTech-CS4','8860654869','Current','cZMDsvP9'),(1415310018,'manisha gangola','qwerty','manishagangola18@gmail.com','BTech-CS4','1234567890','Current','AURME7NE'),(1415310030,'ranu pandey','vijay pandey','ranupandey12@gmail.com','BTech-CS4','9540699232','Current','zwgtkpnJ'),(1415310031,'rashid ahmad','ashfaque ahmad','rashidahmad03@gmail.com','BTech-CS4','8733958134','Current','74r6E56h'),(1415310043,'vishal dikshit','RCDikshit','dixitvishal5@gmail.com','BTech-CS4','8285575105','Current','7CDVESvF'),(1451453201,'harshit','xxxxxx','harshit@incapp.in','BTech-CS4','9877665444','Current','pNEqDUvp'),(1515310028,'Kumar Shiva','Ram Kishun Sah','shiva0354@gmail.com','BTech-CS3','7836848103','Current','hello'),(1521610056,'narish kumar','shiv narayan mehta','nareshnirala79@gmail.com','BTech-CS3','8800792807','Current','BnBEKMWy');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suploads`
--

DROP TABLE IF EXISTS `suploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suploads` (
  `suid` int(11) NOT NULL AUTO_INCREMENT,
  `roll` int(11) DEFAULT NULL,
  `sub` varchar(100) DEFAULT NULL,
  `fnames` varchar(100) DEFAULT NULL,
  `ufile` longblob,
  `filename` varchar(100) DEFAULT NULL,
  `udate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`suid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suploads`
--

LOCK TABLES `suploads` WRITE;
/*!40000 ALTER TABLE `suploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `suploads` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-05 14:55:21
