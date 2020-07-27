[toc]

# git介绍

**VCS**: Version Control System, 版本控制系统存储代码(包括项目所有文档) 的所有修订版本的软件

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

## git 专用名词

workspace : 工作区, work directory

Index/stage: 暂存区

repository : 仓库(或者本地仓库)

remote : 远程仓库





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
git config -e [--global]           # 编辑配置文件
```

## .gitignore

work directory中有些不想加入版本库管理的文件,可以把要忽略的文件名写入这个文件,git则会自动忽略这些文件. .gitignore 本身要放到版本库中.  

忽略的文件名可以使用*通配文件名. 

被忽略的文件, 若要加入版本库管理: git add -f 

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
git push origin master      #  推送master的最新修改,将当前分支 master 推送到远程仓库

# git 远程仓库变更
$ git remote
fish
$ git remote rm fish
$ git remote add mynote git@github.com:idelphos/note.git    

```



# git 快速入门

```shell
# 新建一个项目, 要么是 git init, 要么是git clone 的方式

git init                  #初始化本地文件夹,指定目录下会创建仓库.git ,$PWD 即为 working directory
git init <directory>      #指定目录或新建目录 初始化为仓库
git status                #查询文件状态,仓库状态
git add .                 #提交更改，先提交代码至缓存区,
git commit -m "comment"   #实际提交代码
git remote add bin git@github:idelphos/bin.git    　＃添加远程仓库，并指定名称bin,关联本地与远程仓库



#clone 一个Github 上的Repository , 远程仓库 clone 到本地
git clone [url]
git clone <repo>
git clone <repo> <directory>    #clone 仓库至本地指定目录
git clone <repo> <new project name>
git clone https://github.com/zhchnchn/ZhchnchnTest.git
git clone git@github.com:michaelliao/gitskills.git      # 将远程库克隆到本地



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

### git commit

```shell
git commit -am "commit commnets"      #-a 不经过 stage,直接提交所有更改到 repo
```

### git reset HEAD

用于取消已缓存的内容(stage),即取消之前git add 的内容,不希望包含在下一次提交快照的缓存 

```shell
git diff HEAD -- readme.txt   #命令可以查看工作区和版本库里面最新版本的区别

#版本回退与前滚 HEAD指向版本的当前版本 git reset --hard commit_id git log 　可以查看提交历史（的commit_id） git reflog 可以查看历史命令，以确定要回到未来的哪个版本
```



### git rm

删除库中的文件, 不能只在 work directory中手工删除. 需要 git rm <file> ,然后 commit.

```shell
git rm <file>     #从已跟踪的文件清单中移除
git rm -f <file>  #删除之前,该文件已修改并已经存放到 stage, 需要使用-f 强制删除

git rm --cache <file>  #把文件从 stage 区移除, 但仍保留在 work directory, commit后,此文件是 untrack 状态

git rm -r *        #-r 可以递归删除

```

### git mv

用于移动或重命名

###  git log

查看提交历史

```shell
git log --oneline
git log --graph            #历史中的分支合并情况
--reverse                  #逆向显示所有日志
git log --author=Linus --oneline -5     # 显示指定作者的提交
 git log --oneline --before={3.weeks.ago} --after={2010-04-18} --no-merges
```









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

 

# branch

```shell
git branch                  # list branch
git branch <branchName >    # creat branch

#切换分支后,该分支最后提交的快照会替换当前工作目录的内容,所以多分支不需要多个目录
git checkout <branchName>   
git switch <branchName>      # switch to branch 
git merge <branchName>        #将分支合并到当前分支
git branch -d <branchName>    #合并完后,一般会删除分支


```

## 合并冲突

合并包括文件添加, 移除, 修改

```shell
git merge change_site
Auto-merging README
CONFLICT (content): Merge conflict in README
Automatic merge failed; fix conflicts and then commit the result.

# 修改冲突文件后,
git add  <file>
git commit        # 合并分支完成

```

## tags

```shell
git tag -a v1.0                 #给最后提交的快照打一个带注解的标签
git tag -a v0.9 5c70762         #使用 commit id,给历史提交打标签
git tag                         #显示所有标签
git tag -a tagname -m "runoob.com标签"   #指定标签信息

