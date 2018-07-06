!/bin/sh

docker stop graphdb
docker rm graphdb

docker run --detach \
    --name graphdb \
    --hostname=graphdb.dumontierlab.com \
    --publish 80:7200 \
    --volume /data/graphdb:/opt/graphdb/home \
    --volume /data/graphdb-import:/root/graphdb-import \
    --restart unless-stopped \
    graphdb:8.6.0
