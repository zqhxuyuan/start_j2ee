/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : itcast

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2012-04-13 08:38:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `code` varchar(36) NOT NULL,
  `logopath` varchar(80) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `visible` bit(1) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------

-- ----------------------------
-- Table structure for `buyer`
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `username` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `password` varchar(32) NOT NULL,
  `realname` varchar(8) DEFAULT NULL,
  `regTime` datetime NOT NULL,
  `visible` bit(1) NOT NULL,
  `contactid` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `FK3D91193E7158583` (`contactid`),
  CONSTRAINT `FK3D91193E7158583` FOREIGN KEY (`contactid`) REFERENCES `contactinfo` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyer
-- ----------------------------

-- ----------------------------
-- Table structure for `contactinfo`
-- ----------------------------
DROP TABLE IF EXISTS `contactinfo`;
CREATE TABLE `contactinfo` (
  `contactid` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `postalcode` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contactinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentid` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for `eg`
-- ----------------------------
DROP TABLE IF EXISTS `eg`;
CREATE TABLE `eg` (
  `username` varchar(20) NOT NULL,
  `group_id` varchar(36) NOT NULL,
  PRIMARY KEY (`username`,`group_id`),
  KEY `FKCA2D76AF01E` (`username`),
  KEY `FKCA224833243` (`group_id`),
  CONSTRAINT `FKCA224833243` FOREIGN KEY (`group_id`) REFERENCES `privilegegroup` (`groupid`),
  CONSTRAINT `FKCA2D76AF01E` FOREIGN KEY (`username`) REFERENCES `employee` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eg
-- ----------------------------

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `username` varchar(20) NOT NULL,
  `degree` varchar(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `gender` varchar(5) NOT NULL,
  `imageName` varchar(41) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `realname` varchar(8) NOT NULL,
  `school` varchar(20) DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  `department_id` varchar(36) DEFAULT NULL,
  `card_id` int(11) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `card_id` (`card_id`),
  KEY `FK4AFD4ACE7E5C9A94` (`department_id`),
  KEY `FK4AFD4ACED729426F` (`card_id`),
  CONSTRAINT `FK4AFD4ACE7E5C9A94` FOREIGN KEY (`department_id`) REFERENCES `department` (`departmentid`),
  CONSTRAINT `FK4AFD4ACED729426F` FOREIGN KEY (`card_id`) REFERENCES `idcard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for `generatedorderid`
-- ----------------------------
DROP TABLE IF EXISTS `generatedorderid`;
CREATE TABLE `generatedorderid` (
  `id` varchar(5) NOT NULL,
  `orderid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of generatedorderid
-- ----------------------------

-- ----------------------------
-- Table structure for `idcard`
-- ----------------------------
DROP TABLE IF EXISTS `idcard`;
CREATE TABLE `idcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(40) NOT NULL,
  `birthday` date NOT NULL,
  `cardno` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of idcard
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `createtime` datetime NOT NULL,
  `username` varchar(20) NOT NULL,
  `order_id` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9C2397E751F8272` (`order_id`),
  CONSTRAINT `FK9C2397E751F8272` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `ordercontactinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ordercontactinfo`;
CREATE TABLE `ordercontactinfo` (
  `contactid` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(40) NOT NULL,
  `buyerName` varchar(8) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `gender` varchar(5) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `postalcode` varchar(6) DEFAULT NULL,
  `tel` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordercontactinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `orderdeliverinfo`
-- ----------------------------
DROP TABLE IF EXISTS `orderdeliverinfo`;
CREATE TABLE `orderdeliverinfo` (
  `deliverid` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(40) NOT NULL,
  `deliverWay` varchar(23) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `gender` varchar(5) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `postalcode` varchar(6) DEFAULT NULL,
  `recipients` varchar(8) NOT NULL,
  `requirement` varchar(30) DEFAULT NULL,
  `tel` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`deliverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdeliverinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productPrice` float NOT NULL,
  `productid` int(11) NOT NULL,
  `styleName` varchar(30) NOT NULL,
  `styleid` int(11) NOT NULL,
  `order_id` varchar(14) NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FK60163F6151F8272` (`order_id`),
  CONSTRAINT `FK60163F6151F8272` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for `privilegegroup`
-- ----------------------------
DROP TABLE IF EXISTS `privilegegroup`;
CREATE TABLE `privilegegroup` (
  `groupid` varchar(36) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilegegroup
-- ----------------------------

-- ----------------------------
-- Table structure for `productinfo`
-- ----------------------------
DROP TABLE IF EXISTS `productinfo`;
CREATE TABLE `productinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseprice` float NOT NULL,
  `buyexplain` varchar(30) DEFAULT NULL,
  `clickcount` int(11) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `commend` bit(1) NOT NULL,
  `createdate` date DEFAULT NULL,
  `description` longtext NOT NULL,
  `marketprice` float NOT NULL,
  `model` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `sellcount` int(11) NOT NULL,
  `sellprice` float NOT NULL,
  `sexrequest` varchar(5) NOT NULL,
  `visible` bit(1) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `brandid` varchar(36) DEFAULT NULL,
  `typeid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA7C3E1D7D85588D` (`brandid`),
  KEY `FKA7C3E1DB079C5C2` (`typeid`),
  CONSTRAINT `FKA7C3E1D7D85588D` FOREIGN KEY (`brandid`) REFERENCES `brand` (`code`),
  CONSTRAINT `FKA7C3E1DB079C5C2` FOREIGN KEY (`typeid`) REFERENCES `producttype` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `productstyle`
-- ----------------------------
DROP TABLE IF EXISTS `productstyle`;
CREATE TABLE `productstyle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagename` varchar(40) NOT NULL,
  `name` varchar(30) NOT NULL,
  `visible` bit(1) NOT NULL,
  `productid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK459B7222A4F33FAB` (`productid`),
  CONSTRAINT `FK459B7222A4F33FAB` FOREIGN KEY (`productid`) REFERENCES `productinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productstyle
-- ----------------------------

-- ----------------------------
-- Table structure for `producttype`
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`typeid`),
  KEY `FKA8168A929B5A332` (`parentid`),
  CONSTRAINT `FKA8168A929B5A332` FOREIGN KEY (`parentid`) REFERENCES `producttype` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producttype
-- ----------------------------

-- ----------------------------
-- Table structure for `ps`
-- ----------------------------
DROP TABLE IF EXISTS `ps`;
CREATE TABLE `ps` (
  `group_id` varchar(36) NOT NULL,
  `module` varchar(20) NOT NULL,
  `privilege` varchar(20) NOT NULL,
  PRIMARY KEY (`group_id`,`module`,`privilege`),
  KEY `FKE0324833243` (`group_id`),
  KEY `FKE03B3F9C485` (`module`,`privilege`),
  CONSTRAINT `FKE0324833243` FOREIGN KEY (`group_id`) REFERENCES `privilegegroup` (`groupid`),
  CONSTRAINT `FKE03B3F9C485` FOREIGN KEY (`module`, `privilege`) REFERENCES `systemprivilege` (`module`, `privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ps
-- ----------------------------

-- ----------------------------
-- Table structure for `systemprivilege`
-- ----------------------------
DROP TABLE IF EXISTS `systemprivilege`;
CREATE TABLE `systemprivilege` (
  `module` varchar(20) NOT NULL,
  `privilege` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`module`,`privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemprivilege
-- ----------------------------

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `orderid` varchar(14) NOT NULL,
  `createDate` datetime NOT NULL,
  `deliverFee` float NOT NULL,
  `lockuser` varchar(20) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `payablefee` float NOT NULL,
  `paymentWay` varchar(20) NOT NULL,
  `paymentstate` bit(1) NOT NULL,
  `productTotalPrice` float NOT NULL,
  `state` varchar(16) NOT NULL,
  `totalPrice` float NOT NULL,
  `username` varchar(18) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `deliver_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  UNIQUE KEY `contact_id` (`contact_id`),
  KEY `FKA0C0C3C381068563` (`username`),
  KEY `FKA0C0C3C3EC62F42` (`deliver_id`),
  KEY `FKA0C0C3C311DE13E2` (`contact_id`),
  CONSTRAINT `FKA0C0C3C311DE13E2` FOREIGN KEY (`contact_id`) REFERENCES `ordercontactinfo` (`contactid`),
  CONSTRAINT `FKA0C0C3C381068563` FOREIGN KEY (`username`) REFERENCES `buyer` (`username`),
  CONSTRAINT `FKA0C0C3C3EC62F42` FOREIGN KEY (`deliver_id`) REFERENCES `orderdeliverinfo` (`deliverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for `uploadfile`
-- ----------------------------
DROP TABLE IF EXISTS `uploadfile`;
CREATE TABLE `uploadfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(80) NOT NULL,
  `uploadtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploadfile
-- ----------------------------
