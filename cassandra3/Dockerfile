FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man zip unzip curl git hostname sysvinit-tools initscripts passwd
RUN	yum install -y java-1.8.0-openjdk

RUN	wget http://ftp.jaist.ac.jp/pub/apache/cassandra/3.0.0/apache-cassandra-3.0.0-bin.tar.gz -P /opt/
WORKDIR	/opt
RUN	tar zxvf apache-cassandra-3.0.0-bin.tar.gz
RUN	ln -s apache-cassandra-3.0.0 cassandra

WORKDIR	/
RUN /usr/bin/systemctl enable sshd.service

EXPOSE 22
CMD ["/sbin/init"]
