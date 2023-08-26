# Задание 1

Создал собственный образ любой операционной системы  с помощью [Packer](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/packer-quickstart) 


![Без именнни](https://github.com/Dimarkle/DevOps/assets/118626944/635dcff5-8796-4fae-8e52-c5ef5de183b0)
___
![Без имениррр](https://github.com/Dimarkle/DevOps/assets/118626944/7fce05df-909d-4201-bb5c-4ecf563631d6)
___
![Без имени](https://github.com/Dimarkle/DevOps/assets/118626944/08954aa0-594a-43d2-ba7a-84c78c00d030)
___

 
#  Задание 2

Создал машинку с помощью [Terraform](https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/terraform)


![2](https://github.com/Dimarkle/DevOps/assets/118626944/4826cee3-8edc-49ea-a117-39baaf5a30bc)
___
![2 1](https://github.com/Dimarkle/DevOps/assets/118626944/2870fa37-6517-4239-8b9b-684c33f7aab2)
___
#  Задание 3

Использовал [Ansible-код](https://github.com/netology-group/virt-homeworks/tree/virt-11/05-virt-04-docker-compose/src/ansible)

```
root@diman-virtual-machine:/home/diman/ansible# ansible-playbook provision.yml

PLAY [nodes] ************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************
ok: [node01.netology.cloud]

TASK [Create directory for ssh-keys] ************************************************************************************************************************
ok: [node01.netology.cloud]

TASK [Adding rsa-key in /root/.ssh/authorized_keys] *********************************************************************************************************
ok: [node01.netology.cloud]

TASK [Checking DNS] *****************************************************************************************************************************************
changed: [node01.netology.cloud]

TASK [Installing tools] *************************************************************************************************************************************
ok: [node01.netology.cloud]

TASK [Add docker repository] ********************************************************************************************************************************
changed: [node01.netology.cloud]

TASK [Installing docker package] ****************************************************************************************************************************
changed: [node01.netology.cloud]

TASK [Enable docker daemon] *********************************************************************************************************************************
changed: [node01.netology.cloud]

TASK [Install docker-compose] *******************************************************************************************************************************
changed: [node01.netology.cloud]

TASK [Synchronization] **************************************************************************************************************************************
changed: [node01.netology.cloud]

TASK [Pull all images in compose] ***************************************************************************************************************************
changed: [node01.netology.cloud]

TASK [Up all services in compose] ***************************************************************************************************************************
changed: [node01.netology.cloud]

PLAY RECAP **************************************************************************************************************************************************
node01.netology.cloud      : ok=12   changed=8    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
____

вывод команды docker ps
![Без имени](https://github.com/Dimarkle/DevOps/assets/118626944/32fb3907-be53-473c-bb71-6c32d1f229fb)

#  Задание 4

 Grafana 158.160.116.75:3000

 

![Без имени](https://github.com/Dimarkle/DevOps/assets/118626944/392a9d90-f83f-4f45-9fa7-31576e5168c2)

____

![Без имени 222](https://github.com/Dimarkle/DevOps/assets/118626944/c951b043-36a6-4090-8d8c-4f680456cd7f)








