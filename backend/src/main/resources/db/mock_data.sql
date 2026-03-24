-- 模拟数据脚本
-- 在 Navicat 中执行此脚本

USE club_manager;

-- 清空现有数据（保留三个主账号）
DELETE FROM sys_payment_record;
DELETE FROM sys_payment;
DELETE FROM sys_notification_read;
DELETE FROM sys_notification;
DELETE FROM sys_activity_sign_up;
DELETE FROM sys_activity;
DELETE FROM sys_apply;
DELETE FROM sys_club_member;
DELETE FROM sys_club;
DELETE FROM sys_user WHERE id > 3;

-- 重置自增ID
ALTER TABLE sys_user AUTO_INCREMENT = 4;
ALTER TABLE sys_club AUTO_INCREMENT = 1;
ALTER TABLE sys_club_member AUTO_INCREMENT = 1;
ALTER TABLE sys_activity AUTO_INCREMENT = 1;
ALTER TABLE sys_activity_sign_up AUTO_INCREMENT = 1;
ALTER TABLE sys_apply AUTO_INCREMENT = 1;
ALTER TABLE sys_notification AUTO_INCREMENT = 1;
ALTER TABLE sys_payment AUTO_INCREMENT = 1;
ALTER TABLE sys_payment_record AUTO_INCREMENT = 1;

-- 插入学生用户（角色=3）
INSERT INTO sys_user (username, password, nickname, email, phone, role, status, student_no, college, major, class_name) VALUES
('zhangsan', '666666', '张三', 'zhangsan@edu.cn', '13800001001', 3, 1, '2021001', '计算机学院', '软件工程', '软工2101班'),
('lisi', '666666', '李四', 'lisi@edu.cn', '13800001002', 3, 1, '2021002', '计算机学院', '计算机科学', '计科2101班'),
('wangwu', '666666', '王五', 'wangwu@edu.cn', '13800001003', 3, 1, '2021003', '艺术学院', '视觉设计', '视设2101班'),
('zhaoliu', '666666', '赵六', 'zhaoliu@edu.cn', '13800001004', 3, 1, '2021004', '体育学院', '体育教育', '体教2101班'),
('sunqi', '666666', '孙七', 'sunqi@edu.cn', '13800001005', 3, 1, '2021005', '文学院', '汉语言文学', '汉文2101班'),
('zhouba', '666666', '周八', 'zhouba@edu.cn', '13800001006', 3, 1, '2021006', '计算机学院', '网络工程', '网工2101班'),
('wujiu', '666666', '吴九', 'wujiu@edu.cn', '13800001007', 3, 1, '2021007', '商学院', '工商管理', '工商2101班'),
('zhengshi', '666666', '郑十', 'zhengshi@edu.cn', '13800001008', 3, 1, '2021008', '艺术学院', '音乐表演', '音表2101班');

-- 更新社长账号信息
UPDATE sys_user SET nickname = '李明', college = '计算机学院', major = '软件工程', class_name = '软工2001班' WHERE username = 'president';

-- 插入社团（president用户ID=2作为社长）
INSERT INTO sys_club (name, type_id, type_name, president_id, president_name, description, status, member_count) VALUES
('编程爱好者协会', 1, '学术科技类', 2, '李明', '致力于培养编程兴趣，提升编程技能，组织各类编程竞赛和技术分享活动。', 1, 35),
('摄影社', 2, '文化艺术类', 4, '王五', '用镜头记录生活美好瞬间，定期组织外拍活动和摄影展览。', 1, 28),
('篮球俱乐部', 3, '体育竞技类', 5, '赵六', '热爱篮球运动，每周组织训练和友谊赛，参加校际篮球联赛。', 1, 45),
('青年志愿者协会', 4, '社会实践类', 6, '孙七', '弘扬志愿服务精神，组织各类公益活动和社区服务项目。', 1, 60),
('动漫社', 5, '兴趣爱好类', 8, '郑十', 'ACG文化爱好者聚集地，组织漫展、cosplay等活动。', 1, 42);

