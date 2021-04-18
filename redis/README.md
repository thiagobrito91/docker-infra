# docker-infra


docker run -i --rm --net redis_cluster-network redis redis-cli --cluster create 172.29.0.2:7001 172.29.0.3:7002 172.29.0.4:7003 172.29.0.5:7004 172.29.0.6:7005 172.29.0.7:7006 --cluster-replicas 1


docker exec -it redis-1 redis-cli -p 7001 cluster nodes