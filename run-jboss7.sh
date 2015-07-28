#!/bin/bash
docker pull 10.1.1.30:5000/jboss7 

docker run -it -p 8080:8080 -p 8787:8787 \
-v $PWD/deployments/:/antara/jboss/standalone/deployments/ \
-v $PWD/standalone.xml:/antara/jboss/standalone/configuration/standalone.xml \
-e "MEMORIA_MAXIMA=-Xmx1024m" \
10.1.1.30:5000/jboss7

