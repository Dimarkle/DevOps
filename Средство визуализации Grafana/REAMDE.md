Домашнее задание к занятию 14 «Средство визуализации Grafana»

# Задание 1

![grafana1](https://github.com/Dimarkle/DevOps/assets/118626944/2fedfd02-1684-4709-9d1b-1c621b24b5f7)


# Задание 2 

![grafana2](https://github.com/Dimarkle/DevOps/assets/118626944/3c867f62-afff-4436-9152-81f9a9292df2)

```

100 - avg by(instance) (irate(node_cpu_seconds_total{job="nodeexporter", mode="idle"}[$__interval])) * 100
avg(node_memory_MemFree_bytes{instance="nodeexporter:9100", job="nodeexporter"})/(1024^2)
avg by (instance)(rate(node_load1{}[$__rate_interval]))
avg by (instance)(rate(node_load5{}[$__rate_interval]))
avg by (instance)(rate(node_load15{}[$__rate_interval]))
node_filesystem_free_bytes{mountpoint="/"}

```



# Задание 3

![grafana3](https://github.com/Dimarkle/DevOps/assets/118626944/de8756b9-2282-41ec-b552-8a5cfbf8a8b6)
