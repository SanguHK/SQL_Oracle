-- SELECTION 
-- It is used to select data from specific table  by specifying specific columns and selecting specific rows
-- It is used to overcome the limitation of projection

-- Syntax:
-- Select */columnname
-- from emp
-- where LHS[columnname] condition RHS['Literals'];

-- Where clause:
-- It select each row if condition is satisfied,else it not select the row
-- LHS is used for specifying the columnname
-- Condition is done using the operators
-- RHS is used for literals
-- Literals: 3 types
-- 1.Number
-- 2.Date
-- 3.Char/String

-- Note:Date and Char/String literals must be written within ' '

 
SQL*Plus: Release 11.2.0.1.0 Production on Sun May 10 18:53:40 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: scott
Enter password:

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> select *
  2  from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
DEPT                           TABLE
EMP                            TABLE
SALGRADE                       TABLE

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

SQL> select *
  2  from emp
  3  where sal<1600;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

7 rows selected.

SQL> select ename,job
  2  from emp
  3  where job in 'SALESMAN';

ENAME      JOB
---------- ---------
ALLEN      SALESMAN
WARD       SALESMAN
MARTIN     SALESMAN
TURNER     SALESMAN

SQL> select ename,job
  2  from emp
  3  where job ='SALESMAN';

ENAME      JOB
---------- ---------
ALLEN      SALESMAN
WARD       SALESMAN
MARTIN     SALESMAN
TURNER     SALESMAN

SQL> select ename,job,hiredate
  2  from emp
  3  where hiredate='17-NOV-81';

ENAME      JOB       HIREDATE
---------- --------- ---------
KING       PRESIDENT 17-NOV-81

SQL> select 8
  2  select *
  3  from emp
  4  where deptno=10;
select *
*
ERROR at line 2:
ORA-00923: FROM keyword not found where expected


SQL> select *
  2  from emp
  3  where deptno=10;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

SQL> select ename,mgr
  2  from emp
  3  where mgr=7698;

ENAME             MGR
---------- ----------
ALLEN            7698
WARD             7698
MARTIN           7698
TURNER           7698
JAMES            7698

SQL> select *
  2  from emp
  3  where sal!=1400;

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

SQL> select *
  2  from emp
  3  where comm!=1400;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

SQL> select *
  2  from emp
  3  where ename='KING';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7839 KING       PRESIDENT            17-NOV-81       5000                    10

SQL> select *
  2  from emp
  3  where job not in 'CLERK';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

10 rows selected.

SQL> select *
  2  from emp
  3  where job!='CLERK';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

10 rows selected.

SQL> select *
  2  from emp
  3  where empno=7900;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

SQL> select *
  2  from emp
  3  where sal>5000;

no rows selected

SQL> select ename,deptno
  2  from emp
  3  where deptnp!=30;
where deptnp!=30
      *
ERROR at line 3:
ORA-00904: "DEPTNP": invalid identifier


SQL> select ename,deptno
  2  from emp
  3  where deptno!=30;

ENAME          DEPTNO
---------- ----------
SMITH              20
JONES              20
CLARK              10
SCOTT              20
KING               10
ADAMS              20
FORD               20
MILLER             10

8 rows selected.

SQL> select ename,hiredate
  2  from emp
  3  where hiredate>'31-DEC-83';

ENAME      HIREDATE
---------- ---------
SCOTT      19-APR-87
ADAMS      23-MAY-87

SQL> select ename,hiredate
  2  from emp
  3  where deptno<>10;

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80
ALLEN      20-FEB-81
WARD       22-FEB-81
JONES      02-APR-81
MARTIN     28-SEP-81
BLAKE      01-MAY-81
SCOTT      19-APR-87
TURNER     08-SEP-81
ADAMS      23-MAY-87
JAMES      03-DEC-81
FORD       03-DEC-81

11 rows selected.

SQL> select ename,hiredate,deptno
  2  from emp
  3  where deptno<>10;

ENAME      HIREDATE      DEPTNO
---------- --------- ----------
SMITH      17-DEC-80         20
ALLEN      20-FEB-81         30
WARD       22-FEB-81         30
JONES      02-APR-81         20
MARTIN     28-SEP-81         30
BLAKE      01-MAY-81         30
SCOTT      19-APR-87         20
TURNER     08-SEP-81         30
ADAMS      23-MAY-87         20
JAMES      03-DEC-81         30
FORD       03-DEC-81         20

11 rows selected.

SQL>