
SQL*Plus: Release 11.2.0.1.0 Production on Tue Jun 9 21:50:22 2026

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

Enter user-name: scott
Enter password:

Connected to:
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options

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
      1111 WARNER     SALESMAN             04-JUN-26       5000        200

15 rows selected.

SQL> select *
  2  from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
DEPT                           TABLE
EMP                            TABLE
SALGRADE                       TABLE

SQL> spool C:\Users\SANGANNA\Desktop\SQL1230\shk.text
SQL> create table products(
  2  pid number(2) primary key,
  3  pname varchar(20) not null,
  4  price number(7,2) not null);

Table created.

SQL> select *
  2  from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
DEPT                           TABLE
EMP                            TABLE
PRODUCTS                       TABLE
SALGRADE                       TABLE

SQL> create table customers(
  2  cid number(3) primary key,
  3  cname varchar(20) not null,
  4  mob number(10) not null unique,
  5  pid number(2),
  6  foreign key(pid) references products(pid));

Table created.

SQL> select *
  2  from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
CUSTOMERS                      TABLE
DEPT                           TABLE
EMP                            TABLE
PRODUCTS                       TABLE
SALGRADE                       TABLE

6 rows selected.

SQL> desc customers
 Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 CID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               NOT NULL NUMBER(3)
 CNAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             NOT NULL VARCHAR2(20)
 MOB                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               NOT NULL NUMBER(10)
 PID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        NUMBER(2)

SQL> create table abc
  2  as
  3  select * from emp;

Table created.

SQL> select *
  2  from abc;

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

SQL> alter table customers
  2  add email varchar(15) not null unique;

Table altered.

SQL> desc customers
 Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 CID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               NOT NULL NUMBER(3)
 CNAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             NOT NULL VARCHAR2(20)
 MOB                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               NOT NULL NUMBER(10)
 PID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        NUMBER(2)
 EMAIL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             NOT NULL VARCHAR2(15)

SQL> alter table customers
  2  rename column mob to phone;

Table altered.

SQL> alter table customers
  2  drop column email;

Table altered.

SQL> select *
  2  select;
select
*
ERROR at line 2:
ORA-00923: FROM keyword not found where expected


SQL> desc customers
 Name                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 CID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               NOT NULL NUMBER(3)
 CNAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             NOT NULL VARCHAR2(20)
 PHONE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             NOT NULL NUMBER(10)
 PID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        NUMBER(2)

SQL> rename abc to abcd;

Table renamed.

SQL> select *
  2  from abc;
from abc
     *
ERROR at line 2:
ORA-00942: table or view does not exist


SQL> select *
  2  from abcd;

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

SQL> truncate table abcd;

Table truncated.

SQL> select *
  2  from abcd;

no rows selected

SQL> select *
  2  from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
ABCD                           TABLE
BONUS                          TABLE
CUSTOMERS                      TABLE
DEPT                           TABLE
EMP                            TABLE
PRODUCTS                       TABLE
SALGRADE                       TABLE

7 rows selected.

SQL> drop table products;
drop table products
           *
ERROR at line 1:
ORA-02449: unique/primary keys in table referenced by foreign keys


SQL> drop table customers;

Table dropped.

SQL> select *
  2  from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
ABCD                           TABLE
BIN$+Ggfert1RfG1uxIPDKxs1A==$0 TABLE
BONUS                          TABLE
DEPT                           TABLE
EMP                            TABLE
PRODUCTS                       TABLE
SALGRADE                       TABLE

7 rows selected.

SQL> show recyclebin
ORIGINAL NAME    RECYCLEBIN NAME                OBJECT TYPE  DROP TIME
---------------- ------------------------------ ------------ -------------------
CUSTOMERS        BIN$+Ggfert1RfG1uxIPDKxs1A==$0 TABLE        2026-06-09:22:14:31
SQL> flashback table customers to before drop;

Flashback complete.

SQL> select *
  2  from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
ABCD                           TABLE
BONUS                          TABLE
CUSTOMERS                      TABLE
DEPT                           TABLE
EMP                            TABLE
PRODUCTS                       TABLE
SALGRADE                       TABLE

7 rows selected.

SQL> drop table abcd purge;

Table dropped.

SQL> select *
  2  from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BONUS                          TABLE
CUSTOMERS                      TABLE
DEPT                           TABLE
EMP                            TABLE
PRODUCTS                       TABLE
SALGRADE                       TABLE

6 rows selected.

SQL> spool off
SQL>