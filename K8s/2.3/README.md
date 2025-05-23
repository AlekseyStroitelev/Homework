# Домашняя работа к занятию «Конфигурация приложений»

### Цель задания

В тестовой среде Kubernetes необходимо создать конфигурацию и продемонстрировать работу приложения.

------

### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

1. Создать Deployment приложения, состоящего из контейнеров nginx и multitool.
2. Решить возникшую проблему с помощью ConfigMap.
3. Продемонстрировать, что pod стартовал и оба контейнера работают.
4. Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.
5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

### Ответ:

[ConfigMap](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/configmap.yml)</br>
[Deployment](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/deployment.yml)</br>
[Service](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/service.yml)</br>

Задание №1 выполнено по пунктам, результат на скриншоте:

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/screenshots/k8s1_1.png)

------

### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS 

1. Создать Deployment приложения, состоящего из Nginx.
2. Создать собственную веб-страницу и подключить её как ConfigMap к приложению.
3. Выпустить самоподписанный сертификат SSL. Создать Secret для использования сертификата.
4. Создать Ingress и необходимый Service, подключить к нему SSL в виде ConfigMap. Продемонстрировать доступ к приложению по HTTPS. 
5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

### Ответ:

[Nginx-ConfigMap](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/nginx-configmap.yaml)</br>
[Nginx-Deployment](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/nginx-deployment.yml)</br>
[Nginx-Service](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/nginx-service.yml)</br>
[Nginx-Ingress](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/nginx-ingress.yaml)</br>
[Nginx-Secret](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/nginx-secret.yml)</br>

Задание №2 выполнено по пунктам, результат запроса по https:

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.3/screenshots/k8s1_2.png)

------
