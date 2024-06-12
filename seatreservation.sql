/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3306
 Source Schema         : seatreservation

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 12/06/2024 21:23:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for announce
-- ----------------------------
DROP TABLE IF EXISTS `announce`;
CREATE TABLE `announce` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datetime` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of announce
-- ----------------------------
BEGIN;
INSERT INTO `announce` (`id`, `title`, `content`, `datetime`) VALUES (1, '图书馆预约须知', '1.图书馆22:30闭馆。\r\n2.用户可在0:00-21:00时间段预约座位，开始时间最早为8:00，最迟预约到22:30。\r\n3.预约开始时间前后半小时可以签到，签到码通过馆内数据大屏查询或询问老师和管理员,超时记为违规并释放座位。\r\n4.暂离图书馆要在60分钟内返回签到，否则座位将被释放，同时记违规使用。', 1660171080175);
INSERT INTO `announce` (`id`, `title`, `content`, `datetime`) VALUES (2, '馆内文明须知', '1、注意仪表，衣冠不整者谢绝入馆。\r\n2、保持馆内安静，请勿喧哗，入馆后请将手机调至振动档。\r\n3、保持馆内清洁卫生，请勿在馆内进食，不随地吐痰、不乱扔纸屑。爱护公共设施，不得涂抹刻画。\r\n4、维护馆内安全，本馆严禁吸烟，严禁携带易燃、易爆物品入内。\r\n5、爱护图书文献，请勿涂写、折页、撕毁书刊，违者将按章罚款。\r\n6、未办理有关手续不得携带书刊、光盘出馆，违者按本馆《书刊保护条例》处理。\r\n7、请讲普通话，请注意文明用语，读者与工作人员互相尊重。\r\n8、读者必须经过大厅磁检门离馆，如遇监测器报警，请配合值班人员的检查。\r\n9、请遵守图书馆的规章制度，做一名文明的读者。', 1660171080175);
COMMIT;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `areaName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域名',
  `subName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域缩写',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of area
-- ----------------------------
BEGIN;
INSERT INTO `area` (`aid`, `areaName`, `subName`) VALUES (1, '一层西阅览区', 'AW');
INSERT INTO `area` (`aid`, `areaName`, `subName`) VALUES (2, '一层东阅览区', 'AE');
INSERT INTO `area` (`aid`, `areaName`, `subName`) VALUES (3, '二层西自习区', 'BW');
INSERT INTO `area` (`aid`, `areaName`, `subName`) VALUES (4, '二层东自习区', 'BE');
INSERT INTO `area` (`aid`, `areaName`, `subName`) VALUES (5, '三层西自习区', 'CW');
INSERT INTO `area` (`aid`, `areaName`, `subName`) VALUES (6, '三层东自习区', 'CE');
COMMIT;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `datetime` bigint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`datetime`, `id`, `content`, `title`, `uid`) VALUES (1660171080175, 2, '最近刷了7年的英语真题，有两套错一个 ，两套错三个 10年11年12年都是错四个.也试做了英语一10年的错6个\r\n万能的吧友求教！！！！', '英语二10年后平均每套错三个什么水平 等到考试能考多少分？', 3);
INSERT INTO `article` (`datetime`, `id`, `content`, `title`, `uid`) VALUES (1660171080175, 3, '材料考本专业 期望院校只要考上国家线就能稳上 哎 不知道还来不来得及有点焦虑 家里人意思是不想考研就准备考事业单位了', '现在开始备考能考上国家线吗….英一数二', 1);
INSERT INTO `article` (`datetime`, `id`, `content`, `title`, `uid`) VALUES (1660171080175, 4, '本人英语学渣，四级没过，考研目标50分，怎么去复习作文啊，要不要去买晚上的模板啊，背王江涛的作文20篇还是直接背他书上的模板啊？', '本人英语学渣，四级没过，考研目标50分，怎么去复习作文啊', 3);
COMMIT;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `cid` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uid` bigint DEFAULT NULL,
  `aid` bigint DEFAULT NULL COMMENT '动态id',
  `datetime` bigint DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
