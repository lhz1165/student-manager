/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : studentwork

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2019-10-24 22:24:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attachement
-- ----------------------------
DROP TABLE IF EXISTS `attachement`;
CREATE TABLE `attachement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `absolutepath` varchar(255) DEFAULT NULL,
  `belongfileldname` varchar(255) DEFAULT NULL,
  `belongid` varchar(255) DEFAULT NULL,
  `belongtable` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachement
-- ----------------------------
INSERT INTO `attachement` VALUES ('1', null, 'id', '1', 'bshuibao', 'POST https.docx', '2015-03-22 11:40:34', 'POST https.docx', 'images', '/graduationpro/upload/temp/POST https.docx');
INSERT INTO `attachement` VALUES ('2', null, 'id', '2', 'bshuibao', 'POST https.docx', '2015-03-22 13:29:04', 'POST https.docx', 'images', '/graduationpro/upload/temp/POST https.docx');
INSERT INTO `attachement` VALUES ('3', null, 'id', '3', 'bshuibao', 'POST https.docx', '2015-03-22 15:41:55', 'POST https.docx', 'images', '/graduationpro/upload/temp/POST https.docx');
INSERT INTO `attachement` VALUES ('4', null, 'id', '1', 'chengguo', '关于对全省新农村建设督导情况1 号通报的整改报告.docx', '2017-03-02 23:19:58', '关于对全省新农村建设督导情况1 号通报的整改报告.docx', 'images', '/studentwork/upload/temp/关于对全省新农村建设督导情况1 号通报的整改报告.docx');
INSERT INTO `attachement` VALUES ('5', null, 'id', '2', 'chengguo', '关于对全省新农村建设督导情况1 号通报的整改报告.docx', '2017-03-02 23:49:30', '关于对全省新农村建设督导情况1 号通报的整改报告.docx', 'images', '/studentwork/upload/temp/关于对全省新农村建设督导情况1 号通报的整改报告.docx');
INSERT INTO `attachement` VALUES ('6', null, 'id', '3', 'chengguo', '关于对全省新农村建设督导情况1 号通报的整改报告.docx', '2018-11-12 23:03:39', '关于对全省新农村建设督导情况1 号通报的整改报告.docx', 'images', '/studentwork/upload/temp/关于对全省新农村建设督导情况1 号通报的整改报告.docx');
INSERT INTO `attachement` VALUES ('7', null, 'id', '4', 'chengguo', '测试下载包.zip', '2018-11-12 23:37:03', '测试下载包.zip', 'images', '/studentwork/upload/temp/测试下载包.zip');
INSERT INTO `attachement` VALUES ('8', null, 'id', '2', 'submithw', '关于对全省新农村建设督导情况1 号通报的整改报告.docx', '2019-03-27 01:16:32', '关于对全省新农村建设督导情况1 号通报的整改报告.docx', 'images', '/studentwork/upload/temp/关于对全省新农村建设督导情况1 号通报的整改报告.docx');
INSERT INTO `attachement` VALUES ('9', null, 'id', '3', 'submithw', '测试下载包.zip', '2019-03-27 10:19:43', '测试下载包.zip', 'images', '/studentwork/upload/temp/测试下载包.zip');

-- ----------------------------
-- Table structure for banji
-- ----------------------------
DROP TABLE IF EXISTS `banji`;
CREATE TABLE `banji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banji
-- ----------------------------
INSERT INTO `banji` VALUES ('1', '经管1班');
INSERT INTO `banji` VALUES ('2', '经管二班');

-- ----------------------------
-- Table structure for bfrecord
-- ----------------------------
DROP TABLE IF EXISTS `bfrecord`;
CREATE TABLE `bfrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stno` varchar(500) DEFAULT NULL,
  `stname` varchar(500) DEFAULT NULL,
  `xuenian` varchar(500) DEFAULT NULL,
  `bftype` varchar(500) DEFAULT NULL,
  `bfdanwei` varchar(500) DEFAULT NULL,
  `begdate` datetime DEFAULT NULL,
  `des` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bfrecord
-- ----------------------------
INSERT INTO `bfrecord` VALUES ('1', 'S002', '辛淘', '2019-2020学年', '勤工助学', '校后勤部', '2019-06-07 00:00:00', '123555555555555');
INSERT INTO `bfrecord` VALUES ('2', 'S003', '张飞', '2019-2020学年', '勤工助学', '学校二食堂', '2019-06-08 00:00:00', '每月生活补助方式，勤工组学');

