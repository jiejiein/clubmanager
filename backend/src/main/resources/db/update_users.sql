-- 更新用户数据脚本
-- 清空现有数据（保留admin账号）
USE club_manager;

-- 先删除关联数据
DELETE FROM sys_payment_record;
DELETE FROM sys_payment;
DELETE FROM sys_notification_read;
DELETE FROM sys_notification;
DELETE FROM sys_activity_sign_up;
DELETE FROM sys_activity;
DELETE FROM sys_apply;
DELETE FROM sys_club_member;
DELETE FROM sys_club;
DELETE FROM sys_user;

-- 重置自增ID
ALTER TABLE sys_user AUTO_INCREMENT = 1;

-- 插入管理员（ID=1）
INSERT INTO sys_user (id, username, password, nickname, email, phone, role, status) VALUES
(1, 'admin', '666666', '系统管理员', 'admin@edu.cn', '13800000000', 1, 1);

-- 重置自增ID从2开始
ALTER TABLE sys_user AUTO_INCREMENT = 2;
ALTER TABLE sys_club AUTO_INCREMENT = 1;
ALTER TABLE sys_club_member AUTO_INCREMENT = 1;
ALTER TABLE sys_activity AUTO_INCREMENT = 1;
ALTER TABLE sys_activity_sign_up AUTO_INCREMENT = 1;
ALTER TABLE sys_apply AUTO_INCREMENT = 1;
ALTER TABLE sys_notification AUTO_INCREMENT = 1;
ALTER TABLE sys_payment AUTO_INCREMENT = 1;
ALTER TABLE sys_payment_record AUTO_INCREMENT = 1;

-- 插入社长（role=2）
INSERT INTO sys_user (username, password, nickname, email, phone, role, status, student_no, college, major, class_name) VALUES
('president1', '666666', '林一', 'linyi@edu.cn', '13800010001', 2, 1, '2020001', '计算机学院', '软件工程', '软工2001班'),
('president2', '666666', '龙二', 'longer@edu.cn', '13800010002', 2, 1, '2020002', '艺术学院', '视觉传达', '视传2001班'),
('president3', '666666', '张三', 'zhangsan@edu.cn', '13800010003', 2, 1, '2020003', '体育学院', '体育教育', '体教2001班'),
('president4', '666666', '李四', 'lisi@edu.cn', '13800010004', 2, 1, '2020004', '文学院', '汉语言文学', '汉文2001班'),
('president5', '666666', '王五', 'wangwu@edu.cn', '13800010005', 2, 1, '2020005', '商学院', '工商管理', '工商2001班');

-- 插入学生（role=3）
INSERT INTO sys_user (username, password, nickname, email, phone, role, status, student_no, college, major, class_name) VALUES
('student1', '666666', '赵六', 'zhaoliu@edu.cn', '13800020001', 3, 1, '2021001', '计算机学院', '计算机科学', '计科2101班'),
('student2', '666666', '孙七', 'sunqi@edu.cn', '13800020002', 3, 1, '2021002', '艺术学院', '音乐表演', '音表2101班'),
('student3', '666666', '周八', 'zhouba@edu.cn', '13800020003', 3, 1, '2021003', '体育学院', '运动训练', '运训2101班'),
('student4', '666666', '吴九', 'wujiu@edu.cn', '13800020004', 3, 1, '2021004', '文学院', '新闻传播', '新闻2101班'),
('student5', '666666', '郑十', 'zhengshi@edu.cn', '13800020005', 3, 1, '2021005', '商学院', '市场营销', '营销2101班');

-- 插入社团（社长ID从2到6）
INSERT INTO sys_club (name, type_id, type_name, president_id, president_name, description, status, member_count) VALUES
('编程爱好者协会', 1, '学术科技类', 2, '林一', '致力于培养编程兴趣，提升编程技能，组织各类编程竞赛和技术分享活动。', 1, 25),
('摄影艺术社', 2, '文化艺术类', 3, '龙二', '用镜头记录生活美好瞬间，定期组织外拍活动和摄影展览。', 1, 20),
('篮球俱乐部', 3, '体育竞技类', 4, '张三', '热爱篮球运动，每周组织训练和友谊赛，参加校际篮球联赛。', 1, 35),
('青年志愿者协会', 4, '社会实践类', 5, '李四', '弘扬志愿服务精神，组织各类公益活动和社区服务项目。', 1, 45),
('动漫文化社', 5, '兴趣爱好类', 6, '王五', 'ACG文化爱好者聚集地，组织漫展、cosplay等活动。', 1, 30);

