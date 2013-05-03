/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : leadfar

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2013-04-08 17:05:46
*/

SET FOREIGN_KEY_CHECKS=0;

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
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  CONSTRAINT `FK_DEPLPROP_DEPL` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_deployprop
-- ----------------------------

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
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `FK_EXEC_PARENT` (`PARENT_`),
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `IDX_EXEC_PARENT` (`PARENT_`),
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`),
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
  KEY `FK_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HTI_HTASK` (`HTASK_`),
  KEY `IDX_HTI_HTASK` (`HTASK_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`),
  CONSTRAINT `FK_HACTI_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HTI_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_actinst
-- ----------------------------

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
  KEY `FK_HDETAIL_HVAR` (`HVAR_`),
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HTASK` (`HTASK_`),
  KEY `FK_HDETAIL_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HVAR` (`HVAR_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`),
  KEY `IDX_HDET_HTASK` (`HTASK_`),
  KEY `IDX_HDET_HPROCI` (`HPROCI_`),
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
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`),
  KEY `IDX_HSUPERT_SUB` (`SUPERTASK_`),
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
  KEY `FK_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HTASK` (`HTASK_`),
  KEY `IDX_HVAR_HTASK` (`HTASK_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`),
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
  KEY `FK_GROUP_PARENT` (`PARENT_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`),
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
  KEY `FK_MEM_GROUP` (`GROUP_`),
  KEY `FK_MEM_USER` (`USER_`),
  KEY `IDX_MEM_GROUP` (`GROUP_`),
  KEY `IDX_MEM_USER` (`USER_`),
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
  KEY `FK_JOB_CFG` (`CFG_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`),
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`),
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`),
  KEY `IDX_JOB_CFG` (`CFG_`),
  KEY `IDX_JOB_EXE` (`EXECUTION_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
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
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  CONSTRAINT `FK_LOB_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_lob
-- ----------------------------

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
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_PART_TASK` (`TASK_`),
  KEY `IDX_PART_TASK` (`TASK_`),
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
INSERT INTO `jbpm4_property` VALUES ('next.dbid', '0', '1');

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
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`),
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
  KEY `FK_TASK_SWIML` (`SWIMLANE_`),
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`),
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
  KEY `FK_VAR_EXESYS` (`EXESYS_`),
  KEY `FK_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_TASK` (`TASK_`),
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`),
  KEY `IDX_VAR_TASK` (`TASK_`),
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`),
  KEY `IDX_VAR_LOB` (`LOB_`),
  CONSTRAINT `FK_VAR_EXECUTION` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_EXESYS` FOREIGN KEY (`EXESYS_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_LOB` FOREIGN KEY (`LOB_`) REFERENCES `jbpm4_lob` (`DBID_`),
  CONSTRAINT `FK_VAR_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_variable
-- ----------------------------

-- ----------------------------
-- Table structure for `para_enum`
-- ----------------------------
DROP TABLE IF EXISTS `para_enum`;
CREATE TABLE `para_enum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `MAXLENGTH` int(11) DEFAULT NULL,
  `MINLENGTH` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SORTTYPE` int(11) DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of para_enum
-- ----------------------------

-- ----------------------------
-- Table structure for `para_enum_item`
-- ----------------------------
DROP TABLE IF EXISTS `para_enum_item`;
CREATE TABLE `para_enum_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) DEFAULT NULL,
  `DEFAULT_SELECTED` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ENUM_ID` bigint(20) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `READ_ONLY` int(11) DEFAULT NULL,
  `SORT_INDEX` bigint(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of para_enum_item
-- ----------------------------

-- ----------------------------
-- Table structure for `t_acl`
-- ----------------------------
DROP TABLE IF EXISTS `t_acl`;
CREATE TABLE `t_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `principalType` varchar(255) DEFAULT NULL,
  `principalId` int(11) DEFAULT NULL,
  `resourceType` varchar(255) DEFAULT NULL,
  `resourceId` int(11) DEFAULT NULL,
  `aclState` int(11) DEFAULT NULL,
  `aclTriState` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_acl
