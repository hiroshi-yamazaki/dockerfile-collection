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

ENV PHPBREWSCRIPT /etc/profile.d/phpbrew.sh
RUN phpbrew init
RUN echo "export PHPBREW_ROOT=${PHPBREW_ROOT}" > ${PHPBREWSCRIPT}
RUN echo "[[ -e ${PHPBREW_ROOT}/bashrc ]] && source ${PHPBREW_ROOT}/bashrc" >> ${PHPBREWSCRIPT}
RUN source ${PHPBREWSCRIPT}

ENV PHP_VERSION 7.0.1
RUN phpbrew update
RUN phpbrew install -j 2 ${PHP_VERSION} +default +fpm +mysql +pdo +openssl=/usr -- --with-libdir=lib64 

ENV PHPBREW_PHP "php-${PHP_VERSION}"
ENV PHPBREW_PATH /opt/phpbrew/php/php-${PHP_VERSION}/bin
RUN source ${PHPBREW_ROOT}/bashrc

ENV PHPBREWINIT ${PHPBREW_ROOT}/init
RUN echo "export PHPBREW_ROOT=${PHPBREW_ROOT}" >  ${PHPBREWINIT}
RUN echo "export PHPBREW_HOME=${PHPBREW_HOME}" >> ${PHPBREWINIT}
RUN echo "export PHPBREW_LOOKUP_PREFIX=" >> ${PHPBREWINIT}
RUN echo "export PHPBREW_PHP=php-${PHP_VERSION}" >> ${PHPBREWINIT}
RUN echo "export PHPBREW_PATH=${PHPBREW_ROOT}/php/php-${PHP_VERSION}/bin" >> ${PHPBREWINIT}

EXPOSE 9000
RUN phpbrew switch php-${PHP_VERSION}
