FROM caddy:2.7.6-builder@sha256:b89293fc30a97aa356cb012cb0e15406d82a2f5921861bad5a9d1bd638b3e03a AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:d8d3637a26f50bf0bd27a6151d2bd4f7a9f0455936fe7ca2498abbc2e26c841e

COPY --from=builder /usr/bin/caddy /usr/bin/caddy