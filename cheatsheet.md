# Salt Cheat Sheet

Simple cheat sheet to help you getting started with salt.

Let's create an alias to run our commands directly on the salt-master container:
```
alias sm='docker exec `docker ps -qf "name=saltsandbox_master"`'
```

## Install and run Apache


Verify that it's runnable:
```
sm salt jerry state.show_sls apache

```

If so:
```
sm salt jerry state.sls apache
```

Then we can get the exposed IP address and curl on the web server:
```
docker inspect `docker ps -qf "name=minion"` | grep IPAddress
```
