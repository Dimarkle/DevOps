# Домашнее задание к занятию 9 «Процессы CI/CD»

# Подготовка к выполнению

* Создаем  две VM в Yandex Cloud

![image](https://github.com/Dimarkle/DevOps/assets/118626944/2d59d811-a946-4ea8-986d-ca1258f60ac2)



* Пропишите в inventory playbook созданные хосты.




 * Запустите playbook, ожидайте успешного завершения.

![image](https://github.com/Dimarkle/DevOps/assets/118626944/4dad6613-129d-4646-89b9-24400b5599bd)

# SonarQube

![image](https://github.com/Dimarkle/DevOps/assets/118626944/db49eede-5052-424b-bf6e-c4e96ad3ca3f)

* Проверьте sonar-scanner --version
  
```
sonar-scanner --version
INFO: Scanner configuration file: /home/diman/tmp/sonar-scanner-4.8.0.2856-linux/conf/sonar-scanner.properties
INFO: Project root configuration file: NONE
INFO: SonarScanner 4.8.0.2856
INFO: Java 11.0.17 Eclipse Adoptium (64-bit)
INFO: Linux 5.15.0-76-generic amd64
```
* Посмотрел результат в интерфейсе.
  
![image](https://github.com/Dimarkle/DevOps/assets/118626944/0fb43985-ec1a-44b1-a7f8-7d455404f51f)

* Внёс правки - fail.py

* Успешный анализ 

![image](https://github.com/Dimarkle/DevOps/assets/118626944/729e455f-e521-4c23-82e3-9f5b4a0a8571)

# Знакомство с Nexus


![image](https://github.com/Dimarkle/DevOps/assets/118626944/4e1897d8-6e14-4ecc-9fb7-6ed281a251ad)




![image](https://github.com/Dimarkle/DevOps/assets/118626944/11e54716-b5ef-4d26-aa7a-8c51c2238eb9)

* файл (maven-metadata.xml)[https://github.com/Dimarkle/DevOps/blob/main/%D0%9F%D1%80%D0%BE%D1%86%D0%B5%D1%81%D1%81%D1%8B%20CI/maven-metadata.xml] 


# Знакомство с Maven


* файл pom.xml



