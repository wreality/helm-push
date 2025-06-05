FROM alpine:3

ENV XDG_DATA_HOME=/opt/xdg
ENV XDG_CACHE_HOME=/opt/xdg-cache

RUN apk add curl tar bash --no-cache
RUN set -ex \
    && curl -sSL https://get.helm.sh/helm-v3.18.2-linux-amd64.tar.gz | tar xz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
