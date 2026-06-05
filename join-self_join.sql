
SQL*Plus: Release 11.2.0.1.0 Production on Fri Jun 5 20:16:16 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: Scott
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
      1111 WARNER     SALESMAN             04-JUN-26       5000        200

15 rows selected.

SQL> select e1.ename subordinate e2.ename manager
  2  from emp e1,emp e2
  3  where e1.mgr=e2.empno;
select e1.ename subordinate e2.ename manager
                            *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> select e1.ename subordinate, e2.ename manager
  2  from emp e1,emp e2
  3  where e1.mgr=e2.empno;

SUBORDINAT MANAGER
---------- ----------
FORD       JONES
SCOTT      JONES
TURNER     BLAKE
ALLEN      BLAKE
WARD       BLAKE
JAMES      BLAKE
MARTIN     BLAKE
MILLER     CLARK
ADAMS      SCOTT
BLAKE      KING
JONES      KING
CLARK      KING
SMITH      FORD

13 rows selected.

SQL> select e1.ename manager,e2.ename worker
  2  from emp e1,emp e2
  3  where e1.empno=e2.mgr;

MANAGER    WORKER
---------- ----------
JONES      FORD
JONES      SCOTT
BLAKE      TURNER
BLAKE      ALLEN
BLAKE      WARD
BLAKE      JAMES
BLAKE      MARTIN
CLARK      MILLER
SCOTT      ADAMS
KING       BLAKE
KING       JONES
KING       CLARK
FORD       SMITH

13 rows selected.


SQL> select distinct e1.ename, e2.sal
  2  from emp e1,emp e2
  3  where e1.sal=e2.sal and e1.empno!=e2.empno;

ENAME             SAL
---------- ----------
SCOTT            3000
MARTIN           1250
WARNER           5000
KING             5000
WARD             1250
FORD             3000

6 rows selected.

SQL> select e1.ename, e2.sal
  2  from emp e1,emp e2
  3  where e1.sal=e2.sal and e1.empno!=e2.empno;

ENAME             SAL
---------- ----------
MARTIN           1250
WARD             1250
FORD             3000
WARNER           5000
SCOTT            3000
KING             5000

6 rows selected.

SQL> select e1.ename,e2.deptno
  2  from emp e1,emp e2
  3  where e1.deptno=e2.deptno and e1.empno!=e2.empno;

ENAME          DEPTNO
---------- ----------
FORD               20
ADAMS              20
SCOTT              20
JONES              20
JAMES              30
TURNER             30
BLAKE              30
MARTIN             30
WARD               30
JAMES              30
TURNER             30
BLAKE              30
MARTIN             30
ALLEN              30
FORD               20
ADAMS              20
SCOTT              20
SMITH              20
JAMES              30
TURNER             30
BLAKE              30
WARD               30
ALLEN              30
JAMES              30
TURNER             30
MARTIN             30
WARD               30
ALLEN              30
MILLER             10
KING               10
FORD               20
ADAMS              20
JONES              20
SMITH              20
MILLER             10
CLARK              10
JAMES              30
BLAKE              30
MARTIN             30
WARD               30
ALLEN              30
FORD               20
SCOTT              20
JONES              20
SMITH              20
TURNER             30
BLAKE              30
MARTIN             30
WARD               30
ALLEN              30
ADAMS              20
SCOTT              20
JONES              20
SMITH              20
KING               10
CLARK              10

56 rows selected.

SQL> select e1.ename,e2.hiredate
  2  from emp e1,emp e2
  3  where e1.hiredate=e2.hiredate and e1.empno!=e2.empno;

ENAME      HIREDATE
---------- ---------
FORD       03-DEC-81
JAMES      03-DEC-81

SQL> select e1.ename,e2.job
  2  from emp e1,emp e2
  3  where e1.job=e2.job and e1.empno!=e2.empno;

