/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_liaohb
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : nodejs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-06 00:01:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_rule_bak
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule_bak`;
CREATE TABLE `sys_rule_bak` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '键',
  `PathName` varchar(255) NOT NULL COMMENT '路径',
  `Method` enum('option','put','post','delete','get') NOT NULL DEFAULT 'get' COMMENT '方法',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `Content` json DEFAULT NULL COMMENT '规则内容',
  `IsSystem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '规则内容',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `IsTokenAccess` tinyint(1) DEFAULT '0' COMMENT '是否需求tokeny访问',
  `Bewrite` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='系统规则表';

-- ----------------------------
-- Records of sys_rule_bak
-- ----------------------------
INSERT INTO `sys_rule_bak` VALUES ('1', '/webapi/demo', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select * from xtn_userinfo where username = \':username\' and password = \':password\'\", \"name\": \"admininfo\", \"type\": \"query\", \"isRows\": false}, {\"id\": 100, \"sql\": \"select count(1) total, sex,cityname,age from xtn_userinfo where id = :id_judge\", \"name\": \"judgeInfo_100\", \"type\": \"query\", \"isRows\": false, \"isMergeOption\": true}, {\"id\": 10, \"sql\": \"\", \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"用户存在\", \"strByThis\": \"if((this.sex === \'男\' && this.cityname == \'上海\' ) || (this.age > 30 && this.cityname !== \'北京\')){return true;}return false;\", \"strByEval1\": \"(\':sex\' !== \'男\' && \':cityname\' == \'北京\' ) || (:age > 30 && \':cityname\' !== \'北京\')\", \"chilrenRules\": [{\"id\": 11, \"sql\": \"select * from xtn_userinfo where sex = \':sex\'\", \"name\": \"peoples_sex\", \"type\": \"query\", \"isRows\": true}, {\"id\": 12, \"sql\": \"select * from xtn_userinfo where sex = \':sex\' and cityname = \':cityname\' \", \"name\": \"peoples_sex_city\", \"type\": \"query\", \"isRows\": true}]}}, {\"id\": 2, \"sql\": \"select * from xtn_userinfo where id> :id\", \"name\": \"userlist\", \"type\": \"query\", \"isRows\": true}, {\"id\": 3, \"type\": \"beginTran\"}, {\"id\": 4, \"sql\": \"update xtn_userinfo t set t.tel=\':tel\' where t.id = :id1\", \"name\": \"update_info\", \"type\": \"update\", \"isRows\": false}, {\"id\": 5, \"sql\": \"select * from xtn_userinfo where id = :id1\", \"name\": \"id1_info\", \"type\": \"query\", \"isRows\": false}, {\"id\": 6, \"sql\": \"insert into xtn_userinfo(username,password,tel,address) values(uuid_short(),md5(now()),\':tel\',\'哈哈\');\", \"name\": \"InsertNo\", \"type\": \"insert\"}, {\"id\": 7, \"sql\": \"select * from xtn_userinfo t where t.id = :InsertNo\", \"name\": \"insert_result11\", \"type\": \"query\", \"isRows\": false}, {\"id\": 9, \"sql\": \"select count(1) total from xtn_userinfo \", \"name\": \"insert_total1\", \"type\": \"query\", \"isRows\": false}, {\"id\": 10, \"sql\": \"delete from xtn_userinfo where id = :InsertNo - 5\", \"name\": \"delete_result\", \"type\": \"delete\"}, {\"id\": 11, \"type\": \"commit\"}, {\"id\": 13, \"sql\": \"select count(1) total from xtn_userinfo \", \"name\": \"insert_total2\", \"type\": \"query\", \"isRows\": false}], \"fields\": \"username,password,id,tel,id1,id_judge\", \"result\": 1}', '1', '2017-07-09 11:44:41', '0');
INSERT INTO `sys_rule_bak` VALUES ('2', '/webapi/manager/api/list', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from xtn_sys_rule t  where t.status = 1 \\norder by t.id\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"\", \"result\": 1}', '0', '2017-07-16 14:01:56', '1');
INSERT INTO `sys_rule_bak` VALUES ('3', '/webapi/manager/api/info', 'delete', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select count(1) total, IsSystem from sys_rule t where t.id = :Id\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 2, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"系统规则不能删除\", \"strByThis\": \"if(this.IsSystem===1){return false;}return true;\"}}, {\"id\": 3, \"sql\": \"delete from sys_rule where Id = :Id\", \"type\": \"delete\"}], \"fields\": \"Id\", \"result\": 1}', '1', '2017-07-26 00:22:03', '1');
INSERT INTO `sys_rule_bak` VALUES ('4', '/webapi/manager/api/add', 'post', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"\", \"type\": \"judge\", \"judgeInfo\": {\"strByThis\": \"if(this.Id>0){return false;}return true;\", \"resultIndex\": 101, \"chilrenRules\": [{\"id\": 100, \"sql\": \"update sys_rule set PathName = \':PathName\', Method = \':Method\',\\nIsTokenAccess= :IsTokenAccess, Status = :Status, Bewrite = \':Bewrite\',\\nContent = \':RuleInfo\' \\nwhere id = :Id\", \"type\": \"update\", \"judgeInfo\": {}}, {\"id\": 101, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from sys_rule t where t.id = :Id\", \"name\": \"rule_info\", \"type\": \"query\", \"judgeInfo\": {}}]}}, {\"id\": 2, \"sql\": \"select count(1) total,t.id RuleId from sys_rule t where t.PathName = \':PathName\' and t.Method = \':Method\'\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 3, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"已经存在，执行更新操作。\", \"strByThis\": \"if(this.total > 0){return false;} return true\", \"resultIndex\": 301, \"chilrenRules\": [{\"id\": 300, \"sql\": \"update sys_rule set PathName = \':PathName\', Method = \':Method\',\\nIsTokenAccess= :IsTokenAccess, Status = :Status, Bewrite = \':Bewrite\',\\nContent = \':RuleInfo\' \\nwhere id = :RuleId\", \"type\": \"update\", \"judgeInfo\": {}}, {\"id\": 301, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from sys_rule t where t.id = :RuleId\", \"name\": \"rule_info\", \"type\": \"query\", \"judgeInfo\": {}}]}}, {\"id\": 4, \"sql\": \"INSERT INTO sys_rule (PathName,Method,Status,IsTokenAccess,Bewrite,Content)\\nVALUES(\':PathName\', \':Method\', :Status, :IsTokenAccess, \':Bewrite\', \':RuleInfo\')\", \"name\": \"InsertNo\", \"type\": \"insert\"}, {\"id\": 5, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from sys_rule t where t.id = :InsertNo\", \"name\": \"rule_info\", \"type\": \"query\"}], \"fields\": \"PathName,Method,Status,RuleInfo,Id,IsTokenAccess,Bewrite\", \"result\": 5}', '1', '2017-07-28 00:07:15', '1');
INSERT INTO `sys_rule_bak` VALUES ('5', '/webapi/manager/api/info', 'put', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"update xtn_sys_rule set PathName = \':PathName\', Method = \':Method\',\\nIsTokenAccess= :IsTokenAccess, Status = :Status, Bewrite = \':Bewrite\',\\nContent = \':RuleInfo\' \\nwhere id = :Id\", \"type\": \"update\"}, {\"id\": 2, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from xtn_sys_rule t where t.id = :Id\", \"name\": \"rule_info\", \"type\": \"query\"}], \"fields\": \"PathName,Method,Status,RuleInfo,Id,IsTokenAccess,Bewrite\", \"result\": 2}', '1', '2017-07-28 00:09:06', '1');
INSERT INTO `sys_rule_bak` VALUES ('8', '/webapi/userinfo/register', 'post', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select count(1) total from xtn_userinfo t where t.username = \':UserName\'\", \"name\": \"user_total\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 2, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"用户已存在！！\", \"strByEval\": \"\", \"strByThis\": \"if(this.total>0){\\n  return false;\\n}\\nreturn true;\"}}, {\"id\": 20, \"type\": \"beginTran\"}, {\"id\": 3, \"sql\": \"insert into xtn_userinfo\\n(username,password,tel,address,sex,age,cityname) values\\n(\':UserName\',\':Password\',\':Tel\',\':Address\',\'男\',floor( 15 + rand()*50),\'北京\')\", \"name\": \"UserId\", \"type\": \"insert\"}, {\"id\": 4, \"name\": \"fileList\", \"type\": \"files\", \"files\": {\"type\": \"image\", \"Relation\": {\"Fields\": [{\"TabelFieldName\": \"UserId\", \"RelationFieldName\": \"UserId\"}, {\"TabelFieldName\": \"FileId\", \"RelationFieldName\": \"FileId\"}, {\"TabelFieldName\": \"Type\", \"RelationFieldName\": \"图片\"}], \"TableName\": \"xtn_user_file\", \"UploadFieldName\": \"fileCollection\"}, \"filePath\": \"./public/image\", \"Relations\": [{\"Fields\": [{\"TabelFieldName\": \"UserId\", \"RelationFieldName\": \"UserId\"}, {\"TabelFieldName\": \"FileId\", \"RelationFieldName\": \"FileId\"}, {\"TabelFieldName\": \"Type\", \"RelationFieldName\": \"图片\"}], \"TableName\": \"xtn_user_file\", \"UploadFieldName\": \"fileCollection\"}, {\"Fields\": [{\"TabelFieldName\": \"UserId\", \"RelationFieldName\": \"UserId\"}, {\"TabelFieldName\": \"FileId\", \"RelationFieldName\": \"FileId\"}, {\"TabelFieldName\": \"Type\", \"RelationFieldName\": \"头像\"}], \"TableName\": \"xtn_user_file\", \"UploadFieldName\": \"file1\"}]}}, {\"id\": 70, \"type\": \"commit\"}, {\"id\": 5, \"sql\": \"select * from xtn_userinfo t where t.Id = :UserId\", \"name\": \"userinfo\", \"type\": \"query\"}, {\"id\": 6, \"sql\": \"select * from xtn_user_file t where t.UserId = :UserId\", \"name\": \"user_file_list\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"UserName,Password,Tel,Address\", \"result\": 5}', '0', '2017-07-26 00:08:35', '0');
INSERT INTO `sys_rule_bak` VALUES ('10', '/webapi/userinfo/login_test', 'post', '0', '{\"rules\": [{\"id\": 1, \"sql\": \"select count(1) total,id,concat(\'xtn_\',md5(username),\'_\',md5(password))token, username,sex,cityname,age from xtn_userinfo t where t.username = \':username\' and t.password = \':password\'\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 2, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"用户名或密码不正确\", \"strByEval\": \"\", \"strByThis\": \"if(this.total<=0){return false;}return true\"}}, {\"id\": 3, \"sql\": \"delete from sys_session where token = \':token\' ;\", \"type\": \"delete\"}, {\"id\": 4, \"sql\": \"insert into sys_session(token,UserId,deadline)values(\':token\',:id, date_add( current_timestamp,interval 1 month)) ; \", \"type\": \"insert\"}], \"fields\": \"username,password\", \"result\": 1}', '0', '2017-07-27 23:55:02', '0');
INSERT INTO `sys_rule_bak` VALUES ('13', '/webapi/base/AreaById', 'get', '0', '{\"rules\": [{\"id\": 1, \"sql\": \"select t.AreaId,t.ParentId,t.AreaName from xtn_base_area t where t.ParentId = :Id\", \"name\": \"AreaList\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"Id\", \"result\": 1}', '0', '2017-07-30 10:06:42', '0');
INSERT INTO `sys_rule_bak` VALUES ('14', '/webapi/map/place', 'post', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"insert into xtn_map_place\\n(userId,Latitude,Longitude,BeginDate,EndDate,Address,Bewrite ,Name,InviteCode)\\nvalues\\n(:tokenUserId,\':Latitude\',\':Longitude\',\':BeginDate\',\':EndDate\',\':Address\', \':Bewrite\', \':Name\',xtn_invite_code(6))\", \"name\": \"InsertNo\", \"type\": \"insert\"}, {\"id\": 2, \"sql\": \"select * from xtn_map_place t where t.id = :InsertNo\", \"name\": \"map_place\", \"type\": \"query\"}], \"fields\": \"Address,BeginDate,EndDate,Latitude,Longitude,Name,Bewrite\", \"result\": 2}', '0', '2017-08-01 00:36:48', '1');
INSERT INTO `sys_rule_bak` VALUES ('15', '/webapi/map/placelist', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select t.BeginDate ,t.EndDate, t.Id,t.UserId,t.Latitude,t.Longitude,t.Address,t.InviteCode,t.Bewrite,t.Name \\nfrom xtn_map_place t where t.userId = :tokenUserId order by t.EndDate desc\", \"name\": \"PlaceList\", \"type\": \"query\", \"isRows\": true}, {\"id\": 2, \"sql\": \"select ui.username, a.* from (\\n  select p.UserId pUserId, pj.* from xtn_map_place_join pj \\n  inner join xtn_map_place p on pj.PlaceId = p.Id and p.UserId = :tokenUserId\\n) a \\ninner join xtn_userinfo ui on ui.id = a.UserId\\nwhere (select count(*) from xtn_map_place_join where PlaceId=a.PlaceId\\n and CreateDate >=a.CreateDate ) <=9\\norder by a.PlaceId,a.createdate\", \"name\": \"PlaceJoinList\", \"type\": \"query\", \"isRows\": true, \"parentRelation\": {\"parent\": {}, \"children\": {}}}, {\"id\": 3, \"type\": \"parentrelation\", \"childrenField\": \"PlaceId \", \"parentRelation\": {\"name\": \"PeopleList\", \"fields\": [{\"parentField\": \"Id\", \"childrenField\": \"PlaceId\"}], \"parent\": {\"id\": 1}, \"children\": {\"id\": 2}, \"parentId\": 1, \"childrenId\": 2}}], \"result\": 1}', '0', '2017-08-01 13:52:00', '1');
INSERT INTO `sys_rule_bak` VALUES ('16', '/webapi/userinfo/login', 'post', '1', '{\"rules\": [{\"id\": 1, \"type\": \"captcha\", \"captcha\": {\"fail\": \"验证码输入不正确\", \"field\": \"captcha\", \"timeout\": \"timeout\"}}, {\"id\": 2, \"sql\": \"select count(1) total,id,concat(\'xtn_\',md5(username),\'_\',md5(password))token, username,sex,cityname,age from xtn_userinfo t where t.username = \':username\' and t.password = \':password\'\", \"name\": \"userinfo\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 3, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"用户名或密码不正确。\", \"strByThis\": \"if(this.total === 0){\\n   return false ;\\n}else{\\n   return true;\\n}\"}}, {\"id\": 4, \"sql\": \"delete from sys_session where token = \':token\' ;\", \"type\": \"delete\"}, {\"id\": 5, \"sql\": \"insert into sys_session(token,UserId,deadline)values(\':token\',:id, date_add( current_timestamp,interval 1 month)) ; \", \"name\": \"InsertNo\", \"type\": \"insert\"}, {\"id\": 6, \"sql\": \"select t.UserId as tokenUserId,t.deadline from sys_session t where t.id = :InsertNo\", \"name\": \"sessioninfo\", \"type\": \"query\", \"cacheInfo\": {\"token\": \"token\", \"fields\": \"UserId,\"}, \"isMergeOption\": true}, {\"id\": 7, \"type\": \"captcha\", \"captcha\": {\"field\": \"captcha\", \"isDelete\": true}}, {\"id\": 8, \"type\": \"cache\", \"cacheInfo\": {\"token\": \"token\", \"fields\": \"tokenUserId,deadline\"}}], \"fields\": \"username,password,captcha\", \"result\": 2}', '0', '2017-08-02 23:33:01', '0');
INSERT INTO `sys_rule_bak` VALUES ('17', '/webapi/common/area', 'get', '1', '{\"rules\": [{\"id\": 1, \"type\": \"setvalue\", \"setValues\": [{\"setValue\": \":PageIndex * :PageSize\", \"fieldName\": \"Begin\"}, {\"setValue\": \":PageSize\", \"fieldName\": \"End\"}]}, {\"id\": 2, \"sql\": \"select * from xtn_base_area t limit :Begin, :End\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"PageIndex,PageSize\", \"result\": 2}', '0', '2017-08-03 22:39:49', '0');
INSERT INTO `sys_rule_bak` VALUES ('18', '/webapi/map/joinplace', 'post', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select count(1) total,t.EndDate- unix_timestamp(now())*1000 diffDate,\\nt.* from xtn_map_place t where t.InviteCode = \':InviteCode\'\", \"name\": \"PlaceInfo\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 2, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"没有找到此活动\", \"strByThis\": \"if( this.total === 0){\\n   return false;\\n}else{\\n   return true;\\n}\"}}, {\"id\": 3, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"活动已结束了。\", \"strByThis\": \"if(this.diffDate < 0 ){\\n   return false;\\n}\\nreturn true;\"}}, {\"id\": 4, \"sql\": \"select count(1) placeExist from xtn_map_place_join t where t.placeId = :Id and t.userId = :tokenUserId\", \"type\": \"query\", \"judgeInfo\": {}, \"isMergeOption\": true}, {\"id\": 5, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"你已经加入了\", \"strByThis\": \"if( this.placeExist > 0){\\n   return false;\\n}\\nreturn true;\"}}, {\"id\": 6, \"sql\": \"INSERT INTO xtn_map_place_join\\n(`PlaceId`,`UserId`,`Status`,`UpdateDate`)\\nVALUES(:Id,:tokenUserId,1,now());\", \"name\": \"InsertNoJoin\", \"type\": \"insert\"}, {\"id\": 7, \"sql\": \"select * from xtn_map_place_join t where t.id = :InsertNoJoin\", \"type\": \"query\"}], \"fields\": \"InviteCode\", \"result\": 7}', '0', '2017-08-05 00:57:03', '1');
INSERT INTO `sys_rule_bak` VALUES ('19', '/webapi/userinfo/users', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select * from xtn_userinfo t order by t.id\", \"type\": \"query\", \"isRows\": true}], \"result\": 1}', '0', '2017-08-05 21:35:45', '1');
INSERT INTO `sys_rule_bak` VALUES ('20', '/webapi/map/joinplacedetail', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select * from xtn_map_place_join t where t.PlaceId = :PlaceId\", \"name\": \"PeopleList\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"PlaceId\", \"result\": 1}', '0', '2017-08-06 12:53:45', '1');
INSERT INTO `sys_rule_bak` VALUES ('21', '/webapi/map/place/join/detail', 'put', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"update xtn_map_place_join set Latitude=:Latitude,Longitude=:Longitude,UpdateDate=now() where UserId = :tokenUserId and PlaceId = :PlaceId\", \"name\": \"PlaceJoinDetail\", \"type\": \"update\", \"isRows\": true}, {\"id\": 2, \"sql\": \"select * from xtn_map_place_join where UserId = :tokenUserId and PlaceId = :PlaceId\", \"name\": \"placejoin\", \"type\": \"query\"}], \"fields\": \"PlaceId,Latitude,Longitude\", \"result\": 2}', '0', '2017-08-06 13:13:05', '1');

-- ----------------------------
-- Table structure for sys_session_bak
-- ----------------------------
DROP TABLE IF EXISTS `sys_session_bak`;
CREATE TABLE `sys_session_bak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` int(11) NOT NULL COMMENT '用户ID',
  `token` varchar(150) NOT NULL COMMENT 'token',
  `deadline` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='会话表，这个可以放到radis里去。';

-- ----------------------------
-- Records of sys_session_bak
-- ----------------------------
INSERT INTO `sys_session_bak` VALUES ('32', '70', 'xtn_c1f68ec06b490b3ecb4066b1b13a9ee9_9db06bcff9248837f86d1a6bcf41c9e7', '2017-09-05 22:52:10');
INSERT INTO `sys_session_bak` VALUES ('39', '69', 'xtn_098f6bcd4621d373cade4e832627b4f6_fb469d7ef430b0baf0cab6c436e70375', '2017-09-12 18:24:13');
INSERT INTO `sys_session_bak` VALUES ('42', '68', 'xtn_21232f297a57a5a743894a0e4a801fc3_c3284d0f94606de1fd2af172aba15bf3', '2017-10-03 09:40:33');

-- ----------------------------
-- Table structure for xtn_base_area
-- ----------------------------
DROP TABLE IF EXISTS `xtn_base_area`;
CREATE TABLE `xtn_base_area` (
  `AreaId` int(10) unsigned NOT NULL,
  `ParentId` int(10) NOT NULL,
  `AreaName` varchar(100) DEFAULT NULL,
  `AreaLevel` smallint(8) DEFAULT NULL,
  `IsLast` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`AreaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省、市、区表';

-- ----------------------------
-- Records of xtn_base_area
-- ----------------------------
INSERT INTO `xtn_base_area` VALUES ('0', '-1', '中国', '0', '0');
INSERT INTO `xtn_base_area` VALUES ('11', '0', '北京市', '1', '0');
INSERT INTO `xtn_base_area` VALUES ('12', '0', '天津市', '1', '0');
INSERT INTO `xtn_base_area` VALUES ('13', '0', '河北省', '1', '0');
INSERT INTO `xtn_base_area` VALUES ('14', '0', '山西', '1', '0');
INSERT INTO `xtn_base_area` VALUES ('15', '0', '内蒙古自治区', '1', '0');
INSERT INTO `xtn_base_area` VALUES ('21', '0', '辽宁省', '1', '0');

-- ----------------------------
-- Table structure for xtn_deps
-- ----------------------------
DROP TABLE IF EXISTS `xtn_deps`;
CREATE TABLE `xtn_deps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(100) unsigned NOT NULL DEFAULT '1' COMMENT '父ID',
  `depname` varchar(100) NOT NULL COMMENT '部门名称',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of xtn_deps
-- ----------------------------

-- ----------------------------
-- Table structure for xtn_map_place
-- ----------------------------
DROP TABLE IF EXISTS `xtn_map_place`;
CREATE TABLE `xtn_map_place` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` int(11) NOT NULL COMMENT '用户ID',
  `Name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `InviteCode` varchar(10) DEFAULT NULL COMMENT '邀请码、随机码',
  `Latitude` decimal(18,6) DEFAULT NULL COMMENT '纬度',
  `Longitude` decimal(18,6) DEFAULT NULL COMMENT '经度',
  `Address` varchar(150) DEFAULT NULL COMMENT '地址',
  `Bewrite` varchar(500) DEFAULT NULL COMMENT '描述',
  `BeginDate` bigint(20) DEFAULT NULL COMMENT '开始时间',
  `EndDate` bigint(20) DEFAULT NULL COMMENT '结束时间',
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtn_map_place
-- ----------------------------
INSERT INTO `xtn_map_place` VALUES ('8', '68', '哈哈', 'wRrHGs', '39.914889', '116.403874', '北京市东城区中华路甲10号', '北京市东城区中华路甲10号', '1501545600000', '1501668000000', '2017-08-01 11:18:15');
INSERT INTO `xtn_map_place` VALUES ('9', '68', '测试名称', 'UeDR3G', '39.936911', '116.399562', '北京市西城区恭俭四巷3号', '北京市西城区恭俭四巷3号', '1501545600000', '1501668000000', '2017-08-01 11:18:42');
INSERT INTO `xtn_map_place` VALUES ('10', '68', '看看了', 'u54RTU', '39.963019', '116.422128', '北京市东城区安定门外大街甲2号', '北京市东城区安定门外大街甲2号', '1501545600000', '1501668000000', '2017-08-01 11:19:04');
INSERT INTO `xtn_map_place` VALUES ('11', '68', '好了呢', 'nP3NDH', '39.946316', '116.432045', '北京市东城区东直门南小街7-1号', '北京市东城区东直门南小街7-1号', '1501545600000', '1501668000000', '2017-08-01 12:47:03');
INSERT INTO `xtn_map_place` VALUES ('12', '68', '好了没有呢', 'PVmjn8', '40.018187', '116.381740', '北京市朝阳区林萃路47号', '北京市朝阳区林萃路47号', '1503100800000', '1503223200000', '2017-08-01 13:06:22');
INSERT INTO `xtn_map_place` VALUES ('13', '68', '逛庄园', 'd2VzmL', '39.995639', '116.524319', '北京市朝阳区庄园北路', '北京市朝阳区庄园北路', '1503273600000', '1503396000000', '2017-08-01 13:06:41');
INSERT INTO `xtn_map_place` VALUES ('14', '68', '逛故宫了', 'A9eK3Y', '39.914889', '116.403874', '北京市东城区中华路甲10号', '大家带些吃，喝的什么的，里面买东西很贵的。', '1501545600000', '1501668000000', '2017-08-01 14:24:49');
INSERT INTO `xtn_map_place` VALUES ('15', '68', '足球比赛国安VS恒大', 'XNaKFc', '39.938903', '116.455473', '北京市朝阳区工人体育场北路', '多带点水呀，带小喇叭到时候一起呐喊，加油~~', '1501545600000', '1501668000000', '2017-08-01 14:26:48');
INSERT INTO `xtn_map_place` VALUES ('16', '68', '摄影比赛啦', 'qGDfEU', '39.945430', '116.487668', '北京市朝阳区朝阳公园南路1号', '小心，到时候人多。', '1503100800000', '1503136800000', '2017-08-01 14:27:44');
INSERT INTO `xtn_map_place` VALUES ('18', '68', '河边烧烤', 'gHyuED', '39.955525', '116.790972', '河北省廊坊市三河市燕顺路', '河边烧烤，一定要注意安全', '1503705600000', '1503828000000', '2017-08-01 23:34:57');
INSERT INTO `xtn_map_place` VALUES ('19', '68', 'test', 'tvZgbY', '39.518611', '116.703602', '河北省廊坊市安次区光明西道88号', 'test', '1501977600000', '1502100000000', '2017-08-06 21:53:30');

-- ----------------------------
-- Table structure for xtn_map_place_join
-- ----------------------------
DROP TABLE IF EXISTS `xtn_map_place_join`;
CREATE TABLE `xtn_map_place_join` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `PlaceId` int(11) NOT NULL COMMENT '活动ID',
  `UserId` int(11) NOT NULL COMMENT '用户ID',
  `Latitude` decimal(18,9) DEFAULT NULL COMMENT '纬度',
  `Longitude` decimal(18,9) DEFAULT NULL COMMENT '经度',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1-正常；0-退出',
  `UpdateDate` datetime DEFAULT NULL COMMENT '更新时间',
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='加入活动表';

-- ----------------------------
-- Records of xtn_map_place_join
-- ----------------------------
INSERT INTO `xtn_map_place_join` VALUES ('5', '12', '68', null, null, '1', '2017-08-05 09:24:03', '2017-08-05 09:24:03');
INSERT INTO `xtn_map_place_join` VALUES ('6', '12', '69', null, null, '1', '2017-08-05 10:00:22', '2017-08-05 10:00:22');
INSERT INTO `xtn_map_place_join` VALUES ('7', '16', '69', null, null, '1', '2017-08-05 10:16:00', '2017-08-05 10:16:00');
INSERT INTO `xtn_map_place_join` VALUES ('8', '16', '68', null, null, '1', '2017-08-05 10:16:22', '2017-08-05 10:16:22');
INSERT INTO `xtn_map_place_join` VALUES ('9', '18', '69', null, null, '1', '2017-08-05 10:16:41', '2017-08-05 10:16:41');
INSERT INTO `xtn_map_place_join` VALUES ('10', '18', '68', null, null, '1', '2017-08-05 10:16:45', '2017-08-05 10:16:45');
INSERT INTO `xtn_map_place_join` VALUES ('11', '12', '70', null, null, '1', '2017-08-05 12:55:57', '2017-08-05 12:55:57');
INSERT INTO `xtn_map_place_join` VALUES ('12', '13', '70', null, null, '1', '2017-08-05 12:56:47', '2017-08-05 12:56:47');
INSERT INTO `xtn_map_place_join` VALUES ('13', '16', '70', null, null, '1', '2017-08-05 12:56:57', '2017-08-05 12:56:57');
INSERT INTO `xtn_map_place_join` VALUES ('14', '18', '70', null, null, '1', '2017-08-05 12:57:03', '2017-08-05 12:57:03');
INSERT INTO `xtn_map_place_join` VALUES ('15', '13', '68', null, null, '1', '2017-08-05 12:58:23', '2017-08-05 12:58:23');
INSERT INTO `xtn_map_place_join` VALUES ('16', '18', '71', null, null, '1', '2017-08-05 21:36:42', '2017-08-05 21:36:42');
INSERT INTO `xtn_map_place_join` VALUES ('17', '18', '72', null, null, '1', '2017-08-05 21:38:06', '2017-08-05 21:38:06');

-- ----------------------------
-- Table structure for xtn_rule
-- ----------------------------
DROP TABLE IF EXISTS `xtn_rule`;
CREATE TABLE `xtn_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rulename` varchar(100) NOT NULL COMMENT '角色名称',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '角色状态',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of xtn_rule
-- ----------------------------

-- ----------------------------
-- Table structure for xtn_sys_file
-- ----------------------------
DROP TABLE IF EXISTS `xtn_sys_file`;
CREATE TABLE `xtn_sys_file` (
  `FileId` int(11) NOT NULL AUTO_INCREMENT,
  `FileType` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `FileName` varchar(150) DEFAULT NULL COMMENT '文件名称',
  `FilePath` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `FileSize` int(11) DEFAULT NULL COMMENT '文件大小',
  `Status` tinyint(1) DEFAULT '1',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`FileId`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='文件系统表';

-- ----------------------------
-- Records of xtn_sys_file
-- ----------------------------
INSERT INTO `xtn_sys_file` VALUES ('51', 'image/png', '1111.png', 'public\\image\\2017\\8\\1503167960421_1111.png', '229', '1', '2017-08-20 02:39:20');
INSERT INTO `xtn_sys_file` VALUES ('52', 'text/plain', 'a.txt', 'public\\image\\2017\\8\\1503167960421_a.txt', '4', '1', '2017-08-20 02:39:20');
INSERT INTO `xtn_sys_file` VALUES ('53', 'image/png', '1112.png', 'public\\image\\2017\\8\\1503167960421_1112.png', '296', '1', '2017-08-20 02:39:20');
INSERT INTO `xtn_sys_file` VALUES ('54', 'image/png', '1111.png', 'public\\image\\2017\\8\\1503168098514_1111.png', '229', '1', '2017-08-20 02:41:38');
INSERT INTO `xtn_sys_file` VALUES ('55', 'text/plain', 'a.txt', 'public\\image\\2017\\8\\1503168098514_a.txt', '4', '1', '2017-08-20 02:41:38');
INSERT INTO `xtn_sys_file` VALUES ('56', 'image/png', '1112.png', 'public\\image\\2017\\8\\1503168098514_1112.png', '296', '1', '2017-08-20 02:41:38');
INSERT INTO `xtn_sys_file` VALUES ('57', 'image/png', '1.png', 'public\\image\\2017\\8\\1503168098514_1.png', '21097', '1', '2017-08-20 02:41:38');
INSERT INTO `xtn_sys_file` VALUES ('58', 'image/png', '1112.png', 'public\\image\\2017\\8\\1503200840114_1112.png', '296', '1', '2017-08-20 11:47:40');
INSERT INTO `xtn_sys_file` VALUES ('59', 'image/png', '1112.png', 'public\\image\\2017\\8\\1503201088550_1112.png', '296', '1', '2017-08-20 11:51:28');
INSERT INTO `xtn_sys_file` VALUES ('60', 'image/png', '1111.png', 'public\\image\\2017\\8\\1503201822822_1111.png', '229', '1', '2017-08-20 12:04:24');
INSERT INTO `xtn_sys_file` VALUES ('61', 'image/png', '1112.png', 'public\\image\\2017\\8\\1503201822822_1112.png', '296', '1', '2017-08-20 12:04:24');
INSERT INTO `xtn_sys_file` VALUES ('62', 'text/plain', 'a.txt', 'public\\image\\2017\\8\\1503201916633_a.txt', '4', '1', '2017-08-20 12:05:47');
INSERT INTO `xtn_sys_file` VALUES ('63', 'image/png', '1112.png', 'public\\image\\2017\\8\\1503202063851_1112.png', '296', '1', '2017-08-20 12:08:06');
INSERT INTO `xtn_sys_file` VALUES ('64', 'text/plain', 'a.txt', 'public\\image\\2017\\8\\1503202063851_a.txt', '4', '1', '2017-08-20 12:08:06');
INSERT INTO `xtn_sys_file` VALUES ('65', 'image/png', '1111.png', 'public\\image\\2017\\8\\1503202063851_1111.png', '229', '1', '2017-08-20 12:08:06');
INSERT INTO `xtn_sys_file` VALUES ('66', 'image/png', '1111.png', 'public\\image\\2017\\8\\1503202302768_1111.png', '229', '1', '2017-08-20 12:13:53');
INSERT INTO `xtn_sys_file` VALUES ('67', 'image/png', '1112.png', 'public\\image\\2017\\8\\1503202302768_1112.png', '296', '1', '2017-08-20 12:13:53');
INSERT INTO `xtn_sys_file` VALUES ('68', 'text/plain', 'a.txt', 'public\\image\\2017\\8\\1503202302768_a.txt', '4', '1', '2017-08-20 12:13:53');
INSERT INTO `xtn_sys_file` VALUES ('69', 'image/png', '1111.png', 'public\\image\\2017\\8\\1503202624953_1111.png', '229', '1', '2017-08-20 12:17:04');
INSERT INTO `xtn_sys_file` VALUES ('70', 'image/png', '1112.png', 'public\\image\\2017\\8\\1503202624953_1112.png', '296', '1', '2017-08-20 12:17:04');
INSERT INTO `xtn_sys_file` VALUES ('71', 'text/plain', 'a.txt', 'public\\image\\2017\\8\\1503202624953_a.txt', '4', '1', '2017-08-20 12:17:04');
INSERT INTO `xtn_sys_file` VALUES ('72', 'image/png', '1111.png', 'public\\image\\2017\\9\\1504320536093_1111.png', '229', '1', '2017-09-02 10:48:56');
INSERT INTO `xtn_sys_file` VALUES ('73', 'image/png', '1112.png', 'public\\image\\2017\\9\\1504320536093_1112.png', '296', '1', '2017-09-02 10:48:56');
INSERT INTO `xtn_sys_file` VALUES ('74', 'image/jpeg', 'QQ截图20170827182314.jpg', 'public\\image\\2017\\9\\1504320536093_QQ截图20170827182314.jpg', '14410', '1', '2017-09-02 10:48:56');
INSERT INTO `xtn_sys_file` VALUES ('75', 'image/jpeg', 'QQ截图20170827182314.jpg', 'public\\image\\2017\\9\\1504320536093_QQ截图20170827182314.jpg', '14410', '1', '2017-09-02 10:48:56');
INSERT INTO `xtn_sys_file` VALUES ('80', 'image/png', '1111.png', 'public\\image\\2017\\9\\1504321645210_1111.png', '229', '1', '2017-09-02 11:07:25');
INSERT INTO `xtn_sys_file` VALUES ('81', 'image/png', '1112.png', 'public\\image\\2017\\9\\1504321645210_1112.png', '296', '1', '2017-09-02 11:07:25');
INSERT INTO `xtn_sys_file` VALUES ('82', 'image/jpeg', 'QQ截图20170827182314.jpg', 'public\\image\\2017\\9\\1504321645210_QQ截图20170827182314.jpg', '14410', '1', '2017-09-02 11:07:25');
INSERT INTO `xtn_sys_file` VALUES ('83', 'image/jpeg', 'QQ截图20170827182314.jpg', 'public\\image\\2017\\9\\1504321645210_QQ截图20170827182314.jpg', '14410', '1', '2017-09-02 11:07:25');
INSERT INTO `xtn_sys_file` VALUES ('84', 'image/png', '1111.png', 'public\\image\\2017\\9\\1504322459408_902_1111.png', '229', '1', '2017-09-02 11:20:59');
INSERT INTO `xtn_sys_file` VALUES ('85', 'image/png', '1112.png', 'public\\image\\2017\\9\\1504322459408_932_1112.png', '296', '1', '2017-09-02 11:20:59');
INSERT INTO `xtn_sys_file` VALUES ('86', 'image/jpeg', 'QQ截图20170827182314.jpg', 'public\\image\\2017\\9\\1504322459408_559_QQ截图20170827182314.jpg', '14410', '1', '2017-09-02 11:20:59');
INSERT INTO `xtn_sys_file` VALUES ('87', 'image/jpeg', 'QQ截图20170827182314.jpg', 'public\\image\\2017\\9\\1504322459408_359_QQ截图20170827182314.jpg', '14410', '1', '2017-09-02 11:20:59');

-- ----------------------------
-- Table structure for xtn_sys_rule
-- ----------------------------
DROP TABLE IF EXISTS `xtn_sys_rule`;
CREATE TABLE `xtn_sys_rule` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '键',
  `PathName` varchar(255) NOT NULL COMMENT '路径',
  `Method` enum('option','put','post','delete','get') NOT NULL DEFAULT 'get' COMMENT '方法',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `Content` json DEFAULT NULL COMMENT '规则内容',
  `IsSystem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '规则内容',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `IsTokenAccess` tinyint(1) DEFAULT '0' COMMENT '是否需求tokeny访问',
  `Bewrite` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='系统规则表';

-- ----------------------------
-- Records of xtn_sys_rule
-- ----------------------------
INSERT INTO `xtn_sys_rule` VALUES ('1', '/webapi/demo', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select * from xtn_userinfo where username = \':username\' and password = \':password\'\", \"name\": \"admininfo\", \"type\": \"query\", \"isRows\": false}, {\"id\": 100, \"sql\": \"select count(1) total, sex,cityname,age from xtn_userinfo where id = :id_judge\", \"name\": \"judgeInfo_100\", \"type\": \"query\", \"isRows\": false, \"isMergeOption\": true}, {\"id\": 10, \"sql\": \"\", \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"用户存在\", \"strByThis\": \"if((this.sex === \'男\' && this.cityname == \'上海\' ) || (this.age > 30 && this.cityname !== \'北京\')){return true;}return false;\", \"strByEval1\": \"(\':sex\' !== \'男\' && \':cityname\' == \'北京\' ) || (:age > 30 && \':cityname\' !== \'北京\')\", \"chilrenRules\": [{\"id\": 11, \"sql\": \"select * from xtn_userinfo where sex = \':sex\'\", \"name\": \"peoples_sex\", \"type\": \"query\", \"isRows\": true}, {\"id\": 12, \"sql\": \"select * from xtn_userinfo where sex = \':sex\' and cityname = \':cityname\' \", \"name\": \"peoples_sex_city\", \"type\": \"query\", \"isRows\": true}]}}, {\"id\": 2, \"sql\": \"select * from xtn_userinfo where id> :id\", \"name\": \"userlist\", \"type\": \"query\", \"isRows\": true}, {\"id\": 3, \"type\": \"beginTran\"}, {\"id\": 4, \"sql\": \"update xtn_userinfo t set t.tel=\':tel\' where t.id = :id1\", \"name\": \"update_info\", \"type\": \"update\", \"isRows\": false}, {\"id\": 5, \"sql\": \"select * from xtn_userinfo where id = :id1\", \"name\": \"id1_info\", \"type\": \"query\", \"isRows\": false}, {\"id\": 6, \"sql\": \"insert into xtn_userinfo(username,password,tel,address) values(uuid_short(),md5(now()),\':tel\',\'哈哈\');\", \"name\": \"InsertNo\", \"type\": \"insert\"}, {\"id\": 7, \"sql\": \"select * from xtn_userinfo t where t.id = :InsertNo\", \"name\": \"insert_result11\", \"type\": \"query\", \"isRows\": false}, {\"id\": 9, \"sql\": \"select count(1) total from xtn_userinfo \", \"name\": \"insert_total1\", \"type\": \"query\", \"isRows\": false}, {\"id\": 10, \"sql\": \"delete from xtn_userinfo where id = :InsertNo - 5\", \"name\": \"delete_result\", \"type\": \"delete\"}, {\"id\": 11, \"type\": \"commit\"}, {\"id\": 13, \"sql\": \"select count(1) total from xtn_userinfo \", \"name\": \"insert_total2\", \"type\": \"query\", \"isRows\": false}], \"fields\": \"username,password,id,tel,id1,id_judge\", \"result\": 1}', '1', '2017-07-09 11:44:41', '0');
INSERT INTO `xtn_sys_rule` VALUES ('2', '/webapi/manager/api/list', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from xtn_sys_rule t  where t.isSystem = 0 and t.status = 1 \\norder by t.id\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"\", \"result\": 1}', '0', '2017-07-16 14:01:56', '1');
INSERT INTO `xtn_sys_rule` VALUES ('3', '/webapi/manager/api/info', 'delete', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select count(1) total, IsSystem from xtn_sys_rule t where t.id = :Id\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 2, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"系统规则不能删除\", \"strByThis\": \"if(this.IsSystem === 1){\\n  return false;\\n}\\nreturn true;\"}}, {\"id\": 3, \"sql\": \"delete from xtn_sys_rule where Id = :Id\", \"type\": \"delete\"}], \"fields\": \"Id\", \"result\": 1}', '0', '2017-07-26 00:22:03', '1');
INSERT INTO `xtn_sys_rule` VALUES ('4', '/webapi/manager/api/add', 'post', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"\", \"type\": \"judge\", \"judgeInfo\": {\"strByThis\": \"if( this.Id > 0 ){\\n  return false;\\n}\\nreturn true;\", \"resultIndex\": 101, \"chilrenRules\": [{\"id\": 100, \"sql\": \"update xtn_sys_rule set PathName = \':PathName\', Method = \':Method\',\\nIsTokenAccess= :IsTokenAccess, Status = :Status, Bewrite = \':Bewrite\',\\nContent = \':RuleInfo\' \\nwhere id = :Id\", \"type\": \"update\", \"judgeInfo\": {}}, {\"id\": 101, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from xtn_sys_rule t where t.id = :Id\", \"name\": \"rule_info\", \"type\": \"query\", \"judgeInfo\": {}}]}}, {\"id\": 2, \"sql\": \"select count(1) total,t.id RuleId from xtn_sys_rule t where t.PathName = \':PathName\' and t.Method = \':Method\'\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 3, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"已经存在，执行更新操作。\", \"strByThis\": \"if(this.total > 0){\\n  return false;\\n}\\nreturn true\", \"resultIndex\": 301, \"chilrenRules\": [{\"id\": 300, \"sql\": \"update xtn_sys_rule set PathName = \':PathName\', Method = \':Method\',\\nIsTokenAccess= :IsTokenAccess, Status = :Status, Bewrite = \':Bewrite\',\\nContent = \':RuleInfo\' \\nwhere id = :RuleId\", \"type\": \"update\", \"judgeInfo\": {}}, {\"id\": 301, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from xtn_sys_rule t where t.id = :RuleId\", \"name\": \"rule_info\", \"type\": \"query\", \"judgeInfo\": {}}]}}, {\"id\": 4, \"sql\": \"INSERT INTO xtn_sys_rule (PathName,Method,Status,IsTokenAccess,Bewrite,Content)\\nVALUES(\':PathName\', \':Method\', :Status, :IsTokenAccess, \':Bewrite\', \':RuleInfo\')\", \"name\": \"InsertNo\", \"type\": \"insert\"}, {\"id\": 5, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from xtn_sys_rule t where t.id = :InsertNo\", \"name\": \"rule_info\", \"type\": \"query\"}], \"fields\": \"PathName,Method,Status,RuleInfo,Id,IsTokenAccess,Bewrite\", \"result\": 5}', '0', '2017-07-28 00:07:15', '1');
INSERT INTO `xtn_sys_rule` VALUES ('5', '/webapi/manager/api/info', 'put', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"update xtn_sys_rule set PathName = \':PathName\', Method = \':Method\',\\nIsTokenAccess= :IsTokenAccess, Status = :Status, Bewrite = \':Bewrite\',\\nContent = \':RuleInfo\' \\nwhere id = :Id\", \"type\": \"update\"}, {\"id\": 2, \"sql\": \"select \\n(case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,\\n(case t.Method when \'get\' then \'查询\' when \'post\' then \'添加\' when \'put\' then \'修改\' else \'删除\' end) MethodCn,\\nt.* from xtn_sys_rule t where t.id = :Id\", \"name\": \"rule_info\", \"type\": \"query\"}], \"fields\": \"PathName,Method,Status,RuleInfo,Id,IsTokenAccess,Bewrite\", \"result\": 2}', '0', '2017-07-28 00:09:06', '1');
INSERT INTO `xtn_sys_rule` VALUES ('6', '/webapi/userinfo/register', 'post', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select count(1) total from xtn_userinfo t where t.username = \':UserName\'\", \"name\": \"user_total\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 2, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"用户已存在！！\", \"strByEval\": \"\", \"strByThis\": \"if(this.total>0){\\n  return false;\\n}\\nreturn true;\"}}, {\"id\": 20, \"type\": \"beginTran\"}, {\"id\": 3, \"sql\": \"insert into xtn_userinfo\\n(username,password,tel,address,sex,age,cityname) values\\n(\':UserName\',\':Password\',\':Tel\',\':Address\',\'男\',floor( 15 + rand()*50),\'北京\')\", \"name\": \"UserId\", \"type\": \"insert\"}, {\"id\": 4, \"name\": \"fileList\", \"type\": \"files\", \"files\": {\"type\": \"image\", \"Relation\": {\"Fields\": [{\"TabelFieldName\": \"UserId\", \"RelationFieldName\": \"UserId\"}, {\"TabelFieldName\": \"FileId\", \"RelationFieldName\": \"FileId\"}, {\"TabelFieldName\": \"Type\", \"RelationFieldName\": \"图片\"}], \"TableName\": \"xtn_user_file\", \"UploadFieldName\": \"fileCollection\"}, \"filePath\": \"./public/image\", \"Relations\": [{\"Fields\": [{\"TabelFieldName\": \"UserId\", \"RelationFieldName\": \"UserId\"}, {\"TabelFieldName\": \"FileId\", \"RelationFieldName\": \"FileId\"}, {\"TabelFieldName\": \"Type\", \"RelationFieldName\": \"图片\"}], \"TableName\": \"xtn_user_file\", \"UploadFieldName\": \"fileCollection\"}, {\"Fields\": [{\"TabelFieldName\": \"UserId\", \"RelationFieldName\": \"UserId\"}, {\"TabelFieldName\": \"FileId\", \"RelationFieldName\": \"FileId\"}, {\"TabelFieldName\": \"Type\", \"RelationFieldName\": \"头像\"}], \"TableName\": \"xtn_user_file\", \"UploadFieldName\": \"file1\"}]}}, {\"id\": 70, \"type\": \"commit\"}, {\"id\": 5, \"sql\": \"select * from xtn_userinfo t where t.Id = :UserId\", \"name\": \"userinfo\", \"type\": \"query\"}, {\"id\": 6, \"sql\": \"select * from xtn_user_file t where t.UserId = :UserId\", \"name\": \"user_file_list\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"UserName,Password,Tel,Address\", \"result\": 5}', '0', '2017-07-26 00:08:35', '0');
INSERT INTO `xtn_sys_rule` VALUES ('7', '/webapi/userinfo/login_test', 'post', '0', '{\"rules\": [{\"id\": 1, \"sql\": \"select count(1) total,id,concat(\'xtn_\',md5(username),\'_\',md5(password))token, username,sex,cityname,age from xtn_userinfo t where t.username = \':username\' and t.password = \':password\'\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 2, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"用户名或密码不正确\", \"strByEval\": \"\", \"strByThis\": \"if(this.total<=0){return false;}return true\"}}, {\"id\": 3, \"sql\": \"delete from sys_session where token = \':token\' ;\", \"type\": \"delete\"}, {\"id\": 4, \"sql\": \"insert into sys_session(token,UserId,deadline)values(\':token\',:id, date_add( current_timestamp,interval 1 month)) ; \", \"type\": \"insert\"}], \"fields\": \"username,password\", \"result\": 1}', '0', '2017-07-27 23:55:02', '0');
INSERT INTO `xtn_sys_rule` VALUES ('8', '/webapi/base/AreaById', 'get', '0', '{\"rules\": [{\"id\": 1, \"sql\": \"select t.AreaId,t.ParentId,t.AreaName from xtn_base_area t where t.ParentId = :Id\", \"name\": \"AreaList\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"Id\", \"result\": 1}', '0', '2017-07-30 10:06:42', '0');
INSERT INTO `xtn_sys_rule` VALUES ('9', '/webapi/map/place', 'post', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"insert into xtn_map_place\\n(userId,Latitude,Longitude,BeginDate,EndDate,Address,Bewrite ,Name,InviteCode)\\nvalues\\n(:tokenUserId,\':Latitude\',\':Longitude\',\':BeginDate\',\':EndDate\',\':Address\', \':Bewrite\', \':Name\',xtn_invite_code(6))\", \"name\": \"InsertNo\", \"type\": \"insert\"}, {\"id\": 2, \"sql\": \"select * from xtn_map_place t where t.id = :InsertNo\", \"name\": \"map_place\", \"type\": \"query\"}], \"fields\": \"Address,BeginDate,EndDate,Latitude,Longitude,Name,Bewrite\", \"result\": 2}', '0', '2017-08-01 00:36:48', '1');
INSERT INTO `xtn_sys_rule` VALUES ('10', '/webapi/map/placelist', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select t.BeginDate ,t.EndDate, t.Id,t.UserId,t.Latitude,t.Longitude,t.Address,t.InviteCode,t.Bewrite,t.Name \\nfrom xtn_map_place t where t.userId = :tokenUserId order by t.EndDate desc\", \"name\": \"PlaceList\", \"type\": \"query\", \"isRows\": true}, {\"id\": 2, \"sql\": \"select ui.username, a.* from (\\n  select p.UserId pUserId, pj.* from xtn_map_place_join pj \\n  inner join xtn_map_place p on pj.PlaceId = p.Id and p.UserId = :tokenUserId\\n) a \\ninner join xtn_userinfo ui on ui.id = a.UserId\\nwhere (select count(*) from xtn_map_place_join where PlaceId=a.PlaceId\\n and CreateDate >=a.CreateDate ) <=9\\norder by a.PlaceId,a.createdate\", \"name\": \"PlaceJoinList\", \"type\": \"query\", \"isRows\": true, \"parentRelation\": {\"parent\": {}, \"children\": {}}}, {\"id\": 3, \"type\": \"parentrelation\", \"childrenField\": \"PlaceId \", \"parentRelation\": {\"name\": \"PeopleList\", \"fields\": [{\"parentField\": \"Id\", \"childrenField\": \"PlaceId\"}], \"parent\": {\"id\": 1}, \"children\": {\"id\": 2}, \"parentId\": 1, \"childrenId\": 2}}], \"result\": 1}', '0', '2017-08-01 13:52:00', '1');
INSERT INTO `xtn_sys_rule` VALUES ('11', '/webapi/userinfo/login', 'post', '1', '{\"rules\": [{\"id\": 1, \"type\": \"captcha\", \"captcha\": {\"fail\": \"验证码输入不正确\", \"field\": \"captcha\", \"timeout\": \"timeout\"}}, {\"id\": 2, \"sql\": \"select count(1) total,id,concat(\'xtn_\',md5(username),\'_\',md5(password))token, username,sex,cityname,age from xtn_userinfo t where t.username = \':username\' and t.password = \':password\'\", \"name\": \"userinfo\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 3, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"用户名或密码不正确。\", \"strByThis\": \"if(this.total === 0){\\n   return false ;\\n}else{\\n   return true;\\n}\"}}, {\"id\": 4, \"sql\": \"delete from xtn_sys_session where token = \':token\' ;\", \"type\": \"delete\"}, {\"id\": 5, \"sql\": \"insert into xtn_sys_session(token,UserId,deadline)values(\':token\',:id, date_add( current_timestamp,interval 1 month)) ; \", \"name\": \"InsertNo\", \"type\": \"insert\"}, {\"id\": 6, \"sql\": \"select t.UserId as tokenUserId,t.deadline from xtn_sys_session t where t.id = :InsertNo\", \"name\": \"sessioninfo\", \"type\": \"query\", \"cacheInfo\": {\"token\": \"token\", \"fields\": \"UserId,\"}, \"isMergeOption\": true}, {\"id\": 7, \"type\": \"captcha\", \"captcha\": {\"field\": \"captcha\", \"isDelete\": true}}, {\"id\": 8, \"type\": \"cache\", \"cacheInfo\": {\"token\": \"token\", \"fields\": \"tokenUserId,deadline\"}}], \"fields\": \"username,password,captcha\", \"result\": 2}', '0', '2017-08-02 23:33:01', '0');
INSERT INTO `xtn_sys_rule` VALUES ('12', '/webapi/common/area', 'get', '1', '{\"rules\": [{\"id\": 1, \"type\": \"setvalue\", \"setValues\": [{\"setValue\": \":PageIndex * :PageSize\", \"fieldName\": \"Begin\"}, {\"setValue\": \":PageSize\", \"fieldName\": \"End\"}]}, {\"id\": 2, \"sql\": \"select * from xtn_base_area t limit :Begin, :End\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"PageIndex,PageSize\", \"result\": 2}', '0', '2017-08-03 22:39:49', '0');
INSERT INTO `xtn_sys_rule` VALUES ('13', '/webapi/map/joinplace', 'post', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select count(1) total,t.EndDate- unix_timestamp(now())*1000 diffDate,\\nt.* from xtn_map_place t where t.InviteCode = \':InviteCode\'\", \"name\": \"PlaceInfo\", \"type\": \"query\", \"isMergeOption\": true}, {\"id\": 2, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"没有找到此活动\", \"strByThis\": \"if( this.total === 0){\\n   return false;\\n}else{\\n   return true;\\n}\"}}, {\"id\": 3, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"活动已结束了。\", \"strByThis\": \"if(this.diffDate < 0 ){\\n   return false;\\n}\\nreturn true;\"}}, {\"id\": 4, \"sql\": \"select count(1) placeExist from xtn_map_place_join t where t.placeId = :Id and t.userId = :tokenUserId\", \"type\": \"query\", \"judgeInfo\": {}, \"isMergeOption\": true}, {\"id\": 5, \"type\": \"judge\", \"judgeInfo\": {\"failMsg\": \"你已经加入了\", \"strByThis\": \"if( this.placeExist > 0){\\n   return false;\\n}\\nreturn true;\"}}, {\"id\": 6, \"sql\": \"INSERT INTO xtn_map_place_join\\n(`PlaceId`,`UserId`,`Status`,`UpdateDate`)\\nVALUES(:Id,:tokenUserId,1,now());\", \"name\": \"InsertNoJoin\", \"type\": \"insert\"}, {\"id\": 7, \"sql\": \"select * from xtn_map_place_join t where t.id = :InsertNoJoin\", \"type\": \"query\"}], \"fields\": \"InviteCode\", \"result\": 7}', '0', '2017-08-05 00:57:03', '1');
INSERT INTO `xtn_sys_rule` VALUES ('14', '/webapi/userinfo/users', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select * from xtn_userinfo t order by t.id\", \"type\": \"query\", \"isRows\": true}], \"result\": 1}', '0', '2017-08-05 21:35:45', '1');
INSERT INTO `xtn_sys_rule` VALUES ('15', '/webapi/map/joinplacedetail', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select * from xtn_map_place_join t where t.PlaceId = :PlaceId\", \"name\": \"PeopleList\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"PlaceId\", \"result\": 1}', '0', '2017-08-06 12:53:45', '1');
INSERT INTO `xtn_sys_rule` VALUES ('16', '/webapi/map/place/join/detail', 'put', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"update xtn_map_place_join set Latitude=:Latitude,Longitude=:Longitude,UpdateDate=now() where UserId = :tokenUserId and PlaceId = :PlaceId\", \"name\": \"PlaceJoinDetail\", \"type\": \"update\", \"isRows\": true}, {\"id\": 2, \"sql\": \"select * from xtn_map_place_join where UserId = :tokenUserId and PlaceId = :PlaceId\", \"name\": \"placejoin\", \"type\": \"query\"}], \"fields\": \"PlaceId,Latitude,Longitude\", \"result\": 2}', '0', '2017-08-06 13:13:05', '1');

-- ----------------------------
-- Table structure for xtn_sys_session
-- ----------------------------
DROP TABLE IF EXISTS `xtn_sys_session`;
CREATE TABLE `xtn_sys_session` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` int(11) NOT NULL COMMENT '用户ID',
  `token` varchar(150) NOT NULL COMMENT 'token',
  `deadline` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会话表，这个可以放到radis里去。';

-- ----------------------------
-- Records of xtn_sys_session
-- ----------------------------
INSERT INTO `xtn_sys_session` VALUES ('2', '68', 'xtn_21232f297a57a5a743894a0e4a801fc3_c3284d0f94606de1fd2af172aba15bf3', '2017-10-06 00:00:46');

-- ----------------------------
-- Table structure for xtn_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `xtn_userinfo`;
CREATE TABLE `xtn_userinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(500) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `tel` varchar(15) DEFAULT '' COMMENT '电话',
  `sex` enum('男','女') DEFAULT '男' COMMENT '性别',
  `age` int(11) DEFAULT '20' COMMENT '年龄',
  `cityname` varchar(80) DEFAULT '北京' COMMENT '城市名称',
  `address` varchar(200) DEFAULT '' COMMENT '地址',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of xtn_userinfo
-- ----------------------------
INSERT INTO `xtn_userinfo` VALUES ('68', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '男', '48', '北京', 'admin', '2017-08-05 09:39:32');
INSERT INTO `xtn_userinfo` VALUES ('69', 'test', '098f6bcd4621d373cade4e832627b4f6', 'test', '男', '42', '北京', 'test', '2017-08-05 09:40:06');
INSERT INTO `xtn_userinfo` VALUES ('70', 'cccccc', '96e79218965eb72c92a549dd5a330112', 'aa', '男', '30', '北京', 'aa', '2017-08-05 09:40:12');
INSERT INTO `xtn_userinfo` VALUES ('71', 'bbbbbb', '96e79218965eb72c92a549dd5a330112', 'bb', '男', '56', '北京', 'bb', '2017-08-05 09:40:18');
INSERT INTO `xtn_userinfo` VALUES ('72', 'cccccc', '96e79218965eb72c92a549dd5a330112', 'cc', '男', '59', '北京', 'cc', '2017-08-05 09:40:24');
INSERT INTO `xtn_userinfo` VALUES ('73', 'a', '0cc175b9c0f1b6a831c399e269772661', 'a', '男', '50', '北京', 'a', '2017-08-15 23:11:18');
INSERT INTO `xtn_userinfo` VALUES ('75', '11', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '30', '北京', 'address', '2017-08-20 02:03:54');
INSERT INTO `xtn_userinfo` VALUES ('89', '1', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '38', '北京', 'address', '2017-08-20 02:39:20');
INSERT INTO `xtn_userinfo` VALUES ('90', '111', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '37', '北京', 'address', '2017-08-20 02:41:38');
INSERT INTO `xtn_userinfo` VALUES ('91', '112', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '21', '北京', 'address', '2017-08-20 11:47:14');
INSERT INTO `xtn_userinfo` VALUES ('92', '1a', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '34', '北京', 'address', '2017-08-20 11:50:26');
INSERT INTO `xtn_userinfo` VALUES ('95', '1aa', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '40', '北京', 'address', '2017-08-20 12:03:42');
INSERT INTO `xtn_userinfo` VALUES ('96', '1aac', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '34', '北京', 'address', '2017-08-20 12:05:16');
INSERT INTO `xtn_userinfo` VALUES ('97', '111234', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '38', '北京', 'address', '2017-08-20 12:07:43');
INSERT INTO `xtn_userinfo` VALUES ('98', '111231', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '61', '北京', 'address', '2017-08-20 12:11:42');
INSERT INTO `xtn_userinfo` VALUES ('99', '11123a', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '26', '北京', 'address', '2017-08-20 12:17:04');
INSERT INTO `xtn_userinfo` VALUES ('100', '1aaa', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '46', '北京', 'address', '2017-09-02 10:48:56');
INSERT INTO `xtn_userinfo` VALUES ('103', '1aaa1', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '63', '北京', 'address', '2017-09-02 11:07:25');
INSERT INTO `xtn_userinfo` VALUES ('104', '1aaa2', '487f7b22f68312d2c1bbc93b1aea445b', '12142141', '男', '49', '北京', 'address', '2017-09-02 11:20:59');

-- ----------------------------
-- Table structure for xtn_user_deps
-- ----------------------------
DROP TABLE IF EXISTS `xtn_user_deps`;
CREATE TABLE `xtn_user_deps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键值',
  `depid` int(11) NOT NULL COMMENT '部门ID',
  `userid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户部分表';

-- ----------------------------
-- Records of xtn_user_deps
-- ----------------------------

-- ----------------------------
-- Table structure for xtn_user_file
-- ----------------------------
DROP TABLE IF EXISTS `xtn_user_file`;
CREATE TABLE `xtn_user_file` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` int(11) DEFAULT NULL COMMENT '用户ID',
  `FileId` int(11) DEFAULT NULL COMMENT '文件ID',
  `Type` enum('头像','图片','文件','视频','其它') DEFAULT '其它' COMMENT '类型：的是头像，上传的文件呀',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='用户文件表';

-- ----------------------------
-- Records of xtn_user_file
-- ----------------------------
INSERT INTO `xtn_user_file` VALUES ('1', '89', '51', '图片');
INSERT INTO `xtn_user_file` VALUES ('2', '89', '52', '图片');
INSERT INTO `xtn_user_file` VALUES ('3', '89', '53', '图片');
INSERT INTO `xtn_user_file` VALUES ('4', '90', '54', '图片');
INSERT INTO `xtn_user_file` VALUES ('5', '90', '55', '图片');
INSERT INTO `xtn_user_file` VALUES ('6', '90', '56', '图片');
INSERT INTO `xtn_user_file` VALUES ('7', '90', '57', '图片');
INSERT INTO `xtn_user_file` VALUES ('8', '91', '58', '图片');
INSERT INTO `xtn_user_file` VALUES ('9', '92', '59', '图片');
INSERT INTO `xtn_user_file` VALUES ('10', '95', '60', '图片');
INSERT INTO `xtn_user_file` VALUES ('11', '95', '61', '图片');
INSERT INTO `xtn_user_file` VALUES ('12', '96', '62', '图片');
INSERT INTO `xtn_user_file` VALUES ('13', '97', '63', '图片');
INSERT INTO `xtn_user_file` VALUES ('14', '97', '64', '图片');
INSERT INTO `xtn_user_file` VALUES ('15', '97', '65', '图片');
INSERT INTO `xtn_user_file` VALUES ('16', '98', '66', '图片');
INSERT INTO `xtn_user_file` VALUES ('17', '98', '67', '图片');
INSERT INTO `xtn_user_file` VALUES ('18', '98', '68', '图片');
INSERT INTO `xtn_user_file` VALUES ('19', '99', '69', '图片');
INSERT INTO `xtn_user_file` VALUES ('20', '99', '70', '图片');
INSERT INTO `xtn_user_file` VALUES ('21', '99', '71', '图片');
INSERT INTO `xtn_user_file` VALUES ('22', '100', '72', '图片');
INSERT INTO `xtn_user_file` VALUES ('23', '100', '73', '图片');
INSERT INTO `xtn_user_file` VALUES ('24', '100', '74', '图片');
INSERT INTO `xtn_user_file` VALUES ('25', '100', '75', '图片');
INSERT INTO `xtn_user_file` VALUES ('26', '100', '72', '头像');
INSERT INTO `xtn_user_file` VALUES ('27', '100', '73', '头像');
INSERT INTO `xtn_user_file` VALUES ('28', '100', '74', '头像');
INSERT INTO `xtn_user_file` VALUES ('29', '100', '75', '头像');
INSERT INTO `xtn_user_file` VALUES ('30', '103', '80', '图片');
INSERT INTO `xtn_user_file` VALUES ('31', '103', '81', '图片');
INSERT INTO `xtn_user_file` VALUES ('32', '103', '82', '图片');
INSERT INTO `xtn_user_file` VALUES ('33', '103', '83', '头像');
INSERT INTO `xtn_user_file` VALUES ('34', '104', '84', '图片');
INSERT INTO `xtn_user_file` VALUES ('35', '104', '85', '图片');
INSERT INTO `xtn_user_file` VALUES ('36', '104', '86', '图片');
INSERT INTO `xtn_user_file` VALUES ('37', '104', '87', '头像');

-- ----------------------------
-- Table structure for xtn_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `xtn_user_rule`;
CREATE TABLE `xtn_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户角色ID',
  `userid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `ruleid` int(10) unsigned NOT NULL COMMENT '角色ID',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of xtn_user_rule
-- ----------------------------

-- ----------------------------
-- Function structure for xtn_invite_code
-- ----------------------------
DROP FUNCTION IF EXISTS `xtn_invite_code`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `xtn_invite_code`(size INT) RETURNS varchar(255) CHARSET utf8
BEGIN
    DECLARE chars_str varchar(100) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    DECLARE return_str varchar(255) DEFAULT '';
    DECLARE i INT DEFAULT 0;
    WHILE i < size DO
        SET return_str = concat(return_str,substring(chars_str , FLOOR(1 + RAND()*62 ),1));
        SET i = i +1;
    END WHILE;
    RETURN return_str;
END
;;
DELIMITER ;
