/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE `gpp_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int(11) DEFAULT NULL,
  `contact_ids` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  `description` mediumtext,
  `affiliations` mediumtext,
  `type` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `region` varchar(64) DEFAULT NULL,
  `sectors` mediumtext,
  `approved_status` char(1) DEFAULT NULL,
  `average_cost` varchar(11) DEFAULT NULL,
  `num_reviews` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
