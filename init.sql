-- --------------------------------------------------------
-- 主機:                           127.0.0.1
-- 伺服器版本:                        5.7.21-log - MySQL Community Server (GPL)
-- 伺服器操作系統:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 傾印 pcb 的資料庫結構
DROP DATABASE IF EXISTS `pcb`;
CREATE DATABASE IF NOT EXISTS `pcb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pcb`;

-- 傾印  表格 pcb.behaviors 結構
DROP TABLE IF EXISTS `behaviors`;
CREATE TABLE IF NOT EXISTS `behaviors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pcb_id` int(10) unsigned NOT NULL,
  `round_id` int(10) unsigned NOT NULL,
  `enter_or_exit_free` bit(1) DEFAULT NULL,
  `scatter_select` int(11) DEFAULT NULL,
  `enter_or_exit_fever` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pcb_id` (`pcb_id`),
  CONSTRAINT `FK_behaviors_machines` FOREIGN KEY (`pcb_id`) REFERENCES `machines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='使用者行為，一般不會紀錄的東西';

-- 正在傾印表格  pcb.behaviors 的資料：~0 rows (大約)
DELETE FROM `behaviors`;
/*!40000 ALTER TABLE `behaviors` DISABLE KEYS */;
/*!40000 ALTER TABLE `behaviors` ENABLE KEYS */;

-- 傾印  表格 pcb.currencies 結構
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='幣別對應表';

-- 正在傾印表格  pcb.currencies 的資料：~0 rows (大約)
DELETE FROM `currencies`;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` (`id`, `name`) VALUES
	(1, 'twd');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- 傾印  程序 pcb.HeidiSQL_temproutine_1 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_1`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_1`()
SET @roleID = 0;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_10 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_10`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_10`(
	IN `@id` INT,
	IN `storeName` VARCHAR(50),
	IN `userID` INT


)
select id;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_11 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_11`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_11`(
	IN `@id` INT,
	IN `storeName` VARCHAR(50),
	IN `userID` INT


)
select id;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_12 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_12`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_12`(
	IN `@id` INT,
	IN `storeName` VARCHAR(50),
	IN `userID` INT


)
select id;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_13 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_13`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_13`()
SET @roleID = 0;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_14 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_14`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_14`()
SET @roleID = 0;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_15 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_15`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_15`()
SET @roleID = 0;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_16 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_16`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_16`()
    READS SQL DATA
    COMMENT 'machines'
SELECT lft, rgt INTO @lft, @rgt FROM user_node WHERE user_id = p_userid;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_17 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_17`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_17`(
	IN `p_exeid` INT
)
    READS SQL DATA
    COMMENT 'machines'
SELECT lft, rgt INTO @lft, @rgt FROM user_node WHERE user_id = p_exeid;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_18 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_18`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_18`(
	IN `p_exeid` INT
)
    READS SQL DATA
    COMMENT 'machines'
SELECT lft, rgt INTO @lft, @rgt FROM user_node WHERE user_id = p_exeid;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_19 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_19`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_19`(
	IN `p_exeid` INT
)
    READS SQL DATA
    COMMENT 'machines'
SELECT lft, rgt INTO @lft, @rgt FROM user_node WHERE user_id = p_exeid;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_2 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_2`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_2`(
	OUT `page` INT
)
    COMMENT 'machines'
select id, store_name, machine_name, pcb_id, user_id, created_time, update_time from machines where delete_flag <> 1;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_20 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_20`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_20`(
	IN `p_exeid` INT
)
    READS SQL DATA
    COMMENT 'machines'
SELECT lft, rgt INTO @lft, @rgt FROM user_node WHERE user_id = p_exeid;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_21 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_21`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_21`(
	IN `p_exeid` INT
)
    READS SQL DATA
    COMMENT 'machines'
SELECT lft, rgt INTO @lft, @rgt FROM user_node WHERE user_id = p_exeid;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_22 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_22`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_22`(
	IN `p_exeid` INT
)
    READS SQL DATA
    COMMENT 'machines'
SELECT lft, rgt INTO @lft, @rgt FROM user_node WHERE user_id = p_exeid;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_3 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_3`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_3`()
    READS SQL DATA
    COMMENT 'machines'
CREATE TEMPORARY TABLE IF NOT EXISTS _tmp AS (
	SELECT SQL_CALC_FOUND_ROWS id, store_name, machine_name, pcb_id, user_id, created_time, update_time 
	from machines 
	where delete_flag <> 1
);//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_4 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_4`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_4`()
    READS SQL DATA
    COMMENT 'machines'
CREATE TEMPORARY TABLE IF NOT EXISTS _tmp AS (
	SELECT SQL_CALC_FOUND_ROWS id, store_name, machine_name, pcb_id, user_id, created_time, update_time 
	from machines 
	where delete_flag <> 1
);//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_5 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_5`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_5`()
    READS SQL DATA
    COMMENT 'machines'
CREATE TEMPORARY TABLE IF NOT EXISTS _tmp AS (
	SELECT SQL_CALC_FOUND_ROWS id, store_name, machine_name, pcb_id, user_id, created_time, update_time 
	from machines 
	where delete_flag <> 1
);//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_6 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_6`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_6`()
    READS SQL DATA
    COMMENT 'machines'
CREATE TEMPORARY TABLE IF NOT EXISTS _tmp AS (
	SELECT SQL_CALC_FOUND_ROWS id, store_name, machine_name, pcb_id, user_id, created_time, update_time 
	from machines 
	where delete_flag <> 1
);//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_7 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_7`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_7`(
	IN `@id` INT,
	IN `storeName` VARCHAR(50),
	IN `userID` INT


)
select @id;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_8 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_8`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_8`(
	IN `@id` INT,
	IN `storeName` VARCHAR(50),
	IN `userID` INT


)
select @id;//
DELIMITER ;

-- 傾印  程序 pcb.HeidiSQL_temproutine_9 結構
DROP PROCEDURE IF EXISTS `HeidiSQL_temproutine_9`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `HeidiSQL_temproutine_9`(
	IN `@id` INT,
	IN `storeName` VARCHAR(50),
	IN `userID` INT


)
select id;//
DELIMITER ;

-- 傾印  表格 pcb.log_machine_change 結構
DROP TABLE IF EXISTS `log_machine_change`;
CREATE TABLE IF NOT EXISTS `log_machine_change` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` int(10) unsigned NOT NULL,
  `action` int(10) unsigned NOT NULL,
  `memo` varchar(200) DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_log_machine_change_machines` (`machine_id`),
  CONSTRAINT `FK_log_machine_change_machines` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='機器更改紀錄';

-- 正在傾印表格  pcb.log_machine_change 的資料：~0 rows (大約)
DELETE FROM `log_machine_change`;
/*!40000 ALTER TABLE `log_machine_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_machine_change` ENABLE KEYS */;

-- 傾印  表格 pcb.log_user_change 結構
DROP TABLE IF EXISTS `log_user_change`;
CREATE TABLE IF NOT EXISTS `log_user_change` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `action` int(10) unsigned NOT NULL,
  `memo` varchar(200) DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_log_user_change_users` (`user_id`),
  CONSTRAINT `FK_log_user_change_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='使用者變更記錄';

-- 正在傾印表格  pcb.log_user_change 的資料：~13 rows (大約)
DELETE FROM `log_user_change`;
/*!40000 ALTER TABLE `log_user_change` DISABLE KEYS */;
INSERT INTO `log_user_change` (`id`, `user_id`, `action`, `memo`, `created_time`, `update_time`) VALUES
	(44, 2, 2, 'Set deactive by user 1', '2018-05-14 15:43:46', '2018-05-14 15:43:46'),
	(48, 2, 2, 'Set active by user 1', '2018-05-14 15:43:48', '2018-05-14 15:43:48'),
	(51, 2, 2, 'Set deactive by user 1', '2018-05-14 15:43:50', '2018-05-14 15:43:50'),
	(54, 2, 2, 'Set active by user 1', '2018-05-14 15:43:51', '2018-05-14 15:43:51'),
	(58, 2, 2, 'Set deactive by user 1', '2018-05-14 15:45:18', '2018-05-14 15:45:18'),
	(62, 2, 2, 'Set active by user 1', '2018-05-14 15:45:21', '2018-05-14 15:45:21'),
	(63, 2, 2, 'Set deactive by user 1', '2018-05-14 15:45:22', '2018-05-14 15:45:22'),
	(67, 2, 2, 'Set active by user 1', '2018-05-14 15:45:24', '2018-05-14 15:45:24'),
	(70, 2, 2, 'Set deactive by user 1', '2018-05-14 15:45:27', '2018-05-14 15:45:27'),
	(76, 2, 1, 'Password changed by user 1', '2018-05-14 16:16:06', '2018-05-14 16:16:06'),
	(85, 2, 1, 'Password changed by user 1', '2018-05-14 17:08:34', '2018-05-14 17:08:34'),
	(86, 2, 1, 'Password changed by user 1', '2018-05-14 17:09:09', '2018-05-14 17:09:09'),
	(89, 2, 2, 'Set active by user 1', '2018-05-14 17:11:22', '2018-05-14 17:11:22');
/*!40000 ALTER TABLE `log_user_change` ENABLE KEYS */;

-- 傾印  表格 pcb.machines 結構
DROP TABLE IF EXISTS `machines`;
CREATE TABLE IF NOT EXISTS `machines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_name` varchar(120) DEFAULT '',
  `machine_name` varchar(120) DEFAULT '',
  `pcb_id` varchar(64) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `delete_flag` bit(1) NOT NULL DEFAULT b'0',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pcb_id` (`pcb_id`),
  KEY `FK_machines_users` (`user_id`),
  KEY `store_name` (`store_name`),
  CONSTRAINT `FK_machines_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='機器實體';

-- 正在傾印表格  pcb.machines 的資料：~2 rows (大約)
DELETE FROM `machines`;
/*!40000 ALTER TABLE `machines` DISABLE KEYS */;
INSERT INTO `machines` (`id`, `store_name`, `machine_name`, `pcb_id`, `user_id`, `delete_flag`, `created_time`, `update_time`) VALUES
	(49, 'nnnkk', '', '954455522', 199, b'0', '2018-05-10 18:18:20', '2018-05-25 15:01:14'),
	(50, 'ddd', '', '434344', 2, b'0', '2018-05-10 18:23:15', '2018-05-25 11:15:37');
/*!40000 ALTER TABLE `machines` ENABLE KEYS */;

-- 傾印  表格 pcb.machine_version 結構
DROP TABLE IF EXISTS `machine_version`;
CREATE TABLE IF NOT EXISTS `machine_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `machine_id` int(10) unsigned NOT NULL,
  `current_version` varchar(24) NOT NULL,
  `target_version` varchar(24) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_connect_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_machine_version_machines` (`machine_id`),
  CONSTRAINT `FK_machine_version_machines` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='機器版本';

-- 正在傾印表格  pcb.machine_version 的資料：~0 rows (大約)
DELETE FROM `machine_version`;
/*!40000 ALTER TABLE `machine_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_version` ENABLE KEYS */;

-- 傾印  表格 pcb.maps 結構
DROP TABLE IF EXISTS `maps`;
CREATE TABLE IF NOT EXISTS `maps` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `map_name` varchar(32) NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` varchar(32) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其他對應表';

