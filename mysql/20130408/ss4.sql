/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : ss4

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2013-04-08 17:04:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ss4_task`
-- ----------------------------
DROP TABLE IF EXISTS `ss4_task`;
CREATE TABLE `ss4_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss4_task
-- ----------------------------
INSERT INTO `ss4_task` VALUES ('1', 'Study PlayFramework 2.0', 'http://www.playframework.org/', '2');
INSERT INTO `ss4_task` VALUES ('2', 'Study Grails 2.0', 'http://www.grails.org/', '2');
INSERT INTO `ss4_task` VALUES ('3', 'Try SpringFuse', 'http://www.springfuse.com/', '2');
INSERT INTO `ss4_task` VALUES ('4', 'Try Spring Roo', 'http://www.springsource.org/spring-roo', '2');
INSERT INTO `ss4_task` VALUES ('5', 'Release SpringSide 4.0', 'As soon as posibble.', '2');
INSERT INTO `ss4_task` VALUES ('6', 'test1', 'test', '1');
INSERT INTO `ss4_task` VALUES ('7', 'test2', 'test', '1');
INSERT INTO `ss4_task` VALUES ('8', 'test3', '', '1');
INSERT INTO `ss4_task` VALUES ('9', 'test4', '', '1');
INSERT INTO `ss4_task` VALUES ('10', 'Go Pro', 'goo', '2');
INSERT INTO `ss4_task` VALUES ('11', 'Go P', '', '1');
INSERT INTO `ss4_task` VALUES ('12', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('13', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('14', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('15', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('16', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('17', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('18', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('19', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('20', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('21', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('22', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('23', '111', '', '1');
INSERT INTO `ss4_task` VALUES ('24', '222', '', '1');
INSERT INTO `ss4_task` VALUES ('25', 'ddd', '非常长的文本哦。如果显示时能省略就不错了', '1');

-- ----------------------------
-- Table structure for `ss4_user`
-- ----------------------------
DROP TABLE IF EXISTS `ss4_user`;
CREATE TABLE `ss4_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss4_user
-- ----------------------------
INSERT INTO `ss4_user` VALUES ('1', 'admin', 'Admin', '691b14d79bf0fa2215f155235df5e670b64394cc', '7efbd59d9741d34f', 'admin', '2012-06-04 01:00:00');
INSERT INTO `ss4_user` VALUES ('2', 'user', 'Calvin', '2488aa0c31c624687bd9928e0a5d29e7d1ed520b', '6d65d24122c30500', 'user', '2012-06-04 02:00:00');
