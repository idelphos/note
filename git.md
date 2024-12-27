#git
执行git init的那个目录是working directory,而.git是版本库repository


###[install Git on RHEL](http://git.oschina.net/progit/1-%E8%B5%B7%E6%AD%A5.html#1.4-%E5%AE%89%E8%A3%85-Git)
1. `yum install git`
2.  install from source code

>
- yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel asciidoc xmlto     
- refer to [README.md](https://github.com/git/git/blob/master/README.md)  
- [download git source code](https://github.com/git/git/releases/) 
- tar -zxvf git-2.8.2.tar.gz  
cd git.2.8.2  
$make configure  
$./configure --prefix=/usr　--with-curl --with-expat　配置安装程序目录  
$make all doc  
\#make install install-doc install-html;   # as root  
git --version   verfiy the installation
>  

###配置Ｇit
- /etc/gitconfig           系统级配置文件git config --system
- ~/.gitconfig             用户级配置文件，适用于该用户下所有仓库配置　git config --global
- .git/config              仅针对当前仓库配置有效  
配置根据就近原则覆盖上层的相同配置

```
git config --global user.name "Ade"
git config --global user.email "adelphos@msn.cn"
git config --list                 ＃查看配置
```

###配置[github](https://github.com)
```
#setting 里添加本地ssh public key
ssh -T git@github.com    #进行测试
git remote -v       #查看使用的传输协议，不要使用https

#设置成ssh方式
git remote rm origin
git remote add origin git@github.com:username/repository.git
git push -u origin master
```

```
1）git clone已存在GitHub上的Repository。（在新建的~/MyTestFolder目录中）

git clone https://github.com/zhchnchn/ZhchnchnTest.git

（2）修改一个文件，然后提交

vim README.md
git status
git add README.md
git status
git commit -m "Edit by WorkUbuntu 1204"
git status
git remote add origin https://github.com/zhchnchn/ZhchnchnTest.git

这时会报错误：

fatal: remote origin already exists.

解决办法【3】：

$ git remote rm origin

然后再次执行 git remote add origin https://github.com/zhchnchn/ZhchnchnTest.git

（3）之后，需要将修改push到GitHub上

git push -u origin master

执行该条命令后，会要求输入GitHub账户的用户名和密码。

（4）提交完成后，查看GitHub上的Repository，会发现内容修改成功。

```


###known git issue
fatal: Unable to find remote helper for 'https'
无权限执行git-remote-https

PATH=$PATH:/usr/libexec/git-core./configure --prefix=/usr --with-curl --with-expat

yum install libcurl-devel 
重新编译安装

----

###Git快速入门
```
git help <verb>
git <verb> --help
man git-<verb>
```

[Git入门学习](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)