-- ----------------------------
-- Table structure for earlywarn
-- ----------------------------
DROP TABLE IF EXISTS `earlywarn`;
CREATE TABLE `earlywarn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stno` varchar(500) DEFAULT NULL,
  `stname` varchar(500) DEFAULT NULL,
  `yjtype` varchar(500) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` text,
  `createtime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of earlywarn
-- ----------------------------
INSERT INTO `earlywarn` VALUES ('2', 'S002', '辛淘', '学业预警', '123333344', '234444444444444444', '2019-06-08 09:42:31', '2');
INSERT INTO `earlywarn` VALUES ('3', 'S007', '刘阳', '逃课预警', '2019-2020学期逃课多次', '<span style=\"white-space:nowrap;\">2019-2020学期逃课多次</span><span style=\"white-space:nowrap;\">2019-2020学期逃课多次</span>', '2019-06-08 10:13:09', '2');
INSERT INTO `earlywarn` VALUES ('4', 'S002', '辛淘', '学业预警', '挂科门数过多', '请端正学习态度，影响毕业', '2019-10-24 22:20:13', '1');

-- ----------------------------
-- Table structure for fudao
-- ----------------------------
DROP TABLE IF EXISTS `fudao`;
CREATE TABLE `fudao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `bjid` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fudao
-- ----------------------------
INSERT INTO `fudao` VALUES ('2', '9', '2');
INSERT INTO `fudao` VALUES ('3', '10', '1');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `des` varchar(255) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `tno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('9', '作业测试123444444444444443434', '2019-03-27 00:57:45', '发布134442344', '刘松林', 'T001');
INSERT INTO `homework` VALUES ('10', '<span style=\"white-space:nowrap;\">发布一个测试作业了1234</span><span style=\"white-space:nowrap;\">发布一个测试作业了1234</span>', '2019-03-27 10:17:58', '发布一个测试作业了1234', '刘松林', 'T001');

-- ----------------------------
-- Table structure for kecheng
-- ----------------------------
DROP TABLE IF EXISTS `kecheng`;
CREATE TABLE `kecheng` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `des` varchar(255) DEFAULT NULL,
  `subname` varchar(255) DEFAULT NULL,
  `subno` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `tno` varchar(255) DEFAULT NULL,
  `xuefen` varchar(255) DEFAULT NULL,
  `avgscore` double DEFAULT NULL,
  `pjcount` int(11) DEFAULT NULL,
  `totalscore` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kecheng
-- ----------------------------
INSERT INTO `kecheng` VALUES ('5', '1234434', '编译原理', 'C001', '选课中', '万涛', 'T001', '3', '86', '2', '172');
INSERT INTO `kecheng` VALUES ('6', '关系数据库原理介绍', '关系数据库原理', 'C002', '选课中', '王艳', 'T002', '2', '92', '2', '184');
INSERT INTO `kecheng` VALUES ('7', '课程介绍', '云计算与数据挖局', 'KC008', '选课中', '王珏', 'T005', '3', '0', '0', '0');
INSERT INTO `kecheng` VALUES ('8', '<span style=\"white-space:nowrap;\">中国传统文化史</span><span style=\"white-space:nowrap;\">中国传统文化史</span>', '中国传统文化史', 'C008', '选课中', '王艳', 'T006', '3', '0', '0', '0');
INSERT INTO `kecheng` VALUES ('9', '235', '经济运维学', 'KC007', '选课中', '刘松林', 'T001', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for leaves
-- ----------------------------
DROP TABLE IF EXISTS `leaves`;
CREATE TABLE `leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountname` varchar(255) DEFAULT NULL,
  `applydes` varchar(255) DEFAULT NULL,
  `applytime` datetime DEFAULT NULL,
  `begdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `shenpiren` varchar(255) DEFAULT NULL,
  `shenpitime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `tianshu` int(11) NOT NULL,
  `xtype` varchar(255) DEFAULT NULL,
  `zgname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaves
-- ----------------------------
INSERT INTO `leaves` VALUES ('8', 'S002', '123455', '2019-05-11 11:27:06', '2019-05-11 00:00:00', '2019-05-12 00:00:00', '1233344', null, '2019-05-11 11:27:06', '2', '2', '病假', '辛淘');
INSERT INTO `leaves` VALUES ('9', 'S007', '1234555', '2019-05-11 15:46:27', '2019-05-11 00:00:00', '2019-05-13 00:00:00', '12344555', null, '2019-05-11 15:46:27', '2', '2', '病假', '刘阳');
INSERT INTO `leaves` VALUES ('10', 'S018', '12222222222', '2019-10-24 22:18:40', '2019-10-24 00:00:00', '2019-10-25 00:00:00', '1234555', null, '2019-10-24 22:18:40', '2', '2', '病假', '周墨汁');

-- ----------------------------
-- Table structure for leaveword
-- ----------------------------
DROP TABLE IF EXISTS `leaveword`;
CREATE TABLE `leaveword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `dcontent` text,
  `replycontent` text,
  `replyren` varchar(255) DEFAULT NULL,
  `replytime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `lyren` varchar(255) DEFAULT NULL,
  `stname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leaveword
-- ----------------------------
INSERT INTO `leaveword` VALUES ('3', '2015-04-01 22:39:29', '123333', '', 'T004', '2015-04-01 22:39:29', '1', '123333333', '001', '李明');
INSERT INTO `leaveword` VALUES ('4', '2015-04-01 23:23:21', '咨询下', '', 'T003', '2015-04-01 23:23:21', '1', '咨询', '001', '李明');
INSERT INTO `leaveword` VALUES ('7', '2017-03-02 23:50:06', '1234343434', '1234455', 'T006', '2017-03-02 23:50:06', '2', '1233434', 'S001', '刘涛');
INSERT INTO `leaveword` VALUES ('8', '2019-04-07 23:52:06', '1234444', null, 'T007', '2019-04-07 23:52:06', '1', '测试咨询1234', 'S006', '王维');
INSERT INTO `leaveword` VALUES ('9', '2019-05-11 15:46:48', '12344444444444444444', '1234555', 'T009', '2019-05-11 15:46:48', '2', '你好老师', 'S007', '刘阳');
INSERT INTO `leaveword` VALUES ('10', '2019-10-24 22:18:52', '123555555555555', null, 'T009', '2019-10-24 22:18:52', '1', '咨询老师124', 'S018', '周墨汁');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '计算机科学与技术');

