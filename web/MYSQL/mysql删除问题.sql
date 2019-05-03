
CREATE DATABASE IF NOT EXISTS zuoye;
USE zuoye
CREATE TABLE selldb(
	id INT PRIMARY KEY, -- id
	NAME VARCHAR(32),--	姓名
	sellnumbers INT,--	销售了多少栋房
	sellmoney VARCHAR(32),--	销售e
	money INT --	基本工资
);
ALTER TABLE selldb MODIFY sellmoney  INT;--	改变表类型
/* 添加数据*/
INSERT INTO selldb VALUES (1,"guofengyi",3,900000,8000);
INSERT INTO selldb VALUES (2,'liqingfeng',1,250000,5000);
INSERT INTO selldb VALUES (3,'yaoxiaochu',0,0,4000);
INSERT INTO selldb VALUES (4,'huobi',5,1000000,6000);
INSERT INTO selldb VALUES (5,'songming',6,1200000,5000);
INSERT INTO selldb VALUES (6,'yangyang',2,502000,7000);

# 写出统计10月份“我爱你家”一共销售了多少套房源以及总销售额（sql语句）
SELECT SUM(sellnumbers),SUM(sellmoney) FROM selldb;

#写出计算低于平均销售额的员工姓名输出到控制台上（sql语句）
SELECT AVG(sellmoney) FROM selldb;
SELECT NAME,sellmoney FROM selldb WHERE sellmoney<(SELECT AVG(sellmoney) FROM selldb);

# .写出删除10月份0销售额的员工（sql语句）
DELETE FROM selldb WHERE sellmoney=0;
SELECT * FROM selldb;	-- 查询表

DELETE FROM selldb WHERE id=1；	-- 删除数据 

ALTER TABLE selldb CHARACTER SET utf8;	-- 更改表的编码集

SHOW CREATE DATABASE zuoye;	-- 查询表的编码集

ALTER DATABASE zuoye CHARACTER SET utf8;	-- 更改数据库的编码集

 DELETE  FROM selldb WHERE id=1;		-- 删除数据
 
 
 
 
 
 
 
CREATE TABLE studb(
	NAME VARCHAR(32),
	age INT ,
	sex VARCHAR(23),
	department VARCHAR(23),
	score INT
);
SELECT * FROM studb
INSERT INTO studb VALUES ('张三丰',103,'男','iOS就业班',100);
INSERT INTO studb VALUES ('李峰',23,'男','iOS基础班',90);
INSERT INTO studb VALUES ('张飞',36,'男','JavaEE基础班',40);
INSERT INTO studb VALUES ('田甜',23,'女','UI基础班',80);
INSERT INTO studb VALUES ('李根',40,'男','JavaEE就业班',9);
INSERT INTO studb VALUES ('朱迪',18,'女','javaEE基础班',100);
#.写出完成基础班在读的男学员的所有信息按成绩的降序输出到控制台上（sql语句）
SELECT * FROM studb ORDER BY score DESC,age ASC;-- 排序 order by desc 降序 asc 升序

UPDATE stutb SET stutb.name="张飞" FROM t1 JOIN 

#.写出将李根的年龄改为20，班级改为javaEE基础班（sql语句）
UPDATE studb SET age=20 WHERE NAME='李根'; -- 修改数据
SELECT * FROM studb;

#写出删除低于javaEE基础班平均分的javaEE基础班学生（sql语句）
START TRANSACTION;  -- 开启事务
DELETE FROM studb WHERE department='JavaEE就业班' && score<=68;
ROLLBACK;  -- 事务回滚
COMMIT;	   -- 提交事务
DELETE FROM studb WHERE age=103  -- 删除数据
SELECT * FROM stutb

SELECT stutb.* FROM stutb WHERE stutb.`department`="javaEE基础班"  HAVING stutb.`score`<AVG(stutb.`score`);
DELETE stutb FROM 
stutb,(SELECT stutb.* FROM stutb WHERE stutb.`department`="javaEE基础班"  HAVING stutb.`score`<AVG(stutb.`score`)) t1
WHERE 
stutb.`sname`=t1.sname

DELETE stutb FROM stutb,(SELECT stutb.* FROM stutb WHERE stutb.`department`='javaEE基础班' HAVING stutb.`score`< AVG(stutb.`score`)) t1
WHERE t1.sname=stutb.`sname`

DELETE stutb FROM stutb WHERE  stutb.`score` IN((SELECT AVG(stutb.`score`) score FROM stutb WHERE stutb.`department`='javaEE基础班'),2)

DELETE FROM stutb WHERE stutb.`score`<
(SELECT t.score FROM (SELECT AVG(stutb.`score`) score FROM stutb WHERE stutb.`department`="javaEE基础班")t);
-- MYSQL 不能同时查询和删除同一个表
DELETE FROM stutb WHERE score <
(SELECT t.score FROM (SELECT AVG(score)score FROM stutb WHERE department = 'JavaEE基础班') as t);  