-- ----------------------------
INSERT INTO `t_acl` VALUES ('1', 'Role', '4', 'ActionResource', '1', '-1', '0');
INSERT INTO `t_acl` VALUES ('2', 'Role', '4', 'ActionResource', '10', '-1', '0');
INSERT INTO `t_acl` VALUES ('3', 'Role', '4', 'ActionResource', '11', '-1', '0');
INSERT INTO `t_acl` VALUES ('4', 'Role', '4', 'ActionResource', '2', '-1', '0');
INSERT INTO `t_acl` VALUES ('5', 'Role', '4', 'ActionResource', '5', '-1', '0');
INSERT INTO `t_acl` VALUES ('6', 'Role', '4', 'ActionResource', '9', '-1', '0');
INSERT INTO `t_acl` VALUES ('7', 'User', '63', 'ActionResource', '1', '-1', '0');
INSERT INTO `t_acl` VALUES ('8', 'User', '63', 'ActionResource', '10', '-1', '0');
INSERT INTO `t_acl` VALUES ('9', 'User', '63', 'ActionResource', '11', '-1', '0');
INSERT INTO `t_acl` VALUES ('10', 'User', '63', 'ActionResource', '2', '-1', '0');
INSERT INTO `t_acl` VALUES ('11', 'User', '63', 'ActionResource', '5', '-1', '0');
INSERT INTO `t_acl` VALUES ('12', 'User', '63', 'ActionResource', '9', '-1', '0');
INSERT INTO `t_acl` VALUES ('13', 'Role', '4', 'ActionResource', '6', '-1', '0');
INSERT INTO `t_acl` VALUES ('14', 'Role', '4', 'ActionResource', '3', '-1', '0');
INSERT INTO `t_acl` VALUES ('15', 'Role', '4', 'ActionResource', '4', '-1', '0');
INSERT INTO `t_acl` VALUES ('16', 'Role', '4', 'ActionResource', '8', '-1', '0');
INSERT INTO `t_acl` VALUES ('17', 'Role', '4', 'ActionResource', '7', '-1', '0');
INSERT INTO `t_acl` VALUES ('18', 'User', '63', 'ActionResource', '6', '-1', '0');
INSERT INTO `t_acl` VALUES ('19', 'User', '63', 'ActionResource', '3', '-1', '0');
INSERT INTO `t_acl` VALUES ('20', 'User', '63', 'ActionResource', '4', '-1', '0');
INSERT INTO `t_acl` VALUES ('21', 'User', '63', 'ActionResource', '8', '-1', '0');
INSERT INTO `t_acl` VALUES ('22', 'User', '63', 'ActionResource', '7', '-1', '0');
INSERT INTO `t_acl` VALUES ('23', 'Role', '4', 'Menu', '71', '-1', '0');
INSERT INTO `t_acl` VALUES ('24', 'Role', '4', 'Menu', '72', '-1', '0');
INSERT INTO `t_acl` VALUES ('25', 'Role', '4', 'Menu', '73', '-1', '0');
INSERT INTO `t_acl` VALUES ('26', 'Role', '4', 'Menu', '74', '-1', '0');
INSERT INTO `t_acl` VALUES ('27', 'Role', '4', 'Menu', '75', '-1', '0');
INSERT INTO `t_acl` VALUES ('28', 'Role', '4', 'Menu', '76', '-1', '0');
INSERT INTO `t_acl` VALUES ('29', 'Role', '4', 'Menu', '77', '-1', '0');
INSERT INTO `t_acl` VALUES ('30', 'Role', '4', 'Menu', '78', '-1', '0');
INSERT INTO `t_acl` VALUES ('31', 'Role', '4', 'Menu', '79', '-1', '0');
INSERT INTO `t_acl` VALUES ('32', 'Role', '4', 'Menu', '80', '-1', '0');
INSERT INTO `t_acl` VALUES ('33', 'Role', '4', 'Menu', '81', '-1', '0');
INSERT INTO `t_acl` VALUES ('34', 'Role', '4', 'Menu', '82', '-1', '0');
INSERT INTO `t_acl` VALUES ('35', 'Role', '4', 'Menu', '83', '-1', '0');
INSERT INTO `t_acl` VALUES ('36', 'User', '63', 'Menu', '71', '-1', '0');
INSERT INTO `t_acl` VALUES ('37', 'User', '63', 'Menu', '72', '-1', '0');
INSERT INTO `t_acl` VALUES ('38', 'User', '63', 'Menu', '73', '-1', '0');
INSERT INTO `t_acl` VALUES ('39', 'User', '63', 'Menu', '74', '-1', '0');
INSERT INTO `t_acl` VALUES ('40', 'User', '63', 'Menu', '75', '-1', '0');
INSERT INTO `t_acl` VALUES ('41', 'User', '63', 'Menu', '76', '-1', '0');
INSERT INTO `t_acl` VALUES ('42', 'User', '63', 'Menu', '77', '-1', '0');
INSERT INTO `t_acl` VALUES ('43', 'User', '63', 'Menu', '78', '-1', '0');
INSERT INTO `t_acl` VALUES ('44', 'User', '63', 'Menu', '79', '-1', '0');
INSERT INTO `t_acl` VALUES ('45', 'User', '63', 'Menu', '80', '-1', '0');
INSERT INTO `t_acl` VALUES ('46', 'User', '63', 'Menu', '81', '-1', '0');
INSERT INTO `t_acl` VALUES ('47', 'User', '63', 'Menu', '82', '-1', '0');
INSERT INTO `t_acl` VALUES ('48', 'User', '63', 'Menu', '83', '-1', '0');
INSERT INTO `t_acl` VALUES ('49', 'Role', '5', 'Menu', '1', '-1', '0');
INSERT INTO `t_acl` VALUES ('50', 'Role', '5', 'Menu', '2', '-1', '0');
INSERT INTO `t_acl` VALUES ('51', 'Role', '5', 'Menu', '3', '-1', '0');
INSERT INTO `t_acl` VALUES ('52', 'Role', '5', 'Menu', '4', '-1', '0');
INSERT INTO `t_acl` VALUES ('53', 'Role', '5', 'Menu', '5', '-1', '0');
INSERT INTO `t_acl` VALUES ('54', 'Role', '5', 'Menu', '6', '-1', '0');
INSERT INTO `t_acl` VALUES ('55', 'Role', '5', 'Menu', '7', '-1', '0');
INSERT INTO `t_acl` VALUES ('56', 'Role', '5', 'Menu', '8', '-1', '0');
INSERT INTO `t_acl` VALUES ('57', 'Role', '5', 'Menu', '9', '-1', '0');
INSERT INTO `t_acl` VALUES ('58', 'Role', '5', 'Menu', '10', '-1', '0');
INSERT INTO `t_acl` VALUES ('59', 'Role', '5', 'Menu', '11', '-1', '0');
INSERT INTO `t_acl` VALUES ('60', 'Role', '5', 'Menu', '12', '-1', '0');
INSERT INTO `t_acl` VALUES ('61', 'Role', '5', 'Menu', '13', '-1', '0');
INSERT INTO `t_acl` VALUES ('62', 'Role', '5', 'Menu', '14', '-1', '0');
INSERT INTO `t_acl` VALUES ('63', 'Role', '5', 'Menu', '15', '-1', '0');
INSERT INTO `t_acl` VALUES ('64', 'Role', '5', 'Menu', '16', '-1', '0');
INSERT INTO `t_acl` VALUES ('65', 'Role', '5', 'Menu', '17', '-1', '0');
INSERT INTO `t_acl` VALUES ('66', 'Role', '5', 'Menu', '18', '-1', '0');
INSERT INTO `t_acl` VALUES ('67', 'Role', '5', 'Menu', '19', '-1', '0');
INSERT INTO `t_acl` VALUES ('68', 'Role', '5', 'Menu', '20', '-1', '0');
INSERT INTO `t_acl` VALUES ('69', 'Role', '5', 'Menu', '21', '-1', '0');
INSERT INTO `t_acl` VALUES ('70', 'Role', '5', 'Menu', '22', '-1', '0');
INSERT INTO `t_acl` VALUES ('71', 'Role', '5', 'Menu', '23', '-1', '0');
INSERT INTO `t_acl` VALUES ('72', 'Role', '5', 'Menu', '24', '-1', '0');
INSERT INTO `t_acl` VALUES ('73', 'Role', '5', 'Menu', '25', '-1', '0');
INSERT INTO `t_acl` VALUES ('74', 'Role', '5', 'Menu', '26', '-1', '0');
INSERT INTO `t_acl` VALUES ('75', 'Role', '5', 'Menu', '27', '-1', '0');
INSERT INTO `t_acl` VALUES ('76', 'Role', '5', 'Menu', '28', '-1', '0');
INSERT INTO `t_acl` VALUES ('77', 'Role', '5', 'Menu', '29', '-1', '0');
INSERT INTO `t_acl` VALUES ('78', 'Role', '5', 'Menu', '30', '-1', '0');
INSERT INTO `t_acl` VALUES ('79', 'Role', '5', 'Menu', '31', '-1', '0');
INSERT INTO `t_acl` VALUES ('80', 'Role', '5', 'Menu', '32', '-1', '0');
INSERT INTO `t_acl` VALUES ('81', 'Role', '5', 'Menu', '33', '-1', '0');
INSERT INTO `t_acl` VALUES ('82', 'Role', '5', 'Menu', '34', '-1', '0');
INSERT INTO `t_acl` VALUES ('83', 'Role', '5', 'Menu', '35', '-1', '0');
INSERT INTO `t_acl` VALUES ('84', 'Role', '5', 'Menu', '36', '-1', '0');
INSERT INTO `t_acl` VALUES ('85', 'Role', '5', 'Menu', '37', '-1', '0');
INSERT INTO `t_acl` VALUES ('86', 'Role', '5', 'Menu', '38', '-1', '0');
INSERT INTO `t_acl` VALUES ('87', 'Role', '5', 'Menu', '39', '-1', '0');
INSERT INTO `t_acl` VALUES ('88', 'Role', '5', 'Menu', '40', '-1', '0');
INSERT INTO `t_acl` VALUES ('89', 'Role', '5', 'Menu', '41', '-1', '0');
INSERT INTO `t_acl` VALUES ('90', 'Role', '5', 'Menu', '42', '-1', '0');
INSERT INTO `t_acl` VALUES ('91', 'Role', '5', 'Menu', '43', '-1', '0');
INSERT INTO `t_acl` VALUES ('92', 'Role', '5', 'Menu', '44', '-1', '0');
INSERT INTO `t_acl` VALUES ('93', 'Role', '5', 'Menu', '45', '-1', '0');
INSERT INTO `t_acl` VALUES ('94', 'Role', '5', 'Menu', '46', '-1', '0');
INSERT INTO `t_acl` VALUES ('95', 'Role', '5', 'Menu', '47', '-1', '0');
INSERT INTO `t_acl` VALUES ('96', 'Role', '5', 'Menu', '48', '-1', '0');
INSERT INTO `t_acl` VALUES ('97', 'Role', '5', 'Menu', '49', '-1', '0');
INSERT INTO `t_acl` VALUES ('98', 'Role', '5', 'Menu', '50', '-1', '0');
INSERT INTO `t_acl` VALUES ('99', 'Role', '5', 'Menu', '51', '-1', '0');
INSERT INTO `t_acl` VALUES ('100', 'Role', '5', 'Menu', '52', '-1', '0');
INSERT INTO `t_acl` VALUES ('101', 'Role', '5', 'Menu', '53', '-1', '0');
INSERT INTO `t_acl` VALUES ('102', 'Role', '5', 'Menu', '54', '-1', '0');
INSERT INTO `t_acl` VALUES ('103', 'Role', '5', 'Menu', '55', '-1', '0');
INSERT INTO `t_acl` VALUES ('104', 'Role', '5', 'Menu', '56', '-1', '0');
INSERT INTO `t_acl` VALUES ('105', 'Role', '5', 'Menu', '57', '-1', '0');
INSERT INTO `t_acl` VALUES ('106', 'Role', '5', 'Menu', '58', '-1', '0');
INSERT INTO `t_acl` VALUES ('107', 'Role', '5', 'Menu', '59', '-1', '0');
INSERT INTO `t_acl` VALUES ('108', 'Role', '5', 'Menu', '60', '-1', '0');

