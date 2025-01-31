# Домашняя работа к занятию «Базовые объекты K8S»

### Цель задания

В тестовой среде для работы с Kubernetes, установленной в предыдущем ДЗ, необходимо развернуть Pod с приложением и подключиться к нему со своего локального компьютера. 

------

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod.
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

### Ответ:

[Манифест hello-world](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.2/hello-world.yml)

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.2/screenshots/k8s1_1.png)

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.2/screenshots/k8s1_2.png)

------

### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

### Ответ:

[Манифест netology-web](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.2/netology-web.yml)
[Манифест netology-svc](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.2/netology-svc.yml)

![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.2/screenshots/k8s1_3.png)

![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.2/screenshots/k8s1_4.png)
