# **Cria um cluster do RabbitMQ, com resiliência de filas utilizando espelhamento.**

**Execute os seguintes comandos para configurar o cluster:**

**1) Cria três instâncias do RabbitMQ.**
```bash
$ docker-compose up -d 
```
**2) Execute o comando abaixo e digite S para dizer ao script que este NÓ será o MASTER.**
```bash
$ docker exec -it rabbitmq-master /usr/local/bin/configure-cluster.sh
```
**3) Execute os comandos abaixo e digite N para dizer ao script que os NÓs serão os MIRRORS.**
```bash
$ docker exec -it rabbitmq-mirror1  /usr/local/bin/configure-cluster.sh
$ docker exec -it rabbitmq-mirror2  /usr/local/bin/configure-cluster.sh
```

**Feito isso o CLUSTER do RabbitMQ estará em execução e com resiliência. Caso o NÓ MASTER fique indisponível um dos MIRRORs será eleito como NÓ MASTER, garantindo a Alta Disponibildiade do CLUSTER.**

**Este tipo de resiliência é garantido pela definição de política, presente no script configure-cluster:**

```bash
$ rabbitmqctl set_policy ha-fed ".*" '{"federation-upstream-set":"all", "ha-sync-mode":"automatic", "ha-mode":"nodes", "ha-params":["rabbit@rabbitmq-master","rabbit@rabbitmq-mirror1","rabbit@rabbitmq-mirror2"]}' --priority 1 --apply-to queues
````