/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : ares

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2013-04-08 17:04:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('377a91e53a8b9cbb013a8b9d233c0001', 'test', 'test', '', '0', '2012-10-23 11:14:22');