ENAME      JOB
---------- ---------
MILLER     CLERK
JAMES      CLERK
ADAMS      CLERK
WARNER     SALESMAN
TURNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
WARNER     SALESMAN
TURNER     SALESMAN
MARTIN     SALESMAN
ALLEN      SALESMAN
CLARK      MANAGER
BLAKE      MANAGER
WARNER     SALESMAN
TURNER     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN
CLARK      MANAGER
JONES      MANAGER
BLAKE      MANAGER
JONES      MANAGER
FORD       ANALYST
WARNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN
MILLER     CLERK
JAMES      CLERK
SMITH      CLERK
MILLER     CLERK
ADAMS      CLERK
SMITH      CLERK
SCOTT      ANALYST
JAMES      CLERK
ADAMS      CLERK
SMITH      CLERK
TURNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN

40 rows selected.

SQL> select e1.ename,e2.job
  2  from emp e1,emp e2
  3  where e1.job=e2.job ;

ENAME      JOB
---------- ---------
MILLER     CLERK
JAMES      CLERK
ADAMS      CLERK
SMITH      CLERK
WARNER     SALESMAN
TURNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN
WARNER     SALESMAN
TURNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN
CLARK      MANAGER
BLAKE      MANAGER
JONES      MANAGER
WARNER     SALESMAN
TURNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN
CLARK      MANAGER
BLAKE      MANAGER
JONES      MANAGER
CLARK      MANAGER
BLAKE      MANAGER
JONES      MANAGER
FORD       ANALYST
SCOTT      ANALYST
KING       PRESIDENT
WARNER     SALESMAN
TURNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN
MILLER     CLERK
JAMES      CLERK
ADAMS      CLERK
SMITH      CLERK
MILLER     CLERK
JAMES      CLERK
ADAMS      CLERK
SMITH      CLERK
FORD       ANALYST
SCOTT      ANALYST
MILLER     CLERK
JAMES      CLERK
ADAMS      CLERK
SMITH      CLERK
WARNER     SALESMAN
TURNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN

55 rows selected.

SQL> select e1.ename,e2.job
  2  from emp e1,emp e2
  3  where e1.job=e2.job and e1.empno!=e2.empno;

ENAME      JOB
---------- ---------
MILLER     CLERK
JAMES      CLERK
ADAMS      CLERK
WARNER     SALESMAN
TURNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
WARNER     SALESMAN
TURNER     SALESMAN
MARTIN     SALESMAN
ALLEN      SALESMAN
CLARK      MANAGER
BLAKE      MANAGER
WARNER     SALESMAN
TURNER     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN
CLARK      MANAGER
JONES      MANAGER
BLAKE      MANAGER
JONES      MANAGER
FORD       ANALYST
WARNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN
MILLER     CLERK
JAMES      CLERK
SMITH      CLERK
MILLER     CLERK
ADAMS      CLERK
SMITH      CLERK
SCOTT      ANALYST
JAMES      CLERK
ADAMS      CLERK
SMITH      CLERK
TURNER     SALESMAN
MARTIN     SALESMAN
WARD       SALESMAN
ALLEN      SALESMAN

40 rows selected.

SQL> select e1.ename,e2.mgr
  2  from emp e1,emp e2
  3  where e1.mgr=e2.mgr and e1.empno!=e2.empno;

ENAME             MGR
---------- ----------
JAMES            7698
TURNER           7698
MARTIN           7698
WARD             7698
JAMES            7698
TURNER           7698
MARTIN           7698
ALLEN            7698
CLARK            7839
BLAKE            7839
JAMES            7698
TURNER           7698
WARD             7698
ALLEN            7698
CLARK            7839
JONES            7839
BLAKE            7839
JONES            7839
FORD             7566
JAMES            7698
MARTIN           7698
WARD             7698
ALLEN            7698
TURNER           7698
MARTIN           7698
WARD             7698
ALLEN            7698
SCOTT            7566

28 rows selected.

SQL> select e1.ename,e2.comm
  2  from emp e1,emp e2
  3  where e1.sal=e2.sal and e1.empno!=e2.empno;

ENAME            COMM
---------- ----------
MARTIN            500
WARD             1400
FORD
WARNER
SCOTT
KING              200

6 rows selected.

SQL>