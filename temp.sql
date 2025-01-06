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


CREATE TABEL table_name(
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

mysql> EXPLAIN select * from t_dept where deptno=1 \G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
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
        select-statement


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

CREATE VIEW v_selectproduct
    AS 
        SELECT id,name 
            FROM t_product;

mysql> select * from v_selectproduct;
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
   VALUES (cjgong1,'M',1),
          (cjgong1,'M',1),
          (cjgong1,'M',1),
          (cjgong1,'M',1),
          (cjgong1,'M',1),
          (cjgong1,'M',1),
          (cjgong1,'M',1),
          (cjgong1,'M',1),
          (cjgong1,'M',1),

          











