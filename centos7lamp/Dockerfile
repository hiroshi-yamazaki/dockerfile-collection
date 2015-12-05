FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man telnet zip unzip curl git bind-utils hostname sysvinit-tools initscripts passwd postfix
RUN	yum install -y mariadb-server mariadb-client
RUN	yum install -y httpd
RUN	yum install -y php php-mbsring php-pdo php-mysql php-fpm php-xml
RUN	yum install -y w3m

RUN	rm /etc/localtime
RUN	ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable mariadb.service
RUN	/usr/bin/systemctl enable httpd.service
RUN	/usr/bin/systemctl enable postfix.service

EXPOSE 22 80 3306
CMD ["/sbin/init"]
