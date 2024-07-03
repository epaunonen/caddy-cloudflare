FROM caddy:2.8.4-builder@sha256:83a396e467e5ec4515e624effce77c059265ff03a36d2ba4cc3de39e8063310b AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:2c7c4a3b9534b34d598a02e7d2be61d3b3355fb77245aea43c27c6d93e09d55f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy