/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : wabacusdemodb

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2013-04-08 17:06:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_area`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_area`;
CREATE TABLE `tbl_area` (
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_area
-- ----------------------------
INSERT INTO `tbl_area` VALUES ('江西', '宜春', '上高');
INSERT INTO `tbl_area` VALUES ('江西', '宜春', '高安');
INSERT INTO `tbl_area` VALUES ('江西', '宜春', '万载');
INSERT INTO `tbl_area` VALUES ('江西', '宜春', '奉新');
INSERT INTO `tbl_area` VALUES ('江西', '南昌', '进贤');
INSERT INTO `tbl_area` VALUES ('江西', '南昌', '新建');
INSERT INTO `tbl_area` VALUES ('江西', '抚州', '东乡');
INSERT INTO `tbl_area` VALUES ('江西', '抚州', '临川');
INSERT INTO `tbl_area` VALUES ('广东', '深圳', '宝安');
INSERT INTO `tbl_area` VALUES ('广东', '深圳', '福田');
INSERT INTO `tbl_area` VALUES ('广东', '深圳', '南山');
INSERT INTO `tbl_area` VALUES ('广东', '东莞', '塘厦');
INSERT INTO `tbl_area` VALUES ('广东', '东莞', '长安');
INSERT INTO `tbl_area` VALUES ('福建', '泉州', '惠安');
INSERT INTO `tbl_area` VALUES ('福建', '泉州', '安溪');
INSERT INTO `tbl_area` VALUES ('福建', '泉州', '南安');
INSERT INTO `tbl_area` VALUES ('福建', '福州', '永泰');
INSERT INTO `tbl_area` VALUES ('福建', '福州', '连江');

-- ----------------------------
-- Table structure for `tbl_baseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_baseinfo`;
CREATE TABLE `tbl_baseinfo` (
  `uuid` varchar(50) DEFAULT NULL,
  `no` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `deptno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_baseinfo
-- ----------------------------
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0001', '10001', '宋文华', '1', '25', '1978-01-03', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0002', '10002', '周燕', '0', '38', '1978-12-21', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0003', '10003', '周红', '0', '45', '1968-05-23', '0003');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0004', '10004', '胡智波', '1', '35', '1963-08-12', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0005', '10005', '胡秀青', '1', '36', '1965-06-11', '0002');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0006', '10006', '涂琦英', '0', '56', '1959-05-03', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0007', '10007', '宋节斌', '1', '45', '1957-11-05', '0002');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0008', '10008', '周英龙', '1', '26', '1980-10-09', '0003');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0009', '10009', '吴树青', '1', '32', '1983-11-15', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0010', '10010', '范新华', '1', '36', '1983-08-17', '0012');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0011', '10011', '吴国发', '1', '26', '1980-07-19', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0012', '10012', '吴志枫', '1', '43', '1978-08-13', '0002');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0013', '10013', '范坚琴', '0', '28', '1977-03-03', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0014', '10014', '周勇伟', '1', '36', '1978-07-05', '0005');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0015', '10015', '周节华', '1', '46', '1976-05-17', '0009');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0016', '10016', '范员波', '1', '35', '1978-07-16', '0009');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0017', '10017', '胡冬琴', '0', '56', '1980-06-15', '0005');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0018', '10018', '周红', '0', '28', '1980-08-21', '0007');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0019', '10019', '吴志清', '1', '37', '1968-07-27', '0004');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0020', '10020', '吴志国', '1', '38', '1987-08-29', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0021', '10021', '吴清珊', '0', '28', '1969-06-25', '0009');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0022', '10022', '王志尖', '1', '36', '1980-07-26', '0012');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0023', '10023', '吴良光', '1', '28', '1986-03-25', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0024', '10024', '胡玟乐', '1', '37', '1976-03-21', '0004');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0025', '10025', '洪亮亮', '1', '46', '1978-04-23', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0026', '10026', '付瑞明', '1', '45', '1966-06-12', '0006');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0027', '10027', '胡志莹', '0', '29', '1985-07-11', '0010');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0028', '10028', '高洪波', '1', '34', '1975-03-10', '0008');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0029', '10029', '刘铭署', '1', '38', '1973-07-15', '0006');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0030', '10030', '胡婷', '0', '36', '1976-11-03', '0010');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0031', '10031', '吴建中', '1', '39', '1988-12-15', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0032', '10032', '吴志诚', '1', '26', '1986-04-19', '0007');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0033', '10033', '苏伟官', '1', '28', '1963-10-26', '0007');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0034', '10034', '吴圆蛾', '0', '29', '1968-08-27', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0035', '10035', '吴芝红', '0', '23', '1965-01-21', '0002');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0036', '10036', '万兴国', '1', '27', '1958-11-20', '0011');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0037', '10037', '范贵红', '0', '45', '1980-10-23', '0001');
INSERT INTO `tbl_baseinfo` VALUES ('8a9f8189297d71b001297d71b01a0038', '10038', '宋国珍', '0', '36', '1982-06-13', '0008');

-- ----------------------------
-- Table structure for `tbl_department`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_department`;
CREATE TABLE `tbl_department` (
  `guid` varchar(50) DEFAULT NULL,
  `deptno` varchar(20) DEFAULT NULL,
  `deptname` varchar(30) DEFAULT NULL,
  `manager` varchar(30) DEFAULT NULL,
  `builtdate` date DEFAULT NULL,
  `performance` varchar(20) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_department
-- ----------------------------
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0001', '0001', '生产质量部', '吴华云', '2001-01-03', '优秀', '根据客户要求的产品交货期，安排生产，安排测试，安排包装，按时按质完成产品，对研发产品测试样机生产支持，管理生产车间，5S，精益生产，生产物料、半成品和成品管理，生产质量管理，生产人员管理，操作工技能培训，制定生产各部分的制度和流程，对销售的产品质量进行跟踪和管理，处理客户产品投诉，提出产品质量整改意见，组织和提高产品认证（3C，CCEE，CCIB，CE）、质量认证（ISO9000-ISO90004）、环境认证（ISO14000），制定和完善全面质量管理（TQM）');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0002', '0002', '物流部', '苏伟根', '2001-01-03', '很差', '将销售部获得的客户订单录入到ERP系统，并生成相应的加工单，对成品按照客户要求的日期和发货地点完成成品发运，衡量公司对客户及时交货率；按照物流协议向供应商购买物料，催缴物料，对物料进行质量检查，并对供应商来料进行更总和物料FIFO管理，收到发票后组织付款，衡量供应商对公司的及时交货率，以及保税物料和报关实务处理，控制库存，制定物流制度和相应流程');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0003', '0003', '采购部', '胡忠华', '2001-11-13', '良好', '前期供应商的搜寻，对供应商的认证和考核，谈判物料价格，制定物流采购协议，对供应商的产品和送货进行质量更总，非生产性物料的采购，制定所有采购材料的流程和制度，对工业项目采购的支持');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0004', '0004', '财务部', '胡新立', '2003-06-09', '良好', '对公司的经营状况进行分析，提供决策财务数据支持，各种凭证录入系统，对供应商开具的发票付款，开发票给客户，并进行应收款的工作，对各种凭证汇总产生总账，出具财务报表（资产负债表，损益表，现金流量表），管理公司存款和现金，管理支票、汇票、发票、收据，报销，管理公司固定资产');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0005', '0005', '研发技术部', '潘林淘', '2003-12-03', '良好', '负责对现有产品升级更新，性能优化，产品改进，新产品研发，产品生产技术支持，管理研发设备和研发实验室');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0006', '0006', '人事行政部', '胡新华', '2003-12-09', '优秀', '发展公司企业文化，制定公司人事制度，管理员工入职离职，劳动合同管理，员工信息管理，制定员工福利和奖惩制度，制定公司培训政策和制度，安排出差人员的食宿，管理公司班车，管理公司食堂，管理公司办公设备');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0007', '0007', '信息管理部', '苏小琴', '2004-03-12', '优秀', '管理公司的信息设备，保证设备和信息的安全，提供稳定，安全，高效的应用服务，配合公司战略规划，制定信息管理发展计划，带领和支持业务部门，提供优质的产品和服务');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0008', '0008', '销售市场部', '潘云鹏', '2004-03-12', '较好', '为公司产品策划营销活动，树立公司品牌影响力，扩大产品市场占有额，管理分销商、代理商网络，制定公司年度销售计划，对销售活动进行监督和管理，考核销售业绩，为客户提供优质产品和服务');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a0009', '0009', '售后服务部', '潘云飞', '2004-03-12', '较好', '提供产品客户服务，产品安装，产品调试，产品维修，产品配件管理，产品售后服务管理，提供优质的产品售后服务');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a00010', '0010', '工业工程部', '吴金升', '2005-01-06', '较好', '规划生产线，提供精益生产方法和流程，制定产品生产工艺工序，产品生产操作手册，生产车间布局管理，优化生产工艺工序，提供工作效率，规划安全生产环境，产品技术变更管理，零部件版本升级管理，工程变更管理，将新研发的产品工业化，新产品生产线规划，操作工WI培训');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a00011', '0011', '设备维修部', '吴平红', '2005-01-06', '良好', '负责公司所有故障设备的维修与更新');
INSERT INTO `tbl_department` VALUES ('3a8f8189297d71b001297d71b01a00012', '0012', '保卫处', '胡建国', '2005-01-08', '优秀', '维护公司及员工安全，保障公司财产不受破坏');

