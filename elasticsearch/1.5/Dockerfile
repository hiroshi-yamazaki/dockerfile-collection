FROM	centos:latest
ADD	elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
RUN	echo "root:1234qwer" | chpasswd

# this is for normal user
RUN	useradd ec2-user -G wheel
RUN	echo "ec2-user:1234qwer" | chpasswd
# end

RUN	rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch

RUN	yum install -y epel-release
RUN	yum install -y sudo less which
RUN	yum install -y elasticsearch java-1.8.0-openjdk

RUN	rm /etc/localtime
RUN	ln -s /usr/share/zoneinfo/Japan /etc/localtime

ENV	JAVA_HOME /usr/lib/jvm/jre
ENV	ES_HOME /usr/share/elasticsearch
ENV	CONF_DIR=$ES_HOME/config
ENV	DATA_DIR=$ES_HOME/data
ENV	LOG_DIR=$ES_HOME/logs
ENV	PATH $ES_HOME/bin:$PATH
WORKDIR	/usr/share/elasticsearch

RUN	for p in ./data ./logs ./config ./config/scripts; do mkdir -p $p; chown -R elasticsearch:elasticsearch $p; done

RUN	echo "network.host: 0.0.0.0" > $CONF_DIR/elasticsearch.yml
ADD	logging.yml $CONF_DIR/

EXPOSE 22 9200 9300

USER	elasticsearch
RUN	./bin/plugin install royrusso/elasticsearch-HQ
RUN	./bin/plugin install mobz/elasticsearch-head
RUN	./bin/plugin install polyfractal/elasticsearch-inquisitor
RUN	./bin/plugin install elasticsearch/elasticsearch-analysis-kuromoji/2.5.0
CMD ["elasticsearch", "-Des.default.path.home=${ES_HOME}", "-Des.default.path.logs=${LOG_DIR}", "-Des.default.path.data=${DATA_DIR}", "-Des.default.path.conf=${CONF_DIR}"]

