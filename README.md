# Современный способ распараллеливания Selenoid

---
### Создание и настройка балансировщика

```shell
mkdir -p /etc/grid-router/quota
```

```shell
sudo apt install apache2-utils
```

```shell
htpasswd -bc /etc/grid-router/users.htpasswd <user-name> <user-password>
```

#### Создаем конфигурационный файл балансировщика

```shell
cat /etc/grid-router/quota/<user-name>.xml
```
#### Пример файла балансировщика
```html
<qa:browser xmlns:qa="urm:config.gridrouter.qatools.ru">
<browser name="firefox" defaultVersion="88.0">
    <version number="88.0">
        <region name="1">
            <host name="10.0.0.6" port="4444" count="1"/>
        </region>
    </version>
</browser>
</qa:browser>
``` 

```dockerfile
docker run -d -name grr -v /etc/grid-router/:/etc/grid-router:ro
-net host aerokude/ggr:latest-release
-guests-allowed -guests-quota "test" -qoutaDir /etc/grid-router/quota
```
---

---
```dockerfile
docker network create <NAME_NETWORK>
```

```dockerfile
docker run 
-d --network <NAME_NETWORK> 
--name <NAME_CONTAINER> 
-p 4444:4444 
-v /var/run/docker.sock:/var/run/docker.sock  
-v /home/ubuntu/selenoid:/etc/selenoid:ro
aerokude/selenoid:latest-release 
-container-network=<NAME_NETWORK>
```
---


