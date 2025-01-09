FROM caddy:2.9.1-builder@sha256:ee72f2ea53dcb2f1bec36de25747b230a9d3a238856238e7f54e7e2a56045335 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:2c136eb7e4daa97deed8738aab21994ea88dc0ced06aa44e30a949ba3d60e213

COPY --from=builder /usr/bin/caddy /usr/bin/caddy