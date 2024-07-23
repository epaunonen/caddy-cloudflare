FROM caddy:2.8.4-builder@sha256:d3f3b4e66402ae739f1005fa41f8ea024c3f5fc3a0667ee6c1b37f402ce4be28 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:05ffb4db663de72e028e2ba8298c2e8eb6f0f8b240012cd6472903ab35639f98

COPY --from=builder /usr/bin/caddy /usr/bin/caddy