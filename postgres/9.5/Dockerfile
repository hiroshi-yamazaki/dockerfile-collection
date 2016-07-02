FROM docker.io/centos:latest
RUN echo "root:1234qwer" | chpasswd

RUN yum install -y epel-release sudo less
RUN yum install -y https://download.postgresql.org/pub/repos/yum/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm 
RUN yum install -y postgresql95-server postgresql95-contrib

ADD postgresql95-setup.docker /tmp/postgresql95-setup.docker
RUN bash /tmp/postgresql95-setup.docker initdb
RUN rm /tmp/postgresql95-setup.docker

RUN echo "host	all	all	0.0.0.0/0	trust" >> /var/lib/pgsql/9.5/data/pg_hba.conf
RUN echo "listen_addresses = '*'" >> /var/lib/pgsql/9.5/data/postgresql.conf

USER postgres

EXPOSE 5432
CMD ["/usr/pgsql-9.5/bin/postgres", "-D", "/var/lib/pgsql/9.5/data"]
