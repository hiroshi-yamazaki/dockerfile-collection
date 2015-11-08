FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man telnet zip unzip curl git patch autoconf yacc bind-utils hostname sysvinit-tools initscripts passwd tcpdump vim-enhanced haproxy

RUN	rm /etc/localtime
RUN	ln -s /usr/share/zoneinfo/Japan /etc/localtime

ADD	etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg

RUN	/usr/bin/systemctl enable sshd.service
RUN	/usr/bin/systemctl enable haproxy.service

EXPOSE 22 80
CMD ["/sbin/init"]

