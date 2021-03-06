FROM debian:stable-slim
LABEL maintainer "kevin@meredithkm.info"

RUN apt-get update && apt-get install -y \
    python3 \
 && rm -rf /var/lib/apt/lists/*

# Make dirs
RUN mkdir -p /etc/confd/{conf.d,templates}

# Add templates
COPY docker/confd/ /etc/confd/

# Add confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.14.0/confd-0.14.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

# Set up the ENTRYPOINT
COPY docker/docker-entrypoint.sh /var/local/
RUN chmod a+x /var/local/docker-entrypoint.sh

ENTRYPOINT ["/var/local/docker-entrypoint.sh"]