-- ----------------------------
-- Table structure for `t_assay_data`
-- ----------------------------
DROP TABLE IF EXISTS `t_assay_data`;
CREATE TABLE `t_assay_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airAmount` int(11) NOT NULL,
  `dynaPower` int(11) NOT NULL,
  `firstOneDO` float NOT NULL,
  `firstTwoDO` float NOT NULL,
  `inBOD5` float NOT NULL,
  `inCODcr` float NOT NULL,
  `inNH3` float NOT NULL,
  `inOC` float NOT NULL,
  `inPH` float NOT NULL,
  `inSS` float NOT NULL,
  `inTS` float NOT NULL,
  `lightPower` int(11) NOT NULL,
  `midBOD5` float NOT NULL,
  `midOC` float NOT NULL,
  `midSS` float NOT NULL,
  `midTS` float NOT NULL,
  `outBOD5` float NOT NULL,
  `outCODcr` float NOT NULL,
  `outNH3` float NOT NULL,
  `outNO2` float NOT NULL,
  `outNO3` float NOT NULL,
  `outOC` float NOT NULL,
  `outPH` float NOT NULL,
  `outSS` float NOT NULL,
  `outTS` float NOT NULL,
  `processingFlow` int(11) DEFAULT NULL,
  `secondOneDO` float NOT NULL,
  `secondTwoDO` float NOT NULL,
  `waterTemp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_assay_data
-- ----------------------------

-- ----------------------------
-- Table structure for `t_entityproperty`
-- ----------------------------
DROP TABLE IF EXISTS `t_entityproperty`;
CREATE TABLE `t_entityproperty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `stringValue` varchar(255) DEFAULT NULL,
  `intValue` int(11) DEFAULT NULL,
  `longValue` bigint(20) DEFAULT NULL,
  `dateValue` datetime DEFAULT NULL,
  `fileValue` longblob,
  `fileValueFileName` varchar(255) DEFAULT NULL,
  `fileValueContentType` varchar(255) DEFAULT NULL,
  `workEntityId` int(11) DEFAULT NULL,
  `propertyName` varchar(255) DEFAULT NULL,
  `workApproveId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK43E68A03ABC88CA1` (`workEntityId`),
  KEY `FK43E68A03B710DFF5` (`workApproveId`),
  CONSTRAINT `FK43E68A03ABC88CA1` FOREIGN KEY (`workEntityId`) REFERENCES `t_workentity` (`id`),
  CONSTRAINT `FK43E68A03B710DFF5` FOREIGN KEY (`workApproveId`) REFERENCES `t_workapprove` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_entityproperty
