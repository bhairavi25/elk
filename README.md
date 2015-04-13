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

launch logstash:

```
docker run -d --volumes-from /logdata --name <logstash-container-name> --link <elastic-container-name>:<elastic-alias> <image id/name>
```

```
docker run -d --volumes-from /logdata -v /etc/pki:/etc/pki --name logstash --hostname logstash.example.com --link elastic:es <image id/name>
```

launch logstash-forwarder
```
 docker run -i -d -h testserver --volumes-from /logdata -v /etc/config:/etc/config -v /etc/pki:/etc/pki --name logstash-forwarder --link logstash:logstash.example.com logstash-forwarder-elk
```

```
curl 'http://es:9200/_search?pretty'
```

