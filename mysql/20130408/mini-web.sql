/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : mini-web

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2013-04-08 17:06:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `acct_authority`
-- ----------------------------
DROP TABLE IF EXISTS `acct_authority`;
CREATE TABLE `acct_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acct_authority
-- ----------------------------
INSERT INTO `acct_authority` VALUES ('2', '修改用户');
INSERT INTO `acct_authority` VALUES ('4', '修改角色');
INSERT INTO `acct_authority` VALUES ('1', '浏览用户');
INSERT INTO `acct_authority` VALUES ('3', '浏览角色');

-- ----------------------------
-- Table structure for `acct_role`
-- ----------------------------
DROP TABLE IF EXISTS `acct_role`;
CREATE TABLE `acct_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acct_role
-- ----------------------------
INSERT INTO `acct_role` VALUES ('2', '用户');
INSERT INTO `acct_role` VALUES ('1', '管理员');

-- ----------------------------
-- Table structure for `acct_role_authority`
-- ----------------------------
DROP TABLE IF EXISTS `acct_role_authority`;
CREATE TABLE `acct_role_authority` (
  `role_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  KEY `FKAE243466DE3FB930` (`role_id`),
  KEY `FKAE2434663FE97564` (`authority_id`),
  CONSTRAINT `FKAE2434663FE97564` FOREIGN KEY (`authority_id`) REFERENCES `acct_authority` (`id`),
  CONSTRAINT `FKAE243466DE3FB930` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acct_role_authority
-- ----------------------------
INSERT INTO `acct_role_authority` VALUES ('1', '1');
INSERT INTO `acct_role_authority` VALUES ('1', '2');
INSERT INTO `acct_role_authority` VALUES ('1', '3');
INSERT INTO `acct_role_authority` VALUES ('1', '4');
INSERT INTO `acct_role_authority` VALUES ('2', '1');
INSERT INTO `acct_role_authority` VALUES ('2', '3');

-- ----------------------------
-- Table structure for `acct_user`
-- ----------------------------
DROP TABLE IF EXISTS `acct_user`;
CREATE TABLE `acct_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `login_name` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acct_user
-- ----------------------------
INSERT INTO `acct_user` VALUES ('1', 'admin@springside.org.cn', 'admin', 'Admin', 'admin');
INSERT INTO `acct_user` VALUES ('2', 'user@springside.org.cn', 'user', 'User', 'user');
INSERT INTO `acct_user` VALUES ('3', 'jack@springside.org.cn', 'user2', 'jack', 'user2');
INSERT INTO `acct_user` VALUES ('4', 'Kate@springside.org.cn', 'user3', 'Kate', 'user3');
INSERT INTO `acct_user` VALUES ('5', 'Sawyer@springside.org.cn', 'user4', 'Sawyer', 'user4');
INSERT INTO `acct_user` VALUES ('6', 'Ben@springside.org.cn', 'user5', 'User', 'user5');

-- ----------------------------
-- Table structure for `acct_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `acct_user_role`;
CREATE TABLE `acct_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKFE85CB3EDE3FB930` (`role_id`),
  KEY `FKFE85CB3E836A7D10` (`user_id`),
  CONSTRAINT `FKFE85CB3E836A7D10` FOREIGN KEY (`user_id`) REFERENCES `acct_user` (`id`),
  CONSTRAINT `FKFE85CB3EDE3FB930` FOREIGN KEY (`role_id`) REFERENCES `acct_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acct_user_role
-- ----------------------------
INSERT INTO `acct_user_role` VALUES ('1', '1');
INSERT INTO `acct_user_role` VALUES ('1', '2');
INSERT INTO `acct_user_role` VALUES ('2', '2');
INSERT INTO `acct_user_role` VALUES ('3', '2');
INSERT INTO `acct_user_role` VALUES ('4', '2');
INSERT INTO `acct_user_role` VALUES ('5', '2');
INSERT INTO `acct_user_role` VALUES ('6', '2');
