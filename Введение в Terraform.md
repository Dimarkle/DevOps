# Задание 1

* 2
  
Файл для хранения секретной информации  personal.auto.tfvars
```
# Local .terraform directories and files
**/.terraform/*
.terraform*

# .tfstate files
*.tfstate
*.tfstate.*

# own secret vars store.
personal.auto.tfvars 

```
* 3
___
![3](https://github.com/Dimarkle/DevOps/assets/118626944/11585e94-05be-4cca-8458-05654a37f4c1)
___
![3a](https://github.com/Dimarkle/DevOps/assets/118626944/8b261c78-0008-4418-9c8d-bd3d599145da)
___

* 4 

![4](https://github.com/Dimarkle/DevOps/assets/118626944/7fa5cb8a-3c2e-45ee-bac9-662adeeaa45f)
___

```resource "docker_image" ```  - не указано имя блока

 ``` resource "docker_container" "1nginx" ```  - орфографическая ошибка, лишняя 1

``` name  = "example_${random_password.random_string_fake.resuld}"  ``` - не верно указано имя
Правильный код 
```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "hello_world" {
  image = docker_image.nginx.image_id
  name  = "nginx"

  ports {
    internal = 80
    external = 8000
  }
}
```
* 5
![6](https://github.com/Dimarkle/DevOps/assets/118626944/ec5806ee-1e76-4519-9d3f-60be395195eb)

* 6
![5](https://github.com/Dimarkle/DevOps/assets/118626944/6e5e05b1-fe4d-488c-bdeb-3b6086cda11a)

terraform apply –auto-approve:  создает или обновляет инфраструктуру без согласия пользователя (yеs)

*7

![7](https://github.com/Dimarkle/DevOps/assets/118626944/a1ec908f-9a27-447f-9618-1773f9f29ee3)

Jбраз docker не был удален, так как он не относится к инфраструктуре создаваемой terraform




