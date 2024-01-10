FROM caddy:2.7.6-builder@sha256:d4661218831916c66ab91f2af2e5f5aeb76b9c1206dffbf09fc34b0b124a6988 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:2f148ddb6662b4245ef4ced637e928eaf67a8a1941572d69627652253e779366

COPY --from=builder /usr/bin/caddy /usr/bin/caddy