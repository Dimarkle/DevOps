# Домашнее задание к занятию 3 "Использование Ansible"

# Описание 


Playbook выполняет загрузку и установку Clickhouse. Запускает сервис clickhouse-server и создает базу данных. Скачивает и устанавливает Vector. Изменяет конфигурацию для дальнейшей работы. Копирует файлы Lighthouse из репозитория, изменяет конфигурацию и запускает сервис.


Используемые параметры:

* name
* hosts
* tasks
* block
* ansible.builtin.get_url
* url
* dest
* with_items
* check_mode
* rescue
* become
* ansible.builtin.yum
* disable_gpg_check
* notify
* ansible.builtin.meta
* ansible.builtin.command
* register
* failed_when
* changed_when
* handlers
* ansible.builtin.service
* state
*ansible.builtin.template
* mode
* validate
* owner
* group
* daemon_reload
* command
* pre_tasks
* git
* repo
*version

Теги не были использованы.
[Playbook](https://github.com/Dimarkle/DevOps/tree/main/%D0%98%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20Ansible/playbook)






