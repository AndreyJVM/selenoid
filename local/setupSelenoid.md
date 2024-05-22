```dockerfile
docker network create selenoid
```
---
```dockerfile
nano ./browser.json

```
---
```json
{
  "chrome": {
    "default": "121.0",
    "versions": {
      "121.0": {
        "image": "selenoid/chrome:121.0",
        "port": "4444",
        "path": "/"
      },
      "120.0": {
        "image": "selenoid/chrome:120.0",
        "port": "4444",
        "path": "/"
      }
    }
  },
  "opera": {
    "default": "106.0",
    "versions": {
      "106.0": {
        "image": "selenoid/opera:106.0",
        "port": "4444",
        "path": "/"
      },
      "105.0": {
        "image": "selenoid/opera:105.0",
        "port": "4444",
        "path": "/"
      }
    }
  }
}
```
---
```dockerfile
docker pull selenoid/chrome:121.0
```
---
```dockerfile
sudo docker run \
    -d \
    --rm \
    --network selenoid \
    --name selenoid \
    -p 4445:4444 \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /home/selenoid/selenoid/browser.json:/etc/selenoid/browser.json:ro \
    aerokube/selenoid:1.11.2 \
    -container-network=selenoid -limit 12
```