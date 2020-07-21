# reference

[MySQL8.0 reference manual](https://dev.mysql.com/doc/refman/8.0/en/linux-installation-debian.html) 

[SQL](./SQL.md)

[MySQL example database](https://dev.mysql.com/doc/index-other.html)



[toc]



# MySQL 8.0 installation

## Installing MySQL on Linux Using deb package from Oracle

```shell
 # OS: deepin v20
tar -xf mysql-server.deb.tar
apt install libaio1       # install libaio library

sudo dpkg-preconfigure *.deb

# basic installation
sudo dpkg -i *.deb

apt-get -f install       #若有依赖问题,修复依赖

# All configuration files (like my.cnf) are under /etc/mysql
# All binaries, libraries, headers, etc., are under /usr/bin and /usr/sbin
# The data directory is under /var/lib/mysql




```

refer to [MySQL example database](https://dev.mysql.com/doc/index-other.html)  to install example database.

# MySQL basic

## comments

```mysql
# 单行注释
/* 多行注释

*/
```







## connect

```mysql
mysql -h host -u user -p      # -P port

mysql> SELECT user();         # 查询当前登录用户

quit                          #quit or exit to disconnect 
```



## queries

```mysql
select version(), CURRENT_DATE;
SELECT SIN(PI()/4), (4+1)*5;          #using mysql as a simple calculator
select version(); select now();


select user() \c                     # \c cancel to execute
                                     #  ;  \g        \G
```



## MySQL Prompt 

| Prompt   | Meaning                                                      |
| -------- | ------------------------------------------------------------ |
| `mysql>` | Ready for new query                                          |
| `->`     | Waiting for next line of multiple-line query                 |
| `'>`     | Waiting for next line, waiting for completion of a string that began with a single quote (`'`) |
| `">`     | Waiting for next line, waiting for completion of a string that began with a double quote (`"`) |
| ``>`     | Waiting for next line, waiting for completion of an identifier that began with a backtick (```) |
| `/*>`    | Waiting for next line, waiting for completion of a comment that began with `/*` |



## create database

database是 table的集合, 而 database server 可以容纳多个 databse , 逻辑关系:

Database server --> database --> table( 由列定义) --> row

```mysql
CREATE DATABASE company;
CREATE DATABASE `my.contacts`                  # `` 反标记字符引用标识符,若标识符中有特殊字符
USE company;                                   # 选择 DB
USE `my.contacts` ;

SELECT DATABASE();                      # 当前 DB
SHOW DATABASES;                         # 所有 DB
SHOW VARIABLES LIKE 'datadir' ;
```



## CREATE TABLE

表中定义列时, 应该指定列的名称, [数据类型](https://dev.mysql.com/doc/refman/8.0/en/data-types.html) 和默认值(若有) 

Data type: 

Numeric : INT, SMALLINT，TINYINT, MEDIUMINT,BIGINT, DECIMAL,  FLOAT, DOUBLE ..... 

Date and TIme

String

JSON



```mysql
mysql> CREATE TABLE IF NOT EXISTS `company`.`customers`(
    -> `id` int unsigned AUTO_INCREMENT PRIMARY KEY,
    -> `first_name` varchar(20),
    -> `last_name` varchar(20),
    -> `country` varchar(20)
    -> ) ENGINE=InnoDB;



`company`.`customers`  #引用表格,若当前DB是 company, 可以省略 DB 名字
IF NOT EXISTS 
ENGINE: InnoDB 是MySQL 中唯一的事务引擎,也是默认引擎 


mysql> CREATE TABLE `company`.`payments`(
    -> `customer_name` varchar(20) PRIMARY KEY,
    -> `payment` float 
    -> );

show engines;  列出所有引擎
show tables ;   列出所有表

show CREATE TABLE customers \G
*************************** 1. row ***************************
       Table: customers
Create Table: CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


DESC customers;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int unsigned | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(20)  | YES  |     | NULL    |                |
| last_name  | varchar(20)  | YES  |     | NULL    |                |
| country    | varchar(20)  | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

CREATE TABLE new_customers LIKE customers;   #将表结构克隆到新表中


#Summary
CREATE TABLE
show engines;
show tables; 
show CREATE TABLE <tabName>
DESC <tabName>
CREATE TABLE new_table LIKE existent_table; 
show warnings;

ctrl + L :         #  清理屏幕

```

## SELECT

```mysql

mysql> use employees 
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> DESC TABLE departments;

mysql> DESC departments;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | char(4)     | NO   | PRI | NULL    |       |
| dept_name | varchar(40) | NO   | UNI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> SELECT  dept_no , dept_name from departments;
+---------+--------------------+
| dept_no | dept_name          |
+---------+--------------------+
| d009    | Customer Service   |
| d005    | Development        |
| d002    | Finance            |
| d003    | Human Resources    |
| d001    | Marketing          |
| d004    | Production         |
| d006    | Quality Management |
| d008    | Research           |
| d007    | Sales              |
+---------+--------------------+


mysql> SELECT COUNT(*) FROM employees; 
+----------+
| COUNT(*) |
+----------+
|   300024 |
+----------+


#WHERE 过滤条件,除整数或浮点数外,其它应放在引号内.
mysql> SELECT emp_no FROM employees WHERE first_name = 'Georgi' AND last_name = 'Facello';
+--------+
| emp_no |
+--------+
|  10001 |
|  55649 |
+--------+


#Summary
USE
DESC <tabName>
DESC TABLE <tabName>
SELECT col1,col2 from tabName
SELECT COUNT(*) FROM tabName
SELECT col.. FROM tabName WHERE 



```

### ORDER BY     DESC / ASC

根据列或别名列对结果进行排序   DESC降序, ASC 升序  , 默认排序方式是 ASC. 还可以使用 LIMIT 子句与 ORDER BY 结合以限定结果集.

```mysql
# 薪水最高的前5名员工
SELECT emp_no, salary FROM salaries ORDER BY salary DESC LIMIT 5;
+--------+--------+
| emp_no | salary |
+--------+--------+
|  43624 | 158220 |
|  43624 | 157821 |
| 254466 | 156286 |
|  47978 | 155709 |
| 253939 | 155513 |
+--------+--------+

# ORDER BY 2 按第二列排序 
mysql> SELECT emp_no, salary FROM salaries ORDER BY 2 DESC LIMIT 5;
+--------+--------+
| emp_no | salary |
+--------+--------+
|  43624 | 158220 |
|  43624 | 157821 |
| 254466 | 156286 |
|  47978 | 155709 |
| 253939 | 155513 |
+--------+--------+
```

### GROUP BY

列上使用 GROUP BY ,然后使用聚合函数([group-by-functions](https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html)]), 如 COUNT, MAX, MIN,AVG. 还可以在GROUP BY 子句中的列上使用函数

```mysql
mysql> SELECT gender,count(*) AS count FROM employees GROUP BY gender; 
+--------+--------+
| gender | count  |
+--------+--------+
| M      | 179973 |
| F      | 120051 |
+--------+--------+

# AS 列别名


# 员工中名字最常见的10个名字, 按计数降序排列,且只取结果前10行
mysql> SELECT first_name, COUNT(first_name) AS count FROM employees GROUP by first_name ORDER BY count DESC LIMIT 10;
+-------------+-------+
| first_name  | count |
+-------------+-------+
| Shahab      |   295 |
| Tetsushi    |   291 |
| Elgin       |   279 |
| Anyuan      |   278 |
| Huican      |   276 |
| Make        |   275 |
| Sreekrishna |   272 |
| Panayotis   |   272 |
| Hatem       |   271 |
| Vitali      |   270 |
+-------------+-------+



mysql> SELECT '2017-06-12', YEAR('2017-06-12');
+------------+--------------------+
| 2017-06-12 | YEAR('2017-06-12') |
+------------+--------------------+
| 2017-06-12 |               2017 |
+------------+--------------------+
1 row in set (0.00 sec)

# 历年员工总薪水,按总薪水降序排列
mysql> SELECT YEAR(from_date), SUM(salary) as sum FROM salaries GROUP BY YEAR(from_date) ORDER BY sum DESC; 
+-----------------+-------------+
| YEAR(from_date) | sum         |
+-----------------+-------------+
|            2000 | 17535667603 |
|            2001 | 17507737308 |
|            1999 | 17360258862 |
|            1998 | 16220495471 |
|            1997 | 15056011781 |
|            1996 | 13888587737 |
|            1995 | 12638817464 |
|            1994 | 11429450113 |
|            2002 | 10243347616 |
|            1993 | 10215059054 |
|            1992 |  9027872610 |
|            1991 |  7798804412 |
|            1990 |  6626146391 |
|            1989 |  5454260439 |
|            1988 |  4295598688 |
|            1987 |  3156881054 |
|            1986 |  2052895941 |
|            1985 |   972864875 |
+-----------------+-------------+


#平均工资最高的10名员工
mysql> SELECT emp_no,AVG(salary) AS avg_salary FROM salaries GROUP BY emp_no ORDER BY avg_salary DESC LIMIT 10;
+--------+-------------+
| emp_no | avg_salary  |
+--------+-------------+
| 109334 | 141835.3333 |
| 205000 | 141064.6364 |
|  43624 | 138492.9444 |
| 493158 | 138312.8750 |
|  37558 | 138215.8571 |
| 276633 | 136711.7333 |
| 238117 | 136026.2000 |
|  46439 | 135747.7333 |
| 254466 | 135541.0625 |
| 253939 | 135042.2500 |
+--------+-------------+

```

#### HAVING

HAVING 子句用来过滤 GROUP BY子句的结果

```mysql
#平均薪水超过140000的员工

mysql> SELECT emp_no, AVG(salary) as avg_salary FROM salaries GROUP BY emp_no HAVING avg_salary > 140000 ORDER BY avg_salary DESC;
+--------+-------------+
| emp_no | avg_salary  |
+--------+-------------+
| 109334 | 141835.3333 |
| 205000 | 141064.6364 |

```



### DISTINCT

过滤表中的不同条目

```mysql
mysql> SELECT DISTINCT title from titles; 
+--------------------+
| title              |
+--------------------+
| Senior Engineer    |
| Staff              |
| Engineer           |
| Senior Staff       |
| Assistant Engineer |
| Technique Leader   |
| Manager            |
+--------------------+

```

## SELECT ... INTO OUTFILE 

使用 SELECT ... INTO OUTFILE 可以将查询输出保存到文件中, 能指定列和行分隔符, 将数据导入其它数据平台. 可以将输出目标 [另存为文件](### 另存为文件)  或 [另存为表](###另存为表)



### 另存为文件

用户需要保存文件, 需要有 FILE 权限 ,FILE 权限是一个全局特权, 不能限定为针对具体数据库, 但可以不限制用户的查询权限来保证安全.

Ubuntu 系统中, 默认不允许 MySQL 写入文件,需要配置 secure_file_priv 参数, 然后重启MySQL.

```shell
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
[mysqld]                                       # 在此 section 添加配置参数 
secure_file_priv = /var/lib/mysql   

sudo systemctl restart mysql

```

```mysql
mysql> CREATE USER 'user_ro_file'@'%' IDENTIFIED BY 'emp_pass';
mysql> GRANT SELECT ON employees.* TO 'user_ro_file'@'%';
mysql> GRANT FILE ON *.* TO 'user_ro_file'@'%' ;

mysql> SELECT first_name, last_name INTO OUTFILE 'result.csv' 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n' 
	FROM employees 
	WHERE hire_date <'1986-01-01' LIMIT 10;
	
	
cat /var/lib/mysql/employees/result.csv     #若文件名存在,语句会执行失败
"Bezalel","Simmel"
"Sumant","Peac"
"Eberhardt","Terkki"
"Otmar","Herbst"
"Florian","Syrotiuk"
"Tse","Herber"
"Udi","Jansch"
"Reuven","Garigliano"
"Erez","Ritzmann"
"Premal","Baek"
```

### 另存为表

可以将 SELECT 查询结果保存在表中. 表不存在可以使用 CREATE , SELECT 来创建表并加载数据 . 若表存在, 可以使用 INSERT, SELECT 加载数据.

```mysql
mysql> CREATE TABLE titles_only AS SELECT DISTINCT title FROM titles;
mysql> INSERT INTO titles_only SELECT DISTINCT title from titles; 

#若目标表中有 PRIMARY KEY, 可以使用 INSERT IGNORE 避免插入重复值.


```

## LOAD DATA INFILE 加载数据

SELECT ... INTO OUTFILE 的反向操作, 可以将数据加载到表中. 用户需要有表的 FILE 和 INSERT 权限 

导入的文件路径 : 可以是绝对路径,  也可以是相对路径, 相对路径则解析为相对客户机程序启动的目录.

```mysql
mysql> CREATE table employee_names(
    -> `first_name` varchar(15) NOT NULL,
    -> `last_name` varchar(16) NOT NULL
    -> )ENGINE=InnoDB;
    
 root@ade-PC:~# ls -l /var/lib/mysql/employees/result.csv 
-rw-r----- 1 mysql mysql 180 7月  21 09:56 /var/lib/mysql/employees/result.csv


mysql> LOAD DATA INFILE 'result.csv' INTO TABLE employee_names
    -> FIELDS TERMINATED BY ','
    -> OPTIONALLY ENCLOSED BY '"'
    -> LINES TERMINATED BY '\n' ;

mysql> LOAD DATA INFILE 'result.csv' INTO TABLE employee_names
    -> FIELDS TERMINATED BY ','
    -> OPTIONALLY ENCLOSED BY '"'
    -> LINES TERMINATED BY '\n' 
    -> IGNORE 1 LINES;           # 忽略指定行.
    
mysql> LOAD DATA INFILE 'result.csv' 
    -> REPLACE INTO TABLE employee_names    #REPLACE / IGNORE 来处理重复的行.
    -> FIELDS TERMINATED BY ','
    -> OPTIONALLY ENCLOSED BY '"'
    -> LINES TERMINATED BY '\n';
    

mysql> LOAD DATA LOCAL INFILE 'result.csv'  
    -> REPLACE INTO TABLE employee_names    
    -> FIELDS TERMINATED BY ','
    -> OPTIONALLY ENCLOSED BY '"'
    -> LINES TERMINATED BY '\n';
#LOCAL 装载位于远程客户机上的文件, 文件先被复制到服务器的常规临时路径中(Linux 的/tmp) 其后再加载数据

```



## ? 表关联 JOIN

可以使用 JOIN来查询关联的表.   为了关联两个表,它们必须有一个或多个共同列, 关联的列名称不需要匹配

```mysql
# 查询员工编号信息与所属部门
# employees 与 dept_manager 通过 emp.no 列关联
# dept_manager 与 departments 通过 dept_no列关联

# 查询员工编号为110022的员工 所属的部门
mysql> SELECT emp.emp_no, emp.first_name, emp.last_name, dept.dept_name 
    -> FROM employees AS emp
    -> JOIN dept_manager AS dept_mgr 
    -> ON emp.emp_no = dept_mgr.emp_no AND emp.emp_no = '110022'
    -> JOIN departments AS dept 
    -> ON dept_mgr.dept_no = dept.dept_no;
+--------+------------+------------+-----------+
| emp_no | first_name | last_name  | dept_name |
+--------+------------+------------+-----------+
| 110022 | Margareta  | Markovitch | Marketing |
+--------+------------+------------+-----------+

AS 表别名

# employees 与 salaries 通过 emp_no 关联
# employees 与 dept_manager 通过 emp.no 列关联
# dept_manager 与 departments 通过 dept_no列关联

# 查询每个部门的平均工资


```







## INSERT

```mysql
mysql> INSERT IGNORE INTO company.customers(first_name, last_name, country)
    -> VALUES
    -> ('Mike', 'Christensen', 'USA'),
    -> ('Andy', 'Hollands', 'Australia'),
    -> ('Ravi', 'Vadantam', 'India'),
    -> ('Rajiv', 'Perera', 'Sri Lanka');
    
    IGNORE      # 插入重复行,新数据会被忽略; 未给出IGNORE ,INSERT会出错.行的唯一性由主键标识 
```

### INSERT  ... ON DUPLICATE KEY UPDATE / REPLACE

```mysql
mysql> REPLACE INTO customers VALUES (1, 'MIKE', 'Christensen', 'America');
Query OK, 2 rows affected (0.10 sec)

# REPLACE 若表中无插入值,相当于 INSERT. 若有重复记录,则删除行并插入新行.


#INSERT 使用ON DUPLICATE KEY UPDATE 选项来处理重复项
#若无重复值,直接插入
#若有重复值,更新已有行

mysql> INSERT INTO payments VALUES ('Mike Christensen',200) ON DUPLICATE KEY UPDATE payment=payment + VALUES(payment);
Query OK, 1 row affected, 1 warning (0.07 sec)


mysql> INSERT INTO payments VALUES('Ravi Vedantam',500) ON DUPLICATE KEY UPDATE payment=payment + VALUES(payment);
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> INSERT INTO payments VALUES('Mike Christensen',300) ON DUPLICATE KEY UPDATE payment=payment + VALUES(payment);
Query OK, 2 rows affected, 1 warning (0.00 sec)

#'VALUES function' is deprecated, following is recommended.

mysql> INSERT INTO payments VALUES('Mike Christensen',500) as newvalue ON DUPLICATE KEY UPDATE payments.payment = payments.payment + newvalue.payment;
Query OK, 2 rows affected (0.03 sec)




```



## UPDATE

```mysql
mysql> UPDATE customers SET first_name='Rajiv', country='UK' WHERE id = 4;

WHERE   where 子句过滤符合条件的记录. where 子句是强制性的.若没有 where, UPDATE 会更新整个表,所以建议在事务中修改数据,以便回滚.


```

## DELETE

```mysql
 DELETE FROM customers WHERE id=4 AND first_name = 'Rajiv';
 
 WHERE 子句是强制性的, 没有 WHERE, DELETE 会删除表中所有行. 建议在事务中修改数据,以便回滚.
 
```

### TRUNCATE 

```mysql
#TRUNCATE TABLE 快速清空表
# DDL操作,一旦清空数据,不能回滚

TRUNCATE TABLE customers ;    

```

## comparison operators

[comparison operators](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html)

### IN

检查一个值否在一组值中

```mysql
mysql> SELECT count(*) FROM employees WHERE last_name IN ('Christ', 'Lamba', 'Baba');
+----------+
| count(*) |
+----------+
|      626 |
+----------+
```

### BETWEEN ... AND

```mysql
mysql> SELECT count(*) FROM employees WHERE hire_date BETWEEN '1986-12-01' AND '1986-12-13';
+----------+
| count(*) |
+----------+
|     1308 |
+----------+
```

### NOT

```mysql
# NOT 运行符否定结果
mysql> SELECT count(*) FROM employees WHERE hire_date NOT BETWEEN '1986-12-01' AND '1986-12-13';
+----------+
| count(*) |
+----------+
|   298716 |
+----------+
```

### LIKE

LIKE 运算符实现简单模式匹配, _ 精准匹配一个字符 , % 匹配任意数量的字符

```mysql
mysql> SELECT count(*) FROM employees WHERE first_name LIKE 'christ%';
+----------+
| count(*) |
+----------+
|     1157 |


mysql>  SELECT count(*) FROM employees WHERE first_name LIKE 'christ%ed';
+----------+
| count(*) |
+----------+
|      228 |
+----------+

mysql>  SELECT count(*) FROM employees WHERE first_name LIKE '%sri%';
+----------+
| count(*) |
+----------+
|      253 |
+----------+

mysql> SELECT count(*) FROM employees WHERE first_name LIKE '__ka%';
+----------+
| count(*) |
+----------+
|     1918 |
+----------+
```

### LIMIT

限定结果数量

```mysql
# hire_date 在1986年之前的任意10名员工
mysql> SELECT first_name, last_name FROM employees WHERE hire_date < '1986-01-01' LIMIT 10;
+------------+------------+
| first_name | last_name  |
+------------+------------+
| Bezalel    | Simmel     |
| Sumant     | Peac       |
| Eberhardt  | Terkki     |
| Otmar      | Herbst     |
| Florian    | Syrotiuk   |
| Tse        | Herber     |
| Udi        | Jansch     |
| Reuven     | Garigliano |
| Erez       | Ritzmann   |
| Premal     | Baek       |
+------------+------------+

```



### REGEXP

WHERE 子句中使用正则表达式 [regexp](https://dev.mysql.com/doc/refman/8.0/en/regexp.html)



## 获取数据库和表的信息

information_schema 数据库是由所有数据库对象的元数据组成的视图集合. 查询information_schema 中的表或使用 SHOW 命令,它们实质上是相同的.

information_schema表中有两种类型的元数据

**TABLES** : 包含有关表的所有信息

**COLUMNS**: 每个表的所有列及其定义

**FILES**: MySQL 将 InnoDB 数据存储在字典中的目录(与 DB 同名)内的.idb 文件中, 要获取文件信息,可以查询 FILES 表.
`mysql> SELECT * FROM FILES WHERE FILE_NAME LIKE './employees/employees.idb' \G`

**INNODB_TABLESPACES** :
`mysql> SELECT * FROM INNODB_TABLESPACES WHERE NAME='employees/employees' \G`

**INNODB_TABLESTATS**:  提供了索引大小和近似行数
`mysql> SELECT * FROM INNODB_TABLESTATS WHERE NAME='employees/employees' \G`

**PROCESSLIST**: 列出了服务器上运行的所有查询:

```mysql
SELECT * FROM PROCESSLIST \G 
SHOW PROCESSLIST  
```



# stored procedure

SQL 语句需要先编译然后执行, 而 存储过程(stored procedure) 是一组为了完成特定功能的 SQL 语句集,然后编译后存储在数据库中. 用户通过指定存储过程的名字并给定参数来调用执行它. 

存储过程是在数据库中创建并保存,可以由 SQL 语句和控制结构组成 , 存储的所有语句封装在单个程序中,并在需要时调用这个程序. 当想要在不同的应用程序或平台上执行相同的函数,或封装特定功能时, 可使用存储过程.

- 存储的函数(function) 和过程(procedure) 都称为存储例程(routine)

- 用户需要有 CREATE ROUTINE 权限才能创建存储过程

- 存储函数有返回值

- 存储过程没有返回值

- 所有代码都写在 BEGIN 和 END块之间

- 存储函数都可以直接在 SELECT 语句中调用

- 可以使用 CALL 语句调用存储过程

- 存储例程中的语句以;结尾,  因此要更改 MySQL的分隔符, 以免 MySQL 以正常语句解释存储例程中的 SQL 语句. 创建结束后,可以将分隔符更改回默认值.

  

  **存储过程的优点**:

- 增强 SQL 语言的功能和灵活性

- 较快的执行速度

- 减少网络流量

- 一种安全地访问数据的机制: 通过对执行某一存储过程的权限进行限制, 能够实现对相应数据的访问权限的限制.

  





## CREATE PROCEDURE

[CREATE PROCEDURE](https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html)



### 参数 

MySQL 存储过程的参数用在存储过程的定义, 根据需要分三种类型: IN, OUT, INOUT

**IN**: 必须在调用存储过程时指定,在存储过程中修改该参数的值不能被返回, 为默认值

**OUT**: 该值可在存储过程内部被改变, 并可返回

**INOUT**: 调用时指定,并且可被改变和返回



```mysql
/* 要往employees数据库中添加新员工, 需要同时更新三个表: employees, salaries, titles.
可以开发一个存储过程并调用它来创建新的 employee, 而不用执行三条语句.
传递的信息包括员工的 first_name, last_name , gender, birth_date 以及员工加入的 department. 
存储过程不返回值,但它可以更新一个变量并使用它.

*/

# 若存在相同名字的存储过程,则删除已存在的存储过程
DROP PROCEDURE IF EXISTS create_employee;
# 修改分隔符为 $$, 避免编写存储过程时,MySQL 执行语句
DELIMITER $$

# IN 指定作为参数的变量, OUT 指定输出的变量
CREATE PROCEDURE create_employee (OUT new_emp_no INT, IN first_name varchar(20), IN last_name varchar(20), IN gender enum('M','F'), IN birth_date date, IN emp_dept_name varchar(40), IN title varchar(50))
BEGIN                                        #　过程体 放在BEGIN...END 之间
	# 为emp_dept_no 和 salary 声明变量
	DECLARE emp_dept_no char(4);
	DECLARE salary INT DEFAULT 60000;
	
	SELECT max(emp_no) INTO new_emp_no FROM employees;
	SET new_emp_no = new_emp_no + 1;
	
	# 插入数据到 employees表中
	INSERT INTO employees VALUES(new_emp_no, birth_date, first_name, last_name,gender, CURDATE());
	
	# 找到 dept_name 对应的 dept_no
	SELECT emp_dept_name;
	SELECT dept_no INTO emp_dept_no FROM departments WHERE dept_name = emp_dept_name;
	SELECT emp_dept_no;
	
	INSERT INTO dept_emp VALUES(new_emp_no, emp_dept_no, CURDATE(), '9999-01-01');
	
	
	
	INSERT INTO titles VALUES(new_emp_no,title,CURDATE(),'9999-01-01');
	
	IF title = 'Staff'
			THEN SET salary = 100000;
	ELSEIF title = 'Senior Staff'
			THEN SET salary = 120000;
	END IF;
	
	INSERT INTO salaries VALUES(new_emp_no,salary, CURDATE(),'9999-01-01');
	
	END
	
	$$
	DELIMITER ;    # 过程体结束,改回 MySQL的默认分隔符
	
	
	# 创建该存储过程的方法
	# 1. 将代码粘贴到命令行客户端中
	# 2. mysql -u <user> -p employees < stored_procedure.sql
	# 3. mysql> SOURCE stored_procedure.sql


```

```mysql
# 列出数据库中的所有存储过程
mysql> SHOW PROCEDURE STATUS \G
# 显示存储过程定义	
mysql> show create procedure create_employee \G

# 授权执行存储过程的权限
mysql> GRANT EXECUTE ON employees.* TO 'emp_read_only'@'%';

#调用存储过程
mysql> CALL create_employee(@new_emp_no, 'John', 'Smith', 'M', '1984-06-19', 'Research', 'Staff');

mysql> SELECT @new_emp_no;
+-------------+
| @new_emp_no |
+-------------+
|      500000 |
+-------------+

#验证三个表中插入了相应记录
mysql> SELECT * FROM employees WHERE emp_no=500000;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
| 500000 | 1984-06-19 | John       | Smith     | M      | 2020-07-21 |
+--------+------------+------------+-----------+--------+------------+

mysql> SELECT * FROM salaries WHERE emp_no = 500000;
mysql> SELECT * FROM titles WHERE emp_no = 500000;
```



## CREATE FUNCTION

和存储过程一样, 用户可以创建存储函数. 二者的主要区别是函数应该有一个返回值, 并且可以在 SELECT 中调用. 通常编写函数用于简化计算

```mysql
# 函数查询收入水平
DROP FUNCTION IF EXISTS get_sal_level;
DELIMITER $$
CREATE FUNCTION get_sal_level(emp INT) RETURNS varchar(10)
	DETERMINISTIC
BEGIN
	DECLARE sal_level varchar(10);
	DECLARE avg_sal FLOAT;
	
	SELECT AVG(salary) INTO avg_sal FROM salaries WHERE emp_no=emp;
	
	IF avg_sal < 50000 THEN
	SET sal_level = 'BRONZE';
	ELSEIF (avg_sal >= 50000 AND avg_sal <70000) THEN
	SET sal_level = 'SILVER';
	ELSEIF (avg_sal >= 70000 AND avg_sal < 90000) THEN
	SET sal_level = 'GOLD';
	ELSEIF (avg_sal >= 90000) THEN
	SET sal_level = 'PLATINUM';
	ELSE
	SET sal_level = 'NOT FOUND';
	END IF;
	RETURN (sal_level);
END
$$
DELIMITER ;
	
```

```mysql
SHOW FUNCTION STATUS \G    # 显示DB 中所有 FUNCTION
SHOW CREATE FUNCTION <function name> # 显示FUNCTION 定义
```

### 内置函数

MySQ提供了许多内置函数.  如 CURDATE() 等.



# Trigger

触发器用于在触发事件之前或之后激活某些内容或操作. 

触发器动作时间可以是 **BEFORE** 或 **AFTER** , 表示触发器是在每行要修改之前或之后被激活.一个表可以同时具有多个触发器.

触发事件可以是 INSERT , DELETE , UPDATE

**INSERT**:  包括 INSERT, REPLACE, LOAD DATA 语句插入新行.

**UPDATE**:  UPDATE语句

**DELETE** : DELETE , REPLACE语句.

```mysql
# 将薪水插入 salaries 表之前对其进行四舍五入.
# NEW 指正在插入的新值
cat before_insert_trigger.sql

DROP TRIGGER IF EXISTS salay_round;
DELIMITER $$
CREATE TRIGGER salary_round BEFORE INSERT ON salaries
FOR EACH ROW
BEGIN
	SET NEW.salary = ROUND(NEW.salary);
END
$$
DELIMITER ; 

mysql> SOURCE before_insert_trigger.sql   # 导入文件创建trigger


#验证 Trigger是否工作
mysql> INSERT INTO salaries VALUES(10002, 100000.79, CURDATE(), '9999-01-01');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM salaries WHERE emp_no = 10002 AND from_date = CURDATE();
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10002 | 100001 | 2020-07-21 | 9999-01-01 |
+--------+--------+------------+------------+
```

```mysql
# 记录 salaries 表中新增的记录, 用于审计.
mysql> CREATE TABLE salary_audit (emp_no INT, user varchar(50), date_modified date);

cat before_insert_trigger.sql

DELIMITER $$
CREATE TRIGGER salary_audit
BEFORE INSERT
	ON salaries FOR EACH ROW PRECEDES salary_round
BEGIN
	INSERT INTO salary_audit VALUES(NEW.emp_no, USER(),CURDATE());
END;
$$
DELIMITER ;


mysql> SOURCE before_insert_trigger.sql
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO salaries VALUES(10003, 100000.79, CURDATE(), '9999-01-01');

mysql> SELECT * FROM salary_audit WHERE emp_no = 10003 ; 
+--------+-------------------+---------------+
| emp_no | user              | date_modified |
+--------+-------------------+---------------+
|  10003 | dbadmin@localhost | 2020-07-21    |
+--------+-------------------+---------------+


SHOW TRIGGERS \G
SHOW CREATE TRIGGER <trigger_name> 

```



# VIEW

view 是一个基于SQL 语句的结果集的虚拟表. 它像一个真正的表一样也具有行和列.  view隐藏了 SQL 的复杂性, 它也提供了额外的安全性.

```mysql

mysql> CREATE ALGORITHM = UNDEFINED
    -> DEFINER = 'dbadmin'@'%'
    -> SQL SECURITY DEFINER VIEW salary_view
    -> AS SELECT emp_no, salary FROM salaries WHERE from_date > '2002-01-01';

# 像普通表一样查询视图
mysql> SELECT emp_no , AVG(salary) as avg FROM salary_view GROUP BY emp_no ORDER BY avg DESC LIMIT 5;
+--------+-------------+
| emp_no | avg         |
+--------+-------------+
|  43624 | 158220.0000 |
|  47978 | 155709.0000 |
| 253939 | 155513.0000 |
| 109334 | 155190.0000 |
|  80823 | 154459.0000 |

#显示数据库中所有视图
mysql> SHOW FULL TABLES WHERE TABLE_TYPE LIKE 'VIEW';

mysql> SHOW CREATE VIEW salary_view \G
```



# EVENTS

MySQL 事件和 Linux 上的 cron 一样, MySQL EVENTS 是用来处理计划任务的. MySQL 使用称为事件调试线程的特殊线程来执行所有预定事件. 默认事件调度线程未启用.

`mysql> SET GLOBAL event_scheduler = ON;`   启用事件调度

```mysql
# 相关命令
mysql> SHOW EVENTS \G
mysql> SHOW CREATE EVENT purge_salary_audit \G   # 显示事件定义
mysql> ALTER EVENT purge_salary_audit DISABLE;   # 禁用事件
mysql> ALTER EVENT purge_salary_audit ENABLE;    # 启用事件

```

## 访问控制

 所有存储的程序(过程, 函数, 触发器,事件) 和 视图都有一个 DEFINER, 未指定时,则创建该对象的用户将被选为 DEFINER.

存储例程(过程和函数) 和视图具有值为 DEFINER 或 INVOKER 的 SQL SECURITY 特性, 来指定对象是在 definer 还是在 invoker上下文中执行. 触发器和事件没有 SQL SECURITY 特性, 且始终在 definer上下文中执行, 服务器根据需要自动调用这些对象,因此不存在调用用户.





# user 

所有用户信息及权限都存储在 mysql.user 表中, 若有权限访问mysql.user , 除了命令, 也可以直接修改 mysql.user 表的方式来创建用户并授权

使用 GRANT, REVOKE, SET PASSWORD, RENAME USER 等帐户管理语句修改授权表,则服务器会通知这些更改,并立即再次将授权表加载到内存中, 权限即刻生效.

若使用INSERT, UPDATE, DELETE 等直接修改授权表, 则更改不会影响权限检查 .除非重启 mysql server 或让其重新加载表(FLUSH PRIVILEGES). 否则即使更改了授权表, 重新加载表之前 ,更改都不会生效.
FLUSH PRIVILEGES语句可以重新加载 GRANT 表.

```mysql
mysql> flush privileges;      # 刷新权限

mysql> SELECT * FROM mysql.user WHERE user='dbadmin' \G 
*************************** 1. row ***************************
                    Host: %
                    User: dbadmin
             Select_priv: Y
             Insert_priv: Y
             Update_priv: Y
             Delete_priv: Y
             Create_priv: Y
               Drop_priv: Y
             Reload_priv: Y
           Shutdown_priv: Y
            Process_priv: Y
               File_priv: Y
              Grant_priv: N
         References_priv: Y
              Index_priv: Y
              Alter_priv: Y
            Show_db_priv: Y
              Super_priv: Y
   Create_tmp_table_priv: Y
        Lock_tables_priv: Y
            Execute_priv: Y
         Repl_slave_priv: Y
        Repl_client_priv: Y
        Create_view_priv: Y
          Show_view_priv: Y
     Create_routine_priv: Y
      Alter_routine_priv: Y
        Create_user_priv: Y
              Event_priv: Y
            Trigger_priv: Y
  Create_tablespace_priv: Y
                ssl_type: 
              ssl_cipher: 0x
             x509_issuer: 0x
            x509_subject: 0x
           max_questions: 0
             max_updates: 0
         max_connections: 0
    max_user_connections: 0
                  plugin: caching_sha2_password
   authentication_string: $A$005$_f.N[9AHIlM<9{kBY/KgNjt.HNykpeXTtiCUQYU/o6ZUavPCwHZxN6RZ2
        password_expired: N
   password_last_changed: 2020-07-21 06:44:39
       password_lifetime: NULL
          account_locked: N
        Create_role_priv: Y
          Drop_role_priv: Y
  Password_reuse_history: NULL
     Password_reuse_time: NULL
Password_require_current: NULL
         User_attributes: NULL
1 row in set (0.00 sec)

```



## create  user

refer to [CREATE USER](https://dev.mysql.com/doc/refman/8.0/en/create-user.html)

client 连接MySQL server 时, 访问控制经历两个阶段:

**连接验证**: MySQL server 通过用户名和连接的主机名来识别连接.服务器会调用用户认证插件并验证密码. 服务器还会检查用户是否被锁定

**请求验证**:  服务器会检查用户是否有足够的权限执行操作.

```mysql
mysql> CREATE USER IF NOT EXISTS 'company_read_only'@'localhost'  
    -> IDENTIFIED WITH mysql_native_password
    -> BY 'company_pass'
    -> WITH MAX_QUERIES_PER_HOUR 500
    -> MAX_UPDATES_PER_HOUR 100;

# company_read_only  username
# @localhost 仅从 localhost 访问
# 可以使用 10.148.%.% 形式限制 IP 访问,% 任意值
# password : company_pass ,  此密码会明文保存在$HOME/.mysql_history
# mysql_native_password ,默认身份验证方式 ,其它选项 sha256_password, LDAP, Kerberos.
# 用户一小时内执行的最大查询数 500
#   一小时内执行的最大更新次数 100 


# 创建 super 用户,用管理员账户来管理服务器.ALL 表示除GRANT 权限之外的所有权限
mysql> CREATE USER IF NOT EXISTS 'dbadmin'@'%' 
    -> IDENTIFIED BY 'yuanjun' 
    
mysql> GRANT ALL ON *.* TO 'dbadmin'@'%';
mysql> GRANT ALL ON *.* TO 'dbadmin'@'%' WITH GRANT OPTION;

```

### 设置帐户密码有效期

密码过期后, 用户需要修改才能使用.

可以使用默认密码创建用户,并设置密码过期. 帐户密码分享给开发人员,此帐户需要修改密码后才可以使用. 

```mysql
# 默认密码创建过期帐户 
mysql> CREATE USER 'developer'@'%' IDENTIFIED BY 'temp_password' PASSWORD EXPIRE;

# developer 用户登录后,需要修改密码才能使用.
mysql> show databases; 
ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.
mysql> ALTER USER 'developer'@'%' IDENTIFIED BY 'dev_password';

#手动设置密码过期
mysql> ALTER USER 'developer'@'%' PASSWORD EXPIRE;

# 设置过期时限
mysql> ALTER USER 'developer'@'%' PASSWORD EXPIRE INTERVAL 90 DAY; 
```

### 锁定帐户

MySQL 支持使用 CREATE USER 或 ALTER USER 锁定帐户.

```mysql
mysql> ALTER USER 'developer'@'%' ACCOUNT LOCK;

#解锁
mysql> ALTER USER 'developer'@'%' ACCOUNT UNLOCK;
```





## privilege

可以限制用户访问的数据库或表, 限制特定操作. 给其它用户授权, 需要有[GRANT](https://dev.mysql.com/doc/refman/8.0/en/grant.html) 权限 .

[MySQL provide privileges](https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html)

### GRANT授权

```mysql
mysql> GRANT SELECT ON company.* TO 'company_read_only'@'localhost';

#read only(SELECT) 权限授予 company_read_only用户. 
# company.*  数据库内的所有表.

mysql> GRANT INSERT ON company.* TO 'company_insert_only'@'localhost';

# write 权限授予 company_write 用户
mysql> GRANT INSERT, DELETE, UPDATE ON company.* ON 'company_write'@'%'

# 限制查询指定的表.
mysql> GRANT SELECT ON employees.employees TO 'employees_read_only'@'%'

# 限制查询指定的列
mysql> GRANT SELECT(first_name,last_name) ON employees.employees TO 'employees_read_only'@'%';

# 执行新授权来扩展授权
mysql> GRANT SELECT(salary) ON employees.salaries TO 'employees_ro'@'%';


# 查看授权
mysql> show GRANTS FOR 'dbadmin'@'%' \G
*************************** 1. row ***************************
Grants for dbadmin@%: GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `dbadmin`@`%`
*************************** 2. row ***************************
Grants for dbadmin@%: GRANT APPLICATION_PASSWORD_ADMIN,AUDIT_ADMIN,BACKUP_ADMIN,BINLOG_ADMIN,BINLOG_ENCRYPTION_ADMIN,CLONE_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,GROUP_REPLICATION_ADMIN,INNODB_REDO_LOG_ARCHIVE,INNODB_REDO_LOG_ENABLE,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_APPLIER,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SERVICE_CONNECTION_ADMIN,SESSION_VARIABLES_ADMIN,SET_USER_ID,SHOW_ROUTINE,SYSTEM_USER,SYSTEM_VARIABLES_ADMIN,TABLE_ENCRYPTION_ADMIN,XA_RECOVER_ADMIN ON *.* TO `dbadmin`@`%`
2 rows in set (0.00 sec)

#查看自身权限
show grants;

# 创建 super 用户,用管理员账户来管理服务器.ALL 表示除GRANT 权限之外的所有权限
# WITH GRANT OPTION 用户的权限可以传递给其它用户.
mysql> GRANT ALL ON *.* TO 'dbadmin'@'%';
mysql> GRANT ALL ON *.* TO 'dbadmin'@'%' WITH GRANT OPTION;


```

### REVOKE 撤销授权

GRANT ... TO, REVOKE... FROM  授权与撤销权限的语法相同.

```mysql
mysql> REVOKE DELETE ON company.* FROM 'company_write'@'%';
mysql> REVOKE SELECT(salary) ON employees.salaries FROM 'employee_ro'%'%'
```

## ?using roles

MySQL 的角色是一个权限的集合, 与用户帐户一样,角色的权限可以被授予或撤销. 用户帐户被授予角色后,  该角色就会将其拥有的权限授予该用户.  这种方式, 可以简化授权管理 [using roles](https://dev.mysql.com/doc/refman/8.0/en/roles.html).

```mysql
 mysql> set global activate_all_roles_on_login=ON;


#创建角色
mysql> CREATE ROLE 'app_read_only', 'app_write' , 'app_developer';

# DROP ROLE 'app_read_only', 'app_write' , 'app_developer';  删除角色

#给角色分配权限
mysql> GRANT SELECT ON employees.* TO 'app_read_only';
mysql> GRANT INSERT, UPDATE, DELETE ON employees.* TO 'app_write' ; 
mysql> GRANT ALL ON employees.* TO 'app_developer';

# REVOKE ALL ON employees.* FROM 'app_developer';  撤销角色权限

#创建用户 , 不指定主机, 默认采用 %(任意主机)
# 为安全起见,根据使用环境,尽量避免使用 %
 mysql> CREATE USER emp_read_only IDENTIFIED BY 'emp_pass'; 
 mysql> CREATE USER emp_write IDENTIFIED BY 'emp_pass';
 mysql> CREATE USER emp_developer IDENTIFIED BY 'emp_pass';
 
 #GRANT 为用户分配角色
 mysql> GRANT 'app_read_only' TO 'emp_read_only'@'%' ;
 mysql> GRANT 'app_write' TO 'emp_write'@'%' ;
 mysql> GRANT 'app_developer' TO 'emp_developer'@'%' ; 
 
 # REVOKE 'app_read_only' FROM 'emp_read_only'@'%' ;    撤销用户的角色
 
 
 
 #查看角色授权
 show grants for 'app_read_only'@'%';
 
 mysql> SHOW GRANTS FOR 'emp_read_only'@'%';  #用户权限 
 
 mysql> SHOW GRANTS FOR 'emp_read_only'@'%' USING 'app_read_only';
 # 用户具体权限, 将用户和角色权限一直显示 
 

```



## 







# MySQL backup & restore



# MySQL  replication





# MySQL configuration

### server_id

server_id 用来唯一标识某个数据库实例, 使其在基础架构中对每个 MySQL server都是唯一的.  并在链式或又主复制结构中用它来避免 SQL 语句的无限循环. 使用时需要生成唯一 server_id

server_id 的作用

1. binlog event 来源
2. IO_thread 对主库 binlog的过滤







# MySQL tools

MySQL workbench : 数据库设计工具

Percona-toolkit 

mysqldump : 逻辑备份工具, 适用于一些数据量不大的数据备份工作

Mysqlpump

mydumper 

myloader

xtrabackup : 擅长物理备份, 全备+增备



# MySQL 数据字典

MySQL 数据字典主要存放在以下几个数据库中:

1. information_schema

2. Performance_schema

3. mysql

4. sys

   ```mysql
   
   show engines;    
   select database();             #当前数据库
   show databases;
   show create database test;     #查看 DB 建库语句
   show tables;
   show tables from test; 
   show create table tabName;
   select user();                 #查看当前用户
   show engine innodb status \G   #查看 innodb存储引擎的状态信息
   show grant for 'xxx'@'xxx'     #查看用户权限信息
   show create user 'xxx'@'xxx'    #查看用户属性信息
   show colunms from columns_priv like '%ab%'      # 查看含有 ab 字样的字段 
   show processlist;               #查看 mysql 线程状态
   show status;                    #MySQL 状态
   show variable like '%xx%';      #含有 xx字样的参数
   show global status;             #全局状态
   select user,host,from mysql.user; 
   select * from information_schema.routines;    #查看存储过程列表
   
   
   ```

   

# MySQL questions

范式, E-R ,设计图



# bin_log

二进制日志包含数据库的所有更改记录,包括数据和结构两方面. 它不记录 SELECT或 show 等不修改数据的操作. 运行带有二进制日志的服务器会带来性能影响. 日志能保证数据库出故障时数据的安全, 只有完整的事件或事务会被记录或回读

利用二进制日志, 可以实现复制, 时间点恢复等功能.



## 启用bin_log

```mysql
[mysqld] 
log_bin = /data/mysql/binlogs/server1
server_id = 100

#log_bin 定义了日志 path 和 base name
#日志位置都在 server1.index 中被维护

systemctl restart msyql

SHOW VARIABLES LIKE 'log_bin%';    # 验证是否创建二进制日志
SHOW MASTER LOGS;
SHOW BINGARY LOGS;               # 显示服务器的所有 binlog

SHOW MASTER STATUS;              #获取当前 binlog位置

```





