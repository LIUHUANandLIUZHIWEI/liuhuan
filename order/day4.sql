create  table  表明  select  * from  需要复制的表




     -- 1.查询出至少有一个员工的所有部门
     
          select * from emp where emp.deptno in (select dept.deptno from dept);
          
     -- 2.查询出部门名称和这些部门的员工信息，同时查询出没有员工的部门
     
          select emp.*,dept.* from emp right join dept on emp.deptno=dept.deptno;
    
     -- 3.查询所有“CLERK"(办事员) 的姓名和部门名称，以及部门人数
     select emp.ename,dd.coun,dept.dname from emp right join (select count(dept.deptno) coun,dept.deptno dname from emp,dept where dept.deptno=emp.deptno and emp.job='CLERK'
    group by dept.deptno) dd  on emp.deptno=dd.dname and emp.job='CLERK' left join dept on emp.deptno=dept.deptno
    
    
     -- 4.查询出所有员工的姓名和直接上级的姓名
     
     select p1.ename,p2.ename from emp p1,emp p2 where p1.mgr=p2.empno;
select * from emp
     -- 5.查询各job的员工工资的最大值，最小值，平均值，总和
     select max(nvl(sal,0)) from emp group by emp.job;
     select min(nvl(sal,0)) from emp group by emp.job;
     select avg(nvl(sal,0)) from emp group by emp.job;
     select sum(nvl(sal,0)) from emp group by emp.job;
     -- 6.选择统计各个job的员工人数(提示:对job进行分组)
     
      select count(emp.job) from emp group by emp.job
    
     -- 7.查询员工最高工资和最低工资的差距,列名为DIFFERENCE；
         
        select max(sal)-min(sal) DIFFERENCE from emp 

     -- 8.查询各个管理者属下员工的最低工资，其中最低工资不能低于800，没有管理者的员工不计算在内
     select * from emp;
     select min(p1.sal),p2.empno from emp p1,emp p2 where p2.empno=p1.mgr and p1.sal>800 group by p2.empno;
     -- 9.查询所有部门的部门名字dname，所在位置loc，员工数量和工资平均值； 
            select dept.dname,dept.loc,des.* from dept left join  (select avg(nvl(emp.sal,0)),
                                                  count(dept.deptno),dept.deptno dep
                                             from emp right join dept on emp.deptno=dept.deptno group by dept.deptno)  des
                                             on des.dep=dept.deptno
      
     -- 10.查询和scott相同部门的员工姓名ename和雇用日期hiredate
        select * from emp
        select p.* from emp p where p.deptno in ((select emp.deptno from emp where emp.ename='SCOTT'));
        
      --11.查询工资比公司平均工资高的所有员工的员工号empno，姓名ename和工资sal。
      
      select * from emp where emp.sal>(select avg(nvl(sal,0)) from emp)

      --12.查询和姓名中包含字母u的员工在相同部门的员工的员工号empno和姓名ename
      
      select * from emp where emp.deptno in ((select emp.deptno from emp where emp.ename like2 '%U%'))

      --13.查询在部门的loc为newYork的部门工作的员工的员工姓名ename，部门名称dname和岗位名称job
      SELECT * FROM DEPT
      select emp.ename,dept.dname,emp.job from emp,dept where dept.loc='NEW YORK' AND emp.deptno=dept.deptno

     -- 14.查询管理者是king的员工姓名ename和工资sal
     select * from emp where emp.empno=7839
             select p1.sal,p1.ename from emp p1,emp p2 where p1.mgr=p2.empno and p2.ename='KING'
      --15.显示sales部门有哪些职位
             select * from dept
             select emp.job from emp,dept where dept.dname='SALES' and emp.deptno=dept.deptno group by emp.job;
      --16.各个部门中工资大于1500的员工人数
      select * from emp
      select count(*) from emp where emp.sal>1500 group by emp.deptno
  
      --17.哪些员工的工资，高于整个公司的平均工资，列出员工的名字和工资（降序）
      
      select emp.ename,emp.sal from emp where emp.sal>(select avg(nvl(emp.sal,0)) from emp) order by emp.sal desc
  
     -- 18.所在部门平均工资高于1500的员工名字
     select p1.* from 
     (select emp.deptno depton, avg(nvl(emp.sal,0)) from emp  group by emp.deptno having avg(nvl(emp.sal,0))>1500) de,
     emp p1 where  de.depton=p1.deptno
  
      --19.列出各个部门中工资最高的员工的信息：名字、部门号、工资
      select  max(emp.sal) sal,emp.deptno deptno from emp group by emp.deptno
      select * from emp p,(select  max(emp.sal) sal,emp.deptno deptno from emp group by emp.deptno) em where p.deptno=em.deptno and p.sal=em.sal
      --20.哪个部门的平均工资是最高的，列出部门号、平均工资
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

      
      
      