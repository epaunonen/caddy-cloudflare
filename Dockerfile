FROM caddy:2.9.1-builder@sha256:3c1a90ada80f1b9239c2248a3b3f846501849fc8d934e288442ae4456c82a1e1 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:262e1d7bb9d6fb55a7310a9365213a73365dcdea90380eb601d33d8b3964fcea

COPY --from=builder /usr/bin/caddy /usr/bin/caddy