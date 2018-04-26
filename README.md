# Salt Sanbox

Create of a simple Docker based Salt environment for testing and development purpose.
In the current version, it starts a master node and a minion, called jerry.


## Installation

```
docker-compose up -d
```

## Ping minion

```
docker exec `docker ps -qf "name=master"` salt jerry test.ping
```

## Install Apache

```
docker exec `docker ps -qf "name=master"` salt '*' state.sls apache
```

Then you can get the exposed IP address and curl on your web server:

```
docker inspect `docker ps -qf "name=minion"` | grep IPAddress
```
