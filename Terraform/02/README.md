# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

### Цели задания

1. Создать свои ресурсы в облаке Yandex Cloud с помощью Terraform.
2. Освоить работу с переменными Terraform.

### Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.
Убедитесь что ваша версия **Terraform** ~>1.8.4

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Создайте сервисный аккаунт и ключ. [service_account_key_file](https://terraform-provider.yandexcloud.net).

### Ответ:
Создал сервисный аккаунт и ключ для него:

![02_1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_1_2.png)

4. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную **vms_ssh_public_root_key**.
5. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.

### Ответ:
Не корректное значение аргумента `platform_id` в блоке `resource "yandex_compute_instance" "platform"`, не существует платформы с таким id как `standart-v4`. Перечень доступных платформ и их конфигурации есть в [документации](https://yandex.cloud/ru/docs/compute/concepts/performance-levels). Поправил значения для `platform_id`, и значения для аргументов блока `resources`. `terraform apply` отработала без ошибок.

![02_1_5.1](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_1_5.1.png)

Виртуальная машина в Yandex Cloud:

![02_1_5.2](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_1_5.2.png)

6. Подключитесь к консоли ВМ через ssh и выполните команду ``` curl ifconfig.me```.
Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: ```"ssh ubuntu@vm_ip_address"```. Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: ```eval $(ssh-agent) && ssh-add``` Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;

### Ответ:
 ![02_1_6 ](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_1_6.png)

8. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ.

### Ответ:
Данные параметры могут пригодиться для экономии облачных ресурсов, `preemtible = true` позволяет создать прерываемую ВМ, которая будет выключена через 24 часа после старта, данная опция снижает стоимость виртуальной машины. Параметр `core_fraction=5` устанавливает базовую производительность для ядра в процентах, так же помогает экономить ресурсы.


### Задание 2

1. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
3. Проверьте terraform plan. Изменений быть не должно.

### Ответ:
Добавил переменные, прописал их значения, `terraform plan` изменений не нашел:

![02_2](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_2.png)


### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  ```cores  = 2, memory = 2, core_fraction = 20```. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').  ВМ должна работать в зоне "ru-central1-b"
3. Примените изменения.

### Ответ:
Переменные добавлены, `main.tf` - доработан, `terraform apply` отработала без ошибок, создана сеть, две подсети и две виртуальные машины:

![02_3_1](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_3_1.png)
![02_3_2](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_3_2.png)
![02_3_3](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_3_3.png)


### Задание 4

1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.

### Ответ:
Результат работы комманды `terraform output`:

![02_4](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_4.png)


### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
2. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
3. Примените изменения.

### Ответ:
Изменения применил, `terraform plan` изменений не нашел:
![02_5_1](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_5_1.png)
![02_5_2](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_5_2.png)
![02_5_3](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_5_3.png)
![02_5_4](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_5_4.png)


### Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в единую map-переменную **vms_resources** и  внутри неё конфиги обеих ВМ в виде вложенного map(object).  
   ```
   пример из terraform.tfvars:
   vms_resources = {
     web={
       cores=2
       memory=2
       core_fraction=5
       hdd_size=10
       hdd_type="network-hdd"
       ...
     },
     db= {
       cores=2
       memory=4
       core_fraction=20
       hdd_size=10
       hdd_type="network-ssd"
       ...
     }
   }
   ```
3. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.
   ```
   пример из terraform.tfvars:
   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }
   ```  
  
5. Найдите и закоментируйте все, более не используемые переменные проекта.
6. Проверьте terraform plan. Изменений быть не должно.

### Ответ:
`map(object)` добавлены, `terraform plan` изменений не видит:
![02_6_1](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_6_1.png)
![02_6_2](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/02/screenshots/Terraform02_6_2.png)

