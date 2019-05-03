1. 基础加强
	Junit   
	@Test  导入依赖

	@Befor  在Test执行之前执行。
	@After  在Test执行之后执行。

	反射：通过字节码对象来操作该类中的所有成员；
		Field 字段 (成员变量)
		Constructor 构造方法
		Method 成员方法

	之前的方式，是让JVM帮我们根据字节码对象创建对象。
	反射，不用借助JVM帮我创建，我自己来；

		获取字节码对象的三种方式：
			Person 
			1. Class clazz = Person.class;
			2. Person p = new Person();   Class clazz = p.getClass();
			3. Class clazz = Class.forName("com.itcast.demo.Person");
			public Person(int num){}
			public Person(){}
			// 通过字节码对象，获取构造方法的对象的目的，是为了创建该类的对象
			Constructor c = clazz.getConstructor(int.class);
			Object obj = c.newInstance(10);
			Person p = (Person)obj;

			Object obj = clazz.newInstance();

			// 成员变量  Field
			// 拿到成员变量的目的，是为了给成员变量赋值
			// 成员变量属于对象，所以赋值的时候，一定要告诉他，你想给哪个对象赋值
			Field f = clazz.getField("ename");
			f.set(obj,"张三");
			f.get(obj);

			// 成员方法
			// 拿到方法的目的是为了？  为了执行
			// 因为方法也是只能通过对象来调用，所以我也必须告诉他，我想调用的是那个对象的方法
			Method m = clazz.getMethod("show",String.class);    show(){}   show(int num){}  show(String s){}
			m.invoke(obj,"abc");

			// 给任意对象，的任意属性，赋任意值；

	注解： 就相当于是类、方法、成员变量上面的一个标签
		底层是一个继承了Annotation接口的一个接口

		public @inteface MyAnno{
			// 属性 == 就是抽象方法
			/*
				基本数据类型
				String
				枚举
				注解
				以上类型的数组
			*/
			String value();
			int show() default 10;
		}  

		@MyAnno(value = "abc",show = 123)  
		public class Student{
		}		

		/*
			如果注解中的属性只有一个，并且为value 那么赋值的时候，value可以省略
			如果不止一个，那么value不能省略，每个都必须赋值，除非有默认值

			标注注解的目的是为了什么？   框架会通过反射来获取该注解的属性值
		*/

			
		@Retention(RetentionPolicy.RUNTIME)  ： 规定该注解的保留时期   有三个时期，Source  Class  RunTime
		@Target({ElementType.METHOD}) :   规定该注解可以标注的位置   有几个：Field,Type,CONSTRUCTOR,Method

		@SuppressWarnings("all")  压制警告
		@Override   重写
		@FunctionalInteface  函数式接口
		@Deprecated   标注该方法已过时

2. 数据库概念
	用来保存数据的仓库，文件系统，他可以持久化保存
	数据库的最基本组成单位是：表
 

	关系型数据库：  Mysql Orcale   DB2   Sqlite  

	如何开启服务：
		命令提示符： net start mysql

	操作数据库：
		C:
			create database 库名;
		R:
			show databases;
		U:
			alter database 数据库名称 character set 字符集名称;
		D:
			drop database 库名;

	操作数据表：
		数据类型:
			int
			varchar(长度)
			double( 总位数, 保留位数)    66.999   double(5,3)
			date   年月日
			dateTime  年月日时分秒
			timestamp   年月日时分秒 如果为null，赋系统当前时间值
		C	
			create table 表名(
				列名1 数据类型 约束,
				...
				列名n 数据类型 约束
			);
			create table 新表名 like 被复制表名;
		R
			* 查询某个数据库中所有的表名称
				* show tables;
			* 查询表结构
				* desc 表名;
		U
			1. 修改表名
				alter table 表名 rename to 新的表名;
			2. 修改表的字符集
				alter table 表名 character set 字符集名称;
			3. 添加一列
				alter table 表名 add 列名 数据类型;
			4. 修改列名称 类型
				alter table 表名 change 列名 新列名 新数据类型;
				alter table 表名 modify 列名 新数据类型;
			5. 删除列
				alter table 表名 drop 列名;
		D
			drop table 表名;

	操作数据：
		C
			insert into 表名(列名1。。。) value(值1。。。)
		R
			select * from 表名 
			where 条件 
			group by 分组字段 
			having 分组过滤条件 
			order by 排序字段 desc[asc] 
			limit 分页
		U
			update 表名 set	列名 = 值 where 条件
		D
			delete from 表名 where 条件;
			truncate table 表名;
		

