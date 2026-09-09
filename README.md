# Мониторинг ресурсов

Bash-скрипт для автоматического мониторинга системных ресурсов Linux.

## Функционал

Скрипт каждые 10 секунд записывает в `monitor.log`:

* дату и время каждого измерения:
* использование оперативной памяти;
* использование дискового пространства;
* время работы системы и нагрузку;

Перед запуском скрипт проверяет наличие необходимых команд и возможность создания лог-файла.

## Запуск

Необходимо сделать скрипт исполняемым:

```bash
chmod +x script.sh
```

После этого запустить:

```bash
./script.sh
```

Скрипт работает непрерывно и собирает данные каждые 10 секунд.

Для остановки нажмите:

```text
Ctrl+C
```

## Пример вывода

```text
--- 2026-09-09 09:40:50 ---
=== MEMORY ===
               total        used        free      shared  buff/cache   available
Mem:           3.3Gi       497Mi       2.0Gi       1.3Mi       1.1Gi       2.8Gi
Swap:          3.8Gi          0B       3.8Gi

=== DISK ===
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           680M  1.3M  679M   1% /run
/dev/sda2       458G  7.0G  428G   2% /
tmpfs           1.7G     0  1.7G   0% /dev/shm
tmpfs           1.7G     0  1.7G   0% /tmp
none            1.0M     0  1.0M   0% /run/credentials/getty@tty1.service
tmpfs           340M  8.0K  340M   1% /run/user/1000
none            1.0M     0  1.0M   0% /run/credentials/systemd-resolved.service
none            1.0M     0  1.0M   0% /run/credentials/systemd-journald.service
none            1.0M     0  1.0M   0% /run/credentials/systemd-networkd.service

=== UPTIME ===
 09:40:50 up  2:02,  1 user,  load average: 0.00, 0.00, 0.00
```

## Структура проекта

```text
my-sysadmin-scripts/
├── README.md
├── script.sh
├── sample_output.txt
└── .gitignore
```

## Используемые команды

Скрипт использует стандартные Linux-команды:

* `free` — информация об оперативной памяти;
* `df` — информация о дисковом пространстве;
* `uptime` — время работы системы и нагрузка;
* `date` — получение текущей даты и времени;
* `sleep` — ожидание между измерениями.

## Настройки

Интервал мониторинга задаётся непосредственно в `script.sh`:

```bash
INTERVAL=10
```

Например, для запуска измерений каждые 30 секунд:

```bash
INTERVAL=30
```

