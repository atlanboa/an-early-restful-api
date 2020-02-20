create database anearly;

use anearly;


CREATE TABLE `person` (
  `device` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_verification` varchar(10) NOT NULL DEFAULT 'false',
  `pw` text NOT NULL,
  `gender` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `reward_point` int(11) NOT NULL DEFAULT 0,
  `authority` varchar(10) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

CREATE TABLE `survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `hit` int(11) NOT NULL DEFAULT 0,
  `start_date` date DEFAULT curdate(),
  `end_date` date NOT NULL,
  `budget` int(11) NOT NULL DEFAULT 0,
  `content` longtext NOT NULL DEFAULT '',
  `category` varchar(20) NOT NULL DEFAULT 'none',
  `product_name` varchar(50) NOT NULL,
  `product_price` int(11) NOT NULL DEFAULT 0,
  `product_release_date` date NOT NULL,
  `product_image` text DEFAULT NULL,
  `max_participant_number` int(11) NOT NULL DEFAULT 0,
  `cur_participant_number` int(11) NOT NULL DEFAULT 0,
  `point_per_participant` int(11) NOT NULL DEFAULT 100,
  `approval` int(11) NOT NULL DEFAULT 0,
  `open_status` int(11) NOT NULL DEFAULT 0,
  `target_age` int(11) NOT NULL DEFAULT 20,
  `target_gender` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_user_survey_id` (`user_id`),
  CONSTRAINT `fk_user_survey_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;


CREATE TABLE `survey_attend_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_survey_survey_attend_user_id` (`survey_id`),
  KEY `fk_user_survey_attend_user_id` (`user_id`),
  CONSTRAINT `fk_survey_survey_attend_user_id` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_survey_attend_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;


CREATE TABLE `survey_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `survey_type` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` varchar(255) DEFAULT '',
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_survey_survey_list_id` (`survey_id`),
  CONSTRAINT `fk_survey_survey_list_id` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;


CREATE TABLE `survey_list_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_list_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_survey_list_survey_list_item_id` (`survey_list_id`),
  CONSTRAINT `fk_survey_list_survey_list_item_id` FOREIGN KEY (`survey_list_id`) REFERENCES `survey_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;


CREATE TABLE `survey_list_item_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_list_item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_survey_list_item_survey_list_item_result_id` (`survey_list_item_id`),
  KEY `fk_user_survey_list_item_result_id` (`user_id`),
  CONSTRAINT `fk_survey_list_item_survey_list_item_result_id` FOREIGN KEY (`survey_list_item_id`) REFERENCES `survey_list_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_survey_list_item_result_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;


CREATE TABLE `survey_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `survey_type` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_survey_survey_review_id` (`survey_id`),
  CONSTRAINT `fk_survey_survey_review_id` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;


CREATE TABLE `survey_review_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_review_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_survey_review_survey_review_result_id` (`survey_review_id`),
  KEY `fk_user_survey_review_result_id` (`user_id`),
  CONSTRAINT `fk_survey_review_survey_review_result_id` FOREIGN KEY (`survey_review_id`) REFERENCES `survey_review` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_survey_review_result_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;



