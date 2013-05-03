/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : nutz

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2013-04-08 17:06:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_person`
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `age` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES ('1', 'admins', '25');
INSERT INTO `t_person` VALUES ('2', 'test', '19');
INSERT INTO `t_person` VALUES ('3', 'test2', '19');
