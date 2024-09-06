FROM caddy:2.8.4-builder@sha256:2a17a162d21c515469e1e64b164d1aededb43c71207ab3b422515bcd74be7784 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:1841e7c656154710f2fec273e12d4e517eeea5bd7a6c75e01dd26b88aaba9646

COPY --from=builder /usr/bin/caddy /usr/bin/caddy