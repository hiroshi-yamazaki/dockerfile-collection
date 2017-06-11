#!/bin/bash

sudo yum install -y epel-release
sudo yum install -y \
  rpm-build \
  gcc \
  automake \
  autoconf \
  less \
  which \
  wget

sudo yum install -y --enablerepo=epel \
  flex \
  bison \
  zlib \
  zlib-devel \
  libpcap \
  libpcap-devel \
  pcre \
  pcre-devel \
  libdnet \
  libdnet-devel \
  tcpdump

if [ ! -f daq-2.0.6-1.src.rpm ];
then
wget https://www.snort.org/downloads/snort/daq-2.0.6-1.src.rpm
rpmbuild --rebuild daq-2.0.6-1.src.rpm
fi
sudo yum install -y rpmbuild/RPMS/x86_64/daq-2.0.6-1.x86_64.rpm

if [ ! -f snort-2.9.9.0-1.src.rpm ];
then
wget https://www.snort.org/downloads/snort/snort-2.9.9.0-1.src.rpm
rpmbuild --rebuild snort-2.9.9.0-1.src.rpm
fi
sudo yum install -y rpmbuild/RPMS/x86_64/snort-2.9.9.0-1.x86_64.rpm

if [ ! -f community-rules.tar.gz ];
then
wget https://www.snort.org/downloads/community/community-rules.tar.gz
tar zxvf community-rules.tar.gz
fi

sudo touch /etc/snort/rules/white_list.rules
sudo touch /etc/snort/rules/black_list.rules
