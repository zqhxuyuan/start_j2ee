/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2012-04-13 08:37:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'Jack', 'abc', '0', 'ss', 'temp@155.com', '1');
INSERT INTO `account` VALUES ('3', 'Jack', 'abc', '0', 'ss', 'temp@155.com', '1');
INSERT INTO `account` VALUES ('5', 'Jack', 'abc', '0', 'ss', 'temp@155.com', '1');
INSERT INTO `account` VALUES ('7', 'Jack', 'abc', '0', 'ss', 'temp@155.com', '1');
INSERT INTO `account` VALUES ('10', 'Zhangsan', '123123', '0', 'ss', 'temp@155.com', '1');
INSERT INTO `account` VALUES ('11', 'Jack', 'abc', '0', 'ss', 'temp@155.com', '1');
INSERT INTO `account` VALUES ('12', 'abcdef', '123132', '2', null, null, null);
INSERT INTO `account` VALUES ('13', 'abcdef', '123132', '2', null, null, null);
INSERT INTO `account` VALUES ('14', 'abcdef', '123132', '2', null, null, null);
INSERT INTO `account` VALUES ('15', 'abcdef', '123132', '2', null, null, null);

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `book_id` int(10) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(50) DEFAULT NULL,
  `book_author` varchar(50) DEFAULT NULL,
  `book_publish` varchar(50) DEFAULT NULL,
  `book_date` date DEFAULT NULL,
  `book_isbn` varchar(50) DEFAULT NULL,
  `book_page` varchar(50) DEFAULT NULL,
  `book_price` varchar(50) DEFAULT NULL,
  `book_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', 'book1', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('2', 'book2', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('3', 'book3', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('4', 'book4', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('5', 'book5', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('6', 'book6', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('7', 'book7', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('8', 'book8', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('9', 'book9', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('10', 'book10', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('11', 'book11', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('12', 'book12', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('13', 'book13', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('14', 'book14', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('15', 'book15', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('16', 'book16', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('17', 'book17', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('18', 'book18', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('19', 'book19', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('20', 'book20', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('21', 'book21', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('22', 'book22', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('23', 'book23', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('24', 'book24', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('25', 'book25', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('26', 'book26', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('27', 'book27', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('28', 'book28', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('29', 'book29', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('30', 'book30', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('31', 'book31', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('32', 'book32', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('33', 'book33', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('34', 'book34', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('35', 'book35', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('36', 'book36', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('37', 'book37', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('38', 'book38', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('39', 'book39', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('40', 'book40', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('41', 'book41', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('42', 'book42', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('43', 'book43', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('44', 'book44', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('45', 'book45', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('46', 'book46', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('47', 'book47', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('48', 'book48', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('49', 'book49', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('50', 'book50', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('51', 'book51', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('52', 'book52', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('53', 'book53', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('54', 'book54', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('55', 'book55', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('56', 'book56', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('57', 'book57', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('58', 'book58', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('59', 'book59', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('60', 'book60', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('61', 'book61', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('62', 'book62', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('63', 'book63', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('64', 'book64', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('65', 'book65', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('66', 'book66', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('67', 'book67', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('68', 'book68', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('69', 'book69', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('70', 'book70', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('71', 'book71', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('72', 'book72', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('73', 'book73', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('74', 'book74', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('75', 'book75', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('76', 'book76', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('77', 'book77', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('78', 'book78', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('79', 'book79', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('80', 'book80', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('81', 'book81', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('82', 'book82', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('83', 'book83', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('84', 'book84', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('85', 'book85', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('86', 'book86', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('87', 'book87', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('88', 'book88', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('89', 'book89', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('90', 'book90', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('91', 'book91', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('92', 'book92', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('93', 'book93', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('94', 'book94', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('95', 'book95', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('96', 'book96', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('97', 'book97', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('98', 'book98', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('99', 'book99', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('100', 'book100', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('101', 'book101', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('102', 'book102', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('103', 'book103', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('104', 'book104', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('105', 'book105', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('106', 'book106', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('107', 'book107', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('108', 'book108', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('109', 'book109', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('110', 'book110', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('111', 'book111', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('112', 'book112', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('113', 'book113', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('114', 'book114', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('115', 'book115', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('116', 'book116', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('117', 'book117', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('118', 'book118', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('119', 'book119', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('120', 'book120', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('121', 'book121', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('122', 'book122', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('123', 'book123', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('124', 'book124', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('125', 'book125', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('126', 'book126', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('127', 'book127', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('128', 'book128', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('129', 'book129', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('130', 'book130', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('131', 'book131', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('132', 'book132', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('133', 'book133', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('134', 'book134', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('135', 'book135', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('136', 'book136', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('137', 'book137', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('138', 'book138', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('139', 'book139', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('140', 'book140', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('141', 'book141', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('142', 'book142', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('143', 'book143', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('144', 'book144', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('145', 'book145', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('146', 'book146', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('147', 'book147', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('148', 'book148', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('149', 'book149', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('150', 'book150', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('151', 'book151', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('152', 'book152', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('153', 'book153', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('154', 'book154', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('155', 'book155', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('156', 'book156', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('157', 'book157', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('158', 'book158', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('159', 'book159', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('160', 'book160', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('161', 'book161', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('162', 'book162', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('163', 'book163', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('164', 'book164', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('165', 'book165', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('166', 'book166', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('167', 'book167', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('168', 'book168', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('169', 'book169', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('170', 'book170', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('171', 'book171', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('172', 'book172', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('173', 'book173', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('174', 'book174', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('175', 'book175', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('176', 'book176', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('177', 'book177', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('178', 'book178', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('179', 'book179', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('180', 'book180', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('181', 'book181', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('182', 'book182', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('183', 'book183', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('184', 'book184', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('185', 'book185', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('186', 'book186', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('187', 'book187', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('188', 'book188', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('189', 'book189', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('190', 'book190', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('191', 'book191', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('192', 'book192', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('193', 'book193', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('194', 'book194', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('195', 'book195', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('196', 'book196', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('197', 'book197', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('198', 'book198', null, null, null, null, null, null, null);
INSERT INTO `books` VALUES ('199', 'book199', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `state_id` smallint(6) NOT NULL,
  `city_name` varchar(50) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_state_id_city` (`state_id`),
  CONSTRAINT `fk_state_id_city` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', 'Acrelândia');
