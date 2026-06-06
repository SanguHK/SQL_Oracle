
SQL*Plus: Release 11.2.0.1.0 Production on Tue Jun 2 17:03:42 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: scott
Enter password:

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> set lines 1000 pages
SQL> select *
  2  from tab;
BONUS                          TABLE
DEPT                           TABLE
EMP                            TABLE
SALGRADE                       TABLE

SQL> select *
  2  from emp;
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

SQL> desc emp
 Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 EMPNO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   NOT NULL NUMBER(4)
 ENAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            VARCHAR2(10)
 JOB                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              VARCHAR2(9)
 MGR                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              NUMBER(4)
 HIREDATE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         DATE
 SAL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              NUMBER(7,2)
 COMM                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             NUMBER(7,2)
 DEPTNO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           NUMBER(2)

SQL> select *
  2  from dept
  3  ;
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> desc dept
 Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 DEPTNO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  NOT NULL NUMBER(2)
 DNAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            VARCHAR2(14)
 LOC                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              VARCHAR2(13)

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno;
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

SQL> select ename,dname
  2  from emp inner join dept
  3  where emp.deptno=dept.deptno;
where emp.deptno=dept.deptno
*
ERROR at line 3:
ORA-00905: missing keyword


SQL> select ename,dname
  2  from emp,dept
  3  on emp.deptno=dept.deptno;
on emp.deptno=dept.deptno
*
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> select ename,dname
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno;
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

SQL> select ename,job,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno and job in('SALESMAN');
ALLEN      SALESMAN  SALES
TURNER     SALESMAN  SALES
MARTIN     SALESMAN  SALES
WARD       SALESMAN  SALES

SQL> select ename
  2  select ename;
select ename
*
ERROR at line 2:
ORA-00923: FROM keyword not found where expected


SQL> select ename,job,dname
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno and job in('SALESMAN');
ALLEN      SALESMAN  SALES
TURNER     SALESMAN  SALES
MARTIN     SALESMAN  SALES
WARD       SALESMAN  SALES

SQL> select ename
  2  from emp,dept
  3  where emp.deptno=dept.deptno and loc='NEW YORK';
CLARK
KING
MILLER

SQL> from emp,dept
SP2-0734: unknown command beginning "from emp,d..." - rest of line ignored.
SQL> select ename
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno and loc='NEW YORK';
CLARK
KING
MILLER

SQL> select emp.*,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno ;
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10 ACCOUNTING
      7839 KING       PRESIDENT            17-NOV-81       5000                    10 ACCOUNTING
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10 ACCOUNTING
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20 RESEARCH
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20 RESEARCH
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20 RESEARCH
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20 RESEARCH
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20 RESEARCH
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30 SALES
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30 SALES
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30 SALES
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30 SALES
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30 SALES
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30 SALES

14 rows selected.

SQL> select emp.*,dname
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno ;
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10 ACCOUNTING
      7839 KING       PRESIDENT            17-NOV-81       5000                    10 ACCOUNTING
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10 ACCOUNTING
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20 RESEARCH
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20 RESEARCH
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20 RESEARCH
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20 RESEARCH
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20 RESEARCH
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30 SALES
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30 SALES
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30 SALES
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30 SALES
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30 SALES
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30 SALES

14 rows selected.

SQL> select ename,dept.*
  2  from emp,dept
  3  where emp.deptno=dept.deptno ;
CLARK              10 ACCOUNTING     NEW YORK
KING               10 ACCOUNTING     NEW YORK
MILLER             10 ACCOUNTING     NEW YORK
JONES              20 RESEARCH       DALLAS
FORD               20 RESEARCH       DALLAS
ADAMS              20 RESEARCH       DALLAS
SMITH              20 RESEARCH       DALLAS
SCOTT              20 RESEARCH       DALLAS
WARD               30 SALES          CHICAGO
TURNER             30 SALES          CHICAGO
ALLEN              30 SALES          CHICAGO
JAMES              30 SALES          CHICAGO
BLAKE              30 SALES          CHICAGO
MARTIN             30 SALES          CHICAGO

14 rows selected.

SQL> select emp.*,dname
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno ;
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10 ACCOUNTING
      7839 KING       PRESIDENT            17-NOV-81       5000                    10 ACCOUNTING
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10 ACCOUNTING
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20 RESEARCH
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20 RESEARCH
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20 RESEARCH
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20 RESEARCH
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20 RESEARCH
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30 SALES
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30 SALES
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30 SALES
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30 SALES
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30 SALES
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30 SALES

14 rows selected.

SQL> select *
  2  from emp,dept
  3  where emp.deptno=dept.deptno ;
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO

14 rows selected.

SQL> select *
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno ;
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO

14 rows selected.

SQL> select emp.*,dept.*
  2  from emp,dept
  3  where emp.deptno=dept.deptno ;
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO

14 rows selected.

SQL> select emp.*,dept.*
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno ;
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO

14 rows selected.

SQL> select ename,job,sal,deptno,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno ;
select ename,job,sal,deptno,dname
                     *
ERROR at line 1:
ORA-00918: column ambiguously defined


SQL> select ename,job,sal,emp.deptno,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno ;
CLARK      MANAGER         2450         10 ACCOUNTING
KING       PRESIDENT       5000         10 ACCOUNTING
MILLER     CLERK           1300         10 ACCOUNTING
JONES      MANAGER         2975         20 RESEARCH
FORD       ANALYST         3000         20 RESEARCH
ADAMS      CLERK           1100         20 RESEARCH
SMITH      CLERK            800         20 RESEARCH
SCOTT      ANALYST         3000         20 RESEARCH
WARD       SALESMAN        1250         30 SALES
TURNER     SALESMAN        1500         30 SALES
ALLEN      SALESMAN        1600         30 SALES
JAMES      CLERK            950         30 SALES
BLAKE      MANAGER         2850         30 SALES
MARTIN     SALESMAN        1250         30 SALES

14 rows selected.

SQL> select ename,job,sal,dept.deptno,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno ;
CLARK      MANAGER         2450         10 ACCOUNTING
KING       PRESIDENT       5000         10 ACCOUNTING
MILLER     CLERK           1300         10 ACCOUNTING
JONES      MANAGER         2975         20 RESEARCH
FORD       ANALYST         3000         20 RESEARCH
ADAMS      CLERK           1100         20 RESEARCH
SMITH      CLERK            800         20 RESEARCH
SCOTT      ANALYST         3000         20 RESEARCH
WARD       SALESMAN        1250         30 SALES
TURNER     SALESMAN        1500         30 SALES
ALLEN      SALESMAN        1600         30 SALES
JAMES      CLERK            950         30 SALES
BLAKE      MANAGER         2850         30 SALES
MARTIN     SALESMAN        1250         30 SALES

14 rows selected.

SQL> select ename,job,sal,emp.deptno,dname
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno ;
CLARK      MANAGER         2450         10 ACCOUNTING
KING       PRESIDENT       5000         10 ACCOUNTING
MILLER     CLERK           1300         10 ACCOUNTING
JONES      MANAGER         2975         20 RESEARCH
FORD       ANALYST         3000         20 RESEARCH
ADAMS      CLERK           1100         20 RESEARCH
SMITH      CLERK            800         20 RESEARCH
SCOTT      ANALYST         3000         20 RESEARCH
WARD       SALESMAN        1250         30 SALES
TURNER     SALESMAN        1500         30 SALES
ALLEN      SALESMAN        1600         30 SALES
JAMES      CLERK            950         30 SALES
BLAKE      MANAGER         2850         30 SALES
MARTIN     SALESMAN        1250         30 SALES

14 rows selected.

SQL> select *
  2  from emp,dept
  3  where emp.deptno=dept.deptno and deptno in(10,30);
where emp.deptno=dept.deptno and deptno in(10,30)
                                 *
ERROR at line 3:
ORA-00918: column ambiguously defined


SQL> select *
  2  from emp,dept
  3  where emp.deptno=dept.deptno and emp.deptno in(10,30);
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK

9 rows selected.

SQL> select *
  2  from emp,dept
  3  where emp.deptno=dept.deptno and dept.deptno in(10,30);
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK

9 rows selected.

SQL> select *
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno and emp.deptno in(10,30);
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK

9 rows selected.

SQL> select count(*),job
  2  from emp,dept
  3  where emp.deptno=dept.deptno and dname in('ACCOUNTING','SALES');
select count(*),job
                *
