/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : wms

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2012-04-13 08:37:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `billdetails`
-- ----------------------------
DROP TABLE IF EXISTS `billdetails`;
CREATE TABLE `billdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billId` int(11) DEFAULT NULL,
  `goodId` int(11) DEFAULT NULL,
  `billCount` int(11) DEFAULT NULL,
  `billPrice` decimal(18,4) DEFAULT NULL,
  `basePrice` decimal(18,4) DEFAULT NULL,
  `rtnCount` int(11) DEFAULT NULL,
  `billDetailId` int(11) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of billdetails
-- ----------------------------
INSERT INTO `billdetails` VALUES ('25', '2', '4', '2', '10.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('26', '2', '5', '1', '2000.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('27', '1', '1', '1', '2500.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('28', '1', '7', '2', '1323.2300', null, null, null, null);
INSERT INTO `billdetails` VALUES ('29', '1', '5', '1', '50.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('46', '3', '1', '1', '2500.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('47', '3', '2', '12', '2.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('48', '3', '3', '2', '10.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('51', '4', '2', '20', '2.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('52', '7', '1', '1', '5600.7800', null, null, null, null);
INSERT INTO `billdetails` VALUES ('53', '7', '4', '1', '800.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('54', '7', '6', '1', '3500.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('55', '7', '2', '1', '2.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('72', '6', '3', '1', '23.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('73', '6', '5', '2', '1200.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('76', '9', '2', '20', '2.0000', null, '5', null, null);
INSERT INTO `billdetails` VALUES ('77', '9', '5', '1', '1300.0000', null, '1', null, null);
INSERT INTO `billdetails` VALUES ('78', '9', '6', '1', '2500.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('86', '8', '5', '2', '1200.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('87', '8', '6', '1', '2400.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('96', '12', '5', '1', '2000.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('97', '12', '6', '2', '5600.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('98', '12', '2', '0', '0.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('99', '11', '5', '1', '2000.0000', '50.0000', null, null, null);
INSERT INTO `billdetails` VALUES ('100', '11', '3', '1', '20.2000', '10.0000', null, null, null);
INSERT INTO `billdetails` VALUES ('114', '15', '4', '2', '10.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('115', '15', '1', '1', '0.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('116', '15', '6', '1', '2500.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('123', '14', '4', '1', '800.0000', '800.0000', null, null, null);
INSERT INTO `billdetails` VALUES ('124', '14', '3', '1', '10.0000', '10.0000', null, null, null);
INSERT INTO `billdetails` VALUES ('125', '14', '2', '3', '2.2000', '2.0000', null, null, null);
INSERT INTO `billdetails` VALUES ('150', '16', '5', '1', '1000.0000', null, null, '77', null);
INSERT INTO `billdetails` VALUES ('151', '16', '2', '5', '2.0000', null, null, '76', null);
INSERT INTO `billdetails` VALUES ('152', '20', '2', '0', '2.0000', null, null, '76', null);
INSERT INTO `billdetails` VALUES ('153', '13', '5', '1', '1425.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('154', '13', '6', '2', '2500.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('155', '13', '2', '2', '2.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('162', '19', '3', '1', '0.0000', null, null, null, null);
INSERT INTO `billdetails` VALUES ('163', '19', '5', '2', '0.0000', null, null, null, null);

-- ----------------------------
-- Table structure for `bills`
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billType` int(11) DEFAULT NULL,
  `intercourseId` int(11) DEFAULT NULL,
  `depotId` int(11) DEFAULT NULL,
  `depot2Id` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `summary` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `billCount` int(11) DEFAULT NULL,
  `billCost` decimal(18,4) DEFAULT NULL,
  `writeUserId` int(11) DEFAULT NULL,
  `checkUserId` int(11) DEFAULT NULL,
  `writeDate` datetime DEFAULT NULL,
  `checkDate` datetime DEFAULT NULL,
  `billDate` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bills
-- ----------------------------
INSERT INTO `bills` VALUES ('1', '1', '3', '2', null, 'RM2011040001', '', '', '4', '5196.4600', '2', '2', '2011-04-16 23:54:08', '2011-04-17 01:02:15', '2011-04-15', '1');
INSERT INTO `bills` VALUES ('2', '1', '2', '1', null, 'RM2011040002', '', '', '3', '2020.0000', '1', '2', '2011-04-16 16:12:13', '2011-04-19 17:07:19', '2011-04-15', '1');
INSERT INTO `bills` VALUES ('3', '1', '4', '2', null, 'RM2011040003', '', '', '15', '2544.0000', '2', '1', '2011-04-18 11:57:01', '2011-04-18 17:05:30', '2011-04-18', '1');
INSERT INTO `bills` VALUES ('4', '1', '1', '2', null, 'RM2011040004', '文具', '', '20', '40.0000', '2', '1', '2011-04-18 15:06:39', '2011-04-18 17:02:22', '2011-04-18', '1');
INSERT INTO `bills` VALUES ('6', '1', '2', '1', null, 'RM2011040006', '', '', '3', '2423.0000', '2', '2', '2011-04-20 16:14:02', '2011-04-20 16:17:00', '2011-04-18', '1');
INSERT INTO `bills` VALUES ('7', '1', '3', '2', null, 'RM2011040007', '', '', '4', '9902.7800', '1', '1', '2011-04-19 16:01:18', '2011-04-19 16:01:35', '2011-04-18', '1');
INSERT INTO `bills` VALUES ('8', '1', '1', '2', null, 'RM2011040008', '', '备注信息', '3', '4800.0000', '2', null, '2011-04-21 10:01:15', null, '2011-04-20', '0');
INSERT INTO `bills` VALUES ('9', '1', '2', '1', null, 'RM2011040009', '', '', '22', '3840.0000', '2', '2', '2011-04-20 16:16:46', '2011-04-20 16:17:19', '2011-04-20', '1');
INSERT INTO `bills` VALUES ('11', '2', '2', '2', null, 'SM2011040001', '', '出库备注', '2', '2020.2000', '2', '2', '2011-04-24 14:51:38', '2011-04-24 14:51:46', '2011-04-20', '1');
INSERT INTO `bills` VALUES ('12', '2', '2', '2', null, 'SM2011040002', null, '销售出库', '3', '13200.0000', '2', null, '2011-04-24 14:39:16', null, '2011-04-21', '0');
INSERT INTO `bills` VALUES ('13', '3', null, '1', '21', 'TR2011040001', null, '生产用', '5', '6429.0000', '1', null, '2011-06-09 11:14:49', null, '2011-04-28', '0');
INSERT INTO `bills` VALUES ('14', '3', null, '2', '22', 'TR2011040002', null, '', '5', '816.6000', '1', '1', '2011-04-30 14:50:19', '2011-04-30 14:50:26', '2011-04-28', '1');
INSERT INTO `bills` VALUES ('15', '3', null, '1', '24', 'TR2011040003', null, '', '4', '2520.0000', '1', null, '2011-04-28 11:18:17', null, '2011-04-28', '0');
INSERT INTO `bills` VALUES ('16', '11', '2', '1', null, 'RP2011050001', null, '', '6', '1010.0000', '1', '1', '2011-05-04 16:45:06', '2011-05-04 16:45:53', '2011-05-03', '1');
INSERT INTO `bills` VALUES ('19', '2', '2', '1', null, 'SM2011050001', null, '', '3', '0.0000', '1', null, '2011-06-28 10:44:30', null, '2011-05-04', '0');
INSERT INTO `bills` VALUES ('20', '11', '2', '1', null, 'RP2011050002', null, '', '0', '0.0000', '1', null, '2011-05-04 16:47:08', null, '2011-05-04', '0');

-- ----------------------------
-- Table structure for `departments`
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', '0', 'XX公司', '1');
INSERT INTO `departments` VALUES ('2', '1', '财务部', '4');
INSERT INTO `departments` VALUES ('3', '1', '行政部', '3');
INSERT INTO `departments` VALUES ('4', '1', '技术部', '7');
INSERT INTO `departments` VALUES ('5', '1', '市场部', '6');

-- ----------------------------
-- Table structure for `depots`
-- ----------------------------
DROP TABLE IF EXISTS `depots`;
CREATE TABLE `depots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depots
-- ----------------------------
INSERT INTO `depots` VALUES ('1', '001', '广州仓库', '');
INSERT INTO `depots` VALUES ('2', '002', '上海仓库', '');
INSERT INTO `depots` VALUES ('21', '003', '北京仓库', '');
INSERT INTO `depots` VALUES ('22', '004', '东莞仓库', '');
INSERT INTO `depots` VALUES ('24', '005', '南京仓库', '');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodTypeId` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `spec` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `vender` varchar(300) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `countUp` int(11) DEFAULT NULL,
  `countDown` int(11) DEFAULT NULL,
  `help` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '15', 'C001', '笔记本电脑', '', '台', '', '', '', '', '', '', '', null, null, '');
INSERT INTO `goods` VALUES ('2', '16', '', '笔', '', '支', '', '', '', '', '', '', '', null, null, '');
INSERT INTO `goods` VALUES ('3', '16', '', '订书机', '', '台', '', '', '', '', '', '', '', null, null, '');
INSERT INTO `goods` VALUES ('4', '15', '', '打印机', '', '台', '', '', '', '', '', '', '', null, null, '');
INSERT INTO `goods` VALUES ('5', '16', '', '复印机', '', '台', '', '', '白色', '', '中国', '', '', null, null, '');
INSERT INTO `goods` VALUES ('6', '15', 'C002', '台式电脑', '', '台', '', '', '', '', '', '', '', null, null, '');
INSERT INTO `goods` VALUES ('7', '15', '', '鼠标', '', '支', '', '', '', 'IBM', '', '', '', null, null, '');
INSERT INTO `goods` VALUES ('8', '2', '', '数码相机', '', '台', '', '', '黑色', 'SONY', '', '', '', null, null, '');
INSERT INTO `goods` VALUES ('9', '2', '', '高能电池', '', '个', '', '', '', '', '', '', '', null, null, '');

-- ----------------------------
-- Table structure for `goodtypes`
-- ----------------------------
DROP TABLE IF EXISTS `goodtypes`;
CREATE TABLE `goodtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodtypes
-- ----------------------------
INSERT INTO `goodtypes` VALUES ('2', '17', '', '数码产品', '', '8');
INSERT INTO `goodtypes` VALUES ('15', '17', '', '电脑用品', '', '7');
INSERT INTO `goodtypes` VALUES ('16', '17', '', '办公用品', '', '5');
INSERT INTO `goodtypes` VALUES ('17', '0', '', '商品分类', '', '5');

-- ----------------------------
-- Table structure for `intercourses`
-- ----------------------------
DROP TABLE IF EXISTS `intercourses`;
CREATE TABLE `intercourses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intercourseTypeId` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `shortName` varchar(300) DEFAULT NULL,
  `fullName` varchar(300) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `addr` varchar(300) DEFAULT NULL,
  `postcode` varchar(6) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `fax` varchar(200) DEFAULT NULL,
  `www` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `answerMan` varchar(50) DEFAULT NULL,
  `contactMan` varchar(50) DEFAULT NULL,
  `licence` varchar(200) DEFAULT NULL,
  `bank` varchar(200) DEFAULT NULL,
  `taxCode` varchar(200) DEFAULT NULL,
  `account` varchar(200) DEFAULT NULL,
  `help` varchar(10) DEFAULT NULL,
  `recvCost` decimal(18,4) DEFAULT NULL,
  `payCost` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of intercourses
-- ----------------------------
INSERT INTO `intercourses` VALUES ('1', '1', '', '大洋集团', '', '', '', '515000', '', '', '', 'abc@gmail.com', '', '', '', '', '', '', 'dyjt', null, '40.0000');
INSERT INTO `intercourses` VALUES ('2', '2', 'p001', '南方电力', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'nfdl', '2020.2000', '7273.0000');
INSERT INTO `intercourses` VALUES ('3', '2', 'p002', '广州越秀', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'gzyx', null, '15099.2400');
INSERT INTO `intercourses` VALUES ('4', '1', '', '广州北现', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'gzbx', null, '2544.0000');

-- ----------------------------
-- Table structure for `intercoursetypes`
-- ----------------------------
DROP TABLE IF EXISTS `intercoursetypes`;
CREATE TABLE `intercoursetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of intercoursetypes
-- ----------------------------
INSERT INTO `intercoursetypes` VALUES ('1', '3', '002', '客户', '', '4');
INSERT INTO `intercoursetypes` VALUES ('2', '3', '003', '供应商', '', '5');
INSERT INTO `intercoursetypes` VALUES ('3', '0', '001', '往来单位', '', '3');

-- ----------------------------
-- Table structure for `measureunits`
-- ----------------------------
DROP TABLE IF EXISTS `measureunits`;
CREATE TABLE `measureunits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of measureunits
-- ----------------------------
INSERT INTO `measureunits` VALUES ('1', '001', '件', '');
INSERT INTO `measureunits` VALUES ('2', '002', '斤', '');
INSERT INTO `measureunits` VALUES ('4', '003', '支', '');
INSERT INTO `measureunits` VALUES ('5', '004', '千克', '');
INSERT INTO `measureunits` VALUES ('6', '005', '个', '');
INSERT INTO `measureunits` VALUES ('7', '006', '公斤', '');

-- ----------------------------
-- Table structure for `privileges`
-- ----------------------------
DROP TABLE IF EXISTS `privileges`;
CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `privilegeTypeId` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `urls` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privileges
-- ----------------------------
INSERT INTO `privileges` VALUES ('1', '10', '系统管理', '', '1', '/system/.*');

-- ----------------------------
-- Table structure for `privilegetypes`
-- ----------------------------
DROP TABLE IF EXISTS `privilegetypes`;
CREATE TABLE `privilegetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilegetypes
-- ----------------------------
INSERT INTO `privilegetypes` VALUES ('4', '业务处理', '', '1');
INSERT INTO `privilegetypes` VALUES ('5', '数据维护', '', '2');
INSERT INTO `privilegetypes` VALUES ('10', '系统管理', '', '3');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `privilegeIds` varchar(200) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `sessionId` varchar(200) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('3', '2', '4d33ad84-44d2-4391-95a0-80b64c1b815f', '2011-04-24 14:58:01');
INSERT INTO `sessions` VALUES ('5', '1', '88a462a4-0897-4995-8691-8c9c4d5fd510', '2012-03-20 17:21:51');

-- ----------------------------
-- Table structure for `stocks`
-- ----------------------------
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodId` int(11) DEFAULT NULL,
  `depotId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` decimal(18,4) DEFAULT NULL,
  `cost` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stocks
-- ----------------------------
INSERT INTO `stocks` VALUES ('1', '1', '2', '3', '3533.5933', '10600.7800');
INSERT INTO `stocks` VALUES ('2', '7', '2', '2', '1323.2300', '2646.4600');
INSERT INTO `stocks` VALUES ('4', '2', '2', '30', '2.0000', '60.0000');
INSERT INTO `stocks` VALUES ('7', '6', '2', '1', '3500.0000', '3500.0000');
INSERT INTO `stocks` VALUES ('8', '4', '1', '2', '10.0000', '20.0000');
INSERT INTO `stocks` VALUES ('9', '5', '1', '3', '1566.6667', '4700.0000');
INSERT INTO `stocks` VALUES ('10', '3', '1', '1', '23.0000', '23.0000');
INSERT INTO `stocks` VALUES ('11', '2', '1', '15', '2.0000', '30.0000');
INSERT INTO `stocks` VALUES ('12', '6', '1', '1', '2500.0000', '2500.0000');
INSERT INTO `stocks` VALUES ('15', '4', '22', '1', '800.0000', '800.0000');
INSERT INTO `stocks` VALUES ('16', '3', '22', '1', '10.0000', '10.0000');
INSERT INTO `stocks` VALUES ('17', '2', '22', '3', '2.2000', '6.6000');

-- ----------------------------
-- Table structure for `userroles`
-- ----------------------------
DROP TABLE IF EXISTS `userroles`;
CREATE TABLE `userroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userroles
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentId` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `moNumber` varchar(50) DEFAULT NULL,
  `shortNumber` varchar(50) DEFAULT NULL,
  `inTime` datetime DEFAULT NULL,
  `outTime` datetime DEFAULT NULL,
  `roleIds` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '4', '管理员', '女', 'admin', 'admin', '13800000001', '', '2011-04-12 00:00:00', null, '');
INSERT INTO `users` VALUES ('2', '2', '陈科长', '男', 'test', '123', '', '', null, null, '');
INSERT INTO `users` VALUES ('3', '3', '任我行', '', 'user1', '123', '', '', null, null, '');
