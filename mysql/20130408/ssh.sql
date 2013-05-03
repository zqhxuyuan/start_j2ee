/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2013-04-19 14:10:15
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
-- Table structure for `acl_class`
-- ----------------------------
DROP TABLE IF EXISTS `acl_class`;
CREATE TABLE `acl_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_class
-- ----------------------------
INSERT INTO `acl_class` VALUES ('2', 'com.xuyuan.spring3.recipes.security.board.domain.Message');

-- ----------------------------
-- Table structure for `acl_entry`
-- ----------------------------
DROP TABLE IF EXISTS `acl_entry`;
CREATE TABLE `acl_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACL_OBJECT_IDENTITY` bigint(20) NOT NULL,
  `ACE_ORDER` int(11) NOT NULL,
  `SID` bigint(20) NOT NULL,
  `MASK` int(11) NOT NULL,
  `GRANTING` smallint(6) NOT NULL,
  `AUDIT_SUCCESS` smallint(6) NOT NULL,
  `AUDIT_FAILURE` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_entry
-- ----------------------------
INSERT INTO `acl_entry` VALUES ('7', '4', '0', '5', '16', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('8', '4', '1', '3', '8', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('9', '4', '2', '4', '1', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('13', '6', '0', '5', '16', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('14', '6', '1', '3', '8', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('15', '6', '2', '4', '1', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('16', '7', '0', '2', '16', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('17', '7', '1', '3', '8', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('18', '7', '2', '4', '1', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('19', '8', '0', '6', '16', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('20', '8', '1', '3', '8', '1', '0', '0');
INSERT INTO `acl_entry` VALUES ('21', '8', '2', '4', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for `acl_object_identity`
-- ----------------------------
DROP TABLE IF EXISTS `acl_object_identity`;
CREATE TABLE `acl_object_identity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `OBJECT_ID_CLASS` bigint(20) NOT NULL,
  `OBJECT_ID_IDENTITY` bigint(20) NOT NULL,
  `PARENT_OBJECT` bigint(20) DEFAULT NULL,
  `OWNER_SID` bigint(20) DEFAULT NULL,
  `ENTRIES_INHERITING` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_object_identity
-- ----------------------------
INSERT INTO `acl_object_identity` VALUES ('4', '2', '1354672897484', null, '5', '1');
INSERT INTO `acl_object_identity` VALUES ('6', '2', '1354673308062', null, '2', '1');
INSERT INTO `acl_object_identity` VALUES ('7', '2', '1354673320500', null, '2', '1');
INSERT INTO `acl_object_identity` VALUES ('8', '2', '1354673348531', null, '5', '1');

-- ----------------------------
-- Table structure for `acl_sid`
-- ----------------------------
DROP TABLE IF EXISTS `acl_sid`;
CREATE TABLE `acl_sid` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `sid` varchar(100) NOT NULL,
  `PRINCIPAL` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_sid
