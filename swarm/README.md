# swarm

Sunbindo cluster Docker Swarm.

1. Crie três instâncias do linux ubuntu: master, mirror1 e mirror2.
2. Rode sudo apt update
3. Instale ssh: 
     ```bash
     $ sudo apt update
     ```
4. Instale o docker em cada instancia do linux: 
    ```bash
    $ sudo apt update
    $ sudo apt install apt-transport-https ca-certificates curl software-properties-common
    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    $ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    $ sudo apt update
    $ sudo apt-cache policy docker-ce
    $ sudo apt install docker-ce
    $ sudo systemctl status docker
    ```
5. Inicializando cluster Docker Swarm. Execute o comando abaixo no nó Master:
	 
        $ docker swarm init --advertise-addr <ip>  
     
6. Copie o comando gerado e cole nas instâncias do linux que serão espelhos:
        
        $ docker swarm join --token [TOKEN] [IP_NODE_MASTER]
        
7. Execute o comando abaixo no nós master para visualizar os nós do cluster:
        $ docker node ls