-- ----------------------------

-- ----------------------------
-- Table structure for `t_form`
-- ----------------------------
DROP TABLE IF EXISTS `t_form`;
CREATE TABLE `t_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formName` varchar(255) DEFAULT NULL,
  `formKey` varchar(255) DEFAULT NULL,
  `formContent` longtext,
  `formTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB5CEDAF66CFB135` (`formTypeId`),
  CONSTRAINT `FKCB5CEDAF66CFB135` FOREIGN KEY (`formTypeId`) REFERENCES `t_formtype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_form
-- ----------------------------

-- ----------------------------
-- Table structure for `t_formtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_formtype`;
CREATE TABLE `t_formtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD2E8818932C54327` (`pid`),
  CONSTRAINT `FKD2E8818932C54327` FOREIGN KEY (`pid`) REFERENCES `t_formtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_formtype
-- ----------------------------
INSERT INTO `t_formtype` VALUES ('1', '业务表单', null, null);
INSERT INTO `t_formtype` VALUES ('2', '审批表单', null, null);

-- ----------------------------
-- Table structure for `t_leave_approve`
-- ----------------------------
DROP TABLE IF EXISTS `t_leave_approve`;
CREATE TABLE `t_leave_approve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approveContent` varchar(255) DEFAULT NULL,
  `approveTime` varchar(255) DEFAULT NULL,
  `pass` bit(1) DEFAULT NULL,
  `approver` int(11) DEFAULT NULL,
  `leaveForm` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK11E3493AB43D450E` (`approver`),
  KEY `FK11E3493A8074B058` (`leaveForm`),
  CONSTRAINT `FK11E3493A8074B058` FOREIGN KEY (`leaveForm`) REFERENCES `t_leave_form` (`id`),
  CONSTRAINT `FK11E3493AB43D450E` FOREIGN KEY (`approver`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leave_approve
-- ----------------------------

-- ----------------------------
-- Table structure for `t_leave_form`
-- ----------------------------
DROP TABLE IF EXISTS `t_leave_form`;
CREATE TABLE `t_leave_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leaveTime` varchar(255) DEFAULT NULL,
  `leaveContent` varchar(255) DEFAULT NULL,
  `leaveDays` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `approver` int(11) DEFAULT NULL,
  `leaver` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBB8E55F7B43D450E` (`approver`),
  KEY `FKBB8E55F72BA066E4` (`leaver`),
  CONSTRAINT `FKBB8E55F72BA066E4` FOREIGN KEY (`leaver`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKBB8E55F7B43D450E` FOREIGN KEY (`approver`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leave_form
-- ----------------------------

-- ----------------------------
-- Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `OPERATETYPE` varchar(255) DEFAULT NULL,
  `OPERATOR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `orderNumber` int(11) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `display` bit(1) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB5FF64A6D95B968` (`pid`),
  CONSTRAINT `FKCB5FF64A6D95B968` FOREIGN KEY (`pid`) REFERENCES `t_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '个人办公', null, '1', 'personal', '', null);
