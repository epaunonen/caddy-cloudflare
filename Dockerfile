FROM caddy:2.8.4-builder@sha256:e432268c10c421a5e344489d54223d816e81e2da42a3677c8e23ec4d03d0231b AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:1841e7c656154710f2fec273e12d4e517eeea5bd7a6c75e01dd26b88aaba9646

COPY --from=builder /usr/bin/caddy /usr/bin/caddy