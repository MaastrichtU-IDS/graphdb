FROM azul/zulu-openjdk

LABEL maintainer "Alexander Malic <alexander.malic@maastrichtuniversity.nl>"

# Build time arguments
ARG version=9.3.0
ARG edition=free 

# Environment variables, to be used for the docker image
# 500Go for the server, and 8Go for desktop computer
#ENV GDB_HEAP_SIZE=500g
#ENV GDB_MAX_MEM=500g

ENV GDB_MAX_MEM=8g
ENV GDB_MIN_MEM=1g
ENV GDB_HEAP_SIZE=8g

ENV GRAPHDB_HOME=/opt/graphdb/home

# Copy the installation file recieved after registration
ADD graphdb-${edition}-${version}-dist.zip /tmp

RUN apt-get update && \
  apt-get install unzip && \
  mkdir -p ${GRAPHDB_HOME} && \
  cd ${GRAPHDB_HOME} && \
  unzip /tmp/graphdb-${edition}-${version}-dist.zip && \
  mv graphdb-${edition}-${version} . && \
  rm /tmp/graphdb-${edition}-${version}-dist.zip


ENV PATH=${GRAPHDB_HOME}/bin:$PATH

EXPOSE 7200

ENTRYPOINT ["/opt/graphdb/dist/bin/graphdb"]

CMD ["-Dgraphdb.home=/opt/graphdb/dist -Dorg.xml.sax.driver=com.sun.org.apache.xerces.internal.parsers.SAXParser -Djdk.xml.entityExpansionLimit=1000000"]

