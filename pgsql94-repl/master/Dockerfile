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

RUN	echo "wal_level = hot_standby" >> ${PGDATA}/postgresql.conf
RUN	echo "synchronous_commit = on" >> ${PGDATA}/postgresql.conf
RUN	echo "max_wal_senders = 2" >> ${PGDATA}/postgresql.conf
RUN	echo "synchronous_standby_names = 'slave1'" >> ${PGDATA}/postgresql.conf

RUN	echo "host	replication repl 0.0.0.0/0 password" >> ${PGDATA}/pg_hba.conf

USER	root
RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable postgresql-9.4.service

EXPOSE 22 5432
CMD ["/sbin/init"]
