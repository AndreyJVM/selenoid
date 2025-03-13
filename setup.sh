### В разработке !!!
#!/bin/bash

# Путь к папке с docker-compose.yml
BASE_DIR=$(dirname "$0")

# Проверка наличия необходимых файлов
declare -a required_files=(
  "${BASE_DIR}/browsers.json"
  "${BASE_DIR}/.env"
  "${BASE_DIR}/ggr-it-user.xml"
  "${BASE_DIR}/selenoid.conf"
)

missing_files=()

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    missing_files+=("$file")
  fi
done

# Если отсутствуют файлы, выводим сообщение и завершаем скрипт
if [[ ${#missing_files[@]} -gt 0 ]]; then
  echo "Ошибка: Отсутствуют следующие файлы:"
  for file in "${missing_files[@]}"; do
    echo "  - $file"
  done
  echo "Пожалуйста, убедитесь, что файлы находятся в папке с docker-compose.yml."
  exit 1
fi

# Создание директорий (если их нет)
mkdir -p /home/user/nginx
mkdir -p /etc/grid-router/quota

# Копирование файлов в нужные места
cp "${BASE_DIR}/browsers.json" ./browsers.json
cp "${BASE_DIR}/.env" ./.env
cp "${BASE_DIR}/ggr-it-user.xml" /etc/grid-router/quota/ggr-it-user.xml
cp "${BASE_DIR}/selenoid.conf" /home/user/nginx/selenoid.conf

# Проверка, что файлы скопировались
declare -a copied_files=(
  "./browsers.json"
  "./.env"
  "/etc/grid-router/quota/ggr-it-user.xml"
  "/home/user/nginx/selenoid.conf"
)

for file in "${copied_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "Ошибка: Не удалось скопировать файл $file."
    exit 1
  fi
done

echo "Все файлы успешно скопированы."

# Установка apache2-utils для создания users.htpasswd
sudo apt update
sudo apt install -y apache2-utils

# Создание файла users.htpasswd
source ./.env
htpasswd -bc /etc/grid-router/users.htpasswd ${HTPASSWD_USER} ${HTPASSWD_PASSWORD}

# Удаление apache2-utils (если больше не нужен)
sudo apt purge -y apache2-utils

# Запуск docker-compose
echo "Запуск docker-compose..."
docker-compose up -d