ERROR at line 1:
ORA-00937: not a single-group group function


SQL> select count(*),job
  2  from emp,dept
  3  where emp.deptno=dept.deptno and dname in('ACCOUNTING','SALES')
  4  group by job;
         2 CLERK
         4 SALESMAN
         1 PRESIDENT
         2 MANAGER

SQL> from emp,dept
SP2-0734: unknown command beginning "from emp,d..." - rest of line ignored.
SQL> select count(*),job
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno and dname in('ACCOUNTING','SALES')
  4  group by job;
         2 CLERK
         4 SALESMAN
         1 PRESIDENT
         2 MANAGER

SQL> select *
  2  from emp,dept
  3  where emp.deptno=dept.deptno and comm is null
  4  order by ename;
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS

10 rows selected.

SQL> select *
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno and comm is null
  4  order by ename;
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS

10 rows selected.

SQL> select *
  2  from emp,dept
  3  where emp.deptno=dept.deptno and sal between 900 and 3500;
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO

12 rows selected.

SQL> select *
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno and sal between 900 and 3500;
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO

12 rows selected.

SQL> select *
  2  from emp,dept
  3  where emp.deptno=dept.empno and loc like '%A%;
ERROR:
ORA-01756: quoted string not properly terminated


SQL> select *
  2  from emp,dept
  3  where emp.deptno=dept.empno and loc like '%A%';
where emp.deptno=dept.empno and loc like '%A%'
                 *
ERROR at line 3:
ORA-00904: "DEPT"."EMPNO": invalid identifier


SQL> from emp,dept
SP2-0734: unknown command beginning "from emp,d..." - rest of line ignored.
SQL> select *
  2  from emp,dept
  3  where emp.deptno=dept.deptno and loc like '%A%';
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO

11 rows selected.

SQL> select *
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno and loc like '%A%';
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO

11 rows selected.

SQL> select dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno and mgr not in(7698,7566);
ACCOUNTING
ACCOUNTING
RESEARCH
RESEARCH
RESEARCH
SALES

6 rows selected.

SQL> select dname
  2  from emp inner join dept
  3  on emp.deptno=dept.deptno and mgr not in(7698,7566);
ACCOUNTING
ACCOUNTING
RESEARCH
RESEARCH
RESEARCH
SALES

6 rows selected.

SQL> conn
Enter user-name: hr
Enter password:
ERROR:
ORA-01005: null password given; logon denied


Warning: You are no longer connected to ORACLE.
SQL>
SQL>
SQL>
SQL>
SQL>
SQL>
SQL>
SQL>
SQL>
SQL>
SQL>
SQL>
SQL> conn
Enter user-name: hr
Enter password:
Connected.
SQL> select
  2  * from tab;
COUNTRIES                      TABLE
DEPARTMENTS                    TABLE
EMPLOYEES                      TABLE
EMP_DETAILS_VIEW               VIEW
JOBS                           TABLE
JOB_HISTORY                    TABLE
LOCATIONS                      TABLE
REGIONS                        TABLE

8 rows selected.

SQL> select *
  2  from locations;
       1000 1297 Via Cola di Rie                     00989        Roma                                                     IT
       1100 93091 Calle della Testa                  10934        Venice                                                   IT
       1200 2017 Shinjuku-ku                         1689         Tokyo                          Tokyo Prefecture          JP
       1300 9450 Kamiya-cho                          6823         Hiroshima                                                JP
       1400 2014 Jabberwocky Rd                      26192        Southlake                      Texas                     US
       1500 2011 Interiors Blvd                      99236        South San Francisco            California                US
       1600 2007 Zagora St                           50090        South Brunswick                New Jersey                US
       1700 2004 Charade Rd                          98199        Seattle                        Washington                US
       1800 147 Spadina Ave                          M5V 2L7      Toronto                        Ontario                   CA
       1900 6092 Boxwood St                          YSW 9T2      Whitehorse                     Yukon                     CA
       2000 40-5-12 Laogianggen                      190518       Beijing                                                  CN
       2100 1298 Vileparle (E)                       490231       Bombay                         Maharashtra               IN
       2200 12-98 Victoria Street                    2901         Sydney                         New South Wales           AU
       2300 198 Clementi North                       540198       Singapore                                                SG
       2400 8204 Arthur St                                        London                                                   UK
       2500 Magdalen Centre, The Oxford Science Park OX9 9ZB      Oxford                         Oxford                    UK
       2600 9702 Chester Road                        09629850293  Stretford                      Manchester                UK
       2700 Schwanthalerstr. 7031                    80925        Munich                         Bavaria                   DE
       2800 Rua Frei Caneca 1360                     01307-002    Sao Paulo                      Sao Paulo                 BR
       2900 20 Rue des Corps-Saints                  1730         Geneva                         Geneve                    CH
       3000 Murtenstrasse 921                        3095         Bern                           BE                        CH
       3100 Pieter Breughelstraat 837                3029SK       Utrecht                        Utrecht                   NL
       3200 Mariano Escobedo 9991                    11932        Mexico City                    Distrito Federal,         MX

