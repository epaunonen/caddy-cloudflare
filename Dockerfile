FROM caddy:2.7.6-builder@sha256:75f5dafdf92bbf2c4217c169e4d2349c407df5a52df8cadcedd6e722d1bbe36e AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:9fc94ed79892ca33b50bf9e548d6d639e6c8957b9e7b3965086dd754836903b6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy