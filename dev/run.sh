#!/bin/bash

if [ -f run.conf ]
then
	. ./run.conf
fi

if [ $SERVER_IMAGE = "jboss4" ]
then
  deploy_imagem="server/default/deploy/"
  log_imagem="server/default/log/"
  driver_banco=$DATABASE_DRIVER_JAR
else
  deploy_imagem="standalone/deployments/"
  log_imagem="standalone/log/"
  driver_banco=$DATABASE_DRIVER
fi


docker pull 10.1.1.30:5000/$SERVER_IMAGE

docker run -it -p $SERVER_PORT:8080 -p $DEBUG_PORT:8787 \
-v $PWD/deployments/:/antara/jboss/$deploy_imagem \
-v $PWD/nfe/template:/antara/nfe/template/ \
-v $PWD/log/:/antara/jboss/$log_imagem \
-e "MEMORIA_MAXIMA=-Xmx1024m" \
-e "jboss_datasource_connectionurl=$DATABASE_URL" \
-e "jboss_datasource_driver=$driver_banco" \
-e "jboss_datasource_username=$DATABASE_USER" \
-e "jboss_datasource_password=$DATABASE_PASS" \
-e "antara_ds_extratag=$ANTARA_DS_EXTRATAG" \
10.1.1.30:5000/$SERVER_IMAGE
