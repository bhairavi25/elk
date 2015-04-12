FROM ubuntu:14.10

RUN apt-get update

RUN apt-get install -y wget git golang ruby ruby-dev irb ri rdoc build-essential libssl-dev zlib1g-dev

RUN gem install fpm pleaserun

RUN git clone git://github.com/elasticsearch/logstash-forwarder.git /tmp/logstash-forwarder

RUN cd /tmp/logstash-forwarder && go build

RUN cd /tmp/logstash-forwarder && make deb

RUN dpkg -i /tmp/logstash-forwarder/*.deb

RUN rm -rf /tmp/*

VOLUME /etc/config
VOLUME /var/log

CMD /opt/logstash-forwarder/bin/logstash-forwarder -config /etc/config/config.json
