# Домашнее задание к занятию 1 «Введение в Ansible»

## Основная часть

1. При запуске playbook на окружении из test.yml значение `some_fact` - `12`.
2. Изменил значение `some_fact` в group_vars/all/examp.yml на `all default fact`.
3. Не совсем понял суть задания в данном пункте, просьба поправить если я выполнил его не корректно. В inventory файле окружения prod.yml заменил `docker` на `local`.
4. Значение `some_fact` для `centos7` - `el`, для `ubuntu` - `deb`.
5. Изменил значения в `group_vars` каждой из групп хостов для `deb` — `deb default fact`, для `el` — `el default fact`.
6. При повторном запуске playbook на окружении `prod.yml` выдаются корректные значения для всех хостов.
7. При помощи `ansible-vault` зашифровал факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.
8. Запустил playbook на окружении `prod.yml`. При запуске `ansible` необходмо добавить `--ask-vault-password`, в противном случае пароль не будет запрошен и команда не отработает.
9. При помощи `ansible-doc` отобразил список плагинов для подключения. Модуль `local` для работы на `control node`.
10. В `prod.yml` добавлена новая группу хостов с именем  `local`, в ней размещен localhost с параметром `ansible_connection`: `local`.
11. Снова запустил playbook, ввел пароль, значения `some_fact` - корректные.
