/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : track_problem

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2015-05-25 09:16:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for field_owner_name
-- ----------------------------
DROP TABLE IF EXISTS `field_owner_name`;
CREATE TABLE `field_owner_name` (
  `id_field_owner_name` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_owner_page` bigint(20) DEFAULT NULL,
  `field_label` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `id_field_type` bigint(20) DEFAULT NULL,
  `field_required` bit(1) DEFAULT b'0',
  `text_required` varchar(255) DEFAULT NULL,
  `id_parent` bigint(20) DEFAULT NULL,
  `seq` int(11) DEFAULT '0',
  `url_get_option` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_field_owner_name`),
  KEY `id_field_type` (`id_field_type`),
  KEY `id_owner_page` (`id_owner_page`),
  KEY `id_parent` (`id_parent`),
  CONSTRAINT `field_owner_name_ibfk_1` FOREIGN KEY (`id_field_type`) REFERENCES `field_type` (`id_field_type`),
  CONSTRAINT `field_owner_name_ibfk_2` FOREIGN KEY (`id_owner_page`) REFERENCES `owner_page` (`id_owner_page`),
  CONSTRAINT `field_owner_name_ibfk_3` FOREIGN KEY (`id_parent`) REFERENCES `field_owner_name` (`id_field_owner_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of field_owner_name
-- ----------------------------
INSERT INTO `field_owner_name` VALUES ('1', '1', 'Search', 'Search', '7', '\0', null, null, '0', null);
INSERT INTO `field_owner_name` VALUES ('2', '1', 'Project Name', 'project', '2', '', 'please select', '1', '1', '/options/getProjects');
INSERT INTO `field_owner_name` VALUES ('3', '1', 'Problem Type', 'problem_type', '2', '', 'please select', '1', '2', '/options/getProblemType');
INSERT INTO `field_owner_name` VALUES ('4', '1', 'Search', 'search', '8', '\0', null, '1', '3', null);

-- ----------------------------
-- Table structure for field_owner_selects_option
-- ----------------------------
DROP TABLE IF EXISTS `field_owner_selects_option`;
CREATE TABLE `field_owner_selects_option` (
  `id_field_owner_selects_option` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_field_owner_name` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `seq` int(11) DEFAULT '0',
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id_field_owner_selects_option`),
  KEY `id_field_owner_name` (`id_field_owner_name`),
  CONSTRAINT `field_owner_selects_option_ibfk_1` FOREIGN KEY (`id_field_owner_name`) REFERENCES `field_owner_name` (`id_field_owner_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of field_owner_selects_option
-- ----------------------------
INSERT INTO `field_owner_selects_option` VALUES ('1', '3', 'test1', '0', '');
INSERT INTO `field_owner_selects_option` VALUES ('2', '3', 'test2', '0', '');
INSERT INTO `field_owner_selects_option` VALUES ('3', '3', 'test 3', '0', '');

-- ----------------------------
-- Table structure for field_type
-- ----------------------------
DROP TABLE IF EXISTS `field_type`;
CREATE TABLE `field_type` (
  `id_field_type` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_field_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of field_type
-- ----------------------------
INSERT INTO `field_type` VALUES ('1', 'input');
INSERT INTO `field_type` VALUES ('2', 'select');
INSERT INTO `field_type` VALUES ('3', 'checkbox');
INSERT INTO `field_type` VALUES ('4', 'textarea');
INSERT INTO `field_type` VALUES ('5', 'hidden');
INSERT INTO `field_type` VALUES ('6', 'radio');
INSERT INTO `field_type` VALUES ('7', 'fieldset');
INSERT INTO `field_type` VALUES ('8', 'submit');

-- ----------------------------
-- Table structure for migrate_version
-- ----------------------------
DROP TABLE IF EXISTS `migrate_version`;
CREATE TABLE `migrate_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migrate_version
-- ----------------------------

-- ----------------------------
-- Table structure for owner_page
-- ----------------------------
DROP TABLE IF EXISTS `owner_page`;
CREATE TABLE `owner_page` (
  `id_owner_page` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_name_page` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id_owner_page`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of owner_page
-- ----------------------------
INSERT INTO `owner_page` VALUES ('1', 'manage_report', '');

-- ----------------------------
-- Table structure for problem_page
-- ----------------------------
DROP TABLE IF EXISTS `problem_page`;
CREATE TABLE `problem_page` (
  `id_problem_page` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_track_module` bigint(20) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `ref_page` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id_problem_page`),
  KEY `id_track_module` (`id_track_module`),
  CONSTRAINT `problem_page_ibfk_1` FOREIGN KEY (`id_track_module`) REFERENCES `track_module` (`id_track_module`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem_page
-- ----------------------------
INSERT INTO `problem_page` VALUES ('1', '1', 'all', 'all', '2015-01-06 18:40:53', '');
INSERT INTO `problem_page` VALUES ('2', '2', 'all', 'all', '2015-01-06 18:40:56', '');

-- ----------------------------
-- Table structure for problem_type
-- ----------------------------
DROP TABLE IF EXISTS `problem_type`;
CREATE TABLE `problem_type` (
  `id_problem_type` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_track_module` bigint(20) NOT NULL,
  `problem_name` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created` date DEFAULT NULL,
  PRIMARY KEY (`id_problem_type`),
  KEY `id_track_module` (`id_track_module`),
  CONSTRAINT `problem_type_ibfk_1` FOREIGN KEY (`id_track_module`) REFERENCES `track_module` (`id_track_module`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem_type
-- ----------------------------
INSERT INTO `problem_type` VALUES ('1', '1', 'problems of input data', '', null);
INSERT INTO `problem_type` VALUES ('2', '1', 'problems of show data  ', '', null);
INSERT INTO `problem_type` VALUES ('4', '1', 'Suggestion', '', null);
INSERT INTO `problem_type` VALUES ('5', '2', 'problems of input data', '', null);
INSERT INTO `problem_type` VALUES ('6', '2', 'problems of show data  ', '', null);
INSERT INTO `problem_type` VALUES ('7', '2', 'Suggestion', '', null);

-- ----------------------------
-- Table structure for sample_table
-- ----------------------------
DROP TABLE IF EXISTS `sample_table`;
CREATE TABLE `sample_table` (
  `id` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sample_table
-- ----------------------------
INSERT INTO `sample_table` VALUES ('1', 'test');
INSERT INTO `sample_table` VALUES ('2', 'test');

-- ----------------------------
-- Table structure for tg_group
-- ----------------------------
DROP TABLE IF EXISTS `tg_group`;
CREATE TABLE `tg_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(16) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tg_group
-- ----------------------------
INSERT INTO `tg_group` VALUES ('1', 'managers', 'Managers Group', '2014-12-22 14:38:13');

-- ----------------------------
-- Table structure for tg_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `tg_group_permission`;
CREATE TABLE `tg_group_permission` (
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `tg_group_permission_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `tg_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tg_group_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `tg_permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tg_group_permission
-- ----------------------------
INSERT INTO `tg_group_permission` VALUES ('1', '1');

-- ----------------------------
-- Table structure for tg_permission
-- ----------------------------
DROP TABLE IF EXISTS `tg_permission`;
CREATE TABLE `tg_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(63) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `permission_name` (`permission_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tg_permission
-- ----------------------------
INSERT INTO `tg_permission` VALUES ('1', 'manage', 'This permission give an administrative right to the bearer');

-- ----------------------------
-- Table structure for tg_user
-- ----------------------------
DROP TABLE IF EXISTS `tg_user`;
CREATE TABLE `tg_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(16) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `email_address` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tg_user
-- ----------------------------
INSERT INTO `tg_user` VALUES ('1', 'manager', 'manager@somedomain.com', 'Example manager', '20462408a012c173f9e8fd826943722f1afa79bf1c52ca44bf4ec42c908e9d7cbeb06e9b3e00a4797be1774e1c5804b76dd1a83f52ed798425950bd662d15d60', '2014-12-22 14:38:13');
INSERT INTO `tg_user` VALUES ('2', 'editor', 'editor@somedomain.com', 'Example editor', 'c8dc9a2c2b4c718eceb39ad2d39ea92faeb3428f47c8952fb2f98e456905f3ca22658e90a62f2acdc246c479575cb8fa4d9289f4c16b24353fe55a5389ad7e0e', '2014-12-22 14:38:13');

-- ----------------------------
-- Table structure for tg_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tg_user_group`;
CREATE TABLE `tg_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `tg_user_group_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tg_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tg_user_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `tg_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tg_user_group
-- ----------------------------
INSERT INTO `tg_user_group` VALUES ('1', '1');

-- ----------------------------
-- Table structure for track_image
-- ----------------------------
DROP TABLE IF EXISTS `track_image`;
CREATE TABLE `track_image` (
  `id_track_image` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_track_problem` bigint(20) NOT NULL,
  `path_image` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id_track_image`),
  KEY `id_track_problem` (`id_track_problem`),
  CONSTRAINT `track_image_ibfk_1` FOREIGN KEY (`id_track_problem`) REFERENCES `track_problem` (`id_track_problem`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of track_image
-- ----------------------------
INSERT INTO `track_image` VALUES ('13', '25', 'c:\\temp\\upload\\track_feedback\\images\\25\\issue_25.png', '', '2015-01-15 14:42:24');
INSERT INTO `track_image` VALUES ('14', '26', 'c:\\temp\\upload\\track_feedback\\images\\26\\issue_26.png', '', '2015-01-15 14:42:57');
INSERT INTO `track_image` VALUES ('15', '27', 'c:\\temp\\upload\\track_feedback\\images\\27\\issue_27.png', '', '2015-01-15 14:43:24');
INSERT INTO `track_image` VALUES ('16', '28', 'c:\\temp\\upload\\track_feedback\\images\\28\\issue_28.png', '', '2015-01-15 14:43:39');
INSERT INTO `track_image` VALUES ('17', '29', 'c:\\temp\\upload\\track_feedback\\images\\29\\issue_29.png', '', '2015-01-15 14:44:00');
INSERT INTO `track_image` VALUES ('18', '30', 'c:\\temp\\upload\\track_feedback\\images\\30\\issue_30.png', '', '2015-01-26 15:54:07');
INSERT INTO `track_image` VALUES ('19', '31', 'c:\\temp\\upload\\track_feedback\\images\\31\\issue_31.png', '', '2015-01-26 15:54:26');
INSERT INTO `track_image` VALUES ('20', '32', 'c:\\temp\\upload\\track_feedback\\images\\32\\issue_32.png', '', '2015-01-26 16:02:51');
INSERT INTO `track_image` VALUES ('21', '33', 'c:\\temp\\upload\\track_feedback\\images\\33\\issue_33.png', '', '2015-01-26 16:26:51');
INSERT INTO `track_image` VALUES ('22', '34', 'c:\\temp\\upload\\track_feedback\\images\\34\\issue_34.png', '', '2015-01-26 16:31:44');
INSERT INTO `track_image` VALUES ('23', '35', 'c:\\temp\\upload\\track_feedback\\images\\35\\issue_35.png', '', '2015-01-26 16:41:05');
INSERT INTO `track_image` VALUES ('24', '36', 'c:\\temp\\upload\\track_feedback\\images\\36\\issue_36.png', '', '2015-01-26 18:24:06');
INSERT INTO `track_image` VALUES ('25', '37', 'c:\\temp\\upload\\track_feedback\\images\\37\\issue_37.png', '', '2015-01-26 18:24:16');
INSERT INTO `track_image` VALUES ('26', '38', 'c:\\temp\\upload\\track_feedback\\images\\38\\issue_38.png', '', '2015-01-26 18:24:24');
INSERT INTO `track_image` VALUES ('27', '39', 'c:\\temp\\upload\\track_feedback\\images\\39\\issue_39.png', '', '2015-01-26 18:27:33');
INSERT INTO `track_image` VALUES ('28', '40', 'c:\\temp\\upload\\track_feedback\\images\\40\\issue_40.png', '', '2015-01-26 18:27:46');
INSERT INTO `track_image` VALUES ('29', '41', 'c:\\temp\\upload\\track_feedback\\images\\41\\issue_41.png', '', '2015-01-26 18:30:07');
INSERT INTO `track_image` VALUES ('30', '42', 'c:\\temp\\upload\\track_feedback\\images\\42\\issue_42.png', '', '2015-01-26 18:30:17');
INSERT INTO `track_image` VALUES ('31', '43', 'c:\\temp\\upload\\track_feedback\\images\\43\\issue_43.png', '', '2015-01-26 18:31:39');
INSERT INTO `track_image` VALUES ('32', '44', 'c:\\temp\\upload\\track_feedback\\images\\44\\issue_44.png', '', '2015-01-26 18:32:12');
INSERT INTO `track_image` VALUES ('33', '45', 'c:\\temp\\upload\\track_feedback\\images\\45\\issue_45.png', '', '2015-01-26 18:34:14');
INSERT INTO `track_image` VALUES ('34', '46', 'c:\\temp\\upload\\track_feedback\\images\\46\\issue_46.png', '', '2015-01-26 18:39:38');
INSERT INTO `track_image` VALUES ('35', '47', 'c:\\temp\\upload\\track_feedback\\images\\47\\issue_47.png', '', '2015-01-26 18:39:58');
INSERT INTO `track_image` VALUES ('36', '48', 'c:\\temp\\upload\\track_feedback\\images\\48\\issue_48.png', '', '2015-01-26 18:43:45');
INSERT INTO `track_image` VALUES ('37', '49', 'c:\\temp\\upload\\track_feedback\\images\\49\\issue_49.png', '', '2015-01-26 18:44:26');
INSERT INTO `track_image` VALUES ('38', '50', 'c:\\temp\\upload\\track_feedback\\images\\50\\issue_50.png', '', '2015-01-26 18:45:39');
INSERT INTO `track_image` VALUES ('39', '51', 'c:\\temp\\upload\\track_feedback\\images\\51\\issue_51.png', '', '2015-01-26 18:46:29');
INSERT INTO `track_image` VALUES ('40', '52', 'c:\\temp\\upload\\track_feedback\\images\\52\\issue_52.png', '', '2015-01-26 18:49:10');
INSERT INTO `track_image` VALUES ('41', '53', 'c:\\temp\\upload\\track_feedback\\images\\53\\issue_53.png', '', '2015-01-26 18:49:49');
INSERT INTO `track_image` VALUES ('42', '54', 'c:\\temp\\upload\\track_feedback\\images\\54\\issue_54.png', '', '2015-01-26 18:55:07');
INSERT INTO `track_image` VALUES ('43', '55', 'c:\\temp\\upload\\track_feedback\\images\\55\\issue_55.png', '', '2015-01-26 18:55:25');
INSERT INTO `track_image` VALUES ('44', '56', 'c:\\temp\\upload\\track_feedback\\images\\56\\issue_56.png', '', '2015-01-27 11:34:17');
INSERT INTO `track_image` VALUES ('45', '57', 'c:\\temp\\upload\\track_feedback\\images\\57\\issue_57.png', '', '2015-01-27 11:36:17');
INSERT INTO `track_image` VALUES ('46', '58', 'c:\\temp\\upload\\track_feedback\\images\\58\\issue_58.png', '', '2015-01-27 11:38:08');
INSERT INTO `track_image` VALUES ('47', '59', 'c:\\temp\\upload\\track_feedback\\images\\59\\issue_59.png', '', '2015-01-27 11:38:24');
INSERT INTO `track_image` VALUES ('48', '60', 'c:\\temp\\upload\\track_feedback\\images\\60\\issue_60.png', '', '2015-01-27 11:47:18');
INSERT INTO `track_image` VALUES ('49', '61', 'c:\\temp\\upload\\track_feedback\\images\\61\\issue_61.png', '', '2015-01-27 11:47:40');
INSERT INTO `track_image` VALUES ('50', '62', 'c:\\temp\\upload\\track_feedback\\images\\62\\issue_62.png', '', '2015-01-27 12:00:24');
INSERT INTO `track_image` VALUES ('51', '63', 'c:\\temp\\upload\\track_feedback\\images\\63\\issue_63.png', '', '2015-01-27 12:02:59');
INSERT INTO `track_image` VALUES ('52', '64', 'c:\\temp\\upload\\track_feedback\\images\\64\\issue_64.png', '', '2015-01-27 12:13:01');
INSERT INTO `track_image` VALUES ('53', '65', 'c:\\temp\\upload\\track_feedback\\images\\65\\issue_65.png', '', '2015-01-27 12:14:36');
INSERT INTO `track_image` VALUES ('54', '66', 'c:\\temp\\upload\\track_feedback\\images\\66\\issue_66.png', '', '2015-01-27 12:16:47');
INSERT INTO `track_image` VALUES ('55', '67', 'c:\\temp\\upload\\track_feedback\\images\\67\\issue_67.png', '', '2015-01-27 12:18:32');
INSERT INTO `track_image` VALUES ('56', '68', 'c:\\temp\\upload\\track_feedback\\images\\68\\issue_68.png', '', '2015-01-27 12:19:06');
INSERT INTO `track_image` VALUES ('57', '69', 'c:\\temp\\upload\\track_feedback\\images\\69\\issue_69.png', '', '2015-01-27 12:19:40');
INSERT INTO `track_image` VALUES ('58', '70', 'c:\\temp\\upload\\track_feedback\\images\\70\\issue_70.png', '', '2015-01-27 12:20:47');
INSERT INTO `track_image` VALUES ('59', '71', 'c:\\temp\\upload\\track_feedback\\images\\71\\issue_71.png', '', '2015-01-27 12:21:05');
INSERT INTO `track_image` VALUES ('60', '72', 'c:\\temp\\upload\\track_feedback\\images\\72\\issue_72.png', '', '2015-01-27 12:23:56');
INSERT INTO `track_image` VALUES ('61', '73', 'c:\\temp\\upload\\track_feedback\\images\\73\\issue_73.png', '', '2015-01-27 12:27:53');
INSERT INTO `track_image` VALUES ('62', '74', 'c:\\temp\\upload\\track_feedback\\images\\74\\issue_74.png', '', '2015-01-27 12:28:44');
INSERT INTO `track_image` VALUES ('63', '75', 'c:\\temp\\upload\\track_feedback\\images\\75\\issue_75.png', '', '2015-01-27 13:47:58');
INSERT INTO `track_image` VALUES ('64', '76', 'c:\\temp\\upload\\track_feedback\\images\\76\\issue_76.png', '', '2015-01-27 13:51:19');
INSERT INTO `track_image` VALUES ('65', '77', 'c:\\temp\\upload\\track_feedback\\images\\77\\issue_77.png', '', '2015-01-27 13:54:50');
INSERT INTO `track_image` VALUES ('66', '78', 'c:\\temp\\upload\\track_feedback\\images\\78\\issue_78.png', '', '2015-01-27 13:55:40');
INSERT INTO `track_image` VALUES ('67', '79', 'c:\\temp\\upload\\track_feedback\\images\\79\\issue_79.png', '', '2015-01-27 13:55:58');

-- ----------------------------
-- Table structure for track_module
-- ----------------------------
DROP TABLE IF EXISTS `track_module`;
CREATE TABLE `track_module` (
  `id_track_module` bigint(20) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) DEFAULT NULL,
  `secure_key` varchar(255) DEFAULT NULL,
  `domain_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bypass` bit(1) DEFAULT b'0',
  `active` bit(1) DEFAULT b'1',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id_track_module`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `track_module_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tg_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of track_module
-- ----------------------------
INSERT INTO `track_module` VALUES ('1', 'JM Web', '123456789', 'tong.jobmatcher.poweredbyclear.com', '1', '', '', '2015-01-05 11:56:38');
INSERT INTO `track_module` VALUES ('2', 'Import Email', '123456789', 'tong.jobmatcher.poweredbyclear.com', '1', '', '', '2015-01-05 11:56:41');

-- ----------------------------
-- Table structure for track_problem
-- ----------------------------
DROP TABLE IF EXISTS `track_problem`;
CREATE TABLE `track_problem` (
  `id_track_problem` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_track_module` bigint(20) NOT NULL,
  `id_problem_page` bigint(20) NOT NULL,
  `feedback_url` text,
  `id_problem_type` bigint(20) NOT NULL,
  `description` text,
  `from_page` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id_track_problem`),
  KEY `id_track_module` (`id_track_module`),
  KEY `fk_track_problem_problem_page_1` (`id_problem_page`),
  KEY `fk_track_problem_problem_type_1` (`id_problem_type`),
  CONSTRAINT `fk_track_problem_problem_page_1` FOREIGN KEY (`id_problem_page`) REFERENCES `problem_page` (`id_problem_page`),
  CONSTRAINT `fk_track_problem_problem_type_1` FOREIGN KEY (`id_problem_type`) REFERENCES `problem_type` (`id_problem_type`),
  CONSTRAINT `track_problem_ibfk_1` FOREIGN KEY (`id_track_module`) REFERENCES `track_module` (`id_track_module`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of track_problem
-- ----------------------------
INSERT INTO `track_problem` VALUES ('25', '1', '1', 'http://localhost:8089/', '1', 'test 555', 'index', 'tong_pa@hotmail.com', '', '2015-01-15 14:42:24');
INSERT INTO `track_problem` VALUES ('26', '1', '1', 'http://localhost:8089/', '1', 'test 555', 'index', 'tong_pa@hotmail.com', '', '2015-01-15 14:42:57');
INSERT INTO `track_problem` VALUES ('27', '1', '1', 'http://localhost:8089/', '1', 'test 555', 'index', 'tong_pa@hotmail.com', '', '2015-01-15 14:43:24');
INSERT INTO `track_problem` VALUES ('28', '1', '1', 'http://localhost:8089/', '1', 'wwwww', 'index', 'tong_pa@hotmail.com', '', '2015-01-15 14:43:39');
INSERT INTO `track_problem` VALUES ('29', '1', '1', 'http://localhost:8089/', '1', 'wwwww', 'index', 'tong_pa@hotmail.com', '', '2015-01-15 14:44:00');
INSERT INTO `track_problem` VALUES ('30', '1', '1', 'http://localhost:8089/', '1', 'aaas', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 15:54:07');
INSERT INTO `track_problem` VALUES ('31', '1', '1', 'http://localhost:8089/', '1', 'aaas', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 15:54:26');
INSERT INTO `track_problem` VALUES ('32', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 16:02:51');
INSERT INTO `track_problem` VALUES ('33', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 16:26:51');
INSERT INTO `track_problem` VALUES ('34', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 16:31:44');
INSERT INTO `track_problem` VALUES ('35', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 16:41:05');
INSERT INTO `track_problem` VALUES ('36', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:24:06');
INSERT INTO `track_problem` VALUES ('37', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:24:16');
INSERT INTO `track_problem` VALUES ('38', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:24:24');
INSERT INTO `track_problem` VALUES ('39', '1', '1', 'http://localhost:8089/', '1', '5555', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:27:33');
INSERT INTO `track_problem` VALUES ('40', '1', '1', 'http://localhost:8089/', '1', '5555', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:27:46');
INSERT INTO `track_problem` VALUES ('41', '1', '1', 'http://localhost:8089/', '1', 'zxc', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:30:07');
INSERT INTO `track_problem` VALUES ('42', '1', '1', 'http://localhost:8089/', '1', 'zxc', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:30:17');
INSERT INTO `track_problem` VALUES ('43', '1', '1', 'http://localhost:8089/', '1', 'ทดสอบการทำงาน', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:31:39');
INSERT INTO `track_problem` VALUES ('44', '1', '1', 'http://localhost:8089/', '1', 'ทดสอบการทำงาน', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:32:12');
INSERT INTO `track_problem` VALUES ('45', '1', '1', 'http://localhost:8089/', '1', 'ทดสอบการทำงาน', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:34:14');
INSERT INTO `track_problem` VALUES ('46', '1', '1', 'http://localhost:8089/', '1', 'test', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:39:38');
INSERT INTO `track_problem` VALUES ('47', '1', '1', 'http://localhost:8089/', '1', 'qqqq', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:39:57');
INSERT INTO `track_problem` VALUES ('48', '1', '1', 'http://localhost:8089/', '1', '1235', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:43:45');
INSERT INTO `track_problem` VALUES ('49', '1', '1', 'http://localhost:8089/', '1', '1235', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:44:26');
INSERT INTO `track_problem` VALUES ('50', '1', '1', 'http://localhost:8089/', '1', 'yoy', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:45:39');
INSERT INTO `track_problem` VALUES ('51', '1', '1', 'http://localhost:8089/', '1', 'yoy', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:46:29');
INSERT INTO `track_problem` VALUES ('52', '1', '1', 'http://localhost:8089/', '1', 'testing screen', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:49:10');
INSERT INTO `track_problem` VALUES ('53', '1', '1', 'http://localhost:8089/', '1', 'ทดสอบ สกรีนหน้าจอ', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:49:49');
INSERT INTO `track_problem` VALUES ('54', '1', '1', 'http://localhost:8089/', '1', 'za', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:55:07');
INSERT INTO `track_problem` VALUES ('55', '1', '1', 'http://localhost:8089/', '1', '15987', 'index', 'tong_pa@hotmail.com', '', '2015-01-26 18:55:25');
INSERT INTO `track_problem` VALUES ('56', '1', '1', 'http://localhost:8089/', '1', '58', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 11:34:17');
INSERT INTO `track_problem` VALUES ('57', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 11:36:17');
INSERT INTO `track_problem` VALUES ('58', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 11:38:08');
INSERT INTO `track_problem` VALUES ('59', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 11:38:24');
INSERT INTO `track_problem` VALUES ('60', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 11:47:18');
INSERT INTO `track_problem` VALUES ('61', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 11:47:40');
INSERT INTO `track_problem` VALUES ('62', '1', '1', 'http://localhost:8089/', '1', 'ssss', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:00:24');
INSERT INTO `track_problem` VALUES ('63', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:02:59');
INSERT INTO `track_problem` VALUES ('64', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:13:01');
INSERT INTO `track_problem` VALUES ('65', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:14:36');
INSERT INTO `track_problem` VALUES ('66', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:16:47');
INSERT INTO `track_problem` VALUES ('67', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:18:32');
INSERT INTO `track_problem` VALUES ('68', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:19:06');
INSERT INTO `track_problem` VALUES ('69', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:19:40');
INSERT INTO `track_problem` VALUES ('70', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:20:47');
INSERT INTO `track_problem` VALUES ('71', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:21:05');
INSERT INTO `track_problem` VALUES ('72', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:23:56');
INSERT INTO `track_problem` VALUES ('73', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:27:53');
INSERT INTO `track_problem` VALUES ('74', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 12:28:44');
INSERT INTO `track_problem` VALUES ('75', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 13:47:58');
INSERT INTO `track_problem` VALUES ('76', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 13:51:19');
INSERT INTO `track_problem` VALUES ('77', '1', '1', 'http://localhost:8089/', '1', '', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 13:54:50');
INSERT INTO `track_problem` VALUES ('78', '1', '1', 'http://localhost:8089/', '1', '1234', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 13:55:40');
INSERT INTO `track_problem` VALUES ('79', '1', '1', 'http://localhost:8089/', '1', '45678', 'index', 'tong_pa@hotmail.com', '', '2015-01-27 13:55:58');
