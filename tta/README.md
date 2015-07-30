#dev

Versões nas imagens Docker:

	WildFly = 8.2.1	   -	JDK = 1.8.0_45

	Jboss7  = 7.0.2    - 	JDK = 1.7.0_79


Comandos para execução do "docker" com acesso ao repositório interno:
	
	sudo service docker stop
	
	sudo docker -d --insecure-registry 10.1.1.30:5000 &
	
	
Disponibilizar o diretório "deployments" e o arquivo "configuration.xml" conforme estrutura mais abaixo. Para rodar o Wildfly ou o Jboss, executar um dos comandos a seguir:

	sh run-wildfly.sh

	ou
	
	sh run-jboss7.sh
	

Estrutura sugerida para múltiplas configs: (cliente-banco-porta)

	docker	
	   |-- mingxin-mingxinDulceTTA-7000
	  	|run-wildfly.sh
	  	|--deployments
	   |-- abuhler-abuhler20150404-7001
	  	|run-jboss7.sh
	  	|--deployments
	  	|--nfe
	  	   |--template
	   |-- cliente-banco-porta
		|...
		|...
	   |-- cliente-banco-porta
		|...
		|...

