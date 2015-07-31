#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cd $SCRIPT_DIR

if [ -f run.conf ]
then
	. ./run.conf
fi

docker pull 10.1.1.30:5000/$SERVER_IMAGE

docker run -it -p $SERVER_PORT:8080 -p $DEBUG_PORT:8787 \
-v $PWD/deployments/:/antara/jboss/standalone/deployments/ \
-v $PWD/nfe/template:/antara/nfe/template \
-v $PWD/logs/:/antara/jboss/standalone/log/ \
-e "MEMORIA_MAXIMA=-Xmx1024m" \
-e "jboss_datasource_connectionurl=$DATABASE_URL" \
-e "jboss_datasource_driver=$DATABASE_DRIVER" \
-e "jboss_datasource_username=$DATABASE_USER" \
-e "jboss_datasource_password=$DATABASE_PASS" \
10.1.1.30:5000/$SERVER_IMAGE

