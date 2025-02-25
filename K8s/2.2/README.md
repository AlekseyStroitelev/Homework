# Домашняя работа к занятию «Хранение в K8s. Часть 2»

### Цель задания

В тестовой среде Kubernetes нужно создать PV и продемострировать запись и хранение файлов.

------

### Задание 1

**Что нужно сделать**

Создать Deployment приложения, использующего локальный PV, созданный вручную.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.
3. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории. 
4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.
5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV.  Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.
5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

### Ответ:

Манифесты:

[Deployment-local](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.2/deployment-local.yml)<br/>
[PV-Local](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.2/pv-local.yml)<br/>
[PVC-Local](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.2/pvc-local.yml)

Сервисы стартанули, PV и PVC связались:

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.2/screenshots/k8s1_1.png)

`File.txt` доступен из контейнера `Multitool`:

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.2/screenshots/k8s1_2.png)

После удаления `Deployment-local` и `PVC-Local` статус `PV-Local` изменился с `bound` на `released`, так как больше нет ни сервисов использующих данный PV ни PVC, при этом локально на самой ноде где был выделен `volume` - данные остались:

![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.2/screenshots/k8s1_3.png)

![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.2/screenshots/k8s1_4.png)

После удаления `PV-Local` данные на выделенном volume по прежнему доступны, так как при описании `PV-Local` использовался параметр `persistentVolumeReclaimPolicy` со значением `Retain`, соответственно данные будут доступны до тех пор, пока администратор в ручную не удалит их:

![1_5](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.2/screenshots/k8s1_5.png)

------

### Задание 2

**Что нужно сделать**

Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.

1. Включить и настроить NFS-сервер на MicroK8S.
2. Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.
3. Продемонстрировать возможность чтения и записи файла изнутри пода. 
4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

### Ответ:



------