-- ----------------------------
-- Table structure for niandu
-- ----------------------------
DROP TABLE IF EXISTS `niandu`;
CREATE TABLE `niandu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of niandu
-- ----------------------------
INSERT INTO `niandu` VALUES ('1', '2019-2020学年');
INSERT INTO `niandu` VALUES ('2', '2020-2021学年');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `pubren` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('3', '1234444', '2019-10-24 21:56:41', 'admin', '发布系统公告');
INSERT INTO `notice` VALUES ('4', '<span style=\"white-space:nowrap;\">发布系统公告</span>', '2019-10-24 22:15:06', 'admin', '发布系统公告');

-- ----------------------------
-- Table structure for pinkun
-- ----------------------------
DROP TABLE IF EXISTS `pinkun`;
CREATE TABLE `pinkun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stno` varchar(500) DEFAULT NULL,
  `stname` varchar(500) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `jthukou` varchar(500) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `bfjh` varchar(500) DEFAULT NULL,
  `pktype` varchar(500) DEFAULT NULL,
  `begdate` datetime DEFAULT NULL,
  `jiguan` varchar(500) DEFAULT NULL,
  `lururen` varchar(500) DEFAULT NULL,
  `homeaddress` varchar(500) DEFAULT NULL,
  `moible` varchar(500) DEFAULT NULL,
  `idcardno` varchar(500) DEFAULT NULL,
  `des` text,
  `appid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pinkun
-- ----------------------------
INSERT INTO `pinkun` VALUES ('1', 'S002', '辛淘', '/studentwork/upload/temp/u=2902925563,297294419&fm=23&gp=0.jpg', '农村户口', '父母离异', '勤工助学', '一般贫困', '2019-06-07 00:00:00', '北京', 'admin', '1238831', '13732921234', '360122199212238', '12355555555555555556', '2');
INSERT INTO `pinkun` VALUES ('2', 'S003', '张飞', '/studentwork/upload/temp/u=2952578578,107804027&fm=26&gp=0.jpg', '城镇户口', '父母离异', '勤工助学', '一般贫困', '2019-06-08 00:00:00', '北京', 'admin', '河北省廊坊市XXX', '13397881233', '360122199212239', '12345555', '3');

-- ----------------------------
-- Table structure for scholarship
-- ----------------------------
DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `xtype` varchar(500) DEFAULT NULL,
  `hjdate` datetime DEFAULT NULL,
  `stno` varchar(500) DEFAULT NULL,
  `stname` varchar(500) DEFAULT NULL,
  `xuenian` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scholarship
