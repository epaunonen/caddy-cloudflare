FROM caddy:2.9.1-builder@sha256:c83833bde861051d91fed3a194a187e39d9eee02c49acee864c22a64aab87e40 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:a863d46cf06a9084f36cbffbe9f4ad046971dca32f79c68129aaf15ad356d6ce

COPY --from=builder /usr/bin/caddy /usr/bin/caddy