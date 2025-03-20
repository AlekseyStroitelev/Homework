# Домашняя работа к занятию «Управление доступом»

### Цель задания

В тестовой среде Kubernetes нужно предоставить ограниченный доступ пользователю.

------

### Задание 1. Создайте конфигурацию для подключения пользователя

1. Создайте и подпишите SSL-сертификат для подключения к кластеру.
2. Настройте конфигурационный файл kubectl для подключения.
3. Создайте роли и все необходимые настройки для пользователя.
4. Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (`kubectl logs pod <pod_id>`, `kubectl describe pod <pod_id>`).
5. Предоставьте манифесты и скриншоты и/или вывод необходимых команд.

### Ответ:

Выпуск сертификата:

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.4/screenshots/k8s1_1.png)

Добавление пользователя в `config`:

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.4/screenshots/k8s1_2.png)

Заведение `role` и `role-binding`:

[role](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.4/role.yml)</br>
[role-binding](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.4/role-binding.yml)</br>

Добавление контекста для нового пользователя в `config`:

![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.4/screenshots/k8s1_3.png)

Переключение на контекст нового пользователя и проверка работы команд:

![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.4/screenshots/k8s1_4.png)

------
