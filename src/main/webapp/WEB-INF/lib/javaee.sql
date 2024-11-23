/*
 Navicat Premium Data Transfer

 Source Server         : hello
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : javaee

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 23/11/2024 21:54:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `grade` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `major` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (2, '202302', '李四', 'F', '2000-02-20', '大一', '软件工程', '13800000002');
INSERT INTO `student` VALUES (3, '202303', '王五', 'M', '1999-03-25', '大二', '信息管理', '13800000003');
INSERT INTO `student` VALUES (4, '202304', '赵六', 'F', '1998-04-30', '大二', '电子工程', '13800000004');
INSERT INTO `student` VALUES (5, '202305', '孙七', 'M', '2002-05-05', '大一', '网络工程', '13800000005');
INSERT INTO `student` VALUES (6, '202306', '周八', 'F', '2001-06-10', '大三', '人工智能', '13800000006');
INSERT INTO `student` VALUES (7, '202307', '吴九', 'M', '2000-07-15', '大三', '计算机科学', '13800000007');
INSERT INTO `student` VALUES (8, '202308', '郑十', 'F', '1999-08-20', '大四', '信息技术', '13800000008');
INSERT INTO `student` VALUES (9, '202309', '冯十一', 'M', '1998-09-25', '大四', '数据科学', '13800000009');
INSERT INTO `student` VALUES (10, '202310', '陈十二', 'F', '2002-10-30', '大一', '电子商务', '13800000010');
INSERT INTO `student` VALUES (11, '202311', '刘十三', 'M', '2002-04-28', '大三', '软件工程', '15900000001');
INSERT INTO `student` VALUES (12, '202312', '史十四', 'M', '2002-05-28', '大一', '信息工程', '15900000002');
INSERT INTO `student` VALUES (13, '202411', '玩十五', '男', '2024-11-23', '大一', '计算机科学技术', '13700000010');
INSERT INTO `student` VALUES (25, '202412', '玩十六', '女', '2024-11-30', '大二', '计算机科学技术', '13700000011');
INSERT INTO `student` VALUES (26, '202412', '玩十七', '女', '2024-11-23', '大二', '计算机科学技术4', '13700000012');

-- ----------------------------
-- Table structure for student_2
-- ----------------------------
DROP TABLE IF EXISTS `student_2`;
CREATE TABLE `student_2`  (
  `id` int NULL DEFAULT NULL,
  `no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `grade` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `major` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_2
-- ----------------------------
INSERT INTO `student_2` VALUES (2, '202302', '李四', 'F', '2000-02-20', '大一', '软件工程', '13800000002');
INSERT INTO `student_2` VALUES (3, '202303', '王五', 'M', '1999-03-25', '大二', '信息管理', '13800000003');
INSERT INTO `student_2` VALUES (4, '202304', '赵六', 'F', '1998-04-30', '大二', '电子工程', '13800000004');
INSERT INTO `student_2` VALUES (5, '202305', '孙七', 'M', '2002-05-05', '大一', '网络工程', '13800000005');
INSERT INTO `student_2` VALUES (6, '202306', '周八', 'F', '2001-06-10', '大三', '人工智能', '13800000006');
INSERT INTO `student_2` VALUES (7, '202307', '吴九', 'M', '2000-07-15', '大三', '计算机科学', '13800000007');
INSERT INTO `student_2` VALUES (8, '202308', '郑十', 'F', '1999-08-20', '大四', '信息技术', '13800000008');
INSERT INTO `student_2` VALUES (9, '202309', '冯十一', 'M', '1998-09-25', '大四', '数据科学', '13800000009');
INSERT INTO `student_2` VALUES (10, '202310', '陈十二', 'F', '2002-10-30', '大一', '电子商务', '13800000010');
INSERT INTO `student_2` VALUES (11, '202311', '刘十三', 'M', '2002-04-28', '大三', '软件工程', '15900000001');
INSERT INTO `student_2` VALUES (12, '202312', '史十四', 'M', '2002-05-28', '大一', '信息工程', '15900000002');

SET FOREIGN_KEY_CHECKS = 1;
