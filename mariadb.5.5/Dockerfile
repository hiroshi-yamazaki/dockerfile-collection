FROM docker.io/centos:latest
RUN echo "root:1234qwer" | chpasswd

RUN yum install -y epel-release sudo less
RUN yum install -y mariadb-client mariadb-server 

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

ENV INITSCRIPT /tmp/inituser.sh
ADD inituser.sh ${INITSCRIPT}

RUN mysql_install_db --datadir=/var/lib/mysql --user=mysql

RUN bash ${INITUSER}
RUN rm ${INITUSER}

EXPOSE 3306
CMD ["/usr/bin/mysqld_safe"]
