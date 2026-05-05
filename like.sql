
SQL*Plus: Release 11.2.0.1.0 Production on Tue May 5 15:35:41 2026

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

SQL> select ename,ename
  2  from emp;

ENAME      ENAME
---------- ----------
SMITH      SMITH
ALLEN      ALLEN
WARD       WARD
JONES      JONES
MARTIN     MARTIN
BLAKE      BLAKE
CLARK      CLARK
SCOTT      SCOTT
KING       KING
TURNER     TURNER
ADAMS      ADAMS
JAMES      JAMES
FORD       FORD
MILLER     MILLER

14 rows selected.

SQL> select comm,sal
  2  from emp;

      COMM        SAL
---------- ----------
                  800
       300       1600
       500       1250
                 2975
      1400       1250
                 2850
                 2450
                 3000
                 5000
         0       1500
                 1100
                  950
                 3000
                 1300

14 rows selected.

SQL> select empno,hiredate
  2  from emp;

     EMPNO HIREDATE
---------- ---------
      7369 17-DEC-80
      7499 20-FEB-81
      7521 22-FEB-81
      7566 02-APR-81
      7654 28-SEP-81
      7698 01-MAY-81
      7782 09-JUN-81
      7788 19-APR-87
      7839 17-NOV-81
      7844 08-SEP-81
      7876 23-MAY-87
      7900 03-DEC-81
      7902 03-DEC-81
      7934 23-JAN-82

14 rows selected.