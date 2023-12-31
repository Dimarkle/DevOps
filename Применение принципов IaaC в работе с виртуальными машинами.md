# Задание 1 
```
 CI (Continuous Integration) — принцип CI предполагает слияние рабочих веток в основную ветку и автоматизированную пересборку проекта и запуск тестов. Позволяет избавить разработчиков от ручных действий и выявлять проблемы на сразу после пересборки.
 CD (Continuous Delivery) — принцип CD (delivery) предполагает отправлять валидные доработки в dev-окружения по нажатию кнопки. В случае обнаружения проблем можно откатиться до предыдущей стабильной версии.
 CD (Continuous Deployment) — принцип CD (deployment) предполагает полную автоматизацию развёртывания доработок в dev-окружения. Однако релиз в production всё ещё в под ручным управлением, для минимизации бизнес-рисков.
```
* Идемпотентность - это свойство объекта  или операции, при повторном выполнении  которой мы получаем результат идентичный  предыдущему и всем последующим  выполнениям
# Задание 2
* Выгодные отличия Ansible от других систем управления конфигурациями
```
- быстро осваивается, достаточно поверхностного понимания синтаксиса YAML и Jinja;
- нет необходимости устанавливать специальное ПО на хосты, нужен только SSH и python;
- подробная и наглядная документация;
- большое количество модулей;
- позволяет реализовать принцип идемпотентности в управлении состояниями хостов;
```


* Имееют права на жизнь оба метода. И различные инструменты управления конфигурацией заточены под тот или иной метод. Например, Chef, Puppet, CFEngine используют pull, Pulumi, Otter, Terraform, Ansible - push, а SaltStack, DSC - push/pull.
По моему мнению push надёжней, т.к. централизованно управляет конфигурацией и исключает ситуации, когда прямое изменеие на сервере не отразится в репозитории, что может привести к непредсказуемым ситуациям.
  
# Задание 3
![Без имени](https://github.com/Dimarkle/DevOps/assets/118626944/e2f6ec25-c721-4d0c-ba24-fe0705879cce)
# Задание 4
```
diman@diman-virtual-machine:~/Documents/VM/05-virt-02-iaac/vagrant$ vagrant up
Bringing machine 'server1.netology' up with 'virtualbox' provider...
==> server1.netology: Importing base box 'bento/ubuntu-20.04'...
==> server1.netology: Matching MAC address for NAT networking...
==> server1.netology: Checking if box 'bento/ubuntu-20.04' version '202112.19.0' is up to date...
==> server1.netology: Setting the name of the VM: server1.netology
==> server1.netology: Clearing any previously set network interfaces...
==> server1.netology: Preparing network interfaces based on configuration...
    server1.netology: Adapter 1: nat
    server1.netology: Adapter 2: hostonly
==> server1.netology: Forwarding ports...
    server1.netology: 22 (guest) => 20011 (host) (adapter 1)
    server1.netology: 22 (guest) => 2222 (host) (adapter 1)
==> server1.netology: Running 'pre-boot' VM customizations...
==> server1.netology: Booting VM...
==> server1.netology: Waiting for machine to boot. This may take a few minutes...
    server1.netology: SSH address: 127.0.0.1:2222
    server1.netology: SSH username: vagrant
    server1.netology: SSH auth method: private key
    server1.netology: Warning: Remote connection disconnect. Retrying...
    server1.netology: Warning: Connection reset. Retrying...
    server1.netology: 
    server1.netology: Vagrant insecure key detected. Vagrant will automatically replace
    server1.netology: this with a newly generated keypair for better security.
    server1.netology: 
    server1.netology: Inserting generated public key within guest...
    server1.netology: Removing insecure key from the guest if it's present...
    server1.netology: Key inserted! Disconnecting and reconnecting using new SSH key...
==> server1.netology: Machine booted and ready!
==> server1.netology: Checking for guest additions in VM...
==> server1.netology: Setting hostname...
==> server1.netology: Configuring and enabling network interfaces...
==> server1.netology: Mounting shared folders...
    server1.netology: /vagrant => /home/podkovka/Documents/VM/05-virt-02-iaac/vagrant
==> server1.netology: Running provisioner: ansible...
    server1.netology: Running ansible-playbook...

PLAY [nodes] *******************************************************************

TASK [Gathering Facts] *********************************************************
ok: [server1.netology]

TASK [Create directory for ssh-keys] *******************************************
ok: [server1.netology]

TASK [Adding rsa-key in /root/.ssh/authorized_keys] ****************************
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: If you are using a module and expect the file to exist on the remote, see the remote_src option
fatal: [server1.netology]: FAILED! => {"changed": false, "msg": "Could not find or access '~/.ssh/id_rsa.pub' on the Ansible Controller.\nIf you are using a module and expect the file to exist on the remote, see the remote_src option"}
...ignoring

TASK [Checking DNS] ************************************************************
changed: [server1.netology]

TASK [Installing tools] ********************************************************
ok: [server1.netology] => (item=git)
ok: [server1.netology] => (item=curl)

TASK [Installing docker] *******************************************************
changed: [server1.netology]

TASK [Add the current user to docker group] ************************************
changed: [server1.netology]

PLAY RECAP *********************************************************************
server1.netology           : ok=7    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=1   

diman@diman-virtual-machine:~/Documents/VM/05-virt-02-iaac/vagrant$ vagrant ssh
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.4.0-91-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

 System information disabled due to load higher than 1.0


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
Last login: Sun Jul  18 15:08:53 2023 from 10.0.2.2
vagrant@server1:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
vagrant@server1:~$

```
