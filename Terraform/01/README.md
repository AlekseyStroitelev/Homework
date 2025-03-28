# Домашнее задание к занятию «Введение в Terraform»

### Цели задания

1. Установить и настроить Terrafrom.
2. Научиться использовать готовый код.

------

### Чек-лист готовности к домашнему заданию

1. Скачайте и установите **Terraform** версии >=1.8.4 . Приложите скриншот вывода команды ```terraform --version```.
2. Скачайте на свой ПК этот git-репозиторий. Исходный код для выполнения задания расположен в директории src.
3. Убедитесь, что в вашей ОС установлен docker.

### Ответ:

Terraform и Docker установлены:

![check](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/01/screenshots/Terraform_check.png)

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Репозиторий с ссылкой на зеркало для установки и настройки Terraform: [ссылка](https://github.com/netology-code/devops-materials).
2. Установка docker: [ссылка](https://docs.docker.com/engine/install/ubuntu/). 
------
### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
------

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте.

### Ответ:

![1_1](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/01/screenshots/Terraform1_1.png)

2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)

### Ответ:

Чувствительные данные, в данном случае, можно сохранить в файл `personal.auto.tfvars`. Так как данный файл имеет вид `*.auto.tfvars`, terraform при выполнении команд будет подключать его автоматически.

3. Выполните код проекта. Найдите  в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.

### Ответ:

`"result": "zQLXb38bIffLs1UC"`

4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

### Ответ:

![1_4](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/01/screenshots/Terraform1_4.png)

`Первая ошибка говорит нам о том, что в блоке типа resource не хватает имени. Данный блок должен содержать две метки, первая указывает на тип ресурса провайдера docker, вторая является произвольным именем данного ресурса.` - исправил.
`Вторая ошибка говорит о не корректном имени ресурса. По умолчанию, имя может начинаться только с буквы или подчеркивания. В нашем случае 1nginx - не верно. Так же в теле данного блока была ошибка в значении аргумента: name  = "example_${random_password.random_string_FAKE.resulT}" - не верно, должно быть так: name  = "example_${random_password.random_string.result}"` - конечно в данном случае значение name не является настоящим паролем и скорее служит примером присваения значения из переменной, но для эстетики исправил.

5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.

### Ответ:

```
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx_image.name
  name  = "nginx"

  ports {
    internal = 80
    external = 9090
  }
}
```

![1_5](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/01/screenshots/Terraform1_5.png)

6. Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды ```docker ps```.

### Ответ:

`Запуская команду terraform apply, перед тем как она будет выполнена, у нас есть возиожность увидеть в консоли все изменения которые будут произведены и в случае если, по какой-то причине, была допущена ошибка при написании *.tf файла, мы можем не отвечать yes и не допустить нежелательных изменений. Если же terraform apply запускается автоматически(например скриптом), а не в ручную, то использование данного ключа - необходимо, в противном случае выполнение команды будет прервано.`

![1_6](https://github.com/AlekseyStroitelev/Homework/blob/main/Terraform/01/screenshots/Terraform1_6.png)

8. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**.

### Ответ:

```
{
  "version": 4,
  "terraform_version": "1.8.5",
  "serial": 41,
  "lineage": "82c4ab30-b76a-ba39-8110-21caeb8d47ec",
  "outputs": {},
  "resources": [],
  "check_results": null
}

```

9. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ**, а затем **ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ** строчкой из документации [**terraform провайдера docker**](https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs).  (ищите в классификаторе resource docker_image )

### Ответ:

Блок resource `docker_image` содержит аргумент `keep_locally`, если его значение **true**, то после выполнения команды `terraform destroy` образ останется в локальном хранилище, если **false**, то образ будет удален.
В документации к провайдеру `docker` написано так:

```keep_locally``` (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

------
