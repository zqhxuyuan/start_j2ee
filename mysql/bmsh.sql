/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : bmsh

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2012-04-13 08:36:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_book`
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `press` varchar(100) DEFAULT NULL,
  `publicationDate` datetime DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `editionNo` varchar(50) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `categoryName` varchar(50) DEFAULT NULL,
  `wordCount` varchar(50) DEFAULT NULL,
  `pageCount` varchar(50) DEFAULT NULL,
  `bookSize` varchar(50) DEFAULT NULL,
  `paper` varchar(50) DEFAULT NULL,
  `pack` varchar(50) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `editorRecommend` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `authorDesc` varchar(1000) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `currentReaderId` int(11) DEFAULT NULL,
  `currentReader` varchar(50) DEFAULT NULL,
  `logId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('158', 'Think In Java', 'Jack chen', '电子工业出版社', '0000-00-00 00:00:00', '100', '1', '22545215412', '55', '程序设计', '20万', '900', '16开', '铜版纸', '平装', 'uploads/cover/644257.jpg', '深圳分公司人保业务部', '2', '1', '3', '0', '17', '赵本山', '55');
INSERT INTO `t_book` VALUES ('159', 'Struts2 开发详解', '孙鑫', '人民出版社', '0000-00-00 00:00:00', '79', '4', '888545212154', '55', '程序设计', '30万', '900', '16', '普通', '平装', 'uploads/cover/911289.jpg', '湖南分公司冷水江业务部', '', '', '', '1', '0', '', '51');
INSERT INTO `t_book` VALUES ('160', 'Java Web 开发详解', '孙鑫', '电子工业出版社', '0000-00-00 00:00:00', '79', '1', '5521254521', '55', '程序设计', '20万', '9000', '16万', '普通', '精装', 'uploads/cover/442166.jpg', '深圳分公司民安业务部', '2', '1', '3', '0', '7', '张信哲', '54');
INSERT INTO `t_book` VALUES ('161', 'Javascript 高级程序设计', '廖瀚卿', '邮电出版社', '0000-00-00 00:00:00', '100', '1', '552545212541', '55', '程序设计', '30万', '1001', '16', '铜版纸', '精装', 'uploads/cover/944142.jpg', '深圳分公司车险业务部', '2', '1', '3', '0', '18', '孙红雷', '52');
INSERT INTO `t_book` VALUES ('162', 'a', 'e', 'aa', '0000-00-00 00:00:00', '200', 'e', 'ww', '15', '程序设计', '12', '322', '23', 'r', '2', 'uploads/cover/525884.jpg', '深圳分公司太保业务部人保业务部', '1312313', '31231231', '123123123131123', '1', '0', null, '0');
INSERT INTO `t_book` VALUES ('163', '致加西亚的一封信', '[美]艾尔伯特　?　哈伯德', '浙江文艺出版社', '0000-00-00 00:00:00', '15', '2008年7月第3次印刷', '978-7-5339-2419-5', '14', '程序设计', '90千字', '160', '800x1230 1/32', '普通', '精装', 'uploads/cover/765359.jpg', '深圳分公司人保业务部', 'aa', 'aa', 'a', '1', '0', null, '0');
INSERT INTO `t_book` VALUES ('164', '网络编程技术与实现', '', '清华', null, '59', '', '', '55', '程序设计', '', '', '', '', '', null, '深圳分公司太保业务部', '网络编程技术与实现', '网络编程技术与实现', '网络编程技术与实现', '1', null, null, null);

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(50) DEFAULT NULL,
  `subjectId` int(11) DEFAULT NULL,
  `subjectName` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('13', '小说', '1', '文学', null);
