### Запускаем ggr-ui

```dockerfile
docker run \
-d \
--name ggr-ui \
-p 8888:8888 \
-v /etc/grid-router/quota/:/etc/grid-router/quota:ro \
aerokube/ggr-ui
```

### Проверяем доступность браузеров
```shell
curl -s http://172.17.0.1:8888/status
# {"browsers":{"chrome":{"120.0":{},"121.0":{}},"opera":{"105.0":{},"106.0":{}}},"pending":0,"queued":0,"total":24,"used":0}
```