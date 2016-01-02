From docker.io/centos:latest

RUN echo "root:1234qwer" | chpasswd

RUN yum install -y epel-release sudo less
RUN yum install -y redis

RUN sed -i -e "s/^bind 127\.0\.0\.1$/bind 0.0.0.0/g" /etc/redis.conf

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

USER redis

EXPOSE 6379
CMD ["/usr/bin/redis-server", "/etc/redis.conf"]
