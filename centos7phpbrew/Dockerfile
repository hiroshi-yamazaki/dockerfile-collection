FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN yum install -y http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN	yum install -y epel-release
RUN yum clean all
RUN yum install -y sudo wget tar bzip2 bzip2-devel openssh-server openssl openssl-devel man telnet zip unzip curl-devel git sqlite sqlite-devel libxml2-devel gcc gcc-c++ make automake libffi-devel patch libyaml-devel readline-devel zlib-devel bison-devel autoconf yacc bind-utils hostname sysvinit-tools initscripts passwd tcpdump v8-devel ImageMagick-devel vim-enhanced  libmcrypt-devel libxslt-devel
RUN	yum install -y mariadb-server mariadb-client mariadb-devel
RUN	yum install -y nginx w3m php-cli

RUN	rm /etc/localtime
RUN	ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
RUN chmod +x phpbrew
RUN mv phpbrew /usr/local/bin/

ENV PHPBREW_ROOT /opt/phpbrew
ENV PHPBREW_HOME /opt/phpbrew

RUN phpbrew init
RUN echo "[[ -e ${PHPBREW_ROOT}/bashrc ]] && source ${PHPBREW_ROOT}/bashrc" > /etc/profile.d/phpbrew.sh
RUN source /etc/profile.d/phpbrew.sh

RUN phpbrew update
RUN phpbrew install -j 2 7.0.0 +default +mysql +pdo +openssl=/usr -- --with-libdir=lib64
RUN phpbrew switch php-7.0.0

RUN	/usr/bin/systemctl enable sshd.service

EXPOSE 22 80
CMD ["/sbin/init"]
