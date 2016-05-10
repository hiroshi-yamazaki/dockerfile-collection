FROM centos:latest

ADD nginx.repo /etc/yum.repos.d/nginx.repo
ADD nginx-Sources.repo /etc/yum.repos.d/nginx-Sources.repo
RUN yum install -y git less yum-utils rpm-build wget

WORKDIR /root
ENV NGINX_VERSION 1.9.15-1.el7.ngx
RUN yumdownloader --source nginx-$NGINX_VERSION
RUN rpm -ivh nginx-$NGINX_VERSION.src.rpm

RUN git clone https://github.com/nbs-system/naxsi.git
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
  gcc

RUN tar czf naxsi.tar.gz -C /root/naxsi/ naxsi_src
RUN mv naxsi.tar.gz /root/rpmbuild/SOURCES/naxsi.tar.gz
RUN cp /root/naxsi/naxsi_config/naxsi_core.rules /root/rpmbuild/SOURCES/naxsi_core.rules

RUN git clone https://github.com/openresty/headers-more-nginx-module.git
RUN tar czf headers-more-nginx-module.tar.gz headers-more-nginx-module
RUN cp /root/headers-more-nginx-module.tar.gz /root/rpmbuild/SOURCES/

ADD nginx-spec.diff /root/rpmbuild/SPECS/nginx-spec.diff
RUN patch -u /root/rpmbuild/SPECS/nginx.spec < /root/rpmbuild/SPECS/nginx-spec.diff
RUN rpmbuild -ba /root/rpmbuild/SPECS/nginx.spec
