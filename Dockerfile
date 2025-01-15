FROM caddy:2.9.1-builder@sha256:239705a85d233905863a8e8a42035e5501e17dbc1264d70701d9101f8b8f3764 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:a863d46cf06a9084f36cbffbe9f4ad046971dca32f79c68129aaf15ad356d6ce

COPY --from=builder /usr/bin/caddy /usr/bin/caddy