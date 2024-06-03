```dockerfile
sudo mkdir -p /etc/grid-router/quota/test.xml
```
---
```shell
sudo apt install apache2-utils # после htpasswd можно удалить
```
```
htpasswd -bc /etc/grid-router/users.htpasswd <user-name> <user-password>
```
```shell
nano /etc/grid-router/quota/<user-name>.xml
```
---
```html
<qa:browsers xmlns:qa="urn:config.gridrouter.qatools.ru">
    <browser name="firefox" defaultVersion="59.0">
        <version number="59.0">
            <region name="1">
                <host name="localhost" port="4445" count="1"/>
            </region>
        </version>
    </browser>
</qa:browsers>
```
---

```dockerfile
docker run \
    -d \
    --name ggr \
    -v /etc/grid-router/:/etc/grid-router:ro \
    -p 4444:4444 \
    aerocube/ggr:1.7.2 \
    -guests-allowed \
    -guests-quota "test" \
    -verbose \
    -quotaDir /etc/grid-router/quota
```