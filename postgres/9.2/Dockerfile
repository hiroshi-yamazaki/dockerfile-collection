FROM docker.io/centos:latest
RUN echo "root:1234qwer" | chpasswd

RUN yum install -y epel-release sudo less
RUN yum install -y postgresql-server postgresql-contrib

ADD postgresql-setup.docker /tmp/postgresql-setup.docker
RUN bash /tmp/postgresql-setup.docker initdb
RUN rm /tmp/postgresql-setup.docker

RUN echo "host	all	all	0.0.0.0/0	trust" >> /var/lib/pgsql/data/pg_hba.conf
RUN echo "listen_addresses = '*'" >> /var/lib/pgsql/data/postgresql.conf

USER postgres

EXPOSE 5432
CMD ["postgres", "-D", "/var/lib/pgsql/data"]