CREATE TABLE rentinfo(
	typl VARCHAR(32),	-- 类型
	rent INT ,		-- 租金
	areas INT ,		-- 面积
	agencyprice INT 	-- 中介费用
);
SELECT * FROM rentinfo;
INSERT INTO rentinfo VALUES ('主卧',2600,25,1000);
INSERT INTO rentinfo VALUES ('次卧',1500,18,0);
INSERT INTO rentinfo VALUES ('两居室',3600,50,800);
INSERT INTO rentinfo VALUES ('次卧',1450,17,1400);
INSERT INTO rentinfo VALUES ('主卧',2200,26,0);
INSERT INTO rentinfo VALUES ('次卧',1800,21,0);

# 写出查询的价格区间（比如：1000-2000），查询出rentInfo表中租金在此区间内的房源信息（sql语句）

SELECT * FROM rentinfo WHERE rent >= 1000 AND rent <=2000; 

# 写出查询无中介费的房源信息（sql语句）
SELECT * FROM rentinfo WHERE agencyprice=0;
SELECT * FROM rentinfo
# 写出删除rentInfo表中面积小于20平方的次卧（sql语句）
START TRANSACTION ;
DELETE FROM rentinfo WHERE areas <20;
ROLLBACK;
# 写出在rentInfo表新增一条记录（主卧，2300，22，500）的sql语句
INSERT INTO rentinfo VALUES ('主卧',2300,22,500);
COMMIT;


DROP TABLE IF EXISTS schooldb

CREATE 	TABLE schooldb(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(32) NOT NULL,
	sex VARCHAR(32) DEFAULT '男',
	department VARCHAR(32),
	score INT
);
ALTER TABLE schooldb DROP PRIMARY KEY; -- 删除主键
ALTER TABLE schooldb MODIFY id INT PRIMARY KEY  AUTO_INCREMENT; -- 添加主键和自动增长
SELECT * FROM schooldb
DROP DATABASE schooldb
START TRANSACTION;
INSERT INTO schooldb VALUES(1,'张三','女','体育系',9);

INSERT INTO schooldb VALUES(2,'李四','男','外语系',10);
INSERT INTO schooldb VALUES(3,'娜娜','女','中文系',6);
INSERT INTO schooldb VALUES(4,'凯蒂','男','外语系',7);
INSERT INTO schooldb VALUES(5,'肖鹿','男','表演系',1);
INSERT INTO schooldb VALUES(6,'菲菲','不详','外星系',0);
SELECT * FROM schooldb
#3.张三和凯蒂的性别（sex）弄反了，需要修改回来（sql语句）
UPDATE schooldb SET sex='男' WHERE NAME = '张三';
UPDATE schooldb SET sex='女' WHERE NAME = '凯蒂';

#4.菲菲不是本校学生，删除该记录（sql语句）
DELETE FROM schooldb WHERE NAME='菲菲';

# 缺失一名学生记录，学生信息自己定义（sql语句） 
INSERT INTO schooldb VALUES (6,'刘欢','男','计算机系',8);

# 6.按照系分组并统计每个系各有多少人（sql语句）
SELECT COUNT(*),department FROM schooldb  GROUP BY department  


# 按照学分给表中所有的学员进行排序，按降序将学员姓名输出到控制台上
SELECT NAME,score FROM schooldb ORDER BY score DESC;

ROLLBACK

COMMIT;







CREATE TABLE student(
	NAME VARCHAR(23),
	age INT,
	address VARCHAR(32),
	sex VARCHAR(23),
	money INT,
	subjects VARCHAR(32)
);

INSERT INTO student VALUES('帅地瓜',18,'山西省大同市','女',15000,'java');
INSERT INTO student VALUES('肖丁丁',19,'山东省青岛市','女',10500,'java');
INSERT INTO student VALUES('盖二弟',17,'山东省淄博市','女',10000,'java');
INSERT INTO student VALUES('杜老大',23,'山东省济南市','女',9000,'javaEE');
INSERT INTO student VALUES('菜菜',24,'河北省石家庄','女',12000,'javaEE');
INSERT INTO student VALUES('张家庄',32,'辽宁省大连市','男',9200,'javaEE');
INSERT INTO student VALUES('大白',45,'陕西省西安市','男',17500,'java');

SELECT * FROM student
START TRANSACTION;-- 开启事务
# 写出统计java学科薪资在10000以上的学生人数（sql语句）
SELECT * FROM student WHERE subjects='java' AND money>10000;

# 4.写出查询籍贯是山东省并且年龄在18岁以上的学生姓名（sql语句）
SELECT * FROM student WHERE address LIKE '山东省%' AND age>=18;

#.写出计算javaEE的平均薪资是多少（sql语句）
SELECT AVG(money) FROM student WHERE subjects='javaEE'

#6.写出按照薪资降序对所有学员进行排序（sql语句）
SELECT * FROM student ORDER BY money DESC

ROLLBACK;	-- 事务回滚

COMMIT;		-- 事务提交
