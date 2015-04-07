FROM	  ubuntu:latest
MAINTAINER Bhairavi Sankar "bsankar@us.ibm.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y ca-certificates wget openjdk-7-jre

RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.tar.gz -O /tmp/elasticsearch-1.4.2.tar.gz 2> /dev/null

RUN tar zxvf /tmp/elasticsearch-1.4.2.tar.gz -C /opt && mv /opt/elasticsearch-1.4.2 /opt/elasticsearch && rm -rf /tmp/elasticsearch-1.4.2.tar.gz

CMD /opt/elasticsearch/bin/elasticsearch

EXPOSE 9300

