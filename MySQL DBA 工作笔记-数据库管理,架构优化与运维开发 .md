[toc]



# MySQL 介绍

## MySQL主要分支

### Percona

Percona server 是一款独立的数据库产品, 其可以与 MySQL 完全兼容. 可以在不更改代码的情况下将存储引擎更换成 XtraDB.

Percona 自身开发 的一系列工具, 如 percona-tookit, xtracbackup, sysbench  与 percona server 兼容性肯定更好.

### MariaDB 

10.0.9 版本起使用XtraDB 来代替 MySQL 的 InnoDB.

### MySQL 官方版本

5.1 Sun

5.5 Oracle

5.6

5.7

8.0.0 (2016-09-02)

8.0.11(2018-04-19)

...

8.0.21







## MySQL 参考推荐

MySQL的官方手册

MySQL排错指南  -- 初学

高性能MySQL

https://www.zhihu.com/question/28385400

数据库索引设计与优化

MySQL内核：InnoDB存储引擎

MySQL技术内幕（第5版)

MySQL技术内幕:InnoDB存储引擎

## 

# MySQL installation










[download MySQL EE]: 

常见三种安装方式: apt 包安装, 二进制包安装, 源码安装



## 规范安装

将软件与数据分离开,减少彼此之间的耦合,同时把数据目录, 日志目录分开存放, 以提高性能.

软件安装目录: /usr/local/mysql

数据目录  /data/mysql_port/  , 其下  data , log,  tmp 等子目录







## Engines

engine 的选择:  一 是否支持 transaction, 二 适用具体场景

