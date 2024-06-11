### Создаем рабочую директорию
```shell
mkdir /home/user/nginx
```
---
### Создаем `selenoid.conf` с содержимым proxy сервера
```shell
nano /home/user/nginx/selenoid.conf
```
---
### Запускам `nginx` контейнер
```dockerfile
sudo docker run \
--name nginx \
-v /home/user/nginx/:/etc/nginx/conf.d:ro \
-d --network=host nginx
```