# Задание 1

* В глобальном режиме будет развернута одна реплика на каждом узле кластера (сервис на всех нодах кластера), а  в реплецируемом - на указанном количестве нод
* В Docker Swarm кластере используется алгоритм  — Raft. Выбор лидера происходит следующим образом: если ноды-фолловеры не слышат лидера, они переходят в статус кандидата, кандидат на лидера отправляет остальным нодам запрос на голосование и, большинством голосов, выбирается лидером.
* Overlay Network создает подсеть, которую могут использовать контейнеры в разных хостах swarm-кластера. Overlay-сеть использует технологию vxlan, которая инкапсулирует layer 2 фреймы в layer 4 пакеты (UDP/IP). При помощи этого действия Docker создает виртуальные сети поверх существующих связей между хостами, которые могут оказаться внутри одной подсети.


# Задание 2

* Создадим подсеть:
  
![Без имени](https://github.com/Dimarkle/DevOps/assets/118626944/e54f95d3-2942-46bf-9fc7-3af6e42c2dcb)

* Настроим [centos-7-base.json](https://github.com/netology-code/virtd-homeworks/tree/main/05-virt-05-docker-swarm/src/packer) и запускаем Packer

![Без имени2](https://github.com/Dimarkle/DevOps/assets/118626944/119d248c-7513-40c7-b6e9-aa83561991f0)

* Удаляем созданные сеть и подсеть

* Ставим [Terraform](https://github.com/netology-code/virtd-homeworks/tree/main/05-virt-05-docker-swarm/src/terraform)

![Без имени3](https://github.com/Dimarkle/DevOps/assets/118626944/67989f8e-c5a1-4ae7-86a6-72f29ace074b)

* Итог
  
![Без имени4](https://github.com/Dimarkle/DevOps/assets/118626944/43edd38f-3bcf-4c20-a75a-cb55f2c7528e)

# Задание 3
![Без имени 5](https://github.com/Dimarkle/DevOps/assets/118626944/807ac48f-f653-4c04-ab0e-243622a6ab83)



