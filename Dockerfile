FROM caddy:2.7.6-builder@sha256:dd49bcbfc0844da5e0b21f03cb8ca0730827fd755ea56c1a2b0fc84d043c982f AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.7.6@sha256:f60c1f5750f5872730db4bb48a6f1667f6597b9f6714c604945949ef78bc15c9

COPY --from=builder /usr/bin/caddy /usr/bin/caddy