FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man zip unzip curl git mongodb-server mongodb hostname sysvinit-tools initscripts passwd


RUN /usr/bin/systemctl enable sshd.service
RUN /usr/bin/systemctl enable mongodb.service

EXPOSE 22 27017
CMD ["/sbin/init"]
