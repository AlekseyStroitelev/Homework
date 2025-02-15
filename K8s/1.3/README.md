# Домашняя работа к занятию «Запуск приложений в K8S»

### Цель задания

В тестовой среде для работы с Kubernetes, установленной в предыдущем ДЗ, необходимо развернуть Deployment с приложением, состоящим из нескольких контейнеров, и масштабировать его.

------

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
2. После запуска увеличить количество реплик работающего приложения до 2.
3. Продемонстрировать количество подов до и после масштабирования.
4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.

### Ответ:

Создан [deployment](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/deployment.yml) на два контейнера, количество реплик 1:

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/screenshots/k8s1_1.png)

Количество реплик увеличено до 2:

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/screenshots/k8s1_2.png)

Создан [service](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/service.yml):

![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/screenshots/k8s1_3.png)

Запущен отдельный [pod](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/multitool.yml) с multitool:

![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/screenshots/k8s1_4.png)

Выполнены успешные curl запросы к сервисам из п.1:

![1_5](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/screenshots/k8s1_5.png)

------

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
3. Создать и запустить Service. Убедиться, что Init запустился.
4. Продемонстрировать состояние пода до и после запуска сервиса.

### Ответ:

Создан [deployment](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/nginx-deployment.yml) для запуска `nginx` с использованием `init-контейнера`. Так как [service](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/nginx-svc.yml) еще не запущен - pod имеет статус `init`:

![1_6](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/screenshots/k8s1_6.png)

После запуска сервиса pod перешел из состояния `init` в `running`:

![1_7](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/1.3/screenshots/k8s1_7.png)

------
