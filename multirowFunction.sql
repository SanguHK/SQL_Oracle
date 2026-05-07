
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

SQL> select max(sal),max(comm),sum(sal),avg(sal),avg(comm)
  2  from emp;

  MAX(SAL)  MAX(COMM)   SUM(SAL)   AVG(SAL)  AVG(COMM)
---------- ---------- ---------- ---------- ----------
      5000       1400      29025 2073.21429        550

SQL> select count(*)
  2  from emp
  3  where deptno in 10;

  COUNT(*)
----------
         3

SQL> select count(*)
  2  from emp;

  COUNT(*)
----------
        14

SQL> select count(*)
  2  from emp
  3  where deptno = 10;

  COUNT(*)
----------
         3

SQL> select count(*)
  2  from emp
  3  where sal between 900 and 4500;

  COUNT(*)
----------
        12

SQL> select max(sal)
  2  from emp
  3  where job in ('SALESMAN','MANAGER','ANALYST');

  MAX(SAL)
----------
      3000

SQL> select count(*)
  2  from emp
  3  where ename like '%K%';

  COUNT(*)
----------
         3

SQL> select count(ename)
  2  from emp
  3  where ename like '%K%';

COUNT(ENAME)
------------
           3

SQL> select count(*)
  2  from emp
  3  where comm is null;

  COUNT(*)
----------
        10

SQL> select count(comm)
  2  from emp
  3  where comm is null;

COUNT(COMM)
-----------
          0

SQL> select max(ename),min(ename)
  2  from emp
  3  where hiredate >'07-JUN-81'
  4  and comm <2000;

MAX(ENAME) MIN(ENAME)
---------- ----------
TURNER     MARTIN

SQL> select max(hiredate),min(hiredate)
  2  from emp
  3  where mgr not in (7698,7566);

MAX(HIREDATE) MIN(HIREDATE)
--------- ---------
23-MAY-87 17-DEC-80