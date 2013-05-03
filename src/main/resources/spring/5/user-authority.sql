
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `USERNAME` varchar(10) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  `ENABLED` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` VALUES ('admin', 'secret', '1');
INSERT INTO `users` VALUES ('user1', '111111', '1');
INSERT INTO `users` VALUES ('user2', '111111', '0');

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `USERNAME` varchar(10) DEFAULT NULL,
  `AUTHORITY` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `authorities` VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO `authorities` VALUES ('admin', 'ROLE_USER');
INSERT INTO `authorities` VALUES ('user1', 'ROLE_USER');

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userid` bigint(20) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_role` VALUES ('32', 'ROLE_USER');
INSERT INTO `user_role` VALUES ('32', 'ROLE_ADMIN');
INSERT INTO `user_role` VALUES ('1', 'ROLE_USER');