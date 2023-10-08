# Домашнее задание к занятию  «Введение в Ansible»

#  1 
Запустим playbook site.yml, используя окружение inventory/test.yml
![image](https://github.com/Dimarkle/DevOps/assets/118626944/492b451f-7fa5-464e-b10b-8cd965be9f5b)

# 2
![image](https://github.com/Dimarkle/DevOps/assets/118626944/b405eb25-5dc2-48a5-baa9-5b6511035521)

# 3
Настроим окружения Centos7 и Ubuntu:
![image](https://github.com/Dimarkle/DevOps/assets/118626944/a3780d8c-520e-45db-9888-138be030533e)


# 4
Запустим playbook site.yml, используя окружение inventory/prod.yml:
![image](https://github.com/Dimarkle/DevOps/assets/118626944/9b4541eb-89c1-4f2f-9819-aafff7f6bb17)

# 5
Внесём изменения в (group_vars)[https://github.com/Dimarkle/DevOps/tree/main/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20Ansible/playbook%20(1)/group_vars]
# 6
Снова запустим playbook site.yml:
![image](https://github.com/Dimarkle/DevOps/assets/118626944/a37057f7-980e-4518-9ac2-250a26adb03f)

# 7
Зашифруем значения group_vars с помощью команды ansible-vault:
![image](https://github.com/Dimarkle/DevOps/assets/118626944/c92d43a3-98d6-4f18-ae78-df3c2bac4134)

# 8
Запустим playbook с флагом --ask-vault-pass:
![image](https://github.com/Dimarkle/DevOps/assets/118626944/75d5229c-99ca-4790-8f74-017450d90d22)

# 9
Список плагинов для control node:
![image](https://github.com/Dimarkle/DevOps/assets/118626944/ca18ce12-de21-4742-9871-2c3721dff931)

# 10
Добавим localhost в prod.yml.

# 11
![image](https://github.com/Dimarkle/DevOps/assets/118626944/7e809ab6-d96f-436f-b7b5-3f084f6a2d39)
# 12 
[Ссылка](https://github.com/Dimarkle/DevOps/tree/main/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20Ansible/playbook%20(1))


