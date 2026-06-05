
SQL*Plus: Release 11.2.0.1.0 Production on Fri Jun 5 16:07:51 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: scott
Enter password:

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> set lines 1000
SQL> set pages 1000
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

SQL> select *
  2  from dept;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> insert into emp(1111,WARNER,SALESMAN,null,'04-JUN-2026',5000,200,null);
insert into emp(1111,WARNER,SALESMAN,null,'04-JUN-2026',5000,200,null)
                *
ERROR at line 1:
ORA-00928: missing SELECT keyword


SQL> insert into emp values(1111,WARNER,SALESMAN,null,'04-JUN-2026',5000,200,null);
insert into emp values(1111,WARNER,SALESMAN,null,'04-JUN-2026',5000,200,null)
                                   *
ERROR at line 1:
ORA-00984: column not allowed here


SQL> insert into emp values(1111,'WARNER','SALESMAN',null,'04-JUN-2026',5000,200,null);

1 row created.

SQL> insert into emp (1111,'WARNER','SALESMAN',null,'04-JUN-2026',5000,200,null);
insert into emp (1111,'WARNER','SALESMAN',null,'04-JUN-2026',5000,200,null)
                 *
ERROR at line 1:
ORA-00928: missing SELECT keyword


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

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno = dept.deptno(+);

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
KING       ACCOUNTING
CLARK      ACCOUNTING
FORD       RESEARCH
ADAMS      RESEARCH
SCOTT      RESEARCH
JONES      RESEARCH
SMITH      RESEARCH
JAMES      SALES
TURNER     SALES
BLAKE      SALES
MARTIN     SALES
WARD       SALES
ALLEN      SALES
WARNER

15 rows selected.

SQL> select dname,ename
  2  from dept,ename
  3  where dept.deptno(+)=emp.deptno;
from dept,ename
          *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> select dname,ename
  2  from dept,emp
  3  where dept.deptno(+)=emp.deptno;

DNAME          ENAME
-------------- ----------
ACCOUNTING     MILLER
ACCOUNTING     KING
ACCOUNTING     CLARK
RESEARCH       FORD
RESEARCH       ADAMS
RESEARCH       SCOTT
RESEARCH       JONES
RESEARCH       SMITH
SALES          JAMES
SALES          TURNER
SALES          BLAKE
SALES          MARTIN
SALES          WARD
SALES          ALLEN
               WARNER

15 rows selected.

SQL> select *
  2  from dept,emp
  3  where dept.deptno(+)=emp.deptno
  4  union
  5  select ename,dname
  6  from emp,dept
  7  where emp.deptno = dept.deptno(+);
select *
*
ERROR at line 1:
ORA-01789: query block has incorrect number of result columns


SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno = dept.deptno(+)
  4  union
  5  select ename,dname
  6  from dept,emp
  7  where dept.deptno(+)=emp.deptno;

ENAME      DNAME
---------- --------------
ADAMS      RESEARCH
ALLEN      SALES
BLAKE      SALES
CLARK      ACCOUNTING
FORD       RESEARCH
JAMES      SALES
JONES      RESEARCH
KING       ACCOUNTING
MARTIN     SALES
MILLER     ACCOUNTING
SCOTT      RESEARCH
SMITH      RESEARCH
TURNER     SALES
WARD       SALES
WARNER

15 rows selected.

SQL> select ename,dname
  2  from emp left outer join dept
  3  on emp.deptno=dept.deptno;

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
KING       ACCOUNTING
CLARK      ACCOUNTING
FORD       RESEARCH
ADAMS      RESEARCH
SCOTT      RESEARCH
JONES      RESEARCH
SMITH      RESEARCH
JAMES      SALES
TURNER     SALES
BLAKE      SALES
MARTIN     SALES
WARD       SALES
ALLEN      SALES
WARNER

15 rows selected.

SQL> insert into dept values(50, null,'DUBAI');

1 row created.

SQL> select *
  2  from emp right outer join dept
  3  on emp.deptno=dept.deptno;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME          LOC
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ---------- -------------- -------------
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
                                                                                              40 OPERATIONS     BOSTON
                                                                                              50                DUBAI

16 rows selected.

SQL> select *
  2  from emp full outer join dept
  3  on emp.deptno=dept.deptno;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     DEPTNO DNAME          LOC
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ---------- -------------- -------------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20         20 RESEARCH       DALLAS
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30         30 SALES          CHICAGO
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30         30 SALES          CHICAGO
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20         20 RESEARCH       DALLAS
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30         30 SALES          CHICAGO
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30         30 SALES          CHICAGO
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10         10 ACCOUNTING     NEW YORK
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20         20 RESEARCH       DALLAS
      7839 KING       PRESIDENT            17-NOV-81       5000                    10         10 ACCOUNTING     NEW YORK
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30         30 SALES          CHICAGO
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20         20 RESEARCH       DALLAS
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30         30 SALES          CHICAGO
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20         20 RESEARCH       DALLAS
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10         10 ACCOUNTING     NEW YORK
      1111 WARNER     SALESMAN             04-JUN-26       5000        200
                                                                                              50                DUBAI
                                                                                              40 OPERATIONS     BOSTON

