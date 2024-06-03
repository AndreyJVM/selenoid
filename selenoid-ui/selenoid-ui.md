```dockerfile
docker run \
-d \
--rm \
--name selenoid-ui \
-p 8090:8080 \
aerokube/selenoid-ui:1.10.11 \
--selenoid-uri http://172.17.0.1:8888
```