git log --decorate              #历史记录中,查看标签
```







```shell

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
git add <file>          #可多次 add后,再 commit
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
git clone
git fetch
git pull
git push


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

### git clone

clone 支持多种协议  http(s), ssh, git , rsync , ftp ,本地文件协议

```shell
git clone <repo url>             #目录名与远程库同名
git clone <repo url> <local dir> #也可以指定目录名
git clone -o JQuery <url>        #使用 JQuery 替换默认远程主机名 origin

#
```

### git remote

```shell
git remote        #列出所有远程库
git remote -v     #可以查看远程库的网址
git remote show 
git remote add <repo name> <url>
git remote rm <repo>
git remote rename <old repo> <new repo>
git remote add origin [git@github.com](mailto:git@github.com):idelphos/onenote.git 本地仓库下运行此命令，是将本地仓库连接到远程仓库，与之相关联
```

### git fetch

取回的更新,在本地主机上用"remote repo/ branch" 的形式读取

```shell
git fetch <remote repo>               #将远程仓库的更新,全部取回本地
git fetch <remote repo> < branch >   #默认取回所有branch的更新

git branch -r                         # 查看远程分支
git branch -a                         # 查看所有分支(本地和远程)
* master
  remotes/origin/master
  
git checkout -b newBranch origin/master  #在取回的远程仓库的更新基础上,创建新分支
git merge origin/master
git rebase origin/master                 #在本地分支上合并远程分支
```



### git pull

 git pull取回远程仓库某个分支的更新,再与本地的分支合并

```shell
git pull <remote repo> <remote branchName>:<local branchName>
git pull origin next:master        #origin 中的 next分支与本地 master 分支合并
git pull origin next               # 远程分支与当前分支合并

相当于:
git fetch origin
git merge origin/next

git 允许手动建立追踪关系
git branch --set-upstream master origin/next
git pull origin        #当前分支与远程仓库中的分支已经存在追踪关系
git pull               # 当前分支只有一个追踪关系


```





### git push 

git push 用于将本地分支的更新推送到远程主机, 命令格式与 git pull 相仿

```shell
git push <remote repo> <local branch>:<remote branch>
git push origin master      # 存在追踪有关系时,省略<remote branch>

git push origin :master     #删除远程分支master, 相当于推送空的本地分支
git push origin --delete master 

git push origin                  #当前分支与远程分支存在追踪关系
git push                        #当前分支只有一个分支
git push -u origin master       # -u 指定默认<remote repo>,之后的命令可以省略 origin

git push --force origin         #远程版本比本地版本更新,推送失败, 需要先git pull合并,然后再 push. 但也可采用--force的办法强制推送,覆盖远程版本
git push origin --tags          #git push 不推送 tags,需要使用--tags 来推送

```





# git 服务器搭建



```shell
apt install git
sudo groupadd git
sudo useradd git -g git -m
sudo passwd git

#创建证书登录,导入用户公钥
git@ade-PC:~$ mkdir .ssh ; chmod 755 .ssh
git@ade-PC:~$ touch .ssh/authorized_keys
git@ade-PC:~$ chmod 644 .ssh/authorized_keys 

#初始化git仓库
mkdir /home/gitrepo
root@ade-PC:~# chown git:git /home/gitrepo
root@ade-PC:~# cd /home/gitrepo/

git@ade-PC:~$ cd /home/gitrepo/
git@ade-PC:/home/gitrepo$ git init --bare runoob.git
已初始化空的 Git 仓库于 /home/gitrepo/runoob.git/
git@ade-PC:/home/gitrepo$ chown -R git:git runoob.git

# ifconfig 查询本机ip 192.168.31.51

# 上传公钥
# 克隆仓库
git clone git@192.168.31.51:/home/gitrepo/runoob.git 
Cloning into 'runoob'...
warning: You appear to have cloned an empty repository.
```






## refer to

[pro git 中文版](http://git.oschina.net/progit/index.html)

[Git入门学习](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

 [pro Git book](https://git-scm.com/book/zh/v2)
