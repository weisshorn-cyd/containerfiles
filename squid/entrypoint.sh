#!/bin/bash
set -e

# Initialize SSL certificate DB if not present
SQUID_DIR="/var/lib/squid"
SSL_DB_DIR="/var/lib/squid/ssl_db"

if [ ! -d "$SQUID_DIR" ]; then
  echo "Creating ssl_db directory..."
  mkdir -p "$SQUID_DIR"
  chown -R proxy:proxy "$SQUID_DIR"
  chmod -R 700 "$SQUID_DIR"

  echo "Initializing ssl_db at $SSL_DB_DIR..."
  su -s /bin/sh proxy -c "/usr/lib/squid/security_file_certgen -c -s $SSL_DB_DIR -M 4MB"
fi

rm -fr /var/log/squid/*
mkfifo /var/log/squid/access.log
mkfifo /var/log/squid/cache.log
chown -R proxy:proxy /var/log/squid

/sbin/process_fifo.sh /var/log/squid/access.log &
/sbin/process_fifo.sh /var/log/squid/cache.log &

echo "Starting squid..."
exec $(which squid) -f /etc/squid/squid.conf -NYCd 1
