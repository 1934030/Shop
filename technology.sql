/*
 Navicat Premium Data Transfer

 Source Server         : conn
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : technology

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 21/11/2023 09:46:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminid` int NOT NULL AUTO_INCREMENT,
  `aimg` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '21322423.gif',
  `aname` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `password` varchar(11) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `grade` int NOT NULL,
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10008 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (10001, '21322423_admin.gif', '一叶扁舟', '1234', 1);
INSERT INTO `admin` VALUES (10002, '21322423.gif', '  zhangsan', '23454', 2);
INSERT INTO `admin` VALUES (10003, '21322423.gif', '学海无涯', '666', 2);
INSERT INTO `admin` VALUES (10008, '21322423.gif', '书山有路', '12344353', 2);

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification`  (
  `classid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `descb` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`classid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1019 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of classification
-- ----------------------------
INSERT INTO `classification` VALUES (1012, '小说', '');
INSERT INTO `classification` VALUES (1013, '文艺', '');
INSERT INTO `classification` VALUES (1014, '教育', '');
INSERT INTO `classification` VALUES (1015, '生活', '');
INSERT INTO `classification` VALUES (1016, '励志', '');
INSERT INTO `classification` VALUES (1017, '童书', '');
INSERT INTO `classification` VALUES (1018, '最新上架', '');
INSERT INTO `classification` VALUES (1019, '热销图书', '');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logid` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `adminid` int NULL DEFAULT 0,
  `descb` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bytime` datetime NOT NULL,
  PRIMARY KEY (`logid`) USING BTREE,
  INDEX `FK_uid_2`(`uid`) USING BTREE,
  INDEX `FK_adminid`(`adminid`) USING BTREE,
  CONSTRAINT `FK_adminid` FOREIGN KEY (`adminid`) REFERENCES `admin` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_uid_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1042 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (956, 10038, NULL, '您在【2021年09月29日 23:05:18】登录了本商城', '2021-09-29 23:05:18');
INSERT INTO `log` VALUES (958, 10038, NULL, '您在【2021年09月30日 17:04:50】登录了本商城', '2021-09-30 17:04:50');
INSERT INTO `log` VALUES (959, 10038, NULL, '您在【2021年10月01日 10:11:47】登录了本商城', '2021-10-01 10:11:47');
INSERT INTO `log` VALUES (960, 10038, NULL, '您在【2021年10月11日 22:39:00】登录了本商城', '2021-10-11 22:39:00');
INSERT INTO `log` VALUES (961, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-11 22:39:04');
INSERT INTO `log` VALUES (962, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-11 22:43:42');
INSERT INTO `log` VALUES (963, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-11 22:44:08');
INSERT INTO `log` VALUES (964, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-11 22:45:30');
INSERT INTO `log` VALUES (965, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-11 22:45:40');
INSERT INTO `log` VALUES (966, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-11 22:45:43');
INSERT INTO `log` VALUES (967, 10038, NULL, '您浏览了【小说】分类下的【活着】', '2021-10-11 22:48:43');
INSERT INTO `log` VALUES (968, 10038, NULL, '您浏览了【小说】分类下的【活着】', '2021-10-11 22:50:25');
INSERT INTO `log` VALUES (969, 10038, NULL, '您在【2021年10月20日 23:42:18】登录了本商城', '2021-10-20 23:42:18');
INSERT INTO `log` VALUES (970, 10038, NULL, '您浏览了【小说】分类下的【活着】', '2021-10-20 23:42:26');
INSERT INTO `log` VALUES (971, 10038, NULL, '您浏览了【小说】分类下的【活着】', '2021-10-20 23:49:10');
INSERT INTO `log` VALUES (972, 10038, NULL, '您浏览了【小说】分类下的【活着】', '2021-10-20 23:52:53');
INSERT INTO `log` VALUES (973, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-20 23:53:24');
INSERT INTO `log` VALUES (974, 10038, NULL, '您浏览了【小说】分类下的【活着】', '2021-10-21 00:19:48');
INSERT INTO `log` VALUES (975, 10038, NULL, '您在【2021年10月21日 00:44:09】登录了本商城', '2021-10-21 00:44:09');
INSERT INTO `log` VALUES (976, 10038, NULL, '您浏览了【小说】分类下的【活着】', '2021-10-21 00:44:17');
INSERT INTO `log` VALUES (977, 10038, NULL, '您在【2021年10月26日 18:55:40】登录了本商城', '2021-10-26 18:55:40');
INSERT INTO `log` VALUES (978, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-26 18:55:46');
INSERT INTO `log` VALUES (979, 10038, NULL, '您浏览了【小说】分类下的【活着】', '2021-10-26 19:14:12');
INSERT INTO `log` VALUES (980, 10038, NULL, '您浏览了【童书】分类下的【安徒生童话】', '2021-10-26 19:25:52');
INSERT INTO `log` VALUES (981, 10038, NULL, '您在【2021年10月26日 20:52:25】登录了本商城', '2021-10-26 20:52:25');
INSERT INTO `log` VALUES (982, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-26 20:52:35');
INSERT INTO `log` VALUES (983, 10038, NULL, '您添加了一款名为【边城】的商品到购物车', '2021-10-26 20:52:38');
INSERT INTO `log` VALUES (984, 10038, NULL, '您在【2021年10月26日 22:13:09】登录了本商城', '2021-10-26 22:13:09');
INSERT INTO `log` VALUES (985, 10038, NULL, '您在【2021年10月27日 12:32:22】登录了本商城', '2021-10-27 12:32:22');
INSERT INTO `log` VALUES (986, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-27 12:32:30');
INSERT INTO `log` VALUES (987, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-27 12:39:09');
INSERT INTO `log` VALUES (988, 10038, NULL, '您在【2021年10月27日 12:45:57】登录了本商城', '2021-10-27 12:45:57');
INSERT INTO `log` VALUES (989, 10038, NULL, '您在【2021年10月27日 13:13:51】登录了本商城', '2021-10-27 13:13:51');
INSERT INTO `log` VALUES (990, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-27 13:14:56');
INSERT INTO `log` VALUES (991, 10038, NULL, '您添加了一款名为【边城】的商品到购物车', '2021-10-27 13:15:01');
INSERT INTO `log` VALUES (992, 10038, NULL, '您添加了一款名为【边城】的商品到购物车', '2021-10-27 13:15:18');
INSERT INTO `log` VALUES (993, 10038, NULL, '您在购物车删除了购物ID为【53】的商品', '2021-10-27 13:15:36');
INSERT INTO `log` VALUES (994, 10038, NULL, '您在购物车删除了购物ID为【51】的商品', '2021-10-27 13:15:51');
INSERT INTO `log` VALUES (995, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-27 13:17:10');
INSERT INTO `log` VALUES (996, 10038, NULL, '您添加了一款名为【边城】的商品到购物车', '2021-10-27 13:17:12');
INSERT INTO `log` VALUES (997, 10038, NULL, '您在购物车删除了购物ID为【54】的商品', '2021-10-27 13:17:15');
INSERT INTO `log` VALUES (998, 10038, NULL, '您浏览了【小说】分类下的【边城】', '2021-10-27 13:18:01');
INSERT INTO `log` VALUES (999, 10039, NULL, '您在【2021年11月02日 18:02:10】登录了本商城', '2021-11-02 18:02:10');
INSERT INTO `log` VALUES (1000, 10039, NULL, '您浏览了【童书】分类下的【格林童话】', '2021-11-02 18:03:41');
INSERT INTO `log` VALUES (1001, 10039, NULL, '您添加了一款名为【格林童话】的商品到购物车', '2021-11-02 18:03:43');
INSERT INTO `log` VALUES (1002, 10039, NULL, '下单成功，订单号：【20211102180607702029】', '2021-11-02 18:06:07');
INSERT INTO `log` VALUES (1003, 10039, NULL, '您在【2021年11月02日 18:13:53】登录了本商城', '2021-11-02 18:13:53');
INSERT INTO `log` VALUES (1004, 10039, NULL, '您在【2021年11月02日 20:10:59】登录了本商城', '2021-11-02 20:10:59');
INSERT INTO `log` VALUES (1005, 10039, NULL, '您在【2021年11月02日 21:46:09】登录了本商城', '2021-11-02 21:46:09');
INSERT INTO `log` VALUES (1006, 10039, NULL, '您浏览了【小说】分类下的【边城】', '2021-11-02 21:46:13');
INSERT INTO `log` VALUES (1007, 10039, NULL, '您添加了一款名为【边城】的商品到购物车', '2021-11-02 21:46:17');
INSERT INTO `log` VALUES (1008, 10039, NULL, '您浏览了【小说】分类下的【边城】', '2021-11-02 21:46:30');
INSERT INTO `log` VALUES (1009, 10039, NULL, '您添加了一款名为【边城】的商品到购物车', '2021-11-02 21:46:32');
INSERT INTO `log` VALUES (1010, 10039, NULL, '您在购物车删除了购物ID为【57】的商品', '2021-11-02 21:46:43');
INSERT INTO `log` VALUES (1011, 10039, NULL, '您浏览了【小说】分类下的【边城】', '2021-11-02 22:07:38');
INSERT INTO `log` VALUES (1012, 10039, NULL, '您浏览了【小说】分类下的【边城】', '2021-11-02 22:17:46');
INSERT INTO `log` VALUES (1013, 10039, NULL, '您浏览了【小说】分类下的【活着】', '2021-11-02 22:20:02');
INSERT INTO `log` VALUES (1014, 10039, NULL, '您浏览了【小说】分类下的【活着】', '2021-11-02 22:21:20');
INSERT INTO `log` VALUES (1015, 10039, NULL, '您浏览了【小说】分类下的【活着】', '2021-11-02 22:21:20');
INSERT INTO `log` VALUES (1016, 10039, NULL, '您浏览了【小说】分类下的【活着】', '2021-11-02 22:21:21');
INSERT INTO `log` VALUES (1017, 10039, NULL, '您浏览了【小说】分类下的【活着】', '2021-11-02 22:21:53');
INSERT INTO `log` VALUES (1018, 10039, NULL, '您在【2021年11月02日 22:23:21】登录了本商城', '2021-11-02 22:23:21');
INSERT INTO `log` VALUES (1019, 10039, NULL, '您浏览了【小说】分类下的【活着】', '2021-11-02 22:23:25');
INSERT INTO `log` VALUES (1020, 10039, NULL, '您浏览了【小说】分类下的【活着】', '2021-11-02 22:24:01');
INSERT INTO `log` VALUES (1021, 10039, NULL, '您浏览了【小说】分类下的【活着】', '2021-11-02 22:24:08');
INSERT INTO `log` VALUES (1022, 10039, NULL, '您在【2021年11月02日 22:25:12】登录了本商城', '2021-11-02 22:25:12');
INSERT INTO `log` VALUES (1023, 10039, NULL, '您浏览了【热销图书】分类下的【假面山庄】', '2021-11-02 22:27:19');
INSERT INTO `log` VALUES (1024, 10039, NULL, '您浏览了【热销图书】分类下的【假面山庄】', '2021-11-02 22:27:51');
INSERT INTO `log` VALUES (1025, 10039, NULL, '您浏览了【小说】分类下的【边城】', '2021-11-02 22:44:54');
INSERT INTO `log` VALUES (1026, 10039, NULL, '您浏览了【文艺】分类下的【远望可以当归】', '2021-11-02 22:54:29');
INSERT INTO `log` VALUES (1027, 10039, NULL, '您浏览了【文艺】分类下的【远望可以当归】', '2021-11-02 22:54:46');
INSERT INTO `log` VALUES (1028, 10039, NULL, '您在【2021年11月17日 12:42:56】登录了本商城', '2021-11-17 12:42:56');
INSERT INTO `log` VALUES (1029, 10039, NULL, '您浏览了【小说】分类下的【边城】', '2021-11-17 12:43:08');
INSERT INTO `log` VALUES (1030, 10039, NULL, '您浏览了【小说】分类下的【边城】', '2021-11-17 12:43:29');
INSERT INTO `log` VALUES (1031, 10039, NULL, '您浏览了【小说】分类下的【边城】', '2021-11-17 12:43:33');
INSERT INTO `log` VALUES (1032, 10039, NULL, '您浏览了【小说】分类下的【边城】', '2021-11-17 12:43:38');
INSERT INTO `log` VALUES (1033, 10038, NULL, '您在【2021年11月20日 00:58:03】登录了本商城', '2021-11-20 00:58:03');
INSERT INTO `log` VALUES (1034, 10038, NULL, '您在【2021年11月20日 22:48:00】登录了本商城', '2021-11-20 22:48:00');
INSERT INTO `log` VALUES (1035, 10038, NULL, '您在【2021年11月21日 00:20:29】登录了本商城', '2021-11-21 00:20:29');
INSERT INTO `log` VALUES (1036, 10038, NULL, '您在【2021年11月21日 00:28:11】登录了本商城', '2021-11-21 00:28:11');
INSERT INTO `log` VALUES (1037, 10038, NULL, '您在【2021年11月21日 00:41:25】登录了本商城', '2021-11-21 00:41:25');
INSERT INTO `log` VALUES (1038, 10038, NULL, '您浏览了【教育】分类下的【MySQL数据库基础实例教程】', '2021-11-21 00:41:36');
INSERT INTO `log` VALUES (1039, 10038, NULL, '您浏览了【文艺】分类下的【远望可以当归】', '2021-11-21 00:41:47');
INSERT INTO `log` VALUES (1040, 10038, NULL, '您添加了一款名为【远望可以当归】的商品到购物车', '2021-11-21 00:42:39');
INSERT INTO `log` VALUES (1041, 10038, NULL, '下单成功，订单号：【20211121004345880014】', '2021-11-21 00:43:45');
INSERT INTO `log` VALUES (1042, 10040, NULL, '您在【2023年10月26日 19:02:51】登录了本商城', '2023-10-26 19:02:51');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `ordercode` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `uid` int NOT NULL,
  `status` int NOT NULL,
  `orderaddress` varchar(200) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `postalfee` float NOT NULL,
  `orderdate` date NOT NULL,
  `orderpostcode` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `orderpostname` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`) USING BTREE,
  INDEX `UK_uid`(`uid`) USING BTREE,
  CONSTRAINT `UK_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (58, '20211102180607702029', 10039, 4, '1,1', 14, '2021-11-02', '1005121231141', '韵达');
INSERT INTO `order` VALUES (59, '20211121004345880014', 10038, 0, '默认地址：合肥市', 19, '2021-11-21', '', '');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `odetailId` int NOT NULL AUTO_INCREMENT,
  `orderid` int NOT NULL,
  `pid` int NOT NULL,
  `pimg` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `pname` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `price` float NOT NULL,
  `odetailnum` int NOT NULL,
  PRIMARY KEY (`odetailId`) USING BTREE,
  INDEX `UK_pid`(`pid`) USING BTREE,
  INDEX `UK_orderid`(`orderid`) USING BTREE,
  CONSTRAINT `UK_orderid` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UK_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (68, 58, 100034, '1635261237496_Product.jpg', '格林童话', 15, 1);
INSERT INTO `orderdetail` VALUES (69, 59, 100038, '1635250813188_Product.jpg', '边城', 15.7, 1);
INSERT INTO `orderdetail` VALUES (70, 59, 100030, '1635867330494_Product.jpg', '远望可以当归', 22.1, 4);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `pimg` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '1571486776174_Product',
  `price` float NOT NULL,
  `stock` int NOT NULL,
  `title` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `descb` varchar(500) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `bytime` datetime NOT NULL,
  `classid` int NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `FK_classid`(`classid`) USING BTREE,
  CONSTRAINT `FK_classid` FOREIGN KEY (`classid`) REFERENCES `classification` (`classid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 100040 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (100030, '边城', '1635250813188_Product.jpg', 15.7, 1000, NULL, '沈从文代表作之一，重现湘西世界的诗意与纯净，书写人情美、人事美、人性美', '2021-10-11 22:43:30', 1012);
INSERT INTO `product` VALUES (100031, '活着', '1635256063927_Product.jpg', 17.5, 500, NULL, '定本 25周年特别修订 《活着》讲述了人如何去承受巨大的苦难；讲述了眼泪的宽广和丰富；讲述了绝望的不存在；讲述了人是为了活着本身而活着的，而不是为了活着之外的任何事物而活着。本书获得：意大利格林扎纳 卡佛文学奖', '2021-10-11 22:48:32', 1012);
INSERT INTO `product` VALUES (100032, '红楼梦', '1635253681202_Product.jpg', 60, 100, NULL, '本书是十八世纪中国伟大的文学巨著，不仅是中国文学之林的珍奇瑰宝，而且也是世界文学海洋中的一颗璀璨明珠。本书是中国文学*伟大而又复杂的作品，它描绘的社会现实，波及封建社会的官场、家族、意识形态等诸多方面，它描叙的爱情悲剧，不知使多少读者为之一掬同情之泪。或许正是它的主题的多样性、复杂性成就了它永久的艺术魅力，使之卓然屹立于世界艺术之林而万古长新。\n　　《红楼梦》是十八世纪中国伟大的文学巨著，不仅是中国文学之林的珍奇瑰宝，而且也是世界文学海洋中的一颗璀璨明珠。本书是中国文学*伟大而又复杂的作品，它描绘的社会现实，波及封建社会的官场、家族、意识形态等诸多方面，它描叙的爱情悲剧，不知使多少读者为之一掬同情之泪。或许正是它的主题的多样性、复杂性成就了它永久的艺术魅力，使之卓然屹立于世界艺术之林而万古长新。本《红楼梦》由享誉学界的红学专家俞平伯先生校点，启功作注，是现在社会上*的《红楼梦》版本。', '2021-10-26 19:19:43', 1012);
INSERT INTO `product` VALUES (100033, '安徒生童话', '1635250552163_Product.jpg', 84, 100, NULL, '200年前，童话大师安徒生的诞生成就了这个世界*令人惊奇的童话之一。这位鞋匠、洗衣妇的儿子在贫困潦倒中创作了“丑小鸭”、“卖火柴的小女孩”、“皇帝的新装”等经典之作，在实现自己梦想的同时，给世界留下了发人深省的思考，感动了一代又一代的读者，这个名字本身也在超越国界的过程中向全世界奉献了经典的故事。纵览安徒生一生创作的168部作品，其童话以深邃的思想、博大的爱心、独特的个性、高超的艺术，赢得了全世界儿童和成人们的尊敬，成为了人类阅读史上的一个奇迹。《安徒生童话全集》记录着安徒生的伟大童话和不朽生命的永恒节奏，温暖了儿童的纯真世界，更直抵着成人心灵深处。\n1846年，安徒生全集于德国出版。1849年，丹麦以本民族文字印行了《安徒生童话全集》。安徒生童话具有独特的艺术风格：即诗意的美和喜剧性的幽默。前者为主导风格，多体现在歌颂性的童话中，后者多体现在讽刺性的童话中。\n安徒生的创作可分早、中、晚三个时期。\n早期童话多充满绮丽的幻想、乐观的精神，体现现实主义和浪漫主义相结合的特点。代表作有《打火匣》、《小意达的花儿》、《拇指姑娘》、《海的女儿》、《野天鹅》、《丑小鸭》等。', '2021-10-26 19:24:30', 1017);
INSERT INTO `product` VALUES (100034, '格林童话', '1635261237496_Product.jpg', 15, 1000, NULL, '“格林童话”是世界童话三大宝库之一，是格林兄弟搜集、加工、整理而成的德国民间文学故事集。作者以浪漫主义情怀，讲述了活泼有趣的生活故事，塑造了个性鲜明的形象，展示了奇特绚丽的童话世界。“格林童话”被联合国教科文组织盛赞为“欧洲和东方童话传统划时代的汇编作品”，并加入“世界记忆”项目中，本书对启发儿童想象力，培养真善美品质有积极意义。', '2021-10-26 21:04:04', 1017);
INSERT INTO `product` VALUES (100035, '一千零一夜', '1635263316584_Product.jpg', 18, 500, NULL, '《一千零一夜》全书由篇幅不一、情节各异的两百多个神话传说、魔法故事、民间传说和寓言故事构成，本书收录了其中十余个经典故事。这些故事将古代阿拉伯以及周围国家的社会现实和神奇的想象巧妙地融为一体，为我们展开了一幅色彩斑斓、形象逼真的中世纪阿拉伯帝国的社会生活画卷。其中《阿里巴巴和四十大盗》、《阿拉丁和神灯》、《辛巴达航海历险记》、《乌木马的故事》等脍炙人口的故事，以其引人入胜的情节、奇妙的想象、通俗的语言、浓烈的生活气息和鲜明的阿拉伯特色，不仅为我们揭开了东方文化的神秘面纱，还带领我们体验了一次奇异的神秘之旅，使我们在感受真挚、动人情感的同时，还能了解到古代阿拉伯等国家的风土人情。', '2021-10-26 21:07:25', 1017);
INSERT INTO `product` VALUES (100036, '水浒传', '1635261789112_Product.jpg', 58, 500, NULL, '《水浒传》是我国*部以农民起义为题材的长篇章回小说，是我国文学史上一座巍然屹立的丰碑，也是世界文学宝库中一颗光彩夺目的明珠。数百年来，它一直深受我国人民的喜爱，并被译为多种文字，成为我国流传*为广泛的古代长篇小说之一。', '2021-10-26 22:05:40', 1018);
INSERT INTO `product` VALUES (100037, '假面山庄', '1635262086128_Product.jpg', 40, 200, '东野圭吾', '《假面山庄》是东野圭吾的长篇小说，中文简体初次出版，日文版销量超60万册。东野圭吾说：“《假面山庄》是我的自信之作。我在构思时萌生出一个很妙的主意，于是写作一气呵成。”像《假面山庄》这样烧脑的长篇推理小说好久不见了！阅读时每当以为已经接近真相，翻到下一页却发现又吃了一惊。只有看到结尾，才会明白书名的真正含义。', '2021-10-26 22:31:50', 1019);
INSERT INTO `product` VALUES (100038, '远望可以当归', '1635867330494_Product.jpg', 22.1, 100, NULL, '本集为吾乡怀旧思乡系列之一，精选余光中游国愁思、人生感悟相关名篇，五彩笔下，是浪子游与逍遥游的神奇融合。配以季全保的江南建筑画，再现余光中江南老家，古旧之间，尽显朴风遗韵。\n余光中将亲朋故友旧情、幼年生活、思乡别绪、人生漫谈、哲理梳理等倾注笔端，叙说了一代江南游子的百般思绪。星在天上，人在漂泊，天涯游子百感交集。', '2021-11-02 22:15:23', 1013);
INSERT INTO `product` VALUES (100039, 'MySQL数据库基础实例教程', '1635867959977_Product.jpg', 47, 200, NULL, '本书以MySQL数据库管理系统为平台，较全面地介绍了数据库的基础知识及其应用。全书共9个单元，包括认识数据库、数据库设计、数据定义、数据操作、数据查询、数据视图、索引与分区、数据库编程和数据安全。全书采用案例教学方式，分别采用4个不同的数据库项目贯穿始末。每个单元先以应用举例的方式阐述知识要点，再通过对一个典型的商业实例进行分析，给出解决问题的完整方案，并提供与商业实例相对应的综合实训项目，以便读者在实践中模拟操作，后通过理论知识测试和实战项目演练等强化训练来帮助读者巩固所学的内容。', '2021-11-02 22:33:47', 1014);
INSERT INTO `product` VALUES (100040, '把自己当回事儿', '1635867199608_Product.jpg', 24, 666, NULL, '这是一本杨天真的“沟通秘籍”，用*真诚的方式讲解*有力的沟通之道。\n真诚、直接、解决问题、\n共情、共识、自我沟通，\n6大核心板块，层层递进，破解沟通背后的底层逻辑！', '2021-11-02 22:58:48', 1016);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `carid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `pid` int NOT NULL,
  `numbers` int NOT NULL,
  `priceall` float NULL DEFAULT NULL,
  `cartbytime` datetime NOT NULL,
  PRIMARY KEY (`carid`) USING BTREE,
  INDEX `FK_uid`(`uid`) USING BTREE,
  INDEX `FK_pid`(`pid`) USING BTREE,
  CONSTRAINT `FK_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES (52, 10038, 100030, 4, 62.8, '2021-10-27 13:15:01');
INSERT INTO `shoppingcart` VALUES (55, 10039, 100034, 1, 15, '2021-11-02 18:03:43');
INSERT INTO `shoppingcart` VALUES (56, 10039, 100030, 2, 31.4, '2021-11-02 21:46:17');
INSERT INTO `shoppingcart` VALUES (58, 10038, 100038, 1, 22.1, '2021-11-21 00:42:39');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `headimg` varchar(100) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT '1571405904746_Person.jpg',
  `uname` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `password` varchar(11) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL,
  `myname` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `birthday` varchar(14) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `vip` int NOT NULL DEFAULT 0,
  `phone` varchar(20) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `idnum` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `signature` varchar(50) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 0,
  `bytime` datetime NOT NULL,
  `lasttime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `UK_uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10040 CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (10038, NULL, '1000', '1000', NULL, 'male', NULL, 0, '18326000948', NULL, NULL, '合肥市', NULL, 0, '2021-09-29 22:45:24', '2021-11-21 00:41:25');
INSERT INTO `user` VALUES (10039, '1637425285126_Person.jpg', '10001', '10001', NULL, NULL, NULL, 0, NULL, NULL, NULL, '合肥市', NULL, 0, '2021-11-02 18:01:54', '2021-11-17 12:42:55');
INSERT INTO `user` VALUES (10040, '1698320969240_Person.jpg', '231026', '123456', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, '2023-10-26 19:02:36', '2023-10-26 19:02:51');

SET FOREIGN_KEY_CHECKS = 1;
