FROM caddy:2.7.6-builder@sha256:47668b21f775f3de760c27e8afefb01c554de09a17a1c9a749da45170bbd4329 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:b392690ebadd518b3f7289ff5175badd347b58f404a5c7e69fafc63c20a146e8

COPY --from=builder /usr/bin/caddy /usr/bin/caddy