#!/bin/bash

if [ -f run.conf ]
then
        . ./run.conf
fi

porta=$(echo ${PWD##*/} | cut -d'-' -f 3)

echo "Parando:"
docker stop $porta

echo "Limpando:"
docker rm $porta

### atuliaza e executa o migration ###
docker pull 10.1.1.30:5000/migration

docker run --rm=true \
-v $PWD/$SCRIPT_JAR:/antara/script.jar \
-e "SERVER_NAME=$porta" \
-e "migration_jdbc_url=$DATABASE_URL" \
-e "migration_jdbc_driver=$DATABASE_DRIVER_JAR" \
-e "migration_jdbc_username=$DATABASE_USER" \
-e "migration_jdbc_password=$DATABASE_PASS" \
-e "migration_dialect=$MIGRATION_DIALECT" \
10.1.1.30:5000/migration



### atualiza e executa o jboss/wildfly ###
docker pull 10.1.1.30:5000/$SERVER_IMAGE

echo "Subindo: --> $porta"

docker run -d -p $porta:8080  \
--name=$porta \
-v $PWD/deployments/:/antara/jboss/standalone/deployments/ \
-v $PWD/nfe/template:/antara/nfe/template/ \
-v $PWD/log/:/antara/jboss/standalone/log/ \
-e "MEMORIA_MAXIMA=-Xmx1024m" \
-e "jboss_datasource_connectionurl=$DATABASE_URL" \
-e "jboss_datasource_driver=$DATABASE_DRIVER" \
-e "jboss_datasource_username=$DATABASE_USER" \
-e "jboss_datasource_password=$DATABASE_PASS" \
10.1.1.30:5000/$SERVER_IMAGE
