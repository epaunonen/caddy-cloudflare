FROM caddy:2.8.4-builder@sha256:1e57c607ff8c377909a1200bf27965a72d745694339d240dc03cb60704a7ca04 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:83d99edad2f0ac5e52068e065e42bd40c4ff7465a8f582482566c9d48350663a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy