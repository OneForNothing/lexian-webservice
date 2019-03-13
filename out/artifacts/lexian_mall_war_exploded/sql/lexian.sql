/*
Navicat MySQL Data Transfer

Source Server         : 本地mysql
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : lexian

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2018-09-05 09:18:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `a_name` varchar(15) NOT NULL,
  `a_pwd` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`a_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `g_id` char(32) NOT NULL,
  `g_name` varchar(50) NOT NULL,
  `g_desc` varchar(200) DEFAULT NULL,
  `g_count` int(5) NOT NULL,
  `g_price` decimal(10,2) NOT NULL,
  `g_discount` decimal(10,2) DEFAULT NULL,
  `g_image` varchar(100) DEFAULT NULL,
  `g_updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `g_t_id` char(32) DEFAULT NULL,
  `g_sub_id` char(32) DEFAULT NULL,
  `g_s_id` char(32) DEFAULT NULL,
  `g_del` tinyint(1) DEFAULT '0',
  `g_likeCount` int(10) DEFAULT '0',
  PRIMARY KEY (`g_id`),
  KEY `g_t_id` (`g_t_id`),
  KEY `g_sub_id` (`g_sub_id`),
  KEY `g_s_id` (`g_s_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`g_t_id`) REFERENCES `type` (`t_id`),
  CONSTRAINT `goods_ibfk_2` FOREIGN KEY (`g_sub_id`) REFERENCES `subtype` (`sub_id`),
  CONSTRAINT `goods_ibfk_3` FOREIGN KEY (`g_s_id`) REFERENCES `seller` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for likegoods
-- ----------------------------
DROP TABLE IF EXISTS `likegoods`;
CREATE TABLE `likegoods` (
  `lg_u_id` char(32) DEFAULT NULL,
  `lg_g_id` char(32) DEFAULT NULL,
  KEY `lg_u_id` (`lg_u_id`),
  KEY `lg_g_id` (`lg_g_id`),
  CONSTRAINT `likegoods_ibfk_1` FOREIGN KEY (`lg_u_id`) REFERENCES `users` (`u_id`),
  CONSTRAINT `likegoods_ibfk_2` FOREIGN KEY (`lg_g_id`) REFERENCES `goods` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for likeseller
-- ----------------------------
DROP TABLE IF EXISTS `likeseller`;
CREATE TABLE `likeseller` (
  `ls_u_id` char(32) DEFAULT NULL,
  `ls_s_id` char(32) DEFAULT NULL,
  KEY `ls_u_id` (`ls_u_id`),
  KEY `ls_s_id` (`ls_s_id`),
  CONSTRAINT `likeseller_ibfk_1` FOREIGN KEY (`ls_u_id`) REFERENCES `users` (`u_id`),
  CONSTRAINT `likeseller_ibfk_2` FOREIGN KEY (`ls_s_id`) REFERENCES `seller` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `oi_id` char(32) NOT NULL,
  `oi_singlePrice` decimal(8,2) DEFAULT NULL,
  `oi_count` int(10) DEFAULT NULL,
  `oi_subTotal` decimal(10,2) DEFAULT NULL,
  `oi_o_id` char(32) DEFAULT NULL,
  `oi_g_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`oi_id`),
  KEY `oi_o_id` (`oi_o_id`),
  KEY `oi_g_id` (`oi_g_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`oi_o_id`) REFERENCES `orders` (`o_id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oi_g_id`) REFERENCES `goods` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `o_id` char(32) NOT NULL,
  `o_orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `o_totalPrice` decimal(12,2) DEFAULT NULL,
  `o_state` smallint(1) DEFAULT NULL,
  `o_code` char(6) DEFAULT NULL,
  `o_u_id` char(32) DEFAULT NULL,
  `o_s_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  KEY `o_u_id` (`o_u_id`),
  KEY `o_s_id` (`o_s_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`o_u_id`) REFERENCES `users` (`u_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`o_s_id`) REFERENCES `seller` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `s_id` char(32) NOT NULL,
  `s_name` varchar(15) NOT NULL,
  `s_pwd` varchar(15) NOT NULL,
  `s_email` varchar(50) NOT NULL,
  `s_code` char(64) NOT NULL,
  `s_storeName` varchar(50) DEFAULT NULL,
  `s_phone` varchar(11) DEFAULT NULL,
  `s_addr` varchar(20) DEFAULT NULL,
  `s_openTime` time DEFAULT '00:00:00',
  `s_closeTime` time DEFAULT '00:00:00',
  `s_state` smallint(1) DEFAULT '0',
  `s_likeCount` int(10) DEFAULT '0',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for subtype
-- ----------------------------
DROP TABLE IF EXISTS `subtype`;
CREATE TABLE `subtype` (
  `sub_id` char(32) NOT NULL,
  `sub_name` varchar(20) NOT NULL,
  `sub_t_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `sub_t_id` (`sub_t_id`),
  CONSTRAINT `subtype_ibfk_1` FOREIGN KEY (`sub_t_id`) REFERENCES `type` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `t_id` char(32) NOT NULL,
  `t_name` varchar(20) NOT NULL,
  `t_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `u_id` char(32) NOT NULL,
  `u_name` varchar(15) NOT NULL,
  `u_pwd` varchar(15) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
