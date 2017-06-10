FROM centos:latest

RUN yum groupinstall -y "Development Tools"
RUN yum install -y git wget pcre-devel zlib-devel openssl-devel

RUN wget https://nginx.org/download/nginx-1.13.1.tar.gz
RUN tar zxvf nginx-1.13.1.tar.gz
RUN git clone https://github.com/arut/nginx-rtmp-module.git
WORKDIR nginx-1.13.1
RUN ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module
RUN make && make install

WORKDIR /
RUN mkdir -p /usr/local/nginx/html/live
RUN mkdir -p /usr/local/nginx/html/hls
ADD nginx.conf /usr/local/nginx/conf/nginx.conf
ADD video.html /usr/local/nginx/html/index.html

EXPOSE 80 1935 8080
CMD ["/usr/local/nginx/sbin/nginx", "-c", "/usr/local/nginx/conf/nginx.conf", "-g", "daemon off;"]