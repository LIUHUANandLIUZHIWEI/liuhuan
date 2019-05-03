1. ������ǿ
	Junit   
	@Test  ��������

	@Befor  ��Testִ��֮ǰִ�С�
	@After  ��Testִ��֮��ִ�С�

	���䣺ͨ���ֽ�����������������е����г�Ա��
		Field �ֶ� (��Ա����)
		Constructor ���췽��
		Method ��Ա����

	֮ǰ�ķ�ʽ������JVM�����Ǹ����ֽ�����󴴽�����
	���䣬���ý���JVM���Ҵ��������Լ�����

		��ȡ�ֽ����������ַ�ʽ��
			Person 
			1. Class clazz = Person.class;
			2. Person p = new Person();   Class clazz = p.getClass();
			3. Class clazz = Class.forName("com.itcast.demo.Person");
			public Person(int num){}
			public Person(){}
			// ͨ���ֽ�����󣬻�ȡ���췽���Ķ����Ŀ�ģ���Ϊ�˴�������Ķ���
			Constructor c = clazz.getConstructor(int.class);
			Object obj = c.newInstance(10);
			Person p = (Person)obj;

			Object obj = clazz.newInstance();

			// ��Ա����  Field
			// �õ���Ա������Ŀ�ģ���Ϊ�˸���Ա������ֵ
			// ��Ա�������ڶ������Ը�ֵ��ʱ��һ��Ҫ��������������ĸ�����ֵ
			Field f = clazz.getField("ename");
			f.set(obj,"����");
			f.get(obj);

			// ��Ա����
			// �õ�������Ŀ����Ϊ�ˣ�  Ϊ��ִ��
			// ��Ϊ����Ҳ��ֻ��ͨ�����������ã�������Ҳ�����������������õ����Ǹ�����ķ���
			Method m = clazz.getMethod("show",String.class);    show(){}   show(int num){}  show(String s){}
			m.invoke(obj,"abc");

			// ��������󣬵��������ԣ�������ֵ��

	ע�⣺ ���൱�����ࡢ��������Ա���������һ����ǩ
		�ײ���һ���̳���Annotation�ӿڵ�һ���ӿ�

		public @inteface MyAnno{
			// ���� == ���ǳ��󷽷�
			/*
				������������
				String
				ö��
				ע��
				�������͵�����
			*/
			String value();
			int show() default 10;
		}  

		@MyAnno(value = "abc",show = 123)  
		public class Student{
		}		

		/*
			���ע���е�����ֻ��һ��������Ϊvalue ��ô��ֵ��ʱ��value����ʡ��
			�����ֹһ������ôvalue����ʡ�ԣ�ÿ�������븳ֵ��������Ĭ��ֵ

			��עע���Ŀ����Ϊ��ʲô��   ��ܻ�ͨ����������ȡ��ע�������ֵ
		*/

			
		@Retention(RetentionPolicy.RUNTIME)  �� �涨��ע��ı���ʱ��   ������ʱ�ڣ�Source  Class  RunTime
		@Target({ElementType.METHOD}) :   �涨��ע����Ա�ע��λ��   �м�����Field,Type,CONSTRUCTOR,Method

		@SuppressWarnings("all")  ѹ�ƾ���
		@Override   ��д
		@FunctionalInteface  ����ʽ�ӿ�
		@Deprecated   ��ע�÷����ѹ�ʱ

2. ���ݿ����
	�����������ݵĲֿ⣬�ļ�ϵͳ�������Գ־û�����
	���ݿ���������ɵ�λ�ǣ���
 

	��ϵ�����ݿ⣺  Mysql Orcale   DB2   Sqlite  

	��ο�������
		������ʾ���� net start mysql

	�������ݿ⣺
		C:
			create database ����;
		R:
			show databases;
		U:
			alter database ���ݿ����� character set �ַ�������;
		D:
			drop database ����;

	�������ݱ�
		��������:
			int
			varchar(����)
			double( ��λ��, ����λ��)    66.999   double(5,3)
			date   ������
			dateTime  ������ʱ����
			timestamp   ������ʱ���� ���Ϊnull����ϵͳ��ǰʱ��ֵ
		C	
			create table ����(
				����1 �������� Լ��,
				...
				����n �������� Լ��
			);
			create table �±��� like �����Ʊ���;
		R
			* ��ѯĳ�����ݿ������еı�����
				* show tables;
			* ��ѯ��ṹ
				* desc ����;
		U
			1. �޸ı���
				alter table ���� rename to �µı���;
			2. �޸ı���ַ���
				alter table ���� character set �ַ�������;
			3. ���һ��
				alter table ���� add ���� ��������;
			4. �޸������� ����
				alter table ���� change ���� ������ ����������;
				alter table ���� modify ���� ����������;
			5. ɾ����
				alter table ���� drop ����;
		D
			drop table ����;

	�������ݣ�
		C
			insert into ����(����1������) value(ֵ1������)
		R
			select * from ���� 
			where ���� 
			group by �����ֶ� 
			having ����������� 
			order by �����ֶ� desc[asc] 
			limit ��ҳ
		U
			update ���� set	���� = ֵ where ����
		D
			delete from ���� where ����;
			truncate table ����;
		

