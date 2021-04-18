#!/bin/bash

set -e

echo '################ Este nó é o MASTER? S ou N? ################'
read EH_MASTER

rabbitmqctl stop_app
rabbitmqctl reset

if [[ $EH_MASTER == 'N' ]]
then
    echo '################ VINCULANDO NÓS SLAVE AO MASTER. (JOIN_CLUSTER) ################'
    rabbitmqctl join_cluster rabbit@rabbitmq-master
    echo '################ VINCULO NÓS SLAVE AO MASTER CONCLUÍDO. (JOIN_CLUSTER) ################'
else
    echo '################  NÓ MASTER NÃO PRECISA SER VINCULADO (JOIN_CLUSTER). ################'
fi

rabbitmqctl start_app

if [[ $EH_MASTER == 'S' ]]
then
    echo '################ CONFIGURANDO POLICY - HA-FE ################'
    rabbitmqctl set_policy ha-fed ".*" '{"federation-upstream-set":"all", "ha-sync-mode":"automatic", "ha-mode":"nodes", "ha-params":["rabbit@rabbitmq-master","rabbit@rabbitmq-slave1","rabbit@rabbitmq-slave2"]}' --priority 1 --apply-to queues
fi

echo '################ INSTALANDO PLUGINS! ################'
rabbitmq-plugins enable rabbitmq_shovel rabbitmq_shovel_management
rabbitmq-plugins enable rabbitmq_federation
echo '################ PLUGINS INSTALADOS! ################'

sleep 3s

echo '################ CONFIGURAÇÃO DO CLUSTER FINALIZADA! ################'
