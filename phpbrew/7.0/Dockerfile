FROM docker.io/centos:latest
RUN echo "root:1234qwer" | chpasswd

RUN yum install -y epel-release sudo less
RUN yum clean all
RUN yum install -y wget tar bzip2 bzip2-devel openssl openssl-devel telnet zip unzip curl-devel git sqlite sqlite-devel libxml2-devel gcc gcc-c++ make automake libffi-devel patch libyaml-devel readline-devel zlib-devel bison-devel autoconf yacc bind-utils hostname sysvinit-tools initscripts tcpdump ImageMagick-devel libmcrypt-devel libxslt-devel which
RUN yum install -y mariadb-client mariadb-devel
RUN yum install -y php-cli

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
RUN chmod +x phpbrew
RUN mv phpbrew /usr/local/bin/

ENV PHPBREW_ROOT /opt/phpbrew
ENV PHPBREW_HOME /opt/phpbrew

RUN phpbrew init
RUN echo "[[ -e ${PHPBREW_ROOT}/bashrc ]] && source ${PHPBREW_ROOT}/bashrc" > /etc/profile.d/phpbrew.sh
RUN source /etc/profile.d/phpbrew.sh

ENV PHP_VERSION 7.0.1
RUN phpbrew update
RUN phpbrew install -j 2 ${PHP_VERSION} +default +fpm +mysql +pdo +openssl=/usr -- --with-libdir=lib64 
RUN phpbrew switch php-${PHP_VERSION}

ENV PHPBREW_PHP "php-${PHP_VERSION}"