INSERT INTO `city` VALUES ('2', '1', 'Assis Brasil');
INSERT INTO `city` VALUES ('3', '1', 'Brasiléia');
INSERT INTO `city` VALUES ('4', '1', 'Bujari');
INSERT INTO `city` VALUES ('5', '1', 'Capixaba');
INSERT INTO `city` VALUES ('6', '1', 'Cruzeiro do Sul');
INSERT INTO `city` VALUES ('7', '1', 'Epitaciolândia');
INSERT INTO `city` VALUES ('23', '2', 'Água Branca');
INSERT INTO `city` VALUES ('24', '2', 'Anadia');
INSERT INTO `city` VALUES ('25', '2', 'Arapiraca');
INSERT INTO `city` VALUES ('26', '2', 'Atalaia');
INSERT INTO `city` VALUES ('27', '2', 'Barra de Santo Antônio');
INSERT INTO `city` VALUES ('28', '2', 'Barra de São Miguel');
INSERT INTO `city` VALUES ('29', '2', 'Batalha');
INSERT INTO `city` VALUES ('30', '2', 'Belém');
INSERT INTO `city` VALUES ('124', '3', 'Amapá');
INSERT INTO `city` VALUES ('125', '3', 'Calçoene');
INSERT INTO `city` VALUES ('126', '3', 'Cutias');
INSERT INTO `city` VALUES ('127', '3', 'Ferreira Gomes');
INSERT INTO `city` VALUES ('128', '3', 'Itaubal');
INSERT INTO `city` VALUES ('129', '3', 'Laranjal do Jari');
INSERT INTO `city` VALUES ('140', '4', 'Alvarães');
INSERT INTO `city` VALUES ('141', '4', 'Amaturá');
INSERT INTO `city` VALUES ('142', '4', 'namã');
INSERT INTO `city` VALUES ('143', '4', 'Anori');
INSERT INTO `city` VALUES ('144', '4', 'Apuí');
INSERT INTO `city` VALUES ('145', '4', 'Atalaia do Norte');
INSERT INTO `city` VALUES ('202', '5', 'Abaíra');
INSERT INTO `city` VALUES ('203', '5', 'Abaré');
INSERT INTO `city` VALUES ('204', '5', 'Acajutiba');
INSERT INTO `city` VALUES ('205', '5', 'Adustina');
INSERT INTO `city` VALUES ('206', '5', 'Água Fria');
INSERT INTO `city` VALUES ('207', '5', 'Aiquara');
INSERT INTO `city` VALUES ('208', '5', 'Alagoinhas');
INSERT INTO `city` VALUES ('209', '5', 'Alcobaça');
INSERT INTO `city` VALUES ('210', '5', 'Almadina');
INSERT INTO `city` VALUES ('211', '5', 'Amargosa');
INSERT INTO `city` VALUES ('617', '6', 'Abaiara');
INSERT INTO `city` VALUES ('618', '6', 'Acarapé');
INSERT INTO `city` VALUES ('619', '6', 'Acaraú');
INSERT INTO `city` VALUES ('620', '6', 'Acopiara');
INSERT INTO `city` VALUES ('621', '6', 'Aiuaba');
INSERT INTO `city` VALUES ('622', '6', 'Alcântaras');
INSERT INTO `city` VALUES ('623', '6', 'Altaneira');
INSERT INTO `city` VALUES ('624', '6', 'Alto Santo');
INSERT INTO `city` VALUES ('801', '7', 'Brasília');
INSERT INTO `city` VALUES ('802', '8', 'Afonso Cláudio');
INSERT INTO `city` VALUES ('803', '8', 'Água Doce do Norte');
INSERT INTO `city` VALUES ('804', '8', 'Águia Branca');
INSERT INTO `city` VALUES ('805', '8', 'Alegre');
INSERT INTO `city` VALUES ('806', '8', 'Alfredo Chaves');
INSERT INTO `city` VALUES ('807', '8', 'Alto Rio Novo');
INSERT INTO `city` VALUES ('808', '8', 'Anchieta');
INSERT INTO `city` VALUES ('809', '8', 'Apiacá');
INSERT INTO `city` VALUES ('810', '8', 'Aracruz');
INSERT INTO `city` VALUES ('879', '9', 'Abadia de Goiás');
INSERT INTO `city` VALUES ('880', '9', 'Abadiânia');
INSERT INTO `city` VALUES ('881', '9', 'Acreúna');
INSERT INTO `city` VALUES ('882', '9', 'Adelândia');
INSERT INTO `city` VALUES ('883', '9', 'Água Fria de Goiás');
INSERT INTO `city` VALUES ('884', '9', 'Água Limpa');
INSERT INTO `city` VALUES ('885', '9', 'Águas Lindas de Goiás');
INSERT INTO `city` VALUES ('886', '9', 'Alexânia');
INSERT INTO `city` VALUES ('887', '9', 'Aloândia');
INSERT INTO `city` VALUES ('888', '9', 'Alto Horizonte');
INSERT INTO `city` VALUES ('889', '9', 'Alto Paraíso de Goiás');
INSERT INTO `city` VALUES ('890', '9', 'Alvorada do Norte');
INSERT INTO `city` VALUES ('891', '9', 'Amaralina');
INSERT INTO `city` VALUES ('892', '9', 'Americano do Brasil');
INSERT INTO `city` VALUES ('893', '9', 'Amorinópolis');
INSERT INTO `city` VALUES ('894', '9', 'Anápolis');
INSERT INTO `city` VALUES ('895', '9', 'Anhanguera');
INSERT INTO `city` VALUES ('896', '9', 'Anicuns');
INSERT INTO `city` VALUES ('897', '9', 'Aparecida de Goiânia');
INSERT INTO `city` VALUES ('1121', '10', 'Açailândia');
INSERT INTO `city` VALUES ('1122', '10', 'Afonso Cunha');
INSERT INTO `city` VALUES ('1123', '10', 'Água Doce do Maranhão');
INSERT INTO `city` VALUES ('1124', '10', 'Alcântara');
INSERT INTO `city` VALUES ('1125', '10', 'Aldeias Altas');
INSERT INTO `city` VALUES ('1126', '10', 'Altamira do Maranhão');
INSERT INTO `city` VALUES ('1127', '10', 'Alto Alegre do Maranhão');
INSERT INTO `city` VALUES ('1128', '10', 'Alto Alegre do Pindaré');
INSERT INTO `city` VALUES ('1129', '10', 'Alto Parnaíba');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'fuzhou', 'ffcs');
INSERT INTO `company` VALUES ('2', 'fuzhou', 'ffcs');
INSERT INTO `company` VALUES ('3', 'fuzhou', 'ffcs');
INSERT INTO `company` VALUES ('4', 'fuzhou', 'ffcs');
INSERT INTO `company` VALUES ('5', 'fuzhou.china', 'FFCS');
INSERT INTO `company` VALUES ('6', 'fuzhou.china', 'FFCS');

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `CONTACT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTACT_EMAIL` varchar(255) NOT NULL,
  `CONTACT_NAME` varchar(255) NOT NULL,
  `CONTACT_PHONE` varchar(255) NOT NULL,
  PRIMARY KEY (`CONTACT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES ('1', 'contact0@loianetest.com', 'Contact0', '(000) 000-0000');
INSERT INTO `contact` VALUES ('2', 'contact1@loianetest.com', 'Contact1', '(000) 000-0000');
INSERT INTO `contact` VALUES ('3', 'contact2@loianetest.com', 'Contact2', '(000) 000-0000');
INSERT INTO `contact` VALUES ('4', 'contact3@loianetest.com', 'Contact3', '(000) 000-0000');
INSERT INTO `contact` VALUES ('5', 'contact4@loianetest.com', 'Contact4', '(000) 000-0000');
INSERT INTO `contact` VALUES ('6', 'contact5@loianetest.com', 'Contact5', '(000) 000-0000');
INSERT INTO `contact` VALUES ('7', 'contact6@loianetest.com', 'Contact6', '(000) 000-0000');
INSERT INTO `contact` VALUES ('8', 'contact7@loianetest.com', 'Contact7', '(000) 000-0000');
INSERT INTO `contact` VALUES ('9', 'contact8@loianetest.com', 'Contact8', '(000) 000-0000');
INSERT INTO `contact` VALUES ('10', 'contact9@loianetest.com', 'Contact9', '(000) 000-0000');
INSERT INTO `contact` VALUES ('11', 'contact10@loianetest.com', 'Contact10', '(000) 000-0000');
INSERT INTO `contact` VALUES ('12', 'contact11@loianetest.com', 'Contact11', '(000) 000-0000');
INSERT INTO `contact` VALUES ('13', 'contact12@loianetest.com', 'Contact12', '(000) 000-0000');
INSERT INTO `contact` VALUES ('14', 'contact13@loianetest.com', 'Contact13', '(000) 000-0000');
INSERT INTO `contact` VALUES ('15', 'contact14@loianetest.com', 'Contact14', '(000) 000-0000');
INSERT INTO `contact` VALUES ('16', 'contact15@loianetest.com', 'Contact15', '(000) 000-0000');
INSERT INTO `contact` VALUES ('17', 'contact16@loianetest.com', 'Contact16', '(000) 000-0000');
INSERT INTO `contact` VALUES ('18', 'contact17@loianetest.com', 'Contact17', '(000) 000-0000');
INSERT INTO `contact` VALUES ('19', 'contact18@loianetest.com', 'Contact18', '(000) 000-0000');
INSERT INTO `contact` VALUES ('20', 'contact19@loianetest.com', 'Contact19', '(000) 000-0000');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` smallint(6) NOT NULL,
  `country_code` char(2) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', 'BR', 'Brasil');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'departName');
INSERT INTO `department` VALUES ('2', 'departName');
INSERT INTO `department` VALUES ('3', 'departName');
INSERT INTO `department` VALUES ('4', 'departName');
INSERT INTO `department` VALUES ('5', 'departName');
INSERT INTO `department` VALUES ('6', 'departName');
INSERT INTO `department` VALUES ('7', 'departName');
INSERT INTO `department` VALUES ('8', 'departName');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `depart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4AFD4ACEA8B1432F` (`depart_id`),
  CONSTRAINT `FK4AFD4ACEA8B1432F` FOREIGN KEY (`depart_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'empName', '1');
INSERT INTO `employee` VALUES ('2', 'empName', '2');
INSERT INTO `employee` VALUES ('3', 'empName', '3');
INSERT INTO `employee` VALUES ('5', 'empName', '4');
INSERT INTO `employee` VALUES ('6', 'empName1', '5');
INSERT INTO `employee` VALUES ('7', 'empName2', '5');
INSERT INTO `employee` VALUES ('8', 'empName1', '6');
INSERT INTO `employee` VALUES ('9', 'empName2', '6');
INSERT INTO `employee` VALUES ('10', 'empName1', '7');
INSERT INTO `employee` VALUES ('11', 'empName2', '7');
INSERT INTO `employee` VALUES ('12', 'empName1', '8');
INSERT INTO `employee` VALUES ('13', 'empName2', '8');

-- ----------------------------
-- Table structure for `events`
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `EVENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EVENT_DATE` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('12', '2012-03-23 16:56:00', 'My Event');

-- ----------------------------
-- Table structure for `exttree`
-- ----------------------------
DROP TABLE IF EXISTS `exttree`;
CREATE TABLE `exttree` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `number` bigint(11) DEFAULT NULL,
  `leaf` int(4) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exttree
-- ----------------------------
INSERT INTO `exttree` VALUES ('1', '-1', 'Root', '0', '0', null);
INSERT INTO `exttree` VALUES ('2', '1', '音乐', '0', '0', null);
INSERT INTO `exttree` VALUES ('3', '2', '轻金属', '1', '1', null);
INSERT INTO `exttree` VALUES ('4', '2', '重金属', '2', '1', null);
INSERT INTO `exttree` VALUES ('5', '2', 'R&B', '3', '1', null);
INSERT INTO `exttree` VALUES ('6', '1', '体育', '0', '0', null);
INSERT INTO `exttree` VALUES ('7', '6', '篮球', '1', '1', null);
INSERT INTO `exttree` VALUES ('8', '6', '足球', '2', '1', null);
INSERT INTO `exttree` VALUES ('9', '6', '体操', '3', '1', null);
INSERT INTO `exttree` VALUES ('10', '1', '美食', '0', '0', null);
INSERT INTO `exttree` VALUES ('11', '10', '中国菜', '0', '0', null);
INSERT INTO `exttree` VALUES ('12', '11', '青椒找肉', '0', '1', null);
INSERT INTO `exttree` VALUES ('13', '10', '日本菜', '0', '0', null);
INSERT INTO `exttree` VALUES ('14', '13', '河夫烤鱼', '0', '1', null);
INSERT INTO `exttree` VALUES ('15', '10', '法国菜', '0', '0', null);
INSERT INTO `exttree` VALUES ('16', '15', '爆炒蜗牛', '0', '1', null);
INSERT INTO `exttree` VALUES ('17', '6', 'bball', '3', '1', 'test');

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
INSERT INTO `generator_table` VALUES ('ssh_beautiful_pk', '7');
INSERT INTO `generator_table` VALUES ('ssh_log_pk', '5');
INSERT INTO `generator_table` VALUES ('ssh_role_pk', '5');
INSERT INTO `generator_table` VALUES ('ssh_user_pk', '9');

-- ----------------------------
-- Table structure for `navigate`
-- ----------------------------
DROP TABLE IF EXISTS `navigate`;
CREATE TABLE `navigate` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `parentId` bigint(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `number` bigint(11) DEFAULT NULL,
  `leaf` int(4) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of navigate
-- ----------------------------
INSERT INTO `navigate` VALUES ('1', '0', 'fuzhou', '1', '0', null);
INSERT INTO `navigate` VALUES ('2', '1', '鼓楼', '2', '1', null);
INSERT INTO `navigate` VALUES ('3', '1', '晋安', '3', '1', null);
INSERT INTO `navigate` VALUES ('4', '0', 'xiamen', '1', '0', null);
INSERT INTO `navigate` VALUES ('5', '0', 'putian', '2', '0', '');
INSERT INTO `navigate` VALUES ('7', '5', 'xiuyu', '0', '1', '');

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `PERSON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PERSON_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('15', '0', 'Foo', 'Bar');
INSERT INTO `person` VALUES ('16', '0', 'Foo2', 'Bar2');

-- ----------------------------
-- Table structure for `person_email_addr`
-- ----------------------------
DROP TABLE IF EXISTS `person_email_addr`;
CREATE TABLE `person_email_addr` (
  `PERSON_ID` bigint(20) NOT NULL,
  `EMAIL_ADDR` varchar(255) DEFAULT NULL,
  KEY `FKA54215FE13FFF0A6` (`PERSON_ID`),
  CONSTRAINT `FKA54215FE13FFF0A6` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_email_addr
-- ----------------------------
INSERT INTO `person_email_addr` VALUES ('15', 'test1@g.cn');
INSERT INTO `person_email_addr` VALUES ('15', 'test2@g.cn');

-- ----------------------------
-- Table structure for `person_event`
-- ----------------------------
DROP TABLE IF EXISTS `person_event`;
CREATE TABLE `person_event` (
  `PERSON_ID` bigint(20) NOT NULL,
  `EVENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PERSON_ID`,`EVENT_ID`),
  KEY `FKAD91D910C4AEE6EE` (`EVENT_ID`),
  KEY `FKAD91D91013FFF0A6` (`PERSON_ID`),
  CONSTRAINT `FKAD91D91013FFF0A6` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`),
  CONSTRAINT `FKAD91D910C4AEE6EE` FOREIGN KEY (`EVENT_ID`) REFERENCES `events` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_event
-- ----------------------------
INSERT INTO `person_event` VALUES ('15', '12');
INSERT INTO `person_event` VALUES ('16', '12');

-- ----------------------------
-- Table structure for `ssh_beautiful`
-- ----------------------------
DROP TABLE IF EXISTS `ssh_beautiful`;
CREATE TABLE `ssh_beautiful` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `note` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssh_beautiful
-- ----------------------------
INSERT INTO `ssh_beautiful` VALUES ('1', 'beautiful', 'a beautiful bean');

-- ----------------------------
-- Table structure for `ssh_ext_level`
-- ----------------------------
DROP TABLE IF EXISTS `ssh_ext_level`;
CREATE TABLE `ssh_ext_level` (
  `levelid` int(10) NOT NULL AUTO_INCREMENT,
  `levelname` varchar(20) DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`levelid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssh_ext_level
-- ----------------------------
INSERT INTO `ssh_ext_level` VALUES ('1', 'test1', 'test1');
INSERT INTO `ssh_ext_level` VALUES ('2', 'test2', 'test2');
INSERT INTO `ssh_ext_level` VALUES ('3', 'test3', 'test3');
INSERT INTO `ssh_ext_level` VALUES ('4', 'test4', 'test4');
INSERT INTO `ssh_ext_level` VALUES ('5', 'test55', 'test5');
INSERT INTO `ssh_ext_level` VALUES ('6', 'test6', 'test6');

-- ----------------------------
-- Table structure for `ssh_ext_sort`
-- ----------------------------
DROP TABLE IF EXISTS `ssh_ext_sort`;
CREATE TABLE `ssh_ext_sort` (
  `id` int(10) DEFAULT NULL,
  `nodeid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL,
  `nodelevel` int(10) DEFAULT NULL,
  `bureauid` int(10) DEFAULT NULL,
  `labid` int(10) DEFAULT NULL,
  `categoryname` varchar(20) DEFAULT NULL,
  `show` smallint(2) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nodeid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssh_ext_sort
-- ----------------------------
INSERT INTO `ssh_ext_sort` VALUES ('1', '1', null, null, null, null, 'fujian', '1', null);
INSERT INTO `ssh_ext_sort` VALUES ('2', '2', '1', null, null, null, 'fuzhou', '1', null);
INSERT INTO `ssh_ext_sort` VALUES ('3', '3', '1', null, null, null, 'xiamen', '1', null);
INSERT INTO `ssh_ext_sort` VALUES ('4', '4', null, null, null, null, 'guangdong', '1', null);
INSERT INTO `ssh_ext_sort` VALUES ('5', '5', '4', null, null, null, 'guangzhou', '1', null);

-- ----------------------------
-- Table structure for `ssh_log`
-- ----------------------------
DROP TABLE IF EXISTS `ssh_log`;
CREATE TABLE `ssh_log` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `loginname` varchar(20) DEFAULT NULL,
  `methodname` varchar(20) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `logtime` datetime DEFAULT NULL,
  `success` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssh_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ssh_role`
-- ----------------------------
DROP TABLE IF EXISTS `ssh_role`;
CREATE TABLE `ssh_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssh_role
-- ----------------------------
INSERT INTO `ssh_role` VALUES ('1', 'root');
INSERT INTO `ssh_role` VALUES ('4', 'system');

-- ----------------------------
-- Table structure for `ssh_user`
-- ----------------------------
DROP TABLE IF EXISTS `ssh_user`;
CREATE TABLE `ssh_user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssh_user
-- ----------------------------
INSERT INTO `ssh_user` VALUES ('1', 'Lily', 'root', '1');
INSERT INTO `ssh_user` VALUES ('2', 'Nana', 'root', '4');
INSERT INTO `ssh_user` VALUES ('3', 'John', 'root', '1');
INSERT INTO `ssh_user` VALUES ('8', 'test', 'ttt', '4');

-- ----------------------------
-- Table structure for `state`
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `state_id` smallint(6) NOT NULL,
  `country_id` smallint(6) NOT NULL,
  `state_code` char(2) NOT NULL,
  `state_name` varchar(50) NOT NULL,
  PRIMARY KEY (`state_id`),
  KEY `fk_country_id_state` (`country_id`),
  CONSTRAINT `fk_country_id_state` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES ('1', '1', 'AC', 'Acre');
INSERT INTO `state` VALUES ('2', '1', 'AL', 'Alagoas');
INSERT INTO `state` VALUES ('3', '1', 'AP', 'Amapá');
INSERT INTO `state` VALUES ('4', '1', 'AM', 'Amazonas');
INSERT INTO `state` VALUES ('5', '1', 'BA', 'Bahia');
INSERT INTO `state` VALUES ('6', '1', 'CE', 'Ceará');
INSERT INTO `state` VALUES ('7', '1', 'DF', 'Distrito Federal');
INSERT INTO `state` VALUES ('8', '1', 'ES', 'Espírito Santo');
INSERT INTO `state` VALUES ('9', '1', 'GO', 'Goiás');
INSERT INTO `state` VALUES ('10', '1', 'MA', 'Maranhão');

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `registerDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'test111', 'zqhxuyuan@gmail.com', 'test111', '2012-03-20 12:39:50');

-- ----------------------------
-- Table structure for `t_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '1', 'dept1');

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `id` bigint(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', '1332247089813', '2012-03-20 20:38:09', 'test', 'hello\n');
INSERT INTO `t_message` VALUES ('2', '1332247100973', '2012-03-20 20:38:20', 'just', 'how are you\n');
INSERT INTO `t_message` VALUES ('3', '1332247127319', '2012-03-20 20:38:47', 'zqhxuyuan', 'good\n');
INSERT INTO `t_message` VALUES ('4', '1332247134456', '2012-03-20 20:38:54', 'just', 'is ');
INSERT INTO `t_message` VALUES ('5', '1332247140634', '2012-03-20 20:39:00', 'just', 'hi');
INSERT INTO `t_message` VALUES ('6', '1332247143752', '2012-03-20 20:39:03', 'just', 'age');
INSERT INTO `t_message` VALUES ('7', '1332247163570', '2012-03-20 20:39:23', 'just', 'good morning');
INSERT INTO `t_message` VALUES ('8', '1332247202566', '2012-03-20 20:40:02', 'just', 'bolo');
INSERT INTO `t_message` VALUES ('9', '1332247204427', '2012-03-20 20:40:04', 'just', 'ss');
INSERT INTO `t_message` VALUES ('10', '1332247206907', '2012-03-20 20:40:06', 'just', 'aag');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '111', '111', '11', '2012-03-07', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `dept` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test1', null, null, null, null, null);
INSERT INTO `user` VALUES ('2', 'test2', null, null, null, null, null);
INSERT INTO `user` VALUES ('3', 'test3', null, null, null, null, null);
INSERT INTO `user` VALUES ('4', 'test4', null, null, null, null, null);
INSERT INTO `user` VALUES ('5', 'test5', null, null, null, null, null);
INSERT INTO `user` VALUES ('6', 'test6', null, null, null, null, null);
INSERT INTO `user` VALUES ('7', 'test7', null, null, null, null, null);
INSERT INTO `user` VALUES ('8', 'test8', null, null, null, null, null);
INSERT INTO `user` VALUES ('9', 'test9', null, null, null, null, null);
INSERT INTO `user` VALUES ('10', 'test10', null, null, null, null, null);
INSERT INTO `user` VALUES ('11', 'test11', null, null, null, null, null);
INSERT INTO `user` VALUES ('12', 'test12', null, null, null, null, null);
INSERT INTO `user` VALUES ('13', 'test13', null, null, null, null, null);
INSERT INTO `user` VALUES ('14', 'test14', null, null, null, null, null);
INSERT INTO `user` VALUES ('15', 'test15', null, null, null, null, null);
INSERT INTO `user` VALUES ('16', 'test16', null, null, null, null, null);
INSERT INTO `user` VALUES ('17', 'test17', null, null, null, null, null);
INSERT INTO `user` VALUES ('18', 'test18', null, null, null, null, null);
INSERT INTO `user` VALUES ('19', 'test19', null, null, null, null, null);
INSERT INTO `user` VALUES ('20', 'test20', null, null, null, null, null);
INSERT INTO `user` VALUES ('21', 'test21', null, null, null, null, null);
INSERT INTO `user` VALUES ('22', 'test22', null, null, null, null, null);
INSERT INTO `user` VALUES ('23', 'test23', null, null, null, null, null);
INSERT INTO `user` VALUES ('24', 'test24', null, null, null, null, null);
INSERT INTO `user` VALUES ('25', 'test25', null, null, null, null, null);
INSERT INTO `user` VALUES ('26', 'test26', null, null, null, null, null);
INSERT INTO `user` VALUES ('27', 'test27', null, null, null, null, null);
INSERT INTO `user` VALUES ('28', 'test28', null, null, null, null, null);
INSERT INTO `user` VALUES ('29', 'test29', null, null, null, null, null);
INSERT INTO `user` VALUES ('30', 'test30', null, null, null, null, null);
INSERT INTO `user` VALUES ('31', 'test31', null, null, null, null, null);

-- ----------------------------
-- Procedure structure for `proc_batch_insert`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_batch_insert`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_batch_insert`()
BEGIN
	DECLARE i int default 1;
    WHILE(i < 200) DO
        insert into books (book_name) values (concat('book',i));
        SET i = i+1;
    END WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `proc_insert_bigdata`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_insert_bigdata`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insert_bigdata`()
BEGIN
	DECLARE i int default 1;
    WHILE(i < 1000) DO
        insert into bigdata (id, name,pwd,email) values (i, concat('name_',i),CONCAT('pwd_',i), CONCAT('test',i,'@g.cn'));
        SET i = i+1;
    END WHILE;
END
;;
DELIMITER ;