BEGIN;
INSERT INTO `comments` (`cid`, `content`, `uid`, `aid`, `datetime`) VALUES (2, '我21届阅读比你还差点最后79，如果22难度的话上80没啥问题吧', 1, 2, 1660175986071);
INSERT INTO `comments` (`cid`, `content`, `uid`, `aid`, `datetime`) VALUES (3, '这都能上80了吗？，我平均错5个，有时候能错个3个，上个70我就满意了', 1, 2, 1660176005810);
INSERT INTO `comments` (`cid`, `content`, `uid`, `aid`, `datetime`) VALUES (4, '没啥参考价值，七八十吧', 1, 2, 1660176025848);
INSERT INTO `comments` (`cid`, `content`, `uid`, `aid`, `datetime`) VALUES (5, '我英一英二那些卷子60分的选择几乎都在55以上，最后82', 1, 2, 1660176036320);
INSERT INTO `comments` (`cid`, `content`, `uid`, `aid`, `datetime`) VALUES (6, '还行，我一战英二平时也错三个，偶尔错四个或者两个，最后江苏考了76，这个分数讲真的很不满意，因为平时感觉80分十有八九。 你后面作文啥的注意一下哈，新题型保证别错，其他问题不大。', 1, 2, 1660176040474);
INSERT INTO `comments` (`cid`, `content`, `uid`, `aid`, `datetime`) VALUES (7, '努力吧，我同学大二就说自己出国没问题了，结果英语才考50分', 1, 4, 1660176057495);
INSERT INTO `comments` (`cid`, `content`, `uid`, `aid`, `datetime`) VALUES (8, '十几年没碰英语，现在复习三月，刷真题英语二最好成绩是17年，客观题拿50分', 1, 4, 1660176085212);
INSERT INTO `comments` (`cid`, `content`, `uid`, `aid`, `datetime`) VALUES (9, '模板 有需要的发你，去年有同学用了，考的好。', 1, 4, 1660176101546);
INSERT INTO `comments` (`cid`, `content`, `uid`, `aid`, `datetime`) VALUES (10, 'emmm，同学，过不过国家线不是吧友说的算的，加油吧。', 1, 3, 1660176111721);
COMMIT;

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `rid` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint DEFAULT NULL COMMENT '用户id',
  `startTime` bigint DEFAULT NULL,
  `endTime` bigint DEFAULT NULL,
  `sid` bigint DEFAULT NULL COMMENT '座位id',
  `state` int DEFAULT '0' COMMENT '0待签到1已签到使用中2未及时签到3暂离4暂离60分钟未签到-1使用完成',
  `leaveTime` bigint DEFAULT NULL COMMENT '暂离时间',
  `score` int DEFAULT NULL COMMENT '扣多少信用分',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of reservation
