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
curl 'http://es:9200/_search?pretty'
```
