FROM caddy:2.9.1-builder@sha256:2a8fa145864fc11ba1876dd7f03010ee2fb6d52f9a5eaafb1eb8eec53b2b44b0 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:a863d46cf06a9084f36cbffbe9f4ad046971dca32f79c68129aaf15ad356d6ce

COPY --from=builder /usr/bin/caddy /usr/bin/caddy