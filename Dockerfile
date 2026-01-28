FROM caddy:2.10.2-builder@sha256:bf8f3adb8465b1ac861913f5bb6b374cae3e2fef046c923b986f5b95bf990513 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2@sha256:917d49b22144f0453f6d784771196e9a3f96ccae8e93d41bee340f78a924e38a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy