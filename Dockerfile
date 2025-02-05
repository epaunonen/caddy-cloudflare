FROM caddy:2.9.1-builder@sha256:1ddbf9265777f5a669f25979b2e02af57b565c272fae2399e650a910269a4cb9 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:a863d46cf06a9084f36cbffbe9f4ad046971dca32f79c68129aaf15ad356d6ce

COPY --from=builder /usr/bin/caddy /usr/bin/caddy