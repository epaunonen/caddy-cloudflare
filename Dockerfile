FROM caddy:2.9.1-builder@sha256:1bcf54f62ee9e1aadda849ca579900112668d56fd4aae5f3a53f3e2bbf926951 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:cd261fc62394f1ff0b44f16eb1d202b4e71d5365c9ec866a4f1a9c5a52da9352

COPY --from=builder /usr/bin/caddy /usr/bin/caddy