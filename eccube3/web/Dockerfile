FROM centos:latest

RUN yum install -y epel-release
RUN yum install -y git httpd php php-cli php-mbstring php-pdo php-mysql composer php-mcrypt php-pecl-apc
RUN git clone https://github.com/EC-CUBE/ec-cube.git /var/www/ec-cube

ADD virtual.conf /etc/httpd/conf.d/

ENV ECCUBE /var/www/ec-cube

WORKDIR $ECCUBE
RUN composer install
RUN chown -R apache:apache $ECCUBE
RUN chmod 755 -R $ECCUBE

EXPOSE 80 443
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
