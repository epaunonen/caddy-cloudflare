FROM caddy:2.8.4-builder@sha256:55508f3d559b518d77d8ad453453c02ef616d7697c2a1503feb091123e9751c8 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:51b5e778a16d77474c37f8d1d966e6863cdb1c7478396b04b806169fed0abac9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy