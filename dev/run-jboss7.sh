#!/bin/bash
docker pull 10.1.1.30:5000/jboss7 

docker run -it -p 8080:8080 -p 8787:8787 \
-v $PWD/deployments/:/antara/jboss/standalone/deployments/ \
-v $PWD/nfe/template:/antara/nfe/template \
-e "MEMORIA_MAXIMA=-Xmx1024m" \
-e "jboss_datasource_connectionurl=jdbc:postgresql://x.x.x.x:5432/banco" \
-e "jboss_datasource_driver=oracle OU postgresql OU jtds" \
-e "jboss_datasource_username=login banco" \
-e "jboss_datasource_password=senha banco" \
10.1.1.30:5000/jboss7
