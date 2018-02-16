# alphasocket/dockerized-varnish-alpine
#### varnish-alpine
Varnish service on latest alpine image


| [![Build Status](https://semaphoreci.com/api/v1/alphasocket/dockerized-varnish-alpine/branches/latest/badge.svg)](https://semaphoreci.com/alphasocket/dockerized-varnish-alpine) | Layers | Size  |
| ----- | ----- | ----- |
| Dev image | [![](https://images.microbadger.com/badges/image/03192859189254/dockerized-varnish-alpine:latest.svg)](https://microbadger.com/images/03192859189254/varnish-alpine:latest ) | [![](https://images.microbadger.com/badges/version/03192859189254/dockerized-varnish-alpine:latest.svg)](https://microbadger.com/images/03192859189254/varnish-alpine:latest) |
| Prd image | [![](https://images.microbadger.com/badges/image/alphasocket/varnish-alpine:latest.svg)](https://microbadger.com/images/alphasocket/varnish-alpine:latest ) | [![](https://images.microbadger.com/badges/version/alphasocket/varnish-alpine:latest.svg)](https://microbadger.com/images/alphasocket/varnish-alpine:latest) |

## Branches & Versions
- latest
- latest-controlled


## Packages installed
- Setup dependencies:
  + varnish
- Config dependencies:
  + gettext


## Configurable envvars
~~~
CONFIG_LIVENESS_TEST="exit 0"
CONFIG_PATHS_CONTAINER_STATUS="/tmp/container_status"
CONFIG_PATHS_TEMPLATES_VARNISH_SERVER="/usr/local/templates/default.vcl"
CONFIG_PATHS_CONF_VARNISH_SERVER="/etc/varnish/default.vcl"
CONFIG_VARNISH_USER="varnish"
CONFIG_VARNISH_PORT="80"
CONFIG_VARNISH_HOST="0.0.0.0"
CONFIG_VARNISH_MEMORY="256m"
CONFIG_VARNISH_WORKING_DIR="/var/lib/varnish/$(hostname)"
CONFIG_VARNISH_BACKEND_ADDRESS="webserver.cluster"
CONFIG_VARNISH_BACKEND_PORT="80"
CONFIG_VARNISH_BACKEND_RETRIES="5"
CONFIG_VARNISH_CONTROL_PANEL_ENABLED="False"
CONFIG_VARNISH_CONTROL_PANEL_STARTUP_OPTIONS="'-T ${BUILD_VARNISH_HOST}:${BUILD_VARNISH_CONTROL_PANEL_PORT} -b ${CONFIG_VARNISH_BACKEND_ADDRESS}:${CONFIG_VARNISH_BACKEND_PORT} -p cli_buffer=16384 -p feature=+esi_ignore_other_elements -p vcc_allow_inline_c=on '"
CONFIG_VARNISH_STARTUP_OPTIONS="'-F -s malloc,${CONFIG_VARNISH_MEMORY} -a ${BUILD_VARNISH_HOST}:${BUILD_VARNISH_PORT}'"
CONFIG_VARNISH_STARTUP_ADDITIONAL_OPTIONS="-f /etc/varnish/default.vcl"
~~~