17 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno(+)=dept.deptno;

ENAME      DNAME
---------- --------------
CLARK      ACCOUNTING
MILLER     ACCOUNTING
KING       ACCOUNTING
JONES      RESEARCH
SMITH      RESEARCH
SCOTT      RESEARCH
FORD       RESEARCH
ADAMS      RESEARCH
WARD       SALES
TURNER     SALES
ALLEN      SALES
JAMES      SALES
MARTIN     SALES
BLAKE      SALES
           OPERATIONS


16 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno(+);

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
KING       ACCOUNTING
CLARK      ACCOUNTING
FORD       RESEARCH
ADAMS      RESEARCH
SCOTT      RESEARCH
JONES      RESEARCH
SMITH      RESEARCH
JAMES      SALES
TURNER     SALES
BLAKE      SALES
MARTIN     SALES
WARD       SALES
ALLEN      SALES
WARNER

15 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno(+);

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
KING       ACCOUNTING
CLARK      ACCOUNTING
FORD       RESEARCH
ADAMS      RESEARCH
SCOTT      RESEARCH
JONES      RESEARCH
SMITH      RESEARCH
JAMES      SALES
TURNER     SALES
BLAKE      SALES
MARTIN     SALES
WARD       SALES
ALLEN      SALES
WARNER

15 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno(+)=dept.deptno;

ENAME      DNAME
---------- --------------
CLARK      ACCOUNTING
MILLER     ACCOUNTING
KING       ACCOUNTING
JONES      RESEARCH
SMITH      RESEARCH
SCOTT      RESEARCH
FORD       RESEARCH
ADAMS      RESEARCH
WARD       SALES
TURNER     SALES
ALLEN      SALES
JAMES      SALES
MARTIN     SALES
BLAKE      SALES
           OPERATIONS


16 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno(+)=dept.deptno
  4  union
  5  select ename,dname
  6  from emp,dept
  7  where emp.deptno=dept.deptno(+);

ENAME      DNAME
---------- --------------
ADAMS      RESEARCH
ALLEN      SALES
BLAKE      SALES
CLARK      ACCOUNTING
FORD       RESEARCH
JAMES      SALES
JONES      RESEARCH
KING       ACCOUNTING
MARTIN     SALES
MILLER     ACCOUNTING
SCOTT      RESEARCH
SMITH      RESEARCH
TURNER     SALES
WARD       SALES
WARNER
           OPERATIONS


17 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno(+)
  4  minus
  5  select ename,dname
  6  from emp,dept;

no rows selected

SQL> select ename,dname
  2  from emp,dept;

ENAME      DNAME
---------- --------------
SMITH      ACCOUNTING
ALLEN      ACCOUNTING
WARD       ACCOUNTING
JONES      ACCOUNTING
MARTIN     ACCOUNTING
BLAKE      ACCOUNTING
CLARK      ACCOUNTING
SCOTT      ACCOUNTING
KING       ACCOUNTING
TURNER     ACCOUNTING
ADAMS      ACCOUNTING
JAMES      ACCOUNTING
FORD       ACCOUNTING
MILLER     ACCOUNTING
WARNER     ACCOUNTING
SMITH      RESEARCH
ALLEN      RESEARCH
WARD       RESEARCH
JONES      RESEARCH
MARTIN     RESEARCH
BLAKE      RESEARCH
CLARK      RESEARCH
SCOTT      RESEARCH
KING       RESEARCH
TURNER     RESEARCH
ADAMS      RESEARCH
JAMES      RESEARCH
FORD       RESEARCH
MILLER     RESEARCH
WARNER     RESEARCH
SMITH      SALES
ALLEN      SALES
WARD       SALES
JONES      SALES
MARTIN     SALES
BLAKE      SALES
CLARK      SALES
SCOTT      SALES
KING       SALES
TURNER     SALES
ADAMS      SALES
JAMES      SALES
FORD       SALES
MILLER     SALES
WARNER     SALES
SMITH      OPERATIONS
ALLEN      OPERATIONS
WARD       OPERATIONS
JONES      OPERATIONS
MARTIN     OPERATIONS
BLAKE      OPERATIONS
CLARK      OPERATIONS
SCOTT      OPERATIONS
KING       OPERATIONS
TURNER     OPERATIONS
ADAMS      OPERATIONS
JAMES      OPERATIONS
FORD       OPERATIONS
MILLER     OPERATIONS
WARNER     OPERATIONS
SMITH
ALLEN
WARD
JONES
MARTIN
BLAKE
CLARK
SCOTT
KING
TURNER
ADAMS
JAMES
FORD
MILLER
WARNER

