### Service selenoid

1. **Сеть** `selenoid`: Создается автоматически при запуске `docker-compose up`.

2. **Файл** `browsers.json`: Предполагается, что файл `browsers.json` находится в той же директории, что и `docker-compose.yml`. Если файл находится в другом месте, укажите правильный путь в `volumes`.

3. **Загрузка образа** `selenoid/chrome:121.0`: Образ будет загружен автоматически при запуске `docker-compose up`.

4. **Запуск Selenoid:** Контейнер Selenoid будет запущен с указанными параметрами, включая подключение к сети `selenoid` и использование файла `browsers.json`.

5. Создайте файл `browsers.json` в той же директории, что и `docker-compose.yml`, с содержимым, которое вы указали.

### Service ggr

1. Создание директорий и установка `apache2-utils`:
```shell
sudo mkdir -p /etc/grid-router/quota
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
