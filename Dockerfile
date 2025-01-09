FROM caddy:2.9.1-builder@sha256:31a314fa8d84c20776377c0e032e6352ba6ab8a6c016019a7b63c86065d4b7fb AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.9.1@sha256:7ca774efdabba6b4856b8e8cacded3aad03e064441045437b6802ba12bc3190d

COPY --from=builder /usr/bin/caddy /usr/bin/caddy