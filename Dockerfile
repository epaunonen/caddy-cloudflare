FROM caddy:2.8.4-builder@sha256:db5fb4f8130084edb46aa89bef084a184c832a42e9f537ec6326ef12d2945bcc AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:298ff253aa34db465f80edf05a471d86141b1403285bc946b7ee7ca2466424c4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy