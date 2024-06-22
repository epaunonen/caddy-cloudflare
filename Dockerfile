FROM caddy:2.8.4-builder@sha256:e7f6eabf609716e91d0058247dffa119f11abe8ab1adc61b88ce4b86cdcda6ae AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:f0e166675bfcce01ff4fa0e05311577b79fa590cc804907deeff68ad164a0a29

COPY --from=builder /usr/bin/caddy /usr/bin/caddy