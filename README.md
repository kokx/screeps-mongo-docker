Screeps + Mongo + Docker-compose
================================

Create a full screeps private server.

__NOTE: this will not work when your OS is Windows, because the Mongo container does not run on Windows__

Initial Setup
-------------

Clone the repository:

```sh
git clone https://github.com/kokx/screeps-mongo-docker.git
```

Copy `docker-compose.override.yml.dist` to `docker-compose.override.yml` and
add your steam key (you can obtain your steam key
[here](https://steamcommunity.com/dev/apikey)).

Make sure that the docker daemon is running and then run the setup script:

```sh
./setup.sh
```

The setup script appears to start the server CLI. This CLI is however non-interactive.

Running
-------

The server can be started as follows:

```sh
docker-compose up -d
```

And to stop the server:

```sh
docker-compose stop
```

Accessing the server CLI
------------------------

To access the server CLI:

```sh
docker-compose exec screeps npx screeps cli
```

Adding mods and/or bots
-----------------------

We'll be adding tooangel and the konami mod as examples.

Edit `screeps/Dockerfile` and uncomment the `RUN yarn add` line, and append all the npm packages for mods and bots you want to add:

```
FROM kokx/screeps-base:latest

# to install extra modules, uncomment the following line and add your modules:
RUN yarn add screepsmod-konami screeps-bot-tooangel
```

And modify `mods.json` to include them:

```json
{
  "mods": [
    "node_modules/screepsmod-mongo/index.js",
    "node_modules/screepsmod-auth/index.js",
    "node_modules/screepsmod-tickrate/index.js",
    "node_modules/screepsmod-admin-utils/index.js",
    "node_modules/screepsmod-features/index.js",
    "node_modules/screepsmod-konami/index.js"
  ],
  "bots": {
    "simplebot": "node_modules/@screeps/simplebot/src",
    "tooangel": "node_modules/screeps-bot-tooangel/src"
  }
}
```

And re-run `./setup.sh` to install the modules and reset the game.

Troubleshooting
===============

No rooms are available when connecting the first time
-----------------------------------------------------

In some situations, the setup script may not work correctly the first time.
Re-run the setup script (should be faster this time) and try to connect again.
