FROM caddy:2.8.4-builder@sha256:bbc5f9130a3ec4713c8f5dc73d2a0f8eb7e452e67ac29e8b0df2f0959dce69d5 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:51b5e778a16d77474c37f8d1d966e6863cdb1c7478396b04b806169fed0abac9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy