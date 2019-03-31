-- MySQL dump 10.13  Distrib 5.7.25, for Linux (armv7l)
--
-- Host: localhost    Database: user_platform
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `project_name` varchar(30) NOT NULL,
  `thumbnail` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL,
  `technology` varchar(256) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `git` varchar(256) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,10,'theia','https://i.imgur.com/g1avvvT.png','Theia is a commercial OMR sheet generator and analyzer.','C++, OpenCV, VB.NET','2017-02-20','2017-07-14','https://bitbucket.org/nsssayom/unified_user_-platform/src/master/',0),(2,10,'theiam','https://i.imgur.com/g1avvvT.png','Theia is a commercial OMR sheet generator and analyzer.','C++, OpenCV, VB.NET','2017-02-20','2017-07-14','https://bitbucket.org/nsssayom/unified_user_-platform/src/master/',0),(3,1,'theiam','https://i.imgur.com/g1avvvT.png','Theia is a commercial OMR sheet generator and analyzer.','C++, OpenCV, VB.NET','2017-02-20','2017-07-14','https://bitbucket.org/nsssayom/unified_user_-platform/src/master/',0),(4,10,'Test','https://images.theconversation.com/files/17962/original/jt558trs-1353642967.jpg','TestTheia is a commercial OMR sheet generator and analyzer.','C++, C#, Java','2017-02-09','2017-02-09','github.com',0),(5,10,'Test 2','https://cdn.ila-france.com/wp-content/uploads/2017/01/french-test.jpg','Theia is a commercial OMR sheet generator and analyzer.','fcadfddada','2019-03-20','2019-03-22','addadad',0);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `token` varchar(256) NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_time` timestamp NULL DEFAULT NULL,
  `revision` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (96,1,'1122','2019-03-27 21:07:33','2019-04-06 07:38:01',25),(97,15,'6d7bfae683df8b236200b277d01af91e23a34799024038912aa56d0233728ab702257aa8d4026fd52ada0b1c3df561fa856e7b0278570dd45b9cbae174836cb6','2019-03-27 21:35:02','2019-04-03 21:35:02',0),(98,16,'67438290ea5c60f4b38fdc98c3883c090cf17e88b46653cd3e1f343dac070336f87ccffda406c7eb4581d2d377d44d36bd84b859bf97f16a8c42203b925eb90d','2019-03-27 21:36:14','2019-04-03 21:36:14',0),(99,10,'8d199dd10c1ce207d761c256e67a0640203dac3c84e10f2f6b623137c6ebf62f3c3716fd142b2ec229cfdbd94fe132c68656111b6c379e94b2d933ad3f84f4e9','2019-03-27 21:43:31','2019-04-07 19:19:57',5),(100,10,'f6e708f1c846d10a3737fb4939633694ac29a6a500576868346b328796f48f39675305663febe0a475886a95ec1cd85536bede08424901e180480e498858b0c1','2019-03-27 21:43:39','2019-04-03 21:43:39',0),(101,10,'0d108b7e4f5db2a0930833d061a6e33e3d964b5e63c0cca60ea80626771d07576d66f25f6962f76b1ae284d5ff56c92ff34368d1c1a98940c3350147c1eb5f9e','2019-03-27 21:50:06','2019-04-03 21:50:06',0),(102,10,'5ceabac2c42f65beb02934fc9d2b1eb5f9b51bd21518e98f2a306f7f72ff0e96b77026a7357fd50b687a081e8731c2545154decd804d02a0e64c49b12aaaba10','2019-03-27 21:50:34','2019-04-03 21:50:34',0),(103,10,'0fb9b7f0ceb6a819603da30827dfac926e4b74bb5776b3c66f2018fc1f0855e8eb06b57056c5bd7dc72bff426ebddd6fd01cb0f89c54f5a7931adfd49c253a11','2019-03-27 21:56:13','2019-04-03 21:56:13',0),(104,10,'83ac822b772e191111d7d8f41146d9dccab64c47cc152f04985da92ecc655de1833450c05e2131b3e881f0f2247cd45c348024db1f1c6529c1b490a2b837d829','2019-03-27 21:58:14','2019-04-03 21:58:14',0),(105,10,'2baa6cdd55b9b2ee136f812e79a13fcdb992d731cdca6d5d4ff75370f62aaca994d82a2d802c451b33a7febd71bd6113b73ddbccdd229f730c0aa49c4f9b4b50','2019-03-27 21:58:36','2019-04-03 21:58:36',0),(106,10,'fabcfd67d71d16ef210c53334e9efe059bf87553bf6da72ccf2131f44c4fd20413b848d0a380a4c7797f4aaa6de20ac83ca4c07d6b6333618f99c3da485cdd92','2019-03-27 21:59:44','2019-04-03 21:59:44',0),(107,10,'3384d1e20cbab049a72f5053d7088b7bd1780141267986e231fb2c288a3a19a184afc734b6d44517f1df3c192578cdc02d46dbf5ce41dac9fb7e3bd27fb32ec7','2019-03-27 22:03:32','2019-04-03 22:03:32',0),(108,10,'98fbcf3a9333fa62bcf8947a64544655b39b63dbf4e38b789b93a3e0970ac2672b2119bcd4f9b840d8a045635c59476ad9746ddcbd9ab61b0dafe033b616ef96','2019-03-27 22:06:19','2019-04-04 16:14:13',162),(109,10,'a8c2003f3f7364c2ff088e3962233554f121176ddbf7a2125e5e2ec73b36352da8d44295a81ecec79dffd0946f7dcb34e0b5fd1763ea769165c4f0cc102493ee','2019-03-28 17:11:51','2019-04-04 17:13:01',5),(110,10,'3180eb292d6eb41e5ba13847147801cd11d36c2d9d31dfb1fc1fd27680dc47bd56256af892e36e3f580eebbdfda09119b55bbc8fe015426959de2302907eb1a8','2019-03-28 17:21:03','2019-04-04 18:00:57',35),(111,10,'336e692d1bfd39a9055f5502e8807111e44d75f857fdde29bc241cb18f8232918c07fd846c848a0de08d78c88cf42ce983985db6809c8d32aad4a275a1f54d04','2019-03-28 18:18:43','2019-04-04 18:18:43',0),(112,10,'18df76c67e032ac85fda3f994ef119597e1670a94a0b809363808788d606c41b121128d1b52340ac5d122ccb16645346cc989c690decd68cfa5004ab2e4d349f','2019-03-28 18:20:23','2019-04-04 18:21:05',12),(113,10,'f444678fc920850be2f0fd22928958a7c8febd09be3a5c2c36787b8c15f2703163b20271c03c0a8039042dd678dc922a5a0bde4a1c1449ebe339aa4663834420','2019-03-28 18:21:23','2019-04-04 18:42:12',7),(114,10,'382a739d343460017d3df7fc91c38139beed8ce1f4811f98a98a6db33b17688b5e740f4183db949cff17eea920890b541e21c4fb2e2a055e1de8c6225d3b31b4','2019-03-28 18:42:24','2019-04-04 18:42:25',4),(115,17,'d1bb4e28717b01e7da17584ad10739f52a1e12f98bc323ad534e39ee455e5318a258ad08e594a6a5d427b8738abc7317ce7cfb47c297bef048269632077458d1','2019-03-29 10:33:18','2019-04-05 10:33:18',0),(116,18,'e0057f7056070fec3c237ea73d0fabc4a9e7de136a35a2db106b472f315578cd74fc33c01ede41a4701e970673ad44aacd152d672680289ae921055d92566ac5','2019-03-29 10:41:37','2019-04-05 10:41:37',0),(117,19,'a91643ccf9e79d526727fda2e0bc6009f458721523d319f4add995822b5a789d5c11f848fd8843313c36ae0669b9ce399d7d72bc11b87417314aa48e27a47cc6','2019-03-29 16:03:19','2019-04-05 16:03:19',0),(118,20,'764f5211895ee0de18d6606e1607e130a1ff702c809a6b01df34f306103cf878b631744e91904b8585834533a00b16d0883c1a2cb58aa445598f2c67109fde08','2019-03-29 16:46:28','2019-04-05 16:46:28',0),(119,21,'57fbb81403bbbd82f43337c65074c48f480a8791d5a309382fa6242254d2b264b43e00b61e5e7ee5dcd286b74f883d58c0462c71782c233c464bb97e087462e5','2019-03-29 16:47:32','2019-04-05 16:47:33',4),(120,10,'98b0f63307ae4f47cbc38e021910e12f78dcddb13dd5191ac726301ad938e104119007ce12fd7bb66f24b513e6bbb53d961ab8de485028b25c4f050a7d3605d4','2019-03-29 16:48:10','2019-04-06 06:51:16',45),(121,10,'e4c2f9b7beb43e954e4ddddfa79aa69d9f746dd5ed4aca67fd431816d5a6d0ea86882fd4804beaf401882fee620681a5cc2fdca4976e77133fef0edfbed6022c','2019-03-30 06:51:27','2019-04-06 07:02:05',35),(122,10,'e47e3b9dd1383dad5b887c9cc07bb478ae6329fef7f71cbfa9428361be50e533f51e7fb37a1e3b8af50f534041e241095de930297b771334765123dacf3a468b','2019-03-30 07:02:17','2019-04-06 07:10:00',46),(123,10,'615e1939b813095d79ab0a91ade98850470399d5dfec5e4ecfca827fb9548d9ee080666971b06edeb24169cf25ce5e11dc66fa81dbb6ab6a8d388f287f85e7c1','2019-03-30 07:10:11','2019-04-06 07:15:48',16),(124,10,'483887538c0db3f3116290536d6d63d73752dc9a5b7721bd732f0360ee04a1c290a14eabfce3f4a67e9f7f88a3d41348d5a6eaa35920d00a95b0d452b05acb3d','2019-03-30 07:16:01','2019-04-06 07:39:29',13),(125,10,'ade59dd177e51dace6fb2b39c9560f42585945f77b30542ea91bf83a87987480e9c25585bebad0c8d0d58bb90f1b203a99ff6418e2eb8253366711c3f69ba2d5','2019-03-30 07:39:35','2019-04-07 19:30:06',391),(126,10,'27e5096e8ada4b6a233867d8feb30cc01bfa2072ffc8e9cf9765931ca7e18b52bc18dde4d893dd3d2900e3b49aeb78b058e164e28562c17604f677eca57252d7','2019-03-31 10:25:32','2019-04-07 10:25:32',0),(127,10,'ac439d6a29f07ae175efb1d251eaadc0cec40ed265010d1e4245d374faf4b9b1210e939af3b8b8f33363ec1de2d34d8cf9c444e2fa1afc763fe61333bd432f50','2019-03-31 10:25:37','2019-04-07 10:25:37',0),(128,10,'81ce7024d4612352df5e594f176f84d209b67e5b8964307e85be7a7a15118b7e46a9486b9b957d61c06beb62a2d80326d357304edf130ec912554eeea39b1644','2019-03-31 10:25:38','2019-04-07 10:25:38',0),(129,10,'ce4009c8788993f870bb40252172a4bb5d0947baf1189f2b37c4723a1178ad4c5f383e50ee0212769904932a54a6305ff5a203532f236836f6e082487610e834','2019-03-31 10:25:39','2019-04-07 10:25:39',0),(130,10,'04a80a177d63dfe66f5778f2ba40b355d322960c3c782470e8521cb708e09cced70bc005ea40b2f82475e2fcc84f409cb3b157628df59e0a2f8f80b0b31783dd','2019-03-31 10:25:39','2019-04-07 10:25:39',0),(131,10,'295ff0713e66ce89e0f9e96d2525532b4a09db4c76d3ab41c57e47b4fbc2a9280d5bcb163e66764ecc38119d30f95e82bbfdb7aa01d8397702bad51c7f4e95cf','2019-03-31 10:25:39','2019-04-07 10:25:39',0),(132,10,'1b54dfabe082a60c96c542458e7100f169ea7b3cc3918525bc0326cac54e4637bf5f5cafe2b195d846439eae52d308c86aa7ff73d24e9338e62dce8f701bb52b','2019-03-31 10:25:39','2019-04-07 10:25:39',0),(133,10,'dd7b77a093dd26a8fa50ec4fb8b27c97708e362f0955f77a19bebaf272b877e5f12ebfcc9244c9929460c2f4e72563dd119d0d4e95162ddd35ff21b281231e21','2019-03-31 10:25:40','2019-04-07 10:25:40',0),(134,10,'5eaf077fbded035755715622e0f5e2d8f5f45d173b7b77c8d0bf246227deecd9d50e3728f27710c9033b64e0b9ab62ce7245d8f1376f5cc8dea6adbfe419255c','2019-03-31 10:25:40','2019-04-07 10:25:40',0),(135,10,'bf52ca30c94b839580e1c893dd94fa02381b16545e47e39eceac07af59a9edcab34831d8aba7ee3e0583d9c8bcf33ad89d20bca497301aa0462af9ecbf3e6526','2019-03-31 10:25:40','2019-04-07 10:25:40',0),(136,10,'457b6f79d3526fc77b73a7851abbcd97cfaaffaa42325ee3c110c1ec1b2c5be1452590127183798503dd81f448504ce7c9a8da90567b344c4fb1478e4e43271d','2019-03-31 10:25:40','2019-04-07 10:25:40',0),(137,10,'ac88fe5f5ce7ea66414f86702aa4565dd7417de6d1ae706a9906d4bff9230db50557036f99cd0bf95e80412fe72a017aae2c578aa61f4dbf0b7450e4a98863e1','2019-03-31 10:25:42','2019-04-07 10:25:42',0),(138,10,'ef094371783b1276554e3f9990d1db98dcd02a527b43c6abd3bfacba1525eb463fe0796829ddd621a793702fa7f6335397978b14affcf3e862a4fa2b3be47629','2019-03-31 10:26:53','2019-04-07 10:26:55',4),(139,10,'c48e7c543a884dd96711b38cc1f000f97f7015594fb16f577ba6286b94e046e5b28b198a5fd1b63202ccbd2e08e973eec6454a2647988a2451b56b1a4c9a2554','2019-03-31 10:27:09','2019-04-07 11:37:05',59),(140,10,'09b4064db8baefb3e6ed925a07f233be076c53d8db5298547832942da8c74f4c03a5f420420e2765a34300a6576e3266329b14828e3f5b17df56eff1c8d7664e','2019-03-31 11:26:57','2019-04-07 11:26:57',0),(141,10,'e481efa824b0a054ac85b92551090d64b879467bf87bf3df743c1c2d7d59cc3db7db02a21229d8e162676d26dec4f341a56f1e874686fee01a55367e206f1230','2019-03-31 11:26:59','2019-04-07 11:26:59',0),(142,10,'57786de3a1eb427fd0fd6f3797c1735ab4635b5fea984a39748787d1ec249875a1ce8aff4ed98aaf961aa480e87c5ccbd2137dae3b7fee29249314339375a0dd','2019-03-31 11:40:44','2019-04-07 12:04:42',69),(143,10,'51f21c0857521c9b4afefe04b8214c298c8d6e8647bfd17f84a087adc2ebded9d65bd550506c5964fc81e8e2475bf4813103e9541f32ef2dbc5422a24ea8e531','2019-03-31 19:30:59','2019-04-07 19:32:05',21),(144,22,'de5ae242d1c7d8ff94c0f6e1c173d745fcbde16543da3ebad5ca2341086d60033fb4568cd1a2dc98836023baf48389cc3d2d1711b5208803ab7a1d52a946ded2','2019-03-31 19:36:02','2019-04-07 19:36:02',4),(145,10,'c3f911770c2e48a51fd1fb46ff7410bd9bc53e0796ef69e1e36a8a056ad4ba8f78250f8ff01c0ab1370f6940f7076649578e9392d0f2629f320f8d66f05219d6','2019-03-31 19:36:16','2019-04-07 19:36:48',7);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_expiry` BEFORE INSERT ON `token`
 FOR EACH ROW SET NEW.expiry_time = DATE_ADD(NOW(), INTERVAL 7 DAY) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_expiry` BEFORE UPDATE ON `token` FOR EACH ROW SET NEW.expiry_time = DATE_ADD(NOW(), INTERVAL 7 DAY) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_location`
