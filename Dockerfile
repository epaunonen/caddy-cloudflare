FROM caddy:2.8.4-builder@sha256:db5fb4f8130084edb46aa89bef084a184c832a42e9f537ec6326ef12d2945bcc AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:457057d77eeb3d6144ce5337a74213f83974f9cfc242b351b6c467867fbe199e

COPY --from=builder /usr/bin/caddy /usr/bin/caddy