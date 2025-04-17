# Домашняя работа к занятию «Организация сети»

### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.

 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

Resource Terraform для Yandex Cloud:

- [VPC subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet).
- [Route table](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_route_table).
- [Compute Instance](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance).

---

### Ответ:

Созданная VPC:
![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.1/screenshots/project1_1.png)

Созданные VM и NAT-instance:
![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.1/screenshots/project1_2.png)

Созданные подсети:
![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.1/screenshots/project1_3.png)

Созданная таблица маршрутизации:
![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.1/screenshots/project1_4.png)

Проверка доступности ресурсов сети интеренет с машины в подсети `public`:
![1_5](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.1/screenshots/project1_5.png)

Проверка доступности ресурсов сети интеренет с машины в подсети `private`:
![1_6](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.1/screenshots/project1_6.png)

---
