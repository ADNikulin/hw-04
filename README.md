# 19.4 Облачная инфраструктура. Terraform.  Никулин Александр
# Домашнее задание к занятию «Продвинутые методы работы с Terraform»

<details>
  <summary>Исходники задания</summary>

  # hw-04
  https://github.com/netology-code/ter-homeworks/blob/main/04/hw-04.md
</details>

### Цели задания

1. Научиться использовать модули.
2. Отработать операции state.
3. Закрепить пройденный материал.


### Чек-лист готовности к домашнему заданию
<details>
  <summary>Раскрыть</summary>

  1. Зарегистрирован аккаунт в Yandex Cloud. Использован промокод на грант.
  2. Установлен инструмент Yandex CLI.
  3. Исходный код для выполнения задания расположен в директории [**04/src**](https://github.com/netology-code/ter-homeworks/tree/main/04/src).
  4. Любые ВМ, использованные при выполнении задания, должны быть прерываемыми, для экономии средств.

</details>
------

### Задание 1
<details>
  <summary>Раскрыть</summary>

  1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания с помощью двух вызовов remote-модуля -> двух ВМ, относящихся к разным проектам(marketing и analytics) используйте labels для обозначения принадлежности.  В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
  Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
  3. Добавьте в файл cloud-init.yml установку nginx.
  4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```, скриншот консоли ВМ yandex cloud с их метками. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.marketing_vm
     >
     > ![image](https://github.com/user-attachments/assets/8b69a211-c93b-403f-9916-4f71a91c8740)
     > ![image](https://github.com/user-attachments/assets/5916a996-5dcc-4b06-9a02-99ee07772932)
     > ![image](https://github.com/user-attachments/assets/fec3d5d7-0c35-4d30-b7d1-0f544505d7aa)
     > ![image](https://github.com/user-attachments/assets/089af575-e404-4632-b02f-076d753122ed)
  5. [Tag Solution-1](https://github.com/ADNikulin/hw-04/tree/solution-1)

</details>

### Задание 2
<details>
  <summary>Раскрыть</summary>

  1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
     > ![image](https://github.com/user-attachments/assets/d6052cfc-9e0a-4270-af25-d591e2031669) \
     > ![image](https://github.com/user-attachments/assets/3e325017-8dfa-4ed5-a311-5a6deae1e3ca)

  2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
     > ![image](https://github.com/user-attachments/assets/2b4d7936-2e5e-4e03-acff-b88c2929d1e4)

  3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev
     > ![image](https://github.com/user-attachments/assets/4ffdfd6b-0cf0-4904-8bb4-27f526c81c44) \
     > ![image](https://github.com/user-attachments/assets/69af52cb-6d27-474c-bd12-91b324a70d51)

  4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
     > ![image](https://github.com/user-attachments/assets/a0ecd140-b8a8-48f5-a412-6a7806b246ec) \
     > ![image](https://github.com/user-attachments/assets/bdf480e0-d9e4-4c54-afec-d75de48415a3) \
     > ![image](https://github.com/user-attachments/assets/95b188ec-43c0-417d-bfac-c7208ae1d5ad) \
     > ![image](https://github.com/user-attachments/assets/b33ba161-bcf6-4dae-b6d9-f64f595273a1) 

  5. Сгенерируйте документацию к модулю с помощью terraform-docs.
     > [пример](https://github.com/ADNikulin/hw-04/blob/solution-2/requiremets.md)

  6. [Tag Solution-2](https://github.com/ADNikulin/hw-04/tree/solution-2)

</details>

### Задание 3
<details>
  <summary>Раскрыть</summary>

  1. Выведите список ресурсов в стейте.
     > ![image](https://github.com/user-attachments/assets/e813d5bf-d5da-4bc1-bda7-3258f86a17d5)

  3. Полностью удалите из стейта модуль vpc.
     > ![image](https://github.com/user-attachments/assets/fc5048d6-5fd1-4cdb-95c7-6a51c9ec5e02)

  5. Полностью удалите из стейта модуль vm.
     > ![image](https://github.com/user-attachments/assets/e01d45ee-c8ed-434e-8af2-036bb0afa76f)

  7. Импортируйте всё обратно. Проверьте terraform plan. Значимых(!!) изменений быть не должно.
     > ![image](https://github.com/user-attachments/assets/d36f3441-de77-4c6f-9da7-de54c651c68a) \
     > ![image](https://github.com/user-attachments/assets/19e017b6-f533-4d80-984b-eebfc085ddcd) \
     > ![image](https://github.com/user-attachments/assets/86071a80-c12d-4b9b-91c7-a678bf573419) \
     > ![image](https://github.com/user-attachments/assets/ed17998e-3ba8-4398-aba7-d3fcb0153421) \
     > ![image](https://github.com/user-attachments/assets/08509649-c562-49ef-a15a-ae3a6d64cbd3)

  8. [Tag Solution-3](https://github.com/ADNikulin/hw-04/tree/solution-3)
</details>

## Дополнительные задания (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.**   Они помогут глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 


### Задание 4*
<details>
  <summary>Раскрыть</summary>

  1. Измените модуль vpc так, чтобы он мог создать подсети во всех зонах доступности, переданных в переменной типа list(object) при вызове модуля.  
    
  Пример вызова
  ```
  module "vpc_prod" {
    source       = "./vpc"
    env_name     = "production"
    subnets = [
      { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
      { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
      { zone = "ru-central1-c", cidr = "10.0.3.0/24" },
    ]
  }

  module "vpc_dev" {
    source       = "./vpc"
    env_name     = "develop"
    subnets = [
      { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    ]
  }
  ```

  Предоставьте код, план выполнения, результат из консоли YC.

  > Сделал примитивный вариант: где нет проверок на уникальность элементов из входящего массива. и + исправил выходные данные
  > ![image](https://github.com/user-attachments/assets/a57f3e16-f82f-4f20-a0db-14136eb64299) \
  > ![image](https://github.com/user-attachments/assets/2d909487-8cf3-4ec0-89f3-56c43558fd4d) \
  > ![image](https://github.com/user-attachments/assets/3d423b25-a971-434c-b829-e1d1e0dbb632) \
  > ![image](https://github.com/user-attachments/assets/ffc1e675-2578-42cb-a2ae-459cfdfda72b) \
  > ![image](https://github.com/user-attachments/assets/2659aaba-7f7e-4bc3-a131-794d19d3b36f) \

  
  > [Tag Solution-4](https://github.com/ADNikulin/hw-04/tree/solution-4)

</details>

### Задание 5*
<details>
  <summary>Раскрыть</summary>

  1. Напишите модуль для создания кластера managed БД Mysql в Yandex Cloud с одним или несколькими(2 по умолчанию) хостами в зависимости от переменной HA=true или HA=false. Используйте ресурс yandex_mdb_mysql_cluster: передайте имя кластера и id сети.
  2. Напишите модуль для создания базы данных и пользователя в уже существующем кластере managed БД Mysql. Используйте ресурсы yandex_mdb_mysql_database и yandex_mdb_mysql_user: передайте имя базы данных, имя пользователя и id кластера при вызове модуля.
  3. Используя оба модуля, создайте кластер example из одного хоста, а затем добавьте в него БД test и пользователя app. Затем измените переменную и превратите сингл хост в кластер из 2-х серверов.
  4. Предоставьте план выполнения и по возможности результат. Сразу же удаляйте созданные ресурсы, так как кластер может стоить очень дорого. Используйте минимальную конфигурацию.
  5. [Tag Solution-5](https://github.com/ADNikulin/hw-04/tree/solution-5)

</details>

### Задание 6*
<details>
  <summary>Раскрыть</summary>

  1. Используя готовый yandex cloud terraform module и пример его вызова(examples/simple-bucket): https://github.com/terraform-yc-modules/terraform-yc-s3 .
  Создайте и не удаляйте для себя s3 бакет размером 1 ГБ(это бесплатно), он пригодится вам в ДЗ к 5 лекции.
  2. [Tag Solution-6](https://github.com/ADNikulin/hw-04/tree/solution-6)
   
</details>

### Задание 7*
<details>
  <summary>Раскрыть</summary>

  1. Разверните у себя локально vault, используя docker-compose.yml в проекте.
     > ![image](https://github.com/user-attachments/assets/333b43eb-8077-48f4-a28f-1b8120359e15)
     > ![image](https://github.com/user-attachments/assets/7ad8d8b6-cf96-4b77-8acc-f5b4b206b74d)
  2. Для входа в web-интерфейс и авторизации terraform в vault используйте токен "education".
     > ![image](https://github.com/user-attachments/assets/21d0acc8-6f4f-4fe9-8f13-c19fad1e4c59)
     
  3. Создайте новый секрет по пути http://127.0.0.1:8200/ui/vault/secrets/secret/create
     Path: example  
     secret data key: test 
     secret data value: congrats!
     > ![image](https://github.com/user-attachments/assets/489cd5a5-e8d0-4f89-970d-771a54d22e55)

  4. Считайте этот секрет с помощью terraform и выведите его в output по примеру:
     ```
     provider "vault" {
      address = "http://<IP_ADDRESS>:<PORT_NUMBER>"
      skip_tls_verify = true
      token = "education"
     }

     data "vault_generic_secret" "vault_example"{
      path = "secret/example"
     }

     output "vault_example" {
      value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
     } 

     Можно обратиться не к словарю, а конкретному ключу:
     terraform console: >nonsensitive(data.vault_generic_secret.vault_example.data.<имя ключа в секрете>)
     ```
     > ![image](https://github.com/user-attachments/assets/f577400e-7fe2-488a-9290-d8d3ff0f0f0e)
     > ![image](https://github.com/user-attachments/assets/988ac74a-4623-45ec-b6c8-7a2a5dcbc03e)

5. Попробуйте самостоятельно разобраться в документации и записать новый секрет в vault с помощью terraform.
   > ![image](https://github.com/user-attachments/assets/ac735fbd-758f-4dc7-9172-b8ca9a36d76d)
   > ![image](https://github.com/user-attachments/assets/4167fb0f-5121-4829-997c-db28a2456d97)
   > ![image](https://github.com/user-attachments/assets/c01893fd-d246-4ea6-b0ce-cd688fd77a3a)

7. [Tag Solution-7](https://github.com/ADNikulin/hw-04/tree/solution-7)
   
</details>

### Задание 8*
<details>
  <summary>Раскрыть</summary>

  Попробуйте самостоятельно разобраться в документаци и с помощью terraform remote state разделить root модуль на два отдельных root-модуля: создание VPC , создание ВМ . 
  
</details>
