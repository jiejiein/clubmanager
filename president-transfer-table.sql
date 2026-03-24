-- 社长转移申请表
CREATE TABLE `sys_president_transfer` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `club_id` bigint NOT NULL COMMENT '社团ID',
  `club_name` varchar(100) DEFAULT NULL COMMENT '社团名称',
  `current_president_id` bigint NOT NULL COMMENT '现任社长ID',
  `current_president_name` varchar(50) DEFAULT NULL COMMENT '现任社长姓名',
  `new_president_id` bigint NOT NULL COMMENT '新社长ID',
  `new_president_name` varchar(50) DEFAULT NULL COMMENT '新社长姓名',
  `status` int NOT NULL DEFAULT '0' COMMENT '状态：0-待审核，1-已通过，2-已拒绝',
  `reason` varchar(500) DEFAULT NULL COMMENT '申请理由',
  `reject_reason` varchar(500) DEFAULT NULL COMMENT '拒绝理由',
  `process_time` datetime DEFAULT NULL COMMENT '处理时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `deleted` int NOT NULL DEFAULT '0' COMMENT '删除标记：0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `idx_club_id` (`club_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社长转移申请表';
