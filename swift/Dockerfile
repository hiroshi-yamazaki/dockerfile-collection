FROM	ubuntu:15.10
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G adm -m /home/ec2-user
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	apt-get update
RUN	apt-get upgrade -y
RUN	apt-get install -y git cmake ninja-build clang uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config
RUN	apt-get install -y clang
RUN	apt-get install -y wget


WORKDIR /opt
RUN	wget https://swift.org/builds/ubuntu1510/swift-2.2-SNAPSHOT-2015-12-01-b/swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu15.10.tar.gz
RUN	tar zxf swift-2.2*.gz
RUN	ln -s swift-2.2-SNAPSHOT-2015-12-01-b-ubuntu15.10 swift
RUN	sed -i -e "s/PATH=\"/PATH=\"\/opt\/swift\/usr\/bin\:/g" /etc/environment

RUN	rm swift-2.2*.gz
ENV	PATH	/opt/swift/usr/bin:$PATH

WORKDIR /home/ec2-user

EXPOSE 22
CMD ["/sbin/init"]
