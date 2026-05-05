-- LIKE OPERATOR--
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

SQL> select ename
  2  from emp
  3  where ename like 'S%';

ENAME
----------
SMITH
SCOTT

SQL> select ename
  2  from emp
  3  where ename like '%S';

ENAME
----------
JONES
ADAMS
JAMES

SQL> select ename,job
  2  from emp
  3  where ename like '%S%';

ENAME      JOB
---------- ---------
SMITH      CLERK
JONES      MANAGER
SCOTT      ANALYST
ADAMS      CLERK
JAMES      CLERK

SQL> select*
  2  from emp
  3  where ename like 'A%A%A';

no rows selected

SQL> select*
  2  from emp
  3  where ename like '%A%A%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20

SQL> select*
  2  from emp
  3  where ename like '%A%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

7 rows selected.

SQL> select ename
  2  from emp
  3  where ename like 'K%G';

ENAME
----------
KING

SQL> select ename
  2  from emp
  3  where ename like 'JON%';

ENAME
----------
JONES

SQL> select*
  2  from emp
  3  where ename like 'A%' or
  4        ename like 'E%' or
  5     ename like 'E%' or
  6     ename like 'E%' or
  7  ;

*
ERROR at line 7:
ORA-00936: missing expression


SQL> select*
  2  from emp
  3  where ename like 'A%' or
  4   ename like 'E%' or
  5   ename like 'I%' or
  6   ename like 'O%' or
  7   ename like 'U%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20

SQL> select*
  2  from emp
  3  where ename like 'A%' or
  4  ename not like 'E%' or
  5  ename not like 'I%' or
  6  ename not like 'O%' or
  7  ename not like 'U%';

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

SQL> select ename,sal
  2  from emp
  3  where sal like '2%5';

ENAME             SAL
---------- ----------
JONES            2975

SQL> select *
  2  from emp
  3  where ename like '%LL%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

SQL> select *
  2  from emp
  3  where ename like '_U%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

SQL> select *
  2  from emp
  3  where ename like '%R___';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

SQL> select *
  2  from emp
  3  where ename like '_____';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30

8 rows selected.



SQL> select ename,hiredate
  2  from emp
  3  where hiredate like'%81';

ENAME      HIREDATE
---------- ---------
ALLEN      20-FEB-81
WARD       22-FEB-81
JONES      02-APR-81
MARTIN     28-SEP-81
BLAKE      01-MAY-81
CLARK      09-JUN-81
KING       17-NOV-81
TURNER     08-SEP-81
JAMES      03-DEC-81
FORD       03-DEC-81

10 rows selected.

SQL> select ename,hiredate
  2  from emp
  3  where hiredate like'__-___-81';

ENAME      HIREDATE
---------- ---------
ALLEN      20-FEB-81
WARD       22-FEB-81
JONES      02-APR-81
MARTIN     28-SEP-81
BLAKE      01-MAY-81
CLARK      09-JUN-81
KING       17-NOV-81
TURNER     08-SEP-81
JAMES      03-DEC-81
FORD       03-DEC-81

10 rows selected.

SQL> select ename,hiredate
  2  from emp
  3  where hiredate like'_______81';

ENAME      HIREDATE
---------- ---------
ALLEN      20-FEB-81
WARD       22-FEB-81
JONES      02-APR-81
MARTIN     28-SEP-81
BLAKE      01-MAY-81
CLARK      09-JUN-81
KING       17-NOV-81
TURNER     08-SEP-81
JAMES      03-DEC-81
FORD       03-DEC-81

10 rows selected.

SQL> select *
  2  from emp
  3  where hiredate like '%dec%';

no rows selected

SQL> select *
  2  from emp
  3  where hiredate like '%DEC%';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

SQL> select *
  2  from emp
  3  where hiredate like '__-DEC-__';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

SQL> select *
  2  from emp
  3  where hiredate like '___DEC___';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20

SQL>