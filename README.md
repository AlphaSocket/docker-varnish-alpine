# alphasocket/dockerized-varnish-alpine
#### varnish-alpine
Varnish service on latest alpine image


| [![Build Status](https://semaphoreci.com/api/v1/alphasocket/dockerized-varnish-alpine/branches/latest/badge.svg)](https://semaphoreci.com/alphasocket/dockerized-varnish-alpine) | Layers | Size  |
| ----- | ----- | ----- |
| Dev image | [![](https://images.microbadger.com/badges/image/03192859189254/dockerized-varnish-alpine:latest.svg)](https://microbadger.com/images/03192859189254/varnish-alpine:latest ) | [![](https://images.microbadger.com/badges/version/03192859189254/dockerized-varnish-alpine:latest.svg)](https://microbadger.com/images/03192859189254/varnish-alpine:latest) |
| Prd image | [![](https://images.microbadger.com/badges/image/alphasocket/varnish-alpine:latest.svg)](https://microbadger.com/images/alphasocket/varnish-alpine:latest ) | [![](https://images.microbadger.com/badges/version/alphasocket/varnish-alpine:latest.svg)](https://microbadger.com/images/alphasocket/varnish-alpine:latest) |

## Branches & Versions
- latest


## Packages installed
- Setup dependencies:
  + varnish
- Config dependencies:
  + gettext


## Configurable envvars
~~~
CONFIG_PATHS_TEMPLATES_VARNISH_SERVER="/usr/local/templates/default.vcl"
CONFIG_PATHS_CONF_VARNISH_SERVER="/etc/varnish/default.vcl"
CONFIG_VARNISH_USER="varnish"
CONFIG_VARNISH_PORT="80"
CONFIG_VARNISH_STARTUP_OPTIONS="-F -f /etc/varnish/default.vcl"
CONFIG_VARNISH_MEMORY="1M"
CONFIG_VARNISH_WORKING_DIR="/var/lib/varnish/$(hostname)"
CONFIG_VARNISH_BACKEND_ADDRESS="webserver.cluster"
CONFIG_VARNISH_BACKEND_PORT="80"
CONFIG_VARNISH_BACKEND_RETRIES="5"
CONFIG_VARNISH_CONTROL_PANEL_ENABLED="True"
CONFIG_VARNISH_CONTROL_PANEL_STARTUP_OPTIONS="-p cli_buffer=16384 -p feature=+esi_ignore_other_elements -p vcc_allow_inline_c=on"
~~~
