# Weisshorn CYD Container Files
This repository is where we store our public custom container images.

## Nextcloud
The nextcloud image is an adaptation of the [official Docker image for Nextcloud](https://github.com/nextcloud/docker) tailored with an additional layer consisting in the install of the `sociallogin` module.

## Squid
Squid docker image lightly modified to enable later on mtls auth via relay and also redirect logs to console instead of logs file only. Idea taken from [squid mtls relay repo](https://github.com/affordablemobiles/squid-mtls-relay).

## Squid-Relay
Go program reading certificates and transmitting authentication to squid. Example also taken from [squid mtls relay repo](https://github.com/affordablemobiles/squid-mtls-relay).
