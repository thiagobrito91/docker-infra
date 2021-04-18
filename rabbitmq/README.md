# **Cria um cluster do RabbitMQ, com resiliência de filas utilizando espelhamento.**

**Execute os seguintes comandos para configurar o cluster:**

**1) Cria três nós do RabbitMQ.**
```bash
$ docker-compose up -d 
```
**2) Execute o comando abaixo e informe S para dizer ao script que este NÓ será o MASTER.**
```bash
$ docker exec -it rabbitmq-master /usr/local/bin/configure-cluster.sh
```
**3) Execute os comando abaixo e informe N para dizer ao script que os NÓs serão os MIRRORS.**
```bash
$ docker exec -it rabbitmq-mirror1  /usr/local/bin/configure-cluster.sh
$ docker exec -it rabbitmq-mirror2  /usr/local/bin/configure-cluster.sh
```
