# Odoo 14 Install

Install [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/) yourself, then run:

``` bash
# 1st Odoo @ localhost:10014
curl -s https://raw.githubusercontent.com/majordomo-systems/odoo-docker/14.0/run.sh | sudo bash -s odoo-docker-1 10014
# 2nd Odoo @ localhost:11014
curl -s https://raw.githubusercontent.com/majordomo-systems/odoo-docker/14.0/run.sh | sudo bash -s odoo-docker-2 11014
```

Start container:
```
docker-compose up
```

* Open `localhost:10014` to access Odoo 14.0. If you want to start the server with a different port, change **10014** 

```
ports:
 - "10014:8069"
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
