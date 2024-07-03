FROM caddy:2.8.4-builder@sha256:051b41a32814982e11b5909693cbf222ec457d2992c4cdd46e016dd8189d49bc AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:2c7c4a3b9534b34d598a02e7d2be61d3b3355fb77245aea43c27c6d93e09d55f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy