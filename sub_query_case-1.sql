-- //case -1

--  It is used to find unknown value in database 
SQL> set lines 10000 pages 10000
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

SQL> select ename,sal
  2  from emp
  3  where sal >(select sal
  4             from emp
  5             where ename='MARTIN');

ENAME             SAL
---------- ----------
ALLEN            1600
JONES            2975
BLAKE            2850
CLARK            2450
SCOTT            3000
KING             5000
TURNER           1500
FORD             3000
MILLER           1300

9 rows selected.

SQL> select *
  2  from emp
  3  where COMM <(select comm
  4             from emp
  5             where ename='WARD');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30

SQL> select *
  2  from emp
  3  where <(select comm
  4
SQL>
SQL> select *;
select *
       *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected


SQL> select *
  2  from emp
  3  where job in(select job
  4             from emp
  5             where ename='SMITH');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20




SQL> select ENAME,HIREDATE
  2  from emp
  3  where HIREDATE in(select HIREDATE
  4                     from emp
  5                     where ENAME='JAMES');

ENAME      HIREDATE
---------- ---------
FORD       03-DEC-81
JAMES      03-DEC-81

SQL> select ENAME,HIREDATE
  2  from emp
  3  where HIREDATE in(select HIREDATE
  4                     from emp
  5                     where ENAME='JAMES');

ENAME      HIREDATE
---------- ---------
FORD       03-DEC-81
JAMES      03-DEC-81

SQL> select ENAME,HIREDATE
  2  from emp
  3  where HIREDATE =(select HIREDATE
  4  from emp
  5                     where ENAME='JAMES');

ENAME      HIREDATE
---------- ---------
JAMES      03-DEC-81
FORD       03-DEC-81



SQL> select *
  2  from emp
  3  where deptno in (select deptno
  4                     from emp
  5                     where ename='KING');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10

SQL>