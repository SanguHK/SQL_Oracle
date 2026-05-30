
SQL*Plus: Release 11.2.0.1.0 Production on Fri May 29 16:50:20 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: SCOTT
Enter password:

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> set lines 100000 pages 10000
SP2-0267: linesize option 100000 out of range (1 through 32767)
SQL> set lines 10000 pages 10000
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

SQL> select *
  2  from dept
  3  ;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> select ename
  2  from emp
  3  where deptno in (select deptno
  4                     from dept
  5                     where dname='ACCOUNTING');

ENAME
----------
CLARK
KING
MILLER

SQL> select *
  2  from emp
  3  where deptno in(select deptno
  4                     from dept
  5                     where loc='CHICAGO');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30

6 rows selected.

SQL> select *
  2  from dept
  3  where deptno in (select deptno
  4                     from emp
  5                     where job in('SALESMAN','ANALYST'));

    DEPTNO DNAME          LOC
---------- -------------- -------------
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO

SQL> select *
  2  from dept
  3  where deptno in (select deptno
  4                     from emp
  5                     where sal between 1500 and 3700);

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO

SQL> select *
  2  from dept
  3  where deptno in (select deptno
  4                     from emp
  5                     where job in('SALESMAN','ANALYST'));

    DEPTNO DNAME          LOC
---------- -------------- -------------
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO

SQL> select dname,loc
  2  from dept
  3  where deptno in(select deptno
  4                     from emp
  5                     where comm is null);

DNAME          LOC
-------------- -------------
ACCOUNTING     NEW YORK
RESEARCH       DALLAS
SALES          CHICAGO


SQL> select *
  2  from dept
  3  where deptno in (select deptno
  4                     from emp
  5                     where ename like '%A%');

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO

