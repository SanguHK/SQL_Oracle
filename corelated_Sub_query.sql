
SQL*Plus: Release 11.2.0.1.0 Production on Sat Jun 6 11:38:55 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: scott
Enter password:

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

SQL> set lines 1000 pages 1000
SQL> select *
  2  from tabl
  3  ;
from tabl
     *
ERROR at line 2:
ORA-00942: table or view does not exist


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

SQL> select distinct sal
  2  from emp e1
  3  where 2=(select distinct sal
  4             from emp e2
  5             where e1.sal<=e2.sal);
where 2=(select distinct sal
         *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row


SQL> select distinct sal
  2  from emp e1
  3  where 2=(select distinct sal
  4             from emp e2
  5             where e1.sal<=e2.sal);
where 2=(select distinct sal
         *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row


SQL> select distinct sal
  2  from emp e1
  3  where 2=(select count(distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

       SAL
----------
      3000

SQL> select sal
  2  from emp e1
  3  where 2=(select count(distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

       SAL
----------
      3000
      3000

SQL> select distinct sal
  2  from emp e1
  3  where 2=(select count( sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

       SAL
----------
      5000

SQL> delete from emp
  2  where empno=1111;

1 row deleted.

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

SQL> select distinct sal
  2  from emp e1
  3  where 2=(select count( sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

no rows selected

SQL> select distinct sal
  2  from emp e1
  3  where 2=(select count( distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

       SAL
----------
      3000

SQL> select sal
  2  from emp e1
  3  where 2=(select count( distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

       SAL
----------
      3000
      3000

SQL> select sal
  2  from emp e1
  3  where 2=(select count( sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

no rows selected

SQL> select sal
  2  from emp e1
  3  where 2=(select count( distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

       SAL
----------
      3000
      3000

SQL> select sal
  2  from emp e1
  3  where (select count(distinct sal)
  4             from emp e2
  5             where e1.sal>=e2.sal)in(3,4,6,7);

       SAL
----------
      1600
      1250
      1250
      1500
      1100

SQL> select distinct sal
  2  from emp e1
  3  where (select count(distinct sal)
  4             from emp e2
  5             where e1.sal>=e2.sal)in(3,4,6,7);

       SAL
----------
      1250
      1100
      1600
      1500

SQL> select distinct sal
  2  from emp e1
  3  where 2 in (select count(distinct sal)
  4             from emp e2
  5             where e1.sal>=e2.sal);

       SAL
----------
       950

SQL> select distinct count
  2  from emp e1
  3  where 2 in (select count(distinct co;)
  4  ;
where 2 in (select count(distinct co;)
                                    *
ERROR at line 3:
ORA-00911: invalid character


SQL> select distinct comm
  2  from emp e1
  3  where 2 in (select count(distinct comm)
  4             from emp e2
  5             where e1.comm>=e2.comm);

      COMM
----------
       300

SQL> select distinct comm
  2  from emp e1
  3  where 2=(select count(distinct comm)
  4             from emp e2
  5             where e1.comm>=e2.comm);

      COMM
----------
       300

SQL> select distinct sal
  2  from emp e1
  3  where  (select count(distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal)in (7,10,14);

       SAL
----------
      1100
      1500

SQL> select distinct sal
  2  from emp e1
  3  where(select count(distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal)in (7,10,14);

       SAL
----------
      1100
      1500

SQL> select distinct sal
  2  from emp e1
  3  where  (select count(distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal)in (7,10);4
  6  ;
                where e1.sal<=e2.sal)in (7,10);4
                                              *
ERROR at line 5:
ORA-00936: missing expression


SQL> select distinct sal
  2  from emp e1
  3  where  (select count(distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal)in (7,10);

       SAL
----------
      1100
      1500

SQL> select sal
  2  from emp e1
  3  where  (select count(distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal)in (7,10,14);

       SAL
----------
      1500
      1100

SQL> select sal
  2  from emp e1
  3  where  (select count(sal)
  4             from emp e2
  5             where e1.sal<=e2.sal)in (7,10,14);

       SAL
----------
       800
      1600

SQL> select distinct sal
  2  from emp e1
  3  where 14=(select count(distinct sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

no rows selected

SQL> select distinct sal
  2  from emp e1
  3  where 14=(select count(sal)
  4             from emp e2
  5             where e1.sal<=e2.sal);

       SAL
----------
       800

SQL> select distinct sal
  2  from emp e1
  3  where 8=(select count(distinct sal))
  4             from emp e2
  5             where e1.sal>=e2.sal);
where 8=(select count(distinct sal))
                                   *
ERROR at line 3:
ORA-00923: FROM keyword not found where expected


SQL> select distinct sal
  2  from emp e1
  3  where 14=(select count(sal)
  4             from emp e2
  5             where e1.sal>=e2.sal);

       SAL
----------
      5000

SQL> select distinct sal
  2  from emp e1
  3  where 8=(select count(sal)
  4             from emp e2
  5             where e1.sal>=e2.sal);

       SAL
----------
      1600

SQL>