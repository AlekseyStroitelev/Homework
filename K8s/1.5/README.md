# Домашняя работа к занятию «Сетевое взаимодействие в K8S. Часть 2»

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к двум приложениям снаружи кластера по разным путям.

------

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool. 
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

### Ответ:

Манифесты:

[nginx-deployment](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/nginx-deployment.yml)<br/>
[multitool-deployment](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/multitool-deployment.yml)<br/>
[nginx-service](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/nginx-service.yml)<br/>
[multitool-service](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/multitool-service.yml)<br/>

Приложения развернуты:

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/screenshots/k8s1_1.png)

Приложения видят друг друга через `service`:

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/screenshots/k8s1_2.png)

![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/screenshots/k8s1_3.png)

------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
4. Предоставить манифесты и скриншоты или вывод команды п.2.

### Ответ:

[ingress](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/ingress.yml)<br/>

![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/screenshots/k8s1_4.png)

![1_5](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.5/screenshots/k8s1_5.png)

------
