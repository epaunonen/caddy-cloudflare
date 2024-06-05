FROM caddy:2.8.4-builder@sha256:583e6f8a43c2628a2ca6fbcd1f25a325c8bc80515f2dfc2101fd448c055b8353 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:7172411a7e8414602464972e998d0c49c24ca7a78c7bebd918146baf27e7cd74

COPY --from=builder /usr/bin/caddy /usr/bin/caddy