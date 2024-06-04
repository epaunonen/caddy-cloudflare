FROM caddy:2.8.4-builder@sha256:55508f3d559b518d77d8ad453453c02ef616d7697c2a1503feb091123e9751c8 AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.4@sha256:f5af55ebb433cb652b27f5b5fc5732853bcb00afeddedb9579be6a10c9a42b1c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy