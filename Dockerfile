FROM caddy:2.7.5-builder@sha256:5b9c67db8969d2d07fbbea52156ed4a9d59c6b20452e5f230c230a686b60c426 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.5@sha256:56f2c0b0c8b290f8f5b1b514a42c945aa574240721ca5abc3d3aced68adb3e75

COPY --from=builder /usr/bin/caddy /usr/bin/caddy