75 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno
  4  minus
  5  select ename,dname
  6  from emp,dept
  7  where emp.deptno=dept.deptno(+);

no rows selected

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno
  4  minus
  5  select ename,dname
  6  from emp,dept
  7  where emp.deptno(+)=dept.deptno;

no rows selected

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno(+)=dept.deptno;

ENAME      DNAME
---------- --------------
CLARK      ACCOUNTING
MILLER     ACCOUNTING
KING       ACCOUNTING
JONES      RESEARCH
SMITH      RESEARCH
SCOTT      RESEARCH
FORD       RESEARCH
ADAMS      RESEARCH
WARD       SALES
TURNER     SALES
ALLEN      SALES
JAMES      SALES
MARTIN     SALES
BLAKE      SALES
           OPERATIONS


16 rows selected.

SQL> from emp,dept
SP2-0734: unknown command beginning "from emp,d..." - rest of line ignored.
SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno;

ENAME      DNAME
---------- --------------
CLARK      ACCOUNTING
MILLER     ACCOUNTING
KING       ACCOUNTING
JONES      RESEARCH
SMITH      RESEARCH
SCOTT      RESEARCH
FORD       RESEARCH
ADAMS      RESEARCH
WARD       SALES
TURNER     SALES
ALLEN      SALES
JAMES      SALES
MARTIN     SALES
BLAKE      SALES

14 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno(+)=dept.deptno;

ENAME      DNAME
---------- --------------
CLARK      ACCOUNTING
MILLER     ACCOUNTING
KING       ACCOUNTING
JONES      RESEARCH
SMITH      RESEARCH
SCOTT      RESEARCH
FORD       RESEARCH
ADAMS      RESEARCH
WARD       SALES
TURNER     SALES
ALLEN      SALES
JAMES      SALES
MARTIN     SALES
BLAKE      SALES
           OPERATIONS


16 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno(+)=dept.deptno
  4  minus
  5  select ename,dname
  6  from emp,dept
  7  where emp.deptno=dept.deptno;

ENAME      DNAME
---------- --------------
           OPERATIONS


SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno(+);

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
KING       ACCOUNTING
CLARK      ACCOUNTING
FORD       RESEARCH
ADAMS      RESEARCH
SCOTT      RESEARCH
JONES      RESEARCH
SMITH      RESEARCH
JAMES      SALES
TURNER     SALES
BLAKE      SALES
MARTIN     SALES
WARD       SALES
ALLEN      SALES
WARNER

15 rows selected.

SQL> select ename,dname
  2  from emp,dept
  3  where emp.deptno=dept.deptno(+)
  4  minus
  5  select ename,dname
  6  from emp,dept
  7  where emp.deptno=dept.deptno;

ENAME      DNAME
---------- --------------
WARNER

SQL> select ename,dname
  2  from emp left outer join dept
  3  on emp.deptno=dept.deptno;

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
KING       ACCOUNTING
CLARK      ACCOUNTING
FORD       RESEARCH
ADAMS      RESEARCH
SCOTT      RESEARCH
JONES      RESEARCH
SMITH      RESEARCH
JAMES      SALES
TURNER     SALES
BLAKE      SALES
MARTIN     SALES
WARD       SALES
ALLEN      SALES
WARNER

15 rows selected.

SQL> select ename,dname
  2  from emp right outer join dept
  3  on emp.deptno=dept.deptno;

ENAME      DNAME
---------- --------------
CLARK      ACCOUNTING
MILLER     ACCOUNTING
KING       ACCOUNTING
JONES      RESEARCH
SMITH      RESEARCH
SCOTT      RESEARCH
FORD       RESEARCH
ADAMS      RESEARCH
WARD       SALES
TURNER     SALES
ALLEN      SALES
JAMES      SALES
MARTIN     SALES
BLAKE      SALES
           OPERATIONS


16 rows selected.

SQL> select ename,dname
  2  from emp full outer join dept
  3  on emp.deptno=dept.deptno;

ENAME      DNAME
---------- --------------
SMITH      RESEARCH
ALLEN      SALES
WARD       SALES
JONES      RESEARCH
MARTIN     SALES
BLAKE      SALES
CLARK      ACCOUNTING
SCOTT      RESEARCH
KING       ACCOUNTING
TURNER     SALES
ADAMS      RESEARCH
JAMES      SALES
FORD       RESEARCH
MILLER     ACCOUNTING
WARNER

           OPERATIONS

17 rows selected.

SQL> select ename,dname
  2  from emp right outer join dept
  3  minus
  4  select ename,dname
  5  from emp inner join dept
  6  on emp.deptno=dept.deptno;
minus
*
ERROR at line 3:
ORA-00905: missing keyword


SQL> select ename,dname
  2  from emp right outer join dept
  3  on emp.deptno=dept.deptno
  4  minus
  5  select ename,dname
  6  from emp inner join dept
  7  on emp.deptno=dept.deptno;

ENAME      DNAME
---------- --------------
           OPERATIONS

