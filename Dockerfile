FROM caddy:2.8.0-builder@sha256:93a0320af6e247362974f8606f1659b977b8c4421282682844a197b26b4be924 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.0@sha256:ccdad842a0f34a8db14fa0671113f9567d65ba3798220539467d235131a3ed63

COPY --from=builder /usr/bin/caddy /usr/bin/caddy