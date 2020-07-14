## LFS 9.0 systemd 实例



### preparation

1. host : deepin V20 

2. VMware 11

3. wget --input-file=wget-list --continue --directory-prefix=$LFS/sources （绿字部分建议修改成中科大的wget-list的镜像名字）

   Apt-get install textinfo.x86_64



3、这一点非常重要，在6.17、6.59、6.63、6.69时都出现了一个符号链接不对的问题，注意仔细检查
我们都知道Linux 中的 ../ 代表上层目录，这里如果按照手册上面操作的话，所在目录应该是对应需要安装包的文件目录下面
所以
 6.17中的  为/lib建立符号链接时: ln -sv ../usr/bin/cpp /lib  改为: ln -sv ../../usr/bin/cpp /lib
                
        增加兼容符号链接启用编译程序时进行链接时间优化时：
    
            ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/4.9.2/liblto_plugin.so /usr/lib/bfd-plugins/ 改为:
    
               ln -sfv ../../usr/libexec/gcc/$(gcc -dumpmachine)/4.9.2/liblto_plugin.so /usr/lib/bfd-plugins/
6.59中的 创建符号链接
        ln -sv ../bin/kmod /sbin/$target   应该改为 ln -sv /bin/kmod /sbin/$target
6.63中的 安装systemd的时候
        ln -sfv ../bin/systemctl sbin/${tool}  改为 ln -sfv /bin/systemctl sbin/${tool}

        ln -sfv ../lib/systemd/systemd /sbin/init 改为 ln -sfv /lib/systemd/systemd /sbin/init （重要，本人就因为一次写错了导致需要重新开始）
6.69节安装vim
     ln -sv ../vim/vim74/doc /usr/share/doc/vim-7.4  应改为  ln -sv /usr/share/vim/vim74/doc /usr/share/doc/vim-7.4
以上的解决方法都是由
https://blog.csdn.net/rudy_axle/article/details/48008403 提供，万分感谢
4、因为打算给/boot单独分区，因此在编译内核前，在chroot环境中记得需要挂载sdb1分区到 /boot
mount -t ext2 /dev/sdb1 /boot
5、在配置grub引导的时候，其实可以修改宿主机的系统grub进行双系统选择启动，方便在宿主系统存在的情况下进行选择进入我们的lfs系统
首先安装完了grub之后利用自动配置引导 grub-mkconfig -o /boot/grub/grub.cfg
然后在新的终端中打开刚刚生成的grub.cfg
找到LFS的menuentry复制到宿主系统的grub.cfg



