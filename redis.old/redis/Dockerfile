FROM	centos:latest
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	yum install -y epel-release
RUN	yum install -y sudo wget tar bzip2 openssh-server openssl man zip unzip curl git redis hostname sysvinit-tools initscripts passwd

RUN sed -i -e "s/^bind 127\.0\.0\.1$/bind 0.0.0.0/g" /etc/redis.conf

RUN /usr/bin/systemctl enable sshd.service
RUN /usr/bin/systemctl enable redis.service

EXPOSE 22 6379
CMD ["/sbin/init"]
