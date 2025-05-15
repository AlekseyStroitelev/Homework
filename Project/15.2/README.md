# Домашняя работа к занятию «Вычислительные мощности. Балансировщики нагрузки»  

---

## Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.
 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.
 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.

---

### Ответ:

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Созданный bucket:</br>
 ![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.2/screenshots/project1_1.png)</br>

 - Файл с картинкой, доступный из интернета:</br>
 ![1_2](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.2/screenshots/project1_2.png)</br>

2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создана Group Instance:</br>
 ![1_3](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.2/screenshots/project1_3.png)</br>

 - Три машины в группе:</br>
 ![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.2/screenshots/project1_4.png)</br>

3. Подключить группу к сетевому балансировщику:

 - Создан сетевой балансировщик с IP-адресом `51.250.41.104`</br>
 ![1_5](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.2/screenshots/project1_5.png)</br>

 - Целевая группа подключена к балансировщику:</br>
 ![1_6](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.2/screenshots/project1_6.png)</br>

 - При удалении машин балансировщик шлет запросы на другую живую машину в группе:</br>
 ![1_7](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.2/screenshots/project1_7.png)</br>

 ![1_8](https://github.com/AlekseyStroitelev/Homework/blob/main/Project/15.2/screenshots/project1_8.png)</br>
