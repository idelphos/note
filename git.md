[toc]

# git介绍

git是一个分布式版本控制系统. 版本控制的文件是提交到一个仓库(一个隐藏文件夹)里面后进行后续操作的.我们对文件做出的修改都会被这个版本控制系统侦测到，如果我们要保留这个版本的文件，就要通过版本控制系统提供的命令把文件提交到仓库里面，然后版本控制系统就会自动为我们提交的文件打上版本号. 

Git 是一个快速、可扩展的分布式版本控制系统，它具有极为丰富的命令集，对内部系统提供了高级操作和完全访问

所谓版本控制系统 (Version Control System)，从狭义上来说，它是软件项目开发过程中用于储存我们所写的代码所有修订版本的软件，但事实上我们可以将任何对项目有帮助的文档交付版本控制系统进行管理

它只用来跟踪文本文档的更新

git的应用：git 可以用来管理个人文档，与文档备份,日常的学习

git的内容存储使用的是 SHA-1哈希算法, 来确保代码内容的完整性.

仓库分本地仓库和远程仓库

1. 本地仓库即本地的文件夹
2. 远程仓库:建立在互联网的服务器内的文件夹

## git 一般工作流程

1. 克隆 git 资源作为工作目录

2. 在克隆的资源上添加或修改文件

3. 如果他人修改了,可以更新资源

4. 在提交前查看修改

5. 提交修改

6. 修改完成,若发现错误, 可以撤回提交并再次修改并提交

   



# git installation

## [install Git on linux](http://git.oschina.net/progit/1-起步.html#1.4-安装-Git)

yum install git      #RHE

apt install libcurl4-gnutls-dev libexpat1-dev gettext  libz-dev libssl-dev   

apt install git                               #debian



## install from source code

