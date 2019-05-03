SELECT * FROM STUDENT2
-- 分组查询  group by--`student2`
# 按照性别分组，分别查询男，女的平均分
SELECT SEX, SUM(MATH) 数学 FROM STUDENT2 GROUP BY SEX;
SELECT * FROM student
# 按照性别分别查询男，女同学的平均分，人数
SELECT SEX,AVG(MATH),COUNT(ID) FROM STUDENT2 GROUP BY SEX

# 按照性别，分别查询男，女的平均分，人数，要求 分数低于70分的人，不参与分组
SELECT SEX,AVG(MATH),COUNT(ID) FROM STUDENT2 WHERE MATH>70 GROUP BY SEX

# 按照性别 ，分别查询男，女平均分，人数，要求分数低于70分不参与分组，且人数要大于2个人
SELECT  SEX ,AVG(MATH) ,COUNT(ID) FROM STUDENT2 WHERE MATH>70 GROUP BY SEX HAVING COUNT(ID)>2;
SELECT  SEX 性别,AVG(MATH) 平均分,COUNT(ID)人数 FROM STUDENT2 WHERE MATH>70 GROUP BY SEX HAVING 人数>2;

-- 分页查询 limit 开始的索引 ， 每页查询的条数--

# 每页显示3条记录
SELECT * FROM STUDENT2 LIMIT 0,3;
# 公式 ： 开始的索引 = （当前的页码-1）*每页显示的条数
# 分页操作 LIMIT 是一个 MYSQL 方言

SELECT * FROM stu
SELECT * FROM STU; 
DROP TABLE STU;-- 删除表
DROP TABLE STU
select * from uset
-- 约束--
-- 非空约束 NOT NULL--
#建表  添加非空约束
CREATE TABLE STU(
	ID INT,
	NAME VARCHAR(32) NOT NULL -- 非空约束
);
# 删除name的非空约束
ALTER TABLE STU MODIFY NAME VARCHAR(32);

#创建表 后添加约束
ALTER TABLE STU MODIFY NAME VARCHAR(23) NOT NULL;
SELECT * FROM STU;

-- 唯一约束 UNIQUE--
#创建表 添加唯一约束
CREATE TABLE STU(
	ID INT,
	PHONE_NUMBER VARCHAR(20) UNIQUE
);
 SELECT * FROM STU
 # 删除 唯一约束
 ALTER TABLE STU DROP INDEX PHONE_NUMBER
 
 # 在查检表后 添加唯一约束
 ALTER TABLE STU MODIFY PHONE_NUMBER VARCHAR(32) UNIQUE;
 
 -- 主键约束 primary key 非空且唯一 一张表只能有一个主键--
 DROP TABLE stu-- 删除表
 # 创建表 添加主键约束
 CREATE TABLE STU(
	ID INT PRIMARY KEY,
	NAME VARCHAR(21)
 );
 
 # 删除主键
 ALTER TABLE STU DROP PRIMARY KEY;
 
 # 创建表后 添加主键
 ALTER TABLE STU MODIFY ID INT PRIMARY KEY;
 SELECT * FROM STU
                              
 -- 自动增长 AUTO_INCREMENT--
DROP TABLE STU
#创建表 添加 主键和 非空 唯一约束
CREATE TABLE STU(
	ID INT PRIMARY KEY AUTO_INCREMENT,-- 添加主键和自动增长约束
	NAME VARCHAR(32) NOT NULL,	  -- 添加非空 约束
	PHONE_NUMBER VARCHAR(23) UNIQUE   -- 添加唯一约束
);
# 删除自动增长
ALTER TABLE STU MODIFY ID INT
	\
	FOREIGN KEY  外键    UNIQUE 唯一约束
#添加自动增长 
ALTER TABLE STU MODIFY ID INT AUTO_INCREMENT
SELECT * FROM STU
INSERT INTO STU VALUES(NULL,'DDD','124231');

DELETE FROM STU WHERE ID=1;--	删除表内容
DELETE FROM STU WHERE ID=4;-- 删除表内容
	SELECT * FROM stu
SELECT NAME,PHONE_NUMBER FROM stu
INSERT INTO stu VALUES(1,'liuhuana','323123')
UPDATE  stu  SET stu.`PHONE_NUMBER`=123 WHERE stu.`ID`=4
INSERT INTO stu VALUES(8,'谭','34')
DELETE FROM stu WHERE id=7

UPDATE  stu SET NAME = 'liuhuan' WHERE id=1
# 差看编码集 
SHOW VARIABLES LIKE "%character%"; 
# 改变 编码 CHARACTER-SET-SERVER
SET NAMES utf8
SELECT * FROM stu 
SELECT *  FROM `student2`
select * from uset

INSERT  INTO  uset (NAME,gender,age,addre,qq,email) VALUES ("das","d",23,'dsad',"23123",'23124234');

update uset set name="liuhuan"  where id=63;
SELECT LAST_INSERT_ID();


select count(*) from uset


