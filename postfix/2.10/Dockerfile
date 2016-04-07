FROM centos:latest
RUN echo "root:1234qwer" | chpasswd
RUN yum install -y epel-release sudo less
RUN yum install -y postfix supervisor

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN sed -i -e "s/^inet_interfaces = localhost/inet_interfaces = all/g" /etc/postfix/main.cf
RUN sed -i -e "s/^#mynetworks_style = subnet/mynetworks_style = subnet/g" /etc/postfix/main.cf
RUN echo "mynetworks = 172.17.0.0/16, 192.168.99.0/24, 127.0.0.0/8" >> /etc/postfix/main.cf

ADD postfix.ini /etc/supervisord.d/

EXPOSE 25 587
CMD ["supervisord", "-n"]