INSERT INTO `t_menu` VALUES ('2', '请假', null, '1', null, '', '1');
INSERT INTO `t_menu` VALUES ('3', '填写请假单', 'office/leave!addInput.action', '10', null, '', '2');
INSERT INTO `t_menu` VALUES ('4', '我的请假单', 'office/leave!myLeave.action', '11', null, '', '2');
INSERT INTO `t_menu` VALUES ('5', '待审请假单', 'office/leave!approvingLeave.action', '12', null, '', '2');
INSERT INTO `t_menu` VALUES ('6', '已审请假单', 'office/leave!approvedLeave.action', '13', null, '', '2');
INSERT INTO `t_menu` VALUES ('7', '桌面', null, '11', null, '', '1');
INSERT INTO `t_menu` VALUES ('8', '我的桌面', null, '111', null, '', '7');
INSERT INTO `t_menu` VALUES ('9', '桌面配置', null, '112', null, '', '7');
INSERT INTO `t_menu` VALUES ('10', '任务计划', null, '12', null, '', '1');
INSERT INTO `t_menu` VALUES ('11', '创建计划', null, '121', null, '', '10');
INSERT INTO `t_menu` VALUES ('12', '查询计划', null, '122', null, '', '10');
INSERT INTO `t_menu` VALUES ('13', '计划分类', null, '123', null, '', '10');
INSERT INTO `t_menu` VALUES ('14', '日程安排', null, '13', null, '', '1');
INSERT INTO `t_menu` VALUES ('15', '创建日程', null, '131', null, '', '14');
INSERT INTO `t_menu` VALUES ('16', '查询日程', null, '132', null, '', '14');
INSERT INTO `t_menu` VALUES ('17', '日程分类', null, '133', null, '', '14');
INSERT INTO `t_menu` VALUES ('18', '日志管理', null, '14', null, '', '1');
INSERT INTO `t_menu` VALUES ('19', '创建日志', null, '141', null, '', '18');
INSERT INTO `t_menu` VALUES ('20', '我的日志', null, '142', null, '', '18');
INSERT INTO `t_menu` VALUES ('21', '共享日志', null, '143', null, '', '18');
INSERT INTO `t_menu` VALUES ('22', '日志分类', null, '144', null, '', '18');
INSERT INTO `t_menu` VALUES ('23', '工作报告', null, '15', null, '', '1');
INSERT INTO `t_menu` VALUES ('24', '编写报告', null, '151', null, '', '23');
INSERT INTO `t_menu` VALUES ('25', '查询报告', null, '152', null, '', '23');
INSERT INTO `t_menu` VALUES ('26', '电子邮件', null, '16', null, '', '1');
INSERT INTO `t_menu` VALUES ('27', '收件箱', null, '161', null, '', '26');
INSERT INTO `t_menu` VALUES ('28', '发件箱', null, '162', null, '', '26');
INSERT INTO `t_menu` VALUES ('29', '参数配置', null, '163', null, '', '26');
INSERT INTO `t_menu` VALUES ('30', '消息管理', null, '17', null, '', '1');
INSERT INTO `t_menu` VALUES ('31', '发送消息', null, '171', null, '', '30');
INSERT INTO `t_menu` VALUES ('32', '已接收消息', null, '172', null, '', '30');
INSERT INTO `t_menu` VALUES ('33', '已发送消息', null, '173', null, '', '30');
INSERT INTO `t_menu` VALUES ('34', '已删除消息', null, '173', null, '', '30');
INSERT INTO `t_menu` VALUES ('35', '手机短信', null, '18', null, '', '1');
INSERT INTO `t_menu` VALUES ('36', '发送手机短信', null, '181', null, '', '35');
INSERT INTO `t_menu` VALUES ('37', '已接收短信', null, '182', null, '', '35');
INSERT INTO `t_menu` VALUES ('38', '已发送短信', null, '183', null, '', '35');
INSERT INTO `t_menu` VALUES ('39', '短信网关配置', null, '184', null, '', '35');
INSERT INTO `t_menu` VALUES ('40', '通信录', null, '19', null, '', '1');
INSERT INTO `t_menu` VALUES ('41', '私人通信录', null, '191', null, '', '40');
INSERT INTO `t_menu` VALUES ('42', '公共通信录', null, '192', null, '', '40');
INSERT INTO `t_menu` VALUES ('43', '网络硬盘', null, '20', null, '', '1');
INSERT INTO `t_menu` VALUES ('44', '公共空间', null, '201', null, '', '43');
INSERT INTO `t_menu` VALUES ('45', '私人空间', null, '202', null, '', '43');
INSERT INTO `t_menu` VALUES ('46', '个人设置', null, '21', null, '', '1');
INSERT INTO `t_menu` VALUES ('47', '个人信息', null, '211', null, '', '46');
INSERT INTO `t_menu` VALUES ('48', '修改密码', null, '212', null, '', '46');
INSERT INTO `t_menu` VALUES ('49', '工作状态', null, '213', null, '', '46');
INSERT INTO `t_menu` VALUES ('50', '在线状态', null, '214', null, '', '46');
INSERT INTO `t_menu` VALUES ('51', '工作流', null, '2', 'workflow', '', null);
INSERT INTO `t_menu` VALUES ('52', '表单定义', 'workflow/formType.action', '21', null, '', '51');
INSERT INTO `t_menu` VALUES ('53', '流程定义', null, '22', null, '', '51');
INSERT INTO `t_menu` VALUES ('54', '管理流程定义', 'jbpmeditor/p/explorer', '221', null, '', '53');
INSERT INTO `t_menu` VALUES ('55', '部署流程定义', 'workflow/process!list.action', '222', null, '', '53');
INSERT INTO `t_menu` VALUES ('56', '任务管理', null, '23', null, '', '51');
INSERT INTO `t_menu` VALUES ('57', '新建任务', 'workflow/workentity!selectProcess.action', '231', null, '', '56');
INSERT INTO `t_menu` VALUES ('58', '我的任务', 'workflow/workentity!listMyCreatedWorkEntities.action', '232', null, '', '56');
INSERT INTO `t_menu` VALUES ('59', '待办任务', 'workflow/workentity!listMyWaitingWorkEntities.action', '233', null, '', '56');
INSERT INTO `t_menu` VALUES ('60', '已办任务', 'workflow/workentity!listMyDealedWorkEntities.action', '234', null, '', '56');
INSERT INTO `t_menu` VALUES ('61', '行政办公', null, '3', 'office', '', null);
INSERT INTO `t_menu` VALUES ('62', '公告通知', null, '31', null, '', '61');
INSERT INTO `t_menu` VALUES ('63', '发布公告', null, '311', null, '', '62');
INSERT INTO `t_menu` VALUES ('64', '查阅历史公告', null, '312', null, '', '62');
INSERT INTO `t_menu` VALUES ('65', '公告分类', null, '313', null, '', '62');
INSERT INTO `t_menu` VALUES ('66', '会议管理', null, '32', null, '', '61');
INSERT INTO `t_menu` VALUES ('67', '车辆管理', null, '33', null, '', '61');
INSERT INTO `t_menu` VALUES ('68', '图书管理', null, '34', null, '', '61');
INSERT INTO `t_menu` VALUES ('69', '设备管理', null, '35', null, '', '61');
INSERT INTO `t_menu` VALUES ('70', '用品管理', null, '36', null, '', '61');
INSERT INTO `t_menu` VALUES ('71', '系统管理', null, '4', 'system', '', null);
INSERT INTO `t_menu` VALUES ('72', '组织机构管理', null, '41', null, '', '71');
INSERT INTO `t_menu` VALUES ('73', '单位/公司信息设置', 'system/company!saveInput.action', '411', null, '', '72');
INSERT INTO `t_menu` VALUES ('74', '部门/岗位设置', 'system/party.action', '412', null, '', '72');
INSERT INTO `t_menu` VALUES ('75', '人员管理', 'system/person.action', '413', null, '', '72');
INSERT INTO `t_menu` VALUES ('76', '权限管理', null, '42', null, '', '71');
INSERT INTO `t_menu` VALUES ('77', '用户管理', 'system/user.action', '421', null, '', '76');
INSERT INTO `t_menu` VALUES ('78', '角色管理', 'system/role.action', '422', null, '', '76');
INSERT INTO `t_menu` VALUES ('79', '菜单管理', 'system/menu.action', '423', null, '', '76');
INSERT INTO `t_menu` VALUES ('80', '资源管理', 'system/resource.action', '424', null, '', '76');
INSERT INTO `t_menu` VALUES ('81', '用户授权', 'system/acl!userAuthIndex.action', '425', null, '', '76');
INSERT INTO `t_menu` VALUES ('82', '角色授权', 'system/acl!roleAuthIndex.action', '426', null, '', '76');
INSERT INTO `t_menu` VALUES ('83', '部门/岗位授权', 'system/acl!partyAuthIndex.action', '427', null, '', '76');
INSERT INTO `t_menu` VALUES ('84', '档案管理', null, '5', null, '', null);
INSERT INTO `t_menu` VALUES ('85', '卷库分类', null, '51', null, '', '84');
INSERT INTO `t_menu` VALUES ('86', '创建分类', null, '511', null, '', '85');
INSERT INTO `t_menu` VALUES ('87', '查询已有分类', null, '512', null, '', '85');
INSERT INTO `t_menu` VALUES ('88', '案卷分类', null, '52', null, '', '84');
INSERT INTO `t_menu` VALUES ('89', '创建新的分类', null, '521', null, '', '88');
INSERT INTO `t_menu` VALUES ('90', '查询已有案卷', null, '522', null, '', '88');
INSERT INTO `t_menu` VALUES ('91', '档案维护', null, '53', null, '', '84');
INSERT INTO `t_menu` VALUES ('92', '档案查阅', null, '54', null, '', '84');
INSERT INTO `t_menu` VALUES ('93', '申请档案查阅', null, '541', null, '', '92');
INSERT INTO `t_menu` VALUES ('94', '审批档案查阅申请', null, '542', null, '', '92');
INSERT INTO `t_menu` VALUES ('95', '查阅档案', null, '543', null, '', '92');
INSERT INTO `t_menu` VALUES ('96', '内部论坛', null, '6', null, '', null);
INSERT INTO `t_menu` VALUES ('97', '板块交流', null, '61', null, '', '96');
INSERT INTO `t_menu` VALUES ('98', 'Java技术园地', null, '611', null, '', '97');
INSERT INTO `t_menu` VALUES ('99', '灌水专区', null, '612', null, '', '97');
INSERT INTO `t_menu` VALUES ('100', '论坛设置', null, '62', null, '', '96');
INSERT INTO `t_menu` VALUES ('101', '知识管理', null, '7', null, '', null);
INSERT INTO `t_menu` VALUES ('102', '知识分类', null, '71', null, '', '101');
INSERT INTO `t_menu` VALUES ('103', '创建新的分类', null, '711', null, '', '102');
INSERT INTO `t_menu` VALUES ('104', '查询已有分类', null, '712', null, '', '102');
INSERT INTO `t_menu` VALUES ('105', '知识维护', null, '72', null, '', '101');
INSERT INTO `t_menu` VALUES ('106', '创建新的知识', null, '721', null, '', '105');
INSERT INTO `t_menu` VALUES ('107', '查询已有知识', null, '722', null, '', '105');

-- ----------------------------
-- Table structure for `t_party`
-- ----------------------------
DROP TABLE IF EXISTS `t_party`;
CREATE TABLE `t_party` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_type` char(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `snumber` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `duty` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `msn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA0C7575B451729B3` (`pid`),
  CONSTRAINT `FKA0C7575B451729B3` FOREIGN KEY (`pid`) REFERENCES `t_party` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_party
-- ----------------------------
INSERT INTO `t_party` VALUES ('1', 'C', '北京领航致远科技有限公司', '北京领航致远科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('2', 'D', '总裁办', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('3', 'S', '总裁', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('4', 'P', '赵一', null, '3', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('5', 'S', '副总裁', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('6', 'P', '钱二', null, '5', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('7', 'D', '综合部', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('8', 'S', '综合部经理', null, '7', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('9', 'P', '孙三', null, '8', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('10', 'D', '财务部', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('11', 'S', '财务部经理', null, '10', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('12', 'P', '李四', null, '11', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('13', 'S', '会计', null, '10', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('14', 'P', '周五', null, '13', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('15', 'S', '出纳', null, '10', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('16', 'P', '吴六', null, '15', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('17', 'D', '行政办公室', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('18', 'S', '前台接待', null, '17', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('19', 'P', '郑七', null, '18', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('20', 'D', '发展战略部', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('21', 'D', '计划部', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('22', 'D', '人力资源部', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('23', 'S', '人力资源总监', null, '22', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('24', 'P', '王八', null, '23', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('25', 'D', '市场部', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('26', 'S', '市场总监', null, '25', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('27', 'P', '冯九', null, '26', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('28', 'S', '高级助理', null, '25', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('29', 'P', '陈十', null, '28', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('30', 'S', '文案策划', null, '25', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('31', 'P', '褚一一', null, '30', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('32', 'S', '推广专员', null, '25', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('33', 'P', '卫一二', null, '32', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('34', 'D', '销售部', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('35', 'S', '销售总监', null, '34', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('36', 'P', '蒋一三', null, '35', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('37', 'S', '销售经理', null, '34', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('38', 'P', '沈一四', null, '37', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('39', 'P', '韩一五', null, '37', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('40', 'P', '杨一六', null, '37', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('41', 'D', '培训中心', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('42', 'S', '培训主管', null, '41', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('43', 'P', '朱一七', null, '42', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('44', 'S', '资深讲师', null, '41', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('45', 'P', '秦一八', null, '44', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('46', 'D', '技术部', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('47', 'S', '技术部经理', null, '46', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('48', 'P', '尤一九', null, '47', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('49', 'S', '高级工程师', null, '46', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('50', 'P', '许二年', null, '49', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('51', 'P', '何二一', null, '49', null, null, null, null, null, null, null, null, '女', null, null, null, null);
INSERT INTO `t_party` VALUES ('52', 'S', '高级美工', null, '46', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('53', 'P', '吕不韦', null, '52', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('54', 'D', '客户服务部', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('55', 'S', '客服部经理', null, '54', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('56', 'P', '施明德', null, '55', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('57', 'S', '客服工程师', null, '54', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('58', 'P', '张飞', null, '57', null, null, null, null, null, null, null, null, '男', null, null, null, null);
INSERT INTO `t_party` VALUES ('59', 'P', '孔明', null, '57', null, null, null, null, null, null, null, null, '女', null, null, null, null);
INSERT INTO `t_party` VALUES ('60', 'C', '上海分公司', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('61', 'C', '广州分公司', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('62', 'C', '香港分公司', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_party` VALUES ('63', 'P', '超级管理员', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_processfile`
-- ----------------------------
DROP TABLE IF EXISTS `t_processfile`;
CREATE TABLE `t_processfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filePath` varchar(255) DEFAULT NULL,
  `latestUpdateTime` bigint(20) DEFAULT NULL,
  `processKey` varchar(255) DEFAULT NULL,
  `processName` varchar(255) DEFAULT NULL,
  `processVersion` int(11) DEFAULT NULL,
  `processDefinitionId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filePath` (`filePath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_processfile
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `parentSn` varchar(255) DEFAULT NULL,
  `orderNumber` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FKA25837799FB32EED` (`pid`),
  CONSTRAINT `FKA25837799FB32EED` FOREIGN KEY (`pid`) REFERENCES `t_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('1', null, '权限操作', 'security', null, '60', null);
INSERT INTO `t_resource` VALUES ('2', 'cn.com.leadfar.oa.web.actions.AssayDataAction', '数据录入', 'assayData', 'security', '90', '1');
INSERT INTO `t_resource` VALUES ('3', 'cn.com.leadfar.oa.web.actions.CompanyAction', '公司操作', 'company', 'party', '20', '6');
INSERT INTO `t_resource` VALUES ('4', 'cn.com.leadfar.oa.web.actions.DepartmentAction', '部门操作', 'department', 'party', '30', '6');
INSERT INTO `t_resource` VALUES ('5', 'cn.com.leadfar.oa.web.actions.MenuAction', '菜单操作', 'menu', 'security', '90', '1');
INSERT INTO `t_resource` VALUES ('6', 'cn.com.leadfar.oa.web.actions.PartyAction', '组织机构操作', 'party', '', '10', null);
INSERT INTO `t_resource` VALUES ('7', 'cn.com.leadfar.oa.web.actions.PersonAction', '人员操作', 'person', 'party', '50', '6');
INSERT INTO `t_resource` VALUES ('8', 'cn.com.leadfar.oa.web.actions.PositionAction', '岗位操作', 'position', 'party', '40', '6');
INSERT INTO `t_resource` VALUES ('9', 'cn.com.leadfar.oa.web.actions.ResourceAction', '资源操作', 'resource', 'security', '100', '1');
INSERT INTO `t_resource` VALUES ('10', 'cn.com.leadfar.oa.web.actions.RoleAction', '角色操作', 'role', 'security', '70', '1');
INSERT INTO `t_resource` VALUES ('11', 'cn.com.leadfar.oa.web.actions.UserAction', '用户操作', 'user', 'security', '80', '1');

-- ----------------------------
-- Table structure for `t_resource_opers`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_opers`;
CREATE TABLE `t_resource_opers` (
  `resourceId` int(11) NOT NULL,
  `methodName` varchar(255) DEFAULT NULL,
  `operName` varchar(255) DEFAULT NULL,
  `operIndex` int(11) DEFAULT NULL,
  `operSn` varchar(255) DEFAULT NULL,
  `operKey` varchar(255) NOT NULL,
  PRIMARY KEY (`resourceId`,`operKey`),
  KEY `FKA051FF9F4F7C830B` (`resourceId`),
  CONSTRAINT `FKA051FF9F4F7C830B` FOREIGN KEY (`resourceId`) REFERENCES `t_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource_opers
-- ----------------------------
INSERT INTO `t_resource_opers` VALUES ('3', 'addInput|add', '添加', '0', 'CREATE', 'CREATE');
INSERT INTO `t_resource_opers` VALUES ('3', 'del', '删除', '2', 'DELETE', 'DELETE');
INSERT INTO `t_resource_opers` VALUES ('3', 'execute', '查询', '3', 'READ', 'READ');
INSERT INTO `t_resource_opers` VALUES ('3', 'saveInput|save', '公司信息维护', '4', 'saveCompany', 'saveCompany');
INSERT INTO `t_resource_opers` VALUES ('3', 'updateInput|update', '更新', '1', 'UPDATE', 'UPDATE');
INSERT INTO `t_resource_opers` VALUES ('4', 'addInput|add', '添加', '0', 'CREATE', 'CREATE');
INSERT INTO `t_resource_opers` VALUES ('4', 'del', '删除', '2', 'DELETE', 'DELETE');
INSERT INTO `t_resource_opers` VALUES ('4', 'execute', '查询', '3', 'READ', 'READ');
INSERT INTO `t_resource_opers` VALUES ('4', 'updateInput|update', '更新', '1', 'UPDATE', 'UPDATE');
INSERT INTO `t_resource_opers` VALUES ('5', 'addInput|add', '添加', '0', 'CREATE', 'CREATE');
INSERT INTO `t_resource_opers` VALUES ('5', 'del', '删除', '2', 'DELETE', 'DELETE');
INSERT INTO `t_resource_opers` VALUES ('5', 'execute', '查询', '3', 'READ', 'READ');
INSERT INTO `t_resource_opers` VALUES ('5', 'updateInput|update', '更新', '1', 'UPDATE', 'UPDATE');
INSERT INTO `t_resource_opers` VALUES ('6', 'addInput|add', '添加', '0', 'CREATE', 'CREATE');
INSERT INTO `t_resource_opers` VALUES ('6', 'del', '删除', '2', 'DELETE', 'DELETE');
INSERT INTO `t_resource_opers` VALUES ('6', 'execute', '查询', '3', 'READ', 'READ');
INSERT INTO `t_resource_opers` VALUES ('6', 'updateInput|update', '更新', '1', 'UPDATE', 'UPDATE');
INSERT INTO `t_resource_opers` VALUES ('7', 'addInput|add', '添加', '0', 'CREATE', 'CREATE');
INSERT INTO `t_resource_opers` VALUES ('7', 'del', '删除', '2', 'DELETE', 'DELETE');
INSERT INTO `t_resource_opers` VALUES ('7', 'execute', '查询', '3', 'READ', 'READ');
INSERT INTO `t_resource_opers` VALUES ('7', 'updateInput|update', '更新', '1', 'UPDATE', 'UPDATE');
INSERT INTO `t_resource_opers` VALUES ('8', 'addInput|add', '添加', '0', 'CREATE', 'CREATE');
INSERT INTO `t_resource_opers` VALUES ('8', 'del', '删除', '2', 'DELETE', 'DELETE');
INSERT INTO `t_resource_opers` VALUES ('8', 'execute', '查询', '3', 'READ', 'READ');
INSERT INTO `t_resource_opers` VALUES ('8', 'updateInput|update', '更新', '1', 'UPDATE', 'UPDATE');
INSERT INTO `t_resource_opers` VALUES ('9', 'addInput|add|operInput|addOper', '添加', '0', 'CREATE', 'CREATE');
INSERT INTO `t_resource_opers` VALUES ('9', 'del|delOper', '删除', '2', 'DELETE', 'DELETE');
INSERT INTO `t_resource_opers` VALUES ('9', 'execute', '查询', '3', 'READ', 'READ');
INSERT INTO `t_resource_opers` VALUES ('9', 'updateInput|update', '更新', '1', 'UPDATE', 'UPDATE');
INSERT INTO `t_resource_opers` VALUES ('10', 'addInput|add', '添加', '0', 'CREATE', 'CREATE');
INSERT INTO `t_resource_opers` VALUES ('10', 'del', '删除', '2', 'DELETE', 'DELETE');
INSERT INTO `t_resource_opers` VALUES ('10', 'execute', '查询', '3', 'READ', 'READ');
INSERT INTO `t_resource_opers` VALUES ('10', 'updateInput|update', '更新', '1', 'UPDATE', 'UPDATE');
INSERT INTO `t_resource_opers` VALUES ('11', 'addInput|add', '添加', '0', 'CREATE', 'CREATE');
INSERT INTO `t_resource_opers` VALUES ('11', 'del', '删除', '2', 'DELETE', 'DELETE');
INSERT INTO `t_resource_opers` VALUES ('11', 'execute|list', '查询', '3', 'READ', 'READ');
INSERT INTO `t_resource_opers` VALUES ('11', 'updateInput|update', '更新', '1', 'UPDATE', 'UPDATE');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '部门领导');
INSERT INTO `t_role` VALUES ('2', '档案管理员');
INSERT INTO `t_role` VALUES ('3', '临时工');
INSERT INTO `t_role` VALUES ('4', '系统管理员');
INSERT INTO `t_role` VALUES ('5', '普通员工');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `FKCB63CCB65DD1F36E` (`id`),
  CONSTRAINT `FKCB63CCB65DD1F36E` FOREIGN KEY (`id`) REFERENCES `t_party` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('63', 'admin', 'admin');

-- ----------------------------
-- Table structure for `t_users_roles`
-- ----------------------------
DROP TABLE IF EXISTS `t_users_roles`;
CREATE TABLE `t_users_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE5182A7B366DBB05` (`roleId`),
  KEY `FKE5182A7B3BC3106F` (`userId`),
  CONSTRAINT `FKE5182A7B366DBB05` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FKE5182A7B3BC3106F` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_users_roles
-- ----------------------------
INSERT INTO `t_users_roles` VALUES ('1', '63', '4');
INSERT INTO `t_users_roles` VALUES ('2', '63', '5');

-- ----------------------------
-- Table structure for `t_workapprove`
-- ----------------------------
DROP TABLE IF EXISTS `t_workapprove`;
CREATE TABLE `t_workapprove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskId` varchar(255) DEFAULT NULL,
  `approveTime` datetime DEFAULT NULL,
  `approveEntityId` int(11) DEFAULT NULL,
  `approveUserId` int(11) DEFAULT NULL,
  `formId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskId` (`taskId`),
  KEY `FKB5FD3FB1F02FA5FC` (`approveUserId`),
  KEY `FKB5FD3FB11359CCDD` (`approveEntityId`),
  KEY `FKB5FD3FB121F0F821` (`formId`),
  CONSTRAINT `FKB5FD3FB11359CCDD` FOREIGN KEY (`approveEntityId`) REFERENCES `t_workentity` (`id`),
  CONSTRAINT `FKB5FD3FB121F0F821` FOREIGN KEY (`formId`) REFERENCES `t_form` (`id`),
  CONSTRAINT `FKB5FD3FB1F02FA5FC` FOREIGN KEY (`approveUserId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_workapprove
-- ----------------------------

-- ----------------------------
-- Table structure for `t_workentity`
-- ----------------------------
DROP TABLE IF EXISTS `t_workentity`;
CREATE TABLE `t_workentity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `processDefinitionId` varchar(255) DEFAULT NULL,
  `processDefinitionName` varchar(255) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `formId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6FB08AFF91471090` (`creatorId`),
  KEY `FK6FB08AFF21F0F821` (`formId`),
  CONSTRAINT `FK6FB08AFF21F0F821` FOREIGN KEY (`formId`) REFERENCES `t_form` (`id`),
  CONSTRAINT `FK6FB08AFF91471090` FOREIGN KEY (`creatorId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_workentity
-- ----------------------------