-- 插入社团成员（用户ID 4-11加入社团）
INSERT INTO sys_club_member (club_id, user_id, user_name, status, join_time) VALUES
-- 编程爱好者协会（club_id=1）
(1, 4, '张三', 1, '2024-09-01 10:00:00'),
(1, 5, '李四', 1, '2024-09-02 14:30:00'),
(1, 9, '周八', 1, '2024-09-03 09:15:00'),
-- 摄影社（club_id=2）
(2, 6, '王五', 1, '2024-09-01 11:00:00'),
(2, 7, '张三', 1, '2024-09-05 16:00:00'),
-- 篮球俱乐部（club_id=3）
(3, 7, '赵六', 1, '2024-09-01 12:00:00'),
(3, 5, '李四', 1, '2024-09-04 10:00:00'),
(3, 9, '周八', 1, '2024-09-06 15:00:00'),
-- 青年志愿者协会（club_id=4）
(4, 8, '孙七', 1, '2024-09-01 13:00:00'),
(4, 4, '张三', 1, '2024-09-07 11:00:00'),
(4, 6, '王五', 1, '2024-09-08 14:00:00'),
-- 动漫社（club_id=5）
(5, 11, '郑十', 1, '2024-09-01 14:00:00'),
(5, 7, '赵六', 1, '2024-09-10 09:00:00'),
(5, 10, '吴九', 1, '2024-09-11 10:30:00');

-- 插入活动
INSERT INTO sys_activity (club_id, club_name, title, description, location, start_time, end_time, sign_up_start, sign_up_end, max_participants, current_participants, status) VALUES
(1, '编程爱好者协会', 'Python入门培训', '面向零基础同学的Python编程入门课程，带你走进编程世界。', '教学楼A301', '2024-10-15 14:00:00', '2024-10-15 17:00:00', '2024-10-01 00:00:00', '2024-10-14 23:59:59', 50, 32, 2),
(1, '编程爱好者协会', '算法竞赛选拔赛', '校ACM竞赛选拔，优秀者将代表学校参加省级比赛。', '计算机实验室', '2024-10-20 09:00:00', '2024-10-20 12:00:00', '2024-10-05 00:00:00', '2024-10-19 23:59:59', 30, 28, 2),
(2, '摄影社', '秋季外拍活动', '前往城市公园进行秋季主题外拍，捕捉秋日美景。', '城市公园', '2024-10-22 08:00:00', '2024-10-22 17:00:00', '2024-10-08 00:00:00', '2024-10-21 23:59:59', 20, 18, 2),
(3, '篮球俱乐部', '新生杯篮球赛', '面向新生的篮球友谊赛，欢迎所有篮球爱好者参加。', '体育馆', '2024-10-25 14:00:00', '2024-10-25 18:00:00', '2024-10-10 00:00:00', '2024-10-24 23:59:59', 40, 35, 2),
(4, '青年志愿者协会', '敬老院志愿服务', '前往敬老院开展志愿服务活动，为老人们送去温暖。', '阳光敬老院', '2024-10-28 09:00:00', '2024-10-28 16:00:00', '2024-10-15 00:00:00', '2024-10-27 23:59:59', 25, 22, 2),
(5, '动漫社', '万圣节Cosplay派对', '万圣节主题Cosplay派对，展示你的二次元魅力！', '学生活动中心', '2024-10-31 18:00:00', '2024-10-31 22:00:00', '2024-10-20 00:00:00', '2024-10-30 23:59:59', 60, 45, 2);

-- 插入活动报名记录
INSERT INTO sys_activity_sign_up (activity_id, user_id, user_name, status, sign_up_time, checked) VALUES
-- Python入门培训（activity_id=1）
(1, 4, '张三', 1, '2024-10-02 10:00:00', 0),
(1, 5, '李四', 1, '2024-10-03 11:00:00', 0),
(1, 7, '王五', 1, '2024-10-04 09:00:00', 0),
-- 算法竞赛（activity_id=2）
(2, 4, '张三', 1, '2024-10-06 14:00:00', 0),
(2, 9, '周八', 1, '2024-10-07 10:00:00', 0),
-- 秋季外拍（activity_id=3）
(3, 6, '王五', 1, '2024-10-09 15:00:00', 0),
(3, 8, '孙七', 1, '2024-10-10 11:00:00', 0),
-- 新生杯篮球赛（activity_id=4）
(4, 5, '李四', 1, '2024-10-12 09:00:00', 0),
(4, 7, '赵六', 1, '2024-10-13 10:00:00', 0),
(4, 9, '周八', 1, '2024-10-14 11:00:00', 0),
-- 敬老院志愿服务（activity_id=5）
(5, 4, '张三', 1, '2024-10-16 14:00:00', 0),
(5, 6, '王五', 1, '2024-10-17 09:00:00', 0),
(5, 10, '吴九', 1, '2024-10-18 10:00:00', 0),
-- 万圣节派对（activity_id=6）
(6, 7, '赵六', 1, '2024-10-21 15:00:00', 0),
(6, 10, '吴九', 1, '2024-10-22 11:00:00', 0),
(6, 11, '郑十', 1, '2024-10-23 09:00:00', 0);

