domoticz-sma
======

##How to use

**Create container**

```
docker create \
  --name=domoticz \
  -p 8080:8080 \
  --restart=always \
  -v /nfsmounts/docker/domoticz:/config \
  -v /etc/localtime:/etc/localtime:ro \
  --device=/dev/ttyUSB0 \
  --device=/dev/ttyUSB1 \
  --device=/dev/ttyUSB2 \
  domoticz-sma
```


