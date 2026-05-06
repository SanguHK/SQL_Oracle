-- Expressions in SQL--
An expression is a combination of one or more values, operators,
 and SQL functions that evaluate to a single value. Expressions can be used in various parts of an SQL statement.

 Syntax:Select expressions
    from table_name;


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

SQL> select sal*12
  2  from emp;

    SAL*12
----------
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

SQL> select sal*6
  2  from emp;

     SAL*6
----------
      4800
      9600
      7500
     17850
      7500
     17100
     14700
     18000
     30000
      9000
      6600
      5700
     18000
      7800

14 rows selected.

SQL> select sal*12,sal*6
  2  from emp;

    SAL*12      SAL*6
---------- ----------
      9600       4800
     19200       9600
     15000       7500
     35700      17850
     15000       7500
     34200      17100
     29400      14700
     36000      18000
     60000      30000
     18000       9000
     13200       6600
     11400       5700
     36000      18000
     15600       7800

14 rows selected.

SQL> select sal+comm
  2  from emp;

  SAL+COMM
----------

      1900
      1750

      2650




      1500





14 rows selected.

SQL> select sal+500,sal-200
  2  from emp;

   SAL+500    SAL-200
---------- ----------
      1300        600
      2100       1400
      1750       1050
      3475       2775
      1750       1050
      3350       2650
      2950       2250
      3500       2800
      5500       4800
      2000       1300
      1600        900
      1450        750
      3500       2800
      1800       1100

14 rows selected.

SQL> select sal+(sal*0.25)
  2  from emp;

SAL+(SAL*0.25)
--------------
          1000
          2000
        1562.5
       3718.75
        1562.5
        3562.5
        3062.5
          3750
          6250
          1875
          1375
        1187.5
          3750
          1625

14 rows selected.

