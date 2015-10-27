FROM	centos:latest
ADD	etc/yum.repos.d/yum.mariadb.repo	/etc/yum.repos.d/mariadb.repo
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 bzip2-devel openssh-server openssl openssl-devel man telnet zip unzip curl-devel git sqlite sqlite-devel libxml2-devel gcc gcc-c++ make automake libffi-devel patch redis libyaml-devel readline-devel zlib-devel bison-devel autoconf yacc bind-utils MariaDB-client MariaDB-devel MariaDB-server nodejs nginx hostname sysvinit-tools initscripts passwd tcpdump v8-devel ImageMagick-devel vim-enhanced

# this is for docker build
ENV	RBENV_ROOT	/opt/rbenv
ENV	PATH	${RBENV_ROOT}/bin:$PATH
ENV	CONFIGURE_OPTS --disable-install-doc
# end

RUN	git clone https://github.com/sstephenson/rbenv.git ${RBENV_ROOT}
RUN	git clone https://github.com/sstephenson/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build

ADD	etc/profile.d/rbenv.sh /etc/profile.d/rbenv.sh
RUN	${RBENV_ROOT}/plugins/ruby-build/install.sh

RUN	xargs -L 1 rbenv install 2.2.3
RUN	bash -l -c 'rbenv global 2.2.3; gem install bundler;'

RUN	rm /etc/localtime
RUN	ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN sed -i -e "s/^bind 127\.0\.0\.1$/bind 0.0.0.0/g" /etc/redis.conf

RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable mariadb.service
RUN	/usr/bin/systemctl enable redis.service

EXPOSE 22 80 3306 6379
CMD ["/sbin/init"]

