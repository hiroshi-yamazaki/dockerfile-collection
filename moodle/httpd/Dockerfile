FROM alpine:latest
RUN apk update
RUN apk add \
  apache2 \
  mariadb-client \
  openrc \
  php7 \
  php7-apache2 \
  php7-curl \
  php7-ctype \
  php7-dom \
  php7-gd \
  php7-gettext \
  php7-iconv \
  php7-intl \
  php7-json \
  php7-mbstring \
  php7-mcrypt \
  php7-mysqlnd \
  php7-openssl \
  php7-opcache \
  php7-pear \
  php7-pdo_mysql \
  php7-session \
  php7-soap \
  php7-xml \
  php7-xmlreader \
  php7-xmlrpc \
  php7-zip \
  php7-zlib \
  wget

RUN sed -i -e "s/^#ServerName/ServerName/g" /etc/apache2/httpd.conf
RUN sed -i -e "s#/var/www/localhost/htdocs#/var/www/localhost/moodle#g" /etc/apache2/httpd.conf
RUN mkdir /run/apache2

EXPOSE 80 443
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
