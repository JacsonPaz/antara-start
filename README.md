# wildfly
Docker com Wildfly de produção + JDK de produção.

Versões:
	WildFly = 8.2.1	-	JDK = 1.8.1_45


Comandos para execução do "docker" com acesso ao repositório interno:
	
	sudo service docker stop
	
	sudo docker -d --insecure-registry 10.1.1.30:5000 &
	
	
Na pasta local, disponibilizar o diretório "deployments" e o arquivo "configuration.xml". Após isso, executar o comando a seguir:

	sh run-docker.sh
	

Estrutura sugerida para múltiplas configs:

	docker
	|-- deployments
	|-- versoes
	   |-- mingxin
	  	|run-docker.sh
	  	|standalone.sh
	  	|antara-server-configuration.jar
	   |-- fuxin
	  	|run-docker.sh
	  	|standalone.sh
	  	|antara-server-configuration.jar
	  |
	




