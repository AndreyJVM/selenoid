### Создаем рабочую директорию для `ggr`
```dockerfile
sudo mkdir -p /etc/grid-router/quota
```
---
```shell
sudo apt install apache2-utils # после htpasswd можно удалить
```

### Шифруем пользователя паролем с помощью утилиты `htpasswd`
```
htpasswd -bc /etc/grid-router/users.htpasswd <user-name> <user-password>
```
### Создаем файл содержащий список `selenoid` контейнеров
```shell
nano /etc/grid-router/quota/<user-name>.xml
```
---
### Запускаем контейнер `ggr`
```dockerfile
sudo docker run \
-d \
--name ggr \
-v /etc/grid-router/:/etc/grid-router:ro \
-p 4444:4444 \
aerokube/ggr:1.7.2 \
-guests-allowed \
-guests-quota "<user-name>" \
-verbose \
-quotaDir /etc/grid-router/quota
```