FROM caddy:2.8.4-builder@sha256:b37224d6be513d3d083bc7e95c6d97dd6bed82966972950ae9d1d8139ac60f8b AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:2b390571e3b33257843ccd39cc6e5644fca60cd1a17116a3b94d1ba89e88fda6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy