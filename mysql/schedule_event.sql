CREATE TABLE `t_event` (
  `eventid` varchar(255) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `text` varchar(255) default NULL,
  `details` varchar(255) default NULL,
  PRIMARY KEY  (`eventId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `generator_table` VALUES ('schedule_event_pk', '1');


-- Create table
create table t_event
(
  eventid   varchar2(255) not null,
  startdate date,
  enddate   date,
  text      varchar2(255),
  details   varchar2(255)
)
;

alter table T_EVENT modify eventid number;
