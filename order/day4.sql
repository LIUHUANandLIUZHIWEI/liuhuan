create  table  ����  select  * from  ��Ҫ���Ƶı�




     -- 1.��ѯ��������һ��Ա�������в���
     
          select * from emp where emp.deptno in (select dept.deptno from dept);
          
     -- 2.��ѯ���������ƺ���Щ���ŵ�Ա����Ϣ��ͬʱ��ѯ��û��Ա���Ĳ���
     
          select emp.*,dept.* from emp right join dept on emp.deptno=dept.deptno;
    
     -- 3.��ѯ���С�CLERK"(����Ա) �������Ͳ������ƣ��Լ���������
     select emp.ename,dd.coun,dept.dname from emp right join (select count(dept.deptno) coun,dept.deptno dname from emp,dept where dept.deptno=emp.deptno and emp.job='CLERK'
    group by dept.deptno) dd  on emp.deptno=dd.dname and emp.job='CLERK' left join dept on emp.deptno=dept.deptno
    
    
     -- 4.��ѯ������Ա����������ֱ���ϼ�������
     
     select p1.ename,p2.ename from emp p1,emp p2 where p1.mgr=p2.empno;
select * from emp
     -- 5.��ѯ��job��Ա�����ʵ����ֵ����Сֵ��ƽ��ֵ���ܺ�
     select max(nvl(sal,0)) from emp group by emp.job;
     select min(nvl(sal,0)) from emp group by emp.job;
     select avg(nvl(sal,0)) from emp group by emp.job;
     select sum(nvl(sal,0)) from emp group by emp.job;
     -- 6.ѡ��ͳ�Ƹ���job��Ա������(��ʾ:��job���з���)
     
      select count(emp.job) from emp group by emp.job
    
     -- 7.��ѯԱ����߹��ʺ���͹��ʵĲ��,����ΪDIFFERENCE��
         
        select max(sal)-min(sal) DIFFERENCE from emp 

     -- 8.��ѯ��������������Ա������͹��ʣ�������͹��ʲ��ܵ���800��û�й����ߵ�Ա������������
     select * from emp;
     select min(p1.sal),p2.empno from emp p1,emp p2 where p2.empno=p1.mgr and p1.sal>800 group by p2.empno;
     -- 9.��ѯ���в��ŵĲ�������dname������λ��loc��Ա�������͹���ƽ��ֵ�� 
            select dept.dname,dept.loc,des.* from dept left join  (select avg(nvl(emp.sal,0)),
                                                  count(dept.deptno),dept.deptno dep
                                             from emp right join dept on emp.deptno=dept.deptno group by dept.deptno)  des
                                             on des.dep=dept.deptno
      
     -- 10.��ѯ��scott��ͬ���ŵ�Ա������ename�͹�������hiredate
        select * from emp
        select p.* from emp p where p.deptno in ((select emp.deptno from emp where emp.ename='SCOTT'));
        
      --11.��ѯ���ʱȹ�˾ƽ�����ʸߵ�����Ա����Ա����empno������ename�͹���sal��
      
      select * from emp where emp.sal>(select avg(nvl(sal,0)) from emp)

      --12.��ѯ�������а�����ĸu��Ա������ͬ���ŵ�Ա����Ա����empno������ename
      
      select * from emp where emp.deptno in ((select emp.deptno from emp where emp.ename like2 '%U%'))

      --13.��ѯ�ڲ��ŵ�locΪnewYork�Ĳ��Ź�����Ա����Ա������ename����������dname�͸�λ����job
      SELECT * FROM DEPT
      select emp.ename,dept.dname,emp.job from emp,dept where dept.loc='NEW YORK' AND emp.deptno=dept.deptno

     -- 14.��ѯ��������king��Ա������ename�͹���sal
     select * from emp where emp.empno=7839
             select p1.sal,p1.ename from emp p1,emp p2 where p1.mgr=p2.empno and p2.ename='KING'
      --15.��ʾsales��������Щְλ
             select * from dept
             select emp.job from emp,dept where dept.dname='SALES' and emp.deptno=dept.deptno group by emp.job;
      --16.���������й��ʴ���1500��Ա������
      select * from emp
      select count(*) from emp where emp.sal>1500 group by emp.deptno
  
      --17.��ЩԱ���Ĺ��ʣ�����������˾��ƽ�����ʣ��г�Ա�������ֺ͹��ʣ�����
      
      select emp.ename,emp.sal from emp where emp.sal>(select avg(nvl(emp.sal,0)) from emp) order by emp.sal desc
  
     -- 18.���ڲ���ƽ�����ʸ���1500��Ա������
     select p1.* from 
     (select emp.deptno depton, avg(nvl(emp.sal,0)) from emp  group by emp.deptno having avg(nvl(emp.sal,0))>1500) de,
     emp p1 where  de.depton=p1.deptno
  
      --19.�г����������й�����ߵ�Ա������Ϣ�����֡����źš�����
      select  max(emp.sal) sal,emp.deptno deptno from emp group by emp.deptno
      select * from emp p,(select  max(emp.sal) sal,emp.deptno deptno from emp group by emp.deptno) em where p.deptno=em.deptno and p.sal=em.sal
      --20.�ĸ����ŵ�ƽ����������ߵģ��г����źš�ƽ������
     select avg(emp.sal), emp.deptno
     from  emp 
     group by  emp.deptno
     
    select * from dept t1,
    (select avg(emp.sal) sal,emp.deptno depto from emp  group by emp.deptno) t2
    where t1.deptno=t2.depto and t2.sal=
    (select max(em.sal) from (select avg(emp.sal) sal,emp.deptno depto from emp  group by emp.deptno) em );

select rownum,d2.*,dept.dname from (select d1.* from 
(select avg(emp.sal) sal,emp.deptno dep from emp group by emp.deptno) 
d1 order by d1.sal desc) d2 ,dept  where rownum=1 and dept.deptno=d2.dep

      
      
      