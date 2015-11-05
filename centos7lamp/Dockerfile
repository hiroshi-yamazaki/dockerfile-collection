FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 bzip2-devel openssh-server openssl openssl-devel man telnet zip unzip curl-devel git sqlite sqlite-devel libxml2-devel gcc gcc-c++ make automake libffi-devel patch libyaml-devel readline-devel zlib-devel bison-devel autoconf yacc bind-utils mariadb-client mariadb-devel mariadb-server hostname sysvinit-tools initscripts passwd tcpdump ImageMagick-devel vim-enhanced httpd php php-mbstring php-pdo php-mysql php-fpm postfix

RUN	rm /etc/localtime
RUN	ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable mariadb.service
RUN	/usr/bin/systemctl enable httpd.service
RUN	/usr/bin/systemctl enable postfix.service

EXPOSE 22 80 3306
CMD ["/sbin/init"]