-- ----------------------------
-- Table structure for `tbl_dept_pingjia`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept_pingjia`;
CREATE TABLE `tbl_dept_pingjia` (
  `guid` varchar(50) DEFAULT NULL,
  `pingjia` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dept_pingjia
-- ----------------------------
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0001', '很好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0002', '很差');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0003', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0004', '较差');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0005', '很好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0006', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0007', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0008', '很好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a0009', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a00010', '较好');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a00011', '很差');
INSERT INTO `tbl_dept_pingjia` VALUES ('3a8f8189297d71b001297d71b01a00012', '很好');

-- ----------------------------
-- Table structure for `tbl_detailinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_detailinfo`;
CREATE TABLE `tbl_detailinfo` (
  `no` varchar(20) DEFAULT NULL,
  `ename` varchar(30) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `joinindate` date DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `county` varchar(30) DEFAULT NULL,
  `marriage` int(11) DEFAULT NULL,
  `interest` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `description` text,
  `jl` varchar(100) DEFAULT NULL,
  `orderline` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_detailinfo
-- ----------------------------
INSERT INTO `tbl_detailinfo` VALUES ('10001', 'songwenhua', '1320.2', '2008-11-03', '江西', '南昌', '进贤', '1', '健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_chiay.jpg', '努力勤奋，上进好学', '', '101538111');
INSERT INTO `tbl_detailinfo` VALUES ('10002', 'zhouyuan', '2345.32', '2003-02-21', '广东', '深圳', '宝安', '0', '排球,旅游,跑步', '/WabacusDemo/wabacusdemo/uploadfile/2_claudxyz.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '111538112');
INSERT INTO `tbl_detailinfo` VALUES ('10003', 'zhouhong', '4323.23', '2005-03-23', '福建', '泉州', '惠安', '0', '足球,爬山,游泳', '/WabacusDemo/wabacusdemo/uploadfile/2_cuidenghong123.jpg', '勤偷节约，积极上进', '', '121538113');
INSERT INTO `tbl_detailinfo` VALUES ('10004', 'huzhibo', '6352', '2006-08-22', '江西', '宜春', '高安', '1', '排球,旅游', '/WabacusDemo/wabacusdemo/uploadfile/2_cxz003.jpg', '努力勤奋，上进好学', '', '131538114');
INSERT INTO `tbl_detailinfo` VALUES ('10005', 'huxiuqing', '4367.2', '2005-06-01', '福建', '泉州', '安溪', '0', '足球,旅游,跑步,健身', '/WabacusDemo/wabacusdemo/uploadfile/2_e_mi_tuo_fo.jpg', '勤偷节约，积极上进', '', '141538115');
INSERT INTO `tbl_detailinfo` VALUES ('10006', 'tuqiying', '5355.2', '2006-05-23', '广东', '东莞', '塘厦', '0', '跑步,健身', '/WabacusDemo/wabacusdemo/uploadfile/2_emon123.jpg', '努力勤奋，上进好学', '', '151538116');
INSERT INTO `tbl_detailinfo` VALUES ('10007', 'songjiebin', '7434.34', '2002-11-03', '江西', '南昌', '进贤', '0', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_fanyuanwaifdl.jpg', '勤偷节约，积极上进', '', '161538117');
INSERT INTO `tbl_detailinfo` VALUES ('10008', 'zhouyinglong', '7436.5', '2000-10-19', '福建', '泉州', '惠安', '0', '游泳,排球,旅游,', '/WabacusDemo/wabacusdemo/uploadfile/2_fellowcheng.jpg', '努力勤奋，上进好学', '', '171538118');
INSERT INTO `tbl_detailinfo` VALUES ('10009', 'wushuqing', '3455.3', '2009-11-15', '江西', '抚州', '临川', '1', '篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_gaohenggaoheng.jpg', '努力勤奋，上进好学', '', '181538119');
INSERT INTO `tbl_detailinfo` VALUES ('10010', 'fanxinhua', '3466.3', '2007-08-20', '江西', '南昌', '进贤', '0', '游泳,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_haiyong_sea.jpg', '努力勤奋，上进好学', '', '191538120');
INSERT INTO `tbl_detailinfo` VALUES ('10011', 'woguofa', '3677.4', '2000-07-29', '江西', '抚州', '临川', '0', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_huahua320.jpg', '努力勤奋，上进好学', '', '201538121');
INSERT INTO `tbl_detailinfo` VALUES ('10012', 'wuzhifeng', '7637.3', '2002-08-23', '广东', '深圳', '福田', '0', '游泳,排球,旅游', '/WabacusDemo/wabacusdemo/uploadfile/2_huiyaxiong.jpg', '勤偷节约，积极上进', '', '211538122');
INSERT INTO `tbl_detailinfo` VALUES ('10013', 'fanjianqin', '6346.3', '2006-03-23', '江西', '宜春', '高安', '0', '爬山,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_hyblusea.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '221538123');
INSERT INTO `tbl_detailinfo` VALUES ('10014', 'zhouyongwei', '7598', '2004-07-15', '福建', '泉州', '惠安', '0', '足球,跑步,健身', '/WabacusDemo/wabacusdemo/uploadfile/2_ivfangwang_long.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '231538124');
INSERT INTO `tbl_detailinfo` VALUES ('10015', 'zhoujiehua', '9346.3', '2000-05-07', '广东', '深圳', '宝安', '1', '旅游,跑步,健身', '/WabacusDemo/wabacusdemo/uploadfile/2_jaffy.jpg', '勤偷节约，积极上进', '', '241538125');
INSERT INTO `tbl_detailinfo` VALUES ('10016', 'fanyuanbo', '7463.3', '2003-07-06', '江西', '抚州', '临川', '0', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_javaalpha.jpg', '勤偷节约，积极上进', '', '51538126');
INSERT INTO `tbl_detailinfo` VALUES ('10017', 'hudongqin', '8998.2', '2008-06-05', '江西', '宜春', '上高', '0', '足球,爬山,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_jennyvenus.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '281538127');
INSERT INTO `tbl_detailinfo` VALUES ('10018', 'zhouhong', '7654.7', '2007-08-11', '福建', '福州', '永泰', '0', '足球,爬山,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_jjkodada.jpg', '勤偷节约，积极上进', '', '271538128');
INSERT INTO `tbl_detailinfo` VALUES ('10019', 'wuzhiqing', '6745.3', '2006-07-17', '广东', '深圳', '南山', '1', '健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_kaiyekai.jpg', '努力勤奋，上进好学', '', '281538129');
INSERT INTO `tbl_detailinfo` VALUES ('10020', 'wuzhiguo', '7655.4', '2005-08-20', '广东', '深圳', '福田', '0', '足球,爬山', '/WabacusDemo/wabacusdemo/uploadfile/2_kakajay008.jpg', '勤偷节约，积极上进', '', '291538130');
INSERT INTO `tbl_detailinfo` VALUES ('10021', 'wuqingshan', '10080.3', '2005-06-15', '福建', '福州', '连江', '0', '旅游,跑步', '/WabacusDemo/wabacusdemo/uploadfile/2_lbh119.jpg', '勤偷节约，积极上进', '', '301538131');
INSERT INTO `tbl_detailinfo` VALUES ('10022', 'wangzhijian', '2980.9', '2006-07-20', '江西', '宜春', '高安', '1', '健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_liufang12381.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '311538132');
INSERT INTO `tbl_detailinfo` VALUES ('10023', 'wuliangguang', '3800', '2007-03-20', '广东', '深圳', '福田', '0', '足球,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_liuxk99.jpg', '勤偷节约，积极上进', '', '321538134');
INSERT INTO `tbl_detailinfo` VALUES ('10024', 'huwenle', '9890.3', '2006-03-23', '广东', '深圳', '福田', '1', '足球,爬山,游泳,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_luojianfeng.jpg', '勤偷节约，积极上进', '', '331538135');
INSERT INTO `tbl_detailinfo` VALUES ('10025', 'hongliangliang', '6551', '2008-04-21', '福建', '泉州', '惠安', '1', '排球,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_luxiaoshuai.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '341538136');
INSERT INTO `tbl_detailinfo` VALUES ('10026', 'fuluiming', '3455.3', '2003-06-22', '福建', '福州', '连江', '1', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_lzj_freedom.jpg', '勤偷节约，积极上进', '', '351538137');
INSERT INTO `tbl_detailinfo` VALUES ('10027', 'huzhiying', '5764.3', '2009-07-12', '江西', '宜春', '上高', '0', '旅游,跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_minvt.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '361538138');
INSERT INTO `tbl_detailinfo` VALUES ('10028', 'gaohongbo', '9832.3', '2007-03-13', '福建', '福州', '连江', '0', '排球,旅游,跑步', '/WabacusDemo/wabacusdemo/uploadfile/2_pepeet.jpg', '勤偷节约，积极上进', '', '371538139');
INSERT INTO `tbl_detailinfo` VALUES ('10029', 'liumingshu', '4645', '2006-07-16', '江西', '南昌', '新建', '0', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_pxh360395296.jpg', '勤偷节约，积极上进', '', '381538140');
INSERT INTO `tbl_detailinfo` VALUES ('10030', 'huting', '5789', '2004-11-02', '广东', '深圳', '南山', '0', '爬山,游泳,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_pzy0428.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '391538141');
INSERT INTO `tbl_detailinfo` VALUES ('10031', 'wujianzhong', '3456', '2007-12-25', '福建', '福州', '永泰', '0', '足球,爬山,游泳', '/WabacusDemo/wabacusdemo/uploadfile/2_q107770540.jpg', '勤偷节约，积极上进', '', '401538142');
INSERT INTO `tbl_detailinfo` VALUES ('10032', 'wuzhicheng', '9253', '2003-04-10', '江西', '南昌', '进贤', '1', '足球,爬山,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_qiubojuncode.jpg', '勤偷节约，积极上进', '', '411538143');
INSERT INTO `tbl_detailinfo` VALUES ('10033', 'shuweiguan', '8992.5', '2000-10-16', '广东', '东莞', '塘厦', '0', '健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_shineboyadh.jpg', '努力勤奋，上进好学', '', '421538144');
INSERT INTO `tbl_detailinfo` VALUES ('10034', 'wuyuane', '7687', '2002-08-23', '福建', '福州', '永泰', '1', '足球,爬山,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_songpengasp.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '431538145');
INSERT INTO `tbl_detailinfo` VALUES ('10035', 'wuzhihong', '2336', '2006-01-22', '江西', '宜春', '高安', '0', '排球,旅游,跑步', '/WabacusDemo/wabacusdemo/uploadfile/2_steptodream.jpg', '勤偷节约，积极上进', '', '441538146');
INSERT INTO `tbl_detailinfo` VALUES ('10036', 'wanxingguo', '8566.3', '2005-11-23', '福建', '泉州', '安溪', '0', '游泳,排球', '/WabacusDemo/wabacusdemo/uploadfile/2_stonekind.jpg', '勤偷节约，积极上进', '', '451538147');
INSERT INTO `tbl_detailinfo` VALUES ('10037', 'fanguihong', '3246', '2001-10-25', '江西', '南昌', '新建', '1', '跑步,健身,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_tashiwoweiyi.jpg', '好吃懒做，游手好闲，好逸恶劳', '', '461538148');
INSERT INTO `tbl_detailinfo` VALUES ('10038', 'songguozhen', '9675', '2003-06-18', '广东', '东莞', '长安', '1', '足球,爬山,篮球', '/WabacusDemo/wabacusdemo/uploadfile/2_teng_s2000.jpg', '努力勤奋，上进好学', '', '471538149');

-- ----------------------------
-- Table structure for `tbl_log`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_log`;
CREATE TABLE `tbl_log` (
  `uuid` varchar(50) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `updatetype` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_salary`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_salary`;
CREATE TABLE `tbl_salary` (
  `no` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `salary` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_salary
-- ----------------------------
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '1', '3543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '2', '3643.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '3', '3573.2');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '4', '4543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '5', '3943.8');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '6', '3547.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '7', '3549.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '8', '3543');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '9', '3544.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '10', '3343.6');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '11', '3143.4');
INSERT INTO `tbl_salary` VALUES ('10001', '2008', '12', '3943.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '1', '6343.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '2', '6743.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '3', '6843.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '4', '6543.45');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '5', '6342');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '6', '6443.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '7', '6541.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '8', '6643.5');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '9', '6844.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '10', '7573.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '11', '4593.7');
INSERT INTO `tbl_salary` VALUES ('10002', '2008', '12', '6545.13');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '1', '5463.13');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '2', '5142.2');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '3', '5343.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '4', '5543.7');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '5', '5596.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '6', '5543.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '7', '5643.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '8', '5579.9');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '9', '5543.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '10', '5540.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '11', '5583.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2008', '12', '5841');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '1', '1583.6');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '2', '1842.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '3', '1563.8');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '4', '1443.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '5', '1508.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '6', '1543.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '7', '1643.9');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '8', '1239.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '9', '1743.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '10', '1553.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '11', '1943.5');
INSERT INTO `tbl_salary` VALUES ('10004', '2008', '12', '1812.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '1', '3542.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '2', '3713.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '3', '3541.5');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '4', '3843.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '5', '3513.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '6', '3040.7');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '7', '3543.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '8', '3523.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '9', '3243.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '10', '3527.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '11', '3143.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2008', '12', '3549.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '1', '7543.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '2', '7570.2');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '3', '7543.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '4', '7518.6');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '5', '7543.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '6', '7543.2');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '7', '7593.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '8', '7543.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '9', '7549.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '10', '7563.6');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '11', '7540.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2008', '12', '7510.1');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '1', '6519.1');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '2', '6343.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '3', '6547.5');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '4', '6753.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '5', '6743.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '6', '6541.7');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '7', '6993.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '8', '6507.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '9', '6043.8');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '10', '6943.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '11', '6903.8');
INSERT INTO `tbl_salary` VALUES ('10007', '2008', '12', '6213.5');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '1', '3569.23');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '2', '3643.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '3', '3529.8');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '4', '3523.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '5', '3923.8');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '6', '3544.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '7', '3543.7');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '8', '3013.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '9', '3519.9');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '10', '3313');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '11', '3153');
INSERT INTO `tbl_salary` VALUES ('10008', '2008', '12', '3189.8');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '1', '2829.2');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '2', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '3', '2610.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '4', '2542.5');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '5', '2433.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '6', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '7', '2538.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '8', '2835.6');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '9', '2518.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '10', '2557.36');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '11', '2913.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2008', '12', '2915.35');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '1', '10546.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '2', '10513.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '3', '10240.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '4', '10543.4');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '5', '10243.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '6', '10592.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '7', '10640.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '8', '10540.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '9', '10833.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '10', '10543.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '11', '10040.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2008', '12', '10801.6');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '1', '2830');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '2', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '3', '2122.5');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '4', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '5', '1912.6');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '6', '2143.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '7', '2508.8');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '8', '2943.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '9', '2505.8');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '10', '2703.7');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '11', '2216.6');
INSERT INTO `tbl_salary` VALUES ('10011', '2008', '12', '2731.5');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '1', '12768.6');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '2', '12643.2');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '3', '12471.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '4', '12143');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '5', '12222.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '6', '12243');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '7', '12312.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '8', '12043');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '9', '12843.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '10', '12510.2');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '11', '12643.1');
INSERT INTO `tbl_salary` VALUES ('10012', '2008', '12', '12560.8');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '1', '5546.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '2', '5523.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '3', '5543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '4', '5518.1');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '5', '5643.1');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '6', '5543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '7', '5943.2');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '8', '5549.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '9', '5443.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '10', '5523.8');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '11', '6543.3');
INSERT INTO `tbl_salary` VALUES ('10001', '2009', '12', '5518.9');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '1', '8233.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '2', '8343.13');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '3', '8633.23');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '4', '8723.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '5', '8413.34');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '6', '8533.62');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '7', '8353.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '8', '8283.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '9', '8143.3');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '10', '8673.8');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '11', '8723.9');
INSERT INTO `tbl_salary` VALUES ('10002', '2009', '12', '8833.31');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '1', '6703.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '2', '6542.5');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '3', '6593.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '4', '6843.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '5', '6541.13');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '6', '6543.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '7', '6533');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '8', '6571.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '9', '6243.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '10', '6241.8');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '11', '6573.3');
INSERT INTO `tbl_salary` VALUES ('10003', '2009', '12', '6241.9');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '1', '2591.2');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '2', '2643.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '3', '2986.2');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '4', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '5', '2848.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '6', '2543.7');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '7', '26473.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '8', '2549.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '9', '2353.2');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '10', '2543.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '11', '2213.3');
INSERT INTO `tbl_salary` VALUES ('10004', '2009', '12', '2142.1');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '1', '3811.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '2', '3841.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '3', '3842.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '4', '3553.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '5', '3847.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '6', '3543.7');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '7', '3542.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '8', '3863.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '9', '3541.2');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '10', '3543.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '11', '3743.3');
INSERT INTO `tbl_salary` VALUES ('10005', '2009', '12', '3961.1');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '1', '7805.2');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '2', '7803.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '3', '7873.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '4', '7883.8');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '5', '7865.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '6', '7843.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '7', '782.4');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '8', '7841.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '9', '7843.1');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '10', '7823.3');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '11', '7843.1');
INSERT INTO `tbl_salary` VALUES ('10006', '2009', '12', '7810.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '1', '7519.1');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '2', '7348.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '3', '7547.5');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '4', '7558.4');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '5', '7443.8');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '6', '7541.7');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '7', '7995.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '8', '7507.3');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '9', '7043.2');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '10', '7943.2');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '11', '7903.8');
INSERT INTO `tbl_salary` VALUES ('10007', '2009', '12', '7215.1');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '1', '4169.23');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '2', '4243.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '3', '4529.8');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '4', '3927.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '5', '4783.8');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '6', '3844.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '7', '4543.7');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '8', '4313.3');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '9', '4519.9');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '10', '3813.2');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '11', '4453.2');
INSERT INTO `tbl_salary` VALUES ('10008', '2009', '12', '4189.6');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '1', '3821.2');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '2', '3543');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '3', '3115.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '4', '3542.5');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '5', '3233.8');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '6', '3545.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '7', '2538.8');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '8', '2935.6');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '9', '3513.1');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '10', '2557.9');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '11', '3013.3');
INSERT INTO `tbl_salary` VALUES ('10009', '2009', '12', '3016.8');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '1', '11546.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '2', '11513.1');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '3', '11240');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '4', '10943.4');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '5', '10843.7');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '6', '11592.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '7', '10646.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '8', '10930.1');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '9', '10938.2');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '10', '11523.6');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '11', '10940.3');
INSERT INTO `tbl_salary` VALUES ('10010', '2009', '12', '11209.8');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '1', '3138');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '2', '3043.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '3', '3362.5');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '4', '3245.6');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '5', '3312.7');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '6', '3547.2');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '7', '3608.4');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '8', '3042.1');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '9', '3105.2');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '10', '2902');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '11', '3216.3');
INSERT INTO `tbl_salary` VALUES ('10011', '2009', '12', '3035.6');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '1', '13162.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '2', '13243.5');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '3', '13178.5');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '4', '13343.5');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '5', '13128.8');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '6', '13043.8');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '7', '13612.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '8', '12546.3');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '9', '13345.2');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '10', '13119.1');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '11', '13049.8');
INSERT INTO `tbl_salary` VALUES ('10012', '2009', '12', '13566.3');