-- ----------------------------
INSERT INTO `acl_sid` VALUES ('2', 'test1', '1');
INSERT INTO `acl_sid` VALUES ('3', 'ROLE_ADMIN', '0');
INSERT INTO `acl_sid` VALUES ('4', 'ROLE_USER', '0');
INSERT INTO `acl_sid` VALUES ('5', 'admin', '1');
INSERT INTO `acl_sid` VALUES ('6', 'test2', '1');
INSERT INTO `acl_sid` VALUES ('7', 'Ray', '1');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL DEFAULT '',
  `author` int(11) DEFAULT '0',
  `publish_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('0', 'Greg Wilson');
INSERT INTO `author` VALUES ('1', 'Andy Oram');
INSERT INTO `author` VALUES ('2', 'Joel Spolsky');
INSERT INTO `author` VALUES ('3', 'Herve This-Benckhard');
INSERT INTO `author` VALUES ('4', 'Richard Helm');
INSERT INTO `author` VALUES ('5', 'Ralph Johnson');
INSERT INTO `author` VALUES ('6', 'John Vlissides');
INSERT INTO `author` VALUES ('7', 'Erich Gamma');
INSERT INTO `author` VALUES ('8', 'Tad Williams');
INSERT INTO `author` VALUES ('9', 'Charlotte Roche');
INSERT INTO `author` VALUES ('10', 'Anthony Bourdain');
INSERT INTO `author` VALUES ('11', 'Kerstin Jakten');
INSERT INTO `author` VALUES ('12', 'Dirk Huth');
INSERT INTO `author` VALUES ('13', 'Douglas R. Hofstadter');
INSERT INTO `author` VALUES ('14', 'Hans Lenk');
INSERT INTO `author` VALUES ('15', 'Holly Dressel');
INSERT INTO `author` VALUES ('16', 'David T. Suzuki');
INSERT INTO `author` VALUES ('17', 'D Perkins');
INSERT INTO `author` VALUES ('18', 'Otis Gospodnetic');
INSERT INTO `author` VALUES ('19', 'Erik Hatcher');
INSERT INTO `author` VALUES ('20', 'Edward Yourdon');
INSERT INTO `author` VALUES ('21', 'Andy Hunt');
INSERT INTO `author` VALUES ('22', 'Venkat Subramaniam');
INSERT INTO `author` VALUES ('23', 'Michael Bright');
INSERT INTO `author` VALUES ('24', 'Jared M. Diamond');
INSERT INTO `author` VALUES ('25', 'Susan Lammers');
INSERT INTO `author` VALUES ('26', 'Rosaleen Love');
INSERT INTO `author` VALUES ('27', 'Damien Simonis');
INSERT INTO `author` VALUES ('28', 'Neal Gafter');
INSERT INTO `author` VALUES ('29', 'Joshua Bloch');
INSERT INTO `author` VALUES ('30', 'Daniel Kehlmann');
INSERT INTO `author` VALUES ('31', 'Uwe Sch366ning');
INSERT INTO `author` VALUES ('32', 'J.R.R. Tolkien');
INSERT INTO `author` VALUES ('33', 'David Thomas');
INSERT INTO `author` VALUES ('34', 'Andrew Hunt');
INSERT INTO `author` VALUES ('35', 'Dan Malks');
INSERT INTO `author` VALUES ('36', 'John Crupi');
INSERT INTO `author` VALUES ('37', 'Deepak Alur');
INSERT INTO `author` VALUES ('38', 'Erbrou Olga Guttke');
INSERT INTO `author` VALUES ('39', 'Shane Warden');
INSERT INTO `author` VALUES ('40', 'Rainer Sens');
INSERT INTO `author` VALUES ('41', 'Henning Mankell');
INSERT INTO `author` VALUES ('42', 'Jennifer Donnelly Dan Brown');
INSERT INTO `author` VALUES ('43', 'Gervase Phinn');
INSERT INTO `author` VALUES ('44', 'Stephen King');
INSERT INTO `author` VALUES ('45', 'Stewart Mitchell');
INSERT INTO `author` VALUES ('46', 'Hape Kerkeling');
INSERT INTO `author` VALUES ('47', 'Georg Gessner');
INSERT INTO `author` VALUES ('48', 'Stephen King');
INSERT INTO `author` VALUES ('49', 'Kent Beck');
INSERT INTO `author` VALUES ('50', 'John Brant');
INSERT INTO `author` VALUES ('51', 'William Opdyke');
INSERT INTO `author` VALUES ('52', 'Don Roberts');
INSERT INTO `author` VALUES ('53', 'Martin Fowler');
INSERT INTO `author` VALUES ('54', 'Joseph E. Stiglitz');
INSERT INTO `author` VALUES ('56', 'Chad Fowler');
INSERT INTO `author` VALUES ('57', 'Uwe Sch366ning');
INSERT INTO `author` VALUES ('58', 'Horst Fischer-Uhlig');
INSERT INTO `author` VALUES ('59', 'Stephen J. Dubner');
INSERT INTO `author` VALUES ('60', 'Steven D. Levitt');
INSERT INTO `author` VALUES ('61', 'Henning Mankell');
INSERT INTO `author` VALUES ('62', 'Scott Rosenberg');
INSERT INTO `author` VALUES ('63', 'M Lopp');
INSERT INTO `author` VALUES ('64', 'Paulo Coelho');
INSERT INTO `author` VALUES ('65', 'Tony Parsons');
INSERT INTO `author` VALUES ('66', 'Peter Hruschka');
INSERT INTO `author` VALUES ('67', 'Tim Lister');
INSERT INTO `author` VALUES ('68', 'Steve McMenamin');
INSERT INTO `author` VALUES ('69', 'James Robertson');
INSERT INTO `author` VALUES ('70', 'Suzanne Robertson');
INSERT INTO `author` VALUES ('71', 'Tom DeMarco');
INSERT INTO `author` VALUES ('72', 'Garth Snyder');
INSERT INTO `author` VALUES ('73', 'Scott Seebass');
INSERT INTO `author` VALUES ('74', 'Trent H. Hein');
INSERT INTO `author` VALUES ('75', 'Evi Nemeth');
INSERT INTO `author` VALUES ('76', 'Bill Bryson');
INSERT INTO `author` VALUES ('77', 'Bill Buford');
INSERT INTO `author` VALUES ('78', 'Richard P. Auletta');
INSERT INTO `author` VALUES ('79', 'Chad Fowler');
INSERT INTO `author` VALUES ('80', 'Eric Pascarello');
INSERT INTO `author` VALUES ('81', 'Darren James');
INSERT INTO `author` VALUES ('82', 'Dave Crane');
INSERT INTO `author` VALUES ('83', 'Stephen King');
INSERT INTO `author` VALUES ('84', 'Daniel Gilly');
INSERT INTO `author` VALUES ('85', 'Giles Tremlett');
INSERT INTO `author` VALUES ('86', 'Jon Krakauer');
INSERT INTO `author` VALUES ('87', 'David A. Kaplan');
INSERT INTO `author` VALUES ('88', 'Orhan Pamuk');
INSERT INTO `author` VALUES ('89', 'Derek Balling');
INSERT INTO `author` VALUES ('90', 'Jeremy Zawodny');
INSERT INTO `author` VALUES ('91', 'Helmut Kopka');
INSERT INTO `author` VALUES ('92', 'Gavin King');
INSERT INTO `author` VALUES ('93', 'Christian Bauer');
INSERT INTO `author` VALUES ('94', 'David Hansson ');
INSERT INTO `author` VALUES ('95', 'Leon Breedt');
INSERT INTO `author` VALUES ('96', 'Mike Clark');
INSERT INTO `author` VALUES ('97', 'James Davidson');
INSERT INTO `author` VALUES ('98', 'Justin Gehtland');
INSERT INTO `author` VALUES ('99', 'Andreas Schwarz');
INSERT INTO `author` VALUES ('100', 'Dave Thomas');
INSERT INTO `author` VALUES ('101', 'Paul Wilton');
INSERT INTO `author` VALUES ('102', 'Cliff Wootton');
INSERT INTO `author` VALUES ('103', 'et al');
INSERT INTO `author` VALUES ('104', 'Nigel McFarlane');
INSERT INTO `author` VALUES ('105', 'Khaled Hosseini');
INSERT INTO `author` VALUES ('106', 'Christopher Hansard');
INSERT INTO `author` VALUES ('107', 'Sonia Rossi');
INSERT INTO `author` VALUES ('108', 'Michael Lewis');
INSERT INTO `author` VALUES ('109', 'Karen Kingston');
INSERT INTO `author` VALUES ('110', 'Watts S. Humphrey');
INSERT INTO `author` VALUES ('111', 'Mahmud Darwish');

-- ----------------------------
-- Table structure for `authorities`
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `USERNAME` varchar(10) DEFAULT NULL,
  `AUTHORITY` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO `authorities` VALUES ('admin', 'ROLE_USER');
INSERT INTO `authorities` VALUES ('user1', 'ROLE_USER');

-- ----------------------------
-- Table structure for `blog`
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'test1');
INSERT INTO `blog` VALUES ('2', 'test2');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `publication_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `publicationDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('0', '2007-06-26', '(Theory in Practice (O\'Reilly))', 'Beautiful Code: Leading Programmers Explain How They Think', null);
INSERT INTO `book` VALUES ('1', '2007-06-01', '', 'Smart and Gets Things Done: Joel Spolsky\'s Concise Guide to Finding the Best Technical Talent, Hardback: Joel Spolsky\'s Concise Guide to Finding the Best Technical Talent', null);
INSERT INTO `book` VALUES ('2', '1998-11-30', '', 'R344tsel der Kochkunst.', null);
INSERT INTO `book` VALUES ('3', '1995-03-14', '', 'Design patterns : elements of reusable object-oriented software', null);
INSERT INTO `book` VALUES ('4', '2001-04-01', '', 'Otherland IV: Sea of Silver Light', null);
INSERT INTO `book` VALUES ('5', '2008-01-01', '', 'Feuchtgebiete', null);
INSERT INTO `book` VALUES ('6', '2001-06-04', '', 'Kitchen Confidential', null);
INSERT INTO `book` VALUES ('7', '1997-04-01', '', 'Langenscheidts Sprachf374hrer, Schwedisch', null);
INSERT INTO `book` VALUES ('8', '2000-03-30', '20th anniversary edition with a new preface by the author', 'Godel, Escher, Bach: An Eternal Golden Braid', null);
INSERT INTO `book` VALUES ('9', '1998-09-01', '', 'Konkrete Humanit344t. Vorlesungen 374ber Verantwortung und Menschlichkeit.', null);
INSERT INTO `book` VALUES ('10', '2005-03-01', '', 'From Naked Ape to Superspecies: Humanity and the Global Eco-crisis', null);
INSERT INTO `book` VALUES ('11', '2001-10-17', '', 'The Eureka Effect: The Art and Logic of Breakthrough Thinking', null);
INSERT INTO `book` VALUES ('12', '2005-01-12', '', 'Lucene In Action', null);
INSERT INTO `book` VALUES ('13', '1999-09-14', 'Yourdon Press computing series', 'Death March', null);
INSERT INTO `book` VALUES ('14', '2006-04-04', 'Pragmatic Programmers', 'Practices of an Agile Developer: Working in the Real World', null);
INSERT INTO `book` VALUES ('15', '2005-05-01', 'Barron\'s Educational Series', '1001 Natural Wonders: You Must See Before You Die', null);
INSERT INTO `book` VALUES ('16', '1998-04-25', '', 'Guns, Germs and Steel: A short history of everybody for the last 13,000 years', null);
INSERT INTO `book` VALUES ('17', '1986-04-01', '1st Series', 'Programmers at Work: Interviews', null);
INSERT INTO `book` VALUES ('18', '1989-08-01', '', 'The Total Devotion Machine and Other Stories', null);
INSERT INTO `book` VALUES ('19', '2003-10-01', 'Lonely Planet Travel Guides', 'Catalunya and the Costa Brava', null);
INSERT INTO `book` VALUES ('20', '2005-07-21', '', 'Java Puzzlers: Traps, Pitfalls, and Corner Cases', null);
INSERT INTO `book` VALUES ('21', '2008-01-01', '', 'Die Vermessung der Welt', null);
INSERT INTO `book` VALUES ('22', '1995-01-01', '', 'Logik f374r Informatiker', null);
INSERT INTO `book` VALUES ('23', '2007-04-17', '', 'The Children of Hurin', null);
INSERT INTO `book` VALUES ('24', '1999-11-24', '', 'The Pragmatic Programmer', null);
INSERT INTO `book` VALUES ('25', '2003-06-19', 'Core', 'Core J2EE Patterns: Best Practices and Design Strategies', null);
INSERT INTO `book` VALUES ('26', '2004-01-01', '', 'Tala Svenska', null);
INSERT INTO `book` VALUES ('27', '2003-07-24', '', 'Extreme Programming Pocket Guide', null);
INSERT INTO `book` VALUES ('28', '2003-12-31', '', 'Schweden: Dem Kommissar auf der Spur.', null);
INSERT INTO `book` VALUES ('29', '2002-01-01', '', 'Reader\'s Digest 4 in 1 Condensed Books The Da Vinci Code, Up And Down In The Dales, The Return Of The Dancing Master, A Gathering Light', null);
INSERT INTO `book` VALUES ('30', '2006-11-01', '', 'Cell.', null);
INSERT INTO `book` VALUES ('31', '1999-01-01', '', 'Ratgeber nat374rliche Gesundheit -Massage. Die heilende Kraft der Ber374hrung. o.A.', null);
INSERT INTO `book` VALUES ('32', '2006-01-01', '', 'Ich bin dann mal weg', null);
INSERT INTO `book` VALUES ('33', '1990-01-01', '', 'Witzig, sehr witzig - Herr Pfarrer', null);
INSERT INTO `book` VALUES ('34', '2007-07-12', '', 'Lisey\'s Story', null);
INSERT INTO `book` VALUES ('35', '1999-07-23', 'Object Technology Series', 'Refactoring: Improving the Design of Existing Code', null);
INSERT INTO `book` VALUES ('36', '2003-08-31', '', 'Die Schatten der Globalisierung.', null);
INSERT INTO `book` VALUES ('38', '2006-06-09', 'Pragmatic Programmers', 'Rails Recipes', null);
INSERT INTO `book` VALUES ('39', '1995-01-01', '', 'Theoretische Informatik, kurzgefa337t', null);
INSERT INTO `book` VALUES ('40', '2001-09-30', '', 'Ploetz. Der farbige Ploetz.', null);
INSERT INTO `book` VALUES ('41', '2006-10-05', '', 'Freakonomics', null);
INSERT INTO `book` VALUES ('42', '2006-02-28', '', 'Das Auge des Leoparden', null);
INSERT INTO `book` VALUES ('43', '2007-01-16', '', 'Dreaming in Code: Two Dozen Programmers, Three Years, 4,732 Bugs, and One Quest for Transcendent Software', null);
INSERT INTO `book` VALUES ('44', '2007-07-02', '', 'Managing Humans: Biting and Humorous Tales of a Software Engineering Manager', null);
INSERT INTO `book` VALUES ('45', '2002-01-01', '', 'Veronika Deschliesst Zu Sterben / Vernika Decides to Die', null);
INSERT INTO `book` VALUES ('46', '2002-05-07', '', 'One for My Baby', null);
INSERT INTO `book` VALUES ('47', '2008-03-03', '', 'Adrenaline Junkies and Template Zombies: Understanding Patterns of Project Behavior', null);
INSERT INTO `book` VALUES ('48', '1995-01-24', 'Computing', 'UNIX System Administration Handbook', null);
INSERT INTO `book` VALUES ('49', '2001-08-06', '', 'Down Under', null);
INSERT INTO `book` VALUES ('50', '2007-07-05', '', 'Heat', null);
INSERT INTO `book` VALUES ('51', '1998-01-03', '201 verbs series', '201 Swedish Verbs Fully Conjugated in All the Tenses', null);
INSERT INTO `book` VALUES ('52', '2005-09-19', 'Pragmatic Programmers', 'My Job Went to India: 52 Ways to Save Your Job', null);
INSERT INTO `book` VALUES ('53', '2005-10-01', '', 'Ajax in Action', null);
INSERT INTO `book` VALUES ('54', '2008-08-01', '', 'Duma Key', null);
INSERT INTO `book` VALUES ('55', '1992-06-01', 'Nutshell Handbooks', 'Unix in a Nutshell: System V, Release 4', null);
INSERT INTO `book` VALUES ('56', '2006-03-16', '', 'Ghosts of Spain: Travels Through a Country\'s Hidden Past', null);
INSERT INTO `book` VALUES ('57', '2005-10-01', '', 'In die Wildnis', null);
INSERT INTO `book` VALUES ('58', '2000-04-04', '', 'The Silicon Boys and Their Valley of Dreams', null);
INSERT INTO `book` VALUES ('59', '2006-04-06', '', 'Istanbul: Memories of a City', null);
INSERT INTO `book` VALUES ('60', '2004-04-08', 'Advanced Tools and Techniques for Mysql Administrators', 'High Performance MySQL: Optimization, Backups, Replication, Load Balancing & More', null);
INSERT INTO `book` VALUES ('61', '1996-01-01', '', 'LaTeX, 3 Bde., Bd.1, Einf374hrung', null);
INSERT INTO `book` VALUES ('62', '2006-12-05', '', 'Java Persistence with Hibernate', null);
INSERT INTO `book` VALUES ('63', '2006-12-14', 'Pragmatic Programmers', 'Agile Web Development with Rails', null);
INSERT INTO `book` VALUES ('64', '2001-10-01', 'Programmer to Programmer', 'Professional JavaScript', null);
INSERT INTO `book` VALUES ('65', '2008-05-01', '', 'A Thousand Splendid Suns', null);
INSERT INTO `book` VALUES ('66', '2004-04-12', '', 'The Tibetan Art of Positive Thinking: Skilful Thoughts for Successful Living', null);
INSERT INTO `book` VALUES ('67', '2008-07-29', '', 'Fucking Berlin: Studentin und Teilzeit-Hure', null);
INSERT INTO `book` VALUES ('68', '1999-10-21', '', 'Liar\'s Poker: Playing the Money Markets', null);
INSERT INTO `book` VALUES ('69', '1998-09-24', '', 'Clear Your Clutter with Feng Shui: Space Clearing Can Change Your Life', null);
INSERT INTO `book` VALUES ('70', '1995-02-13', 'SEI Series in Software Engineering S', 'A Discipline for Software Engineering', null);
INSERT INTO `book` VALUES ('71', '2004-01-31', '', 'Das grosse Buch der vegetarischen K374che.', null);

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
-- Table structure for `book_author`
-- ----------------------------
DROP TABLE IF EXISTS `book_author`;
CREATE TABLE `book_author` (
  `book_id` int(11) NOT NULL DEFAULT '0',
  `authors_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`book_id`,`authors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_author
-- ----------------------------
INSERT INTO `book_author` VALUES ('0', '0');
INSERT INTO `book_author` VALUES ('0', '1');
INSERT INTO `book_author` VALUES ('1', '2');
INSERT INTO `book_author` VALUES ('2', '3');
INSERT INTO `book_author` VALUES ('3', '4');
INSERT INTO `book_author` VALUES ('3', '5');
INSERT INTO `book_author` VALUES ('3', '6');
INSERT INTO `book_author` VALUES ('3', '7');
INSERT INTO `book_author` VALUES ('4', '8');
INSERT INTO `book_author` VALUES ('5', '9');
INSERT INTO `book_author` VALUES ('6', '10');
INSERT INTO `book_author` VALUES ('7', '11');
INSERT INTO `book_author` VALUES ('7', '12');
INSERT INTO `book_author` VALUES ('8', '13');
INSERT INTO `book_author` VALUES ('9', '14');
INSERT INTO `book_author` VALUES ('10', '15');
INSERT INTO `book_author` VALUES ('10', '16');
INSERT INTO `book_author` VALUES ('11', '17');
INSERT INTO `book_author` VALUES ('12', '18');
INSERT INTO `book_author` VALUES ('12', '19');
INSERT INTO `book_author` VALUES ('13', '20');
INSERT INTO `book_author` VALUES ('14', '21');
INSERT INTO `book_author` VALUES ('14', '22');
INSERT INTO `book_author` VALUES ('15', '23');
INSERT INTO `book_author` VALUES ('16', '24');
INSERT INTO `book_author` VALUES ('17', '25');
INSERT INTO `book_author` VALUES ('18', '26');
INSERT INTO `book_author` VALUES ('19', '27');
INSERT INTO `book_author` VALUES ('20', '28');
INSERT INTO `book_author` VALUES ('20', '29');
INSERT INTO `book_author` VALUES ('21', '30');
INSERT INTO `book_author` VALUES ('22', '31');
INSERT INTO `book_author` VALUES ('23', '32');
INSERT INTO `book_author` VALUES ('24', '33');
INSERT INTO `book_author` VALUES ('24', '34');
INSERT INTO `book_author` VALUES ('25', '35');
INSERT INTO `book_author` VALUES ('25', '36');
INSERT INTO `book_author` VALUES ('25', '37');
INSERT INTO `book_author` VALUES ('26', '38');
INSERT INTO `book_author` VALUES ('27', '39');
INSERT INTO `book_author` VALUES ('28', '40');
INSERT INTO `book_author` VALUES ('29', '41');
INSERT INTO `book_author` VALUES ('29', '42');
INSERT INTO `book_author` VALUES ('29', '43');
INSERT INTO `book_author` VALUES ('30', '44');
INSERT INTO `book_author` VALUES ('31', '45');
INSERT INTO `book_author` VALUES ('32', '46');
INSERT INTO `book_author` VALUES ('33', '47');
INSERT INTO `book_author` VALUES ('34', '48');
INSERT INTO `book_author` VALUES ('35', '49');
INSERT INTO `book_author` VALUES ('35', '50');
INSERT INTO `book_author` VALUES ('35', '51');
INSERT INTO `book_author` VALUES ('35', '52');
INSERT INTO `book_author` VALUES ('35', '53');
INSERT INTO `book_author` VALUES ('36', '54');
INSERT INTO `book_author` VALUES ('38', '56');
INSERT INTO `book_author` VALUES ('39', '57');
INSERT INTO `book_author` VALUES ('40', '58');
INSERT INTO `book_author` VALUES ('41', '59');
INSERT INTO `book_author` VALUES ('41', '60');
INSERT INTO `book_author` VALUES ('42', '61');
INSERT INTO `book_author` VALUES ('43', '62');
INSERT INTO `book_author` VALUES ('44', '63');
INSERT INTO `book_author` VALUES ('45', '64');
INSERT INTO `book_author` VALUES ('46', '65');
INSERT INTO `book_author` VALUES ('47', '66');
INSERT INTO `book_author` VALUES ('47', '67');
INSERT INTO `book_author` VALUES ('47', '68');
INSERT INTO `book_author` VALUES ('47', '69');
INSERT INTO `book_author` VALUES ('47', '70');
INSERT INTO `book_author` VALUES ('47', '71');
INSERT INTO `book_author` VALUES ('48', '72');
INSERT INTO `book_author` VALUES ('48', '73');
INSERT INTO `book_author` VALUES ('48', '74');
INSERT INTO `book_author` VALUES ('48', '75');
INSERT INTO `book_author` VALUES ('49', '76');
INSERT INTO `book_author` VALUES ('50', '77');
INSERT INTO `book_author` VALUES ('51', '78');
INSERT INTO `book_author` VALUES ('52', '79');
INSERT INTO `book_author` VALUES ('53', '80');
INSERT INTO `book_author` VALUES ('53', '81');
INSERT INTO `book_author` VALUES ('53', '82');
INSERT INTO `book_author` VALUES ('54', '83');
INSERT INTO `book_author` VALUES ('55', '84');
INSERT INTO `book_author` VALUES ('56', '85');
INSERT INTO `book_author` VALUES ('57', '86');
INSERT INTO `book_author` VALUES ('58', '87');
INSERT INTO `book_author` VALUES ('59', '88');
INSERT INTO `book_author` VALUES ('60', '89');
INSERT INTO `book_author` VALUES ('60', '90');
INSERT INTO `book_author` VALUES ('61', '91');
INSERT INTO `book_author` VALUES ('62', '92');
INSERT INTO `book_author` VALUES ('62', '93');
INSERT INTO `book_author` VALUES ('63', '94');
INSERT INTO `book_author` VALUES ('63', '95');
INSERT INTO `book_author` VALUES ('63', '96');
INSERT INTO `book_author` VALUES ('63', '97');
INSERT INTO `book_author` VALUES ('63', '98');
INSERT INTO `book_author` VALUES ('63', '99');
INSERT INTO `book_author` VALUES ('63', '100');
INSERT INTO `book_author` VALUES ('64', '101');
INSERT INTO `book_author` VALUES ('64', '102');
INSERT INTO `book_author` VALUES ('64', '103');
INSERT INTO `book_author` VALUES ('64', '104');
INSERT INTO `book_author` VALUES ('65', '105');
INSERT INTO `book_author` VALUES ('66', '106');
INSERT INTO `book_author` VALUES ('67', '107');
INSERT INTO `book_author` VALUES ('68', '108');
INSERT INTO `book_author` VALUES ('69', '109');
INSERT INTO `book_author` VALUES ('70', '110');
INSERT INTO `book_author` VALUES ('71', '111');

-- ----------------------------
-- Table structure for `browser`
-- ----------------------------
DROP TABLE IF EXISTS `browser`;
CREATE TABLE `browser` (
  `statId` int(11) NOT NULL,
  `statType` varchar(255) DEFAULT NULL,
  `statVar` varchar(255) DEFAULT NULL,
  `statCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`statId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of browser
-- ----------------------------
INSERT INTO `browser` VALUES ('1', 'browser', 'Safari', '6');
INSERT INTO `browser` VALUES ('2', 'browser', 'IE6', '16');
INSERT INTO `browser` VALUES ('3', 'browser', 'IE7', '73');
INSERT INTO `browser` VALUES ('4', 'browser', 'IE8', '80');
INSERT INTO `browser` VALUES ('5', 'browser', 'IE9', '60');
INSERT INTO `browser` VALUES ('6', 'browser', 'IE10', '40');
INSERT INTO `browser` VALUES ('7', 'browser', 'FireFox', '10');
INSERT INTO `browser` VALUES ('8', 'browser', 'Chrome', '30');
INSERT INTO `browser` VALUES ('9', 'browser', 'Opera', '1');
INSERT INTO `browser` VALUES ('10', 'browser', 'Maxthon', '1');
INSERT INTO `browser` VALUES ('11', 'browser', '360', '11');
INSERT INTO `browser` VALUES ('12', 'browser', 'Other', '2');

-- ----------------------------
-- Table structure for `cats`
-- ----------------------------
DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birthdate` datetime DEFAULT NULL,
  `litterId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` char(1) NOT NULL,
  `weight` float NOT NULL,
  `color_id` bigint(20) DEFAULT NULL,
  `mother_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2E7B5D554BC636` (`mother_id`),
  KEY `FK2E7B5DB17FCEE3` (`color_id`),
  CONSTRAINT `FK2E7B5D554BC636` FOREIGN KEY (`mother_id`) REFERENCES `cats` (`id`),
  CONSTRAINT `FK2E7B5DB17FCEE3` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cats
