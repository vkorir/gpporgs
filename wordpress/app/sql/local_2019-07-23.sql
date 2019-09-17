# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.93.100 (MySQL 5.7.23)
# Database: local
# Generation Time: 2019-07-23 15:41:08 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table gpp_addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gpp_addresses`;

CREATE TABLE `gpp_addresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `zipCode` varchar(5) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `gpp_addresses` WRITE;
/*!40000 ALTER TABLE `gpp_addresses` DISABLE KEYS */;

INSERT INTO `gpp_addresses` (`id`, `street`, `city`, `state`, `zipCode`, `country`)
VALUES
	(1,'1 Mama Ngina St','Nairobi','Kenya','78787','Kenya'),
	(2,'1 Mama Ngina St','Nairobi','Kenya','78787','Kenya'),
	(3,'300 Summit St','Hartford','CT','65555','United States'),
	(4,'2121 Ngong Rd','Nairobi','Kenya','90900','Kenya'),
	(5,'300 Waiyaki Way','Kericho','Kenya','20200','Tanzania, United Republic of'),
	(6,'300 Waiyaki Way','Kericho','Kenya','20200','Tanzania, United Republic of'),
	(7,'300 Summit St','Hartford','Connecticut','26000','United States'),
	(8,'100 Berkeley St','Boston','Massachussets','89990','United States'),
	(9,'2470 Durant Ave','Berkeley','California','94720','United States'),
	(10,'2470 Durant Ave','Berkeley','California','94720','United States'),
	(11,'357 Ellis Street','San Francisco','California','94102','United States'),
	(12,'357 Ellis Street','San Francisco','California','94102','United States'),
	(13,'6676 Moi Avenue','Kisumu','Kenya','10000','Kenya'),
	(14,'6676 Moi Avenue','Kisumu','Kenya','10000','Kenya'),
	(15,'6767 Oak St','','','','India'),
	(16,'6767 Oak St','','','','India'),
	(17,'300 Summit St','Hartford','Connecticut','50005','Antarctica'),
	(18,'300 Summit St','Hartford','Connecticut','50005','Antarctica'),
	(19,'2121 Ngong Rd','Nairobi','Kenya','90900','Kenya'),
	(22,'2020 Uchumi Lane','Kericho','Kenya','20200','Kenya'),
	(23,'2020 Uchumi Lane','Kericho','Kenya','20200','Kenya'),
	(24,'2020 Uchumi Lane','Kericho','Kenya','20200','Kenya'),
	(25,'2020 Uchumi Lane','Kericho','Kenya','20200','Kenya'),
	(26,'2020 Uchumi Lane','Kericho','Kenya','20200','Kenya'),
	(27,'2020 Uchumi Lane','Kericho','Kenya','20200','Kenya'),
	(28,'1 Mama Ngina St','Nairobi','Kenya','78787','Kenya'),
	(29,'2121 Ngong Rd','Nairobi','Kenya','90900','Kenya');

/*!40000 ALTER TABLE `gpp_addresses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gpp_contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gpp_contacts`;

CREATE TABLE `gpp_contacts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `role` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `gpp_contacts` WRITE;
/*!40000 ALTER TABLE `gpp_contacts` DISABLE KEYS */;

INSERT INTO `gpp_contacts` (`id`, `name`, `role`, `email`, `phone`)
VALUES
	(1,'First Last','CEO','test@email','888-888-8888'),
	(2,'Kibii Major','Organizer','test@email','888-888-8888'),
	(3,'','','',''),
	(4,'William Rutto','Founder','rutto@jp.com','888-888-8888'),
	(5,'','','',''),
	(6,'','','',''),
	(7,'Kiprotich Manu','Chief','test@email.com','444-444-4444'),
	(8,'','','',''),
	(9,'','','',''),
	(10,'Tami Adams','Engineer','tami@trincoll.edu','765-908-4536'),
	(11,'','','',''),
	(12,'','','',''),
	(13,'Smriti Joneja','Chief Logistics Officer','smriti.j@berkeley.edu','555-666-7878'),
	(14,'','','',''),
	(15,'','','',''),
	(16,'','','',''),
	(17,'','','',''),
	(18,'','','',''),
	(19,'Musalia Mudavadi','Founder','mudavadi@yahoo.com','900-415-9280'),
	(20,'','','',''),
	(21,'','','',''),
	(22,'','','',''),
	(23,'','','',''),
	(24,'','','',''),
	(25,'F Name','Role','email','Phone'),
	(26,'','','',''),
	(27,'','','',''),
	(28,'Williams Rutto','Founder','test@email.com','888-888-8888'),
	(29,'','','',''),
	(30,'','','',''),
	(34,'This is a Name','This is a Role','This is an Email','This is a Phone'),
	(35,'','','',''),
	(36,'This is a Name','This is a Role','This is an Email','This is a Phone'),
	(37,'This is a Name','This is a Role','This is an Email','This is a Phone'),
	(38,'','','',''),
	(39,'This is a Name','This is a Role','This is an Email','This is a Phone'),
	(40,'','','',''),
	(41,'','','',''),
	(42,'','','',''),
	(43,'This is a Name','This is a Role','This is an Email','This is a Phone'),
	(44,'','','',''),
	(45,'This is a Name','This is a Role','This is an Email','This is a Phone'),
	(46,'','','',''),
	(47,'','','',''),
	(48,'','','',''),
	(49,'William Rutto','Founder','test@email.com','888-888-8888'),
	(50,'','','',''),
	(51,'','','',''),
	(52,'Williams Rutto','Founder','test@email.com','888-888-8888'),
	(53,'','','',''),
	(54,'','','','');

/*!40000 ALTER TABLE `gpp_contacts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gpp_countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gpp_countries`;

CREATE TABLE `gpp_countries` (
  `code` varchar(8) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `gpp_countries` WRITE;
/*!40000 ALTER TABLE `gpp_countries` DISABLE KEYS */;

INSERT INTO `gpp_countries` (`code`, `name`)
VALUES
	('AF','Afghanistan'),
	('AX','Åland Islands'),
	('AL','Albania'),
	('DZ','Algeria'),
	('AS','American Samoa'),
	('AD','Andorra'),
	('AO','Angola'),
	('AI','Anguilla'),
	('AQ','Antarctica'),
	('AG','Antigua and Barbuda'),
	('AR','Argentina'),
	('AM','Armenia'),
	('AW','Aruba'),
	('AU','Australia'),
	('AT','Austria'),
	('AZ','Azerbaijan'),
	('BS','Bahamas'),
	('BH','Bahrain'),
	('BD','Bangladesh'),
	('BB','Barbados'),
	('BY','Belarus'),
	('BE','Belgium'),
	('BZ','Belize'),
	('BJ','Benin'),
	('BM','Bermuda'),
	('BT','Bhutan'),
	('BO','Bolivia, Plurinational State of'),
	('BQ','Bonaire, Sint Eustatius and Saba'),
	('BA','Bosnia and Herzegovina'),
	('BW','Botswana'),
	('BV','Bouvet Island'),
	('BR','Brazil'),
	('IO','British Indian Ocean Territory'),
	('BN','Brunei Darussalam'),
	('BG','Bulgaria'),
	('BF','Burkina Faso'),
	('BI','Burundi'),
	('KH','Cambodia'),
	('CM','Cameroon'),
	('CA','Canada'),
	('CV','Cape Verde'),
	('KY','Cayman Islands'),
	('CF','Central African Republic'),
	('TD','Chad'),
	('CL','Chile'),
	('CN','China'),
	('CX','Christmas Island'),
	('CC','Cocos (Keeling) Islands'),
	('CO','Colombia'),
	('KM','Comoros'),
	('CG','Congo'),
	('CD','Congo, the Democratic Republic of the'),
	('CK','Cook Islands'),
	('CR','Costa Rica'),
	('CI','Côte d\'Ivoire'),
	('HR','Croatia'),
	('CU','Cuba'),
	('CW','Curaçao'),
	('CY','Cyprus'),
	('CZ','Czech Republic'),
	('DK','Denmark'),
	('DJ','Djibouti'),
	('DM','Dominica'),
	('DO','Dominican Republic'),
	('EC','Ecuador'),
	('EG','Egypt'),
	('SV','El Salvador'),
	('GQ','Equatorial Guinea'),
	('ER','Eritrea'),
	('EE','Estonia'),
	('ET','Ethiopia'),
	('FK','Falkland Islands (Malvinas)'),
	('FO','Faroe Islands'),
	('FJ','Fiji'),
	('FI','Finland'),
	('FR','France'),
	('GF','French Guiana'),
	('PF','French Polynesia'),
	('TF','French Southern Territories'),
	('GA','Gabon'),
	('GM','Gambia'),
	('GE','Georgia'),
	('DE','Germany'),
	('GH','Ghana'),
	('GI','Gibraltar'),
	('GR','Greece'),
	('GL','Greenland'),
	('GD','Grenada'),
	('GP','Guadeloupe'),
	('GU','Guam'),
	('GT','Guatemala'),
	('GG','Guernsey'),
	('GN','Guinea'),
	('GW','Guinea-Bissau'),
	('GY','Guyana'),
	('HT','Haiti'),
	('HM','Heard Island and McDonald Islands'),
	('VA','Holy See (Vatican City State)'),
	('HN','Honduras'),
	('HK','Hong Kong'),
	('HU','Hungary'),
	('IS','Iceland'),
	('IN','India'),
	('ID','Indonesia'),
	('IR','Iran, Islamic Republic of'),
	('IQ','Iraq'),
	('IE','Ireland'),
	('IM','Isle of Man'),
	('IL','Israel'),
	('IT','Italy'),
	('JM','Jamaica'),
	('JP','Japan'),
	('JE','Jersey'),
	('JO','Jordan'),
	('KZ','Kazakhstan'),
	('KE','Kenya'),
	('KI','Kiribati'),
	('KP','Korea, Democratic People\'s Republic of'),
	('KR','Korea, Republic of'),
	('KW','Kuwait'),
	('KG','Kyrgyzstan'),
	('LA','Lao People\'s Democratic Republic'),
	('LV','Latvia'),
	('LB','Lebanon'),
	('LS','Lesotho'),
	('LR','Liberia'),
	('LY','Libya'),
	('LI','Liechtenstein'),
	('LT','Lithuania'),
	('LU','Luxembourg'),
	('MO','Macao'),
	('MK','Macedonia, the Former Yugoslav Republic of'),
	('MG','Madagascar'),
	('MW','Malawi'),
	('MY','Malaysia'),
	('MV','Maldives'),
	('ML','Mali'),
	('MT','Malta'),
	('MH','Marshall Islands'),
	('MQ','Martinique'),
	('MR','Mauritania'),
	('MU','Mauritius'),
	('YT','Mayotte'),
	('MX','Mexico'),
	('FM','Micronesia, Federated States of'),
	('MD','Moldova, Republic of'),
	('MC','Monaco'),
	('MN','Mongolia'),
	('ME','Montenegro'),
	('MS','Montserrat'),
	('MA','Morocco'),
	('MZ','Mozambique'),
	('MM','Myanmar'),
	('NA','Namibia'),
	('NR','Nauru'),
	('NP','Nepal'),
	('NL','Netherlands'),
	('NC','New Caledonia'),
	('NZ','New Zealand'),
	('NI','Nicaragua'),
	('NE','Niger'),
	('NG','Nigeria'),
	('NU','Niue'),
	('NF','Norfolk Island'),
	('MP','Northern Mariana Islands'),
	('NO','Norway'),
	('OM','Oman'),
	('PK','Pakistan'),
	('PW','Palau'),
	('PS','Palestine, State of'),
	('PA','Panama'),
	('PG','Papua New Guinea'),
	('PY','Paraguay'),
	('PE','Peru'),
	('PH','Philippines'),
	('PN','Pitcairn'),
	('PL','Poland'),
	('PT','Portugal'),
	('PR','Puerto Rico'),
	('QA','Qatar'),
	('RE','Réunion'),
	('RO','Romania'),
	('RU','Russian Federation'),
	('RW','Rwanda'),
	('BL','Saint Barthélemy'),
	('SH','Saint Helena, Ascension and Tristan da Cunha'),
	('KN','Saint Kitts and Nevis'),
	('LC','Saint Lucia'),
	('MF','Saint Martin (French part)'),
	('PM','Saint Pierre and Miquelon'),
	('VC','Saint Vincent and the Grenadines'),
	('WS','Samoa'),
	('SM','San Marino'),
	('ST','Sao Tome and Principe'),
	('SA','Saudi Arabia'),
	('SN','Senegal'),
	('RS','Serbia'),
	('SC','Seychelles'),
	('SL','Sierra Leone'),
	('SG','Singapore'),
	('SX','Sint Maarten (Dutch part)'),
	('SK','Slovakia'),
	('SI','Slovenia'),
	('SB','Solomon Islands'),
	('SO','Somalia'),
	('ZA','South Africa'),
	('GS','South Georgia and the South Sandwich Islands'),
	('SS','South Sudan'),
	('ES','Spain'),
	('LK','Sri Lanka'),
	('SD','Sudan'),
	('SR','Suriname'),
	('SJ','Svalbard and Jan Mayen'),
	('SZ','Swaziland'),
	('SE','Sweden'),
	('CH','Switzerland'),
	('SY','Syrian Arab Republic'),
	('TW','Taiwan, Province of China'),
	('TJ','Tajikistan'),
	('TZ','Tanzania, United Republic of'),
	('TH','Thailand'),
	('TL','Timor-Leste'),
	('TG','Togo'),
	('TK','Tokelau'),
	('TO','Tonga'),
	('TT','Trinidad and Tobago'),
	('TN','Tunisia'),
	('TR','Turkey'),
	('TM','Turkmenistan'),
	('TC','Turks and Caicos Islands'),
	('TV','Tuvalu'),
	('UG','Uganda'),
	('UA','Ukraine'),
	('AE','United Arab Emirates'),
	('GB','United Kingdom'),
	('US','United States'),
	('UM','United States Minor Outlying Islands'),
	('UY','Uruguay'),
	('UZ','Uzbekistan'),
	('VU','Vanuatu'),
	('VE','Venezuela, Bolivarian Republic of'),
	('VN','Viet Nam'),
	('VG','Virgin Islands, British'),
	('VI','Virgin Islands, U.S.'),
	('WF','Wallis and Futuna'),
	('EH','Western Sahara'),
	('YE','Yemen'),
	('ZM','Zambia'),
	('ZW','Zimbabwe'),
	('AF','Afghanistan'),
	('AX','ï¿½land Islands'),
	('AL','Albania'),
	('DZ','Algeria'),
	('AS','American Samoa'),
	('AD','Andorra'),
	('AO','Angola'),
	('AI','Anguilla'),
	('AQ','Antarctica'),
	('AG','Antigua and Barbuda'),
	('AR','Argentina'),
	('AM','Armenia'),
	('AW','Aruba'),
	('AU','Australia'),
	('AT','Austria'),
	('AZ','Azerbaijan'),
	('BS','Bahamas'),
	('BH','Bahrain'),
	('BD','Bangladesh'),
	('BB','Barbados'),
	('BY','Belarus'),
	('BE','Belgium'),
	('BZ','Belize'),
	('BJ','Benin'),
	('BM','Bermuda'),
	('BT','Bhutan'),
	('BO','Bolivia, Plurinational State of'),
	('BQ','Bonaire, Sint Eustatius and Saba'),
	('BA','Bosnia and Herzegovina'),
	('BW','Botswana'),
	('BV','Bouvet Island'),
	('BR','Brazil'),
	('IO','British Indian Ocean Territory'),
	('BN','Brunei Darussalam'),
	('BG','Bulgaria'),
	('BF','Burkina Faso'),
	('BI','Burundi'),
	('KH','Cambodia'),
	('CM','Cameroon'),
	('CA','Canada'),
	('CV','Cape Verde'),
	('KY','Cayman Islands'),
	('CF','Central African Republic'),
	('TD','Chad'),
	('CL','Chile'),
	('CN','China'),
	('CX','Christmas Island'),
	('CC','Cocos (Keeling) Islands'),
	('CO','Colombia'),
	('KM','Comoros'),
	('CG','Congo'),
	('CD','Congo, the Democratic Republic of the'),
	('CK','Cook Islands'),
	('CR','Costa Rica'),
	('CI','Cï¿½te d\'Ivoire'),
	('HR','Croatia'),
	('CU','Cuba'),
	('CW','Curaï¿½ao'),
	('CY','Cyprus'),
	('CZ','Czech Republic'),
	('DK','Denmark'),
	('DJ','Djibouti'),
	('DM','Dominica'),
	('DO','Dominican Republic'),
	('EC','Ecuador'),
	('EG','Egypt'),
	('SV','El Salvador'),
	('GQ','Equatorial Guinea'),
	('ER','Eritrea'),
	('EE','Estonia'),
	('ET','Ethiopia'),
	('FK','Falkland Islands (Malvinas)'),
	('FO','Faroe Islands'),
	('FJ','Fiji'),
	('FI','Finland'),
	('FR','France'),
	('GF','French Guiana'),
	('PF','French Polynesia'),
	('TF','French Southern Territories'),
	('GA','Gabon'),
	('GM','Gambia'),
	('GE','Georgia'),
	('DE','Germany'),
	('GH','Ghana'),
	('GI','Gibraltar'),
	('GR','Greece'),
	('GL','Greenland'),
	('GD','Grenada'),
	('GP','Guadeloupe'),
	('GU','Guam'),
	('GT','Guatemala'),
	('GG','Guernsey'),
	('GN','Guinea'),
	('GW','Guinea-Bissau'),
	('GY','Guyana'),
	('HT','Haiti'),
	('HM','Heard Island and McDonald Islands'),
	('VA','Holy See (Vatican City State)'),
	('HN','Honduras'),
	('HK','Hong Kong'),
	('HU','Hungary'),
	('IS','Iceland'),
	('IN','India'),
	('ID','Indonesia'),
	('IR','Iran, Islamic Republic of'),
	('IQ','Iraq'),
	('IE','Ireland'),
	('IM','Isle of Man'),
	('IL','Israel'),
	('IT','Italy'),
	('JM','Jamaica'),
	('JP','Japan'),
	('JE','Jersey'),
	('JO','Jordan'),
	('KZ','Kazakhstan'),
	('KE','Kenya'),
	('KI','Kiribati'),
	('KP','Korea, Democratic People\'s Republic of'),
	('KR','Korea, Republic of'),
	('KW','Kuwait'),
	('KG','Kyrgyzstan'),
	('LA','Lao People\'s Democratic Republic'),
	('LV','Latvia'),
	('LB','Lebanon'),
	('LS','Lesotho'),
	('LR','Liberia'),
	('LY','Libya'),
	('LI','Liechtenstein'),
	('LT','Lithuania'),
	('LU','Luxembourg'),
	('MO','Macao'),
	('MK','Macedonia, the Former Yugoslav Republic of'),
	('MG','Madagascar'),
	('MW','Malawi'),
	('MY','Malaysia'),
	('MV','Maldives'),
	('ML','Mali'),
	('MT','Malta'),
	('MH','Marshall Islands'),
	('MQ','Martinique'),
	('MR','Mauritania'),
	('MU','Mauritius'),
	('YT','Mayotte'),
	('MX','Mexico'),
	('FM','Micronesia, Federated States of'),
	('MD','Moldova, Republic of'),
	('MC','Monaco'),
	('MN','Mongolia'),
	('ME','Montenegro'),
	('MS','Montserrat'),
	('MA','Morocco'),
	('MZ','Mozambique'),
	('MM','Myanmar'),
	('NA','Namibia'),
	('NR','Nauru'),
	('NP','Nepal'),
	('NL','Netherlands'),
	('NC','New Caledonia'),
	('NZ','New Zealand'),
	('NI','Nicaragua'),
	('NE','Niger'),
	('NG','Nigeria'),
	('NU','Niue'),
	('NF','Norfolk Island'),
	('MP','Northern Mariana Islands'),
	('NO','Norway'),
	('OM','Oman'),
	('PK','Pakistan'),
	('PW','Palau'),
	('PS','Palestine, State of'),
	('PA','Panama'),
	('PG','Papua New Guinea'),
	('PY','Paraguay'),
	('PE','Peru'),
	('PH','Philippines'),
	('PN','Pitcairn'),
	('PL','Poland'),
	('PT','Portugal'),
	('PR','Puerto Rico'),
	('QA','Qatar'),
	('RE','Rï¿½union'),
	('RO','Romania'),
	('RU','Russian Federation'),
	('RW','Rwanda'),
	('BL','Saint Barthï¿½lemy'),
	('SH','Saint Helena, Ascension and Tristan da Cunha'),
	('KN','Saint Kitts and Nevis'),
	('LC','Saint Lucia'),
	('MF','Saint Martin (French part)'),
	('PM','Saint Pierre and Miquelon'),
	('VC','Saint Vincent and the Grenadines'),
	('WS','Samoa'),
	('SM','San Marino'),
	('ST','Sao Tome and Principe'),
	('SA','Saudi Arabia'),
	('SN','Senegal'),
	('RS','Serbia'),
	('SC','Seychelles'),
	('SL','Sierra Leone'),
	('SG','Singapore'),
	('SX','Sint Maarten (Dutch part)'),
	('SK','Slovakia'),
	('SI','Slovenia'),
	('SB','Solomon Islands'),
	('SO','Somalia'),
	('ZA','South Africa'),
	('GS','South Georgia and the South Sandwich Islands'),
	('SS','South Sudan'),
	('ES','Spain'),
	('LK','Sri Lanka'),
	('SD','Sudan'),
	('SR','Suriname'),
	('SJ','Svalbard and Jan Mayen'),
	('SZ','Swaziland'),
	('SE','Sweden'),
	('CH','Switzerland'),
	('SY','Syrian Arab Republic'),
	('TW','Taiwan, Province of China'),
	('TJ','Tajikistan'),
	('TZ','Tanzania, United Republic of'),
	('TH','Thailand'),
	('TL','Timor-Leste'),
	('TG','Togo'),
	('TK','Tokelau'),
	('TO','Tonga'),
	('TT','Trinidad and Tobago'),
	('TN','Tunisia'),
	('TR','Turkey'),
	('TM','Turkmenistan'),
	('TC','Turks and Caicos Islands'),
	('TV','Tuvalu'),
	('UG','Uganda'),
	('UA','Ukraine'),
	('AE','United Arab Emirates'),
	('GB','United Kingdom'),
	('US','United States'),
	('UM','United States Minor Outlying Islands'),
	('UY','Uruguay'),
	('UZ','Uzbekistan'),
	('VU','Vanuatu'),
	('VE','Venezuela, Bolivarian Republic of'),
	('VN','Viet Nam'),
	('VG','Virgin Islands, British'),
	('VI','Virgin Islands, U.S.'),
	('WF','Wallis and Futuna'),
	('EH','Western Sahara'),
	('YE','Yemen'),
	('ZM','Zambia'),
	('ZW','Zimbabwe');

