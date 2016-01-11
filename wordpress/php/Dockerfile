FROM phpbrew_7.0:latest

WORKDIR /opt/phpbrew/php/php-7.0.1/etc/php-fpm.d/
RUN cp www.conf.default www.conf
RUN sed -i -e 's/listen = 127.0.0.1/listen = 0.0.0.0/g' www.conf

WORKDIR /opt/phpbrew/php/php-7.0.1/
CMD ["./sbin/php-fpm", "-F", "-c", "./etc/php.ini", "-y", "./etc/php-fpm.conf"]
