# ELK

Build images:
```
cd logstash
docker build -t elk-logstash .
cd elasticsearch
docker build -t elk-elasticsearch .
```

launch elastic search
```
docker run -d --name <container-name> <image-name>
```

launch logstash:
```
docker run -d --name <container-name> --link <elastic-container-name>:<elastic-alias> <image-name>
```

