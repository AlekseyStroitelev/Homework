# Домашняя работа к занятию 15 «Система сбора логов Elastic Stack»

## Задание 1

В директории [help](./help) находится манифест docker-compose и конфигурации filebeat/logstash для быстрого 
выполнения этого задания.

Результатом выполнения задания должны быть:

- скриншот `docker ps` через 5 минут после старта всех контейнеров (их должно быть 5);
- скриншот интерфейса kibana;

### Ответ:

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/Monitoring/10-monitoring-04-elk/screenshots/moni1_1.png)

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/Monitoring/10-monitoring-04-elk/screenshots/moni1_2.png)

## Задание 2

Перейдите в меню [создания index-patterns  в kibana](http://localhost:5601/app/management/kibana/indexPatterns/create) и создайте несколько index-patterns из имеющихся.

Перейдите в меню просмотра логов в kibana (Discover) и самостоятельно изучите, как отображаются логи и как производить поиск по логам.

В манифесте директории help также приведенно dummy-приложение, которое генерирует рандомные события в stdout-контейнера.
Эти логи должны порождать индекс logstash-* в elasticsearch. Если этого индекса нет — воспользуйтесь советами и источниками из раздела «Дополнительные ссылки» этого задания.

### Ответ:

![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/Monitoring/10-monitoring-04-elk/screenshots/moni1_3.png)

![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/Monitoring/10-monitoring-04-elk/screenshots/moni1_4.png)

![1_5](https://github.com/AlekseyStroitelev/Homework/blob/main/Monitoring/10-monitoring-04-elk/screenshots/moni1_5.png)

---
