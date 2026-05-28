
SQL*Plus: Release 11.2.0.1.0 Production on Wed May 27 19:04:10 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: scott
Enter password:
ERROR:
ORA-12543: TNS:destination host unreachable


Enter user-name: scott
Enter password:

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> set lines 1000 pages 1000
SQL> select *
  2  from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
DEPT                           TABLE
EMP                            TABLE
SALGRADE                       TABLE

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

SQL> select deptno,count(*)
  2  from emp
  3  group by deptno;

    DEPTNO   COUNT(*)
---------- ----------
        30          6
        20          5
        10          3

SQL> select job,count(*)
  2  from emp
  3  where job between 3000 and 5000
  4  group by job;
where job between 3000 and 5000
      *
ERROR at line 3:
ORA-01722: invalid number


SQL> select job,count(*)
  2  from emp
  3  where sal  between 3000 and 5000
  4  group by job;

JOB         COUNT(*)
--------- ----------
PRESIDENT          1
ANALYST            2

SQL> select comm,count(*)
  2  from emp
  3  where comm is null
  4  group by comm;

      COMM   COUNT(*)
---------- ----------
                   10

SQL> select sal,count(*)
  2  from emp
  3  where dept in (10,20)
  4  group by sal;
where dept in (10,20)
      *
ERROR at line 3:
ORA-00904: "DEPT": invalid identifier


SQL> select sal,count(*)
  2  from emp
  3  where deptno in (10,20)
  4  group by sal;

       SAL   COUNT(*)
---------- ----------
      2450          1
      5000          1
      1300          1
      2975          1
      1100          1
      3000          2
       800          1

7 rows selected.

SQL> select hiredate, count(*)
  2  from emp
  3  where comm is not null
  4  ;
select hiredate, count(*)
       *
ERROR at line 1:
ORA-00937: not a single-group group function


SQL> select hiredate, count(*)
  2  from emp
  3  where comm is not null
  4  group by hiredate;

HIREDATE    COUNT(*)
--------- ----------
22-FEB-81          1
20-FEB-81          1
08-SEP-81          1
28-SEP-81          1

SQL> SELECT ENAME,COUNT(*)
  2  FROM EMP
  3  WHERE ENAME LIKE '%R%';
SELECT ENAME,COUNT(*)
       *
ERROR at line 1:
ORA-00937: not a single-group group function


SQL> SELECT ENAME,COUNT(*)
  2  FROM EMP
  3  WHERE ENAME LIKE '%R%'
  4  group by ename;

ENAME        COUNT(*)
---------- ----------
FORD                1
CLARK               1
MILLER              1
WARD                1
MARTIN              1
TURNER              1

6 rows selected.

SQL> select deptno,max(sal)
  2  from emp
  3  where sal >2000 and deptno=10
  4  group by deptno;

    DEPTNO   MAX(SAL)
---------- ----------
        10       5000

SQL> select deptno,max(sal)
  2  from emp
  3  where sal >2000
  4  group by deptno;

    DEPTNO   MAX(SAL)
---------- ----------
        30       2850
        20       3000
        10       5000

SQL> select job,min(mgr)
  2  from emp
  3  where sal is not null
  4  group by job;

JOB         MIN(MGR)
--------- ----------
CLERK           7698
SALESMAN        7698
PRESIDENT
MANAGER         7839
ANALYST         7566

