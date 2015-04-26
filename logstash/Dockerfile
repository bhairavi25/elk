#FROM  java:8-jre
FROM ubuntu:latest

MAINTAINER Bhairavi Sankar "bsankar@us.ibm.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y ca-certificates wget openjdk-7-jre

RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -O /tmp/logstash.tar.gz 2> /dev/null

RUN tar zxvf /tmp/logstash.tar.gz -C /opt && mv /opt/logstash-1.4.2 /opt/logstash && rm -rf /tmp/logstash.tar.gz

#ADD start_logstash.sh /usr/local/bin/start_logstash.sh
#RUN chmod +x /usr/local/bin/start_logstash.sh

RUN mkdir /opt/logs

ADD logstash.conf.tmpl /opt/logstash/logstash.conf.tmpl

VOLUME ["/opt/certs", "/opt/logs"]

#CMD /opt/logstash/bin/logstash -e 'input { stdin { } } output { stdout { codec => rubydebug } }'

ADD logstash-wrapper.sh /usr/local/bin/logstash-wrapper.sh

CMD /usr/local/bin/logstash-wrapper.sh

# docker build bug where cache fails because of expose directive
#EXPOSE 9200
EXPOSE 9300
EXPOSE 5601
