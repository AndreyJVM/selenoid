```dockerfile
docker run \
--name nginx \
-v /home/user/nginx/:/etc/nginx/conf.d:ro \
-d --network=host nginx
```