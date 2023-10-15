# Домашнее задание "Работа с Playbook"

## Playbook

Playbook производит установку и настройку следующих приложений на указанных серверах.


- ### Clickhouse

  - установка `clickhouse`
  - настройка удаленных подключений к приложению
  - создание базы данных и таблицы в ней


- ### Vector

  - установка `vector`
  - изменение конфига приложения для отправки логов на сервер `clickhouse-01`


## Variables

В каталоге group_vars задаются необходимые версии дистрибутивов.

|clickhouse_version|версия clickhous| 
|-|--------|
|vector_version|версия vector|

### Install Clickhouse
Скачиваются rpm пакеты, устанавливается Clickhouse, создается база logs.

Через group_vars можно задать следующие параметры:
- `clickhouse_version`, `vector_version` - версии устанавливаемых приложений;
- `clickhouse_database_name` - имя базы данных для хранения логов;
- `clickhouse_create_table` - структуру таблицы для хранения логов;
- `vector_config` - содержимое конфигурационного файла для приложения `vector`;

## Tags

|clickhouse|производит полную конфигурацию сервера clickhouse-01| 
|-|--------|
|vector|производит полную конфигурацию сервера vector-01|

- `clickhouse_db` производит конфигурацию базы данных и таблицы;
- `vector_config` производит изменение в конфиге приложения `vector`;
- `drop_clickhouse_database_logs` удаляет базу данных (по умолчанию не выполняется);

---


[Playbook]()