-- 插入社团成员（学生ID从7到11，加入各个社团）
INSERT INTO sys_club_member (club_id, user_id, user_name, status, join_time) VALUES
-- 编程爱好者协会（club_id=1）
(1, 7, '赵六', 1, '2024-09-01 10:00:00'),
(1, 8, '孙七', 1, '2024-09-02 14:30:00'),
-- 摄影艺术社（club_id=2）
(2, 8, '孙七', 1, '2024-09-01 11:00:00'),
(2, 9, '周八', 1, '2024-09-05 16:00:00'),
-- 篮球俱乐部（club_id=3）
(3, 9, '周八', 1, '2024-09-01 12:00:00'),
(3, 10, '吴九', 1, '2024-09-04 10:00:00'),
-- 青年志愿者协会（club_id=4）
(4, 10, '吴九', 1, '2024-09-01 13:00:00'),
(4, 11, '郑十', 1, '2024-09-07 11:00:00'),
-- 动漫文化社（club_id=5）
(5, 11, '郑十', 1, '2024-09-01 14:00:00'),
(5, 7, '赵六', 1, '2024-09-10 09:00:00');

-- 插入活动
INSERT INTO sys_activity (club_id, club_name, title, description, location, start_time, end_time, sign_up_start, sign_up_end, max_participants, current_participants, status) VALUES
(1, '编程爱好者协会', 'Python入门培训', '面向零基础同学的Python编程入门课程，带你走进编程世界。', '教学楼A301', '2024-10-15 14:00:00', '2024-10-15 17:00:00', '2024-10-01 00:00:00', '2024-10-14 23:59:59', 50, 12, 2),
(1, '编程爱好者协会', '算法竞赛选拔赛', '校ACM竞赛选拔，优秀者将代表学校参加省级比赛。', '计算机实验室', '2024-10-20 09:00:00', '2024-10-20 12:00:00', '2024-10-05 00:00:00', '2024-10-19 23:59:59', 30, 8, 2),
(2, '摄影艺术社', '秋季外拍活动', '前往城市公园进行秋季主题外拍，捕捉秋日美景。', '城市公园', '2024-10-22 08:00:00', '2024-10-22 17:00:00', '2024-10-08 00:00:00', '2024-10-21 23:59:59', 20, 6, 2),
(3, '篮球俱乐部', '新生杯篮球赛', '面向新生的篮球友谊赛，欢迎所有篮球爱好者参加。', '体育馆', '2024-10-25 14:00:00', '2024-10-25 18:00:00', '2024-10-10 00:00:00', '2024-10-24 23:59:59', 40, 15, 2),
(4, '青年志愿者协会', '敬老院志愿服务', '前往敬老院开展志愿服务活动，为老人们送去温暖。', '阳光敬老院', '2024-10-28 09:00:00', '2024-10-28 16:00:00', '2024-10-15 00:00:00', '2024-10-27 23:59:59', 25, 10, 2),
(5, '动漫文化社', '万圣节Cosplay派对', '万圣节主题Cosplay派对，展示你的二次元魅力！', '学生活动中心', '2024-10-31 18:00:00', '2024-10-31 22:00:00', '2024-10-20 00:00:00', '2024-10-30 23:59:59', 60, 20, 2);

-- 插入活动报名记录
INSERT INTO sys_activity_sign_up (activity_id, user_id, user_name, status, sign_up_time, checked) VALUES
(1, 7, '赵六', 1, '2024-10-02 10:00:00', 0),
(1, 8, '孙七', 1, '2024-10-03 11:00:00', 0),
(2, 7, '赵六', 1, '2024-10-06 14:00:00', 0),
(3, 9, '周八', 1, '2024-10-12 09:00:00', 0),
(3, 10, '吴九', 1, '2024-10-13 10:00:00', 0),
(4, 10, '吴九', 1, '2024-10-16 14:00:00', 0),
(4, 11, '郑十', 1, '2024-10-17 09:00:00', 0),
(5, 11, '郑十', 1, '2024-10-21 15:00:00', 0),
(5, 7, '赵六', 1, '2024-10-22 11:00:00', 0);

