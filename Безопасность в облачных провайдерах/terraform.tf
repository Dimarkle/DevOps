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

# Создаем ресурсы для ключа
resource "yandex_resourcemanager_folder_iam_member" "sa-editor-encrypter-decrypter" {
  folder_id = var.folder_id
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${yandex_iam_service_account.bucket-sa.id}"
}

resource "yandex_kms_symmetric_key" "key-1" {
  name              = "key-1"
  description       = "Bucket Encryption Key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" # 1 Year
}


# Создаем бакет с указанными ключами доступа
resource "yandex_storage_bucket" "vp-bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "vp-netology-test-bucket"

  max_size = 1073741824 # 1 Gb

  anonymous_access_flags {
    read = true
    list = false
  }
# Прописываем ключ
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-1.id
        sse_algorithm     = "aws:kms"
      }
    }
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

# Выводим полученные данные
output "pic-url" {
  value = "https://${yandex_storage_bucket.vp-bucket.bucket_domain_name}/${yandex_storage_object.my-picture.key}"
  description = "Адрес загруженной в бакет картинки"
}

