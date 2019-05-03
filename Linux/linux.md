Linux: 主要以操作

day01
	1. linux介绍（了解）
		1. 操作系统
		2. linux的特点
			1. 开源免费
			2. 性能稳定
			3. 计算能力强
		3. linux的用途
			1. 服务器操作系统（tomcat  mysql  redis）
			2. Android
	2. 虚拟机的概念和安装
		1. 虚拟机的概念
			1. 就是模拟出来的电脑
		2. VmWare 虚拟机软件（创建虚拟机）
		3. linux 安装
			1. 安装文档去一步一步  29个步骤（了解）
			2. 直接挂载（掌握）
			3. 找到电脑进入BIOS方式   打开虚拟服务
	3. linux的安装
	4. linux常见的命令 (重点)
		1. 查看文件夹里面文件的命令
			ls   查看文件夹下面的非隐藏文件
			ls -a 查看文件夹下面的所有文件（包含隐藏文件）
			ls -l  查看文件夹下面的非隐藏文件,并且展示详细信息  **可以简写成 ll**


		2. cd进行目录切换
			cd 目录名称
			cd  .. 返回上一级目录
			cd  /root/Document
			cd  ~   切换到用户目录  root用户的目录就是  /root
			cd  -   切换到上一次操作的目录

		3. 创建目录与删除目录
			mkdir  aaa   创建目录
			mkdir -p aaa/bbb 创建多级目录
			rmdir  aaa   删除目录（不能删除多级目录）   
			大部分命令后面都可以跟一个 --help的参数  这个参数就是用来去查看命令的使用方法的
			mkdir  --help
			ls   --help

		4. 文件查看命令：
			cat  install.log    一次性查看文件的所有内容  只适合小的文件
			more  install.log   一页一页的查看文件内容   按enter键可以向下多显示一行   按空格展示下一页  按q 或ctrl+c退出
			less install.log    一页一页的查看文件内容  按上下键可以上下翻页 按q或ctrl+c退出
			
			tail  -10 install.log 查看文件的后十行
			tail -f install.log 动态查看文件（动态监视服务器日志）

		5. 文件删除 复杂 剪切
			rm  删除文件
			rm  文件名称  删除文件  删除的时候会询问
			rm -f  install.log    删除文件不询问
			rm -r  目录            删除文件夹（可以包含多级文件夹）
			rm -rf  目录           不询问删除文件夹
			rm  -rf  /*            删除根目录下面所有的内容
            
			cp   install.log   aaa/a.txt  复制
			mv   a.txt   aaa    剪切
			
        6. 文件压缩和解压  tar(重要)
			-c：创建一个新tar文件
			-v：显示运行过程的信息
			-f：指定文件名
			-z：调用gzip压缩命令进行压缩
			-t：查看压缩文件的内容
			-x：解开tar文件


				tar -cvf aaa.tar   /*     只打包，不压缩
				tar -zcvf  aaa.tar.gz  /*  打包并且压缩
		
				**
				tar -xvf aaa.tar      解开没有压缩的文件
				tar -zxvf xxx.tar.gz -C /usr/aaa   解开已经压缩的压缩包
				**
		
		7. 文件查找与内容查找命令
         find   在指定目录下面去查找指定文件
				find / -name a.txt
				find / -name a.*
		 grep   在文件内容中查找指定字符串
			grep   gnome  install.log  --color(高亮展示查找字符串) -A5(After) -B5(before) 


		通用命令
			pwd 显示当前所在目录
			touch  创建空文件
			clear（ctrl+l）  清屏
		
		8.vi 和 vim编辑器
		vim有三种模式
			命令行：一般就是用来进行快捷键的执行  不能修改文件内容
				命令行  ----》 插入  i o  a
			插入：可以对内容进行增删改
				插入  --->  	 命令行   ESC
			底行模式： 冒号
				命令行   ---  底行模式   按 ：       wq 保存并退出   q!  不保存退出

		9.重定向  
			>   >>
			>   覆盖之前内容
			>>  在原来的文档中追加内容
			ll  >   a.txt
			ll >> a.txt
		10.常见系统命令
			ps -ef    查看系统正在运行的进程
			ps -ef | grep  java   	查找进程
			kill  -9  4028（PID） 杀死进程

		11.管道  |
			ps -ef | grep  java 
            把前面命令的输出作为后面命令的输入
			进程间通讯的技术

		linux权限系统：
			linux特点：多用户，多任务的操作系统





			chmod    644  a.java


service iptables status 查看防火墙状态
service iptables stop 关闭防火墙
service iptables start 启动防火墙
chkconfig  iptables off 禁止防火墙自启




day02
	内容
	1. jdk
	2. mysql
	3. tomcat
	4. redis
	5. nginx安装
	
	6. （了解  理解）反向代理  nginx配置反向代理 负载均衡

	1.  linux软件安装
		1. linux安装软件的方式
			1. 二进制发布包（平台不兼容  直接解压  tomcat）(直接解压)
			2. RPM（标准方式）
				1.安装软件的时候不会去安装软件所依赖的一些软件 
			3. Yum在线安装
				1.必须要联网（会安装软件所依赖的一些包）
			4. 源码编译安装 （redis nginx）
				1. 安装编译环境



		2. 上传与下载工具介绍
			
		3. 软件安装 
			1. jdk
				1. 卸载已有的open-jdk
					1. 查找已经安装的jdk
						1.  rpm -qa | grep java
					2. 卸载
						rpm -e --nodeps java-1.6.0-openjdk-1.6.0.35-1.13.7.1.el6_6.i686
						rpm -e --nodeps java-1.7.0-openjdk-1.7.0.79-2.5.5.4.el6.i686
 				2. 安装jdk
	 				1. linux上的软件我们一般安装在 /usr/local/ 
		 				1.  mkdir  /usr/local/jdk
	 				2. tar –zxvf  jdk.tar.gz  -C  /usr/local/jdk
	 			3. 配置环境变量
		 			1. vim  /etc/profile
		 			2. 在文件末尾添加环境变量信息
			 			  #set java environment
							JAVA_HOME=/usr/local/jdk/jdk1.7.0_71
							CLASSPATH=.:$JAVA_HOME/lib.tools.jar
							PATH=$JAVA_HOME/bin:$PATH
							export JAVA_HOME CLASSPATH PATH
					3. source /etc/profile 
			2. mysql
				1. 卸载已有的mysql
					1. 查找已经安装的jdk
						1.  rpm -qa | grep mysql
					2. 卸载
						1. rpm -e --nodeps  mysql软件名称
				2. 上传mysql到linux 并解压
					1. mkdir /usr/local/mysql
					2. tar -xvf MySQL-5.6.22-1.el6.i686.rpm-bundle.tar -C /usr/local/mysql
				3. 安装mysql
					1. 服务器安装
						1. cd /usr/local/mysql
						2. rpm -ivh MySQL-server-5.6.22-1.el6.i686.rpm
					2. 客户端安装
					    1. cd /usr/local/mysql
						2. rpm -ivh MySQL-client-5.6.22-1.el6.i686.rpm

				4. 启动服务
					1. service mysql start
					2. 第一次登陆mysql的时候密码（使用随机密码）
						1. cat /root/.mysql_secret
						2. 如果用户第一次登陆完了之后想去操作mysql，必须要设置自己的密码
							1. set password=password('root');
				5. 如果想远程访问mysql，那么还需要给root用户赋权
					grant all privileges on *.* to 'root' @'%' identified by 'root'；
					flush privileges;
				6. 关闭防火墙
					1. service iptables stop
					2. chkconfig  iptables off
		
			3. tomcat
				1. 上传并解压tomcat
					1. mkdir /usr/local/tomcat
					2. tar -zxvf apache-tomcat-7.0.57.tar.gz -C /usr/local/tomcat
			
			4. redis(源码编译安装)
				1. 安装gcc-c++
					1. cd /usr/local
					2.  yum install gcc-c++
				2. 安装redis
					1. 下载redis
						1. wget http://download.redis.io/releases/redis-3.0.4.tar.gz
					2. 解压
						1. mkdir /usr/local/redis
						2. tar -xzvf redis-3.0.4.tar.gz -C /usr/local/redis
					3.	编译安装 
						1.	cd /usr/local/redis/redis-3.0.4
						2.  make (编译)
						3.  make PREFIX=/usr/local/redis install （安装）
					4. 复制配置文件
						1. cd redis-3.0.4
						2. cp redis.conf /usr/local/redis/bin

				3. 启动redis 
					1. cd /usr/local/redis/bin
		
	2.  nginx（代理服务器）
		1. 介绍
			1. 什么是nginx
				1. Nginx 是一款高性能的服务器（http服务器  反向代理服务器   邮箱服务器）
			2. nginx的应用场景
				1. http 服务器（只能部署静态的资源 ）
				2. 虚拟主机（在一个服务器里面可以部署很多项目）
				3. 反向代理，负载均衡
			3. nginx安装步骤（ 源码编译安装 ）
				1. 准备工作（准备编译环境）
					1.  yum install gcc-c++（如果安装redis成功了,就不需要安装了）
					2. 安装PCRE
						1. yum install -y pcre pcre-devel
					3. 安装 zlib
						1. yum install -y zlib zlib-devel
					4. 安装OpenSSL
						1. yum install -y openssl openssl-devel

				2. 编译安装nginx
					1. 下载解压
						1. mkdir /usr/local/nginx
						2. tar -zxvf nginx-1.8.0 -C /usr/local/nginx
					2. cd nginx的解压目录下面
						1. 创建makefile
						    ./configure \
							--prefix=/usr/local/nginx \
							--pid-path=/var/run/nginx/nginx.pid \
							--lock-path=/var/lock/nginx.lock \
							--error-log-path=/var/log/nginx/error.log \
							--http-log-path=/var/log/nginx/access.log \
							--with-http_gzip_static_module \
							--http-client-body-temp-path=/var/temp/nginx/client \
							--http-proxy-temp-path=/var/temp/nginx/proxy \
							--http-fastcgi-temp-path=/var/temp/nginx/fastcgi \
							--http-uwsgi-temp-path=/var/temp/nginx/uwsgi \
							--http-scgi-temp-path=/var/temp/nginx/scgi
					3. 编译nginx
						1. make
					4. 安装nginx
						1. make  install

					5. 安装之后还需要创建临时目录
						1. mkdir /var/temp/nginx/client -p
					6. 启动nginx
						1. cd /usr/local/nginx/sbin
						2. 启动nginx
							1.  ./nginx
						3. 关闭 nginx：
							1. ./nginx -s stop
							2. ./nginx -s quit
						4. 重新加载配置
							1. ./nginx -s reload



					第一个问题：
					nginx安装

					第二个问题（了解理解）
					反向代理的配置
					负载均衡的配置

					upstream tomcat-travel {
						   server 192.168.177.129:8080 weight=3;
						   server 192.168.177.129:8081;
						   server 192.168.177.129:8082;
					    }
					
					    server {
					        listen       80; # 监听的端口
					        server_name  www.hmtravel.com; # 域名或ip
					        location / {	# 访问路径配置
					            # root   index;# 根目录
						    proxy_pass http://tomcat-travel;
					
					            index  index.html index.htm; # 默认首页
					        }
					        error_page   500 502 503 504  /50x.html;	# 错误页面
					        location = /50x.html {
					            root   html;
					        }
   						 }