-- ----------------------------
INSERT INTO `cats` VALUES ('27', '2012-09-07 16:09:50', '0', '皇阿玛', '', '0', '7', null);
INSERT INTO `cats` VALUES ('28', '2012-09-07 16:09:50', '0', '大爷', '', '0', null, '27');
INSERT INTO `cats` VALUES ('29', '2012-09-07 16:09:50', '1', '二爷', '', '0', null, '27');
INSERT INTO `cats` VALUES ('30', '2012-09-07 16:09:50', '2', '三爷', '', '0', null, '27');
INSERT INTO `cats` VALUES ('31', '2012-09-07 16:09:50', '0', '三爷的儿子', '', '0', null, '30');

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
-- Table structure for `colors`
-- ----------------------------
DROP TABLE IF EXISTS `colors`;
CREATE TABLE `colors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of colors
-- ----------------------------
INSERT INTO `colors` VALUES ('6', '正宗的');
INSERT INTO `colors` VALUES ('7', '正宗的');

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
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `BEGIN_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `fee` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'test', '2012-12-01', '2012-12-10', '11');
INSERT INTO `course` VALUES ('2', 'Core Spring', '2007-09-01', '2007-10-01', '1000');
INSERT INTO `course` VALUES ('3', 'Core SpringII', '2007-09-01', '2007-10-01', '1000');
INSERT INTO `course` VALUES ('4', 'Core SpringIII', '2007-09-01', '2007-10-01', '1000');
INSERT INTO `course` VALUES ('5', 'Core SpringIV', '2007-09-01', '2007-10-01', '1000');
INSERT INTO `course` VALUES ('6', 'Core Spring V', '2007-09-01', '2007-10-01', '1000');
INSERT INTO `course` VALUES ('7', 'Core Spring VI', '2007-09-01', '2007-10-01', '1000');
INSERT INTO `course` VALUES ('8', 'Core Spring VII', '2007-09-01', '2007-10-01', '1000');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorized` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `passphrase` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '', 'user@userssite.com', 'First', 'Last', 'password');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('1', '2012-09-07 14:54:41', 'My Event');
INSERT INTO `events` VALUES ('2', '2012-09-07 14:54:41', 'My Event2');
INSERT INTO `events` VALUES ('3', '2012-09-07 14:55:04', 'My Event');
INSERT INTO `events` VALUES ('4', '2012-09-07 14:55:06', 'My Event2');

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
INSERT INTO `exttree` VALUES ('3', '2', '轻金属s', '1', '1', null);
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
INSERT INTO `generator_table` VALUES ('schedule_event_pk', '2');
INSERT INTO `generator_table` VALUES ('ssh_beautiful_pk', '7');
INSERT INTO `generator_table` VALUES ('ssh_log_pk', '5');
INSERT INTO `generator_table` VALUES ('ssh_role_pk', '6');
INSERT INTO `generator_table` VALUES ('ssh_user_pk', '14');

-- ----------------------------
-- Table structure for `jbpm4_deployment`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployment`;
CREATE TABLE `jbpm4_deployment` (
  `DBID_` bigint(20) NOT NULL,
  `NAME_` longtext,
  `TIMESTAMP_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_deployment
-- ----------------------------
INSERT INTO `jbpm4_deployment` VALUES ('1', null, '0', 'active');

-- ----------------------------
-- Table structure for `jbpm4_deployprop`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployprop`;
CREATE TABLE `jbpm4_deployprop` (
  `DBID_` bigint(20) NOT NULL,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `OBJNAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `STRINGVAL_` varchar(255) DEFAULT NULL,
  `LONGVAL_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  CONSTRAINT `FK_DEPLPROP_DEPL` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_deployprop
-- ----------------------------
INSERT INTO `jbpm4_deployprop` VALUES ('3', '1', 'RegisterCustomer', 'langid', 'jpdl-4.0', null);
INSERT INTO `jbpm4_deployprop` VALUES ('4', '1', 'RegisterCustomer', 'pdid', 'RegisterCustomer-1', null);
INSERT INTO `jbpm4_deployprop` VALUES ('5', '1', 'RegisterCustomer', 'pdkey', 'RegisterCustomer', null);
INSERT INTO `jbpm4_deployprop` VALUES ('6', '1', 'RegisterCustomer', 'pdversion', null, '1');

-- ----------------------------
-- Table structure for `jbpm4_execution`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_execution`;
CREATE TABLE `jbpm4_execution` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ACTIVITYNAME_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `HISACTINST_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `INSTANCE_` bigint(20) DEFAULT NULL,
  `SUPEREXEC_` bigint(20) DEFAULT NULL,
  `SUBPROCINST_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`),
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `IDX_EXEC_PARENT` (`PARENT_`),
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `FK_EXEC_PARENT` (`PARENT_`),
  CONSTRAINT `FK_EXEC_INSTANCE` FOREIGN KEY (`INSTANCE_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUBPI` FOREIGN KEY (`SUBPROCINST_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUPEREXEC` FOREIGN KEY (`SUPEREXEC_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_execution
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_actinst`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_actinst`;
CREATE TABLE `jbpm4_hist_actinst` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSITION_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HTI_HTASK` (`HTASK_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HTI_HTASK` (`HTASK_`),
  CONSTRAINT `FK_HACTI_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HTI_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_actinst
-- ----------------------------
INSERT INTO `jbpm4_hist_actinst` VALUES ('9', 'aut', '0', '7', 'java', 'RegisterCustomer.1', 'send-verification-email', '2013-01-11 11:08:27', '2013-01-11 11:08:27', '15', null, '1', null);
INSERT INTO `jbpm4_hist_actinst` VALUES ('10', 'act', '1', '7', 'state', 'RegisterCustomer.1', 'confirm-receipt-of-verification-email', '2013-01-11 11:08:27', '2013-01-11 11:08:27', '703', null, '1', null);
INSERT INTO `jbpm4_hist_actinst` VALUES ('11', 'aut', '0', '7', 'java', 'RegisterCustomer.1', 'send-welcome-email', '2013-01-11 11:08:27', '2013-01-11 11:08:27', '0', null, '1', null);

-- ----------------------------
-- Table structure for `jbpm4_hist_detail`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_detail`;
CREATE TABLE `jbpm4_hist_detail` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HPROCIIDX_` int(11) DEFAULT NULL,
  `HACTI_` bigint(20) DEFAULT NULL,
  `HACTIIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  `HTASKIDX_` int(11) DEFAULT NULL,
  `HVAR_` bigint(20) DEFAULT NULL,
  `HVARIDX_` int(11) DEFAULT NULL,
  `MESSAGE_` longtext,
  `OLD_STR_` varchar(255) DEFAULT NULL,
  `NEW_STR_` varchar(255) DEFAULT NULL,
  `OLD_INT_` int(11) DEFAULT NULL,
  `NEW_INT_` int(11) DEFAULT NULL,
  `OLD_TIME_` datetime DEFAULT NULL,
  `NEW_TIME_` datetime DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HDET_HVAR` (`HVAR_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HTASK` (`HTASK_`),
  KEY `IDX_HDET_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HVAR` (`HVAR_`),
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HTASK` (`HTASK_`),
  KEY `FK_HDETAIL_HACTI` (`HACTI_`),
  CONSTRAINT `FK_HDETAIL_HACTI` FOREIGN KEY (`HACTI_`) REFERENCES `jbpm4_hist_actinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HVAR` FOREIGN KEY (`HVAR_`) REFERENCES `jbpm4_hist_var` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_procinst`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_procinst`;
CREATE TABLE `jbpm4_hist_procinst` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ENDACTIVITY_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_procinst
-- ----------------------------
INSERT INTO `jbpm4_hist_procinst` VALUES ('7', '1', 'RegisterCustomer.1', 'RegisterCustomer-1', '1', '2013-01-11 11:08:27', '2013-01-11 11:08:27', '703', 'ended', 'send-welcome-email', '1');

-- ----------------------------
-- Table structure for `jbpm4_hist_task`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_task`;
CREATE TABLE `jbpm4_hist_task` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `OUTCOME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HSUPERT_SUB` (`SUPERTASK_`),
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`),
  CONSTRAINT `FK_HSUPERT_SUB` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_task
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_var`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_var`;
CREATE TABLE `jbpm4_hist_var` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `PROCINSTID_` varchar(255) DEFAULT NULL,
  `EXECUTIONID_` varchar(255) DEFAULT NULL,
  `VARNAME_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HVAR_HTASK` (`HTASK_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HTASK` (`HTASK_`),
  CONSTRAINT `FK_HVAR_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HVAR_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_var
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_id_group`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_group`;
CREATE TABLE `jbpm4_id_group` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`),
  KEY `FK_GROUP_PARENT` (`PARENT_`),
  CONSTRAINT `FK_GROUP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_id_group` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_id_membership`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_membership`;
CREATE TABLE `jbpm4_id_membership` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_MEM_GROUP` (`GROUP_`),
  KEY `IDX_MEM_USER` (`USER_`),
  KEY `FK_MEM_GROUP` (`GROUP_`),
  KEY `FK_MEM_USER` (`USER_`),
  CONSTRAINT `FK_MEM_GROUP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm4_id_group` (`DBID_`),
  CONSTRAINT `FK_MEM_USER` FOREIGN KEY (`USER_`) REFERENCES `jbpm4_id_user` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_id_user`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_user`;
CREATE TABLE `jbpm4_id_user` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  `GIVENNAME_` varchar(255) DEFAULT NULL,
  `FAMILYNAME_` varchar(255) DEFAULT NULL,
  `BUSINESSEMAIL_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_job`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_job`;
CREATE TABLE `jbpm4_job` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKEXPTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int(11) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `CFG_` bigint(20) DEFAULT NULL,
  `SIGNAL_` varchar(255) DEFAULT NULL,
  `EVENT_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`),
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`),
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`),
  KEY `IDX_JOB_CFG` (`CFG_`),
  KEY `IDX_JOB_EXE` (`EXECUTION_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_JOB_CFG` (`CFG_`),
  CONSTRAINT `FK_JOB_CFG` FOREIGN KEY (`CFG_`) REFERENCES `jbpm4_lob` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_job
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_lob`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_lob`;
CREATE TABLE `jbpm4_lob` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `NAME_` longtext,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  CONSTRAINT `FK_LOB_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_lob
-- ----------------------------
INSERT INTO `jbpm4_lob` VALUES ('2', '0', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A3C70726F63657373206E616D653D225265676973746572437573746F6D65722220786D6C6E733D22687474703A2F2F6A62706D2E6F72672F342E302F6A70646C223E0D0A0D0A202020203C73746172743E0D0A20202020202020203C7472616E736974696F6E20746F3D2273656E642D766572696669636174696F6E2D656D61696C222F3E0D0A202020203C2F73746172743E0D0A0D0A202020203C6A617661206E616D653D2273656E642D766572696669636174696F6E2D656D61696C2220657870723D22237B637573746F6D6572536572766963657D220D0A202020202020202020206D6574686F643D2273656E64437573746F6D6572566572696669636174696F6E456D61696C223E0D0A20202020202020203C6172673E0D0A2020202020202020202020203C6F626A65637420657870723D22237B637573746F6D657249647D222F3E0D0A20202020202020203C2F6172673E0D0A20202020202020203C7472616E736974696F6E20746F3D22636F6E6669726D2D726563656970742D6F662D766572696669636174696F6E2D656D61696C222F3E0D0A202020203C2F6A6176613E0D0A0D0A202020203C7374617465206E616D653D22636F6E6669726D2D726563656970742D6F662D766572696669636174696F6E2D656D61696C223E0D0A20202020202020203C7472616E736974696F6E20746F3D2273656E642D77656C636F6D652D656D61696C222F3E0D0A202020203C2F73746174653E0D0A0D0A202020203C6A617661206E616D653D2273656E642D77656C636F6D652D656D61696C2220657870723D22237B637573746F6D6572536572766963657D22206D6574686F643D2273656E6457656C636F6D65456D61696C223E0D0A20202020202020203C6172673E0D0A2020202020202020202020203C6F626A65637420657870723D22237B637573746F6D657249647D222F3E0D0A20202020202020203C2F6172673E0D0A202020203C2F6A6176613E0D0A0D0A3C2F70726F636573733E0D0A, '1', 'file:/D:/115/code/start_j2ee/target/classes/spring/23/process-definitions/RegisterCustomer.jpdl.xml');

-- ----------------------------
-- Table structure for `jbpm4_participation`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_participation`;
CREATE TABLE `jbpm4_participation` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `GROUPID_` varchar(255) DEFAULT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_PART_TASK` (`TASK_`),
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_PART_TASK` (`TASK_`),
  CONSTRAINT `FK_PART_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`),
  CONSTRAINT `FK_PART_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_participation
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_property`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_property`;
CREATE TABLE `jbpm4_property` (
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_property
-- ----------------------------
INSERT INTO `jbpm4_property` VALUES ('next.dbid', '1', '10001');

-- ----------------------------
-- Table structure for `jbpm4_swimlane`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_swimlane`;
CREATE TABLE `jbpm4_swimlane` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`),
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`),
  CONSTRAINT `FK_SWIMLANE_EXEC` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_swimlane
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_task`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_task`;
CREATE TABLE `jbpm4_task` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `FORM_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROGRESS_` int(11) DEFAULT NULL,
  `SIGNALLING_` bit(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKDEFNAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`),
  KEY `FK_TASK_SWIML` (`SWIMLANE_`),
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`),
  CONSTRAINT `FK_TASK_SUPERTASK` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_task` (`DBID_`),
  CONSTRAINT `FK_TASK_SWIML` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_task
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_variable`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_variable`;
CREATE TABLE `jbpm4_variable` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CONVERTER_` varchar(255) DEFAULT NULL,
  `HIST_` bit(1) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `LOB_` bigint(20) DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `CLASSNAME_` varchar(255) DEFAULT NULL,
  `LONG_VALUE_` bigint(20) DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  `TEXT_VALUE_` longtext,
  `EXESYS_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`),
  KEY `IDX_VAR_TASK` (`TASK_`),
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_EXESYS` (`EXESYS_`),
  KEY `FK_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_TASK` (`TASK_`),
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`),
  CONSTRAINT `FK_VAR_EXECUTION` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_EXESYS` FOREIGN KEY (`EXESYS_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_LOB` FOREIGN KEY (`LOB_`) REFERENCES `jbpm4_lob` (`DBID_`),
  CONSTRAINT `FK_VAR_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_variable
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '0', 'Foo', 'Bar');
INSERT INTO `person` VALUES ('2', '0', 'Foo2', 'Bar2');
INSERT INTO `person` VALUES ('3', '0', 'Foo', 'Bar');
INSERT INTO `person` VALUES ('4', '0', 'Foo2', 'Bar2');

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
INSERT INTO `person_email_addr` VALUES ('1', 'test1@g.cn');
INSERT INTO `person_email_addr` VALUES ('1', 'test2@g.cn');
INSERT INTO `person_email_addr` VALUES ('3', 'test1@g.cn');
INSERT INTO `person_email_addr` VALUES ('3', 'test2@g.cn');

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
INSERT INTO `person_event` VALUES ('1', '1');
INSERT INTO `person_event` VALUES ('2', '1');
INSERT INTO `person_event` VALUES ('1', '2');
INSERT INTO `person_event` VALUES ('3', '3');
INSERT INTO `person_event` VALUES ('4', '3');
INSERT INTO `person_event` VALUES ('3', '4');

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
INSERT INTO `ssh_role` VALUES ('5', 'x');

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
INSERT INTO `ssh_user` VALUES ('9', 'test2', null, '1');
INSERT INTO `ssh_user` VALUES ('10', 'testx', null, '1');
INSERT INTO `ssh_user` VALUES ('11', 'x', null, '5');
INSERT INTO `ssh_user` VALUES ('12', 'test1002', 'test1002', null);
INSERT INTO `ssh_user` VALUES ('13', 'test33', 'test33', null);

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
-- Table structure for `tbl_area`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_area`;
CREATE TABLE `tbl_area` (
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_area
-- ----------------------------
INSERT INTO `tbl_area` VALUES ('江西', '宜春', '上高');
INSERT INTO `tbl_area` VALUES ('江西', '宜春', '高安');
INSERT INTO `tbl_area` VALUES ('江西', '宜春', '万载');
INSERT INTO `tbl_area` VALUES ('江西', '宜春', '奉新');
INSERT INTO `tbl_area` VALUES ('江西', '南昌', '进贤');
INSERT INTO `tbl_area` VALUES ('江西', '南昌', '新建');
INSERT INTO `tbl_area` VALUES ('江西', '抚州', '东乡');
INSERT INTO `tbl_area` VALUES ('江西', '抚州', '临川');
INSERT INTO `tbl_area` VALUES ('广东', '深圳', '宝安');
INSERT INTO `tbl_area` VALUES ('广东', '深圳', '福田');
INSERT INTO `tbl_area` VALUES ('广东', '深圳', '南山');
INSERT INTO `tbl_area` VALUES ('广东', '东莞', '塘厦');
INSERT INTO `tbl_area` VALUES ('广东', '东莞', '长安');
INSERT INTO `tbl_area` VALUES ('福建', '泉州', '惠安');
INSERT INTO `tbl_area` VALUES ('福建', '泉州', '安溪');
INSERT INTO `tbl_area` VALUES ('福建', '泉州', '南安');
INSERT INTO `tbl_area` VALUES ('福建', '福州', '永泰');
INSERT INTO `tbl_area` VALUES ('福建', '福州', '连江');

-- ----------------------------
-- Table structure for `tbl_baseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_baseinfo`;
CREATE TABLE `tbl_baseinfo` (
  `uuid` varchar(50) DEFAULT NULL,
  `no` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `deptno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_baseinfo
