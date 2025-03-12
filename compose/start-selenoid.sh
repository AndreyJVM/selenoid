#!/bin/bash

$ENV=.env
$GGR_XML=ggr-it-user.xml
# Автоматическая установка и настройка seleniod

# Настройка GGR
sudo mkdir -p /etc/grid-router/quota

sudo apt install apache2-utils -y

[ -f "$ENV" ] || { echo "Ошибка: файл $ENV не найден" >&2; exit 1; }

htpasswd -bc /etc/grid-router/users.htpasswd ${HTPASSWD_USER} ${HTPASSWD_PASSWORD}

[ -f "$GGR_XML" ] || { echo "Ошибка: файл $GGR_XML не найден" >&2; exit 1; }
sudo cp $GGR_XML /etc/grid-router/quota/GGR_XML

sudo apt purge apache2-utils -y





docker-compose up -d