/*!40000 ALTER TABLE `gpp_countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gpp_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gpp_details`;

CREATE TABLE `gpp_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int(11) DEFAULT NULL,
  `contact_ids` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  `affiliations` mediumtext,
  `type` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `region` varchar(64) DEFAULT NULL,
  `sectors` mediumtext,
  `approved_status` char(1) DEFAULT NULL,
  `average_cost` varchar(11) DEFAULT NULL,
  `num_reviews` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `gpp_details` WRITE;
/*!40000 ALTER TABLE `gpp_details` DISABLE KEYS */;

INSERT INTO `gpp_details` (`id`, `address_id`, `contact_ids`, `name`, `phone`, `email`, `website`, `affiliations`, `type`, `country`, `region`, `sectors`, `approved_status`, `average_cost`, `num_reviews`)
VALUES
	(1,1,'1^2^3','ODM House','888-888-8888','test@email','test:website','Student-Led Organization^Faculty-Led Organization^Cal Corps','For Profit / Corporation-Based Development Organization','Kenya','Sub-Saharan Africa','Disaster / Humanitarian Relief^Environment / Sustainability^Microfinance / Small Enterprise','0','3000',1),
	(2,3,'4^5^6','Jubilee House','888-888-9090','example@jp.com','http://test.com','No Campus Affiliation^Blum Center^UC Affiliated^Cal Corps','NGO / Non-Profit','United States','North America','Gender Empowerment^Environment / Sustainability^Information Technology','0','2500',2),
	(3,5,'7^8^9','Serena Foundation','444-444-4444','test@email.com','test@website.com','Cal Corps^Faculty-Led Organization^UC Affiliated','Social Enterprise / Corporate Social Responsibility','Tanzania, United Republic of','Sub-Saharan Africa','Disaster / Humanitarian Relief^Environment / Sustainability^Microfinance / Small Enterprise','0','5000',1),
	(4,7,'10^11^12','United Way','764-890-9090','trincoll@email.com','http://trincol.com','UC Affiliated^Blum Center','Fee-Based Third Party Provider','United States','North America','Healthcare (Basic Heath, HIV/AIDS, Maternal, Child, etc)^Gender Empowerment','0','3000',1),
	(5,9,'13^14^15','100 Strong','555-555-5555','100strong.berkeley@gmail.com','www.onehundredstrong.org','Blum Center^UC Affiliated^Student-Led Organization','Social Enterprise / Corporate Social Responsibility','United States','North America','Disaster / Humanitarian Relief^Microfinance / Small Enterprise','0','2500',1),
	(6,11,'16^17^18','Because Justice Matters','444-666-5151','teacher@mail.com','http://web.com','No Campus Affiliation','NGO / Non-Profit','United States','North America','Immigration','0','5000',1),
	(7,13,'19^20^21','Amani Coalition','','','','Blum Center^UC Affiliated^Cal Corps','Social Enterprise / Corporate Social Responsibility','Kenya','Sub-Saharan Africa','Healthcare (Basic Heath, HIV/AIDS, Maternal, Child, etc)^Human Rights (Housing, Water, Sanitation) / Law^Immigration^Environment / Sustainability^Disaster / Humanitarian Relief','0','4000',1),
	(8,15,'22^23^24','NRM Movement','','','','Blum Center^UC Affiliated','Social Enterprise / Corporate Social Responsibility','India','India','Microfinance / Small Enterprise','0','1500',1),
	(9,17,'25^26^27','Red Cross','5106438305','etstst@email','http://local.com','No Campus Affiliation','Collection Action Group (union, social movement)','Antarctica','South America','Healthcare (Basic Heath, HIV/AIDS, Maternal, Child, etc)','0','1000',1),
	(11,22,'34^35^36','This Is A New Organization','+254-700-8001','example@email.com','http://example.com','Blum Center^Cal Corps^UC Affiliated','For Profit / Corporation-Based Development Organization','Kenya','Sub-Saharan Africa','Collective Mobilization / Advocacy^Gender Empowerment^Fair Trade / Market Access^Environment / Sustainability^Disaster / Humanitarian Relief','0','5000',1);

/*!40000 ALTER TABLE `gpp_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gpp_reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gpp_reviews`;

CREATE TABLE `gpp_reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `region` varchar(64) DEFAULT NULL,
  `languages` mediumtext,
  `difficulties` mediumtext,
  `sectors` mediumtext,
  `stipend` int(8) DEFAULT NULL,
  `cost` int(8) DEFAULT NULL,
  `duration` varchar(16) DEFAULT NULL,
  `what_you_did` mediumtext,
  `typical_day` mediumtext,
  `strength_and_weaknesses` mediumtext,
  `other_comments` mediumtext,
  `safety_score` int(1) DEFAULT NULL,
  `responsiveness` int(1) DEFAULT NULL,
  `reviewer_name` varchar(64) DEFAULT NULL,
  `reviewer_email` varchar(64) DEFAULT NULL,
  `anonymous_review` varchar(1) DEFAULT NULL,
  `timestamp` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `gpp_reviews` WRITE;
/*!40000 ALTER TABLE `gpp_reviews` DISABLE KEYS */;

INSERT INTO `gpp_reviews` (`id`, `address_id`, `organization_id`, `region`, `languages`, `difficulties`, `sectors`, `stipend`, `cost`, `duration`, `what_you_did`, `typical_day`, `strength_and_weaknesses`, `other_comments`, `safety_score`, `responsiveness`, `reviewer_name`, `reviewer_email`, `anonymous_review`, `timestamp`)
VALUES
	(1,8,4,'North America','English, Spanish; Castilian, ','This is a good review','Human Rights (Housing, Water, Sanitation) / Law^Immigration^',2000,3000,'> 1 year','The strval() function is an inbuilt function in PHP and is used to convert any scalar value (string, integer, or double) to a string. We cannot use strval() on arrays or on object, if applied then this function only returns the type name of the value being converted. Return value: This function returns a string.','The strval() function is an inbuilt function in PHP and is used to convert any scalar value (string, integer, or double) to a string. We cannot use strval() on arrays or on object, if applied then this function only returns the type name of the value being converted. Return value: This function returns a string.','The strval() function is an inbuilt function in PHP and is used to convert any scalar value (string, integer, or double) to a string. We cannot use strval() on arrays or on object, if applied then this function only returns the type name of the value being converted. Return value: This function returns a string.','The strval() function is an inbuilt function in PHP and is used to convert any scalar value (string, integer, or double) to a string. We cannot use strval() on arrays or on object, if applied then this function only returns the type name of the value being converted. Return value: This function returns a string.',4,4,'Victor Korir','dummy@email.com','1','1561646472691'),
	(2,12,6,'North America','Armenian, English, ','None','Gender Empowerment^Disaster / Humanitarian Relief',5000,5000,'> 1 year','<br> Since this is a young organization, I had the opportunity of working directly with the Director Ruthie. I was initially attending/networking with the San Francisco Coalition Against Human Trafficking (SFCAHT) with the goal observing the NGOgraphy of nonprofits working with government organizations. Concurrently I was helping with various outreach events, ex: tabling and talking about BJM. <br> Later I helped to develop BJM\\\'s social presence online for the purpose of acquiring additional funding sources. In summary, my contact zone was really with various organizations and people working in this field, and not so much with the victims. This is partly due to me being a male, an experiance for a female might be quite different.','<br> Since this is a young organization, I had the opportunity of working directly with the Director Ruthie. I was initially attending/networking with the San Francisco Coalition Against Human Trafficking (SFCAHT) with the goal observing the NGOgraphy of nonprofits working with government organizations. Concurrently I was helping with various outreach events, ex: tabling and talking about BJM. <br> Later I helped to develop BJM\\\'s social presence online for the purpose of acquiring additional funding sources. In summary, my contact zone was really with various organizations and people working in this field, and not so much with the victims. This is partly due to me being a male, an experiance for a female might be quite different.','<br> Since this is a young organization, I had the opportunity of working directly with the Director Ruthie. I was initially attending/networking with the San Francisco Coalition Against Human Trafficking (SFCAHT) with the goal observing the NGOgraphy of nonprofits working with government organizations. Concurrently I was helping with various outreach events, ex: tabling and talking about BJM. <br> Later I helped to develop BJM\\\'s social presence online for the purpose of acquiring additional funding sources. In summary, my contact zone was really with various organizations and people working in this field, and not so much with the victims. This is partly due to me being a male, an experiance for a female might be quite different.','<br> Since this is a young organization, I had the opportunity of working directly with the Director Ruthie. I was initially attending/networking with the San Francisco Coalition Against Human Trafficking (SFCAHT) with the goal observing the NGOgraphy of nonprofits working with government organizations. Concurrently I was helping with various outreach events, ex: tabling and talking about BJM. <br> Later I helped to develop BJM\\\'s social presence online for the purpose of acquiring additional funding sources. In summary, my contact zone was really with various organizations and people working in this field, and not so much with the victims. This is partly due to me being a male, an experiance for a female might be quite different.',1,3,'Victor Korir','dummy@email.com','1','1561648857877'),
	(3,18,9,'South America','English, ','None whatsoever','Collective Mobilization / Advocacy^Disaster / Humanitarian Relief',2500,1000,'','description','typical','weak','nope',5,5,'Victor Korir','dummy@email.com','0','1561652320500'),
	(5,25,11,'Sub-Saharan Africa','','','',5000,5000,'','','','','',0,0,'Victor Korir','dummy@email.com','1','1562247679537'),
	(6,27,11,'Sub-Saharan Africa','English, Swahili, ','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English.','Disaster / Humanitarian Relief^Environment / Sustainability^Fair Trade / Market Access^Gender Empowerment',5000,5000,'6-12 months','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English.','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English.','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English.','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English.',5,5,'Victor Korir','dummy@email.com','1','1562248186407'),
	(7,28,1,'Sub-Saharan Africa','English, Swahili, Afrikaans, ','molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu augue ut lectus arcu bibendum at varius vel pharetra vel turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis a cras semper auctor neque vitae tempus quam pellentesque nec nam aliquam sem et tortor consequat id porta nibh venenatis cras sed felis eget velit aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae semper quis lectus nulla at volutpat diam ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam non nisi est sit amet facilisis magna etiam tempor orci eu lobortis elementum nibh tellus molestie nunc non blandit massa enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et leo duis ut diam quam nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est velit egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut.','Environment / Sustainability^Fair Trade / Market Access',5000,5000,'4-6 months','molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu augue ut lectus arcu bibendum at varius vel pharetra vel turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis a cras semper auctor neque vitae tempus quam pellentesque nec nam aliquam sem et tortor consequat id porta nibh venenatis cras sed felis eget velit aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae semper quis lectus nulla at volutpat diam ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam non nisi est sit amet facilisis magna etiam tempor orci eu lobortis elementum nibh tellus molestie nunc non blandit massa enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et leo duis ut diam quam nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est velit egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut','molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu augue ut lectus arcu bibendum at varius vel pharetra vel turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis a cras semper auctor neque vitae tempus quam pellentesque nec nam aliquam sem et tortor consequat id porta nibh venenatis cras sed felis eget velit aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae semper quis lectus nulla at volutpat diam ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam non nisi est sit amet facilisis magna etiam tempor orci eu lobortis elementum nibh tellus molestie nunc non blandit massa enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et leo duis ut diam quam nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est velit egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut','molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu augue ut lectus arcu bibendum at varius vel pharetra vel turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis a cras semper auctor neque vitae tempus quam pellentesque nec nam aliquam sem et tortor consequat id porta nibh venenatis cras sed felis eget velit aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae semper quis lectus nulla at volutpat diam ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam non nisi est sit amet facilisis magna etiam tempor orci eu lobortis elementum nibh tellus molestie nunc non blandit massa enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et leo duis ut diam quam nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est velit egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut','molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus viverra accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu augue ut lectus arcu bibendum at varius vel pharetra vel turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis a cras semper auctor neque vitae tempus quam pellentesque nec nam aliquam sem et tortor consequat id porta nibh venenatis cras sed felis eget velit aliquet sagittis id consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae semper quis lectus nulla at volutpat diam ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus nisl tincidunt eget nullam non nisi est sit amet facilisis magna etiam tempor orci eu lobortis elementum nibh tellus molestie nunc non blandit massa enim nec dui nunc mattis enim ut tellus elementum sagittis vitae et leo duis ut diam quam nulla porttitor massa id neque aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est velit egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit amet justo donec enim diam vulputate ut pharetra sit amet aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices dui sapien eget mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu cursus euismod quis viverra nibh cras pulvinar mattis nunc sed blandit libero volutpat sed cras ornare arcu dui vivamus arcu felis bibendum ut tristique et egestas quis ipsum suspendisse ultrices gravida dictum fusce ut',5,5,'Victor Korir','dummy@email.com','0','1562249650319'),
	(8,29,2,'Sub-Saharan Africa','English, Spanish; Castilian, ','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \\\'lorem ipsum\\\' will uncover many web sites still in their infancy. ','Immigration^Information Technology^Microfinance / Small Enterprise',0,1500,'2-4 months','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \\\'lorem ipsum\\\' will uncover many web sites still in their infancy. ','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \\\'lorem ipsum\\\' will uncover many web sites still in their infancy. ','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \\\'lorem ipsum\\\' will uncover many web sites still in their infancy. ','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \\\'Content here, content here\\\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \\\'lorem ipsum\\\' will uncover many web sites still in their infancy. ',5,5,'Victor Korir','dummy@email.com','0','1562250833463');

