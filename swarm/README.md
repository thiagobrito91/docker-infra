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
5. Inicializando cluster Docker Swarm:

    5.1 Execute o comando abaixo no nó Master:
    
        ```bash
        $ docker swarm init --advertise-addr <ip>  
        ```

        Ao executar o comando acima o seguinte comando será gerado:
        ```bash
        $ docker swarm join --token SWMTKN-1-4ajme3361xd4d7d4mf7jae8g6y2hk37zsl5f401bdcx2oj9prd-729bi93pffqqcxxtnfjn29tcp 172.17.216.74:2377
        ```