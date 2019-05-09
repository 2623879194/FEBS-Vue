/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.47 : Database - shigongti
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shigongti` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shigongti`;

/*Table structure for table `alarm_info` */

DROP TABLE IF EXISTS `alarm_info`;

CREATE TABLE `alarm_info` (
  `pk_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `pk_code` varchar(50) DEFAULT NULL COMMENT '报警信息唯一编码（GUID）',
  `fd_alarm_type` varchar(50) NOT NULL COMMENT '报警类型',
  `fd_alarm_time` datetime DEFAULT NULL COMMENT '报警时间',
  `fd_longitude` varchar(50) NOT NULL COMMENT '经度',
  `fd_latitude` varchar(50) NOT NULL COMMENT '纬度',
  `fd_alarm_sources` varchar(100) NOT NULL COMMENT '报警来源',
  `datastate` bit(1) DEFAULT NULL COMMENT '数据状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='报警数据表';

/*Data for the table `alarm_info` */

insert  into `alarm_info`(`pk_id`,`pk_code`,`fd_alarm_type`,`fd_alarm_time`,`fd_longitude`,`fd_latitude`,`fd_alarm_sources`,`datastate`,`create_time`,`update_time`) values (1,'dfs','dfs1','2019-05-08 14:58:29','1','1','dfs0','\0','2019-05-09 14:58:39','2019-05-09 14:58:41');

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values ('MyScheduler','TASK_1','DEFAULT','0/1 * * * * ?1','Asia/Shanghai'),('MyScheduler','TASK_11','DEFAULT','0/5 * * * * ?','Asia/Shanghai'),('MyScheduler','TASK_2','DEFAULT','0/10 * * * * ?','Asia/Shanghai'),('MyScheduler','TASK_3','DEFAULT','0/1 * * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values ('MyScheduler','TASK_1','DEFAULT',NULL,'cc.mrbird.febs.job.util.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.domain.Job�R���\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0aȢ�pxt\00/1 * * * * ?1sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0mrbirdt\0有参任务调度测试t\01x\0'),('MyScheduler','TASK_11','DEFAULT',NULL,'cc.mrbird.febs.job.util.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.domain.Job�R���\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0a�� Pxt\0\r0/5 * * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test2pt\0测试异常t\01x\0'),('MyScheduler','TASK_2','DEFAULT',NULL,'cc.mrbird.febs.job.util.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.domain.Job�R���\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0a�Ǧ�xt\00/10 * * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test1pt\0无参任务调度测试t\01x\0'),('MyScheduler','TASK_3','DEFAULT',NULL,'cc.mrbird.febs.job.util.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.domain.Job�R���\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0a�q\Z�xt\0\r0/1 * * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0hello worldt\0+有参任务调度测试,每隔一秒触发t\01x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values ('MyScheduler','STATE_ACCESS'),('MyScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('MyScheduler','DEBUG1557393805520',1557394858333,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('MyScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1557386232000,-1,5,'PAUSED','CRON',1557386232000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.domain.Job�R���\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0aȢ�pxt\00/1 * * * * ?1sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0mrbirdt\0有参任务调度测试t\01x\0'),('MyScheduler','TASK_11','DEFAULT','TASK_11','DEFAULT',NULL,1557386235000,-1,5,'PAUSED','CRON',1557386232000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.domain.Job�R���\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0a�� Pxt\0\r0/5 * * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test2pt\0测试异常t\01x\0'),('MyScheduler','TASK_2','DEFAULT','TASK_2','DEFAULT',NULL,1557386240000,-1,5,'PAUSED','CRON',1557386232000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.domain.Job�R���\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0a�Ǧ�xt\00/10 * * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0test1pt\0无参任务调度测试t\01x\0'),('MyScheduler','TASK_3','DEFAULT','TASK_3','DEFAULT',NULL,1557386232000,-1,5,'PAUSED','CRON',1557386232000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0cc.mrbird.febs.job.domain.Job�R���\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0\nmethodNameq\0~\0	L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statusq\0~\0	xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0a�q\Z�xt\0\r0/1 * * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0testt\0hello worldt\0+有参任务调度测试,每隔一秒触发t\01x\0');

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

CREATE TABLE `t_dept` (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) NOT NULL COMMENT '部门名称',
  `ORDER_NUM` double(20,0) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_dept` */

insert  into `t_dept`(`DEPT_ID`,`PARENT_ID`,`DEPT_NAME`,`ORDER_NUM`,`CREATE_TIME`,`MODIFY_TIME`) values (1,0,'开发部',1,'2018-01-04 15:42:26','2019-01-05 21:08:27'),(2,1,'开发一部',1,'2018-01-04 15:42:34','2019-01-18 00:59:37'),(3,1,'开发二部',2,'2018-01-04 15:42:29','2019-01-05 14:09:39'),(4,0,'市场部',2,'2018-01-04 15:42:36','2019-01-23 06:27:56'),(5,0,'人事部',3,'2018-01-04 15:42:32','2019-01-23 06:27:59'),(6,0,'测试部',4,'2018-01-04 15:42:38','2019-01-17 08:15:47');

/*Table structure for table `t_dict` */

DROP TABLE IF EXISTS `t_dict`;

CREATE TABLE `t_dict` (
  `DICT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  `KEYY` bigint(20) NOT NULL COMMENT '键',
  `VALUEE` varchar(100) NOT NULL COMMENT '值',
  `FIELD_NAME` varchar(100) NOT NULL COMMENT '字段名称',
  `TABLE_NAME` varchar(100) NOT NULL COMMENT '表名',
  PRIMARY KEY (`DICT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_dict` */

insert  into `t_dict`(`DICT_ID`,`KEYY`,`VALUEE`,`FIELD_NAME`,`TABLE_NAME`) values (1,0,'男','ssex','t_user'),(2,1,'女','ssex','t_user'),(3,2,'保密','ssex','t_user'),(4,1,'有效','status','t_user'),(5,0,'锁定','status','t_user'),(6,0,'菜单','type','t_menu'),(7,1,'按钮','type','t_menu'),(30,0,'正常','status','t_job'),(31,1,'暂停','status','t_job'),(32,0,'成功','status','t_job_log'),(33,1,'失败','status','t_job_log');

/*Table structure for table `t_job` */

DROP TABLE IF EXISTS `t_job`;

CREATE TABLE `t_job` (
  `JOB_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `CRON_EXPRESSION` varchar(100) NOT NULL COMMENT 'cron表达式',
  `STATUS` char(2) NOT NULL COMMENT '任务状态  0：正常  1：暂停',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`JOB_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_job` */

insert  into `t_job`(`JOB_ID`,`BEAN_NAME`,`METHOD_NAME`,`PARAMS`,`CRON_EXPRESSION`,`STATUS`,`REMARK`,`CREATE_TIME`) values (1,'testTask','test','mrbird','0/1 * * * * ?1','1','有参任务调度测试','2018-02-24 16:26:14'),(2,'testTask','test1',NULL,'0/10 * * * * ?','1','无参任务调度测试','2018-02-24 17:06:23'),(3,'testTask','test','hello world','0/1 * * * * ?','1','有参任务调度测试,每隔一秒触发','2018-02-26 09:28:26'),(11,'testTask','test2',NULL,'0/5 * * * * ?','1','测试异常','2018-02-26 11:15:30');

/*Table structure for table `t_job_log` */

DROP TABLE IF EXISTS `t_job_log`;

CREATE TABLE `t_job_log` (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `JOB_ID` bigint(20) NOT NULL COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `STATUS` char(2) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `ERROR` text COMMENT '失败信息',
  `TIMES` decimal(11,0) DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`LOG_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2502 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_job_log` */

insert  into `t_job_log`(`LOG_ID`,`JOB_ID`,`BEAN_NAME`,`METHOD_NAME`,`PARAMS`,`STATUS`,`ERROR`,`TIMES`,`CREATE_TIME`) values (2450,3,'testTask','test','hello world','0',NULL,'2','2018-03-20 15:31:52'),(2451,3,'testTask','test','hello world','0',NULL,'0','2018-03-20 15:31:53'),(2452,3,'testTask','test','hello world','0',NULL,'2','2018-03-20 15:31:54'),(2453,3,'testTask','test','hello world','0',NULL,'1','2018-03-20 15:31:55'),(2454,3,'testTask','test','hello world','0',NULL,'0','2018-03-20 15:31:56'),(2455,3,'testTask','test','hello world','0',NULL,'1','2018-03-20 15:31:57'),(2456,3,'testTask','test','hello world','0',NULL,'1','2018-03-20 15:31:59'),(2457,3,'testTask','test','hello world','0',NULL,'1','2018-03-20 15:31:59'),(2458,3,'testTask','test','hello world','0',NULL,'1','2018-03-20 15:32:00'),(2459,3,'testTask','test','hello world','0',NULL,'0','2018-03-20 15:32:01'),(2460,3,'testTask','test','hello world','0',NULL,'5','2018-03-20 15:32:02'),(2461,3,'testTask','test','hello world','0',NULL,'1','2018-03-20 15:32:03'),(2462,3,'testTask','test','hello world','0',NULL,'1','2018-03-20 15:32:04'),(2463,3,'testTask','test','hello world','0',NULL,'1','2018-03-20 15:32:05'),(2464,3,'testTask','test','hello world','0',NULL,'1','2018-03-20 15:32:06'),(2465,11,'testTask','test2',NULL,'1','java.lang.NoSuchMethodException: cc.mrbird.job.task.TestTask.test2()','0','2018-03-20 15:32:26'),(2466,2,'testTask','test1',NULL,'0',NULL,'1','2018-04-02 15:26:40'),(2467,2,'testTask','test1',NULL,'0',NULL,'1','2018-04-02 15:26:50'),(2468,2,'testTask','test1',NULL,'0',NULL,'1','2018-04-02 15:27:20'),(2469,2,'testTask','test1',NULL,'0',NULL,'3','2018-04-02 17:29:20'),(2476,1,'testTask','test','mrbird','0',NULL,'1','2019-01-06 08:25:00'),(2477,11,'testTask','test2',NULL,'1','java.lang.NoSuchMethodException: cc.mrbird.febs.job.task.TestTask.test2()','0','2019-01-06 08:25:25'),(2478,1,'testTask','test','mrbird','0',NULL,'1','2019-01-06 08:40:15'),(2479,1,'testTask','test','mrbird','0',NULL,'1','2019-01-06 08:40:15'),(2480,1,'testTask','test','mrbird','0',NULL,'1','2019-01-06 08:40:15'),(2481,1,'testTask','test','mrbird','0',NULL,'1','2019-01-06 08:40:15'),(2482,1,'testTask','test','mrbird','0',NULL,'0','2019-01-06 08:40:15'),(2483,1,'testTask','test','mrbird','0',NULL,'1','2019-01-06 08:40:15'),(2484,1,'testTask','test','mrbird','0',NULL,'0','2019-01-06 08:40:15'),(2485,1,'testTask','test','mrbird','0',NULL,'0','2019-01-06 08:40:15'),(2486,1,'testTask','test','mrbird','0',NULL,'0','2019-01-06 08:40:15'),(2487,1,'testTask','test','mrbird','0',NULL,'0','2019-01-06 08:40:15'),(2488,1,'testTask','test','mrbird','0',NULL,'1','2019-01-06 08:40:16'),(2489,1,'testTask','test','mrbird','0',NULL,'0','2019-01-06 08:40:17'),(2490,1,'testTask','test','mrbird','0',NULL,'1','2019-01-06 08:40:18'),(2491,1,'testTask','test','mrbird','0',NULL,'0','2019-01-06 08:40:19'),(2492,1,'testTask','test','mrbird','0',NULL,'1','2019-01-06 08:40:20'),(2493,1,'testTask','test','mrbird','0',NULL,'0','2019-01-06 08:40:21'),(2494,1,'testTask','test','mrbird','0',NULL,'0','2019-01-06 08:40:22'),(2495,11,'testTask','test2',NULL,'1','java.lang.NoSuchMethodException: cc.mrbird.febs.job.task.TestTask.test2()','2','2019-01-06 08:40:36'),(2496,11,'testTask','test2',NULL,'1','java.lang.NoSuchMethodException: cc.mrbird.febs.job.task.TestTask.test2()','0','2019-01-06 08:40:36'),(2497,11,'testTask','test2',NULL,'1','java.lang.NoSuchMethodException: cc.mrbird.febs.job.task.TestTask.test2()','1','2019-01-06 08:40:40'),(2498,2,'testTask','test1',NULL,'0',NULL,'1','2019-01-06 11:36:20'),(2499,1,'testTask','test','mrbird','0',NULL,'30','2019-01-22 05:41:01'),(2500,1,'testTask','test','mrbird','0',NULL,'9','2019-01-23 06:28:58'),(2501,1,'testTask','test','mrbird','0',NULL,'12','2019-01-24 05:39:59');

/*Table structure for table `t_log` */

DROP TABLE IF EXISTS `t_log`;

CREATE TABLE `t_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text COMMENT '操作内容',
  `TIME` decimal(11,0) DEFAULT NULL COMMENT '耗时',
  `METHOD` text COMMENT '操作方法',
  `PARAMS` text COMMENT '方法参数',
  `IP` varchar(64) DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1847 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_log` */

insert  into `t_log`(`ID`,`USERNAME`,`OPERATION`,`TIME`,`METHOD`,`PARAMS`,`IP`,`CREATE_TIME`,`location`) values (1815,'mrbird','删除用户','301','cc.mrbird.febs.system.controller.UserController.deleteUsers()',' userIds: \"11\"','127.0.0.1','2019-01-23 06:26:43','内网IP|0|0|内网IP|内网IP'),(1816,'mrbird','修改菜单/按钮','170','cc.mrbird.febs.system.controller.MenuController.updateMenu()',' menu: \"Menu(menuId=2, parentId=0, menuName=系统监控, path=/monitor, component=PageView, perms=null, icon=dashboard, type=0, orderNum=2.0, createTime=null, modifyTime=Wed Jan 23 14:27:12 CST 2019, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:27:13','内网IP|0|0|内网IP|内网IP'),(1817,'mrbird','修改部门','90','cc.mrbird.febs.system.controller.DeptController.updateDept()',' dept: \"Dept(deptId=4, parentId=0, deptName=市场部, orderNum=2.0, createTime=null, modifyTime=Wed Jan 23 14:27:55 CST 2019, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:27:56','内网IP|0|0|内网IP|内网IP'),(1818,'mrbird','修改部门','596','cc.mrbird.febs.system.controller.DeptController.updateDept()',' dept: \"Dept(deptId=5, parentId=0, deptName=人事部, orderNum=3.0, createTime=null, modifyTime=Wed Jan 23 14:27:59 CST 2019, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:28:00','内网IP|0|0|内网IP|内网IP'),(1819,'mrbird','执行定时任务','146','cc.mrbird.febs.job.controller.JobController.runJob()',' jobId: \"1\"','127.0.0.1','2019-01-23 06:28:58','内网IP|0|0|内网IP|内网IP'),(1820,'mrbird','新增菜单/按钮','160','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=130, parentId=3, menuName=导出Excel, path=null, component=null, perms=user:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:35:15 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:35:16','内网IP|0|0|内网IP|内网IP'),(1821,'mrbird','新增菜单/按钮','255','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=131, parentId=4, menuName=导出Excel, path=null, component=null, perms=role:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:35:36 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:35:36','内网IP|0|0|内网IP|内网IP'),(1822,'mrbird','新增菜单/按钮','172','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=132, parentId=5, menuName=导出Excel, path=null, component=null, perms=menu:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:36:04 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:36:05','内网IP|0|0|内网IP|内网IP'),(1823,'mrbird','新增菜单/按钮','188','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=133, parentId=6, menuName=导出Excel, path=null, component=null, perms=dept:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:36:24 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:36:25','内网IP|0|0|内网IP|内网IP'),(1824,'mrbird','新增菜单/按钮','186','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=134, parentId=64, menuName=导出Excel, path=null, component=null, perms=dict:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:36:43 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:36:44','内网IP|0|0|内网IP|内网IP'),(1825,'mrbird','新增菜单/按钮','160','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=135, parentId=3, menuName=密码重置, path=null, component=null, perms=user:reset, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:36:59 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:37:00','内网IP|0|0|内网IP|内网IP'),(1826,'mrbird','新增菜单/按钮','181','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=136, parentId=10, menuName=导出Excel, path=null, component=null, perms=log:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:37:26 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:37:27','内网IP|0|0|内网IP|内网IP'),(1827,'mrbird','新增菜单/按钮','146','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=137, parentId=102, menuName=导出Excel, path=null, component=null, perms=job:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:37:59 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:37:59','内网IP|0|0|内网IP|内网IP'),(1828,'mrbird','新增菜单/按钮','164','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=138, parentId=109, menuName=导出Excel, path=null, component=null, perms=jobLog:export, icon=null, type=1, orderNum=null, createTime=Wed Jan 23 14:38:32 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-01-23 06:38:33','内网IP|0|0|内网IP|内网IP'),(1829,'mrbird','修改角色','3132','cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=管理员, remark=管理员, createTime=null, modifyTime=Wed Jan 23 14:45:28 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=1,3,11,12,13,4,14,15,16,5,17,18,19,6,20,21,22,64,65,66,67,2,8,23,10,24,113,121,122,124,123,125,101,102,103,104,105,106,107,108,109,110,58,59,61,81,82,83,127,128,129,130,135,131,132,133,134,136,137,138)\"','127.0.0.1','2019-01-23 06:45:32','内网IP|0|0|内网IP|内网IP'),(1830,'mrbird','修改角色','1730','cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=2, roleName=注册用户, remark=只可查看不可操作, createTime=null, modifyTime=Wed Jan 23 15:31:07 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=3,1,4,5,6,64,2,8,10,113,121,122,124,123,125,101,102,109,58,59,61,81,82,83,127,128,129)\"','127.0.0.1','2019-01-23 07:31:09','内网IP|0|0|内网IP|内网IP'),(1831,'mrbird','修改角色','1997','cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=2, roleName=注册用户, remark=可查看，新增，导出, createTime=null, modifyTime=Wed Jan 23 15:32:20 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=3,1,4,5,6,64,2,8,10,113,121,122,124,123,125,101,102,109,58,59,61,81,82,83,127,128,129,130,14,17,132,20,133,65,134,136,103,137,138)\"','127.0.0.1','2019-01-23 07:32:22','内网IP|0|0|内网IP|内网IP'),(1832,'mrbird','新增角色','1428','cc.mrbird.febs.system.controller.RoleController.addRole()',' role: \"Role(roleId=72, roleName=普通用户, remark=只可查看，好可怜哦, createTime=Wed Jan 23 15:33:20 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null, menuId=1,3,4,5,6,64,2,8,10,113,121,122,124,123,127,101,102,109,58,59,61,81,82,83,128,129)\"','127.0.0.1','2019-01-23 07:33:22','内网IP|0|0|内网IP|内网IP'),(1833,'mrbird','新增用户','338','cc.mrbird.febs.system.controller.UserController.addUser()',' user: \"User(userId=12, username=jack, password=552649f10640385d0728a80a4242893e, deptId=6, deptName=null, email=jack@hotmail.com, mobile=null, status=1, createTime=Wed Jan 23 15:34:05 CST 2019, modifyTime=null, lastLoginTime=null, ssex=0, description=null, avatar=default.jpg, roleId=72, roleName=null, sortField=null, sortOrder=null, createTimeFrom=null, createTimeTo=null, id=null)\"','127.0.0.1','2019-01-23 07:34:06','内网IP|0|0|内网IP|内网IP'),(1834,'mrbird','修改角色','2160','cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=2, roleName=注册用户, remark=可查看，新增，导出, createTime=null, modifyTime=Wed Jan 23 15:37:08 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=3,1,4,5,6,64,2,8,10,113,121,122,124,123,125,101,102,109,58,59,61,81,82,83,127,128,129,130,14,17,132,20,133,65,134,136,103,137,138,131)\"','127.0.0.1','2019-01-23 07:37:11','内网IP|0|0|内网IP|内网IP'),(1835,'mrbird','新增角色','169','cc.mrbird.febs.system.controller.RoleController.addRole()',' role: \"Role(roleId=73, roleName=测试xss, remark=<style>body{background:red !important}</style>, createTime=Wed Jan 23 15:47:04 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null, menuId=1,3)\"','127.0.0.1','2019-01-23 07:47:04','内网IP|0|0|内网IP|内网IP'),(1836,'mrbird','删除角色','54','cc.mrbird.febs.system.controller.RoleController.deleteRoles()',' roleIds: \"73\"','218.104.237.213','2019-01-24 03:03:41','中国|华东|福建省|福州市|联通'),(1837,'mrbird','修改用户','39','cc.mrbird.febs.system.controller.UserController.updateUser()',' user: \"User(userId=12, username=jack, password=null, deptId=6, deptName=null, email=jack@hotmail.com, mobile=null, status=1, createTime=null, modifyTime=Thu Jan 24 11:08:00 CST 2019, lastLoginTime=null, ssex=0, description=null, avatar=null, roleId=72, roleName=null, sortField=null, sortOrder=null, createTimeFrom=null, createTimeTo=null, id=null)\"','218.104.237.213','2019-01-24 03:08:01','中国|华东|福建省|福州市|联通'),(1838,'mrbird','执行定时任务','41','cc.mrbird.febs.job.controller.JobController.runJob()',' jobId: \"1\"','218.104.237.213','2019-01-24 05:39:59','中国|华东|福建省|福州市|联通'),(1839,'mrbird','新增菜单/按钮','6','cc.mrbird.febs.system.controller.MenuController.addMenu()',' menu: \"Menu(menuId=139, parentId=1, menuName=报警管理, path=system/alarm, component=system/alarm/alarm, perms=null, icon=, type=0, orderNum=null, createTime=Thu May 09 14:20:56 CST 2019, modifyTime=null, createTimeFrom=null, createTimeTo=null)\"','127.0.0.1','2019-05-09 06:20:56',''),(1840,'mrbird','修改角色','191','cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=管理员, remark=管理员, createTime=null, modifyTime=Thu May 09 14:21:14 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=1,3,11,12,13,4,14,15,16,5,17,18,19,6,20,21,22,64,65,66,67,2,8,23,10,24,113,121,122,124,123,125,101,102,103,104,105,106,107,108,109,110,58,59,61,81,82,83,127,128,129,130,135,131,132,133,134,136,137,138,139)\"','127.0.0.1','2019-05-09 06:21:14',''),(1841,'mrbird','修改角色','162','cc.mrbird.febs.system.controller.RoleController.updateRole()',' role: \"Role(roleId=1, roleName=管理员, remark=管理员, createTime=null, modifyTime=Thu May 09 15:07:37 CST 2019, createTimeFrom=null, createTimeTo=null, menuId=1,3,11,12,13,4,14,15,16,5,17,18,19,6,20,21,22,64,65,66,67,2,8,23,10,24,113,121,122,124,123,125,101,102,103,104,105,106,107,108,109,110,58,59,61,81,82,83,127,128,129,130,135,131,132,133,134,136,137,138,139)\"','127.0.0.1','2019-05-09 07:07:37',''),(1842,'mrbird','修改报警信息','9','cc.mrbird.febs.system.controller.AlarmController.updateDict()',' alarm: \"Alarm(id=1, code=null, type=dfs, time=null, longitude=1, latitude=1, source=dfs, dataState=0, createTime=null, updateTime=null)\"','127.0.0.1','2019-05-09 09:27:09',''),(1843,'mrbird','修改报警信息','15','cc.mrbird.febs.system.controller.AlarmController.updateDict()',' alarm: \"Alarm(id=1, code=null, type=dfs, time=null, longitude=1, latitude=1, source=dfs, dataState=0, createTime=null, updateTime=null)\"','127.0.0.1','2019-05-09 09:27:15',''),(1844,'mrbird','修改报警信息','5','cc.mrbird.febs.system.controller.AlarmController.updateDict()',' alarm: \"Alarm(id=1, code=null, type=dfs1, time=null, longitude=1, latitude=1, source=dfs0, dataState=0, createTime=null, updateTime=null)\"','127.0.0.1','2019-05-09 09:28:50',''),(1845,'mrbird','新增预警','34','cc.mrbird.febs.system.controller.AlarmController.addAlarm()',' alarm: \"Alarm(id=2, code=8f7e3801ea2047fe8e31cc481310cfe7, type=3, time=Thu May 09 17:30:15 CST 2019, longitude=1, latitude=1, source=5, dataState=1, createTime=Thu May 09 17:30:15 CST 2019, updateTime=Thu May 09 17:30:15 CST 2019)\"','127.0.0.1','2019-05-09 09:30:15',''),(1846,'mrbird','删除报警信息','7','cc.mrbird.febs.system.controller.AlarmController.deleteAlarm()',' alarmIds: \"2\"','127.0.0.1','2019-05-09 09:30:22','');

/*Table structure for table `t_login_log` */

DROP TABLE IF EXISTS `t_login_log`;

CREATE TABLE `t_login_log` (
  `USERNAME` varchar(100) NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(255) DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(100) DEFAULT NULL COMMENT 'IP地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_login_log` */

insert  into `t_login_log`(`USERNAME`,`LOGIN_TIME`,`LOCATION`,`IP`) values ('mrbird','2019-01-12 03:18:33','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-10 03:18:33','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-09 03:18:33','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-11 03:18:33','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-12 04:23:45','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-15 03:31:18','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-15 03:36:28','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-15 06:05:36','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-15 08:44:39','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-15 09:02:42','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-15 09:24:21','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-15 09:25:16','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-15 10:14:20','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-15 10:48:59','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-14 11:02:04','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-13 11:02:04','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-15 11:02:04','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 01:20:24','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 02:25:47','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 03:25:11','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 03:44:23','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 05:44:05','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 05:51:12','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-16 05:51:21','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 05:54:03','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 06:18:57','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 06:31:19','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-16 07:32:02','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 01:10:42','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 02:21:12','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 06:07:00','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 06:45:24','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 06:46:40','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 06:54:23','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 06:54:53','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 06:55:38','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 07:38:37','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 07:39:14','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 07:40:48','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 07:41:41','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-17 07:42:53','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-17 07:43:39','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 08:13:29','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 08:39:56','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 09:26:19','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 09:26:58','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 09:30:15','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbirdd','2019-01-17 10:31:40','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('jack','2019-01-17 10:41:14','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('abcd','2019-01-17 10:47:48','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('abcd','2019-01-17 10:48:06','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('abcd','2019-01-17 10:48:44','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('abcd','2019-01-17 10:51:35','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('wuyouzhugu','2019-01-17 10:54:56','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 10:56:53','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 10:59:15','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 10:59:53','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 11:01:54','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 11:08:43','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 11:12:55','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-17 11:13:21','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 00:56:15','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 01:21:54','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 01:33:06','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 02:03:32','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 02:27:12','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 02:36:26','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 02:41:49','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 02:53:12','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 02:56:00','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 03:00:35','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 05:36:02','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 05:57:39','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 06:50:27','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 07:09:37','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 08:57:02','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-18 09:00:06','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 01:13:17','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 01:14:42','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 01:50:38','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 02:05:44','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 02:06:52','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 02:11:47','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 02:12:13','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 02:12:27','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 02:33:21','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-19 02:40:19','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 03:05:20','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 03:16:03','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 05:43:32','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 05:44:20','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 06:47:04','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 06:49:51','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 07:48:30','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 07:50:34','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 07:55:22','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 07:57:39','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 08:35:07','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 08:58:37','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-21 11:05:26','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 00:47:44','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 01:02:23','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 01:38:19','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 02:39:18','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 05:39:47','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 05:44:25','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 06:04:18','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 06:04:34','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 06:13:00','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 06:13:17','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-22 06:13:43','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-22 06:14:41','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-22 06:15:10','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('hello','2019-01-22 06:15:48','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('hello','2019-01-22 06:17:19','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('hello','2019-01-22 06:18:39','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 06:19:03','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 06:20:48','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 07:04:26','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 07:06:07','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 07:06:57','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 08:37:28','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-22 10:29:50','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-23 00:50:47','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-23 01:51:42','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-23 02:58:49','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-23 06:11:14','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-23 06:46:30','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-23 06:48:25','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-23 06:51:20','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-23 07:30:25','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('scott','2019-01-23 07:34:28','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('jack','2019-01-23 07:35:56','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-23 07:36:46','内网IP|0|0|内网IP|内网IP','127.0.0.1'),('mrbird','2019-01-24 01:30:13','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 01:42:03','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 01:48:10','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 01:50:12','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 01:50:28','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 02:57:48','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 03:02:53','中国|华东|福建省|福州市|联通','218.104.237.213'),('scott','2019-01-24 03:14:51','中国|华东|福建省|厦门市|电信','120.36.172.239'),('mrbird','2019-01-24 03:41:10','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 05:38:30','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 08:50:44','中国|华东|福建省|福州市|联通','218.104.237.213'),('jack','2019-01-24 08:52:03','中国|华东|福建省|福州市|联通','218.104.237.213'),('scott','2019-01-24 08:52:31','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 11:12:33','中国|华东|福建省|福州市|联通','218.104.237.213'),('scott','2019-01-24 11:24:04','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-24 11:47:56','中国|华东|福建省|福州市|电信','27.155.195.27'),('scott','2019-01-24 11:48:28','中国|华东|福建省|福州市|电信','27.155.195.27'),('mrbird','2019-01-28 01:53:06','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-01-28 01:53:58','中国|华东|福建省|福州市|联通','218.104.237.213'),('scott','2019-01-28 01:54:09','中国|华东|福建省|福州市|联通','218.104.237.213'),('mrbird','2019-05-09 06:19:29','','127.0.0.1'),('mrbird','2019-05-09 06:21:41','','127.0.0.1'),('mrbird','2019-05-09 06:54:07','','127.0.0.1'),('mrbird','2019-05-09 07:05:51','','127.0.0.1'),('mrbird','2019-05-09 07:17:35','','127.0.0.1'),('mrbird','2019-05-09 08:19:31','','127.0.0.1'),('mrbird','2019-05-09 08:55:02','','127.0.0.1'),('mrbird','2019-05-09 09:26:55','','127.0.0.1');

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) NOT NULL COMMENT '菜单/按钮名称',
  `PATH` varchar(255) DEFAULT NULL COMMENT '对应路由path',
  `COMPONENT` varchar(255) DEFAULT NULL COMMENT '对应路由组件component',
  `PERMS` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `ICON` varchar(50) DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` double(20,0) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_menu` */

insert  into `t_menu`(`MENU_ID`,`PARENT_ID`,`MENU_NAME`,`PATH`,`COMPONENT`,`PERMS`,`ICON`,`TYPE`,`ORDER_NUM`,`CREATE_TIME`,`MODIFY_TIME`) values (1,0,'系统管理','/system','PageView',NULL,'appstore-o','0',1,'2017-12-27 16:39:07','2019-01-05 11:13:14'),(2,0,'系统监控','/monitor','PageView',NULL,'dashboard','0',2,'2017-12-27 16:45:51','2019-01-23 06:27:12'),(3,1,'用户管理','/system/user','system/user/User','user:view','','0',1,'2017-12-27 16:47:13','2019-01-22 06:45:55'),(4,1,'角色管理','/system/role','system/role/Role','role:view','','0',2,'2017-12-27 16:48:09','2018-04-25 09:01:12'),(5,1,'菜单管理','/system/menu','system/menu/Menu','menu:view','','0',3,'2017-12-27 16:48:57','2018-04-25 09:01:30'),(6,1,'部门管理','/system/dept','system/dept/Dept','dept:view','','0',4,'2017-12-27 16:57:33','2018-04-25 09:01:40'),(8,2,'在线用户','/monitor/online','monitor/Online','user:online','','0',1,'2017-12-27 16:59:33','2018-04-25 09:02:04'),(10,2,'系统日志','/monitor/systemlog','monitor/SystemLog','log:view','','0',2,'2017-12-27 17:00:50','2018-04-25 09:02:18'),(11,3,'新增用户','','','user:add',NULL,'1',NULL,'2017-12-27 17:02:58',NULL),(12,3,'修改用户','','','user:update',NULL,'1',NULL,'2017-12-27 17:04:07',NULL),(13,3,'删除用户','','','user:delete',NULL,'1',NULL,'2017-12-27 17:04:58',NULL),(14,4,'新增角色','','','role:add',NULL,'1',NULL,'2017-12-27 17:06:38',NULL),(15,4,'修改角色','','','role:update',NULL,'1',NULL,'2017-12-27 17:06:38',NULL),(16,4,'删除角色','','','role:delete',NULL,'1',NULL,'2017-12-27 17:06:38',NULL),(17,5,'新增菜单','','','menu:add',NULL,'1',NULL,'2017-12-27 17:08:02',NULL),(18,5,'修改菜单','','','menu:update',NULL,'1',NULL,'2017-12-27 17:08:02',NULL),(19,5,'删除菜单','','','menu:delete',NULL,'1',NULL,'2017-12-27 17:08:02',NULL),(20,6,'新增部门','','','dept:add',NULL,'1',NULL,'2017-12-27 17:09:24',NULL),(21,6,'修改部门','','','dept:update',NULL,'1',NULL,'2017-12-27 17:09:24',NULL),(22,6,'删除部门','','','dept:delete',NULL,'1',NULL,'2017-12-27 17:09:24',NULL),(23,8,'踢出用户','','','user:kickout',NULL,'1',NULL,'2017-12-27 17:11:13',NULL),(24,10,'删除日志','','','log:delete',NULL,'1',NULL,'2017-12-27 17:11:45',NULL),(58,0,'网络资源','/web','PageView',NULL,'compass','0',4,'2018-01-12 15:28:48','2018-01-22 19:49:26'),(59,58,'天气查询','/web/weather','web/Weather','weather:view','','0',1,'2018-01-12 15:40:02','2019-01-22 05:43:19'),(61,58,'每日一文','/web/dailyArticle','web/DailyArticle','article:view','','0',2,'2018-01-15 17:17:14','2019-01-22 05:43:27'),(64,1,'字典管理','/system/dict','system/dict/Dict','dict:view','','0',5,'2018-01-18 10:38:25','2018-04-25 09:01:50'),(65,64,'新增字典','','','dict:add',NULL,'1',NULL,'2018-01-18 19:10:08',NULL),(66,64,'修改字典','','','dict:update',NULL,'1',NULL,'2018-01-18 19:10:27',NULL),(67,64,'删除字典','','','dict:delete',NULL,'1',NULL,'2018-01-18 19:10:47',NULL),(81,58,'影视资讯','/web/movie','EmptyPageView',NULL,NULL,'0',3,'2018-01-22 14:12:59','2019-01-22 05:43:35'),(82,81,'正在热映','/web/movie/hot','web/MovieHot','movie:hot','','0',1,'2018-01-22 14:13:47','2019-01-22 05:43:52'),(83,81,'即将上映','/web/movie/coming','web/MovieComing','movie:coming','','0',2,'2018-01-22 14:14:36','2019-01-22 05:43:58'),(101,0,'任务调度','/job','PageView',NULL,'clock-circle-o','0',3,'2018-01-11 15:52:57',NULL),(102,101,'定时任务','/job/job','quartz/job/Job','job:view','','0',1,'2018-02-24 15:53:53','2019-01-22 05:42:50'),(103,102,'新增任务','','','job:add',NULL,'1',NULL,'2018-02-24 15:55:10',NULL),(104,102,'修改任务','','','job:update',NULL,'1',NULL,'2018-02-24 15:55:53',NULL),(105,102,'删除任务','','','job:delete',NULL,'1',NULL,'2018-02-24 15:56:18',NULL),(106,102,'暂停任务','','','job:pause',NULL,'1',NULL,'2018-02-24 15:57:08',NULL),(107,102,'恢复任务','','','job:resume',NULL,'1',NULL,'2018-02-24 15:58:21',NULL),(108,102,'立即执行任务','','','job:run',NULL,'1',NULL,'2018-02-24 15:59:45',NULL),(109,101,'调度日志','/job/log','quartz/log/JobLog','jobLog:view','','0',2,'2018-02-24 16:00:45','2019-01-22 05:42:59'),(110,109,'删除日志','','','jobLog:delete',NULL,'1',NULL,'2018-02-24 16:01:21',NULL),(113,2,'Redis监控','/monitor/redis/info','monitor/RedisInfo','redis:view','','0',3,'2018-06-28 14:29:42',NULL),(121,2,'请求追踪','/monitor/httptrace','monitor/Httptrace',NULL,NULL,'0',4,'2019-01-18 02:30:29',NULL),(122,2,'系统信息','/monitor/system','EmptyPageView',NULL,NULL,'0',5,'2019-01-18 02:31:48','2019-01-18 02:39:46'),(123,122,'Tomcat信息','/monitor/system/tomcatinfo','monitor/TomcatInfo',NULL,NULL,'0',2,'2019-01-18 02:32:53','2019-01-18 02:46:57'),(124,122,'JVM信息','/monitor/system/jvminfo','monitor/JvmInfo',NULL,NULL,'0',1,'2019-01-18 02:33:30','2019-01-18 02:46:51'),(127,122,'服务器信息','/monitor/system/info','monitor/SystemInfo',NULL,NULL,'0',3,'2019-01-21 07:53:43','2019-01-21 07:57:00'),(128,0,'其他模块','/others','PageView',NULL,'coffee','0',5,'2019-01-22 06:49:59','2019-01-22 06:50:13'),(129,128,'导入导出','/others/excel','others/Excel',NULL,NULL,'0',1,'2019-01-22 06:51:36','2019-01-22 07:06:45'),(130,3,'导出Excel',NULL,NULL,'user:export',NULL,'1',NULL,'2019-01-23 06:35:16',NULL),(131,4,'导出Excel',NULL,NULL,'role:export',NULL,'1',NULL,'2019-01-23 06:35:36',NULL),(132,5,'导出Excel',NULL,NULL,'menu:export',NULL,'1',NULL,'2019-01-23 06:36:05',NULL),(133,6,'导出Excel',NULL,NULL,'dept:export',NULL,'1',NULL,'2019-01-23 06:36:25',NULL),(134,64,'导出Excel',NULL,NULL,'dict:export',NULL,'1',NULL,'2019-01-23 06:36:43',NULL),(135,3,'密码重置',NULL,NULL,'user:reset',NULL,'1',NULL,'2019-01-23 06:37:00',NULL),(136,10,'导出Excel',NULL,NULL,'log:export',NULL,'1',NULL,'2019-01-23 06:37:27',NULL),(137,102,'导出Excel',NULL,NULL,'job:export',NULL,'1',NULL,'2019-01-23 06:37:59',NULL),(138,109,'导出Excel',NULL,NULL,'jobLog:export',NULL,'1',NULL,'2019-01-23 06:38:32',NULL),(139,1,'报警管理','/system/alarm','system/alarm/alarm',NULL,'','0',NULL,'2019-05-09 06:20:56',NULL);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(10) NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_role` */

insert  into `t_role`(`ROLE_ID`,`ROLE_NAME`,`REMARK`,`CREATE_TIME`,`MODIFY_TIME`) values (1,'管理员','管理员','2017-12-27 16:23:11','2019-05-09 07:07:37'),(2,'注册用户','可查看，新增，导出','2019-01-04 14:11:28','2019-01-23 07:37:08'),(72,'普通用户','只可查看，好可怜哦','2019-01-23 07:33:20',NULL);

/*Table structure for table `t_role_menu` */

DROP TABLE IF EXISTS `t_role_menu`;

CREATE TABLE `t_role_menu` (
  `ROLE_ID` bigint(20) NOT NULL,
  `MENU_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_role_menu` */

insert  into `t_role_menu`(`ROLE_ID`,`MENU_ID`) values (72,1),(72,3),(72,4),(72,5),(72,6),(72,64),(72,2),(72,8),(72,10),(72,113),(72,121),(72,122),(72,124),(72,123),(72,127),(72,101),(72,102),(72,109),(72,58),(72,59),(72,61),(72,81),(72,82),(72,83),(72,128),(72,129),(2,3),(2,1),(2,4),(2,5),(2,6),(2,64),(2,2),(2,8),(2,10),(2,113),(2,121),(2,122),(2,124),(2,123),(2,125),(2,101),(2,102),(2,109),(2,58),(2,59),(2,61),(2,81),(2,82),(2,83),(2,127),(2,128),(2,129),(2,130),(2,14),(2,17),(2,132),(2,20),(2,133),(2,65),(2,134),(2,136),(2,103),(2,137),(2,138),(2,131),(1,1),(1,3),(1,11),(1,12),(1,13),(1,4),(1,14),(1,15),(1,16),(1,5),(1,17),(1,18),(1,19),(1,6),(1,20),(1,21),(1,22),(1,64),(1,65),(1,66),(1,67),(1,2),(1,8),(1,23),(1,10),(1,24),(1,113),(1,121),(1,122),(1,124),(1,123),(1,125),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,58),(1,59),(1,61),(1,81),(1,82),(1,83),(1,127),(1,128),(1,129),(1,130),(1,135),(1,131),(1,132),(1,133),(1,134),(1,136),(1,137),(1,138),(1,139);

/*Table structure for table `t_test` */

DROP TABLE IF EXISTS `t_test`;

CREATE TABLE `t_test` (
  `FIELD1` varchar(20) NOT NULL,
  `FIELD2` int(11) NOT NULL,
  `FIELD3` varchar(100) NOT NULL,
  `CREATE_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_test` */

insert  into `t_test`(`FIELD1`,`FIELD2`,`FIELD3`,`CREATE_TIME`) values ('字段1',1,'mrbird@gmail.com','2019-01-22 16:26:51'),('字段1',1,'mrbird0@gmail.com','2019-01-23 03:01:03'),('字段1',2,'mrbird1@gmail.com','2019-01-23 03:01:03'),('字段1',3,'mrbird2@gmail.com','2019-01-23 03:01:03'),('字段1',4,'mrbird3@gmail.com','2019-01-23 03:01:03'),('字段1',5,'mrbird4@gmail.com','2019-01-23 03:01:03'),('字段1',10,'mrbird9@gmail.com','2019-01-23 03:01:03'),('字段1',1,'mrbird0@gmail.com','2019-01-23 03:03:49'),('字段1',2,'mrbird1@gmail.com','2019-01-23 03:03:49'),('字段1',3,'mrbird2@gmail.com','2019-01-23 03:03:49'),('字段1',4,'mrbird3@gmail.com','2019-01-23 03:03:49'),('字段1',5,'mrbird4@gmail.com','2019-01-23 03:03:49'),('字段1',10,'mrbird9@gmail.com','2019-01-23 03:03:49'),('字段1',1,'mrbird0@gmail.com','2019-01-23 03:07:47'),('字段1',2,'mrbird1@gmail.com','2019-01-23 03:07:47'),('字段1',3,'mrbird2@gmail.com','2019-01-23 03:07:47'),('字段1',4,'mrbird3@gmail.com','2019-01-23 03:07:47'),('字段1',5,'mrbird4@gmail.com','2019-01-23 03:07:47'),('字段1',6,'mrbird5@gmail.com','2019-01-23 03:07:47'),('字段1',1,'mrbird0@gmail.com','2019-01-23 03:08:09'),('字段1',2,'mrbird1@gmail.com','2019-01-23 03:08:09'),('字段1',3,'mrbird2@gmail.com','2019-01-23 03:08:09'),('字段1',4,'mrbird3@gmail.com','2019-01-23 03:08:09'),('字段1',5,'mrbird4@gmail.com','2019-01-23 03:08:09'),('字段1',10,'mrbird9@gmail.com','2019-01-23 03:08:09'),('字段1',1,'mrbird0@gmail.com','2019-01-23 03:19:52'),('字段1',2,'mrbird1@gmail.com','2019-01-23 03:19:52'),('字段1',3,'mrbird2@gmail.com','2019-01-23 03:19:52'),('字段1',4,'mrbird3@gmail.com','2019-01-23 03:19:52'),('字段1',5,'mrbird4@gmail.com','2019-01-23 03:19:52'),('字段1',6,'mrbird5@gmail.com','2019-01-23 03:19:52'),('字段1',1,'mrbird0@gmail.com','2019-01-23 03:20:56'),('字段1',2,'mrbird1@gmail.com','2019-01-23 03:20:56'),('字段1',3,'mrbird2@gmail.com','2019-01-23 03:20:56'),('字段1',4,'mrbird3@gmail.com','2019-01-23 03:20:56'),('字段1',5,'mrbird4@gmail.com','2019-01-23 03:20:56'),('字段1',6,'mrbird5@gmail.com','2019-01-23 03:20:56'),('字段1',1,'mrbird0@gmail.com','2019-01-23 06:12:38'),('字段1',2,'mrbird1@gmail.com','2019-01-23 06:12:38'),('字段1',3,'mrbird2@gmail.com','2019-01-23 06:12:38'),('字段1',4,'mrbird3@gmail.com','2019-01-23 06:12:38'),('字段1',5,'mrbird4@gmail.com','2019-01-23 06:12:38'),('字段1',6,'mrbird5@gmail.com','2019-01-23 06:12:38'),('字段1',7,'mrbird6@gmail.com','2019-01-23 06:12:38'),('字段1',8,'mrbird7@gmail.com','2019-01-23 06:12:38'),('字段1',9,'mrbird8@gmail.com','2019-01-23 06:12:38'),('字段1',11,'mrbird10@gmail.com','2019-01-23 06:12:38'),('字段1',12,'mrbird11@gmail.com','2019-01-23 06:12:38'),('字段1',14,'mrbird13@gmail.com','2019-01-23 06:12:38'),('字段1',15,'mrbird14@gmail.com','2019-01-23 06:12:38'),('字段1',16,'mrbird15@gmail.com','2019-01-23 06:12:38'),('字段1',18,'mrbird17@gmail.com','2019-01-23 06:12:38'),('字段1',19,'mrbird18@gmail.com','2019-01-23 06:12:38'),('字段1',20,'mrbird19@gmail.com','2019-01-23 06:12:38');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `USER_ID` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) NOT NULL COMMENT '密码',
  `DEPT_ID` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) NOT NULL COMMENT '状态 0锁定 1有效',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '描述',
  `AVATAR` varchar(100) DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_user` */

insert  into `t_user`(`USER_ID`,`USERNAME`,`PASSWORD`,`DEPT_ID`,`EMAIL`,`MOBILE`,`STATUS`,`CREATE_TIME`,`MODIFY_TIME`,`LAST_LOGIN_TIME`,`SSEX`,`DESCRIPTION`,`AVATAR`) values (1,'mrbird','94f860c4bbfeb2f49c84e321fdda4b07',1,'mrbird123@hotmail.com','13455533233','1','2017-12-27 15:47:19','2019-01-17 02:34:19','2019-05-09 09:26:55','2','我是帅比作者。','ubnKSIfAJTxIgXOKlciN.png'),(2,'scott','7b44a5363e3fd52435beb472e1d2b91f',6,'scott@qq.com','15134627380','1','2017-12-29 16:16:39','2019-01-18 00:59:09','2019-01-28 01:54:09','0','我是scott，嗯嗯','jZUIxmJycoymBprLOUbT.png'),(12,'jack','552649f10640385d0728a80a4242893e',6,'jack@hotmail.com',NULL,'1','2019-01-23 07:34:05','2019-01-24 03:08:01','2019-01-24 08:52:03','0',NULL,'default.jpg');

/*Table structure for table `t_user_config` */

DROP TABLE IF EXISTS `t_user_config`;

CREATE TABLE `t_user_config` (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `THEME` varchar(10) DEFAULT NULL COMMENT '系统主题 dark暗色风格，light明亮风格',
  `LAYOUT` varchar(10) DEFAULT NULL COMMENT '系统布局 side侧边栏，head顶部栏',
  `MULTI_PAGE` char(1) DEFAULT NULL COMMENT '页面风格 1多标签页 0单页',
  `FIX_SIDERBAR` char(1) DEFAULT NULL COMMENT '页面滚动是否固定侧边栏 1固定 0不固定',
  `FIX_HEADER` char(1) DEFAULT NULL COMMENT '页面滚动是否固定顶栏 1固定 0不固定',
  `COLOR` varchar(20) DEFAULT NULL COMMENT '主题颜色 RGB值',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_user_config` */

insert  into `t_user_config`(`USER_ID`,`THEME`,`LAYOUT`,`MULTI_PAGE`,`FIX_SIDERBAR`,`FIX_HEADER`,`COLOR`) values (1,'light','side','1','1','1','rgb(24, 144, 255)'),(2,'light','head','0','1','1','rgb(24, 144, 255)'),(12,'dark','side','1','1','1','rgb(66, 185, 131)');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`USER_ID`,`ROLE_ID`) values (1,1),(2,2),(12,72);

/* Function  structure for function  `findDeptChildren` */

/*!50003 DROP FUNCTION IF EXISTS `findDeptChildren` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `findDeptChildren`(rootId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
  DECLARE sTemp VARCHAR(4000);
    DECLARE sTempChd VARCHAR(4000);
    SET sTemp = '$';
    SET sTempChd = CAST(rootId as CHAR);
    WHILE sTempChd is not null DO
    SET sTemp = CONCAT(sTemp,',',sTempChd);
    SELECT GROUP_CONCAT(dept_id) INTO sTempChd FROM t_dept
    WHERE FIND_IN_SET(parent_id,sTempChd)>0;
END WHILE;
RETURN sTemp;
END */$$
DELIMITER ;

/* Function  structure for function  `findMenuChildren` */

/*!50003 DROP FUNCTION IF EXISTS `findMenuChildren` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `findMenuChildren`(rootId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
  DECLARE sTemp VARCHAR(4000);
    DECLARE sTempChd VARCHAR(4000);
    SET sTemp = '$';
    SET sTempChd = CAST(rootId as CHAR);
    WHILE sTempChd is not null DO
    SET sTemp = CONCAT(sTemp,',',sTempChd);
    SELECT GROUP_CONCAT(menu_id) INTO sTempChd FROM t_menu
    WHERE FIND_IN_SET(parent_id,sTempChd)>0;
END WHILE;
RETURN sTemp;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
