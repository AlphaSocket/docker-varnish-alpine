#
# Do not change content here, image automatically built
#
FROM alpine:latest

ARG BUILD_COMMIT
ARG BUILD_DATE

ENV \
	GENERAL_DOCKER_USER="03192859189254" \
	GENERAL_KEYS_TRUE="True" \
	GENERAL_KEYS_FALSE="False" \
	GENERAL_KEYS_DEV="dev" \
	GENERAL_KEYS_PRD="prd" \
	BUILD_NAME="varnish-alpine" \
	BUILD_BRANCH="latest" \
	BUILD_COMMIT="7b1b4aa" \
	BUILD_VERSION="latest" \
	BUILD_ENV="prd" \
	BUILD_VARNISH_CONF_PATH="/etc/varnish/default.vcl" \
	BUILD_VARNISH_PORT="80" \
	BUILD_DOCKERFILE_IMAGE="alpine:latest" \
	BUILD_DOCKERFILE_PORTS_MAIN="80" \
	BUILD_DOCKERFILE_CMD="varnishd -Ff /etc/varnish/default.vcl" \
	SETUP_DEPENDENCIES_SETUP="varnish" \
	SETUP_DEPENDENCIES_CONFIG="gettext" \
	CONFIG_VARNISH_USER="varnish" \
	CONFIG_VARNISH_PORT="80" \
	CONFIG_VARNISH_MEMORY="1M" \
	CONFIG_VARNISH_WORKING_DIR="/var/lib/varnish/$(hostname)" \
	CONFIG_VARNISH_BACKEND_ADDRESS="webserver.cluster" \
	CONFIG_VARNISH_BACKEND_PORT="80" \
	CONFIG_VARNISH_BACKEND_RETRIES="5" \
	CONFIG_PATHS_TEMPLATES_VARNISH_SERVER="/usr/local/templates/default.vcl" \
	CONFIG_PATHS_CONF_VARNISH_SERVER="/etc/varnish/default.vcl"

RUN if [ ! -d "/usr/local/bin/setup" ]; then \
        mkdir -p /usr/local/bin/setup; \
    fi \
    && \
    if [ ! -d "/usr/local/bin/config" ]; then \
        mkdir -p /usr/local/bin/config; \
    fi

ADD bin/docker-config /usr/local/bin/docker-config
ADD bin/setup /usr/local/bin/setup/1517140531
ADD bin/config /usr/local/bin/config/1517140531
ADD templates /usr/local/templates

RUN chmod +x -R /usr/local/bin && \
    sync && \
    /usr/local/bin/setup/1517140531 

EXPOSE 80 80


ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/docker-config && varnishd -Ff $BUILD_VARNISH_CONF_PATH"]

LABEL \
    org.label-schema.vcs-ref=7b1b4aa \
    org.label-schema.vcs-url="https://github.com/AlphaSocket/dockerized-varnish-alpine"