-- ----------------------------
BEGIN;
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (15, 1, 1704064800000, 1704092400000, 100, 2, NULL, 10);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (16, 3, 1704064800000, 1704092400000, 114, 2, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (17, 1, 1704096000000, 1704127200000, 158, -1, 1660161142018, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (18, 3, 1704127200000, 1704162000000, 65, 2, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (19, 6, 1704158400000, 1704193200000, 63, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (20, 9, 1704189600000, 1704224400000, 69, 2, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (21, 10, 1704220800000, 1704255600000, 72, 2, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (22, 10, 1704220800000, 1704255600000, 70, 4, 1660209524628, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (24, 10, 1704252000000, 1704320400000, 58, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (25, 10, 1704283200000, 1704318000000, 112, -1, 1660218204527, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (26, 1, 1701393600000, 1701422400000, 158, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (27, 3, 1701393600000, 1701412800000, 100, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (28, 1, 1701424800000, 1701453600000, 114, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (29, 10, 1701456000000, 1701484800000, 58, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (30, 6, 1701393600000, 1701422400000, 55, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (31, 1, 1701393600000, 1701422400000, 158, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (32, 1, 1701393600000, 1701422400000, 56, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (33, 6, 1704252000000, 1704286800000, 70, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (34, 6, 1704283200000, 1704351600000, 72, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (35, 1, 1718156400000, 1718191200000, 66, 2, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (36, 1, 1718197200000, 1718202600000, 674, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (37, 1, 1718154000000, 1718164800000, 154, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (38, 2, 1718197200000, 1718202600000, 689, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (39, 1, 1718197200000, 1718202600000, 690, -1, NULL, NULL);
INSERT INTO `reservation` (`rid`, `uid`, `startTime`, `endTime`, `sid`, `state`, `leaveTime`, `score`) VALUES (40, 1, 1718197200000, 1718202600000, 65, -1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `sid` bigint NOT NULL AUTO_INCREMENT COMMENT '位置id',
  `area` int DEFAULT NULL COMMENT '区域',
  `type` int DEFAULT '0' COMMENT '0座位1桌子',
  `row` int DEFAULT NULL COMMENT '行',
  `column` int DEFAULT NULL COMMENT '列',
  `state` int DEFAULT '0' COMMENT '0有座1有约2被使用',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=712 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of seat
-- ----------------------------
BEGIN;
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (55, 1, 1, 5, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (56, 1, 1, 5, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (57, 1, 1, 5, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (59, 1, 0, 4, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (60, 1, 0, 4, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (63, 1, 0, 6, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (64, 1, 0, 6, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (65, 1, 0, 6, 5, 1);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (66, 1, 0, 2, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (72, 1, 0, 8, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (80, 1, 0, 2, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (86, 1, 0, 8, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (88, 1, 0, 2, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (98, 1, 1, 2, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (100, 1, 1, 2, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (102, 1, 0, 2, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (104, 1, 1, 4, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (105, 1, 1, 4, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (108, 1, 0, 4, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (110, 1, 0, 4, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (114, 1, 0, 8, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (116, 1, 0, 8, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (122, 1, 1, 4, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (123, 1, 1, 4, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (124, 1, 1, 4, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (125, 1, 1, 5, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (126, 1, 1, 5, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (127, 1, 1, 5, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (128, 1, 0, 3, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (129, 1, 0, 3, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (130, 1, 0, 4, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (131, 1, 0, 5, 19, 1);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (132, 1, 0, 6, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (136, 1, 0, 3, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (137, 1, 0, 3, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (138, 1, 0, 3, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (139, 1, 0, 4, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (140, 1, 0, 5, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (141, 1, 0, 6, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (144, 1, 0, 6, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (152, 2, 0, 2, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (153, 2, 0, 2, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (154, 2, 0, 2, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (155, 2, 0, 2, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (156, 2, 0, 2, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (157, 2, 0, 2, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (158, 2, 0, 2, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (159, 2, 0, 2, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (160, 2, 0, 2, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (161, 2, 0, 2, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (166, 2, 1, 3, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (167, 2, 1, 3, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (168, 2, 1, 3, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (169, 2, 1, 3, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (170, 2, 1, 3, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (171, 2, 1, 3, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (172, 2, 1, 3, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (173, 2, 1, 3, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (174, 2, 1, 3, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (175, 2, 1, 3, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (180, 2, 0, 4, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (181, 2, 0, 4, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (182, 2, 0, 4, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (183, 2, 0, 4, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (184, 2, 0, 4, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (185, 2, 0, 4, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (186, 2, 0, 4, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (187, 2, 0, 4, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (188, 2, 0, 4, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (189, 2, 0, 4, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (190, 2, 0, 6, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (191, 2, 0, 6, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (192, 2, 0, 6, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (193, 2, 0, 6, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (194, 2, 0, 6, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (195, 2, 0, 6, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (196, 2, 0, 6, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (197, 2, 0, 6, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (198, 2, 0, 6, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (199, 2, 0, 6, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (200, 2, 0, 6, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (201, 2, 0, 6, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (202, 2, 0, 6, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (203, 2, 0, 6, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (204, 2, 0, 8, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (205, 2, 0, 8, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (206, 2, 0, 8, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (207, 2, 0, 8, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (208, 2, 0, 8, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (209, 2, 0, 8, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (210, 2, 0, 8, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (211, 2, 0, 8, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (212, 2, 0, 8, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (213, 2, 0, 8, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (214, 2, 0, 8, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (215, 2, 0, 8, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (216, 2, 0, 8, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (217, 2, 0, 8, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (218, 2, 1, 7, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (219, 2, 1, 7, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (220, 2, 1, 7, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (221, 2, 1, 7, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (222, 2, 1, 7, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (223, 2, 1, 7, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (224, 2, 1, 7, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (225, 2, 1, 7, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (226, 2, 1, 7, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (227, 2, 1, 7, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (228, 2, 1, 7, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (229, 2, 1, 7, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (230, 2, 1, 7, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (231, 2, 1, 7, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (234, 2, 0, 2, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (235, 2, 0, 2, 17, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (237, 2, 0, 2, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (238, 2, 0, 2, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (239, 2, 0, 2, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (240, 2, 0, 2, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (241, 2, 0, 2, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (242, 2, 0, 2, 24, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (243, 2, 0, 4, 24, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (244, 2, 0, 4, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (245, 2, 0, 4, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (246, 2, 0, 4, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (247, 2, 0, 4, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (248, 2, 0, 4, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (249, 2, 0, 4, 18, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (250, 2, 0, 4, 17, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (251, 2, 0, 4, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (252, 2, 1, 3, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (253, 2, 1, 3, 17, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (254, 2, 1, 3, 18, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (255, 2, 1, 3, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (256, 2, 1, 3, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (257, 2, 1, 3, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (258, 2, 1, 3, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (259, 2, 1, 3, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (260, 2, 1, 3, 24, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (261, 2, 0, 2, 18, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (278, 3, 1, 5, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (279, 3, 1, 5, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (280, 3, 1, 5, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (281, 3, 1, 5, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (282, 3, 0, 4, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (283, 3, 0, 4, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (284, 3, 0, 4, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (285, 3, 0, 4, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (286, 3, 0, 6, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (287, 3, 0, 6, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (288, 3, 0, 6, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (289, 3, 0, 6, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (290, 3, 0, 2, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (291, 3, 0, 3, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (292, 3, 0, 4, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (293, 3, 0, 5, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (294, 3, 0, 6, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (295, 3, 0, 7, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (296, 3, 0, 8, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (297, 3, 1, 2, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (298, 3, 1, 3, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (299, 3, 1, 4, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (300, 3, 1, 5, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (301, 3, 1, 6, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (302, 3, 1, 7, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (303, 3, 1, 8, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (304, 3, 0, 2, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (305, 3, 0, 4, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (306, 3, 0, 5, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (307, 3, 0, 6, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (308, 3, 0, 7, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (309, 3, 0, 8, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (310, 3, 0, 3, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (311, 3, 0, 2, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (312, 3, 0, 1, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (313, 3, 1, 1, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (314, 3, 1, 2, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (315, 3, 1, 1, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (316, 3, 1, 2, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (317, 3, 0, 1, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (318, 3, 0, 2, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (319, 3, 1, 4, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (320, 3, 1, 4, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (321, 3, 1, 5, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (322, 3, 1, 5, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (323, 3, 0, 4, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (324, 3, 0, 5, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (325, 3, 0, 4, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (326, 3, 0, 5, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (327, 3, 0, 8, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (328, 3, 0, 8, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (329, 3, 0, 8, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (330, 3, 0, 8, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (331, 3, 1, 9, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (332, 3, 1, 9, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (333, 3, 1, 9, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (334, 3, 1, 9, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (335, 3, 1, 4, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (336, 3, 1, 4, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (337, 3, 1, 4, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (338, 3, 1, 5, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (339, 3, 1, 5, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (340, 3, 1, 5, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (341, 3, 0, 3, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (342, 3, 0, 3, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (343, 3, 0, 4, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (344, 3, 0, 5, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (345, 3, 0, 6, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (346, 3, 0, 6, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (347, 3, 0, 6, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (348, 3, 0, 3, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (349, 3, 0, 3, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (350, 3, 0, 3, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (351, 3, 0, 4, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (352, 3, 0, 5, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (353, 3, 0, 6, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (354, 3, 0, 6, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (355, 5, 0, 2, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (356, 5, 1, 1, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (357, 5, 1, 1, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (358, 5, 1, 1, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (359, 5, 1, 1, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (360, 5, 0, 2, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (361, 5, 0, 2, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (362, 5, 0, 2, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (363, 5, 1, 9, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (364, 5, 1, 9, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (365, 5, 1, 9, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (366, 5, 1, 9, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (367, 5, 0, 8, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (368, 5, 0, 8, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (369, 5, 0, 8, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (370, 5, 0, 8, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (383, 5, 0, 2, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (384, 5, 0, 3, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (385, 5, 0, 4, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (386, 5, 0, 5, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (387, 5, 0, 6, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (388, 5, 0, 7, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (389, 5, 0, 8, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (390, 5, 1, 2, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (391, 5, 1, 3, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (392, 5, 1, 4, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (393, 5, 1, 5, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (394, 5, 1, 6, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (395, 5, 1, 7, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (396, 5, 1, 8, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (397, 5, 0, 2, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (398, 5, 0, 4, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (399, 5, 0, 5, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (400, 5, 0, 6, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (401, 5, 0, 7, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (402, 5, 0, 8, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (403, 5, 0, 3, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (404, 5, 0, 2, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (405, 5, 0, 1, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (406, 5, 1, 1, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (407, 5, 1, 2, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (408, 5, 1, 1, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (409, 5, 1, 2, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (410, 5, 0, 1, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (411, 5, 0, 2, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (412, 5, 1, 4, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (413, 5, 1, 4, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (414, 5, 1, 5, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (415, 5, 1, 5, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (416, 5, 0, 4, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (417, 5, 0, 5, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (418, 5, 0, 4, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (419, 5, 0, 5, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (420, 5, 0, 8, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (421, 5, 0, 8, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (422, 5, 0, 8, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (423, 5, 0, 8, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (424, 5, 1, 9, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (425, 5, 1, 9, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (426, 5, 1, 9, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (427, 5, 1, 9, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (428, 5, 1, 4, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (429, 5, 1, 4, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (430, 5, 1, 4, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (431, 5, 1, 5, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (432, 5, 1, 5, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (433, 5, 1, 5, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (434, 5, 0, 3, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (435, 5, 0, 3, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (436, 5, 0, 4, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (437, 5, 0, 5, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (438, 5, 0, 6, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (439, 5, 0, 6, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (440, 5, 0, 6, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (441, 5, 0, 3, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (442, 5, 0, 3, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (443, 5, 0, 3, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (444, 5, 0, 4, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (445, 5, 0, 5, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (446, 5, 0, 6, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (447, 5, 0, 6, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (448, 4, 0, 2, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (449, 4, 0, 2, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (450, 4, 0, 2, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (451, 4, 0, 2, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (452, 4, 0, 2, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (453, 4, 0, 2, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (454, 4, 0, 2, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (455, 4, 0, 2, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (456, 4, 0, 2, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (457, 4, 0, 2, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (458, 4, 0, 2, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (459, 4, 0, 2, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (460, 4, 0, 2, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (461, 4, 0, 2, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (462, 4, 1, 3, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (463, 4, 1, 3, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (464, 4, 1, 3, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (465, 4, 1, 3, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (466, 4, 1, 3, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (467, 4, 1, 3, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (468, 4, 1, 3, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (469, 4, 1, 3, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (470, 4, 1, 3, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (471, 4, 1, 3, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (472, 4, 1, 3, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (473, 4, 1, 3, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (474, 4, 1, 3, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (475, 4, 1, 3, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (476, 4, 0, 4, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (477, 4, 0, 4, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (478, 4, 0, 4, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (479, 4, 0, 4, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (480, 4, 0, 4, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (481, 4, 0, 4, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (482, 4, 0, 4, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (483, 4, 0, 4, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (484, 4, 0, 4, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (485, 4, 0, 4, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (486, 4, 0, 4, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (487, 4, 0, 4, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (488, 4, 0, 4, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (489, 4, 0, 4, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (490, 4, 0, 6, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (491, 4, 0, 6, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (492, 4, 0, 6, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (493, 4, 0, 6, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (494, 4, 0, 6, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (495, 4, 0, 6, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (496, 4, 0, 6, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (497, 4, 0, 6, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (498, 4, 0, 6, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (499, 4, 0, 6, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (500, 4, 0, 6, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (501, 4, 0, 6, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (502, 4, 0, 6, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (503, 4, 0, 6, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (504, 4, 0, 8, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (505, 4, 0, 8, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (506, 4, 0, 8, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (507, 4, 0, 8, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (508, 4, 0, 8, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (509, 4, 0, 8, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (510, 4, 0, 8, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (511, 4, 0, 8, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (512, 4, 0, 8, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (513, 4, 0, 8, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (514, 4, 0, 8, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (515, 4, 0, 8, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (516, 4, 0, 8, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (517, 4, 0, 8, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (518, 4, 1, 7, 2, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (519, 4, 1, 7, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (520, 4, 1, 7, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (521, 4, 1, 7, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (522, 4, 1, 7, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (523, 4, 1, 7, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (524, 4, 1, 7, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (525, 4, 1, 7, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (526, 4, 1, 7, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (527, 4, 1, 7, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (528, 4, 1, 7, 12, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (529, 4, 1, 7, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (530, 4, 1, 7, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (531, 4, 1, 7, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (532, 4, 0, 2, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (533, 4, 0, 2, 17, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (534, 4, 0, 2, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (535, 4, 0, 2, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (536, 4, 0, 2, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (537, 4, 0, 2, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (538, 4, 0, 2, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (539, 4, 0, 2, 24, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (540, 4, 0, 4, 24, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (541, 4, 0, 4, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (542, 4, 0, 4, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (543, 4, 0, 4, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (544, 4, 0, 4, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (545, 4, 0, 4, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (546, 4, 0, 4, 18, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (547, 4, 0, 4, 17, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (548, 4, 0, 4, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (549, 4, 1, 3, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (550, 4, 1, 3, 17, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (551, 4, 1, 3, 18, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (552, 4, 1, 3, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (553, 4, 1, 3, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (554, 4, 1, 3, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (555, 4, 1, 3, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (556, 4, 1, 3, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (557, 4, 1, 3, 24, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (558, 4, 0, 2, 18, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (560, 6, 0, 2, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (561, 6, 0, 2, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (562, 6, 0, 2, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (563, 6, 0, 2, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (564, 6, 0, 2, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (565, 6, 0, 2, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (566, 6, 0, 2, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (567, 6, 0, 2, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (568, 6, 0, 2, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (570, 6, 0, 2, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (571, 6, 0, 2, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (572, 6, 0, 2, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (574, 6, 1, 3, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (575, 6, 1, 3, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (576, 6, 1, 3, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (577, 6, 1, 3, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (578, 6, 1, 3, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (579, 6, 1, 3, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (580, 6, 1, 3, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (581, 6, 1, 3, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (582, 6, 1, 3, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (584, 6, 1, 3, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (585, 6, 1, 3, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (586, 6, 1, 3, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (588, 6, 0, 4, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (589, 6, 0, 4, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (590, 6, 0, 4, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (591, 6, 0, 4, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (592, 6, 0, 4, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (593, 6, 0, 4, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (594, 6, 0, 4, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (595, 6, 0, 4, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (596, 6, 0, 4, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (598, 6, 0, 4, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (599, 6, 0, 4, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (600, 6, 0, 4, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (602, 6, 0, 6, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (603, 6, 0, 6, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (604, 6, 0, 6, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (605, 6, 0, 6, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (606, 6, 0, 6, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (607, 6, 0, 6, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (608, 6, 0, 6, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (609, 6, 0, 6, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (610, 6, 0, 6, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (619, 6, 0, 8, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (620, 6, 0, 8, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (621, 6, 0, 8, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (622, 6, 0, 8, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (623, 6, 0, 8, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (624, 6, 0, 8, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (625, 6, 0, 8, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (626, 6, 0, 8, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (627, 6, 0, 8, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (630, 6, 1, 7, 3, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (631, 6, 1, 7, 4, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (632, 6, 1, 7, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (633, 6, 1, 7, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (634, 6, 1, 7, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (635, 6, 1, 7, 8, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (636, 6, 1, 7, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (637, 6, 1, 7, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (638, 6, 1, 7, 11, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (643, 6, 0, 2, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (644, 6, 0, 2, 17, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (645, 6, 0, 2, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (646, 6, 0, 2, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (647, 6, 0, 2, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (648, 6, 0, 2, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (649, 6, 0, 2, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (652, 6, 0, 4, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (653, 6, 0, 4, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (654, 6, 0, 4, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (655, 6, 0, 4, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (656, 6, 0, 4, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (657, 6, 0, 4, 18, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (658, 6, 0, 4, 17, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (659, 6, 0, 4, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (660, 6, 1, 3, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (661, 6, 1, 3, 17, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (662, 6, 1, 3, 18, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (663, 6, 1, 3, 20, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (664, 6, 1, 3, 19, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (665, 6, 1, 3, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (666, 6, 1, 3, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (667, 6, 1, 3, 23, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (669, 6, 0, 2, 18, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (674, 1, 0, 2, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (685, 1, 0, 2, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (687, 1, 0, 3, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (688, 1, 0, 2, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (689, 1, 0, 2, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (690, 1, 0, 3, 5, 2);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (691, 1, 0, 4, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (692, 1, 0, 5, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (693, 1, 0, 6, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (694, 1, 0, 7, 10, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (695, 1, 0, 8, 9, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (696, 1, 0, 8, 7, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (697, 1, 0, 8, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (698, 1, 0, 8, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (699, 1, 0, 7, 5, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (700, 1, 0, 6, 21, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (701, 1, 0, 6, 22, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (702, 1, 1, 8, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (703, 1, 1, 8, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (704, 1, 0, 6, 13, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (707, 1, 1, 6, 14, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (708, 1, 1, 6, 15, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (709, 1, 0, 6, 16, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (710, 1, 0, 4, 6, 0);
INSERT INTO `seat` (`sid`, `area`, `type`, `row`, `column`, `state`) VALUES (711, 1, 1, 4, 5, 0);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int DEFAULT '0' COMMENT '0学生1老师2管理员',
  `score` int DEFAULT '100' COMMENT '信用分',
  `number` bigint DEFAULT NULL COMMENT '学号',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`uid`, `username`, `password`, `type`, `score`, `number`) VALUES (1, '陆诗音', '123456789', 0, 90, 23210000001);
INSERT INTO `user` (`uid`, `username`, `password`, `type`, `score`, `number`) VALUES (2, '张三', '123456789', 1, 100, 23210000000);
INSERT INTO `user` (`uid`, `username`, `password`, `type`, `score`, `number`) VALUES (3, '潘童颖', '123456789', 0, 100, 23210000002);
INSERT INTO `user` (`uid`, `username`, `password`, `type`, `score`, `number`) VALUES (6, '王佳煜', '123456789', 0, 100, 23210000003);
INSERT INTO `user` (`uid`, `username`, `password`, `type`, `score`, `number`) VALUES (7, '吴欣岚', '123456789', 0, 100, 23210000004);
INSERT INTO `user` (`uid`, `username`, `password`, `type`, `score`, `number`) VALUES (9, '陈欣达', '123456789', 0, 100, 23210000005);
INSERT INTO `user` (`uid`, `username`, `password`, `type`, `score`, `number`) VALUES (11, '王五', '123456789', 0, 100, 23210000008);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
