# Домашнее задание к занятию 4 «Оркестрация группой Docker контейнеров на примере Docker Compose»

## Задача 1

Сценарий выполнения задачи:
- Установите docker и docker compose plugin на свою linux рабочую станцию или ВМ.
- Если dockerhub недоступен создайте файл /etc/docker/daemon.json с содержимым: ```{"registry-mirrors": ["https://mirror.gcr.io", "https://daocloud.io", "https://c.163.com/", "https://registry.docker-cn.com"]}```
- Зарегистрируйтесь и создайте публичный репозиторий  с именем "custom-nginx" на https://hub.docker.com (ТОЛЬКО ЕСЛИ У ВАС ЕСТЬ ДОСТУП);
- скачайте образ nginx:1.21.1;
- Создайте Dockerfile и реализуйте в нем замену дефолтной индекс-страницы(/usr/share/nginx/html/index.html), на файл index.html с содержимым:
```
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I will be DevOps Engineer!</h1>
</body>
</html>
```
- Соберите и отправьте созданный образ в свой dockerhub-репозитории c tag 1.0.0 (ТОЛЬКО ЕСЛИ ЕСТЬ ДОСТУП). 
- Предоставьте ответ в виде ссылки на https://hub.docker.com/<username_repo>/custom-nginx/general.

### Ответ:

[Ссылка на созданный образ](https://hub.docker.com/repository/docker/makaron7321/custom-nginx/general)

## Задача 2

1. Запустите ваш образ custom-nginx:1.0.0 командой docker run в соответвии с требованиями:
- имя контейнера "ФИО-custom-nginx-t2"
- контейнер работает в фоне
- контейнер опубликован на порту хост системы 127.0.0.1:8080
2. Не удаляя, переименуйте контейнер в "custom-nginx-t2"
3. Выполните команду ```date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; docker logs custom-nginx-t2 -n1 ; docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html```
4. Убедитесь с помощью curl или веб браузера, что индекс-страница доступна.

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

### Ответ:

[docker2](https://github.com/AlekseyStroitelev/Homework/blob/main/Virtualization/05-virt-03-docker-intro/screenshots/docker2.png)

## Задача 3
3. Выполните `docker ps -a` и объясните своими словами почему контейнер остановился. `В данный момент выполнялась команда docker attach, сочетанием клавишь Ctrl-C мы передали SIGINT что и повлекло за собой остановку контейнера.`
10. Проверьте вывод команд: `ss -tlpn | grep 127.0.0.1:8080` , `docker port custom-nginx-t2`, `curl http://127.0.0.1:8080`. Кратко объясните суть возникшей проблемы. `Проблема в том, что при первом запуске контейнера мы сделали мапинг портов с 8080 на 80 порт, который по умолчанию слушает nginx. Так как мы руками поменяли номер порта в конфиге nginx, мапинг работать перестал ибо nginx стал слушать порт 81 и не ожидает запросов через порт 80.`

## Задача 5
1. Какой из файлов был запущен и почему? `По умолчанию Compose берет для выполнения compose.yml, он и был запущен, так же, для обеспечения обратной совместимости, реализована поддержка docker-compose.yml. Если в директории присутствуют оба файла и в compose.yml через INCLUDE не прописан docker-compose.yml - запускаться будет только compose.yml.`
7. Прочитайте warning, объясните суть предупреждения и выполните предложенное действие. `Последствия удаления одного из манифестов, если выполнить команду docker compose up -d --remove-orphans проект будет перезапущен а устаревший контейнер будет удален.`