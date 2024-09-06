FROM caddy:2.8.4-builder@sha256:a68f335e9477f7bd7d233ebcbc615ba94e69f1e384cb18a7480dd01662c54041 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:1841e7c656154710f2fec273e12d4e517eeea5bd7a6c75e01dd26b88aaba9646

COPY --from=builder /usr/bin/caddy /usr/bin/caddy