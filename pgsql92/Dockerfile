FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man zip unzip curl git hostname sysvinit-tools initscripts passwd
RUN	yum install -y postgresql-server postgresql-contrib

ADD	postgresql-setup.docker /tmp/postgresql-setup.docker
RUN	/tmp/postgresql-setup.docker initdb
RUN	rm /tmp/postgresql-setup.docker

RUN	echo "host	all	all	0.0.0.0/0	trust" >> /var/lib/pgsql/data/pg_hba.conf
RUN	echo "listen_addresses = '*'" >> /var/lib/pgsql/data/postgresql.conf

RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable postgresql.service

EXPOSE 22 5432
CMD ["/sbin/init"]
