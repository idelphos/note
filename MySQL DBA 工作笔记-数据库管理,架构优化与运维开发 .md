# MySQL 介绍

## MySQL主要分支

### Percona

Percona server 是一款独立的数据库产品, 其可以与 MySQL 完全兼容. 可以在不更改代码的情况下将存储引擎更换成 XtraDB.

### MariaDB 

10.0.9 版本起使用XtraDB 来代替 MySQL 的 InnoDB.

### MySQL 版本历史

5.1 Sun

5.5 Oracle

5.6

5.7

8.0.0 (2016-09-02)

8.0.11(2018-04-19)

8.0.21



MySQL 8.0.21

[V999318-01.zip](https://edelivery.oracle.com/osdc/softwareDownload?fileName=V999318-01.zip&token=SEJncDNQVkxnWEVsa3FIdjIvY0VNZyE6OiFmaWxlSWQ9MTA5MTU2OTgxJmZpbGVTZXRDaWQ9MTAwNzAzMiZyZWxlYXNlQ2lkcz0xMDA1Nzk2JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NjgxODk3NCZlbWFpbEFkZHJlc3M9eWp5dWFuQGNuLmlibS5jb20mdXNlck5hbWU9RVBELVlKWVVBTkBDTi5JQk0uQ09NJmxpY2Vuc2VDaWRzPTc3MzA3NCZjb3VudHJ5Q29kZT1DTiZkbHBDaWRzPTg4NTQyMSZzZWFyY2hTdHJpbmc9)![img](https://edelivery.oracle.com/osdc/adf/images/t.gif)MySQL Commercial Server 8.0.21 DEB for Debian 10 Linux x86 (64bit), 1017.3 MB

[V999381-01.zip](https://edelivery.oracle.com/osdc/softwareDownload?fileName=V999381-01.zip&token=Z3JhSlYxSUhDRkJYeG1IT0tRR0pBUSE6OiFmaWxlSWQ9MTA5MTU3MzAzJmZpbGVTZXRDaWQ9MTAwNzEwNyZyZWxlYXNlQ2lkcz0xMDA1Nzk4JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NjgxODk3NCZlbWFpbEFkZHJlc3M9eWp5dWFuQGNuLmlibS5jb20mdXNlck5hbWU9RVBELVlKWVVBTkBDTi5JQk0uQ09NJmxpY2Vuc2VDaWRzPTc3MzA3NCZjb3VudHJ5Q29kZT1DTiZkbHBDaWRzPTg4NTQyMSZzZWFyY2hTdHJpbmc9)![img](https://edelivery.oracle.com/osdc/adf/images/t.gif)MySQL Router 8.0.21 dbgsym DEB for Debian 10 Linux x86 (64bit), 33.9 MB

[V999562-01.zip](https://edelivery.oracle.com/osdc/softwareDownload?fileName=V999562-01.zip&token=b1NwTUNobkVzTmJ5Q0lwaDl1U2hTQSE6OiFmaWxlSWQ9MTA5MTc5MzQ0JmZpbGVTZXRDaWQ9MTAwNzYyNSZyZWxlYXNlQ2lkcz0xMDA1NzE0JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NjgxODk3NCZlbWFpbEFkZHJlc3M9eWp5dWFuQGNuLmlibS5jb20mdXNlck5hbWU9RVBELVlKWVVBTkBDTi5JQk0uQ09NJmxpY2Vuc2VDaWRzPTc3MzA3NCZjb3VudHJ5Q29kZT1DTiZkbHBDaWRzPTg4NTQyMSZzZWFyY2hTdHJpbmc9)![img](https://edelivery.oracle.com/osdc/adf/images/t.gif)MySQL Enterprise Monitor Agent 8.0.21 for Linux x86 (64-bit), 262.5 MB

[V999531-01.zip](https://edelivery.oracle.com/osdc/softwareDownload?fileName=V999531-01.zip&token=SWRFNUFqL1ZBVVN3aFNaQ016UVFRUSE6OiFmaWxlSWQ9MTA5MTYwNzU5JmZpbGVTZXRDaWQ9MTAwNzE5NSZyZWxlYXNlQ2lkcz0xMDA1NzEzJnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NjgxODk3NCZlbWFpbEFkZHJlc3M9eWp5dWFuQGNuLmlibS5jb20mdXNlck5hbWU9RVBELVlKWVVBTkBDTi5JQk0uQ09NJmxpY2Vuc2VDaWRzPTc3MzA3NCZjb3VudHJ5Q29kZT1DTiZkbHBDaWRzPTg4NTQyMSZzZWFyY2hTdHJpbmc9)![img](https://edelivery.oracle.com/osdc/adf/images/t.gif)MySQL Shell 8.0.21 dbgsym DEB for Debian 10 Linux x86 (64bit), 349.1 MB

[V999420-01.zip](https://edelivery.oracle.com/osdc/softwareDownload?fileName=V999420-01.zip&token=Ri95SUdMbWY1MWNwQm5sQTJqZE1SQSE6OiFmaWxlSWQ9MTA5MTU3NDM0JmZpbGVTZXRDaWQ9MTAwNzE0NiZyZWxlYXNlQ2lkcz0xMDA1ODAwJnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NjgxODk3NCZlbWFpbEFkZHJlc3M9eWp5dWFuQGNuLmlibS5jb20mdXNlck5hbWU9RVBELVlKWVVBTkBDTi5JQk0uQ09NJmxpY2Vuc2VDaWRzPTc3MzA3NCZjb3VudHJ5Q29kZT1DTiZkbHBDaWRzPTg4NTQyMSZzZWFyY2hTdHJpbmc9)![img](https://edelivery.oracle.com/osdc/adf/images/t.gif)MySQL Connector/Python 8.0.21 DEB for Debian 10 Linux x86 (64bit) Python 3.x, 21.0 MB

[V999549-01.zip](https://edelivery.oracle.com/osdc/softwareDownload?fileName=V999549-01.zip&token=cXFEVzBYZXBjeWFBV1F5MUt4aHltdyE6OiFmaWxlSWQ9MTA5MTYwNzEzJmZpbGVTZXRDaWQ9MTAwNzI3MyZyZWxlYXNlQ2lkcz0xMDA1NzA3JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NjgxODk3NCZlbWFpbEFkZHJlc3M9eWp5dWFuQGNuLmlibS5jb20mdXNlck5hbWU9RVBELVlKWVVBTkBDTi5JQk0uQ09NJmxpY2Vuc2VDaWRzPTc3MzA3NCZjb3VudHJ5Q29kZT1DTiZkbHBDaWRzPTg4NTQyMSZzZWFyY2hTdHJpbmc9)![img](https://edelivery.oracle.com/osdc/adf/images/t.gif)MySQL Workbench 8.0.21 DEB for Ubuntu 20.04 Linux x86 (64bit), 52.4 MB

[V999411-01.zip](https://edelivery.oracle.com/osdc/softwareDownload?fileName=V999411-01.zip&token=NUJEYi9rQ1h1ZmdQc2NDLzIyZ0NMdyE6OiFmaWxlSWQ9MTA5MTU3MzkzJmZpbGVTZXRDaWQ9MTAwNzEzOCZyZWxlYXNlQ2lkcz0xMDA1Nzk3JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NjgxODk3NCZlbWFpbEFkZHJlc3M9eWp5dWFuQGNuLmlibS5jb20mdXNlck5hbWU9RVBELVlKWVVBTkBDTi5JQk0uQ09NJmxpY2Vuc2VDaWRzPTc3MzA3NCZjb3VudHJ5Q29kZT1DTiZkbHBDaWRzPTg4NTQyMSZzZWFyY2hTdHJpbmc9)![img](https://edelivery.oracle.com/osdc/adf/images/t.gif)MySQL Enterprise Backup 8.0.21 DEB for Debian 10 Linux x86 (64bit), 38.7 MB

[V999555-01.zip](https://edelivery.oracle.com/osdc/softwareDownload?fileName=V999555-01.zip&token=WG9GQTUwMHFVdkNHUGxSclFzSjYxQSE6OiFmaWxlSWQ9MTA5MTc5NDc4JmZpbGVTZXRDaWQ9MTAwNzYxOCZyZWxlYXNlQ2lkcz0xMDA1NzE0JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjAmYWdyZWVtZW50SWQ9NjgxODk3NCZlbWFpbEFkZHJlc3M9eWp5dWFuQGNuLmlibS5jb20mdXNlck5hbWU9RVBELVlKWVVBTkBDTi5JQk0uQ09NJmxpY2Vuc2VDaWRzPTc3MzA3NCZjb3VudHJ5Q29kZT1DTiZkbHBDaWRzPTg4NTQyMSZzZWFyY2hTdHJpbmc9)![img](https://edelivery.oracle.com/osdc/adf/images/t.gif)MySQL Enterprise Monitor Service Manager 8.0.21 for Linux x86 (64-bit), 1.2 GB



## MySQL 参考推荐

MySQL的官方手册

MySQL排错指南  -- 初学

高性能MySQL

https://www.zhihu.com/question/28385400

数据库索引设计与优化

MySQL内核：InnoDB存储引擎

MySQL技术内幕（第5版)

## MySQL技术内幕:InnoDB存储引擎

