# swarm

Sunbindo cluster Docker Swarm.

1. Crie três instâncias do linux ubuntu: master, mirror1 e mirror2.
2. Rode sudo apt update
3. Instale ssh: 
     ```bash
     $ sudo apt update
     ```
4. Instale o docker: 
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