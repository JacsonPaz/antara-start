#!/bin/bash
docker pull 10.1.1.30:5000/wildfly 

docker run -it -p 8080:8080 -p 8787:8787 \
-v $PWD/deployments/:/antara/jboss/standalone/deployments/ \
-v $PWD/nfe/template:/antara/nfe/template \
-e "MEMORIA_MAXIMA=-Xmx1024m" \
-e "jboss_datasource_connectionurl=driver://ip:porta/banco" \
-e "jboss_datasource_driver=jtds OU oracle OU postgresql" \
-e "jboss_datasource_username=login banco" \
-e "jboss_datasource_password=senha banco" \
10.1.1.30:5000/wildfly
