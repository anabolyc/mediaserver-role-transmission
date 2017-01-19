FROM armhf/ubuntu:xenial

# required packages
RUN apt-get update && apt-get install transmission-daemon -y && rm -rf /var/lib/apt/lists/*

RUN mkdir /transmission
RUN chmod 1777 /transmission

ENV TRANSMISSION_HOME /transmission/config

# Transmission ports
# HTTP interface
EXPOSE 9091

RUN mkdir /transmission/download
RUN mkdir /transmission/watch
RUN mkdir /transmission/config

CMD [ "--allowed", "127.*,192.168.1.*", "--watch-dir", "/transmission/watch", "--encryption-preferred", "--foreground", "--config-dir", "/transmission/config", "--no-incomplete-dir", "--dht", "--no-auth", "--download-dir", "/transmission/download" ]
ENTRYPOINT ["/usr/bin/transmission-daemon"]
