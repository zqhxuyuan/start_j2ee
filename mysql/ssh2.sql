/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : ssh2

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2012-04-13 08:37:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `generator_table`
-- ----------------------------
DROP TABLE IF EXISTS `generator_table`;
CREATE TABLE `generator_table` (
  `g_key` varchar(100) NOT NULL,
  `g_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`g_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of generator_table
-- ----------------------------
INSERT INTO `generator_table` VALUES ('log_pk', '7');
INSERT INTO `generator_table` VALUES ('role_pk', '5');
INSERT INTO `generator_table` VALUES ('user_pk', '4');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `loginname` varchar(20) DEFAULT NULL,
  `methodname` varchar(20) DEFAULT NULL,
  `logtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('5', 'Lily', 'login', '2012-03-20 11:57:18');
INSERT INTO `log` VALUES ('6', 'Lily', 'logout', '2012-03-20 11:59:17');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'root');
INSERT INTO `role` VALUES ('2', 'system');
INSERT INTO `role` VALUES ('3', 'test');
INSERT INTO `role` VALUES ('4', 'test2');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Lily', 'root', '1');
INSERT INTO `user` VALUES ('2', 'Nana', 'root', '2');
INSERT INTO `user` VALUES ('3', 'John', 'root', '1');
