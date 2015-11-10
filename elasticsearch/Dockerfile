FROM	centos:latest
ADD	etc/yum.repos.d/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man zip unzip curl git mariadb-client mariadb-server hostname sysvinit-tools initscripts passwd java-1.8.0-openjdk elasticsearch

ADD	etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable mariadb.service
RUN	/usr/bin/systemctl enable elasticsearch.service

EXPOSE 22 3306 9200 9300
CMD ["/sbin/init"]
