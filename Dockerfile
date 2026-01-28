FROM caddy:2.10.2-builder@sha256:1582d70aec6c23f8f436dc4a68d23094c5709f9dce94a21da47d59fc44bbc7dd AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2@sha256:70e816c44fb79071fc4cd939ffda76e3b629642309efe31a4fb0ed45873be464

COPY --from=builder /usr/bin/caddy /usr/bin/caddy