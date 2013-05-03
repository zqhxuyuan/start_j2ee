/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : hadoop

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2013-04-08 17:05:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pig_demo`
-- ----------------------------
DROP TABLE IF EXISTS `pig_demo`;
CREATE TABLE `pig_demo` (
  `year` int(11) DEFAULT NULL,
  `temp` int(11) DEFAULT NULL,
  `qual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pig_demo
-- ----------------------------
INSERT INTO `pig_demo` VALUES ('1950', '0', '1');
INSERT INTO `pig_demo` VALUES ('1950', '22', '1');
INSERT INTO `pig_demo` VALUES ('1950', '-11', '1');
INSERT INTO `pig_demo` VALUES ('1949', '111', '1');
INSERT INTO `pig_demo` VALUES ('1949', '78', '1');
INSERT INTO `pig_demo` VALUES ('1950', '22', '2');
INSERT INTO `pig_demo` VALUES ('1950', null, '2');
INSERT INTO `pig_demo` VALUES ('1949', null, '3');