23 rows selected.

SQL> desc locations
 Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 LOCATION_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             NOT NULL NUMBER(4)
 STREET_ADDRESS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   VARCHAR2(40)
 POSTAL_CODE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      VARCHAR2(12)
 CITY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    NOT NULL VARCHAR2(30)
 STATE_PROVINCE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   VARCHAR2(25)
 COUNTRY_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       CHAR(2)

SQL> select *
  2  from countries;
AR Argentina                                         2
AU Australia                                         3
BE Belgium                                           1
BR Brazil                                            2
CA Canada                                            2
CH Switzerland                                       1
CN China                                             3
DE Germany                                           1
DK Denmark                                           1
EG Egypt                                             4
FR France                                            1
IL Israel                                            4
IN India                                             3
IT Italy                                             1
JP Japan                                             3
KW Kuwait                                            4
ML Malaysia                                          3
MX Mexico                                            2
NG Nigeria                                           4
NL Netherlands                                       1
SG Singapore                                         3
UK United Kingdom                                    1
US United States of America                          2
ZM Zambia                                            4
ZW Zimbabwe                                          4

25 rows selected.

SQL> desc countries
 Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 COUNTRY_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              NOT NULL CHAR(2)
 COUNTRY_NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     VARCHAR2(40)
 REGION_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        NUMBER

SQL> select city,country_name
  2  from locations,cities
  3  where locations.country_id=cities.country_id;
from locations,cities
               *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> from locations,cities
SP2-0734: unknown command beginning "from locat..." - rest of line ignored.
SQL> select city,country_name
  2  from locations,countries
  3  where locations.country_id=countries.country_id;
Sydney                         Australia
Sao Paulo                      Brazil
Toronto                        Canada
Whitehorse                     Canada
Geneva                         Switzerland
Bern                           Switzerland
Beijing                        China
Munich                         Germany
Bombay                         India
Roma                           Italy
Venice                         Italy
Tokyo                          Japan
Hiroshima                      Japan
Mexico City                    Mexico
Utrecht                        Netherlands
Singapore                      Singapore
London                         United Kingdom
Oxford                         United Kingdom
Stretford                      United Kingdom
Southlake                      United States of America
South San Francisco            United States of America
South Brunswick                United States of America
Seattle                        United States of America

23 rows selected.

SQL> select *
  2  from regions;
         1 Europe
         2 Americas
         3 Asia
         4 Middle East and Africa

SQL> desc regions
 Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 REGION_ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               NOT NULL NUMBER
 REGION_NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      VARCHAR2(25)

SQL> select city,country_name,region_name
  2  from locations,countries,regions
  3  where locations.country_id=countries.country_id and countries.region_id=regions.region_id;
Stretford                      United Kingdom                           Europe
Oxford                         United Kingdom                           Europe
London                         United Kingdom                           Europe
Utrecht                        Netherlands                              Europe
Venice                         Italy                                    Europe
Roma                           Italy                                    Europe
Munich                         Germany                                  Europe
Bern                           Switzerland                              Europe
Geneva                         Switzerland                              Europe
Seattle                        United States of America                 Americas
South Brunswick                United States of America                 Americas
South San Francisco            United States of America                 Americas
Southlake                      United States of America                 Americas
Mexico City                    Mexico                                   Americas
Whitehorse                     Canada                                   Americas
Toronto                        Canada                                   Americas
Sao Paulo                      Brazil                                   Americas
Singapore                      Singapore                                Asia
Hiroshima                      Japan                                    Asia
Tokyo                          Japan                                    Asia
Bombay                         India                                    Asia
Beijing                        China                                    Asia
Sydney                         Australia                                Asia

