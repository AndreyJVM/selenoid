```dockerfile
docker run \
-d \
--name ggr-ui \
-p 8888:8888 \
-v /etc/grid-router/quota/:/etc/grid-router/quota:ro \
aerokube/ggr-ui
```