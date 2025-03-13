### Service selenoid

![Selenoid-schema.png](img%2FSelenoid-schema.png)

1. **Сеть** `selenoid`: Создается автоматически при запуске `docker-compose up`.
2. 

2. **Файл** `browsers.json`: Предполагается, что файл `browsers.json` находится в той же директории, что и `docker-compose.yml`. Если файл находится в другом месте, укажите правильный путь в `volumes`.

### Service ggr

1. Создание директорий и установка `apache2-utils`:
```shell
sudo mkdir -p /etc/grid-router/quota
```
```shell
sudo apt install apache2-utils -y
```
! Важно, имя пользователя нам понадобиться для создания файла `xml`
2. Создание файла `users.htpasswd`:
```shell
htpasswd -bc /etc/grid-router/users.htpasswd ggr-it-user Qwerty123
```
3. Создание файла `ggr-it-user.xml`:
```shell
sudo cp ggr-it-user.xml /etc/grid-router/quota/ggr-it-user.xml
```
4. Удаляем `apache2-utils`:
```shell
sudo apt purge apache2-utils -y
```

### Service nginx-proxy
! Обратите внимание на путь к файлу. Вам нужно указать вашего локального пользователя на сервере.

1. Создаем рабочую директорию
```shell
mkdir /home/it/nginx
```
2. Создаем `selenoid.conf` с содержимым proxy сервера
```shell
cp selenoid.conf /home/it/nginx/selenoid.conf
```

### Запуск docker compose
```shell
sudo docker compose up -d
```