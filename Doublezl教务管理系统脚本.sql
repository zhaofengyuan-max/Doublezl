/*
Navicat MySQL Data Transfer

Source Server         : Doublezl
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : doublezlz

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2019-06-09 23:59:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for academy
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy` (
  `AcaNo` char(4) NOT NULL,
  `AcaName` varchar(15) NOT NULL,
  `AcaDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AcaNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of academy
-- ----------------------------
INSERT INTO `academy` VALUES ('A001', '数软科学', '软件工程类学科体系');
INSERT INTO `academy` VALUES ('A002', '医学院', '临床体系');
INSERT INTO `academy` VALUES ('A003', '数学学院', '数学逻辑思维体系');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `AdminNo` char(10) NOT NULL,
  `AdminName` varchar(10) NOT NULL,
  `AdminPwd` varchar(16) NOT NULL,
  PRIMARY KEY (`AdminNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('Ad001', '赵凤园', '1234');
INSERT INTO `admin` VALUES ('Ad002', '赵曼', '1234');

-- ----------------------------
-- Table structure for batch
-- ----------------------------
DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `BatNo` char(10) NOT NULL,
  `BatName` varchar(20) NOT NULL,
  `BatNum` int(11) NOT NULL,
  `MajNo` char(8) NOT NULL,
  PRIMARY KEY (`BatNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of batch
-- ----------------------------
INSERT INTO `batch` VALUES ('B001', '16软件（Java）04', '53', 'M001');
INSERT INTO `batch` VALUES ('B002', '16树莓', '44', 'M002');

-- ----------------------------
-- Table structure for classroom
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom` (
  `ClassroomNo` char(10) NOT NULL,
  `Building` varchar(10) NOT NULL,
  `RoomNo` char(3) NOT NULL,
  `RoomType` varchar(10) NOT NULL,
  `Capacity` int(11) NOT NULL,
  PRIMARY KEY (`ClassroomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom
-- ----------------------------
INSERT INTO `classroom` VALUES ('B001', '静思楼', '117', '普通', '100');
INSERT INTO `classroom` VALUES ('B002', '德音楼', '303', '普通', '120');
INSERT INTO `classroom` VALUES ('B003', '博弈楼', '511', '机房', '50');
INSERT INTO `classroom` VALUES ('B004', '静思楼', '123', '机房', '34');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `CourseNo` char(11) NOT NULL,
  `CourseName` varchar(20) NOT NULL,
  `CourseType` varchar(5) NOT NULL,
  `AcaNo` char(4) NOT NULL,
  `CourseCredit` int(11) NOT NULL,
  `CourseDesc` varchar(50) NOT NULL,
  `CouOrder` int(11) NOT NULL,
  PRIMARY KEY (`CourseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('C001', 'JSP', '必修课程', '001', '3', '前端开发', '0');
INSERT INTO `course` VALUES ('C002', 'JSF', '必修课程', '001', '4', 'Web开发', '0');
INSERT INTO `course` VALUES ('C003', 'Hibernate', '必修课程', '001', '2', '数据库框架', '0');

-- ----------------------------
-- Table structure for dividecoursetable
-- ----------------------------
DROP TABLE IF EXISTS `dividecoursetable`;
CREATE TABLE `dividecoursetable` (
  `CourseNo` char(11) NOT NULL,
  `JieshuNo` int(11) NOT NULL,
  `Weeks` int(11) DEFAULT NULL,
  `LseeionTime` char(5) DEFAULT NULL,
  `JieshuType` int(11) DEFAULT NULL,
  `ClassroomNo` char(10) DEFAULT NULL,
  `CouOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`CourseNo`,`JieshuNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dividecoursetable
-- ----------------------------
INSERT INTO `dividecoursetable` VALUES ('C001', '1', '1', '周一', '1', '511', '0');
INSERT INTO `dividecoursetable` VALUES ('C002', '1', '2', '周五', '5', '303', '0');

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `EvaId` int(11) NOT NULL,
  `StuNo` varchar(15) NOT NULL,
  `CourseNo` char(11) NOT NULL,
  `TeaNo` char(10) NOT NULL,
  `BatNo` char(10) NOT NULL,
  `StuEva` int(11) DEFAULT NULL,
  `TeaEva` int(11) DEFAULT NULL,
  PRIMARY KEY (`EvaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES ('1', '2016207155', 'C003', 'T002', 'B002', '1', '0');
INSERT INTO `evaluate` VALUES ('2', '2016207156', 'C001', 'T001', 'B001', '1', '0');
INSERT INTO `evaluate` VALUES ('3', '2016207156', 'C002', 'T001', 'B001', '1', '0');
INSERT INTO `evaluate` VALUES ('4', '2016207156', 'C001', 'T001', 'B001', '1', '0');
INSERT INTO `evaluate` VALUES ('5', '2016207156', 'C002', 'T001', 'B001', '1', '0');
INSERT INTO `evaluate` VALUES ('6', '2016207154', 'C001', 'T001', 'B001', '0', '0');
INSERT INTO `evaluate` VALUES ('7', '2016207154', 'C002', 'T001', 'B001', '0', '0');
INSERT INTO `evaluate` VALUES ('8', '2016207154', 'C001', 'T001', 'B001', '1', '0');
INSERT INTO `evaluate` VALUES ('9', '2016207154', 'C002', 'T001', 'B001', '0', '0');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `StuNo` varchar(15) NOT NULL,
  `CourseNo` char(11) NOT NULL,
  `TeaNo` char(10) NOT NULL,
  `Years` char(4) NOT NULL,
  `Term` char(4) NOT NULL,
  `UsualScore` double NOT NULL,
  `FinalScore` double NOT NULL,
  `SumScore` double NOT NULL,
  PRIMARY KEY (`StuNo`,`CourseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('2016207154', 'C001', 'T001', '2018', '春季学期', '0', '0', '0');
INSERT INTO `grade` VALUES ('2016207154', 'C002', 'T002', '2018', '春季学期', '0', '0', '0');
INSERT INTO `grade` VALUES ('2016207155', 'C001', 'T001', '2018', '春季学期', '0', '0', '0');

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('2');
INSERT INTO `hibernate_sequence` VALUES ('2');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `MajNo` char(8) NOT NULL,
  `MajName` varchar(15) NOT NULL,
  `MajDesc` varchar(50) NOT NULL,
  `AcaNo` char(4) NOT NULL,
  PRIMARY KEY (`MajNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('M001', '软件工程', '软件类型学科', 'A001');
INSERT INTO `major` VALUES ('M002', '数字媒体', '数字媒体类型学科', 'A002');
INSERT INTO `major` VALUES ('M007', '临床', '临床类型学科', 'A002');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `MessageId` int(11) NOT NULL AUTO_INCREMENT,
  `Content` varchar(2000) DEFAULT NULL,
  `LeaveWordTime` varchar(255) DEFAULT NULL,
  `StuNo` int(11) DEFAULT NULL,
  `Replay` varchar(2000) DEFAULT NULL,
  `ReplayTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MessageId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('23', 'Javase中创建线程的方式23', '2016-04-21', '2016207154', '继承thread,实现Runnable接口，实现callback77', '2016-05-09');
INSERT INTO `message` VALUES ('24', '老师你好', '2019-06-04', '2016207154', '你好！！！', '2019-06-04');
INSERT INTO `message` VALUES ('25', '123', '2019-06-07', '2016207154', null, null);
INSERT INTO `message` VALUES ('27', '444444444444444444', '2019-06-08', '2016207154', '你好！！！', '2019-06-08');
INSERT INTO `message` VALUES ('28', '55555555555555555555555555555555555', '2019-06-08', '2016207154', '5555555555555555555', '2019-06-08');
INSERT INTO `message` VALUES ('29', '77777777777777777777777', '2019-06-08', '1', '666666666666666666', '2019-06-08');
INSERT INTO `message` VALUES ('31', '老师，明天上课吗', '2019-06-08', '1', '上课', '2019-06-08');
INSERT INTO `message` VALUES ('32', 'Hello teacher!!', '2019-06-08', '2016207154', '22222', '2019-06-09');
INSERT INTO `message` VALUES ('33', '444444444444444444444444444444444', '2019-06-09', '2016207154', '你好！！！', '2019-06-09');
INSERT INTO `message` VALUES ('34', 'zfy', '2019-06-09', '2016207154', '444444', '2019-06-09');
INSERT INTO `message` VALUES ('35', 'Doublezl', '2019-06-09', '2016207154', '111111111111111111111', '2019-06-09');
INSERT INTO `message` VALUES ('36', 'uuuuu', '2019-06-09', '2016207154', 'uuuuuu', '2019-06-09');

-- ----------------------------
-- Table structure for planl
-- ----------------------------
DROP TABLE IF EXISTS `planl`;
CREATE TABLE `planl` (
  `MajNo` char(8) NOT NULL,
  `CourseNo` char(11) NOT NULL,
  `Term` char(4) NOT NULL,
  `Years` char(4) NOT NULL,
  PRIMARY KEY (`MajNo`,`CourseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of planl
-- ----------------------------
INSERT INTO `planl` VALUES ('M001', 'C001', '春季学期', '2018');
INSERT INTO `planl` VALUES ('M001', 'C002', '春季学期', '2018');

-- ----------------------------
-- Table structure for selecourse
-- ----------------------------
DROP TABLE IF EXISTS `selecourse`;
CREATE TABLE `selecourse` (
  `CourseNo` char(255) NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `CouOrder` int(255) NOT NULL,
  `CouVolume` int(255) DEFAULT NULL,
  `CourseCredit` int(11) DEFAULT NULL,
  `TeaNo` char(255) DEFAULT NULL,
  `TeaName` varchar(255) DEFAULT NULL,
  `AcaName` varchar(255) DEFAULT NULL,
  `TeaType` varchar(255) DEFAULT NULL,
  `TeaSecond` varchar(255) DEFAULT NULL,
  `CouPlan` varchar(255) DEFAULT NULL,
  `WeekPlan` varchar(255) DEFAULT NULL,
  `Week` varchar(255) DEFAULT NULL,
  `Time` varchar(255) DEFAULT NULL,
  `RoomType` varchar(255) DEFAULT NULL,
  `RoomName` varchar(255) DEFAULT NULL,
  `CouRemark` varchar(255) DEFAULT NULL,
  `CountSum` int(255) DEFAULT '0',
  PRIMARY KEY (`CourseNo`,`CouOrder`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of selecourse
-- ----------------------------
INSERT INTO `selecourse` VALUES ('4021002140007', '金融与投资理财', '1', '97', '2', '10010017', '孙继国', '经济学院', '副教授', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼301', 'null', '3');
INSERT INTO `selecourse` VALUES ('4021002203005', '服装表演与服饰审美', '1', '30', '2', '03020304', '刘晓琳', '纺织学院服装艺术设计系', '讲师', null, '1-16周', '2', '1', '9、10', '实验室', '凝思楼201', 'null', '0');
INSERT INTO `selecourse` VALUES ('4021002203005', '服装表演与服饰审美', '2', '29', '2', '03020305', '亓凌', '纺织学院服装艺术设计系', '讲师', null, '1-16周', '2', '1', '9、10', '实验室', '凝思楼301', 'null', '1');
INSERT INTO `selecourse` VALUES ('4041002140004', '民法概论', '1', '100', '2', '12010026', '马卫东', '法学院', '副教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼201', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002130004', '中华文明英语谈', '1', '40', '2', '15060113', '刘菊花', '公共外语教育学院', '副教授', '张倩 李晓敏 陈安榕 孙亚楠', '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼213', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002130004', '中华文明英语谈', '2', '39', '2', '15060113', '刘菊花', '公共外语教育学院', '副教授', '张倩 李晓敏 陈安榕 孙亚楠', '1-16周', '2', '4', '5、6', '多媒体教室', '博知楼213', 'null', '1');
INSERT INTO `selecourse` VALUES ('4051002130004', '中华文明英语谈', '3', '40', '2', '15060113', '刘菊花', '公共外语教育学院', '副教授', '张倩 李晓敏 陈安榕 孙亚楠', '1-16周', '2', '4', '7、8', '多媒体教室', '博知楼213', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002202011', '雅思阅读', '1', '39', '2', '21070101', '李兰', '数学与统计学院', '副教授', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼109', 'null', '1');
INSERT INTO `selecourse` VALUES ('4051002202017', '英语进阶综合篇', '1', '40', '2', '09040545', '印玲', '公共外语教育学院', '讲师', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼108', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002202017', '英语进阶综合篇', '2', '40', '2', '09040527', '于桂芝', '公共外语教育学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼109', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002202018', '大学英语语音', '1', '40', '2', '15060312', '李睿', '公共外语教育学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼213', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002202019', '美国文学与文化', '1', '39', '2', '15060271', '唐丽伟', '公共外语教育学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼207', 'null', '1');
INSERT INTO `selecourse` VALUES ('4051002202025', '欧洲文明史', '1', '40', '2', '15060233', '刘甜甜', '公共外语教育学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼107', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002202026', '会话英语', '1', '40', '2', '2018185', 'Doug Johnson', '公共外语教育学院', '未知', 'Sue Johnson', '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼208', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002202027', '思维技巧', '1', '40', '2', '2018187', 'Peter Christiansen', '公共外语教育学院', '未知', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼208', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002202028', '音乐赏析', '1', '40', '2', '2018188', 'Carol Larsen', '公共外语教育学院', '未知', 'Sterling Larsen', '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼209', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002202029', '商务习惯与英语交际能力的培养', '1', '40', '2', '2018190', 'David Swan', '公共外语教育学院', '未知', 'Elisabeth Swan', '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼209', 'null', '0');
INSERT INTO `selecourse` VALUES ('4051002202034', '英文写作与沟通', '1', '35', '2', '15060202', '高燕', '公共外语教育学院', '副教授', '葛茜', '1-16周', '2', '4', '5、6', '多媒体教室', '博知楼107', 'null', '0');
INSERT INTO `selecourse` VALUES ('4081002180002', '人力资源管理与企业发展', '1', '60', '2', '04050010', '徐培新', '商学院市场学系', '副教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼109', 'null', '0');
INSERT INTO `selecourse` VALUES ('4081002203004', '公司理财', '1', '90', '2', '21010104', '韩顺强', '商学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博远楼210', 'null', '0');
INSERT INTO `selecourse` VALUES ('4081002203004', '公司理财', '2', '90', '2', '21010104', '韩顺强', '商学院', '讲师', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博远楼210', 'null', '0');
INSERT INTO `selecourse` VALUES ('4091002160001', '音乐鉴赏', '1', '110', '2', '2018193', '万博', '音乐学院', '未知', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博学楼101', 'null', '0');
INSERT INTO `selecourse` VALUES ('4091002160001', '音乐鉴赏', '2', '110', '2', '2018193', '万博', '音乐学院', '未知', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博学楼101', 'null', '0');
INSERT INTO `selecourse` VALUES ('4091002160001', '音乐鉴赏', '3', '110', '2', '2018193', '万博', '音乐学院', '未知', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博学楼101', 'null', '0');
INSERT INTO `selecourse` VALUES ('4091002160002', '音乐表演艺术入门', '1', '20', '2', '13000105', '钱海霞', '音乐学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博远楼205', 'null', '0');
INSERT INTO `selecourse` VALUES ('4091002202004', '中外作曲家及其音乐名作', '1', '90', '2', '13000008', '王晓萌', '音乐学院', '讲师', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼211', 'null', '0');
INSERT INTO `selecourse` VALUES ('4091002202030', '中外作曲家及其音乐名作', '1', '90', '2', '13000035', '李丽哲', '音乐学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼210', 'null', '0');
INSERT INTO `selecourse` VALUES ('4091002202033', '流行音乐演唱与表演', '1', '100', '2', '13000059a', '刘宇博', '音乐学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼310', 'null', '0');
INSERT INTO `selecourse` VALUES ('4101002160003', '陶瓷艺术鉴赏与创作', '1', '20', '2', '14000012', '许雅柯', '美术学院', '教授', null, '1-8周', '4', '2', '5-8', '实验室', '东院平房104', 'null', '0');
INSERT INTO `selecourse` VALUES ('4101002160003', '陶瓷艺术鉴赏与创作', '2', '20', '2', '14000077', '李兰', '美术学院', '讲师', null, '1-16周', '2', '5', '5、6', '多媒体教室', '静思楼2-403', 'null', '0');
INSERT INTO `selecourse` VALUES ('4101002160004', '中国书画剪纸', '1', '20', '2', '14000088', '许雅娟', '美术学院', '讲师', null, '1-16周', '2', '2', '7、8', '多媒体教室', '博远楼205', 'null', '0');
INSERT INTO `selecourse` VALUES ('4101002160005', '中国民间工艺美术鉴赏与实践', '1', '20', '2', '14000068', '侍锦', '美术学院', '教授', null, '1-16周', '2', '3', '7、8', '多媒体教室', '博知楼313', 'null', '0');
INSERT INTO `selecourse` VALUES ('4101002160005', '中国民间工艺美术鉴赏与实践', '2', '20', '2', '14080012', '郑骞', '美术学院', '讲师', null, '1-16周', '2', '5', '7、8', '多媒体教室', '博知楼313', 'null', '0');
INSERT INTO `selecourse` VALUES ('4101002160008', '中国篆书与篆刻艺术的赏析与实践', '1', '20', '2', '14000049', '李晓鲁', '美术学院', '副教授', null, '1-16周', '2', '3', '5、6', '多媒体教室', '静思楼2-407', 'null', '0');
INSERT INTO `selecourse` VALUES ('4101002160009', '时尚饰品设计与制作', '1', '20', '2', '14080020', '任雪玲', '美术学院', '教授', null, '1-8周', '4', '3', '5-8', '多媒体教室', '静思楼2-406', 'null', '0');
INSERT INTO `selecourse` VALUES ('4121002120004', '逻辑学基础与应用', '1', '120', '2', '09010310', '庚建凤', '马克思主义学院', '副教授', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博远楼201', 'null', '0');
INSERT INTO `selecourse` VALUES ('4121002120004', '逻辑学基础与应用', '2', '120', '2', '09010310', '庚建凤', '马克思主义学院', '副教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博远楼201', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110001', '中国现当代文学经典赏读', '1', '120', '2', '01090032', '苏懿', '文学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博学楼103', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110002', '应用写作', '1', '120', '2', '01040005', '史玉峤', '文学院', '教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博学楼102', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110002', '应用写作', '2', '120', '2', '01010053', '闫晓昀', '文学院', '未定', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博学楼202', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110002', '应用写作', '3', '120', '2', '01040002', '倪晓春', '文学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博学楼102', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110005', '《聊斋志异》导读', '1', '120', '2', '01010001', '王海燕', '文学院', '教授', null, '1-16周', '2', '4', '5、6', '多媒体教室', '博学楼204', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110005', '《聊斋志异》导读', '2', '120', '2', '01010001', '王海燕', '文学院', '教授', null, '1-16周', '2', '4', '7、8', '多媒体教室', '博学楼204', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110006', '戏剧鉴赏与实践', '1', '120', '2', '09030409', '杨宝春', '文学院', '教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博学楼303', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110006', '戏剧鉴赏与实践', '2', '120', '2', '09030118', '马光亭', '文学院', '副教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博学楼103', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110006', '戏剧鉴赏与实践', '3', '120', '2', '09030506', '刘学金', '文学院', '副教授', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博学楼104', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110007', '《红楼梦》解读', '1', '120', '2', '09030317', '周潇', '文学院', '教授', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博远楼103', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110007', '《红楼梦》解读', '2', '120', '2', '09130007', '解婷婷', '文学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博远楼202', 'null', '0');
INSERT INTO `selecourse` VALUES ('4141002110008', '中国古典诗词鉴赏', '1', '120', '2', '09030214', '张晓明', '文学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博远楼103', 'null', '0');
INSERT INTO `selecourse` VALUES ('4411002150004', '微积分理性思维的赏析', '1', '100', '2', '02010016', '曹荣荣', '数学与统计学院', '副教授', null, '1-16周', '2', '4', '9、10', '多媒体教室', '德音楼602', 'null', '0');
INSERT INTO `selecourse` VALUES ('4411002150005', '数学文化赏析', '1', '50', '2', '09070314', '李明兰', '数学与统计学院', '副教授', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博远楼102', 'null', '0');
INSERT INTO `selecourse` VALUES ('4411002201035', '数学与生活', '1', '50', '2', '02010013', '高花', '数学与统计学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博远楼104', 'null', '0');
INSERT INTO `selecourse` VALUES ('4421002201036', '生活中的趣味物理', '1', '120', '2', '20151085', '孙慧娟', '物理科学学院', '未知', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博学楼304', 'null', '0');
INSERT INTO `selecourse` VALUES ('4421002201038', '储能材料与新型电池技术', '1', '119', '2', '2018029', '郭向欣', '物理科学学院', '未知', '石川 赵宁', '1-16周', '2', '3', '9、10', '多媒体教室', '博学楼304', 'null', '1');
INSERT INTO `selecourse` VALUES ('4431002170007', '日常化学与生活安全', '1', '80', '2', '16030013', '孙德帅', '化学化工学院', '副教授', '彭彦华', '1-16周', '2', '4', '9、10', '多媒体教室', '博学楼106', 'null', '0');
INSERT INTO `selecourse` VALUES ('4431002201047', '诺贝尔奖史话：化学篇', '1', '60', '2', '201701109', '杨晓龙', '化学化工学院', '未知', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博学楼108', 'null', '0');
INSERT INTO `selecourse` VALUES ('4491002201046', 'Python进阶之网络爬虫', '2', '59', '2', '07020121', '刘晓洁', '公共计算机基础教学中心', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博学楼106', 'null', '1');
INSERT INTO `selecourse` VALUES ('4511002160006', '服装鉴赏与着装礼仪', '1', '60', '2', '03020305', '亓凌', '纺织学院服装艺术设计系', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博远楼207', 'null', '0');
INSERT INTO `selecourse` VALUES ('4511002160006', '服装鉴赏与着装礼仪', '2', '60', '2', '03020304', '刘晓琳', '纺织学院服装艺术设计系', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博远楼208', 'null', '0');
INSERT INTO `selecourse` VALUES ('4511002160007', '服装与服饰的造型艺术', '1', '59', '2', '03020009', '庄梅玲', '纺织学院服装系', '副教授', '刘晶', '1-16周', '2', '2', '9、10', '多媒体教室', '博远楼314', 'null', '1');
INSERT INTO `selecourse` VALUES ('4511002201032', '纺织材料与健康', '1', '30', '2', '201701063', '李纪伟', '纺织服装学院', '未知', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博学楼507', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000221022', '微积分快餐', '1', '100', '2', '02010016', '曹荣荣', '数学与统计学院', '副教授', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼101', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000221310', '日常化学', '1', '120', '2', '16010043', '熊忠', '化学化工学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博远楼203', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000221316', '现代生活与化学', '1', '60', '2', '16060021', '桂日军', '化学化工学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博远楼102', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000221408', '服饰时尚与健康', '1', '60', '2', '20151114', '赵明良', '纺织学院纺织系', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博远楼314', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000221802', '社会心理学研究', '1', '110', '2', '04010030', '赵兵', '文化素质教育基地', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博学楼509', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000221802', '社会心理学研究', '3', '110', '2', '04010030', '赵兵', '文化素质教育基地', '讲师', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博学楼509', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222013', 'Python 语言程序设计基础', '2', '60', '2', '07020209', '张云红', '公共计算机基础教学中心', '讲师', null, '1-16周', '2', '6', '5、6', '多媒体教室', '博学楼108', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222013', 'Python 语言程序设计基础', '3', '60', '2', '07020133', '郑世秀', '公共计算机基础教学中心', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博学楼108', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222015', '趣味程序设计', '1', '60', '2', '07010304', '高磊', '计算机科学技术学院', '讲师', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼301', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222053', '云读书', '2', '60', '2', '07020137', '赵希梅', '公共计算机基础教学中心', '副教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博学楼108', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222115', '欧美电子游戏发展史', '1', '60', '2', '07010407', '贾世宇', '计算机科学技术学院', '副教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼303', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222121', '图形绘制与数据处理：Origin实用教程', '1', '60', '2', '00070011', '楚天舒', '计算科学与工程技术中心', '教授', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼205', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222124', '数码照片后期处理技巧', '1', '60', '2', '00070011', '楚天舒', '计算科学与工程技术中心', '教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼205', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222138', '实用多媒体技术', '1', '60', '2', '21030314', '王美兴', '数据科学与软件工程学院', '副教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博远楼212', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222138', '实用多媒体技术', '2', '60', '2', '21030314', '王美兴', '数据科学与软件工程学院', '副教授', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博远楼212', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000222201', '汽车及使用', '2', '100', '2', '05050004', '赵红', '机电工程学院', '副教授', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼311', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000224048', '中小学理科教师如何说课', '1', '60', '2', '20161128', '万延岚', '化学化工学院', '未知', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博学楼109', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000224050', '海洋资源及其利用', '1', '120', '2', '16050019', '谷正', '化学化工学院', '讲师', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博远楼203', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000231203', '现代诗鉴赏与朗诵', '1', '120', '2', '09030107', '谢新华', '文学院', '副教授', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博远楼101', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000232001', '史记精读', '1', '60', '2', '01010055', '宋亚莉', '文学院', '未知', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博远楼103', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234231', '中国民族器乐艺术', '1', '115', '2', '13000309', '王娟娟', '音乐学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼302', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234231', '中国民族器乐艺术', '2', '115', '2', '13000309', '王娟娟', '音乐学院', '讲师', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼302', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234231', '中国民族器乐艺术', '3', '115', '2', '13000309', '王娟娟', '音乐学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼302', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234441', '色彩.服装与美', '1', '80', '2', '16020019', '张林', '纺织学院轻化工程系', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼105', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234450', '中国画鉴赏与实践', '1', '20', '2', '14000023', '杨仲全', '美术学院', '教授', null, '1-16周', '2', '3', '5、6', '多媒体教室', '博知楼313', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234461', '服饰美赏析', '1', '120', '2', '21050207', '郑爽', '应用技术学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼102', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234461', '服饰美赏析', '2', '120', '2', '21050207', '郑爽', '应用技术学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼101', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234465', '中国服装艺术发展与赏析', '1', '120', '2', '21050206', '蓝蓝', '应用技术学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼103', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234465', '中国服装艺术发展与赏析', '2', '120', '2', '21050206', '蓝蓝', '应用技术学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼103', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234468', '服饰配件赏析', '1', '120', '2', '21050209', '解晓君', '应用技术学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼104', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000234468', '服饰配件赏析', '2', '120', '2', '21050209', '解晓君', '应用技术学院', '讲师', null, '1-16周', '2', '4', '9、10', '多媒体教室', '博知楼102', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000242001', '管理学', '1', '90', '2', '11090010', '侯历华', '旅游与地理科学学院', '讲师', null, '1-16周', '2', '2', '9、10', '多媒体教室', '博知楼210', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000245052', '世界经济与大国战略', '1', '100', '2', '10030013', '张之峰', '经济学院', '副教授', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼310', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000290056', '葡萄酒鉴赏与礼仪', '1', '60', '2', '11010021', '吕庆峰', '旅游与地理科学学院', '讲师', null, '1-16周', '2', '3', '9、10', '多媒体教室', '博知楼212', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000290311', '健身瑜伽', '1', '60', '2', '08000376', '陈浩', '体育学院', '讲师', null, '1-16周', '2', '2', '9、10', '体育教室', '浮山校区西院体育馆舞蹈教室', 'null', '0');
INSERT INTO `selecourse` VALUES ('C02000290311', '健身瑜伽', '2', '59', '2', '08000376', '陈浩', '体育学院', '讲师', null, '1-16周', '2', '4', '9、10', '体育教室', '浮山校区西院体育馆舞蹈教室', 'null', '1');

-- ----------------------------
-- Table structure for sestudentcourse
-- ----------------------------
DROP TABLE IF EXISTS `sestudentcourse`;
CREATE TABLE `sestudentcourse` (
  `StuNo` varchar(15) NOT NULL,
  `CourseNo` char(255) NOT NULL,
  `CouOrder` int(255) NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `Years` char(4) NOT NULL,
  `term` char(4) NOT NULL,
  `CourseType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StuNo`,`CourseNo`,`Years`,`term`,`CouOrder`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sestudentcourse
-- ----------------------------
INSERT INTO `sestudentcourse` VALUES ('2016207154', '4021002140007', '1', '金融与投资理财', '2019', '秋季学期', '选修');
INSERT INTO `sestudentcourse` VALUES ('2016207154', 'C001', '1', 'JSP', '2018', '春季学期', '必修课程');
INSERT INTO `sestudentcourse` VALUES ('2016207154', 'C002', '1', 'JSF', '2018', '春季学期', '必修课程');
INSERT INTO `sestudentcourse` VALUES ('2016207154', 'C003', '1', 'Hibernate', '2018', '春季学期', '必修课程');
INSERT INTO `sestudentcourse` VALUES ('2016207155', '4421002201038', '1', '储能材料与新型电池技术', '2019', '秋季学期', '选修');
INSERT INTO `sestudentcourse` VALUES ('2016207155', '4491002201046', '2', 'Python进阶之网络爬虫', '2019', '秋季学期', '选修');
INSERT INTO `sestudentcourse` VALUES ('2016207155', '4511002160007', '1', '服装与服饰的造型艺术', '2019', '秋季学期', '选修');
INSERT INTO `sestudentcourse` VALUES ('2016207155', 'C02000290311', '2', '健身瑜伽', '2019', '秋季学期', '选修');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `StuNo` varchar(15) NOT NULL,
  `StuPwd` varchar(10) NOT NULL,
  `StuName` varchar(10) NOT NULL,
  `StuGender` char(1) NOT NULL,
  `BatNo` char(10) NOT NULL,
  `Addr` varchar(30) NOT NULL,
  `PoliticalStatus` varchar(5) NOT NULL,
  `Images` varchar(30) NOT NULL,
  PRIMARY KEY (`StuNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2016207154', '1234', 'Jency', '女', 'B001', '山东省菏泽市', '共青团员', '2016207154.jpg');
INSERT INTO `student` VALUES ('2016207155', '1234', 'Ada', '女', 'B002', '山东省青岛市', '共青团员', '2016207155.jpg');
INSERT INTO `student` VALUES ('2016207156', '123456', 'Mary', '女', 'B001', '山东省青岛市', '共青团员', '003.jpg');

-- ----------------------------
-- Table structure for studentcourse
-- ----------------------------
DROP TABLE IF EXISTS `studentcourse`;
CREATE TABLE `studentcourse` (
  `StuNo` varchar(15) NOT NULL,
  `CourseNo` char(11) NOT NULL,
  `Years` char(4) NOT NULL,
  `term` char(4) NOT NULL,
  PRIMARY KEY (`StuNo`,`CourseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentcourse
-- ----------------------------
INSERT INTO `studentcourse` VALUES ('2016207154', 'C001', '2018', '春季学期');
INSERT INTO `studentcourse` VALUES ('2016207154', 'C002', '2018', '春季学期');
INSERT INTO `studentcourse` VALUES ('2016207154', 'C003', '2018', '春季学期');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `TeaNo` char(10) NOT NULL,
  `TeaName` varchar(10) NOT NULL,
  `TeaPass` varchar(16) NOT NULL,
  `Gender` varchar(15) NOT NULL,
  `Birthdate` date NOT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `AcaNo` char(4) NOT NULL,
  PRIMARY KEY (`TeaNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('T001', 'Anna', '123', '女', '1989-09-06', 'Ada@163.com', 'A001');
INSERT INTO `teacher` VALUES ('T002', 'Tony', '1234', '男', '1985-11-02', 'Ada@163.com', 'A001');
INSERT INTO `teacher` VALUES ('T003', 'Ada', '123', '男', '1980-06-06', 'Ada@163.com', 'A002');

-- ----------------------------
-- Table structure for totalcoursetable
-- ----------------------------
DROP TABLE IF EXISTS `totalcoursetable`;
CREATE TABLE `totalcoursetable` (
  `CourseNo` char(11) NOT NULL,
  `BatNo` char(10) NOT NULL,
  `TeaNo` char(10) NOT NULL,
  `RoomType` varchar(10) NOT NULL,
  `Term` char(4) NOT NULL,
  `Years` char(4) NOT NULL,
  `CouOrder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseNo`,`BatNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of totalcoursetable
-- ----------------------------
INSERT INTO `totalcoursetable` VALUES ('C001', 'B001', 'T001', '机房', '春季学期', '2018', null);
INSERT INTO `totalcoursetable` VALUES ('C001', 'B002', 'T001', '普通', '秋季学期', '2018', null);
INSERT INTO `totalcoursetable` VALUES ('C002', 'B001', 'T001', '机房', '秋季学期', '2019', null);
INSERT INTO `totalcoursetable` VALUES ('C003', 'B002', 'T002', '普通', '春季学期', '2017', null);
INSERT INTO `totalcoursetable` VALUES ('C004', 'B001', 'T003', '普通', '春季学期', '2019', null);

-- ----------------------------
-- Table structure for vedio
-- ----------------------------
DROP TABLE IF EXISTS `vedio`;
CREATE TABLE `vedio` (
  `VedioId` int(11) NOT NULL AUTO_INCREMENT,
  `VedioName` varchar(66) DEFAULT NULL,
  `VedioPro` varchar(2000) DEFAULT NULL,
  `VedioAttachment` varchar(55) DEFAULT NULL,
  `AttachmentOldName` varchar(2000) DEFAULT NULL,
  `UploadTime` varchar(50) DEFAULT NULL,
  `Del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`VedioId`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vedio
-- ----------------------------
INSERT INTO `vedio` VALUES ('25', '666', '666', '11111111111111111111.mp4', 'MemoryQuestions.mp4', '2019-06-02', 'no');
INSERT INTO `vedio` VALUES ('34', '赵芳曼', '听力作业\r\n', '2f7d2be1-9021-45a9-97c1-42d4afae329d.mp4', '5.mp4', '2019-06-08', 'no');
INSERT INTO `vedio` VALUES ('35', '涛涛涛涛', '涛涛涛涛', '832b2efe-cb93-4466-bd28-8165be49bfae.mp4', '3.mp4', '2019-06-08', 'no');
INSERT INTO `vedio` VALUES ('36', 'zfy', 'zfy', 'ada60dbc-7195-48ba-8904-a2ab39fc02d8.mp4', '3.mp4', '2019-06-08', 'no');
INSERT INTO `vedio` VALUES ('37', '111', '111', '5e0e2e30-f654-4e23-98c8-e8767c4ccab0.mp4', '7.mp4', '2019-06-09', 'no');
INSERT INTO `vedio` VALUES ('38', '444', '444', 'b49179b2-137f-4c89-a8bb-18bb3067b6d2.mp4', '4.mp4', '2019-06-09', 'no');
INSERT INTO `vedio` VALUES ('39', '444', '444', 'af6cbc4d-6a94-47b7-a426-59e5e31a167e.mp4', '4.mp4', '2019-06-09', 'no');
INSERT INTO `vedio` VALUES ('40', '78888', '888888', 'd5320a02-dc50-46f6-9387-5ad55b57f1a8.mp4', 'SmokingQuestions.mp4', '2019-06-09', 'no');
INSERT INTO `vedio` VALUES ('42', '赵凤园', '赵凤园', 'ac71b266-5e77-495a-90f2-fe5f19c2f17f.mp4', '7.mp4', '2019-06-09', 'no');
INSERT INTO `vedio` VALUES ('43', 'ggg', 'ggg', '2f4fac3d-ab0c-4e45-b883-92be1975fae2.mp4', '7.mp4', '2019-06-09', 'no');
INSERT INTO `vedio` VALUES ('44', '好吧', 'haoba', '739dbb9e-3477-421a-b20a-de3e843acc52.mp4', 'file1.mp4', '2019-06-09', 'no');
INSERT INTO `vedio` VALUES ('45', 'zzzzzz', 'zzzzzz', '2d1e1896-5b86-4ae0-b266-9c88fdf4ec37.mp4', '7.mp4', '2019-06-09', 'no');
INSERT INTO `vedio` VALUES ('46', 'fffffff', 'fffff', '7138ebc7-17d4-432d-90cd-259e55374f89.mp4', '7.mp4', '2019-06-09', 'no');
INSERT INTO `vedio` VALUES ('47', 'yyyy', 'yyyy', '841f45e0-5a75-4f54-8fc9-b1eb9ce99f00.mp4', '4.mp4', '2019-06-09', 'no');
