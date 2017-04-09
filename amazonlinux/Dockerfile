FROM amazonlinux:latest
RUN yum install -y \
  bzip2 \
  git \
  gzip \
  less \
  openssh-server \
  openssh-clients \
  passwd \
  python27-pip \
  sudo \
  tar \
  which

RUN pip install --upgrade pip
RUN pip install supervisor

RUN mkdir /usr/local/etc/supervisord.d
ADD supervisord.conf /usr/local/etc/supervisord.conf
ADD supervisord.d/sshd.ini /usr/local/etc/supervisord.d/sshd.ini

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN useradd ec2-user -G wheel
RUN echo "ec2-user:1234qwer" | chpasswd
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

RUN sed -i -e "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config

RUN /etc/init.d/sshd start

EXPOSE 22

CMD ["/usr/local/bin/supervisord", "-n", "-c", "/usr/local/etc/supervisord.conf"]