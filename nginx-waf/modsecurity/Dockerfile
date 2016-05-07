FROM centos:latest

ADD nginx.repo /etc/yum.repos.d/nginx.repo
ADD nginx-Sources.repo /etc/yum.repos.d/nginx-Sources.repo
RUN yum install -y git less yum-utils rpm-build wget

WORKDIR /root
ENV NGINX_VERSION 1.9.15-1.el7.ngx
RUN yumdownloader --source nginx-$NGINX_VERSION
RUN rpm -ivh nginx-$NGINX_VERSION.src.rpm

ENV MOD_SECURITY_VERSION 2.9.1
RUN wget https://www.modsecurity.org/tarball/$MOD_SECURITY_VERSION/modsecurity-$MOD_SECURITY_VERSION.tar.gz
RUN yum install -y openssl \
  openssl-devel \
  zlib-devel \
  pcre-devel \
  libxslt-devel \
  gd-devel \
  GeoIP-devel \
  perl-devel \
  perl-ExtUtils-Embed \
  make \
  which \
  tar \
  gzip \
  bzip2 \
  patch \
  autoconf \
  httpd-devel \
  apr-devel \
  curl-devel \
  libxml2-devel \
  libtool \
  gcc

RUN cp modsecurity-$MOD_SECURITY_VERSION.tar.gz /root/rpmbuild/SOURCES/
WORKDIR /root/rpmbuild/SPECS
ADD nginx-spec.diff .
RUN patch -u nginx.spec < nginx-spec.diff
RUN rpmbuild -ba nginx.spec