refer to [README.md](https://github.com/git/git/blob/master/README.md)

依赖包

curl-devel expat-devel gettext-devel openssl-devel zlib-devel asciidoc xmlto docbook2x autoconf

 asciidoc docbook2x  info install-info build-essential libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev



> ```shell
> wget git-2.27.0.tar.gz
> tar -xf git-2.27.0.tar.gz
> 
> ## global install
> $ make prefix=/usr all doc info ;                  # as yourself
> # make prefix=/usr install install-doc install-html install-info ;# as root
> # git --version                         # verify the installation .
> 
> ```



## 配置git

git提供了一个叫 git config 的工具, 用来配置或读取相应的工作环境变量.

git 环境变量存在三个不同的地方,配置根据就近原则覆盖上层的相同配置

 /etc/gitconfig 系统级配置文件git config --system

~/.gitconfig 用户级配置文件，适用于该用户下所有仓库配置　git config --global

.git/config 仅针对当前仓库配置有效

```shell
##配置提交代码时的签名
git config --global user.name "Ade"
git config --global user.email "adelphos@msn.cn"
git config  user.name              # 查看指定配置
git config --list                  # 查看所有配置
git config                         # git config 命令选项用法

```



## 配置 github远程仓库

```shell
##配置github 远程仓库
ssh-keygen -t rsa -C 'adelphos@msn.cn'   
cat ~/.ssh/id_rsa.pub

# upload the key id_rsa.pub to Github profile > SSH and GPG keys 
ssh -T git@github.com   #测试 key 是否添加成功

$ pwd 
/home/ade/MyProject           #新建项目目录
$ git init                    #所在目录就是执行一切文件操作的地方, 将目录变成仓库
$ git remote add origin git@github.com:iadelphos/note.git  # 将 origin 和远程仓库联系起来
git push -u origin master    # -u 首次推送 master 分支的所有内容
git push origin master      #  推送master的最新修改

# git 远程仓库变更
$ git remote
fish
$ git remote rm fish
$ git remote add mynote git@github.com:idelphos/note.git    

```



# git 快速入门

```shell
# 新建一个项目, 要么是 git init, 要么是git clone 的方式

git init                 #$PWD 即为 working directory
git init <directory>     #指定目录初始化为仓库

#clone 一个Github 上的Repository , 远程仓库 clone 到本地
git clone <repo>
git clone <repo> <directory>    #clone 仓库至本地指定目录
git clone <repo> <new project name>
git clone https://github.com/zhchnchn/ZhchnchnTest.git




# commands
git add                  #将修改包含在即将提交的快照时在里时，执行
git commit -m "comments"




#命令帮助
git 
git help <verb>
git <verb> --help
man git-<verb>

```

## 提交文件

### git status

用来查看项目当前状态, 主要查看上次提交后是否有修改

git status 显示 上次提交后的更改或写入缓存的改动,而 git diff 显示具体改动内容

```shell
#修改一个文件,然后提交
vim README.md
git status              #掌握仓库当前状态
git diff README.md      #查看修改的内容
git add README.md       # 可以多次运行add, 也可以一次add 多个文件
git status
git commit -m "Edit by WorkUbuntu 1204"   #把文件提交到仓库, 并提交说明
git status

git log　                  #命令显示从最近到最远的提交日志
git log --pretty=oneline   #更简洁的提交日志


git status -s

' ' = unmodified
M = modified
A = added
D = deleted
R = renamed
C = copied
U = updated but unmerged

```

### git diff

显示已提交至stage 与已修改但尚未提交的改动区别

git diff

git diff --cached

git diff HEAD

git diff --stat   : 仅显示比较的摘要信息



## 版本回退



```shell

git commit -a 
git push


git log --pretty=oneline 
59f5d8fad77580952e1d795324f4414443331ca0 (HEAD) append GPL, the third.
61a9fc539dd888a34b4cd829c6f1b67709287006 append free line
e2a1a05f9e6face6ddd54e0b7a5ccdf05af5197e  modified first
3df495536cd6edf64c7a6c80112fa4ac11931e5e test
5e5203895651b569ebaa805ccf15990bef636a02 Initial commit

#HEAD 表示当前版, HEAD 表示上一个版本, HEAD^^ 表示上上版本   HEAD~100 表示上第100个版本
#HEAD 指针指向的版本,即为当前版本

git reset --hardd HEAD^   #回退到上一个版本

git reset --hard 59f5d
HEAD 现在位于 59f5d8f append GPL, the third.


$ git reflog                      #查看命令历史 ,可确定回到未来的哪个版本
59f5d8f (HEAD) HEAD@{0}: reset: moving to 59f5d
61a9fc5 HEAD@{1}: reset: moving to HEAD^
59f5d8f (HEAD) HEAD@{2}: commit: append GPL, the third.
61a9fc5 HEAD@{3}: commit: append free line
e2a1a05 HEAD@{4}: commit: modified first
3df4955 HEAD@{5}: commit: test
5e52038 HEAD@{6}: pull --rebase mynote master: checkout 5e5203895651b569ebaa805ccf15990bef636a02
8369306 (master) HEAD@{7}: commit: add licence file.
4750d39 HEAD@{8}: commit (initial): ade READ.md file.



```

## 撤销修改

```shell
git checkout -- file     # 丢弃工作区的修改 
# 让文件回到最近一次 git commit ,或 git add 时的状态

#一种是readme.txt自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；
#一种是readme.txt已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。

```

## 删除文件

```shell

rm test.txt
ade@ade-PC:~/MyProject$ git status
当前不在任何分支上。
尚未暂存以备提交的变更：
  （使用 "git add/rm <文件>..." 更新要提交的内容）
  （使用 "git checkout -- <文件>..." 丢弃工作区的改动）

	删除：     test.txt
	
## 本地删除文件后,有两种选择
# 1. git checkout -- test.txt       #恢复文件
# 2. git rm test.txt ; git commit -m "remove test.txt"   #  文件从版本库中也删除

```





```shell
git push -u origin master  #第一次 -u 选项
git push origin master     # 之后,用这个命令把本地 master 分支的最新修改推送到GitHub
# 将当前分支 master 推送到远程仓库

git clone git@github.com:michaelliao/gitskills.git # 将远程库克隆到本地

```



# git 常用命令速查

## git commands 图示

![git-commands](https://github.com/idelphos/note/blob/master/git-commands.png)

## 创建新版本

```shell
git clone <url>
git init
```

## 提交与修改

```shell
git status              #查看状态,是否有变更
git diff                #查看具体变更内容
git add .               #跟踪所有改动过的文件
git add <file>          
git mv <old> <new>
git rm <file>
git rm --cached <file>  #停止跟踪文件但不删除
git commit -m "commit comments"   #提交所有更新过的文件
git commit --amend 
```

## 查看提交历史

```shell
git log
git log -p <file>    #指定文件的提交历史
git blame <file>     #列表方式查看指定文件的提交历史
```

## 撤销

```shell
git reset --hard HEAD              #撤销工作目录中所有未提交文件的修改内容
git checkout HEAD <file>           #撤销指定的未提交文件的修改内容
git revert <commit>                #撤销指定提交
```

## 分支与标签

```shell
git branch                      #显示所有本地分支
git branch <new-branch>
git branch -d <branch>          #删除 branch
git checkout <branch/tag>       #切换到指定分支或标签
git switch <branch>
git switch -c <new-branch>
git tag                        #列出
git tag <tagname>              #基于最新的提交创建标签
git tag -d <tagname>           #删除

```

## 合并

```shell
git merge <branch> 
git rebase <branch>
```

## 远程操作

```shell
git remote
git remote -v                  #查看远程版本库信息
git remote show <remote>       #查看远程版本库信息
git remote add <remote> <url>  #添加远程版本库

git fetch <remote>             #从远程库获取代码
git pull <remote> <branch>     #下载代码并快速合并
git push <remote> <branch>     #上传代码及快速合并
git push <remote> :<branch/tag-name>
git push --tags                        #上传所有标签
```





​            












### refer to

[pro git 中文版](http://git.oschina.net/progit/index.html)

[Git入门学习](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

 [pro Git book](https://git-scm.com/book/zh/v2)
