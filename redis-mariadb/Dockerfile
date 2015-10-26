FROM	centos:latest
ADD	etc/yum.repos.d/yum.mariadb.repo	/etc/yum.repos.d/mariadb.repo
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man zip unzip supervisor curl git redis MariaDB-client MariaDB-server hostname sysvinit-tools initscripts passwd

# for centos7 docker
RUN	/usr/bin/ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ""
RUN	/usr/bin/ssh-keygen -t dsa -b 1024 -f /etc/ssh/ssh_host_dsa_key -N ""

ADD	etc/supervisord.conf /etc/supervisord.conf
ADD	etc/supervisord.d/mariadb.ini /etc/supervisord.d/mariadb.ini
ADD	etc/supervisord.d/sshd.ini /etc/supervisord.d/sshd.ini
ADD	etc/supervisord.d/redis.ini /etc/supervisord.d/redis.ini
# end

RUN sed -i -e "s/^bind 127\.0\.0\.1$/bind 0.0.0.0/g" /etc/redis.conf

WORKDIR	/root/
ADD	mysql-init.sql /root/mysql-init.sql
RUN	/etc/init.d/mysql start && sleep 15; mysql -u root < mysql-init.sql && rm mysql-init.sql

EXPOSE 22 3306 6379
CMD ["/usr/bin/supervisord"]
