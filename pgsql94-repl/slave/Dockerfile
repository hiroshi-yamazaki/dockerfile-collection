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
RUN	sh /tmp/postgresql94-setup.docker initdb
RUN	rm /tmp/postgresql94-setup.docker

ENV	PGDATA /var/lib/pgsql/9.4/data
RUN	echo "host	all	all	0.0.0.0/0	trust" >> ${PGDATA}/pg_hba.conf

RUN	echo "listen_addresses = '*'" >> ${PGDATA}/postgresql.conf
RUN	echo "port = 5432" >> ${PGDATA}/postgresql.conf

USER	postgres
RUN	/usr/pgsql-9.4/bin/pg_ctl -w start -D ${PGDATA} && echo "create user repl replication password '1234qwer'" | /usr/pgsql-9.4/bin/psql -U postgres && /usr/pgsql-9.4/bin/pg_ctl -w stop -D ${PGDATA}

RUN	echo "hot_standby = on" >> ${PGDATA}/postgresql.conf
RUN	echo "standby_mode = 'on'" >> ${PGDATA}/recovery.conf
RUN	echo "primary_conninfo = 'host=pgsql94master-sample port=5432 user=repl password=1234qwer application_name=slave1'" >> ${PGDATA}/recovery.conf

USER	root
RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable postgresql-9.4.service

EXPOSE 22 5432
CMD ["/sbin/init"]
