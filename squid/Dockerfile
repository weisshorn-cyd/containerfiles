FROM debian:bookworm

# Packages install
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid-openssl \
 && mv /etc/squid/squid.conf /etc/squid/squid.conf.dist \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Config scripts
COPY entrypoint.sh /sbin/entrypoint.sh
COPY process_fifo.sh /sbin/process_fifo.sh
COPY null-auth.sh /sbin/null-auth.sh
RUN chmod 755 /sbin/entrypoint.sh \
 && chmod 755 /sbin/process_fifo.sh \
 && chmod 755 /sbin/null-auth.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
