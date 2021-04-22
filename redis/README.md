# docker-infra


docker run -i --rm --net redis_cluster-network redis redis-cli --cluster create 192.168.80.2:7001 192.168.80.3:7002 192.168.80.4:7003 192.168.80.5:7004 192.168.80.6:7005 192.168.80.7:7006 --cluster-replicas 1


docker run -i --rm --net redis_cluster-network redis redis-cli --cluster create redis-1:7001 redis-2:7002 redis-3:7003 redis-4:7004 redis-5:7005 redis-6:7006 --cluster-replicas 1

docker exec -it redis-1 redis-cli -p 7001 cluster nodes

Endpoint 192.168.80.2:7001 serving hashslot 2952 is not reachable at this point of time. Please check connectTimeout value. If it is low, try increasing it to give the ConnectionMultiplexer a chance to recover from the network disconnect. IOCP: (Busy=0,Free=1000,Min=12,Max=1000), WORKER: (Busy=2,Free=32765,Min=12,Max=32767), Local-CPU: n/a