-- 插入入团申请
INSERT INTO sys_apply (club_id, club_name, user_id, user_name, status, reason, create_time) VALUES
(1, '编程爱好者协会', 10, '吴九', 0, '对编程很感兴趣，希望加入社团学习更多知识', NOW()),
(2, '摄影社', 9, '周八', 1, '热爱摄影，想提升摄影技术', DATE_SUB(NOW(), INTERVAL 5 DAY)),
(3, '篮球俱乐部', 4, '张三', 1, '喜欢打篮球，想认识更多球友', DATE_SUB(NOW(), INTERVAL 10 DAY)),
(4, '青年志愿者协会', 5, '李四', 2, '想参与志愿活动', DATE_SUB(NOW(), INTERVAL 7 DAY)),
(5, '动漫社', 8, '孙七', 0, '资深二次元爱好者，希望加入组织', NOW());

-- 插入通知
INSERT INTO sys_notification (title, content, type, target_id, sender_id, sender_name, priority, create_time) VALUES
('系统升级通知', '系统将于本周六凌晨进行升级维护，届时将暂停服务2小时，请提前做好准备。', 1, NULL, 1, '系统管理员', 1, DATE_SUB(NOW(), INTERVAL 1 DAY)),
('新学期社团招新开始', '2024年秋季社团招新活动即将开始，欢迎同学们踊跃报名参加！', 1, NULL, 1, '系统管理员', 2, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('编程竞赛报名提醒', 'ACM程序设计竞赛报名即将截止，请有意向的同学尽快报名。', 2, 1, 2, '李明', 1, DATE_SUB(NOW(), INTERVAL 2 DAY)),
('摄影社活动通知', '本周六将举行秋季外拍活动，请报名的同学准时集合。', 2, 2, 4, '王五', 0, DATE_SUB(NOW(), INTERVAL 1 DAY)),
('志愿服务时长统计', '请各社团尽快统计上学期志愿服务时长，以便进行学分认定。', 1, NULL, 1, '系统管理员', 1, NOW());

-- 插入缴费项目
INSERT INTO sys_payment (club_id, club_name, title, description, amount, deadline, status) VALUES
(1, '编程爱好者协会', '2024年秋季会费', '用于社团日常活动开支、设备采购等', 50.00, '2024-10-31 23:59:59', 0),
(2, '摄影社', '外拍活动费用', '包含交通费、保险费等', 80.00, '2024-10-20 23:59:59', 0),
(3, '篮球俱乐部', '球衣订购费用', '定制社团专属球衣', 120.00, '2024-10-25 23:59:59', 0),
(4, '青年志愿者协会', '志愿者服装费', '统一志愿者马甲', 35.00, '2024-10-30 23:59:59', 0),
(5, '动漫社', '漫展门票费用', '集体参加城市漫展', 60.00, '2024-10-28 23:59:59', 0);

-- 插入缴费记录
INSERT INTO sys_payment_record (payment_id, user_id, user_name, amount, status, pay_time, transaction_no) VALUES
-- 编程协会会费（payment_id=1）
(1, 4, '张三', 50.00, 1, NOW(), CONCAT('TXN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), '001')),
(1, 5, '李四', 50.00, 1, DATE_SUB(NOW(), INTERVAL 1 DAY), CONCAT('TXN', DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 DAY), '%Y%m%d%H%i%s'), '002')),
(1, 9, '周八', 50.00, 0, NULL, NULL),
-- 摄影社活动费（payment_id=2）
(2, 6, '王五', 80.00, 1, NOW(), CONCAT('TXN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), '003')),
(2, 8, '孙七', 80.00, 0, NULL, NULL),
-- 篮球俱乐部球衣费（payment_id=3）
(3, 5, '李四', 120.00, 1, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('TXN', DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 2 DAY), '%Y%m%d%H%i%s'), '004')),
(3, 7, '赵六', 120.00, 0, NULL, NULL),
(3, 9, '周八', 120.00, 0, NULL, NULL);

SELECT '模拟数据插入完成！' AS message;
