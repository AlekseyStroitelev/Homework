# Домашняя работа к занятию «Хранение в K8s. Часть 1»

### Цель задания

В тестовой среде Kubernetes нужно обеспечить обмен файлами между контейнерам пода и доступ к логам ноды.

------

### Задание 1 

**Что нужно сделать**

Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
3. Обеспечить возможность чтения файла контейнером multitool.
4. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.
5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.

### Ответ:

[deployment](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.1/deployment.yml)

Приложения запущены:

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.1/screenshots/k8s1_1.png)

Из контейнера `busybox` пишутся данные в `file.txt`, из контейнера `multitool` данный файл доступен для чтения:

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.1/screenshots/k8s1_2.png)

------

### Задание 2

**Что нужно сделать**

Создать DaemonSet приложения, которое может прочитать логи ноды.

1. Создать DaemonSet приложения, состоящего из multitool.
2. Обеспечить возможность чтения файла `/var/log/syslog` кластера MicroK8S.
3. Продемонстрировать возможность чтения файла изнутри пода.
4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.

### Ответ:

[daemonset](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.1/daemonset.yml)

Приложение запущено:

![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.1/screenshots/k8s1_3.png)

Из контейнера `multitool` файл `/var/log/syslog` доступен для чтения:

![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.1/screenshots/k8s1_4.png)

------