--

DROP TABLE IF EXISTS `user_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `lat` decimal(10,8) NOT NULL,
  `lng` decimal(11,8) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_location`
--

LOCK TABLES `user_location` WRITE;
/*!40000 ALTER TABLE `user_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(70) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(320) NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `dob` date NOT NULL,
  `user_level` tinyint(4) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sayom','sayom','+8801750252963','nsssayom@gmail.com',0,'2019-03-14',0,'1122'),(10,'jamil','Ahsanul Jamil','8801717018377','jamil@yahoo.com',0,'1996-03-14',NULL,'$2y$09$HTzxMrIskpcNQ/nAnGTpNuTvMc71IPlDFb8rfXEEAnOjs1lkwc/Gy'),(11,'sadat','Ahsanul Jamil','+8801717018577','jamila@yahoo.com',0,'1996-03-14',NULL,'$2y$09$q6Sjwx3HWTLbF2XcwiiTBeECLLUQDrQaJXRqJTuNdn2BtDCD/9QIi'),(12,'mobin','Mohetuzzaman','+8801717118577','mobin@yahoo.com',0,'1996-03-14',NULL,'$2y$09$jZteiGfA/sCsU9qvZXeOPeBf5lr0aFsAadrCF7IgfPyYAWGnsnk3W'),(16,'sadffase','Ahsanul Jamil',' 8801717208557','jamila@yahoooo.com',0,'1996-03-14',NULL,'$2y$09$fTMJKKhm7RytUE0oShwtWeZ8TlR8GPOqPP1X92890LmYlwHXwd38y'),(17,'sadata','Ahsanul Jamil',' 8801717018574','jamilq@yahoo.com',0,'1996-03-14',NULL,'$2y$09$c7TgYqu87R/gCRDwpAfKw.HJCXMY7MpfWsAGdO9ZiZSC232i.46xK'),(18,'admin','Nazmus Shakib Sayom',' 8801717050287','admin@softopian.com',0,'1996-08-24',NULL,'$2y$09$aRX5v7TN6/lcTQQsns4b2e9Dwhbn1MpoN5UWkGU2/hex8C37.Y2AS'),(19,'admini','Nazmus Shakib Sayom',' 8801717050280','admini@softopian.com',0,'1996-08-24',NULL,'$2y$09$c80CoBEOttnedk4MShcHO.c..Hv5tStyu2J6f3Yf25S0ivHyX9sCu'),(20,'rootw','nddddd',' 8801717018371','roog@dfff.comn',0,'2019-03-15',NULL,'$2y$09$fSewXVy7mHC0SQ4nHYhLvOtxwMZuWnC9oWrjH1g0k2P7HgyOa31A.'),(21,'roots','nasdda',' 8801717018372','sasaa@dfdf.com',0,'2019-03-28',NULL,'$2y$09$Ntvy2G2mMA28TE9gU1q6JOJsWWvKdaw.VapwepYk06okivgYtEyqC'),(22,'noman','Noman Abdullah',' 8801717018796','noman@gmail.com',0,'1997-04-18',NULL,'$2y$09$n4NQBiwnuSoTEWEoTUCb9uf84gA/L2JcBpw4S8S.fHD67iESahX1a');
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

-- Dump completed on 2019-04-01  1:43:27