-- ----------------------------
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0001', '10001', '宋文华', '1', '25', '1978-01-03', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0002', '10002', '周燕', '0', '38', '1978-12-21', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0003', '10003', '周红', '0', '45', '1968-05-23', '0003');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0004', '10004', '胡智波', '1', '35', '1963-08-12', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0005', '10005', '胡秀青', '1', '36', '1965-06-11', '0002');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0006', '10006', '涂琦英', '0', '56', '1959-05-03', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0007', '10007', '宋节斌', '1', '45', '1957-11-05', '0002');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0008', '10008', '周英龙', '1', '26', '1980-10-09', '0003');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0009', '10009', '吴树青', '1', '32', '1983-11-15', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0010', '10010', '范新华', '1', '36', '1983-08-17', '0012');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0011', '10011', '吴国发', '1', '26', '1980-07-19', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0012', '10012', '吴志枫', '1', '43', '1978-08-13', '0002');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0013', '10013', '范坚琴', '0', '28', '1977-03-03', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0014', '10014', '周勇伟', '1', '36', '1978-07-05', '0005');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0015', '10015', '周节华', '1', '46', '1976-05-17', '0009');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0016', '10016', '范员波', '1', '35', '1978-07-16', '0009');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0017', '10017', '胡冬琴', '0', '56', '1980-06-15', '0005');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0018', '10018', '周红', '0', '28', '1980-08-21', '0007');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0019', '10019', '吴志清', '1', '37', '1968-07-27', '0004');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0020', '10020', '吴志国', '1', '38', '1987-08-29', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0021', '10021', '吴清珊', '0', '28', '1969-06-25', '0009');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0022', '10022', '王志尖', '1', '36', '1980-07-26', '0012');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0023', '10023', '吴良光', '1', '28', '1986-03-25', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0024', '10024', '胡玟乐', '1', '37', '1976-03-21', '0004');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0025', '10025', '洪亮亮', '1', '46', '1978-04-23', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0026', '10026', '付瑞明', '1', '45', '1966-06-12', '0006');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0027', '10027', '胡志莹', '0', '29', '1985-07-11', '0010');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0028', '10028', '高洪波', '1', '34', '1975-03-10', '0008');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0029', '10029', '刘铭署', '1', '38', '1973-07-15', '0006');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0030', '10030', '胡婷', '0', '36', '1976-11-03', '0010');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0031', '10031', '吴建中', '1', '39', '1988-12-15', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0032', '10032', '吴志诚', '1', '26', '1986-04-19', '0007');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0033', '10033', '苏伟官', '1', '28', '1963-10-26', '0007');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0034', '10034', '吴圆蛾', '0', '29', '1968-08-27', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0035', '10035', '吴芝红', '0', '23', '1965-01-21', '0002');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0036', '10036', '万兴国', '1', '27', '1958-11-20', '0011');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0037', '10037', '范贵红', '0', '45', '1980-10-23', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0038', '10038', '宋国珍', '0', '36', '1982-06-13', '0008');

