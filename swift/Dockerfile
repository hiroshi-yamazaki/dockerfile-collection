FROM	ubuntu:15.10
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd -G adm ec2-user
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	apt-get update
#RUN	apt-get upgrade -y
RUN	apt-get install -y git cmake ninja-build clang uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config
RUN	apt-get install -y clang
RUN	apt-get install -y wget openssh-server systemd-container

RUN	wget https://swift.org/builds/ubuntu1510/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu15.10.tar.gz -P /tmp
RUN	tar zxf /tmp/swift-2.2*.gz -C /opt/
RUN	ln -s /opt/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu15.10 /opt/swift
RUN	sed -i -e "s/PATH=\"/PATH=\"\/opt\/swift\/usr\/bin\:/g" /etc/environment

RUN	rm /tmp/swift-2.2*.gz
ENV	PATH /opt/swift/usr/bin:$PATH

#RUN	systemctl enable sshd

EXPOSE 22
CMD ["/sbin/init"]
