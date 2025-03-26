# Домашняя работа к занятию «Helm»

### Цель задания

В тестовой среде Kubernetes необходимо установить и обновить приложения с помощью Helm.

------

### Задание 1. Подготовить Helm-чарт для приложения

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения. 
2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.
3. В переменных чарта измените образ приложения для изменения версии.

### Ответ:

Для выполнения задания использован helm-chart nginx.

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.5/screenshots/k8s1_1.png)

------

### Задание 2. Запустить две версии в разных неймспейсах

1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.
2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.
3. Продемонстрируйте результат.

### Ответ:

Создадим два `namespace`, app1 и app2:

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.5/screenshots/k8s1_2.png)

Запустим несколько версий приложения согласно заданию:

![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.5/screenshots/k8s1_3.png)

Приложения запущены и имеют статус `deployed`:

![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/K8s/2.5/screenshots/k8s1_4.png)

------
