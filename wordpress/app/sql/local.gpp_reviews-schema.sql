/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