-- ----------------------------
-- Table structure for `tbl_testimport1`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_testimport1`;
CREATE TABLE `tbl_testimport1` (
  `no` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `salary` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_testimport1
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_testimport2`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_testimport2`;
CREATE TABLE `tbl_testimport2` (
  `no` varchar(20) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_testimport2
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_zhaoping`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_zhaoping`;
CREATE TABLE `tbl_zhaoping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhiwei` varchar(30) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `xueli` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_zhaoping
-- ----------------------------
INSERT INTO `tbl_zhaoping` VALUES ('1', '网络工程师', '5030', '1', '本科以上');
INSERT INTO `tbl_zhaoping` VALUES ('2', '软件工程师', '6800', '3', '本科以上');
INSERT INTO `tbl_zhaoping` VALUES ('3', '高级会计师', '8000', '1', '硕士以上');
INSERT INTO `tbl_zhaoping` VALUES ('4', '计算机运行维护工程师', '4500', '2', '专科以上');
INSERT INTO `tbl_zhaoping` VALUES ('5', '策划经理', '8200', '1', '本科以上');
INSERT INTO `tbl_zhaoping` VALUES ('6', '质量管理工程师', '5500', '5', '本科以上');
INSERT INTO `tbl_zhaoping` VALUES ('7', '普工', '1200', '20', '无');
INSERT INTO `tbl_zhaoping` VALUES ('8', '厨师', '3000', '2', '无');
INSERT INTO `tbl_zhaoping` VALUES ('9', '项目经理', '8500', '2', '本科以上');

-- ----------------------------
-- Table structure for `tbl_zhaopingdesc`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_zhaopingdesc`;
CREATE TABLE `tbl_zhaopingdesc` (
  `id` int(11) NOT NULL,
  `yaoqiu` varchar(3000) DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_zhaopingdesc
-- ----------------------------
INSERT INTO `tbl_zhaopingdesc` VALUES ('1', '两年以上相关工作经验，工作刻苦，能承受工作压力，能出差', '负责公司网络架构与维护以及网络相关产品的采购');
INSERT INTO `tbl_zhaopingdesc` VALUES ('2', '三年以上相关工作经验，学习能力强，能承受工作压力，能出差', '负责公司所用软件的开发与维护，并培训公司员工使用');
INSERT INTO `tbl_zhaopingdesc` VALUES ('3', '五年以上相关工作经验，思维活跃，认真负责', '负责公司做帐');
INSERT INTO `tbl_zhaopingdesc` VALUES ('4', '工作刻苦，能承受工作压力，能出差', '负责公司所用电脑进行安装与维护');
INSERT INTO `tbl_zhaopingdesc` VALUES ('5', '三年以上相关工作经验，思维活跃，认真负责，责任心强，亲和力强', '负责公司新产品的策划以及公司其它活动的组织和策划');
INSERT INTO `tbl_zhaopingdesc` VALUES ('6', '，认真负责，工作刻苦，能承受工作压力，能出差', '负责公司产品的测试');
INSERT INTO `tbl_zhaopingdesc` VALUES ('7', '工作刻苦，积极肯干，能承受工作压力，服从安排', '负责公司产品的生产');
INSERT INTO `tbl_zhaopingdesc` VALUES ('8', '三年以上相关工作经验，工作刻苦，讲卫生', '负责公司食堂炒菜煮饭');
INSERT INTO `tbl_zhaopingdesc` VALUES ('9', '三年以上相关工作经验，表达能力强，亲和力强', '负责领导公司产品小组的开发与测试');

-- ----------------------------
-- Procedure structure for `sp_selectEmployeeData`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_selectEmployeeData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_selectEmployeeData`(
    txtno varchar(20),
    txtprovince varchar(30),
    txtage varchar(30),
    i_systeminfo varchar(3000),
    out o_systeminfo varchar(50)
)
BEGIN
    declare var_sql varchar(1000);    
    set var_sql='SELECT A.no,name,ename,sex,age,salary,marriage,birthday,joinindate,province,city,county,description FROM tbl_baseinfo A left join tbl_detailinfo B on A.no=B.no where  1=1';
    if txtno<>'' then set var_sql=concat(var_sql,' and A.no like  \'%',txtno,'%\''); end if;
    if txtprovince<>'' then set var_sql=concat(var_sql,' and province like  \'%',txtprovince,'%\''); end if;
    if txtage<>'' then set var_sql=concat(var_sql,' and A.age >=',txtage); end if;
    call SP_WABACUS_EXECUTE (var_sql,'no,name desc',i_systeminfo,o_systeminfo);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `SP_WABACUS_EXECUTE`
-- ----------------------------
DROP PROCEDURE IF EXISTS `SP_WABACUS_EXECUTE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_WABACUS_EXECUTE`(
    i_sql  varchar(3000),
    i_orderby  varchar(200),
    i_systeminfo varchar(3000),
    out o_systeminfo varchar(100)
)
BEGIN
    declare startnum varchar(20);
    declare endnum varchar(20);
    declare pagesize int;/*页面大小，如果是-1，则不分页显示或不是数据自动列表报表*/
    declare filtercolumn varchar(100);
    declare filtercondition varchar(300);
    declare refreshNavigateType varchar(10);
    declare dynorderby varchar(50);
    declare i_orderby_tmp varchar(300);
    declare rowgroupCols varchar(100);
    declare rowgroupColTmp varchar(50);
    declare str1 varchar(300);
    declare str2 varchar(300);
    declare ordertypeTmp varchar(10);
    declare exec_sql varchar(3000);
    declare idx int;
    declare idx2 int;
    set @sql='';
    set filtercondition=FUN_WABACUS_GETPARAMVALUE('filter_condition',i_systeminfo);
    set filtercolumn=FUN_WABACUS_GETPARAMVALUE('filter_column',i_systeminfo);
    if filtercolumn<>'' then /*获取列过滤选项数据*/
	set i_sql=concat('select  distinct ',filtercolumn,' from (',i_sql ,') wx_tbltemp');
  	if filtercondition<>'' then set i_sql=concat(i_sql,' ',filtercondition); end if;/*如果当前在查询选中的列过滤选项数据*/
	/*如果当前是在查询所有列过滤选项数据，则不加上已经选中的列过滤选项做为条件*/
  	set i_sql=concat(i_sql,' order by ',filtercolumn);
	set @sql=i_sql;
    else /*获取报表数据*/
	if filtercondition<>'' then set i_sql=concat('select * from (',i_sql,') wx_tbltemp1 ',filtercondition); end if;/*有过滤条件*/
	set exec_sql=FUN_WABACUS_GETPARAMVALUE('exec_sql',i_systeminfo);
	if exec_sql<>'' then /*客户端传入了要执行的SQL语句（比如查询统计数据）*/
	    set i_sql=replace(exec_sql,'%ORIGINAL_SQL%',i_sql);/*将要执行的SQL语句中的业务SQL语句替换成这里真正的查询业务数据的SQL语句*/
	    set @sql=i_sql;
	else
	    set pagesize=cast(FUN_WABACUS_GETPARAMVALUE('pagesize',i_systeminfo) as signed);/*每页记录数*/
	    set refreshNavigateType=FUN_WABACUS_GETPARAMVALUE('refreshNavigateType',i_systeminfo);
  	    if pagesize>0 and refreshNavigateType='true' then /*分页显示报表，且本次要统计记录数*/
		set @tmp=0;
    	        set @sqlCount=concat('select  count(*) from (',i_sql,')  wx_tbltempcount into @tmp');
	        prepare stmt from @sqlCount;
		execute stmt;
		set o_systeminfo=cast(@tmp as char(20));
		deallocate prepare stmt;
  	    end if;
  	    set dynorderby=FUN_WABACUS_GETPARAMVALUE('dynamic_orderby',i_systeminfo); /*动态排序字段*/
  	    if dynorderby<>'' then set i_orderby=dynorderby; end if;
  	    set rowgroupCols=FUN_WABACUS_GETPARAMVALUE('rowgroup_cols',i_systeminfo);
	    if rowgroupCols<>'' then /*当前是行分组或树形分组显示的报表*/
		/*下面将已有的排序字段,号左右空格去除，并在第一个位置和最后一个位置加上,号，以便后面判断，变成,col1 desc,col2,col3 asc,格式，即前后都有一个,号*/
		set i_orderby_tmp='';
		set i_orderby=ltrim(rtrim(i_orderby));
		set idx=instr(i_orderby,',');
		while idx>0 do
		    set i_orderby_tmp=concat(i_orderby_tmp,ltrim(rtrim(substring(i_orderby,1,idx-1))),',');
		    set i_orderby=ltrim(rtrim(substring(i_orderby,idx+1)));
		    set idx=instr(i_orderby,',');
		end while;
		if i_orderby<>'' then set i_orderby_tmp=concat(i_orderby_tmp,i_orderby,','); end if;
		if substring(i_orderby_tmp,1,1)<>',' then set i_orderby_tmp=concat(',',i_orderby_tmp); end if;/*在起始位置加上,号*/
		/*将行分组列放在排序字段的首位*/
		set i_orderby='';
		while rowgroupCols<>'' and rowgroupCols<>',' do
		    set idx=instr(rowgroupCols,',');
		    if idx>0 then
		        set rowgroupColTmp=ltrim(rtrim(substring(rowgroupCols,1,idx-1)));/*得到参与行分组的列，不包括前面的逗号*/
			set rowgroupCols=ltrim(rtrim(substring(rowgroupCols,idx+1)));
		    else /*后面没有逗号了，说明已经是最后一个分组列字段了*/
			set rowgroupColTmp=rowgroupCols;
			set rowgroupCols='';
		    end if;
		    if rowgroupColTmp<>'' then 
			set ordertypeTmp='asc';/*当前分组列的排序顺序*/
			set idx2=instr(lower(i_orderby_tmp),concat(',',lower(rowgroupColTmp),' ')); /*,col1 asc/desc格式*/
			if idx2<=0 then set idx2=instr(lower(i_orderby_tmp),concat(',',lower(rowgroupColTmp),',')); end if;/*,col1,...格式*/
			if idx2>0 then /*在@i_orderby中已经存在这个分组列做为排序字段*/
			    set str1=substring(i_orderby_tmp,1,idx2-1);/*取到此排序字段前面部分，不包括逗号*/
			    set i_orderby_tmp=substring(i_orderby_tmp,idx2+1);
			    set idx2=instr(i_orderby_tmp,',');
			    if idx2>0 then /*在@i_orderby中此排序列后面还有排序列*/
				set str2=substring(i_orderby_tmp,1,idx2-1);
				set i_orderby_tmp=substring(i_orderby_tmp,idx2);/*这里保留了前面的逗号*/
			    else /*已经是最后一个排序列了*/
				set str2=i_orderby_tmp;
				set i_orderby_tmp='';
			    end if;
			    set i_orderby_tmp=concat(str1,i_orderby_tmp);/*在@i_orderby中删掉此分组列，因为要把它提到前面进行排序*/
			    set idx2=instr(str2,' '); /*@str2中存放的是当前排序字段及排序顺序asc/desc*/
			    if idx2>0 then /*在字段后面指定了排序顺序*/
				set ordertypeTmp=ltrim(rtrim(substring(str2,idx2+1)));
				if ordertypeTmp='' then set ordertypeTmp='asc'; end if;
			    end if;
			end if;
			set i_orderby=concat(i_orderby,rowgroupColTmp,' ',ordertypeTmp,',');
		    end if;
		end while;
		if i_orderby_tmp<>'' then /*将@i_orderby中剩下的部分放入@orderbyNew的后面*/
		    if substring(i_orderby_tmp,1,1)=',' then set i_orderby_tmp=substring(i_orderby_tmp,2); end if;
		    set i_orderby=concat(i_orderby,i_orderby_tmp);
		end if;
		if substring(i_orderby,length(i_orderby))=',' then set i_orderby=substring(i_orderby,1,length(i_orderby)-1); end if;/*删除掉最后面的,号*/
	    end if;
	
	    if i_orderby<>'' then set i_sql=concat('select * from (',i_sql,') wx_tbltmp2 order by ',i_orderby); end if;
	    if pagesize>0 then /*本次是获取某页的记录*/
		set startnum=FUN_WABACUS_GETPARAMVALUE('startrownum',i_systeminfo);/*起始记录号*/
		set endnum=FUN_WABACUS_GETPARAMVALUE('endrownum',i_systeminfo);/*结束记录号*/
		set i_sql=concat(i_sql,' limit ',startnum,',',endnum);
  	    end if;
	    set @sql=i_sql;
        end if;
    end if;
   /*insert testable values(@sql);*/
   prepare stmt2 from @sql;
   execute stmt2;
   deallocate prepare stmt2;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `FUN_WABACUS_GETPARAMVALUE`
-- ----------------------------
DROP FUNCTION IF EXISTS `FUN_WABACUS_GETPARAMVALUE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FUN_WABACUS_GETPARAMVALUE`(
    paramname varchar(100),
    sourcestring varchar(3000)
) RETURNS varchar(2000) CHARSET utf8
BEGIN
    declare val varchar(2000);
    declare idx int;
    set val='';
    if paramname is not null and sourcestring is not null then
        set sourcestring=LTRIM(RTRIM(sourcestring));
        set paramname=LTRIM(RTRIM(paramname));
        if sourcestring<>'' and paramname<>'' then
	    set idx=instr(sourcestring,concat('{[(<',paramname,':'));
	    if idx>0 then 
		set val=substring(sourcestring,idx+length(paramname)+5);
		set idx=instr(val,'>)]}');
		if idx>0 then
		    set val=substring(val,1,idx-1);
		end if;
	    end if;
	end if;
    end if;
    return val;
END
;;
DELIMITER ;
