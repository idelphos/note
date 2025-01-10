create table t_dept(
    deptno INT(20) NOT NULL,
    dname varchar(20),
    loc varchar(40)
);

INSERT INTO t_dept (deptno,dname,loc)
VALUES(NULL,'财务部','loc_item');


CREATE TABLE table_name (
    属性名 数据类型 UNIQUE,
    ......
)

create table t_dept (
    deptno INT NOT NULL,
    dname VARCHAR(20) DEFAULT 'cjgong',
    loc VARCHAR(40)
);

INSERT INTO t_dept(deptno,loc)
VALUES(25,'loc_item');


drop table t_dept;
create table t_dept(
    deptno INT,
    dname VARCHAR(20) UNIQUE,
    loc VARCHAR(40)
);

INSERT INTO t_dept
VALUES(1,'财务部','loc_item1');

INSERT INTO t_dept
VALUES(2,'财务部','loc_item2');


create table table_name(
    属性名 数据类型 PRIMARY KEY,
    ......
)

create table table_name(
    属性名 数据类型 AUTO_INCREMENT,
    ......
)

drop table t_dept;

create table t_dept(
    deptno INT PRIMARY KEY,
    dname VARCHAR(20),
    loc VARCHAR(40)
);

desc t_dept;

mysql> create table t_dept(
    ->     deptno INT PRIMARY KEY,
    ->     dname VARCHAR(20),
    ->     loc VARCHAR(40)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> desc t_dept;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| deptno | int         | NO   | PRI | NULL    |       |
| dname  | varchar(20) | YES  |     | NULL    |       |
| loc    | varchar(40) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

insert into t_dept
values(1,'财务','loc_item1');

insert into t_dept
values(1,'信息','loc_item2');




drop table t_dept;

create table t_dept(
    deptno INT PRIMARY KEY,
    dname VARCHAR(20),
    loc VARCHAR(20)
);

desc t_dept;

create table table_name(
    属性名 数据类型,
    属性名 数据类型,
    ......
    CONSTRAINT fk_name FOREIGN KEY (属性名)
        REFERENCES 表名(属性名2)
)


drop table t_dept;

create table t_dept(
    deptno INT PRIMARY KEY,
    dname VARCHAR(20),
    loc VARCHAR(20)
);

create table t_employee(
    empno INT PRIMARY KEY,
    ename VARCHAR(20),
    job VARCHAR(40),
    MGR INT,
    Hiredate DATE,
    sal DOUBLE(10,2),
    comm DOUBLE(10,2),
    deptno INT,
    CONSTRAINT fk_deptno FOREIGN KEY(deptno)
        REFERENCES t_dept(deptno)
);

INSERT INTO t_dept
    VALUES(1,'财务','loc_item2'),
    (2,'财务','loc_item2');

INSERT INTO t_employee(empno,deptno)
    VALUES(10,1);
INSERT INTO t_employee(empno,deptno)
    VALUES(10,3);
INSERT INTO t_employee(empno,deptno)
    VALUES(5,3);

CREATE INDEX index_name 
ON table_name (column1 [ASC|DESC], column2 [ASC|DESC], ...);


CREATE TABLE table_name(
    属性名 数据类型,
    属性名 数据类型,
    ....
    INDEX index_name (属性名 [ASC|DESC])
)

create table t_dept(
    deptno INT,
    dname VARCHAR(20),
    loc VARCHAR(20),
    INDEX index_deptno (deptno)
);

mysql> show create table t_dept \G
*************************** 1. row ***************************
       Table: t_dept
Create Table: CREATE TABLE `t_dept` (
  `deptno` int DEFAULT NULL,
  `dname` varchar(20) DEFAULT NULL,
  `loc` varchar(20) DEFAULT NULL,
  KEY `index_deptno` (`deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

mysql> EXPLAIN SELECT * FROM t_dept WHERE deptno=1 \G
*************************** 1. row ***************************
           id: 1
  SELECT_type: SIMPLE
        table: t_dept
   partitions: NULL
         type: ref
possible_keys: index_deptno
          key: index_deptno
      key_len: 5
          ref: const
         rows: 1
     filtered: 100.00
        Extra: NULL

DROP INDEX index_deptno ON t_dept;
CREATE INDEX index_deptno ON t_dept (deptno);

ALTER TABLE table_name 
    ADD INDEX index_name (属性名[(长度)] [ASC|DESC])


ALTER TABLE t_dept ADD INDEX index_deptno (deptno);

CREATE TABLE table_name(
    属性名1 数据类型,
    .....
    属性名n 数据类型,
    INDEX|KEY index_name (属性名1 [(长度)][ASC|DESC],
                          ...
                          属性名n [(长度)][ASC|DESC])
)

CREATE TABLE t_dept(
    deptno INT,
    dname VARCHAR(20),
    loc VARCHAR(40),
    INDEX index_name_loc(dname,loc)
);

EXPLAIN SELECT * FROM t_dept WHERE dname='cjgong' \G

CREATE VIEW view_name
    AS 
        SELECT-statement


CREATE table t_product(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    price FLOAT
);

INSERT INTO t_product(name,price)
    VALUES('apple',6.5),
        ('banana',4.5),
        ('orange',1.5),
        ('pear',2.5);

CREATE VIEW v_SELECTproduct
    AS 
        SELECT id,name 
            FROM t_product;

mysql> SELECT * FROM v_SELECTproduct;
+----+--------+
| id | name   |
+----+--------+
|  1 | apple  |
|  2 | banana |
|  3 | orange |
|  4 | pear   |
+----+--------+

CREATE TABLE t_group(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(10)
);

CREATE TABLE t_student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    sex ENUM('W','M'),
    group_id INT,
    CONSTRAINT fk_group_id FOREIGN KEY (group_id) REFERENCES t_group(id) 
);


INSERT INTO t_student(name,sex,group_id)
   VALUES ('cjgong1','M',1),
          ('cjgong2','M',1),
          ('cjgong3','W',2),
          ('cjgong4','M',2),
          ('cjgong5','W',2),
          ('cjgong6','M',3),
          ('cjgong7','M',5),
          ('cjgong8','W',4),
          ('cjgong9','M',3);


CREATE VIEW v_test3
    AS 
        SELECT name FROM t_student
            ORDER BY id DESC;

INSERT INTO v_product(name)
    VALUES('pear5'),
          ('pear6')



SELECT * FROM v_product
    WHERE name LIKE 'pear%';

DELETE FROM v_product
    WHERE name LIKE 'pear%';

ALTER VIEW v_product 
    AS SELECT id,name,price FROM t_product;
UPDATE v_product
    set price=8.8
        WHERE name='apple';


CREATE TABLE t_dept

CREATE TABLE t_diary(
    diaryno INT PRIMARY KEY AUTO_INCREMENT,
    tablename   VARCHAR(20),
    diarytime   DATETIME
);

CREATE TRIGGER tri_diarytime
    BEFORE INSERT 
        ON t_dept FOR EACH ROW
            INSERT INTO t_diary 
                VALUES(NULL,'t_dept',now());

INSERT INTO t_dept ()
    VALUES (1,'cjgongdept','ShangXi');

INSERT INTO table_name(field1,field2...fieldn)
    VALUES(value1,value2...valuen)

INSERT INTO t_dept
    VALUES(5,'f_dept','XiAn'),
        (6,'d_dept','ShenZhen'),
        (9,'x_dept','GuangZhou');

INSERT INTO table_name(field1,field2...fieldn)
    SELECT (field21,field22...field2n)
        FROM table_name2
            WHERE 

CREATE TABLE t_loader(
    id INT,
    name VARCHAR(20),
    dname VARCHAR(20),
    loc VARCHAR(40)
);


INSERT INTO t_loader
    VALUES(1,'cjgong1','dept1','shangxi1'),
           (2,'cjgong2','dept2',NULL),
           (3,'cjgong3','dept3','shangxi3'),
           (4,'cjgong4','dept4','shangxi4'),
           (5,'cjgong5','dept5','shangxi5');

INSERT INTO t_dept(dname,loc)
    SELECT dname,loc
        FROM t_loader;

UPDATE t_dept
    SET loc='shangxi2'
    WHERE dname='cjgongdept';

UPDATE t_dept
    SET dname='w_dept',
        loc='WuHan'
    WHERE deptno=10;

UPDATE t_dept
    SET dname='dept_test',
        loc='loc_test'
    WHERE dname LIKE 'dept%';

DELETE FROM table_name
    [WHERE condition]

SELECT CONCAT(a.first_name,"的年薪是: ", b.salary*12)
    FROM employees AS a, salaries AS b
        WHERE a.emp_no = b.emp_no
        LIMIT 10;

SELECT emp_no,first_name,last_name
    FROM employees
        WHERE first_name = 'Prasadram' && gender = 'M';

SELECT emp_no,first_name,last_name
    FROM employees
        WHERE hire_date BETWEEN '2000-01-01' AND '2008-01-06';

SELECT emp_no,first_name,last_name
    FROM employees
        WHERE emp_no NOT BETWEEN 200000 AND 500000;

SELECT *
    FROM t_loader
        WHERE loc IS NULL;

SELECT emp_no,first_name,last_name
    FROM employees
        WHERE emp_no IN (100000,200000,300000,400000,500000);

INSERT INTO employees(birth_date, first_name,last_name,gender,hire_date)
    VALUES('19861213','Ade','Yuan','M','20100102');



mysql> SELECT * FROM t_loader;
+------+---------+-------+----------+
| id   | name    | dname | loc      |
+------+---------+-------+----------+
|    1 | cjgong1 | dept1 | shangxi1 |
|    2 | cjgong2 | dept2 | NULL     |
|    3 | cjgong3 | dept3 | shangxi3 |
|    4 | cjgong4 | dept4 | shangxi4 |
|    5 | cjgong5 | dept5 | shangxi5 |
+------+---------+-------+----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM t_loader WHERE loc IN('shangxi1',NULL);
+------+---------+-------+----------+
| id   | name    | dname | loc      |
+------+---------+-------+----------+
|    1 | cjgong1 | dept1 | shangxi1 |
+------+---------+-------+----------+

mysql> SELECT * FROM t_loader WHERE loc NOT IN('shangxi1',NULL);
Empty set (0.00 sec)

SELECT * 
    FROM table_name
        ORDER by fieldx;

SELECT * 
    FROM table_name
        ORDER by field1 ASC,
                field2 DESC;

SELECT * 
    FROM table_name
        WHERE condition
            LIMIT ROW_COUNT;

SELECT COUNT(*)
    FROM t_loader;

SELECT COUNT(loc)
    FROM t_loader;

SELECT COUNT(loc)
    FROM t_loader
        WHERE loc LIKE 'shangxi%';

SELECT function()
    FROM table_name
        WHERE condition
            GROUP BY field;

SELECT dept_no, COUNT(emp_no), GROUP_CONCAT(emp_no) emp_no
    FROM dept_emp 
        GROUP BY dept_no;


SELECT GROUP_CONCAT(field), function(field)
    FROM table_name
        WHERE condition
            GROUP BY field1,field2..

SELECT function(field)
    FROM table_name
        WHERE condition
        GROUP by filed1, field2...
        HAVING condition;

SELECT depno,AVG(sal) average_sal,GROUP_CONCAT(ename) ename,count(ename)
    FROM t_employee
    GROUP by deptno
    HAVING AVG(sal) > 2000;

INSERT INTO t_dept
    VALUES(10,'ACCOUNTING','NEW YORK'),
          (20,'RESEARCH','DALLAS'),
          (30,'SALES','CHICAGO'),
          (40,'OPERATIONS','BOSTON');

CREATE TABLE t_employee(
    empno INT PRIMARY KEY,
    ename VARCHAR(20),
    job VARCHAR(20),
    MGR INT,
    Hiredate DATE,
    sal FLOAT,
    comm FLOAT,
    deptno INT,
    CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES t_dept (deptno)
);

INSERT INTO t_employee
    VALUES (7369,'SMITH','CLERK',7902,'19810312',800,NULL,20),
        (7499,'ALLEN',"SALESMAN",7698,'19820312',1600,300,30),
        (7521,'WARD','SALESMAN',7698,'19830312',1250,500,30),
        (7566,'JONES','MANAGER',7839,'19810312',2975,NULL,20),
        (7654,'MARTIN','SALESMAN',7698,'19810312',1250,1400,30),
        (7698,'BLAKE','MANAGER',7839,'19850312',2850,NULL,30),
        (7782,'CLARK','MANAGER',7839,'19850312',2450,NULL,10),
        (7788,'SCOTT','ANALYST',7566,'19810312',3000,NULL,20),
        (7839,'KING','PRESIDENT',NULL,'19820312',5000,NULL,10),
        (7844,'TURNER','SALESMAN',7698,'19890323', 1500,0,30),
        (7876,'ADAMS','CLERK',7788,'19871213',1100,NULL,20),
        (7900,'JAMES','CLERK',7698,'19870312',950,NULL,30),
        (7902,'FORD','ANALYST',7566,NULL,3000,NULL,20),
        (7934,'MILLER','CLERK',7782,'19821204',1300,NULL,10);

SELECT field1, field2 ...
    FROM table_name1 INNER JOIN table_name2 [INNER JOIN table_name3]
    ON join_condition

SELECT e.ename employname, e.job
    FROM t_employee e;

SELECT e.ename employeename, e.job, l.ename managername 
    FROM t_employee e INNER JOIN t_employee l
        ON e.mgr=l.empno;


SELECT e.empno,e.ename,e.job,d.dname,d.loc
    FROM t_employee e INNER JOIN t_dept d
        ON e.deptno = d.deptno;

SELECT e.empno,e.ename,e.job,d.dname,d.loc
    FROM t_employee e, t_dept d
        WHERE e.deptno = d.deptno;


SELECT e.empno,e.ename,e.sal,e.job, l.ename manager,d.dname,d.loc
    FROM t_employee e INNER JOIN t_employee l ON e.mgr = l.empno
        INNER JOIN t_dept d ON e.deptno = d.deptno;

SELECT field1, field2,...
    FROM table_name1 LEFT|RIGHT|FULL [OUTER] JOIN table_name2 
        ON join_condition;
        
INSERT INTO t_employee
    VALUES (7999,'cjgong','CLERK',7782,'19810312',5200,NULL,50);


SELECT e.ename,e.job 
    FROM t_employee;

SELECT e.ename, e.job,l.ename
    FROM t_employee e LEFT JOIN t_employee l
        ON e.mgr = l.empno;

SELECT field1,field2... fieldn
    FROM table_name
UNION | UNION ALL
SELECT field1,field2... fieldn
    FROM table_name


SELECT sal
    FROM t_employee
        WHERE ename='SMITH';

SELECT * 
    FROM t_employee
    WHERE sal > (
        SELECT sal
            FROM t_employee
            WHERE ename='SMITH'
    );

SELECT sal,job
    FROM t_employee
    WHERE ename = 'SMITH';

SELECT ename,sal,job
    FROM t_employee
    WHERE (sal,job)=(
        SELECT sal,job
            FROM t_employee
            WHERE ename = 'SMITH'
    );

SELECT deptno
    FROM t_dept;

SELECT * 
    FROM t_employee
    WHERE deptno IN (
        SELECT deptno
            FROM t_dept
    );

SELECT sal
    FROM t_employee
    WHERE job='MANAGER';

SELECT ename,sal
    FROM t_employee
    WHERE sal > ANY(
        SELECT sal
            FROM t_employee
            WHERE job='MANAGER'
    );


SELECT * 
    FROM t_employee a, t_dept c 
    WHERE a.deptno = c.deptno;

SELECT * 
    FROM t_dept c
    WHERE NOT EXISTS(
        SELECT *
            FROM t_employee
            WHERE deptno=c.deptno
    );

SELECT d.deptno,d.dname,d.loc,COUNT(e.empno),AVG(e.sal) average_sal
    FROM t_employee e INNER JOIN t_dept d 
        ON e.deptno = d.deptno
        GROUP by d.deptno  , d.dname,d.loc;

CREATE PROCEDURE procedure_name (parameter list)
    routine_body

CREATE FUNCTION function_name(parameter list)
    routine_body


DELIMITER $$
CREATE PROCEDURE proce_employee_sal()
COMMENT '查询所有雇员的工资'
BEGIN
    SELECT sal
        FROM t_employee
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION func_employee_sal(empno INT(11))
    RETURNS DOUBLE(10,2)
COMMENT '查询某个雇员的工资'
BEGIN
    RETURN (
        SELECT sal
            FROM t_employee
            WHERE t_employee.empno=empno);
    )
END$$
DELIMITER ;