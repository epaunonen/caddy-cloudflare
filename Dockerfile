FROM caddy:2.7.6-builder@sha256:4525c85dd82a7b2f91959adf52617e51e9d0b1181a29f1e4b058ad695262ad3f AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:2f148ddb6662b4245ef4ced637e928eaf67a8a1941572d69627652253e779366

COPY --from=builder /usr/bin/caddy /usr/bin/caddy