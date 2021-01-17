# Odoo 12 Install

Install [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/) yourself, then run:

``` bash
# 1st Odoo @ localhost:10012
curl -s https://raw.githubusercontent.com/majordomo-systems/odoo-docker/12.0/run.sh | sudo bash -s odoo-docker-1 10012
# 2nd Odoo @ localhost:11012
curl -s https://raw.githubusercontent.com/majordomo-systems/odoo-docker/12.0/run.sh | sudo bash -s odoo-docker-2 11012
```

Start container:
```
docker-compose up
```

* Open `localhost:10012` to access Odoo 12.0. If you want to start the server with a different port, change **10012** 

```
ports:
 - "10012:8069"
```

To run in detached mode, execute this command:

```
docker-compose up -d
```

# Custom addons

The **addons** folder contains custom addons. Just put your custom addons if you have any.

# Odoo container management

**Restart Odoo**:

``` bash
docker-compose restart
```

**Kill Odoo**:

``` bash
docker-compose down
```
