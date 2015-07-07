FROM	centos:latest
ADD	etc/yum.repos.d/yum.mariadb.repo	/etc/yum.repos.d/mariadb.repo
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 bzip2-devel openssh-server openssl openssl-devel man telnet zip unzip supervisor curl-devel git sqlite sqlite-devel libxml2-devel gcc gcc-c++ make automake libffi-devel patch redis libyaml-devel readline-devel zlib-devel bison-devel autoconf yacc bind-utils MariaDB-client MariaDB-devel MariaDB-server nodejs nginx hostname sysvinit-tools initscripts passwd tcpdump libv8-devel ImageMagick-devel

# this is for docker build
ENV	RBENV_ROOT	/opt/rbenv
ENV	PATH	${RBENV_ROOT}/bin:$PATH
ENV	CONFIGURE_OPTS --disable-install-doc
# end

RUN	git clone https://github.com/sstephenson/rbenv.git ${RBENV_ROOT}
RUN	git clone https://github.com/sstephenson/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build

ADD	etc/profile.d/rbenv.sh /etc/profile.d/rbenv.sh
RUN	${RBENV_ROOT}/plugins/ruby-build/install.sh

RUN	xargs -L 1 rbenv install 2.2.0
RUN	bash -l -c 'rbenv global 2.2.0; gem install bundler;'

# for centos7 docker
RUN	/usr/bin/ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ""
RUN	/usr/bin/ssh-keygen -t dsa -b 1024 -f /etc/ssh/ssh_host_dsa_key -N ""

RUN	rm /etc/localtime
RUN	ln -s /usr/share/zoneinfo/Japan /etc/localtime

ADD	etc/supervisord.conf /etc/supervisord.conf
ADD	etc/supervisord.d/mariadb.ini /etc/supervisord.d/mariadb.ini
ADD	etc/supervisord.d/sshd.ini /etc/supervisord.d/sshd.ini
ADD	etc/supervisord.d/redis.ini /etc/supervisord.d/redis.ini
# end

RUN sed -i -e "s/^bind 127\.0\.0\.1$/bind 0.0.0.0/g" /etc/redis.conf

EXPOSE 22 80 3306 6379
CMD ["/usr/bin/supervisord"]

