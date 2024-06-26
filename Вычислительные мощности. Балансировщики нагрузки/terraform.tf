terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  
}

# 1
# Создание бакета и картинки.

# Сервисный аккаунт для управления бакетом
resource "yandex_iam_service_account" "bucket-sa" {
  name        = "bucket-sa"
  description = "сервисный аккаунт s3"
}

# Выдаем роль сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket-sa.id}"
}

# Создаем ключи доступа для сервисного аккаунта
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.bucket-sa.id
  description        = "static access key for object storage"
}

## Создаем бакет с указанными ключами доступа
resource "yandex_storage_bucket" "vp-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "vp-netology-test-bucket"

  max_size = 1073741824 # 1 Gb

  anonymous_access_flags {
    read = true
    list = false
  }
}

# Загрузка картинки в бакет
resource "yandex_storage_object" "my-picture" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = yandex_storage_bucket.vp-bucket.id
  key        = "my-picture.jpg"
  source     = var.my_picture
}

# 2
# Группа ВМ

# Сеть для ВМ
resource "yandex_vpc_network" "network-netology" {
  name = "network-netology"
}

# Публичная подсеть
resource "yandex_vpc_subnet" "public" {
  name           = "public"
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = var.yc_region
  network_id     = yandex_vpc_network.network-netology.id
}

# Сервисный аккаунт для группы ВМ
resource "yandex_iam_service_account" "ig-sa" {
  name        = "ig-sa"
  description = "сервисный аккаунт для управления группой ВМ"
}

# Назначаем роль editor сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
}

# Группа ВМ
resource "yandex_compute_instance_group" "vp-nlb-ig" {
  name               = "vp-nlb-ig"
  folder_id          = var.folder_id
  service_account_id = "${yandex_iam_service_account.ig-sa.id}"
  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      initialize_params {
        image_id = "fd827b91d99psvq5fjit" # LAMP image
      }
    }

    network_interface {
      network_id = "${yandex_vpc_network.network-netology.id}"
      subnet_ids = ["${yandex_vpc_subnet.public.id}"]
    }

    metadata = {
      ssh-keys  = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
      user-data = "#!/bin/bash\n cd /var/www/html\n echo \"<html><h1>Network load balanced web-server</h1><img src='https://${yandex_storage_bucket.vp-bucket.bucket_domain_name}/${yandex_storage_object.my-picture.key}'></html>\" > index.html"
    }

    labels = {
      group = "network-load-balanced"
    }

    scheduling_policy {
      preemptible = true
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [var.yc_region]
  }

  deploy_policy {
    max_unavailable = 2
    max_expansion   = 1
  }

  health_check {
    interval = 2
    timeout = 1
    healthy_threshold = 5
    unhealthy_threshold = 2
    http_options {
      path = "/"
      port = 80
    }
  }

  load_balancer {
    target_group_name        = "vp-target-nlb-group"
    target_group_description = "Целевая группа для сетевого балансировщика"
  }
}

# 3

# Сетевой балансировщик
resource "yandex_lb_network_load_balancer" "vp-nlb-1" {
  name = "network-load-balancer-1"

  listener {
    name = "network-load-balancer-1-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.vp-nlb-ig.load_balancer.0.target_group_id

    healthcheck {
      name = "http"
      interval = 2
      timeout = 1
      unhealthy_threshold = 2
      healthy_threshold = 5
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}


# Выводим полученные данные
output "pic-url" {
  value = "https://${yandex_storage_bucket.vp-bucket.bucket_domain_name}/${yandex_storage_object.my-picture.key}"
  description = "Адрес загруженной в бакет картинки"
}

output "nlb-address" {
  value = yandex_lb_network_load_balancer.vp-nlb-1.listener.*.external_address_spec[0].*.address
  description = "Адрес(а) сетевого балансировщика"
}