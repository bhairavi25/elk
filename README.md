# ELK

Build images:
```
cd logstash
docker build -t elk-logstash .
cd elasticsearch
docker build -t elk-elasticsearch .
```

Create a data-only container for storing logs
```
docker run -d -v /var/log:/logdata --name logdata f913a9f89714 echo Data-only container for logs
```

add the generated certs to logstash server and logstash-forwarder
```
openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt -days 365 -subj /CN=logstash.example.com
```

mount to all containers:
```
docker run -it --volumes-from /logdata --name test2 ubuntu:latest /bin/bash
```

launch elastic search
```
docker run -d --name <container-name> <image-name>
```
official image(elasticsearch)
```
docker run -d --volumes-from logdata -v ~/elk/config:/usr/share/elasticsearch/config -p 9200:9200 --name elastic elasticsearch
```

launch logstash:

```
docker run -d --volumes-from /logdata --name <logstash-container-name> --hostname <hostname> --link <elastic-container-name>:<elastic-alias> <image id/name>
```

```
docker run -d --volumes-from /logdata -v /etc/pki:/etc/pki -v /var/log:/var/log -p 15000:5000 -p 9300:9300 --name logstash --hostname logstash.mms.ibmcloud.com --link elastic:es localhost.localdomain:5000/logstash-7-142-lumberjack
```

launch logstash-forwarder
```
 docker run -i -d -h testserver --volumes-from /logdata -v /etc/config:/etc/config -v /etc/pki:/etc/pki --name logstash-forwarder --link logstash:logstash.mms.ibmcloud.com logstash-forwarder-elk
```

query es
```
curl 'http://es:9200/_search?pretty'
```
indices to use in kibana
```

curl es:9200/_cat/indices?v
```

```
curl es:9200/logstash-<index>/_search?q=*&pretty
```

Kibana:
```
docker run -d --name kibana --link elastic:es -p 5601:5601 localhost.localdomain:5000/kibana4-elk
```

Launch logstash-forwarder
```
/opt/logstash-forwarder/bin/logstash-forwarder -config /etc/config.json
```