-- ----------------------------
INSERT INTO `scholarship` VALUES ('1', '校内奖学金三等奖', '校内奖学金', '2019-06-08 00:00:00', 'S003', '张飞', '2019-2020学年');
INSERT INTO `scholarship` VALUES ('2', '2019-2020校内奖学金', '校内奖学金', '2019-10-24 00:00:00', 'S018', '周墨汁', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `jiguan` varchar(255) DEFAULT NULL,
  `mianmao` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `stno` varchar(255) DEFAULT NULL,
  `zhuanye` varchar(255) DEFAULT NULL,
  `bjid` int(11) DEFAULT NULL,
  `bjname` varchar(255) DEFAULT NULL,
  `ssno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2', '杭州市XXX', '2019-05-11 00:00:00', '12343434', '北京', '党员', '13732921234', '辛淘', '1234345555', '123456', '/studentwork/upload/temp/u=2902925563,297294419&fm=23&gp=0.jpg', '男', 'S002', '计算机科学与技术', '2', '经管二班', '13-101');
INSERT INTO `student` VALUES ('3', '北京市海淀区XXX', '2019-05-11 00:00:00', '12444', '北京', '党员', '13397881233', '张飞', '汉', '123456', '/studentwork/upload/temp/u=2952578578,107804027&fm=26&gp=0.jpg', '男', 'S003', '计算机科学应用', '1', '经管1班', '13-101');
INSERT INTO `student` VALUES ('4', '2344', '2019-05-11 00:00:00', '234444', '北京', '党员', '13399123313', '李世光', '汉', '123456', '/studentwork/upload/temp/999999.jpg', '男', 'S005', '计算机科学与应用', '1', '经管1班', '13-101');
INSERT INTO `student` VALUES ('5', '北京市海淀区', '2019-05-11 00:00:00', '说明', '北京', '党员', '15797883399', '王维', '汉', '123456', '/studentwork/upload/temp/T001R150x150M0000025NhlN2yWrP4.jpg', '男', 'S006', '计算机科学与应用', '1', '经管1班', '13-101');
INSERT INTO `student` VALUES ('6', '北京市海淀区', '2019-05-11 00:00:00', '1234555', '北京', '党员', '15797991988', '刘阳', '汉', '123456', '/studentwork/upload/temp/u=4065881177,1651247462&fm=27&gp=0.jpg', '男', 'S007', '经济管理', '1', '经管1班', '13-102');
INSERT INTO `student` VALUES ('7', '北京市', '2019-10-24 00:00:00', '12344444444444444', '北京', '团员', '15797881233', '周墨汁', '汉', '123456', '/studentwork/upload/temp/11111111122333.jpg', '男', 'S018', '计算机科学与技术', '1', '经管1班', null);

-- ----------------------------
-- Table structure for submithw
-- ----------------------------
DROP TABLE IF EXISTS `submithw`;
CREATE TABLE `submithw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defen` int(11) NOT NULL,
  `des` varchar(255) DEFAULT NULL,
  `hwid` int(11) NOT NULL,
  `hwtitle` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `piyue` varchar(255) DEFAULT NULL,
  `pytime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `submittime` datetime DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `tno` varchar(255) DEFAULT NULL,
  `xuehao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submithw
-- ----------------------------
INSERT INTO `submithw` VALUES ('2', '0', '123444444444444444', '9', '发布134442344', '刘涛', null, '2019-03-27 01:16:32', '1', '2019-03-27 01:16:32', '刘松林', 'T001', 'S001');
INSERT INTO `submithw` VALUES ('3', '80', '我要提交作业了234434343', '10', '发布一个测试作业了1234', '张飞', '我要提交作业了234434343', '2019-03-27 10:20:24', '2', '2019-03-27 10:19:43', '刘松林', 'T001', 'S003');

-- ----------------------------
-- Table structure for sushe
-- ----------------------------
DROP TABLE IF EXISTS `sushe`;
CREATE TABLE `sushe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssno` varchar(500) DEFAULT NULL,
  `des` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sushe
-- ----------------------------
INSERT INTO `sushe` VALUES ('1', '13-101', '13栋101宿舍');
INSERT INTO `sushe` VALUES ('2', '13-102', '13栋102');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `gradschool` varchar(255) DEFAULT NULL,
  `jieshao` varchar(255) DEFAULT NULL,
  `jiguan` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `mianmao` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `tno` varchar(255) DEFAULT NULL,
  `xueli` varchar(255) DEFAULT NULL,
  `zhicheng` varchar(255) DEFAULT NULL,
  `zhiwei` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '670@126.com', '北京工业大学', '12344', '江西南昌', '计算机', '党员', '邓超 ', '汉', '123456', '/studentwork/upload/temp/u=3411304646,2313057781&fm=27&gp=0.jpg', '男', '1895711234', 'T003', '博士', '副教授', '讲师');
INSERT INTO `teacher` VALUES ('2', '1223@126.com', '北京大学', '123444444444444444444', '江西南昌', '计算机可以学与应用', '党员', '马化腾', '汉', '123456', '/studentwork/upload/temp/t222.jpg', '男', '1893434343', 'T004', '博士', '讲师', '讲师');
INSERT INTO `teacher` VALUES ('3', '118822@qq.com', '清华大学', '1233434', '北京', '计算机可以学与应用', '党员', '王晓月', '汉', '123456', '/studentwork/upload/temp/u=712765776,1435402724&fm=58.jpg', '女', '13732921234', 'T005', '硕士', '教授', '讲师');
INSERT INTO `teacher` VALUES ('4', '118822@qq.com', '清华大学', '1234343434', '北京', '计算机可以学与应用', '党员', '史玉柱', '汉', '123456', '/studentwork/upload/temp/u=712765776,1435402724&fm=58.jpg', '男', '13732921234', 'T006', '博士', '副教授', '讲师');
INSERT INTO `teacher` VALUES ('6', '1236@126.com', '清华大学', '12344', '北京', '计算机专业', '党员', '刘松林', '汉', '123456', '/studentwork/upload/temp/u=764063417,2767662146&fm=27&gp=0.jpg', '男', '15797881234', 'T001', '博士', '副教授', '讲师');
INSERT INTO `teacher` VALUES ('7', '126@126.com', '上海同济大学', '12344', '香港', '计算机科学与应用', '党员', '梁朝伟', '汉', '123456', '/studentwork/upload/temp/9988.jpg', '男', '18899276123', 'T002', '博士', '副教授', '讲师');
INSERT INTO `teacher` VALUES ('8', '1234@!26.com', '清华大学', '3444', '江苏南京', '计算机科学与应用', '党员', '诸葛瑾', '汉', '123456', '/studentwork/upload/temp/u=2015513217,769770349&fm=26&gp=0.jpg', '男', '13399123312', 'T007', '博士', '福教师', '讲师');
INSERT INTO `teacher` VALUES ('9', '1234', '江苏师范大学', '12355555555', '北京', '经济管理专业', '党员', '李小钱', '汉', '123456', '/studentwork/upload/temp/123444444444442341).jpg', '男', '1895711233', 'T008', '博士', '高工', '辅导员');
INSERT INTO `teacher` VALUES ('10', '12344@qq.com', '苏州师范学院', '1235555', '上海', '经济管理学', '党员', '司马雨', '汉', '123456', '/studentwork/upload/temp/u=1754930543,904672472&fm=27&gp=0.jpg', '女', '15797881233', 'T009', '博士', '高工', '辅导员');

-- ----------------------------
-- Table structure for tekun
-- ----------------------------
DROP TABLE IF EXISTS `tekun`;
CREATE TABLE `tekun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `applytime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `applyor` varchar(500) DEFAULT NULL,
  `appname` varchar(500) DEFAULT NULL,
  `dcontent` text,
  `arvid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tekun
-- ----------------------------
INSERT INTO `tekun` VALUES ('2', '1233', '2019-06-07 07:32:39', '4', 'S002', '辛淘', '5555', '1');
INSERT INTO `tekun` VALUES ('3', '家里困难，望请批准帮扶', '2019-06-08 10:10:36', '4', 'S003', '张飞', '3个弟弟，，父母离异', '2');
INSERT INTO `tekun` VALUES ('4', '家里特俗原因申请特困生', '2019-10-24 22:18:03', '1', 'S018', '周墨汁', '<span style=\"white-space:nowrap;\">家里特俗原因申请特困生</span><span style=\"white-space:nowrap;\">家里特俗原因申请特困生</span>', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logtimes` int(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `xiangpian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '2019-10-24 21:56:41', 'admin', '670@qq.com', '120', 'admin', 'admin', 'daowen', '男', '0791-88824', 'admin', '/studentwork/upload/temp/u=3693728450,53341709&fm=23&gp=0.jpg');
