# Задание 1




# Задание 2



# Задание 3

```
[root@node01 centos]# docker service ls
ID             NAME                                MODE         REPLICAS   IMAGE                                          PORTS
s319m3cq88ry   swarm_monitoring_alertmanager       replicated   1/1        stefanprodan/swarmprom-alertmanager:v0.14.0
w2tltt23pv8q   swarm_monitoring_caddy              replicated   1/1        stefanprodan/caddy:latest                      *:3000->3000/tcp, *:9090->9090/tcp, *:9093-9094->9093-9094/tcp
td1pbsna0gww   swarm_monitoring_cadvisor           global       6/6        google/cadvisor:latest
xze3wdnpr1h5   swarm_monitoring_dockerd-exporter   global       6/6        stefanprodan/caddy:latest
6ioj1luw7yq0   swarm_monitoring_grafana            replicated   1/1        stefanprodan/swarmprom-grafana:5.3.4
y61441gfh8tv   swarm_monitoring_node-exporter      global       6/6        stefanprodan/swarmprom-node-exporter:v0.16.0
keijn1f2kv7c   swarm_monitoring_prometheus         replicated   1/1        stefanprodan/swarmprom-prometheus:v2.5.0
a505r83qwzyb   swarm_monitoring_unsee              replicated   1/1        cloudflare/unsee:v0.8.0

```