INSERT INTO `t_category` VALUES ('14', '世界名著', '1', '文学', null);
INSERT INTO `t_category` VALUES ('15', '散文', '1', '文学', null);
INSERT INTO `t_category` VALUES ('16', '传记', '1', '文学', null);
INSERT INTO `t_category` VALUES ('17', '武侠', '1', '文学', null);
INSERT INTO `t_category` VALUES ('18', '网络小说', '1', '文学', null);
INSERT INTO `t_category` VALUES ('19', '推理', '1', '文学', null);
INSERT INTO `t_category` VALUES ('20', '言情', '1', '文学', null);
INSERT INTO `t_category` VALUES ('21', '文学', '1', '文学', null);
INSERT INTO `t_category` VALUES ('22', '诗歌词曲', '1', '文学', null);
INSERT INTO `t_category` VALUES ('23', '青春', '1', '文学', null);
INSERT INTO `t_category` VALUES ('24', '动慢', '1', '文学', null);
INSERT INTO `t_category` VALUES ('25', '管理学', '2', '管理', null);
INSERT INTO `t_category` VALUES ('26', '企管', '2', '管理', null);
INSERT INTO `t_category` VALUES ('27', '营销', '2', '管理', null);
INSERT INTO `t_category` VALUES ('28', '企业家', '2', '管理', null);
INSERT INTO `t_category` VALUES ('29', '销售', '2', '管理', null);
INSERT INTO `t_category` VALUES ('30', '经济', '2', '管理', null);
INSERT INTO `t_category` VALUES ('31', '投资', '2', '管理', null);
INSERT INTO `t_category` VALUES ('32', '理财', '2', '管理', null);
INSERT INTO `t_category` VALUES ('33', '职称', '2', '管理', null);
INSERT INTO `t_category` VALUES ('34', '家居', '3', '生活', null);
INSERT INTO `t_category` VALUES ('35', '美食', '3', '生活', null);
INSERT INTO `t_category` VALUES ('36', '旅游', '3', '生活', null);
INSERT INTO `t_category` VALUES ('37', '娱乐时尚', '3', '生活', null);
INSERT INTO `t_category` VALUES ('38', '家庭', '3', '生活', null);
INSERT INTO `t_category` VALUES ('39', '健康', '3', '生活', null);
INSERT INTO `t_category` VALUES ('40', '两性', '3', '生活', null);
INSERT INTO `t_category` VALUES ('41', '孕产知识', '3', '生活', null);
INSERT INTO `t_category` VALUES ('42', '哲学', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('43', '宗教', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('44', '艺术', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('45', '历史', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('46', '地理', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('47', '社科', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('48', '政治', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('49', '军事', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('50', '法律', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('51', '心理学', '7', '人文社科', null);
INSERT INTO `t_category` VALUES ('52', '家庭与办公', '9', '计算机与网络', null);
INSERT INTO `t_category` VALUES ('53', '图形图像', '9', '计算机与网络', null);
INSERT INTO `t_category` VALUES ('54', '操作系统', '9', '计算机与网络', null);
INSERT INTO `t_category` VALUES ('55', '程序设计', '9', '计算机与网络', null);
INSERT INTO `t_category` VALUES ('56', '数据库', '9', '计算机与网络', null);
INSERT INTO `t_category` VALUES ('57', '软件工程', '9', '计算机与网络', null);
INSERT INTO `t_category` VALUES ('58', '建筑', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('59', '农林', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('60', '化工', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('61', '水利', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('62', '机械', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('63', '交通', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('64', '医学', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('65', '电工技术', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('66', '电子与通讯', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('67', '科学与自然', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('68', '外语', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('69', '考试', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('70', '教辅', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('71', '教材', '10', '教育/科技', null);
INSERT INTO `t_category` VALUES ('72', '低幼', '11', '少儿', null);
INSERT INTO `t_category` VALUES ('73', '儿童/青少年', '11', '少儿', null);
INSERT INTO `t_category` VALUES ('74', '游戏', '11', '少儿', null);
INSERT INTO `t_category` VALUES ('75', '童话', '11', '少儿', null);
INSERT INTO `t_category` VALUES ('76', '工具书', '12', '特色类别', null);
INSERT INTO `t_category` VALUES ('77', '古典', '12', '特色类别', null);
INSERT INTO `t_category` VALUES ('78', '杂志', '12', '特色类别', null);
INSERT INTO `t_category` VALUES ('79', '进口原版', '12', '特色类别', null);

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `companyId` int(11) NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `tellPhone` varchar(50) DEFAULT NULL,
  `leader` varchar(50) DEFAULT NULL,
  `mobilePhone` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('16', '深圳分公司', '天安数码城', '0755-25852585', '刘德华', '15989300244', null);
INSERT INTO `t_company` VALUES ('17', '北京分公司', '北京人民路', '010-22121254', '张三', '13545254525', null);
INSERT INTO `t_company` VALUES ('18', '上海分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('19', '湖南分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('20', '长沙分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('21', '天津分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('22', '山东分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('23', '青岛分公司', 'd黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('24', '云南分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('26', '重庆分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('28', '浙江分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('29', 'd河南分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('30', '湖北分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('31', '贵州分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('32', '南京分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('33', '江西分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('34', '山西分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('35', '陕西分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('36', '广东分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('37', '佛山分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('38', '东莞分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('39', '广州分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('40', '长安分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('41', '河北分公司', '黄浦江公寓', '021-554544154', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('43', '黑龙江分公司', '黑龙江自治区', '021-55422512', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('44', '江苏分公司', '江苏某某地方', '0451-545251542', '过大', '15989300244', null);
INSERT INTO `t_company` VALUES ('45', '苏州分公司', '苏州某某地方', '0221-55632554', '过大', '15989300244', null);

-- ----------------------------
-- Table structure for `t_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `deptId` int(11) NOT NULL,
  `deptName` varchar(100) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `tellPhone` varchar(50) DEFAULT NULL,
  `leader` varchar(50) DEFAULT NULL,
  `mobilePhone` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('14', '平安业务部', '29', '河南分公司', 'ºþÄÏ³¤É³Å£±Æb', '0731-15485454', 'ÁÎå«Çä', '15989300244', '²»µÃÁËÏ±¸¾\r');
INSERT INTO `t_dept` VALUES ('15', '太平事业部', '43', '黑龙江分公司', 'sa', 'dfas', 'dfas', 'dfas', 'dfasdfasdf\r');
INSERT INTO `t_dept` VALUES ('20', '太保业务部', '16', '深圳分公司', '1d', '1', '1', '1', '1\r');
INSERT INTO `t_dept` VALUES ('21', '车险业务部', '17', '北京分公司', 'asdfd', 'asdf', 'asdf', 'asd', 'fasdfasdf\r');
INSERT INTO `t_dept` VALUES ('25', '人保业务部', '16', '深圳分公司', 'asdfa', 'sdf', 'asdfasd', 'fasd', 'fasdfasdf\r');
INSERT INTO `t_dept` VALUES ('27', '太平业务部', '38', '东莞分公司', 'asdfa', 'sdf', 'asdfasd', 'fasd', 'fasdfasdf\r');
INSERT INTO `t_dept` VALUES ('28', '民安业务部', '16', '深圳分公司', 'asdfaa', 'sdfa', 'asdfasda', 'fasd', 'fasdfasdf3\r');
INSERT INTO `t_dept` VALUES ('29', '新化业务部', '19', '湖南分公司', 'asdf', 'asdf', 'asdfa', 'sdfa', 'sdfasdf\r');
INSERT INTO `t_dept` VALUES ('31', '娄底业务部', '19', '湖南分公司', '234d', '423423', '3423', '42', '34234234\r');
INSERT INTO `t_dept` VALUES ('32', '郑州业务部', '19', '湖南分公司', '234', '423423', '3423', '42', '34234234\r');
INSERT INTO `t_dept` VALUES ('33', '攀枝花业务部', '19', '湖南分公司', '234', '423423', '3423', '42', '34234234\r');
INSERT INTO `t_dept` VALUES ('34', '冷水江业务部', '19', '湖南分公司', '234', '423423', '3423', '42', '34234234\r');
INSERT INTO `t_dept` VALUES ('35', '涟源业务部', '19', '湖南分公司', '234', '423423', '3423', '42', '34234234\r');
INSERT INTO `t_dept` VALUES ('36', '双峰业务部', '19', '湖南分公司', '234', '423423', '3423', '42', '34234234\r');
INSERT INTO `t_dept` VALUES ('38', '衡阳业务部', '19', '湖南分公司', '234', '423423', '3423', '42', '34234234\r');
INSERT INTO `t_dept` VALUES ('39', '郴州业务部', '19', '湖南分公司', '234', '423423', '3423', '42', '34234234\r');
INSERT INTO `t_dept` VALUES ('40', '湘潭业务部', '19', '湖南分公司', '234', '423423', '3423', '42', '34234234\r');
INSERT INTO `t_dept` VALUES ('41', '怀化业务部', '19', '湖南分公司', '234', '423423', '3423', '42', '34234234\r');

-- ----------------------------
-- Table structure for `t_duty`
-- ----------------------------
DROP TABLE IF EXISTS `t_duty`;
CREATE TABLE `t_duty` (
  `dutyId` int(11) NOT NULL,
  `dutyName` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dutyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_duty
-- ----------------------------
INSERT INTO `t_duty` VALUES ('1', '公估师', '做好一个公估师');
INSERT INTO `t_duty` VALUES ('2', '查勘员', '查勘员');
INSERT INTO `t_duty` VALUES ('3', '客服', '漂亮的客服');
INSERT INTO `t_duty` VALUES ('4', '分公司经理', '牛逼');
INSERT INTO `t_duty` VALUES ('5', '部门经理', '也很牛逼');

-- ----------------------------
-- Table structure for `t_loanlog`
-- ----------------------------
DROP TABLE IF EXISTS `t_loanlog`;
CREATE TABLE `t_loanlog` (
  `logId` int(11) NOT NULL,
  `bookId` int(11) DEFAULT NULL,
  `bookName` varchar(100) DEFAULT NULL,
  `loanTime` datetime DEFAULT NULL,
  `loanDays` int(11) DEFAULT NULL,
  `preReturnTime` datetime DEFAULT NULL,
  `returnTime` datetime DEFAULT NULL,
  `readerId` int(11) DEFAULT NULL,
  `reader` varchar(50) DEFAULT NULL,
  `loannerId` int(11) DEFAULT NULL,
  `loanner` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loanlog
-- ----------------------------
INSERT INTO `t_loanlog` VALUES ('43', '158', 'Think In Java', '2008-10-12 16:32:32', '3', '2008-10-15 00:00:00', '2008-10-12 16:34:50', '7', 'ÕÅÐÅÕÜ', '8', 'ÁõµÂ»ª\r');
INSERT INTO `t_loanlog` VALUES ('44', '159', 'Struts2 权威指南', '2008-10-12 16:32:51', '5', '2008-10-17 00:00:00', '2008-10-12 16:34:45', '12', '??????', '8', '??????\r');
INSERT INTO `t_loanlog` VALUES ('45', '160', 'Java Web 开发详解', '2008-10-12 16:33:17', '2', '2008-10-14 00:00:00', '2008-10-12 16:34:40', '28', '????', '8', '??????\r');
INSERT INTO `t_loanlog` VALUES ('46', '161', 'Javascript 高级程序设计', '2008-10-12 16:33:30', '2', '2008-10-14 00:00:00', '2008-10-12 16:34:33', '15', '?????×', '8', '??????\r');
INSERT INTO `t_loanlog` VALUES ('47', '158', 'Think In Java', '2008-10-12 16:35:03', '6', '2008-10-18 00:00:00', '2008-10-13 17:14:35', '26', '³ÂÖ¾ÎÄ', '8', 'ÁõµÂ»ª\r');
INSERT INTO `t_loanlog` VALUES ('48', '158', 'Think In Java', '2008-10-13 17:15:41', '3', '2008-10-16 00:00:00', '2008-10-12 17:15:53', '15', 'ÖÜ½ÜÂ×', '8', 'ÁõµÂ»ª\r');
INSERT INTO `t_loanlog` VALUES ('49', '159', 'Struts2 开发指南', '2008-10-12 17:54:13', '2', '2008-10-14 00:00:00', '2008-10-13 09:19:27', '15', '?????×', '8', '??????\r');
INSERT INTO `t_loanlog` VALUES ('50', '160', 'Java Web 开发详解', '2008-10-12 22:15:00', '5', '2008-10-17 00:00:00', '0000-00-00 00:00:00', '17', '??±???', '12', '??????\r');
INSERT INTO `t_loanlog` VALUES ('51', '159', 'Struts2 指南', '2008-10-13 09:21:04', '29', '2008-11-11 00:00:00', '2008-10-20 11:32:41', '15', '?????×', '12', '??????\r');
INSERT INTO `t_loanlog` VALUES ('52', '161', 'Javascript 开发详解', '2008-10-14 10:08:53', '10', '2008-10-24 00:00:00', '0000-00-00 00:00:00', '18', '???ì?×', '12', '??????\r');
INSERT INTO `t_loanlog` VALUES ('53', '158', 'Think In Java', '2008-11-12 15:25:37', '7', '2008-11-19 00:00:00', '2008-11-12 15:25:41', '28', 'ËïÙ³', '12', 'ÁÎå«Çä\r');
INSERT INTO `t_loanlog` VALUES ('54', '160', 'Java Web 指南', '2008-11-12 15:56:35', '6', '2008-11-18 00:00:00', '0000-00-00 00:00:00', '7', '??????', '12', '??????\r');
INSERT INTO `t_loanlog` VALUES ('55', '158', 'Think In Java', '2008-12-28 09:24:40', '3', '2008-12-31 00:00:00', '0000-00-00 00:00:00', '17', 'ÕÔ±¾É½', '18', 'ËïºìÀ×\r');

-- ----------------------------
-- Table structure for `t_subject`
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `subjectId` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`subjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES ('1', '文学', 'xxxxx');
INSERT INTO `t_subject` VALUES ('2', '管理', '中国');
INSERT INTO `t_subject` VALUES ('3', '生活', 'wwwwww');
INSERT INTO `t_subject` VALUES ('7', '人文社科', 'd');
INSERT INTO `t_subject` VALUES ('9', '计算机与网络', '天');
INSERT INTO `t_subject` VALUES ('10', '教育/科技', '');
INSERT INTO `t_subject` VALUES ('11', '少儿', '');
INSERT INTO `t_subject` VALUES ('12', '特色类别', '');
INSERT INTO `t_subject` VALUES ('13', '地理', '');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL,
  `emplName` varchar(50) DEFAULT NULL,
  `emplNo` varchar(50) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `deptName` varchar(50) DEFAULT NULL,
  `manager` bit(1) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('7', '张信哲', '89757', '15932541254', '0', '33', 'd', '0', '18', '0', '25', '', '2');
INSERT INTO `t_user` VALUES ('8', '张信哲', '89777', '13124542412', '0', '40', 'b', '0', '19', '0', '39', '', '5');
INSERT INTO `t_user` VALUES ('11', '张信哲', 'e', '13713878116', '0', '3', 'e', '0', '19', '0', '32', '', '1');
INSERT INTO `t_user` VALUES ('12', '张信哲', '2342', '4234234234', '0', '23', 'a', '0', '18', '0', '27', '', '2');
INSERT INTO `t_user` VALUES ('15', '张信哲', '2342', '4234234234', '0', '23', 'axx', '0', '17', '0', '25', '', '2');
INSERT INTO `t_user` VALUES ('16', '张信哲', '12', '12', '0', '12', '1', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('17', '张信哲', '12', '12', '0', '12', '2', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('18', '张信哲', '12', '12', '0', '12', '3', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('19', '张信哲', '12', '12', '0', '12', '4', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('20', '张信哲', '12', '12', '0', '12', '5', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('21', '张信哲', '12', '12', '0', '12', '6', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('22', '张信哲', '12', '12', '0', '12', '7', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('23', '张信哲', '12', '12', '0', '12', '8', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('24', '张信哲', '12', '12', '0', '12', '9', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('25', '张信哲', '12', '12', '0', '12', '0', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('26', '张信哲', '12', '12', '0', '12', '10', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('27', '张信哲', '12', '12', '0', '12', '11', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('28', '张信哲', '12', '12', '0', '12', '12', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('29', '张信哲', '12', '12', '0', '12', '13', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('30', '张信哲', '12', '12', '0', '12', '14', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('31', '12', '12', '12', '0', '12', '15', '111111', '17', '0', '21', '', '3');
INSERT INTO `t_user` VALUES ('32', '312', '12', '123', '0', '12', '16', '111111', '19', '0', '40', '', '2');
INSERT INTO `t_user` VALUES ('35', '3', '3', '3', '0', '3', '233', '333333', '17', '0', '21', '', '2');
INSERT INTO `t_user` VALUES ('37', '张信哲', '3', '2323', '0', '23', 'd3', '0', '16', '0', '27', '', '1');
