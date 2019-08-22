/*
 Navicat MySQL Data Transfer

 Source Server         : x123
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : csvt

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 22/08/2019 15:31:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 规则', 7, 'add_rule');
INSERT INTO `auth_permission` VALUES (26, 'Can change 规则', 7, 'change_rule');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 规则', 7, 'delete_rule');
INSERT INTO `auth_permission` VALUES (28, 'Can view 规则', 7, 'view_rule');
INSERT INTO `auth_permission` VALUES (29, 'Can add article', 8, 'add_article');
INSERT INTO `auth_permission` VALUES (30, 'Can change article', 8, 'change_article');
INSERT INTO `auth_permission` VALUES (31, 'Can delete article', 8, 'delete_article');
INSERT INTO `auth_permission` VALUES (32, 'Can view article', 8, 'view_article');
INSERT INTO `auth_permission` VALUES (33, 'Can add firewall', 9, 'add_firewall');
INSERT INTO `auth_permission` VALUES (34, 'Can change firewall', 9, 'change_firewall');
INSERT INTO `auth_permission` VALUES (35, 'Can delete firewall', 9, 'delete_firewall');
INSERT INTO `auth_permission` VALUES (36, 'Can view firewall', 9, 'view_firewall');
INSERT INTO `auth_permission` VALUES (37, 'Can add var', 10, 'add_var');
INSERT INTO `auth_permission` VALUES (38, 'Can change var', 10, 'change_var');
INSERT INTO `auth_permission` VALUES (39, 'Can delete var', 10, 'delete_var');
INSERT INTO `auth_permission` VALUES (40, 'Can view var', 10, 'view_var');
INSERT INTO `auth_permission` VALUES (41, 'Can add user', 11, 'add_user');
INSERT INTO `auth_permission` VALUES (42, 'Can change user', 11, 'change_user');
INSERT INTO `auth_permission` VALUES (43, 'Can delete user', 11, 'delete_user');
INSERT INTO `auth_permission` VALUES (44, 'Can view user', 11, 'view_user');
INSERT INTO `auth_permission` VALUES (45, 'Can add log', 12, 'add_log');
INSERT INTO `auth_permission` VALUES (46, 'Can change log', 12, 'change_log');
INSERT INTO `auth_permission` VALUES (47, 'Can delete log', 12, 'delete_log');
INSERT INTO `auth_permission` VALUES (48, 'Can view log', 12, 'view_log');
INSERT INTO `auth_permission` VALUES (49, 'Can add log_b', 13, 'add_log_b');
INSERT INTO `auth_permission` VALUES (50, 'Can change log_b', 13, 'change_log_b');
INSERT INTO `auth_permission` VALUES (51, 'Can delete log_b', 13, 'delete_log_b');
INSERT INTO `auth_permission` VALUES (52, 'Can view log_b', 13, 'view_log_b');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$5sf6ckQKKRCa$wp7TXieipYu0l5NUpwBDq2BjIdHB/72PPHkjjvIW/8E=', '2019-07-25 01:02:25.583615', 1, 'admin', '', '', '', 1, 1, '2019-07-24 01:24:21.052489');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$150000$YQ8tjB9Gkl2j$/I54BgYOZUJLEdgax6uQJfhw78ceGgpkKOC6Gie3+FE=', '2019-07-24 09:06:54.895289', 0, 'test1', '', '', '', 1, 1, '2019-07-24 09:05:00.000000');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$150000$ytfp9wL4TRbP$DbuqZzg27w8dOYHUuBTol4h6LVN4yj+5SOu6gJSP2js=', '2019-08-14 09:09:42.069925', 1, 'xrl', '', '', '', 1, 1, '2019-08-02 07:24:08.404314');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-07-24 01:29:20.468122', '1', 'Article object (1)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-07-24 01:40:40.631972', '1', 'test1', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-07-24 01:43:00.033576', '2', 't1', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-07-24 07:24:52.362649', '41', 'test owrk', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-07-24 07:27:18.563274', '41', 'adasd', 2, '[{\"changed\": {\"fields\": [\"number\", \"name\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-07-24 07:27:33.301694', '35', 'asfs', 2, '[{\"changed\": {\"fields\": [\"content\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-07-24 08:30:10.452593', '1', 'firewall object (1)', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-07-24 09:03:08.916597', '2', 'test1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (9, '2019-07-24 09:03:43.755039', '2', 'test1', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` VALUES (10, '2019-07-24 09:05:09.732217', '2', 'test1', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (11, '2019-07-24 09:05:29.332039', '3', 'test1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (12, '2019-07-24 09:05:39.376004', '3', 'test1', 2, '[]', 4, 1);
INSERT INTO `django_admin_log` VALUES (13, '2019-07-24 09:06:44.001360', '3', 'test1', 2, '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (14, '2019-07-25 01:27:30.075687', '1', '\"“播放到设备”SSDP 发现(UDP-In)\"', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (15, '2019-07-25 01:27:38.111112', '1', '\"“播放到设备”SSDP 发现(UDP-In)\"', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (16, '2019-08-01 08:33:52.898860', '1', 'xrl', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (17, '2019-08-01 08:34:04.130731', '2', 'xrl1', 1, '[{\"added\": {}}]', 11, 1);
INSERT INTO `django_admin_log` VALUES (18, '2019-08-02 07:38:16.190710', '1', 'xrl', 2, '[{\"changed\": {\"fields\": [\"level\"]}}]', 11, 4);
INSERT INTO `django_admin_log` VALUES (19, '2019-08-09 09:35:24.615825', '1', 'xrl', 2, '[{\"changed\": {\"fields\": [\"level\"]}}]', 11, 4);
INSERT INTO `django_admin_log` VALUES (20, '2019-08-14 09:09:50.202734', '16', 'test4', 2, '[{\"changed\": {\"fields\": [\"level\"]}}]', 11, 4);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'web1', 'article');
INSERT INTO `django_content_type` VALUES (9, 'web1', 'firewall');
INSERT INTO `django_content_type` VALUES (12, 'web1', 'log');
INSERT INTO `django_content_type` VALUES (13, 'web1', 'log_b');
INSERT INTO `django_content_type` VALUES (7, 'web1', 'rule');
INSERT INTO `django_content_type` VALUES (11, 'web1', 'user');
INSERT INTO `django_content_type` VALUES (10, 'web1', 'var');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-07-23 06:09:43.892299');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-07-23 06:09:46.032679');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-07-23 06:09:53.343223');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-07-23 06:09:54.952227');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-07-23 06:09:54.983770');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-07-23 06:09:56.404999');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-07-23 06:09:57.295643');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-07-23 06:09:58.076483');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-07-23 06:09:58.123345');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-07-23 06:09:58.748169');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-07-23 06:09:58.795027');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-07-23 06:09:58.857544');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-07-23 06:09:59.669841');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-07-23 06:10:00.513632');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2019-07-23 06:10:01.356955');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2019-07-23 06:10:01.435031');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2019-07-23 06:10:01.778744');
INSERT INTO `django_migrations` VALUES (18, 'web1', '0001_initial', '2019-07-23 06:10:02.341325');
INSERT INTO `django_migrations` VALUES (19, 'web1', '0002_auto_20190723_1124', '2019-07-23 06:10:03.434816');
INSERT INTO `django_migrations` VALUES (20, 'web1', '0003_article', '2019-07-24 01:17:26.995147');
INSERT INTO `django_migrations` VALUES (21, 'web1', '0004_firewall', '2019-07-24 07:59:42.855846');
INSERT INTO `django_migrations` VALUES (22, 'web1', '0005_auto_20190724_1625', '2019-07-24 08:26:01.928292');
INSERT INTO `django_migrations` VALUES (23, 'web1', '0006_auto_20190724_1627', '2019-07-24 08:27:10.440592');
INSERT INTO `django_migrations` VALUES (24, 'web1', '0007_var', '2019-07-29 08:29:42.833029');
INSERT INTO `django_migrations` VALUES (25, 'web1', '0008_user', '2019-08-01 08:31:46.889175');
INSERT INTO `django_migrations` VALUES (26, 'web1', '0002_auto_20190802_1206', '2019-08-02 04:06:20.662295');
INSERT INTO `django_migrations` VALUES (27, 'web1', '0002_firewall_content_all1', '2019-08-02 06:29:15.872964');
INSERT INTO `django_migrations` VALUES (28, 'web1', '0002_log', '2019-08-08 00:51:23.005235');
INSERT INTO `django_migrations` VALUES (29, 'web1', '0003_log_id_f', '2019-08-08 09:13:29.524662');
INSERT INTO `django_migrations` VALUES (30, 'web1', '0004_log_b', '2019-08-08 11:27:04.008707');
INSERT INTO `django_migrations` VALUES (31, 'web1', '0005_user_email', '2019-08-13 15:56:29.528289');
INSERT INTO `django_migrations` VALUES (32, 'web1', '0006_auto_20190814_1509', '2019-08-14 15:09:14.240002');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('4dcgrp7lwntzjdtmqtf8s8bno2jq6c4d', 'YmIzMjgxMzk4ZGRlYzRiNzZkYThjMjEzZGQ5MzAyNTkwNmMyNzAyMjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjo4LCJ1c2VyX25hbWUiOiJ4cmw1IiwibGV2ZWwiOiIzIiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2019-08-26 17:54:57.239894');
INSERT INTO `django_session` VALUES ('6q3gkhmsjtedlmgngzmysbc0iv276a1s', 'YTM5YTUxNDc2OGY1MmUzZTVkMTVmMThhMjNlNzQ1Zjg4NTU5M2U3ODp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ4cmwifQ==', '2019-08-16 02:46:18.054256');
INSERT INTO `django_session` VALUES ('8t7jcmy1yc5rcqsms89ud434kqrpwcb9', 'MGYwNThlOGMwN2RiODE1ZTExODUwNzg1YzQwNmZkMWFiZGY1MmU0Mzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ4cmwiLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2019-08-23 15:39:20.347335');
INSERT INTO `django_session` VALUES ('9nj2plurel9zl18f28y2419z37qsx3ps', 'YzJjZDIwZDM4OTVjNTRmNWQwNzI2MTAyZTBiZTM2MjA5ZjYxOTlhMDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ4cmwiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==', '2019-08-02 07:15:47.116275');
INSERT INTO `django_session` VALUES ('cn5euui8xxc4oclkmcstdl3ck6vdsm7s', 'YzM1OGY2NGQxZjQ4N2QwNWMyZTQ1OTU0ZjBiMWM5ODAxNDY4YzdjMjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxMSwidXNlcl9uYW1lIjoiYWRtaW4iLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2019-09-05 10:54:17.738932');
INSERT INTO `django_session` VALUES ('d1q184wi0tlf1ixapxc0jbp8zktqv4rm', 'MDZhNTUwOTBmYzlkMmYwZmQzN2JmYTg0MDRkMGE4ODEwZTgxZDFlOTp7ImlkX2JhY2siOiIyIn0=', '2019-08-23 13:48:21.651989');
INSERT INTO `django_session` VALUES ('e53ikzmwgkgxnjh4xmjovy2cf3b11z5p', 'YmRlNjgwYmNjMDVlOTQxODM2YzE4YWZiNzQwMWY0N2IwNzQ0Y2YwNTp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxMSwidXNlcl9uYW1lIjoiYWRtaW4iLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjAsImlkX2NfYyI6IjEwMiJ9', '2019-08-30 15:00:43.302427');
INSERT INTO `django_session` VALUES ('eskrlmppmvmtcfflo5pu4zlqdfoc1u4x', 'MjYzODY1OWZiZGVmMTQ5MmFkNDY5ZWZjOTU4YzAwNGFjNmMzNGQ2NTp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxMSwidXNlcl9uYW1lIjoiYWRtaW4iLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjAsImlkX2NfYyI6Ijk4In0=', '2019-09-02 14:02:25.392522');
INSERT INTO `django_session` VALUES ('eviu0h2v0pgwlrpr53pemixtpyht3pcz', 'YzM1OGY2NGQxZjQ4N2QwNWMyZTQ1OTU0ZjBiMWM5ODAxNDY4YzdjMjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxMSwidXNlcl9uYW1lIjoiYWRtaW4iLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2019-09-05 10:54:19.832302');
INSERT INTO `django_session` VALUES ('fy54jqpsfsgym81ap57187uxul247ydz', 'ZjRjNzFkM2IwZWY2YWVlYWExNDM5M2FmNWUxN2QwNjM5NjNkZGYyYTp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ4cmwiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2019-08-16 07:16:33.659449');
INSERT INTO `django_session` VALUES ('ixj601k8q8tenj46kr4ry3wk0lvlnq80', 'YzM1OGY2NGQxZjQ4N2QwNWMyZTQ1OTU0ZjBiMWM5ODAxNDY4YzdjMjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxMSwidXNlcl9uYW1lIjoiYWRtaW4iLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2019-09-04 16:50:48.247152');
INSERT INTO `django_session` VALUES ('jpqccx0cv8cixqjyy2jcbi86k5o52q7p', 'YWQyNDI1MWZhNzc5MWJiMzhmZjE1Y2RmMjRjZGM4MDk5ZTczNWNmZDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ4cmwiLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjAsImlkX2JhY2siOiIzIiwiaWRfY19jIjoiODUifQ==', '2019-08-22 16:59:11.714494');
INSERT INTO `django_session` VALUES ('jr30h3jwyefzdn7xauawd14vof8sfv4z', 'ZTA0NmMzOGJmMGM0OTAxMzNmNDI4NmNiNTlmZWJiOThhOWFlY2YyYjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ4cmwiLCJsZXZlbCI6IjIiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2019-08-16 08:10:00.998255');
INSERT INTO `django_session` VALUES ('k6f7w93k40x9amf0k6tvdxw2qsmt5zw7', 'YzM1OGY2NGQxZjQ4N2QwNWMyZTQ1OTU0ZjBiMWM5ODAxNDY4YzdjMjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxMSwidXNlcl9uYW1lIjoiYWRtaW4iLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2019-09-03 16:04:03.757404');
INSERT INTO `django_session` VALUES ('lr7753zvomm6paphayjrt0jsnfo22f1f', 'YzhhNDY4NTIyZTY4YzI0YjllMjQ1ZWE3ODIyYThmYjU1NTgzYmRmNDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFlODk2OGYzOTBiZjVlYzhlNjBjYWRjM2E4YzMxOTkzZTk5ZTczIn0=', '2019-08-16 09:36:35.088372');
INSERT INTO `django_session` VALUES ('lxint7sjyiwb9d75svbtn1rxvd118cn4', 'ZTA0NmMzOGJmMGM0OTAxMzNmNDI4NmNiNTlmZWJiOThhOWFlY2YyYjp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ4cmwiLCJsZXZlbCI6IjIiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2019-08-16 09:07:29.109776');
INSERT INTO `django_session` VALUES ('q3u8w0dgoogz4x8tfocifrg8grpelqz9', 'YzJjZDIwZDM4OTVjNTRmNWQwNzI2MTAyZTBiZTM2MjA5ZjYxOTlhMDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ4cmwiLCJfc2Vzc2lvbl9leHBpcnkiOjEwfQ==', '2019-08-02 07:13:53.470334');
INSERT INTO `django_session` VALUES ('q7274fy4320daavdfk4wxdjtp8bn4je7', 'ZWNiY2JiNGViODdiODc0OThkNjAyYTM3ODhiMDU1NjM0ZGI4MDhhZTp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJ4cmwiLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjAsImlkX2JhY2siOiIxNSJ9', '2019-08-27 17:14:39.844581');
INSERT INTO `django_session` VALUES ('r405y6ossxgget0mg2mnzpko4oxgc1tu', 'ZWViMzI4Mzk5MmQyYjc4Zjg3MWFmMDJhZTJlM2E4NjYyNmU4MzgyYzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjo4LCJ1c2VyX25hbWUiOiJ4cmw1IiwibGV2ZWwiOiIzIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJpZF9iYWNrIjoiMTAifQ==', '2019-08-26 17:43:50.547861');
INSERT INTO `django_session` VALUES ('tmjhsdcszpqo8i6ttdagxpfylnel87rs', 'MzVkY2JlYjI2MjhhMDRiMjZkNGFiMGQwNWU4ZmYzYmMwNDBlNzU3YTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4YmFlODk2OGYzOTBiZjVlYzhlNjBjYWRjM2E4YzMxOTkzZTk5ZTczIiwiaXNfbG9naW4iOnRydWUsInVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InhybCIsImxldmVsIjoiMiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2019-08-16 09:37:51.485537');
INSERT INTO `django_session` VALUES ('ttrzy2lb2j1qe27crt5ggffzcmlaurbb', 'MjYzODY1OWZiZGVmMTQ5MmFkNDY5ZWZjOTU4YzAwNGFjNmMzNGQ2NTp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxMSwidXNlcl9uYW1lIjoiYWRtaW4iLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjAsImlkX2NfYyI6Ijk4In0=', '2019-08-29 14:04:56.627266');
INSERT INTO `django_session` VALUES ('z0hklcm2b8r6208yzgzb7bzbe7bj4s7h', 'NGMzYTc3NGY1MDQ0NTAzNzkwMmMwYzgwOTFhMmE3MGZmMzNjMjA5YTp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoxNiwidXNlcl9uYW1lIjoidGVzdDQiLCJsZXZlbCI6IjMiLCJfc2Vzc2lvbl9leHBpcnkiOjAsImlkX2JhY2siOiIxMCIsImlkX2NfYyI6Ijk1In0=', '2019-08-28 17:18:20.284161');

-- ----------------------------
-- Table structure for tb_rule
-- ----------------------------
DROP TABLE IF EXISTS `tb_rule`;
CREATE TABLE `tb_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_rule
-- ----------------------------
INSERT INTO `tb_rule` VALUES (34, 'sdfw', 'q\'w', 10);
INSERT INTO `tb_rule` VALUES (35, 'asdasd', 'asfs', 9);
INSERT INTO `tb_rule` VALUES (36, 'vcsa', 'ad', 4);
INSERT INTO `tb_rule` VALUES (37, 'a\'s\'d', 'a\'s\'d', 33);
INSERT INTO `tb_rule` VALUES (38, 'cic', 'asd', 111);
INSERT INTO `tb_rule` VALUES (39, 'sidcwiec', 'asodnqwoc', 132);
INSERT INTO `tb_rule` VALUES (40, 'qwdacwqc', 'adasd', 131);
INSERT INTO `tb_rule` VALUES (41, 'lalalalala', 'adasd', 1);
INSERT INTO `tb_rule` VALUES (42, '3', '2', 1);

-- ----------------------------
-- Table structure for web1_article
-- ----------------------------
DROP TABLE IF EXISTS `web1_article`;
CREATE TABLE `web1_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web1_article
-- ----------------------------
INSERT INTO `web1_article` VALUES (2, 't1', 'aaa', '2019-07-24 01:43:00.033576', '2019-07-24 01:43:00.033576');

-- ----------------------------
-- Table structure for web1_firewall
-- ----------------------------
DROP TABLE IF EXISTS `web1_firewall`;
CREATE TABLE `web1_firewall`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `direction` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enalbled` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `local_ip` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `local_port` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `process` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `profile` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `protocol` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remote_ip` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remote_port` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `redirect_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `redirect_port` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_all1` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_change` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web1_firewall
-- ----------------------------
INSERT INTO `web1_firewall` VALUES (98, 'direct', 'inbound', 'true', 'ABCD:0000:2345:0000:ABCD:0000:2345:0000', '1900', 'ttt1', '2', 'public|private', '1', '198.168.1.1', '10-1000', 'system', '', '', 'name:ttt1 process:2 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:1 direction:inbound action:direct type:system enalbled:true profile:public|private', '2019-08-14 15:21:55 User:test4', '2019-08-14 15:21:55 User:test4');
INSERT INTO `web1_firewall` VALUES (99, 'redirect', 'outbound', 'true', '2000:0000:0000:0000:0001:2345:6789:0000/32', '80-1911', 'ttt1', '\"%systemroot%\\System32\\svchost.exe\"', 'public|private', '7', '198.168.1.1', '5', 'control', '192.168.1.1', '8000', 'name:ttt1 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:80-1911 remote_ip:198.168.1.1 remote_port:5 protocol:7 direction:outbound action:redirect type:control enalbled:true profile:public|private redirect_ip:192.168.1.1 redirect_port:8000', '2019-08-15 09:18:18 User:admin', '2019-08-15 09:42:18 User:admin');
INSERT INTO `web1_firewall` VALUES (100, 'direct', 'outbound', 'false', '123.1.1.1', '1900', 'nanan', '7', 'public|private|domain', '17', '198.168.1.1', 'any', 'system', '', '', 'name:nanan process:7 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:17 direction:outbound action:direct type:system enalbled:false profile:public|private|domain', '2019-08-15 09:42:46 User:admin', '2019-08-15 09:42:46 User:admin');
INSERT INTO `web1_firewall` VALUES (101, 'redirect', 'inbound', 'true', 'ABCD:0000:2345:0000:ABCD:0000:2345:0000/123', 'any', 'asfs', '7', 'domain', '53', '198.168.1.1/24', '123-10086', 'control', '192.168.1.1', '131', 'name:asfs process:7 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000/123 local_port:any remote_ip:198.168.1.1/24 remote_port:123-10086 protocol:53 direction:inbound action:redirect type:control enalbled:true profile:domain redirect_ip:192.168.1.1 redirect_port:131', '2019-08-15 09:43:26 User:admin', '2019-08-15 09:43:26 User:admin');
INSERT INTO `web1_firewall` VALUES (102, 'permit', 'outbound', 'true', 'ABCD:0000:2345:0000:ABCD:0000:2345:0000', '1900', 'ttt1', '7', 'public|private', '4', '198.168.1.0/24', 'any', 'control', '', '', 'name:ttt1 process:7 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000 local_port:1900 remote_ip:198.168.1.0/24 remote_port:any protocol:4 direction:outbound action:permit type:control enalbled:true profile:public|private', '2019-08-15 09:43:51 User:admin', '2019-08-15 09:43:51 User:admin');
INSERT INTO `web1_firewall` VALUES (103, 'redirect', 'outbound', 'true', '123.1.1.1', '1900', 'the test4', '\"%systemroot%\\System32\\svchost.exe\"', 'public|domain', '7', '198.168.1.1', '5', 'control', '192.168.1.1', '131', 'name:the test4 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:7 direction:outbound action:redirect type:control enalbled:true profile:public|domain redirect_ip:192.168.1.1 redirect_port:131', '2019-08-15 09:47:06 User:admin', '2019-08-15 09:47:06 User:admin');
INSERT INTO `web1_firewall` VALUES (104, 'permit', 'inbound', 'true', '2000:0000:0000:0000:0001:2345:6789:0000/32', '1900', 'the test1', '7', 'public', '1qwdqwd', '198.168.1.1', '5', 'system', '', '', 'name:the test1 process:7 local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:1qwdqwd direction:inbound action:permit type:system enalbled:true profile:public', '2019-08-15 09:47:24 User:admin', '2019-08-15 09:47:24 User:admin');
INSERT INTO `web1_firewall` VALUES (105, 'permit', 'outbound', 'true', '123.1.1.1', '1900', '\"“播放到设备”SSDP 发现(UDP-In)\"', '\"%systemroot%\\System32\\svchost.exe\"', 'public', '17', '198.168.1.1', 'any', 'control', '', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:17 direction:outbound action:permit type:control enalbled:true profile:public', '2019-08-15 09:51:37 User:admin', '2019-08-15 09:51:37 User:admin');
INSERT INTO `web1_firewall` VALUES (106, 'direct', 'inbound', 'true', '2000:0000:0000:0000:0001:2345:6789:0000/32', '3', 'ttt1', '1', 'public', '1qwdqwd', '198.168.1.1', 'any', 'system', '', '', 'name:ttt1 process:1 local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:1qwdqwd direction:inbound action:direct type:system enalbled:true profile:public', '2019-08-15 09:52:01 User:admin', '2019-08-16 13:59:31 User:admin');
INSERT INTO `web1_firewall` VALUES (107, 'permit', 'inbound', 'true', 'ABCD:0000:2345:0000:ABCD:0000:2345:0000/123', 'any', 'the test2', '6', 'public', '53', '198.168.1.1/24', '4', 'system', '', '', 'name:the test2 process:6 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000/123 local_port:any remote_ip:198.168.1.1/24 remote_port:4 protocol:53 direction:inbound action:permit type:system enalbled:true profile:public', '2019-08-15 09:52:16 User:admin', '2019-08-15 09:52:16 User:admin');
INSERT INTO `web1_firewall` VALUES (108, 'redirect', 'inbound', 'true', '123.1.1.1', '1900', 'asfs', '7', 'private', '7', '198.168.1.1', 'any', 'control', '192.168.1.1', '8000', 'name:asfs process:7 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:7 direction:inbound action:redirect type:control enalbled:true profile:private redirect_ip:192.168.1.1 redirect_port:8000', '2019-08-15 09:52:39 User:admin', '2019-08-15 09:52:39 User:admin');
INSERT INTO `web1_firewall` VALUES (109, 'direct', 'inbound', 'true', 'ABCD:0000:2345:0000:ABCD:0000:2345:0000', 'any', 'the test3', '6', 'public|private', '1qwdqwd', '198.168.1.1/24', '4', 'control', '', '', 'name:the test3 process:6 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000 local_port:any remote_ip:198.168.1.1/24 remote_port:4 protocol:1qwdqwd direction:inbound action:direct type:control enalbled:true profile:public|private', '2019-08-15 09:58:19 User:admin', '2019-08-15 09:58:19 User:admin');
INSERT INTO `web1_firewall` VALUES (110, 'direct', 'inbound', 'true', '123.1.1.1', 'any', 'the test4', '2', 'public|private', '6', '198.168.1.1/24', '10-1000', 'control', '', '', 'name:the test4 process:2 local_ip:123.1.1.1 local_port:any remote_ip:198.168.1.1/24 remote_port:10-1000 protocol:6 direction:inbound action:direct type:control enalbled:true profile:public|private', '2019-08-15 09:58:41 User:admin', '2019-08-15 09:58:41 User:admin');

-- ----------------------------
-- Table structure for web1_log
-- ----------------------------
DROP TABLE IF EXISTS `web1_log`;
CREATE TABLE `web1_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `operation` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `befor` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `after` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_f` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web1_log
-- ----------------------------
INSERT INTO `web1_log` VALUES (1, '2019-08-08 01:05:23.463439', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:17 direction:outbound action:direct type:control enalbled:false profile:private|domain', '');
INSERT INTO `web1_log` VALUES (2, '2019-08-08 09:08:54.246885', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:6 direction:inbound action:permit type:system enalbled:true profile:public|private|domain', '');
INSERT INTO `web1_log` VALUES (3, '2019-08-08 09:11:03.044105', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:17 direction:inbound action:permit type:system enalbled:true profile:private', '');
INSERT INTO `web1_log` VALUES (4, '2019-08-08 09:17:20.700897', 'Add', 'xrl', '', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:inbound action:permit type:system enalbled:true profile:public', '85');
INSERT INTO `web1_log` VALUES (5, '2019-08-08 09:33:58.075909', 'Change', 'xrl', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:inbound action:permit type:system enalbled:true profile:public', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:outbound action:permit type:system enalbled:true profile:public', '85');
INSERT INTO `web1_log` VALUES (6, '2019-08-08 09:37:34.157286', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:17 direction:inbound action:permit type:system enalbled:true profile:private', '84');
INSERT INTO `web1_log` VALUES (7, '2019-08-08 09:40:34.952835', 'Change', 'xrl', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:6 direction:inbound action:permit type:system enalbled:true profile:public|private|domain', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:6 direction:inbound action:permit type:system enalbled:true profile:public|domain', '83');
INSERT INTO `web1_log` VALUES (8, '2019-08-08 15:50:05.388031', 'Change', 'xrl2', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:outbound action:permit type:system enalbled:true profile:public|private', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:outbound action:permit type:system enalbled:true profile:public|private|domain', '85');
INSERT INTO `web1_log` VALUES (9, '2019-08-08 16:33:19.339659', 'Change', 'xrl', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:outbound action:permit type:system enalbled:true profile:public|private|domain', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:outbound action:permit type:system enalbled:true profile:public|private|domain', '85');
INSERT INTO `web1_log` VALUES (10, '2019-08-08 16:49:23.161628', 'Change', 'xrl', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:outbound action:permit type:system enalbled:true profile:public|private|domain', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:outbound action:permit type:system enalbled:true profile:public|domain', '85');
INSERT INTO `web1_log` VALUES (11, '2019-08-12 14:15:55.141066', 'Add', 'xrl', '', 'name:ttt1 process:7 local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:6 direction:outbound action:redirect type:system enalbled:false profile:public|private redirect_ip:192.168.1.1 redirect_port:8000', '86');
INSERT INTO `web1_log` VALUES (12, '2019-08-12 14:28:11.416139', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:7 local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:7 direction:inbound action:redirect type:system enalbled:true profile:private|domain redirect_ip:192.168.1.1 redirect_port:9000', '87');
INSERT INTO `web1_log` VALUES (13, '2019-08-12 14:31:35.029264', 'Change', 'xrl', 'name:nanan process:7 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:17 direction:outbound action:redirect type:system enalbled:false profile:public|private redirect_ip:192.168.1.1 redirect_port:9000', 'name:nanan process:7 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:17 direction:outbound action:redirect type:control enalbled:false profile:public|private redirect_ip:192.168.1.1 redirect_port:9000', '45');
INSERT INTO `web1_log` VALUES (14, '2019-08-12 16:24:41.594297', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:7 direction:outbound action:direct type:control enalbled:true profile:public|private|domain', '88');
INSERT INTO `web1_log` VALUES (15, '2019-08-12 16:26:07.217312', 'Change', 'xrl', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:7 direction:outbound action:direct type:control enalbled:true profile:public|private|domain', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:7 direction:outbound action:direct type:control enalbled:true profile:public|private|domain', '88');
INSERT INTO `web1_log` VALUES (16, '2019-08-12 16:27:19.304450', 'Change', 'xrl', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:7 direction:outbound action:direct type:control enalbled:true profile:public|private|domain', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:2000:0000:0000:0000:0001:2345:6789:0000 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:7 direction:outbound action:direct type:control enalbled:true profile:public|private|domain', '88');
INSERT INTO `web1_log` VALUES (17, '2019-08-12 16:49:07.585237', 'Add', 'xrl', '', 'name:nanan process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.0/24 remote_port:10-1000 protocol:7 direction:inbound action:permit type:system enalbled:true profile:private', '89');
INSERT INTO `web1_log` VALUES (18, '2019-08-12 16:56:07.635550', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:6 protocol:7 direction:inbound action:permit type:system enalbled:true profile:public', '90');
INSERT INTO `web1_log` VALUES (19, '2019-08-12 16:57:10.718613', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:4 protocol:4 direction:inbound action:permit type:system enalbled:false profile:private', '91');
INSERT INTO `web1_log` VALUES (20, '2019-08-12 17:02:42.909335', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:3 remote_ip:198.168.1.0/24 remote_port:10-1000 protocol:6 direction:outbound action:redirect type:system enalbled:false profile:private redirect_ip:192.168.1.1 redirect_port:8000', '92');
INSERT INTO `web1_log` VALUES (21, '2019-08-12 17:06:10.095715', 'Add', 'xrl', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:17 direction:outbound action:permit type:control enalbled:true profile:private|domain', '93');
INSERT INTO `web1_log` VALUES (22, '2019-08-12 17:14:17.073381', 'Change', 'xrl', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:17 direction:outbound action:permit type:control enalbled:true profile:private|domain', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:17 direction:outbound action:direct type:control enalbled:true profile:private|domain', '93');
INSERT INTO `web1_log` VALUES (23, '2019-08-12 17:14:28.004926', 'Change', 'xrl', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:17 direction:outbound action:direct type:control enalbled:true profile:private|domain', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:17 direction:outbound action:permit type:control enalbled:true profile:private|domain', '93');
INSERT INTO `web1_log` VALUES (24, '2019-08-13 15:25:58.237525', 'Add', 'admin', '', 'name:nanan process:\"%systemroot%\\System32\\svchost.exe\" local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:17 direction:inbound action:permit type:system enalbled:true profile:private|domain', '94');
INSERT INTO `web1_log` VALUES (25, '2019-08-13 15:34:43.916969', 'Add', 'admin', '', 'name:ttt1 process:2 local_ip:123.1.1.1/23 local_port:4 remote_ip:198.168.1.0/24 remote_port:4 protocol:1qwdqwd direction:inbound action:direct type:system enalbled:true profile:public|domain', '95');
INSERT INTO `web1_log` VALUES (26, '2019-08-13 15:36:39.126161', 'Add', 'admin', '', 'name:asfs process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:4 direction:inbound action:redirect type:system enalbled:true profile:public|private|domain redirect_ip:192.168.1.1 redirect_port:9000', '96');
INSERT INTO `web1_log` VALUES (27, '2019-08-13 15:44:01.362122', 'Change', 'admin', 'name:ttt1 process:2 local_ip:123.1.1.1/23 local_port:4 remote_ip:198.168.1.0/24 remote_port:4 protocol:1qwdqwd direction:inbound action:direct type:system enalbled:true profile:public|domain', 'name:ttt1 process:2 local_ip:123.1.1.1/23 local_port:4 remote_ip:198.168.1.0/24 remote_port:4 protocol:1qwdqwd direction:inbound action:redirect type:system enalbled:true profile:public|domain redirect_ip:192.168.1.1 redirect_port:9000', '95');
INSERT INTO `web1_log` VALUES (28, '2019-08-14 15:17:08.693977', 'Add', 'test4', '', 'name:ttt1 process:4 local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:1qwdqwd direction:outbound action:permit type:control enalbled:true profile:public|private', '97');
INSERT INTO `web1_log` VALUES (29, '2019-08-14 15:21:35.646233', 'Change', 'test4', 'name:ttt1 process:2 local_ip:123.1.1.1/23 local_port:4 remote_ip:198.168.1.0/24 remote_port:4 protocol:1qwdqwd direction:inbound action:redirect type:system enalbled:true profile:public|domain redirect_ip:192.168.1.1 redirect_port:9000', 'name:ttt1 process:2 local_ip:123.1.1.1/23 local_port:4 remote_ip:198.168.1.0/24 remote_port:4 protocol:1qwdqwd direction:inbound action:redirect type:system enalbled:true profile:public|domain redirect_ip:192.168.1.1 redirect_port:9000', '95');
INSERT INTO `web1_log` VALUES (30, '2019-08-14 15:21:55.463127', 'Add', 'test4', '', 'name:ttt1 process:2 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:1 direction:inbound action:direct type:system enalbled:true profile:public|private', '98');
INSERT INTO `web1_log` VALUES (31, '2019-08-15 09:14:48.671672', 'Delete', 'admin', 'name:the test1 process:1 local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:6 direction:inbound action:permit type:system enalbled:false profile:public|private', '', '44');
INSERT INTO `web1_log` VALUES (32, '2019-08-15 09:14:50.982089', 'Delete', 'admin', 'name:nanan process:7 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:17 direction:outbound action:redirect type:control enalbled:false profile:public|private redirect_ip:192.168.1.1 redirect_port:9000', '', '45');
INSERT INTO `web1_log` VALUES (33, '2019-08-15 09:14:53.066476', 'Delete', 'admin', 'name:the test3 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:1 direction:outbound action:permit type:system enalbled:false profile:public|private|domain', '', '48');
INSERT INTO `web1_log` VALUES (34, '2019-08-15 09:14:54.852030', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:17 direction:outbound action:redirect type:system enalbled:false profile:public|private|domain redirect_ip:192.168.1.1 redirect_port:9000', '', '49');
INSERT INTO `web1_log` VALUES (35, '2019-08-15 09:14:56.521403', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:1 direction:inbound action:redirect type:system enalbled:false profile:public|private redirect_ip:192.168.1.1 redirect_port:8000', '', '50');
INSERT INTO `web1_log` VALUES (36, '2019-08-15 09:14:58.107822', 'Delete', 'admin', 'name:the test2 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:1 direction:inbound action:permit type:system enalbled:true profile:public|private', '', '60');
INSERT INTO `web1_log` VALUES (37, '2019-08-15 09:15:00.963039', 'Delete', 'admin', 'name:the test4 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:1 direction:outbound action:redirect type:system enalbled:true profile:public|private|domain redirect_ip:192.168.1.1 redirect_port:8000', '', '70');
INSERT INTO `web1_log` VALUES (38, '2019-08-15 09:15:02.210333', 'Delete', 'admin', 'name:12312312 process:qweqwdqwd local_ip:123.1.1.1 local_port:1000/2000/10-20 remote_ip:198.168.1.1 remote_port:4 protocol:q\'f\'q\'w\'da\'d\'w direction:inbound action:permit type:control enalbled:false profile:public|private', '', '80');
INSERT INTO `web1_log` VALUES (39, '2019-08-15 09:15:03.404184', 'Delete', 'admin', 'name:test 8/5 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:17 direction:outbound action:redirect type:control enalbled:false profile:private|domain redirect_ip:192.168.1.1 redirect_port:9000', '', '81');
INSERT INTO `web1_log` VALUES (40, '2019-08-15 09:15:20.057712', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:17 direction:outbound action:direct type:control enalbled:false profile:private|domain', '', '82');
INSERT INTO `web1_log` VALUES (41, '2019-08-15 09:15:22.196029', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:6 direction:inbound action:permit type:system enalbled:true profile:public|domain', '', '83');
INSERT INTO `web1_log` VALUES (42, '2019-08-15 09:15:24.294210', 'Delete', 'admin', 'name:nanan process:2 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:6 direction:outbound action:permit type:system enalbled:true profile:public|domain', '', '85');
INSERT INTO `web1_log` VALUES (43, '2019-08-15 09:15:26.122362', 'Delete', 'admin', 'name:ttt1 process:7 local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:6 direction:outbound action:redirect type:system enalbled:false profile:public|private redirect_ip:192.168.1.1 redirect_port:8000', '', '86');
INSERT INTO `web1_log` VALUES (44, '2019-08-15 09:15:36.819650', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:7 local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:7 direction:inbound action:redirect type:system enalbled:true profile:private|domain redirect_ip:192.168.1.1 redirect_port:9000', '', '87');
INSERT INTO `web1_log` VALUES (45, '2019-08-15 09:15:38.796850', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:2000:0000:0000:0000:0001:2345:6789:0000 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:7 direction:outbound action:direct type:control enalbled:true profile:public|private|domain', '', '88');
INSERT INTO `web1_log` VALUES (46, '2019-08-15 09:15:40.784218', 'Delete', 'admin', 'name:nanan process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.0/24 remote_port:10-1000 protocol:7 direction:inbound action:permit type:system enalbled:true profile:private', '', '89');
INSERT INTO `web1_log` VALUES (47, '2019-08-15 09:15:42.853843', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:3 remote_ip:198.168.1.1 remote_port:6 protocol:7 direction:inbound action:permit type:system enalbled:true profile:public', '', '90');
INSERT INTO `web1_log` VALUES (48, '2019-08-15 09:15:46.201417', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:4 protocol:4 direction:inbound action:permit type:system enalbled:false profile:private', '', '91');
INSERT INTO `web1_log` VALUES (49, '2019-08-15 09:15:47.841710', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:3 remote_ip:198.168.1.0/24 remote_port:10-1000 protocol:6 direction:outbound action:redirect type:system enalbled:false profile:private redirect_ip:192.168.1.1 redirect_port:8000', '', '92');
INSERT INTO `web1_log` VALUES (50, '2019-08-15 09:15:49.580233', 'Delete', 'admin', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:10-1000 protocol:17 direction:outbound action:permit type:control enalbled:true profile:private|domain', '', '93');
INSERT INTO `web1_log` VALUES (51, '2019-08-15 09:16:10.983382', 'Delete', 'admin', 'name:nanan process:\"%systemroot%\\System32\\svchost.exe\" local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:17 direction:inbound action:permit type:system enalbled:true profile:private|domain', '', '94');
INSERT INTO `web1_log` VALUES (52, '2019-08-15 09:17:24.065356', 'Delete', 'admin', 'name:ttt1 process:2 local_ip:123.1.1.1/23 local_port:4 remote_ip:198.168.1.0/24 remote_port:4 protocol:1qwdqwd direction:inbound action:redirect type:system enalbled:true profile:public|domain redirect_ip:192.168.1.1 redirect_port:9000', '', '95');
INSERT INTO `web1_log` VALUES (53, '2019-08-15 09:17:26.035890', 'Delete', 'admin', 'name:asfs process:1 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:4 direction:inbound action:redirect type:system enalbled:true profile:public|private|domain redirect_ip:192.168.1.1 redirect_port:9000', '', '96');
INSERT INTO `web1_log` VALUES (54, '2019-08-15 09:17:45.400108', 'Delete', 'admin', 'name:ttt1 process:4 local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:1qwdqwd direction:outbound action:permit type:control enalbled:true profile:public|private', '', '97');
INSERT INTO `web1_log` VALUES (55, '2019-08-15 09:18:18.606906', 'Add', 'admin', '', 'name:ttt1 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:4 remote_ip:198.168.1.1 remote_port:5 protocol:7 direction:outbound action:redirect type:control enalbled:true profile:public|private redirect_ip:192.168.1.1 redirect_port:8000', '99');
INSERT INTO `web1_log` VALUES (56, '2019-08-15 09:42:18.867787', 'Change', 'admin', 'name:ttt1 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:4 remote_ip:198.168.1.1 remote_port:5 protocol:7 direction:outbound action:redirect type:control enalbled:true profile:public|private redirect_ip:192.168.1.1 redirect_port:8000', 'name:ttt1 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:80-1911 remote_ip:198.168.1.1 remote_port:5 protocol:7 direction:outbound action:redirect type:control enalbled:true profile:public|private redirect_ip:192.168.1.1 redirect_port:8000', '99');
INSERT INTO `web1_log` VALUES (57, '2019-08-15 09:42:46.940218', 'Add', 'admin', '', 'name:nanan process:7 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:17 direction:outbound action:direct type:system enalbled:false profile:public|private|domain', '100');
INSERT INTO `web1_log` VALUES (58, '2019-08-15 09:43:28.664904', 'Add', 'admin', '', 'name:asfs process:7 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000/123 local_port:any remote_ip:198.168.1.1/24 remote_port:123-10086 protocol:53 direction:inbound action:redirect type:control enalbled:true profile:domain redirect_ip:192.168.1.1 redirect_port:131', '101');
INSERT INTO `web1_log` VALUES (59, '2019-08-15 09:43:51.331771', 'Add', 'admin', '', 'name:ttt1 process:7 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000 local_port:1900 remote_ip:198.168.1.0/24 remote_port:any protocol:4 direction:outbound action:permit type:control enalbled:true profile:public|private', '102');
INSERT INTO `web1_log` VALUES (60, '2019-08-15 09:47:08.870996', 'Add', 'admin', '', 'name:the test4 process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:7 direction:outbound action:redirect type:control enalbled:true profile:public|domain redirect_ip:192.168.1.1 redirect_port:131', '103');
INSERT INTO `web1_log` VALUES (61, '2019-08-15 09:47:24.797958', 'Add', 'admin', '', 'name:the test1 process:7 local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:1900 remote_ip:198.168.1.1 remote_port:5 protocol:1qwdqwd direction:inbound action:permit type:system enalbled:true profile:public', '104');
INSERT INTO `web1_log` VALUES (62, '2019-08-15 09:51:40.241231', 'Add', 'admin', '', 'name:\"“播放到设备”SSDP 发现(UDP-In)\" process:\"%systemroot%\\System32\\svchost.exe\" local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:17 direction:outbound action:permit type:control enalbled:true profile:public', '105');
INSERT INTO `web1_log` VALUES (63, '2019-08-15 09:52:01.712634', 'Add', 'admin', '', 'name:ttt1 process:1 local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:1qwdqwd direction:inbound action:permit type:system enalbled:true profile:public|private', '106');
INSERT INTO `web1_log` VALUES (64, '2019-08-15 09:52:16.781643', 'Add', 'admin', '', 'name:the test2 process:6 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000/123 local_port:any remote_ip:198.168.1.1/24 remote_port:4 protocol:53 direction:inbound action:permit type:system enalbled:true profile:public', '107');
INSERT INTO `web1_log` VALUES (65, '2019-08-15 09:52:39.607634', 'Add', 'admin', '', 'name:asfs process:7 local_ip:123.1.1.1 local_port:1900 remote_ip:198.168.1.1 remote_port:any protocol:7 direction:inbound action:redirect type:control enalbled:true profile:private redirect_ip:192.168.1.1 redirect_port:8000', '108');
INSERT INTO `web1_log` VALUES (66, '2019-08-15 09:58:22.056198', 'Add', 'admin', '', 'name:the test3 process:6 local_ip:ABCD:0000:2345:0000:ABCD:0000:2345:0000 local_port:any remote_ip:198.168.1.1/24 remote_port:4 protocol:1qwdqwd direction:inbound action:direct type:control enalbled:true profile:public|private', '109');
INSERT INTO `web1_log` VALUES (67, '2019-08-15 09:58:42.067620', 'Add', 'admin', '', 'name:the test4 process:2 local_ip:123.1.1.1 local_port:any remote_ip:198.168.1.1/24 remote_port:10-1000 protocol:6 direction:inbound action:direct type:control enalbled:true profile:public|private', '110');
INSERT INTO `web1_log` VALUES (68, '2019-08-16 13:59:31.522272', 'Change', 'admin', 'name:ttt1 process:1 local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:1qwdqwd direction:inbound action:permit type:system enalbled:true profile:public|private', 'name:ttt1 process:1 local_ip:2000:0000:0000:0000:0001:2345:6789:0000/32 local_port:3 remote_ip:198.168.1.1 remote_port:any protocol:1qwdqwd direction:inbound action:direct type:system enalbled:true profile:public', '106');

-- ----------------------------
-- Table structure for web1_log_b
-- ----------------------------
DROP TABLE IF EXISTS `web1_log_b`;
CREATE TABLE `web1_log_b`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `id_f` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operation` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `befor` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `after` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web1_log_b
-- ----------------------------
INSERT INTO `web1_log_b` VALUES (1, '2019-08-08 11:31:45.913442', '4', 'Delete', 'xrl2', 'xrl3 level:2', '');
INSERT INTO `web1_log_b` VALUES (2, '2019-08-08 16:07:44.482496', '5', 'Add', 'xrl', '', 'xrl4 level:3');
INSERT INTO `web1_log_b` VALUES (3, '2019-08-08 16:11:09.871389', '5', 'Add', 'xrl', 'xrl4 level:3 password:123', 'xrl4 level:2 password:321');
INSERT INTO `web1_log_b` VALUES (4, '2019-08-08 16:11:26.131879', '5', 'Delete', 'xrl', 'xrl4 level:2', '');
INSERT INTO `web1_log_b` VALUES (5, '2019-08-08 16:21:45.766518', '1', 'Add', 'xrl', 'xrl level:3 password:admin', 'xrl level:3 password:admin');
INSERT INTO `web1_log_b` VALUES (6, '2019-08-08 16:21:48.510051', '1', 'Add', 'xrl', 'xrl level:3 password:admin', 'xrl level:3 password:admin');
INSERT INTO `web1_log_b` VALUES (7, '2019-08-08 16:22:57.002434', '1', 'Add', 'xrl', 'xrl level:3 password:admin', 'xrl level:3 password:admin');
INSERT INTO `web1_log_b` VALUES (8, '2019-08-08 16:22:59.251070', '1', 'Add', 'xrl', 'xrl level:3 password:admin', 'xrl level:3 password:admin');
INSERT INTO `web1_log_b` VALUES (9, '2019-08-08 16:23:27.445220', '1', 'Add', 'xrl', 'xrl level:3 password:admin', 'xrl level:3 password:admin');
INSERT INTO `web1_log_b` VALUES (10, '2019-08-08 16:24:05.071282', '1', 'Add', 'xrl', 'xrl level:3 password:admin', 'xrl level:2 password:admin');
INSERT INTO `web1_log_b` VALUES (11, '2019-08-08 16:55:30.637319', '3', 'Add', 'xrl', 'xrl2 level:3 password:19990201', 'xrl2 level:2 password:19990201');
INSERT INTO `web1_log_b` VALUES (12, '2019-08-08 17:02:36.299139', '6', 'Add', 'xrl', '', 'xrl3 level:2');
INSERT INTO `web1_log_b` VALUES (13, '2019-08-09 09:45:40.029518', '7', 'Add', 'xrl', '', ' level:3');
INSERT INTO `web1_log_b` VALUES (14, '2019-08-09 09:45:45.341902', '7', 'Delete', 'xrl', ' level:3', '');
INSERT INTO `web1_log_b` VALUES (15, '2019-08-12 16:12:09.908521', '6', 'Change', 'xrl', 'xrl3 level:2 password:123', 'xrl3 level:2 password:123');
INSERT INTO `web1_log_b` VALUES (16, '2019-08-12 16:12:26.985798', '1', 'Change', 'xrl', 'xrl level:3 password:admin', 'xrl level:3 password:admin');
INSERT INTO `web1_log_b` VALUES (17, '2019-08-12 16:14:13.428667', '6', 'Delete', 'xrl', 'xrl3 level:2', '');
INSERT INTO `web1_log_b` VALUES (18, '2019-08-12 16:14:16.745894', '3', 'Change', 'xrl', 'xrl2 level:2 password:19990201', 'xrl2 level:2 password:19990201');
INSERT INTO `web1_log_b` VALUES (19, '2019-08-12 17:21:51.692430', '8', 'Add', 'xrl', '', 'xrl5 level:3');
INSERT INTO `web1_log_b` VALUES (20, '2019-08-12 17:22:35.419337', '9', 'Add', 'xrl', '', 'xrl6 level:3');
INSERT INTO `web1_log_b` VALUES (21, '2019-08-12 17:26:13.745503', '9', 'Change', 'xrl5', 'xrl6 level:3', 'xrl6 level:3');
INSERT INTO `web1_log_b` VALUES (22, '2019-08-12 17:38:53.097253', '10', 'Add', 'xrl5', '', 'xrl7 level:1');
INSERT INTO `web1_log_b` VALUES (23, '2019-08-12 17:43:42.274436', '10', 'Change', 'xrl5', 'xrl7 level:1', 'xrl7 level:1');
INSERT INTO `web1_log_b` VALUES (24, '2019-08-12 17:43:47.029744', '10', 'Change', 'xrl5', 'xrl7 level:1', 'xrl7 level:3');
INSERT INTO `web1_log_b` VALUES (25, '2019-08-12 17:43:53.039658', '10', 'Change', 'xrl5', 'xrl7 level:3', 'xrl7 level:2');
INSERT INTO `web1_log_b` VALUES (26, '2019-08-13 09:35:30.849844', '11', 'Add', 'xrl5', '', 'admin level:3');
INSERT INTO `web1_log_b` VALUES (27, '2019-08-13 09:45:29.942492', '12', 'Add', 'xrl5', '', 'test1 level:2');
INSERT INTO `web1_log_b` VALUES (28, '2019-08-13 16:06:23.448767', '14', 'Add', 'admin', '', 'test2 level:1 email:321@qq.com');
INSERT INTO `web1_log_b` VALUES (29, '2019-08-13 16:15:00.482670', '13', 'Change', 'admin', 'test3 level:1 email:123@qq.com', 'test3 level:1 email:111q.com');
INSERT INTO `web1_log_b` VALUES (30, '2019-08-13 16:15:10.286284', '13', 'Change', 'admin', 'test3 level:1 email:111q.com', 'test3 level:1 email:111@qq.com');
INSERT INTO `web1_log_b` VALUES (31, '2019-08-13 16:49:26.884687', '1', 'Change', 'admin', 'xrl level:3 email:', 'xrl level:3 email:xrl.com');
INSERT INTO `web1_log_b` VALUES (32, '2019-08-13 16:49:33.781769', '2', 'Change', 'admin', 'xrl1 level:2 email:', 'xrl1 level:2 email:xrl1.com');
INSERT INTO `web1_log_b` VALUES (33, '2019-08-13 16:49:40.889109', '3', 'Change', 'admin', 'xrl2 level:2 email:', 'xrl2 level:2 email:xrl2.com');
INSERT INTO `web1_log_b` VALUES (34, '2019-08-13 16:49:48.698635', '8', 'Change', 'admin', 'xrl5 level:3 email:', 'xrl5 level:3 email:xrl5.coma');
INSERT INTO `web1_log_b` VALUES (35, '2019-08-13 16:49:54.990689', '8', 'Change', 'admin', 'xrl5 level:3 email:xrl5.coma', 'xrl5 level:3 email:xrl5.com');
INSERT INTO `web1_log_b` VALUES (36, '2019-08-13 16:49:59.927883', '9', 'Change', 'admin', 'xrl6 level:3 email:', 'xrl6 level:3 email:xawdqwdqd');
INSERT INTO `web1_log_b` VALUES (37, '2019-08-13 16:50:59.507733', '9', 'Change', 'admin', 'xrl6 level:3 email:xawdqwdqd', 'xrl6 level:3 email:xrl6.com');
INSERT INTO `web1_log_b` VALUES (38, '2019-08-13 16:51:05.792531', '10', 'Change', 'admin', 'xrl7 level:2 email:', 'xrl7 level:2 email:xrl7.com');
INSERT INTO `web1_log_b` VALUES (39, '2019-08-13 16:51:12.498316', '11', 'Change', 'admin', 'admin level:3 email:', 'admin level:3 email:xrl8.com');
INSERT INTO `web1_log_b` VALUES (40, '2019-08-13 16:51:19.447438', '12', 'Change', 'admin', 'test1 level:2 email:', 'test1 level:2 email:test1.com');
INSERT INTO `web1_log_b` VALUES (41, '2019-08-13 16:57:41.376315', '15', 'Add', 'admin', '', 'xrl10 level:1 email:123@qq.com');
INSERT INTO `web1_log_b` VALUES (42, '2019-08-13 17:00:38.117332', '16', 'Add', 'admin', '', 'test4 level:1 email:test4@qq.com');
INSERT INTO `web1_log_b` VALUES (43, '2019-08-13 17:00:50.266793', '16', 'Change', 'admin', 'test4 level:1 email:test4@qq.com', 'test4 level:1 email:tes4@qq.com');
INSERT INTO `web1_log_b` VALUES (44, '2019-08-13 17:08:45.960510', '16', 'Change', 'xrl', 'test4 level:1 email:tes4@qq.com', 'test4 level:1 email:tes4@qq.com');
INSERT INTO `web1_log_b` VALUES (45, '2019-08-13 17:09:05.261742', '16', 'Change', 'xrl', 'test4 level:1 email:tes4@qq.com', 'test4 level:1 email:123@qq.com');
INSERT INTO `web1_log_b` VALUES (46, '2019-08-13 17:12:50.395045', '15', 'Change', 'xrl', 'xrl10 level:1 email:123@qq.com', 'xrl10 level:1 email:123123@qq.com');
INSERT INTO `web1_log_b` VALUES (47, '2019-08-13 17:13:28.335311', '15', 'Change', 'xrl', 'xrl10 level:1 email:123123@qq.com', 'xrl10 level:1 email:123123@qq.com');
INSERT INTO `web1_log_b` VALUES (48, '2019-08-13 17:13:33.947903', '14', 'Change', 'xrl', 'test2 level:1 email:321@qq.com', 'test2 level:1 email:123123@qq.com');
INSERT INTO `web1_log_b` VALUES (49, '2019-08-13 17:13:54.532244', '14', 'Change', 'xrl', 'test2 level:1 email:123123@qq.com', 'test2 level:1 email:313@qq.com');
INSERT INTO `web1_log_b` VALUES (50, '2019-08-13 17:14:37.680940', '15', 'Change', 'xrl', 'xrl10 level:1 email:123123@qq.com', 'xrl10 level:1 email:123123@qq.com');
INSERT INTO `web1_log_b` VALUES (51, '2019-08-14 09:11:55.137640', '12', 'Change', 'test4', 'test1 level:2 email:test1.com', 'test1 level:2 email:test1@123.com');
INSERT INTO `web1_log_b` VALUES (52, '2019-08-14 09:14:40.010974', '1', 'Change', 'test4', 'xrl level:3 email:xrl.com', 'xrl level:3 email:xrl@qq.com');
INSERT INTO `web1_log_b` VALUES (53, '2019-08-14 09:15:36.856694', '2', 'Change', 'test4', 'xrl1 level:2 email:xrl1.com', 'xrl1 level:2 email:xrl1@qq.com');
INSERT INTO `web1_log_b` VALUES (54, '2019-08-14 09:16:02.207793', '3', 'Change', 'test4', 'xrl2 level:2 email:xrl2.com', 'xrl2 level:2 email:xrl2@qq.com');
INSERT INTO `web1_log_b` VALUES (55, '2019-08-14 09:17:23.613907', '8', 'Change', 'test4', 'xrl5 level:3 email:xrl5.com', 'xrl5 level:3 email:xrl5@qq.com');
INSERT INTO `web1_log_b` VALUES (56, '2019-08-14 09:19:41.199308', '1', 'Change', 'test4', 'xrl level:3 email:xrl@qq.com', 'xrl level:2 email:xrl@qq.com');
INSERT INTO `web1_log_b` VALUES (57, '2019-08-14 09:20:41.603893', '9', 'Change', 'test4', 'xrl6 level:3 email:xrl6.com', 'xrl6 level:3 email:xrl6@qq.com');
INSERT INTO `web1_log_b` VALUES (58, '2019-08-14 09:22:05.470226', '11', 'Change', 'test4', 'admin level:3 email:xrl8.com', 'admin level:3 email:admin@qq.com');
INSERT INTO `web1_log_b` VALUES (59, '2019-08-14 09:22:33.877149', '10', 'Change', 'test4', 'xrl7 level:2 email:xrl7.com', 'xrl7 level:2 email:xrl7@123.com');

-- ----------------------------
-- Table structure for web1_user
-- ----------------------------
DROP TABLE IF EXISTS `web1_user`;
CREATE TABLE `web1_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `level` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web1_user
-- ----------------------------
INSERT INTO `web1_user` VALUES (1, 'xrl', '6c3c448250dd9afdcc8585296a111746523ce10ea7aa0fc9942620a28bc06888', '2019-08-01 08:33:52.898860', '2', 'xrl@qq.com');
INSERT INTO `web1_user` VALUES (2, 'xrl1', '2bb367b1db75ddcf91ec9ae4ded3061165a47c3e4012c9b40afa7901470b78c2', '2019-08-01 08:34:04.130731', '2', 'xrl1@qq.com');
INSERT INTO `web1_user` VALUES (3, 'xrl2', '2bb367b1db75ddcf91ec9ae4ded3061165a47c3e4012c9b40afa7901470b78c2', '2019-08-05 06:23:20.891238', '2', 'xrl2@qq.com');
INSERT INTO `web1_user` VALUES (8, 'xrl5', '17c7b2976a725a1803a3c9174ea4065f7c286f69eee0707ebb51aa1d63b2c427', '2019-08-12 17:21:51.536356', '3', 'xrl5@qq.com');
INSERT INTO `web1_user` VALUES (9, 'xrl6', '6c3c448250dd9afdcc8585296a111746523ce10ea7aa0fc9942620a28bc06888', '2019-08-12 17:22:35.263090', '3', 'xrl6@qq.com');
INSERT INTO `web1_user` VALUES (10, 'xrl7', 'c8e30caf87acad938db365d6a01cc1ef596b620e6ec4d7f8a7143b9852c78d1b', '2019-08-12 17:38:52.972241', '2', 'xrl7@123.com');
INSERT INTO `web1_user` VALUES (11, 'admin', '6c3c448250dd9afdcc8585296a111746523ce10ea7aa0fc9942620a28bc06888', '2019-08-13 09:35:30.099748', '3', 'admin@qq.com');
INSERT INTO `web1_user` VALUES (12, 'test1', '6c3c448250dd9afdcc8585296a111746523ce10ea7aa0fc9942620a28bc06888', '2019-08-13 09:45:29.786245', '2', 'test1@123.com');
INSERT INTO `web1_user` VALUES (13, 'test3', '28fa98144f1bcf73c36caaede9d30492f987457b2e6c00d9a1d402ddca28ddfd', '2019-08-13 16:05:21.821519', '1', '111@qq.com');
INSERT INTO `web1_user` VALUES (14, 'test2', '0126754a164c6130da7fd0ca04ba51a87c18dad3f1ef6d854d8759ff85814830', '2019-08-13 16:06:22.902064', '1', '313@qq.com');
INSERT INTO `web1_user` VALUES (15, 'xrl10', 'aa7887ed54e0f10a47249675135a778e22177e639c92bd50e7a0a8b3452b0856', '2019-08-13 16:57:41.157575', '1', '123123@qq.com');
INSERT INTO `web1_user` VALUES (16, 'test4', 'aa7887ed54e0f10a47249675135a778e22177e639c92bd50e7a0a8b3452b0856', '2019-08-13 17:00:37.961123', '3', '123@qq.com');

-- ----------------------------
-- Table structure for web1_var
-- ----------------------------
DROP TABLE IF EXISTS `web1_var`;
CREATE TABLE `web1_var`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `var` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web1_var
-- ----------------------------
INSERT INTO `web1_var` VALUES (1, '85');

SET FOREIGN_KEY_CHECKS = 1;
