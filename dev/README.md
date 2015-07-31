#dev
Versões nas imagens Docker:

        WildFly = 8.2.1    -    JDK = 1.8.0_45

        Jboss7  = 7.0.2    -    JDK = 1.7.0_79


Comandos para execução do "docker" com acesso ao repositório interno:

        sudo service docker stop

        sudo docker -d --insecure-registry 10.1.1.30:5000 &


Disponibilizar o diretório "deployments" e o arquivo "run.conf" conforme estrutura mais abaixo. Para rodar o Wildfly ou o Jboss, executar o comando a seguir:

        sh run.sh
        
Sugestão: manter apenas uma cópia do arquivo run.sh em uma pasta no diretório do usuário, por exemplo:
	/home/user/docker/run.sh
E então definir um alias global para este script - abra um terminal na pasta do usuário, digite o comando 
	vi .bashrc
E adicione uma nova linha no arquivo
	alias docker-run="sh /home/alanschaeffer/docker/run.sh"
A partir do momento que abrir uma nova instância do terminal, poderá navegar para a pasta de ambiente do projeto, que vai conter somente run.conf e a pasta deployments dessa vez, e executar docker-run, que irá executar o script de iniciar o jboss na pasta atual. Por enquanto, temos essa solução para eliminar a necessidade de ficar atualizando os scripts em todos os ambientes configurados quando houverem atualizações.

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
	  
