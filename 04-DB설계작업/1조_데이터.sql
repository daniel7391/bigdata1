-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '댓글 일련번호',
  `comment_user_name` varchar(50) NOT NULL COMMENT '댓글 작성자이름',
  `like_count` int(11) DEFAULT NULL COMMENT '댓글 좋아요 갯수',
  `reg_date` datetime NOT NULL COMMENT '댓글 등록일',
  `edit_date` datetime NOT NULL COMMENT '댓글 편집일',
  `content` text NOT NULL COMMENT '댓글 내용',
  `tour1_id` int(11) DEFAULT NULL COMMENT '댓글 달려진 위치의 id',
  `tourPlan_id` int(11) DEFAULT NULL COMMENT '댓글 달려진 플랜의 id',
  `member_id` int(11) NOT NULL COMMENT '댓글단 멤버의 id',
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_tour11_idx` (`tour1_id`),
  KEY `fk_comment_tourPlan1_idx` (`tourPlan_id`),
  KEY `fk_comment_member1_idx` (`member_id`),
  CONSTRAINT `fk_comment_member1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_tour11` FOREIGN KEY (`tour1_id`) REFERENCES `tourinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_tourPlan1` FOREIGN KEY (`tourPlan_id`) REFERENCES `tourplan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='댓글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'파랑이',21,'2017-03-03 00:00:00','2017-03-03 00:00:00','세상이 파랗습니다.',3,1,1),(2,'골드',11,'2018-01-01 00:00:00','2018-01-01 00:00:00','금빛세상!!',NULL,2,3),(3,'실버',22,'2015-03-03 00:00:00','2015-04-04 00:00:00','은빛색깔이 납니다',2,NULL,2),(4,'야스오',30,'2018-03-20 00:00:00','2018-04-28 00:00:00','잘봤습니다',1,2,3),(5,'권기현',20,'2018-02-22 00:00:00','2018-03-09 00:00:00','추천해욤',4,4,6),(6,'남호형',10,'2018-02-03 00:00:00','2018-05-02 00:00:00','좋은정보 감사~',2,2,2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원 일련번호',
  `member_user_id` varchar(50) NOT NULL COMMENT '회원아이디',
  `member_pw` varchar(50) NOT NULL COMMENT '회원 비밀번호',
  `member_name` varchar(50) NOT NULL COMMENT '회원 이름',
  `member_name2` varchar(50) NOT NULL COMMENT '회원 닉네임',
  `member_email` varchar(100) NOT NULL COMMENT '회원 이메일',
  `member_age` int(10) NOT NULL COMMENT '회원 나이',
  `member_gender` varchar(5) NOT NULL COMMENT '회원 성별',
  `member_profile_img` varchar(255) DEFAULT NULL COMMENT '회원 프로필사진',
  `reg_date` datetime NOT NULL COMMENT '회원 등록일',
  `edit_date` datetime NOT NULL COMMENT '회원 편집일',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='회원테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'Green','1234','이초롱','초롱이','Green@academy.com',28,'M',NULL,'2018-03-20 00:00:00','2018-03-20 00:00:00'),(2,'Red','5678','이노을','노을이','Red@academy.com',25,'F',NULL,'2018-03-20 00:00:00','2018-03-20 00:00:00'),(3,'kjh1oo','1234','블루','파랑이','kjh1ooo@naver.com',31,'M','null','2018-03-20 00:00:00','2018-03-20 00:00:00'),(4,'hjk1oo','3214','골드','금동이','hjk1oo@naver.com',28,'M','null','2018-03-20 00:00:00','2018-03-20 00:00:00'),(5,'kwonkkh','1234','남호형','야스오','yasuo@gmail.com',26,'M',NULL,'2018-03-18 00:00:00','2018-02-05 00:00:00'),(6,'namho','1222','권기현','오른','kwonkkh@gmail',29,'M','','2018-03-25 00:00:00','2018-09-03 00:00:00');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '사진 일련번호',
  `tour1_id` int(11) DEFAULT NULL COMMENT '사진이 올라간 관광지 id',
  `dir` varchar(255) NOT NULL COMMENT '사진 경로',
  `origin_name` varchar(255) NOT NULL COMMENT '사진 원래이름',
  `name` varchar(255) NOT NULL COMMENT '사진 이름',
  `size` varchar(45) NOT NULL COMMENT '사진 크기',
  `content_type` varchar(45) NOT NULL COMMENT '사진 형식',
  `reg_date` datetime NOT NULL COMMENT '사진 등록일',
  `edit_date` datetime NOT NULL COMMENT '사진 편집일',
  `contents` text NOT NULL COMMENT '사진 내용',
  `tourPlan_id` int(11) DEFAULT NULL COMMENT '사진이 올라간 플랜의 id',
  PRIMARY KEY (`photo_id`),
  KEY `fk_photo_tour11_idx` (`tour1_id`),
  KEY `fk_photo_tourPlan1_idx` (`tourPlan_id`),
  CONSTRAINT `fk_photo_tour11` FOREIGN KEY (`tour1_id`) REFERENCES `tourinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_tourPlan1` FOREIGN KEY (`tourPlan_id`) REFERENCES `tourplan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='사진 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,1,'http://www.naver.com/img.jpg','asodhosad.jpg','그린컴.jpg','210','jpg','2010-03-02 00:00:00','2010-05-25 00:00:00','여기가 학원이다.',1),(2,2,'http://www.daum.net','asdkadwu.png','센트럴파크.png','211','png','2010-03-04 00:00:00','2014-02-02 00:00:00','세계최대의 광장',NULL),(3,NULL,'http://www.daum.net/img2.jpg','fosfheowfh.jpg','재밌는장소.jpg','111','jpg','2010-05-05 00:00:00','2014-05-05 00:00:00','재미난장소입니다.',3),(4,2,'c:/img','220030','경복궁','20','png','2018-03-02 00:00:00','2018-04-05 00:00:00','경복궁 이뻐요',3),(5,4,'e:/img','45u934','올림픽공원','30','img','2018-02-28 00:00:00','2018-03-05 00:00:00','올림픽공원의 경치',4),(6,5,'d:/img','459jke','꿈공원','32','img','2018-03-07 00:00:00','2018-04-05 00:00:00','꿈공원의 경치',3);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '리뷰 일련번호',
  `tour1_id` int(11) NOT NULL COMMENT '리뷰가 달린 관광지 id',
  `like_level` int(11) DEFAULT NULL COMMENT '좋아요 등급(1~4)',
  `people_level` int(11) DEFAULT NULL COMMENT '동행형태',
  `season` int(11) DEFAULT NULL COMMENT '여행간 계절',
  `member_id` int(11) NOT NULL COMMENT '리뷰작성한 멤버의 id',
  PRIMARY KEY (`id`),
  KEY `fk_review_tour1_idx` (`tour1_id`),
  CONSTRAINT `fk_review_tour1` FOREIGN KEY (`tour1_id`) REFERENCES `tourinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='리뷰 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,2,4,3,1),(2,2,2,3,1,3),(3,4,3,2,1,2),(4,5,1,4,1,4),(5,3,4,3,3,5),(6,6,4,4,2,4);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour` (
  `tourCode` int(11) NOT NULL COMMENT '지역코드',
  `tourLocation_gu` varchar(50) NOT NULL COMMENT '지역구이름',
  PRIMARY KEY (`tourCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지역구정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'강남구'),(2,'서초구'),(3,'마포구'),(4,'영등포구'),(5,'구로구'),(6,'강서구'),(7,'강북구'),(8,'송파구');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourinfo`
--

DROP TABLE IF EXISTS `tourinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '관광지 일련번호',
  `name` varchar(50) NOT NULL COMMENT '관광지 이름',
  `postcode` char(5) DEFAULT NULL COMMENT '관광지 우편번호',
  `addr1` varchar(150) DEFAULT NULL COMMENT '관광지 주소1',
  `addr2` varchar(150) DEFAULT NULL COMMENT '관광지 주소2',
  `cost` text COMMENT '관광지 입장비용',
  `route1` varchar(50) DEFAULT NULL COMMENT '관광지 가는길1',
  `route2` varchar(50) DEFAULT NULL COMMENT '관광지 가는길2',
  `holiday1` varchar(20) DEFAULT NULL COMMENT '관광지 휴무',
  `holiday2` varchar(20) DEFAULT NULL COMMENT '관광지 휴무2',
  `holiday3` varchar(20) DEFAULT NULL COMMENT '관광지 휴무3',
  `intro` text COMMENT '관광지 설명',
  `likes` int(11) DEFAULT NULL COMMENT '관광지 좋아요갯수',
  `tel` varchar(20) DEFAULT NULL COMMENT '관광지 전화번호',
  `homepage` varchar(50) DEFAULT NULL COMMENT '관광지 웹사이트주소',
  `x` double NOT NULL COMMENT '관광지 x좌표',
  `y` double NOT NULL COMMENT '관광지 y좌표',
  `tour_tourCode` int(11) NOT NULL COMMENT '관광지 소속지역구',
  PRIMARY KEY (`id`),
  KEY `fk_tour1_tour1_idx` (`tour_tourCode`),
  CONSTRAINT `fk_tour1_tour1` FOREIGN KEY (`tour_tourCode`) REFERENCES `tour` (`tourCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='관광지정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourinfo`
--

LOCK TABLES `tourinfo` WRITE;
/*!40000 ALTER TABLE `tourinfo` DISABLE KEYS */;
INSERT INTO `tourinfo` VALUES (1,'그린아카데미','12343','서울특별시 마포구','.....','0','버스 3500번','지하철2호선','연중무휴',NULL,NULL,'코딩배우러가기',4,'02)342-1244','www.greenAcademy.com',12.344234,43.123455,3),(2,'수산시장','44423','서울특별시 영등포구','....','0','택시','지하철2호선','주말',NULL,NULL,'맛있는 생선',3,'02)444-1234','null',123.123412,65.123451,4),(3,'그린컴','12342','서울특별시','강남구','0','2호선 강남역','신분당선 강남역','주말',NULL,NULL,'우리학원',123,'02)123-1234','www.green.co.kr',123.23,12.423,1),(4,'센트럴파크','12321','서울특별시','서초구','0','2호선 서초역',NULL,NULL,NULL,NULL,'세계최대의 공원',12,'02)232-4213',NULL,234.12,12.32,2),(5,'올림픽공원','138','서울 송파구','오륜동 13-5','1000','버스 1000원','지하철 5호선','연중무휴',NULL,NULL,'올림픽공원',3,'02-439-3321','olympic.com',3332,3422,8),(6,'북서울꿈의숲','322','서울 강북구','수유','1000','버스 138','지하철 2호선 ','연중무휴',NULL,NULL,'공원입니다',10,'02-122-1332','park.com',3301,2392,7);
/*!40000 ALTER TABLE `tourinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourplan`
--

DROP TABLE IF EXISTS `tourplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tourplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '여행플랜 일련번호',
  `name` varchar(100) NOT NULL COMMENT '여행플랜 이름',
  `intro` text NOT NULL COMMENT '여행플랜 간략설명',
  `intro_main` text NOT NULL COMMENT '여행플랜 메인설명',
  `startDate` datetime NOT NULL COMMENT '여행시작일',
  `days` int(11) NOT NULL COMMENT '여행한 일수',
  `people` int(11) NOT NULL COMMENT '여행자 수',
  `theme` int(11) NOT NULL COMMENT '여행 테마',
  `reg_date` datetime NOT NULL COMMENT '여행플랜 등록일',
  `edit_date` datetime NOT NULL COMMENT '여행플랜 편집일',
  `member_member_id` int(11) NOT NULL COMMENT '여행플랜 작성멤버의 id',
  PRIMARY KEY (`id`),
  KEY `fk_tourPlan_member1_idx` (`member_member_id`),
  CONSTRAINT `fk_tourPlan_member1` FOREIGN KEY (`member_member_id`) REFERENCES `member` (`member_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='여행플랜 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourplan`
--

LOCK TABLES `tourplan` WRITE;
/*!40000 ALTER TABLE `tourplan` DISABLE KEYS */;
INSERT INTO `tourplan` VALUES (1,'여행어벤져스','혼자서는 여행을 할수 없다.','진정한 여행을 찾아서','2018-01-20 00:00:00',3,2,2,'2018-03-18 00:00:00','2018-03-19 00:00:00',1),(2,'여행스텔라','우리는 정답을 찾을것이다.','블랙홀 같은 여행','2018-02-11 00:00:00',2,3,4,'2018-02-22 00:00:00','2018-02-24 00:00:00',4),(3,'올림픽의 경치','올림픽 보러가자','평창으로 함께 가요','2018-02-01 00:00:00',4,2,2,'2018-02-13 00:00:00','2018-03-22 00:00:00',5),(4,'홍대 클럽투어','클럽 투어가자','재밌게 노는법','2018-01-03 00:00:00',3,2,2,'2018-01-03 00:00:00','2018-03-21 00:00:00',6);
/*!40000 ALTER TABLE `tourplan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-23 17:17:24
