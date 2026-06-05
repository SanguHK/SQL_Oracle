
SQL*Plus: Release 11.2.0.1.0 Production on Fri Jun 5 16:00:08 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

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

SQL> select * from emp;

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

SQL> select * from dept;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON


-- ANSI Syntax
SQL> select ename,dname
  2  from emp natural join dept;

ENAME      DNAME
---------- --------------
CLARK      ACCOUNTING
KING       ACCOUNTING
MILLER     ACCOUNTING
JONES      RESEARCH
FORD       RESEARCH
ADAMS      RESEARCH
SMITH      RESEARCH
SCOTT      RESEARCH
WARD       SALES
TURNER     SALES
ALLEN      SALES
JAMES      SALES
BLAKE      SALES
MARTIN     SALES

14 rows selected.

SQL> select *
  2  from emp natural join dept;

    DEPTNO      EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM DNAME          LOC
---------- ---------- ---------- --------- ---------- --------- ---------- ---------- -------------- -------------
        10       7782 CLARK      MANAGER         7839 09-JUN-81       2450            ACCOUNTING     NEW YORK
        10       7839 KING       PRESIDENT            17-NOV-81       5000            ACCOUNTING     NEW YORK
        10       7934 MILLER     CLERK           7782 23-JAN-82       1300            ACCOUNTING     NEW YORK
        20       7566 JONES      MANAGER         7839 02-APR-81       2975            RESEARCH       DALLAS
        20       7902 FORD       ANALYST         7566 03-DEC-81       3000            RESEARCH       DALLAS
        20       7876 ADAMS      CLERK           7788 23-MAY-87       1100            RESEARCH       DALLAS
        20       7369 SMITH      CLERK           7902 17-DEC-80        800            RESEARCH       DALLAS
        20       7788 SCOTT      ANALYST         7566 19-APR-87       3000            RESEARCH       DALLAS
        30       7521 WARD       SALESMAN        7698 22-FEB-81       1250        500 SALES          CHICAGO
        30       7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0 SALES          CHICAGO
        30       7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300 SALES          CHICAGO
        30       7900 JAMES      CLERK           7698 03-DEC-81        950            SALES          CHICAGO
        30       7698 BLAKE      MANAGER         7839 01-MAY-81       2850            SALES          CHICAGO
        30       7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400 SALES          CHICAGO

14 rows selected.

SQL> select *
  2  from salgrade;

     GRADE      LOSAL      HISAL
---------- ---------- ----------
         1        700       1200
         2       1201       1400
         3       1401       2000
         4       2001       3000
         5       3001       9999

SQL> select ename,grade
  2  from emp natural join salgrade;

ENAME           GRADE
---------- ----------
SMITH               1
ALLEN               1
WARD                1
JONES               1
MARTIN              1
BLAKE               1
CLARK               1
SCOTT               1
KING                1
TURNER              1
ADAMS               1
JAMES               1
FORD                1
MILLER              1
SMITH               2
ALLEN               2
WARD                2
JONES               2
MARTIN              2
BLAKE               2
CLARK               2
SCOTT               2
KING                2
TURNER              2
ADAMS               2
JAMES               2
FORD                2
MILLER              2
SMITH               3
ALLEN               3
WARD                3
JONES               3
MARTIN              3
BLAKE               3
CLARK               3
SCOTT               3
KING                3
TURNER              3
ADAMS               3
JAMES               3
FORD                3
MILLER              3
SMITH               4
ALLEN               4
WARD                4
JONES               4
MARTIN              4
BLAKE               4
CLARK               4
SCOTT               4
KING                4
TURNER              4
ADAMS               4
JAMES               4
FORD                4
MILLER              4
SMITH               5
ALLEN               5
WARD                5
JONES               5
MARTIN              5
BLAKE               5
CLARK               5
SCOTT               5
KING                5
TURNER              5
ADAMS               5
JAMES               5
FORD                5
MILLER              5

70 rows selected.

-- no oracle syntax