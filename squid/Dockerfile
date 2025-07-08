FROM debian:bullseye

# Install components
RUN apt-get update \
 && apt-get upgrade -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y squid-openssl \
 && mv /etc/squid/squid.conf /etc/squid/squid.conf.dist \
 && mkdir -p /var/lib/squid/ssl_db \
 && /usr/lib/squid/security_file_certgen -c -s /var/lib/squid/ssl_db -M 4MB \
 && chown -R proxy:proxy /var/lib/squid/ssl_db \
 && apt-get clean

COPY entrypoint.sh /sbin/entrypoint.sh
COPY process_fifo.sh /sbin/process_fifo.sh
COPY null-auth.sh /sbin/null-auth.sh
RUN chmod 755 /sbin/entrypoint.sh \
 && chmod 755 /sbin/process_fifo.sh \
 && chmod 755 /sbin/null-auth.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
