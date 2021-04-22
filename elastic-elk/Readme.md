# Como utilizar
1. Gere certificados SSL executando cert-gen docker-compose container
```
cd cert-gen
docker-compose up
```
2. Atualizar segredo para apm 
- docker-compose.yml
```
apm-server.secret_token="{strong secret}"
```
3. Gerar senhas 
```
docker-compose up -d
docker-compose exec apm-elasticsearch bash
./bin/elasticsearch-setup-passwords auto -u "https://localhost:9200"
```
4. Configure senhas para serviços 
- docker-compose.yml
```
output.elasticsearch.password={elasticsearch user password}
apm-server.kibana.password={apm_system user password}
```
- kibana.yml
```
elasticsearch.password: {kibana user password}
```
- logstash.yml
```
xpack.monitoring.elasticsearch.password: '{elasticsearch user password}'
```
- logstash/logstash.conf
```
password => "{elasticsearch user password}"
```
5. Reiniciar contêineres 
```
docker-compose down
docker-compose up -d
```
