From docker.io/centos:latest

RUN yum install -y epel-release
RUN yum install -y nginx sudo less wget

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