-- 正在傾印表格  pcb.maps 的資料：~0 rows (大約)
DELETE FROM `maps`;
/*!40000 ALTER TABLE `maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `maps` ENABLE KEYS */;

-- 傾印  表格 pcb.permissions 結構
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `description` varchar(200) NOT NULL DEFAULT '',
  `admin_only` bit(1) NOT NULL DEFAULT b'0',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='權限表';

-- 正在傾印表格  pcb.permissions 的資料：~20 rows (大約)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `sort`, `description`, `admin_only`, `update_time`, `created_time`) VALUES
	(1, 'accounting_view', 1, '', b'0', '2018-05-16 18:16:08', '2018-05-15 16:18:04'),
	(2, 'operations_view', 2, '', b'0', '2018-05-16 18:16:10', '2018-05-15 16:18:20'),
	(3, 'transactions_view', 3, '', b'0', '2018-05-16 18:16:13', '2018-05-15 16:18:30'),
	(4, 'machinelist_view', 4, '', b'0', '2018-05-16 18:16:16', '2018-05-15 16:18:38'),
	(5, 'machinelist_create', 4, '', b'1', '2018-05-16 18:16:21', '2018-05-15 16:18:49'),
	(6, 'machinelist_edit', 4, '', b'0', '2018-05-16 18:16:24', '2018-05-15 16:18:57'),
	(7, 'machinelist_delete', 4, '', b'1', '2018-05-16 18:16:42', '2018-05-15 16:19:02'),
	(8, 'machinetransfer_view', 5, '', b'0', '2018-05-16 18:16:44', '2018-05-15 16:19:11'),
	(9, 'machinetransfer_edit', 5, '', b'0', '2018-05-16 18:16:45', '2018-05-15 16:19:26'),
	(10, 'coreuser_view', 6, '', b'1', '2018-05-16 18:16:47', '2018-05-15 16:19:33'),
	(11, 'coreuser_create', 6, '', b'1', '2018-05-16 18:16:49', '2018-05-15 16:19:40'),
	(12, 'coreuser_edit', 6, '', b'1', '2018-05-16 18:16:51', '2018-05-15 16:19:45'),
	(13, 'coreuser_delete', 6, '', b'1', '2018-05-16 18:16:55', '2018-05-15 16:19:50'),
	(14, 'agency_view', 7, '', b'0', '2018-05-16 18:16:57', '2018-05-15 16:19:58'),
	(15, 'agency_create', 7, '', b'0', '2018-05-16 18:17:00', '2018-05-15 16:20:04'),
	(16, 'agency_edit', 7, '', b'0', '2018-05-16 18:17:01', '2018-05-15 16:20:11'),
	(17, 'agency_delete', 7, '', b'0', '2018-05-16 18:17:03', '2018-05-15 16:20:17'),
	(18, 'versionsetting_view', 8, '', b'0', '2018-05-16 18:17:05', '2018-05-15 16:20:25'),
	(19, 'versionsetting_edit', 8, '', b'1', '2018-05-16 18:17:06', '2018-05-15 16:20:32'),
	(20, 'jpstatus_view', 9, '', b'0', '2018-05-16 18:17:08', '2018-05-15 16:20:40');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- 傾印  表格 pcb.roles 結構
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在傾印表格  pcb.roles 的資料：~2 rows (大約)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `description`, `update_time`, `created_time`) VALUES
	(1, 'coreuser', 'default admin', '2018-05-15 16:32:53', '2018-05-15 16:16:54'),
	(2, 'agency', 'default agency', '2018-05-15 16:17:29', '2018-05-15 16:17:05');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- 傾印  表格 pcb.role_permission 結構
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `role_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FK_role_permission_permissions` (`permission_id`),
  CONSTRAINT `FK_role_permission_permissions` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `FK_role_permission_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色權限對應表';

-- 正在傾印表格  pcb.role_permission 的資料：~31 rows (大約)
DELETE FROM `role_permission`;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` (`role_id`, `permission_id`, `created_time`, `update_time`) VALUES
	(1, 1, '2018-05-15 16:21:11', '2018-05-15 16:21:11'),
	(1, 2, '2018-05-15 16:21:11', '2018-05-15 16:21:11'),
	(1, 3, '2018-05-15 16:24:47', '2018-05-15 16:24:47'),
	(1, 4, '2018-05-15 16:25:09', '2018-05-15 16:25:09'),
	(1, 5, '2018-05-15 16:28:06', '2018-05-15 16:28:06'),
	(1, 6, '2018-05-15 16:28:06', '2018-05-15 16:28:06'),
	(1, 7, '2018-05-15 16:28:06', '2018-05-15 16:28:06'),
	(1, 8, '2018-05-15 16:28:06', '2018-05-15 16:28:06'),
	(1, 9, '2018-05-15 16:28:06', '2018-05-15 16:28:06'),
	(1, 10, '2018-05-15 16:28:06', '2018-05-15 16:28:06'),
	(1, 11, '2018-05-15 16:28:06', '2018-05-15 16:28:06'),
	(1, 12, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(1, 13, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(1, 14, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(1, 15, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(1, 16, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(1, 17, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(1, 18, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(1, 19, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(1, 20, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 1, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 2, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 3, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 4, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 6, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 8, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 9, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 14, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 15, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 16, '2018-05-15 16:28:07', '2018-05-15 16:28:07'),
	(2, 17, '2018-05-15 16:28:07', '2018-05-15 16:28:07');
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;

-- 傾印  程序 pcb.sp_addMachine 結構
DROP PROCEDURE IF EXISTS `sp_addMachine`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addMachine`(
	IN `p_pcbID` VARCHAR(50),
	IN `p_storeName` VARCHAR(50),
	IN `p_userID` INT


)
IF NOT EXISTS (SELECT 1 FROM machines WHERE pcb_id = p_pcbID) THEN
BEGIN
	INSERT INTO machines(pcb_id, store_name, user_id) VALUES(p_pcbID, p_storeName, p_userID);
END;
ELSE
BEGIN
	SIGNAL SQLSTATE '45000'
 	SET MESSAGE_TEXT = 'MachineID duplicated.'; 	
END;
END IF//
DELIMITER ;

-- 傾印  程序 pcb.sp_addUser 結構
DROP PROCEDURE IF EXISTS `sp_addUser`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addUser`(
	IN `p_exeid` INT,
	IN `p_account` VARCHAR(50),
	IN `p_pwd` VARCHAR(500),
	IN `p_admin` BIT



,
	IN `p_createdtime` DATETIME




























)
proc_label:BEGIN
	DECLARE EXIT HANDLER for sqlexception
	BEGIN
	GET DIAGNOSTICS CONDITION 1
	@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	SELECT 0;
	ROLLBACK;
	RESIGNAL;
	END;
	/*
	DECLARE EXIT HANDLER for sqlwarning
	BEGIN
	GET DIAGNOSTICS CONDITION 1
	@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	SELECT 0;
	ROLLBACK;
	RESIGNAL;
	END;
	*/
	START TRANSACTION;
	IF NOT EXISTS (SELECT 1 FROM users WHERE account = p_account) THEN
	BEGIN
		SET @exeIsAdmin = EXISTS(SELECT 1 FROM users WHERE id = p_exeid AND admin = 1);
		IF !@exeIsAdmin AND p_admin THEN
		BEGIN
			SIGNAL SQLSTATE '45000'
		 	SET MESSAGE_TEXT = 'Permission denied.';
		 	LEAVE proc_label;
		END;
		ELSE
		BEGIN
			INSERT INTO users(account, encrypted_password, admin, created_time) VALUES(p_account, p_pwd, p_admin, p_createdtime);
			SET @userID = LAST_INSERT_ID();
			IF p_admin AND @exeIsAdmin THEN
			BEGIN
				SELECT id INTO @defaultAdminRoleID FROM roles WHERE name = "coreuser" LIMIT 1;
				#exe account is default role, add default role to new account
				IF EXISTS (SELECT 1 FROM user_role WHERE user_id = p_exeid AND role_id = @defaultAdminRoleID) THEN
				BEGIN
					INSERT INTO user_role(user_id, role_id) VALUES(@userID, @defaultAdminRoleID);
				END;
				#exe account is specific permissions, add inherit permissions to new account.
				ELSE
				BEGIN
					INSERT INTO roles(name, description) VALUES(p_account, "specific permissions");
					SET @roleID = LAST_INSERT_ID();
					INSERT INTO user_role(user_id, role_id) VALUES(@userID, @roleID);
					INSERT INTO role_permission(role_id, permission_id) 
						SELECT @roleID AS role_id, permission_id FROM role_permission WHERE role_id = (SELECT role_id FROM user_role WHERE user_id = p_exeid);
				END;
				END IF;
			END;
			ELSE
			BEGIN
				SELECT id INTO @defaultAgencyRoleID FROM roles WHERE name = "agency";
				#exe account is admin, add default agency role to new account.
				#exe account is agency and default role, add default agency role to new account.
				IF @exeIsAdmin OR EXISTS(SELECT 1 FROM user_role WHERE user_id = p_exeid AND role_id = @defaultAgencyRoleID) THEN
				BEGIN
					INSERT INTO user_role(user_id, role_id) VALUES(@userID, @defaultAgencyRoleID);
				END;
				#exe account is agency and specific permissions, add inherit permissions to new account.
				ELSE
				BEGIN
					INSERT INTO roles(name, description) VALUES(p_account, "specific permissions");
					SET @roleID = LAST_INSERT_ID();
					INSERT INTO user_role(user_id, role_id) VALUES(@userID, @roleID);
					INSERT INTO role_permission(role_id, permission_id) 
						SELECT @roleID AS role_id, permission_id FROM role_permission WHERE role_id = (SELECT role_id FROM user_role WHERE user_id = p_exeid);
				END;
				END IF;
			END;
			END IF;
			#add user_node start
--    		SET @rowCount = ROW_COUNT();
			SELECT lft INTO @myLeft FROM user_node WHERE user_id = p_exeid;
			SELECT rgt FROM user_node WHERE rgt > (SELECT rgt FROM user_node
			WHERE user_id = p_exeid) OR lft > (SELECT rgt FROM user_node
			WHERE user_id = p_exeid) OR user_id = p_exeid FOR UPDATE;
			
			UPDATE user_node SET rgt = rgt + 2 WHERE rgt > @myLeft;
			UPDATE user_node SET lft = lft + 2 WHERE lft > @myLeft;
			
			INSERT INTO user_node(user_id, parent_id, lft, rgt) VALUES(@userID, p_exeid, @myLeft + 1, @myLeft + 2);
#			UPDATE user_node SET rgt = rgt + 2 WHERE user_id = p_exeid;
			
			#add user_node end
		END;
		END IF;
	END;
	ELSE
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Account Name duplicated.';
	END;
	END IF;
	COMMIT;
	SELECT @userID AS user_id;
END//
DELIMITER ;

-- 傾印  程序 pcb.sp_deleteMachine 結構
DROP PROCEDURE IF EXISTS `sp_deleteMachine`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteMachine`(
	IN `p_id` INT






)
IF NOT EXISTS (SELECT 1 FROM transactions where pcb_id = (SELECT pcb_id FROM machines WHERE id = p_id) LIMIT 1) THEN
BEGIN
	DELETE FROM machines WHERE id = p_id;
END;
ELSE
BEGIN
	SIGNAL SQLSTATE '45000'
 	SET MESSAGE_TEXT = 'Exist transaction records, can''t delete.';
END;
END IF//
DELIMITER ;

-- 傾印  程序 pcb.sp_editMachine 結構
DROP PROCEDURE IF EXISTS `sp_editMachine`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editMachine`(
	IN `p_id` INT,
	IN `p_storeName` VARCHAR(50),
	IN `p_userID` INT




)
UPDATE machines SET store_name = p_storeName, user_id = p_userID
WHERE id = p_id//
DELIMITER ;

-- 傾印  程序 pcb.sp_editUserActive 結構
DROP PROCEDURE IF EXISTS `sp_editUserActive`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editUserActive`(
	IN `p_exeid` INT,
	IN `p_id` INT

)
IF EXISTS(SELECT 1 FROM users WHERE id = p_id) THEN
	BEGIN
		SET @currentState = null;
		SELECT state FROM users WHERE id = p_id LIMIT 1 INTO @currentState;
		IF @currentState = 1 THEN
			BEGIN
				UPDATE users SET state = 2
				WHERE id = p_id;
				INSERT INTO log_user_change(user_id, `action`, memo) VALUES(p_id, 2, CONCAT('Set deactive by user ', p_exeid));
				SELECT 2 AS `state`;
			END;
		ELSE IF @currentState = 2 THEN
			BEGIN
				UPDATE users SET state = 1
				WHERE id = p_id;
				INSERT INTO log_user_change(user_id, `action`, memo) VALUES(p_id, 2, CONCAT('Set active by user ', p_exeid));
				SELECT 1 AS `state`;
			END;
			END IF;
		END IF;
	END;
ELSE
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Account not found.';
	END;
END IF//
DELIMITER ;

-- 傾印  程序 pcb.sp_editUserPassword 結構
DROP PROCEDURE IF EXISTS `sp_editUserPassword`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editUserPassword`(
	IN `p_exeid` INT,
	IN `p_id` INT,
	IN `p_pwd` VARCHAR(500)






)
IF EXISTS(SELECT 1 FROM users WHERE id = p_id) AND p_pwd > '' THEN
	BEGIN
		UPDATE users SET encrypted_password = p_pwd
		WHERE id = p_id;
		INSERT INTO log_user_change(user_id, `action`, memo) VALUES(p_id, 1, CONCAT('Password changed by user ', p_exeid));
	END;
ELSE
BEGIN
	SIGNAL SQLSTATE '45000'
 	SET MESSAGE_TEXT = 'Account not found or password is blank.'; 	
END;
END IF//
DELIMITER ;

-- 傾印  程序 pcb.sp_editUserPermissions 結構
DROP PROCEDURE IF EXISTS `sp_editUserPermissions`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editUserPermissions`(
	IN `p_exeid` INT,
	IN `p_userid` INT,
	IN `p_permissions` VARCHAR(500)























)
proc_label:BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
	ROLLBACK;
	GET DIAGNOSTICS CONDITION 1
	@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	SELECT 0;
	RESIGNAL;
	END;
	/*
	DECLARE exit handler for sqlwarning
	BEGIN
	GET DIAGNOSTICS CONDITION 1
	@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	SELECT @p1 as RETURNED_SQLSTATE  , @p2 as MESSAGE_TEXT;
	ROLLBACK;
	RESIGNAL;
	END;
	*/
	START TRANSACTION;
	SET @roleID = 0;
	SET @permissionList = CONCAT('''',REPLACE(REPLACE(p_permissions ,' ',''),',',QUOTE(',')),'''');
	SET @permissionStub = REPLACE(@permissionList,',','');
	SET @permissionCount = CASE WHEN(ISNULL(p_permissions) OR p_permissions = '') THEN 0 ELSE (LENGTH(@permissionList) - LENGTH(@permissionStub) + 1) END;
	SELECT account,admin INTO @account, @isAdmin FROM users WHERE id = p_userid;
	
	IF p_userid = p_exeid THEN
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Permission denied.';
	 	LEAVE proc_label;
	END;
	END IF;
	
	IF @account = '' OR ISNULL(@account) THEN
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Account not found.';
	 	LEAVE proc_label;
	END;
	END IF;
	
	#IF role is default, create new role map to user
	IF EXISTS(SELECT 1 FROM roles r INNER JOIN user_role ur ON ur.user_id = p_userid AND ur.role_id = r.id WHERE (r.name = "coreuser" OR r.name = "agency")) THEN
	BEGIN
		INSERT INTO roles(name, description) VALUES(@account, "specific permissions");
		SET @roleID = LAST_INSERT_ID();
		UPDATE user_role SET role_id = @roleID WHERE user_id = p_userid;
	END;
	ELSE
	BEGIN
		SELECT id INTO @roleID FROM roles r INNER JOIN user_role ur ON ur.user_id = p_userid AND ur.role_id = r.id;
	END;
	END IF;
	
	DELETE FROM role_permission WHERE role_id = @roleID;
	
	SET @x = 0;
	WHILE @x < @permissionCount DO
		SET @x = @x + 1;
		SET @permission = SUBSTRING_INDEX(SUBSTRING_INDEX(p_permissions, ',', @x), ',', -1);
		SELECT id INTO @permissionID FROM permissions WHERE name = @permission;
		IF ISNULL(@permissionID) THEN
		BEGIN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Input permission string error, can not found.';
			LEAVE proc_label;
		END;
		END IF;
		IF NOT EXISTS(SELECT 1 FROM role_permission rp INNER JOIN user_role ur ON ur.user_id = p_exeid AND rp.role_id = ur.role_id WHERE rp.permission_id = @permissionID)  OR
			EXISTS(SELECT 1 FROM role_permission rp INNER JOIN permissions p ON rp.permission_id=@permissionID AND rp.permission_id = p.id WHERE admin_only = 1 AND !(@isAdmin = 1))
		THEN
		BEGIN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Permission denied.';
			LEAVE proc_label;
		END;
		ELSE
		BEGIN
			INSERT INTO role_permission(role_id, permission_id) VALUES(@roleID, @permissionID);
		END;
		END IF;
	END WHILE;
   SET @rowCount = 1;
	COMMIT;
	SELECT @rowCount;
END//
DELIMITER ;

-- 傾印  程序 pcb.sp_getDashboard 結構
DROP PROCEDURE IF EXISTS `sp_getDashboard`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getDashboard`(
	IN `p_start_time` DATETIME,
	IN `p_end_time` DATETIME






)
    COMMENT 'index'
(SELECT *,
IFNULL((total_out/total_in), 0.0) AS out_rate,
IFNULL((total_win/total_bet), 0.0) AS win_rate,
IFNULL((total_win_times/total_play_times), 0.0) AS hit_rate 
FROM 
(SELECT
IFNULL(SUM(credit_in), 0) AS total_in,
IFNULL(SUM(credit_out), 0) AS total_out,
IFNULL(SUM(bet), 0) AS total_bet,
IFNULL(SUM(win), 0) AS total_win,
IFNULL(SUM(bet > 0), 0) AS total_play_times,
IFNULL(SUM(bet > 0 && win > 0), 0) AS total_win_times
FROM transactions
WHERE created_time BETWEEN p_start_time AND p_end_time) T)
UNION ALL
(SELECT *,
IFNULL((total_out/total_in), 0.0) AS out_rate,
IFNULL((total_win/total_bet), 0.0) AS win_rate,
IFNULL((total_win_times/total_play_times), 0.0) AS hit_rate 
FROM 
(SELECT
IFNULL(SUM(credit_in), 0) AS total_in,
IFNULL(SUM(credit_out), 0) AS total_out,
IFNULL(SUM(bet), 0) AS total_bet,
IFNULL(SUM(win), 0) AS total_win,
IFNULL(SUM(bet > 0), 0) AS total_play_times,
IFNULL(SUM(bet > 0 && win > 0), 0) AS total_win_times
FROM transactions
WHERE created_time BETWEEN DATE_SUB(p_start_time, INTERVAL 1 DAY) AND p_end_time) T)
UNION ALL
(SELECT *,
IFNULL((total_out/total_in), 0.0) AS out_rate,
IFNULL((total_win/total_bet), 0.0) AS win_rate,
IFNULL((total_win_times/total_play_times), 0.0) AS hit_rate 
FROM 
(SELECT
IFNULL(SUM(credit_in), 0) AS total_in,
IFNULL(SUM(credit_out), 0) AS total_out,
IFNULL(SUM(bet), 0) AS total_bet,
IFNULL(SUM(win), 0) AS total_win,
IFNULL(SUM(bet > 0), 0) AS total_play_times,
IFNULL(SUM(bet > 0 && win > 0), 0) AS total_win_times
FROM transactions
WHERE created_time BETWEEN DATE_SUB(p_start_time, INTERVAL 1 WEEK) AND p_end_time) T)
UNION ALL
(SELECT *,
IFNULL((total_out/total_in), 0.0) AS out_rate,
IFNULL((total_win/total_bet), 0.0) AS win_rate,
IFNULL((total_win_times/total_play_times), 0.0) AS hit_rate 
FROM 
(SELECT
IFNULL(SUM(credit_in), 0) AS total_in,
IFNULL(SUM(credit_out), 0) AS total_out,
IFNULL(SUM(bet), 0) AS total_bet,
IFNULL(SUM(win), 0) AS total_win,
IFNULL(SUM(bet > 0), 0) AS total_play_times,
IFNULL(SUM(bet > 0 && win > 0), 0) AS total_win_times
FROM transactions
WHERE created_time BETWEEN DATE_SUB(p_start_time, INTERVAL 1 MONTH) AND p_end_time) T)//
DELIMITER ;

-- 傾印  程序 pcb.sp_getMachine 結構
DROP PROCEDURE IF EXISTS `sp_getMachine`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getMachine`(
	IN `p_id` INT


)
SELECT id, pcb_id, store_name, user_id 
FROM machines m
WHERE m.id = p_id//
DELIMITER ;

-- 傾印  程序 pcb.sp_getMachines 結構
DROP PROCEDURE IF EXISTS `sp_getMachines`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getMachines`(
	IN `p_exeid` INT



)
BEGIN
	SELECT lft, rgt INTO @lft, @rgt FROM user_node WHERE user_id = p_exeid;
		CREATE TEMPORARY TABLE IF NOT EXISTS _tmp AS ( 
		SELECT SQL_CALC_FOUND_ROWS id, store_name, machine_name, pcb_id, m.user_id, m.created_time, m.update_time 
		FROM machines m RIGHT JOIN user_node un ON m.user_id = un.user_id AND un.lft BETWEEN @lft AND @rgt AND !ISNULL(m.id)
		WHERE delete_flag <> 1
		ORDER BY created_time DESC
	);
	SET @total = FOUND_ROWS();
	SELECT @total AS total,t.* FROM _tmp t;
	DROP TEMPORARY TABLE IF EXISTS `_tmp`;
END//
DELIMITER ;

-- 傾印  程序 pcb.sp_getMachinesWithUsers 結構
DROP PROCEDURE IF EXISTS `sp_getMachinesWithUsers`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getMachinesWithUsers`(
	IN `p_exeid` INT







)
BEGIN
	DECLARE exeLft INT;   
	DECLARE exeRgt INT;  
	SELECT lft, rgt INTO exeLft, exeRgt FROM user_node WHERE user_id = p_exeid;
	
	SELECT IFNULL(m.id, 0) AS machine_id, IFNULL(m.store_name, '') AS store_name, IFNULL(m.machine_name, '') AS machine_name, IFNULL(m.pcb_id, '') AS pcb_id, t.user_id, u.account, parent_id FROM 
	machines AS m RIGHT JOIN
	users AS u ON m.user_id = u.id
	INNER JOIN(
	
		SELECT parent.user_id, parent.parent_id, COUNT(m.id) AS mcount
		FROM user_node AS node ,
	        user_node AS parent,
	        machines m
		WHERE node.lft BETWEEN parent.lft AND parent.rgt 
				AND parent.lft BETWEEN exeLft AND exeRgt
		      AND node.user_id = m.user_id
		GROUP BY parent.user_id
		ORDER BY node.lft) t ON u.id = t.user_id
	ORDER BY parent_id;
END//
DELIMITER ;

-- 傾印  程序 pcb.sp_getTopHitRate 結構
DROP PROCEDURE IF EXISTS `sp_getTopHitRate`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getTopHitRate`()
    COMMENT 'index'
SELECT 
store_name, machine_name, (IFNULL(SUM(bet > 0 && win > 0), 0)/IFNULL(SUM(bet > 0), 0)) AS value
FROM transactions t
INNER JOIN machines m ON t.pcb_id = m.pcb_id
GROUP BY m.pcb_id
ORDER BY value DESC
LIMIT 5//
DELIMITER ;

-- 傾印  程序 pcb.sp_getTopOutRate 結構
DROP PROCEDURE IF EXISTS `sp_getTopOutRate`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getTopOutRate`()
    COMMENT 'index'
SELECT 
store_name, machine_name, (SUM(credit_out)/SUM(credit_in)) AS value
FROM transactions t
INNER JOIN machines m ON t.pcb_id = m.pcb_id
GROUP BY m.pcb_id
ORDER BY value DESC
LIMIT 5//
DELIMITER ;

-- 傾印  程序 pcb.sp_getTopWinRate 結構
DROP PROCEDURE IF EXISTS `sp_getTopWinRate`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getTopWinRate`()
    COMMENT 'index'
SELECT 
store_name, machine_name, (Sum(win)/SUM(bet)) AS value
FROM transactions t
INNER JOIN machines m ON t.pcb_id = m.pcb_id
GROUP BY m.pcb_id
ORDER BY value DESC
LIMIT 5//
DELIMITER ;

-- 傾印  程序 pcb.sp_getUser 結構
DROP PROCEDURE IF EXISTS `sp_getUser`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUser`(
	IN `p_id` INT
)
SELECT id, account, created_time FROM users WHERE id = p_id//
DELIMITER ;

-- 傾印  程序 pcb.sp_getUserPermissions 結構
DROP PROCEDURE IF EXISTS `sp_getUserPermissions`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUserPermissions`(
	IN `p_exeid` INT,
	IN `p_userid` INT




,
	IN `p_admin` BIT
)
SELECT u.id, u.name, CASE WHEN(ISNULL(e.id)) THEN FALSE ELSE TRUE END AS active FROM
(SELECT p.id, p.name, p.description, p.sort FROM permissions p 
INNER JOIN role_permission rp on p.id = rp.permission_id AND rp.role_id = (SELECT role_id FROM user_role WHERE user_id = p_exeid) WHERE admin_only=false || admin_only=p_admin) u
LEFT JOIN
(SELECT p.id, p.name, p.description, p.sort FROM permissions p 
INNER JOIN role_permission rp on p.id = rp.permission_id AND rp.role_id = (SELECT role_id FROM user_role WHERE user_id = p_userid) WHERE admin_only=false || admin_only=p_admin) e
ON u.id = e.id
ORDER BY u.sort//
DELIMITER ;

-- 傾印  程序 pcb.sp_getUsers 結構
DROP PROCEDURE IF EXISTS `sp_getUsers`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUsers`(
	IN `p_admin` BIT


)
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS _tmp AS (
		SELECT SQL_CALC_FOUND_ROWS id, account, state, created_time, update_time 
		FROM users 
		WHERE admin = p_admin
		ORDER BY created_time DESC
	);
	SET @total = FOUND_ROWS();
	SELECT @total AS total,t.* FROM _tmp t;
	DROP TEMPORARY TABLE IF EXISTS `_tmp`;
END//
DELIMITER ;

-- 傾印  程序 pcb.sp_getUsersTree 結構
DROP PROCEDURE IF EXISTS `sp_getUsersTree`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUsersTree`(
	IN `p_exeid` INT



)
BEGIN
	DECLARE exeLft INT;   
	DECLARE exeRgt INT;  
	DECLARE isAdmin BIT;
	SELECT admin INTO isAdmin FROM users WHERE id = p_exeid;
	SELECT lft, rgt INTO exeLft, exeRgt FROM user_node WHERE user_id = p_exeid;
	SELECT t.user_id, u.account, parent_id FROM 
	users AS u
	INNER JOIN(
	SELECT parent.user_id, parent.parent_id
	FROM user_node AS node ,
	     user_node AS parent
	WHERE node.lft BETWEEN parent.lft AND parent.rgt 
			AND parent.lft BETWEEN exeLft AND exeRgt
			OR isAdmin
	GROUP BY parent.user_id
	ORDER BY node.lft) t ON u.id = t.user_id
	ORDER BY parent_id;
END//
DELIMITER ;

-- 傾印  程序 pcb.sp_transferMachines 結構
DROP PROCEDURE IF EXISTS `sp_transferMachines`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_transferMachines`(
	IN `p_exeid` INT,
	IN `p_machinids` VARCHAR(16384),
	IN `p_targetid` INT








)
proc_label: BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
	ROLLBACK;
	GET DIAGNOSTICS CONDITION 1
	@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	SELECT 0;
	RESIGNAL;
	END;
	
	#foreach machines
	SELECT admin INTO @isAdmin FROM users WHERE id = p_exeid;
	SELECT lft, rgt INTO @exeLft, @exeRgt FROM user_node WHERE user_id = p_exeid;
	SET @machineList = CONCAT('''',REPLACE(REPLACE(p_machinids ,' ',''),',',QUOTE(',')),'''');
	SET @machineStub = REPLACE(@machineList,',','');
	SET @machineCount = CASE WHEN(ISNULL(p_machinids) OR p_machinids = '') THEN 0 ELSE (LENGTH(@machineList) - LENGTH(@machineStub) + 1) END;
	
	#check targetid is in exeid
	IF @isAdmin THEN
		SET @nouse = 0; #is admin not nothing include check select(for performace). include self
	ELSEIF !EXISTS(SELECT 1 FROM user_node WHERE user_id = p_targetid AND lft >= @exeLft AND rgt <= @exeRgt) THEN
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Permission denied.';
	 	LEAVE proc_label;
	END;
	END IF;

	SET @x = 0;
	START TRANSACTION;
	WHILE @x < @machineCount DO
		SET @x = @x + 1;
		SET @machineid = SUBSTRING_INDEX(SUBSTRING_INDEX(p_machinids, ',', @x), ',', -1);
		#check the machines is in exeid OR exeid is admin
		SELECT user_id INTO @ownerid FROM machines WHERE id = @machineid;
		
		IF ISNULL(@ownerid) THEN
		BEGIN
			SIGNAL SQLSTATE '45000'
		 	SET MESSAGE_TEXT = 'Machine not exist.';
		 	LEAVE proc_label;
		END;
		END IF;
		
		IF @isAdmin THEN
			SET @nouse = 0; #is admin not nothing include check select(for performace).
		ELSEIF !EXISTS(SELECT 1 FROM user_node WHERE user_id = @ownerid AND lft >= @exeLft AND rgt <= @exeRgt) THEN #include self
		BEGIN
			SIGNAL SQLSTATE '45000'
		 	SET MESSAGE_TEXT = 'Permission denied.';
		 	LEAVE proc_label;
		END;
		END IF;
		
		#update machine owen to targetid
		UPDATE machines SET user_id = p_targetid WHERE id = @machineid;
	END WHILE;
	COMMIT;
	SELECT 1;
END//
DELIMITER ;

-- 傾印  程序 pcb.sp_userNodeAdd_temp 結構
DROP PROCEDURE IF EXISTS `sp_userNodeAdd_temp`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_userNodeAdd_temp`(
	IN `p_parentid` INT,
	IN `p_userid` INT





,
	IN `p_result` INT


)
BEGIN
	DECLARE EXIT handler for sqlexception
	BEGIN
	SET p_result = false;
	ROLLBACK;
	GET DIAGNOSTICS CONDITION 1
	@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	END;
	
	START TRANSACTION;
	
	SELECT 1 FROM user_node WHERE rgt > (SELECT rgt FROM user_node
	WHERE user_id = p_parentid) OR lft > (SELECT rgt FROM user_node
	WHERE user_id = p_parentid) OR user_id = p_parentid FOR UPDATE;
	SELECT rgt INTO @myRight FROM user_node WHERE user_id = p_parentid;
	
	UPDATE user_node SET rgt = rgt + 2 WHERE rgt > @myRight;
	UPDATE user_node SET lft = lft + 2 WHERE lft > @myRight;
	
	INSERT INTO user_node(user_id, parent_id, lft, rgt) VALUES(p_userid, p_parentid, @myRight + 1, @myRight + 2);
	
	COMMIT;
	SET p_result = true;
END//
DELIMITER ;

-- 傾印  程序 pcb.sp_userNodeMove 結構
DROP PROCEDURE IF EXISTS `sp_userNodeMove`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_userNodeMove`(
	IN `p_exeid` INT,
	IN `p_userid` INT,
	IN `p_targetid` INT








)
proc_label:BEGIN
	DECLARE exit handler for sqlexception
	BEGIN
	ROLLBACK;
	GET DIAGNOSTICS CONDITION 1
	@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
	SELECT 0;
	RESIGNAL;
	END;
		
	#Set IDs
	SET @dirId := p_userid; #folder (subtree) you wanna move
	SET @targetId := p_targetid; #target
	
	START TRANSACTION;
	SELECT Count(1) FROM user_node FOR UPDATE;
	
	#get datas
	SET @isRoot = false;
	SET @exeIsAdmin = false;
	SET @userIsAdmin = false;
	SET @targetIsAdmin = false;
	SELECT admin INTO @exeIsAdmin FROM users WHERE id = p_exeid;
	SELECT admin INTO @userIsAdmin FROM users WHERE id = p_userid;
	SELECT admin INTO @targetIsAdmin FROM users WHERE id = p_targetid;
	SELECT parent_id=0 INTO @isRoot FROM user_node WHERE user_id = p_userid;
	
	#root can not be change
	IF (SELECT COUNT(1) FROM user_node WHERE user_id = p_exeid OR user_id = p_userid OR user_id = p_targetid) <> 3 THEN
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Permission denied(user node not correct).';
	 	LEAVE proc_label;
	END;
	END IF;
	
	#parent can not move to it's child
	IF EXISTS(SELECT 1 FROM user_node WHERE user_id = p_userid AND rgt > (SELECT rgt FROM user_node WHERE user_id = p_targetid)) THEN
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Permission denied(parent can not move to child).';
	 	LEAVE proc_label;
	END;
	END IF;
	
	#root can not be change
	IF @isRoot THEN
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Permission denied(Root can not change).';
	 	LEAVE proc_label;
	END;
	END IF;
	
	#check admin can't below agency
	IF @userIsAdmin AND !@targetIsAdmin THEN
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Permission denied(Admin can not below Agency).';
	 	LEAVE proc_label;
	END;
	END IF;
	
	#check userid and targetid are below exeid.
	SELECT rgt, lft, rgt-lft+1 INTO @exe_rgt, @exe_lft, @dir_size FROM user_node WHERE user_id = p_exeid;
	IF NOT EXISTS(SELECT 1 FROM user_node WHERE @exeIsAdmin OR (rgt < @exe_rgt AND lft > @exe_lft AND user_id = p_targetid)) OR 
		NOT EXISTS(SELECT 1 FROM user_node WHERE @exeIsAdmin OR (rgt < @exe_rgt AND lft > @exe_lft AND user_id = p_userid)) THEN
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Permission denied.(user or target not be managed by current user.)';
	 	LEAVE proc_label;
	END;
	END IF;
	
	SELECT rgt, lft, rgt-lft+1 INTO @dir_rgt, @dir_lft, @dir_size FROM user_node WHERE user_id = @dirId;
	
	#put the moving tree aside (lft and rgt columns must allow negative int)
	UPDATE user_node SET lft = 0-lft, rgt = 0-rgt WHERE lft BETWEEN @dir_lft AND @dir_rgt;
	
	#fill the empty space        
	UPDATE user_node SET rgt = rgt-@dir_size WHERE rgt > @dir_rgt;
	UPDATE user_node SET lft = lft-@dir_size WHERE lft > @dir_rgt;
	
	#get datas of the target-folder      
	SELECT lft INTO @target_lft FROM user_node WHERE user_id = @targetId;
	
	#create space in the target-folder        
	UPDATE user_node SET rgt = rgt+@dir_size WHERE rgt >= @target_lft;
	UPDATE user_node SET lft = lft+@dir_size WHERE lft > @target_lft;
	
	#update parentid
	UPDATE user_node SET parent_id = p_targetid WHERE user_id = p_userid;
	
	#edit all nodes in the moving-tree
	UPDATE user_node SET
	   lft     = 0 - lft - (@dir_lft - @target_lft - 1), #this formula fits for all moving directions
	   rgt     = 0 - rgt - (@dir_lft - @target_lft - 1)
	WHERE 
	   lft < 0;
	   
   SELECT rgt, lft INTO @targetRgt, @targetLft FROM user_node WHERE user_id = p_targetid;
	SELECT * FROM role_permission rp2 WHERE 
		rp2.role_id	IN (SELECT role_id FROM user_role ur INNER JOIN user_node un ON un.user_id > @targetLft AND un.user_id < @targetRgt AND ur.user_id = un.user_id) AND 
		rp2.permission_id NOT IN (SELECT permission_id FROM role_permission rp INNER JOIN user_role ur ON ur.user_id = p_targetid AND rp.role_id = ur.role_id);
	
	#DELETE permission where parent node not own.
	CREATE TEMPORARY TABLE IF NOT EXISTS temp_table AS (SELECT permission_id FROM role_permission rp INNER JOIN user_role ur ON ur.user_id = p_targetid AND rp.role_id = ur.role_id);
   SELECT rgt, lft INTO @targetRgt, @targetLft FROM user_node WHERE user_id = p_targetid;
	DELETE FROM role_permission WHERE 
		role_id	IN (SELECT role_id FROM user_role ur INNER JOIN user_node un ON un.lft > @targetLft AND un.rgt < @targetRgt AND ur.user_id = un.user_id) AND 
		permission_id NOT IN (SELECT permission_id FROM temp_table);
	COMMIT;
END//
DELIMITER ;

-- 傾印  程序 pcb.tempExec 結構
DROP PROCEDURE IF EXISTS `tempExec`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `tempExec`(p_exeid int, p_account varchar(50), p_pwd varchar(50), p_admin bit, p_createdtime datetime)
BEGIN
	DECLARE `_rollback` BOOL DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
	DECLARE exit handler for sqlwarning
		BEGIN
		GET DIAGNOSTICS CONDITION 1
		@p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
		SELECT @p1 as RETURNED_SQLSTATE  , @p2 as MESSAGE_TEXT;
		ROLLBACK;
	END;
	START TRANSACTION;
	IF NOT EXISTS (SELECT 1 FROM users WHERE account = p_account) THEN
	BEGIN	
			INSERT INTO users(account, encrypted_password, admin, created_time) VALUES(p_account, p_pwd, p_admin, p_createdtime);
			SET @userID = LAST_INSERT_ID();
			SET @exeIsAdmin = EXISTS(SELECT 1 FROM users WHERE id = p_exeid AND admin = 1);
			IF p_admin AND @exeIsAdmin THEN
			BEGIN
				SELECT @defaultAdminRoleID := id,id FROM roles WHERE name = "coreuser";
				#exe account is default role, add default role to new account
				SELECT @defaultAdminRoleID,p_exeid;
				IF EXISTS (SELECT 1 FROM user_role WHERE user_id = p_exeid AND role_id = @defaultAdminRoleID) THEN
				BEGIN
					INSERT INTO user_role(user_id, role_id) VALUES(@userID, @defaultAdminRoleID);
				END;
				#exe account is specific permissions, add inherit permissions to new account.
				ELSE
				BEGIN
					INSERT INTO roles(name, description) VALUES(p_account, "specific permissions");
					SET @roleID = LAST_INSERT_ID();
					INSERT INTO user_role(user_id, role_id) VALUES(@userID, @roleID);
					#INSERT INTO role_permission(role_id, permission_id) 
						SELECT @roleID AS role_id, permission_id FROM role_permission source WHERE source.id = (SELECT role_id FROM user_role WHERE user_id = p_exeid) ;
				END;
				END IF;
			END;
			ELSE
			BEGIN
				#exe account is admin, add default agency role to new account.
				#exe account is agency and default role, add default agency role to new account.
				#exe account is agency and specific permissions, add inherit permissions to new account.
			SELECT 1;
			END;
			END IF;
	END;
	ELSE
	BEGIN
		SIGNAL SQLSTATE '45000'
	 	SET MESSAGE_TEXT = 'Account Name duplicated.'; 	
	END;
	END IF;
	COMMIT;
END//
DELIMITER ;

-- 傾印  表格 pcb.todos 結構
DROP TABLE IF EXISTS `todos`;
CREATE TABLE IF NOT EXISTS `todos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在傾印表格  pcb.todos 的資料：~0 rows (大約)
DELETE FROM `todos`;
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;

-- 傾印  表格 pcb.transactions 結構
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pcb_id` varchar(64) NOT NULL,
  `round_id` varchar(64) NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  `money_to_credit_radio` int(10) unsigned NOT NULL COMMENT '這邊是1元換幾分',
  `transaction_type` bigint(20) unsigned NOT NULL,
  `start_credit` int(10) unsigned NOT NULL,
  `result_credit` int(10) unsigned NOT NULL,
  `credit_in` int(10) unsigned NOT NULL DEFAULT '0',
  `credit_out` int(10) unsigned NOT NULL DEFAULT '0',
  `credit_type` bigint(20) unsigned DEFAULT NULL,
  `bet` int(10) unsigned NOT NULL DEFAULT '0',
  `win` int(10) unsigned NOT NULL DEFAULT '0',
  `game_type` int(10) unsigned DEFAULT NULL,
  `memo` json DEFAULT NULL,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `currency_id` (`currency_id`),
  KEY `transaction_type` (`transaction_type`),
  KEY `credit_type` (`credit_type`),
  KEY `game_type` (`game_type`),
  KEY `pcb_id` (`pcb_id`),
  CONSTRAINT `FK_transactions_currencies` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `FK_transactions_machines` FOREIGN KEY (`pcb_id`) REFERENCES `machines` (`pcb_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='交易資料表，包含SPIN、儲值、兌回、JP等';

-- 正在傾印表格  pcb.transactions 的資料：~3 rows (大約)
DELETE FROM `transactions`;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`id`, `pcb_id`, `round_id`, `currency_id`, `money_to_credit_radio`, `transaction_type`, `start_credit`, `result_credit`, `credit_in`, `credit_out`, `credit_type`, `bet`, `win`, `game_type`, `memo`, `created_time`, `update_time`) VALUES
	(1, '954455522', '21589965', 1, 100, 1, 2262, 2362, 0, 0, NULL, 50, 150, 1, '{}', '2018-05-08 10:26:27', '2018-05-10 18:14:06'),
	(2, '954455522', '21589965', 1, 100, 1, 2262, 2362, 0, 0, NULL, 50, 0, 1, '{}', '2018-05-08 10:26:27', '2018-05-10 18:14:08'),
	(3, '954455522', '21589965', 1, 100, 1, 2262, 2362, 120, 0, NULL, 0, 0, 1, '{}', '2018-05-08 10:26:27', '2018-05-10 18:14:10'),
	(5, '434344', '21589965', 1, 100, 1, 2262, 2362, 120, 0, NULL, 0, 0, 1, '{}', '2018-05-08 10:26:27', '2018-05-10 18:14:10');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- 傾印  表格 pcb.users 結構
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(36) NOT NULL,
  `encrypted_password` char(128) NOT NULL,
  `current_sign_in_ip` varchar(15) NOT NULL DEFAULT '',
  `last_sign_in_ip` varchar(15) NOT NULL DEFAULT '',
  `admin` bit(1) NOT NULL DEFAULT b'0',
  `state` int(10) unsigned NOT NULL DEFAULT '1',
  `login_fail_count` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='使用者主表';

-- 正在傾印表格  pcb.users 的資料：~10 rows (大約)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `account`, `encrypted_password`, `current_sign_in_ip`, `last_sign_in_ip`, `admin`, `state`, `login_fail_count`, `created_time`, `update_time`) VALUES
	(2, 'testtest1', 'ae7fc45fda7215a7999d2a60d5117d64caba6490188cd6d8412fadfd4138c54fa23cdb54ecc7b0e5cb546b2cf3aa0bf78c4226539b02c0a40cccce560b60e52c', '', '', b'1', 1, 0, '2018-05-11 14:15:26', '2018-05-14 17:11:22'),
	(195, 'Admin-1', '', '', '', b'1', 1, 0, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(196, 'Admin-2', '', '', '', b'1', 1, 0, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(197, 'Admin-3', '', '', '', b'1', 1, 0, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(198, 'Admin-4', '', '', '', b'1', 1, 0, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(199, 'Agency-1', '', '', '', b'0', 1, 0, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(200, 'Agency-2', '', '', '', b'0', 1, 0, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(201, 'Agency-3', '', '', '', b'0', 1, 0, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(202, 'Agency-4', '', '', '', b'0', 1, 0, '2018-05-25 14:53:43', '2018-05-25 14:53:43'),
	(203, 'Agency-5', '', '', '', b'0', 1, 0, '2018-05-25 14:53:43', '2018-05-25 14:53:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 傾印  表格 pcb.user_node 結構
DROP TABLE IF EXISTS `user_node`;
CREATE TABLE IF NOT EXISTS `user_node` (
  `user_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `lft` bigint(20) NOT NULL,
  `rgt` bigint(20) NOT NULL,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  KEY `parent_id_lft_rgt` (`parent_id`,`lft`,`rgt`),
  CONSTRAINT `FK_user_node_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='使用者節點描述表';

-- 正在傾印表格  pcb.user_node 的資料：~10 rows (大約)
DELETE FROM `user_node`;
/*!40000 ALTER TABLE `user_node` DISABLE KEYS */;
INSERT INTO `user_node` (`user_id`, `parent_id`, `lft`, `rgt`, `created_time`, `update_time`) VALUES
	(2, 0, 1, 20, '2018-05-17 17:38:46', '2018-05-25 14:53:43'),
	(195, 2, 12, 19, '2018-05-25 14:53:42', '2018-05-25 14:53:43'),
	(196, 2, 4, 11, '2018-05-25 14:53:42', '2018-05-25 14:53:43'),
	(197, 2, 2, 3, '2018-05-25 14:53:42', '2018-05-25 14:53:43'),
	(198, 195, 17, 18, '2018-05-25 14:53:42', '2018-05-25 14:53:43'),
	(199, 195, 15, 16, '2018-05-25 14:53:42', '2018-05-25 14:53:43'),
	(200, 195, 13, 14, '2018-05-25 14:53:42', '2018-05-25 14:53:43'),
	(201, 196, 5, 10, '2018-05-25 14:53:42', '2018-05-25 14:53:43'),
	(202, 201, 8, 9, '2018-05-25 14:53:43', '2018-05-25 14:53:43'),
	(203, 201, 6, 7, '2018-05-25 14:53:43', '2018-05-25 14:53:43');
/*!40000 ALTER TABLE `user_node` ENABLE KEYS */;

-- 傾印  表格 pcb.user_role 結構
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_user_role_roles` (`role_id`),
  CONSTRAINT `FK_user_role_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_user_role_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='使用者角色對應表';

-- 正在傾印表格  pcb.user_role 的資料：~10 rows (大約)
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`user_id`, `role_id`, `created_time`, `update_time`) VALUES
	(2, 1, '2018-05-15 16:50:10', '2018-05-16 18:24:34'),
	(195, 1, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(196, 1, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(197, 1, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(198, 1, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(199, 2, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(200, 2, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(201, 2, '2018-05-25 14:53:42', '2018-05-25 14:53:42'),
	(202, 2, '2018-05-25 14:53:43', '2018-05-25 14:53:43'),
	(203, 2, '2018-05-25 14:53:43', '2018-05-25 14:53:43');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
