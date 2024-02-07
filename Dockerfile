FROM caddy:2.7.6-builder@sha256:77da1a24d1e545997915238c0d1c6b314b61bd0bf3da01df7938a174cb19eab3 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:245e14283de7392fd14ef9e425580fe689cc0f8eedf28376016dab4109bc76b2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy