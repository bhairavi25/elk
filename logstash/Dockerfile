FROM	  ubuntu:latest

MAINTAINER Bhairavi Sankar "bsankar@us.ibm.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y ca-certificates wget openjdk-7-jre
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -O /tmp/logstash.tar.gz 2> /dev/null

RUN tar zxvf /tmp/logstash.tar.gz -C /opt && mv /opt/logstash-1.4.2 /opt/logstash && rm -rf /tmp/logstash.tar.gz

#ADD start_logstash.sh /usr/local/bin/start_logstash.sh
#RUN chmod +x /usr/local/bin/start_logstash.sh

RUN mkdir /opt/logs

#ADD collectd-types.db /opt/collectd-types.db
ADD logstash.conf /opt/logstash/logstash.conf
ADD catalina.out /tmp/catalina.out
ADD ibm-mms-amp.debug.log /tmp/ibm-mms-amp.debug.log

VOLUME ["/opt/conf", "/opt/certs", "/opt/logs"]

EXPOSE 9300
#EXPOSE 9200

#CMD /usr/local/bin/start_logstash.sh
#CMD /opt/logstash/bin/logstash -e 'input { stdin { } } output { stdout { codec => rubydebug } }'
CMD /opt/logstash/bin/logstash -f /opt/logstash/logstash.conf


