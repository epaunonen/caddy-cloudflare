FROM caddy:2.8.4-builder@sha256:40330ad5468664d2b6cd50a5831e119b26fa61c3bff844680357ce943ec3db4e AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:4718355ff1e2592290e49950f01fb1d4b75adb920a7695aedd94b6a4590a684b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy