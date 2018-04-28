# Salt Sanbox

Salt Sandbox helps you to easily create a multi-container Docker-based Salt environment. It is useful for testing purpose or to simply learn and play around.

The project will boot up a Salt Master (master) and two minions (jerry and stuart).

Feel free to update the `states/` directory with your own state files to try out your modules outside from your production environment.

If you are new to Salt, check out [cheatsheet](cheatsheet.md) and run your first commands on this infrastructure.

## Requirements

You just need a working [Docker Environment](https://docs.docker.com/engine/)

## Installation

```
docker-compose up
```

## Usage

You can execute your commands directly on the master container.
With this command, you will be able to check which minions are alive:

```
docker exec `docker ps -qf "name=saltsandbox_master"` salt '*' test.ping
```

## Licence

Provided under [MIT](https://en.wikipedia.org/wiki/MIT_License) licence.
