-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: rateandreview_dev
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Current Database: `rateandreview_dev`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rateandreview_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `rateandreview_dev`;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=294 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Mexico City','MX','Mexico','1234 East 10th Street','10027'),(2,'Berkeley','US','CA','1234 East 10th Street','94001'),(3,'Algiers','DZ','Algeria','1234 East 10th Street','76767'),(4,'Zagreb','HR','Croatia','1234 East 10th Street','10027'),(5,'Doha','QA','Qatar','1234 East 10th Street','10027'),(6,'Bogota','CO','Bahamas','1234 East 10th Street','10027'),(7,'Seattle','US','WA','1234 East 10th Street','98800'),(8,'Vancouver','CA','British Colombia','1234 East 10th Street','76767'),(9,'Accra','GH','State','1234 East 10th Street','10027'),(10,'Cairo','EG','Egypt','1234 East 10th Street','10027'),(292,NULL,'GR',NULL,NULL,NULL),(293,NULL,'GR',NULL,NULL,NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `affiliations`
--

DROP TABLE IF EXISTS `affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations`
--

LOCK TABLES `affiliations` WRITE;
/*!40000 ALTER TABLE `affiliations` DISABLE KEYS */;
INSERT INTO `affiliations` VALUES (1,'Blum Center'),(2,'UC Affiliated'),(3,'Cal Corps'),(4,'Student-Led Organization'),(5,'Faculty-Led Organization'),(6,'No Campus Affiliation');
/*!40000 ALTER TABLE `affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `organization_id` bigint DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3419 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'email1@mail.com','First Last',1,'111-111-1111','CEO'),(2,'email2@mail.com','First Last',1,'222-222-2222','CFO'),(3,'email3@mail.com','First Last',1,'333-333-3333','Director'),(4,'email1@mail.com','First Last',2,'111-111-1111','CEO'),(5,'email2@mail.com','First Last',2,'222-222-2222','CFO'),(6,'email3@mail.com','First Last',2,'333-333-3333','Director'),(7,'email1@mail.com','First Last',3,'111-111-1111','CEO'),(8,'email2@mail.com','First Last',3,'222-222-2222','CFO'),(9,'email3@mail.com','First Last',3,'333-333-3333','Director'),(10,'email1@mail.com','First Last',4,'111-111-1111','CEO'),(11,'email2@mail.com','First Last',4,'222-222-2222','CFO'),(12,'email3@mail.com','First Last',4,'333-333-3333','Director'),(13,'email1@mail.com','First Last',5,'111-111-1111','CEO'),(14,'email2@mail.com','First Last',5,'222-222-2222','CFO'),(15,'email3@mail.com','First Last',5,'333-333-3333','Director'),(16,'email1@mail.com','First Last',6,'111-111-1111','CEO'),(17,'email2@mail.com','First Last',6,'222-222-2222','CFO'),(18,'email3@mail.com','First Last',6,'333-333-3333','Director'),(19,'email1@mail.com','First Last',7,'111-111-1111','CEO'),(20,'email2@mail.com','First Last',7,'222-222-2222','CFO'),(21,'email3@mail.com','First Last',7,'333-333-3333','Director'),(22,'email1@mail.com','First Last',8,'111-111-1111','CEO'),(23,'email2@mail.com','First Last',8,'222-222-2222','CFO'),(24,'email3@mail.com','First Last',8,'333-333-3333','Director'),(25,'email1@mail.com','First Last',9,'111-111-1111','CEO'),(26,'email2@mail.com','First Last',9,'222-222-2222','CFO'),(27,'email3@mail.com','First Last',9,'333-333-3333','Director'),(28,'email1@mail.com','First Last',10,'111-111-1111','CEO'),(29,'email2@mail.com','First Last',10,'222-222-2222','CFO'),(30,'email3@mail.com','First Last',10,'333-333-3333','Director'),(3416,NULL,NULL,292,NULL,NULL),(3417,NULL,NULL,292,NULL,NULL),(3418,NULL,NULL,292,NULL,NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `code` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AF','Afghanistan'),('AX','Åland Islands'),('AL','Albania'),('DZ','Algeria'),('AS','American Samoa'),('AD','Andorra'),('AO','Angola'),('AI','Anguilla'),('AQ','Antarctica'),('AG','Antigua and Barbuda'),('AR','Argentina'),('AM','Armenia'),('AW','Aruba'),('AU','Australia'),('AT','Austria'),('AZ','Azerbaijan'),('BS','Bahamas'),('BH','Bahrain'),('BD','Bangladesh'),('BB','Barbados'),('BY','Belarus'),('BE','Belgium'),('BZ','Belize'),('BJ','Benin'),('BM','Bermuda'),('BT','Bhutan'),('BO','Bolivia, Plurinational State of'),('BQ','Bonaire, Sint Eustatius and Saba'),('BA','Bosnia and Herzegovina'),('BW','Botswana'),('BV','Bouvet Island'),('BR','Brazil'),('IO','British Indian Ocean Territory'),('BN','Brunei Darussalam'),('BG','Bulgaria'),('BF','Burkina Faso'),('BI','Burundi'),('KH','Cambodia'),('CM','Cameroon'),('CA','Canada'),('CV','Cape Verde'),('KY','Cayman Islands'),('CF','Central African Republic'),('TD','Chad'),('CL','Chile'),('CN','China'),('CX','Christmas Island'),('CC','Cocos (Keeling) Islands'),('CO','Colombia'),('KM','Comoros'),('CG','Congo'),('CD','Congo, the Democratic Republic of the'),('CK','Cook Islands'),('CR','Costa Rica'),('CI','Cï¿½te d\'Ivoire'),('HR','Croatia'),('CU','Cuba'),('CW','Curaï¿½ao'),('CY','Cyprus'),('CZ','Czech Republic'),('DK','Denmark'),('DJ','Djibouti'),('DM','Dominica'),('DO','Dominican Republic'),('EC','Ecuador'),('EG','Egypt'),('SV','El Salvador'),('GQ','Equatorial Guinea'),('ER','Eritrea'),('EE','Estonia'),('ET','Ethiopia'),('FK','Falkland Islands (Malvinas)'),('FO','Faroe Islands'),('FJ','Fiji'),('FI','Finland'),('FR','France'),('GF','French Guiana'),('PF','French Polynesia'),('TF','French Southern Territories'),('GA','Gabon'),('GM','Gambia'),('GE','Georgia'),('DE','Germany'),('GH','Ghana'),('GI','Gibraltar'),('GR','Greece'),('GL','Greenland'),('GD','Grenada'),('GP','Guadeloupe'),('GU','Guam'),('GT','Guatemala'),('GG','Guernsey'),('GN','Guinea'),('GW','Guinea-Bissau'),('GY','Guyana'),('HT','Haiti'),('HM','Heard Island and McDonald Islands'),('VA','Holy See (Vatican City State)'),('HN','Honduras'),('HK','Hong Kong'),('HU','Hungary'),('IS','Iceland'),('IN','India'),('ID','Indonesia'),('IR','Iran, Islamic Republic of'),('IQ','Iraq'),('IE','Ireland'),('IM','Isle of Man'),('IL','Israel'),('IT','Italy'),('JM','Jamaica'),('JP','Japan'),('JE','Jersey'),('JO','Jordan'),('KZ','Kazakhstan'),('KE','Kenya'),('KI','Kiribati'),('KP','Korea, Democratic People\'s Republic of'),('KR','Korea, Republic of'),('KW','Kuwait'),('KG','Kyrgyzstan'),('LA','Lao People\'s Democratic Republic'),('LV','Latvia'),('LB','Lebanon'),('LS','Lesotho'),('LR','Liberia'),('LY','Libya'),('LI','Liechtenstein'),('LT','Lithuania'),('LU','Luxembourg'),('MO','Macao'),('MK','Macedonia, the Former Yugoslav Republic of'),('MG','Madagascar'),('MW','Malawi'),('MY','Malaysia'),('MV','Maldives'),('ML','Mali'),('MT','Malta'),('MH','Marshall Islands'),('MQ','Martinique'),('MR','Mauritania'),('MU','Mauritius'),('YT','Mayotte'),('MX','Mexico'),('FM','Micronesia, Federated States of'),('MD','Moldova, Republic of'),('MC','Monaco'),('MN','Mongolia'),('ME','Montenegro'),('MS','Montserrat'),('MA','Morocco'),('MZ','Mozambique'),('MM','Myanmar'),('NA','Namibia'),('NR','Nauru'),('NP','Nepal'),('NL','Netherlands'),('NC','New Caledonia'),('NZ','New Zealand'),('NI','Nicaragua'),('NE','Niger'),('NG','Nigeria'),('NU','Niue'),('NF','Norfolk Island'),('MP','Northern Mariana Islands'),('NO','Norway'),('OM','Oman'),('PK','Pakistan'),('PW','Palau'),('PS','Palestine, State of'),('PA','Panama'),('PG','Papua New Guinea'),('PY','Paraguay'),('PE','Peru'),('PH','Philippines'),('PN','Pitcairn'),('PL','Poland'),('PT','Portugal'),('PR','Puerto Rico'),('QA','Qatar'),('RE','Rï¿½union'),('RO','Romania'),('RU','Russian Federation'),('RW','Rwanda'),('BL','Saint Barthï¿½lemy'),('SH','Saint Helena, Ascension and Tristan da Cunha'),('KN','Saint Kitts and Nevis'),('LC','Saint Lucia'),('MF','Saint Martin (French part)'),('PM','Saint Pierre and Miquelon'),('VC','Saint Vincent and the Grenadines'),('WS','Samoa'),('SM','San Marino'),('ST','Sao Tome and Principe'),('SA','Saudi Arabia'),('SN','Senegal'),('RS','Serbia'),('SC','Seychelles'),('SL','Sierra Leone'),('SG','Singapore'),('SX','Sint Maarten (Dutch part)'),('SK','Slovakia'),('SI','Slovenia'),('SB','Solomon Islands'),('SO','Somalia'),('ZA','South Africa'),('GS','South Georgia and the South Sandwich Islands'),('SS','South Sudan'),('ES','Spain'),('LK','Sri Lanka'),('SD','Sudan'),('SR','Suriname'),('SJ','Svalbard and Jan Mayen'),('SZ','Swaziland'),('SE','Sweden'),('CH','Switzerland'),('SY','Syrian Arab Republic'),('TW','Taiwan, Province of China'),('TJ','Tajikistan'),('TZ','Tanzania, United Republic of'),('TH','Thailand'),('TL','Timor-Leste'),('TG','Togo'),('TK','Tokelau'),('TO','Tonga'),('TT','Trinidad and Tobago'),('TN','Tunisia'),('TR','Turkey'),('TM','Turkmenistan'),('TC','Turks and Caicos Islands'),('TV','Tuvalu'),('UG','Uganda'),('UA','Ukraine'),('AE','United Arab Emirates'),('GB','United Kingdom'),('US','United States'),('UM','United States Minor Outlying Islands'),('UY','Uruguay'),('UZ','Uzbekistan'),('VU','Vanuatu'),('VE','Venezuela, Bolivarian Republic of'),('VN','Viet Nam'),('VG','Virgin Islands, British'),('VI','Virgin Islands, U.S.'),('WF','Wallis and Futuna'),('EH','Western Sahara'),('YE','Yemen'),('ZM','Zambia'),('ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1),(1),(1),(1),(1),(1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `code` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES ('ab','Abkhaz'),('aa','Afar'),('af','Afrikaans'),('ak','Akan'),('sq','Albanian'),('am','Amharic'),('ar','Arabic'),('an','Aragonese'),('hy','Armenian'),('as','Assamese'),('av','Avaric'),('ae','Avestan'),('ay','Aymara'),('az','Azerbaijani'),('bm','Bambara'),('ba','Bashkir'),('eu','Basque'),('be','Belarusian'),('bn','Bengali; Bangla'),('bh','Bihari'),('bi','Bislama'),('bs','Bosnian'),('br','Breton'),('bg','Bulgarian'),('my','Burmese'),('ca','Catalan; Valencian'),('ch','Chamorro'),('ce','Chechen'),('ny','Chichewa; Chewa; Nyanja'),('zh','Chinese'),('cv','Chuvash'),('kw','Cornish'),('co','Corsican'),('cr','Cree'),('hr','Croatian'),('cs','Czech'),('da','Danish'),('dv','Divehi; Dhivehi; Maldivian;'),('nl','Dutch'),('dz','Dzongkha'),('en','English'),('eo','Esperanto'),('et','Estonian'),('ee','Ewe'),('fo','Faroese'),('fj','Fijian'),('fi','Finnish'),('fr','French'),('ff','Fula; Fulah; Pulaar; Pular'),('gl','Galician'),('ka','Georgian'),('de','German'),('el','Greek, Modern'),('gn','GuaranÃ­'),('gu','Gujarati'),('ht','Haitian; Haitian Creole'),('ha','Hausa'),('he','Hebrew (modern)'),('hz','Herero'),('hi','Hindi'),('ho','Hiri Motu'),('hu','Hungarian'),('ia','Interlingua'),('id','Indonesian'),('ie','Interlingue'),('ga','Irish'),('ig','Igbo'),('ik','Inupiaq'),('io','Ido'),('is','Icelandic'),('it','Italian'),('iu','Inuktitut'),('ja','Japanese'),('jv','Javanese'),('kl','Kalaallisut, Greenlandic'),('kn','Kannada'),('kr','Kanuri'),('ks','Kashmiri'),('kk','Kazakh'),('km','Khmer'),('ki','Kikuyu, Gikuyu'),('rw','Kinyarwanda'),('ky','Kyrgyz'),('kv','Komi'),('kg','Kongo'),('ko','Korean'),('ku','Kurdish'),('kj','Kwanyama, Kuanyama'),('la','Latin'),('lb','Luxembourgish, Letzeburgesch'),('lg','Ganda'),('li','Limburgish, Limburgan, Limburger'),('ln','Lingala'),('lo','Lao'),('lt','Lithuanian'),('lu','Luba-Katanga'),('lv','Latvian'),('gv','Manx'),('mk','Macedonian'),('mg','Malagasy'),('ms','Malay'),('ml','Malayalam'),('mt','Maltese'),('mi','MÄori'),('mr','Marathi (MarÄá¹­hÄ«)'),('mh','Marshallese'),('mn','Mongolian'),('na','Nauru'),('nv','Navajo, Navaho'),('nb','Norwegian BokmÃ¥l'),('nd','North Ndebele'),('ne','Nepali'),('ng','Ndonga'),('nn','Norwegian Nynorsk'),('no','Norwegian'),('ii','Nuosu'),('nr','South Ndebele'),('oc','Occitan'),('oj','Ojibwe, Ojibwa'),('cu','Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic'),('om','Oromo'),('or','Oriya'),('os','Ossetian, Ossetic'),('pa','Panjabi, Punjabi'),('pi','PÄli'),('fa','Persian (Farsi)'),('pl','Polish'),('ps','Pashto, Pushto'),('pt','Portuguese'),('qu','Quechua'),('rm','Romansh'),('rn','Kirundi'),('ro','Romanian, [])'),('ru','Russian'),('sa','Sanskrit (Saá¹ská¹›ta)'),('sc','Sardinian'),('sd','Sindhi'),('se','Northern Sami'),('sm','Samoan'),('sg','Sango'),('sr','Serbian'),('gd','Scottish Gaelic; Gaelic'),('sn','Shona'),('si','Sinhala, Sinhalese'),('sk','Slovak'),('sl','Slovene'),('so','Somali'),('st','Southern Sotho'),('az','South Azerbaijani'),('es','Spanish; Castilian'),('su','Sundanese'),('sw','Swahili'),('ss','Swati'),('sv','Swedish'),('ta','Tamil'),('te','Telugu'),('tg','Tajik'),('th','Thai'),('ti','Tigrinya'),('bo','Tibetan Standard, Tibetan, Central'),('tk','Turkmen'),('tl','Tagalog'),('tn','Tswana'),('to','Tonga (Tonga Islands)'),('tr','Turkish'),('ts','Tsonga'),('tt','Tatar'),('tw','Twi'),('ty','Tahitian'),('ug','Uyghur, Uighur'),('uk','Ukrainian'),('ur','Urdu'),('uz','Uzbek'),('ve','Venda'),('vi','Vietnamese'),('vo','VolapÃ¼k'),('wa','Walloon'),('cy','Welsh'),('wo','Wolof'),('fy','Western Frisian'),('xh','Xhosa'),('yi','Yiddish'),('yo','Yoruba'),('za','Zhuang, Chuang'),('zu','Zulu');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_id` bigint DEFAULT NULL,
  `affiliation_ids` varchar(255) DEFAULT NULL,
  `approved` bit(1) DEFAULT NULL,
  `description` longtext,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `sector_ids` varchar(255) DEFAULT NULL,
  `sector_other` varchar(255) DEFAULT NULL,
  `type` bigint DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `type_other` varchar(255) DEFAULT NULL,
  `submitted` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=293 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,1,'1^2^3',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','A Test Org','111-111-1112','1','1^2^3',NULL,4,'http://example.org',NULL,1583035114858),(2,2,'1^2^3^1',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','B Test Org','111-111-1112','1','1^2^3',NULL,4,'http://example.org',NULL,1583035114858),(3,3,'1^2^3',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','C Test Org','111-111-1112','5','1^2^3','',4,'http://example.org','',1583035114858),(4,4,'1^2^3',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','D Test Org','111-111-1112','4','1^2^3^18^16^9','',4,'http://example.org','',1583035114858),(5,5,'1^2^1^5',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','E Test Org','111-111-1112','5','1^2^3^17^15','',4,'http://example.org','',1583035114858),(6,6,'1^1^1^1^6',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','F Test Org','111-111-1112','3','1^1^11^17^14^10','',4,'http://example.org','',1583035114858),(7,7,'1^1^4',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','G Test Org','111-111-1112','1','1^8^10^1^17','',5,'http://example.org','',1583035114858),(8,8,'1^3^1',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','H Test Org','111-111-1112','1','1^4^12^1^9^13','',6,'http://example.org','',1583035114858),(9,9,'1^1^5^4',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','I Test Org','111-111-1112','6','1^2^1^15^8^16','',1,'http://example.org','',1583035114858),(10,10,'1',_binary '','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','testemail@mail.com','J Test Org','111-111-1112','1','1^1^18^19^4','Political Stability',7,'http://example.org','Political',1583035114858),(292,292,'',_binary '',NULL,NULL,'K Test Org',NULL,'4','',NULL,6,NULL,NULL,1595609818297);
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'North America'),(2,'Mexico / Central America'),(3,'South America'),(4,'Europe'),(5,'Middle East / North Africa'),(6,'Sub-Saharan Africa'),(7,'China'),(8,'India'),(9,'Other');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_id` bigint DEFAULT NULL,
  `anonymous` bit(1) DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `difficulties` longtext,
  `duration` varchar(255) DEFAULT NULL,
  `evaluation` longtext,
  `language_codes` varchar(255) DEFAULT NULL,
  `organization_id` bigint DEFAULT NULL,
  `other` longtext,
  `region` varchar(255) DEFAULT NULL,
  `responsiveness` int DEFAULT NULL,
  `reviewer_id` varchar(255) DEFAULT NULL,
  `safety` int DEFAULT NULL,
  `sector_ids` varchar(255) DEFAULT NULL,
  `sector_other` varchar(255) DEFAULT NULL,
  `stipend` int DEFAULT NULL,
  `typical_day` longtext,
  `work_done` longtext,
  `submitted` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,_binary '\0',5500,'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.','4-6 months','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.','en^es',1,'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.','1',4,'1',5,'1^9^11',NULL,3000,'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',1583037394220),(2,1,_binary '',10000,'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.','6-12 months','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.','es^en',1,'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.','1',5,'2',4,'12^14^19','Politics',3000,'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',1583038132994),(3,2,_binary '\0',8000,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','6-12 months','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','en^fr',2,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','1',4,'3',4,'1^3^13',NULL,2500,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',1583038460459),(4,293,_binary '',1500,NULL,'2-4 months','Description ','',292,NULL,'4',5,'6',5,'',NULL,1000,NULL,'Description',1595609818297);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES (1,'Agriculture / Food Security'),(2,'Collective Mobilization / Advocacy'),(3,'Disaster / Humanitarian Relief'),(4,'Education'),(5,'Energy'),(6,'Environment / Sustainability'),(7,'Fair Trade / Market Access'),(8,'Gender Empowerment'),(9,'Health'),(10,'Housing'),(11,'Human Rights / Law'),(12,'Hunger / Malnutrition'),(13,'Law'),(14,'Immigration'),(15,'Information Technology'),(16,'Microfinance'),(17,'Refugee / Displaced Persons'),(18,'Water / Sanitation'),(19,'Other (please describe below)');
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Government / UN-like (UNDP, World Bank, WTO)'),(2,'For Profit / Corporation-Based Development Organization'),(3,'NGO / Non-Profit'),(4,'Social Enterprise / Corporate Social Responsibility'),(5,'Collection Action Group (union, social movement)'),(6,'Fee-Based Third Party Provider'),(7,'Other (please describe below)');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `is_admin` bit(1) DEFAULT b'0',
  `last_login` float DEFAULT '0',
  `last_name` varchar(255) DEFAULT NULL,
  `number_of_login` int DEFAULT '0',
  `creation_time` float DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_id_uindex` (`id`),
  UNIQUE KEY `users_email_uindex` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'testuser1@berkeley.edu',_binary '',1582860000000,'Test User',0,1574750000000,'User 1'),(2,'testuser2@berkeley.edu',_binary '',1582860000000,'Test User',48,1574750000000,'User 2'),(3,'testuser3@berkeley.edu',_binary '',1582860000000,'Test User',0,1574750000000,'User 3'),(6,'sarasiddiqui@berkeley.edu',_binary '',1596390000000,'Siddiqui',7,1577870000000,'Sara');
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

-- Dump completed on 2020-08-03 10:26:15
