# My Sysadmin Scripts

Проект выполнен в рамках домашнего задания по системному администрированию.

## Описание

Скрипт `script.sh` каждые 10 секунд записывает в `monitor.log` информацию о:

- оперативной памяти;
- файловых системах и использовании дискового пространства;
- времени работы системы (uptime).

Приложение контейнеризировано с помощью Docker и работает как постоянный systemd-сервис.

## Архитектура

```text
                         HTTPS :443
                             |
                             v
                    +----------------+
                    |     Nginx      |
                    | reverse proxy  |
                    |      + TLS     |
                    +-------+--------+
                            |
                            | HTTP
                            v
                     127.0.0.1:8080
                            |
                            v
                    +---------------+
                    | Docker my-app |
                    |               |
                    |   script.sh   |
                    | Python HTTP   | 
                    |    server     |
                    +-------+-------+
                            |
                       /var/www
                            |
                            v
                         /mnt/logs
                            |
                            v
                     LVM: lv_logs
                            |
                            v
                       /dev/loop6
                            |
                            v
                        disk3.img


       disk1.img -> loop4 \
                            -> RAID 1 -> md0 -> /mnt/raid
       disk2.img -> loop5 /