-- ----------------------------
-- Table structure for `tbl_department`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_department`;
CREATE TABLE `tbl_department` (
  `guid` varchar(50) DEFAULT NULL,
  `deptno` varchar(20) DEFAULT NULL,
  `deptname` varchar(30) DEFAULT NULL,
  `manager` varchar(30) DEFAULT NULL,
  `builtdate` date DEFAULT NULL,
  `performance` varchar(20) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_department
-- ----------------------------
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0001', '0001', '生产质量部', '吴华云', '2001-01-03', '优秀', '根据客户要求的产品交货期，安排生产，安排测试，安排包装，按时按质完成产品，对研发产品测试样机生产支持，管理生产车间，5S，精益生产，生产物料、半成品和成品管理，生产质量管理，生产人员管理，操作工技能培训，制定生产各部分的制度和流程，对销售的产品质量进行跟踪和管理，处理客户产品投诉，提出产品质量整改意见，组织和提高产品认证（3C，CCEE，CCIB，CE）、质量认证（ISO9000-ISO90004）、环境认证（ISO14000），制定和完善全面质量管理（TQM）');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0002', '0002', '物流部', '苏伟根', '2001-01-03', '很差', '将销售部获得的客户订单录入到ERP系统，并生成相应的加工单，对成品按照客户要求的日期和发货地点完成成品发运，衡量公司对客户及时交货率；按照物流协议向供应商购买物料，催缴物料，对物料进行质量检查，并对供应商来料进行更总和物料FIFO管理，收到发票后组织付款，衡量供应商对公司的及时交货率，以及保税物料和报关实务处理，控制库存，制定物流制度和相应流程');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0003', '0003', '采购部', '胡忠华', '2001-11-13', '良好', '前期供应商的搜寻，对供应商的认证和考核，谈判物料价格，制定物流采购协议，对供应商的产品和送货进行质量更总，非生产性物料的采购，制定所有采购材料的流程和制度，对工业项目采购的支持');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0004', '0004', '财务部', '胡新立', '2003-06-09', '良好', '对公司的经营状况进行分析，提供决策财务数据支持，各种凭证录入系统，对供应商开具的发票付款，开发票给客户，并进行应收款的工作，对各种凭证汇总产生总账，出具财务报表（资产负债表，损益表，现金流量表），管理公司存款和现金，管理支票、汇票、发票、收据，报销，管理公司固定资产');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0005', '0005', '研发技术部', '潘林淘', '2003-12-03', '良好', '负责对现有产品升级更新，性能优化，产品改进，新产品研发，产品生产技术支持，管理研发设备和研发实验室');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0006', '0006', '人事行政部', '胡新华', '2003-12-09', '优秀', '发展公司企业文化，制定公司人事制度，管理员工入职离职，劳动合同管理，员工信息管理，制定员工福利和奖惩制度，制定公司培训政策和制度，安排出差人员的食宿，管理公司班车，管理公司食堂，管理公司办公设备');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0007', '0007', '信息管理部', '苏小琴', '2004-03-12', '优秀', '管理公司的信息设备，保证设备和信息的安全，提供稳定，安全，高效的应用服务，配合公司战略规划，制定信息管理发展计划，带领和支持业务部门，提供优质的产品和服务');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0008', '0008', '销售市场部', '潘云鹏', '2004-03-12', '较好', '为公司产品策划营销活动，树立公司品牌影响力，扩大产品市场占有额，管理分销商、代理商网络，制定公司年度销售计划，对销售活动进行监督和管理，考核销售业绩，为客户提供优质产品和服务');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0009', '0009', '售后服务部', '潘云飞', '2004-03-12', '较好', '提供产品客户服务，产品安装，产品调试，产品维修，产品配件管理，产品售后服务管理，提供优质的产品售后服务');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a00010', '0010', '工业工程部', '吴金升', '2005-01-06', '较好', '规划生产线，提供精益生产方法和流程，制定产品生产工艺工序，产品生产操作手册，生产车间布局管理，优化生产工艺工序，提供工作效率，规划安全生产环境，产品技术变更管理，零部件版本升级管理，工程变更管理，将新研发的产品工业化，新产品生产线规划，操作工WI培训');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a00011', '0011', '设备维修部', '吴平红', '2005-01-06', '良好', '负责公司所有故障设备的维修与更新');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a00012', '0012', '保卫处', '胡建国', '2005-01-08', '优秀', '维护公司及员工安全，保障公司财产不受破坏');

-- ----------------------------
-- Table structure for `tbl_dept_pingjia`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept_pingjia`;
CREATE TABLE `tbl_dept_pingjia` (
  `guid` varchar(50) DEFAULT NULL,
  `pingjia` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dept_pingjia
-- ----------------------------
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0001', '很好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0002', '很差');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0003', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0004', '较差');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0005', '很好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0006', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0007', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0008', '很好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0009', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a00010', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a00011', '很差');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a00012', '很好');

