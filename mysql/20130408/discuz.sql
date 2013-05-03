/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : discuz

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2013-04-08 17:04:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cdb_access`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_access`;
CREATE TABLE `cdb_access` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowview` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowreply` tinyint(1) NOT NULL DEFAULT '0',
  `allowgetattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostattach` tinyint(1) NOT NULL DEFAULT '0',
  `adminuser` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fid`),
  KEY `listorder` (`fid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_access
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_activities`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_activities`;
CREATE TABLE `cdb_activities` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `starttimefrom` int(10) unsigned NOT NULL DEFAULT '0',
  `starttimeto` int(10) unsigned NOT NULL DEFAULT '0',
  `place` char(40) NOT NULL DEFAULT '',
  `class` char(20) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `uid` (`uid`,`starttimefrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_activities
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_activityapplies`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_activityapplies`;
CREATE TABLE `cdb_activityapplies` (
  `applyid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` char(200) NOT NULL DEFAULT '',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` mediumint(8) NOT NULL DEFAULT '0',
  `contact` char(200) NOT NULL,
  PRIMARY KEY (`applyid`),
  KEY `uid` (`uid`),
  KEY `tid` (`tid`),
  KEY `dateline` (`tid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_activityapplies
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_addons`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_addons`;
CREATE TABLE `cdb_addons` (
  `key` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sitename` varchar(255) NOT NULL DEFAULT '',
  `siteurl` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_addons
-- ----------------------------
INSERT INTO `cdb_addons` VALUES ('25z5wh0o00', 'Comsenz', 'Comsenz', 'http://www.comsenz.com', 'Comsenz官方网站推荐的论坛模板与插件', 'ts@comsenz.com', 'http://www.comsenz.com/addon/logo.gif', '1');
INSERT INTO `cdb_addons` VALUES ('R051uc9D1i', 'DPS', 'DPS', 'http://bbs.7dps.com', '提供 Discuz! 插件与风格，享受一键安装/升级/卸载带来的快感，还提供少量风格。', 'http://bbs.7dps.com/thread-1646-1-1.html', 'http://api.7dps.com/addons/logo.gif', '0');

-- ----------------------------
-- Table structure for `cdb_adminactions`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_adminactions`;
CREATE TABLE `cdb_adminactions` (
  `admingid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `disabledactions` text NOT NULL,
  PRIMARY KEY (`admingid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_adminactions
-- ----------------------------
INSERT INTO `cdb_adminactions` VALUES ('18', 'a:1:{i:0;s:9:\"_readonly\";}');

-- ----------------------------
-- Table structure for `cdb_admincustom`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_admincustom`;
CREATE TABLE `cdb_admincustom` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL,
  `clicks` smallint(6) unsigned NOT NULL DEFAULT '1',
  `uid` mediumint(8) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_admincustom
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_admingroups`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_admingroups`;
CREATE TABLE `cdb_admingroups` (
  `admingid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `alloweditpost` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditpoll` tinyint(1) NOT NULL DEFAULT '0',
  `allowstickthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowmodpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowdelpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowmassprune` tinyint(1) NOT NULL DEFAULT '0',
  `allowrefund` tinyint(1) NOT NULL DEFAULT '0',
  `allowcensorword` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewip` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanip` tinyint(1) NOT NULL DEFAULT '0',
  `allowedituser` tinyint(1) NOT NULL DEFAULT '0',
  `allowmoduser` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanuser` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostannounce` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewlog` tinyint(1) NOT NULL DEFAULT '0',
  `allowbanpost` tinyint(1) NOT NULL DEFAULT '0',
  `disablepostctrl` tinyint(1) NOT NULL DEFAULT '0',
  `supe_allowpushthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowhighlightthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowdigestthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowrecommendthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowbumpthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowclosethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowmovethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowedittypethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowstampthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowcopythread` tinyint(1) NOT NULL DEFAULT '0',
  `allowmergethread` tinyint(1) NOT NULL DEFAULT '0',
  `allowsplitthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowrepairthread` tinyint(1) NOT NULL DEFAULT '0',
  `allowwarnpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewreport` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditforum` tinyint(1) NOT NULL DEFAULT '0',
  `allowremovereward` tinyint(1) NOT NULL DEFAULT '0',
  `allowedittrade` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditactivity` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admingid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_admingroups
-- ----------------------------
INSERT INTO `cdb_admingroups` VALUES ('1', '1', '1', '3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `cdb_admingroups` VALUES ('2', '1', '0', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0');
INSERT INTO `cdb_admingroups` VALUES ('3', '1', '0', '1', '1', '1', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1', '1', '1', '0', '1', '3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0');
INSERT INTO `cdb_admingroups` VALUES ('16', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0');
INSERT INTO `cdb_admingroups` VALUES ('17', '1', '0', '2', '1', '0', '0', '1', '0', '1', '0', '0', '0', '0', '1', '1', '1', '1', '0', '1', '3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0');
INSERT INTO `cdb_admingroups` VALUES ('18', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_admingroups` VALUES ('19', '0', '0', '0', '1', '0', '0', '0', '0', '1', '1', '0', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `cdb_adminnotes`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_adminnotes`;
CREATE TABLE `cdb_adminnotes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `access` tinyint(3) NOT NULL DEFAULT '0',
  `adminid` tinyint(3) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_adminnotes
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_adminsessions`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_adminsessions`;
CREATE TABLE `cdb_adminsessions` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adminid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `panel` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `errorcount` tinyint(1) NOT NULL DEFAULT '0',
  `storage` mediumtext NOT NULL,
  PRIMARY KEY (`uid`,`panel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_adminsessions
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_advertisements`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_advertisements`;
CREATE TABLE `cdb_advertisements` (
  `advid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `targets` text NOT NULL,
  `parameters` text NOT NULL,
  `code` text NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`advid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_advertisements
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_announcements`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_announcements`;
CREATE TABLE `cdb_announcements` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `groups` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `timespan` (`starttime`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_announcements
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_attachmentfields`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_attachmentfields`;
CREATE TABLE `cdb_attachmentfields` (
  `aid` mediumint(8) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`,`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_attachmentfields
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_attachments`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_attachments`;
CREATE TABLE `cdb_attachments` (
  `aid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `width` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) unsigned NOT NULL DEFAULT '0',
  `filename` char(100) NOT NULL DEFAULT '',
  `filetype` char(50) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment` char(100) NOT NULL DEFAULT '',
  `downloads` mediumint(8) NOT NULL DEFAULT '0',
  `isimage` tinyint(1) NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `thumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `tid` (`tid`),
  KEY `pid` (`pid`,`aid`),
  KEY `uid` (`uid`),
  KEY `dateline` (`dateline`,`isimage`,`downloads`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_attachpaymentlog`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_attachpaymentlog`;
CREATE TABLE `cdb_attachpaymentlog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `netamount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`,`uid`),
  KEY `uid` (`uid`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_attachpaymentlog
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_attachtypes`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_attachtypes`;
CREATE TABLE `cdb_attachtypes` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `extension` char(12) NOT NULL DEFAULT '',
  `maxsize` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_attachtypes
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_banned`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_banned`;
CREATE TABLE `cdb_banned` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `ip1` smallint(3) NOT NULL DEFAULT '0',
  `ip2` smallint(3) NOT NULL DEFAULT '0',
  `ip3` smallint(3) NOT NULL DEFAULT '0',
  `ip4` smallint(3) NOT NULL DEFAULT '0',
  `admin` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_banned
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_bbcodes`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_bbcodes`;
CREATE TABLE `cdb_bbcodes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `tag` varchar(100) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL,
  `replacement` text NOT NULL,
  `example` varchar(255) NOT NULL DEFAULT '',
  `explanation` text NOT NULL,
  `params` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `prompt` text NOT NULL,
  `nest` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_bbcodes
-- ----------------------------
INSERT INTO `cdb_bbcodes` VALUES ('1', '0', 'fly', 'bb_fly.gif', '<marquee width=\"90%\" behavior=\"alternate\" scrollamount=\"3\">{1}</marquee>', '[fly]This is sample text[/fly]', '使内容横向滚动，这个效果类似 HTML 的 marquee 标签，注意：这个效果只在 Internet Explorer 浏览器下有效。', '1', '请输入滚动显示的文字:', '1', '19');
INSERT INTO `cdb_bbcodes` VALUES ('2', '1', 'qq', 'bb_qq.gif', '<a href=\"http://wpa.qq.com/msgrd?V=1&Uin={1}&amp;Site=[Discuz!]&amp;Menu=yes\" target=\"_blank\"><img src=\"http://wpa.qq.com/pa?p=1:{1}:1\" border=\"0\"></a>', '[qq]688888[/qq]', '显示 QQ 在线状态，点这个图标可以和他（她）聊天', '1', '请输入显示在线状态 QQ 号码:', '1', '21');
INSERT INTO `cdb_bbcodes` VALUES ('3', '0', 'sup', 'bb_sup.gif', '<sup>{1}</sup>', 'X[sup]2[/sup]', '上标', '1', '请输入上标文字：', '1', '22');
INSERT INTO `cdb_bbcodes` VALUES ('4', '0', 'sub', 'bb_sub.gif', '<sub>{1}</sub>', 'X[sub]2[/sub]', '下标', '1', '请输入下标文字：', '1', '23');

-- ----------------------------
-- Table structure for `cdb_caches`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_caches`;
CREATE TABLE `cdb_caches` (
  `cachename` varchar(32) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `expiration` int(10) unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`cachename`),
  KEY `expiration` (`type`,`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_caches
-- ----------------------------
INSERT INTO `cdb_caches` VALUES ('settings', '1', '1342582747', '0', '$_DCACHE[\'settings\'] = array (\n  \'accessemail\' => \'\',\n  \'activitytype\' => \'朋友聚会\r\n出外郊游\r\n自驾出行\r\n公益活动\r\n线上活动\',\n  \'adminipaccess\' => \'\',\n  \'admode\' => \'1\',\n  \'archiverstatus\' => \'1\',\n  \'attachbanperiods\' => \'\',\n  \'attachdir\' => \'C:/wamp/www/upload/./attachments\',\n  \'attachexpire\' => \'\',\n  \'attachimgpost\' => \'1\',\n  \'attachrefcheck\' => \'0\',\n  \'attachsave\' => \'3\',\n  \'attachurl\' => \'attachments\',\n  \'authkey\' => \'75a1bf4iY1PEmJf6\',\n  \'authoronleft\' => \'0\',\n  \'avatarmethod\' => \'0\',\n  \'baidusitemap\' => \'1\',\n  \'baidusitemap_life\' => \'12\',\n  \'bannedmessages\' => \'1\',\n  \'bbclosed\' => \'\',\n  \'bbname\' => \'Discuz! Board\',\n  \'bdaystatus\' => \'0\',\n  \'boardlicensed\' => \'0\',\n  \'cacheindexlife\' => \'0\',\n  \'cachethreaddir\' => \'forumdata/threadcaches\',\n  \'cachethreadlife\' => \'0\',\n  \'censoremail\' => \'\',\n  \'censoruser\' => \'\',\n  \'creditnotice\' => \'1\',\n  \'creditsformula\' => \'$member[\\\'extcredits1\\\']\',\n  \'creditsformulaexp\' => \'\',\n  \'creditspolicy\' => \n  array (\n    \'post\' => \n    array (\n    ),\n    \'reply\' => \n    array (\n    ),\n    \'digest\' => \n    array (\n      1 => 10,\n    ),\n    \'postattach\' => \n    array (\n    ),\n    \'getattach\' => \n    array (\n    ),\n    \'sendpm\' => \n    array (\n    ),\n    \'search\' => \n    array (\n    ),\n    \'promotion_visit\' => \n    array (\n    ),\n    \'promotion_register\' => \n    array (\n    ),\n    \'tradefinished\' => \n    array (\n    ),\n    \'votepoll\' => \n    array (\n    ),\n    \'lowerlimit\' => \n    array (\n    ),\n  ),\n  \'creditstax\' => \'0.2\',\n  \'creditstrans\' => \'2\',\n  \'dateconvert\' => \'1\',\n  \'dateformat\' => \'Y-n-j\',\n  \'debug\' => \'1\',\n  \'delayviewcount\' => \'0\',\n  \'deletereason\' => \'\',\n  \'disallowfloat\' => \'newthread|reply\',\n  \'doublee\' => \'1\',\n  \'dupkarmarate\' => \'0\',\n  \'dzfeed_limit\' => \n  array (\n    \'thread_replies\' => \n    array (\n      0 => \'100\',\n      1 => \'1000\',\n      2 => \'2000\',\n      3 => \'10000\',\n    ),\n    \'thread_views\' => \n    array (\n      0 => \'500\',\n      1 => \'5000\',\n      2 => \'10000\',\n    ),\n    \'thread_rate\' => \n    array (\n      0 => \'50\',\n      1 => \'200\',\n      2 => \'500\',\n    ),\n    \'post_rate\' => \n    array (\n      0 => \'20\',\n      1 => \'100\',\n      2 => \'300\',\n    ),\n    \'user_usergroup\' => \n    array (\n      0 => \'12\',\n      1 => \'13\',\n      2 => \'14\',\n      3 => \'15\',\n    ),\n    \'user_credit\' => \n    array (\n      0 => \'1000\',\n      1 => \'10000\',\n      2 => \'100000\',\n    ),\n    \'user_threads\' => \n    array (\n      0 => \'100\',\n      1 => \'500\',\n      2 => \'1000\',\n      3 => \'5000\',\n      4 => \'10000\',\n    ),\n    \'user_posts\' => \n    array (\n      0 => \'500\',\n      1 => \'1000\',\n      2 => \'5000\',\n      3 => \'10000\',\n    ),\n    \'user_digest\' => \n    array (\n      0 => \'50\',\n      1 => \'100\',\n      2 => \'500\',\n      3 => \'1000\',\n    ),\n  ),\n  \'ec_account\' => \'\',\n  \'ec_credit\' => \n  array (\n    \'maxcreditspermonth\' => 6,\n    \'rank\' => \n    array (\n      1 => 4,\n      2 => 11,\n      3 => 41,\n      4 => 91,\n      5 => 151,\n      6 => 251,\n      7 => 501,\n      8 => 1001,\n      9 => 2001,\n      10 => 5001,\n      11 => 10001,\n      12 => 20001,\n      13 => 50001,\n      14 => 100001,\n      15 => 200001,\n    ),\n  ),\n  \'ec_maxcredits\' => \'1000\',\n  \'ec_maxcreditspermonth\' => \'0\',\n  \'ec_mincredits\' => \'0\',\n  \'ec_ratio\' => \'0\',\n  \'ec_tenpay_bargainor\' => \'\',\n  \'ec_tenpay_key\' => \'\',\n  \'editedby\' => \'1\',\n  \'editoroptions\' => \'1\',\n  \'edittimelimit\' => \'\',\n  \'exchangemincredits\' => \'100\',\n  \'extcredits\' => \n  array (\n    1 => \n    array (\n      \'title\' => \'威望\',\n      \'showinthread\' => \'\',\n      \'img\' => \'\',\n    ),\n    2 => \n    array (\n      \'title\' => \'金钱\',\n      \'showinthread\' => \'\',\n      \'img\' => \'\',\n    ),\n  ),\n  \'fastpost\' => \'1\',\n  \'floodctrl\' => \'15\',\n  \'forumjump\' => \'0\',\n  \'forumlinkstatus\' => \'1\',\n  \'frameon\' => \'0\',\n  \'framewidth\' => \'180\',\n  \'ftp\' => \n  array (\n    \'on\' => \'0\',\n    \'ssl\' => \'0\',\n    \'host\' => \'\',\n    \'port\' => \'21\',\n    \'username\' => \'\',\n    \'password\' => \'\',\n    \'attachdir\' => \'.\',\n    \'attachurl\' => \'\',\n    \'hideurl\' => \'0\',\n    \'timeout\' => \'0\',\n    \'connid\' => 0,\n  ),\n  \'globalstick\' => \'1\',\n  \'google\' => \'1\',\n  \'gzipcompress\' => \'0\',\n  \'heatthread\' => \n  array (\n    \'reply\' => 5,\n    \'recommend\' => 3,\n    \'hottopic\' => \'50,100,200\',\n    \'iconlevels\' => \n    array (\n    ),\n  ),\n  \'hideprivate\' => \'1\',\n  \'historyposts\' => \'1	1\',\n  \'hottopic\' => \'10\',\n  \'icp\' => \'\',\n  \'imagelib\' => \'0\',\n  \'indexhot\' => false,\n  \'indexname\' => \'index.php\',\n  \'indextype\' => \'classics\',\n  \'infosidestatus\' => false,\n  \'initcredits\' => \'0,0,0,0,0,0,0,0,0\',\n  \'ipaccess\' => \'\',\n  \'jscachelife\' => \'1800\',\n  \'jsdateformat\' => \'\',\n  \'jspath\' => \'forumdata/cache/\',\n  \'jsrefdomains\' => \'\',\n  \'jsstatus\' => \'0\',\n  \'karmaratelimit\' => \'0\',\n  \'loadctrl\' => \'0\',\n  \'losslessdel\' => \'365\',\n  \'magicdiscount\' => \'85\',\n  \'magicmarket\' => \'1\',\n  \'magicstatus\' => \'1\',\n  \'mail\' => \'a:10:{s:8:\"mailsend\";s:1:\"1\";s:6:\"server\";s:13:\"smtp.21cn.com\";s:4:\"port\";s:2:\"25\";s:4:\"auth\";s:1:\"1\";s:4:\"from\";s:26:\"Discuz <username@21cn.com>\";s:13:\"auth_username\";s:17:\"username@21cn.com\";s:13:\"auth_password\";s:8:\"password\";s:13:\"maildelimiter\";s:1:\"0\";s:12:\"mailusername\";s:1:\"1\";s:15:\"sendmail_silent\";s:1:\"1\";}\',\n  \'maxavatarpixel\' => \'120\',\n  \'maxavatarsize\' => \'20000\',\n  \'maxbdays\' => \'0\',\n  \'maxchargespan\' => \'0\',\n  \'maxfavorites\' => \'100\',\n  \'maxincperthread\' => \'0\',\n  \'maxmagicprice\' => \'50\',\n  \'maxmodworksmonths\' => \'3\',\n  \'maxonlinelist\' => \'0\',\n  \'maxpolloptions\' => \'10\',\n  \'maxpostsize\' => \'10000\',\n  \'maxsearchresults\' => \'500\',\n  \'maxsigrows\' => \'100\',\n  \'maxsmilies\' => \'10\',\n  \'maxspm\' => \'0\',\n  \'membermaxpages\' => \'100\',\n  \'memberperpage\' => \'25\',\n  \'memliststatus\' => \'1\',\n  \'minpostsize\' => \'10\',\n  \'moddisplay\' => \'flat\',\n  \'modratelimit\' => \'0\',\n  \'modworkstatus\' => \'1\',\n  \'msgforward\' => \'a:3:{s:11:\"refreshtime\";i:3;s:5:\"quick\";i:1;s:8:\"messages\";a:13:{i:0;s:19:\"thread_poll_succeed\";i:1;s:19:\"thread_rate_succeed\";i:2;s:23:\"usergroups_join_succeed\";i:3;s:23:\"usergroups_exit_succeed\";i:4;s:25:\"usergroups_update_succeed\";i:5;s:20:\"buddy_update_succeed\";i:6;s:17:\"post_edit_succeed\";i:7;s:18:\"post_reply_succeed\";i:8;s:24:\"post_edit_delete_succeed\";i:9;s:22:\"post_newthread_succeed\";i:10;s:13:\"admin_succeed\";i:11;s:17:\"pm_delete_succeed\";i:12;s:15:\"search_redirect\";}}\',\n  \'msn\' => \n  array (\n    \'on\' => 0,\n    \'domain\' => \'discuz.org\',\n  ),\n  \'newbiespan\' => \'0\',\n  \'newbietasks\' => \n  array (\n  ),\n  \'newbietaskupdate\' => \'\',\n  \'nocacheheaders\' => \'0\',\n  \'oltimespan\' => \'10\',\n  \'onlinehold\' => 900,\n  \'onlinerecord\' => \'1	1040034649\',\n  \'outextcredits\' => \n  array (\n    \'|\' => \n    array (\n      \'title\' => NULL,\n      \'unit\' => NULL,\n      \'ratiosrc\' => \n      array (\n        \'\' => NULL,\n      ),\n      \'ratiodesc\' => \n      array (\n        \'\' => NULL,\n      ),\n      \'creditsrc\' => \n      array (\n        \'\' => NULL,\n      ),\n    ),\n  ),\n  \'postbanperiods\' => \'\',\n  \'postmodperiods\' => \'\',\n  \'postperpage\' => \'10\',\n  \'pvfrequence\' => \'60\',\n  \'pwdsafety\' => \'\',\n  \'qihoo\' => \n  array (\n  ),\n  \'ratelogrecord\' => \'5\',\n  \'recommendthread\' => \n  array (\n    \'allow\' => 0,\n  ),\n  \'regctrl\' => \'0\',\n  \'regfloodctrl\' => \'0\',\n  \'reglinkname\' => \'注册\',\n  \'regname\' => \'register.php\',\n  \'regstatus\' => \'1\',\n  \'regverify\' => \'0\',\n  \'relatedtag\' => false,\n  \'reportpost\' => \'1\',\n  \'rewritecompatible\' => \'\',\n  \'rewritestatus\' => \'0\',\n  \'rssstatus\' => \'1\',\n  \'rssttl\' => \'60\',\n  \'runwizard\' => \'1\',\n  \'searchbanperiods\' => \'\',\n  \'searchctrl\' => \'30\',\n  \'seccodedata\' => \n  array (\n    \'minposts\' => \'\',\n    \'loginfailedcount\' => 0,\n    \'width\' => 150,\n    \'height\' => 60,\n    \'type\' => \'0\',\n    \'background\' => \'1\',\n    \'adulterate\' => \'1\',\n    \'ttf\' => \'0\',\n    \'angle\' => \'0\',\n    \'color\' => \'1\',\n    \'size\' => \'0\',\n    \'shadow\' => \'1\',\n    \'animator\' => \'0\',\n  ),\n  \'seccodestatus\' => \'0\',\n  \'seclevel\' => \'1\',\n  \'secqaa\' => \n  array (\n    \'status\' => \n    array (\n      1 => \'0\',\n      2 => \'0\',\n      3 => \'0\',\n    ),\n  ),\n  \'seodescription\' => \'\',\n  \'seohead\' => \'\',\n  \'seokeywords\' => \'\',\n  \'seotitle\' => \'\',\n  \'showemail\' => \'\',\n  \'showimages\' => \'1\',\n  \'showsettings\' => \'7\',\n  \'sigviewcond\' => \'0\',\n  \'sitemessage\' => \n  array (\n    \'time\' => 0,\n    \'register\' => \'\',\n    \'login\' => \'\',\n    \'newthread\' => \'\',\n    \'reply\' => \'\',\n  ),\n  \'sitename\' => \'Comsenz Inc.\',\n  \'siteurl\' => \'http://www.comsenz.com/\',\n  \'smcols\' => \'8\',\n  \'smrows\' => \'5\',\n  \'smthumb\' => \'20\',\n  \'spacedata\' => \n  array (\n    \'cachelife\' => \'900\',\n    \'limitmythreads\' => \'5\',\n    \'limitmyreplies\' => \'5\',\n    \'limitmyrewards\' => \'5\',\n    \'limitmytrades\' => \'5\',\n    \'limitmyvideos\' => \'0\',\n    \'limitmyblogs\' => \'8\',\n    \'limitmyfriends\' => \'0\',\n    \'limitmyfavforums\' => \'5\',\n    \'limitmyfavthreads\' => \'0\',\n    \'textlength\' => \'300\',\n  ),\n  \'spacestatus\' => \'1\',\n  \'starthreshold\' => \'2\',\n  \'statcode\' => \'\',\n  \'statscachelife\' => \'180\',\n  \'statstatus\' => \'\',\n  \'styleid\' => \'1\',\n  \'stylejump\' => \'1\',\n  \'subforumsindex\' => \'\',\n  \'swfupload\' => \'1\',\n  \'tagstatus\' => \'1\',\n  \'taskon\' => \'0\',\n  \'threadmaxpages\' => \'1000\',\n  \'threadsticky\' => \n  array (\n    0 => \'全局置顶\',\n    1 => \'分类置顶\',\n    2 => \'本版置顶\',\n  ),\n  \'thumbheight\' => \'300\',\n  \'thumbquality\' => \'100\',\n  \'thumbstatus\' => \'0\',\n  \'thumbwidth\' => \'400\',\n  \'timeformat\' => \'H:i\',\n  \'timeoffset\' => \'8\',\n  \'topicperpage\' => \'20\',\n  \'tradetypes\' => \n  array (\n  ),\n  \'transfermincredits\' => \'1000\',\n  \'transsidstatus\' => \'0\',\n  \'uc\' => \n  array (\n    \'addfeed\' => 1,\n  ),\n  \'ucactivation\' => \'1\',\n  \'upgradeurl\' => \'http://localhost/develop/dzhead/develop/upgrade.php\',\n  \'userdateformat\' => \n  array (\n    0 => \'Y-n-j\',\n    1 => \'Y/n/j\',\n    2 => \'j-n-Y\',\n    3 => \'j/n/Y\',\n  ),\n  \'userstatusby\' => \'1\',\n  \'viewthreadtags\' => \'100\',\n  \'visitbanperiods\' => \'\',\n  \'visitedforums\' => \'10\',\n  \'vtonlinestatus\' => \'1\',\n  \'wapcharset\' => \'2\',\n  \'wapdateformat\' => \'n/j\',\n  \'wapmps\' => \'500\',\n  \'wapppp\' => \'5\',\n  \'wapregister\' => \'0\',\n  \'wapstatus\' => \'0\',\n  \'waptpp\' => \'10\',\n  \'warningexpiration\' => \'3\',\n  \'warninglimit\' => \'3\',\n  \'watermarkminheight\' => \'0\',\n  \'watermarkminwidth\' => \'0\',\n  \'watermarkquality\' => \'80\',\n  \'watermarkstatus\' => \'0\',\n  \'watermarktext\' => \n  array (\n  ),\n  \'watermarktrans\' => \'65\',\n  \'watermarktype\' => \'0\',\n  \'welcomemsgtitle\' => \'{username}，您好，感谢您的注册，请阅读以下内容。\',\n  \'whosonlinestatus\' => \'1\',\n  \'whosonline_contract\' => \'0\',\n  \'zoomstatus\' => \'1\',\n  \'ratelogon\' => \'0\',\n  \'forumseparator\' => \'1\',\n  \'allowattachurl\' => \'0\',\n  \'allowviewuserthread\' => \'\',\n  \'tasktypes\' => \'a:3:{s:9:\"promotion\";a:2:{s:4:\"name\";s:18:\"论坛推广任务\";s:7:\"version\";s:3:\"1.0\";}s:4:\"gift\";a:2:{s:4:\"name\";s:15:\"红包类任务\";s:7:\"version\";s:3:\"1.0\";}s:6:\"avatar\";a:2:{s:4:\"name\";s:15:\"头像类任务\";s:7:\"version\";s:3:\"1.0\";}}\',\n  \'version\' => \'7.2\',\n  \'totalmembers\' => \'1\',\n  \'lastmember\' => \'admin\',\n  \'cachethreadon\' => 0,\n  \'cronnextrun\' => \'1342586347\',\n  \'styles\' => \n  array (\n    1 => \'默认风格\',\n  ),\n  \'stylejumpstatus\' => false,\n  \'globaladvs\' => \n  array (\n  ),\n  \'redirectadvs\' => \n  array (\n  ),\n  \'invitecredit\' => \'\',\n  \'creditnames\' => \'1|威望|,2|金钱|\',\n  \'creditstransextra\' => \n  array (\n    1 => \'2\',\n    2 => \'2\',\n    3 => \'2\',\n    4 => \'2\',\n    5 => \'2\',\n  ),\n  \'exchangestatus\' => false,\n  \'transferstatus\' => true,\n  \'imagemaxwidth\' => NULL,\n  \'promptpmids\' => \n  array (\n    0 => \'4\',\n    1 => \'5\',\n    2 => \'6\',\n  ),\n  \'promptkeys\' => \n  array (\n    1 => \'pm\',\n    2 => \'announcepm\',\n    4 => \'systempm\',\n    5 => \'friend\',\n    6 => \'threads\',\n  ),\n  \'prompts\' => \n  array (\n    \'pm\' => \n    array (\n      \'name\' => \'私人消息\',\n      \'script\' => \'pm.php?filter=newpm\',\n      \'id\' => \'1\',\n      \'new\' => 0,\n    ),\n    \'announcepm\' => \n    array (\n      \'name\' => \'公共消息\',\n      \'script\' => \'pm.php?filter=announcepm\',\n      \'id\' => \'2\',\n      \'new\' => 0,\n    ),\n    \'systempm\' => \n    array (\n      \'name\' => \'系统消息\',\n      \'script\' => \'\',\n      \'id\' => \'4\',\n      \'new\' => 0,\n    ),\n    \'friend\' => \n    array (\n      \'name\' => \'好友消息\',\n      \'script\' => \'\',\n      \'id\' => \'5\',\n      \'new\' => 0,\n    ),\n    \'threads\' => \n    array (\n      \'name\' => \'帖子消息\',\n      \'script\' => \'\',\n      \'id\' => \'6\',\n      \'new\' => 0,\n    ),\n  ),\n  \'announcepm\' => \'0\',\n  \'specialicon\' => \n  array (\n  ),\n  \'threadplugins\' => \n  array (\n  ),\n  \'hookscript\' => \n  array (\n  ),\n  \'pluginlinks\' => \n  array (\n  ),\n  \'templatelangs\' => \n  array (\n  ),\n  \'pluginlangs\' => \n  array (\n  ),\n  \'plugins\' => \n  array (\n    \'available\' => \n    array (\n    ),\n  ),\n  \'my_status\' => 0,\n  \'tradeopen\' => 1,\n  \'hooks\' => \n  array (\n  ),\n  \'navmns\' => \n  array (\n    0 => \'index\',\n    1 => \'index\',\n    2 => \'search\',\n    3 => \'faq\',\n  ),\n  \'subnavs\' => \n  array (\n  ),\n  \'navs\' => \n  array (\n    1 => \n    array (\n      \'nav\' => \'<li class=\"menu_1\"><a href=\"index.php\" hidefocus=\"true\" id=\"mn_index\">论坛</a></li>\',\n      \'level\' => \'0\',\n    ),\n    2 => \n    array (\n      \'nav\' => \'<li class=\"menu_2\"><a href=\"search.php\" hidefocus=\"true\" id=\"mn_search\">搜索</a></li>\',\n      \'level\' => \'0\',\n    ),\n    3 => \n    array (\n      \'nav\' => \'\',\n      \'level\' => \'0\',\n    ),\n    4 => \n    array (\n      \'nav\' => \'<li class=\"menu_4\"><a href=\"faq.php\" hidefocus=\"true\" id=\"mn_faq\">帮助</a></li>\',\n      \'level\' => \'0\',\n    ),\n    5 => \n    array (\n      \'nav\' => \'<li class=\"menu_5\"><a href=\"misc.php?action=nav\" hidefocus=\"true\" onclick=\"showWindow(\\\'nav\\\', this.href);return false;\">导航</a></li>\',\n      \'level\' => \'0\',\n    ),\n  ),\n  \'allowsynlogin\' => 0,\n  \'ucappopen\' => \n  array (\n  ),\n  \'ucapp\' => \n  array (\n  ),\n  \'uchomeurl\' => \'\',\n  \'homeshow\' => \'0\',\n  \'medalstatus\' => 0,\n  \'dlang\' => \n  array (\n    \'nextpage\' => \'下一页\',\n    \'date\' => \n    array (\n      0 => \'前\',\n      1 => \'天\',\n      2 => \'昨天\',\n      3 => \'前天\',\n      4 => \'小时\',\n      5 => \'半\',\n      6 => \'分钟\',\n      7 => \'秒\',\n      8 => \'刚才\',\n    ),\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('forums', '1', '1342582747', '0', '$_DCACHE[\'forums\'] = array (\n  1 => \n  array (\n    \'fid\' => \'1\',\n    \'type\' => \'group\',\n    \'name\' => \'Discuz!\',\n    \'fup\' => \'0\',\n    \'viewperm\' => \'\',\n    \'orderby\' => \'lastpost\',\n    \'ascdesc\' => \'DESC\',\n    \'status\' => \'1\',\n    \'extra\' => \n    array (\n    ),\n  ),\n  2 => \n  array (\n    \'fid\' => \'2\',\n    \'type\' => \'forum\',\n    \'name\' => \'默认版块\',\n    \'fup\' => \'1\',\n    \'viewperm\' => \'\',\n    \'orderby\' => \'lastpost\',\n    \'ascdesc\' => \'DESC\',\n    \'users\' => NULL,\n    \'status\' => \'1\',\n    \'extra\' => \n    array (\n    ),\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('icons', '1', '1342582747', '0', '$_DCACHE[\'icons\'] = array (\n  65 => \'icon1.gif\',\n  66 => \'icon2.gif\',\n  67 => \'icon3.gif\',\n  68 => \'icon4.gif\',\n  69 => \'icon5.gif\',\n  70 => \'icon6.gif\',\n  71 => \'icon7.gif\',\n  72 => \'icon8.gif\',\n  73 => \'icon9.gif\',\n  74 => \'icon10.gif\',\n  75 => \'icon11.gif\',\n  76 => \'icon12.gif\',\n  77 => \'icon13.gif\',\n  78 => \'icon14.gif\',\n  79 => \'icon15.gif\',\n  80 => \'icon16.gif\',\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('stamps', '1', '1342582747', '0', '$_DCACHE[\'stamps\'] = array (\n  0 => \n  array (\n    \'url\' => \'001.gif\',\n    \'text\' => \'精华\',\n  ),\n  1 => \n  array (\n    \'url\' => \'002.gif\',\n    \'text\' => \'热帖\',\n  ),\n  2 => \n  array (\n    \'url\' => \'003.gif\',\n    \'text\' => \'美图\',\n  ),\n  3 => \n  array (\n    \'url\' => \'004.gif\',\n    \'text\' => \'优秀\',\n  ),\n  4 => \n  array (\n    \'url\' => \'005.gif\',\n    \'text\' => \'置顶\',\n  ),\n  5 => \n  array (\n    \'url\' => \'006.gif\',\n    \'text\' => \'推荐\',\n  ),\n  6 => \n  array (\n    \'url\' => \'007.gif\',\n    \'text\' => \'原创\',\n  ),\n  7 => \n  array (\n    \'url\' => \'008.gif\',\n    \'text\' => \'版主推荐\',\n  ),\n  8 => \n  array (\n    \'url\' => \'009.gif\',\n    \'text\' => \'爆料\',\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('ranks', '1', '1342582747', '0', '$_DCACHE[\'ranks\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('usergroups', '1', '1342582747', '0', '$_DCACHE[\'usergroups\'] = array (\n  1 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'管理员\',\n    \'stars\' => \'9\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'200\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  18 => \n  array (\n    \'type\' => \'special\',\n    \'grouptitle\' => \'信息监察员\',\n    \'stars\' => \'9\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'200\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  17 => \n  array (\n    \'type\' => \'special\',\n    \'grouptitle\' => \'网站编辑\',\n    \'stars\' => \'8\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'150\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  16 => \n  array (\n    \'type\' => \'special\',\n    \'grouptitle\' => \'实习版主\',\n    \'stars\' => \'7\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'100\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  19 => \n  array (\n    \'type\' => \'special\',\n    \'grouptitle\' => \'审核员\',\n    \'stars\' => \'7\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'100\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  9 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'乞丐\',\n    \'creditshigher\' => \'-9999999\',\n    \'creditslower\' => \'0\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  8 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'等待验证会员\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  7 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'游客\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'1\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  6 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'禁止 IP\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  5 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'禁止访问\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  2 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'超级版主\',\n    \'stars\' => \'8\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'150\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  3 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'版主\',\n    \'stars\' => \'7\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'100\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  4 => \n  array (\n    \'type\' => \'system\',\n    \'grouptitle\' => \'禁止发言\',\n    \'stars\' => \'0\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'0\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'0\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  10 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'新手上路\',\n    \'creditshigher\' => \'0\',\n    \'creditslower\' => \'50\',\n    \'stars\' => \'1\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'10\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  11 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'注册会员\',\n    \'creditshigher\' => \'50\',\n    \'creditslower\' => \'200\',\n    \'stars\' => \'2\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'20\',\n    \'allowcusbbcode\' => \'0\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  12 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'中级会员\',\n    \'creditshigher\' => \'200\',\n    \'creditslower\' => \'500\',\n    \'stars\' => \'3\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'30\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  13 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'高级会员\',\n    \'creditshigher\' => \'500\',\n    \'creditslower\' => \'1000\',\n    \'stars\' => \'4\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'50\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  14 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'金牌会员\',\n    \'creditshigher\' => \'1000\',\n    \'creditslower\' => \'3000\',\n    \'stars\' => \'6\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'70\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n  15 => \n  array (\n    \'type\' => \'member\',\n    \'grouptitle\' => \'论坛元老\',\n    \'creditshigher\' => \'3000\',\n    \'creditslower\' => \'9999999\',\n    \'stars\' => \'8\',\n    \'groupavatar\' => \'\',\n    \'readaccess\' => \'90\',\n    \'allowcusbbcode\' => \'1\',\n    \'allowgetattach\' => \'1\',\n    \'edittimelimit\' => \'0\',\n    \'userstatusby\' => 1,\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('request', '1', '1342582747', '0', '$_DCACHE[\'request\'] = array (\n  \'边栏模块_版块树形列表\' => \n  array (\n    \'url\' => \'function=module&module=forumtree.inc.php&settings=N%3B&jscharset=0&cachelife=864000\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_版主排行\' => \n  array (\n    \'url\' => \'function=module&module=modlist.inc.php&settings=N%3B&jscharset=0&cachelife=3600\',\n    \'type\' => \'5\',\n  ),\n  \'聚合模块_版块列表\' => \n  array (\n    \'url\' => \'function=module&module=rowcombine.inc.php&settings=a%3A1%3A%7Bs%3A4%3A%22data%22%3Bs%3A84%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%2C%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%A0%91%E5%BD%A2%E5%88%97%E8%A1%A8%2C%E7%89%88%E5%9D%97%E5%88%97%E8%A1%A8%22%3B%7D&jscharset=0&cachelife=864000&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_版块排行\' => \n  array (\n    \'url\' => \'function=forums&startrow=0&items=0&newwindow=1&orderby=posts&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%3Cimg%20style%3D%5C%22vertical-align%3Amiddle%5C%22%20src%3D%5C%22images%2Fdefault%2Ftree_file.gif%5C%22%20%2F%3E%20%7Bforumname%7D%28%7Bposts%7D%29%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'1\',\n  ),\n  \'聚合模块_热门主题\' => \n  array (\n    \'url\' => \'function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%22%3Bs%3A4%3A%22data%22%3Bs%3A112%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E4%BB%8A%E6%97%A5%2C%E6%97%A5%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E5%91%A8%2C%E5%91%A8%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E6%9C%88%2C%E6%9C%88%22%3B%7D&jscharset=0&cachelife=1800&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_热门主题_本月\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=720&jscharset=0&cachelife=86400&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E6%9C%88%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'聚合模块_会员排行\' => \n  array (\n    \'url\' => \'function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C%22%3Bs%3A4%3A%22data%22%3Bs%3A112%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E4%BB%8A%E6%97%A5%2C%E6%97%A5%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E6%9C%AC%E5%91%A8%2C%E5%91%A8%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E6%9C%AC%E6%9C%88%2C%E6%9C%88%22%3B%7D&jscharset=0&cachelife=3600&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_推荐主题\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=1&newwindow=1&threadtype=0&highlight=0&orderby=lastpost&hours=48&jscharset=0&cachelife=3600&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%8E%A8%E8%8D%90%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_最新图片\' => \n  array (\n    \'url\' => \'function=images&sidestatus=0&isimage=1&threadmethod=1&maxwidth=140&maxheight=140&startrow=0&items=5&orderby=dateline&hours=0&digest=0&newwindow=1&jscharset=0&jstemplate=%3Cdiv%20%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%BE%E7%89%87%3C%2Fh4%3E%0D%0A%3Cscript%20type%3D%5C%22text%2Fjavascript%5C%22%3E%0D%0Avar%20slideSpeed%20%3D%202500%3B%0D%0Avar%20slideImgsize%20%3D%20%5B140%2C140%5D%3B%0D%0Avar%20slideTextBar%20%3D%200%3B%0D%0Avar%20slideBorderColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0Avar%20slideBgColor%20%3D%20%5C%27%23FFF%5C%27%3B%0D%0Avar%20slideImgs%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgLinks%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgTexts%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideSwitchBar%20%3D%201%3B%0D%0Avar%20slideSwitchColor%20%3D%20%5C%27black%5C%27%3B%0D%0Avar%20slideSwitchbgColor%20%3D%20%5C%27white%5C%27%3B%0D%0Avar%20slideSwitchHiColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0A%5Bnode%5D%0D%0AslideImgs%5B%7Border%7D%5D%20%3D%20%5C%22%7Bimgfile%7D%5C%22%3B%0D%0AslideImgLinks%5B%7Border%7D%5D%20%3D%20%5C%22%7Blink%7D%5C%22%3B%0D%0AslideImgTexts%5B%7Border%7D%5D%20%3D%20%5C%22%7Bsubject%7D%5C%22%3B%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fscript%3E%0D%0A%3Cscript%20language%3D%5C%22javascript%5C%22%20type%3D%5C%22text%2Fjavascript%5C%22%20src%3D%5C%22include%2Fjs%2Fslide.js%5C%22%3E%3C%2Fscript%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'4\',\n  ),\n  \'边栏模块_最新主题\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=dateline&hours=0&jscharset=0&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_活跃会员\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=12&newwindow=1&extcredit=1&orderby=posts&hours=0&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%B4%BB%E8%B7%83%E4%BC%9A%E5%91%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22avt_list%20s_clear%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bavatarsmall%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏模块_热门主题_本版\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=1&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=replies&hours=0&jscharset=0&cachelife=1800&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E7%89%88%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_热门主题_今日\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=24&jscharset=0&cachelife=1800&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E4%BB%8A%E6%97%A5%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_最新回复\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=lastpost&hours=0&jscharset=0&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%9E%E5%A4%8D%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_最新图片_本版\' => \n  array (\n    \'url\' => \'function=images&sidestatus=1&isimage=1&threadmethod=1&maxwidth=140&maxheight=140&startrow=0&items=5&orderby=dateline&hours=0&digest=0&newwindow=1&jscharset=0&jstemplate=%3Cdiv%20%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%BE%E7%89%87%3C%2Fh4%3E%0D%0A%3Cscript%20type%3D%5C%22text%2Fjavascript%5C%22%3E%0D%0Avar%20slideSpeed%20%3D%202500%3B%0D%0Avar%20slideImgsize%20%3D%20%5B140%2C140%5D%3B%0D%0Avar%20slideTextBar%20%3D%200%3B%0D%0Avar%20slideBorderColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0Avar%20slideBgColor%20%3D%20%5C%27%23FFF%5C%27%3B%0D%0Avar%20slideImgs%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgLinks%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgTexts%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideSwitchBar%20%3D%201%3B%0D%0Avar%20slideSwitchColor%20%3D%20%5C%27black%5C%27%3B%0D%0Avar%20slideSwitchbgColor%20%3D%20%5C%27white%5C%27%3B%0D%0Avar%20slideSwitchHiColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0A%5Bnode%5D%0D%0AslideImgs%5B%7Border%7D%5D%20%3D%20%5C%22%7Bimgfile%7D%5C%22%3B%0D%0AslideImgLinks%5B%7Border%7D%5D%20%3D%20%5C%22%7Blink%7D%5C%22%3B%0D%0AslideImgTexts%5B%7Border%7D%5D%20%3D%20%5C%22%7Bsubject%7D%5C%22%3B%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fscript%3E%0D%0A%3Cscript%20language%3D%5C%22javascript%5C%22%20type%3D%5C%22text%2Fjavascript%5C%22%20src%3D%5C%22include%2Fjs%2Fslide.js%5C%22%3E%3C%2Fscript%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'4\',\n  ),\n  \'边栏模块_标签\' => \n  array (\n    \'url\' => \'function=module&module=tag.inc.php&settings=a%3A1%3A%7Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2220%22%3B%7D&jscharset=0&cachelife=900&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_会员排行_本月\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=720&jscharset=0&cachelife=86400&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E6%9C%88%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏模块_会员排行_本周\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏方案_主题列表页默认\' => \n  array (\n    \'url\' => \'function=side&jscharset=&jstemplate=%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%88%91%E7%9A%84%E5%8A%A9%E6%89%8B%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E7%89%88%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%5B%2Fmodule%5D&\',\n    \'type\' => \'-2\',\n  ),\n  \'边栏方案_首页默认\' => \n  array (\n    \'url\' => \'function=side&jscharset=&jstemplate=%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%88%91%E7%9A%84%E5%8A%A9%E6%89%8B%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%81%9A%E5%90%88%E6%A8%A1%E5%9D%97_%E6%96%B0%E5%B8%96%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%81%9A%E5%90%88%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%B4%BB%E8%B7%83%E4%BC%9A%E5%91%98%5B%2Fmodule%5D&\',\n    \'type\' => \'-2\',\n  ),\n  \'聚合模块_新帖\' => \n  array (\n    \'url\' => \'function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E5%B8%96%E5%AD%90%22%3Bs%3A4%3A%22data%22%3Bs%3A66%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%9C%80%E6%96%B0%E4%B8%BB%E9%A2%98%2C%E4%B8%BB%E9%A2%98%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%9C%80%E6%96%B0%E5%9B%9E%E5%A4%8D%2C%E5%9B%9E%E5%A4%8D%22%3B%7D&jscharset=0&\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_热门主题_本周\' => \n  array (\n    \'url\' => \'function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'0\',\n  ),\n  \'边栏模块_会员排行_今日\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=24&jscharset=0&cachelife=3600&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E4%BB%8A%E6%97%A5%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏模块_论坛之星\' => \n  array (\n    \'url\' => \'function=memberrank&startrow=0&items=3&newwindow=1&extcredit=1&orderby=hourposts&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%20s_clear%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E4%B9%8B%E6%98%9F%3C%2Fh4%3E%0D%0A%5Bnode%5D%0D%0A%5Bshow%3D1%5D%3Cdiv%20style%3D%5C%22clear%3Aboth%5C%22%3E%3Cdiv%20style%3D%5C%22float%3Aleft%3B%20margin-right%3A%2016px%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%5B%2Fshow%5D%7Bmember%7D%20%5Bshow%3D1%5D%3Cbr%20%2F%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fdiv%3E%3Cdiv%20style%3D%5C%22clear%3Aboth%3Bmargin-top%3A2px%5C%22%20%2F%3E%3C%2Fdiv%3E%5B%2Fshow%5D%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\',\n    \'type\' => \'2\',\n  ),\n  \'边栏模块_我的助手\' => \n  array (\n    \'url\' => \'function=module&module=assistant.inc.php&settings=N%3B&jscharset=0&cachelife=0\',\n    \'type\' => \'5\',\n  ),\n  \'边栏模块_Google搜索\' => \n  array (\n    \'url\' => \'function=module&module=google.inc.php&settings=a%3A2%3A%7Bs%3A4%3A%22lang%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22default%22%3Bs%3A1%3A%221%22%3B%7D&jscharset=0&cachelife=864000&\',\n    \'type\' => \'5\',\n  ),\n  \'UCHome_最新动态\' => \n  array (\n    \'url\' => \'function=module&module=feed.inc.php&settings=a%3A6%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E5%8A%A8%E6%80%81%22%3Bs%3A4%3A%22uids%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22friend%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A54%3A%22%3Cdiv%20style%3D%5C%22padding-left%3A2px%5C%22%3E%7Btitle_template%7D%3C%2Fdiv%3E%22%3B%7D&jscharset=0&cachelife=0&\',\n    \'type\' => \'5\',\n  ),\n  \'UCHome_最新更新空间\' => \n  array (\n    \'url\' => \'function=module&module=space.inc.php&settings=a%3A17%3A%7Bs%3A5%3A%22title%22%3Bs%3A18%3A%22%E6%9C%80%E6%96%B0%E6%9B%B4%E6%96%B0%E7%A9%BA%E9%97%B4%22%3Bs%3A3%3A%22uid%22%3Bs%3A0%3A%22%22%3Bs%3A14%3A%22startfriendnum%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22endfriendnum%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22startviewnum%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22endviewnum%22%3Bs%3A0%3A%22%22%3Bs%3A11%3A%22startcredit%22%3Bs%3A0%3A%22%22%3Bs%3A9%3A%22endcredit%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22avatar%22%3Bs%3A2%3A%22-1%22%3Bs%3A10%3A%22namestatus%22%3Bs%3A2%3A%22-1%22%3Bs%3A8%3A%22dateline%22%3Bs%3A1%3A%220%22%3Bs%3A10%3A%22updatetime%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22order%22%3Bs%3A10%3A%22updatetime%22%3Bs%3A2%3A%22sc%22%3Bs%3A4%3A%22DESC%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A267%3A%22%3Ctable%3E%0D%0A%3Ctr%3E%0D%0A%3Ctd%20width%3D%5C%2250%5C%22%20rowspan%3D%5C%222%5C%22%3E%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20target%3D%5C%22_blank%5C%22%3E%3Cimg%20src%3D%5C%22%7Bphoto%7D%5C%22%20%2F%3E%3C%2Fa%3E%3C%2Ftd%3E%0D%0A%3Ctd%3E%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20%20target%3D%5C%22_blank%5C%22%20style%3D%5C%22text-decoration%3Anone%3B%5C%22%3E%7Busername%7D%3C%2Fa%3E%3C%2Ftd%3E%0D%0A%3C%2Ftr%3E%0D%0A%3Ctr%3E%3Ctd%3E%7Bupdatetime%7D%3C%2Ftd%3E%3C%2Ftr%3E%0D%0A%3C%2Ftable%3E%22%3B%7D&jscharset=0&cachelife=0&\',\n    \'type\' => \'5\',\n  ),\n  \'UCHome_最新记录\' => \n  array (\n    \'url\' => \'function=module&module=doing.inc.php&settings=a%3A6%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E8%AE%B0%E5%BD%95%22%3Bs%3A3%3A%22uid%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22mood%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A361%3A%22%0D%0A%3Cdiv%20style%3D%5C%22padding%3A0%200%205px%200%3B%5C%22%3E%0D%0A%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20target%3D%5C%22_blank%5C%22%3E%3Cimg%20src%3D%5C%22%7Bphoto%7D%5C%22%20width%3D%5C%2218%5C%22%20height%3D%5C%2218%5C%22%20align%3D%5C%22absmiddle%5C%22%3E%3C%2Fa%3E%20%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20%20target%3D%5C%22_blank%5C%22%3E%7Busername%7D%3C%2Fa%3E%EF%BC%9A%0D%0A%3C%2Fdiv%3E%0D%0A%3Cdiv%20style%3D%5C%22padding%3A0%200%205px%2020px%3B%5C%22%3E%0D%0A%3Ca%20href%3D%5C%22%7Blink%7D%5C%22%20style%3D%5C%22color%3A%23333%3Btext-decoration%3Anone%3B%5C%22%20target%3D%5C%22_blank%5C%22%3E%7Bmessage%7D%3C%2Fa%3E%0D%0A%3C%2Fdiv%3E%22%3B%7D&jscharset=0&cachelife=0&\',\n    \'type\' => \'5\',\n  ),\n  \'UCHome_竞价排名\' => \n  array (\n    \'url\' => \'function=module&module=html.inc.php&settings=a%3A3%3A%7Bs%3A4%3A%22type%22%3Bs%3A1%3A%220%22%3Bs%3A4%3A%22code%22%3Bs%3A27%3A%22%3Cdiv%20id%3D%5C%22sidefeed%5C%22%3E%3C%2Fdiv%3E%22%3Bs%3A4%3A%22side%22%3Bs%3A1%3A%220%22%3B%7D&jscharset=0&cachelife=864000&\',\n    \'type\' => \'5\',\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('medals', '1', '1342582747', '0', '$_DCACHE[\'medals\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('magics', '1', '1342582747', '0', '$_DCACHE[\'magics\'] = array (\n  1 => \n  array (\n    \'identifier\' => \'CCK\',\n    \'available\' => \'1\',\n    \'name\' => \'变色卡\',\n    \'description\' => \'可以变换主题的颜色,并保存24小时\',\n    \'weight\' => \'20\',\n    \'price\' => \'10\',\n    \'type\' => \'1\',\n  ),\n  2 => \n  array (\n    \'identifier\' => \'MOK\',\n    \'available\' => \'1\',\n    \'name\' => \'金钱卡\',\n    \'description\' => \'可以随机获得一些金币\',\n    \'weight\' => \'30\',\n    \'price\' => \'10\',\n    \'type\' => \'3\',\n  ),\n  3 => \n  array (\n    \'identifier\' => \'SEK\',\n    \'available\' => \'1\',\n    \'name\' => \'IP卡\',\n    \'description\' => \'可以查看帖子作者的IP\',\n    \'weight\' => \'30\',\n    \'price\' => \'15\',\n    \'type\' => \'1\',\n  ),\n  4 => \n  array (\n    \'identifier\' => \'UPK\',\n    \'available\' => \'1\',\n    \'name\' => \'提升卡\',\n    \'description\' => \'可以提升某个主题\',\n    \'weight\' => \'30\',\n    \'price\' => \'10\',\n    \'type\' => \'1\',\n  ),\n  5 => \n  array (\n    \'identifier\' => \'TOK\',\n    \'available\' => \'1\',\n    \'name\' => \'置顶卡\',\n    \'description\' => \'可以将主题置顶24小时\',\n    \'weight\' => \'40\',\n    \'price\' => \'20\',\n    \'type\' => \'1\',\n  ),\n  6 => \n  array (\n    \'identifier\' => \'REK\',\n    \'available\' => \'1\',\n    \'name\' => \'悔悟卡\',\n    \'description\' => \'可以删除自己的帖子\',\n    \'weight\' => \'30\',\n    \'price\' => \'10\',\n    \'type\' => \'1\',\n  ),\n  7 => \n  array (\n    \'identifier\' => \'RTK\',\n    \'available\' => \'1\',\n    \'name\' => \'狗仔卡\',\n    \'description\' => \'查看某个用户是否在线\',\n    \'weight\' => \'30\',\n    \'price\' => \'15\',\n    \'type\' => \'2\',\n  ),\n  8 => \n  array (\n    \'identifier\' => \'CLK\',\n    \'available\' => \'1\',\n    \'name\' => \'沉默卡\',\n    \'description\' => \'24小时内不能回复\',\n    \'weight\' => \'30\',\n    \'price\' => \'15\',\n    \'type\' => \'1\',\n  ),\n  9 => \n  array (\n    \'identifier\' => \'OPK\',\n    \'available\' => \'1\',\n    \'name\' => \'喧嚣卡\',\n    \'description\' => \'使贴子可以回复\',\n    \'weight\' => \'30\',\n    \'price\' => \'15\',\n    \'type\' => \'1\',\n  ),\n  10 => \n  array (\n    \'identifier\' => \'YSK\',\n    \'available\' => \'1\',\n    \'name\' => \'隐身卡\',\n    \'description\' => \'可以将自己的帖子匿名\',\n    \'weight\' => \'30\',\n    \'price\' => \'20\',\n    \'type\' => \'1\',\n  ),\n  11 => \n  array (\n    \'identifier\' => \'CBK\',\n    \'available\' => \'1\',\n    \'name\' => \'恢复卡\',\n    \'description\' => \'将匿名恢复为正常显示的用户名,匿名终结者\',\n    \'weight\' => \'20\',\n    \'price\' => \'15\',\n    \'type\' => \'1\',\n  ),\n  12 => \n  array (\n    \'identifier\' => \'MVK\',\n    \'available\' => \'1\',\n    \'name\' => \'移动卡\',\n    \'description\' => \'可将自已的帖子移动到其他版面（隐含、特殊限定版面除外）\',\n    \'weight\' => \'50\',\n    \'price\' => \'50\',\n    \'type\' => \'1\',\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('modreasons', '1', '1342582747', '0', '$_DCACHE[\'modreasons\'] = array (\n  0 => \'广告/SPAM\',\n  1 => \'恶意灌水\',\n  2 => \'违规内容\',\n  3 => \'文不对题\',\n  4 => \'重复发帖\',\n  5 => \'\',\n  6 => \'我很赞同\',\n  7 => \'精品文章\',\n  8 => \'原创内容\',\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('stamptypeid', '1', '1342582747', '0', '$_DCACHE[\'stamptypeid\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('advs_archiver', '1', '1342582747', '0', '$_DCACHE[\'advs\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('advs_register', '1', '1342582747', '0', '$_DCACHE[\'advs\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('ipctrl', '1', '1342582747', '0', '$_DCACHE[\'ipctrl\'] = array (\n  \'ipregctrl\' => \'\',\n  \'ipverifywhite\' => \'\',\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('faqs', '1', '1342582747', '0', '$_DCACHE[\'faqs\'] = array (\n  \'login\' => \n  array (\n    \'fpid\' => \'1\',\n    \'id\' => \'3\',\n    \'keyword\' => \'登录帮助\',\n  ),\n  \'discuzcode\' => \n  array (\n    \'fpid\' => \'5\',\n    \'id\' => \'18\',\n    \'keyword\' => \'Discuz!代码\',\n  ),\n  \'smilies\' => \n  array (\n    \'fpid\' => \'5\',\n    \'id\' => \'32\',\n    \'keyword\' => \'表情\',\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('secqaa', '1', '1342582747', '0', '$_DCACHE[\'secqaa\'] = array (\n  1 => NULL,\n  2 => NULL,\n  3 => NULL,\n  4 => NULL,\n  5 => NULL,\n  6 => NULL,\n  7 => NULL,\n  8 => NULL,\n  9 => NULL,\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('censor', '1', '1342582747', '0', '$_DCACHE[\'censor\'] = array (\n  \'filter\' => \n  array (\n  ),\n  \'banned\' => \'\',\n  \'mod\' => \'\',\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('ipbanned', '1', '1342582747', '0', '$_DCACHE[\'ipbanned\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('smilies_js', '1', '1342582747', '0', '$_DCACHE[\'smilies_js\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('forumstick', '1', '1342582747', '0', '$_DCACHE[\'forumstick\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('announcements', '1', '1342582747', '0', '$_DCACHE[\'announcements\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('onlinelist', '1', '1342582747', '0', '$_DCACHE[\'onlinelist\'] = array (\n  \'legend\' => \'<img src=\"images/common/online_admin.gif\" /> 管理员 &nbsp; &nbsp; &nbsp; <img src=\"images/common/online_supermod.gif\" /> 超级版主 &nbsp; &nbsp; &nbsp; <img src=\"images/common/online_moderator.gif\" /> 版主 &nbsp; &nbsp; &nbsp; <img src=\"images/common/online_member.gif\" /> 会员 &nbsp; &nbsp; &nbsp; \',\n  1 => \'online_admin.gif\',\n  2 => \'online_supermod.gif\',\n  3 => \'online_moderator.gif\',\n  0 => \'online_member.gif\',\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('forumlinks', '1', '1342582747', '0', '$_DCACHE[\'forumlinks\'] = array (\n  0 => \'<li><div class=\"forumlogo\"><img src=\"images/logo.gif\" border=\"0\" alt=\"Discuz! 官方论坛\" /></div><div class=\"forumcontent\"><h5><a href=\"http://www.discuz.net\" target=\"_blank\">Discuz! 官方论坛</a></h5><p>提供最新 Discuz! 产品新闻、软件下载与技术交流</p></div>\',\n  1 => \'\',\n  2 => \'\',\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('advs_index', '1', '1342582747', '0', '$_DCACHE[\'advs\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('heats', '1', '1342582747', '0', '$_DCACHE[\'heats\'] = array (\n  \'expiration\' => 0,\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('smilies', '1', '1342582747', '0', '$_DCACHE[\'smilies\'] = array (\n  \'searcharray\' => \n  array (\n    13 => \'/\\\\:loveliness\\\\:/\',\n    23 => \'/\\\\:handshake/\',\n    20 => \'/\\\\:victory\\\\:/\',\n    54 => \'/\\\\{\\\\:3_54\\\\:\\\\}/\',\n    31 => \'/\\\\{\\\\:2_31\\\\:\\\\}/\',\n    63 => \'/\\\\{\\\\:3_63\\\\:\\\\}/\',\n    40 => \'/\\\\{\\\\:2_40\\\\:\\\\}/\',\n    17 => \'/\\\\:shutup\\\\:/\',\n    49 => \'/\\\\{\\\\:3_49\\\\:\\\\}/\',\n    26 => \'/\\\\{\\\\:2_26\\\\:\\\\}/\',\n    58 => \'/\\\\{\\\\:3_58\\\\:\\\\}/\',\n    35 => \'/\\\\{\\\\:2_35\\\\:\\\\}/\',\n    44 => \'/\\\\{\\\\:3_44\\\\:\\\\}/\',\n    53 => \'/\\\\{\\\\:3_53\\\\:\\\\}/\',\n    30 => \'/\\\\{\\\\:2_30\\\\:\\\\}/\',\n    62 => \'/\\\\{\\\\:3_62\\\\:\\\\}/\',\n    39 => \'/\\\\{\\\\:2_39\\\\:\\\\}/\',\n    48 => \'/\\\\{\\\\:3_48\\\\:\\\\}/\',\n    25 => \'/\\\\{\\\\:2_25\\\\:\\\\}/\',\n    57 => \'/\\\\{\\\\:3_57\\\\:\\\\}/\',\n    34 => \'/\\\\{\\\\:2_34\\\\:\\\\}/\',\n    43 => \'/\\\\{\\\\:3_43\\\\:\\\\}/\',\n    52 => \'/\\\\{\\\\:3_52\\\\:\\\\}/\',\n    29 => \'/\\\\{\\\\:2_29\\\\:\\\\}/\',\n    61 => \'/\\\\{\\\\:3_61\\\\:\\\\}/\',\n    38 => \'/\\\\{\\\\:2_38\\\\:\\\\}/\',\n    47 => \'/\\\\{\\\\:3_47\\\\:\\\\}/\',\n    56 => \'/\\\\{\\\\:3_56\\\\:\\\\}/\',\n    33 => \'/\\\\{\\\\:2_33\\\\:\\\\}/\',\n    42 => \'/\\\\{\\\\:3_42\\\\:\\\\}/\',\n    51 => \'/\\\\{\\\\:3_51\\\\:\\\\}/\',\n    28 => \'/\\\\{\\\\:2_28\\\\:\\\\}/\',\n    60 => \'/\\\\{\\\\:3_60\\\\:\\\\}/\',\n    37 => \'/\\\\{\\\\:2_37\\\\:\\\\}/\',\n    46 => \'/\\\\{\\\\:3_46\\\\:\\\\}/\',\n    55 => \'/\\\\{\\\\:3_55\\\\:\\\\}/\',\n    32 => \'/\\\\{\\\\:2_32\\\\:\\\\}/\',\n    64 => \'/\\\\{\\\\:3_64\\\\:\\\\}/\',\n    41 => \'/\\\\{\\\\:3_41\\\\:\\\\}/\',\n    18 => \'/\\\\:sleepy\\\\:/\',\n    50 => \'/\\\\{\\\\:3_50\\\\:\\\\}/\',\n    27 => \'/\\\\{\\\\:2_27\\\\:\\\\}/\',\n    59 => \'/\\\\{\\\\:3_59\\\\:\\\\}/\',\n    36 => \'/\\\\{\\\\:2_36\\\\:\\\\}/\',\n    45 => \'/\\\\{\\\\:3_45\\\\:\\\\}/\',\n    16 => \'/\\\\:dizzy\\\\:/\',\n    15 => \'/\\\\:curse\\\\:/\',\n    22 => \'/\\\\:kiss\\\\:/\',\n    21 => \'/\\\\:time\\\\:/\',\n    24 => \'/\\\\:call\\\\:/\',\n    14 => \'/\\\\:funk\\\\:/\',\n    19 => \'/\\\\:hug\\\\:/\',\n    12 => \'/\\\\:lol/\',\n    4 => \'/\\\\:\\\'\\\\(/\',\n    8 => \'/\\\\:\\\\$/\',\n    3 => \'/\\\\:D/\',\n    7 => \'/\\\\:P/\',\n    2 => \'/\\\\:\\\\(/\',\n    11 => \'/\\\\:Q/\',\n    6 => \'/\\\\:o/\',\n    1 => \'/\\\\:\\\\)/\',\n    10 => \'/\\\\:L/\',\n    5 => \'/\\\\:@/\',\n    9 => \'/;P/\',\n  ),\n  \'replacearray\' => \n  array (\n    13 => \'loveliness.gif\',\n    23 => \'handshake.gif\',\n    20 => \'victory.gif\',\n    54 => \'14.gif\',\n    31 => \'07.gif\',\n    63 => \'23.gif\',\n    40 => \'16.gif\',\n    17 => \'shutup.gif\',\n    49 => \'09.gif\',\n    26 => \'02.gif\',\n    58 => \'18.gif\',\n    35 => \'11.gif\',\n    44 => \'04.gif\',\n    53 => \'13.gif\',\n    30 => \'06.gif\',\n    62 => \'22.gif\',\n    39 => \'15.gif\',\n    48 => \'08.gif\',\n    25 => \'01.gif\',\n    57 => \'17.gif\',\n    34 => \'10.gif\',\n    43 => \'03.gif\',\n    52 => \'12.gif\',\n    29 => \'05.gif\',\n    61 => \'21.gif\',\n    38 => \'14.gif\',\n    47 => \'07.gif\',\n    56 => \'16.gif\',\n    33 => \'09.gif\',\n    42 => \'02.gif\',\n    51 => \'11.gif\',\n    28 => \'04.gif\',\n    60 => \'20.gif\',\n    37 => \'13.gif\',\n    46 => \'06.gif\',\n    55 => \'15.gif\',\n    32 => \'08.gif\',\n    64 => \'24.gif\',\n    41 => \'01.gif\',\n    18 => \'sleepy.gif\',\n    50 => \'10.gif\',\n    27 => \'03.gif\',\n    59 => \'19.gif\',\n    36 => \'12.gif\',\n    45 => \'05.gif\',\n    16 => \'dizzy.gif\',\n    15 => \'curse.gif\',\n    22 => \'kiss.gif\',\n    21 => \'time.gif\',\n    24 => \'call.gif\',\n    14 => \'funk.gif\',\n    19 => \'hug.gif\',\n    12 => \'lol.gif\',\n    4 => \'cry.gif\',\n    8 => \'shy.gif\',\n    3 => \'biggrin.gif\',\n    7 => \'tongue.gif\',\n    2 => \'sad.gif\',\n    11 => \'mad.gif\',\n    6 => \'shocked.gif\',\n    1 => \'smile.gif\',\n    10 => \'sweat.gif\',\n    5 => \'huffy.gif\',\n    9 => \'titter.gif\',\n  ),\n  \'typearray\' => \n  array (\n    13 => \'1\',\n    23 => \'1\',\n    20 => \'1\',\n    54 => \'3\',\n    31 => \'2\',\n    63 => \'3\',\n    40 => \'2\',\n    17 => \'1\',\n    49 => \'3\',\n    26 => \'2\',\n    58 => \'3\',\n    35 => \'2\',\n    44 => \'3\',\n    53 => \'3\',\n    30 => \'2\',\n    62 => \'3\',\n    39 => \'2\',\n    48 => \'3\',\n    25 => \'2\',\n    57 => \'3\',\n    34 => \'2\',\n    43 => \'3\',\n    52 => \'3\',\n    29 => \'2\',\n    61 => \'3\',\n    38 => \'2\',\n    47 => \'3\',\n    56 => \'3\',\n    33 => \'2\',\n    42 => \'3\',\n    51 => \'3\',\n    28 => \'2\',\n    60 => \'3\',\n    37 => \'2\',\n    46 => \'3\',\n    55 => \'3\',\n    32 => \'2\',\n    64 => \'3\',\n    41 => \'3\',\n    18 => \'1\',\n    50 => \'3\',\n    27 => \'2\',\n    59 => \'3\',\n    36 => \'2\',\n    45 => \'3\',\n    16 => \'1\',\n    15 => \'1\',\n    22 => \'1\',\n    21 => \'1\',\n    24 => \'1\',\n    14 => \'1\',\n    19 => \'1\',\n    12 => \'1\',\n    4 => \'1\',\n    8 => \'1\',\n    3 => \'1\',\n    7 => \'1\',\n    2 => \'1\',\n    11 => \'1\',\n    6 => \'1\',\n    1 => \'1\',\n    10 => \'1\',\n    5 => \'1\',\n    9 => \'1\',\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('announcements_forum', '1', '1342582747', '0', '$_DCACHE[\'announcements_forum\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('globalstick', '1', '1342582747', '0', '$_DCACHE[\'globalstick\'] = array (\n  \'global\' => \n  array (\n    \'tids\' => 0,\n    \'count\' => 0,\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('advs_forumdisplay', '1', '1342582747', '0', '$_DCACHE[\'advs\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('smileytypes', '1', '1342582747', '0', '$_DCACHE[\'smileytypes\'] = array (\n  1 => \n  array (\n    \'name\' => \'默认\',\n    \'directory\' => \'default\',\n  ),\n  2 => \n  array (\n    \'name\' => \'酷猴\',\n    \'directory\' => \'coolmonkey\',\n  ),\n  3 => \n  array (\n    \'name\' => \'呆呆男\',\n    \'directory\' => \'grapeman\',\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('bbcodes', '1', '1342582747', '0', '$_DCACHE[\'bbcodes\'] = array (\n  \'searcharray\' => \n  array (\n    0 => \'/\\\\[qq]([^\"\\\\[]+?)\\\\[\\\\/qq\\\\]/is\',\n  ),\n  \'replacearray\' => \n  array (\n    0 => \'<a href=\"http://wpa.qq.com/msgrd?V=1&Uin=\\\\1&amp;Site=[Discuz!]&amp;Menu=yes\" target=\"_blank\"><img src=\"http://wpa.qq.com/pa?p=1:\\\\1:1\" border=\"0\"></a>\',\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('advs_viewthread', '1', '1342582747', '0', '$_DCACHE[\'advs\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('tags_viewthread', '1', '1342582747', '0', '$_DCACHE[\'tags\'] = array (\n  1 => \'[\\\'\\\']\',\n  0 => \'[\\\'\\\']\',\n  2 => \'0\',\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('custominfo', '1', '1342582747', '0', '$_DCACHE[\'custominfo\'] = array (\n  \'customauthorinfo\' => \n  array (\n    2 => \'<dt>UID</dt><dd>$post[uid]&nbsp;</dd><dt>帖子</dt><dd>$post[posts]&nbsp;</dd><dt>精华</dt><dd>$post[digestposts]&nbsp;</dd><dt>积分</dt><dd>$post[credits]&nbsp;</dd><dt>阅读权限</dt><dd>$post[readaccess]&nbsp;</dd>\".($post[location] ? \"<dt>来自</dt><dd>$post[location]&nbsp;</dd>\" : \"\").\"<dt>在线时间</dt><dd>$post[oltime] 小时&nbsp;</dd><dt>注册时间</dt><dd>$post[regdate]&nbsp;</dd><dt>最后登录</dt><dd>$post[lastdate]&nbsp;</dd>\',\n    1 => NULL,\n  ),\n  \'fieldsadd\' => \'\',\n  \'profilefields\' => \n  array (\n  ),\n  \'postno\' => \n  array (\n    0 => \'<sup>#</sup>\',\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('groupicon', '1', '1342582747', '0', '$_DCACHE[\'groupicon\'] = array (\n  1 => \'images/common/online_admin.gif\',\n  2 => \'images/common/online_supermod.gif\',\n  3 => \'images/common/online_moderator.gif\',\n  0 => \'images/common/online_member.gif\',\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('focus', '1', '1342582747', '0', '$_DCACHE[\'focus\'] = array (\n  \'title\' => NULL,\n  \'data\' => \n  array (\n  ),\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('bbcodes_display', '1', '1342582747', '0', '$_DCACHE[\'bbcodes_display\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('smileycodes', '1', '1342582747', '0', '$_DCACHE[\'smileycodes\'] = array (\n  1 => \':)\',\n  2 => \':(\',\n  3 => \':D\',\n  4 => \':\\\'(\',\n  5 => \':@\',\n  6 => \':o\',\n  7 => \':P\',\n  8 => \':$\',\n  9 => \';P\',\n  10 => \':L\',\n  11 => \':Q\',\n  12 => \':lol\',\n  13 => \':loveliness:\',\n  14 => \':funk:\',\n  15 => \':curse:\',\n  16 => \':dizzy:\',\n  17 => \':shutup:\',\n  18 => \':sleepy:\',\n  19 => \':hug:\',\n  20 => \':victory:\',\n  21 => \':time:\',\n  22 => \':kiss:\',\n  23 => \':handshake\',\n  24 => \':call:\',\n  25 => \'{:2_25:}\',\n  26 => \'{:2_26:}\',\n  27 => \'{:2_27:}\',\n  28 => \'{:2_28:}\',\n  29 => \'{:2_29:}\',\n  30 => \'{:2_30:}\',\n  31 => \'{:2_31:}\',\n  32 => \'{:2_32:}\',\n  33 => \'{:2_33:}\',\n  34 => \'{:2_34:}\',\n  35 => \'{:2_35:}\',\n  36 => \'{:2_36:}\',\n  37 => \'{:2_37:}\',\n  38 => \'{:2_38:}\',\n  39 => \'{:2_39:}\',\n  40 => \'{:2_40:}\',\n  41 => \'{:3_41:}\',\n  42 => \'{:3_42:}\',\n  43 => \'{:3_43:}\',\n  44 => \'{:3_44:}\',\n  45 => \'{:3_45:}\',\n  46 => \'{:3_46:}\',\n  47 => \'{:3_47:}\',\n  48 => \'{:3_48:}\',\n  49 => \'{:3_49:}\',\n  50 => \'{:3_50:}\',\n  51 => \'{:3_51:}\',\n  52 => \'{:3_52:}\',\n  53 => \'{:3_53:}\',\n  54 => \'{:3_54:}\',\n  55 => \'{:3_55:}\',\n  56 => \'{:3_56:}\',\n  57 => \'{:3_57:}\',\n  58 => \'{:3_58:}\',\n  59 => \'{:3_59:}\',\n  60 => \'{:3_60:}\',\n  61 => \'{:3_61:}\',\n  62 => \'{:3_62:}\',\n  63 => \'{:3_63:}\',\n  64 => \'{:3_64:}\',\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('domainwhitelist', '1', '1342582747', '0', '$_DCACHE[\'domainwhitelist\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('fields_required', '1', '1342582747', '0', '$_DCACHE[\'fields_required\'] = array (\n);\n\n');
INSERT INTO `cdb_caches` VALUES ('fields_optional', '1', '1342582747', '0', '$_DCACHE[\'fields_optional\'] = array (\n);\n\n');

-- ----------------------------
-- Table structure for `cdb_creditslog`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_creditslog`;
CREATE TABLE `cdb_creditslog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fromto` char(15) NOT NULL DEFAULT '',
  `sendcredits` tinyint(1) NOT NULL DEFAULT '0',
  `receivecredits` tinyint(1) NOT NULL DEFAULT '0',
  `send` int(10) unsigned NOT NULL DEFAULT '0',
  `receive` int(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `operation` char(3) NOT NULL DEFAULT '',
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_creditslog
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_crons`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_crons`;
CREATE TABLE `cdb_crons` (
  `cronid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('user','system') NOT NULL DEFAULT 'user',
  `name` char(50) NOT NULL DEFAULT '',
  `filename` char(50) NOT NULL DEFAULT '',
  `lastrun` int(10) unsigned NOT NULL DEFAULT '0',
  `nextrun` int(10) unsigned NOT NULL DEFAULT '0',
  `weekday` tinyint(1) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  `hour` tinyint(2) NOT NULL DEFAULT '0',
  `minute` char(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`cronid`),
  KEY `nextrun` (`available`,`nextrun`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_crons
-- ----------------------------
INSERT INTO `cdb_crons` VALUES ('1', '1', 'system', '清空今日发帖数', 'todayposts_daily.inc.php', '0', '1342586347', '-1', '-1', '0', '0');
INSERT INTO `cdb_crons` VALUES ('2', '1', 'system', '清空本月在线时间', 'onlinetime_monthly.inc.php', '0', '1342586347', '-1', '1', '0', '0');
INSERT INTO `cdb_crons` VALUES ('3', '1', 'system', '每日数据清理', 'cleanup_daily.inc.php', '0', '1342586347', '-1', '-1', '5', '30');
INSERT INTO `cdb_crons` VALUES ('4', '1', 'system', '生日统计与邮件祝福', 'birthdays_daily.inc.php', '0', '1342586347', '-1', '-1', '0', '0');
INSERT INTO `cdb_crons` VALUES ('5', '1', 'system', '主题回复通知', 'announcements_daily.inc.php', '0', '1342586347', '-1', '-1', '0', '0');
INSERT INTO `cdb_crons` VALUES ('6', '1', 'system', '每日公告清理', 'threadexpiries_hourly.inc.php', '0', '1342586347', '-1', '-1', '5', '0');
INSERT INTO `cdb_crons` VALUES ('7', '1', 'system', '限时操作清理', 'promotions_hourly.inc.php', '0', '1342586347', '-1', '-1', '0', '00');
INSERT INTO `cdb_crons` VALUES ('8', '1', 'system', '论坛推广清理', 'cleanup_monthly.inc.php', '0', '1342586347', '-1', '1', '6', '00');
INSERT INTO `cdb_crons` VALUES ('9', '1', 'system', '每月主题清理', 'magics_daily.inc.php', '0', '1342586347', '-1', '-1', '0', '0');
INSERT INTO `cdb_crons` VALUES ('10', '1', 'system', '每日 X-Space更新用户', 'secqaa_daily.inc.php', '0', '1342586347', '-1', '-1', '6', '0');
INSERT INTO `cdb_crons` VALUES ('11', '1', 'system', '每周主题更新', 'tags_daily.inc.php', '0', '1342586347', '6', '-1', '6', '0');
INSERT INTO `cdb_crons` VALUES ('12', '1', 'system', '每日勋章更新', 'medals_daily.inc.php', '0', '1342586347', '-1', '-1', '0', '0');

-- ----------------------------
-- Table structure for `cdb_debateposts`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_debateposts`;
CREATE TABLE `cdb_debateposts` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `stand` tinyint(1) NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `voters` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `voterids` text NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `pid` (`pid`,`stand`),
  KEY `tid` (`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_debateposts
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_debates`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_debates`;
CREATE TABLE `cdb_debates` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `affirmdebaters` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `negadebaters` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `affirmvotes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `negavotes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `umpire` varchar(15) NOT NULL DEFAULT '',
  `winner` tinyint(1) NOT NULL DEFAULT '0',
  `bestdebater` varchar(50) NOT NULL DEFAULT '',
  `affirmpoint` text NOT NULL,
  `negapoint` text NOT NULL,
  `umpirepoint` text NOT NULL,
  `affirmvoterids` text NOT NULL,
  `negavoterids` text NOT NULL,
  `affirmreplies` mediumint(8) unsigned NOT NULL,
  `negareplies` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `uid` (`uid`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_debates
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_failedlogins`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_failedlogins`;
CREATE TABLE `cdb_failedlogins` (
  `ip` char(15) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_failedlogins
-- ----------------------------
INSERT INTO `cdb_failedlogins` VALUES ('127.0.0.1', '1', '1342582789');

-- ----------------------------
-- Table structure for `cdb_faqs`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_faqs`;
CREATE TABLE `cdb_faqs` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fpid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `identifier` varchar(20) NOT NULL,
  `keyword` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `displayplay` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_faqs
-- ----------------------------
INSERT INTO `cdb_faqs` VALUES ('1', '0', '1', '', '', '用户须知', '');
INSERT INTO `cdb_faqs` VALUES ('2', '1', '1', '', '', '我必须要注册吗？', '这取决于管理员如何设置 Discuz! 论坛的用户组权限选项，您甚至有可能必须在注册成正式用户后后才能浏览帖子。当然，在通常情况下，您至少应该是正式用户才能发新帖和回复已有帖子。请 <a href=\"register.php\" target=\"_blank\">点击这里</a> 免费注册成为我们的新用户！\r\n<br /><br />强烈建议您注册，这样会得到很多以游客身份无法实现的功能。');
INSERT INTO `cdb_faqs` VALUES ('3', '1', '2', 'login', '登录帮助', '我如何登录论坛？', '如果您已经注册成为该论坛的会员，哪么您只要通过访问页面右上的<a href=\"logging.php?action=login\" target=\"_blank\">登录</a>，进入登陆界面填写正确的用户名和密码（如果您设有安全提问，请选择正确的安全提问并输入对应的答案），点击“提交”即可完成登陆如果您还未注册请点击这里。<br /><br />\r\n如果需要保持登录，请选择相应的 Cookie 时间，在此时间范围内您可以不必输入密码而保持上次的登录状态。');
INSERT INTO `cdb_faqs` VALUES ('4', '1', '3', '', '', '忘记我的登录密码，怎么办？', '当您忘记了用户登录的密码，您可以通过注册时填写的电子邮箱重新设置一个新的密码。点击登录页面中的 <a href=\"member.php?action=lostpasswd\" target=\"_blank\">取回密码</a>，按照要求填写您的个人信息，系统将自动发送重置密码的邮件到您注册时填写的 Email 信箱中。如果您的 Email 已失效或无法收到信件，请与论坛管理员联系。');
INSERT INTO `cdb_faqs` VALUES ('5', '0', '2', '', '', '帖子相关操作', '');
INSERT INTO `cdb_faqs` VALUES ('6', '0', '3', '', '', '基本功能操作', '');
INSERT INTO `cdb_faqs` VALUES ('7', '0', '4', '', '', '其他相关问题', '');
INSERT INTO `cdb_faqs` VALUES ('8', '1', '4', '', '', '我如何使用个性化头像', '在<a href=\"memcp.php\" target=\"_blank\">控制面板</a>中的“编辑个人资料”，有一个“头像”的选项，可以使用论坛自带的头像或者自定义的头像。');
INSERT INTO `cdb_faqs` VALUES ('9', '1', '5', '', '', '我如何修改登录密码', '在<a href=\"memcp.php\" target=\"_blank\">控制面板</a>中的“编辑个人资料”，填写“原密码”，“新密码”，“确认新密码”。点击“提交”，即可修改。');
INSERT INTO `cdb_faqs` VALUES ('10', '1', '6', '', '', '我如何使用个性化签名和昵称', '在<a href=\"memcp.php\" target=\"_blank\">控制面板</a>中的“编辑个人资料”，有一个“昵称”和“个人签名”的选项，可以在此设置。');
INSERT INTO `cdb_faqs` VALUES ('11', '5', '1', '', '', '我如何发表新主题', '在论坛版块中，点“新帖”，如果有权限，您可以看到有“投票，悬赏，活动，交易”，点击即可进入功能齐全的发帖界面。\r\n<br /><br />注意：一般论坛都设置为高级别的用户组才能发布这四类特殊主题。如发布普通主题，直接点击“新帖”，当然您也可以使用版块下面的“快速发帖”发表新帖(如果此选项打开)。一般论坛都设置为需要登录后才能发帖。');
INSERT INTO `cdb_faqs` VALUES ('12', '5', '2', '', '', '我如何发表回复', '回复有分三种：第一、贴子最下方的快速回复； 第二、在您想回复的楼层点击右下方“回复”； 第三、完整回复页面，点击本页“新帖”旁边的“回复”。');
INSERT INTO `cdb_faqs` VALUES ('13', '5', '3', '', '', '我如何编辑自己的帖子', '在帖子的右下角，有编辑，回复，报告等选项，点击编辑，就可以对帖子进行编辑。');
INSERT INTO `cdb_faqs` VALUES ('14', '5', '4', '', '', '我如何出售购买主题', '<li>出售主题：\r\n当您进入发贴界面后，如果您所在的用户组有发买卖贴的权限，在“售价(金钱)”后面填写主题的价格，这样其他用户在查看这个帖子的时候就需要进入交费的过程才可以查看帖子。</li>\r\n<li>购买主题：\r\n浏览你准备购买的帖子，在帖子的相关信息的下面有[查看付款记录] [购买主题] [返回上一页] \r\n等链接，点击“购买主题”进行购买。</li>');
INSERT INTO `cdb_faqs` VALUES ('15', '5', '5', '', '', '我如何出售购买附件', '<li>上传附件一栏有个售价的输入框，填入出售价格即可实现需要支付才可下载附件的功能。</li>\r\n<li>点击帖子中[购买附件]按钮或点击附件的下载链接会跳转至附件购买页面，确认付款的相关信息后点提交按钮，即可得到附件的下载权限。只需购买一次，就有该附件的永远下载权限。</li>');
INSERT INTO `cdb_faqs` VALUES ('16', '5', '6', '', '', '我如何上传附件', '<li>发表新主题的时候上传附件，步骤为：写完帖子标题和内容后点上传附件右方的浏览，然后在本地选择要上传附件的具体文件名，最后点击发表话题。</li>\r\n<li>发表回复的时候上传附件，步骤为：写完回复楼主的内容，然后点上传附件右方的浏览，找到需要上传的附件，点击发表回复。</li>');
INSERT INTO `cdb_faqs` VALUES ('17', '5', '7', '', '', '我如何实现发帖时图文混排效果', '<li>发表新主题的时候点击上传附件左侧的“[插入]”链接把附件标记插入到帖子中适当的位置即可。</li>');
INSERT INTO `cdb_faqs` VALUES ('18', '5', '8', 'discuzcode', 'Discuz!代码', '我如何使用Discuz!代码', '<table width=\"99%\" cellpadding=\"2\" cellspacing=\"2\">\r\n  <tr>\r\n    <th width=\"50%\">Discuz!代码</th>\r\n    <th width=\"402\">效果</th>\r\n  </tr>\r\n  <tr>\r\n    <td>[b]粗体文字 Abc[/b]</td>\r\n    <td><strong>粗体文字 Abc</strong></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[i]斜体文字 Abc[/i]</td>\r\n    <td><em>斜体文字 Abc</em></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[u]下划线文字 Abc[/u]</td>\r\n    <td><u>下划线文字 Abc</u></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[color=red]红颜色[/color]</td>\r\n    <td><font color=\"red\">红颜色</font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[size=3]文字大小为 3[/size] </td>\r\n    <td><font size=\"3\">文字大小为 3</font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[font=仿宋]字体为仿宋[/font] </td>\r\n    <td><font face=\"仿宋\">字体为仿宋</font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[align=Center]内容居中[/align] </td>\r\n    <td><div align=\"center\">内容居中</div></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[url]http://www.comsenz.com[/url]</td>\r\n    <td><a href=\"http://www.comsenz.com\" target=\"_blank\">http://www.comsenz.com</a>（超级链接）</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[url=http://www.Discuz.net]Discuz! 论坛[/url]</td>\r\n    <td><a href=\"http://www.Discuz.net\" target=\"_blank\">Discuz! 论坛</a>（超级链接）</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[email]myname@mydomain.com[/email]</td>\r\n    <td><a href=\"mailto:myname@mydomain.com\">myname@mydomain.com</a>（E-mail链接）</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[email=support@discuz.net]Discuz! 技术支持[/email]</td>\r\n    <td><a href=\"mailto:support@discuz.net\">Discuz! 技术支持（E-mail链接）</a></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[quote]Discuz! Board 是由康盛创想（北京）科技有限公司开发的论坛软件[/quote] </td>\r\n    <td><div style=\"font-size: 12px\"><br /><br /><div class=\"quote\"><h5>引用:</h5><blockquote>原帖由 <i>admin</i> 于 2006-12-26 08:45 发表<br />Discuz! Board 是由康盛创想（北京）科技有限公司开发的论坛软件</blockquote></div></td>\r\n  </tr>\r\n   <tr>\r\n    <td>[code]Discuz! Board 是由康盛创想（北京）科技有限公司开发的论坛软件[/code] </td>\r\n    <td><div style=\"font-size: 12px\"><br /><br /><div class=\"blockcode\"><h5>代码:</h5><code id=\"code0\">Discuz! Board 是由康盛创想（北京）科技有限公司开发的论坛软件</code></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[hide]隐藏内容 Abc[/hide]</td>\r\n    <td>效果:只有当浏览者回复本帖时，才显示其中的内容，否则显示为“<b>**** 隐藏信息 跟帖后才能显示 *****</b>”</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[hide=20]隐藏内容 Abc[/hide]</td>\r\n    <td>效果:只有当浏览者积分高于 20 点时，才显示其中的内容，否则显示为“<b>**** 隐藏信息 积分高于 20 点才能显示 ****</b>”</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[list][*]列表项 #1[*]列表项 #2[*]列表项 #3[/list]</td>\r\n    <td><ul>\r\n      <li>列表项 ＃1</li>\r\n      <li>列表项 ＃2</li>\r\n      <li>列表项 ＃3 </li>\r\n    </ul></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[img]http://www.discuz.net/images/default/logo.gif[/img] </td>\r\n    <td>帖子内显示为：<img src=\"http://www.discuz.net/images/default/logo.gif\" /></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[img=88,31]http://www.discuz.net/images/logo.gif[/img] </td>\r\n    <td>帖子内显示为：<img src=\"http://www.discuz.net/images/logo.gif\" /></td>\r\n  </tr> <tr>\r\n    <td>[media=400,300,1]多媒体 URL[/media]</td>\r\n    <td>帖子内嵌入多媒体，宽 400 高 300 自动播放</td>\r\n  </tr>\r\n <tr>\r\n    <td>[fly]飞行的效果[/fly]</td>\r\n    <td><marquee scrollamount=\"3\" behavior=\"alternate\" width=\"90%\">飞行的效果</marquee></td>\r\n  </tr>\r\n  <tr>\r\n    <td>[flash]Flash网页地址 [/flash] </td>\r\n    <td>帖子内嵌入 Flash 动画</td>\r\n  </tr>\r\n  <tr>\r\n    <td>[qq]123456789[/qq]</td>\r\n    <td>在帖子内显示 QQ 在线状态，点这个图标可以和他（她）聊天</td>\r\n  </tr>\r\n  <tr>\r\n    <td>X[sup]2[/sup]</td>\r\n    <td>X<sup>2</sup></td>\r\n  </tr>\r\n  <tr>\r\n    <td>X[sub]2[/sub]</td>\r\n    <td>X<sub>2</sub></td>\r\n  </tr>\r\n  \r\n</table>');
INSERT INTO `cdb_faqs` VALUES ('19', '6', '1', '', '', '我如何使用短消息功能', '您登录后，点击导航栏上的短消息按钮，即可进入短消息管理。\r\n点击[发送短消息]按钮，在\"发送到\"后输入收信人的用户名，填写完标题和内容，点提交(或按 Ctrl+Enter 发送)即可发出短消息。\r\n<br /><br />如果要保存到发件箱，以在提交前勾选\"保存到发件箱中\"前的复选框。\r\n<ul>\r\n<li>点击收件箱可打开您的收件箱查看收到的短消息。</li>\r\n<li>点击发件箱可查看保存在发件箱里的短消息。 </li>\r\n<li>点击已发送来查看对方是否已经阅读您的短消息。 </li>\r\n<li>点击搜索短消息就可通过关键字，发信人，收信人，搜索范围，排序类型等一系列条件设定来找到您需要查找的短消息。 </li>\r\n<li>点击导出短消息可以将自己的短消息导出htm文件保存在自己的电脑里。 </li>\r\n<li>点击忽略列表可以设定忽略人员，当这些被添加的忽略用户给您发送短消息时将不予接收。</li>\r\n</ul>');
INSERT INTO `cdb_faqs` VALUES ('20', '6', '2', '', '', '我如何向好友群发短消息', '登录论坛后，点击短消息，然后点发送短消息，如果有好友的话，好友群发后面点击全选，可以给所有的好友群发短消息。');
INSERT INTO `cdb_faqs` VALUES ('21', '6', '3', '', '', '我如何查看论坛会员数据', '点击导航栏上面的会员，然后显示的是此论坛的会员数据。注：需要论坛管理员开启允许你查看会员资料才可看到。');
INSERT INTO `cdb_faqs` VALUES ('22', '6', '4', '', '', '我如何使用搜索', '点击导航栏上面的搜索，输入搜索的关键字并选择一个范围，就可以检索到您有权限访问论坛中的相关的帖子。');
INSERT INTO `cdb_faqs` VALUES ('23', '6', '5', '', '', '我如何使用“我的”功能', '<li>会员必须首先<a href=\"logging.php?action=login\" target=\"_blank\">登录</a>，没有用户名的请先<a href=\"register.php\" target=\"_blank\">注册</a>；</li>\r\n<li>登录之后在论坛的左上方会出现一个“我的”的超级链接，点击这个链接之后就可进入到有关于您的信息。</li>');
INSERT INTO `cdb_faqs` VALUES ('24', '7', '1', '', '', '我如何向管理员报告帖子', '打开一个帖子，在帖子的右下角可以看到：“编辑”、“引用”、“报告”、“评分”、“回复”等等几个按钮，点击其中的“报告”按钮进入报告页面，填写好“我的意见”，单击“报告”按钮即可完成报告某个帖子的操作。');
INSERT INTO `cdb_faqs` VALUES ('25', '7', '2', '', '', '我如何“打印”，“推荐”，“订阅”，“收藏”帖子', '当你浏览一个帖子时，在它的右上角可以看到：“打印”、“推荐”、“订阅”、“收藏”，点击相对应的文字连接即可完成相关的操作。');
INSERT INTO `cdb_faqs` VALUES ('26', '7', '3', '', '', '我如何设置论坛好友', '设置论坛好友有3种简单的方法。\r\n<ul>\r\n<li>当您浏览帖子的时候可以点击“发表时间”右侧的“加为好友”设置论坛好友。</li>\r\n<li>当您浏览某用户的个人资料时，可以点击头像下方的“加为好友”设置论坛好友。</li>\r\n<li>您也可以在控制面板中的好友列表增加您的论坛好友。</li>\r\n<ul>');
INSERT INTO `cdb_faqs` VALUES ('27', '7', '4', '', '', '我如何使用RSS订阅', '在论坛的首页和进入版块的页面的右上角就会出现一个rss订阅的小图标<img src=\"images/common/xml.gif\" border=\"0\">，鼠标点击之后将出现本站点的rss地址，你可以将此rss地址放入到你的rss阅读器中进行订阅。');
INSERT INTO `cdb_faqs` VALUES ('28', '7', '5', '', '', '我如何清除Cookies', 'cookie是由浏览器保存在系统内的，在论坛的右下角提供有\"清除 Cookies\"的功能，点击后即可帮您清除系统内存储的Cookies。 <br /><br />\r\n以下介绍3种常用浏览器的Cookies清除方法(注：此方法为清除全部的Cookies,请谨慎使用)\r\n<ul>\r\n<li>Internet Explorer: 工具（选项）内的Internet选项→常规选项卡内，IE6直接可以看到删除Cookies的按钮点击即可，IE7为“浏 览历史记录”选项内的删除点击即可清空Cookies。对于Maxthon,腾讯TT等IE核心浏览器一样适用。 </li>\r\n<li>FireFox:工具→选项→隐私→Cookies→显示Cookie里可以对Cookie进行对应的删除操作。 </li>\r\n<li>Opera:工具→首选项→高级→Cookies→管理Cookies即可对Cookies进行删除的操作。</li>\r\n</ul>');
INSERT INTO `cdb_faqs` VALUES ('29', '7', '6', '', '', '我如何联系管理员', '您可以通过论坛底部右下角的“联系我们”链接快速的发送邮件与我们联系。也可以通过管理团队中的用户资料发送短消息给我们。');
INSERT INTO `cdb_faqs` VALUES ('30', '7', '7', '', '', '我如何开通个人空间', '如果您有权限开通“我的个人空间”，当用户登录论坛以后在论坛首页，用户名的右方点击开通我的个人空间，进入个人空间的申请页面。');
INSERT INTO `cdb_faqs` VALUES ('31', '7', '8', '', '', '我如何将自己的主题加入个人空间', '如果您有权限开通“我的个人空间”，在您发表的主题上方点击“加入个人空间”，您发表的主题以及回复都会加入到您空间的日志里。');
INSERT INTO `cdb_faqs` VALUES ('32', '5', '9', 'smilies', '表情', '我如何使用表情代码', '表情是一些用字符表示的表情符号，如果打开表情功能，Discuz! 会把一些符号转换成小图像，显示在帖子中，更加美观明了。目前支持下面这些表情：<br /><br />\r\n<table cellspacing=\"0\" cellpadding=\"4\" width=\"30%\" align=\"center\">\r\n<tr><th width=\"25%\" align=\"center\">表情符号</td>\r\n<th width=\"75%\" align=\"center\">对应图像</td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:)</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/smile.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:(</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/sad.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:D</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/biggrin.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:\\\'(</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/cry.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:@</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/huffy.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:o</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/shocked.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:P</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/tongue.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:$</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/shy.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">;P</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/titter.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:L</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/sweat.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:Q</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/mad.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:lol</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/lol.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:hug:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/hug.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:victory:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/victory.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:time:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/time.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:kiss:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/kiss.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:handshake</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/handshake.gif\" alt=\"\" /></td>\r\n</tr>\r\n<tr>\r\n<td width=\"25%\" align=\"center\">:call:</td>\r\n<td width=\"75%\" align=\"center\"><img src=\"images/smilies/default/call.gif\" alt=\"\" /></td>\r\n</tr>\r\n</table>\r\n</div></div>\r\n<br />');
INSERT INTO `cdb_faqs` VALUES ('33', '0', '5', '', '', '论坛高级功能使用', '');
INSERT INTO `cdb_faqs` VALUES ('34', '33', '0', 'forwardmessagelist', '', '论坛快速跳转关键字列表', 'Discuz! 支持自定义快速跳转页面，当某些操作完成后，可以不显示提示信息，直接跳转到新的页面，从而方便用户进行下一步操作，避免等待。 在实际使用当中，您根据需要，把关键字添加到快速跳转设置里面(后台 -- 基本设置 --  界面与显示方式 -- [<a href=\"admincp.php?action=settings&operation=styles&frames=yes\" target=\"_blank\">提示信息跳转设置</a> ])，让某些信息不显示而实现快速跳转。以下是 Discuz! 当中的一些常用信息的关键字:\r\n</br></br>\r\n\r\n<table width=\"99%\" cellpadding=\"2\" cellspacing=\"2\">\r\n  <tr>\r\n    <td width=\"50%\">关键字</td>\r\n    <td width=\"50%\">提示信息页面或者作用</td>\r\n  </tr>\r\n  <tr>\r\n    <td>login_succeed</td>\r\n    <td>登录成功</td>\r\n  </tr>\r\n  <tr>\r\n    <td>logout_succeed</td>\r\n    <td>退出登录成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>thread_poll_succeed</td>\r\n    <td>投票成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>thread_rate_succeed</td>\r\n    <td>评分成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>register_succeed</td>\r\n    <td>注册成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>usergroups_join_succeed</td>\r\n    <td>加入扩展组成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td height=\"22\">usergroups_exit_succeed</td>\r\n    <td>退出扩展组成功</td>\r\n  </tr>\r\n  <tr>\r\n    <td>usergroups_update_succeed</td>\r\n    <td>更新扩展组成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>buddy_update_succeed</td>\r\n    <td>好友更新成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_edit_succeed</td>\r\n    <td>编辑帖子成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_edit_delete_succeed</td>\r\n    <td>删除帖子成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_reply_succeed</td>\r\n    <td>回复成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_newthread_succeed</td>\r\n    <td>发表新主题成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_reply_blog_succeed</td>\r\n    <td>文集评论发表成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>post_newthread_blog_succeed</td>\r\n    <td>blog 发表成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>profile_avatar_succeed</td>\r\n    <td>头像设置成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>profile_succeed</td>\r\n    <td>个人资料更新成功</td>\r\n  </tr>\r\n    <tr>\r\n    <td>pm_send_succeed</td>\r\n    <td>短消息发送成功</td>\r\n  </tr>\r\n  </tr>\r\n    <tr>\r\n    <td>pm_delete_succeed</td>\r\n    <td>短消息删除成功</td>\r\n  </tr>\r\n  </tr>\r\n    <tr>\r\n    <td>pm_ignore_succeed</td>\r\n    <td>短消息忽略列表更新</td>\r\n  </tr>\r\n    <tr>\r\n    <td>admin_succeed</td>\r\n    <td>管理操作成功〔注意：设置此关键字后，所有管理操作完毕都将直接跳转〕</td>\r\n  </tr>\r\n    <tr>\r\n    <td>admin_succeed_next&nbsp;</td>\r\n    <td>管理成功并将跳转到下一个管理动作</td>\r\n  </tr> \r\n    <tr>\r\n    <td>search_redirect</td>\r\n    <td>搜索完成，进入搜索结果列表</td>\r\n  </tr>\r\n</table>');

-- ----------------------------
-- Table structure for `cdb_favoriteforums`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_favoriteforums`;
CREATE TABLE `cdb_favoriteforums` (
  `fid` smallint(6) NOT NULL DEFAULT '0',
  `uid` mediumint(8) NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  `newthreads` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_favoriteforums
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_favorites`;
CREATE TABLE `cdb_favorites` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_favoritethreads`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_favoritethreads`;
CREATE TABLE `cdb_favoritethreads` (
  `tid` mediumint(8) NOT NULL DEFAULT '0',
  `uid` mediumint(8) NOT NULL DEFAULT '0',
  `dateline` int(10) NOT NULL DEFAULT '0',
  `newreplies` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_favoritethreads
-- ----------------------------
INSERT INTO `cdb_favoritethreads` VALUES ('14', '1', '1342583268', '0');

-- ----------------------------
-- Table structure for `cdb_feeds`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_feeds`;
CREATE TABLE `cdb_feeds` (
  `feed_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT 'default',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `appid` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `template` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feed_id`),
  KEY `type` (`type`),
  KEY `dateline` (`dateline`),
  KEY `uid` (`uid`),
  KEY `appid` (`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_feeds
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_forumfields`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_forumfields`;
CREATE TABLE `cdb_forumfields` (
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `password` varchar(12) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `postcredits` varchar(255) NOT NULL DEFAULT '',
  `replycredits` varchar(255) NOT NULL DEFAULT '',
  `getattachcredits` varchar(255) NOT NULL DEFAULT '',
  `postattachcredits` varchar(255) NOT NULL DEFAULT '',
  `digestcredits` varchar(255) NOT NULL DEFAULT '',
  `redirect` varchar(255) NOT NULL DEFAULT '',
  `attachextensions` varchar(255) NOT NULL DEFAULT '',
  `formulaperm` text NOT NULL,
  `moderators` text NOT NULL,
  `rules` text NOT NULL,
  `threadtypes` text NOT NULL,
  `threadsorts` text NOT NULL,
  `viewperm` text NOT NULL,
  `postperm` text NOT NULL,
  `replyperm` text NOT NULL,
  `getattachperm` text NOT NULL,
  `postattachperm` text NOT NULL,
  `keywords` text NOT NULL,
  `supe_pushsetting` text NOT NULL,
  `modrecommend` text NOT NULL,
  `tradetypes` text NOT NULL,
  `typemodels` mediumtext NOT NULL,
  `threadplugin` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_forumfields
-- ----------------------------
INSERT INTO `cdb_forumfields` VALUES ('1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `cdb_forumfields` VALUES ('2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `cdb_forumlinks`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_forumlinks`;
CREATE TABLE `cdb_forumlinks` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `logo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_forumlinks
-- ----------------------------
INSERT INTO `cdb_forumlinks` VALUES ('1', '0', 'Discuz! 官方论坛', 'http://www.discuz.net', '提供最新 Discuz! 产品新闻、软件下载与技术交流', 'images/logo.gif');

-- ----------------------------
-- Table structure for `cdb_forumrecommend`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_forumrecommend`;
CREATE TABLE `cdb_forumrecommend` (
  `fid` smallint(6) unsigned NOT NULL,
  `tid` mediumint(8) unsigned NOT NULL,
  `typeid` smallint(6) NOT NULL,
  `displayorder` tinyint(1) NOT NULL,
  `subject` char(80) NOT NULL,
  `author` char(15) NOT NULL,
  `authorid` mediumint(8) NOT NULL,
  `moderatorid` mediumint(8) NOT NULL,
  `expiration` int(10) unsigned NOT NULL,
  `position` tinyint(1) NOT NULL DEFAULT '0',
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `filename` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`tid`),
  KEY `displayorder` (`fid`,`displayorder`),
  KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_forumrecommend
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_forums`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_forums`;
CREATE TABLE `cdb_forums` (
  `fid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `fup` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type` enum('group','forum','sub') NOT NULL DEFAULT 'forum',
  `name` char(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `todayposts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpost` char(110) NOT NULL DEFAULT '',
  `allowsmilies` tinyint(1) NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowimgcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowmediacode` tinyint(1) NOT NULL DEFAULT '0',
  `allowanonymous` tinyint(1) NOT NULL DEFAULT '0',
  `allowshare` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostspecial` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowspecialonly` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `alloweditrules` tinyint(1) NOT NULL DEFAULT '0',
  `allowfeed` tinyint(1) NOT NULL DEFAULT '1',
  `recyclebin` tinyint(1) NOT NULL DEFAULT '0',
  `modnewposts` tinyint(1) NOT NULL DEFAULT '0',
  `jammer` tinyint(1) NOT NULL DEFAULT '0',
  `disablewatermark` tinyint(1) NOT NULL DEFAULT '0',
  `inheritedmod` tinyint(1) NOT NULL DEFAULT '0',
  `autoclose` smallint(6) NOT NULL DEFAULT '0',
  `forumcolumns` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `threadcaches` tinyint(1) NOT NULL DEFAULT '0',
  `alloweditpost` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `simple` tinyint(1) unsigned NOT NULL,
  `modworks` tinyint(1) unsigned NOT NULL,
  `allowtag` tinyint(1) NOT NULL DEFAULT '1',
  `allowglobalstick` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`fid`),
  KEY `forum` (`status`,`type`,`displayorder`),
  KEY `fup` (`fup`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_forums
-- ----------------------------
INSERT INTO `cdb_forums` VALUES ('1', '0', 'group', 'Discuz!', '1', '0', '0', '0', '0', '0', '', '0', '0', '1', '1', '1', '0', '1', '63', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1');
INSERT INTO `cdb_forums` VALUES ('2', '1', 'forum', '默认版块', '1', '0', '0', '14', '15', '2', '14	zqhxuyuan的测试	1342583277	admin', '1', '0', '1', '1', '1', '0', '1', '63', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for `cdb_imagetypes`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_imagetypes`;
CREATE TABLE `cdb_imagetypes` (
  `typeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` char(20) NOT NULL,
  `type` enum('smiley','icon','avatar') NOT NULL DEFAULT 'smiley',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `directory` char(100) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_imagetypes
-- ----------------------------
INSERT INTO `cdb_imagetypes` VALUES ('1', '1', '默认', 'smiley', '1', 'default');
INSERT INTO `cdb_imagetypes` VALUES ('2', '1', '酷猴', 'smiley', '2', 'coolmonkey');
INSERT INTO `cdb_imagetypes` VALUES ('3', '1', '呆呆男', 'smiley', '3', 'grapeman');

-- ----------------------------
-- Table structure for `cdb_invites`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_invites`;
CREATE TABLE `cdb_invites` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `inviteip` char(15) NOT NULL,
  `invitecode` char(16) NOT NULL,
  `reguid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `regdateline` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  KEY `uid` (`uid`,`status`),
  KEY `invitecode` (`invitecode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_invites
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_itempool`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_itempool`;
CREATE TABLE `cdb_itempool` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL,
  `question` text NOT NULL,
  `answer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_itempool
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_magiclog`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_magiclog`;
CREATE TABLE `cdb_magiclog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `magicid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` smallint(6) unsigned NOT NULL DEFAULT '0',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `targettid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `targetpid` int(10) unsigned NOT NULL DEFAULT '0',
  `targetuid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`,`dateline`),
  KEY `targetuid` (`targetuid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_magiclog
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_magicmarket`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_magicmarket`;
CREATE TABLE `cdb_magicmarket` (
  `mid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `magicid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL,
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `num` (`magicid`,`num`),
  KEY `price` (`magicid`,`price`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_magicmarket
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_magics`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_magics`;
CREATE TABLE `cdb_magics` (
  `magicid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `identifier` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  `salevolume` smallint(6) unsigned NOT NULL DEFAULT '0',
  `supplytype` tinyint(1) NOT NULL DEFAULT '0',
  `supplynum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `filename` varchar(50) NOT NULL,
  `magicperm` text NOT NULL,
  PRIMARY KEY (`magicid`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `displayorder` (`available`,`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_magics
-- ----------------------------
INSERT INTO `cdb_magics` VALUES ('1', '1', '1', '变色卡', 'CCK', '可以变换主题的颜色,并保存24小时', '0', '10', '999', '0', '0', '0', '20', '0', 'magic_color.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('2', '1', '3', '金钱卡', 'MOK', '可以随机获得一些金币', '0', '10', '999', '0', '0', '0', '30', '0', 'magic_money.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('3', '1', '1', 'IP卡', 'SEK', '可以查看帖子作者的IP', '0', '15', '999', '0', '0', '0', '30', '0', 'magic_see.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('4', '1', '1', '提升卡', 'UPK', '可以提升某个主题', '0', '10', '999', '0', '0', '0', '30', '0', 'magic_up.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('5', '1', '1', '置顶卡', 'TOK', '可以将主题置顶24小时', '0', '20', '999', '0', '0', '0', '40', '0', 'magic_top.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('6', '1', '1', '悔悟卡', 'REK', '可以删除自己的帖子', '0', '10', '999', '0', '0', '0', '30', '0', 'magic_del.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('7', '1', '2', '狗仔卡', 'RTK', '查看某个用户是否在线', '0', '15', '999', '0', '0', '0', '30', '0', 'magic_reporter.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('8', '1', '1', '沉默卡', 'CLK', '24小时内不能回复', '0', '15', '999', '0', '0', '0', '30', '0', 'magic_close.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('9', '1', '1', '喧嚣卡', 'OPK', '使贴子可以回复', '0', '15', '999', '0', '0', '0', '30', '0', 'magic_open.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('10', '1', '1', '隐身卡', 'YSK', '可以将自己的帖子匿名', '0', '20', '999', '0', '0', '0', '30', '0', 'magic_hidden.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('11', '1', '1', '恢复卡', 'CBK', '将匿名恢复为正常显示的用户名,匿名终结者', '0', '15', '999', '0', '0', '0', '20', '0', 'magic_renew.inc.php', '');
INSERT INTO `cdb_magics` VALUES ('12', '1', '1', '移动卡', 'MVK', '可将自已的帖子移动到其他版面（隐含、特殊限定版面除外）', '0', '50', '989', '0', '0', '0', '50', '0', 'magic_move.inc.php', '');

-- ----------------------------
-- Table structure for `cdb_medallog`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_medallog`;
CREATE TABLE `cdb_medallog` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `medalid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `status` (`status`,`expiration`),
  KEY `uid` (`uid`,`medalid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_medallog
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_medals`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_medals`;
CREATE TABLE `cdb_medals` (
  `medalid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `expiration` smallint(6) unsigned NOT NULL DEFAULT '0',
  `permission` mediumtext NOT NULL,
  PRIMARY KEY (`medalid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_medals
-- ----------------------------
INSERT INTO `cdb_medals` VALUES ('1', 'Medal No.1', '0', 'medal1.gif', '0', '0', '', '0', '');
INSERT INTO `cdb_medals` VALUES ('2', 'Medal No.2', '0', 'medal2.gif', '0', '0', '', '0', '');
INSERT INTO `cdb_medals` VALUES ('3', 'Medal No.3', '0', 'medal3.gif', '0', '0', '', '0', '');
INSERT INTO `cdb_medals` VALUES ('4', 'Medal No.4', '0', 'medal4.gif', '0', '0', '', '0', '');
INSERT INTO `cdb_medals` VALUES ('5', 'Medal No.5', '0', 'medal5.gif', '0', '0', '', '0', '');
INSERT INTO `cdb_medals` VALUES ('6', 'Medal No.6', '0', 'medal6.gif', '0', '0', '', '0', '');
INSERT INTO `cdb_medals` VALUES ('7', 'Medal No.7', '0', 'medal7.gif', '0', '0', '', '0', '');
INSERT INTO `cdb_medals` VALUES ('8', 'Medal No.8', '0', 'medal8.gif', '0', '0', '', '0', '');
INSERT INTO `cdb_medals` VALUES ('9', 'Medal No.9', '0', 'medal9.gif', '0', '0', '', '0', '');
INSERT INTO `cdb_medals` VALUES ('10', 'Medal No.10', '0', 'medal10.gif', '0', '0', '', '0', '');

-- ----------------------------
-- Table structure for `cdb_memberfields`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_memberfields`;
CREATE TABLE `cdb_memberfields` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `site` varchar(75) NOT NULL DEFAULT '',
  `alipay` varchar(50) NOT NULL DEFAULT '',
  `icq` varchar(12) NOT NULL DEFAULT '',
  `qq` varchar(12) NOT NULL DEFAULT '',
  `yahoo` varchar(40) NOT NULL DEFAULT '',
  `msn` varchar(100) NOT NULL DEFAULT '',
  `taobao` varchar(40) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  `customstatus` varchar(30) NOT NULL DEFAULT '',
  `medals` text NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `avatarwidth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `avatarheight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bio` text NOT NULL,
  `sightml` text NOT NULL,
  `ignorepm` text NOT NULL,
  `groupterms` text NOT NULL,
  `authstr` varchar(20) NOT NULL DEFAULT '',
  `spacename` varchar(40) NOT NULL,
  `buyercredit` smallint(6) NOT NULL DEFAULT '0',
  `sellercredit` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_memberfields
-- ----------------------------
INSERT INTO `cdb_memberfields` VALUES ('1', '', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '', '', '', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for `cdb_membermagics`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_membermagics`;
CREATE TABLE `cdb_membermagics` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `magicid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_membermagics
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_memberrecommend`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_memberrecommend`;
CREATE TABLE `cdb_memberrecommend` (
  `tid` mediumint(8) unsigned NOT NULL,
  `recommenduid` mediumint(8) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  KEY `tid` (`tid`),
  KEY `uid` (`recommenduid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_memberrecommend
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_members`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_members`;
CREATE TABLE `cdb_members` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `secques` char(8) NOT NULL DEFAULT '',
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` tinyint(1) NOT NULL DEFAULT '0',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `groupexpiry` int(10) unsigned NOT NULL DEFAULT '0',
  `extgroupids` char(20) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '',
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `threads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `digestposts` smallint(6) unsigned NOT NULL DEFAULT '0',
  `oltime` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pageviews` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `credits` int(10) NOT NULL DEFAULT '0',
  `extcredits1` int(10) NOT NULL DEFAULT '0',
  `extcredits2` int(10) NOT NULL DEFAULT '0',
  `extcredits3` int(10) NOT NULL DEFAULT '0',
  `extcredits4` int(10) NOT NULL DEFAULT '0',
  `extcredits5` int(10) NOT NULL DEFAULT '0',
  `extcredits6` int(10) NOT NULL DEFAULT '0',
  `extcredits7` int(10) NOT NULL DEFAULT '0',
  `extcredits8` int(10) NOT NULL DEFAULT '0',
  `email` char(40) NOT NULL DEFAULT '',
  `bday` date NOT NULL DEFAULT '0000-00-00',
  `sigstatus` tinyint(1) NOT NULL DEFAULT '0',
  `tpp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ppp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `dateformat` tinyint(1) NOT NULL DEFAULT '0',
  `timeformat` tinyint(1) NOT NULL DEFAULT '0',
  `pmsound` tinyint(1) NOT NULL DEFAULT '0',
  `showemail` tinyint(1) NOT NULL DEFAULT '0',
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `timeoffset` char(4) NOT NULL DEFAULT '',
  `prompt` tinyint(1) NOT NULL DEFAULT '0',
  `accessmasks` tinyint(1) NOT NULL DEFAULT '0',
  `editormode` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `customshow` tinyint(1) unsigned NOT NULL DEFAULT '26',
  `xspacestatus` tinyint(1) NOT NULL DEFAULT '0',
  `customaddfeed` tinyint(1) NOT NULL DEFAULT '0',
  `newbietaskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_members
-- ----------------------------
INSERT INTO `cdb_members` VALUES ('1', 'admin', '33147b7b0c75d6e3179dfd20a65fa88a', '', '0', '1', '1', '0', '', 'hidden', '1342582747', '127.0.0.1', '0', '1342582789', '1342583277', '15', '14', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'admin@admin.com', '0000-00-00', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '9999', '0', '0', '2', '26', '0', '0', '0');

-- ----------------------------
-- Table structure for `cdb_memberspaces`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_memberspaces`;
CREATE TABLE `cdb_memberspaces` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `description` char(100) NOT NULL,
  `layout` char(200) NOT NULL,
  `side` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_memberspaces
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_moderators`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_moderators`;
CREATE TABLE `cdb_moderators` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `inherited` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_moderators
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_modworks`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_modworks`;
CREATE TABLE `cdb_modworks` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modaction` char(3) NOT NULL DEFAULT '',
  `dateline` date NOT NULL DEFAULT '2006-01-01',
  `count` smallint(6) unsigned NOT NULL DEFAULT '0',
  `posts` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_modworks
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_mytasks`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_mytasks`;
CREATE TABLE `cdb_mytasks` (
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL DEFAULT '',
  `taskid` smallint(6) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `csc` char(255) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`taskid`),
  KEY `parter` (`taskid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_mytasks
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_navs`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_navs`;
CREATE TABLE `cdb_navs` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `target` tinyint(1) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL,
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_navs
-- ----------------------------
INSERT INTO `cdb_navs` VALUES ('1', '0', '论坛', '', '#', '0', '0', '1', '1', '0', '0');
INSERT INTO `cdb_navs` VALUES ('2', '0', '搜索', '', 'search.php', '0', '0', '1', '2', '0', '0');
INSERT INTO `cdb_navs` VALUES ('3', '0', '插件', '', '#', '0', '0', '1', '4', '0', '0');
INSERT INTO `cdb_navs` VALUES ('4', '0', '帮助', '', 'faq.php', '0', '0', '1', '5', '0', '0');
INSERT INTO `cdb_navs` VALUES ('5', '0', '导航', '', '#', '0', '0', '1', '6', '0', '0');

-- ----------------------------
-- Table structure for `cdb_onlinelist`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_onlinelist`;
CREATE TABLE `cdb_onlinelist` (
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_onlinelist
-- ----------------------------
INSERT INTO `cdb_onlinelist` VALUES ('1', '1', '管理员', 'online_admin.gif');
INSERT INTO `cdb_onlinelist` VALUES ('2', '2', '超级版主', 'online_supermod.gif');
INSERT INTO `cdb_onlinelist` VALUES ('3', '3', '版主', 'online_moderator.gif');
INSERT INTO `cdb_onlinelist` VALUES ('0', '4', '会员', 'online_member.gif');

-- ----------------------------
-- Table structure for `cdb_onlinetime`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_onlinetime`;
CREATE TABLE `cdb_onlinetime` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `thismonth` smallint(6) unsigned NOT NULL DEFAULT '0',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_onlinetime
-- ----------------------------
INSERT INTO `cdb_onlinetime` VALUES ('1', '10', '60', '1170601084');

-- ----------------------------
-- Table structure for `cdb_orders`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_orders`;
CREATE TABLE `cdb_orders` (
  `orderid` char(32) NOT NULL DEFAULT '',
  `status` char(3) NOT NULL DEFAULT '',
  `buyer` char(50) NOT NULL DEFAULT '',
  `admin` char(15) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `price` float(7,2) unsigned NOT NULL DEFAULT '0.00',
  `submitdate` int(10) unsigned NOT NULL DEFAULT '0',
  `confirmdate` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `orderid` (`orderid`),
  KEY `submitdate` (`submitdate`),
  KEY `uid` (`uid`,`submitdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_orders
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_paymentlog`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_paymentlog`;
CREATE TABLE `cdb_paymentlog` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `amount` int(10) unsigned NOT NULL DEFAULT '0',
  `netamount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`uid`),
  KEY `uid` (`uid`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_paymentlog
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_pluginhooks`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_pluginhooks`;
CREATE TABLE `cdb_pluginhooks` (
  `pluginhookid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `code` mediumtext NOT NULL,
  PRIMARY KEY (`pluginhookid`),
  KEY `pluginid` (`pluginid`),
  KEY `available` (`available`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_pluginhooks
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_plugins`;
CREATE TABLE `cdb_plugins` (
  `pluginid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `identifier` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `datatables` varchar(255) NOT NULL DEFAULT '',
  `directory` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  `modules` text NOT NULL,
  `version` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pluginid`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_pluginvars`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_pluginvars`;
CREATE TABLE `cdb_pluginvars` (
  `pluginvarid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `variable` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'text',
  `value` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`pluginvarid`),
  KEY `pluginid` (`pluginid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_pluginvars
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_polloptions`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_polloptions`;
CREATE TABLE `cdb_polloptions` (
  `polloptionid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `votes` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `polloption` varchar(80) NOT NULL DEFAULT '',
  `voterids` mediumtext NOT NULL,
  PRIMARY KEY (`polloptionid`),
  KEY `tid` (`tid`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_polloptions
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_polls`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_polls`;
CREATE TABLE `cdb_polls` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `overt` tinyint(1) NOT NULL DEFAULT '0',
  `multiple` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `maxchoices` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_polls
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_postposition`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_postposition`;
CREATE TABLE `cdb_postposition` (
  `tid` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`,`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_postposition
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_posts`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_posts`;
CREATE TABLE `cdb_posts` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `first` tinyint(1) NOT NULL DEFAULT '0',
  `author` varchar(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` mediumtext NOT NULL,
  `useip` varchar(15) NOT NULL DEFAULT '',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `usesig` tinyint(1) NOT NULL DEFAULT '0',
  `htmlon` tinyint(1) NOT NULL DEFAULT '0',
  `bbcodeoff` tinyint(1) NOT NULL DEFAULT '0',
  `smileyoff` tinyint(1) NOT NULL DEFAULT '0',
  `parseurloff` tinyint(1) NOT NULL DEFAULT '0',
  `attachment` tinyint(1) NOT NULL DEFAULT '0',
  `rate` smallint(6) NOT NULL DEFAULT '0',
  `ratetimes` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `fid` (`fid`),
  KEY `authorid` (`authorid`),
  KEY `dateline` (`dateline`),
  KEY `invisible` (`invisible`),
  KEY `displayorder` (`tid`,`invisible`,`dateline`),
  KEY `first` (`tid`,`first`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_posts
-- ----------------------------
INSERT INTO `cdb_posts` VALUES ('1', '2', '1', '1', 'admin', '1', '论坛运营秘籍 - Discuz! 7.2 新功能的妙用 ', '1342582747', '\r\nDiscuz! 7.2 新推出的几个功能，都是围绕着提高论坛的互动性而设计的，好好利用这些新功能，对于提高论坛用户粘性，增强会员之间的互动性，大有脾益。下面我们来说说，如何根据论坛的实际情况，来合理的设置这些新功能。[p=30, 2, left]\r\n[b][size=4]一、论坛动态和首页显示风格[/size][/b] [/p][p=30, 2, left]\r\n[b]设计目标：[/b] [/p]\r\n通过对论坛事件展示方式的优化，增强论坛信息的传递功能，提高论坛会员之间的沟通效率。[b]设置指导：[/b]\r\n很多人喜欢 UCHome 中好友动态功能，Discuz! 将这一功能引入论坛系统，通过指定条件产生论坛动态消息，促进会员之间互动的产生。各项目的值应该根据当前论坛运营状况仔细斟酌而定。 例如：论坛日发帖量在100以上的，设置【主题回复数达到一定值发送动态】时可以如下设置 “10, 30, 80”  ，这样当主题被回复了10次，30次，80次的时候都在论坛动态页产生一个动态消息。日发帖量在1000以上的论坛，就可以设置“30，100，200”。总结起来论坛小，活跃用户少，日发帖量不大，那么应该将各项目的阈值调低，这样让论坛动态更容易产生。相反，论坛大，活跃用户多，日发帖量很大，那么应该将各项目的阈值调高，避免论坛动态泛滥，影响用户体验。\r\n\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_200910091741481w8rg.thumb.jpg[/img]\r\n\r\n论坛首页支持两种显示风格了：一种是传统的论坛版块列表的形式，这种形式历史悠久，被广大用户所熟悉，版块就像一本书的目录，用户可以根据版块来快速的确定自己感兴趣的话题在什么地方；第二种论坛首页形式就是7.2新推出的论坛动态，在这种形式下，论坛内的各种事件动态信息都汇集到论坛动态列表中，比如某人发的主题回复数超过1000了，某某的帖子被版主评为精华了等等。这种以事件为核心，动态信息为表现的形式，可以大大加强论坛用户之间的互动性，信息流动起来了，互动性就更容易产生，更能突出一个真实“社区”的感觉。\r\n在这里特别提醒一下，刚开始运营不久的论坛，往往内容不够充实，人气不旺，也就产生不了高质量的论坛动态信息，因此短期内不宜设置首页风格为：论坛实时动态。\r\n\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_200910091742581Wdb4.png[/img][p=30, 2, left]\r\n[b][size=4]二、基于主题热度和评价的主题推荐方式[/size][/b] [/p][p=30, 2, left]\r\n[b]设计目标：[/b] [/p]\r\n以前版本中的版主推荐或者被广泛采用的首页四格插件等功能都是为了达到同一个目的：让论坛的各种“热闹”或者精华信息被更多的用户更加容易的看到，促使他们参与其中。 但以前的方式由于对论坛的帖子没有一个统一标准的评价系统，因此不管采用那种信息提取方式，都会不够精准。因此 Discuz! 引入了主题热度的概念，让论坛用户广泛的参与到论坛内容的评价中来。让论坛热闹和精华信息的提取和展现变得更加准确，更加方便。\r\n[b]设置指导：[/b]\r\n【[url=http://faq.comsenz.com/viewnews-851]主题热度[/url]】会影响主题在主题列表显示时标题后图标的显示(如图)，主题的热度根据回复数、评价值等参量根据一定算法计算得到。当热度值达到设定的显示级别如50，100，200 时，在主题列表中主题的标题后会显示对应级别的图标，来表示该主题的热门程度。站长应该根据站点当前运营情况来设定这些值，一般推荐的方案是保证主题列表中，热门主题和普通主题的比例在 1:7 左右。\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_200910091749011stPk.png[/img]\r\n\r\n【[url=http://faq.comsenz.com/viewnews-851]主题评价[/url]】功能通过收集用户对主题的评价，来计算评价图标的显示级别，当达到设定的级别阈值时，在主题列表中显示主题标题后的对应级别的推荐图标。用户可以再后台设置主题评价的词语 例如加分操作和减分操作分别设置为“顶”“踩”或者“支持”“鄙视”等，发挥想象力，让用户更有兴趣参与到对主题的评价中来。\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_20091009174901250VL.png[/img]\r\n\r\n【[url=http://faq.comsenz.com/viewnews-854]论坛热点[/url]】是根据主题热度来选取一部分热点主题展示在首页，由于选取的主题热度高，参与性强，加之显示在首页所以能好的促进论坛气氛的活跃。但是新站开启论坛热点的效果不会很好，因为新站主题少，人气少，提取出来的热点准确性就会大打折扣。等有一定人气基础，出来的热点才是真正的热点。一般推荐的方式是：左边放置图片展示，右边设置 10 至 14 个推荐主题。\r\n\r\n[url=http://faq.comsenz.com/attachments/2009/10/26_200910091744121xhVg.png][img=644,186]http://faq.comsenz.com/attachments/2009/10/26_200910091744121xhVg.png[/img][/url]\r\n\r\n【[url=http://faq.comsenz.com/viewnews-852]推荐主题[/url]】功能通过自动或手动方式从论坛数据中提取一些主题作为系统推荐的主题，这些主题一般为论坛里内容精彩、用户参与度高的话题。推荐主题的数量应设置合理，太多则让人眼花缭乱，太少则不美观。数据缓存时间也要设置得当，该值设置太大则数据长时间不更新，造成吸引力下降，设置太小频繁更新缓存又会增加服务器负担。根据设置推荐的主题可以显示在主题列表页，也可以显示在主题查看页（如图）。一般来讲和版块话题主旨符合程度高，帖子内容普适程度高的主题适合显示在主题列表页，帖子内容新颖，话题性强则更适合显示到主题查看页。\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/10/26_200910091759431vD2J.png[/img]\r\n[url=http://faq.comsenz.com/attachments/2009/10/26_200910091759432UPgA.png][img=644,459]http://faq.comsenz.com/attachments/2009/10/26_200910091759432UPgA.png[/img][/url]\r\n[p=30, 2, left]\r\n[b][size=4]三、服务老用户不忘照顾新用户[/size][/b][/p]\r\n\r\n[b]设计目标：[/b]\r\n随着互联网的发展，论坛用户群体越来越广泛，很多人没有多少上网或电脑使用经验，他们成为论坛的用户后往往不知道自己能在论坛做些什么，通过新手任务功能，在向导的指引下，让这些用户很快的掌握论坛基本操作，不再对论坛感到陌生，尽快的参与到论坛的各种活动当中。\r\n[b]设置指导：[/b]\r\n建议站长在进行【[url=http://faq.comsenz.com/viewnews-853]新手任务[/url]】的设置时认真考虑任务奖励类型和具体的奖励量值。一般来讲，同时使用多种奖励形式(论坛已设定开启【道具】和【勋章】功能)更能激励新手们把所有新手任务做完。对积分的设置也要拉开层次，不要所有任务的奖励都奖励相同的积分量值。站长也可以修改任务描述，用更友好、更具吸引力的语言来描述任务，提高用户对完成任务的兴趣。下面是一些建议：\r\n\r\n  任务一的任务名可以写“学习回帖” ，奖励10个金钱 。任务二的任务名写成“开始我的第一次”，奖励一种道具。 任务三的任务名写成“与众不同”，奖励一枚勋章。\r\n   站长应该根据自己站点用户群特征来决定开启哪些新手任务项目，例如用户群主要为上网时间不长，对发帖回帖操作尚不熟悉的用户，那么就开启学习回帖，发表主题等比较初级的任务。如果用户群为已经有一定上网经验，对论坛常规的发帖回帖操作已经比较熟悉，那么就可以只开启修改个人资料，修改头像等比较高级的任务。\r\n[color=#ff0000]备注： 文中的功能名以\"【功能名称】\" 形式标注 ，例如：【[/color][url=http://faq.comsenz.com/viewnews-853][color=#ff0000]新手任务[/color][/url][color=#ff0000]】 点击功能名称的链接，可以查看该功能的使用说明。[/color]', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('2', '2', '2', '1', 'admin', '1', 'Discuz! 7.2 新功能－－站长推荐 ', '1342582747', '\r\nDiscuz! 7.2 新增站长推荐功能，管理员可以设置一部分帖子为“站长推荐”，被设置为“站长推荐”的这些帖子就会在帖子内容页面右下角以浮动窗口的形式展示给浏览者，如果有多个主题被设置为“站长推荐”则随机轮流显示。\r\n站长推荐可以理解为一个全局主题推荐，管理员可以将一些版块重要信息，比如通知、公告等设置为站长推荐，以保证更多的用户可以浏览到，或者还可以在此加入广告帖进行赢利，一个功能多种用法，各位站长可以根据自身情况设置和使用。\r\n“站长推荐”在后台的设置位置为：Discuz! 7.2 后台 => 广告 => 站长推荐\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722051W2zR.gif[/img][p=30, 2, left]一、设置站长推荐[/p]\r\n可以在此设置站长推荐区域标题，默认为“站长推荐”，您可以设置为您希望的标题：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722052Ji2X.gif[/img][p=30, 2, left]二、添加站长推荐[/p]\r\n添加热点话题有三种方式：手动添加、添加主题、自动添加。[p=30, 2, left]1、手动添加[/p]\r\n上图界面中点击“添加”，在弹出的下拉框中我们点击“手动添加”：\r\n\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722053xvtI.gif[/img]\r\n\r\n\r\n\r\n输入“推荐链接地址”、“推荐标题”、“推荐内容”和“附加图片”，然后“提交”即可手动添加一条站长推荐。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722054Fae6.gif[/img]\r\n上图界面中点击“提交”则该帖子成功被设置为“站长推荐”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722055tNdh.gif[/img]\r\n返回前台进入帖子内容页在右下角就可以看到我们刚才设置的该站长推荐：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722056CKUJ.gif[/img]\r\n[b]2、添加主题[/b]\r\n后台“站长推荐”点击“添加”，在弹出的下拉框中我们点击“添加主题”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722057gPEE.gif[/img]\r\n输入帖子地址后点击“获取帖子内容”则可以获取到该帖子的标题和帖子内容摘要：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722058BY2H.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271722059Fwkt.gif[/img]\r\n提交即可成功添加该主题为站长推荐信息。\r\n[p=30, 2, left]3、自动添加[/p]\r\n后台“站长推荐”点击“添加”，在弹出的下拉框中我们点击“自动添加”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009092717220510PAXX.gif[/img]\r\n系统将自动推荐 10 个主题作为站长推荐候选，自动推荐的原则的获取站点所有版主的推荐主题，如果版主推荐主题不足 10 个则有几个自动推荐几个。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909081525058gOVO.gif[/img]\r\n管理员可以在此选择哪些推荐主题设置为站长推荐，选中推荐主题前面的多选框，“提交”即可。[p=30, 2, left]二、管理站长推荐[/p]\r\n所有被设置为站长推荐和曾经设置为站长推荐的主题都会在此显示，管理员可以在此设置一些主题为站长推荐也可以取消其站长推荐的身份，还可以编辑这些主题，或者将这些主题删除出站长推荐。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009092717220511ZOHp.gif[/img][p=30, 2, left]三、前台显示[/p]\r\n我们来看看站长推荐在前台的显示效果，打开随便一篇帖子内容页，在右下角我们可以看到一个浮动窗口，这个就是站长推荐的显示界面：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009092717220512QfsZ.gif[/img]\r\n在该浮动窗口中点击帖子标题、内容摘要，或者右下角的“查看”链接都可以进入该帖子内容页查看详情。\r\n看到这里相信大家已经清楚了该功能的实际用途和使用方法，那么，赶快体验吧！', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('3', '2', '3', '1', 'admin', '1', '论坛热点：在第一眼就留住用户 ', '1342582747', '\r\n让社区论坛在第一眼就留住用户，需要及时的把热点事件传递给用户，在第一时间把最受会员欢迎的主题资源展示出来，才能够最大限度的提高论坛的互动性，增加社区的黏着度。\r\nDiscuz! 7.2新增的论坛热点功能，能够很好的满足主题聚焦的应用需求。该功能可以将社区中最抢眼的主题合显示到论坛首页的头部，方便用户快速在论坛中浏览热点信息。论坛热点的设置和 Discuz! 的其它功能一操作非常简单，只需要以管理员身份到后台简单开启即可。\r\n\r\n我们截图来看一下开启后的效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909110951061nyw4.gif[/img]\r\n下面我们来说一下后台的开启方法：\r\n进入 Discuz! 7.2 后台 => 界面 => 界面设置 => 首页设置：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271530271hxkL.gif[/img]\r\n上图界面我们可以看到“论坛热点”开启选择，我们选择“是”来设置各项显示条件：\r\n[img]http://faq.comsenz.com/attachments/2009/10/9_2009101616230316I1M.gif[/img]\r\n论坛热点：是/否，设置是否显示全论坛的论坛热点主题。\r\n论坛热点显示数量：设置论坛热点条目数，默认值 10 条。\r\n论坛热点更新周期（秒）：设置论坛热点在多长时间更新一次，默认值 900 。\r\n论坛热点图片大小：设置首页论坛热点图片的大小，默认值 100*70 。\r\n论坛热点内容截取文字长度：设置论坛热点内容的文字长度，默认值 200 个字。\r\n如此设置后的效果如图开篇第一个图片所示，需要注意的是，这里设置的“论坛热点显示数量”为 10 仅指右侧不包含图片的热点主题，不包含左侧的带图片主题。\r\n论坛热点的显示结构为：\r\n左侧一列调用带图片的主题热度最高一条主题及其图片缩略图、主题内容摘要及其发布时间和作者；\r\n右侧调用主题热度最高的 10 条不带图片的主题，按照主题热度从高到低排序，前面 2 条显示主题标题、作者及其内容摘要，后面的 8 条之显示主题标题。\r\n到此论坛热点的开启和效果展示为大家讲解完毕了，怎么样，这个功能是不是很吸引你，还等什么，赶快安装最新版 Discuz! 7.2 或者将您的论坛升级到 Discuz! 7.2 来体验吧！', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('4', '2', '4', '1', 'admin', '1', 'Discuz! 7.2新特性－－主题热度/评价', '1342582747', '\r\nDiscuz!7.2 在对主题的操作上添加了新特性，即主题热度和主题评价。\r\n主题热度，用户可以对主题进行回复、评价等操作，这些操作都会增加主题热度，当主题达到一定得热度时，会显示热度图标；\r\n主题评价，用户可以对某主题评价，以表达自己的观点态度；当主题所得的评价指数达到后台设置的指数级别时，会显示评价图标；\r\n这两项新特性都大大提高了用户浏览的效率，更是增加了热度高或评价高主题的浏览次数。\r\n下面请看详细介绍：[p=30, 2, left][b]一、主题热度[/b][/p]\r\n主题热度是 Discuz!7.2 新增的特性，站长可以在后台设置主题热度值及热度增加权重值。当某个主题达到站点设置的热度时，会在主题列表页标题右侧显示热度图标，大大提高热度主题的浏览次数。\r\n1、后台设置\r\n论坛后台 => 全局 => 论坛功能 => 主题热度，如下图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271400321aEXX.gif[/img]\r\n回复增量权重：每次回复主题时，主题热度的增量，默认值为 5 。\r\n评价增量权重：每次对主题进行评价操作时，主题热度的增量，默认为 3 。\r\n热门主题显示级别：设置主题列表页主题热度的级别对应热度值。每个级别都有相应的热度图标，共有三个级别。级别热度值间用逗号分隔。留空为不显示热度图标。\r\n设置完毕后，点击“提交”按钮完成设置。\r\n设置完成后，到前台主题列表页刷新，达到热度值的主题前会显示主题热度图标：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909081603201rueN.gif][img=644,171]http://faq.comsenz.com/attachments/2009/09/15_200909081603201rueN.gif[/img][/url]\r\n2、根据主题热度来排序浏览\r\n用户可以根据主题热度来对主题列表排序浏览，打开主题列表页：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081603202zliR.gif[/img][p=30, 2, left][b]二、主题评价[/b][/p]\r\n主题评价是 Discuz!7.2 新增的特性，后台有是否开启该功能的开关，并且站长可以在后台设置评价图标显示级别。\r\n1、后台设置\r\n论坛后台 => 全局 => 论坛功能 => 主题评价，如下图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271400351aw5h.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271400371JFAt.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271400401hrE4.gif[/img]\r\n启用主题评价：选择“是”，打开主题评价功能。\r\n加分操作文字：设置评价加分项的表达文字，建议设置的简单明了，而且不宜过长；默认每评价一次加 1 个评价积分。\r\n减分操作文字：设置评价减分项的表达文字，建议设置的简单明了，而且不宜过长；默认每评价一次减 1 个评价积分。\r\n默认显示数值：设置在帖子内容页默认显示的评价结果数值，用户点击可切换。\r\n每 24 小时评价主体次数：设置用户每 24 小时可以评价多少篇主题，0 或留空为不限制。\r\n是否允许评价自己的帖子：设置是否允许评价自己的主题，评价自己的主题无积分奖励。\r\n评价图标显示级别：设置主题列表页评价图标每一级别对应的评价指数。建议为 3 个级别，每个级别的评价指数请用逗号分隔。\r\n设置好，点击“提交”完成设置。\r\n2、前台评价主题\r\n在前台浏览主题内容时，您会看到如下图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081605032M3vn.gif[/img]\r\n当主题的评价指数达到后台设置的指数级别时，在主题列表页将会显示对应级别的评价图标：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909081605033D2LF.gif][img=644,201]http://faq.comsenz.com/attachments/2009/09/15_200909081605033D2LF.gif[/img][/url]\r\n评价图标更直观地告诉该用户主题的评价，因此会大大增加评价高主题的浏览次数。\r\n至此，主题热度和主题评价已经说明完毕，赶紧去体验下吧！', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('5', '2', '5', '1', 'admin', '1', 'Discuz! 7.2 新特性－－推荐主题', '1342582747', 'D\r\nDiscuz!7.2 版本完善了推荐主题功能：推荐主题时可以修改主题标题、并有选择性地推荐主题中的图片等，用户体验有了很大的提高。\r\n下面请看详细介绍：[p=30, 2, left][b]一、后台开启推荐主题的权限[/b][/p]\r\n论坛后台 => 版块 => 版块管理 => 编辑，即可看到下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607261Sfhr.gif[/img]\r\n选择推荐主题的方式及其他设置：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607391e0B1.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607392ZKwm.gif[/img]\r\n设置好后，点击“提交”完成推荐主题的后台设置。[p=30, 2, left][b]二、前台推荐主题[/b][/p]\r\n有推荐权限的用户在前台可以推荐某个主题，如图：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909081607393hITH.gif][img=644,131]http://faq.comsenz.com/attachments/2009/09/15_200909081607393hITH.gif[/img][/url]\r\n推荐主题设置：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607394uMLw.gif[/img]\r\n被推荐的主题，可以在帖子列表页顶部看到：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081607395MQ0W.gif[/img]\r\n到此为止，推荐主题功能已经讲解完毕，赶紧去体验下吧！', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('6', '2', '6', '1', 'admin', '1', 'Discuz! 7.2 新特性－－新手任务', '1342582747', '\r\nDiscuz!7.2 在论坛任务方面有所改进，系统有针对性地自带了 7 个新手任务，无需站长添加。新注册用户将自动申请该任务，此功能可用于防止恶意注册及恶意灌水，或引导新手快速熟悉论坛。\r\n下面请看详细介绍：[p=30, 2, left][b]一、后台启用[/b][/p]\r\n系统自带的 7 个新手任务，在后台都有开关，您可以启用或关闭任务。\r\n论坛后台 => 扩展 => 论坛任务，如下图：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909081610241JZg0.gif][img=644,436]http://faq.comsenz.com/attachments/2009/09/15_200909081610241JZg0.gif[/img][/url]\r\n是否开启论坛任务：选择“是”开启论坛任务；如果选择“否”，那么下面的设置都是不起作用的。\r\n可用：勾选表示该任务可用，用户注册后会自动申请该任务。如果不勾选，表示不可用，用户注册后，不会看到该任务。[p=30, 2, left][b]二、编辑新手任务[/b][/p]\r\n您可以点击任务后的“编辑”来编辑该任务的一些信息，如图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081610341n8AY.gif[/img]\r\n编辑好点击“提交”完成编辑。[p=30, 2, left][b]三、新手前台执行任务[/b][/p]\r\n用户注册后，登录前台，即可看到新手任务的提示，如图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909081610343KZDL.gif[/img]\r\n新手每完成一个任务，就会得到相应的奖励。\r\n至此，新手任务已经讲解完毕，赶紧去体验下吧！', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('7', '2', '7', '1', 'admin', '1', '主题关注：让论坛帖子动起来', '1342582747', '\r\n用户在社区论坛中的核心应用是有效信息的获取。当用户在“逛”论坛的时候，发现了一个很感兴趣的话题往往需要一定的时间成本。如果用户翻到一个帖子，主题内容和里面的回复都很有意思，这时候用户肯定还想即时了解到帖子的发展情况。有了“主题关注”功能，可以很方便的实现主题信息的互动，只需要用户把这个值得关注的主题标记为关注状态，其他会员回复该主题时，用户就可以收到一个交互性的通知，只需要鼠标轻轻一点，就会看到所关注的主题中有哪些“志同道合”者的回复了。让论坛帖子内容互动起来，是不是会有不一样感觉呢？\r\n“主题关注”不仅是社区论坛功能细节上的实现，更是在尊重网络社区用户阅读习惯的基础之上的设计理念创新。用户盲无目的的去浏览帖子内容很容易形成阅读疲劳，“主题关注”可以轻松的把用户关心的主题信息主动的展示给用户，让用户的有效信息获取更加精准高效。\r\n下面介绍一下会员如何使用主题关注功能：[p=30, 2, left][b]一、关注主题[/b][/p]\r\n要将一个主题设为被关注状态有以下三种方法：\r\n1、发布新主题时\r\n在发表主题的时候，点击“发表话题”按钮右侧的“更多选项”，然后在“发帖选项”里选中“关注主题”的复选框\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_2009102816100010TeM.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281610002EHJ8.gif[/img]\r\n2、看贴时\r\n点击主题内容下方的 “收藏”图标，在弹出的窗口中点击“关注此主题的最新回复”\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281610003BVqH.gif[/img]\r\n[p=30, 2, left][b]二、查看被关注的主题[/b][/p]\r\n1、关注信息提示\r\n当您所关注的主题有新的回复时，您将在页面顶部看到如下提示，您可以通过点击通知里的关注提示查看被关注主题的最新回复\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281613191ND3i.gif[/img]\r\n2、在“个人中心”的“我的关注”中查看关注列表。\r\n在关注列表中，您可以选择查看正在关注的“有新回复的主题”或者“全部主题”\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281615301xugz.gif[/img]\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281618341SGvP.gif[/img][p=30, 2, left][b]三、取消关注主题[/b][/p]\r\n1、在编辑帖子或回复帖子时，在高级模式下勾选“取消对此主题新回复的关注”复选框，这样此主题将不再处于被关注状态\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281629011crqU.gif[/img]\r\n2、在二（2）的关注列表中选择需要取消关注的主题并点击“提交”按钮，如此操作将使得选中主题不再处于被关注状态\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281632171Yb4d.gif[/img]\r\n此外，站点的管理员除了可以和普通会员一样使用主题关注功能外，还可以在系统设置中对会员的主题关注列表容量进行控制，具体操作如下：\r\n系统设置 => 全局 => 用户权限 => 主题关注列表容量\r\n[img]http://faq.comsenz.com/attachments/2009/10/42_200910281635481Z6XD.gif[/img]', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('8', '2', '8', '1', 'admin', '1', 'Discuz! 7.2 新特性－－论坛动态', '1342582747', 'Discuz! 7.2 增加了论坛动态实时浏览功能，用户除了浏览原来的版块列表界面外还可以切换到“论坛动态”里面查看论坛实时动态，此功能类似于 SNS 的动态查看功能，可以集中查看到所有好友的动态信息，而无需进入好友个人主页查看。\r\n[img]http://faq.comsenz.com/attachments/2009/10/9_2009100915323019jA5.gif[/img]\r\n站长可以在 Discuz! 7.2 后台设置论坛首页的默认显示风格，进入 Discuz! 7.2 系统设置 => 界面 => 界面设置 => 首页设置 => 首页显示风格：\r\n[img]http://faq.comsenz.com/attachments/2009/10/9_200910091532302Z0N9.gif[/img]\r\n经典版块列表：即论坛版块列表展示模式，也就是老版本的 Discuz! 的展示效果。\r\n论坛实时动态：即 Discuz! 7.2 新增的动态实时查看功能，用户可以在此集中查看到所有好友的动态信息。\r\n如果站长希望站点所有用户登录 Discuz! 后看到是其好友的动态信息，那么在这里就可以选择首页的默认显示风格为“论坛实时动态”，效果如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/10/9_200910091532303yDV1.gif[/img]\r\n怎么样，是不是很方便？赶快安装全新的 Discuz! 7.2 或者升级您的论坛体验一下吧！', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('9', '2', '9', '1', 'admin', '1', 'Discuz! 7.2 新特性－－提醒系统', '1342582747', 'Discuz! 7.2 新增了提醒系统，提醒内容包括“全部”、“系统信息”、“好友信息”、“帖子信息”。上述这些信息主要有新信息则就会在导航的“提醒”那里出现新信息提示，如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118351ebXv.gif[/img]\r\n鼠标放到“提醒”上就可以看到收到的信息内容。\r\n点击“提醒”即可进入提醒系统界面：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118352Km5p.gif[/img]\r\n提醒系统首页是全部信息展示，分类浏览可以点击其他的信息类别进行浏览。\r\n系统信息：包括管理操作提醒、道具赠送提醒、任务提醒、积分提醒等。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118353g4uE.gif[/img]\r\n好友信息：添加好友的提醒。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118354wCOX.gif[/img]\r\n帖子信息：主题关注相关提醒。\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909291118355XZp5.gif[/img]\r\nDiscuz! 7.2 提醒系统更加细化了各个操作带来的信息提醒，一目了然的分类，使用和浏览信息更加清晰明确。', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('10', '2', '10', '1', 'admin', '1', '帖子编辑器：轻轻松松发帖', '1342582747', '帖子主题的展示是社区论坛的核心功能。会员在发表或回复帖子时，用到的就多就是编辑器功能，很多站长苦恼于会员发帖时排版很乱而无法解决。一款专业编辑器不仅需发有人性化的界面，更需要能够帮助用户更好的对帖子内容进行编辑，让社区论坛主题的排版更加专业和多样化。\r\n分析会员的使用习惯，Discuz! 7.2 的编辑器有了很大的改进，界面更友好，突出显示常用操作图标，并且新增了很多功能。\r\n新增删除线和分割线标签，让您的帖子格式更加丰富多彩；插入图片可以设置宽高；音乐播放支持 mp3 wma ra rm ram midwav 等多种格式；视频播放支持 wmv rm rmvb flv swf avi asf mpg mpeg mov等多种格式；视频可以自动分析优酷、土豆、ku6三大主流视频网站的视频网址；附件上传、修改、删除等操作整合到编辑器中；附件上传机制改进，同时上传多个附件时如果有上传失败的，不影响已经成功上传的。\r\nDiscuz! 7.2 前台 => 发帖，即可进入全新的 Discuz! 7.2 编辑器：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271441261E3fW.gif[/img]\r\n从上图界面可以看出，Discuz! 7.2 的编辑器有了很大的改观，突出显示目前社区比较常用的表情、图片、音乐、视频、Flash、代码、引用，界面更加友好。\r\n下面介绍几个新增功能：[p=30, 2, left][b]1、新增删除线和分割线标签[/b][/p]\r\n新增删除线和分割线标签，让您的帖子格式更加丰富多彩。\r\n如下图所示我们为“节省天光”几个字添加“删除线”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909071737197EwOi.gif[/img]\r\n设置后的效果如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909071737198xEI5.gif[/img]\r\n同理添加分割线：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909071737199TrYW.gif[/img]\r\n添加后的效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371910v6WE.gif[/img][p=30, 2, left][b]2、插入图片可以设置宽高[/b][/p]\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371911dvfs.gif[/img][p=30, 2, left][b]3、音乐播放支持 mp3 wma ra rm ram mid wav 等多种格式[/b][/p]\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371912wMUt.gif[/img]\r\n插入的音乐代码类似：\r\n[audio]http://vfile.home.news.cn/music/public/vd06/200908/18/50/MUfs06200908181354375150fd99.mp3[/audio]\r\n播放效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371913aJ2z.gif[/img][p=30, 2, left][b]4、视频功能更强大[/b][/p]\r\n视频播放支持 wmv rm rmvb flv swf avi asf mpg mpeg mov 等多种格式\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371914Ad5B.gif[/img]\r\n插入的视频代码类似：\r\n[media=wmv,400,300]http://w4180.s11.mydiscuz.com/Alizee_lais la bonita.wmv[/media]\r\n发布后的效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371915G371.gif[/img]\r\n视频还可以自动分析优酷、土豆、ku6 三大主流视频网站的视频网址：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371916vS5U.gif[/img]\r\n插入的视频代码类似：\r\n[media=swf,400,300]http://player.youku.com/player.php/sid/XMTA3OTE4NjIw/v.swf[/media]\r\n发布后的效果：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_20090907173719177BxG.gif[/img][p=30, 2, left][b]5、编辑器里上传附件[/b][/p]\r\n附件上传、修改、删除等操作整合到编辑器中；附件上传机制改进，同时上传多个附件时如果有上传失败的，不影响已经成功上传的。\r\n批量上传：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_20090907173719182BAP.gif[/img]\r\n普通上传：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371919zovp.gif[/img]\r\n附件列表：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_2009090717371920TWNz.gif[/img]\r\n到此 Discuz! 7.2 最新编辑器介绍完了，怎么样？是不是超酷炫！而且使用起来更加得心应手，那么还等什么，赶快体验吧！\r\n\r\n论坛运营秘籍 - Discuz!7.2 新功能的妙用：[url=http://faq.comsenz.com/viewnews-869]http://faq.comsenz.com/viewnews-869[/url]\r\n[p=30, 2, left][img]http://faq.comsenz.com/attachments/2009/09/9_200909071737196ENcW.gif[/img][/p]', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('11', '2', '11', '1', 'admin', '1', '转发视频：更易更强大', '1342582747', 'Discuz! 7.2 在视频播放方面有了很大改进，不但支持播放 wmv rm rmvb flv swf avi asf mpgmpeg mov 等多种格式，还可以自动分析优酷、土豆、ku6三大主流视频网站的视频网址，而不需要再去找专门的转发引用地址，使得转发视频变得更容易更强大，下面为大家举例演示这三大主流视频网站的视频转发功能。\r\nDiscuz! 7.2 前台 => 发帖，即可进入全新 Discuz! 7.2 编辑器：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909271441261E3fW.gif[/img]\r\n下面我们从优酷、土豆、ku6 三大主流视频网站分别找一个视频地址：\r\n优酷：[url=http://v.youku.com/v_show/id_XOTMwODQ2NjQ=.html]http://v.youku.com/v_show/id_XOTMwODQ2NjQ=.html[/url]\r\n土豆：[url=http://www.tudou.com/programs/view/4NgBn7J39bg/]http://www.tudou.com/programs/view/4NgBn7J39bg/[/url]\r\nku6 ：[url=http://v.ku6.com/show/VrLuttrXQb1CIbkC.html]http://v.ku6.com/show/VrLuttrXQb1CIbkC.html[/url]\r\n将上面三个地址分别插入视频，如图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909111355583f0Ft.gif[/img]\r\n插入后的代码如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909111355584BDQP.gif[/img]\r\n提交发布后的效果如下图所示：\r\n[img]http://faq.comsenz.com/attachments/2009/09/9_200909111355585XszF.gif[/img]\r\n从上面的演示可以看出来，Discuz! 7.2 发布优酷、土豆、ku6 三大主流视频网站的视频变得非常容易，无需再费力找论坛引用地址，直接输入视频的网址系统就会自动解析获取最终的播放地址，还等什么，快快来亲身体验一把吧！', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('12', '2', '12', '1', 'admin', '1', 'Discuz!7.2 新特性－－Manyou应用的开启', '1342582747', '\r\nDiscuz!7.2 较之前的版本，在后台添加了 Manyou 应用的开关。做为插件的形式，站长可以在后台开启或关闭该功能。开启该功能后，会员在论坛也可以看到 Manyou 应用的动态信息及大家都在玩什么应用游戏，同时还可以参与进来。\r\n下面请看详细介绍：\r\n[b]一、安装 Manyou 插件并开启[/b]\r\n\r\n论坛后台 => 插件 => 论坛插件，如图：\r\n\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909271430221otXN.gif][img=644,233]http://faq.comsenz.com/attachments/2009/09/15_200909271430221otXN.gif[/img][/url]\r\n安装后，请启用该插件，如图：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909271432211ofuE.gif[/img][p=30, 2, left][b]二、开启 Manyou 应用[/b][/p]\r\n论坛后台 => 插件 => Manyou：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753151btyX.gif][img=644,440]http://faq.comsenz.com/attachments/2009/09/15_200909101753151btyX.gif[/img][/url]\r\n点击“设置”：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_2009091017533510KUl.gif][img]http://faq.comsenz.com/attachments/2009/09/15_2009091017533510KUl.gif[/img][/url]\r\n点击“MYOP 应用管理”：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_20090910175335228pj.gif][img=644,228]http://faq.comsenz.com/attachments/2009/09/15_20090910175335228pj.gif[/img][/url]\r\n点击“启用服务”：\r\n[img]http://faq.comsenz.com/attachments/2009/09/15_200909101753353h7yn.gif[/img]\r\n为站点开启具体的应用或游戏：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753354uW1y.gif][img=644,474]http://faq.comsenz.com/attachments/2009/09/15_200909101753354uW1y.gif[/img][/url]\r\n设为默认应用：无论用户是否添加此应用，默认应用都会显示在所有用户的开始菜单里面。\r\n关闭应用：用户不能添加处于关闭状态的应用，应用目录中也不会显示处于关闭状态的应用。\r\n设为推荐应用：被设置为推荐的应用将显示在您网站应用目录的推荐栏目下。\r\n为使大家能在论坛首页看到推荐的应用并方便地参与进来，请设置首页应用推荐条目数：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753355rwqi.gif][img]http://faq.comsenz.com/attachments/2009/09/15_200909101753355rwqi.gif[/img][/url][p=30, 2, left][b]三、前台查看[/b][/p]\r\n1、前台查看 Manyou 动态\r\n打开论坛首页，可以看到下图所示：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_2009091017533561U7q.gif][img=644,244]http://faq.comsenz.com/attachments/2009/09/15_2009091017533561U7q.gif[/img][/url]\r\n点击“应用动态”，即可查看 Manyou 应用的相关动态：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753357KO05.gif][img]http://faq.comsenz.com/attachments/2009/09/15_200909101753357KO05.gif[/img][/url]\r\n点击“论坛版块”，可以在论坛首页下方看到推荐的 Manyou 应用：\r\n[url=http://faq.comsenz.com/attachments/2009/09/15_200909101753358q9hK.gif][img=644,317]http://faq.comsenz.com/attachments/2009/09/15_200909101753358q9hK.gif[/img][/url]\r\n到此，Manyou 应用功能已经讲解完毕，赶紧去体验一下吧！', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('13', '2', '13', '1', 'admin', '1', '7.2新增功能及功能强化', '1342582747', '[p=30, 2, left][b]功能新增：[/b][/p]\r\n[p=16, 0, left]=================================================================[/p]\r\n[p=16, 0, left]活动导出[/p]\r\n[p=16, 0, left]增加附件的动态链接(attach://aid.ext)，便于各方面引用[/p]\r\n[p=16, 0, left]主题鉴定[/p]\r\n[p=16, 0, left]抢楼贴[/p]\r\n[p=16, 0, left]不受审核限制的 IP 列表[/p]\r\n[p=16, 0, left]版块名称颜色[/p]\r\n[p=16, 0, left]倒序帖--倒序显示回复[/p]\r\n[p=16, 0, left]把主题在任意版块中置顶[/p]\r\n\r\n[p=30, 2, left][b]增强优化:[/b][/p]\r\n[p=16, 0, left]=================================================================[/p]\r\n[p=16, 0, left]管理员不受任何搜索限制[/p]\r\n[p=16, 0, left]权限表达式增强，增加注册 IP、注册时间、用户定制栏目的公式项目，可自定义权限表达式提示文字，增加可访问用户列表[/p]\r\n[p=16, 0, left]数据调用增加主题评价的排序[/p]\r\n[p=16, 0, left]管理中心用户管理增加马甲查找功能[/p]\r\n[p=16, 0, left]回收站增加主题列表功能[/p]\r\n[p=16, 0, left]买卖主题增加日志记录查看[/p]\r\n[p=16, 0, left]个人资料页可自由查看他人的帖子[/p]\r\n[p=16, 0, left]评分记录显示方式改进[/p]\r\n[p=16, 0, left]主题列表分割带[/p]\r\n[p=16, 0, left]分类信息加强[/p]\r\n[p=16, 0, left]前台权限细化[/p]\r\n[p=16, 0, left]搜索页高级搜索显示调整[/p]\r\n[p=16, 0, left]添加新用户组时深度继承所选参照组权限[/p]\r\n[p=16, 0, left]版主可以管理特殊用户组的用户[/p]', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('14', '2', '14', '1', 'admin', '1', 'zqhxuyuan的测试', '1342583268', '测试', '127.0.0.1', '0', '0', '0', '0', '-1', '-1', '0', '0', '0', '0', '0');
INSERT INTO `cdb_posts` VALUES ('15', '2', '14', '0', 'admin', '1', '', '1342583277', '测试啊', '127.0.0.1', '0', '0', '0', '0', '-1', '-1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `cdb_profilefields`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_profilefields`;
CREATE TABLE `cdb_profilefields` (
  `fieldid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `size` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `unchangeable` tinyint(1) NOT NULL DEFAULT '0',
  `showinthread` tinyint(1) NOT NULL DEFAULT '0',
  `selective` tinyint(1) NOT NULL DEFAULT '0',
  `choices` text NOT NULL,
  PRIMARY KEY (`fieldid`),
  KEY `available` (`available`,`required`,`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_profilefields
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_projects`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_projects`;
CREATE TABLE `cdb_projects` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_projects
-- ----------------------------
INSERT INTO `cdb_projects` VALUES ('1', '技术性论坛', 'extcredit', '如果您不希望会员通过灌水、页面访问等方式得到积分，而是需要发布一些技术性的帖子获得积分。', 'a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:49:\"posts*0.5+digestposts*5+extcredits1*2+extcredits2\";s:13:\"creditspolicy\";s:299:\"a:12:{s:4:\"post\";a:0:{}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:10;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1444:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}');
INSERT INTO `cdb_projects` VALUES ('2', '娱乐性论坛', 'extcredit', '此类型论坛的会员可以通过发布一些评论、回复等获得积分，同时扩大论坛的访问量。更重要的是希望会员发布一些有价值的娱乐新闻等。', 'a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:81:\"posts+digestposts*5+oltime*5+pageviews/1000+extcredits1*2+extcredits2+extcredits3\";s:13:\"creditspolicy\";s:315:\"a:12:{s:4:\"post\";a:1:{i:1;i:1;}s:5:\"reply\";a:1:{i:2;i:1;}s:6:\"digest\";a:1:{i:1;i:10;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1036:\"a:8:{i:1;a:6:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:2;a:6:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:3;a:6:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:4;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:5;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:6;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:7;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}i:8;a:6:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;}}\";}');
INSERT INTO `cdb_projects` VALUES ('3', '动漫、摄影类论坛', 'extcredit', '此类型论坛需要更多的图片附件发布给广大会员，因此增加一项扩展积分：魅力。', 'a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:86:\"posts+digestposts*2+pageviews/2000+extcredits1*2+extcredits2+extcredits3+extcredits4*3\";s:13:\"creditspolicy\";s:324:\"a:12:{s:4:\"post\";a:1:{i:2;i:1;}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:10;}s:10:\"postattach\";a:1:{i:4;i:3;}s:9:\"getattach\";a:1:{i:2;i:-2;}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1454:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:4:\"魅力\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}');
INSERT INTO `cdb_projects` VALUES ('4', '文章、小说类论坛', 'extcredit', '此类型的论坛更重视会员的原创文章或者是转发的文章，因此增加一项扩展积分：文采。', 'a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:57:\"posts+digestposts*8+extcredits2+extcredits3+extcredits4*2\";s:13:\"creditspolicy\";s:307:\"a:12:{s:4:\"post\";a:1:{i:2;i:1;}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:4;i:10;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1454:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:4:\"文采\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}');
INSERT INTO `cdb_projects` VALUES ('5', '调研性论坛', 'extcredit', '此类型论坛更期望的是得到会员的建议和意见，主要是通过投票的方式体现会员的建议，因此增加一项积分策略为：参加投票，增加一项扩展积分为：积极性。', 'a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:63:\"posts*0.5+digestposts*2+extcredits1*2+extcredits3+extcredits4*2\";s:13:\"creditspolicy\";s:306:\"a:12:{s:4:\"post\";a:0:{}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:8;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:1:{i:4;i:5;}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1456:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:6:\"积极性\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}');
INSERT INTO `cdb_projects` VALUES ('6', '贸易性论坛', 'extcredit', '此类型论坛更注重的是会员之间的交易，因此使用积分策略：交易成功，增加一项扩展积分：诚信度。', 'a:4:{s:10:\"savemethod\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:14:\"creditsformula\";s:55:\"posts+digestposts+extcredits1*2+extcredits3+extcredits4\";s:13:\"creditspolicy\";s:306:\"a:12:{s:4:\"post\";a:0:{}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:5;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:2:\"pm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:1:{i:3;i:2;}s:18:\"promotion_register\";a:1:{i:3;i:2;}s:13:\"tradefinished\";a:1:{i:4;i:6;}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}\";s:10:\"extcredits\";s:1456:\"a:8:{i:1;a:8:{s:5:\"title\";s:4:\"威望\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:2;a:8:{s:5:\"title\";s:4:\"金钱\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:3;a:8:{s:5:\"title\";s:4:\"贡献\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:4;a:8:{s:5:\"title\";s:6:\"诚信度\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";s:1:\"1\";s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:5;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:6;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:7;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}i:8;a:8:{s:5:\"title\";s:0:\"\";s:4:\"unit\";s:0:\"\";s:5:\"ratio\";i:0;s:9:\"available\";N;s:10:\"lowerlimit\";i:0;s:12:\"showinthread\";N;s:15:\"allowexchangein\";N;s:16:\"allowexchangeout\";N;}}\";}');
INSERT INTO `cdb_projects` VALUES ('7', '坛内事务类版块', 'forum', '该板块设置了不允许其他模块共享，以及设置了需要很高的权限才能浏览该版块。也适合于保密性高版块。', 'a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"0\";s:16:\"allowpostspecial\";s:1:\"0\";s:14:\"alloweditrules\";s:1:\"1\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"0\";s:6:\"jammer\";s:1:\"0\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"0\";s:9:\"autoclose\";s:1:\"0\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:2:\"40\";s:16:\"allowpaytoauthor\";s:1:\"0\";s:13:\"alloweditpost\";s:1:\"1\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:7:\"	1	2	3	\";s:8:\"postperm\";s:7:\"	1	2	3	\";s:9:\"replyperm\";s:7:\"	1	2	3	\";s:13:\"getattachperm\";s:7:\"	1	2	3	\";s:14:\"postattachperm\";s:7:\"	1	2	3	\";s:16:\"supe_pushsetting\";s:0:\"\";}');
INSERT INTO `cdb_projects` VALUES ('8', '技术交流类版块', 'forum', '该设置开启了主题缓存系数。其他的权限设置级别较低。', 'a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"1\";s:16:\"allowpostspecial\";s:1:\"5\";s:14:\"alloweditrules\";s:1:\"0\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"0\";s:6:\"jammer\";s:1:\"0\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"0\";s:9:\"autoclose\";s:1:\"0\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:2:\"40\";s:16:\"allowpaytoauthor\";s:1:\"1\";s:13:\"alloweditpost\";s:1:\"1\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:0:\"\";s:8:\"postperm\";s:0:\"\";s:9:\"replyperm\";s:0:\"\";s:13:\"getattachperm\";s:0:\"\";s:14:\"postattachperm\";s:0:\"\";s:16:\"supe_pushsetting\";s:0:\"\";}');
INSERT INTO `cdb_projects` VALUES ('9', '发布公告类版块', 'forum', '该设置开启了发帖审核，限制了允许发帖的用户组。', 'a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"1\";s:16:\"allowpostspecial\";s:1:\"1\";s:14:\"alloweditrules\";s:1:\"0\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"1\";s:6:\"jammer\";s:1:\"1\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"0\";s:9:\"autoclose\";s:1:\"0\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:1:\"0\";s:16:\"allowpaytoauthor\";s:1:\"1\";s:13:\"alloweditpost\";s:1:\"0\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:0:\"\";s:8:\"postperm\";s:7:\"	1	2	3	\";s:9:\"replyperm\";s:0:\"\";s:13:\"getattachperm\";s:0:\"\";s:14:\"postattachperm\";s:0:\"\";s:16:\"supe_pushsetting\";s:0:\"\";}');
INSERT INTO `cdb_projects` VALUES ('10', '发起活动类版块', 'forum', '该类型设置里发起主题一个月之后会自动关闭主题。', 'a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"1\";s:16:\"allowpostspecial\";s:1:\"9\";s:14:\"alloweditrules\";s:1:\"0\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"0\";s:6:\"jammer\";s:1:\"0\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"1\";s:9:\"autoclose\";s:2:\"30\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:2:\"40\";s:16:\"allowpaytoauthor\";s:1:\"1\";s:13:\"alloweditpost\";s:1:\"0\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:0:\"\";s:8:\"postperm\";s:22:\"	1	2	3	11	12	13	14	15	\";s:9:\"replyperm\";s:0:\"\";s:13:\"getattachperm\";s:0:\"\";s:14:\"postattachperm\";s:0:\"\";s:16:\"supe_pushsetting\";s:0:\"\";}');
INSERT INTO `cdb_projects` VALUES ('11', '娱乐灌水类版块', 'forum', '该设置了主题缓存系数，开启了所有的特殊主题按钮。', 'a:33:{s:7:\"styleid\";s:1:\"0\";s:12:\"allowsmilies\";s:1:\"1\";s:9:\"allowhtml\";s:1:\"0\";s:11:\"allowbbcode\";s:1:\"1\";s:12:\"allowimgcode\";s:1:\"1\";s:14:\"allowanonymous\";s:1:\"0\";s:10:\"allowshare\";s:1:\"1\";s:16:\"allowpostspecial\";s:2:\"15\";s:14:\"alloweditrules\";s:1:\"0\";s:10:\"recyclebin\";s:1:\"1\";s:11:\"modnewposts\";s:1:\"0\";s:6:\"jammer\";s:1:\"0\";s:16:\"disablewatermark\";s:1:\"0\";s:12:\"inheritedmod\";s:1:\"0\";s:9:\"autoclose\";s:1:\"0\";s:12:\"forumcolumns\";s:1:\"0\";s:12:\"threadcaches\";s:2:\"40\";s:16:\"allowpaytoauthor\";s:1:\"1\";s:13:\"alloweditpost\";s:1:\"1\";s:6:\"simple\";s:1:\"0\";s:11:\"postcredits\";s:0:\"\";s:12:\"replycredits\";s:0:\"\";s:16:\"getattachcredits\";s:0:\"\";s:17:\"postattachcredits\";s:0:\"\";s:13:\"digestcredits\";s:0:\"\";s:16:\"attachextensions\";s:0:\"\";s:11:\"threadtypes\";s:0:\"\";s:8:\"viewperm\";s:0:\"\";s:8:\"postperm\";s:0:\"\";s:9:\"replyperm\";s:0:\"\";s:13:\"getattachperm\";s:0:\"\";s:14:\"postattachperm\";s:0:\"\";s:16:\"supe_pushsetting\";s:0:\"\";}');

-- ----------------------------
-- Table structure for `cdb_promotions`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_promotions`;
CREATE TABLE `cdb_promotions` (
  `ip` char(15) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_promotions
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_prompt`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_prompt`;
CREATE TABLE `cdb_prompt` (
  `uid` mediumint(8) unsigned NOT NULL,
  `typeid` smallint(6) unsigned NOT NULL,
  `number` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`uid`,`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_prompt
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_promptmsgs`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_promptmsgs`;
CREATE TABLE `cdb_promptmsgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extraid` int(10) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `actor` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`typeid`),
  KEY `new` (`new`),
  KEY `dateline` (`dateline`),
  KEY `extraid` (`extraid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_promptmsgs
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_prompttype`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_prompttype`;
CREATE TABLE `cdb_prompttype` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `script` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_prompttype
-- ----------------------------
INSERT INTO `cdb_prompttype` VALUES ('1', 'pm', '私人消息', 'pm.php?filter=newpm');
INSERT INTO `cdb_prompttype` VALUES ('2', 'announcepm', '公共消息', 'pm.php?filter=announcepm');
INSERT INTO `cdb_prompttype` VALUES ('3', 'task', '论坛任务', 'task.php?item=doing');
INSERT INTO `cdb_prompttype` VALUES ('4', 'systempm', '系统消息', '');
INSERT INTO `cdb_prompttype` VALUES ('5', 'friend', '好友消息', '');
INSERT INTO `cdb_prompttype` VALUES ('6', 'threads', '帖子消息', '');

-- ----------------------------
-- Table structure for `cdb_ranks`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_ranks`;
CREATE TABLE `cdb_ranks` (
  `rankid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `ranktitle` varchar(30) NOT NULL DEFAULT '',
  `postshigher` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `stars` tinyint(3) NOT NULL DEFAULT '0',
  `color` varchar(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`rankid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_ranks
-- ----------------------------
INSERT INTO `cdb_ranks` VALUES ('1', '新生入学', '0', '1', '');
INSERT INTO `cdb_ranks` VALUES ('2', '小试牛刀', '50', '2', '');
INSERT INTO `cdb_ranks` VALUES ('3', '实习记者', '300', '5', '');
INSERT INTO `cdb_ranks` VALUES ('4', '自由撰稿人', '1000', '4', '');
INSERT INTO `cdb_ranks` VALUES ('5', '特聘作家', '3000', '5', '');

-- ----------------------------
-- Table structure for `cdb_ratelog`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_ratelog`;
CREATE TABLE `cdb_ratelog` (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `extcredits` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `score` smallint(6) NOT NULL DEFAULT '0',
  `reason` char(40) NOT NULL DEFAULT '',
  KEY `pid` (`pid`,`dateline`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_ratelog
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_regips`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_regips`;
CREATE TABLE `cdb_regips` (
  `ip` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `count` smallint(6) NOT NULL DEFAULT '0',
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_regips
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_relatedthreads`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_relatedthreads`;
CREATE TABLE `cdb_relatedthreads` (
  `tid` mediumint(8) NOT NULL DEFAULT '0',
  `type` enum('general','trade') NOT NULL DEFAULT 'general',
  `expiration` int(10) NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `relatedthreads` text NOT NULL,
  PRIMARY KEY (`tid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_relatedthreads
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_reportlog`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_reportlog`;
CREATE TABLE `cdb_reportlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(6) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL,
  `username` char(15) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) NOT NULL,
  `reason` char(40) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`,`uid`),
  KEY `dateline` (`fid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_reportlog
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_request`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_request`;
CREATE TABLE `cdb_request` (
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `type` tinyint(1) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_request
-- ----------------------------
INSERT INTO `cdb_request` VALUES ('边栏模块_版块树形列表', 'a:4:{s:3:\"url\";s:83:\"function=module&module=forumtree.inc.php&settings=N%3B&jscharset=0&cachelife=864000\";s:9:\"parameter\";a:3:{s:6:\"module\";s:17:\"forumtree.inc.php\";s:9:\"cachelife\";s:6:\"864000\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏版块树形列表模块\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_版主排行', 'a:4:{s:3:\"url\";s:79:\"function=module&module=modlist.inc.php&settings=N%3B&jscharset=0&cachelife=3600\";s:9:\"parameter\";a:3:{s:6:\"module\";s:15:\"modlist.inc.php\";s:9:\"cachelife\";s:4:\"3600\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏版主排行模块\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('聚合模块_版块列表', 'a:4:{s:3:\"url\";s:382:\"function=module&module=rowcombine.inc.php&settings=a%3A1%3A%7Bs%3A4%3A%22data%22%3Bs%3A84%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%2C%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%A0%91%E5%BD%A2%E5%88%97%E8%A1%A8%2C%E7%89%88%E5%9D%97%E5%88%97%E8%A1%A8%22%3B%7D&jscharset=0&cachelife=864000&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:18:\"rowcombine.inc.php\";s:9:\"cachelife\";s:6:\"864000\";s:8:\"settings\";a:1:{s:4:\"data\";s:84:\"边栏模块_版块排行,版块排行\r\n边栏模块_版块树形列表,版块列表\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:39:\"热门版块、版块树形聚合模块\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_版块排行', 'a:4:{s:3:\"url\";s:482:\"function=forums&startrow=0&items=0&newwindow=1&orderby=posts&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%3Cimg%20style%3D%5C%22vertical-align%3Amiddle%5C%22%20src%3D%5C%22images%2Fdefault%2Ftree_file.gif%5C%22%20%2F%3E%20%7Bforumname%7D%28%7Bposts%7D%29%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:7:{s:10:\"jstemplate\";s:211:\"<div class=\\\"sidebox\\\">\r\n<h4>版块排行</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li><img style=\\\"vertical-align:middle\\\" src=\\\"images/default/tree_file.gif\\\" /> {forumname}({posts})</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:5:\"posts\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏版块排行模块\";s:4:\"type\";s:1:\"1\";}', '1', '0');
INSERT INTO `cdb_request` VALUES ('聚合模块_热门主题', 'a:4:{s:3:\"url\";s:533:\"function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%22%3Bs%3A4%3A%22data%22%3Bs%3A112%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E4%BB%8A%E6%97%A5%2C%E6%97%A5%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E5%91%A8%2C%E5%91%A8%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E6%9C%88%2C%E6%9C%88%22%3B%7D&jscharset=0&cachelife=1800&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:18:\"rowcombine.inc.php\";s:9:\"cachelife\";s:4:\"1800\";s:8:\"settings\";a:2:{s:5:\"title\";s:12:\"热门主题\";s:4:\"data\";s:112:\"边栏模块_热门主题_今日,日\r\n边栏模块_热门主题_本周,周\r\n边栏模块_热门主题_本月,月\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:48:\"今日、本周、本月热门主题聚合模块\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_热门主题_本月', 'a:4:{s:3:\"url\";s:556:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=720&jscharset=0&cachelife=86400&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E6%9C%88%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>本月热门</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:5:\"86400\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:9:\"hourviews\";s:5:\"hours\";s:3:\"720\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏本月热门主题模块\";s:4:\"type\";s:1:\"0\";}', '0', '0');
INSERT INTO `cdb_request` VALUES ('聚合模块_会员排行', 'a:4:{s:3:\"url\";s:533:\"function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C%22%3Bs%3A4%3A%22data%22%3Bs%3A112%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E4%BB%8A%E6%97%A5%2C%E6%97%A5%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E6%9C%AC%E5%91%A8%2C%E5%91%A8%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E4%BC%9A%E5%91%98%E6%8E%92%E8%A1%8C_%E6%9C%AC%E6%9C%88%2C%E6%9C%88%22%3B%7D&jscharset=0&cachelife=3600&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:18:\"rowcombine.inc.php\";s:9:\"cachelife\";s:4:\"3600\";s:8:\"settings\";a:2:{s:5:\"title\";s:12:\"会员排行\";s:4:\"data\";s:112:\"边栏模块_会员排行_今日,日\r\n边栏模块_会员排行_本周,周\r\n边栏模块_会员排行_本月,月\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:48:\"今日、本周、本月会员排行聚合模块\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_推荐主题', 'a:4:{s:3:\"url\";s:553:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=1&newwindow=1&threadtype=0&highlight=0&orderby=lastpost&hours=48&jscharset=0&cachelife=3600&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%8E%A8%E8%8D%90%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>推荐主题</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:4:\"3600\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"1\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"lastpost\";s:5:\"hours\";s:2:\"48\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏推荐主题模块\";s:4:\"type\";s:1:\"0\";}', '0', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_最新图片', 'a:4:{s:3:\"url\";s:1385:\"function=images&sidestatus=0&isimage=1&threadmethod=1&maxwidth=140&maxheight=140&startrow=0&items=5&orderby=dateline&hours=0&digest=0&newwindow=1&jscharset=0&jstemplate=%3Cdiv%20%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%BE%E7%89%87%3C%2Fh4%3E%0D%0A%3Cscript%20type%3D%5C%22text%2Fjavascript%5C%22%3E%0D%0Avar%20slideSpeed%20%3D%202500%3B%0D%0Avar%20slideImgsize%20%3D%20%5B140%2C140%5D%3B%0D%0Avar%20slideTextBar%20%3D%200%3B%0D%0Avar%20slideBorderColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0Avar%20slideBgColor%20%3D%20%5C%27%23FFF%5C%27%3B%0D%0Avar%20slideImgs%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgLinks%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgTexts%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideSwitchBar%20%3D%201%3B%0D%0Avar%20slideSwitchColor%20%3D%20%5C%27black%5C%27%3B%0D%0Avar%20slideSwitchbgColor%20%3D%20%5C%27white%5C%27%3B%0D%0Avar%20slideSwitchHiColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0A%5Bnode%5D%0D%0AslideImgs%5B%7Border%7D%5D%20%3D%20%5C%22%7Bimgfile%7D%5C%22%3B%0D%0AslideImgLinks%5B%7Border%7D%5D%20%3D%20%5C%22%7Blink%7D%5C%22%3B%0D%0AslideImgTexts%5B%7Border%7D%5D%20%3D%20%5C%22%7Bsubject%7D%5C%22%3B%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fscript%3E%0D%0A%3Cscript%20language%3D%5C%22javascript%5C%22%20type%3D%5C%22text%2Fjavascript%5C%22%20src%3D%5C%22include%2Fjs%2Fslide.js%5C%22%3E%3C%2Fscript%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:13:{s:10:\"jstemplate\";s:709:\"<div  class=\\\"sidebox\\\">\r\n<h4>最新图片</h4>\r\n<script type=\\\"text/javascript\\\">\r\nvar slideSpeed = 2500;\r\nvar slideImgsize = [140,140];\r\nvar slideTextBar = 0;\r\nvar slideBorderColor = \\\'#C8DCEC\\\';\r\nvar slideBgColor = \\\'#FFF\\\';\r\nvar slideImgs = new Array();\r\nvar slideImgLinks = new Array();\r\nvar slideImgTexts = new Array();\r\nvar slideSwitchBar = 1;\r\nvar slideSwitchColor = \\\'black\\\';\r\nvar slideSwitchbgColor = \\\'white\\\';\r\nvar slideSwitchHiColor = \\\'#C8DCEC\\\';\r\n[node]\r\nslideImgs[{order}] = \\\"{imgfile}\\\";\r\nslideImgLinks[{order}] = \\\"{link}\\\";\r\nslideImgTexts[{order}] = \\\"{subject}\\\";\r\n[/node]\r\n</script>\r\n<script language=\\\"javascript\\\" type=\\\"text/javascript\\\" src=\\\"include/js/slide.js\\\"></script>\r\n</div>\";s:9:\"cachelife\";s:0:\"\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:7:\"isimage\";s:1:\"1\";s:8:\"maxwidth\";s:3:\"140\";s:9:\"maxheight\";s:3:\"140\";s:12:\"threadmethod\";s:1:\"1\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"dateline\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏最新图片展示模块\";s:4:\"type\";s:1:\"4\";}', '4', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_最新主题', 'a:4:{s:3:\"url\";s:537:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=dateline&hours=0&jscharset=0&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>最新主题</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:0:\"\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"dateline\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏最新主题模块\";s:4:\"type\";s:1:\"0\";}', '0', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_活跃会员', 'a:4:{s:3:\"url\";s:381:\"function=memberrank&startrow=0&items=12&newwindow=1&extcredit=1&orderby=posts&hours=0&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%B4%BB%E8%B7%83%E4%BC%9A%E5%91%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22avt_list%20s_clear%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bavatarsmall%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>活跃会员</h4>\r\n<ul class=\\\"avt_list s_clear\\\">\r\n[node]<li>{avatarsmall}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:2:\"12\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:5:\"posts\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏活跃会员模块\";s:4:\"type\";s:1:\"2\";}', '2', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_热门主题_本版', 'a:4:{s:3:\"url\";s:569:\"function=threads&sidestatus=1&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=replies&hours=0&jscharset=0&cachelife=1800&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E7%89%88%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:137:\"<div class=\\\"sidebox\\\">\r\n<h4>本版热门主题</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:4:\"1800\";s:10:\"sidestatus\";s:1:\"1\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:7:\"replies\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏本版热门主题模块\";s:4:\"type\";s:1:\"0\";}', '0', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_热门主题_今日', 'a:4:{s:3:\"url\";s:554:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=24&jscharset=0&cachelife=1800&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E4%BB%8A%E6%97%A5%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>今日热门</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:4:\"1800\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:9:\"hourviews\";s:5:\"hours\";s:2:\"24\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏今日热门主题模块\";s:4:\"type\";s:1:\"0\";}', '0', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_最新回复', 'a:4:{s:3:\"url\";s:537:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=lastpost&hours=0&jscharset=0&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%9E%E5%A4%8D%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>最新回复</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:0:\"\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"lastpost\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏最新回复模块\";s:4:\"type\";s:1:\"0\";}', '0', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_最新图片_本版', 'a:4:{s:3:\"url\";s:1385:\"function=images&sidestatus=1&isimage=1&threadmethod=1&maxwidth=140&maxheight=140&startrow=0&items=5&orderby=dateline&hours=0&digest=0&newwindow=1&jscharset=0&jstemplate=%3Cdiv%20%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%80%E6%96%B0%E5%9B%BE%E7%89%87%3C%2Fh4%3E%0D%0A%3Cscript%20type%3D%5C%22text%2Fjavascript%5C%22%3E%0D%0Avar%20slideSpeed%20%3D%202500%3B%0D%0Avar%20slideImgsize%20%3D%20%5B140%2C140%5D%3B%0D%0Avar%20slideTextBar%20%3D%200%3B%0D%0Avar%20slideBorderColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0Avar%20slideBgColor%20%3D%20%5C%27%23FFF%5C%27%3B%0D%0Avar%20slideImgs%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgLinks%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideImgTexts%20%3D%20new%20Array%28%29%3B%0D%0Avar%20slideSwitchBar%20%3D%201%3B%0D%0Avar%20slideSwitchColor%20%3D%20%5C%27black%5C%27%3B%0D%0Avar%20slideSwitchbgColor%20%3D%20%5C%27white%5C%27%3B%0D%0Avar%20slideSwitchHiColor%20%3D%20%5C%27%23C8DCEC%5C%27%3B%0D%0A%5Bnode%5D%0D%0AslideImgs%5B%7Border%7D%5D%20%3D%20%5C%22%7Bimgfile%7D%5C%22%3B%0D%0AslideImgLinks%5B%7Border%7D%5D%20%3D%20%5C%22%7Blink%7D%5C%22%3B%0D%0AslideImgTexts%5B%7Border%7D%5D%20%3D%20%5C%22%7Bsubject%7D%5C%22%3B%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fscript%3E%0D%0A%3Cscript%20language%3D%5C%22javascript%5C%22%20type%3D%5C%22text%2Fjavascript%5C%22%20src%3D%5C%22include%2Fjs%2Fslide.js%5C%22%3E%3C%2Fscript%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:13:{s:10:\"jstemplate\";s:709:\"<div  class=\\\"sidebox\\\">\r\n<h4>最新图片</h4>\r\n<script type=\\\"text/javascript\\\">\r\nvar slideSpeed = 2500;\r\nvar slideImgsize = [140,140];\r\nvar slideTextBar = 0;\r\nvar slideBorderColor = \\\'#C8DCEC\\\';\r\nvar slideBgColor = \\\'#FFF\\\';\r\nvar slideImgs = new Array();\r\nvar slideImgLinks = new Array();\r\nvar slideImgTexts = new Array();\r\nvar slideSwitchBar = 1;\r\nvar slideSwitchColor = \\\'black\\\';\r\nvar slideSwitchbgColor = \\\'white\\\';\r\nvar slideSwitchHiColor = \\\'#C8DCEC\\\';\r\n[node]\r\nslideImgs[{order}] = \\\"{imgfile}\\\";\r\nslideImgLinks[{order}] = \\\"{link}\\\";\r\nslideImgTexts[{order}] = \\\"{subject}\\\";\r\n[/node]\r\n</script>\r\n<script language=\\\"javascript\\\" type=\\\"text/javascript\\\" src=\\\"include/js/slide.js\\\"></script>\r\n</div>\";s:9:\"cachelife\";s:0:\"\";s:10:\"sidestatus\";s:1:\"1\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:7:\"isimage\";s:1:\"1\";s:8:\"maxwidth\";s:3:\"140\";s:9:\"maxheight\";s:3:\"140\";s:12:\"threadmethod\";s:1:\"1\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:8:\"dateline\";s:5:\"hours\";s:0:\"\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"边栏本版最新图片展示模块\";s:4:\"type\";s:1:\"4\";}', '4', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_标签', 'a:4:{s:3:\"url\";s:126:\"function=module&module=tag.inc.php&settings=a%3A1%3A%7Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2220%22%3B%7D&jscharset=0&cachelife=900&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:11:\"tag.inc.php\";s:9:\"cachelife\";s:3:\"900\";s:8:\"settings\";a:1:{s:5:\"limit\";s:2:\"20\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:18:\"边栏标签模块\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_会员排行_本月', 'a:4:{s:3:\"url\";s:574:\"function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=720&jscharset=0&cachelife=86400&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E6%9C%88%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:235:\"<div class=\\\"sidebox\\\">\r\n<h4>本月排行</h4>\r\n[node]<div class=\\\"s_clear\\\" style=\\\"margin-bottom: 5px;\\\"><div style=\\\"margin-right: 10px; float: left;\\\">{avatarsmall}</div><p>{member}</p><p>发帖 {value} 篇</p></div>[/node]\r\n</div>\";s:9:\"cachelife\";s:5:\"86400\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:9:\"hourposts\";s:5:\"hours\";s:3:\"720\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"边栏会员本月发帖排行模块\";s:4:\"type\";s:1:\"2\";}', '2', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_会员排行_本周', 'a:4:{s:3:\"url\";s:574:\"function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:235:\"<div class=\\\"sidebox\\\">\r\n<h4>本周排行</h4>\r\n[node]<div class=\\\"s_clear\\\" style=\\\"margin-bottom: 5px;\\\"><div style=\\\"margin-right: 10px; float: left;\\\">{avatarsmall}</div><p>{member}</p><p>发帖 {value} 篇</p></div>[/node]\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:9:\"hourposts\";s:5:\"hours\";s:3:\"168\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"边栏会员本周发帖排行模块\";s:4:\"type\";s:1:\"2\";}', '2', '0');
INSERT INTO `cdb_request` VALUES ('边栏方案_主题列表页默认', 'a:4:{s:3:\"url\";s:432:\"function=side&jscharset=&jstemplate=%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%88%91%E7%9A%84%E5%8A%A9%E6%89%8B%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98_%E6%9C%AC%E7%89%88%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E7%89%88%E5%9D%97%E6%8E%92%E8%A1%8C%5B%2Fmodule%5D&\";s:9:\"parameter\";a:3:{s:12:\"selectmodule\";a:3:{i:1;s:25:\"边栏模块_我的助手\";i:2;s:32:\"边栏模块_热门主题_本版\";i:3;s:25:\"边栏模块_版块排行\";}s:9:\"cachelife\";i:0;s:10:\"jstemplate\";s:181:\"[module]边栏模块_我的助手[/module]<hr class=\"shadowline\"/>[module]边栏模块_热门主题_本版[/module]<hr class=\"shadowline\"/>[module]边栏模块_版块排行[/module]\";}s:7:\"comment\";N;s:4:\"type\";s:2:\"-2\";}', '-2', '0');
INSERT INTO `cdb_request` VALUES ('边栏方案_首页默认', 'a:4:{s:3:\"url\";s:533:\"function=side&jscharset=&jstemplate=%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%88%91%E7%9A%84%E5%8A%A9%E6%89%8B%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%81%9A%E5%90%88%E6%A8%A1%E5%9D%97_%E6%96%B0%E5%B8%96%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%81%9A%E5%90%88%E6%A8%A1%E5%9D%97_%E7%83%AD%E9%97%A8%E4%B8%BB%E9%A2%98%5B%2Fmodule%5D%3Chr%20class%3D%22shadowline%22%2F%3E%5Bmodule%5D%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%B4%BB%E8%B7%83%E4%BC%9A%E5%91%98%5B%2Fmodule%5D&\";s:9:\"parameter\";a:3:{s:12:\"selectmodule\";a:4:{i:1;s:25:\"边栏模块_我的助手\";i:2;s:19:\"聚合模块_新帖\";i:3;s:25:\"聚合模块_热门主题\";i:4;s:25:\"边栏模块_活跃会员\";}s:9:\"cachelife\";i:0;s:10:\"jstemplate\";s:234:\"[module]边栏模块_我的助手[/module]<hr class=\"shadowline\"/>[module]聚合模块_新帖[/module]<hr class=\"shadowline\"/>[module]聚合模块_热门主题[/module]<hr class=\"shadowline\"/>[module]边栏模块_活跃会员[/module]\";}s:7:\"comment\";N;s:4:\"type\";s:2:\"-2\";}', '-2', '0');
INSERT INTO `cdb_request` VALUES ('聚合模块_新帖', 'a:4:{s:3:\"url\";s:387:\"function=module&module=rowcombine.inc.php&settings=a%3A2%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E5%B8%96%E5%AD%90%22%3Bs%3A4%3A%22data%22%3Bs%3A66%3A%22%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%9C%80%E6%96%B0%E4%B8%BB%E9%A2%98%2C%E4%B8%BB%E9%A2%98%0D%0A%E8%BE%B9%E6%A0%8F%E6%A8%A1%E5%9D%97_%E6%9C%80%E6%96%B0%E5%9B%9E%E5%A4%8D%2C%E5%9B%9E%E5%A4%8D%22%3B%7D&jscharset=0&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:18:\"rowcombine.inc.php\";s:9:\"cachelife\";s:0:\"\";s:8:\"settings\";a:2:{s:5:\"title\";s:12:\"最新帖子\";s:4:\"data\";s:66:\"边栏模块_最新主题,主题\r\n边栏模块_最新回复,回复\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:39:\"最新主题、最新回复聚合模块\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_热门主题_本周', 'a:4:{s:3:\"url\";s:556:\"function=threads&sidestatus=0&maxlength=20&fnamelength=0&messagelength=&startrow=0&picpre=images%2Fcommon%2Fslisticon.gif&items=5&tag=&tids=&special=0&rewardstatus=&digest=0&stick=0&recommend=0&newwindow=1&threadtype=0&highlight=0&orderby=hourviews&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E7%83%AD%E9%97%A8%3C%2Fh4%3E%0D%0A%3Cul%20class%3D%5C%22textinfolist%5C%22%3E%0D%0A%5Bnode%5D%3Cli%3E%7Bprefix%7D%7Bsubject%7D%3C%2Fli%3E%5B%2Fnode%5D%0D%0A%3C%2Ful%3E%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:19:{s:10:\"jstemplate\";s:131:\"<div class=\\\"sidebox\\\">\r\n<h4>本周热门</h4>\r\n<ul class=\\\"textinfolist\\\">\r\n[node]<li>{prefix}{subject}</li>[/node]\r\n</ul>\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:10:\"sidestatus\";s:1:\"0\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"maxlength\";s:2:\"20\";s:11:\"fnamelength\";s:1:\"0\";s:13:\"messagelength\";s:0:\"\";s:6:\"picpre\";s:27:\"images/common/slisticon.gif\";s:4:\"tids\";s:0:\"\";s:7:\"keyword\";s:0:\"\";s:3:\"tag\";s:0:\"\";s:10:\"threadtype\";s:1:\"0\";s:9:\"highlight\";s:1:\"0\";s:9:\"recommend\";s:1:\"0\";s:9:\"newwindow\";i:1;s:7:\"orderby\";s:9:\"hourviews\";s:5:\"hours\";s:3:\"168\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:30:\"边栏本周热门主题模块\";s:4:\"type\";s:1:\"0\";}', '0', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_会员排行_今日', 'a:4:{s:3:\"url\";s:572:\"function=memberrank&startrow=0&items=5&newwindow=1&extcredit=1&orderby=hourposts&hours=24&jscharset=0&cachelife=3600&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%5C%22%3E%0D%0A%3Ch4%3E%E4%BB%8A%E6%97%A5%E6%8E%92%E8%A1%8C%3C%2Fh4%3E%0D%0A%5Bnode%5D%3Cdiv%20class%3D%5C%22s_clear%5C%22%20style%3D%5C%22margin-bottom%3A%205px%3B%5C%22%3E%3Cdiv%20style%3D%5C%22margin-right%3A%2010px%3B%20float%3A%20left%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%3Cp%3E%7Bmember%7D%3C%2Fp%3E%3Cp%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fp%3E%3C%2Fdiv%3E%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:235:\"<div class=\\\"sidebox\\\">\r\n<h4>今日排行</h4>\r\n[node]<div class=\\\"s_clear\\\" style=\\\"margin-bottom: 5px;\\\"><div style=\\\"margin-right: 10px; float: left;\\\">{avatarsmall}</div><p>{member}</p><p>发帖 {value} 篇</p></div>[/node]\r\n</div>\";s:9:\"cachelife\";s:4:\"3600\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"5\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:9:\"hourposts\";s:5:\"hours\";s:2:\"24\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"边栏会员今日发帖排行模块\";s:4:\"type\";s:1:\"2\";}', '2', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_论坛之星', 'a:4:{s:3:\"url\";s:668:\"function=memberrank&startrow=0&items=3&newwindow=1&extcredit=1&orderby=hourposts&hours=168&jscharset=0&cachelife=43200&jstemplate=%3Cdiv%20class%3D%5C%22sidebox%20s_clear%5C%22%3E%0D%0A%3Ch4%3E%E6%9C%AC%E5%91%A8%E4%B9%8B%E6%98%9F%3C%2Fh4%3E%0D%0A%5Bnode%5D%0D%0A%5Bshow%3D1%5D%3Cdiv%20style%3D%5C%22clear%3Aboth%5C%22%3E%3Cdiv%20style%3D%5C%22float%3Aleft%3B%20margin-right%3A%2016px%3B%5C%22%3E%7Bavatarsmall%7D%3C%2Fdiv%3E%5B%2Fshow%5D%7Bmember%7D%20%5Bshow%3D1%5D%3Cbr%20%2F%3E%E5%8F%91%E5%B8%96%20%7Bvalue%7D%20%E7%AF%87%3C%2Fdiv%3E%3Cdiv%20style%3D%5C%22clear%3Aboth%3Bmargin-top%3A2px%5C%22%20%2F%3E%3C%2Fdiv%3E%5B%2Fshow%5D%0D%0A%5B%2Fnode%5D%0D%0A%3C%2Fdiv%3E&\";s:9:\"parameter\";a:9:{s:10:\"jstemplate\";s:291:\"<div class=\\\"sidebox s_clear\\\">\r\n<h4>本周之星</h4>\r\n[node]\r\n[show=1]<div style=\\\"clear:both\\\"><div style=\\\"float:left; margin-right: 16px;\\\">{avatarsmall}</div>[/show]{member} [show=1]<br />发帖 {value} 篇</div><div style=\\\"clear:both;margin-top:2px\\\" /></div>[/show]\r\n[/node]\r\n</div>\";s:9:\"cachelife\";s:5:\"43200\";s:8:\"startrow\";s:1:\"0\";s:5:\"items\";s:1:\"3\";s:9:\"newwindow\";i:1;s:9:\"extcredit\";s:1:\"1\";s:7:\"orderby\";s:9:\"hourposts\";s:5:\"hours\";s:3:\"168\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏论坛之星模块\";s:4:\"type\";s:1:\"2\";}', '2', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_我的助手', 'a:4:{s:3:\"url\";s:78:\"function=module&module=assistant.inc.php&settings=N%3B&jscharset=0&cachelife=0\";s:9:\"parameter\";a:3:{s:6:\"module\";s:17:\"assistant.inc.php\";s:9:\"cachelife\";s:1:\"0\";s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:24:\"边栏我的助手模块\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('边栏模块_Google搜索', 'a:4:{s:3:\"url\";s:171:\"function=module&module=google.inc.php&settings=a%3A2%3A%7Bs%3A4%3A%22lang%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22default%22%3Bs%3A1%3A%221%22%3B%7D&jscharset=0&cachelife=864000&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:14:\"google.inc.php\";s:9:\"cachelife\";s:6:\"864000\";s:8:\"settings\";a:2:{s:4:\"lang\";s:0:\"\";s:7:\"default\";s:1:\"1\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:26:\"边栏 Google 搜索模块\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('UCHome_最新动态', 'a:4:{s:3:\"url\";s:445:\"function=module&module=feed.inc.php&settings=a%3A6%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E5%8A%A8%E6%80%81%22%3Bs%3A4%3A%22uids%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22friend%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A54%3A%22%3Cdiv%20style%3D%5C%22padding-left%3A2px%5C%22%3E%7Btitle_template%7D%3C%2Fdiv%3E%22%3B%7D&jscharset=0&cachelife=0&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:12:\"feed.inc.php\";s:9:\"cachelife\";s:1:\"0\";s:8:\"settings\";a:6:{s:5:\"title\";s:12:\"最新动态\";s:4:\"uids\";s:0:\"\";s:6:\"friend\";s:1:\"0\";s:5:\"start\";s:1:\"0\";s:5:\"limit\";s:2:\"10\";s:8:\"template\";s:54:\"<div style=\\\"padding-left:2px\\\">{title_template}</div>\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:27:\"获取UCHome的最新动态\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('UCHome_最新更新空间', 'a:4:{s:3:\"url\";s:1388:\"function=module&module=space.inc.php&settings=a%3A17%3A%7Bs%3A5%3A%22title%22%3Bs%3A18%3A%22%E6%9C%80%E6%96%B0%E6%9B%B4%E6%96%B0%E7%A9%BA%E9%97%B4%22%3Bs%3A3%3A%22uid%22%3Bs%3A0%3A%22%22%3Bs%3A14%3A%22startfriendnum%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22endfriendnum%22%3Bs%3A0%3A%22%22%3Bs%3A12%3A%22startviewnum%22%3Bs%3A0%3A%22%22%3Bs%3A10%3A%22endviewnum%22%3Bs%3A0%3A%22%22%3Bs%3A11%3A%22startcredit%22%3Bs%3A0%3A%22%22%3Bs%3A9%3A%22endcredit%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22avatar%22%3Bs%3A2%3A%22-1%22%3Bs%3A10%3A%22namestatus%22%3Bs%3A2%3A%22-1%22%3Bs%3A8%3A%22dateline%22%3Bs%3A1%3A%220%22%3Bs%3A10%3A%22updatetime%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22order%22%3Bs%3A10%3A%22updatetime%22%3Bs%3A2%3A%22sc%22%3Bs%3A4%3A%22DESC%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A267%3A%22%3Ctable%3E%0D%0A%3Ctr%3E%0D%0A%3Ctd%20width%3D%5C%2250%5C%22%20rowspan%3D%5C%222%5C%22%3E%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20target%3D%5C%22_blank%5C%22%3E%3Cimg%20src%3D%5C%22%7Bphoto%7D%5C%22%20%2F%3E%3C%2Fa%3E%3C%2Ftd%3E%0D%0A%3Ctd%3E%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20%20target%3D%5C%22_blank%5C%22%20style%3D%5C%22text-decoration%3Anone%3B%5C%22%3E%7Busername%7D%3C%2Fa%3E%3C%2Ftd%3E%0D%0A%3C%2Ftr%3E%0D%0A%3Ctr%3E%3Ctd%3E%7Bupdatetime%7D%3C%2Ftd%3E%3C%2Ftr%3E%0D%0A%3C%2Ftable%3E%22%3B%7D&jscharset=0&cachelife=0&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:13:\"space.inc.php\";s:9:\"cachelife\";s:1:\"0\";s:8:\"settings\";a:17:{s:5:\"title\";s:18:\"最新更新空间\";s:3:\"uid\";s:0:\"\";s:14:\"startfriendnum\";s:0:\"\";s:12:\"endfriendnum\";s:0:\"\";s:12:\"startviewnum\";s:0:\"\";s:10:\"endviewnum\";s:0:\"\";s:11:\"startcredit\";s:0:\"\";s:9:\"endcredit\";s:0:\"\";s:6:\"avatar\";s:2:\"-1\";s:10:\"namestatus\";s:2:\"-1\";s:8:\"dateline\";s:1:\"0\";s:10:\"updatetime\";s:1:\"0\";s:5:\"order\";s:10:\"updatetime\";s:2:\"sc\";s:4:\"DESC\";s:5:\"start\";s:1:\"0\";s:5:\"limit\";s:2:\"10\";s:8:\"template\";s:267:\"<table>\r\n<tr>\r\n<td width=\\\"50\\\" rowspan=\\\"2\\\"><a href=\\\"{userlink}\\\" target=\\\"_blank\\\"><img src=\\\"{photo}\\\" /></a></td>\r\n<td><a href=\\\"{userlink}\\\"  target=\\\"_blank\\\" style=\\\"text-decoration:none;\\\">{username}</a></td>\r\n</tr>\r\n<tr><td>{updatetime}</td></tr>\r\n</table>\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:36:\"获取UCHome最新更新会员空间\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('UCHome_最新记录', 'a:4:{s:3:\"url\";s:1021:\"function=module&module=doing.inc.php&settings=a%3A6%3A%7Bs%3A5%3A%22title%22%3Bs%3A12%3A%22%E6%9C%80%E6%96%B0%E8%AE%B0%E5%BD%95%22%3Bs%3A3%3A%22uid%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22mood%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22start%22%3Bs%3A1%3A%220%22%3Bs%3A5%3A%22limit%22%3Bs%3A2%3A%2210%22%3Bs%3A8%3A%22template%22%3Bs%3A361%3A%22%0D%0A%3Cdiv%20style%3D%5C%22padding%3A0%200%205px%200%3B%5C%22%3E%0D%0A%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20target%3D%5C%22_blank%5C%22%3E%3Cimg%20src%3D%5C%22%7Bphoto%7D%5C%22%20width%3D%5C%2218%5C%22%20height%3D%5C%2218%5C%22%20align%3D%5C%22absmiddle%5C%22%3E%3C%2Fa%3E%20%3Ca%20href%3D%5C%22%7Buserlink%7D%5C%22%20%20target%3D%5C%22_blank%5C%22%3E%7Busername%7D%3C%2Fa%3E%EF%BC%9A%0D%0A%3C%2Fdiv%3E%0D%0A%3Cdiv%20style%3D%5C%22padding%3A0%200%205px%2020px%3B%5C%22%3E%0D%0A%3Ca%20href%3D%5C%22%7Blink%7D%5C%22%20style%3D%5C%22color%3A%23333%3Btext-decoration%3Anone%3B%5C%22%20target%3D%5C%22_blank%5C%22%3E%7Bmessage%7D%3C%2Fa%3E%0D%0A%3C%2Fdiv%3E%22%3B%7D&jscharset=0&cachelife=0&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:13:\"doing.inc.php\";s:9:\"cachelife\";s:1:\"0\";s:8:\"settings\";a:6:{s:5:\"title\";s:12:\"最新记录\";s:3:\"uid\";s:0:\"\";s:4:\"mood\";s:1:\"0\";s:5:\"start\";s:1:\"0\";s:5:\"limit\";s:2:\"10\";s:8:\"template\";s:361:\"\r\n<div style=\\\"padding:0 0 5px 0;\\\">\r\n<a href=\\\"{userlink}\\\" target=\\\"_blank\\\"><img src=\\\"{photo}\\\" width=\\\"18\\\" height=\\\"18\\\" align=\\\"absmiddle\\\"></a> <a href=\\\"{userlink}\\\"  target=\\\"_blank\\\">{username}</a>：\r\n</div>\r\n<div style=\\\"padding:0 0 5px 20px;\\\">\r\n<a href=\\\"{link}\\\" style=\\\"color:#333;text-decoration:none;\\\" target=\\\"_blank\\\">{message}</a>\r\n</div>\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:27:\"获取UCHome的最新记录\";s:4:\"type\";s:1:\"5\";}', '5', '0');
INSERT INTO `cdb_request` VALUES ('UCHome_竞价排名', 'a:4:{s:3:\"url\";s:255:\"function=module&module=html.inc.php&settings=a%3A3%3A%7Bs%3A4%3A%22type%22%3Bs%3A1%3A%220%22%3Bs%3A4%3A%22code%22%3Bs%3A27%3A%22%3Cdiv%20id%3D%5C%22sidefeed%5C%22%3E%3C%2Fdiv%3E%22%3Bs%3A4%3A%22side%22%3Bs%3A1%3A%220%22%3B%7D&jscharset=0&cachelife=864000&\";s:9:\"parameter\";a:4:{s:6:\"module\";s:12:\"html.inc.php\";s:9:\"cachelife\";s:6:\"864000\";s:8:\"settings\";a:3:{s:4:\"type\";s:1:\"0\";s:4:\"code\";s:27:\"<div id=\\\"sidefeed\\\"></div>\";s:4:\"side\";s:1:\"0\";}s:9:\"jscharset\";s:1:\"0\";}s:7:\"comment\";s:33:\"获取UCHome的竞价排名信息\";s:4:\"type\";s:1:\"5\";}', '5', '0');

-- ----------------------------
-- Table structure for `cdb_rewardlog`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_rewardlog`;
CREATE TABLE `cdb_rewardlog` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `answererid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned DEFAULT '0',
  `netamount` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `userid` (`authorid`,`answererid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_rewardlog
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_rsscaches`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_rsscaches`;
CREATE TABLE `cdb_rsscaches` (
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `forum` char(50) NOT NULL DEFAULT '',
  `author` char(15) NOT NULL DEFAULT '',
  `subject` char(80) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  UNIQUE KEY `tid` (`tid`),
  KEY `fid` (`fid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_rsscaches
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_searchindex`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_searchindex`;
CREATE TABLE `cdb_searchindex` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `searchstring` text NOT NULL,
  `useip` varchar(15) NOT NULL DEFAULT '',
  `uid` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `threadsortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `threads` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tids` text NOT NULL,
  PRIMARY KEY (`searchid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_searchindex
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_sessions`;
CREATE TABLE `cdb_sessions` (
  `sid` char(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `groupid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `invisible` tinyint(1) NOT NULL DEFAULT '0',
  `action` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastolupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `pageviews` smallint(6) unsigned NOT NULL DEFAULT '0',
  `seccode` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bloguid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `bloguid` (`bloguid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_sessions
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_settings`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_settings`;
CREATE TABLE `cdb_settings` (
  `variable` varchar(32) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_settings
-- ----------------------------
INSERT INTO `cdb_settings` VALUES ('accessemail', '');
INSERT INTO `cdb_settings` VALUES ('activitytype', '朋友聚会\r\n出外郊游\r\n自驾出行\r\n公益活动\r\n线上活动');
INSERT INTO `cdb_settings` VALUES ('adminipaccess', '');
INSERT INTO `cdb_settings` VALUES ('admode', '1');
INSERT INTO `cdb_settings` VALUES ('allowthreadplugin', '');
INSERT INTO `cdb_settings` VALUES ('archiverstatus', '1');
INSERT INTO `cdb_settings` VALUES ('attachbanperiods', '');
INSERT INTO `cdb_settings` VALUES ('attachdir', './attachments');
INSERT INTO `cdb_settings` VALUES ('attachexpire', '');
INSERT INTO `cdb_settings` VALUES ('attachimgpost', '1');
INSERT INTO `cdb_settings` VALUES ('attachrefcheck', '0');
INSERT INTO `cdb_settings` VALUES ('attachsave', '3');
INSERT INTO `cdb_settings` VALUES ('attachurl', 'attachments');
INSERT INTO `cdb_settings` VALUES ('authkey', '75a1bf4iY1PEmJf6');
INSERT INTO `cdb_settings` VALUES ('authoronleft', '0');
INSERT INTO `cdb_settings` VALUES ('avatarmethod', '0');
INSERT INTO `cdb_settings` VALUES ('backupdir', 'bd82bf');
INSERT INTO `cdb_settings` VALUES ('baidusitemap', '1');
INSERT INTO `cdb_settings` VALUES ('baidusitemap_life', '12');
INSERT INTO `cdb_settings` VALUES ('bannedmessages', '1');
INSERT INTO `cdb_settings` VALUES ('bbclosed', '');
INSERT INTO `cdb_settings` VALUES ('bbname', 'Discuz! Board');
INSERT INTO `cdb_settings` VALUES ('bbrules', '0');
INSERT INTO `cdb_settings` VALUES ('bbrulestxt', '');
INSERT INTO `cdb_settings` VALUES ('bdaystatus', '0');
INSERT INTO `cdb_settings` VALUES ('boardlicensed', '0');
INSERT INTO `cdb_settings` VALUES ('cacheindexlife', '0');
INSERT INTO `cdb_settings` VALUES ('cachethreaddir', 'forumdata/threadcaches');
INSERT INTO `cdb_settings` VALUES ('cachethreadlife', '0');
INSERT INTO `cdb_settings` VALUES ('censoremail', '');
INSERT INTO `cdb_settings` VALUES ('censoruser', '');
INSERT INTO `cdb_settings` VALUES ('closedreason', '');
INSERT INTO `cdb_settings` VALUES ('creditnotice', '1');
INSERT INTO `cdb_settings` VALUES ('creditsformula', 'extcredits1');
INSERT INTO `cdb_settings` VALUES ('creditsformulaexp', '');
INSERT INTO `cdb_settings` VALUES ('creditsnotify', '');
INSERT INTO `cdb_settings` VALUES ('creditspolicy', 'a:12:{s:4:\"post\";a:0:{}s:5:\"reply\";a:0:{}s:6:\"digest\";a:1:{i:1;i:10;}s:10:\"postattach\";a:0:{}s:9:\"getattach\";a:0:{}s:6:\"sendpm\";a:0:{}s:6:\"search\";a:0:{}s:15:\"promotion_visit\";a:0:{}s:18:\"promotion_register\";a:0:{}s:13:\"tradefinished\";a:0:{}s:8:\"votepoll\";a:0:{}s:10:\"lowerlimit\";a:0:{}}');
INSERT INTO `cdb_settings` VALUES ('creditstax', '0.2');
INSERT INTO `cdb_settings` VALUES ('creditstrans', '2');
INSERT INTO `cdb_settings` VALUES ('customauthorinfo', 'a:1:{i:0;a:9:{s:3:\"uid\";a:1:{s:4:\"menu\";s:1:\"1\";}s:5:\"posts\";a:1:{s:4:\"menu\";s:1:\"1\";}s:6:\"digest\";a:1:{s:4:\"menu\";s:1:\"1\";}s:7:\"credits\";a:1:{s:4:\"menu\";s:1:\"1\";}s:8:\"readperm\";a:1:{s:4:\"menu\";s:1:\"1\";}s:8:\"location\";a:1:{s:4:\"menu\";s:1:\"1\";}s:6:\"oltime\";a:1:{s:4:\"menu\";s:1:\"1\";}s:7:\"regtime\";a:1:{s:4:\"menu\";s:1:\"1\";}s:8:\"lastdate\";a:1:{s:4:\"menu\";s:1:\"1\";}}}');
INSERT INTO `cdb_settings` VALUES ('custombackup', '');
INSERT INTO `cdb_settings` VALUES ('dateconvert', '1');
INSERT INTO `cdb_settings` VALUES ('dateformat', 'Y-n-j');
INSERT INTO `cdb_settings` VALUES ('debug', '1');
INSERT INTO `cdb_settings` VALUES ('delayviewcount', '0');
INSERT INTO `cdb_settings` VALUES ('deletereason', '');
INSERT INTO `cdb_settings` VALUES ('disallowfloat', 'a:2:{i:3;s:9:\"newthread\";i:4;s:5:\"reply\";}');
INSERT INTO `cdb_settings` VALUES ('domainwhitelist', '');
INSERT INTO `cdb_settings` VALUES ('doublee', '1');
INSERT INTO `cdb_settings` VALUES ('dupkarmarate', '0');
INSERT INTO `cdb_settings` VALUES ('dzfeed_limit', 'a:9:{s:14:\"thread_replies\";a:4:{i:0;s:3:\"100\";i:1;s:4:\"1000\";i:2;s:4:\"2000\";i:3;s:5:\"10000\";}s:12:\"thread_views\";a:3:{i:0;s:3:\"500\";i:1;s:4:\"5000\";i:2;s:5:\"10000\";}s:11:\"thread_rate\";a:3:{i:0;s:2:\"50\";i:1;s:3:\"200\";i:2;s:3:\"500\";}s:9:\"post_rate\";a:3:{i:0;s:2:\"20\";i:1;s:3:\"100\";i:2;s:3:\"300\";}s:14:\"user_usergroup\";a:4:{i:0;s:2:\"12\";i:1;s:2:\"13\";i:2;s:2:\"14\";i:3;s:2:\"15\";}s:11:\"user_credit\";a:3:{i:0;s:4:\"1000\";i:1;s:5:\"10000\";i:2;s:6:\"100000\";}s:12:\"user_threads\";a:5:{i:0;s:3:\"100\";i:1;s:3:\"500\";i:2;s:4:\"1000\";i:3;s:4:\"5000\";i:4;s:5:\"10000\";}s:10:\"user_posts\";a:4:{i:0;s:3:\"500\";i:1;s:4:\"1000\";i:2;s:4:\"5000\";i:3;s:5:\"10000\";}s:11:\"user_digest\";a:4:{i:0;s:2:\"50\";i:1;s:3:\"100\";i:2;s:3:\"500\";i:3;s:4:\"1000\";}}');
INSERT INTO `cdb_settings` VALUES ('ec_account', '');
INSERT INTO `cdb_settings` VALUES ('ec_contract', '');
INSERT INTO `cdb_settings` VALUES ('ec_credit', 'a:2:{s:18:\"maxcreditspermonth\";i:6;s:4:\"rank\";a:15:{i:1;i:4;i:2;i:11;i:3;i:41;i:4;i:91;i:5;i:151;i:6;i:251;i:7;i:501;i:8;i:1001;i:9;i:2001;i:10;i:5001;i:11;i:10001;i:12;i:20001;i:13;i:50001;i:14;i:100001;i:15;i:200001;}}');
INSERT INTO `cdb_settings` VALUES ('ec_maxcredits', '1000');
INSERT INTO `cdb_settings` VALUES ('ec_maxcreditspermonth', '0');
INSERT INTO `cdb_settings` VALUES ('ec_mincredits', '0');
INSERT INTO `cdb_settings` VALUES ('ec_ratio', '0');
INSERT INTO `cdb_settings` VALUES ('ec_tenpay_bargainor', '');
INSERT INTO `cdb_settings` VALUES ('ec_tenpay_key', '');
INSERT INTO `cdb_settings` VALUES ('editedby', '1');
INSERT INTO `cdb_settings` VALUES ('editoroptions', '1');
INSERT INTO `cdb_settings` VALUES ('edittimelimit', '');
INSERT INTO `cdb_settings` VALUES ('exchangemincredits', '100');
INSERT INTO `cdb_settings` VALUES ('extcredits', 'a:2:{i:1;a:3:{s:5:\"title\";s:6:\"威望\";s:12:\"showinthread\";s:0:\"\";s:9:\"available\";i:1;}i:2;a:3:{s:5:\"title\";s:6:\"金钱\";s:12:\"showinthread\";s:0:\"\";s:9:\"available\";i:1;}}');
INSERT INTO `cdb_settings` VALUES ('fastpost', '1');
INSERT INTO `cdb_settings` VALUES ('floodctrl', '15');
INSERT INTO `cdb_settings` VALUES ('forumjump', '0');
INSERT INTO `cdb_settings` VALUES ('forumlinkstatus', '1');
INSERT INTO `cdb_settings` VALUES ('frameon', '0');
INSERT INTO `cdb_settings` VALUES ('framewidth', '180');
INSERT INTO `cdb_settings` VALUES ('ftp', 'a:10:{s:2:\"on\";s:1:\"0\";s:3:\"ssl\";s:1:\"0\";s:4:\"host\";s:0:\"\";s:4:\"port\";s:2:\"21\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:9:\"attachdir\";s:1:\".\";s:9:\"attachurl\";s:0:\"\";s:7:\"hideurl\";s:1:\"0\";s:7:\"timeout\";s:1:\"0\";}');
INSERT INTO `cdb_settings` VALUES ('globalstick', '1');
INSERT INTO `cdb_settings` VALUES ('google', '1');
INSERT INTO `cdb_settings` VALUES ('gzipcompress', '0');
INSERT INTO `cdb_settings` VALUES ('heatthread', 'a:3:{s:5:\"reply\";i:5;s:9:\"recommend\";i:3;s:8:\"hottopic\";s:10:\"50,100,200\";}');
INSERT INTO `cdb_settings` VALUES ('hideprivate', '1');
INSERT INTO `cdb_settings` VALUES ('historyposts', '1	1');
INSERT INTO `cdb_settings` VALUES ('hottopic', '10');
INSERT INTO `cdb_settings` VALUES ('icp', '');
INSERT INTO `cdb_settings` VALUES ('imageimpath', '');
INSERT INTO `cdb_settings` VALUES ('imagelib', '0');
INSERT INTO `cdb_settings` VALUES ('indexhot', '');
INSERT INTO `cdb_settings` VALUES ('indexname', 'index.php');
INSERT INTO `cdb_settings` VALUES ('indextype', 'classics');
INSERT INTO `cdb_settings` VALUES ('infosidestatus', '0');
INSERT INTO `cdb_settings` VALUES ('initcredits', '0,0,0,0,0,0,0,0,0');
INSERT INTO `cdb_settings` VALUES ('inviteconfig', '');
INSERT INTO `cdb_settings` VALUES ('ipaccess', '');
INSERT INTO `cdb_settings` VALUES ('ipregctrl', '');
INSERT INTO `cdb_settings` VALUES ('jscachelife', '1800');
INSERT INTO `cdb_settings` VALUES ('jsdateformat', '');
INSERT INTO `cdb_settings` VALUES ('jspath', 'forumdata/cache/');
INSERT INTO `cdb_settings` VALUES ('jsrefdomains', '');
INSERT INTO `cdb_settings` VALUES ('jsstatus', '0');
INSERT INTO `cdb_settings` VALUES ('jswizard', '');
INSERT INTO `cdb_settings` VALUES ('karmaratelimit', '0');
INSERT INTO `cdb_settings` VALUES ('loadctrl', '0');
INSERT INTO `cdb_settings` VALUES ('losslessdel', '365');
INSERT INTO `cdb_settings` VALUES ('magicdiscount', '85');
INSERT INTO `cdb_settings` VALUES ('magicmarket', '1');
INSERT INTO `cdb_settings` VALUES ('magicstatus', '1');
INSERT INTO `cdb_settings` VALUES ('mail', 'a:10:{s:8:\"mailsend\";s:1:\"1\";s:6:\"server\";s:13:\"smtp.21cn.com\";s:4:\"port\";s:2:\"25\";s:4:\"auth\";s:1:\"1\";s:4:\"from\";s:26:\"Discuz <username@21cn.com>\";s:13:\"auth_username\";s:17:\"username@21cn.com\";s:13:\"auth_password\";s:8:\"password\";s:13:\"maildelimiter\";s:1:\"0\";s:12:\"mailusername\";s:1:\"1\";s:15:\"sendmail_silent\";s:1:\"1\";}');
INSERT INTO `cdb_settings` VALUES ('maxavatarpixel', '120');
INSERT INTO `cdb_settings` VALUES ('maxavatarsize', '20000');
INSERT INTO `cdb_settings` VALUES ('maxbdays', '0');
INSERT INTO `cdb_settings` VALUES ('maxchargespan', '0');
INSERT INTO `cdb_settings` VALUES ('maxfavorites', '100');
INSERT INTO `cdb_settings` VALUES ('maxincperthread', '0');
INSERT INTO `cdb_settings` VALUES ('maxmagicprice', '50');
INSERT INTO `cdb_settings` VALUES ('maxmodworksmonths', '3');
INSERT INTO `cdb_settings` VALUES ('maxonlinelist', '0');
INSERT INTO `cdb_settings` VALUES ('maxonlines', '5000');
INSERT INTO `cdb_settings` VALUES ('maxpolloptions', '10');
INSERT INTO `cdb_settings` VALUES ('maxpostsize', '10000');
INSERT INTO `cdb_settings` VALUES ('maxsearchresults', '500');
INSERT INTO `cdb_settings` VALUES ('maxsigrows', '100');
INSERT INTO `cdb_settings` VALUES ('maxsmilies', '10');
INSERT INTO `cdb_settings` VALUES ('maxspm', '0');
INSERT INTO `cdb_settings` VALUES ('membermaxpages', '100');
INSERT INTO `cdb_settings` VALUES ('memberperpage', '25');
INSERT INTO `cdb_settings` VALUES ('memliststatus', '1');
INSERT INTO `cdb_settings` VALUES ('minpostsize', '10');
INSERT INTO `cdb_settings` VALUES ('moddisplay', 'flat');
INSERT INTO `cdb_settings` VALUES ('modratelimit', '0');
INSERT INTO `cdb_settings` VALUES ('modreasons', '广告/SPAM\r\n恶意灌水\r\n违规内容\r\n文不对题\r\n重复发帖\r\n\r\n我很赞同\r\n精品文章\r\n原创内容');
INSERT INTO `cdb_settings` VALUES ('modworkstatus', '1');
INSERT INTO `cdb_settings` VALUES ('msgforward', 'a:3:{s:11:\"refreshtime\";i:3;s:5:\"quick\";i:1;s:8:\"messages\";a:13:{i:0;s:19:\"thread_poll_succeed\";i:1;s:19:\"thread_rate_succeed\";i:2;s:23:\"usergroups_join_succeed\";i:3;s:23:\"usergroups_exit_succeed\";i:4;s:25:\"usergroups_update_succeed\";i:5;s:20:\"buddy_update_succeed\";i:6;s:17:\"post_edit_succeed\";i:7;s:18:\"post_reply_succeed\";i:8;s:24:\"post_edit_delete_succeed\";i:9;s:22:\"post_newthread_succeed\";i:10;s:13:\"admin_succeed\";i:11;s:17:\"pm_delete_succeed\";i:12;s:15:\"search_redirect\";}}');
INSERT INTO `cdb_settings` VALUES ('msn', '');
INSERT INTO `cdb_settings` VALUES ('newbiespan', '0');
INSERT INTO `cdb_settings` VALUES ('newbietasks', '');
INSERT INTO `cdb_settings` VALUES ('newbietaskupdate', '');
INSERT INTO `cdb_settings` VALUES ('newsletter', '');
INSERT INTO `cdb_settings` VALUES ('nocacheheaders', '0');
INSERT INTO `cdb_settings` VALUES ('oltimespan', '10');
INSERT INTO `cdb_settings` VALUES ('onlinehold', '15');
INSERT INTO `cdb_settings` VALUES ('onlinerecord', '1	1040034649');
INSERT INTO `cdb_settings` VALUES ('outextcredits', '');
INSERT INTO `cdb_settings` VALUES ('postbanperiods', '');
INSERT INTO `cdb_settings` VALUES ('postmodperiods', '');
INSERT INTO `cdb_settings` VALUES ('postno', '#');
INSERT INTO `cdb_settings` VALUES ('postnocustom', '');
INSERT INTO `cdb_settings` VALUES ('postperpage', '10');
INSERT INTO `cdb_settings` VALUES ('pvfrequence', '60');
INSERT INTO `cdb_settings` VALUES ('pwdsafety', '');
INSERT INTO `cdb_settings` VALUES ('qihoo', 'a:9:{s:6:\"status\";i:0;s:9:\"searchbox\";i:6;s:7:\"summary\";i:1;s:6:\"jammer\";i:1;s:9:\"maxtopics\";i:10;s:8:\"keywords\";s:0:\"\";s:10:\"adminemail\";s:0:\"\";s:8:\"validity\";i:1;s:14:\"relatedthreads\";a:6:{s:6:\"bbsnum\";i:0;s:6:\"webnum\";i:0;s:4:\"type\";a:3:{s:4:\"blog\";s:4:\"blog\";s:4:\"news\";s:4:\"news\";s:3:\"bbs\";s:3:\"bbs\";}s:6:\"banurl\";s:0:\"\";s:8:\"position\";i:1;s:8:\"validity\";i:1;}}');
INSERT INTO `cdb_settings` VALUES ('ratelogrecord', '5');
INSERT INTO `cdb_settings` VALUES ('recommendthread', '');
INSERT INTO `cdb_settings` VALUES ('regctrl', '0');
INSERT INTO `cdb_settings` VALUES ('regfloodctrl', '0');
INSERT INTO `cdb_settings` VALUES ('reglinkname', '注册');
INSERT INTO `cdb_settings` VALUES ('regname', 'register.php');
INSERT INTO `cdb_settings` VALUES ('regstatus', '1');
INSERT INTO `cdb_settings` VALUES ('regverify', '0');
INSERT INTO `cdb_settings` VALUES ('relatedtag', '');
INSERT INTO `cdb_settings` VALUES ('reportpost', '1');
INSERT INTO `cdb_settings` VALUES ('rewritecompatible', '');
INSERT INTO `cdb_settings` VALUES ('rewritestatus', '0');
INSERT INTO `cdb_settings` VALUES ('rssstatus', '1');
INSERT INTO `cdb_settings` VALUES ('rssttl', '60');
INSERT INTO `cdb_settings` VALUES ('runwizard', '1');
INSERT INTO `cdb_settings` VALUES ('searchbanperiods', '');
INSERT INTO `cdb_settings` VALUES ('searchctrl', '30');
INSERT INTO `cdb_settings` VALUES ('seccodedata', 'a:13:{s:8:\"minposts\";s:0:\"\";s:16:\"loginfailedcount\";i:0;s:5:\"width\";i:150;s:6:\"height\";i:60;s:4:\"type\";s:1:\"0\";s:10:\"background\";s:1:\"1\";s:10:\"adulterate\";s:1:\"1\";s:3:\"ttf\";s:1:\"0\";s:5:\"angle\";s:1:\"0\";s:5:\"color\";s:1:\"1\";s:4:\"size\";s:1:\"0\";s:6:\"shadow\";s:1:\"1\";s:8:\"animator\";s:1:\"0\";}');
INSERT INTO `cdb_settings` VALUES ('seccodestatus', '0');
INSERT INTO `cdb_settings` VALUES ('seclevel', '1');
INSERT INTO `cdb_settings` VALUES ('secqaa', 'a:2:{s:8:\"minposts\";s:1:\"1\";s:6:\"status\";i:0;}');
INSERT INTO `cdb_settings` VALUES ('seodescription', '');
INSERT INTO `cdb_settings` VALUES ('seohead', '');
INSERT INTO `cdb_settings` VALUES ('seokeywords', '');
INSERT INTO `cdb_settings` VALUES ('seotitle', '');
INSERT INTO `cdb_settings` VALUES ('showemail', '');
INSERT INTO `cdb_settings` VALUES ('showimages', '1');
INSERT INTO `cdb_settings` VALUES ('showsettings', '7');
INSERT INTO `cdb_settings` VALUES ('sigviewcond', '0');
INSERT INTO `cdb_settings` VALUES ('sitemessage', '');
INSERT INTO `cdb_settings` VALUES ('sitename', 'Comsenz Inc.');
INSERT INTO `cdb_settings` VALUES ('siteuniqueid', 'MHSDdH2da4uu3UO8');
INSERT INTO `cdb_settings` VALUES ('siteurl', 'http://www.comsenz.com/');
INSERT INTO `cdb_settings` VALUES ('smcols', '8');
INSERT INTO `cdb_settings` VALUES ('smrows', '5');
INSERT INTO `cdb_settings` VALUES ('smthumb', '20');
INSERT INTO `cdb_settings` VALUES ('spacedata', 'a:11:{s:9:\"cachelife\";s:3:\"900\";s:14:\"limitmythreads\";s:1:\"5\";s:14:\"limitmyreplies\";s:1:\"5\";s:14:\"limitmyrewards\";s:1:\"5\";s:13:\"limitmytrades\";s:1:\"5\";s:13:\"limitmyvideos\";s:1:\"0\";s:12:\"limitmyblogs\";s:1:\"8\";s:14:\"limitmyfriends\";s:1:\"0\";s:16:\"limitmyfavforums\";s:1:\"5\";s:17:\"limitmyfavthreads\";s:1:\"0\";s:10:\"textlength\";s:3:\"300\";}');
INSERT INTO `cdb_settings` VALUES ('spacestatus', '1');
INSERT INTO `cdb_settings` VALUES ('starthreshold', '2');
INSERT INTO `cdb_settings` VALUES ('statcode', '');
INSERT INTO `cdb_settings` VALUES ('statscachelife', '180');
INSERT INTO `cdb_settings` VALUES ('statstatus', '');
INSERT INTO `cdb_settings` VALUES ('styleid', '1');
INSERT INTO `cdb_settings` VALUES ('stylejump', '1');
INSERT INTO `cdb_settings` VALUES ('subforumsindex', '');
INSERT INTO `cdb_settings` VALUES ('swfupload', '1');
INSERT INTO `cdb_settings` VALUES ('tagstatus', '1');
INSERT INTO `cdb_settings` VALUES ('taskon', '0');
INSERT INTO `cdb_settings` VALUES ('threadmaxpages', '1000');
INSERT INTO `cdb_settings` VALUES ('threadsticky', '全局置顶,分类置顶,本版置顶');
INSERT INTO `cdb_settings` VALUES ('thumbheight', '300');
INSERT INTO `cdb_settings` VALUES ('thumbquality', '100');
INSERT INTO `cdb_settings` VALUES ('thumbstatus', '0');
INSERT INTO `cdb_settings` VALUES ('thumbwidth', '400');
INSERT INTO `cdb_settings` VALUES ('timeformat', 'H:i');
INSERT INTO `cdb_settings` VALUES ('timeoffset', '8');
INSERT INTO `cdb_settings` VALUES ('topicperpage', '20');
INSERT INTO `cdb_settings` VALUES ('tradetypes', '');
INSERT INTO `cdb_settings` VALUES ('transfermincredits', '1000');
INSERT INTO `cdb_settings` VALUES ('transsidstatus', '0');
INSERT INTO `cdb_settings` VALUES ('uc', 'a:1:{s:7:\"addfeed\";i:1;}');
INSERT INTO `cdb_settings` VALUES ('ucactivation', '1');
INSERT INTO `cdb_settings` VALUES ('upgradeurl', 'http://localhost/develop/dzhead/develop/upgrade.php');
INSERT INTO `cdb_settings` VALUES ('userdateformat', 'Y-n-j\r\nY/n/j\r\nj-n-Y\r\nj/n/Y');
INSERT INTO `cdb_settings` VALUES ('userstatusby', '1');
INSERT INTO `cdb_settings` VALUES ('viewthreadtags', '100');
INSERT INTO `cdb_settings` VALUES ('visitbanperiods', '');
INSERT INTO `cdb_settings` VALUES ('visitedforums', '10');
INSERT INTO `cdb_settings` VALUES ('vtonlinestatus', '1');
INSERT INTO `cdb_settings` VALUES ('wapcharset', '2');
INSERT INTO `cdb_settings` VALUES ('wapdateformat', 'n/j');
INSERT INTO `cdb_settings` VALUES ('wapmps', '500');
INSERT INTO `cdb_settings` VALUES ('wapppp', '5');
INSERT INTO `cdb_settings` VALUES ('wapregister', '0');
INSERT INTO `cdb_settings` VALUES ('wapstatus', '0');
INSERT INTO `cdb_settings` VALUES ('waptpp', '10');
INSERT INTO `cdb_settings` VALUES ('warningexpiration', '3');
INSERT INTO `cdb_settings` VALUES ('warninglimit', '3');
INSERT INTO `cdb_settings` VALUES ('watermarkminheight', '0');
INSERT INTO `cdb_settings` VALUES ('watermarkminwidth', '0');
INSERT INTO `cdb_settings` VALUES ('watermarkquality', '80');
INSERT INTO `cdb_settings` VALUES ('watermarkstatus', '0');
INSERT INTO `cdb_settings` VALUES ('watermarktext', '');
INSERT INTO `cdb_settings` VALUES ('watermarktrans', '65');
INSERT INTO `cdb_settings` VALUES ('watermarktype', '0');
INSERT INTO `cdb_settings` VALUES ('welcomemsg', '1');
INSERT INTO `cdb_settings` VALUES ('welcomemsgtitle', '{username}，您好，感谢您的注册，请阅读以下内容。');
INSERT INTO `cdb_settings` VALUES ('welcomemsgtxt', '尊敬的{username}，您已经注册成为{sitename}的会员，请您在发表言论时，遵守当地法律法规。\r\n如果您有什么疑问可以联系管理员，Email: {adminemail}。\r\n\r\n\r\n{bbname}\r\n{time}');
INSERT INTO `cdb_settings` VALUES ('whosonlinestatus', '1');
INSERT INTO `cdb_settings` VALUES ('whosonline_contract', '0');
INSERT INTO `cdb_settings` VALUES ('zoomstatus', '1');
INSERT INTO `cdb_settings` VALUES ('ratelogon', '0');
INSERT INTO `cdb_settings` VALUES ('forumseparator', '1');
INSERT INTO `cdb_settings` VALUES ('allowattachurl', '0');
INSERT INTO `cdb_settings` VALUES ('allowviewuserthread', '');
INSERT INTO `cdb_settings` VALUES ('ipverifywhite', '');
INSERT INTO `cdb_settings` VALUES ('tasktypes', 'a:3:{s:9:\"promotion\";a:2:{s:4:\"name\";s:18:\"论坛推广任务\";s:7:\"version\";s:3:\"1.0\";}s:4:\"gift\";a:2:{s:4:\"name\";s:15:\"红包类任务\";s:7:\"version\";s:3:\"1.0\";}s:6:\"avatar\";a:2:{s:4:\"name\";s:15:\"头像类任务\";s:7:\"version\";s:3:\"1.0\";}}');

-- ----------------------------
-- Table structure for `cdb_smilies`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_smilies`;
CREATE TABLE `cdb_smilies` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) unsigned NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `type` enum('smiley','icon','stamp') NOT NULL DEFAULT 'smiley',
  `code` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_smilies
-- ----------------------------
INSERT INTO `cdb_smilies` VALUES ('1', '1', '1', 'smiley', ':)', 'smile.gif');
INSERT INTO `cdb_smilies` VALUES ('2', '1', '2', 'smiley', ':(', 'sad.gif');
INSERT INTO `cdb_smilies` VALUES ('3', '1', '3', 'smiley', ':D', 'biggrin.gif');
INSERT INTO `cdb_smilies` VALUES ('4', '1', '4', 'smiley', ':\'(', 'cry.gif');
INSERT INTO `cdb_smilies` VALUES ('5', '1', '5', 'smiley', ':@', 'huffy.gif');
INSERT INTO `cdb_smilies` VALUES ('6', '1', '6', 'smiley', ':o', 'shocked.gif');
INSERT INTO `cdb_smilies` VALUES ('7', '1', '7', 'smiley', ':P', 'tongue.gif');
INSERT INTO `cdb_smilies` VALUES ('8', '1', '8', 'smiley', ':$', 'shy.gif');
INSERT INTO `cdb_smilies` VALUES ('9', '1', '9', 'smiley', ';P', 'titter.gif');
INSERT INTO `cdb_smilies` VALUES ('10', '1', '10', 'smiley', ':L', 'sweat.gif');
INSERT INTO `cdb_smilies` VALUES ('11', '1', '11', 'smiley', ':Q', 'mad.gif');
INSERT INTO `cdb_smilies` VALUES ('12', '1', '12', 'smiley', ':lol', 'lol.gif');
INSERT INTO `cdb_smilies` VALUES ('13', '1', '13', 'smiley', ':loveliness:', 'loveliness.gif');
INSERT INTO `cdb_smilies` VALUES ('14', '1', '14', 'smiley', ':funk:', 'funk.gif');
INSERT INTO `cdb_smilies` VALUES ('15', '1', '15', 'smiley', ':curse:', 'curse.gif');
INSERT INTO `cdb_smilies` VALUES ('16', '1', '16', 'smiley', ':dizzy:', 'dizzy.gif');
INSERT INTO `cdb_smilies` VALUES ('17', '1', '17', 'smiley', ':shutup:', 'shutup.gif');
INSERT INTO `cdb_smilies` VALUES ('18', '1', '18', 'smiley', ':sleepy:', 'sleepy.gif');
INSERT INTO `cdb_smilies` VALUES ('19', '1', '19', 'smiley', ':hug:', 'hug.gif');
INSERT INTO `cdb_smilies` VALUES ('20', '1', '20', 'smiley', ':victory:', 'victory.gif');
INSERT INTO `cdb_smilies` VALUES ('21', '1', '21', 'smiley', ':time:', 'time.gif');
INSERT INTO `cdb_smilies` VALUES ('22', '1', '22', 'smiley', ':kiss:', 'kiss.gif');
INSERT INTO `cdb_smilies` VALUES ('23', '1', '23', 'smiley', ':handshake', 'handshake.gif');
INSERT INTO `cdb_smilies` VALUES ('24', '1', '24', 'smiley', ':call:', 'call.gif');
INSERT INTO `cdb_smilies` VALUES ('25', '2', '1', 'smiley', '{:2_25:}', '01.gif');
INSERT INTO `cdb_smilies` VALUES ('26', '2', '2', 'smiley', '{:2_26:}', '02.gif');
INSERT INTO `cdb_smilies` VALUES ('27', '2', '3', 'smiley', '{:2_27:}', '03.gif');
INSERT INTO `cdb_smilies` VALUES ('28', '2', '4', 'smiley', '{:2_28:}', '04.gif');
INSERT INTO `cdb_smilies` VALUES ('29', '2', '5', 'smiley', '{:2_29:}', '05.gif');
INSERT INTO `cdb_smilies` VALUES ('30', '2', '6', 'smiley', '{:2_30:}', '06.gif');
INSERT INTO `cdb_smilies` VALUES ('31', '2', '7', 'smiley', '{:2_31:}', '07.gif');
INSERT INTO `cdb_smilies` VALUES ('32', '2', '8', 'smiley', '{:2_32:}', '08.gif');
INSERT INTO `cdb_smilies` VALUES ('33', '2', '9', 'smiley', '{:2_33:}', '09.gif');
INSERT INTO `cdb_smilies` VALUES ('34', '2', '10', 'smiley', '{:2_34:}', '10.gif');
INSERT INTO `cdb_smilies` VALUES ('35', '2', '11', 'smiley', '{:2_35:}', '11.gif');
INSERT INTO `cdb_smilies` VALUES ('36', '2', '12', 'smiley', '{:2_36:}', '12.gif');
INSERT INTO `cdb_smilies` VALUES ('37', '2', '13', 'smiley', '{:2_37:}', '13.gif');
INSERT INTO `cdb_smilies` VALUES ('38', '2', '14', 'smiley', '{:2_38:}', '14.gif');
INSERT INTO `cdb_smilies` VALUES ('39', '2', '15', 'smiley', '{:2_39:}', '15.gif');
INSERT INTO `cdb_smilies` VALUES ('40', '2', '16', 'smiley', '{:2_40:}', '16.gif');
INSERT INTO `cdb_smilies` VALUES ('41', '3', '1', 'smiley', '{:3_41:}', '01.gif');
INSERT INTO `cdb_smilies` VALUES ('42', '3', '2', 'smiley', '{:3_42:}', '02.gif');
INSERT INTO `cdb_smilies` VALUES ('43', '3', '3', 'smiley', '{:3_43:}', '03.gif');
INSERT INTO `cdb_smilies` VALUES ('44', '3', '4', 'smiley', '{:3_44:}', '04.gif');
INSERT INTO `cdb_smilies` VALUES ('45', '3', '5', 'smiley', '{:3_45:}', '05.gif');
INSERT INTO `cdb_smilies` VALUES ('46', '3', '6', 'smiley', '{:3_46:}', '06.gif');
INSERT INTO `cdb_smilies` VALUES ('47', '3', '7', 'smiley', '{:3_47:}', '07.gif');
INSERT INTO `cdb_smilies` VALUES ('48', '3', '8', 'smiley', '{:3_48:}', '08.gif');
INSERT INTO `cdb_smilies` VALUES ('49', '3', '9', 'smiley', '{:3_49:}', '09.gif');
INSERT INTO `cdb_smilies` VALUES ('50', '3', '10', 'smiley', '{:3_50:}', '10.gif');
INSERT INTO `cdb_smilies` VALUES ('51', '3', '11', 'smiley', '{:3_51:}', '11.gif');
INSERT INTO `cdb_smilies` VALUES ('52', '3', '12', 'smiley', '{:3_52:}', '12.gif');
INSERT INTO `cdb_smilies` VALUES ('53', '3', '13', 'smiley', '{:3_53:}', '13.gif');
INSERT INTO `cdb_smilies` VALUES ('54', '3', '14', 'smiley', '{:3_54:}', '14.gif');
INSERT INTO `cdb_smilies` VALUES ('55', '3', '15', 'smiley', '{:3_55:}', '15.gif');
INSERT INTO `cdb_smilies` VALUES ('56', '3', '16', 'smiley', '{:3_56:}', '16.gif');
INSERT INTO `cdb_smilies` VALUES ('57', '3', '17', 'smiley', '{:3_57:}', '17.gif');
INSERT INTO `cdb_smilies` VALUES ('58', '3', '18', 'smiley', '{:3_58:}', '18.gif');
INSERT INTO `cdb_smilies` VALUES ('59', '3', '19', 'smiley', '{:3_59:}', '19.gif');
INSERT INTO `cdb_smilies` VALUES ('60', '3', '20', 'smiley', '{:3_60:}', '20.gif');
INSERT INTO `cdb_smilies` VALUES ('61', '3', '21', 'smiley', '{:3_61:}', '21.gif');
INSERT INTO `cdb_smilies` VALUES ('62', '3', '22', 'smiley', '{:3_62:}', '22.gif');
INSERT INTO `cdb_smilies` VALUES ('63', '3', '23', 'smiley', '{:3_63:}', '23.gif');
INSERT INTO `cdb_smilies` VALUES ('64', '3', '24', 'smiley', '{:3_64:}', '24.gif');
INSERT INTO `cdb_smilies` VALUES ('65', '0', '1', 'icon', '', 'icon1.gif');
INSERT INTO `cdb_smilies` VALUES ('66', '0', '2', 'icon', '', 'icon2.gif');
INSERT INTO `cdb_smilies` VALUES ('67', '0', '3', 'icon', '', 'icon3.gif');
INSERT INTO `cdb_smilies` VALUES ('68', '0', '4', 'icon', '', 'icon4.gif');
INSERT INTO `cdb_smilies` VALUES ('69', '0', '5', 'icon', '', 'icon5.gif');
INSERT INTO `cdb_smilies` VALUES ('70', '0', '6', 'icon', '', 'icon6.gif');
INSERT INTO `cdb_smilies` VALUES ('71', '0', '7', 'icon', '', 'icon7.gif');
INSERT INTO `cdb_smilies` VALUES ('72', '0', '8', 'icon', '', 'icon8.gif');
INSERT INTO `cdb_smilies` VALUES ('73', '0', '9', 'icon', '', 'icon9.gif');
INSERT INTO `cdb_smilies` VALUES ('74', '0', '10', 'icon', '', 'icon10.gif');
INSERT INTO `cdb_smilies` VALUES ('75', '0', '11', 'icon', '', 'icon11.gif');
INSERT INTO `cdb_smilies` VALUES ('76', '0', '12', 'icon', '', 'icon12.gif');
INSERT INTO `cdb_smilies` VALUES ('77', '0', '13', 'icon', '', 'icon13.gif');
INSERT INTO `cdb_smilies` VALUES ('78', '0', '14', 'icon', '', 'icon14.gif');
INSERT INTO `cdb_smilies` VALUES ('79', '0', '15', 'icon', '', 'icon15.gif');
INSERT INTO `cdb_smilies` VALUES ('80', '0', '16', 'icon', '', 'icon16.gif');
INSERT INTO `cdb_smilies` VALUES ('81', '0', '0', 'stamp', '精华', '001.gif');
INSERT INTO `cdb_smilies` VALUES ('82', '0', '1', 'stamp', '热帖', '002.gif');
INSERT INTO `cdb_smilies` VALUES ('83', '0', '2', 'stamp', '美图', '003.gif');
INSERT INTO `cdb_smilies` VALUES ('84', '0', '3', 'stamp', '优秀', '004.gif');
INSERT INTO `cdb_smilies` VALUES ('85', '0', '4', 'stamp', '置顶', '005.gif');
INSERT INTO `cdb_smilies` VALUES ('86', '0', '5', 'stamp', '推荐', '006.gif');
INSERT INTO `cdb_smilies` VALUES ('87', '0', '6', 'stamp', '原创', '007.gif');
INSERT INTO `cdb_smilies` VALUES ('88', '0', '7', 'stamp', '版主推荐', '008.gif');
INSERT INTO `cdb_smilies` VALUES ('89', '0', '8', 'stamp', '爆料', '009.gif');

-- ----------------------------
-- Table structure for `cdb_spacecaches`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_spacecaches`;
CREATE TABLE `cdb_spacecaches` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `variable` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_spacecaches
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_stats`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_stats`;
CREATE TABLE `cdb_stats` (
  `type` char(10) NOT NULL DEFAULT '',
  `variable` char(10) NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`,`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_stats
-- ----------------------------
INSERT INTO `cdb_stats` VALUES ('total', 'hits', '1');
INSERT INTO `cdb_stats` VALUES ('total', 'members', '0');
INSERT INTO `cdb_stats` VALUES ('total', 'guests', '1');
INSERT INTO `cdb_stats` VALUES ('os', 'Windows', '1');
INSERT INTO `cdb_stats` VALUES ('os', 'Mac', '0');
INSERT INTO `cdb_stats` VALUES ('os', 'Linux', '0');
INSERT INTO `cdb_stats` VALUES ('os', 'FreeBSD', '0');
INSERT INTO `cdb_stats` VALUES ('os', 'SunOS', '0');
INSERT INTO `cdb_stats` VALUES ('os', 'OS/2', '0');
INSERT INTO `cdb_stats` VALUES ('os', 'AIX', '0');
INSERT INTO `cdb_stats` VALUES ('os', 'Spiders', '0');
INSERT INTO `cdb_stats` VALUES ('os', 'Other', '0');
INSERT INTO `cdb_stats` VALUES ('browser', 'MSIE', '1');
INSERT INTO `cdb_stats` VALUES ('browser', 'Netscape', '0');
INSERT INTO `cdb_stats` VALUES ('browser', 'Mozilla', '0');
INSERT INTO `cdb_stats` VALUES ('browser', 'Lynx', '0');
INSERT INTO `cdb_stats` VALUES ('browser', 'Opera', '0');
INSERT INTO `cdb_stats` VALUES ('browser', 'Konqueror', '0');
INSERT INTO `cdb_stats` VALUES ('browser', 'Other', '0');
INSERT INTO `cdb_stats` VALUES ('week', '0', '0');
INSERT INTO `cdb_stats` VALUES ('week', '1', '1');
INSERT INTO `cdb_stats` VALUES ('week', '2', '0');
INSERT INTO `cdb_stats` VALUES ('week', '3', '0');
INSERT INTO `cdb_stats` VALUES ('week', '4', '0');
INSERT INTO `cdb_stats` VALUES ('week', '5', '0');
INSERT INTO `cdb_stats` VALUES ('week', '6', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '00', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '01', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '02', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '03', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '04', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '05', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '06', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '07', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '08', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '09', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '10', '1');
INSERT INTO `cdb_stats` VALUES ('hour', '11', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '12', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '13', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '14', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '15', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '16', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '17', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '18', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '19', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '20', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '21', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '22', '0');
INSERT INTO `cdb_stats` VALUES ('hour', '23', '0');
INSERT INTO `cdb_stats` VALUES ('browser', 'Firefox', '0');
INSERT INTO `cdb_stats` VALUES ('browser', 'Safari', '0');

-- ----------------------------
-- Table structure for `cdb_statvars`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_statvars`;
CREATE TABLE `cdb_statvars` (
  `type` varchar(20) NOT NULL DEFAULT '',
  `variable` varchar(20) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`type`,`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_statvars
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_styles`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_styles`;
CREATE TABLE `cdb_styles` (
  `styleid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `available` tinyint(1) NOT NULL DEFAULT '1',
  `templateid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`styleid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_styles
-- ----------------------------
INSERT INTO `cdb_styles` VALUES ('1', '默认风格', '1', '1');

-- ----------------------------
-- Table structure for `cdb_stylevars`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_stylevars`;
CREATE TABLE `cdb_stylevars` (
  `stylevarid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `styleid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `variable` text NOT NULL,
  `substitute` text NOT NULL,
  PRIMARY KEY (`stylevarid`),
  KEY `styleid` (`styleid`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_stylevars
-- ----------------------------
INSERT INTO `cdb_stylevars` VALUES ('1', '1', 'stypeid', '1');
INSERT INTO `cdb_stylevars` VALUES ('2', '1', 'available', '');
INSERT INTO `cdb_stylevars` VALUES ('3', '1', 'boardimg', 'logo.gif');
INSERT INTO `cdb_stylevars` VALUES ('4', '1', 'imgdir', '');
INSERT INTO `cdb_stylevars` VALUES ('5', '1', 'styleimgdir', '');
INSERT INTO `cdb_stylevars` VALUES ('6', '1', 'font', 'Verdana, Helvetica, Arial, sans-serif');
INSERT INTO `cdb_stylevars` VALUES ('7', '1', 'fontsize', '12px');
INSERT INTO `cdb_stylevars` VALUES ('8', '1', 'smfont', 'Verdana, Helvetica, Arial, sans-serif');
INSERT INTO `cdb_stylevars` VALUES ('9', '1', 'smfontsize', '0.83em');
INSERT INTO `cdb_stylevars` VALUES ('10', '1', 'tabletext', '#444');
INSERT INTO `cdb_stylevars` VALUES ('11', '1', 'midtext', '#666');
INSERT INTO `cdb_stylevars` VALUES ('12', '1', 'lighttext', '#999');
INSERT INTO `cdb_stylevars` VALUES ('13', '1', 'link', '#000');
INSERT INTO `cdb_stylevars` VALUES ('14', '1', 'highlightlink', '#09C');
INSERT INTO `cdb_stylevars` VALUES ('15', '1', 'noticetext', '#F60');
INSERT INTO `cdb_stylevars` VALUES ('16', '1', 'msgfontsize', '14px');
INSERT INTO `cdb_stylevars` VALUES ('17', '1', 'msgbigsize', '16px');
INSERT INTO `cdb_stylevars` VALUES ('18', '1', 'bgcolor', '#0D2345 bodybg.gif repeat-x 0 90px');
INSERT INTO `cdb_stylevars` VALUES ('19', '1', 'sidebgcolor', '#FFF sidebg.gif repeat-y 100% 0');
INSERT INTO `cdb_stylevars` VALUES ('20', '1', 'headerborder', '1px');
INSERT INTO `cdb_stylevars` VALUES ('21', '1', 'headerbordercolor', '#00B2E8');
INSERT INTO `cdb_stylevars` VALUES ('22', '1', 'headerbgcolor', '#00A2D2 header.gif repeat-x 0 100%');
INSERT INTO `cdb_stylevars` VALUES ('23', '1', 'headertext', '#97F2FF');
INSERT INTO `cdb_stylevars` VALUES ('24', '1', 'footertext', '#8691A2');
INSERT INTO `cdb_stylevars` VALUES ('25', '1', 'menuborder', '#B0E4EF');
INSERT INTO `cdb_stylevars` VALUES ('26', '1', 'menubgcolor', '#EBF4FD mtabbg.gif repeat-x 0 100%');
INSERT INTO `cdb_stylevars` VALUES ('27', '1', 'menutext', '#666');
INSERT INTO `cdb_stylevars` VALUES ('28', '1', 'menuhover', '#1E4B7E');
INSERT INTO `cdb_stylevars` VALUES ('29', '1', 'menuhovertext', '#C3D3E4');
INSERT INTO `cdb_stylevars` VALUES ('30', '1', 'wrapwidth', '960px');
INSERT INTO `cdb_stylevars` VALUES ('31', '1', 'wrapbg', '#FFF');
INSERT INTO `cdb_stylevars` VALUES ('32', '1', 'wrapborder', '0');
INSERT INTO `cdb_stylevars` VALUES ('33', '1', 'wrapbordercolor', '');
INSERT INTO `cdb_stylevars` VALUES ('34', '1', 'contentwidth', '600px');
INSERT INTO `cdb_stylevars` VALUES ('35', '1', 'contentseparate', '#D3E8F2');
INSERT INTO `cdb_stylevars` VALUES ('36', '1', 'inputborder', '#CCC');
INSERT INTO `cdb_stylevars` VALUES ('37', '1', 'inputborderdarkcolor', '#999');
INSERT INTO `cdb_stylevars` VALUES ('38', '1', 'inputbg', '#FFF');
INSERT INTO `cdb_stylevars` VALUES ('39', '1', 'commonborder', '#E6E7E1');
INSERT INTO `cdb_stylevars` VALUES ('40', '1', 'commonbg', '#F7F7F7');
INSERT INTO `cdb_stylevars` VALUES ('41', '1', 'specialborder', '#E3EDF5');
INSERT INTO `cdb_stylevars` VALUES ('42', '1', 'specialbg', '#EBF2F8');
INSERT INTO `cdb_stylevars` VALUES ('43', '1', 'interleavecolor', '#F5F5F5');
INSERT INTO `cdb_stylevars` VALUES ('44', '1', 'dropmenuborder', '#7FCAE2');
INSERT INTO `cdb_stylevars` VALUES ('45', '1', 'dropmenubgcolor', '#FEFEFE');
INSERT INTO `cdb_stylevars` VALUES ('46', '1', 'floatmaskbgcolor', '#7FCAE2');
INSERT INTO `cdb_stylevars` VALUES ('47', '1', 'floatbgcolor', '#F1F5FA');

-- ----------------------------
-- Table structure for `cdb_tags`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_tags`;
CREATE TABLE `cdb_tags` (
  `tagname` char(20) NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `total` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`tagname`),
  KEY `total` (`total`),
  KEY `closed` (`closed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_tags
-- ----------------------------
INSERT INTO `cdb_tags` VALUES ('NoSQL', '0', '1');
INSERT INTO `cdb_tags` VALUES ('BigData', '0', '1');

-- ----------------------------
-- Table structure for `cdb_tasks`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_tasks`;
CREATE TABLE `cdb_tasks` (
  `taskid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `relatedtaskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `newbietask` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `icon` varchar(150) NOT NULL DEFAULT '',
  `applicants` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `achievers` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tasklimits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `applyperm` text NOT NULL,
  `scriptname` varchar(50) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `period` int(10) unsigned NOT NULL DEFAULT '0',
  `reward` enum('credit','magic','medal','invite','group') NOT NULL DEFAULT 'credit',
  `prize` varchar(15) NOT NULL DEFAULT '',
  `bonus` int(10) NOT NULL DEFAULT '0',
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `version` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`taskid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_tasks
-- ----------------------------
INSERT INTO `cdb_tasks` VALUES ('1', '0', '1', '0', '回帖是一种美德', '学习回帖，看帖回帖是一种美德，BS看帖不回帖的', '', '0', '0', '0', 'all', 'newbie_post_reply', '0', '0', '0', 'credit', '2', '10', '-1', '');
INSERT INTO `cdb_tasks` VALUES ('2', '0', '1', '0', '我的第一次', '学会发主题帖，成为社区的焦点', '', '0', '0', '0', 'all', 'newbie_post_newthread', '0', '0', '0', 'credit', '2', '10', '-1', '');
INSERT INTO `cdb_tasks` VALUES ('3', '0', '1', '0', '与众不同', '修改个人资料，让你和别人与众不同', '', '0', '0', '0', 'all', 'newbie_modifyprofile', '0', '0', '0', 'credit', '2', '10', '-1', '');
INSERT INTO `cdb_tasks` VALUES ('4', '0', '1', '0', '我型我秀', '上传头像，让大家认识一个全新的你', '', '0', '0', '0', 'all', 'newbie_uploadavatar', '0', '0', '0', 'credit', '2', '10', '-1', '');
INSERT INTO `cdb_tasks` VALUES ('5', '0', '1', '0', '联络感情', '给其他用户发个发短消息，大家联络一下感情', '', '0', '0', '0', 'all', 'newbie_sendpm', '0', '0', '0', 'credit', '2', '10', '-1', '');
INSERT INTO `cdb_tasks` VALUES ('6', '0', '1', '0', '一个好汉三个帮', '出来混的，没几个好友怎么行，加个好友吧', '', '0', '0', '0', 'all', 'newbie_addbuddy', '0', '0', '0', 'credit', '2', '10', '-1', '');
INSERT INTO `cdb_tasks` VALUES ('7', '0', '1', '0', '信息时代', '信息时代最缺的什么？搜索', '', '0', '0', '0', 'all', 'newbie_search', '0', '0', '0', 'credit', '2', '10', '-1', '');

-- ----------------------------
-- Table structure for `cdb_taskvars`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_taskvars`;
CREATE TABLE `cdb_taskvars` (
  `taskvarid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `taskid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sort` enum('apply','complete','setting') NOT NULL DEFAULT 'complete',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `variable` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'text',
  `value` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`taskvarid`),
  KEY `taskid` (`taskid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_taskvars
-- ----------------------------
INSERT INTO `cdb_taskvars` VALUES ('1', '1', 'complete', '回复指定主题', '设置会员只有回复该主题才能完成任务，请填写主题的 tid(比如一个主题的地址是 http://localhost/viewthread.php?tid=8 那么该主题的 tid 就是 8)，留空为不限制', 'threadid', 'text', '0', '');
INSERT INTO `cdb_taskvars` VALUES ('2', '1', 'setting', '', '', 'entrance', 'text', 'viewthread', '');
INSERT INTO `cdb_taskvars` VALUES ('3', '2', 'complete', '在指定版块发表新主题', '设置会员必须在某个版块发表至少一篇新主题才能完成任务', 'forumid', 'text', '', '');
INSERT INTO `cdb_taskvars` VALUES ('4', '2', 'setting', '', '', 'entrance', 'text', 'forumdisplay', '');
INSERT INTO `cdb_taskvars` VALUES ('5', '3', 'complete', '完善个人资料', '申请任务后只要把自己的个人资料填写完整即可完成任务', '', '', '', '');
INSERT INTO `cdb_taskvars` VALUES ('6', '3', 'setting', '', '', 'entrance', 'text', 'memcp', '');
INSERT INTO `cdb_taskvars` VALUES ('7', '4', 'complete', '上传头像', '申请任务后只要成功上传头像即可完成任务', '', '', '', '');
INSERT INTO `cdb_taskvars` VALUES ('8', '4', 'setting', '', '', 'entrance', 'text', 'memcp', '');
INSERT INTO `cdb_taskvars` VALUES ('9', '5', 'complete', '给指定会员发送短消息', '只有给该会员成功发送短消息才能完成任务，请填写该会员的用户名', 'authorid', 'text', '', '');
INSERT INTO `cdb_taskvars` VALUES ('10', '5', 'setting', '', '', 'entrance', 'text', 'space', '');
INSERT INTO `cdb_taskvars` VALUES ('11', '6', 'complete', '将指定会员加为好友', '只有将该会员加为好友才能完成任务，请填写该会员的用户名', 'authorid', 'text', '', '');
INSERT INTO `cdb_taskvars` VALUES ('12', '6', 'setting', '', '', 'entrance', 'text', 'space', '');
INSERT INTO `cdb_taskvars` VALUES ('13', '7', 'complete', '学会搜索', '申请任务后只要成功使用论坛搜索功能即可完成任务', '', '', '', '');
INSERT INTO `cdb_taskvars` VALUES ('14', '7', 'setting', '', '', 'entrance', 'text', 'search', '');

-- ----------------------------
-- Table structure for `cdb_templates`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_templates`;
CREATE TABLE `cdb_templates` (
  `templateid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `directory` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`templateid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_templates
-- ----------------------------
INSERT INTO `cdb_templates` VALUES ('1', '默认模板套系', './templates/default', '康盛创想（北京）科技有限公司');

-- ----------------------------
-- Table structure for `cdb_threads`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_threads`;
CREATE TABLE `cdb_threads` (
  `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `iconid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `readperm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` smallint(6) NOT NULL DEFAULT '0',
  `author` char(15) NOT NULL DEFAULT '',
  `authorid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `lastposter` char(15) NOT NULL DEFAULT '',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(1) NOT NULL DEFAULT '0',
  `highlight` tinyint(1) NOT NULL DEFAULT '0',
  `digest` tinyint(1) NOT NULL DEFAULT '0',
  `rate` tinyint(1) NOT NULL DEFAULT '0',
  `special` tinyint(1) NOT NULL DEFAULT '0',
  `attachment` tinyint(1) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) NOT NULL DEFAULT '0',
  `closed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `supe_pushstatus` tinyint(1) NOT NULL DEFAULT '0',
  `recommends` smallint(6) NOT NULL,
  `recommend_add` smallint(6) NOT NULL,
  `recommend_sub` smallint(6) NOT NULL,
  `heats` int(10) unsigned NOT NULL DEFAULT '0',
  `status` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `digest` (`digest`),
  KEY `sortid` (`sortid`),
  KEY `displayorder` (`fid`,`displayorder`,`lastpost`),
  KEY `typeid` (`fid`,`typeid`,`displayorder`,`lastpost`),
  KEY `recommends` (`recommends`),
  KEY `heats` (`heats`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_threads
-- ----------------------------
INSERT INTO `cdb_threads` VALUES ('1', '2', '0', '0', '0', '0', '0', 'admin', '1', '论坛运营秘籍 - Discuz! 7.2 新功能的妙用', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('2', '2', '0', '0', '0', '0', '0', 'admin', '1', 'Discuz! 7.2 新功能－－站长推荐', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('3', '2', '0', '0', '0', '0', '0', 'admin', '1', '论坛热点：在第一眼就留住用户', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('4', '2', '0', '0', '0', '0', '0', 'admin', '1', 'Discuz! 7.2新特性－－主题热度/评价', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('5', '2', '0', '0', '0', '0', '0', 'admin', '1', 'Discuz! 7.2 新特性－－推荐主题', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('6', '2', '0', '0', '0', '0', '0', 'admin', '1', 'Discuz! 7.2 新特性－－新手任务', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('7', '2', '0', '0', '0', '0', '0', 'admin', '1', '主题关注：让论坛帖子动起来', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('8', '2', '0', '0', '0', '0', '0', 'admin', '1', 'Discuz! 7.2 新特性－－论坛动态', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('9', '2', '0', '0', '0', '0', '0', 'admin', '1', 'Discuz! 7.2 新特性－－提醒系统', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('10', '2', '0', '0', '0', '0', '0', 'admin', '1', '帖子编辑器：轻轻松松发帖', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('11', '2', '0', '0', '0', '0', '0', 'admin', '1', '转发视频：更易更强大', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('12', '2', '0', '0', '0', '0', '0', 'admin', '1', 'Discuz!7.2 新特性－－Manyou应用的开启', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('13', '2', '0', '0', '0', '0', '0', 'admin', '1', '7.2新增功能及功能强化', '1342582747', '1342582747', 'admin', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `cdb_threads` VALUES ('14', '2', '66', '0', '0', '0', '0', 'admin', '1', 'zqhxuyuan的测试', '1342583268', '1342583277', 'admin', '2', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `cdb_threadsmod`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_threadsmod`;
CREATE TABLE `cdb_threadsmod` (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `action` char(5) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `magicid` smallint(6) unsigned NOT NULL,
  `stamp` tinyint(3) NOT NULL,
  KEY `tid` (`tid`,`dateline`),
  KEY `expiration` (`expiration`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_threadsmod
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_threadtags`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_threadtags`;
CREATE TABLE `cdb_threadtags` (
  `tagname` char(20) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  KEY `tagname` (`tagname`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_threadtags
-- ----------------------------
INSERT INTO `cdb_threadtags` VALUES ('NoSQL', '14');
INSERT INTO `cdb_threadtags` VALUES ('BigData', '14');

-- ----------------------------
-- Table structure for `cdb_threadtypes`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_threadtypes`;
CREATE TABLE `cdb_threadtypes` (
  `typeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `displayorder` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `special` smallint(6) NOT NULL DEFAULT '0',
  `modelid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `expiration` tinyint(1) NOT NULL DEFAULT '0',
  `template` text NOT NULL,
  `stemplate` text NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_threadtypes
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_tradecomments`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_tradecomments`;
CREATE TABLE `cdb_tradecomments` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `orderid` char(32) NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `raterid` mediumint(8) unsigned NOT NULL,
  `rater` char(15) NOT NULL,
  `rateeid` mediumint(8) unsigned NOT NULL,
  `ratee` char(15) NOT NULL,
  `message` char(200) NOT NULL,
  `explanation` char(200) NOT NULL,
  `score` tinyint(1) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `raterid` (`raterid`,`type`,`dateline`),
  KEY `rateeid` (`rateeid`,`type`,`dateline`),
  KEY `orderid` (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_tradecomments
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_tradelog`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_tradelog`;
CREATE TABLE `cdb_tradelog` (
  `tid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `orderid` varchar(32) NOT NULL,
  `tradeno` varchar(32) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quality` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `itemtype` tinyint(1) NOT NULL DEFAULT '0',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tax` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `locus` varchar(100) NOT NULL,
  `sellerid` mediumint(8) unsigned NOT NULL,
  `seller` varchar(15) NOT NULL,
  `selleraccount` varchar(50) NOT NULL,
  `buyerid` mediumint(8) unsigned NOT NULL,
  `buyer` varchar(15) NOT NULL,
  `buyercontact` varchar(50) NOT NULL,
  `buyercredits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `buyermsg` varchar(200) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `offline` tinyint(1) NOT NULL DEFAULT '0',
  `buyername` varchar(50) NOT NULL,
  `buyerzip` varchar(10) NOT NULL,
  `buyerphone` varchar(20) NOT NULL,
  `buyermobile` varchar(20) NOT NULL,
  `transport` tinyint(1) NOT NULL DEFAULT '0',
  `transportfee` smallint(6) unsigned NOT NULL DEFAULT '0',
  `baseprice` decimal(8,2) NOT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT '0',
  `ratestatus` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `basecredit` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `orderid` (`orderid`),
  KEY `sellerid` (`sellerid`),
  KEY `buyerid` (`buyerid`),
  KEY `status` (`status`),
  KEY `buyerlog` (`buyerid`,`status`,`lastupdate`),
  KEY `sellerlog` (`sellerid`,`status`,`lastupdate`),
  KEY `tid` (`tid`,`pid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_tradelog
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_tradeoptionvars`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_tradeoptionvars`;
CREATE TABLE `cdb_tradeoptionvars` (
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `optionid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `value` mediumtext NOT NULL,
  KEY `sortid` (`sortid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_tradeoptionvars
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_trades`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_trades`;
CREATE TABLE `cdb_trades` (
  `tid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `typeid` smallint(6) unsigned NOT NULL,
  `sellerid` mediumint(8) unsigned NOT NULL,
  `seller` char(15) NOT NULL,
  `account` char(50) NOT NULL,
  `subject` char(100) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `amount` smallint(6) unsigned NOT NULL DEFAULT '1',
  `quality` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locus` char(20) NOT NULL,
  `transport` tinyint(1) NOT NULL DEFAULT '0',
  `ordinaryfee` smallint(4) unsigned NOT NULL DEFAULT '0',
  `expressfee` smallint(4) unsigned NOT NULL DEFAULT '0',
  `emsfee` smallint(4) unsigned NOT NULL DEFAULT '0',
  `itemtype` tinyint(1) NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `lastbuyer` char(15) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  `totalitems` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tradesum` decimal(8,2) NOT NULL DEFAULT '0.00',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `aid` mediumint(8) unsigned NOT NULL,
  `displayorder` tinyint(1) NOT NULL,
  `costprice` decimal(8,2) NOT NULL,
  `credit` int(10) unsigned NOT NULL DEFAULT '0',
  `costcredit` int(10) unsigned NOT NULL DEFAULT '0',
  `credittradesum` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`pid`),
  KEY `sellerid` (`sellerid`),
  KEY `totalitems` (`totalitems`),
  KEY `tradesum` (`tradesum`),
  KEY `displayorder` (`tid`,`displayorder`),
  KEY `sellertrades` (`sellerid`,`tradesum`,`totalitems`),
  KEY `typeid` (`typeid`),
  KEY `credittradesum` (`credittradesum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_trades
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_typemodels`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_typemodels`;
CREATE TABLE `cdb_typemodels` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `options` mediumtext NOT NULL,
  `customoptions` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_typemodels
-- ----------------------------
INSERT INTO `cdb_typemodels` VALUES ('1', '房屋交易信息', '0', '1', '7	10	13	65	66	68', '');
INSERT INTO `cdb_typemodels` VALUES ('2', '车票交易信息', '0', '1', '55	56	58	67	7	13	68', '');
INSERT INTO `cdb_typemodels` VALUES ('3', '兴趣交友信息', '0', '1', '8	9	31', '');
INSERT INTO `cdb_typemodels` VALUES ('4', '公司招聘信息', '0', '1', '34	48	54	51	47	46	44	45	52	53', '');

-- ----------------------------
-- Table structure for `cdb_typeoptions`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_typeoptions`;
CREATE TABLE `cdb_typeoptions` (
  `optionid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `classid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `unit` varchar(40) NOT NULL,
  `rules` mediumtext NOT NULL,
  PRIMARY KEY (`optionid`),
  KEY `classid` (`classid`)
) ENGINE=MyISAM AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_typeoptions
-- ----------------------------
INSERT INTO `cdb_typeoptions` VALUES ('1', '0', '0', '通用类', '', '', '', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('2', '0', '0', '房产类', '', '', '', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('3', '0', '0', '交友类', '', '', '', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('4', '0', '0', '求职招聘类', '', '', '', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('5', '0', '0', '交易类', '', '', '', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('6', '0', '0', '互联网类', '', '', '', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('7', '1', '0', '姓名', '', 'name', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('9', '1', '0', '年龄', '', 'age', 'number', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('10', '1', '0', '地址', '', 'address', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('11', '1', '0', 'QQ', '', 'qq', 'number', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('12', '1', '0', '邮箱', '', 'mail', 'email', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('13', '1', '0', '电话', '', 'phone', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('14', '5', '0', '培训费用', '', 'teach_pay', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('15', '5', '0', '培训时间', '', 'teach_time', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('20', '2', '0', '楼层', '', 'floor', 'number', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('21', '2', '0', '交通状况', '', 'traf', 'textarea', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('22', '2', '0', '地图', '', 'images', 'image', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('24', '2', '0', '价格', '', 'price', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('26', '5', '0', '培训名称', '', 'teach_name', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('28', '3', '0', '身高', '', 'heighth', 'number', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('29', '3', '0', '体重', '', 'weighth', 'number', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('33', '1', '0', '照片', '', 'photo', 'image', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('35', '5', '0', '服务方式', '', 'service_type', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('36', '5', '0', '服务时间', '', 'service_time', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('37', '5', '0', '服务费用', '', 'service_pay', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('39', '6', '0', '网址', '', 'site_url', 'url', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('40', '6', '0', '电子邮件', '', 'site_mail', 'email', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('42', '6', '0', '网站名称', '', 'site_name', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('46', '4', '0', '职位', '', 'recr_intend', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('47', '4', '0', '工作地点', '', 'recr_palce', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('49', '4', '0', '有效期至', '', 'recr_end', 'calendar', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('51', '4', '0', '公司名称', '', 'recr_com', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('52', '4', '0', '年龄要求', '', 'recr_age', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('54', '4', '0', '专业', '', 'recr_abli', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('55', '5', '0', '始发', '', 'leaves', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('56', '5', '0', '终点', '', 'boundfor', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('57', '6', '0', 'Alexa排名', '', 'site_top', 'number', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('58', '5', '0', '车次/航班', '', 'train_no', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('59', '5', '0', '数量', '', 'trade_num', 'number', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('60', '5', '0', '价格', '', 'trade_price', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('61', '5', '0', '有效期至', '', 'trade_end', 'calendar', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('63', '1', '0', '详细描述', '', 'detail_content', 'textarea', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('64', '1', '0', '籍贯', '', 'born_place', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('65', '2', '0', '租金', '', 'money', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('66', '2', '0', '面积', '', 'acreage', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('67', '5', '0', '发车时间', '', 'time', 'calendar', '', 'N;');
INSERT INTO `cdb_typeoptions` VALUES ('68', '1', '0', '所在地', '', 'now_place', 'text', '', '');
INSERT INTO `cdb_typeoptions` VALUES ('8', '1', '2', '性别', '', 'gender', 'radio', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:12:\"1=男\r\n2=女\";}');
INSERT INTO `cdb_typeoptions` VALUES ('16', '2', '0', '房屋类型', '', 'property', 'select', '', 'a:1:{s:7:\"choices\";s:64:\"1=写字楼\r\n2=公寓\r\n3=小区\r\n4=平房\r\n5=别墅\r\n6=地下室\";}');
INSERT INTO `cdb_typeoptions` VALUES ('17', '2', '0', '座向', '', 'face', 'radio', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:38:\"1=南向\r\n2=北向\r\n3=西向\r\n4=东向\";}');
INSERT INTO `cdb_typeoptions` VALUES ('18', '2', '0', '装修情况', '', 'makes', 'radio', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:40:\"1=无装修\r\n2=简单装修\r\n3=精装修\";}');
INSERT INTO `cdb_typeoptions` VALUES ('19', '2', '0', '居室', '', 'mode', 'select', '', 'a:1:{s:7:\"choices\";s:57:\"1=独居\r\n2=两居室\r\n3=三居室\r\n4=四居室\r\n5=别墅\";}');
INSERT INTO `cdb_typeoptions` VALUES ('23', '2', '0', '屋内设施', '', 'equipment', 'checkbox', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:167:\"1=水电\r\n2=宽带\r\n3=管道气\r\n4=有线电视\r\n5=电梯\r\n6=电话\r\n7=冰箱\r\n8=洗衣机\r\n9=热水器\r\n10=空调\r\n11=暖气\r\n12=微波炉\r\n13=油烟机\r\n14=饮水机\";}');
INSERT INTO `cdb_typeoptions` VALUES ('25', '2', '0', '是否中介', '', 'bool', 'radio', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:12:\"1=是\r\n2=否\";}');
INSERT INTO `cdb_typeoptions` VALUES ('27', '3', '0', '星座', '', 'Horoscope', 'select', '', 'a:1:{s:7:\"choices\";s:157:\"1=白羊座\r\n2=金牛座\r\n3=双子座\r\n4=巨蟹座\r\n5=狮子座\r\n6=处女座\r\n7=天秤座\r\n8=天蝎座\r\n9=射手座\r\n10=摩羯座\r\n11=水瓶座\r\n12=双鱼座\";}');
INSERT INTO `cdb_typeoptions` VALUES ('30', '3', '0', '婚姻状况', '', 'marrige', 'radio', '', 'a:1:{s:7:\"choices\";s:18:\"1=已婚\r\n2=未婚\";}');
INSERT INTO `cdb_typeoptions` VALUES ('31', '3', '0', '爱好', '', 'hobby', 'checkbox', '', 'a:1:{s:7:\"choices\";s:242:\"1=美食\r\n2=唱歌\r\n3=跳舞\r\n4=电影\r\n5=音乐\r\n6=戏剧\r\n7=聊天\r\n8=拍托\r\n9=电脑\r\n10=网络\r\n11=游戏\r\n12=绘画\r\n13=书法\r\n14=雕塑\r\n15=异性\r\n16=阅读\r\n17=运动\r\n18=旅游\r\n19=八卦\r\n20=购物\r\n21=赚钱\r\n22=汽车\r\n23=摄影\";}');
INSERT INTO `cdb_typeoptions` VALUES ('32', '3', '0', '收入范围', '', 'salary', 'select', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:109:\"1=保密\r\n2=800元以上\r\n3=1500元以上\r\n4=2000元以上\r\n5=3000元以上\r\n6=5000元以上\r\n7=8000元以上\";}');
INSERT INTO `cdb_typeoptions` VALUES ('34', '1', '0', '学历', '', 'education', 'radio', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:91:\"1=文盲\r\n2=小学\r\n3=初中\r\n4=高中\r\n5=中专\r\n6=大专\r\n7=本科\r\n8=研究生\r\n9=博士\";}');
INSERT INTO `cdb_typeoptions` VALUES ('38', '5', '0', '席别', '', 'seats', 'select', '', 'a:1:{s:7:\"choices\";s:48:\"1=站票\r\n2=硬座\r\n3=软座\r\n4=硬卧\r\n5=软卧\";}');
INSERT INTO `cdb_typeoptions` VALUES ('44', '4', '0', '是否应届', '', 'recr_term', 'radio', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:21:\"1=应届\r\n2=非应届\";}');
INSERT INTO `cdb_typeoptions` VALUES ('48', '4', '0', '薪金', '', 'recr_salary', 'select', '', 'a:1:{s:7:\"choices\";s:114:\"1=面议\r\n2=1000以下\r\n3=1000~1500\r\n4=1500~2000\r\n5=2000~3000\r\n6=3000~4000\r\n7=4000~6000\r\n8=6000~8000\r\n9=8000以上\";}');
INSERT INTO `cdb_typeoptions` VALUES ('50', '4', '0', '工作性质', '', 'recr_work', 'radio', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:18:\"1=全职\r\n2=兼职\";}');
INSERT INTO `cdb_typeoptions` VALUES ('53', '4', '0', '性别要求', '', 'recr_sex', 'checkbox', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:12:\"1=男\r\n2=女\";}');
INSERT INTO `cdb_typeoptions` VALUES ('62', '5', '0', '付款方式', '', 'pay_type', 'checkbox', '', 'a:3:{s:8:\"required\";s:1:\"0\";s:12:\"unchangeable\";s:1:\"0\";s:7:\"choices\";s:41:\"1=电汇\r\n2=支付宝\r\n3=现金\r\n4=其他\";}');

-- ----------------------------
-- Table structure for `cdb_typeoptionvars`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_typeoptionvars`;
CREATE TABLE `cdb_typeoptionvars` (
  `sortid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `optionid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  `value` mediumtext NOT NULL,
  KEY `sortid` (`sortid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_typeoptionvars
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_typevars`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_typevars`;
CREATE TABLE `cdb_typevars` (
  `sortid` smallint(6) NOT NULL DEFAULT '0',
  `optionid` smallint(6) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `unchangeable` tinyint(1) NOT NULL DEFAULT '0',
  `search` tinyint(1) NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `subjectshow` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `optionid` (`sortid`,`optionid`),
  KEY `sortid` (`sortid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_typevars
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_admins`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_admins`;
CREATE TABLE `cdb_uc_admins` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `allowadminsetting` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminapp` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminuser` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminbadword` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmintag` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminpm` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincredits` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindomain` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmindb` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminnote` tinyint(1) NOT NULL DEFAULT '0',
  `allowadmincache` tinyint(1) NOT NULL DEFAULT '0',
  `allowadminlog` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_admins
-- ----------------------------
INSERT INTO `cdb_uc_admins` VALUES ('1', 'admin', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `cdb_uc_applications`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_applications`;
CREATE TABLE `cdb_uc_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `viewprourl` char(255) NOT NULL,
  `apifilename` char(30) NOT NULL DEFAULT 'uc.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `dbcharset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  `recvnote` tinyint(1) DEFAULT '0',
  `extra` mediumtext NOT NULL,
  `tagtemplates` mediumtext NOT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_applications
-- ----------------------------
INSERT INTO `cdb_uc_applications` VALUES ('1', 'DISCUZ', 'Discuz! Board', 'http://localhost/upload', '1eu3EfL2wdg6RdffX0W121d1c3i2a1K5B90431Sdjc29eeG7n20cwa15O4r8VfR4', '127.0.0.1', '', 'uc.php', '', '', '1', '1', '', '');

-- ----------------------------
-- Table structure for `cdb_uc_badwords`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_badwords`;
CREATE TABLE `cdb_uc_badwords` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `findpattern` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `find` (`find`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_badwords
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_domains`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_domains`;
CREATE TABLE `cdb_uc_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` char(40) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_domains
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_failedlogins`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_failedlogins`;
CREATE TABLE `cdb_uc_failedlogins` (
  `ip` char(15) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_failedlogins
-- ----------------------------
INSERT INTO `cdb_uc_failedlogins` VALUES ('127.0.0.1', '1', '1342588630');

-- ----------------------------
-- Table structure for `cdb_uc_feeds`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_feeds`;
CREATE TABLE `cdb_uc_feeds` (
  `feedid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(30) NOT NULL DEFAULT '',
  `icon` varchar(30) NOT NULL DEFAULT '',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(15) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `hash_template` varchar(32) NOT NULL DEFAULT '',
  `hash_data` varchar(32) NOT NULL DEFAULT '',
  `title_template` text NOT NULL,
  `title_data` text NOT NULL,
  `body_template` text NOT NULL,
  `body_data` text NOT NULL,
  `body_general` text NOT NULL,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_1_link` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_2_link` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `image_3_link` varchar(255) NOT NULL DEFAULT '',
  `image_4` varchar(255) NOT NULL DEFAULT '',
  `image_4_link` varchar(255) NOT NULL DEFAULT '',
  `target_ids` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`feedid`),
  KEY `uid` (`uid`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_feeds
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_friends`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_friends`;
CREATE TABLE `cdb_uc_friends` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `friendid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `direction` tinyint(1) NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delstatus` tinyint(1) NOT NULL DEFAULT '0',
  `comment` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`version`),
  KEY `uid` (`uid`),
  KEY `friendid` (`friendid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_friends
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_mailqueue`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_mailqueue`;
CREATE TABLE `cdb_uc_mailqueue` (
  `mailid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tomail` varchar(32) NOT NULL,
  `frommail` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `charset` varchar(15) NOT NULL,
  `htmlon` tinyint(1) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `failures` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mailid`),
  KEY `appid` (`appid`),
  KEY `level` (`level`,`failures`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_mailqueue
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_memberfields`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_memberfields`;
CREATE TABLE `cdb_uc_memberfields` (
  `uid` mediumint(8) unsigned NOT NULL,
  `blacklist` text NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_memberfields
-- ----------------------------
INSERT INTO `cdb_uc_memberfields` VALUES ('1', '');

-- ----------------------------
-- Table structure for `cdb_uc_members`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_members`;
CREATE TABLE `cdb_uc_members` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `myid` char(30) NOT NULL DEFAULT '',
  `myidkey` char(16) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `salt` char(6) NOT NULL,
  `secques` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_members
-- ----------------------------
INSERT INTO `cdb_uc_members` VALUES ('1', 'admin', 'd17e6e11d348d2fdddd79abbab548bac', 'admin@admin.com', '', '', 'hidden', '1342582741', '0', '0', '55d677', '');

-- ----------------------------
-- Table structure for `cdb_uc_mergemembers`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_mergemembers`;
CREATE TABLE `cdb_uc_mergemembers` (
  `appid` smallint(6) unsigned NOT NULL,
  `username` char(15) NOT NULL,
  PRIMARY KEY (`appid`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_mergemembers
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_newpm`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_newpm`;
CREATE TABLE `cdb_uc_newpm` (
  `uid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_newpm
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_notelist`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_notelist`;
CREATE TABLE `cdb_uc_notelist` (
  `noteid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `closed` tinyint(4) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `succeednum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `getdata` mediumtext NOT NULL,
  `postdata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `pri` tinyint(3) NOT NULL DEFAULT '0',
  `app1` tinyint(4) NOT NULL,
  PRIMARY KEY (`noteid`),
  KEY `closed` (`closed`,`pri`,`noteid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_notelist
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_pms`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_pms`;
CREATE TABLE `cdb_uc_pms` (
  `pmid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msgfrom` varchar(15) NOT NULL DEFAULT '',
  `msgfromid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `msgtoid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `folder` enum('inbox','outbox') NOT NULL DEFAULT 'inbox',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `subject` varchar(75) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `delstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `related` int(10) unsigned NOT NULL DEFAULT '0',
  `fromappid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmid`),
  KEY `msgtoid` (`msgtoid`,`folder`,`dateline`),
  KEY `msgfromid` (`msgfromid`,`folder`,`dateline`),
  KEY `related` (`related`),
  KEY `getnum` (`msgtoid`,`folder`,`delstatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_pms
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_protectedmembers`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_protectedmembers`;
CREATE TABLE `cdb_uc_protectedmembers` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(15) NOT NULL DEFAULT '',
  `appid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `admin` char(15) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_protectedmembers
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_settings`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_settings`;
CREATE TABLE `cdb_uc_settings` (
  `k` varchar(32) NOT NULL DEFAULT '',
  `v` text NOT NULL,
  PRIMARY KEY (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_settings
-- ----------------------------
INSERT INTO `cdb_uc_settings` VALUES ('accessemail', '');
INSERT INTO `cdb_uc_settings` VALUES ('censoremail', '');
INSERT INTO `cdb_uc_settings` VALUES ('censorusername', '');
INSERT INTO `cdb_uc_settings` VALUES ('dateformat', 'y-n-j');
INSERT INTO `cdb_uc_settings` VALUES ('doublee', '1');
INSERT INTO `cdb_uc_settings` VALUES ('nextnotetime', '0');
INSERT INTO `cdb_uc_settings` VALUES ('timeoffset', '28800');
INSERT INTO `cdb_uc_settings` VALUES ('pmlimit1day', '100');
INSERT INTO `cdb_uc_settings` VALUES ('pmfloodctrl', '15');
INSERT INTO `cdb_uc_settings` VALUES ('pmcenter', '1');
INSERT INTO `cdb_uc_settings` VALUES ('sendpmseccode', '1');
INSERT INTO `cdb_uc_settings` VALUES ('pmsendregdays', '0');
INSERT INTO `cdb_uc_settings` VALUES ('maildefault', 'username@21cn.com');
INSERT INTO `cdb_uc_settings` VALUES ('mailsend', '1');
INSERT INTO `cdb_uc_settings` VALUES ('mailserver', 'smtp.21cn.com');
INSERT INTO `cdb_uc_settings` VALUES ('mailport', '25');
INSERT INTO `cdb_uc_settings` VALUES ('mailauth', '1');
INSERT INTO `cdb_uc_settings` VALUES ('mailfrom', 'UCenter <username@21cn.com>');
INSERT INTO `cdb_uc_settings` VALUES ('mailauth_username', 'username@21cn.com');
INSERT INTO `cdb_uc_settings` VALUES ('mailauth_password', 'password');
INSERT INTO `cdb_uc_settings` VALUES ('maildelimiter', '0');
INSERT INTO `cdb_uc_settings` VALUES ('mailusername', '1');
INSERT INTO `cdb_uc_settings` VALUES ('mailsilent', '1');
INSERT INTO `cdb_uc_settings` VALUES ('version', '1.5.0');

-- ----------------------------
-- Table structure for `cdb_uc_sqlcache`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_sqlcache`;
CREATE TABLE `cdb_uc_sqlcache` (
  `sqlid` char(6) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL,
  `expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sqlid`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_sqlcache
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_tags`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_tags`;
CREATE TABLE `cdb_uc_tags` (
  `tagname` char(20) NOT NULL,
  `appid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `data` mediumtext,
  `expiration` int(10) unsigned NOT NULL,
  KEY `tagname` (`tagname`,`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_tags
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_uc_vars`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_uc_vars`;
CREATE TABLE `cdb_uc_vars` (
  `name` char(32) NOT NULL DEFAULT '',
  `value` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_uc_vars
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_usergroups`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_usergroups`;
CREATE TABLE `cdb_usergroups` (
  `groupid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `radminid` tinyint(3) NOT NULL DEFAULT '0',
  `type` enum('system','special','member') NOT NULL DEFAULT 'member',
  `system` char(8) NOT NULL DEFAULT 'private',
  `grouptitle` char(30) NOT NULL DEFAULT '',
  `creditshigher` int(10) NOT NULL DEFAULT '0',
  `creditslower` int(10) NOT NULL DEFAULT '0',
  `stars` tinyint(3) NOT NULL DEFAULT '0',
  `color` char(7) NOT NULL DEFAULT '',
  `groupavatar` char(60) NOT NULL DEFAULT '',
  `readaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowreply` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostpoll` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostreward` tinyint(1) NOT NULL DEFAULT '0',
  `allowposttrade` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostactivity` tinyint(1) NOT NULL DEFAULT '0',
  `allowdirectpost` tinyint(1) NOT NULL DEFAULT '0',
  `allowgetattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowpostattach` tinyint(1) NOT NULL DEFAULT '0',
  `allowvote` tinyint(1) NOT NULL DEFAULT '0',
  `allowmultigroups` tinyint(1) NOT NULL DEFAULT '0',
  `allowsearch` tinyint(1) NOT NULL DEFAULT '0',
  `allowcstatus` tinyint(1) NOT NULL DEFAULT '0',
  `allowuseblog` tinyint(1) NOT NULL DEFAULT '0',
  `allowinvisible` tinyint(1) NOT NULL DEFAULT '0',
  `allowtransfer` tinyint(1) NOT NULL DEFAULT '0',
  `allowsetreadperm` tinyint(1) NOT NULL DEFAULT '0',
  `allowsetattachperm` tinyint(1) NOT NULL DEFAULT '0',
  `allowhidecode` tinyint(1) NOT NULL DEFAULT '0',
  `allowhtml` tinyint(1) NOT NULL DEFAULT '0',
  `allowcusbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowanonymous` tinyint(1) NOT NULL DEFAULT '0',
  `allownickname` tinyint(1) NOT NULL DEFAULT '0',
  `allowsigbbcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowsigimgcode` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewpro` tinyint(1) NOT NULL DEFAULT '0',
  `allowviewstats` tinyint(1) NOT NULL DEFAULT '0',
  `disableperiodctrl` tinyint(1) NOT NULL DEFAULT '0',
  `reasonpm` tinyint(1) NOT NULL DEFAULT '0',
  `maxprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxsigsize` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxattachsize` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxsizeperday` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpostsperhour` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attachextensions` char(100) NOT NULL DEFAULT '',
  `raterange` char(150) NOT NULL DEFAULT '',
  `mintradeprice` smallint(6) unsigned NOT NULL DEFAULT '1',
  `maxtradeprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `minrewardprice` smallint(6) NOT NULL DEFAULT '1',
  `maxrewardprice` smallint(6) NOT NULL DEFAULT '0',
  `magicsdiscount` tinyint(1) NOT NULL,
  `allowmagics` tinyint(1) unsigned NOT NULL,
  `maxmagicsweight` smallint(6) unsigned NOT NULL,
  `allowbiobbcode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowbioimgcode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxbiosize` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowinvite` tinyint(1) NOT NULL DEFAULT '0',
  `allowmailinvite` tinyint(1) NOT NULL DEFAULT '0',
  `maxinvitenum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `inviteprice` smallint(6) unsigned NOT NULL DEFAULT '0',
  `maxinviteday` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowpostdebate` tinyint(1) NOT NULL DEFAULT '0',
  `tradestick` tinyint(1) unsigned NOT NULL,
  `exempt` tinyint(1) unsigned NOT NULL,
  `allowsendpm` tinyint(1) NOT NULL DEFAULT '1',
  `maxattachnum` smallint(6) NOT NULL DEFAULT '0',
  `allowposturl` tinyint(1) NOT NULL DEFAULT '3',
  `allowrecommend` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `edittimelimit` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowpostrushreply` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `creditsrange` (`creditshigher`,`creditslower`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_usergroups
-- ----------------------------
INSERT INTO `cdb_usergroups` VALUES ('1', '1', 'system', 'private', '管理员', '0', '0', '9', '', '', '200', '1', '1', '1', '1', '1', '1', '1', '3', '1', '1', '1', '1', '2', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '0', '30', '500', '2048000', '0', '0', '', '1	-30	30	500', '1', '0', '1', '0', '0', '2', '200', '2', '2', '0', '0', '0', '0', '0', '0', '1', '5', '255', '1', '0', '3', '1', '0', '1');
INSERT INTO `cdb_usergroups` VALUES ('2', '2', 'system', 'private', '超级版主', '0', '0', '8', '', '', '150', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '0', '1', '1', '1', '1', '1', '1', '0', '20', '300', '2048000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '1	-15	15	50', '1', '0', '1', '0', '0', '2', '180', '2', '2', '0', '0', '0', '0', '0', '0', '1', '5', '255', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('3', '3', 'system', 'private', '版主', '0', '0', '7', '', '', '100', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '0', '1', '0', '1', '1', '1', '1', '1', '1', '0', '10', '200', '2048000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '1	-10	10	30', '1', '0', '1', '0', '0', '2', '160', '2', '2', '0', '0', '0', '0', '0', '0', '1', '5', '224', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('4', '0', 'system', 'private', '禁止发言', '0', '0', '0', '', '', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('5', '0', 'system', 'private', '禁止访问', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('6', '0', 'system', 'private', '禁止 IP', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('7', '0', 'system', 'private', '游客', '0', '0', '0', '', '', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'gif,jpg,jpeg,png', '', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('8', '0', 'system', 'private', '等待验证会员', '0', '0', '0', '', '', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '', '', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('9', '0', 'member', 'private', '乞丐', '-9999999', '0', '0', '', '', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', 'chm,pdf,zip,rar,tar,gz,bzip2,gif,jpg,jpeg,png', '', '1', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('10', '0', 'member', 'private', '新手上路', '0', '50', '1', '', '', '10', '1', '1', '1', '0', '0', '1', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0', '0', '0', '0', '80', '1024000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '', '1', '0', '1', '0', '0', '1', '40', '1', '1', '0', '0', '0', '0', '0', '0', '1', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('11', '0', 'member', 'private', '注册会员', '50', '200', '2', '', '', '20', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '0', '0', '100', '1024000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '', '1', '0', '1', '0', '0', '1', '60', '1', '1', '0', '0', '0', '0', '0', '0', '1', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('12', '0', 'member', 'private', '中级会员', '200', '500', '3', '', '', '30', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '1', '1', '0', '0', '0', '150', '1024000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '', '1', '0', '1', '0', '0', '1', '80', '1', '1', '0', '0', '0', '0', '0', '0', '1', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('13', '0', 'member', 'private', '高级会员', '500', '1000', '4', '', '', '50', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '1', '0', '1', '1', '0', '0', '0', '200', '2048000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '1	-10	10	30', '1', '0', '1', '0', '0', '2', '100', '2', '2', '0', '0', '0', '0', '0', '0', '1', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('14', '0', 'member', 'private', '金牌会员', '1000', '3000', '6', '', '', '70', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '1', '1', '0', '0', '0', '1', '1', '0', '0', '1', '0', '1', '1', '1', '1', '1', '0', '0', '0', '300', '2048000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '1	-15	15	40', '1', '0', '1', '0', '0', '2', '120', '2', '2', '0', '0', '0', '0', '0', '0', '1', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('15', '0', 'member', 'private', '论坛元老', '3000', '9999999', '8', '', '', '90', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '1', '1', '0', '1', '0', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '500', '2048000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '1	-20	20	50', '1', '0', '1', '0', '0', '2', '140', '2', '2', '0', '0', '0', '0', '0', '0', '1', '5', '0', '1', '0', '3', '1', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('16', '3', 'special', 'private', '实习版主', '0', '0', '7', '', '', '100', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '0', '1', '0', '1', '1', '1', '1', '1', '1', '0', '10', '200', '2048000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '1 -10 10 30', '1', '0', '1', '0', '0', '2', '160', '1', '1', '0', '0', '0', '0', '0', '10', '1', '5', '188', '1', '0', '3', '0', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('17', '2', 'special', 'private', '网站编辑', '0', '0', '8', '', '', '150', '1', '1', '1', '1', '1', '1', '1', '3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '0', '1', '1', '1', '1', '1', '1', '0', '20', '300', '2048000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '1 -15 15 50', '1', '0', '1', '0', '0', '2', '180', '1', '1', '0', '0', '0', '0', '0', '10', '1', '5', '255', '1', '0', '3', '0', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('18', '1', 'special', 'private', '信息监察员', '0', '0', '9', '', '', '200', '1', '1', '1', '1', '1', '1', '1', '3', '1', '1', '1', '1', '2', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '30', '500', '0', '0', '1', '', '1 -30 30 400 2 -30 30 400 3 -30 30 4000', '1', '0', '1', '0', '0', '2', '200', '1', '1', '0', '1', '1', '0', '1', '10', '1', '5', '255', '1', '0', '3', '3', '0', '0');
INSERT INTO `cdb_usergroups` VALUES ('19', '3', 'special', 'private', '审核员', '0', '0', '7', '', '', '100', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '1', '1', '0', '1', '0', '1', '1', '1', '1', '1', '1', '0', '10', '200', '2048000', '0', '0', 'chm, pdf, zip, rar, tar, gz, bzip2, gif, jpg, jpeg, png', '1 -10 10 30', '1', '0', '1', '0', '0', '2', '160', '1', '1', '0', '0', '0', '0', '0', '10', '1', '5', '188', '1', '0', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for `cdb_validating`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_validating`;
CREATE TABLE `cdb_validating` (
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `submitdate` int(10) unsigned NOT NULL DEFAULT '0',
  `moddate` int(10) unsigned NOT NULL DEFAULT '0',
  `admin` varchar(15) NOT NULL DEFAULT '',
  `submittimes` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_validating
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_warnings`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_warnings`;
CREATE TABLE `cdb_warnings` (
  `wid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `operatorid` mediumint(8) unsigned NOT NULL,
  `operator` char(15) NOT NULL,
  `authorid` mediumint(8) unsigned NOT NULL,
  `author` char(15) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  `reason` char(40) NOT NULL,
  PRIMARY KEY (`wid`),
  UNIQUE KEY `pid` (`pid`),
  KEY `authorid` (`authorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_warnings
-- ----------------------------

-- ----------------------------
-- Table structure for `cdb_words`
-- ----------------------------
DROP TABLE IF EXISTS `cdb_words`;
CREATE TABLE `cdb_words` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin` varchar(15) NOT NULL DEFAULT '',
  `find` varchar(255) NOT NULL DEFAULT '',
  `replacement` varchar(255) NOT NULL DEFAULT '',
  `extra` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cdb_words
-- ----------------------------
