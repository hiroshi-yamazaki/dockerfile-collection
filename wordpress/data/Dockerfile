FROM busybox:latest

RUN mkdir -p /var/www

WORKDIR /var/www
COPY latest-ja.tar.gz /var/www/

RUN ls -al /var/www/
RUN tar zxf latest-ja.tar.gz
RUN rm latest-ja.tar.gz

VOLUME /var/www
ENTRYPOINT /usr/bin/tail -f /dev/null
