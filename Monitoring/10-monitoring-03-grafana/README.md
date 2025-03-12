# Домашняя работа к занятию 14 «Средство визуализации Grafana»

### Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
2. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
3. Подключите поднятый вами prometheus, как источник данных.
4. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

### Ответ:

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/Monitoring/10-monitoring-03-grafana/screenshots/moni1_1.png)

## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
2. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
3. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);
- CPULA 1/5/15;
- количество свободной оперативной памяти;
- количество места на файловой системе.

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

### Ответ:

- утилизация CPU: `100 - (avg by (instance) (rate(node_cpu_seconds_total{job="nodeexporter",mode="idle"}[1m])) * 100)`
- load average 1m: `node_load1{instance="nodeexporter:9100",job="nodeexporter"}`
- load average 5m: `node_load5{instance="nodeexporter:9100",job="nodeexporter"}`
- load average 15m: `node_load15{instance="nodeexporter:9100",job="nodeexporter"}`
- количество свободной оперативной памяти `node_memory_MemAvailable_bytes{instance="nodeexporter:9100",job="nodeexporter"} / (1024 * 1024)`
- количество места на файловой системе: Total `node_filesystem_avail_bytes{mountpoint="/",instance="nodeexporter:9100",job="nodeexporter"} / (1024 * 1024 * 1024)`
  Available `node_filesystem_size_bytes{mountpoint="/",instance="nodeexporter:9100",job="nodeexporter"} / (1024 * 1024 * 1024)`

![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/Monitoring/10-monitoring-03-grafana/screenshots/moni1_2.png)

## Задание 3

1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
2. В качестве решения задания приведите скриншот вашей итоговой Dashboard.

### Ответ:

![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/Monitoring/10-monitoring-03-grafana/screenshots/moni1_3.png)

## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
2. В качестве решения задания приведите листинг этого файла.

### Ответ:

[dashboar.json](https://github.com/AlekseyStroitelev/Homework/blob/main/Monitoring/10-monitoring-03-grafana/dashboard.json)

---
