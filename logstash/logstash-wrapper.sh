#!/bin/sh 

sed "s|\"ES_HOST\"|\"$ES_PORT_9300_TCP_ADDR\"|; s|\"ES_PORT\"|\"$ES_PORT_9300_TCP_PORT\"|" /opt/logstash/logstash.conf.tmpl > /opt/logstash/logstash.conf

/opt/logstash/bin/logstash -f /opt/logstash/logstash.conf


