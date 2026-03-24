-- 系统日志表
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `operation` varchar(100) DEFAULT NULL COMMENT '操作名称',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` text COMMENT '请求参数',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态：0-成功，1-失败',
  `error_msg` varchar(500) DEFAULT NULL COMMENT '错误信息',
  `execution_time` bigint DEFAULT NULL COMMENT '执行时间（毫秒）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` int NOT NULL DEFAULT '0' COMMENT '删除标记：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统日志表';
