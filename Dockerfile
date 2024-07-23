FROM caddy:2.8.4-builder@sha256:db5fb4f8130084edb46aa89bef084a184c832a42e9f537ec6326ef12d2945bcc AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:c1decd182b7e456929f0c6cff6b70d14b316cd195b7adebe3d9b5c100f1c2b32

COPY --from=builder /usr/bin/caddy /usr/bin/caddy