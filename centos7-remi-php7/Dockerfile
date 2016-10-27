FROM centos:latest
RUN echo "root:1234qwer" | chpasswd
RUN useradd ec2-user -G wheel
RUN echo "ec2-user:1234qwer" | chpasswd

RUN yum install -y wget
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum install -y ./remi-release-7.rpm

RUN yum install -y httpd less
RUN yum install -y php70 php70-build php70-php php70-php-cli php70-php-mbstring php70-php-pear php70-php-pdo php70-php-mysqlnd php70-php-xml
RUN echo "<?php phpinfo(); ?>" > /var/www/html/index.php

ADD server.conf /etc/httpd/conf.d/

VOLUME ["/var/www/html"]
EXPOSE 80 443
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
