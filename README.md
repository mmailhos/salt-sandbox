# Salt Sanbox

Create of a simple Docker based Salt environment for testing/development purpose, or just to play around.
In the current version, it starts a master node and a minion called jerry.

Check out the cheat sheet below and the state files for some examples.

## Installation

```
docker-compose up
```

## Ping minions

```
docker exec `docker ps -qf "name=master"` salt '*' test.ping
```

# Salt Cheat Sheet

Let's create an alias to run our commands directly on the salt-master container:
```
alias sm='docker exec `docker ps -qf "name=saltsandbox_master"`'
```

## Install and run Apache


Verify that it's runnable:
```
sm salt '*' state.show_sls apache

```

If so::
```
sm salt '*' state.sls apache
```

Then we can get the exposed IP address and curl on the web server:
```
docker inspect `docker ps -qf "name=minion"` | grep IPAddress
```
