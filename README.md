# ELK

Build image:
```
docker build -t logstash/ubuntu:elk142 .
```

launch elastic search
```
docker run -d --name <container-name> <image-name>
```

launch logstash:
```
docker run -d --name <container-name> -e ES_HOST=<es-host> -e ES_PORT=<es-host> --link <elastic-container-name>:<elastic-alias> <image-name>
```

