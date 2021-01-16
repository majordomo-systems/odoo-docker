# Odoo 13 Install

Install [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/) yourself, then run:

``` bash
# 1st Odoo @ localhost:10013
$ curl -s https://raw.githubusercontent.com/majordomo-systems/odoo-13-docker/master/run.sh | sudo bash -s odoo-13-docker-1 10013
# 2nd Odoo @ localhost:11013
$ curl -s https://raw.githubusercontent.com/majordomo-systems/odoo-13-docker/master/run.sh | sudo bash -s odoo-13-docker-2 11013
```

Start container:
```
$ docker-compose up
```

* Open `localhost:10013` to access Odoo 13.0. If you want to start the server with a different port, change **10013** 

```
ports:
 - "10013:8069"
```

To run in detached mode, execute this command:

```
$ docker-compose up -d
```

# Custom addons

The **addons** folder contains custom addons. Just put your custom addons if you have any.

# Odoo container management

**Restart Odoo**:

``` bash
$ docker-compose restart
```

**Kill Odoo**:

``` bash
$ docker-compose down
```
