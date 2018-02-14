#
# Do not change content here, image automatically built
#
FROM alpine:latest

ARG BUILD_COMMIT
ARG BUILD_DATE

ENV \
	GENERAL_DOCKER_USERS_DEV="03192859189254" \
	GENERAL_DOCKER_USERS_PRD="alphasocket" \
	GENERAL_DOCKER_USER="alphasocket" \
	GENERAL_DOCKER_REGISTRIES_DEV="docker.io" \
	GENERAL_DOCKER_REGISTRIES_PRD="docker.io" \
	GENERAL_DOCKER_REGISTRY="docker.io" \
	GENERAL_KEYS_TRUE="True" \
	GENERAL_KEYS_FALSE="False" \
	GENERAL_KEYS_DEV="dev" \
	GENERAL_KEYS_PRD="prd" \
	BUILD_USER="03192859189254" \
	BUILD_REGISTRY="docker.io" \
	BUILD_NAME="varnish-alpine" \
	BUILD_REPO="https://github.com/alphaSocket/dockerized-varnish-alpine" \
	BUILD_BRANCH="latest-controlled" \
	BUILD_VERSION="latest-controlled" \
	BUILD_ENV="controlled" \
	BUILD_FROM="alpine:latest" \
	BUILD_PORTS_MAIN="80" \
	BUILD_PORTS_ADDITIONAL="" \
	BUILD_CMD="echo $CONFIG_VARNISH_STARTUP_OPTIONS $CONFIG_VARNISH_STARTUP_OPTIONS_ADDITIONAL | xargs -exec varnishd " \
	BUILD_VARNISH_CONF_PATH="/etc/varnish/default.vcl" \
	BUILD_VARNISH_PORT="80" \
	BUILD_VARNISH_CONTROL_PANEL_ENABLED="True" \
	BUILD_VARNISH_CONTROL_PANEL_PORT="6082" \
	BUILD_PATHS_TEMPLATES_FOLDER="/usr/local/templates" \
	SETUP_DEPENDENCIES_SETUP="varnish" \
	SETUP_DEPENDENCIES_CONFIG="gettext" \
	CONFIG_PATHS_TEMPLATES_VARNISH_SERVER="/usr/local/templates/default.vcl" \
	CONFIG_PATHS_CONF_VARNISH_SERVER="/etc/varnish/default.vcl" \
	CONFIG_VARNISH_USER="varnish" \
	CONFIG_VARNISH_PORT="80" \
	CONFIG_VARNISH_MEMORY="256m" \
	CONFIG_VARNISH_WORKING_DIR="/var/lib/varnish/$(hostname)" \
	CONFIG_VARNISH_BACKEND_ADDRESS="webserver.cluster" \
	CONFIG_VARNISH_BACKEND_PORT="80" \
	CONFIG_VARNISH_BACKEND_RETRIES="5" \
	CONFIG_VARNISH_CONTROL_PANEL_ENABLED="True" \
	CONFIG_VARNISH_CONTROL_PANEL_STARTUP_OPTIONS="-T 127.0.0.1:${BUILD_VARNISH_CONTROL_PANEL_PORT} -p cli_buffer=16384 -p feature=+esi_ignore_other_elements -p vcc_allow_inline_c=on" \
	CONFIG_VARNISH_STARTUP_OPTIONS="-F -s malloc,${CONFIG_VARNISH_MEMORY} -a 127.0.0.1:${BUILD_VARNISH_PORT} -b ${CONFIG_VARNISH_BACKEND_ADDRESS}:${CONFIG_VARNISH_BACKEND_PORT}" \
	CONFIG_VARNISH_STARTUP_ADDITIONAL="-T 127.0.0.1:${BUILD_VARNISH_CONTROL_PANEL_PORT} -p cli_buffer=16384 -p feature=+esi_ignore_other_elements -p vcc_allow_inline_c=on"

RUN if [ ! -d "/usr/local/bin/setup" ]; then \
        mkdir -p /usr/local/bin/setup; \
    fi \
    && \
    if [ ! -d "/usr/local/bin/config" ]; then \
        mkdir -p /usr/local/bin/config; \
    fi

ADD imports/bin/docker-config /usr/local/bin/docker-config
ADD imports/bin/docker-run /usr/local/bin/docker-run
ADD imports/bin/setup /usr/local/bin/setup/1518577151
ADD imports/bin/config /usr/local/bin/config/1518577151
ADD imports/templates/default.vcl /usr/local/templates/default.vcl
ADD imports/templates/503.html /usr/local/templates/503.html


RUN chmod +x -R /usr/local/bin && \
    sync && \
    /usr/local/bin/setup/1518577151 1>/dev/stdout 2>/dev/stderr

EXPOSE 80 


ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/docker-run"]

LABEL \
    org.label-schema.vcs-ref="$BUILD_COMMIT" \
    org.label-schema.vcs-url="https://github.com/alphaSocket/dockerized-varnish-alpine"