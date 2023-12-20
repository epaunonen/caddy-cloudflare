FROM caddy:2.7.6-builder@sha256:aabf71f1af81f2de3ccf8a1b6bd22ba245265a25b4bd759ee93531ebb141b34f AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:2f148ddb6662b4245ef4ced637e928eaf67a8a1941572d69627652253e779366

COPY --from=builder /usr/bin/caddy /usr/bin/caddy