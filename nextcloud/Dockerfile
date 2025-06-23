FROM nextcloud:30.0.11
RUN echo "Installing sociallogin into /usr/src/nextcloud/apps/sociallogin"; \
    curl -fsSL -o /tmp/sociallogin.tar.gz "https://github.com/zorn-v/nextcloud-social-login/archive/refs/tags/v6.0.2.tar.gz"; \
    mkdir -p /usr/src/nextcloud/apps/sociallogin; \
    tar -xzf /tmp/sociallogin.tar.gz -C /usr/src/nextcloud/apps/sociallogin --strip-components=1; \
    rm /tmp/sociallogin.tar.gz; \
    chown -R www-data:www-data /usr/src/nextcloud/apps/sociallogin; \
