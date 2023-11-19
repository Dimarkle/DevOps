# Домашнее задание к занятию 11 «Teamcity»


# Подготовка к выполнению


* Создаем сборку

![Без имени3](https://github.com/Dimarkle/DevOps/assets/118626944/a5dc77a9-a772-45c5-a92a-dff0c6dbd4ed)


*  Создаем репозиторий

[РЕПОЗИТОРИЙ](https://github.com/Dimarkle/example-teamcity/tree/master)


* Авторизуем агент.

![Без имени](https://github.com/Dimarkle/DevOps/assets/118626944/1aeec742-fd70-4124-b1ef-e445293641f8)

# Основная часть 

* Создаем новый проект в teamcity

![1](https://github.com/Dimarkle/DevOps/assets/118626944/f96cd476-2c38-4485-80e6-dd318ad2d507)

* autodetect конфигурации
  
![kk'''](https://github.com/Dimarkle/DevOps/assets/118626944/3abebfc8-14d5-45e1-b498-d415053dd5fd)


* Запускаем первую сборку master.


![jjjj](https://github.com/Dimarkle/DevOps/assets/118626944/fbda35df-d4a5-4127-a5b5-e7bc705624b9)

* Для deploy будет необходимо загрузить settings.xml в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus

  
![ggggggg](https://github.com/Dimarkle/DevOps/assets/118626944/38bf48b4-2803-43f0-97af-04c0845064c4)

* Запускаем сборку по master и артефакт появился в nexus.

![hhhhfgdghf](https://github.com/Dimarkle/DevOps/assets/118626944/3872e22d-189e-4f49-9a2e-6997da638ebe)


* Мигрируем build configuration в репозиторий.

![kkk](https://github.com/Dimarkle/DevOps/assets/118626944/2ff7fbad-208c-4c46-bb19-089cf2b00dad)

* Создаем отдельную ветку feature/add_reply в репозитории.

* Настраиваем конфигурацию так, чтобы она собирала .jar в артефакты сборки.

![image](https://github.com/Dimarkle/DevOps/assets/118626944/758d842d-9fae-4bd0-afbd-3bd8a700b314)

* Проводим повторную сборку мастера, сборка прошла успешно и артефакты собраны.

![image](https://github.com/Dimarkle/DevOps/assets/118626944/765b8f8b-dfa6-49ca-942e-b11bfbf26924)



[РЕПОЗИТОРИЙ](https://github.com/Dimarkle/example-teamcity/tree/feature/add_reply)



