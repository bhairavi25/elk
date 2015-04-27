FROM ubuntu

RUN apt-get update

RUN apt-get install -y curl

RUN apt-get install -y nginx

RUN apt-get install -y wget

#RUN curl -s  https://download.elasticsearch.org/kibana/kibana/kibana-3.0.1.tar.gz | tar xz

RUN apt-get update && apt-get install -y ca-certificates wget openjdk-7-jre

RUN curl -s https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-beta3.tar.gz | tar xz

#RUN mv kibana-4.0.0-beta3 /kibana

#RUN mkdir -p /var/www/kibana3

#RUN cp -R kibana/* /var/www/kibana3/

#RUN wget https://gist.githubusercontent.com/thisismitch/2205786838a6a5d61f55/raw/f91e06198a7c455925f6e3099e3ea7c186d0b263/nginx.conf

EXPOSE 5601
EXPOSE 80
EXPOSE 9200

#RUN sed -i 's|elasticsearch: "http://"+window.location.hostname+":9200",|elasticsearch: "http://"+window.location.hostname+":80",|g' kibana/config.js

#RUN sed -i 's|server_name           kibana.myhost.org;|server_name           logstash.mms.ibmcloud.com;|g' nginx.conf

#RUN sed -i 's|root  /usr/share/kibana3;|root /var/www/kibana3;|g' nginx.conf

#RUN cp nginx.conf /etc/nginx/sites-available/default

WORKDIR kibana-4.0.0-beta3

RUN sed -i 's|elasticsearch: "http://localhost:9200"|elasticsearch: "http://es:9200"|g' config/kibana.yml

#CMD service nginx restart
#CMD service nginx start

#ADD run-nginx.sh /opt/run-nginx.sh
#RUN chmod 777 /opt/run-nginx.sh

CMD bin/kibana
