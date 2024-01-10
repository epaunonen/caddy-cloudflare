FROM caddy:2.7.6-builder@sha256:e4e6def23b2b2ddd4fc962e9e8871d2e1049909f09428e7d3455f3e9fe937126 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:2f148ddb6662b4245ef4ced637e928eaf67a8a1941572d69627652253e779366

COPY --from=builder /usr/bin/caddy /usr/bin/caddy