-- ----------------------------
-- Table structure for `tbl_detailinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_detailinfo`;
CREATE TABLE `tbl_detailinfo` (
  `no` varchar(20) DEFAULT NULL,
  `ename` varchar(30) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `joinindate` date DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `county` varchar(30) DEFAULT NULL,
  `marriage` int(11) DEFAULT NULL,
  `interest` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `description` text,
  `jl` varchar(100) DEFAULT NULL,
  `orderline` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_detailinfo
-- ----------------------------
INSERT INTO `tbl_detailinfo` VALUES ('10001', 'songwenhua', '1320.2', '2008-11-03', '江西', '南昌', '进贤', '1', '健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_chiay.jpg', '努力勤奋，上进好学', '', '101538111');
INSERT INTO `tbl_detailinfo` VALUES ('10002', 'zhouyuan', '2345.32', '2003-02-21', '广东', '深圳', '宝安', '0', '排球,旅游,跑步', '/WabacusDemo/wabacusdemo/uploadfile/2_claudxyz.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '111538112');
INSERT INTO `tbl_detailinfo` VALUES ('10003', 'zhouhong', '4323.23', '2005-03-23', '福建', '泉州', '惠安', '0', '足球,爬山,游泳', '/WabacusDemo/wabacusdemo/uploadfile/2_cuidenghong123.jpg', '勤偷节约，积极上进', '', '121538113');
INSERT INTO `tbl_detailinfo` VALUES ('10004', 'huzhibo', '6352', '2006-08-22', '江西', '宜春', '高安', '1', '排球,旅游', '/WabacusDemo/wabacusdemo/uploadfile/2_cxz003.jpg', '努力勤奋，上进好学', '', '131538114');
INSERT INTO `tbl_detailinfo` VALUES ('10005', 'huxiuqing', '4367.2', '2005-06-01', '福建', '泉州', '安溪', '0', '足球,旅游,跑步,健身', '/WabacusDemo/wabacusdemo/uploadfile/2_e_mi_tuo_fo.jpg', '勤偷节约，积极上进', '', '141538115');
INSERT INTO `tbl_detailinfo` VALUES ('10006', 'tuqiying', '5355.2', '2006-05-23', '广东', '东莞', '塘厦', '0', '跑步,健身', '/WabacusDemo/wabacusdemo/uploadfile/2_emon123.jpg', '努力勤奋，上进好学', '', '151538116');
INSERT INTO `tbl_detailinfo` VALUES ('10007', 'songjiebin', '7434.34', '2002-11-03', '江西', '南昌', '进贤', '0', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_fanyuanwaifdl.jpg', '勤偷节约，积极上进', '', '161538117');
INSERT INTO `tbl_detailinfo` VALUES ('10008', 'zhouyinglong', '7436.5', '2000-10-19', '福建', '泉州', '惠安', '0', '游泳,排球,旅游,', '/WabacusDemo/wabacusdemo/uploadfile/2_fellowcheng.jpg', '努力勤奋，上进好学', '', '171538118');
INSERT INTO `tbl_detailinfo` VALUES ('10009', 'wushuqing', '3455.3', '2009-11-15', '江西', '抚州', '临川', '1', '篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_gaohenggaoheng.jpg', '努力勤奋，上进好学', '', '181538119');
INSERT INTO `tbl_detailinfo` VALUES ('10010', 'fanxinhua', '3466.3', '2007-08-20', '江西', '南昌', '进贤', '0', '游泳,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_haiyong_sea.jpg', '努力勤奋，上进好学', '', '191538120');
INSERT INTO `tbl_detailinfo` VALUES ('10011', 'woguofa', '3677.4', '2000-07-29', '江西', '抚州', '临川', '0', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_huahua320.jpg', '努力勤奋，上进好学', '', '201538121');
INSERT INTO `tbl_detailinfo` VALUES ('10012', 'wuzhifeng', '7637.3', '2002-08-23', '广东', '深圳', '福田', '0', '游泳,排球,旅游', '/WabacusDemo/wabacusdemo/uploadfile/2_huiyaxiong.jpg', '勤偷节约，积极上进', '', '211538122');
INSERT INTO `tbl_detailinfo` VALUES ('10013', 'fanjianqin', '6346.3', '2006-03-23', '江西', '宜春', '高安', '0', '爬山,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_hyblusea.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '221538123');
INSERT INTO `tbl_detailinfo` VALUES ('10014', 'zhouyongwei', '7598', '2004-07-15', '福建', '泉州', '惠安', '0', '足球,跑步,健身', '/WabacusDemo/wabacusdemo/uploadfile/2_ivfangwang_long.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '231538124');
INSERT INTO `tbl_detailinfo` VALUES ('10015', 'zhoujiehua', '9346.3', '2000-05-07', '广东', '深圳', '宝安', '1', '旅游,跑步,健身', '/WabacusDemo/wabacusdemo/uploadfile/2_jaffy.jpg', '勤偷节约，积极上进', '', '241538125');
INSERT INTO `tbl_detailinfo` VALUES ('10016', 'fanyuanbo', '7463.3', '2003-07-06', '江西', '抚州', '临川', '0', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_javaalpha.jpg', '勤偷节约，积极上进', '', '51538126');
INSERT INTO `tbl_detailinfo` VALUES ('10017', 'hudongqin', '8998.2', '2008-06-05', '江西', '宜春', '上高', '0', '足球,爬山,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_jennyvenus.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '281538127');
INSERT INTO `tbl_detailinfo` VALUES ('10018', 'zhouhong', '7654.7', '2007-08-11', '福建', '福州', '永泰', '0', '足球,爬山,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_jjkodada.jpg', '勤偷节约，积极上进', '', '271538128');
INSERT INTO `tbl_detailinfo` VALUES ('10019', 'wuzhiqing', '6745.3', '2006-07-17', '广东', '深圳', '南山', '1', '健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_kaiyekai.jpg', '努力勤奋，上进好学', '', '281538129');
INSERT INTO `tbl_detailinfo` VALUES ('10020', 'wuzhiguo', '7655.4', '2005-08-20', '广东', '深圳', '福田', '0', '足球,爬山', '/WabacusDemo/wabacusdemo/uploadfile/2_kakajay008.jpg', '勤偷节约，积极上进', '', '291538130');
INSERT INTO `tbl_detailinfo` VALUES ('10021', 'wuqingshan', '10080.3', '2005-06-15', '福建', '福州', '连江', '0', '旅游,跑步', '/WabacusDemo/wabacusdemo/uploadfile/2_lbh119.jpg', '勤偷节约，积极上进', '', '301538131');
INSERT INTO `tbl_detailinfo` VALUES ('10022', 'wangzhijian', '2980.9', '2006-07-20', '江西', '宜春', '高安', '1', '健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_liufang12381.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '311538132');
INSERT INTO `tbl_detailinfo` VALUES ('10023', 'wuliangguang', '3800', '2007-03-20', '广东', '深圳', '福田', '0', '足球,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_liuxk99.jpg', '勤偷节约，积极上进', '', '321538134');
INSERT INTO `tbl_detailinfo` VALUES ('10024', 'huwenle', '9890.3', '2006-03-23', '广东', '深圳', '福田', '1', '足球,爬山,游泳,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_luojianfeng.jpg', '勤偷节约，积极上进', '', '331538135');
INSERT INTO `tbl_detailinfo` VALUES ('10025', 'hongliangliang', '6551', '2008-04-21', '福建', '泉州', '惠安', '1', '排球,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_luxiaoshuai.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '341538136');
INSERT INTO `tbl_detailinfo` VALUES ('10026', 'fuluiming', '3455.3', '2003-06-22', '福建', '福州', '连江', '1', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_lzj_freedom.jpg', '勤偷节约，积极上进', '', '351538137');
INSERT INTO `tbl_detailinfo` VALUES ('10027', 'huzhiying', '5764.3', '2009-07-12', '江西', '宜春', '上高', '0', '旅游,跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_minvt.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '361538138');
INSERT INTO `tbl_detailinfo` VALUES ('10028', 'gaohongbo', '9832.3', '2007-03-13', '福建', '福州', '连江', '0', '排球,旅游,跑步', '/WabacusDemo/wabacusdemo/uploadfile/2_pepeet.jpg', '勤偷节约，积极上进', '', '371538139');
INSERT INTO `tbl_detailinfo` VALUES ('10029', 'liumingshu', '4645', '2006-07-16', '江西', '南昌', '新建', '0', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_pxh360395296.jpg', '勤偷节约，积极上进', '', '381538140');
INSERT INTO `tbl_detailinfo` VALUES ('10030', 'huting', '5789', '2004-11-02', '广东', '深圳', '南山', '0', '爬山,游泳,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_pzy0428.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '391538141');
INSERT INTO `tbl_detailinfo` VALUES ('10031', 'wujianzhong', '3456', '2007-12-25', '福建', '福州', '永泰', '0', '足球,爬山,游泳', '/WabacusDemo/wabacusdemo/uploadfile/2_q107770540.jpg', '勤偷节约，积极上进', '', '401538142');
INSERT INTO `tbl_detailinfo` VALUES ('10032', 'wuzhicheng', '9253', '2003-04-10', '江西', '南昌', '进贤', '1', '足球,爬山,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_qiubojuncode.jpg', '勤偷节约，积极上进', '', '411538143');
INSERT INTO `tbl_detailinfo` VALUES ('10033', 'shuweiguan', '8992.5', '2000-10-16', '广东', '东莞', '塘厦', '0', '健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_shineboyadh.jpg', '努力勤奋，上进好学', '', '421538144');
INSERT INTO `tbl_detailinfo` VALUES ('10034', 'wuyuane', '7687', '2002-08-23', '福建', '福州', '永泰', '1', '足球,爬山,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_songpengasp.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '431538145');
INSERT INTO `tbl_detailinfo` VALUES ('10035', 'wuzhihong', '2336', '2006-01-22', '江西', '宜春', '高安', '0', '排球,旅游,跑步', '/WabacusDemo/wabacusdemo/uploadfile/2_steptodream.jpg', '勤偷节约，积极上进', '', '441538146');
INSERT INTO `tbl_detailinfo` VALUES ('10036', 'wanxingguo', '8566.3', '2005-11-23', '福建', '泉州', '安溪', '0', '游泳,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_stonekind.jpg', '勤偷节约，积极上进', '', '451538147');
INSERT INTO `tbl_detailinfo` VALUES ('10037', 'fanguihong', '3246', '2001-10-25', '江西', '南昌', '新建', '1', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_tashiwoweiyi.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '461538148');
INSERT INTO `tbl_detailinfo` VALUES ('10038', 'songguozhen', '9675', '2003-06-18', '广东', '东莞', '长安', '1', '足球,爬山,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_teng_s2000.jpg', '努力勤奋，上进好学', '', '471538149');

-- ----------------------------
-- Table structure for `tbl_log`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_log`;
CREATE TABLE `tbl_log` (
  `uuid` varchar(50) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `updatetype` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_salary`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_salary`;
CREATE TABLE `tbl_salary` (
  `no` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `salary` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_salary
-- ----------------------------
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '1', '3543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '2', '3643.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '3', '3573.2');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '4', '4543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '5', '3943.8');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '6', '3547.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '7', '3549.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '8', '3543');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '9', '3544.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '10', '3343.6');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '11', '3143.4');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '12', '3943.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '1', '6343.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '2', '6743.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '3', '6843.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '4', '6543.45');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '5', '6342');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '6', '6443.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '7', '6541.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '8', '6643.5');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '9', '6844.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '10', '7573.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '11', '4593.7');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '12', '6545.13');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '1', '5463.13');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '2', '5142.2');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '3', '5343.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '4', '5543.7');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '5', '5596.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '6', '5543.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '7', '5643.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '8', '5579.9');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '9', '5543.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '10', '5540.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '11', '5583.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '12', '5841');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '1', '1583.6');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '2', '1842.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '3', '1563.8');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '4', '1443.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '5', '1508.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '6', '1543.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '7', '1643.9');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '8', '1239.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '9', '1743.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '10', '1553.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '11', '1943.5');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '12', '1812.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '1', '3542.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '2', '3713.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '3', '3541.5');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '4', '3843.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '5', '3513.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '6', '3040.7');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '7', '3543.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '8', '3523.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '9', '3243.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '10', '3527.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '11', '3143.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '12', '3549.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '1', '7543.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '2', '7570.2');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '3', '7543.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '4', '7518.6');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '5', '7543.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '6', '7543.2');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '7', '7593.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '8', '7543.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '9', '7549.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '10', '7563.6');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '11', '7540.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '12', '7510.1');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '1', '6519.1');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '2', '6343.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '3', '6547.5');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '4', '6753.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '5', '6743.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '6', '6541.7');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '7', '6993.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '8', '6507.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '9', '6043.8');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '10', '6943.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '11', '6903.8');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '12', '6213.5');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '1', '3569.23');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '2', '3643.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '3', '3529.8');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '4', '3523.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '5', '3923.8');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '6', '3544.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '7', '3543.7');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '8', '3013.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '9', '3519.9');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '10', '3313');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '11', '3153');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '12', '3189.8');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '1', '2829.2');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '2', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '3', '2610.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '4', '2542.5');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '5', '2433.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '6', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '7', '2538.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '8', '2835.6');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '9', '2518.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '10', '2557.36');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '11', '2913.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '12', '2915.35');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '1', '10546.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '2', '10513.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '3', '10240.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '4', '10543.4');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '5', '10243.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '6', '10592.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '7', '10640.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '8', '10540.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '9', '10833.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '10', '10543.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '11', '10040.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '12', '10801.6');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '1', '2830');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '2', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '3', '2122.5');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '4', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '5', '1912.6');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '6', '2143.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '7', '2508.8');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '8', '2943.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '9', '2505.8');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '10', '2703.7');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '11', '2216.6');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '12', '2731.5');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '1', '12768.6');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '2', '12643.2');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '3', '12471.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '4', '12143');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '5', '12222.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '6', '12243');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '7', '12312.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '8', '12043');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '9', '12843.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '10', '12510.2');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '11', '12643.1');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '12', '12560.8');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '1', '5546.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '2', '5523.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '3', '5543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '4', '5518.1');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '5', '5643.1');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '6', '5543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '7', '5943.2');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '8', '5549.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '9', '5443.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '10', '5523.8');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '11', '6543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '12', '5518.9');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '1', '8233.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '2', '8343.13');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '3', '8633.23');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '4', '8723.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '5', '8413.34');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '6', '8533.62');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '7', '8353.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '8', '8283.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '9', '8143.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '10', '8673.8');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '11', '8723.9');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '12', '8833.31');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '1', '6703.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '2', '6542.5');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '3', '6593.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '4', '6843.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '5', '6541.13');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '6', '6543.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '7', '6533');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '8', '6571.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '9', '6243.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '10', '6241.8');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '11', '6573.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '12', '6241.9');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '1', '2591.2');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '2', '2643.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '3', '2986.2');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '4', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '5', '2848.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '6', '2543.7');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '7', '26473.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '8', '2549.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '9', '2353.2');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '10', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '11', '2213.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '12', '2142.1');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '1', '3811.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '2', '3841.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '3', '3842.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '4', '3553.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '5', '3847.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '6', '3543.7');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '7', '3542.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '8', '3863.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '9', '3541.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '10', '3543.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '11', '3743.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '12', '3961.1');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '1', '7805.2');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '2', '7803.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '3', '7873.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '4', '7883.8');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '5', '7865.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '6', '7843.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '7', '782.4');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '8', '7841.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '9', '7843.1');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '10', '7823.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '11', '7843.1');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '12', '7810.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '1', '7519.1');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '2', '7348.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '3', '7547.5');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '4', '7558.4');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '5', '7443.8');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '6', '7541.7');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '7', '7995.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '8', '7507.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '9', '7043.2');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '10', '7943.2');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '11', '7903.8');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '12', '7215.1');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '1', '4169.23');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '2', '4243.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '3', '4529.8');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '4', '3927.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '5', '4783.8');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '6', '3844.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '7', '4543.7');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '8', '4313.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '9', '4519.9');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '10', '3813.2');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '11', '4453.2');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '12', '4189.6');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '1', '3821.2');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '2', '3543');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '3', '3115.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '4', '3542.5');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '5', '3233.8');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '6', '3545.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '7', '2538.8');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '8', '2935.6');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '9', '3513.1');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '10', '2557.9');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '11', '3013.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '12', '3016.8');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '1', '11546.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '2', '11513.1');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '3', '11240');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '4', '10943.4');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '5', '10843.7');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '6', '11592.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '7', '10646.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '8', '10930.1');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '9', '10938.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '10', '11523.6');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '11', '10940.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '12', '11209.8');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '1', '3138');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '2', '3043.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '3', '3362.5');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '4', '3245.6');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '5', '3312.7');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '6', '3547.2');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '7', '3608.4');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '8', '3042.1');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '9', '3105.2');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '10', '2902');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '11', '3216.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '12', '3035.6');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '1', '13162.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '2', '13243.5');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '3', '13178.5');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '4', '13343.5');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '5', '13128.8');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '6', '13043.8');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '7', '13612.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '8', '12546.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '9', '13345.2');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '10', '13119.1');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '11', '13049.8');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '12', '13566.3');

-- ----------------------------
-- Table structure for `tbl_testimport1`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_testimport1`;
CREATE TABLE `tbl_testimport1` (
  `no` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `salary` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_testimport1
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_testimport2`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_testimport2`;
CREATE TABLE `tbl_testimport2` (
  `no` varchar(20) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_testimport2
-- ----------------------------

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
-- Table structure for `tbl_zhaoping`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_zhaoping`;
CREATE TABLE `tbl_zhaoping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhiwei` varchar(30) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `xueli` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_zhaoping
-- ----------------------------
INSERT INTO `tbl_zhaoping` VALUES ('1', '网络工程师', '5030', '1', '本科以上');
INSERT INTO `tbl_zhaoping` VALUES ('2', '软件工程师', '6800', '3', '本科以上');
INSERT INTO `tbl_zhaoping` VALUES ('3', '高级会计师', '8000', '1', '硕士以上');
INSERT INTO `tbl_zhaoping` VALUES ('4', '计算机运行维护工程师', '4500', '2', '专科以上');
INSERT INTO `tbl_zhaoping` VALUES ('5', '策划经理', '8200', '1', '本科以上');
INSERT INTO `tbl_zhaoping` VALUES ('6', '质量管理工程师', '5500', '5', '本科以上');
INSERT INTO `tbl_zhaoping` VALUES ('7', '普工', '1200', '20', '无');
INSERT INTO `tbl_zhaoping` VALUES ('8', '厨师', '3000', '2', '无');
INSERT INTO `tbl_zhaoping` VALUES ('9', '项目经理', '8500', '2', '本科以上');

-- ----------------------------
-- Table structure for `tbl_zhaopingdesc`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_zhaopingdesc`;
CREATE TABLE `tbl_zhaopingdesc` (
  `id` int(11) NOT NULL,
  `yaoqiu` varchar(3000) DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_zhaopingdesc
-- ----------------------------
INSERT INTO `tbl_zhaopingdesc` VALUES ('1', '两年以上相关工作经验，工作刻苦，能承受工作压力，能出差', '负责公司网络架构与维护以及网络相关产品的采购');
INSERT INTO `tbl_zhaopingdesc` VALUES ('2', '三年以上相关工作经验，学习能力强，能承受工作压力，能出差', '负责公司所用软件的开发与维护，并培训公司员工使用');
INSERT INTO `tbl_zhaopingdesc` VALUES ('3', '五年以上相关工作经验，思维活跃，认真负责', '负责公司做帐');
INSERT INTO `tbl_zhaopingdesc` VALUES ('4', '工作刻苦，能承受工作压力，能出差', '负责公司所用电脑进行安装与维护');
INSERT INTO `tbl_zhaopingdesc` VALUES ('5', '三年以上相关工作经验，思维活跃，认真负责，责任心强，亲和力强', '负责公司新产品的策划以及公司其它活动的组织和策划');
INSERT INTO `tbl_zhaopingdesc` VALUES ('6', '，认真负责，工作刻苦，能承受工作压力，能出差', '负责公司产品的测试');
INSERT INTO `tbl_zhaopingdesc` VALUES ('7', '工作刻苦，积极肯干，能承受工作压力，服从安排', '负责公司产品的生产');
INSERT INTO `tbl_zhaopingdesc` VALUES ('8', '三年以上相关工作经验，工作刻苦，讲卫生', '负责公司食堂炒菜煮饭');
INSERT INTO `tbl_zhaopingdesc` VALUES ('9', '三年以上相关工作经验，表达能力强，亲和力强', '负责领导公司产品小组的开发与测试');

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('2', 'test2');
INSERT INTO `test` VALUES ('1', 'test1');
INSERT INTO `test` VALUES ('1', 'test3');

-- ----------------------------
-- Table structure for `test2`
-- ----------------------------
DROP TABLE IF EXISTS `test2`;
CREATE TABLE `test2` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test2
-- ----------------------------
INSERT INTO `test2` VALUES ('1', 'test1');
INSERT INTO `test2` VALUES ('2', 'test2');
INSERT INTO `test2` VALUES ('3', 'test3');

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
-- Table structure for `t_event`
-- ----------------------------
DROP TABLE IF EXISTS `t_event`;
CREATE TABLE `t_event` (
  `eventId` varchar(255) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_event
-- ----------------------------
INSERT INTO `t_event` VALUES ('1339912214726', '2012-06-15 00:00:00', '2012-06-15 00:05:00', 'xxx', null);
INSERT INTO `t_event` VALUES ('1340007001840', '2012-06-16 00:00:00', '2012-06-16 00:05:00', '新建 event', '新建 event');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test1', 'test_1', '111111', null, null, null);
INSERT INTO `user` VALUES ('2', 'test2', 'test2', '111111', null, null, null);
INSERT INTO `user` VALUES ('3', 'test3', 'test3', null, null, null, null);
INSERT INTO `user` VALUES ('4', 'test4', 'test4', null, null, null, null);
INSERT INTO `user` VALUES ('5', 'test5', 'test5', null, null, null, null);
INSERT INTO `user` VALUES ('6', 'test6', 'test6', null, null, null, null);
INSERT INTO `user` VALUES ('7', 'test7', 'test7', null, null, null, null);
INSERT INTO `user` VALUES ('8', 'test8', 'test8', null, null, null, null);
INSERT INTO `user` VALUES ('9', 'test9', 'test9', null, null, null, null);
INSERT INTO `user` VALUES ('10', 'test10', 'test10', null, null, null, null);
INSERT INTO `user` VALUES ('11', 'test11', 'test11', null, null, null, null);
INSERT INTO `user` VALUES ('12', 'test12', 'test12', null, null, null, null);
INSERT INTO `user` VALUES ('13', 'test13', 'test13', null, null, null, null);
INSERT INTO `user` VALUES ('14', 'test14', 'test14', null, null, null, null);
INSERT INTO `user` VALUES ('15', 'test15', 'test15', null, null, null, null);
INSERT INTO `user` VALUES ('16', 'test16', 'test16', null, null, null, null);
INSERT INTO `user` VALUES ('17', 'test17', 'test17', null, null, null, null);
INSERT INTO `user` VALUES ('18', 'test18', 'test18', null, null, null, null);
INSERT INTO `user` VALUES ('19', 'test19', 'test19', null, null, null, null);
INSERT INTO `user` VALUES ('20', 'test20', 'test20', null, null, null, null);
INSERT INTO `user` VALUES ('21', 'test21', 'test21', null, null, null, null);
INSERT INTO `user` VALUES ('22', 'test22', 'test22', null, null, null, null);
INSERT INTO `user` VALUES ('23', 'test23', 'test23', null, null, null, null);
INSERT INTO `user` VALUES ('24', 'test24', 'test24', null, null, null, null);
INSERT INTO `user` VALUES ('25', 'test25', 'test25', null, null, null, null);
INSERT INTO `user` VALUES ('26', 'test26', 'test26', null, null, null, null);
INSERT INTO `user` VALUES ('27', 'test27', 'test27', null, null, null, null);
INSERT INTO `user` VALUES ('28', 'test28', 'test28', null, null, null, null);
INSERT INTO `user` VALUES ('29', 'test29', 'test29', null, null, null, null);
INSERT INTO `user` VALUES ('30', 'test30', 'test30', null, null, null, null);
INSERT INTO `user` VALUES ('31', 'test31', 'test31', null, null, null, null);
INSERT INTO `user` VALUES ('32', 'admin', 'admin', 'root', null, null, null);
INSERT INTO `user` VALUES ('33', 'admin_1', 'admin_1', '****', 'amdin@g.cn', '1111', '11');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `USERNAME` varchar(10) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  `ENABLED` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', 'secret', '1');
INSERT INTO `users` VALUES ('user1', '111111', '1');
INSERT INTO `users` VALUES ('user2', '111111', '0');

-- ----------------------------
-- Table structure for `user_copy`
-- ----------------------------
DROP TABLE IF EXISTS `user_copy`;
CREATE TABLE `user_copy` (
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
-- Records of user_copy
-- ----------------------------
INSERT INTO `user_copy` VALUES ('1', 'test1', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('2', 'test2', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('3', 'test3', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('4', 'test4', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('5', 'test5', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('6', 'test6', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('7', 'test7', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('8', 'test8', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('9', 'test9', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('10', 'test10', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('11', 'test11', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('12', 'test12', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('13', 'test13', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('14', 'test14', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('15', 'test15', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('16', 'test16', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('17', 'test17', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('18', 'test18', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('19', 'test19', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('20', 'test20', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('21', 'test21', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('22', 'test22', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('23', 'test23', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('24', 'test24', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('25', 'test25', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('26', 'test26', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('27', 'test27', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('28', 'test28', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('29', 'test29', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('30', 'test30', null, null, null, null, null);
INSERT INTO `user_copy` VALUES ('31', 'test31', null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userid` bigint(20) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('32', 'ROLE_USER');
INSERT INTO `user_role` VALUES ('32', 'ROLE_ADMIN');
INSERT INTO `user_role` VALUES ('1', 'ROLE_USER');

-- ----------------------------
-- Table structure for `vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `VEHICLE_NO` varchar(20) NOT NULL,
  `COLOR` varchar(10) DEFAULT NULL,
  `WHEEL` int(11) DEFAULT NULL,
  `SEAT` int(11) DEFAULT NULL,
  PRIMARY KEY (`VEHICLE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES ('TEM0001', 'Red', '4', '4');
INSERT INTO `vehicle` VALUES ('TEM0002', 'Blue', '4', '4');
INSERT INTO `vehicle` VALUES ('TEM0003', 'Black', '4', '6');

-- ----------------------------
-- Procedure structure for `proc_batch_insert`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_batch_insert`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_batch_insert`()
BEGIN
	DECLARE i int default 1;
    WHILE(i < 500) DO
        insert into user (name,username,password,email) values (concat('test',i),CONCAT('测试人员',i),123,contact('test',i,'@g.cn'));
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

-- ----------------------------
-- Procedure structure for `sp_selectEmployeeData`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_selectEmployeeData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_selectEmployeeData`(
    txtno varchar(20),
    txtprovince varchar(30),
    txtage varchar(30),
    i_systeminfo varchar(3000),
    out o_systeminfo varchar(50)
)
BEGIN
    declare var_sql varchar(1000);    
    set var_sql='SELECT A.no,name,ename,sex,age,salary,marriage,birthday,joinindate,province,city,county,description FROM tbl_baseinfo A left join tbl_detailinfo B on A.no=B.no where  1=1';
    if txtno<>'' then set var_sql=concat(var_sql,' and A.no like  \'%',txtno,'%\''); end if;
    if txtprovince<>'' then set var_sql=concat(var_sql,' and province like  \'%',txtprovince,'%\''); end if;
    if txtage<>'' then set var_sql=concat(var_sql,' and A.age >=',txtage); end if;
    call SP_WABACUS_EXECUTE (var_sql,'no,name desc',i_systeminfo,o_systeminfo);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_testDeleteData`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_testDeleteData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_testDeleteData`(
    in_deptno varchar(20)
)
BEGIN
     delete from tbl_department where deptno=in_deptno;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_testInsertData`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_testInsertData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_testInsertData`(
    in_uuid varchar(50),
    in_deptno varchar(20),
    in_deptname varchar(30),
    in_manager varchar(30),
    in_builtdate datetime,
    in_performance varchar(20),
    in_description varchar(3000),
    out out_rtnValue varchar(500)
)
BEGIN
    insert into tbl_department(guid,deptno,deptname,manager,builtdate,performance,description) values (in_uuid,in_deptno,in_deptname,in_manager,in_builtdate,in_performance,in_description);
    set out_rtnValue=concat('添加工号：',in_deptno,'，姓名：',in_deptname,'的记录成功');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_testUpdateData`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_testUpdateData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_testUpdateData`(
    in_deptno varchar(20),
    in_deptno_old varchar(20),
    in_manager varchar(30),
    in_builtdate datetime,
    in_performance varchar(20),
    in_description varchar(3000),
    out out_rtnValue varchar(50)
)
BEGIN
    update tbl_department set deptno=in_deptno,manager=in_manager,builtdate=in_builtdate,performance=in_performance,description=in_description where deptno=in_deptno_old;
    set out_rtnValue=concat('修改工号：',in_deptno_old,'的记录成功');
END
;;
DELIMITER ;
