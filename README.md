### Service selenoid

1. **Сеть** `selenoid`: Создается автоматически при запуске `docker-compose up`.

2. **Файл** `browsers.json`: Предполагается, что файл `browsers.json` находится в той же директории, что и `docker-compose.yml`. Если файл находится в другом месте, укажите правильный путь в `volumes`.

### Service ggr

1. Создание директорий и установка `apache2-utils`:
```shell
sudo mkdir -p /etc/grid-router/quota
```
```shell
sudo apt install apache2-utils -y
```
2. Создание файла `.env`:
```shell
HTPASSWD_USER=ggr-it-user
HTPASSWD_PASSWORD=QwertyQAZxsw
```
! Важно, имя пользователя нам понадобиться для создания файла `xml`
3. Создание файла `users.htpasswd`:
```shell
htpasswd -bc /etc/grid-router/users.htpasswd ${HTPASSWD_USER} ${HTPASSWD_PASSWORD}
```
4. Создание файла `ggr-it-user.xml`:
```shell
sudo cp ggr-it-user.xml /etc/grid-router/quota/ggr-it-user.xml
```
5. Удаляем `apache2-utils`:
```shell
sudo apt purge apache2-utils -y
```

### Service nginx-proxy
! Обратите внимание на путь к файлу, Вам нужно указать вашего локального пользователя на сервере

1. Создаем рабочую директорию
```shell
mkdir /home/it/nginx
```
2. Создаем `selenoid.conf` с содержимым proxy сервера
```shell
nano /home/it/nginx/selenoid.conf
```

### Запуск docker compose
```shell
sudo docker compose up -d
```