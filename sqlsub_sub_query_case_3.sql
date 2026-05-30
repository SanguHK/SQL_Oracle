-- case-3
-- to find the nth maximum and nth minimum

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

-- to display 2nd maximum salary
SQL> select max(sal)
  2  from emp
  3  where sal<(select max(sal)
  4             from emp
  5  );

  MAX(SAL)
----------
      3000

-- to display 3rd maximum salary
SQL> select max(sal)
  2  from emp
  3  where sal<(select max(sal)
  4             from emp
  5             where sal<(select max(sal)
  6                     from emp));

  MAX(SAL)
----------
      2975
-- to display 2nd minimum salary

SQL> select min(sal)
  2  from emp
  3  where sal>(select min(sal)
  4             from emp);

  MIN(SAL)
----------
       950

-- to display 3rd minimum salary
SQL> select min(sal)
  2  from emp
  3  where sal>(select min(sal)
  4             from emp
  5             where sal>(select min(sal)
  6                             from emp));

  MIN(SAL)
----------
      1100


-- to display 4th minimum salary
SQL> select min(sal)
  2  from emp
  3  where sal>(select min(sal)
  4             from emp
  5             where sal>(select min(sal)
  6             from emp
  7             where sal>(select min(sal)
  8                             from emp)));

  MIN(SAL)
----------
      1250

-- to display 2nd minimum commission
SQL> select min(comm)
  2  from emp
  3  where comm >(select min(comm)
  4             from emp);

 MIN(COMM)
----------
       300

-- to display 5th maximum hiredate
SQL> select max(hiredate)
  2  from emp
  3  where hiredate <(select max(hiredate)
  4                     from emp
  5                     where hiredate <(select max(hiredate)
  6                                     from emp
  7                                     where hiredate <(select max(hiredate)
  8                                                     from emp
  9                                                     where hiredate <(select max(hiredate)
 10                                                                     from emp))));

MAX(HIRED
---------
17-NOV-81

-- to display 2nd maximum hiredate
SQL> select max(hiredate)
  2  from emp
  3  where hiredate <(select max(hiredate)
  4                     from emp);

MAX(HIRED
---------
19-APR-87

-- to display 5th maximum employee number
SQL> select max(empno)
  2  from emp
  3  where empno <(select max(empno)
  4             from emp
  5             where empno <(select max(empno)
  6                             from emp
  7                             where empno <(select max(empno)
  8                                             from emp
  9                                             where empno <(select max(empno)
 10                                                             from emp))));

MAX(EMPNO)
----------
      7844
