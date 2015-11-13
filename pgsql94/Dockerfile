FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man zip unzip curl git hostname sysvinit-tools initscripts passwd
RUN	yum install -y http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm
RUN	yum install -y postgresql94-server postgresql94-contrib

ADD	postgresql94-setup.docker /tmp/postgresql94-setup.docker
RUN	/tmp/postgresql94-setup.docker initdb
RUN	rm /tmp/postgresql94-setup.docker

RUN	echo "host	all	all	0.0.0.0/0	trust" >> /var/lib/pgsql/9.4/data/pg_hba.conf
RUN	echo "listen_addresses = '*'" >> /var/lib/pgsql/9.4/data/postgresql.conf

RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable postgresql-9.4.service

EXPOSE 22 5432
CMD ["/sbin/init"]
