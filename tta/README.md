#tta

Versões nas imagens Docker:

	WildFly = 8.2.1	   -	JDK = 1.8.0_45

	Jboss7  = 7.0.2    - 	JDK = 1.7.0_79
	
	Jboss5  = 4.0.2_GA -    JDK = 1.7.0_79
	
	Migration = versão 2014


Comandos para execução do "docker" com acesso ao repositório interno:
	
	sudo service docker stop
	
	sudo docker -d --insecure-registry 10.1.1.30:5000 &
	
	
Disponibilizar o diretório "deployments" e os arquivos "run.conf" e "run.sh" conforme estrutura mais abaixo. Para rodar o Wildfly ou o Jboss + MIGRATION, executar um dos comandos a seguir:

	sh run.sh
	
Estrutura sugerida para múltiplas configs: (cliente-banco-porta)

	docker
	  |--ambientes
	    |-- mingxin-mingxinDulceTTA-7000
	  		|run.sh
			|run.conf
	  		|--deployments
	    |-- abuhler-abuhler20150404-7001
	  		|run.sh
			|run.conf
	  		|--deployments
	  		|--nfe
	  	   		|--template
	    |-- cliente-banco-porta
			|...
			|...
	    |-- cliente-banco-porta
			|...
			|...

