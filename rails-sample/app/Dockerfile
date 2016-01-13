FROM docker.io/centos:latest
RUN useradd ec2-user

RUN yum install -y epel-release
RUN yum install -y sudo \
 tar \
 bzip2 \
 bzip2-devel \
 openssl-devel \
 zip \
 unzip \
 curl-devel \
 git \
 sqlite-devel \
 libxml2-devel \
 gcc \
 gcc-c++ \
 make \
 automake \
 libffi-devel \
 libyaml-devel \
 readline-devel \
 zlib-devel \
 bison-devel \
 autoconf \
 yacc \
 mariadb-client \
 mariadb-devel \
 mariadb-server \
 nodejs \
 npm \
 v8-devel \
 ImageMagick-devel 

# this is for docker build
ENV RBENV_ROOT /opt/rbenv
ENV PATH ${RBENV_ROOT}/shims:${RBENV_ROOT}/bin:$PATH
ENV CONFIGURE_OPTS --disable-install-doc
# end

RUN git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT}
RUN git clone https://github.com/rbenv/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build

ADD rbenv.sh /etc/profile.d/rbenv.sh
RUN ${RBENV_ROOT}/plugins/ruby-build/install.sh

RUN xargs -L 1 rbenv install 2.2.3
RUN bash -l -c 'rbenv global 2.2.3; gem install bundler;'

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN npm install -g bower

RUN mkdir /app
WORKDIR /app

EXPOSE 3000