3. 数据库 - select 约束  多表关系
	1. 聚合   查表中某一个数据的值
		count(列名)
		sum(列名)
		avg(列名)
		max(列名)
		min(列名)
	2. 分组
		只有那一列中有重复数据，分组才有意义，要么就结合聚合函数一同使用
		select * from 表名 group by 分组字段
	3. 排序
		select * from 表名 order by 排序字段 desc[asc] 
	4. 分页
		select * from 表名 limit 开始索引, 显示条数
		开始索引 = (当前页码 - 1) * 显示条数;

	约束:
		1. 主键  唯一且非空  primary key  auto_increment
		2. 非空  not null
		3. 唯一  unique
		4. 默认  default
		5. 外键   foreign key    约束主从表中数据	级联更新和删除【别这么干】

	多表关系：
		1. 1 vs 1  用户对用户详情
		2. 1 vs n  用户对消费记录
		3. n vs m  学员对课程

	范式：消除数据库的数据冗余【多余、重复、垃圾】
		1. 1nf 每一列都是原子列，不可再分割
		2. 2nf 消除部分依赖
		3. 3nf 消除传递依赖

4. 数据库  - 多表查询，事务
	1. 连接
		内连接
			隐式
				select * from 表1 , 表2 where 条件
			显示
				select * from 表1 inner join 表2 on 条件
		外连接
			左连接   左为主表及右表交集数据
				select * from 表1 left join 表2 on 条件
			右连接   右为主表及左表交集数据
				select * from 表1 right join 表2 on 条件

	2. 子查询 就是在查询中嵌套查询
		1. 子查询结果单行单列情况
			select * from 表名 where 字段 = > >= < <= != is null  is not null   != null
		2. 子查询结果多行单列情况
		select * from  表名 where 字段 in(子查询)
		     select * from emp where id = 1 or id = 2
			 select * from emp where id in(1,3)
			 between 小值 and 大值   [小值，大值] 
		
		2. 子查询结果多行多列情况
			select * from 表1 , (子查询) where 条件;

	3. 事务
		就是把多个sql的操作，放到一个事务中，要么同时成功，要么同时失败

		1. 原子性
		2. 持久性
		3. 隔离性
		4. 一致性


5. JDBC 原生态开发
	JDBC: 就是sun公司提高的一共接口[规范]！  让数据库供应商负责提供具体的实现类【驱动】

	开发步骤：
		1. 导jar包，添加依赖
		2. [注册驱动]
		3. 获取连接
		4. 定义sql
		5. 获取执行者对象  statement > preparedStatemend(sql)  效率高于statement，还可以防止sql注入攻击
		6. 调用方法执行
			int executeUpdate(sql);   增删改语句
			ResultSet executeQuery(sql);  查语句
				ResultSet  next()   移动光标至下一行，如果有，true,没有数据false
				getXxx(字段名);
				getXxx(index);  从1开始不推荐使用；  
		7. 处理结果
			return executeUpdate(sql) > 0;
			while(rs.next()){
				getXxx(字段名);
			}
		8. 释放资源
			rs.close();
			stat.close();
			conn.close();

	事务管理：
		conn.setAutoCommit(false); 设置手动提交，就是关闭自动提交
		如果全部成功
		conn.commit(); 提交事务；
		如果执行过程中有任何异常，就在catch中执行
		conn.rollback();
	

6. JDBC数据库连接池  JDBCTemplate
	都需要导jar包！特别别忘了mysql 5.5 jar包
	c3p0:	DataSource cs = new ComboPooledDataSource();
	druid:  DataSource ds = DruidDataSourceFactory.createDataSource(pro);
	dbcp:   BasicDataSource ds = new BasicDataSource();

	InitialSize=5   // 初始化连接数
	MaxIdle=10      // 最大空闲连接数
	MaxWait=3000    // 最长等待时间
	MaxActive=20    // 最大连接数

	JDBCTemplate： 就是为了帮我们更加方便的开发JDBC
		JDBCTemplat jt = new JDBCTemplate(JDBC_Utils.getDataSource());

		
		int row = jt.update(sql,参数);
		List<E> list = jt.query(sql,new RowMapper(),参数);
		Map map = jt.queryForMap(sql,参数);  // 键为字段名  值为行内数据
		List<Map<String,Object>> list =jt.queryForList(sql,参数);
		Object obj = jt.queryForObject(sql,参数);  // 查聚合函数的数据


		
		
		



