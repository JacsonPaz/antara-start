#dev
Versões nas imagens Docker:

        WildFly = 8.2.1    -    JDK = 1.8.0_45

        Jboss7  = 7.0.2    -    JDK = 1.7.0_79


Comandos para execução do "docker" com acesso ao repositório interno:

        sudo service docker stop

        sudo docker -d --insecure-registry 10.1.1.30:5000 &


Disponibilizar o diretório "deployments" e o arquivo "run.conf" conforme estrutura mais abaixo. Para rodar o Wildfly ou o Jboss, executar o comando a seguir:

        sh run.sh
        

Banco, portas e jboss (jboss7 ou wildfly) ficam definidos no arquivo de configuração run.conf

Estrutura sugerida para múltiplas configs:

	docker
	|-- mingxin
		|run.conf
		|run.sh
		|--deployments
 	|-- abuhler
 		|run.conf
 		|run.sh
		|--deployments
		|--nfe			
		   |--template
  	|-- cliente xx
		|...
		|...
 	|-- cliente yy
  		|...
		|...
	  
