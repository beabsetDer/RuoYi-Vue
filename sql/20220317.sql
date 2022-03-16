/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : ry-vue
Target Host     : localhost:3306
Target Database : ry-vue
Date: 2022-03-17 00:04:24
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'ks_employee', '員工資訊表', null, null, 'KsEmployee', 'crud', 'com.ruoyi.kaisheng', 'ks', 'employee', '員工表單', 'sheng', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47', null);
INSERT INTO `gen_table` VALUES ('2', 'ks_oil_order', '加油單資訊', null, null, 'KsOilOrder', 'crud', 'com.ruoyi.kaisheng', 'ks', 'order', '加油表單', 'Sheng', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2022-02-20 03:50:27', '', '2022-02-22 08:05:36', null);
INSERT INTO `gen_table` VALUES ('3', 'ks_car', '車輛資訊', null, null, 'KsCar', 'crud', 'com.ruoyi.kaisheng', 'ks', 'car', '車輛表單', 'Sheng', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:35:10', null);
INSERT INTO `gen_table` VALUES ('4', 'ks_downbound', '南下單資訊', null, null, 'KsDownbound', 'crud', 'com.ruoyi.kaisheng', 'ks', 'downbound', '南下表單', 'Sheng', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2022-02-20 16:34:28', '', '2022-02-22 23:13:21', null);
INSERT INTO `gen_table` VALUES ('5', 'ks_gonorth', '北上單資訊', null, null, 'KsGonorth', 'crud', 'com.ruoyi.kaisheng', 'ks', 'gonorth', '北上表單', 'Sheng', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2022-02-20 16:34:28', '', '2022-02-22 23:13:40', null);
INSERT INTO `gen_table` VALUES ('6', 'ks_goods', '貨物資訊', null, null, 'KsGoods', 'crud', 'com.ruoyi.kaisheng', 'ks', 'goods', '貨物表單', 'Sheng', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:36:44', null);
INSERT INTO `gen_table` VALUES ('7', 'ks_expense', '日常開支訊息', null, null, 'KsExpense', 'crud', 'com.ruoyi.kaisheng', 'ks', 'expense', '日常開支表單', 'Sheng', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12', null);
INSERT INTO `gen_table` VALUES ('8', 'ks_client', '客戶公司資訊', null, null, 'KsClient', 'crud', 'com.ruoyi.kaisheng', 'ks', 'client', '客戶公司表單', 'Sheng', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2022-03-03 16:44:25', '', '2022-03-03 17:20:57', null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', '流水號', 'int(10)', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'employee_id', '員工編號', 'varchar(10)', 'String', 'employeeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'name', '員工姓名', 'varchar(255)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'aka', '綽號', 'varchar(255)', 'String', 'aka', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('5', '1', 'phone_number', '手機', 'varchar(12)', 'String', 'phoneNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('6', '1', 'id_card', '身分證', 'varchar(10)', 'String', 'idCard', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('7', '1', 'sex', '姓別', 'varchar(2)', 'String', 'sex', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', '7', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('8', '1', 'home_telephone_number', '家電', 'varchar(20)', 'String', 'homeTelephoneNumber', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('9', '1', 'address', '住址', 'varchar(255)', 'String', 'address', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('10', '1', 'company', '隸屬公司', 'varchar(255)', 'String', 'company', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('11', '1', 'staff_positions', '職稱', 'varchar(255)', 'String', 'staffPositions', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('12', '1', 'entry_date', '入職日期', 'datetime', 'Date', 'entryDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '12', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('13', '1', 'resignation_date', '離職日期', 'datetime', 'Date', 'resignationDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '13', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('14', '1', 'reason_for_leaving', '離職原因', 'varchar(255)', 'String', 'reasonForLeaving', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2022-02-19 23:47:42', '', '2022-02-19 23:51:47');
INSERT INTO `gen_table_column` VALUES ('15', '2', 'id', '流水號', 'int(10)', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-02-20 03:50:27', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('16', '2', 'oil_order_id', '油單編號', 'varchar(20)', 'String', 'oilOrderId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-02-20 03:50:28', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('17', '2', 'oid_date', '加油日期', 'datetime', 'Date', 'oidDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '3', 'admin', '2022-02-20 03:50:28', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('18', '2', 'oil_driver', '機司名稱', 'varchar(10)', 'String', 'oilDriver', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-02-20 03:50:28', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('19', '2', 'oil_license_plate_number', '油加車牌', 'varchar(10)', 'String', 'oilLicensePlateNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-02-20 03:50:28', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('20', '2', 'oil_type', '油的種類', 'varchar(10)', 'String', 'oilType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-02-20 03:50:28', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('21', '2', 'oil_price', '油的價格', 'double(4,2)', 'BigDecimal', 'oilPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2022-02-20 03:50:28', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('22', '2', 'oil_liters', '加油公升', 'double(5,2)', 'BigDecimal', 'oilLiters', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-02-20 03:50:28', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('23', '2', 'oil_total', '油單總價格', 'double(7,2)', 'BigDecimal', 'oilTotal', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2022-02-20 03:50:28', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('24', '2', 'gas_station', '加油站名稱', 'varchar(20)', 'String', 'gasStation', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2022-02-20 03:50:28', '', '2022-02-22 08:05:36');
INSERT INTO `gen_table_column` VALUES ('25', '3', 'id', '流水號', 'int(10)', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:35:10');
INSERT INTO `gen_table_column` VALUES ('26', '3', 'license_plate_number', '車牌', 'varchar(255)', 'String', 'licensePlateNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:35:10');
INSERT INTO `gen_table_column` VALUES ('27', '3', 'car_idle', '車輛狀況', 'varchar(10)', 'String', 'carIdle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:35:10');
INSERT INTO `gen_table_column` VALUES ('28', '3', 'car_purchase_date', '購車日期', 'datetime', 'Date', 'carPurchaseDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '4', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:35:10');
INSERT INTO `gen_table_column` VALUES ('29', '3', 'car_loan', '貸款狀態', 'varchar(10)', 'String', 'carLoan', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:35:10');
INSERT INTO `gen_table_column` VALUES ('30', '3', 'car_maintenance_date', '保養日期', 'datetime', 'Date', 'carMaintenanceDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '6', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:35:10');
INSERT INTO `gen_table_column` VALUES ('31', '3', 'next_maintenance_date', '下次保養日期', 'datetime', 'Date', 'nextMaintenanceDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '7', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:35:10');
INSERT INTO `gen_table_column` VALUES ('32', '3', 'car_maintenance', '保養狀態', 'varchar(10)', 'String', 'carMaintenance', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:35:10');
INSERT INTO `gen_table_column` VALUES ('33', '4', 'id', '流水號', 'int(10)', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', null, '1', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('34', '4', 'downbound_id', '南下單編號', 'varchar(20)', 'String', 'downboundId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('35', '4', 'downbound_date', '日期(南下單)', 'datetime', 'Date', 'downboundDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '3', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('36', '4', 'downbound_driver', '司機名稱', 'varchar(5)', 'String', 'downboundDriver', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('37', '4', 'downbound_license_plate_number', '車牌號碼', 'varchar(10)', 'String', 'downboundLicensePlateNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('38', '4', 'downbound_company', '公司名稱', 'varchar(20)', 'String', 'downboundCompany', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('39', '4', 'downbound_outset', '起點', 'varchar(20)', 'String', 'downboundOutset', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('40', '4', 'downbound_yard', '堆場', 'varchar(20)', 'String', 'downboundYard', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('41', '4', 'downbound_cash', '現金', 'varchar(4)', 'String', 'downboundCash', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'ks_cash', '9', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('42', '4', 'downbound_goods', '貨物名稱', 'varchar(10)', 'String', 'downboundGoods', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('43', '4', 'downbound_goods_mt', '貨物噸數', 'double(4,2)', 'BigDecimal', 'downboundGoodsMt', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('44', '4', 'downbound_goods_price', '貨物單價', 'double(6,2)', 'BigDecimal', 'downboundGoodsPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('45', '4', 'downbound_total', '此趟運費', 'double(8,2)', 'BigDecimal', 'downboundTotal', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '13', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('46', '4', 'downbound_driver_pay', '此趟薪資', 'double(10,2)', 'BigDecimal', 'downboundDriverPay', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:21');
INSERT INTO `gen_table_column` VALUES ('47', '5', 'id', '流水號', 'int(10)', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', null, '1', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('48', '5', 'gonorth_id', '北上單編號', 'varchar(20)', 'String', 'gonorthId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('49', '5', 'gonorth_date', '日期(北上單)', 'datetime', 'Date', 'gonorthDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', '3', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('50', '5', 'gonorth_driver', '司機名稱', 'varchar(5)', 'String', 'gonorthDriver', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('51', '5', 'gonorth_license_plate_number', '車牌號碼', 'varchar(10)', 'String', 'gonorthLicensePlateNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('52', '5', 'gonorth_company', '公司名稱', 'varchar(20)', 'String', 'gonorthCompany', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('53', '5', 'gonorth_outset', '起點', 'varchar(20)', 'String', 'gonorthOutset', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('54', '5', 'gonorth_yard', '堆場', 'varchar(20)', 'String', 'gonorthYard', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('55', '5', 'gonorth_cash', '現金', 'varchar(4)', 'String', 'gonorthCash', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'ks_cash', '9', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('56', '5', 'gonorth_goods', '貨物名稱', 'varchar(10)', 'String', 'gonorthGoods', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('57', '5', 'gonorth_goods_mt', '貨物噸數', 'double(4,2)', 'BigDecimal', 'gonorthGoodsMt', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('58', '5', 'gonorth_goods_price_company', '公司單價', 'double(6,2)', 'BigDecimal', 'gonorthGoodsPriceCompany', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '12', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('59', '5', 'gonorth_goods_price_driver', '司機單價', 'double(6,2)', 'BigDecimal', 'gonorthGoodsPriceDriver', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '13', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('60', '5', 'gonorth_total', '公司此趟運費', 'double(8,2)', 'BigDecimal', 'gonorthTotal', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '14', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('61', '5', 'gonorth_bill_total', '扣發票金額', 'double(8,2)', 'BigDecimal', 'gonorthBillTotal', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '15', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('62', '5', 'gonorth_driver_pay', '此趟薪資', 'double(10,2)', 'BigDecimal', 'gonorthDriverPay', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '16', 'admin', '2022-02-20 16:34:28', null, '2022-02-22 23:13:40');
INSERT INTO `gen_table_column` VALUES ('63', '6', 'id', '流水號', 'int(10)', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:36:44');
INSERT INTO `gen_table_column` VALUES ('64', '6', 'goods_id', '品項編號', 'varchar(10)', 'String', 'goodsId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:36:44');
INSERT INTO `gen_table_column` VALUES ('65', '6', 'goods_name', '品項名稱', 'varchar(10)', 'String', 'goodsName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', '2022-02-20 16:34:28', '', '2022-02-20 16:36:44');
INSERT INTO `gen_table_column` VALUES ('66', '7', 'id', '流水號', 'int(10)', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('67', '7', 'expense_id', '日常開支編號', 'varchar(20)', 'String', 'expenseId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('68', '7', 'expense_date', '日常開支日期', 'datetime', 'Date', 'expenseDate', '0', '0', null, '1', '1', '1', '1', 'EQ', 'datetime', '', '3', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('69', '7', 'expense_driver', '機司名稱', 'varchar(10)', 'String', 'expenseDriver', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('70', '7', 'expense_license_plate_number', '車牌', 'varchar(10)', 'String', 'expenseLicensePlateNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('71', '7', 'expense_1', '土尾', 'double(5,2)', 'BigDecimal', 'expense1', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('72', '7', 'expense_2', '發泡', 'double(5,2)', 'BigDecimal', 'expense2', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '7', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('73', '7', 'expense_3', '洗車', 'double(5,2)', 'BigDecimal', 'expense3', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('74', '7', 'expense_other', '其他雜項', 'double(7,2)', 'BigDecimal', 'expenseOther', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('75', '7', 'expense_total', '日常開支總額', 'double(7,2)', 'BigDecimal', 'expenseTotal', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', '2022-02-24 07:24:55', '', '2022-02-24 07:26:12');
INSERT INTO `gen_table_column` VALUES ('76', '8', 'id', '', 'int(10)', 'Integer', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', null, '1', 'admin', '2022-03-03 16:44:25', null, '2022-03-03 17:20:57');
INSERT INTO `gen_table_column` VALUES ('84', '8', 'client_id', '客戶公司編號', 'varchar(10)', 'String', 'clientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', '2', '', '2022-03-03 17:20:35', '', '2022-03-03 17:20:57');
INSERT INTO `gen_table_column` VALUES ('85', '8', 'client_name', '客戶公司名稱', 'varchar(20)', 'String', 'clientName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '3', '', '2022-03-03 17:20:35', '', '2022-03-03 17:20:57');
INSERT INTO `gen_table_column` VALUES ('86', '8', 'client_tel', '客戶公司電話', 'varchar(12)', 'String', 'clientTel', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', '', '2022-03-03 17:20:35', '', '2022-03-03 17:20:57');
INSERT INTO `gen_table_column` VALUES ('87', '8', 'client_phone', '客戶公司手機', 'varchar(12)', 'String', 'clientPhone', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', '', '2022-03-03 17:20:35', '', '2022-03-03 17:20:57');
INSERT INTO `gen_table_column` VALUES ('88', '8', 'client_head', '客戶公司負責人', 'varchar(5)', 'String', 'clientHead', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '6', '', '2022-03-03 17:20:35', '', '2022-03-03 17:20:57');
INSERT INTO `gen_table_column` VALUES ('89', '8', 'client_address', '客戶公司地址', 'varchar(20)', 'String', 'clientAddress', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '7', '', '2022-03-03 17:20:35', '', '2022-03-03 17:20:57');
INSERT INTO `gen_table_column` VALUES ('90', '8', 'client_note', '客戶公司備註', 'varchar(255)', 'String', 'clientNote', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', '', '2022-03-03 17:20:35', '', '2022-03-03 17:20:57');

-- ----------------------------
-- Table structure for ks_car
-- ----------------------------
DROP TABLE IF EXISTS `ks_car`;
CREATE TABLE `ks_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `license_plate_number` varchar(255) NOT NULL COMMENT '車牌',
  `car_idle` varchar(10) NOT NULL DEFAULT '正常運行' COMMENT '車輛狀況',
  `car_purchase_date` datetime DEFAULT NULL COMMENT '購車日期',
  `car_loan` varchar(10) DEFAULT '已還款' COMMENT '貸款狀態',
  `car_maintenance_date` datetime DEFAULT NULL COMMENT '保養日期',
  `next_maintenance_date` datetime DEFAULT NULL COMMENT '下次保養日期',
  `car_maintenance` varchar(10) DEFAULT '已保養' COMMENT '保養狀態',
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_plate_number` (`license_plate_number`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ks_car
-- ----------------------------
INSERT INTO `ks_car` VALUES ('1', 'KSC-0803', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('2', 'KSC-0805', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('3', 'KSC-0832', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('4', 'KSC-0958', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('5', 'KSD-0990', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('6', 'KSZ-1356', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('7', 'KSD-1629', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('8', 'KSZ-1698', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('9', 'KSZ-1699', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('10', 'KSZ-2038', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('11', 'KSZ-2039', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('12', 'KSZ-2637', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('13', 'KSZ-2739', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('14', 'KSZ-2769', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('15', 'KXD-3506', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('16', 'KXC-3769', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('17', 'KXD-3907', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('18', 'KXC-5391', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('19', 'KXC-5392', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('20', 'KXC-5680', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('21', 'KXA-6799', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('22', 'KSZ-6979', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('23', 'KXA-7366', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('24', 'KSD-8136', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('25', 'KSD-8196', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('26', 'KSD-8295', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('27', 'KXC-5681', '正常運行', null, '已還款', null, null, '已保養');
INSERT INTO `ks_car` VALUES ('28', 'KXC-3617', '正常運行', null, '已還款', null, null, '已保養');

-- ----------------------------
-- Table structure for ks_client
-- ----------------------------
DROP TABLE IF EXISTS `ks_client`;
CREATE TABLE `ks_client` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(10) NOT NULL COMMENT '客戶公司編號',
  `client_name` varchar(20) DEFAULT NULL COMMENT '客戶公司名稱',
  `client_tel` varchar(12) DEFAULT NULL COMMENT '客戶公司電話',
  `client_phone` varchar(12) DEFAULT NULL COMMENT '客戶公司手機',
  `client_head` varchar(5) DEFAULT NULL COMMENT '客戶公司負責人',
  `client_address` varchar(20) DEFAULT NULL COMMENT '客戶公司地址',
  `client_note` varchar(255) DEFAULT NULL COMMENT '客戶公司備註',
  PRIMARY KEY (`id`),
  UNIQUE KEY `clinet_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ks_client
-- ----------------------------
INSERT INTO `ks_client` VALUES ('1', 'client-01', '現金已收', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('2', 'client-02', '老鼠請款', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('3', 'client-03', '威峰開發', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('4', 'client-04', '益友工程', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('5', 'client-05', '遠嘉土資場', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('6', 'client-06', '鉅邦玖崧', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('7', 'client-07', '鍵蒼竹北', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('8', 'client-08', '太原', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('9', 'client-09', '中印', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('10', 'client-10', '中石化', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('11', 'client-11', '環球海湖', null, null, null, null, '北上(不開ㄈㄆ)');
INSERT INTO `ks_client` VALUES ('12', 'client-12', '亞泥竹東', null, null, null, null, '北上(不開ㄈㄆ)');
INSERT INTO `ks_client` VALUES ('13', 'client-13', '和毅建材', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('14', 'client-14', '守威東和', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('15', 'client-15', '天達工程', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('16', 'client-16', '天達工程(阿呆)', null, null, '阿呆', null, null);
INSERT INTO `ks_client` VALUES ('17', 'client-17', '昆宏環保', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('18', 'client-18', '福峻工程', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('19', 'client-19', '台土工程', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('20', 'client-20', '嘉大砂石', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('21', 'client-21', '利一煤炭', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('22', 'client-22', '傑彪工程', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('23', 'client-23', '永乘阿國', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('24', 'client-24', '甲騰-永瀝', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('25', 'client-25', '甲騰-東瀝', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('26', 'client-26', '世界', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('27', 'client-27', '全日工程(小胖)', null, null, '小胖', null, null);
INSERT INTO `ks_client` VALUES ('28', 'client-28', '海哥', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('29', 'client-29', '淳家', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('30', 'client-30', '博隆工程(楓禾)', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('31', 'client-31', '嘉志工程', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('32', 'client-32', '熲原', null, null, null, null, null);
INSERT INTO `ks_client` VALUES ('33', 'client-33', '阿力', null, null, null, null, null);

-- ----------------------------
-- Table structure for ks_downbound
-- ----------------------------
DROP TABLE IF EXISTS `ks_downbound`;
CREATE TABLE `ks_downbound` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `downbound_id` varchar(20) NOT NULL COMMENT '南下單編號',
  `downbound_date` datetime NOT NULL COMMENT '日期(南下單)',
  `downbound_driver` varchar(5) NOT NULL COMMENT '司機名稱',
  `downbound_license_plate_number` varchar(10) NOT NULL COMMENT '車牌號碼',
  `downbound_company` varchar(20) NOT NULL DEFAULT '無' COMMENT '公司名稱',
  `downbound_outset` varchar(20) NOT NULL DEFAULT '無' COMMENT '起點',
  `downbound_yard` varchar(20) NOT NULL DEFAULT '無' COMMENT '堆場',
  `downbound_cash` varchar(4) DEFAULT '否' COMMENT '現金',
  `downbound_goods` varchar(10) DEFAULT NULL COMMENT '貨物名稱',
  `downbound_goods_mt` double(4,2) NOT NULL DEFAULT '0.00' COMMENT '貨物噸數',
  `downbound_goods_price` double(6,2) NOT NULL DEFAULT '0.00' COMMENT '貨物單價',
  `downbound_total` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '此趟運費',
  `downbound_driver_pay` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '此趟薪資',
  PRIMARY KEY (`id`),
  UNIQUE KEY `downbound_id` (`downbound_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ks_downbound
-- ----------------------------
INSERT INTO `ks_downbound` VALUES ('1', '22021801', '2022-02-18 00:00:00', '黃智凱', 'KSC-0803', '鴻海', '台北', '彰化', '是', '土', '36.50', '850.00', '31025.00', '7135.75');
INSERT INTO `ks_downbound` VALUES ('2', '22021802', '2022-02-18 00:00:00', '李政儒', 'KSC-0805', '亞泥', '新竹', '雲林', '是', '泥土', '30.00', '700.00', '21000.00', '4830.00');
INSERT INTO `ks_downbound` VALUES ('3', '22021901', '2022-02-19 00:00:00', '黃智凱', 'KSC-0803', '亞泥', '新竹', '雲林', '是', '泥土', '35.00', '800.00', '28000.00', '6440.00');
INSERT INTO `ks_downbound` VALUES ('4', '22021902', '2022-02-19 00:00:00', '李政儒', 'KSC-0805', '鴻海', '台北', '彰化', '是', '土', '36.50', '820.00', '29930.00', '6883.90');
INSERT INTO `ks_downbound` VALUES ('5', '22022201', '2022-02-22 00:00:00', '與智波', 'AKA-878', '凱基', '高雄', '新竹', '否', '土石', '50.00', '100.00', '5000.00', '1150.00');
INSERT INTO `ks_downbound` VALUES ('6', '22022202', '2022-02-22 00:00:00', '小妹妹', 'AKA-777', '鴻海', '高雄', '雲林', '否', '石膏', '50.00', '100.00', '5000.00', '1150.00');
INSERT INTO `ks_downbound` VALUES ('7', '22021501', '2022-02-15 00:00:00', '黃智凱', 'KSC-0803', 'client-03', '台灣', '大陸', '是', 'goods-02', '50.00', '50.00', '2500.00', '1000.00');
INSERT INTO `ks_downbound` VALUES ('8', '22022101', '2022-02-21 00:00:00', '黃智凱', 'KSC-0958', 'client-13', '日本', '美國', '是', 'goods-04', '50.00', '100.00', '5000.00', '2000.00');
INSERT INTO `ks_downbound` VALUES ('9', '22022601', '2022-02-26 00:00:00', '黃智凱', 'KSC-0803', 'client-14', '日本', '美國', '是', 'goods-06', '20.00', '100.00', '2000.00', '500.00');

-- ----------------------------
-- Table structure for ks_employee
-- ----------------------------
DROP TABLE IF EXISTS `ks_employee`;
CREATE TABLE `ks_employee` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `employee_id` varchar(10) NOT NULL COMMENT '員工編號',
  `name` varchar(255) DEFAULT NULL COMMENT '員工姓名',
  `aka` varchar(255) DEFAULT NULL COMMENT '綽號',
  `phone_number` varchar(12) DEFAULT NULL COMMENT '手機',
  `id_card` varchar(10) DEFAULT NULL COMMENT '身分證',
  `sex` varchar(2) DEFAULT '男' COMMENT '姓別',
  `home_telephone_number` varchar(20) DEFAULT NULL COMMENT '家電',
  `address` varchar(255) DEFAULT NULL COMMENT '住址',
  `company` varchar(255) DEFAULT NULL COMMENT '隸屬公司',
  `staff_positions` varchar(255) DEFAULT NULL COMMENT '職稱',
  `entry_date` datetime DEFAULT NULL COMMENT '入職日期',
  `resignation_date` datetime DEFAULT NULL COMMENT '離職日期',
  `reason_for_leaving` varchar(255) DEFAULT '無' COMMENT '離職原因',
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ks_employee
-- ----------------------------
INSERT INTO `ks_employee` VALUES ('1', 'ks-01', '黃智凱', '', '0960-182124', 'A100537101', '男', '', '新北市泰山區中華街9號', '凱基股份有限公司', '負責人', '2015-05-01 00:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('2', 'ks-02', '錢志杰', '', '0922-283442', 'A180353903', '男', '', '新北市雙溪區新基北街7號', '凱基股份有限公司', '司機', '2021-04-06 00:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('3', 'ks-03', '連懿辛', null, '0954-314630', 'A155254353', '男', null, '高雄市楠梓區楠梓加工出口區內環南22號', '凱基股份有限公司', '司機', '2021-12-01 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('4', 'ks-04', '李政儒', '', '0926-830527', 'A142535161', '男', '', '彰化縣大城鄉褔建路9號', '凱基股份有限公司', '司機', '2022-01-01 00:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('5', 'ks-05', '彭映強', '屁哥', '0923-501428', 'A164317121', '男', null, '高雄市小港區松華路19號', '凱基股份有限公司', '司機', '2019-07-24 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('6', 'ks-06', '謝鴻韻', '哥吉拉', '0972-895582', 'A154618826', '男', null, '宜蘭縣冬山鄉大興路24號', '凱基股份有限公司', '司機', '2021-03-21 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('7', 'ks-07', '張政添', '小邱', '0926-592909', 'J172925288', '男', null, '臺中市東區旱溪三街10號', '凱基股份有限公司', '司機', '2020-07-28 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('8', 'ks-08', '黃冠中', null, '0933-819367', 'J137726229', '男', null, '桃園市平鎮區新光路20號', '凱基股份有限公司', '司機', '2021-03-31 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('9', 'ks-09', '楊柏毅', null, '0961-761825', 'J113599917', '男', null, '苗栗縣後龍鎮庄南街4號', '凱基股份有限公司', '司機', '2021-11-11 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('10', 'ks-10', '吳維哲', null, '0923-847414', 'J198503264', '男', null, '雲林縣北港鎮東興街27號', '凱基股份有限公司', '司機', '2021-11-22 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('11', 'ks-11', '彭成治', '阿誠', '0970-756281', 'V130129348', '男', null, '臺北市松山區東寧路22號', '凱基股份有限公司', '司機', '2020-07-27 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('12', 'ks-12', '王國維', '志豪', '0970-360800', 'V152296197', '男', null, '新竹市東區平和街20號', '凱基股份有限公司', '司機', '2019-06-29 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('13', 'ks-13', '張凱屏', '玉米', '0970-836881', 'V118687449', '男', null, '桃園市觀音區富源六路12號', '凱基股份有限公司', '司機', '2020-06-10 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('14', 'ks-14', '洪忠真', '山豬', '0972-062521', 'V185799792', '男', null, '嘉義縣大林鎮下潭底34號', '凱基股份有限公司', '司機', '2019-07-14 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('15', 'ks-15', '楊建州', '', '0932-439833', 'V192585897', '男', '', '彰化縣和美鎮西美路9號', '凱基股份有限公司', '司機', null, '2022-02-08 00:00:00', '無');
INSERT INTO `ks_employee` VALUES ('16', 'ks-16', '李怡芳', '', '0922-317112', 'A256938743', '女', '', '花蓮縣富里鄉四維29號', '凱基股份有限公司', '司機', '2021-09-14 00:00:00', '2022-01-20 00:00:00', '表弟酒駕');
INSERT INTO `ks_employee` VALUES ('17', 'ks-17', '游仁杰', '阿達', '0913-029907', 'D182593597', '男', null, '高雄市鳥松區澄新一街5號', '凱基股份有限公司', '司機', '2021-04-28 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('18', 'ks-18', '張世榮', '無缺', '0932-645186', 'L103422473', '男', null, '花蓮縣鳳林鎮仁愛街33號', '凱基股份有限公司', '司機', null, null, '無');
INSERT INTO `ks_employee` VALUES ('19', 'ks-19', '張東雨', '戰將', '0929-432287', 'L120468491', '男', null, '臺中市北屯區和祥二街30號', '凱基股份有限公司', '司機', '2021-10-26 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('20', 'ks-20', '林君亮', '養樂多', '0952-303820', 'L195901054', '男', '', '桃園市蘆竹區新南路21號', '凱基股份有限公司', '司機', null, null, '無');
INSERT INTO `ks_employee` VALUES ('21', 'ks-21', '劉彥君', null, '0936-387086', 'Q161917346', '男', null, '桃園市蘆竹區南福街5號', '凱基股份有限公司', '司機', '2021-11-11 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('22', 'ks-22', '劉志賢', null, '0987-002907', 'Q105924661', '男', null, '桃園市中壢區新中二街19號', '凱基股份有限公司', '司機', null, null, '無');
INSERT INTO `ks_employee` VALUES ('23', 'ks-23', '戴貴麟', null, '0955-587849', 'Q134448992', '男', null, '高雄市小港區義興街18號', '凱基股份有限公司', '司機', '2020-09-08 08:00:00', null, '無');
INSERT INTO `ks_employee` VALUES ('24', 'ks-24', '陳建伯', '藍寶', '0971-915302', 'K157692289', '男', null, '臺中市北屯區遼陽四街23號', '凱基股份有限公司', '司機', '2021-04-28 08:00:00', null, '無');

-- ----------------------------
-- Table structure for ks_expense
-- ----------------------------
DROP TABLE IF EXISTS `ks_expense`;
CREATE TABLE `ks_expense` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `expense_id` varchar(20) NOT NULL COMMENT '日常開支編號',
  `expense_date` datetime DEFAULT NULL COMMENT '日常開支日期',
  `expense_driver` varchar(10) NOT NULL DEFAULT '其他' COMMENT '機司名稱',
  `expense_license_plate_number` varchar(10) NOT NULL COMMENT '車牌',
  `expense_1` double(7,2) NOT NULL DEFAULT '0.00' COMMENT '土尾',
  `expense_2` double(7,2) NOT NULL DEFAULT '0.00' COMMENT '發泡',
  `expense_3` double(7,2) NOT NULL DEFAULT '0.00' COMMENT '洗車',
  `expense_other` double(7,2) NOT NULL DEFAULT '0.00' COMMENT '其他雜項',
  `expense_total` double(7,2) NOT NULL DEFAULT '0.00' COMMENT '日常開支總額',
  PRIMARY KEY (`id`),
  UNIQUE KEY `expense_id` (`expense_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ks_expense
-- ----------------------------
INSERT INTO `ks_expense` VALUES ('20', '22022401', '2022-02-24 00:00:00', '李政儒', 'KSC-0958', '3000.00', '1000.00', '600.00', '0.00', '4600.00');
INSERT INTO `ks_expense` VALUES ('21', '22030801', '2022-03-08 00:00:00', '黃智凱', 'KSC-0803', '3000.00', '1000.00', '600.00', '0.00', '4600.00');
INSERT INTO `ks_expense` VALUES ('22', '22030802', '2022-03-08 00:00:00', '黃智凱', 'KSC-0803', '2500.00', '1000.00', '0.00', '0.00', '3500.00');

-- ----------------------------
-- Table structure for ks_gonorth
-- ----------------------------
DROP TABLE IF EXISTS `ks_gonorth`;
CREATE TABLE `ks_gonorth` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `gonorth_id` varchar(20) NOT NULL COMMENT '北上單編號',
  `gonorth_date` datetime NOT NULL COMMENT '日期(北上單)',
  `gonorth_driver` varchar(5) NOT NULL COMMENT '司機名稱',
  `gonorth_license_plate_number` varchar(10) NOT NULL COMMENT '車牌號碼',
  `gonorth_company` varchar(20) NOT NULL DEFAULT '無' COMMENT '公司名稱',
  `gonorth_outset` varchar(20) NOT NULL DEFAULT '無' COMMENT '起點',
  `gonorth_yard` varchar(20) NOT NULL DEFAULT '無' COMMENT '堆場',
  `gonorth_cash` varchar(4) DEFAULT '否' COMMENT '現金',
  `gonorth_goods` varchar(10) DEFAULT NULL COMMENT '貨物名稱',
  `gonorth_goods_mt` double(4,2) NOT NULL DEFAULT '0.00' COMMENT '貨物噸數',
  `gonorth_goods_price_company` double(6,2) NOT NULL DEFAULT '0.00' COMMENT '公司單價',
  `gonorth_goods_price_driver` double(6,2) DEFAULT NULL COMMENT '司機單價',
  `gonorth_total` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '公司此趟運費',
  `gonorth_bill_total` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '扣發票金額',
  `gonorth_driver_pay` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '此趟薪資',
  PRIMARY KEY (`id`),
  UNIQUE KEY `downbound_id` (`gonorth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ks_gonorth
-- ----------------------------
INSERT INTO `ks_gonorth` VALUES ('1', '22021801', '2022-02-18 00:00:00', '黃智凱', 'KSC-0803', '台積電', '彰化', '新竹', '否', '石膏', '30.00', '700.00', '665.00', '21000.00', '19950.00', '4830.00');
INSERT INTO `ks_gonorth` VALUES ('2', '22021802', '2022-02-18 00:00:00', '李政儒', 'KSC-0805', '台積電', '彰化', '新竹', '否', '石膏', '28.00', '720.00', '684.00', '20160.00', '19152.00', '4636.80');
INSERT INTO `ks_gonorth` VALUES ('3', '22021901', '2022-02-19 00:00:00', '黃智凱', 'KSC-0803', '聯發科', '彰化', '新竹', '否', '土', '35.50', '850.00', '807.50', '30175.00', '28666.25', '6940.25');
INSERT INTO `ks_gonorth` VALUES ('4', '22021902', '2022-02-19 00:00:00', '李政儒', 'KSC-0805', '聯發科', '彰化', '新竹', '否', '土', '34.00', '820.00', '779.00', '27880.00', '26486.00', '6412.40');

-- ----------------------------
-- Table structure for ks_goods
-- ----------------------------
DROP TABLE IF EXISTS `ks_goods`;
CREATE TABLE `ks_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `goods_id` varchar(10) NOT NULL COMMENT '品項編號',
  `goods_name` varchar(10) DEFAULT NULL COMMENT '品項名稱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ks_goods
-- ----------------------------
INSERT INTO `ks_goods` VALUES ('1', 'goods-01', '土');
INSERT INTO `ks_goods` VALUES ('2', 'goods-02', '土餅');
INSERT INTO `ks_goods` VALUES ('3', 'goods-03', '煤');
INSERT INTO `ks_goods` VALUES ('4', 'goods-04', '砂');
INSERT INTO `ks_goods` VALUES ('5', 'goods-05', '石膏');
INSERT INTO `ks_goods` VALUES ('6', 'goods-06', '鐵');
INSERT INTO `ks_goods` VALUES ('7', 'goods-07', '爐石');
INSERT INTO `ks_goods` VALUES ('8', 'goods-08', '磚');
INSERT INTO `ks_goods` VALUES ('9', 'goods-09', '大石');
INSERT INTO `ks_goods` VALUES ('10', 'goods-10', '中石');
INSERT INTO `ks_goods` VALUES ('11', 'goods-11', '鉀鹽');

-- ----------------------------
-- Table structure for ks_oil_order
-- ----------------------------
DROP TABLE IF EXISTS `ks_oil_order`;
CREATE TABLE `ks_oil_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `oil_order_id` varchar(20) NOT NULL COMMENT '油單編號',
  `oid_date` datetime DEFAULT NULL COMMENT '加油日期',
  `oil_driver` varchar(10) NOT NULL DEFAULT '其他' COMMENT '機司名稱',
  `oil_license_plate_number` varchar(10) NOT NULL COMMENT '油加車牌',
  `oil_type` varchar(10) NOT NULL COMMENT '油的種類',
  `oil_price` double(4,2) NOT NULL DEFAULT '0.00' COMMENT '油的價格',
  `oil_liters` double(5,2) NOT NULL DEFAULT '0.00' COMMENT '加油公升',
  `oil_total` double(7,2) NOT NULL DEFAULT '0.00' COMMENT '油單總價格',
  `gas_station` varchar(20) DEFAULT '其他' COMMENT '加油站名稱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oil_order_id` (`oil_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ks_oil_order
-- ----------------------------
INSERT INTO `ks_oil_order` VALUES ('3', '22021801', '2022-02-18 00:00:00', '黃智凱', 'KSC-0803', '超級柴油', '50.00', '100.00', '5000.00', '台灣石油');
INSERT INTO `ks_oil_order` VALUES ('4', '22021802', '2022-02-18 00:00:00', '李政儒', 'KSC-0805', '超級柴油', '35.80', '120.00', '4296.00', '台灣石油');
INSERT INTO `ks_oil_order` VALUES ('5', '22021901', '2022-02-19 00:00:00', '黃智凱', 'KSC-0803', '超級柴油', '25.00', '110.00', '2750.00', '台塑石油');
INSERT INTO `ks_oil_order` VALUES ('6', '20222222', '2022-02-22 00:00:00', '黃智凱', 'KSC-0803', '95', '20.54', '20.50', '421.07', '建興加油站');
INSERT INTO `ks_oil_order` VALUES ('7', '20222212', '2022-02-22 00:00:00', '錢志杰', 'KSC-0805', '98', '20.00', '20.00', '400.00', '建興加油站');
INSERT INTO `ks_oil_order` VALUES ('8', '22255555', '2022-02-22 00:00:00', '錢志杰', 'KSC-0805', '92', '50.00', '500.00', '25000.00', '建興加油站');
INSERT INTO `ks_oil_order` VALUES ('9', '33333333', '2022-02-22 00:00:00', '李政儒', 'KSC-0805', '98', '50.00', '48.54', '2427.00', '建興加油站');
INSERT INTO `ks_oil_order` VALUES ('10', '44444444', '2022-02-22 00:00:00', '張政添', 'KSC-0832', '95', '24.50', '54.50', '1335.25', '建興加油站');
INSERT INTO `ks_oil_order` VALUES ('11', '25555555', '2022-02-22 00:00:00', '錢志杰', 'HHH-123', '95', '10.00', '10.00', '100.00', '建興加油站');
INSERT INTO `ks_oil_order` VALUES ('12', '2255252', '2022-02-22 00:00:00', 'EEW', '123-887', '95', '50.00', '50.00', '2500.00', 'GY');
INSERT INTO `ks_oil_order` VALUES ('13', '20777777', '2022-02-22 00:00:00', '錢志杰', 'KSC-0832', '95', '50.00', '50.00', '2500.00', '建興加油站');
INSERT INTO `ks_oil_order` VALUES ('14', '66666666', '2022-02-22 00:00:00', '鄰懂', 'AKA-778', '超級柴油', '50.00', '50.00', '2500.00', 'TW');
INSERT INTO `ks_oil_order` VALUES ('16', '22228888', '2022-02-22 00:00:00', '鄰懂', 'AKA-777', '超級柴油', '50.00', '100.00', '5000.00', '台灣石油');
INSERT INTO `ks_oil_order` VALUES ('17', '77777777', '2022-02-22 00:00:00', '路人甲', 'AZZ-877', '超級柴油', '50.00', '100.00', '5000.00', '其他');
INSERT INTO `ks_oil_order` VALUES ('18', '88888888', '2022-02-22 00:00:00', '連懿辛', 'KSC-0958', '超級柴油', '35.50', '112.50', '3993.75', '建興加油站');
INSERT INTO `ks_oil_order` VALUES ('19', '555555', '2022-02-22 00:00:00', '李政儒', 'KSC-0958', '超級柴油', '32.75', '101.55', '3325.76', '建興加油站');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Taipei');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Taipei');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Taipei');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017F127E5E9078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017F127E5E9078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017F127E5E9078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'work1647443511028', '1647446665582', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', null, '1647443520000', '-1', '5', 'PAUSED', 'CRON', '1647443511000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1647443520000', '-1', '5', 'PAUSED', 'CRON', '1647443511000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', null, '1647443520000', '-1', '5', 'PAUSED', 'CRON', '1647443511000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2022-02-19 22:59:06', 'admin', '2022-02-20 03:43:24', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-02-19 22:59:06', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-02-19 22:59:06', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'N', 'admin', '2022-02-19 22:59:06', 'admin', '2022-02-20 03:43:36', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-02-19 22:59:06', '', null, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-02-19 22:59:06', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '男', 'sys_user_sex', '', 'primary', 'Y', '0', 'admin', '2022-02-19 22:59:06', 'admin', '2022-02-20 03:45:05', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '女', 'sys_user_sex', '', 'warning', 'N', '0', 'admin', '2022-02-19 22:59:06', 'admin', '2022-02-20 03:45:10', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '未知', 'sys_user_sex', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', 'admin', '2022-02-20 03:45:30', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-02-19 22:59:06', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-02-19 22:59:06', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-02-19 22:59:06', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-02-19 22:59:06', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-02-19 22:59:06', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-02-19 22:59:06', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-02-19 22:59:06', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-02-19 22:59:06', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('100', '0', '是', '是', 'ks_cash', null, 'danger', 'N', '0', 'admin', '2022-02-22 23:10:50', 'admin', '2022-02-22 23:11:51', null);
INSERT INTO `sys_dict_data` VALUES ('101', '0', '否', '否', 'ks_cash', null, 'success', 'N', '0', 'admin', '2022-02-22 23:11:16', 'admin', '2022-02-22 23:11:59', null);
INSERT INTO `sys_dict_data` VALUES ('102', '102', '其他', '其他', 'ks_cash', null, 'primary', 'N', '0', 'admin', '2022-02-22 23:12:21', '', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-02-19 22:59:06', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-02-19 22:59:06', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-02-19 22:59:06', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-02-19 22:59:06', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-02-19 22:59:06', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-02-19 22:59:06', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-02-19 22:59:06', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-02-19 22:59:06', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-02-19 22:59:06', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-02-19 22:59:06', '', null, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('100', '是否收現金', 'ks_cash', '0', 'admin', '2022-02-22 23:10:21', '', null, '車趟是否收現金');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-02-19 22:59:06', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-19 23:43:39');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-20 00:35:35');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 00:35:42');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 00:44:09');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 00:44:22');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 00:44:44');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-20 01:25:22');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 01:25:26');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 02:02:18');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-20 02:27:55');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 02:27:57');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-20 02:28:06');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 02:28:13');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-20 03:42:34');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-20 03:42:37');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 03:42:39');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-20 04:19:49');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-20 04:19:55');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 04:19:58');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 04:25:40');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 05:17:00');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 16:34:10');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-20 17:07:26');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 05:27:15');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 07:04:00');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-21 22:57:44');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 00:41:23');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 02:16:15');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-22 03:56:11');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 03:56:18');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 05:39:04');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 06:40:24');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-22 08:16:18');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 08:16:26');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-22 18:33:39');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 19:14:11');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 19:15:36');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 22:34:46');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-22 23:06:21');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 02:46:02');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 05:01:18');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-23 07:01:05');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-24 03:44:48');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-24 06:58:07');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-24 09:12:19');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-24 10:19:55');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-25 08:58:48');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-02-25 09:11:22');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-25 09:11:23');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-25 09:11:25');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-25 19:27:45');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-26 06:32:03');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-26 08:20:53');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-26 08:20:55');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-26 09:10:02');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-26 09:49:38');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-26 11:44:16');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-26 23:59:34');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 04:04:07');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 08:16:16');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 09:06:33');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-27 11:17:28');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-02-28 09:19:11');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 09:19:14');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 09:30:21');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-02-28 09:42:03');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 07:21:23');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 10:26:44');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 11:25:23');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-01 12:11:20');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-01 12:11:24');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-03 09:09:29');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-03 09:32:31');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-03 15:04:18');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-03 16:44:11');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-03 19:04:48');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 10:30:34');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 11:15:33');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 13:53:05');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 14:40:06');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 14:49:26');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 14:49:28');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 14:58:07');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 14:58:09');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-04 15:19:00');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 15:19:01');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-04 17:02:45');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-05 08:44:09');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-05 10:13:16');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-05 15:36:16');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-06 15:20:37');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-06 20:09:57');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-06 20:47:24');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-08 14:49:10');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-08 17:58:41');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-08 18:41:31');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 13:46:08');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 20:44:23');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 22:09:40');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 19:38:29');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 21:49:11');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 22:31:19');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 15:46:37');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 18:08:14');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 21:57:27');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2058 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-02-19 22:59:06', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2022-02-19 22:59:06', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2022-02-19 22:59:06', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '4', 'http://ruoyi.vip', null, '', '0', '0', 'M', '0', '0', '', 'guide', 'admin', '2022-02-19 22:59:06', '', null, '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-02-19 22:59:06', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-02-19 22:59:06', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-02-19 22:59:06', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-02-19 22:59:06', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-02-19 22:59:06', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-02-19 22:59:06', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-02-19 22:59:06', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-02-19 22:59:06', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-02-19 22:59:06', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-02-19 22:59:06', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-02-19 22:59:06', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-02-19 22:59:06', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-02-19 22:59:06', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-02-19 22:59:06', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-02-19 22:59:06', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('115', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-02-19 22:59:06', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('116', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-02-19 22:59:06', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-02-19 22:59:06', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-02-19 22:59:06', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1001', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '7', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '115', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '115', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '115', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '115', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '凱基系統', '0', '0', 'kaisheng', null, null, '1', '0', 'M', '0', '0', null, 'dashboard', 'admin', '2022-02-19 23:50:09', '', null, '');
INSERT INTO `sys_menu` VALUES ('2001', '員工表單', '2000', '1', 'employee', 'ks/employee/index', null, '1', '0', 'C', '0', '0', 'ks:employee:list', '#', 'admin', '2022-02-19 23:52:14', '', null, '員工表單菜单');
INSERT INTO `sys_menu` VALUES ('2002', '員工表單查询', '2001', '1', '#', '', null, '1', '0', 'F', '0', '0', 'ks:employee:query', '#', 'admin', '2022-02-19 23:52:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '員工表單新增', '2001', '2', '#', '', null, '1', '0', 'F', '0', '0', 'ks:employee:add', '#', 'admin', '2022-02-19 23:52:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '員工表單修改', '2001', '3', '#', '', null, '1', '0', 'F', '0', '0', 'ks:employee:edit', '#', 'admin', '2022-02-19 23:52:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '員工表單删除', '2001', '4', '#', '', null, '1', '0', 'F', '0', '0', 'ks:employee:remove', '#', 'admin', '2022-02-19 23:52:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '員工表單导出', '2001', '5', '#', '', null, '1', '0', 'F', '0', '0', 'ks:employee:export', '#', 'admin', '2022-02-19 23:52:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2007', '加油表單', '2000', '1', 'order', 'ks/order/index', null, '1', '0', 'C', '0', '0', 'ks:order:list', '#', 'admin', '2022-02-20 03:51:45', '', null, '加油表單菜单');
INSERT INTO `sys_menu` VALUES ('2008', '加油表單查询', '2007', '1', '#', '', null, '1', '0', 'F', '0', '0', 'ks:order:query', '#', 'admin', '2022-02-20 03:51:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('2009', '加油表單新增', '2007', '2', '#', '', null, '1', '0', 'F', '0', '0', 'ks:order:add', '#', 'admin', '2022-02-20 03:51:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('2010', '加油表單修改', '2007', '3', '#', '', null, '1', '0', 'F', '0', '0', 'ks:order:edit', '#', 'admin', '2022-02-20 03:51:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('2011', '加油表單删除', '2007', '4', '#', '', null, '1', '0', 'F', '0', '0', 'ks:order:remove', '#', 'admin', '2022-02-20 03:51:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '加油表單导出', '2007', '5', '#', '', null, '1', '0', 'F', '0', '0', 'ks:order:export', '#', 'admin', '2022-02-20 03:51:45', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '車輛表單', '2000', '1', 'car', 'ks/car/index', null, '1', '0', 'C', '0', '0', 'ks:car:list', '#', 'admin', '2022-02-20 16:38:02', '', null, '車輛表單菜单');
INSERT INTO `sys_menu` VALUES ('2014', '車輛表單查询', '2013', '1', '#', '', null, '1', '0', 'F', '0', '0', 'ks:car:query', '#', 'admin', '2022-02-20 16:38:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '車輛表單新增', '2013', '2', '#', '', null, '1', '0', 'F', '0', '0', 'ks:car:add', '#', 'admin', '2022-02-20 16:38:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '車輛表單修改', '2013', '3', '#', '', null, '1', '0', 'F', '0', '0', 'ks:car:edit', '#', 'admin', '2022-02-20 16:38:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '車輛表單删除', '2013', '4', '#', '', null, '1', '0', 'F', '0', '0', 'ks:car:remove', '#', 'admin', '2022-02-20 16:38:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '車輛表單导出', '2013', '5', '#', '', null, '1', '0', 'F', '0', '0', 'ks:car:export', '#', 'admin', '2022-02-20 16:38:02', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '南下表單', '2000', '1', 'downbound', 'ks/downbound/index', null, '1', '0', 'C', '0', '0', 'ks:downbound:list', '#', 'admin', '2022-02-20 16:38:13', '', null, '南下表單菜单');
INSERT INTO `sys_menu` VALUES ('2020', '南下表單查询', '2019', '1', '#', '', null, '1', '0', 'F', '0', '0', 'ks:downbound:query', '#', 'admin', '2022-02-20 16:38:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '南下表單新增', '2019', '2', '#', '', null, '1', '0', 'F', '0', '0', 'ks:downbound:add', '#', 'admin', '2022-02-20 16:38:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '南下表單修改', '2019', '3', '#', '', null, '1', '0', 'F', '0', '0', 'ks:downbound:edit', '#', 'admin', '2022-02-20 16:38:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '南下表單删除', '2019', '4', '#', '', null, '1', '0', 'F', '0', '0', 'ks:downbound:remove', '#', 'admin', '2022-02-20 16:38:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '南下表單导出', '2019', '5', '#', '', null, '1', '0', 'F', '0', '0', 'ks:downbound:export', '#', 'admin', '2022-02-20 16:38:13', '', null, '');
INSERT INTO `sys_menu` VALUES ('2025', '北上表單', '2000', '1', 'gonorth', 'ks/gonorth/index', null, '1', '0', 'C', '0', '0', 'ks:gonorth:list', '#', 'admin', '2022-02-20 16:38:23', '', null, '北上表單菜单');
INSERT INTO `sys_menu` VALUES ('2026', '北上表單查询', '2025', '1', '#', '', null, '1', '0', 'F', '0', '0', 'ks:gonorth:query', '#', 'admin', '2022-02-20 16:38:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2027', '北上表單新增', '2025', '2', '#', '', null, '1', '0', 'F', '0', '0', 'ks:gonorth:add', '#', 'admin', '2022-02-20 16:38:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2028', '北上表單修改', '2025', '3', '#', '', null, '1', '0', 'F', '0', '0', 'ks:gonorth:edit', '#', 'admin', '2022-02-20 16:38:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2029', '北上表單删除', '2025', '4', '#', '', null, '1', '0', 'F', '0', '0', 'ks:gonorth:remove', '#', 'admin', '2022-02-20 16:38:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2030', '北上表單导出', '2025', '5', '#', '', null, '1', '0', 'F', '0', '0', 'ks:gonorth:export', '#', 'admin', '2022-02-20 16:38:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2031', '貨物表單', '2000', '1', 'goods', 'ks/goods/index', null, '1', '0', 'C', '0', '0', 'ks:goods:list', '#', 'admin', '2022-02-20 16:38:34', '', null, '貨物表單菜单');
INSERT INTO `sys_menu` VALUES ('2032', '貨物表單查询', '2031', '1', '#', '', null, '1', '0', 'F', '0', '0', 'ks:goods:query', '#', 'admin', '2022-02-20 16:38:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2033', '貨物表單新增', '2031', '2', '#', '', null, '1', '0', 'F', '0', '0', 'ks:goods:add', '#', 'admin', '2022-02-20 16:38:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2034', '貨物表單修改', '2031', '3', '#', '', null, '1', '0', 'F', '0', '0', 'ks:goods:edit', '#', 'admin', '2022-02-20 16:38:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2035', '貨物表單删除', '2031', '4', '#', '', null, '1', '0', 'F', '0', '0', 'ks:goods:remove', '#', 'admin', '2022-02-20 16:38:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2036', '貨物表單导出', '2031', '5', '#', '', null, '1', '0', 'F', '0', '0', 'ks:goods:export', '#', 'admin', '2022-02-20 16:38:35', '', null, '');
INSERT INTO `sys_menu` VALUES ('2037', '員工薪資報表', '2000', '99', 'report', 'ks/report/index', null, '1', '0', 'C', '0', '0', '', 'money', 'admin', '2022-02-20 13:17:13', 'admin', '2022-02-21 05:32:12', '');
INSERT INTO `sys_menu` VALUES ('2038', '員工薪資2', '2000', '100', 'report2', 'ks/report2/index', null, '1', '0', 'C', '0', '0', '', 'chart', 'admin', '2022-02-23 00:32:18', 'admin', '2022-02-23 00:33:11', '');
INSERT INTO `sys_menu` VALUES ('2039', '日常開支表單', '2000', '1', 'expense', 'ks/expense/index', null, '1', '0', 'C', '0', '0', 'ks:expense:list', '#', 'admin', '2022-02-24 07:26:41', '', null, '日常開支表單菜单');
INSERT INTO `sys_menu` VALUES ('2040', '日常開支表單查询', '2039', '1', '#', '', null, '1', '0', 'F', '0', '0', 'ks:expense:query', '#', 'admin', '2022-02-24 07:26:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2041', '日常開支表單新增', '2039', '2', '#', '', null, '1', '0', 'F', '0', '0', 'ks:expense:add', '#', 'admin', '2022-02-24 07:26:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2042', '日常開支表單修改', '2039', '3', '#', '', null, '1', '0', 'F', '0', '0', 'ks:expense:edit', '#', 'admin', '2022-02-24 07:26:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2043', '日常開支表單删除', '2039', '4', '#', '', null, '1', '0', 'F', '0', '0', 'ks:expense:remove', '#', 'admin', '2022-02-24 07:26:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2044', '日常開支表單导出', '2039', '5', '#', '', null, '1', '0', 'F', '0', '0', 'ks:expense:export', '#', 'admin', '2022-02-24 07:26:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2045', '報表', '2000', '9999', 'dateReport', 'ks/report/dateReport', null, '1', '0', 'C', '0', '0', '', '#', 'admin', '2022-02-27 09:15:38', 'admin', '2022-03-03 16:49:26', '');
INSERT INTO `sys_menu` VALUES ('2052', '客戶公司表單', '2000', '1', 'client', 'ks/client/index', null, '1', '0', 'C', '0', '0', 'ks:client:list', '#', 'admin', '2022-03-03 17:21:42', '', null, '客戶公司表單菜单');
INSERT INTO `sys_menu` VALUES ('2053', '客戶公司表單查询', '2052', '1', '#', '', null, '1', '0', 'F', '0', '0', 'ks:client:query', '#', 'admin', '2022-03-03 17:21:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2054', '客戶公司表單新增', '2052', '2', '#', '', null, '1', '0', 'F', '0', '0', 'ks:client:add', '#', 'admin', '2022-03-03 17:21:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2055', '客戶公司表單修改', '2052', '3', '#', '', null, '1', '0', 'F', '0', '0', 'ks:client:edit', '#', 'admin', '2022-03-03 17:21:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2056', '客戶公司表單删除', '2052', '4', '#', '', null, '1', '0', 'F', '0', '0', 'ks:client:remove', '#', 'admin', '2022-03-03 17:21:42', '', null, '');
INSERT INTO `sys_menu` VALUES ('2057', '客戶公司表單导出', '2052', '5', '#', '', null, '1', '0', 'F', '0', '0', 'ks:client:export', '#', 'admin', '2022-03-03 17:21:42', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-02-19 22:59:06', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-02-19 22:59:06', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ks_employee', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-19 23:47:42');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":0,\"menuName\":\"凱基系統\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"kaisheng\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-19 23:50:09');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645285662000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"EmployeeId\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"employeeId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"員工編號\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645285662000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"employee_id\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"員工姓名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645285662000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Aka\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"aka\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"綽號\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"crea', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-19 23:51:47');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-19 23:51:52');
INSERT INTO `sys_oper_log` VALUES ('104', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"主框架页-默认皮肤样式名称\",\"configKey\":\"sys.index.skinName\",\"createBy\":\"admin\",\"createTime\":1645282746000,\"updateBy\":\"admin\",\"configId\":1,\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"configType\":\"Y\",\"configValue\":\"skin-green\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:43:24');
INSERT INTO `sys_oper_log` VALUES ('105', '参数管理', '2', 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', '1', 'admin', null, '/system/config', '127.0.0.1', '内网IP', '{\"configName\":\"账号自助-验证码开关\",\"configKey\":\"sys.account.captchaOnOff\",\"createBy\":\"admin\",\"createTime\":1645282746000,\"updateBy\":\"admin\",\"configId\":4,\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"configType\":\"N\",\"configValue\":\"true\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:43:36');
INSERT INTO `sys_oper_log` VALUES ('106', '参数管理', '9', 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', '1', 'admin', null, '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:43:45');
INSERT INTO `sys_oper_log` VALUES ('107', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"primary\",\"dictSort\":1,\"remark\":\"性别男\",\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"男\",\"createBy\":\"admin\",\"default\":true,\"isDefault\":\"Y\",\"cssClass\":\"\",\"createTime\":1645282746000,\"dictCode\":1,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:44:33');
INSERT INTO `sys_oper_log` VALUES ('108', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"success\",\"dictSort\":1,\"remark\":\"性别男\",\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"男\",\"createBy\":\"admin\",\"default\":true,\"isDefault\":\"Y\",\"cssClass\":\"\",\"createTime\":1645282746000,\"dictCode\":1,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:44:38');
INSERT INTO `sys_oper_log` VALUES ('109', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"primary\",\"dictSort\":1,\"remark\":\"性别男\",\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"男\",\"createBy\":\"admin\",\"default\":true,\"isDefault\":\"Y\",\"cssClass\":\"\",\"createTime\":1645282746000,\"dictCode\":1,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:44:43');
INSERT INTO `sys_oper_log` VALUES ('110', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"info\",\"dictSort\":2,\"remark\":\"性别女\",\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"女\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"\",\"createTime\":1645282746000,\"dictCode\":2,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:44:48');
INSERT INTO `sys_oper_log` VALUES ('111', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"warning\",\"dictSort\":2,\"remark\":\"性别女\",\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"女\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"\",\"createTime\":1645282746000,\"dictCode\":2,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:44:52');
INSERT INTO `sys_oper_log` VALUES ('112', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"男\",\"listClass\":\"primary\",\"dictSort\":1,\"remark\":\"性别男\",\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"男\",\"createBy\":\"admin\",\"default\":true,\"isDefault\":\"Y\",\"cssClass\":\"\",\"createTime\":1645282746000,\"dictCode\":1,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:45:05');
INSERT INTO `sys_oper_log` VALUES ('113', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"女\",\"listClass\":\"warning\",\"dictSort\":2,\"remark\":\"性别女\",\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"女\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"\",\"createTime\":1645282746000,\"dictCode\":2,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:45:10');
INSERT INTO `sys_oper_log` VALUES ('114', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"未知\",\"listClass\":\"\",\"dictSort\":3,\"remark\":\"性别未知\",\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"未知\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"\",\"createTime\":1645282746000,\"dictCode\":3,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:45:24');
INSERT INTO `sys_oper_log` VALUES ('115', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"未知\",\"listClass\":\"danger\",\"dictSort\":3,\"remark\":\"性别未知\",\"params\":{},\"dictType\":\"sys_user_sex\",\"dictLabel\":\"未知\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"\",\"createTime\":1645282746000,\"dictCode\":3,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:45:30');
INSERT INTO `sys_oper_log` VALUES ('116', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ks_oil_order', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:50:28');
INSERT INTO `sys_oper_log` VALUES ('117', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645300227000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"OilOrderId\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"oilOrderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"油單編號\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645300228000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"oil_order_id\"},{\"capJavaField\":\"OidDate\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"oidDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"加油日期\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645300228000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"oid_date\"},{\"capJavaField\":\"OilDriver\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"oilDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"機司名稱\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:51:04');
INSERT INTO `sys_oper_log` VALUES ('118', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"updateTime\":1645300264000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645300227000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"OilOrderId\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"oilOrderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"油單編號\",\"isQuery\":\"1\",\"updateTime\":1645300264000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645300228000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"oil_order_id\"},{\"capJavaField\":\"OidDate\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"oidDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"加油日期\",\"isQuery\":\"1\",\"updateTime\":1645300264000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645300228000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"oid_date\"},{\"capJavaField\":\"OilDriver\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"oilDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"機司名稱\",\"isQuery\":\"1\",\"updateTime\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 03:51:18');
INSERT INTO `sys_oper_log` VALUES ('119', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-20 03:51:24');
INSERT INTO `sys_oper_log` VALUES ('120', '加油表單', '5', 'com.ruoyi.kaisheng.controller.KsOilOrderController.export()', 'POST', '1', 'admin', null, '/ks/order/export', '127.0.0.1', '内网IP', '{\"params\":{}}', null, '0', null, '2022-02-20 03:56:17');
INSERT INTO `sys_oper_log` VALUES ('121', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ks_gonorth,ks_goods,ks_downbound,ks_car', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 16:34:28');
INSERT INTO `sys_oper_log` VALUES ('122', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":25,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645346068000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"LicensePlateNumber\",\"usableColumn\":false,\"columnId\":26,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"licensePlateNumber\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"車牌\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"license_plate_number\"},{\"capJavaField\":\"CarIdle\",\"usableColumn\":false,\"columnId\":27,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carIdle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"車輛狀況\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"car_idle\"},{\"capJavaField\":\"CarPurchaseDate\",\"usableColumn\":false,\"columnId\":28,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"carPurchaseDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"購車日期\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"q', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 16:35:10');
INSERT INTO `sys_oper_log` VALUES ('123', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":33,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645346068000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"DownboundId\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"downboundId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"南下單編號\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"downbound_id\"},{\"capJavaField\":\"DownboundDate\",\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"downboundDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日期(南下單)\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"downbound_date\"},{\"capJavaField\":\"DownboundDriver\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"downboundDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"司機名稱\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaTyp', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 16:35:44');
INSERT INTO `sys_oper_log` VALUES ('124', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645346068000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"GonorthId\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gonorthId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"北上單編號\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"gonorth_id\"},{\"capJavaField\":\"GonorthDate\",\"usableColumn\":false,\"columnId\":49,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gonorthDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日期(北上單)\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"gonorth_date\"},{\"capJavaField\":\"GonorthDriver\",\"usableColumn\":false,\"columnId\":50,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gonorthDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"司機名稱\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"que', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 16:36:16');
INSERT INTO `sys_oper_log` VALUES ('125', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":63,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645346068000,\"tableId\":6,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"GoodsId\",\"usableColumn\":false,\"columnId\":64,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"goodsId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"品項編號\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"goods_id\"},{\"capJavaField\":\"GoodsName\",\"usableColumn\":false,\"columnId\":65,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"goodsName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"品項名稱\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"goods_name\"}],\"businessName\":\"goods\",\"moduleName\":\"ks\",\"className\":\"KsGoods\",\"tableName\":\"ks_goods\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":2000}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.kaisheng\",\"functionName\":\"貨物表單\",\"tree\":false,\"tableComment\":\"貨物資訊\",\"params\":{\"parentMenuId\":2000},\"tplCategory\":\"crud\",\"parentMenuId\":\"2000\",\"tableId\":6,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-20 16:36:44');
INSERT INTO `sys_oper_log` VALUES ('126', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-20 16:37:43');
INSERT INTO `sys_oper_log` VALUES ('127', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-20 16:37:45');
INSERT INTO `sys_oper_log` VALUES ('128', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-20 16:37:46');
INSERT INTO `sys_oper_log` VALUES ('129', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-20 16:37:47');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"money\",\"orderNum\":99,\"menuName\":\"員工薪資報表\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"report\",\"component\":\"ks/report/index\",\"children\":[],\"createTime\":1645334233000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2037,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-21 05:32:12');
INSERT INTO `sys_oper_log` VALUES ('131', '加油表單', '2', 'com.ruoyi.kaisheng.controller.KsOilOrderController.edit()', 'PUT', '1', 'admin', null, '/ks/order', '127.0.0.1', '内网IP', '{\"oilTotal\":2500,\"params\":{},\"oilPrice\":25,\"oilDriver\":\"黃智凱\",\"oilLicensePlateNumber\":\"KSC-0803\",\"oilType\":\"超級柴油\",\"oilLiters\":100,\"oilOrderId\":\"22021802\",\"oidDate\":1645113600000,\"id\":3,\"gasStation\":\"台灣石油\"}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'22021802\' for key \'oil_order_id\'\r\n### The error may exist in file [C:\\Users\\Faker\\git\\RuoYi-Vue\\ruoyi-kaisheng\\target\\classes\\mapper\\ks\\KsOilOrderMapper.xml]\r\n### The error may involve com.ruoyi.kaisheng.mapper.KsOilOrderMapper.updateKsOilOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update ks_oil_order    SET oil_order_id = ?,    oid_date = ?,    oil_driver = ?,    oil_license_plate_number = ?,    oil_type = ?,    oil_price = ?,    oil_liters = ?,    oil_total = ?,    gas_station = ?    where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'22021802\' for key \'oil_order_id\'\n; Duplicate entry \'22021802\' for key \'oil_order_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'22021802\' for key \'oil_order_id\'', '2022-02-22 00:42:06');
INSERT INTO `sys_oper_log` VALUES ('132', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"updateTime\":1645300278000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645300227000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"OilOrderId\",\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"oilOrderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"油單編號\",\"isQuery\":\"1\",\"updateTime\":1645300278000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645300228000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"oil_order_id\"},{\"capJavaField\":\"OidDate\",\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"oidDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"加油日期\",\"isQuery\":\"1\",\"updateTime\":1645300278000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645300228000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"oid_date\"},{\"capJavaField\":\"OilDriver\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"oilDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"機司名稱\",\"isQuery\":\"1\",\"updateTime\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 08:05:36');
INSERT INTO `sys_oper_log` VALUES ('133', '加油表單', '2', 'com.ruoyi.kaisheng.controller.KsOilOrderController.edit()', 'PUT', '1', 'admin', null, '/ks/order', '127.0.0.1', '内网IP', '{\"oilTotal\":5000.00,\"params\":{},\"oilPrice\":50,\"oilDriver\":\"黃智凱\",\"oilLicensePlateNumber\":\"KSC-0803\",\"oilType\":\"超級柴油\",\"oilLiters\":100,\"oilOrderId\":\"22021801\",\"oidDate\":1645113600000,\"id\":3,\"gasStation\":\"台灣石油\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 08:23:40');
INSERT INTO `sys_oper_log` VALUES ('134', '加油表單', '2', 'com.ruoyi.kaisheng.controller.KsOilOrderController.edit()', 'PUT', '1', 'admin', null, '/ks/order', '127.0.0.1', '内网IP', '{\"oilTotal\":4296.00,\"params\":{},\"oilPrice\":35.8,\"oilDriver\":\"李政儒\",\"oilLicensePlateNumber\":\"KSC-0805\",\"oilType\":\"超級柴油\",\"oilLiters\":120,\"oilOrderId\":\"22021802\",\"oidDate\":1645113600000,\"id\":4,\"gasStation\":\"台灣石油\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 08:23:55');
INSERT INTO `sys_oper_log` VALUES ('135', '南下表單', '1', 'com.ruoyi.kaisheng.controller.KsDownboundController.add()', 'POST', '1', 'admin', null, '/ks/downbound', '127.0.0.1', '内网IP', '{\"downboundGoodsMt\":100,\"downboundTotal\":5000,\"params\":{},\"downboundGoodsPrice\":50,\"downboundDriverPay\":1150,\"downboundLicensePlateNumber\":\"AKA-878\",\"downboundGoods\":\"泥土\",\"downboundYard\":\"雲林\",\"downboundCash\":\"50\",\"downboundId\":\"22022201\",\"downboundCompany\":\"楓林\",\"downboundDate\":1645459200000,\"downboundDriver\":\"凱凱凱\",\"downboundOutset\":\"高雄\"}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1\r\n### The error may exist in file [C:\\Users\\Faker\\git\\ks-ruoyi\\ruoyi-kaisheng\\target\\classes\\mapper\\ks\\KsDownboundMapper.xml]\r\n### The error may involve com.ruoyi.kaisheng.mapper.KsDownboundMapper.insertKsDownbound-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ks_downbound          ( downbound_id,             downbound_date,             downbound_driver,             downbound_license_plate_number,             downbound_company,             downbound_outset,             downbound_yard,             downbound_cash,             downbound_goods,             downbound_goods_mt,             downbound_goods_price,             downbound_total,             downbound_driver_pay )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1\n; Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1', '2022-02-22 08:55:01');
INSERT INTO `sys_oper_log` VALUES ('136', '南下表單', '1', 'com.ruoyi.kaisheng.controller.KsDownboundController.add()', 'POST', '1', 'admin', null, '/ks/downbound', '127.0.0.1', '内网IP', '{\"downboundGoodsMt\":100,\"downboundTotal\":5000,\"params\":{},\"downboundGoodsPrice\":50,\"downboundDriverPay\":1150,\"downboundLicensePlateNumber\":\"AKA-878\",\"downboundGoods\":\"泥土\",\"downboundYard\":\"雲林\",\"downboundCash\":\"10\",\"downboundId\":\"22022201\",\"downboundCompany\":\"楓林\",\"downboundDate\":1645459200000,\"downboundDriver\":\"凱凱凱\",\"downboundOutset\":\"高雄\"}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1\r\n### The error may exist in file [C:\\Users\\Faker\\git\\ks-ruoyi\\ruoyi-kaisheng\\target\\classes\\mapper\\ks\\KsDownboundMapper.xml]\r\n### The error may involve com.ruoyi.kaisheng.mapper.KsDownboundMapper.insertKsDownbound-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ks_downbound          ( downbound_id,             downbound_date,             downbound_driver,             downbound_license_plate_number,             downbound_company,             downbound_outset,             downbound_yard,             downbound_cash,             downbound_goods,             downbound_goods_mt,             downbound_goods_price,             downbound_total,             downbound_driver_pay )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1\n; Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1', '2022-02-22 08:55:11');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":33,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"updateTime\":1645346144000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645346068000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"DownboundId\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"downboundId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"南下單編號\",\"isQuery\":\"1\",\"updateTime\":1645346144000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"downbound_id\"},{\"capJavaField\":\"DownboundDate\",\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"downboundDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日期(南下單)\",\"isQuery\":\"1\",\"updateTime\":1645346144000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"downbound_date\"},{\"capJavaField\":\"DownboundDriver\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"downboundDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":tr', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 09:07:07');
INSERT INTO `sys_oper_log` VALUES ('138', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"updateTime\":1645346176000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645346068000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"GonorthId\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gonorthId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"北上單編號\",\"isQuery\":\"1\",\"updateTime\":1645346176000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"gonorth_id\"},{\"capJavaField\":\"GonorthDate\",\"usableColumn\":false,\"columnId\":49,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gonorthDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日期(北上單)\",\"isQuery\":\"1\",\"updateTime\":1645346176000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"gonorth_date\"},{\"capJavaField\":\"GonorthDriver\",\"usableColumn\":false,\"columnId\":50,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gonorthDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnCommen', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 09:07:22');
INSERT INTO `sys_oper_log` VALUES ('139', '南下表單', '1', 'com.ruoyi.kaisheng.controller.KsDownboundController.add()', 'POST', '1', 'admin', null, '/ks/downbound', '127.0.0.1', '内网IP', '{\"downboundGoodsMt\":50,\"downboundTotal\":5000,\"params\":{},\"downboundGoodsPrice\":100,\"downboundDriverPay\":1150,\"downboundLicensePlateNumber\":\"AKA-878\",\"downboundGoods\":\"土石\",\"downboundYard\":\"新竹\",\"downboundCash\":\"否\",\"downboundId\":\"22022201\",\"downboundCompany\":\"凱基\",\"id\":5,\"downboundDate\":1645459200000,\"downboundDriver\":\"與智波\",\"downboundOutset\":\"高雄\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 09:08:43');
INSERT INTO `sys_oper_log` VALUES ('140', '南下表單', '1', 'com.ruoyi.kaisheng.controller.KsDownboundController.add()', 'POST', '1', 'admin', null, '/ks/downbound', '127.0.0.1', '内网IP', '{\"downboundGoodsMt\":50,\"downboundTotal\":5000,\"params\":{},\"downboundGoodsPrice\":100,\"downboundDriverPay\":1150,\"downboundLicensePlateNumber\":\"AKA-777\",\"downboundGoods\":\"石膏\",\"downboundYard\":\"雲林\",\"downboundCash\":\"否\",\"downboundId\":\"22022202\",\"downboundCompany\":\"鴻海\",\"id\":6,\"downboundDate\":1645459200000,\"downboundDriver\":\"小妹妹\",\"downboundOutset\":\"高雄\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 09:13:45');
INSERT INTO `sys_oper_log` VALUES ('141', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-22 09:19:31');
INSERT INTO `sys_oper_log` VALUES ('142', '加油表單', '1', 'com.ruoyi.kaisheng.controller.KsOilOrderController.add()', 'POST', '1', 'admin', null, '/ks/order', '127.0.0.1', '内网IP', '{\"oilTotal\":2500,\"params\":{},\"oilPrice\":50,\"oilDriver\":\"鄰懂\",\"oilLicensePlateNumber\":\"AKA-778\",\"oilType\":\"超級柴油\",\"oilLiters\":50,\"oilOrderId\":\"66666666\",\"oidDate\":1645459200000,\"id\":14,\"gasStation\":\"TW\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 09:23:42');
INSERT INTO `sys_oper_log` VALUES ('143', '加油表單', '1', 'com.ruoyi.kaisheng.controller.KsOilOrderController.add()', 'POST', '1', 'admin', null, '/ks/order', '127.0.0.1', '内网IP', '{\"oilTotal\":5000,\"params\":{},\"oilPrice\":50,\"oilDriver\":\"鄰懂\",\"oilLicensePlateNumber\":\"AKA-777\",\"oilType\":\"超級柴油\",\"oilLiters\":100,\"oilOrderId\":\"22228888\",\"oidDate\":1645459200000,\"id\":16,\"gasStation\":\"台灣石油\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 09:34:38');
INSERT INTO `sys_oper_log` VALUES ('144', '加油表單', '1', 'com.ruoyi.kaisheng.controller.KsOilOrderController.add()', 'POST', '1', 'admin', null, '/ks/order', '127.0.0.1', '内网IP', '{\"oilTotal\":5000,\"params\":{},\"oilPrice\":50,\"oilDriver\":\"路人甲\",\"oilLicensePlateNumber\":\"AZZ-877\",\"oilType\":\"超級柴油\",\"oilLiters\":100,\"oilOrderId\":\"77777777\",\"oidDate\":1645459200000,\"id\":17,\"gasStation\":\"其他\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 09:41:38');
INSERT INTO `sys_oper_log` VALUES ('145', '加油表單', '1', 'com.ruoyi.kaisheng.controller.KsOilOrderController.add()', 'POST', '1', 'admin', null, '/ks/order', '127.0.0.1', '内网IP', '{\"oilTotal\":3993.75,\"params\":{},\"oilPrice\":35.5,\"oilDriver\":\"連懿辛\",\"oilLicensePlateNumber\":\"KSC-0958\",\"oilType\":\"超級柴油\",\"oilLiters\":112.5,\"oilOrderId\":\"88888888\",\"oidDate\":1645459200000,\"id\":18,\"gasStation\":\"建興加油站\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 09:44:37');
INSERT INTO `sys_oper_log` VALUES ('146', '加油表單', '1', 'com.ruoyi.kaisheng.controller.KsOilOrderController.add()', 'POST', '1', 'admin', null, '/ks/order', '127.0.0.1', '内网IP', '{\"oilTotal\":3325.76,\"params\":{},\"oilPrice\":32.75,\"oilDriver\":\"李政儒\",\"oilLicensePlateNumber\":\"KSC-0958\",\"oilType\":\"超級柴油\",\"oilLiters\":101.55,\"oilOrderId\":\"555555\",\"oidDate\":1645459200000,\"id\":19,\"gasStation\":\"建興加油站\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 09:50:54');
INSERT INTO `sys_oper_log` VALUES ('147', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', '1', 'admin', null, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"是否收現金\",\"remark\":\"車趟是否收現金\",\"params\":{},\"dictType\":\"ks_cash\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:10:21');
INSERT INTO `sys_oper_log` VALUES ('148', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"true\",\"listClass\":\"warning\",\"dictSort\":0,\"params\":{},\"dictType\":\"ks_cash\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:10:50');
INSERT INTO `sys_oper_log` VALUES ('149', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"true\",\"listClass\":\"danger\",\"dictSort\":0,\"params\":{},\"dictType\":\"ks_cash\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1645542650000,\"dictCode\":100,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:10:55');
INSERT INTO `sys_oper_log` VALUES ('150', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"false\",\"listClass\":\"primary\",\"dictSort\":0,\"params\":{},\"dictType\":\"ks_cash\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:11:16');
INSERT INTO `sys_oper_log` VALUES ('151', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"false\",\"listClass\":\"default\",\"dictSort\":0,\"params\":{},\"dictType\":\"ks_cash\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1645542676000,\"dictCode\":101,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:11:24');
INSERT INTO `sys_oper_log` VALUES ('152', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"false\",\"listClass\":\"info\",\"dictSort\":0,\"params\":{},\"dictType\":\"ks_cash\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1645542676000,\"dictCode\":101,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:11:29');
INSERT INTO `sys_oper_log` VALUES ('153', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"false\",\"listClass\":\"success\",\"dictSort\":0,\"params\":{},\"dictType\":\"ks_cash\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1645542676000,\"dictCode\":101,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:11:34');
INSERT INTO `sys_oper_log` VALUES ('154', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"是\",\"listClass\":\"danger\",\"dictSort\":0,\"params\":{},\"dictType\":\"ks_cash\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1645542650000,\"dictCode\":100,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:11:51');
INSERT INTO `sys_oper_log` VALUES ('155', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"否\",\"listClass\":\"success\",\"dictSort\":0,\"params\":{},\"dictType\":\"ks_cash\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1645542676000,\"dictCode\":101,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:11:59');
INSERT INTO `sys_oper_log` VALUES ('156', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', '1', 'admin', null, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"其他\",\"listClass\":\"primary\",\"dictSort\":102,\"params\":{},\"dictType\":\"ks_cash\",\"dictLabel\":\"其他\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:12:21');
INSERT INTO `sys_oper_log` VALUES ('157', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/ks_downbound', '127.0.0.1', '内网IP', '{tableName=ks_downbound}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:12:38');
INSERT INTO `sys_oper_log` VALUES ('158', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/ks_gonorth', '127.0.0.1', '内网IP', '{tableName=ks_gonorth}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:12:40');
INSERT INTO `sys_oper_log` VALUES ('159', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":33,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"updateTime\":1645542758000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645346068000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"DownboundId\",\"usableColumn\":false,\"columnId\":34,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"downboundId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"南下單編號\",\"isQuery\":\"1\",\"updateTime\":1645542758000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"downbound_id\"},{\"capJavaField\":\"DownboundDate\",\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"downboundDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日期(南下單)\",\"isQuery\":\"1\",\"updateTime\":1645542758000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"downbound_date\"},{\"capJavaField\":\"DownboundDriver\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"downboundDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"司機名稱\",\"isQuery\":\"1\",\"updateTime\":1645542758000,\"so', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:13:21');
INSERT INTO `sys_oper_log` VALUES ('160', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":47,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"updateTime\":1645542760000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645346068000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"GonorthId\",\"usableColumn\":false,\"columnId\":48,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gonorthId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"北上單編號\",\"isQuery\":\"1\",\"updateTime\":1645542760000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"gonorth_id\"},{\"capJavaField\":\"GonorthDate\",\"usableColumn\":false,\"columnId\":49,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gonorthDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日期(北上單)\",\"isQuery\":\"1\",\"updateTime\":1645542760000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645346068000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"gonorth_date\"},{\"capJavaField\":\"GonorthDriver\",\"usableColumn\":false,\"columnId\":50,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gonorthDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"司機名稱\",\"isQuery\":\"1\",\"updateTime\":1645542760000,\"sort\":4,\"list\":tru', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-22 23:13:40');
INSERT INTO `sys_oper_log` VALUES ('161', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-22 23:13:45');
INSERT INTO `sys_oper_log` VALUES ('162', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-22 23:13:46');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":100,\"menuName\":\"員工薪資2\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"ks/\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-23 00:32:18');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":100,\"menuName\":\"員工薪資2\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"ks/report2/index\",\"children\":[],\"createTime\":1645547538000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2038,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-23 00:32:39');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":100,\"menuName\":\"員工薪資2\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"report2\",\"component\":\"ks/report2/index\",\"children\":[],\"createTime\":1645547538000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2038,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-23 00:33:11');
INSERT INTO `sys_oper_log` VALUES ('166', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ks_expense', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-24 07:24:55');
INSERT INTO `sys_oper_log` VALUES ('167', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":66,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645658695000,\"tableId\":7,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ExpenseId\",\"usableColumn\":false,\"columnId\":67,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"expenseId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"日常開支編號\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645658695000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"expense_id\"},{\"capJavaField\":\"ExpenseDate\",\"usableColumn\":false,\"columnId\":68,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"expenseDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日常開支日期\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645658695000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"expense_date\"},{\"capJavaField\":\"ExpenseDriver\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"expenseDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"機司名稱\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"co', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-24 07:25:56');
INSERT INTO `sys_oper_log` VALUES ('168', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":66,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"流水號\",\"updateTime\":1645658756000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1645658695000,\"tableId\":7,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ExpenseId\",\"usableColumn\":false,\"columnId\":67,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"expenseId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"日常開支編號\",\"isQuery\":\"1\",\"updateTime\":1645658756000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645658695000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"expense_id\"},{\"capJavaField\":\"ExpenseDate\",\"usableColumn\":false,\"columnId\":68,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"expenseDate\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"日常開支日期\",\"isQuery\":\"1\",\"updateTime\":1645658756000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1645658695000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"expense_date\"},{\"capJavaField\":\"ExpenseDriver\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"expenseDriver\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"機司名稱\",\"isQue', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-24 07:26:12');
INSERT INTO `sys_oper_log` VALUES ('169', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-02-24 07:26:32');
INSERT INTO `sys_oper_log` VALUES ('170', '日常開支表單', '1', 'com.ruoyi.kaisheng.controller.KsExpenseController.add()', 'POST', '1', 'admin', null, '/ks/expense', '127.0.0.1', '内网IP', '{\"expenseLicensePlateNumber\":\"KSC-0958\",\"expenseDriver\":\"李政儒\",\"expenseTotal\":1900.00,\"params\":{},\"expenseDate\":1645632000000,\"expenseId\":\"22022401\",\"expenseOther\":0,\"expense1\":300,\"expense2\":1000,\"expense3\":600}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'expense_2\' at row 1\r\n### The error may exist in file [C:\\Users\\Faker\\git\\RuoYi-Vue\\ruoyi-kaisheng\\target\\classes\\mapper\\ks\\KsExpenseMapper.xml]\r\n### The error may involve com.ruoyi.kaisheng.mapper.KsExpenseMapper.insertKsExpense-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ks_expense          ( expense_id,             expense_date,             expense_driver,             expense_license_plate_number,             expense_1,             expense_2,             expense_3,             expense_other,             expense_total )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'expense_2\' at row 1\n; Data truncation: Out of range value for column \'expense_2\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'expense_2\' at row 1', '2022-02-24 08:08:25');
INSERT INTO `sys_oper_log` VALUES ('171', '日常開支表單', '1', 'com.ruoyi.kaisheng.controller.KsExpenseController.add()', 'POST', '1', 'admin', null, '/ks/expense', '127.0.0.1', '内网IP', '{\"expenseLicensePlateNumber\":\"KSC-0958\",\"expenseDriver\":\"李政儒\",\"expenseTotal\":1900.00,\"params\":{},\"expenseDate\":1645632000000,\"expenseId\":\"22022401\",\"expenseOther\":0,\"expense1\":300,\"expense2\":1000,\"expense3\":600}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'expense_2\' at row 1\r\n### The error may exist in file [C:\\Users\\Faker\\git\\RuoYi-Vue\\ruoyi-kaisheng\\target\\classes\\mapper\\ks\\KsExpenseMapper.xml]\r\n### The error may involve com.ruoyi.kaisheng.mapper.KsExpenseMapper.insertKsExpense-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ks_expense          ( expense_id,             expense_date,             expense_driver,             expense_license_plate_number,             expense_1,             expense_2,             expense_3,             expense_other,             expense_total )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'expense_2\' at row 1\n; Data truncation: Out of range value for column \'expense_2\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'expense_2\' at row 1', '2022-02-24 08:08:34');
INSERT INTO `sys_oper_log` VALUES ('172', '日常開支表單', '1', 'com.ruoyi.kaisheng.controller.KsExpenseController.add()', 'POST', '1', 'admin', null, '/ks/expense', '127.0.0.1', '内网IP', '{\"expenseLicensePlateNumber\":\"KSC-0958\",\"expenseDriver\":\"李政儒\",\"expenseTotal\":1900.00,\"params\":{},\"expenseDate\":1645632000000,\"expenseId\":\"22022401\",\"expenseOther\":0,\"id\":20,\"expense1\":300,\"expense2\":1000,\"expense3\":600}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-24 08:16:29');
INSERT INTO `sys_oper_log` VALUES ('173', '加油表單', '5', 'com.ruoyi.kaisheng.controller.KsOilOrderController.export()', 'POST', '1', 'admin', null, '/ks/order/export', '127.0.0.1', '内网IP', '{\"params\":{},\"oilDriver\":\"黃智凱\"}', null, '0', null, '2022-02-24 09:39:03');
INSERT INTO `sys_oper_log` VALUES ('174', '加油表單', '5', 'com.ruoyi.kaisheng.controller.KsOilOrderController.export()', 'POST', '1', 'admin', null, '/ks/order/export', '127.0.0.1', '内网IP', '{\"params\":{},\"oilDriver\":\"黃智凱\"}', null, '0', null, '2022-02-24 10:20:21');
INSERT INTO `sys_oper_log` VALUES ('175', '員工表單', '2', 'com.ruoyi.kaisheng.controller.KsEmployeeController.edit()', 'PUT', '1', 'admin', null, '/ks/employee', '127.0.0.1', '内网IP', '{\"idCard\":\"A100537101\",\"staffPositions\":\"負責人\",\"homeTelephoneNumber\":\"\",\"company\":\"凱基股份有限公司\",\"id\":1,\"gonorthCount\":0,\"address\":\"新北市泰山區中華街9號\",\"entryDate\":1430409600000,\"downboundCount\":0,\"sex\":\"男\",\"employeeId\":\"ks-01\",\"params\":{},\"reasonForLeaving\":\"無\",\"phoneNumber\":\"0960-182124\",\"aka\":\"\",\"name\":\"黃智凱\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-02-27 06:09:33');
INSERT INTO `sys_oper_log` VALUES ('176', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ks_client', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-03 16:44:25');
INSERT INTO `sys_oper_log` VALUES ('177', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"客戶公司流水號\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1646297065000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ClinetId\",\"usableColumn\":false,\"columnId\":77,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"clinetId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"客戶公司編號\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1646297065000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"clinet_id\"},{\"capJavaField\":\"ClinetName\",\"usableColumn\":false,\"columnId\":78,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clinetName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"客戶公司名稱\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1646297065000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"clinet_name\"},{\"capJavaField\":\"ClinetTel\",\"usableColumn\":false,\"columnId\":79,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clinetTel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"客戶公司電話\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(1', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-03 16:45:18');
INSERT INTO `sys_oper_log` VALUES ('178', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"客戶公司流水號\",\"updateTime\":1646297118000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1646297065000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ClinetId\",\"usableColumn\":false,\"columnId\":77,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"clinetId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"客戶公司編號\",\"isQuery\":\"1\",\"updateTime\":1646297118000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1646297065000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"clinet_id\"},{\"capJavaField\":\"ClinetName\",\"usableColumn\":false,\"columnId\":78,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clinetName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"客戶公司名稱\",\"isQuery\":\"1\",\"updateTime\":1646297118000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1646297065000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"clinet_name\"},{\"capJavaField\":\"ClinetTel\",\"usableColumn\":false,\"columnId\":79,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clinetTel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"客戶公司電話\",\"isQuery\":\"1\",\"updateTime\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-03 16:45:35');
INSERT INTO `sys_oper_log` VALUES ('179', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-03-03 16:45:39');
INSERT INTO `sys_oper_log` VALUES ('180', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":9999,\"menuName\":\"報表\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"dateReport\",\"component\":\"ks/report/dateReport\",\"children\":[],\"createTime\":1645924538000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2045,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-03 16:49:26');
INSERT INTO `sys_oper_log` VALUES ('181', '日常開支表單', '2', 'com.ruoyi.kaisheng.controller.KsExpenseController.edit()', 'PUT', '1', 'admin', null, '/ks/expense', '127.0.0.1', '内网IP', '{\"expenseLicensePlateNumber\":\"KSC-0958\",\"expenseDriver\":\"李政儒\",\"expenseTotal\":4600.00,\"params\":{},\"expenseDate\":1645632000000,\"expenseId\":\"22022401\",\"expenseOther\":0,\"id\":20,\"expense1\":3000,\"expense2\":1000,\"expense3\":600}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-03 17:06:24');
INSERT INTO `sys_oper_log` VALUES ('182', '日常開支表單', '2', 'com.ruoyi.kaisheng.controller.KsExpenseController.edit()', 'PUT', '1', 'admin', null, '/ks/expense', '127.0.0.1', '内网IP', '{\"expenseLicensePlateNumber\":\"KSC-0958\",\"expenseDriver\":\"李政儒\",\"expenseTotal\":4600,\"params\":{},\"expenseDate\":1645632000000,\"expenseId\":\"22022401\",\"expenseOther\":0,\"id\":20,\"expense1\":3000,\"expense2\":1000,\"expense3\":600}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-03 17:06:28');
INSERT INTO `sys_oper_log` VALUES ('183', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', '1', 'admin', null, '/tool/gen/synchDb/ks_client', '127.0.0.1', '内网IP', '{tableName=ks_client}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-03 17:20:35');
INSERT INTO `sys_oper_log` VALUES ('184', '代码生成', '2', 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', '1', 'admin', null, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"Sheng\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":76,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"required\":false,\"superColumn\":false,\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"\",\"updateTime\":1646299235000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(10)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1646297065000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ClientId\",\"usableColumn\":false,\"columnId\":84,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"clientId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"客戶公司編號\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(10)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1646299235000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"client_id\"},{\"capJavaField\":\"ClientName\",\"usableColumn\":false,\"columnId\":85,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clientName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"客戶公司名稱\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(20)\",\"createBy\":\"\",\"isPk\":\"0\",\"createTime\":1646299235000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"client_name\"},{\"capJavaField\":\"ClientTel\",\"usableColumn\":false,\"columnId\":86,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"clientTel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"客戶公司電話\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(12)\",\"createBy\":\"\",', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-03 17:20:57');
INSERT INTO `sys_oper_log` VALUES ('185', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', '1', 'admin', null, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', null, '0', null, '2022-03-03 17:21:00');
INSERT INTO `sys_oper_log` VALUES ('186', '南下表單', '1', 'com.ruoyi.kaisheng.controller.KsDownboundController.add()', 'POST', '1', 'admin', null, '/ks/downbound', '127.0.0.1', '内网IP', '{\"downboundGoodsMt\":50,\"downboundTotal\":2500,\"params\":{},\"downboundGoodsPrice\":50,\"downboundDriverPay\":1000,\"downboundLicensePlateNumber\":\"KSC-0803\",\"downboundGoods\":\"goods-02\",\"downboundYard\":\"大陸\",\"downboundCash\":\"是\",\"downboundId\":\"22021501\",\"downboundCompany\":\"client-03\",\"id\":7,\"downboundDate\":1644854400000,\"downboundDriver\":\"黃智凱\",\"downboundOutset\":\"台灣\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-06 16:23:30');
INSERT INTO `sys_oper_log` VALUES ('187', '南下表單', '1', 'com.ruoyi.kaisheng.controller.KsDownboundController.add()', 'POST', '1', 'admin', null, '/ks/downbound', '127.0.0.1', '内网IP', '{\"downboundGoodsMt\":100,\"downboundTotal\":5000,\"params\":{},\"downboundGoodsPrice\":50,\"downboundDriverPay\":2000,\"downboundLicensePlateNumber\":\"KSC-0958\",\"downboundGoods\":\"goods-04\",\"downboundYard\":\"美國\",\"downboundCash\":\"是\",\"downboundId\":\"22022101\",\"downboundCompany\":\"client-13\",\"downboundDate\":1645372800000,\"downboundDriver\":\"黃智凱\",\"downboundOutset\":\"日本\"}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1\r\n### The error may exist in file [C:\\Users\\Faker\\git\\RuoYi-Vue\\ruoyi-kaisheng\\target\\classes\\mapper\\ks\\KsDownboundMapper.xml]\r\n### The error may involve com.ruoyi.kaisheng.mapper.KsDownboundMapper.insertKsDownbound-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ks_downbound    ( downbound_id,    downbound_date,    downbound_driver,    downbound_license_plate_number,    downbound_company,    downbound_outset,    downbound_yard,    downbound_cash,    downbound_goods,    downbound_goods_mt,    downbound_goods_price,    downbound_total,    downbound_driver_pay )     values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1\n; Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1', '2022-03-06 16:24:02');
INSERT INTO `sys_oper_log` VALUES ('188', '南下表單', '1', 'com.ruoyi.kaisheng.controller.KsDownboundController.add()', 'POST', '1', 'admin', null, '/ks/downbound', '127.0.0.1', '内网IP', '{\"downboundGoodsMt\":100,\"downboundTotal\":5000,\"params\":{},\"downboundGoodsPrice\":50,\"downboundDriverPay\":2000,\"downboundLicensePlateNumber\":\"KSC-0958\",\"downboundGoods\":\"goods-04\",\"downboundYard\":\"美國\",\"downboundCash\":\"是\",\"downboundId\":\"22022101\",\"downboundCompany\":\"client-13\",\"downboundDate\":1645372800000,\"downboundDriver\":\"黃智凱\",\"downboundOutset\":\"日本\"}', null, '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1\r\n### The error may exist in file [C:\\Users\\Faker\\git\\RuoYi-Vue\\ruoyi-kaisheng\\target\\classes\\mapper\\ks\\KsDownboundMapper.xml]\r\n### The error may involve com.ruoyi.kaisheng.mapper.KsDownboundMapper.insertKsDownbound-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ks_downbound    ( downbound_id,    downbound_date,    downbound_driver,    downbound_license_plate_number,    downbound_company,    downbound_outset,    downbound_yard,    downbound_cash,    downbound_goods,    downbound_goods_mt,    downbound_goods_price,    downbound_total,    downbound_driver_pay )     values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1\n; Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'downbound_goods_mt\' at row 1', '2022-03-06 16:24:07');
INSERT INTO `sys_oper_log` VALUES ('189', '南下表單', '1', 'com.ruoyi.kaisheng.controller.KsDownboundController.add()', 'POST', '1', 'admin', null, '/ks/downbound', '127.0.0.1', '内网IP', '{\"downboundGoodsMt\":50,\"downboundTotal\":5000,\"params\":{},\"downboundGoodsPrice\":100,\"downboundDriverPay\":2000,\"downboundLicensePlateNumber\":\"KSC-0958\",\"downboundGoods\":\"goods-04\",\"downboundYard\":\"美國\",\"downboundCash\":\"是\",\"downboundId\":\"22022101\",\"downboundCompany\":\"client-13\",\"id\":8,\"downboundDate\":1645372800000,\"downboundDriver\":\"黃智凱\",\"downboundOutset\":\"日本\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-06 16:24:26');
INSERT INTO `sys_oper_log` VALUES ('190', '南下表單', '1', 'com.ruoyi.kaisheng.controller.KsDownboundController.add()', 'POST', '1', 'admin', null, '/ks/downbound', '127.0.0.1', '内网IP', '{\"downboundGoodsMt\":20,\"downboundTotal\":2000,\"params\":{},\"downboundGoodsPrice\":100,\"downboundDriverPay\":500,\"downboundLicensePlateNumber\":\"KSC-0803\",\"downboundGoods\":\"goods-06\",\"downboundYard\":\"美國\",\"downboundCash\":\"是\",\"downboundId\":\"22022601\",\"downboundCompany\":\"client-14\",\"id\":9,\"downboundDate\":1645804800000,\"downboundDriver\":\"黃智凱\",\"downboundOutset\":\"日本\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-06 16:25:00');
INSERT INTO `sys_oper_log` VALUES ('191', '日常開支表單', '1', 'com.ruoyi.kaisheng.controller.KsExpenseController.add()', 'POST', '1', 'admin', null, '/ks/expense', '127.0.0.1', '内网IP', '{\"expenseLicensePlateNumber\":\"KSC-0803\",\"expenseDriver\":\"黃智凱\",\"expenseTotal\":4600.00,\"params\":{},\"expenseDate\":1646668800000,\"expenseId\":\"22030801\",\"expenseOther\":0,\"id\":21,\"expense1\":3000,\"expense2\":1000,\"expense3\":600}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-08 18:46:21');
INSERT INTO `sys_oper_log` VALUES ('192', '日常開支表單', '1', 'com.ruoyi.kaisheng.controller.KsExpenseController.add()', 'POST', '1', 'admin', null, '/ks/expense', '127.0.0.1', '内网IP', '{\"expenseLicensePlateNumber\":\"KSC-0803\",\"expenseDriver\":\"黃智凱\",\"expenseTotal\":3500.00,\"params\":{},\"expenseDate\":1646668800000,\"expenseId\":\"22030802\",\"expenseOther\":0,\"id\":22,\"expense1\":2500,\"expense2\":1000,\"expense3\":0}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-03-08 18:46:43');
INSERT INTO `sys_oper_log` VALUES ('193', '日常開支表單', '5', 'com.ruoyi.kaisheng.controller.KsExpenseController.export()', 'POST', '1', 'admin', null, '/ks/expense/export', '127.0.0.1', '内网IP', '{\"params\":{}}', null, '0', null, '2022-03-09 22:11:33');
INSERT INTO `sys_oper_log` VALUES ('194', '北上表單', '5', 'com.ruoyi.kaisheng.controller.KsGonorthController.export()', 'POST', '1', 'admin', null, '/ks/gonorth/export', '127.0.0.1', '内网IP', '{\"params\":{}}', null, '0', null, '2022-03-16 19:50:24');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-02-19 22:59:06', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-02-19 22:59:06', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2022-02-19 22:59:06', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2022-02-19 22:59:06', '', null, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '116');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-16 21:57:27', 'admin', '2022-02-19 22:59:06', '', '2022-03-16 21:57:27', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-02-19 22:59:06', 'admin', '2022-02-19 22:59:06', '', null, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
