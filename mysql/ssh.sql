--create or replace database ssh;
use ssh;
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `generator_table`;
CREATE TABLE `generator_table` (
  `g_key` varchar(100) NOT NULL,
  `g_value` int(11) default NULL,
  PRIMARY KEY  (`g_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `generator_table` VALUES ('ssh_role_pk', '3');
INSERT INTO `generator_table` VALUES ('ssh_user_pk', '4');
INSERT INTO `generator_table` VALUES ('ssh_log_pk', '5');

DROP TABLE IF EXISTS `ssh_role`;
CREATE TABLE `ssh_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ssh_role` VALUES ('1', 'root');
INSERT INTO `ssh_role` VALUES ('2', 'system manager');

DROP TABLE IF EXISTS `ssh_user`;
CREATE TABLE `ssh_user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `role_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ssh_user` VALUES ('1', 'Lily','root', '1');
INSERT INTO `ssh_user` VALUES ('2', 'Nana','root', '2');
INSERT INTO `ssh_user` VALUES ('3', 'John','root', '1');


INSERT INTO `generator_table` VALUES ('ssh_beautiful_pk', '5');
DROP TABLE IF EXISTS `ssh_beautiful`;
CREATE TABLE `ssh_beautiful` (
  `id` int(11) NOT NULL,
  `name` varchar(20) default NULL,
  `note` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `ssh_beautiful` VALUES ('1', 'beautiful','a beautiful bean');


DROP TABLE IF EXISTS `ssh_log`;
CREATE TABLE `ssh_log` (
  `id` int(11) NOT NULL,
  `userid` int(11) default NULL,
  `loginname` varchar(20) default NULL,
  `methodname` varchar(20) default NULL,
  `model` varchar(20) default NULL,
  `logtime` datetime NULL default NULL,
  `success` bit(1) default 1,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