-- 插入入团申请
INSERT INTO sys_apply (club_id, club_name, user_id, user_name, status, reason, create_time) VALUES
(1, '编程爱好者协会', 9, '周八', 0, '对编程很感兴趣，希望加入社团学习更多知识', NOW()),
(2, '摄影艺术社', 10, '吴九', 1, '热爱摄影，想提升摄影技术', DATE_SUB(NOW(), INTERVAL 5 DAY)),
(3, '篮球俱乐部', 11, '郑十', 1, '喜欢打篮球，想认识更多球友', DATE_SUB(NOW(), INTERVAL 10 DAY)),
(4, '青年志愿者协会', 7, '赵六', 2, '想参与志愿活动', DATE_SUB(NOW(), INTERVAL 7 DAY)),
(5, '动漫文化社', 8, '孙七', 0, '资深二次元爱好者，希望加入组织', NOW());

-- 插入通知
INSERT INTO sys_notification (title, content, type, target_id, sender_id, sender_name, priority, create_time) VALUES
('系统升级通知', '系统将于本周六凌晨进行升级维护，届时将暂停服务2小时，请提前做好准备。', 1, NULL, 1, '系统管理员', 1, DATE_SUB(NOW(), INTERVAL 1 DAY)),
('新学期社团招新开始', '2024年秋季社团招新活动即将开始，欢迎同学们踊跃报名参加！', 1, NULL, 1, '系统管理员', 2, DATE_SUB(NOW(), INTERVAL 3 DAY)),
('编程竞赛报名提醒', 'ACM程序设计竞赛报名即将截止，请有意向的同学尽快报名。', 2, 1, 2, '林一', 1, DATE_SUB(NOW(), INTERVAL 2 DAY)),
('摄影社活动通知', '本周六将举行秋季外拍活动，请报名的同学准时集合。', 2, 2, 3, '龙二', 0, DATE_SUB(NOW(), INTERVAL 1 DAY)),
('志愿服务时长统计', '请各社团尽快统计上学期志愿服务时长，以便进行学分认定。', 1, NULL, 1, '系统管理员', 1, NOW());

-- 插入缴费项目
INSERT INTO sys_payment (club_id, club_name, title, description, amount, deadline, status) VALUES
(1, '编程爱好者协会', '2024年秋季会费', '用于社团日常活动开支、设备采购等', 50.00, '2024-10-31 23:59:59', 0),
(2, '摄影艺术社', '外拍活动费用', '包含交通费、保险费等', 80.00, '2024-10-20 23:59:59', 0),
(3, '篮球俱乐部', '球衣订购费用', '定制社团专属球衣', 120.00, '2024-10-25 23:59:59', 0),
(4, '青年志愿者协会', '志愿者服装费', '统一志愿者马甲', 35.00, '2024-10-30 23:59:59', 0),
(5, '动漫文化社', '漫展门票费用', '集体参加城市漫展', 60.00, '2024-10-28 23:59:59', 0);

-- 插入缴费记录
INSERT INTO sys_payment_record (payment_id, user_id, user_name, amount, status, pay_time, transaction_no) VALUES
(1, 7, '赵六', 50.00, 1, NOW(), CONCAT('TXN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), '001')),
(1, 8, '孙七', 50.00, 1, DATE_SUB(NOW(), INTERVAL 1 DAY), CONCAT('TXN', DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 DAY), '%Y%m%d%H%i%s'), '002')),
(2, 8, '孙七', 80.00, 1, NOW(), CONCAT('TXN', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), '003')),
(3, 9, '周八', 120.00, 1, DATE_SUB(NOW(), INTERVAL 2 DAY), CONCAT('TXN', DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 2 DAY), '%Y%m%d%H%i%s'), '004')),
(3, 10, '吴九', 120.00, 0, NULL, NULL);

SELECT '用户数据更新完成！' AS message;
SELECT '社长账号: president1~5 (林一、龙二、张三、李四、王五)' AS info;
SELECT '学生账号: student1~5 (赵六、孙七、周八、吴九、郑十)' AS info;
SELECT '管理员账号: admin' AS info;
SELECT '所有密码: 666666' AS info;
