DROP TABLE IF EXISTS addresses;
CREATE TABLE addresses (
  id bigint NOT NULL AUTO_INCREMENT,
  city varchar(255) DEFAULT NULL,
  country varchar(255) DEFAULT NULL,
  state varchar(255) DEFAULT NULL,
  street varchar(255) DEFAULT NULL,
  zip varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS affiliations;
CREATE TABLE affiliations (
  id bigint NOT NULL AUTO_INCREMENT,
  value varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

LOCK TABLES affiliations WRITE;
INSERT INTO affiliations(value) VALUES
('Blum Center'),
('UC Affiliated'),
('Cal Corps'),
('Student-Led Organization'),
('Faculty-Led Organization'),
('No Campus Affiliation');
UNLOCK TABLES;

DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
  id bigint NOT NULL AUTO_INCREMENT,
  email varchar(255) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  organization_id bigint NOT NULL,
  phone varchar(255) DEFAULT NULL,
  role varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
  code varchar(255) NOT NULL,
  value varchar(255) NOT NULL,
  PRIMARY KEY (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES countries WRITE;
INSERT INTO countries VALUES ('AF','Afghanistan'),('AX','Åland Islands'),('AL','Albania'),('DZ','Algeria'),('AS','American Samoa'),('AD','Andorra'),('AO','Angola'),('AI','Anguilla'),('AQ','Antarctica'),('AG','Antigua and Barbuda'),('AR','Argentina'),('AM','Armenia'),('AW','Aruba'),('AU','Australia'),('AT','Austria'),('AZ','Azerbaijan'),('BS','Bahamas'),('BH','Bahrain'),('BD','Bangladesh'),('BB','Barbados'),('BY','Belarus'),('BE','Belgium'),('BZ','Belize'),('BJ','Benin'),('BM','Bermuda'),('BT','Bhutan'),('BO','Bolivia, Plurinational State of'),('BQ','Bonaire, Sint Eustatius and Saba'),('BA','Bosnia and Herzegovina'),('BW','Botswana'),('BV','Bouvet Island'),('BR','Brazil'),('IO','British Indian Ocean Territory'),('BN','Brunei Darussalam'),('BG','Bulgaria'),('BF','Burkina Faso'),('BI','Burundi'),('KH','Cambodia'),('CM','Cameroon'),('CA','Canada'),('CV','Cape Verde'),('KY','Cayman Islands'),('CF','Central African Republic'),('TD','Chad'),('CL','Chile'),('CN','China'),('CX','Christmas Island'),('CC','Cocos (Keeling) Islands'),('CO','Colombia'),('KM','Comoros'),('CG','Congo'),('CD','Congo, the Democratic Republic of the'),('CK','Cook Islands'),('CR','Costa Rica'),('CI','Cï¿½te d\'Ivoire'),('HR','Croatia'),('CU','Cuba'),('CW','Curaï¿½ao'),('CY','Cyprus'),('CZ','Czech Republic'),('DK','Denmark'),('DJ','Djibouti'),('DM','Dominica'),('DO','Dominican Republic'),('EC','Ecuador'),('EG','Egypt'),('SV','El Salvador'),('GQ','Equatorial Guinea'),('ER','Eritrea'),('EE','Estonia'),('ET','Ethiopia'),('FK','Falkland Islands (Malvinas)'),('FO','Faroe Islands'),('FJ','Fiji'),('FI','Finland'),('FR','France'),('GF','French Guiana'),('PF','French Polynesia'),('TF','French Southern Territories'),('GA','Gabon'),('GM','Gambia'),('GE','Georgia'),('DE','Germany'),('GH','Ghana'),('GI','Gibraltar'),('GR','Greece'),('GL','Greenland'),('GD','Grenada'),('GP','Guadeloupe'),('GU','Guam'),('GT','Guatemala'),('GG','Guernsey'),('GN','Guinea'),('GW','Guinea-Bissau'),('GY','Guyana'),('HT','Haiti'),('HM','Heard Island and McDonald Islands'),('VA','Holy See (Vatican City State)'),('HN','Honduras'),('HK','Hong Kong'),('HU','Hungary'),('IS','Iceland'),('IN','India'),('ID','Indonesia'),('IR','Iran, Islamic Republic of'),('IQ','Iraq'),('IE','Ireland'),('IM','Isle of Man'),('IL','Israel'),('IT','Italy'),('JM','Jamaica'),('JP','Japan'),('JE','Jersey'),('JO','Jordan'),('KZ','Kazakhstan'),('KE','Kenya'),('KI','Kiribati'),('KP','Korea, Democratic People\'s Republic of'),('KR','Korea, Republic of'),('KW','Kuwait'),('KG','Kyrgyzstan'),('LA','Lao People\'s Democratic Republic'),('LV','Latvia'),('LB','Lebanon'),('LS','Lesotho'),('LR','Liberia'),('LY','Libya'),('LI','Liechtenstein'),('LT','Lithuania'),('LU','Luxembourg'),('MO','Macao'),('MK','Macedonia, the Former Yugoslav Republic of'),('MG','Madagascar'),('MW','Malawi'),('MY','Malaysia'),('MV','Maldives'),('ML','Mali'),('MT','Malta'),('MH','Marshall Islands'),('MQ','Martinique'),('MR','Mauritania'),('MU','Mauritius'),('YT','Mayotte'),('MX','Mexico'),('FM','Micronesia, Federated States of'),('MD','Moldova, Republic of'),('MC','Monaco'),('MN','Mongolia'),('ME','Montenegro'),('MS','Montserrat'),('MA','Morocco'),('MZ','Mozambique'),('MM','Myanmar'),('NA','Namibia'),('NR','Nauru'),('NP','Nepal'),('NL','Netherlands'),('NC','New Caledonia'),('NZ','New Zealand'),('NI','Nicaragua'),('NE','Niger'),('NG','Nigeria'),('NU','Niue'),('NF','Norfolk Island'),('MP','Northern Mariana Islands'),('NO','Norway'),('OM','Oman'),('PK','Pakistan'),('PW','Palau'),('PS','Palestine, State of'),('PA','Panama'),('PG','Papua New Guinea'),('PY','Paraguay'),('PE','Peru'),('PH','Philippines'),('PN','Pitcairn'),('PL','Poland'),('PT','Portugal'),('PR','Puerto Rico'),('QA','Qatar'),('RE','Rï¿½union'),('RO','Romania'),('RU','Russian Federation'),('RW','Rwanda'),('BL','Saint Barthï¿½lemy'),('SH','Saint Helena, Ascension and Tristan da Cunha'),('KN','Saint Kitts and Nevis'),('LC','Saint Lucia'),('MF','Saint Martin (French part)'),('PM','Saint Pierre and Miquelon'),('VC','Saint Vincent and the Grenadines'),('WS','Samoa'),('SM','San Marino'),('ST','Sao Tome and Principe'),('SA','Saudi Arabia'),('SN','Senegal'),('RS','Serbia'),('SC','Seychelles'),('SL','Sierra Leone'),('SG','Singapore'),('SX','Sint Maarten (Dutch part)'),('SK','Slovakia'),('SI','Slovenia'),('SB','Solomon Islands'),('SO','Somalia'),('ZA','South Africa'),('GS','South Georgia and the South Sandwich Islands'),('SS','South Sudan'),('ES','Spain'),('LK','Sri Lanka'),('SD','Sudan'),('SR','Suriname'),('SJ','Svalbard and Jan Mayen'),('SZ','Swaziland'),('SE','Sweden'),('CH','Switzerland'),('SY','Syrian Arab Republic'),('TW','Taiwan, Province of China'),('TJ','Tajikistan'),('TZ','Tanzania, United Republic of'),('TH','Thailand'),('TL','Timor-Leste'),('TG','Togo'),('TK','Tokelau'),('TO','Tonga'),('TT','Trinidad and Tobago'),('TN','Tunisia'),('TR','Turkey'),('TM','Turkmenistan'),('TC','Turks and Caicos Islands'),('TV','Tuvalu'),('UG','Uganda'),('UA','Ukraine'),('AE','United Arab Emirates'),('GB','United Kingdom'),('US','United States'),('UM','United States Minor Outlying Islands'),('UY','Uruguay'),('UZ','Uzbekistan'),('VU','Vanuatu'),('VE','Venezuela, Bolivarian Republic of'),('VN','Viet Nam'),('VG','Virgin Islands, British'),('VI','Virgin Islands, U.S.'),('WF','Wallis and Futuna'),('EH','Western Sahara'),('YE','Yemen'),('ZM','Zambia'),('ZW','Zimbabwe');
UNLOCK TABLES;

DROP TABLE IF EXISTS languages;
CREATE TABLE languages (
  code varchar(255) NOT NULL,
  value varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES languages WRITE;
INSERT INTO languages VALUES ('ab','Abkhaz'),('aa','Afar'),('af','Afrikaans'),('ak','Akan'),('sq','Albanian'),('am','Amharic'),('ar','Arabic'),('an','Aragonese'),('hy','Armenian'),('as','Assamese'),('av','Avaric'),('ae','Avestan'),('ay','Aymara'),('az','Azerbaijani'),('bm','Bambara'),('ba','Bashkir'),('eu','Basque'),('be','Belarusian'),('bn','Bengali/Bangla'),('bh','Bihari'),('bi','Bislama'),('bs','Bosnian'),('br','Breton'),('bg','Bulgarian'),('my','Burmese'),('ca','Catalan/Valencian'),('ch','Chamorro'),('ce','Chechen'),('ny','Chichewa/Chewa/Nyanja'),('zh','Chinese'),('cv','Chuvash'),('kw','Cornish'),('co','Corsican'),('cr','Cree'),('hr','Croatian'),('cs','Czech'),('da','Danish'),('dv','Divehi/Dhivehi/Maldivian'),('nl','Dutch'),('dz','Dzongkha'),('en','English'),('eo','Esperanto'),('et','Estonian'),('ee','Ewe'),('fo','Faroese'),('fj','Fijian'),('fi','Finnish'),('fr','French'),('ff','Fula/Fulah/Pulaar/Pular'),('gl','Galician'),('ka','Georgian'),('de','German'),('el','Greek, Modern'),('gn','GuaranÃ­'),('gu','Gujarati'),('ht','Haitian/Haitian Creole'),('ha','Hausa'),('he','Hebrew (modern)'),('hz','Herero'),('hi','Hindi'),('ho','Hiri Motu'),('hu','Hungarian'),('ia','Interlingua'),('id','Indonesian'),('ie','Interlingue'),('ga','Irish'),('ig','Igbo'),('ik','Inupiaq'),('io','Ido'),('is','Icelandic'),('it','Italian'),('iu','Inuktitut'),('ja','Japanese'),('jv','Javanese'),('kl','Kalaallisut, Greenlandic'),('kn','Kannada'),('kr','Kanuri'),('ks','Kashmiri'),('kk','Kazakh'),('km','Khmer'),('ki','Kikuyu, Gikuyu'),('rw','Kinyarwanda'),('ky','Kyrgyz'),('kv','Komi'),('kg','Kongo'),('ko','Korean'),('ku','Kurdish'),('kj','Kwanyama, Kuanyama'),('la','Latin'),('lb','Luxembourgish, Letzeburgesch'),('lg','Ganda'),('li','Limburgish, Limburgan, Limburger'),('ln','Lingala'),('lo','Lao'),('lt','Lithuanian'),('lu','Luba-Katanga'),('lv','Latvian'),('gv','Manx'),('mk','Macedonian'),('mg','Malagasy'),('ms','Malay'),('ml','Malayalam'),('mt','Maltese'),('mi','MÄori'),('mr','Marathi (MarÄá¹­hÄ«)'),('mh','Marshallese'),('mn','Mongolian'),('na','Nauru'),('nv','Navajo, Navaho'),('nb','Norwegian BokmÃ¥l'),('nd','North Ndebele'),('ne','Nepali'),('ng','Ndonga'),('nn','Norwegian Nynorsk'),('no','Norwegian'),('ii','Nuosu'),('nr','South Ndebele'),('oc','Occitan'),('oj','Ojibwe, Ojibwa'),('cu','Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic'),('om','Oromo'),('or','Oriya'),('os','Ossetian, Ossetic'),('pa','Panjabi, Punjabi'),('pi','PÄli'),('fa','Persian (Farsi)'),('pl','Polish'),('ps','Pashto, Pushto'),('pt','Portuguese'),('qu','Quechua'),('rm','Romansh'),('rn','Kirundi'),('ro','Romanian, [])'),('ru','Russian'),('sa','Sanskrit (Saá¹ská¹›ta)'),('sc','Sardinian'),('sd','Sindhi'),('se','Northern Sami'),('sm','Samoan'),('sg','Sango'),('sr','Serbian'),('gd','Scottish Gaelic/Gaelic'),('sn','Shona'),('si','Sinhala, Sinhalese'),('sk','Slovak'),('sl','Slovene'),('so','Somali'),('st','Southern Sotho'),('az','South Azerbaijani'),('es','Spanish/Castilian'),('su','Sundanese'),('sw','Swahili'),('ss','Swati'),('sv','Swedish'),('ta','Tamil'),('te','Telugu'),('tg','Tajik'),('th','Thai'),('ti','Tigrinya'),('bo','Tibetan Standard, Tibetan, Central'),('tk','Turkmen'),('tl','Tagalog'),('tn','Tswana'),('to','Tonga (Tonga Islands)'),('tr','Turkish'),('ts','Tsonga'),('tt','Tatar'),('tw','Twi'),('ty','Tahitian'),('ug','Uyghur, Uighur'),('uk','Ukrainian'),('ur','Urdu'),('uz','Uzbek'),('ve','Venda'),('vi','Vietnamese'),('vo','VolapÃ¼k'),('wa','Walloon'),('cy','Welsh'),('wo','Wolof'),('fy','Western Frisian'),('xh','Xhosa'),('yi','Yiddish'),('yo','Yoruba'),('za','Zhuang, Chuang'),('zu','Zulu');
UNLOCK TABLES;

DROP TABLE IF EXISTS organizations;
CREATE TABLE organizations (
  id bigint NOT NULL AUTO_INCREMENT,
  address_id bigint NOT NULL,
  affiliation_ids varchar(255) DEFAULT '',
  approved bit(1) DEFAULT FALSE,
  description longtext DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  name varchar(255) NOT NULL,
  phone varchar(255) DEFAULT NULL,
  region varchar(255) DEFAULT NULL,
  sector_ids varchar(255) DEFAULT '',
  sector_other varchar(255) DEFAULT NULL,
  type bigint DEFAULT NULL,
  website varchar(255) DEFAULT NULL,
  type_other varchar(255) DEFAULT NULL,
  created varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS regions;
CREATE TABLE regions (
  id bigint NOT NULL AUTO_INCREMENT,
  value varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

LOCK TABLES regions WRITE;
INSERT INTO regions(value) VALUES
('North America'),
('Mexico / Central America'),
('South America'),
('Europe'),
('Middle East / North Africa'),
('Sub-Saharan Africa'),
('China'),
('India'),
('Other');
UNLOCK TABLES;

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
  id bigint NOT NULL AUTO_INCREMENT,
  address_id bigint NOT NULL,
  anonymous bit(1) DEFAULT TRUE,
  cost int DEFAULT 0,
  difficulties longtext DEFAULT NULL,
  duration varchar(255) DEFAULT NULL,
  evaluation longtext DEFAULT NULL,
  language_codes varchar(255) DEFAULT NULL,
  organization_id bigint DEFAULT NULL,
  other longtext DEFAULT NULL,
  region varchar(255) DEFAULT NULL,
  responsiveness int DEFAULT 0,
  reviewer_id varchar(255) DEFAULT NULL,
  safety int DEFAULT 0,
  sector_ids varchar(255) DEFAULT '',
  sector_other varchar(255) DEFAULT NULL,
  stipend int DEFAULT 0,
  typical_day longtext DEFAULT NULL,
  work_done longtext DEFAULT NULL,
  created varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS sectors;
CREATE TABLE sectors (
  id bigint NOT NULL AUTO_INCREMENT,
  value varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

LOCK TABLES sectors WRITE;
INSERT INTO sectors(value) VALUES
('Agriculture / Food Security'),
('Collective Mobilization / Advocacy'),
('Disaster / Humanitarian Relief'),
('Education'),
('Energy'),
('Environment / Sustainability'),
('Fair Trade / Market Access'),
('Gender Empowerment'),
('Health'),
('Housing'),
('Human Rights / Law'),
('Hunger / Malnutrition'),
('Law'),
('Immigration'),
('Information Technology'),
('Microfinance'),
('Refugee / Displaced Persons'),
('Water / Sanitation'),
('Other (please describe below)');
UNLOCK TABLES;

DROP TABLE IF EXISTS types;
CREATE TABLE types (
  id bigint NOT NULL AUTO_INCREMENT,
  value varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

LOCK TABLES types WRITE;
INSERT INTO types(value) VALUES
('Government / UN-like (UNDP, World Bank, WTO)'),
('For Profit / Corporation-Based Development Organization'),
('NGO / Non-Profit'),
('Social Enterprise / Corporate Social Responsibility'),
('Collection Action Group (union, social movement)'),
('Fee-Based Third Party Provider'),
('Other (please describe below)');
UNLOCK TABLES;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id bigint NOT NULL AUTO_INCREMENT,
  email varchar(255) NOT NULL,
  is_admin bit(1) DEFAULT FALSE,
  has_access bit(1) DEFAULT FALSE,
  last_login varchar(255) DEFAULT NULL,
  last_name varchar(255) DEFAULT NULL,
  number_of_login int DEFAULT 0,
  created varchar(255) DEFAULT NULL,
  first_name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY users_id_uindex (id),
  UNIQUE KEY users_email_uindex (email)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

LOCK TABLES users WRITE;
INSERT INTO users(email, is_admin, has_access, created) VALUES
('victor.korir@berkeley.edu', TRUE, TRUE, '2020-10-01T07:00Z'),
('cchowdhry@berkeley.edu', TRUE, TRUE, '2020-10-01T07:00Z'),
('sarasiddiqui@berkeley.edu', TRUE, TRUE, '2020-10-01T07:00Z'),
('larsrohr@eecs.berkeley.edu', TRUE, TRUE, '2020-10-01T07:00Z');
UNLOCK TABLES;
