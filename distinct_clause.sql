-- DISTINCT Clause--

It is used to eliminate duplicate values from the result set. 
It can be used with one or more columns in the SELECT statement.
It will not effect the original data in the table, it only affects the output of the query.

Note:
1) If we use DISTINCT with one column, it will eliminate duplicate values from that column.
2) If we use DISTINCT with multiple columns, it will eliminate duplicate rows based on the combination of those columns.

Syntax:
SELECT DISTINCT column1, column2, ...
from table_name;


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

SQL> select distinct sal
  2  from emp;

       SAL
----------
      2450
      5000
      1300
      1250
      2850
      2975
      1100
      3000
       800
      1600
      1500
       950

12 rows selected.

SQL> select distinct ename,job
  2  from emp;

ENAME      JOB
---------- ---------
WARD       SALESMAN
SMITH      CLERK
CLARK      MANAGER
TURNER     SALESMAN
JAMES      CLERK
JONES      MANAGER
MARTIN     SALESMAN
ADAMS      CLERK
SCOTT      ANALYST
KING       PRESIDENT
FORD       ANALYST
ALLEN      SALESMAN
BLAKE      MANAGER
MILLER     CLERK

14 rows selected.

SQL> select distinct deptno
  2  from emp;

    DEPTNO
----------
        30
        20
        10

SQL> select distinct empno,hiredate,job
  2  from emp;

     EMPNO HIREDATE  JOB
---------- --------- ---------
      7369 17-DEC-80 CLERK
      7499 20-FEB-81 SALESMAN
      7521 22-FEB-81 SALESMAN
      7566 02-APR-81 MANAGER
      7654 28-SEP-81 SALESMAN
      7698 01-MAY-81 MANAGER
      7782 09-JUN-81 MANAGER
      7788 19-APR-87 ANALYST
      7839 17-NOV-81 PRESIDENT
      7844 08-SEP-81 SALESMAN
      7876 23-MAY-87 CLERK
      7900 03-DEC-81 CLERK
      7902 03-DEC-81 ANALYST
      7934 23-JAN-82 CLERK

14 rows selected.

SQL> select distinct deptname,loc
  2  from emp;
select distinct deptname,loc
                         *
ERROR at line 1:
ORA-00904: "LOC": invalid identifier


SQL> select distinct job
  2  from emp;

JOB
---------
CLERK
SALESMAN
PRESIDENT
MANAGER
ANALYST

