-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-03-2025 a las 14:55:05
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `zktimenet`
--
CREATE DATABASE IF NOT EXISTS `zktimenet` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `zktimenet`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_break`
--

DROP TABLE IF EXISTS `att_break`;
CREATE TABLE IF NOT EXISTS `att_break` (
  `id` int NOT NULL AUTO_INCREMENT,
  `break_id` int NOT NULL,
  `break_name` varchar(64) DEFAULT NULL,
  `break_start` datetime NOT NULL,
  `break_end` datetime NOT NULL,
  `break_deduct` tinyint(1) NOT NULL,
  `break_autodeduct` tinyint(1) DEFAULT NULL,
  `break_deductminute` int DEFAULT NULL,
  `break_maxlong` int DEFAULT NULL,
  `break_minlong` int DEFAULT NULL,
  `break_overcount_paycode` int DEFAULT NULL,
  `break_overcount` tinyint(1) DEFAULT NULL,
  `break_needcheck` tinyint(1) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_break_shift`
--

DROP TABLE IF EXISTS `att_break_shift`;
CREATE TABLE IF NOT EXISTS `att_break_shift` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `break_id` int DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `break_id` (`break_id`),
  KEY `shift_id` (`shift_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_day_details`
--

DROP TABLE IF EXISTS `att_day_details`;
CREATE TABLE IF NOT EXISTS `att_day_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `att_date` datetime NOT NULL,
  `sortindex` int NOT NULL,
  `checkin` datetime DEFAULT NULL,
  `lunchin` datetime DEFAULT NULL,
  `lunchout` datetime DEFAULT NULL,
  `breakin` datetime DEFAULT NULL,
  `breakout` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  `hours` datetime DEFAULT NULL,
  `worked` datetime DEFAULT NULL,
  `roundedin` datetime DEFAULT NULL,
  `roundedout` datetime DEFAULT NULL,
  `roundworked` datetime DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `shift_ID` int DEFAULT NULL,
  `workcode_id` int DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shift_ID` (`shift_ID`),
  KEY `workcode_id` (`workcode_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_day_summary`
--

DROP TABLE IF EXISTS `att_day_summary`;
CREATE TABLE IF NOT EXISTS `att_day_summary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `att_date` datetime NOT NULL,
  `pc_results` decimal(10,0) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `paycode_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `shift_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paycode_id` (`paycode_id`),
  KEY `shift_id` (`shift_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_employee_group`
--

DROP TABLE IF EXISTS `att_employee_group`;
CREATE TABLE IF NOT EXISTS `att_employee_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `groupitem_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groupitem_id` (`groupitem_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_emp_paycode`
--

DROP TABLE IF EXISTS `att_emp_paycode`;
CREATE TABLE IF NOT EXISTS `att_emp_paycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `allowed` decimal(10,0) DEFAULT NULL,
  `taken` decimal(10,0) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `term` int DEFAULT NULL,
  `paycode_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paycode_id` (`paycode_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_emp_terminal`
--

DROP TABLE IF EXISTS `att_emp_terminal`;
CREATE TABLE IF NOT EXISTS `att_emp_terminal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disable` tinyint(1) DEFAULT NULL,
  `device_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_exceptionassign`
--

DROP TABLE IF EXISTS `att_exceptionassign`;
CREATE TABLE IF NOT EXISTS `att_exceptionassign` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exception_date` datetime DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `paycode_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paycode_id` (`paycode_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_holiday2company`
--

DROP TABLE IF EXISTS `att_holiday2company`;
CREATE TABLE IF NOT EXISTS `att_holiday2company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `disable` tinyint(1) DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `hod_id` int NOT NULL,
  `cmp_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hod_id` (`hod_id`),
  KEY `cmp_id` (`cmp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_holiday2dept`
--

DROP TABLE IF EXISTS `att_holiday2dept`;
CREATE TABLE IF NOT EXISTS `att_holiday2dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `disable` tinyint(1) DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `hod_id` int NOT NULL,
  `dpt_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hod_id` (`hod_id`),
  KEY `dpt_id` (`dpt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_holiday2emp`
--

DROP TABLE IF EXISTS `att_holiday2emp`;
CREATE TABLE IF NOT EXISTS `att_holiday2emp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `disable` tinyint(1) DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `hod_id` int NOT NULL,
  `emp_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hod_id` (`hod_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_holiday_details`
--

DROP TABLE IF EXISTS `att_holiday_details`;
CREATE TABLE IF NOT EXISTS `att_holiday_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hod_startdate` datetime NOT NULL,
  `hod_enddate` datetime NOT NULL,
  `hod_hours` decimal(10,0) DEFAULT NULL,
  `hod_rate` decimal(10,0) DEFAULT NULL,
  `hod_year` int DEFAULT NULL,
  `hod_count` int DEFAULT NULL,
  `hod_count_type` int DEFAULT NULL,
  `IsSelect` int DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `hodtype_ID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hodtype_ID` (`hodtype_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_holiday_type`
--

DROP TABLE IF EXISTS `att_holiday_type`;
CREATE TABLE IF NOT EXISTS `att_holiday_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hor_code` int NOT NULL,
  `hor_name` varchar(64) DEFAULT NULL,
  `hor_desc` varchar(64) DEFAULT NULL,
  `hor_hourtype` varchar(64) DEFAULT NULL,
  `hor_level` varchar(32) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_payclass`
--

DROP TABLE IF EXISTS `att_payclass`;
CREATE TABLE IF NOT EXISTS `att_payclass` (
  `id` int NOT NULL AUTO_INCREMENT,
  `PayClassCode` int NOT NULL,
  `PayClassName` varchar(64) DEFAULT NULL,
  `PeriodType` int NOT NULL,
  `PeriodStartDate` datetime NOT NULL,
  `PeriodEndDate` datetime NOT NULL,
  `WeekendSet` varchar(50) DEFAULT NULL,
  `DailyOT1Limit` decimal(10,0) DEFAULT NULL,
  `DailyOT2Limit` decimal(10,0) DEFAULT NULL,
  `DailyOT3Limit` decimal(10,0) DEFAULT NULL,
  `WeeklyOT1Limit` decimal(10,0) DEFAULT NULL,
  `WeeklyOT2Limit` decimal(10,0) DEFAULT NULL,
  `WeeklyOT3Limit` decimal(10,0) DEFAULT NULL,
  `SaturdayWorkAs` int DEFAULT NULL,
  `SundayWorkAs` int DEFAULT NULL,
  `IsFillNormal` int DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `Remark` varchar(64) DEFAULT NULL,
  `ApplyRule` int DEFAULT NULL,
  `WeekendColor` int DEFAULT NULL,
  `CountWorkOff` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_paycode`
--

DROP TABLE IF EXISTS `att_paycode`;
CREATE TABLE IF NOT EXISTS `att_paycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pc_code` int NOT NULL,
  `pc_desc` varchar(32) DEFAULT NULL,
  `pc_type` int DEFAULT NULL,
  `pc_rate` decimal(10,0) DEFAULT NULL,
  `pc_paid` varchar(1) DEFAULT NULL,
  `pc_position` varchar(64) DEFAULT NULL,
  `multiple` decimal(10,0) DEFAULT NULL,
  `split_flag` int DEFAULT NULL,
  `attend_flag` varchar(32) DEFAULT NULL,
  `hours_type` varchar(32) DEFAULT NULL,
  `overtime_flag` varchar(32) DEFAULT NULL,
  `PrizeType` int DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `pc_delete` tinyint(1) DEFAULT NULL,
  `pc_sign` varchar(2) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_punches`
--

DROP TABLE IF EXISTS `att_punches`;
CREATE TABLE IF NOT EXISTS `att_punches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL,
  `punch_time` datetime NOT NULL,
  `workcode` varchar(64) DEFAULT NULL,
  `workstate` varchar(64) DEFAULT NULL,
  `terminal_id` int DEFAULT NULL,
  `punch_type` varchar(64) DEFAULT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `operator_reason` varchar(255) DEFAULT NULL,
  `operator_time` datetime DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `IsSelect` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `att_punches_UQ__att_punches__31B762FC` (`emp_id`,`punch_time`),
  KEY `terminal_id` (`terminal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_schedule`
--

DROP TABLE IF EXISTS `att_schedule`;
CREATE TABLE IF NOT EXISTS `att_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(64) NOT NULL,
  `schedule_type` int NOT NULL,
  `cycle_available` tinyint(1) NOT NULL,
  `paycode_available` tinyint(1) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `cycle_includeweekend` tinyint(1) DEFAULT NULL,
  `cycle_includeholiday` tinyint(1) DEFAULT NULL,
  `cycle_type` int DEFAULT NULL,
  `cycle_parameter` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_schedule_details`
--

DROP TABLE IF EXISTS `att_schedule_details`;
CREATE TABLE IF NOT EXISTS `att_schedule_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `schedule_date` datetime NOT NULL,
  `shift_paycode` int DEFAULT NULL,
  `paycode_available` tinyint(1) DEFAULT NULL,
  `wc_available` int DEFAULT NULL,
  `shift_wc` int DEFAULT NULL,
  `detailtype` int DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `schedule_id` int NOT NULL,
  `shift_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `shift_id` (`shift_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_shift`
--

DROP TABLE IF EXISTS `att_shift`;
CREATE TABLE IF NOT EXISTS `att_shift` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shift_flexible` tinyint(1) DEFAULT NULL,
  `shift_name` varchar(64) DEFAULT NULL,
  `shift_start` datetime DEFAULT NULL,
  `shift_end` datetime DEFAULT NULL,
  `shift_beforestart` int DEFAULT NULL,
  `shift_afterend` int DEFAULT NULL,
  `shift_beforestart2` int DEFAULT NULL,
  `shift_afterend2` int DEFAULT NULL,
  `shift_late` tinyint(1) DEFAULT NULL,
  `shift_latecome` int DEFAULT NULL,
  `shift_early` tinyint(1) DEFAULT NULL,
  `shift_earlyout` int DEFAULT NULL,
  `shift_allow_before` tinyint(1) DEFAULT NULL,
  `shift_allow_after` tinyint(1) DEFAULT NULL,
  `shift_earlycome` int DEFAULT NULL,
  `shift_earlycome_paycode` int DEFAULT NULL,
  `shift_lateout` int DEFAULT NULL,
  `shift_lateout_paycode` int DEFAULT NULL,
  `shift_round` tinyint(1) DEFAULT NULL,
  `checkInRoundValue` int DEFAULT NULL,
  `checkOutRoundValue` int DEFAULT NULL,
  `checkInRoundDown` int DEFAULT NULL,
  `checkOutRoundDown` int DEFAULT NULL,
  `shift_absent` int DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `shift_color` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_shift_roundrule`
--

DROP TABLE IF EXISTS `att_shift_roundrule`;
CREATE TABLE IF NOT EXISTS `att_shift_roundrule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timefrom` datetime NOT NULL,
  `timeto` datetime NOT NULL,
  `roundtime` datetime NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `shiftid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shiftid` (`shiftid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_terminal`
--

DROP TABLE IF EXISTS `att_terminal`;
CREATE TABLE IF NOT EXISTS `att_terminal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `terminal_no` int NOT NULL,
  `terminal_status` int NOT NULL,
  `terminal_name` varchar(64) DEFAULT NULL,
  `terminal_location` varchar(1024) DEFAULT NULL,
  `terminal_connecttype` int NOT NULL,
  `terminal_connectpwd` varchar(32) DEFAULT NULL,
  `terminal_domainname` varchar(32) DEFAULT NULL,
  `terminal_tcpip` varchar(32) NOT NULL,
  `terminal_port` int DEFAULT NULL,
  `terminal_serial` varchar(32) DEFAULT NULL,
  `terminal_baudrate` int DEFAULT NULL,
  `terminal_type` varchar(32) DEFAULT NULL,
  `terminal_users` int DEFAULT NULL,
  `terminal_fingerprints` int DEFAULT NULL,
  `terminal_punches` int DEFAULT NULL,
  `terminal_faces` int DEFAULT NULL,
  `terminal_zem` varchar(64) DEFAULT NULL,
  `terminal_kind` int DEFAULT NULL,
  `IsSelect` int DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_terminal_events`
--

DROP TABLE IF EXISTS `att_terminal_events`;
CREATE TABLE IF NOT EXISTS `att_terminal_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `occurtime` datetime DEFAULT NULL,
  `actionname` varchar(128) DEFAULT NULL,
  `contentdata` varchar(1024) DEFAULT NULL,
  `verifymode` varchar(128) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_id` (`terminal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_terminal_para`
--

DROP TABLE IF EXISTS `att_terminal_para`;
CREATE TABLE IF NOT EXISTS `att_terminal_para` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(64) NOT NULL,
  `parameter_value` varchar(64) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `terminal_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `terminal_id` (`terminal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_workcode`
--

DROP TABLE IF EXISTS `att_workcode`;
CREATE TABLE IF NOT EXISTS `att_workcode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wc_code` int NOT NULL,
  `wc_name` varchar(255) NOT NULL,
  `wc_price` decimal(10,0) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `att_workstate`
--

DROP TABLE IF EXISTS `att_workstate`;
CREATE TABLE IF NOT EXISTS `att_workstate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ws_code` int NOT NULL,
  `ws_alias` varchar(64) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hr_cmp_group`
--

DROP TABLE IF EXISTS `hr_cmp_group`;
CREATE TABLE IF NOT EXISTS `hr_cmp_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_code` int NOT NULL,
  `group_name` varchar(64) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hr_cmp_groupitem`
--

DROP TABLE IF EXISTS `hr_cmp_groupitem`;
CREATE TABLE IF NOT EXISTS `hr_cmp_groupitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grp_item_id` int NOT NULL,
  `grp_item_desc` varchar(64) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hr_company`
--

DROP TABLE IF EXISTS `hr_company`;
CREATE TABLE IF NOT EXISTS `hr_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cmp_code` varchar(10) NOT NULL,
  `cmp_dateformat` varchar(64) DEFAULT NULL,
  `cmp_timeformat` varchar(64) DEFAULT NULL,
  `cmp_name` varchar(64) NOT NULL,
  `cmp_operationmode` int DEFAULT NULL,
  `cmp_address1` varchar(64) DEFAULT NULL,
  `cmp_address2` varchar(64) DEFAULT NULL,
  `cmp_city` varchar(64) DEFAULT NULL,
  `cmp_state` varchar(64) DEFAULT NULL,
  `cmp_country` varchar(64) DEFAULT NULL,
  `cmp_postal` varchar(6) DEFAULT NULL,
  `cmp_phone` varchar(13) DEFAULT NULL,
  `cmp_fax` varchar(13) DEFAULT NULL,
  `cmp_email` varchar(64) DEFAULT NULL,
  `cmp_logo` blob,
  `cmp_website` varchar(64) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `payclass_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hr_company_UQ__hr_company__51300E55` (`cmp_code`),
  KEY `payclass_id` (`payclass_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hr_department`
--

DROP TABLE IF EXISTS `hr_department`;
CREATE TABLE IF NOT EXISTS `hr_department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dept_code` int NOT NULL,
  `dept_name` varchar(64) NOT NULL,
  `dept_parentcode` int NOT NULL,
  `dept_operationmode` int DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `payclass_id` int DEFAULT NULL,
  `dept_cmp_id` int NOT NULL,
  `schedule_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payclass_id` (`payclass_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `dept_cmp_id` (`dept_cmp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hr_employee`
--

DROP TABLE IF EXISTS `hr_employee`;
CREATE TABLE IF NOT EXISTS `hr_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_pin` int NOT NULL,
  `emp_code` varchar(64) DEFAULT NULL,
  `emp_ssn` varchar(64) DEFAULT NULL,
  `emp_role` varchar(64) DEFAULT NULL,
  `emp_firstname` varchar(64) NOT NULL,
  `emp_lastname` varchar(64) NOT NULL,
  `emp_username` varchar(64) DEFAULT NULL,
  `emp_pwd` varchar(64) DEFAULT NULL,
  `emp_timezone` varchar(64) DEFAULT NULL,
  `emp_phone` varchar(13) DEFAULT NULL,
  `emp_payroll_id` varchar(64) DEFAULT NULL,
  `emp_payroll_type` varchar(64) DEFAULT NULL,
  `emp_pin2` varchar(64) DEFAULT NULL,
  `emp_photo` blob,
  `emp_privilege` varchar(64) DEFAULT NULL,
  `emp_group` varchar(64) DEFAULT NULL,
  `emp_hiredate` datetime DEFAULT NULL,
  `emp_address` varchar(64) DEFAULT NULL,
  `emp_address2` varchar(64) DEFAULT NULL,
  `emp_active` int NOT NULL,
  `emp_firedate` datetime DEFAULT NULL,
  `emp_firereason` varchar(1024) DEFAULT NULL,
  `emp_emergencyphone1` varchar(13) DEFAULT NULL,
  `emp_emergencyphone2` varchar(13) DEFAULT NULL,
  `emp_emergencyname` varchar(64) DEFAULT NULL,
  `emp_emergencyaddress` varchar(64) DEFAULT NULL,
  `emp_cardNumber` varchar(24) DEFAULT NULL,
  `emp_country` varchar(64) DEFAULT NULL,
  `emp_city` varchar(64) DEFAULT NULL,
  `emp_state` varchar(64) DEFAULT NULL,
  `emp_postal` varchar(6) DEFAULT NULL,
  `emp_fax` varchar(13) DEFAULT NULL,
  `emp_email` varchar(64) DEFAULT NULL,
  `emp_title` varchar(64) DEFAULT NULL,
  `emp_hourlyrate1` decimal(10,0) DEFAULT NULL,
  `emp_hourlyrate2` decimal(10,0) DEFAULT NULL,
  `emp_hourlyrate3` decimal(10,0) DEFAULT NULL,
  `emp_hourlyrate4` decimal(10,0) DEFAULT NULL,
  `emp_hourlyrate5` decimal(10,0) DEFAULT NULL,
  `emp_gender` int DEFAULT NULL,
  `emp_birthday` datetime DEFAULT NULL,
  `emp_operationmode` int DEFAULT NULL,
  `IsSelect` int DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `emp_dept` int DEFAULT NULL,
  `payclass_id` int DEFAULT NULL,
  `schedule_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payclass_id` (`payclass_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `emp_dept` (`emp_dept`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hr_template`
--

DROP TABLE IF EXISTS `hr_template`;
CREATE TABLE IF NOT EXISTS `hr_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `finger_id` int NOT NULL,
  `effective` int NOT NULL,
  `template_type` int NOT NULL,
  `template_len` int NOT NULL,
  `template_str` varchar(255) NOT NULL,
  `template_obj` blob,
  `template_remark` varchar(255) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(1024) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporttemplate`
--

DROP TABLE IF EXISTS `reporttemplate`;
CREATE TABLE IF NOT EXISTS `reporttemplate` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(64) NOT NULL,
  `Template` blob,
  `ReportID` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salary_export`
--

DROP TABLE IF EXISTS `salary_export`;
CREATE TABLE IF NOT EXISTS `salary_export` (
  `id` int NOT NULL AUTO_INCREMENT,
  `export_code` varchar(12) NOT NULL,
  `export_index` int NOT NULL,
  `pc_available` varchar(1) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `cuser1` varchar(32) DEFAULT NULL,
  `cuser2` varchar(32) DEFAULT NULL,
  `paycode_id` int NOT NULL,
  `software_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paycode_id` (`paycode_id`),
  KEY `software_id` (`software_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salary_software`
--

DROP TABLE IF EXISTS `salary_software`;
CREATE TABLE IF NOT EXISTS `salary_software` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `Local` varchar(32) NOT NULL,
  `flag` varchar(8) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `cuser1` varchar(32) DEFAULT NULL,
  `cuser2` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sqlite_sequence`
--

DROP TABLE IF EXISTS `sqlite_sequence`;
CREATE TABLE IF NOT EXISTS `sqlite_sequence` (
  `name` text,
  `seq` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE IF NOT EXISTS `sys_config` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ConfigType` smallint NOT NULL,
  `Data` blob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Sys_Config_UQ__Sys_Config__17F790F9` (`ConfigType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_datafilter`
--

DROP TABLE IF EXISTS `sys_datafilter`;
CREATE TABLE IF NOT EXISTS `sys_datafilter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datafilter_desc` varchar(64) NOT NULL,
  `data_ranger` varchar(1024) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_event`
--

DROP TABLE IF EXISTS `sys_event`;
CREATE TABLE IF NOT EXISTS `sys_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `event_desc` varchar(64) DEFAULT NULL,
  `event_method` varchar(1024) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_event_trigger`
--

DROP TABLE IF EXISTS `sys_event_trigger`;
CREATE TABLE IF NOT EXISTS `sys_event_trigger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_type` varchar(64) NOT NULL,
  `trigger_condition` varchar(1024) NOT NULL,
  `execute_time` datetime DEFAULT NULL,
  `exec_results` varchar(32) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE IF NOT EXISTS `sys_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TableName` varchar(50) NOT NULL,
  `OperateType` varchar(50) NOT NULL,
  `log_date` datetime NOT NULL,
  `message` varchar(2048) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MenuNo` varchar(50) NOT NULL,
  `ParentNo` varchar(50) NOT NULL,
  `MenuFlag` varchar(50) NOT NULL,
  `MenuName` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `UserFlag` tinyint(1) DEFAULT NULL,
  `ModelName` varchar(50) DEFAULT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  `HelpURL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_msg_content`
--

DROP TABLE IF EXISTS `sys_msg_content`;
CREATE TABLE IF NOT EXISTS `sys_msg_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msg_object` varchar(128) NOT NULL,
  `msg_operator` varchar(1) NOT NULL,
  `msg_objectid` int NOT NULL,
  `msg_content` varchar(255) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `msg_queueid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msg_queueid` (`msg_queueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_msg_map`
--

DROP TABLE IF EXISTS `sys_msg_map`;
CREATE TABLE IF NOT EXISTS `sys_msg_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `queried_date` datetime DEFAULT NULL,
  `executed_date` datetime DEFAULT NULL,
  `msg_status` varchar(1) DEFAULT NULL,
  `exec_results` varchar(32) DEFAULT NULL,
  `log_1` varchar(1024) DEFAULT NULL,
  `log_2` varchar(1024) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `msg_terminalid` int NOT NULL,
  `msg_queueid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `msg_terminalid` (`msg_terminalid`),
  KEY `msg_queueid` (`msg_queueid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_msg_queue`
--

DROP TABLE IF EXISTS `sys_msg_queue`;
CREATE TABLE IF NOT EXISTS `sys_msg_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `msg_type` varchar(32) NOT NULL,
  `msg_source` varchar(32) NOT NULL,
  `msg_active` varchar(1) NOT NULL,
  `msg_status` varchar(32) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_privilege`
--

DROP TABLE IF EXISTS `sys_privilege`;
CREATE TABLE IF NOT EXISTS `sys_privilege` (
  `id` int NOT NULL AUTO_INCREMENT,
  `privilege_name` varchar(64) NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL,
  `role_available` varchar(1) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_role_datafilter`
--

DROP TABLE IF EXISTS `sys_role_datafilter`;
CREATE TABLE IF NOT EXISTS `sys_role_datafilter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_df_available` int NOT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `role_df_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_df_id` (`role_df_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_role_rights`
--

DROP TABLE IF EXISTS `sys_role_rights`;
CREATE TABLE IF NOT EXISTS `sys_role_rights` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_pri_available` int DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `role_pri_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_pri_id` (`role_pri_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `user_pwd` varchar(32) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `available` varchar(64) DEFAULT NULL,
  `iuser1` int DEFAULT NULL,
  `iuser2` int DEFAULT NULL,
  `iuser3` int DEFAULT NULL,
  `cuser1` varchar(64) DEFAULT NULL,
  `cuser2` varchar(64) DEFAULT NULL,
  `cuser3` varchar(64) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `role_id` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
