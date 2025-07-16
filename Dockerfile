FROM caddy:2.10.0-builder@sha256:bcb684def90ebfaee228c239584efa7f4404f5af8dadefadd0bfc15d296cec7c AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.0@sha256:c10cf853496a180595e521a7e5081e0ba0a85e4bd54321a751e3dc91c7b3dac9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy