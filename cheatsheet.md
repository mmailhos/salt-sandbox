# Salt Cheat Sheet

Simple cheat sheet to help you getting started with salt.

Let's create an alias to run our commands directly on the salt-master container:
```
alias sm='docker exec `docker ps -qf "name=saltsandbox_master"`'
```

## Some basic commands

### Get documentation about an execution module

```
sm salt '*' sys.doc             # All packages
sm salt '*' sys.doc pkg         # All functions from a module
sm salt '*' sys.doc pkg.version # One specific function
```

### Grains: Discover your infrastructure

Grains are collected data from the OS, domain name, IP address, kernel and many other system properties.

Retrieve the data
```
sm salt '*' grains.ls # List all grains
sm salt '*' grains.get os_family # Show OS family from all minions
```

Manipulate the data
```
sm salt '*' grains.set foo:bar # Set a value into the grains
sm salt '*' grains.del foo     # Del a key
```

### Some Sys Admin commands

[Credits](https://github.com/harkx/saltstack-cheatsheet)

```
sm salt '*' status.uptime
sm salt '*' system.reboot
```

```
sm salt '*' pkg.list_upgrades
sm salt '*' pkg.upgrade
sm salt '*' pkg.install bash
```

```
sm salt '*' service.get_all
sm salt '*' service.status httpd
sm salt '*' service.start|stop|enable httpd
```

```
sm salt '*' jerry network.ip_addrs
sm salt '*' jerry network.ping
sm salt '*' jerry network.get_hostname
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

## Execute states

To see all available state files:
```
sm salt '*' jerry cp.list_states
```

We can see here that we have our local Apache state in addition to the MySQL remote formula configured from on thesalt  master.

### Set up Apache

Directly execute the init.sls file of the module:
```
sm salt '*' state.sls apache
```

### Set up the landing page

Send the pillars (minions assigned data) to each minion.
```
sm salt '*' saltutil.refresh_pillar
```

Then override the landing page
```
sm salt '*' state.sls apache.welcome
```

### Alternative

A one-line equivalent:
```
sm salt '*' state.sls apache,apache.welcome
```

Or better, the high state would have run everything based on `states/top.sls` description
```
sm salt '*' state.highstate
```

### Finally

It can be a good idea to start a dry run to check for output and indempotency:
```
sm salt '*' state.highstate test=True
```