3. ���ݿ� - select Լ��  ����ϵ
	1. �ۺ�   �����ĳһ�����ݵ�ֵ
		count(����)
		sum(����)
		avg(����)
		max(����)
		min(����)
	2. ����
		ֻ����һ�������ظ����ݣ�����������壬Ҫô�ͽ�ϾۺϺ���һͬʹ��
		select * from ���� group by �����ֶ�
	3. ����
		select * from ���� order by �����ֶ� desc[asc] 
	4. ��ҳ
		select * from ���� limit ��ʼ����, ��ʾ����
		��ʼ���� = (��ǰҳ�� - 1) * ��ʾ����;

	Լ��:
		1. ����  Ψһ�ҷǿ�  primary key  auto_increment
		2. �ǿ�  not null
		3. Ψһ  unique
		4. Ĭ��  default
		5. ���   foreign key    Լ�����ӱ�������	�������º�ɾ��������ô�ɡ�

	����ϵ��
		1. 1 vs 1  �û����û�����
		2. 1 vs n  �û������Ѽ�¼
		3. n vs m  ѧԱ�Կγ�

	��ʽ���������ݿ���������ࡾ���ࡢ�ظ���������
		1. 1nf ÿһ�ж���ԭ���У������ٷָ�
		2. 2nf ������������
		3. 3nf ������������

4. ���ݿ�  - ����ѯ������
	1. ����
		������
			��ʽ
				select * from ��1 , ��2 where ����
			��ʾ
				select * from ��1 inner join ��2 on ����
		������
			������   ��Ϊ�����ұ�������
				select * from ��1 left join ��2 on ����
			������   ��Ϊ�������������
				select * from ��1 right join ��2 on ����

	2. �Ӳ�ѯ �����ڲ�ѯ��Ƕ�ײ�ѯ
		1. �Ӳ�ѯ������е������
			select * from ���� where �ֶ� = > >= < <= != is null  is not null   != null
		2. �Ӳ�ѯ������е������
		select * from  ���� where �ֶ� in(�Ӳ�ѯ)
		     select * from emp where id = 1 or id = 2
			 select * from emp where id in(1,3)
			 between Сֵ and ��ֵ   [Сֵ����ֵ] 
		
		2. �Ӳ�ѯ������ж������
			select * from ��1 , (�Ӳ�ѯ) where ����;

	3. ����
		���ǰѶ��sql�Ĳ������ŵ�һ�������У�Ҫôͬʱ�ɹ���Ҫôͬʱʧ��

		1. ԭ����
		2. �־���
		3. ������
		4. һ����


5. JDBC ԭ��̬����
	JDBC: ����sun��˾��ߵ�һ���ӿ�[�淶]��  �����ݿ⹩Ӧ�̸����ṩ�����ʵ���ࡾ������

	�������裺
		1. ��jar�����������
		2. [ע������]
		3. ��ȡ����
		4. ����sql
		5. ��ȡִ���߶���  statement > preparedStatemend(sql)  Ч�ʸ���statement�������Է�ֹsqlע�빥��
		6. ���÷���ִ��
			int executeUpdate(sql);   ��ɾ�����
			ResultSet executeQuery(sql);  �����
				ResultSet  next()   �ƶ��������һ�У�����У�true,û������false
				getXxx(�ֶ���);
				getXxx(index);  ��1��ʼ���Ƽ�ʹ�ã�  
		7. ������
			return executeUpdate(sql) > 0;
			while(rs.next()){
				getXxx(�ֶ���);
			}
		8. �ͷ���Դ
			rs.close();
			stat.close();
			conn.close();

	�������
		conn.setAutoCommit(false); �����ֶ��ύ�����ǹر��Զ��ύ
		���ȫ���ɹ�
		conn.commit(); �ύ����
		���ִ�й��������κ��쳣������catch��ִ��
		conn.rollback();
	

6. JDBC���ݿ����ӳ�  JDBCTemplate
	����Ҫ��jar�����ر������mysql 5.5 jar��
	c3p0:	DataSource cs = new ComboPooledDataSource();
	druid:  DataSource ds = DruidDataSourceFactory.createDataSource(pro);
	dbcp:   BasicDataSource ds = new BasicDataSource();

	InitialSize=5   // ��ʼ��������
	MaxIdle=10      // ������������
	MaxWait=3000    // ��ȴ�ʱ��
	MaxActive=20    // ���������

	JDBCTemplate�� ����Ϊ�˰����Ǹ��ӷ���Ŀ���JDBC
		JDBCTemplat jt = new JDBCTemplate(JDBC_Utils.getDataSource());

		
		int row = jt.update(sql,����);
		List<E> list = jt.query(sql,new RowMapper(),����);
		Map map = jt.queryForMap(sql,����);  // ��Ϊ�ֶ���  ֵΪ��������
		List<Map<String,Object>> list =jt.queryForList(sql,����);
		Object obj = jt.queryForObject(sql,����);  // ��ۺϺ���������


		
		
		



