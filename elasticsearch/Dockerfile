FROM	  ubuntu:latest
MAINTAINER Bhairavi Sankar "bsankar@us.ibm.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y ca-certificates wget openjdk-7-jre

RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.tar.gz -O /tmp/elasticsearch-1.0.1.tar.gz 2> /dev/null

RUN tar zxvf /tmp/elasticsearch-1.0.1.tar.gz -C /opt && mv /opt/elasticsearch-1.0.1 /opt/elasticsearch && rm -rf /tmp/elasticsearch-1.0.1.tar.gz

EXPOSE 9200

CMD /opt/elasticsearch/bin/elasticsearch
