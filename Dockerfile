FROM caddy:2.8.4-builder@sha256:e7f6eabf609716e91d0058247dffa119f11abe8ab1adc61b88ce4b86cdcda6ae AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:83d99edad2f0ac5e52068e065e42bd40c4ff7465a8f582482566c9d48350663a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy