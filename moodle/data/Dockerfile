FROM alpine:latest
RUN apk update
RUN apk add \
  apache2 \
  wget

RUN cd /tmp; wget --no-check-certificate https://download.moodle.org/download.php/direct/stable32/moodle-latest-32.tgz
RUN tar zxf /tmp/moodle-latest-32.tgz -C /var/www/localhost/
RUN chown -R apache.apache /var/www/localhost/moodle
RUN mkdir /var/www/localhost/moodledata
RUN chown -R apache.apache /var/www/localhost/moodledata

VOLUME ["/var/www/localhost", "/var/lib/mysql"]