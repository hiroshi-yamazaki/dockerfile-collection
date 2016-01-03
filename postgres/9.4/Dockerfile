FROM docker.io/centos:latest
RUN echo "root:1234qwer" | chpasswd

RUN yum install -y epel-release sudo less
RUN yum install -y http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm
RUN yum install -y postgresql94-server postgresql94-contrib

ADD postgresql94-setup.docker /tmp/postgresql94-setup.docker
RUN bash /tmp/postgresql94-setup.docker initdb
RUN rm /tmp/postgresql94-setup.docker

RUN echo "host	all	all	0.0.0.0/0	trust" >> /var/lib/pgsql/9.4/data/pg_hba.conf
RUN echo "listen_addresses = '*'" >> /var/lib/pgsql/9.4/data/postgresql.conf

USER postgres

EXPOSE 5432
CMD ["/usr/pgsql-9.4/bin/postgres", "-D", "/var/lib/pgsql/9.4/data"]
