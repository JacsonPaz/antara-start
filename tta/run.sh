#!/bin/bash

if [ -f run.conf ]
then
        . ./run.conf
fi

porta=$(echo ${PWD##*/} | cut -d'-' -f 3)

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

echo "Parando:"
docker stop $porta

echo "Limpando:"
docker rm $porta

#========================================
#migration apenas para jboss7 e wildfly
#=========================================
if [ $SERVER_IMAGE != "jboss4" ]
then
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
fi

### atualiza e executa o jboss7/jboss4/wildfly ###
docker pull 10.1.1.30:5000/$SERVER_IMAGE

echo "Subindo: --> $porta"

docker run -d -p $porta:8080  \
--name=$porta \
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
