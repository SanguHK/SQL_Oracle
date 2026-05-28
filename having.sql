
SQL*Plus: Release 11.2.0.1.0 Production on Wed May 27 21:35:00 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: scott
Enter password:

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> set lines 1000 pages 1000
SQL> select *
  2  from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

14 rows selected.

SQL> select  count(*), deptno
  2  from emp
  3  group by deptno
  4  having count(*)>2;

  COUNT(*)     DEPTNO
---------- ----------
         6         30
         5         20
         3         10

SQL> select count(*),job
  2  from emp
  3  group by job
  4  having count(*)<4;

  COUNT(*) JOB
---------- ---------
         1 PRESIDENT
         3 MANAGER
         2 ANALYST

SQL> select count(*),job
  2  from emp
  3  where job in ('ANALYST','SALESMAN','MANAGER','PRESIDENT')
  4  GROUP BY job
  5  having max(sal)>800;

  COUNT(*) JOB
---------- ---------
         4 SALESMAN
         1 PRESIDENT
         3 MANAGER
         2 ANALYST

SQL> select count(*),sal
  2  from emp
  3  where mgr in(7698,7839,7902,7788)
  4  group by sal
  5  having min(sal)<4700
  6  order by minimum_salary desc;
order by minimum_salary desc
         *
ERROR at line 6:
ORA-00904: "MINIMUM_SALARY": invalid identifier


SQL> select count(*),sal
  2  from emp
  3  where mgr in(7698,7839,7902,7788)
  4  group by sal
  5  having min(sal)<4700
  6  order by sal as minimum_salary desc;
order by sal as minimum_salary desc
             *
ERROR at line 6:
ORA-00933: SQL command not properly ended


SQL> select count(*),sal
  2  from emp
  3  where mgr in(7698,7839,7902,7788)
  4  group by sal
  5  having min(sal)<4700
  6  order by sal  desc;

  COUNT(*)        SAL
---------- ----------
         1       2975
         1       2850
         1       2450
         1       1600
         1       1500
         2       1250
         1       1100
         1        950
         1        800

9 rows selected.

SQL> select  max(sal),hiredate
  2  from emp
  3  where comm is null
  4  group by hiredate
  5  having max(sal) between 1500 and 4500;

  MAX(SAL) HIREDATE
---------- ---------
      3000 03-DEC-81
      2450 09-JUN-81
      2975 02-APR-81
      3000 19-APR-87
      2850 01-MAY-81

SQL> select count(*), ename
  2  from mep
  3  where ename like '%A'
  4  group by ename
  5  having count(*)<3;
from mep
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> select count(*), ename
  2  from emp
  3  where ename like '%A'
  4  group by ename
  5  having count(*)<3;

no rows selected

SQL> select count(*), ename
  2  from emp
  3  where ename like '%A%'
  4  group by ename
  5  having count(*)<3;

  COUNT(*) ENAME
---------- ----------
         1 ALLEN
         1 CLARK
         1 WARD
         1 MARTIN
         1 ADAMS
         1 BLAKE
         1 JAMES

7 rows selected.

SQL> select min(sal),deptno
  2  from emp
  3  where job not in 'PRESIDENT'
  4  group by deptno
  5  having count(*)<4;

  MIN(SAL)     DEPTNO
---------- ----------
      1300         10

SQL> select max(ename),job
  2  from emp
  3  group by job
  4  where count(*)<3;
where count(*)<3
*
ERROR at line 4:
ORA-00933: SQL command not properly ended


SQL> select max(ename),job
  2  from emp
  3  where count(*)<3;
where count(*)<3
      *
ERROR at line 3:
ORA-00934: group function is not allowed here


SQL> select max(ename),job
  2  from emp
  3  group by job
  4  having count(*)<3;

MAX(ENAME) JOB
---------- ---------
KING       PRESIDENT
SCOTT      ANALYST

