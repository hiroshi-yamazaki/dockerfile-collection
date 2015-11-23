FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man telnet zip unzip curl git bind-utils hostname sysvinit-tools initscripts passwd postfix
RUN	yum install -y mariadb-server mariadb-client
RUN	yum install -y nginx php php-mbsring php-pdo php-mysql php-fpm

RUN	rm /etc/localtime
RUN	ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable mariadb.service
RUN	/usr/bin/systemctl enable nginx.service
RUN	/usr/bin/systemctl enable postfix.service
RUN	/usr/bin/systemctl enable php-fpm

RUN	wget -O /tmp/wordpress-4.3.1-ja.zip https://ja.wordpress.org/wordpress-4.3.1-ja.zip
WORKDIR /var/www
RUN	unzip /tmp/wordpress-4.3.1-ja.zip
RUN	chown -R nginx.nginx wordpress
RUN	chmod -R 755 wordpress

RUN	sed -i -e "s/;date\.timezone =/date\.timezone = \"Asia\/Tokyo\"/g" /etc/php.ini
RUN	sed -i -e "s/apache/nginx/g" /etc/php-fpm.d/www.conf

ADD	etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD	etc/nginx/conf.d/wordpress.conf /etc/nginx/conf.d/wordpress.conf

EXPOSE 22 80 3306
CMD ["/sbin/init"]