23 rows selected.

SQL> select city,country_name,region_name
  2  from locations inner join countries inner join regions
  3  on locations.country_id=countries.country_id and countries.region_id=regions.region_id;
on locations.country_id=countries.country_id and countries.region_id=regions.region_id
                                                                                     *
ERROR at line 3:
ORA-00905: missing keyword


SQL> select city,country_name,region_name
  2  from locations,countries
  3  from locations,countries
  4  ;
from locations,countries
*
ERROR at line 3:
ORA-00933: SQL command not properly ended


SQL> select city,country_name,region_name
  2  from locations inner join countries
  3  on locations.country_id=countries.country_id and countries.region_id=regions.region_id;
on locations.country_id=countries.country_id and countries.region_id=regions.region_id
                                                                     *
ERROR at line 3:
ORA-00904: "REGIONS"."REGION_ID": invalid identifier


SQL> select city,country_name,region_name
  2  from locations inner join countries
  3  on locations.country_id=countries.country_id and
  4  countries inner join regions
  5  on countries.region_id=regions.region_id;
countries inner join regions
          *
ERROR at line 4:
ORA-00920: invalid relational operator


SQL> select city,country_name,region_name
  2  from locations inner join countries
  3  on locations.country_id=countries.country_id and
  4   inner join regions
  5  on countries.region_id=regions.region_id;
 inner join regions
       *
ERROR at line 4:
ORA-00920: invalid relational operator


SQL> select city,country_name,region_name
  2  from locations inner join countries
  3  on locations.country_id=countries.country_id
  4   inner join regions
  5  on countries.region_id=regions.region_id;
Stretford                      United Kingdom                           Europe
Oxford                         United Kingdom                           Europe
London                         United Kingdom                           Europe
Utrecht                        Netherlands                              Europe
Venice                         Italy                                    Europe
Roma                           Italy                                    Europe
Munich                         Germany                                  Europe
Bern                           Switzerland                              Europe
Geneva                         Switzerland                              Europe
Seattle                        United States of America                 Americas
South Brunswick                United States of America                 Americas
South San Francisco            United States of America                 Americas
Southlake                      United States of America                 Americas
Mexico City                    Mexico                                   Americas
Whitehorse                     Canada                                   Americas
Toronto                        Canada                                   Americas
Sao Paulo                      Brazil                                   Americas
Singapore                      Singapore                                Asia
Hiroshima                      Japan                                    Asia
Tokyo                          Japan                                    Asia
Bombay                         India                                    Asia
Beijing                        China                                    Asia
Sydney                         Australia                                Asia

23 rows selected.

SQL> select city,country_name,region_name
  2  from locations,countries,regions
  3  where locations.country_id=countries.country_id and coutries.region_id=regions.region_id;
where locations.country_id=countries.country_id and coutries.region_id=regions.region_id
                                                    *
ERROR at line 3:
ORA-00904: "COUTRIES"."REGION_ID": invalid identifier


SQL> select city,country_name,region_name
  2  from locations,countries,regions
  3  where locations.country_id=countries.country_id and countries.region_id=regions.region_id;
Stretford                      United Kingdom                           Europe
Oxford                         United Kingdom                           Europe
London                         United Kingdom                           Europe
Utrecht                        Netherlands                              Europe
Venice                         Italy                                    Europe
Roma                           Italy                                    Europe
Munich                         Germany                                  Europe
Bern                           Switzerland                              Europe
Geneva                         Switzerland                              Europe
Seattle                        United States of America                 Americas
South Brunswick                United States of America                 Americas
South San Francisco            United States of America                 Americas
Southlake                      United States of America                 Americas
Mexico City                    Mexico                                   Americas
Whitehorse                     Canada                                   Americas
Toronto                        Canada                                   Americas
Sao Paulo                      Brazil                                   Americas
Singapore                      Singapore                                Asia
Hiroshima                      Japan                                    Asia
Tokyo                          Japan                                    Asia
Bombay                         India                                    Asia
Beijing                        China                                    Asia
Sydney                         Australia                                Asia

23 rows selected.

SQL>