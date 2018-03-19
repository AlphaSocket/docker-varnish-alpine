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
	BUILD_REPO="https://github.com/alphaSocket/dockerized-varnish-alpine" \
	BUILD_BRANCH="latest-controlled" \
	BUILD_VERSION="latest-controlled" \
	BUILD_ENV="controlled" \
	BUILD_FROM="alpine:latest" \
	BUILD_NAME="varnish-alpine" \
	BUILD_CMD="varnishd $CONFIG_VARNISH_STARTUP_OPTIONS $CONFIG_VARNISH_STARTUP_ADDITIONAL_OPTIONS" \
	BUILD_VARNISH_CONF_PATHS_MAIN="/etc/varnish/default.vcl" \
	BUILD_VARNISH_CONF_PATHS_AGENT="/etc/varnish/agent/config.js" \
	BUILD_VARNISH_CONF_PATHS_AGENT_SECRETS="/etc/varnish/agent_secret" \
	BUILD_VARNISH_HOST="0.0.0.0" \
	BUILD_VARNISH_PORT="80" \
	BUILD_VARNISH_CONTROL_PANEL_ENABLED="True" \
	BUILD_VARNISH_CONTROL_PANEL_PORT="6082" \
	BUILD_VARNISH_AGENT_ENABLED="True" \
	BUILD_VARNISH_AGENT_PORT="6085" \
	BUILD_PATHS_TEMPLATES_FOLDER="/usr/local/templates" \
	BUILD_PORTS_MAIN="80" \
	BUILD_PORTS_ADDITIONAL=" 6082 6085" \
	SETUP_PATHS_BINARIES="/usr/local/bin" \
	SETUP_PATHS_SETUP="/usr/local/bin/setup" \
	SETUP_PATHS_CONFIG="/usr/local/bin/config" \
	SETUP_DEPENDENCIES_CONFIG="" \
	SETUP_DEPENDENCIES_BUILD="" \
	SETUP_DEPENDENCIES_SETUP="alpine-sdk pkgconfig curl make automake autoconf libmicrohttpd-dev curl-dev varnish-dev python-docutils" \
	SETUP_DEPENDENCIES_RUNTIME="varnish" \
	CONFIG_REDINESS_TEST="true" \
	CONFIG_LIVENESS_TEST="true" \
	CONFIG_GROUPS_ADDITIONAL_ID="1001" \
	CONFIG_GROUPS_ADDITIONAL_NAME="" \
	CONFIG_GROUPS_MAIN_ID="1087" \
	CONFIG_GROUPS_MAIN_NAME="varnish" \
	CONFIG_USERS_ADDITIONAL_ID="1001" \
	CONFIG_USERS_ADDITIONAL_NAME="" \
	CONFIG_USERS_ADDITIONAL_GROUPS="" \
	CONFIG_USERS_MAIN_ID="1087" \
	CONFIG_USERS_MAIN_NAME="varnish" \
	CONFIG_USERS_MAIN_GROUPS="varnish" \
	CONFIG_PATHS_CONTAINER_STATUS="/tmp/container_status" \
	CONFIG_PATHS_TEMPLATES_VARNISH_SERVER="/usr/local/templates/default.vcl" \
	CONFIG_PATHS_TEMPLATES_VARNISH_AGENT="/usr/local/templates/agent_config.js" \
	CONFIG_PATHS_CONF_VARNISH_SERVER="/etc/varnish/default.vcl" \
	CONFIG_PATHS_CONF_VARNISH_AGENT="/etc/varnish/agent/config.js" \
	CONFIG_PATHS_CONF_VARNISH_AGENT_SECRETS="/etc/varnish/agent_secret" \
	CONFIG_VARNISH_USER="varnish" \
	CONFIG_VARNISH_PORT="80" \
	CONFIG_VARNISH_HOST="0.0.0.0" \
	CONFIG_VARNISH_MEMORY="256m" \
	CONFIG_VARNISH_WORKING_DIR="/var/lib/varnish/$(hostname)" \
	CONFIG_VARNISH_BACKEND_ADDRESS="webserver.cluster" \
	CONFIG_VARNISH_BACKEND_PORT="80" \
	CONFIG_VARNISH_BACKEND_RETRIES="5" \
	CONFIG_VARNISH_CONTROL_PANEL_ENABLED="True" \
	CONFIG_VARNISH_CONTROL_PANEL_STARTUP_OPTIONS='-T ${BUILD_VARNISH_HOST}:${BUILD_VARNISH_CONTROL_PANEL_PORT} -b ${CONFIG_VARNISH_BACKEND_ADDRESS}:${CONFIG_VARNISH_BACKEND_PORT} -p cli_buffer=16384 -p feature=+esi_ignore_other_elements -p vcc_allow_inline_c=on ' \
	CONFIG_VARNISH_AGENT_USER="varnish_agent_user" \
	CONFIG_VARNISH_AGENT_PASS="varnish_agent_pass" \
	CONFIG_VARNISH_STARTUP_OPTIONS='-F -s malloc,${CONFIG_VARNISH_MEMORY} -a ${BUILD_VARNISH_HOST}:${BUILD_VARNISH_PORT} -j unix,user=${CONFIG_USERS_MAIN_NAME},ccgroup=${CONFIG_GROUPS_MAIN_NAME} ' \
	CONFIG_VARNISH_STARTUP_ADDITIONAL_OPTIONS='-T ${BUILD_VARNISH_HOST}:${BUILD_VARNISH_CONTROL_PANEL_PORT} -b ${CONFIG_VARNISH_BACKEND_ADDRESS}:${CONFIG_VARNISH_BACKEND_PORT} -p cli_buffer=16384 -p feature=+esi_ignore_other_elements -p vcc_allow_inline_c=on '
ADD imports/bin/docker-config /usr/local/bin/docker-config
ADD imports/bin/docker-run /usr/local/bin/docker-run
ADD imports/bin/docker-rediness-test /usr/local/bin/docker-rediness-test
ADD imports/bin/docker-liveness-test /usr/local/bin/docker-liveness-test
ADD imports/bin/setup /usr/local/bin/setup/1521475279
ADD imports/bin/config /usr/local/bin/config/1521475279
ADD imports/templates/agent_config.js /usr/local/templates/agent_config.js
ADD imports/templates/default.vcl /usr/local/templates/default.vcl
ADD imports/templates/503.html /usr/local/templates/503.html


RUN chmod +x -R /usr/local/bin && \
    sync && \
    /usr/local/bin/setup/1521475279 1>/dev/stdout 2>/dev/stderr

EXPOSE 80  6082 6085


ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/docker-run"]

LABEL \
    org.label-schema.vcs-ref="$BUILD_COMMIT" \
    org.label-schema.vcs-url="https://github.com/alphaSocket/dockerized-varnish-alpine"