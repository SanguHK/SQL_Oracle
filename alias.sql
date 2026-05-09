-- ALIAS NAME--
-- It is used to give a temporary name to a column or an expression in the select statement. It is also called as column alias. It is used to make the output more readable and meaningful. It can be used in the select list, where clause, group by clause, having clause and order by clause.

Syntax:
SELECT column_name AS alias_name
FROM table_name;


SQL*Plus: Release 11.2.0.1.0 Production on Sat May 9 23:10:36 2026

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

SQL> select empno as employee_name
  2  from emp;

EMPLOYEE_NAME
-------------
         7369
         7499
         7521
         7566
         7654
         7698
         7782
         7788
         7839
         7844
         7876
         7900
         7902
         7934

14 rows selected.

SQL> select empno  employee_name
  2  from emp;

EMPLOYEE_NAME
-------------
         7369
         7499
         7521
         7566
         7654
         7698
         7782
         7788
         7839
         7844
         7876
         7900
         7902
         7934

14 rows selected.

SQL> select empno  employee name
  2  from emp;
select empno  employee name
                       *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> select empno 'employee_name'
  2  from emp;
select empno 'employee_name'
             *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> select empno  "employee name"
  2  from emp;

employee name
-------------
         7369
         7499
         7521
         7566
         7654
         7698
         7782
         7788
         7839
         7844
         7876
         7900
         7902
         7934

14 rows selected.



SQL> select empno "EMPLOYEE NAME"
  2  from emp;

EMPLOYEE NAME
-------------
         7369
         7499
         7521
         7566
         7654
         7698
         7782
         7788
         7839
         7844
         7876
         7900
         7902
         7934

14 rows selected.

SQL> select sal salary
  2  from emp;

    SALARY
----------
       800
      1600
      1250
      2975
      1250
      2850
      2450
      3000
      5000
      1500
      1100
       950
      3000
      1300

14 rows selected.

SQL> select mgr "MANAGER NUMBER"
  2  from emp;

MANAGER NUMBER
--------------
          7902
          7698
          7698
          7839
          7698
          7839
          7839
          7566

          7698
          7788
          7698
          7566
          7782

14 rows selected.

SQL> SELECT DEPTNO DEPARTMENT_NUMBER
  2  from emp;

DEPARTMENT_NUMBER
-----------------
               20
               30
               30
               20
               30
               30
               10
               20
               10
               30
               20
               30
               20
               10

14 rows selected.

SQL> select comm commission
  2  from emp;

COMMISSION
----------

       300
       500

      1400




         0





14 rows selected.

SQL> select sal*12 annual_salary
  2  from emp;

ANNUAL_SALARY
-------------
         9600
        19200
        15000
        35700
        15000
        34200
        29400
        36000
        60000
        18000
        13200
        11400
        36000
        15600

14 rows selected.

SQL> select comm*4 as quarter_commission
  2  from emp;

QUARTER_COMMISSION
------------------

              1200
              2000

              5600




                 0





14 rows selected.

SQL>