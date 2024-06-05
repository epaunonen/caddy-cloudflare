FROM caddy:2.8.4-builder@sha256:2f44de947418f8155bcf3c84397083bd0deb61eb19efa39094184fa7c53b68e4 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:9a8e0e6f0f0af954626903b1ae5aac3536f45222131c01e1f2433e8b1ecb3937

COPY --from=builder /usr/bin/caddy /usr/bin/caddy