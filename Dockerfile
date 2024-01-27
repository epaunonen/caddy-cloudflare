FROM caddy:2.7.6-builder@sha256:eed1ac18cbc90c15f720cfc2c4785c72ecadc7a1686a32968df5cba64436a481 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:245e14283de7392fd14ef9e425580fe689cc0f8eedf28376016dab4109bc76b2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy