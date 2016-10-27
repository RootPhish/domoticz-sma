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

**Start container**
```
docker start domoticz
```

**Enter container and copy end edit the SBFspot config file**
```
docker exec -it domoticz /bin/sh
cp /opt/sbfspot/SBFspot.cfg /config
vi /config/SBFspot.cfg
```

**Still in the container, add the cronjob**
```
crontab -e
* * * * * /opt/sbfspot/SBFspot -v -cfg/config/SBFspot.cfg > /dev/null
```
