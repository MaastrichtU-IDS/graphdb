#!/bin/bash

docker stop graphdb
docker rm graphdb

docker run --detach \
    --name graphdb \
    --publish 7200:7200 \
    --volume /data/graphdb:/opt/graphdb/home \
    --volume /data/graphdb-import:/root/graphdb-import \
    --restart unless-stopped \
    graphdb