/*!40000 ALTER TABLE `gpp_reviews` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_commentmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_commentmeta`;

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_comments`;

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`)
VALUES
	(1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2019-07-15 16:49:33','2019-07-15 16:49:33','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','',0,0);

/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_links`;

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_options`;

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'siteurl','http://gpporgs.local','yes'),
	(2,'home','http://gpporgs.local','yes'),
	(3,'blogname','gpporgs','yes'),
	(4,'blogdescription','Just another WordPress site','yes'),
	(5,'users_can_register','0','yes'),
	(6,'admin_email','vkkorir@gmail.com','yes'),
	(7,'start_of_week','1','yes'),
	(8,'use_balanceTags','0','yes'),
	(9,'use_smilies','1','yes'),
	(10,'require_name_email','1','yes'),
	(11,'comments_notify','1','yes'),
	(12,'posts_per_rss','10','yes'),
	(13,'rss_use_excerpt','0','yes'),
	(14,'mailserver_url','mail.example.com','yes'),
	(15,'mailserver_login','login@example.com','yes'),
	(16,'mailserver_pass','password','yes'),
	(17,'mailserver_port','110','yes'),
	(18,'default_category','1','yes'),
	(19,'default_comment_status','open','yes'),
	(20,'default_ping_status','open','yes'),
	(21,'default_pingback_flag','1','yes'),
	(22,'posts_per_page','10','yes'),
	(23,'date_format','F j, Y','yes'),
	(24,'time_format','g:i a','yes'),
	(25,'links_updated_date_format','F j, Y g:i a','yes'),
	(26,'comment_moderation','0','yes'),
	(27,'moderation_notify','1','yes'),
	(28,'permalink_structure','/%postname%/','yes'),
	(29,'rewrite_rules','a:87:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','yes'),
	(30,'hack_file','0','yes'),
	(31,'blog_charset','UTF-8','yes'),
	(32,'moderation_keys','','no'),
	(33,'active_plugins','a:0:{}','yes'),
	(34,'category_base','','yes'),
	(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
	(36,'comment_max_links','2','yes'),
	(37,'gmt_offset','0','yes'),
	(38,'default_email_category','1','yes'),
	(39,'recently_edited','','no'),
	(40,'template','gpporgs','yes'),
	(41,'stylesheet','gpporgs','yes'),
	(42,'comment_whitelist','1','yes'),
	(43,'blacklist_keys','','no'),
	(44,'comment_registration','0','yes'),
	(45,'html_type','text/html','yes'),
	(46,'use_trackback','0','yes'),
	(47,'default_role','subscriber','yes'),
	(48,'db_version','44719','yes'),
	(49,'uploads_use_yearmonth_folders','1','yes'),
	(50,'upload_path','','yes'),
	(51,'blog_public','1','yes'),
	(52,'default_link_category','2','yes'),
	(53,'show_on_front','posts','yes'),
	(54,'tag_base','','yes'),
	(55,'show_avatars','1','yes'),
	(56,'avatar_rating','G','yes'),
	(57,'upload_url_path','','yes'),
	(58,'thumbnail_size_w','150','yes'),
	(59,'thumbnail_size_h','150','yes'),
	(60,'thumbnail_crop','1','yes'),
	(61,'medium_size_w','300','yes'),
	(62,'medium_size_h','300','yes'),
	(63,'avatar_default','mystery','yes'),
	(64,'large_size_w','1024','yes'),
	(65,'large_size_h','1024','yes'),
	(66,'image_default_link_type','none','yes'),
	(67,'image_default_size','','yes'),
	(68,'image_default_align','','yes'),
	(69,'close_comments_for_old_posts','0','yes'),
	(70,'close_comments_days_old','14','yes'),
	(71,'thread_comments','1','yes'),
	(72,'thread_comments_depth','5','yes'),
	(73,'page_comments','0','yes'),
	(74,'comments_per_page','50','yes'),
	(75,'default_comments_page','newest','yes'),
	(76,'comment_order','asc','yes'),
	(77,'sticky_posts','a:0:{}','yes'),
	(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(79,'widget_text','a:0:{}','yes'),
	(80,'widget_rss','a:0:{}','yes'),
	(81,'uninstall_plugins','a:0:{}','no'),
	(82,'timezone_string','','yes'),
	(83,'page_for_posts','0','yes'),
	(84,'page_on_front','0','yes'),
	(85,'default_post_format','0','yes'),
	(86,'link_manager_enabled','0','yes'),
	(87,'finished_splitting_shared_terms','1','yes'),
	(88,'site_icon','0','yes'),
	(89,'medium_large_size_w','768','yes'),
	(90,'medium_large_size_h','0','yes'),
	(91,'wp_page_for_privacy_policy','3','yes'),
	(92,'show_comments_cookies_opt_in','1','yes'),
	(93,'initial_db_version','44719','yes'),
	(94,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),
	(95,'fresh_site','1','yes'),
	(96,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(97,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(98,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(99,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(100,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(101,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),
	(102,'cron','a:5:{i:1563792574;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1563814174;a:4:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1563814264;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1563814268;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),
	(103,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(104,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(105,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(106,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(107,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(108,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(109,'nonce_key','9b86v9N[spXKp9y7=MzJ/ 0vaGWS(TL6eAsml#`)(Aos&RNsO$gJ3f&8{@f;2$Y+','no'),
	(110,'nonce_salt','7.u,u4!YuC76`-P#;QuziH_-vnM I ,.1xI3Rj7p*%f`Emh|6/m(my2B]](CRz(H','no'),
	(111,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(112,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(113,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(115,'theme_mods_twentynineteen','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1563209681;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),
	(116,'recovery_keys','a:0:{}','yes'),
	(117,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.2\";s:7:\"version\";s:5:\"5.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1563791975;s:15:\"version_checked\";s:5:\"5.2.2\";s:12:\"translations\";a:0:{}}','no'),
	(119,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1563791975;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}','no'),
	(122,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1563791979;s:7:\"checked\";a:1:{s:7:\"gpporgs\";s:0:\"\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','no'),
	(123,'_site_transient_timeout_browser_630d2c68223a9b4451a300b70984ca4f','1563814266','no'),
	(124,'_site_transient_browser_630d2c68223a9b4451a300b70984ca4f','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"75.0.3770.100\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
	(125,'_site_transient_timeout_php_check_20c231c3d6703efba5d948822e1d1da6','1563814268','no'),
	(126,'_site_transient_php_check_20c231c3d6703efba5d948822e1d1da6','a:5:{s:19:\"recommended_version\";s:3:\"7.3\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no'),
	(128,'can_compress_scripts','1','no'),
	(141,'current_theme','','yes'),
	(142,'theme_mods_gpporgs','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}','yes'),
	(143,'theme_switched','','yes'),
	(184,'_site_transient_timeout_browser_142f658a516c68ad7f6b93280975b3d2','1564293017','no'),
	(185,'_site_transient_browser_142f658a516c68ad7f6b93280975b3d2','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"75.0.3770.142\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
	(206,'_site_transient_timeout_theme_roots','1563793777','no'),
	(207,'_site_transient_theme_roots','a:1:{s:7:\"gpporgs\";s:7:\"/themes\";}','no'),
	(208,'_transient_doing_cron','1563896449.6152269840240478515625','yes');

/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_postmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_postmeta`;

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
	(1,2,'_wp_page_template','default'),
	(2,3,'_wp_page_template','default');

/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_posts`;

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`)
VALUES
	(1,1,'2019-07-15 16:49:33','2019-07-15 16:49:33','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2019-07-15 16:49:33','2019-07-15 16:49:33','',0,'http://gpporgs.local/?p=1',0,'post','',1),
	(2,1,'2019-07-15 16:49:33','2019-07-15 16:49:33','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://gpporgs.local/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2019-07-15 16:49:33','2019-07-15 16:49:33','',0,'http://gpporgs.local/?page_id=2',0,'page','',0),
	(3,1,'2019-07-15 16:49:33','2019-07-15 16:49:33','<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://gpporgs.local.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->','Privacy Policy','','draft','closed','open','','privacy-policy','','','2019-07-15 16:49:33','2019-07-15 16:49:33','',0,'http://gpporgs.local/?page_id=3',0,'page','',0),
	(4,1,'2019-07-15 16:51:08','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2019-07-15 16:51:08','0000-00-00 00:00:00','',0,'http://gpporgs.local/?p=4',0,'post','',0);

/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_relationships`;

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`)
VALUES
	(1,1,0);

/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_term_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_taxonomy`;

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`)
VALUES
	(1,1,'category','',0,1);

/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_termmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_termmeta`;

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_terms`;

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`)
VALUES
	(1,'Uncategorized','uncategorized',0);

/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_usermeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_usermeta`;

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES
	(1,1,'nickname','gpporgs'),
	(2,1,'first_name','Victor'),
	(3,1,'last_name','Korir'),
	(4,1,'description',''),
	(5,1,'rich_editing','true'),
	(6,1,'syntax_highlighting','true'),
	(7,1,'comment_shortcuts','false'),
	(8,1,'admin_color','fresh'),
	(9,1,'use_ssl','0'),
	(10,1,'show_admin_bar_front','true'),
	(11,1,'locale',''),
	(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
	(13,1,'wp_user_level','10'),
	(14,1,'dismissed_wp_pointers',''),
	(15,1,'show_welcome_panel','1'),
	(17,1,'wp_dashboard_quick_press_last_post_id','4'),
	(18,1,'community-events-location','a:1:{s:2:\"ip\";s:12:\"192.168.93.0\";}'),
	(19,1,'session_tokens','a:490:{s:64:\"a7b1d5d7575e883b1aca01f966f3cc4dc3095f56c1ad01c9c38c8522e3d652dd\";a:4:{s:10:\"expiration\";i:1563860192;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:37:\"WordPress/5.2.2; http://gpporgs.local\";s:5:\"login\";i:1563687392;}s:64:\"fafc8218dd0bc1ce5fa12f288ad1006a851a91d67fec2f2eb160df132e1a67ee\";a:4:{s:10:\"expiration\";i:1563860205;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563687405;}s:64:\"0fc8c6ea403ffc2282821208a20499eef41675cc6d7f3acb08bace624dc6204f\";a:4:{s:10:\"expiration\";i:1563860205;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563687405;}s:64:\"3d3f1e1d571234af3ef9c38da705c568d7c93b8550c67b5dbf2fd11107be9d24\";a:4:{s:10:\"expiration\";i:1563860205;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563687405;}s:64:\"1ffe397ddb6325140af1fef513ab36514c7d2ce874651de9350dcd28c2a96ee7\";a:4:{s:10:\"expiration\";i:1563860205;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563687405;}s:64:\"ed07b4d5e319cb419ec4bcf0e014e05dada2832f354ac01e99f935e60da785b8\";a:4:{s:10:\"expiration\";i:1563860970;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688170;}s:64:\"de0dee912568fea2eafb4a246e56e447084f3376878a66664fa41e1ccff8c483\";a:4:{s:10:\"expiration\";i:1563860970;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688170;}s:64:\"684ff84449f829bcaf373965f7cb161a0ebab59030918967e9225180ac74c7e2\";a:4:{s:10:\"expiration\";i:1563860970;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688170;}s:64:\"d7cc944da96fa4e9ddf3eb4cd960c0c224434f982f1b427ae0e2882037868c5f\";a:4:{s:10:\"expiration\";i:1563860970;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688170;}s:64:\"3e7b94a247253e1c66e7f1497a86c97c53ef9b219dd0fe4d47586a24225dc90d\";a:4:{s:10:\"expiration\";i:1563861009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688209;}s:64:\"66ecb78ba28d988d574cae7d9fab7ba7336cd7a31f65acdd6aa00b645679c9ce\";a:4:{s:10:\"expiration\";i:1563861009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688209;}s:64:\"3a0683c90eea13bb3e7352f762d5716022560f1cf83d295a0ff9801dd33f9d02\";a:4:{s:10:\"expiration\";i:1563861009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:37:\"WordPress/5.2.2; http://gpporgs.local\";s:5:\"login\";i:1563688209;}s:64:\"a6af108dfa1f29a22bf28044db787b31051da5e44285698b4d82bbf5b5f41e8c\";a:4:{s:10:\"expiration\";i:1563861009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688209;}s:64:\"41c3e06d8a769d12e27d74ccd157749ac501332441f8044a8110df327d877ac2\";a:4:{s:10:\"expiration\";i:1563861009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688209;}s:64:\"0a32550341b968a8acc4945cd3393a53c10a0955492fd55591eb3e95bc588c7c\";a:4:{s:10:\"expiration\";i:1563861016;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688216;}s:64:\"edea3bec2c411a69ae6756235639f9d2fc114c868ca389b70db136027b98ef0f\";a:4:{s:10:\"expiration\";i:1563861017;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688217;}s:64:\"cabcd21c83e58c243c7eb21ad690a0fbec51497b80213873c670bd9abe7dab89\";a:4:{s:10:\"expiration\";i:1563861017;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688217;}s:64:\"85fde8f1f072bf23601d0770ca180e1b15a855b0033b40e4ea7b41e181664657\";a:4:{s:10:\"expiration\";i:1563861021;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688221;}s:64:\"6173a96bf7e2d22b87fc519b690c25498e566c1e425b238ecc4f4f06b3a45f2e\";a:4:{s:10:\"expiration\";i:1563861082;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688282;}s:64:\"4527411512d4b52fff8c9a055119abd4f6c1d53ec22df7f1849a8f571e131af1\";a:4:{s:10:\"expiration\";i:1563861105;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688305;}s:64:\"be380052c1747d5eeda9b2f3fa4dad922f4bfcfdc3c5d203c3b6c3aaf8fc3207\";a:4:{s:10:\"expiration\";i:1563861112;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688312;}s:64:\"e2c334bb58d77c12cf7372d8a7860a5d1f6111a5a300d3d35d14a18a7b8a5c6e\";a:4:{s:10:\"expiration\";i:1563861112;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688312;}s:64:\"d8bc3e0d310e9203cad0c8bb8ee045237e3099d4f6da63887bc8f39610396201\";a:4:{s:10:\"expiration\";i:1563861115;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688315;}s:64:\"9f09874cee468f1fb6ad4db2412bf0812fc33f752673558ed0e7de7a476b6455\";a:4:{s:10:\"expiration\";i:1563861117;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688317;}s:64:\"cef4a7ca07520302bcbf38c9142bec66312e263a495db25b0a3536c33833d7fb\";a:4:{s:10:\"expiration\";i:1563861122;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688322;}s:64:\"cbee875f282a1949ecbb96f55a20565007b78944cb2501babb24e3351ae4e577\";a:4:{s:10:\"expiration\";i:1563861122;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688322;}s:64:\"8c49d354b4af44907e428dfd973f05390fdc798672329c6261a2883f0e5a59fd\";a:4:{s:10:\"expiration\";i:1563861123;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688323;}s:64:\"9abbae3c10a4edcdeac4c9b485030e8b98b7411c0cf0c0be1261a6024e8f5a97\";a:4:{s:10:\"expiration\";i:1563861123;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688323;}s:64:\"4afd2bab2d90530bb377600bd7a5c84dbacac411a9e972ca2004323cd9565613\";a:4:{s:10:\"expiration\";i:1563861135;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688335;}s:64:\"a6a7ef9f5b3fcba8d41f0e61704e6b3224f4bafc5ff36d42640dddfbfd85ef59\";a:4:{s:10:\"expiration\";i:1563861135;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688335;}s:64:\"f2a74659f317d978a428b13a229feafe7485226e1a41becf5e71b8c8245a1205\";a:4:{s:10:\"expiration\";i:1563861135;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688335;}s:64:\"1c9b9c5ebbcdc49eb9480d46644c132b4270b0d12992f27232aa0c8115b46b1b\";a:4:{s:10:\"expiration\";i:1563861135;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688335;}s:64:\"e7b8369eb1022de07df655f7f74be94da9e730424b46cbe7dde1f4e968e2d547\";a:4:{s:10:\"expiration\";i:1563861140;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688340;}s:64:\"7cdd7f1b5e295a66b25d9f1243c9109cd2759add780c6d01db8d63422cc1b5ce\";a:4:{s:10:\"expiration\";i:1563861140;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688340;}s:64:\"ff369557efe80c932b42710d9e89451bec64bc302bf1a463162d09ff6bb37e68\";a:4:{s:10:\"expiration\";i:1563861140;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688340;}s:64:\"9d7d96adfb797f822b55fc06c87883f7facf4607f404812829c0f8c1697562ff\";a:4:{s:10:\"expiration\";i:1563861141;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688341;}s:64:\"fef9fe47bf17a8f52af049dffd4db1be90e4d30d250bc5d5ad978471026c5895\";a:4:{s:10:\"expiration\";i:1563861144;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688344;}s:64:\"c81e84072f2c7181ce0fe8ea005106c02dad356ec40b3994b46e62da197217cf\";a:4:{s:10:\"expiration\";i:1563861144;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688344;}s:64:\"2b1761be9d8d9b02da75e96b6f757b35b6b30815c1d7a27dbd5caeb6f006c146\";a:4:{s:10:\"expiration\";i:1563861144;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688344;}s:64:\"a4c75bf9843cc949a6887f2af797143ae7be16f0777709268d47c47de3cfbae0\";a:4:{s:10:\"expiration\";i:1563861144;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563688344;}s:64:\"3112195d29b9aa8b4b000333a7255f6db61c294a7ae6f086fa2ac0885cd272a8\";a:4:{s:10:\"expiration\";i:1563862021;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689221;}s:64:\"72389d2a7ff4274fddab1943a8de41348e5fc6d8e9c1c4fc89fd1909310656dd\";a:4:{s:10:\"expiration\";i:1563862021;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689221;}s:64:\"c67406b4c66018f67039265d0aa482fcee1d45c86ca0fd1cbfb827369305d89b\";a:4:{s:10:\"expiration\";i:1563862022;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689222;}s:64:\"a4abd80e4d7d35ca1d0e5cc48caaff80b59d95942f512b9dc415c81bb22a88f9\";a:4:{s:10:\"expiration\";i:1563862022;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689222;}s:64:\"6088650aa4a8691e1c920058e62092de7b885668735cec8743afb41b1d299149\";a:4:{s:10:\"expiration\";i:1563862025;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689225;}s:64:\"c7c137a9a9d52edfafca5b860317215e012ec6f9e16205d759d4d86a5a7c9946\";a:4:{s:10:\"expiration\";i:1563862025;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689225;}s:64:\"2f843747a32fcae0761d3da74de6e369e6be8e9aea87c64a13d528454649962e\";a:4:{s:10:\"expiration\";i:1563862025;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689225;}s:64:\"21aaebfd989a305dbeb3c162973457f051f16fee832734f9e23d7f0846f52ea6\";a:4:{s:10:\"expiration\";i:1563862025;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689225;}s:64:\"c0ed3ed33d958e75ac59dd107acbe07b71ecd7ed1ab22c1caa41f765ad17791f\";a:4:{s:10:\"expiration\";i:1563862431;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689631;}s:64:\"cadd46f2ebdac6762b041fb3da5f0aaaafa42f0526d60190f389163d8f6476be\";a:4:{s:10:\"expiration\";i:1563862431;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689631;}s:64:\"f85c916763e29d57b0be99731dc0d62c6abd37783338a9d50fd74daa272691cf\";a:4:{s:10:\"expiration\";i:1563862432;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689632;}s:64:\"e1c7e7d3d1b68ea6bd664cf8d4f79326116b95023003dc00423262f621a5b139\";a:4:{s:10:\"expiration\";i:1563862432;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689632;}s:64:\"6999089f6f44c4fd0e0e6530a2f4beb9732f48ca4a3f29f45c55c87f4ca0788b\";a:4:{s:10:\"expiration\";i:1563862435;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689635;}s:64:\"09756abb42bed8e74af4ec8e132cf5ae890e1abcab6c0ccf6112ade86f722e80\";a:4:{s:10:\"expiration\";i:1563862435;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689635;}s:64:\"9ab5a8df95545d8378baffab1c505f3f3d946c09aa16d09c27439d2b2bf9c288\";a:4:{s:10:\"expiration\";i:1563862435;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689635;}s:64:\"215d48f54d4b07eae4ea265a20a5597c370df657226498c89b764f4d9d9d906a\";a:4:{s:10:\"expiration\";i:1563862435;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689635;}s:64:\"4534b4e953e2412388eb7fe1c50a7b41012a30710da318d732ec3e3f24897110\";a:4:{s:10:\"expiration\";i:1563862439;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689639;}s:64:\"7a15319cab8e7a68ce947e75ec4d7a9ae0d9431a81c801c9f2fc195531b9a891\";a:4:{s:10:\"expiration\";i:1563862439;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689639;}s:64:\"b4dc46ad3fc511e104d3bdb2918fe7d9fcdcd2d9ef9bc6e81e7a924d048444f8\";a:4:{s:10:\"expiration\";i:1563862439;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689639;}s:64:\"2dd6d6a04713efe3aefdae524b7af05961bf8dedb58f84631e4c1cc5bf1e4f9d\";a:4:{s:10:\"expiration\";i:1563862439;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689639;}s:64:\"4a72b36c38541f6a106ef76fca0f5f51cff4a5acbca1eed5120a90dceff73be9\";a:4:{s:10:\"expiration\";i:1563862500;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689700;}s:64:\"0101bad5535f3321da48647f360219eb8a2db24baa8ccff5af9e97f03702ea12\";a:4:{s:10:\"expiration\";i:1563862500;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689700;}s:64:\"28e018333e9e6da5280554e8175aa47215fdb12d750573d02c840dbffc84ce9e\";a:4:{s:10:\"expiration\";i:1563862501;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689701;}s:64:\"0e25b2d2236cc07de69814c2d02d6b736346d8836e75c95c8148cddbbf474584\";a:4:{s:10:\"expiration\";i:1563862506;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689706;}s:64:\"2bda029b1f73a8df7d4f45afa48aa112d76abc651ee94edd75b7d233e9bd47a4\";a:4:{s:10:\"expiration\";i:1563862566;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563689766;}s:64:\"7798f4a0faf77e6599a73a1e2ce5b341c4a306fce3bd5afba91e74154b14e492\";a:4:{s:10:\"expiration\";i:1563870181;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697381;}s:64:\"9acbe3919c4cfce5f55c472327948d25aac892231e9568f58ac197554643279d\";a:4:{s:10:\"expiration\";i:1563870181;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:37:\"WordPress/5.2.2; http://gpporgs.local\";s:5:\"login\";i:1563697381;}s:64:\"061431ee4692b4bb4b4d4a1c12162991a77c75b80e8aa38b3e3cb60b1980ae69\";a:4:{s:10:\"expiration\";i:1563870182;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697382;}s:64:\"3081af9d0e76df7b6e904ddf8121cde9a19252cd86e113907cb68b4315c1e9a4\";a:4:{s:10:\"expiration\";i:1563870182;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697382;}s:64:\"31032fd2e6711661af3ec962973c55ea1e7bfd5498880ee7414d009447249a3a\";a:4:{s:10:\"expiration\";i:1563870192;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697392;}s:64:\"88617161a54ea1c4e4f16842eb474bdd08056a0354b7e8282c2cd9a37233c387\";a:4:{s:10:\"expiration\";i:1563870192;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697392;}s:64:\"bc4075ae9e6b9e740f454d54a7d798c89ca6c5c1a3eb1d91f63086b0cfeaa61a\";a:4:{s:10:\"expiration\";i:1563870192;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697392;}s:64:\"23cd6c8df99f3f00b87a6be9bb9e3fe0097ab24ee519acf438f154f88e82ee9d\";a:4:{s:10:\"expiration\";i:1563870192;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697392;}s:64:\"f5b73f96bc9e800df61650a447ea4c526dc8e803d98986bc2ffb9b82231daef3\";a:4:{s:10:\"expiration\";i:1563870224;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697424;}s:64:\"f526d349f01d9a6d08cc10d0baedb8f55ecedcdd4803eb4292c857c69854c57b\";a:4:{s:10:\"expiration\";i:1563870348;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697548;}s:64:\"a2dbf71477edb46eb6414438f33f556e5f725fa3746bd2f94aa4f1807c0a42a9\";a:4:{s:10:\"expiration\";i:1563870348;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697548;}s:64:\"6be5f00a5cc4395ae0dec9bf07dd5540906fa112a5766aa9a86dbcb6f668020f\";a:4:{s:10:\"expiration\";i:1563870349;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697549;}s:64:\"30df3cf30e1a467dd4f8231263b186535fbda40893f1d3525ffd99ec0137efb5\";a:4:{s:10:\"expiration\";i:1563870349;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697549;}s:64:\"f7cf896a40640f5bf41c13ff783ac3afe13df0e4c5bc01d2fbe9eee555c1e8b9\";a:4:{s:10:\"expiration\";i:1563870359;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697559;}s:64:\"9fb3ff09efa20b1f0d7b84bba30aefedec17c4a78f03331909b542a8e61f7306\";a:4:{s:10:\"expiration\";i:1563870359;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697559;}s:64:\"55c3b673c9f63843d42245ede4eae0a7d131ba6b59e76fde43a54e15788740af\";a:4:{s:10:\"expiration\";i:1563870360;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697560;}s:64:\"9ff890f252dacb5f48d6e920fa779cf72dc26b85d20d4dc296710c0691c7b13f\";a:4:{s:10:\"expiration\";i:1563870360;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697560;}s:64:\"08badd48b3888d56626f7a6015d939a5a19103d582d46d648d3503b94a86d898\";a:4:{s:10:\"expiration\";i:1563870391;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697591;}s:64:\"793fe439e12c07b49dca1f4ef98f9337d93cfb9150633ffadd78e6af7a988b1c\";a:4:{s:10:\"expiration\";i:1563870391;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697591;}s:64:\"f6fe462305a02449d4a229487341ee0ea5459155daa5d880ef29c1aa2d17cdb1\";a:4:{s:10:\"expiration\";i:1563870391;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697591;}s:64:\"0c627b5148f7f93c9943ae57bc5dffd0e46333c065eb9aa5553b6bbf568cfb8f\";a:4:{s:10:\"expiration\";i:1563870391;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697591;}s:64:\"d9f5cc10ec0075de9d411cf7d31e283e4d26ab3d39bc9c5e0cad7d3576ea449a\";a:4:{s:10:\"expiration\";i:1563870403;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697603;}s:64:\"ce5b18eb2c2a4a0595b83a68efadadfc07de0a52129d31b0f24b6418ae59ade3\";a:4:{s:10:\"expiration\";i:1563870403;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697603;}s:64:\"25638c77c9d9d8357a5f5819c350cbf3a41113d0497a8d49645a40d71dd96268\";a:4:{s:10:\"expiration\";i:1563870403;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697603;}s:64:\"96e84e681f2f394d14e34a5cc4f4ec8dba8f7816ed646b4fcd5ad91d0b55f265\";a:4:{s:10:\"expiration\";i:1563870403;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697603;}s:64:\"ef30d34fd586add75c57088aa6dd1ebad1ce86196c1ba0f55338b007a46ff53f\";a:4:{s:10:\"expiration\";i:1563870519;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697719;}s:64:\"6c730fc6580c99c74d7bc6a347e3dbf98550a66f248759f676e17b661db6f57c\";a:4:{s:10:\"expiration\";i:1563870519;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697719;}s:64:\"218f271394d1e59d56776c8660f12d85034fce429869e8b224bde5bca64b7fc0\";a:4:{s:10:\"expiration\";i:1563870519;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697719;}s:64:\"967239568401625e8ec63ed4ec98387ad7f69d198ac9e373a7075848ae2c996e\";a:4:{s:10:\"expiration\";i:1563870519;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697719;}s:64:\"4de4db4b6041f043ecd9542b815eb6d6fea51e6ee1069bf83df16f39da818bac\";a:4:{s:10:\"expiration\";i:1563870533;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697733;}s:64:\"fbcdb3109eeca828e5ea32601b1c1bec59e61b27a746092609e0731b1926ed2e\";a:4:{s:10:\"expiration\";i:1563870533;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697733;}s:64:\"af78b2343c780465b9b5de5d0695116f3ed550efb82870ed98fc9c54d5217f54\";a:4:{s:10:\"expiration\";i:1563870533;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697733;}s:64:\"a95b530560d3b599f07128195527deeb63362921372567b2b67fd310279861d3\";a:4:{s:10:\"expiration\";i:1563870533;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697733;}s:64:\"351d09b28e5b0b331ecf9a038a02b205fe44c381a57ed374da6585f27c77c7f2\";a:4:{s:10:\"expiration\";i:1563870534;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697734;}s:64:\"dc63a952b8494268cd8d9886dd8d3e11eb9f681a4a888232286feb2cc916d241\";a:4:{s:10:\"expiration\";i:1563870534;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697734;}s:64:\"ebedc57eea38a9ffc88954af53a9619121fcf5c13f2ccc1c21f295c9b4f6b7c1\";a:4:{s:10:\"expiration\";i:1563870534;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697734;}s:64:\"cc758fdb86a79faec4e67dcdd78ac2931f48d007e45cd2b20f34e5f9919ce14c\";a:4:{s:10:\"expiration\";i:1563870534;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697734;}s:64:\"9662b78dae0edd4f73149ec1801cb8169ca4fba9500e9b667143e97a7b42eb9c\";a:4:{s:10:\"expiration\";i:1563870534;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697734;}s:64:\"7517973019bd01814fbace0b426447637c76a4a5ee0b670da69d3c1aae353470\";a:4:{s:10:\"expiration\";i:1563870534;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697734;}s:64:\"6b5775287510501cb4cb9f75b808b8a7938926fd5d9b45f3cc68b7db48be52b6\";a:4:{s:10:\"expiration\";i:1563870535;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697735;}s:64:\"4b110ee49cf7053f4e9f7cda4b202e33d6985a9db24720e858409d5ff9dbc4dc\";a:4:{s:10:\"expiration\";i:1563870535;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563697735;}s:64:\"3384d8202406b7026b92c20bc5a20063b2318d8989f2a76a8ef9988f3196d152\";a:4:{s:10:\"expiration\";i:1563871961;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699161;}s:64:\"6a61392bb51f1fdc8e0571e1458833ef980c3bf8c94cf8243fe2d12cbb373aeb\";a:4:{s:10:\"expiration\";i:1563871961;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699161;}s:64:\"d3478e8800a90f6e1a910feb6210479dd0e962617eb6d6714635f15613b34d0e\";a:4:{s:10:\"expiration\";i:1563871961;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:37:\"WordPress/5.2.2; http://gpporgs.local\";s:5:\"login\";i:1563699161;}s:64:\"41a9b37e969a239922a6987f31510697e0f826e575dc655c59a4ee445ec1c601\";a:4:{s:10:\"expiration\";i:1563871961;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699161;}s:64:\"26e784f6360d1fa75b2ff0e75abbd46b165f58cbd7a37ce2dea3fbce27c7bd84\";a:4:{s:10:\"expiration\";i:1563871961;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699161;}s:64:\"f10d8601a3d255ab3582d1e283501a15f25de0f46b3b7ae98df9ebb9f4e581f8\";a:4:{s:10:\"expiration\";i:1563871978;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699178;}s:64:\"d1049138dccfa4485c6e7fac3c8fc3d0f59867ef96bc2acec21f1cd09b7c9d6d\";a:4:{s:10:\"expiration\";i:1563871987;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699187;}s:64:\"6cf32fcdc5bf1198d71d552d193f47bb2ede0c19fa43f00f52e80fbb7ab70492\";a:4:{s:10:\"expiration\";i:1563871993;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699193;}s:64:\"831126c6962eb75611414a08c71ce6474b41299276179f451bb74d56bd5431ed\";a:4:{s:10:\"expiration\";i:1563871998;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699198;}s:64:\"58afb6ab07074056aa71cfe00557e371beee0a4c2eac1bc116122039041a0cb5\";a:4:{s:10:\"expiration\";i:1563872006;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699206;}s:64:\"6f866da3ee71df4c397ed6b156ce19e8c09e09d067e779b4aaddd7b24d2d9a35\";a:4:{s:10:\"expiration\";i:1563872008;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699208;}s:64:\"e994263bc3ff7507080d08d24cbcaadaa3aeb7c7898460fff6a91c72ea74efb3\";a:4:{s:10:\"expiration\";i:1563872011;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699211;}s:64:\"ea63891d33aae66cb37ecf977a1d880f8941710008604c652a9fc58b8235b895\";a:4:{s:10:\"expiration\";i:1563872025;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699225;}s:64:\"5d2f920f10a1abfda2e8ccedb308ab30fb10c2673f49a507ba1da420f029fa53\";a:4:{s:10:\"expiration\";i:1563872040;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699240;}s:64:\"a4a1406f94d54b968bcaedeed4b80588a79ae9c31d675beff39de9d3db7cf077\";a:4:{s:10:\"expiration\";i:1563872041;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699241;}s:64:\"183ea92e1d55c04819cc415c9caffaef19c03cdd200367406a7fa1d4bb4f3fd9\";a:4:{s:10:\"expiration\";i:1563872046;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699246;}s:64:\"ce1ca57acc3cbb4a3522359db2d755b4ae0f4aa332d8e67dc9a162b4f5937505\";a:4:{s:10:\"expiration\";i:1563872050;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699250;}s:64:\"96e5b757c272bb2b32aaa936c35b998cc5cdd13d78901878ae44e12d0dc1b27b\";a:4:{s:10:\"expiration\";i:1563872061;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699261;}s:64:\"0773308797fe2abfd5dc03fa5aaff561d81edf8202e4ff382dc76b38e20bc3be\";a:4:{s:10:\"expiration\";i:1563872065;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699265;}s:64:\"2b1a44f6e10c43dd0e2ecdab25de7fcb6ad544e94447bcd74be22133d0e2d57c\";a:4:{s:10:\"expiration\";i:1563872069;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699269;}s:64:\"4b13fc7bf64ad634ae3b214bfb0b27b446197baa408c7e4505c83b5dbd6e8264\";a:4:{s:10:\"expiration\";i:1563872069;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699269;}s:64:\"f7420c56dedd94736c781123209cf12ed88d53d6a15f5b8c56c22445ba895f41\";a:4:{s:10:\"expiration\";i:1563872073;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699273;}s:64:\"657971fc47896f7a1acfab8ca4cbcdc580153e1d6c3d6e82e9eb4ecc903dea61\";a:4:{s:10:\"expiration\";i:1563872080;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699280;}s:64:\"13db30ff9c2f92af32ad0b5e2a553d6b7744e1310dede3e22800cb2c2710782a\";a:4:{s:10:\"expiration\";i:1563872085;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699285;}s:64:\"999bb55fe09b552fffd1057a0d65311efc2147e79f7a36d9c4969b4aecd2d179\";a:4:{s:10:\"expiration\";i:1563872088;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699288;}s:64:\"b6816110198250932be8fa6cd401bee0d2a2134eec24ae8da23ff638674f96dd\";a:4:{s:10:\"expiration\";i:1563872096;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699296;}s:64:\"b1ecbba3c093d38d6e18fbde640095bd6a389a9cf08a8748a1bc987dee555c6f\";a:4:{s:10:\"expiration\";i:1563872125;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699325;}s:64:\"135441b050ca478c83000d4738b4df22ff1be40ac0b62a6b1f28ef1b843cf943\";a:4:{s:10:\"expiration\";i:1563872130;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699330;}s:64:\"deea6f147d7a08039fb5626b6d3f7f92b20999446854c8cbde05abc3e5f4be37\";a:4:{s:10:\"expiration\";i:1563872630;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699830;}s:64:\"712249bb2c838a2d46b2eeac2fa62918f199d84c6f1e7a15f7c87a8c03911b00\";a:4:{s:10:\"expiration\";i:1563872638;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699838;}s:64:\"70e4b50084d2b5ae17e0d83391ab6f7f08d1c36cadf73c0da724c99173b1c3ad\";a:4:{s:10:\"expiration\";i:1563872638;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699838;}s:64:\"61f4fb0249f68fd9522959fe3323a1a801f04d1df3a87d692e305f5bffaacb85\";a:4:{s:10:\"expiration\";i:1563872650;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699850;}s:64:\"4b28b0521b7e594e89a226055dd08a6ad7c16472d622d6d0a1b9cf3d7385a794\";a:4:{s:10:\"expiration\";i:1563872651;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699851;}s:64:\"09dc3b6f5482188b0dc5a8d3da45d316e6634360cec243e8d5872e5be32ae9e1\";a:4:{s:10:\"expiration\";i:1563872651;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699851;}s:64:\"f4c67c70e1ca277b2c31d0866534cd065b40603bf787932078115915d7a400d3\";a:4:{s:10:\"expiration\";i:1563872652;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699852;}s:64:\"ecd14b7703aa02f5f01ae578511155e95c0232b7b516adbf6dcb63ef11bf62a5\";a:4:{s:10:\"expiration\";i:1563872652;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699852;}s:64:\"0f34c7c6192f15c68d9e189626a34a688b98243f4856a07a694e85fbfffde9e9\";a:4:{s:10:\"expiration\";i:1563872652;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699852;}s:64:\"96cc13a90e036ec2fd4f47838d176d00738df9946b19573f40276bb1630f87cc\";a:4:{s:10:\"expiration\";i:1563872657;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699857;}s:64:\"3bb07ce70e27246766fe36852883d2a828adb7c701329ecce369fbef81892bf7\";a:4:{s:10:\"expiration\";i:1563872668;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699868;}s:64:\"64bd4557af90cd6406483037c07c41491cd0455b328d8a99aaf2512405cb60c3\";a:4:{s:10:\"expiration\";i:1563872669;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699869;}s:64:\"867efda4bd0f8de78dff32baa87f75489a3e3f44afdad1be39d73077744392cf\";a:4:{s:10:\"expiration\";i:1563872669;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699869;}s:64:\"fde213ceba92ddea637c29c894c2593c70b162efb4f0c352116e77c173d8b858\";a:4:{s:10:\"expiration\";i:1563872669;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699869;}s:64:\"eafc7f4fa4b50818e6ae6e5c2c40d372db6bce0601040e5f01785f64bcdcddc9\";a:4:{s:10:\"expiration\";i:1563872669;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563699869;}s:64:\"4eadf10620792436cc769f26df08c5efaf6ca87b3142154a14fe1e169db31207\";a:4:{s:10:\"expiration\";i:1563872835;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700035;}s:64:\"eb1118b7de3243ea5715628ca69fa0b012d79ee171f35e676a18754b1a0a555c\";a:4:{s:10:\"expiration\";i:1563872838;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700038;}s:64:\"c31a82294e18fb076ea4968aefb24802d4701df04f8bdf4ad426fdf4ecde9d7e\";a:4:{s:10:\"expiration\";i:1563872845;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700045;}s:64:\"a6f7b5aee9584b0d0233e2eb51d3825c37ce21702fcb8ea744573787221dd21e\";a:4:{s:10:\"expiration\";i:1563872845;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700045;}s:64:\"c6008b30eb34bcfb9aa38872001086362ff8569ab58e9cdc32dcd0d4702794b5\";a:4:{s:10:\"expiration\";i:1563872870;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700070;}s:64:\"4cfd9efb09096d97175584b0e3b857f11b98b0390fc84918224e64a0cd46fac2\";a:4:{s:10:\"expiration\";i:1563872972;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700172;}s:64:\"781c8259c6c2f99ce2a8e825a066a4c846feb05470c0ea57b1fb18c01f161ad3\";a:4:{s:10:\"expiration\";i:1563872973;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700173;}s:64:\"69dc1443ec8820044b5ffb07a7aca2aa9087c157aa8734d9f97520d1677bbf16\";a:4:{s:10:\"expiration\";i:1563872983;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700183;}s:64:\"07b9c407fee7d63c54a3504527d515c4ff8963214d062e3a0595694f87180e91\";a:4:{s:10:\"expiration\";i:1563872986;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700186;}s:64:\"b573b75a0e321fdf0391890ea69add27977622e16907233f9de1b0034e0d271e\";a:4:{s:10:\"expiration\";i:1563872989;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700189;}s:64:\"fa54d81ae8b4db3da6caf79581109cf1fdf8c11da3b887f918b1bdbb26a23f09\";a:4:{s:10:\"expiration\";i:1563872992;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700192;}s:64:\"4aa2516dd183c7f78e912262af4a2f922548ced688805ae9ac8ae3c5dc23b784\";a:4:{s:10:\"expiration\";i:1563873049;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700249;}s:64:\"701abedbcc44c1c8ea9a90d3fecee57292b5f3b9343a8979f960778ee1495805\";a:4:{s:10:\"expiration\";i:1563873050;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700250;}s:64:\"04859168b3f2b738dc9b5ad607de1445c7f3ec4597730ee4d622431ee0eb3acc\";a:4:{s:10:\"expiration\";i:1563873050;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700250;}s:64:\"206b198b923450a499bdbbcdee11937b2f56d152a7095867f6d467a6282f5365\";a:4:{s:10:\"expiration\";i:1563873050;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700250;}s:64:\"1181723d46173c5e6ce7ad923caf543693ac93b04a4bfa96ba953b5cc8325ac0\";a:4:{s:10:\"expiration\";i:1563873050;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700250;}s:64:\"9fed736c06293e0b666d5e101cefa244db34cc691c1de3810e601455377583ad\";a:4:{s:10:\"expiration\";i:1563873058;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700258;}s:64:\"2b0f66df2965f25d61d520ec9679a8077b8cf9a99091a818318d64555138da68\";a:4:{s:10:\"expiration\";i:1563873058;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700258;}s:64:\"7ce76ae81beef245289f560d19f90c72fe568a416fca08342b0f74a852c2a889\";a:4:{s:10:\"expiration\";i:1563873059;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700259;}s:64:\"c52a16377bcc15dd37f4a13d103c209332bae129df731640f0e53a1f9ec68575\";a:4:{s:10:\"expiration\";i:1563873059;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700259;}s:64:\"d37f7117b1a3d25a7445597185f29ff6bf82ee699801f6ce1a66dc9bc822965b\";a:4:{s:10:\"expiration\";i:1563873182;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700382;}s:64:\"182f535861dbe5c2a1645a78ee7bb548779bd85e86ae96f8c677954023dfa9cd\";a:4:{s:10:\"expiration\";i:1563873182;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700382;}s:64:\"b3f6db6eb411dd1e7dfa449c6f69b566bdf18e1182bf3247fe90d6b99671ed53\";a:4:{s:10:\"expiration\";i:1563873182;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700382;}s:64:\"e1b3f4bd13009db5f7f5045d66ef01becfb9e0194b1541e93326885c5752e237\";a:4:{s:10:\"expiration\";i:1563873182;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700382;}s:64:\"5df2d6bb0e000468080b29544dac0fd229dde348966d97a68a8b92109e4dd98f\";a:4:{s:10:\"expiration\";i:1563873190;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700390;}s:64:\"718811e1b6c294299f5321d3d7971cff5984ecd64c99cf800fbd8ba52c3c4241\";a:4:{s:10:\"expiration\";i:1563873190;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700390;}s:64:\"1df150ad90ab9d07dbcc26e1163ef4bc3cce8f917ad4ceedff5bb1bf06cba4aa\";a:4:{s:10:\"expiration\";i:1563873190;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700390;}s:64:\"15c4d332e52059e64e243c299adebb09ee613ab97d64114e73bfec9f43d03d82\";a:4:{s:10:\"expiration\";i:1563873190;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700390;}s:64:\"7dd445ca193b769e462dad85332a01b8db0c8acc1ceaafd0841ae704b4847099\";a:4:{s:10:\"expiration\";i:1563873190;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700390;}s:64:\"c265255219cc7aaf86bd96a4da4cd9c14ebc757d94ee3ab6f6ce0c4b147792e9\";a:4:{s:10:\"expiration\";i:1563873661;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700861;}s:64:\"91b1de9db4405d835b4734d0c4c407634e8274de07e3ab78bafd8fffdfdcc36e\";a:4:{s:10:\"expiration\";i:1563873661;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700861;}s:64:\"b271fbabcafcb5a7005771f96acdf42442ef23c2d4af8384477cdf80914c24da\";a:4:{s:10:\"expiration\";i:1563873662;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700862;}s:64:\"aebccca8b38cc76e4c32adee4b05000a7c71a507b4349ff4ff8362305a8b6118\";a:4:{s:10:\"expiration\";i:1563873662;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700862;}s:64:\"43f97cce65baf85253890fd5f304be3ea52d87d46839a7e5880b2e1b3ed77441\";a:4:{s:10:\"expiration\";i:1563873666;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700866;}s:64:\"8bc3a2cc83dc208c40b4886d0d202db440dc33fbeef0ba62191e5534879377e9\";a:4:{s:10:\"expiration\";i:1563873666;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700866;}s:64:\"3c4c8c73107be942bf463fcf0ce9cab3122a3fa91199c70ea355c585fa310562\";a:4:{s:10:\"expiration\";i:1563873666;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700866;}s:64:\"e5c18f80f47c27c4312b5e312e46886209ac58a966e335872a086990b9ec14ee\";a:4:{s:10:\"expiration\";i:1563873667;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700867;}s:64:\"c1e5120f6f6f0d69ab9d0c91cadfa81ee4c338c6f34f024d08ad7c8361ce9d85\";a:4:{s:10:\"expiration\";i:1563873667;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700867;}s:64:\"0b20a694d8da7128b2169b33c5d003b12ab13e7d6ab4f72f17b770776228880e\";a:4:{s:10:\"expiration\";i:1563873667;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700867;}s:64:\"c3f9590e1169561c9290e4320862227d9b150bc692d6456cfcb23755aaadf504\";a:4:{s:10:\"expiration\";i:1563873669;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700869;}s:64:\"769df4eb4b9b190f03f9f04f1b988906e2e898452c7cd42123a75d0290cafb5f\";a:4:{s:10:\"expiration\";i:1563873669;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700869;}s:64:\"b3612495ec310886f9d651c0511e96790d3e100714c5998aa2e0dad3ab0bc3fd\";a:4:{s:10:\"expiration\";i:1563873669;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700869;}s:64:\"2c73f487b21e4abbb5c84329aef5a387ccb2f1711ee369abd44a2b79bf3fbe6d\";a:4:{s:10:\"expiration\";i:1563873669;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700869;}s:64:\"53e3ba5ecffd7205910d62bbb4d3beac2f7f6103ef844de3c06ac33708638151\";a:4:{s:10:\"expiration\";i:1563873669;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700869;}s:64:\"ab2fbb9a90820c29756f70d1321ab89c2792805316381b6daf420c18196924fe\";a:4:{s:10:\"expiration\";i:1563873670;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700870;}s:64:\"b73b7bdae521be4a14e0c133d14651c6cf152b628cbfd9fa12fb0c634204a9a9\";a:4:{s:10:\"expiration\";i:1563873676;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700876;}s:64:\"cbc107c4bc5a89ae4b3091b913651cca14fb86ff3a6baad99b1a39e6d53d310c\";a:4:{s:10:\"expiration\";i:1563873677;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700877;}s:64:\"3bfcbf81809b38bcb7829a14a1c447e401f0408608074ac224c1aa15d931c7fb\";a:4:{s:10:\"expiration\";i:1563873678;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700878;}s:64:\"a4bfb1f6ccfb81097aa7257ed11bc692d2318f4a2229056d944cc7d730c049f5\";a:4:{s:10:\"expiration\";i:1563873680;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700880;}s:64:\"9de2caa1ad1b07c65787cc4d6f2e77de9a100d52b3c77dfa70c6e9b8c98f774e\";a:4:{s:10:\"expiration\";i:1563873682;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700882;}s:64:\"910549772f45d800314fb381d7de7dd171fbc4a855aa54a34ec88ac745ea65dd\";a:4:{s:10:\"expiration\";i:1563873686;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700886;}s:64:\"e55d462ef7b7541abe3c3072acd6a4e0788d11cf6a452575c03dab8754f2dd26\";a:4:{s:10:\"expiration\";i:1563873687;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700887;}s:64:\"4807a92e4d6e8419661a1ba9f7720fa16a80958ac2562d0192b38809cbb514ef\";a:4:{s:10:\"expiration\";i:1563873688;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700888;}s:64:\"76dde97cc713161e443246e7302ab472ac1536e14073295bd32e58443c3d6e4e\";a:4:{s:10:\"expiration\";i:1563873689;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700889;}s:64:\"6aab37bcfaa95ed95cdde50fe87b689c4230c070d49bce3b4b459e60dbaccf71\";a:4:{s:10:\"expiration\";i:1563873690;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700890;}s:64:\"24e470d2434e335ab9a61004cc12894527d9d83d39193c87e5845e13177b04fd\";a:4:{s:10:\"expiration\";i:1563873700;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700900;}s:64:\"88ee29d329dc56c515dcc582723b59868b6f7a1f611e1b2b8792dcc09a4c6b0d\";a:4:{s:10:\"expiration\";i:1563873701;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563700901;}s:64:\"8284fed560de52a71362f434467902bea37ba0444ef8860b13ae031e5b3adfa6\";a:4:{s:10:\"expiration\";i:1563873948;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701148;}s:64:\"97716b11a8e98520832f63b3a2b8249dcca49e600fe887af3368ed1a69167593\";a:4:{s:10:\"expiration\";i:1563873948;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701148;}s:64:\"6f117583931617c20396778fc57e0e54597119d1c967d6eed98372ec2b3a2bb8\";a:4:{s:10:\"expiration\";i:1563873948;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701148;}s:64:\"11427596cbbc861ade57836d7b94f7a9a1b887fb9223f43eed7c4bbd71c60e9c\";a:4:{s:10:\"expiration\";i:1563873949;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701149;}s:64:\"fd6d8f4c0d834de6214a768b68ea14bb3036dc27543b7e0a2a7dc2424f285094\";a:4:{s:10:\"expiration\";i:1563873949;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701149;}s:64:\"ec2ac6f25766d331f0e54cb79412d8aaa5780ff4a026421d6e0d8219760b36e6\";a:4:{s:10:\"expiration\";i:1563873976;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701176;}s:64:\"0afb03aa08384042349f1eaf55f17dd0a8575b38ba7895d964f9227d7a10696e\";a:4:{s:10:\"expiration\";i:1563873977;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701177;}s:64:\"d111f1025a93fabcc7886c10bcef0dd5053045cadb6cbb22ebfc62724041bdd6\";a:4:{s:10:\"expiration\";i:1563873978;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701178;}s:64:\"15830515b6011a348c2e0ccf8fa7fd390ffb28bbfd2c27e68105ca6d68155f6e\";a:4:{s:10:\"expiration\";i:1563873979;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701179;}s:64:\"396bb01459eb39cff6b6aeba9320d1db93458a3cbe724547c6714995a527b64a\";a:4:{s:10:\"expiration\";i:1563873979;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701179;}s:64:\"e5559fb1f5494cd242e60bb78e7e788bfd8180bc95ae383388e54724e6bfbc2e\";a:4:{s:10:\"expiration\";i:1563873980;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701180;}s:64:\"f951d0e506cbfb08f350e10239cf34c9020589e9056dc1715fef72eec7c089c1\";a:4:{s:10:\"expiration\";i:1563874245;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701445;}s:64:\"3c13f89cb44f7285d44f3f1b044f5c2be44c00af3d399723126ab3df2f04e46b\";a:4:{s:10:\"expiration\";i:1563874245;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701445;}s:64:\"8c6c8cdfaec343eedf5de12f3a54af6490a011bc7a73662ee0bf667773d0f666\";a:4:{s:10:\"expiration\";i:1563874245;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701445;}s:64:\"325dd0d261be59d5d03cd5833da2b5c42be2c059581ab91f1eadd9dc32beab0e\";a:4:{s:10:\"expiration\";i:1563874246;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701446;}s:64:\"2923096357b7435c0422e7005e34bc08c0a9038e11f069590088e34d464f7d3f\";a:4:{s:10:\"expiration\";i:1563874246;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701446;}s:64:\"6f7c966e47cb8820b85a03012b1cee0076b07c0dcea2e183d66c6f37efda8f5b\";a:4:{s:10:\"expiration\";i:1563874246;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701446;}s:64:\"5db90649aeca065f70304515f9d6a759d3d5f2e28a9635739a6d3a2022737256\";a:4:{s:10:\"expiration\";i:1563874259;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701459;}s:64:\"1d58bfe4e6679be746db9df30cc72778c2b9cd26f81494e2b3bf9ba21b6b6758\";a:4:{s:10:\"expiration\";i:1563874259;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701459;}s:64:\"390ee8879f8ec7e72549bcb2fb04d841a5adc260602c69f7c624a0c7ec089b76\";a:4:{s:10:\"expiration\";i:1563874260;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701460;}s:64:\"01f807773e57cf2aa9912588b54934bd9970430221e633dcd858b5ffe49e1529\";a:4:{s:10:\"expiration\";i:1563874260;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701460;}s:64:\"8a96177c7d0cae1bd25bca4e19c31138fbaa167122109c5651a0e801ee9c5c5a\";a:4:{s:10:\"expiration\";i:1563874260;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701460;}s:64:\"9eba94b9b9d1e33c5b3d52df99d83b15bd4ea224fe7a025ba34becef0d45baff\";a:4:{s:10:\"expiration\";i:1563874260;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701460;}s:64:\"008b48809d4c083842432b12dc15d466cc9ce31f5e6a297572c809a7c9148336\";a:4:{s:10:\"expiration\";i:1563874262;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701462;}s:64:\"c35af7cf88836bdacbc271f559b6bf8292170cbec2349f25819a00b0c26647e1\";a:4:{s:10:\"expiration\";i:1563874262;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701462;}s:64:\"9baf06ae4970a4ce1b40ee286143acf79be56abbdf4e6a8823c1a2e44a3d2465\";a:4:{s:10:\"expiration\";i:1563874262;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701462;}s:64:\"22c5f2f1f185f2a6f8c3c0f35c964165618349a715769c0b1456fb6f4ab41537\";a:4:{s:10:\"expiration\";i:1563874262;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701462;}s:64:\"204fbd012fc8372511e0e555711b75a82154e0aa21faca649b5b130ab7deaa08\";a:4:{s:10:\"expiration\";i:1563874262;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701462;}s:64:\"297ff12f0aacb2ca0efb1df1df5443bdae3716bc6aa5f98ba2a22b2a8546268b\";a:4:{s:10:\"expiration\";i:1563874262;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701462;}s:64:\"bf62f37c2edd0d2679ed2c7aac71cf56b335421076ac554ca5a014cc00f415c0\";a:4:{s:10:\"expiration\";i:1563874268;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701468;}s:64:\"08d42d738218aa1a9484fa20cb2175be27c07184c179ca874edd587091e72016\";a:4:{s:10:\"expiration\";i:1563874268;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701468;}s:64:\"56c6fb4790096e8082a69f503d4b47f031a404a135d3e22fa0987bed47637a87\";a:4:{s:10:\"expiration\";i:1563874268;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701468;}s:64:\"1c0f15092eba2782ba775735e173aac099b641333048303cd1224cc8d1a5091a\";a:4:{s:10:\"expiration\";i:1563874269;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701469;}s:64:\"61224c337ec380c87c141f8f5d7d192224c484cdd64abe0116a8cfa8a240b6bb\";a:4:{s:10:\"expiration\";i:1563874269;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701469;}s:64:\"f1a89140391e5a3be716d65eeaa7f14ba023a3677a7b2b08ec45ce279de419ed\";a:4:{s:10:\"expiration\";i:1563874269;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701469;}s:64:\"9988329d552f27a3a26f718b2bc8afa0d54d27f89e05ff1a5c41a87410acc333\";a:4:{s:10:\"expiration\";i:1563874500;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701700;}s:64:\"4b0f62cc55e88faba14d2a1951af439ed91bdb8b26bea6c19d80b58117fe49cf\";a:4:{s:10:\"expiration\";i:1563874500;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701700;}s:64:\"6e908282b4928644099d6545923507d5edbca6f1353b34e67fc6bdbd26b0a036\";a:4:{s:10:\"expiration\";i:1563874500;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701700;}s:64:\"cbee8d9dc89490a830594401db2787667213d293c867c74d8bf66fbf8f973f33\";a:4:{s:10:\"expiration\";i:1563874501;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701701;}s:64:\"30792baa0697b4080edf245e0a8c33187592e8a3b56c29d9c10858ee86f64ea0\";a:4:{s:10:\"expiration\";i:1563874501;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701701;}s:64:\"2d8522dba075ff0b765d60bba48b79720adc62f3db9c3cbcefeea1818049a5bc\";a:4:{s:10:\"expiration\";i:1563874501;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701701;}s:64:\"804bd2524b95b9343f2c01aa8ed4996b7e09d57a2f31ae4ac90320f68602d523\";a:4:{s:10:\"expiration\";i:1563874504;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701704;}s:64:\"817d1c2dab70b6058c3f063c2eeb2819ea317361112a28f64bc8996234ae74a2\";a:4:{s:10:\"expiration\";i:1563874504;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701704;}s:64:\"a08ad341f360b0201ea6123a20685059fb2b2f20fb0af9a67d8715101128b0ca\";a:4:{s:10:\"expiration\";i:1563874504;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701704;}s:64:\"dbb31475f8bf7bdd45c3d0f3e2ec6872e11c11fe886a9b0c24a746ca13b1280f\";a:4:{s:10:\"expiration\";i:1563874504;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701704;}s:64:\"8a92bc1f4470313829c4873c4d0a58f15fc8db8999281f976c7e4911a11d5df9\";a:4:{s:10:\"expiration\";i:1563874504;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701704;}s:64:\"6b801c4f028e05776b9d4e0fb63d0d8200f94915d2f3b228505634ab6c9dd2d2\";a:4:{s:10:\"expiration\";i:1563874504;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701704;}s:64:\"9b58c7150eba6122400d7bc84f5b10d6d90a8a99301740e4978258204c569087\";a:4:{s:10:\"expiration\";i:1563874533;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701733;}s:64:\"7734e46b8b9f7bc276c953d44759d46d3ad98b0c50be9e1bf6a8eee08c926919\";a:4:{s:10:\"expiration\";i:1563874533;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701733;}s:64:\"989d351df7db53d58df5463db3e5d35965452c1d4b98174b93ee081e34bd2146\";a:4:{s:10:\"expiration\";i:1563874533;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701733;}s:64:\"4832d760dc9a5c35df5371b2a5fb7846e442373b1a05448d67db66bd3a3e2623\";a:4:{s:10:\"expiration\";i:1563874534;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701734;}s:64:\"26cb03bc6157d93678e9c47ddb904cf17314cd1fb1b075d38bed7499a62b4a08\";a:4:{s:10:\"expiration\";i:1563874550;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701750;}s:64:\"f1d83e6deae58767f7bab9e2e9e718262889b3c9b9e732c972524ff2c318d847\";a:4:{s:10:\"expiration\";i:1563874550;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701750;}s:64:\"5ad54f0ab338b3240337373e8e80fa53604dbcbf25f6823a2e0ddd03f233c691\";a:4:{s:10:\"expiration\";i:1563874551;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701751;}s:64:\"fd61f5754b48e1a91a0148b3c8299cbab288badfd1789706094ccb5e5c6fe2ac\";a:4:{s:10:\"expiration\";i:1563874551;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701751;}s:64:\"763cdd26734a51484c03f19c89b23dedede7d7256007bda51bb867bf760e7a39\";a:4:{s:10:\"expiration\";i:1563874551;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701751;}s:64:\"a0a28215b8ba902105f3525944a47f65cdc7b5020da8fa778e2207849ef2c732\";a:4:{s:10:\"expiration\";i:1563874552;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701752;}s:64:\"40f477f9470d2ac732045fc25fa11050bb3539a897bc0886233870f7b3ce08d1\";a:4:{s:10:\"expiration\";i:1563874552;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701752;}s:64:\"40c9e35d1998f918c73e185633a6e8de360c22982f372e70bda065d68f402eaa\";a:4:{s:10:\"expiration\";i:1563874552;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701752;}s:64:\"a517348409f4ab4c2b9b1ce4254bac7d90276f5eb947961d845e2fbc07aa4796\";a:4:{s:10:\"expiration\";i:1563874552;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701752;}s:64:\"9d710bc156db6bb50c940c8aaa99a1ef3a20dfc7be758523bdebe5c6aa459210\";a:4:{s:10:\"expiration\";i:1563874553;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701753;}s:64:\"eb21dfcc808b561bf82e7ee0b78ae1e140fc5cb6682209338cf519691ce51edc\";a:4:{s:10:\"expiration\";i:1563874553;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701753;}s:64:\"3665e5b7d85cc00826b2ce1255ac43d494c7d3dff6f7872e0a4e5ade705c2741\";a:4:{s:10:\"expiration\";i:1563874557;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701757;}s:64:\"04c786fcaf6d0667b778afd374f09ce76ba8013603e29ccbe5d5a5b691c6e288\";a:4:{s:10:\"expiration\";i:1563874558;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701758;}s:64:\"dc805121862531357d7bedafc8aa8b1e7269d6f12f0343d6c9ac6b409a958b7d\";a:4:{s:10:\"expiration\";i:1563874569;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701769;}s:64:\"a0bfda0a7a4aaf2ae89a14d700ecc08e913135bbed78c74b9df9a577b5351564\";a:4:{s:10:\"expiration\";i:1563874569;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701769;}s:64:\"bb1b890adc7f65b1bb9a7c451d0796c8e05ff0080bc91eca467280488da6ec6a\";a:4:{s:10:\"expiration\";i:1563874570;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701770;}s:64:\"4a23c3c81638e08c3d5438011cc078fe3a03ddc1a9976ed54035ffde73c7d3b2\";a:4:{s:10:\"expiration\";i:1563874570;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701770;}s:64:\"70b94abb5ba5d904fde8ed1ef613e1451bf52cbf4aef0cf945f4a46e394ce156\";a:4:{s:10:\"expiration\";i:1563874570;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701770;}s:64:\"2c31f0d87f741329f49c2d318710a8f27fe82ec79f540e5b0e6412a404a91c9f\";a:4:{s:10:\"expiration\";i:1563874572;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701772;}s:64:\"40e2a4684ebedf0da15f64dbd4ffe561fbb7086a0f7b00b0a5347561814ef674\";a:4:{s:10:\"expiration\";i:1563874572;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701772;}s:64:\"3497fd1743f93c7dbd715669ca9c96fbf7ba2ceae717c00c96e07b27897f497c\";a:4:{s:10:\"expiration\";i:1563874572;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701772;}s:64:\"3ac898d6f8a32c90fd7f6ac854b7ff717f64294da5308084f473bb402b121c2b\";a:4:{s:10:\"expiration\";i:1563874573;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701773;}s:64:\"7f94c8bc55a9ef5613a0e7caa835bb4e16b5ac2fc66b5d03218dcea4589753a5\";a:4:{s:10:\"expiration\";i:1563874573;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701773;}s:64:\"f3c2b77ea08d2bb65b9be2b40b1a91077ab20d81dbb4dd6352793f730ab7fd9f\";a:4:{s:10:\"expiration\";i:1563874579;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701779;}s:64:\"801021b272f788af4b3e810d61b1731b253541df1354b713d7f07f4ed4e26b44\";a:4:{s:10:\"expiration\";i:1563874579;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701779;}s:64:\"3a218281c1fb298ffb1cef24dd6647ab3d948ee41fc3f9688172ff98208c5295\";a:4:{s:10:\"expiration\";i:1563874580;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701780;}s:64:\"f3482b7d89f1fdd0d33e17f61bde1a655ce2ad01f428c103dc2a85f3f2fbe3df\";a:4:{s:10:\"expiration\";i:1563874580;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701780;}s:64:\"d175370ef295a1d411960b8fb713783a4f394e0bf8d3055102cdba65c9b9e76e\";a:4:{s:10:\"expiration\";i:1563874581;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701781;}s:64:\"9fefc4083e1361ae9b13ca130395dcb7cdb7542f2dcb5ab434277e489c42fa49\";a:4:{s:10:\"expiration\";i:1563874581;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701781;}s:64:\"490ee54e7c7e613c243365cf4fd76c9b65e2e51803aaa881bab35e9dd16cf600\";a:4:{s:10:\"expiration\";i:1563874581;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701781;}s:64:\"101a01d58df9452950c3db5a3d82ca6e4752a34517ebb9e97641069eb3ed10e1\";a:4:{s:10:\"expiration\";i:1563874582;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701782;}s:64:\"ae9be854e2276a34cbc8df21abdee06420004cd3fd2c721573b5afa2c0083c41\";a:4:{s:10:\"expiration\";i:1563874582;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563701782;}s:64:\"cdfaadf57a38a5183c78de1604e21eae704e7df67c5c0f73bd2cb5d124ffa94a\";a:4:{s:10:\"expiration\";i:1563889002;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716202;}s:64:\"05864812fad656ae30f65a32e33ca286ef071b4cf7fee251a3a8b0aa8a927e4d\";a:4:{s:10:\"expiration\";i:1563889003;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716203;}s:64:\"387be80aedb2eb05bebc37cfa6c7c4257495d7ee3c6190421101f2866fea9268\";a:4:{s:10:\"expiration\";i:1563889003;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716203;}s:64:\"ed597819d53727ea1cdc7598a1eacfb49e2839390befa89702ffceadb21f8914\";a:4:{s:10:\"expiration\";i:1563889003;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716203;}s:64:\"85ee11ec515d3377fd416b54ce79c8c39f43a3539edeaab0f89d2b1e8eb62d31\";a:4:{s:10:\"expiration\";i:1563889008;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716208;}s:64:\"5491ba98f0d3d062f80c1c2b2046812fa93c6aa9e5146887677d32e1b9c70a8c\";a:4:{s:10:\"expiration\";i:1563889008;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716208;}s:64:\"354c065fb8d3b36438085e7f3af0ccbd359de6cddfb654ffe95a067893567b54\";a:4:{s:10:\"expiration\";i:1563889008;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716208;}s:64:\"bba4a4dd8e738266d548333a006a13dd92904a0c18dfe0e28e2f90eca275749b\";a:4:{s:10:\"expiration\";i:1563889009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716209;}s:64:\"40a07f90a341a9a66df5146c998aeba2d758feb381583b5ce9997c7bbc8f167e\";a:4:{s:10:\"expiration\";i:1563889009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716209;}s:64:\"7decb79a99829c4fa7185abb44b6ba356ae22780a8aae5fc217c91093e664c62\";a:4:{s:10:\"expiration\";i:1563889015;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716215;}s:64:\"1f7862d5fc7d83a45a2f418dfb68fa42aaf6f488b14f387701d16c9a222668bd\";a:4:{s:10:\"expiration\";i:1563889015;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716215;}s:64:\"b250da1a5cea4a8ae0a83abb7b11f0cf8d60e62010493b465af88e23b18567d7\";a:4:{s:10:\"expiration\";i:1563889015;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716215;}s:64:\"e712e853da515c31d907fbbdd1ef2d5528d99bbd9b2ee039ce1ee7b6221842b5\";a:4:{s:10:\"expiration\";i:1563889015;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716215;}s:64:\"da5ca62cb5df1a9f2cac42052c774f3fa2243d864d476d62299f8a0f1c0384f9\";a:4:{s:10:\"expiration\";i:1563889017;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716217;}s:64:\"9234b992965a673bae50a24c054a70ee0191ec53d63df1969df7c035a8c20853\";a:4:{s:10:\"expiration\";i:1563889017;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716217;}s:64:\"9863d6d1dfe82b1e92a9f47a4d0481f4b28440983ecdb4148aad2401016d5104\";a:4:{s:10:\"expiration\";i:1563889017;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716217;}s:64:\"159ab85a8782275f9f2dc88712da9019a2dece995c75f1855a96593f7071aae6\";a:4:{s:10:\"expiration\";i:1563889017;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716217;}s:64:\"8007ddc389bc8eb144ddedc26d496f7b4c6c55af5b30c1d115db6afe38381798\";a:4:{s:10:\"expiration\";i:1563889017;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716217;}s:64:\"9ad0c077eb23d1a331509ac963d2d8db0bbb4cae7a46248d2675f042180ab294\";a:4:{s:10:\"expiration\";i:1563889017;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716217;}s:64:\"4af87adf54dc391c8d0816462251b00c040e1e6ed2843958cf8b2155da9be327\";a:4:{s:10:\"expiration\";i:1563889017;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563716217;}s:64:\"985ec28f4511b1f895b6d40a6de72317a47d95ba5e43675b0982422105b45460\";a:4:{s:10:\"expiration\";i:1563890513;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563717713;}s:64:\"9ce9b7a75a7108ba933f17ca6461fd8fdecefb647435ade5b4da8421b7e9a739\";a:4:{s:10:\"expiration\";i:1563890522;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563717722;}s:64:\"f7785aeb5a4392eac8b56e1fe699de2d3dd4f6f5e1fae3e3e3e66b00f06a5c43\";a:4:{s:10:\"expiration\";i:1563890525;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563717725;}s:64:\"baea9b226b6270d8bb6dcffa9e5b8b3699e653b100f9b7a492a81c91fda98bdf\";a:4:{s:10:\"expiration\";i:1563890770;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563717970;}s:64:\"e527f22410b3bac5e66b2d216031d97595b3d301cbe6061da6f2c9a79a9375b6\";a:4:{s:10:\"expiration\";i:1563890770;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:37:\"WordPress/5.2.2; http://gpporgs.local\";s:5:\"login\";i:1563717970;}s:64:\"4ecfa2b9a79c7ebb705872ed38705eb3ac1b02cf80a1d4ec94de1f5c34a2fc3d\";a:4:{s:10:\"expiration\";i:1563890783;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563717983;}s:64:\"5e1648f2e28a08f484a5d91aa509d70437878f4d920b4d122eef5d666c38e6e1\";a:4:{s:10:\"expiration\";i:1563890797;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563717997;}s:64:\"4362a0b0a707bf12734224afffc72cf4bcc9c7f82e6ee8831b5f982d9c9c04cb\";a:4:{s:10:\"expiration\";i:1563890899;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718099;}s:64:\"6b9c417a274cd9876faed95b15399a843dc43962559a4a91b2ac93760ba39285\";a:4:{s:10:\"expiration\";i:1563890899;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718099;}s:64:\"17640a9627032023f51a1a0bdf2d78c6ac50d19804d7e7b3b328c75b38737597\";a:4:{s:10:\"expiration\";i:1563890899;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718099;}s:64:\"b95ab84f0baf1730286b9d65c683e1f79aa7b494c6007ae0ddd053d659ccbed0\";a:4:{s:10:\"expiration\";i:1563890900;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718100;}s:64:\"1915eec6352646037cc9453612fac8ccc11341f6cc4032963d84e2e50e183272\";a:4:{s:10:\"expiration\";i:1563890910;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718110;}s:64:\"2f1d5ff1abcd106cdb78ef2a715dfd715863a5cee4ad454b650fb03dc2c22028\";a:4:{s:10:\"expiration\";i:1563890914;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718114;}s:64:\"7fd152abc9f94994e007431abb251169103512dfdc5385d923fb524d8cbbbdaf\";a:4:{s:10:\"expiration\";i:1563891009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718209;}s:64:\"1fe8cb6afd4a3ee331d9fa112d4b80cddd15632a23f0d6d189615921bdc8be69\";a:4:{s:10:\"expiration\";i:1563891009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718209;}s:64:\"37a87fb17b32428d0c94b2d3aa90eb9916c917556abb9090956c216cf2c3eeac\";a:4:{s:10:\"expiration\";i:1563891010;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718210;}s:64:\"3b500e951c56c69aa464588d07b0ff5d965d8c09ce202c021c1df5ce7d53c812\";a:4:{s:10:\"expiration\";i:1563891010;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718210;}s:64:\"a78151df0d038245e30ad3e630233145173935e2527772359761e5c86ec72709\";a:4:{s:10:\"expiration\";i:1563891019;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718219;}s:64:\"5c8e871686af1df3d92b20b828054917235ec783ea33fbe78fff86356f718d54\";a:4:{s:10:\"expiration\";i:1563891019;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718219;}s:64:\"2a4647328f0a3c6f2583d6ae4497a83185cf6cfcb557b70924f29beca9f88496\";a:4:{s:10:\"expiration\";i:1563891019;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718219;}s:64:\"0bbd9326e66cfa4c79cf7eeb57109d09334e62e445b93a815b24d0794a81723b\";a:4:{s:10:\"expiration\";i:1563891019;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718219;}s:64:\"aac1e2e6c76194f8f842ea9986f857ec249901e7d1cc1c421c124dca01953ad2\";a:4:{s:10:\"expiration\";i:1563891047;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718247;}s:64:\"6f091d8fd306b6eabbb7058a9a91a122b0c6ae4cec350a6676f485e4d87b0adf\";a:4:{s:10:\"expiration\";i:1563891047;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718247;}s:64:\"2100b3f03a3d1fa0896eba93b96017ff45cfd69c64fc4a175fe34dc65b87a5f0\";a:4:{s:10:\"expiration\";i:1563891047;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718247;}s:64:\"f810e1df2c24a92dfad1183d1596b0dc5c96f14e163caae1377fdb283460beb6\";a:4:{s:10:\"expiration\";i:1563891047;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718247;}s:64:\"3886ab454b46de3e8e2b36bf5afac56a17c067263b61fead092a7f0ed20697f9\";a:4:{s:10:\"expiration\";i:1563891051;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718251;}s:64:\"7d4f481d51ef9844e306e380d9292988a9ce511b564f81d13198ac30b6394b8b\";a:4:{s:10:\"expiration\";i:1563891052;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718252;}s:64:\"c8180146d5fcc0dd5f9acc4bd29a7b23e0f8c25785b0a3569ff22934e14a69f9\";a:4:{s:10:\"expiration\";i:1563891344;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718544;}s:64:\"de371e876951ccd1edf99da580901bff723bb721129fad287d3e7f8445a87330\";a:4:{s:10:\"expiration\";i:1563891344;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718544;}s:64:\"872489fd87dd593983cccac4f5275098a2c19619c98f9dd3c0b680874f16f74d\";a:4:{s:10:\"expiration\";i:1563891345;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718545;}s:64:\"0e64d6ab561575c2d58b57e6caaaecebecb334b068dbd7e398f799618fa3cb15\";a:4:{s:10:\"expiration\";i:1563891345;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718545;}s:64:\"aadc7364c4a4c78a8784f4ce19932a7aa415e19edd79667f20936503150a8bc3\";a:4:{s:10:\"expiration\";i:1563891348;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718548;}s:64:\"9d8e42263e1ee4d366574f00d85e05c809c8c3ec6619469993268c8ef9370935\";a:4:{s:10:\"expiration\";i:1563891348;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718548;}s:64:\"bbf24391a8cf481a3cb543a89ea11743d68f8a2838f8e2c22a6169f306fe4b27\";a:4:{s:10:\"expiration\";i:1563891348;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718548;}s:64:\"6a7d196316a6b22b78629aef94b0a74d3caa0a18a4ce61788f26497c7a05f83b\";a:4:{s:10:\"expiration\";i:1563891348;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718548;}s:64:\"091174ac1f899c9fb1355d951fa486376bab990caf8ca46a5d3d81e90f5ec7e8\";a:4:{s:10:\"expiration\";i:1563891351;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718551;}s:64:\"b7881d0f3e1fba060bb7686ca46a2b43e0bd4d595ad5e227575f734d513da8f2\";a:4:{s:10:\"expiration\";i:1563891351;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718551;}s:64:\"6245ace834f084bb877c77fc0baeb46fd4656de576b920d1a6b2b20ed99b24ce\";a:4:{s:10:\"expiration\";i:1563891351;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718551;}s:64:\"eee16aa6e8f14807105af27bfe0628a8002521653ef1758813256deb1d83a81c\";a:4:{s:10:\"expiration\";i:1563891351;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718551;}s:64:\"9097f71406edfd7ad271bc9ec9aacd927e49bee8b70d62935c644938bc3954d5\";a:4:{s:10:\"expiration\";i:1563891351;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718551;}s:64:\"d711337f416096d1f1f35fefc1a520dc5eeb028ce8d26f017f86b7865f941862\";a:4:{s:10:\"expiration\";i:1563891362;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718562;}s:64:\"bfb18fb674bdba33e4b4d248135b387d40f97882dddfdd004587b1ee4c9975e0\";a:4:{s:10:\"expiration\";i:1563891362;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718562;}s:64:\"c578503210855e98ba917dd91fdd5aac1ab9190c64cae44c653dd45c7c340b11\";a:4:{s:10:\"expiration\";i:1563891362;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718562;}s:64:\"e0db1c967de7cc4bc032a865f55a0585ff526e13ed53b21288fb9a28572ac031\";a:4:{s:10:\"expiration\";i:1563891363;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718563;}s:64:\"68f4dbf95b504ee9b1390081210e407f7cc85aa04caa93cd84236e2e74ce7845\";a:4:{s:10:\"expiration\";i:1563891363;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718563;}s:64:\"ac862d39c429f2a957631b28aeb426827102ba1e7fee5e7ee3da9949c33ab143\";a:4:{s:10:\"expiration\";i:1563891372;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718572;}s:64:\"7566b1311013eb4753ef060f735304a19bfe1a17c4a4f80599446a1d6a5cf3f0\";a:4:{s:10:\"expiration\";i:1563891372;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718572;}s:64:\"112e92960c7cd62a150de0804c36d8d9ee2182fb8e2ba2dcf3a56e613000415b\";a:4:{s:10:\"expiration\";i:1563891372;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718572;}s:64:\"88aaab6a5a04c3d1752ac1b4c962237df8c457c04b00ee92be60984b1b31be52\";a:4:{s:10:\"expiration\";i:1563891372;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718572;}s:64:\"7ff5199b7a035605143e05d5efc89e6d6284e06cb73fee0946a863f4eb425348\";a:4:{s:10:\"expiration\";i:1563891372;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718572;}s:64:\"81542f0bf45a0b5f789ac3b60eff647dcf96b1ce118b6c4cf68f83036cb016b3\";a:4:{s:10:\"expiration\";i:1563891378;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718578;}s:64:\"e9a4f0f4d46857ac11cd5248adb90167aa97fbc8abe713b99e6767903ad184db\";a:4:{s:10:\"expiration\";i:1563891378;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718578;}s:64:\"b2ec84fd2faa5a1bd7cdf9557b3e292f2f70984c775d86ce34842ade4bab2679\";a:4:{s:10:\"expiration\";i:1563891378;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718578;}s:64:\"2eb0b38a6d061eaad44ea90d977d14b11673ea1527c72c58daf3514132b4833c\";a:4:{s:10:\"expiration\";i:1563891378;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718578;}s:64:\"cff0718f2898555aecf339ea964dc436b19ecf2127acf2fd7a7501106539cc7b\";a:4:{s:10:\"expiration\";i:1563891379;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718579;}s:64:\"f19360b40bd1333d8a29518b2c5033949bc335c10f3666665b787ac8aecf2c40\";a:4:{s:10:\"expiration\";i:1563891381;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718581;}s:64:\"dc187d840bb74b4634574ca281cc9bdb5583adbbbdc23179b459a1477749fdb6\";a:4:{s:10:\"expiration\";i:1563891381;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718581;}s:64:\"109feb5cd7895874cb858abd4a623c992bda72e2e07e1596e37e6b67b91abe93\";a:4:{s:10:\"expiration\";i:1563891382;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718582;}s:64:\"a2cb53a6da5816f2d3cda78c71dfe857e66fb3dd8e232f85e94ad29403ad2559\";a:4:{s:10:\"expiration\";i:1563891382;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718582;}s:64:\"f05ecc4b62266e4e95f83753a098b42ce4c4df1cc49ee9641b45260af4e5fb6a\";a:4:{s:10:\"expiration\";i:1563891382;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718582;}s:64:\"bd4ec1b30244b3cad57efc910cd1e15c6e05eb84901b5dc551609dad7836ec41\";a:4:{s:10:\"expiration\";i:1563891386;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718586;}s:64:\"9f75e54750bd994a12a29bc83ae752e64d96088c761be7f3a58e8bbf2f8fad90\";a:4:{s:10:\"expiration\";i:1563891386;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718586;}s:64:\"7e18ab90d1966eff8b830fd5bd05838e8328b379a65d50eb147d5f2696f7ded7\";a:4:{s:10:\"expiration\";i:1563891386;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718586;}s:64:\"debd6943fd1f92e20367bd07c69e337d7a7e36e493815e36f38dca16ce257149\";a:4:{s:10:\"expiration\";i:1563891386;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718586;}s:64:\"a348a93c2920f14710ba809638bc3258ad94c369d351e9b631af590c1e47c9a6\";a:4:{s:10:\"expiration\";i:1563891386;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718586;}s:64:\"1eddaada50f06340dcdb92c2dc0ce703c235219a2f7565bd4b078a391a026dfc\";a:4:{s:10:\"expiration\";i:1563891395;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718595;}s:64:\"76394b3c377e4a70a3c85e179c171d70374041ed6eb43b153dbcbf3c7b6f5800\";a:4:{s:10:\"expiration\";i:1563891395;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718595;}s:64:\"8fce02bfb7fcc74a31ec82aeb1982384ca3664f3c55b508004c252edd309d0bd\";a:4:{s:10:\"expiration\";i:1563891395;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718595;}s:64:\"d582107dfc6a9df3a213bb447c476498887dc38bda4313735ec313b9ccc9081b\";a:4:{s:10:\"expiration\";i:1563891395;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718595;}s:64:\"9dd8e08894ff134bbddc57a9b37644661b3b8b601b8fc5a0ad0467dead8ec962\";a:4:{s:10:\"expiration\";i:1563891395;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718595;}s:64:\"6ba4e731a9e1020cd5711f5f160a90985c34a78b19943cd918ed93499a859362\";a:4:{s:10:\"expiration\";i:1563891398;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718598;}s:64:\"26073a17396c68830ea77147d3857c7070d7354311c5f239a8ceec200853f4f5\";a:4:{s:10:\"expiration\";i:1563891398;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718598;}s:64:\"f24f098445025e69a5c52acc89bafffa2d68106a7c39cf4900c4e3e259b6a79c\";a:4:{s:10:\"expiration\";i:1563891398;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718598;}s:64:\"c2ff36467bde0880675cf37b2be7deb2463223992fd214c33684d461bb911a68\";a:4:{s:10:\"expiration\";i:1563891398;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718598;}s:64:\"7eb0a23e3fcac351a21f7d9ce7e0998c4c1a30f77b788aeef07a30eb2d8f609a\";a:4:{s:10:\"expiration\";i:1563891398;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718598;}s:64:\"13f603f1a6ffb30707fa72d9672ffe516525a554634b717d6a7f1244c7be3849\";a:4:{s:10:\"expiration\";i:1563891403;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718603;}s:64:\"b0fbc09275c4e8da4309bb55b25d470ef5cf7212c8f3d53e18d3270c7e2bfda3\";a:4:{s:10:\"expiration\";i:1563891403;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718603;}s:64:\"9f4ff56e25513b70733762cbf629bbadb8e1318bc80e2aefbcfc078420390012\";a:4:{s:10:\"expiration\";i:1563891403;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718603;}s:64:\"144a6ea5b4c65df31c30bbc0867ac9c057eb23012dca5b8c465a446a9b45ccbb\";a:4:{s:10:\"expiration\";i:1563891403;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718603;}s:64:\"f0b889ccd51ee73d844ff292be2229643ef53a344addc1f95be0e32ca8fd82e3\";a:4:{s:10:\"expiration\";i:1563891403;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718603;}s:64:\"2d5ab5fd61775950c6282ab1359bb0745f11622baf0da6b8c04f7f7912dbc697\";a:4:{s:10:\"expiration\";i:1563891412;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718612;}s:64:\"0be2a6969d3073537fef4ae4c883a4865ef9edb1a6fdbf56a20d1324f2e43293\";a:4:{s:10:\"expiration\";i:1563891413;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718613;}s:64:\"b7943e50cd45c730e2084f9decc5f8a0294e8e4d5a3ccdc9990634282c448470\";a:4:{s:10:\"expiration\";i:1563891414;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718614;}s:64:\"983e7877d558271785f46f1bd53e2e39f274f12aa39f97ced00eb972509decce\";a:4:{s:10:\"expiration\";i:1563891414;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718614;}s:64:\"b04b5c095411a76439fc0d743ffc84c801fb4231c9640d281f37932908c61088\";a:4:{s:10:\"expiration\";i:1563891415;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718615;}s:64:\"fd56d520656d137b57017bdfe1b578f96b624d25113dc15f9f2b58fcfeea2e4b\";a:4:{s:10:\"expiration\";i:1563891416;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718616;}s:64:\"85971aed1ca63cad73c5dce15700bfb8e20ca1251554369418ceb9dcfdcc59b4\";a:4:{s:10:\"expiration\";i:1563891417;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718617;}s:64:\"69d08176063993ce3c976a8bb271ac7e8ce879eec3d132083f2f519e3cdeece2\";a:4:{s:10:\"expiration\";i:1563891418;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718618;}s:64:\"0c797cfe26dd923533084d1d113010b88f7d7cf3d5f3956b3403f1edaa65edda\";a:4:{s:10:\"expiration\";i:1563891420;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718620;}s:64:\"b97c365cdcaa6d7be00482401e75876a5b7e60409be86153d01fe22cf9abd81a\";a:4:{s:10:\"expiration\";i:1563891430;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718630;}s:64:\"d9dd7c276eadb88c536e066571f5e7cea4723625123c3cdfa93d625a32a75858\";a:4:{s:10:\"expiration\";i:1563891430;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718630;}s:64:\"f299b5d54ce237897c06ca5315c1a5aade5190998894e4d8fd07c43374da2b8a\";a:4:{s:10:\"expiration\";i:1563891430;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718630;}s:64:\"dba6767a52b5b68dc762aa2844b8754ddd593fa168e20d72a56973b3c97c2e02\";a:4:{s:10:\"expiration\";i:1563891430;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718630;}s:64:\"0499c242172e5b7225576ae03de121481517ad8e99c72f86c2287e354457cc92\";a:4:{s:10:\"expiration\";i:1563891431;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718631;}s:64:\"b066c72283891e8c161576e32d251ffd292de186ae5021b01f9d51f71d71e07f\";a:4:{s:10:\"expiration\";i:1563891573;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718773;}s:64:\"f0d65cce135df509da7defcba9ff33c492f680c0a5eb2196494d3368ae5e8ef9\";a:4:{s:10:\"expiration\";i:1563891573;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718773;}s:64:\"af4b29539cdec0e040fb281621c6f7327caa526daedf7a68baf96f10b7f8f6a7\";a:4:{s:10:\"expiration\";i:1563891574;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718774;}s:64:\"db308886844999b5336bb0d0568533ef02e9a050b458393f8f0d9249350daf68\";a:4:{s:10:\"expiration\";i:1563891574;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718774;}s:64:\"5479ecab533ec11261093ad3bbbff532a9eba6ee137a081293ce93107de6d543\";a:4:{s:10:\"expiration\";i:1563891574;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718774;}s:64:\"e2a8ffa33bdf6d2c8627993732af3ada59dadf51c55d81216576ebb17871fc8b\";a:4:{s:10:\"expiration\";i:1563891574;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718774;}s:64:\"9b42d97a0b9263bedf5408663e03c5f24dac18cbbf275989acb42318500a0836\";a:4:{s:10:\"expiration\";i:1563891578;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718778;}s:64:\"3c8389c81fd26fb5e5debc7beecf33f77876cf6785d3a13aad032aefb31a0cab\";a:4:{s:10:\"expiration\";i:1563891578;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718778;}s:64:\"9221580da7d36497c89eb2f341231635974a68d3c94e4f99a87a495317bf505a\";a:4:{s:10:\"expiration\";i:1563891578;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718778;}s:64:\"67e8c314486b667d5babd2ade83baa52a668da9d452939056c4c887d1afc423e\";a:4:{s:10:\"expiration\";i:1563891578;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718778;}s:64:\"84be50efb0e1891038fdc98e709aacda92b8dcbe309a7b34e531d5eb51097951\";a:4:{s:10:\"expiration\";i:1563891578;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718778;}s:64:\"2f9335d44f2495450261f3277dc5ff2801b0b61903c064100af26e9d21f0d4f0\";a:4:{s:10:\"expiration\";i:1563891653;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718853;}s:64:\"cf7fe769e863b77f407b34ca307bec6327a5239eb22eac7a52e86981177a8355\";a:4:{s:10:\"expiration\";i:1563891653;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718853;}s:64:\"3e5b8186847de82a6ce98d56d9e533e13ac46221bdd7a9543fc769d2fcbf3555\";a:4:{s:10:\"expiration\";i:1563891654;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718854;}s:64:\"88608a87189e1bc0c25fca99cf216246cf6a9d8487680fef9886790f1d2bbefe\";a:4:{s:10:\"expiration\";i:1563891654;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718854;}s:64:\"36d7fd618c4cdca3ad586fd142d10722f95afea59c5ef3454afa19b2fa7948fc\";a:4:{s:10:\"expiration\";i:1563891654;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563718854;}s:64:\"3c50d1a039c75a29fe53e7878af127454c70f2378e03a817257dd1dfbb7b0d45\";a:4:{s:10:\"expiration\";i:1563892525;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719725;}s:64:\"9a2fa47141d4640cc87148ceb20149e9a7de04c07c929a669f0acc7821b7d33d\";a:4:{s:10:\"expiration\";i:1563892525;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719725;}s:64:\"b31a4aac866c1a4f4b2f621f1a2c349d6995b567a3a7f6f23c0179a92e2a37ba\";a:4:{s:10:\"expiration\";i:1563892526;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719726;}s:64:\"d7e65fa3a45ca63899e6aaa35c8e8a0ce62b6255d1332805636c91bd05c9d609\";a:4:{s:10:\"expiration\";i:1563892526;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719726;}s:64:\"34a3dbc9bfe2ece8e2764be316edc5cc86a2c8810ce4598648568664ca1b3d98\";a:4:{s:10:\"expiration\";i:1563892577;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719777;}s:64:\"74a21de3570794274dfa9b1a0122e4534d9949b54840d3d9b6c1b8dd82e1c3f3\";a:4:{s:10:\"expiration\";i:1563892577;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719777;}s:64:\"4bac47b6e3b2259ace96587cc49fe6641f77374684e74820a4b5d7b2bafc4cc1\";a:4:{s:10:\"expiration\";i:1563892577;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719777;}s:64:\"af8f1c142449339fb52510efed304df1a55e316cef96106f349528501e88b288\";a:4:{s:10:\"expiration\";i:1563892577;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719777;}s:64:\"a4889317e22fb098931c4e5d9b1f10a1ff1ecd79de76f904db1bd23c0f1273d3\";a:4:{s:10:\"expiration\";i:1563892577;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719777;}s:64:\"5247393757523c8b99c4c95fb19201a43eb4b84f17c5562f380e0b5cf15c1a34\";a:4:{s:10:\"expiration\";i:1563892640;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719840;}s:64:\"ed1fd78e1e823d02ee24e8a5363003882a4e310c24c851a3d56865fe0e52e0fb\";a:4:{s:10:\"expiration\";i:1563892640;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719840;}s:64:\"7d96ee0a7f6dbd2193f1edddea26b45e14b202e5897775fcbe1c80ccee5f3acc\";a:4:{s:10:\"expiration\";i:1563892641;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719841;}s:64:\"e10efc169c73c24aa78b6e7ba7fa663cb8aa52804bfe90540d603d04b2a95b7a\";a:4:{s:10:\"expiration\";i:1563892641;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719841;}s:64:\"b7f7135fe87dbc9ad369672a0b962746313fd8bdc31e40fc66b270ee699e31d0\";a:4:{s:10:\"expiration\";i:1563892684;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719884;}s:64:\"341c6c30a9ba1d4226d35a6a475fd2f823ec1ab3a74805e54fe5feb04994896f\";a:4:{s:10:\"expiration\";i:1563892684;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719884;}s:64:\"59e4e8986edbc8a47eb2e2aaa2edb64eb9d2e2c52c2c15dc43cdc99984e3832a\";a:4:{s:10:\"expiration\";i:1563892684;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719884;}s:64:\"da95ec2cd3e3f356b43ecabc567827865f1a14a567a81ed7fd74f6e6a08aae66\";a:4:{s:10:\"expiration\";i:1563892685;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719885;}s:64:\"af0c123fafb3bc3f49ba6d2019d0adbbe8845e7317e235e19eeb3cc91e60bd88\";a:4:{s:10:\"expiration\";i:1563892685;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719885;}s:64:\"b4782b6be1d19cb31be4161ed6db60567b0ff482555a619f6d5faea7bc950096\";a:4:{s:10:\"expiration\";i:1563892687;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719887;}s:64:\"e590d0fb20e309086fe6b0519160975ba2d4cef4a402b84a48b11846c8bffed8\";a:4:{s:10:\"expiration\";i:1563892687;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719887;}s:64:\"2b1aab6fb797635bddbe5c29deeeaa3e68901a732601d131edb8db9a6f9c4ab4\";a:4:{s:10:\"expiration\";i:1563892687;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719887;}s:64:\"5d1e6e6df3c45824112e4f9f840e5cf781d7dfe90c972886dc3ab1e014f1a657\";a:4:{s:10:\"expiration\";i:1563892687;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719887;}s:64:\"6811dc5ca5980a6862d02f62a25f2fae1bcf742cfcac9d8a35864d99747332b4\";a:4:{s:10:\"expiration\";i:1563892692;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719892;}s:64:\"66aac4667fdc063bdf3bf0831a2b0fd6119ff48d3e2ddc4f68d3f47d2c9b6cc8\";a:4:{s:10:\"expiration\";i:1563892692;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719892;}s:64:\"fed7ee33852d1a5da4b805c2f2eecf0cb41b84249dc4df88a2ada663addd3afa\";a:4:{s:10:\"expiration\";i:1563892692;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719892;}s:64:\"41cd649bc9cb53daefd5e7a2fe3165c4a84b3ead89d4cf7415b5899a881b184a\";a:4:{s:10:\"expiration\";i:1563892692;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719892;}s:64:\"68566a5ed9f8d032d6a084f03e8624fc8bca7c5cd1131cfdd5f1ecf4bb1aea9c\";a:4:{s:10:\"expiration\";i:1563892694;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719894;}s:64:\"13a4a7c3c970e1b59f6cd691921160ee078412e220e1e1a249e781080bb8de9a\";a:4:{s:10:\"expiration\";i:1563892695;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719895;}s:64:\"7ec0a351d3dbe035d6632b548d59c6dd615d4c656506be8961672c6c8dc69a03\";a:4:{s:10:\"expiration\";i:1563892696;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719896;}s:64:\"09c6ffbe86419e3ea107de2bb7bc92a5ede9a6507b9a00c8996477b02f6dd833\";a:4:{s:10:\"expiration\";i:1563892700;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719900;}s:64:\"806e33937e8321138bf11dfa014696fb38e62b7b98fd4fbdde83f834aaebff2a\";a:4:{s:10:\"expiration\";i:1563892700;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719900;}s:64:\"806636aa4256086324ff15827d74330f80d7a711f4055381cb6b30bac9a1b229\";a:4:{s:10:\"expiration\";i:1563892701;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563719901;}s:64:\"5b2f00cbd1702a9f065c6c52b64440709ec544f7eafdf92b917d86803b67f575\";a:4:{s:10:\"expiration\";i:1563894417;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:37:\"WordPress/5.2.2; http://gpporgs.local\";s:5:\"login\";i:1563721617;}s:64:\"5f87e1077f64618adc844368e45bd8d47936ed3b50f79598cba2648a797653cb\";a:4:{s:10:\"expiration\";i:1563897865;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725065;}s:64:\"767ea5807a8740f68f6b966dac813872fc988d1a20130307bc1dcac8b850b44f\";a:4:{s:10:\"expiration\";i:1563897865;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725065;}s:64:\"9e2c2334c9e6a0325e60b997ef06f1d263f3f3e0e83b36b15717c9c6ec167462\";a:4:{s:10:\"expiration\";i:1563897865;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725065;}s:64:\"3a517538c79bd636df397d5ab2c0a9404337495d6bbb49c512cc0f23e2a0efd8\";a:4:{s:10:\"expiration\";i:1563897865;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725065;}s:64:\"f452c44c96704ef4eac41bf4f9f10e01776a7185be1dca7e04c452bdf5b50866\";a:4:{s:10:\"expiration\";i:1563897865;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725065;}s:64:\"9c5ccf9e92431cef8592347110807774d4137455a6a7d6a0e2cbd716aacd7ae8\";a:4:{s:10:\"expiration\";i:1563898009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725209;}s:64:\"3e1321d542e6838e4ef950ecbc27d08bde8d9d3ba9c2d68862b7ccfebb4c0592\";a:4:{s:10:\"expiration\";i:1563898009;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725209;}s:64:\"23b87c062987c1b42979d940cfc7f9071642498a9228b45875dc2d0a2e9d2846\";a:4:{s:10:\"expiration\";i:1563898010;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725210;}s:64:\"c6dc4ecdce2dfe81374737321881b997a32380b9cc3947340ec7badb25a15610\";a:4:{s:10:\"expiration\";i:1563898010;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725210;}s:64:\"06378a37314036f05e4b5c24a633642617cdaea94ce5486b0ecfa1e4311d5c12\";a:4:{s:10:\"expiration\";i:1563898010;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725210;}s:64:\"d16b7c8318be41f44e109019b2e023e0949d743c482d332bf1b1424585ae6796\";a:4:{s:10:\"expiration\";i:1563898042;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725242;}s:64:\"a2069f032c792bf44c794fc7e134e1a234861015fa14f75eef7e85054242f5aa\";a:4:{s:10:\"expiration\";i:1563898042;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725242;}s:64:\"d83b39ef131ab604b691f04c49a239f4ee53ed26489ba486469f479215297285\";a:4:{s:10:\"expiration\";i:1563898043;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725243;}s:64:\"c9ac94c2dd4be914e49b44c0f87afb0ca17226768df0249fb441e96a5cc3110b\";a:4:{s:10:\"expiration\";i:1563898043;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725243;}s:64:\"a94f0e94530929fa79f3aa9285073af696e51ee444c3199999f407ff2f8a7752\";a:4:{s:10:\"expiration\";i:1563898043;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725243;}s:64:\"30cf2dc213840534924857ae1f594560e0dc164cd6821770504d95d268f9af3f\";a:4:{s:10:\"expiration\";i:1563898043;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725243;}s:64:\"4aebe9bb66491e703dc2836ac006501fd57ffd5c92392e4caf714b48c72913db\";a:4:{s:10:\"expiration\";i:1563898043;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725243;}s:64:\"ffd5223f70e1cfd55d376172f54cea614d84c1c2e9f59059df555fc16eda3c4d\";a:4:{s:10:\"expiration\";i:1563898044;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725244;}s:64:\"0f29c15370a432c32221ecc391cb0fc84074c070158623aad67e64ebbaa72ff7\";a:4:{s:10:\"expiration\";i:1563898044;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725244;}s:64:\"367dadc828f288c37c4c580a20ab0aed136a37b17e5fc55348fb383cd26e9db7\";a:4:{s:10:\"expiration\";i:1563898044;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725244;}s:64:\"1856c3b42313ee58bb721d4edc755e7108932a7ee44d5b77d4cf0f072812fb1d\";a:4:{s:10:\"expiration\";i:1563898047;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725247;}s:64:\"7d1142a6f1d7756b8cff56682a5fe17d3958686bbf9013192433bf07359ed897\";a:4:{s:10:\"expiration\";i:1563898047;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725247;}s:64:\"b0c94a985a3121e63ffa1987b198e5f2ac6ef83d81bb35ec9c95cf85742cf17e\";a:4:{s:10:\"expiration\";i:1563898047;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725247;}s:64:\"fa772de13fe9050d3bdb42e81a21e9134f20b4c9abe96bed3c77a1a3d06599fb\";a:4:{s:10:\"expiration\";i:1563898047;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725247;}s:64:\"b5189e9cd8ee907deaac002dad312ad734b08add988c2c422da064c0fc89fed2\";a:4:{s:10:\"expiration\";i:1563898055;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725255;}s:64:\"1e4d2510a8271bc4f20dad3a95efbeecfcdd115460ce1097d720f3cc0e47a286\";a:4:{s:10:\"expiration\";i:1563898057;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725257;}s:64:\"38672e1a7a0f85804569853286659ab6c31c915ee92611a05fbfdc53fe95b5b7\";a:4:{s:10:\"expiration\";i:1563898063;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725263;}s:64:\"e79414f9b22ee200ebcd7bd2ea1f7f64f2c8e5268d3ce96efc8939be0e4bb2ea\";a:4:{s:10:\"expiration\";i:1563898063;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725263;}s:64:\"9f4a07e4721f8a9763cd1e3d72565d81d41351c1b58b1a073ae129f58250d560\";a:4:{s:10:\"expiration\";i:1563898064;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725264;}s:64:\"141826f9cfff73cb364898f2049db4a987fc2856cf73c5de69812e4f1cb31f42\";a:4:{s:10:\"expiration\";i:1563898064;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725264;}s:64:\"d38506829c577fea6eb70b02a731876a5fee794f5f694e4dbcf53334f7849113\";a:4:{s:10:\"expiration\";i:1563898066;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725266;}s:64:\"15fc10220dda83788639ac15ee92f2405b3a746319aa64b41c68085e4b932ca1\";a:4:{s:10:\"expiration\";i:1563898066;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725266;}s:64:\"d0ffad899f952900074860bec45f7619db17ffb55b620fd00ce02c2ea3ecdbf5\";a:4:{s:10:\"expiration\";i:1563898067;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725267;}s:64:\"e950169b486ccb82685c2d4fae6e6976b8723bac3bccce38452f7d75e2feb97c\";a:4:{s:10:\"expiration\";i:1563898067;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725267;}s:64:\"92810d1f353b3217b3e66d16fe16872de89b0b1b3678221caa4fcf9b906f9642\";a:4:{s:10:\"expiration\";i:1563898155;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725355;}s:64:\"a0c638a2e40eef7d5cffb6d7574011568285373c9a71aaeea76d9ac08026efa6\";a:4:{s:10:\"expiration\";i:1563898155;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725355;}s:64:\"0654442b2a78149c1782559e6bc59213d6df9bbfcb8532a7448529c6bc3a119d\";a:4:{s:10:\"expiration\";i:1563898156;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725356;}s:64:\"fb43b7550a553faea73af4358ee244851d5a60def5d945abb7cc6cc977748d37\";a:4:{s:10:\"expiration\";i:1563898156;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36\";s:5:\"login\";i:1563725356;}}');

/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_users`;

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES
	(1,'gpporgs','$P$B8Eax7kbLOuJJdATqQ.BadmfkMSQdn1','gpporgs','vkkorir@gmail.com','','2019-07-15 16:49:33','',0,'gpporgs');

/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
